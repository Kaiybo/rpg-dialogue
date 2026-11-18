-- Origin letters for gnomes: one from home early on, one after a fitting milestone.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Refugee from Gnomeregan
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_gnomeregan_refugee_1", from = "Pella Brasswhistle", stranger = true, delay = 1200,
  when = { origin = "gnome_gnomeregan_refugee", minLevel = 6 },
  subject = "From the bunk room",
  body = "{name},\n\nIt's Pella from the bunk below yours in Tinker Town, the one who talks in her sleep about pressure valves. I'm writing because the dwarves gave your bunk to a family of five and I wanted you to know it went to good use, and also that the smallest one kicks.\n\nThe soup kitchen ran out of turnips on Thursday and served something the cook called stew with a very straight face. Nobody complained, because nobody here has the right to, but we all thought very hard about turnips.\n\nI still dream about the lower levels too, if that helps. Most nights it's the sound of the alarms, and some nights it's the smell of the gardens before. I hope out there you dream about something else.\n\nYour bunkmate, Pella",
}

P:Letter {
  id = "origin_gnome_gnomeregan_refugee_2", from = "Pella Brasswhistle", stranger = true, delay = 2400,
  when = { origin = "gnome_gnomeregan_refugee", cleared = "Gnomeregan" },
  subject = "You went back",
  body = "{name},\n\nYou went back. Everyone in Tinker Town is saying it, and old Fizzlecog cried into his soup, and I had to go and sit by the tram for a while because I couldn't decide whether I wanted to laugh or be sick.\n\nI keep asking myself whether you passed our street on the way down, the one with the blue lamps by the canal. You don't have to tell me what it looks like now, and honestly I'd rather you didn't, but I'd like to know you walked it.\n\nThermaplugg's had his comeuppance, and the city's still poisoned, and nothing's fixed. But for one evening the whole bunk room sang the old engineering songs, and nobody's done that since the fall.\n\nPella",
}

---------------------------------------------------------------------------
-- Tinker's apprentice
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_tinker_apprentice_1", from = "Master Tinker Orvin Gearloose", stranger = true, delay = 1200,
  when = { origin = "gnome_tinker_apprentice", minLevel = 6 },
  subject = "Workshop report",
  body = "Apprentice {name},\n\nA brief workshop report, since you left without filling in your logbook, which I have decided to take personally.\n\nOne, the scorch mark on the ceiling from your third explosion has been painted over and is still visible. Two, the spring-loaded teapot works now, more or less, though it throws the lid at whoever lifts it. Three, the new apprentice is very tidy and has caused no fires at all, which I find a little dull.\n\nPlease remember that every failure is data, and that data is only useful if somebody writes it down. Carry a notebook, wear your goggles, and never test a prototype while standing directly in front of it.\n\nYours in sprockets,\nOrvin Gearloose, Master Tinker",
}

P:Letter {
  id = "origin_gnome_tinker_apprentice_2", from = "Master Tinker Orvin Gearloose", stranger = true, delay = 2400,
  when = { origin = "gnome_tinker_apprentice", minLevel = 30 },
  subject = "Promising, confirmed",
  body = "{name},\n\nI said you were promising, and I am now in the very pleasant position of having been right. Visitors to the workshop keep mentioning a {race} {class} who's been seen from Menethil to Ratchet, and when I say you used to be my apprentice, they look at me with new respect, which is a nice change from looking at the ceiling.\n\nThe new apprentice has finally set something on fire. It was a small fire and quite a sensible one, and I was so relieved I nearly gave him a holiday.\n\nIf you find any interesting mechanisms on your travels, sketch them for me. I don't need the parts, only the diagrams, and perhaps an account of what they did right before they exploded.\n\nOrvin",
}

---------------------------------------------------------------------------
-- Raised in Tinker Town
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_ironforge_raised_1", from = "Granny Tilly Copperbuckle", stranger = true, delay = 1200,
  when = { origin = "gnome_ironforge_raised", minLevel = 6 },
  subject = "Mind the stairs",
  body = "Sweet pea,\n\nI know you're grown, but you'll always be my sweet pea, so you'll just have to put up with it.\n\nThe dwarf next door, Mister Harlan, has finally learned my name after nine years, and now he calls it out every morning like a town crier. I've decided to find it charming. The Deeprun Tram broke down twice this week, and the second time a whole carriage of Stormwind folk had to walk back through the dark, complaining in very fine accents.\n\nYou were always clever and quiet, because that's what this city taught you. Out there you're allowed to be loud, too, so try it once and see how it feels.\n\nYour loving granny, Tilly",
}

P:Letter {
  id = "origin_gnome_ironforge_raised_2", from = "Granny Tilly Copperbuckle", stranger = true, delay = 2400,
  when = { origin = "gnome_ironforge_raised", minLevel = 20 },
  subject = "Mister Harlan asked",
  body = "Sweet pea,\n\nYou'll never guess who asked after you. Mister Harlan next door, who's never asked after anybody but his own beard, leaned over the railing this morning and wanted to know whether the young {class} from Tinker Town was keeping well.\n\nHe says the soldiers in the Military Ward have heard your name from the Wetlands and further, and that a gnome getting talked about in the Stonefire Tavern is a rare thing. Then he went red and said that he'd always known you'd do something, which is a fib, because he once called you the mouse.\n\nI've told everyone on the street, twice. Keep warm and keep being a little bit loud.\n\nGranny Tilly",
}

---------------------------------------------------------------------------
-- Survivor of the Gnomeregan rearguard (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_rearguard_1", from = "Corporal Nessa Sparkbolt", stranger = true, delay = 1200,
  when = { origin = "gnome_rearguard", minLevel = 6 },
  subject = "From what's left of the squad",
  body = "{name},\n\nThere are four of us left from the corridor now that you've gone, and we still meet at the same table in Tinker Town every seventh day and pretend the tea is beer. We kept your chair, which Bix says is sentimental, but he's the one who wipes it down.\n\nI saw one of the High Tinker's aides in the market. He asked whether any of the rearguard needed anything, and none of us knew what to say, so we asked for better boots. We got the boots, which was nice.\n\nYou held that corridor longer than any of us, and then you ran when it was right to run. That's not cowardice, {name}, that's arithmetic. Stop running when you're ready, not before.\n\nNessa",
}

P:Letter {
  id = "origin_gnome_rearguard_2", from = "Corporal Nessa Sparkbolt", stranger = true, delay = 2400,
  when = { origin = "gnome_rearguard", cleared = "Gnomeregan" },
  subject = "You stopped running",
  body = "{name},\n\nWe heard. You went back into Gnomeregan and walked down the same corridor we held, and this time you went all the way to the bottom and made Thermaplugg answer for it.\n\nBix didn't say anything at all for an hour. Then he stood up, saluted your empty chair, and sat back down, and none of us laughed at him, because we'd all been thinking of doing it.\n\nI don't know whether that's the end of running for you, and I don't think it has to be. But you can tell yourself now that you came back to finish it, and nobody, gnome or dwarf, can ever take that from you.\n\nThe table's waiting, and so is your chair.\n\nNessa, for the squad",
}

---------------------------------------------------------------------------
-- Scavenger of fallen Gnomeregan (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_scavenger_1", from = "Gimble Ratchetwick", stranger = true, delay = 1200,
  when = { origin = "gnome_scavenger", minLevel = 6 },
  subject = "Business is slow",
  body = "{name},\n\nBusiness is slow without you. I've had three tinkers in the stall this week asking for a Gnomeregan-grade pressure regulator, the old kind with the brass housing, and I had to tell them my best supplier has gone off to be a hero. One of them asked if that paid better, and I said I didn't know, but it smells better.\n\nThe troggs have pushed further up the main tunnel, so I wouldn't go back that way now even if you begged me. Prices on clean copper wire have doubled because of it, and I've started selling pre-owned cogs at a sorry discount.\n\nLook after your fingers. A good pair of hands is worth more than any salvage.\n\nGimble",
}

P:Letter {
  id = "origin_gnome_scavenger_2", from = "Gimble Ratchetwick", stranger = true, delay = 2400,
  when = { origin = "gnome_scavenger", cleared = "Gnomeregan" },
  subject = "All the way down",
  body = "{name},\n\nWord is you went past the outer workshops, past the clean room and down to Thermaplugg's own chamber, which is further than any scavenger has ever been and lived to brag about.\n\nI'd ask what you brought back, but I've a feeling you weren't shopping this time. Half of Tinker Town calls you brave and the other half calls you mad, and I've been telling both halves they're right, which has done wonders for my reputation by association.\n\nIf you ever saw the old spare-parts depot on level three, I'd love to know whether my uncle's stall is still standing. He kept a copper sign above it shaped like a teakettle. Don't trouble yourself if it's gone, though, because most things are.\n\nGimble",
}

---------------------------------------------------------------------------
-- Gnomeregan's last arcane student (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_last_student_1", from = "Professor Emeritus Quillon Fennwick", stranger = true, delay = 1200,
  when = { origin = "gnome_last_student", minLevel = 6 },
  subject = "Your notes",
  body = "My dear {name},\n\nI found three pages of your rebuilt lecture notes under the bench in our corner of Tinker Town, and I'm sorry to say they're better than the originals. I've been teaching from them to a class of two, who are both quite bright and both quite frightened of the tram.\n\nThe damp here is terrible for paper. I've taken to drying our books on a line over the stove, and the whole corner smells of singed ink, which reminds me rather fondly of our old faculty halls.\n\nRemember that magic rewards patience and punishes cleverness, which is a cruel thing to tell a gnome. Take your time with every spell, and don't let the dwarves hurry you.\n\nProfessor Quillon Fennwick",
}

P:Letter {
  id = "origin_gnome_last_student_2", from = "Professor Emeritus Quillon Fennwick", stranger = true, delay = 2400,
  when = { origin = "gnome_last_student", minLevel = 30 },
  subject = "The class of two",
  body = "My dear {name},\n\nThe class of two is now a class of five, because word got about Tinker Town that the last student of the Gnomeregan faculty has become a {class} of real note, and suddenly everyone wants to learn the old curriculum.\n\nI've had to borrow benches from a dwarven chapel, and the High Priest's acolytes come by to collect them every Sunday, which means my Sunday lectures are given standing. It is very good for the posture.\n\nI'm an old gnome, and I lost a great deal when the city fell, including most of my colleagues and nearly all of my books. I did not expect to find any of that again, but some of it, it seems, walked out the door with you.\n\nProfessor Fennwick",
}

---------------------------------------------------------------------------
-- Reader of forbidden texts (Warlock)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_forbidden_texts_1", from = "Librarian Dorsa Inkwhistle", stranger = true, delay = 1200,
  when = { origin = "gnome_forbidden_texts", minLevel = 6 },
  subject = "Overdue",
  body = "{name},\n\nI'm writing as the person who tried to put the Gnomeregan library back together on four shelves in a borrowed cellar, and who has spent the better part of a year making lists of what's missing.\n\nThree volumes from the closed stacks are unaccounted for, along with a rather nasty little codex with a lock on it. I don't know who took them, and I've decided that I don't want to know, because I'm tired and the cellar floods every time the Great Forge runs hot.\n\nBut I'll say this to anyone who might have them. Books like those were locked for reasons, and whoever reads them had better be twice as careful as the gnome who wrote them, because that gnome is dead.\n\nDorsa Inkwhistle, Librarian",
}

P:Letter {
  id = "origin_gnome_forbidden_texts_2", from = "Librarian Dorsa Inkwhistle", stranger = true, delay = 2400,
  when = { origin = "gnome_forbidden_texts", minLevel = 40 },
  subject = "Still overdue",
  body = "{name},\n\nI've heard what people say about you now, and some of it's flattering and some of it isn't. A gnome who commands demons draws stares even in Ironforge, which has seen a great deal stranger.\n\nI've stopped making lists of what's missing from the closed stacks. It turns out a library is less about what's on the shelves than about who's reading, and how they come back. You've come back every time so far, as far as I can tell, and you seem to still be yourself, which is better than I'd feared.\n\nIf you ever want to return those books, the cellar door is unlocked on Thursdays. I won't ask any questions, and I won't charge a fine.\n\nDorsa",
}

---------------------------------------------------------------------------
-- The first gnome at the Mystic Ward's altars (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_first_altar_1", from = "Brother Thane Graniteheart", stranger = true, delay = 1200,
  when = { origin = "gnome_first_altar", minLevel = 6 },
  subject = "The altar step",
  body = "Little {g:brother|sister},\n\nI've had to put away the wooden step we built so ye could reach the altar, because the dwarven acolytes kept tripping on it. Then I took it back out again, because three more gnomes came to evening prayers this week, and they all asked where it had gone.\n\nYe started something, {name}, whether ye meant to or not. They ask the same questions you did, about whether the Light has a mechanism and where it keeps its gears. I've no better answers than I gave you, but I've learned to like the questions.\n\nThe Light walk with ye.\n\nBrother Thane Graniteheart\nMystic Ward",
}

P:Letter {
  id = "origin_gnome_first_altar_2", from = "Brother Thane Graniteheart", stranger = true, delay = 2400,
  when = { origin = "gnome_first_altar", minLevel = 30 },
  subject = "We built a second step",
  body = "{name},\n\nWe built a second step. There are eleven gnomes at evening prayers now, and the first step was never wide enough for more than two at a time. A tinker from your old street made it with folding legs, and it squeaks during the quiet parts, which High Priest Rohan pretends to find edifying.\n\nTravellers tell us you're doing the Light's work far from here, healing folk who've never seen a gnome before and don't know what to make of one. I like to think they learn something about us from you, and something about the Light as well.\n\nYour questions are still the best ones I've heard. Bring a few more home with ye.\n\nBrother Thane",
}

---------------------------------------------------------------------------
-- Kin of a leper gnome
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_leper_kin_1", from = "Wimble Fizzwhit", stranger = true, delay = 1200,
  when = { origin = "gnome_leper_kin", minLevel = 6 },
  subject = "I saw him again",
  body = "{name},\n\nI'm the one who mends lanterns on the Kharanos road, and you asked me to write if I ever saw your brother. I saw him again on Thursday near the old crash site, standing in the snow and looking at the road as if he'd forgotten where it went.\n\nHe didn't know me, and I don't think he'd have known you, which I'm sorry to write. But he had his old red scarf on, the one you described, so it was him and no mistake.\n\nThe mountaineers keep the others away from the road, and they're not gentle about it. I've asked them to be careful with him, and one of them, a decent lass, promised she would.\n\nWimble Fizzwhit",
}

P:Letter {
  id = "origin_gnome_leper_kin_2", from = "Wimble Fizzwhit", stranger = true, delay = 2400,
  when = { origin = "gnome_leper_kin", cleared = "Gnomeregan" },
  subject = "About the red scarf",
  body = "{name},\n\nI heard you went down into Gnomeregan, all the way to the bottom where the poison started. I hope you found what you were looking for, or at least a reason to stop looking, as you once told me.\n\nI saw your brother again last week. He was sitting on a rock by the crash site with his scarf wrapped twice around his neck, and when I passed with my lanterns, he looked up and waved. Just a wave, the ordinary kind that people do.\n\nIt might mean nothing, and I know nothing about radiation or cures. But I thought you'd rather have it than not, so there it is.\n\nWimble Fizzwhit, Kharanos road",
}

---------------------------------------------------------------------------
-- Watchman of the Kharanos refugee camps (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_kharanos_watch_1", from = "Sergeant Brindle Coggs", stranger = true, delay = 1200,
  when = { origin = "gnome_kharanos_watch", minLevel = 6 },
  subject = "Camp report",
  body = "{name},\n\nCamp report, as promised. The tents by Kharanos held through the first heavy snow, except for the big one by the well, which came down on the Spindlewhistle family in the night. Nobody was hurt, but Mister Spindlewhistle says he's lost faith in canvas.\n\nThe troggs tried the south fence twice this week and the mountaineers drove them back, with a bit of help from your old shield, which I've been lending to whoever has the night watch. It's too big for most of them, but it makes them feel brave, which is half the job.\n\nThe little ones still ask where the gnome with the shield went. I tell them you went to keep other people safe, which isn't a lie.\n\nSergeant Brindle Coggs",
}

P:Letter {
  id = "origin_gnome_kharanos_watch_2", from = "Sergeant Brindle Coggs", stranger = true, delay = 2400,
  when = { origin = "gnome_kharanos_watch", minLevel = 20 },
  subject = "The camp is smaller",
  body = "{name},\n\nGood news for once. The camp by Kharanos is half the size it was, because families have been finding rooms in Tinker Town and work in the forges, and the Spindlewhistles have moved into a proper house with a door they can slam.\n\nYour name gets passed around the fire at night now. A dwarf caravan brought word that a little gnome {class} has been holding the line in places none of us have ever heard of, and the children have started playing a game where one of them is you and the rest are troggs.\n\nI've given your old shield to the girl who plays you best. She can't lift it yet, but she's practising.\n\nBrindle",
}

---------------------------------------------------------------------------
-- Bomb-maker for the Booty Bay goblins (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_goblin_bombmaker_1", from = "Skizzle Sparkfuse", stranger = true, delay = 1200,
  when = { origin = "gnome_goblin_bombmaker", minLevel = 6 },
  subject = "Re: outstanding contract",
  body = "{name}, pal,\n\nListen, I'm not mad, I just want that on the record before my accountant reads this over my shoulder. The job went sideways, the dock went up, the client went swimming, and you went north, and that's all water under the pier, which we're still rebuilding, by the way.\n\nBooty Bay's quiet without you. The new bomb-maker is a goblin who uses twice the powder and half the sense, and he took the eyebrows off Baron Revilgaz's doorman on his second day. Nobody blamed him, because he's a goblin, but you'd have been run out of town.\n\nIf you're ever down this way again, come see me. We'll talk about the pier.\n\nSkizzle Sparkfuse, Demolitions and Fine Pyrotechnics",
}

P:Letter {
  id = "origin_gnome_goblin_bombmaker_2", from = "Skizzle Sparkfuse", stranger = true, delay = 2400,
  when = { origin = "gnome_goblin_bombmaker", cleared = "The Deadmines" },
  subject = "About those Deadmines",
  body = "{name},\n\nSo I hear you went down into the Deadmines in Westfall and blew up a perfectly good goblin foundry, smashed a shredder, and sank a whole Defias operation with Gilnid and his smelting crew inside it. You know how many invoices that cancels? Plenty, friend, and some of them were mine.\n\nNo hard feelings, though. Those Defias never paid on time, and their goblins were Venture types who give honest bomb-makers a bad name. I've told everyone at the Salty Sailor that I taught you everything you know about blowing things up, and nobody believes me, which is fine.\n\nKeep your fuses long and your exits short, pal.\n\nSkizzle",
}

---------------------------------------------------------------------------
-- Arcane engineer of Tinker Town (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_arcane_engineer_1", from = "Doctor Nimsy Voltwhisker", stranger = true, delay = 1200,
  when = { origin = "gnome_arcane_engineer", minLevel = 6 },
  subject = "Faculty news",
  body = "{name},\n\nFaculty news, such as it is. Professor Holloway's eyebrows have grown back, though the right one came back a very odd shape, and he refuses to tell anyone why. You may have a guess.\n\nThe dwarven mages have asked three separate times for the schematics of your arcane-capacitor coil, and I've told them three separate times that you took the only copy. They don't believe me, and they've started searching the workshop at night, which is very rude, though they do tidy up after themselves.\n\nPlease write down how the thing works before you blow yourself up, because I want to finish it. I'm only half joking.\n\nDoctor Nimsy Voltwhisker",
}

P:Letter {
  id = "origin_gnome_arcane_engineer_2", from = "Doctor Nimsy Voltwhisker", stranger = true, delay = 2400,
  when = { origin = "gnome_arcane_engineer", minLevel = 40 },
  subject = "The coil works",
  body = "{name},\n\nThe coil works. I rebuilt it from your scribbles on the back of a tram timetable, and it ran for six full minutes before it melted the bench. That's five and a half minutes longer than yours ever did, and I'm not too proud to tell you so.\n\nThe dwarven mages have stopped calling your methods reckless. They call them bold now, which is how a dwarf says reckless when he's impressed. I hear you've become a {class} of some fame out in the world, and I suspect that has more to do with it than my coil does.\n\nCome home sometime and help me with the cooling problem. Bring your own eyebrows.\n\nNimsy",
}

---------------------------------------------------------------------------
-- Clerk in Thermaplugg's offices (Warlock)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_thermaplugg_clerk_1", from = "Hobb Ledgerwise", stranger = true, delay = 1200,
  when = { origin = "gnome_thermaplugg_clerk", minLevel = 6 },
  subject = "From the old office",
  body = "{name},\n\nYou won't remember me, though we shared a filing cabinet for two years on the fourth floor. I was the clerk who kept the requisitions, and you were the one who kept the ledgers and never once let me borrow a pen.\n\nI'm in Tinker Town now, copying tram schedules for the dwarves at a copper a page. Nobody here asks what I did before, and I don't tell them. Some days I think they suspect, and other days I think they don't care, and I can't decide which is worse.\n\nI saw some of the payments too, the ones for books. I never told anybody, and I'm not writing to threaten you. I just wanted somebody else from that office to know I'm alive.\n\nHobb",
}

P:Letter {
  id = "origin_gnome_thermaplugg_clerk_2", from = "Hobb Ledgerwise", stranger = true, delay = 2400,
  when = { origin = "gnome_thermaplugg_clerk", cleared = "Gnomeregan" },
  subject = "Accounts closed",
  body = "{name},\n\nI heard it in the market this morning. Mekgineer Thermaplugg is finished, down in the bottom of the city he poisoned, and the gnome who did it once kept his ledgers.\n\nI went home and took out the old requisition book I'd carried out of Gnomeregan in my coat. I've kept it all this time without knowing why, and tonight I finally drew a line under the last page, the way we used to when an account was closed. It's a silly thing to do, but I felt better for it.\n\nWhatever you read in those books, and whatever you've become, you went back and settled his debt. I'd call that balanced, and I was always very good with numbers.\n\nHobb Ledgerwise",
}

---------------------------------------------------------------------------
-- Gnome pupil of Stormwind Cathedral (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_gnome_cathedral_pupil_1", from = "Brother Aldous Penning", stranger = true, delay = 1200,
  when = { origin = "gnome_cathedral_pupil", minLevel = 6 },
  subject = "Your diagrams",
  body = "Dear {name},\n\nThe Cathedral feels larger without you, which is strange, since you took up so little of it. Brother Ansel found one of your diagrams of the Light tucked into a hymnal last week, all arrows and little circles, and he's been staring at it during vespers ever since.\n\nThe Cathedral Square has been cold and wet all month, and the orphans have been sailing paper boats in the fountain while the matron looks the other way. We've had more hurt soldiers from the Redridge road than usual, so the infirmary is full and the soup is thin.\n\nI hope your hands have healed as well as we hoped. Use them gently, and don't forget that the Light isn't a machine, however much you'd like it to be.\n\nYour friend, Brother Aldous",
}

P:Letter {
  id = "origin_gnome_cathedral_pupil_2", from = "Brother Aldous Penning", stranger = true, delay = 2400,
  when = { origin = "gnome_cathedral_pupil", cleared = "The Stockade" },
  subject = "From the Cathedral",
  body = "Dear {name},\n\nThe guards say it was you who went into the Stockade when the prisoners rose, and that you came out again with the riot ended. I've sat with some of the men from those cells when they were brought to us for healing, so I know what it must have been like in the dark down there.\n\nI hope you were merciful where you could be. I know you will have been, because you always asked why before you asked how, and that's rarer than most think.\n\nBrother Ansel has framed your diagram. He says that it's wrong in every particular and right in the only one that counts, and none of us has managed to make him explain what he means.\n\nThe Light keep you,\nBrother Aldous",
}
