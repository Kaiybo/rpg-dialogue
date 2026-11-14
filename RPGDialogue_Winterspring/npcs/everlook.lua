-- Everlook: the Steamwheedle Cartel's trading post at Winterspring's crossroads. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "vizzie", id = TODO_NPC("Innkeeper Vizzie"), name = "Innkeeper Vizzie",
  bible = "bibles/winterspring.md", role = "innkeeper", tier = "service",
  communities = { "everlook" }, temper = { "jumpy" }, values = { "friendly", "practical" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in, shut the door, shut it! The cold gets in. And the bugs. You didn't bring any bugs, did you?" },
    { id = "g_home", when = { homeInn = { "Everlook" } }, text = "Welcome back! Warm bed, hot drink, no bugs. I checked. Twice." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look frozen through and then some. Sit by the fire. Slowly. Thawing hurts." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Careful out there in that state. People fall asleep in the snow and wake up as a furbolg's breakfast." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Vizzie. Best inn in Everlook. Only inn in Everlook, but that doesn't make it not the best. Warmest place for a hundred miles, and the cold keeps the creepy-crawlies down. Mostly." },
        { id = "h_bugs", tags = { "gossip" },
          text = "People ask why a goblin would run an inn at the top of the world. Two words. No. Bugs. Well. Fewer bugs. There's still that one beetle. I know it's in here." },
      },
      choices = { { text = "A room, please.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel set this place up for trade. I set up the inn because traders need beds. Good business. Cold business." } },
    _none = { { id = "tp_none", text = "No idea, sugar. Ask a trader. They know everything worth money." } },
  },
}

P:NPC {
  key = "umi", id = TODO_NPC("Umi Rumplesnicker"), name = "Umi Rumplesnicker",
  bible = "bibles/winterspring.md", role = "trainer", tier = "service",
  communities = { "everlook" }, temper = { "playful" }, values = { "inventive", "mischievous" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_shop", text = "Oh! Customer! Don't touch that. Or that. That one's fine. No, wait, don't touch that either." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Then you know: a good invention is half engineering and half making your friends scream." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Umi Rumplesnicker, engineer! I teach, I tinker, and right now I'm building something wonderful. It's big, it's furry, it's mechanical, and it's going to scare the bolts off every goblin I know." },
        { id = "h_yeti", tags = { "news" }, when = { questActive = TODO_QUEST("Are We There, Yeti?") },
          text = "Yeti parts! Real fur, real horns. The mechanical bits I've got. Bring me the rest and we'll make a monster." },
        { id = "h_own", when = { questActive = TODO_QUEST("A Yeti of Your Own") },
          text = "An engineer who wants a yeti of their own? Oh, you have good taste. Let me show you how it's done." },
      },
      choices = {
        { text = "Who are you scaring?", next = "prank" },
        { text = "I'll find parts.", next = "END", fx = { affinity = 2 } },
      },
    },
    prank = {
      lines = {
        { id = "p_default", text = "My friends! All of them! They've been laughing at my inventions for years. Let's see them laugh when a yeti comes round the corner. Then they can laugh. After." },
      },
      choices = { { text = "Count me in.", next = "END", fx = { affinity = 3, trait = { curious = 1 } } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their whole city to their own machines. I just want to frighten a few people. Small scale. Responsible." } },
    _none = { { id = "tp_none", text = "Never heard of it. Does it have gears?" } },
  },
}

P:NPC {
  key = "gregor", id = TODO_NPC("Gregor Greystone"), name = "Gregor Greystone",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook", "argent_dawn" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hello", text = "Good day to you, and may the Light keep you warm. Winterspring could use the help." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own. The Dawn could use you, friend, when you're ready for the Plaguelands." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. The Dawn takes anyone who fights the Scourge, and you've more cause than most. Welcome." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gregor Greystone, of the Argent Dawn. I keep the Dawn's interests here among the Cartel's traders. Horde and Alliance both pass through Everlook. The Scourge doesn't care which banner you fly, so neither do we." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "My report. Carry it to Argent Officer Pureheart for me. Every set of eyes the Dawn has counts." },
        { id = "h_duke", when = { questActive = TODO_QUEST("Duke Nicholas Zverenhoff") },
          text = "Duke Zverenhoff will want to meet you. Not many walk into the Plaguelands of their own will. Fewer walk out." },
      },
      choices = {
        { text = "Tell me about the Argent Dawn.", next = "dawn" },
        { text = "I'll carry word.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    dawn = {
      big = true,
      lines = {
        { id = "d_default", text = "We stand against the Scourge, and anything else that would end this world. No crown, no warchief. Humans, dwarves, orcs, tauren, even the Forsaken. Light's Hope Chapel in the east is our heart. Out here, I'm one of our ears." },
      },
      choices = { { text = "I'd like to help.", next = "END", fx = { affinity = 3, learn = { "argent_dawn" } } } },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_argent_dawn", text = "Prove yourself against the Scourge, and the Dawn will remember you. We keep good records." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They began where we began, with the dead walking in Lordaeron. They took a darker road. Pity them. Then stay away from them." } },
    _none = { { id = "tp_none", text = "I can't say. But I'd ask it at Light's Hope if it touches the Scourge." } },
  },
}
