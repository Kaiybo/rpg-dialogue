-- Redridge folk a roster scan found missing: Amy Davenport (trade goods), Bridge Worker Daniel,
-- Clyde Ranthal (leatherworking supplies), Franklin Hamar and Gloria Femmel in the Lakeshire Inn,
-- and two more of the watch, Guard Ashlock on the bridge and Guard Hiett in the town.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Amy Davenport: tradeswoman in Lakeshire.
P:NPC {
  key = "amy_davenport", id = TODO_NPC("Amy Davenport"), name = "Amy Davenport", title = "Tradeswoman", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "shrewd", "friendly" }, values = { "practical", "thrifty" },
  notices = { "craft", "purse" },
  impression = {
    first = "Amy Davenport sells trade goods in Lakeshire: thread, flux, vials, dyes and whatever else a craftsman runs out of at the worst moment. She knows what every wagon on the Stormwind road was carrying, and which ones never arrived.",
    third = "{name} met Amy Davenport, who sells trade goods in Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you! If you make things with your hands, I've likely got the bit you've forgotten." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Then you've run out of something, and I can probably guess what." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking", "Alchemy", "Engineering" } },
      text = "You've a craftsman's hands, and craftsmen never carry enough of the small things. Have a look before you're caught short in the hills." },
    { id = "n_poor", cat = "purse", when = { money = { max = 5000 } },
      text = "Your purse sounds light, friend, and there's no shame in that. Thread costs coppers, and I've never laughed at a small sale." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Amy Davenport, tradeswoman. I keep the smiths in flux, the tailors in thread and the alchemists in vials, and with the roads as they are, keeping anything in stock is half a miracle." } },
      again = {
        { id = "h_again", text = "What else can I tell you? I've a ledger to square, but it'll keep." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "What's wrong with the roads?", next = "roads" },
        { text = "Who buys the most from you?", next = "buys" },
        { text = "Trade must be thin in a town under siege.", next = "thin" },
        { text = "Good trading, Amy.", next = "END" },
      },
    },
    roads = {
      lines = { { id = "r_default", text = "The gnolls sit on the Three Corners road and take their pick of what comes up from Elwynn, and the Blackrock orcs hold everything north and east. One wagon in three reaches me whole, and the drivers want double for the trouble.", fx = { learn = { "redridge_gnolls" } } } },
      choices = {
        { text = "What do gnolls want with thread?", next = "thread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread = {
      lines = { { id = "t_default", text = "Nothing at all, which is the galling part. They take the food and the iron, and tip the rest in the ditch, and I've walked out with a guard to pick my own spools out of the mud more than once." } },
      choices = { { text = "That takes nerve. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buys = {
      lines = { { id = "b_default", text = "The bridge crew, for one, since Foreman Oslow goes through coal and flux as if he were building two bridges. After them it's the innkeeper's linens, and then every adventurer who learned a trade last week and can't find a needle." } },
      choices = { { text = "I may be one of those. Something else.", next = "BACK" } },
    },
    thin = {
      lines = { { id = "th_default", text = "You'd think so, but a town that can't send out for a thing has to make it, and making takes supplies. I sell more thread now than I did in peacetime, and I'd give back every copper of it to have the north farms lit again." } },
      choices = { { text = "I believe you would. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept shop in Lakeshire for years, in good times and these. Trade goods aren't grand, but nothing gets made without them." } },
    redridge_gnolls = { { id = "tp_gn", text = "They're on the road at Three Corners, and my wagons pay for it. The watch does what it can with the men it has." } },
    _none = { { id = "tp_none", text = "That isn't on my shelves, friend. Magistrate Solomon's the one for news." } },
  },
}

-- Bridge Worker Daniel: one of Oslow's crew on the Lakeshire bridge; careful, sparing with words.
P:NPC {
  key = "bridge_daniel", id = TODO_NPC("Bridge Worker Daniel"), name = "Bridge Worker Daniel", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "careful", "quiet" }, values = { "craft", "dutiful" },
  notices = { "craft" },
  impression = {
    first = "Bridge Worker Daniel sets stone on the Lakeshire bridge with a plumb line never far from his hand. He answered what I asked and nothing more, and went back to checking a course he had already checked.",
    third = "{name} met Bridge Worker Daniel, one of Foreman Oslow's crew on the Lakeshire bridge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the fresh course there, if you would. It wants another day before anyone leans on it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The same stone's still drying, so the same warning stands." },
  },
  notice = {
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf on the bridge! I'd be glad of your eye on this arch, if you've a moment, since your folk were cutting stone before mine had learned to stack it." },
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "You know stone, or iron at any rate. You'll see why I keep looking at that pier, then." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Daniel, and I lay stone for Foreman Oslow. Dmitri does the talking for the crew, so if it's news you're after you'd do better with him, but I'll answer what I can." } },
      again = {
        { id = "h_again", text = "Was there something else? I can talk while this sets." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "How's the bridge coming along?", next = "bridge" },
        { text = "You check everything twice, I notice.", next = "twice" },
        { text = "What's the crew like to work with?", next = "crew" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "Slower than the Foreman wants and faster than it ought to go. We lost tools in the lake and iron to the gnolls, and the rains are coming, so every day he asks for a week's work out of us.", fx = { learn = { "everstill_bridge" } } } },
      choices = {
        { text = "Will it hold when it's done?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "My part will, because I won't sign to a course I haven't trued. The orcs burned the last bridge from on top, and no mason can build against that, but nothing will bring this one down from underneath." } },
      choices = { { text = "That's a mason's promise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    twice = {
      lines = { { id = "t_default", text = "A crooked stone at the bottom is a crooked bridge at the top, and by then it's too late to say so. Matthew mixes a good mortar and Trent can lift anything, but somebody has to hold the line, and I find I can't leave it to chance." } },
      choices = { { text = "The town's lucky you can't. Something else.", next = "BACK" } },
    },
    crew = {
      lines = { { id = "c_default", text = "They're good men, every one. Jess talks enough for the lot of us and Trent grumbles enough for two, so Alex and I are left free to get on, which suits us both." } },
      choices = {
        { text = "And Foreman Oslow?", next = "oslow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oslow = {
      lines = { { id = "o_default", text = "He shouts, but he's never asked a man to do what he wouldn't do himself, and he was first into the water after those tools. I've worked under quieter foremen and trusted them a good deal less." } },
      choices = { { text = "High praise from you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a mason on the bridge crew. I lay the stone and see that it's straight, and there isn't much more to tell." } },
    everstill_bridge = { { id = "tp_eb", text = "The orcs burned it, and we're building it back in stone. It'll be done when it's right, and not before, if I've any say." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm afraid. Dmitri hears more than I do." } },
  },
}

-- Clyde Ranthal: leatherworking supplies; Wilma Ranthal's kinsman, who works the hides she takes.
P:NPC {
  key = "clyde_ranthal", id = TODO_NPC("Clyde Ranthal"), name = "Clyde Ranthal", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "dry", "unhurried" }, values = { "craft", "family" },
  notices = { "craft" },
  impression = {
    first = "Clyde Ranthal sells leatherworking supplies and works the hides his kinswoman Wilma brings in off the Redridge hills. He talks slowly and stitches quickly, and he insists that hers is the easier half of the trade.",
    third = "{name} met Clyde Ranthal, who sells leatherworking supplies in Redridge.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon. If you've hides to work I've the thread, the salt and the dye for it, and if you've none, I can't help you much." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did that last lot of thread hold, or did you pull it too tight, like everyone does?" },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Those are a leatherworker's thumbs, with the awl scars to prove it. Sit down a minute and tell me what you're making." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, I see. Wilma would have something to say about how you keep it, so I'll spare you and say nothing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Clyde Ranthal. Wilma takes the hide off the beast and I turn it into something folk will pay for, and each of us is sure the other has the soft job." } },
      again = {
        { id = "h_again", text = "What else? I'm only waiting on a dye to take." },
        { id = "h_again2", text = "Go on. Leather doesn't hurry, and neither do I." },
      },
      choices = {
        { text = "Which of you really has the soft job?", next = "soft" },
        { text = "What hides come out of Redridge?", next = "hides" },
        { text = "Is there a living in leather here?", next = "living" },
        { text = "What should a leatherworker stock up on?", next = "stock", when = { profession = "Leatherworking" } },
        { text = "Good day, Clyde.", next = "END" },
      },
    },
    soft = {
      lines = { { id = "s_default", text = "She does, plainly, since all she has to do is walk about the hills with a knife. Mind you, the hills are full of gnolls and I sit by a warm tub all day, so she may tell it differently." } },
      choices = {
        { text = "Do you worry about her out there?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "Every day, and she'd skin me if I said so to her face. I walk out to see her when I can find the path, and I count it a good visit when she's cross with me for coming." } },
      choices = { { text = "She's lucky in her kin. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hides = {
      lines = { { id = "hi_default", text = "Goretusk, which is thick and stubborn and makes a boot that outlives its owner. Condor's no use to me, and the tarantulas are nothing but trouble, but the hounds the gnolls keep have a hide I'd put against anything from Stormwind." } },
      choices = { { text = "I'll remember the hounds. Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "Better than you'd think, and for a poor reason. The watch can't get mail up the road for every recruit, so half of them go to the barricades in leather, and every jerkin on those men passed through somebody's hands like mine." } },
      choices = {
        { text = "Leather against Blackrock axes?", next = "axes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    axes = {
      lines = { { id = "a_default", text = "It won't stop an axe, and I've never told a lad it would. It'll turn a gnoll's teeth and keep the rain off, and it lets a man run, which against an orc is worth more than he'd like to admit.", fx = { learn = { "blackrock" } } } },
      choices = { { text = "Honest armor, at least. Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "st_default", text = "Salt, before anything, because a hide won't wait for you, and more coarse thread than you believe you'll need. Dye's a vanity, though I'll sell it to you gladly, since nobody ever died for want of a black jerkin." } },
      choices = { { text = "Salt and thread, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Ranthal, and we've worked hides in these hills a good while. Wilma does the skinning and I do the rest." } },
    blackrock = { { id = "tp_br", text = "The orcs hold the north and east, and the lads who face them wear what I can stitch. I'd sooner they had steel." } },
    _none = { { id = "tp_none", text = "Can't help you there. If it hasn't got a hide on it, I've likely not noticed it." } },
  },
}

-- Franklin Hamar: tailoring supplies in the Lakeshire Inn.
P:NPC {
  key = "franklin_hamar", id = TODO_NPC("Franklin Hamar"), name = "Franklin Hamar", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "genial", "fastidious" }, values = { "craft", "comfort" },
  notices = { "craft", "kit" },
  impression = {
    first = "Franklin Hamar sells thread, dye and bolts of cloth from a corner of the Lakeshire Inn, close enough to the hearth to keep his fingers supple. He judges the whole common room by its cuffs, and keeps most of the verdicts to himself.",
    third = "{name} met Franklin Hamar, who sells tailoring supplies in the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome. Thread, dyes and patterns are here by the fire, and the ale is over there, and I do recommend keeping the two apart." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning customer! Sit by the fire and tell me what's come unstitched." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "I know a tailor when I see one, because you looked at my thread before you looked at the bar. Come and see the new dyes." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Dear me, the hills have had the best of that coat. A needle and an evening would save it, if you've both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Franklin Hamar, at your service. I supply the needle trade in Lakeshire, such as it is, and Innkeeper Brianna lets me keep my corner so long as I mend her curtains when the fishermen have been at them." } },
      again = {
        { id = "h_again", text = "What else may I tell you? I've all evening." },
        { id = "h_again2", text = "Do go on, friend." },
      },
      choices = {
        { text = "Why set up shop in an inn?", next = "inn" },
        { text = "Who sews in a town at war?", next = "sews" },
        { text = "What do you make of the company here?", next = "company" },
        { text = "What colours are worn in Stormwind now?", next = "colours", when = { profession = "Tailoring" } },
        { text = "Good evening, Franklin.", next = "END" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Because it's warm, it's dry, and every traveller in Redridge comes through that door sooner or later with a torn sleeve. A shop of my own would see ten customers a day, and here I see fifty and a supper besides." } },
      choices = { { text = "A sound arrangement. Something else.", next = "BACK" } },
    },
    sews = {
      lines = { { id = "s_default", text = "Everyone does, friend. There are bandages to roll, cloaks to patch for the watch, and blankets for the families who came in off the north farms with nothing but what they wore." } },
      choices = {
        { text = "The farm families are still here?", next = "families" },
        { text = "Something else.", next = "BACK" },
      },
    },
    families = {
      lines = { { id = "f_default", text = "Some of them are, upstairs and in the houses along the lake, wherever a bed could be found. The women of the town sew for them most evenings, and I find I've rather a lot of thread I had forgotten to count." } },
      choices = { { text = "A kindly sort of forgetting. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    company = {
      lines = { { id = "c_default", text = "Fishermen who wipe their hands on the tablecloths, soldiers too tired to notice what they're wearing, and Barkeep Daniels, who has owned the same apron since the First War. Gloria across the room is the one person here who keeps herself properly, and I've told her so." } },
      choices = { { text = "You notice a great deal. Something else.", next = "BACK" } },
    },
    colours = {
      lines = { { id = "co_default", text = "Blue and gold, as ever, since nobody in Stormwind was ever scolded for dressing like the banner. Out here I'd counsel brown, which hides the dust of the road and never shows a gnoll's opinion of you." } },
      choices = { { text = "Brown it is. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I deal in tailoring supplies, here in the inn. I've been by this fire long enough to know every draught in the room." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my corner. Brianna hears everything; do ask her." } },
  },
}

-- Gloria Femmel: cooking supplies in the Lakeshire Inn; a Femmel, like Sherman the butcher.
P:NPC {
  key = "gloria_femmel", id = TODO_NPC("Gloria Femmel"), name = "Gloria Femmel", title = "Cooking Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk", "motherly" }, values = { "practical", "generous" },
  notices = { "craft", "food" },
  impression = {
    first = "Gloria Femmel sells spices, flour and cooking wares in the Lakeshire Inn, and talks about feeding the town as other people talk about defending it. She asked when I had last eaten properly, and did not care for my answer.",
    third = "{name} met Gloria Femmel, who sells cooking supplies in the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "Come in, sit down, and tell me you've eaten something today besides trail bread." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and thinner than last time, I'd swear to it. What can I get you?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, I can tell, because you sniffed the air before you sat. That's Breanna's stew, and the pepper in it is mine." },
    { id = "n_hungry", cat = "food", when = { hp = { max = 0.6 } },
      text = "Look at the state of you! Get something hot from the kitchen before you say another word." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Gloria Femmel. I keep the cooks of this town in salt, spice and flour, and the Femmels have fed Lakeshire one way or another for as long as there's been a Lakeshire to feed." } },
      again = {
        { id = "h_again", text = "What else, dear? I've a pot to watch, but it's a patient pot." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "The Femmels? Is Sherman one of yours?", next = "sherman" },
        { text = "How do you feed a town under siege?", next = "feed" },
        { text = "What's worth cooking in Redridge?", next = "cooking" },
        { text = "Any advice for a camp cook?", next = "camp", when = { profession = "Cooking" } },
        { text = "Thank you, Gloria.", next = "END" },
      },
    },
    sherman = {
      lines = { { id = "sh_default", text = "He is, and he has the butcher's block while I have the spice box, which is how it's always been divided in our family. He cuts it and I season it, and neither of us thinks much of the other's half done alone." } },
      choices = { { text = "A fair division. Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "f_default", text = "With fish, mostly, since the lake is the one larder the orcs haven't found. The farms that sent us grain and pork are empty now, so I stretch what flour comes up the road and pray the wagons keep coming." } },
      choices = {
        { text = "And if the wagons stop?", next = "stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stop = {
      lines = { { id = "st_default", text = "Then we'll eat fish and be glad of it, and I've forty ways to cook one so the children don't notice. A town doesn't fall while its people are fed, and I mean to see they're fed if I have to salt the lake myself." } },
      choices = { { text = "Lakeshire's in good hands. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cooking = {
      lines = { { id = "c_default", text = "Goretusk, if you can get the liver whole, makes a pie folk walk from Elwynn for. Condor's tough but it stews, and there's a spider cake Chef Breanna makes that I won't describe to you until after you've tasted it." } },
      choices = { { text = "I'll taste first, then. Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "ca_default", text = "Carry salt, carry a mild spice, and never trust water you haven't boiled, whatever the stream looks like. Half of what goes wrong on the road goes wrong in the pot, and no healer will thank you for learning that the hard way." } },
      choices = { { text = "Salt, spice and boiled water. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Femmel, and Lakeshire born. I've sold cooking supplies in this inn for longer than Brianna's kept it." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it can't be eaten, I've little to say about it." } },
  },
}

-- Guard Ashlock: patrols the Lakeshire bridge, out to the flight master and back. Lindsay Ashlock's husband.
P:NPC {
  key = "guard_ashlock", id = TODO_NPC("Guard Ashlock"), name = "Guard Ashlock", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "steady", "brisk" }, values = { "dutiful", "family" },
  notices = { "soldier", "travel" },
  impression = {
    first = "Guard Ashlock walks the Lakeshire bridge from the town to the gryphon roost and back again, over planks he could cross blindfolded. He spoke briskly and kept moving, and glanced toward the shops whenever he reached the town end.",
    third = "{name} met Guard Ashlock, who patrols the bridge at Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Keep to the middle of the bridge, {class}. The crew's still working on the edges, and the lake is deeper than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Go on across; I know your face by now." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You're crossing late. Stay under the lanterns, and sing out if you see anything on the water." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You look as though you can handle yourself. If the horn sounds while you're on this bridge, I'd take it kindly if you stayed." },
    { id = "n_horde", cat = "travel", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Not one step further. This bridge burned once already, and it won't burn again on my watch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guard Ashlock. I walk the bridge, out to the gryphon master and back, and I'll have to keep walking while we talk, because the Marshal times us." } },
      again = {
        { id = "h_again", text = "Anything else? I'm due at the far end." },
        { id = "h_again2", text = "Quickly, then, {class}." },
      },
      choices = {
        { text = "Why does the bridge need a patrol?", next = "why" },
        { text = "I met a Lindsay Ashlock in town.", next = "lindsay" },
        { text = "What do you watch for out here?", next = "watch" },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the orcs burned it once, and it's the only way to the gryphons and the Elwynn road. If Lakeshire loses this bridge again we're shut in with the lake at our backs, so the Marshal keeps a man on it day and night.", fx = { learn = { "everstill_bridge" } } } },
      choices = {
        { text = "Were you here when it burned?", next = "burned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burned = {
      lines = { { id = "b_default", text = "I was at the town end with a bucket, for all the good a bucket did. I've walked every plank Oslow's crew has laid since, and I'll be glad of the day it's stone under my boots." } },
      choices = { { text = "That day's coming. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lindsay = {
      lines = { { id = "l_default", text = "That's my wife, and I hope you bought something, because she counts the customers. She can see the bridge from her counter, and I know very well she looks up every time I reach the town end." } },
      choices = {
        { text = "She worries about you out here.", next = "worries" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worries = {
      lines = { { id = "wo_default", text = "She does, and she tells half the town before she tells me. I give her a nod each time I turn at the lantern, so she knows I'm still on my feet, and that has to serve until the hills are quiet." } },
      choices = { { text = "Keep nodding, guard. Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "wa_default", text = "Smoke to the north, boats that aren't ours, and murlocs under the pilings, which have grown bolder since the crew started dropping tools. Ariena at the roost sees further than I do, so when her gryphons turn uneasy I walk a little faster." } },
      choices = { { text = "Good eyes at both ends. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire watch, on the bridge post. My wife keeps the supply shop, so we neither of us get far from this lake." } },
    everstill_bridge = { { id = "tp_eb", text = "The orcs burned it and Oslow's crew is building it back. I walk it so nobody burns it twice." } },
    _none = { { id = "tp_none", text = "Couldn't say. I see the bridge and what crosses it, and not a great deal else." } },
  },
}

-- Guard Hiett: Lakeshire watch; kin to Kimberly Hiett the fletcher, and the best shot on the wall.
P:NPC {
  key = "guard_hiett", id = TODO_NPC("Guard Hiett"), name = "Guard Hiett", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "keen", "blunt" }, values = { "dutiful", "skill" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Guard Hiett keeps her post in Lakeshire with a sword at her hip and an archer's habit of measuring distances. She shares a name and a bluntness with the town's fletcher, and has strong views on how many arrows the watch is owed.",
    third = "{name} met Guard Hiett of the Lakeshire watch.",
  },
  greetings = {
    { id = "g_default", text = "Move along or state your business, {class}. I don't mind which, so long as it's one of them." },
    { id = "g_back", when = { metBefore = true }, text = "You're still about, then. Good; the ones who stay are worth more than the ones who pass through." },
  },
  notice = {
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "That's a well-kept bow, and you carry it like you use it. We've a wall that could do with you, if you've an evening." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Another sword's always welcome. Marshal Marris is by the bridge road, if you've come to be useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guard Hiett, Lakeshire watch. I keep this post by day and a place on the wall when the horn goes, and of the two I'd choose the wall." } },
      again = {
        { id = "h_again", text = "Anything else? Make it short." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Hiett? Like the fletcher?", next = "kim" },
        { text = "Why do you prefer the wall?", next = "wall" },
        { text = "How is the watch holding up?", next = "holding" },
        { text = "Where do the gnolls hide from arrows?", next = "shoot", when = { class = "HUNTER" } },
        { text = "As you were, guard.", next = "END" },
      },
    },
    kim = {
      lines = { { id = "k_default", text = "Kimberly's my kin, and she makes the arrows I shoot, which keeps it in the family. She says the watch looses them faster than she can feather them, and I tell her that's rather the purpose of an arrow." } },
      choices = {
        { text = "Does she take that well?", next = "takes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    takes = {
      lines = { { id = "t_default", text = "She throws a fletching jig at me, usually, and then hands me a full quiver. I bring back every shaft I can pull out of a gnoll, and we call that even." } },
      choices = { { text = "A thrifty family. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wall = {
      lines = { { id = "w_default", text = "Because I can do something up there. A sword on a street corner waits for trouble to arrive, but a bow on the wall goes out to meet it at two hundred paces, and I've never been much good at waiting." } },
      choices = { { text = "I know the feeling. Something else.", next = "BACK" } },
    },
    holding = {
      lines = { { id = "ho_default", text = "We're holding, and that's the honest word for it. There are gnolls to the south and west and Blackrock to the north, and Stormwind answers the Magistrate's letters with more letters.", fx = { learn = { "redridge_gnolls" } } } },
      choices = { { text = "Letters won't hold a wall. Something else.", next = "BACK" } },
    },
    shoot = {
      lines = { { id = "s_default", text = "In the gullies, where they think the slope covers them. Get above them before you loose, aim for the ones carrying torches, and the rest lose heart quicker than you'd credit." } },
      choices = { { text = "High ground and torchbearers. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire watch, and a Hiett, so I grew up with a bow in my hand. The sword came with the uniform." } },
    redridge_gnolls = { { id = "tp_gn", text = "They're thick in the hills south and west. I've put arrows in a fair few, and there are always more." } },
    _none = { { id = "tp_none", text = "Not my post, not my business. Try the town hall." } },
  },
}
