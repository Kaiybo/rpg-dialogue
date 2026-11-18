-- Skyborne origin letters: one from home soon after leaving, one later on.
-- Lore stays inside BRIEF.md section 10; the news is small and local on purpose.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Descendant of Highborne magisters (High Order, Alliance)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_high_order_1", from = "Magister Caelaanor Vey", stranger = true, delay = 1200,
  when = { origin = "skyborne_high_order", minLevel = 6 },
  subject = "Regarding the family library",
  body = "{name},\n\nI have reshelved the volumes you left open on the reading table, though I could not bring myself to close the one on ley convergence, since you had marked your place with a hippogryph feather and I assumed it mattered.\n\nThe Enclave in Dalaran writes that the human magi are generous with their questions and miserly with their answers. That is to be expected. Our ancestors were the same, and I suspect the Kirin Tor have read about them.\n\nYou went down to find what is missing from our books, so write down everything, even what seems trivial. The line has lost too much already to the habit of trusting memory.\n\nYour uncle,\nCaelaanor",
}

P:Letter {
  id = "origin_skyborne_high_order_2", from = "Magister Caelaanor Vey", stranger = true, delay = 2400,
  when = { origin = "skyborne_high_order", cleared = "Scarlet Monastery" },
  subject = "The library at Tirisfal",
  body = "{name},\n\nWord reached the Enclave that you forced your way into the Scarlet Monastery and walked through its library. I confess that my first question was not whether you were hurt but whether you had read anything, and I am ashamed of that, a little.\n\nThe Crusade keep their books the way a miser keeps his coin, which is to say badly and with a lot of shouting. If you saw anything older than the human kingdoms on those shelves, I would like a description of the binding, the script and the smell of the pages, because forgeries never smell right.\n\nI am glad you are alive. I mention it second only because you already knew that.\n\nCaelaanor",
}

---------------------------------------------------------------------------
-- Windshaper initiate (Horde)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_windshaper_1", from = "Saalen Galecaller", stranger = true, delay = 1200,
  when = { origin = "skyborne_windshaper", minLevel = 6 },
  subject = "Winds be with you",
  body = "{name},\n\nWinds be with you, wherever they still blow. I am writing from the edge of Camp Gev'rek, where the plains run on so far that the young ones keep asking when they will reach the end. I have stopped telling them there isn't one.\n\nThe tauren have been kinder than I expected and more patient than we deserve. One of their elders sat with me through a whole evening's offering and did not ask once why our spirits had gone quiet, which I have decided to count as the highest courtesy I have ever been shown.\n\nYou passed the trials with me, so you know what the sapta tastes like. Try not to forget what it showed you, now that you are out among the orcs and their loud opinions.\n\nSaalen",
}

P:Letter {
  id = "origin_skyborne_windshaper_2", from = "Saalen Galecaller", stranger = true, delay = 2400,
  when = { origin = "skyborne_windshaper", minLevel = 20 },
  subject = "A breeze at the offering",
  body = "{name},\n\nSomething happened at the offering last night, and I wanted you to hear it from me before the camp makes it into a legend. A breeze came across the totems from the west, warm and steady, and every flame in the circle leaned the same way and held there for as long as it takes to say a prayer.\n\nIt may have been nothing but weather. Ayessa Dawnsinger said as much, though she stood very still while she said it.\n\nI hear you have become strong enough to be spoken of in Thunder Bluff, which is no small thing for one of us. Keep honoring the winds as you go. Even if they are not listening yet, someone ought to have kept the habit.\n\nSaalen",
}

---------------------------------------------------------------------------
-- Peacekeeper of Zephras Isle
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_peacekeeper_1", from = "Captain Ithaarel Sunlance", stranger = true, delay = 1200,
  when = { origin = "skyborne_peacekeeper", minLevel = 6 },
  subject = "Your post in Valanaar",
  body = "{name},\n\nYour post at the square in Valanaar has been taken over by a recruit who believes that peacekeeping means standing with his arms folded and frowning at anyone who looks foreign. Since half the people in the square now look foreign, he frowns all day and has developed a headache.\n\nWe had a scuffle at the skydocks last week between a dock hand and a mainland merchant over the price of a windstone. Nobody drew steel, and I made them shake hands, which pleased neither of them.\n\nKeep the peace where you can, {name}, but do not expect the mainland to thank you for it. They have their own ideas about whose peace it is.\n\nCaptain Ithaarel Sunlance\nPeacekeepers of Zephras Isle",
}

P:Letter {
  id = "origin_skyborne_peacekeeper_2", from = "Captain Ithaarel Sunlance", stranger = true, delay = 2400,
  when = { origin = "skyborne_peacekeeper", minLevel = 30 },
  subject = "A report from the isle",
  body = "{name},\n\nThe Council of Elders has asked every captain to send word to Peacekeepers serving abroad, so this is an official letter, and you may imagine me writing it standing up.\n\nThe isle is quiet. The quarrels between the orders have not grown worse this season, which is the best report I have given in years. Two pylons near Anvilas dimmed and then steadied again, and nobody can tell me why, so I have stopped asking.\n\nUnofficially, I hear you are a fighter worth fearing now. Good. Come home one day and teach the recruit with the headache how to do this job properly, because I have run out of patience and he has run out of frowns.\n\nIthaarel",
}

---------------------------------------------------------------------------
-- Ranger of Thendal Grove
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_thendal_ranger_1", from = "Elaaria Whisperwind", stranger = true, delay = 1200,
  when = { origin = "skyborne_thendal_ranger", minLevel = 6 },
  subject = "The paths around Thendal",
  body = "{name},\n\nThe paths around Thendal Village have grown over a little since you left, because nobody walks them as often as you did. I cleared the one down to the stream myself last week and found your old snare still set, with a very offended rabbit in it. I let him go on your behalf.\n\nThe rangers have been told to keep closer to the village now, though nobody will say what they are afraid of. I think it is only that the elders feel better when they can count us.\n\nWrite to me about the mainland forests. You always said our grove was small, and I would like to know if you were right, or if you were only being difficult again.\n\nElaaria",
}

P:Letter {
  id = "origin_skyborne_thendal_ranger_2", from = "Elaaria Whisperwind", stranger = true, delay = 2400,
  when = { origin = "skyborne_thendal_ranger", minLevel = 20 },
  subject = "You were right",
  body = "{name},\n\nYour letters made me jealous enough that I took the skydock down for a week to see a mainland forest for myself. You were right, and I am annoyed about it. The trees went on until I could not see the end of them, and the birds sang songs I did not know, and I got completely lost twice in a single afternoon.\n\nI came back to Thendal with burrs in my cloak and a new respect for you. The grove felt very small when I returned, and very dear.\n\nThe offended rabbit has been seen again near the stream. He seems to have forgiven nobody, which I respect.\n\nElaaria",
}

---------------------------------------------------------------------------
-- Recruit of the Empyrean Blades (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_empyrean_recruit_1", from = "Blademaster Torvaal Ashwing", stranger = true, delay = 1200,
  when = { origin = "skyborne_empyrean_recruit", minLevel = 6 },
  subject = "Drill continues without you",
  body = "{name},\n\nDrill continues without you, as you will be glad to know. The recruits run the same circuit at dawn and break the same practice blades by noon, and the quartermaster blames you personally for the cost, though you have been gone for weeks.\n\nThe Blades were made to guard the Shal'nan, and some of the young ones have begun to ask what we are for now that there is no Shal'nan to guard. I tell them that a blade is for whatever needs guarding, and that the question answers itself if you keep your eyes open.\n\nYou left before your training was finished. Finish it out there, and do not let the mainland soldiers teach you to swing like a woodcutter.\n\nBlademaster Torvaal Ashwing",
}

P:Letter {
  id = "origin_skyborne_empyrean_recruit_2", from = "Blademaster Torvaal Ashwing", stranger = true, delay = 2400,
  when = { origin = "skyborne_empyrean_recruit", minLevel = 30 },
  subject = "On being worthy",
  body = "{name},\n\nI have heard enough from travelers to know that you have stood your ground in places where trained soldiers broke and ran. I will not call that worthy of the Blades, because I have never called anyone that, and I am too old to start.\n\nI will tell you instead that I took your name off the recruits' board this morning and put it on the wall beside the others. It means nothing to anyone but us, and you are not to make a fuss about it.\n\nThe quartermaster has stopped blaming you for the practice blades. He blames the new recruits now, which is fairer and makes him much happier.\n\nTorvaal",
}

---------------------------------------------------------------------------
-- Initiate of the Nightclaw Druids (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_nightclaw_1", from = "A friend in Shadowgale", stranger = true, delay = 1200,
  when = { origin = "skyborne_nightclaw", minLevel = 6 },
  subject = "From under the trees",
  body = "{name},\n\nThe others would not want me writing to you, so I will be brief and sign nothing. Shadowgale is as dark and as quiet as you remember it, and the paths still close behind anyone who is not welcome.\n\nWe have had visitors from Valanaar asking questions about what we do in the forest. We gave them tea and very little else, and they left more confused than they came, which is how we prefer it.\n\nYou promised to keep what you learned to yourself, and I believe you will. Learn the mainland's forests the way we taught you to learn ours, by listening first and speaking last, and come back with something we do not already know.\n\nA friend in Shadowgale",
}

P:Letter {
  id = "origin_skyborne_nightclaw_2", from = "A friend in Shadowgale", stranger = true, delay = 2400,
  when = { origin = "skyborne_nightclaw", minLevel = 20 },
  subject = "A question",
  body = "{name},\n\nThe elders of the forest have heard that you have walked a long way into the mainland and kept your counsel, and they were pleased, in their way. One of them smiled, which I have never seen and hope not to see again, because it was unsettling.\n\nThey asked me to put a question to you, and to say that you need not answer. They want to know whether the mainland's forests feel the wind the way ours did, or whether they listen to something else entirely.\n\nThink on it before you write back, if you write back at all. The trees here will wait, as they always have, and so will I.\n\nA friend in Shadowgale",
}

---------------------------------------------------------------------------
-- Clothcrafter of Valanaar
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_valanaar_clothcrafter_1", from = "Miraana Silkfeather", stranger = true, delay = 1200,
  when = { origin = "skyborne_valanaar_clothcrafter", minLevel = 6 },
  subject = "Your loom is gathering dust",
  body = "{name},\n\nYour loom is gathering dust in the corner of the workshop, and I have had to hang a sheet over it to stop customers asking when you'll be back. Old Mistress Faela came in for a cloak you promised her and would not leave until I swore on my thimble to finish it myself.\n\nThe mainland traders pay well for our weaving, which pleases me, and want it in brown, which does not. I have made six brown cloaks this month and dreamed about the color every night.\n\nI hope you are still braiding feathers into strangers' hair. Somebody should be making the mainland prettier, and I am too busy making it brown.\n\nMiraana, Valanaar",
}

P:Letter {
  id = "origin_skyborne_valanaar_clothcrafter_2", from = "Miraana Silkfeather", stranger = true, delay = 2400,
  when = { origin = "skyborne_valanaar_clothcrafter", minLevel = 20 },
  subject = "Windstones and cloaks",
  body = "{name},\n\nA buyer from the skydocks tried to pay me in mainland silver this week instead of windstones, and I stood there holding the coins like a fool, trying to remember what they were worth. I took them in the end. I think the street is going to have to get used to it.\n\nI finished Mistress Faela's cloak, by the way, and she says the hem is crooked and that you would have done it straight. She is right, and I have never forgiven her for it.\n\nYou are doing well out there, from what I hear, and you must have had to mend your own clothes a hundred times. Tell me you still make a clean stitch, so I can sleep at night.\n\nMiraana",
}

---------------------------------------------------------------------------
-- Bearer of a grandmother's heirloom
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_heirloom_bearer_1", from = "Taaliel Dawnreach", stranger = true, delay = 1200,
  when = { origin = "skyborne_heirloom_bearer", minLevel = 6 },
  subject = "From your mother",
  body = "My dear {name},\n\nI went up to Shen'dramar on the anniversary, as I do every year, and stood where we let your grandmother go. The wind was very still, and I found myself wishing you were there to complain about it the way she would have.\n\nI hope you are still wearing her ring and not keeping it in a pocket where it might be lost. She was very particular about rings, as you know, and about pockets, and about most things.\n\nThe house is quiet without you, and I have taken to talking to the cat, who listens about as well as you did. Write when you can, and eat properly.\n\nYour mother,\nTaaliel",
}

P:Letter {
  id = "origin_skyborne_heirloom_bearer_2", from = "Taaliel Dawnreach", stranger = true, delay = 2400,
  when = { origin = "skyborne_heirloom_bearer", minLevel = 40 },
  subject = "Half right",
  body = "My dear {name},\n\nYou were only a child when your grandmother told you the isle would outlast us all. I have been thinking about that this season, because the isle has changed more than I would like, and you have changed more than I expected.\n\nPeople come to my door now to tell me what you have done out there, and some of the stories are so large that I am sure they are only half true. Your grandmother would have liked that, because she always said half right was a respectable outcome for anyone.\n\nKeep her ring safe, and keep yourself safer. I would much rather have you home than have stories of you.\n\nYour mother",
}

---------------------------------------------------------------------------
-- Pylon guard of Anvilas (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_anvilas_pylon_guard_1", from = "Sergeant Raelos Steadfast", stranger = true, delay = 1200,
  when = { origin = "skyborne_anvilas_pylon_guard", minLevel = 6 },
  subject = "Still standing here",
  body = "{name},\n\nI am still standing beside the third pylon at Anvilas, staring at it as though it might tell me something. It has not. It hums a little lower every week, and the magisters who come to look at it hum along with it and leave.\n\nThe guard shift has been cut to two of us since you went down, so I have nobody to argue with at night but Kael, who does not argue but only agrees with everything I say, which is much worse.\n\nI understand why you went. A guard needs something to guard against, and there is no fighting a crystal that is tired. I hope you found something with a face you can hit.\n\nRaelos, Anvilas",
}

P:Letter {
  id = "origin_skyborne_anvilas_pylon_guard_2", from = "Sergeant Raelos Steadfast", stranger = true, delay = 2400,
  when = { origin = "skyborne_anvilas_pylon_guard", minLevel = 30 },
  subject = "The third pylon",
  body = "{name},\n\nThe third pylon went dark last month, and I was standing beside it when it happened. There was no flash and no sound, only a quiet that I have not been able to forget. Kael said something sensible about it, for once, and I have not forgiven him.\n\nThey have moved me to the fourth pylon, which is still bright, and I am told I may stand beside it for as long as it lasts. I have decided to treat this as an honor.\n\nI hear you have found plenty with faces worth hitting. Good. One of us should be doing something useful with our arms.\n\nRaelos",
}

---------------------------------------------------------------------------
-- Student of the Cenarion Circle (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_circle_student_1", from = "Druid Halwen Starfeather", stranger = true, delay = 1200,
  when = { origin = "skyborne_circle_student", minLevel = 6 },
  subject = "Lessons continue",
  body = "{name},\n\nYour night elf teachers have asked me to tell you that your lessons are not finished merely because you have stopped attending them. I have passed this on as instructed, and I add for myself that I do not think you will stop learning just because nobody is grading you.\n\nThe Circle is busier than ever. Every druid I meet seems to be on the way to somewhere troubled, and none of them stop long enough to finish a cup of tea.\n\nYou and I are rare among our people, so we must be twice as careful to learn properly. Listen for the wind and the stone, and let the Circle pray to the moon. There is room for both.\n\nHalwen",
}

P:Letter {
  id = "origin_skyborne_circle_student_2", from = "Druid Halwen Starfeather", stranger = true, delay = 2400,
  when = { origin = "skyborne_circle_student", cleared = "Wailing Caverns" },
  subject = "The Fang",
  body = "{name},\n\nThe Circle has heard of the Wailing Caverns, and your name with it. The druids I study with were very quiet about it, because the Druids of the Fang were their own students once, and it is a hard thing to be grateful that a pupil has been put down.\n\nOne of the elder night elves sat with me afterward and said that you had done well, and then that he hoped you never had to do it again. I think that is the most honest praise a druid can give.\n\nI am proud of you, and I would like it noted that a Skyborne helped mend a mainland grove. Our people need more stories like that one.\n\nHalwen",
}

---------------------------------------------------------------------------
-- Cliff hunter of Siroccas (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_siroccas_cliff_hunter_1", from = "Vaanir Longshot", stranger = true, delay = 1200,
  when = { origin = "skyborne_siroccas_cliff_hunter", minLevel = 6 },
  subject = "The cliffs miss you",
  body = "{name},\n\nThe cliffs below Siroccas miss you, or at least the birds do, because they have come back to nest on the ledges you used to clear. I have started shooting at them myself, and I keep missing, which has done nothing for my reputation in the village.\n\nI hear the mainland wind does not carry an arrow the way ours does. That serves you right for all those years of bragging about shots the wind made for you.\n\nLearn to shoot honestly out there, and then come home and show me how. My arrows land in the sea more often than in the birds, and the fishermen have begun to complain.\n\nVaanir, Siroccas",
}

P:Letter {
  id = "origin_skyborne_siroccas_cliff_hunter_2", from = "Vaanir Longshot", stranger = true, delay = 2400,
  when = { origin = "skyborne_siroccas_cliff_hunter", minLevel = 20 },
  subject = "A wager",
  body = "{name},\n\nThe whole village is talking about your shooting, which I find very irritating, since they never talked about mine. I have a wager with the fisherman's wife that you can now hit a target at fifty paces with no wind to help you, and I would like you to prove me right as soon as you can.\n\nThe birds still own the ledges. I have stopped shooting at them and started feeding them instead, which costs me far fewer arrows. They seem to prefer this arrangement as well.\n\nThe cliffs are still here, and the wind is as fickle as ever. Come and show the village how a {class} shoots when the sky is no longer doing half the work.\n\nVaanir",
}

---------------------------------------------------------------------------
-- Galestrider rider of the Ban'aethal ruins (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_banaethal_rider_1", from = "Oriaan Feathermark", stranger = true, delay = 1200,
  when = { origin = "skyborne_banaethal_rider", minLevel = 6 },
  subject = "Your Galestrider's old roost",
  body = "{name},\n\nNobody else wanted the Ban'aethal work, just as you said, so the council gave it to me, and I now understand why you liked having nobody to talk to. My Galestrider is much better company than most of the people in Valanaar.\n\nSomething has been nesting in the eastern colonnade of the ruins. I have not seen it clearly, but it leaves feathers that are not ours and droppings that are very much its own. I mean to find out what it is before it finds out about me.\n\nI hope the mainland ruins are kinder than ours. If you find a quiet one, tell me about it, and I may come down to steal it.\n\nOriaan",
}

P:Letter {
  id = "origin_skyborne_banaethal_rider_2", from = "Oriaan Feathermark", stranger = true, delay = 2400,
  when = { origin = "skyborne_banaethal_rider", cleared = "Uldaman" },
  subject = "Old stones",
  body = "{name},\n\nI heard you went into Uldaman, where the dwarves have been digging up stones older than anyone can count. I have been jealous for a week. My ruins are only ten thousand years old, and I have already learned every crack in them.\n\nThe thing in the eastern colonnade turned out to be a very old hippogryph, half blind and too proud to leave. I bring it fish now. My Galestrider is furious about this.\n\nTell me what the oldest stones of the mainland look like, and whether anything inside them was still awake. I will tell my hippogryph, who will not care in the slightest, but it is good to have someone to read letters to.\n\nOriaan",
}

---------------------------------------------------------------------------
-- Windstone runner (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_windstone_runner_1", from = "Someone who owes you", stranger = true, delay = 1200,
  when = { origin = "skyborne_windstone_runner", minLevel = 6 },
  subject = "A small matter",
  body = "{name},\n\nYou left before I could pay you for the last run to Shen'dramar, and I want you to know that I have not forgotten, and in our line of work remembering a debt is rarer than paying one. I have also not paid, because you are not here, which is very convenient for me.\n\nThe Council has started counting windstones at the skydocks, so the old routes have gone cold. Most of the runners I know have taken up honest work, and the few who haven't are worse at hiding than they think.\n\nIf you find a mainland trade worth the risk, keep it to yourself. Silence was the only thing we ever sold that held its value.\n\nSomeone who owes you",
}

P:Letter {
  id = "origin_skyborne_windstone_runner_2", from = "Someone who owes you", stranger = true, delay = 2400,
  when = { origin = "skyborne_windstone_runner", cleared = "The Deadmines" },
  subject = "Professional courtesy",
  body = "{name},\n\nI hear you went into the Deadmines and broke up the Defias, who were the biggest band of smugglers and cutthroats on the mainland. I hope you understand how strange that looks to people who knew you before.\n\nStill, I understand it. They were not runners, they were thieves who wanted a kingdom, and that is a different trade with a much worse ending. Professional courtesy only goes so far.\n\nI still owe you for Shen'dramar, and I still have not paid. Consider it an investment in our friendship, because as long as I owe you, you will keep writing back.\n\nSomeone who owes you",
}

---------------------------------------------------------------------------
-- Go-between of the two orders (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_go_between_1", from = "Saevrin Quietfoot", stranger = true, delay = 1200,
  when = { origin = "skyborne_go_between", minLevel = 6 },
  subject = "Somebody has to carry the messages",
  body = "{name},\n\nSince you left, the messages between the High Order and the Windshapers have gone through me, and I have discovered that I am terrible at it. Last week I carried a letter of apology that read like a threat, and a threat that read like an apology, and neither side noticed.\n\nThe quarrel over the old shrine has not gone away. Each side has a story about who struck first, and each story ends with someone's cousin in the ground. I am beginning to think nobody remembers the truth, only who told it last.\n\nYou were right to stop trusting them. I have not stopped yet, but I am trying.\n\nSaevrin",
}

P:Letter {
  id = "origin_skyborne_go_between_2", from = "Saevrin Quietfoot", stranger = true, delay = 2400,
  when = { origin = "skyborne_go_between", minLevel = 30 },
  subject = "Both sides asked after you",
  body = "{name},\n\nA strange thing happened this month. A magister from the Enclave and a Windshaper from Gev'rek each asked me, separately and within a week of each other, whether I had heard from you. Neither knew the other had asked, and I did not tell them.\n\nI think they miss having someone who listened to them both without taking sides. I am doing my best, but they can tell I am only pretending.\n\nWhatever you are doing out there, it has made your name worth something to both orders. That is a rare thing for any of us to have, so be careful with it.\n\nSaevrin",
}

---------------------------------------------------------------------------
-- Student of the Sky Enclave (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_sky_enclave_student_1", from = "Liraan Starweave", stranger = true, delay = 1200,
  when = { origin = "skyborne_sky_enclave_student", minLevel = 6 },
  subject = "From the Enclave",
  body = "{name},\n\nThe Enclave is very quiet without your experiments. Nobody has set a curtain on fire since you left, and the human apprentices across the courtyard have stopped looking over at our windows in hope.\n\nElaadrin Evengale asked after you at the last lecture and then said, in front of everyone, that a student who brings nothing useful home has wasted the Kirin Tor's patience as well as ours. I believe she meant it kindly, though it was difficult to tell.\n\nThe Dalaran libraries are as vast as you said, and as badly catalogued. I have found three books on wind magic so far, and two of them were wrong.\n\nLiraan, Dalaran",
}

P:Letter {
  id = "origin_skyborne_sky_enclave_student_2", from = "Liraan Starweave", stranger = true, delay = 2400,
  when = { origin = "skyborne_sky_enclave_student", cleared = "Shadowfang Keep" },
  subject = "Arugal",
  body = "{name},\n\nThe Kirin Tor do not speak about Arugal if they can help it, so when word came that he was dead in Shadowfang Keep, the halls went very quiet indeed. Then someone mentioned that it was a Skyborne who had done it, and every head in the room turned toward the Enclave.\n\nI think we have earned a little respect from the human magi today, and I think it was you who earned it. Elaadrin Evengale said nothing, but she went to her study smiling, which she does not do.\n\nArugal was one of their own once, and he went wrong in exactly the way they fear a mage might. Remember that the next time you think a spell is worth any price.\n\nLiraan",
}

---------------------------------------------------------------------------
-- Scholar of Luminarian's craft (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_luminarian_scholar_1", from = "Archivist Velaane Duskquill", stranger = true, delay = 1200,
  when = { origin = "skyborne_luminarian_scholar", minLevel = 6 },
  subject = "The notebook you left",
  body = "{name},\n\nYou left your notes on Luminarian's settings in my archive, and I have taken the liberty of reading them, as any archivist would. Your handwriting is atrocious, but your reasoning is not, and I spent two nights trying to follow it.\n\nThe young students have been complaining that their cantrips misfire more often than they used to. I tell them they must study harder. Privately, I have noticed the same in my own spells, and I am not sure study is the answer.\n\nI hope you find what you are looking for on the mainland. Luminarian never wrote down why the work came so easily, and I suspect nobody thought to ask.\n\nVelaane",
}

P:Letter {
  id = "origin_skyborne_luminarian_scholar_2", from = "Archivist Velaane Duskquill", stranger = true, delay = 2400,
  when = { origin = "skyborne_luminarian_scholar", cleared = "Uldaman" },
  subject = "The makers' halls",
  body = "{name},\n\nI am told you went down into Uldaman, where the dwarves say the makers of the world left their tools behind. I have read the reports from Ironforge, and I confess I stopped working for an entire afternoon just to think about them.\n\nLuminarian made things that lasted ten thousand years. Whoever built Uldaman made things that outlasted the world as it once was. If you saw anything down there that reminded you of the old craft, write it down at once, in your atrocious handwriting, before you forget.\n\nI have kept your notebook safe. It is beside my own now, and some days I think yours is the better of the two.\n\nVelaane",
}

---------------------------------------------------------------------------
-- Totem keeper of Camp Gev'rek (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_gevrek_totem_keeper_1", from = "Imaaru Stonewind", stranger = true, delay = 1200,
  when = { origin = "skyborne_gevrek_totem_keeper", minLevel = 6 },
  subject = "The totems at Gev'rek",
  body = "{name},\n\nI have been tending your totems along with mine since you left Camp Gev'rek. The plainstriders knocked over the east one twice this week, and a tauren child set the fire totem straight again before I could stop her, so now she thinks she is a shaman.\n\nAyessa Dawnsinger looked up at the sky for a long time at the last gathering. I do not know what she saw, and I did not ask. My own skysight was cloudy that night, which happens more often than I like to admit.\n\nWalk carefully among the elements down there, and listen for them, even when they are silent. Someone has to keep listening.\n\nImaaru, Camp Gev'rek",
}

P:Letter {
  id = "origin_skyborne_gevrek_totem_keeper_2", from = "Imaaru Stonewind", stranger = true, delay = 2400,
  when = { origin = "skyborne_gevrek_totem_keeper", cleared = "Razorfen Kraul" },
  subject = "The quilboar",
  body = "{name},\n\nThe tauren at Gev'rek tell me that you went into Razorfen Kraul and broke the quilboar there. Their elders have told the story three times since, and each time the thorns grow longer and you grow taller.\n\nThe quilboar have raided the plains for longer than any of us have been in Mulgore. I think the tauren were surprised that a Skyborne would fight for their land as if it were our own. I was not surprised, but I let them believe I was.\n\nThe little girl who straightened the fire totem has decided she wants to fight quilboar too. Her mother blames you entirely, and I have not tried to change her mind.\n\nImaaru",
}

---------------------------------------------------------------------------
-- Former acolyte of the Al'Aketh (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_skyborne_former_alaketh_1", from = "Naavira", stranger = true, delay = 1200,
  when = { origin = "skyborne_former_alaketh", minLevel = 6 },
  subject = "Your hair",
  body = "{name},\n\nI saw you leave Gev'rek with your hair grown out and the grey robes gone, and I wanted to tell you that I noticed, and that I was glad. I left the Al'Aketh too, a little after you did, though I did not have the courage to go as far.\n\nSome of the Windshapers still look at me as if I might light another beacon. I do not blame them. I would watch me too, if I were them.\n\nWe were told that the Windlord would lift us up. Instead we nearly brought him down upon everyone we loved. Do good work out there, {name}, and do enough of it that one day people forget the robes.\n\nNaavira",
}

P:Letter {
  id = "origin_skyborne_former_alaketh_2", from = "Naavira", stranger = true, delay = 2400,
  when = { origin = "skyborne_former_alaketh", minLevel = 30 },
  subject = "Someone asked my name",
  body = "{name},\n\nA Windshaper elder asked my name at the gathering this month, and then she asked me to help carry water for the offering. It was a small thing, and I cried behind the tents afterward like a child.\n\nI think the stories people tell about you out in the world have made it easier for the rest of us. When they hear that one of the old acolytes has done good, they look at the rest of us a little more kindly.\n\nMy hair is long enough to braid now. I put a feather in it, as we used to before the Al'Aketh told us such things were vanity. It looks foolish, and I am keeping it.\n\nNaavira",
}
