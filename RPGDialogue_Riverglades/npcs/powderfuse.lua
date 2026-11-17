-- Powderfuse Port: the goblin town on the Riverglades coast, at the end of the Steamwheedle boat. Neutral. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melbin", id = TODO_NPC("Melbin Powderfuse"), name = "Melbin Powderfuse", title = "Master Goblin Engineer",
  bible = "bibles/riverglades.md", role = "trainer", tier = "major",
  communities = { "powderfuse_port" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "craft", "purse", "race" },

  impression = {
    first = "According to Melbin Powderfuse, every plank in Powderfuse Port is his, and so is every nail. He watched my hands the whole time, as if I might carry off a wall.",
    third = "{name} met Melbin Powderfuse, Master Goblin Engineer, who claims to have built Powderfuse Port from nothing but sand.",
  },

  greetings = {
    { id = "g_default", text = "Hands off the walls, pal; I built those." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Spending today, or just admiring?" },
    { id = "g_engineer", when = { profession = "Engineering" }, text = "A fellow engineer! That's lovely, but touch nothing anyway." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "So you're an engineer, are you? Gnomish or goblin... no, don't answer, I can tell by the eyebrows, since some of yours are missing." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Rich, eh? I like you, and I like your purse even more. Ever thought about property? I've got some; all of it, actually." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in MY port, measuring things with your eyes; I can see you doing it, so stop it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Melbin Powderfuse, Master Goblin Engineer. The docks, the inn, every plank and every nail: mine, and I built it all. Before me there was nothing here but sand and murlocs.",
          fx = { hear = "melbin_built_port", learn = { "powderfuse_port" } } },
        { id = "h_partner", when = { townStanding = { town = "powderfuse_port", min = 30 } },
          text = "My favourite customer! Everybody in the port says so, because I told them to." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Perfect, I need muscle, and muscle needs money, so we're halfway to a deal already." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, huh? Then you can tell me what's been chewing my crates on the north dock, because it isn't rats; rats don't eat nails." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest! Do you do blessings on property? Because I've got a lot of property, all of it mine, and none of it's blessed." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you talk to the sea? Because I'd like a word with it about my north dock." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you conjure water? Because I sell water, and I'd like to know who my competition is." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, huh? Listen, whatever you summon, it doesn't stand on my docks without paying a mooring fee." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Great, so tell me, is there a way to make palm trees grow faster? I've got a beach that needs some atmosphere." },
      },
      again = {
        { id = "h_again", text = "More questions? Questions are free, and answers are free too, but the building you're standing in is not." },
        { id = "h_again2", text = "Go on, go on. I'm listening and invoicing at the same time." },
      },
      choices = {
        { text = "You really built all of this yourself?", next = "built" },
        { text = "What can I do for you?", next = "deal" },
        { text = "Why build a port here, of all places?", next = "why" },
        { text = "Who are your neighbours?", next = "neighbors" },
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "A gnome would have built it faster.", next = "gnome", when = { race = "Gnome" } },
        { text = "Am I a partner yet?", next = "partner", when = { townStanding = { town = "powderfuse_port", min = 30 } } },
        { text = "Nice locks. Shame if someone checked them.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your docks creak when I walk on them.", next = "xtauren", when = { race = "Tauren" } },
        { text = "The Forsaken trade too, goblin.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "What sort of muscle do you need, Melbin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Something's eating your nails? Show me the crates.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You want me to bless the whole port?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "The spirits don't take orders, Melbin.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are you worried mages will ruin your business?", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon doesn't pay fees, Melbin.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Trees grow at their own pace, Melbin.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The sort that stands at the end of the dock looking unfriendly when the pirates come round, and keeps standing there. I'd pay in coin, or in reduced rent, if you rented anything, which you should." } },
      choices = {
        { text = "I'll guard your dock for fair coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pay me double, or guard it yourself.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "North dock, third crate from the end, or what's left of it. Gritta says it's crabs, Argo says it's his monster, and I say whoever catches it owes me a fee for hunting on my dock." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep your {pet} off my pilings, would you? I paid good money for those pilings." },
      },
      choices = {
        { text = "I'll catch it for free. The port's safer for everyone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll catch it, but you'll pay me, not the other way round.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "Every plank, every piling, and the sign out front, which is the most important part. I'll even let you do it for free, since it's good for your reputation to be seen blessing the finest port on the coast." } },
      choices = {
        { text = "Blessings aren't for advertising, Melbin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fine. Every port deserves some luck, even yours.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everybody takes orders if the price is right, and I'm sure the spirits have expenses. All I want is the tide off my pilings, and I'll even put up a little shrine, very tasteful, with my name on it." } },
      choices = {
        { text = "Respect the sea, and maybe it'll respect your dock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Build your shrine. Spirits like gifts, same as goblins.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ruin it? Please, I'm a businessman, so I'd hire you. You conjure, I bottle, we split it eighty-twenty, and you'd be shocked how many sailors can't tell the difference." } },
      choices = {
        { text = "Selling conjured water as spring water is fraud.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Make it fifty-fifty and you've got a deal.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Everybody pays fees in my port, demons included, and I don't care what plane it came from. Look, I'll make an exception if it scares off the pirates, but I'm keeping a tab." } },
      choices = {
        { text = "Fine. Let it guard your docks; it'll enjoy that.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I won't set a demon loose on a crowded dock.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure, and so do customers, but I've got a fix for that called advertising. Couldn't you give the trees a little push, maybe a sprinkle of something, and I'd name a walkway after you." } },
      choices = {
        { text = "The land isn't yours to rush. Let it be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll help, if the walkway gets my name.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    built = {
      lines = { { id = "b_default", text = "Every board! Well, I designed every board, and some goblins I paid did the nailing. Paid them well, too, so ask them... actually, don't ask them." } },
      choices = {
        { text = "So you didn't build it.", next = "built_push", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    built_push = {
      lines = { { id = "bp_default", text = "I built it the way the Baron built Booty Bay: by being the one who owns it afterwards. That's what building means, kid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deal = {
      lines = { { id = "d_default", text = "Now you're talking. The Brotherhood buys, the Horde buys, the pirates buy when they think I'm not looking. I need hands that can carry things past all three without getting stabbed." } },
      choices = {
        { text = "What's the pay?", next = "deal_pay", fx = { trait = { greedy = 1 } } },
        { text = "I don't work for goblins.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    deal_pay = {
      lines = { { id = "dp_default", text = "Fair. Goblin fair, which means you'll complain and come back anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Rivers! Three of them, bending like a drunk's walk home, all coming down to this coast. Timber, ore, pelts, they all float to me, and I just had to be here first." } },
      choices = {
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Steamwheedle Cartel?", next = "why_cartel" },
      },
    },
    why_cartel = {
      lines = { { id = "wc_default", text = "The Cartel says I owe them a cut, and I do: a small one, a very carefully calculated small one.",
        fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "The Cartel sent me to audit that small cut.", tag = "Deceive", next = "audit",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 60 } } } } },
          fail = { next = "audit_no", fx = { affinity = -1 } } },
      },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "The Brotherhood's south of here, honest and broke, and the Horde's west, honest, broke and louder. The cultists in the middle aren't paying, and up north there's ogres who changed sides, the most goblin thing I ever saw an ogre do.",
          fx = { learn = { "twilights_hammer", "brotherhood_horse" } } },
      },
      choices = {
        { text = "And the pirates at Windstead?", next = "neighbors_pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_pirates = {
      lines = { { id = "np_default", text = "They're customers, is what they are, so don't you go telling the Brotherhood." } },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I might.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Faster, sure, and then it'd explode. Mine's only exploded twice, and once was on purpose." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    partner = {
      lines = { { id = "p_default", text = "Partner? Ha! No, but you're a valued customer, and in Powderfuse that's better, because partners pay rent." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    audit = {
      lines = {
        { id = "au_default", text = "An audit? Here? All right, listen: the cut's figured on the boat fares I report, not the ones I collect, and nobody holds a deed to this sand, me included, so tell your bosses the books are being improved, and that I said so very respectfully." },
        { id = "au_gnome", when = { race = "Gnome" },
          text = "They sent a gnome to audit me? That's either an insult or a very clever move, so fine: the cut's figured on the fares I report, not the ones I collect, and nobody holds a deed to this sand, so tell them the books are being improved." },
      },
      choices = {
        { text = "I'll put in a good word.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    audit_no = {
      lines = {
        { id = "an_default", text = "The Cartel's auditors wear better shoes than that, kid, and they never, ever smile. Nice try; I respect it, and I'll be charging you for it." },
        { id = "an_paladin", when = { class = "PALADIN" },
          text = "A paladin, auditing for the Cartel? The Light would have to be very short of work, kid, so try that one on somebody else." },
      },
      choices = {
        { text = "You can't blame me for trying.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xro_default", text = "Checked them? Pal, those locks are mine, and so's the door, and so's the wall the door's in. Tell you what: you find a flaw, you tell me first, and I'll pay you for it instead of the guards paying you a visit." } },
      choices = {
        { text = "Deal. I'll sell you the flaws.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Flaws are worth more if nobody knows them.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
      },
    },
    xtauren = {
      lines = { { id = "xta_default", text = "Creak? That's the sound of quality, friend, the sound of timber earning its keep. But stick to the middle planks, would you, because I priced those for goblins and I'd hate to rebuild 'em at cost." } },
      choices = {
        { text = "I'll walk softly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Build stronger docks.", next = "built", fx = { trait = { stern = 1 } } },
      },
    },
    xforsaken = {
      lines = { { id = "xfo_default", text = "Sure they do, and their gold's as shiny as anybody's, even if it smells a bit of cellar. Undercity hasn't sent me a ship yet, so you tell the Dark Lady there's a dock here with her name on it, for the right price." } },
      choices = {
        { text = "I'll tell her nothing of the kind.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "What can I do for you?", next = "deal" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Information's like timber: it floats down to me eventually, and I sell it on. Ask, and we'll talk terms later." },
    },
    background = { { id = "tp_bg", text = "Born with nothing, somewhere with less, and now I own a port. Do the sums; it's a very inspiring story." } },
    advice = { { id = "tp_ad", text = "Never build on land somebody else owns. Build first, and make them prove it." } },
    powderfuse_port = { { id = "tp_port", text = "Mine, all of it, so next question." } },
    steamwheedle = { { id = "tp_cartel", text = "Fine people, thirsty people, and every cut they take, I take back from the boat fares." } },
    twilights_hammer = { { id = "tp_hammer", text = "Terrible customers. They never buy anything, and they keep looking at the sky like it owes them money." } },
    _none = { { id = "tp_none", text = "Is it for sale? If it isn't, I haven't got an opinion." } },
  },
}

P:NPC {
  key = "zizplink", id = TODO_NPC("Innkeeper Zizplink"), name = "Innkeeper Zizplink",
  bible = "bibles/riverglades.md", role = "innkeeper", tier = "service",
  communities = { "powderfuse_port" }, temper = { "cheerful", "chatty" }, values = { "generous" },
  notices = { "guest", "drink" },

  impression = {
    first = "Innkeeper Zizplink calls everyone an explorer and seems to mean it kindly. Her inn smells of the sea, and she hears every rumor that comes off the Tanaris boat.",
    third = "{name} met Innkeeper Zizplink, the cheerful goblin who keeps the inn at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "Another explorer! Come in, come in, and mind the smell; it's the sea, mostly." },
    { id = "g_home", when = { homeInn = { "Powderfuse Port" } }, text = "Your room's ready! I aired it out, but the air came back in, so it smells like fish again." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Oh, you've been at Argo's bottle! Sit down before the floor comes up to meet you; it does that here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zizplink, innkeeper. Beds upstairs, food down here, and everybody off the Tanaris boat comes through that door. You hear things, running the inn at the end of a boat route." },
        { id = "h_list", tags = { "news" }, when = { questActive = TODO_QUEST("Zizplink's Grocery List") },
          text = "You've got my list! Don't lose it, and don't read it out loud; some of those are for Fimbo, and he's sensitive." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior explorer! Sit down, you look like you've carried that shield all the way from Tanaris, and my chairs are stronger than they look." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin explorer! Gray says your lot used to ride with the Brotherhood, so mind your manners near him; he gets sentimental, and then he gets loud." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "An explorer with a beast! Lovely, but keep it off the tables, would you? Last week a sailor's parrot ate a whole bowl of Fimbo's stew and then said a word I won't repeat." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Ooh, a quiet one. I'll count the spoons later, but I'll count them with a smile, explorer, so don't take it personally." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest explorer! The sailors will want you to bless their boats, and they'll try to pay you in fish, so I'd ask for coin up front." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman explorer! You'll like it here; the sea's very loud, and I'm told your lot can hear it talking back." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you warm the bathwater upstairs? The kettle's been broken since spring, and Melbin says he'll fix it when it's profitable." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Oh my, you've brought a friend! It can't eat in here, I'm afraid; it's not a rule, it's just that Fimbo faints." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Can you turn into a seal? Because the sailors would pay good coin to see that, and I'd split it with you." },
      },
      again = { { id = "h_again", text = "Anything else, explorer?" }, { id = "h_again2", text = "More? I'll top you up while you think." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Heard anything?", next = "gossip" },
        { text = "Who's the grumpy one at the bar?", next = "gray" },
        { text = "Does Melbin really own everything?", next = "melbin" },
        { text = "Do the soldiers from Farholde ever come down here?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does Gray have something against paladins?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many hunters pass through the port?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Have any spoons actually gone missing?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do sailors here have much faith?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "The sea is restless here. Have you felt it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Melbin doesn't fix things for his tenants?", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon doesn't need to eat, Zizplink.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "My forms aren't for show, Zizplink.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some do, when they've leave, and they eat like they haven't seen a plate in a month, which they probably haven't. I always give them the corner table, because they like a wall at their backs, poor things." } },
      choices = {
        { text = "They've earned the rest. Treat them well.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Soldiers belong at their posts, not in taverns.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not against them, no, just about them. He says the best people he knew carried the Light, and most of them are on a wall up at the keep now, carved in stone." } },
      choices = {
        { text = "Honoring the dead keeps them close. Let him grieve.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He should let them rest and live his own life.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More every month, now the boat runs from Tanaris regular. They go up the rivers after the big cats and come back with stories, and half of them are true, which is better than Argo manages." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome by the fire, but not in the kitchen. Fimbo has rules, and I have Fimbo." },
      },
      choices = {
        { text = "Hunt only what you need. The rivers aren't endless.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Big cats, big trophies. That's what the wilds are for.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Two, and a pepper pot, and I know exactly who took them, because Fimbo's been cooking with a spoon that looks a lot like mine. I haven't said a word, because the stew's improved." } },
      choices = {
        { text = "Confront him. Theft is theft, even between friends.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let it go. Good stew's worth a spoon or two.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "In the sea, mostly, and in luck, and in Argo's monster, depending on who's buying. I keep a candle in the window for the boats that are late, and I don't mind which god it's for." } },
      choices = {
        { text = "Faith needs proper rites, not just candles.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your candle's a fine prayer. That's enough.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only in my bones, the mornings after a storm, and in the shingles, which come off. Argo swears the water's angry about something, and for once I'm half inclined to believe him." } },
      choices = {
        { text = "Then the port should make an offering to calm it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Storms are storms. Fix your shingles and ignore Argo.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He fixes things that make money, and the bathwater doesn't, so it waits. I love him, explorer, the way you love a cat that knocks things off shelves, but I'd never tell him so." } },
      choices = {
        { text = "Then I'll warm it. Small kindnesses matter.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bill him for the repairs and make him pay.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Doesn't it? Well, that's a relief, and a little sad, if you ask me. You'll forgive me if I don't offer it a room, because the last guest who brought one left scorch marks on my good blankets." } },
      choices = {
        { text = "Fair enough. I'll keep it outside.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It goes where I go. Add the blankets to my bill.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "No, no, of course not, explorer, I only thought it might be fun. Fimbo says you're all very serious about it, and I suppose I'd be serious too if I could turn into a bear." } },
      choices = {
        { text = "The shapes are sacred. They aren't tricks for coin.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Maybe a bear on Jazzle's card, for the right price.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "Plenty! Most of it's Argo's, so half of it's sea monsters. Sit a while; the other half comes round eventually." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gray = {
      lines = { { id = "gr_default", text = "Gray? He's Brotherhood. He comes down from the keep, drinks, grumbles, tips well and goes back up again. Don't sit in his chair; he doesn't own it, but don't anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
    },
    melbin = {
      lines = { { id = "m_default", text = "He owns the land, or so he says. I own the stew pot and the good blankets, and I never once let him forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everybody off the Tanaris boat comes through that door with a story! Ask, explorer, and I'll tell you everything I've heard." },
    },
    background = { { id = "tp_bg", text = "I ran a kitchen, then a galley, and now an inn, and every step was a bigger pot." } },
    advice = { { id = "tp_ad", text = "Breathe through your mouth on the docks at low tide. Trust me." } },
    powderfuse_port = { { id = "tp_port", text = "Best little port on the coast! It's the only little port on the coast, but that still counts." } },
    _none = { { id = "tp_none", text = "Never heard of it! Ask me tomorrow, though; somebody'll have told me by then." } },
  },
}

P:NPC {
  key = "gray", id = TODO_NPC("Gray Dawnbright"), name = "Gray Dawnbright",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port", "brotherhood_horse" }, temper = { "surly" }, values = { "loyal" },
  notices = { "standing", "drink" },

  impression = {
    first = "Gray Dawnbright was rude to me before I had said a word, and I suspect he is rude to everyone. Something is eating at him that drink isn't fixing.",
    third = "{name} met Gray Dawnbright, a sour Brotherhood rider drinking away his leave at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "What is it? Can't you see I'm busy?" },
    { id = "g_drink", text = "If you're going to stand there, stand there with a drink for me." },
  },

  notice = {
    { id = "n_hero", cat = "standing", when = { townStanding = { town = "farholde", min = 30 } },
      text = "You're the one they talk about up at the keep. Fine, sit, but don't make a habit of it." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're further gone than me, and that's a first this week. Sit, sit." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gray Dawnbright, Brotherhood of the Horse, on leave from it, or it's on leave from me; I haven't decided. Make yourself useful and get Zizplink to fill this." },
        { id = "h_resolved", tags = { "news" }, when = { thread = { id = "farholde_lost", state = "resolved" } },
          text = "I went up to the keep and sat with Demar. We didn't talk about her, not really; we drank to her, alive or not, and that's the first time in years." },
        { id = "h_soured", when = { thread = { id = "farholde_lost", state = "soured" } },
          text = "Don't. Whatever it is, I've heard it." },
        { id = "h_tessa", when = { metBefore = true }, text = "I wrote Tessa a letter, tore it up and wrote another, and that one's in the stew, I think. Don't eat the stew." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Sit down, if you're sitting, and don't look at me like that; I know what I look like." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "Hunter, eh? Then you've seen the Riverglades from the trees, which is the only way to see them without somebody shooting at you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Your hand's near my purse, friend, and there's nothing in it but a letter from Tessa, so you'd be disappointed." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest, at the bar. Come to save me, have you? Get in line behind Zizplink." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Horde, in here. Zizplink says this port's neutral ground, so I'll keep my seat and you keep yours." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Ashe sends her sort down here now and then to check on me, and I'll tell you what I tell them: I'm fine, so go away." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Whatever you are, you smell like the Shroud, and I've had enough of that smell for one lifetime." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? Then you'll know the Riverglades were greener once, before the Hammer got their hands in the soil." },
      },
      again = { { id = "h_again", text = "Still here? Fine, then, talk." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Why aren't you up at the keep?", next = "keep" },
        { text = "Tell me about the Brotherhood.", next = "brotherhood" },
        { text = "Who's Tessa?", next = "tessa", when = { metBefore = true } },
        { text = "Fern Crimsonleaf. Did you know her?", next = "fern", when = { topicKnown = "fern_crimsonleaf" } },
        { text = "I spoke to Demar about Fern.", next = "fern_word",
          when = { thread = { id = "farholde_lost", beat = "b4_demar", state = { "stirring", "unfolding" } } } },
        { text = "Buy you a drink?", next = "drink" },
        { text = "You hold a tankard like a man who held a shield.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "The Brotherhood once rode with paladins, didn't it?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you miss riding out with the Brotherhood?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "A letter from Tessa? What does she write?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you drink to forget, or to remember?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "We're both a long way from home, Brotherhood man.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who's Ashe, and why would she check on you?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm not one of the Hammer's cultists.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What did the Riverglades look like, back then?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Leave you to it.", next = "END" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "We did, and the best of them are on the memorial now, and the rest went home when Stormwind stopped caring. I drink to them every night, which is more than Stormwind does." } },
      choices = {
        { text = "Honor them by fighting, not by drinking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Drink, then. Grief keeps its own pace.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every day, and that's why I'm in here instead of up there. You ride long enough beside the same faces, and when they're gone, the saddle doesn't fit right anymore." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And that's your {pet}, is it? Better company than half the Brotherhood, I'd wager." },
      },
      choices = {
        { text = "Go back. They need riders more than this bar does.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You've given enough. Rest here a while.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's my business, and I'll thank you to leave it there. She writes to tell me to come home, every time, and every time I write back that I will, soon." } },
      choices = {
        { text = "Then go home. Keep your word to her.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some promises can't be kept. She'll understand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "To remember, mostly, because the ones I lost deserve somebody sitting up late for them. Sister Rowland says that's grief and not a sin, and I'll take her word over any bishop's." } },
      choices = {
        { text = "Grief is no sin. Remember them well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Remembering this way will kill you too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Aye, we are, and your lot are up at Rog'mar stealing logs off the Turner camp, so don't expect me to buy you a round. Still, you drink honest, I'll give you that, which is more than I'd say for most in here." } },
      choices = {
        { text = "The raids are wrong. I'll say so to my own.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Horde needs wood. Your loggers can cut more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ashe Amberhall, the Commander's mage, and she's half the reason Farholde's still standing. She thinks I'm drinking myself to death, and she's not wrong, but she's not right, either." } },
      choices = {
        { text = "Listen to her. She sees what you won't.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's your life. Live it however you like.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, I suppose you're not, or you'd have tried to stab me by now. But you'll forgive a man for flinching; I lost friends to things that smelled exactly like you." } },
      choices = {
        { text = "Fair. I'll sit elsewhere, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My power fights the Hammer. Get used to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fields down to the river and orchards up the hills, and Sunnyglade so pretty you'd stop your horse just to look at it. I was a boy then, and I'd give anything to see it the way it was." } },
      choices = {
        { text = "It can be that way again, and I'll help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What's gone is gone. Make your peace with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Because up at the keep everyone stands up straight and talks about the dead. Down here they slouch and talk about fish. A man needs a break from standing up straight." } },
      choices = {
        { text = "Demar would call that desertion.", next = "keep_demar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_demar = {
      lines = { { id = "kd_default", text = "Demar would call breathing desertion if you did it facing Stormwind. I'll go back; I always go back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brotherhood = {
      lines = {
        { id = "b_default", text = "Best riders east of the mountains, and nobody west of them remembers we exist. We ride, we bleed, we carve names into stone, and then we do it again.",
          fx = { learn = { "brotherhood_horse" } } },
      },
      choices = {
        { text = "Why stay with it?", next = "brotherhood_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_why = {
      lines = { { id = "bw_default", text = "Because I've stood in front of those names. You don't walk away from them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tessa = {
      lines = { { id = "t_default", text = "Tessa's my wife, and that's all you're getting. She'd tell you more; she always does." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fern = {
      big = true,
      lines = {
        { id = "f_alive", key = true,
          text = "Knew her? Everyone did, and nobody did. Here's what the stone doesn't say: nobody found her, only her knife, and Fern didn't drop knives.",
          fx = { hear = "fern_lives" } },
      },
      choices = {
        { text = "You think she's alive.", next = "fern_alive" },
        { text = "Demar says she's dead.", next = "fern_demar", when = { heardLine = "demar.fl_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fern_alive = {
      lines = { { id = "fa_default", text = "I think she's somewhere. Ravenholdt taught her to vanish, and maybe she just never stopped." } },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a long time to stay vanished.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    fern_word = {
      big = true,
      lines = { { id = "fw_default", text = "Did you, now? Go on, and don't soften it; I've had years of soft." } },
      choices = {
        { text = "He found her dagger and nothing else. That's not a grave.", next = "fern_hope",
          fx = { thread = { id = "farholde_lost", state = "resolved" }, affinity = 3, align = { light = 1 } },
          journal = { first = "Told Gray that a dagger isn't a grave. He looked at me a long time, then got up and walked towards the keep.",
                      third = "{name} told Gray Dawnbright that Fern Crimsonleaf's dagger was no grave. He went up to the keep." } },
        { text = "Let her rest, Gray. He's right.", next = "fern_rest",
          fx = { thread = { id = "farholde_lost", state = "soured" }, affinity = -2, align = { light = -1 }, trait = { stern = 1 } },
          journal = { first = "Told Gray to let Fern Crimsonleaf rest. He didn't argue. He didn't say anything at all.",
                      third = "{name} told Gray Dawnbright to let Fern Crimsonleaf rest. He fell silent." } },
      },
    },
    fern_hope = {
      lines = { { id = "fh_default", text = "No... it isn't, is it? Hold my chair, because I'm going up to the keep. Someone ought to tell the Commander he's allowed to hope." } },
      choices = { { text = "Go on, then.", next = "END" } },
    },
    fern_rest = {
      lines = { { id = "fr_default", text = "Right, right. Zizplink, another one over here! No, I'm fine, so go on, then; you've done your bit." } },
      choices = { { text = "...", next = "END" } },
    },
    fern_demar = {
      lines = { { id = "fd_default", text = "Demar says a lot of things are dead. Half of them are just quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "d_default", text = "Now you're talking sense! Zizplink, whatever this one's having, and one for me, on them." } },
      choices = {
        { text = "Cheers.", next = "BACK", fx = { affinity = 2 } },
        { text = "I said a drink. Not two.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "Twenty years on the wall'll do that to your grip. Don't go thinking that makes us friends, though; I've got enough friends up at that keep who keep asking when I'm coming back." } },
      choices = {
        { text = "When are you going back?", next = "keep" },
        { text = "Drink, then. I'll leave you be.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been drinking here long enough to hear a few things. Ask, if Zizplink's filled this mug." },
    },
    background = { { id = "tp_bg", text = "Brotherhood, married and thirsty, in that order, most days." } },
    advice = { { id = "tp_ad", text = "Don't stand too close to Demar when he's talking about Stormwind. He waves his hands." } },
    fern_crimsonleaf = { { id = "tp_fernnext", text = "Fern? Sit down and buy something, and then I'll tell you.", next = "fern" }, { id = "tp_fern", text = "She's alive, and don't argue with me about it." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Family, the kind you'd leave for an afternoon and never for good." } },
    _none = { { id = "tp_none", text = "Ask somebody sober, and that's not me, not tonight." } },
  },
}

P:NPC {
  key = "jazzle", id = TODO_NPC("Jazzle Cheapshot"), name = "Jazzle Cheapshot",
  bible = "bibles/riverglades.md", role = "citizen", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "brash" }, values = { "greedy", "ambitious" },
  notices = { "class", "form" },

  impression = {
    first = "Jazzle Cheapshot owns an arena with no fights in it yet, and that doesn't dent his enthusiasm one bit. He looked me over like a poster he hadn't painted.",
    third = "{name} met Jazzle Cheapshot, who runs an empty arena at Powderfuse Port and dreams of filling it.",
  },

  greetings = {
    { id = "g_default", text = "No fights today, pal, but soon, very soon!" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Look at the shoulders on you! I can see the poster already." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "A bear! A talking bear? Could you do that on command, twice a night, maybe with a little hat?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jazzle Cheapshot, and this is my arena. It's empty, yeah, for now, while the Horde and the Alliance are out in the fields killing each other for free. For free!" },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter with a pet! Now that's a double act, pal, and double acts sell double tickets." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest! Great, I'll need one ringside, because somebody's gotta patch up the losers between bouts." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you do lightning? On cue? Because lightning on cue would bring the house down, maybe literally." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, pal! Fireballs look great from the cheap seats, and I've got a lot of cheap seats." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Whoa, a warlock with a demon on a leash? Pal, that's not a fighter, that's a whole card." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've already got a gimmick for you, pal, 'The Bear Who Was a Person', and it's yours if you want it." },
      },
      again = { { id = "h_again", text = "What else? Make it quick, I've posters to paint." } },
      choices = {
        { text = "When does it open?", next = "open" },
        { text = "Who would even fight here?", next = "fighters" },
        { text = "Put me on the card.", next = "card", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Isn't selling tickets to a fight a bit grim?", next = "grim" },
        { text = "Would a tauren draw a crowd?", next = "xtauren", when = { race = "Tauren" } },
        { text = "My companion isn't a show animal, Jazzle.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Healing fighters so they can bleed again seems cruel.", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "The elements aren't a stage trick, Jazzle.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Wouldn't a mage just end the bout too quickly?", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon would tear your fighters apart, Jazzle.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'm not a bear for hire, Jazzle.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Everything's a show animal if you light it right! The crowd wants teeth and claws, pal, and you've got a ready-made act walking around beside you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that your {pet}? Look at it! I'd bill it above you, no offense, because the crowd loves an animal." },
      },
      choices = {
        { text = "No. My companion doesn't fight for coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Make the purse big enough, and we'll talk.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "Cruel? It's a service! The fighters get paid, the crowd gets a show, and you get a front-row seat and a cut of the gate. Everybody walks out, which is more than you can say for the fields." } },
      choices = {
        { text = "I'll do it. They'll fight anyway; better they live.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I won't heal anyone for your profit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Says you! I've seen goblins pay a fortune to watch a fire juggler, and you can call down a storm. Think of it as sharing the elements with the paying public." } },
      choices = {
        { text = "I'll fight on your card, but no tricks.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A little thunder for a good purse? Why not.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's why I'd pair you with a big fella, an ogre from Bolder'ok, say, so it lasts. A good fight's all about the build-up, pal, because nobody pays to see one spell and a scorch mark." } },
      choices = {
        { text = "Then I'll stretch it out and give them a show.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A fight's a fight. I'll end it fast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's the dream! Demon against ogre, opening night, and I can see the poster already. Melbin'd want a cut for the property damage, but we'd make that back on the first night's gate." } },
      choices = {
        { text = "Fine. Set it loose, and pay me well.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "No. Some powers shouldn't be sold as a show.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not yet, you're not! But think of it: you walk out as yourself, the crowd boos, and then bang, you're a bear, and the whole place goes wild. Nobody's seen anything like it outside a circus." } },
      choices = {
        { text = "My shapes are a gift, not a gimmick.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fine, one night. But I want top billing.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    open = {
      lines = { { id = "o_default", text = "When I've got fighters, a crowd, and Melbin off my back about the rent, so soon. Goblin soon!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fighters = {
      lines = { { id = "f_default", text = "Ogres, if Bolder'ok'll sign, and Brotherhood knights, if they'd stop being so noble. Pirates, if I can get 'em to fight one at a time, and you, if you've got a gimmick." } },
      choices = {
        { text = "A gimmick?", next = "gimmick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimmick = {
      lines = { { id = "gm_default", text = "Everybody needs one! 'The Bear Who Was a Person', say, or 'The Gnome With the Big Hammer'. Think on it, and come back with a name." } },
      choices = {
        { text = "'The One Who Gets On With It.'", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'll pass.", next = "BACK" },
      },
    },
    card = {
      lines = { { id = "c_default", text = "Opening night, top of the bill. There's no opening night yet, but you're on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    grim = {
      lines = { { id = "gr_default", text = "Grim? It's the same fighting with a roof and a snack cart, so I'm civilizing it." } },
      choices = {
        { text = "Selling seats to a bloodbath isn't civilizing it, Jazzle.", next = "BACK", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Fair point, actually.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xtauren = {
      lines = { { id = "xta_default", text = "Would a tauren draw a crowd? Look at you! I'd paint you ten feet tall on the poster, and you'd still be the most honest thing on it." } },
      choices = {
        { text = "My people don't fight for coin.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Put me on the card.", next = "card", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a promoter, born one. Some goblins come out with a silver tongue; mine came with a ticket booth." } },
    advice = { { id = "tp_ad", text = "Every fight's a show. Win it pretty and somebody'll pay to watch the next one." } },
    _none = { { id = "tp_none", text = "Can it fight? If it can't, I don't book it." } },
  },
}

P:NPC {
  key = "fimbo", id = TODO_NPC("Fimbo Greasemitz"), name = "Fimbo Greasemitz",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "dramatic" }, values = { "curious" },
  notices = { "craft" },

  impression = {
    first = "Fimbo Greasemitz cooks boar and fish every single day and suffers loudly over it. Give him one new ingredient, I think, and he'd weep with joy.",
    third = "{name} met Fimbo Greasemitz, who keeps a cafe on the water at Powderfuse Port and is bored of his own menu.",
  },

  greetings = {
    { id = "g_default", text = "Table for one? Every table's for one, since nobody eats here in pairs." },
    { id = "g_menu", text = "It's boar or fish, same as yesterday, and same as forever." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Finally, somebody who'll understand my suffering." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fimbo Greasemitz, and welcome to my cafe on the water! Today we have roast boar and roast fish, and tomorrow, roast boar and roast fish. I'm dying inside." },
        { id = "h_stew", tags = { "news" }, when = { questActive = TODO_QUEST("A Taste of the Sea") },
          text = "Murloc eyes and crab meat, off the beaches. Fast in the pan with the eyes; that's the secret, because it keeps the sea in them." },
        { id = "h_stew_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("A Taste of the Sea"), days = 3 } },
          text = "Seafood stew, on the menu! Three customers tried it and two came back, which is the best this cafe has ever done." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You look like you eat a lot, and I mean that as a compliment, because I'm so tired of feeding people who pick." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Do you say grace? Say it over my boar, then, and maybe the Light can make it taste of something new." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Bring me something that isn't boar, please, anything at all, a hawk, a crab, a strider, I'm begging you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've got sneaky fingers, I can tell. Want to lift me some spices off the Tanaris boat? I'm joking, mostly." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest! Bless this pot, would you? I've tried everything else." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits eat? Do they have opinions on seasoning? I'd love a second opinion from anybody, even a spirit." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you conjure food? Don't, please, I couldn't take the competition; it'd break my heart." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Oh no, does your friend eat? What does it eat? Please don't say cooks." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Tell me where the wild herbs grow around here, because I'd kill for some thyme, and I mean that in the nicest way." },
      },
      again = { { id = "h_again", text = "What else? The pot's on, so I can talk." } },
      choices = {
        { text = "Why not cook something else?", next = "menu" },
        { text = "Murloc eyes? Really?", next = "eyes" },
        { text = "Who eats here?", next = "customers" },
        { text = "Trade recipes?", next = "recipes", when = { profession = "Cooking" } },
        { text = "Darkspear cooks use a lot more pepper.", next = "xtroll", when = { race = "Troll" } },
        { text = "What would you feed a warrior, if you could?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Would you cook a feast for the Brotherhood?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the rivers have that's worth cooking?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Someone's taking spoons from Zizplink, you know.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What's wrong with your pot?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "Fire spirits like a hot pan, Fimbo.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Conjured bread is no match for real cooking.", next = "xmage", when = { class = "MAGE" } },
        { text = "It doesn't eat food, Fimbo. Relax.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Wild herbs grow by the rivers, Fimbo.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Goodbye, Fimbo.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A whole roast with a sauce of crushed berries and black pepper, potatoes done in the fat, and a stew to finish. Instead you get boar, roasted, with a side of fish, roasted, and I'm sorry." } },
      choices = {
        { text = "Boar's honest food. Don't apologize for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Throw out the boar and cook what you love.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Would I! A feast for Farholde, with the Commander at the head of the table and all of them clean for once, eating my stew. They never come down this far, but a cook can dream, and I dream about it." } },
      choices = {
        { text = "Cook it. They've earned a feast after twenty years.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers need rations, not feasts. Save your stores.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Catfish the size of a goblin, Gritta says, and river crabs, and snapping turtles that make a soup you'd weep over. Nobody brings me any of them, because everybody's too busy fighting to go fishing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not your {pet}, of course! I'd never, it's a figure of speech, so please don't look at me like that." },
      },
      choices = {
        { text = "I'll bring what I can, but only what's plentiful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll bring you the biggest beast up the river.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Spoons? I don't know anything about spoons, and I've certainly not got any of Zizplink's in my kitchen drawer. If I did, it'd be because her spoons are better than mine, and that's not stealing, that's appreciation." } },
      choices = {
        { text = "Give them back. She's your friend.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep them. The stew's better for it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "Nothing, it's a beautiful pot, and that's the tragedy. Everything I put in it comes out tasting of boar, even the fish, and I think the pot's just tired, same as me." } },
      choices = {
        { text = "Patience. Good things come to those who wait.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Change your pot, change your luck.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "See, that's what I tell everyone! Hot pan, quick hand, and the murloc eyes go in last. If a fire spirit wants to come by and taste the stew, I'll set it a place, as long as it doesn't set the cafe alight." } },
      choices = {
        { text = "Respect the fire, and it'll serve your kitchen well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Spirits aren't kitchen help. Leave them be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's sweet of you to say, and also true, because conjured bread tastes like bread made by somebody who's only heard of bread. Real food has a story, even if the story is boar." } },
      choices = {
        { text = "Agreed. Cooking's an art, and conjuring's a trick.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured food feeds an army. That matters more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Relax, you say, with a demon looking at my kitchen like it's a menu! Fine, I'll relax, but I'm doing it over here, behind the counter, with my ladle." } },
      choices = {
        { text = "Fair enough. I'll leave it outside.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It stays. You'll get used to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "By the rivers! Where the Horde patrols, and the Brotherhood patrols, and whatever Argo's monster is. Of course they do, because nothing nice in the Riverglades is ever anywhere safe." } },
      choices = {
        { text = "I'll gather some, only what the land can spare.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grow your own. Herbs aren't worth the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu = {
      lines = { { id = "m_default", text = "Because boars walk up to the door and fish jump in the pot! Everything else costs money and imagination. I've got the imagination." } },
      choices = {
        { text = "What would you cook, if you could?", next = "menu_dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu_dream = {
      lines = { { id = "md_default", text = "A stew so good the Brotherhood and the Horde sit at the same table to eat it. They'd fight over seconds, sure, but at the same table!" } },
      choices = {
        { text = "I'd eat that.", next = "BACK", fx = { affinity = 2, opinion = { peace = "for" } } },
        { text = "They'd fight over the table first.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "Really! Crunchy outside, salty inside, like the sea gave you a little kiss... a wet, crunchy kiss." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "Sailors, goblins, Gray when Zizplink cuts him off, and Argo, who eats anything if you call it a toast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recipes = {
      lines = { { id = "r_default", text = "Yes! Give me something with a sauce, anything with a sauce, and I'll give you the boar. You'll never need another boar recipe as long as you live." } },
      choices = { { text = "Deal.", next = "BACK", fx = { affinity = 2 } } },
    },
    xtroll = {
      lines = { { id = "xtr_default", text = "Pepper! Real pepper, the hot kind? I haven't seen a peppercorn since the last Tanaris boat, and that one went into the stew before anyone could stop me." } },
      choices = {
        { text = "I'll bring you some next time.", next = "BACK", fx = { affinity = 2 } },
        { text = "What would you cook with it?", next = "menu" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A cook, always a cook. This cafe's the first kitchen that's mine, and it's on the water, which counts as floating." } },
    advice = { { id = "tp_ad", text = "Murloc eyes go in last. Everything goes in before the murloc eyes." } },
    _none = { { id = "tp_none", text = "Is it a recipe? If it isn't, it's wasted on me." } },
  },
}

P:NPC {
  key = "argo", id = TODO_NPC("Argo Brinewhistle"), name = "Argo Brinewhistle",
  bible = "bibles/riverglades.md", role = "questgiver", tier = "quest",
  communities = { "powderfuse_port" }, temper = { "jovial" }, values = { "brave", "generous" },
  notices = { "drink", "craft" },

  impression = {
    first = "Argo Brinewhistle hiccups through every sentence and calls his boat the finest in the port, sea monster and all. Drunk or not, there's a real sailor's nerve in him.",
    third = "{name} met Argo Brinewhistle, a hard-drinking captain at Powderfuse Port with a sea monster problem.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy! *hic* Pull up a crate." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You're keeping up, and nobody keeps up! Have another, have mine." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Good, then you know there's things in this water bigger than your pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Argo Brinewhistle, captain of the finest boat in the port. *hic* Well, the finest boat with a monster problem." },
        { id = "h_monster", tags = { "news" }, when = { questActive = TODO_QUEST("The Monster Surfaces") },
          text = "The bait goes in by the fresh wreckage off the murloc islands, not here, out there! Then it comes up, and you take its head for my stern!" },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Monster Surfaces"), days = 3 } },
          text = "Look at 'er, up on my stern! Ugliest, finest figurehead on the whole coast, and drinks are on me, again." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! *hic* Just what my boat needs, somebody to stand at the bow and look fierce when the monster comes up." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, on my dock! *hic* Bless my boat, would you? She leaks, and I think it's spiritual." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You've hunted big game, sure, but have you hunted big game that lives under the sea? *hic* It's the same, only wetter." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Somebody's been at my rum, and it wasn't me, because I'd have remembered. *hic* Was it you?" },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest! Pray for the monster, would you? *hic* It's got to be lonely down there, eating boats all by itself." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you make my rum colder? *hic* Or make there be more of it? Either's fine." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that a demon? *hic* It's got a face only my monster could love, and I mean that kindly." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Can you turn into a fish? *hic* Then you could swim down and ask the monster what it wants." },
      },
      again = { { id = "h_again", text = "What else can I do for you, matey? *hic*" } },
      choices = {
        { text = "What kind of monster?", next = "monster" },
        { text = "Are you ever sober?", next = "sober" },
        { text = "Tell me about your boat.", next = "boat" },
        { text = "I fish these waters too.", next = "fish", when = { profession = "Fishing" } },
        { text = "The sea spirits around here aren't happy, Argo.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "What's the plan when the monster surfaces?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Would a sober captain need fewer blessings?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you track something that lives underwater?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your rum's safe from me, Argo. Mostly.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You want me to pray for a beast that sinks boats?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "I could freeze the sea around your monster.", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon could drag your monster up from the deep.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "My aquatic form could scout the wrecks, Argo.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Cheers, Argo.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The plan! Ha, the plan is, you hit it, I steer, and Gritta's chum does the rest, and then we all drink to it. It worked for my grandfather, or he said it did, and he was a terrible liar." } },
      choices = {
        { text = "I'll face it head-on. Steer us straight at it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bait it close, then strike from behind. No heroics.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Probably, but a sober captain wouldn't have any fun, and she knows it, my boat. We've an understanding, she and I: I don't sink her, and she doesn't sink me." } },
      choices = {
        { text = "Then I'll bless her, leaks and all.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Patch the hull first. The Light won't bail water.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You follow the wreckage and the gulls, matey, because the gulls know where it's eaten last. Then you drop the bait by the murloc islands, wait for the water to go still, and pray you're quicker than it is." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bring your {pet} aboard! Every good boat needs a mascot, and mine ran off with a pirate." },
      },
      choices = {
        { text = "I'll hunt it fairly and take its head myself.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Poison the bait. A beast that size won't fight fair.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mostly! Ha, I like you. Tell you what, you find out who's been nicking my rum, and I'll pour you the first glass of what's left." } },
      choices = {
        { text = "I'll find the thief and see him punished.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Who cares who drank it? Buy more rum.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "Well, why not? It's not wicked, it's hungry, and I've been hungry myself, mostly for a drink. Pray for it, and then help me cut its head off, and we'll call it even." } },
      choices = {
        { text = "Every creature deserves mercy, even a monster.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that kills sailors gets no prayer from me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Freeze it! Ha! Like a big fishy icicle, and then we chip its head off and put it on the stern. You're a genius, matey, and I'm buying, or Zizplink is, I forget which." } },
      choices = {
        { text = "Freezing a whole bay is too dangerous for the port.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave it to me. Big problems need big spells.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Could it? Now that'd be a sight, the two of them wrestling in the surf while the whole port watches. Jazzle'd sell tickets, and I'd sit in the front row with a bottle." } },
      choices = {
        { text = "Then let's do it. One beast against another.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "No. Some powers aren't for sport.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Scout 'em! Brilliant! Go down by the fresh wreckage off the murloc islands, and if you see something with more teeth than sense, come back up quick and tell me which way it went." } },
      choices = {
        { text = "Maybe it only wants to be left alone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll find it, and then we'll end it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    monster = {
      lines = { { id = "m_default", text = "Big, with teeth, and more teeth than that. It sank three boats I know of, and one I made up to scare Gritta." } },
      choices = {
        { text = "Which one did you make up?", next = "monster_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monster_lie = {
      lines = { { id = "ml_default", text = "Ha! Wouldn't you like to know? *hic* The third, or maybe the second." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    sober = {
      lines = { { id = "s_default", text = "Once, and I didn't care for it; everything was so... clear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    boat = {
      lines = { { id = "b_default", text = "Little, leaky and loyal, like me! She's never sunk, though she's thought about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = { { id = "f_default", text = "Then stay off the murloc islands at dusk, friend, because that's when it feeds, and not on fish, on fishermen." } },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Not happy? Hic. Well, neither's the monster, and neither am I, so that's all of us. You tell those spirits that Argo Brinewhistle tips a drop overboard every night, which is more than most sailors do." } },
      choices = {
        { text = "They'd like you sober.", next = "sober" },
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born on a boat, *hic* and I'll die on a boat, and in between, I'm on a boat." } },
    advice = { { id = "tp_ad", text = "Never trust a calm sea or a sober sailor." } },
    _none = { { id = "tp_none", text = "Don't know! *hic* Ask me after the next one." } },
  },
}

P:NPC {
  key = "gritta", id = TODO_NPC("Gritta Chumwater"), name = "Gritta Chumwater", title = "Fisherman",
  bible = "bibles/riverglades.md", role = "vendor", tier = "service",
  communities = { "powderfuse_port" }, temper = { "blunt" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Gritta Chumwater sells chum, lures, fish and advice, and only the advice comes free. She says what she thinks and doesn't waste breath dressing it up.",
    third = "{name} met Gritta Chumwater, the blunt goblin who sells fishing supplies at Powderfuse Port.",
  },

  greetings = {
    { id = "g_default", text = "Chum's fresh, or as fresh as chum gets." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's squint, good. The catfish up the rivers bite like dogs, so you'll want a better pole." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gritta Chumwater. I sell chum, lures, fish and advice, and only the advice is free." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You can carry crates, then, so if you're standing around, you might as well be useful." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want to bless the fish, I suppose, but they're dead already, so don't bother." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Keep your animal off my fish, or I'll sell it as bait." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "I know that look. My fish aren't worth stealing, and my till's empty, so move along." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest. Sailors ask me to say a word over the nets sometimes, so you tell them it's your job, not mine." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. If you've a word for the sea, tell it to send the fish closer to shore." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Can you keep fish cold? Ice costs me more than the fish do, and I'd pay you to keep a crate frozen." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Keep your pet away from the chum. It's for fish, not for whatever that is." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be wanting to tell me I'm overfishing, so go on and get it over with." },
      },
      again = { { id = "h_again", text = "What else? Buy something while you think." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "fishing" },
        { text = "Who buys chum?", next = "chum" },
        { text = "What do you need carried, Gritta?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you ever pray before going out to sea?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where are the big catfish biting?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What about your lures? Those look worth something.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the sailors here lose many to the sea?", next = "xpriestcl", when = { class = "PRIEST" } },
        { text = "The sea doesn't take requests, Gritta.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I could freeze your crates, for a price.", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon has no interest in your chum.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Are you overfishing, Gritta?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Chum barrels to Argo's boat, fish to Fimbo's kitchen, and my patience to the end of the day, which is the heaviest of the three. Fishing's a war too, you know, only the enemy's got fins and no manners." } },
      choices = {
        { text = "I'll carry it. Honest work's worth doing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pay me first. I don't haul for free.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I check the weather, the nets and the boat, in that order, and then I go. Praying's for people who didn't check the weather." } },
      choices = {
        { text = "Preparation and prayer both have their place.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair. Good planning beats prayer every time.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up the rivers, where the water's brown and quick, and they bite like dogs. I'll sell you a pole that can take one, but it'll cost you, because the cheap ones snap." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours has been eyeing my catfish since you walked up. One bite and it's yours, at full price." },
      },
      choices = {
        { text = "Fish only what you'll eat. The rivers aren't endless.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Pull out every catfish you can, and sell the rest.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They're worth more than you are, and I know exactly how many I've got. Take one, and I'll know, and I'll tell Melbin, and then you'll be paying rent for the rest of your life." } },
      choices = {
        { text = "Fair enough. I'll buy them like anyone else.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Melbin doesn't scare me, and neither do you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriestcl = {
      big = true,
      lines = { { id = "xpriestcl_default", text = "Enough that I keep count, and I don't like counting. Argo's monster takes some, the storms take more, and drink takes the rest, which is the only one you can do anything about." } },
      choices = {
        { text = "Then I'll pray for the lost, and for the living.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayers won't help. Better boats and less rum will.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everybody takes requests if you ask nicely and pay up front, that's what I've always found. The sea's just harder to pay, but I throw it a fish now and then, and it seems to like that." } },
      choices = {
        { text = "An offering shows respect. Keep it up.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea doesn't care. Save your fish for selling.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For a price, says the mage, as if I've got any money left after the ice-seller's done with me. Fine, we'll talk terms, but I'm not giving away the good fish for it, and that's final." } },
      choices = {
        { text = "Fair enough. A fair price for fair work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll freeze the ice-seller out of business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Good, because it's the only thing on this dock I'm proud of. Twelve kinds of bait in one barrel, and the fish come three miles in for it, so tell your friend to keep its claws to itself." } },
      choices = {
        { text = "I respect the craft. I'll keep it away.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it wants chum, it'll have chum.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "No, and you can ask the catfish yourself if you like. I take what sells and leave the rest, and the rivers are as full as ever, which is more than I can say for the land around here." } },
      choices = {
        { text = "Then keep it that way. The rivers will thank you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Take more. The war will poison them anyway.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing = {
      lines = { { id = "f_default", text = "Where the rivers come down to the sea. The catfish up there have whiskers like Melbin's, but don't tell him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chum = {
      lines = { { id = "c_default", text = "Fimbo buys it for soup and Argo for his monster. I don't ask which pot it ends up in, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've fished every coast a boat can reach, and came here because the fish are stupider. Don't tell them." } },
    advice = { { id = "tp_ad", text = "Fish at dawn, sell by noon, and never eat what you can't name." } },
    _none = { { id = "tp_none", text = "Fish don't talk about that, so neither do I." } },
  },
}
