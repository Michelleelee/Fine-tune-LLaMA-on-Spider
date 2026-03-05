# Llama-3.1-8B-QLoRA-on_SPIDER
Minimal SFT playground for Spider text-to-SQL with Llama 3.1-8B + QLoRA.

## Evaluate with SPIDER benchmark
Use the original evaluator or the timeout-safe variant.

python evaluation.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test.txt --etype match --db ~/data/spider/test_database --table ~/data/spider/test_tables.json > ~/transformer/SFT/results/llama8B_match_test_results.txt

python evaluation.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test_lora_pc.sql --etype match --db ~/data/spider/test_database --table ~/data/spider/test_tables.json > ~/transformer/SFT/results/llama8B_match_test_results.txt

python evaluation_test.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test_lora_pc.sql --etype exec --db ~/data/spider/test_database --table ~/data/spider/test_tables.json --timeout 5 --verbose_timeout > ~/transformer/SFT/results/llama8B_exec_test_results.txt

Note: `evaluation_adapt.py` is an adapted version of `spider/evaluation.py` that stops timeout SQL and prints the timeout id.

## Base model inference

### Llama 3.1-8B
Run inference with the base model:

python llama_spider_pred.py

Choose the split in the script (`train` or `dev`).

## QLoRA + SFT for text-to-SQL

### Data prep

spider_sft_data_prep.ipynb

Change the split inside the notebook (`train` or `dev`).

### PEFT QLoRA + SFT (prompt+completion)

python llama_spider_SFT_prompt_completion.py \
  --train_path ~/transformer/SFT/data/spider_train_pc.jsonl \
  --dev_path   ~/transformer/SFT/data/spider_dev_pc.jsonl \
  --lr 5e-5 --epochs 2 --debug_one

`llama_spider_SFT_prompt_completion.py` uses prompt+completion format and avoids assistant mask patching.
`llama_spider_SFT.py` is a fail try.

Practical note: slow learning is safer here (small dataset, easy to overfit).

## Inference with base + QLoRA

Use the PEFT wrapper for adapters.

python llama_spider_pred_lora_pc.py

`llama_spider_pred_lora.py` is not recommended (chat template mismatch).

## The directory instructions

### transformer/ tree (2 levels)
SFT/
  .git/
  README.md
  README_original.md
  SFT.md
  __pycache__/
  data/
  evaluation_adapt.py
  llama_spider_SFT.py
  llama_spider_SFT_prompt_completion.py
  llama_spider_pred.py
  llama_spider_pred_lora.py
  llama_spider_pred_lora_pc.py
  models/
  outputs/
  results/
  spider_sft_data_prep.ipynb
  template.log
llama_play.ipynb
login.py
run_llama.py
spider/
  .git/
  LICENSE
  README.md
  __pycache__/
  baselines/
  data/
  evaluation.py
  evaluation_examples/
  evaluation_test.py
  preprocess/
  process_sql.py
test.py

results/xxxxxx_results.txt is: before prompt engineering optimization, the task metric performance
results/xxxxxx_results_new.txt is: after prompt engineering optimization, the task metric performance
results/xxxxxx_results_lora.txt is: after prompt engineering + QLoRA + SFT (train + eval + select best checkpoint), the task metric performance

## QLoRA SFT performance

After QLoRA: match task: 0.332 → 0.662     execution task: 0.399 → 0.705
