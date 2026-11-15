-- Goldshire's everyday people: the inn's staff, the shops, the stables, the cellar, and the
-- trainers by Crystal Lake. Short voices for short visits. Voice notes: bibles/goldshire_folk.md
-- (Almost nothing is known about most of them beyond their trade; they're built from it.)
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST


-- Barkeep Dobbins: pours at the Lion's Pride; Farley shouts for him a lot.
P:NPC {
  key = "dobbins", id = TODO_NPC("Barkeep Dobbins"), name = "Barkeep Dobbins",
  bible = "bibles/goldshire_folk.md", role = "innkeeper", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = { "drink" },
  impression = {
    first = "The real work of a barkeep is forgetting, Dobbins told me, which is a fine thing for a barkeep to say. He pours like a man who has poured ten thousand mugs and enjoyed nearly all of them.",
    third = "{name} was served at the Lion's Pride by Barkeep Dobbins, who hears everything and claims to forget it all.",
  },
  greetings = {
    { id = "g_pour", text = "What'll it be? The ale's good, and the ale's always good, but don't ask about the wine." },
    { id = "g_regular", when = { timesTalked = { min = 5 } }, text = "The usual? I'll pretend I remember what that is." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Farley says it's water for you, and I always do what Farley says, mostly. Here you are, then: water, and very good water it is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dobbins. When Farley shouts my name I fetch, and when he doesn't I pour, and it's a good life." },
        { id = "h_farley", when = { heardLine = "farley.h_default" },
          text = "Farley told you the family's never watered a drink? It's true; I've seen him check, holding the mug up to the lamp." },
        { id = "h_armwrestle", when = { metBefore = true }, text = "Lively night last night: a lad fresh from Northshire tried to arm-wrestle a dwarf. The dwarf's still at the bar, and the lad's still under it." },
        { id = "h_forget", when = { metBefore = true }, text = "People think a barkeep hears everything, and I do, but then I forget it. That's the real job, the forgetting." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "This is the hour the farmers come in, and the adventurers start telling lies about wolves. The farmers tell better lies." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've three mugs to fill and one to find." },
        { id = "h_again2", text = "Go on, lean on the bar, only not that end, because it wobbles." },
      },
      choices = {
        { text = "Heard any news?", next = "news" },
        { text = "What's good to drink?", next = "drinks" },
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Not tonight.", next = "END" },
      },
    },
    news = {
      lines = {
        { id = "n_westfall", text = "Westfall folk keep passing through on their way to Stormwind. They don't say much, and they don't need to; you can see it on them." },
        { id = "n_dughan", text = "The Marshal comes in now and then for one cup, which he makes last an hour while he watches the door the whole time." },
      },
      choices = {
        { text = "Any Defias in here?", next = "news_defias" },
        { text = "Thanks, Dobbins.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    news_defias = {
      lines = {
        { id = "nd_default", text = "Not in red, they're not. Plenty of folk drink here I wouldn't trust with a spoon. I pour for them anyway, and count the spoons." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    drinks = {
      lines = {
        { id = "dr_default", text = "Ale, every time, though the cider's honest. The wine's young, and so is everybody who orders it." },
      },
      choices = {
        { text = "Ale, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Behind this bar I hear every rumour in Goldshire, usually three times, and louder each time. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I pour at the Lion's Pride. Have done for years. Farley does the talking; I do the lifting." } },
    advice = { { id = "tp_ad", text = "Drink one water for every ale; that's Farley's rule, and he doesn't follow it either." } },
    lions_pride = { { id = "tp_inn", text = "Best inn in Elwynn, and near enough the only inn in Elwynn, but still the best." } },
    _none = { { id = "tp_none", text = "Ask Farley. He hears it all; I just hear him." } },
    defias = { { id = "tp_defias", text = "Westfall folk talk about the Defias like bad weather. Bad weather that steals your plough and your boots." } },
  },
}

-- Brog Hamfist: general supplies, inside the inn.
P:NPC {
  key = "brog", id = TODO_NPC("Brog Hamfist"), name = "Brog Hamfist", title = "General Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = {},
  impression = {
    first = "Brog Hamfist sells everything an adventurer forgets to pack, and he seemed quite certain I'd forgotten something. He's probably right, and I'll probably find out at midnight.",
    third = "{name} met Brog Hamfist, Goldshire's seller of rope, flint and the bags adventurers always need more of.",
  },
  greetings = {
    { id = "g_stock", text = "Rope, flint, flasks and thread, everything you forgot to pack." },
    { id = "g_new", when = { maxLevel = 6 }, text = "Fresh out of Northshire, are you? You'll want more bags than you think; everyone does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hamfist. If an adventurer needs it and it isn't a sword, I've probably got it. If I haven't, I'll have it next week." },
        { id = "h_rope", when = { metBefore = true }, text = "I sold six coils of rope yesterday, six, and nobody ever tells me what they're climbing." },
        { id = "h_flint", when = { metBefore = true }, text = "Adventurers always buy the flint last. Then they're back at midnight, because they forgot the flint." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Shop stays open as long as the inn does. Someone always needs a torch at this hour." },
      },
      again = {
        { id = "h_again", text = "Anything else? Can I interest you in bags? You'll need more than you think." },
        { id = "h_again2", text = "Go on; I'm only counting candles." },
      },
      choices = {
        { text = "What do adventurers forget most?", next = "forget" },
        { text = "What should I carry on a long road?", next = "road" },
        { text = "Let me see.", next = "BUSINESS" },
        { text = "Just looking.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "f_water", text = "Water, every time: three swords and not a drop to drink. Then they drink from the lake and come back for something for their stomach." },
      },
      choices = {
        { text = "And after water?", next = "forget_more" },
        { text = "I'll take some water.", next = "BUSINESS" },
      },
    },
    forget_more = {
      lines = {
        { id = "fm_default", text = "Bags, then rope, and then they come back for more bags, because the rope's taking up the bag." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1 } } },
    },
    road = {
      lines = {
        { id = "r_default", text = "Flint, water, a spare torch, and thread to mend what the wolves chew. And bags, always more bags than you think." },
      },
      choices = {
        { text = "Let me see the bags.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell things from behind this counter, in this inn, and that's the lot." } },
    advice = { { id = "tp_ad", text = "Buy the flint first, and then you can't forget it." } },
    _none = { { id = "tp_none", text = "I don't sell that, and I don't know that." } },
  },
}

-- Toddrick: the butcher, inside the inn.
P:NPC {
  key = "toddrick", id = TODO_NPC("Toddrick"), name = "Toddrick", title = "Butcher",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = {},
  impression = {
    first = "If the butcher Toddrick is to be believed, his job is harder than Farley's, and since he says it with a cleaver in hand, nobody argues. He warned me off the wolf meat, even his own.",
    third = "{name} met Toddrick, the butcher at the Lion's Pride, who takes great pride in his sausages and none in wolf.",
  },
  greetings = {
    { id = "g_cut", text = "The best cuts in Goldshire; ask anyone, though don't ask the boars." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Toddrick. I cut the meat and Farley cooks it, and everyone agrees whose job is harder: mine." },
        { id = "h_princess", when = { questDone = TODO_QUEST("Princess Must Die!") },
          text = "You did for the Brackwells' prize sow? Pity you didn't bring her here. I'd have made Goldshire's finest sausages." },
        { id = "h_boar", when = { metBefore = true }, text = "The boar's good this week, but the wolf's not. Don't let anyone sell you wolf, not even me." },
        { id = "h_second", when = { metBefore = true }, text = "Farley says my sausages are the second-best thing in this inn. I asked him what the first was. He pointed at himself." },
        { id = "h_dobbins", when = { heardLine = "dobbins.h_default" }, text = "Dobbins says he fetches when Farley shouts? He fetches when I shout too, only slower, much slower." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before the cleaver gets cold." },
        { id = "h_again2", text = "Anything else? I've a side of boar waiting on me." },
      },
      choices = {
        { text = "Where does your meat come from?", next = "meat" },
        { text = "What's the secret to a good sausage?", next = "sausage" },
        { text = "What's good today?", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "m_farms", text = "From the farms east of here, mostly, and from adventurers. You lot bring in more boar than the farmers ever did, and I'm not complaining." },
      },
      choices = {
        { text = "Why not wolf?", next = "meat_wolf" },
        { text = "Glad to help.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    meat_wolf = {
      lines = {
        { id = "mw_default", text = "It's stringy and sour, and it smells like a wet dog when it cooks. Northshire recruits buy it anyway, and they learn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sausage = {
      lines = {
        { id = "s_default", text = "Good meat, more salt than you'd think, and never telling anyone what else. Farley's been guessing for years." },
      },
      choices = {
        { text = "Go on. Tell me.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Let me try one.", next = "BUSINESS" },
        { text = "Farley says he finally worked out your secret.", tag = "Deceive", next = "sausage_spilled",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { class = "ROGUE" } } } },
          fail = { next = "sausage_safe", fx = { affinity = -1 } } },
      },
    },
    sausage_spilled = {
      lines = {
        { id = "ss_default", text = "He never! Who told him about the ale? It's a splash of Dobbins's dark in every batch, that's all, poured from Farley's own barrel when he isn't looking, and if he knows, he's been drinking his own secret ingredient for years." },
        { id = "ss_after", text = "Hang on, you're grinning. He doesn't know a thing, does he? Well, now you do, so you'll keep it behind your teeth, or I'll tell everyone you buy wolf." },
      },
      choices = {
        { text = "My lips are sealed, Toddrick.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sausage_safe = {
      lines = {
        { id = "sf_default", text = "Farley? Farley's been guessing nutmeg for six years, and it's never been nutmeg. Nice try, though, and you can tell him I said so." },
        { id = "sf_default2", text = "If Farley had worked it out, he'd have told the whole common room by now, and twice over. You'll have to do better than that." },
      },
      choices = {
        { text = "Worth a try.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "A butcher's block hears more gossip than a confessional, friend, because folk talk while they wait. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm the butcher: I cut, I sell and I argue with Farley. It's a good life." } },
    advice = { { id = "tp_ad", text = "Never buy meat from a man who won't tell you what it was." } },
    _none = { { id = "tp_none", text = "If it's not meat, I'm no use to you." } },
    hogger = { { id = "tp_hogger", text = "I've seen what's left of a cow after Hogger's gnolls are done. Not even I could sell that." } },
  },
}

-- Tharynn Bouden: trade supplies, at a wagon on the south-east road out of Goldshire.
P:NPC {
  key = "tharynn", id = TODO_NPC("Tharynn Bouden"), name = "Tharynn Bouden", title = "Trade Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = {},
  impression = {
    first = "Tharynn Bouden sells to crafters from a wagon at the edge of the road and talks openly of a gold-lettered sign in the Trade District someday. It's hard not to wish the wagon well.",
    third = "{name} met Tharynn Bouden, a trade supplier who works from a roadside wagon and dreams of a shop in Stormwind.",
  },
  greetings = {
    { id = "g_craft", text = "Thread, dye, flux and vials, for people who make things." },
    { id = "g_crafter", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy" } }, text = "Ah, a crafter, my favourite kind of customer, because you come back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bouden, and I sell what crafters need and nothing they don't. Fighters buy once, but crafters buy forever." },
        { id = "h_shop", when = { metBefore = true }, text = "One day I'll have a shop in the Trade District. Proper sign, gold letters. Until then, a wagon at the edge of the road." },
        { id = "h_gossip", when = { metBefore = true }, text = "Crafters gossip more than anyone. A tailor in here last week knew every wedding in Elwynn for the next year." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wagon's not going anywhere, not yet anyway." },
        { id = "h_again2", text = "Go on. Browse with your eyes; ask with your mouth." },
      },
      choices = {
        { text = "Why trade supplies?", next = "trade" },
        { text = "What do crafters buy most?", next = "crafters" },
        { text = "Show me.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    trade = {
      lines = {
        { id = "t_steady", text = "A sword breaks once, but a tailor needs thread every day of her life. Steady money beats exciting money." },
      },
      choices = {
        { text = "And the Trade District shop?", next = "trade_shop" },
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    trade_shop = {
      lines = {
        { id = "ts_default", text = "Every thread I sell is a brick in it. I've even picked the colour of the door, green, so don't tell anyone or they'll copy it." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    crafters = {
      lines = {
        { id = "c_default", text = "Thread and dye, by the bale. Tailors run through thread like water, and smiths can't work an hour without flux." },
      },
      choices = {
        { text = "Show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A trader with a wagon and a plan. Ask me again when the plan's a shop." } },
    advice = { { id = "tp_ad", text = "Pick a trade, friend; fighters spend, but crafters earn." } },
    _none = { { id = "tp_none", text = "That's not a trade good, so I can't help you." } },
  },
}

-- Andrew Krighton: armorer and shieldcrafter, in the forge opposite the inn.
P:NPC {
  key = "krighton", id = TODO_NPC("Andrew Krighton"), name = "Andrew Krighton", title = "Armorer & Shieldcrafter",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "honest" }, notices = { "kit" },
  impression = {
    first = "Andrew Krighton makes the things that stop sharp things, and he speaks about shields the way some men speak about their family. He has firm opinions on who belongs behind one.",
    third = "{name} met Andrew Krighton, Goldshire's armorer, who believes a shield is for others to hide behind.",
  },
  greetings = {
    { id = "g_armor", text = "Mail, plate and shields: something to stand behind." },
  },
  notice = {
    { id = "n_shield", cat = "kit", when = { class = { "WARRIOR", "PALADIN" }, durability = { max = 0.3 } },
      text = "That shield's taken a beating, which is good, because that's its job. Let me see if it can take another." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Krighton. Argus makes things sharp and I make things that stop sharp things, so we get on." },
        { id = "h_plate", when = { metBefore = true }, text = "Every recruit from Northshire walks in wanting plate. Then they try to lift it." },
        { id = "h_shield", when = { class = { "PALADIN", "WARRIOR" } }, text = "A shield isn't for hiding behind; it's for being the thing everyone else hides behind, and you'd do well to remember it." },
      },
      again = {
        { id = "h_again", text = "Anything else? The forge doesn't stoke itself, you know." },
        { id = "h_again2", text = "Go on, and mind the anvil; it's still warm." },
      },
      choices = {
        { text = "How did you learn the trade?", next = "trade" },
        { text = "What makes a good shield?", next = "shield" },
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Not now.", next = "END" },
      },
    },
    trade = {
      lines = {
        { id = "t_rebuild", text = "Same as anyone: by hammering until it stopped looking like a mistake. Argus says I'm still at it." },
      },
      choices = {
        { text = "Show me your work.", next = "BUSINESS" },
        { text = "Thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    shield = {
      lines = {
        { id = "s_default", text = "Oak core, iron rim, and a strap that won't snap when it matters. The rest is paint." },
      },
      choices = {
        { text = "Paint?", next = "shield_paint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_paint = {
      lines = {
        { id = "sp_default", text = "The lion of Stormwind, mostly, because recruits want the lion. But the lion doesn't stop arrows; the oak does." },
      },
      choices = { { text = "I'll take the oak.", next = "BUSINESS", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the armorer at this forge and this anvil, and I'd rather talk about the work than about me." } },
    advice = { { id = "tp_ad", text = "Check your straps every morning. A shield that falls off is a very heavy hat." } },
    _none = { { id = "tp_none", text = "Can I put it on your arm? If not, I can't help you." } },
  },
}

-- Corina Steele: weaponsmith, same forge.
P:NPC {
  key = "corina", id = TODO_NPC("Corina Steele"), name = "Corina Steele", title = "Weaponsmith",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "proud" }, notices = { "kit" },
  impression = {
    first = "Corina Steele made a joke about her own name before I could, which I suspect she's been doing for years. She judged the balance of my weapon in a single glance.",
    third = "{name} met Corina Steele, Goldshire's weaponsmith, who has a quick tongue and an eye for a blade's balance.",
  },
  greetings = {
    { id = "g_blade", text = "Swords, axes and maces; pick one up and feel the balance." },
  },
  notice = {
    { id = "n_dull", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your blade's notched like a saw. Did you fight something, or chop firewood with it?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Corina Steele, and yes, really. With a name like that it was this or juggling." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Lyria sends me all her students. Half come back for a heavier blade. The other half come back for a lighter one." },
        { id = "h_kurran", when = { metBefore = true }, text = "Kurran and I share a name and an argument. The argument's older." },
        { id = "h_balance", when = { metBefore = true }, text = "A sword's balance tells you who it was made for. Most of mine are made for whoever pays." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, so you'll want a hammer, I'd guess; your lot always seem to." },
        { id = "h_heard_kurran", when = { heardLine = "kurran.h_default" }, text = "Kurran called himself the other Steele? He likes being the other one, because there's less pressure in it, he says, and more time to sit." },
      },
      again = {
        { id = "h_again", text = "Another question? Ask away; the grinding stone doesn't mind." },
        { id = "h_again2", text = "Go on, but sharp questions only." },
      },
      choices = {
        { text = "What makes a good blade?", next = "blade" },
        { text = "What's the argument with Kurran?", next = "kurran" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    blade = {
      lines = {
        { id = "b_good", text = "Good steel, patient hands, and an owner who cleans it. I can sell you the first two." },
      },
      choices = {
        { text = "How do I keep it clean?", next = "blade_clean" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
      },
    },
    blade_clean = {
      lines = {
        { id = "bc_default", text = "Oil, a rag, and a minute every night before you sleep. Most adventurers would sooner die, and plenty do." },
      },
      choices = { { text = "I'll clean mine.", next = "BACK", fx = { affinity = 1 } } },
    },
    kurran = {
      lines = {
        { id = "k_default", text = "Whether leather counts as armor, which it doesn't, though he says it does. We've been at it since before either of us could lift a hammer." },
      },
      choices = {
        { text = "Leather counts.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Plate or nothing.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Steele by name and steel by trade, so don't make the joke; I've heard it." } },
    advice = { { id = "tp_ad", text = "Buy the weapon that fits your hand, not the one that fits your story." } },
    _none = { { id = "tp_none", text = "Ask me about edges; for anything else, ask someone else." } },
  },
}

-- Kurran Steele: cloth and leather armor, same forge.
P:NPC {
  key = "kurran", id = TODO_NPC("Kurran Steele"), name = "Kurran Steele", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = {},
  impression = {
    first = "Kurran Steele calls himself the other Steele and seems to enjoy it, since it leaves him more time to sit. He and Corina share a forge and an old argument that neither of them is keen to finish.",
    third = "{name} met Kurran Steele, who sells cloth and leather beside Corina's forge and quarrels with her quite contentedly.",
  },
  greetings = {
    { id = "g_leather", text = "Not everyone wants to clank. Come and see what I've got." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kurran, the other Steele. Corina sells you the sword and I sell you the coat you'll bleed on, so it's a family business, in a way." },
        { id = "h_corina", when = { metBefore = true }, text = "Corina says leather's for people who can't commit. I say plate's for people who can't run." },
        { id = "h_buyers", when = { metBefore = true }, text = "Rogues buy dark colors, druids buy anything that stretches, and hunters buy whatever's got the most pockets." },
        { id = "h_heard_corina", when = { heardLine = "corina.h_default" }, text = "Corina told you the juggling joke? She tells everyone, and I've heard it a hundred times; it's getting better, slowly." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere, and neither is she." },
        { id = "h_again2", text = "Go on, but quietly; Corina's grinding." },
      },
      choices = {
        { text = "Why cloth and leather?", next = "why" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Show me.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "Quiet, light, and you can mend it yourself by a campfire. Try mending plate by a campfire." },
      },
      choices = {
        { text = "Corina says leather doesn't count.", next = "why_corina" },
        { text = "Fair point.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_corina = {
      lines = {
        { id = "wc_default", text = "She'll say it till she's grey. Ask her how quietly her plate customers sneak up on anything. You can hear them from Goldshire." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Mages and priests want robes that don't catch on things, rogues want dark, and everyone wants pockets." },
      },
      choices = {
        { text = "Show me the robes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the other Steele, and I sell coats. Ask Corina for the rest; she tells it louder." } },
    advice = { { id = "tp_ad", text = "Wear what you can run in. Then wear it while running." } },
    _none = { { id = "tp_none", text = "I sell coats, not answers." } },
  },
}

-- Erma: the stable master. In this era, stable masters keep hunters' beasts.
P:NPC {
  key = "erma", id = TODO_NPC("Erma"), name = "Erma", title = "Stable Master",
  bible = "bibles/goldshire_folk.md", role = "stablemaster", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "pet" },
  impression = {
    first = "Erma asked who I'd brought with me before she asked who I was, and that tells you most of what you need to know. Her four-legged guests clearly rank above the two-legged ones.",
    third = "{name} met Erma, Goldshire's stable master, who treats every beast in her care like visiting royalty.",
  },
  greetings = {
    { id = "g_stable", text = "Watch your boots in here, and tell me who you've brought me." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, look at {pet}! Somebody feeds you properly, but somebody also forgets to brush you, so come here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Erma, and I keep the stables. Most of my guests have four legs and better manners than the ones with two." },
        { id = "h_hunter", when = { race = "Human", class = "HUNTER" }, text = "Not many humans keep a beast at heel. Bring yours by anytime; I'll treat it like visiting royalty." },
        { id = "h_sing", when = { metBefore = true }, text = "Had a mare in last week who wouldn't eat unless someone sang to her, so I sang, and you didn't hear that from me." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Shh, they're settling. Horses sleep standing up, did you know, and lightly, like old soldiers." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, though; somebody's asleep in the end stall." },
        { id = "h_again2", text = "Go on. Brush that one while you talk, if you like." },
      },
      choices = {
        { text = "Do you have a favorite?", next = "favorite" },
        { text = "Who do you look after, mostly?", next = "guests" },
        { text = "The stable, please.", next = "BUSINESS" },
        { text = "Just visiting.", next = "END" },
      },
    },
    favorite = {
      lines = {
        { id = "f_grey", text = "The old grey in the end stall. His rider rode out for Redridge and didn't come back, so I kept him, because someone had to." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Does he still wait?", next = "favorite_wait" },
      },
    },
    favorite_wait = {
      lines = {
        { id = "fw_default", text = "Every evening, ears to the road. Then he eats his supper and forgets. Horses are wiser than us that way." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    guests = {
      lines = {
        { id = "g_default", text = "Hunters' beasts, more and more. Wolves, boars, a cat that thinks it owns the hayloft. They behave better than their owners." },
      },
      choices = {
        { text = "I'll bring mine.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Stables and hay and whatever's in them. That's my life, and the animals don't complain about it." } },
    advice = { { id = "tp_ad", text = "Feed your animal before you feed yourself, and it'll remember you for it." } },
    hogger = { { id = "tp_hogger", text = "The horses won't go southwest, and I don't make them." } },
    _none = { { id = "tp_none", text = "If it doesn't eat hay, I'm the wrong person." } },
  },
}

-- Michelle Belle: first aid, upstairs with Josetta. (Forever: ends Camping 101: First Aid.)
P:NPC {
  key = "michelle", id = TODO_NPC("Michelle Belle"), name = "Michelle Belle", title = "Physician",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "wounds" },
  impression = {
    first = "Michelle Belle teaches bandaging as though lives depend on it, because they do. She was kind about it, but I had the feeling she keeps count of everyone who skips the lesson.",
    third = "{name} met Michelle Belle, the Goldshire physician who teaches first aid beside Priestess Josetta.",
  },
  greetings = { { id = "g_bandage", text = "If you're bleeding, sit, and if you're not, sit anyway and learn how to stop it." } },
  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.25 } },
      text = "Look at the state of you. Linen, a clean hand and five minutes. That's all it takes. Most people won't spare the five minutes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Michelle Belle, and I teach bandaging. It's not glamorous, but it's why you'll still be alive next week." },
        { id = "h_josetta", text = "Josetta prays over the wounded; I wrap them. Between us, most of Goldshire's adventurers go home on their own feet." },
        { id = "h_faint", when = { metBefore = true }, text = "Most of my students faint the first time. The ones who don't, I keep a closer eye on." },
        { id = "h_linen", when = { metBefore = true }, text = "Linen's cheap, so carry plenty; the wolves out there don't care what it costs." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your hands clean while you ask, if you don't mind." },
        { id = "h_again2", text = "Go on, and keep the pressure on it while you talk." },
      },
      choices = {
        { text = "Why teach bandaging?", next = "why" },
        { text = "Sam on the road says you teach camp kits.", next = "camp" },
        { text = "Can't the Light do what linen does?", next = "priest", when = { class = "PRIEST" } },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_father", text = "Because most people who die out there don't die of the wound. They die on the walk home, bleeding. Linen fixes that." },
      },
      choices = {
        { text = "And Josetta?", next = "why_josetta" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    why_josetta = {
      lines = {
        { id = "wj_default", text = "She prays and I wrap, and some wounds want both. Some just want someone to hold the linen tight and talk nonsense." },
      },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A first aid kit for the fire. Bandages, salve, a bit of thread. A camp with a kit beside it sends people home." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Sometimes, but linen doesn't get tired. The best healers I know carry bandages they're too proud to use, so learn both." },
      },
      choices = {
        { text = "Fair. Teach me.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I wrap wounds upstairs at the Lion's Pride. Josetta prays; I tie the knots." } },
    advice = { { id = "tp_ad", text = "Bandage first and brag later, in that order, every time." } },
    camping = { { id = "tp_camping", text = "Every camp needs a kit. Somebody always cuts a thumb on the first night." } },
    _none = { { id = "tp_none", text = "I only know how to stop the bleeding. The rest is beyond me." } },
  },
}

-- Maximillian Crowe and Cylina Darkheart: the cellar, with Remen Marcot.
P:NPC {
  key = "crowe", id = TODO_NPC("Maximillian Crowe"), name = "Maximillian Crowe", title = "Warlock Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "ambitious" }, notices = {},
  impression = {
    first = "Down in the cellar of the Lion's Pride, Maximillian Crowe speaks softly enough that the drinkers upstairs never hear him. He talks of power as a debt, like a man who has paid some.",
    third = "{name} met Maximillian Crowe, who teaches the warlock's craft quietly beneath Goldshire's inn.",
  },
  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down here we speak quietly and learn quickly. Which are you here to do?" },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The ale's upstairs; you've taken a wrong turn." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Crowe. Marcot handles the introductions; I handle the lessons. Darkheart handles the things that come when called." },
        { id = "h_debt", when = { metBefore = true, class = "WARLOCK" }, text = "Remember what I told you: power is a debt, and you pay it on your terms, never theirs." },
        { id = "h_lost", when = { metBefore = true, ["not"] = { class = "WARLOCK" } }, text = "Still lost? The stairs are behind you, and they go up, so use them." },
      },
      again = {
        { id = "h_again", text = "Another question? Then lean closer and whisper it." },
        { id = "h_again2", text = "Ask quickly; voices carry up these cellar stairs." },
      },
      choices = {
        { text = "Why train down here?", next = "cellar" },
        { text = "What do you teach?", next = "teach" },
        { text = "The Light would have words with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },
    cellar = {
      lines = {
        { id = "c_quiet", text = "Upstairs, people would rather not know what we teach. Down here, nobody has to pretend otherwise." },
      },
      choices = {
        { text = "Who's Remen Marcot?", next = "cellar_marcot" },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    cellar_marcot = {
      lines = {
        { id = "cm_default", text = "Marcot speaks for us upstairs, so I don't have to. He has the face for it. I have the patience for nothing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = {
        { id = "t_default", text = "That the arcane corrupts only the weak. Strength first, then pacts. Reverse the order and you end in a tower in Redridge, talking to gnolls." },
        { id = "t_other", when = { ["not"] = { class = "WARLOCK" } },
          text = "Nothing you'd want, because the darkness hasn't chosen you. Be grateful for that, and go back up the stairs." },
      },
      choices = {
        { text = "A tower in Redridge?", next = "BACK", fx = { learn = { "morganth" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "The Light has had words with me, and I listened politely. Go back upstairs, priest; Josetta keeps better company than I do." },
      },
      choices = {
        { text = "The door's open, if you ever want it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll be watching this cellar.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I teach in a cellar. You may draw whatever conclusions you like from that." } },
    advice = { { id = "tp_ad", text = "Never make a bargain you haven't read twice. Demons write small." } },
    _none = { { id = "tp_none", text = "Not a matter for this cellar." } },
  },
}

P:NPC {
  key = "cylina", id = TODO_NPC("Cylina Darkheart"), name = "Cylina Darkheart", title = "Demon Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "cunning" }, notices = { "pet" },
  impression = {
    first = "Cylina Darkheart keeps an imp that bites and seems rather fond of it for that very reason. She teaches demons new tricks, and her smile suggested they aren't the kind you show a crowd.",
    third = "{name} met Cylina Darkheart, the demon trainer in the Lion's Pride cellar, and her imp, which bites.",
  },
  greetings = { { id = "g_demon", text = "Mind my imp; he bites. I've told him not to, and he bites anyway." } },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp and mine are glaring at each other, but leave them be; it's how they say hello." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Darkheart. I teach your pets new tricks. Not the kind you'd show a crowd." },
        { id = "h_keys", when = { metBefore = true }, text = "My imp took Dobbins' keys again. Dobbins thinks he's losing his mind. I haven't had the heart to tell him." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, he's getting restless." },
        { id = "h_again2", text = "Go on, and ignore the imp." },
      },
      choices = {
        { text = "What's your imp's name?", next = "imp" },
        { text = "What exactly do you teach?", next = "tricks" },
        { text = "Show me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },
    imp = {
      lines = {
        { id = "i_name", text = "He has one, but say it aloud and he gets smug, and he's smug enough already." },
      },
      choices = {
        { text = "Could he have a different one?", next = "imp_rename" },
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    imp_rename = {
      lines = {
        { id = "ir_default", text = "For a price, a warlock can be rid of a demon and call up a fresh one, with a new name and the same teeth. Are you tired of yours?" },
      },
      choices = {
        { text = "Not yet.", next = "BACK" },
        { text = "I'll think about it.", next = "BUSINESS", when = { class = "WARLOCK" } },
      },
    },
    tricks = {
      lines = {
        { id = "t_default", text = "Grimoires. A demon learns from the page, if you read it aloud and mean it. None of it's any use without a demon of your own." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in a cellar with an imp. Do you really want more than that?" } },
    advice = { { id = "tp_ad", text = "Never tell a demon its own name. It's rude, and it gives them ideas." } },
    _none = { { id = "tp_none", text = "My imp might know, though he won't tell you either." } },
  },
}

-- The trainers at the house by Crystal Lake.
P:NPC {
  key = "leebrown", id = TODO_NPC("Lee Brown"), name = "Lee Brown", title = "Fishing Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "craft" },
  impression = {
    first = "Lee Brown asked me to be quiet before he asked my name, and the fish seemed to approve. He told me about a catch that grew longer while he was still describing it.",
    third = "{name} met Lee Brown, the fishing trainer at Crystal Lake, who loves the dawn mist and a well-stretched story.",
  },
  greetings = { { id = "g_lake", text = "Quiet now, or you'll scare the fish." } },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Another angler! Crystal Lake's best at dawn, but don't tell anyone; well, you can tell them, since they won't get up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lee Brown. I fish, and I teach fishing, and on good days I can't tell which I'm doing." },
        { id = "h_long", when = { metBefore = true }, text = "I caught one this long yesterday, no, longer. It grows every time I tell it, and that's fishing." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "This is the best hour there is, with mist on the lake and fish rising and nobody here but me, and now you." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask it softly, mind." },
        { id = "h_again2", text = "Go on; the line's quiet anyway." },
      },
      choices = {
        { text = "Why fishing?", next = "why" },
        { text = "Any murlocs in Crystal Lake?", next = "murlocs" },
        { text = "Sam on the road says fishing helps a camp.", next = "camp" },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Good fishing.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "It's the quietest work in Elwynn, because nobody shouts at a fisherman. Nobody but the fish, and they don't shout loud." },
      },
      choices = {
        { text = "Where's the best spot?", next = "why_spot" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    why_spot = {
      lines = {
        { id = "ws_default", text = "This pier, at dawn. Jason down the end will tell you otherwise. Jason's wrong, and he knows it." },
      },
      choices = { { text = "Good fishing.", next = "BACK", fx = { affinity = 1 } } },
    },
    murlocs = {
      lines = {
        { id = "m_default", text = "Plenty, on the far shore. They take my bait and they hoard kelp, of all things. Pestle at the inn sends folk after the kelp." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A fish bowl by the fire. Laugh all you like. Watch a fish go round for a while and tell me you're not calmer." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a fisherman: this pier, this lake and these fish, mostly these fish." } },
    advice = { { id = "tp_ad", text = "Patience. The fish have more of it than you, so you'll need to borrow some." } },
    _none = { { id = "tp_none", text = "Ask me about bait; anything else and I'm out of my depth, ha." } },
  },
}

P:NPC {
  key = "helene", id = TODO_NPC("Helene Peltskinner"), name = "Helene Peltskinner", title = "Skinning Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = { "craft" },
  impression = {
    first = "Helene Peltskinner looked at my knife before she looked at me, and she didn't think much of the knife. She is Eagan's wife and every bit as practical about a hide.",
    third = "{name} met Helene Peltskinner, the skinning trainer by Crystal Lake, who insists every hide be taken with a sharp knife.",
  },
  greetings = { { id = "g_hides", text = "Careful, those hides are drying. Is there something you need?" } },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Show me your knife. Hm, it's too dull, and hides tear when the knife's dull, so sharpen it tonight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Helene Peltskinner. Wolves, boars and the odd bear: everything out there has a coat, and every coat's worth something." },
        { id = "h_eagan", when = { heardLine = "eagan.h_default" },
          text = "You've met Eagan up in Northshire? He's my husband, and he's busy up by the abbey, so the wolves down here are mine." },
        { id = "h_pelts", when = { metBefore = true }, text = "Wolf pelts sell best in winter and boar hides all year, but murloc skin never, so don't bring me murloc." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the drying rack while you think." },
        { id = "h_again2", text = "Ask what you like. I can scrape a hide and listen at the same time." },
      },
      choices = {
        { text = "How did you learn?", next = "learn" },
        { text = "Adele says you've been her strength.", next = "adele", when = { heardLine = "adele.hb_default" } },
        { text = "Sam on the road says hides make a camp.", next = "camp" },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    learn = {
      lines = {
        { id = "l_mother", text = "Same as anyone: a sharp knife, a patient teacher, and a great many ruined hides. The ruined ones taught me most." },
      },
      choices = {
        { text = "Any advice for a beginner?", next = "learn_advice" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    learn_advice = {
      lines = {
        { id = "la_default", text = "Work with the grain, not against it. And skin it while it's warm. Cold hides fight you." },
      },
      choices = { { text = "Makes sense.", next = "BACK", fx = { affinity = 1 } } },
    },
    adele = {
      lines = {
        { id = "ad_default", text = "She says that? Her husband's at the front, and somebody had to sit up with her of an evening. I had a sword and the evenings free." },
      },
      choices = { { text = "That's a good friend.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A camp chair, out of good hides. Sit in one after a day's skinning and you'll know why it matters." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I skin, I teach skinning, and I keep Adele company. My husband keeps the wolves busy up north." } },
    advice = { { id = "tp_ad", text = "Sharpen your knife every night. A dull knife ruins more hides than any wolf." } },
    _none = { { id = "tp_none", text = "I know hides, but not that." } },
  },
}

P:NPC {
  key = "adele", id = TODO_NPC("Adele Fielder"), name = "Adele Fielder", title = "Leatherworking Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = { "craft" },
  impression = {
    first = "Adele Fielder spends half her days mending what adventurers stitched for themselves, and she told me so cheerfully without looking up from her awl. Her patience seems endless, though her opinions are not.",
    third = "{name} met Adele Fielder, the leatherworking trainer by Crystal Lake, who stitches and listens at the same time.",
  },
  greetings = { { id = "g_leather", text = "Helene skins it, I stitch it. Want to learn the stitching half?" } },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your seams are crooked, as everyone's are at first. They'll be straighter by midsummer, if you practise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Adele Fielder. I make boots, belts and jerkins, the things adventurers wear out fastest and complain about loudest." },
        { id = "h_fix", when = { metBefore = true }, text = "Half my work is fixing what adventurers stitched themselves. The other half is telling them it wasn't so bad." },
        { id = "h_helene", when = { heardLine = "helene.h_default" }, text = "Helene told you every coat's worth something? It's true, until an adventurer stitches it himself, and then it's worth less." },
      },
      again = {
        { id = "h_again", text = "Anything else? Hand me that awl while you think." },
        { id = "h_again2", text = "Go on; I can stitch and listen at once." },
      },
      choices = {
        { text = "What's hardest to make?", next = "hard" },
        { text = "Is this your house?", next = "home" },
        { text = "Sam on the road says leatherworkers make tents.", next = "camp" },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    hard = {
      lines = {
        { id = "h_boots", text = "Boots. Everyone's feet are different, and everyone's sure theirs are normal." },
      },
      choices = {
        { text = "Are mine normal?", next = "hard_feet" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    hard_feet = {
      lines = {
        { id = "hf_default", text = "Take your boots off and we'll see. No, don't, I've just eaten." },
      },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = {
        { id = "hb_default", key = true, text = "Mine, by the lake. My husband went off to the front, and Helene's held me up ever since. Soft heart, and she keeps a sword by the door." },
      },
      choices = {
        { text = "I'll pray for his safe return.", next = "home_priest", when = { class = "PRIEST" } },
        { text = "She sounds a good friend.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    home_priest = {
      lines = {
        { id = "hp_default", text = "Thank you; I'll take every prayer going. Helene says hers with a whetstone." },
      },
      choices = {
        { text = "Then she'll have my prayers too, whetstone and all.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A whetstone will do her more good than prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A tent, once your stitching's good enough. Sleep beside one by a campfire and you wake up feeling a week younger." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Leatherworker. The house by the lake is mine. My husband's at the front, and Helene keeps me company." } },
    advice = { { id = "tp_ad", text = "Buy boots a little big. Feet swell on a long road, and pride doesn't." } },
    _none = { { id = "tp_none", text = "Can you stitch it? If you can't, I'm afraid I'm no help to you." } },
  },
}
