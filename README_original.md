# SFT
own toy for SFT

## How to evaluate using SPIDER Benchmark

python evaluation.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test.txt --etype match --db ~/data/spider/test_database --table ~/data/spider/test_tables.json > ~/transformer/SFT/results/llama8B_match_test_results.txt

python evaluation.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test_lora_pc.sql --etype match --db ~/data/spider/test_database --table ~/data/spider/test_tables.json > ~/transformer/SFT/results/llama8B_match_test_results.txt

python evaluation_test.py --gold ~/data/spider/test_gold.sql --pred ~/transformer/SFT/outputs/pred_test_lora_pc.sql --etype exec --db ~/data/spider/test_database --table ~/data/spider/test_tables.json --timeout 5 --verbose_timeout > ~/transformer/SFT/results/llama8B_exec_test_results.txt

PS: evaluation_adapt.py is a adpted version of spider/evaluation.py for stopping the timeout sql query and print the timeout id

## How to inference/ get pred of base model

### Making inference using base model Llama 3.1-8B

python llama_spider_pred.py

just choose the split of "train" or "dev"

## How to QloRA + SFT for text-to-SQL task on Llama 3.1-8B

### Preparing the data

spider_sft_data_prep.ipynb

just change the option for "train" or "dev"

### PEFT QLoRA + SFT

python llama_spider_SFT_prompt_completion.py \
  --train_path ~/transformer/SFT/data/spider_train_pc.jsonl \
  --dev_path   ~/transformer/SFT/data/spider_dev_pc.jsonl \
  --lr 5e-5 --epochs 2 --debug_one

llama_spider_SFT_prompt_completion.py is a updated version for using attention mask to SFT base model only on the assistant part.

The good learning strategy found is try to learn as slow as possible because the data is too little and can be overfit.

## How to inference using base model + QLoRA

Need a different code because it's using Peft model lib.

python llama_spider_pred_lora_pc.py

llama_spider_pred_lora.py is a bad version of this SFT experiment because it's chat template is very bad.

## The directory instructions

results/xxxxxx_results.txt is: before prompt engineering optimization, the task metric performance
results/xxxxxx_results_new.txt is: after prompt engineering optimization, the task metric performance
results/xxxxxx_results_lora.txt is: after prompt engineering + QLoRA + SFT (train + eval + select best checkpoint), the task metric performance

## The QLoRA SFT performance

After QLoRA: match task: 0.332 → 0.662     execution task: 0.399 → 0.705