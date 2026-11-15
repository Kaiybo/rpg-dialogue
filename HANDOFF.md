# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.35.0)
- Core 0.35.0; every pack's version: `python3 tools/version.py`. 47 folders (Blasted Lands, Azshara, Silithus new).
- 0.35.0 (user asked for "a big content push", "work on the journal", then "I walk around Stormwind and can't talk to most people; add more NPCs, important and obscure"): citizens (any friendly person with no role is `citizen`, `Conv.IsCitizen`; 51 pools in `RPGDialogue_World/pools_citizens.lua`); ~100 new named NPCs (Stormwind 74 total now, Ironforge +23, Darkshire/Lakeshire/Southshore/Menethil +30, Darnassus +); three new zone packs; journal pages Stories and Heard of, People by zone (DESIGN §3.13); the diary writes itself (`Systems/Diary.lua`: NPC `impression` on every named NPC, `P:Arrival` per zone in `arrivals.lua`, deed lines); three new throughlines (`plague_cauldrons`, `dawn_letters`, `plague_light`; Benedictus ends the last by the player's answer).
- Content: 47 packs; every Alliance zone and the Horde towns 30-60 meet the depth standard.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Right-click on untitled townsfolk opening the box (citizen role via `UnitCreatureType`, which is localized: non-English clients may treat beasts as citizens); the journal button's count badge; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`; the DialogueUI paged Ask list in the real addon.

## Next step
1. User installs 0.35.0 (**three new folders and many new files: exit the game fully, copy in, tick them, restart**). Ask: walk Stormwind and right-click strangers: does the box open, and do the citizens sound right, or too samey? Open the journal: do Stories, People and Heard of earn their place? Is the diary filling in a way you like (impressions after first talks, zone arrivals), or too chatty?
2. Then: more named NPCs in other towns (Goldshire, Sentinel Hill, Auberdine, Astranaar, Theramore, Booty Bay, Gadgetzan, Everlook), depth for the Horde starting zones and capitals, Alterac/Dalaran (Forever) once its NPCs are documented, Blackmaw Hold's quest givers (Azshara, Forever), and any lines the user flags.
