-- The Gadgetzan Bruisers: Steamwheedle muscle in the desert. Same rules as Booty Bay, more sand.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")

P:Pool {
  id = "guard_gadgetzan", role = "guard", community = "gadgetzan",
  barks = {
    { id = "b_heat", text = "Hot enough to cook an egg on my helmet, pal. Don't ask how I know, and don't ask why the helmet still smells of it, because the Cartel won't pay for a new one." },
    { id = "b_water", text = "Water tower's humming, which is good, because when it stops humming everybody in town gets grumpy, and Marin starts docking our pay by the cup." },
  },
  greetings = {
    { id = "g_town", text = "This is Gadgetzan, friend: neutral ground, Cartel rules, and Cartel prices. You start a fight here and we finish it, usually on top of you, and then we bill you for the dent." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The desert gets cold at night, buddy, but the bandits don't, so stay inside the walls till morning, where your coin's safe and spendable." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Was it the Wastewander bandits or the bugs, pal? Either way, there's a smith in town, so bring money, because nobody mends for free out here." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh? In town you're a paying customer, pal, but outside the walls you're bandit bait like everyone else, and bandits don't care about your coin, only your water." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? The Cartel doesn't care, so I don't care, chum, and let's keep it that way, because caring costs extra." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey! Sand doesn't lie, sneaky, and I can see your footprints from here, so keep your hands out of other people's purses, because in this town that's our job." } },
  lines = {
    { id = "l_default", text = "The Cartel built this town in the middle of nowhere because nowhere doesn't charge rent. We keep it peaceful so the money keeps coming, and the money keeps us paid, so everybody wins." },
  },
  -- 0.71.0: the bruisers' own conversation (community pool, so it beats the faction guard tree).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Out of the sun, are you? Smart, pal. Keep your weapons sheathed and your water bill paid, and we'll get along fine." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Long walk from Orgrimmar across all that sand, pal, so spend a little coin while you're here and keep your axe on your back. What do you need?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Long way from Theramore, pal, and the desert doesn't care whose banner you march under, so neither do we. What do you need?" },
        { id = "h_rep", when = { reputation = { faction = "Gadgetzan", min = "honored" } }, text = "Well, if it isn't one of Gadgetzan's favourite customers! The boss likes you, and that makes you easy to like, and cheap to like, too. What can I do for you, pal?" },
      },
      again = {
        { id = "a_heat", text = "What else? Talk fast, pal, before we both melt and somebody has to mop us up." },
        { id = "a_clock", text = "Anything else? I'm paid by the day, not by the chat, and not much by the day either." },
      },
      choices = {
        { text = "What are the rules in this town?", next = "rules" },
        { text = "Who runs Gadgetzan?", next = "boss" },
        { text = "Any trouble out in the desert?", next = "trouble" },
        { text = "What's that humming tower?", next = "water" },
        { text = "Doesn't staying neutral ever bother you?", next = "neutral" },
        { text = "Why work for the Cartel?", next = "pay" },
        { text = "Do the Alliance give you trouble here?", next = "sides", when = { faction = "Horde" } },
        { text = "Do the Horde give you trouble here?", next = "sides", when = { faction = "Alliance" } },
        { text = "I tinker a bit myself.", next = "tinker", when = { profession = "Engineering" } },
        { text = "Who'd notice a purse or two going missing?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll keep the peace.", next = "END", fx = { standing = { gadgetzan = 1 } } },
      },
    },
    rules = {
      lines = {
        { id = "ru_default", text = "Nobody fights inside the walls, nobody steals water, and everybody pays what they owe, on time. Break any one of those and you'll meet a lot of us very quickly, and none of us will be smiling." },
      },
      choices = {
        { text = "What happens if someone does start something?", next = "rules_fight" },
        { text = "Simple enough.", next = "BACK" },
      },
    },
    rules_fight = {
      lines = {
        { id = "rf_default", text = "We finish it, pal, and we finish it fast, because a brawl in the street scares off the caravans. Folks out there call us the meanest guards in Kalimdor, and we pay good money to keep that reputation." },
      },
      choices = {
        { text = "I believe it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'd like to see you try.", next = "BACK", fx = { trait = { brave = 1 }, affinity = -1 } },
      },
    },
    boss = {
      lines = {
        { id = "bo_default", text = "Marin Noggenfogger runs the town, and the Cartel runs Marin, at least on paper, and the money runs the Cartel. He's a sharp one, and he's always brewing something, so if he offers you a drink, read the label twice and the price three times." },
      },
      choices = {
        { text = "What's he brewing?", next = "boss_brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boss_brew = {
      lines = {
        { id = "bb_default", text = "Some elixir of his that turns you into a skeleton one day and makes you float the next, and he swears it's perfectly safe. I tried it once, pal, and I spent an afternoon three inches shorter, so I'll stick to water." },
      },
      choices = {
        { text = "I might give it a try.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll take your word for it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Wastewander bandits, mostly, and they'd steal the sweat off your brow if they could bottle it and sell it. Then there's pirates down at Lost Rigger Cove, trolls in Zul'Farrak and bugs the size of carts out south, so take your pick, pal." },
      },
      choices = {
        { text = "What do the Wastewanders want?", next = "trouble_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_deep = {
      lines = {
        { id = "td_default", text = "Water, same as everybody out here, only they'd rather take it than pay for it. They hit the caravans and the pump crews, and Chief Engineer Bilgewhizzle up the tower will tell you all about it, at length, if you let him." },
      },
      choices = {
        { text = "Maybe I'll thin their numbers.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Can't blame them for being thirsty.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    water = {
      lines = {
        { id = "wa_default", text = "That's the water tower, and it's the only reason anybody lives here at all, and the reason everything costs what it costs. It pulls water up from deep under the sand, and whoever controls the water controls Gadgetzan, which is why we stand right next to it." },
      },
      choices = {
        { text = "What happens if it stops?", next = "water_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water_stop = {
      lines = {
        { id = "ws_default", text = "Then everybody in town gets very grumpy very fast, and the engineers start shouting at each other, and somebody usually blows a valve. It's stopped twice since I took this job, and both times I earned every copper they paid me." },
      },
      choices = {
        { text = "Here's hoping it keeps humming.", next = "BACK" },
        { text = "Good luck, then.", next = "END" },
      },
    },
    neutral = {
      big = true,
      lines = {
        { id = "ne_default", text = "Bother me? The desert's trying to kill everybody equally, pal, so why should I pick favourites? Horde and Alliance both need water and both need guns, and the Cartel sells to both, and that keeps this town alive." },
      },
      choices = {
        { text = "Smart. Neutral ground makes the best profit.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Sooner or later, everyone has to choose a side.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Has anyone ever tested that?", next = "neutral_test" },
      },
    },
    neutral_test = {
      lines = {
        { id = "nt_default", text = "Every week, usually somebody fresh off the road with something to prove. They learn fast, pal, because the sand out back is full of people who learned slow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    pay = {
      lines = {
        { id = "pa_default", text = "Because the Cartel pays in gold and the Venture Company pays in promises, and you can't spend promises at the Road Warrior. Besides, out here a guard gets water rations, and in Tanaris I've seen a dwarf trade his good boots for one canteen." },
      },
      choices = {
        { text = "Sounds like a fair trade.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sides = {
      lines = {
        { id = "si_default", text = "In town, nobody gives anybody trouble, pal, because we don't let them, and they can't afford the fines." },
        { id = "si_horde", when = { faction = "Horde" }, text = "They come up from Theramore and down from Feralas, and they look at you like you look at them, but in Gadgetzan everybody keeps their hands where we can see them. Out in the dunes, pal, you're on your own." },
        { id = "si_alliance", when = { faction = "Alliance" }, text = "They come down from Orgrimmar and across from Thousand Needles, and they look at you like you look at them, but in Gadgetzan everybody keeps their hands where we can see them. Out in the dunes, pal, you're on your own." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
      },
    },
    tinker = {
      lines = {
        { id = "ti_default", text = "Do you, now? Then go and see Nixx Sprocketspring, because he teaches the goblin way, which is the way with the bigger boom. Just don't test anything near the water tower, or you'll be talking to us again." },
      },
      choices = {
        { text = "Bigger is better.", next = "BACK", fx = { affinity = 1 } },
        { text = "I prefer the careful way.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Me, pal, and then everybody else about a second later. In this town every coin's counted twice, so take your quick fingers out to the Wastewanders and lighten their pockets instead." },
      },
      choices = {
        { text = "Just asking.", next = "BACK" },
        { text = "Not a bad idea, actually.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "t_cartel", text = "Gadgetzan's the Cartel's town, pal. Booty Bay's a nice port, but this is the big chair, and the big chair has the big ledger." } },
    _none = { { id = "t_none", text = "Ask at the Road Warrior, buddy. Fizzgrimble talks to everyone, about everything, for the price of a drink." } },
  },
}
