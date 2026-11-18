-- Brother Danil, general supplies, beside his wagon at Northshire Abbey's door. Voice: bibles/danil.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danil", id = TODO_NPC("Brother Danil"), name = "Brother Danil",
  bible = "bibles/danil.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "sharp" },
  notices = { "purse", "kit" },
  impression = {
    first = "Brother Danil sells bread and thread off the Abbey's stores and can apparently hear a full purse from across the yard. He mentioned the leaking roof more than once, and I doubt it was an accident.",
    third = "{name} browsed the humble stores of Brother Danil, who never lets a customer forget that the Abbey roof leaks.",
  },

  greetings = {
    { id = "g_faithful", text = "Supplies for the faithful, and for anyone else with coin." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Browsing is free. Everything else, regrettably, is not." },
    { id = "g_regular", when = { timesTalked = { min = 6 } }, text = "My best customer! Don't tell the others, they'd be jealous." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "I don't sell trousers. I wish I did, for your sake." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some of them crossed themselves when they saw your totems, I'll confess. But the Light didn't object to dwarven coin when we built the Abbey, so I doubt it minds you." } },
      choices = {
        { text = "Then I'll give something for the roof, Brother. Gladly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let the Light fix its own roof, Brother Danil.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only by eating them, friend, for study makes a hungry belly. Once you can conjure your own bread, I hope you'll remember the recruits who can't, because the Light asks us to feed the body as well as the mind." } },
      choices = {
        { text = "I'll share what I conjure with the recruits, Brother.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What I conjure is mine, Brother. They can buy theirs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Both, and the farmers sell to us dearer every year, because the Defias take a share of every harvest before it reaches the road. I pray for better weather and fewer bandits, though I'd settle for the roof being fixed." } },
      choices = {
        { text = "Then the Abbey should pay fairly and keep the farms going.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bargain harder. Farmers will always sell to a buyer with coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bread and water, more than they think, and a bit of thread for the jerkin they'll tear on the first kobold. Most of them buy a whetstone instead and go hungry, and then they come back to me looking pale." } },
      choices = {
        { text = "I'll eat first and sharpen second, Brother.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A sharp blade wins more than a full belly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I think the Defias robbed Milly's vineyard within a bowshot of the Abbey walls, so I've stopped thinking anyone wouldn't. You've an honest enough face, but so did the last fellow who bought one loaf and left with three." } },
      choices = {
        { text = "I'd never steal from the Abbey's stores, Brother.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the Abbey can't guard its bread, that's the Abbey's fault.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Brothers mind very much, but they mind empty bellies more, and the Light never said a warlock had to starve. I sell to you as I'd sell to anyone, and then I pray a little extra at vespers." } },
      choices = {
        { text = "Your charity does you credit, Brother. I'm grateful for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your prayers. I'll pay for bread, not pity.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When the Brothers remember to pay me for it, and they do, mostly, in blessings and the occasional copper. There are Westfall folk coming up the road with nothing in their hands, and I give them the stale loaves and pray nobody notices the fresh ones going too." } },
      choices = {
        { text = "Give them the fresh ones, Brother. Charity is never wasted.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity empties wagons. Sell the fresh ones and stay open.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Water, mostly, because Sammuel works you lot in the sun until you see visions, and the visions are usually just thirst. And a little thread, for the tabard you'll tear on the first kobold you meet." } },
      choices = {
        { text = "A paladin should pay his way, Brother, at full price.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Surely the Abbey can feed its own paladins for nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at my wagon. You'll want bread and water, I expect, because prayer feeds the soul but it's never once fed the stomach." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Brother Sammuel will have you on your knees by dawn, so buy your bread tonight, while you can still stand." },
        { id = "h_default", text = "Bread, water, a little thread. The Abbey's stores are humble, but honest." },
        { id = "h_rich", when = { money = { min = 100000 } }, text = "Ten gold on you, at least; I can hear it from here. The Abbey roof leaks, you know." },
        { id = "h_roof", when = { metBefore = true }, text = "The roof leaked on the bread again. I told the Brothers, and they told me to pray, so I prayed, and it rained." },
        { id = "h_hunter", when = { class = "HUNTER", maxLevel = 15 },
          text = "A bow. Then you'll want arrows, and you'll want more than you think. Recruits always think a quiver lasts a week." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "One of the Abbey's own, buying from my wagon. I used to give your lot the stale loaves. Now you pay for the fresh ones." },
        { id = "h_veteran", when = { minLevel = 20 },
          text = "You've outgrown my wagon, by the look of that kit. Stormwind's merchants will be glad of you. I'm glad of you too, if you're buying." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I keep the coin box under the bread, you know, and I've a very good memory for how many loaves I baked." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've come down from the graveyard, I can tell, and La Salle's students always look like they've slept badly. Bread helps with that, or so I tell myself." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior from the barracks, and you'll want rations, I expect. Llane works recruits hard, and hungry recruits drop their shields." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf at Northshire, and plainly a long way from home! The Abbey's bread is humble, but it's honest, and I'd say the same of the thread." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage of the Abbey! Brother Bremen's students always buy the bread and forget the water, and then they come back thirsty." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and I'll wager a full purse with you. The Abbey's roof still leaks, you know. Perhaps your rain spirits could ask it to stop." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wagon's open till the bread runs out." },
        { id = "h_again2", text = "Ask away. Questions are the one thing I don't charge for." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Strange, a brother selling from a wagon.", next = "wagon" },
        { text = "Mining picks and skinning knives? From a brother?", next = "tools" },
        { text = "Arrows. As many as I can carry.", next = "arrows", when = { class = "HUNTER" } },
        { text = "I can't afford much, Brother.", next = "poor", when = { money = { max = 500 } } },
        { text = "You seem to think a rogue would rob the Abbey.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd guess the Brothers mind you selling to warlocks.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does a recruit need most from your wagon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Abbey feed the poor from your wagon, Brother?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin need from your wagon, Brother?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Abbey grow its own grain, or buy it?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Khelden Bremen's students must trouble the Abbey's stores.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Brothers seem wary of a shaman at the Abbey, Brother Danil.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking.", next = "END" },
      },
    },
    wagon = {
      lines = {
        { id = "w_default", text = "The brothers would rather coin didn't change hands under the Abbey roof, so it changes hands out here, under mine, and mine leaks less." },
      },
      choices = {
        { text = "Who buys the most?", next = "wagon_buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon_buyers = {
      lines = {
        { id = "wb_default", text = "Recruits. Bread first, then arrows, then bread again, once they've learned what a kobold does to a packed lunch." },
        { id = "wb_kobolds", when = { questActive = TODO_QUEST("Kobold Camp Cleanup") },
          text = "Recruits, mostly ones like you, on their way to the kobold camp. Eat before you go. The Marshal doesn't feed you, and the kobolds certainly won't." },
      },
      choices = {
        { text = "I'll take some bread, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tools = {
      lines = {
        { id = "t_default", text = "Everyone comes back from those woods wanting to keep something, whether it's ore, hides or herbs. I'd rather they did it with a proper knife than a borrowed spoon." },
      },
      choices = {
        { text = "I doubt the brothers approve.", next = "tools_approve" },
        { text = "Practical of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tools_approve = {
      lines = {
        { id = "ta_default", text = "Brother Neals says honest trade counts as prayer. He says that about wine as well, so I don't lean on it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    arrows = {
      lines = {
        { id = "a_default", text = "Rough arrows, and rough is the word. They fly straight enough for wolves. Fletch your own when you've the time and the feathers." },
      },
      choices = {
        { text = "Then sell me the rough ones.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poor = {
      lines = {
        { id = "p_default", text = "Then buy bread and water and nothing clever. A full stomach wins more fights than a sharp knife. Don't tell the smiths." },
      },
      choices = {
        { text = "Bread and water it is.", next = "BUSINESS", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of Northshire with a head for sums, so they gave me the wagon. Some brothers get visions; I got a ledger." } },
    advice = { { id = "tp_ad", text = "Carry water. Everyone remembers the sword and forgets the water. The kobolds don't forget anything." } },
    northshire_abbey = { { id = "tp_abbey", text = "A lovely building, and it leaks. I've said so in every prayer for a year." } },
    kobolds = { { id = "tp_kobolds", text = "Good for business, kobolds. Every recruit who goes up that hill comes back hungry." } },
    _none = { { id = "t_none", text = "I keep the stores, not the secrets. Ask Brother Neals." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood keeps the Abbey, trains the recruits and feeds them, and somebody has to count the bread. That's me, so I'm the Brotherhood's least holy brother and possibly its most useful." } },
    holy_light = { { id = "tp_holy_light", text = "The Light gives every brother a gift, and mine is that the ledger balances at the end of the month. Brother Sammuel says that counts, and I've decided to believe him." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Every recruit back from Echo Ridge wants a new pick, a new knife and a bandage, in that order. The kobolds are very good for business, Light forgive me for saying it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's carters come up for cheap rope and flint when they're camped at Goldshire, and they haggle like dwarves. I like them anyway, and I count the rope twice afterwards." } },
  },
}
