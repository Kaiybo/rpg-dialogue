# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.33.0)
- Core 0.33.0; every pack's version: `python3 tools/version.py`.
- 0.33.0 (this release): quest pages no longer flash raw icon/item codes while typing; hovering a reward or required item shows its tooltip; the journal is a readable book (Diary / People I've met / Myself / Notes) opened from an on-screen book button; alignment only comes from mutually exclusive statement stances (engine, validator, all content).
- Content: 44 packs; the depth rewrite is done for every Alliance zone and the Horde towns 30-60.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Quest-item tooltips via `GameTooltip:SetQuestItem` from a hyperlink hover; the journal button's saved position; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`.

## Next step
1. User installs 0.33.0 (no new files: /reload is enough) and checks a quest turn-in (no flashing codes, tooltips on hover), the journal button, and a stance choice (the other stances disappear).
2. Then: depth for the Horde starting zones and capitals (Barrens, Tirisfal, Mulgore, Durotar, Undercity, Thunder Bluff, Orgrimmar, Silverpine), new zones (Azshara, Alterac, Blasted Lands, Silithus), and any lines the user flags. Keep existing line ids (memory and `heardLine` depend on them).
