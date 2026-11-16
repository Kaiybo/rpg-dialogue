-- Light's Hope Chapel's working folk (0.39.0): the two flight masters, the innkeeper and the trade goods seller.
-- Voice: bibles/easternplaguelands.md ("Light's Hope working folk")
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "khaelyn", id = TODO_NPC("Khaelyn Steelwing"), name = "Khaelyn Steelwing", title = "Gryphon Master",
  bible = "bibles/easternplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "light_hope" }, temper = { "blunt" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Khaelyn Steelwing keeps the Alliance gryphons at Light's Hope Chapel and flies them over the worst land in Lordaeron. She shares the yard with a Forsaken bat handler and has made a hard, practical peace with it.",
    third = "{name} met Khaelyn Steelwing, the dwarf gryphon master at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird out of this blighted country? I don't blame you, and the gryphons don't either." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My birds won't take you, friend, but Georgia's bats will. She's just over there, and she doesn't bite, though her bats might." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Good, I'd begun to think the whole of Ironforge had forgotten there's a north. Sit a moment before you fly, and tell me the forge is still burning." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Badly, and they let me know it with every flight. I wash their feathers every evening and they still come back smelling of the Plaguewood, poor things." } },
      choices = {
        { text = "They deserve better. Spare them the worst routes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're war beasts. They fly where they're sent.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid! If you're flying out over the plaguelands, mind you don't take a deep breath, because the birds won't, and they're smarter than most soldiers." },
        { id = "h_default", key = true,
          text = "Khaelyn Steelwing, gryphon master for the Alliance at Light's Hope. The air over these plaguelands is foul and the birds hate every mile of it, but they'll get you to Chillwind or anywhere else you need to be." },
      },
      again = {
        { id = "h_again", text = "Anything more? The gryphons fidget every time the wind blows in from the Plaguewood." },
        { id = "h_again2", text = "Ask, then, but don't keep a gryphon waiting in this air." },
      },
      choices = {
        { text = "How do the gryphons bear the foul air?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly from here?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do the gryphons manage the plague?", next = "air" },
        { text = "A Forsaken bat handler right beside you?", next = "georgia" },
        { text = "Goodbye.", next = "END" },
      },
    },
    air = {
      lines = { { id = "a_default", text = "They fly high and fast and don't land anywhere but here or Chillwind. I wash their feathers after every trip, and I watch their eyes for any cloudiness, because a sick gryphon is a gryphon I'd have to put down." } },
      choices = {
        { text = "Has it happened before?", next = "air_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    air_sick = {
      lines = { { id = "as_default", text = "Not to any of mine, and I mean to keep it that way. The Argent Dawn's priests bless the roost when they've a moment, and I won't say no to any help that's offered." } },
      choices = {
        { text = "The Light watches over them, then.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hard work keeps them well, not blessings.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    georgia = {
      lines = { { id = "ge_default", text = "Aye, and I'll tell you what I told myself the first day: inside these walls, the only enemy is the Scourge. She keeps her bats well and she keeps to her side of the yard, and that's more than I can say for some Alliance folk I've known." },
        { id = "g_scourge", when = { race = "Scourge" }, text = "You'd know her kind better than I do, but she's been a fair neighbour. Inside these walls, the only enemy is the Scourge, and she hates them as much as I do, maybe more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I went where the Alliance needed a gryphon master and nobody else wanted to go, and that's the end of the tale." } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in this country, however clear it looks." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask somebody who spends less time with birds." } },
  },
}

P:NPC {
  key = "georgia", id = TODO_NPC("Georgia"), name = "Georgia", title = "Bat Handler",
  bible = "bibles/easternplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "light_hope" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Georgia handles the Forsaken bats at Light's Hope and speaks with a dry, chilly patience that hardly ever warms. She says the bats are the only things in this country that the plague can't touch.",
    third = "{name} met Georgia, the Forsaken bat handler at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "The bats are fed and ready, if you're Horde. If you're not, the dwarf is over there." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "My bats won't carry you, living one, but Khaelyn's gryphons will. I'll still answer a question, if you've one worth asking." },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of our own, this far east, and still walking free. Good, because the Scourge would love to have you back, and I'd rather they didn't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Georgia, bat handler for the Horde. My bats fly to the Undercity and wherever else the Dark Lady's people keep a roost, and they don't care how foul the air is." },
      },
      again = {
        { id = "h_again", text = "What else? The bats don't like the daylight, and neither do I." },
        { id = "h_again2", text = "Go on. I've nowhere to be, which is one of death's few comforts." },
      },
      choices = {
        { text = "Where can I fly from here?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why bats, of all creatures?", next = "bats" },
        { text = "How do you get along with the gryphon master?", next = "khaelyn" },
        { text = "Does living among the Argent Dawn bother you?", next = "dawn", when = { race = "Scourge" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    bats = {
      lines = { { id = "b_default", text = "Because the plague doesn't take them, and they don't mind the dark or the stench. A wyvern would sicken over these lands, but my bats fly through it as if it were fresh spring air." } },
      choices = {
        { text = "Are they hard to handle?", next = "bats_handle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_handle = {
      lines = { { id = "bh_default", text = "Not if you're patient and never shout. They know my voice, and they know I've no warm blood to tempt them, so we understand each other perfectly." },
        { id = "bh_living", when = { race = { "Human", "Dwarf", "Gnome", "NightElf", "Orc", "Troll", "Tauren", "Skyborne" } }, text = "Not for me, since I've no warm blood to tempt them. For you, I'd suggest keeping your hands in your pockets when you walk past the roost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    khaelyn = {
      lines = { { id = "k_default", text = "She doesn't like me, and she doesn't pretend to, but she doesn't spit either. We've an agreement that the Scourge outside the walls matters more than anything between us, and so far we've both kept it." } },
      choices = {
        { text = "That's a sensible agreement.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It won't last past the next war.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "d_default", text = "They watch me, and I don't blame them, since half of them buried someone who now looks like us. But they let me work, and Lord Tyrosus has said plainly that any enemy of the Scourge has a place here, so I'll take that place." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was someone in Lordaeron once, and now I keep bats. The bats don't ask about the first part, and I'd rather you didn't either." } },
    advice = { { id = "tp_ad", text = "Fly over this land when you can, because walking it only gives the Scourge more chances at you." } },
    _none = { { id = "tp_none", text = "I've nothing to say about that, living or dead." } },
  },
}

P:NPC {
  key = "jessica_chambers", id = TODO_NPC("Jessica Chambers"), name = "Jessica Chambers", title = "Innkeeper",
  bible = "bibles/easternplaguelands.md", role = "innkeeper", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "warm" }, values = { "kind", "dutiful" },
  notices = { "weary" },

  impression = {
    first = "Jessica Chambers keeps the beds and the soup at Light's Hope Chapel, in the only safe room for miles. She speaks gently and plainly, and she has clearly fed a great many people who came in shaking.",
    third = "{name} met Jessica Chambers, who keeps the inn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Come in and sit down, you look half frozen. The soup's hot, and nothing dead gets past these walls." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I always worry, you know, when people walk out that gate." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Light, look at you, your gear's in pieces. Sit, eat, and let someone who knows a hammer see to the rest before you go out again." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Every day, though I try not to say it in front of the soldiers. I keep a pot of herbs on the sill out of stubbornness, and it's the only green thing at Light's Hope that hasn't died on me yet." } },
      choices = {
        { text = "Keep that pot growing. Small hopes matter here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hope won't stop the Scourge. Steel will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, at my inn! You'll want a window that faces the hills, I expect, though I'll warn you the view hasn't been green in a long while." },
        { id = "h_default", key = true,
          text = "Jessica Chambers, and this is the inn at Light's Hope, such as it is. I keep the beds clean and the pot full for the Argent Dawn and anyone else who comes in from the plaguelands, and I don't ask anyone's colours." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late to be on the road out here, friend, and later still to be alone. There's a bed if you want it, and the guards walk the walls all night." },
      },
      again = {
        { id = "h_again", text = "Anything else I can get you? There's more bread." },
        { id = "h_again2", text = "Stay as long as you like; there's nowhere warmer for miles." },
      },
      choices = {
        { text = "Do you ever miss green hills, Jessica?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "How is this place still safe?", next = "safe" },
        { text = "Who comes through here?", next = "guests" },
        { text = "Where do you find food in this country?", next = "food" },
        { text = "Goodbye.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "The Dawn guards it day and night, and the chapel is holy ground besides. The Scourge prowls all around us, but it doesn't come close, and I've stopped asking why and started being grateful." } },
      choices = {
        { text = "The Light protects this place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good walls and sharp swords protect it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Dawn soldiers coming off patrol, mostly, and adventurers on their way to Stratholme or back from it. Some of them are Horde and some of them are dead, and I've learned to pour the soup the same for all of them." } },
      choices = {
        { text = "What do they say about Stratholme?", next = "guests_strat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_strat = {
      lines = { { id = "gs_default", text = "Not much, at first. They sit in that corner and stare at the fire, and after a bowl or two they tell me the city's still burning inside, and the dead still walk the streets as if they lived there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    food = {
      lines = { { id = "f_default", text = "Nothing grows clean here, so it all comes in by wagon or by gryphon from Chillwind and further. I won't cook anything that walked or grew in these lands, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came to cook for the Dawn because somebody had to. That's all anyone needs to know about me, really." } },
    advice = { { id = "tp_ad", text = "Eat before you go out, and sleep when you can. The Scourge never gets tired, so you'll have to be cleverer than it is." } },
    argent_dawn = { { id = "tp_dawn", text = "They're good people, every one of them, and they eat like they haven't seen food in a week, which some of them haven't." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. Ask one of the Dawn's officers." } },
  },
}

P:NPC {
  key = "jase_farlane", id = TODO_NPC("Jase Farlane"), name = "Jase Farlane", title = "Trade Supplies",
  bible = "bibles/easternplaguelands.md", role = "vendor", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "brisk" }, values = { "careful", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "Jase Farlane sells trade supplies at Light's Hope Chapel and knows exactly how far every spool of thread had to travel to get there. He's brisk and practical, and he takes the Dawn's cause seriously.",
    third = "{name} met Jase Farlane, who sells trade supplies at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_default", text = "Thread, flux, vials and cloth, all hauled in from Chillwind past the Scourge. Take what you need, and don't waste it." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking", "Engineering", "Enchanting" } },
      text = "You've a crafter's hands, I can tell from the way you look at my shelves. Good, because the Dawn needs folk who can make things as much as folk who can break them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jase Farlane, trade supplies for Light's Hope. Everything a crafter needs to mend a soldier's kit or brew a potion, and every bit of it came a long and dangerous way, so the prices aren't Stormwind's." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's a wagon to unload." },
        { id = "h_again2", text = "Go on and ask, though I'll be tallying spools of thread the whole time." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "How do the supplies get here?", next = "wagons" },
        { text = "What does the Dawn need most?", next = "needs" },
        { text = "Goodbye.", next = "END" },
      },
    },
    wagons = {
      lines = { { id = "w_default", text = "Overland from Chillwind Camp, past Corin's Crossing and the burned farms, with Dawn guards riding beside every wagon. We lose one now and then, and when we do, the price of thread goes up and nobody complains." } },
      choices = {
        { text = "Who attacks them?", next = "wagons_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons_who = {
      lines = { { id = "ww_default", text = "The Scourge, mostly, though the Scarlet Crusade have stopped a wagon or two and called it confiscation. I'm not sure which is worse, the ones who kill you or the ones who pray over you first." } },
      choices = {
        { text = "The Scarlets are no better than the Scourge.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "The Scarlets mean well, even if they're wrong.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "n_default", text = "Runecloth for bandages, more than anything, because every patrol comes back bleeding. After that, anyone who can brew a decent potion or mend a breastplate is worth their weight in gold to the Dawn." },
        { id = "n_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "Bandages, mostly, because there are never enough healers to go round, and you'd know that better than I would. Runecloth, brought to the Dawn, does as much good as a prayer some days." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the supplies straight so the soldiers don't have to think about them, and that suits me fine." } },
    advice = { { id = "tp_ad", text = "Buy your vials here rather than carrying glass across the plaguelands, because I've seen too many packs full of broken ones." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They've taken our wagons twice and told us the Light wanted them to. I don't believe the Light wanted my thread." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I keep the shelves, and that's all." } },
  },
}
