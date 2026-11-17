# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.58.0)
- 0.58.0 (user: "proceed with release 0.58.0, focus on areas you believe are necessary"): dungeon reactions. Core: `World.DUNGEON_BOSSES` (place -> exact final-boss names), condition `cleared` (any boss of the place in `char.kills.byName`, or deed `cleared:<place>`), `Trackers.Kill` writes the deed, journal "Cleared %s", diary line. Content: `h_cl_<x>` greeting + hub reply + `xcl_<x>`/`xcl_<x>2` nodes for ~132 NPCs in 40 zone packs (Teldrassil, Arathi, Un'Goro got none); World pools got `cat = "dungeon"` notices for guards/citizens/innkeepers. Bolvar's Onyxia line is gated on The Great Masquerade; Prestor has no raid line. Thrall (Rend) and Rok Orhan (King Gordok) use `killed` instead.
  - Lore to confirm (invented, small): Ragged John's cask from the Depths; Klockmort's ban on contaminated metal; Malyfous leaving the Emperor's halls; Loramus as Highborne; Thelwater's lamp-oil letter; Laurena on Benedictus writing to the Crusade; Glynda's lost sisters; Mok'Morokk becoming boss when Onyxia burned the old chief; Weldon taught to read by Jandice; Sylvanas once in Stratholme on a Silvermoon errand; Dalar a fellow student of Arugal; Hadrec on Adamant/Vincent; Yayo'jin's mojo offer; Runthak hinting at Onyxia's brother.
- Per-release notes before 0.58.0 (0.36.0-0.57.0, lore questions included) are in git: `git show ab37c40:HANDOFF.md`. Core 0.58.0; every pack's version: `python3 tools/version.py`. 47 folders.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon. New: whether boss names in `DUNGEON_BOSSES` match the combat log exactly on Forever (after a run, the boss should appear under `kills.byName` in the character's SavedVariables).

## Next step
0. User installs 0.58.0 (no new files: /reload is enough). Ask: after a dungeon run (Scarlet Monastery, Uldaman, Zul'Farrak, Blackrock Depths are in the priest's range), does the journal show "Cleared ..." and do Crowley/Laurena (Stormwind Cathedral), Magni, the Explorers' League, Gadgetzan greet it? If a boss isn't counted, fix its name in `World.DUNGEON_BOSSES`.
1. Natural next: a voice pass on the bulk 0.57.0/0.58.0 lines; the other ideas from the 0.55.0 list (alt awareness via the account-wide `RPGDialogueDB`, letters at inns, party reactions); Alterac/Dalaran (Forever) once documented; lines the user flags.
2. Older lore lists (0.39.0 and before) are in git: `git show ab37c40:HANDOFF.md`.
