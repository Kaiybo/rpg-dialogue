-- Letters from Horde folk you've met (Durotar to Feralas, Tirisfal to Stonard), with their own
-- replies, and the follow-ups some of those replies bring back. Follow-ups have no `when` and no
-- `random`: only a reply's fx.letter sends them.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

---------------------------------------------------------------------------
-- Durotar and Orgrimmar
---------------------------------------------------------------------------
P:Letter {
  id = "ho_zureetha", npc = "zureetha", delay = 2400,
  when = { cleared = "Ragefire Chasm", faction = "Horde" },
  subject = "Under the city",
  body = "{name},\n\nWhen you were fresh in the Valley of Trials I sent you after the Burning Blade in their little cave, and you came back with blood on your boots and asked what came next. Now the runners say you went down into the Cleft of Shadow and further, into the fire under Orgrimmar itself, and the Searing Blade there will not be gathering again soon.\n\nI have told the new recruits about it. They listen better when the story has a name in it they might someday meet.\n\nThe cultists are like scorpids, {class}. You can stamp out the nest you see, but there is always another under the next rock, so keep your eyes on the ground and your blade loose.\n\nZureetha Fargaze, Valley of Trials",
  replies = {
    { id = "more", text = "Tell the recruits there are always more rocks to turn over.", fx = { affinity = 1 } },
    { id = "tired", text = "I went down there for the Horde, not for a story.", fx = { npcFlag = { set = "ho_modest" } } },
    { id = "warlock", text = "I learned from their fire. I won't let it learn from me.", when = { class = "WARLOCK" }, fx = { npcFlag = { set = "ho_warlock_answer" } } },
  },
}

P:Letter {
  id = "ho_orgnil", npc = "orgnil", random = true, when = { faction = "Horde", minLevel = 14 },
  subject = "Ashes at Razor Hill",
  body = "{name},\n\nA peon brought me a scrap of cloth from the cave above Razor Hill, burned at the edges and stitched with the Burning Blade's mark, and he wanted to know if he could keep it for luck. I took it off him and put it in the fire, and then I told him why, and now he will not go near that cave at all, which is the right lesson learned the wrong way.\n\nThe Blade still whisper in Thunder Ridge and down by the coast. Fewer of them than before, and you have something to do with that.\n\nIf you meet any of them on your roads, remember that every one of them thought he could hold the fire without being burned. I have buried enough of them to know how that ends.\n\nOrgnil Soulscar, Razor Hill",
  replies = {
    { id = "right", text = "You did right to burn it. Some luck isn't worth having.", fx = { affinity = 1, opinion = { burning_legion = "hate" } } },
    { id = "soft", text = "Be easy on the peon. He only wanted something to hold onto.", fx = { npcFlag = { set = "ho_peon_mercy" } } },
    { id = "curious", text = "I'd have liked to study that cloth before you burned it.", fx = { affinity = -1, opinion = { burning_legion = "curious" } } },
  },
}

P:Letter {
  id = "ho_hanazua", npc = "hanazua", random = true, when = { faction = "Horde", minLevel = 10 },
  subject = "Still breathing, mon",
  body = "{name},\n\nDis be Hana'zua, from under the tree on the plateau, in case you forgot da troll who lost an argument with a scorpid. Da poison went out of me slow, and da healers at Sen'jin say I be lucky I don't have three toes less, so I think the loa decided I be more fun alive.\n\nI walk to Razor Hill and back every day now, to make da leg strong again. Sometimes I stop where Sarkoth used to hide and I tell da rocks he be dead, just so dey know.\n\nYou come by Sen'jin and I owe you a drink of something da Darkspear make that da orcs can't stand. It be the least I can do.\n\nHana'zua of the Darkspear",
  replies = {
    { id = "glad", text = "I'm glad you're walking again. Tell the rocks I said hello.", fx = { affinity = 1 } },
    { id = "drink", text = "I'll hold you to that drink, and I'll finish it.", fx = { npcFlag = { set = "ho_owed_drink" } } },
    { id = "kin", text = "Darkspear don't die easy. The loa know it, cousin.", when = { race = "Troll" }, fx = { affinity = 1, opinion = { darkspear = "loyal" } } },
  },
}

P:Letter {
  id = "ho_zilzibin", npc = "zilzibin", random = true, when = { faction = "Horde", minLevel = 30 },
  subject = "Another report nobody will read",
  body = "{name},\n\nYou were kind enough to listen to me in the Drag, which makes you the only one this season, so you will forgive me for writing. A caravan master came through from Tanaris with a story about the sand south of Gadgetzan humming at night, and he swore the dunes moved when there was no wind. He thought it was the heat. I do not think it was the heat.\n\nI have sent a copy of my notes to Grommash Hold, and another to the Cenarion Circle, and another to anyone who will sign for it. The silithid do not care whether the Horde believes in them, {name}, and that is precisely what frightens me.\n\nIf you go south, keep your boots off the sand where you can, and write down anything that skitters.\n\nZilzibin Drumlore, Valley of Spirits",
  replies = {
    { id = "believe", text = "I believe you, Zil. I'll watch the sand and write it down.", fx = { affinity = 1, npcFlag = { set = "ho_silithid_watcher" } } },
    { id = "heat", text = "Maybe it really was the heat. Caravan masters tell tall tales.", fx = { affinity = -1 } },
    { id = "circle", text = "Send it to the Circle again. They'll listen before Orgrimmar does.", fx = { opinion = { cenarion_circle = "trust" } } },
  },
}

---------------------------------------------------------------------------
-- The Barrens
---------------------------------------------------------------------------
P:Letter {
  id = "ho_mankrik", npc = "mankrik", delay = 3600,
  when = { questDone = TODO_QUEST("Lost in Battle"), faction = "Horde" },
  subject = "A cairn for Olgra",
  body = "{name},\n\nI built a cairn for Olgra on the rise west of the Crossroads, where you can see the road coming from the south. It took me nine days, because the stones out here are either too small or too big, and she would have laughed at me for that and then carried the big ones herself.\n\nThe grunts leave me alone now when I stand at the gate. They used to ask me what I was looking at, and I think they know.\n\nYou brought her back to me, and I never thanked you properly, because I could not speak that day. I can speak now. Thank you. If you ever pass the cairn, put a stone on it, and if you knew anything about her, I would like to hear it.\n\nMankrik",
  replies = {
    { id = "tell", text = "I'll tell you how she fought. She did not go down easily.", fx = { affinity = 1, letter = "ho_mankrik_2" } },
    { id = "stone", text = "I'll put a stone on her cairn whenever I pass the Crossroads.", fx = { affinity = 1, npcFlag = { set = "ho_olgra_stone" } } },
    { id = "vengeance", text = "The quilboar who did it will pay. I'll see to it.", fx = { npcFlag = { set = "ho_olgra_vengeance" } } },
  },
}

P:Letter {
  id = "ho_mankrik_2", npc = "mankrik", delay = 5400,
  subject = "She did not go down easily",
  body = "{name},\n\nI read your letter at the gate, and then I read it again at the cairn, and the second time I read it out loud so she could hear it too. I knew she fought. I did not know how many of them it took, and now that I do, I am angry and proud at the same time, and I did not think a man could be both.\n\nShe always said I would die first, because I was slower. She was right that I was slower.\n\nThe Crossroads is quiet tonight. I am going to sit by the stones a while and tell her what you wrote, in my own words, which are worse than yours, but she was used to them.\n\nMankrik",
  replies = {
    { id = "proud", text = "Be proud, Mankrik. Olgra earned every word of it.", fx = { affinity = 1 } },
    { id = "live", text = "She'd want you to live, not just stand at the gate.", fx = { npcFlag = { set = "ho_mankrik_live" } } },
  },
}

P:Letter {
  id = "ho_sergra", npc = "sergra", random = true, when = { faction = "Horde", minLevel = 18 },
  subject = "The Barrens got serious",
  body = "{name},\n\nYou remember I told you the Barrens eats the timid. It has been eating the bold as well this month. The centaur are pushing up from the south, the raptors have learned to wait in the long grass by the Gold Road, and a kodo caravan lost half its beasts between here and Camp Taurajo.\n\nI am not writing to ask for help. I am writing because when the grunts at the gate start looking pale, I tell them about the ones who came through here green and came back hard, and your name is on that short list.\n\nIf you are still alive out there, keep being alive. It does wonders for morale at the Crossroads.\n\nSergra Darkthorn",
  replies = {
    { id = "alive", text = "Still alive, and I plan to stay that way. Tell the grunts.", fx = { affinity = 1 } },
    { id = "coming", text = "If the Gold Road needs clearing, I'll come back and clear it.", fx = { npcFlag = { set = "ho_gold_road_offer" } } },
    { id = "proud", text = "I don't need a list. I need the Barrens to fear me.", fx = { npcFlag = { set = "ho_sergra_boast" } } },
  },
}

P:Letter {
  id = "ho_helbrim", npc = "helbrim", random = true, when = { faction = "Horde", minLevel = 15 },
  subject = "The jars, an update",
  body = "Dear helper,\n\nYou will be pleased to hear that the samples you gathered for me have been catalogued, labelled, and shipped to the Apothecarium, with only one jar breaking on the kodo, and that one only killed the grass where it landed. The tauren have opinions about the grass. They have sent a druid to stand near my stall and look sorrowful, which I find helps me concentrate.\n\nThe Society is very interested in what lives in the Barrens. The things that survive here survive everything else, you see, and survival is a quality we prize, having so recently lost it ourselves.\n\nIf you come through the Crossroads, I could use another pair of living hands. Mine shake more every month, and the scorpid venom will not milk itself.\n\nApothecary Helbrim, the Crossroads",
  replies = {
    { id = "what", text = "What exactly is the Society making from those samples, Helbrim?", fx = { letter = "ho_helbrim_2", npcFlag = { set = "ho_asked_samples" } } },
    { id = "help", text = "I'll milk your scorpids, but keep your jars off the grass.", fx = { affinity = 1 } },
    { id = "grass", text = "The tauren are right to watch you. That grass was alive.", fx = { affinity = -1, opinion = { forsaken = "distrust" } } },
  },
}

P:Letter {
  id = "ho_helbrim_2", npc = "helbrim", delay = 4800,
  subject = "Re: What exactly",
  body = "Dear helper,\n\nWhat a direct question, and from the living, too. The answer is medicine, of a kind, and study, of another kind, and the Royal Apothecary Society does not discuss the rest in letters carried by a wind rider who cannot read but can certainly be bribed.\n\nI will tell you this much. Everything in the Barrens is trying to kill everything else, and the clever things learn how. The Society would like to learn how as well, so that when the Scourge comes south we have something better than prayers to throw at it.\n\nThere, I have answered you honestly, more or less, and I shall now go and wash my hands, which I do not need to do, but I find the ritual comforting.\n\nApothecary Helbrim",
  replies = {
    { id = "fair", text = "Against the Scourge, then. I can live with that answer.", fx = { affinity = 1, opinion = { new_plague = "necessary" } } },
    { id = "doubt", text = "More or less honest isn't honest. I'll be watching the Society.", fx = { opinion = { new_plague = "dangerous" } } },
  },
}

P:Letter {
  id = "ho_tonga", npc = "tonga", delay = 2400,
  when = { cleared = "Wailing Caverns", faction = "Horde" },
  subject = "The water is clearer",
  body = "{name},\n\nI walked to the Lushwater Oasis yesterday at dawn and knelt by the water, as I have done many mornings since I came to the Crossroads. For the first time it did not taste of bad dreams. It is not well yet, and the Druids of the Fang are not all gone, but something in the caverns has gone quiet, and the land is breathing easier.\n\nThe braves tell me you were the one who went down into the dark. I will not ask what you saw. Some things druids made are best left for the Earth Mother to unmake.\n\nThe herd is grateful, even those who do not know it. Walk well, and may the rains find you.\n\nTonga Runetotem, the Crossroads",
  replies = {
    { id = "saved", text = "Naralex's disciples deserve the thanks. I only cleared the way.", fx = { affinity = 1 } },
    { id = "healers", text = "Some of the Fang were healers once. I hope they find peace.", fx = { opinion = { druids = "pity" } } },
    { id = "druid", text = "I felt the dream break, Tonga. The land is listening again.", when = { class = "DRUID" }, fx = { affinity = 1, opinion = { cenarion_circle = "respect" } } },
  },
}

---------------------------------------------------------------------------
-- Mulgore and Thunder Bluff
---------------------------------------------------------------------------
P:Letter {
  id = "ho_hawkwind", npc = "hawkwind", random = true, when = { faction = "Horde", minLevel = 12 },
  subject = "From the fire at Narache",
  body = "{name},\n\nThe young ones at Camp Narache have started their trials, and each evening they sit around my fire and ask about those who went before them. I tell them about the plainstriders and the mountain cougar, and about the one who went up to Red Cloud Mesa and came back grown.\n\nMy son Grull says I tell your story too often. My son Grull is young and has not yet learned that a story told often is a story the tribe keeps.\n\nThe rains came early this year, and the grass on the mesa is tall. Wherever the winds carry you, remember that there is a fire here that knows your name.\n\nChief Hawkwind, Camp Narache",
  replies = {
    { id = "honour", text = "Tell the young ones it was harder than it looked.", fx = { affinity = 1 } },
    { id = "grull", text = "Grull is right, Chief. Tell them their own stories instead.", fx = { npcFlag = { set = "ho_humble_story" } } },
    { id = "home", text = "Narache is still the fire I think of as home.", when = { race = "Tauren" }, fx = { affinity = 1, opinion = { earth_mother = "faith" } } },
  },
}

P:Letter {
  id = "ho_ahab", npc = "ahab", random = true, when = { faction = "Horde", minLevel = 10 },
  subject = "He's gone again",
  body = "Dear friend,\n\nI am sorry to write with the same old trouble, but Kyle has run off again. He was there at sunset chewing a kodo bone the size of his own head, and in the morning there was only the bone and a hole under the fence big enough to lose a plainstrider in.\n\nInnkeeper Kauth says he saw something brown and scruffy go past the windmill in the night, with something in its mouth that might have been one of his fish. That would be Kyle, I'm afraid.\n\nIf you happen to be near Bloodhoof, keep an eye out. He comes to anyone who smells of tasty food, so you might carry a little meat in your pack, just in case.\n\nAhab Wheathoof",
  replies = {
    { id = "watch", text = "I'll carry meat in my pack and keep my eyes open for him.", fx = { affinity = 1, letter = "ho_ahab_2_home" } },
    { id = "fence", text = "Fix that fence properly, Ahab, before he digs to Orgrimmar.", fx = { letter = "ho_ahab_2_fence" } },
    { id = "dog", text = "He'll come home when he's hungry. Dogs always do.", fx = { npcFlag = { set = "ho_kyle_calm" } } },
  },
}

P:Letter {
  id = "ho_ahab_2_home", npc = "ahab", delay = 4200,
  subject = "Kyle is home!",
  body = "Dear friend,\n\nGood news! Kyle came back on his own two days after I wrote, muddy to the ears and very pleased with himself, and he brought a present, which turned out to be a whole quilboar boot. I don't know where he found it, and I have decided not to ask.\n\nI thought of you when he came in, because you said you'd keep watch, and it's a comfort knowing someone out there is looking for him besides me. Kauth says that's foolish, a grown tauren fretting over a dog, but Kauth also feeds him scraps when he thinks I'm not watching.\n\nThank you for your kindness. He sends his regards, which is to say he sneezed on the paper.\n\nAhab Wheathoof",
}

P:Letter {
  id = "ho_ahab_2_fence", npc = "ahab", delay = 4200,
  subject = "About the fence",
  body = "Dear friend,\n\nI took your advice and fixed the fence. I sank the posts deep, I packed the ground with stones, and I asked one of the braves to help me stretch the hide properly, and it was the finest fence in Bloodhoof Village for very nearly a whole night.\n\nIn the morning Kyle was sitting on the outside of it looking at me, and I still do not know how. The brave thinks he jumped. Kauth thinks he climbed. I think he simply decided to be on the other side, and the fence had no say in it.\n\nHe's home now, at least, and asleep on my boots. I will leave the fence up, because it makes me feel better, but I don't think it makes him feel anything at all.\n\nAhab Wheathoof",
}

P:Letter {
  id = "ho_baine", npc = "baine", random = true, when = { faction = "Horde", minLevel = 20 },
  subject = "The plains below the bluffs",
  body = "{name},\n\nThe Venture Company has crept back into the hills on the north edge of Mulgore. They are fewer than before, but they brought new machines, and the braves tell me the noise frightens the swoops off their nests. My father says patience, and he is wise, but patience does not put the trees back on the hill.\n\nThe Palemane gnolls have been quieter since you passed through, and the herds graze closer to the village than they have in years. That is your doing as much as anyone's, and I wanted you to know it was noticed.\n\nIf your road brings you home to Mulgore, come and eat with us. Bloodhoof keeps its friends fed.\n\nBaine Bloodhoof",
  replies = {
    { id = "patience", text = "Your father is right. The land outlasts any goblin machine.", fx = { opinion = { cairne = "respect" } } },
    { id = "act", text = "Patience is for later. Drive the goblins out now.", fx = { npcFlag = { set = "ho_baine_act" } } },
    { id = "eat", text = "I'll come and eat with you, Baine. Save me a seat.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "ho_bashana", npc = "bashana", delay = 3000,
  when = { cleared = "Blackfathom Deeps", faction = "Horde" },
  subject = "Word from Elder Rise",
  body = "{name},\n\nA messenger from Zoram'gar came up the lift this morning with news of Blackfathom Deeps, and my father listened to all of it without speaking, which is how he listens to things that matter. The Twilight's Hammer were in that drowned temple, doing something to the old power under the water, and now they are fewer and the water is a little quieter.\n\nThe Circle will want to know more than the messenger could tell. If you saw anything strange down there, carvings or shrines or anything the cultists were feeding, I would be glad to hear of it, and I will pass it to those who can make sense of it.\n\nThank you for going where the rest of us only worried about.\n\nBashana Runetotem, Elder Rise",
  replies = {
    { id = "tell", text = "I saw old elven stone and cultists feeding something below. Tell the Circle.", fx = { affinity = 1, opinion = { cenarion_circle = "trust" } } },
    { id = "brief", text = "The cultists are dead. That's all anyone needs to know.", fx = { npcFlag = { set = "ho_bfd_brief" } } },
    { id = "druid", text = "Something under that water was dreaming badly. Your father should know.", when = { class = "DRUID" }, fx = { affinity = 1, opinion = { druids = "respect" } } },
  },
}

---------------------------------------------------------------------------
-- Undercity and Tirisfal
---------------------------------------------------------------------------
P:Letter {
  id = "ho_bauhaus", npc = "bauhaus", random = true, when = { faction = "Horde", minLevel = 22 },
  subject = "Census irregularity",
  body = "To {name},\n\nIt has come to the attention of the census office that you have now been seen in the Undercity a number of times exceeding what we classify as a visit and approaching what we classify as a residence. As a {race}, you present a difficulty, since my ledger has columns for the risen, the risen again, and the regrettably still dead, and none for you.\n\nI have drafted a new form. It is four pages long, and I am quite proud of it. You may collect it from my office at your convenience, by which I mean mine.\n\nI should add that nobody has ever asked to be counted by me before. I don't expect you will either, but the form exists now, and forms, unlike most of us, are patient.\n\nRoyal Overseer Bauhaus, Office of the Census",
  replies = {
    { id = "fill", text = "Send the form. I'll fill in every page, in ink.", fx = { affinity = 1, letter = "ho_bauhaus_2_filed" } },
    { id = "refuse", text = "I'm not living in your city, and I'm not filling in forms.", fx = { letter = "ho_bauhaus_2_refused" } },
    { id = "forsaken", text = "Put me under risen, Overseer. I've been counted before.", when = { race = "Scourge" }, fx = { affinity = 1, npcFlag = { set = "ho_census_risen" } } },
  },
}

P:Letter {
  id = "ho_bauhaus_2_filed", npc = "bauhaus", delay = 6000,
  subject = "Form received",
  body = "To {name},\n\nYour completed form arrived, all four pages, filled in a legible hand and with your name spelled the same way every time it appeared. I have had it framed. That is a joke, of a kind, but I did put it at the top of the pile, which in this office is a far greater honour.\n\nYou are now the only entry in a column I have titled Residents, Other. I intend to keep it that way, because a column with one name in it is tidy, and tidiness is in short supply below Lordaeron.\n\nShould you die, please inform the office in person. We will move you to the appropriate column.\n\nRoyal Overseer Bauhaus",
}

P:Letter {
  id = "ho_bauhaus_2_refused", npc = "bauhaus", delay = 6000,
  subject = "Noted",
  body = "To {name},\n\nYour refusal has been received and filed under Refusals, a drawer that is fuller than you might imagine and which I do not open often, because the smell of indignant ink lingers.\n\nI note that refusing to be counted is itself a kind of entry, and I have therefore counted you as someone who refused. You will find this is how most of the Undercity's arguments with me end.\n\nThe form remains available should you change your mind. I suspect it will outlast us both.\n\nRoyal Overseer Bauhaus",
}

P:Letter {
  id = "ho_keever", npc = "uc_keever", random = true, when = { faction = "Horde", minLevel = 24 },
  subject = "Progress, of a sort",
  body = "{name},\n\nKeever writes to report that the fourth batch of the serum has been administered to the subject, as you may recall you once watched Keever attempt. Master Faranell had hoped for a weapon of terrible power. The result, Keever regrets, is a larger frog.\n\nIt is a very large frog. It is larger than the cage it was in, which Keever counts as a partial success, though the cage does not. Master Faranell said nothing for some time and then asked Keever to write to someone who would find this amusing, which Keever took to mean you.\n\nKeever will continue. The Dark Lady is owed a weapon, and Keever is owed, at the very least, a subject that does not croak.\n\nApothecary Keever, the Apothecarium",
  replies = {
    { id = "name", text = "Name the frog. A weapon that size deserves a name.", fx = { affinity = 1, letter = "ho_keever_2" } },
    { id = "stop", text = "Whoever was in that cage deserved better than a frog.", fx = { affinity = -1, opinion = { forsaken = "distrust" } } },
    { id = "keep", text = "Keep at it, Keever. The fifth batch will be the one.", fx = { npcFlag = { set = "ho_keever_cheered" } } },
  },
}

P:Letter {
  id = "ho_keever_2", npc = "uc_keever", delay = 5400,
  subject = "The frog has a name",
  body = "{name},\n\nKeever has done as you suggested and named the frog. Keever considered many names, including several of the Scarlet Crusade's officers, and in the end chose Faranell, because it amused Keever and because Master Faranell has not yet visited the cage to read the label.\n\nFaranell the frog is eating well. It eats crickets, beetles, and one of the smaller rats from the lower canals, which Keever believes was already dead, and Keever has written that down as a success too.\n\nKeever thanks you for your suggestion. Nobody has ever made one to Keever before that did not end with the word stop.\n\nApothecary Keever",
}

P:Letter {
  id = "ho_mordo", npc = "mordo", delay = 2400,
  when = { race = "Scourge", minLevel = 20 },
  subject = "From the graves at Deathknell",
  body = "{name},\n\nI dug up three more this week, and two of them sat up and asked where they were, and the third did not, so I put him back gently and said a few words, as I've been told I ought to. I think of you at the start of each one, because you were one of the ones who sat up and stayed yourself, and that does not happen as often as the Dark Lady's heralds would have you believe.\n\nThe ground in Deathknell is soft this time of year, and the bats are loud, and Sarvis says I talk to the graves too much. He may be right, but they never complain.\n\nI hope your new life is treating you better than your old one did. If it isn't, there is always a shovel here, and I am always glad of company that doesn't mind the smell.\n\nUndertaker Mordo, Deathknell",
  replies = {
    { id = "words", text = "Keep saying the words, Mordo. The ones who don't wake deserve them.", fx = { affinity = 1 } },
    { id = "will", text = "I stayed myself by will alone. Tell the new ones that.", fx = { npcFlag = { set = "ho_mordo_will" } } },
    { id = "bitter", text = "My new life is mostly fighting. My old one had more sunlight.", fx = { opinion = { forsaken = "pity" } } },
  },
}

P:Letter {
  id = "ho_coleman", npc = "coleman", random = true, when = { faction = "Horde", minLevel = 12 },
  subject = "The mill, and its owners",
  body = "Friend,\n\nI walked out to the Agamand Mills last night, as far as the fence, which is as far as I let myself go these days. The lamps were lit in the big house, though nobody living has lit them in years, and I could see a figure at the upstairs window that I am fairly certain used to be Thurman Agamand. He was standing exactly where he stood when he told us to hold the mills at any cost.\n\nI didn't wave. I'm told the polite thing for a former employee is to wave, but I find I've lost my manners along with my pulse.\n\nYou've a steady hand and no love for the Scourge, as I recall. If you've a mind to put them to rest, the family seems to be keeping the lamps lit for you.\n\nColeman Farthing, the Gallows' End",
  replies = {
    { id = "finish", text = "I'll finish it. The Agamands have kept you waiting long enough.", fx = { affinity = 1, letter = "ho_coleman_2" } },
    { id = "wave", text = "Next time, wave. It'll annoy him more than anything else.", fx = { affinity = 1, npcFlag = { set = "ho_coleman_wave" } } },
    { id = "let", text = "Let them keep their mill, Coleman. You've a life of your own now.", fx = { npcFlag = { set = "ho_coleman_letgo" } } },
  },
}

P:Letter {
  id = "ho_coleman_2", npc = "coleman", delay = 6000,
  subject = "The lamps went out",
  body = "Friend,\n\nThe lamps at the big house went out three nights ago, and they've stayed out. I went as far as the fence again, and then a little further, and then all the way to the door, which is the furthest I have walked onto Agamand land without being ordered to in my whole life and most of my death.\n\nNobody stood at the upstairs window. I stood there a while myself and found the view was nothing much, only fields gone grey and the river and the road to Brill.\n\nI said their names on the way home, as I used to, and then I said yours, which felt better. A pint is waiting at the Gallows' End whenever you're through. It tastes of nothing to me now, but I'm told it still tastes of something to you.\n\nColeman Farthing",
}

P:Letter {
  id = "ho_johaan", npc = "johaan", random = true, when = { faction = "Horde", minLevel = 18 },
  subject = "A request from Brill",
  body = "My helper,\n\nYou will remember bringing me the things that twitched. I have since found that the things that twitch are much more useful than the things that do not, and so I find myself, once again, short of supply.\n\nThe Scarlet Crusade have dug in deeper around the monastery to the north-east, and they have made the roads unpleasant for my collectors. Two did not return. One returned in a condition I would describe as instructive.\n\nI do not ask you to come back to Brill. I only mention that the Gallows' End serves a perfectly adequate stew for the living, and that my door is never locked, because nobody sensible would try it.\n\nApothecary Johaan, Brill",
  replies = {
    { id = "come", text = "I'll bring you something that twitches, Johaan. Keep the door open.", fx = { affinity = 1 } },
    { id = "scarlet", text = "The Crusade will answer for your collectors. I'll make sure of it.", fx = { opinion = { scarlet_crusade = "hate" } } },
    { id = "no", text = "Find yourself another errand runner. I'm done gathering for the Society.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- Silverpine
---------------------------------------------------------------------------
P:Letter {
  id = "ho_renferrel", npc = "renferrel", random = true, when = { faction = "Horde", minLevel = 16 },
  subject = "The damp, again",
  body = "{name},\n\nThe roof of the Sepulcher has begun to drip directly onto my workbench, which I have mentioned to the High Executor four times and which he regards as less urgent than the worgen, the Dalaran wizards, the Scourge and the gnolls. He may have a point. I don't care.\n\nThree batches spoiled this week. One of them turned a shade of green I have never seen before, and the deathguard who touched it is now a shade of green I have never seen before, and we are both waiting to see what happens next.\n\nIf you are anywhere near Silverpine and find yourself with a few dry hours and a strong back, I have a great many crates that need moving away from the drip. I will not pay you, but I will be visibly less unpleasant, which the others here will tell you is a rare reward.\n\nApothecary Renferrel, the Sepulcher",
  replies = {
    { id = "crates", text = "I'll move your crates. Try to be visibly less unpleasant, then.", fx = { affinity = 1 } },
    { id = "deathguard", text = "How is the green deathguard? I'd like to know what happens.", fx = { npcFlag = { set = "ho_green_deathguard" } } },
    { id = "roof", text = "Fix the roof yourself. The High Executor has real enemies.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "ho_hadrec", npc = "hadrec", delay = 2400,
  when = { cleared = "Shadowfang Keep", faction = "Horde" },
  subject = "The keep",
  body = "{name},\n\nThe deathstalkers report that the howling from Shadowfang Keep has thinned, and that Arugal's worgen no longer walk the north road in the numbers they did. I am told you were among those who went inside the walls.\n\nI will not pretend this ends my troubles. Dalaran still sends its people through the forest, the Scourge still press from the east, and the gnolls in the hills have not yet learned to fear us. But one of my four fronts is quieter tonight, and I have learned to be grateful for one.\n\nThe Dark Lady will hear your name in my next report. That is not a reward, {class}; it is simply the truth, and truth is what I deal in.\n\nHigh Executor Hadrec, the Sepulcher",
  replies = {
    { id = "next", text = "Name your next front, High Executor. I'll go there too.", fx = { affinity = 1, npcFlag = { set = "ho_hadrec_volunteer" } } },
    { id = "lady", text = "I didn't do it for the Dark Lady. I did it for Silverpine.", fx = { opinion = { sylvanas = "distrust" } } },
    { id = "loyal", text = "Tell her gladly. I serve the Dark Lady in all things.", fx = { opinion = { sylvanas = "loyal" } } },
  },
}

---------------------------------------------------------------------------
-- Stonetalon and Ashenvale
---------------------------------------------------------------------------
P:Letter {
  id = "ho_jinzil", npc = "jinzil", random = true, when = { faction = "Horde", minLevel = 20 },
  subject = "Da pot be boiling",
  body = "{name},\n\nJin'Zil be writing to you from da cave near Malaka'jin, with da pot on da fire and only a few of da cages full, so don't you be worrying. Da Venture goblins been cutting deeper into da Charred Vale, and dey smell like oil and greed, and one of dem came sniffing at Jin'Zil's door last week. He went home with a very interesting rash.\n\nDe spirits in da cages tell Jin'Zil things, mon. Dey say da mountain be angry, and dat da trees remember every axe. Jin'Zil believe dem, mostly.\n\nYou come by, Jin'Zil cook you somethin'. You don't ask what be in it, and Jin'Zil don't ask what you be killing out dere. Dat be a fair trade.\n\nWitch Doctor Jin'Zil",
  replies = {
    { id = "rash", text = "What did you put on that goblin? I'd like the recipe.", fx = { affinity = 1, letter = "ho_jinzil_2" } },
    { id = "free", text = "Let the spirits in those cages go, Jin'Zil. They've told you enough.", fx = { npcFlag = { set = "ho_jinzil_free" } } },
    { id = "trade", text = "A fair trade. I'll come hungry and I won't ask.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "ho_jinzil_2", npc = "jinzil", delay = 4800,
  subject = "Da recipe",
  body = "{name},\n\nYou want Jin'Zil's recipe, mon, and Jin'Zil laughed so loud da cages rattled. Da recipe be simple. You take one goblin who knock on de wrong door, and you smile at him, and you hand him a cup of somethin' warm, and you tell him it be good for da lungs.\n\nDe rest Jin'Zil keep to himself, because a witch doctor who give away all his secrets be just a troll with a pot.\n\nBut Jin'Zil like you for asking. Most folk ask what be in da cages. You ask what be in da cup, and dat be a much better question.\n\nWitch Doctor Jin'Zil",
}

P:Letter {
  id = "ho_seereth", npc = "seereth", random = true, when = { faction = "Horde", minLevel = 22 },
  subject = "The scream under the wind",
  body = "{name},\n\nI wrote to you once before in my head, many times, and never on paper, so this is the first. I still do not sleep the whole night through. The spirits of Stonetalon still cry out where the goblins' machines cut the mountain, but the cry is thinner now, as though something has been taken off their chests.\n\nMagatha's answer came back from Elder Rise. She said a great deal and told me very little, as is her way, and I have read it so many times the ink has faded where my thumb holds it.\n\nIf you pass Sun Rock, sit with me at the edge of the retreat at dusk, and listen. Perhaps you will hear nothing. Perhaps that is better.\n\nSeereth Stonebreak, Sun Rock Retreat",
  replies = {
    { id = "sit", text = "I'll sit with you at dusk, Seereth, and listen as long as you need.", fx = { affinity = 1 } },
    { id = "magatha", text = "Be careful with Magatha. Her wisdom always comes with a price.", fx = { opinion = { grimtotem = "distrust" } } },
    { id = "shaman", text = "I hear it too. The earth is wounded, but it is healing.", when = { class = "SHAMAN" }, fx = { affinity = 1, opinion = { the_elements = "respect" } } },
  },
}

P:Letter {
  id = "ho_senani", npc = "senani", random = true, when = { faction = "Horde", minLevel = 20 },
  subject = "Colours in Ashenvale",
  body = "{name},\n\nThe leaves along the Falfarren have begun to turn, gold and then red, and in the mornings the mist lies so thick between the trees that the Warsong cannot see what they are cutting. I have taken to walking out before the axes start, just to see the forest as it was meant to be seen.\n\nThe night elves shot at me last week. They missed, and I do not think they meant to hit me, and I do not blame them either way. If someone came to Mulgore and began cutting down the grass, I might shoot at them too.\n\nI know where I stand. I stand with the Horde. But I wanted to tell someone that it was beautiful this morning, and you seemed like someone who would understand.\n\nSenani Thunderheart, Splintertree Post",
  replies = {
    { id = "understand", text = "I understand. Tell me more about the forest when you can.", fx = { affinity = 1, letter = "ho_senani_2", opinion = { ashenvale = "compromise" } } },
    { id = "lumber", text = "The Horde needs that lumber. Beauty doesn't build Orgrimmar.", fx = { affinity = -1, opinion = { ashenvale = "necessary" } } },
    { id = "careful", text = "Stop walking out alone, Senani. Next time they won't miss.", fx = { npcFlag = { set = "ho_senani_warned" } } },
    { id = "tauren", text = "The Earth Mother made this forest too. We should tread lightly here.", when = { race = "Tauren" }, fx = { affinity = 1, opinion = { earth_mother = "faith" } } },
  },
}

P:Letter {
  id = "ho_senani_2", npc = "senani", delay = 5400,
  subject = "The old tree",
  body = "{name},\n\nYou asked me to tell you more, and I was so pleased that I walked further than I should have. East of the camp, past where the Warsong have marked the trees for cutting, there is an old oak so wide that four tauren could not ring it with their arms. Its roots are covered in moss, and something has been leaving acorns in a little circle at its foot.\n\nI think a dryad tends it. I did not see her. I left a strip of dried kodo meat beside the acorns, which was foolish, because dryads do not eat kodo, but it was all I had.\n\nThe tree has a Warsong mark on it, a slash of red paint. I have not decided what to do about that, and I would like to know what you think.\n\nSenani Thunderheart",
  replies = {
    { id = "scrub", text = "Scrub the mark off. One tree won't starve the Horde.", fx = { affinity = 1, letter = "ho_senani_3", npcFlag = { set = "ho_oak_spared" } } },
    { id = "leave", text = "Leave the mark. It's not your choice to make, Senani.", fx = { npcFlag = { set = "ho_oak_marked" } } },
  },
}

P:Letter {
  id = "ho_senani_3", npc = "senani", delay = 7200,
  subject = "Acorns",
  body = "{name},\n\nI scrubbed the paint off the old oak with sand and river water, and it took me most of a night, and nobody in Splintertree noticed. The foreman counts the marks on his map, not on the trees, and I have learned that a map can be wrong without anyone being the wiser.\n\nWhen I went back two days later, the kodo meat was gone and there were twice as many acorns in the circle. I do not know if that was thanks, or a squirrel, or the forest laughing at me. I have decided it was thanks.\n\nI will not tell you I was right to do it. I will tell you I slept well afterwards, which I have not done since I came to Ashenvale.\n\nSenani Thunderheart",
}

P:Letter {
  id = "ho_kuraybin", npc = "kuraybin", random = true, when = { faction = "Horde", minLevel = 22 },
  subject = "Back to da wall",
  body = "{name},\n\nKuray'bin here, still standing where da paths run into Splintertree, still with my back to a tree. Da elf runners come through less now. I think dey learned where I wait, which mean I gotta find a new place to wait, which mean I gotta walk, which I don't like.\n\nMastok counted da wagons again yesterday and said we be short of everything except arrows in da walls. Senani say da forest be pretty dis time of year. Both of dem be right, and dat be the trouble with Ashenvale, mon.\n\nYou come back, bring something to eat dat ain't bark stew. I be owing you, and I don't like owing.\n\nKuray'bin, Splintertree Post",
  replies = {
    { id = "food", text = "I'll bring proper food, Kuray'bin. No bark, I promise.", fx = { affinity = 1 } },
    { id = "patience", text = "Find the new place and wait there. Patience wins in these woods.", fx = { npcFlag = { set = "ho_kuraybin_patience" } } },
    { id = "cousin", text = "Hold the path, cousin. The Darkspear keep their debts.", when = { race = "Troll" }, fx = { affinity = 1, opinion = { darkspear = "loyal" } } },
  },
}

---------------------------------------------------------------------------
-- Thousand Needles and Desolace
---------------------------------------------------------------------------
P:Letter {
  id = "ho_hagar", npc = "hagar", random = true, when = { faction = "Horde", minLevel = 26 },
  subject = "About the egg",
  body = "{name},\n\nI have to tell somebody, and you were patient with me once, so it may as well be you. The egg is warm. I keep it wrapped in three blankets beside the fire at Freewind, and when I put my ear to the shell I can hear something inside it scratching, very quietly, as though it is trying to be polite.\n\nThe braves say it might be a wind serpent, or a thunder lizard, or nothing at all, and that the scratching is only the shell cooling. The braves have never put their ears to it, so I do not see why they get an opinion.\n\nIf it hatches, I would like a witness. If it hatches into something that eats me, I would like a witness even more.\n\nHagar Lightninghoof, Freewind Post",
  replies = {
    { id = "witness", text = "I'll be your witness, Hagar. Write when it starts to crack.", fx = { affinity = 1, letter = "ho_hagar_2" } },
    { id = "warn", text = "Keep a spear near the blankets. Just in case.", fx = { npcFlag = { set = "ho_egg_spear" } } },
    { id = "braves", text = "The braves are probably right. It's only the shell cooling.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "ho_hagar_2", npc = "hagar", delay = 6000,
  subject = "It cracked!",
  body = "{name},\n\nIt cracked! You were not here, which I forgive you for, because the mail is slow and eggs are not. It happened just after An'she rose, with a sound like a stick snapping, and out came a very small, very wet, very angry wind serpent, no longer than my forearm.\n\nIt bit me. I had expected that. Then it climbed into my lap and went to sleep, which I had not expected at all, and now I cannot get up without waking it, and I am writing this letter on my knee.\n\nThe braves have stopped saying it was the shell cooling. I have not said anything to them about it, because I am above that, but I have looked at them meaningfully several times.\n\nHagar Lightninghoof, Freewind Post",
  replies = {
    { id = "name", text = "Congratulations, Hagar. What will you name it?", fx = { affinity = 1 } },
    { id = "wild", text = "Let it fly free when it's grown. It belongs to the sky.", fx = { npcFlag = { set = "ho_serpent_free" } } },
  },
}

P:Letter {
  id = "ho_rau", npc = "rau", random = true, when = { faction = "Horde", minLevel = 26 },
  subject = "A question about carvings",
  body = "{name},\n\nForgive me, I know I already asked you too many questions when you were here, but I've had a dozen more since. The centaur carvings near the Darkcloud Pinnacle show a figure with four legs and a great many arms reaching down from the sky, and below it a line of smaller figures carrying something round and glowing.\n\nThe Galak say it is a story about their first chieftain. The Grimtotem say it is a curse. The goblins in the Shimmering Flats say it would look better on a lunchbox. I have no idea which of them is right, and I would like very much to know what you think.\n\nYou don't need to be a scholar. You only need to have looked at it, and I know you have.\n\nRau Cliffrunner, Freewind Post",
  replies = {
    { id = "chieftain", text = "It's the Galak's chieftain. The round thing is their first fire.", fx = { affinity = 1, letter = "ho_rau_2", npcFlag = { set = "ho_rau_fire" } } },
    { id = "curse", text = "The Grimtotem are right for once. Leave that carving alone, Rau.", fx = { npcFlag = { set = "ho_rau_curse" } } },
    { id = "lunchbox", text = "Honestly? I agree with the goblins about the lunchbox.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "ho_rau_2", npc = "rau", delay = 5400,
  subject = "The first fire",
  body = "{name},\n\nYou said the round thing was their first fire, and I have not stopped thinking about it. I went back out to the carving with a lamp and a brush and cleaned the lichen off the lower edge, and there, under the line of smaller figures, is a row of little marks I had always taken for cracks. They are flames, dozens of them, each one smaller than the last.\n\nThe centaur keep a fire that never goes out. If you are right, they have been carrying it a very long way, and the carving is a record of every time it nearly died.\n\nI have written your name in the margin of my notes, beside the drawing. I hope you don't mind. It is the only part of the page I am certain of.\n\nRau Cliffrunner, Freewind Post",
}

P:Letter {
  id = "ho_takata", npc = "takata", random = true, when = { faction = "Horde", minLevel = 32 },
  subject = "Thunder Axe Fortress",
  body = "{name},\n\nThe Burning Blade have filled Thunder Axe Fortress again. We burned them out in the spring, and by summer they had crept back in through the old tunnels, and now they chant on the walls at night loud enough that the kodos at Shadowprey will not sleep.\n\nMaurin says he knows a way to break their wards faster, and I say that a man who knows the Blade's magic that well should be watched. We argue about it every night. It passes the time.\n\nIf you come back to Desolace, come to fight. I have no use for anyone who comes to look at the scenery, and in Desolace there is none.\n\nTakata Steelblade, Shadowprey Village",
  replies = {
    { id = "fight", text = "I'll come to fight, Takata. Save me a wall.", fx = { affinity = 1 } },
    { id = "maurin", text = "Use Maurin's way. Every weapon counts against the Blade.", fx = { npcFlag = { set = "ho_takata_maurin" } } },
    { id = "watch", text = "You're right to watch Maurin. That magic corrupts whoever touches it.", fx = { opinion = { burning_legion = "hate" } } },
  },
}

---------------------------------------------------------------------------
-- Hillsbrad and Arathi
---------------------------------------------------------------------------
P:Letter {
  id = "ho_darthalia", npc = "darthalia", random = true, when = { faction = "Horde", minLevel = 24 },
  subject = "From the Southshore line",
  body = "{name},\n\nThe line south of Tarren Mill holds. The humans in Southshore have reinforced their walls and doubled the watch on the road, which means they are afraid, and fear in the living is a resource I spend carefully.\n\nI am told you have not been seen at the Mill in some time. I will not pretend I noticed your absence personally, but the deathguard who keep the gate tally mentioned it, and I have learned to take their tallies seriously.\n\nThe front is patient. It will still be here when you return, and so will I, which is one of the few advantages of being dead.\n\nHigh Executor Darthalia, Tarren Mill",
  replies = {
    { id = "return", text = "I'll return to the line soon, High Executor. Hold it until then.", fx = { affinity = 1 } },
    { id = "peace", text = "There's more to Hillsbrad than a front. The farmers aren't soldiers.", fx = { affinity = -1, opinion = { alliance = "pity" } } },
    { id = "dead", text = "Being dead has its advantages. I'm learning them myself.", when = { race = "Scourge" }, fx = { affinity = 1, opinion = { forsaken = "trust" } } },
  },
}

P:Letter {
  id = "ho_lydon", npc = "lydon", random = true, when = { faction = "Horde", minLevel = 26 },
  subject = "Umpi",
  body = "{name},\n\nYou may remember Umpi, my frog. She died again on Tuesday. I brought her back on Wednesday, and she seems no worse for it, though she now hops to the left, which she never did before, and I can't decide if I've improved her or ruined her.\n\nThe Society sent a new shipment of reagents from the Undercity. Half of it arrived broken, and the other half arrived in a crate marked with someone else's name, so I opened it anyway, and now I have a great deal of powdered bat and no idea what it is for.\n\nI'd say I miss your visits. I don't miss anything, really. But I notice when they stop, and that's very nearly the same.\n\nApothecary Lydon, Tarren Mill",
  replies = {
    { id = "umpi", text = "Give Umpi my regards. Hopping left suits her, I think.", fx = { affinity = 1, letter = "ho_lydon_2" } },
    { id = "bat", text = "Send the powdered bat back. It's someone else's, Lydon.", fx = { npcFlag = { set = "ho_lydon_honest" } } },
    { id = "cruel", text = "Let the frog stay dead. She's earned her rest.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "ho_lydon_2", npc = "lydon", delay = 4800,
  subject = "Umpi thanks you",
  body = "{name},\n\nI passed on your regards to Umpi. She hopped to the left three times and then sat on the powdered bat, which I have decided to interpret as gratitude, because it is better than the alternative.\n\nYou are the first person to say anything kind about her. The deathguard call her the thing in the jar, and Darthalia calls her a waste of reagents, and none of them has ever asked how she was. I find I liked being asked, which is unsettling, and I will need to sit with it a while.\n\nShe is in the jar again now. It is her favourite jar. She'll be fine.\n\nApothecary Lydon",
}

P:Letter {
  id = "ho_gormul", npc = "gormul", delay = 3000,
  when = { race = "Orc", minLevel = 30, faction = "Horde" },
  subject = "From Hammerfall",
  body = "{name},\n\nWhen you came through Hammerfall, I asked whether you had been in the camps, and I never told you about mine. I was in this valley, behind a fence a short walk from where Hammerfall stands now, and I learned to carry stone for the humans and keep my eyes on the mud.\n\nWe built Hammerfall out of the same stone. Some nights I lie awake and wonder if I carried any of it twice, once for them and once for us, and I think that is the kind of thought that would have made Grom laugh.\n\nI am not one for letters. But you walk free and proud, and when I see that I remember why we broke the fences, and I wanted you to know that it is worth remembering.\n\nGor'mul, Hammerfall",
  replies = {
    { id = "remember", text = "I'll remember the fences, Gor'mul, and why they fell.", fx = { affinity = 1, opinion = { internment = "hate" } } },
    { id = "forward", text = "Leave the camps behind. The Horde is stronger looking forward.", fx = { npcFlag = { set = "ho_gormul_forward" } } },
    { id = "camp", text = "I was behind those fences too. We carry it together.", when = { origin = "orc_camp_born" }, fx = { affinity = 1, npcFlag = { set = "ho_gormul_campkin" } } },
  },
}

---------------------------------------------------------------------------
-- Badlands and Swamp of Sorrows
---------------------------------------------------------------------------
P:Letter {
  id = "ho_neeka", npc = "neeka", random = true, when = { faction = "Horde", minLevel = 36 },
  subject = "Watch your back trail",
  body = "{name},\n\nMy scouts found tracks behind Kargath last week, boots and not paws, coming down from the Dustbelch side and stopping just short of the gate. Somebody was watching us. The Dark Iron, maybe, or the Blackrock come to count our spears. Whoever it was, they left before my scouts reached them, and that bothers me more than if they had stayed.\n\nI am writing to every fighter who has passed through here and walked out again, because a scout who does not share what she knows is just someone hiding in the rocks.\n\nWatch your back trail. The Badlands are patient, and so is whatever is out there.\n\nNeeka Bloodscar, Kargath",
  replies = {
    { id = "thanks", text = "Thanks for the warning, Neeka. I'll watch the back trail.", fx = { affinity = 1 } },
    { id = "hunt", text = "Send me after them next time. I'll find whoever it was.", fx = { npcFlag = { set = "ho_neeka_hunter" } } },
    { id = "rogue", text = "Boots that stop short of a gate are a rogue's habit. Check the rooftops.", when = { class = "ROGUE" }, fx = { affinity = 1, npcFlag = { set = "ho_neeka_rogue_tip" } } },
  },
}

P:Letter {
  id = "ho_thaltrak", npc = "thaltrak", random = true, when = { faction = "Horde", minLevel = 36 },
  subject = "Still on the wall",
  body = "{name},\n\nThal'trak still be standing on da wall at Kargath, and da road still be empty. Some nights I think I see Sha'ni's platoon coming in from da east, all of dem singing, and then da wind move da dust and it be nothing but rocks.\n\nDa Warlord say I can't leave my post, and I know he be right, because a soldier who run off after one lost platoon just make two lost platoons. But knowing a thing and liking it be different, mon.\n\nYou travel far. If you hear any word of Darkspear soldiers in da east, by da Burning Steppes or da mountain, you write to me, even if it be bad word. Bad word be better than dis waiting.\n\nThal'trak Proudtusk, Kargath",
  replies = {
    { id = "ask", text = "I'll ask after Sha'ni's platoon everywhere I go. You have my word.", fx = { affinity = 1, letter = "ho_thaltrak_2" } },
    { id = "orders", text = "Your Warlord is right. Hold the wall and trust Sha'ni.", fx = { npcFlag = { set = "ho_thaltrak_orders" } } },
    { id = "cousin", text = "Hold on, cousin. The loa don't forget a Darkspear on the road.", when = { race = "Troll" }, fx = { affinity = 1, opinion = { darkspear = "loyal" } } },
  },
}

P:Letter {
  id = "ho_thaltrak_2", npc = "thaltrak", delay = 7200,
  subject = "Your word",
  body = "{name},\n\nYou give me your word, and I been carrying it around in my chest like a warm stone, mon. Nothing come down da road yet. But a scout from da Steppes say he saw a troll war banner on a ridge near da Altar of Storms, old and torn, and nobody near it.\n\nMaybe it be hers. Maybe it be any troll who walk that way. I tell myself both, one in da morning and one at night, so dey balance.\n\nKeep asking for me. When she come home, and I say when, you be the first I tell, before da Warlord even.\n\nThal'trak Proudtusk, Kargath",
  replies = {
    { id = "keep", text = "I'll keep asking, Thal'trak. Keep that warm stone close.", fx = { affinity = 1 } },
    { id = "banner", text = "I'll go and look at that banner myself.", fx = { npcFlag = { set = "ho_thaltrak_banner" } } },
  },
}

P:Letter {
  id = "ho_ruag", npc = "ruag", random = true, when = { faction = "Horde", minLevel = 38 },
  subject = "Roster, Stonard",
  body = "{name},\n\nI keep a roster of everyone I have sent into the swamp. Most of the names have a mark beside them, and the marks mean what you would expect. Yours has none, so I am writing to make sure that is still true and not just slow news.\n\nThe swamp has been bad this season. The Fallen Hero still walks by the road, the Temple of Atal'Hakkar breathes out green mist at night, and the stones near the Portal stay cold, though I have had my scouts check them every week since the fall.\n\nIf you are alive, write it on the back of this and send it to Stonard. I would rather cross out a mark than add one.\n\nDispatch Commander Ruag, Stonard",
  replies = {
    { id = "alive", text = "Alive and still walking, Commander. Leave my name unmarked.", fx = { affinity = 1 } },
    { id = "send", text = "Alive, and ready for the next place you'd send me.", fx = { npcFlag = { set = "ho_ruag_ready" } } },
    { id = "stones", text = "Keep checking those stones. The Portal is quiet, but not dead.", fx = { npcFlag = { set = "ho_ruag_portal" } } },
  },
}

---------------------------------------------------------------------------
-- Stranglethorn (Grom'gol) and Feralas (Camp Mojache)
---------------------------------------------------------------------------
P:Letter {
  id = "ho_mokthardin", npc = "mokthardin", random = true, when = { faction = "Horde", minLevel = 34 },
  subject = "The spirits at Grom'gol",
  body = "{name},\n\nThe spirits of the jungle speak loudly at Grom'gol, louder than they ever did in Durotar, and some nights I sit at the edge of the camp and simply listen. They are angry about many things. The trolls who carve up their own dead, the goblins who sell anything, the humans who hunt for sport. But they are not angry with us tonight, and I wanted to write that down somewhere.\n\nI was young when Gul'dan's warlocks turned our shamans from the spirits, and for a generation the elements did not answer us at all. Now I hear them every night, and I do not take a single word for granted.\n\nYou have walked through this camp with good intent. The spirits noticed. So did I.\n\nFar Seer Mok'thardin, Grom'gol Base Camp",
  replies = {
    { id = "listen", text = "Keep listening, Far Seer. Some of us are still learning how.", fx = { affinity = 1, opinion = { the_elements = "respect" } } },
    { id = "trolls", text = "Tell me more of what they say about the jungle trolls.", fx = { npcFlag = { set = "ho_mokthardin_trolls" } } },
    { id = "warlock", text = "Not every warlock is Gul'dan, Far Seer. I keep my own counsel.", when = { class = "WARLOCK" }, fx = { npcFlag = { set = "ho_mokthardin_lock" } } },
  },
}

P:Letter {
  id = "ho_nimboya", npc = "nimboya", random = true, when = { faction = "Horde", minLevel = 34 },
  subject = "Da chief's son",
  body = "{name},\n\nNimboya don't write letters, so you know dis be important. Kin'weelay and me, we found more of da Bloodscalp paths through da jungle, de ones you helped us find, and dey lead further north than we think. Da chief's son be out dere still, maybe, or maybe his bones. Da spirits won't say which.\n\nKin'weelay say be patient. Kin'weelay always say be patient, because Kin'weelay sit in da camp with his scrolls while Nimboya walk da paths.\n\nYou be useful before. Maybe you be useful again. If you got da time, come to Grom'gol, and if you don't, then at least tell Nimboya you still be alive.\n\nNimboya, Grom'gol",
  replies = {
    { id = "help", text = "I'll come to Grom'gol and help you follow those paths north.", fx = { affinity = 1, letter = "ho_nimboya_2" } },
    { id = "alive", text = "Still alive, Nimboya. I hope you find the boy.", fx = { affinity = 1 } },
    { id = "no", text = "The chief's son is your burden, not mine.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "ho_nimboya_2", npc = "nimboya", delay = 6000,
  subject = "Da paths",
  body = "{name},\n\nYou say you come, and dat be enough for Nimboya. I already walk da first of da northern paths while I wait, and it go past da old ruins where de Bloodscalp leave their offerings. I find a little carved bead dere, Darkspear work, da kind da chief give to his son when da boy was small.\n\nKin'weelay say it prove nothing. Nimboya say it prove da boy walk dis way, and dat be something.\n\nWhen you come, we go together. Two be harder to take than one, even for da Bloodscalp.\n\nNimboya",
}

P:Letter {
  id = "ho_uzeri", npc = "uzeri", random = true, when = { faction = "Horde", minLevel = 42 },
  subject = "Muisek",
  body = "{name},\n\nUzer'i be writing from Camp Mojache, where da rain don't stop and da tauren don't mind, which tell you everything about tauren. Da muisek vessels you helped fill be doing good work, mon. Da beasts' spirits make strong weapons, and da braves who carry dem fight harder than any before.\n\nDa tauren elders still look at Uzer'i sideways when I pass. Dey say a spirit should go back to da Earth Mother, not into a spear. Uzer'i say da spirit don't complain, and dat be good enough for a witch doctor.\n\nIf you come back to Feralas, Uzer'i got more vessels and more ideas. Bring da strong arm, and leave da questions at da gate.\n\nWitch Doctor Uzer'i, Camp Mojache",
  replies = {
    { id = "more", text = "Fill me another vessel, Uzer'i. I'll bring the strong arm.", fx = { affinity = 1, opinion = { darkspear = "respect" } } },
    { id = "elders", text = "The elders have a point. A spirit isn't a spearhead.", fx = { affinity = -1, opinion = { earth_mother = "respect" } } },
    { id = "shrug", text = "If the weapons work, the rest is between you and the spirits.", fx = { npcFlag = { set = "ho_uzeri_shrug" } } },
  },
}

P:Letter {
  id = "ho_hadoken", npc = "hadoken", random = true, when = { faction = "Horde", minLevel = 42 },
  subject = "Rain at Mojache",
  body = "{name},\n\nThe rain has not stopped in nine days, and the gordunni have taken it as a sign that the Earth Mother favours them, because they are ogres and every sign favours them. They came down from the hills twice this month. Both times the braves held the line, and both times the shamans behind the ogres' front rank were the ones who fell first.\n\nI watched how you fought the gordunni when you were here, straight through their line to the ones throwing fire. I taught it to the young hunters as though it were my own idea, and I am telling you so, because a hunter who steals another's kill should at least confess it.\n\nThe winds said you were well. I am glad to hear it from them, and I would be gladder to hear it from you.\n\nHadoken Swiftstrider, Camp Mojache",
  replies = {
    { id = "well", text = "I'm well, Hadoken, and the trick is yours to keep.", fx = { affinity = 1 } },
    { id = "line", text = "A line holds better than lone heroes. Tell them that as well.", fx = { npcFlag = { set = "ho_hadoken_line" } } },
  },
}
