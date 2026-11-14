# HANDOFF

> Read this first, then `DESIGN.md`, then `CONTENT_GUIDE.md` (and `PACK_AUTHORING.md` before adding a zone). You won't remember earlier sessions; these files are your memory.
> The original brief is the Project doc `rpg-dialogue-build-prompt (1).md`. Re-read it when a decision isn't covered here.

**Last session:** 2026-11-13 · **M0–M8 all built; three rounds of in-game results are in.** The addon loads, packs load, `/rpgd why` works, and the Skyborne race token is "Skyborne". **Versions now: core 0.11.0, World 1.0.0, Elwynn 1.1.0** (`python3 tools/version.py`).

**First in-game test (user, 2026-11-13):**
- **Test character: Skyborne Druid, level 22 (Blooded), faction not confirmed, tested in Northshire Valley.** Content for that character is thin: the slice is written for level 1–10 characters doing Northshire/Goldshire quests (only 4 Skyborne lines and 1 druid line exist). Asked the user where they actually play, for the next content pass.
- `/rpgd probe`: everything present except the legacy globals `IsQuestFlaggedCompleted`, `UnitBuff`, `InterfaceOptions_AddCategory` (expected; Compat uses `C_QuestLog`, `C_UnitAuras`, `Settings` first).
- The compact bar's **Talk button "did nothing"**. Their `/rpgd why` shows the engine picked McBride's node line after the click, so the full window most likely errored while drawing (Lua errors are hidden by default in WoW). Not reproduced in the mock. Added `ns.Guard` around every conversation entry point: errors now print in chat and the game's window comes back. **Next step: get that chat line from the user.**
- **Second test:** the safety net caught the drawing bug: "FontString:SetText(): Font not set" (text set before any font; the real client refuses, the mock didn't). Fixed: font objects at creation, and the mock now enforces it.
- **The user asked for Melika Isenstrider** (Assistant Innkeeper, Lion's Pride Inn; no gossip menu) **to open the box on right-click, and NPCs with a gossip menu to use that menu.** Done: WorldFrame click hooks (DESIGN §3.6 "Right-click talk"), and Melika's bible and NPC file (Elwynn 1.1.0). For gossip NPCs the box opens with the game's window and lists its options; asked the user whether they'd rather keep the plain game window for those.
- The user wants **a box that opens automatically on right-click with the options right away**. Done: the full box is now the default every time (schema 2 migration), and it lists the NPC's quests and gossip options, handing the pick to the game's window (DESIGN §3.6).
- **Third test (screenshot of Melika's box):** "Looks good!" (taken as: keep the box for gossip NPCs too). But she showed **innkeeper pool lines, not her own**: her new file wasn't loaded because WoW reads a TOC's file list only at game start, and the user had /reloaded. Added a version and file-list mismatch check that says "exit and restart the game".
- The user then asked to **choose the font, polish the visuals, and put version numbers on the folders**. Done (CHANGELOG 0.9.0 "Fonts, look and version numbers"):
  - Two font pickers with a sample line (Settings: "Font for what people say", "Font for names"); seven built-in choices plus SharedMedia fonts; Crimson Pro and Cinzel bundled (OFL). Schema 3 migration replaces `readableFont` with `fontBody` / `fontName`. Code: `UI/Theme.lua` `FONT_LIST`, `SetFont`.
  - Polish: shadow, gradient parchment, brass trim, framed portrait, rules, reply rows with hover band and accent stripe, themed buttons everywhere, game quest and option icons (atlases, with a blank fallback), fade-in.
  - Versions in the AddOns list title (grey), TOC `## Version`, `/rpgd packs`, settings header, login line. `tools/version.py` keeps TOC, code and changelogs in step; `tools/build_zip.py` builds `tools/out/RPGDialogue-<ver>.zip` and refuses on a mismatch. When bumping: `python3 tools/version.py set <folder> <x.y.z>`, then add the changelog heading.

- **Then: "If possible, can it become closer to WoW's original style?"** Read as: look like the game's own quest and gossip windows. Done in 0.10.0 (DESIGN §3.10): a "game" look (new default) built at runtime from the client's own art, found in Blizzard's 12.1.5 UI code (cloned the public `Gethe/wow-ui-source` mirror to read `GossipFrame.xml`, `SharedUIPanelTemplates.xml`, `NineSliceLayouts.lua`, `QuestUtils.lua`...). The 0.9.0 look stays as "Parchment and dark wood". Told the user that if they meant the 2004 classic look specifically, that can be a third style. No preview image was possible (the art lives in the client).
- **Fourth test (screenshot, 0.10.0 game style working: metal frame, round portrait, title, parchment, speech bubbles, red buttons):** "Could use a bit of tweaking." **The user switched to a new Human Paladin level 1** (their main is being moved) and Melika gave the innkeeper pool's lines ("Work's work...", "A room, please.") where the druid had her full dialogue. Cause found in code: zone packs loaded only at PLAYER_LOGIN and ZONE_CHANGED_NEW_AREA; a new character's first login doesn't know its zone at PLAYER_LOGIN, and Northshire → Goldshire is the same zone. Fixed in 0.10.1 (all zone events, plus a load check in `Conv.Identify`); test reproduces it. Not confirmed in game yet: if it recurs, ask for `/rpgd packs` and check the AddOns list's per-character enable state.
  - Tweaks chosen from the screenshot (the user gave no specifics): Ask list rebuilt like the box (title bar, close, header search, inset parchment, same height as the box, rows that fit), journal and export the same frame, parchment cropped at its own proportions instead of squashed (`Theme.FitPaper`), more right padding. Asked the user to name anything else.
- **Fifth test:** "Going outside and then back in fixed it" (Melika's lines; confirms the zone-load diagnosis, fixed in 0.10.1). Two screenshots side by side, the game's own gossip window for Innkeeper Farley and ours: **"The text is too big, it doesn't have open space."** (Their client numbers gossip options "1." too.) And: **"have it work with DialogueUI"** (they use it).
  - 0.10.2: the game look now copies GossipFrame's measurements (338 × 496 minimum, text 270 wide at 18, −75, quest font size 13 at the default setting, 15-pixel spacer, 300-wide rows). DESIGN §3.10.
  - 0.10.2: DialogueUI works together (default "auto"): our box first over its window (alpha pinned at 0, covered, never hidden), keys kept from its TOOLTIP-strata listener, our windows parentless so its "hide the game UI" can't hide them, hand-over on Get on with it / game option. Read from its public source (cloned `Peterodox/YUI-Dialogue`, untrusted, read only). DESIGN §8 "DialogueUI". Immersion still steps back (its code not studied).

- **Then: "just add font and text size options. The text is still too bold."** (They existed, in Settings > Accessibility, apparently not found.) 0.10.3: an "Aa" button in the box's title bar (`UI/TextOptions.lua`: size, spacing, text font, name font, live); a "Look and text" section at the top of settings. "Bold" cause: every FontString was created from GameFontHighlight, which has a drop shadow; `Theme.SetFont` now clears it (the title bar turns it back on). Text size default 13 with no hidden offset (schema 6 moves 14 → 13).

- **Then: "when I open a gossip option then it opens a different dialogue box. Ideally things should stay on the same box, be it the UI we made, or dialogueui. If it is dialogueui, then I want the ui to entirely be dialogueui."** 0.11.0: (1) the game's next pages (gossip, quest offer / progress / reward) render in our box after a pick (`Conv.ShowGamePage`, setting `pagesInBox`); (2) with DialogueUI, conversations render inside its window (`Integrations/DialogueUIView.lua`, wrapping its handlers; read from its source, untested against the real addon), falling back to our box. DESIGN §8.

## Assumptions made while the user was away (confirm or correct)
1. **Interface number** 16001 (from warcraft.wiki.gg, patch 1.60.1). TOCs say `16001, 16002` to cover the next patch too.
2. **Vertical slice:** Northshire Valley + Goldshire (Elwynn Forest).
3. **Test character:** now known (Skyborne Druid 22). The class-trainer requirement was covered with Llane Beshere (warrior); a druid trainer belongs wherever the user plays.
4. **Name and license:** "RPG Dialogue", MIT.
5. **Visual style:** now the game's own window art by default (user asked for "closer to WoW's original style"); the brief's example "parchment and dark wood" remains as the other style.
6. **Where the code lives:** zips per milestone plus the docs in this Project. No GitHub repo was set up (the workflows in `.github/` are ready for when one is).
7. **Commit identity:** placeholder `RPG Dialogue Dev <rpg-dialogue@users.noreply.localhost>`.
8. **DESIGN.md §6 decisions accepted** as written. One change: TODO-id NPCs are matched by name at runtime always (not only in dev mode), so the slice is testable before capture data exists. The validator still flags every TODO.
9. **Other dialogue addons:** "auto" by default: together with DialogueUI (the user uses it), steps back for Immersion.
10. **Total RP 3:** name and title both on by default when it's loaded ("Sir Aldric": title + first name).
11. **Fonts:** Friz Quadrata for text; names "the window's own" (Friz in the game look's title bar, Morpheus on wood; schema 4 moved the old Morpheus default to it). Bundled, all SIL OFL 1.1: Atkinson Hyperlegible, Crimson Pro, Cinzel. Users who had the old readable font on get Atkinson for text and "same" for names.
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
- **After the in-game tests:** box every visit with the game's options, safety net, right-click talk, Melika, fonts, polish, versions. **Checks now:** 169 Lua tests (new `tests/ux_spec.lua`, `tests/look_spec.lua`, `tests/dialogueui_spec.lua`, `tests/pages_spec.lua`), 8 Python tool tests, luacheck clean, validator 0 errors (106 warnings, all TODO placeholders), voice check 0 failures, simulation 0 runtime errors / 0 contradictions / 0 impossible quest references.
- Earlier: **Checks at the end of M8:** 118 Lua tests, 7 Python tool tests, luacheck clean, validator 0 errors (101 warnings, all TODO placeholders), voice check 0 failures, simulation 0 runtime errors / 0 contradictions / 0 impossible quest references.

## Half-done
- Nothing half-built. `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Needs the user's approval
- Origin lists (brief M5 says "for my approval"): `RPGDialogue_World/origins/*.lua`. Horde races have none yet (no Horde content exists yet either).
- Assumptions 10–13 above (new this session).

## Not yet verified in game
- Confirmed so far: loading, pack discovery, the engine and `/rpgd why`, race/class/level context, the probe list.
- The rest of `Compat.lua`'s assumptions, beyond what `/rpgd probe` lists.
- Fading GossipFrame/QuestFrame with `SetAlpha` and covering it with our own mouse blocker: check for taint (`/console taintLog 1`, then `Logs/taint.log`).
- Keyboard capture (`SetPropagateKeyboardInput` inside OnKeyDown), now including arrow keys and Tab.
- Gamepad (`EnableGamePadButton`, `OnGamePadButtonDown`, `C_GamePad.IsEnabled`).
- The bundled font paths loading (`Interface\AddOns\RPGDialogue\Media\Fonts\*.ttf`), and the sizes looking even across fonts (scales in `Theme.FONT_LIST`).
- Right-click talk: the `WorldFrame` OnMouseDown/OnMouseUp hooks, and that the box never races a game window.
- `Texture:SetGradient` with `CreateColor` (fallbacks exist) and the fade-in animation.
- The game look (0.10.0): `NineSliceUtil.ApplyLayoutByName` on our own frames, the inset child with `SetUsingParentLevel`, the round portrait mask, the title text above the metal title bar, `RedButton-Exit` atlases, `Interface\GossipFrame\GossipGossipIcon`, `QuestUtil` quest icons, `GetMaterialTextColors`, the `questTextContrast` CVar, clamp insets. All read from Blizzard's 12.1.5 code, none seen running. If it looks wrong, `look = "wood"` is one click away in settings.
- Inside DialogueUI (0.11.0): wrapping DUIQuestFrame's handler fields, its pooled parts and `SetGossip` with our `onClickFunc`, `SetIndexedAction` on its key listener, the restore via `f[f.handler](f, true)`. Written against its 1.0.7 source; a stand-in in `tests/dialogueui_spec.lua` mimics its methods.
- Quest pages in the box (0.11.0): `GetQuestItemInfo`, `GetQuestReward`, `AcceptQuest`, `CompleteQuest`, `GameTooltip:SetQuestItem`, `C_CurrencyInfo.GetCoinTextureString`.
- DialogueUI together (0.10.2): `hooksecurefunc(DUIQuestFrame, "SetAlpha")` holding it at 0 through its intro animation; our key listener (TOOLTIP strata, level 9000) getting keys before DialogueUI's (assumed: keyboard goes to the topmost keyboard-enabled frame first); parentless windows' scale (`UIParent:GetScale()` × ours); the blocker at FULLSCREEN over its DIALOG-strata window; its camera with our box on top.
- `TooltipDataProcessor.AddTooltipPostCall` for the tooltip marker.
- Total RP 3's `AddOn_TotalRP3.Player.GetCurrentUser()` and its `GetFirstName` / `GetTitle` / `GetRoleplayingName` methods (method names are from TRP3's public player object as other addons use it; not read from TRP3's source).
- A real tagged build with the BigWigs packager (the `.pkgmeta` was checked by reading the packager's code; running it here was not allowed).

## In-game test checklist (for the user)
Install by linking or copying `RPGDialogue`, `RPGDialogue_World`, `RPGDialogue_Elwynn` into AddOns. Have BugSack + !BugGrabber on. Paste back every error, plus the outputs asked for.
1. Log in. Expect "RPG Dialogue loaded". Run `/rpgd probe` and paste the output.
2. `/rpgd packs`: World loaded; Elwynn "waiting for zone" outside Elwynn, "loaded" inside it.
3. `/console taintLog 1`, then reload. Talk to Marshal McBride (Northshire Abbey): our window opens in front of Blizzard's. Try 1–4, Up/Down + Enter, Space, Escape. "Get on with it" must leave Blizzard's quest window working normally. Later, send `Logs/taint.log` if it mentions RPGDialogue.
4. `/rpgd why` after any line, and paste it once.
5. Talk to McBride again: the box opens again (short-line bar only if "When you talk to someone" is set to it).
6. Accept and turn in a quest (Kobold Camp Cleanup or A Threat Within), then talk to McBride and Willem: they should react. `/rpgd capture zone` and paste it.
7. Goldshire: Marshal Dughan, Innkeeper Farley (rumors), Remy. Use Ask about... (button or the new keybinding) on a topic you've learned.
8. A vendor and a flight master: the box lists their options (with the game's icons); picking one opens the game's window.
9. Settings > AddOns > RPG Dialogue: try text size, both font pickers (does each font show, at an even size?), reduce motion, high contrast, gamepad (if you play with one: D-pad, A, B, X in a conversation).
10. If you use Total RP 3: does McBride call you by your roleplay name and title?
11. Turn on "Mark NPCs who have something new to say", then hover McBride after turning in a quest: tooltip line?
12. Die once (fall from somewhere safe), then talk to the spirit healer as a ghost.
13. `/rpgd journal`: tabs with Left/Right, Escape closes.
14. Use the flag button on any line that feels wrong, with a short note.
15. Send `WTF/Account/<ACCOUNT>/SavedVariables/RPGDialogue.lua` (capture data and flags; it holds no personal data beyond what NPCs and quests you met) and, if something about memory looked wrong, `WTF/Account/<ACCOUNT>/<Realm>/<Character>/SavedVariables/RPGDialogue.lua`.

## Open questions for the user
Still all of DESIGN.md §4 (section 9 answers, slice zone, where the repo lives, commit identity, probe output, §6 OK), plus the assumptions above.

## Known bugs
- Fixed (second test): the conversation window didn't draw ("Font not set"). Confirmed fixed in the third test (the box drew).
- Not a bug, but easy to hit: after installing a new version, /reload isn't enough when files were added. The addon now warns.

## Environment notes
- The cloud workspace had Lua 5.1, luac5.1, LuaRocks and luacheck installed by hand (`apt-get install lua5.1 luarocks liblua5.1-0-dev && luarocks install luacheck`), plus Python 3. A new session may need to reinstall them.
- The repo was at `/home/claude/rpg-dialogue`. That workspace isn't shared with other sessions; the user has the zips.
- Only this HANDOFF is kept in step in the Project. The Project's `DESIGN.md`, `CONTENT_GUIDE.md` and `PACK_AUTHORING.md` are older copies; the ones in the latest repo zip (`rpg-dialogue-repo-<version>.zip`) are current (DESIGN §3.6 right-click talk and safety net, §3.10 window style).
- `python3 tools/check_all.py` runs everything (about a minute); `--quick` skips the simulation.

## Exact next step
User installs 0.11.0 (full restart: new file). With DialogueUI: talk to Farley and McBride (conversation inside DialogueUI's window, number keys, Get on with it → its own page, a quest → its quest page). Without it (or setting "RPG Dialogue first"): pick "What can I do at an inn?" and a quest in our box (pages stay in the box; accept, hand in, reward). Fix what's off.

Previous next step (0.10.3): user installs 0.10.3 (full restart: new file), checks the text weight against the game's window and tries the Aa button; then the DialogueUI check below.

Previous next step (0.10.2): user installs 0.10.2 (full restart) with DialogueUI on: talk to Farley (box first, DialogueUI's window appears after "Get on with it" or a picked option; number keys only act on the box), right-click Melika, compare the box's size and text with the game's window again. Fix what's off. Then content for wherever they play.

Previous next step (0.10.1): user installs 0.10.1 (full restart), checks Melika on the paladin (her own lines: "Melika. Farley talks to the guests, I feed them."), the Ask list, the journal (`/rpgd journal`), and says what else to tweak. Then content for wherever the paladin or the moved main plays.

Previous next step (0.10.0): user installs 0.10.0 (**full game restart**, not /reload), right-clicks Melika and a gossip NPC and checks the game-style box (screenshot welcome): frame, portrait, title, parchment, icons, red buttons. Fix what's off; if they meant the 2004 classic look, add it as a third style. Then ask where the druid actually plays and write content there (Skyborne facts only from brief §10).

Previous next step (0.9.0): user installs, right-clicks Melika and checks: her own lines (as a Skyborne druid: "A sky-folk druid..."), the new look, the font pickers, the versions in the AddOns list.

Previous next step: user retests: right-click Melika (box, her lines; as a Skyborne druid she should open with "A sky-folk druid."), then a gossip NPC (box with the menu's options), a quest giver (pick a quest from the box), a vendor. Answer: gossip NPCs keep the box, or the plain game window? Then content where the druid plays.

Earlier plan (kept for context): ask the user to retest: right-click McBride, a vendor and a quest giver; paste any "Something went wrong" chat line; check the box lists their quests and that picking one opens the quest. Fix whatever error the safety net reports (start with `UI/DialogueFrame.lua` D.Show/create). Then plan content for where the Skyborne druid actually plays (ask which zones), plus Skyborne and druid reactions across the existing NPCs (only facts from brief §10 for Skyborne).

Before that, the original plan was: wait for the user's in-game results (checklist above). Fix every error they paste, starting with `/rpgd probe` output against `Compat.lua`. Then: import their capture file (`tools/import_capture.py <file> --resolve`), rerun `tools/check_all.py`, and fix whatever the real IDs reveal. After that, new zones follow `PACK_AUTHORING.md` §4.
