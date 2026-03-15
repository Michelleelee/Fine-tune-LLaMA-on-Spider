# Llama-3.1-8B Text-to-SQL on Spider (QLoRA SFT + GRPO RL)

Fine-tune Llama-3.1-8B-Instruct for text-to-SQL on the Spider benchmark using QLoRA SFT, then further optimize with GRPO reinforcement learning using SQL execution feedback.

## Pipeline Overview

```
Stage 1: QLoRA SFT (Supervised Fine-Tuning)
  Spider train data → prompt+completion pairs → cross-entropy loss on gold SQL
  Result: 33.2% → 66.2% exact match, 39.9% → 70.5% execution accuracy

Stage 2: GRPO RL (Group Relative Policy Optimization)
  SFT model → generate multiple SQL per question → reward from SQL execution → policy gradient
  3498 training iterations
  Result: 66.2% → 67.8% exact match, 70.5% → 72.2% execution accuracy
  The model never sees gold SQL; it learns from execution feedback only.
```

## Environment Setup

### 1. Python Environment

Requires Python >= 3.10 with CUDA >= 11.8 (bf16 support recommended).

```bash
conda create -n transformer python=3.10
conda activate transformer

pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install transformers accelerate bitsandbytes peft trl datasets
```

Tested versions: torch 2.6.0, transformers 5.0.0, trl 0.27.1, peft 0.18.1, bitsandbytes 0.49.1, accelerate 1.12.0.

### 2. HuggingFace Login

The base model `meta-llama/Meta-Llama-3.1-8B-Instruct` requires a HuggingFace access token.

```bash
huggingface-cli login
# Paste your token (get one at https://huggingface.co/settings/tokens)
```

### 3. Spider Benchmark Data

Download the Spider dataset and set up the following directory structure:

```bash
# Download Spider from https://yale-lily.github.io/spider
# Or: git clone https://github.com/taoyds/spider.git ~/transformer/spider

# The Spider DATA files should be at:
~/data/spider/
├── train_spider.json          # 7000 training questions
├── dev.json                   # 1034 dev questions
├── test.json                  # 2147 test questions (optional)
├── tables.json                # Schema info for train/dev databases
├── test_tables.json           # Schema info for test databases
├── train_gold.sql             # Gold SQL for training
├── dev_gold.sql               # Gold SQL for dev evaluation
├── test_gold.sql              # Gold SQL for test evaluation
├── database/                  # SQLite databases for train/dev (166 databases)
│   ├── academic/
│   │   ├── academic.sqlite
│   │   └── schema.sql
│   ├── department_management/
│   │   ├── department_management.sqlite
│   │   └── schema.sql
│   └── ...
└── test_database/             # SQLite databases for test (206 databases)
    └── ...

# The Spider EVALUATION SCRIPTS should be at:
~/transformer/spider/
├── evaluation.py              # Official Spider evaluator
├── evaluation_test.py         # Timeout-safe variant
└── process_sql.py             # SQL parsing utilities
```

If your Spider data is at a different path, pass `--db_path` to the GRPO scripts.

### 4. Project Directory Structure

Clone this repo and arrange the project:

```bash
cd ~/transformer
git clone https://github.com/Michelleelee/Fine-tune-LLaMA-on-Spider.git

# The full project tree:
~/transformer/Fine-tune-LLaMA-on-Spider/   # This repo
├── README.md
├── SFT.md                     # Detailed SFT methodology guide (Chinese)
│
├── data/                      # SFT training data (JSONL format)
│   ├── spider_train_pc.jsonl  # 7000 samples (prompt + completion)
│   ├── spider_dev_pc.jsonl    # 1034 samples
│   ├── spider_train_sft.jsonl # Alternative messages format
│   ├── spider_dev_sft.jsonl
│   └── transition.py          # Format conversion utility
│
├── models/
│   └── qlora_spider_pc/       # SFT model checkpoint
│       └── qlora_spider_pc_adapter_20260203.tar.gz
│
├── outputs/                   # Inference predictions
│   ├── pred_test.sql          # Baseline predictions
│   └── pred_test_lora_pc.sql  # SFT predictions
│
├── results/                   # Evaluation results
│   ├── llama8B_match_test_results.txt       # Baseline match
│   ├── llama8B_exec_test_results_new.txt    # Baseline execution
│   ├── llama8B_match_test_results_lora.txt  # SFT match
│   └── llama8B_exec_test_results_lora.txt   # SFT execution
│
├── spider_sft_data_prep.ipynb # Data preparation notebook
├── llama_spider_SFT_prompt_completion.py    # SFT training script (recommended)
├── llama_spider_SFT.py                      # SFT alternative (not recommended)
├── llama_spider_pred.py                     # Base model inference
├── llama_spider_pred_lora_pc.py             # SFT model inference (recommended)
├── llama_spider_pred_lora.py                # Alternative inference
├── evaluation_adapt.py                      # Timeout-safe evaluation wrapper
│
└── GRPO/                      # GRPO reinforcement learning (Stage 2)
    ├── data_prep.py           # Convert SFT data → GRPO format
    ├── rewards.py             # SQL execution reward function
    ├── grpo_train.py          # Main GRPO training script
    ├── evaluate_grpo.py       # Post-training evaluation
    └── models/grpo_spider/
        ├── final_adapter/     # Final GRPO adapter after 3498 iterations
```

---

## Stage 1: QLoRA SFT

### Data Preparation

Convert Spider's raw JSON to instruction-tuning format:

```bash
# Run the Jupyter notebook to generate JSONL files
jupyter notebook spider_sft_data_prep.ipynb
```

This creates `data/spider_train_pc.jsonl` and `data/spider_dev_pc.jsonl` with the format:

```json
{
  "prompt": [
    {"role": "system", "content": "You are a text-to-SQL system..."},
    {"role": "user", "content": "Database id: ...\nSchema: ...\nQuestion: ...\nSQL:"}
  ],
  "completion": [
    {"role": "assistant", "content": "SELECT count(*) FROM head WHERE age > 56"}
  ],
  "db_id": "department_management",
  "gold_sql": "SELECT count(*) FROM head WHERE age > 56"
}
```

### Training

```bash
conda activate transformer

python llama_spider_SFT_prompt_completion.py \
    --train_path data/spider_train_pc.jsonl \
    --dev_path data/spider_dev_pc.jsonl \
    --output_dir models/qlora_spider_pc \
    --lr 5e-5 --epochs 2 --debug_one
```

QLoRA config: 4-bit NF4 quantization, LoRA rank=16, alpha=32, targeting all attention + MLP projections. ~161MB adapter, fits on a single 24GB GPU.

### Inference

```bash
python llama_spider_pred_lora_pc.py
```

Edit `SPLIT`, `ADAPTER_DIR`, and `OUT_PRED` in the script to switch between dev/test and different checkpoints.

### Evaluation

```bash
# Match accuracy (exact SQL match)
cd ~/transformer/spider
python evaluation.py \
    --gold ~/data/spider/dev_gold.sql \
    --pred ~/transformer/Fine-tune-LLaMA-on-Spider/outputs/pred_test_lora_pc.sql \
    --etype match \
    --db ~/data/spider/database \
    --table ~/data/spider/tables.json

# Execution accuracy (run SQL, compare results, 5s timeout)
python ~/transformer/Fine-tune-LLaMA-on-Spider/evaluation_adapt.py \
    --gold ~/data/spider/dev_gold.sql \
    --pred ~/transformer/Fine-tune-LLaMA-on-Spider/outputs/pred_test_lora_pc.sql \
    --etype exec \
    --db ~/data/spider/database \
    --table ~/data/spider/tables.json \
    --timeout 5
```

### SFT Results

| Metric | Baseline | After QLoRA SFT | Improvement |
|--------|----------|-----------------|-------------|
| Exact Match | 33.2% | 66.2% | +33.0pp |
| Execution Accuracy | 39.9% | 70.5% | +30.6pp |

---

## Stage 2: GRPO Reinforcement Learning

After SFT, the model is further optimized using GRPO (Group Relative Policy Optimization) with SQL execution feedback as the reward signal.

### GRPO Formulation for Text-to-SQL

This project treats text-to-SQL as a lightweight RL problem:

- State / prompt: the schema description + natural-language question from Spider
- Action: the model generates a SQL query token by token
- Environment: the corresponding Spider SQLite database for that `db_id`
- Feedback: a scalar reward computed after the generated SQL is executed and compared with the gold query's execution result

So yes: the real SQLite database is effectively the environment that the model interacts with at reward time. The model proposes SQL, we execute it on the database, and then score the outcome.

### What Supervision Is Used During GRPO

GRPO training does **not** use exact-match accuracy as the optimization target.

- The model does not get teacher-forced gold SQL tokens during RL training
- The model does still use `gold_sql` inside the reward function
- `gold_sql` is executed on the same database to produce the reference result set
- The predicted SQL is then scored against that reference result, plus two auxiliary signals

In other words, GRPO here is **not** "pure environment-only RL" and also **not** "exact match RL". It is reward-based learning with access to the gold query only for reward computation.

### How One GRPO Update Works

1. Start from the SFT adapter as the initial policy
2. For each prompt, sample `G=4` candidate SQL queries
3. Execute each candidate SQL on the real SQLite database
4. Execute the corresponding `gold_sql` on the same database
5. Compute a scalar reward for each candidate
6. Normalize rewards within the group and update the policy with GRPO

The role of GRPO is to prefer candidates that earn higher reward relative to other samples from the same prompt, while a KL penalty keeps the policy close to the SFT model.

### Reward Function

The reward used in `GRPO/rewards.py` is a weighted sum of three terms:

| Component | Weight | Range | Description |
|-----------|--------|-------|-------------|
| Execution Accuracy | 3.0 | {0, 1} | Execute predicted SQL and gold SQL on the same DB, then compare result sets |
| SQL Validity | 1.0 | {0, 1} | Predicted SQL runs successfully without parse / execution error |
| Structural Similarity | 1.0 | [0, 1] | Bigram Jaccard similarity between predicted SQL text and gold SQL text |

This means the training feedback is a **composite reward**, not a single metric:

- Main signal: execution-equivalent result to gold SQL
- Auxiliary signal 1: whether the SQL is at least valid and executable
- Auxiliary signal 2: whether the SQL text is structurally similar to the gold query

Exact match is **evaluation only** in this repo. It is reported in the result tables, but it is not directly optimized inside the GRPO reward.

Because execution reward is weighted most heavily (`3.0`), the training objective mainly pushes the model toward producing SQL that yields the correct answer when run on the database. The validity and similarity terms help stabilize learning when a sampled query is not yet fully correct.

### Step 1: Prepare GRPO Data

```bash
cd GRPO

# Convert SFT data to GRPO format (removes completions, validates gold SQL)
python data_prep.py \
    --db_path ~/data/spider/database \
    --sft_data_dir ../data \
    --output_dir ./data
```

### Step 2: Extract SFT Adapter

```bash
# Extract the SFT adapter checkpoint (if using the bundled tar.gz)
cd ../models/qlora_spider_pc
tar -xzf qlora_spider_pc_adapter_20260203.tar.gz
# This creates an `adapter/` directory with the LoRA weights
cd ../../GRPO
```

### Step 3: Run GRPO Training

```bash
# Smoke test (10 steps, ~3 minutes)
python grpo_train.py \
    --sft_adapter ../models/qlora_spider_pc/adapter \
    --db_path ~/data/spider/database \
    --smoke_test

# Full training (2 epochs, ~6-8 hours on L4, faster on RTX 6000 Ada)
python grpo_train.py \
    --sft_adapter ../models/qlora_spider_pc/adapter \
    --db_path ~/data/spider/database \
    --train_data ./data/spider_grpo_train \
    --eval_data ./data/spider_grpo_dev \
    --output_dir ./models/grpo_spider
```

This run finished at `3498` iterations. The exported final model is `GRPO/models/grpo_spider/final_adapter`.

Key hyperparameters (adjustable via CLI):

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--num_generations` | 4 | Completions per prompt (G) |
| `--beta` | 0.04 | KL penalty (keeps model close to SFT policy) |
| `--lr` | 5e-6 | Learning rate (10x lower than SFT) |
| `--batch_size` | 4 | Per-device batch (must divide by num_generations) |
| `--grad_accum` | 4 | Gradient accumulation steps |
| `--temperature` | 0.7 | Sampling temperature for generation diversity |
| `--num_epochs` | 2 | Training epochs |

If you encounter OOM, reduce `--num_generations 2 --batch_size 2 --grad_accum 8`.

### Step 4: Evaluate GRPO Model

```bash
python evaluate_grpo.py \
    --adapter_dir ./models/grpo_spider/final_adapter \
    --spider_data ~/data/spider \
    --spider_eval ~/transformer/spider \
    --split dev
```

### GRPO Final Results

| Metric | After QLoRA SFT | After GRPO (3498 iters) | Improvement |
|--------|------------------|-------------------------|-------------|
| Exact Match | 66.2% | 67.8% | +1.6pp |
| Execution Accuracy | 70.5% | 72.2% | +1.7pp |

`GRPO/models/grpo_spider/final_adapter` is the final model directory. If you only want to version the final artifact, archive and push `GRPO/models/grpo_spider/final_adapter.zip`.

---

## GPU Requirements

| Stage | Min VRAM | Recommended | Notes |
|-------|----------|-------------|-------|
| SFT Training | 16 GB | 24 GB | 4-bit QLoRA, batch=2, grad_accum=8 |
| SFT Inference | 16 GB | 24 GB | Full precision model + LoRA |
| GRPO Training | 16 GB | 24 GB+ | 4-bit QLoRA, G=4 completions/prompt |

Tested on: NVIDIA L4 (24GB), NVIDIA RTX 6000 Ada (48GB).
