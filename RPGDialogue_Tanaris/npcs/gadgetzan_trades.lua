-- Gadgetzan's tradesmen with nothing to say until now (0.39.0): the auction house, the stables,
-- the engineering hut and the mining trainer. Voice: bibles/tanaris.md ("Gadgetzan's trades")
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "beardo", id = TODO_NPC("Auctioneer Beardo"), name = "Auctioneer Beardo",
  bible = "bibles/tanaris.md", role = "auctioneer", tier = "service",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "profit" },
  notices = { "purse" },

  impression = {
    first = "Auctioneer Beardo runs Gadgetzan's auction house, where Horde and Alliance goods share one ledger. He talks prices the way other people talk weather, and he never once stopped smiling.",
    third = "{name} met Auctioneer Beardo, who runs the neutral auction house in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Buying or selling, friend? Either way the Cartel takes its little slice, and either way I'm happy to see you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Something of yours sold while you were out, or it didn't, and either way I've got a listing with your name on it." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 2000000 } },
      text = "Now there's a purse that walks into an auction house and makes the whole room sit up straight. Welcome, welcome, and do browse slowly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Auctioneer Beardo, at your service. This is the only house in Kalimdor where an orc can bid on a dwarf's old boots and nobody gets stabbed for it, so long as the Bruisers are watching." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The bidding never sleeps, friend, and neither do I, mostly. Desert nights are cool enough that the buyers come out like scorpions." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The ledger's open." },
        { id = "h_again2", text = "Still with me? Good, because talking is free, and that makes it the only thing in here that is." },
      },
      choices = {
        { text = "Show me what's up for auction.", next = "BUSINESS" },
        { text = "How is this house different from the city ones?", next = "neutral" },
        { text = "What sells best out here?", next = "sells" },
        { text = "Ever had stolen goods come through?", next = "stolen", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "In Stormwind or Orgrimmar you only sell to your own side. Here the Cartel lists everything for everyone, Horde and Alliance alike, and charges a bigger cut for the privilege." },
        { id = "n_horde", when = { faction = "Horde" }, text = "In Orgrimmar you'd only sell to orcs and their friends. Here the Alliance can bid on your goods too, and the Cartel takes a bigger cut for making that possible." } },
      choices = {
        { text = "Why is the cut so much bigger?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "Because neutrality costs money, friend. Somebody has to pay the Bruisers who keep both sides civil, and somebody has to haul your goods across a desert, and that somebody is the commission." } },
      choices = {
        { text = "Peace between the factions is worth paying for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sounds like a goblin excuse for gouging.", next = "cut_gouge", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut_gouge = {
      lines = { { id = "cg_default", text = "Gouging is when you've got no choice, friend, and you can always walk back to your own city's house. But you came here, which tells me the price was worth it after all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "s_default", text = "Water skins and potions go fast, because the dunes are thirsty work. After that it's anything people drag out of Zul'Farrak, and cloth, always cloth, because everybody needs bandages sooner or later." } },
      choices = {
        { text = "Who buys the Zul'Farrak goods?", next = "sells_zf", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_zf = {
      lines = { { id = "sz_default", text = "Collectors in Booty Bay, mostly, and the odd scholar who wants a troll's idol for his shelf. I don't ask what happened to the troll, and I'd advise you not to tell me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stolen = {
      lines = { { id = "st_default", text = "Every item in this house was honestly found by somebody, friend, and I've no reason to wonder where. If the owner turns up with a receipt, the Bruisers will take it from there, and that's all I'll say." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've called bids for the Cartel longer than you've been carrying that pack, and I've never once missed a sale I could have made." } },
    advice = { { id = "tp_ad", text = "Never list something the morning after a big raid comes back, because everyone else is selling the same thing and the price drops like a stone." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel makes the rules here, and the rules are simple: everybody trades, nobody fights, and the house always takes its cut." } },
    _none = { { id = "tp_none", text = "If it isn't up for auction, I couldn't tell you what it's worth, and if I can't price it, I don't know about it." } },
  },
}

P:NPC {
  key = "laziphus", id = TODO_NPC("Laziphus"), name = "Laziphus", title = "Stable Master",
  bible = "bibles/tanaris.md", role = "stablemaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "weary" }, values = { "careful" },
  notices = { "pet" },

  impression = {
    first = "Laziphus keeps the stables in Gadgetzan and fights the heat on behalf of every animal in them. He pays the Water Company more than he'd like and complains about it to anyone who stands still.",
    third = "{name} met Laziphus, the goblin who keeps the stables in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Mind the troughs, they're full, and that's more than I can say for my purse after the Water Company's been round." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your {pet} is panting, friend. Let it have a drink before we talk business, because a hot beast is a cranky beast." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Laziphus, stable master. Hunters leave their beasts with me while they travel, and I keep them fed, watered and out of the sun, which in Tanaris is the hard part." },
        { id = "h_noon", when = { timeOfDay = "day" },
          text = "Come into the shade if you're talking to me, because I'm not standing out in that sun for anybody. The animals have the right idea; they haven't moved since breakfast." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a raptor that wants its lunch." },
        { id = "h_again2", text = "Ask away, but quickly, because the water's warming up while we chat." },
      },
      choices = {
        { text = "I'd like to see my stabled animals.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you keep animals alive out here?", next = "heat" },
        { text = "What sort of beasts come through?", next = "beasts" },
        { text = "Do you keep mounts too?", next = "mounts" },
        { text = "Goodbye.", next = "END" },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "Water, shade and wet cloth over the cages at noon. The water's the costly part, because the Wastewanders hold the best wells and Bilgewhizzle charges every drop he's got left." } },
      choices = {
        { text = "Couldn't the animals manage with less?", next = "heat_less" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_less = {
      lines = { { id = "hl_default", text = "A hunter who comes back to a dead wolf doesn't pay me, friend, and he tells all his friends not to pay me either. So no, they get as much as they want, and I grumble about it." } },
      choices = {
        { text = "Good. The animals deserve it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Seems a waste of water in a drought.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Wolves and cats from up north, mostly, and they hate it here. The ones caught locally, like the hyenas and the scorpids, are no trouble at all, since they think this is a lovely day." } },
      choices = {
        { text = "You keep scorpids?", next = "beasts_scorpid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_scorpid = {
      lines = { { id = "bs_default", text = "I keep what hunters bring me, and some of them bring scorpids. You feed them with long tongs and you never, ever turn your back on one, and that's all the training I got." },
        { id = "bs_hunter", when = { class = "HUNTER" }, text = "You'd know better than me why anyone tames a scorpid. I feed them with long tongs and count my fingers afterwards, and so far I've always got ten." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    mounts = {
      lines = { { id = "m_default", text = "No, friend, I only board hunters' companions; your horse or your kodo stays with you. Besides, a mount that's left in my shade for a week forgets it was ever meant to run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I took the stables because nobody else in Gadgetzan wanted to shovel after raptors, and there's always money in the work nobody wants." } },
    advice = { { id = "tp_ad", text = "Water your pet before you water yourself out there. You'll live through a dry afternoon, but it might not." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend; if it doesn't eat, drink or bite, it isn't my business." } },
  },
}

P:NPC {
  key = "buzzek", id = TODO_NPC("Buzzek Bracketswing"), name = "Buzzek Bracketswing", title = "Engineering Trainer",
  bible = "bibles/tanaris.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft", "race" },

  impression = {
    first = "Buzzek Bracketswing teaches engineering from a hut at the south end of Gadgetzan and talks about explosions with real affection. He respects anyone who can keep all ten fingers.",
    third = "{name} met Buzzek Bracketswing, the engineering trainer in Gadgetzan's southern hut.",
  },

  greetings = {
    { id = "g_default", text = "Careful where you step, that crate's live. No, the other one, that one's fine." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece, I see! That's the first sign of a promising engineer." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Scorch marks on your sleeves, and you still have your eyebrows. You're one of us, and a careful one at that." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in my hut! I won't hold it against you, as long as you don't call my work crude in front of the customers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Buzzek Bracketswing, engineering trainer, at the southern end of town where the explosions don't bother the bank. If you've got the coin and the nerve, I'll teach you how to make things go bang on purpose." },
      },
      again = {
        { id = "h_again", text = "What else? I've got a fuse burning somewhere, I'm sure of it." },
        { id = "h_again2", text = "Go on, ask, but stand behind the crate while you do." },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Goblin or gnomish engineering: which is better?", next = "schools" },
        { text = "Why set up out here, at the edge of town?", next = "hut" },
        { text = "Can an engineer earn real money in Gadgetzan?", next = "money", when = { profession = "Engineering" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    schools = {
      lines = { { id = "s_default", text = "Goblin engineering makes things explode, and gnomish engineering makes things that might explode, but with more gears. If you want the goblin path, Nixx Sprocketspring is right next door; for the gnomish one, you'll have to find a gnome." },
        { id = "s_gnome", when = { race = "Gnome" }, text = "You'll say gnomish, and I'll say goblin, and we'll both be right about half the time. If you want the goblin path anyway, Nixx Sprocketspring is right next door, and he won't tell your friends." } },
      choices = {
        { text = "Explosions are the honest choice.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd rather build things that work properly.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut = {
      lines = { { id = "hu_default", text = "The bank asked politely, and then the Bruisers asked less politely. A man testing blasting powder doesn't make good neighbours, so I'm down here with the sand and the scorpids, who don't complain." } },
      choices = {
        { text = "Has anything ever gone badly wrong?", next = "hut_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut_wrong = {
      lines = { { id = "hw_default", text = "Define badly, friend. Nobody's died, the roof's been replaced twice, and I can hear perfectly well out of my left ear, so I call that a good record for an engineer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    money = {
      lines = { { id = "mo_default", text = "Plenty, if you sell to travelers. A water-finder that half works, a scope for a hunter's rifle, a bomb for the Wastewanders, and every one of them sells faster than you can build it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned in a workshop that doesn't exist anymore, for reasons I'd rather not explain to a customer." } },
    advice = { { id = "tp_ad", text = "Always measure the powder twice, and stand well back the first time you light it, however sure you are." } },
    _none = { { id = "tp_none", text = "If I can't build it, take it apart or blow it up, I don't know much about it." } },
  },
}

P:NPC {
  key = "pikkle", id = TODO_NPC("Pikkle"), name = "Pikkle", title = "Mining Trainer",
  bible = "bibles/tanaris.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "blunt" }, values = { "profit", "craft" },
  notices = { "craft", "race" },

  impression = {
    first = "Pikkle trains miners in Gadgetzan and treats every vein of ore as money someone else hasn't dug up yet. He knows where the good rock is and expects to be thanked for sharing it.",
    third = "{name} met Pikkle, the goblin who trains miners in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Pick, a good back and a little patience, friend; that's all mining takes, and I'll teach you the rest for a fee." },
  },

  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "There's rock dust in your boots, and that's the right kind of dirt. What have you been digging, and where?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf asking a goblin about mining? Either you're very humble or very lost, and I'll charge you the same either way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pikkle, mining trainer for Gadgetzan. The desert looks like nothing but sand, but there's metal under it and in the hills, and I'll teach you how to get it out." },
      },
      again = {
        { id = "h_again", text = "Anything else you want to know, or shall I get back to my ore samples?" },
        { id = "h_again2", text = "Ask, then. My time's not free, but my opinions very nearly are." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Where's the good ore around Tanaris?", next = "ore" },
        { text = "Is mining in the desert dangerous?", next = "danger" },
        { text = "Goodbye.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Mithril and a little truesilver in the rocky hills around Tanaris, and you'll find it where the sand thins out to stone. For thorium, go west into Un'Goro Crater, where the rock is newer and so are the things that live there." } },
      choices = {
        { text = "What lives in Un'Goro?", next = "ore_ungoro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_ungoro = {
      lines = { { id = "ou_default", text = "Big lizards with teeth like pickaxes, friend, and plants that bite back. The folk at Marshal's Refuge will tell you more, but take a good sword along with your pick." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    danger = {
      lines = { { id = "d_default", text = "The rock won't hurt you, but the bandits will, because the Wastewanders like a miner who's already done the digging. Bring a friend, or dig fast, or both." } },
      choices = {
        { text = "I'll dig where I please and fight who comes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner sneak in, grab the ore and run.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I dug for the Cartel before I taught for it, and teaching pays almost as well without the cave-ins." } },
    advice = { { id = "tp_ad", text = "Sell your ore raw if you're in a hurry, but smelt it if you want to get paid properly." } },
    _none = { { id = "tp_none", text = "Not a rock, not my business, friend." } },
  },
}
