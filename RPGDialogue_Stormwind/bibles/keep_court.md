# The Keep's Petitioner's Chamber  (keys: delavey, ridgewell, wishock)

The churchman and the two nobles who wait on the court. File: npcs/keep.lua.
All wiki pages read (warcraft.wiki.gg, raw source), November 2026.

---

# Bishop DeLavey  (key: delavey)

## Sources
- https://warcraft.wiki.gg/wiki/Bishop_DeLavey (read; Petitioner's Chamber of Stormwind Keep; represents the Church at the King's court; a diplomat sent to Theramore never arrived; suspects the Defias; sends Thomas to find an adventurer; uses his own contacts: a letter to Jorgen the fisherman, then Elling Trias of SI:7)
- https://warcraft.wiki.gg/wiki/The_Missing_Diplomat (read; "allow me to be blunt... and please, try to keep this from becoming common knowledge"; Thomas "has always been adept at following my requests")
- Major Samuelson (city4.lua): clergy approach the court through DeLavey. Elling Trias and Dashel Stonefist (city2/city3) carry later steps.

## Their quests
- The Missing Diplomat (turn-in of the first step, giver of the next; the chain shares the title): discreet, worried, trusts his own network more than the court's; keeps things from becoming common knowledge.

## Identity
Bishop DeLavey · Petitioner's Chamber, Stormwind Keep · Human · priest (bishop at court)
Personality: discreet, dry, politically careful, quietly anxious, devout in a practical way
Speech: measured, blunt when time is short, lowers his voice, "I'll be blunt"
Knows and cares about: the court, the Church's standing with it, the missing diplomat, Defias activity
Relationships: Thomas (altar boy, his runner), Jorgen and Elling Trias (his contacts), Benedictus (his archbishop), Bolvar and Lady Prestor (the court, spoken of carefully)
Never says: who the diplomat is; anything about Varian's fate beyond "the King is missing"; anything about Prestor beyond what a careful courtier says.

## Agenda
Find the diplomat without alarming the city.

## Secrets
Authored, not canon: he suspects the matter is more important than "a diplomat" sounds, and won't say more even to himself.

## Reliability
Honest but withholding (he tells the player only what the next step needs).

## What they notice
1. Priests (he'd rather send one of the Church's own).
2. Nobles' children (origin human_minor_noble): he knows how the court talks.
3. Rogues: amused, and wary.

## Topics
defias, the_stockade (brief)

---

# Count Remington Ridgewell  (key: ridgewell)

## Sources
- https://warcraft.wiki.gg/wiki/Count_Remington_Ridgewell (read; House of Nobles, Petitioner's Chamber; his family's museum of jewelry and fine art; gossip: "My family boasts the finest collection of jewelry and objects of fine art among all the nobles of Stormwind! And we are always wishing to increase the size our collection...". Classic quests: The Perenolde Tiara; Mayara Brightwing; Delivery to Ridgewell. The Argus and King Anduin material is later and out of bounds.)
- https://warcraft.wiki.gg/wiki/The_Perenolde_Tiara (read; Perenolde heirloom from Alterac, crafted by Ironforge jewelers with emeralds; Grel'borg the Miser, an ogre mage in the Ruins of Alterac; progress: "Do try to avoid stepping on my pant cuffs. This outfit is newly tailored."; completion: "our gratitude is as grand as our collection")
- https://warcraft.wiki.gg/wiki/Mayara_Brightwing_(quest) (read; his agent Mayara scouts the Ruins of Thaurissan in the Burning Steppes for the family museum; the prize needs a foray into Blackrock Spire)
- RPGDialogue_BurningSteppes/npcs/morgans_vigil.lua: Mayara speaks of him.

## Their quests
- The Perenolde Tiara (gives and takes): wants a traitor-king's family jewels for display; vain; generous with reputation, fussy about his clothes.
- Mayara Brightwing (gives) / Delivery to Ridgewell (turn-in): pays others to go into dangerous places for art.

## Identity
Count Remington Ridgewell · Petitioner's Chamber · Human · noble
Personality: vain, enthusiastic, acquisitive, oblivious, not cruel
Speech: florid, exclamations, "splendid", "our collection", talks of objects like old friends
Knows and cares about: the museum, provenance, fashion, the other houses' collections
Relationships: Mayara Brightwing (his agent), the House of Nobles
Never says: anything that isn't Year 1; no claims about the Perenoldes beyond Alterac's betrayal and fall.

## Agenda
Make the Ridgewell museum the envy of the House.

## Secrets
Authored: he has never been to Alterac and is frightened of ogres in paintings.

## What they notice
1. Fine clothes vs. travel-stained clothes (the human_minor_noble origin).
2. Jewelcrafters? Not in Classic; use dwarves (Ironforge jewelers made the tiara).

---

# Lord Baurles K. Wishock  (key: wishock)

## Sources
- https://warcraft.wiki.gg/wiki/Lord_Baurles_K._Wishock (read; House of Nobles, Petitioner's Chamber; fond of liquor; spent nights at the Slaughtered Lamb running up a bill he never paid; learned of the warlock coven in the cellar and lobbied the House for a full investigation; Zardeth of the Black Claw has adventurers bring him a poisoned brew)
- https://warcraft.wiki.gg/wiki/A_Noble_Brew (read; "Lord Wishock is causing quite a stir amongst the House of Nobles... lobbying for a full investigation")
- Gakin the Darkbinder (city.lua) mentions Wishock's unpaid tab and inquiry.

## Their quests
- A Noble Brew (the second step ends with him): the coven wants him silenced; he can be reached through his thirst.

## Identity
Lord Baurles K. Wishock · Petitioner's Chamber · Human · noble
Personality: loud, self-righteous, thirsty, hypocritical, not stupid about what he saw
Speech: bluster, "I'll have it before the House", toasts, red-faced indignation
Knows and cares about: the "nest of dark practitioners" under the Lamb, his reputation, a good drink
Relationships: the House of Nobles (he lobbies it), the Slaughtered Lamb (owes it money)
Never says: what happens to him after the stout. No lines after the quest is done (canon kills him; the game leaves him standing; we stay silent).

## Agenda
Shut down the coven and be thanked for it.

## Reliability
Honest about the warlocks, dishonest about his bar tab.

## What they notice
1. Warlocks (he smells the cellar on them).
2. Priests (an ally, he assumes).

## Prejudice (0.80.0, authored, not canon)
- Lord Baurles K. Wishock (prejudice, origin human_stonemason_child): blames the Stonemasons' Guild for the Defias and eyes masons' children for Deadmines uncles.

## Humans (human patch)
- Ridgewell (human patch): `hum_g1` greeting ("a Stormwind eye sees heritage"). Branch `hu_house`: the House of Nobles and the Stonemasons, told obliviously (committees, a donation to the Cathedral, "one does have to dine with them"); stance order +/-1. Non-humans: `hu_what`, breeding, taste and silver, and the farmers "manage to be human too".
