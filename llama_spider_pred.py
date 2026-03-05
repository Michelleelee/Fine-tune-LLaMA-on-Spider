import os
import json
import torch
from pathlib import Path
from transformers import AutoTokenizer, AutoModelForCausalLM
# Paths
DATA_DIR = Path('/home/geniusjjjjj/data/spider')
DEV_JSON = DATA_DIR / 'dev.json'
DEV_TABLES = DATA_DIR / 'tables.json'
DEV_DB_DIR = DATA_DIR / 'database'

TEST_JSON = DATA_DIR / 'test.json'
TEST_TABLES = DATA_DIR / 'test_tables.json'
TEST_DB_DIR = DATA_DIR / 'test_database'

# Choose split: 'dev' or 'test'
SPLIT = 'test'

# Output
OUT_PRED = Path('/home/geniusjjjjj/transformer/SFT/outputs') / (f'pred_{SPLIT}.sql')

# Model
MODEL_ID = 'meta-llama/Meta-Llama-3.1-8B-Instruct'
LOCAL_ONLY = False

# Generation
MAX_NEW_TOKENS = 256
TEMPERATURE = 0.0
TOP_P = 0.9

# For quick debug
START_IDX = 0
END_IDX = 1  # set to a small number for smoke test
# Load data
if SPLIT == 'dev':
    DATA_JSON = DEV_JSON
    TABLES_JSON = DEV_TABLES
    DB_DIR = DEV_DB_DIR
elif SPLIT == 'test':
    DATA_JSON = TEST_JSON
    TABLES_JSON = TEST_TABLES
    DB_DIR = TEST_DB_DIR
else:
    raise ValueError('SPLIT must be dev or test')

data = json.loads(DATA_JSON.read_text())
tables = {t['db_id']: t for t in json.loads(TABLES_JSON.read_text())}

def schema_to_text(db_id):
    t = tables[db_id]
    table_names = t['table_names_original']
    column_names = t['column_names_original']

    cols_by_table = {i: [] for i in range(len(table_names))}
    for tbl_idx, col in column_names:
        if tbl_idx == -1:
            continue
        cols_by_table[tbl_idx].append(col)

    parts = []
    for i, tbl in enumerate(table_names):
        cols = ', '.join(cols_by_table[i])
        parts.append(f"{tbl}({cols})")
    return ' ; '.join(parts)
tokenizer = AutoTokenizer.from_pretrained(
    MODEL_ID, use_fast=True, local_files_only=LOCAL_ONLY
)

model = AutoModelForCausalLM.from_pretrained(
    MODEL_ID,
    device_map='auto',
    dtype=torch.bfloat16 if torch.cuda.is_available() else torch.float32,
    local_files_only=LOCAL_ONLY,
)

print('Loaded. CUDA:', torch.cuda.is_available())
# print("=== original chat_template ===")
# print(tokenizer.chat_template[:2000])
# input("check")
def build_prompt(question, db_id):
    schema = schema_to_text(db_id)
    return (
        'You are a text-to-SQL system.\n'
        'Use ONLY tables/columns from the schema.\n'
        'Return exactly ONE SQLite SQL query and nothing else.\n'
        'Do NOT include explanations, comments, code fences, or the database id.\n\n'
        f'Database id: {db_id}\n'
        f'Schema: {schema}\n'
        f'Question: {question}\n'
        'SQL:'
    )

def generate_sql(question, db_id):
    prompt = build_prompt(question, db_id)
    messages = [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": prompt},
    ]
    inputs = tokenizer.apply_chat_template(
        messages, add_generation_prompt=True, return_tensors='pt'
    ).to(model.device)

    with torch.inference_mode():
        output_ids = model.generate(
            input_ids=inputs['input_ids'],
            attention_mask=inputs.get('attention_mask'),
            max_new_tokens=MAX_NEW_TOKENS,
            do_sample=False,
            temperature=TEMPERATURE,
            top_p=TOP_P,
            eos_token_id=tokenizer.eos_token_id,
            pad_token_id=tokenizer.eos_token_id,
        )

    gen_ids = output_ids[0, inputs['input_ids'].shape[-1]:]
    text = tokenizer.decode(gen_ids, skip_special_tokens=True).strip()
    # Best-effort cleanup: keep first line
    return text.splitlines()[0].strip()
# Generate predictions
from tqdm import tqdm
END_IDX = None  # set to a small number for smoke test
FLUSH_EVERY = 100
OUT_PRED.parent.mkdir(parents=True, exist_ok=True)
start = START_IDX
end = END_IDX if END_IDX is not None else len(data)

count = 0
with OUT_PRED.open('w', encoding='utf-8') as f:
    for ex in tqdm(data[start:end]):
        sql = generate_sql(ex['question'], ex['db_id'])
        f.write(sql + '\n')
        count += 1
        if count % FLUSH_EVERY == 0:
            f.flush()
            os.fsync(f.fileno())

print('Wrote:', OUT_PRED, 'lines:', count)
