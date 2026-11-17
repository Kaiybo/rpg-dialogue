-- Nighthaven's small market: Geenia Sunshadow (robes), Darnall (tailoring supplies), Meliri (weapons), Kharedon (light armor).
-- Voice: bibles/nighthaven_market.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Geenia Sunshadow
---------------------------------------------------------------------------
P:NPC {
  key = "geenia", id = TODO_NPC("Geenia Sunshadow"), name = "Geenia Sunshadow", title = "Speciality Dress Maker",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "chatty" }, values = { "craft", "friendly" },
  notices = { "druid", "naked" },

  impression = {
    first = "Geenia Sunshadow makes robes for the druids of Nighthaven, and she measures every visitor with her eyes before they've said hello. She thinks a druid ought to look as good as the forest does.",
    third = "{name} met Geenia Sunshadow, the dressmaker of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Oh, come in, come in! Let me see you in the light. Yes, I thought so; you need a new robe." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew that color would bring you back to me." },
  },

  notice = {
    { id = "n_druid", cat = "druid", when = { class = "DRUID", form = { "bear", "cat" } },
      text = "Oh, druid, please don't shed on my bolts! Change back, there's a dear, and then I'll show you something beautiful." },
    { id = "n_naked", cat = "naked", when = { nearlyNaked = true },
      text = "My goodness, you need me more than anyone who has walked through that door this year. Come here and let me find you something before the Keeper sees you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Geenia Sunshadow, and I make robes for the druids who come to Nighthaven, and for anyone else with the good sense to want one. Moonglade is the most beautiful place in the world, and I don't see why the people in it should dress like they've been sleeping in a barrow den." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! I've had to learn to cut for your shoulders, and I'm still not sure I've got the horns right on the hoods. Come and stand by the window and let me take a proper look at you." },
      },
      again = { { id = "h_again", text = "What else, dear? I've a hem half-finished, but I can talk while I sew." } },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Who buys robes in Moonglade?", next = "who" },
        { text = "Where do you get your cloth?", next = "cloth" },
        { text = "Goodbye, Geenia.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Druids, mostly, from both the Horde and the Alliance, and the Keeper's peace means I sell to both and nobody minds. The tauren like heavy cloth and the night elves like it light, and I've stopped trying to make one robe that pleases both of them." } },
      choices = {
        { text = "Does the Horde ever give you trouble?", next = "who_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_horde = {
      big = true,
      lines = { { id = "wh2_default", text = "Not once, in Moonglade, though I hear the stories from Ashenvale like everyone else. Some of my neighbours say I shouldn't sell to them at all, peace or no peace." } },
      choices = {
        { text = "The peace here is sacred. Sell to anyone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your neighbours have a point. Ashenvale is still bleeding.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Darnall brings in thread and cloth from Darnassus, and I buy wool from a Horde trader who'd rather I didn't say his name. The dyes I make myself, from moonglade flowers, and those are a secret, so don't ask." } },
      choices = { { text = "I won't ask. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Robes, cloth, color, and who in Nighthaven needs a new hem." } },
    cenarion_circle = { { id = "tp_cc", text = "They're my best customers, dear, though they always want green." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about something I can sew." } },
  },
}

---------------------------------------------------------------------------
-- Darnall
---------------------------------------------------------------------------
P:NPC {
  key = "darnall", id = TODO_NPC("Darnall"), name = "Darnall", title = "Tailoring Supplies",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "dry", "precise" }, values = { "practical", "honest" },
  notices = { "tailor" },

  impression = {
    first = "Darnall sells thread and dye in Nighthaven and keeps every spool in perfect order. He answers questions exactly and stops talking the moment he's done.",
    third = "{name} met Darnall, who sells tailoring supplies in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye, needles. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Please don't touch the spools unless you're buying them." },
  },

  notice = {
    { id = "n_tailor", cat = "tailor", when = { profession = "Tailoring" },
      text = "A tailor. Good, then you know why the spools are sorted by color and not by size." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Darnall, and I supply the tailors of Nighthaven, which means Geenia, mostly, and the druids who mend their own robes. I carry thread, dye and needles, and I can tell you exactly what I have and what it costs." },
        { id = "h_tailor", when = { profession = "Tailoring" },
          text = "You're a tailor, so I'll skip the explanations. My thread is good, my dye is better, and I've runecloth thread when the Darnassus boats bring it, which is rarely." },
      },
      again = { { id = "h_again", text = "Anything else?" } },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where does it all come from?", next = "from" },
        { text = "What's Geenia like to work with?", next = "geenia" },
        { text = "Goodbye.", next = "END" },
      },
    },
    from = {
      lines = { { id = "fr_default", text = "Darnassus, by hippogryph, in small loads that Sindrayl complains about every time. A spool of thread weighs nothing, but a crate of them weighs a great deal, and she reminds me of that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    geenia = {
      big = true,
      lines = { { id = "ge_default", text = "Loud. Generous. She buys more than she needs and pays on time, which makes her my favorite customer, and she talks the whole while, which makes her my least favorite person in the village. I'd never tell her so, and I'd thank you not to either." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I might tell her. It'd make her laugh.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Thread, dye and needles. Prices on request." } },
    _none = { { id = "tp_none", text = "I don't know. I sell thread." } },
  },
}

---------------------------------------------------------------------------
-- Meliri
---------------------------------------------------------------------------
P:NPC {
  key = "meliri", id = TODO_NPC("Meliri"), name = "Meliri", title = "Weaponsmith",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "calm", "dry" }, values = { "duty", "practical" },

  impression = {
    first = "Meliri sells weapons in the most peaceful village in Kalimdor, and she knows exactly how funny that is. She keeps her blades oiled anyway.",
    third = "{name} met Meliri, who sells weapons in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Weapons, in Moonglade. Yes, I know. Still, you'll be leaving eventually." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to me. The world outside must still be the world, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Meliri, and I sell weapons in Nighthaven, where nobody is allowed to use them. The druids buy staves, and travellers buy what they need for the road back to Felwood or Winterspring, and I keep the rest polished for the day someone needs them." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "You'll be looking for something with weight to it, I'd guess. I've a few pieces in the back that the druids never look at, because the druids never want anything heavier than a stick." },
      },
      again = { { id = "h_again", text = "Something else? The village is quiet; I've time." } },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "Why sell weapons where fighting is forbidden?", next = "why" },
        { text = "Has the Keeper's peace ever been broken?", next = "peace" },
        { text = "Goodbye.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because everyone who comes to Moonglade has to leave it, and the roads out run through Felwood and Winterspring. I'd rather send a traveller out with a good blade than read their name on a Sentinel's list later." } },
      choices = { { text = "That's sensible.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    peace = {
      big = true,
      lines = { { id = "pe_default", text = "Not while I've been here. Remulos and his wardens see to that, and anyone who draws steel in Nighthaven learns very quickly how strong a druid can be. Some think a peace kept by force isn't really peace at all." } },
      choices = {
        { text = "A peace that holds is a peace, however it's kept.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forced peace only hides the war for later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Weapons, and the roads out of Moonglade." } },
    _none = { { id = "tp_none", text = "No idea. Ask one of the druids; they know everything, or say they do." } },
  },
}

---------------------------------------------------------------------------
-- Kharedon
---------------------------------------------------------------------------
P:NPC {
  key = "kharedon", id = TODO_NPC("Kharedon"), name = "Kharedon", title = "Light Armor Merchant",
  bible = "bibles/nighthaven_market.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "cheerful", "chatty" }, values = { "craft", "nature" },
  notices = { "kit" },

  impression = {
    first = "Kharedon sells leather armor in Nighthaven and talks about the animals each piece came from with real affection. He insists none of them were taken in Moonglade.",
    third = "{name} met Kharedon, who sells light armor in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, welcome! Leather from Ashenvale and Feralas, all of it, and not a scrap from Moonglade, I promise you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! How's the leather holding up?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, look at the state of your armor! Something in Felwood has been chewing on you, hasn't it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kharedon, and I sell light armor to the druids and travellers who come to Nighthaven. Every piece is leather from outside Moonglade, because the Keeper would have my hide if I skinned anything in the glade, and I'd deserve it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! You'll want leather, of course, because nobody's going to turn into a bear wearing plate. I've some soft-tanned pieces that move with you when you change, or at least don't tear." },
      },
      again = { { id = "h_again", text = "Anything else, friend?" } },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why no leather from Moonglade?", next = "why" },
        { text = "Where does your leather come from?", next = "where" },
        { text = "Goodbye.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because this is the Keeper's glade, and every creature in it lives under his protection. Hunting here would be like poaching in Cenarius's own garden, and I've no wish to explain that to Remulos." } },
      choices = { { text = "That makes sense. Something else.", next = "BACK" } },
    },
    where = {
      big = true,
      lines = { { id = "wr_default", text = "Ashenvale, Feralas, sometimes the Barrens, all of it bought from hunters who take only what they need. Some of the druids here won't buy leather at all, and tell me I'm living off death." } },
      choices = {
        { text = "A clean hunt is part of nature. Don't apologize.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "They may be right. Life should be spared where it can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Leather, tanning, and the hunters who sell to me." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, but I'd guess one of the druids could." } },
  },
}
