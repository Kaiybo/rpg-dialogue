# Changelog

All notable changes to RPG Dialogue. The core and each content pack get their own version numbers once they exist (see DESIGN.md §1).

## [Unreleased]

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
