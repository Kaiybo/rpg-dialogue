-- Theramore Isle: Jaina Proudmoore's city on the edge of Dustwallow Marsh. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jaina", id = TODO_NPC("Lady Jaina Proudmoore"), name = "Lady Jaina Proudmoore",
  bible = "bibles/dustwallow.md", role = "noble", tier = "major",
  communities = { "theramore" }, temper = { "earnest" }, values = { "wise", "kind", "dutiful" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_tower", text = "Welcome to Theramore. Speak freely. I'd rather hear bad news early than good news late." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Good. I have few enough people I can rely on outside these walls." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Dalaran trained me, once. Whoever trained you, I hope they taught you that power is the easy part." },
    { id = "n_highborne", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine stood together at Mount Hyjal. I haven't forgotten. I hope we never have to again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jaina Proudmoore. I brought the survivors of Lordaeron across the sea and built Theramore with them. We keep the peace here, even when it costs us." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall. Then you know he's no monster. Not everyone in Stormwind wants to hear that from me." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Whatever Tervosh has you chasing, see it through. Someone has been working against us from the shadows, and I mean to learn who." },
      },
      choices = {
        { text = "Why keep peace with the Horde?", next = "peace" },
        { text = "I'm sorry about your father.", next = "father" },
        { text = "Farewell, my lady.", next = "END" },
      },
    },
    peace = {
      big = true,
      lines = {
        { id = "p_default", text = "Because I fought beside them at Hyjal, and I saw what they are when no one is using them. Peace is harder than war. It's also worth more." },
      },
      choices = {
        { text = "I agree.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { theramore = 1 } } },
        { text = "I'm not sure they'd do the same.", next = "doubt" },
      },
    },
    doubt = {
      lines = { { id = "d_default", text = "Some wouldn't. Some of ours wouldn't either. That's exactly why the rest of us have to try." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
    father = {
      lines = {
        { id = "f_default", text = "He came to fight a war I had already ended. I couldn't stop him, and I couldn't follow him. Please, ask me something else." },
      },
      choices = { { text = "Of course.", next = "hello", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "There are tauren who'd like a war with us. Thrall isn't one of them, and neither am I. That's where we start." } },
    burning_blade = { { id = "tp_blade", text = "Thrall's problem, and he knows it. I'll help if he asks. He won't ask." } },
    _none = { { id = "tp_none", text = "I don't know. But Tervosh might, and if he doesn't, he'll find out." } },
  },
}

P:NPC {
  key = "tervosh", id = TODO_NPC("Archmage Tervosh"), name = "Archmage Tervosh",
  bible = "bibles/dustwallow.md", role = "scholar", tier = "quest",
  communities = { "theramore" }, temper = { "brisk" }, values = { "loyal", "curious" },
  notices = { "class", "craft" },

  greetings = {
    { id = "g_tower", text = "Quickly, please. There's a great deal to do and not much day to do it in." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage. Kirin Tor? I never cared for committees myself. I prefer to be useful on my own." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Have you seen my garden? Don't step on the briarthorn. It holds a grudge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Archmage Tervosh. I advise the Lady, I read more than is good for me, and I tend a garden when the world allows it. It rarely allows it." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "The diplomat's trail ran cold, and then it ran somewhere I didn't like. Follow it. Carefully." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Shadowshard Fragments") },
          text = "Shadowshard fragments. There's an unusual energy in them. Bring me enough and I can make something of it." },
        { id = "h_garden", when = { metBefore = true }, text = "The marsh air is wonderful for herbs and terrible for parchment. I've chosen the herbs. My notes forgive me, mostly." },
      },
      choices = { { text = "I'll be quick.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not in any book I own. Which means it's either very new or very dangerous." } },
  },
}

P:NPC {
  key = "vimes", id = TODO_NPC("Captain Garran Vimes"), name = "Captain Garran Vimes",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "direct" }, values = { "dutiful", "lawful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_citadel", text = "Captain Vimes, Theramore Guard. If you've come about the inn, sit down. If not, be quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you found something." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. Yes, I speak a bit of your tongue. More than most here. It's useful in a land full of misunderstandings." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there has been at you. Get mended. I need witnesses alive." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Someone burned the Shady Rest Inn on the road north. James Hyal lost his wife and child in it. Everyone says the Horde did it. I'm not everyone." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("Inspecting the Ruins") },
          text = "Go to what's left of the inn. Look at everything. Don't decide what it means until you've seen it all." },
        { id = "h_hoofprints", when = { questActive = TODO_QUEST("Suspicious Hoofprints") },
          text = "Hoofprints, around a building orcs supposedly burned. Interesting. Let's not tell the taverns yet." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Paval Reethe. One of ours, until he wasn't. If he's involved, I want to hear it from him." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "A black shield, found where it shouldn't be. Somebody's trying very hard to make this look like something it isn't." },
      },
      choices = {
        { text = "Why don't you think it was the Horde?", next = "why" },
        { text = "I'll help.", next = "END", fx = { affinity = 2, align = { order = 1 }, standing = { theramore = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because it's too convenient. Because the Lady and the Warchief have a peace that someone would dearly like to break. And because I've been a soldier long enough to know a setup." },
      },
      choices = { { text = "Then let's find who set it.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Tauren who want the Horde to break its peace. I've no proof. Yet." } },
    _none = { { id = "tp_none", text = "Not my investigation. I've got one already, and it's plenty." } },
  },
}

P:NPC {
  key = "tesoran", id = TODO_NPC("Adjutant Tesoran"), name = "Adjutant Tesoran",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "orderly" }, values = { "dutiful", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_records", text = "Name, unit, business? Sorry. Habit. I keep the Guard's records; everyone's a form to me." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Equipment damaged in the field. I'd file a report, but you're not one of ours. Get it fixed anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Adjutant Tesoran. Every soldier in the Theramore Guard has a record, and I keep it. Including the ones who walked away." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Reethe's file. Here. Read it, then tell the Captain I never said you could." },
        { id = "h_daelin", tags = { "news" }, when = { questActive = TODO_QUEST("Daelin's Men") },
          text = "Some of the Admiral's men never accepted that his war was over. Our records say where they went. Our records are very thorough." },
        { id = "h_ink", when = { metBefore = true }, text = "I ran out of ink yesterday and had to borrow from the Archmage. His ink glows. My records glow now. Nobody will take them seriously." },
      },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "There's no file on that. Which is itself worth noting." } },
  },
}

P:NPC {
  key = "janene", id = TODO_NPC("Innkeeper Janene"), name = "Innkeeper Janene",
  bible = "bibles/dustwallow.md", role = "innkeeper", tier = "service",
  communities = { "theramore" }, temper = { "steady" }, values = { "loyal", "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in out of the damp. Dustwallow gets into your bones; a hot meal gets it out again." },
    { id = "g_home", when = { homeInn = { "Theramore Isle", "Theramore" } }, text = "Back home on the isle. Your room's dry. In Dustwallow, that's a promise worth making." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come a long way back from somewhere cold. Sit. I'll bring soup." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "One more and you'll be swimming home. The crocolisks would enjoy that more than you would." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Janene. Soldiers, sailors, mages, merchants: they all end up at my tables sooner or later. Theramore is my home, and this inn is its kitchen." },
        { id = "h_lady", when = { metBefore = true }, text = "Lady Jaina came down to the kitchen last week to thank the cooks. In person. Half of them still won't wash the hand she shook." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The sea's loud tonight. Sailors say a loud sea is a lucky sea. Sailors say a lot of things." },
      },
      choices = { { text = "Just a room, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a lot over the bar. Not that. Ask at the citadel." } },
  },
}
