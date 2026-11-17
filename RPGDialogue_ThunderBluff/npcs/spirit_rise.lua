-- Spirit Rise and the Pools of Vision: the Skychaser shaman trainers above, and the Forsaken
-- mage and priest trainers in the caves below. Voice: bibles/spirit_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- The Skychasers: shaman trainers on Spirit Rise.
---------------------------------------------------------------------------

-- Tigor Skychaser: the eldest, grave and slow to praise.
P:NPC {
  key = "tigor", id = TODO_NPC("Tigor Skychaser"), name = "Tigor Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "stern" }, values = { "devout", "wise" },
  notices = { "class" },
  impression = {
    first = "Tigor Skychaser teaches shaman on Spirit Rise with long silences and very little praise. He talks about the elements as old neighbors who must be asked politely.",
    third = "{name} met Tigor Skychaser, the eldest of the Skychaser shaman trainers on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "The spirits are restless this morning, and the wind has a sharp tongue. Speak gently." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits remember you, which is more than I can say for most." },
  },

  notice = {
    { id = "n_orc", cat = "class", when = { class = "SHAMAN", race = "Orc" },
      text = "An orc shaman. Your people lost the spirits once and found them again through Thrall, so you of all people should know never to take them for granted." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tigor Skychaser, and the Skychaser tribe has kept the spirits' ways on this rise since the Bluff was raised. If you would speak with earth, fire, water and air, you must first learn to listen to them." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "You are not of the spirit-speakers, but you may stand here. Only don't shout on Spirit Rise; the spirits dislike it, and so do I." },
      },
      again = { { id = "h_again", text = "Something more? Ask it plainly, as the earth answers." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do you ask the elements?", next = "ask" },
        { text = "What happens if you command them instead?", next = "command" },
        { text = "Farewell, Tigor.", next = "END" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "As you'd ask an elder for a favor, with respect and with patience, and knowing they might say no. A totem is a request, not a leash." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    command = {
      lines = { { id = "c_default", text = "Then you are a warlock, or worse, and the elements will wait for the moment you falter. The orc warlocks once commanded the land of their homeworld, and the orcs themselves will tell you how that ended." } },
      choices = {
        { text = "Surely a shaman must compel the spirits sometimes.", next = "command_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    command_end = {
      big = true,
      lines = { { id = "ce_default", text = "Never, not even when the need is great. Others on this rise would argue with me, but I've seen what an angry spirit does to a careless shaman, and I'd not wish it on anyone." } },
      choices = {
        { text = "Never. The spirits must be asked.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In great need, I'd compel them.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Skychaser. Shaman. Old enough that the spirits call me by name." } },
    advice = { { id = "tp_ad", text = "Thank the element that answered you, every time. They notice who forgets." } },
    _none = { { id = "tp_none", text = "The spirits haven't told me of that, and I won't guess on their behalf." } },
  },
}

-- Beram Skychaser: the practical one, all totems and fieldwork.
P:NPC {
  key = "beram", id = TODO_NPC("Beram Skychaser"), name = "Beram Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "practical", "craft" },
  notices = { "class" },
  impression = {
    first = "Beram Skychaser trains shaman on Spirit Rise and carves totems while he talks. He is more interested in what works in the field than in what the elders say about it.",
    third = "{name} met Beram Skychaser, a practical shaman trainer on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the shavings. Totems don't carve themselves, though the spirits in the wood would like you to think so." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your totems; they always tell me how you've been using them." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "SHAMAN", race = "Troll" },
      text = "A troll shaman. Your people speak to the loa as well as the elements, and I've always wondered how you keep them from quarrelling." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Beram Skychaser. Tigor will teach you to listen to the spirits, and I'll teach you where to put the totem so the spirits can actually help, which is a lesson that's saved more lives than his." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "Not a shaman? Then you can hold this while I carve. Mind the end, it's sharp." },
      },
      again = { { id = "h_again", text = "Something else? Hand me that knife while you think, and keep your hooves off the cedar." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Where should a totem go?", next = "where" },
        { text = "Tigor must mind you saying that.", next = "tigor" },
        { text = "Farewell, Beram.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Behind you, where the enemy has to go through you to kick it over. Young shaman always drop them at their feet and then wonder why the centaur trampled their fire totem first." } },
      choices = {
        { text = "So it's tactics, not prayer.", next = "where_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_end = {
      big = true,
      lines = { { id = "we_default", text = "It's both, and anyone who tells you otherwise has never been in a real fight. The spirits will answer a reverent shaman, but they can't help one who's already dead." } },
      choices = {
        { text = "Reverence comes first. Tactics follow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Use what works. The spirits will understand.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    tigor = {
      lines = { { id = "t_default", text = "He minds everything I say, and I mind half of what he says, and between us the students turn out well. That's how a tribe works." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Skychaser, shaman, and the best totem-carver on this rise, whatever my cousins say." } },
    advice = { { id = "tp_ad", text = "Carry a spare totem. A broken one in the middle of a fight is no use to anyone." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Tigor; he'll take an hour to say he doesn't know either." } },
  },
}

-- Siln Skychaser: the youngest, curious about the caves below.
P:NPC {
  key = "siln", id = TODO_NPC("Siln Skychaser"), name = "Siln Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "eager" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "Siln Skychaser is the youngest of the shaman trainers on Spirit Rise, and the only one who goes down into the Pools of Vision to talk with the Forsaken. The older Skychasers seem to find this worrying.",
    third = "{name} met Siln Skychaser, a young shaman trainer on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Oh, hello! Sorry, I was listening to the wind. It's chatty today." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Come and tell me where you've been." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Do you know Apothecary Zamah, from the caves below? I tried to ask her about the spirits of the dead once, and she laughed at me for a long time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Siln Skychaser, and I teach young shaman with Tigor and Beram, though they'd tell you I'm still learning myself. They're not wrong, but I don't think a shaman ever stops." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "You're not a shaman, but that's fine, I like talking to people who aren't. They ask better questions." },
      },
      again = { { id = "h_again", text = "What else? I've time, the wind's settled, and the earth spirits are dozing." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "You must visit the Forsaken below.", next = "below" },
        { text = "What does the wind say?", next = "wind" },
        { text = "Farewell, Siln.", next = "END" },
      },
    },
    below = {
      lines = { { id = "b_default", text = "Sometimes, when Tigor isn't watching. The Pools of Vision are a holy place, and now there are Forsaken mages and priests living in the caves beside them, and I'd like to know what the spirits there think of that." } },
      choices = {
        { text = "And what do they think?", next = "below_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    below_end = {
      big = true,
      lines = { { id = "be_default", text = "They're uneasy, but they haven't left, and I take that as a good sign. Tigor says the Forsaken shouldn't be so close to the pools, and I think the spirits are more patient than he is." } },
      choices = {
        { text = "The spirits are wise. Let the Forsaken stay.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tigor's right. The dead don't belong there.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    wind = {
      lines = { { id = "w_default", text = "Mostly that there's rain coming over the Stonetalon peaks, and that the harpies are squabbling again at the Windfury Ridge. It's a terrible gossip, the wind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Skychaser, the youngest who teaches. I still carry water for Tigor when he asks." } },
    advice = { { id = "tp_ad", text = "Listen to the wind before a long journey. It'll tell you about the weather, at least." } },
    _none = { { id = "tp_none", text = "I don't know! But I'd like to, and the spirits like a curious heart. Tell me if you find out." } },
  },
}

---------------------------------------------------------------------------
-- The Forsaken mage trainers in the Pools of Vision.
---------------------------------------------------------------------------

-- Archmage Shymm: dry, superior, and certain that magic burns the untrained.
P:NPC {
  key = "shymm", id = TODO_NPC("Archmage Shymm"), name = "Archmage Shymm", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "proud", "careful" },
  notices = { "class", "arcane" },
  impression = {
    first = "Archmage Shymm teaches mages in the caves beneath Spirit Rise, a Forsaken with a dry voice and a low opinion of amateurs. He warns everyone that magic will burn the untrained, and seems to rather hope it does.",
    third = "{name} met Archmage Shymm, a Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the wards on the floor. They're not decorative, and I've no interest in scraping up another careless visitor." },
    { id = "g_back", when = { metBefore = true }, text = "Still unburned, I see. Your control must be improving, which is more than I expected of the living." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "A troll mage. Your people learned the arcane from the elves of Quel'Thalas, I'm told, mostly by being on the wrong end of it." },
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE" },
      text = "You reek of arcane residue. Wash your hands before you touch my books." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Archmage Shymm, and I teach the arcane to those of the Horde with the wit to learn it. Magic burns the untrained, so if you're not a mage, kindly step back from the wards before something catches." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren, down here among the books. Your people don't take up the arcane, which is wise of them, and I'd rather you didn't start in my classroom." },
      },
      again = { { id = "h_again", text = "Something more? Do be brief; even the dead tire of amateurs." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why teach mages here, of all places?", next = "here" },
        { text = "I've heard magic can burn the untrained.", next = "burn" },
        { text = "Farewell, Archmage.", next = "END" },
      },
    },
    here = {
      lines = { { id = "h2_default", text = "Because the High Chieftain offered us a place when few others would, and the caves are quiet, and the tauren leave us alone. One could do worse, and in the Undercity one often does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    burn = {
      lines = { { id = "b_default", text = "Quite literally, on occasion. I knew apprentices in Lordaeron who reached too far and were carried out in buckets, and I've no wish to see it happen in a cave full of old scrolls." } },
      choices = {
        { text = "So power should be kept from the many.", next = "burn_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn_end = {
      big = true,
      lines = { { id = "be_default", text = "Power should be kept from fools, and most people are fools about magic. Dalaran believed that too, and look what became of Lordaeron while it was busy being careful." } },
      choices = {
        { text = "Then guard it closely. Fools burn kingdoms.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge hoarded is knowledge wasted.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied the arcane in life and I study it still. The details are my own affair." } },
    advice = { { id = "tp_ad", text = "Never cast a spell you don't know how to stop." } },
    _none = { { id = "tp_none", text = "Not my field. Try a library, if you can read, and if the Scarlets haven't burned it." } },
  },
}

-- Ursyn Ghull: careful, studious, a little homesick for Dalaran.
P:NPC {
  key = "ursyn", id = TODO_NPC("Ursyn Ghull"), name = "Ursyn Ghull", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "curious", "careful" },
  notices = { "origin" },
  impression = {
    first = "Ursyn Ghull teaches mages in the Pools of Vision and keeps his notes in perfect order. He speaks of Dalaran the way the living speak of a childhood home.",
    third = "{name} met Ursyn Ghull, a Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Ah, welcome. Please don't touch the notes, they're in an order." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I've been rereading something you might find useful." },
  },

  notice = {
    { id = "n_dal", cat = "origin", when = { origin = "forsaken_dalaran_apprentice" },
      text = "You studied in Dalaran, didn't you, before? You hold your hands the way the Violet Citadel taught us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ursyn Ghull, and I teach the arcane here with Archmage Shymm and Thurston Xane. It's a quiet place to study, and the tauren bring us bread sometimes, which none of us can eat now but all of us remember the taste of." },
        { id = "h_notmage", when = { ["not"] = { class = "MAGE" } }, text = "You're not a mage, but you're welcome to sit. Most people who come down here are lost, and I don't mind the company." },
      },
      again = { { id = "h_again", text = "Something else? Take your time; the grave left me plenty of it." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "So you studied in Dalaran.", next = "dalaran" },
        { text = "I studied there too, before.", next = "o_dal", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "Farewell, Ursyn.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Long ago, before the plague, and before Archimonde's armies left the city in ruins. I still dream in its libraries, if the dead can be said to dream." } },
      choices = {
        { text = "I'd guess you'd go back, if you could.", next = "dalaran_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_end = {
      big = true,
      lines = { { id = "de_default", text = "They'd never let me, and I'm not sure I'd want to see what it's become. The Dark Lady gave us something to do with our second lives, and I think I'd rather look forward than back." } },
      choices = {
        { text = "Look forward. The past is dead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Remember the past. It made you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    o_dal = {
      lines = { { id = "od_default", text = "Then we may have passed each other in the halls once, when we both had faces. It's a strange comfort, meeting someone who remembers the same corridors." } },
      choices = { { text = "It is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A student of Dalaran, before. A teacher in the Pools of Vision, now." } },
    advice = { { id = "tp_ad", text = "Write everything down. Memory is less reliable than you'd think, especially after death." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I'll make a note to find out, as I did in Dalaran, back when I had a heartbeat to hurry me." } },
  },
}

-- Thurston Xane: cheerfully morbid and fond of his tauren neighbors.
P:NPC {
  key = "thurston", id = TODO_NPC("Thurston Xane"), name = "Thurston Xane", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "jovial" }, values = { "friendly", "curious" },
  notices = { "race" },
  impression = {
    first = "Thurston Xane teaches mages in the caves beneath Spirit Rise and seems to enjoy being dead more than most Forsaken. He is fond of the tauren, and they are slowly getting used to him.",
    third = "{name} met Thurston Xane, a cheerful Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Hello, hello! Come in, it's warmer down here than you'd think, not that I'd know anymore." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I was just telling the walls about you." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren who isn't edging toward the exit! Please, sit down, your elders mostly look at me like I'm about to eat them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Thurston Xane, at your service, mage trainer and resident optimist of the Pools of Vision. Shymm thinks I'm too cheerful for a dead man, but I've noticed it doesn't make me any less dead to be gloomy about it." },
        { id = "h_notmage", when = { ["not"] = { class = "MAGE" } }, text = "Not a mage? Never mind, sit anyway. I don't get many visitors who aren't here to learn fireball." },
      },
      again = { { id = "h_again", text = "What else? I'm in no hurry. I'm in no hurry about anything anymore." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "How do the tauren treat you?", next = "tauren" },
        { text = "Why are you so cheerful?", next = "cheer" },
        { text = "Farewell, Thurston.", next = "END" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Kindly, and nervously, which is a charming combination. A little calf left a bundle of flowers outside our cave last spring, and I've kept it in a jar ever since, though it's gone a bit brown." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "Because I woke up in a grave, my friend, and then I didn't stay in it. Everything since has been a pleasant surprise, even the smell." } },
      choices = {
        { text = "Something about it must trouble you.", next = "cheer_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer_end = {
      big = true,
      lines = { { id = "ce_default", text = "Oh, plenty, if I let it. Some of us went bitter and some of us went cold, and I decided to be kind, because it was the one thing the Scourge never made us do." } },
      choices = {
        { text = "Kindness is a good choice, Thurston.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bitterness is more honest, I think.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A mage, before and after. The middle bit I'd rather not discuss." } },
    advice = { { id = "tp_ad", text = "Keep a sense of humor. It's the last thing to rot." } },
    _none = { { id = "tp_none", text = "Haven't the faintest! Isn't that exciting?" } },
  },
}

---------------------------------------------------------------------------
-- The Forsaken priest trainers in the Pools of Vision.
---------------------------------------------------------------------------

-- Miles Welsh: teaches the shadow, calmly and without apology.
P:NPC {
  key = "miles_welsh", id = TODO_NPC("Miles Welsh"), name = "Miles Welsh", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout", "careful" },
  notices = { "class" },
  impression = {
    first = "Miles Welsh teaches priests in the Pools of Vision for the Cult of Forgotten Shadows, and speaks of the shadow as calmly as a farmer speaks of rain. He makes no apology for any of it.",
    third = "{name} met Miles Welsh, a Forsaken priest trainer of the Forgotten Shadow in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome. The shadows down here are restful, if you let them be, and far more honest than the Light ever was." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The shadow suits you better than it did." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "PRIEST", race = "Troll" },
      text = "A troll priest. I can teach you Shadowguard, which your people have always had a gift for. The loa and the shadow seem to get along." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Miles Welsh, of the Forgotten Shadow. I teach priests of the Horde what the Light never taught us, and what the shadow has offered in its place." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You are no priest, but the shadow doesn't mind. Sit, if you like, and be quiet." },
      },
      again = { { id = "h_again", text = "Something more? Speak softly here; the dead hear very well." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Forgotten Shadow?", next = "shadow" },
        { text = "Why did the Light abandon you?", next = "light" },
        { text = "Farewell, Miles.", next = "END" },
      },
    },
    shadow = {
      lines = { { id = "s_default", text = "A faith for those the Light forgot, or turned away. We were priests in Lordaeron once, many of us, and when we woke we found the Light was silent, and something else was listening instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "I asked it that, for a long time, on my knees in the ruins. It never answered, so I stopped asking and started listening to what did." } },
      choices = {
        { text = "Perhaps the Light is still there, waiting.", next = "light_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_end = {
      big = true,
      lines = { { id = "le_default", text = "Perhaps it is, for some of you. I've no quarrel with priests who still pray to it, but I'll not go back to a door that was closed on me." } },
      choices = {
        { text = "The Light forgives. Don't give up on it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Use what answers you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priest, before and after. The faith changed; the calling didn't." } },
    advice = { { id = "tp_ad", text = "The shadow takes as much as it gives. Keep count." } },
    _none = { { id = "tp_none", text = "I couldn't say. The shadow keeps its own counsel on that." } },
  },
}

-- Malakai Cross: zealous, sharp, and suspicious of the Light.
P:NPC {
  key = "malakai", id = TODO_NPC("Malakai Cross"), name = "Malakai Cross", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "devout", "loyal" },
  notices = { "race" },
  impression = {
    first = "Malakai Cross teaches priests in the Pools of Vision with the fervor of a convert. He speaks of the Light with contempt and of the Dark Lady with something close to worship.",
    third = "{name} met Malakai Cross, a fervent Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Another visitor. State your business, and don't waste my time; I've already lost one life to fools." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your devotion is noted." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of our own. Good. The Dark Lady has need of every voice that remembers what was done to us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Malakai Cross, and I teach priests here because the Dark Lady wished the Forsaken to have a presence among our allies. The tauren tolerate us, and that is enough." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're no priest. Then you've no business here, unless you're lost, and I'm not a guide." },
      },
      again = { { id = "h_again", text = "Well? What else? The Dark Lady's work doesn't wait on the curious." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why does the Dark Lady want you here?", next = "why" },
        { text = "What do you think of the Light?", next = "light" },
        { text = "Farewell, Malakai.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because allies need watching as much as enemies, and the tauren are generous hosts. We teach, we listen, and we report what we hear, as any loyal citizen of the Undercity would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "A comfortable faith for the living, and a cruel one for the dead. The Scarlet Crusade burns my people in its name, so you'll forgive me if I don't light candles to it." } },
      choices = {
        { text = "The Crusade isn't the Light.", next = "light_end", fx = { learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    light_end = {
      big = true,
      lines = { { id = "le_default", text = "They'd say it is, and the Light doesn't argue with them. When it starts striking down the zealots who use it, I'll reconsider." } },
      choices = {
        { text = "The Light is more than its worst followers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A faith is judged by those who carry it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Dark Lady. That's all the story I need." } },
    advice = { { id = "tp_ad", text = "Trust no faith that has ever tried to burn you." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask a living fool; they have opinions on everything." } },
  },
}

-- Father Cobb: once a village priest in Lordaeron, wistful and gentle.
P:NPC {
  key = "cobb", id = TODO_NPC("Father Cobb"), name = "Father Cobb", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "kind", "patient" },
  notices = { "class" },
  impression = {
    first = "Father Cobb teaches priests in the Pools of Vision and still speaks like a village priest, gently and with a sermon never far off. He seems to miss his old parish more than his old life.",
    third = "{name} met Father Cobb, a gentle Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Come in, child, come in. Mind the step, it's slippery, and I've no longer the hands to catch anyone." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, child. How have you been keeping? I ask everyone, though I've stopped expecting good answers." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest of our people. I wonder sometimes whether we'd have known each other's parishes, before." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Father Cobb, and I keep the priests' lessons here with Miles and Malakai. I had a little parish in Lordaeron once, before the plague came through, and I suppose I still think of my students as a congregation." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're not a priest, but that's no matter. Everyone needs a quiet word now and then, and I've plenty to spare." },
      },
      again = { { id = "h_again", text = "Anything more, child? I've nowhere else to be, and no one left in Lordaeron waiting for me." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Tell me about your parish.", next = "parish" },
        { text = "You must still pray, Father.", next = "pray" },
        { text = "Farewell, Father.", next = "END" },
      },
    },
    parish = {
      lines = { { id = "p_default", text = "A small village in the north, with a chapel and a well and the same faces every Sunday. Most of them came back with me, after a fashion, and most of them don't remember the hymns." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "pr_default", text = "Every morning, though I'm not always sure to whom. Miles says the shadow listens, and Malakai says the Dark Lady does, and I keep praying in case someone kinder is listening too." } },
      choices = {
        { text = "Someone kinder may be.", next = "pray_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray_end = {
      big = true,
      lines = { { id = "pe_default", text = "I like to think so, child. The tauren pray to their Earth Mother up above us, and she seems a gentle sort, so perhaps there's room for an old priest to hope." } },
      choices = {
        { text = "Keep hoping, Father. It's worth it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope is a luxury for the living.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A village priest, once. A teacher in a cave, now. It's not so different as you'd think." } },
    advice = { { id = "tp_ad", text = "Be gentle with the frightened, child. Fear makes people cruel." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child. Perhaps ask someone who gets out more, or someone still breathing." } },
  },
}
