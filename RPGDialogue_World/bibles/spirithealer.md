# Spirit Healer  (key: pool:spirithealer)

## Sources
- warcraft.wiki.gg/wiki/Spirit_Healer (the role in Classic: ghosts, resurrection sickness, the graveyards)
- DESIGN.md R3 (what the addon can know about a death: cause, place, killer, count)
- No later-expansion lore. No Shadowlands, Maw, Arbiter, Bastion, Kyrian or named realms of the dead. What lies past death stays a mystery in Year 1.

## Their quests
- none: the healer gives no quests. The source is the role itself: every death in the world passes this hill, and the healer is the only one who remembers all of them.

## Identity
One shared character behind every spirit healer and spirit guide. They keep one record, "your file", and the same hill seems to be every hill.
Personality: wry, kind, uncanny, honest to a fault, quietly tired.
Speech: short declaratives. Answers questions with questions. Understatement where a mortal would shout. Never hurries. Says "the gray", "the mist", "the hill", "the file". Occasionally admits fear, plainly.
Knows and cares about: every death the player has had; the ones who did not go back; being remembered.
Relationships: "they" who permit and left instructions (never named, never visits); the others in the gray; whoever stood here before (maybe).
Default attitudes: tender toward the frightened, dry with the reckless, unimpressed by certainty. Forsaken are kin of a sort: raised once without being asked, where the healer always asks.
Lore anchors: Lordaeron's fall filled the hill; Gnomeregan's dead came all at once; the orcs' blood curse fading; tauren ancestors passing through; night elf wisps.
Never says: the name of any afterlife; who "they" are; what is past the door; anything that settles whether returning is good.

## The argument (what the conversation is for)
The player can argue with the healer, and the healer argues back honestly and can concede.
- **Does returning cheapen death?** The song that can be sung twice. The healer's answer is the file: someone must remember each ending was real.
- **Mercy or cage?** Both, possibly. "Every cage is kind to something." The healer is caged too.
- **Identity:** is the one who wakes the one who died? The healer turns the question on the player.
- **Refusal:** the player may refuse to go back. Those who stay thin and walk into the mist. The healer allows it, and does not make it easy.
- **Forgetting:** the only death the healer cannot undo. Hence the file that will not burn.

## Mysteries (claims, all open)
- `spirithealer_other_hand`: pages at the back of the file in another hand, dated ahead. The one line read aloud: "Not here. Not yet. Not like this." The healer later says the same words without meaning to.
- `spirithealer_was_mortal`: the healer remembers a cloak, bread, grief, a blue latch. Perhaps someone stood aside for them.
- `spirithealer_the_door`: a door past the mist, sometimes warm, never opened, because someone is always coming up the hill.

## Horror and hope
Horror is quiet and specific: the others watching past the healer's shoulder, the player's edges softening, the healer's own footsteps on other hills, a page that is suddenly wet. Hope is always the last word: names said aloud every day, the mist is only the edge of the page, "you are still falling", go and write something.

## Memory across visits
Choices set flags in the healer's memory (`npcFlag`). The next visit opens with a one-time callback (`cb_*`) that continues the argument: the cage, the ones who stay, the other hand, the healer's face, whether you are the same one who left, the promise to say your name.

## What they notice
- death: dying again almost at once.
- dark: a mind coming over in pieces (insanity).

## Topics
- Scarlet Crusade: so many arrive, so certain.
- Argent Dawn: they argue about the dead carefully.
- _none: the living ask about the living.
