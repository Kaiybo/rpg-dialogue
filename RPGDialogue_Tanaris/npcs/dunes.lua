-- Tanaris beyond the gates: Steamwheedle Port, the wandering turtle Tooga, and the Gadgetzan folk earlier passes skipped.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ironboot", id = TODO_NPC("Prospector Ironboot"), name = "Prospector Ironboot",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Prospector Ironboot is a dwarf at Steamwheedle Port who came to Tanaris for its buried treasures and stayed for the sand in his beard.",
    third = "{name} met Prospector Ironboot at Steamwheedle Port in Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend! Shake the sand off yer boots before ye come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The desert didn't swallow ye, then. Good." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Prospector Ironboot, digger, surveyor and dwarf of Ironforge, out here in the worst sandbox ever made. Tanaris has more buried under the dunes than anyone knows, and I mean to find a bit of it." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow dwarf! Then ye'll know why I'm here: Explorers' League blood doesn't let a dwarf sit still while there's ruins to dig." },
      },
      again = { { id = "h_again", text = "Anything more, friend?" }, { id = "h_again2", text = "Go on, ask; the sand'll wait." } },
      choices = {
        { text = "What's buried out here?", next = "b1_1" },
        { text = "Why Steamwheedle Port?", next = "b2_1" },
        { text = "Is it dangerous?", next = "b3_1" },
        { text = "Ironforge must miss its diggers.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Should the old ruins be left alone?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Old troll cities, for a start, the Sandfury's ancestors and Zul'Farrak's lot, and older things beneath them still. Some of the ruins out east are so old the trolls themselves don't know who built them." } },
      choices = { { text = "Older than the trolls?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The problem is the Wastewanderers, the Sandfury and the heat, and not always in that order. A dwarf can dig for a week and still find nothing but sand." } },
      choices = { { text = "What keeps you going?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "But when ye do find something, friend, there's no feeling like it in all the world. That's what keeps me out here." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the goblins sell everything a digger needs and don't ask questions about where ye're going. Cost me a fortune, mind, but nothing's free in Tanaris." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Everything here is dangerous, from the sand to the scorpids to the goblins' prices. Bring water, bring more water, and then bring more water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge's ale, but a dwarf goes where the dirt's interesting. Tell Magni I said hello, if ye ever see him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say it's grave robbing, digging up the old troll cities. I say knowledge buried is knowledge wasted." } },
      choices = { { text = "Learn from the past. Dig carefully.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Let the dead keep their cities.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Can't say I've dug that up yet, friend." } } },
}

P:NPC {
  key = "tooga", id = TODO_NPC("Tooga"), name = "Tooga",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Tooga is an old turtle wandering the Tanaris sands, lost and very far from the friend who's waiting for him in Feralas.",
    third = "{name} met Tooga, a wandering turtle in the deserts of Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Tooga sees you! Tooga is lost, and very hot, and very slow." },
    { id = "g_back", when = { metBefore = true }, text = "Tooga remembers you. You are kind to Tooga." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Tooga is Tooga, and Tooga is very far from home. Torta is waiting for Tooga in Feralas, but the desert is big and Tooga's legs are small." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Tooga's Quest") }, text = "You will take Tooga to Torta? Tooga is slow, so please be patient, and please do not let the scorpids eat Tooga." },
      },
      again = { { id = "h_again", text = "What else? Tooga listens slowly." }, { id = "h_again2", text = "Tooga is here." } },
      choices = {
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who is Torta?", next = "b2_1" },
        { text = "Are you all right?", next = "b3_1" },
        { text = "I understand beasts. Let me guide you.", next = "x_1", when = { class = { "DRUID", "HUNTER" } } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Tooga went for a walk, and Tooga kept walking, and now Tooga is in the desert. Turtles are not good at deserts." } },
      choices = { { text = "Torta worries?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Tooga thinks Torta must be worried, because Torta always worries. Torta is Tooga's best friend." } },
      choices = { { text = "Probably?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If Tooga can get home, Tooga will never walk so far again, probably." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Torta is a turtle too, and Torta is very wise and very old. Torta lives near the water in Feralas, and Tooga misses the water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Tooga is hot and tired and thirsty, but Tooga is still Tooga. Turtles are tough on the outside." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "You speak to Tooga like a friend. Tooga likes that, and Tooga will follow you anywhere slow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Torta always tells Tooga to stay close, but Tooga likes to wander. Tooga does not know if that is good or bad." } },
      choices = { { text = "Wandering is how you see the world.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Stay close to home next time, Tooga.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Tooga does not know, because Tooga is a turtle." } } },
}

P:NPC {
  key = "curgle", id = TODO_NPC("Curgle Cranklehop"), name = "Curgle Cranklehop",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Curgle Cranklehop is a gnome in Gadgetzan with a scholar's curiosity and a habit of finishing other people's sentences.",
    third = "{name} met Curgle Cranklehop, a gnome in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Oh! A visitor, how wonderful. Do you have a moment for some science?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've been thinking about what we discussed." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The scorpids, without question! They go weeks without water and never complain, which is more than I can say for anyone in Gadgetzan, and if I could build a machine half as clever, I'd retire tomorrow." } },
      choices = {
        { text = "Some marvels should be admired, not copied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Copy it, then. The scorpids won't miss the idea.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Curgle Cranklehop, at your service! I study the creatures of Tanaris, from the scorpids to the basilisks, because the desert hides more marvels than anyone in Gadgetzan gives it credit for." },
        { id = "h_c0", when = { race = "Gnome" }, text = "A fellow gnome! Oh, splendid, someone who'll understand when I talk about mechanical reproduction of insect behavior." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Oh, wonderful, you can settle an argument I've been having with myself: do basilisks really turn things to stone, or do they just stare very hard?" },
      },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "More questions? Wonderful!" } },
      choices = {
        { text = "What creature in Tanaris fascinates you most, Curgle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do you study?", next = "b1_1" },
        { text = "Why live in Gadgetzan?", next = "b2_1" },
        { text = "What do the goblins think of you?", next = "b3_1" },
        { text = "My pet might interest you.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Is studying beasts better than hunting them?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The way desert creatures survive with so little water, mostly. The scorpids, the hyenas and the basilisks have all adapted in ways I can only dream of reproducing." } },
      choices = { { text = "Reproducing them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been keeping notes for months, and I've filled four journals. The goblins think I'm mad, but they also think anything not for sale is mad." } },
      choices = { { text = "I'll keep an eye out.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see any unusual creatures out there, tell me about them. Science needs eyes, and I only have two." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "It's the only town in Tanaris with walls, water and a decent workbench. The bruisers keep the peace and the goblins keep the shops open, and I can't ask for more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "They think I'm a customer who never buys anything, which is fair. I spend all my money on notebooks." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, it might ever, and I'd love to take notes while it does, though I promise I won't poke it, at least not without asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say knowledge is wasted on beasts we'll only kill. I say we kill them because we don't understand them." } },
      choices = { { text = "Understanding beats killing every time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Beasts are for hunting. Study books instead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'd love to find out!" } } },
}

P:NPC {
  key = "jabbey", id = TODO_NPC("Jabbey"), name = "Jabbey",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Jabbey sells odds and ends from a stall in Gadgetzan, and every one of them, he swears, is a bargain.",
    third = "{name} met Jabbey, a vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Step right up, step right up! Jabbey's got what you need, even if you don't know you need it." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer! What can Jabbey sell you today?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Jabbey, and I sell a little of everything: reagents, odds, ends and the occasional thing I can't explain. Gadgetzan's the crossroads of Tanaris, and everything passes through my stall sooner or later." },
      },
      again = { { id = "h_again", text = "What else? Jabbey's always open." }, { id = "h_again2", text = "More? Jabbey loves questions that end in sales." } },
      choices = {
        { text = "What sells best here?", next = "b1_1" },
        { text = "Where do you get your goods?", next = "b2_1" },
        { text = "Do you ever overcharge?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Water, friend, by a long way, then cooling potions and anything that keeps the scorpids off you. After that, it's whatever the adventurers are hunting this week." } },
      choices = { { text = "Turtle shells?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Last month it was snake bits, this month it's turtle shells. Next month, who knows, but Jabbey'll have it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Here and there, from traders and travelers and the port. Jabbey doesn't ask, and Jabbey doesn't tell, which is how business works in Gadgetzan." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Jabbey charges what the market bears, friend. If you call that overcharging, take it up with the market." } },
      choices = { { text = "Fair prices build loyal customers.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "A goblin should get what he can.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Jabbey doesn't sell that, but Jabbey might know a guy." } } },
}

P:NPC {
  key = "vizzklick", id = TODO_NPC("Vizzklick"), name = "Vizzklick",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Vizzklick sells cloth and tailoring supplies in Gadgetzan, and she thinks most adventurers dress, as though they lost a fight with a sandstorm.",
    third = "{name} met Vizzklick, the cloth vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, welcome! Oh dear, look at the state of your robes." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And still in those clothes, I see." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Vizzklick, cloth and thread and the finest tailoring supplies in Tanaris! Desert living is hard on clothes, and I keep half of Gadgetzan dressed, whether they like it or not." },
      },
      again = { { id = "h_again", text = "What else, dearie?" }, { id = "h_again2", text = "Anything more? I've got a needle waiting." } },
      choices = {
        { text = "What's good cloth for the desert?", next = "b1_1" },
        { text = "Do you sew yourself?", next = "b2_1" },
        { text = "Do clothes really matter out here?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Light, tight and pale, dearie, unless you enjoy roasting in your own boots. The sand gets into everything, so a good weave keeps it out." } },
      choices = { { text = "And mageweave?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Silk's lovely, but it tears on the rocks, so most folks out here settle for mageweave and pray." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Of course! Selling cloth without knowing how to sew is like selling water without knowing how to drink." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a fighter shouldn't care about looks. I say a well-dressed fighter frightens enemies twice as much." } },
      choices = { { text = "Looking sharp is half the battle.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "A blade matters more than a hem.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my line of work, dearie, but I'll keep an ear open." } } },
}
