-- Stonard's stable and stalls: Hekkru the stable master, Thultash's food and drink, Thultazor's reagents, Hartash's weapons, Grimnal's mail and plate and Thralosh's cloth and leather. Voice: bibles/stonard_traders.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thultash", id = TODO_NPC("Thultash"), name = "Thultash", title = "Food & Drink",
  bible = "bibles/stonard_traders.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "jovial", "grumbling" }, values = { "practical", "generous" },
  notices = { "weary", "race" },

  impression = {
    first = "Thultash sells food and drink in Stonard and complains about the supply caravans the way other orcs complain about the weather. Tok'Kar on the beach blames him for every drunk soldier, and Thultash seems rather proud of that.",
    third = "{name} met Thultash, who sells food and drink in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Everyone who comes out of that swamp is hungry, so step up and I'll see you fed." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good, because the meat won't keep much longer in this damp." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for supper, but I've a few things left that won't kill you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the swamp swallowed you and changed its mind. Eat something before you try that again." },
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's people at my stall. I never know whether to offer you a meal or apologize for not having anything you'd want." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thultash, and I feed Stonard, near enough. Karakul cooks for the great hall and Tok'Kar for the beach, and I sell everything in between, the bread and the meat and the drink that keeps the grunts on the walls from going mad." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear! I've a crate of dried fish a troll once swore tasted like the Echo Isles, though I think he was being kind, or homesick." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and you'll want something that isn't meat, I suppose. I've bread, and I've more bread, and I'm sorry to say that's the whole list." },
      },
      again = {
        { id = "h_again", text = "Anything else, or just the food?" },
        { id = "h_again2", text = "Go on, I'm not going anywhere till the stock's sold." },
      },
      choices = {
        { text = "Let me see what you've got.", next = "BUSINESS" },
        { text = "Where does all this food come from?", next = "supply" },
        { text = "Why does Tok'Kar blame you for the drinking?", next = "drink" },
        { text = "What's good to eat out here?", next = "eats" },
        { text = "Farewell, Thultash.", next = "END" },
      },
    },

    supply = {
      lines = {
        { id = "su_default", text = "Up from Grom'gol, with Commander Aggro'gosh's lot guarding the wagons, through the jungle and past Deadwind Pass, which is a road nobody enjoys. When the caravan's late, Stonard eats crocolisk, and when it's very late, Stonard eats whatever the hunters bring back and doesn't ask." },
      },
      choices = {
        { text = "What happens if the caravan never comes?", next = "supply_late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_late = {
      lines = {
        { id = "sl_default", text = "Then I start rationing, and I've done it before, and the grunts call me every name they know. I keep a store back that nobody knows about, because hungry soldiers don't hold walls, and a quartermaster who shares everything at once is a fool." },
      },
      choices = {
        { text = "A hidden store is wise. Hunger breaks discipline.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Tell Commander Ruag. Secrets like that cause trouble.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drink = {
      lines = {
        { id = "dk_default", text = "Because I sell it and his soldiers buy it, and he'd rather blame me than the swamp. Katar says he needs soldiers who don't drink, and I say show me a soldier on that beach who wouldn't, after a week of murlocs." },
      },
      choices = {
        { text = "Should you stop selling to his soldiers?", next = "drink_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_stop = {
      lines = {
        { id = "ds_default", text = "I've thought about it, I'll admit, but then they'd only brew their own out of swamp water and fungus, and I've tasted what grunts brew. Better they drink mine, in measure, than go blind on theirs." },
      },
      choices = {
        { text = "Orders are orders. Stop selling to the beach patrol.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A soldier's drink is his own business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    eats = {
      lines = {
        { id = "lo_default", text = "Crocolisk is tough but filling, jaguar is better if you can get it, and I'd stay away from anything that came out of the Pool of Tears. The frogs, I'm told, are a delicacy among trolls, though not one of them has ever bought one from me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll take the crocolisk, then.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cooked for a warband once, and they all came home, so I like to think the food had something to do with it." } },
    advice = { { id = "tp_ad", text = "Never go into the swamp on an empty stomach. It knows, somehow." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me what's in the pot instead." } },
  },
}

P:NPC {
  key = "thultazor", id = TODO_NPC("Thultazor"), name = "Thultazor", title = "Alchemy Supplies & Reagents",
  bible = "bibles/stonard_traders.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "fussy", "precise" }, values = { "careful", "proud" },
  notices = { "class", "craft" },

  impression = {
    first = "Thultazor sells vials and reagents in Stonard and wages a private war against the damp that gets into his powders. He takes his glassware more personally than most orcs take their axes.",
    third = "{name} met Thultazor, the fussy reagent seller of Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Don't lean on the shelves. The damp's bad enough without your elbows in it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Everything's where you left it, and dry, which I'd like you to appreciate." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll want powders, and I keep mine sealed in wax against the damp, so don't complain about the price." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, so you'll want vials, and you'll want them not to crack. Mine won't, whatever Rartar says about them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thultazor. I sell vials for the alchemists and reagents for the spellcasters, and I keep both dry, which in this swamp is very nearly a kind of magic itself." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman. You'll want ankhs, I expect, and I keep them by the dozen, because shamans out here seem to need them more often than anywhere else." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. I've candles that will hold their wick in this damp, if you're careful how you light them." },
      },
      again = {
        { id = "h_again", text = "Something else? Mind the shelves." },
        { id = "h_again2", text = "Go on, but keep your hands where I can see them." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "How do you keep anything dry out here?", next = "damp" },
        { text = "You and Rartar sell the same vials, don't you?", next = "rartar" },
        { text = "Who buys reagents in a place like this?", next = "customers" },
        { text = "Good day.", next = "END" },
      },
    },

    damp = {
      lines = {
        { id = "da_default", text = "Wax, oilcloth, and more swearing than a grunt at drill. Powders clump and candles weep, and a crate that sits a day on the ground draws water up like a sponge, so everything I own lives on shelves and nothing I own touches the floor." },
      },
      choices = {
        { text = "Has the damp ever ruined a whole shipment?", next = "damp_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp_lost = {
      lines = {
        { id = "dl_default", text = "Once, when the caravan was caught in the rain at Deadwind Pass and the guards stacked my crates under the meat. Thultash got his meat dry and I got a crate of grey paste, and I still haven't entirely forgiven him." },
      },
      choices = {
        { text = "It was an accident. Let it go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He owes you for that. Make him pay.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rartar = {
      lines = {
        { id = "ra_default", text = "We sell vials, but not the same vials, whatever Rartar tells people. Mine are packed in straw and sealed, and his crack if you look at them unkindly, though I'll grant they come off the same wagon." },
      },
      choices = {
        { text = "So they're the same vials?", next = "rartar_same" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rartar_same = {
      lines = {
        { id = "rs_default", text = "They leave Grom'gol the same, and they arrive different, because I care for mine and he doesn't. That's the whole difference between a merchant and a man with a stall, and I'd thank you not to repeat that to him." },
      },
      choices = {
        { text = "Care is worth paying for. I'll buy from you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    customers = {
      lines = {
        { id = "cu_default", text = "Shamans buying ankhs, mages buying powder, Rogvar's students buying vials by the crate and breaking half of them, and once a warlock who wanted something I don't sell and won't name. The swamp draws spellcasters like flies, all of them on their way to the temple or the Portal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll be one more, then.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I kept a supply tent in the Barrens before this, and the Barrens are dry. I didn't know how good I had it." } },
    advice = { { id = "tp_ad", text = "Keep your reagents off the ground and your temper off the shelves." } },
    _none = { { id = "tp_none", text = "If I don't sell it, I don't know about it, and I don't sell that." } },
  },
}

P:NPC {
  key = "hartash", id = TODO_NPC("Hartash"), name = "Hartash", title = "Weapon Merchant",
  bible = "bibles/stonard_traders.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "boastful" }, values = { "proud", "practical" },
  notices = { "kit", "class" },

  impression = {
    first = "Hartash sells weapons in Stonard and fights the rust on every blade as if it were an enemy at the gate. He thinks the Dreadmaul ogres are a fine reason to buy a bigger axe, and says so.",
    third = "{name} met Hartash, the weapon merchant of Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Looking for steel? Everything on this rack is oiled this morning, because the swamp eats it otherwise." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior! Come and pick up the Great Axe, and tell me it doesn't feel like it belongs in your hands." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Has your blade started to rust yet? It will." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your weapon's notched and your gear's half rotted. I can mend it, but you'll have to stand still while I do and not drip on the anvil." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hartash, and I sell weapons to anyone in Stonard who means to keep breathing. Falchions, morning stars, a Zweihander if you've the shoulders, and a Great Axe that would make a Dreadmaul think twice about coming up the road." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue. You'll want the rondel, I suppose, which is a fine dagger for slipping between an ogre's ribs, though you'll need a long reach to find them under all that fat." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman. The war maul's a good weight for you, or the morning star, if you like to have a hand free for your totems." },
      },
      again = {
        { id = "h_again", text = "Anything else? The rack's not getting any drier." },
        { id = "h_again2", text = "Go on, ask, and pick something up while you do." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Does the rust really get that bad?", next = "rust" },
        { text = "Who are you arming against out here?", next = "ogres" },
        { text = "Do the warrior recruits buy from you?", next = "recruits" },
        { text = "Farewell.", next = "END" },
      },
    },

    rust = {
      lines = {
        { id = "ru_default", text = "Leave a blade unoiled for a week in Stonard and you'll come back to a stick with an orange crust on it. I oil every edge on this rack each morning, and I tell every buyer to do the same, and half of them come back a month later looking ashamed." },
      },
      choices = {
        { text = "What oil do you use?", next = "rust_oil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rust_oil = {
      lines = {
        { id = "ro_default", text = "Crocolisk fat, rendered down, because it's the one thing this swamp has plenty of. It stinks to the sky, but nothing sticks to it, not water, not rust, and not, I'm sorry to say, the smell." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll oil mine tonight.", next = "END" },
      },
    },

    ogres = {
      lines = {
        { id = "og_default", text = "The Dreadmaul, mostly, who hold Rockard now, which was Stonard's sister town in the old Horde's day. They come up out of the Blasted Lands with clubs like tree trunks, and a little sword just makes them laugh." },
      },
      choices = {
        { text = "Should the Horde take Rockard back?", next = "ogres_rockard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_rockard = {
      lines = {
        { id = "or_default", text = "Every grunt in the great hall says so after his third drink, and Commander Ruag says we've neither the warriors nor the reason. I say I'd sell a great many axes either way, so I keep my opinion to myself and my prices fair." },
      },
      choices = {
        { text = "Rockard was ours. The Horde should take it back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the ogres keep their ruin. Stonard's enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    recruits = {
      lines = {
        { id = "rc_default", text = "They do, and they all want the biggest thing on the rack, and Malosh, their trainer, sends them back to buy something they can actually lift. I don't mind, because I sell them twice that way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll take something I can lift.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I hauled steel for the Warchief's smiths in Orgrimmar until they sent me somewhere it rusts. I think it was a joke." } },
    advice = { { id = "tp_ad", text = "Oil your blade before you sleep. The swamp doesn't sleep." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about an edge." } },
  },
}

P:NPC {
  key = "grimnal", id = TODO_NPC("Grimnal"), name = "Grimnal", title = "Mail & Plate Merchant",
  bible = "bibles/stonard_traders.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "dour", "stubborn" }, values = { "proud", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "Grimnal sells mail and plate in a swamp where everyone sinks in it, and he's heard every joke about that. He argues with Thralosh across the square about whether armor or speed keeps a soldier alive.",
    third = "{name} met Grimnal, who sells mail and plate in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Plate and mail, brigandine and platemail, and a shield or two. Don't listen to Thralosh across the square, who sells leather." },
    { id = "g_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Now there's someone built to wear proper armor. Come and try the platemail on." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still alive, which I'll put down to good armor whether or not you bought it here." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's taken a beating, and from the look of the dents, something big did it. Let me see to that before it gives out on you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grimnal. I sell brigandine for those who want to move and platemail for those who want to live, and a crested heater shield that's turned more ogre clubs than I can count. Thralosh will tell you plate's too heavy for the swamp, and Thralosh is wrong." },
        { id = "h_hunter", when = { class = { "HUNTER", "SHAMAN" } },
          text = "Brigandine's the thing for you, mail that bends when you do, and it'll stop a jaguar's claws if you've any sense in how you stand. Don't let Thralosh talk you into leather." },
      },
      again = {
        { id = "h_again", text = "Something else? The armor's not going to sell itself." },
        { id = "h_again2", text = "Ask away, while I polish." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Doesn't plate sink in this mud?", next = "sink" },
        { text = "What's the quarrel with Thralosh?", next = "thralosh" },
        { text = "Has your armor ever failed someone?", next = "failed" },
        { text = "Farewell, Grimnal.", next = "END" },
      },
    },

    sink = {
      lines = {
        { id = "si_default", text = "It does, if you stand about in it like a fool, and every grunt's heard the story of the one who went into the Pool of Tears in full plate. He came out again, I'll have you know, slowly, and he's alive today because the murlocs couldn't get their spears through." },
      },
      choices = {
        { text = "Slow and alive beats fast and dead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather be quick. Armor can't dodge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thralosh = {
      lines = {
        { id = "th_default", text = "He sells leather and cloth and calls it armor, and he tells every soldier that speed keeps you alive in the swamp. I tell them that speed is what you need when your armor's too thin to stand and fight, and we've been saying it across the square for years." },
      },
      choices = {
        { text = "Do you two actually dislike each other?", next = "thralosh_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thralosh_truth = {
      lines = {
        { id = "tt_default", text = "No, and don't tell him I said so, because the argument's good for business. We drink together at Karakul's once a week and argue about it there as well, and neither of us has ever lost." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    failed = {
      lines = {
        { id = "fa_default", text = "Armor doesn't fail, it gets beaten, and I've seen a crested shield split by a Dreadmaul club the size of a log. The grunt behind it lived, with a broken arm, and he came back and bought another one, which is all the answer I need." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll buy a shield.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I wore plate in the war and lived, so I sell plate now. It's a simple life." } },
    advice = { { id = "tp_ad", text = "Keep your feet moving in heavy armor, and the mud can't get a grip on you." } },
    _none = { { id = "tp_none", text = "That's not armor, so I don't know about it. Ask Thralosh, he knows about everything soft." } },
  },
}

P:NPC {
  key = "thralosh", id = TODO_NPC("Thralosh"), name = "Thralosh", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/stonard_traders.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "wry", "easygoing" }, values = { "practical", "clever" },
  notices = { "class", "kit" },

  impression = {
    first = "Thralosh sells cloth and leather in Stonard and swears speed keeps a soldier alive in the swamp. He and Grimnal across the square have been arguing about it for years, and he seems to enjoy it.",
    third = "{name} met Thralosh, who sells cloth and leather armor in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Light armor for a heavy swamp. Come and see something you can actually move in." },
    { id = "g_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A spellcaster! You'll want cloth, and I've cloth that won't rot on your back by the end of the week." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still nimble, I see. Grimnal's customers should be so lucky." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's half falling off you. That's the swamp, friend, it eats stitching, so let's see what can be done." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thralosh, and I sell cloth and leather, which is what anyone with sense wears in a swamp. Grimnal across the way will tell you plate keeps you alive, but plate also keeps you standing still while the crocolisks decide which end to start on." },
        { id = "h_rogue", when = { class = { "ROGUE", "DRUID" } },
          text = "Now here's someone who knows the value of quiet feet. Leather that doesn't creak is worth its weight in gold out here, and mine doesn't." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not in a hurry, unlike my customers." },
        { id = "h_again2", text = "Go on, ask, and ignore whatever Grimnal's shouting." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why leather, in a swamp?", next = "leather" },
        { text = "Grimnal says plate keeps you alive.", next = "grimnal" },
        { text = "Farewell.", next = "END" },
      },
    },

    leather = {
      lines = {
        { id = "le_default", text = "Because it dries, and plate rusts, and because a soldier who can run through the reeds lives longer than one who can't. I cure my leather with crocolisk oil so the water rolls off it, and the smell fades within a month or two." },
      },
      choices = {
        { text = "A month or two?", next = "leather_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_smell = {
      lines = {
        { id = "ls_default", text = "Or three, but in Stonard nobody notices, because everyone smells of crocolisk anyway. Hartash oils his blades with it and Grimnal his joints, so whatever he tells you, the whole square smells the same." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll take the smell, then.", next = "BUSINESS" },
      },
    },

    grimnal = {
      lines = {
        { id = "gr_default", text = "He would, and he's been saying it for years, and he'll keep saying it until the swamp swallows his shop. Plate keeps you alive if you stand and fight, but out here half the fighting is getting away from what you can't fight." },
      },
      choices = {
        { text = "A soldier stands his ground. Running isn't fighting.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Living to fight tomorrow is the smarter war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Do you two actually hate each other?", next = "grimnal_truth" },
      },
    },
    grimnal_truth = {
      lines = {
        { id = "gt_default", text = "Hate him? He's the best drinking companion in Stonard, and he's never once paid for a round, which is the only thing about him I'd truly complain of. Don't tell him I said he was the best, though, because he'll be unbearable." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "My lips are sealed.", next = "END", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I tanned hides in the Barrens before this, and the hides there were dry. Everything was dry, now that I think of it." } },
    advice = { { id = "tp_ad", text = "Wear what lets you run, and know when to run in it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask me about leather, and I'll have plenty to say." } },
  },
}
