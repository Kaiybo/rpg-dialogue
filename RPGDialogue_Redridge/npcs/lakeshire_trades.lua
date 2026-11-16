-- Lakeshire's gryphon master, fletcher and gunsmith. Voice: bibles/lakeshire_trades.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC = P.TODO_NPC

-- Ariena Stormfeather: Lakeshire's gryphon master.
P:NPC {
  key = "ariena", id = TODO_NPC("Ariena Stormfeather"), name = "Ariena Stormfeather", title = "Gryphon Master",
  bible = "bibles/lakeshire_trades.md", role = "flightmaster", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk" }, values = { "duty", "freedom" },
  impression = {
    first = "Ariena Stormfeather keeps Lakeshire's gryphons fed and flying, and from the air she has seen more of the Blackrock smoke than anyone in town.",
    third = "{name} met Ariena Stormfeather, Lakeshire's gryphon master.",
  },
  greetings = {
    { id = "g_default", text = "Need a gryphon? They're fed, rested and only a little bad-tempered today." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Stormwind, Westfall or somewhere farther this time?" },
  },
  start = "hello",
  nodes = {
    xrogue = {
      lines = { { id = "xro_default", text = "Impossible, friend, they hear a boot on gravel from the far end of the roost and scream about it. That's why nobody steals a gryphon in Lakeshire, though a gnoll tried once and went home short a hand." } },
      choices = {
        { text = "Smart birds. I'll pay my fare.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything can be stolen, Ariena.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you see from up there?", next = "a" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you'll miss the best view in Redridge, which is the whole lake at sunset with the orc smoke going up on the far side. Some of us like to see what we're leaving behind, mage." } },
      choices = {
        { text = "A spell is quicker, and I keep a schedule.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the gryphon. The view's worth it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Are the gryphons ever afraid?", next = "b" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ariena Stormfeather. I fly the mail and the wounded out of Lakeshire, and my birds carry anyone else who can pay the fare." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf! Your kin taught mine to fly these beasts, so you'll find no complaints from me about Wildhammer manners." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are getting restless." },
        { id = "h_again2", text = "Go on, ask. I've a minute before the next mail run." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you see from up there?", next = "a" },
        { text = "Are the gryphons ever afraid?", next = "b" },
        { text = "Gryphons must be hard to sneak up on.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I can teleport to Stormwind on my own.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Ariena.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Smoke from the Blackrock camps in the east, mostly, and gnolls swarming the hills like fleas. Every week there's more smoke than the last." } },
      choices = {
        { text = "Does the watch listen to your reports?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Magistrate Solomon writes them down and sends them to Stormwind, and Stormwind sends back nothing at all. I've flown the letters myself, so I know they arrive." } },
      choices = {
        { text = "The magistrate is right to keep asking. The crown will answer.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Lakeshire should stop waiting and fight for itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Only of the black dragonkin, and only when they're flying low over the Burning Steppes border. I don't take them that way any more, whatever the fare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned to handle gryphons in Ironforge and came south when Lakeshire needed someone who could." } },
    _none = { { id = "tp_none", text = "I can tell you the wind and the weather, friend, but not that." } },
  },
}

-- Kimberly Hiett: Lakeshire's fletcher, short on arrows for the watch.
P:NPC {
  key = "hiett", id = TODO_NPC("Kimberly Hiett"), name = "Kimberly Hiett", title = "Fletcher",
  bible = "bibles/lakeshire_trades.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "blunt" }, values = { "craft", "practical" },
  impression = {
    first = "Kimberly Hiett fletches arrows for Lakeshire's watch faster than anyone in Redridge, and still not fast enough for the gnolls.",
    third = "{name} met Kimberly Hiett, Lakeshire's overworked fletcher.",
  },
  greetings = {
    { id = "g_default", text = "Arrows, bows and quivers. Buy quick, before the watch takes the lot." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more arrows? I can't say I'm surprised, the way the hills are." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kimberly Hiett, fletcher. The watch shoots arrows into the gnolls faster than I can feather them, so if you've come to buy, you've come at a busy time." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter! You'll know good fletching when you see it, so I'll not bother telling you mine's the best in Redridge. It is, though." },
      },
      again = {
        { id = "h_again", text = "What else? I've feathers to trim." },
        { id = "h_again2", text = "Ask away, friend; Lakeshire folk learn to talk while they work, and I'm no different." },
      },
      choices = {
        { text = "Show me your arrows.", next = "BUSINESS" },
        { text = "Why can't you keep up?", next = "a" },
        { text = "Who buys the most from you?", next = "b" },
        { text = "Good luck with it.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because the goose feathers come from the farms by the lake, and the murlocs have been at the farms. No geese, no fletching, and no fletching means a lot of very angry guards." } },
      choices = {
        { text = "So what do you do?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "I've started buying feathers off anyone who'll shoot me a bird, and I don't ask too closely where the bird came from. The watch doesn't complain about the colour." } },
      choices = {
        { text = "Ask where they come from. Stolen feathers are still stolen.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The watch needs arrows. Take what you can get.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Deputy Feldon's men, then Corporal Keeshan's lot when they're back from the hills. Keeshan pays on time, which is more than I can say for some." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've fletched in Lakeshire since I was old enough to hold a knife, and my mother did before me." } },
    _none = { { id = "tp_none", text = "Never heard of it. If it doesn't fly, I don't bother with it." } },
  },
}

-- Henry Chapal: Lakeshire's gunsmith, fond of dwarven powder.
P:NPC {
  key = "chapal", id = TODO_NPC("Henry Chapal"), name = "Henry Chapal", title = "Gunsmith",
  bible = "bibles/lakeshire_trades.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "dry" }, values = { "craft", "precision" },
  impression = {
    first = "Henry Chapal sells guns and shot in Lakeshire, measures his powder to the grain, and speaks of dwarven blackpowder the way other men speak of good ale.",
    third = "{name} met Henry Chapal, Lakeshire's precise gunsmith.",
  },
  greetings = {
    { id = "g_default", text = "Guns, shot and powder. Handle them gently; they don't forgive mistakes." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and with all your eyebrows. That's encouraging." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Henry Chapal, gunsmith. I keep the watch in shot and the hunters in rifles, and I've never once blown up the shop, which in my trade counts as a fine record." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf, in my shop! Your people make the finest powder in the world, and I'll argue with any human who says otherwise." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the powder kegs." },
        { id = "h_again2", text = "Go on, then, but quietly, if you would." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Where does your powder come from?", next = "a" },
        { text = "Do the guns help against the gnolls?", next = "b" },
        { text = "Good day, Henry.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Over the mountains from Ironforge, by way of Stormwind, by way of a lot of wagons that never quite arrive on time. Dwarven powder is worth the wait, mind you." } },
      choices = {
        { text = "Could you make your own?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "I could, and I'd likely take half of Lakeshire with me trying. Some things are better left to people who've done them for a thousand years." } },
      choices = {
        { text = "Wise. A craft should be learned properly first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody learns anything without risking a little.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "They help the man who's steady enough to aim, and they frighten the gnolls something awful. The noise does half the work, I'm told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the trade from a dwarf in Stormwind's Dwarven District, and I still owe him for the lessons." } },
    _none = { { id = "tp_none", text = "I'm afraid that's not a thing you can load or fire, so I wouldn't know." } },
  },
}
