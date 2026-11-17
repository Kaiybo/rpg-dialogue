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
    first = "Strahad Farsan teaches the binding of demons from rented rooms in Ratchet, where the goblins ask about the rent and nothing else. He is dry and patient, and he tells his students the story of the two who were eaten.",
    third = "{name} met Strahad Farsan, a warlock who takes students in the goblin port of Ratchet, far from the eyes of either capital.",
  },

  greetings = {
    { id = "g_door", text = "Close the door behind you, please. The draught carries the smell downstairs, and the goblins complain." },
    { id = "g_seek", when = { questActive = TODO_QUEST("Seeking Strahad") }, text = "Your trainer's letter reached me before you did, which is usual. Come in and let me see what they've sent me." },
    { id = "g_back", when = { metBefore = true }, text = "You came back with all your fingers, which is more than some of my students manage. Sit down." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and the Nether hasn't claimed you yet. Good, because I dislike starting over with a new student." },
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
          text = "Another of Gakin's students, by the look of you, sent the long way round by boat. That tells you how welcome our art is in Stormwind, doesn't it?" },
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
        { text = "Do the goblins know what you are?", next = "goblins" },
        { text = "Gakin the Darkbinder sent me.", next = "gakin", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Cleft of Shadow sent me to you.", next = "cleft", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I've bound three demons already. What's left to learn?", next = "lock", when = { class = "WARLOCK" } },
        { text = "I'm ready for whatever trial you set.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    why_ratchet = {
      lines = { { id = "wr_default", text = "In Stormwind a warlock lives under the Slaughtered Lamb and hopes the guard never knocks, and in Orgrimmar they keep us in the Cleft of Shadow and count us when we come out. Here the only law is the ledger, and the ledger has never once asked me where my power comes from." } },
      choices = {
        { text = "So neither side wants you?", next = "unwanted" },
        { text = "Something else, Strahad.", next = "BACK" },
      },
    },
    unwanted = {
      big = true,
      lines = { { id = "un_default", text = "Both sides want what we do, and neither likes to watch it done, which is an old arrangement and suits me well enough. I would rather be useful at a distance than tolerated up close, and Ratchet is a very comfortable distance." } },
      choices = {
        { text = "Power that has to hide should be watched. They're right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The ledger's law is the honest one. Let them hide.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Binding, mostly, which is calling a thing across from the Twisting Nether and keeping it obedient once it's here. Any fool with a book can manage the calling, but the keeping is where my students either learn or are eaten." } },
      choices = {
        { text = "Have students really been eaten?", next = "eaten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaten = {
      lines = { { id = "ea_default", text = "Two, in all my years, and both of them were certain they were cleverer than the creature. I tell the story to every new student and watch their faces, because the ones who laugh are the ones I worry about." } },
      choices = {
        { text = "Then why teach anyone at all?", next = "why_teach" },
        { text = "I didn't laugh. Something else.", next = "BACK" },
      },
    },
    why_teach = {
      big = true,
      lines = {
        { id = "wt_default", text = "Because the Burning Legion's servants are still loose in this world, whatever the paladins would like to believe, and someone ought to understand them better than they understand themselves. That's my justification, and I've had a long time to polish it." },
        { id = "wt_paladin", when = { class = "PALADIN" }, text = "Because the Legion's servants are still loose in this world, and your order would rather burn them than understand them. Somebody has to do the understanding, and it was never going to be the Silver Hand." },
      },
      choices = {
        { text = "Some knowledge should stay unlearned, Strahad.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Know your enemy's tools. That's reason enough.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "I'll try. Something else.", next = "BACK" },
      },
    },
    gakin2 = {
      lines = { { id = "ga2_default", text = "Careful, which is why he's teaching in the capital and I'm renting rooms from goblins. I was the clever one, and you may take whatever lesson from that you like." } },
      choices = { { text = "Something else, Strahad.", next = "BACK" } },
    },
    cleft = {
      big = true,
      lines = {
        { id = "cl_default", text = "The Cleft sends its best to me because Thrall's shamans don't care for what I teach, and I can't say I blame them. The warlocks of the old Horde drank deep and made the orcs pay for it, so learn the art, but don't forget what it cost." },
        { id = "cl_orc", when = { race = "Orc" }, text = "The Cleft sends its best to me because Thrall's shamans don't care for what I teach, and you of all people know why. Gul'dan's warlocks sold your fathers to the Legion, so learn the art, but never forget the price." },
      },
      choices = {
        { text = "Gul'dan's mistakes won't be repeated. Not by me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gul'dan's only real mistake was losing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = { { id = "lo_default", text = "Then you've bound an imp, a voidwalker and very likely a succubus, and you're starting to think you're good at this. Tell me which of them gave you the most trouble." } },
      choices = {
        { text = "The imp. It never stops talking.", next = "lock2", fx = { trait = { witty = 1 } } },
        { text = "The voidwalker. It watches me sleep.", next = "lock2", fx = { trait = { cautious = 1 } } },
        { text = "None of them. They obey.", next = "lock2", fx = { trait = { proud = 1 } } },
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
    first = "Innkeeper Wiley runs the only inn in Ratchet and keeps Horde and Alliance guests fed and seated at opposite doors. He bills for broken tables, broken windows and his own nerves.",
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
    hello = {
      lines = {
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
        { id = "h_again", text = "What else, pal? Talk's free, which is more than I can say for the stew." },
      },
      choices = {
        { text = "Who stays at your inn?", next = "guests" },
        { text = "Is the boat to Booty Bay safe?", next = "boat" },
        { text = "I'd like to make this inn my home.", next = "BUSINESS" },
        { text = "Just passing through, Wiley.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Sailors, mostly, and caravan drivers in from the Crossroads, and now and then a Theramore captain who sits by one door and an orc who sits by the other. I keep 'em fed and I keep 'em apart, and the tips are terrible from both sides." } },
      choices = {
        { text = "Do they ever come to blows?", next = "guests2" },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    guests2 = {
      big = true,
      lines = { { id = "gu2_default", text = "Once, over a card game, and I billed both of 'em for the table, the window and my nerves. They paid, too, because nobody wants to be barred from the only inn on the coast." } },
      choices = {
        { text = "Good. Neutral ground should cost something to break.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they want to fight, sell tickets.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat = {
      lines = { { id = "bo_default", text = "Safe enough, chum, as long as the Southsea aren't feeling ambitious, and the crew drinks here, so I'd hear about it first. The passage is free, but the seasickness is all yours, and Mebok sells a tonic for that, more or less." } },
      choices = { { text = "Something else, Wiley.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've poured drinks in Ratchet since it was a pier and a tent, pal, and the tent's still out back if you want to see where it all started." } },
    advice = { { id = "tp_ad", text = "Pay for your room before you drink, pal, because after you drink, you always think you've paid." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it doesn't drink or sleep, I've got no reason to." } },
  },
}

P:NPC {
  key = "fuzruckle", id = TODO_NPC("Fuzruckle"), name = "Fuzruckle",
  bible = "bibles/fuzruckle.md", role = "banker", tier = "service",
  communities = { "ratchet" }, temper = { "brisk" }, values = { "practical", "profit" },
  notices = { "purse" },
  impression = {
    first = "Fuzruckle keeps the Steamwheedle vault in Ratchet and takes Horde and Alliance gold into the same ledger at the same fee. He finds loyalty a poor investment and says so.",
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
        { text = "Horde and Alliance gold in the same vault?", next = "both" },
        { text = "I'd like to see my vault.", next = "BUSINESS" },
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
        { text = "Gold without loyalty is how wars get paid for.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart business. Loyalty doesn't pay interest.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Eleven years at this desk, pal, and before that I counted somebody else's money in Undermine. Counting's counting, but the view's better here." } },
    advice = { { id = "tp_ad", text = "Never carry more than you can afford to lose to a raptor, chum, and leave the rest with me." } },
    _none = { { id = "tp_none", text = "Is it worth anything? No? Then I don't keep track of it, pal." } },
  },
}

P:NPC {
  key = "grazlix", id = TODO_NPC("Grazlix"), name = "Grazlix",
  bible = "bibles/grazlix.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "brash" }, values = { "practical", "greedy" },
  notices = { "kit" },
  impression = {
    first = "Grazlix sells armor and shields on the Ratchet docks, some of it hammered by his own hand and some of it salvaged from people who no longer need it. He hammers the dents out either way.",
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
        { text = "Not today, Grazlix.", next = "END" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Some I hammer myself, some comes off the boat from Booty Bay, and some comes in from customers who don't need it anymore, if you follow me. I polish it all the same, and nobody's ever asked for a refund." } },
      choices = {
        { text = "Customers who don't need it anymore?", next = "source2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source2 = {
      big = true,
      lines = { { id = "so2_default", text = "Dead ones, pal, off the Merchant Coast and out of the Southsea fights, and their friends sell me the mail because they need the coin to bury 'em. It's a sad business, but a dent's a dent, and I hammer it out either way." } },
      choices = {
        { text = "Selling a dead man's armor is little better than grave robbing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dead men don't need mail. Good salvage.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Grazlix.", next = "BACK" },
      },
    },
    sells = {
      lines = { { id = "se_default", text = "Shields, because everybody coming down from the Crossroads has met the Kolkar and learned something about spears. Boots come second, because the Barrens is very big and very flat and everybody walks it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the trade at Booty Bay, pal, and came to Ratchet when Gazlowe told me there were more people getting stabbed out here. He was right, too." } },
    advice = { { id = "tp_ad", text = "Mend your armor before it breaks, chum, because a repair's cheap and a new chest piece ain't." } },
    _none = { { id = "tp_none", text = "Can you wear it? No? Then it's not my department, pal." } },
  },
}

P:NPC {
  key = "jazzik", id = TODO_NPC("Jazzik"), name = "Jazzik",
  bible = "bibles/jazzik.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "cheerful" }, values = { "practical", "cunning" },
  notices = { "greenness" },
  impression = {
    first = "Jazzik sells a little of everything on the Ratchet docks and a great deal of rope. He sold a pirate three coils and a lantern and then told the bruisers which way he went.",
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
        { text = "Later, Jazzik.", next = "END" },
      },
    },
    rope = {
      lines = { { id = "ro_default", text = "Sailors buy it, caravans buy it, and every hero going down into the Wailing Caverns buys twice as much as they need and still comes back without any. I don't ask what happens to rope down there, chum, and frankly I'd rather not know." } },
      choices = {
        { text = "Who else buys from you?", next = "rope2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rope2 = {
      big = true,
      lines = { { id = "ro2_default", text = "Everybody, pal, both sides, and once a Southsea pirate in a borrowed hat who thought I wouldn't notice the cutlass. I sold him three coils and a lantern, because his coin was good, and then I told the bruisers which way he went." } },
      choices = {
        { text = "Take his coin and then sell him out? That's crooked.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. You got his coin and the bruisers got him.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Jazzik.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "fo_default", text = "Water, every time, and they find out about two hours past the Crossroads when the sun's straight overhead. The Barrens doesn't forgive a dry canteen, pal, so buy more than you think and drink less than you want." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Started out selling rope off a cart, pal, and now I sell rope out of a shop, which in goblin terms is a meteoric rise." } },
    advice = { { id = "tp_ad", text = "Pack water, pack rope, and never lend either to a stranger in the Wailing Caverns." } },
    _none = { { id = "tp_none", text = "Don't stock it, pal, but give me a week and a boat and I might." } },
  },
}

P:NPC {
  key = "kilxx", id = TODO_NPC("Kilxx"), name = "Kilxx",
  bible = "bibles/kilxx.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "dry" }, values = { "practical", "careful" },
  notices = { "craft" },
  impression = {
    first = "Kilxx sells fish and fishing tackle in Ratchet and knows exactly how far out a goblin can row before the Southsea notice him. He lost a cousin's boat to a crocolisk and has not heard the end of it.",
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
        { text = "Do the pirates bother your boats?", next = "pirates" },
        { text = "Show me your tackle.", next = "BUSINESS" },
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
        { text = "The bruisers should protect everyone, not just the docks.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then sink their boats yourself. Who's going to stop you?", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Fished these waters since I could hold a rod, pal, and I've still got all my fingers, which out here counts as a career." } },
    advice = { { id = "tp_ad", text = "Never fish where the crocs can see your feet, chum, and never lend your boat to family." } },
    _none = { { id = "tp_none", text = "If it doesn't swim, pal, I don't know it." } },
  },
}

P:NPC {
  key = "liv_rizzlefix", id = TODO_NPC("Liv Rizzlefix"), name = "Liv Rizzlefix",
  bible = "bibles/liv_rizzlefix.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "sharp" }, values = { "inventive", "profit" },
  notices = { "craft", "gnome" },
  impression = {
    first = "Liv Rizzlefix sells engineering supplies in Ratchet and warns every customer which crates explode. She likes a quiet dwarf who pays in silver and never haggles, and she does not ask what he digs.",
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
        { text = "Do the explosions bother your neighbours?", next = "neighbours" },
        { text = "Who buys engineering supplies out here?", next = "buyers" },
        { text = "I'm a gnome. We invented half of this.", next = "gnome", when = { race = "Gnome" } },
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
      lines = { { id = "bu2_default", text = "Digging, sweetheart, and if I had to guess, he's one of the Bael'dun lot down south, digging deep in Bael Modan where the tauren at Taurajo don't want anybody digging. What they dig up isn't my business, because I sell the powder and somebody else sells the shovels." } },
      choices = {
        { text = "Maybe it should be your business. That's tauren land.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You sell, they dig. Nobody's fault.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "I apprenticed in Undermine until the workshop went up, sweetheart, and the boss decided I'd sell better than I build. He was right, which still annoys me." } },
    advice = { { id = "tp_ad", text = "Store your powder dry and far from your bed, sweetheart, and you'll live long enough to buy more." } },
    _none = { { id = "tp_none", text = "Does it explode? No? Then ask somebody else, sweetheart." } },
  },
}
