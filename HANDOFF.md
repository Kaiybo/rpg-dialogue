# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long version of this file, with every per-release test list back to 0.78.0, is `git show 171f6b69:HANDOFF.md`).

## The user
- Wants content for both factions and every class, race and gender, with relevant replies for each.
- Wants conversations with real depth (many replies, deep branches) and people who talk like people (whole sentences, Warcraft's register, never clipped one-liners). Everything stays inside one box (ours or DialogueUI's) and never bounces to the game's window.
- Wants quick, efficient sessions: no constant re-validation; follow `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.86.0)
- 0.86.0 (user: "add NPCs that were missed"): a scan of warcraft.wiki.gg zone rosters (Category:<Zone> NPCs, Classic-range ids, friendly, not holiday/generic/pet) against every pack found 756 unwritten named NPCs; 741 written in `npcs/missed*.lua` (+ `bibles/missed*.md`) in 38 packs, all in their `.toc`. Skipped: already present under Classic names (Magellas, Byula, Darcy, Hilary, Guard Parker), hostile or untalkable (Fizzle Darkclaw, Sergeant Curtis, Baron Longshore, Sarilus Foulborne, Lieutenant Sanders, Umaron Stragarelm, Velinde Starsong, Captured Leper Gnome, Marandis' Sister), post-Classic (Chao-Ju). Only `luac -p` run; nothing seen in game.
- Calls to check in game from that pass: Clerk Lendry vs "Paymaster Lendry"; "Maywiki of Zuldazar" on Yojamba Isle; Krakk (Grom'gol) written as an orc; Apothecary Falthis and Darkslayer Mordenthal (Ashenvale) written as Horde-friendly (drop if hostile to both); Merissa Stilwell placed at Northshire; Maximillion has no surname in Tirisfal `missed.lua` but is "Maximillion Crowe" in `deathknell_folk.lua`; Undercity Marla Fowler vs Tirisfal's buried Marla; several Forever quests (Camping 101 lines, Data Hoarders, Eyes of the Sentinels, Seeking Caitlin...) are written loosely behind `TODO_QUEST`. Champions' Hall officers (Stormwind) talk about PvP ranks.
- Duplicate keys predating this pass: `gurda` (Arathi unsung / Ashenvale more_folk) and `jannos` (Desolace / Feralas).
- 0.85.0 (persuasion, tone, gut feelings, narration, "Where is...?") is still untested in game. TTS (0.83.1 work) never released alone.
- Open: Hemet Nesingwary mixes a burr and plain English (voice decision). Valor's Rest is placed two ways (Zannok: southeast Silithus; `desert.lua`: top of the Un'Goro road).

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
1. The user's in-game test of 0.86.0 (a full restart): a few new townsfolk in Stormwind, Ironforge, Orgrimmar and the Undercity open our box; the 0.85.0 checks (bottom bar crowding, Admire/Taunt/Intimidate, tone at Thrall, "Where is...?").
2. Fix the in-game names from the list above once seen; resolve the `gurda`/`jannos` key clashes.
3. Natural next work: World views/asks/threads/letters weren't covered by the writing pass; split the over-long lines.
