-- Letters (0.80.0): what people you've met write to you, waiting at the mailbox.
-- P:Letter { id, npc (who writes; they write only once you've spoken with them, unless
-- stranger = true), from (signature, else the NPC's name), subject, body (tokens work),
-- when (sent once this holds, checked every minute) or sent by a dialogue fx = { letter = id },
-- delay (seconds from sending to the mailbox, default 1800), journal, fx (applied on reading) }.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Topper McNabb and Elsie (Stormwind: Topper's "Send them anyway")
---------------------------------------------------------------------------
P:Letter {
  id = "topper_true_letter", npc = "topper", delay = 3600,
  subject = "I sent one",
  body = "{name},\n\nI'm writing this on the back of a bread wrapper because the clerk at the mail office charges for paper, and I wanted you to know before I lost my nerve again. I sent one. Not the six in my coat, which are still in my coat, but a new one that I wrote last night under the lamp by the canal.\n\nI told her the truth. I told her I sleep in the doorway by the Pig and Whistle and that I'm not a farmer yet and that I might not ever be one. I told her I still have the seed potatoes, which is a lie, because I ate them the second winter, but a man can only be so honest in one letter.\n\nIf she doesn't write back, that's an answer too, and I'll thank you all the same for pushing me.\n\nYour friend in the Trade District,\nTopper McNabb",
}

P:Letter {
  id = "elsie_reply", from = "Elsie McNabb", stranger = true, delay = 5400,
  when = { letter = "topper_true_letter" },
  subject = "From Lakeshire",
  body = "To the friend of Topper McNabb,\n\nYou don't know me, but my husband wrote that a stranger in the city told him to stop lying to his wife, and he put your name at the bottom so I could thank you. So I am writing to you as well as to him.\n\nFour years I've had letters saying the city was kind, and I knew every one of them was a story, because Topper only ever tells the truth when he's frightened. This one frightened him, so I believed it.\n\nThere is a plot of land behind my sister's house that nobody wants because the gnolls come up from the river now and then. I have told him it is his if he wants to dig it and doesn't mind a pitchfork by the door. Light keep you, and if he hasn't started walking by the spring, you have my leave to drag him.\n\nElsie McNabb, Lakeshire",
}

---------------------------------------------------------------------------
-- Dungeons, for people who asked you to go
---------------------------------------------------------------------------
P:Letter {
  id = "gryan_deadmines", npc = "gryan", delay = 1800,
  when = { cleared = "The Deadmines", faction = "Alliance" },
  subject = "From Sentinel Hill",
  body = "{name},\n\nA scout came up the road this morning with mud to his knees and a grin I haven't seen on a Westfall face in years. He says Edwin VanCleef is dead in the belly of his own ship, and that it was you who did it.\n\nIt doesn't mend everything. There are still Defias in the fields, and there are still families who will never come back to Moonbrook, and some of those masked men were farmers I knew by name before the hunger turned them. But the head is off the snake, and the hill slept easy last night for the first time since I raised the banner.\n\nThe militia drinks to you tonight, and there is a bunk on Sentinel Hill with your name on it whenever you pass through.\n\nGryan Stoutmantle\nThe People's Militia",
}

P:Letter {
  id = "thrall_ragefire", npc = "thrall", delay = 1800,
  when = { cleared = "Ragefire Chasm", faction = "Horde" },
  subject = "Beneath the city",
  body = "{name},\n\nWord reached Grommash Hold that the Searing Blade cult beneath our streets has been broken, and that Taragaman the Hungerer will trouble no more of our young ones. I am told you went down into the chasm when others were content to complain about the smell of it.\n\nThere are those in my own city who still listen to the Burning Blade and think the old power can be taken back without its price. They are wrong, and you have shown them so with steel rather than speeches, which is the only argument some of them will ever hear.\n\nThe Horde is stronger for what you did in the dark. Do not let anyone tell you that work done out of sight is lesser work.\n\nThrall, Warchief of the Horde",
}

P:Letter {
  id = "cairne_wailing", npc = "cairne", delay = 1800,
  when = { cleared = "Wailing Caverns", faction = "Horde" },
  subject = "The dreamer",
  body = "{name},\n\nThe Earth Mother has whispered to the elders that the land around the Wailing Caverns breathes a little easier, and the disciple who waited at the cave mouth has sent word that the Fanglords no longer walk its tunnels. I give thanks that you went where the Druids of the Fang had lost their way.\n\nThe Barrens were green once, young one. My grandfather remembered them so, and Naralex dreamed of making them green again. Whether his dream comes true is in hands older than ours, but you have given it a chance where there was none.\n\nWalk with the Earth Mother, and come to Thunder Bluff when your road allows. There will be a place for you by my fire.\n\nCairne Bloodhoof, High Chieftain",
}

P:Letter {
  id = "sylvanas_shadowfang", npc = "sylvanas", delay = 2400,
  when = { cleared = "Shadowfang Keep", faction = "Horde" },
  subject = "Arugal",
  body = "{name},\n\nThe Dark Lady has been informed that the archmage Arugal is no longer among the living, nor among the dead who serve themselves. His wolves will hunt in Silverpine without a master now, and the Deathstalkers will see that they do not hunt for long.\n\nShe does not write letters of thanks. She has, however, instructed me to tell you that she remembers who is useful to her, and that this is a better thing to be remembered for than most.\n\nBurn this when you have read it.\n\nBy the hand of Varimathras, for Lady Sylvanas Windrunner",
}

P:Letter {
  id = "dughan_westfall", npc = "dughan", delay = 1800,
  when = { cleared = "The Deadmines", faction = "Alliance" },
  subject = "A word from Goldshire",
  body = "{name},\n\nYou'll forgive the short note; the Brotherhood's leftovers still keep me busy in the vineyards, and the paperwork from the Keep has not grown any lighter. I hear from Sentinel Hill that VanCleef is finished and that it was your doing.\n\nI asked Stormwind for soldiers more times than I care to count, and I was told each time that Elwynn was adequately garrisoned. It seems the Crown was right, though not in the way it meant. I'm grateful, and I'll say so in my next report, whether anyone in the Keep reads it or not.\n\nMarshal Dughan, Goldshire",
}

P:Letter {
  id = "jaina_theramore", npc = "jaina", delay = 3600,
  when = { minLevel = 40, faction = "Alliance" },
  subject = "An open door in Theramore",
  body = "{name},\n\nI hope this finds you well, wherever the road has taken you. My aides keep a list of the people whose names come up in the reports from the marsh and the Barrens, and yours has come up often enough that I wanted to write to you myself.\n\nTheramore is a small place, and we keep the peace with the Horde by being patient with people who would much rather we weren't. I could use more friends who understand that a sword is the last answer and not the first. If you are ever in Dustwallow Marsh, the tower door is open to you, and the tea is better than the reputation of the Isle would suggest.\n\nWith regards,\nJaina Proudmoore, Lady of Theramore",
}

---------------------------------------------------------------------------
-- More dungeons and raids (0.81.0)
---------------------------------------------------------------------------
P:Letter {
  id = "thelwater_stockade", npc = "thelwater", delay = 1800,
  when = { cleared = "The Stockade", faction = "Alliance" },
  subject = "Regarding the recent difficulty",
  body = "{name},\n\nI am informed that order has been restored to the Stockade and that the prisoner Bazil Thredd will not be leading any further disturbances. I am grateful, and I would be more grateful still if the matter were not discussed in the taverns of the Trade District, where I understand it is already being discussed.\n\nYou will appreciate that the official record describes the episode as a minor disciplinary incident, resolved by the guard. I have not named you in it, which is for your own good as much as mine, because the Keep has a habit of asking the people who fix a problem why they were near it in the first place.\n\nIf you ever have business beneath the canals again, please knock.\n\nWarden Thelwater, the Stockade",
}

P:Letter {
  id = "jeneu_blackfathom", npc = "jeneu", delay = 1800,
  when = { cleared = "Blackfathom Deeps", faction = "Horde" },
  subject = "The water be quiet",
  body = "{name},\n\nI went down to de shore at Zoram'gar last night and put my hands in de sea, and for de first time since I came to dis coast it did not pull back from me. Aku'mai be dead, and whatever de Twilight cultists were feeding in dat drowned temple, dey be feeding it no longer.\n\nDe Earthen Ring will want a long report, and I will give dem one, but I wanted you to hear it from me first, mon. De spirits of de water remember who helps dem, and dey are not so quick to forget as people are.\n\nMarukai say you owe him a drink for all de worrying he did. I say he owes you two. Settle it between yourselves.\n\nJe'neu Sancrea, of the Earthen Ring",
}

P:Letter {
  id = "mekkatorque_gnomeregan", npc = "mekkatorque", delay = 2400,
  when = { cleared = "Gnomeregan", faction = "Alliance" },
  subject = "Re: Thermaplugg (urgent, but happy-urgent)",
  body = "Dear {name},\n\nI have read the scout's report four times, once aloud to the Tinker Town council and three times to myself, and the numbers still say the same thing. Mekgineer Thermaplugg is no longer in command of anything, least of all my city, and the troggs below the Dun Morogh vents are, by my best estimate, roughly sixty percent less organized than they were last week.\n\nWe cannot go home yet. The radiation is still well outside any tolerance I would sign my name to, and half the lower levels are flooded with things I would rather not name in a letter. But you have taken back the one thing I could not build myself, which is the feeling that going home is a question of when and not if.\n\nPlease eat something. People forget to after these expeditions, and I worry.\n\nGelbin Mekkatorque, High Tinker of the Gnomes",
}

P:Letter {
  id = "nogg_gnomeregan", npc = "nogg", delay = 1800,
  when = { cleared = "Gnomeregan", faction = "Horde" },
  subject = "Business is booming (not literally this time)",
  body = "Pal,\n\nWord is you went into Gnomeregan and came back out with all your fingers, which in my line of work is what we call a successful field trial. The gnomes' big boss is scrap, and that means a whole city full of salvage nobody's guarding, and I think you know where my mind goes with that.\n\nI'm not sayin' you owe me anything, because you don't, but I am sayin' that if you happened to notice any loose gears, springs or suspiciously shiny bits on your way out, my shop door's open and my rates are fair by goblin standards. That's a joke. Mostly.\n\nThe new forge only blew once this week, which is a record. Come see it before it isn't.\n\nNogg, Orgrimmar's finest (and only) machine shop",
}

P:Letter {
  id = "faranell_kraul", npc = "faranell", delay = 1800,
  when = { cleared = "Razorfen Kraul", faction = "Horde" },
  subject = "A most productive season",
  body = "My dear {name},\n\nI am told the old crone Charlga Razorflank is dead and her thorny little warren is in disarray, and I confess I clapped when I heard it, which startled one of the junior apothecaries so badly that he dropped a flask. It was only a reagent for the brew, thankfully, and not anything that would have eaten the floor.\n\nThe quilboar breed their bats very well, as it happens, and the samples that came out of the Kraul have been simply marvellous. Our work in the Apothecarium proceeds faster than it has in months, and the Dark Lady takes an interest in fast work, so you may consider yourself a small but appreciated part of something rather grand.\n\nDo stop by the lab when you are next under the city. I promise not to test anything on you.\n\nMaster Apothecary Faranell, Royal Apothecary Society",
}

P:Letter {
  id = "varimathras_downs", npc = "varimathras", delay = 2400,
  when = { cleared = "Razorfen Downs", faction = "Horde" },
  subject = "The Coldbringer",
  body = "{name},\n\nThe lich Amnennar has been unmade, and with him the Scourge's little embassy among the quilboar of the Downs. The Lich King extends his reach wherever he finds fools willing to kneel, and the Razorfen knelt very quickly. You have reminded them, and him, that the Dark Lady's servants reach just as far.\n\nI mention to her Majesty the names of those who choose wisely, and I have mentioned yours. You will find, I think, that choosing wisely becomes easier with practice.\n\nWith every courtesy,\nVarimathras, in service to Lady Sylvanas",
}

P:Letter {
  id = "raleigh_monastery", npc = "raleigh", delay = 3000,
  when = { cleared = "Scarlet Cathedral", faction = "Alliance" },
  subject = "From the Southshore Inn",
  body = "{name},\n\nThey say Whitemane has fallen in her own cathedral, and Mograine beside her, and I have been sitting by this window since dawn with a cup gone cold, trying to decide what I feel about it. I knelt in that chapel once. I believed every word that was said in it, and some of those words were good ones before they were twisted.\n\nYou did what had to be done. The Crusade burns villages now and calls it purification, and the men I marched beside would not have recognised what it has become. I thank you, and I pray for them, and I have decided that a man can do both on the same morning without being a hypocrite.\n\nIf you pass through Southshore, knock twice. I still keep the door locked.\n\nRaleigh the Devout",
}

P:Letter {
  id = "hollee_uldaman", npc = "hollee", delay = 2400,
  when = { cleared = "Uldaman", faction = "Alliance" },
  subject = "You'll never believe what's down there (well, you will)",
  body = "{name}!\n\nThe whole Explorers' League is talking of nothing else. They say you went all the way to the bottom of Uldaman and woke the great stone keeper Archaedas, and then put him back to sleep the hard way, and that the discs in the vault speak of the titans shaping the very stone our people were cut from. I've read the transcription three times and cried twice, and I'm not ashamed of it.\n\nThe old beards in Ironforge are arguing about what it means, which is what old beards do best. I don't much care what it means yet. I care that somebody went and looked.\n\nIf you see Prospector Remtravel on your travels, tell him I've kept his notes dry.\n\nArchaeologist Hollee, Explorers' League, Auberdine",
}

P:Letter {
  id = "trenton_zulfarrak", npc = "trenton", delay = 1800,
  when = { cleared = "Zul'Farrak" },
  subject = "Troll steel",
  body = "{name},\n\nThe sandfury chief is dead and the city's gates hang open, and every scavenger in Gadgetzan is packing a mule to go and pick at the bones. I'm not going. I'm too old to be shot at for scrap, and besides, what I wanted out of Zul'Farrak was never the gold.\n\nThe trolls tempered their blades in something I've chased for twenty years, and now and then a piece of it comes through my door. When it does, I'll be at the anvil with the shutters down until it gives up its secret, and I'll think of you while I work, because you made the road safe enough for it to travel.\n\nKeep your edge oiled in this sand. The desert eats steel.\n\nTrenton Lighthammer, south gate of Gadgetzan",
}

P:Letter {
  id = "vark_maraudon", npc = "vark", delay = 2400,
  when = { cleared = "Maraudon", faction = "Horde" },
  subject = "The roots will remember",
  body = "{name},\n\nThe elders of Shadowprey tell me that Princess Theradras sleeps no more in the heart of Maraudon, and that the poison she and the satyr spread through those halls has begun to drain away like floodwater after the rains. I went to the cave mouth this morning and stood there a long while. The air smells of earth again, and not of rot.\n\nYou will have heard me speak of Vyletongue as though he were my own enemy. He was, and I will tell you why some evening when the fire is low, but not in a letter. It is enough that the land is healing, and that it was your hands that began it.\n\nMay the Earth Mother keep you, and may the grass grow back where you have walked.\n\nVark Battlescar, Shadowprey Village",
}

P:Letter {
  id = "talendria_maraudon", npc = "talendria", delay = 2400,
  when = { cleared = "Maraudon", faction = "Alliance" },
  subject = "Healing, not clearing",
  body = "{name},\n\nWord reached Nijel's Point that Theradras is fallen and that the caverns of Maraudon are quieting. I told you once that I wanted the place healed and not merely emptied, and I was hard on you about the difference. I am told you understood it better than I feared, and that you spared what could be spared.\n\nZaetar was a son of Cenarius, and his grave has been a wound in this land for longer than your kingdoms have kept records. It will not close in my lifetime, long as that may be. But a wound that is cleaned can begin to mend, and that is more than Desolace has been given in a very long while.\n\nElune light your road.\n\nTalendria, Nijel's Point",
}

P:Letter {
  id = "itharius_atalhakkar", npc = "itharius", delay = 3600,
  when = { cleared = "The Temple of Atal'Hakkar" },
  subject = "The sunken temple",
  body = "{name},\n\nI have felt the Shade of Eranikus withdraw from the waters of the Pool of Tears, and I know that the green dragons who guarded that temple are at rest. They were sent there by Ysera to keep the Atal'ai from calling back their blood god, and for many long years the nightmare that crept into their sleep turned that duty into madness.\n\nI will not pretend that I am glad they had to die. I am glad that they are no longer suffering, and that the soulflayer's shadow has been driven out of the temple with them. Those are not the same thing, and a dragon learns early that they rarely are.\n\nThe whelps in my cave are calmer tonight. I thought you would want to know.\n\nItharius",
}

P:Letter {
  id = "magni_brd", npc = "magni", delay = 1800,
  when = { cleared = "Blackrock Depths", faction = "Alliance" },
  subject = "Thaurissan",
  body = "{name},\n\nEmperor Dagran Thaurissan is dead in his own throne room, and I have read the report three times by the light of the Great Forge to be sure I wasnae dreaming it. That cursed line has plagued my people since the War of the Three Hammers, and his grandsire's summoning made the Searing Gorge the hell it is today. I won't pretend I'm sorry, and I'll drink to it tonight with the whole of the Stonefire.\n\nThere is a matter I'll not put to paper, about my daughter and where she was standing when he fell. I'll speak of it with ye in person, in my own hall, when ye have the time and I have the stomach.\n\nBy my beard, the forge burns hotter today.\n\nMagni Bronzebeard, King of Ironforge",
}

P:Letter {
  id = "eitrigg_brd", npc = "eitrigg", delay = 1800,
  when = { cleared = "Blackrock Depths", faction = "Horde" },
  subject = "Under the mountain",
  body = "{name},\n\nYou went beneath Blackrock Mountain and killed the Dark Iron emperor in his own hall. I know that mountain. I marched past it under the old Blackrock banner when I was young and still believed in the things we were told, and I have no love for anything that lives inside it, dwarf or orc.\n\nThe Warchief asked me what I thought of you, and I told him the truth, which is that you fight like someone who means to come home afterwards. That is rarer than courage, and worth more.\n\nThere are still orcs in the Spire who wear the old colours. One day someone will have to deal with them, too. I would rather it were you than anyone else I know.\n\nEitrigg, Grommash Hold",
}

P:Letter {
  id = "eva_scholomance", npc = "eva_sarkhoff", delay = 2400,
  when = { cleared = "Scholomance" },
  subject = "From Caer Darrow",
  body = "Dear {name},\n\nForgive the hand; it is not easy to hold a pen when one is not entirely there to hold it. Lucien and I felt the Darkmaster fall last night. Gandling's hold on the old Barov house went out of it like a breath, and for the first time in years the island was quiet enough to hear the lake against the shore.\n\nWe used to keep a lovely garden here, before the Cult came and the Barovs sold everything they owned and a good deal they did not. I mention it only because I walked out to where it was this morning, and nothing in the ground tried to crawl out at me, which I'm afraid is the nicest thing I have been able to say about Caer Darrow in a very long time.\n\nThank you, truly. Please don't trouble yourself to visit; the grounds are still in such a state.\n\nEva Sarkhoff, Caer Darrow",
}

P:Letter {
  id = "leonid_stratholme", npc = "leonid", delay = 2400,
  when = { cleared = "Stratholme" },
  subject = "The Baron",
  body = "{name},\n\nThe Argent Dawn has learned that Baron Rivendare no longer holds his court in the slaughterhouse of Stratholme. I knew of Rivendare in the days when we both had faces worth looking at. He was a vain man then, and death has only given him more to be vain about, so I confess I take a quiet satisfaction in knowing he has finally been made to stop.\n\nThe city is still the Scourge's, and the fires Prince Arthas lit there have never fully gone out. But every lieutenant you take from them is a gap the Lich King must fill, and he has fewer servants worth the name than he pretends.\n\nThe Light does not abandon the dead, whatever they may think of it. Remember that, on behalf of one of us.\n\nLeonid Barthalomew the Revered, Light's Hope Chapel",
}

P:Letter {
  id = "hydraxis_moltencore", npc = "hydraxis", delay = 3600,
  when = { cleared = "Molten Core" },
  subject = "The Firelord",
  body = "Mortal,\n\nRagnaros has been driven back from this world, and the Waterlords take note of it. For ten thousand years my kind has waged war on the fire, and for most of those years we have done so without the help of creatures who live and die in the span of a single tide. You have proved more useful than I expected.\n\nDo not mistake this for gratitude. The Firelord is diminished, not destroyed, and fire always returns where it is given fuel. But the Hydraxian Waterlords will remember your name for some little while, which is longer than they remember most.\n\nThe sea endures.\n\nDuke Hydraxis",
}

P:Letter {
  id = "bolvar_onyxia", npc = "bolvar", delay = 1800,
  when = { cleared = "Onyxia's Lair", faction = "Alliance" },
  subject = "From the Keep",
  body = "{name},\n\nThe head of the black dragon hangs at the gates of Stormwind this morning, and the city has not stopped talking about it since the sun came up. I stood under it for a long time before the court sat. She sat beside me at that table for months, whispering counsel into my ear and into the young king's, and I listened to her because she always sounded so very reasonable.\n\nI will carry that for the rest of my life, and I should. But Anduin is safe, and the nobles who were so certain of her are very quiet now, and Stormwind owes you more than a regent is allowed to say in a letter.\n\nI asked you once to speak plainly to me. Let me do the same: thank you.\n\nHighlord Bolvar Fordragon, Regent of Stormwind",
}

P:Letter {
  id = "rexxar_onyxia", npc = "rexxar", delay = 2400,
  when = { cleared = "Onyxia's Lair", faction = "Horde" },
  subject = "The broodmother",
  body = "{name},\n\nI do not write letters, and Misha thinks this one is foolish. But a rider came through Desolace with the news that the black dragon is dead in her lair, and I wanted you to know that I heard it.\n\nShe hid behind a mortal face in the courts of men and set her brood loose upon the wilds while the Alliance looked the other way. I have tracked her children across half of Kalimdor. They will scatter now, and the wilds will be a little cleaner for it.\n\nThrall chose well when he trusted you. I do not say that often, because it is rarely true.\n\nRexxar",
}

---------------------------------------------------------------------------
-- As you grow (level-based)
---------------------------------------------------------------------------
P:Letter {
  id = "voljin_rising", npc = "voljin", delay = 3600,
  when = { minLevel = 30, faction = "Horde" },
  subject = "De spirits be talking",
  body = "{name},\n\nDe witch doctors at Sen'jin tell me your name come up when dey throw de bones, and dat be either very good or very bad, so I thought I better write and find out which. Dey say you be gettin' strong, mon, strong enough dat people start to notice, and dat be when you need to start watchin' who be noticin'.\n\nZalazane still sulk on de Echo Isles, and dere be plenty in Orgrimmar who never liked trolls much and like dem even less now. De Darkspear remember our friends, and we remember dem a long, long time.\n\nCome by Grommash Hold when you pass, and we talk. I promise to be only a little bit mysterious.\n\nVol'jin, of the Darkspear",
}

---------------------------------------------------------------------------
-- From the trainers and the masters of each calling
---------------------------------------------------------------------------
P:Letter {
  id = "malin_mage", npc = "malin", delay = 2400,
  when = { minLevel = 40, class = "MAGE", faction = "Alliance" },
  subject = "A note from the Sanctum",
  body = "{name},\n\nI have been keeping an ear on what the Kirin Tor and the Academy say about the young mages of this city, and I am pleased to report that you are mentioned more than most and complained about less than some. Trelane used to say that a mage's first fifty spells teach him nothing but his own limits, and that the real work begins when he stops being surprised by them.\n\nYou are near that point now, I think. Be careful there. It is exactly when a mage grows confident that he starts reading books he should not, and I have buried more than one student who was certain he understood what he was summoning.\n\nThe kettle is always on in the Sanctum, and I make it strong enough to stand a spoon in.\n\nArchmage Malin, Wizard's Sanctum",
}

P:Letter {
  id = "grayson_paladin", npc = "grayson_sb", delay = 2400,
  when = { minLevel = 40, class = "PALADIN" },
  subject = "Concerning your conduct",
  body = "{name},\n\nThe Silver Hand hears of its members, even those who think themselves far from the Cathedral, and I have heard of you. The reports are mostly favourable. I say mostly because one brother who rode with you in the Arathi Highlands remarked that your boots were in a disgraceful condition, and I do not consider that a small thing.\n\nA paladin is the Light made visible to people who have never read a word of scripture. They judge the Light by how we carry ourselves, and a cracked buckle tells them we do not care. Uther taught that, and he was right.\n\nYou are doing good work. Do it in clean armour.\n\nLord Grayson Shadowbreaker, Cathedral of Light",
}

P:Letter {
  id = "hamuul_druid", npc = "hamuul", delay = 2400,
  when = { minLevel = 30, class = "DRUID", faction = "Horde" },
  subject = "From Elder Rise",
  body = "{name},\n\nI keep a count of every young druid who rides the lift up to Elder Rise, and I keep a second, smaller count of those who come back stronger. You are on the second one now, and I wanted you to know that I noticed.\n\nWhen Malfurion Stormrage agreed to teach our people the old ways, there were many among his own kind who thought he had made a great mistake. I have spent my life trying to prove him right. Every one of you who walks in balance with the land makes that work a little easier, and a little less lonely.\n\nThe Dream is patient, young one, and so am I. Come home to the Bluff when the winds turn.\n\nArch Druid Hamuul Runetotem",
}

P:Letter {
  id = "zorlonetree_shaman", npc = "zorlonetree", delay = 2400,
  when = { minLevel = 40, class = "SHAMAN" },
  subject = "The elements speak",
  body = "{name},\n\nThe spirits of earth and air have spoken your name to me twice this season, and they rarely trouble themselves with a single shaman unless something is changing. You are learning to listen, I think, and they are learning that you are worth speaking to.\n\nThe orcs forgot the old ways once. We traded them for the warlocks' fire, and you have seen what that cost us. Thrall brought the elements back to our people, but it will be shamans like you who decide whether we keep them. Do not take more than they offer you, and always give thanks when you take it.\n\nThe Hold is noisy, but my fire is quiet. Come and sit by it.\n\nZor Lonetree, Elder Far Seer",
}

---------------------------------------------------------------------------
-- Dungeons and raids, the other side of the road
---------------------------------------------------------------------------
P:Letter {
  id = "naralex_disciple_wailing", npc = "naralex_disciple", delay = 1800,
  when = { cleared = "Wailing Caverns", faction = "Alliance" },
  subject = "He woke",
  body = "{name},\n\nI am writing this by the light of a single candle at the mouth of the caverns, because I could not bear to go back inside to find a better one. Naralex woke. He opened his eyes after you struck down the beast that fed on his nightmare, and the first thing he asked for was water, and the second was the name of the one who had come for him.\n\nHe is weak, and the Dream he walked in has left marks on him that I do not know how to heal. The Fanglords are gone, but the green will not come back to the Barrens in a season, nor perhaps in our lifetimes. Still, the oasis water tastes cleaner this morning. I am almost sure of it.\n\nElune keep you, friend. You did what his own disciples could not.\n\nA Disciple of Naralex",
}

P:Letter {
  id = "ashcrombe_shadowfang", npc = "ashcrombe", delay = 2400,
  when = { cleared = "Shadowfang Keep", faction = "Alliance" },
  subject = "My notes, and my thanks",
  body = "{name},\n\nI have finally finished my notes on Shadowfang Keep, which is easy to do now that nobody in it is trying to eat me. I am told by a very nervous courier that Arugal is dead, and that his worgen are running loose and leaderless through Silverpine. That is not a perfect outcome, but it is a great deal better than the one I was facing in that cell.\n\nArugal was a brilliant man once. He was also a frightened one, and he called those creatures across from wherever they came from because he thought they would save Lordaeron. I want that written down somewhere, so that the next clever mage who is sure of himself might read it and stop.\n\nIf you ever need a spell explained or a door unlocked, you know where to find me. I owe you both, and several more besides.\n\nSorcerer Ashcrombe",
}

P:Letter {
  id = "thaelrid_blackfathom", npc = "dg_thaelrid", delay = 1800,
  when = { cleared = "Blackfathom Deeps", faction = "Alliance" },
  subject = "From the shrine",
  body = "{name},\n\nThe chanting has stopped. I sat by the water for most of the night waiting for it to start again, and it did not, and I find I do not entirely trust the silence. The Twilight's Hammer has lost its priests down there, and whatever they were feeding in the deep water has stopped answering them.\n\nThe Argent Dawn will want a report, and I will write one, but I wanted to write to you first. Those old shrines belonged to my people, and they were holy once, before the cult found them. You gave them back their quiet. In time, perhaps we can give them back the rest.\n\nIshnu-alah, and walk carefully. The Hammer has more than one temple.\n\nArgent Guard Thaelrid",
}

P:Letter {
  id = "zygand_monastery", npc = "zygand", delay = 2400,
  when = { cleared = "Scarlet Monastery", faction = "Horde" },
  subject = "From Brill",
  body = "{name},\n\nThe Deathguard at the Monastery road report that the Scarlet banners have come down from the cloisters, and that the zealots who are left are arguing with each other instead of hunting us. I am told you were the cause. I will not pretend that pleases me any less than it does.\n\nThe Crusade has burned more of my people than I care to count, and it calls that holy work. Their High Inquisitor raised her own dead and still called us abominations. You have shown them what the Light is worth when the Forsaken come to the door.\n\nThere will be more of them. There always are. But Brill sleeps easier tonight, and so, for once, do I.\n\nExecutor Zygand, Brill",
}

P:Letter {
  id = "jarkal_uldaman", npc = "jarkal", delay = 2400,
  when = { cleared = "Uldaman", faction = "Horde" },
  subject = "Jarkal hear things",
  body = "{name},\n\nJarkal hear from a goblin who hear from a dwarf, which mean it probably be true, dat you went all de way down into Uldaman and knocked over de big stone keeper at de bottom. De dwarves be very upset about it, and dat make Jarkal very happy.\n\nNow listen, mon. Dat place be full of old stone and old powder and things nobody ever put in a jar before. If you go back, and you bring Jarkal a pinch of anything dat glow, or hum, or tries to bite, Jarkal pay good silver and ask no questions. Well, maybe one question.\n\nKargath sends its thanks, and Jarkal sends his, and de green jar sends nothing because it still be thinking about exploding.\n\nJarkal Mossmeld",
}

P:Letter {
  id = "shandris_diremaul", npc = "shandris", delay = 2400,
  when = { cleared = "Dire Maul", faction = "Alliance" },
  subject = "Eldre'Thalas",
  body = "{name},\n\nMy scouts on the eastern ridge report that the ogres of Dire Maul are fighting over a crown again, and that the Highborne in the western halls have gone quiet. I am told you walked those ruins and came out the far side, which is more than most of my Sentinels have managed.\n\nEldre'Thalas was a jewel of the old empire, and the ones who stayed behind there fed on its magic until it hollowed them. I take no joy in what became of them. I take a great deal of joy in knowing they will not be feeding on anything for some time.\n\nThere is a bed in Feathermoon Stronghold for you, and a boat to carry you there. Do not keep my Sentinels waiting on the shore.\n\nShandris Feathermoon, General of the Sentinel Army",
}

P:Letter {
  id = "rokorhan_diremaul", npc = "rokorhan", delay = 1800,
  when = { cleared = "Dire Maul", faction = "Horde" },
  subject = "Ogres",
  body = "{name},\n\nI told you that the way to help the Horde in Feralas was to kill ogres. I did not tell you to go into Dire Maul and kill all of them, but I hear that is more or less what you did, and I am not complaining.\n\nThe Gordok are squabbling over who gets to be king now, which means they are too busy to raid Camp Mojache, which means my braves can sleep. The tauren here tell me the elves in the other halls are dealt with too, and they seem pleased about that, though tauren always seem pleased about something.\n\nCome back to camp. There is meat on the fire, and I owe you a cut of it.\n\nRok Orhan, Camp Mojache",
}

P:Letter {
  id = "goretooth_lbrs", npc = "goretooth", delay = 1800,
  when = { cleared = "Lower Blackrock Spire", faction = "Horde" },
  subject = "From Kargath",
  body = "{name},\n\nThe vultures over Kargath were circling lower than usual this morning, and I took that for an omen until a runner came up from the Steppes with the news. Wyrmthalak is dead, and the orcs of the Spire who still call themselves Blackrock are short a few warlords.\n\nI have stood on these walls for years watching that mountain and wondering when the Dark Horde would come down from it. You have bought us time, and you may have bought us more than that. Bring me any orders you took off those dogs, and I will see they reach Orgrimmar.\n\nTheodora sends her regards, and asks me to say that she was never worried about you. She was.\n\nWarlord Goretooth, Kargath",
}

P:Letter {
  id = "maxwell_ubrs", npc = "maxwell", delay = 2400,
  when = { cleared = "Upper Blackrock Spire", faction = "Alliance" },
  subject = "Drakkisath",
  body = "{name},\n\nMorgan's Vigil has been short of good news for so long that the lookouts did not believe the runner at first. General Drakkisath is dead, and the black dragonflight has lost the commander of its Spire. I have read the report three times, and I intend to read it a fourth before I sleep.\n\nMarshal Windsor gave a great deal to bring us word of what was happening in that mountain. I would like to think he would be satisfied with how it ended. I know I am.\n\nYour name is in my dispatch to Stormwind, deputy, and I have asked that it be read aloud. Whether anyone at court listens is another matter, but the Vigil will remember.\n\nMarshal Maxwell, Morgan's Vigil",
}

P:Letter {
  id = "eitrigg_ubrs", npc = "eitrigg", delay = 2400,
  when = { cleared = "Upper Blackrock Spire", faction = "Horde" },
  subject = "The son of Blackhand",
  body = "{name},\n\nI knew Rend Blackhand when he was young and loud and certain that the Horde belonged to his family by right of blood. He did not grow wiser. He only grew more dangerous, and he called himself Warchief from a throne the dragons let him sit on.\n\nThrall has spoken of you at the fire, and he did not need to raise his voice to do it. The old Horde ends a little more with every one of those false chieftains who falls, and you have struck down one of the last.\n\nI am an old orc, and I have seen a great many warriors. I do not write to many of them.\n\nEitrigg",
}

P:Letter {
  id = "molthor_zulgurub", npc = "molthor", delay = 3600,
  when = { cleared = "Zul'Gurub" },
  subject = "De Soulflayer",
  body = "{name},\n\nDe drums on Yojamba Isle have been playing since dawn, and dey will play until de drummers fall asleep on dem. Hakkar is cast out of dis world. His priests are broken, Jin'do is silent, and de Gurubashi who are left will have to decide what kind of trolls dey want to be now dat de blood god is gone.\n\nThe Zandalar have watched over our kin for longer than your kingdoms have stood, and we have seen many heroes come and go. Few of dem ever walked into dat temple, and fewer walked out. You did both.\n\nRastakhan will hear your name. For de Zandalar, dat is no small thing.\n\nMolthor, Hand of Rastakhan",
}

P:Letter {
  id = "bolvar_blackwing", npc = "bolvar", delay = 1800,
  when = { cleared = "Blackwing Lair", faction = "Alliance" },
  subject = "The head at the gate",
  body = "{name},\n\nThe head of Nefarian hangs at the gates of Stormwind this morning, and the crowd that came to see it has not thinned since sunrise. I have watched soldiers who lost brothers in the Burning Steppes stand beneath it for an hour without speaking. You have given this city something it has not had in a long time, and that is a reason to stand up straight.\n\nHis sister sat at our court for years, wearing a noble's face, and nearly turned the kingdom against itself. Her brother did his work in the dark of the mountain, and now he is finished as well. I do not believe in endings, but I will allow myself to call this one.\n\nThe Keep is open to you, as it always will be.\n\nHighlord Bolvar Fordragon, Regent of Stormwind",
}

P:Letter {
  id = "thrall_blackwing", npc = "thrall", delay = 1800,
  when = { cleared = "Blackwing Lair", faction = "Horde" },
  subject = "Nefarian",
  body = "{name},\n\nThe head of the black dragon's son hangs over the Valley of Strength, and the city has not been this loud since we raised its walls. I have walked beneath it twice today. I wanted to see the faces of the people looking up at it, and I saw orcs who have hated the Blackrock clan their whole lives smiling at one another.\n\nNefarian used my people as his tools and his toys. He bred monsters from the blood of dragons and wore our warriors down in his mountain for his own amusement. Those days are over because of you and the ones who went with you.\n\nThe Horde owes you more than a feast, but you will have a feast as well. I insist.\n\nThrall, Warchief of the Horde",
}

---------------------------------------------------------------------------
-- More from the trainers and the masters of each calling
---------------------------------------------------------------------------
P:Letter {
  id = "grezz_warrior", npc = "grezz", delay = 2400,
  when = { minLevel = 40, class = "WARRIOR", faction = "Horde" },
  subject = "From the Valley of Honor",
  body = "{name},\n\nThe recruits in my yard keep asking about you, because some loudmouth told them you used to train here and now you're out cracking skulls the length of Kalimdor. I told them it was true, and that you were all elbows when you started, and they didn't believe the second part.\n\nHere's what I didn't teach you, because you weren't ready for it then. Anger is a fire, and a fool lets it burn him up in one fight. A real warrior banks it like a smith banks a forge, and keeps it hot for the long day. You've lived this long, so I reckon you've figured that out.\n\nCome back and show the pups how it's done. I'll even let you pick the sword.\n\nGrezz Ragefist, Valley of Honor",
}

P:Letter {
  id = "wushen_warrior", npc = "wu_shen", delay = 2400,
  when = { minLevel = 30, class = "WARRIOR", faction = "Alliance" },
  subject = "A word about stance",
  body = "{name},\n\nA guardsman who served with you in the Wetlands came through the hall last week and spoke of you with some respect. He also said you led with your shoulder when you charged, and that you nearly lost your footing on a wet stone. I believe both things, because they are the same mistake I corrected in you a dozen times.\n\nYou have grown strong, and strength forgives a great deal. It will not forgive everything. The enemies you face now are faster and cleverer than the kobolds of Elwynn, and they will find whatever you have been too proud to fix.\n\nFeet first, then the blade. You know the rest. Come to the hall when you have an afternoon, and we will see where you stand.\n\nWu Shen, Stormwind",
}

P:Letter {
  id = "ravenholdt_rogue", npc = "ravenholdt", delay = 3000,
  when = { minLevel = 30, class = "ROGUE" },
  subject = "An observation",
  body = "{name},\n\nYou will not know who delivered this letter, and that is rather the point. I have had you watched these past months, not because I distrust you, but because watching is what we do, and you have become interesting enough to be worth the effort.\n\nThe Syndicate is still crawling over the hills of Alterac like lice on an old dog, and they still believe that a nobleman's name is a licence to steal. They are wrong about many things, but chiefly about how quiet the rest of us can be. I suspect you understand that now.\n\nThe manor is always open to those who can find it. Do try not to be seen coming.\n\nLord Jorach Ravenholdt",
}

P:Letter {
  id = "ormak_hunter", npc = "ormak", delay = 2400,
  when = { minLevel = 40, class = "HUNTER", faction = "Horde" },
  subject = "Tracks",
  body = "{name},\n\nA tauren trader came through the Valley of Honor with a cured hide from a beast he said you brought down in Feralas, and I knew the cut before he told me the name. You still angle the knife the way I showed you. I'm glad to see it.\n\nYou're at the age, as hunters count it, when the prey starts being cleverer than the traps. You will lose a beast or two out there, and maybe a companion you care for. Grieve it properly, and then go back to the work. The wilds do not wait for anyone to finish crying.\n\nBring your beast by the Valley when you're in the city. I want to see if it's eating properly.\n\nOrmak Grimshot",
}

P:Letter {
  id = "benedictus_priest", npc = "benedictus", delay = 2400,
  when = { minLevel = 40, class = "PRIEST", faction = "Alliance" },
  subject = "A letter from the Cathedral",
  body = "{name},\n\nThe brothers and sisters of the Cathedral pray each evening for those of our order who walk far from Stormwind, and your name has been among them for some time. I wanted you to know that, because the road can make a priest feel very far from home.\n\nYou have seen terrible things by now, I expect, and you will see worse. There will be days when the Light feels thin and the shadows seem to answer more readily. Do not be ashamed of those days. Every priest who has ever done good in this world has had them, and the Light did not leave any of us for asking hard questions.\n\nCome home to us when you can. The candles are lit, and there is always a place at the altar.\n\nArchbishop Benedictus, Cathedral of Light",
}

P:Letter {
  id = "zevrost_warlock", npc = "zevrost", delay = 2400,
  when = { minLevel = 40, class = "WARLOCK", faction = "Horde" },
  subject = "From the Cleft",
  body = "{name},\n\nThe Cleft is quieter than usual. Two of my students have gone missing this season, and one of them came back with a voice in his head that does not belong to him. I mention this not to frighten you, but because you are still yourself, and that is a rarer achievement than you might think.\n\nThe Burning Blade still recruits in the dark places of this city, and they will promise you power without a price. You know better. Every bargain has a price, and the only question worth asking is who pays it. Make sure it is never you.\n\nCome down out of the light when you are next in Orgrimmar. Somebody here always notices when you are gone.\n\nZevrost, Cleft of Shadow",
}

P:Letter {
  id = "gakin_warlock", npc = "gakin", delay = 2400,
  when = { minLevel = 30, class = "WARLOCK", faction = "Alliance" },
  subject = "Below the Slaughtered Lamb",
  body = "{name},\n\nI'm told a Stormwind guard asked about you at the bar upstairs last week, and that the barman told him he'd never heard of you. That is the correct answer, and I hope you'll be generous with him the next time you pass through.\n\nYou are past the point where the imp is your strongest servant, which means you are past the point where your mistakes are small. The demons you bind now are patient. They remember every slip you make, and they wait. Keep your circles clean and your wards fresh, and never bargain with something while you are tired.\n\nWe are proud of you down here, in our way. We would simply rather nobody else knew it.\n\nGakin the Darkbinder",
}

P:Letter {
  id = "bethor_mage", npc = "bethor", delay = 2400,
  when = { minLevel = 40, class = "MAGE", faction = "Horde" },
  subject = "From the Magic Quarter",
  body = "{name},\n\nThe apprentices of the Magic Quarter have taken to repeating stories about you, and most of them are exaggerated beyond recognition. One or two of them, however, are true, and I have checked. You are becoming a mage of some consequence, which means you are becoming a mage whom others will try to use.\n\nI learned my craft among people who believed that knowledge was always its own justification. Some of them followed that belief all the way into the grave, and some of them did worse. A Forsaken mage cannot afford to be naive. Study everything, trust very little, and keep your own counsel.\n\nThe Quarter keeps its secrets, but it will keep a few for you as well.\n\nBethor Iceshard, Undercity",
}

P:Letter {
  id = "mathrengyl_druid", npc = "mathrengyl", delay = 2400,
  when = { minLevel = 30, class = "DRUID", faction = "Alliance" },
  subject = "From the Enclave",
  body = "{name},\n\nThe wisps of the Enclave are restless this season, and the older druids say it is the Dream stirring. Whatever the cause, I found myself thinking of the young druids who have passed through these halls, and of you in particular, because the sentinels at Astranaar spoke well of you.\n\nYou have learned to wear the bear and the cat now, and perhaps you have begun to understand that the shape is not the lesson. The lesson is balance. A druid who takes the claws and forgets the patience is only a beast with a good memory.\n\nWalk gently, and come home to Teldrassil when the roots call you. The Enclave will be glad of you.\n\nMathrengyl Bearwalker, Cenarion Enclave",
}

---------------------------------------------------------------------------
-- As you grow, continued
---------------------------------------------------------------------------
P:Letter {
  id = "magni_twenty", npc = "magni", delay = 3600,
  when = { minLevel = 20, faction = "Alliance" },
  subject = "From the High Seat",
  body = "{name},\n\nMy brother Brann, wherever he's got to this month, always said you can judge a {race} by the dirt on their boots. I've had a look at the reports from the Wetlands and Loch Modan, and by that measure yours must be filthy, which I mean as the highest praise.\n\nIronforge has a long memory, lad, or lass, as the case may be, and it remembers the ones who stood with us when the troggs came up out of the earth and the Dark Irons came down from the mountains. Keep at it. There's a good deal more of this world that needs a firm hand and a steady axe.\n\nWhen you're in the city, come and drink with me in the Great Forge. Tell the guards I said so, and if they argue, tell them louder.\n\nMagni Bronzebeard, King of Ironforge",
}

P:Letter {
  id = "cairne_fifty", npc = "cairne", delay = 3600,
  when = { minLevel = 50, faction = "Horde" },
  subject = "The long road",
  body = "{name},\n\nThe elders tell me that the young {class} who once came to Thunder Bluff asking questions now has questions asked of them in turn. I have lived long enough to know that this is the moment when a warrior is most in danger, not from their enemies, but from their own pride.\n\nYou have walked from the Barrens to the edges of the world, and you have seen the wounds this land carries. Remember why you started walking. The Earth Mother does not ask us to be great. She asks us to be good, and to leave the land a little better than we found it.\n\nMy fire is still lit, and my pipe is still full. Come sit with an old bull before the winter.\n\nCairne Bloodhoof, High Chieftain of the Tauren",
}

P:Letter {
  id = "tyrande_fifty", npc = "tyrande", delay = 3600,
  when = { minLevel = 50, faction = "Alliance" },
  subject = "Under Elune's light",
  body = "{name},\n\nThe Sentinels who patrol Felwood and Winterspring send me word of the ones who fight beside them, and your name has reached me more than once. I wanted you to know that the Temple of the Moon has noticed, and that the priestesses have added you to their prayers.\n\nThe world is darker than it was when you first took up arms. The corruption in Felwood spreads, and things stir in the south that my people have not seen in ten thousand years. You will be asked to go where few others can. When that day comes, go knowing that Elune watches over those who protect the innocent, whatever their race.\n\nMay her light guide you, {name}, as it has guided me.\n\nTyrande Whisperwind, High Priestess of Elune",
}
