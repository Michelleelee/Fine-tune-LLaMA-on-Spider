"""
GRPO training for text-to-SQL with Llama-3.1-8B-Instruct + QLoRA.
Starts from SFT checkpoint and optimizes for SQL execution accuracy.

Usage:
    python grpo_train.py \
        --sft_adapter ../models/qlora_spider_pc/adapter \
        --db_path ~/data/spider/database \
        --train_data ./data/spider_grpo_train \
        --eval_data ./data/spider_grpo_dev

    python grpo_train.py --smoke_test              # Quick 10-step pipeline test
    python grpo_train.py --num_epochs 1 --lr 1e-5  # Custom hyperparams
"""

import argparse
import os
import sys

import torch
from datasets import load_from_disk
from peft import PeftModel
from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig
from trl import GRPOConfig, GRPOTrainer

# Import reward function from same directory
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rewards
from rewards import sql_reward_func


def parse_args():
    parser = argparse.ArgumentParser(description="GRPO training for text-to-SQL")

    # Paths (must be configured for your machine)
    parser.add_argument("--base_model", type=str, default="meta-llama/Meta-Llama-3.1-8B-Instruct")
    parser.add_argument("--sft_adapter", type=str, default="../models/qlora_spider_pc/adapter",
                        help="Path to SFT LoRA adapter directory")
    parser.add_argument("--db_path", type=str, default="~/data/spider/database",
                        help="Path to Spider database directory (contains {db_id}/{db_id}.sqlite)")
    parser.add_argument("--train_data", type=str, default="./data/spider_grpo_train",
                        help="Path to GRPO training dataset (HuggingFace Dataset format)")
    parser.add_argument("--eval_data", type=str, default="./data/spider_grpo_dev",
                        help="Path to GRPO eval dataset (HuggingFace Dataset format)")
    parser.add_argument("--output_dir", type=str, default="./models/grpo_spider",
                        help="Output directory for checkpoints and final adapter")

    # GRPO hyperparams
    parser.add_argument("--num_generations", type=int, default=4,
                        help="Number of completions to generate per prompt (G)")
    parser.add_argument("--beta", type=float, default=0.04,
                        help="KL divergence penalty coefficient")
    parser.add_argument("--lr", type=float, default=5e-6)
    parser.add_argument("--num_epochs", type=int, default=2)
    parser.add_argument("--batch_size", type=int, default=4,
                        help="Per-device batch size (must be divisible by num_generations)")
    parser.add_argument("--grad_accum", type=int, default=4)
    parser.add_argument("--temperature", type=float, default=0.7)
    parser.add_argument("--max_completion_length", type=int, default=256)

    # Convenience
    parser.add_argument("--smoke_test", action="store_true",
                        help="Run 10 steps only to verify the pipeline works")
    parser.add_argument("--seed", type=int, default=42)
    return parser.parse_args()


def resolve_path(p: str) -> str:
    """Expand ~ and make path absolute."""
    return os.path.abspath(os.path.expanduser(p))


def main():
    args = parse_args()

    # Resolve all paths
    sft_adapter = resolve_path(args.sft_adapter)
    db_path = resolve_path(args.db_path)
    train_data = resolve_path(args.train_data)
    eval_data = resolve_path(args.eval_data)
    output_dir = resolve_path(args.output_dir)

    # Set DB path for reward function
    rewards.DB_BASE_PATH = db_path
    print(f"Database path: {db_path}")

    bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
    compute_dtype = torch.bfloat16 if bf16 else torch.float16

    # ==================== Model ====================
    print("Loading base model with 4-bit quantization...")
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_use_double_quant=True,
        bnb_4bit_compute_dtype=compute_dtype,
    )

    base_model = AutoModelForCausalLM.from_pretrained(
        args.base_model,
        quantization_config=bnb_config,
        device_map="auto",
        dtype=compute_dtype,
    )
    base_model.config.use_cache = False

    print(f"Loading SFT adapter from {sft_adapter}...")
    model = PeftModel.from_pretrained(
        base_model,
        sft_adapter,
        is_trainable=True,
    )

    # ==================== Tokenizer ====================
    tokenizer = AutoTokenizer.from_pretrained(sft_adapter, use_fast=True)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    # GRPOTrainer requires left padding for generation
    tokenizer.padding_side = "left"

    # ==================== Data ====================
    print("Loading datasets...")
    train_dataset = load_from_disk(train_data)
    eval_dataset = load_from_disk(eval_data)

    if args.smoke_test:
        train_dataset = train_dataset.select(range(min(40, len(train_dataset))))
        eval_dataset = eval_dataset.select(range(min(20, len(eval_dataset))))

    print(f"Train: {len(train_dataset)} samples, Eval: {len(eval_dataset)} samples")

    # ==================== Config ====================
    num_epochs = 0.001 if args.smoke_test else args.num_epochs
    max_steps = 10 if args.smoke_test else -1

    grpo_config = GRPOConfig(
        output_dir=output_dir,

        # GRPO core
        num_generations=args.num_generations,
        beta=args.beta,
        epsilon=0.2,
        loss_type="grpo",
        scale_rewards=True,

        # Generation
        temperature=args.temperature,
        top_p=0.95,
        top_k=50,
        max_completion_length=args.max_completion_length,

        # Batch
        per_device_train_batch_size=args.batch_size,
        gradient_accumulation_steps=args.grad_accum,

        # Optimization
        learning_rate=args.lr,
        warmup_ratio=0.05,
        num_train_epochs=num_epochs,
        max_steps=max_steps,
        optim="paged_adamw_8bit",

        # Memory
        gradient_checkpointing=True,
        bf16=bf16,
        fp16=not bf16,
        use_vllm=False,

        # Monitoring
        logging_steps=5 if args.smoke_test else 10,
        log_completions=True,
        save_steps=100,
        save_total_limit=3,
        eval_strategy="steps",
        eval_steps=50 if args.smoke_test else 100,
        per_device_eval_batch_size=args.batch_size,

        # Misc
        report_to="none",
        seed=args.seed,
        remove_unused_columns=False,
        num_iterations=1,
    )

    # ==================== Trainer ====================
    # Patch: TRL GRPOTrainer.__init__ tries model.warnings_issued["estimate_tokens"] = True,
    # but PeftModelForCausalLM's __getattr__ chain doesn't expose PreTrainedModel.warnings_issued.
    # Setting it explicitly on the PEFT wrapper fixes the AttributeError.
    if not hasattr(model, "warnings_issued"):
        model.warnings_issued = {}

    print("Initializing GRPOTrainer...")
    trainer = GRPOTrainer(
        model=model,
        reward_funcs=sql_reward_func,
        args=grpo_config,
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        processing_class=tokenizer,
        peft_config=None,  # Using pre-loaded PeftModel, no new LoRA
    )

    # ==================== Train ====================
    print("Starting GRPO training...")
    trainer.train()

    # ==================== Save ====================
    final_dir = os.path.join(output_dir, "final_adapter")
    print(f"Saving final adapter to {final_dir}...")
    trainer.save_model(final_dir)
    tokenizer.save_pretrained(final_dir)
    print("Done!")


if __name__ == "__main__":
    main()
