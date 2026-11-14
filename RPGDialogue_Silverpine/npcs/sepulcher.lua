-- The Sepulcher: the Forsaken's crypt-fortress in Silverpine. Voice: bibles/silverpine.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hadrec", id = TODO_NPC("High Executor Hadrec"), name = "High Executor Hadrec",
  bible = "bibles/silverpine.md", role = "soldier", tier = "major",
  communities = { "sepulcher" }, temper = { "iron" }, values = { "loyal", "dutiful" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_sepulcher", text = "Speak. The Sepulcher has enemies on three sides, and I have little time for the fourth." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the forest. Report, and be brief." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest bit you. Mend, then bite back." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the Warchief's people, in Silverpine. The worgen won't care which side you're on. Neither will the Scourge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "High Executor Hadrec. I hold Silverpine for the Dark Lady. Whatever stands against the Forsaken here, we push back. Then we push again." },
        { id = "h_deathstalkers", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Deathstalkers' Report") }, { questActive = TODO_QUEST("Lost Deathstalkers") } } },
          text = "My deathstalkers went into the forest and didn't report back. Find them, or find what's left of them." },
        { id = "h_fields", when = { questActive = TODO_QUEST("The Dead Fields") },
          text = "The gnolls of the Dead Fields grow bold. Cut them down. The Sepulcher's roads must stay open." },
        { id = "h_fenris", when = { questActive = TODO_QUEST("Assault on Fenris Isle") },
          text = "Fenris Isle. The Rot Hide gnolls nest there. Burn it out." },
        { id = "h_shadowfang", when = { questActive = TODO_QUEST("Deathstalkers in Shadowfang") },
          text = "Some of my best went into Shadowfang Keep and haven't come out. Arugal's keep. Go in after them." },
      },
      choices = {
        { text = "What threatens the Sepulcher?", next = "threats" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { sepulcher = 1 } } },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "The worgen of the south, Arugal's beasts. The Scourge to the east. Dalaran's mages poking about Ambermill. And the gnolls, who don't know when to stop." },
      },
      choices = { { text = "I'll help hold the line.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Arugal's creatures. A Dalaran mage's mistake, loose in my forest. I'd like the mage, too." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask Allister; information is his business." } },
  },
}

P:NPC {
  key = "renferrel", id = TODO_NPC("Apothecary Renferrel"), name = "Apothecary Renferrel",
  bible = "bibles/silverpine.md", role = "scholar", tier = "quest",
  communities = { "sepulcher" }, temper = { "focused" }, values = { "ambitious", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_lab", text = "Don't touch anything green. Or anything that glows. Or anything, really." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "Ah, you know your reagents. Good. Half my work is waiting on people who don't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Renferrel, of the Royal Apothecary Society. Our work goes on here, far from the Undercity's eyes and nose." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to Silverpine Forest") },
          text = "Johaan's package. Intact, too. He'll be pleased; I'm relieved." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "A recipe for death. Not mine; I only improve on it. Bring me what it calls for." },
        { id = "h_rothide", when = { any = { { questActive = TODO_QUEST("Rot Hide Ichor") }, { questActive = TODO_QUEST("Rot Hide Origins") } } },
          text = "The Rot Hide gnolls carry a sickness. I want to know where it came from. Someone made it." },
        { id = "h_thule", when = { questActive = TODO_QUEST("Thule Ravenclaw") },
          text = "The trail leads to a lich called Thule Ravenclaw. Bethor Iceshard in the Undercity knew him once. Tread carefully." },
      },
      choices = { { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it can't be bottled, it can't hold my attention." } },
  },
}

P:NPC {
  key = "dalar", id = TODO_NPC("Dalar Dawnweaver"), name = "Dalar Dawnweaver",
  bible = "bibles/silverpine.md", role = "scholar", tier = "quest",
  communities = { "sepulcher" }, temper = { "proud" }, values = { "sharp", "proud" },
  notices = { "class" },

  greetings = {
    { id = "g_mage", text = "You may address me as Archmage, if you like. The Kirin Tor stopped doing so when I died, which I thought rude of them." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. You're the only one here who listens." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand how it galls me to watch Dalaran's fools stumble about in this forest, making the same mistakes twice." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dalar Dawnweaver. I was an archmage of the Kirin Tor until the Scourge took Dalaran and me with it. I warned them. Nobody listened." },
        { id = "h_prove", when = { questActive = TODO_QUEST("Prove Your Worth") },
          text = "Before I trust you with real work, show me you can survive the forest. It's a low bar. Many trip on it." },
        { id = "h_folly", tags = { "news" }, when = { questActive = TODO_QUEST("Arugal's Folly") },
          text = "Arugal. A Kirin Tor mage who called up beasts he couldn't control. Now they run Silverpine. That is what Dalaran calls a solution." },
        { id = "h_intentions", when = { any = { { questActive = TODO_QUEST("Dalar's Analysis") }, { questActive = TODO_QUEST("Dalaran's Intentions") } } },
          text = "Dalaran's mages are in Ambermill. I want to know why. Bring me what they're carrying, and I'll read it better than they wrote it." },
      },
      choices = {
        { text = "What did you warn them about?", next = "warned" },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    warned = {
      big = true,
      lines = {
        { id = "w_default", text = "Many things. Dalaran preferred not to hear any of them. I was there when Kel'Thuzad called the demon down; I'd have liked to be wrong." },
      },
      choices = { { text = "And now?", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Arugal's mess. A fool with power is the most dangerous creature in any forest." } },
    _none = { { id = "tp_none", text = "Beneath my notice, or above my current research. Either way, not today." } },
  },
}

P:NPC {
  key = "allister", id = TODO_NPC("Shadow Priest Allister"), name = "Shadow Priest Allister",
  bible = "bibles/silverpine.md", role = "priest", tier = "quest",
  communities = { "sepulcher" }, temper = { "smooth" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth" },

  greetings = {
    { id = "g_shadows", text = "Ah. I heard you were coming. I hear most things." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Quiet feet. I've uses for quiet feet. Come and see me when you're ready to earn your keep in shadows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadow Priest Allister. I keep watchers in every corner of Lordaeron. What moves in Silverpine, I learn of first." },
        { id = "h_border", tags = { "news" }, when = { questActive = TODO_QUEST("Border Crossings") },
          text = "Someone has been crossing into our lands who shouldn't be. Find out who, and what they carry." },
        { id = "h_ambermill", when = { questActive = TODO_QUEST("Ambermill Investigations") },
          text = "Ambermill. Dalaran's mages have taken an interest in it. I'd like to know why before they finish whatever it is." },
        { id = "h_weaver", when = { questActive = TODO_QUEST("The Weaver") },
          text = "The Weaver. Dalaran's, and dangerous. Remove that problem. Quietly is better." },
      },
      choices = { { text = "What do you want me to learn?", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If I knew, I wouldn't tell you for free. And I don't know." } },
  },
}

P:NPC {
  key = "bates", id = TODO_NPC("Innkeeper Bates"), name = "Innkeeper Bates",
  bible = "bibles/silverpine.md", role = "innkeeper", tier = "service",
  communities = { "sepulcher" }, temper = { "hospitable" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come in out of the pines. There's a chair by the fire and nothing out here that bites. Mostly." },
    { id = "g_home", when = { homeInn = { "The Sepulcher" } }, text = "Back to the crypt, are you? Your slab's made up. I mean bed. Habit." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look grave-tired, and I'd know. Sit a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Bates. Not much of an inn, being a crypt and all. But the roof keeps the worgen out, and that's what counts in Silverpine." },
      },
      choices = { { text = "Just a rest, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I keep the fire. Ask the High Executor for the rest." } },
  },
}
