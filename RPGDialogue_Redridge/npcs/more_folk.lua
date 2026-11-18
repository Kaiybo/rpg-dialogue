-- More of Lakeshire: three of the town guards (the inn, the streets, the bridge) and two of the
-- quieter hands on the Everstill Bridge crew. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Guard Adams: patrols around the Lakeshire Inn.
P:NPC {
  key = "guard_adams", id = TODO_NPC("Guard Adams"), name = "Guard Adams", gender = "female",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk" }, values = { "dutiful" },
  notices = { "soldier", "drink" },
  impression = {
    first = "Guard Adams walks the ring around the Lakeshire Inn, and she knows every drunk in town by his boots. She'd rather be watching the hills for gnolls, and she says so.",
    third = "{name} met Guard Adams, who keeps the peace around the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "Keep it civil near the inn, {class}. I've enough trouble with the locals without adding travellers to it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you've not started a brawl yet, so you're ahead of most." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be wandering. The inn's still open, if that's where you're headed, and the gnolls are still out, if it isn't." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like a soldier. Marshal Marris would be glad of another sword, if you've a mind to stay a while." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've been in the inn a while, by the smell of you. Walk straight past me and we'll call it even." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Adams, Lakeshire watch. I walk the inn and the road around it, and I'd sooner be up at the barricades, but somebody has to keep the fishermen from drowning each other in ale." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've another round to walk." },
        { id = "h_again2", text = "Go on, but quickly, mind." },
      },
      choices = {
        { text = "What trouble do you get at the inn?", next = "inn" },
        { text = "Why not the barricades?", next = "barricades" },
        { text = "How bad are the gnolls?", next = "gnolls" },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Fishermen who've had a bad day, refugees who've had a bad year, and soldiers who've had a bad war. Brianna pours, and I make sure nobody goes through the window." } },
      choices = {
        { text = "Who goes through the window most?", next = "window" },
        { text = "Something else.", next = "BACK" },
      },
    },
    window = {
      lines = { { id = "w_default", text = "The same three men every week, and they always apologise to Brianna in the morning. She's patient, which is more than I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barricades = {
      lines = { { id = "b_default", text = "The Marshal wants the experienced hands up there, and I've only been in the watch two years. I'll get there, mark me, but for now it's the inn and the drunks." } },
      choices = { { text = "You'll get there. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnolls = {
      big = true,
      lines = { { id = "gn_default", text = "Bad enough that the farms on the north road are empty, and worse every month. Redridge gnolls used to be a nuisance, and now they come in packs with orcs behind them.", fx = { learn = { "redridge_gnolls" } } } },
      choices = {
        { text = "Then the watch should push them back into the hills.", next = "BACK", reply = "With what men? Talk to the Marshal; he'll tell you how many we've got.", fx = { align = { order = -1 } } },
        { text = "Hold the town. The town's what matters.", next = "BACK", reply = "That's what the Magistrate says, and I'll do it. But the farms will be gone by spring.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire born, and Lakeshire watch two years now. I'll not leave while the gnolls are here." } },
    redridge_gnolls = { { id = "tp_gn", text = "They come down from the hills at night. We've lost the north farms already." } },
    _none = { { id = "tp_none", text = "Can't say I know. Ask the Magistrate; he knows everything, or says he does." } },
  },
}

-- Guard Clarke: patrols inside Lakeshire.
P:NPC {
  key = "guard_clarke", id = TODO_NPC("Guard Clarke"), name = "Guard Clarke", gender = "female",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "dutiful", "loyal" },
  notices = { "soldier" },
  impression = {
    first = "Guard Clarke walks the streets of Lakeshire with her hand on her sword and her eyes on the rooftops. She talks about the town as if she were responsible for every brick.",
    third = "{name} met Guard Clarke, who patrols the streets of Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}. Lakeshire's glad of visitors, so long as they're the helpful sort." },
    { id = "g_back", when = { metBefore = true }, text = "Back in town? Good. We could use a few more familiar faces." },
  },
  notice = {
    { id = "n_dwarf", cat = "soldier", when = { race = "Dwarf" },
      text = "A dwarf! We've had a few of your folk pass through, on the way to the Burning Steppes. They never stay long, and I can't blame them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Clarke. I walk the streets of Lakeshire, and I make sure everyone who's supposed to be here is here, and everyone who isn't, isn't. It's a smaller town than it was, and that makes it easier and harder at once." },
      },
      again = {
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. The streets aren't going anywhere." },
      },
      choices = {
        { text = "Smaller than it was?", next = "smaller" },
        { text = "Who should I speak to about work?", next = "work" },
        { text = "The town looks well enough to me.", next = "well" },
        { text = "Good day.", next = "END" },
      },
    },
    smaller = {
      lines = { { id = "s_default", text = "Half the families have gone north to Stormwind, or west to Darkshire, since the orcs burned the bridge. The rest stay because they've nowhere else to go, or they're too stubborn to leave." } },
      choices = {
        { text = "Which are you?", next = "which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "Both, I suppose. My family's been here since before there was a bridge to burn, and I'll not be the one who leaves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "wk_default", text = "Marshal Marris for the gnolls, Magistrate Solomon for the orcs, and Foreman Oslow if you can swim. There's no shortage of work in Lakeshire, only of hands to do it.", fx = { learn = { "everstill_bridge" } } } },
      choices = { { text = "If I can swim? Something else.", next = "BACK" } },
    },
    well = {
      big = true,
      lines = { { id = "wl_default", text = "It looks well because we work to keep it that way, {class}. Every day a guard walks these streets, and every night we wonder if it'll be the night the orcs come down." } },
      choices = {
        { text = "Then thank you for walking them.", next = "BACK", reply = "You're welcome, {class}. It's good to hear that, now and again.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A town that can't defend itself should be abandoned.", next = "BACK", reply = "Then you'll not be welcome here long. Good day to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire family, five generations back. We built half the houses on the lake front." } },
    everstill_bridge = { { id = "tp_eb", text = "The orcs burned it, and Oslow's crew is building it back, slowly." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask at the town hall." } },
  },
}

-- Guard Pearce: stands at the Lakeshire bridge.
P:NPC {
  key = "guard_pearce", id = TODO_NPC("Guard Pearce"), name = "Guard Pearce", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "travel" },
  impression = {
    first = "Guard Pearce stands at the Lakeshire end of the bridge, where the gryphon riders come and go, and watches every face that crosses. He talks very little, and every word is weighed.",
    third = "{name} met Guard Pearce, who stands at the Lakeshire bridge.",
  },
  greetings = {
    { id = "g_default", text = "State your business in Lakeshire, {class}, or move along. I'll take either." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your business must be good, to keep you crossing this bridge." },
  },
  notice = {
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've come a long way, by the dust on your boots. The gryphons are quicker, if you've the coin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Pearce, bridge watch. Every traveller who comes into Lakeshire from the gryphon post crosses this bridge, and I watch them all. Most are honest, and some are not." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a bridge to watch." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you tell the honest from the rest?", next = "honest" },
        { text = "Do you see many travellers?", next = "travellers" },
        { text = "You'd be better off watching the hills.", next = "hills" },
        { text = "Good day.", next = "END" },
      },
    },
    honest = {
      lines = { { id = "h_honest", text = "Honest folk look at the town, and the rest look at me. It isn't always true, but it's true often enough to keep me watching." } },
      choices = {
        { text = "And which am I?", next = "me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    me = {
      lines = { { id = "m_default", text = "You looked at both, which tells me you're either very honest or very careful. I'll decide which when you've been here a while." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    travellers = {
      lines = { { id = "t_default", text = "More than you'd think, with the bridge half built. Soldiers coming to fight the orcs, refugees going the other way, and adventurers who never seem to stop moving." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hills = {
      big = true,
      lines = { { id = "hl_default", text = "The hills are the Marshal's business, and the bridge is mine. A man who tries to watch everything ends up watching nothing." } },
      choices = {
        { text = "Fair. Every man to his post.", next = "BACK", reply = "Now you understand the watch.", fx = { align = { order = 1 } } },
        { text = "A good guard goes where he's needed.", next = "BACK", reply = "And leaves the bridge open behind him. No, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A soldier who was told to stand here, and has." } },
    _none = { { id = "tp_none", text = "That's not my business, friend; the bridge is my business." } },
  },
}

-- Bridge Worker Alex: one of the quieter hands on the Everstill Bridge crew.
P:NPC {
  key = "bridge_alex", id = TODO_NPC("Bridge Worker Alex"), name = "Bridge Worker Alex", gender = "male",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "quiet" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Bridge Worker Alex hauls stone on the Everstill Bridge and talks only when he has to. He'd sooner show you a good joint in the masonry than tell you about it.",
    third = "{name} met Bridge Worker Alex, one of the quieter hands on Foreman Oslow's crew.",
  },
  greetings = {
    { id = "g_default", text = "Mind the stones, {class}. They're heavier than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still standing, I see." },
    { id = "g_tools", when = { questActive = TODO_QUEST("The Lost Tools") }, text = "You're after Oslow's toolbox? It went down with the boat, off the end of the pier. Good luck to you." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Engineering", "Mining" } },
      text = "You've a worker's hands, I'd say. We could use another pair, if you're staying." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Alex, bridge worker. I carry stone, and I put it where Oslow tells me, and I don't talk much while I do it. Dmitri does the talking for us all." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Lost Tools") }, text = "You found the toolbox, didn't you? Oslow's been smiling all week, and that's not like him." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "How's the bridge coming along?", next = "bridge" },
        { text = "What's Oslow like to work for?", next = "oslow" },
        { text = "This bridge will just burn again.", next = "burn" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "Slow, with the gnolls stealing the iron and the rains coming. But it's coming, stone by stone, and it'll be a good bridge when it's done.", fx = { learn = { "everstill_bridge" } } } },
      choices = {
        { text = "Who's stealing the iron?", next = "iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "Gnolls, from the camps north of the lake. Oslow wants it back, and he's asking anyone who'll listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    oslow = {
      lines = { { id = "o_default", text = "He's hard but fair, and he knows every stone in that bridge, and he'll not have a crooked one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    burn = {
      big = true,
      lines = { { id = "bn_default", text = "Maybe it will, and then we'll build it again, because Lakeshire needs a bridge, and I know how to build one." } },
      choices = {
        { text = "That's a good answer. Keep building.", next = "BACK", reply = "I will.", fx = { align = { light = 1 } } },
        { text = "Then you're wasting your time.", next = "BACK", reply = "It's my time to waste.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Stone, mostly; I've carried it all my life." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, but Dmitri might, since he talks enough for the both of us." } },
  },
}

-- Bridge Worker Matthew: another of the quiet hands on the bridge crew.
P:NPC {
  key = "bridge_matthew", id = TODO_NPC("Bridge Worker Matthew"), name = "Bridge Worker Matthew", gender = "male",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "dour" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Bridge Worker Matthew mixes the mortar for the Everstill Bridge and keeps an eye on the sky for rain. He is the crew's pessimist, and he's usually right.",
    third = "{name} met Bridge Worker Matthew, who mixes the mortar on the Everstill Bridge.",
  },
  greetings = {
    { id = "g_default", text = "Rain's coming. You can smell it on the lake, if you know how." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The rain's not here yet, but it will be." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer? Don't tell Oslow, he'll have you redesigning the piers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Matthew. I mix the mortar, and I watch the sky, because rain on wet mortar undoes a week's work in an hour. Oslow says I worry too much, and I say he doesn't worry enough." },
      },
      again = {
        { id = "h_again", text = "Anything else? The mortar won't mix itself." },
        { id = "h_again2", text = "Go on, then. I'm stirring." },
      },
      choices = {
        { text = "When's the rain coming?", next = "rain" },
        { text = "What happens if the mortar fails?", next = "fail" },
        { text = "You worry too much, Matthew.", next = "worry" },
        { text = "Good day.", next = "END" },
      },
    },
    rain = {
      lines = { { id = "r_default", text = "Soon, a week or two at most, and then the lake rises and we stop work until spring. Oslow wants the main span up before then, and I'll be surprised if we make it." } },
      choices = {
        { text = "How can I help you make it?", next = "help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    help = {
      lines = { { id = "h_help", text = "Get the iron back from the gnolls, and Oslow's tools back from the lake. Those two things, and we might just do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "f_default", text = "Then the stones slip, and the bridge comes down, and somebody's under it. That's why I watch the sky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worry = {
      big = true,
      lines = { { id = "w_default", text = "Maybe I do, but a worried man builds a bridge that stands, and a careless man builds one that falls." } },
      choices = {
        { text = "Then worry on. It keeps the bridge standing.", next = "BACK", reply = "I will. Thank you.", fx = { align = { order = 1 } } },
        { text = "Sometimes you've got to take the risk.", next = "BACK", reply = "Not with mortar, you don't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire born, and I've mixed mortar for every wall in this town." } },
    _none = { { id = "tp_none", text = "No idea, but ask Oslow, because he knows everything, or says so." } },
  },
}
