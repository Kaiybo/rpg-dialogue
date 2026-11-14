# HANDOFF

> Read this first, then `DESIGN.md`, then `CONTENT_GUIDE.md` (and `PACK_AUTHORING.md` before adding a zone). You won't remember earlier sessions; these files are your memory.
> The original brief is the Project doc `rpg-dialogue-build-prompt (1).md`. Re-read it when a decision isn't covered here.

**Last session:** 2026-11-13 · **M0–M8 all built; first in-game results are in.** The addon loads, packs load, `/rpgd why` works, and the Skyborne race token is "Skyborne".

**First in-game test (user, 2026-11-13):**
- **Test character: Skyborne Druid, level 22 (Blooded), Alliance side, tested in Northshire Valley.** Content for that character is thin: the slice is written for level 1–10 characters doing Northshire/Goldshire quests (only 4 Skyborne lines and 1 druid line exist). Asked the user where they actually play, for the next content pass.
- `/rpgd probe`: everything present except the legacy globals `IsQuestFlaggedCompleted`, `UnitBuff`, `InterfaceOptions_AddCategory` (expected; Compat uses `C_QuestLog`, `C_UnitAuras`, `Settings` first).
- The compact bar's **Talk button "did nothing"**. Their `/rpgd why` shows the engine picked McBride's node line after the click, so the full window most likely errored while drawing (Lua errors are hidden by default in WoW). Not reproduced in the mock. Added `ns.Guard` around every conversation entry point: errors now print in chat and the game's window comes back. **Next step: get that chat line from the user.**
- The user wants **a box that opens automatically on right-click with the options right away**. Done: the full box is now the default every time (schema 2 migration), and it lists the NPC's quests and gossip options, handing the pick to the game's window (DESIGN §3.6).

## Assumptions made while the user was away (confirm or correct)
1. **Interface number** 16001 (from warcraft.wiki.gg, patch 1.60.1). TOCs say `16001, 16002` to cover the next patch too.
2. **Vertical slice:** Northshire Valley + Goldshire (Elwynn Forest).
3. **Test character:** now known (Skyborne Druid 22). The class-trainer requirement was covered with Llane Beshere (warrior); a druid trainer belongs wherever the user plays.
4. **Name and license:** "RPG Dialogue", MIT.
5. **Visual style:** the brief's example, "parchment and dark wood, very readable, uncluttered" (built from color textures, no art files).
6. **Where the code lives:** zips per milestone plus the docs in this Project. No GitHub repo was set up (the workflows in `.github/` are ready for when one is).
7. **Commit identity:** placeholder `RPG Dialogue Dev <rpg-dialogue@users.noreply.localhost>`.
8. **DESIGN.md §6 decisions accepted** as written. One change: TODO-id NPCs are matched by name at runtime always (not only in dev mode), so the slice is testable before capture data exists. The validator still flags every TODO.
9. **Other dialogue addons:** RPG Dialogue steps back by default.
10. **Total RP 3:** name and title both on by default when it's loaded ("Sir Aldric": title + first name).
11. **Readable font:** bundled Atkinson Hyperlegible (SIL OFL 1.1). Names also switch to it when the readable font is on.
12. **Per-pack versions:** each pack keeps its own version in `pack.lua` plus a `CHANGELOG.md` in its folder; the TOC `## Version` is the release build.
13. **"Something new" tooltip marker:** first meetings don't count as "new" (only unheard news lines and thread beats).

## Done
- **M0** (ab8479c): `DESIGN.md`, repo, hand-off docs.
- **M1** (ca4b8df): core skeleton. Compat layer, SavedData (migrations, non-destructive repair, newer-schema read-only), Trackers, lazy Context with spoofing, capture + text capture, slash commands, `.luacheckrc`, `.pkgmeta`, link scripts.
- **M2** (970a05e): engine, PackAPI (`RPGDialogueAPI`), Conversation controller, UI (dialogue window, compact bar, blocker, settings, launcher), other-addon handling, `/rpgd why`, flag button, validator.
- **M3** (d49bd0a): World + Elwynn packs (13 NPCs, voice bibles, guard pools, towns, topics, claims, the `elwynn_gold` thread, draft human origins), `CONTENT_GUIDE.md`, `banned_phrases.txt`, slice lore sheet, voice checker, simulation, coverage, capture importer, reference export, flag report.
- **M4** (e36aef0): threads, Ask about, gossip/contradiction/lies, rumors, town standing, alignment hints.
- **M5** (f1ec319): journal (6 tabs), origins (drafts for human, dwarf, gnome, night elf, Skyborne), export/import.
- **M6** (979fcc5): spirit healer tree, books, insanity, drunk replies, ghosts, barks, errands.
- **M7** (bbefce7): `tools/new_zone.py` (plan → approve tiers → scaffold), `tools/check_all.py`, impossible-quest-reference check, copied-wording check, flag replay lines, `/rpgd capture zone`, `tests/test_tools.py`.
- **M8** (c2e6a2e): Total RP 3 (read-only), accessibility pass (keyboard selection, gamepad, Ask About keybinding, bundled readable font, "(Locked)" and ">" markers, journal tab keys), the optional "something new" tooltip marker (an M2 item that had been missed), pack `requires` reported in game and validated, per-pack versions and changelogs, `PACK_AUTHORING.md`, `.pkgmeta` checked against the packager's source, Blizzard UI policy checked and enforced by `check_all.py --release`, GitHub workflows, README rewrite.
- **After the first in-game test:** 125 Lua tests (new `tests/ux_spec.lua`). **Checks at the end of M8:** 118 Lua tests, 7 Python tool tests, luacheck clean, validator 0 errors (101 warnings, all TODO placeholders), voice check 0 failures, simulation 0 runtime errors / 0 contradictions / 0 impossible quest references.

## Half-done
- Nothing half-built. `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Needs the user's approval
- Origin lists (brief M5 says "for my approval"): `RPGDialogue_World/origins/*.lua`. Horde races have none yet (no Horde content exists yet either).
- Assumptions 10–13 above (new this session).

## Not yet verified in game (nothing has been run in WoW yet)
- Every Blizzard API assumption in `Compat.lua` (probe with `/rpgd probe`).
- Fading GossipFrame/QuestFrame with `SetAlpha` and covering it with our own mouse blocker: check for taint (`/console taintLog 1`, then `Logs/taint.log`).
- Keyboard capture (`SetPropagateKeyboardInput` inside OnKeyDown), now including arrow keys and Tab.
- Gamepad (`EnableGamePadButton`, `OnGamePadButtonDown`, `C_GamePad.IsEnabled`).
- The bundled font path loading (`Interface\AddOns\RPGDialogue\Media\Fonts\AtkinsonHyperlegible-Regular.ttf`).
- `TooltipDataProcessor.AddTooltipPostCall` for the tooltip marker.
- Total RP 3's `AddOn_TotalRP3.Player.GetCurrentUser()` and its `GetFirstName` / `GetTitle` / `GetRoleplayingName` methods (method names are from TRP3's public player object as other addons use it; not read from TRP3's source).
- A real tagged build with the BigWigs packager (the `.pkgmeta` was checked by reading the packager's code; running it here was not allowed).

## In-game test checklist (for the user)
Install by linking or copying `RPGDialogue`, `RPGDialogue_World`, `RPGDialogue_Elwynn` into AddOns. Have BugSack + !BugGrabber on. Paste back every error, plus the outputs asked for.
1. Log in. Expect "RPG Dialogue loaded". Run `/rpgd probe` and paste the output.
2. `/rpgd packs`: World loaded; Elwynn "waiting for zone" outside Elwynn, "loaded" inside it.
3. `/console taintLog 1`, then reload. Talk to Marshal McBride (Northshire Abbey): our window opens in front of Blizzard's. Try 1–4, Up/Down + Enter, Space, Escape. "Get on with it" must leave Blizzard's quest window working normally. Later, send `Logs/taint.log` if it mentions RPGDialogue.
4. `/rpgd why` after any line, and paste it once.
5. Talk to McBride again: a short compact bar this time. Click Talk for the full window.
6. Accept and turn in a quest (Kobold Camp Cleanup or A Threat Within), then talk to McBride and Willem: they should react. `/rpgd capture zone` and paste it.
7. Goldshire: Marshal Dughan, Innkeeper Farley (rumors), Remy. Use Ask about... (button or the new keybinding) on a topic you've learned.
8. A vendor and a flight master: compact line, normal window right away.
9. Settings > AddOns > RPG Dialogue: try text size, readable font (does the new font show?), reduce motion, high contrast, gamepad (if you play with one: D-pad, A, B, X in a conversation).
10. If you use Total RP 3: does McBride call you by your roleplay name and title?
11. Turn on "Mark NPCs who have something new to say", then hover McBride after turning in a quest: tooltip line?
12. Die once (fall from somewhere safe), then talk to the spirit healer as a ghost.
13. `/rpgd journal`: tabs with Left/Right, Escape closes.
14. Use the flag button on any line that feels wrong, with a short note.
15. Send `WTF/Account/<ACCOUNT>/SavedVariables/RPGDialogue.lua` (capture data and flags; it holds no personal data beyond what NPCs and quests you met) and, if something about memory looked wrong, `WTF/Account/<ACCOUNT>/<Realm>/<Character>/SavedVariables/RPGDialogue.lua`.

## Open questions for the user
Still all of DESIGN.md §4 (section 9 answers, slice zone, where the repo lives, commit identity, probe output, §6 OK), plus the assumptions above.

## Known bugs
- None known. Untested in game.

## Environment notes
- The cloud workspace had Lua 5.1, luac5.1, LuaRocks and luacheck installed by hand (`apt-get install lua5.1 luarocks liblua5.1-0-dev && luarocks install luacheck`), plus Python 3. A new session may need to reinstall them.
- The repo was at `/home/claude/rpg-dialogue`. That workspace isn't shared with other sessions; the user has the zips.
- `python3 tools/check_all.py` runs everything (about a minute); `--quick` skips the simulation.

## Exact next step
Ask the user to retest: right-click McBride, a vendor and a quest giver; paste any "Something went wrong" chat line; check the box lists their quests and that picking one opens the quest. Fix whatever error the safety net reports (start with `UI/DialogueFrame.lua` D.Show/create). Then plan content for where the Skyborne druid actually plays (ask which zones), plus Skyborne and druid reactions across the existing NPCs (only facts from brief §10 for Skyborne).

Before that, the original plan was: wait for the user's in-game results (checklist above). Fix every error they paste, starting with `/rpgd probe` output against `Compat.lua`. Then: import their capture file (`tools/import_capture.py <file> --resolve`), rerun `tools/check_all.py`, and fix whatever the real IDs reveal. After that, new zones follow `PACK_AUTHORING.md` §4.
