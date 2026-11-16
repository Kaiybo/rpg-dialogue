-- Northshire Abbey's armorer, clothier, weaponsmith, and Brother Paxton who walks the grounds.
-- Voice: bibles/northshire_smiths.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Godric Rothgar: armorer and shieldsmith to the Abbey's recruits.
P:NPC {
  key = "godric", id = TODO_NPC("Godric Rothgar"), name = "Godric Rothgar", title = "Armorer & Shieldsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "craft", "duty" },
  impression = {
    first = "Godric Rothgar fits the Abbey's recruits with plain mail and plainer shields, and he takes every dent as a personal insult.",
    third = "{name} met Godric Rothgar, Northshire's armorer, who takes dents personally.",
  },
  greetings = {
    { id = "g_default", text = "Mail, shields and a few good helms. Nothing fancy, but it'll stop a kobold's pick." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. That's the armor doing its job." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Godric Rothgar, armorer to the Abbey. Every recruit who walks out of Northshire walks out in something I've hammered, so mind you bring it back unbroken." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, and a fresh one by the look of you. Llane will teach you to swing, but I'll teach you that a shield is worth more than any sword." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've rivets cooling." },
        { id = "h_again2", text = "Go on, then. I can talk and file at once." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "What wrecks the most shields around here?", next = "dents" },
        { text = "Do the recruits listen to you?", next = "recruits" },
        { text = "Farewell.", next = "END" },
      },
    },
    dents = {
      lines = { { id = "d_default", text = "Kobolds at the Echo Ridge Mine, mostly, since they swing those picks like they're digging through you. The wolves only chew the straps, which is worse, because straps I have to sew." } },
      choices = {
        { text = "And the rain?", next = "rain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rain = {
      lines = { { id = "r_default", text = "The rain's the real enemy, friend. A recruit leaves his shield out in the yard overnight and it's rusting by morning, and then he comes crying to me." } },
      choices = {
        { text = "A soldier should care for his own gear.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Recruits have enough to worry about. Go easy.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = { { id = "rc_default", text = "Half of them do. The other half learn the first time a kobold catches them without a helm, and then they listen very well indeed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've hammered armor for the Abbey longer than most of these recruits have been alive." } },
    kobolds = { { id = "tp_kob", text = "They dent everything they touch. I'd almost admire it if I didn't have to fix it." } },
    _none = { { id = "tp_none", text = "If it can't be riveted, I couldn't tell you a thing about it." } },
  },
}

-- Dermot Johns: cloth and leather armor; mends novices' robes.
P:NPC {
  key = "dermot", id = TODO_NPC("Dermot Johns"), name = "Dermot Johns", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "craft", "faith" },
  impression = {
    first = "Dermot Johns sells robes and jerkins to the Abbey's novices and mends the ones they tear, which, he says softly, is most of them.",
    third = "{name} met Dermot Johns, who clothes and mends for Northshire's novices.",
  },
  greetings = {
    { id = "g_default", text = "Cloth and leather, friend, sewn here at the Abbey. Mind the hems; they're new." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. No tears in that sleeve yet, I hope?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dermot Johns. I sell robes to the priests and jerkins to the rest, and I spend my evenings mending both by candlelight." },
        { id = "h_caster", when = { any = { { class = "PRIEST" }, { class = "MAGE" } } }, text = "A robe-wearer, I see! Do keep it out of the brambles by the vineyards, will you? Silk doesn't forgive thorns." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a hem half pinned." },
        { id = "h_again2", text = "Go on, I'm listening, though my needle isn't." },
      },
      choices = {
        { text = "Show me what you've sewn.", next = "BUSINESS" },
        { text = "Who tears the most robes?", next = "torn" },
        { text = "Where do you get your leather?", next = "leather" },
        { text = "Good day.", next = "END" },
      },
    },
    torn = {
      lines = { { id = "t_default", text = "The novices who chase the wolves into the woods, every one of them. Brother Paxton tends their bruises and sends them straight to me for their sleeves." } },
      choices = {
        { text = "You should charge them double for carelessness.", next = "BACK", fx = { align = { light = -1 }, trait = { greedy = 1 } } },
        { text = "Mending for the young is good work.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "From the wolves the recruits bring down, if you can believe it. They break their sleeves on the wolf, and then the wolf becomes new sleeves, which seems only fair." } },
      choices = {
        { text = "That's tidy work.", next = "leather_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_more = {
      lines = { { id = "lm_default", text = "Eagan Peltskinner down in Goldshire tans better than I ever could, mind you. When I've coin to spare I buy from him instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Abbey to pray and stayed to sew. The Light needs both, I think." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my needle, friend." } },
  },
}

-- Janos Hammerknuckle: dwarf weaponsmith at the Abbey.
P:NPC {
  key = "janos", id = TODO_NPC("Janos Hammerknuckle"), name = "Janos Hammerknuckle", title = "Weaponsmith",
  bible = "bibles/northshire_smiths.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "gruff" }, values = { "craft" },
  impression = {
    first = "Janos Hammerknuckle is a dwarf a long way from Ironforge, selling blades to human recruits and grumbling about how they hold them.",
    third = "{name} met Janos Hammerknuckle, a dwarf weaponsmith at Northshire Abbey.",
  },
  greetings = {
    { id = "g_default", text = "Swords, maces, axes. Pick one and hold it the right way round, if ye please." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back with all yer fingers. Good, that means ye listened." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Janos Hammerknuckle. I sell steel to the Abbey's recruits, and I've given up counting how many of them grip a sword like a soup ladle." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Well now, a proper dwarf! Ye've no idea how good it is to hear a sensible voice up here among all these tall folk." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind, then? Out with it." },
        { id = "h_again2", text = "Still here? Ask away, lad, I've a blade to quench." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why leave Ironforge for an abbey?", next = "why" },
        { text = "How should I hold a sword, then?", next = "grip" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the humans pay in good silver and the forges back home have more smiths than anvils. And because nobody here argues with me about Bronzebeard politics over breakfast." } },
      choices = {
        { text = "Coin's a fine reason to travel.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Arming the young is the better reason.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip = {
      lines = { { id = "g_line", text = "Firm, but not like ye're strangling a chicken. Let the wrist move and the weight do the work, and ye'll still have an arm by supper." } },
      choices = {
        { text = "And if I'm fighting kobolds?", next = "grip_kobold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip_kobold = {
      lines = { { id = "gk_default", text = "Then aim low, because they're short, and keep yer candle hand clear. They've a way of setting folk alight with those daft wax hats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Dun Morogh born, Northshire by choice. Mostly by choice." } },
    _none = { { id = "tp_none", text = "Bah, ask me about steel or don't ask me at all." } },
  },
}

-- Brother Paxton: priest who walks the Abbey grounds healing novices; buys Rethban ore for ink.
P:NPC {
  key = "paxton", id = TODO_NPC("Brother Paxton"), name = "Brother Paxton", title = nil,
  bible = "bibles/northshire_smiths.md", role = "priest", tier = "service",
  communities = { "northshire" }, temper = { "gentle" }, values = { "faith", "mercy" },
  impression = {
    first = "Brother Paxton walks the Abbey grounds with his hands ready to heal, and he seems to know every bruised recruit by name.",
    third = "{name} met Brother Paxton, who walks Northshire's grounds healing the recruits.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you. If you're hurt, say so; that's what I'm walking about for." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, and standing upright, praise the Light." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brother Paxton. I walk the grounds from the vineyards to the gate, and I mend whatever the wolves and kobolds leave of our recruits." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A fellow servant of the Light! Walk with me a while, if you've the time, and you'll learn more healing on this path than in any book." },
      },
      again = {
        { id = "h_again", text = "Something else on your mind, child?" },
        { id = "h_again2", text = "Ask what you like; my feet are tired but my ears are not." },
      },
      choices = {
        { text = "Why walk, instead of staying in the Abbey?", next = "walk" },
        { text = "I heard you buy ore from Redridge.", next = "ink" },
        { text = "Good day, Brother.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "Because the hurt ones don't always come inside. A recruit with a wolf bite will limp on rather than admit it, so I go and find him first." } },
      choices = {
        { text = "Pride gets soldiers killed.", next = "walk_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk_pride = {
      lines = { { id = "wp_default", text = "It does, and so does shame, which is pride's quieter sister. I'd sooner heal a boy who's embarrassed than bury one who was brave." } },
      choices = {
        { text = "The weak should learn to ask for help.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Then you're doing the Light's work.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ink = {
      lines = { { id = "i_default", text = "I do, from Foreman Oslow in Lakeshire. Rethban ore ground fine makes a lovely ink for the Abbey's scribes, though he's been too busy with his bridge to send any lately." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I took my vows here and I expect I'll die here, hopefully of old age." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child, but I'll pray you find out." } },
  },
}
