# Ironforge, missed folk A  (keys: if_buckler, if_bailey, if_balthus, if_barim, if_barnum, if_barrus, if_bingus, if_binny, if_bombus, if_bretta, if_briarthorn, if_brombar, if_bromiir, if_bruuk, if_burbik, if_hammerfall, if_demnul, if_dinita, if_dink, if_dolkin, if_dolman, if_durtham, if_edris, if_fillius, if_fimble, if_garel, if_ginny, if_goli, if_golnir, if_grenil, if_gretta, if_groum, if_grumnus, if_gwenna, if_gwina, if_harick, if_hegnar, if_hjoldir, if_ingrys)

Files: npcs/missed_a.lua (Buckler to Bromiir), npcs/missed_a2.lua (Bruuk to Garel), npcs/missed_a3.lua (Ginny to Ingrys).

## Sources
- warcraft.wiki.gg pages of the same names, via `tools/npc.py` (infobox: title, race, gender, location, relatives, quests). Read for each: job, shop, ward, kin.
- Shops as the wiki gives them: Finespindle's Leather Goods (Fimble, Bombus, Gretta, Balthus), the Fighting Wizard (Bingus, Harick), Stoneblade's (Hjoldir, Binny), Goldfury's Hunting Supplies (Bretta, Skolmin the bow merchant), Craghelm's Plate and Chain (Dolkin, Olthran), Steelfury's Weapon Emporium (Dolman, Grenil), Bruuk's Corner (Bruuk, Edris), Burbik's Supplies, Longberry's Reagents, Timberline Arms (Hegnar; Bixi, Buliwyf), Ironforge Physician (Gwina; Reyna, Nissa), Maeva's Mystical Apparel (Ingrys; Maeva), Bonegrip's Runes and Dooms (Briarthorn; Gerrig, Calder), Stonefire Tavern (Gwenna; Innkeeper Firebrew), Vault of Ironforge (Bailey, Barnum, Dinita; Soleil).
- Existing pack: commons_trade.md (Redmuse, Lympkin, Soleil), great_forge_crafts.md (Bengus, Geofram, Nissa, Gimble), wards_cavern.md (Bixi, Ormyr, Grimnur), more_folk.md (Gerrig, Calder, Granis, Muren), mystic_ward.md (Bink, Milstaff, Rohan), commons.md (Karnik, Gryth, Hulfdan), old_ironforge_forever.md.

## Their quests (all ids TODO_QUEST; wiki names are original WoW, unconfirmed for Forever)
- **Balthus**: Camping 101: Skinning (Forever). **Gretta**: Camping 101: Leatherworking (Forever). Both give a short camp lesson and teach the `camping` topic.
- **Barrus**: Could I get a Fishing Flier? (Stranglethorn Fishing Extravaganza; he is only present around the event). Not flagged in conditions.
- **Briarthorn**: warlock class quests (Orb of Orahil, Menara Voidrender, felsteed); mentioned to warlocks only, no quest flags.
- **Courier Hammerfall**: A Call to Arms: The Plaguelands! (Chillwind Camp, Ashlam Valorfist), The New Frontier (Mathrengyl Bearwalker, Darnassus), Feathermoon Stronghold (Shandris). Talked about, no quest flags.
- **Dinita**: end of The Platinum Discs (Magellas's note); `questActive` gate on TODO_QUEST("The Platinum Discs").
- **Dink**: Report to Jennea (sends mages to Jennea Cannon); mage-only reply, no flag. Magecraft (Dire Maul) not used.
- **Goli Krumn**: The Reason for the Season (Winter Veil only; sends to Historian Karnik). No flag.
- **Golnir**: Ride to Ironforge (crate from Thelsamar) and Gryth Thurden (parcel back by gryphon); `questActive` on TODO_QUEST("Ride to Ironforge").
- **Grumnus**: The Art of the Armorsmith (ornate mithril pieces; armorsmith forsakes weaponsmithing). Blacksmith-only reply, no flag.

## Identity / voice
- Auctioneer Buckler · dwarf man · loud, cheerful lot-caller; loves a bidding war; defers to Redmuse.
- Bailey Stonemantle · dwarf man · the jolly banker; jokes with customers; Dinita corrects him daily.
- Barnum Stonemantle · dwarf man · the grave banker; counts twice; "never a coin astray".
- Dinita Stonemantle · dwarf woman · stern Vault Administrator; the ledger; pays out the League's notes.
- Balthus Stoneflayer · dwarf man · gruff, patient skinner; the one dwarf among the Finespindles.
- Fimble Finespindle · gnome man · absorbed, exacting leatherworking master; "eight stitches to the inch".
- Bombus Finespindle · gnome man · brisk supplier; improves tools that didn't need it; prototype counts.
- Gretta Finespindle · gnome woman · eager apprentice; counts her practice pouches.
- Barim Jurgenstaad · dwarf man · dry reagent seller who thinks magic a bit daft; scrupulous weights.
- Ginny Longberry · gnome woman · bright, tidy; guesses a customer's school ("seven times in ten").
- Barrus · dwarf man · fishing-mad promoter; fliers for the goblins' contest.
- Bingus · gnome man · fussy weapon seller for casters; balance points and percentages.
- Harick Boulderdrum · dwarf man · placid, slow-spoken wand seller who can't use a wand.
- Binny Springblade · gnome woman · quick tinkerer; springs in everything; fond of Hjoldir.
- Hjoldir Stoneblade · dwarf man · quiet, discreet bladesmith; asks no names; plain steel.
- Bretta Goldfury · dwarf woman · bold gun seller; standing quarrel with Skolmin's bows.
- Briarthorn · gnome man · cool, exact warlock; demons as engineering tolerances; quiet voice.
- Brombar Higgleby · dwarf man · wary, dry Keymaster; hand on the key ring.
- Bromiir Ormsen · dwarf man · hearty heavy-armour seller; raps the plate to hear it ring.
- Dolkin Craghelm · dwarf man · patient mail seller; checks every ring; spars with Olthran.
- Dolman Steelfury · dwarf man · loud hammer seller; weekly tally against Grenil.
- Grenil Steelfury · dwarf man · sly blade seller; the same tally, counted his way.
- Hegnar Swiftaxe · dwarf man · boastful axe seller; kin to Granis in Kharanos.
- Bruuk Barleybeard · dwarf man · gruff ex-soldier tavern keeper; no fruit in the ale.
- Edris Barleybeard · dwarf woman · sharp barmaid; knows what the garrison really thinks.
- Gwenna Firebrew · dwarf woman · warm Stonefire barmaid; collects travellers' tales.
- Burbik Gearspanner · gnome man · proud shop-owner; loyal to Gnomeregan; calculates walking distances.
- Fillius Fizzlespinner · gnome man · anxious, chatty stall-keeper; reads the city by its thread sales.
- Courier Hammerfall · dwarf man · brisk, earnest; walks while he talks; letters from far posts.
- Demnul Farmountain · dwarf man · steady, wry old hand watching recruits in the Hall of Arms.
- Dink · gnome man · methodical mage trainer; the careful sibling to Bink's bold one.
- Durtham Greldon · dwarf man · guarded Hidden Circle lookout; tells rogues more than anyone else.
- Garel Redrock · dwarf man · genial oddity; fond of small strange creatures, murlocs most of all.
- Goli Krumn · dwarf man · grumbling traditionalist at Winter Veil; soft under it.
- Golnir Bouldertoe · dwarf man · bluff pick seller; always waiting on a late crate.
- Groum Stonebeard · young dwarf man · sheepish apprentice; nails by the thousand; proud of his father.
- Grumnus Steelshaper · dwarf man · stern master armorsmith; armour keeps folk alive.
- Gwina Stonebranch · dwarf woman · gentle, wry herb seller; pots of flowers by the forge.
- Ingrys Stonebrow · dwarf woman · frank, motherly cloth-armour seller; "dear"; mages in slippers.

## Authored, not canon
- All tempers and habits above. Kin relations the wiki leaves vague are kept vague ("kin", "kinsman"); Bailey and Barnum are written as brothers.
- The Stonemantle ledger story (two coppers, three days shut); Bailey vs Dinita on banker jokes.
- Balthus trapped in Dun Morogh before teaching; Bombus's seven stretching-frame prototypes; Gretta's hundred pouches and Fimble's old awl.
- Steelfury weekly sales tally (Dolman hammers and maces, Grenil blades); the split of stock is invented.
- Bretta and Skolmin's gun-versus-bow quarrel; Dolkin and Olthran's chain-versus-plate banter.
- Bruuk as an ex-soldier; Edris writing to soldiers' mothers; Courier Hammerfall drinking at Bruuk's.
- Demnul as a veteran who watches the drill (wiki gives only his name and the Hall of Arms).
- Durtham as the Hidden Circle's lookout in the tunnel.
- Garel's fondness for murloc hatchlings (a nod to his promotional role, never stated); he "waits for travellers from far-off gatherings".
- Brombar cuts the Vault's locks and holds a key for a door in Old Ironforge; never drinks more than two pints.
- Barim's father sold lamp oil; Harick once kept a lamp shop; Bromiir carried a shield in the Second War.
- Fillius's eleven weeks of linen and flux; his monthly tea with Burbik.
- Dink's lectern that was briefly a sheep.
- Hjoldir building Binny's springs into his hilts; her dagger through the shop sign.
- Gwina's potted flowers; Ingrys started on hemming.
- Grumnus's title: written as the Classic armorsmith (Bengus is the general trainer), who taught Therum Deepforge.

## Never
- Cataclysm and later: Moira's return and the Dark Iron guards seizing Dink and Bink, the Council of Three Hammers, Grumnus retiring to Thelsamar, "Interest Yah In A Pint?".
- Dire Maul, Molten Core or anything past year 1; no promises of discounts, gifts or the pet Garel's real-world role handed out.
- Naming who the Hidden Circle targets beyond "the Dark Irons"; Brombar never says what the Old Ironforge door hides.
