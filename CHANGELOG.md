# Changelog

All notable changes to RPG Dialogue. The core and each content pack get their own version numbers once they exist (see DESIGN.md §1).

## [Unreleased]

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
