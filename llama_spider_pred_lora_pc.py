import os
import json
import torch
from pathlib import Path
from typing import Dict, Any, List

from peft import PeftModel
from transformers import AutoTokenizer, AutoModelForCausalLM

# --------------------
# Paths / config
# --------------------
DATA_DIR = Path("/home/geniusjjjjj/data/spider")
DEV_JSON = DATA_DIR / "dev.json"
DEV_TABLES = DATA_DIR / "tables.json"

TEST_JSON = DATA_DIR / "test.json"
TEST_TABLES = DATA_DIR / "test_tables.json"

SPLIT = "test"  # "dev" or "test"

OUT_PRED = Path("/home/geniusjjjjj/transformer/SFT/outputs") / f"pred_{SPLIT}_lora_pc.sql"

BASE_MODEL_ID = "meta-llama/Meta-Llama-3.1-8B-Instruct"
ADAPTER_DIR = Path("/home/geniusjjjjj/transformer/SFT/models/qlora_spider_pc/adapter")  # <-- 按你新训练输出目录改
LOCAL_ONLY = False

MAX_NEW_TOKENS = 256
DO_SAMPLE = False
TEMPERATURE = 0.0
TOP_P = 0.9

START_IDX = 0
END_IDX = None

# If you want faster inference, set True to merge LoRA weights into base (uses more VRAM during merge)
MERGE_LORA = False

# --------------------
# Load Spider split
# --------------------
if SPLIT == "dev":
    DATA_JSON = DEV_JSON
    TABLES_JSON = DEV_TABLES
elif SPLIT == "test":
    DATA_JSON = TEST_JSON
    TABLES_JSON = TEST_TABLES
else:
    raise ValueError("SPLIT must be dev or test")

data: List[Dict[str, Any]] = json.loads(DATA_JSON.read_text())
tables = {t["db_id"]: t for t in json.loads(TABLES_JSON.read_text())}


def schema_to_text(db_id: str) -> str:
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


# --------------------
# Prompt in the same format as training (system rules + user schema/question)
# --------------------
def build_system_prompt() -> str:
    return (
        "You are a text-to-SQL system.\n"
        "Use ONLY tables/columns from the schema.\n"
        "Return exactly ONE SQLite SQL query and nothing else.\n"
        "Do NOT include explanations, comments, code fences, or the database id."
    )


def build_user_prompt(question: str, db_id: str) -> str:
    schema = schema_to_text(db_id)
    return (
        f"Database id: {db_id}\n"
        f"Schema: {schema}\n"
        f"Question: {question}\n"
        "SQL:"
    )


# --------------------
# Load tokenizer / model
# --------------------
def load_tokenizer():
    # Prefer adapter tokenizer if it exists (so any added tokens/config align)
    if ADAPTER_DIR.exists():
        tok = AutoTokenizer.from_pretrained(ADAPTER_DIR, use_fast=True, local_files_only=LOCAL_ONLY)
    else:
        tok = AutoTokenizer.from_pretrained(BASE_MODEL_ID, use_fast=True, local_files_only=LOCAL_ONLY)

    if tok.pad_token is None:
        tok.pad_token = tok.eos_token
    return tok


def load_model():
    # Your environment said use dtype=, not torch_dtype=
    dtype = torch.bfloat16 if (torch.cuda.is_available() and torch.cuda.is_bf16_supported()) else torch.float16

    base = AutoModelForCausalLM.from_pretrained(
        BASE_MODEL_ID,
        device_map="auto",
        dtype=dtype,
        local_files_only=LOCAL_ONLY,
    )

    if not ADAPTER_DIR.exists():
        raise FileNotFoundError(f"Adapter dir not found: {ADAPTER_DIR}")

    model = PeftModel.from_pretrained(base, ADAPTER_DIR)

    # Inference: enable KV cache for speed
    model.config.use_cache = True
    model.eval()

    if MERGE_LORA:
        # Merge LoRA for speed (after merge, it's no longer a PEFT wrapper)
        model = model.merge_and_unload()
        model.eval()

    return model


tokenizer = load_tokenizer()
model = load_model()

print("Loaded. CUDA:", torch.cuda.is_available())
print("use_cache:", model.config.use_cache)
print("is_training:", model.training)
print("dtype:", next(model.parameters()).dtype)
print("model device (first param):", next(model.parameters()).device)


# --------------------
# Generation
# --------------------
def generate_sql(question: str, db_id: str) -> str:
    system = build_system_prompt()
    user = build_user_prompt(question, db_id)

    messages = [
        {"role": "system", "content": system},
        {"role": "user", "content": user},
    ]

    inputs = tokenizer.apply_chat_template(
        messages,
        add_generation_prompt=True,   # add assistant header
        return_tensors="pt",
    )

    # Move inputs to the same device as model
    inputs = {k: v.to(model.device) for k, v in inputs.items()}

    gen_kwargs = dict(
        input_ids=inputs["input_ids"],
        attention_mask=inputs.get("attention_mask"),
        max_new_tokens=MAX_NEW_TOKENS,
        do_sample=DO_SAMPLE,
        eos_token_id=tokenizer.eos_token_id,
        pad_token_id=tokenizer.eos_token_id,
        use_cache=True,
    )

    # Only pass sampling params if sampling is enabled
    if DO_SAMPLE:
        gen_kwargs["temperature"] = float(TEMPERATURE)
        gen_kwargs["top_p"] = float(TOP_P)

    with torch.inference_mode():
        output_ids = model.generate(**gen_kwargs)

    gen_ids = output_ids[0, inputs["input_ids"].shape[-1]:]
    text = tokenizer.decode(gen_ids, skip_special_tokens=True).strip()

    # Post-process: keep only first statement, strip inline comment
    if ";" in text:
        text = text.split(";", 1)[0].strip() + ";"
    text = text.split(" --", 1)[0].strip()

    # Keep first line only (optional, reduces chance of multiple statements)
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    return lines[0] if lines else ""


# --------------------
# Run and write file
# --------------------
from tqdm import tqdm

OUT_PRED.parent.mkdir(parents=True, exist_ok=True)
start = START_IDX
end = END_IDX if END_IDX is not None else len(data)

count = 0
with OUT_PRED.open("w", encoding="utf-8") as f:
    for ex in tqdm(data[start:end]):
        sql = generate_sql(ex["question"], ex["db_id"])
        f.write(sql + "\n")
        count += 1
        if count % 100 == 0:
            f.flush()
            os.fsync(f.fileno())

print("Wrote:", OUT_PRED, "lines:", count)
