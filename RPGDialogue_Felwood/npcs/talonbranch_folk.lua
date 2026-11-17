-- Talonbranch Glade's keepers: Kaerbrus (hunter trainer, with his cat Shi'alune), Malygen (general goods),
-- Mylini Frostmoon (weapon merchant).
-- Voice: bibles/talonbranch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kaerbrus
---------------------------------------------------------------------------
P:NPC {
  key = "kaerbrus", id = TODO_NPC("Kaerbrus"), name = "Kaerbrus", title = "Hunter Trainer",
  bible = "bibles/talonbranch_folk.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet", "watchful" }, values = { "nature", "loyal" },
  notices = { "pet", "hunter" },

  impression = {
    first = "Kaerbrus trains hunters at Talonbranch Glade with his nightsaber Shi'alune lying at his feet. He looks at your pet before he looks at you.",
    third = "{name} met Kaerbrus, the night elf hunter trainer at Talonbranch Glade, and his cat Shi'alune.",
  },

  greetings = {
    { id = "g_default", text = "Shi'alune doesn't mind you, so neither do I. What do you need?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, this far into Felwood. Come, let's see what you've learned on the way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Shi'alune remembered you before I did." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} away from the streams, and away from anything in Felwood that's still moving after it should be dead. Beasts trust their noses, and their noses lie here." },
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER", minLevel = 58 },
      text = "You've the look of someone who could speak to the Ancients in the Irontree Woods. They don't talk to many hunters, but they might talk to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kaerbrus, and I train hunters for the Sentinels here at Talonbranch. Shi'alune and I have kept this glade for a long time, and between us we've learned what Felwood does to a beast that drinks the wrong water." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Good, then you can learn from me, and you can also learn from this forest, which is a harsher teacher. Watch the bears and wolves here, because the corruption has made them strong and stupid in the same breath." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and this is a Sentinel glade, so I'd keep your weapons put away. I'll answer what you ask, though Shi'alune has her own opinions about your people." },
      },
      again = {
        { id = "h_again", text = "Something else? Shi'alune is asleep, so speak quietly." },
        { id = "h_again2", text = "Ask. I have the time while the glade is quiet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Tell me about Shi'alune.", next = "cat" },
        { text = "What does the corruption do to beasts?", next = "beasts" },
        { text = "What are the Ancients in the Irontree Woods?", next = "ancients", when = { class = "HUNTER" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    cat = {
      lines = { { id = "ca_default", text = "She was a cub when I found her by a dead moonwell in Ashenvale, too weak to stand. She's been at my side since, and she has never once drunk from a Felwood stream, because I taught her to smell the sickness before she tasted it." } },
      choices = {
        { text = "She's beautiful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Can you teach that to my pet?", next = "beasts" },
      },
    },
    beasts = {
      big = true,
      lines = { { id = "be_default", text = "It makes them grow big and angry, and then it makes them rot while they're still walking. Some hunters here won't tame anything in Felwood at all. Others say a beast that survives the corruption is the strongest companion there is." } },
      choices = {
        { text = "A corrupted beast should be put down, not tamed.", next = "beasts_end", fx = { align = { order = 1 } } },
        { text = "If it's strong and survives, I'll tame it.", next = "beasts_end", fx = { align = { order = -1 } } },
        { text = "What do you do?", next = "beasts_end" },
      },
    },
    beasts_end = {
      lines = { { id = "bee_default", text = "I put them down, and I do it quickly, and I don't enjoy it. Shi'alune watches me do it every time, and I like to think she understands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ancients = {
      lines = { { id = "an_default", text = "Spirits of the Ancients of Lore, who died at Hyjal and never quite left. Vartrus and his brothers speak to hunters who've proven themselves, and what they ask is hard, but I've never heard of a hunter who regretted it." } },
      choices = { { text = "I'll seek them out. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, the glade, and the hunters who train here." } },
    advice = { { id = "tp_ad", text = "Watch your pet's nose. If it won't drink, neither should you." } },
    sentinels = { { id = "tp_sent", text = "I train their scouts. They come to me green and leave knowing which bushes bite." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Shi'alune, and she'll tell you just as much." } },
  },
}

---------------------------------------------------------------------------
-- Malygen
---------------------------------------------------------------------------
P:NPC {
  key = "malygen", id = TODO_NPC("Malygen"), name = "Malygen", title = "General Goods",
  bible = "bibles/talonbranch_folk.md", role = "vendor", tier = "service",
  communities = { "talonbranch" }, temper = { "fussy", "earnest" }, values = { "careful", "practical" },

  impression = {
    first = "Malygen sells provisions at Talonbranch Glade and seals every waterskin himself. He talks about clean water the way other merchants talk about gold.",
    third = "{name} met Malygen, who sells general goods at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Talonbranch. Everything I sell came from outside Felwood, and I'm proud of that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good, you're still alive, so you must be buying the right things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Malygen, and I keep the glade supplied with food, water, thread and anything else that can be carried over the mountains from Ashenvale. I don't sell a single thing grown in Felwood, and I'd advise you not to eat one either." },
        { id = "h_ghost", when = { deaths = { min = 10 } },
          text = "You have the look of someone who's been sent back from the spirit healer more than once. Buy some bandages, and buy some water, and please stop drinking from the streams." },
      },
      again = { { id = "h_again", text = "Anything else, before the next caravan's due?" } },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How do you get supplies here?", next = "caravan" },
        { text = "Is the water really that bad?", next = "water" },
        { text = "Farewell.", next = "END" },
      },
    },
    caravan = {
      lines = { { id = "cv_default", text = "Over the road from Ashenvale, past Irontree and the Jadefire, which is why everything costs what it costs. Every load that makes it is a small victory, and I've lost three wagons this year to satyrs who couldn't even eat what was in them." } },
      choices = {
        { text = "That's a hard road to keep open.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water = {
      big = true,
      lines = { { id = "wa_default", text = "Worse. A Sentinel drank from Bloodvenom Falls on a dare last spring, and she was sick for a month and has never quite been right since. The Horde camp below the falls still drinks it, and I've stopped trying to decide if they're brave or simply foolish." },
      },
      choices = {
        { text = "Someone should warn them, Horde or not.", next = "water_warn", fx = { align = { honor = 1 } } },
        { text = "Let them drink it. One less Horde camp.", next = "water_warn", fx = { align = { honor = -1 } } },
        { text = "Is there no clean water here at all?", next = "water_warn" },
      },
    },
    water_warn = {
      lines = { { id = "ww_default", text = "Only the moonwell, and the druids at the Emerald Sanctuary guard theirs like treasure. So I seal every skin myself, and I sell them to anyone who asks, and the rest is not my business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, the road from Ashenvale, and which water won't kill you." } },
    advice = { { id = "tp_ad", text = "Never drink from a stream in Felwood. Never." } },
    _none = { { id = "tp_none", text = "I'm a merchant, friend. Ask me about bread and thread." } },
  },
}

---------------------------------------------------------------------------
-- Mylini Frostmoon
---------------------------------------------------------------------------
P:NPC {
  key = "mylini", id = TODO_NPC("Mylini Frostmoon"), name = "Mylini Frostmoon", title = "Weapon Merchant",
  bible = "bibles/talonbranch_folk.md", role = "vendor", tier = "service",
  communities = { "talonbranch" }, temper = { "blunt", "brisk" }, values = { "duty", "practical" },
  notices = { "kit" },

  impression = {
    first = "Mylini Frostmoon sells weapons to the Sentinels at Talonbranch Glade and judges every blade by whether it would stop a satyr. She has no patience for decoration.",
    third = "{name} met Mylini Frostmoon, the weapon merchant at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Looking for a weapon? Good, because this forest is looking for you." },
    { id = "g_back", when = { metBefore = true }, text = "Still carrying what I sold you? Then it's held, and so have you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That blade's half gone. If you meet a Jadefire satyr with it in that state, you'll be wishing you'd stopped here first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mylini Frostmoon, and I keep the Sentinels at Talonbranch armed. I sell blades, staves and bows that will hold up against satyrs, wolves and worse, and I don't sell anything pretty." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, and you've been using that weapon hard by the look of it. Satyrs have horns as tough as oak, so you'll want weight behind your blade up here." },
      },
      again = { { id = "h_again", text = "What else? I've a patrol coming in to rearm soon." } },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "What works best against satyrs?", next = "satyrs" },
        { text = "Why does Talonbranch need so many weapons?", next = "glade" },
        { text = "Goodbye.", next = "END" },
      },
    },
    satyrs = {
      lines = { { id = "sa_default", text = "Something heavy, or something sharp enough to find the throat, because their hide turns a glancing blow. The Jadefire to the south and the satyrs of the Irontree woods both fight dirty, so don't wait for them to come to you." } },
      choices = {
        { text = "Who were the satyrs, once?", next = "satyrs_once" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satyrs_once = {
      big = true,
      lines = { { id = "so_default", text = "Kaldorei, the old stories say, Highborne who bargained with the Legion and were twisted for it. Some Sentinels won't hear it said, because they don't like thinking that the things they kill were once our own people." } },
      choices = {
        { text = "Whatever they were, they chose this. Kill them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It's a terrible thing, even so. Pity them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade = {
      lines = { { id = "gl_default", text = "Because we're the only Alliance post in all of Felwood, between the satyrs and the furbolgs and the Horde at Bloodvenom. Every Sentinel who goes out on patrol comes back with a notched blade, if she comes back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Weapons, and what they're for in this forest." } },
    satyrs = { { id = "tp_sat", text = "Aim for the throat. Their hides are too thick for anything else." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask someone who isn't busy." } },
  },
}
