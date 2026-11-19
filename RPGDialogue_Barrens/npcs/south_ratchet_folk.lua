-- Ratchet's other folk: the warlock upstairs, the inn, the bank and the shops on the docks. Voices: bibles/<key>.md
-- Neutral port: Horde and Alliance both shop here, and the goblins take everybody's coin at the same rate.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "strahad", id = TODO_NPC("Strahad Farsan"), name = "Strahad Farsan",
  bible = "bibles/strahad.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "dry" }, values = { "cunning", "curious" },
  notices = { "fel", "light" },
  impression = {
    first = "He tells his students the story of the two who were eaten.",
    third = "{name} met Strahad Farsan, a warlock who takes students in the goblin port of Ratchet, far from the eyes of either capital.",
  },

  greetings = {
    { id = "g_door", text = "Close the door behind you, please. The draught carries the smell downstairs, and the goblins complain." },
    { id = "g_seek", when = { questActive = TODO_QUEST("Seeking Strahad") }, text = "Your trainer's letter reached me before you did, which is usual. Come in and let me see what they've sent me." },
    { id = "g_back", when = { metBefore = true }, text = "You came back with all your fingers, which is more than some of my students manage. Sit down." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Nether hasn't claimed you yet. Good, because I dislike starting over with a new student." },
  },

  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = true },
      text = "Your servant is eyeing my bookshelf. Call it to heel, please, because the Cartel bills me for damages and I pass the bill along to my students." },
    { id = "n_light", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "The Light comes off you like heat off a forge, and the thing in my cellar can feel it through the floor. Say what you came to say, and don't linger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Strahad Farsan. I keep these rooms above the docks because the Cartel asks no questions so long as the rent arrives, and I teach those who have outgrown their first masters. If you climbed the stairs looking for me, you already know what I teach." },
        { id = "h_seek", tags = { "news" }, when = { questActive = TODO_QUEST("Seeking Strahad") },
          text = "So your trainer sent you across the sea to a goblin port to find me. Good, because it means they think you're ready for harder work than calling imps in a cellar." },
        { id = "h_alliance_lock", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Another of Gakin the Darkbinder's students, by the look of you, sent from Stormwind the long way round by boat. That tells you how welcome our art is in Stormwind, doesn't it?" },
        { id = "h_horde_lock", when = { class = "WARLOCK", faction = "Horde" },
          text = "The Cleft of Shadow sends me its promising ones, because I'm a long way from the Warchief's shamans. Come in, and mind the chalk on the floor." },
        { id = "h_light", when = { class = { "PALADIN", "PRIEST" } },
          text = "A servant of the Light at my door, and on neutral ground, where neither of us can do much about the other. Ask your questions, then, and I'll answer the ones I like." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a lesson at dusk, but the student is late, as usual." },
        { id = "h_again2", text = "Go on. The thing downstairs is quiet for now, and I'd like to enjoy it." },
      },
      choices = {
        { text = "Why teach from Ratchet, of all places?", next = "why_ratchet" },
        { text = "What do you teach, exactly?", next = "teach" },
        { text = "The goblins can't know what you are.", next = "goblins" },
        { text = "Gakin the Darkbinder sent me. He says you know things.", next = "gakin", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Cleft of Shadow sent me to you. I want more.", next = "cleft", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I've bound three demons already. What's left to learn?", next = "lock", when = { class = "WARLOCK" } },
        { text = "I'm ready for whatever trial you set. Name it.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    why_ratchet = {
      lines = { { id = "wr_default", text = "In Stormwind a warlock lives under the Slaughtered Lamb and hopes the guard never knocks, and in Orgrimmar they keep us in the Cleft of Shadow and count us when we come out. Here the only law is the ledger, and the ledger has never once asked me where my power comes from." } },
      choices = {
        { text = "So neither side wants you.", next = "unwanted" },
        { text = "Something else, Strahad.", next = "BACK" },
      },
    },
    unwanted = {
      big = true,
      lines = { { id = "un_default", text = "Both sides want what we do, and neither likes to watch it done, which is an old arrangement and suits me well enough. I would rather be useful at a distance than tolerated up close, and Ratchet is a very comfortable distance." } },
      choices = {
        { text = "Power that has to hide should be watched. They're right.", next = "BACK", reply = "They are right, and I would think less of them if they weren't watching. Keep your eyes on me as well, friend, since that's the only respect a warlock really gets.", fx = { align = { order = 1 } } },
        { text = "The ledger's law is the honest one. Let them hide.", next = "BACK", reply = "You have a goblin's sense of it, which is a compliment in this port. The ledger doesn't care what I summon, so long as the rent is paid on time.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Binding, mostly, which is calling a thing across from the Twisting Nether and keeping it obedient once it's here. Any fool with a book can manage the calling, but the keeping is where my students either learn or are eaten." } },
      choices = {
        { text = "Surely no student has really been eaten.", next = "eaten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaten = {
      lines = { { id = "ea_default", text = "Two, in all my years, and both of them were certain they were cleverer than the creature. I tell the story to every new student and watch their faces, because the ones who laugh are the ones I worry about." } },
      choices = {
        { text = "Then why teach anyone at all?", next = "why_teach" },
        { text = "I didn't laugh, Strahad. Let's talk of something else.", next = "BACK" },
      },
    },
    why_teach = {
      big = true,
      lines = {
        { id = "wt_default", text = "Because the Burning Legion's servants are still loose in this world, whatever the paladins would like to believe, and someone ought to understand them better than they understand themselves. That's my justification, and I've had a long time to polish it." },
        { id = "wt_paladin", when = { class = "PALADIN" }, text = "Because the Legion's servants are still loose in this world, and your order would rather burn them than understand them. Somebody has to do the understanding, and it was never going to be the Silver Hand." },
      },
      choices = {
        { text = "Some knowledge should stay unlearned, Strahad.", next = "BACK", reply = "Some should, and I've buried a few things myself that I wish I hadn't learned. But ignorance has never once stopped a demon at the door, and I'd rather know its name.", fx = { align = { light = 1 } } },
        { text = "Know your enemy's tools. That's reason enough.", next = "BACK", reply = "Then you've already understood more than half my students ever do. Learn their tools, and you'll see the next cult coming long before the paladins notice.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "A polished excuse is still an excuse.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    goblins = {
      lines = { { id = "go_default", text = "The Cartel knows exactly what I am, and they've priced it in, which is the most any warlock can ask of anyone. Gazlowe charges me a little extra every month for the smell of brimstone, and I've decided to find that funny." } },
      choices = { { text = "Something else, Strahad.", next = "BACK" } },
    },
    gakin = {
      lines = { { id = "ga_default", text = "Gakin and I learned the art under the same roof, long before either of us had students, and he still writes to me in a hand nobody else can read. If he thought you were worth the boat fare, try not to make him wrong." } },
      choices = {
        { text = "What was he like back then?", next = "gakin2" },
        { text = "I'll try. Let me ask something else, though.", next = "BACK" },
      },
    },
    gakin2 = {
      lines = { { id = "ga2_default", text = "Careful, and so he's teaching in the capital while I rent rooms from goblins. I was the clever one, and you may take whatever lesson from that you like." } },
      choices = { { text = "Something else, Strahad.", next = "BACK" } },
    },
    cleft = {
      big = true,
      lines = {
        { id = "cl_default", text = "The Cleft sends its best to me because Thrall's shamans don't care for what I teach, and I can't say I blame them. The warlocks of the old Horde drank deep and made the orcs pay for it, so learn the art, but don't forget what it cost." },
        { id = "cl_orc", when = { race = "Orc" }, text = "The Cleft sends its best to me because Thrall's shamans don't care for what I teach, and you of all people know why. Gul'dan's warlocks sold your fathers to the Legion, so learn the art, but never forget the price." },
      },
      choices = {
        { text = "Gul'dan's mistakes won't be repeated. Not by me.", next = "BACK", reply = "Good, and see that you mean it when the whispers come, because they always come. Gul'dan meant it once too, before he found out what power tasted like.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gul'dan's only real mistake was losing.", next = "BACK", reply = "Now that is precisely the sort of answer that makes Thrall's shamans nervous, and I'd rather not give them a reason. Keep it behind your teeth, and keep it out of my classroom.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = { { id = "lo_default", text = "Then you've bound an imp, a voidwalker and very likely a succubus, and you're starting to think you're good at this. Tell me which of them gave you the most trouble." } },
      choices = {
        { text = "The imp. It never stops talking.", next = "lock2", fx = { trait = { witty = 1 } } },
        { text = "The voidwalker. It watches me sleep.", next = "lock2", fx = { trait = { cautious = 1 } } },
        { text = "None of them. They know who holds the leash.", next = "lock2", fx = { trait = { proud = 1 } } },
      },
    },
    lock2 = {
      lines = { { id = "lo2_default", text = "That's the usual answer, and it's the wrong lesson to take from it. Every demon is testing you all the time, and the day you stop noticing is the day the test ends, one way or the other." } },
      choices = {
        { text = "Then set me the next test.", next = "BUSINESS" },
        { text = "Something else, Strahad.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the art where it's frowned upon, which is everywhere, and I came to Ratchet because the goblins only frown at unpaid bills. The rest is between me and the Nether." } },
    advice = { { id = "tp_ad", text = "Never give your demon a fond name. It will notice, and it will find a use for it." } },
    _none = { { id = "tp_none", text = "Not a subject that interests me. Ask the goblins downstairs, who'll answer anything for a price." } },
  },
}

P:NPC {
  key = "ratchet_wiley", id = TODO_NPC("Innkeeper Wiley"), name = "Innkeeper Wiley",
  bible = "bibles/ratchet_wiley.md", role = "innkeeper", tier = "service",
  communities = { "ratchet" }, temper = { "jovial" }, values = { "practical", "greedy" },
  notices = { "weary", "drink" },
  impression = {
    first = "He bills for broken tables, broken windows and his own nerves.",
    third = "{name} took a room at Innkeeper Wiley's inn in Ratchet, the only bed on the Barrens coast.",
  },

  greetings = {
    { id = "g_inn", text = "Welcome to Ratchet's finest inn, pal, and also its only inn, which keeps my prices steady and my competition imaginary." },
    { id = "g_home", when = { homeInn = { "Ratchet" } }, text = "Your bed's still made, chum, and still paid for, which is my favourite kind of bed." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away}! I kept your stool warm, pal, or at least somebody sat on it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late one, pal? The kitchen's closing, but the bar never does, because closing costs money." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Back from the spirit healer, huh? Sit down before you fall down, pal, because I just had the floor swept and I'd like it to stay that way." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Whoa, whoa, you've had a few already, and not here, which hurts my feelings and my margins both." },
  },

  start = "hello",
  nodes = {
    dd_drowned = {
      lines = {
        { id = "dd_dr_default", text = "It never is, from what the sailors tell me, and they'd know, since half of 'em have done it at least once. The currents off the coast pull out toward the Great Sea, and the Southsea boys like to cut lines and watch folks drift. Were you chasin' pirates, or just bein' careless?" },
      },
      choices = {
        { text = "Chasing pirates. They owed me, and they paid.", next = "BACK", reply = "Ha! Then the swim was worth it, I suppose. Have a seat, and the next round costs you full price as usual.", fx = { align = { light = -1 } } },
        { text = "Careless. I'll respect the water next time.", next = "BACK", reply = "Smart talk, and rare in this town. The sea doesn't care how tough you are, so be smart and live to pay your tab.", fx = { align = { light = 1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    xalt_wiley = {
      lines = {
        { id = "xalt_wiley_default", text = "{alt}, sure, upstairs room on the left, the one with the window that sticks, paid for two nights and slept for one. Never started a fight with the Theramore sailors downstairs either, pal, which is all the peace I ask for in Ratchet." },
        { id = "xalt_wiley_other", when = { alt = { faction = "other" } }, text = "{alt}, the {altrace}, and the funny thing, pal, is that the same week I had half a Theramore crew in here and a table of Horde grunts, and {alt} drank between 'em like a wall nobody wanted to climb. Best night of quiet I've had all year, and it didn't cost me a single chair." },
      },
      choices = {
        { text = "Ratchet's peace is worth keeping. Good for you, Wiley.", next = "BACK", reply = "That's the idea, pal, and it pays better than you'd think. Peace is just a room with a sticky window that both sides can rent.", fx = { align = { order = 1 } } },
        { text = "That's not peace. That's goblins too greedy to pick a side.", next = "BACK", reply = "Greedy's a strong word, friend, I'd call it well-diversified. Besides, the day we pick a side is the day half my rooms go empty.", fx = { align = { order = -1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_keg", tags = { "news" }, when = { questDone = TODO_QUEST("Chen's Empty Keg") },
          text = "Drohn's been boastin' all week about the brew you helped him with, and now every pirate-hater on the dock wants a taste. I'm not sellin' it, I'm just tellin' ya, because it's cuttin' into my ale trade." },
        { id = "h_dd_drowned", when = { deathCause = "drowning" },
          text = "You look like you went for a swim and forgot to come up again, sweetheart. The water off Ratchet takes a sailor or two every month, so next time, take the boat like a payin' customer." },
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Hey, pal, you've got a twin, did you know? A {altrace} called {alt} took a bed upstairs not long ago, other side of the war and all, and paid up front with the very same scowl you're wearing." },
        { id = "h_alt_same", when = { alt = { faction = "same" }, metBefore = false },
          text = "Did {alt} send you? No? Well, you've got the same walk, pal, and {alt} paid up front, so I'm already half inclined to like you." },
        { id = "h_default", key = true, text = "Innkeeper Wiley, at your service, as long as the service is paid for up front. Beds are upstairs, drinks are down here, and the boat to Booty Bay is right outside the window, so you can watch it leave without you." },
        { id = "h_op_pirates", when = { opinion = { topic = "pirates", stance = "admire" } },
          text = "Gazlowe says you've a soft spot for pirates. Sit by the window, pal, where the bruisers can keep an eye on you, and don't take it personally." },
        { id = "h_op_hang", when = { opinion = { topic = "pirates", stance = "hate" } },
          text = "The pirate-hanger! The dockhands want to buy you a drink, pal, and since they're paying, I'd let 'em." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, huh? Relax, pal, the bruisers don't care and neither do I, and the orc at the bar only looks at you like that because he's had four." },
        { id = "h_horde", when = { faction = "Horde", race = { "Orc", "Troll" } },
          text = "Come in, come in, pal, and if there's a Theramore sailor by the far door, just ignore him, because he's paid up through Tuesday and I'd hate to lose him." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk's free and the stew's two silver, so pick wisely." },
      },
      choices = {
        { text = "I drowned out there, Wiley. It wasn't pleasant.", next = "dd_drowned", when = { deathCause = "drowning" } },
        { text = "Who stays at your inn?", next = "guests" },
        { text = "The boat to Booty Bay doesn't look safe.", next = "boat" },
        { text = "I'd like to make this inn my home.", next = "BUSINESS" },
        { text = "Someone like me stayed here before, Wiley?", next = "xalt_wiley", when = { alt = true } },
        { text = "What's in the stew, Wiley?", next = "stew" },
        { text = "How did Ratchet get started?", next = "town" },
        { text = "How does the Alliance get treated here?", next = "alliance", when = { faction = "Alliance" } },
        { text = "Why let Theramore sailors sleep here at all?", next = "horde", when = { faction = "Horde" } },
        { text = "Just passing through, Wiley.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Sailors, mostly, and caravan drivers in from the Crossroads, and now and then a Theramore captain who sits by one door and an orc who sits by the other. I keep 'em fed and I keep 'em apart, and the tips are terrible from both sides." } },
      choices = {
        { text = "That sounds like a crowd that comes to blows.", next = "guests2" },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    guests2 = {
      big = true,
      lines = { { id = "gu2_default", text = "Once, over a card game, and I billed both of 'em for the table, the window and my nerves. They paid, too, because nobody wants to be barred from the only inn on the coast." } },
      choices = {
        { text = "Good. Neutral ground should cost something to break.", next = "BACK", reply = "Exactly, pal, and every broken chair has a price on it, posted right there by the bar. Nobody's ever paid twice for the same lesson.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they want to fight, sell tickets.", next = "BACK", reply = "Don't think I haven't thought about it, and I've even got the seating plan drawn up. The trouble is the window budget, friend, because it'd eat the whole profit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat = {
      lines = { { id = "bo_default", text = "Safe enough, chum, as long as the Southsea aren't feeling ambitious, and the crew drinks here, so I'd hear about it first. The passage is free, but the seasickness is all yours, and Mebok sells a tonic for that, more or less." } },
      choices = { { text = "Something else, Wiley.", next = "BACK" } },
    },
    stew = {
      lines = { { id = "st_default", text = "Fish, mostly, from Kilxx on the dock, and whatever plainstrider the caravans haul down from the Crossroads, and a few things I don't name because naming 'em hurts sales. It's hot, it's filling, and nobody's died of it since the spring, pal." } },
      choices = {
        { text = "What happened in the spring?", next = "stew_spring" },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    stew_spring = {
      lines = { { id = "ss_default", text = "Bad batch of crocolisk, chum, and a sailor who ate four bowls of it on a dare, and he lived, so technically nobody died, but he swore off the stew and the sea both. I still charge him for the bowl he threw at the cook, on principle." } },
      choices = {
        { text = "I'll take my chances with the stew.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "to_default", fx = { learn = { "ratchet" } }, text = "A pier and a tent, pal, and a goblin named Gazlowe who figured out that the Horde had a whole new continent and nowhere to buy rope. The Steamwheedle Cartel put up the money, the bruisers put up the walls, and I put up the tent, which I'll have you know was the first roof in town." } },
      choices = {
        { text = "Gazlowe built all this?", next = "town_gazlowe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_gazlowe = {
      lines = { { id = "tg_default", text = "Gazlowe built it, Gazlowe runs it, and Gazlowe charges the rest of us rent for the privilege, which is how you know he's a good boss. He helped build Orgrimmar for the Warchief, too, and he'll tell you about it whether you ask or not." } },
      choices = {
        { text = "And your old tent is still out back?", next = "town_tent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_tent = {
      lines = { { id = "tt_default", text = "Still standing, pal, patched with sailcloth and stuffed with empty kegs, and I won't take it down because the first silver I ever earned was earned under it. A goblin can be sentimental, as long as the sentiment's paid off." } },
      choices = {
        { text = "That's almost sweet, Wiley.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "Same as everybody, pal, which is to say I take your coin at the door and seat you as far from the orcs as the room allows. The bruisers don't care what colors you fly, and Theramore boats bring me more paying guests than the Crossroads caravans ever do." } },
      choices = {
        { text = "Neutral ground's a fine thing, while it lasts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some day somebody'll break the peace here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Because their silver's as round as yours, pal, and because Theramore's just across the water and the Horde and Jaina's people aren't at each other's throats right now. If that changes, I'll move the sailors to the cellar, but until then everybody drinks." } },
      choices = {
        { text = "Fair enough. Peace is good for business.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've poured drinks in Ratchet since it was a pier and a tent, pal, and the tent's still out back if you want to see where it all started." } },
    advice = { { id = "tp_ad", text = "Pay for your room before you drink, pal, because after you drink, you always think you've paid." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it doesn't drink or sleep, I've got no reason to." } },
    ratchet = { { id = "tp_ratchet", next = "town", text = "Best little port on Kalimdor, pal, and the only one where an orc and a Theramore sailor drink under the same roof." }, { id = "tp_ratchet2", text = "Ratchet runs on three things, pal: Gazlowe's rules, the bruisers' fists and my beer." } },
  },
}

P:NPC {
  key = "fuzruckle", id = TODO_NPC("Fuzruckle"), name = "Fuzruckle",
  bible = "bibles/fuzruckle.md", role = "banker", tier = "service",
  communities = { "ratchet" }, temper = { "brisk" }, values = { "practical", "profit" },
  notices = { "purse" },
  impression = {
    first = "He finds loyalty a poor investment and says so.",
    third = "{name} banked with Fuzruckle, the Steamwheedle Cartel's banker in Ratchet.",
  },

  greetings = {
    { id = "g_bank", text = "Deposits on the left, withdrawals on the right, and complaints in the sea, pal." },
    { id = "g_back", when = { metBefore = true }, text = "Valued customer! Your vault's right where you left it, chum, and so's everything in it, which is the whole idea." },
  },

  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Opening an account with that, pal? I've seen bigger deposits come out of a fish." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's a purse that deserves a good vault, pal, and I happen to have the best one on the coast." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fuzruckle, Ratchet branch of the Steamwheedle vaults, and before you ask, pal, yes, your gold's safe. It's the same vault whether you're Horde or Alliance, and no, I won't tell you who else banks here." },
      },
      again = {
        { id = "h_again", text = "Something else, pal? The interest on this conversation is zero, so make it quick." },
      },
      choices = {
        { text = "Is the vault really that safe?", next = "vault" },
        { text = "Horde and Alliance gold in the same vault, then.", next = "both" },
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "What does a vault cost me, exactly?", next = "fees" },
        { text = "What's the oddest thing anyone's stored here?", next = "odd" },
        { text = "Who do you answer to, Fuzruckle?", next = "boss" },
        { text = "Does the Alliance get the same rates?", next = "alliance", when = { faction = "Alliance" } },
        { text = "That's all, Fuzruckle.", next = "END" },
      },
    },
    vault = {
      lines = { { id = "va_default", text = "Safer than anything in Stormwind or Orgrimmar, chum, because a thief would have to go to war with the whole Cartel to crack it, and nobody wants that invoice. Besides, the really good stuff goes home to Undermine." } },
      choices = {
        { text = "And if somebody robs it anyway?", next = "vault2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault2 = {
      lines = { { id = "va2_default", text = "Then somebody very sorry gets a visit from people who don't work at the bank, and the gold comes back with interest, and nobody tries it twice. I've worked this desk eleven years and I've seen it happen exactly once." } },
      choices = { { text = "Something else, Fuzruckle.", next = "BACK" } },
    },
    both = {
      big = true,
      lines = { { id = "bo_default", text = "Same vault, same ledger, same fee, pal, and I'll give you the secret of neutrality for free, which is that everybody's gold weighs the same. The orcs call that cynical and the humans call it disloyal, and they both keep making deposits." } },
      choices = {
        { text = "Gold without loyalty is how wars get paid for.", next = "BACK", reply = "And how do you think wars get stopped, pal? Somebody runs out of gold, and when they do, I'm the fella holding the note.", fx = { align = { honor = 1 } } },
        { text = "Smart business. Loyalty doesn't pay interest.", next = "BACK", reply = "Now there's a customer after my own heart, and I mean that sincerely. Deposit early, pal, and let the interest do the loyal part.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fees = {
      lines = {
        { id = "fe_default", text = "The slots are on the house, pal, which is a phrase I hate sayin', but the Cartel learned long ago that a customer with a vault is a customer who keeps comin' back to Steamwheedle towns. Bigger vaults cost extra, and the price goes up every time you buy one, because you're clearly doin' well." },
        { id = "fe_rich", when = { money = { min = 1000000 } }, text = "For a purse like yours, pal, the bigger slots, and you'll pay the premium without blinkin', because a customer like you knows what safety's worth. I can tell just by the way you're standing." },
      },
      choices = {
        { text = "So how does the bank make money?", next = "fees_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fees_how = {
      lines = { { id = "fh_default", text = "Whoa, whoa, that's a trade secret, chum, but let's say gold sitting in a vault doesn't always sit still, and it always comes back before anybody asks for it. Nobody's ever complained, which in banking is the same thing as nobody's ever noticed." } },
      choices = {
        { text = "You're lending out my gold?", next = "fees_lend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fees_lend = {
      lines = { { id = "fl_default", text = "I never said that, pal, and if you write that down I'll deny it in three languages. Your vault's full when you open it, and that's the only promise in the contract, so what happens in between is between me and the ledger." } },
      choices = {
        { text = "Using my gold without telling me is theft.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "If it's there when I want it, I don't care.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = { { id = "od_default", text = "Can't tell you who, pal, but I can tell you what: a single boot, a jar of something that hums at night, and a kodo skull wrapped in a Theramore tabard. Customers pay, customers store, and I don't ask, because askin' isn't billable." } },
      choices = {
        { text = "Something in a jar hums at night?", next = "odd_jar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd_jar = {
      lines = { { id = "oj_default", text = "Only on the full moon, chum, and only a little, and it's in the back corner behind three doors and a lot of lead. A warlock left it, and he paid fifty years up front, so as far as I'm concerned it can hum all it likes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boss = {
      lines = { { id = "bs_default", fx = { learn = { "steamwheedle" } }, text = "Gazlowe, on paper, because he runs Ratchet, but the vaults answer to the Steamwheedle Cartel, and the Cartel answers to the trade princes back in Undermine. Every coin you deposit here gets counted in Undermine by somebody I'll never meet." } },
      choices = {
        { text = "Have you ever been back to Undermine?", next = "boss_undermine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss_undermine = {
      lines = { { id = "bu_default", text = "Not in eleven years, pal, and I don't miss the noise, the smoke or the rent. Out here the sky's free and the sea's free, and that's two things more than a goblin gets for free back home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      lines = { { id = "al_default", text = "Same rate, same ledger, same smile, pal, and the orc in line behind you gets the same smile too. Your Stormwind banks charge more and talk about honor, and I charge less and don't, so you tell me who's lookin' after you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Eleven years at this desk, pal, and before that I counted somebody else's money in Undermine. Counting's counting, but the view's better here." } },
    advice = { { id = "tp_ad", text = "Never carry more than you can afford to lose to a raptor, chum, and leave the rest with me." } },
    _none = { { id = "tp_none", text = "Is it worth anything? No? Then I don't keep track of it, pal." } },
    steamwheedle = { { id = "tp_steam", next = "boss", text = "The Cartel keeps four ports and one ledger, pal, and my job is to make sure that ledger balances." }, { id = "tp_steam2", text = "Neutrality's a business plan, chum, and the Cartel's the best at it." } },
  },
}

P:NPC {
  key = "grazlix", id = TODO_NPC("Grazlix"), name = "Grazlix",
  bible = "bibles/grazlix.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "brash" }, values = { "practical", "greedy" },
  notices = { "kit" },
  impression = {
    first = "Some of his armor came from people who no longer need it.",
    third = "{name} bought armor from Grazlix, a goblin armorer on the Ratchet docks.",
  },

  greetings = {
    { id = "g_shop", text = "Armor, shields, the works, pal, and all of it fits better than what you're wearing." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive! See, that's my armor working, pal, and you can tell your friends I said so." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Whoa, whoa, look at you, your armor's hanging off in strips! Lucky for you, pal, the repair bench is right here and my rates are almost reasonable." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grazlix, armor and shields, which is the only thing standing between you and a centaur's spear, and the price reflects it. Mail, leather, a nice buckler, whatever you need, pal, I've got it or I can get it by Thursday." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Now here's somebody who wears their armor out properly, pal, and I love a customer who comes back every week for repairs." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Make it quick, because the tide's bringing in a shipment." },
      },
      choices = {
        { text = "Where does your armor come from?", next = "source" },
        { text = "What sells best in Ratchet?", next = "sells" },
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What armor stands up to a centaur spear?", next = "spear" },
        { text = "You learned the trade in Booty Bay?", next = "booty" },
        { text = "Do you sell any proper plate?", next = "plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Have you anything in my size?", next = "tauren", when = { race = "Tauren" } },
        { text = "Not today, Grazlix.", next = "END" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Some I hammer myself, some comes off the boat from Booty Bay, and some comes in from customers who don't need it anymore, if you follow me. I polish it all the same, and nobody's ever asked for a refund." } },
      choices = {
        { text = "You mean customers who don't need it anymore.", next = "source2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source2 = {
      big = true,
      lines = { { id = "so2_default", text = "Dead ones, pal, off the Merchant Coast and out of the Southsea fights, and their friends sell me the mail because they need the coin to bury 'em. It's a sad business, but a dent's a dent, and I hammer it out either way." } },
      choices = {
        { text = "Selling a dead man's armor is little better than grave robbing.", next = "BACK", reply = "Grave robbing's a free business, pal, and I pay full rate for every piece. The widows get coin for the burial, the fighters get armor that fits, and the dead don't file complaints.", fx = { align = { honor = 1 } } },
        { text = "Dead men don't need mail. Good salvage.", next = "BACK", reply = "That's how I see it, friend, though I don't say it near the families. Good mail's good mail, and it'd be a waste to sink it twice.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Grazlix.", next = "BACK" },
      },
    },
    sells = {
      lines = { { id = "se_default", text = "Shields, because everybody coming down from the Crossroads has met the Kolkar and learned something about spears. Boots come second, because the Barrens is very big and very flat and everybody walks it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spear = {
      lines = { { id = "sp_default", fx = { learn = { "centaur" } }, text = "A good shield, pal, held high and angled, because a centaur spear comes in at a gallop and the trick is to make it slide off instead of stop. Mail's fine on the chest, but leather on the legs, because you'll be runnin' afterward." } },
      choices = {
        { text = "And against quilboar?", next = "spear_quilboar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spear_quilboar = {
      lines = { { id = "sq_default", fx = { learn = { "quilboar" } }, text = "Quilboar's different, chum, because they don't stab, they gore, and those Razormane wear thorns that get into every gap. You want thick leather under the mail, and you want to pull every thorn out the same night, or the wound goes bad." } },
      choices = {
        { text = "How do you know so much about thorns?", next = "spear_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spear_scar = {
      lines = { { id = "sc_default", text = "Because a customer came back from Razorfen with one still stuck in his shoulder, and he asked for a refund, pal, and I pulled it out with pliers instead. He paid me for the surgery, and I gave him a discount on the pauldron, so we both went home happy." } },
      choices = { { text = "Something else, Grazlix.", next = "BACK" } },
    },
    booty = {
      lines = { { id = "bo_default", fx = { learn = { "booty_bay" } }, text = "Booty Bay, pal, down in Stranglethorn, where the pirates and the Bloodsail fight over the harbor and an armorer never runs out of customers. I hammered dents for six years under Baron Revilgaz's flag, and every one of 'em was in somebody I'd met." } },
      choices = {
        { text = "Why leave a place with that much business?", next = "booty_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    booty_leave = {
      lines = { { id = "bl_default", text = "Too much competition, chum, three armorers on one pier, and the rent goes up every time the jungle trolls get bold. Gazlowe offered me the dock spot for a song, and out here the only competition's the Crossroads, and Nargal's orcs don't do shields worth a copper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plate = {
      lines = { { id = "pl_default", text = "Plate in this heat? You'll cook like a crab in a pot, pal, but sure, I keep a few pieces in the back for {class}s who'd rather sweat than bleed. Come see me with silver when you're ready, and bring water, because you'll need it." } },
      choices = {
        { text = "I'd rather sweat than bleed.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Big shoulders, big chest and no boots, which is a goblin armorer's nightmare, pal, but I've got two pieces I cut down from an ogre's mail that might sit right. Whatever you buy, I'll charge by the pound, and you'll understand why." } },
      choices = {
        { text = "Fair. There's a lot of me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the trade at Booty Bay, pal, and came to Ratchet when Gazlowe told me there were more people getting stabbed out here. He was right, too." } },
    advice = { { id = "tp_ad", text = "Mend your armor before it breaks, chum, because a repair's cheap and a new chest piece ain't." } },
    _none = { { id = "tp_none", text = "Can you wear it? No? Then it's not my department, pal." } },
    booty_bay = { { id = "tp_booty", next = "booty", text = "Best port in the world for an armorer, pal, and the worst for anybody wearing armor." }, { id = "tp_booty2", text = "Revilgaz runs a tight harbor, chum, as long as you don't count the Bloodsail." } },
  },
}

P:NPC {
  key = "jazzik", id = TODO_NPC("Jazzik"), name = "Jazzik",
  bible = "bibles/jazzik.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "cheerful" }, values = { "practical", "cunning" },
  notices = { "greenness" },
  impression = {
    first = "He sold a pirate rope and told the bruisers where he went.",
    third = "{name} bought supplies from Jazzik, a goblin general goods merchant in Ratchet.",
  },

  greetings = {
    { id = "g_shop", text = "Water, bags, torches, rope, more rope, pal, step right up!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more rope? Everybody comes back for more rope, chum, it's the law of the Barrens." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "You're a long way south for somebody so fresh, pal, so take my advice for free and buy twice the water you think you need." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jazzik, general supplies, which means a little of everything and a whole lot of rope, because rope's the one thing nobody remembers to pack. Water, bags, flour, torches, you name it, pal, and if I haven't got it, I know who does." },
      },
      again = {
        { id = "h_again", text = "Anything else, chum? I've got a whole crate of candles that need a good home." },
      },
      choices = {
        { text = "Why so much rope?", next = "rope" },
        { text = "What do travellers forget most?", next = "forget" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What really happens to rope in the Wailing Caverns?", next = "caverns" },
        { text = "Who else trades on these docks?", next = "docks" },
        { text = "I'm new out here. What should I buy?", next = "green", when = { maxLevel = 15 } },
        { text = "Got anything for a rogue's kit?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Later, Jazzik.", next = "END" },
      },
    },
    rope = {
      lines = { { id = "ro_default", text = "Sailors buy it, caravans buy it, and every hero going down into the Wailing Caverns buys twice as much as they need and still comes back without any. I don't ask what happens to rope down there, chum, and frankly I'd rather not know." } },
      choices = {
        { text = "I'd guess everybody buys from you sooner or later.", next = "rope2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rope2 = {
      big = true,
      lines = { { id = "ro2_default", text = "Everybody, pal, both sides, and once a Southsea pirate in a borrowed hat who thought I wouldn't notice the cutlass. I sold him three coils and a lantern, because his coin was good, and then I told the bruisers which way he went." } },
      choices = {
        { text = "Take his coin and then sell him out? That's crooked.", next = "BACK", reply = "Crooked? Pal, that's two separate transactions, each one honest on its own terms. He got good rope, the bruisers got a pirate, and I got paid twice, so everybody's happy.", fx = { align = { honor = 1 } } },
        { text = "Smart. You got his coin and the bruisers got him.", next = "BACK", reply = "Now you're thinkin' like a merchant, sweetheart. I'd hire you for the counter, except you'd want a cut, and I've seen how fast you are with numbers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Jazzik.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "fo_default", text = "Water, every time, and they find out about two hours past the Crossroads when the sun's straight overhead. The Barrens doesn't forgive a dry canteen, pal, so buy more than you think and drink less than you want." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    caverns = {
      lines = { { id = "ca_default", fx = { learn = { "wailing_caverns" } }, text = "All right, all right, here's what I hear, pal: they tie it off at the cave mouth so they can find their way back, and then something down there chews through it. The druids that went down in there to fix the oasis came back strange, and some of 'em didn't come back at all." } },
      choices = {
        { text = "Something chews through rope?", next = "caverns_chew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caverns_chew = {
      lines = { { id = "cc_default", text = "Deviate raptors, they say, or the big snakes, or just the walls, because the cave moans like it's alive and folks lose their nerve and cut the line themselves. Either way, chum, they come back up and buy more rope, so I'm the last guy who'd complain." } },
      choices = {
        { text = "You're making money off people's nightmares.", next = "caverns_nightmare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caverns_nightmare = {
      lines = { { id = "cn_default", text = "Somebody's gonna, pal, and better me than a Venture Company man who'd sell 'em rotten hemp. My rope holds, my prices are honest, more or less, and I tell every kid going down there to turn back if the walls start talkin'." } },
      choices = {
        { text = "An honest trader in a dishonest trade. Good.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear's a market like any other. Sell away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    docks = {
      lines = { { id = "do_default", text = "Kilxx sells fish, Grazlix sells armor, Liv sells things that blow up, and Fuzruckle keeps everybody's money so they can buy from the rest of us. Then there's me in the middle, pal, sellin' the rope that ties it all together, and I mean that every way you can mean it." } },
      choices = {
        { text = "Who's the best of the lot?", next = "docks_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    docks_best = {
      lines = { { id = "db_default", text = "Me, obviously, but if you want honest, Liv, because she tells you which crates explode, and in this town that counts as charity. Stay clear of her red ones, chum, and don't let Kilxx tell you the one about his cousin's boat, because it takes an hour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    green = {
      lines = { { id = "gr_default", text = "Water, two skins of it, a bag with room in it and a torch for the caves, and then keep your silver for a better sword. And when you get back to the Crossroads, pal, tell 'em Jazzik sent you, because I'm workin' on a referral scheme." } },
      choices = {
        { text = "Thanks, Jazzik, that's worth knowing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "rg_default", text = "Flash powder, thieves' tools, the usual, pal, but the good poisons you'll have to get from your own people, because the bruisers don't let me stock 'em. I can sell you a nice dark cloak, though, and nobody's ever asked what it's for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Started out selling rope off a cart, pal, and now I sell rope out of a shop, which in goblin terms is a meteoric rise." } },
    advice = { { id = "tp_ad", text = "Pack water, pack rope, and never lend either to a stranger in the Wailing Caverns." } },
    _none = { { id = "tp_none", text = "Don't stock it, pal, but give me a week and a boat and I might." } },
    wailing_caverns = { { id = "tp_wc", next = "caverns", text = "Best rope market on Kalimdor, pal, and I'd still never go down there myself." }, { id = "tp_wc2", text = "The caves moan at night, chum, and you can hear it from the oasis if the wind's right." } },
  },
}

P:NPC {
  key = "kilxx", id = TODO_NPC("Kilxx"), name = "Kilxx",
  bible = "bibles/kilxx.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "dry" }, values = { "practical", "careful" },
  notices = { "craft" },
  impression = {
    first = "A crocolisk took his cousin's boat, and he still hears about it.",
    third = "{name} met Kilxx, a goblin fishmonger on the Ratchet docks.",
  },

  greetings = {
    { id = "g_shop", text = "Fresh fish, pal, or fresh enough, and tackle for catching your own." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Morning catch just came in, chum, so this is the best the fish are ever gonna smell." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "I can smell the bait on you, pal, and in my line of work, that's a compliment." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kilxx, fish and fishing, fresh off the boat or fresh off my own line, and you can tell which by the price. So do you fish, pal, or are you just hungry?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The fish ain't getting any fresher while we talk, pal." },
      },
      choices = {
        { text = "What's biting off Ratchet?", next = "biting" },
        { text = "The pirates must bother your boats.", next = "pirates" },
        { text = "Show me your tackle.", next = "BUSINESS" },
        { text = "So what happened to your cousin's boat?", next = "cousin" },
        { text = "Who buys your fish?", next = "buyers" },
        { text = "Where do these pirates come from?", next = "southsea" },
        { text = "Teach me something about the fishing here.", next = "teach", when = { profession = "Fishing" } },
        { text = "Darkspear fish these waters too, mon.", next = "troll", when = { race = "Troll" } },
        { text = "Just looking, Kilxx.", next = "END" },
      },
    },
    biting = {
      lines = { { id = "bi_default", text = "Sagefish and snapper close in, mackerel further out where the water goes dark, and crocolisks anywhere you're not looking. I lost my cousin's boat to a croc last spring, and he still says it was my fault for using the good bait." } },
      choices = {
        { text = "How far out does the dark water go?", next = "deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deep = {
      lines = { { id = "de_default", text = "Far enough that the Ratchet lamps look like candles and the Southsea lookouts can see you plain, so I stay where I can swim home. A smart fisherman knows his limit, pal, and mine's exactly one cousin's boat." } },
      choices = { { text = "Something else, Kilxx.", next = "BACK" } },
    },
    pirates = {
      big = true,
      lines = { { id = "pi_default", text = "They foul my nets, they steal my catch and they ruin my sleep, and the bruisers only care when it happens on the docks. Out on the water a goblin's on his own, pal, and fish money's thin money, so I can't hire help." } },
      choices = {
        { text = "The bruisers should protect everyone, not just the docks.", next = "BACK", reply = "You tell the bruisers that, pal, and see how far you get past their invoice. Everybody wants protection, and nobody wants to pay for the water part.", fx = { align = { order = 1 } } },
        { text = "Then sink their boats yourself. Who's going to stop you?", next = "BACK", reply = "Me? With what, pal, a fishing pole and harsh language? Those pirates have cannons and I've got a leaky dinghy, so I'll keep my complaints to the docks.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousin = {
      lines = { { id = "co_default", text = "I took it out past the reef for the big snapper, pal, and a crocolisk the size of a rowboat came up under the hull and took the whole stern off in one bite. I swam home with the rod in my teeth and the good bait still on the hook, which I thought showed real commitment." } },
      choices = {
        { text = "And your cousin wants it paid back?", next = "cousin_debt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousin_debt = {
      lines = { { id = "cd_default", text = "With interest, chum, at family rates, which are worse than Fuzruckle's, and he brings it up at every dinner. I'm paying him off one mackerel a week, and at this rate I'll be square around the time the sea dries up." } },
      choices = {
        { text = "Family debts are the worst kind.", next = "cousin_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousin_family = {
      lines = { { id = "cf_default", text = "Every goblin knows that, pal, which is why we put 'em in writing. My mother's ledger has a page for every one of her children, and mine's the thickest, which she says is a sign of love." } },
      choices = {
        { text = "Pay him back. A debt's a debt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The croc owes him, not you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Wiley for his stew, the boat crews for the voyage to Booty Bay, and the orcs from the Crossroads, who turn their noses up at fish until they've been on plainstrider for a month. Everybody comes round to fish eventually, pal, it's just a matter of patience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    southsea = {
      lines = { { id = "so_default", text = "The Southsea Freebooters, pal, a lot of no-good sailors who camp along the Merchant Coast south of here and raid anything that floats. Gazlowe pays good coin to anybody who'll go clear 'em off, and there's always somebody new on the dock looking for that coin." } },
      choices = {
        { text = "Where along the coast do they camp?", next = "southsea_camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    southsea_camps = {
      lines = { { id = "sc_default", text = "Just south past the point, where the wrecks wash up, chum, and they live in the wrecks and drink whatever floats ashore. Bring friends if you go, and don't eat anything they're cooking, because I've seen what they catch." } },
      choices = { { text = "Something else, Kilxx.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "te_default", text = "Sure thing, pal: fish the morning tide off the end of the pier, where the fresh water from the oasis streams comes out, and keep your line short when you see a shadow bigger than the fish. Out here the shadow's always a croc, and the croc's always hungry." } },
      choices = {
        { text = "What about the deeper water?", next = "deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Sure do, pal, and they're better at it than me, which I don't say often. A Darkspear fella paddles past every morning in a boat made of one log and comes back full, and I've been tryin' to buy his secret for a year." } },
      choices = {
        { text = "Some secrets aren't for sale, goblin.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Fished these waters since I could hold a rod, pal, and I've still got all my fingers, which out here counts as a career." } },
    advice = { { id = "tp_ad", text = "Never fish where the crocs can see your feet, chum, and never lend your boat to family." } },
    _none = { { id = "tp_none", text = "If it doesn't swim, pal, I don't know it." } },
    booty_bay = { { id = "tp_booty", text = "The boat runs there and back, pal, and the crews buy my mackerel for the trip, because Booty Bay fish costs double." } },
    ratchet = { { id = "tp_ratchet", next = "southsea", text = "Nice town, pal, as long as you stay on the docks, because past the point the Southsea own the beach." } },
  },
}

P:NPC {
  key = "liv_rizzlefix", id = TODO_NPC("Liv Rizzlefix"), name = "Liv Rizzlefix",
  bible = "bibles/liv_rizzlefix.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "sharp" }, values = { "inventive", "profit" },
  notices = { "craft", "gnome" },
  impression = {
    first = "She warns every customer which crates explode.",
    third = "{name} met Liv Rizzlefix, a goblin who sells engineering supplies in Ratchet.",
  },

  greetings = {
    { id = "g_shop", text = "Don't touch the red crates, sweetheart, and we'll get along fine." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Come in, come in, and tell me what you've blown up this week." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Finally, somebody who knows why I flinch when a customer sneezes near the blasting powder." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "A gnome in my shop! Keep your hands where I can see 'em, sweetheart, because the last one rewired my scales while I was counting change." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Liv Rizzlefix, engineering supplies, and before you touch anything, sweetheart, the red crates explode and the blue crates explode less. Blasting powder, bolts, copper tubes, the works, all priced to move before something moves on its own." },
      },
      again = {
        { id = "h_again", text = "What else, sweetheart? Mind your elbows on the way round." },
      },
      choices = {
        { text = "Your neighbours must hate the explosions.", next = "neighbours" },
        { text = "Who buys engineering supplies out here?", next = "buyers" },
        { text = "I'm a gnome. We invented half of this.", next = "gnome", when = { race = "Gnome" } },
        { text = "Red explodes, blue explodes less. What about green?", next = "crates" },
        { text = "What happened to your workshop in Undermine?", next = "workshop" },
        { text = "What's the best powder you stock?", next = "powder", when = { profession = "Engineering" } },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "I'll come back, Liv.", next = "END" },
      },
    },
    neighbours = {
      lines = { { id = "ne_default", text = "Sputtervalve's the only one who complains, and he's lost more eyebrows than I've sold fuses, so I don't take it personally. Gazlowe charges me extra insurance, sweetheart, and I pass it on to you with a smile." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Sputtervalve, mostly, and Horde tinkers who'd rather not walk to Orgrimmar, and once in a while a dwarf who pays in silver and never says what it's for. I like the dwarf, because he never haggles." } },
      choices = {
        { text = "What does a dwarf want with blasting powder?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      big = true,
      lines = { { id = "bu2_default", text = "Digging, sweetheart, and if I had to guess, he's one of the dwarves digging at Bael Modan down south, where the tauren at Taurajo don't want anybody digging. What they dig up isn't my business, because I sell the powder and somebody else sells the shovels." } },
      choices = {
        { text = "Maybe it should be your business. That's tauren land.", next = "BACK", reply = "Tauren land, sure, and the tauren can file a complaint with the Bael'dun, not with me. I just keep the powder dry, sweetheart, and the conscience on a different shelf.", fx = { align = { honor = 1 } } },
        { text = "You sell, they dig. Nobody's fault.", next = "BACK", reply = "Exactly, sweetheart, it's a long chain and I'm just one link at the friendly end. Nobody gets blamed for selling the shovel, so why should I get blamed for the boom?", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Liv.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Sure you did, sweetheart, and then you lost your whole city with it, which is the half I'd have kept quiet about. Still, a gnome's coin spends fine in Ratchet, so go on and browse, and tell me which bolts you'd have made better." } },
      choices = {
        { text = "All of them, Liv.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crates = {
      lines = { { id = "cr_default", text = "Green doesn't explode at all, sweetheart, it just smells, which is worse in a small shop on a hot day. That's the solvent, for cleaning gears, and Sputtervalve buys it by the barrel because nothing he owns has ever been clean." } },
      choices = {
        { text = "And the crate with no paint at all?", next = "crates_plain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crates_plain = {
      lines = { { id = "cp_default", text = "That one I haven't opened, and I'm not going to, because it came off a Venture Company boat by mistake and nobody's come to claim it. It ticks sometimes, sweetheart, so I keep it by the door, in case I need to throw it." } },
      choices = {
        { text = "You should hand it to the bruisers.", next = "crates_bruisers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crates_bruisers = {
      lines = { { id = "cb_default", fx = { learn = { "venture_company" } }, text = "And let Gazlowe bill me for disposal? The Venture Company's been stripping the hills up north and shooting anybody who asks why, sweetheart, so if they want their crate back, they can come and ask nicely." } },
      choices = {
        { text = "Keep it. The Venture Company deserves no favors.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Turn it in. That's what the bruisers are for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    workshop = {
      lines = { { id = "wo_default", text = "A bad batch of fuses, sweetheart, and a very good batch of blasting powder, and the two of 'em met on a Tuesday. Nobody was hurt, unless you count the workshop, the street outside, and my boss's opinion of my building." } },
      choices = {
        { text = "So you sell instead of build now?", next = "workshop_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    workshop_sell = {
      lines = { { id = "ws_default", text = "I sell in the day and build at night, sweetheart, out back where the bruisers can't hear. One of these days I'll have something worth patenting, and then this shop gets a sign with my name on it in letters a foot high." } },
      choices = { { text = "Something else, Liv.", next = "BACK" } },
    },
    powder = {
      lines = { { id = "po_default", text = "Coarse for mining and fine for your gadgets, sweetheart, and the fine stuff's ground in Booty Bay by somebody who still has all ten fingers, which tells you the quality. Keep it dry, keep it out of the sun, and keep it away from that gnome you're probably working with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I apprenticed in Undermine until the workshop went up, sweetheart, and the boss decided I'd sell better than I build. He was right, which still annoys me." } },
    advice = { { id = "tp_ad", text = "Store your powder dry and far from your bed, sweetheart, and you'll live long enough to buy more." } },
    _none = { { id = "tp_none", text = "Does it explode? No? Then ask somebody else, sweetheart." } },
    venture_company = { { id = "tp_vc", next = "crates_plain", text = "Company men with company guns, sweetheart, and they'd sell their own mothers if the margin was right." }, { id = "tp_vc2", text = "The Venture Company gives goblins a bad name, sweetheart, and that's hard to do." } },
  },
}
