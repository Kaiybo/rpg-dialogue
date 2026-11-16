-- Cenarion Hold's tradesfolk (0.39.0): the enchanting supplier upstairs at the inn, the reagent and poison
-- seller, and the stable master. Voice: bibles/silithus.md ("Hold tradesfolk")
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kania", id = TODO_NPC("Kania"), name = "Kania", title = "Enchanting Supplies",
  bible = "bibles/silithus.md", role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "precise" }, values = { "craft", "careful" },
  notices = { "craft", "arcane" },

  impression = {
    first = "Kania sells enchanting supplies from a quiet corner upstairs in the inn at Cenarion Hold, away from the sand. She keeps her formulae wrapped in cloth and speaks about them like rare plants.",
    third = "{name} met Kania, who sells enchanting supplies upstairs at the inn in Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Please, brush the sand from your boots before you come near the table. Rods and dusts don't care for grit any more than I do." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You carry the faint shimmer of an enchanter about you, it's in your fingers. You'll want to see what I have, then, and I've a formula or two you won't find in Darnassus." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage, all the way out here! Mind your spells near my table, if you would; a stray spark among these dusts would be a very bright mistake." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kania, and I sell enchanting supplies to the Hold. Rods, vellum, dusts and a few rare formulae, kept up here in the inn where the sandstorms can't scour them." },
      },
      again = {
        { id = "h_again", text = "Was there something more you wished to ask?" },
        { id = "h_again2", text = "I'm listening, though I'll keep sorting while we talk." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why keep your shop upstairs?", next = "upstairs" },
        { text = "Who needs enchanting out in the desert?", next = "who" },
        { text = "Goodbye.", next = "END" },
      },
    },
    upstairs = {
      lines = { { id = "u_default", text = "Because sand gets into everything on the ground floor, and a grain of it in a powdered dust can spoil an enchantment completely. Calandrath was kind enough to give me this corner, and I've kept it spotless ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Everyone who fights the silithid, sooner or later. Their claws and their acid wear through plain steel, so the soldiers come to me for something that will keep a cloak whole and a blade sharp a little longer." } },
      choices = {
        { text = "Do the formulae help against the hives?", next = "who_resist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_resist = {
      lines = { { id = "wr_default", text = "Some of them do. A cloak that turns away fire or poison has saved more than one scout in these dunes, and I'd rather sell those than anything prettier." } },
      choices = {
        { text = "Useful work matters more than beauty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fine enchantment is its own reward.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies to enchanters. I came to the Hold because they needed them here more than anywhere else." } },
    advice = { { id = "tp_ad", text = "Keep your dusts sealed, always. One sandstorm and you'll be enchanting with a pinch of desert." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle holds the line against the hives. I make sure the people holding it have what they need." } },
    _none = { { id = "tp_none", text = "I'm afraid I know very little outside my craft." } },
  },
}

P:NPC {
  key = "khur", id = TODO_NPC("Khur Hornstriker"), name = "Khur Hornstriker", title = "Reagents",
  bible = "bibles/silithus.md", role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "calm" }, values = { "careful", "nature" },
  notices = { "class" },

  impression = {
    first = "Khur Hornstriker sells reagents and poisons at Cenarion Hold and handles both with the same unhurried care. He finds it no stranger for a tauren of the Circle to sell poison than to sell herbs.",
    third = "{name} met Khur Hornstriker, the tauren who sells reagents and poisons at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Reagents for spellcasters, and poisons for those who need them. Tell me which you need, and keep your hands away from the second shelf until I've handed it to you." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You'll be wanting the poison makings, I expect. I sell them freely, but use them on the silithid, little one, not on anybody standing in this Hold." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman's ankh will need replacing, sooner or later, out in a land this angry. I keep plenty in stock, because the spirits here are restless." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Khur Hornstriker, and I sell reagents and poisons to those who stand with the Hold. Candles and powders for the casters, venom makings for the rogues, and plain good sense for anyone who'll take it." },
      },
      again = {
        { id = "h_again", text = "What else would you know, friend, while the desert wind is quiet?" },
        { id = "h_again2", text = "Ask. I am in no hurry, and neither is the desert." },
      },
      choices = {
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "A druid's ally who sells poison?", next = "poison" },
        { text = "What do the silithid do to people here?", next = "silithid" },
        { text = "Goodbye.", next = "END" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "The scorpion and the spider carry poison too, and the Earth Mother made them. A poison on a blade that cuts through a silithid's shell serves the land as well as any herb, if it's used against the right enemy." } },
      choices = {
        { text = "Poison is a coward's tool, whoever it's used on.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Whatever brings the hives down is worth using.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid = {
      lines = { { id = "s_default", text = "They poison and they burrow, and they spread their hives across the dunes like a sickness. Half of what I sell for healing goes to treating their stings, and the soldiers come back to me with burns from their acid." } },
      choices = {
        { text = "Where do they come from?", next = "silithid_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_where = {
      lines = { { id = "sw_default", text = "From the south, beyond the hives, where the old walls stand. The Watchers and the commander know more than I do, and they keep it to themselves, which tells me it's nothing good." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I walked from Mulgore to stand with the Circle. What I left behind there is my own business." } },
    advice = { { id = "tp_ad", text = "Carry an antivenom in Silithus, always. The scorpids here don't warn you before they strike." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle protects the land from those who would poison it, which is why I sell poison only to its friends." } },
    _none = { { id = "tp_none", text = "I don't know that, friend, but the Commander might." } },
  },
}

P:NPC {
  key = "leoren", id = TODO_NPC("Squire Leoren Mal'derath"), name = "Squire Leoren Mal'derath", title = "Stable Master",
  bible = "bibles/silithus.md", role = "stablemaster", tier = "service",
  communities = { "cenarion_hold" }, temper = { "earnest" }, values = { "dutiful", "kind" },
  notices = { "pet" },

  impression = {
    first = "Squire Leoren Mal'derath keeps the stables at Cenarion Hold and takes the title of squire very seriously. He's earnest and a little young, and he treats every boarded beast as a soldier in his charge.",
    third = "{name} met Squire Leoren Mal'derath, the young night elf who keeps the stables at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Hold's stables! Every animal here is fed, watered and brushed free of sand twice a day, and I'll swear to it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your {pet} has sand in its coat, friend. Let me brush it out before you go back into the dunes, because sand rubs a beast raw in a day." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Squire Leoren Mal'derath, stable master of Cenarion Hold! I board the companions of every hunter who comes to fight for the Circle, and I treat them as I would the commander's own mount." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've three stalls to muck out before the heat." },
        { id = "h_again2", text = "Please, ask whatever you like. I enjoy the company." },
      },
      choices = {
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why call yourself a squire?", next = "squire" },
        { text = "What's hard about keeping beasts here?", next = "sand" },
        { text = "Goodbye.", next = "END" },
      },
    },
    squire = {
      lines = { { id = "sq_default", text = "Because I serve the Hold, and everyone here serves something greater than themselves. A stable master can be a squire too, if he keeps the beasts as well as a squire keeps his knight's arms." } },
      choices = {
        { text = "That's a fine way to see your work.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A stable's a stable, whatever you call it.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand = {
      lines = { { id = "sa_default", text = "Sand and heat, and the scorpids that crawl in under the walls at night. I check every stall with a lantern before I sleep, and I've caught three of them so far this month." } },
      choices = {
        { text = "What do you do with the scorpids?", next = "sand_scorpid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand_scorpid = {
      lines = { { id = "ss_default", text = "I take them outside on the end of a pitchfork and throw them as far as I can. Captain Kozus says I should just kill them, but they're only doing what scorpids do, and I'd rather not." },
        { id = "ss_hunter", when = { class = "HUNTER" }, text = "I carry them out on a pitchfork and throw them over the wall, though I suppose a hunter would just tame one. Captain Kozus says I should kill them, but I haven't the heart." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm young, as my people count it, and this is my first post. I mean to do it well." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning in Silithus, because scorpids love a warm boot." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle guards Silithus for all of Kalimdor, and I'm proud to keep its stables." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Ask Captain Kozus; he knows everything that happens in the Hold." } },
  },
}
