-- Dun Morogh: Forever's camping adventurer on the road near Kharanos. Voice: bibles/dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eric", id = TODO_NPC("Eric Brighthammer"), name = "Eric Brighthammer",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "hearty" }, values = { "friendly", "practical" },
  notices = { "craft", "weary" },

  greetings = {
    { id = "g_fire", text = "Ho there! Come warm your hands. It's cold enough up here to freeze a greeting halfway out." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the fire! Sit. Snow's coming, and good company's better than a second blanket." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you can build a proper campfire. Up in these hills, that's the difference between a camp and a grave." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look chilled through, and not from the snow. Sit by the fire. Nothing helps quite like it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Eric Brighthammer. I've slept under more stars than roofs, and I'll teach anyone who asks how to do it without freezing." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Somebody sent you my way? Good. A new face at the fire is the best news in Dun Morogh." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit close to the fire, and stay sat. You'll feel the rest settle into you. Then come and tell me." },
      },
      choices = {
        { text = "Why camp in the snow?", next = "why" },
        { text = "Stay warm.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the mountains are too big to see from an inn. And anyone coming down the road can sit at your fire; that's half the fun of it." } },
      choices = { { text = "Teach me.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire first; cooks can make one. Then each trade adds its piece. A good camp is a little town for the night." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask at the Thunderbrew; somebody there knows everything, and the rest is made up." } },
  },
}

-- Coldridge Valley: where young dwarves and gnomes start, below the troll caves.
P:NPC {
  key = "sten", id = TODO_NPC("Sten Stoutarm"), name = "Sten Stoutarm",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "gruff" }, values = { "practical", "friendly" },
  notices = { "greenness", "race" },

  greetings = {
    { id = "g_post", text = "Ye look sturdy enough. Good. I need sturdy, an' all I ever get is green." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any mail fer me? No? Then I've some fer ye." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Fresh as new snow. Here, ye'll want gloves. Bring me some wolf meat an' they're yers." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll be one o' the lucky ones out o' Gnomeregan. Welcome to the cold. Ye'll get used to it. Probably." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sten Stoutarm. I run the post fer Anvilmar, such as it is. Letters come through the pass, an' so do troggs. I prefer the letters." },
        { id = "h_outfit", tags = { "news" }, when = { questActive = TODO_QUEST("Dwarven Outfitters") },
          text = "Wolf meat, from the valley's wolves. Bring me a stack an' I'll see ye properly outfitted. Fair trade." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Coldridge Valley Mail Delivery") },
          text = "This mail's fer Grelin Whitebeard at his camp. Mind the troggs on the way. They don't read." },
      },
      choices = {
        { text = "What about the troggs?", next = "troggs" },
        { text = "I'll get to it.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Ugly, stupid, an' too many of 'em. That's all there is to know. Seen one, ye've seen the lot." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask Grelin; he's from the Senate, he's meant to know things." } },
  },
}

P:NPC {
  key = "grelin", id = TODO_NPC("Grelin Whitebeard"), name = "Grelin Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "coldridge" }, temper = { "determined" }, values = { "loyal", "dutiful" },
  notices = { "kit" },

  greetings = {
    { id = "g_camp", text = "The trolls are up to something, friend. I can feel it in my beard." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Better you than my apprentice. Anyone's better than my apprentice." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Frostmane gave ye a hiding. Sit by the fire an' let the camp mend ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grelin Whitebeard, special envoy of the Senate. They sent me to learn what the Frostmane trolls are up to. I'll not let the King down." },
        { id = "h_cave", tags = { "news" }, when = { questActive = TODO_QUEST("The Troll Cave") },
          text = "The trolls keep to the caves in the south of the valley. Thin their numbers. I want to know how many there are." },
        { id = "h_journal", when = { questActive = TODO_QUEST("The Stolen Journal") },
          text = "One o' the trolls, a hulking thing with painted skin, walked into my camp while I was away an' took my journal. Get it back. Everything I've learned is in it." },
        { id = "h_senir", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Take my notes to my brother Senir in Kharanos. He'll know what to make of them." },
      },
      choices = {
        { text = "Who's your apprentice?", next = "apprentice" },
        { text = "I'll deal with the trolls.", next = "END", fx = { affinity = 2, standing = { coldridge = 1 } } },
      },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Soren. A good lad. A bumbling lad. Mostly the second. That's why I need ye." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not in my report. Ask Senir, in Kharanos." } },
  },
}

-- Kharanos: the town between Coldridge and Ironforge.
P:NPC {
  key = "senir", id = TODO_NPC("Senir Whitebeard"), name = "Senir Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "kharanos" }, temper = { "measured" }, values = { "dutiful", "wise" },
  notices = { "race" },

  greetings = {
    { id = "g_kharanos", text = "Welcome to Kharanos. If ye've come from Coldridge, ye've likely met my brother. Ye have my sympathy." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' the clan. The Senate sees the trolls as a nuisance. I see them as a warning. Watch the hills." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senir Whitebeard, envoy of the Senate, same as my brother. He watches the trolls in the valley; I watch the ones in their hold." },
        { id = "h_obs", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Grelin's notes. Let me read. Aye. Worse than he thought, an' he thought it was bad." },
        { id = "h_hold", tags = { "news" }, when = { questActive = TODO_QUEST("Frostmane Hold") },
          text = "Frostmane Hold, up on the ridge. Go in, look about, an' come back with what ye saw. All of it." },
        { id = "h_reports", when = { questActive = TODO_QUEST("The Reports") },
          text = "These reports go to Ironforge. The Senate will read them. Eventually. Make sure they do." },
        { id = "h_brother", when = { metBefore = true }, text = "My brother sent word from the valley. Three lines. Two of them complaints about the cold. The Whitebeards don't waste ink." },
      },
      choices = { { text = "I'll go to the hold.", next = "END", fx = { affinity = 1, standing = { kharanos = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a matter fer an envoy. Try the distillery; they know everythin' after the third pint." } },
  },
}

P:NPC {
  key = "ragnar", id = TODO_NPC("Ragnar Thunderbrew"), name = "Ragnar Thunderbrew",
  bible = "bibles/dunmorogh.md", role = "citizen", tier = "quest",
  communities = { "kharanos" }, temper = { "jovial" }, values = { "proud", "generous" },
  notices = { "drink", "craft" },

  greetings = {
    { id = "g_distillery", text = "Welcome to the Thunderbrew! Best ale in Dun Morogh, an' I'll fight anyone who says otherwise. Politely." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Ye've found the good stuff. Steady on yer feet, now. The floor's older than it looks." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Can ye roast a boar? I've a family recipe that needs hands an' meat both." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ragnar Thunderbrew, part owner o' this fine distillery. My meat supplier ran off to join the King's army, so now I buy from hunters. Patrons want their ribs." },
        { id = "h_ribs", tags = { "news" }, when = { questActive = TODO_QUEST("Beer Basted Boar Ribs") },
          text = "The family recipe! Boar ribs, basted in our own ale. Fetch the makings an' I'll teach ye. Don't tell the Barleybrews." },
        { id = "h_hurley", when = { any = { { questActive = TODO_QUEST("Ragnar Thunderbrew") }, { questActive = TODO_QUEST("Hurley Blackbreath") } } },
          text = "That business with the Dark Irons an' our recipe. I'll not say more in a crowded room. Ye know what's to be done." },
        { id = "h_boar", when = { metBefore = true }, text = "Hunter brought in a boar this morning so big we named it. Then we ate it. Don't get attached, I tell the lads. They never listen." },
      },
      choices = { { text = "A pint, then.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Don't get me started on the Dark Irons. They'd steal the froth off yer ale if ye looked away." } },
    _none = { { id = "tp_none", text = "Couldnae say. Have a drink an' ask again; the answer might come to me." } },
  },
}

P:NPC {
  key = "belm", id = TODO_NPC("Innkeeper Belm"), name = "Innkeeper Belm",
  bible = "bibles/dunmorogh.md", role = "innkeeper", tier = "service",
  communities = { "kharanos" }, temper = { "sociable" }, values = { "generous", "friendly" },
  notices = { "weary", "race" },

  greetings = {
    { id = "g_inn", text = "Grab a mug, find a stool, an' put yer feet near the fire. Ye've earned it, whatever it was." },
    { id = "g_home", when = { homeInn = { "Kharanos", "Thunderbrew Distillery" } }, text = "Home again! Yer room's warm an' yer tankard's clean. Mostly clean." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dug up. Sit. The ale here's raised worse than you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! We toast a gnome in this inn every night, fer savin' the town. Ye'll see." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Belm. Beds upstairs, ale downstairs, an' Rhapsody Malt fer anyone brewin' the Thunderbrew way." },
        { id = "h_bound", when = { questActive = TODO_QUEST("Bound for Kharanos") },
          text = "Ye've come up from Coldridge. Welcome to Kharanos. Sit; the valley's behind ye now." },
      },
      choices = {
        { text = "Who's the gnome you toast?", next = "lazlo" },
        { text = "Just a room, thanks.", next = "END" },
      },
    },
    lazlo = {
      lines = { { id = "l_default", text = "Lazlo Grindwidget. When the Frostmane came at Kharanos in force, he saw 'em off. Small fellow, big heart, an' the Frostmane never came at us like that again." } },
      choices = { { text = "To Lazlo.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I pour, I listen, I forget. Mostly the third." } },
  },
}
