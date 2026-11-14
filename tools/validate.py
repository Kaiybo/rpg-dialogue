#!/usr/bin/env python3
"""Content validator for RPG Dialogue packs.

    python3 tools/validate.py                 # every pack in the repo
    python3 tools/validate.py --pack RPGDialogue_Elwynn   # report one pack (others still
                                                          # loaded for cross-pack references)
    python3 tools/validate.py --strict        # TODO ids and registry misses become errors

Checks: the data subset, TOC file lists, schema fields, unknown condition keys / effects /
tokens, duplicate IDs, unreachable nodes, nodes without an exit, nodes that can go silent,
special options without a fail branch, heardLine references (existence and key=true),
thread/claim/topic/town/origin references, TODO placeholders and IDs missing from the
capture registry, voice bibles without sources or quests, the hinge limit, reply length.
Exit code 1 if there are errors. Python 3, standard library only.
"""

import argparse
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from rpgd.luadata import LTable, TodoRef  # noqa: E402
from rpgd import packs as P  # noqa: E402

FORMAT = 1


class Report:
    def __init__(self, only=None):
        self.items, self.only = [], only

    def add(self, level, pack, file, line, msg):
        if self.only and pack and pack.addon != self.only:
            return
        where = os.path.relpath(os.path.join(pack.path, file), P.ROOT) if pack and file else (file or "")
        self.items.append((level, where, line, msg))

    def error(self, *a):
        self.add("ERROR", *a)

    def warn(self, *a):
        self.add("WARN", *a)

    def counts(self):
        e = sum(1 for i in self.items if i[0] == "ERROR")
        return e, len(self.items) - e


def sentences(text):
    return len([s for s in re.split(r"(?<=[.!?])\s+", text.strip()) if s])


def load_registry(path):
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def bible_problems(pack, rel):
    path = os.path.join(pack.path, rel)
    if not os.path.exists(path):
        return [f"voice bible {rel} doesn't exist"]
    text = open(path, encoding="utf-8").read()
    probs = []

    def section(name):
        m = re.search(r"^##\s+" + name + r".*?$(.*?)(?=^##\s|\Z)", text, re.M | re.S | re.I)
        return m.group(1) if m else None

    src = section("Sources")
    if src is None or not re.search(r"^\s*-\s+\S", src, re.M):
        probs.append(f"voice bible {rel} has no sources")
    if src is not None and re.search(r"^\s*-\s+TODO", src, re.M):
        probs.append(f"voice bible {rel} still has a TODO under Sources")
    quests = section("Their quests")
    if quests is None or not re.search(r"^\s*-\s+\S", quests, re.M):
        probs.append(f"voice bible {rel} lists no quests (write '- none: <why>' if they have none)")
    return probs


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--pack", help="only report problems in this pack (addon folder name)")
    ap.add_argument("--strict", action="store_true", help="TODO ids, registry misses and unwritten scaffolds are errors")
    ap.add_argument("--extra", action="append", default=[], help="extra folder holding packs (tests)")
    ap.add_argument("--quiet", action="store_true", help="only print the summary and errors")
    args = ap.parse_args()

    spec = P.condition_spec()
    fx_keys = P.effect_keys()
    tokens = P.token_names()
    registry = load_registry(os.path.join(P.ROOT, "tools", "registry", "ids.json"))
    rep = Report(args.pack)
    packs = P.load_all(extra_dirs=args.extra)

    # ---- pass 1: collect everything --------------------------------------------------
    npcs, pools, generic = {}, [], []
    defs = {k: {} for k in ("Thread", "Claim", "Topic", "Town", "Origin", "Rumors", "Book", "Errand")}
    key_lines, all_lines = {}, {}
    for pack in packs:
        for f, line, msg in pack.errors:
            rep.error(pack, f, line, msg)
        for f in pack.unlisted:
            rep.warn(pack, f, None, "Lua file not listed in the TOC (it will never load)")
        if pack.register is None:
            rep.error(pack, "pack.lua", None, "no RPGDialogueAPI:RegisterPack { ... } found")
        else:
            if pack.register.get("id") != pack.id:
                rep.error(pack, "pack.lua", pack.register.line, f"RegisterPack id {pack.register.get('id')!r} != X-RPGD-Pack {pack.id!r}")
            if (pack.register.get("format") or 1) > FORMAT:
                rep.error(pack, "pack.lua", pack.register.line, f"format {pack.register.get('format')} is newer than the core reads ({FORMAT})")
        if pack.meta.get("X-RPGD-Load", "zone") == "zone" and not pack.meta.get("X-RPGD-Zones"):
            rep.error(pack, pack.addon + ".toc", None, "zone pack without X-RPGD-Zones never loads")
        for kind, tbl, f, line in pack.defs:
            if kind == "NPC":
                key = tbl.get("key")
                if not isinstance(key, str):
                    rep.error(pack, f, line, "NPC without a string key")
                    continue
                if key in npcs and npcs[key][0] is pack:
                    rep.error(pack, f, line, f"NPC key {key!r} defined twice in this pack")
                npcs.setdefault(key, (pack, tbl, f, line))
                for slot, node, ln, gid in P.iter_lines(tbl, key):
                    all_lines.setdefault(gid, (pack, f, ln))
                    if ln.get("key"):
                        key_lines[gid] = True
            elif kind == "Pool":
                pools.append((pack, tbl, f, line))
                for slot, node, ln, gid in P.iter_lines(tbl, "pool:" + str(tbl.get("id"))):
                    all_lines.setdefault(gid, (pack, f, ln))
            elif kind == "Generic":
                generic.append((pack, tbl, f, line))
            elif kind in defs:
                did = tbl.get("id")
                if not did:
                    rep.error(pack, f, line, f"{kind} without id")
                elif did in defs[kind]:
                    rep.error(pack, f, line, f"{kind} {did!r} defined twice")
                else:
                    defs[kind][did] = (pack, tbl, f, line)
            else:
                rep.error(pack, f, line, f"unknown kind P:{kind}")

    todo_count = {"npc": 0, "quest": 0, "other": 0}

    # ---- helpers -------------------------------------------------------------------------
    def check_ref(pack, f, line, kind, ref, where):
        if isinstance(ref, TodoRef):
            k = "npc" if ref.kind == "TODO_NPC" else ("quest" if ref.kind == "TODO_QUEST" else "other")
            todo_count[k] += 1
            (rep.error if args.strict else rep.warn)(pack, f, ref.line or line, f"{where}: placeholder {ref!r} (needs a real ID from capture data)")
            return
        if isinstance(ref, int) and registry is not None:
            table = registry.get("npcs" if kind == "npc" else "quests", {})
            if str(ref) not in table:
                (rep.error if args.strict else rep.warn)(pack, f, line, f"{where}: {kind} ID {ref} isn't in the capture registry")

    def check_when(pack, f, owner_line, when, where):
        if when is None:
            return
        if not isinstance(when, LTable):
            rep.error(pack, f, owner_line, f"{where}: 'when' must be a table")
            return

        def visit(k, v, path):
            if k not in spec:
                rep.error(pack, f, when.line, f"{where}: unknown condition key {k!r}")
                return
            if k == "heardLine":
                if v not in all_lines:
                    rep.error(pack, f, when.line, f"{where}: heardLine {v!r} doesn't exist")
                elif v not in key_lines:
                    rep.error(pack, f, when.line, f"{where}: heardLine {v!r} must be marked key = true")
            if k.startswith("quest"):
                ref = v[1] if isinstance(v, LTable) and 1 in v else v
                check_ref(pack, f, when.line, "quest", ref, where)
            if k == "thread":
                tid = v.get("id") if isinstance(v, LTable) else None
                if tid and tid not in defs["Thread"]:
                    rep.error(pack, f, when.line, f"{where}: thread {tid!r} isn't defined")
            if k in ("heardClaim", "claimExposed", "lieCaught") and v not in defs["Claim"]:
                rep.error(pack, f, when.line, f"{where}: claim {v!r} isn't defined")
            if k == "topicKnown" and v not in defs["Topic"]:
                rep.warn(pack, f, when.line, f"{where}: topic {v!r} isn't defined")
            if k == "townStanding":
                town = v.get("town") if isinstance(v, LTable) else None
                if town and town not in defs["Town"]:
                    rep.warn(pack, f, when.line, f"{where}: town {town!r} isn't defined")
            if k == "origin" and defs["Origin"]:
                known = set()
                for _, o, _, _ in defs["Origin"].values():
                    for entry in P.arr(o.get("origins")):
                        if isinstance(entry, LTable):
                            known.add(entry.get("id"))
                for oid in (P.arr(v) if isinstance(v, LTable) else [v]):
                    if oid not in known:
                        rep.warn(pack, f, when.line, f"{where}: origin {oid!r} isn't in any origin list")

        P.walk_conditions(when, visit)
        h = P.hinges(when, spec)
        if h >= 4:
            rep.error(pack, f, when.line, f"{where}: hinges on {h} facts about the player (limit 2)")
        elif h == 3:
            rep.warn(pack, f, when.line, f"{where}: hinges on 3 facts about the player (aim for 1-2)")

    def check_fx(pack, f, line, fx, where):
        if fx is None:
            return
        if not isinstance(fx, LTable):
            rep.error(pack, f, line, f"{where}: fx must be a table")
            return
        for k, v in fx.named().items():
            if k not in fx_keys:
                rep.error(pack, f, fx.line, f"{where}: unknown effect {k!r}")
            if k == "thread":
                tid = v.get("id") if isinstance(v, LTable) else None
                if tid not in defs["Thread"]:
                    rep.error(pack, f, fx.line, f"{where}: thread {tid!r} isn't defined")
            if k == "claim":
                cid = v.get("id") if isinstance(v, LTable) else v
                if cid not in defs["Claim"]:
                    rep.warn(pack, f, fx.line, f"{where}: player claim {cid!r} isn't defined (NPCs can't check it)")
            if k in ("hear", "expose"):
                for cid in (P.arr(v) if isinstance(v, LTable) else [v]):
                    if cid not in defs["Claim"]:
                        rep.error(pack, f, fx.line, f"{where}: claim {cid!r} isn't defined")
            if k == "learn":
                for tid in P.arr(v):
                    if tid not in defs["Topic"]:
                        rep.warn(pack, f, fx.line, f"{where}: topic {tid!r} isn't defined")
            if k == "standing" and isinstance(v, LTable):
                for town in v.named():
                    if town not in defs["Town"]:
                        rep.warn(pack, f, fx.line, f"{where}: town {town!r} isn't defined")

    def check_text(pack, f, ln, where, is_choice=False):
        text = ln.get("text")
        if not isinstance(text, str) or not text.strip():
            rep.error(pack, f, ln.line, f"{where}: missing text")
            return
        for tok in re.findall(r"\{([^}]*)\}", text):
            name = tok.split(":")[0]
            if name not in tokens:
                rep.error(pack, f, ln.line, f"{where}: unknown token {{{tok}}}")
            if name == "g" and "|" not in tok:
                rep.error(pack, f, ln.line, f"{where}: gender token needs two forms: {{g:lad|lass}}")
        if is_choice:
            words = len(re.sub(r"^\[[^\]]+\]\s*", "", text).split())
            if words > 15:
                rep.warn(pack, f, ln.line, f"{where}: reply is {words} words (aim for 15 or fewer)")
        else:
            # Short fragments ("Big. Angry. Southwest.") are a voice, not a speech. Flag only
            # lines that are both many sentences and long.
            n_sent, n_words = sentences(text), len(text.split())
            if (n_sent > 3 and n_words > 30) or n_words > 50:
                rep.warn(pack, f, ln.line, f"{where}: {n_sent} sentences, {n_words} words (aim for 1-3 short sentences)")

    def check_journal(pack, f, line, j, where):
        if j is None:
            return
        if not isinstance(j, LTable) or not (j.get("first") or j.get("third")):
            rep.error(pack, f, line, f"{where}: journal needs {{ first = ..., third = ... }}")
        elif not (j.get("first") and j.get("third")):
            rep.warn(pack, f, line, f"{where}: journal has only one voice; players can pick either")

    def check_line(pack, f, ln, where, slot, ids, notices=None):
        lid = ln.get("id")
        if not lid:
            rep.error(pack, f, ln.line, f"{where}: line without id")
        elif lid in ids:
            rep.error(pack, f, ln.line, f"{where}: duplicate line id {lid!r}")
        ids.add(lid)
        check_text(pack, f, ln, f"{where}.{lid}")
        check_when(pack, f, ln.line, ln.get("when"), f"{where}.{lid}")
        check_fx(pack, f, ln.line, ln.get("fx"), f"{where}.{lid}")
        check_journal(pack, f, ln.line, ln.get("journal"), f"{where}.{lid}")
        if slot == "notice":
            cat = ln.get("cat")
            if not cat:
                rep.error(pack, f, ln.line, f"{where}.{lid}: noticing moment needs a cat (category)")
            elif notices is not None and cat not in notices:
                rep.warn(pack, f, ln.line, f"{where}.{lid}: category {cat!r} isn't in this NPC's notices list")
            if ln.get("place") not in (None, "before", "after", "replace"):
                rep.error(pack, f, ln.line, f"{where}.{lid}: place must be before/after/replace")
        if slot == "react" and ln.get("on") not in P.REACT_EVENTS:
            rep.error(pack, f, ln.line, f"{where}.{lid}: on must be one of {sorted(P.REACT_EVENTS)}")

    def check_choice(pack, f, ch, where, nodes):
        check_text(pack, f, ch, where, is_choice=True)
        check_when(pack, f, ch.line, ch.get("when"), where)
        check_fx(pack, f, ch.line, ch.get("fx"), where)
        check_journal(pack, f, ch.line, ch.get("journal"), where)
        targets = [ch.get("next")]
        if ch.get("tag") in P.SPECIAL_TAGS:
            fail = ch.get("fail")
            if not isinstance(fail, LTable):
                rep.error(pack, f, ch.line, f"{where}: [{ch.get('tag')}] needs a fail branch (failure must be possible)")
            else:
                targets.append(fail.get("next") or ch.get("next"))
                check_fx(pack, f, ch.line, fail.get("fx"), where + ".fail")
            chk = ch.get("check")
            if isinstance(chk, LTable):
                check_when(pack, f, ch.line, chk.get("pass"), where + ".check")
        for t in targets:
            if t is None:
                rep.warn(pack, f, ch.line, f"{where}: no next; it will end the conversation (write next = \"END\")")
            elif t not in ("END", "BUSINESS") and t not in nodes:
                rep.error(pack, f, ch.line, f"{where}: next {t!r} isn't a node")
        return [t for t in targets if t]

    # ---- pass 2: NPCs ------------------------------------------------------------------------
    scaffolds = 0
    for key, (pack, tbl, f, line) in sorted(npcs.items()):
        where = key
        if tbl.get("scaffold"):
            # Made by tools/new_zone.py and not written yet. The game skips it (the NPC stays
            # pooled), so only the header is checked.
            scaffolds += 1
            (rep.error if args.strict else rep.warn)(pack, f, line, f"{where}: scaffold, not written yet (remove scaffold = true when it is)")
            for field in ("id", "name", "bible", "role"):
                if tbl.get(field) is None:
                    rep.error(pack, f, line, f"{where}: missing {field}")
            if P.iter_lines(tbl, key) and any(True for _ in P.iter_lines(tbl, key)):
                rep.warn(pack, f, line, f"{where}: has lines but is still marked scaffold, so the game ignores it")
            continue
        for field in ("id", "name", "bible", "role"):
            if tbl.get(field) is None:
                rep.error(pack, f, line, f"{where}: missing {field}")
        check_ref(pack, f, line, "npc", tbl.get("id"), where)
        if tbl.get("role") and tbl.get("role") not in P.ROLES:
            rep.warn(pack, f, line, f"{where}: unusual role {tbl.get('role')!r}")
        if tbl.get("tier") and tbl.get("tier") not in P.TIERS:
            rep.error(pack, f, line, f"{where}: tier must be one of {sorted(P.TIERS)}")
        if isinstance(tbl.get("bible"), str):
            for prob in bible_problems(pack, tbl.get("bible")):
                rep.error(pack, f, line, f"{where}: {prob}")
        notices = set(P.arr(tbl.get("notices")))
        ids = set()
        for slot, node, ln, gid in P.iter_lines(tbl, key):
            check_line(pack, f, ln, f"{where}" + (f".{node}" if node else ""), slot, ids, notices)
        nodes = tbl.get("nodes").named() if isinstance(tbl.get("nodes"), LTable) else {}
        start = tbl.get("start") or "hello"
        if nodes and start not in nodes:
            rep.error(pack, f, line, f"{where}: start node {start!r} doesn't exist")
        edges = {}
        for nid, node in nodes.items():
            if not isinstance(node, LTable):
                rep.error(pack, f, line, f"{where}.{nid}: node must be a table")
                continue
            lines = [ln for ln in P.arr(node.get("lines")) if isinstance(ln, LTable)]
            if not lines:
                rep.error(pack, f, node.line, f"{where}.{nid}: node has no lines")
            elif not any(ln.get("when") is None for ln in lines) and (nid != start or not generic):
                rep.error(pack, f, node.line, f"{where}.{nid}: every line is conditional, so this node can go silent; add one line without 'when'")
            choices = [c for c in P.arr(node.get("choices")) if isinstance(c, LTable)]
            if not choices:
                rep.error(pack, f, node.line, f"{where}.{nid}: node has no choices (no exit)")
            if len(choices) > 4:
                rep.warn(pack, f, node.line, f"{where}.{nid}: {len(choices)} choices; at most 4 are shown at once")
            edges[nid] = []
            for i, ch in enumerate(choices, 1):
                edges[nid] += check_choice(pack, f, ch, f"{where}.{nid}.choice{i}", nodes)
        # reachability and exits
        seen, todo = set(), [start] if start in nodes else []
        while todo:
            n = todo.pop()
            if n in seen or n not in nodes:
                continue
            seen.add(n)
            todo += [t for t in edges.get(n, []) if t in nodes]
        for nid in nodes:
            if nid not in seen:
                rep.warn(pack, f, nodes[nid].line if isinstance(nodes[nid], LTable) else line, f"{where}.{nid}: unreachable node")
        can_exit = set()
        changed = True
        while changed:
            changed = False
            for nid, outs in edges.items():
                if nid not in can_exit and any(t in ("END", "BUSINESS") or t in can_exit for t in outs):
                    can_exit.add(nid)
                    changed = True
        for nid in seen:
            if nid not in can_exit:
                rep.error(pack, f, nodes[nid].line, f"{where}.{nid}: no path from here to END or BUSINESS")

    # ---- pools, generic, world definitions -------------------------------------------
    for pack, tbl, f, line in pools:
        pid = tbl.get("id")
        where = f"pool:{pid}"
        if not pid or not tbl.get("role"):
            rep.error(pack, f, line, f"{where}: pools need id and role")
        if tbl.get("role") and tbl.get("role") not in P.ROLES:
            rep.warn(pack, f, line, f"{where}: unusual role {tbl.get('role')!r}")
        if tbl.get("community") and tbl.get("community") not in defs["Town"]:
            rep.warn(pack, f, line, f"{where}: community {tbl.get('community')!r} isn't a defined town")
        ids = set()
        for slot, node, ln, gid in P.iter_lines(tbl, where):
            check_line(pack, f, ln, where, slot, ids)
        pool_nodes = tbl.get("nodes").named() if isinstance(tbl.get("nodes"), LTable) else {}
        for nid, i, ch in P.iter_choices(tbl):
            check_choice(pack, f, ch, f"{where}.{nid}.choice{i}", pool_nodes)
    if not generic:
        rep.error(None, "(all packs)", None, "no Generic definitions loaded: some NPCs could be silent")
    for pack, tbl, f, line in generic:
        ids = set()
        for slot, node, ln, gid in P.iter_lines(tbl, "generic:" + str(tbl.get("id"))):
            check_line(pack, f, ln, "generic:" + str(tbl.get("id")), slot, ids)

    for tid, (pack, tbl, f, line) in defs["Thread"].items():
        if not tbl.get("theme"):
            rep.warn(pack, f, line, f"thread {tid}: no one-line theme")
        ids = set()
        for i, b in enumerate(P.arr(tbl.get("beats")), 1):
            if not isinstance(b, LTable):
                continue
            where = f"thread:{tid}.{b.get('id')}"
            if b.get("npc") not in npcs:
                rep.warn(pack, f, b.line, f"{where}: npc {b.get('npc')!r} isn't loaded (beat can't fire until it is)")
            check_line(pack, f, b, f"thread:{tid}", "beat", ids)
        if len(P.arr(tbl.get("beats"))) < 3:
            rep.warn(pack, f, line, f"thread {tid}: fewer than 3 beats")
    for rid, (pack, tbl, f, line) in defs["Rumors"].items():
        ids = set()
        for ln in P.arr(tbl.get("lines")):
            if isinstance(ln, LTable):
                check_line(pack, f, ln, f"rumor:{rid}", "rumor", ids)
    for tid, (pack, tbl, f, line) in defs["Town"].items():
        for entry in P.arr(tbl.get("quests")):
            if isinstance(entry, LTable) and 1 in entry:
                check_ref(pack, f, entry.line, "quest", entry[1], f"town {tid} quests")
    for eid, (pack, tbl, f, line) in defs["Errand"].items():
        if tbl.get("npc") not in npcs:
            rep.error(pack, f, line, f"errand {eid}: npc {tbl.get('npc')!r} isn't defined")
        need = tbl.get("need")
        if not isinstance(need, LTable) or not any(k in need for k in ("visit", "item", "kill")):
            rep.error(pack, f, line, f"errand {eid}: need must be {{ visit = }} / {{ item =, count = }} / {{ kill =, count = }}")
        for k in ("offer", "thanks"):
            if not isinstance(tbl.get(k), str):
                rep.error(pack, f, line, f"errand {eid}: missing {k} text")
        check_when(pack, f, line, tbl.get("when"), f"errand {eid}")
        check_fx(pack, f, line, tbl.get("reward"), f"errand {eid}.reward")
    for bid, (pack, tbl, f, line) in defs["Book"].items():
        if not tbl.get("title"):
            rep.error(pack, f, line, f"book {bid}: needs a title (as shown in game)")
        for t in P.arr(tbl.get("topics")):
            if t not in defs["Topic"]:
                rep.warn(pack, f, line, f"book {bid}: topic {t!r} isn't defined")
    for tid, (pack, tbl, f, line) in defs["Topic"].items():
        if not tbl.get("name") or not tbl.get("category"):
            rep.error(pack, f, line, f"topic {tid}: needs name and category")
    for cid, (pack, tbl, f, line) in defs["Claim"].items():
        truth = tbl.get("truth")
        if truth not in ("true", "false", "partly", "disputed", "unknown"):
            rep.error(pack, f, line, f"claim {cid}: truth must be true/false/partly/disputed/unknown")
        if truth in ("false", "partly") and not tbl.get("exposedBy") and not tbl.get("open"):
            rep.warn(pack, f, line, f"claim {cid}: false claim with nothing that can expose it (mark open = true if deliberate)")
    for tid, (pack, tbl, f, line) in defs["Town"].items():
        if not tbl.get("name") or not P.arr(tbl.get("subzones")):
            rep.error(pack, f, line, f"town {tid}: needs name and subzones")
        rel = tbl.get("related")
        if isinstance(rel, LTable):
            for other in rel.named():
                if other not in defs["Town"]:
                    rep.warn(pack, f, line, f"town {tid}: related town {other!r} isn't defined")

    # ---- report ------------------------------------------------------------------------------
    order = {"ERROR": 0, "WARN": 1}
    for level, where, line, msg in sorted(rep.items, key=lambda i: (order[i[0]], i[1], i[2] or 0)):
        if args.quiet and level != "ERROR":
            continue
        loc = f"{where}:{line}" if line else where
        print(f"{level:5} {loc}: {msg}")
    e, w = rep.counts()
    n_npcs = sum(1 for k, v in npcs.items() if not args.pack or v[0].addon == args.pack)
    print(f"\n{len(packs)} pack(s), {n_npcs} NPC(s), {len(pools)} pool(s), {len(all_lines)} line(s). "
          f"TODO placeholders: {todo_count['npc']} NPC, {todo_count['quest']} quest, {todo_count['other']} other.")
    if scaffolds:
        print(f"Unwritten scaffold NPCs: {scaffolds}.")
    print(f"{e} error(s), {w} warning(s).")
    return 1 if e else 0


if __name__ == "__main__":
    sys.exit(main())
