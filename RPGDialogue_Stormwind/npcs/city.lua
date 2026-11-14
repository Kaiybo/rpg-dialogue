-- Stormwind's other powers and comforts: SI:7, the Wizard's Sanctum, the Slaughtered Lamb,
-- and the Gilded Rose. Voices: bibles/city.md (one bible, a section each).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Master Mathias Shaw: head of SI:7, Old Town. Cynical, loyal to the crown.
P:NPC {
  key = "shaw", id = TODO_NPC("Master Mathias Shaw"), name = "Master Mathias Shaw",
  bible = "bibles/city.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "lawful" },
  notices = { "stealth", "watch" },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Sit. I knew you were coming before you did." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You've wandered into the wrong building. Wander out the same way." },
    { id = "g_si7", when = { questActive = TODO_QUEST("Seek out SI:7") }, text = "Sylvius sent you. She thinks you're promising. She's said that before." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Third step from the door creaks. You stepped on it. Everyone does, the first time. That's why it's there." },
    { id = "n_watch", cat = "watch", when = { deed = "dungeon:The Deadmines" },
      text = "You've been under Moonbrook. I read the reports before you'd washed the mud off. That's my job." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shaw. I run SI:7. If you've heard of us, someone's been careless. If you haven't, we're doing our job." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("SI:7") },
          text = "You found the building. Good. Finding things people would rather you didn't is the whole job. You'll be doing a lot of it." },
        { id = "h_defias", when = { topicKnown = "defias", minLevel = 15 },
          text = "The Brotherhood wants Stormwind hollowed out from the inside. Every gang has a weak link. My people find it. Then I decide what to do with it." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "VanCleef. I trained him once, you know. I thought he'd come over to us. He went somewhere else entirely. I don't make that mistake twice." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A Skyborne. My people have a file on yours already. It's thin. That makes me uneasy, not you. Don't take it personally." },
      },
      choices = {
        { text = "What does SI:7 do?", next = "si7" },
        { text = "Who do you answer to?", next = "answer" },
        { text = "I'll go.", next = "END" },
      },
    },
    si7 = {
      lines = { { id = "s_default", text = "We worry, so the king doesn't have to. Currently that's a regent and a boy. So we worry twice as hard." } },
      choices = {
        { text = "That's a heavy job.", next = "END", fx = { affinity = 1 } },
        { text = "Can I help?", next = "help" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "Probably. Keep your eyes open and your mouth shut, and we'll find you when we need you. Don't come looking." } },
      choices = { { text = "Understood.", next = "END", fx = { affinity = 1, align = { order = 1 } } } },
    },
    answer = {
      big = true,
      lines = { { id = "a_default", text = "The House of Wrynn. Whoever's sitting in its chair. I serve the crown, not the court. There's a difference, and it's kept me alive." } },
      choices = {
        { text = "And the court?", next = "court" },
        { text = "Good answer.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    court = {
      lines = { { id = "c_default", text = "The nobles mean well, mostly. Lady Prestor means very well indeed. She's the only one who never asks me for anything." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Organized, funded, patient. Funded by whom is the question. I'm working on it." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle's a good man doing the crown's job without the crown's money. I send him what I can. Quietly." } },
    _none = { { id = "tp_none", text = "If SI:7 knew, it wouldn't be my place to say. If we didn't, it wouldn't be my place to admit it." } },
  },
}

-- Jennea Cannon: Wizard's Sanctum, Mage Quarter. Formal, mentoring.
P:NPC {
  key = "jennea", id = TODO_NPC("Jennea Cannon"), name = "Jennea Cannon", title = "Mage Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "curious", "lawful" },
  notices = { "arcane" },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "The Sanctum. Wipe your boots; the floor wards are sensitive." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Please don't touch the circles. They're not decorative." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage. I'd like to see what your people kept all those years. Your fundamentals first, though. Everyone's fundamentals have gaps." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jennea Cannon, of the Wizard's Sanctum. I teach mages who've outgrown the provinces. Some have. Most think they have." },
        { id = "h_speak", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Wefhellt sent you. He'll have said something flattering about me. Ignore it and listen to what I actually say." },
        { id = "h_mirror", when = { questActive = TODO_QUEST("Mirror Lake") },
          text = "Mirror Lake, just outside the city. Bring me what I asked for, and mind your reflection. It's only a reflection. Mostly." },
        { id = "h_recluse", when = { questActive = TODO_QUEST("Investigate the Blue Recluse") },
          text = "The Blue Recluse is a tavern, not a laboratory, whatever its regulars think. Find out what they're doing in there." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "I'll go.", next = "END" },
      },
    },
  },

  topics = {
    morganth = { { id = "tp_morganth", text = "His name is not spoken lightly in this building. He stole from us. He'll be stopped." } },
    _none = { { id = "tp_none", text = "Not a question for the Sanctum, I'm afraid. Try the library." } },
  },
}

-- Gakin the Darkbinder: the Slaughtered Lamb. Guarded; pays for discretion.
P:NPC {
  key = "gakin", id = TODO_NPC("Gakin the Darkbinder"), name = "Gakin the Darkbinder", title = "Warlock Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "ambitious" },
  notices = { "pet", "watch" },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Close the door behind you. Quietly. The people upstairs drink to forget us." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're lost. Stay lost, somewhere else." },
  },

  notice = {
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's doing what it's told. Good. Remember that obedience is a habit, not a nature. Keep it in the habit." },
    { id = "n_watch", cat = "watch", when = { ["not"] = { class = "WARLOCK" }, minLevel = 20 },
      text = "You've a look of someone who reports to someone. Whoever it is, tell them the Lamb is just a tavern." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gakin. I teach those who bind what others fear to name. Discretion is the first lesson and the last, and I pay well for it." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Marcot says you're ready for something from the Void. We'll see. The Void doesn't care what Marcot says." },
        { id = "h_surena", when = { questActive = TODO_QUEST("Surena Caledon") },
          text = "Surena. My student. She took something of mine and ran. Bring it back. What becomes of her is your business. Mostly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Who was Surena?", next = "surena", when = { questDone = TODO_QUEST("Surena Caledon") } },
        { text = "I'll go.", next = "END" },
      },
    },
    surena = {
      lines = { { id = "s_default", text = "A good student. Better than good. That's what made it hurt. Don't ask me again." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't trade in answers I don't have. I barely trade in the ones I do." } },
  },
}

-- Innkeeper Allison: the Gilded Rose, Trade District.
P:NPC {
  key = "allison", id = TODO_NPC("Innkeeper Allison"), name = "Innkeeper Allison",
  bible = "bibles/city.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "drink" },

  greetings = {
    { id = "g_rose", text = "In you come. The Gilded Rose has a bed for every tired pair of boots." },
    { id = "g_home", when = { homeInn = { "Stormwind City", "Gilded Rose" } }, text = "Welcome home. Your room's aired and the fire's lit." },
  },

  notice = {
    { id = "n_away", cat = "guest", when = { homeInn = { "Stormwind City", "Gilded Rose" }, daysSince = { min = 14 } },
      text = "There you are! Two weeks without a word. I'd started wondering whether to let your room. I didn't. I nearly did." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Someone's been to the Pig and Whistle first. Sit. Water. Then bread. Then we'll talk about wine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Allison. The Gilded Rose, between the bank and the auction house, which means everyone who comes in has either just got rich or just got poor. I feed both." },
        { id = "h_new", when = { maxLevel = 12 },
          text = "First time in the city? It's loud, it's big, and the canals are deeper than they look. Stay here and you'll at least get a decent breakfast." },
      },
      choices = {
        { text = "A room, please.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Just passing through.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Bankers complain about the nobles, nobles complain about the Regent, and everybody complains about Westfall. It's a normal week." } },
      choices = { { text = "Ha. Thanks.", next = "END" } },
    },
  },

  topics = {
    westfall = { { id = "tp_westfall", text = "The farmers who come through from there look ten years older than they are. I feed them first." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I hear everything at breakfast." } },
  },
}
