-- Out in the glades: Marshal Ryan in the Twilight's Shroud, a goblin gas-prospector, and Gadgetzan's fight promoter.
-- Voice: bibles/riverglades.md ("Horde side (1.10.0)", "Out in the glades")
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rg_ryan", id = TODO_NPC("Marshal Ryan"), name = "Marshal Ryan",
  bible = "bibles/riverglades.md", role = "soldier", tier = "quest",
  communities = { "farholde", "brotherhood_horse" }, temper = { "grim", "proud" }, values = { "loyal", "stern" },
  notices = { "class", "race" },

  impression = {
    first = "I found Marshal Ryan in the Twilight's Shroud, too far gone to save. He spent the breath he had left on his duty and on a woman named Abigail, and I don't think he knew which mattered more until the end.",
    third = "{name} found Marshal Ryan, the Brotherhood's best scout, dying inside the Twilight's Shroud.",
  },

  greetings = {
    { id = "g_default", text = "Who's there? Speak up; my eyes aren't what they were an hour ago." },
  },

  notice = {
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde. Of all the faces to see at the end, it had to be one of yours, so finish it or leave me be." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "Don't waste your Light on me, there's not enough left of me to hold it. Save it for the scouts in the cages." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Who sent you? Never mind, it doesn't matter now, because it's too late for me, stranger, and I won't be walking out of this one, and Abigail will never know why." },
        { id = "h_saving", when = { questActive = TODO_QUEST("Saving Marshal Ryan") },
          text = "You came from Farholde, with my log in your hand. Then Demar read it, and I'm glad, though it's too late for me, stranger, and I won't be walking out of this one." },
        { id = "h_dying", when = { questActive = TODO_QUEST("Dying Wish") },
          text = "Take the crest to the Knight Commander. Tell him what I saw in here, and tell him I'm sorry I didn't come back to report it myself." },
        { id = "h_human", when = { race = "Human" },
          text = "A human face, thank the Light. Are you from Stormwind? No, don't tell me; it'll only make me think of her." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf. Thaddeus Brillyard at the keep will take to you, though he never takes to anyone at first, so give him time." },
      },
      again = {
        { id = "h_again", text = "Ask, while I can still answer." },
        { id = "h_again2", text = "Go on. There's time enough for that, at least." },
      },
      choices = {
        { text = "What happened to you?", next = "what" },
        { text = "Who is Abigail?", next = "abigail" },
        { text = "Why fight so long, Marshal?", next = "why" },
        { text = "Let me pray with you.", next = "xpray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll carry your crest to Demar.", next = "END", when = { questActive = TODO_QUEST("Dying Wish") } },
        { text = "Rest now, Marshal.", next = "END" },
      },
    },
    what = {
      lines = {
        { id = "wh_default", text = "I followed their supply trains here, to this fortress in the west, and I wrote down every wagon in that log. Then I got too close, as I always said I wouldn't, and they caught me." },
      },
      choices = {
        { text = "What did you see inside?", next = "what_saw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_saw = {
      lines = {
        { id = "ws_default", text = "More of them than Demar thinks, and better armed than they've any right to be. Our runners never reach the keep, because they're caught on the road, so warn him; he has to know." },
      },
      choices = {
        { text = "Your scouts are in cages here?", next = "what_cages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_cages = {
      lines = {
        { id = "wc_default", text = "Some of them, and Riftan's lads besides, if they're still breathing. The keys are on the brutes who guard them, so don't leave them here the way I've been left." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    abigail = {
      lines = {
        { id = "ab_default", text = "My betrothed, once. She wanted me to come to Stormwind and live with her family, and I told her I'd come when this land was clean of orcs, and we haven't spoken since." },
      },
      choices = {
        { text = "Do you regret it?", next = "abigail_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abigail_regret = {
      big = true,
      lines = {
        { id = "ar_default", text = "I should have gone home with her. I kept thinking there'd be time after the next patrol, and the one after that, and now there isn't any." },
      },
      choices = {
        { text = "You stayed to protect others. That counts for something.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No war is worth losing the people you love.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "wy_default", text = "Because the orcs came through in the First War and killed my family, and I swore I'd see every one of them out of these glades. It started as duty, I think, and somewhere along the road it turned into something that ate me." },
        { id = "wy_horde", when = { faction = "Horde" },
          text = "Your kind came through in the First War and killed my family, and I swore I'd see every one of you out of these glades. Don't expect me to make peace with you now, at the end." },
      },
      choices = {
        { text = "Hatred kept you fighting. It also cost you everything.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They earned your hatred. Don't apologize for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpray = {
      lines = {
        { id = "xp_default", text = "If you must, then pray for Abigail, not for me. I made my choices, and she had to live with them." },
      },
      choices = {
        { text = "For both of you, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    brotherhood_horse = { { id = "tp_bh", text = "Best riders in the east, and the most stubborn. Tell them I kept the oath, right to the end." } },
    twilights_hammer = { { id = "tp_th", text = "There are more of them than anyone at Farholde wants to believe. It's all in the log, every wagon of it." } },
    _none = { { id = "tp_none", text = "I don't know, and I won't be finding out now. Ask Demar." } },
  },
}

P:NPC {
  key = "rg_sleebo", id = TODO_NPC("Sleebo Fizzlespout"), name = "Sleebo Fizzlespout",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  temper = { "eager", "shrewd" }, values = { "witty" },
  notices = { "race", "profession" },

  impression = {
    first = "Sleebo Fizzlespout believes marsh gas is the fuel of the future and that he is the goblin to sell it. He won't tell anyone how his engine works, which I suspect is because it doesn't yet.",
    third = "{name} met Sleebo Fizzlespout, a goblin inventor collecting marsh gas from the Riverglades' ponds for a secret engine.",
  },

  greetings = {
    { id = "g_default", text = "Hey, chum! You look like somebody who appreciates the future, and the future's takin' investors right now." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite investor's back! Well, my favourite helper, chum, since you haven't actually invested yet, but the door's open." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Don't look at my engine, and don't take notes, because I know how you people are with notes, and I know how much notes sell for." },
    { id = "n_engineer", cat = "profession", when = { profession = { name = "Engineering", min = 1 } },
      text = "You've got grease under your nails, chum, so you're an engineer, and that means you'll understand why I'm not tellin' you anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sleebo Fizzlespout, inventor, visionary and future fuel baron! The fuel of the future isn't coal and it isn't oil, chum, it's gas, and these glades are practically burping it for free." },
        { id = "h_gas", when = { questActive = TODO_QUEST("Gaseous Gold") },
          text = "Those marshy ponds to the southwest, chum, where it bubbles up by the water. Bottle it and bring it back, and don't light anything on the way, because I can't sell a crater." },
        { id = "h_gas_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Gaseous Gold"), days = 3 } },
          text = "That gas is perfect, chum, and the engine already sounds less like it wants to explode, which is a big step up from last week. Now, about one more little favour..." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Your people ride wolves, right? Imagine a wolf that never gets tired and runs on swamp burps, chum, and imagine what I could charge for it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and you people love a good boiler! Mine's better, though, and quieter, mostly, and it's only blown the lid off twice." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage? Keep your fireballs to yourself around here, chum, because the ponds aren't the only thing full of gas, and I'm not insured." },
      },
      again = {
        { id = "h_again", text = "What else, chum? Time's money, and the future's expensive." },
        { id = "h_again2", text = "Ask away, chum, but nothin' about the engine." },
      },
      choices = {
        { text = "What does this engine actually do?", next = "engine" },
        { text = "Why marsh gas?", next = "gas" },
        { text = "Does Melbin Powderfuse know you're out here?", next = "melbin" },
        { text = "I'm an engineer too. Show me.", next = "xengineer", when = { profession = { name = "Engineering", min = 1 } } },
        { text = "Good luck with the future.", next = "END" },
      },
    },
    engine = {
      lines = {
        { id = "en_default", text = "It goes, chum, and that's all you need to know. I'm keeping you on a need-to-know basis, because trade secrets are the only thing in this business nobody can steal twice." },
      },
      choices = {
        { text = "Does it work yet?", next = "engine_works" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engine_works = {
      big = true,
      lines = {
        { id = "ew_default", text = "Define 'work.' It runs, it shakes, and it only caught fire once, chum, which in my line of business means it's practically ready to sell." },
      },
      choices = {
        { text = "Then don't sell it until it's safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell it now. Let the buyers find the flaws.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gas = {
      lines = {
        { id = "ga_default", text = "Because it's free, chum! Nobody owns a swamp's burps, not even Melbin, and the ponds out here put out tons of the stuff from vents by the water, which is pure profit if you can catch it." },
      },
      choices = {
        { text = "Is it dangerous to collect?", next = "gas_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gas_danger = {
      lines = {
        { id = "gd_default", text = "Only if you breathe it, or light it, or stand near anybody who does, chum. It's a real pain to bottle, which is why I need nice helpful people like you, who work for very reasonable rates." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    melbin = {
      big = true,
      lines = {
        { id = "me_default", text = "Melbin thinks he owns everything from the port to the horizon, and he'd want a cut of the air if he could bottle it, chum. So no, he doesn't know, and if you tell him, I'll deny I ever met you." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "If he asks, I won't lie to him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xengineer = {
      lines = {
        { id = "xe_default", text = "Nice try, chum. I'll tell you this much: it's got a valve, and the valve is very important, and that's all an honest competitor gets for free." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born with nothin' but ideas, and I've still got most of the ideas, chum. The money's comin', any day now, and when it does, I'll remember who bottled the gas." } },
    advice = { { id = "tp_ad", text = "Never tell anybody how it works until they've paid, chum. After they've paid, tell 'em it's under warranty." } },
    powderfuse_port = { { id = "tp_port", text = "Melbin's port, if you ask Melbin, and I don't, chum. I sell to anybody who comes by boat, and most of 'em don't ask questions." } },
    _none = { { id = "tp_none", text = "Is that somethin' I can sell? No? Then I don't know about it, chum." } },
  },
}

P:NPC {
  key = "rg_jezap", id = TODO_NPC("Jezap Jinglesprocket"), name = "Jezap Jinglesprocket", title = "Fight Promoter",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  temper = { "chatty", "shrewd" }, values = { "witty" },
  notices = { "class", "pvp" },

  impression = {
    first = "Jezap Jinglesprocket promotes fights for Gadgetzan and looks at everyone like a price tag on two legs. He seemed to think the whole war in the Riverglades was a show nobody had sold tickets to yet.",
    third = "{name} met Jezap Jinglesprocket, a fight promoter out of Gadgetzan scouting the northern Riverglades for talent.",
  },

  greetings = {
    { id = "g_default", text = "Step right up, step right up, kid! Let me get a look at you, front and side, because the crowd's gonna want both." },
    { id = "g_back", when = { metBefore = true }, text = "There's my contender! Still breathin', still pretty, still worth money, and that's all I ask, kid." },
  },

  notice = {
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 3 },
      text = "You've got a rank, kid, a real one, from the real war. Do you know what that's worth on a poster? I do, and it's a lot." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Look at those shoulders, kid! The crowd in Gadgetzan would throw money at you before you even swung, and I'd catch it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jezap Jinglesprocket, fight promoter, all the way from Gadgetzan, and I'm out here scouting talent, kid. These glades are full of folks hittin' each other for free, and it's breakin' my heart." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! You know how many tickets I could sell with a tauren on the bill, kid? I'd need a bigger arena, and a bigger cash box, and I'm already pricin' both." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, huh? Don't worry, kid, the crowds love an underdog, and they love it even more when the underdog bites, and they pay double for the biting." },
        { id = "h_hpriest", when = { class = "PRIEST" }, text = "A priest! Every good fight needs a healer standin' by, so you're hired, kid, in spirit, and the pay is also in spirit for now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Whoa, whoa, where'd you come from? The crowd can't cheer what it can't see, kid, so stay visible if you want to get paid." },
      },
      again = {
        { id = "h_again", text = "What else, kid? Talk fast, I've got scouting to do and a war out there givin' away my product." },
        { id = "h_again2", text = "Keep talkin', kid. I like a contender who talks, because talkers sell tickets." },
      },
      choices = {
        { text = "What are you doing out here?", next = "why" },
        { text = "Do you know Jazzle Cheapshot at the port?", next = "jazzle", when = { heardLine = "jazzle.h_default" } },
        { text = "What makes a good fighter, to you?", next = "fighter" },
        { text = "Here's a rank. Want to sign me?", next = "xpvp", when = { pvpRank = 3 } },
        { text = "I'll pass.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Scouting, kid. You've got Horde and Alliance and cultists and ogres all brawlin' up and down this river, and not one of 'em is charging admission, which is the biggest waste of talent I've ever seen." },
      },
      choices = {
        { text = "That's a war, not a show.", next = "why_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_war = {
      big = true,
      lines = {
        { id = "ww_default", text = "Sure, and a war's just a show with bad seating and no ticket booth, kid. In a ring, nobody burns down a farm, everybody gets paid, and the losers walk home, so you tell me which one's better business." },
      },
      choices = {
        { text = "Fair point. Better a ring than a battlefield.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Some fights matter more than gold.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jazzle = {
      lines = {
        { id = "jz_default", text = "Cheapshot? Sure, I know him, kid: he's got an arena with no fights and a sign with no paint. He thinks the Riverglades are his turf, and I think Gadgetzan's got deeper pockets and better lawyers." },
      },
      choices = {
        { text = "So you're rivals.", next = "jazzle_rival" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jazzle_rival = {
      big = true,
      lines = {
        { id = "jr_default", text = "Rivals is a big word, kid. He's a guy with an empty arena and I'm a guy with a full schedule, so if you're any good, come fight for me before he gets his act together and his prices down." },
      },
      choices = {
        { text = "I'll fight for whoever pays more.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd sooner keep faith with Jazzle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fighter = {
      lines = {
        { id = "fi_default", text = "Two things, kid: you've got to win, and you've got to look good doing it. Plenty of folks out here can do one of those, and almost nobody does both, and the ones who do get top billing and the big cut." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpvp = {
      lines = {
        { id = "xp_default", text = "Sign you? I'd frame you, kid! Come see me when the ring's set up, and bring that rank, because the posters write themselves and I'm savin' on the painter." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Gadgetzan born, ring-raised, kid. I've promoted fights between things you wouldn't believe, and I sold out every one, even the one that blew up the stands." } },
    advice = { { id = "tp_ad", text = "Never fight for free, kid. The war out here's the worst-paid job in Azeroth, and I've seen the books." } },
    powderfuse_port = { { id = "tp_port", text = "Nice port, small arena, smaller crowds. Cheapshot's got a lot to learn about crowds, kid, and I'm not givin' lessons for free." } },
    _none = { { id = "tp_none", text = "Does it sell tickets? No? Then I can't help you, kid." } },
  },
}
