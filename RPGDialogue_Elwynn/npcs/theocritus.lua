-- Theocritus, Mage of the Tower of Azora. Voice: bibles/theocritus.md
-- Above everyday affairs, except one: Morganth.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "theocritus", id = TODO_NPC("Theocritus"), name = "Theocritus", title = "Mage of Tower Azora",
  bible = "bibles/theocritus.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane", "fel" },
  impression = {
    first = "Theocritus looked at me as if I were an interruption to more important work, and in his own tower I probably was. His gnomes seem to do most of the stair-climbing.",
    third = "{name} climbed the Tower of Azora to meet Theocritus, a mage with little patience and a great deal to do.",
  },

  greetings = {
    { id = "g_stairs", text = "You climbed all those stairs, which is admirable, if probably pointless." },
    { id = "g_morganth", when = { questActive = TODO_QUEST("Morganth") }, text = "Is he dead yet? If not, why are you standing in my tower?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Morganth") }, text = "Ah, the one who dealt with Morganth. You may sit, though not on that." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage, and your robes are dreadful. Never mind; Morley could do something with you, as he does with everyone." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You reek of the Nether. So did Morganth, before he went wrong. I will be watching you closely, and you will not enjoy it." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "Something fel has had its fingers in you. Stand by the window, please; I'd like it to be the first thing I see if you change shape." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Theocritus, and this is my tower. The gnomes are my servants, and you're not to tip them because it confuses them. Now, what do you want?" },
        { id = "h_low", when = { maxLevel = 17 },
          text = "You are very young and I am very busy. Come back when you've survived something interesting." },
        { id = "h_before", when = { minLevel = 18, questBefore = TODO_QUEST("Morganth") },
          text = "A man in Redridge, in the Tower of Ilgalar, once studied with Stormwind's mages until he went wrong. He is my problem." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Morganth") },
          text = "Morganth commands the Shadowhide gnolls and thinks himself a lord. Remind him otherwise. Permanently, if you'd be so kind." },
        { id = "h_eye", when = { questActive = TODO_QUEST("A Watchful Eye") },
          text = "The Eye of Azora sees far, but not far enough. That is where you come in, regrettably." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morganth"), days = 3 } },
          text = "Gone, truly? Then Stormwind is a little safer, and I am a great deal less bored than I expected to be, which is not a complaint." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 20 },
          text = "The Mage Quarter sends me its brighter students now and then. You might do, possibly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor have been insufferable about your people lately, I'm told: Highborne magisters' children, back from wherever they were. I'd like to see what the fuss is about, but later." },
        { id = "h_pendant", tags = { "news" }, when = { questActive = TODO_QUEST("Theocritus' Retrieval") },
          text = "You heard me through a gnoll's pendant, weeks late? Give it here; a slow spell is still a spell that worked." },
      },
      again = {
        { id = "h_again", text = "Something else? Be brief, please; Redridge doesn't watch itself." },
        { id = "h_again2", text = "You're still here, I see. Very well, ask what you came to ask." },
      },
      choices = {
        { text = "Who is Morganth?", next = "morganth" },
        { text = "What do you study here?", next = "study" },
        { text = "Tell me about the tower.", next = "tower" },
        { text = "Do you care what happens in Elwynn?", next = "elwynn" },
        { text = "Morganth is dead. What now?", next = "after", when = { questDone = TODO_QUEST("Morganth") } },
        { text = "I'm a mage. Teach me something.", next = "mage", when = { class = "MAGE" } },
        { text = "I'm not Morganth.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "A priest knows something of shadow too.", next = "priest", when = { class = "PRIEST", minLevel = 20 } },
        { text = "Your servants are gnomes. Where are they from?", next = "gnome", when = { race = "Gnome" } },
        { text = "My family would rather I were at court.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I'll show myself out.", next = "END" },
      },
    },

    morganth = {
      lines = {
        { id = "mo_default", key = true,
          text = "A Stormwind student who turned to shadow, was thrown out, and took Ur's treatise on shadow magic with him. The city's mages want the book back; I want him stopped." },
      },
      choices = {
        { text = "Why is that your duty?", next = "duty" },
        { text = "What does he want?", next = "morganth_want" },
        { text = "Sounds like the city's problem.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    duty = {
      big = true,
      lines = {
        { id = "d_default", text = "Because I don't care about tax rolls or harvests or who the Regent is dining with. But I know what Morganth is. If I don't care about that, no one competent will." },
      },
      choices = {
        { text = "Then I'll help.", next = "BACK", fx = { affinity = 2, learn = { "morganth" }, align = { order = 1 } } },
        { text = "Very noble of you.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { witty = 1 } } },
      },
    },
    morganth_want = {
      lines = {
        { id = "mw_default", text = "Power, the dull answer. He sided with the Blackrock orcs to take Stonewatch Keep, then turned on them. A man who betrays his allies that quickly wants something specific." },
        { id = "mw_scythe", when = { questDone = TODO_QUEST("Looking Further") },
          text = "The Scythe of Elune, if I read his thoughts aright. If he has it, Redridge feels it first and Stormwind second." },
      },
      choices = {
        { text = "How do you read his thoughts?", next = "eye" },
        { text = "Something else.", next = "BACK", fx = { learn = { "morganth", "blackrock" } } },
      },
    },

    study = {
      lines = {
        { id = "s_default", text = "Gnolls, at present. Morganth's gnolls wear pendants, and if I understand the pendant I understand the leash, and then the hand that holds it." },
      },
      choices = {
        { text = "Can the pendants be turned on him?", next = "study_turn" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    study_turn = {
      lines = {
        { id = "st_default", text = "In time. I sent a message through them weeks ago and thought it failed. Next I mean to send something that holds every gnoll wearing one where it stands." },
        { id = "st_heard", when = { questDone = TODO_QUEST("Theocritus' Retrieval") },
          text = "You heard my message through one. Weeks late, but heard. That is still the most satisfying thing to happen in this tower all year." },
      },
      choices = {
        { text = "Months of research for a leash.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'd like to see that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    tower = {
      lines = {
        { id = "tw_default", text = "Mine. The gnomes keep it, Morley dresses it, and the Eye watches Redridge. I go up and down the stairs as little as possible." },
      },
      choices = {
        { text = "The gnomes?", next = "tower_gnomes" },
        { text = "The Eye?", next = "eye" },
      },
    },
    tower_gnomes = {
      lines = {
        { id = "tg_default", text = "The Servants of Azora: loyal, tireless and armed. They are also the only people in Elwynn who never ask me to fix their ploughs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eye = {
      lines = {
        { id = "ey_default", text = "The Eye of Azora, a scrying sphere upstairs. Touch it and you see Ilgalar's walls. My glyphs carry its sight further, wherever someone brave sets them." },
      },
      choices = {
        { text = "I could set one.", next = "BACK", when = { minLevel = 20 }, fx = { affinity = 1, learn = { "morganth" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    elwynn = {
      lines = {
        { id = "el_default", text = "The loggers are loud, the Defias are tedious, and the pumpkin farm south-east of here has thieves in it. None of that will burn the kingdom down, but Morganth might." },
      },
      choices = {
        { text = "People are suffering out there.", next = "elwynn_people" },
        { text = "Fair. One thing at a time.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    elwynn_people = {
      lines = {
        { id = "ep_default", text = "Then help them, and I'll be up here making sure there's a kingdom left for them to suffer in. We both have our work." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "That's a convenient view from a tower.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Now the treatise goes back to the mages who sealed it, and I go back to being bored. I find I'm looking forward to it." },
      },
      choices = {
        { text = "You'll miss him.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Enjoy the quiet.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    mage = {
      lines = {
        { id = "ma_default", text = "I'm not a trainer. But here is one thing free: Ur's work is sealed for a reason. If anyone offers you a look inside, refuse, loudly." },
      },
      choices = {
        { text = "I'll refuse.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll decide for myself what I read.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Knowledge shouldn't be locked away.", next = "mage_knowledge", fx = { trait = { curious = 1 } } },
      },
    },
    mage_knowledge = {
      lines = {
        { id = "mk_default", text = "Morganth said that, I'm told, in nearly those words. Think about it on the way down. There are a great many stairs." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Nobody is Morganth until they are. He began as a student with good intentions. Keep yours where I can see them." },
      },
      choices = {
        { text = "You'll see them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My power is my business.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "A priest who knows shadow? Then you know it's a road that narrows the further you walk it. Morganth walked it to the end, so don't." },
      },
      choices = {
        { text = "I walk it carefully.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, trait = { cautious = 1 } } },
        { text = "The Light walks with me.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Ask them yourself. They've never told me, and I've never thought to ask, which may say something about me that I shan't dwell on." },
      },
      choices = {
        { text = "It does.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Court is where competent people go to be wasted. Stay out here, where the dangers are honest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have studied a great many things from this tower, most of them beyond your concern. These, however, I might explain." },
    },
    background = { { id = "tp_bg", text = "I have a tower and a rival. That is all the biography anyone needs." } },
    advice = { { id = "tp_ad", text = "If a book is sealed, the seal is the most important thing in it." } },
    morganth = {
      { id = "tp_morganth", text = "He's in Redridge, in the Tower of Ilgalar. Bring a friend, or better, several." },
      { id = "tp_morganth2", text = "Must we? Very well, sit down, but briefly.", next = "morganth" },
    },
    defias = { { id = "tp_defias", text = "Thieves, and tiresome ones, but somebody else's problem, I'm delighted to say." } },
    eastvale = { { id = "tp_eastvale", text = "There are loggers below, I'm told. I hear them occasionally, and I try not to." } },
    blackrock = { { id = "tp_blackrock", text = "The orcs in Stonewatch Keep. Morganth used them and threw them away, and I very nearly feel sorry for them." } },
    _none = { { id = "tp_none", text = "If it were worth knowing, I would know it. Draw your own conclusions." } },
  },
}
