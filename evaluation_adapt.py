import argparse
import sqlite3
import time

import evaluation as base


def _res_map(res, val_units):
    rmap = {}
    for idx, val_unit in enumerate(val_units):
        key = tuple(val_unit[1]) if not val_unit[2] else (val_unit[0], tuple(val_unit[1]), tuple(val_unit[2]))
        rmap[key] = [r[idx] for r in res]
    return rmap


def eval_exec_match_timeout(db, p_str, g_str, pred, gold, timeout_s=5.0, verbose=False):
    """
    Timeout-safe version of eval_exec_match.
    Any timeout/exception returns False for exec accuracy.
    """
    conn = sqlite3.connect(db)
    cursor = conn.cursor()

    def run(sql, tag):
        if timeout_s and timeout_s > 0:
            deadline = time.time() + timeout_s

            def handler():
                return 1 if time.time() >= deadline else 0

            # Trigger handler every N VM steps. Smaller => more responsive.
            conn.set_progress_handler(handler, 10000)
        else:
            conn.set_progress_handler(None, 0)
        cursor.execute(sql)
        return cursor.fetchall()

    try:
        p_res = run(p_str, "pred")
    except Exception as e:
        if verbose:
            msg = str(e).strip().replace("\n", " ")
            print(f"[exec_error] db={db} pred_err={msg} pred_sql={p_str[:300]}")
        conn.close()
        return False

    try:
        g_res = run(g_str, "gold")
    except Exception as e:
        if verbose:
            msg = str(e).strip().replace("\n", " ")
            print(f"[exec_error] db={db} gold_err={msg} gold_sql={g_str[:300]}")
        conn.close()
        return False

    conn.close()
    p_val_units = [unit[1] for unit in pred["select"][1]]
    g_val_units = [unit[1] for unit in gold["select"][1]]
    return _res_map(p_res, p_val_units) == _res_map(g_res, g_val_units)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--gold", dest="gold", type=str, required=True)
    parser.add_argument("--pred", dest="pred", type=str, required=True)
    parser.add_argument("--db", dest="db", type=str, required=True)
    parser.add_argument("--table", dest="table", type=str, required=True)
    parser.add_argument("--etype", dest="etype", type=str, required=True)
    parser.add_argument("--timeout", dest="timeout", type=float, default=5.0)
    parser.add_argument("--verbose_timeout", dest="verbose_timeout", action="store_true")
    args = parser.parse_args()

    assert args.etype in ["all", "exec", "match"], "Unknown evaluation method"

    # Monkeypatch exec evaluator with timeout-safe version.
    def _patched_eval_exec_match(db, p_str, g_str, pred, gold):
        return eval_exec_match_timeout(
            db,
            p_str,
            g_str,
            pred,
            gold,
            timeout_s=args.timeout,
            verbose=args.verbose_timeout,
        )

    base.eval_exec_match = _patched_eval_exec_match

    kmaps = base.build_foreign_key_map_from_json(args.table)
    base.evaluate(args.gold, args.pred, args.db, args.etype, kmaps)


if __name__ == "__main__":
    main()
