-- The Undercity. Voice: bibles/undercity.md
-- Varimathras's later betrayal and the Society's real plans stay unspoken: arrogance and
-- irony only. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sylvanas", id = TODO_NPC("Lady Sylvanas Windrunner"), name = "Lady Sylvanas Windrunner",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "cold" }, values = { "proud", "vengeful" },
  spiritSensitive = true,
  notices = { "race", "class" },

  greetings = {
    { id = "g_queen", text = "Before you is the Dark Lady. Kneel if you like. I won't insist. Not today." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "One of my own. You were taken, and you took yourself back. Never forget that. I don't." },
    { id = "g_back", when = { metBefore = true }, text = "Again. Speak, then. I have little patience, but I have a great deal of time." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living ally. The Horde has been useful to us. I trust it remains so. Tell your Warchief I said so." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your elders spoke for us when no one else would. I don't forget a debt. I don't always repay one, but I don't forget it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest who still prays. To what, I wonder. Whatever answers you, use it on our enemies." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sylvanas Windrunner. Once Ranger-General of Silvermoon, now queen of the Forsaken. Arthas made me this. One day I will show him what he made." },
        { id = "h_zygand", when = { heardLine = "zygand.h_default" },
          text = "Zygand holds Tirisfal against the Crusade. Good. The zealots should learn that the dead have long memories." },
        { id = "h_hamuul", when = { heardLine = "hamuul.h_default" },
          text = "The tauren Arch Druid. He spoke for the Forsaken before the Horde, when the orcs would have turned us away. Remember that, when you hear the tauren speak of balance." },
      },
      choices = {
        { text = "What do the Forsaken want?", next = "want" },
        { text = "Tell me about Arthas.", next = "arthas" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2 } },
      },
    },
    want = {
      big = true,
      lines = {
        { id = "w_default", text = "A home no one can take from us. Freedom from the Lich King's voice. And his ruin, slowly, piece by piece. Is that so much, after what was done to us?" },
      },
      choices = {
        { text = "It isn't.", next = "END", fx = { affinity = 2 } },
        { text = "And after that?", next = "after" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "After that is my concern. Yours is to be useful. You have been, so far." } },
      choices = { { text = "...", next = "END" } },
    },
    arthas = {
      lines = { { id = "ar_default", text = "He burned my people's forests and murdered them in their homes. Then he made me watch, as this. I'll say no more. Not to you. Not to anyone." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That isn't my concern. Varimathras will tell you if it should be." } },
  },
}

P:NPC {
  key = "varimathras", id = TODO_NPC("Varimathras"), name = "Varimathras",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "arrogant" }, values = { "proud" },
  notices = { "class", "fel" },

  greetings = {
    { id = "g_dread", text = "You may approach. Slowly. I serve the Dark Lady, and in her name I suffer visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Returned, have you? The Dark Lady finds you useful. I find you... adequate." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A warlock. How charming. You play with the toys of my kind. Do be careful. Some of them bite back." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Tauren" },
      text = "A paladin, in the Horde. How the world changes. I find I like it less every year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Varimathras. Majordomo to the Dark Lady, and her most loyal servant. I keep her city safe from its many enemies, and serve her in all things." },
        { id = "h_deathstalkers", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "The Deathstalkers are the Dark Lady's eyes and blades. Go where they send you, do what they ask. And tell me what they tell you." },
        { id = "h_hillsbrad", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "Hillsbrad. The living cling to it like rats to a ship. Help Darthalia sink it." },
        { id = "h_alliance", when = { questActive = TODO_QUEST("An Unholy Alliance") },
          text = "An alliance between our enemies? How very unholy. Break it before it learns to stand." },
      },
      choices = {
        { text = "How did you come to serve her?", next = "serve" },
        { text = "I'll go.", next = "END" },
      },
    },
    serve = {
      big = true,
      lines = {
        { id = "s_default", text = "She defeated my brothers and me, and offered me a choice. I chose wisely. I always choose wisely. It's my particular talent." },
      },
      choices = {
        { text = "That's not quite an answer.", next = "answer", fx = { trait = { skeptical = 1 } } },
        { text = "A wise choice.", next = "END", fx = { affinity = 1 } },
      },
    },
    answer = {
      lines = { { id = "an_default", text = "That is precisely the answer you're getting. Now go and be useful elsewhere." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Beneath my notice. Possibly beneath yours. Ask an apothecary." } },
  },
}

P:NPC {
  key = "faranell", id = TODO_NPC("Master Apothecary Faranell"), name = "Master Apothecary Faranell",
  bible = "bibles/undercity.md", role = "scholar", tier = "major",
  communities = { "undercity" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_lab", text = "Welcome, welcome, to the Apothecarium! Mind the green. Mind the purple, too. Actually, mind all the colours." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, my errand-runner! Do you have my reagents? You do? Splendid! Science thanks you." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist! A kindred spirit. Well, a spirit. We all have those here. But kindred! Let's compare tinctures some time." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living! How wonderful. Your blood is so... full of possibilities. Purely academically, of course." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Faranell, Master Apothecary, master of every bottle in this room, keeper of the Royal Apothecary Society's finest work. The Dark Lady wants weapons against the Scourge. I make them. It's a joy." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "Bear hearts, spider blood, a journal from Pyrewood, a bit of murloc tumour. Bring me everything on the list. Together, they make something wonderful. For the Scourge, naturally." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Lydon's colloid, applied correctly! Then a few reagents to wake the mixture. Don't sniff it. Lydon sniffed it. Lydon has been melancholy ever since." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "Lydon, in Tarren Mill? Yes, yes. Brilliant mind. Terrible company. He named his frog. I told him not to name the frog." },
      },
      choices = {
        { text = "What are you making?", next = "making" },
        { text = "I'll leave you to your work.", next = "END" },
      },
    },
    making = {
      big = true,
      lines = {
        { id = "m_default", text = "A cure! Of sorts. For the Scourge problem. Something that kills what can't be killed. The Dark Lady is very particular about who it's used on. So am I. Mostly." },
      },
      choices = {
        { text = "Only on the Scourge?", next = "only", fx = { trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "END", fx = { affinity = 1 } },
      },
    },
    only = {
      lines = { { id = "o_default", text = "What a suspicious mind you have. I like it. You'd make a fine apothecary. Now run along." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into water? Oh, I'd give a great deal for a sample. Helbrim is being very slow about it." } },
    _none = { { id = "tp_none", text = "Not my department! My department is bubbling. Excuse me." } },
  },
}

P:NPC {
  key = "bethor", id = TODO_NPC("Bethor Iceshard"), name = "Bethor Iceshard",
  bible = "bibles/undercity.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold" }, values = { "pragmatic", "loyal" },
  notices = { "class" },

  greetings = {
    { id = "g_magic", text = "The Magic Quarter. Knowledge is the only weapon the Forsaken never had to dig out of a grave. What do you need?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Dalaran taught me, before. Now I teach. The lessons have grown colder. So have I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bethor Iceshard. I studied at Dalaran with two friends. We crossed our wands as apprentices and swore we'd always stand together. One of them sold his soul to the Lich King. His name was Thule Ravenclaw." },
        { id = "h_renferrel", when = { heardLine = "renferrel.h_default" },
          text = "Renferrel's work in Silverpine keeps turning up my old friend's name. I'd rather it didn't. I'd rather know than not, though." },
        { id = "h_prodigal", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Somewhere out there, a lich calls himself by an old friend's name. Find out if it's true. I'd rather it weren't." },
        { id = "h_returns", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich Returns") },
          text = "It's Thule. It's truly him. End it. Bring me his head, and the last thing I owe him will be paid." },
        { id = "h_returns_done", when = { questDone = TODO_QUEST("The Prodigal Lich Returns") },
          text = "So he's gone. I thought I'd feel something. I felt the wand in my pocket. I still carry it." },
      },
      choices = {
        { text = "What happened to Thule?", next = "thule" },
        { text = "Farewell.", next = "END" },
      },
    },
    thule = {
      big = true,
      lines = {
        { id = "t_default", text = "He wanted power more than he wanted us. When the plague came, he traded everything for it. I died and came back. He sold himself and stayed sold. Between us, I know which I'd choose." },
      },
      choices = { { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Research it. That's what we do here." } },
  },
}

P:NPC {
  key = "norman", id = TODO_NPC("Innkeeper Norman"), name = "Innkeeper Norman",
  bible = "bibles/undercity.md", role = "innkeeper", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "hospitable" },
  notices = { "race", "weary" },

  greetings = {
    { id = "g_rest", text = "Sit. Put your feet up, whatever state they're in. Mine have seen better centuries." },
    { id = "g_home", when = { homeInn = { "Undercity" } }, text = "Back under the city, then. Your bed's where you left it, and so's the damp." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living guest! I keep bread back for your sort. Fresh, too. Well. Fresh-ish. Freshest in the Undercity." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Bits of you are missing. Oh, wait, you're alive, it's just armour. Sit. I'll find you something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Norman. I keep the inn by the Trade Quarter. We don't sleep, most of us, but we like a chair and a place that's ours. That's what I sell, really." },
        { id = "h_chair", when = { metBefore = true }, text = "Your chair's still there. Nobody's taken it. Nobody takes anyone's chair down here. It's the last courtesy we keep." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask in the Apothecarium. They know all sorts. Don't drink anything they offer." } },
  },
}
