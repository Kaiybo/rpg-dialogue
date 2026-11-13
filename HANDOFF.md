# HANDOFF

> Read this first, then `DESIGN.md`, then `CONTENT_GUIDE.md` (once it exists). You won't remember earlier sessions; these files are your memory.
> The original brief is the Project doc `rpg-dialogue-build-prompt (1).md`. Re-read it when a decision isn't covered here.

**Last session:** 2026-11-13 · Milestone 0 (design) · stopped on purpose, waiting for the user's answers

## Done
- `DESIGN.md`: folder structure, data schema with a complete example NPC (Marshal McBride), engine scoring with example weights, what we need from the user, risks and API unknowns, decisions open to veto, and the M1 plan.
- Research (warcraft.wiki.gg): Forever runs on Mainline's 12.1.5-era API with Midnight's restrictions on combat data (secret values) active. TOC interface 16001 for patch 1.60.1. `_Forever.toc` is a valid suffix. Creature GUIDs have obfuscated server/spawn parts. Details and sources are in DESIGN.md §0.
- Git repository initialized; M0 committed.
- `CHANGELOG.md` and `LORE_NOTES.md` started.
- The example NPC file was syntax-checked with `luac5.1 -p` and run through a stub of the pack API: no unknown condition keys, at most 2 player hinges per line, every choice leads somewhere, no banned phrases. The six probe lines are under 255 characters.

## Half-done
- Nothing. No addon code exists yet.

## Open questions (all in DESIGN.md §4)
1. Section 9 of the brief is unfilled: interface number, test characters, error addons, where we work, Python, other addons, name/license, extra lore, visual style.
2. Vertical-slice zone (Northshire + Goldshire assumed in the example).
3. Where the repo lives between sessions: GitHub (recommended), the desktop-app link, or zips.
4. Git commit identity. M0 used a placeholder: `RPG Dialogue Dev <rpg-dialogue@users.noreply.localhost>`.
5. Output of the six-line in-game API probe (P1–P6).
6. OK or changes on the DESIGN.md §6 decisions, including the one public global `RPGDialogueAPI`.

## Known bugs
- None (no code).

## Environment notes for the next session
- The cloud workspace used for M0 had Lua 5.1.5, luac5.1, LuaRocks and luacheck 1.2.0 installed by hand (`apt-get install lua5.1 luarocks liblua5.1-0-dev`, then `luarocks install luacheck`), plus Python 3.13. A new session may need to reinstall them.
- The repo is at `/home/claude/rpg-dialogue` in the M0 workspace. That workspace isn't shared with other sessions, which is why open question 3 matters.

## Exact next step
When the user answers: update DESIGN.md (§0 interface number and probe results, §4 answered items, §5 risks resolved or changed, §6 decisions confirmed), commit, then build **M1** as listed in DESIGN.md §7. Stop after M1 with the in-game test checklist and the exact things to paste back.
