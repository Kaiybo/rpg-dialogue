# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.37.0)
- 0.37.0 (user: "Move onto the 0.37.0 release"; picked from the next steps): ~75 new named NPCs: Revantusk Village (new file, new town `revantusk`), Hammerfall and Refuge Pointe, Tarren Mill, Kargath, Stonard, Grom'gol, Goldshire, Sentinel Hill, Auberdine, Astranaar, Theramore, Booty Bay, Gadgetzan, Everlook. Unvalidated by the user's choice (only `luac -p`).
- Core 0.36.0; every pack's version: `python3 tools/version.py`. 47 folders.
- 0.36.0 (user: "more dialogue specific to every race and class, not just priest... another big content push"): every class trainer pool is a full conversation (`pools_roles.lua`, test `tests/classes_spec.lua`); Stormwind's warrior trainers (`npcs/warriors.lua`); ~450 named NPCs gained class/race-gated branches (no new priest content); guard/innkeeper/child/stable/smith/flight pools and all 48 town citizen pools notice classes and races; class advice in `asks.lua`; 39 new origins (`origins/orc.lua`, `troll.lua`, `tauren.lua`, `forsaken.lua`, plus class origins for every Alliance race and Skyborne), used in lines across packs.
- 0.35.0 recap: citizens, ~100 named NPCs, Blasted Lands/Azshara/Silithus, journal pages, self-writing diary, three 45-60 throughlines.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).
- Known thin spots after 0.36.0: Horde warriors and hunters in the Eastern Kingdoms (few Horde NPCs there), no Revantusk NPCs in the Hinterlands, druid replies thinnest in Ironforge/south packs.

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon.

## Next step
1. User installs 0.37.0 (new files: exit fully, restart). Ask how 0.36.0's class content and 0.37.0's towns feel in play.
2. Lore to confirm (writers unsure): Gringer's title and the flight routes; Storm Shadowhoof unfriendly to Alliance in Classic; six Gadgetzan/Everlook service NPCs only "fairly sure" Classic; Tor'gan written as Darkspear.
3. Then: more named NPCs where writers skipped for lack of sources; Alterac/Dalaran (Forever) once documented; any lines the user flags.
