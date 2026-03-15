"""
Evaluate GRPO-trained model on Spider dev/test set.
Reuses the same inference pattern as SFT's llama_spider_pred_lora_pc.py.

Usage:
    python evaluate_grpo.py \
        --spider_data ~/data/spider \
        --spider_eval ~/transformer/spider \
        --adapter_dir ./models/grpo_spider/final_adapter

    python evaluate_grpo.py --split test   # Evaluate on test set
"""

import argparse
import json
import os

import torch
from pathlib import Path
from tqdm import tqdm
from peft import PeftModel
from transformers import AutoTokenizer, AutoModelForCausalLM


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--base_model", type=str, default="meta-llama/Meta-Llama-3.1-8B-Instruct")
    parser.add_argument("--adapter_dir", type=str, default="./models/grpo_spider/final_adapter",
                        help="Path to GRPO LoRA adapter directory")
    parser.add_argument("--spider_data", type=str, default="~/data/spider",
                        help="Path to Spider data directory (contains dev.json, tables.json, database/, etc.)")
    parser.add_argument("--spider_eval", type=str, default="~/transformer/spider",
                        help="Path to Spider evaluation scripts directory (contains evaluation.py)")
    parser.add_argument("--output_dir", type=str, default="./outputs",
                        help="Output directory for predictions")
    parser.add_argument("--split", type=str, default="dev", choices=["dev", "test"])
    parser.add_argument("--max_new_tokens", type=int, default=256)
    parser.add_argument("--merge_lora", action="store_true",
                        help="Merge LoRA for faster inference (uses more VRAM during merge)")
    return parser.parse_args()


def resolve_path(p: str) -> Path:
    return Path(os.path.expanduser(p)).resolve()


def schema_to_text(db_id, tables):
    t = tables[db_id]
    table_names = t["table_names_original"]
    column_names = t["column_names_original"]

    cols_by_table = {i: [] for i in range(len(table_names))}
    for tbl_idx, col in column_names:
        if tbl_idx == -1:
            continue
        cols_by_table[tbl_idx].append(col)

    parts = []
    for i, tbl in enumerate(table_names):
        cols = ", ".join(cols_by_table[i])
        parts.append(f"{tbl}({cols})")
    return " ; ".join(parts)


def build_messages(question, db_id, tables):
    schema = schema_to_text(db_id, tables)
    return [
        {
            "role": "system",
            "content": (
                "You are a text-to-SQL system.\n"
                "Use ONLY tables/columns from the schema.\n"
                "Return exactly ONE SQLite SQL query and nothing else.\n"
                "Do NOT include explanations, comments, code fences, or the database id."
            ),
        },
        {
            "role": "user",
            "content": (
                f"Database id: {db_id}\n"
                f"Schema: {schema}\n"
                f"Question: {question}\n"
                "SQL:"
            ),
        },
    ]


def generate_sql(model, tokenizer, question, db_id, tables, max_new_tokens):
    messages = build_messages(question, db_id, tables)

    inputs = tokenizer.apply_chat_template(
        messages,
        add_generation_prompt=True,
        return_tensors="pt",
    )

    inputs = {k: v.to(model.device) for k, v in inputs.items()}

    with torch.inference_mode():
        output_ids = model.generate(
            input_ids=inputs["input_ids"],
            attention_mask=inputs.get("attention_mask"),
            max_new_tokens=max_new_tokens,
            do_sample=False,
            eos_token_id=tokenizer.eos_token_id,
            pad_token_id=tokenizer.eos_token_id,
            use_cache=True,
        )

    gen_ids = output_ids[0, inputs["input_ids"].shape[-1]:]
    text = tokenizer.decode(gen_ids, skip_special_tokens=True).strip()

    # Post-process
    if ";" in text:
        text = text.split(";", 1)[0].strip() + ";"
    text = text.split(" --", 1)[0].strip()
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    return lines[0] if lines else ""


def main():
    args = parse_args()

    spider_data = resolve_path(args.spider_data)
    spider_eval = resolve_path(args.spider_eval)
    adapter_dir = resolve_path(args.adapter_dir)
    output_dir = resolve_path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Load data
    if args.split == "dev":
        data_json = spider_data / "dev.json"
        tables_json = spider_data / "tables.json"
        db_dir = spider_data / "database"
        gold_sql_file = spider_data / "dev_gold.sql"
    else:
        data_json = spider_data / "test.json"
        tables_json = spider_data / "test_tables.json"
        db_dir = spider_data / "test_database"
        gold_sql_file = spider_data / "test_gold.sql"

    data = json.loads(data_json.read_text())
    tables = {t["db_id"]: t for t in json.loads(tables_json.read_text())}

    # Load model
    print(f"Loading base model: {args.base_model}")
    dtype = torch.bfloat16 if (torch.cuda.is_available() and torch.cuda.is_bf16_supported()) else torch.float16

    base = AutoModelForCausalLM.from_pretrained(
        args.base_model,
        device_map="auto",
        dtype=dtype,
    )

    print(f"Loading GRPO adapter: {adapter_dir}")
    model = PeftModel.from_pretrained(base, str(adapter_dir))
    model.config.use_cache = True
    model.eval()

    if args.merge_lora:
        model = model.merge_and_unload()
        model.eval()

    tokenizer = AutoTokenizer.from_pretrained(str(adapter_dir), use_fast=True)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    print(f"Generating predictions on {args.split} set ({len(data)} samples)...")

    out_file = output_dir / f"pred_{args.split}_grpo.sql"

    count = 0
    with out_file.open("w", encoding="utf-8") as f:
        for ex in tqdm(data):
            sql = generate_sql(model, tokenizer, ex["question"], ex["db_id"], tables, args.max_new_tokens)
            f.write(sql + "\n")
            count += 1
            if count % 100 == 0:
                f.flush()
                os.fsync(f.fileno())

    print(f"Predictions saved to: {out_file} ({count} lines)")

    # Run evaluation if gold SQL and evaluation scripts exist
    eval_script = spider_eval / "evaluation.py"
    eval_adapt_script = spider_eval.parent / "SFT" / "evaluation_adapt.py"
    # Also check in current repo's parent
    if not eval_adapt_script.exists():
        eval_adapt_script = Path(__file__).resolve().parent.parent / "evaluation_adapt.py"

    if gold_sql_file.exists() and eval_script.exists():
        print(f"\n=== Running Spider evaluation ===")

        # Match accuracy
        print("\n--- Match Accuracy ---")
        os.system(
            f"cd {spider_eval} && python {eval_script} "
            f"--gold {gold_sql_file} "
            f"--pred {out_file} "
            f"--etype match "
            f"--db {db_dir} "
            f"--table {tables_json}"
        )

        # Execution accuracy (with timeout)
        if eval_adapt_script.exists():
            print("\n--- Execution Accuracy ---")
            os.system(
                f"cd {spider_eval} && python {eval_adapt_script} "
                f"--gold {gold_sql_file} "
                f"--pred {out_file} "
                f"--etype exec "
                f"--db {db_dir} "
                f"--table {tables_json} "
                f"--timeout 5"
            )
    else:
        print(f"Evaluation skipped. Ensure Spider data and evaluation scripts are available.")
        print(f"  Spider data: {spider_data}")
        print(f"  Evaluation script: {eval_script}")


if __name__ == "__main__":
    main()
