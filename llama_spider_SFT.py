import argparse
import os

import torch
from datasets import load_dataset
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training
from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig
from trl import SFTTrainer
from trl.trainer.sft_config import SFTConfig


def parse_args():
    parser = argparse.ArgumentParser(description="QLoRA SFT for Spider (SQL-only, chat messages).")
    parser.add_argument(
        "--model_name",
        type=str,
        default="meta-llama/Llama-3.1-8B-Instruct",
        help="Base model name or path.",
    )

    parser.add_argument(
        "--data_path",
        type=str,
        default="~/transformer/SFT/data/spider_train_sft.jsonl",
        help="Path to train spider_train_sft.jsonl.",
    )

    # >>> NEW: dev set for eval_loss dashboard <<<
    parser.add_argument(
        "--dev_path",
        type=str,
        default="~/transformer/SFT/data/spider_dev_sft.jsonl",
        help="Path to dev spider_dev_sft.jsonl (same format with `messages`).",
    )
    parser.add_argument(
        "--eval_steps",
        type=int,
        default=500,
        help="Run evaluation every N training steps.",
    )

    parser.add_argument(
        "--output_dir",
        type=str,
        default="~/transformer/SFT/models/qlora_spider",
        help="Output directory for checkpoints and adapter.",
    )
    parser.add_argument("--max_seq_len", type=int, default=2048)
    parser.add_argument("--epochs", type=int, default=2)
    parser.add_argument("--lr", type=float, default=1e-4)
    parser.add_argument("--per_device_batch_size", type=int, default=2)
    parser.add_argument("--grad_accum", type=int, default=8)
    parser.add_argument("--save_steps", type=int, default=100)
    parser.add_argument("--logging_steps", type=int, default=20)
    parser.add_argument("--seed", type=int, default=42)
    return parser.parse_args()


def ensure_generation_chat_template(tokenizer: AutoTokenizer) -> None:
    """
    TRL's assistant_only_loss=True requires the tokenizer chat template to emit
    assistant masks via `{% generation %}` blocks. Some tokenizers/templates
    don't include it, causing RuntimeError (no assistant tokens).
    """
    tpl = getattr(tokenizer, "chat_template", None)
    has_gen = tpl is not None and ("{% generation %}" in tpl)

    if not has_gen:
        tokenizer.chat_template = """{% for message in messages %}
{% if message['role'] == 'system' %}{{ message['content'] }}\n{% endif %}
{% if message['role'] == 'user' %}{{ message['content'] }}\n{% endif %}
{% if message['role'] == 'assistant' %}{% generation %}{{ message['content'] }}{% endgeneration %}\n{% endif %}
{% endfor %}"""


def _resolve_path(p: str) -> str:
    p = os.path.expanduser(p)
    if not os.path.isabs(p):
        script_dir = os.path.dirname(os.path.abspath(__file__))
        p = os.path.join(script_dir, p)
    return os.path.abspath(p)


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

    # IMPORTANT for assistant_only_loss=True
    ensure_generation_chat_template(tokenizer)

    model = AutoModelForCausalLM.from_pretrained(
        args.model_name,
        quantization_config=bnb_config,
        device_map="auto",
        dtype=compute_dtype,
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
            "q_proj",
            "k_proj",
            "v_proj",
            "o_proj",
            "gate_proj",
            "up_proj",
            "down_proj",
        ],
    )
    model = get_peft_model(model, lora_config)

    train_path = _resolve_path(args.data_path)
    dev_path = _resolve_path(args.dev_path)

    dataset = load_dataset("json", data_files=train_path, split="train")
    if "messages" not in dataset.column_names:
        raise ValueError(f"Train dataset must contain a `messages` column. Found columns: {dataset.column_names}")

    eval_dataset = load_dataset("json", data_files=dev_path, split="train")
    if "messages" not in eval_dataset.column_names:
        raise ValueError(f"Dev dataset must contain a `messages` column. Found columns: {eval_dataset.column_names}")

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

        # TRL 0.27.x: tell trainer which column contains chat messages
        dataset_text_field="messages",

        # response-only loss
        assistant_only_loss=True,

        # >>> NEW: eval_loss dashboard on full dev set <<<
        eval_strategy="steps",
        eval_steps=args.eval_steps,
        load_best_model_at_end=True,
        metric_for_best_model="eval_loss",
        greater_is_better=False,
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


if __name__ == "__main__":
    main()


# import argparse
# import os

# import torch
# from datasets import load_dataset
# from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training
# from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig
# from trl import SFTTrainer
# from trl.trainer.sft_config import SFTConfig


# def parse_args():
#     parser = argparse.ArgumentParser(description="QLoRA SFT for Spider (messages + assistant-only loss).")
#     parser.add_argument(
#         "--model_name",
#         type=str,
#         default="meta-llama/Llama-3.1-8B-Instruct",
#         help="Base model name or path.",
#     )
#     parser.add_argument(
#         "--data_path",
#         type=str,
#         default="~/transformer/SFT/data/spider_train_sft.jsonl",
#         help="Path to train spider_train_sft.jsonl (must contain a `messages` column).",
#     )
#     parser.add_argument(
#         "--dev_path",
#         type=str,
#         default="~/transformer/SFT/data/spider_dev_sft.jsonl",
#         help="Path to dev spider_dev_sft.jsonl (must contain a `messages` column).",
#     )
#     parser.add_argument("--output_dir", type=str, default="~/transformer/SFT/models/qlora_spider")
#     parser.add_argument("--max_seq_len", type=int, default=2048)
#     parser.add_argument("--epochs", type=int, default=3)
#     parser.add_argument("--lr", type=float, default=5e-5)
#     parser.add_argument("--per_device_batch_size", type=int, default=2)
#     parser.add_argument("--grad_accum", type=int, default=8)
#     parser.add_argument("--save_steps", type=int, default=100)
#     parser.add_argument("--logging_steps", type=int, default=20)
#     parser.add_argument("--seed", type=int, default=42)

#     # eval
#     parser.add_argument("--eval_steps", type=int, default=100)

#     # debugging helpers
#     parser.add_argument("--debug_template", action="store_true", help="Print a toy rendered prompt (system/user/assistant).")
#     parser.add_argument("--debug_dataset_sample", action="store_true", help="Render and print 1 dataset sample.")
#     parser.add_argument("--debug_chat_template", action="store_true", help="Print chat_template before and after patch.")
#     return parser.parse_args()


# def _resolve_path(p: str) -> str:
#     p = os.path.expanduser(p)
#     if not os.path.isabs(p):
#         script_dir = os.path.dirname(os.path.abspath(__file__))
#         p = os.path.join(script_dir, p)
#     return os.path.abspath(p)


# def ensure_generation_chat_template(tokenizer: AutoTokenizer, debug_chat_template: bool = False) -> None:
#     """
#     Minimal & robust patch for Llama-3.x style chat_template to support TRL assistant_only_loss=True.

#     We DO NOT rewrite the template. We only insert:
#       - `{% generation %}` after the assistant header emission
#       - `{% endgeneration %}` after the assistant turn `<|eot_id|>` emission

#     This version is robust to:
#       - single quotes / double quotes
#       - presence/absence of \\n\\n in the same literal
#       - slight formatting differences
#     """
#     tpl = getattr(tokenizer, "chat_template", None)
#     if tpl is None:
#         raise ValueError("Tokenizer has no chat_template; cannot patch for assistant_only_loss.")
#     if debug_chat_template:
#         print("\n=== chat_template BEFORE patch (first 4000 chars) ===")
#         print(tpl[:4000])
#         print("=== END ===\n")
#     if "{% generation %}" in tpl:
#         return

#     # Preferred patch: inject generation tags in the generic message loop for role=='assistant'
#     generic_block = "{{- '<|start_header_id|>' + message['role'] + '<|end_header_id|>\\n\\n'+ message['content'] | trim + '<|eot_id|>' }}"
#     if generic_block in tpl:
#         patched_block = (
#             "{%- if message['role'] == 'assistant' %}\n"
#             "{{- '<|start_header_id|>assistant<|end_header_id|>\\n\\n' -}}\n"
#             "{% generation %}\n"
#             "{{- message['content'] | trim -}}\n"
#             "{% endgeneration %}\n"
#             "{{- '<|eot_id|>' -}}\n"
#             "{%- else %}\n"
#             + generic_block + "\n"
#             "{%- endif %}"
#         )
#         tpl3 = tpl.replace(generic_block, patched_block, 1)
#     else:
#         header_lit = "<|start_header_id|>assistant<|end_header_id|>"
#         eot_lit = "<|eot_id|>"

#         # Fallback: insert around the first assistant header literal.
#         pos = tpl.find(header_lit)
#         if pos == -1:
#             # Helpful debug: show whether system/user headers exist
#             has_sys = "<|start_header_id|>system<|end_header_id|>" in tpl
#             has_usr = "<|start_header_id|>user<|end_header_id|>" in tpl
#             raise ValueError(
#                 "Cannot find assistant header in chat_template. "
#                 f"(has_system={has_sys}, has_user={has_usr})\n"
#                 "This usually means your tokenizer template is not Llama-3.x style, "
#                 "or you're loading a different tokenizer/model id than expected."
#             )

#         after = pos + len(header_lit)
#         if tpl[after:after + 4] == "\\n\\n":
#             after += 4

#         tpl2 = tpl[:after] + "\n{% generation %}\n" + tpl[after:]

#         pos2 = tpl2.find(header_lit)
#         eot_pos2 = tpl2.find(eot_lit, pos2)
#         if eot_pos2 == -1:
#             raise ValueError("Cannot find <|eot_id|> after assistant header in chat_template; template may differ.")

#         insert_end = eot_pos2 + len(eot_lit)
#         tpl3 = tpl2[:insert_end] + "\n{% endgeneration %}\n" + tpl2[insert_end:]

#     tokenizer.chat_template = tpl3
#     if debug_chat_template:
#         print("\n=== chat_template AFTER patch (first 4000 chars) ===")
#         print(tokenizer.chat_template[:4000])
#         print("=== END ===\n")

#     # Hard sanity: keep the original boundary tokens intact
#     must_have = [
#         "<|start_header_id|>system<|end_header_id|>",
#         "<|start_header_id|>user<|end_header_id|>",
#         "<|start_header_id|>assistant<|end_header_id|>",
#         "<|eot_id|>",
#     ]
#     for s in must_have:
#         if s not in tokenizer.chat_template:
#             raise ValueError(f"Patched chat_template seems broken; missing: {s}")



# def sanity_check_template(tokenizer: AutoTokenizer) -> None:
#     """
#     Toy prompt matching your new data convention:
#       - system: rules
#       - user: schema/question + SQL:
#       - assistant: one SQL
#     """
#     msgs = [
#         {
#             "role": "system",
#             "content": (
#                 "You are a text-to-SQL system.\n"
#                 "Use ONLY tables/columns from the schema.\n"
#                 "Return exactly ONE SQLite SQL query and nothing else.\n"
#                 "Do NOT include explanations, comments, code fences, or the database id."
#             ),
#         },
#         {
#             "role": "user",
#             "content": (
#                 "Database id: toy_db\n"
#                 "Schema: A(x) ; B(y)\n"
#                 "Question: How many rows are in A?\n"
#                 "SQL:"
#             ),
#         },
#         {"role": "assistant", "content": "SELECT COUNT(*) FROM A;"},
#     ]

#     rendered = tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=False)
#     print("\n=== SANITY CHECK: toy rendered prompt (first 1200 chars) ===")
#     print(rendered[:1200])
#     print("=== END ===\n")


# def sanity_check_dataset_sample(tokenizer: AutoTokenizer, dataset) -> None:
#     """
#     Render 1 real sample from dataset to ensure:
#       - messages is a list of dicts with role/content
#       - order is system->user->assistant (or at least contains these)
#       - contents look as expected
#     """
#     ex = dataset[0]
#     msgs = ex["messages"]
#     rendered = tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=False)
#     print("\n=== SANITY CHECK: dataset[0] messages ===")
#     for m in msgs:
#         print(f"[{m.get('role')}] {m.get('content')[:120].replace(chr(10), ' ')}")
#     print("\n=== SANITY CHECK: rendered dataset[0] (first 1200 chars) ===")
#     print(rendered[:1200])
#     print("=== END ===\n")

# def assert_dataset_has_assistant(dataset, name="train", max_print=5):
#     bad = []
#     for i, ex in enumerate(dataset):
#         msgs = ex.get("messages", None)
#         if not isinstance(msgs, list):
#             bad.append((i, "messages_not_list"))
#             continue
#         assistants = [m for m in msgs if m.get("role") == "assistant"]
#         if len(assistants) == 0:
#             bad.append((i, "no_assistant"))
#             continue
#         # assistant content must be non-empty after strip
#         if any((m.get("content") is None) or (str(m.get("content")).strip() == "") for m in assistants):
#             bad.append((i, "empty_assistant_content"))
#             continue

#         # Optional: ensure system+user exists too
#         if not any(m.get("role") == "user" for m in msgs):
#             bad.append((i, "no_user"))

#     if bad:
#         print(f"[{name}] Found {len(bad)} bad examples. Showing first {max_print}:")
#         for x in bad[:max_print]:
#             print("  ", x)
#         raise ValueError(f"{name} dataset has invalid examples for assistant_only_loss=True")

# def assert_template_produces_assistant_mask(tokenizer):
#     msgs = [
#         {"role": "system", "content": "You are a text-to-SQL system. Output ONLY one SQLite SQL query."},
#         {"role": "user", "content": "Schema: A(x)\nQuestion: count rows\nSQL:"},
#         {"role": "assistant", "content": "SELECT COUNT(*) FROM A;"},
#     ]

#     # TRL 会依赖这个 mask
#     out = tokenizer.apply_chat_template(
#         msgs,
#         add_generation_prompt=False,
#         return_tensors="pt",
#         return_assistant_tokens_mask=True,
#     )
#     mask = out.get("assistant_tokens_mask", None)
#     if mask is None:
#         raise RuntimeError("Tokenizer did not return assistant_tokens_mask (template patch not working).")

#     s = int(mask.sum().item())
#     print("assistant_tokens_mask sum (toy):", s)
#     if s == 0:
#         raise RuntimeError(
#             "assistant_tokens_mask is all zeros on a toy example. "
#             "Your chat_template generation blocks are NOT wrapping assistant tokens."
#         )


# def find_first_bad_example(tokenizer, dataset, name="train", limit=None):
#     n = len(dataset) if limit is None else min(len(dataset), limit)

#     for i in range(n):
#         ex = dataset[i]
#         msgs = ex.get("messages", None)

#         # 1) messages 必须是 list[dict]
#         if not isinstance(msgs, list):
#             print(f"[{name}] bad idx={i}: messages is {type(msgs)} (expected list).")
#             print("messages value (truncated):", str(msgs)[:300])
#             return i

#         # 2) 必须有 assistant 且 content 非空
#         assistants = [m for m in msgs if isinstance(m, dict) and m.get("role") == "assistant"]
#         if len(assistants) == 0:
#             print(f"[{name}] bad idx={i}: no assistant role.")
#             print("roles:", [m.get("role") for m in msgs if isinstance(m, dict)])
#             return i
#         if any((m.get("content") is None) or (str(m.get("content")).strip() == "") for m in assistants):
#             print(f"[{name}] bad idx={i}: empty assistant content.")
#             print("assistant contents:", [m.get("content") for m in assistants])
#             return i

#         # 3) 最关键：assistant_tokens_mask 必须 > 0
#         try:
#             out = tokenizer.apply_chat_template(
#                 msgs,
#                 add_generation_prompt=False,
#                 return_tensors="pt",
#                 return_assistant_tokens_mask=True,
#             )
#         except Exception as e:
#             print(f"[{name}] bad idx={i}: apply_chat_template failed: {repr(e)}")
#             print("messages roles:", [m.get("role") for m in msgs if isinstance(m, dict)])
#             return i

#         mask = out.get("assistant_tokens_mask", None)
#         if mask is None or int(mask.sum().item()) == 0:
#             print(f"[{name}] bad idx={i}: assistant mask missing/zero.")
#             print("roles:", [m.get("role") for m in msgs if isinstance(m, dict)])
#             print("assistant content head:", assistants[0].get("content", "")[:200])
#             # 打印渲染出来的 prompt 前一段，帮助确认模板是否按预期工作
#             rendered = tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=False)
#             print("rendered head:", rendered[:800])
#             return i

#     print(f"[{name}] no bad example found in first {n} samples.")
#     return None


# def main():
#     args = parse_args()

#     bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
#     compute_dtype = torch.bfloat16 if bf16 else torch.float16

#     bnb_config = BitsAndBytesConfig(
#         load_in_4bit=True,
#         bnb_4bit_quant_type="nf4",
#         bnb_4bit_use_double_quant=True,
#         bnb_4bit_compute_dtype=compute_dtype,
#     )

#     tokenizer = AutoTokenizer.from_pretrained(args.model_name, use_fast=True)
#     if tokenizer.pad_token is None:
#         tokenizer.pad_token = tokenizer.eos_token
#     tokenizer.padding_side = "right"

#     ensure_generation_chat_template(tokenizer, debug_chat_template=args.debug_chat_template)
#     assert_template_produces_assistant_mask(tokenizer)

#     if args.debug_template:
#         sanity_check_template(tokenizer)

#     model = AutoModelForCausalLM.from_pretrained(
#         args.model_name,
#         quantization_config=bnb_config,
#         device_map="auto",
#         torch_dtype=compute_dtype,
#     )

#     model.config.use_cache = False
#     model.gradient_checkpointing_enable()
#     model = prepare_model_for_kbit_training(model)

#     lora_config = LoraConfig(
#         r=16,
#         lora_alpha=32,
#         lora_dropout=0.1,
#         bias="none",
#         task_type="CAUSAL_LM",
#         target_modules=[
#             "q_proj",
#             "k_proj",
#             "v_proj",
#             "o_proj",
#             "gate_proj",
#             "up_proj",
#             "down_proj",
#         ],
#     )
#     model = get_peft_model(model, lora_config)

#     train_path = _resolve_path(args.data_path)
#     dev_path = _resolve_path(args.dev_path)

#     dataset = load_dataset("json", data_files=train_path, split="train")
#     if "messages" not in dataset.column_names:
#         raise ValueError(f"Train dataset must contain `messages`. Found: {dataset.column_names}")

#     eval_dataset = load_dataset("json", data_files=dev_path, split="train")
#     if "messages" not in eval_dataset.column_names:
#         raise ValueError(f"Dev dataset must contain `messages`. Found: {eval_dataset.column_names}")

#     assert_dataset_has_assistant(dataset, "train")
#     assert_dataset_has_assistant(eval_dataset, "dev")

#     bad = find_first_bad_example(tokenizer, dataset, "train")
#     if bad is not None:
#         raise RuntimeError("Fix the dataset/template above before training.")

#     bad = find_first_bad_example(tokenizer, eval_dataset, "dev")
#     if bad is not None:
#         raise RuntimeError("Fix the dataset/template above before training.")


#     if args.debug_dataset_sample:
#         sanity_check_dataset_sample(tokenizer, dataset)

#     sft_config = SFTConfig(
#         output_dir=_resolve_path(args.output_dir),
#         per_device_train_batch_size=args.per_device_batch_size,
#         gradient_accumulation_steps=args.grad_accum,
#         learning_rate=args.lr,
#         num_train_epochs=args.epochs,
#         save_steps=args.save_steps,
#         logging_steps=args.logging_steps,
#         save_total_limit=20,
#         bf16=bf16,
#         fp16=not bf16,
#         optim="paged_adamw_8bit",
#         report_to="none",
#         seed=args.seed,
#         max_length=args.max_seq_len,
#         dataset_text_field="messages",
#         assistant_only_loss=True,
#         eval_strategy="steps",
#         eval_steps=args.eval_steps,
#         load_best_model_at_end=True,
#         metric_for_best_model="eval_loss",
#         greater_is_better=False,
#     )

#     trainer = SFTTrainer(
#         model=model,
#         args=sft_config,
#         train_dataset=dataset,
#         eval_dataset=eval_dataset,
#         processing_class=tokenizer,
#     )

#     trainer.train()

#     adapter_dir = os.path.join(_resolve_path(args.output_dir), "adapter")
#     trainer.model.save_pretrained(adapter_dir)
#     tokenizer.save_pretrained(adapter_dir)
#     print("Saved adapter + tokenizer to:", adapter_dir)


# if __name__ == "__main__":
#     main()
