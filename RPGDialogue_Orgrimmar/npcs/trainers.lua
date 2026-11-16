-- Orgrimmar's trainers, from the Valley of Honor to the Cleft of Shadow. Voice: bibles/orgrimmar.md
-- Zevrost never names Neeru; the Cleft keeps its own secrets.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grezz", id = TODO_NPC("Grezz Ragefist"), name = "Grezz Ragefist",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "brave", "proud" },
  notices = { "class" },
  impression = {
    first = "Grezz Ragefist trains the warriors of Orgrimmar in the Valley of Honor, a loud, scarred orc who believes every lesson should leave a bruise.",
    third = "{name} met Grezz Ragefist, the warrior trainer in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Into the Valley of Honor, are you? Then stand like you mean it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Grezz Ragefist, and I train the Warchief's warriors. The Valley of Honor is named for what we earn here, so don't waste my time with anything less." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Another warrior come for lessons? Good, because the Horde can never have enough strong arms." },
      },
      choices = {
        { text = "What does honor mean to you?", next = "honor" },
        { text = "Who else trains in the valley?", next = "valley" },
        { text = "Farewell, Grezz.", next = "END" },
      },
      again = { { id = "h_again", text = "Still standing there? Then ask, and ask loudly." } },
    },
    honor = {
      lines = { { id = "o_default", text = "It means you face your enemy and you don't strike his back, even when he'd strike yours. The Warchief taught us that our fathers forgot it, and I won't let my students forget it twice." } },
      choices = {
        { text = "Honor is what makes us more than beasts.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honor is fine until it gets you killed.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Ormak teaches the hunters across the way, and the smiths work the forges behind us. Every one of them answers to the Warchief, and every one of them thinks his trade matters most." } },
      choices = { { text = "And which matters most?", next = "valley_best" } },
    },
    valley_best = {
      lines = { { id = "vb_default", text = "Mine, of course, because a smith's blade is just iron until a warrior swings it. Don't tell the smiths I said so, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and I know sweat. Anything else, ask Gryshka at the inn." } },
  },
}

P:NPC {
  key = "ormak", id = TODO_NPC("Ormak Grimshot"), name = "Ormak Grimshot",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Ormak Grimshot trains Orgrimmar's hunters in the Valley of Honor, a dry, patient orc who would rather watch a student's pet than the student.",
    third = "{name} met Ormak Grimshot, the hunter trainer in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the beasts. Most of them bite, and the rest are thinking about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Ormak Grimshot, and I teach the hunters of the Horde. Durotar is a hard land for game, so a hunter here learns to track things that would rather not be found." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion is with you, good. Now let's see if you've been worthy of it." },
      },
      choices = {
        { text = "How do you choose a companion?", next = "pet" },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
        { text = "Farewell, Ormak.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Make it quick, the wolves need feeding." } },
    },
    pet = {
      lines = { { id = "p_default", text = "You don't choose it, not truly, because the beast chooses whether to follow you. Feed it well, fight beside it, and never leave it behind in a fight." } },
      choices = {
        { text = "A companion is family.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A companion is a tool, a good one.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    hunt = {
      lines = { { id = "h1_default", text = "The Barrens, past the Crossroads, where the zhevra and the lions run. Durotar's scorpids make poor sport and worse eating." } },
      choices = { { text = "And further than that?", next = "hunt_far" } },
    },
    hunt_far = {
      lines = { { id = "h2_default", text = "Ashenvale, if you dare the night elves, and Stonetalon beyond it. A hunter goes where the game is, whatever the warlords say about borders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Unless it leaves tracks or wears fur, I've nothing to teach you about it." } },
  },
}

P:NPC {
  key = "kardris", id = TODO_NPC("Kardris Dreamseeker"), name = "Kardris Dreamseeker",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class" },
  impression = {
    first = "Kardris Dreamseeker trains the shaman of Orgrimmar in the Valley of Wisdom, near the Warchief's own teachers, and speaks of the spirits with quiet certainty.",
    third = "{name} met Kardris Dreamseeker, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits are restless in the city today. Come, sit where they are quieter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kardris Dreamseeker, and I guide the shaman of the Horde. The Valley of Wisdom is where the orcs came to remember what they were before the demons." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Welcome, shaman. Tell me, have the elements spoken to you clearly since we last met?" },
      },
      choices = {
        { text = "What were the orcs before the demons?", next = "before" },
        { text = "Why are the spirits restless?", next = "restless" },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you wish. Wisdom grows by sharing it." } },
    },
    before = {
      lines = { { id = "b_default", text = "Clans who honored the land and its spirits, and shaman who listened rather than commanded. The warlocks taught us to take, and the Warchief is teaching us again to ask." } },
      choices = { { text = "Can the old ways truly return?", next = "before_return" } },
    },
    before_return = {
      lines = { { id = "br_default", text = "They already have, in every shaman who answers the elements' call. It is slow, and some orcs still long for the fel, but the spirits are patient with us." } },
      choices = {
        { text = "Then those who cling to the fel must be stopped.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Each orc must find his own way back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    restless = {
      lines = { { id = "r_default", text = "A city is many voices, and some of them are angry. The spirits feel every grudge in Orgrimmar, and there are a great many of those." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits have not shown me that. Perhaps they will, in time." } },
  },
}

P:NPC {
  key = "zevrost", id = TODO_NPC("Zevrost"), name = "Zevrost",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class" },
  impression = {
    first = "Zevrost trains warlocks in the Cleft of Shadow, smooth-voiced and careful, and he insists that the power he teaches is a tool and nothing more.",
    third = "{name} met Zevrost, the warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Cleft. The shadows here are friendlier than the faces above, I promise you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zevrost, and I teach those with the will to command what others fear. The Warchief permits us, so long as we remember who serves whom." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Your demon is well leashed, I hope, because the guards above notice when it isn't." },
      },
      choices = {
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
        { text = "I'll go.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? Curiosity is the first step to power, after all." } },
    },
    ruin = {
      lines = { { id = "r_default", text = "The orcs were ruined by bowing to demons, not by learning their names. A warlock commands, and a slave obeys, and there is all the difference in the world between them." } },
      choices = { { text = "And if the demon wins?", next = "ruin_wins" } },
    },
    ruin_wins = {
      lines = { { id = "rw_default", text = "Then the warlock was weak, and the Horde is better rid of him. That is the price of the art, and every student of mine pays it willingly." } },
      choices = {
        { text = "Power like that should be watched closely.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Strength takes risks. The weak can stay above.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    cleft = {
      lines = { { id = "c_default", text = "The lowest part of the city, where rogues and warlocks and the less welcome trades keep their shops. The Warchief knows we are here, and that is enough for most of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Some things are better left unasked in the Cleft, friend." } },
  },
}
