"""
Reward functions for GRPO text-to-SQL training.

Compound reward with three components:
  1. Execution Accuracy (weight=3.0): Execute predicted SQL, compare results with gold
  2. SQL Validity (weight=1.0): Predicted SQL parses and executes without error
  3. Structural Similarity (weight=1.0): Bigram Jaccard similarity to gold SQL

Guarantees: correct SQL scores >= 4.0, incorrect SQL scores <= 2.0

The DB_BASE_PATH must be set before use (done by grpo_train.py via --db_path argument).
"""

import re
import sqlite3
import time
from collections import Counter

# Set by grpo_train.py at startup based on --db_path argument
DB_BASE_PATH = None
TIMEOUT_SECONDS = 5.0


def sql_reward_func(completions, db_id, gold_sql, **kwargs):
    """
    Compound reward function for text-to-SQL GRPO.

    Args:
        completions: list of list[dict] - conversational format
                     e.g. [[{"role": "assistant", "content": "SELECT ..."}], ...]
        db_id: list of str - database names
        gold_sql: list of str - gold SQL queries

    Returns:
        list of float - weighted rewards
    """
    if DB_BASE_PATH is None:
        raise RuntimeError("DB_BASE_PATH not set. Set rewards.DB_BASE_PATH = '/path/to/database' first.")

    rewards = []
    for completion, db, gold in zip(completions, db_id, gold_sql):
        # Extract SQL text from completion
        sql = _extract_sql(completion)

        # Clean the SQL
        sql = _clean_sql(sql)

        db_path = f"{DB_BASE_PATH}/{db}/{db}.sqlite"

        # Component 1: SQL Validity (weight=1.0)
        validity_reward = 0.0
        pred_results = None

        conn = None
        try:
            conn = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
            deadline = time.time() + TIMEOUT_SECONDS
            conn.set_progress_handler(lambda: 1 if time.time() >= deadline else 0, 10000)
            cursor = conn.cursor()
            cursor.execute(sql)
            pred_results = cursor.fetchall()
            validity_reward = 1.0
        except Exception:
            pred_results = None
        finally:
            if conn:
                conn.close()

        # Component 2: Execution Accuracy (weight=3.0)
        exec_reward = 0.0
        if pred_results is not None:
            conn = None
            try:
                conn = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True)
                deadline = time.time() + TIMEOUT_SECONDS
                conn.set_progress_handler(lambda: 1 if time.time() >= deadline else 0, 10000)
                cursor = conn.cursor()
                cursor.execute(gold)
                gold_results = cursor.fetchall()

                # Compare as sets of tuples (order-independent)
                if set(map(tuple, pred_results)) == set(map(tuple, gold_results)):
                    exec_reward = 1.0
            except Exception:
                pass
            finally:
                if conn:
                    conn.close()

        # Component 3: Structural Similarity (weight=1.0)
        similarity_reward = _ngram_jaccard(sql, gold, n=2)

        # Weighted composite
        total = 3.0 * exec_reward + 1.0 * validity_reward + 1.0 * similarity_reward
        rewards.append(total)

    return rewards


def _extract_sql(completion):
    """Extract SQL text from completion (handles conversational format)."""
    if isinstance(completion, list):
        # Conversational format: [{"role": "assistant", "content": "SELECT ..."}]
        if completion and isinstance(completion[0], dict):
            return completion[0].get("content", "").strip()
        return ""
    return str(completion).strip()


def _clean_sql(sql):
    """Extract first SQL statement, remove markdown fences and comments."""
    # Remove markdown code fences
    sql = re.sub(r"```(?:sql)?\s*", "", sql)
    sql = re.sub(r"```", "", sql)
    sql = sql.strip()

    # Take first statement if multiple
    if ";" in sql:
        sql = sql.split(";")[0].strip()

    # Remove inline comments
    if " --" in sql:
        sql = sql.split(" --")[0].strip()

    # Take first line if multi-line (model sometimes adds explanations)
    lines = [ln.strip() for ln in sql.splitlines() if ln.strip()]
    return lines[0] if lines else ""


def _ngram_jaccard(pred_sql, gold_sql, n=2):
    """Compute Jaccard similarity of n-grams between two SQL strings."""
    def get_ngrams(text, n):
        tokens = text.lower().split()
        if len(tokens) < n:
            return Counter([tuple(tokens)]) if tokens else Counter()
        return Counter(tuple(tokens[i : i + n]) for i in range(len(tokens) - n + 1))

    pred_ng = get_ngrams(pred_sql, n)
    gold_ng = get_ngrams(gold_sql, n)

    intersection = sum((pred_ng & gold_ng).values())
    union = sum((pred_ng | gold_ng).values())

    return intersection / union if union > 0 else 0.0
