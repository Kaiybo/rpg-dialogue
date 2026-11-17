-- The Booty Bay Bruisers: goblin muscle that keeps the Cartel's port neutral.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")

P:Pool {
  id = "guard_bootybay", role = "guard", community = "booty_bay",
  barks = {
    { id = "b_ship", text = "Ship's in. Watch your purse, watch your back, watch the water." },
    { id = "b_steel", text = "Somebody drew steel on the pier last week. We fished him out eventually." },
  },
  greetings = {
    { id = "g_bay", text = "This is Booty Bay. Spend money, don't start trouble, and we'll get along fine." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Tavern's up that way. Everything else is shut, or ought to be, and if you hear singing under the pier, that's a drunk, not a mermaid." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough day in the jungle? There's a smith on the boardwalk, but bring coin; he doesn't do charity." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh? In here you're a customer like anybody else, but past the shark's teeth you're on your own." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Inside these walls nobody cares, and if you keep it that way, neither will we." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey, I saw that shimmer! Sneaking about is your own business, but sneaking with your hand in somebody's pocket is ours." } },
  lines = {
    { id = "l_default", text = "The Cartel says this town's neutral, but we're the ones who make it neutral. Draw a weapon in town and see how quick we get there." },
  },
  -- 0.71.0: the bruisers' own conversation (community pool, so it beats the faction guard tree).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keep your weapon put away and your coin out, and we'll be the best of friends. What do you want, pal?" },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde coin spends the same as anybody's in this port, so spend it, and leave the grudges outside the shark's teeth. What do you need?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Stormwind's a long boat ride from here, pal, and in this port the Baron's word is the only law there is. What do you need?" },
        { id = "h_rep", when = { reputation = { faction = "Booty Bay", min = "honored" } }, text = "Hey, it's you! The Baron's people speak well of you, which means I speak well of you, so what can I do for you, pal?" },
      },
      again = {
        { id = "a_clock", text = "What else? Time's money, and I'm on the clock." },
        { id = "a_ship", text = "Anything else? Make it quick, because there's a ship coming in." },
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
        { id = "ru_default", text = "One rule, really, and it's that nobody fights in town. You can hate whoever you like, but you hate them quietly, you pay your bills, and your blade stays in its sheath until you're past the shark's teeth." },
      },
      choices = {
        { text = "And if someone does start something?", next = "rules_fight" },
        { text = "Simple enough.", next = "BACK" },
      },
    },
    rules_fight = {
      lines = {
        { id = "rf_default", text = "Then a dozen of us turn up all at once, and we don't ask who started it, because we don't care. Whoever's still standing gets thrown off the pier, and whoever's lying down gets billed for the mess." },
      },
      choices = {
        { text = "Harsh, but I can see why it works.", next = "BACK" },
        { text = "Sounds like fun, actually.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    boss = {
      lines = {
        { id = "bo_default", text = "Baron Revilgaz runs the port from up top, where he can see every ship in the bay, and he answers to the Cartel, and the Cartel answers to money. Mind your manners if you go up there, because the Baron's got a long memory and a short temper." },
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
        { id = "tr_default", text = "The Bloodsail Buccaneers, always the Bloodsail. They've wanted this port ever since they first sailed into the bay, and every so often they try their luck on the piers with their cutlasses out." },
      },
      choices = {
        { text = "Why do they want it so badly?", next = "trouble_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_deep = {
      lines = {
        { id = "td_default", text = "Because whoever holds Booty Bay holds the trade of the whole southern sea, and the Bloodsail would rather steal it than earn it. Fleet Master Seahorn's the one to see if you want to make them pay, since he's always looking for hands." },
      },
      choices = {
        { text = "I might pay him a visit.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Not my fight.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "The Cartel pays on time, in gold, and nobody asks me to die for a flag. My cousin worked for the Venture Company once, and he's still paying off the boots they sold him." },
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
        { id = "nd_default", text = "All the time, and we smile and sell them both more swords. The day the Cartel picks a side is the day half its customers stop coming, and nobody in this town is that stupid." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Smart town, then.", next = "BACK" },
      },
    },
    arena = {
      lines = {
        { id = "ar_default", text = "The Gurubashi Arena, up the coast in the old troll ruins. Every so often somebody drops a chest in the middle of it, everybody inside tries to kill everybody else to get it, and folks pay good money just to watch." },
      },
      choices = {
        { text = "Sounds like my kind of fun.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Sounds like madness.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    sides = {
      lines = {
        { id = "si_default", text = "Out there you can do what you like to each other, but in here nobody gets anything but a price." },
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
    bloodsail = { { id = "t_bloodsail", text = "Let 'em come. We've got cannons and a grudge." } },
    steamwheedle = { { id = "t_cartel", text = "The Cartel pays us, and docks a copper every time a gull messes on the cannons. That's all I need to know about the Cartel." } },
    _none = { { id = "t_none", text = "Ask Krazek up at the tavern. He'll tell you whatever you want to know, and then he'll bill you for it." } },
  },
}
