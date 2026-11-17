-- Origin letters: Tauren. Two per origin; the first comes once you've gone out into the world,
-- the second when you've done something that background would care about.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Born on the long walk to Mulgore
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_long_migration_1", from = "Grandmother Tahna", stranger = true, delay = 1200,
  when = { origin = "tauren_long_migration", minLevel = 6 },
  subject = "From Bloodhoof",
  body = "{name},\n\nThe wind brought word from the Crossroads that you have been seen walking the Barrens road, and I laughed so hard that the young ones thought I had swallowed a fly. The last time you crossed that land you were small enough to ride in the hide sling on my back, and you cried at every hyena.\n\nThe village is well. The rains came early this year and the grass by the lake is high enough to hide a calf, and the Palemane gnolls have been quiet since the braves burned their nearest den. Your uncle has taken up carving again, though nobody has the heart to tell him that his kodo look like boulders.\n\nWalk carefully, and do not sleep in the open where the centaur ride.\n\nGrandmother Tahna, Bloodhoof Village",
}

P:Letter {
  id = "origin_tauren_long_migration_2", from = "Grandmother Tahna", stranger = true, delay = 2400,
  when = { origin = "tauren_long_migration", minLevel = 30 },
  subject = "The ones who walked with us",
  body = "{name},\n\nA trader from Orgrimmar passed through and spoke your name at the fire as if everyone ought to know it already. I told him that I did know it, and that I had given you half of it.\n\nI have been thinking about the orcs who fought the centaur beside us on the long walk. Many of them never saw Mulgore, and their names were never told to me, so I could not sing them. When you meet an orc on the road who is old enough to have been there, thank him for me. He will not know what you mean, and that is all right.\n\nYou were the calf who would not stop crying, and now the traders tell stories about you. The Earth Mother has a sense of humour.\n\nGrandmother Tahna",
}

---------------------------------------------------------------------------
-- Child of a Narache hunter
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_narache_hunter_1", from = "Kaya Swiftrunner", stranger = true, delay = 1200,
  when = { origin = "tauren_narache_hunter", minLevel = 6 },
  subject = "From Red Cloud Mesa",
  body = "My {g:son|daughter},\n\nThe plainstriders are thick on the mesa this season, and I took two before the first frost with the bow you used to say was too heavy for me. Grull at Camp Narache sends his greeting and asks whether you still leave your arrows in the grass for others to step on.\n\nThere is trouble near the Brambleblade Ravine, where the quilboar have been raiding the young ones' cache, and the hunters are setting snares along the stream. I would rather be out with them than writing this, but the elders say a mother should send word, so here it is.\n\nThank the Earth Mother for every life you take, and never take more than you need. You know this already, but I will keep saying it until you are old and tired of hearing it.\n\nYour mother, Kaya Swiftrunner",
}

P:Letter {
  id = "origin_tauren_narache_hunter_2", from = "Kaya Swiftrunner", stranger = true, delay = 2400,
  when = { origin = "tauren_narache_hunter", minLevel = 20 },
  subject = "A good season",
  body = "{name},\n\nI have hung a new feather on the lodge pole for you, which I have not done since your first plainstrider. The hunters at Narache asked what it was for, and I told them it was for a child who went out into the wide world and kept coming home in my dreams with all the right scars and none of the wrong ones.\n\nThe herds have moved toward the Venture Company's mine this summer, and the goblins shoot at anything that wanders close, so we have been hunting the southern hills instead. It is a longer walk, and my knees complain about it every evening.\n\nYou have grown into a hunter's child after all. I am proud, and I will say it once in writing so that you cannot claim I never did.\n\nKaya",
}

---------------------------------------------------------------------------
-- Grimtotem by birth, Bloodhoof by choice
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_grimtotem_born_1", from = "Orna", stranger = true, delay = 1200,
  when = { origin = "tauren_grimtotem_born", minLevel = 6 },
  subject = "Do not answer this",
  body = "{name},\n\nI am writing from the Stonetalon road, and I will burn the ink pot after so no one smells it on my hands. Father spoke your name at the council fire last month, and he did not say it kindly, and three of the younger braves nodded along.\n\nThey watch the paths out of Thunder Bluff now. They say Cairne's city is full of orcs and outsiders, and that a Grimtotem who lives there has chosen a side. I do not think you chose a side, {g:brother|sister}, whatever the elders call you now. I think you chose to be left alone, and they will not allow it.\n\nDo not travel the high passes by night. Do not answer this letter.\n\nOrna",
}

P:Letter {
  id = "origin_tauren_grimtotem_born_2", from = "Orna", stranger = true, delay = 2400,
  when = { origin = "tauren_grimtotem_born", minLevel = 30 },
  subject = "From the Needles",
  body = "{name},\n\nThe clan has moved more of its people down into Thousand Needles, and the talk around the fires there is all about the high mesas and who has the right to them. I have heard your name less this season, which frightened me at first, until I understood why.\n\nThe braves who were boasting of hunting you down have heard the same stories I have. They know what you have fought since you left, and they have quietly found other things to boast about. It seems the best protection from our own kin was simply to become too much trouble.\n\nI still cannot come to you, and you still cannot come to me. But I sleep a little better, and I wanted you to know that.\n\nOrna",
}

---------------------------------------------------------------------------
-- Pupil of Hamuul Runetotem (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_hamuul_pupil_1", from = "Meela Dawnstrider", stranger = true, delay = 1200,
  when = { origin = "tauren_hamuul_pupil", minLevel = 6 },
  subject = "From the Elder Rise",
  body = "{name},\n\nThe Arch Druid has asked me to write because his own hand is busy with a sick sapling he refuses to leave, so you will have to make do with your old study partner. He was pleased to hear you had gone down into the world, and then he went quiet for a long time, which is what he does when he is pleased and worried at once.\n\nThe pools under the Elder Rise have been murky since the spring, and two of the younger pupils swear they saw a moonkin feather by the lift, which no one believes. I believe it a little.\n\nRemember what he told us. The land does not need you to be strong. It needs you to listen first and act second.\n\nMeela Dawnstrider, of the Cenarion Circle",
}

P:Letter {
  id = "origin_tauren_hamuul_pupil_2", from = "Meela Dawnstrider", stranger = true, delay = 2400,
  when = { origin = "tauren_hamuul_pupil", cleared = "Wailing Caverns" },
  subject = "The Fanglords",
  body = "{name},\n\nWord came up the lift that the Druids of the Fang have been broken in the Wailing Caverns, and that you were among those who went down. Hamuul read the message twice and then sat on the edge of the rise until the sun went down.\n\nYou know he knew some of them. They went into the Emerald Dream with Naralex, and they came out wrong, and every one of them was once a pupil as eager as we were. He does not blame you, and he asked me to say so clearly. He only wanted you to understand why he will not celebrate.\n\nI am glad you came out of those caves whole. Come back to the Elder Rise when you can, and tell us what the deep places looked like, because we will need to know.\n\nMeela",
}

---------------------------------------------------------------------------
-- Seer's apprentice from the Spirit Rise (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_spirit_rise_1", from = "Seer Nawa Windsong", stranger = true, delay = 1200,
  when = { origin = "tauren_spirit_rise", minLevel = 6 },
  subject = "The water jars",
  body = "Little water-bearer,\n\nThe jars on the Spirit Rise are empty more often since you left, and the new apprentice spills half of what he carries on the bridges, so the elements have been very patient with us. I think they miss you, though they are too proud to say so, much like the rest of us.\n\nThe pools below the rise have been restless this month. The ghosts of the ancestors walk more often at dusk, and the seers argue over whether it is an omen or simply the change of season. I suspect it is both, because it usually is.\n\nListen to the wind when you are lost and to the earth when you are afraid. Fire will always speak first, but it is rarely the wisest voice.\n\nSeer Nawa Windsong, the Spirit Rise",
}

P:Letter {
  id = "origin_tauren_spirit_rise_2", from = "Seer Nawa Windsong", stranger = true, delay = 2400,
  when = { origin = "tauren_spirit_rise", cleared = "Razorfen Downs" },
  subject = "Cold in the Downs",
  body = "{name},\n\nThe spirits of the ancestors have been uneasy since the Scourge came to the Razorfen, and the seers felt a coldness in the south that no fire could warm. Three nights ago the coldness lifted, and this morning a runner told us that the lich in the Downs has fallen and that you were there.\n\nThe dead in that place were quilboar, and our enemies, but they were not made to be slaves after death. The elements do not love the Scourge, and neither do the ancestors. I lit the long incense for the bones you set free, even the ones that would have gored me in life.\n\nYou went into the cold and came back. I always said you would make a fine shaman, though I also said you would never learn to carry water properly.\n\nNawa",
}

---------------------------------------------------------------------------
-- Plains runner of the Barrens (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_plains_runner_1", from = "Tarek Dustmane", stranger = true, delay = 1200,
  when = { origin = "tauren_plains_runner", minLevel = 6 },
  subject = "The Taurajo road",
  body = "{name},\n\nSince you left the runners' lodge at Camp Taurajo I have been carrying your messages as well as mine, and I want you to know that my hooves have opinions about it. The Crossroads lot still send letters that could have waited a week, and the Razormane still lie in the grass by the Southern Gold Road hoping one of us is slow.\n\nYour old cat came back to the lodge after you left and slept by the door for nine days. Then she found a lion's carcass by the river and forgot you entirely, so do not be too touched.\n\nKeep your eyes on the grass and your bow strung. It is a big world, but it is mostly the Barrens with different weather.\n\nTarek Dustmane, Camp Taurajo",
}

P:Letter {
  id = "origin_tauren_plains_runner_2", from = "Tarek Dustmane", stranger = true, delay = 2400,
  when = { origin = "tauren_plains_runner", cleared = "Wailing Caverns" },
  subject = "Strange news from the oasis",
  body = "{name},\n\nI ran a message past the Lushwater Oasis yesterday and stopped to drink, which I have not dared to do in a year. The water tasted clean, and the deviate beasts that used to crawl out of the caves were nowhere to be seen, and the old night elf at the cave mouth was gone from his post.\n\nAt the Crossroads they say you went down into the Wailing Caverns and came back out, which most people who go into the Wailing Caverns do not manage. The runners have started calling the oasis trail by your name, which is a great honour and also means you will be blamed if anyone is eaten there.\n\nRun well, wherever you are.\n\nTarek",
}

---------------------------------------------------------------------------
-- Orphan of a Razormane raid
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_razormane_orphan_1", from = "Brave Harn Stormhoof", stranger = true, delay = 1200,
  when = { origin = "tauren_razormane_orphan", minLevel = 6 },
  subject = "From the one who found you",
  body = "{name},\n\nI am not a writer of letters, and the elders laughed at me when I asked for a quill, but I wanted to say something before you went too far. I still remember the dry riverbed and the small face that would not stop staring at my spear, and now I hear you have gone out of Mulgore with a weapon of your own.\n\nThe village is quiet. The Venture Company has been driven back from the northern pastures for now, and Baine Bloodhoof says the gnolls will not try the north road again before spring. I spend my evenings mending the fence you broke when you were nine.\n\nBe angry at the Razormane if you must, but do not let it eat you. I have seen it eat better braves than either of us.\n\nHarn Stormhoof, Bloodhoof Village",
}

P:Letter {
  id = "origin_tauren_razormane_orphan_2", from = "Brave Harn Stormhoof", stranger = true, delay = 2400,
  when = { origin = "tauren_razormane_orphan", cleared = "Razorfen Kraul" },
  subject = "The Kraul",
  body = "{name},\n\nThe hunters coming up from the south say that Charlga Razorflank is dead in the thorns of the Razorfen Kraul, and that the quilboar are fighting among themselves over who leads them now. They also say your name, and I pretended I did not know it so that I could hear the story twice.\n\nI wondered for years whether you would go looking for the ones who burned your family's camp. The quilboar in that place were not the same raiders, and you knew that, but I think a part of you went anyway, and I think that part of you can rest a little now.\n\nI finished the fence. You will have to find something else of mine to break when you come home.\n\nHarn",
}

---------------------------------------------------------------------------
-- Regrower of Stonetalon (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_stonetalon_regrower_1", from = "Elder Tavi Greenhoof", stranger = true, delay = 1200,
  when = { origin = "tauren_stonetalon_regrower", minLevel = 6 },
  subject = "From Sun Rock",
  body = "{name},\n\nThe shredders have reached the edge of the Charred Vale, and the noise of them carries all the way up to Sun Rock on a still morning. The Venture Company built another lumber camp at Windshear Crag this season, and the goblins have hired more of their ogre friends to guard it.\n\nYour saplings by the lower pool are still standing. I watered them myself, though I suspect they knew I was not you and grew only out of politeness.\n\nThere is a stubbornness in you that the trees understand, and I hope you keep it out in the wide world. Do not let anyone tell you that one tree is too small to matter. The goblins certainly do not think so, or they would not count them.\n\nElder Tavi Greenhoof, Sun Rock Retreat",
}

P:Letter {
  id = "origin_tauren_stonetalon_regrower_2", from = "Elder Tavi Greenhoof", stranger = true, delay = 2400,
  when = { origin = "tauren_stonetalon_regrower", cleared = "Blackfathom Deeps" },
  subject = "Ashenvale's water",
  body = "{name},\n\nA sentinel would sooner put an arrow in a tauren than write to one, but a night elf druid left a message at the border stone saying that the Twilight's Hammer has been driven from Blackfathom Deeps. She did not name you, but the scouts at Splintertree did.\n\nAshenvale's water runs down into the same earth as ours, little regrower, and whatever was being woken in that drowned temple would not have stayed in it. I do not know if the night elves will thank you, and I suspect they will not, but the trees will, and they keep longer memories.\n\nThe shredders are still at Windshear. Come home one day and we will see how many stumps we can shame into growing again.\n\nTavi",
}

---------------------------------------------------------------------------
-- Former acolyte of Magatha Grimtotem (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_magatha_acolyte_1", from = "Hesta Cloudwalker", stranger = true, delay = 1200,
  when = { origin = "tauren_magatha_acolyte", minLevel = 6 },
  subject = "She noticed",
  body = "{name},\n\nI am still on the Elder Rise, still grinding herbs for her, and still smiling when she speaks. You were braver than me to leave, and I have not forgiven you for it yet.\n\nShe noticed that you were gone, of course. She said nothing for three days and then, during the evening teaching, she remarked that the elements choose only the loyal. Everyone in the tent knew who she meant. Nobody looked at your empty mat, which is how I knew they were all thinking about it.\n\nThe Elder Rise is quiet otherwise. There are more Grimtotem visitors than there used to be, and they leave before Cairne's braves come up the lift. Take care who you trust on the road.\n\nHesta Cloudwalker",
}

P:Letter {
  id = "origin_tauren_magatha_acolyte_2", from = "Hesta Cloudwalker", stranger = true, delay = 2400,
  when = { origin = "tauren_magatha_acolyte", minLevel = 40 },
  subject = "I left too",
  body = "{name},\n\nI have left her teaching. I did it badly, in front of everyone, by spilling a bowl of ash on her rug and then simply walking out instead of apologising, and I have been shaking ever since.\n\nIt was your name that did it, if you want the truth. A runner told the Elder Rise about the things you have done out in the world, and Magatha said that power gained outside her tent was borrowed and would be taken back. She said it smiling. I looked at that smile and thought of you, out there with the elements answering you anyway, and I could not stay.\n\nThe seers on the Spirit Rise have taken me in. They are kinder, and they do not keep anyone's secrets in their pockets.\n\nHesta",
}

---------------------------------------------------------------------------
-- Scout of Ghost Walker Post (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_ghost_walker_scout_1", from = "Scout Rhal Ashmane", stranger = true, delay = 1200,
  when = { origin = "tauren_ghost_walker_scout", minLevel = 6 },
  subject = "From Ghost Walker Post",
  body = "{name},\n\nThe post is much as you left it, which is to say grey and dusty and full of things that were dead before we got here. The ghosts walked through the lodge again on the night of the new moon, and the new recruit hid under his blanket until morning, so we have begun calling him Blanket.\n\nThe Kolkar have been pushing up from the south, and they took two kodo from the pens by the dry riverbed last week. We followed their tracks almost to the Magram camps before the wind wiped them out.\n\nYou picked a better time to leave than you know. Keep your back to a rock when you sleep, as I taught you, and do not trust a centaur who smiles.\n\nRhal Ashmane, Ghost Walker Post",
}

P:Letter {
  id = "origin_tauren_ghost_walker_scout_2", from = "Scout Rhal Ashmane", stranger = true, delay = 2400,
  when = { origin = "tauren_ghost_walker_scout", minLevel = 30 },
  subject = "The Kolkar tell stories too",
  body = "{name},\n\nWe caught a Kolkar outrider near Kodo Graveyard last week, and before we let him run home with his tail between his legs, he told us something odd. The centaur clans have a name for a {race} {class} who has been killing their raiders all over Kalimdor, and from his description it could only be you.\n\nI laughed until my ribs ached, and then I wrote it on the lodge wall so the recruits would see it. Blanket is so impressed that he has stopped hiding from the ghosts, which is the most useful thing anyone has done at this post all year.\n\nThe spirits still walk. The centaur still raid. Desolace has not changed, but you have, and I am glad of it.\n\nRhal",
}

---------------------------------------------------------------------------
-- Brave of Bloodhoof Village (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_bloodhoof_brave_1", from = "Brave Kotah Ironhide", stranger = true, delay = 1200,
  when = { origin = "tauren_bloodhoof_brave", minLevel = 6 },
  subject = "From the fence line",
  body = "{name},\n\nThe Venture Company came back to the northern pastures three days after you left, as if they had been waiting for you to go. We drove them off again, but they burned a hay store this time, and Baine Bloodhoof was angry enough to break a totem.\n\nCairne came down from the bluff to speak with the braves afterward. He said what he always says, that we strike only when the land demands it, and I watched the young braves nod while they sharpened their axes. I think of you whenever he says it, because you were the only one of us who really listened.\n\nKeep listening, out there. It is harder than fighting, and there are fewer people to do it.\n\nKotah Ironhide, Bloodhoof Village",
}

P:Letter {
  id = "origin_tauren_bloodhoof_brave_2", from = "Brave Kotah Ironhide", stranger = true, delay = 2400,
  when = { origin = "tauren_bloodhoof_brave", minLevel = 20 },
  subject = "A new rank of braves",
  body = "{name},\n\nBaine has made me captain of the fence line, which means I get blamed for every gnoll that wanders in and praised for none that stay out. I asked him who he would rather have in the post, and he said your name before I had finished asking, so I am writing to complain to you personally.\n\nThe young braves talk about you at the fire. They say you have fought in the Barrens and beyond, and that you still bow to the kodo before you mount, which I suspect someone invented to make them behave. I have not corrected them.\n\nThe Earth Mother keep your axe sharp and your temper sharper still, and come home when you are tired of the world.\n\nKotah",
}

---------------------------------------------------------------------------
-- Kodo herder turned warrior (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_tauren_kodo_herder_1", from = "Shena Plainshoof", stranger = true, delay = 1200,
  when = { origin = "tauren_kodo_herder", minLevel = 6 },
  subject = "The herd",
  body = "Cousin,\n\nThe herd is smaller than it was, but it is still a herd, and I drove it down the old trail past Camp Taurajo last month without losing a single calf. Old Greyback is lame in one leg now, and she still walks at the front because none of the others will.\n\nI went to your father's cairn by the dry lake on the way back. I left a handful of grass on it, which is foolish, because the dead do not eat grass, but I thought he would laugh at it, and that was enough.\n\nI know why you took up the axe instead of the staff. I am not asking you to put it down. I only want you to know the herding staff is still hanging in the lodge if you ever want it.\n\nShena Plainshoof",
}

P:Letter {
  id = "origin_tauren_kodo_herder_2", from = "Shena Plainshoof", stranger = true, delay = 2400,
  when = { origin = "tauren_kodo_herder", cleared = "Razorfen Kraul" },
  subject = "What the quilboar took",
  body = "Cousin,\n\nThe herders on the southern trail say the Razorfen Kraul has been cleared, and that the beasts the quilboar were penning in there have been turned loose. One of the old kodo that wandered out had a herder's notch in her ear, and it was ours. She is too old to work now, but I brought her home anyway, and Greyback has been fussing over her like a mother.\n\nIt was the Kolkar who took your father, not the quilboar, and I know it was not vengeance that sent you into those thorns. But I like to think a little of what we lost has found its way back.\n\nCome and see her before she goes to the Earth Mother. She will not remember you, but you will remember her.\n\nShena",
}
