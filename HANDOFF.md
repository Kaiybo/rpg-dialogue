# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.60.0)
- 0.60.0 (user: "proceed with release 0.60.0, focus on areas you believe are necessary"): core-only reliability fix for dungeon clears. `T.BossDown(name)` writes `cleared:<place>`; called from `T.Kill`, from combat-log `UNIT_DIED` while in an instance (pet/totem/raid/environment killing blows), and on login to backfill deeds from `kills.byName` (pre-0.58.0 kills). No pack changes.
- 0.59.0 (user: "proceed with release 0.59.0, focus on areas you believe are necessary"): party reactions. Core: `C.Party` returns name/level/gender too (falls back to `GetNumPartyMembers`); `party` condition takes `true`, `size` (others only), `gender`, `kin`, `sameClass`, `["not"]` (negates only the member test; an empty party never matches it); weight 5 -> 25. Token `{companion}`: `Tokens.Render` takes the line's `when` as a 4th arg and names the member its `party` matched (choice text isn't token-rendered, so replies never use it). Content: `h_pt_<x>` greeting + hub reply + `xpt_<x>`/`xpt_<x>2` for ~127 NPCs in 31 packs (Alliance capitals 32, east 30-60 34, Kalimdor/south 35, Horde capitals 26); World pools got `cat = "party"` notices for guards, citizens, innkeepers.
  - Lore to confirm (invented, small): Bolvar's Thandol Span bridge stand; Magni's empty chairs for Brann and Muradin; Thorius's Uldaman tablet and the museum-case curse; Firebrew's tavern tales; Tyrande's "came only because their lands had fallen"; Farren's patrol lost at Strahnbrad; Maleb getting letters from Lord Jorach; Valorfist's trainees among Andorhal's Scourge; Weldon "whoever clears Caer Darrow keeps it"; Tirion saying Eitrigg saved him first; Leonid on Light's Hope's consecrated ground; Helendis remembering the War of the Ancients; Mahar Ba on the dead Portal; Ruag on Stonard built by camp escapees; Vimes's deserters as a hired company; VanHowzen's two letters to Stormwind; Rok Orhan's Dire Maul deaths; Yeh'kinya on green dragons drowning the temple; Bor hinting at something waking under Silithus; Grezz's Frostwolf pupils; Magatha on Cairne not asking the elders; Cairne counselling Thrall to welcome the Forsaken.
- 0.58.0: dungeon reactions (`cleared`, `World.DUNGEON_BOSSES`); its lore list is in git: `git show 9a70d4b:HANDOFF.md`. Earlier notes: `git show ab37c40:HANDOFF.md`. Every pack's version: `python3 tools/version.py`. 47 folders.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon. Also: whether boss names in `DUNGEON_BOSSES` match the combat log exactly on Forever, and whether `UNIT_DIED` reaches us for bosses (after a run, the boss should appear under `kills.byName` in the character's SavedVariables).

## Next step
0. User installs 0.60.0 (includes 0.59.0; no new files: /reload is enough). On login, earlier dungeon clears should appear in the journal. Ask: in a group, do party greetings show (Benedictus or Rohan when they're the only healer in a party of 3+, Laurena with a paladin, Magni with a dwarf, Bolvar with a full party), and does `{companion}` show the right name? `/rpgd dump ctx` should list the party. If nothing fires, check whether Forever has `GetNumSubgroupMembers` or only `GetNumPartyMembers`. Still open from 0.58.0: does the journal show "Cleared ..." after a dungeon, and are boss names in `World.DUNGEON_BOSSES` right.
1. Natural next: a voice pass on the bulk 0.57.0-0.59.0 lines; alt awareness via the account-wide `RPGDialogueDB`; letters at inns; Alterac/Dalaran (Forever) once documented; lines the user flags.
