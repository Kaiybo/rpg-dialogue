-- The Booty Bay Bruisers: goblin muscle that keeps the Cartel's port neutral.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")

P:Pool {
  id = "guard_bootybay", role = "guard", community = "booty_bay",
  barks = {
    { id = "b_ship", text = "Ship's in, pal, so watch your purse, watch your back and watch the water, because the Cartel doesn't refund any of 'em." },
    { id = "b_steel", text = "Somebody drew steel on the pier last week. We fished him out eventually, and the Baron billed his widow for the rope." },
  },
  greetings = {
    { id = "g_bay", text = "This is Booty Bay, pal. Spend money, don't start trouble, and we'll get along fine, which is the cheapest deal in town." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Tavern's up that way, buddy, and everything else is shut, or ought to be. If you hear singing under the pier, that's a drunk, not a mermaid, and he owes me two silver." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough day in the jungle, pal? There's a smith on the boardwalk, but bring coin, because he doesn't do charity and neither does anybody else in this town." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh? In here you're a paying customer like anybody else, pal, but past the shark's teeth you're on your own, and the Cartel's insurance doesn't follow you." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Inside these walls nobody cares, chum, and if you keep it that way, neither will we, and that's the best price you'll get on peace anywhere." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey, I saw that shimmer, pal! Sneaking about is your own business, but sneaking with your hand in somebody's pocket is ours, and we bill by the bruise." } },
  lines = {
    { id = "l_default", text = "The Cartel says this town's neutral, but we're the ones who make it neutral, and we're paid by the day to do it. Draw a weapon in town and see how quick we earn our wages." },
  },
  -- 0.71.0: the bruisers' own conversation (community pool, so it beats the faction guard tree).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keep your weapon put away and your coin out, and we'll be the best of friends. What do you want, pal?" },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde coin spends the same as anybody's in this port, buddy, so spend it, and leave the grudges outside the shark's teeth. What do you need?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Stormwind's a long boat ride from here, pal, and in this port the Baron's word is the only law there is. What do you need?" },
        { id = "h_rep", when = { reputation = { faction = "Booty Bay", min = "honored" } }, text = "Hey, it's you! The Baron's people speak well of you, which means I speak well of you, since he signs my wages, so what can I do for you, pal?" },
      },
      again = {
        { id = "a_clock", text = "What else? Time is money, friend, and I'm on the clock." },
        { id = "a_ship", text = "Anything else? Make it quick, pal, because there's a ship coming in and ships mean fights and fights mean overtime." },
      },
      choices = {
        { text = "What are the rules in this town?", next = "rules" },
        { text = "Who runs Booty Bay?", next = "boss" },
        { text = "Any trouble lately?", next = "trouble" },
        { text = "Why work for the Cartel?", next = "pay" },
        { text = "Doesn't staying neutral ever bother you?", next = "neutral" },
        { text = "What's this arena I keep hearing about?", next = "arena" },
        { text = "Do the Alliance give you trouble here?", next = "sides", when = { faction = "Horde" } },
        { text = "Do the Horde give you trouble here?", next = "sides", when = { faction = "Alliance" } },
        { text = "Who'd notice a purse or two going missing?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll behave.", next = "END", fx = { standing = { booty_bay = 1 } } },
      },
    },
    rules = {
      lines = {
        { id = "ru_default", text = "One rule, really, and it's that nobody fights in town. You can hate whoever you like, pal, but you hate them quietly, you pay your bills, and your blade stays in its sheath until you're past the shark's teeth." },
      },
      choices = {
        { text = "And if someone does start something?", next = "rules_fight" },
        { text = "Simple enough.", next = "BACK" },
      },
    },
    rules_fight = {
      lines = {
        { id = "rf_default", text = "Then a dozen of us turn up all at once, and we don't ask who started it, because we don't care and we're not paid to. Whoever's still standing gets thrown off the pier, and whoever's lying down gets billed for the mess." },
      },
      choices = {
        { text = "Harsh, but I can see why it works.", next = "BACK" },
        { text = "Sounds like fun, actually.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    boss = {
      lines = {
        { id = "bo_default", text = "Baron Revilgaz runs the port from up top, where he can see every ship in the bay, and he answers to the Cartel, and the Cartel answers to money. Mind your manners if you go up there, chum, because the Baron's got a long memory, a short temper and a very long ledger." },
      },
      choices = {
        { text = "What's he like to work for?", next = "boss_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss_like = {
      lines = {
        { id = "bl_default", text = "Sharp as a fish hook and twice as hard to shake off, and he's kept this place afloat through pirate raids, troll trouble and more bad years than I can count. I don't love him, pal, but he pays on time, and in this business that's practically romance." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "The Bloodsail Buccaneers, always the Bloodsail. They've wanted this port ever since they first sailed into the bay, and every so often they try their luck on the piers with their cutlasses out, and we try ours with the cannons, and the cannons win." },
      },
      choices = {
        { text = "Why do they want it so badly?", next = "trouble_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_deep = {
      lines = {
        { id = "td_default", text = "Because whoever holds Booty Bay holds the trade of the whole southern sea, pal, and the Bloodsail would rather steal it than earn it. Fleet Master Seahorn's the one to see if you want to make them pay, since he's always hiring hands." },
      },
      choices = {
        { text = "I might pay him a visit.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Not my fight.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "The Cartel pays on time, in gold, and nobody asks me to die for a flag, just for a decent wage. My cousin worked for the Venture Company once, and he's still paying off the boots they sold him, with interest." },
      },
      choices = {
        { text = "Sounds like a sweet deal.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neutral = {
      big = true,
      lines = {
        { id = "ne_default", text = "Bother me? Pal, neutrality's the best business plan anybody ever had. Orcs and humans can kill each other all they like out there, and in here they both buy rope from the same shop, so what's to be bothered about?" },
      },
      choices = {
        { text = "Smart. Coin outlasts every war.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Some fights are worth picking a side in.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "Doesn't anyone try to drag you in?", next = "neutral_drag" },
      },
    },
    neutral_drag = {
      lines = {
        { id = "nd_default", text = "All the time, and we smile and sell them both more swords. The day the Cartel picks a side is the day half its customers stop coming, pal, and nobody in this town is that bad at arithmetic." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Smart town, then.", next = "BACK" },
      },
    },
    arena = {
      lines = {
        { id = "ar_default", text = "The Gurubashi Arena, up the coast in the old troll ruins. Every so often somebody drops a chest in the middle of it, everybody inside tries to kill everybody else to get it, and folks pay good money just to watch, and better money to bet." },
      },
      choices = {
        { text = "Sounds like my kind of fun.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Sounds like madness.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    sides = {
      lines = {
        { id = "si_default", text = "Out there you can do what you like to each other, pal, but in here nobody gets anything but a price." },
        { id = "si_horde", when = { faction = "Horde" }, text = "Alliance folk come through all the time, and they glare at you the same as you glare at them, but nobody draws, because they've all seen what happens. In here you're both just customers, pal." },
        { id = "si_alliance", when = { faction = "Alliance" }, text = "Orcs and trolls come off the boat from Ratchet every other day, and they glare at you the same as you glare at them, but nobody draws, because they've all seen what happens. In here you're both just customers, pal." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Everybody notices, pal, because in this town a missing purse is somebody's missing profit, and the Cartel takes that personally. Do your pickpocketing out in the jungle, where the trolls won't go complaining to the Baron." },
      },
      choices = {
        { text = "Just asking.", next = "BACK" },
        { text = "Noted, and appreciated.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    bloodsail = { { id = "t_bloodsail", text = "Let 'em come, pal. We've got cannons, a grudge and a whole cellar of powder that's dying to go off." } },
    steamwheedle = { { id = "t_cartel", text = "The Cartel pays us, and docks a copper every time a gull messes on the cannons, by my last copper. That's all I need to know about the Cartel." } },
    _none = { { id = "t_none", text = "Ask Krazek up at the tavern, buddy. He'll tell you whatever you want to know, and then he'll bill you for it." } },
  },
}

-- 0.75.0: Booty Bay's dockside folk, who live in the Blackwater Raiders' shadow. The engine matches
-- community pools on the NPC's communities, and an unnamed NPC only gets its town's (booty_bay), so
-- this is a citizen pool for the town with the Raiders' flavour rather than a "blackwater" pool.
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "citizen_bootybay_raiders", role = "citizen", community = "booty_bay",
  barks = {
    { id = "b_sails", text = "Black sails coming in on the tide! Somebody fetch the Fleet Master before he hears it from the parrot." },
    { id = "b_red", text = "If you see a red sail out past the shark's teeth, shout, and then run, in that order." },
    { id = "b_song", text = "The Raiders were singing on the pier till dawn again, and not one of them knows the second verse." },
  },
  greetings = {
    { id = "g_dock", text = "Mind the ropes, friend, the Raiders coil them wherever they drop them. Welcome to the Bay." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Evening! The Blackwater lads are ashore tonight, so the tavern's loud and the pier's slippery, and I'd keep clear of both." },
    { id = "g_helped", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "You're the one who sent Firallon to the bottom! The Raiders have been toasting you all week, and some of them even remembered your name." },
  },
  notice = {
    { id = "n_bloodsail_rep", cat = "status", when = { reputation = { faction = "Bloodsail Buccaneers", min = "neutral" } },
      text = "Funny, there's a whiff of red bandana about you. I'd not let the Raiders smell it, friend, because they've got better noses than the Bruisers." },
    { id = "n_rep", cat = "status", when = { reputation = { faction = "Booty Bay", min = "honored" } },
      text = "The Raiders nod to you on the pier, I've seen it. That's worth more in this town than a purse full of gold, though I'd take the purse as well." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Another tauren! The Fleet Master will want to buy you a drink and tell you about the plains, so you've been warned." },
  },
  lines = {
    { id = "l_raiders", text = "The Blackwater Raiders keep the Bloodsail off our piers, and the Baron keeps the Raiders paid. As long as both of those stay true, the rest of us can get some sleep." },
    { id = "l_fin", when = { ["not"] = { questDone = TODO_QUEST("Stranglethorn Fever") } }, text = "Poor Fin Fizracket's still sweating out the fever on the docks. Swam in a jungle pond, the fool, and now nobody will sit downwind of him." },
  },
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "You're new off the boat, or new enough, anyway. Ask me anything about the Bay, friend, because I've lived under these cliffs my whole life and I've seen every kind of fool come through the shark's teeth." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, eh? You'll be off the Ratchet boat, then. The Raiders like your lot well enough, because you pay your tolls and you hate the Bloodsail, so what can I tell you?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Alliance, eh? The Raiders will call you a landlubber till you've bought them a round, and after that they'll call you a landlubber who buys rounds. What do you want to know?" },
      },
      again = {
        { id = "a_more", text = "Something else? Ask away, the tide's not in yet." },
        { id = "a_gossip", text = "More? I've gossip enough to fill a ship's hold, so go on." },
      },
      choices = {
        { text = "Who are the Blackwater Raiders?", next = "raiders" },
        { text = "What do folk here think of the Bloodsail?", next = "bloodsail" },
        { text = "Is Fleet Master Seahorn as loud as they say?", next = "seahorn" },
        { text = "Do the Raiders ever take on new hands?", next = "hire" },
        { text = "Seen any Bloodsail spies about town?", next = "spies", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Take care, friend.", next = "END" },
      },
    },
    raiders = {
      lines = {
        { id = "ra_default", text = "The Baron's fleet, more or less: pirates who sail for the Steamwheedle Cartel instead of against it. They escort the merchant ships, they collect the toll, and they sink the Bloodsail whenever they can catch them." },
      },
      choices = {
        { text = "Pirates working for merchants? Odd.", next = "raiders_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders_odd = {
      big = true,
      lines = {
        { id = "rao_default", text = "Odd, maybe, but it works, friend. A pirate who's paid every month doesn't need to rob anybody, and one who's paid by the Cartel can't rob anybody in the Cartel's port, so we get the cannons without the trouble." },
      },
      choices = {
        { text = "Paid pirates are still pirates. I'd not trust them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Good. Even pirates need someone to answer to.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bloodsail = {
      lines = {
        { id = "bs_default", text = "That they'd burn this town to the waterline if they thought there was a copper in the ashes. Fleet Master Firallon wants the Baron's balcony, and he's been trying to buy it with knives for years." },
        { id = "bs_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Less than we did, now Firallon's at the bottom! They'll find another fleet master, mind, so don't go hanging up your sword just yet." },
      },
      choices = {
        { text = "Firallon? Who's he?", next = "bloodsail_firallon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bloodsail_firallon = {
      lines = {
        { id = "bf_default", text = "The Bloodsail's fleet master, with Keelhaul and Stillwater for his captains, and a ship off our coast you can see from the top of the Salty Sailor on a clear day. First Mate Crazz will tell you more than you want to know, and twice as loud." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    seahorn = {
      lines = {
        { id = "se_default", text = "Louder, friend! He laughs at the top of the tavern and the glasses rattle at the bottom. He's a tauren who went to sea and never came back, and he'd fight a kraken for any one of his sailors." },
      },
      choices = {
        { text = "A tauren pirate. I've seen everything now.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spies = {
      lines = {
        { id = "sp_default", text = "You've the look of someone who'd notice, so I'll say it quietly: somebody in this town tells the Bloodsail when the Raiders sail. I'd not say who, because I don't know, and because the last fellow who guessed out loud went off the pier." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { standing = { booty_bay = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hire = {
      lines = {
        { id = "hi_default", text = "Always, because the Bloodsail keep making vacancies. Go up the stairs at the Salty Sailor and ask for the Fleet Master, and if he likes your face he'll find you a job, though the Raiders will want you to prove it on a Bloodsail deck first." },
      },
      choices = {
        { text = "I'll pay the Fleet Master a visit.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    bloodsail = { { id = "t_bloodsail", text = "Red sails, red bandanas and no mercy. The Raiders are all that stands between them and our piers, so I buy every Raider I meet a drink." } },
    _none = { { id = "t_none", text = "Couldn't tell you, friend. Ask one of the Raiders on the pier; they've sailed everywhere and lied about most of it." } },
  },
}
