-- Stormwind, Old Town: the Pig and Whistle (Harry Burlguard, Bartleby, the barmaid and the cook),
-- the Protective Hide and the SI:7 front (Osborne, Jasper Fel). Voice: bibles/old_town.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "burlguard", id = TODO_NPC("Harry Burlguard"), name = "Harry Burlguard",
  bible = "bibles/old_town.md", role = "soldier", tier = "quest",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "light", "kin", "soldier" },
  impression = {
    first = "Harry Burlguard is an old soldier who holds court at a table in the Pig and Whistle and teaches young warriors by setting them on the regulars. He laughs more than he lets on.",
    third = "{name} met Harry Burlguard, an old veteran who teaches fighting from his table in the Pig and Whistle.",
  },

  greetings = {
    { id = "g_table", text = "Pull up a stool, if you can find one that isn't broken. Most of them are, round here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit down, then; my knees won't let me stand for you." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest in the Pig and Whistle. Somebody's going to need you before the night's out, mark me, and it'll probably be Bartleby." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind blood. Good, you'll know what an Old Town tavern's like on a Friday, so you won't be shocked when the stools start flying." },
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "You stand like you've been taught, but not taught enough. I can see where you'd drop your guard from here, and so will the next man who swings at you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Harry Burlguard. I carried a sword for the kingdom more years than you've been alive, and now I sit here and teach the young ones how to keep breathing. It's quieter, mostly." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("A Warrior's Training") },
          text = "Lyria sent you, did she? She's a fine teacher, and she knows when a student's ready for the rough part. Let's see what you've got, then." },
        { id = "h_bartleby", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby the Drunk") },
          text = "See the fellow at the end of the bar, the one cuddling his mug? That's Bartleby, and I want that mug, and he won't hand it over to you nicely." },
        { id = "h_beat", tags = { "news" }, when = { questActive = TODO_QUEST("Beat Bartleby") },
          text = "Go on, then, he's waiting. Keep your feet under you and your guard up, and don't hit him anywhere you'd be sorry to be hit." },
        { id = "h_mug", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby's Mug") },
          text = "I watched that, and it was well done! Now give me the mug and sit down, because you're about to learn a few things that'll keep you alive." },
        { id = "h_haggard", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Haggard") },
          text = "Haggard's manor is out by the Eastvale lumber camp, in Elwynn. Tell him Burlguard sent you, and if he's in a good mood, he'll find you a blade worth carrying." },
        { id = "h_haggard_done", when = { questDone = TODO_QUEST("Marshal Haggard") },
          text = "Haggard looked after you, then? He's kept more spare swords than any man I know, and I'm glad one of them found its way to you." },
      },
      again = {
        { id = "h_again", text = "What else? I've half a pint left and all evening." },
        { id = "h_again2", text = "Go on, ask. Old soldiers like being asked things." },
      },
      choices = {
        { text = "Teach me to fight.", next = "teach", when = { class = "WARRIOR" } },
        { text = "Why set your students on a drunk?", next = "bartleby" },
        { text = "What's the first thing you teach?", next = "lesson" },
        { text = "Do you miss soldiering?", next = "soldiering" },
        { text = "Who's Marshal Haggard?", next = "haggard",
          when = { any = { { questActive = TODO_QUEST("Marshal Haggard") }, { questDone = TODO_QUEST("Bartleby's Mug") } } } },
        { text = "Enjoy your pint.", next = "END" },
      },
    },

    teach = {
      lines = { { id = "t_default", text = "I teach the things a trainer can't, the dirty ones that a real fight demands. Stand behind your shield when it counts, crack your enemy's armor before you try to cut through it, and make sure the beast looks at you and not your friends." } },
      choices = {
        { text = "That sounds like more than a lesson.", next = "teach_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_more = {
      lines = { { id = "tm_default", text = "It's how you keep the people behind you alive, which is the whole job, whatever the songs say. A warrior who only thinks about killing is a warrior who'll die young." } },
      choices = {
        { text = "I fight for the ones behind me.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I fight to win. The rest can look after themselves.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    bartleby = {
      lines = { { id = "b_default", text = "Because a training dummy doesn't hit back, and a drunk who's fond of his mug does. You learn more in one fight with someone who doesn't want to lose than in a month of drills." } },
      choices = {
        { text = "Isn't it cruel to Bartleby?", next = "bartleby_cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bartleby_cruel = {
      lines = { { id = "bc_default", text = "He enjoys it more than they do, believe me. He gets his mug back every time, and a free round from me for his trouble, and he wouldn't miss it for the world." } },
      choices = {
        { text = "A fair arrangement, then.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Using a drunk for practice still isn't right.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },

    lesson = {
      lines = { { id = "l_default", text = "That the fight you walk away from is the one you win. Young ones hate hearing it, so I make them learn it with a drunk instead of an orc, because Bartleby forgives you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    soldiering = {
      big = true,
      lines = { { id = "s_default", text = "I miss the lads, not the marching. Now I watch the young ones go off to Westfall and Redridge, and some of them come back to tell me about it, and some don't." } },
      choices = {
        { text = "The ones who don't, you remember?", next = "soldiering_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiering_lost = {
      lines = { { id = "sl_default", text = "Every one of them. I don't say their names in here, because it's a tavern and folk come to forget, but I've a list, and I read it when the place is empty." } },
      choices = {
        { text = "Let me pray over that list with you.", next = "BACK", when = { class = "PRIEST" }, fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    haggard = {
      lines = { { id = "h2_default", text = "A retired marshal out by Eastvale, who kept half the gear from his career and gives it to young fighters who've earned it. He's suspicious of strangers, so walk up slow and say my name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Old soldiers drink here, and they talk when they drink. Ask me, and I'll tell you what I've heard over the rim of a mug." } },
    background = { { id = "tp_bg", text = "A soldier long enough to know better, and a teacher now. That's the whole of it, and I'll not dress it up.", next = "soldiering" } },
    advice = { { id = "tp_ad", text = "Keep your guard up even when you're winning, especially then. That's when they get you." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I've heard most things in this tavern." } },
  },
}

P:NPC {
  key = "bartleby", id = TODO_NPC("Bartleby"), name = "Bartleby", title = "Drunk",
  bible = "bibles/old_town.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "fierce" }, values = { "proud" },
  notices = { "light", "kin", "drink" },
  impression = {
    first = "Bartleby sits at the end of the Pig and Whistle's bar with his arms around his mug and dares the world to take it. He's spoiling for a fight and oddly gracious if he loses one.",
    third = "{name} met Bartleby, the Pig and Whistle's most stubborn drunk, and his beloved mug.",
  },

  greetings = {
    { id = "g_mug", text = "What're you looking at? It's my mug, and you can't have it." },
    { id = "g_beaten", when = { questDone = TODO_QUEST("Beat Bartleby") }, text = "Oh, it's you. Fair fight, that was, I'll give you that, but you're still not having it again." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Oh, a priest, here to tell me about the evils of drink, is it? Save your breath and buy me another, and I'll repent of that one." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A proper Stormwind sort, all clean boots and good manners. What's a fancy thing like you doing in the Pig and Whistle?" },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You're as drunk as I am! Sit down, sit down, you're the best company I've had all week." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bartleby's the name, and this is my mug, and this is my stool, and that's my end of the bar. Anybody who wants any of the three can try taking them." },
        { id = "h_drunk_q", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby the Drunk") },
          text = "Burlguard's sent another one, I can smell it. Look at you, so clean and pretty; mind you don't chip a nail on my face." },
        { id = "h_beat", tags = { "news" }, when = { questActive = TODO_QUEST("Beat Bartleby") },
          text = "You still want my mug after all that? You're mad, you are, and you'll have to take it off me, because I've never let go of a mug in my life." },
        { id = "h_mug", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby's Mug") },
          text = "There's more to you than clean boots, I'll say that. Take the mug back to Harry, then, and tell him I'm expecting my round." },
        { id = "h_mug_done", when = { questDone = TODO_QUEST("Bartleby's Mug") },
          text = "Harry gave it back, see, and filled it. Every one of you lot ends up buying me a drink eventually, one way or another." },
      },
      again = {
        { id = "h_again", text = "What? I'm busy drinking." },
        { id = "h_again2", text = "You still here? Buy a round or get on with it." },
      },
      choices = {
        { text = "What's so special about that mug?", next = "mug" },
        { text = "Hand it over, Bartleby.", next = "fight" },
        { text = "How many fights have you lost?", next = "record" },
        { text = "Shouldn't you go home?", next = "home" },
        { text = "Enjoy your drink.", next = "END" },
      },
    },

    mug = {
      lines = { { id = "m_default", text = "It's mine, that's what. Same mug every night for longer than I can remember, which isn't very long, admittedly, but it's the principle of the thing." } },
      choices = {
        { text = "A man should have his principles.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fight = {
      lines = {
        { id = "f_default", text = "Over my cold body, friend, and it's a warm body yet. Put up your fists, or put down your ideas." },
        { id = "f_warrior", when = { questActive = TODO_QUEST("Beat Bartleby") }, text = "Right, that's it! Let's see what Harry's been teaching you, then!" },
      },
      choices = {
        { text = "You've had enough tonight.", next = "fight_enough" },
        { text = "Never mind. Keep your mug.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then put up your fists.", next = "END", when = { class = "WARRIOR" }, fx = { trait = { brave = 1 } } },
      },
    },
    fight_enough = {
      lines = { { id = "fe_default", text = "Enough? There's no such thing as enough, there's only empty. And my mug's half full, so we're nowhere near it yet." } },
      choices = {
        { text = "Let him drink; it's his own business.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Somebody ought to cut you off for your own good.", next = "BACK", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },

    record = {
      big = true,
      lines = { { id = "r_default", text = "Lost? I don't lose, I rest between rounds. Harry sends me a new one every week or so, and they all go away with the mug and come back with a drink, so who's really winning?" } },
      choices = {
        { text = "You let them win.", next = "record_let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    record_let = {
      lines = { { id = "rl_default", text = "I never! I fight every one of them proper. Only, if they fight well, I give them the mug, because a good fight deserves a reward, and Harry always fills it after." } },
      choices = {
        { text = "That's decent of you, Bartleby.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "So you lose for free ale. Clever.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },

    home = {
      lines = { { id = "h2_default", text = "This is home, near enough. Elly brings the drinks and Reese keeps the fire and nobody asks me questions, except you, now." } },
      choices = { { text = "I'll stop asking, then.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything said at this bar, though I remember about half of it. Ask, and we'll see which half." } },
    background = { { id = "tp_bg", text = "I drink, I fight, I keep my mug. You want more than that, buy me another." } },
    advice = { { id = "tp_ad", text = "Never fight a man for his drink unless you're willing to buy him the next one. That's manners." } },
    _none = { { id = "tp_none", text = "How should I know? I've been here all night. And last night." } },
  },
}

P:NPC {
  key = "elly_langston", id = TODO_NPC("Elly Langston"), name = "Elly Langston", title = "Barmaid",
  bible = "bibles/old_town.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "friendly", "practical" },
  notices = { "light", "kin", "drink" },
  impression = {
    first = "Elly Langston carries the Pig and Whistle's drinks through a room full of soldiers and drunks without spilling a drop or losing her temper. She had my order before I'd finished giving it.",
    third = "{name} met Elly Langston, barmaid at the Pig and Whistle Tavern in Old Town.",
  },

  greetings = {
    { id = "g_drink", text = "What'll it be, love? Ale, wine or something you'll regret?" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, in here? I'll fetch you something gentle, love, and you can sit by the fire and pretend you're not judging us." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A local, I'd bet. You've the look of someone who's had a Pig and Whistle ale before and come back anyway." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had plenty already, love. I'll pour you water and charge you for ale, and you'll never know the difference." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Elly Langston, and I run the drinks round the Pig and Whistle while Reese keeps the taps. Sit where you like, except Bartleby's stool, because he bites." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Busy tonight, love, the soldiers are in. Shout if you need me and duck if you hear a stool." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've six mugs in each hand." },
        { id = "h_again2", text = "What else can I get you?" },
      },
      choices = {
        { text = "Let me see your drinks.", next = "BUSINESS" },
        { text = "Who are the regulars?", next = "regulars" },
        { text = "Is the food any good?", next = "food" },
        { text = "Not tonight.", next = "END" },
      },
    },
    regulars = {
      lines = { { id = "r_default", text = "Harry Burlguard at his table, teaching the young ones, and Bartleby at the end of the bar, getting taught. Then off-duty guards, and a few faces from that grey building across the way who never say what they do." } },
      choices = {
        { text = "The grey building?", next = "regulars_si7" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_si7 = {
      lines = { { id = "rs_default", text = "I don't ask, love, and they tip well for not asking. Old Town's like that; you learn which questions keep the tips coming." } },
      choices = {
        { text = "Smart. Some questions aren't worth asking.", next = "BACK", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "Secrets in a city are never a good sign.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Stephen's ribs are the best in the city, and he'll tell you it's his own recipe. Erika sells the spices, so if you want to try it at home, ask her, though it won't come out the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A barmaid hears every secret in Old Town, love, though she keeps most of them. Ask." } },
    background = { { id = "tp_bg", text = "I carry drinks at the Pig and Whistle, and I'm good at it. That's my story, and it's a busy one." } },
    advice = { { id = "tp_ad", text = "Never sit with your back to the door in Old Town, love. Everybody who matters already knows that." } },
    _none = { { id = "tp_none", text = "No idea, love. Ask Harry; he's been everywhere." } },
  },
}

P:NPC {
  key = "ryback", id = TODO_NPC("Stephen Ryback"), name = "Stephen Ryback", title = "Cooking Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "careful", "proud" },
  notices = { "light", "kin", "craft" },
  impression = {
    first = "Stephen Ryback cooks the best ribs in Old Town and handles a kitchen knife the way a soldier handles a sword. He says he's just a cook, in a voice that ends the subject.",
    third = "{name} met Stephen Ryback, the Pig and Whistle's cook and cooking trainer, who is just a cook, he says.",
  },

  greetings = {
    { id = "g_cook", text = "I don't get many cooks asking to learn, but I'll teach you if you're ready." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. You can bless the ribs if you like, but they're already the best thing in this tavern, so the Light has little to add." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "You'll have eaten Elwynn boar, then. Most folk cook it too fast, and I'll teach you not to." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook already, I can tell by the burn on your wrist. Everybody gets that one; it's how you know you've started." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Stephen Ryback. I cook for the Pig and Whistle and teach anybody who wants to learn, which isn't many, because most folk would rather eat than learn to." },
        { id = "h_back", when = { metBefore = true }, text = "You're back. Did the last lesson take, or did you burn it?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The ribs need turning." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's in the ribs?", next = "ribs" },
        { text = "The guards say you weren't always a cook.", next = "past" },
        { text = "Never mind.", next = "END" },
      },
    },
    ribs = {
      lines = { { id = "r_default", text = "My own recipe, and it stays mine. Low heat, a long time and Erika's spices, and that's more than I've told anybody else in this tavern." } },
      choices = {
        { text = "Erika's spices?", next = "ribs_erika" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs_erika = {
      lines = { { id = "re_default", text = "Erika Tate, by the hearth, sells cooking supplies at fixed prices. If you try to haggle, she'll tell you to go and find a goblin, and she'll mean it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      big = true,
      lines = { { id = "p_default", text = "The guards say a lot of things. I'm a cook, and I'm a good one, and that's all anybody in this tavern needs to know about me." } },
      choices = {
        { text = "A man's past is his own business.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "A cook doesn't hold a knife like that.", next = "past_knife", fx = { trait = { curious = 1 } } },
        { text = "Hiding the past usually means something to hide.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    past_knife = {
      lines = { { id = "pk_default", text = "A good cook holds a knife exactly like that. Sit down and eat something, and stop listening to guards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Folk talk while they eat. Ask, and I'll tell you what came back with the plates." } },
    background = { { id = "tp_bg", text = "I'm a cook. You can ask again, but you'll get the same answer.", next = "past" } },
    advice = { { id = "tp_ad", text = "Learn to cook what you kill. You'll eat better on the road, and you'll waste less." } },
    _none = { { id = "tp_none", text = "I'm a cook, and that isn't cooking." } },
  },
}

P:NPC {
  key = "simon_tanner", id = TODO_NPC("Simon Tanner"), name = "Simon Tanner", title = "Leatherworking Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "practical", "hardworking" },
  notices = { "light", "kin", "craft" },
  impression = {
    first = "Simon Tanner teaches leatherworking at the Protective Hide and has made his peace with students who leave for adventure halfway through. He spoke kindly of his dandy of an apprentice, and he meant it.",
    third = "{name} met Simon Tanner, the leatherworking trainer at the Protective Hide in Old Town.",
  },

  greetings = {
    { id = "g_hide", text = "Welcome to the Protective Hide. Mind the drying racks, they've hides on them older than you." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest in a tannery. The smell'll get into your robes, so I'd not stay long, unless you've come to learn." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Elwynn wolves and boar, that's where most of our hides come from. You'll have hunted a few yourself, I'd wager." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've been at it already, I can see the awl marks on your fingers. Let's see what you've learned, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Simon Tanner. I teach leatherworking, Randal helps when he's not admiring himself, and Jillian sells the thread and the dye if you've a project of your own." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "You skin, I can tell; there's always a little of the job left under a skinner's nails. Hides want working, and I can teach you how." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a hide soaking." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Tell me about Randal.", next = "randal" },
        { text = "Do your students stay?", next = "students" },
        { text = "Not today.", next = "END" },
      },
    },
    randal = {
      lines = { { id = "r_default", text = "Randal's something of a dandy, cares more about the colour of a jerkin than the stitching, but he's dependable, and that's rare. He'll make a fine leatherworker once the style stops getting in the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students = {
      lines = { { id = "s_default", text = "Not many. They learn enough to make a jerkin and then they're off to see the world in it, and I can't blame them, really, but it means I'm always teaching the first lessons." } },
      choices = {
        { text = "The world needs crafters more than heroes.", next = "students_more", fx = { align = { order = 1 } } },
        { text = "Let them go. Adventure's worth more than a trade.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    students_more = {
      lines = { { id = "sm_default", text = "I've said that for years, and nobody listens. Still, every hero in Stormwind's wearing something a crafter made, so we have our quiet revenge." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunters and skinners bring me their hides and their stories together. Ask, and I'll tell you what came in with them." } },
    background = { { id = "tp_bg", text = "A leatherworker and a teacher, in Old Town most of my life. The hides tell better stories than I do." } },
    advice = { { id = "tp_ad", text = "Skin carefully, because a torn hide's only fit for scraps. Patience at the carcass saves you coin at the bench." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know leather, and that's enough for one life." } },
  },
}

P:NPC {
  key = "osborne", id = TODO_NPC("Osborne the Night Man"), name = "Osborne the Night Man", title = "Rogue Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "cunning", "loyal" },
  notices = { "light", "kin", "stealth" },
  impression = {
    first = "Osborne the Night Man trains rogues outside SI:7's door and keeps one hand near his coin purse while he does it. He's dry, watchful and harder to read than he looks.",
    third = "{name} met Osborne the Night Man, the rogue trainer who stands outside SI:7 in Old Town.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You look like the sort I should keep an eye on my purse around. Good, that means you're learning." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "I don't think you want anything I teach, friend. Your own trainer's elsewhere." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, outside this door. Either you've come to confess for somebody inside, or you're lost, and I'll walk you back to the Cathedral either way." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born. You'll know that Old Town after dark belongs to people like me, then, so walk on the lit side of the street." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try, but I heard your boots on the third step. Lighter on the heel next time, and you might fool somebody slower." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me the Night Man, because I work late and I'm hard to see. I train the ones who come to SI:7's door, and I send away the ones who shouldn't have found it." },
        { id = "h_request", tags = { "news" }, when = { questActive = TODO_QUEST("A Simple Request") },
          text = "Lord Ravenholdt wants you, and that's all I'm told. Find his manor in the hills of Hillsbrad, northwest of Durnholde, and don't mention the invitation to anyone on the way." },
        { id = "h_request_done", when = { questDone = TODO_QUEST("A Simple Request") },
          text = "You went to the manor, then, and came back. Most do. What you do with Ravenholdt is between you and him, and I don't want to know." },
        { id = "h_renzik", when = { heardLine = "renzik.h_default" },
          text = "You've met Renzik. He talks about himself in the third person and I talk about myself as little as possible, and between us the door's well minded." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "This is my hour. The city's asleep and the alleys are honest about what they are, which is more than the day can say." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket" },
          text = "I know you; you were the canal brat who lifted a sergeant's purse off his belt in broad daylight, and I was the one who told Shaw to let it go. Don't make a liar of me, now." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Keep talking. Old Town has ears, so choose your words with that in mind." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why do they call you the Night Man?", next = "name" },
        { text = "What's behind that door?", next = "door" },
        { text = "Who's Lord Ravenholdt?", next = "ravenholdt", when = { class = "ROGUE", minLevel = 50 } },
        { text = "Do you trust the people you train?", next = "trust" },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "The Defias pay better than SI:7, I hear.", next = "defias_pay", when = { class = "ROGUE" } },
        { text = "Ironforge taught me a smuggler's tricks. Any use here?", next = "dwarf_rogue", when = { race = "Dwarf", class = "ROGUE" } },
        { text = "A gnome can go where your people can't.", next = "gnome_rogue", when = { race = "Gnome", class = "ROGUE" } },
        { text = "What do you make of the other trainers in the city?", next = "others" },
        { text = "I'll be going.", next = "END" },
      },
    },

    name = {
      lines = { { id = "n_default", text = "Because I do my best work after dark, and because it sounds better than Osborne the Man Who Stands By the Door. A rogue's name is half his reputation, so choose yours carefully." } },
      choices = {
        { text = "What would you call me?", next = "name_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_you = {
      lines = {
        { id = "ny_default", text = "Nothing yet, because names are earned. Come back when people in Old Town start lowering their voices when you walk by, and I'll think of something." },
        { id = "ny_priest", when = { class = "PRIEST" }, text = "The Shepherd, maybe, though I'd guess you'd prefer something less ironic. Give it time; Old Town will name you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    door = {
      big = true,
      lines = { { id = "d_default", text = "SI:7. The kingdom's eyes and ears, and its knife when it needs one. If you're not meant to be inside, you won't get further than me, and I'm much friendlier than what's past me.",
        fx = { learn = { "si7" } } } },
      choices = {
        { text = "A kingdom needs its knives.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Knives in the dark make for a frightened kingdom.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who runs it?", next = "door_shaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door_shaw = {
      lines = { { id = "ds_default", text = "Master Shaw, and Renzik under him, and that's more names than I should give you. Jasper sells supplies inside, if you've a reason to be there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ravenholdt = {
      lines = { { id = "r_default", text = "A lord in the Alterac foothills who keeps a manor full of people in our trade. He's no friend of the Syndicate and no servant of anyone, and he chooses his guests himself.",
        fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "Has he chosen me?", next = "ravenholdt_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenholdt_me = {
      lines = {
        { id = "rm_default", text = "Not yet, or I'd have a letter for you. Keep working; he has a way of noticing people who get good enough." },
        { id = "rm_ready", when = { questActive = TODO_QUEST("A Simple Request") }, text = "He has, and you've the summons. Go soon, and go quietly; he doesn't like to be kept waiting, and he likes being talked about even less." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trust = {
      lines = { { id = "t_default", text = "I trust them to be exactly what they are, which is thieves with a royal licence. That's more honest than most of the court can claim." } },
      choices = {
        { text = "Honest thieves. I like that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Standing still. Every new rogue wants to learn to move, and the ones who live learn to wait in a doorway for an hour without fidgeting. After that, poisons, and after that, patience again." },
        { id = "practise_old", when = { minLevel = 40 },
          text = "You've the hands already; now practise your exits. Every room you walk into, find two ways out before you find the mark, and if there's only one, you're the mark." },
      },
      choices = {
        { text = "An hour in a doorway? Surely not.", next = "practise_door" },
        { text = "I'll practise until nobody sees me.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    practise_door = {
      lines = { { id = "practise_door_l", text = "Two, some nights, and I've stood in this one longer than that. The fidgeters get noticed, and the noticed get a visit from someone like me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defias_pay = {
      big = true,
      lines = { { id = "defias_pay_l", text = "They do, at first, in coin they took off a farmer's corpse. VanCleef pays everyone well right up to the day he needs someone to hang for him, and that day always comes." } },
      choices = {
        { text = "Coin is coin, wherever it comes from.", next = "BACK", fx = { align = { honor = -2 }, affinity = -1 } },
        { text = "I'll not take a dead farmer's coin.", next = "BACK", fx = { affinity = 1, align = { honor = 2 } } },
        { text = "Why did VanCleef turn?", next = "defias_why" },
      },
    },
    defias_why = {
      lines = { { id = "defias_why_l", text = "Ask the nobles who never paid the Stonemasons, or ask Shaw, who knew him. I only know that a man with a grievance and a talent is the most dangerous thing in this city.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf_rogue = {
      lines = { { id = "dwarf_rogue_l", text = "More than you'd think. A smuggler knows which guards look at cargo and which look at faces, and that's half of what I teach. Just remember the Watch here doesn't take its bribes in ale." } },
      choices = {
        { text = "Then what does it take them in?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I've left that life behind.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gnome_rogue = {
      lines = { { id = "gnome_rogue_l", text = "Under tables, through vents and into the gaps between the crates. I've watched gnomes clear a warehouse while the guards were looking for someone tall, and I'd be a fool not to use that." } },
      choices = {
        { text = "So long as you don't call me small.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Use it, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    others = {
      lines = { { id = "others_l", text = "The Cathedral's lot are honest, which makes them easy to read, and the mages think we're beneath them, which makes them easy to rob. The ones under the Slaughtered Lamb, I watch, and so does everyone behind this door." } },
      choices = {
        { text = "And the warriors' hall?", next = "others_warriors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_warriors = {
      lines = { { id = "others_warriors_l", text = "Wu Shen and his lot drill by daylight and drink by night, a few doors down, and they think a rogue is a warrior who's lost his nerve. I let them think it; it's cheaper than correcting them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Plenty passes this door that never gets written down. Ask, and I'll decide what you can hear." } },
    background = { { id = "tp_bg", text = "I'm the Night Man. Anything before that was somebody else's life, and I've forgotten it on purpose." } },
    advice = { { id = "tp_ad", text = "Learn to listen before you learn to pick a lock. Most doors open once you know who has the key." } },
    si7 = { { id = "tp_si7", text = "The door behind me, and I'm all of it you'll see, unless you're one of us.", next = "door" } },
    _none = { { id = "tp_none", text = "Never heard of it, and I hear a great deal. Ask Renzik; he'll pretend he knows." } },
  },
}

P:NPC {
  key = "jasper_fel", id = TODO_NPC("Jasper Fel"), name = "Jasper Fel", title = "Shady Dealer",
  bible = "bibles/old_town.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "careful" },
  notices = { "light", "kin", "stealth" },
  impression = {
    first = "Jasper Fel sells poisons inside SI:7 in a voice meant for one listener at a time. He seemed to know more about my business than I'd told anybody, and he wanted me to notice.",
    third = "{name} met Jasper Fel, the soft-spoken dealer who sells supplies inside SI:7.",
  },

  greetings = {
    { id = "g_quiet", text = "Speak softly in here, friend. The wrong word in these rooms has cost men their throats." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, buying from me? I sell nothing that heals, friend, but if you need something that stops a heart, I'll keep your secret." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born. Good, you'll understand why we keep the Defias in our sights; they were Stormwind born too, most of them." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You're standing on the loose board, friend, so I've known you were there for a while. Come out and buy something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jasper Fel. I sell the tools of a quiet trade to the people who practise it, and I don't ask what they're for, so long as nobody asks me where I got them." },
        { id = "h_detonator", tags = { "news" }, when = { questActive = TODO_QUEST("Detonation at a Distance") },
          text = "You'll be wanting something that explodes from a safe distance, then. Something to do with your business in Moonbrook, I'd guess, and there's no need to look startled; SI:7 makes a habit of knowing what happens in the King's lands." },
        { id = "h_detonator_done", tags = { "news" }, when = { questDone = TODO_QUEST("Detonation at a Distance") },
          text = "I heard a bang from Westfall went off nicely. You were outside the caves, I trust, since you're standing here." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of ours. You'll want poisons, flash powder and the like, and I've the best in the city, at a fair price for a colleague." },
      },
      again = {
        { id = "h_again", text = "Anything else? Softly, please." },
        { id = "h_again2", text = "Yes? Lower your voice." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "How do you know about Moonbrook?", next = "moonbrook" },
        { text = "What does a shady dealer sell?", next = "wares" },
        { text = "Why keep quiet from my elf friend?", next = "alba",
          when = { any = { { questActive = TODO_QUEST("Detonation at a Distance") }, { questDone = TODO_QUEST("Detonation at a Distance") } } } },
        { text = "Want a gnome to look over that powder?", next = "gnome", when = { race = "Gnome" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    moonbrook = {
      big = true,
      lines = { { id = "m_default", text = "SI:7 keeps watch over all of Stormwind's lands, Westfall included, and Moonbrook more than most these days. Somebody under those hills is poisoning the farmland, and if you mean to blow it up, I'm inclined to help.",
        fx = { learn = { "deadmines", "defias", "moonbrook" } } } },
      choices = {
        { text = "Why not do it yourselves?", next = "moonbrook_why" },
        { text = "Glad to have SI:7 behind me.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather SI:7 wasn't watching me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook_why = {
      lines = { { id = "mw_default", text = "Because a crown agent caught in Westfall is a scandal, and an adventurer caught there is just unlucky. Be sure you're well outside before you set it off; our engineers' prototypes are reliable, but not that reliable." } },
      choices = {
        { text = "So I take the risk and you take the credit.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wares = {
      lines = { { id = "w_default", text = "Poisons, flash powder, blinding powder, lockpicks and the occasional thing with no name. Most customers are rogues, and the rest are people who'd rather I didn't say." } },
      choices = {
        { text = "Who's the rest?", next = "wares_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_rest = {
      lines = { { id = "wr_default", text = "Ask me that again and I'll have to wonder why you want to know. Better you don't, friend, and better I don't wonder." } },
      choices = {
        { text = "Some questions are best unasked. Agreed.", next = "BACK", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "A man who sells poison should answer for who buys it.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },

    alba = {
      lines = { { id = "a_default", text = "Because your kaldorei friend in Westfall has her own people to answer to, and SI:7 prefers not to appear in anyone's reports but its own. Tell her an engineer helped you, which is true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "A gnome offering to check my explosives, and I'm meant to feel safer? Go on, then, but if you start humming while you work, I'm leaving the room." } },
      choices = {
        { text = "Your fuses are too short, by the way.", next = "gnome2" },
        { text = "On second thought, I like my eyebrows.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    gnome2 = {
      lines = { { id = "gnome2_l", text = "Too short? I'll have a word with my supplier, quietly, and you'll forget you ever saw the crate. SI:7 appreciates a sharp eye, even one at belt height." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everything that comes through SI:7's door passes my counter sooner or later. Ask carefully, and I'll answer carefully." } },
    background = { { id = "tp_bg", text = "I sell supplies to SI:7. Before that, I sold them to somebody else, and that's all I'll say." } },
    advice = { { id = "tp_ad", text = "Never tell a man more than he needs to know, and never trust a man who tells you more than you need. Both will get you killed." } },
    si7 = { { id = "tp_si7", text = "You're standing in it, friend. Mind your voice." } },
    _none = { { id = "tp_none", text = "I don't sell that kind of information. Or any kind, to you, today." } },
  },
}
