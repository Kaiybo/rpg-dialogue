-- Bloodhoof Village: Cairne's tribe on the plains below the bluffs. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baine", id = TODO_NPC("Baine Bloodhoof"), name = "Baine Bloodhoof",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "bloodhoof" }, temper = { "calm" }, values = { "wise", "loyal", "kind" },
  notices = { "race", "form" },

  greetings = {
    { id = "g_tent", text = "Be welcome in Bloodhoof Village. My father keeps the bluffs; I keep the plains below them." },
    { id = "g_back", when = { metBefore = true }, text = "Friend. Sit with me a moment. The village can spare me." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. My father welcomed your people, and I'll do no less. Ask if you need anything of Mulgore." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from the red city. Your Warchief helped bring my people here. We remember that." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear in my tent, and a polite one. The Earth Mother has a sense of humor." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baine Bloodhoof, Cairne's son. Goblins dig to the east, gnolls raid from the west, and dwarves blast the earth at Bael'dun. I'd rather talk them all down than fight them." },
        { id = "h_cairne", when = { heardLine = "cairne.h_default" },
          text = "You've met my father on the bluffs. He'll have told you about the land. He tells everyone; he never tires of it." },
      },
      choices = {
        { text = "What troubles the plains?", next = "troubles" },
        { text = "Why talk, if they won't listen?", next = "talk" },
        { text = "Earth Mother guide you.", next = "END", fx = { affinity = 1 } },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Venture Company cuts the land in the east, and the Palemane gnolls raid from the west. At Bael'dun, the dwarves blast the ground until the earth's spirits cry out. I warned them, and they kept digging." },
      },
      choices = {
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { bloodhoof = 1 }, align = { honor = 1 } } },
      },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "Because sometimes they do. A spear settles one quarrel. A word, spoken well, can settle a hundred." },
      },
      choices = { { text = "Wise words.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Hamuul studies with them. My father trusts them, and so do I. The land needs friends who listen to it." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're tauren, whatever else they are. I'd rather reason with them than fight them, for as long as reason works." } },
    _none = { { id = "tp_none", text = "I don't know. But I'll ask, and I'll remember you asked first." } },
  },
}

P:NPC {
  key = "zarlman", id = TODO_NPC("Zarlman Two-Moons"), name = "Zarlman Two-Moons",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class", "affliction" },

  greetings = {
    { id = "g_spirit", text = "Peace, young one. Baine tends the village in this world. I tend it in the other." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the spirit lodge. The spirits remember your step." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk close to the spirits already. I can see it. Don't be afraid of what they show you." },
    { id = "n_ghostly", cat = "affliction", place = "before", when = { resSick = true },
      text = "You've come back from the spirit's road not long ago. It leaves a mark. Rest; it fades." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zarlman Two-Moons. I look after the spirits of this village, and of the young ones passing through it." },
        { id = "h_vision", tags = { "news" }, when = { questActive = TODO_QUEST("Rite of Vision") },
          text = "The rite of vision asks you to see with more than your eyes. Drink, follow, and don't fight what you're shown." },
      },
      choices = {
        { text = "What does the rite show?", next = "vision" },
        { text = "Thank you, elder.", next = "END" },
      },
    },
    vision = {
      lines = { { id = "v_default", text = "Something different for everyone. A path, usually. Sometimes the end of one. The spirits choose; I only open the door." } },
      choices = { { text = "I'm ready.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that. I won't speak for them." } },
  },
}

P:NPC {
  key = "harken", id = TODO_NPC("Harken Windtotem"), name = "Harken Windtotem",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },

  greetings = {
    { id = "g_plains", text = "Watch the sky over Mulgore for a while. You'll see what I mean about the swoops." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you'll have a better eye for birds than most. Use it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Harken Windtotem. I keep an eye on what flies over Mulgore. Lately it's mostly swoops, and too many of them." },
        { id = "h_swoop", tags = { "news" }, when = { questActive = TODO_QUEST("Swoop Hunting") },
          text = "The swoops are thick this season. Thin them, and bring me their quills. Nothing goes to waste in this village." },
      },
      choices = { { text = "I'll see to it.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Baine; he hears more than I do." } },
  },
}

P:NPC {
  key = "maur", id = TODO_NPC("Maur Raincaller"), name = "Maur Raincaller",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "solemn" }, values = { "brave" },
  notices = { "kit" },

  greetings = {
    { id = "g_rain", text = "Rain's coming. I can smell it on the wind. Good for the grass, bad for tracking." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out in the grass had a go at you. Get mended before you go after anything bigger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maur Raincaller. There's a beast in Mulgore the young hunters whisper about. I've seen its tracks. I'd like to see its hide." },
        { id = "h_mazz", tags = { "news" }, when = { questActive = TODO_QUEST("Mazzranache") },
          text = "Mazzranache. Find it, end it, and bring me proof. The young ones will stop whispering and start bragging." },
      },
      choices = { { text = "I'll find it.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not something I've tracked." } },
  },
}

P:NPC {
  key = "mull", id = TODO_NPC("Mull Thunderhorn"), name = "Mull Thunderhorn",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "worried" }, values = { "devout", "protective" },
  notices = { "race" },

  greetings = {
    { id = "g_wells", text = "Forgive me. My mind is on the wells. It's always on the wells, lately." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Tell me the water runs clean somewhere." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're of the plains. Then the wells are yours too. Help me cleanse them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mull Thunderhorn. The sacred wells of Mulgore are sick. Goblins set up beside them, and now the water tastes of oil and worse." },
        { id = "h_poison", tags = { "news" }, when = { questActive = TODO_QUEST("Poison Water") },
          text = "The creatures that drink from the wells are sickening too. Bring me proof of it, so I know how deep the poison runs." },
        { id = "h_cleanse", when = { any = { { questActive = TODO_QUEST("Winterhoof Cleansing") }, { questActive = TODO_QUEST("Thunderhorn Cleansing") }, { questActive = TODO_QUEST("Wildmane Cleansing") } } },
          text = "Take the totem to the well and let it work. The earth remembers clean water; we only have to remind it." },
        { id = "h_totem", when = { any = { { questActive = TODO_QUEST("Thunderhorn Totem") }, { questActive = TODO_QUEST("Wildmane Totem") } } },
          text = "A totem must be made before a well can be cleansed. Gather what it needs, and I'll do the rest." },
      },
      choices = {
        { text = "Who poisoned them?", next = "who" },
        { text = "I'll help cleanse them.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Venture Company, with their machines and their spills. They don't mean it, I think. They simply don't care. Somehow that's worse." } },
      choices = { { text = "It is.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my thoughts are with the water. Ask Baine." } },
  },
}

P:NPC {
  key = "ahab", id = TODO_NPC("Ahab Wheathoof"), name = "Ahab Wheathoof",
  bible = "bibles/mulgore.md", role = "farmer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "anxious" }, values = { "kind" },
  notices = { "pet" },

  greetings = {
    { id = "g_kyle", text = "Oh! Hello, traveler. You haven't seen a dog, have you? Brown, scruffy, never sits still?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Any sign of him? Any at all?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine companion you have. Keep him close. Don't ever let him wander off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ahab Wheathoof. I keep a little ranch by the lake. Kept a dog, too, until he ran off. Kyle. He's never gone this long." },
        { id = "h_kyle", tags = { "news" }, when = { questActive = TODO_QUEST("Kyle's Gone Missing!") },
          text = "If you find him, he'll be hungry. He's always hungry. Bring him something tasty and he'll follow you anywhere." },
        { id = "h_kyle_done", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") },
          text = "He's home! Look at him. Kyle, sit. Sit. He won't sit. I don't care. He's home." },
      },
      choices = {
        { text = "I'll keep an eye out for him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It's only a dog.", next = "END", fx = { affinity = -2 } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Sorry, I can't think about anything else until Kyle's home." } },
  },
}

P:NPC {
  key = "kauth", id = TODO_NPC("Innkeeper Kauth"), name = "Innkeeper Kauth",
  bible = "bibles/mulgore.md", role = "innkeeper", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in from the grass and the wind. There's stew, and a hide to sleep on." },
    { id = "g_home", when = { homeInn = { "Bloodhoof Village" } }, text = "Your sleeping hide is aired and ready. The wind is kind tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin. Sit by the fire until the color comes back." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "The village brew is stronger than it tastes. Most learn that once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Kauth. Travelers come through on the way to the bluffs, and all of them leave fed." },
        { id = "h_task", when = { questActive = TODO_QUEST("A Task Unfinished") },
          text = "There's a task left undone that weighs on me. You'll carry it further than I can." },
      },
      choices = { { text = "Just a meal, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a little of everything and keep less. Ask Baine." } },
  },
}
