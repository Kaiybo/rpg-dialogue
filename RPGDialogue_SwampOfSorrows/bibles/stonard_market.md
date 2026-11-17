# Stonard: the prisoner and the stalls  (keys: marksen, rogvar, thultash, hartash, hekkru)

File: `npcs/stonard_market.lua`.

## Sources
- https://warcraft.wiki.gg/wiki/Stonard (read: NPC list; Lands of Conflict note on caravans twice a year and fine weaponsmiths)
- https://warcraft.wiki.gg/wiki/Infiltrator_Marksen (read: human spy captured while spying on Beggar's Haunt; guarded by Grunt Tharlak and Grunt Zuul; quest ender of Nothing But The Truth (4); drinks Zraedus' brew, says the Forsaken are misleading the Horde's allies, turns zombie and collapses)
- https://warcraft.wiki.gg/wiki/Nothing_But_The_Truth, (2), (3), (4), Deathstalker_Zraedus, Beggar%27s_Haunt (read)
- https://warcraft.wiki.gg/wiki/Rogvar (read: alchemy trainer; gossip "Warchief Thrall himself asked me to come out here... any herb I might need grows in the muck here"; Stonard once had the Horde's master alchemist)
- https://warcraft.wiki.gg/wiki/Thultash, Hartash, Hekkru, Gharash (read: vendor/stable stubs, no gossip)

## Their quests
- Marksen, Nothing But The Truth (4) (ends): he pleads for mercy, has information "beyond alliance boundaries", no sympathizer of the Horde; "A drink for me? How kind. It's been days since they've allowed me to drink." Fear, cunning, thirst.
- Rogvar, Thultash, Hartash, Hekkru: none.

## Identity
- Infiltrator Marksen · human male · Alliance prisoner in Stonard. Personality: nervous, sly, desperate, funny under pressure. Speech: quick, wheedling, "friend". Terrified of Forsaken. Never names the New Plague outright.
- Rogvar · orc male · alchemy trainer. Cheerful, proud of Thrall's request. Knows the swamp's herbs (blindweed, sungrass, liferoot).
- Thultash · orc male · meat and drink. Gruff, proud of his smoking; rivalry with Tok'Kar's cooking.
- Hartash · orc male · weapon merchant. Gruff, obsessed with oil and rust; prefers axes.
- Hekkru · orc male · stable master (elite). Gruff with people, gentle with beasts.

## What they notice
- Marksen: Forsaken (fear), Alliance colors, drink. Rogvar: alchemy, herbalism, Forsaken apothecaries. Thultash: hunger, tauren/troll tastes. Hartash: warriors, rogues, worn gear. Hekkru: pets, hunters.

## Topics
- none learned (kept small).

## Notes on quest gating
- All four "Nothing But The Truth" parts share one title, so Marksen's brew lines use `questReady` (part 4 is a delivery and is ready as soon as it is taken). Ogromm's panther-hearts line uses `questObjective` (part 2).

## Authored, not canon
- Marksen: watched "the old scout tower in north Duskwood" for Stormwind; Tharlak growls and Zuul ignores him; orcs await an officer to question him; asks an Alliance player to tell Darkshire's Night Watch. The player can warn him about the Forsaken brew (the quest still completes the same way). After the quest (he respawns in game) he is foggy and unwell and can't remember what he meant to say; the lore has him die.
- Rogvar: Thrall told him the Horde needs draughts more than axes; he took up alchemy after grunts died of fevers; Rartar and Thultazor as his suppliers.
- Thultash: smokes meat twice over swamp oak; crocolisk passed off as boar ("never lies, just doesn't volunteer"); sells half his meat to Karakul; Dar carries insults between him and Tok'Kar.
- Hartash: oils everything nightly; ore from the caravans, Gharash melts broken blades when caravans are late; sells long knives and maces.
- Hekkru: once kept wolves for the Frostwolves in Alterac; lost three beasts this year; keeps an old cat whose troll owner went into the Sunken Temple two winters ago (Grokor mentions the same cat).
