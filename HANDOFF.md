# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long version of this file, with every per-release test list back to 0.78.0, is `git show 171f6b69:HANDOFF.md`).

## The user
- Wants content for both factions and every class, race and gender, with relevant replies for each.
- Wants conversations with real depth (many replies, deep branches) and people who talk like people (whole sentences, Warcraft's register, never clipped one-liners). Everything stays inside one box (ours or DialogueUI's) and never bounces to the game's window.
- Wants quick, efficient sessions: no constant re-validation; follow `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.83.0, plus unreleased)
- 0.83.0 is released: PRs #109-#114 merged into one (flirt lines, clarity pass, tic pass, deepened light NPCs). Every content pack had a minor bump. No new files.
- 0.82.1: TTS now tries a list of speak calls (`WAYS` in `Compat.lua`) and drops each one that reports PLAYBACK_FAILED. `/rpgd tts` prints the full event payload. This has not been seen working in game.
- Unreleased: World topic `aviana` (`topics.lua`) with three views (`views_5.lua`, two opposing stances), consistent with Thisalee's story in `RPGDialogue_Hyjal/npcs/talon.lua`. HANDOFF trimmed. Bump World when this is released.
- Open: Valor's Rest is placed in two ways. Zannok puts it in southeast Silithus, and `desert.lua` puts it at the top of the Un'Goro road.

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- With DialogueUI, "auto" renders our conversations inside its window. With Immersion, we step back.

## Not verified in game
- TTS (0.82.1): which speak call works, and the real status values.
- Flirt lines (0.83.0): opposite-gender NPCs, the `flirting` setting, innkeepers and vendors.
- Right-click on untitled townsfolk opening the box. The citizen role comes from `UnitCreatureType`, which is localized, so non-English clients may treat beasts as citizens.
- The journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list.
- Whether the boss names in `DUNGEON_BOSSES` match Forever's combat log, and whether `UNIT_DIED` fires for bosses. After a run, the boss should appear under `kills.byName` in SavedVariables.
- Whether the Forever NPCs added in 0.78.0-0.81.0 open our box. If one doesn't, capture the in-game name.

## Next step
1. The user's in-game test of 0.83.0, and their new `/rpgd tts` output.
2. A short spot-check list, in place of the old per-release lists:
   - Flirting: an innkeeper or vendor of the opposite gender, then the same NPC with the setting off.
   - A paladin, priest or warrior trainer, on that class.
   - "Ask about..." with a capital leader (Thrall, Bolvar) and an unnamed citizen. Ask a druid or night elf about Aviana.
   - The journal: the Myself page (beliefs, people), Stories and Notes.
   - The Settings page (Large box option, packs columns).
3. Natural next work: split the 109 over-long lines; a voice pass on the bulk lines from 0.57.0-0.59.0; letters at inns; any lines the user flags.
