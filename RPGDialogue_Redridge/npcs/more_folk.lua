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
    first = "She knows every drunk in town by his boots.",
    third = "{name} met Guard Adams, who keeps the peace around the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Inn's still open, {class}, and the taproom's rowdy. Go in by the front, since the back step's where they fall down." },
    { id = "g_default", text = "Keep it civil near the inn, {class}. I've enough trouble with the locals without adding travellers to it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you've not started a brawl yet, so you're ahead of most." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be wandering. The inn's still open, if that's where you're headed, and the gnolls are still out, if it isn't." },
  },
  notice = {
    { id = "n_x1", cat = "soldier", when = { origin = "human_city_guard" },
      text = "You've stood a city watch, I can see it. Then you know the worst post is the one outside a tavern door." },
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
        { id = "h_x_again1", text = "What else? I've the back of the inn to walk yet." },
        { id = "h_again", text = "Anything else? I've another round to walk." },
        { id = "h_again2", text = "Go on, but quickly, mind." },
      },
      choices = {
        { text = "What trouble do you get at the inn?", next = "inn" },
        { text = "Why not the barricades?", next = "barricades" },
        { text = "How bad are the gnolls?", next = "gnolls" },
        { text = "Who's inside the inn tonight?", next = "inside" },
        { text = "Two years isn't long in a watch.", next = "twoyears" },
        { text = "I've fought at your barricades. They need you there.", next = "fought", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 20 } },
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
    inside = {
      lines = {
        { id = "inside_1", text = "Brianna behind the desk, Wental at the bar, and Darcy carrying trays between men who don't deserve her patience. There's a tailor and a cook's supplier by the hearth, and Wiley the Black upstairs, who I'm told not to mind." },
      },
      choices = {
        { text = "Why aren't you to mind Wiley?", next = "wiley" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wiley = {
      lines = {
        { id = "wiley_1", text = "Because the Marshal says he's useful, and that what he's useful for isn't my business. He's polite to me on the stairs, and I count the spoons after he's passed, and so far we've both been satisfied." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    twoyears = {
      lines = {
        { id = "twoyears_1", text = "No, it isn't, and Guard Howe never tires of saying so. But I've broken up more fights in two years than he saw in his first ten, and a gnoll at least doesn't cry on you afterwards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fought = {
      lines = {
        { id = "fought_1", text = "Did you? Then you've seen what I've only heard from the stretcher-bearers. If you ever get the Marshal's ear, tell him Adams can hold a spear as well as she can hold a drunk." },
        { id = "fought_2", when = { class = "PALADIN" }, text = "Did you? Then say so to Marshal Marris, if you would. He listens to the Light's knights, and he might hear from you what he won't from me, that I'm wasted on this doorstep." },
      },
      choices = {
        { text = "I'll tell him. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The fishermen say the murlocs have come further up the shore this month. They say it loudest around their fourth ale." } },
    advice = { { id = "tp_x_advice", text = "If you drink at the inn, pay Wental as you go. He remembers, and so do I." } },
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
    first = "She talks as if she were responsible for every brick in town.",
    third = "{name} met Guard Clarke, who patrols the streets of Lakeshire.",
  },
  greetings = {
    { id = "g_y1", when = { questActive = TODO_QUEST("Blackrock Menace") }, text = "You're the Marshal's new sword against the Blackrock. Mind the ridge road, and come back by daylight if you can." },
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Evening, {class}. If you're lodging, the inn's that way; if you're not, I'd like to know where you're sleeping." },
    { id = "g_default", text = "Good day, {class}. Lakeshire's glad of visitors, so long as they're the helpful sort." },
    { id = "g_back", when = { metBefore = true }, text = "Back in town? Good. We could use a few more familiar faces." },
  },
  notice = {
    { id = "n_x1", cat = "soldier", when = { race = "Human", origin = "human_lordaeron_refugee" },
      text = "You came down from the north, by your voice. We've a few of your people here, and they've earned their place twice over." },
    { id = "n_x2", cat = "soldier", when = { minLevel = 25 },
      text = "You've been up in the hills already, by the state of your boots. I'll want to hear what you saw, before you go." },
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
        { id = "h_x_again1", text = "What else, {class}? I've the east lane still to walk." },
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. The streets aren't going anywhere." },
      },
      choices = {
        { text = "Smaller than it was?", next = "smaller" },
        { text = "Who should I speak to about work?", next = "work" },
        { text = "The town looks well enough to me.", next = "well" },
        { text = "Which families have stayed?", next = "families" },
        { text = "You notice the rooftops as you walk.", next = "rooftops" },
        { text = "I've thinned the Blackrock orcs for the Marshal.", next = "thinned", when = { questDone = TODO_QUEST("Blackrock Menace") } },
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
    families = {
      lines = {
        { id = "families_1", text = "The Jainroses, with their herbs, and the Femmels, and Verner Osgood, who says his forge is too heavy to move. Magistrate Solomon could have had a seat in Stormwind twice over, and he's stayed with us." },
      },
      choices = {
        { text = "Why does the Magistrate stay?", next = "solomon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    solomon = {
      lines = {
        { id = "solomon_1", text = "He says a town that loses its magistrate has already started packing. I think it's simpler than that, and he can't bear to leave the place worse than he found it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rooftops = {
      lines = {
        { id = "rooftops_1", text = "You saw that. A Blackrock scout came in over the smithy roof last year and was through three gardens before anyone shouted. Since then I've walked with my chin up, and Bailiff Conacher laughs at me for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    thinned = {
      lines = {
        { id = "thinned_1", text = "So the Marshal said, and I walked my round that night without once reaching for my sword. It won't last, {class}, since there are always more of them at Stonewatch, but Lakeshire slept, and that was your doing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    redridge_gnolls = { { id = "tp_x_redridge_gnolls", text = "They've grown bold since the garrison thinned. A year ago they'd not have come within sight of a guard." } },
    rumors = { { id = "tp_x_rumors", text = "There's talk of orc signal fires on the ridge above Stonewatch. I've seen smoke there myself, and I don't call that talk." } },
    advice = { { id = "tp_x_advice", text = "Tell a guard where you're bound when you leave town. We can't look for you if we don't know which hill to search." } },
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
    first = "He says very little, and every word is weighed.",
    third = "{name} met Guard Pearce, who stands at the Lakeshire bridge.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Late to be crossing, {class}. Walk where I can see you, and we'll both be easier." },
    { id = "g_x2", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "You've the Magistrate's letter on you. Then I'll not keep you standing here." },
    { id = "g_default", text = "State your business in Lakeshire, {class}, or move along. I'll take either." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your business must be good, to keep you crossing this bridge." },
  },
  notice = {
    { id = "n_x1", cat = "travel", when = { class = "ROGUE" },
      text = "You looked at my keys before you looked at my face. I've noted it, and that's all I'll say for now." },
    { id = "n_x2", cat = "travel", when = { race = "NightElf" },
      text = "We don't see many of your people on this bridge. You're welcome in Lakeshire, and you'll forgive me if I stare a little." },
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
        { id = "h_x_again1", text = "Something more? The bridge is quiet." },
        { id = "h_again", text = "Anything else? I've a bridge to watch." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you tell the honest from the rest?", next = "honest" },
        { text = "Do you see many travellers?", next = "travellers" },
        { text = "You'd be better off watching the hills.", next = "hills" },
        { text = "Who else watches this bridge?", next = "others" },
        { text = "What do the gryphon riders bring?", next = "riders" },
        { text = "I looked at your keys first. Did you notice?", next = "keys", when = { class = "ROGUE" } },
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
    others = {
      lines = {
        { id = "others_1", text = "Guard Ashlock walks it, end to end, and I stand at this one. Between us there's always an eye on the span, and his wife keeps the supply shop, so there's a third eye that never closes." },
      },
      choices = {
        { text = "Does Ashlock see what you see?", next = "sees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sees = {
      lines = {
        { id = "sees_1", text = "He sees the people and I see what they carry, and we compare in the evening. He'll tell you a man looked tired, and I'll tell you he had a sword under his cloak, and the two of us make up one decent watchman." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    riders = {
      lines = {
        { id = "riders_1", text = "Dispatches for the Marshal, mostly, and now and then a face from Stormwind that goes straight to the town hall and comes out looking grim. Ariena Stormfeather says the birds are flown harder this year than last." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    keys = {
      lines = {
        { id = "keys_1", text = "I did, and I noticed that you told me, which is more interesting. A thief who admits to looking is either reformed or very sure of {g:himself|herself}, and I'll go on watching to learn which." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everstill_bridge = { { id = "tp_y_everstill_bridge", text = "That's the big one, over the lake, and it's Oslow's worry. Mine is the small one, and mine's still standing." } },
    rumors = { { id = "tp_x_rumors", text = "I don't deal in them. I'll tell you what I've seen, and that's two strangers this week who crossed and didn't come back over." } },
    redridge_gnolls = { { id = "tp_x_redridge_gnolls", text = "They don't use the bridge. They come down the north shore, where there's no one like me to count them." } },
    advice = { { id = "tp_x_advice", text = "When you cross a guarded bridge, look at the guard and nod. It saves him a great deal of wondering." } },
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
    first = "He'd sooner show you good masonry than tell you about it.",
    third = "{name} met Bridge Worker Alex, one of the quieter hands on Foreman Oslow's crew.",
  },
  greetings = {
    { id = "g_x1", when = { questActive = TODO_QUEST("The Everstill Bridge") }, text = "You're the one fetching iron for Oslow. Good. We're down to bent nails and what Dmitri can beg." },
    { id = "g_default", text = "Mind the stones, {class}. They're heavier than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still standing, I see." },
    { id = "g_tools", when = { questActive = TODO_QUEST("The Lost Tools") }, text = "You're after Oslow's toolbox? It went down with the boat, off the end of the pier. Good luck to you." },
  },
  notice = {
    { id = "n_x1", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf. You'll know stonework, then. Look at the footing on the second pier and tell me it isn't sound." },
    { id = "n_x2", cat = "craft", when = { class = "WARRIOR" },
      text = "You've the shoulders for stone. If the fighting ever dries up, Oslow's always short a pair of hands." },
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
        { id = "h_x_again1", text = "What else? This block's not getting lighter." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "How's the bridge coming along?", next = "bridge" },
        { text = "What's Oslow like to work for?", next = "oslow" },
        { text = "This bridge will just burn again.", next = "burn" },
        { text = "You'd rather show me than tell me.", next = "show" },
        { text = "Who else is on the crew?", next = "crew" },
        { text = "Where does your stone come from?", next = "stone", when = { profession = { "Mining", "Engineering" } } },
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
    show = {
      lines = {
        { id = "show_1", text = "Aye. See that joint, where the two courses meet? You can't get a knife blade in it, and that's Trent's cutting and my setting, and it'll be there when both of us are dust." },
      },
      choices = {
        { text = "What makes a joint like that?", next = "joint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    joint = {
      lines = {
        { id = "joint_1", text = "Patience, and a foreman who makes you lift it out and set it again when it's a hair off. I cursed Oslow for that the first month, and I've not cursed him since the spring flood went by and nothing moved." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crew = {
      lines = {
        { id = "crew_1", text = "Dmitri, who talks, and Jess and Trent, and Matthew on the mortar, who thinks the sky's against us. Five men and a foreman, to do what a king's company of masons did the first time." },
        { id = "crew_2", when = { origin = "human_stonemason_child" }, text = "Dmitri, Jess, Trent, Matthew and me. Five men, where the old Stonemasons' Guild would have sent fifty, and I'll not say a word against the guild in front of one of its children." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = {
        { id = "stone_1", text = "The quarry by Stonewatch, once, which the orcs sit on now. So we pull what we can from the old bridge out of the lake bed, and every block we raise is one we don't have to cut." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everstill_bridge = { { id = "tp_x_everstill_bridge", text = "Three arches and a road on top. It doesn't sound like much until you try to put one over deep water." } },
    redridge_gnolls = { { id = "tp_x_redridge_gnolls", text = "They take the iron for the shine of it, I think. They've no use for a bridge." } },
    advice = { { id = "tp_x_advice", text = "Lift with your legs, and don't stand under anything Matthew says is dry." } },
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
    first = "He is the crew's pessimist, and he's usually right.",
    third = "{name} met Bridge Worker Matthew, who mixes the mortar on the Everstill Bridge.",
  },
  greetings = {
    { id = "g_x1", when = { questDone = TODO_QUEST("The Lost Tools") }, text = "You're the one who brought Oslow's tools up out of the lake. That's a week's work saved, and I don't say that about much." },
    { id = "g_x2", when = { questActive = TODO_QUEST("The Everstill Bridge") }, text = "Any sign of that iron? I ask because the sky's asked me twice already today." },
    { id = "g_default", text = "Rain's coming. You can smell it on the lake, if you know how." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The rain's not here yet, but it will be." },
  },
  notice = {
    { id = "n_x1", cat = "craft", when = { profession = "Alchemy" },
      text = "You mix things for a living, by the stains on you. Then you know what it is to have the whole job depend on the weather and somebody else's ingredients." },
    { id = "n_x2", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf. Tell me true, would you trust lake sand in a mortar, or would you send to the hills for it?" },
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
        { id = "h_x_again1", text = "What is it? I've a batch going off behind me." },
        { id = "h_again", text = "Anything else? The mortar won't mix itself." },
        { id = "h_again2", text = "Go on, then. I'm stirring." },
      },
      choices = {
        { text = "When's the rain coming?", next = "rain" },
        { text = "What happens if the mortar fails?", next = "fail" },
        { text = "You worry too much, Matthew.", next = "worry" },
        { text = "What goes into your mortar?", next = "mix" },
        { text = "Have you been wrong about the weather?", next = "wrong" },
        { text = "I've some sway over the weather myself.", next = "sway", when = { class = { "MAGE", "SHAMAN", "DRUID" } } },
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
    mix = {
      lines = {
        { id = "mix_1", text = "Lime burnt from the lake shells, sand from the north bank, and water, and the trick's all in how much of each and how long you leave it be. Too wet and it slumps, too dry and it cracks, and either way it's my name Oslow shouts." },
      },
      choices = {
        { text = "Where do you burn the lime?", next = "lime" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lime = {
      lines = {
        { id = "lime_1", text = "In a kiln behind the smithy, which Verner Osgood lets me use when his forge is cold. He complains about the smell and I complain about his coal, and the bridge gets built anyway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = {
        { id = "wrong_1", text = "Once, in the summer. I swore it would rain and we lost a day under canvas for nothing, and Dmitri's not let me forget it. But I've been right eleven times, and nobody keeps count of those but me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sway = {
      lines = {
        { id = "sway_1", text = "Have you, now? Then keep it dry over Lake Everstill for a fortnight and I'll name the keystone after you. No, don't tell me it doesn't work that way; let me have the thought a while longer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_y_rumors", text = "Dmitri says Stormwind's sending masons. Dmitri says a lot of things, and I'll believe in masons when I'm mixing for them." } },
    everstill_bridge = { { id = "tp_x_everstill_bridge", text = "It'll stand, if the mortar cures. I've said \"if\" about it every day for a year." } },
    redridge_gnolls = { { id = "tp_x_redridge_gnolls", text = "They don't trouble my mortar, at least. I've yet to meet the gnoll who'd steal a bucket of lime." } },
    advice = { { id = "tp_x_advice", text = "Never trust a red sky over Stonewatch. Half the time it isn't weather." } },
    background = { { id = "tp_bg", text = "Lakeshire born, and I've mixed mortar for every wall in this town." } },
    _none = { { id = "tp_none", text = "No idea, but ask Oslow, because he knows everything, or says so." } },
  },
}

-- Guard Ashlock: walks the small bridge between Lakeshire and the gryphon roost; Lindsay Ashlock's husband.
P:NPC {
  key = "guard_ashlock", id = TODO_NPC("Guard Ashlock"), name = "Guard Ashlock", gender = "male",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "patient", "dry" }, values = { "dutiful", "family" },
  notices = { "travel", "soldier", "kit" },
  impression = {
    first = "Guard Ashlock walks the bridge between Lakeshire and the gryphon roost all day and half the night, in a scarf his wife makes him wear. He knows most travellers by their walk before he sees their faces.",
    third = "{name} met Guard Ashlock, who patrols the bridge between Lakeshire and its gryphon roost.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}. Mind the planks by the middle post, as they've worked loose again, and welcome to Lakeshire." },
    { id = "g_2", when = { metBefore = true }, text = "You again. I knew the step before I turned round." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "Evening. Yes, I'm wearing the scarf, and if you've come from the supply shop you can tell her so." },
  },
  notice = {
    { id = "n_1", cat = "travel", when = { mounted = true },
      text = "Walk your mount across, if you'd be so kind. The bridge will bear it, but the planks complain, and so do I." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting {g:man|woman}. The Marshal's at the town hall, and he'll want you before you've had time to stable your horse." },
    { id = "n_3", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's in a state. Verner Osgood's forge is straight on and to the left, and he'd sooner mend it than see you buried in it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Guard Ashlock, bridge watch. I walk from the Lakeshire bank to the gryphon post and back again, and Pearce stands at the town end, so between the two of us this is the best guarded fifty yards in Redridge." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Guard Ashlock, bridge watch. You'll go no further than this plank, and I'd turn round while the turning's easy." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? I'm due at the far end." },
        { id = "hello_again2", text = "Go on. Walk with me, if you like." },
        { id = "hello_again3", text = "Yes, {class}?" },
      },
      choices = {
        { text = "How many times a day do you cross this?", next = "cross" },
        { text = "Your wife keeps the supply shop.", next = "wife" },
        { text = "Fifty yards seems a small thing to guard.", next = "small" },
        { text = "The gryphons don't mind you walking beneath them?", next = "gryphons", when = { class = "HUNTER" } },
        { text = "I'm going after Corporal Keeshan.", next = "keeshan", when = { questActive = TODO_QUEST("Missing In Action") } },
        { text = "Who uses the gryphon roost most?", next = "roost" },
        { text = "Good day, Ashlock.", next = "END" },
      },
    },
    cross = {
      lines = {
        { id = "cross_1", text = "A hundred and forty, on a quiet day; I counted once, for something to do. I know which board creaks and which post leans, and I knew the Everstill Bridge the same way, before the orcs burned it." },
      },
      choices = {
        { text = "You guarded the big bridge too?", next = "bigbridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bigbridge = {
      lines = {
        { id = "bigbridge_1", text = "For six years. I was on the town end the night it went, and there was nothing on the far side to guard by morning. Foreman Oslow's crew are putting it back, and I've asked for my old post when they're done.", fx = { learn = { "everstill_bridge" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wife = {
      lines = {
        { id = "wife_1", text = "Lindsay, yes. She can see the bridge from her counter, which she says is a comfort, and which means I can't so much as loosen my collar. She's the reason half this town has thread and flint, and the reason I've never caught a chill." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    small = {
      big = true,
      lines = {
        { id = "small_1", text = "It's the fifty yards every dispatch crosses, and every reinforcement, and every family that gives up and flies out. If the orcs wanted Lakeshire cut off from Stormwind, they'd not need to take the town, only this." },
      },
      choices = {
        { text = "Then it's the most important post in Lakeshire.", next = "BACK", reply = "I wouldn't go that far in front of the Marshal, but I'm glad somebody sees it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If it matters that much, two guards aren't enough. You're a gesture.", next = "BACK", reply = "We may be. A gesture's still what you've got when the soldiers are elsewhere.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons = {
      lines = {
        { id = "gryphons_1", text = "They've got used to me, and I to them. Ariena Stormfeather says they know my step, and that the big grey one watches for me, though I think he's watching for the fish in my dinner pail." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    keeshan = {
      lines = {
        { id = "keeshan_1", text = "Then you're going up toward Render's Camp, and I'm sorry for it. Keeshan crossed this bridge with his company in the spring, and I've watched the road for him every day since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    roost = {
      lines = {
        { id = "roost_1", text = "The Marshal's couriers, twice a day, and Magistrate Solomon's letters to Stormwind, which go out full of hope and come back thin. After them it's adventurers, who tip Ariena well and never stay long." },
        { id = "roost_2", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "The Marshal's couriers and the Magistrate's letters, and I see you're carrying one of those yourself. Ariena will have a bird ready, because she always does for that seal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everstill_bridge = { { id = "tp_y_everstill_bridge", text = "I'd give a year's pay to stand my old post on it again. Ask Oslow how long, and then add a season." } },
    background = { { id = "tp_background", text = "Lakeshire born, and a guard since I was old enough for the tabard. I've only ever had the two posts, and both were bridges." } },
    redridge_gnolls = { { id = "tp_redridge_gnolls", text = "They keep to the north shore and the hill roads. I've only had one on my bridge, and it went into the lake faster than it came." } },
    rumors = { { id = "tp_rumors", text = "The riders say Stormwind's promised a company for a year now. I've stopped watching the sky for it." } },
    advice = { { id = "tp_advice", text = "If you fly out, fly in daylight. The gryphons don't care, but you'll want to see what's burning below you." } },
    _none = { { id = "tp_none", text = "That hasn't crossed my bridge, so I can't tell you about it." } },
  },
}

-- Amy Davenport: sells trade goods in Lakeshire.
P:NPC {
  key = "amy_davenport", id = TODO_NPC("Amy Davenport"), name = "Amy Davenport", title = "Tradeswoman", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk", "friendly" }, values = { "practical", "thrifty" },
  notices = { "craft", "purse" },
  impression = {
    first = "Amy Davenport sells thread, flux, dyes and all the oddments a craftsman runs out of, from a stall in Lakeshire. She can tell what trade you follow by which shelf your eyes go to first.",
    third = "{name} met Amy Davenport, the tradeswoman of Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Thread, flux, dye, salt and spice, and if you can't see it, ask, because it's likely under something." },
    { id = "g_2", when = { metBefore = true }, text = "Back again? You've used up that last lot quickly. Good, that's how I like my customers." },
    { id = "g_3", when = { questActive = TODO_QUEST("The Everstill Bridge") }, text = "If it's iron you're after, I've none, and neither has anyone else in town. Ask the gnolls, and ask them firmly." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, by where you looked first. Thread's on the left, and the dyes came in fresh on the last gryphon." },
    { id = "n_2", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You'll want flux, and coal if I had any to spare. Verner takes most of what comes in, but I keep a little back for travellers." },
    { id = "n_3", cat = "purse", when = { money = { max = 500 } },
      text = "Don't worry, there's plenty here for a few coppers. Nobody in Lakeshire's had a full purse since the bridge went." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Amy Davenport, and I sell what the trades need to keep working. Everything on this stall came in by gryphon or up the lake road, so every item's a small miracle and priced like one, I'm afraid." },
        { id = "hello_2", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Engineering", "Alchemy", "Cooking", "Enchanting" } }, text = "Amy Davenport, and you're a craftsman, so I shan't have to explain what a spool of good thread is worth out here. Everything's come in by gryphon, mind, and the price shows it." },
      },
      again = {
        { id = "hello_again1", text = "What else can I find you?" },
        { id = "hello_again2", text = "Go on, I'm only tidying." },
        { id = "hello_again3", text = "Yes, ask away, by all means." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "How do you get stock with the bridge down?", next = "stock" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "These prices take advantage of a town in trouble.", next = "prices" },
        { text = "Is there good work for a crafter in Lakeshire?", next = "work", when = { profession = { "Tailoring", "Leatherworking" } } },
        { text = "Oslow has his iron now. The bridge is moving.", next = "bridge", when = { questDone = TODO_QUEST("The Everstill Bridge") } },
        { text = "You know every craftsman in town, then.", next = "crafts" },
        { text = "Good day, Amy.", next = "END" },
      },
    },
    stock = {
      lines = {
        { id = "stock_1", text = "Light things come by gryphon from Stormwind, at a rate that would make you weep, and heavy things come round by Darkshire and the lake road when there's a wagoner brave enough. I've been waiting on a crate of coal since midsummer." },
      },
      choices = {
        { text = "What happened to the coal?", next = "coal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal = {
      lines = {
        { id = "coal_1", text = "Gnolls had the wagon on the north road, and they've no more use for coal than for the iron they take off the bridge crew. I'm told they threw it at each other, which I'd pay to have seen if I hadn't already paid for the coal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "customers_1", text = "Verner Osgood, who buys flux by the sack, and Kimberly Hiett for her fletching thread, and Crystal Boughman, who goes through salt and spice as if the war depended on her stew. Franklin Hamar at the inn sells the finer cloth, and we send each other customers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    prices = {
      big = true,
      lines = {
        { id = "prices_1", text = "I know how they look. But I pay the gryphon master and the wagoner before I see a copper, and I lose one load in three, and I've not raised a price this year that didn't go up on me first." },
      },
      choices = {
        { text = "That's fair. You're keeping the trades alive here.", next = "BACK", reply = "Thank you. I'd rather be thought honest than cheap.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Everyone has a reason. The poor still pay it.", next = "BACK", reply = "They do, and I know every one of them by name. I've not found the answer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_1", text = "More than there are hands for. The guard needs cloaks and the soldiers need straps mended, and everyone's boots are a year past saving. Ask Dorin Songblade what the armoury's short of, and bring a long list." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge = {
      lines = {
        { id = "bridge_1", text = "So I hear, and Oslow's crew bought me out of rope the same day. When that bridge opens, a wagon will get here from Stormwind in two days, and I'll cut every price on this stall and sleep for a week." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crafts = {
      lines = {
        { id = "crafts_1", text = "Every one, and what they owe me. Henry Chapal pays on the day, Kimberly Hiett pays in arrows when coin's short, and Verner Osgood pays when I stand in his doorway until he does." },
        { id = "crafts_2", when = { profession = "Blacksmithing" }, text = "Every one. You'll want to know Verner Osgood, who has the only working forge east of Goldshire and will lend you the anvil if you admire his hammer first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_y_rumors", text = "The gryphon riders say Stormwind's short of everything too. That's meant to comfort us, I think, and it doesn't." } },
    background = { { id = "tp_background", text = "My mother kept this stall, and I counted the buttons for her. It's a smaller trade than it was, and I'm still here." } },
    everstill_bridge = { { id = "tp_everstill_bridge", text = "Every price in Lakeshire comes down the day it opens. I ask Oslow about it more often than he likes." } },
    redridge_gnolls = { { id = "tp_redridge_gnolls", text = "They've cost me three wagons, and they didn't want a thing that was on them." } },
    advice = { { id = "tp_advice", text = "Buy your thread and flux before you go into the hills. Nobody's selling it at Stonewatch." } },
    _none = { { id = "tp_none", text = "I don't stock that, and I don't know it. Try the inn." } },
  },
}

-- Franklin Hamar: sells tailoring supplies from a table in the Lakeshire Inn.
P:NPC {
  key = "franklin_hamar", id = TODO_NPC("Franklin Hamar"), name = "Franklin Hamar", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "genial", "particular" }, values = { "craft", "comfort" },
  notices = { "craft", "kit" },
  impression = {
    first = "Franklin Hamar sells cloth and thread from a table by the hearth in the Lakeshire Inn, where the light is good and the ale is near. He mends the patrons' cloaks while they drink and talks the whole time.",
    third = "{name} met Franklin Hamar, who sells tailoring supplies in the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "Come in, sit down, and mind the bolt of linen on the chair. Franklin Hamar, cloth and thread, at your service." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, there you are. That cloak's holding up, I'm pleased to see, though the hem could do with a stitch." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "A fellow of the needle! Pull up a chair. I've a blue thread from Stormwind you won't find anywhere else east of Elwynn." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Dear me, the state of those seams. I only sell the makings, mind, but for pity's sake let me sell you a needle." },
    { id = "n_3", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe, and decent cloth, too. You'd be surprised how few of those I see, with everyone in Redridge dressed for a gnoll attack." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Franklin Hamar, tailoring supplies. I had a shop on the lakefront once, and when custom thinned I moved my bolts to Brianna's inn, where every traveller in Redridge passes my table sooner or later." },
        { id = "hello_2", when = { timeOfDay = "night" }, text = "Franklin Hamar, tailoring supplies. The taproom's loud at this hour, so lean in, and if Wental's customers start singing we'll continue in the morning." },
      },
      again = {
        { id = "hello_again1", text = "Something else? I've a hem to finish, but it'll wait." },
        { id = "hello_again2", text = "Go on, do. I can sew and listen." },
        { id = "hello_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your cloth and thread.", next = "BUSINESS" },
        { text = "Why sell from an inn?", next = "inn" },
        { text = "What does Lakeshire wear, these days?", next = "wear" },
        { text = "Fine cloth is wasted on a town at war.", next = "wasted" },
        { text = "What would you make, with my skill?", next = "make", when = { profession = "Tailoring" } },
        { text = "Do you carry anything in my size?", next = "size", when = { race = "Gnome" } },
        { text = "You must overhear a good deal from that chair.", next = "overhear" },
        { text = "Good day, Franklin.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "inn_1", text = "Because a shop waits for customers, and an inn collects them. Brianna takes a little rent and a mended tablecloth now and then, and Gloria Femmel has the table across from me, so a traveller can be fed and clothed without leaving the fire." },
      },
      choices = {
        { text = "How do you and Gloria get on?", next = "gloria" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gloria = {
      lines = {
        { id = "gloria_1", text = "Famously, so long as her spices stay on her side. I had a bolt of white linen that smelled of pepper for a month, and she had a customer who found a button in the salt, so we've drawn a line down the hearthstone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wear = {
      lines = {
        { id = "wear_1", text = "Wool, and grey or brown wool at that, cut to be mended and not to be looked at. The guard's cloaks are patched until there's more patch than cloak, and I supply the patches at cost, since I'd sooner see them warm." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wasted = {
      big = true,
      lines = {
        { id = "wasted_1", text = "I'd say the opposite, friend. When everything else is going badly, a clean collar and a whole coat are how a person tells the world they've not given up, and I've seen a new shirt put more heart in a man than a pint." },
      },
      choices = {
        { text = "You're right. Dignity matters most when times are hard.", next = "BACK", reply = "Just so! And it costs less than people think, at my prices.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Vanity doesn't stop gnolls. Sell them armour instead.", next = "BACK", reply = "Dorin sells the armour, friend. I sell what's worn under it, and you'd miss that sooner.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    make = {
      lines = {
        { id = "make_1", text = "Cloaks, and lined ones. The guard on the hill roads would bless your name, and Marshal Marris has been asking Stormwind for winter kit since last winter. Make them plain and make them thick, and nobody here will care about the stitching." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    size = {
      lines = {
        { id = "size_1", text = "Thread comes in one size, I'm happy to say, and cloth cuts as small as you like. I once fitted a gnomish engineer who wanted eleven pockets, and I've been rather proud of that coat ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    overhear = {
      lines = {
        { id = "overhear_1", text = "More than I'd choose to. Soldiers talk about the orcs at Stonewatch, the bridge crew talk about iron, and a gentleman upstairs named Wiley talks to nobody at all and hears more than I do." },
        { id = "overhear_2", when = { questActive = TODO_QUEST("Missing In Action") }, text = "More than I'd choose to, and this week it's all Corporal Keeshan. The soldiers say he'd not have been taken without leaving a great many orcs behind him, and they say it into their cups." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    redridge_gnolls = { { id = "tp_y_redridge_gnolls", text = "They've had two of my deliveries off the north road. What a gnoll wants with twelve yards of muslin, I can't think." } },
    background = { { id = "tp_background", text = "A tailor's son from the lakefront. The shop's shuttered, but the trade came with me in two baskets." } },
    rumors = { { id = "tp_rumors", text = "You hear everything at an inn table. This week it's that Stormwind has sent a man to count us, and not one soldier to help us." } },
    everstill_bridge = { { id = "tp_everstill_bridge", text = "I've a bolt of red put by for the ribbon, when it opens. Oslow says I'm tempting fate." } },
    advice = { { id = "tp_advice", text = "Carry a needle and a yard of thread. It weighs nothing, and it's the difference between a torn cloak and no cloak." } },
    _none = { { id = "tp_none", text = "That's not something I'd know, I'm afraid. Ask Brianna; she hears more than I do." } },
  },
}

-- Gloria Femmel: sells cooking supplies in the Lakeshire Inn; kin to Sherman Femmel the butcher.
P:NPC {
  key = "gloria_femmel", id = TODO_NPC("Gloria Femmel"), name = "Gloria Femmel", title = "Cooking Supplies", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "hearty", "bossy" }, values = { "hospitality", "family" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Gloria Femmel sells salt, spice and flour from a table in the Lakeshire Inn and has views on everyone's cooking, the inn's included. She looks at a traveller and sees how long it has been since a proper meal.",
    third = "{name} met Gloria Femmel, who sells cooking supplies in the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "There you are, and thin as a rail! Gloria Femmel, cooking supplies. Sit down, and tell me what you've been eating on the road." },
    { id = "g_2", when = { metBefore = true }, text = "Back again, and no fatter. What did I tell you about salting your meat?" },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Cooking" },
      text = "Now here's somebody who knows a ladle from a spoon. I've hot spices in from Stormwind, and you'll want them for anything that came out of that lake." },
    { id = "n_2", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look as if you've been fighting on an empty stomach, and nobody fights well that way. Get something hot from the kitchen before you do another thing." },
    { id = "n_3", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Good. Bring your catch to me before it goes to the kitchen, and I'll tell you what to put on it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Gloria Femmel, and I sell what goes into the pot before the meat does. Sherman has the butcher's stall, Chef Breanna has the kitchen, and I've got the salt, the spice and the flour, without which the other two would be serving boiled boar." },
        { id = "hello_2", when = { profession = "Cooking" }, text = "Gloria Femmel, and it's a pleasure to meet somebody who cooks. I've the salt, the spice and the flour, and if you're after recipes you'll want Crystal Boughman, who teaches them down the lane." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear?" },
        { id = "hello_again2", text = "Go on, I'm only weighing flour." },
        { id = "hello_again3", text = "Yes? Speak up over the taproom." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Are you kin to Sherman, the butcher?", next = "sherman" },
        { text = "What does Lakeshire eat, with the roads closed?", next = "eat" },
        { text = "Soldiers need rations, not seasoning.", next = "rations" },
        { text = "What's worth cooking in Redridge?", next = "cooking", when = { profession = "Cooking" } },
        { text = "I gathered the makings of Breanna's goulash.", next = "goulash", when = { questDone = TODO_QUEST("Redridge Goulash") } },
        { text = "What do you make of the inn's kitchen?", next = "kitchen" },
        { text = "Good day, Gloria.", next = "END" },
      },
    },
    sherman = {
      lines = {
        { id = "sherman_1", text = "We're Femmels both, and that's as far as we agree. He thinks a good cut needs nothing but fire, and I think he's wasting half his own boar, and we've had that quarrel at every family table since I could hold a spoon." },
      },
      choices = {
        { text = "Who wins?", next = "wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wins = {
      lines = {
        { id = "wins_1", text = "Whoever's cooking, dear. When he roasts, it's plain, and when I do, it's seasoned, and the family eats both and says nothing, which is the only sensible course with Femmels." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = {
        { id = "eat_1", text = "Fish from the lake, when the murlocs let the boats out, and boar and condor from the hills, when the gnolls let the hunters back. Flour comes by gryphon, so bread's dear, and I've taught half the town to stretch it with ground acorns." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rations = {
      big = true,
      lines = {
        { id = "rations_1", text = "Have you eaten army rations, dear? I have. A soldier who's had a hot meal with a bit of pepper in it remembers what he's fighting for, and one who's had hard biscuit for a month remembers only the biscuit." },
      },
      choices = {
        { text = "A good meal is worth a day's rest to a soldier.", next = "BACK", reply = "There, now. I knew you'd sense under that armour.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Comforts make soldiers soft. Let them eat biscuit.", next = "BACK", reply = "Then you can have the biscuit, and I'll keep my pepper for those who've earned it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cooking = {
      lines = {
        { id = "cooking_1", text = "The big condors, for a start, and the tough old boars, which want long stewing. And if you've the stomach for it, the spiders up by the foothills, whose legs fry up better than you'd ever believe." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    goulash = {
      lines = {
        { id = "goulash_1", text = "So that was you! She fed the whole guardhouse on it, and Marshal Marris had two bowls, which I've never seen him do. I supplied the paprika, mind, so we'll call it a shared victory." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen = {
      lines = {
        { id = "kitchen_1", text = "Chef Breanna's a fine cook who's been asked to feed a garrison out of a kitchen built for twenty, and she does it without shouting, which I couldn't. I tell her she under-salts, and she tells me to mind my table, and we're very fond of each other." },
        { id = "kitchen_2", when = { questActive = TODO_QUEST("Redridge Goulash") }, text = "She's a fine cook, and she's sent you out for goulash makings, I hear. Get the condor meat fresh, dear, and don't let anyone tell you the spider part is optional." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everstill_bridge = { { id = "tp_y_everstill_bridge", text = "When it opens I shall have cinnamon again. I've been out since the spring, and the town's puddings have suffered." } },
    background = { { id = "tp_background", text = "A Femmel of Lakeshire, and we've fed this town for three generations. I'm the one who went in for seasoning." } },
    rumors = { { id = "tp_rumors", text = "Darcy says a party of soldiers ordered supper last month and never came back for it. She kept it warm two days." } },
    redridge_gnolls = { { id = "tp_redridge_gnolls", text = "They've the hill pastures now, so there's no mutton to be had. I blame them personally for every thin stew in town." } },
    advice = { { id = "tp_advice", text = "Salt your meat the day you kill it, and carry a twist of pepper. You'll thank me on the third day out." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it can't be cooked, I've never looked into it." } },
  },
}

-- Clyde Ranthal: sells leatherworking supplies in eastern Redridge; kinsman of Wilma Ranthal, the skinning trainer.
P:NPC {
  key = "clyde_ranthal", id = TODO_NPC("Clyde Ranthal"), name = "Clyde Ranthal", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "slow", "good-humoured" }, values = { "craft", "family" },
  notices = { "craft", "pet" },
  impression = {
    first = "Clyde Ranthal sells salt, dye and thread for leatherwork and smells faintly of the tanning pit. Wilma Ranthal does the skinning, he does the selling, and he says that's the right way round for both of them.",
    third = "{name} met Clyde Ranthal, who sells leatherworking supplies in Redridge.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon. Clyde Ranthal, leatherworking supplies. Don't mind the smell; after a week you'll not notice it, and after a month you'll miss it." },
    { id = "g_2", when = { metBefore = true }, text = "Back again. That'll be for more curing salt, or you've come for the conversation, and nobody comes for that." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather; it's in your hands. I've coarse thread and good black dye, and I'll not sell you a thing you don't need." },
    { id = "n_2", cat = "craft", when = { profession = "Skinning" },
      text = "A skinner. Wilma will want to look at your knife and tell you what's wrong with it. She's usually right, so I'd let her." },
    { id = "n_3", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine animal. I'll say it once and plainly, {pet} is safe here, and nobody on this side of the lake is measuring it for a jerkin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Clyde Ranthal. Wilma takes the hides off, and I sell what you need to turn a hide into something you'd wear, which is salt, thread, dye and a great deal of patience." },
        { id = "hello_2", when = { profession = "Leatherworking" }, text = "Clyde Ranthal. You'll know the trade, so I'll only say that my curing salt is dry, my thread is waxed, and the black dye is the same the Stormwind guild uses." },
      },
      again = {
        { id = "hello_again1", text = "What else can I do for you?" },
        { id = "hello_again2", text = "Go on. Leather's in no hurry." },
        { id = "hello_again3", text = "Yes, I'm listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Wilma Ranthal is your kin.", next = "wilma" },
        { text = "What hides come out of Redridge?", next = "hides" },
        { text = "It's grim work, living off dead animals.", next = "grim" },
        { text = "What's worth making from Redridge hides?", next = "making", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Do the hunters here sell to you?", next = "hunters", when = { class = "HUNTER" } },
        { text = "How do you keep leather from rotting by a lake?", next = "damp" },
        { text = "Good day, Clyde.", next = "END" },
      },
    },
    wilma = {
      lines = {
        { id = "wilma_1", text = "She is, and the better half of the business. She lives out in the canyon to the east, where the wind takes the smell away from town, and I go back and forth with the salt and the news." },
      },
      choices = {
        { text = "Isn't it dangerous, out there?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_1", text = "It is, with the Blackrock orcs holding the valley beyond her. But she's skinned things bigger than an orc, and she says they've only troubled her the once and didn't trouble her twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Boar, mostly, thick and good for boots, and condor skin if you want something light. The big black worgs the orcs keep have a fine heavy pelt, though you'll have a disagreement with the owner first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grim = {
      big = true,
      lines = {
        { id = "grim_1", text = "I suppose it looks that way. But the boar was killed for somebody's supper either way, and I'd call it grimmer to eat the meat and leave the rest to rot on the hill." },
      },
      choices = {
        { text = "Using the whole animal is a kind of respect.", next = "BACK", reply = "That's what Wilma says, in nearly those words. You'd get on with her.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It's still a trade built on killing.", next = "BACK", reply = "So is a butcher's, friend, and a soldier's. I only make the boots.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    making = {
      lines = {
        { id = "making_1", text = "Boots first, since every pair in Lakeshire's worn through, and then belts and straps for the guard. Dorin Songblade will buy good strapping without haggling, which from Dorin is high praise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters = {
      lines = {
        { id = "hunters_1", text = "The few who still go into the hills, yes, and they come back with fewer hides and longer stories each month. The gnolls have taken to skinning what they kill themselves, and badly, which offends me nearly as much as the killing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "damp_1", text = "Salt, smoke and never letting it sit. A hide wants to be either wet in the pit or dry on the rack, and it's the in-between that ruins it, the same as with most things." },
        { id = "damp_2", when = { profession = "Leatherworking" }, text = "The way you already know, with salt and smoke, and by never trusting a damp morning. I rub the finished pieces with boar tallow besides, which the Stormwind guild would turn its nose up at, and which works." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    everstill_bridge = { { id = "tp_y_everstill_bridge", text = "When it opens I can send boots to Stormwind by the wagonload. Until then I sell them to whoever walks past in bad ones." } },
    background = { { id = "tp_background", text = "A Ranthal, and we've always worked hides. I've less of a hand for the knife than Wilma, so I keep the shop." } },
    redridge_gnolls = { { id = "tp_redridge_gnolls", text = "They wear what they kill, and they don't cure it first. You can smell a gnoll camp before you hear it." } },
    rumors = { { id = "tp_rumors", text = "Wilma says the orcs past her canyon have been hauling timber up to Stonewatch. She doesn't know what for, and she doesn't like it." } },
    advice = { { id = "tp_advice", text = "Salt a hide within the hour, flesh side up. An unsalted hide is a rug by evening and a stink by morning." } },
    _none = { { id = "tp_none", text = "That's past what I know. I'm a simple man with a great deal of salt." } },
  },
}
