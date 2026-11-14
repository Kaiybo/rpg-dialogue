-- Feralas: Feathermoon Stronghold on Sardor Isle (Alliance) and Camp Mojache (Horde). Voice: bibles/feralas.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shandris", id = TODO_NPC("Shandris Feathermoon"), name = "Shandris Feathermoon",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "feathermoon" }, temper = { "intent" }, values = { "loyal", "dutiful", "brave" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_isle", text = "Welcome to Sardor Isle. Keep your bow strung and your eyes on the water. That's all I ask of anyone here." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back across the water. Good. Report." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "You carry yourself like someone who's held a line. Feralas will test that. So will I." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Sister, or brother, of the kaldorei. The Sentinels can always use another. Think on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shandris Feathermoon, General of the Sentinels. This stronghold watches over Feralas for the High Priestess. The naga stir along the coast, and the ogres in the hills; we watch them both." },
        { id = "h_tyrande", when = { heardLine = "tyrande.h_default" },
          text = "You've stood before the High Priestess. Then you know why I serve as I do. She found me when I had no one. I've never left her side since." },
      },
      choices = {
        { text = "What troubles Feralas?", next = "troubles" },
        { text = "Elune guide your arrows.", next = "END", fx = { affinity = 1, standing = { feathermoon = 1 } } },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "Hatecrest naga in the ruins of Solarsal, more of them each month. A hive of insects that has no business being in Feralas; I've sent word to Gracina Spiritmight in Darnassus. And ogres, always ogres." },
      },
      choices = { { text = "Send me where I'm needed.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { feathermoon = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The druids heal the land. We keep it whole long enough for them to finish. It's a fair arrangement." } },
    _none = { { id = "tp_none", text = "Not a matter for the Sentinels. Ask in Darnassus." } },
  },
}

P:NPC {
  key = "pratt", id = TODO_NPC("Pratt McGrubben"), name = "Pratt McGrubben",
  bible = "bibles/feralas.md", role = "vendor", tier = "quest",
  communities = { "feathermoon" }, temper = { "genial" }, values = { "kind", "practical" },
  notices = { "craft", "class" },

  greetings = {
    { id = "g_shop", text = "Well met! Leather, repairs, a kind word. Which can I do for you?" },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! Then I've a pattern or two you'll want to earn. Bring me proof of good work and we'll see." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here! I swung a hammer for the Light longer than I care to count. Now I swing a needle. The Light doesn't seem to mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pratt McGrubben. Mostly retired from paladin work, fully employed in leather. I patch whatever the Sentinels bring back torn." },
        { id = "h_quality", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Mark of Quality") }, { questActive = TODO_QUEST("Improved Quality") } } },
          text = "Show me the hides, and I'll show you how to make something a Sentinel would be proud to wear. Quality takes patience. I've got plenty now." },
      },
      choices = {
        { text = "Why did you retire?", next = "retire" },
        { text = "Just browsing.", next = "END" },
      },
    },
    retire = {
      lines = { { id = "r_default", text = "Mostly. The Light still answers when I call; I just call less often. Don't let the needle fool you." } },
      choices = { { text = "Ha. Noted.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask the General; she knows everything on this island." } },
  },
}

P:NPC {
  key = "shyria", id = TODO_NPC("Innkeeper Shyria"), name = "Innkeeper Shyria",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come in from the rain. Feralas is always wet; at least here it's warm and wet." },
    { id = "g_home", when = { homeInn = { "Feathermoon Stronghold" } }, text = "You've returned to the island. Your bed is ready, and the tea is fresh." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come back from somewhere grey and far away. Sit. The Sentinels can spare you for an evening." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Shyria. The Sentinels sleep in shifts, and every shift passes through my door. You're welcome among them." },
        { id = "h_jonespyre", when = { questActive = TODO_QUEST("Jonespyre's Request") },
          text = "Quantas Jonespyre has a request. Go and hear him out; he'll explain." },
      },
      choices = { { text = "Thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I keep the inn. The General keeps the rest." } },
  },
}

-- Camp Mojache: the tauren camp in eastern Feralas.
P:NPC {
  key = "rokorhan", id = TODO_NPC("Rok Orhan"), name = "Rok Orhan",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "mojache" }, temper = { "fierce" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  greetings = {
    { id = "g_camp", text = "You want to help the Horde in Feralas? Good. Ogres. Kill ogres. That's how." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. The Gordunni are big and stupid. Hit them where it hurts; that's everywhere if you hit hard enough." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ogre clubs do that. Get mended and go back. They don't stop, so we don't either." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rok Orhan. Belgrom Rockmaul sent me to break the Gordunni ogres of Feralas. They're many, they're foul, and they're nearly broken." },
        { id = "h_threat", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("A Threat in Feralas") }, { questActive = TODO_QUEST("The Ogres of Feralas") } } },
          text = "The Gordunni hold the hills north of camp. Thin them. Every ogre you drop is one fewer club at our gate." },
        { id = "h_ceremony", when = { questActive = TODO_QUEST("Dark Ceremony") },
          text = "Their shamans are at some ritual. Dark work. Stop it before it finishes." },
        { id = "h_scroll", when = { any = { { questActive = TODO_QUEST("The Gordunni Scroll") }, { questActive = TODO_QUEST("The Gordunni Orb") } } },
          text = "The ogres are carrying scrolls and orbs. Bring them here. I want to know what an ogre's doing with writing." },
      },
      choices = { { text = "I'll fight.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { mojache = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Tauren trouble. The tauren here watch for them. I watch for ogres." } },
    _none = { { id = "tp_none", text = "Don't know. Is it an ogre? Then I'll learn." } },
  },
}

P:NPC {
  key = "orwin", id = TODO_NPC("Orwin Gizzmick"), name = "Orwin Gizzmick",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  communities = { "mojache" }, temper = { "eager" }, values = { "curious", "ambitious" },
  notices = { "craft" },

  greetings = {
    { id = "g_ore", text = "You look like someone who can carry rocks. Valuable rocks. Mysterious rocks!" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "A miner! Have you ever seen Gordunni cobalt? Nobody has. Well, the ogres have. That's the problem." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Orwin Gizzmick, here on Orgrimmar's business and a bit of my own. The ogres guard an ore up north nobody understands. I'd like to understand it. Then sell it." },
        { id = "h_cobalt", tags = { "news" }, when = { questActive = TODO_QUEST("Gordunni Cobalt") },
          text = "Gordunni cobalt, from their compound. They guard it jealously. That's how you know it's worth something." },
      },
      choices = { { text = "I'll get you some.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a rock, not my business." } },
  },
}

P:NPC {
  key = "greul", id = TODO_NPC("Innkeeper Greul"), name = "Innkeeper Greul",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "mojache" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come in, come in. Feralas is wide and wet and full of teeth. In here, it's just warm." },
    { id = "g_home", when = { homeInn = { "Camp Mojache" } }, text = "Welcome home to Mojache. The hides are dry and the kettle's on." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin as old hide. Sit. Nothing in Feralas can reach you for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Greul. Braves, hunters, traders, all of them pass my fire. Mojache keeps travelers safe; I keep them fed." },
      },
      choices = { { text = "Just a rest, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I keep the fire. Rok Orhan keeps the ogres away. Ask her." } },
  },
}
