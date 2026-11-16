-- The Undercity's quarters: Michael Garrett the bat handler, Anastasia Hartwell in the Magic Quarter, Apothecary Zinge in the Apothecarium. Voice: bibles/undercity.md
-- Zinge's own quests are not referenced (unsure of them); she speaks only of the Apothecarium's work in general.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "garrett", id = TODO_NPC("Michael Garrett"), name = "Michael Garrett",
  bible = "bibles/undercity.md", role = "flightmaster", tier = "service",
  communities = { "undercity" }, temper = { "dry", "calm" }, values = { "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Michael Garrett keeps the bats by the Undercity's outer gate, and he speaks of them with more warmth than he shows for most living things. He has a dry humor that reminds you he's been dead a while.",
    third = "{name} met Michael Garrett, the bat handler of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "The bats are hungry and restless, which means they're ready to fly. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The bats remember you, which is either a compliment or a warning." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living rider. The bats can smell your blood, so don't take it personally if they lick their lips." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your pet away from the roost, hunter. My bats are fond of a snack." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Michael Garrett, bat handler to the Dark Lady's city. The bats carry riders to Tarren Mill and the Sepulcher and wherever else the Forsaken have planted a flag, and they don't mind the dead on their backs, which is more than horses can say." },
      },
      again = {
        { id = "h_again", text = "What else? The bats are waiting, but bats are patient." },
        { id = "h_again2", text = "Anything more?" },
      },
      choices = {
        { text = "Why bats and not wyverns?", next = "bats" },
        { text = "Were you a handler in life?", next = "life" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Not now.", next = "END" },
      },
    },
    bats = {
      lines = {
        { id = "ba_default", text = "Bats don't shy from the dead, and they fly well in the dark, which suits us. The wind riders the orcs keep won't let a Forsaken near them, and I can't blame them, but a bat doesn't care." },
      },
      choices = {
        { text = "Do the bats care for you?", next = "bats_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_care = {
      lines = {
        { id = "bc_default", text = "As much as a bat cares for anything, which is to say they care for whoever feeds them. I feed them well, and I've not been bitten in a month, so I count that as love." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      lines = {
        { id = "li_default", text = "I kept horses in Lordaeron, before the plague, and I was good at it. The horses wouldn't have me when I came back, so the Dark Lady gave me bats, and I've found I like them better." },
      },
      choices = {
        { text = "The past is better left buried.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It's good you remember who you were.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep bats. That's what I do, and I do it well, so don't ask for a life story." } },
    advice = { { id = "tp_ad", text = "Hold on tight when the bat dives. They don't warn you, and the ground is a long way down." } },
    _none = { { id = "tp_none", text = "I don't know. Ask a bat, they know more than you'd think." } },
  },
}

P:NPC {
  key = "hartwell", id = TODO_NPC("Anastasia Hartwell"), name = "Anastasia Hartwell",
  bible = "bibles/undercity.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "precise" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "Anastasia Hartwell teaches mages in the Undercity's Magic Quarter, and she treats the arcane like a scalpel. She was a scholar in life and has lost none of her impatience with fools.",
    third = "{name} met Anastasia Hartwell, a mage trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "If you've come to learn, then listen. If you've come to waste my time, the door is behind you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust you've been practicing." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Good, at least you'll understand what I'm saying." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Death has left your mind intact, I see, so use it before it rots." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Anastasia Hartwell, of the Magic Quarter. I teach the arcane to those of the Forsaken with the wit to learn it, and to the Dark Lady's allies, when they behave." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it." },
        { id = "h_again2", text = "Anything further?" },
      },
      choices = {
        { text = "Did death change your magic?", next = "death" },
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    death = {
      lines = {
        { id = "de_default", text = "It made it colder, and clearer. The living worry about their bodies, but I have no such distractions, so I study, and I've learned more in death than I did in life." },
      },
      choices = {
        { text = "Is that worth the price?", next = "death_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_price = {
      lines = {
        { id = "dp_default", text = "I didn't choose the price, so I'll take what came with it. The Scourge took my life, and I'll take my knowledge back from them a spell at a time." },
      },
      choices = {
        { text = "Knowledge is worth any cost.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some knowledge shouldn't be taken.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "da_default", text = "Dalaran fell to the Legion, and its mages scattered like frightened birds. They wouldn't have me now anyway, so I don't waste my thoughts on them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I studied magic in life, and I study it still. Death interrupted me, but it didn't stop me." } },
    advice = { { id = "tp_ad", text = "Know your spells before you need them. Learning in the middle of a fight is how you die twice." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. Ask someone with fewer things to do." } },
  },
}

P:NPC {
  key = "zinge", id = TODO_NPC("Apothecary Zinge"), name = "Apothecary Zinge",
  bible = "bibles/undercity.md", role = "questgiver", tier = "service",
  communities = { "undercity" }, temper = { "clinical", "busy" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "Apothecary Zinge works in the Apothecarium under Master Apothecary Faranell, and she talks about her experiments the way other people talk about the weather. She doesn't look up from her work much.",
    third = "{name} met Apothecary Zinge in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch anything on the tables. Some of it bites, and some of it does worse." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see, which means you've been careful." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living one. Stand back from the vats, please, because some of these vapors are not kind to lungs that still work." },
    { id = "n_alchemist", cat = "class", when = { profession = "Alchemy" },
      text = "You've the stained fingers of an alchemist. Then you'll understand why I don't like being disturbed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Zinge, of the Royal Apothecary Society. We work for the Dark Lady, and the Master Apothecary oversees all of it, so if you've business here, it's his business first." },
      },
      again = {
        { id = "h_again", text = "What else? My mixture is reducing." },
        { id = "h_again2", text = "Ask, and quickly." },
      },
      choices = {
        { text = "What do you work on here?", next = "work" },
        { text = "What's Faranell like?", next = "faranell" },
        { text = "Never mind.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Cures for the living, poisons for the dead, and sometimes the other way round, as the Society requires. The Scourge has its plague, and we mean to know it better than its makers do." },
      },
      choices = {
        { text = "That sounds dangerous.", next = "work_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_danger = {
      lines = {
        { id = "wd_default", text = "Everything worth doing is dangerous, and what we do here is worth more than most. If an apothecary or two is lost to an accident, the Society carries on, as it always has." },
      },
      choices = {
        { text = "Results matter more than the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "No one should die for an experiment.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faranell = {
      lines = {
        { id = "fa_default", text = "Brilliant, demanding, and never satisfied, which is what a Master Apothecary ought to be. I report to him, and he reports to the Dark Lady, and I'd rather not disappoint either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm an apothecary, and I serve the Society. Anything I was before doesn't matter now." } },
    advice = { { id = "tp_ad", text = "Don't drink anything you find in the Apothecarium. I mean that most sincerely." } },
    _none = { { id = "tp_none", text = "I haven't time for that. Try the Master Apothecary, if you dare." } },
  },
}
