-- Origin letters: Orc. Two per origin (an early word from home, a later one on a milestone).
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Born in a human internment camp
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_camp_born_1", from = "Mograsha", stranger = true, delay = 1200,
  when = { origin = "orc_camp_born", minLevel = 6 },
  subject = "From your mother",
  body = "{name},\n\nThe scribe in Razor Hill is a young troll who laughs at my spelling, so I am telling him what to write and he is writing it, and if any words are wrong you will know whose fault it is.\n\nYour father still sleeps with his boots on, as he did behind the fence, in case the guards come in the night. I tell him there are no guards in Durotar, only scorpids and the wind, and he says the wind is bad enough. The goats ate the last of my squash, but the roof held through the dust storm, so I am counting that as a good month.\n\nYou were born where nobody chose anything, and now you choose every road you walk. Choose well, and send word when you can.\n\nYour mother, Mograsha",
}

P:Letter {
  id = "origin_orc_camp_born_2", from = "Grushak", stranger = true, delay = 2400,
  when = { origin = "orc_camp_born", minLevel = 30 },
  subject = "Your father writes",
  body = "{name},\n\nI do not write much, and your mother says my letters look like a raptor walked through ink. But the grunts at Razor Hill talk about you now, and one of them asked me if I was proud, and I did not have an answer ready, so I am writing one.\n\nIn the camp I watched the guards beat a young orc for looking at the sky too long. I swore that no child of mine would learn to keep his eyes on the mud. You have not. You walk where you please and the Horde knows your name.\n\nI am proud. There, it is written down, and I will not say it twice.\n\nGrushak",
}

---------------------------------------------------------------------------
-- Frostwolf from the Alterac valleys
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_frostwolf_1", from = "Grandmother Ulagra", stranger = true, delay = 1200,
  when = { origin = "orc_frostwolf", minLevel = 6 },
  subject = "Snow in the valley",
  body = "Little wolf,\n\nA trader carried this south for two strips of dried ram and a promise that you would not let it rot in a mailbox. The snow came early to Frostwolf Keep this year, and the pups born in the spring are already as tall as your knee was when you left.\n\nThe Stormpike dwarves are digging deeper into the valley than they have any right to, and the young ones talk of driving them out before the thaw. Drek'Thar tells them to be patient, and they listen to him, mostly.\n\nYou went south to the hot country to serve the Warchief, and I am glad of it, but do not let the sun burn the old ways out of you. Speak to the spirits each night, even if they answer in a strange accent down there.\n\nGrandmother Ulagra",
}

P:Letter {
  id = "origin_orc_frostwolf_2", from = "Grandmother Ulagra", stranger = true, delay = 2400,
  when = { origin = "orc_frostwolf", minLevel = 30 },
  subject = "The wolves know",
  body = "Little wolf,\n\nYour old wolf Snowpaw has taken to sitting at the gate at dusk and looking south, which she never did before. The handlers say she is getting old and foolish, but I think she knows something they do not, and I think it is about you.\n\nTraders tell us your name is spoken in the Barrens and beyond. I hope you carry it the way a Frostwolf should, with clean hands and no blood in your cup, because there are orcs in the south who remember the demon's drink fondly, and you must never be one of them.\n\nThe valley is cold and the fires are warm. When the Warchief can spare you, come and sit by one.\n\nGrandmother Ulagra",
}

---------------------------------------------------------------------------
-- Kin of the Warsong clan
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_warsong_kin_1", from = "Durzak", stranger = true, delay = 1200,
  when = { origin = "orc_warsong_kin", minLevel = 6 },
  subject = "Still standing at Splintertree",
  body = "{name},\n\nYou left the lumber camps and the rest of us are still dodging arrows, so I hope whatever you are doing is worth it. The night elves put three shafts through the cook's tent last week, and now he serves the stew with a shield on his back, which makes it taste no better.\n\nKrolg lost two fingers to a falling ironwood, and he says he can still swing an axe, so we let him believe it. The trees here are older than anything I have seen, and some nights I think they are listening to us.\n\nThe Warsong do not wait, and you were never good at it either. Go and make some noise out there, and do it loud enough that we can hear it in Ashenvale.\n\nDurzak, Splintertree Post",
}

P:Letter {
  id = "origin_orc_warsong_kin_2", from = "Durzak", stranger = true, delay = 2400,
  when = { origin = "orc_warsong_kin", cleared = "Blackfathom Deeps" },
  subject = "The drowned temple",
  body = "{name},\n\nA runner from Zoram'gar came up the road with news that someone cleaned the cultists out of Blackfathom Deeps, and when he said your name half the camp started shouting and the other half claimed they had taught you to swing an axe.\n\nThe night elves thought that temple was theirs, and the Twilight's Hammer thought it was theirs, and now it belongs to the fish. That is a fine joke, and we have been telling it all evening.\n\nYou are Warsong to the bone, {name}, and you went into the dark water without waiting for anyone to give you leave. Hellscream himself would have liked that. Lok'tar.\n\nDurzak, Splintertree Post",
}

---------------------------------------------------------------------------
-- Grunt of the Razor Hill watch
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_razor_hill_grunt_1", from = "Sergeant Kragga", stranger = true, delay = 1200,
  when = { origin = "orc_razor_hill_grunt", minLevel = 6 },
  subject = "Watch report",
  body = "Grunt {name},\n\nYour old post on the north wall is now held by a young orc named Torg, who falls asleep standing up and once challenged a tumbleweed. I am telling you this so you understand how badly you are missed.\n\nThe Kul Tirans at Tiragarde Keep sent a boat down the coast last week, and we sent it back with fewer sailors. Gar'Thok says it was a good morning's work, though he says that about most mornings that end in blood.\n\nYou went off to fight in wider places, and I signed the paper without complaint. Keep your axe sharp, keep your shield up, and do not forget that you learned both on this wall.\n\nSergeant Kragga, Razor Hill",
}

P:Letter {
  id = "origin_orc_razor_hill_grunt_2", from = "Sergeant Kragga", stranger = true, delay = 2400,
  when = { origin = "orc_razor_hill_grunt", minLevel = 30 },
  subject = "Torg sends his respects",
  body = "{name},\n\nThe stories about you reach the barracks faster than the supply carts, and the young grunts have started asking me whether you were really once a recruit on this wall. I tell them you were, and that you dropped your axe on your own foot in the first week, because a hero should not get too proud.\n\nTorg is awake now, most of the time. He stopped a Burning Blade cultist sneaking past the gate last month, and he said he did it because he wanted to be like you.\n\nThat is what the Horde is for, {name}, as you learned on the coast. One warrior teaches the next by doing, and you are doing it well. Lok'tar ogar.\n\nSergeant Kragga, Razor Hill",
}

---------------------------------------------------------------------------
-- Student of the Warchief's shamans
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_thrall_shaman_1", from = "Elder Gorvash", stranger = true, delay = 1200,
  when = { origin = "orc_thrall_shaman", minLevel = 6 },
  subject = "From the Valley of Wisdom",
  body = "Young one,\n\nThe fire in my lodge burned blue three nights ago, and I took it as a sign to write to you. Perhaps it was only bad wood, but at my age I take my signs where I find them.\n\nThe new students are louder than you were and listen less. One of them tried to call the wind indoors and blew my good bowl off the shelf, and the wind did not apologize, which tells you something about the wind.\n\nRemember that the elements are not servants. You ask, you listen, and you thank them, even when they give you less than you asked for. Our people forgot that once, and the whole world paid for it. You are out among the spirits now, so be polite.\n\nElder Gorvash, Orgrimmar",
}

P:Letter {
  id = "origin_orc_thrall_shaman_2", from = "Elder Gorvash", stranger = true, delay = 2400,
  when = { origin = "orc_thrall_shaman", cleared = "Uldaman" },
  subject = "The deep stone",
  body = "Young one,\n\nThe earth spoke to me while I slept, which it seldom does, and it spoke of a deep place under the Badlands where old stone had woken and then grown still again. When the traders brought your name from Kargath, I understood what I had heard.\n\nI do not know what you found in Uldaman, and perhaps I should not ask. The earth was there before our people, and before the dwarves, and it keeps its own counsel. But it did not sound angry, only tired, the way a mountain is tired.\n\nThe elements have not finished deciding whether to forgive us. I think they have started to forgive you, and that is a beginning.\n\nElder Gorvash, Orgrimmar",
}

---------------------------------------------------------------------------
-- Initiate of the Cleft of Shadow
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_cleft_initiate_1", from = "Zurga", stranger = true, delay = 1200,
  when = { origin = "orc_cleft_initiate", minLevel = 6 },
  subject = "Gossip from below",
  body = "{name},\n\nYou left the Cleft without saying goodbye, and I was offended until I remembered that warlocks are not supposed to have feelings, so I have put mine in a jar.\n\nThe Shadowdeep is as damp as ever. Someone summoned an imp in the reading room last week and it set fire to three books before anyone could banish it, and the masters are still arguing over whose fault it was. The grunts at the top of the stair look at us the way they always do, as if we might grow horns at any moment.\n\nI hear you are out in the world now, using what we learned down here. Be careful whom you show it to. Not everyone in the Horde is as forgiving as the Warchief, and he is not very forgiving either.\n\nZurga, of the Cleft",
}

P:Letter {
  id = "origin_orc_cleft_initiate_2", from = "Zurga", stranger = true, delay = 2400,
  when = { origin = "orc_cleft_initiate", minLevel = 30 },
  subject = "They say your name down here",
  body = "{name},\n\nThe older warlocks in the Cleft have started using your name as a lesson, and I cannot decide whether it is a compliment. Half of them say you prove our craft can serve the Horde, and the other half say you are going to get yourself eaten by something with too many teeth.\n\nI told them I studied beside you, which made me briefly interesting, and then the imp ate my lunch, which made me less interesting again.\n\nPower is power, as you used to say. I still believe it, but I have started to think it matters a great deal who holds it, and I am glad that some of it is in your hands. Do not let it go to your head, or your eyes will start glowing at dinner.\n\nZurga, of the Cleft",
}

---------------------------------------------------------------------------
-- Self-taught from a guard's primer
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_camp_primer_1", from = "Nogra", stranger = true, delay = 1200,
  when = { origin = "orc_camp_primer", minLevel = 6 },
  subject = "I can write now",
  body = "{name},\n\nYou always said that if you could teach yourself letters from a human's book, any of us could. So I tried, and this is the first letter I have ever written, and it has taken me four evenings and most of a candle.\n\nI found an old copy of the same primer in a goblin's junk cart at the Crossroads. It has the same picture of a duck on the first page, and I laughed so hard the goblin charged me double.\n\nThe camp is gone and we are free, but some nights I still count the fence posts in my sleep. I hope you sleep better than I do. I hope the books you found after the primer are kind to you, though I know some of them are not.\n\nNogra, in Razor Hill",
}

P:Letter {
  id = "origin_orc_camp_primer_2", from = "Nogra", stranger = true, delay = 2400,
  when = { origin = "orc_camp_primer", cleared = "Shadowfang Keep" },
  subject = "The human wizard",
  body = "{name},\n\nThe Forsaken courier who carries the mail to Razor Hill says you killed a human wizard in a castle full of wolves, and that he was the kind of wizard who reads too many books and goes mad from them. I laughed, and then I thought about it for a long time.\n\nYou read the same books he did, or ones like them. I worried, after you left, that the fire would get into you the way the green fire got into our grandfathers. Now I think the difference is that you remember the camp fence and what it taught us, and he never had one to remember.\n\nI have finished the primer and started on a book of Horde laws. It is very dull, and I am very proud of myself.\n\nNogra, in Razor Hill",
}

---------------------------------------------------------------------------
-- Veteran of Doomhammer's Horde
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_doomhammer_veteran_1", from = "Old Brakk", stranger = true, delay = 1200,
  when = { origin = "orc_doomhammer_veteran", minLevel = 6 },
  subject = "From the Drag",
  body = "{name},\n\nI had a young scribe write this because my hand shakes now, and I will not have you thinking it is fear. It is the cold in the old wound from the Hillsbrad foothills, and it only gets worse when it rains, which in Durotar is never, so I have no excuse.\n\nGarm and Haruk and I still sit outside the tavern in the Drag every evening and argue about which of us killed the most knights at the siege of Lordaeron. Haruk lies the most, so he usually wins.\n\nYou went back out into the world with an axe, and I envy you. Fifteen years in the camps took my strength, but you have found yours again, so swing it for all of us who cannot.\n\nBrakk, by the hand of a scribe",
}

P:Letter {
  id = "origin_orc_doomhammer_veteran_2", from = "Old Brakk", stranger = true, delay = 2400,
  when = { origin = "orc_doomhammer_veteran", minLevel = 40 },
  subject = "Haruk lost the argument",
  body = "{name},\n\nThe scribe is the same young one, and he has grown a beard since the last letter, so you can see how slowly an old orc gets around to writing.\n\nWe heard tales of you from a caravan out of the Barrens, and Haruk tried to claim he once taught you how to hold a shield. Garm reminded him that you were swinging at the walls of Lordaeron when Haruk was still learning which end of the axe to grab, and the whole Drag laughed at him.\n\nWe fought for Doomhammer because we believed the Horde could be great. We were wrong about how, and right about the rest. You are proving the rest, {name}, and that is worth more than all our stories.\n\nBrakk, by the hand of a scribe",
}

---------------------------------------------------------------------------
-- Tracker of the Durotar scrub
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_durotar_tracker_1", from = "Varga", stranger = true, delay = 1200,
  when = { origin = "orc_durotar_tracker", minLevel = 6 },
  subject = "Tracks by the river",
  body = "{name},\n\nI am still hunting the Southfury bank since you left, and the raptors have grown bolder without you to keep them honest. One followed me all the way to the gate at Razor Hill and sat there until the guards threw rocks at it.\n\nThe scorpids are thick this season. Rhazzo the cook says that is good, because he likes them roasted, but he does not have to pull them off his boots every morning.\n\nI think of you when I find a clean track in the dust. You were always better at reading the ground than I was, and you were never too proud to tell me so. Hunt well out there, and watch the ground behind you as much as in front.\n\nVarga, Razor Hill",
}

P:Letter {
  id = "origin_orc_durotar_tracker_2", from = "Varga", stranger = true, delay = 2400,
  when = { origin = "orc_durotar_tracker", cleared = "Razorfen Kraul" },
  subject = "The thorn warrens",
  body = "{name},\n\nWord came up from Camp Taurajo that you went into the thorn warrens of the quilboar and came out again, which is more than most hunters can say. I remember when you came home bleeding from a single bramble patch and complained for a week.\n\nThe quilboar have been raiding the caravans on the southern road for as long as I can remember. The tauren say they will be quieter now, and I hope they are right, because the price of salted meat in Razor Hill has been a crime.\n\nYou went from the Valley of Trials to the edge of the Barrens, and now beyond it. Keep going, but do not forget the scrub that taught you to look before you step.\n\nVarga, Razor Hill",
}

---------------------------------------------------------------------------
-- Beastmaster of the Barrens
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_barrens_beastmaster_1", from = "Thrask", stranger = true, delay = 1200,
  when = { origin = "orc_barrens_beastmaster", minLevel = 6 },
  subject = "News from the Crossroads",
  body = "{name},\n\nThe Crossroads is as loud and dusty as you left it. Centaur raided the southern wall again last week, and a kodo got loose in the confusion and walked straight through the inn, and the innkeeper is still sweeping up what was left of her tables.\n\nI am still tending the beasts at the stable post. The lion cub you left behind has grown fat and lazy and sleeps on my bedroll, and she will not move for anyone but you.\n\nThe Barrens taught you to hunt the old way, and I am glad you are out there using it. When the herds move east this season, I will think of you riding with them.\n\nThrask, the Crossroads",
}

P:Letter {
  id = "origin_orc_barrens_beastmaster_2", from = "Thrask", stranger = true, delay = 2400,
  when = { origin = "orc_barrens_beastmaster", cleared = "Wailing Caverns" },
  subject = "The green under the ground",
  body = "{name},\n\nThe tauren who come through the Crossroads say the Wailing Caverns are quieter now, and that the druids who went mad down there will not twist any more beasts into the things we have been shooting off the oasis paths. They say you went down with them.\n\nI have seen the creatures that came up out of those caves, and I would not wish them on any hunter. You went in and came back, which makes you braver or more foolish than I am, and I think it is a little of both.\n\nThe lion cub is still fat and still waiting for you. She chewed through the stable rope last night, and I like to think she was trying to come and find you.\n\nThrask, the Crossroads",
}

---------------------------------------------------------------------------
-- Knife-runner of the Drag
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_drag_runner_1", from = "Hashka", stranger = true, delay = 1200,
  when = { origin = "orc_drag_runner", minLevel = 6 },
  subject = "Business on the Drag",
  body = "Runner,\n\nYou left without collecting from old Dorz, so I collected for you and kept the difference, which I am telling you in writing so you cannot say I cheated you. I did, but now it is honest cheating.\n\nThe guards have started walking the Drag at night, two by two, so the business has moved to the back of the tannery where the smell keeps the honest folk away. Three new kids are running knives now, and none of them know how to keep their mouths shut. I miss you more than I like.\n\nWherever you are, keep your hood up and your purse tight. Not everyone out there owes you money, but everyone out there will try to take it.\n\nHashka, behind the tannery",
}

P:Letter {
  id = "origin_orc_drag_runner_2", from = "Hashka", stranger = true, delay = 2400,
  when = { origin = "orc_drag_runner", minLevel = 20 },
  subject = "You are expensive now",
  body = "Runner,\n\nYour name has started showing up in conversations I am paid to listen to, and I want you to know how strange that is. A merchant from Ratchet asked me last week whether you could be hired, and I told him you were too expensive, which was a lie, but I have my pride on your behalf.\n\nDorz paid up, by the way. He heard what you have been doing out there and decided he would rather not owe money to someone who kills things for the Horde. You did not even have to come back, which is the best kind of collection.\n\nThe Drag misses you, which means I do. Do not let it go to your head.\n\nHashka, behind the tannery",
}

---------------------------------------------------------------------------
-- Hunter of Burning Blade cultists
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_blade_hunter_1", from = "Shadow-Eye Gruul", stranger = true, delay = 1200,
  when = { origin = "orc_blade_hunter", minLevel = 6 },
  subject = "The caves are not empty",
  body = "{name},\n\nYou left the hunt, and I do not blame you, but the Burning Blade did not leave with you. We found a new cell in Dustwind Cave last week, five of them, with a candle and a book and a recruit who could not have been older than fourteen.\n\nThe boy is at Razor Hill now, scrubbing pots for Gar'Thok and swearing he never meant it. I believe him, mostly, and I am watching him anyway.\n\nThe cult wants young fools who think the old power can be had for nothing. You know how they work, and you know how to listen at a cave mouth without being heard. Wherever you are, keep doing it, and send word if you see their mark.\n\nShadow-Eye Gruul",
}

P:Letter {
  id = "origin_orc_blade_hunter_2", from = "Shadow-Eye Gruul", stranger = true, delay = 2400,
  when = { origin = "orc_blade_hunter", cleared = "Ragefire Chasm" },
  subject = "Under the city",
  body = "{name},\n\nWe hunted them in the caves of Durotar for years, and all that time the worst of them were living underneath Orgrimmar, close enough to hear the Warchief's drums. You went down into Ragefire and broke them there, and I have not slept so well in a long time.\n\nThe boy from Dustwind Cave asked me what happened to the cultists below the city. I told him that someone who once moved quietly through these caves went into the fire and came out again. He was quiet for a while, and then he asked whether he could learn to track.\n\nThe Blade is not dead, but you cut it deep. Rest a night, and then keep hunting.\n\nShadow-Eye Gruul",
}

---------------------------------------------------------------------------
-- Warlock's apprentice who turned to the spirits
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_lapsed_warlock_shaman_1", from = "Kezzrag", stranger = true, delay = 1200,
  when = { origin = "orc_lapsed_warlock_shaman", minLevel = 6 },
  subject = "From your old master",
  body = "Apprentice,\n\nI hear you are walking with the spirits now, and that the shamans have forgiven you for the years you spent at my side. I hope they have also forgiven me, though I have not asked, and I do not intend to.\n\nI am living quietly in a hut outside Razor Hill. The grunts bring me water and check my eyes for fel light, and they are always disappointed. I have not touched the old craft since the camp. My fingers still remember the shapes, and some nights I sit on them to keep them still.\n\nI taught you to reach for power when you were angry. That was a poor lesson, and the spirits are teaching you a better one. Listen to them, not to me.\n\nKezzrag",
}

P:Letter {
  id = "origin_orc_lapsed_warlock_shaman_2", from = "Seer Mukra", stranger = true, delay = 2400,
  when = { origin = "orc_lapsed_warlock_shaman", minLevel = 30 },
  subject = "The fire answers",
  body = "{name},\n\nWhen you first came to my lodge, the fire would not answer you, and you sat with your back to it for a month because you were ashamed. I still remember the morning it finally lit for you, and how you stared at your own hands as if they belonged to someone else.\n\nThe spirits tell me you have walked a long way since then, and that you have called on them in places where the old fel would have been easier. That is the whole of the lesson, and you learned it out there, not in my lodge.\n\nOld Kezzrag came to my door last week and asked after you. I think he was pleased by the answer, though he did his best to hide it.\n\nSeer Mukra, Orgrimmar",
}

---------------------------------------------------------------------------
-- Defector from the Burning Blade
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_blade_defector_1", from = "Grunt Mazgar", stranger = true, delay = 1200,
  when = { origin = "orc_blade_defector", minLevel = 6 },
  subject = "Your watcher",
  body = "{name},\n\nYou never knew my name, but I was the grunt assigned to stand outside your door in Orgrimmar and see whether you went back to the Blade. You did not, and then you left the city altogether, and my sergeant has reassigned me to guard a pile of barrels. I preferred you.\n\nI am writing because the Blade came asking after you last week. A hooded orc in the Drag asked a tanner where you had gone. The tanner did not know, and the hooded orc is now in a cell beneath Grommash Hold, so you have that to thank me for.\n\nThey have not forgotten you. Keep your back to a wall and your spells close.\n\nGrunt Mazgar, Orgrimmar",
}

P:Letter {
  id = "origin_orc_blade_defector_2", from = "Grunt Mazgar", stranger = true, delay = 2400,
  when = { origin = "orc_blade_defector", cleared = "Ragefire Chasm" },
  subject = "You went back",
  body = "{name},\n\nMy sergeant tells me you went down into Ragefire Chasm and put an end to the Searing Blade's work beneath the city. When I heard it, my first thought was that you had gone back to them after all, and my second thought was that you had, though not the way any of us feared.\n\nI asked to be taken off the barrels and given a real post, and I told the sergeant that the orc I watched for months had just done more against the Blade than our whole patrol. He gave me the gate on the Cleft of Shadow, which I think means he agreed.\n\nThe grunts still watch you, {name}. I think now they will watch you differently.\n\nGrunt Mazgar, Orgrimmar",
}

---------------------------------------------------------------------------
-- Student of the troll mages
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_valley_of_spirits_student_1", from = "Master Zun'jai", stranger = true, delay = 1200,
  when = { origin = "orc_valley_of_spirits_student", minLevel = 6 },
  subject = "From de Valley of Spirits",
  body = "{name},\n\nYour old chair in de study hall has been taken by a young troll who sets his own sleeves on fire twice a week, so I am missing de orc who only set his sleeves on fire once a month.\n\nYour clan cousin came by de Valley looking for you and asked me, very politely, whether you had been eating demons. I told him no, mon, only bread and the occasional scorpid, and he went away looking unsure.\n\nRemember what I taught you. De arcane does not care if you are orc or troll or human, only whether you respect it. Respect it, and keep your eyes their proper color.\n\nZun'jai, Valley of Spirits",
}

P:Letter {
  id = "origin_orc_valley_of_spirits_student_2", from = "Rukka", stranger = true, delay = 2400,
  when = { origin = "orc_valley_of_spirits_student", minLevel = 30 },
  subject = "Your clan cousin",
  body = "{name},\n\nI went to the troll mages last winter to ask whether you were eating demons, and the old troll laughed at me so hard that I nearly drew my axe. I am writing to say that I was wrong, and that I am sorry for checking your eyes at every feast.\n\nTraders from the Barrens say you have burned the Horde's enemies with fire that is red and gold, not green, and that you do it without any warlock's tricks. I told our uncle, and he grunted, which for him is high praise.\n\nWe orcs have no tradition of the arcane, but perhaps you are starting one. Do it well, and do not set anything of mine on fire.\n\nRukka, your cousin",
}

---------------------------------------------------------------------------
-- Blackrock who left Rend's banner
---------------------------------------------------------------------------
P:Letter {
  id = "origin_orc_blackrock_defector_1", from = "Aunt Grolma", stranger = true, delay = 1200,
  when = { origin = "orc_blackrock_defector", minLevel = 6 },
  subject = "Word from Orgrimmar",
  body = "{name},\n\nThe old wives in the Valley of Honor still whisper that our family is Blackrock and cannot be trusted, though I have lived under the Warchief's banner longer than some of them have had teeth. I let them whisper and sell them my cheese anyway, at a higher price.\n\nA goblin trader came through from the Burning Steppes and said the Spire is restless, and that Rend's warriors are building something in the upper halls. He would not say what, and I did not pay him enough to find out.\n\nYou chose Thrall's Horde, and I am proud of you for it, but I know you think about your brothers. Think about them if you must, but do not go looking for them.\n\nAunt Grolma, Orgrimmar",
}

P:Letter {
  id = "origin_orc_blackrock_defector_2", from = "Gorvak", stranger = true, delay = 2400,
  when = { origin = "orc_blackrock_defector", minLevel = 40 },
  subject = "From the mountain",
  body = "{name},\n\nA goblin who sells to both sides of every war carried this out of the mountain for me, and if anyone finds it, I will lose my head. So I will be quick.\n\nThe warriors in the Spire speak your name now, and they do not speak it kindly. Some of them say you are a traitor, and some say you are the only one of us with sense. I have not decided which I am, and I am too old to decide in front of Rend.\n\nIf we meet across a battlefield, I will not hold back, and neither should you. But I wanted you to know that your brother is still alive, and that he still remembers the summer we stole the shaman's goat.\n\nGorvak",
}
