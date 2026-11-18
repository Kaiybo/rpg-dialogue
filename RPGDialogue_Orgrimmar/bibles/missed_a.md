# Orgrimmar, missed folk A  (keys: advisor_willington, holamahi, grunt_korf, grunt_bekrah, grinkle, furmund, emissary_blackhoof, frezza, krathok, aturk, borgosh, kelgruk, gorina, koru, kiro, asoran, magenius, borstan, korgeld, jhag, kithas, korghan, kali_remik, estelle_gendry)

Files: npcs/missed_a.lua (Hall of Legends, Valley of Strength, Valley of Wisdom, zeppelin tower), npcs/missed_a2.lua (Valley of Honor), npcs/missed_a3.lua (the Drag, Cleft of Shadow, and two posted elsewhere in Classic).

## Sources
- warcraft.wiki.gg pages (via tools/npc.py; infobox, intro, quest list only; quotes not available from the tool, all voices authored):
  Advisor_Willington, First_Sergeant_Hola'mahi, Grunt_Korf, Grunt_Bek'rah (Hall of Legends); Grinkle (Fishing Promoter, Valley of Strength, only around the Stranglethorn Fishing Extravaganza); Furmund (Valley of Strength during Winter Veil; dislikes Smokywood Pastures' commercialising; sends to Sagorne Creststrider); Cenarion_Emissary_Blackhoof (Valley of Wisdom; Taking Back Silithus); Frezza (Tirisfal zeppelin master, Steamwheedle; safety notice, no smoking or fire magic; sister Snurk Bucksquick).
  Krathok_Moltenfist (Burning Anvil; spoken to before The Art of the Armorsmith / The Way of the Weaponsmith), Aturk_the_Anvil (grumpy smith, fond of the old days of war, finds Thrall's peace between clans unbelievable but obeys; The Old Ways), Borgosh_Corebender (dreams of a legendary hammer fit for a warchief; The Way of the Weaponsmith), Kelgruk_Bloodaxe, Gorina (Mining Supplies), Koru (Mace & Staves), Kiro_(orc) (War Harness Maker; Kiro's Harnesses, Valley of Honor before Cataclysm).
  Asoran (General Goods, Asoran's Market, the Drag), Magenius (Reagents, the Drag; seen with Asoran), Borstan (Meat Vendor, the Drag), Kor'geld (Alchemy Supplies, the Drag; vials), Jhag and Kithas (Godan's Runeworks, the Drag), Kor'ghan (in front of Rekkul's Poisons, Cleft of Shadow; Finding the Antidote), Kali_Remik (Sen'jin Village before Cataclysm), Estelle_Gendry (Rogues' Quarter, Undercity; thieves' tools for rogues before Cataclysm).
- Existing packs: thatog.md and valley_of_wisdom_kids.md (Meal Appeal, Favorite Food, sweetglazed hog belly crumbs, Migi), Durotar rhinag.lua (Need for a Cure; Kor'ghan as Rhinag's teacher, forty boars, "disappointed, not angry"), more_folk.md (Zarg, Stonehide, Sagorne, Zamja), townsfolk.lua (Makaru, Saru Steelfury), yelmak.md, rekkul.md, Undercity mennet.lua.

## Their quests
- Grinkle: Could I get a Fishing Flier? (BUSINESS). Furmund: The Reason for the Season (Winter Veil; to Sagorne Creststrider). Blackhoof: Taking Back Silithus.
- Krathok: gate for the armorsmith/weaponsmith choice (BUSINESS, smiths only; no quest id used). Aturk: The Old Ways. Borgosh: The Way of the Weaponsmith.
- Borstan (Forever): Meal Appeal (ends), Favorite Food (gives). Changing Tastes is listed for him on the wiki but not referenced (content unknown).
- Kor'geld (Forever): Yelmak's Medley (one reactive line only; content unknown). Jhag (Forever): Camping 101: Enchanting (sender not named).
- Kor'ghan: Need for a Cure (Rhinag's, ends here) and Finding the Antidote (venomtail poison sacs).
- All ids TODO_QUEST / TODO_NPC.

## Identity / voice
- Advisor Willington · Forsaken man · dry Lordaeronian clerk; "I supply the arithmetic"; hates the heat; speaks for the Undercity.
- First Sergeant Hola'mahi · Darkspear woman · sly, sizes soldiers up like a tailor; armor is earned, never bought.
- Grunt Korf · orc man · gruff, few words; wants to walk through the door as more than its guard.
- Grunt Bek'rah · orc woman · loud, envious of the officers, hungry for war stories.
- Grinkle · goblin man · nonstop pitch; the contest fills Booty Bay's inns and he takes his cut.
- Furmund · tauren man · slow, sorry more than angry; "a herd that forgets why it gathers".
- Cenarion Emissary Blackhoof · tauren man · grave, unhurried; the Circle before either banner; silithid as a sickness.
- Frezza · goblin man · brisk schedule-keeper; perfectly safe, then the fire rules.
- Krathok Moltenfist · orc man · stern judge of other smiths; will not say which path he took.
- Aturk the Anvil · orc man · grumbles in time with the hammer; misses the wars, obeys Thrall.
- Borgosh Corebender · orc man · driven; every weapon is practice for the hammer.
- Kelgruk Bloodaxe · orc man · steady, dry; a hundred plain axes and content with it.
- Gorina · orc woman · plain; no haggling over a tool your life hangs on.
- Koru · orc man · gruff, fair; sure of the wood, unsure of the staff customers.
- Kiro · orc woman · proud harness maker; trades insults with Aturk.
- Asoran · orc man · plain quartermaster turned shopkeeper.
- Magenius · orc man · curious non-caster who studies casters.
- Borstan · orc man · hearty, loud; smoke as his crier; fond of Migi.
- Kor'geld · orc man · careful with glass; counts the bangs from the back room.
- Jhag · orc man · eager young enchanter; defers to Godan.
- Kithas · orc woman · dry, weighs everything twice; soft spot for Jhag she denies.
- Kor'ghan · Darkspear man · calm, exacting teacher; poison into cure.
- Kali Remik · Darkspear woman · easy, watchful; the lost islands.
- Estelle Gendry · Forsaken woman · dry, sly; locks as arguments in iron.

## What they notice
- Willington: Forsaken, rank. Hola'mahi: trolls, rank. Korf: rank, warriors. Bek'rah: rank, tauren. Grinkle: fishers, trolls. Furmund: tauren, shaman. Blackhoof: druids, tauren. Frezza: mages/warlocks/shaman (fire), Forsaken.
- Krathok, Aturk, Borgosh, Kelgruk: blacksmiths, warriors (Borgosh also shaman). Gorina: miners. Koru: casters, shaman, warriors. Kiro: orcs, tauren, warriors.
- Asoran: low level, hunters. Magenius: shaman, warlocks, mages. Borstan: hunters, cooks, tauren. Kor'geld: alchemists. Jhag, Kithas: enchanters (Jhag also shaman). Kor'ghan: rogues, trolls, hunters, shaman/priests. Kali Remik: trolls, orcs, hunters, pets. Estelle: rogues, the living, Forsaken.

## Authored, not canon
- Willington kept accounts in life; he reads casualty figures to the officers; Hola'mahi was a headhunter.
- Korf asked for the post; Bek'rah carried stone when the walls went up; the goblin who tried to sell Zarg an axe.
- Grinkle's cut from the Cartel; "sold one bridge". Furmund walks from Thunder Bluff each winter. Blackhoof was a hunter before a druid.
- Frezza's and Snurk's routes "sewn up" by the family.
- Krathok refuses to say which specialisation he chose; Aturk sat idle in an internment camp; Borgosh's hammer is for a future warchief, never to replace Doomhammer; Kelgruk's kin carried axes.
- Gorina's broken pick; Koru carried a mace for the Horde; Kiro's mother and grandmother made harnesses; kodo hide from the Barrens.
- Asoran hauled supplies on the march across the Barrens; Magenius wanted to be a shaman.
- Borstan cooked for a warband; the overnight hog belly; banter with Zamja and Asoran.
- Kor'geld's four broken vials, students' explosions in the back room; Jhag is a smith's son, draws runes in sand; Kithas kept a warband's stores.
- Kor'ghan stands at Rekkul's door so buyers can find a cure; learned on the islands.
- Kali Remik grew up with trolls now under Zalazane. Estelle was a locksmith's daughter in Lordaeron; the dwarven strongbox.

## Placement notes
- Frezza stands at the zeppelin tower outside Orgrimmar's gates (Durotar) in Classic; written without naming the Skyway.
- Kali Remik (Sen'jin Village) and Estelle Gendry (Rogues' Quarter, Undercity) are only in Orgrimmar from Cataclysm / Battle for Azeroth on. They are written for their Classic posts (communities "senjin" / "undercity") and can be moved to the Durotar and Undercity packs.
- Blackhoof arrived with the Silithus content (1.8); he speaks only of the silithid and the Circle's hold, with no war effort or gates.

## Never
- Cataclysm Orgrimmar: the Moonglade portal beside Blackhoof, the Skyway, the inn in the Valley of Spirits, Garrosh, Vol'jin's death scenes, heirlooms.
- The Hall of Legends as anything but the officers' hall. Later hunter quests for Kali Remik. Scorpid quests added for Kor'ghan after Classic.
- The opening of Ahn'Qiraj; Blackhoof only knows a wall the elves will not speak of.
