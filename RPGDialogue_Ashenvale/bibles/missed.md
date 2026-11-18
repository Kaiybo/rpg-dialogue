# Ashenvale, missed folk  (keys: caelyb, cylania_rootstalker, danlaar_nightstride, harklan_moongrove, jayla, kylanna, ulthaan, lardan, llana, tandaan_lightmane, sentinel_onaeya, melyria_frostshadow, krolg, anilia, andruk, kilhiwana, wiktar, ertog_ragetusk, fahrak, framnali, haralen, pixel, vera_nightshade, feran_strongwind, apothecary_falthis, darkslayer_mordenthal)

Files: `npcs/missed.lua` (Alliance side), `npcs/missed2.lua` (Horde side).

## Sources
- warcraft.wiki.gg pages of each NPC via `tools/npc.py` (title, place, quests). "Deceased" on the Silverwind Refuge folk and on Feran, Anilia and Llana is the Cataclysm; all are written alive, in Classic places.
- Silverwind Refuge (Alliance in Classic): Caelyb (pet trainer), Cylania Rootstalker (herbalism trainer), Danlaar Nightstride (hunter trainer), Harklan Moongrove (alchemy supplies), Jayla (skinning trainer), Kylanna (alchemy trainer), Ulthaan (butcher). Kept consistent with `velene.lua` (befouled water elementals in Mystral Lake, a summoner behind them).
- Astranaar: Lardan (leatherworking supplies), Llana (reagents; Forever: Seeking Caitlin), Tandaan Lightmane (leather armor). Neighbours from astranaar.lua / astranaar_more.lua (Raene, Faldreas's list).
- Sentinel Onaeya: outside the main building at Maestra's Post. Her wiki quests are Cataclysm and unused; she is a guard here. Neighbours: Delgren the Purifier, Liladris Moonriver; the Dark Strand cult at Ordil'Aran / the Tower of Althalaxx.
- Sentinel Melyria Frostshadow: Raynewood Retreat; Classic quests The Howling Vale and Velinde Starsong (the Scythe of Elune thread; to Thyn'tel Bladeweaver in Darnassus). Her other wiki quests are Cataclysm.
- Krolg: uncorrupted Foulweald furbolg, Krolg's Hut south of Mystral Lake; Classic Raene's Cleansing (Dartol's Rod, Ran Bloodtooth, Chief Murgut and the totem mound). Consistent with Raene/Teronis in astranaar.lua.
- Anilia: dryad at Xavian; ends Vile Satyr! Dryads in Danger!, gives The Branch of Cenarius. Consistent with Illiyana in ashenvale_folk.lua (Geltharis took the Branch; Anilia spoke before she died).
- Zoram'gar Outpost: Andruk (wind rider master), Kil'Hiwana (fishing trainer) and Wik'Tar (fish merchant & supplies), who stand together.
- Splintertree Post: Ertog Ragetusk (Torek's Assault is reported to him; consistent with torek.lua), Fahrak, Framnali, Har'alen, Vera Nightshade (at the inn), Pixel (goblin supplier holding Warsong saw blades until paid; Classic Satyr Horns and Warsong Saw Blades). Feran Strongwind: the small camp southwest of Splintertree with Gurda Ragescar (more_folk.lua: her lost shredder manual).
- Apothecary Falthis (Bathran's Haunt; Forever: Apothecary's Concoction) and Darkslayer Mordenthal (the Forsaken camp / Dor'Danil): rare Forsaken, Horde-faction in Classic, so written for Horde visitors.

## Their quests
- Melyria: The Howling Vale, Velinde Starsong. Krolg: Raene's Cleansing. Anilia: Vile Satyr! Dryads in Danger! (ends), The Branch of Cenarius.
- Ertog: Torek's Assault (turn-in). Pixel: Satyr Horns, Warsong Saw Blades.
- Forever, details not captured, written loosely: Llana's Seeking Caitlin (she points toward a human alchemist at Menethil Harbor, matching Caitlin Grassman in the Wetlands pack), Falthis's Apothecary's Concoction (he wants listed ingredients brought to him).

## Identity / voice
- Caelyb · night elf man · easygoing; crouches to the beast's eye level.
- Cylania Rootstalker · night elf woman · earnest, protective of every plant.
- Danlaar Nightstride · night elf man · spare, exact; watches road and lake.
- Harklan Moongrove · night elf man · fastidious, courteous; clean glass.
- Jayla · night elf woman · matter-of-fact; three rules of skinning.
- Kylanna · night elf woman · absorbed, bright, in a hurry for a kaldorei.
- Ulthaan · night elf man · hearty; "a tidier sort of wolf".
- Lardan · night elf man · unhurried, wry about the war.
- Llana · night elf woman · serene, discreet, too observant.
- Tandaan Lightmane · night elf man · earnest; remembers every scout he dressed.
- Sentinel Onaeya · brisk, guarded; making up her mind about humans.
- Sentinel Melyria Frostshadow · grave, conscientious; reads Velinde's papers.
- Krolg · furbolg · wary, sorrowful; speaks of himself as Krolg; simple whole sentences.
- Anilia · dryad · fading and brave; all her breath for the Branch and Illiyana.
- Andruk · orc man · gruff; gentle only with wind riders.
- Kil'Hiwana · troll woman · patient, sly. Wik'Tar · troll man · talkative; they tease each other.
- Ertog Ragetusk · orc man · shrewd, hearty; respects the elves as foes.
- Fahrak · orc man · blunt, restless, too young for Hyjal.
- Framnali · troll woman · wry, watchful; hears the forest's spirits.
- Har'alen · tauren woman · gentle, troubled by the logging, loyal anyway.
- Pixel · goblin woman · pushy, cheerful; payment before delivery.
- Vera Nightshade · Forsaken woman · dry, cold observer in the inn's corner.
- Feran Strongwind · tauren man · calm, dry; listens to birds.
- Apothecary Falthis · Forsaken man · clinical, impatient.
- Darkslayer Mordenthal · Forsaken man · grim, curt.

## Authored, not canon
- The Silverwind folk's small habits and their views of one another (Kylanna leaves stoppers out, two small fires; Harklan carries water from a stream; Jayla's three rules; Ulthaan used to sell lake fish; Danlaar finds orc wolf sign on the south shore).
- Tandaan's uncollected jerkin; Lardan and Tandaan's running debt; Llana's customers bound for Maestra's Post.
- Krolg was a honey gatherer; his stubbornness; that he does not know why he was spared.
- Anilia's "thousand springs" with Illiyana.
- Melyria served on the Felwood border; her doubts about the Scythe (kept to what the Classic quest text implies; no worgen origin is explained).
- Andruk and Fahrak's internment-camp pasts; Kil'Hiwana and Wik'Tar from the Echo Isles / Sen'jin.
- Framnali's nightly offering; Har'alen coaxing seedlings; Vera's reason for being in Ashenvale (the Royal Apothecary Society's interest in the forest); Feran standing up so elf scouts withdraw.
- Fahrak, Framnali, Har'alen and Vera have no role on the wiki; everything beyond name, race and place is authored.
- Falthis was an herbalist in Brill; his findings about the plants; "Bathran" being a druid buried there is his guess, not lore.
- Mordenthal's past as a soldier of Lordaeron; the four thieves buried by the lake (echoes the Alliance quest Forsaken Diseases from Forest Song).
- Pixel's buyer in Ratchet for satyr horns.

## Never
- Cataclysm Ashenvale: Silverwind Refuge taken by the Horde, Hellscream's Watch, Onaeya's and Melyria's later quests, Krolg's brother Ota Wen, King of the Foulweald, Dead Elves Walking.
- Worgen lore past Classic (Goldrinn, Gilneas, druids of the scythe). Garrosh. The Wrathgate or any named new plague.
- Discounts, gifts or rewards beyond what a quest itself gives.
