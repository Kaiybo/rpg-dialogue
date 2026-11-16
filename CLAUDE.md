# RPG Dialogue: working notes

WoW (Forever, Classic-based client 1.60) addon: CRPG-style NPC conversations. Core in `RPGDialogue/`, content in `RPGDialogue_<Zone>/` packs (Lua data), shared content in `RPGDialogue_World/`.

**Read `HANDOFF.md` (short: user, current state, next step). Don't read the big docs up front.** Open only the section you need:
- `DESIGN.md`: schema (§2 nodes/lines/choices/conditions/effects), UI (§3), integrations (§8). Grep it.
- `CONTENT_GUIDE.md`: before writing dialogue, read §2 (voice) and §7a (depth standard).
- `PACK_AUTHORING.md`: only when adding a zone pack (`tools/new_zone.py`).
- `BRIEF.md`, `LORE_NOTES.md`, `CHANGELOG.md`: reference only; grep, never read whole.

## Work fast
- The user wants quick, efficient work: make the change and ship. **The user said (0.36.0): "in the future, lets skip all this validation bs."** Don't run the validator, the voice checker, `check_all.py`, the test suite or simulations, and don't have agents run them. The one exception: `luac5.1 -p` on Lua files you changed (seconds), because a syntax error stops the addon loading. Run a real check only when the user asks for one or something is visibly broken.
- Reference only, when the user asks: `lua5.1 tests/run.lua <spec>`, `python3 tools/validate.py --pack RPGDialogue_X`, `python3 tools/voicecheck.py` (~20 min now), `python3 tools/check_all.py --quick`.
- Big content passes: split by pack across parallel agents; give them the voice rules, and tell them not to run checks.

## Release (the user says "put it in the x.y.0 release")
1. `python3 tools/version.py set RPGDialogue x.y.z` (and `set RPGDialogue_<Pack> a.b.c` for each changed pack).
2. Add `## x.y.z (date)` to `CHANGELOG.md` (and each changed pack's own `CHANGELOG.md`): user-facing, short.
3. Update `HANDOFF.md` (state + next step only; history lives in the changelog and git).
4. `python3 tools/build_zip.py` (zip in `tools/out/`; send it to the user).
5. Commit, push to the session branch, open a draft PR.

## Rules that always hold
- Whole-sentence, natural Warcraft voice (no clipped fragments). Player replies 15 words or fewer.
- Alignment only from **stances**: statement replies with `fx.align`, at least two opposing ones per node; questions never shift alignment (engine + validator enforce, 0.33.0).
- Classic-era lore only; nothing later is foreshadowed. IDs not captured yet are `TODO_NPC`/`TODO_QUEST`.
- New files need a full game restart (not /reload); say so in the changelog.
- Don't put the model name in commits or files.
