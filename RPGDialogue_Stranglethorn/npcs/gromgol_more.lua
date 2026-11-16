-- Grom'gol, the rest of the camp: the zeppelin tower, the wind riders and the supply tent. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nezraz", id = TODO_NPC("Nez'raz"), name = "Nez'raz",
  bible = "bibles/gromgol_more.md", role = "flightmaster", tier = "service",
  communities = { "gromgol" }, temper = { "chatty" }, values = { "greedy", "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "Nez'raz runs the zeppelin to Orgrimmar from the tower outside Grom'gol, and talks about the Stranglethorn sun like a goblin who's found a beach he doesn't have to pay for. He swears the zeppelins are perfectly safe, and swears it a little too often.",
    third = "{name} met Nez'raz, the goblin zeppelin master at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "The zeppelin to Orgrimmar leaves soon, or late, or soon-ish anyway, so stay near the tower!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You're a regular, pal, and regulars get my best smile, which is free." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Whoa, a big one! Stand in the middle of the deck when you ride, pal, so the zeppelin doesn't list to one side." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look rough, pal. Sit at the top of the tower while you wait, because nothing in the jungle climbs this high, mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nez'raz, zeppelin master! The ship from this tower drops off at Orgrimmar, and the sun here beats the dust there any day of the week. Best post on the line, if you ask me, and nobody ever does." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night runs are the quiet ones, pal, and the jungle down there sounds like it's eating itself. Up here you just hear the engine and the wind, and that's how I like it." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? The zeppelin waits for nobody, except when it does." },
        { id = "h_again2", text = "Ask away while we wait. I love a chat." },
      },
      choices = {
        { text = "Are these zeppelins safe?", next = "safe" },
        { text = "Why do you like it here?", next = "sun" },
        { text = "Do you see much from up here?", next = "view" },
        { text = "I'll catch the next one.", next = "END" },
      },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "Safe as houses, pal, and goblin houses at that! The engines hum, the bags hold, and if anything goes wrong, well, you'll be the first to know, and you'll have a great view." },
        { id = "sa_gnome", when = { race = "Gnome" },
          text = "You're a gnome, so you'll look at the engine and frown, and I'll tell you right now it works, so don't touch it. Safe as houses, really." },
      },
      choices = {
        { text = "That isn't reassuring.", next = "safe_reassure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_reassure = {
      lines = {
        { id = "sr_default", text = "It wasn't meant to be, pal, it was meant to be honest, which is rarer for a goblin. The Horde pays us well, and nobody pays well for a ship that falls down." },
      },
      choices = { { text = "Fair point. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sun = {
      lines = {
        { id = "su_default", text = "The sun, the sea, the breeze off the coast, and nobody asking for a bribe. Out in Durotar the wind blows sand into the gearbox, but here it just blows the smell of the jungle into your face, and I've gotten fond of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    view = {
      lines = {
        { id = "vi_default", text = "Everything, pal! Trolls on the ridges, the ruins in the jungle, the Commander pacing his walls, and once a raptor that tried to climb the tower. It didn't make it, which is the best story I've got." },
      },
      choices = {
        { text = "The trolls come close?", next = "view_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view_trolls = {
      lines = {
        { id = "vt_default", text = "They come and look and go away again. They don't like the zeppelin, I think, and I don't blame them, because a big bag of gas flying over your home would make anybody nervous." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a goblin with a good job, a nice view and a tower all my own. Not much else to say, pal." } },
    advice = { { id = "tp_ad", text = "Don't lean over the rail, pal. The ones who do always find out how far down it is." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it can't ride a zeppelin, I can't help." } },
  },
}

P:NPC {
  key = "thysta", id = TODO_NPC("Thysta"), name = "Thysta",
  bible = "bibles/gromgol_more.md", role = "flightmaster", tier = "service",
  communities = { "gromgol" }, temper = { "calm" }, values = { "dutiful", "patient" },
  notices = { "race", "class" },

  impression = {
    first = "Thysta keeps the wind riders at Grom'gol, calmly, as though the jungle beyond the walls weren't trying to eat everything in it. She watches the trolls on the ridges more closely than she lets on.",
    third = "{name} met Thysta, the wind rider master at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "The riders are ready when you are, so tell me where you need to go." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The riders are rested, and so am I, for once." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your beast keeps eyeing my riders, so keep it back. They've no love for jungle cats." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. The jungle trolls on the ridges watch everyone who comes and goes from this camp, so keep your head low when you leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thysta, wind rider master. From Grom'gol the riders go to Kargath and Stonard, and to the goblins at Booty Bay, if you've any business that far south." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Anything more? The riders are waiting, but patiently." },
      },
      choices = {
        { text = "How do the riders like the jungle?", next = "jungle" },
        { text = "You watch the trolls on the ridges?", next = "trolls" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Not now.", next = "END" },
      },
    },
    jungle = {
      lines = {
        { id = "ju_default", text = "Not at all, and they shy at every shadow in the canopy. Something in that green is always waiting to drop on them, and they know it better than we do." },
      },
      choices = {
        { text = "Do they ever get taken?", next = "jungle_taken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jungle_taken = {
      lines = {
        { id = "jt_default", text = "Not yet, and not while I'm watching. I keep them in the open, on high ground, and I keep my axe by the pen." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    trolls = {
      lines = {
        { id = "tr_default", text = "Bloodscalp, mostly, sometimes Skullsplitter. They watch us and we watch them, and so far nobody's been fool enough to start anything at this end of the camp." },
      },
      choices = {
        { text = "They should be driven off.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let them watch. It's their jungle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the riders. That's my work, and I do it well." } },
    advice = { { id = "tp_ad", text = "Fly high over the jungle. The things down there can't reach you if you stay high." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask the Commander; he knows the camp better than I do." } },
  },
}

P:NPC {
  key = "uthok", id = TODO_NPC("Uthok"), name = "Uthok",
  bible = "bibles/gromgol_more.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "gruff" }, values = { "practical" },
  notices = { "weary", "class" },

  impression = {
    first = "Uthok sells general supplies at Grom'gol: bags, arrows, a little food, and whatever else can be shipped in by zeppelin without spoiling. He's gruff and quick, and he watches his stock like a hawk.",
    third = "{name} met Uthok, who sells general supplies at Grom'gol.",
  },

  greetings = {
    { id = "g_default", text = "I've got bags, ammunition and drink, so tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, then. Good, the jungle eats supplies faster than I can stock them." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Low on arrows? The jungle swallows them; you shoot, and they're gone into the green, so buy double." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've been dead recently, by the look of you. Buy some drink and rest before you head out again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Uthok, general supplies. Everything I sell came off a zeppelin, and the jungle will rot it or eat it in a week, so buy what you need and use it fast." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Anything more? I've got crates to open." },
      },
      choices = {
        { text = "What's the hardest thing to keep in stock?", next = "stock" },
        { text = "Do the trolls ever try to steal from you?", next = "thieves" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Nothing today.", next = "END" },
      },
    },
    stock = {
      lines = {
        { id = "st_default", text = "Arrows and shot, because every hunter in camp goes out after raptors and comes back with an empty quiver. After that, anything made of cloth, because the damp turns it green in three days." },
      },
      choices = {
        { text = "Can't the zeppelin bring more?", next = "stock_zep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_zep = {
      lines = {
        { id = "sz_default", text = "It does, and the goblins charge the Horde for every crate as if it were gold. I complain to the Commander, and he complains to Orgrimmar, and nothing changes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thieves = {
      lines = {
        { id = "th_default", text = "The Bloodscalp have stolen rations from the caravans, so the Commander says, but never from my tent. I sleep on my crates, and they know it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies. I came with the Commander, and I'll leave with him." } },
    advice = { { id = "tp_ad", text = "Keep your bags dry, or everything in them rots. That's the whole of my advice." } },
    _none = { { id = "tp_none", text = "Don't know. I sell supplies, not stories." } },
  },
}
