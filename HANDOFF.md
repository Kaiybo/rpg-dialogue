# HANDOFF

> Read this first, then `DESIGN.md`, then `CONTENT_GUIDE.md` (once it exists). You won't remember earlier sessions; these files are your memory.
> The original brief is the Project doc `rpg-dialogue-build-prompt (1).md`. Re-read it when a decision isn't covered here.

**Last session:** 2026-11-13 · M0, M1 and M2 done; M3 in progress. The user said "keep going and build as much as possible", so milestones are being built back to back without stopping for in-game tests. Every assumption made in their absence is listed below.

## Assumptions made while the user was away (confirm or correct)
1. **Interface number** 16001 (from warcraft.wiki.gg, patch 1.60.1). TOCs say `16001, 16002` to cover the next patch too.
2. **Vertical slice:** Northshire Valley + Goldshire (Elwynn Forest).
3. **Test character:** unknown. The class-trainer requirement is covered with Llane Beshere (warrior) for now; add the user's class trainer when known.
4. **Name and license:** "RPG Dialogue", MIT.
5. **Visual style:** the brief's example, "parchment and dark wood, very readable, uncluttered" (built from color textures, no art files).
6. **Where the code lives:** zips per milestone plus the docs in this Project. No GitHub repo was set up.
7. **Commit identity:** placeholder `RPG Dialogue Dev <rpg-dialogue@users.noreply.localhost>`.
8. **DESIGN.md §6 decisions accepted** as written. One change: TODO-id NPCs are matched by name at runtime always (not only in dev mode), so the slice is testable before capture data exists. The validator still flags every TODO.
9. **Other dialogue addons:** RPG Dialogue steps back by default.

## Done
- **M0**: `DESIGN.md`, repo, hand-off docs.
- **M1** (commit ca4b8df): core skeleton. Compat layer, SavedData (migrations, non-destructive repair, newer-schema read-only), Trackers (turn-ins, deaths with inferred cause, deeds, books, home inn, drunk), lazy Context with spoofing, capture + text capture, slash commands, `.luacheckrc`, `.pkgmeta`, link scripts, README, LICENSE.
- **M2** (commit 970a05e): engine (Conditions, Pacing, Memory, Effects, Tokens, Engine), PackAPI (`RPGDialogueAPI`), Conversation controller, UI (dialogue window, compact bar, blocker, settings, launcher), other-addon handling, `/rpgd why`, flag button, `tools/rpgd/luadata.py`, `tools/validate.py`.
- Tests: `lua5.1 tests/run.lua` gives 60 passing (mock client in `tests/wowmock.lua`, fixture packs in `tests/fixtures/`). `luacheck .` is clean.

## Half-done
- **M3** (vertical-slice content and content tools): see the task list in the last session; check `git log` for what landed.

## Not yet verified in game (nothing has been run in WoW yet)
- Every Blizzard API assumption in `Compat.lua` (probe with `/rpgd probe`).
- Fading GossipFrame/QuestFrame with `SetAlpha` and covering it with our own mouse blocker: check for taint (`/console taintLog 1`, then look in `Logs/taint.log`).
- Keyboard capture (`SetPropagateKeyboardInput` inside OnKeyDown).
- Fonts (`Fonts\\MORPHEUS.TTF`, `Fonts\\FRIZQT__.TTF`, `Fonts\\ARIALN.TTF`) and textures used by the settings panel and launcher.
- The `.pkgmeta` move-folders layout (M8).

## Open questions for the user
Still all of DESIGN.md §4 (section 9 answers, slice zone, where the repo lives, commit identity, probe output, §6 OK), plus the assumptions above.

## Known bugs
- None known. Untested in game.

## Environment notes
- The cloud workspace had Lua 5.1, luac5.1, LuaRocks and luacheck installed by hand (`apt-get install lua5.1 luarocks liblua5.1-0-dev && luarocks install luacheck`), plus Python 3. A new session may need to reinstall them.
- The repo was at `/home/claude/rpg-dialogue`. That workspace isn't shared with other sessions; the user has the zips.

## Exact next step
Finish M3 (see CHANGELOG for what's in). Then M4: threads engine and pacing, claims and topics UI ("Ask about…"), town standing reactions, innkeeper rumors, finishing the slice's thread/agenda/topic/special-option/rumor items.
