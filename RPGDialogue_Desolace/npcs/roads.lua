-- Desolace between the towns: the Gizelton caravan, Scrabblescrew's camp at the Kodo Graveyard, Thunder Axe Fortress and Rexxar on the road.
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cork_gizelton", id = TODO_NPC("Cork Gizelton"), name = "Cork Gizelton",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Cork Gizelton runs the Gizelton caravan's kodos up and down the Desolace road, and he talks about bandits the way other folk talk about weather.",
    third = "{name} met Cork Gizelton of the Gizelton caravan on the road through Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Keep walking alongside, friend, because the kodos don't stop for conversation and neither do I." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, I can use another pair of eyes on these hills." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cork Gizelton, and this is the Gizelton caravan, the only honest freight between the Kodo Graveyard and the south road. My brother Rigger runs the back half and I run the front, and the centaurs would happily run off with both." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Bodyguard for Hire") }, text = "You're my bodyguard for this stretch, so stay close to the wagons and watch the ridges, because that's where the Kolkar like to come down from." },
      },
      again = { { id = "h_again", text = "What else? Talk fast, the next ridge is a bad one." }, { id = "h_again2", text = "Ask away, but keep one eye on the hills." } },
      choices = {
        { text = "Who's attacking the caravan?", next = "b1_1" },
        { text = "What do you haul?", next = "b2_1" },
        { text = "Tell me about your brother.", next = "b3_1" },
        { text = "I can hold a line against centaurs.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Why not just pay the centaurs off?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Kolkar centaurs, mostly, and they've learned our timetable better than we have. They hit the slow wagons, grab what they can carry and scatter into the hills before anyone gets a bow up." } },
      choices = { { text = "Someone selling your route?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "We've tried changing the route and we've tried changing the hour, and they still find us, which makes me wonder if somebody's selling our plans. I can't prove it, so I hire guards instead of accusing people." } },
      choices = { { text = "What should I do if they come?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see centaurs gathering on the high ground, shout early and shout loud. A warning in time saves more cargo than any sword I've ever paid for." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Whatever pays: supplies for Nijel's Point, goods for the Shadowprey docks, and the occasional crate I'd rather not ask about. Desolace is a poor land, but poor lands still need flour and nails." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Rigger's the sensible one, if you ask him, and the slow one, if you ask me. He keeps the back of the caravan honest, so if you've time, walk back and say hello." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Can you now? Then you're worth twice the coin, because most hired swords I get stand well behind the kodos when the arrows start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "The Magram have hinted they'd take a toll, and some days I'm tempted to pay it and be done with the whole bloody business." } },
      choices = { { text = "A deal is a deal. Pay the toll and keep the road quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pay them once and they'll take everything next time.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my cargo, not my concern, friend. Ask me about the road instead." } } },
}

P:NPC {
  key = "rigger_gizelton", id = TODO_NPC("Rigger Gizelton"), name = "Rigger Gizelton",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Rigger Gizelton minds the back of his family's caravan with a ledger in one hand and a crossbow within reach of the other.",
    third = "{name} met Rigger Gizelton at the rear of the Gizelton caravan in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Mind the wheel, friend. That one's been squeaking since Thunder Axe and I'm not fixing it on the road." },
    { id = "g_back", when = { metBefore = true }, text = "Back with the caravan, are you? Good, I'll take any company that helps me watch our tail." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rigger Gizelton, the half of the Gizelton caravan that does the counting. Cork shouts at the front and I make sure everything we started with is still here when we stop." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Gizelton Caravan") }, text = "You're guarding us through the Kolkar country, then. Stay by the wagons and don't chase them into the hills, because that's exactly what they want." },
      },
      again = { { id = "h_again", text = "Anything else? I've a ledger waiting." }, { id = "h_again2", text = "Go on, I'm listening, and counting." } },
      choices = {
        { text = "What's it like working with Cork?", next = "b1_1" },
        { text = "What's in the ledger?", next = "b2_1" },
        { text = "Is Desolace worth the risk?", next = "b3_1" },
        { text = "I've kept a few ledgers myself.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Do you ever cheat the books?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Cork thinks every problem gets solved by shouting at it, and I think most problems get solved by writing them down. Between the two of us the caravan's still running, so one of us must be right." } },
      choices = { { text = "You worry about him.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Don't tell him I said so, but he's braver than me. He rides up front where the arrows land first, and he's never once asked me to swap." } },
      choices = { { text = "Anything I should do?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So if you're guarding us, keep close to him at the front. He'll never admit he needs it, and I'd rather not count him among the losses." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Every crate, every barrel and every kodo, and a column for what the centaurs took, which is a longer column than I'd like. Desolace eats profit the way it eats everything else." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "There's no one else running this road, so whoever brings the supplies gets paid what they're worth. If we stopped, Nijel's Point and the Shadowprey docks would go hungry inside a month." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you'll know the worst sound in the world is a sum that won't come out even. Mine hasn't balanced since the spring raids." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "I've been offered good coin to lose a crate or two on the road, and I've never taken it, though I won't pretend I wasn't tempted." } },
      choices = { { text = "Honest books keep honest roads. You did right.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Out here, a little skimming keeps a family fed.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That's not in the ledger, friend, so I couldn't tell you." } } },
}

P:NPC {
  key = "smeed", id = TODO_NPC("Smeed Scrabblescrew"), name = "Smeed Scrabblescrew",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Smeed Scrabblescrew runs a goblin camp at the edge of the Kodo Graveyard and wants live kodos rounded up, preferably by somebody else.",
    third = "{name} met the goblin Smeed Scrabblescrew at his camp near the Kodo Graveyard in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Hey, hey! A fresh face, and you look like someone who can handle a kodo. Come here, I've got a business opportunity." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor's back! Got time for a little roundup work?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Smeed Scrabblescrew, entrepreneur. The Graveyard's full of old bones, sure, but the live kodos that wander in are worth real money to the right buyers, and I've got the buyers." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Kodo Roundup") }, text = "Take the Kodo Kombobulator, get close to an aged or dying kodo, and give it a little zap. Then lead the tame ones back here and I'll do the rest." },
      },
      again = { { id = "h_again", text = "Another question? Fine, but every one of 'em costs me a kodo bone I could be hauling." }, { id = "h_again2", text = "Ask, ask! Every question's free, for now." } },
      choices = {
        { text = "Why kodos?", next = "b1_1" },
        { text = "What is the Kombobulator?", next = "b2_1" },
        { text = "How's business?", next = "b3_1" },
        { text = "My people do not sell the kodo's last walk.", next = "x_1", when = { race = "Tauren" } },
        { text = "Graverobbing kodos seems wrong to me.", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Kodos are the trucks of Kalimdor, friend. Caravans, armies and tauren villages all need beasts that'll carry a ton of goods and not complain, and the Graveyard draws them in like flies." } },
      choices = { { text = "That's a grim trade.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The old ones come here to die, and that's sad, sure, but some aren't as close to the end as they think. With a little encouragement from my Kombobulator, they walk out again and earn a living." } },
      choices = { { text = "Do the tauren mind?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Ask the tauren and they'll call it disrespectful, which I understand. Ask the caravans and they'll call it a bargain, and I'm the one with the receipts." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "A goblin marvel! It calms a kodo right down so it follows you like a lost puppy, mostly. Don't point it at your own face, and don't ask what happened to the last guy who did." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Business is booming, friend, apart from the centaurs, the bone-diggers and the smell. Three out of four ain't bad for Desolace." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Hey, no offense meant! I'm just giving the old fellas a second career, and you'd be surprised how many like it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Wrong's a strong word, friend. I call it recycling, and nobody's ever paid me to leave them where they lie." } },
      choices = { { text = "The dead deserve their rest, even beasts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "A beast that can still walk can still work.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Never heard of it, but if it's for sale, I'm interested." } } },
}

P:NPC {
  key = "dalinda", id = TODO_NPC("Dalinda Malem"), name = "Dalinda Malem",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Dalinda Malem was held prisoner in Thunder Axe Fortress and needed a strong arm to walk her out of the Burning Blade's reach.",
    third = "{name} met Dalinda Malem, a captive of the Burning Blade at Thunder Axe Fortress in Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Thank the Light, a friendly face! Please, keep your voice down; they walk past this door every hour." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I wasn't sure anyone would, not in this place." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dalinda Malem, and I've been the Burning Blade's guest far longer than I wanted. Vahlarriel Demonslayer at Nijel's Point sent people to find me, and I can only hope you're one of them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "If you're taking me out, stay close and watch the corners, because the cultists won't simply let me walk out the front gate." },
      },
      again = { { id = "h_again", text = "What else? Speak quickly, please." }, { id = "h_again2", text = "Ask, but softly." } },
      choices = {
        { text = "What happened to you?", next = "b1_1" },
        { text = "Who is Vahlarriel?", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "The Light will see you home.", next = "x_1", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Should we burn this fortress down?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I came to Desolace looking into the Burning Blade, and they found me before I found them. They brought me to Thunder Axe and kept me alive, which frightened me more than anything else they did." } },
      choices = { { text = "Why keep you alive?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I heard them chanting at night, and I heard names I wish I hadn't, names of demons I won't say aloud. Whatever they're building here, it isn't finished yet." } },
      choices = { { text = "What are they building?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Vahlarriel needs to hear everything I've seen. If I don't make it back, tell her the fortress is only the beginning." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Vahlarriel Demonslayer, a night elf at Nijel's Point who has hunted the Burning Blade longer than I've been alive. She is fierce and she doesn't give up, which is why I'm still hoping." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Bruised and tired, but I can walk, and I can run if I must. Just get me past the gate and I'll keep up with you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "I've prayed for exactly that every night in this cell. Having you here feels like an answer, and I'm not ashamed to say it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Part of me wants to see the whole place in ashes, but I'm not sure fire alone ends a thing like the Burning Blade." } },
      choices = { { text = "Burn it. Some evils deserve no second chance.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Get you out first. Vengeance can wait for an army.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, and I've had a long time in here to think about everything." } } },
}

P:NPC {
  key = "vahlarriel", id = TODO_NPC("Vahlarriel Demonslayer"), name = "Vahlarriel Demonslayer",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Vahlarriel Demonslayer keeps her watch at Nijel's Point with the stillness of a hunter who has been tracking the same prey for years.",
    third = "{name} met Vahlarriel Demonslayer, a night elf demon hunter of the Burning Blade's trail, at Nijel's Point.",
  },
  greetings = {
    { id = "g_main", text = "Ishnu-alah. You walked in from the hills, so you've seen what Desolace has become." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; I've more work than allies." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Vahlarriel Demonslayer. I hunt the Burning Blade, the cult that bends the knee to demons, and their trail runs straight through Thunder Axe Fortress. One of ours, Dalinda Malem, went missing there." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Return to Vahlarriel") }, text = "Bring Dalinda back to me alive, and whatever she's learned inside that fortress may be worth more than anything we could take by force." },
      },
      again = { { id = "h_again", text = "Ask, but quickly; the Burning Blade does not rest while we talk." }, { id = "h_again2", text = "Speak, then, but briefly; the Burning Blade won't hunt themselves down." } },
      choices = {
        { text = "Tell me about the Burning Blade.", next = "b1_1" },
        { text = "Why do they call you Demonslayer?", next = "b2_1" },
        { text = "What of Dalinda Malem?", next = "b3_1" },
        { text = "I command demons too, and I serve no cult.", next = "x_1", when = { class = "WARLOCK" } },
        { text = "Can the Burning Blade's followers be saved?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are mortals who sold themselves to the Burning Legion's servants, orcs once, and now anyone desperate enough to join them. In Desolace they've made Thunder Axe Fortress their den." } },
      choices = { { text = "What are they summoning?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "They summon what they can and bargain for more. Every demon that walks out of Mannoroc Coven is one more thing this land will have to bury." } },
      choices = { { text = "How do I fight them?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Strike at their leaders and the rest will scatter, but do not let them speak to you for long. Their words are a second weapon." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because that is what I do, and I have done it longer than your kingdoms have had names. The name was earned, not given." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "She went into the fortress to learn what they plan and did not come out. I believe she still lives, because the Blade keeps prisoners who know things." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "I know what you are, and I know the line you walk. Step over it once, and you'll find me waiting on the other side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some came to the cult hungry, some came afraid, and some came because they liked it. I no longer have time to tell which is which." } },
      choices = { { text = "Spare those who surrender. Not all of them chose this.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Show none of them mercy. They chose demons over their own.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't concern myself with that. The Blade is enough to hunt." } } },
}

P:NPC {
  key = "rexxar", id = TODO_NPC("Rexxar"), name = "Rexxar",
  bible = "bibles/desolace.md", role = "citizen", tier = "service",
  impression = {
    first = "Rexxar walks the roads of Desolace with his bear Misha at his side, and he looks at strangers as though weighing whether they're worth the trouble.",
    third = "{name} met Rexxar, the half-ogre beastmaster, on the roads of Desolace.",
  },
  greetings = {
    { id = "g_main", text = "Misha doesn't like you yet. Give her time, and don't make any sudden moves." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Misha remembers you, which is a good sign." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Rexxar, Champion of the Horde, though I spend little time near its cities. The wilds suit Misha and me better than walls and politics do." },
      },
      again = { { id = "h_again", text = "Speak your mind." }, { id = "h_again2", text = "Misha's listening too." } },
      choices = {
        { text = "Why travel alone?", next = "b1_1" },
        { text = "Tell me about Misha.", next = "b2_1" },
        { text = "Is the Horde worth fighting for?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I'm Mok'Nathal, and my father's people are few and scattered. I fought beside Thrall when the Horde needed it, and when the fighting ended, I returned to the road." } },
      choices = { { text = "You fought beside Thrall?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Cities are full of people who want something from me. Out here, the only thing that wants something is the land, and it tells you plainly." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Misha is my companion and my friend, and she has saved my life more times than any warrior I've fought beside. Treat her with respect, and she'll do the same for you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "The Horde gave the orcs a home and a future, and Thrall leads it well. Still, I've seen what the old Horde did, and I don't forget it." } },
      choices = { { text = "It's worth fighting for, whatever it was.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Loyalty to a banner is a cage. Trust yourself first.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know that, and I don't much care to." } } },
}
