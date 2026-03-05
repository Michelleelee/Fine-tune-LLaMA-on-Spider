import os
import json
import torch
from pathlib import Path

from peft import PeftModel
from transformers import AutoTokenizer, AutoModelForCausalLM

# Paths
DATA_DIR = Path("/home/geniusjjjjj/data/spider")
DEV_JSON = DATA_DIR / "dev.json"
DEV_TABLES = DATA_DIR / "tables.json"
DEV_DB_DIR = DATA_DIR / "database"

TEST_JSON = DATA_DIR / "test.json"
TEST_TABLES = DATA_DIR / "test_tables.json"
TEST_DB_DIR = DATA_DIR / "test_database"

# Choose split: "dev" or "test"
SPLIT = "test"

# Output
OUT_PRED = Path("/home/geniusjjjjj/transformer/SFT/outputs") / f"pred_{SPLIT}_lora.sql"

# Base model + LoRA adapter
BASE_MODEL_ID = "meta-llama/Meta-Llama-3.1-8B-Instruct"
ADAPTER_DIR = Path("/home/geniusjjjjj/transformer/SFT/models/qlora_spider/adapter")
LOCAL_ONLY = False

# Generation
MAX_NEW_TOKENS = 256
TEMPERATURE = 0.0
TOP_P = 0.9

# For quick debug
START_IDX = 300
END_IDX = None  # set to a small number for smoke test

# Load data
if SPLIT == "dev":
    DATA_JSON = DEV_JSON
    TABLES_JSON = DEV_TABLES
    DB_DIR = DEV_DB_DIR
elif SPLIT == "test":
    DATA_JSON = TEST_JSON
    TABLES_JSON = TEST_TABLES
    DB_DIR = TEST_DB_DIR
else:
    raise ValueError("SPLIT must be dev or test")

data = json.loads(DATA_JSON.read_text())
tables = {t["db_id"]: t for t in json.loads(TABLES_JSON.read_text())}


def schema_to_text(db_id):
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


def build_prompt(question, db_id):
    schema = schema_to_text(db_id)
    return (
        "You are a text-to-SQL system.\n"
        "Use ONLY tables/columns from the schema.\n"
        "Return exactly ONE SQLite SQL query and nothing else.\n"
        "Do NOT include explanations, comments, code fences, or the database id.\n\n"
        f"Database id: {db_id}\n"
        f"Schema: {schema}\n"
        f"Question: {question}\n"
        "SQL:"
    )

def load_tokenizer():
    if ADAPTER_DIR.exists():
        return AutoTokenizer.from_pretrained(ADAPTER_DIR, use_fast=True, local_files_only=LOCAL_ONLY)
    return AutoTokenizer.from_pretrained(BASE_MODEL_ID, use_fast=True, local_files_only=LOCAL_ONLY)

def ensure_generation_chat_template(tokenizer: AutoTokenizer) -> None:
    """
    Ensure chat template includes {% generation %} blocks for assistant-only loss consistency.
    """
    tpl = getattr(tokenizer, "chat_template", None)
    has_gen = tpl is not None and ("{% generation %}" in tpl)
    if not has_gen:
        tokenizer.chat_template = """{% for message in messages %}
{% if message['role'] == 'system' %}{{ message['content'] }}\n{% endif %}
{% if message['role'] == 'user' %}{{ message['content'] }}\n{% endif %}
{% if message['role'] == 'assistant' %}{% generation %}{{ message['content'] }}{% endgeneration %}\n{% endif %}
{% endfor %}"""


def load_model():
    model = AutoModelForCausalLM.from_pretrained(
        BASE_MODEL_ID,
        device_map="auto",
        dtype=torch.bfloat16 if torch.cuda.is_available() else torch.float32,
        local_files_only=LOCAL_ONLY,
    )
    model = PeftModel.from_pretrained(model, ADAPTER_DIR)
    # Cast LoRA params to bf16 for faster inference on supported GPUs.
    for name, param in model.named_parameters():
        if "lora_" in name and param.dtype != torch.bfloat16:
            param.data = param.data.to(torch.bfloat16)
    # Merge LoRA into the base weights for faster inference.
    model = model.merge_and_unload()
    model.eval()
    return model


tokenizer = load_tokenizer()
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token
ensure_generation_chat_template(tokenizer)


model = load_model()
print("use_cache:", model.config.use_cache)
print("is_training:", model.training)
print("dtype:", next(model.parameters()).dtype)


print("Loaded. CUDA:", torch.cuda.is_available())
def print_device_summary(model):
    # 1) 全模型参数的 device 分布
    dev2count = {}
    dev2numel = {}
    for n, p in model.named_parameters():
        d = str(p.device)
        dev2count[d] = dev2count.get(d, 0) + 1
        dev2numel[d] = dev2numel.get(d, 0) + p.numel()

    print("=== All params device distribution ===")
    for d in sorted(dev2count):
        total = dev2numel[d]
        print(f"{d:>10} | tensors={dev2count[d]:>6} | numel={total:,}")

    # 2) LoRA 参数的 device 分布（最关心）
    lora_params = [(n, p) for n, p in model.named_parameters()
                   if ("lora_" in n.lower()) or ("lora" in n.lower() and "loramodule" in n.lower())]

    if not lora_params:
        # 更宽松一点：PEFT 通常直接叫 lora_A / lora_B
        lora_params = [(n, p) for n, p in model.named_parameters()
                       if ("lora_a" in n.lower()) or ("lora_b" in n.lower())]

    print("=== LoRA params device distribution ===")
    if not lora_params:
        print("No LoRA parameters found by name. (Adapter might be merged, or naming differs.)")
    else:
        ldev2count = {}
        ldev2numel = {}
        for n, p in lora_params:
            d = str(p.device)
            ldev2count[d] = ldev2count.get(d, 0) + 1
            ldev2numel[d] = ldev2numel.get(d, 0) + p.numel()
        for d in sorted(ldev2count):
            print(f"{d:>10} | lora_tensors={ldev2count[d]:>6} | lora_numel={ldev2numel[d]:,}")

        # 打印几条样例
        print("=== Sample LoRA params ===")
        for n, p in lora_params[:10]:
            print(f"{n} -> {p.device}, dtype={p.dtype}, shape={tuple(p.shape)}")

print_device_summary(model)

def generate_sql(question, db_id):
    prompt = build_prompt(question, db_id)
    messages = [
        {"role": "system", "content": "You are a text-to-SQL system. Output ONLY one SQLite SQL query and nothing else."},
        {"role": "user", "content": prompt},
    ]
    inputs = tokenizer.apply_chat_template(
        messages, add_generation_prompt=True, return_tensors="pt"
    ).to(model.device)

    with torch.inference_mode():
        output_ids = model.generate(
            input_ids=inputs["input_ids"],
            attention_mask=inputs.get("attention_mask"),
            max_new_tokens=MAX_NEW_TOKENS,
            do_sample=False,
            temperature=TEMPERATURE,
            top_p=TOP_P,
            eos_token_id=tokenizer.eos_token_id,
            pad_token_id=tokenizer.eos_token_id,
        )

    gen_ids = output_ids[0, inputs["input_ids"].shape[-1] :]
    text = tokenizer.decode(gen_ids, skip_special_tokens=True).strip()
    # Keep only first SQL statement and strip inline comments.
    if ";" in text:
        text = text.split(";", 1)[0].strip() + ";"
    text = text.split(" --", 1)[0].strip()
    return text.splitlines()[0].strip()


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
