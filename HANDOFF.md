# HANDOFF

Short on purpose: current state and next step only. History is in `CHANGELOG.md` and git (the long pre-0.33.0 handoff is in git history: `git show 59aaa3c:HANDOFF.md`).

## The user
- Plays **Alliance; main is a human priest** (levels 30-60 now). Alliance content first, then both factions; every class, race and gender gets relevant replies.
- Wants: conversations with real depth (many replies, deep branches), people who talk like people (whole sentences, Warcraft's register, never clipped one-liners), staying inside one box (ours or DialogueUI's, never bouncing to the game's window).
- Wants quick, efficient sessions: no constant re-validation; use `CLAUDE.md`'s checks.
- Uses DialogueUI. Tests in game and sends screenshots.

## State (0.34.0)
- Core 0.34.0; every pack's version: `python3 tools/version.py`.
- 0.34.0 (this release, the user asked for "further development of RPG elements" and "a button to ask about topics you've been exposed to, and prompt NPCs to see what they know"): "What do you know?" (standard topic `knows`), Ask list marks (what they know, nothing to say, heard from), topic count on the button, paged Ask list inside DialogueUI; disposition (DESIGN §3.12), identity tags, approval and check notes; ~80 Persuade/Intimidate/Deceive checks and disposition-gated lines across every pack; `knows` lead-ins for every role pool and ~250 named NPCs. Authored secrets are under "0.34.0" headings in the bibles.
- Content: 44 packs; the depth rewrite is done for every Alliance zone and the Horde towns 30-60.
- `check_all.py --release` fails until capture data replaces the TODO ids (by design).

## Standing decisions (confirm only if the user asks)
- Lore is Classic-era: no foreshadowing of later expansions (Prestor, Varimathras, Neeru, Lescovar, Longhorn written straight; dramatic irony only).
- Same-title quest chains get lines that fit any step. Unknown IDs stay `TODO_NPC`/`TODO_QUEST` and are matched by name at runtime.
- The spirit healer is one shared character; the afterlife stays a mystery.
- "auto" with DialogueUI renders our conversations inside its window; Immersion: we step back.

## Not verified in game
Disposition button tooltip (`GameTooltip:AddDoubleLine`) on the bottom bar; the DialogueUI paged Ask list in the real addon (tested against a stand-in only). Quest-item tooltips via `GameTooltip:SetQuestItem` from a hyperlink hover; the journal button's saved position; Shadowform as form 28; most of `Compat.lua` beyond `/rpgd probe`.

## Next step
1. User installs 0.34.0 (**new core file: exit the game fully and restart**). Ask: does "What do you know?" feel useful (in DialogueUI too)? Is the disposition line welcome or clutter? Do the approval notes and [Priest] tags read well? Try a Persuade with Benedictus, Laurena or Bolvar.
2. Then: depth for the Horde starting zones and capitals, new zones (Azshara, Alterac, Blasted Lands, Silithus), more `knows` lead-ins for minor named NPCs (they fall back to their role's), and any lines the user flags.
