import argparse
import os

import torch
from datasets import load_dataset
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training
from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig
from trl import SFTTrainer
from trl.trainer.sft_config import SFTConfig


def parse_args():
    parser = argparse.ArgumentParser(description="QLoRA SFT for Spider using prompt+completion dataset format.")
    parser.add_argument(
        "--model_name",
        type=str,
        default="meta-llama/Meta-Llama-3.1-8B-Instruct",
        help="Base model name or path (keep consistent between train and inference).",
    )
    parser.add_argument(
        "--train_path",
        type=str,
        default="~/transformer/SFT/data/spider_train_pc.jsonl",
        help="Train jsonl. Each row must contain `prompt` and `completion` columns.",
    )
    parser.add_argument(
        "--dev_path",
        type=str,
        default="~/transformer/SFT/data/spider_dev_pc.jsonl",
        help="Dev jsonl. Each row must contain `prompt` and `completion` columns.",
    )
    parser.add_argument(
        "--output_dir",
        type=str,
        default="~/transformer/SFT/models/qlora_spider_pc",
        help="Output directory.",
    )

    # Training hyperparams
    parser.add_argument("--max_seq_len", type=int, default=2048)
    parser.add_argument("--epochs", type=int, default=2)
    parser.add_argument("--lr", type=float, default=5e-5)  # 更保守一些
    parser.add_argument("--per_device_batch_size", type=int, default=2)
    parser.add_argument("--grad_accum", type=int, default=8)
    parser.add_argument("--save_steps", type=int, default=100)
    parser.add_argument("--logging_steps", type=int, default=20)
    parser.add_argument("--eval_steps", type=int, default=100)
    parser.add_argument("--seed", type=int, default=42)

    # Optional sanity checks
    parser.add_argument("--debug_one", action="store_true", help="Print rendered text of one sample.")
    return parser.parse_args()


def _resolve_path(p: str) -> str:
    p = os.path.expanduser(p)
    if not os.path.isabs(p):
        script_dir = os.path.dirname(os.path.abspath(__file__))
        p = os.path.join(script_dir, p)
    return os.path.abspath(p)


def _validate_pc_example(ex: dict, idx: int, split: str) -> None:
    """
    Validate one prompt+completion example.
    Required:
      - prompt: list of dict(role, content), should include system/user
      - completion: list of dict(role='assistant', content non-empty)
    """
    if "prompt" not in ex or "completion" not in ex:
        raise ValueError(f"[{split}] idx={idx}: missing `prompt` or `completion` keys. keys={list(ex.keys())}")

    prompt = ex["prompt"]
    completion = ex["completion"]

    if not isinstance(prompt, list) or not all(isinstance(m, dict) for m in prompt):
        raise ValueError(f"[{split}] idx={idx}: `prompt` must be list[dict]. type={type(prompt)}")

    if not isinstance(completion, list) or not all(isinstance(m, dict) for m in completion):
        raise ValueError(f"[{split}] idx={idx}: `completion` must be list[dict]. type={type(completion)}")

    # prompt should have at least one user
    if not any(m.get("role") == "user" and str(m.get("content", "")).strip() for m in prompt):
        raise ValueError(f"[{split}] idx={idx}: `prompt` has no non-empty user message.")

    # completion must contain assistant with non-empty content
    assistants = [m for m in completion if m.get("role") == "assistant"]
    if not assistants:
        raise ValueError(f"[{split}] idx={idx}: `completion` has no assistant role.")
    if any(str(m.get("content", "")).strip() == "" for m in assistants):
        raise ValueError(f"[{split}] idx={idx}: assistant content in `completion` is empty.")


def validate_dataset(dataset, split: str, n_check: int = 200) -> None:
    """
    Validate first n_check samples to fail fast on schema issues.
    """
    n = min(len(dataset), n_check)
    for i in range(n):
        _validate_pc_example(dataset[i], i, split)
    print(f"[{split}] validated first {n} examples: OK")


def main():
    args = parse_args()

    bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
    compute_dtype = torch.bfloat16 if bf16 else torch.float16

    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_use_double_quant=True,
        bnb_4bit_compute_dtype=compute_dtype,
    )

    tokenizer = AutoTokenizer.from_pretrained(args.model_name, use_fast=True)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    tokenizer.padding_side = "right"

    # 注意：不要 patch chat_template；我们不再依赖 generation/mask

    model = AutoModelForCausalLM.from_pretrained(
        args.model_name,
        quantization_config=bnb_config,
        device_map="auto",
        dtype=compute_dtype,  # 你的环境提示用 dtype
    )
    model.config.use_cache = False
    model.gradient_checkpointing_enable()

    model = prepare_model_for_kbit_training(model)

    lora_config = LoraConfig(
        r=16,
        lora_alpha=32,
        lora_dropout=0.1,
        bias="none",
        task_type="CAUSAL_LM",
        target_modules=[
            "q_proj", "k_proj", "v_proj", "o_proj",
            "gate_proj", "up_proj", "down_proj",
        ],
    )
    model = get_peft_model(model, lora_config)

    train_path = _resolve_path(args.train_path)
    dev_path = _resolve_path(args.dev_path)

    dataset = load_dataset("json", data_files=train_path, split="train")
    eval_dataset = load_dataset("json", data_files=dev_path, split="train")

    # Fail-fast validation
    validate_dataset(dataset, "train")
    validate_dataset(eval_dataset, "dev")

    if args.debug_one:
        ex = dataset[0]
        print("=== dataset[0] prompt ===")
        for m in ex["prompt"]:
            print(f"[{m.get('role')}] {str(m.get('content', ''))[:200].replace(chr(10), ' ')}")
        print("=== dataset[0] completion ===")
        for m in ex["completion"]:
            print(f"[{m.get('role')}] {str(m.get('content', ''))[:200].replace(chr(10), ' ')}")

        # Render full text (so you can see exact special tokens in your environment)
        rendered = tokenizer.apply_chat_template(
            ex["prompt"] + ex["completion"],
            tokenize=False,
            add_generation_prompt=False,
        )
        print("=== rendered (first 1200 chars) ===")
        print(rendered[:1200])
        print("=== end ===")

    sft_config = SFTConfig(
        output_dir=_resolve_path(args.output_dir),
        per_device_train_batch_size=args.per_device_batch_size,
        gradient_accumulation_steps=args.grad_accum,
        learning_rate=args.lr,
        num_train_epochs=args.epochs,
        save_steps=args.save_steps,
        logging_steps=args.logging_steps,
        save_total_limit=3,
        bf16=bf16,
        fp16=not bf16,
        optim="paged_adamw_8bit",
        report_to="none",
        seed=args.seed,
        max_length=args.max_seq_len,

        # 关键：prompt+completion 格式，不再使用 messages 列
        # 不要 dataset_text_field="messages"
        # 不要 assistant_only_loss=True（也不需要）

        eval_strategy="steps",
        eval_steps=args.eval_steps,
        load_best_model_at_end=True,
        metric_for_best_model="eval_loss",
        greater_is_better=False,

        # 建议：warmup 抑制前期梯度过猛（如果你版本支持）
        warmup_ratio=0.03,
    )

    trainer = SFTTrainer(
        model=model,
        args=sft_config,
        train_dataset=dataset,
        eval_dataset=eval_dataset,
        processing_class=tokenizer,
    )

    trainer.train()

    adapter_dir = os.path.join(_resolve_path(args.output_dir), "adapter")
    trainer.model.save_pretrained(adapter_dir)
    tokenizer.save_pretrained(adapter_dir)
    print("Saved adapter + tokenizer to:", adapter_dir)


if __name__ == "__main__":
    main()
