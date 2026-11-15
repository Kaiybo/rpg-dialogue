# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.36.0)
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
1. User installs 0.36.0 (new files: exit fully, copy in, restart). Ask: on an alt of another class (or `/rpgd spoof class=WARRIOR race=Dwarf`), do trainers and the majors feel written for that class? Approve or edit the draft origins (Character Sheet in the journal), especially the Horde lists.
2. Lore calls the writers flagged for a look (authored, not canon): Falstad undecided on the Revantusk; Remulos at peace with Grom; Mekkatorque owning the venting of Gnomeregan; Faranell's arrangement with Magatha; Tyrande on men sleeping in the Dream; Ander Germaine/Wu Shen/Ilsa Corbin written from memory.
3. Then: Horde Eastern Kingdoms depth (Revantusk, Kargath, Stonard, Grom'gol), more named NPCs in Goldshire, Sentinel Hill, Auberdine, Astranaar, Theramore, Booty Bay, Gadgetzan, Everlook; Alterac/Dalaran once documented.
