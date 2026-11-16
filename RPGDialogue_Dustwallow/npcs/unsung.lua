-- Theramore's shopkeepers with nothing to say until now: the general store, the armorer and the weaponsmith. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "charity_mipsy", id = TODO_NPC("Charity Mipsy"), name = "Charity Mipsy",
  title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "cheerful", "busy" }, values = { "kind", "practical" },
  notices = { "hunger", "weary" },

  impression = {
    first = "Charity Mipsy runs Theramore's general store and talks about the marsh as though it were a badly behaved neighbor. She seemed to know every soldier's boot size and every sailor's sweet tooth.",
    third = "{name} met Charity Mipsy, who keeps the general store in Theramore.",
  },

  greetings = {
    { id = "g_shop", text = "Come in, come in! Bread, flasks, rope and torches, and dry socks, which you'll want in this marsh." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Still keeping your feet dry, I hope?" },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "It's supper time, dear, and you look as though you skipped dinner too. Buy a loaf before the guards come in off watch and clear me out." },
    { id = "n_ressick", cat = "weary", when = { resSick = true },
      text = "Oh, you're pale as milk, dear! The marsh got you, did it? Sit on that barrel a moment before you do anything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Charity Mipsy, general supplies. Everything Theramore needs that doesn't come out of a forge or a spellbook comes through my door, and the marsh eats through all of it faster than the ships can bring more." },
      },
      again = {
        { id = "h_again", text = "What else, dear? I'm only stacking flour sacks; I can listen." },
        { id = "h_again2", text = "Yes, dear? Ask away." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What do I need to survive the marsh?", next = "marsh" },
        { text = "How do supplies reach the isle?", next = "ships" },
        { text = "What's life like here, under Lady Jaina?", next = "jaina" },
        { text = "Nothing today, thanks.", next = "END" },
      },
    },
    marsh = {
      lines = {
        { id = "m_default", text = "Dry socks, a flask of clean water and a torch that'll stay lit in the damp, dear, that's the whole secret. The water out there will give you a fever, and the mosquitoes will drain what the fever leaves you." },
      },
      choices = {
        { text = "And what's dangerous out there?", next = "marsh_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_danger = {
      lines = {
        { id = "md_default", text = "Raptors in the reeds, ogres to the west in the Stonemaul ruins, and black dragons down in the south where the guards won't go. Stay on the road and come home before dark, and you'll be all right, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    ships = {
      lines = {
        { id = "s_default", text = "By boat from Menethil, mostly, across the sea from the Wetlands. When the weather's good I have more stock than shelves, and when a storm comes in I'm rationing candles and listening to the guards complain." },
      },
      choices = {
        { text = "Is there no road to the rest of Kalimdor?", next = "ships_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_road = {
      lines = {
        { id = "sr_default", text = "There's the road north through the marsh to the Barrens, dear, but you'd be walking through Horde country, and nobody hauls flour that way. The sea's slower, but nobody shoots at you on it, unless you count the gulls." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jaina = {
      lines = {
        { id = "j_default", text = "Quiet, dear, and I mean that kindly. Lady Jaina keeps the peace with the orcs, and some grumble that it's soft, but I've lived through the war, and I'll take a quiet shop over a brave one any day." },
      },
      choices = {
        { text = "Peace with the orcs is wise.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The orcs can't be trusted for long.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Who grumbles?", next = "jaina_grumble" },
      },
    },
    jaina_grumble = {
      lines = {
        { id = "jg_default", text = "Old sailors from Kul Tiras, mostly, who still talk about the admiral after a few drinks. I tell them the war's over and they're in a free town, and then I sell them more bread." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came over on one of the first ships with Lady Jaina's people, and I've kept shop here since the walls went up." } },
    advice = { { id = "tp_ad", text = "Change your socks every single night in this marsh, dear, and I mean every night, or your feet will rot." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. Ask the adjutant at the citadel; he knows everything that's written down." } },
  },
}

P:NPC {
  key = "hans_weston", id = TODO_NPC("Hans Weston"), name = "Hans Weston",
  title = "Armorer & Shieldsmith",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "theramore" }, temper = { "gruff", "proud" }, values = { "dutiful", "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Hans Weston makes armor and shields for Theramore's guard and grumbles at the damp the way other men grumble at the king. He clearly takes rust as a personal enemy.",
    third = "{name} met Hans Weston, the armorer and shieldsmith of Theramore.",
  },

  greetings = {
    { id = "g_forge", text = "Armor and shields, made for the guard and sold to anyone who pays. Keep your hands off the oiled pieces." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Let's see if you've kept the rust off this time." },
  },

  notice = {
    { id = "n_rust", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Look at that. Rusted at the joints and dented at the front, which tells me you've been wading in the marsh and getting hit while you did it." },
    { id = "n_shield", cat = "class", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } },
      text = "You'd carry a shield, by the look of you. Good, because there's no better friend against a raptor than a stout board of oak and iron." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hans Weston, armorer and shieldsmith. I make the guard's plate and their shields, and I spend half my days scraping rust off what I made the week before, because this marsh rots steel faster than anywhere I've ever worked." },
      },
      again = {
        { id = "h_again", text = "What else? I've got plates cooling." },
        { id = "h_again2", text = "Speak up. The hammer drowns out quiet voices." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "How do you fight the rust?", next = "rust" },
        { text = "Who do you make shields for?", next = "guard" },
        { text = "Plate or mail for the marsh?", next = "plate" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Good day.", next = "END" },
      },
    },
    rust = {
      lines = {
        { id = "r_default", text = "Oil, and more oil, and a fire in the forge all night to keep the damp out of the shop. Every piece goes out with a rag and a little flask, and every soldier forgets to use them, so every piece comes back." },
      },
      choices = {
        { text = "I'll remember to oil mine.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = {
        { id = "g_default", text = "The Theramore Guard first, and I'm proud of it; Captain Vimes's men carry my shields on every patrol. What's left over, I sell, and there's never as much left over as you'd like." },
      },
      choices = {
        { text = "What do the patrols face out there?", next = "guard_patrols" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_patrols = {
      lines = {
        { id = "gp_default", text = "Ogres, mostly, and they hit like falling trees. I've had shields come back split clean in half, and the men behind them came back with broken arms and said they were lucky, and they were." },
      },
      choices = {
        { text = "Then make them thicker.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = {
        { id = "p_default", text = "Mail, if you've any sense, because plate in this heat will cook you and the mud will swallow you if you fall. The guard wears plate because the guard stands on walls, and you'll be wading through bogs." },
      },
      choices = {
        { text = "Plate's worth the weight.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "I'll go light and quick.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "s_default", text = "Then you'll know what the damp does to a quench. Hammer your pieces thicker at the joints than you would up north, and never leave them unoiled overnight, or you'll be starting over in the morning." },
      },
      choices = {
        { text = "Good advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a shieldsmith in Kul Tiras before I followed Lady Jaina's ships here. The work's the same, but the weather's worse." } },
    advice = { { id = "tp_ad", text = "Oil it every night, or don't bother buying it." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and I've plates cooling. Ask the inn." } },
  },
}

P:NPC {
  key = "piter_verance", id = TODO_NPC("Piter Verance"), name = "Piter Verance",
  title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "blacksmith", tier = "service",
  communities = { "theramore" }, temper = { "easy", "talkative" }, values = { "practical", "honest" },
  notices = { "class", "race" },

  impression = {
    first = "Piter Verance sells weapons in Theramore and has an easy manner that doesn't match the trade. He spoke of Theramore's peace with real fondness and of the marsh's beasts with real respect.",
    third = "{name} met Piter Verance, a weaponsmith of Theramore.",
  },

  greetings = {
    { id = "g_forge", text = "Swords, axes, maces, and a spear or two for the long-armed. Have a look, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. My work must be holding up." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You'll want something short and quiet, I expect. I've a rack of good daggers by the door, friend, and they sell best to people with your look." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Go on, pick one up and tell me what's wrong with it; every dwarf who comes in here does. I don't mind, mind you; half the time you're right." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Piter Verance, weaponsmith. I forge for the guard and sell to anyone who's headed into the marsh, which is everybody sooner or later, and I do my best to send you out with something that won't fail you in the mud." },
      },
      again = {
        { id = "h_again", text = "Something else you need from the weapon racks?" },
        { id = "h_again2", text = "Ask away; Hans does the shouting in this part of town, not me." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What's the best weapon for the marsh?", next = "marsh" },
        { text = "Do you work alongside Hans Weston?", next = "hans" },
        { text = "Do you ever sell to the Horde?", next = "horde" },
        { text = "Not right now.", next = "END" },
      },
    },
    marsh = {
      lines = {
        { id = "m_default", text = "Something with reach, friend, because the raptors come at you fast and low, and you want them to meet the point before they meet you. A spear or a long sword does the job; a dagger means you've let them get too close." },
      },
      choices = {
        { text = "And against the ogres?", next = "marsh_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_ogres = {
      lines = {
        { id = "mo_default", text = "Something heavy, and friends standing beside you. An ogre's hide turns an edge, so the guard carries maces when they go west toward the Stonemaul, and they never go in fewer than four." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hans = {
      lines = {
        { id = "h_hans", text = "Side by side, and we share a forge fire to save on coal. He makes the shields and I make what goes over the top of them, and we argue about the weather every morning, and then we get to work." },
      },
      choices = {
        { text = "Sounds like a good partnership.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "hz_default", text = "Never, friend, though one or two have asked through traders at the docks. Lady Jaina keeps the peace with Brackenwall, and I'm glad of it, but peace doesn't mean I arm the people the guard might have to fight next year." },
      },
      choices = {
        { text = "That seems sensible.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arms sold for peace might keep it.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Do you think the peace will last?", next = "horde_last" },
      },
    },
    horde_last = {
      lines = {
        { id = "hl_default", text = "I hope so, but I'm not betting the shop on it. The Shady Rest burned not far up the road, and folk are still arguing over whose doing it was, and that sort of thing has a way of turning into a war." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the trade in Lordaeron and came south with the refugees when the plague came. Theramore gave me a forge, and I've not looked back since." } },
    advice = { { id = "tp_ad", text = "Clean your blade after every fight, friend. The marsh water eats steel overnight." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, sorry. I only know steel and the weather, and the weather's always wet." } },
  },
}
