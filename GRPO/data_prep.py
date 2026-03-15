"""
Prepare Spider dataset for GRPO training.
Converts SFT data (prompt+completion format) to GRPO format:
  - Keeps: prompt (conversational), db_id, gold_sql
  - Removes: completion, messages, text (GRPO generates its own completions)
Optionally validates that gold SQL executes successfully against the database.

Usage:
    python data_prep.py \
        --db_path ~/data/spider/database \
        --sft_data_dir ../data \
        --output_dir ./data
"""

import argparse
import json
import sqlite3
import time
from pathlib import Path

from datasets import Dataset


def parse_args():
    parser = argparse.ArgumentParser(description="Prepare GRPO dataset from SFT data")
    parser.add_argument("--db_path", type=str, default="~/data/spider/database",
                        help="Path to Spider database directory (contains {db_id}/{db_id}.sqlite)")
    parser.add_argument("--sft_data_dir", type=str, default="../data",
                        help="Path to SFT data directory (contains spider_train_pc.jsonl, spider_dev_pc.jsonl)")
    parser.add_argument("--output_dir", type=str, default="./data",
                        help="Output directory for GRPO datasets")
    parser.add_argument("--skip_validation", action="store_true",
                        help="Skip gold SQL execution validation (useful if databases not available)")
    return parser.parse_args()


def gold_executes(db_path: str, sql: str, timeout_s: float = 5.0) -> bool:
    """Check if a gold SQL query executes successfully against the database."""
    conn = None
    try:
        conn = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
        if timeout_s > 0:
            deadline = time.time() + timeout_s
            conn.set_progress_handler(lambda: 1 if time.time() >= deadline else 0, 10000)
        cursor = conn.cursor()
        cursor.execute(sql)
        cursor.fetchall()
        return True
    except Exception:
        return False
    finally:
        if conn:
            conn.close()


def load_and_prepare(jsonl_path: str, db_base_path: Path, validate_gold: bool = True) -> Dataset:
    """Load SFT JSONL and convert to GRPO format."""
    records = []
    skipped = 0

    with open(jsonl_path) as f:
        for line in f:
            ex = json.loads(line)
            db_id = ex["db_id"]
            gold_sql = ex["gold_sql"]

            if validate_gold:
                db_file = db_base_path / db_id / f"{db_id}.sqlite"
                if not db_file.exists():
                    print(f"[WARN] Database not found: {db_file}, skipping")
                    skipped += 1
                    continue
                if not gold_executes(str(db_file), gold_sql):
                    print(f"[WARN] Gold SQL failed for db={db_id}: {gold_sql[:100]}")
                    skipped += 1
                    continue

            records.append({
                "prompt": ex["prompt"],      # list of message dicts (system + user)
                "db_id": db_id,              # str
                "gold_sql": gold_sql,        # str
            })

    print(f"Loaded {len(records)} samples, skipped {skipped}")
    return Dataset.from_list(records)


def main():
    args = parse_args()

    db_path = Path(args.db_path).expanduser().resolve()
    sft_data_dir = Path(args.sft_data_dir).expanduser().resolve()
    output_dir = Path(args.output_dir).expanduser().resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    validate = not args.skip_validation

    print("=== Preparing training dataset ===")
    train_ds = load_and_prepare(str(sft_data_dir / "spider_train_pc.jsonl"), db_path, validate)
    train_save_path = str(output_dir / "spider_grpo_train")
    train_ds.save_to_disk(train_save_path)
    print(f"Saved training dataset ({len(train_ds)} samples) to {train_save_path}")

    print("\n=== Preparing dev dataset ===")
    dev_ds = load_and_prepare(str(sft_data_dir / "spider_dev_pc.jsonl"), db_path, validate)
    dev_save_path = str(output_dir / "spider_grpo_dev")
    dev_ds.save_to_disk(dev_save_path)
    print(f"Saved dev dataset ({len(dev_ds)} samples) to {dev_save_path}")


if __name__ == "__main__":
    main()
