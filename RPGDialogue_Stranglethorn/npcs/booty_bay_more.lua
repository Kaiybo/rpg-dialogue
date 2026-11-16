-- More of Booty Bay: the flight masters, the banker and the shopkeepers of the cove. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "gyll", id = TODO_NPC("Gyll"), name = "Gyll",
  title = "Gryphon Master",
  bible = "bibles/stranglethorn.md", role = "flightmaster", tier = "service",
  communities = { "booty_bay" }, temper = { "dry", "steady" }, values = { "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "Gyll keeps the Alliance gryphons on a cliff ledge above a pirate harbor and seems to find that perfectly normal. Gryphons and pirates, Gyll says, both bite if you look at them wrong.",
    third = "{name} met Gyll, who keeps the Alliance gryphons on the cliffs of Booty Bay.",
  },

  greetings = {
    { id = "g_ledge", text = "Gryphons for the Alliance, this side of the ledge. Wind riders are round the other side, and we don't mix the birds." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the cove? The birds were starting to miss the weight." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good; you'll know to hold the harness and not the feathers. Half my passengers grab the feathers, and then the bird sulks for a week." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You're green round the edges. Sit down a moment before you climb up, because if you're sick over the jungle, the bird will never let you forget it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gyll, gryphon master. I fly Alliance folk out of Booty Bay to the north, and I keep my birds fed on fish, which they hate, because the Baron charges a fortune for anything else." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "These are Alliance birds, friend, and they'll not carry you. Your wind riders are round the other side of the ledge, and the walk does you good." },
      },
      again = {
        { id = "h_again", text = "Anything else? The gryphons hate this salt air, so let's not keep them waiting." },
        { id = "h_again2", text = "Ask away. The birds are digesting." },
      },
      choices = {
        { text = "Show me the routes.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Gryphons and wind riders, side by side?", next = "neighbors" },
        { text = "How do the birds like the jungle heat?", next = "heat" },
        { text = "Your birds could carry me, couldn't they?", next = "x_horde", when = { faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "Side by side and not a feather's width closer. The Baron says this is a neutral port, so it is, and both of us pay him for the ledge and both of us pretend the other isn't there." },
      },
      choices = {
        { text = "Does it ever come to blows?", next = "neighbors_blows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_blows = {
      lines = {
        { id = "nb_default", text = "Once, over a fish, between the birds and not the masters. The Bruisers fined us both, and Gringer and I have been very polite to each other ever since." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = {
        { id = "ht_default", text = "They pant like dogs from noon till sunset, so I fly them early and late and keep wet sailcloth over the perches. A gryphon wasn't built for this coast, but then neither was I." },
      },
      choices = {
        { text = "You both manage, though.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_horde = {
      lines = {
        { id = "xh_default", text = "They could, but they won't, and I'll not ask them to. A gryphon knows who it's carrying, and you'd end up in a tree somewhere north of the Vile Reef wondering what went wrong." },
      },
      choices = {
        { text = "Wind riders it is, then.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I flew birds out of the north until someone offered better pay to fly them out of a pirate cove. I'm still deciding if it was worth it." } },
    advice = { { id = "tp_ad", text = "Fly out at dawn. By noon the air off the jungle is thick enough to swim in." } },
    _none = { { id = "tp_none", text = "Ask somebody with their feet on the ground. I spend mine looking up." } },
  },
}

P:NPC {
  key = "gringer", id = TODO_NPC("Gringer"), name = "Gringer",
  title = "Wind Rider Master",
  bible = "bibles/stranglethorn.md", role = "flightmaster", tier = "service",
  communities = { "booty_bay" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "race" },

  impression = {
    first = "Gringer keeps the Horde's wind riders on the same ledge as the Alliance gryphons and has opinions about both. The beasts seemed to trust him more than he trusts anybody.",
    third = "{name} met Gringer, the wind rider master of Booty Bay.",
  },

  greetings = {
    { id = "g_ledge", text = "These wind riders carry the Horde and nobody else. Stand clear of the tails, because the stingers aren't for show." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, the beasts like a familiar smell." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big one, aren't you? The riders will carry you, but they'll groan about it the whole way to Grom'gol, so don't take it personally." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Bloodsail have taken to firing their swivel guns at anything with wings, and a rider can't dodge grapeshot. The Alliance gryphons get it too, round the other side of the ledge, but I'll not pretend that troubles me." } },
      choices = {
        { text = "Good. Let them waste their shot on gryphons.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Gryphon or wind rider, no beast deserves grapeshot.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Everybody, because this is Booty Bay, but there's a goblin on the boardwalk who writes down every flight I send north. I've a feeling it's not the Baron he writes for, and I'd like to know whose purse he's filling." } },
      choices = {
        { text = "I'll find out who he reports to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make his notebook disappear, and him with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The storms off the sea come up fast, and a wind rider caught in one comes down where it likes, which is never anywhere good. I lost a rider over the Vile Reef last season, and I can still hear the beast screaming." } },
      choices = {
        { text = "I'll ask the air spirits to calm the coast for your riders.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Riders die. The wind doesn't care, and neither should you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders settle when one of you is near, so stand by them if you like, but don't feed them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The beasts smell the grave on the Forsaken and the loa on the trolls, and they like neither, so come up slowly." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. You could teleport home and spare my riders the trip, but you won't, because that costs you reagents and this costs you gold." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Keep your beast away from my riders; the last imp up here set a saddle smouldering and got a stinger for it." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came up the ledge without me hearing. Do that around the riders and you'll get a tail through the ribs, so whistle next time." },
        { id = "h_default", key = true,
          text = "Gringer. I keep the Horde's wind riders on this ledge and fly them up the coast to Grom'gol and over to the swamp at Stonard. Gold first, questions after, and don't feed them anything." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Wrong side of the ledge, friend. Your gryphons are round with Gyll, and my riders don't care for the smell of Stormwind." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick; they get restless." },
        { id = "h_again2", text = "Go on, then, ask." },
      },
      choices = {
        { text = "Do the winds over the jungle ever turn against your riders?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threatens your riders along the coast, Gringer?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who watches the Horde's riders come and go from Booty Bay?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me the routes.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "What's the trouble on the coast road?", next = "road" },
        { text = "How do you get on with Gyll?", next = "gyll" },
        { text = "Flying sits badly with my people.", next = "x_scourge", when = { race = "Scourge" } },
        { text = "Not today.", next = "END" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Trolls in the hills, raptors in the grass and Bloodsail on the beaches. That's why people fly, and why I've more customers than riders on a busy day." },
      },
      choices = {
        { text = "Grom'gol can't keep the road clear?", next = "road_gromgol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_gromgol = {
      lines = {
        { id = "rg_default", text = "Commander Aggro'gosh tries, and he's got the caravans to Stonard to worry about besides. A road through this jungle grows back faster than you can clear it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gyll = {
      lines = {
        { id = "gy_default", text = "We nod. The Baron's ledge, the Baron's peace, and the Bruisers see to the rest, so we nod every morning and keep our beasts at opposite ends." },
      },
      choices = {
        { text = "That's sensible.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_scourge = {
      lines = {
        { id = "xs_default", text = "Bats sit better with your lot, I know. But there are no bats here, so you'll ride a wind rider and you'll like it, and if anything falls off on the way, I'm not going back for it." },
      },
      choices = {
        { text = "I'll hold on tight.", next = "BUSINESS", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the beasts at Orgrimmar and came south for the money, and the money is why I stay." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, not even once, not even for a moment." } },
    _none = { { id = "tp_none", text = "I fly beasts, I don't answer riddles. Try the tavern." } },
  },
}

P:NPC {
  key = "viznik", id = TODO_NPC("Viznik Goldgrubber"), name = "Viznik Goldgrubber",
  title = "Banker",
  bible = "bibles/stranglethorn.md", role = "banker", tier = "service",
  communities = { "booty_bay" }, temper = { "smooth", "careful" }, values = { "greedy", "lawful" },
  notices = { "purse" },

  impression = {
    first = "Viznik Goldgrubber spoke of my savings with more affection than most people show their families. The vault is the safest place in a pirate town, and Viznik never lets anyone forget it.",
    third = "{name} met Viznik Goldgrubber, a banker of Booty Bay who serves both Horde and Alliance.",
  },

  greetings = {
    { id = "g_vault", text = "Welcome, welcome! Your valuables are safe with the Steamwheedle; safer than with you, frankly." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! My favorite kind, after the rich kind." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "My, my, that purse has a lovely weight to it. Have you considered how much lovelier it would look in a vault?" },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A mage blinked into the vault once, years ago, and the vault blinked back. We've had wards on every wall since, and I'm told he's still somewhere in the Twisting Nether, which makes an excellent deterrent." } },
      choices = {
        { text = "He broke the rules, and he paid for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wards can be broken. You'll learn that someday.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Totems, mostly, and the occasional carved stone that I'm instructed never to touch. I don't ask what they do, because the Cartel's first rule is discretion, and its second is fees." } },
      choices = {
        { text = "Discretion is a fair rule. I'll respect your vault's laws.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for goblins. My totems stay where I choose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman of the Horde. Your coin is welcome here, and so are you, provided the lightning stays outside the vault." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! The Cartel holds relics for many faiths, all of them insured and none of them guaranteed, and yours would be in very good company." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. We've a special vault for reagents that shouldn't touch each other, and a special fee to go with it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock, how lovely. We'll store your shards, but there is a surcharge on anything that whispers." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Ah. Your account is welcome here, friend, but my vault has three locks, and I'm the only one with all three keys." },
        { id = "h_default", key = true,
          text = "Viznik Goldgrubber, banker to the Steamwheedle and to anyone with something worth keeping. Horde, Alliance, pirate or priest, your coin is all the same color to me." },
        { id = "h_rep", when = { reputation = { faction = "Steamwheedle Cartel", min = "honored" } },
          text = "A friend of the Cartel! The Baron speaks well of you, which costs him nothing, so I'll speak well of you too." },
      },
      again = {
        { id = "h_again", text = "Anything else I can hold for you? Coins, secrets, small cursed objects?" },
        { id = "h_again2", text = "More questions? Banking is a patient art." },
      },
      choices = {
        { text = "What do shamans usually keep in a Steamwheedle vault?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Has anyone ever tried to rob a Steamwheedle vault with magic?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "How safe is a bank in a pirate town?", next = "safe" },
        { text = "You serve both factions?", next = "both" },
        { text = "Do you ever look in the vaults?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    safe = {
      lines = {
        { id = "s_default", text = "Safer than anywhere else in the South Seas. Every pirate in the cove keeps his coin with us, so every pirate in the cove has a reason to keep this vault standing." },
      },
      choices = {
        { text = "Even the Bloodsail?", next = "safe_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_bloodsail = {
      lines = {
        { id = "sb_default", text = "Officially, no, since the Baron would have my ears. Unofficially, gold doesn't come with a bandana, and I never ask where a coin has been before it reaches me." },
      },
      choices = {
        { text = "Coin is coin. Smart business.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "That's how pirates get rich off honest folk.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = {
        { id = "b_default", text = "Of course! War is expensive, and expensive things need banks. I'd serve the Scourge if they paid their fees, though I hear they're poor savers." },
        { id = "b_horde", when = { faction = "Horde" },
          text = "Of course, and your gold sits two shelves from an Alliance captain's. Neither of you knows which shelf, and that's how we like it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Never, and neither will you. The last fellow who tried found out why the Baron hires so many Bruisers, and why the Bruisers are so very large." },
      },
      choices = {
        { text = "Just curious.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born to the Cartel, trained in the vaults, and never once robbed. Twice almost, but almost isn't robbed." } },
    advice = { { id = "tp_ad", text = "Never carry more gold than you can afford to lose to a raptor." } },
    _none = { { id = "tp_none", text = "If it doesn't earn interest, I don't keep track of it." } },
  },
}

P:NPC {
  key = "jutak", id = TODO_NPC("Jutak"), name = "Jutak",
  title = "Blade Trader",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "class" },

  impression = {
    first = "Jutak trades in blades, and somehow every one of them comes with a story about a famous owner. I believed perhaps a third of them, and I suspect Jutak would think that generous.",
    third = "{name} browsed Jutak's blades in Booty Bay, each one sold with a story.",
  },

  greetings = {
    { id = "g_blades", text = "Every blade on this wall is sharp, and most of them are old. Look all you like, but keep your hands behind your back." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You hold your weight like someone who's used a blade more than once. Good; I prefer selling to people who'll appreciate the edge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jutak, trader in blades. Every sword that comes through this harbor passes my counter sooner or later, off a sailor short of rent or a pirate short of luck." },
        { id = "h_back", when = { metBefore = true },
          text = "You're back! I've a new cutlass in since you were here, from a Bloodsail who no longer needs it, for reasons I don't ask about." },
      },
      again = { { id = "h_again", text = "What else? Mind your fingers on the counter." } },
      choices = {
        { text = "Let me see the blades.", next = "BUSINESS" },
        { text = "Where do the blades come from?", next = "source" },
        { text = "Which is the best blade here?", next = "best" },
        { text = "A shaman's axe would serve me better.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Later.", next = "END" },
      },
    },
    source = {
      lines = {
        { id = "s_default", text = "Sailors, mostly, and the Blackwater lads after a fight with the Bloodsail. Some of these blades have changed hands more times than a gambling debt at MacKinley's table." },
      },
      choices = {
        { text = "Any of them stolen?", next = "source_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_stolen = {
      lines = {
        { id = "ss_default", text = "Stolen is a strong word in a pirate town. I'd say they were freed, and if you find your old sword on my wall, I'll sell it back to you at a fair price." },
      },
      choices = {
        { text = "That's pure robbery, Jutak.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Finders keepers. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "The one you can afford, friend. Anything better than that goes to Zarena next door, who'll forge you something new, if you've the gold for new." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Axes and maces are round the back, where the Horde captains look. A shaman with a good axe and the storm behind it is worth any three of the cutlass boys out on the pier." },
      },
      choices = {
        { text = "Show me the axes, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I started out buying swords off drunks, and I still do; I just pay a little more now." } },
    advice = { { id = "tp_ad", text = "Oil your blade every night down here. The sea air rusts steel quicker than any troll can blunt it." } },
    _none = { { id = "tp_none", text = "If it hasn't got an edge, I've no opinion on it." } },
  },
}

P:NPC {
  key = "zarena", id = TODO_NPC("Zarena Cromwind"), name = "Zarena Cromwind",
  title = "Superior Weaponsmith",
  bible = "bibles/stranglethorn.md", role = "blacksmith", tier = "service",
  communities = { "booty_bay" }, temper = { "proud", "blunt" }, values = { "proud", "practical" },
  notices = { "craft", "kit" },

  impression = {
    first = "Zarena Cromwind sells new steel in a town that mostly trades in secondhand cutlasses, and she makes certain everyone knows the difference. Her work is good enough that the boasting hardly matters.",
    third = "{name} met Zarena Cromwind, the weaponsmith who sells fine new steel in Booty Bay.",
  },

  greetings = {
    { id = "g_forge", text = "My steel is new, properly forged and priced to match. If you want rust and a story, Jutak's next door." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's forearms and a smith's burns. Look all you like; you'll know quality when you see it, which is more than most of my customers can say." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's falling to pieces, and the jungle won't wait for you to mend it. Get to a smith before you leave the cove." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Everything I forge holds one, because good steel takes a spell the way bad steel takes rust. Jutak's blades will crack the first time you put a glow on them, and I'll be glad to tell you so when they do." } },
      choices = {
        { text = "Quality costs. I'll pay your price.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll buy from Jutak and take my chances.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Once, and I caught him with a hammer before he reached the door, so now he works the bellows for me on Tuesdays. He's better at it than he was at stealing, and I think he knows it." } },
      choices = {
        { text = "Fair enough. You settled it your own way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A thief belongs in the Bruisers' cells, not your forge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A tauren once had me forge a mace with a socket for a stone, which she said held a spirit of the earth. I charged her double for the socket and didn't argue about the spirit, and we both went away happy." } },
      choices = {
        { text = "A weapon should honor the spirit it carries.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A weapon kills, and that's all it ever needs to do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want a mace or an axe, then, because I've seen your lot swing both, and you swing them like you mean it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Most of your kind want a mace and an apology, and I only sell the mace." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage in a weaponsmith's? A staff, then, and I'll make it heavy enough to settle an argument after your mana runs dry." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll sell you a dagger, but keep it out of your rituals, because I don't want it coming back with anything on it." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "A rogue, by the look of you. I've daggers, but don't you dare compare them to Jutak's rubbish next door; mine are new." },
        { id = "h_default", key = true,
          text = "Zarena Cromwind. I sell the best steel south of Stormwind and north of nowhere, to anyone who'll pay for it. Sailors rust, pirates break and I get rich, so it's a fair arrangement." },
      },
      again = { { id = "h_again", text = "Need something more? Mind the sparks, and know the sea air rusts whatever I don't keep hot." } },
      choices = {
        { text = "Have you ever forged a weapon for a shaman before?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you sell anything that holds an enchantment well?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Does anyone ever try to slip a blade out of your shop?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why set up shop in Booty Bay?", next = "why" },
        { text = "What's wrong with Jutak's blades?", next = "jutak" },
        { text = "Steel from the Horde forges is better.", next = "x_orc", when = { race = { "Orc", "Troll" } } },
        { text = "Do you sell to a smith?", next = "x_smith", when = { profession = "Blacksmithing" } },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because everyone in this cove fights, and nobody here can forge. The pirates break a blade a week, the Blackwater break two, and every adventurer through the shark's mouth wants something better than what they came with." },
      },
      choices = {
        { text = "Do you miss the north?", next = "why_north" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_north = {
      lines = {
        { id = "wn_default", text = "I miss the coal, which was cheaper and drier. I don't miss the guilds, who wanted a cut of every blade I made, and the Baron only wants a cut of the ones I sell." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jutak = {
      lines = {
        { id = "j_default", text = "Nothing, if you like a sword that's already killed its last three owners. He sells secondhand and I sell first-hand, and we send each other customers without either of us admitting it." },
      },
      choices = {
        { text = "So you're friends, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "Heavier, I'll grant you, and the Orgrimmar smiths know how to make a blade that frightens people. Mine are made to cut instead, so pick one up and see if you can tell me otherwise." },
      },
      choices = {
        { text = "Fine. Show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_smith = {
      lines = {
        { id = "xm_default", text = "To a smith I sell plans, if I've any spare, and opinions for free. Don't quench in seawater, whatever the dockhands tell you; it pits the steel and ruins the temper." },
      },
      choices = {
        { text = "Good advice. Thank you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned at a forge up north and came south when I'd learned enough to charge for it." } },
    advice = { { id = "tp_ad", text = "Buy the best blade you can afford once, not the cheapest blade you can afford six times." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't forge it, so I don't care." } },
  },
}

P:NPC {
  key = "narkk", id = TODO_NPC("Narkk"), name = "Narkk",
  title = "Pirate Supplies",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "jolly", "salesy" }, values = { "greedy" },
  notices = { "class" },

  impression = {
    first = "Narkk sells pirate costume to people who aren't pirates and seems to find that very funny. In a town full of real buccaneers, he dresses the tourists.",
    third = "{name} met Narkk, who sells pirate hats and finery in Booty Bay.",
  },

  greetings = {
    { id = "g_hats", text = "Come in, come in! I sell everything a fearsome buccaneer needs except the ship and the nerve." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Now you've got the look already, the skulk and the squint. All you need is the hat, and nobody in Booty Bay would ever ask questions." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Bloodsail keep a few sea witches, or so the sailors say, and that's why their ships always find a fog bank when the Blackwater come looking. I sell fake sea witch hats too, in a lovely black felt." } },
      choices = {
        { text = "I'd fight them face to face, fog or no fog.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fog's a clever trick. I'd use it myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Bloodsail spies, mostly, though they'd never admit it. They come in looking like dockhands and leave looking like Blackwater men, and I only charge them double, because I'm a patriot." } },
      choices = {
        { text = "Double? You should be charging them triple.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You're helping the Bloodsail walk right into town.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than you'd think, because a troll shaman in a captain's hat is the scariest thing on the pier. One bought my best tricorn last month and wore it while calling lightning down on a Bloodsail longboat, and I've never been prouder." } },
      choices = {
        { text = "A shaman should look like a shaman and keep the old ways.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why not? The elements won't mind a good hat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've got a hat with a feather that'd make your totems jealous, friend, and it's on sale today." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Even a holy sort needs a good hat in this sun, friend, and mine come with a feather at no extra charge." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! Picture yourself in a captain's coat, flinging fire off the bow. Now picture paying me for the coat." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! I've got an eyepatch that'd fit your imp, friend, and nobody else in the South Seas can say that." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Ah, a real scoundrel, I can always tell! Real pirates don't shop here, but you could, and you'd look the part." },
        { id = "h_default", key = true,
          text = "Narkk's Pirate Supplies, friend! Real pirates buy their kit off dead men, so I sell to everybody else who wants to look the part when they swagger down the pier." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Evening crowd's the best for business. Folk have a few rums at the Salty Sailor and suddenly they need a tricorn, very badly, right now." },
      },
      again = { { id = "h_again", text = "What else? Try on anything but the parrot; the parrot's mine." } },
      choices = {
        { text = "Do any shamans actually buy pirate hats from you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do real pirates ever use magic out here?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who actually buys your pirate gear, if not pirates?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Don't the real pirates mind?", next = "real" },
        { text = "Who buys this stuff?", next = "buyers" },
        { text = "A tauren in a pirate hat? Seahorn did it.", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Later.", next = "END" },
      },
    },
    real = {
      lines = {
        { id = "r_default", text = "The Blackwater lads think it's funny, and the Bloodsail think it's an insult, which makes it funnier. Only don't wear a red bandana out past the reef, or someone will mistake you for the wrong sort." },
      },
      choices = {
        { text = "Why not red?", next = "real_red" },
        { text = "Something else.", next = "BACK" },
      },
    },
    real_red = {
      lines = {
        { id = "rr_default", text = "Bloodsail colors, friend. First Mate Crazz would put a knife in you before you could explain, and then he'd feel terrible, but only a little." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Adventurers fresh off the boat, sailors who want to impress a girl in Ratchet, and once a very serious dwarf who wanted the biggest hat I had. I never asked why, and he never said." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Fleet Master Seahorn did, and look how far it got him! I'll have to cut holes for the horns, but I've done it before, and I've a hat in the back that's never fit anyone smaller than a ship's mast." },
      },
      choices = {
        { text = "Cut the holes, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tried being a real pirate once. The costume was the best part, so I kept that and let the rest go." } },
    advice = { { id = "tp_ad", text = "Every pirate needs a good hat. A hat says you've plundered, even if all you've plundered is a pie." } },
    _none = { { id = "tp_none", text = "Never heard of it, but I could sell you a hat about it." } },
  },
}

P:NPC {
  key = "nixxrax", id = TODO_NPC("Nixxrax Fillamug"), name = "Nixxrax Fillamug",
  title = "Food & Drink",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "cheerful" }, values = { "generous", "greedy" },
  notices = { "drink" },

  impression = {
    first = "Nixxrax Fillamug sells food and drink with a sincerity that is half salesmanship and half real pleasure in feeding people. It was hard to tell where one half ended.",
    third = "{name} met Nixxrax Fillamug, who sells food and drink to the hungry of Booty Bay.",
  },

  greetings = {
    { id = "g_food", text = "Are you hungry or thirsty? If it's both, you're my favorite kind of customer!" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had a few already, I can see that. Have some bread with it, or you'll be swimming with the sharks before sunset." },
  },

  start = "hello",
  nodes = {
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The haunted island, mostly, the one the captains won't go near, and they say a ghost wrecked a ship there and kept the crew. They talk with their mouths full, so I only catch half, but the half I catch is enough to put me off my dinner." } },
      choices = {
        { text = "Someone ought to lay that ghost to rest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wreck with no crew means free cargo.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "A whole wheel of cheese, three nights ago, and I found the rind out on the far pier. I can forgive a hungry thief, but I can't forgive one who doesn't finish the cheese." } },
      choices = {
        { text = "I'll find your cheese thief and make him pay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hungry thief is welcome to it, I'd say.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I leave a plate out back every night, and every morning it's empty, so either the spirits are hungry or the cats are fat. I'm happy to feed both, though only one of them ever pays." } },
      choices = {
        { text = "Feeding hungry things is good work, whatever they are.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Offerings are wasted food. Sell it to the sailors instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Come and eat, because I hear calling all those elements works up an appetite like nothing else." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit, eat, and say a blessing if you like; I'll take any help I can get with the fish." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! I won't hold your conjured bread against you, but I will tell you mine tastes better." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! I'll set out a plate for you and one for whatever's following you, and I'll charge for both." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Hungry, friend? Of course you are, and you'll pay for it, because I count my rolls." },
        { id = "h_default", key = true,
          text = "Nixxrax Fillamug, and I fill mugs, plates and bellies, in that order. Sailors come off long voyages starving for anything that isn't hardtack, and I'm here to take their gold for it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've bread in the oven and it won't wait." },
        { id = "h_again2", text = "More questions? Ask while you chew." },
      },
      choices = {
        { text = "Do you ever leave an offering of food for the spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the crews talk about over your food these days?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Has anything gone missing from your kitchen lately?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What's the best thing you sell?", next = "best" },
        { text = "Do you compete with Skindle?", next = "skindle" },
        { text = "Got anything for the restless dead?", next = "x_scourge", when = { race = "Scourge" } },
        { text = "I'm not hungry.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "Rum, for the sailors, and fresh fruit for anyone who's been at sea long enough to lose a tooth. A crate of jungle fruit sells faster than gold in this town, once a crew's been out a month." },
      },
      choices = {
        { text = "Where does the fruit come from?", next = "best_fruit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_fruit = {
      lines = {
        { id = "bf_default", text = "The jungle, picked by people braver than me, between the trolls and the panthers. I pay them well, and I pay their widows better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skindle = {
      lines = {
        { id = "sk_default", text = "Compete? Skindle sells you a stool and a rum and a roof, and I sell you what you take away and eat on the pier. We stay out of each other's way, mostly." },
      },
      choices = {
        { text = "Mostly?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_scourge = {
      lines = {
        { id = "xs_default", text = "I've never had to ask before! Do you even eat, or is it more of a habit? Either way, I'll sell you whatever you like, and I won't ask where it goes." },
      },
      choices = {
        { text = "It's mostly habit.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Booty Bay born, Booty Bay fed. I've never been hungry a day in my life, and I'd like you to say the same." } },
    advice = { { id = "tp_ad", text = "Never drink the water on a ship that's been out more than a week. Drink the rum instead." } },
    _none = { { id = "tp_none", text = "Can't eat it, can't drink it, can't help you with it." } },
  },
}

P:NPC {
  key = "xizk", id = TODO_NPC("Xizk Goodstitch"), name = "Xizk Goodstitch",
  title = "Tailoring Supplies",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "fussy" }, values = { "proud", "practical" },
  notices = { "craft" },

  impression = {
    first = "Xizk Goodstitch can tell a good seam from across the room and winces at a bad one. Selling thread to sailmakers and pirates has given Xizk strong opinions on both.",
    third = "{name} met Xizk Goodstitch, who sells thread, cloth and patterns in Booty Bay.",
  },

  greetings = {
    { id = "g_cloth", text = "I've thread, cloth and patterns for anyone who sews, but please don't touch the silk with tar on your hands." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, I can see it in your stitching. Who did your hem? Never mind; I'm sure they meant well." },
  },

  start = "hello",
  nodes = {
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Night watchmen, and that's what I write in the ledger, so that's who it is. They're very well-dressed night watchmen, and they never seem to watch anything, but they pay in full." } },
      choices = {
        { text = "That's your business, and you keep it well.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You know they're thieves, and you're dressing them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Mageweave can stand up to a mage and silk can stand up to a priest, but nothing stands up to a shaman who forgets which hand the lightning comes out of. Bring me whatever's left, and I'll mend it." } },
      choices = {
        { text = "Fair warning. I'll take more care with the elements.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements are wild, and so am I. Charge me extra.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your robes are a disgrace, and I say that with respect, because I can mend them at very reasonable prices." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in that robe? Whatever you serve, I'm sure it never asked you to sweat through it." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Your sleeves are scorched at the cuffs, which tells me everything about your last fight and nothing good about your tailor." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Felcloth, is it? I don't stock it and I won't touch it, but I'll mend the plain cloth underneath." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Rogue's leathers, I see. I won't judge, but those seams are coming apart, and that's how people hear you coming." },
        { id = "h_default", key = true,
          text = "Xizk Goodstitch, supplier of thread and fine cloth. Booty Bay goes through more canvas than anywhere in the South Seas, what with all the sails and all the cannonballs going through them." },
      },
      again = { { id = "h_again", text = "Anything else? Quickly, before the damp gets into the wool." } },
      choices = {
        { text = "Can your cloth stand up to lightning and fire?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who buys the dark cloth you keep under the counter?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "How do you keep cloth dry in this heat?", next = "damp" },
        { text = "I need cloth that can take a spell.", next = "x_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Later.", next = "END" },
      },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The sailmakers for the Blackwater ships, who buy canvas by the bolt and then complain about the price by the yard. After a fight with the Bloodsail, they buy twice as much and complain twice as loudly." },
      },
      choices = {
        { text = "Does the Baron buy from you?", next = "buyers_baron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_baron = {
      lines = {
        { id = "bb_default", text = "The Baron buys silk for his coats and argues every coin of it with Krazek watching. I respect that; a man who haggles over his own vanity knows the worth of things." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = {
        { id = "d_default", text = "Cedar chests, oilcloth and prayer. Mold is the enemy of every tailor in this cove, and it never sleeps, so neither do I, not much." },
      },
      choices = {
        { text = "That sounds exhausting.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_caster = {
      lines = {
        { id = "xc_default", text = "Then you want silk and mageweave, and you want it stitched tight, because loose thread burns first when the magic goes wrong. I've seen the scorch marks on more robes than I'd like to admit." },
      },
      choices = {
        { text = "Tight stitches it is.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sewed sails before I sewed silks, and I still say a sail is the harder job." } },
    advice = { { id = "tp_ad", text = "Store your cloth with cedar, never with fish. You'd be amazed how many people need telling." } },
    _none = { { id = "tp_none", text = "Not cloth, not thread, not my business." } },
  },
}
