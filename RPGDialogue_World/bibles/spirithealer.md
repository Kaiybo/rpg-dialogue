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
Speech: whole, unhurried sentences, a little formal ("I do not", rarely "don't"), joined the way speech joins them (and, but, so, though, because); one short line for weight now and then, never a stack of fragments. Answers questions with questions. Understatement where a mortal would shout. Says "the gray", "the mist", "the hill", "the file". Occasionally admits fear, plainly.
Before: "It does not burn. Many have asked. One tried." After: "It does not burn, though many have asked, and one tried."
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
- `spirithealer_other_hand`: pages at the back of the file in another hand, dated ahead. The one line read aloud: "Not here, not yet, not like this." (Madame Eva's card quotes it as "not here, not yet".) The healer later says the same words without meaning to.
- `spirithealer_was_mortal`: the healer remembers a cloak, bread, grief, a blue latch. Perhaps someone stood aside for them.
- `spirithealer_the_door`: a door past the mist, sometimes warm, never opened, because someone is always coming up the hill.

## The one with the lantern
A ghost who refused the healer long ago, waiting on the hill with a lantern for someone they can no longer name. One chapter per visit (`lantern` node, `npcFlagBefore` gating): the east road, the face going thin, the name forgotten but the waiting kept, the lantern lifted when you arrive, and at last they run into the mist as if called. Afterward there is sometimes a small light at the far edge, and the healer chooses to believe it is theirs. From chapter three you can promise to watch the road; they thank you before they go.
The debate in miniature: the healer won't take the choice away ("a choice I take away is not a mercy"), even though the waiting hurts.

## Where you fell
Zone lines in `hello`: the Plaguelands (souls the Scourge raises never reach the hill, and the healer counts the missing), Duskwood (dead knocking at the wrong door), Felwood, Tirisfal, Desolace, the Blasted Lands and Silithus (something vast and something dreaming, both unnamed), Winterspring.

## Echoes elsewhere
- Madame Eva (Duskwood): the other hand's words turn up on her Death card; the Lantern card is lit once the lantern-bearer has gone; the Threshold.
- Brother Sammuel (Northshire): you have the look of someone who argued with the healer about the cage.
- Tirion Fordring (Eastweald): the missing are why the Dawn burns what the plague leaves.

## Stay with me a moment (the talk hub)
- **The healer's questions** (`quiz`, rotating): nine questions; your answer is an opinion (`healer_<question>`), the healer reacts, notices a changed mind (`contradiction`), gives its own answer, and brings notable answers back once on a later visit (`qcb_*`, `sys = "healer"` so pacing doesn't hold them).
- **Tales of the dead** (`tales`): came back wrong (the Andorhal soldier, the half-returned mage, the hunter who left their name), refused to go back (the Westfall farmer, the Second War veteran, the old Sentinel), couldn't be saved (the finished one, the Stratholme priest, the unnamed one in Ashenvale), made the healer laugh (the gnome's improvements, the dwarf's ale, the troll's beach).
- **Debates** (`debate`): endless life, fate and the written pages, suffering, debts to the dead. Each in rounds; the healer can lose, and says so. A win goes in the healer's own file (`won_*`), whose first page reads "Not yet." in the same hand as the back of yours.
- **Milestones**: deaths 3, 10, 20, 30, 75, 100, 150, 200, 300, each said once.

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

## Added after 0.90.0
- **Walking back** (`walk`, from hello): the healer respects the corpse run; "the long way is the honest way".
- **The price** (`price`, from ask): resurrection sickness and worn armor as "the short road's toll"; the healer still holds on a moment to keep the worst of it, and it never works.
- **The great dead** (`famous` hub, from ask): how they arrived, never where they went. Terenas (crown still on, forgave his son: the stance node), Uther (asked if the boy lived), Grom (arrived clean, laughing), Lothar (half a sword, the promise about the boy, Varian missing for Alliance), Durotan and Draka (Horde; the baby in the snow).
- **The empty hill** (`quiet`): reading the closed files' names aloud (the Stromgarde baker, the Goldshire boy).
- **Who you are**: priests/paladins (`colleague`, opposite ends of the rope), shamans 30+ (`ankh`), night elves (`elune`, wisps), gnomes (`gnomeregan`, the ones who never climbed), tauren (`ancestors`, the old bull).
- Hello: many more zones and the three battlegrounds; more death-cause, greeting, parting and talk variants. Topics: scourge, forsaken, lordaeron, gnomeregan, light, elune.
