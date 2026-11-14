# Changelog

All notable changes to RPG Dialogue. The core and each content pack get their own version numbers once they exist (see DESIGN.md §1).

## 0.10.3 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0. Adds a file (`UI/TextOptions.lua`): restart the game, don't just /reload.

### Text size and fonts, right in the box
- **"Aa" button** in the conversation box's title bar: text size (10–24), line spacing, the font for what people say and the font for names, changed live while you read. Each font's name is shown in that font. Escape closes it before the conversation.
- Settings: the same options moved up into a new **"Look and text"** section with the window style.
- **Text no longer looks bold**: every string started from the game's highlight font, which has a drop shadow, and on parchment that shadow thickened dark text. Text and replies now have no shadow, like the game's quest text. Only the gold name in the metal title bar keeps one.
- The text size setting is now the size you see. The default is 13 (the game's quest font size); the old default of 14 moves to 13 once (saved-data schema 6), and a size you chose is kept.

## 0.10.2 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### Works with DialogueUI
- **RPG Dialogue and DialogueUI now work together** (the new default when DialogueUI is loaded). The conversation comes first, in our box. DialogueUI's window waits invisible underneath it, and its camera keeps working. "Get on with it", or picking a quest or service, hands you to DialogueUI's window, exactly where it would have been.
  - DialogueUI's window is never closed (that would end the visit). It's only made see-through and covered, and it can't fade itself back in while we talk.
  - Number keys, Space, Enter, Escape and the arrows stay with the box while it's up, so they can't pick DialogueUI's options underneath.
  - DialogueUI's "hide the game UI" option no longer hides our windows.
- Settings → "Other dialogue addons": "Automatic" (new default: together with DialogueUI, step back for Immersion), "RPG Dialogue first, then the other window", "Step back", "Turn RPG Dialogue off". The old "step back" default moves to "Automatic" (saved-data schema 5).
- Built from DialogueUI's public source (it has no API for adding dialogue, so the two windows coordinate instead): DESIGN.md §8.

### The game style, sized like the game's window
- The box now has the gossip window's measurements: 338 × 496 (taller only when a conversation needs it), with open parchment below the replies. The text column is 270 wide, in the quest font's size (13 at the default text size; parchment and wood keeps 14). There's a 15-pixel space before the replies, and the rows are 300 wide with the game's spacing.
- The Ask list follows the box's height.

## 0.10.1 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### After the first look at the game style
- **Fixed: named NPCs speaking from the role pools on a new character** (Melika gave an innkeeper's generic lines to a new level-1 human paladin). A zone's pack only loaded at login and on entering a new zone. On a new character's first login the zone isn't known yet, and Northshire to Goldshire never changes the zone, so the Elwynn pack never loaded. Packs now load on every zone signal and again just before the addon decides who you're talking to.
- **Ask list** looks like the box beside it: title in the metal title bar, its own close button, the search box on the rock header, topics on parchment, "Show older topics" on the bottom bar. It's the same height as the box (no more tall empty panel) and shows as many topics as fit.
- **Journal and export window** get the same frame: title in the title bar, tabs and search on the header, pages on parchment.
- **Parchment keeps its proportions** instead of being squashed into short boxes: drawn at its own size from the top-left corner and cut off by the frame, as in the game's gossip window.
- Text and replies keep further from the parchment's ragged right edge.

## 0.10.0 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### The game's own window style
- **New default look: the game's own quest and gossip window.** The conversation box is built from your client's own art, so it matches your quest windows: the metal frame with the NPC's round portrait in the corner, their name in the title bar, the quest parchment, replies listed like gossip options (speech bubbles; the game's own quest and option icons; the gossip list's highlight bar), "Get on with it" with a bullet, and red buttons ("Ask about..." on the bottom bar, the red close button). It's gossip-window shaped (360 wide) and opens where the game opens its quest windows, or right over the game's window. Names use the game's title-bar font.
- The Ask list, the short-line bar, the journal and the export window get the game's panel border, parchment and red buttons.
- Follows the game's **Quest Text Contrast** setting (Options → Accessibility): lighter parchments, or the dark background with light text. RPG Dialogue's own high-contrast option uses that dark background too.
- Settings → **"Window style"**: "The game's own (like the quest window)" or "Parchment and dark wood" (the 0.9.0 look). Changes apply at once, even mid-conversation. If your client lacks any of the art, windows use parchment and wood, and settings say so.
- Name font: new choice **"The window's own"** (the default): Friz Quadrata in the game style, Morpheus on wood. The old default (Morpheus) moves over to it once (saved-data schema 4); other choices are kept.
- Quest icons now come from the game's own helper (campaign, daily and other quest kinds show their own marks) in both looks.
- How it's built (sources, sizes, the fallback): DESIGN.md §3.10. 143 Lua tests.

## 0.9.0 (2026-11-13)
First build with version numbers. Packs in this build: World 1.0.0, Elwynn Forest 1.1.0.

### Fonts, look and version numbers (2026-11-13)
- **Choose your fonts.** Settings → "Font for what people say" and "Font for names", each with a live sample line. Text: Friz Quadrata (game default), Crimson Pro (book serif), Atkinson Hyperlegible (most readable), Arial Narrow, Morpheus, Cinzel, Skurri. Names: the same list plus "Same as the text". Fonts other addons register through SharedMedia are listed too. Crimson Pro and Cinzel are bundled (SIL Open Font License, licence files included). Fonts are sized so each choice reads at about the same size, and Latin-only fonts fall back to the game's font on non-Latin clients. The old "readable font" checkbox moves over once (saved-data schema 3).
- **Polish**: soft drop shadow; parchment shaded top to bottom; brass trim inside the wood frame; a framed portrait; a thin rule under the name and above the replies; replies as full-width rows with a colored number, a hover band and an accent stripe on the marked one; "Get on with it" set apart and dimmed; themed buttons (close, Ask about, journal tabs, export) instead of the game's red ones; quest and option icons from the game's own art; a short fade-in (off with reduce motion). Same in the Ask list, short-line bar, journal and export windows.
- **Version numbers on every folder**: in the AddOns list (grey, after the name), each TOC's `## Version`, `/rpgd packs`, the settings header and the login line. `tools/version.py` shows and sets them (TOC, code and changelog in step); `tools/build_zip.py` refuses a zip when they disagree.
- **"Restart the game" warning**: the game reads an addon's file list only at start-up, so a /reload after an update can leave new files (like Melika's) unloaded. RPG Dialogue now notices a version or file-list mismatch and says to exit and restart the game.

### Second in-game test (2026-11-13)
- **Fixed: the conversation box failed to draw in the game** ("FontString:SetText(): Font not set"): every text in our windows now has a font from the moment it's created. The test mock now refuses text without a font, like the real client, so this can't come back unnoticed.
- **Right-click to talk to people with no menu of their own.** A quick right-click (not a camera turn) on a friendly NPC we have dialogue for, within reach, opens the box when the game opens no window of its own. NPCs with a gossip menu, quests or a shop keep the game's path: their window opens and the box comes with it, listing their options. If the game's window arrives late, the box keeps the conversation and adds its options. Setting: "Right-click people who have no menu of their own to talk to them" (on).
- New in the Elwynn pack (1.1.0): Melika Isenstrider, Assistant Innkeeper.
- Capture marks NPCs that open a game window (`interacts`), so right-click talk never races their window.

### After the first in-game test (2026-11-13)
- **The conversation box opens every time** you right-click an NPC with dialogue, not only on first meetings and news. Existing settings move over once (saved-data schema 2); "short line" and "straight to business" are still in settings ("When you talk to someone").
- **The box lists the NPC's own options**: quests (hand-ins first, then new, then in progress) and gossip options (vendor, training, flights...), after the NPC's replies. Picking one hands you to the game's window with that option selected. Works on gossip windows, the quest window's greeting page and single quests. Up to 10 buttons; keys 1–9 and 0.
- **Safety net**: if anything in a conversation errors, RPG Dialogue says so in chat (once per message, even with Lua errors hidden) and gives the game's window back at once. Reported because the Talk button appeared to do nothing in game: the engine picked a line, so the window most likely failed while drawing.
- `/rpgd probe`: old fallback functions a modern client doesn't have (`IsQuestFlaggedCompleted`, `UnitBuff`, `InterfaceOptions_AddCategory`, `GetQuestLogLeaderBoard`) are marked "not needed" in grey; new entries for quest selection, gamepad and tooltip functions.

### M8 (2026-11-13): Release prep
- **Total RP 3** (optional, read-only): with it loaded, `{name}` is your roleplay title and first name ("Sir Aldric"). Two settings, both on. Uses Total RP 3's public player object, strips color codes and textures, falls back to older profile fields, and never writes anything. Everything works the same without it.
- **Accessibility pass** (brief 4.15):
  - Keyboard: Up/Down/Tab move a marked selection, Enter takes it (or finishes the text), Escape closes the Ask list before getting on with it; Ask list navigable with Up/Down/Enter; journal tabs with Left/Right, Escape closes; new **Ask About...** keybinding.
  - Gamepad (client gamepad mode, setting on by default): D-pad moves, A confirms, B = Get on with it, X = Ask about; journal D-pad left/right, B closes.
  - Bundled **Atkinson Hyperlegible** (SIL Open Font License) as the readable font, with fallbacks; names drop the decorative font when it's on; non-Latin clients keep the game's fonts.
  - No color-only signals left: the selection has a ">" marker, locked replies say "(Locked)", the current journal tab is marked.
- **"Something new to say" tooltip marker** (brief 4.10; was missing): off by default, read-only, cached.
- Packs: `requires` checked (pack manager and `/rpgd packs` say what's missing; the validator errors); each pack has its own version and `CHANGELOG.md`; the pack manager shows versions.
- `PACK_AUTHORING.md`: the pack format, merge rules, format versions, the step-by-step zone workflow with tools, releasing a community pack, notes for AI sessions.
- Packaging: `.pkgmeta` checked against the BigWigs packager's source (it knows Forever's 160xx interface numbers); `.github/workflows/checks.yml` and `release.yml` (tag → release checks → packager → CurseForge/Wago once project IDs and tokens exist).
- Blizzard UI add-on policy checked (November 2026); `tools/check_all.py --release` now fails on chat or addon-message sending, dynamic code, or donation/advertising text in shipped files, and on pack versions that don't match their changelogs.
- README rewritten (controls, accessibility, other addons, releases). 118 Lua tests, 7 tool tests.

### M7 (2026-11-13): Content expansion workflow and tooling
- `tools/new_zone.py plan "<Zone>"`: lists the zone's captured NPCs and quests and proposes a coverage tier for each (major / quest / service / pooled / skip) in `RPGDialogue_<Zone>/PLAN.md`, with suggested keys, roles and towns, the zone's quests (lowest level seen, factions), settlements and hostile creatures, and the brief's zone checklist.
- `tools/new_zone.py scaffold "<Zone>"`: after the tiers are approved, writes the pack (TOC, `pack.lua`, `pools.lua`), one NPC file and voice bible stub per approved NPC (captured IDs and quests filled in, never invented), a lore-sheet stub in `LORE_NOTES.md` and the pack's line in `.pkgmeta`. Never overwrites; re-run it after approving more NPCs.
- Scaffold NPCs (`scaffold = true`) are ignored in game (the NPC stays pooled) and listed by the validator; `--strict` refuses them. The coverage report shows written vs planned NPCs.
- `tools/check_all.py`: one command for every check (Lua tests, tool tests, luacheck, validator, voice check, simulation, coverage) with a pass/fail summary; `--release` adds the strict validator and packaging/repository checks (TOC versions and interface numbers, `.pkgmeta` folders and ignores, no captured text tracked by git, clean tree).
- Simulation: flags lines about quests a character couldn't have taken yet at the line's level or on its faction, using the lowest level and factions now recorded by capture. Contradictions and impossible references now fail the run.
- Voice check: fails any line that shares a 6-word run with captured Blizzard text in your local `reference/` files; now also checks rumors and errand text.
- Flag report: a ready-to-paste `/rpgd spoof ... /rpgd seed N` replay line for each flag.
- `/rpgd capture zone`: what's captured in your zone, and the NPCs you've talked to that have no content yet.
- Python tool tests (`tests/test_tools.py`, run against a scratch copy of the repo). 98 Lua tests.

### M6 (2026-11-13): Spirit healers, books, insanity, barks, errands
- Spirit healers: one shared conversation tree for every spirit healer (they "keep shared records": one memory, one file). Reactions to how you died (falling, drowning, fatigue, guards, players, something far below you, elites, bosses), death counts with running jokes, the same spot again, long streaks, class and race (shaman ankh, warlock soulstone, priests and paladins, Forsaken, night elf wisps), alignment and Fel Taint tone; "your file", "what are you?", "why do you help us?". The afterlife stays a mystery.
- Pools can now carry whole conversation trees and act as one character. New conditions `deathsHere`, `daysSinceDeath`, `visited`; tokens `{deaths}`, `{deathplace}`, `{killer}`.
- Ghosts: only spirit-sensitive NPCs answer (spirit healers, Brother Sammuel).
- Books: known books teach topics and are journaled; Brother Neals reacts to *The Seven Kingdoms*.
- Temporary insanity (`fx.insanity`, `/rpgd insanity <n>`): scrambled text (stable, no flicker), wrong names, intrusive extra replies, local-only fake whispers, journal entries in a different hand, a static dark vignette. Cured by rest, holy places, the Camping buff (once its spell ID is captured), and time. Off with the setting or reduce motion.
- Drunk replies: slurred choice text.
- Proximity barks from nameplates, target and mouseover (local chat only, 90 s global / 10 min per NPC, 30% chance), and live reactions from nearby NPCs (a child squeals when you shift into a cat).
- Addon-side errands (`P:Errand`, `/rpgd errands`): visit / item / kill requirements verified by the addon, addon-only rewards. Slice: Eagan asks you to look at Echo Ridge Mine.
- Pacing: removed the per-conversation "death" budget (it silenced spirit healers).
- Validator: errands, books, pool trees. Simulation: barks, ghosts, books, lies, spirit healer deaths. Tests: 96 passing.

### M5 (2026-11-13): Journal, origins, export/import
- Journal window (`UI/Journal.lua`, `/rpgd journal`, keybinding, launcher left-click): Chronicle (searchable, newest first, folded old entries), People I've Met (affinity in words, last talked, last thing said), Character Sheet (alignment in words, title, dominant traits, opinions incl. contradictions, Fel Taint only if present, town standings as tier names, Origin page), Topics (known topics, "X insists: ..." claims with settled marks, books read), Deeds, Notes (your own writing).
- Origins (`Systems/Origins.lua`): picked on the Character Sheet (browse, edit the 2–3 sentence blurb, confirm; changing asks for a second click), one dismissible hint at first login, starting nudge and home-town welcome applied once per origin, blurb becomes a journal entry, "Other" unlocks nothing. Draft lists (for approval) for humans, dwarves, gnomes, night elves and Skyborne (from the brief's section 10 only, faction-aware).
- Export/import (`Systems/Export.lua`, `UI/ExportFrame.lua`, `/rpgd export`, `/rpgd import`): typed serializer (data, never code) + base64 + version header + checksum; import checks first and changes nothing until confirmed; the previous story is kept aside in `_quarantine`.
- Save-data corruption checks were already in place since M1 (repair into `_quarantine`, newer-schema read-only mode).
- Tests: 86 passing.

### M4 (2026-11-13): Story systems
- Throughline engine (`Systems/Threads.lua`): beats from thread files compete in the NPC's opening line (base 480), at most one per conversation, same-thread gaps in conversations and minutes (per-thread overrides), HELD reasons in `/rpgd why`, beats count as "something new", every beat goes in the journal, a reflective journal entry at the third beat, untouched threads fade after three weeks. `/rpgd threads [reset | force]`.
- "Ask about..." (`Systems/Topics.lua`, `UI/AskAbout.lua`): button on the dialogue window, searchable topic list (most recent first, archive for stale topics), answers via the specificity engine (own take, community, role, brush-off in their voice). `/rpgd topics [teach | forget]`.
- Gossip network: `gossip` condition (an opinion told to someone in this NPC's community reaches them after a delay, with a stable chance). `contradiction` condition (conflicting opinions within one community get noticed). Content: Willem hears what you told McBride; Milly notices contradictions; Farley hears what you told William Pestle.
- Lies: `lieCaught` condition checks a player claim against real history (`trueWhen` on the claim). Slice: tell Farley you killed Hogger ([Deceive]) and Dughan notices there's no claw on his desk (town standing drops).
- Innkeeper rumors (`Systems/Rumors.lua`): rumor sets by role, town and zone; at most one per hour per innkeeper with a chance per visit; shown after the first line, or instead of the greeting in compact mode. Elwynn rumor set added.
- Town standing (`Systems/Towns.lua`): quests done for a town move its standing (town quest lists), spread to related towns, extremes soften with long absence but never below ±30, flavored tier names.
- Alignment hint tags on replies ([Light], [Cunning], ...), off by default.
- `/rpgd claims`, `/rpgd die <cause>`.
- Validator checks thread beats, rumors, town quest lists and player claims. Simulation advances time and conversations like real play, shuffles visiting order, and reports beats fired.
- Simulation (2,000 characters): all four `elwynn_gold` beats fire; 7 of 325 lines never fire (all explained). Tests: 78 passing.

### M3 (2026-11-13): Vertical slice (Northshire Valley + Goldshire) and content tools
- `RPGDialogue_World` pack (loads at login): towns (Northshire, Goldshire, Stormwind), 10 topics, 5 claims, the `elwynn_gold` throughline (4 beats, 2 endings), draft human origins (for approval), generic fallbacks, role pools (children, flight masters, innkeepers, vendors, trainers, spirit healers).
- `RPGDialogue_Elwynn` pack (loads in Elwynn Forest): 13 NPCs: Marshal McBride, Deputy Willem, Eagan Peltskinner, Milly Osworth, Brother Neals, Brother Sammuel, Llane Beshere, Brother Danil, Marshal Dughan, Innkeeper Farley, Remy "Two Times", William Pestle, Smith Argus. Plus Northshire and Goldshire guard pools. Each NPC has a voice bible built from their wiki page and quests.
- Slice items covered: race/class/gender lines, race+class combos (dwarf shaman, human hunter, gnome priest, dwarf paladin), level bands, quest history, noticing moments and live reactions, compact repeat visits with news lines, return-visit memory, alignment choices, opinions, before/during/after/later quest reactions (incl. NPCs who weren't involved), echoes of lines heard from other NPCs, an NPC with an agenda (Dughan) contradicted by others and open to confrontation and [Persuade], a topic answered differently by many NPCs (defias), [Intimidate] on Remy, innkeeper rumors teaching topics, origin-only options. Thread beats and topic UI get their engine in M4.
- Scoring tuned from the simulation: long-tail quest states (before 45, done/later 40) no longer drown out race and class lines.
- New condition: `money`.
- Tools: `voicecheck.py` (banned phrases, sameness, mad-libs, broad-pool noticing), `simulate.py` + `tests/sim_driver.lua` (real engine, thousands of random characters, repeat visits), `coverage.py`, `import_capture.py` (registry + `--resolve` for TODO placeholders), `export_reference.py`, `flag_report.py`. The validator now judges line length by sentences and words together.
- `CONTENT_GUIDE.md`, `banned_phrases.txt`, slice lore sheet in `LORE_NOTES.md`.
- Tests: 65 passing, including real-pack content tests.

### M2 (2026-11-13): Engine, packs, dialogue UI
- Specificity engine: candidate gathering (own lines, community/role pools, generic), conditions with weights and failure reasons, pacing vetoes, anti-repetition fade, top-band weighted pick with a seeded RNG, traces for `/rpgd why`.
- Conditions: the full key set from the brief plus `questBefore`, `questReady`, `questLater`, `durability`, `nearlyNaked`, `equipped`, `profession`, `chance`, `npcFlag`; `all`/`any`/`not`. TODO quest titles resolve at runtime from the NPC's gossip quest list, your quest log and capture data.
- Pacing: per-system budgets (alignment, taint, origin, trait, opinion, book, insanity), noticing-moment budget and per-category cooldowns, line cooldowns and `once`.
- Effects: alignment with diminishing returns, drift, titles; traits and dominant traits; opinions (with contradictions remembered); flags; player claims; affinity; town standing with spread; thread state; heard/exposed claims; learned topics; journal in both voices.
- Content pack API (`RPGDialogueAPI`, the one public global): discovery from TOC metadata, load-on-demand by zone or at login, data-format check with refusal message, merging of NPCs across packs, TODO placeholders with name matching.
- Conversation controller: gossip, quest and service windows; full window vs compact bar (first meeting, something new, noticing moment for story NPCs); Blizzard's window is only faded and covered, never hidden or re-opened; never a full window in combat; live reactions (form, pet, mount, stealth, auras); Talk to Target with range checks; special options decided by who you are; "this line is wrong" flags.
- UI: parchment-and-wood dialogue window (portrait, typewriter, numbered choices, Get on with it, flag box, keys 1-5/Space/Escape), compact bar with Talk button, settings panel (features, accessibility, other dialogue addons, content packs, developer), launcher (addon compartment or minimap button).
- Other dialogue addons (Immersion, DialogueUI): steps back by default, with a one-time notice.
- Tools: `tools/rpgd/luadata.py` (data-subset and SavedVariables parser), `tools/validate.py`.
- Tests: fixture packs and 33 new engine/conversation tests (60 total).

### M1 (2026-11-13): Skeleton
- Core addon `RPGDialogue`: TOC (interface 16001, 16002), localization table, event dispatcher, logging, dev mode.
- `Compat.lua`: every Blizzard API call in one file, modern-first with legacy fallbacks, secret-value aware, `/rpgd probe`.
- `SavedData.lua`: account and per-character data, schema 1, migrations, repair that sets damaged data aside (never wipes), newer-schema read-only mode, trimming (seen lines, journal folding, death log).
- `Trackers.lua`: quest turn-ins with timestamps, deaths with inferred cause (no combat log in Forever), deeds (first death, levels, zones, dungeons, party kills), books read, home inn and visits, drunkenness.
- `Context.lua`: lazy context snapshot with spoof overlay; level bands, relative power, time of day, holidays (calendar, then a fallback date table), forms, pets, debuff types, out-of-place flags.
- Dev tools: `/rpgd capture`, `autocapture`, text capture (gossip greetings, quest text at each stage, quest givers and turn-in NPCs), `spoof`, `dump ctx`, `mem`, `probe`, `auras`, `reset`.
- `.luacheckrc` (only Compat may touch WoW globals), `.pkgmeta`, `tools/link_addons.sh/.bat`, README, MIT license.
- Out-of-game tests: WoW API mock, TOC loader, test runner; 27 tests.

### M0 (2026-11-13): Design
- Added `DESIGN.md`: folder structure, data schema with a complete example NPC, engine scoring, needs from the user, risks and API unknowns, decisions open to veto, M1 plan.
- Added `HANDOFF.md`, `LORE_NOTES.md` and this changelog.
- Initialized the git repository.
