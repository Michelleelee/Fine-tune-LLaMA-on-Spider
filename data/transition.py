import json
from pathlib import Path

def convert_messages_to_pc(in_path: str, out_path: str):
    in_path = str(Path(in_path).expanduser())
    out_path = str(Path(out_path).expanduser())

    bad = 0
    total = 0
    with open(in_path, "r", encoding="utf-8") as fin, open(out_path, "w", encoding="utf-8") as fout:
        for line in fin:
            total += 1
            ex = json.loads(line)

            msgs = ex.get("messages", None)
            if not isinstance(msgs, list):
                bad += 1
                continue

            # find assistant
            assistants = [m for m in msgs if isinstance(m, dict) and m.get("role") == "assistant"]
            if not assistants:
                bad += 1
                continue
            # use the last assistant as completion
            assistant = assistants[-1]
            sql = str(assistant.get("content", "")).strip()
            if sql == "":
                bad += 1
                continue

            # prompt = everything before the last assistant
            # (common structure: system, user, assistant)
            # keep all messages before assistant as prompt
            idx = msgs.index(assistant)
            prompt = msgs[:idx]
            completion = [{"role": "assistant", "content": sql}]

            out_ex = dict(ex)
            out_ex["prompt"] = prompt
            out_ex["completion"] = completion

            # optional: remove old fields to keep file clean
            # out_ex.pop("messages", None)
            # out_ex.pop("text", None)

            fout.write(json.dumps(out_ex, ensure_ascii=False) + "\n")

    print(f"Converted: {total-bad}/{total} kept, {bad} dropped.")
if __name__ == "__main__":
    convert_messages_to_pc(
    "~/transformer/SFT/data/spider_train_sft.jsonl",
    "~/transformer/SFT/data/spider_train_pc.jsonl",
    )
    convert_messages_to_pc(
        "~/transformer/SFT/data/spider_dev_sft.jsonl",
        "~/transformer/SFT/data/spider_dev_pc.jsonl",
    )
