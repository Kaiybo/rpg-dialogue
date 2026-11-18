# Thunder Bluff, the missed folk  (47 NPCs in npcs/missed.lua, missed2.lua, missed3.lua, missed4.lua)

Keys:
- missed.lua (lower rise): atepa, torn_tb, auctioneer_gullem, auctioneer_stampi, chepi, hewa, elki_tb, krumn, thrumn, kurm_stonehoof, kuruk, pakwa, shadi_mistrunner, taur_stonehoof, thrag_stonehoof
- missed2.lua (middle rise): fela, grod_tb, tagain, tepa, vhan, tarn_tb, mak_tb, mahu, kray, teg_dawnstrider, mot_dawnstrider, nata_dawnstrider, nan_mistrunner, tand_tb
- missed3.lua (High Rise): delgo_ragetotem, etu_ragetotem, kard_ragetotem, ohanko, hogor_thunderhoof, halpa, naal_mistrunner, sewa_mistrunner, sura_wildmane
- missed4.lua (outer rises, bridges): henen_ragetotem, kon_yelloweyes, birgitte_cranston, pand_stonebinder, pawe_mistrunner, sheza_wildmane, hunter_ragetotem, hunter_sagewind, hunter_thunderhorn

## Sources
- warcraft.wiki.gg zone roster for Thunder Bluff; each NPC's own page via `tools/npc.py` (read: infobox and first paragraph only; Classic ids 2798-14442).
- Lower rise: Atepa, Torn (bankers, Thunder Bluff Bank); Auctioneer Gullem, Auctioneer Stampi; Chepi (reagents); Hewa (cloth) and Elki (mail) at Hewa's Armory; Krumn (guild master), Thrumn (tabards); Kurm Stonehoof (mining supplies); Kuruk (general goods); Pakwa (bags); Shadi Mistrunner (trade supplies); Taur Stonehoof (blacksmithing supplies) and Thrag Stonehoof (apprentice) at Karn's Smithy.
- Middle rise: Fela (heavy armor), Grod (leather), Tagain (cloth); Tepa (tailoring trainer), Mak (leatherworking supplies), Tarn (apprentice leatherworker) in Thunder Bluff Armorers; Vhan (apprentice tailor); Mahu (leatherworking & tailoring supplies); Kray (apprentice alchemist, Bena's Alchemy); Teg Dawnstrider (enchanting trainer; son Mot), Mot Dawnstrider (apprentice enchanter), Nata Dawnstrider (enchanting supplies); Nan Mistrunner (fruit); Tand (Cloudweaver's Baskets).
- High Rise: Delgo (axes), Etu (maces & staves), Kard (swords & daggers) Ragetotem; Ohanko (two-handed weapons); Hogor Thunderhoof (Thunderhoof's Firearms); Halpa (prairie dogs, small hut facing out between the Hunter Rise bridge and Cairne's lodge); Naal Mistrunner (cooking supplies, Aska's Kitchen); Sewa Mistrunner (fishing supplies); Sura Wildmane (war harnesses).
- Outer rises: Henen Ragetotem, Kon Yelloweyes (Hunter Rise, no title); Birgitte Cranston (Forsaken portal trainer, Pools of Vision); Pand Stonebinder (first aid, Spiritual Healing tent, Spirit Rise); Pawe Mistrunner (Spirit Rise, no title); Sheza Wildmane (Elder Rise, in front of Elder Rise Drums).
- Hunter Ragetotem (patrols the bank and walkways), Hunter Sagewind, Hunter Thunderhorn (patrol the walkways).
- Not used: everything in the wiki's Legion/BfA sections (the Highmountain feast, the Void, Sheza's life debt and stolen leathers). Etu and Sewa drinking together and Sura standing near Sunn Ragetotem are taken from that later scene only as "they are neighbours who get on".
- Existing pack: townsfolk.md (Chesmu, Una, Bena, Aska, Kah), bluff_craftsfolk.md (Ahanu at Hewa's Armory: Hewa keeps the coin, never turns a young hunter away; Karn's smithy), more_folk.md (Sunn Ragetotem's rainsticks, Fyr's bread, Jyn Stonehoof), spirit_rise (Thurston Xane likes to chat; Apothecary Zamah), hunter_rise (Sark, Torm, Urek, Kary, Holt, Kuna).

## Their quests
- Forever: Thrag Stonehoof (Camping 101: Blacksmithing), Vhan (Camping 101: Tailoring), Kray (Camping 101: Alchemy), Mot Dawnstrider (Camping 101: Enchanting). Listed on their wiki pages; ids and exact steps unconfirmed, so the lines only react to the quest being active or done (`TODO_QUEST`) and say in general terms what the craft does for a camp. These four are tier "quest".
- Everyone else: none in Classic.

## Identity / voice
All tauren unless noted: slow, whole sentences, Earth Mother, plains and herd imagery, no jokes at anyone's expense.
- Atepa · careful banker, the one who checks the other two. Torn · the quick young banker, knotted tally cords. Both name Chesmu as the eldest.
- Auctioneer Gullem · deep, unhurried, fair. Auctioneer Stampi · young, loud, delighted by oddities; stamps a hoof at a bid.
- Chepi · gentle reagent seller; "a spell is a bargain"; uneasy with warlocks, fair to Forsaken.
- Hewa · counts twice, gives in to Ahanu anyway. Elki · plain mail seller, tests rings with his thumb.
- Krumn · grave about charters ("a small tribe that chooses itself"). Thrumn · fussy about colours, hates skulls on black.
- Kurm Stonehoof · gruff; ask leave of the earth; dislikes Venture Company and Bael'dun digging.
- Kuruk · easy and chatty by the lifts. Pakwa · brisk, repacks strangers' kits. Shadi Mistrunner · the Mistrunner who sells thread, not food.
- Taur Stonehoof · dry, keeps the smithy fed. Thrag Stonehoof · strong, eager apprentice who breaks hammers.
- Fela · blunt heavy-armor seller. Grod · soft-spoken, knows each hide's story. Tagain · warm gossip, straightens sleeves.
- Tepa · patient, exacting; friendly argument with Una. Vhan · shy, apologetic, good with tents. Tarn · cheerful, cocky, smells of the tub. Mak · dry, stands upwind. Mahu · agrees with everybody.
- Kray · careful, curious about Forsaken measures. Teg Dawnstrider · thoughtful; enchanting as cousin to totem carving. Mot · bright, impatient, tired of grinding. Nata · wry, runs the lodge.
- Nan Mistrunner · motherly, feeds everyone. Tand · slow and content, one reed in three.
- Delgo Ragetotem · proud, gruff. Etu Ragetotem · the Ragetotem who laughs. Kard Ragetotem · quiet, keen on edges. Ohanko · grave; a two-hander means giving up the shield.
- Hogor Thunderhoof · gun enthusiast, argues with the elders and with Kuna's bows. Halpa · shy, gentle, raises orphaned prairie dogs.
- Naal Mistrunner · cheerful errand-runner for Aska. Sewa Mistrunner · wry, patient. Sura Wildmane · proud, exacting fitter.
- Henen Ragetotem · stern watcher of the sparring ring. Kon Yelloweyes · quiet, sees everything.
- Birgitte Cranston · Forsaken woman · cold, precise, dry; tired of drums and of being pitied kindly.
- Pand Stonebinder · gentle, practical; "press first, bind after". Pawe Mistrunner · thoughtful; says the names of the dead at sunrise. Sheza Wildmane · warm, proud drum keeper.
- Hunter Ragetotem · brisk, stern. Hunter Sagewind · calm, listens to the wind. Hunter Thunderhorn · friendly, would rather be hunting. All three talk while walking.

## Authored, not canon
- The bankers' division of work; Torn's tally cords and his grandmother.
- Gullem and Stampi's temperaments; the brass bird; plainstrider beaks.
- Chepi gathers her own seeds and takes candles from Forsaken priests.
- Krumn and Thrumn work side by side (same lodge); Thrumn once painted totem poles.
- Kurm works alongside Brek Stonehoof; Kuruk's lodge is near the lifts; Pakwa and Tand's friendly rivalry.
- Shadi's quarrel with Aska over leaving the kitchen; which trainers send the most students.
- Taur as Karn's kinsman and the split anvil stone; Thrag's kept spearhead, carried by Hunter Ragetotem.
- Fela, Grod and Tagain share one armor lodge; Grod knows each hide's origin; Tagain and Hewa trade bundles.
- Vhan's brothers and the tent that did not leak; Tarn's boots; Mak's old tanning methods; Mahu between the two lodges.
- Kray's cleft stick, the failed batches on Komin's herb beds, his questions for Zamah's apothecaries.
- Teg as a former totem carver; Mot's enchanted bracers; Nata as Dawnstrider kin (relation left unstated) and the cracked rods.
- Nan's nephews carry fruit up the lifts; a bitter melon season near the fouled wells. Tand's teacher named Cloudweaver; reeds from Stonebull Lake.
- The Ragetotem as the tribe that met the centaur first; Etu's dropped totem; Kard's grass test; Kard selling mostly to allies.
- Hogor's first gun bought at Ratchet; the elder's grandson. Halpa's orphans. Aska's pepper for the Forsaken.
- Kah stocking the High Rise pond by waterskin; Sewa and Etu sharing a horn in the evenings.
- Sura marks harnesses with tribe colours; Nara and Kym as her kin (same tribe name only).
- Henen's centaur lesson; Kon's grandmother and his reports to the Hunter's Hall.
- Birgitte studied in Lordaeron and was "volunteered" for Thunder Bluff.
- Pand on the long walk; Pawe's sunrise names and the bowl of water at the cave mouth.
- Sheza as the keeper and maker of the Elder Rise drums, and the drum signals.
- The hunters taking turns on the walkways; harpies off the northern cliffs.

## Never
- Legion or later: the Highmountain feast, the Void, Sheza's life debt, the Fourth War.
- Cataclysm Thunder Bluff (Baine as chieftain, Grimtotem coup, Sunwalkers, tauren paladins or priests).
- Tauren mages: Birgitte's students are Forsaken and trolls.
- Promises of discounts, gifts or repairs.
