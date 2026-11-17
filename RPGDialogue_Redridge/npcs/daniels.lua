-- Barkeep Daniels, Lakeshire Inn. Voice: bibles/daniels.md
-- The orcs have cut off his shipments, and a dry bar is a sad bar.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daniels", id = TODO_NPC("Barkeep Daniels"), name = "Barkeep Daniels",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "generous", "witty" },
  notices = { "drink", "travel" },

  impression = {
    first = "Barkeep Daniels has a bar and very little to put behind it since the orcs cut the road. He's cheerful about it in the way of a man trying hard not to be miserable.",
    third = "{name} met Barkeep Daniels of Lakeshire, whose shipment of drink never came after the orcs struck the road.",
  },

  greetings = {
    { id = "g_bar", text = "What'll it be? Don't say ale, because I'm nearly out of ale." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Any luck? Tell me there's a keg in that pack." },
    { id = "g_after", when = { questDone = TODO_QUEST("Dry Times") }, text = "My saviour! The good bottles are back on the shelf, thanks to you." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had plenty somewhere else, which is a shame; I could've used the custom." },
    { id = "n_travel", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been to Darkshire! Did you try the moonshine? Course you did, you've got the look." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the orcs hit the wagons on the Lakeridge Highway, and the drivers won't go out again until someone clears the road. If a warrior cleared it, I'd have casks in a week, and I'd remember who to thank." } },
      choices = {
        { text = "I'll clear the road. Lakeshire deserves its ale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll clear it, but I'll want the first cask.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Daniels.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar, if you can get it, and condor if you can't, though condor's tough as a saddle. Sherman over at the inn's block takes whatever's clean, so bring it to him and tell him I sent you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of a beast that eats better than my customers, {class}. I'd not say no to a share of its supper." },
      },
      choices = {
        { text = "I'll hunt for the soldiers. They've earned a good meal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt, but the price goes up when the road's cut.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Daniels.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Smugglers might, and I'd not ask too many questions if one turned up with a cask of Stormwind ale, I'll tell you that for free. But Bailiff Conacher drinks here, so keep your voice down when you say that word." } },
      choices = {
        { text = "I'll keep it quiet. A barkeep needs his ale.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Conacher's right to watch. Laws matter here.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What's the news in Lakeshire?", next = "news" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Your lot in Stormwind drink at the Blue Recluse, I've heard, and argue about spells all night. Here they drink what I've got, which is mostly water and complaints, until the road's open again." } },
      choices = {
        { text = "Water's fine. A clear head keeps the spells sharp.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll drink and complain like everyone else.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Why is the bar so dry?", next = "dry" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I didn't think you were, but thanks for saying it out loud, because the regulars were starting to stare. Order something and smile, and they'll forget the glow round your hands quick enough." } },
      choices = {
        { text = "I'll smile. These folk have seen enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stare. Fear keeps people careful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How many guards does Lakeshire have?", next = "guards" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Over a drink they do, when I've got drink, and now that I don't, they mostly sit and stare at the wall. A barkeep hears confession whether he wants to or not, and lately it's been the kind that doesn't fit in a mug." } },
      choices = {
        { text = "Then I'll sit with them a while and listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers should keep their troubles to themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Daniels.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly, though a dry bar makes for short tempers, and I've had two scuffles this week over the last of the milk. The Marshal's lads are good boys, but they've nowhere to put their fear except on each other." } },
      choices = {
        { text = "They need discipline. The Marshal should come down hard.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them brawl a little. It's better than breaking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Daniels.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Blackrock cut the road from Stormwind, so the wagons stopped, and the last cask went the night the militia came back from Stonewatch. I've tried brewing from what grows round the lake, but it came out tasting like the lake." } },
      choices = {
        { text = "Wait for the road to reopen. Proper ale is worth waiting for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Brew wild. Bramble wine never hurt anyone.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daniels. I keep the bar, or I did when there was something to keep, but the orcs hit the road and my shipment never came." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dry Times") },
          text = "Thunderbrew lager from the hills in Westfall, merlot from Stormwind, moonshine from Darkshire, sweet rum from Goldshire. A proper bar needs all four, and I've got none." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Bring each one, mind, and don't drink them on the way. I'll know; I always know." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dry Times"), days = 3 } },
          text = "Listen to that room. That's the sound of Lakeshire forgetting about orcs for an evening, and you did that." },
        { id = "h_wiley", when = { metBefore = true },
          text = "Wiley's in the corner, if you're looking for him. Nobody's ever looking for Wiley. Except the ones who are." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Do sky folk drink? I'd wager they do, and whatever they pour up there, down here you'll get whatever I've got left." },
        { id = "h_barrel", when = { metBefore = true }, text = "A whole barrel came in yesterday, full, and I almost cried. The regulars did cry; Lakeshire's had a hard year." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be wanting a drink, and I'll be wanting to give you one, and the Blackrock have made sure neither of us gets what we want." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I've no drink to sell, but I'd gladly buy some meat for the table, because the soldiers are sick of bread." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've nothing to pour you, but I've a few regulars who could do with a kind word more than a drink." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "One of the Silver Hand, in my bar. I'd pour you something proper if the Blackrock had let a single cask through." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You wouldn't know how to brew something from berries and moss, would you, because I've an empty cellar and I'm getting desperate." },
      },
      again = {
        { id = "h_again", text = "Anything else? The stool's yours as long as you want it." },
        { id = "h_again2", text = "Go on, I'm listening; a barkeep's half ears anyway." },
      },
      choices = {
        { text = "Pour me whatever you've got.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Why is the bar so dry?", next = "dry" },
        { text = "Who's that in the corner?", next = "wiley" },
        { text = "Who keeps this place running?", next = "inn" },
        { text = "A dwarf brewed your lager, I hope.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I've been to Darkshire. The moonshine's real.", next = "moonshine", when = { visited = "Darkshire" } },
        { text = "Do you get many kaldorei through Lakeshire?", next = "nightelf", when = { race = "NightElf" } },
        { text = "The road's cut, but smugglers must still get through.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "This bar could use some of the Blue Recluse's cheer.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why haven't your shipments come through, Daniels?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What game would sell well at your bar, Daniels?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Blackrock have warlocks, Daniels. I'm not one of theirs.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers tell you what they've seen out there?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the soldiers keep the peace in your bar, Daniels?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What became of your stock, Daniels?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },

    news = {
      lines = {
        { id = "n_default", text = "Guards drink, and guards talk. The orcs are getting bolder, the bridge is getting nowhere, and the magistrate's writing another letter." },
      },
      choices = {
        { text = "What do the guards say about the orcs?", next = "guards" },
        { text = "Sounds about right.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "That there's more of them every week, and they march like soldiers. Guards don't like saying that sober, so they say it here." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
    dry = {
      lines = { { id = "dr_default", text = "The last shipment's long overdue. The orcs own half the roads and the gnolls own the rest. A bar runs on four roads, and I've lost all four." } },
      choices = {
        { text = "Four roads?", next = "four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four = {
      lines = { { id = "fo_default", text = "One from each: the Westfall hills, Stormwind, Darkshire, Goldshire. A proper bar's a map of the kingdom, and mine's gone blank." } },
      choices = {
        { text = "I'll fill in your map.", next = "BUSINESS", fx = { affinity = 2, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wiley = {
      lines = { { id = "wi_default", text = "That's Wiley. He pays on time, tips nothing and sees everything, and now and then somebody comes up from Westfall asking for him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    inn = {
      lines = { { id = "in_default", text = "Brianna has the rooms, I have the bar, and my wife has the needle. Half the cloaks in Lakeshire are her stitching." } },
      choices = {
        { text = "Your wife sews?", next = "wife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife = {
      lines = { { id = "wf_default", text = "She's the finest seamstress in Redridge. She thanks people with cloaks and I thank them with drinks, and hers last longer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Grimbooze Thunderbrew, up in the Westfall hills. Best lager this side of Ironforge, he says, and I've never had the nerve to argue." } },
      choices = { { text = "He's right.", next = "BACK", fx = { affinity = 2 } } },
    },
    moonshine = {
      lines = { { id = "mo_default", text = "Then you know what I'm missing. Darkshire's moonshine could strip paint, and some nights that's what Lakeshire needs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "You're the first I've poured for, and I've been wondering all evening what your lot drinks. If it's moonlight and dew, I'm afraid I'm out of both, along with everything else." } },
      choices = {
        { text = "Water from a clean spring will do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Whatever the dwarves drink.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A barkeep hears everything said over a mug, and Lakeshire says plenty. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I pour, and before the orcs, I poured more." } },
    advice = { { id = "tp_ad", text = "Never drink the last bottle in the house. It's bad luck, and it's mine." } },
    blackrock = { { id = "tp_blackrock", text = "They stopped my wagons, and that's personal." } },
    everstill_bridge = { { id = "tp_bridge", text = "The bridge crew drink here. They drink like men who've rebuilt the same thing three times." } },
    _none = { { id = "tp_none", text = "A barkeep hears everything and remembers nothing; that's the house rule." } },
  },
}

-- Innkeeper Brianna, Lakeshire Inn. Voice: bibles/daniels.md (Brianna section)
-- Makes the inn a home for tired travelers; has a pet, Narnie.
P:NPC {
  key = "brianna", id = TODO_NPC("Innkeeper Brianna"), name = "Innkeeper Brianna",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "service",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "pet" },

  impression = {
    first = "Innkeeper Brianna keeps Lakeshire's rooms and, between her and Daniels, its nerves. She made me feel at home before I'd decided whether I wanted to be.",
    third = "{name} found a room with Innkeeper Brianna, who keeps the beds in Lakeshire and does her best to keep the town calm.",
  },

  greetings = {
    { id = "g_home", text = "Out of the wind, now. Make yourself at home; that's what an inn's for." },
    { id = "g_bound", when = { homeInn = { "Lakeshire", "Lakeshire Inn" } }, text = "Back home! Narnie's kept your chair warm, so shoo her off; she won't mind. Well, she'll mind." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, mind Narnie; she's not fond of other animals. {pet} looks friendly enough, but Narnie won't care, she never does." },
    { id = "n_guest", cat = "guest", when = { durability = { max = 0.25 } },
      text = "Been up Render's Valley? You look it, so sit down before you fall down, and let me find you some soup." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twice a week, lately, and every time it's gnolls on the south road or orcs on the far shore. The guards do their best, but half of them are farm boys, and they'd stand a little taller with a real warrior beside them." } },
      choices = {
        { text = "I'll answer the bell while I'm here.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I paid for a room, Brianna. The guards can answer it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Brianna.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Good hunting, and bad company, because the gnolls hunt the same hills you will. Chef Breanna buys condor and boar for the soldiers' stew, and she pays fair, though she'll tell you what's wrong with every cut." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome under my roof, {class}, and I'll put a blanket down for it. It's more polite than half my guests." },
      },
      choices = {
        { text = "I'll hunt for Breanna's stew. The soldiers need feeding.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt for my own pot first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Brianna.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "That's a lovely offer, and the wounded upstairs would thank you for the warmth. Only mind the rafters, because Daniels swears the whole roof is held up by old varnish and good intentions." } },
      choices = {
        { text = "Carefully, then. One hearth at a time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A roaring fire cheers everyone. Let's go big.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How are the wounded?", next = "wounded" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Quiet I can give you, but if your work makes smoke or screaming, I'll ask you to take it out past the stables. There are soldiers upstairs who've seen enough of the Blackrock's shadow magic for one lifetime." } },
      choices = {
        { text = "I'll work outside. They need their rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll survive a little shadow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How is the town holding up?", next = "town" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I keep the kettle on and count heads, and I keep my voice level, because everyone looks to the inn to see if they ought to panic. If Brianna's still pouring tea, the town reckons it's not the end of the world." } },
      choices = {
        { text = "I'll be first down those stairs when the bell rings.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "When that bell rings, I'll be looking after myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Brianna.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fewer every week, and most of those are soldiers or folk running from somewhere worse. You're the first of your people I've had under this roof, so you'll tell me if the beds are too short, won't you?" } },
      choices = {
        { text = "Keep your doors open. Travellers need a safe place now.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Turn strangers away until the road is safe again.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brianna. I keep the rooms and Daniels keeps the bar, when he has anything to keep, and between us we keep Lakeshire from losing its mind." },
        { id = "h_dry", when = { questDone = TODO_QUEST("Dry Times") },
          text = "You found Daniels his drink! He's been whistling ever since, and it's terrible, and I've never been happier to hear it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a room near the stairs, I expect, so you can be first down if the bell rings, and it rings more than I'd like." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast can sleep in the room with you, so long as it doesn't mind Daniels snoring through the wall." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin under my roof! You'll have the room by the stairs, if you don't mind being first down when the bell goes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I'll give you the room by the lake, because you'll want to hear the water, and nobody else wants to hear the murlocs." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The kettle's on and Narnie's asleep." },
        { id = "h_again2", text = "Go on. Narnie's listening too, though she'll pretend she isn't." },
      },
      choices = {
        { text = "A room, please.", next = "BUSINESS" },
        { text = "Who's Narnie?", next = "narnie" },
        { text = "How's the town holding up?", next = "town" },
        { text = "Are there wounded under your roof?", next = "wounded", when = { class = "PRIEST" } },
        { text = "I could light every hearth in the inn tonight.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How often does the alarm bell ring in Lakeshire, Brianna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there good hunting near Lakeshire, Brianna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll need somewhere quiet to work, Brianna.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do you keep the town calm when the bell rings?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many travellers still reach Lakeshire with the roads so dangerous?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    narnie = {
      lines = { { id = "n_default", text = "My pet, and the real owner of this inn. I just pay the bills." } },
      choices = {
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does she like guests?", next = "narnie_guests" },
      },
    },
    narnie_guests = {
      lines = { { id = "ng_default", text = "She likes the warm side of the hearth, and guests sit there, so no. She tolerates the ones who leave early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "Better on a full stomach. Worse when the drums start in the hills. Mostly we keep the fire lit and the door open, and hope that's enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
    wounded = {
      lines = { { id = "w_default", text = "Two upstairs from the last raid, and a guard who won't admit his arm's broken. I've done what soup can do. They'd be glad of you." } },
      choices = {
        { text = "Show me to them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { lakeshire = 1 } } },
        { text = "They'll mend on their own, and I've other work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the rooms and Narnie keeps me; that's the arrangement." } },
    advice = { { id = "tp_ad", text = "Make an inn your home before you need one. You'll come back to it more than you think." } },
    blackrock = { { id = "tp_blackrock", text = "We hear the drums some nights. Everyone goes very quiet and orders another round." } },
    _none = { { id = "tp_none", text = "No idea, dear; I keep rooms, not secrets." } },
  },
}
