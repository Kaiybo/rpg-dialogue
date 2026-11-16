-- More of Sentinel Hill: the two trade-goods sellers, the stable master and the bread merchant.
-- Voice: bibles/sentinel_more.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Christopher Hewen: trade supplies (thread, dye, flux, spice) for a hill at war.
P:NPC {
  key = "hewen", id = TODO_NPC("Christopher Hewen"), name = "Christopher Hewen", title = "Trade Supplies",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "wry" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "Christopher Hewen sells thread, dye and flux to whoever on Sentinel Hill still makes things, and he reckons the hill's health by how much thread it buys. Lately, he says, it's mending more than it's making.",
    third = "{name} met Christopher Hewen, who sells trade goods on Sentinel Hill and keeps an eye on what the militia mends.",
  },
  greetings = {
    { id = "g_goods", text = "Thread, dye, flux and spice. If you make things, I've what you need, and if you mend things, I've more of it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread? The militia bought me out of the coarse stuff again, so it'll have to be the fine." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Do you know how many torn tabards I see in a week? Stay a month and you'd never want for work." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've the forearms of a smith. There's flux in that crate, and an anvil out back the militia beats on when they've a mind to." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Christopher Hewen, trade supplies. I can tell you how Sentinel Hill's doing by what it buys from me, and this month it's all thread and no dye." },
        { id = "h_stonemason", when = { topicKnown = "stonemasons" },
          text = "You've heard about the masons, then. Some of them bought their chalk and line from me once, before the city stopped paying them. I sold to them gladly, and now I wish I hadn't." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "Word is you went under Moonbrook and came back. The militia's been buying dye this week, to paint their shields, and I've not sold dye in a year." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, out in the dust! I've no gears or springs, I'm sorry to say, only thread and flux. You'll have to make do with plain old human trade." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a crate to unpack, if it hasn't been robbed." },
        { id = "h_again2", text = "Go on. I'm counting spools, but I can count and listen." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What does 'all thread and no dye' mean?", next = "thread" },
        { text = "How do your goods get here?", next = "wagons" },
        { text = "I worked these fields before the thieves came.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Not today.", next = "END" },
      },
    },
    thread = {
      lines = { { id = "t_default", text = "Thread's for mending and dye's for making new. A town that's growing buys dye, and a town that's holding on buys thread. We've been holding on for a long while." } },
      choices = {
        { text = "Then let's give them reason to buy dye.", next = "BACK", fx = { affinity = 1, standing = { sentinel_hill = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons = {
      lines = { { id = "w_default", text = "By wagon from Stormwind, the same as Lewis's, and robbed on the same road. I've started packing spools at the bottom under the turnips, since thieves don't steal turnips." } },
      choices = {
        { text = "Who loses more, you or Lewis?", next = "wagons_gina" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons_gina = {
      big = true,
      lines = { { id = "wg_default", text = "Lewis, but he writes it down, so it feels worse. Gina MacGregor and I split what gets through, though some days I'd sooner the Defias had it than argue with her over a crate of salt." } },
      choices = {
        { text = "Share fairly. The hill needs you both.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take the bigger share when she isn't looking.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Did you? Then you'll have bought your twine from a peddler on the old farm road, and so did everyone else. I'd like to sell twine to farmers again, one day, instead of bowstrings to soldiers." } },
      choices = { { text = "One day you will.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell trade goods on a hill full of soldiers. That's about all there is to know about me." } },
    advice = { { id = "tp_ad", text = "Learn to mend your own gear. Out here, nobody's coming to do it for you." } },
    trade = { { id = "tp_trade", text = "Thread, dye, flux, salt and spice: what keeps a crafter working.", next = "thread" } },
    defias = { { id = "tp_defias", text = "They were customers once, some of them. That's the part that sticks in my throat." } },
    stonemasons = { { id = "tp_masons", text = "Good men with chalk on their sleeves. I sold them line for their plumb bobs, and look where the line led." } },
    _none = { { id = "tp_none", text = "If it isn't sold by the spool or the pinch, I couldn't tell you." } },
  },
}

-- Gina MacGregor: the other trade-goods seller; William MacGregor's relative (relation unstated).
P:NPC {
  key = "gina", id = TODO_NPC("Gina MacGregor"), name = "Gina MacGregor", title = "Trade Supplies",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "practical", "family" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Gina MacGregor drives a hard bargain and doesn't apologise for it, since every spool on her table came down a road full of thieves. She seems to think Christopher Hewen undercharges, and she wasn't shy in saying so.",
    third = "{name} met Gina MacGregor, who sells trade goods on Sentinel Hill and drives a hard bargain for them.",
  },
  greetings = {
    { id = "g_goods", text = "Spices, salt, thread and dye. The price is the price, friend, and it came down the Westfall road to get here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Buying, or just hoping I'll have changed my prices?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, are you? Salma Saldean buys her spices from me when she can get up the hill, and she'd tell you to buy the mild ones." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved and twice robbed. Mike Miller's got bread over there; buy that first and come back to me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gina MacGregor. I sell trade goods, and I sell them for what they cost to bring here, which is more than Christopher charges and exactly what they're worth." },
        { id = "h_stew", when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Making Westfall Stew for Salma? Then you'll want a pinch of salt, since murloc eyes taste of nothing and vulture tastes of worse." },
        { id = "h_watchers", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "You smashed Saldean's scarecrows, didn't you? He came up the hill to buy seed for the first time in a year. Seed, mind you, which is a hopeful thing to buy." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf will haggle, I know that much. Go on, then, and we'll see which of us gives way first. It won't be me." },
      },
      again = {
        { id = "h_again", text = "Anything else? Haggling's thirsty work, and I've had no water since dawn." },
        { id = "h_again2", text = "Go on, I'm listening, though not to offers below cost." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why charge more than Christopher?", next = "price" },
        { text = "Are you kin to William, the bowyer?", next = "william" },
        { text = "Surely you could knock a few coppers off.", next = "haggle", when = { any = { { race = "Dwarf" }, { race = "Gnome" }, { class = "ROGUE" } } } },
        { text = "Good day.", next = "END" },
      },
    },
    price = {
      big = true,
      lines = { { id = "p_default", text = "Because one wagon in two gets here, and someone has to pay for the other one. Christopher eats his losses and calls it kindness. I'd rather still be selling next year." } },
      choices = {
        { text = "Hard roads cost coin. Your price is fair.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then I'll buy from Christopher and let him eat the loss.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    william = {
      lines = { { id = "w_default", text = "Everyone asks that, and Will and I let them guess. He makes the bows and I sell the string to make them with, and we've never once argued about the price." } },
      choices = {
        { text = "He says strings are always extra.", next = "william_string", when = { heardLine = "macgregor.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    william_string = {
      lines = { { id = "ws_default", text = "He would say that! The strings are extra because they're mine, and he won't give away a thing that isn't his. That's the most generous thing about him." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
    haggle = {
      lines = { { id = "hg_default", text = "Not one copper, and not for that face, either. Go and ask Christopher; he'll give you a discount and then complain to me about it all evening." } },
      choices = { { text = "Worth a try. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold goods on this hill since the militia came. Before that I sold them to farmers, and they haggled harder." } },
    advice = { { id = "tp_ad", text = "Buy salt. It keeps meat, it keeps wounds clean, and it keeps its price." } },
    trade = { { id = "tp_trade", text = "Spice, salt and thread at an honest price for a dishonest road.", next = "price" } },
    defias = { { id = "tp_defias", text = "They've robbed me more often than they've robbed Lewis, and he gets all the sympathy." } },
    _none = { { id = "tp_none", text = "Not my trade, friend, and not my business. Ask at the inn." } },
  },
}

-- Kirk Maxwell: the stable master. In this era, stable masters keep hunters' beasts.
P:NPC {
  key = "kirk", id = TODO_NPC("Kirk Maxwell"), name = "Kirk Maxwell", title = "Stable Master",
  bible = "bibles/sentinel_more.md", role = "stablemaster", tier = "service",
  communities = { "sentinel_hill" }, temper = { "calm" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "Kirk Maxwell keeps the stables on Sentinel Hill and talks to the animals in a low, even voice, as if they were the only sensible folk in Westfall. He may be right.",
    third = "{name} met Kirk Maxwell, the stable master of Sentinel Hill, who keeps hunters' beasts safe while the hill fights.",
  },
  greetings = {
    { id = "g_stable", text = "Easy, now. Keep your voice low near the stalls; half of them came in skittish." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Bringing someone in, or taking someone out? Either way, they've been well looked after." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s favouring a paw. Thorns, likely, from the scrub by the Dagger Hills; let me look before you go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kirk Maxwell. I keep the stables, which on this hill means hunters' beasts and the odd militia horse that's seen too much." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human hunter. There weren't many of you when I started, but Westfall's making more of them, since a farmer who's lost his farm still knows how to track." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Kaldorei keep their animals closer than we do, I've heard, more like kin than stock. I'll keep yours the way you'd want, then." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Quiet, now. They've all settled, except the boar in the end stall, and he's never settled in his life." },
      },
      again = {
        { id = "h_again", text = "Anything else? Gently, though; they're listening." },
        { id = "h_again2", text = "Go on. I'll keep brushing while you talk." },
      },
      choices = {
        { text = "The stable, please.", next = "BUSINESS" },
        { text = "What beasts do hunters bring you here?", next = "beasts" },
        { text = "A militia horse that's seen too much?", next = "horse" },
        { text = "What would you tame, out here?", next = "tame", when = { class = "HUNTER" } },
        { text = "Just looking in.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Coyotes from the plains, goretusks, the odd vulture somebody swore they could train. The vultures don't settle. Nobody's ever told the hunter they couldn't, so I just keep them fed." } },
      choices = {
        { text = "Can a vulture be trained?", next = "beasts_vulture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_vulture = {
      lines = { { id = "bv_default", text = "Not by anyone I've met. They'll follow you, mind, but only because they're waiting for you to fall over." } },
      choices = { { text = "Comforting. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    horse = {
      big = true,
      lines = { { id = "h2_default", text = "Carried a rider out of Moonbrook the night the thieves took it, and won't go south of the hill since. The militia wants him put to work, and I say he's done his share." } },
      choices = {
        { text = "He's earned his rest. Keep him.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Everyone works on this hill, horses included.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "A goretusk, if you want something that won't quit. They're ugly and bad-tempered, and they'll stand in front of you till they drop, which is more than most soldiers will." } },
      choices = { { text = "I'll find a good one.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the animals while the people fight. Someone has to, and I'm better with animals." } },
    advice = { { id = "tp_ad", text = "Water your beast before yourself. It's carrying more than you are." } },
    moonbrook = { { id = "tp_moonbrook", text = "Ask the grey in the third stall. He won't go near the place, and I don't blame him.", next = "horse" } },
    _none = { { id = "tp_none", text = "Couldn't say. If it's not in a stall, it's not my business." } },
  },
}

-- Mike Miller: the bread merchant.
P:NPC {
  key = "miller", id = TODO_NPC("Mike Miller"), name = "Mike Miller", title = "Bread Merchant",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "rueful" }, values = { "kind", "practical" },
  notices = { "hunger" },
  impression = {
    first = "Mike Miller sells bread on Sentinel Hill, baked from Elwynn flour, in what used to be the breadbasket of the kingdom. The irony isn't lost on him, and he mentions it before you can.",
    third = "{name} met Mike Miller, who sells bread on Sentinel Hill from flour that has to come all the way from Elwynn.",
  },
  greetings = {
    { id = "g_bread", text = "Fresh this morning, or fresh yesterday. On this hill that counts as fresh." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good. I bake for two hundred and sell to twenty, and the gulls get the rest." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You've the look of someone who's been eating dust. Take a roll; you can pay me when you've stopped shaking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mike Miller, bread merchant. Westfall used to feed half the kingdom, and now I bake with flour that comes by wagon from Elwynn. Put that in a song, somebody." },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" },
          text = "You're from round here, aren't you? Then you'll remember when the mills on the Westfall streams still turned. I miss the noise of them more than I'd ever have thought." },
        { id = "h_fields", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "Saldean's got his fields back from the walking scarecrows, they say. If he grows wheat again, I'll buy every sack and bake till my arms fall off." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Do your folk eat bread, where you come from? Try a roll and tell me. If it's terrible, tell me kindly." },
      },
      again = {
        { id = "h_again", text = "Anything else? The next batch won't knead itself." },
        { id = "h_again2", text = "Go on. Have a crust while you think." },
      },
      choices = {
        { text = "Let me buy some bread.", next = "BUSINESS" },
        { text = "Why flour from Elwynn?", next = "flour" },
        { text = "Who eats all this bread?", next = "eaters" },
        { text = "Blessed bread feeds the soul as well. May I bless today's batch?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Not hungry, thanks.", next = "END" },
      },
    },
    flour = {
      lines = { { id = "f_default", text = "Because nobody's grown wheat in Westfall since the farms emptied. The fields are full of thieves and those walking scarecrows, and nobody plants where the scarecrows walk." } },
      choices = {
        { text = "Then someone should clear the fields.", next = "flour_fields" },
        { text = "Something else.", next = "BACK", fx = { learn = { "harvest_watchers" } } },
      },
    },
    flour_fields = {
      lines = { { id = "ff_default", text = "Saldean's been asking for that for a year. Go and see him, if you've the stomach, and tell him Mike sent you, so he'll know at least one man up here's listening." } },
      choices = { { text = "I'll go and see him.", next = "BACK", fx = { affinity = 1, learn = { "harvest_watchers" } } } },
    },
    eaters = {
      big = true,
      lines = { { id = "e_default", text = "The militia, mostly, who don't pay, and Heather's guests, who do. And now and then a farmer who's walked off his land comes asking. I give them the day-old loaves and don't make a fuss." } },
      choices = {
        { text = "That's a decent thing to do.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Charity won't keep your ovens hot.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = { { id = "b_default", text = "I'd not say no. The militia eat it in a hurry, standing up, but I'd like to think it does them some good on the way down." } },
      choices = { { text = "There. May it carry them home.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 }, standing = { sentinel_hill = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a baker. With a name like Miller, folk expect flour on my sleeves, and they're never disappointed." } },
    advice = { { id = "tp_ad", text = "Carry bread, not cake. Cake's lovely until it's crumbs in your pack." } },
    harvest_watchers = { { id = "tp_watchers", text = "Scarecrows that walk, in fields that should be wheat. That's Westfall now in a sentence.", next = "flour" } },
    westfall = { { id = "tp_westfall", text = "The kingdom's breadbasket, people used to say. Now it's a basket, and that's about all." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know flour and fire, and not much else." } },
  },
}
