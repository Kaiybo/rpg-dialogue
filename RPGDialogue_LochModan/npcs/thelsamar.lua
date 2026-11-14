-- Thelsamar, the dig and the dam. Voice: bibles/thelsamar.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kadrell", id = TODO_NPC("Mountaineer Kadrell"), name = "Mountaineer Kadrell",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "hearty" }, values = { "dutiful", "friendly" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_town", text = "Welcome tae Thelsamar, friend! Make yerself comfortable. An' have a look at that poster by the League's door while ye're at it." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the loch! Good tae see ye. The rats have been askin' after ye. No' fondly." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye lost an argument wi' a trogg. Happens tae the best of us. Get mended." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Good. The troggs that came up under yer city are all over these hills too. Ye'll want a bit o' payback." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Kadrell. I watch the road through Thelsamar for the King. Troggs in the hills, a Dark Iron spy somewhere about, an' rats in the cellars. Never dull." },
        { id = "h_stout", tags = { "news" }, when = { questActive = TODO_QUEST("Stout to Kadrell") },
          text = "Stout! From Ironforge! Ye've brought me a taste o' home. I'll no' forget this." },
        { id = "h_rats", when = { questActive = TODO_QUEST("Rat Catching") },
          text = "Tunnel rats. In the cellars, in the stores, in my boots one mornin'. Clear 'em out an' the whole town'll stand ye a drink." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Mountaineer Stormpike's Task") },
          text = "Mountaineer Stormpike's got a job wants doin'. He's a good dwarf. Grumpy. Good." },
        { id = "h_stonegear", when = { questActive = TODO_QUEST("Stonegear's Search") },
          text = "Stonegear's on a search o' his own. Help him find what he's after, an' mind the hills while ye do." },
      },
      choices = {
        { text = "What's this about a spy?", next = "spy" },
        { text = "How's the loch?", next = "loch" },
        { text = "Thanks, Kadrell.", next = "END" },
      },
    },
    spy = {
      big = true,
      lines = {
        { id = "s_default", text = "A Dark Iron, poking about the town an' the dam. There's a poster out by the League. If ye see a dwarf who looks a wee bit too sooty, give us a shout." },
      },
      choices = { { text = "I'll keep an eye out.", next = "END", fx = { affinity = 2, learn = { "dark_iron" } } } },
    },
    loch = {
      lines = { { id = "l_default", text = "Beautiful, an' full o' trouble. Like most things worth havin'. Ye should see it at dawn from the dam." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Sneakin' about where they've no business. I'd like tae know what they want wi' a dam." } },
    _none = { { id = "tp_none", text = "Couldnae say. Ask at the inn; they hear everythin'." } },
  },
}

P:NPC {
  key = "ironband", id = TODO_NPC("Prospector Ironband"), name = "Prospector Ironband",
  bible = "bibles/thelsamar.md", role = "scholar", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "honest", "practical" },
  notices = { "craft" },

  greetings = {
    { id = "g_dig", text = "Watch the trench. An' the ropes. An' the lads, they're workin'. Slowly, but workin'." },
    { id = "g_back", when = { metBefore = true }, text = "Good, ye came back. We could always use another pair o' hands that know which end's the shovel." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye'll know good stone from bad. Most o' what we find here is bad. The good bits are worth it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darteus Ironband, Explorers' League. This is my dig. It's slow work. I'll no' pretend otherwise. But it'll pick up, an' when it does, ye'll hear about it in Ironforge." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Excavation Progress Report") },
          text = "A report for the League. Tell 'em: slow, but steady. Tell 'em we need more hands. Tell 'em the troggs are a nuisance. They'll know the last bit already." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Protecting the Shipment") },
          text = "A shipment comin' up the road, an' the hills are crawlin'. See it gets here in one piece. I'm countin' on it." },
        { id = "h_stormpike", when = { heardLine = "stormpike_p.h_default" },
          text = "Ye've met Stormpike in the Hall? He's curt. He's always been curt. He reads my reports, though. Every word." },
      },
      choices = {
        { text = "What are you digging for?", next = "dig" },
        { text = "Good luck with the dig.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "The past. Our past. What the old dwarves left in these hills before Ironforge was a single hall. Every shard's a page o' a book nobody's read." },
      },
      choices = { { text = "That's worth digging for.", next = "END", fx = { affinity = 2, learn = { "explorers_league" } } } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_league", text = "The finest lot o' diggers, scholars an' madmen in the world. I'm in the middle category." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're diggin' too, down south in Uldaman. I'd dearly like tae know what they're after." } },
    _none = { { id = "tp_none", text = "No' my field. My field's six feet down." } },
  },
}

P:NPC {
  key = "hearthstove", id = TODO_NPC("Innkeeper Hearthstove"), name = "Innkeeper Hearthstove",
  bible = "bibles/thelsamar.md", role = "innkeeper", tier = "service",
  communities = { "thelsamar" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "The Stoutlager welcomes ye! Sit down, have a pint, tell us a tale. In that order." },
    { id = "g_home", when = { homeInn = { "Thelsamar", "Stoutlager Inn" } }, text = "The Stoutlager missed ye! Yer bed's warm an' yer mug's clean. Well. Clean enough." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Troggs, was it? Sit. Vidra's got sausages on. They'll mend what the troggs broke." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's the spirit! Well, that's several spirits. Sit down before the floor comes up tae meet ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hearthstove. I keep the Stoutlager. Best ale between Ironforge an' the Wetlands, an' I'll fight anyone who says otherwise. After they've paid." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two miners fought over the last stool last night. Broke the stool. Now neither of 'em has a stool. Lesson in there somewhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late, an' the miners are singin' about the dam. Every verse is the same verse. Louder." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just a pint.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldnae tell ye. Buy a round an' ask the whole inn; ye'll get six answers." } },
  },
}

P:NPC {
  key = "vidra", id = TODO_NPC("Vidra Hearthstove"), name = "Vidra Hearthstove",
  bible = "bibles/thelsamar.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "brisk" }, values = { "proud" },
  notices = { "craft" },

  greetings = {
    { id = "g_kitchen", text = "Out o' my kitchen, unless ye've brought me somethin' tae cook." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then ye'll want my sausage recipe. Ye can't have it. But ye'll want it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Vidra. I cook for the Stoutlager. Thelsamar blood sausages, famous from here tae Ironforge. Well. Famous in Thelsamar." },
        { id = "h_sausages", tags = { "news" }, when = { questActive = TODO_QUEST("Thelsamar Blood Sausages") },
          text = "Bring me what I asked for an' ye'll have the best sausages ye've ever eaten. Don't ask what's in 'em. It's in the name." },
        { id = "h_secret", when = { metBefore = true }, text = "Folk keep askin' what's in the blood sausage. I tell them: blood, an' sausage, an' a secret. The secret's mostly more sausage." },
      },
      choices = { { text = "I'll pass on the details.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I cook. Ask someone who talks." } },
  },
}

P:NPC {
  key = "rugelfuss", id = TODO_NPC("Captain Rugelfuss"), name = "Captain Rugelfuss",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "formal" }, values = { "dutiful" },
  notices = { "soldier" },

  greetings = {
    { id = "g_ease", text = "At ease. Ceremony can wait until the troggs do." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting sort. Good. The King's lands need defenders more than they need visitors." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Rugelfuss. I hold the Valley of Kings for Ironforge. The troggs rise from under the hills faster than we put them down." },
        { id = "h_trogg", tags = { "news" }, when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "The troggs have dug in close. Thin them, and bring proof. I want the King to read numbers, not complaints." },
        { id = "h_lands", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "These are the King's lands, and the King's statues watch over them. I'll not have troggs nesting at their feet." },
        { id = "h_count", when = { metBefore = true }, text = "Put down eleven troggs yesterday. Twelve more came up where they fell. I've stopped countin' an' started diggin' trenches." },
      },
      choices = { { text = "I'll help defend them.", next = "END", fx = { affinity = 2, align = { order = 1 } } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "The same troggs, or their cousins. They came up under the gnomes, and now they're coming up under us." } },
    _none = { { id = "tp_none", text = "Not my post. Ask in Thelsamar." } },
  },
}

P:NPC {
  key = "hinderweir", id = TODO_NPC("Chief Engineer Hinderweir VII"), name = "Chief Engineer Hinderweir VII",
  bible = "bibles/thelsamar.md", role = "worker", tier = "quest",
  communities = { "thelsamar" }, temper = { "anxious" }, values = { "proud", "careful" },
  notices = { "craft" },

  greetings = {
    { id = "g_dam", text = "Careful on the walkway! It's perfectly safe. Mostly safe. Engineered to be safe. Please hold the rail." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Come, look at these stress readings. No? Not everyone loves a stress reading. Their loss." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hinderweir the Seventh, Chief Engineer of the Stonewrought Dam. Seventh of the name, and I'll not be the one remembered for the day it fell." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("A Dark Threat Looms") },
          text = "Someone's been at the dam. Things moved that shouldn't move. Things left that shouldn't be here. Find out who, before it's too late to find out anything." },
        { id = "h_crack", when = { metBefore = true }, text = "Found a hairline crack on the east face this morning. Nothin'. Probably nothin'. I'll check it again tonight. An' tomorrow. An' forever." },
      },
      choices = {
        { text = "How old is the dam?", next = "old" },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    old = {
      big = true,
      lines = {
        { id = "o_default", text = "Older than my grandfather's grandfather, and holding back the whole loch. If it goes, the valley below goes with it. I check it every morning. And every night. And sometimes in between." },
      },
      choices = { { text = "That's a lot of responsibility.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name near my dam. Just... don't. I've enough to worry about." } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything but the dam right now. I rarely can." } },
  },
}
