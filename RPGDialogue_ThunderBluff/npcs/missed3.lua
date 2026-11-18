-- Thunder Bluff, the High Rise: the Ragetotem weapon merchants, Ohanko's great weapons, the gun
-- shop, Halpa's prairie dogs, the Mistrunners' cooking and fishing supplies, and Sura's war
-- harnesses. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Delgo Ragetotem: axe merchant on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "delgo_ragetotem", id = TODO_NPC("Delgo Ragetotem"), name = "Delgo Ragetotem", gender = "male", title = "Axe Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "gruff" }, values = { "strength", "honor" },
  notices = { "class", "race" },
  impression = {
    first = "Delgo Ragetotem sells axes on the High Rise, within sight of Cairne's lodge, and he hands each one over haft first with a look that asks whether the buyer deserves it. He is a Ragetotem, and his tribe has an old name for war.",
    third = "{name} met Delgo Ragetotem, the axe merchant on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. If you have come for an axe, show me your grip before you show me your coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and with all your fingers. The axe has been in good hands, then." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, good. My kinsmen Sark and Torm train your kind on Hunter Rise, and they send the promising ones to me." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Your people know the axe better than any, orc. Tell me what you think of the balance on these, and do not spare me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Delgo, of the Ragetotem. I sell the axes, and my kinsmen Etu and Kard sell the rest, so between us there is not a fight on Kalimdor we could not arm." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Speak plainly, as a Ragetotem would." },
      },
      choices = {
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "What is the Ragetotem's name for war?", next = "tribe" },
        { text = "An axe is a woodcutter's tool.", next = "tool" },
        { text = "Strength to you, Delgo.", next = "END" },
      },
    },
    tribe = {
      lines = { { id = "t_default", text = "When the centaur came down on the camps, it was the Ragetotem who went out to meet them so that the other tribes had time to move the calves. We paid for that in blood through more generations than the elders can count, and we do not regret a drop." } },
      choices = {
        { text = "And now that the centaur are driven off?", next = "now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now we teach, and sell, and take our turn on the bridges, and wait. There are quilboar in the south and dwarves in the Barrens, and I do not think the Earth Mother means us to grow soft just yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tool = {
      lines = {
        { id = "to_default", text = "So it is, and so is a totem only a log until a tauren lifts it. I will sell you one for firewood if that is all you want of it, but it would be a waste of a good edge." },
        { id = "to_orc", when = { race = "Orc" }, text = "You do not believe that any more than I do, orc. Your Warsong felled a forest with theirs and then an army, and I hear it was the same axes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ragetotem. I fought when there was fighting, and I arm those who will fight next." } },
    _none = { { id = "tp_none", text = "I do not know it, {class}, and I will not pretend to. Ask on the Elder Rise." } },
  },
}

---------------------------------------------------------------------------
-- Etu Ragetotem: mace & staff merchant on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "etu_ragetotem", id = TODO_NPC("Etu Ragetotem"), name = "Etu Ragetotem", gender = "male", title = "Mace & Staff Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "jovial", "loud" }, values = { "strength", "community" },
  notices = { "class" },
  impression = {
    first = "Etu Ragetotem sells maces and staves on the High Rise and laughs louder than any merchant on the bluff. He is as proud a Ragetotem as his kinsmen, but he would sooner share a drink than a glare.",
    third = "{name} met Etu Ragetotem, the mace and staff merchant on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Ho, {class}! Come and lift something heavy, for it is good for the spirit." },
    { id = "g_back", when = { metBefore = true }, text = "Ho, you are back! Has the last one broken, or has the thing you hit with it?" },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You will want a mace or a staff, {class}, and either way you are at the right pole. Delgo and Kard can only stand there and look sharp." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Etu Ragetotem! Delgo sells what cuts and Kard sells what stabs, and I sell what our people have always trusted, which is a large piece of wood with all your weight behind it." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I have breath enough for it." },
        { id = "h_again2", text = "Ask, {class}, ask!" },
      },
      choices = {
        { text = "Show me your maces and staves.", next = "BUSINESS" },
        { text = "Why do tauren favour the mace?", next = "mace" },
        { text = "Sunn Ragetotem sells staves too.", next = "sunn" },
        { text = "Good day, Etu.", next = "END" },
      },
    },
    mace = {
      lines = { { id = "m_default", text = "Because the first weapon any of us lifts is a log, friend, in the rites, when a young brave shows he can carry a totem. After that a mace is only a totem you may swing, and nobody has to teach a tauren which end goes forward." } },
      choices = {
        { text = "Did you carry a totem yourself?", next = "totem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    totem = {
      lines = { { id = "t_default", text = "I did, and I dropped it on my father's hoof in front of the whole camp. He limped for a moon and told everyone his son was already strong enough to cripple a bull, which was kind of him." } },
      choices = { { text = "A generous father. Something else.", next = "BACK" } },
    },
    sunn = {
      lines = { { id = "s_default", text = "My kinswoman, with her rainsticks! Hers are for those who want to call the rain, and mine are for those who want to knock something down, and we send each other the customers who came to the wrong pole." } },
      choices = {
        { text = "Who else do you keep company with up here?", next = "company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "c_default", text = "Sewa Mistrunner, who sells the fishing tackle, shares a horn of something with me most evenings when the shops are shut. She tells me about fish and I tell her about maces, and neither of us listens, and it is very restful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Ragetotem who laughs, which my kinsmen say is one too many." } },
    _none = { { id = "tp_none", text = "Ha, you have me there, {class}! I know wood and iron and little else." } },
  },
}

---------------------------------------------------------------------------
-- Kard Ragetotem: sword & dagger merchant on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kard_ragetotem", id = TODO_NPC("Kard Ragetotem"), name = "Kard Ragetotem", gender = "male", title = "Sword & Dagger Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry", "sharp" }, values = { "craft", "strength" },
  notices = { "class", "race" },
  impression = {
    first = "Kard Ragetotem sells swords and daggers on the High Rise, though a dagger looks like a splinter in his hand. He is the quietest of the three Ragetotem weapon merchants and the one with the keenest eye for an edge.",
    third = "{name} met Kard Ragetotem, the sword and dagger merchant on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. The long blades are on the left and the short ones on the right, and I will thank you not to test either on the tent pole." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Let me see the edge, and I will tell you what you have been hitting." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You look at the daggers the way Etu looks at his supper, {class}. Good, for they deserve someone who will use them properly." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of our own, at the sword rack. Do not let Delgo see you here, or he will tell you a blade is no weapon for a tauren." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kard, of the Ragetotem. My kinsmen sell what our people have always carried, and I sell what our allies carry, because an orc or a Forsaken ought not to leave the bluff unarmed." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, and mind the points." },
      },
      choices = {
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "A dagger seems small for a tauren.", next = "small" },
        { text = "Who buys the daggers?", next = "buys" },
        { text = "Keep them sharp, Kard.", next = "END" },
      },
    },
    small = {
      lines = { { id = "s_default", text = "It is, and I cannot use one for anything but cutting fruit. But I learned edges by sharpening spearheads, and an edge is an edge, whether it is as long as my arm or shorter than my thumb." } },
      choices = {
        { text = "How do you judge a good edge?", next = "edge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge = {
      lines = { { id = "e_default", text = "I draw it across a single dry blade of plains grass, held loose between two fingers. A good edge parts the grass and never moves it, and a poor one pushes it aside, and you would be surprised how many swords from Orgrimmar push." } },
      choices = { { text = "I'll remember the grass. Something else.", next = "BACK" } },
    },
    buys = {
      lines = {
        { id = "b_default", text = "The Forsaken from the Pools of Vision, mostly, and the trolls. They come up quietly, pay without haggling and leave quietly, and Delgo watches them the whole way to the bridge." },
        { id = "b_scourge", when = { race = "Scourge" }, text = "Your own people, more than anyone. They come quietly and pay in full, and I have told my kinsmen that I would rather have a silent ally than a loud one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sharpened spears for my tribe's braves, and the swords came later, with the Horde." } },
    _none = { { id = "tp_none", text = "That has no edge I can test, {class}, so I have no judgment of it." } },
  },
}

---------------------------------------------------------------------------
-- Ohanko: two-handed weapon merchant on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "ohanko", id = TODO_NPC("Ohanko"), name = "Ohanko", gender = "male", title = "Two Handed Weapon Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "grave" }, values = { "honor", "strength" },
  notices = { "class" },
  impression = {
    first = "Ohanko sells the great two-handed weapons on the High Rise, mauls and polearms taller than an orc. He is a very large, very calm tauren who talks about a weapon's weight as a kind of responsibility.",
    third = "{name} met Ohanko, the two-handed weapon merchant on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, {class}. Lift what you like, but lift it with both hands, for these were not made for one." },
    { id = "g_back", when = { metBefore = true }, text = "You return, friend. The weight has settled into your arms since I saw you last." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "You stand like one who commits to a blow, {class}. That is the whole of the art with these, for there is no taking a swing back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ohanko. I sell the weapons that ask for both of your hands, which means they ask you to give up your shield, and nobody should make that bargain without thinking on it first." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}?" },
        { id = "h_again2", text = "Speak, friend, and take your time." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why give up the shield?", next = "shield" },
        { text = "These look like totems with edges.", next = "totems" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "s_default", text = "Because some things must be ended in one blow or not at all. A kodo bull does not circle, {class}, and when one of our braves stands before a centaur khan, he would rather be the kodo." } },
      choices = {
        { text = "And if the one blow misses?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Then you had better have friends nearby, which is the other half of the lesson. Nobody carries one of these alone into a fight who expects to walk home, and I tell every buyer so before I take a coin." } },
      choices = { { text = "Honest advice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    totems = {
      lines = {
        { id = "t_default", text = "You are closer than you know. The oldest of them were totem poles, taken up in haste when a camp was attacked, and the tribes found that a pole a brave has prayed beside strikes harder than one he has not." },
        { id = "t_tauren", when = { race = "Tauren" }, text = "As you well know, young one. Your own grandfathers swung their camp's totem when the centaur came by night, and the mauls on my rack are only that memory given a better grip." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a maul for my tribe until my knees asked me to stop, and now I choose who carries them next." } },
    _none = { { id = "tp_none", text = "I cannot weigh that for you, friend. It is not a thing I have held." } },
  },
}

---------------------------------------------------------------------------
-- Hogor Thunderhoof: guns merchant at Thunderhoof's Firearms, High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "hogor_thunderhoof", id = TODO_NPC("Hogor Thunderhoof"), name = "Hogor Thunderhoof", gender = "male", title = "Guns Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "enthusiastic", "stubborn" }, values = { "practical", "craft" },
  notices = { "class", "profession" },
  impression = {
    first = "Hogor Thunderhoof runs Thunderhoof's Firearms on the High Rise and is the bluff's loudest believer in the gun. He has heard every objection the elders can raise and enjoys answering them one by one.",
    third = "{name} met Hogor Thunderhoof, who sells guns at Thunderhoof's Firearms in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Thunderhoof's, {class}! Do not mind the smell, for that is only powder, and powder is the smell of a full cook pot." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! Tell me you have come for shot, because that means you have been using it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Now be honest with me, {class}: bow or gun? There is a right answer, and I sell it." },
    { id = "n_eng", cat = "profession", when = { profession = "Engineering" },
      text = "An engineer, by the scorch marks. Come and look at this lock with me, for I think the goblin who made it was drunk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Hogor Thunderhoof, and I sell thunder by the barrel. The elders call it a goblin toy, but half the young hunters at Camp Narache carry one, and they are bringing home plainstrider all the same." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I can talk guns until An'she sets." },
        { id = "h_again2", text = "Ask, friend, and I will try to be brief, though I promise nothing." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "What do the elders have against guns?", next = "elders" },
        { text = "Kuna Thunderhorn would say a bow is better.", next = "bow" },
        { text = "Keep your powder dry, Hogor.", next = "END" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "They say the hunt is a prayer and that a prayer ought to be quiet. I say a clean kill is the most respectful thing a hunter can offer a beast, and a gun kills cleaner than a young arm that has not yet learned to draw." } },
      choices = {
        { text = "Has anyone on the Elder Rise come round?", next = "round" },
        { text = "Something else.", next = "BACK" },
      },
    },
    round = {
      lines = { { id = "r_default", text = "Not in so many words. But one of them sent a grandson to me last spring with coin and no message, and the lad said his grandfather's eyes were not what they were for the bow, so I count that as an answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bow = {
      lines = {
        { id = "b_default", text = "Kuna would, and she makes a lovely bow, and I have told her so across the bridge many times. But wet weather ruins a string and a strong wind ruins the shot, and my guns mind neither." },
        { id = "b_hunter", when = { class = "HUNTER" }, text = "Kuna would, and you should try hers, {class}, and then try mine, and then come back and tell me to my face which one fed you. I am not afraid of the answer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I bought my first gun from a goblin at Ratchet, took it apart that night, and have been selling them ever since." } },
    _none = { { id = "tp_none", text = "That is beyond me, {class}. If it does not go bang, I have probably not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Halpa: prairie dog vendor in a small hut on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "halpa", id = TODO_NPC("Halpa"), name = "Halpa", gender = "male", title = "Prairie Dog Vendor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "shy" }, values = { "kind", "devout" },
  notices = { "pet", "class" },
  impression = {
    first = "Halpa sells prairie dogs from a small hut on the High Rise that faces out over the plains, away from the rest of the city. He is a gentle, soft-voiced tauren, and there is usually a prairie dog asleep in the crook of his arm.",
    third = "{name} met Halpa, the prairie dog vendor on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello, {class}. Speak softly, if you would, because this one has only just gone to sleep." },
    { id = "g_back", when = { metBefore = true }, text = "You found my hut again, friend. Most people walk straight past it." },
  },
  notice = {
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER" },
      text = "Please keep your companion a little way back, {class}. I am sure it is well behaved, but my small ones do not know that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Halpa, and I find homes for prairie dogs. They are good company for a traveller, because they ask for very little and they are always pleased to see you." },
      },
      again = {
        { id = "h_again", text = "Was there something else, friend?" },
        { id = "h_again2", text = "Ask quietly, {class}, and I will answer." },
      },
      choices = {
        { text = "Let me see the prairie dogs.", next = "BUSINESS" },
        { text = "Why does your hut face away from the city?", next = "hut" },
        { text = "Where do you find them?", next = "find" },
        { text = "I'll let it sleep. Farewell.", next = "END" },
      },
    },
    hut = {
      lines = { { id = "hu_default", text = "So that they can see the plains, and so can I. A prairie dog who cannot see grass grows sad, and I think a tauren does too, though we are slower to notice it in ourselves." } },
      choices = {
        { text = "Do you miss the plains, up here?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = {
        { id = "m_default", text = "Every morning, a little. The bluff keeps us safe and I am grateful for it, but I was born under open sky, and so I sit where I can still see the whole of it." },
        { id = "m_tauren", when = { race = "Tauren" }, text = "Every morning, as I expect you do when you are far from Mulgore. We are a walking people who have learned to stand still, and it will take more than one generation before our hooves believe it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    find = {
      lines = { { id = "f_default", text = "I do not take them from their burrows, if that is what you fear. The swoops and the prairie wolves leave orphans behind, and the hunters know to bring those to me, and I raise them until they are steady enough to travel." } },
      choices = { { text = "That is good work, Halpa. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was never much of a hunter, friend. I kept bringing things home alive." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. Not much news comes round to this side of the rise." } },
  },
}

---------------------------------------------------------------------------
-- Naal Mistrunner: cooking supplies at Aska's Kitchen, High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "naal_mistrunner", id = TODO_NPC("Naal Mistrunner"), name = "Naal Mistrunner", gender = "male", title = "Cooking Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "harried" }, values = { "family", "community" },
  notices = { "profession" },
  impression = {
    first = "Naal Mistrunner sells spices, flour and cooking gear at Aska's Kitchen on the High Rise, between errands for Aska herself. He is forever being called to fetch something from the back, and he goes cheerfully every time.",
    third = "{name} met Naal Mistrunner, who sells cooking supplies at Aska's Kitchen in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Aska's Kitchen, {class}! Spices are here, the fire is over there, and if Aska calls my name I will be straight back." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! Did the spice do what I said it would?" },
  },
  notice = {
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "You have a cook's burns on your knuckles. Then you will want the hot spices and not the mild, and I will not insult you by asking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Naal, of the Mistrunners. Aska teaches the cooking and I sell what goes into the pot, and I also carry the water, chop the roots and taste whatever she is unsure of." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Quickly, before she wants the salt." },
        { id = "h_again2", text = "Ask away, friend." },
      },
      choices = {
        { text = "Show me your cooking supplies.", next = "BUSINESS" },
        { text = "Is Aska hard to work for?", next = "aska" },
        { text = "What do tauren cook that others don't?", next = "cook" },
        { text = "Thank you, Naal.", next = "END" },
      },
    },
    aska = {
      lines = { { id = "a_default", text = "She is family, so she is as hard as she likes and I may not complain. But she has never once let anyone leave this kitchen hungry, not even the Forsaken who cannot taste it, and I am proud to carry water for that." } },
      choices = {
        { text = "What does she feed the Forsaken?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Whatever is in the pot, with twice the pepper, because one of them told her he could almost feel that. She has been adding more every week since, and I fear for the tongue of the first living soul who takes his bowl by mistake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "c_default", text = "Slowly, for one thing. Kodo and plainstrider want a long fire and a covered pit, and the corn bread bakes in the ashes beside them, so a proper meal is begun in the morning and eaten when the stars are out." },
        { id = "c_orc", when = { race = "Orc" }, text = "Anything slowly, which your people find very hard to bear. An orc wants his boar off the fire while it is still arguing, and Aska has sent more than one of you back to sit down and wait." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Mistrunner is born holding a ladle, they say. I was born holding the bucket." } },
    _none = { { id = "tp_none", text = "I could not tell you, {class}. Ask Aska, when her hands are not full." } },
  },
}

---------------------------------------------------------------------------
-- Sewa Mistrunner: fishing supplies on the High Rise, beside Kah.
---------------------------------------------------------------------------
P:NPC {
  key = "sewa_mistrunner", id = TODO_NPC("Sewa Mistrunner"), name = "Sewa Mistrunner", gender = "female", title = "Fishing Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easy", "wry" }, values = { "patient", "family" },
  notices = { "profession" },
  impression = {
    first = "Sewa Mistrunner sells poles, lines and lures on the High Rise, beside the pond where her kinsman Kah teaches fishing. She has the unhurried humour of someone who has spent a great many hours waiting for a bite.",
    third = "{name} met Sewa Mistrunner, who sells fishing supplies on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. If you have come to fish on top of a mountain, you are in the right company." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend. Did they bite, or did you only feed them?" },
  },
  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "You have the squint of someone who watches a float, {class}. Sit down, then, for you will not be in a hurry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sewa, of the Mistrunners. Kah teaches people to fish in the pond up here, and I sell them the line they will lose in it." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The fish are not going anywhere, and nor am I." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "Show me your fishing supplies.", next = "BUSINESS" },
        { text = "How is there a pond on a mesa?", next = "pond" },
        { text = "Where is the best fishing in Mulgore?", next = "best" },
        { text = "Etu says you share a horn in the evenings.", next = "etu", when = { heardLine = "etu_ragetotem.c_default" } },
        { text = "Tight lines, Sewa.", next = "END" },
      },
    },
    pond = {
      lines = { { id = "p_default", text = "The rain fills it and a spring under the rock keeps it, or so the shaman say, and I have never seen it dry. Kah stocked it himself with fish carried up the lift in waterskins, which is the most Mistrunner thing anyone has ever done." } },
      choices = {
        { text = "Did they all survive the lift?", next = "lift" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lift = {
      lines = { { id = "l_default", text = "Most of them, though one skin split halfway up, and I am told the Bluffwatcher underneath it has not forgiven our family yet. The fish that lived have grown fat and clever, and they know every lure I sell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "Stonebull Lake, below Bloodhoof Village, early, before the kodo come down to drink and muddy it. Uthan Stillwater teaches there, and he will tell you the same thing in three times as many words." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    etu = {
      lines = { { id = "e_default", text = "We do, and he talks about maces the whole time, and I let it wash over me like a stream over a stone. He is good company for a Ragetotem, because he would rather laugh than be right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Mistrunners feed the bluff, and I am the one who would rather sell the hook than clean the fish." } },
    _none = { { id = "tp_none", text = "I have not had a bite on that one, {class}. Try Kah, who hears what the fishers say." } },
  },
}

---------------------------------------------------------------------------
-- Sura Wildmane: war harness vendor on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "sura_wildmane", id = TODO_NPC("Sura Wildmane"), name = "Sura Wildmane", gender = "female", title = "War Harness Vendor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "exacting" }, values = { "craft", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "Sura Wildmane sells war harnesses on the High Rise: the great crossed straps and shoulder pieces that tauren braves wear into battle. She fits each one herself, tugging every buckle hard enough to rock the wearer on their hooves.",
    third = "{name} met Sura Wildmane, the war harness vendor on Thunder Bluff's High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Stand straight, {class}, and let me look at the breadth of you. A harness that slips is worse than none." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has it rubbed anywhere, for if it has, I want to know where?" },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Good, someone I need not explain a harness to. Lift your arms, young one, and tell me when it pinches." },
    { id = "n_small", cat = "race", when = { race = { "Troll", "Orc", "Scourge" } },
      text = "I cut these for tauren shoulders, friend, though I have taken a few in for orcs. I make no promises, but I will measure you honestly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sura Wildmane. A war harness carries a brave's totem, his weapons and the marks of his tribe, and it has to do all three while he is running at something that wants him dead." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, and hold still while you do." },
      },
      choices = {
        { text = "Show me your harnesses.", next = "BUSINESS" },
        { text = "What are the marks of a tribe?", next = "marks" },
        { text = "The Wildmane are druids, aren't they?", next = "wildmane" },
        { text = "Honor to you, Sura.", next = "END" },
      },
    },
    marks = {
      lines = { { id = "m_default", text = "Beads, feathers and painted sign, each tribe in its own colours, so that a brave who falls can be known and carried home to Red Rocks. I will not sell a harness bare, because nobody ought to go into battle as a stranger." } },
      choices = {
        { text = "What of one who has no tribe?", next = "notribe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notribe = {
      lines = {
        { id = "nt_default", text = "Then I mark it for the Horde, in red, and for Thunder Bluff, where it was made. That is tribe enough, and Cairne himself has said that those who shed blood beside us will be mourned beside us." },
        { id = "nt_tauren", when = { race = "Tauren" }, text = "There is no tauren without a tribe, young one, only some who have not been told theirs. Tell me your mother's camp, and I will find the colours." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wildmane = {
      lines = { { id = "w_default", text = "Many of us are, and my kin Nara and Kym walk that path on the Elder Rise. I had no gift for it, but a druid who goes to war still needs something to hold her staff, and so the family comes to me at last." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fitted harnesses since before the bluff was settled, and I have buried some of those I fitted." } },
    _none = { { id = "tp_none", text = "I cannot fit an answer to that, {class}. Ask among the elders." } },
  },
}
