# Changelog

All notable changes to RPG Dialogue. The core and each content pack get their own version numbers once they exist (see DESIGN.md §1).

## [Unreleased]

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
