# HANDOFF

> Read this first, then `DESIGN.md`, then `CONTENT_GUIDE.md` (once it exists). You won't remember earlier sessions; these files are your memory.
> The original brief is the Project doc `rpg-dialogue-build-prompt (1).md`. Re-read it when a decision isn't covered here.

**Last session:** 2026-11-13 · M0–M7 done; M8 next. The user said "keep going and build as much as possible", so milestones are being built back to back without stopping for in-game tests. Every assumption made in their absence is listed below.

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

- **M3** (commit d49bd0a): World pack + Elwynn pack (13 NPCs, voice bibles, guard pools, towns, topics, claims, the `elwynn_gold` thread, draft human origins), `CONTENT_GUIDE.md`, `banned_phrases.txt`, slice lore sheet, and tools: `voicecheck.py`, `simulate.py` (+ `tests/sim_driver.lua`), `coverage.py`, `import_capture.py`, `export_reference.py`, `flag_report.py`.
- Checks at the end of M3: 65 Lua tests pass; `luacheck .` clean; validator 0 errors (76 warnings, all TODO placeholders); voice check 0 failures; simulation of 2,000 characters × 3 visits: 0 runtime errors, 7 of 306 lines never fire (all explained in `tools/out/simulation.md`).

- **M4** (commit e36aef0): thread engine (`Systems/Threads.lua`), Ask about (`Systems/Topics.lua`, `UI/AskAbout.lua`), gossip/contradiction/lieCaught conditions, rumors (`Systems/Rumors.lua`, `RPGDialogue_World/rumors/elwynn.lua`), town standing (`Systems/Towns.lua`), alignment hints, `/rpgd threads|claims|topics|die`. 78 tests; simulation fires all four beats.

- **M5** (commit f1ec319): journal window (6 tabs), origins (picker, hint, nudge, home welcome; draft lists for human, dwarf, gnome, night elf, Skyborne in `RPGDialogue_World/origins/`), export/import. 86 tests.

- **M6**: spirit healer tree (World `pools.lua`), books (`books.lua`), insanity, barks, errands (`RPGDialogue_Elwynn/errands.lua`), ghosts, drunk replies. 96 tests.
- **M7**: `tools/new_zone.py` (plan → approve tiers → scaffold), `tools/check_all.py` (every check in one command; `--release`), impossible-quest-reference check in the simulation, copied-wording check in the voice checker, flag replay lines, `/rpgd capture zone`, `tests/test_tools.py`.

## Half-done
- Nothing half-built.

## Needs the user's approval
- Origin lists (brief M5 says "for my approval"): `RPGDialogue_World/origins/*.lua`. Horde races have none yet (no Horde content exists yet either).

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
M8 (Total RP 3 read-only name, accessibility pass, `PACK_AUTHORING.md`, packaging check, Blizzard UI add-on policy check). Then: **the user's in-game test pass** (see the checklist in the final message of the session and in README).
