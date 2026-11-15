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
    { id = "g_queen", text = "Before you stands the Dark Lady. Kneel if you like; I won't insist, not today." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "One of my own. You were taken, and you took yourself back; never forget that, because I don't." },
    { id = "g_back", when = { metBefore = true }, text = "You return to me. Speak, then; I have little patience, but I have a great deal of time." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living ally. The Horde has been useful to us, and I trust it remains so; tell your Warchief I said as much." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your elders spoke for us when no one else would, and I don't forget a debt. I don't always repay one, but I don't forget it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest who still prays, and to what, I wonder? Whatever answers you, use it on our enemies." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sylvanas Windrunner, once Ranger-General of Silvermoon and now queen of the Forsaken. Arthas made me this, and one day I will show him what he made." },
        { id = "h_zygand", when = { heardLine = "zygand.h_default" },
          text = "Zygand holds Tirisfal against the Crusade, and good; the zealots should learn that the dead have long memories." },
        { id = "h_hamuul", when = { heardLine = "hamuul.h_default" },
          text = "The tauren Arch Druid spoke for the Forsaken before the Horde, when the orcs would have turned us away. Remember that, when you hear the tauren speak of balance." },
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
        { id = "w_default", text = "A home no one can take from us, and freedom from the Lich King's voice. And his ruin, slowly, piece by piece. Is that so much, after what was done to us?" },
      },
      choices = {
        { text = "It isn't.", next = "END", fx = { affinity = 2 } },
        { text = "And after that?", next = "after" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "After that is my concern. Yours is to be useful, and you have been, so far." } },
      choices = { { text = "...", next = "END" } },
    },
    arthas = {
      lines = { { id = "ar_default", text = "He burned my people's forests and murdered them in their homes, and then he made me watch, as this. I'll say no more of it, not to you and not to anyone." } },
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
    { id = "g_dread", text = "You may approach, slowly. I serve the Dark Lady, and in her name I suffer visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Returned, have you? The Dark Lady finds you useful, and I find you, shall we say, adequate." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A warlock, how charming. You play with the toys of my kind, so do be careful; some of them bite back." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Tauren" },
      text = "A paladin, in the Horde? How the world changes, and I find I like it less every year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "You address Varimathras, majordomo to the Dark Lady and her most loyal servant. I keep her city safe from its many enemies, and serve her in all things." },
        { id = "h_deathstalkers", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "The Deathstalkers are the Dark Lady's eyes and blades. Go where they send you and do what they ask, and then tell me what they tell you." },
        { id = "h_hillsbrad", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "The living cling to Hillsbrad like rats to a ship. Help Darthalia sink it." },
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
        { id = "s_default", text = "She defeated my brothers and me, and offered me a choice, and I chose wisely. I always choose wisely; it's my particular talent." },
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
    _none = { { id = "tp_none", text = "That is beneath my notice, and possibly beneath yours. Ask an apothecary." } },
  },
}

P:NPC {
  key = "faranell", id = TODO_NPC("Master Apothecary Faranell"), name = "Master Apothecary Faranell",
  bible = "bibles/undercity.md", role = "scholar", tier = "major",
  communities = { "undercity" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_lab", text = "Welcome, welcome, to the Apothecarium! Mind the green, and mind the purple, too; actually, mind all the colours." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, my errand-runner! Do you have my reagents? Oh, you do, splendid; science thanks you!" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist, a kindred spirit! Well, a spirit, anyway, and we all have those here, but a kindred one! Let's compare tinctures some time." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living, how wonderful! Your blood is so very full of possibilities... purely academically, of course." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Faranell, Master Apothecary, master of every bottle in this room, keeper of the Royal Apothecary Society's finest work, at your service! The Dark Lady wants weapons against the Scourge, and I make them, and it's a joy." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "Bear hearts, spider blood, a journal from Pyrewood and a bit of murloc tumour: bring me everything on the list. Together they make something wonderful, for the Scourge, naturally." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Lydon's colloid, applied correctly, and then a few reagents to wake the mixture! Don't sniff it, though; Lydon sniffed it, and Lydon has been melancholy ever since." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "Lydon, in Tarren Mill? Yes, yes, a brilliant mind and terrible company. He named his frog, and I told him not to name the frog!" },
      },
      choices = {
        { text = "What are you making?", next = "making" },
        { text = "I'll leave you to your work.", next = "END" },
      },
    },
    making = {
      big = true,
      lines = {
        { id = "m_default", text = "A cure, of sorts, for the Scourge problem: something that kills what can't be killed! The Dark Lady is very particular about who it's used on, and so am I. Mostly." },
      },
      choices = {
        { text = "Only on the Scourge?", next = "only", fx = { trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "END", fx = { affinity = 1 } },
      },
    },
    only = {
      lines = { { id = "o_default", text = "What a suspicious mind you have, and I like it; you'd make a fine apothecary. Now run along." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into water? Oh, I'd give a great deal for a sample. Helbrim is being very slow about it." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid! My department is bubbling, so do excuse me." } },
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
      text = "A mage. Dalaran taught me, before, and now I teach. The lessons have grown colder, and so have I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "My name is Bethor Iceshard. I studied at Dalaran with two friends, and we crossed our wands as apprentices and swore we'd always stand together. One of them sold his soul to the Lich King, and his name was Thule Ravenclaw." },
        { id = "h_renferrel", when = { heardLine = "renferrel.h_default" },
          text = "Renferrel's work in Silverpine keeps turning up my old friend's name. I'd rather it didn't, but I'd rather know than not." },
        { id = "h_prodigal", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Somewhere out there, a lich calls himself by an old friend's name. Find out if it's true, though I'd rather it weren't." },
        { id = "h_returns", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich Returns") },
          text = "It's Thule, truly him. End it, and bring me his head, and the last thing I owe him will be paid." },
        { id = "h_returns_done", when = { questDone = TODO_QUEST("The Prodigal Lich Returns") },
          text = "So he's gone. I thought I'd feel something, but all I felt was the wand in my pocket, and I still carry it." },
      },
      choices = {
        { text = "What happened to Thule?", next = "thule" },
        { text = "Farewell.", next = "END" },
      },
    },
    thule = {
      big = true,
      lines = {
        { id = "t_default", text = "He wanted power more than he wanted us, and when the plague came he traded everything for it. I died and came back, while he sold himself and stayed sold. Between us, I know which I'd choose." },
      },
      choices = { { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Research it; that's what we do here." } },
  },
}

P:NPC {
  key = "norman", id = TODO_NPC("Innkeeper Norman"), name = "Innkeeper Norman",
  bible = "bibles/undercity.md", role = "innkeeper", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "hospitable" },
  notices = { "race", "weary" },

  greetings = {
    { id = "g_rest", text = "Sit yourself down and put your feet up, whatever state they're in. Mine have seen better centuries." },
    { id = "g_home", when = { homeInn = { "Undercity" } }, text = "Back under the city, then. Your bed's where you left it, and so's the damp." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living guest! I keep bread back for your sort, and it's fresh, too. Well, fresh-ish, but it's the freshest in the Undercity." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Bits of you are missing. Oh, wait, you're alive, it's just armour; sit down and I'll find you something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Norman, and I keep the inn by the Trade Quarter. We don't sleep, most of us, but we like a chair and a place that's ours, and that's what I sell, really." },
        { id = "h_chair", when = { metBefore = true }, text = "Your chair's still there, and nobody's taken it. Nobody takes anyone's chair down here; it's the last courtesy we keep." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask in the Apothecarium, since they know all sorts, but don't drink anything they offer." } },
  },
}
