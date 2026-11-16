-- Eastvale Logging Camp's tradesfolk: Rallic Finn the bowyer, Drake Lindgren's supply house
-- and Terry Palin at the mill. Voice: bibles/eastvale_trades.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rallic Finn: bowyer, beside a house at the camp's east end.
P:NPC {
  key = "rallic", id = TODO_NPC("Rallic Finn"), name = "Rallic Finn", title = "Bowyer",
  bible = "bibles/eastvale_trades.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "quiet" }, values = { "craft", "patient" },
  notices = { "class", "craft" },
  impression = {
    first = "Rallic Finn makes bows at the east end of Eastvale and talks about wood the way some men talk about horses. He kept a stave in his hands the whole time we spoke.",
    third = "{name} met Rallic Finn, the quiet bowyer of Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Bows, arrows and quivers, and all of it made from Elwynn wood. Have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your string's held up, I hope, or you'd be scowling." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. You'll want arrows, I expect, and plenty of them." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Let me see how you hold that bow. Hm, your draw is good, but you're gripping the riser like it owes you money, so loosen the hand and the arrow will thank you." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! If you ever have a good hide to spare, bring it here, because a quiver's only as good as the leather it's sewn from." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rallic Finn, bowyer. The loggers bring me the straight-grained pieces they can't sell to Stormwind, and I turn them into bows and arrows for the camp and anyone passing through." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the kaldorei, at my bench! Your people made bows before mine had learned to sharpen a stick, so I'll take any criticism you care to give and try not to sulk about it." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Most of your kin walk past my bows and ask where the guns are. Drake Lindgren next door sells shot, if that's what you're after." },
        { id = "h_frontier", when = { questDone = TODO_QUEST("Protect the Frontier") }, text = "You're the one who thinned out the wolves and bears around the camp. The loggers have stopped bringing me torn quivers to mend, and I'm glad of the quiet." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only rubbing oil into this stave, so I can listen while I work." },
        { id = "h_again2", text = "Go on, ask. Bowyers are patient folk, or they'd never finish a bow." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "wood" },
        { text = "Who buys bows in a logging camp?", next = "buyers" },
        { text = "Is the camp safe these days?", next = "safe" },
        { text = "I'm a hunter. Any advice?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I worked the timber here once.", next = "woodsman", when = { origin = "human_eastvale_woodsman" } },
        { text = "Good day, Rallic.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Straight grain with no knots, cut in winter when the sap's down, and then a year of drying before I lay a blade to it. Most of Elwynn's trees are too twisted for it, which is why I fight the loggers for every good piece." } },
      choices = {
        { text = "You fight the loggers?", next = "wood_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_fight = {
      lines = { { id = "wf_default", text = "Not with fists. Supervisor Raelen counts every log that goes to Stormwind, and a good stave looks like a good beam to her, so I have to beg the crew to set the best ones aside before she sees them." } },
      choices = {
        { text = "Stormwind's rebuilding should come first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good bowyer matters more than one more beam.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "More folk than you'd think. The loggers want something to keep the wolves off, the guards along the road want arrows, and travellers bound for Redridge stop here on the way east and remember they're going somewhere dangerous." } },
      choices = {
        { text = "What's dangerous about Redridge?", next = "buyers_redridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_redridge = {
      lines = { { id = "br_default", text = "Gnolls in the hills and orcs beyond them, by what the travellers tell me. Lakeshire has its own fletcher, but they say she can't keep up with what the watch shoots, so I sell a fair few quivers to folk heading that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than it was. The wolves and bears were growing bold enough to chase the crews off their own cut wood, and Guard Thomas on the western bridge talks about murlocs at the lake to anyone who'll listen." } },
      choices = {
        { text = "Do you believe him about the murlocs?", next = "safe_murlocs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_murlocs = {
      lines = { { id = "sm_default", text = "I've seen the tracks on the shore myself, and they aren't any animal I know. Two of Thomas's men went up there and didn't come back, so I'd say he's earned the right to be believed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Keep your string dry, carry twice the arrows you think you'll need, and never let your beast stand between you and what you're shooting. I've mended many a bow after a hunter learned that last one the hard way." } },
      choices = {
        { text = "My beast knows its place.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    woodsman = {
      lines = { { id = "ws_default", text = "Did you, now? Then you'll know why I keep my bench at this end of camp, as far from the saws as I can get it, because a man can't hear himself think over that mill." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the trade from an old bowyer in Stormwind's Old Town and came out to Eastvale to be closer to the wood." } },
    advice = { { id = "tp_ad", text = "Unstring your bow at night, friend. A bow left strung too long forgets how to spring back." } },
    eastvale = { { id = "tp_eastvale", text = "It's a fair place, if you can stand the noise and Supervisor Raelen's ledger." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it isn't wood or string, I've likely never thought about it." } },
  },
}

-- Drake Lindgren: general and trade supplies, from a home on the camp's east side.
P:NPC {
  key = "lindgren", id = TODO_NPC("Drake Lindgren"), name = "Drake Lindgren", title = "General & Trade Supplies",
  bible = "bibles/eastvale_trades.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "shrewd" }, values = { "practical", "thrift" },
  notices = { "craft" },
  impression = {
    first = "Drake Lindgren sells everything a logging camp runs short of, from thread to throwing knives, and he knows the price of each to the copper. He seemed to like me better once I bought something.",
    third = "{name} met Drake Lindgren, who keeps Eastvale Logging Camp in general goods and trade supplies.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flour, parchment, shot. If the camp needs it, I sell it." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Prices haven't changed since you left, more's the pity for me." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You're a tailor, I can tell by the needle calluses. I keep thread and dye on the back shelf, and Sara Timberlain buys most of it, so don't dawdle." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Drake Lindgren, general and trade supplies. Everything in this house came up the road from Stormwind on a cart, so if you think the prices are high, blame the road." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! I've nothing clever in stock, I'm afraid, but there's plenty of plain flux and thread if you're building something that won't explode." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Throwing knives are on the left, and I've counted them, so you know. It's nothing personal; I count everything." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a cart to unload before dark." },
        { id = "h_again2", text = "Ask away. Talk costs nothing, which makes it the one thing in here I can't sell." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What do loggers buy most?", next = "loggers" },
        { text = "How do the carts fare on the road?", next = "road" },
        { text = "Who else should I know in Eastvale?", next = "camp" },
        { text = "Farewell, Drake.", next = "END" },
      },
    },
    loggers = {
      lines = { { id = "l_default", text = "Rope, whetstones and bandages, in that order, and bread when the camp cook's in a mood. Sara Timberlain buys thread for her linen, and the guards buy shot and pretend it's for the wolves." } },
      choices = {
        { text = "What else would it be for?", next = "loggers_shot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loggers_shot = {
      lines = { { id = "ls_default", text = "Boredom, mostly. They shoot at bottles on the fence posts when Raelen isn't looking, and then they come back to me for more shot, so I've no complaints." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    road = {
      lines = { { id = "r_default", text = "Better since the marshals started paying adventurers to clear the hills, but a cart still goes missing now and then. Kobolds take the candles, of all things, and the Defias take whatever's left." } },
      choices = {
        { text = "Why don't you hire guards?", next = "road_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_guards = {
      big = true,
      lines = { { id = "rg_default", text = "Because a guard costs more than the cart's worth, and the Stormwind Guard is stretched thin enough already. Marshal Dughan says the crown will put more men on the roads, but I've heard that promise every spring." } },
      choices = {
        { text = "The crown will keep its word. Give it time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the camp should arm its own carts.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Supervisor Raelen runs the camp and its quotas, Rallic Finn next door makes the bows, and the Hunters keep horses at the stables if you've the coin for one. Old Marshal Haggard lives in the manor to the south-east, though he doesn't come in much." } },
      choices = {
        { text = "Why doesn't the marshal come in?", next = "camp_haggard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_haggard = {
      lines = { { id = "ch_default", text = "His eyes are going, and he's proud, so he'd rather sit at home than squint at a crowd. He still sends down for pipe tobacco every week, and I still carry it up myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept a stall in Stormwind's Trade District, and I came out here because a camp full of hungry loggers has no other shop." } },
    advice = { { id = "tp_ad", text = "Buy your bandages before you need them, friend. Nobody haggles well while bleeding." } },
    defias = { { id = "tp_defias", text = "They've robbed two of my carts this year, and both times they left the parchment, which tells you how much reading they do." } },
    _none = { { id = "tp_none", text = "If it isn't on my shelves or in my ledger, friend, I'm afraid I can't help you." } },
  },
}

-- Terry Palin: a lumberjack at the camp's mill.
P:NPC {
  key = "palin", id = TODO_NPC("Terry Palin"), name = "Terry Palin", title = "Lumberjack",
  bible = "bibles/eastvale_trades.md", role = "worker", tier = "service",
  communities = { "eastvale" }, temper = { "jovial" }, values = { "hardworking", "loyal" },
  impression = {
    first = "Terry Palin works the mill at Eastvale and jokes about his supervisor the way men joke about the weather. Under the jokes he seemed proud of the work.",
    third = "{name} met Terry Palin, a cheerful lumberjack at the Eastvale mill.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sawdust, friend; it gets everywhere and never comes out." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come to watch an honest man work, or to keep him from it?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Terry Palin, and before you ask, yes, I've been cutting trees since I could lift an axe. This mill turns Elwynn's oaks into beams for Stormwind, and I turn my back into knots doing it." },
        { id = "h_bundle", when = { questActive = TODO_QUEST("A Bundle of Trouble") }, text = "Out gathering the bundles we left in the woods? Bless you, because I'm not going back for them with the bears out there, and Raelen knows it." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "You've shoulders for this work, friend. If you ever tire of the sword, Raelen pays every week and the bears only bite now and then." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "By the Light, you're bigger than the logs! Don't take it the wrong way, but I'd pay good silver to see you carry a beam." },
      },
      again = {
        { id = "h_again", text = "What else? I'm meant to be stacking, so ask quickly." },
        { id = "h_again2", text = "Go on, I've a minute before Raelen counts the pile again." },
      },
      choices = {
        { text = "What's Supervisor Raelen like?", next = "raelen" },
        { text = "Where does all this wood go?", next = "wood" },
        { text = "Why did the crews leave wood in the forest?", next = "bundles" },
        { text = "I know this work. I was a woodsman here.", next = "woodsman", when = { origin = "human_eastvale_woodsman" } },
        { text = "Back to work with you.", next = "END" },
      },
    },
    raelen = {
      lines = { { id = "r_default", text = "Strict as a sawblade and twice as sharp, but she's never once short-changed us on pay. Stormwind sets her a quota, and she counts every log because they count every log she sends." } },
      choices = {
        { text = "Does she ever ease up?", next = "raelen_ease" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raelen_ease = {
      lines = { { id = "re_default", text = "Once a year, at harvest, she lets us finish an hour early. The rest of the time she says the city's waiting on us, and the trouble is, she's right." } },
      choices = {
        { text = "A firm hand keeps the camp fed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nobody should be worked that hard.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Down the road to Stormwind, mostly, for the rebuilding. Half the city still wants new roofs and walls after the orcs burned it, and every beam in them started out here." } },
      choices = {
        { text = "Do the masons pay you for it?", next = "wood_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_masons = {
      big = true,
      lines = { { id = "wm_default", fx = { learn = { "stonemasons" } }, text = "The crown pays Raelen, and Raelen pays us. The stonemasons weren't so lucky, from what I hear; they built half the city and the nobles wouldn't pay them for it, and some of them went off to Westfall angry." } },
      choices = {
        { text = "The nobles cheated honest workers. That's a crime.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Angry or not, turning outlaw was their choice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bundles = {
      lines = { { id = "bu_default", text = "Because the wolves and bears got bold and came right up to the cutting, and a man drops his bundle quick when there's a bear behind it. Raelen asked Deputy Rainer for help, but Westbrook has its own troubles." } },
      choices = {
        { text = "Were any of the crew hurt?", next = "bundles_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bundles_hurt = {
      lines = { { id = "bh_default", text = "Scratches and one broken arm, and one of the younger lads won't go past the treeline without a torch now, even at noon. I don't laugh at him, since I ran just as fast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    woodsman = {
      lines = { { id = "ws_default", text = "Then you'll remember the old foreman's rule, that you never fell a tree you haven't walked around twice. Raelen hasn't changed it, though she's changed nearly everything else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Eastvale born, Eastvale raised, and I expect I'll be Eastvale buried, under a very good oak." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree, and never stand near Raelen when the count comes up short." } },
    eastvale = { { id = "tp_eastvale", text = "It's loud, it's honest work, and the supper's hot. A man could do worse." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me about trees and I'll talk all day." } },
  },
}
