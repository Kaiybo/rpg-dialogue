# RPG Dialogue: working notes

WoW (Forever, Classic-based client 1.60) addon: CRPG-style NPC conversations. Core in `RPGDialogue/`, content in `RPGDialogue_<Zone>/` packs (Lua data), shared content in `RPGDialogue_World/`.

**Read `HANDOFF.md` (short: user, current state, next step). Don't read the big docs up front.** Open only the section you need:
- `DESIGN.md`: schema (§2 nodes/lines/choices/conditions/effects), UI (§3), integrations (§8). Grep it.
- `CONTENT_GUIDE.md`: before writing dialogue, read §2 (voice) and §7a (depth standard).
- `PACK_AUTHORING.md`: only when adding a zone pack (`tools/new_zone.py`).
- `BRIEF.md`, `LORE_NOTES.md`, `CHANGELOG.md`: reference only; grep, never read whole.

## Work fast
- The user wants quick, efficient work: make the change, run the relevant check once, ship. No repeated validation passes, no full simulation unless the engine's line picking changed.
- Lua 5.1 + luacheck may need installing in a fresh container: `apt-get install -y lua5.1 luarocks && luarocks install luacheck`.
- Checks (pick what the change touches):
  - Code: `lua5.1 tests/run.lua <spec-name>` (one spec, seconds); whole suite ~2 min.
  - Content: `python3 tools/validate.py --pack RPGDialogue_X` and `python3 tools/voicecheck.py`.
  - Before a release commit: `python3 tools/check_all.py --quick` (no simulation).
- Big content passes: split by pack across parallel agents; give each the error list and the voice rules.

## Release (the user says "put it in the x.y.0 release")
1. `python3 tools/version.py set RPGDialogue x.y.z` (and `set RPGDialogue_<Pack> a.b.c` for each changed pack).
2. Add `## x.y.z (date)` to `CHANGELOG.md` (and each changed pack's own `CHANGELOG.md`): user-facing, short.
3. Update `HANDOFF.md` (state + next step only; history lives in the changelog and git).
4. `python3 tools/version.py --check`, `python3 tools/build_zip.py` (zip in `tools/out/`).
5. Commit, push to the session branch, open a draft PR.

## Rules that always hold
- Whole-sentence, natural Warcraft voice (no clipped fragments). Player replies 15 words or fewer.
- Alignment only from **stances**: statement replies with `fx.align`, at least two opposing ones per node; questions never shift alignment (engine + validator enforce, 0.33.0).
- Classic-era lore only; nothing later is foreshadowed. IDs not captured yet are `TODO_NPC`/`TODO_QUEST`.
- New files need a full game restart (not /reload); say so in the changelog.
- Don't put the model name in commits or files.
