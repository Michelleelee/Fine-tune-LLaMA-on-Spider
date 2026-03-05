# QLoRA 微调 LLaMA-8B 跑 Spider Benchmark —— 作战手册

> 目标：在 **Spider dev set** 上，相对于 **微调前 baseline**，获得 **可复现的 EM / EX 提升**，并保持 **SQL-only、评测稳定**。

---

## 0. 总体思路（统一心智模型）

- 你已经完成：
  - Spider benchmark 推理 + evaluation pipeline（baseline）
  - Prompt 调优，输出更稳定
- 你现在要做的是：
  - 用 **同一套 prompt 模式**
  - 把 Spider `train` 数据转成 **指令微调数据**（x→y）
  - 用 **QLoRA** 微调 LLaMA-8B
  - 在 **同一 dev set** 上周期性测 **EM / EX**，选最佳 checkpoint

**核心原则：训练时学到的输入组织方式，应与推理时一致。**

---

## 1. 环境与依赖

### 1.1 Python & CUDA
- Python ≥ 3.10
- CUDA ≥ 11.8（推荐支持 bf16）

### 1.2 关键库
```bash
pip install -U \
  torch \
  transformers \
  accelerate \
  bitsandbytes \
  peft \
  trl \
  datasets
```

**说明**
- `bitsandbytes`：4bit 量化（QLoRA 的 Q）
- `peft`：LoRA 注入与 adapter 管理
- `trl`：`SFTTrainer`（SFT/指令微调封装）

---

## 2. 明确微调配置（先写死，后面再调参）

### 2.1 Base Model
- 与 baseline 必须一致（例如：`meta-llama/Llama-3.x-8B-Instruct` 或你实际的 Llama8B）

### 2.2 QLoRA 初始超参（稳妥起点）
```yaml
quantization:
  bits: 4
  type: nf4
  double_quant: true
  compute_dtype: bfloat16

lora:
  r: 16
  alpha: 32
  dropout: 0.05
  target_modules:
    - q_proj
    - k_proj
    - v_proj
    - o_proj
    - gate_proj
    - up_proj
    - down_proj

training:
  lr: 1e-4
  epochs: 2
  effective_batch_size: 64
  max_seq_len: 2048~4096
```

---

## 3. 数据准备（最关键）

### 3.1 原始输入
- `train_spider.json`
- `tables.json`
- `database/`（用于 schema 解析/校验；训练本身可只依赖 schema 文本）

### 3.2 目标：构造 SFT 数据 (x → y)

- **x（输入）**：与你推理时一致的 prompt 模板
  - system 指令（SQL-only、SQLite）
  - schema（表/列/外键）
  - question
- **y（输出）**：gold SQL
  - 只保留 SQL，不要解释

### 3.3 推荐训练样本格式：messages

```json
{
  "messages": [
    {
      "role": "system",
      "content": "You are a text-to-SQL system. Output ONLY one SQLite SQL query and nothing else."
    },
    {
      "role": "user",
      "content": "<SCHEMA>\n...\n</SCHEMA>\n\nQuestion: ..."
    },
    {
      "role": "assistant",
      "content": "SELECT ...;"
    }
  ]
}
```

**要求**
- schema 的组织方式尽量与 inference 一致
- assistant 严格 SQL-only

### 3.4 response-only loss（概念要求）
- system/user token 不参与 loss
- 只对 assistant 回复部分计算 loss

---

## 4. 加载 4-bit 基座模型（QLoRA 的 Q）

### 4.1 BitsAndBytesConfig（示例）
```python
BitsAndBytesConfig(
  load_in_4bit=True,
  bnb_4bit_quant_type="nf4",
  bnb_4bit_use_double_quant=True,
  bnb_4bit_compute_dtype=torch.bfloat16,
)
```

### 4.2 加载 tokenizer + model
关键点：
- `tokenizer.pad_token = tokenizer.eos_token`（若无 pad_token）
- `model.config.use_cache = False`（训练时）

---

## 5. 注入 LoRA（PEFT）

### 5.1 LoraConfig（示例）
```python
LoraConfig(
  r=16,
  lora_alpha=32,
  lora_dropout=0.05,
  bias="none",
  task_type="CAUSAL_LM",
  target_modules=["q_proj","k_proj","v_proj","o_proj","gate_proj","up_proj","down_proj"],
)
```

### 5.2 get_peft_model
- 将 LoRA 注入指定模块
- 冻结 base 权重，仅 LoRA 参数 `requires_grad=True`

---

## 6. 训练：SFTTrainer（监督微调）

### 6.1 为什么用 SFTTrainer
- 对 messages/chat 数据更友好
- 更容易实现 response-only loss
- 少写 data collator 与 labels mask

### 6.2 TrainingArguments（示例）
```python
TrainingArguments(
  output_dir="./qlora_spider",
  per_device_train_batch_size=1,
  gradient_accumulation_steps=16,
  learning_rate=1e-4,
  num_train_epochs=2,
  save_steps=500,
  logging_steps=20,
  bf16=True,
  report_to="none",
)
```

### 6.3 初始化与开训
- `trainer = SFTTrainer(model=..., tokenizer=..., train_dataset=..., max_seq_length=...)`
- `trainer.train()`

---

## 7. 训练过程监控（仪表盘）

### 7.1 监控指标
- train loss
- dev EM（match）
- dev EX（execution，推荐）

### 7.2 评测频率建议
- 每 500 / 1000 steps 跑一次 dev
- 推理参数固定（建议 temperature=0）
- evaluator 版本固定

---

## 8. 保存与选模型

### 8.1 保存内容
- 保存 LoRA adapter（增量权重）
- base model 不变

### 8.2 选择策略
- 以 dev EX（或你认为更重要的指标）最高的 checkpoint 作为 best
- 不一定是最后一步

---

## 9. 推理时加载 LoRA

- 推理 pipeline 与 baseline 保持一致
- 唯一区别：加载 `base_model + adapter`

---

## 10. 必做对照实验（建议至少 3 个）

1. baseline（无微调）
2. QLoRA（r=16）
3. QLoRA（r=32，可选）

对比：
- dev EM/EX
- SQL-only 稳定性
- 典型错误类型变化

---

## 11. 最终产出物（你要交付/沉淀的东西）

- 一套可复现训练脚本
- 一套 Spider→SFT 数据构建脚本
- dev 曲线（EM/EX 随 steps）
- best LoRA adapter
- 实验记录（prompt 版本、超参、结论）

---

## 12. 一句话总结

你现在做的不是“调模型”，而是在建立一个 **LLM 可控、可评估、可改进的工程闭环**。
