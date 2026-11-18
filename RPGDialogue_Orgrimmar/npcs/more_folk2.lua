-- More of Orgrimmar, continued from more_folk.lua: Soran (the third banker), Auctioneers Wabang and Grimful,
-- Vehena (Darkspear cloth quartermaster), the profession suppliers (Sumi, Kithas, Kor'geld, Sovik, Gorina,
-- Shankys, Borya, Tamar, Zeal'aya, Xen'to), the armor and weapon merchants (Tumi, Kiro, Morgum, Sana, Urtharo,
-- Zendo'jian, Koru, Shoma, Kareth, Katis) and the food and goods merchants (Borstan, Olvia, Gotri, Horthus,
-- Magenius, Asoran, Shimra, Trak'gen, Garyl, Xan'tish). Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Soran: banker, Valley of Strength; the quiet brother of Koma and Karus; keeps the accounts of the armory that bears his name.
---------------------------------------------------------------------------
P:NPC {
  key = "soran", id = TODO_NPC("Soran"), name = "Soran", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet", "steady" }, values = { "honest", "dutiful" },
  notices = { "purse", "class" },
  impression = {
    first = "Soran is the quietest of the three brothers who keep the Bank of Orgrimmar, and the only one who will not tell the story of Mount Hyjal. He weighs a question before answering it, much as he weighs coin.",
    third = "{name} met Soran, the quiet brother at the Bank of Orgrimmar who does not speak of Mount Hyjal.",
  },
  greetings = {
    { id = "g_default", text = "The Bank of Orgrimmar. Tell me what you need, and I'll see to it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Your goods are as you left them; I looked this morning." },
    { id = "g_away", when = { away = 14 }, text = "It's been some weeks. Nothing has been touched, and I'd know if it had." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You've very little, I can see. Leave what you can spare with us anyway. A habit begun poor is worth more than one begun rich." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry yourself like a line soldier. My brother will want to tell you about Hyjal. Be patient with him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Soran. My brothers and I keep the bank, and I also keep the accounts for the leather and steel armory across the valley, which has my name over its door. Koma will have told you the rest, at length." },
        { id = "h_veteran", when = { minLevel = 50 }, text = "I'm Soran. You've seen a good deal of the world's fighting, by your look. Then you'll understand why I'd sooner talk about your vault than about mine." },
        { id = "h_orc", when = { race = "Orc", maxLevel = 20 }, text = "I'm Soran. You're young, so I'll tell you what I tell every young orc at this counter. Keep one thing safe that you never mean to sell." },
      },
      again = {
        { id = "h_again", text = "Is there something more?" },
        { id = "h_again2", text = "Go on. I'm not in a hurry." },
        { id = "h_again3", text = "Ask, if you like. I'll answer what I can." },
      },
      choices = {
        { text = "Open my vault, Soran.", next = "BUSINESS" },
        { text = "Koma says you won't tell the story of Hyjal.", next = "hyjal" },
        { text = "An armory with your name on it, and you work in a bank.", next = "armory" },
        { text = "What are your brothers like, across the counter?", next = "brothers" },
        { text = "What do you make of all this coin passing through?", next = "coin" },
        { text = "My tribe stood on that mountain beside yours.", next = "troll", when = { race = "Troll" } },
        { text = "Keep well, Soran.", next = "END" },
      },
    },
    hyjal = {
      lines = {
        { id = "hyjal_default", text = "He's right, I don't. Koma tells it for all three of us, and every year the infernal grows. I've no quarrel with that. He needs to tell it and I need not to, and between us it comes out about even." },
      },
      choices = {
        { text = "Why do you need not to?", next = "hyjal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal2 = {
      lines = {
        { id = "hyjal2_default", text = "Because when I tell it, I'm standing there again. There was a troll on my left, a Darkspear, whose name I never learned. He threw axes until he had none left and then he threw rocks. When the horn blew I turned to pull him back with us, and he wasn't there to pull." },
      },
      choices = {
        { text = "You never learned who he was?", next = "hyjal3" },
        { text = "Something else, Soran.", next = "BACK" },
      },
    },
    hyjal3 = {
      big = true,
      narr = "He squares a stack of ledgers that was already square.",
      lines = {
        { id = "hyjal3_default", text = "I asked in the Valley of Spirits afterward. I'd nothing to give them but \"a troll, on the left, with axes,\" and that was half the tribe. There's a box in the vault with nothing in it. I pay its fee each year under no name, and I've never told my brothers." },
      },
      choices = {
        { text = "Keep paying it. Someone should hold his place.", next = "BACK", reply = "That was my thinking. It's a small thing, but it's the only thing I could find to do.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The dead don't need vaults. Let it go, Soran.", next = "BACK", reply = "Karus would say so, if he knew. He'd be right about the copper, and I'd keep paying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "troll_default", text = "They did, and I've wanted to ask one of you something for years. A Darkspear fell on my left at Hyjal, and I never learned his name. How does your tribe speak of those who died with nobody near who knew them?" },
      },
      choices = {
        { text = "We say \"the one who stood,\" and the spirits know the rest.", next = "BACK", reply = "\"The one who stood.\" That's better than anything I had. Thank you; I'll use it.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    armory = {
      lines = {
        { id = "armory_default", text = "It was to be my trade. After the camps I meant to sell armor, and I'd arranged the shop before the Warchief asked the three of us to take the bank. I couldn't refuse him. So Morgum and Sana sell there under my name, Thatog keeps the stock upstairs, and I do the sums at night." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = {
        { id = "brothers_default", text = "Karus is the careful one and counts everything three times. Koma is the loud one and counts nothing, which is why he's put in front of the customers. I'm the one in the middle who's asked to settle it when they disagree. I've had a great deal of practice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coin = {
      lines = {
        { id = "coin_default", text = "I think it's a strange thing for orcs to have. We'd no coin on Draenor that I remember, only what a clan held together, and in the camps we had nothing. Now a peon can save a silver and call it his own. I can't decide if that makes us freer or only more alone." },
      },
      choices = {
        { text = "Freer. What's yours can't be taken by a chief's whim.", next = "BACK", reply = "That's the best of it, I agree. I only notice that nobody shares a vault.", fx = { align = { order = -1 } } },
        { text = "More alone. A clan's wealth belonged to the clan.", next = "BACK", reply = "So I sometimes think. But I've seen what a chief can do with a clan's wealth, too, so I keep the ledgers.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "I saw what they sent against us. I don't describe it, and I'd ask you not to press me." } },
    darkspear = { { id = "tp_darkspear", text = "They stood on our left at Hyjal and didn't give a step. I owe them more than I know how to pay." } },
    internment = { { id = "tp_internment", text = "The three of us shared one blanket there. Karus counted the threads in it, to have something to count." } },
    thrall = { { id = "tp_thrall", text = "He asked us to keep the bank, and he stood in the line with us first. I couldn't have refused him." } },
    advice = { { id = "tp_advice", text = "Keep one thing you'll never sell, and keep it where you can't lose it." } },
    _none = { { id = "tp_none", text = "I can't speak to that. I try not to talk about what I don't know." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Wabang: orc auctioneer, Valley of Strength; enjoys a bidding war.
---------------------------------------------------------------------------
P:NPC {
  key = "wabang", id = TODO_NPC("Auctioneer Wabang"), name = "Auctioneer Wabang", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "orgrimmar" }, temper = { "jovial", "loud" }, values = { "profit", "friendly" },
  notices = { "purse", "class" },
  impression = {
    first = "Auctioneer Wabang calls bids at the Orgrimmar auction house and plainly loves a bidding war the way other orcs love a brawl. He cheers for whoever is losing, since it keeps the price climbing.",
    third = "{name} met Auctioneer Wabang, who calls the bids in Orgrimmar and enjoys every one.",
  },
  greetings = {
    { id = "g_default", text = "Step up, step up! Something to sell, or something you can't live without?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You didn't win it, by your face. Then bid higher this time, that's my counsel, and I'm never wrong." },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Now there's the walk of someone with gold to spend. Come closer, friend, and let me tell you what came in this morning." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Empty purse, eh? Then you're a seller today. Turn out your pack, and we'll see what the Horde will pay for it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Hides and claws and good raw meat. Every leatherworker in the Drag watches this floor for what you bring in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Wabang! Thathung explains the rules, Grimful minds the ledger, and I'm the one who makes it a contest. An auction with no shouting is only a shop with worse manners." },
        { id = "h_seller", when = { profession = "Mining" }, text = "I'm Wabang, and you dig ore, by that pick. Then you're my favorite sort of customer. The smiths in the Valley of Honor can never get enough of it, and they bid like wolves." },
        { id = "h_low", when = { maxLevel = 15 }, text = "I'm Wabang! You're new, so here's all you need. Sell what you don't use, buy only what you'll wear out, and never bid when you're angry." },
      },
      again = {
        { id = "h_again", text = "What else? There's a lull, I can talk." },
        { id = "h_again2", text = "Go on! Ask before the next lot comes up." },
        { id = "h_again3", text = "Ask away, friend, it costs nothing. That's the only thing here that does." },
      },
      choices = {
        { text = "Let me see what's for sale.", next = "BUSINESS" },
        { text = "You enjoy this more than Thathung does.", next = "enjoy" },
        { text = "What's the fiercest bidding you've seen?", next = "war" },
        { text = "What sells best in Orgrimmar?", next = "sells" },
        { text = "Do the goblins' auction houses trouble you?", next = "goblins" },
        { text = "I craft goods. How should I price them?", next = "crafter", when = { any = { { profession = "Blacksmithing" }, { profession = "Leatherworking" }, { profession = "Tailoring" }, { profession = "Alchemy" }, { profession = "Engineering" } } } },
        { text = "Good bidding, Wabang.", next = "END" },
      },
    },
    enjoy = {
      lines = {
        { id = "enjoy_default", text = "Of course I do! Thathung was a sergeant and thinks of it as drill. I was a peon, friend. I carried rocks for a living, and nobody ever asked what I thought anything was worth. Now I stand up here and the whole Horde tells me, all day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = {
        { id = "war_default", text = "Two warriors, over a plain steel axe. It wasn't worth five silver. One had bid, and the other took it as a challenge, and neither would be seen to back down in front of the floor. It went past three gold before I stopped trying to keep a straight face." },
      },
      choices = {
        { text = "Who won?", next = "war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war2 = {
      lines = {
        { id = "war2_default", text = "The bigger one, and he looked ill the moment I called it. He'd spent his season's pay on an axe he could have bought from Urtharo for the price of a meal. He stood there a while, and then he asked me, very quietly, whether he could take the bid back." },
      },
      choices = {
        { text = "What did you tell him?", next = "war3" },
        { text = "Something else, Wabang.", next = "BACK" },
      },
    },
    war3 = {
      big = true,
      lines = {
        { id = "war3_default", text = "I told him no. A bid's a bid, and if I let one go, the house means nothing. But I'll tell you something. That evening the other warrior came by and bought the axe off him for half, so they'd each lost the same. I never worked out whether that was kindness or the end of the fight." },
      },
      choices = {
        { text = "You were right. A bid given is a word given.", next = "BACK", reply = "That's the rule, and I'd call it the same way again. I felt it, mind, because I'm not Thathung.", fx = { align = { honor = 1 } } },
        { text = "You could have let it go. It was only pride talking.", next = "BACK", reply = "Maybe, friend. But the next one would've asked, and the next. I'd sooner one orc learned it dear than have the whole floor learn it cheap.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_default", text = "Ore and leather, always, and linen for bandages. Potions, when the patrols are going out. Weapons sell slower than you'd think, because an orc wants to heft an axe before he pays for it. And anything from across the sea goes for whatever the seller dares to ask." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = {
        { id = "goblins_default", text = "Not a bit. They sell to both sides down in Booty Bay and Gadgetzan, and they're welcome to it. This house is for the Horde. What's sold here arms a grunt or feeds a peon, and I like knowing where it goes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crafter = {
      lines = {
        { id = "crafter_default", text = "Look at what the others are asking, then go a hair under, and never a lot under. If you cut the price in half, the next one cuts it again, and by week's end you're all giving it away. Ask Kithas at the Runeworks. She watches this floor like a hawk." },
      },
      choices = {
        { text = "A hair under, and no more.", next = "BACK", reply = "That's it! You'll do well. Come and tell me when you make your first gold off it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Ore up, leather steady, cloth cheap this week. Ask me again tomorrow and it'll all be different." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblins run the houses that sell to anyone. Good luck to them. I'd not sleep, selling an axe to a dwarf." } },
    internment = { { id = "tp_internment", text = "Nobody owned a thing, so nothing had a price. I think that's why I love this floor so much." } },
    thrall = { { id = "tp_thrall", text = "He's never bid here, more's the pity. Imagine the floor if he did!" } },
    advice = { { id = "tp_advice", text = "Never bid angry, friend. I've made a lot of copper off orcs who did." } },
    _none = { { id = "tp_none", text = "That's not come across my block, friend, so I couldn't put a price on it." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Grimful: orc auctioneer, Valley of Strength; keeps the house's ledger.
---------------------------------------------------------------------------
P:NPC {
  key = "grimful", id = TODO_NPC("Auctioneer Grimful"), name = "Auctioneer Grimful", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "exact" }, values = { "honest", "careful" },
  notices = { "purse", "class" },
  impression = {
    first = "Auctioneer Grimful keeps the ledger at the Orgrimmar auction house and can recite what a stack of linen fetched a month ago. He is dry and exact, and distrusts any price that seems too good.",
    third = "{name} met Auctioneer Grimful, the exact and dry-spoken keeper of the Orgrimmar auction ledger.",
  },
  greetings = {
    { id = "g_default", text = "Name and business. Buying, selling, or come to dispute a fee?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your last sale cleared, if that's what you've come to ask." },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "You're carrying a great deal of coin for someone standing in a crowd. I'd spend it or bank it, and soon." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You can't cover a deposit with that. Sell something small first, and work up from there." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know your trade by the way you stand. Whatever you list here, I'll be asked where it came from, so have an answer ready." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Auctioneer Grimful. Wabang does the shouting and Thathung does the explaining, and I write down what actually happened. Of the three, mine is the account that gets believed." },
        { id = "h_crafter", when = { any = { { profession = "Blacksmithing" }, { profession = "Leatherworking" }, { profession = "Tailoring" }, { profession = "Alchemy" }, { profession = "Engineering" }, { profession = "Enchanting" } } }, text = "Grimful. You make things to sell, by the look of your hands. Then you'll want to know what they fetched last month and not what Wabang says they're worth." },
        { id = "h_low", when = { maxLevel = 15 }, text = "Auctioneer Grimful. You're new to the house. There is a deposit, it is returned if the goods sell, and there is a cut. I'll not explain it a second time today." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on. I'm between entries." },
        { id = "h_again3", text = "Ask. I'll tell you what's written down." },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "Why does the house need a ledger at all?", next = "ledger" },
        { text = "Has anyone tried to cheat the house?", next = "cheat" },
        { text = "How do you work beside Wabang?", next = "wabang" },
        { text = "What does the ledger say about the city?", next = "city" },
        { text = "I've nothing to hide in what I sell.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Keep your columns straight, Grimful.", next = "END" },
      },
    },
    ledger = {
      lines = {
        { id = "ledger_default", text = "Because orcs remember a bargain the way they remember a battle, and each of them won. Without a written line, every sale ends as a quarrel in the yard. With one, I turn the book around and point. Nobody's drawn an axe over a ledger yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat = {
      lines = {
        { id = "cheat_default", text = "Often, and seldom well. They bid on their own goods to push the price, or list sand in a sealed flask. The cleverest was a seller who put up forged documents with a seal on them good enough to fool a grunt." },
      },
      choices = {
        { text = "What gave the forgery away?", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      lines = {
        { id = "cheat2_default", text = "The seal was perfect. That was the trouble with it. A real one is pressed in a hurry by a tired clerk, and it's always a little off the center. This had been done slowly, by someone who cared. I'd recorded four hundred of the real kind, so I knew what careless looked like." },
      },
      choices = {
        { text = "What became of the seller?", next = "cheat3" },
        { text = "Something else, Grimful.", next = "BACK" },
      },
    },
    cheat3 = {
      big = true,
      lines = {
        { id = "cheat3_default", text = "I gave his name to the Shattered Hand and thought no more of it. Later I heard he'd a family in the Drag and had forged the papers to get them a place on a caravan out of the dust. I'd have written him down all the same. But I've turned it over more than once." },
      },
      choices = {
        { text = "You did right. The house can't weigh every sad story.", next = "BACK", reply = "No, it can't. If the book bends for one, it's worth nothing to the rest. I still know his name.", fx = { align = { order = 1 } } },
        { text = "You might have warned him off and kept quiet.", next = "BACK", reply = "I might have. And the next forger would have heard that Grimful looks away. I don't see the road where that ends well.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wabang = {
      lines = {
        { id = "wabang_default", text = "With patience. He'd let a bid stand on a wink and a shout if I allowed it. But he fills the floor, and a full floor means honest prices, so I put up with the noise. We split it so: he makes them want it, and I make them pay for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "More than the Warchief's scouts could tell you. When bandage linen doubles in price, there's fighting in the Barrens that nobody's announced. When pick-heads sell out, someone's found a vein. I knew the Crossroads was hard pressed a week before the criers did." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rogue_default", text = "Good. Then you'll not object if I write it all down. Don't look at me so. I've nothing against your trade; the Shattered Hand buys here like anyone. I only like my columns to add up at the end of the day." },
      },
      choices = {
        { text = "Write it down. I'd do the same in your place.", next = "BACK", reply = "Then we understand each other. That's rarer at this counter than you'd think.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "It's all in the book. Linen's up, which I don't like the meaning of." } },
    burning_blade = { { id = "tp_burning_blade", text = "Certain reagents sell faster than there are warlocks in the Cleft to use them. I've told those who should be told." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "Their houses keep ledgers too, and better ones than mine. I'd give a tusk for an hour with one." } },
    thrall = { { id = "tp_thrall", text = "He sends a clerk for my figures each month. I've never been told what he does with them, and I approve of that." } },
    advice = { { id = "tp_advice", text = "Write the bargain down. Your memory is on your side, and that's the trouble with it." } },
    _none = { { id = "tp_none", text = "There's no entry for that. I don't speak to what isn't in the book." } },
  },
}

---------------------------------------------------------------------------
-- Vehena: troll cloth quartermaster for the Darkspear, Valley of Spirits; donations of wool, silk, mageweave and runecloth.
---------------------------------------------------------------------------
P:NPC {
  key = "vehena", id = TODO_NPC("Vehena"), name = "Vehena", title = "Horde Cloth Quartermaster",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "warm", "brisk" }, values = { "generous", "community" },
  notices = { "craft", "race" },
  impression = {
    first = "Vehena gathers cloth for the Darkspear in the Valley of Spirits, and can tell at a touch what a bolt is good for. She thanks every giver warmly, and has the next request ready before they turn to go.",
    third = "{name} met Vehena, who collects cloth for the Darkspear tribe in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, mon! Have you cloth in dat pack? No? Den you have ears, and I will put dem to work." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my friend comes back! Tell me you have been killin' somethin' dat wears clothes." },
    { id = "g_troll", when = { race = "Troll" }, text = "Cousin! Good, I need not explain to you why de tribe needs every thread it can get." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor's fingers! Den you know what a bolt of wool be worth, and I will not insult you by pretendin' I ask for little." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "It warms me to see a Darkspear walkin' tall in dis city, mon. We came here with nothin' on our backs, and I mean dat plainly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Vehena, and I gather cloth for de Darkspear. Wool, silk, mageweave, runecloth, whatever you can spare. De tribe came to Durotar with what it could carry off a sinkin' island, mon, and dat was not much." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Vehena, cousin. You know how we left de isles. I be makin' sure no child of de tribe ever again has to wear a sail for a blanket." },
        { id = "h_friend", when = { reputation = { faction = "Darkspear Trolls", min = "honored" } }, text = "Vehena greets you, friend of de tribe. De elders know your name now, mon, and it was cloth dat did it as much as any axe." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I can count and talk." },
        { id = "h_again2", text = "Go on and ask, mon, de pile will wait." },
        { id = "h_again3", text = "Somethin' more? Ask it, and den I will ask you for wool." },
      },
      choices = {
        { text = "I've cloth to give, Vehena.", next = "BUSINESS" },
        { text = "Why does the tribe need so much cloth?", next = "why" },
        { text = "Where does it all go?", next = "goes" },
        { text = "Rashona gathers cloth for the orcs. Do you compete?", next = "rashona" },
        { text = "You speak of how the tribe left the isles.", next = "isles" },
        { text = "I sew. Is there work I can do beyond giving?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Spirits keep you, Vehena.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Because we be few, mon, and we lost everythin' twice. De sea witch took de first home and Zalazane took de second. A tribe dat small cannot weave fast enough for its own bandages, never mind sails and nets and a shirt for every child at Sen'jin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    goes = {
      lines = {
        { id = "goes_default", text = "Bandages first, for de watchers at Sen'jin who keep Zalazane's creatures off de beach. Den nets, for de fishers. Den clothes. What be left over I send to de orcs' pile, because dey shared deir land with us when dey had little enough themselves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rashona = {
      lines = {
        { id = "rashona_default", text = "We do not compete, mon, we trade. Rashona has de Drag's weavers and too much wool, and I have fishers who need canvas, so when one pile runs short de other one leans. Dat be how de whole Horde works, on a good day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = {
        { id = "isles_default", text = "I was a girl. De murlocs came up out of de sea by de thousand, and de island was goin' under, and den de orcs were dere with deir ships. We ran for de boats with what we had in our hands. I had my mother's weavin' comb and nothin' else." },
      },
      choices = {
        { text = "You still have the comb?", next = "isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles2 = {
      lines = {
        { id = "isles2_default", text = "I use it every day, mon. Old Sen'jin died on dat island before we got away, and my mother did not reach de boats either, so de comb be all I have of her. I teach de young ones to weave with it, so her hands be in everythin' de tribe wears." },
      },
      choices = {
        { text = "The tribe owes the orcs for those ships.", next = "isles3" },
        { text = "Something else, Vehena.", next = "BACK" },
      },
    },
    isles3 = {
      big = true,
      lines = {
        { id = "isles3_default", text = "We do, and we have paid in blood at every battle since. Some of de young ones say de debt be paid, mon, and dat we should take back de isles and be our own people again, and leave de orcs to deir red rocks. I hear dem out, because I was young once." },
      },
      choices = {
        { text = "A debt like that is never done. Stand with the Horde.", next = "BACK", reply = "Dat be what Vol'jin says, and what my mother died believin'. I weave for both peoples, and I will till my hands stop.", fx = { align = { order = 1 } } },
        { text = "The debt is paid. The Darkspear should go home.", next = "BACK", reply = "One day we will, mon, I pray it. But I would go home as de Horde's friend, and not as a guest who left in de night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = {
        { id = "tailor_default", text = "Dere be, and bless you for askin'. De fishers at Sen'jin need nets mended and I have only two hands. Take what thread you need from my basket and bring back anythin' dat holds a knot. I cannot pay you, mon, and I will not pretend I can." },
      },
      choices = {
        { text = "I'll mend what I can.", next = "BACK", reply = "Den de spirits will know your name, and so will every fisher on dat beach.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "Zalazane sits dere now, with our own kin hexed into servin' him. Every bandage I roll be for de day we go back." } },
    voljin = { { id = "tp_voljin", text = "He was a boy when his father died on de beach. He has carried all of us since, and I have never seen him set us down." } },
    darkspear = { { id = "tp_darkspear", text = "Small, stubborn, and still here, mon. Dat be more dan de Gurubashi ever expected of us." } },
    thrall = { { id = "tp_thrall", text = "He gave us a valley in his own city and never once made us feel it was a gift. I would weave him a cloak if he would wear one." } },
    advice = { { id = "tp_advice", text = "Never throw away a rag, mon. Somebody be bleedin' somewhere." } },
    _none = { { id = "tp_none", text = "I do not know about dat, mon, and unless it be made of cloth you had better ask another." } },
  },
}

---------------------------------------------------------------------------
-- Sumi: orc blacksmithing supplier at the Burning Anvil, Valley of Honor; Saru Steelfury's daughter, Tumi's sister.
---------------------------------------------------------------------------
P:NPC {
  key = "sumi", id = TODO_NPC("Sumi"), name = "Sumi", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "wry" }, values = { "family", "practical" },
  notices = { "craft" },
  impression = {
    first = "Sumi sells coal, flux and tools at the forges of the Valley of Honor, where her father Saru teaches. She grew up underfoot at the anvils and knows what a smith has run out of before he does.",
    third = "{name} met Sumi, Saru Steelfury's daughter, who keeps the smiths of Orgrimmar supplied.",
  },
  greetings = {
    { id = "g_default", text = "Flux, coal, or a hammer? You've the look of someone who's run out of one of the three." },
    { id = "g_back", when = { metBefore = true }, text = "Back already. You used the flux too thick, didn't you? Everyone does, the first time." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. Good. Tell me what you're making and I'll tell you what you've forgotten to buy for it." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've scale all down your apron. You're not using enough flux, and I'm not saying so only because I sell it." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. If that's good copper in your pack, half the valley will want it. Don't sell to the first smith who asks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sumi. Saru Steelfury is my father, my sister Tumi sells the heavy armor, and I sell everything a smith burns through. Between the three of us you can't swing a hammer in this valley without paying a Steelfury." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Sumi. I supply the forges. I don't swing a hammer myself, before you ask, and I've heard every remark about it there is." },
        { id = "h_low", when = { maxLevel = 12 }, text = "I'm Sumi. If you're new to the forge, buy the cheap hammer. You'll ruin the first one whatever it cost, so let it be a cheap one." },
      },
      again = {
        { id = "h_again", text = "What else do you need?" },
        { id = "h_again2", text = "Go on. I've a coal cart due, but not yet." },
        { id = "h_again3", text = "Ask. I'll keep counting while you do." },
      },
      choices = {
        { text = "Let me see your stock, Sumi.", next = "BUSINESS" },
        { text = "A smith's daughter who doesn't smith.", next = "daughter" },
        { text = "What is it like, selling to your father's students?", next = "students" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "Tell me about your sister.", next = "tumi" },
        { text = "What does a new smith always forget to buy?", next = "forget", when = { profession = "Blacksmithing" } },
        { text = "I'll be back for flux, Sumi.", next = "END" },
      },
    },
    daughter = {
      lines = {
        { id = "daughter_default", text = "That's me. I can tell good steel from bad across a yard, and I could talk you through a weld step by step. I've just never wanted to stand at the fire. Father took it hard for a year or two. A Steelfury who doesn't forge seemed to him like a wolf that won't run." },
      },
      choices = {
        { text = "What changed his mind?", next = "daughter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daughter2 = {
      lines = {
        { id = "daughter2_default", text = "The winter the coal ran out. The caravan from the Barrens was a month late, and every forge in the valley went cold but ours. I'd bought double in autumn, because I'd seen the kodo drivers looking thin. Father stood in the yard and watched the others come to borrow from me." },
      },
      choices = {
        { text = "Did he say anything?", next = "daughter3" },
        { text = "Something else, Sumi.", next = "BACK" },
      },
    },
    daughter3 = {
      big = true,
      lines = {
        { id = "daughter3_default", text = "He said, \"Hm.\" From Saru Steelfury that's a speech. He's never again asked me when I'll take up the hammer. Tumi says I should have made him say it properly, out loud, that I was right to go my own way." },
      },
      choices = {
        { text = "\"Hm\" was enough. You'd proved it by the doing.", next = "BACK", reply = "That's how I feel. I'd rather have the full coal shed than the apology.", fx = { align = { honor = 1 } } },
        { text = "Tumi's right. He owed you the words.", next = "BACK", reply = "Maybe he did. But I know that orc. If I'd made him say it, he'd have resented the coal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = {
        { id = "students_default", text = "Funny. They're terrified of him and they tell me everything. I know who's behind on their work, who burned a blade and hid it, and who's sweet on whom. I never pass a word of it to Father, and that's why they keep telling me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coal = {
      lines = {
        { id = "coal_default", text = "Up from the Barrens by kodo, and the best of it from further south. Gorina has the ore from Makaru's diggers, and she and I share a cart when we can. The flux is goblin stuff, from Ratchet, and they change the price whenever they think I'm not counting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tumi = {
      lines = {
        { id = "tumi_default", text = "Two years older, a head taller, and sure she's right. She sells plate across the yard and fits it herself, and she'll tell a warrior to his face that he's put on weight. We fight like wolves. I'd take an axe for her, and I'd never say so where she could hear it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = {
        { id = "forget_default", text = "Tongs that fit the work. They buy one pair and use it for everything, and then they wonder why the piece slips. And a second hammer, lighter than the first, for when the arm's tired. Nobody ever believes me about the second hammer until the third week." },
      },
      choices = {
        { text = "I'll take the lighter hammer, then.", next = "BACK", reply = "Good. That makes you wiser than most of Father's students, and I'll not tell them you said so.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ratchet = { { id = "tp_ratchet", text = "The goblins there would sell me my own cart if I looked away. I like them. You always know what they want." } },
    trade = { { id = "tp_trade", text = "Coal's steady, flux is dear, and iron's whatever Gorina says it is this week." } },
    thrall = { { id = "tp_thrall", text = "He stopped at my stall once and asked what the smiths were short of. I told him, and the caravan came early. I've been loyal ever since." } },
    advice = { { id = "tp_advice", text = "Buy before you run out. It's always cheaper than buying after." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I only sell what the smiths burn through." } },
  },
}

---------------------------------------------------------------------------
-- Kithas: orc enchanting supplier at Godan's Runeworks, the Drag; keeps the shop's accounts.

---------------------------------------------------------------------------
-- Kor'geld: orc alchemy supplier at Yelmak's Alchemy and Potions, the Drag; Yelmak's Medley (Forever).

---------------------------------------------------------------------------
-- Sovik: goblin engineering supplier at Nogg's Machine Shop.
---------------------------------------------------------------------------
P:NPC {
  key = "sovik", id = TODO_NPC("Sovik"), name = "Sovik", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "quick", "smooth" }, values = { "profit", "inventive" },
  notices = { "craft", "purse" },
  impression = {
    first = "Sovik sells parts at the front of Nogg's Machine Shop and prices each one aloud as he hands it over. He seems fond of the orc engineer Thund, and enters the fondness in his book as a loss.",
    third = "{name} met Sovik, the fast-talking goblin who sells engineering parts at Nogg's Machine Shop in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, a customer! Bolts, powder, fuses, you name it, pal, I got it, and if I don't got it I know a guy." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! That means it either worked or it blew up, and either way you need parts. Step right up." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer, now we're talkin'. I'll tell ya right now, buy the good fuse. The cheap fuse is how I got this eyebrow." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "That's blasting powder on your cuff, friend, coarse grind, so you're makin' your own. That's smart, and it costs ya a finger sooner or later, but it's smart." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Whoa, whoa, I can hear that purse from here and it ain't sayin' much. No credit, pal, it's nothin' personal. I been burned, and I mean that both ways." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Sovik. Nogg owns the place, Roxxik's the brains, and I'm the fella who makes sure every bolt that leaves this shop got paid for. Somebody's gotta, 'cause those two would trade a rocket for a good idea." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Sovik, parts and supplies. You're in the trade, so listen, here's a tip on the house, and I don't say \"on the house\" often. Count your bolts before you start and after you finish." },
        { id = "h_orc", when = { race = "Orc" }, text = "Sovik's the name, and lemme guess, you seen the big orc in the back and figured this was an orc shop? Nah, pal, Thund's ours and we got papers on him, and I'm kiddin' about the papers, mostly." },
      },
      again = {
        { id = "h_again", text = "What else ya need, pal? The clock's runnin' and I bill by it." },
        { id = "h_again2", text = "Go on, pal, ask. Talk's free till I figure out how to charge." },
        { id = "h_again3", text = "Yeah? I'm listenin', I'm also countin'." },
      },
      choices = {
        { text = "Show me the parts, Sovik.", next = "BUSINESS" },
        { text = "You slip Thund the scratched parts.", next = "thund" },
        { text = "Where does all this come from?", next = "supply" },
        { text = "What's it like, a goblin shop in an orc city?", next = "city" },
        { text = "What's Roxxik building back there?", next = "roxxik" },
        { text = "Which is better made, goblin parts or gnomish?", next = "schools", when = { profession = "Engineering" } },
        { text = "Keep your eyebrows, Sovik.", next = "END" },
      },
    },
    thund = {
      lines = {
        { id = "thund_default", text = "Whoa, who told ya that? It was him, I bet, 'cause the big lug can't keep a secret. Listen, a scratched case don't sell, it just sits on the shelf costin' me space, so I move it to Thund at a discount, and that's inventory management, pal, not charity." },
      },
      choices = {
        { text = "It sounds a lot like charity.", next = "thund2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thund2 = {
      lines = {
        { id = "thund2_default", text = "Keep your voice down, will ya? Fine, listen. The kid swept this floor two whole years for nothin' to learn the trade, and I never seen a goblin do that, 'cause a goblin woulda stolen the plans by week three. So maybe a case gets scratched now and then, and accidents happen in a workshop." },
      },
      choices = {
        { text = "You scratch them yourself.", next = "thund3" },
        { text = "Something else, Sovik.", next = "BACK" },
      },
    },
    thund3 = {
      big = true,
      lines = {
        { id = "thund3_default", text = "I ain't sayin' I do and I ain't sayin' I don't. What I'm sayin' is, I got it down in the book as breakage, and Nogg signs off on breakage without lookin'. If he looked, I'd have some explainin' to do. So that's between you, me and the ledger." },
      },
      choices = {
        { text = "Your secret's safe. The kid earned it.", next = "BACK", reply = "Yeah, well. He did. Don't spread it around, I got a reputation as a miser and I worked hard for it.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Nogg should know. It's his stock you're giving away.", next = "BACK", reply = "Aw, c'mon, pal, technically, sure. But Nogg got two years of free sweepin' outta that orc, so I figure the books are square.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = {
        { id = "supply_default", text = "Ratchet, every crate, by wagon up through the Barrens. Powder, springs, copper tube, the works. I lose one wagon in ten to quilboar and one in twenty to my cousin's drivin', and it's all priced in. You want it cheaper, pal, you go fight the quilboar." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "Good money, weird neighbors. Orcs don't haggle, see, they just glare at ya, and then they pay or they don't. Took me a year to learn the glares. But they're straight with ya, I'll say that. Nobody in this town ever sold me a map to a mine that wasn't there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    roxxik = {
      lines = {
        { id = "roxxik_default", text = "Beats me, and I sell him the parts. Last month it was forty feet of copper tube and a kettle. Month before, nine clock springs and a saddle. I quit askin'. When it's done it'll either make us rich or take the roof off, and I got insurance against one of those." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    schools = {
      lines = {
        { id = "schools_default", text = "Goblin, and I'd say that even if I wasn't one. Gnome stuff's all gears inside gears, it's beautiful, I admit it, and when it breaks ya need three gnomes and a diagram. Goblin stuff breaks, ya hit it, it works. That's value, friend." },
      },
      choices = {
        { text = "You hit it and it works. I'm sold.", next = "BACK", reply = "See, that's a customer who gets it. Tell your friends, and tell 'em it was Sovik's.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ratchet = { { id = "tp_ratchet", text = "Home sweet home, pal. Smells like low tide and gunpowder, and I miss it every day." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's the Cartel. They take a cut of my cut, and in return nobody burns my wagons on purpose." } },
    venture_company = { { id = "tp_venture_company", text = "Those guys give goblins a bad name. And I say that as a fella who'd sell ya the same fuse twice." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomes built a whole city outta gadgets and then gassed themselves out of it. Tragic. I'd love to get a look at the salvage." } },
    advice = { { id = "tp_advice", text = "Buy the good fuse. I'm tellin' ya, it's the cheapest thing you'll ever overpay for." } },
    _none = { { id = "tp_none", text = "Got nothin' on that, pal. If it don't come in a crate, it don't cross my counter." } },
  },
}

---------------------------------------------------------------------------
-- Gorina: orc mining supplier, Red Canyon Mining, Valley of Honor.

---------------------------------------------------------------------------
-- Shankys: orc fishing supplier at Lumak's Fishing, Valley of Honor.

---------------------------------------------------------------------------
-- Borya: orc tailoring supplier at Magar's Cloth Goods, the Drag.
---------------------------------------------------------------------------
P:NPC {
  key = "borya", id = TODO_NPC("Borya"), name = "Borya", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "genial", "chatty" }, values = { "friendly", "trade" },
  notices = { "craft", "class" },
  impression = {
    first = "Borya sells thread, dye and bolts at Magar's Cloth Goods in the Drag, and hears every tailor's complaint in the city. He passes along all of it, cheerfully, and none of it with malice.",
    third = "{name} met Borya, the talkative supplier of thread and gossip at Magar's Cloth Goods in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in! Thread, dye, needles, and all the news of the Drag for nothing." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! You'll never guess what Handor said about Tor'phan since you were last in." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Don't tell me what you're short of, let me guess. It's coarse thread, because it's always coarse thread." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You've dye on your cuffs, and it's the red. Wash it in cold water, friend, or it'll be on everything you own by week's end." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Now that's a robe that's seen some road. If you want it patched, Snang will do it, and he'll scold you the whole time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Borya. Magar teaches the tailoring and Snang takes the beginners, and I sell them all their thread. I talk, too. Magar says I sell a spool with every story, and I've never worked out if that's praise." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "Borya, at your service. You sew, so you'll know that a tailor's never short of cloth, only of the one color he needs. I try to keep that color on the shelf." },
        { id = "h_low", when = { maxLevel = 12 }, text = "I'm Borya! New to the city? Then sit a moment and let me tell you who's who on the Drag. It'll save you a month of finding out." },
      },
      again = {
        { id = "h_again", text = "What else? I've plenty more." },
        { id = "h_again2", text = "Go on, ask! I was about to tell you anyway." },
        { id = "h_again3", text = "Yes? Oh, and remind me to tell you about the dye cart." },
      },
      choices = {
        { text = "Show me your thread and dyes, Borya.", next = "BUSINESS" },
        { text = "Snang says Handor and Tor'phan complain alike.", next = "feud" },
        { text = "Who's who on the Drag, then?", next = "drag" },
        { text = "Where do the dyes come from?", next = "dye" },
        { text = "What's the talk among the tailors this week?", next = "talk" },
        { text = "What should a tailor keep stocked?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Keep talking, Borya.", next = "END" },
      },
    },
    feud = {
      lines = {
        { id = "feud_default", text = "In the same words! Handor comes in and says Tor'phan's seams wouldn't hold a breeze. An hour later Tor'phan comes in and says the same of Handor. I sell them both the same thread off the same spool, and I've never said so to either." },
      },
      choices = {
        { text = "Why not tell them?", next = "feud2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feud2 = {
      lines = {
        { id = "feud2_default", text = "Because they love it. I worked that out years ago. They shout across the Drag all day, and customers stop to watch, and both of them sell twice what they would in peace. And at night, friend, I've seen the two of them sharing a jug behind the Kodohide shop." },
      },
      choices = {
        { text = "So the whole feud is for show?", next = "feud3" },
        { text = "Something else, Borya.", next = "BACK" },
      },
    },
    feud3 = {
      big = true,
      lines = {
        { id = "feud3_default", text = "I thought so. Then last winter Handor was ill for a week, and Tor'phan stood at his own stall and hardly sold a thing. He looked lost. He wouldn't go across to visit, since that would spoil the feud. I've wondered ever since if I should have told Handor that he pined." },
      },
      choices = {
        { text = "Tell him. Friends should know they're missed.", next = "BACK", reply = "You think so? I do too, for the most part. Next jug they share, perhaps I'll bring the cups and say it.", fx = { align = { light = 1 } } },
        { text = "Say nothing. It's their game, and they play it well.", next = "BACK", reply = "That's what Magar told me. \"Sell thread, Borya.\" It's good advice, and I've never once managed to take it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drag = {
      lines = {
        { id = "drag_default", text = "Start at this end with Magar's, which is us, and across the way are the Kodohide Leatherworkers, with Karolek and his hides. Then come Zamja and Borstan's firepit, where you eat, Godan's Runeworks for enchanting, Yelmak's shop, which is the one that smells, and Gotri's for bags. I wouldn't linger at the far end, where it goes down to the Cleft." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = {
        { id = "dye_default", text = "The reds are from Durotar clay, and nobody does a red like ours. Blues come up from the coast, from a shell the trolls gather. Purple is goblin, and they won't say what's in it. I've decided not to ask. It holds, and that's all I need to know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    talk = {
      lines = {
        { id = "talk_default", text = "Silk! A goblin caravan's said to be coming with spider silk, and every tailor on the Drag is pretending not to care and counting their coin. And Rashona's cloth pile is low again, so she'll be round with her list. Give her your scraps, friend. It goes to bandages." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = {
        { id = "tailor_default", text = "Coarse thread, always, more than you think. Bleach, because somebody will want white. And one spool of the good red, hidden, for the customer who comes in the day before a feast. That spool's paid my rent three winters running." },
      },
      choices = {
        { text = "Coarse thread, bleach, and a hidden red.", next = "BACK", reply = "You've got it! And if you ever hear any news on your travels, well, you know where I am.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Wool's cheap, silk's a rumor, and mageweave's for those with more gold than I'll ever see." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblins bring the purple and the silk and all the best stories. Half of them might even be true." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls dive for the blue shells themselves, off Sen'jin. I pay them fairly, since nobody else can get it." } },
    thrall = { { id = "tp_thrall", text = "I sold thread for a banner that hangs in Grommash Hold. I tell everyone, and you're no exception." } },
    advice = { { id = "tp_advice", text = "Wash the red in cold water. You'll thank me." } },
    _none = { { id = "tp_none", text = "Now that I've not heard about. Tell me, if you find out, and I'll see it gets around." } },
  },
}

---------------------------------------------------------------------------
-- Tamar: orc leatherworking supplier at Kodohide Leatherworkers, the Drag.

---------------------------------------------------------------------------
-- Zeal'aya: troll herbalism supplier beside Jandi's arboretum.

---------------------------------------------------------------------------
-- Xen'to: troll cooking supplier at Borstan's Firepit, the Drag, beside Zamja.
---------------------------------------------------------------------------
P:NPC {
  key = "xento", id = TODO_NPC("Xen'to"), name = "Xen'to", title = "Cooking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "jolly", "sly" }, values = { "hospitality", "generous" },
  notices = { "craft", "race" },
  impression = {
    first = "Xen'to sells spices and cooking stock at the firepit in the Drag, beside the cook Zamja. He is a jolly troll who believes most quarrels in the Horde could be mended with a better supper.",
    third = "{name} met Xen'to, the jolly Darkspear who sells spices at the firepit in Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_default", text = "Come close and smell dis, mon! No, do not ask what it is first. Smell, den ask." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you came back! So de spice did not kill you. I told Zamja it would not." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Den you and I be friends already. What be in your pot dis week, and why be it so sad?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You have burned your tongue tastin', I can hear it in how you talk. Good! A cook who does not taste be only a boiler." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Let me guess, mon. Boar, salt, fire, and you call it supper. Stand dere, I will find you somethin' to weep over." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Xen'to! Zamja teaches de cookin' and Borstan smokes de meat, and I sell de spices dat make either one worth eatin'. Without me, mon, dis whole city would taste of boiled boar." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I be Xen'to, and you cook, so I will be honest with you. Half of what I sell be plain salt, because dat be what orcs buy. De other half I keep for people like you." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Xen'to, cousin, and you know real food! Come, I have a little dried pepper from home hidden under de counter, and I show it only to Darkspear." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I can talk and grind." },
        { id = "h_again2", text = "Ask, ask! De pot be not goin' anywhere." },
        { id = "h_again3", text = "Go on. And taste dis while you think." },
      },
      choices = {
        { text = "Show me your spices, Xen'to.", next = "BUSINESS" },
        { text = "What do orcs make of troll cooking?", next = "orcs" },
        { text = "How do you and Zamja get along?", next = "zamja" },
        { text = "Where do the spices come from?", next = "spice" },
        { text = "You think a supper can mend a quarrel.", next = "supper" },
        { text = "I cook. What would you put in my pack?", next = "cook", when = { profession = "Cooking" } },
        { text = "Eat well, Xen'to.", next = "END" },
      },
    },
    orcs = {
      lines = {
        { id = "orcs_default", text = "Dey be afraid of it, mon, great warriors, afraid of a pepper! But I be patient. I put a little in Borstan's rub and say nothin'. Den a little more. In three years I have de whole Drag eatin' food dat would have made dem cry when I came." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    zamja = {
      lines = {
        { id = "zamja_default", text = "Like two cooks at one pot. She says I use too much and I say she chops too loud. But she be de best cook in Orgrimmar and she knows what a spice be for. When she tells an orc his stew be bland, mon, I be standin' right behind her with de cure." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spice = {
      lines = {
        { id = "spice_default", text = "De hot ones from de coast below Sen'jin, where de trolls dry dem on de rocks. Salt from de flats. De sweet ones come by goblin ship from de south, and dey cost me dearly. And a few I grow myself in a pot Zeal'aya gave me, which I will not sell to anyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    supper = {
      lines = {
        { id = "supper_default", text = "I know it can, mon, because I have seen it. When de Darkspear first came to dis city, de orcs and de trolls ate apart, each at deir own fire, though we had fought side by side. It was not hate, it was only dat nobody would go first." },
      },
      choices = {
        { text = "Who went first?", next = "supper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supper2 = {
      lines = {
        { id = "supper2_default", text = "I did, and not from courage. I had made too much. A whole pot of island stew, mon, and it would not keep. So I carried it over to a fire of orc grunts and set it down and said, \"Eat or do not.\" Dey looked at it a long time." },
      },
      choices = {
        { text = "Did they eat it?", next = "supper3" },
        { text = "Something else, Xen'to.", next = "BACK" },
      },
    },
    supper3 = {
      big = true,
      lines = {
        { id = "supper3_default", text = "One did, de biggest, to show he was not afraid. He wept from de pepper and he laughed, and den dey all ate. Next night dey brought boar to our fire. But one old troll scolded me after. He said we should keep our food for ourselves, or soon we would have nothin' dat was only ours." },
      },
      choices = {
        { text = "You did right. A shared pot makes one people.", next = "BACK", reply = "Dat be what I believe, mon. I would trade a secret recipe for a friend any day of de year.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elder had a point. A tribe needs its own things.", next = "BACK", reply = "He did, mon, I will not say he was a fool. Dat be why de pepper under my counter be for Darkspear only. I keep a little back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_default", text = "Salt, first, more dan you think you need. Den one hot spice and one sweet, and learn dose two before you buy a third. And a little dried pepper for de day de meat has turned and you have nothin' else. It hides a great deal, mon. I say no more." },
      },
      choices = {
        { text = "One hot, one sweet, and plenty of salt.", next = "BACK", reply = "Good! You will eat well and so will whoever travels with you. Come back and tell me what you made.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "Crab, mon. Crab pulled from de rocks and cooked in its own shell with pepper. I dream about it." } },
    booty_bay = { { id = "tp_booty_bay", text = "De sweet spices come through dere, and de goblins double de price each time it changes hands." } },
    darkspear = { { id = "tp_darkspear", text = "We cook like we fight, mon, quick and with a great deal of heat." } },
    thrall = { { id = "tp_thrall", text = "I sent a pot up to Grommash Hold once. It came back empty and nobody said a word, so I decided he liked it." } },
    advice = { { id = "tp_advice", text = "Taste as you go, mon. De pot does not lie, but it only tells you if you ask." } },
    _none = { { id = "tp_none", text = "I have never cooked dat or eaten it, mon, so what could I tell you?" } },
  },
}

---------------------------------------------------------------------------
-- Tumi: orc heavy armor merchant, Valley of Honor; Saru Steelfury's elder daughter, Sumi's sister.

---------------------------------------------------------------------------
-- Kiro: orc war harness maker, Kiro's Harnesses, Valley of Honor.

---------------------------------------------------------------------------
-- Morgum: orc leather armor merchant at Soran's Leather and Steel Armory, Valley of Strength.

---------------------------------------------------------------------------
-- Sana: orc mail armor merchant at Soran's Leather and Steel Armory, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "sana", id = TODO_NPC("Sana"), name = "Sana", title = "Mail Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "stern", "exact" }, values = { "honest", "order" },
  notices = { "gear", "class" },
  impression = {
    first = "Sana sells mail armor at Soran's armory in the Valley of Strength at one fixed price, without conversation. She counts the rings in a sleeve the way other merchants count coin, and expects her customers to be as exact.",
    third = "{name} met Sana, the stern mail armor merchant at Soran's armory, who names one price and keeps it.",
  },
  greetings = {
    { id = "g_default", text = "Mail is on this wall. The price is marked on each piece, and it is the price." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. If something I sold you has failed, show me the rings, and I will tell you whose fault it was." },
    { id = "g_mail", when = { class = { "HUNTER", "SHAMAN" } }, text = "You wear mail, or soon will. Good. Then you will want to see the shoulders first, because that is where a poor weave shows." },
  },
  notice = {
    { id = "n_worn", cat = "gear", when = { durability = { max = 0.3 } },
      text = "There are open rings all down your left side. Mail fails one link at a time, and you have let a good many go." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You carry a shield, by the wear on your sleeve, and so you will want the heavier weave on that arm only." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sana. I sell mail at Soran's, and Morgum sells leather across the floor and talks enough for both of us. My prices are fair, and I do not change them for anyone, so we need not waste the morning." },
        { id = "h_mail", when = { class = { "HUNTER", "SHAMAN", "WARRIOR" } }, text = "I am Sana. You will wear what I sell where it matters, so I will be plain with you. Every piece here has been counted ring by ring, and I have sent back more than I have kept." },
        { id = "h_light", when = { class = { "MAGE", "PRIEST", "WARLOCK", "ROGUE" } }, text = "I am Sana. Mail is not for you, and I will not pretend it is in order to make a sale. If you want leather, Morgum has it, and he will be glad of someone new to talk at." },
      },
      again = {
        { id = "h_again", text = "Is there something further?" },
        { id = "h_again2", text = "Go on, though I would ask you to be brief." },
        { id = "h_again3", text = "Ask, and I will give you a straight answer." },
      },
      choices = {
        { text = "Show me your mail, Sana.", next = "BUSINESS" },
        { text = "You never haggle. Morgum does little else.", next = "price" },
        { text = "You count the rings in every piece?", next = "rings" },
        { text = "How did you come to sell armor?", next = "armor" },
        { text = "What do you make of this valley?", next = "valley" },
        { text = "I hunt in mail. What should I ask of it?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll take up no more of your morning.", next = "END" },
      },
    },
    price = {
      lines = {
        { id = "price_default", text = "He does, and he enjoys it, and I have stopped trying to cure him. I name what a thing is worth and I do not move from it. A grunt with three silver should pay what a captain pays. If I bent for the one who argued best, I would be cheating the one who was too proud to ask." },
      },
      choices = {
        { text = "That's a hard line to hold in a market.", next = "price2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price2 = {
      lines = {
        { id = "price2_default", text = "It is, and I have lost sales by it. There was a young hunter, newly come from the Valley of Trials, who was four silver short of a hauberk. She did not beg, and I respected her for that. She only looked at it for a long while and then put it back on the hook." },
      },
      choices = {
        { text = "Did you let her have it?", next = "price3" },
        { text = "Something else, Sana.", next = "BACK" },
      },
    },
    price3 = {
      big = true,
      lines = {
        { id = "price3_default", text = "No. I told her the price was the price, and that I would hold the piece for one month. She came back in three weeks with the silver, and with a scar she had not had before. I have asked myself whether four silver's worth of mail would have spared her the scar." },
      },
      choices = {
        { text = "You kept faith with every customer. That matters more.", next = "BACK", reply = "So I believe. A price that bends for a sad face is no price, and the next sad face may be a liar. Still, I remember the scar.", fx = { align = { order = 1 } } },
        { text = "Four silver against a wound is no bargain at all.", next = "BACK", reply = "No, it is not. I have run that sum many times, and it comes out badly each time. I held the rule, and I am not certain I was right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rings = {
      lines = {
        { id = "rings_default", text = "In the shoulders and the collar, yes, every one. A lazy smith stretches the weave there to save wire, since nobody looks. I look. I have found sleeves with a third of the rings they should have, and I returned them to the forge with the count written on a tag." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    armor = {
      lines = {
        { id = "armor_default", text = "In the camps I mended the guards' mail, because my fingers were small and they had nobody better. I hated them, and I learned the work all the same. When we were freed I found it was the one skill I had, and I chose to use it for my own people." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = {
        { id = "valley_default", text = "It is loud, and everybody in it is arriving or leaving. I prefer the ones who are leaving, since they know what they need. The inn sends me those who have slept badly in poor armor, and the bank sends me those who can now afford better." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_default", text = "Ask that it be quiet. Mail that rattles will lose you every shot you take from cover. Look for rings that are riveted and not merely butted together, and have the hem bound in leather. It will cost more, and you will eat more often." },
      },
      choices = {
        { text = "Riveted rings and a bound hem.", next = "BACK", reply = "Yes. You listened, which is more than most do. The third piece from the left is made so.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "I mended the mail of the orcs' jailers, and I did it well. I have never decided how I feel about having done it well." } },
    trade = { { id = "tp_trade", text = "Iron is dear, so mail is dear. I do not set the cost of iron." } },
    warsong = { { id = "tp_warsong", text = "They buy mail cut short for the saddle, and they pay without complaint. I think well of them." } },
    thrall = { { id = "tp_thrall", text = "He is said to be just. I try to keep one small shop the way I am told he keeps a nation." } },
    advice = { { id = "tp_advice", text = "Count the rings at the shoulder. If the merchant will not let you, leave." } },
    _none = { { id = "tp_none", text = "I do not know, and I will not guess at it to seem obliging." } },
  },
}

---------------------------------------------------------------------------
-- Urtharo: orc weapon merchant at the Shattered Axe, Valley of Strength; plain weapons for new recruits.

---------------------------------------------------------------------------
-- Zendo'jian: troll weapon vendor, Arms of Legend, Valley of Honor; light, quick weapons.

---------------------------------------------------------------------------
-- Koru: orc mace and staff vendor, Arms of Legend, Valley of Honor; sells to the shaman.

---------------------------------------------------------------------------
-- Shoma: orc weapon vendor, Arms of Legend, Valley of Honor; swords and axes.

---------------------------------------------------------------------------
-- Kareth: orc blade merchant at the Slow Blade, Cleft of Shadow.
---------------------------------------------------------------------------
P:NPC {
  key = "kareth", id = TODO_NPC("Kareth"), name = "Kareth", title = "Blade Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "cool", "watchful" }, values = { "discreet", "cunning" },
  notices = { "class", "stealth" },
  impression = {
    first = "Kareth sells daggers and short blades at the Slow Blade in the Cleft of Shadow, and asks no customer for a name. He says he can tell what a knife is meant for by how the buyer tests its point.",
    third = "{name} met Kareth, the discreet blade merchant of the Slow Blade in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "Look as long as you like. I'll not ask your name, and I'd be obliged if you didn't offer it." },
    { id = "g_back", when = { metBefore = true }, text = "You've been here before. I remember the hands, if not the face, and that's how I prefer it." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of Shenthul's, by the way you checked the door. Come round to the left case; I keep the better points there." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You tested the tip of that one on your thumbnail and not on the pad. Somebody taught you properly, and I can guess who." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I didn't see you come in, and I'll not ask how you did it. But the blades on that rack have all shifted a little, so I know where you've been standing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kareth, and this is the Slow Blade. I sell knives and short swords to those who prefer their work quiet. I don't ask what the work is, and in return my customers don't tell me, which keeps us all comfortable." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Kareth. You'll have been sent by Ormok or Gest, who both know I keep an honest edge. Ormok's students buy what they can afford, and Gest's buy one good blade and keep it for years." },
        { id = "h_loud", when = { class = { "WARRIOR", "PALADIN" } }, text = "I'm Kareth. There's nothing here longer than your forearm, so I doubt I can help you. Though I've sold a boot-knife to more than one warrior who never mentioned it to his friends." },
      },
      again = {
        { id = "h_again", text = "Is there something else?" },
        { id = "h_again2", text = "Go on, and keep your voice at that level." },
        { id = "h_again3", text = "Ask, and I'll answer what's mine to answer." },
      },
      choices = {
        { text = "Show me your blades, Kareth.", next = "BUSINESS" },
        { text = "Why call it the Slow Blade?", next = "name" },
        { text = "You never ask what a knife is for.", next = "ask" },
        { text = "What do you make of your neighbors in the Cleft?", next = "cleft" },
        { text = "You know the Shattered Hand's trainers.", next = "hand" },
        { text = "What should I look for in a dagger?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I was never here, Kareth.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "name_default", text = "Because the fast blade is the one everyone sees. A slow one goes in while the other fellow is still deciding whether you mean it. It's an old Shattered Hand saying, and I took it for the sign since it tells my sort of customer that I understand them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = {
        { id = "ask_default", text = "I don't, and it's a rule I made for my own sake. If I knew, I'd have to decide whether to sell, and then I'd be a judge and not a merchant. So I watch how they test the point, and I know anyway, and I say nothing." },
      },
      choices = {
        { text = "What can you tell from how they test it?", next = "ask2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask2 = {
      lines = {
        { id = "ask2_default", text = "Nearly everything. One who means to skin or cut rope runs a thumb along the edge. A fighter checks the guard and the balance. And one who tests only the very tip, carefully, and asks how narrow it is, means to put it somewhere particular in someone who isn't expecting it." },
      },
      choices = {
        { text = "And you sell to that one as well?", next = "ask3" },
        { text = "Something else, Kareth.", next = "BACK" },
      },
    },
    ask3 = {
      big = true,
      lines = {
        { id = "ask3_default", text = "I have, and most of them were the Hand's, doing the Warchief's work. Once it was a young orc with shaking fingers and no training at all, who wanted the narrowest thing I had. I sold it. I've never learned what he did with it, and I listen for it still." },
      },
      choices = {
        { text = "You should have refused him. You knew what he meant.", next = "BACK", reply = "I knew, and I've told myself since that he'd have found another seller. It's true, and it's never once been a comfort to me.", fx = { align = { light = 1 } } },
        { text = "A merchant sells. What buyers do is theirs to answer for.", next = "BACK", reply = "That's the rule, and I made it. I notice it sits easier in the saying than it does at night.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = {
        { id = "cleft_default", text = "Rekkul sells poison across the way, and we send each other customers without a word. Katis and Muragus keep the wands and staves. The warlocks are at the far end, and I'd sooner not know what they buy. Kor'jus sells mushrooms and sees more than anyone thinks he does." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hand = {
      lines = {
        { id = "hand_default", text = "Ormok and Gest, yes. They send their students here and trust me not to sell a novice more blade than he can use. Shenthul himself has been in twice. He bought nothing either time, and looked at everything, and I took that as his approval." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rogue_default", text = "A tang that runs the full length of the grip, or it will snap the first time you twist it. A guard small enough not to catch on your own cloak. And no shine, friend. I've a tin of blacking on the counter, and the careful ones use it before they leave." },
      },
      choices = {
        { text = "Full tang, small guard, and no shine.", next = "BACK", reply = "You'll do. Use the blacking, there's no charge for it, and it's saved more of my customers than the steel has.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_blade = { { id = "tp_burning_blade", text = "Some of my customers go on to the far end of the Cleft after they leave me. I notice which ones, and I've told Ormok." } },
    thrall = { { id = "tp_thrall", text = "He keeps the Hand, and the Hand keeps me in trade. I'd say that makes me loyal, in a roundabout way." } },
    second_war = { { id = "tp_second_war", text = "The old Shattered Hand carried blades like these. I'd like to think they're put to better use now." } },
    trade = { { id = "tp_trade", text = "Small blades, steady trade. Nobody in this city ever stops needing a knife." } },
    advice = { { id = "tp_advice", text = "Black the blade before you carry it at night. Moonlight has betrayed better hands than yours." } },
    _none = { { id = "tp_none", text = "I don't know, and that's the truth. If I did know, I'd likely tell you the same." } },
  },
}

---------------------------------------------------------------------------
-- Katis: orc wand merchant at Ironwood Staves and Wands, Cleft of Shadow; shares the shop with Muragus.
---------------------------------------------------------------------------
P:NPC {
  key = "katis", id = TODO_NPC("Katis"), name = "Katis", title = "Wand Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet", "dry" }, values = { "careful", "curious" },
  notices = { "arcane", "class" },
  impression = {
    first = "Katis sells wands in the Cleft of Shadow and says so little that her customers find themselves whispering. She cannot cast a spell herself, and seems quietly fascinated by everyone who can.",
    third = "{name} met Katis, the soft-spoken wand merchant in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "The wands are in the case. Point to the one you'd like to hold, and please don't wave it about until I've stepped to one side." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The one you held last time has been restless ever since, if a wand can be said to be." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "You can use what I sell, which is more than I can. Come and choose slowly; I like to watch someone who knows how." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "There's a scorch on the cuff of your casting hand, shaped like a ring. You've been firing a wand that's too strong for its wood, and it will split soon." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your sort always asks for the darkest wood, as if the color did the work. It doesn't, though I've stopped saying so." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Katis. I sell wands here, and Muragus has the staves across the shop. He talks to the customers and I mostly point. I find that people who can cast prefer not to be chattered at while they choose." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "I'm Katis. You've the gift, so I'll leave you to it. Hold any of them you like, and tell me afterward what you felt, because I can only guess." },
        { id = "h_noncaster", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } }, text = "I'm Katis. A wand will do nothing in your hand, as it does nothing in mine. But you're welcome to look, and I won't hurry you; I spent years looking before I ever sold one." },
      },
      again = {
        { id = "h_again", text = "Yes? Something more?" },
        { id = "h_again2", text = "Go on, I'm listening closely." },
        { id = "h_again3", text = "Ask, and you needn't raise your voice to do it." },
      },
      choices = {
        { text = "Show me your wands, Katis.", next = "BUSINESS" },
        { text = "You sell wands, yet you can't use one?", next = "cannot" },
        { text = "What makes one wand better than another?", next = "better" },
        { text = "Gest says you sell by pointing.", next = "quiet" },
        { text = "How do you find working in the Cleft?", next = "cleft" },
        { text = "Shall I tell you how this one feels in the hand?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Thank you, Katis. I'll go quietly.", next = "END" },
      },
    },
    cannot = {
      lines = {
        { id = "cannot_default", text = "No. I've held every wand in that case and felt nothing but wood. I came to the trade through my mother, who carved them, and she couldn't cast either. We've sold the one thing we can't use for two generations, like a blind family that makes lamps." },
      },
      choices = {
        { text = "Doesn't that trouble you?", next = "cannot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cannot2 = {
      lines = {
        { id = "cannot2_default", text = "It used to, very much. When I was young I'd take one out at night and point it at the wall and wait. I thought that if I only wanted it enough, something would come. Nothing ever did, and in time I stopped pointing and started watching my customers." },
      },
      choices = {
        { text = "What did you learn from watching?", next = "cannot3" },
        { text = "Something else, Katis.", next = "BACK" },
      },
    },
    cannot3 = {
      big = true,
      lines = {
        { id = "cannot3_default", text = "That they don't see what they hold. A mage picks up a wand, fires it, and puts it back, and never once looks at the grain or the join. I know every wand here as well as I know my own hands. I've wondered which of us truly has the better of it." },
      },
      choices = {
        { text = "You do. To know a thing is worth more than to use it.", next = "BACK", reply = "I've come to think so. It's kind of you to say it without my asking. I'd still give a great deal for one spark.", fx = { align = { order = 1 } } },
        { text = "They do. A wand is made to be fired, not studied.", next = "BACK", reply = "That's true, and it's what Muragus tells me. I know them only as a jailer knows his prisoners, perhaps. But I do know them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = {
        { id = "better_default", text = "The wood must be straight-grained and dried slowly, over years. Then there is the core, and what was done to bind it, which I can only judge by how casters behave. If three mages in a row put a wand down quickly, I take it out of the case." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_default", text = "He would notice. Gest sits on his stool and watches the whole Cleft, and I've seen him looking this way. I point because it's enough. People down here value a merchant who doesn't make them say aloud what they've come for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = {
        { id = "cleft_default", text = "It suits me, since it's dim and quiet and nobody shouts. The warlocks buy from me and never speak, the Shattered Hand buy nothing and look at everything, and Kor'jus brings me mushrooms on feast days. I'd be lost up in the Drag, with everybody calling out prices." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = {
        { id = "caster_default", text = "Please do. I ask everyone, and hardly anyone answers properly. Tell me where you feel it first, in the fingers or the wrist, and whether it's warm. I keep a little book of what casters say, wand by wand. It's the nearest I come." },
      },
      choices = {
        { text = "It starts in the wrist, and it's cold, like well water.", next = "BACK", reply = "Cold as well water, and in the wrist. Thank you for that. It's the ash with the silver band, and nobody has ever called it cold before, so I'll write it down tonight.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "They say its mages made wands by the hundred, and wrote down how. I'd read every page, and I could do none of it." } },
    forsaken = { { id = "tp_forsaken", text = "Their casters handle a wand as if it were a pen. They're the only ones who look at the grain." } },
    burning_blade = { { id = "tp_burning_blade", text = "Certain warlocks buy two wands and pay for three, and ask me to forget them. I take the coin, and I remember." } },
    thrall = { { id = "tp_thrall", text = "A shaman has no need of wands. I've sometimes thought that's why I trust him." } },
    advice = { { id = "tp_advice", text = "If a wand grows hot at the grip, put it down. The wood is telling you something the spell won't." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I only watch, and nobody has shown me that." } },
  },
}

---------------------------------------------------------------------------
-- Borstan: orc meat vendor at Borstan's Firepit, the Drag; Meal Appeal, Favorite Food, Changing Tastes (Forever).

---------------------------------------------------------------------------
-- Olvia: orc meat vendor at the Chophouse, Valley of Strength, by the inn.
---------------------------------------------------------------------------
P:NPC {
  key = "olvia", id = TODO_NPC("Olvia"), name = "Olvia", title = "Meat Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "plain" }, values = { "practical", "honest" },
  notices = { "hunger", "pet" },
  impression = {
    first = "Olvia runs the Chophouse beside the inn in the Valley of Strength and cuts meat faster than most customers can order it. She has no patience for fuss, and takes a quiet pride in a clean block.",
    third = "{name} met Olvia, the brisk butcher of the Chophouse in Orgrimmar's Valley of Strength.",
  },
  greetings = {
    { id = "g_default", text = "What'll it be? I've boar, I've more boar, and I've a little strider if you're quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The same cut as before, or have you grown ambitious?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. If that beast of yours is hungry, say so now, and I'll see what I have in the scrap pail." },
  },
  notice = {
    { id = "n_thin", cat = "hunger", when = { maxLevel = 10 },
      text = "You're thin as a spear haft. Buy the fatty cut, and never mind what it looks like, because it's what you need." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} back from the block, if you please. I've lost a whole haunch to a hunter's wolf before now, and the hunter only laughed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Olvia, and this is the Chophouse. I cut it clean and I sell it quick. If you want it smoked and sung over, Borstan's in the Drag, and he'll take half a day about it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I'm Olvia. You'll be feeding a beast as well as yourself, so I'll tell you what I tell every hunter. The scrap pail costs you a few copper, and your animal won't know the difference." },
        { id = "h_traveler", when = { minLevel = 30 }, text = "I'm Olvia. You've come in off the wind rider, by the look of you, and you want to eat now and not hear about it, which suits me very well." },
      },
      again = {
        { id = "h_again", text = "What else? I've a carcass waiting." },
        { id = "h_again2", text = "Go on and ask, but I'll keep cutting." },
        { id = "h_again3", text = "Ask it quick, and I'll answer the same way." },
      },
      choices = {
        { text = "Show me what you have, Olvia.", next = "BUSINESS" },
        { text = "Zamja says you're clean and quick.", next = "clean" },
        { text = "What do you make of Borstan's way?", next = "borstan" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "You see everyone who arrives in the city.", next = "valley" },
        { text = "What should I feed a hungry beast?", next = "pet", when = { class = "HUNTER" } },
        { text = "I'll let you get back to the block.", next = "END" },
      },
    },
    clean = {
      lines = {
        { id = "clean_default", text = "She'd know. That troll can tell from across the Drag whether a carcass was bled properly. I scrub this block with sand and boiling water each night, and I've never sold a cut I wouldn't eat myself. That's all the reputation a butcher needs." },
      },
      choices = {
        { text = "Where did you learn to keep it so clean?", next = "clean2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean2 = {
      lines = {
        { id = "clean2_default", text = "From seeing what came of the other way. In the first year of the city there was a butcher by the gate who let his meat sit in the sun. A fever went through the wall crews. Eleven peons died of it, and they died of his laziness, not of any enemy." },
      },
      choices = {
        { text = "What became of the butcher?", next = "clean3" },
        { text = "Something else, Olvia.", next = "BACK" },
      },
    },
    clean3 = {
      big = true,
      lines = {
        { id = "clean3_default", text = "The crews wanted him thrown off the canyon wall. The Warchief had him put to digging latrines for a year, and then let him go. He sells salt fish in Ratchet now, I've heard, and sells it clean. I was a peon on those crews, and I've never been sure the Warchief was right." },
      },
      choices = {
        { text = "Thrall was right. The butcher learned, and nobody else died.", next = "BACK", reply = "That's the sense of it, and I can see it. It was harder to see when I was the one carrying out the dead.", fx = { align = { light = 1 } } },
        { text = "Eleven dead deserved more than a year of digging.", next = "BACK", reply = "So I felt then, and some days I still do. But I took up the knife myself afterward, so maybe that was my answer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    borstan = {
      lines = {
        { id = "borstan_default", text = "He's the best smoker in Kalimdor, and he'll tell you so himself. I've nothing against it. But a grunt coming off watch wants meat in his hand now, and not a tale about thornwood. Borstan feeds the Drag, and I feed the ones who can't wait." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      lines = {
        { id = "meat_default", text = "Boar from the Durotar hunters, every morning at the gate, and I take only what was killed that day. Plainstrider comes up from the Barrens when the caravans run. I'll not touch anything that's come by goblin ship, since I can't know how long it sat in the hold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = {
        { id = "valley_default", text = "I do. The wind riders land overhead and they all walk past my block, hungry. I can tell who's come from a fight and who's come from a feast. Lately there are more coming from fights, and they're coming up from the Barrens." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pet_default", text = "Whatever it would have caught for itself. A wolf wants red meat with the bone in, and a raptor will take anything that bleeds. Don't feed either of them cooked scraps from your own plate, or you'll have a fat, slow beast and nobody to blame but you." },
      },
      choices = {
        { text = "Raw, with the bone in. I'll take the pail.", next = "BACK", reply = "Sensible. Your beast has better luck in its hunter than most of them do.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_quilboar", text = "They've pushed the boar herds about and the hunters come in later each week. I notice it in my prices before anyone tells me." } },
    internment = { { id = "tp_internment", text = "We never saw meat. I think that's half of why I chose this trade when I was free to choose one." } },
    thrall = { { id = "tp_thrall", text = "He spared an orc I'd have thrown off a cliff. I've turned it over for years, and I think he may be the better of us." } },
    trade = { { id = "tp_trade", text = "Boar's steady. Strider's dear when the Barrens road is bad, which is most of this season." } },
    advice = { { id = "tp_advice", text = "Smell it before you buy it. A good butcher won't mind, and a bad one will." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. I know meat, and I know who's hungry." } },
  },
}

---------------------------------------------------------------------------
-- Gotri: orc bag vendor at Gotri's Traveling Gear, the Drag.
---------------------------------------------------------------------------
P:NPC {
  key = "gotri", id = TODO_NPC("Gotri"), name = "Gotri", title = "Bag Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "genial", "wistful" }, values = { "curious", "friendly" },
  notices = { "wonder", "kit" },
  impression = {
    first = "Gotri sells packs and pouches at his shop in the Drag and asks every traveler where they have been. He has never left Durotar himself, and collects other people's roads the way some orcs collect tusks.",
    third = "{name} met Gotri, the bag seller in Orgrimmar's Drag who has never traveled and asks everyone about their journeys.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Gotri's! Tell me, friend, where have you come from, and what did you carry it all in?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you've been somewhere new since I saw you, because that's fresh mud on your pack and it's the wrong color for Durotar." },
    { id = "g_far", when = { minLevel = 40 }, text = "Now there's a pack that's been across the sea and back. Sit down a moment, and don't leave anything out." },
  },
  notice = {
    { id = "n_far", cat = "wonder", when = { minLevel = 45 },
      text = "That stain on your strap is from the south, where the jungle rots everything. I've had it described to me, and I know it by the green." },
    { id = "n_full", cat = "kit", when = { maxLevel = 15 },
      text = "Your pack's bulging at every seam and you've things tied on with string. You'll be wanting something bigger before the month is out." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gotri, and I sell bags. Packs, pouches, quivers, and anything else that holds what you can't carry in your hands. Every traveler in Orgrimmar comes through this door in the end, and I ask each of them where they're bound." },
        { id = "h_far", when = { minLevel = 40 }, text = "I'm Gotri. You've seen far places, I can tell by how you've packed, with the heavy things low and nothing rattling. I'd be glad to hear about any of them while you look." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I'm Gotri. You're only setting out, so here's the first thing every old traveler has told me. You'll always want one more pouch than you have." },
      },
      again = {
        { id = "h_again", text = "What else, friend? And where did you say you were bound?" },
        { id = "h_again2", text = "Go on and ask, I'd sooner talk than count stock." },
        { id = "h_again3", text = "Ask away, and tell me something of the road while you're about it." },
      },
      choices = {
        { text = "Show me your bags, Gotri.", next = "BUSINESS" },
        { text = "You ask everyone where they've been.", next = "ask" },
        { text = "Have you never traveled yourself?", next = "never" },
        { text = "What do travelers tell you?", next = "tales" },
        { text = "What should go in a traveler's pack?", next = "pack" },
        { text = "I've been to the far side of the sea. Shall I tell you?", next = "tell", when = { minLevel = 30 } },
        { text = "I'll bring you a tale next time.", next = "END" },
      },
    },
    ask = {
      lines = {
        { id = "ask_default", text = "I do, and I write the answers down. I've a book under the counter with every place a customer has named to me, and what they said of it. There are four hundred and some now. A grunt told me about snow last year, and I made him say it three times." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    never = {
      lines = {
        { id = "never_default", text = "Not past the Southfury. I was born in a camp, and when we were freed I walked to Durotar with the rest and thought I'd never stop walking. Then I opened this shop, to earn enough for a proper journey. That was six years ago, and the shop's still here." },
      },
      choices = {
        { text = "What keeps you here?", next = "never2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    never2 = {
      lines = {
        { id = "never2_default", text = "The shop, I say. There's always stock coming, or the rent, or a strap that needs mending for someone who leaves at dawn. But I'll be honest with you, since you asked plainly. I've four hundred places in a book, and each of them is perfect, because I've never seen it." },
      },
      choices = {
        { text = "You're afraid the real places would fall short.", next = "never3" },
        { text = "Something else, Gotri.", next = "BACK" },
      },
    },
    never3 = {
      big = true,
      lines = {
        { id = "never3_default", text = "I think I am. A hunter told me Thunder Bluff is the most beautiful place in the world, and I've built it in my head a hundred times. If I went and it was only some tents on a hill, I'd have lost it. So I sell bags to those who are braver than I am." },
      },
      choices = {
        { text = "Go. A real hill is worth more than a perfect dream.", next = "BACK", reply = "That's what they all tell me, with their boots still dusty. One spring I'll shut the door and do it. I've said so for six springs.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stay. There's worth in being the one who keeps the door.", next = "BACK", reply = "Somebody must sell the packs, it's true. I'll tell myself that tonight, and I expect I'll very nearly believe it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tales = {
      lines = {
        { id = "tales_default", text = "Everything. That there's a goblin town on stilts where it rains every afternoon. That the Forsaken have a city under a ruined one, lit green. That in the Barrens the sky's so wide a tauren can see tomorrow's weather. I can't tell which are true, so I write down all of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pack = {
      lines = {
        { id = "pack_default", text = "Rope, more than seems sensible. A second waterskin, in case the first one splits. Something dry to wear, wrapped in oilcloth at the very bottom. And leave one pouch empty, friend, every traveler tells me that. You'll find something on the road you didn't know you wanted." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = {
        { id = "tell_default", text = "Would you? Wait, then, while I fetch the book. Begin with the crossing, and tell me whether the ship rolled, and what the air smelled of when you landed. Leave out the fighting, if you don't mind, because everyone tells me the fighting and nobody tells me about the smell." },
      },
      choices = {
        { text = "It smelled of salt, tar, and frying fish.", next = "BACK", reply = "Salt, tar and frying fish. Oh, that's good, that's very good. I've three accounts of that harbor and not one of them mentioned the fish.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "A town on stilts, where it rains every afternoon and everyone's selling something. I've eleven accounts of it, and they all agree about the rain." } },
    ratchet = { { id = "tp_ratchet", text = "The nearest of the far places. I could walk there in three days, and I've not managed it in six years." } },
    cairne = { { id = "tp_cairne", text = "They say his city stands on pillars of rock above the grass. I'd give a great deal to know whether that's true, and nearly as much not to find out." } },
    thrall = { { id = "tp_thrall", text = "He's traveled further than anyone I've met, and he's never been in to buy a bag. I'd ask him about the sea." } },
    advice = { { id = "tp_advice", text = "Leave one pouch empty. The road will fill it." } },
    _none = { { id = "tp_none", text = "I've not got that in the book, friend. If you learn of it, come and tell me, and I'll write it down." } },
  },
}

---------------------------------------------------------------------------
-- Horthus: orc reagent vendor, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "horthus", id = TODO_NPC("Horthus"), name = "Horthus", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "wry" }, values = { "practical", "honest" },
  notices = { "class" },
  impression = {
    first = "Horthus sells reagents in the Valley of Strength and has no magic of his own, which he counts an advantage. He treats each powder as a tool, and has little patience for casters who make a mystery of it.",
    third = "{name} met Horthus, a plain-spoken reagent vendor in Orgrimmar's Valley of Strength.",
  },
  greetings = {
    { id = "g_default", text = "Reagents. Tell me the spell and I'll tell you what you need for it, and you can save us both the time of looking round." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, so you've run out again. Buy double this time, and spare your boots the walk." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman, and you'll be after ankhs. They're in the jar on the left, and I'll not ask what you plan to die of." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You've rune dust on your sleeve, so you've been opening portals. Then you'll have forgotten to buy the rune for the way home, as every mage does." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You carry your ankh on a cord round your neck where you can reach it. Sensible. I've known shaman to keep theirs at the bottom of a pack." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Horthus, and I sell what spells are made of. I can't cast so much as a spark myself, and I've found that helps. I don't mistake a pouch of powder for a mystery, and I'll not charge you as if it were one." },
        { id = "h_caster", when = { class = { "MAGE", "SHAMAN", "PRIEST", "WARLOCK", "DRUID" } }, text = "I'm Horthus. You've the gift and I've the goods, and that's the whole of our acquaintance. Name the working and I'll have it on the counter before you've finished describing it." },
        { id = "h_plain", when = { class = { "WARRIOR", "HUNTER" } }, text = "I'm Horthus. You've no use for most of what's on my shelves, and I respect that. Though I do keep flash powder for rogues, and I've sold it to a warrior or two with a sense of humor." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, I'm weighing." },
        { id = "h_again2", text = "Go on and ask, the scales can wait a moment." },
        { id = "h_again3", text = "Ask it, and I'll give you a plain answer." },
      },
      choices = {
        { text = "Show me your reagents, Horthus.", next = "BUSINESS" },
        { text = "A reagent seller with no magic of his own.", next = "nomagic" },
        { text = "Why do spells need reagents at all?", next = "why" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "Shan'ti sells fruit near your stall.", next = "shanti" },
        { text = "What should a shaman never run short of?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll buy double next time, Horthus.", next = "END" },
      },
    },
    nomagic = {
      lines = {
        { id = "nomagic_default", text = "None at all, and I was tested for it. When the Warchief called for shaman, I walked up to the Valley of Wisdom with the rest and sat in front of a bowl of water for a day. The water did nothing, and neither did I, so I came home and thought about what else I was good for." },
      },
      choices = {
        { text = "And you settled on this?", next = "nomagic2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nomagic2 = {
      lines = {
        { id = "nomagic2_default", text = "I'd noticed the new shaman were always short of something. They had the calling, and no notion of where a fish oil or an ankh came from. I knew every trader on the Southfury. So I thought, let them hear the spirits, and let Horthus see that they've what they need to answer." },
      },
      choices = {
        { text = "You don't resent those who were called?", next = "nomagic3" },
        { text = "Something else, Horthus.", next = "BACK" },
      },
    },
    nomagic3 = {
      big = true,
      lines = {
        { id = "nomagic3_default", text = "I did, for a year. I thought the spirits had looked me over and found me wanting. Then a far seer bought an ankh from me and went out and died and got up again, and he came back to tell me it was sound. I've held that there's no shame in being the one who carries the water." },
      },
      choices = {
        { text = "No shame at all. The Horde needs its carriers.", next = "BACK", reply = "That's where I've landed. A warband's half grunts and half the orcs who feed them, and nobody sings about the second half.", fx = { align = { honor = 1 } } },
        { text = "There's more glory in the calling than in the counter.", next = "BACK", reply = "Glory, aye, and I'd not argue it. I only notice that the glorious ones are back at my counter every week, with their purses out.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "I've asked, and I've had six answers. A shaman told me the spirits want a gift. A mage said the powder holds the shape of the spell, the way a mould holds a casting. I think it's simpler. Nothing comes from nothing, and something has to be used up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_default", text = "Shaman, by a long way, since this is their city. Then the mages from the Valley of Spirits, who send an apprentice so they needn't climb the hill. The warlocks buy from Hagrus down in the Cleft, and I'm content to leave it so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shanti = {
      lines = {
        { id = "shanti_default", text = "She does, and she feeds me. Every afternoon there's a melon rind or a split apple left on my counter, and she'll not hear of being paid. She says I look like an orc who eats only what he can hold in one hand. She's right, and I've stopped pretending otherwise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_default", text = "Ankhs, first and always. Buy five, and when you're down to two, come back. After that it's fish oil and scales for walking on water and breathing under it. You'll think you won't need those, and then one day you'll be standing on the wrong bank of a river." },
      },
      choices = {
        { text = "Five ankhs, and I come back at two.", next = "BACK", reply = "That's it. You'd be surprised how many wait until they've none, which is exactly one death too late.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    the_elements = { { id = "tp_the_elements", text = "They didn't speak to me, and I've stopped waiting. I sell to those they do speak to, and I'd say we're square." } },
    trade = { { id = "tp_trade", text = "Ankhs are steady. Rune prices climb whenever the mages are sent somewhere in a hurry, so I watch for that." } },
    thrall = { { id = "tp_thrall", text = "He buys nothing here, since he has no need of reagents. But he sent the far seers to me in the first year, and I've not forgotten it." } },
    burning_blade = { { id = "tp_burning_blade", text = "Hagrus sells what the warlocks want, and he tells me some of them want a great deal of it. I'm glad it isn't my counter." } },
    advice = { { id = "tp_advice", text = "Buy before you're out. You'll never run short in a shop." } },
    _none = { { id = "tp_none", text = "I don't stock that and I don't know it. Ask someone who can cast." } },
  },
}

---------------------------------------------------------------------------
-- Magenius: orc reagent vendor beside Asoran's market; a would-be scholar.

---------------------------------------------------------------------------
-- Asoran: orc general goods vendor at Asoran's Market, Valley of Wisdom; sells to those who wait on the Warchief.

---------------------------------------------------------------------------
-- Shimra: orc trade supplies vendor at the Orgrimmar General Store, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "shimra", id = TODO_NPC("Shimra"), name = "Shimra", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp", "brisk" }, values = { "trade", "practical" },
  notices = { "craft" },
  impression = {
    first = "Shimra sells thread, flux, vials and dyes at the Orgrimmar General Store, and can tell a customer's craft from their hands before they speak. She shares the store with Trak'gen, and keeps a sharp eye on her half of it.",
    third = "{name} met Shimra, the sharp-eyed seller of crafters' supplies at the Orgrimmar General Store.",
  },
  greetings = {
    { id = "g_default", text = "Don't tell me what you make. Hold out your hands, and I'll tell you, and then I'll tell you what you're short of." },
    { id = "g_back", when = { metBefore = true }, text = "You're back for more of the same, I expect. Crafters are creatures of habit, and I've built a living on it." },
    { id = "g_crafter", when = { any = { { profession = "Tailoring" }, { profession = "Blacksmithing" }, { profession = "Alchemy" }, { profession = "Leatherworking" } } }, text = "A working pair of hands, at last. Half the people through that door only want to know the way to the bank." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Needle scars on the left forefinger and none on the thumb. You're a tailor, and you've finally bought a thimble, which I'm glad to see." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've scale burns up both forearms, so you're a smith. You'll want flux, and you'll say you have plenty, and you'll be wrong." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shimra. Trak'gen sells the general goods on that side, and I sell what crafters burn through on this one. Thread, flux, vials, dye and salt. None of it's interesting, and nobody can work without it." },
        { id = "h_crafter", when = { any = { { profession = "Tailoring" }, { profession = "Blacksmithing" }, { profession = "Alchemy" }, { profession = "Leatherworking" }, { profession = "Engineering" } } }, text = "I'm Shimra. You make things, so you already know the worst feeling in any trade, which is reaching for the last of something and finding the jar empty. I'm the cure for that." },
        { id = "h_none", when = { maxLevel = 12 }, text = "I'm Shimra. You've no trade yet, by your hands. Pick one soon, young one. A fighter who can also make something is never hungry for long." },
      },
      again = {
        { id = "h_again", text = "What else are you short of?" },
        { id = "h_again2", text = "Go on and ask, though I'll go on counting." },
        { id = "h_again3", text = "Ask it. I can do two things at once, unlike Trak'gen." },
      },
      choices = {
        { text = "Show me your supplies, Shimra.", next = "BUSINESS" },
        { text = "You can read a craft from someone's hands?", next = "hands" },
        { text = "How do you and Trak'gen divide the store?", next = "trakgen" },
        { text = "Felika sells the same goods in the street.", next = "felika" },
        { text = "Which trade is best for a newcomer?", next = "trade" },
        { text = "Read my hands, then, and tell me what I lack.", next = "crafter", when = { any = { { profession = "Tailoring" }, { profession = "Blacksmithing" }, { profession = "Alchemy" }, { profession = "Leatherworking" }, { profession = "Engineering" } } } },
        { text = "I'll be back when the jar's empty.", next = "END" },
      },
    },
    hands = {
      lines = {
        { id = "hands_default", text = "Always. A smith is burned on the forearm, a tailor is pricked on the forefinger, and an alchemist has stains that never wash out. A leatherworker has a callus across the palm, from the awl. I've not been wrong in years, and it lets me have the goods on the counter before they've asked." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trakgen = {
      lines = {
        { id = "trakgen_default", text = "There's a line down the middle of the floor. I painted it myself. Everything left of it is mine, and he's not to tidy it, lend from it, or give it away. He's a generous orc, and it will ruin him one day." },
      },
      choices = {
        { text = "What did he give away?", next = "trakgen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trakgen2 = {
      lines = {
        { id = "trakgen2_default", text = "A whole crate of my thread, in the first year, to a tailor who said she'd pay at the new moon. It was three new moons before we saw her again. Trak'gen said she had children to clothe. I said that I'd rent to pay, and we didn't speak for a week." },
      },
      choices = {
        { text = "Did the tailor ever pay?", next = "trakgen3" },
        { text = "Something else, Shimra.", next = "BACK" },
      },
    },
    trakgen3 = {
      big = true,
      lines = {
        { id = "trakgen3_default", text = "She did, every copper, and brought us each a shirt she'd made besides. I still wear mine. Trak'gen thinks that proves him right. I say it proves she was honest, and that the next one may not be, and a shop can't live on hoping." },
      },
      choices = {
        { text = "Trak'gen was right. Trust repaid is worth the risk.", next = "BACK", reply = "So he tells me, every time I wear the shirt. I'll grant it turned out well. I'd still not make a habit of it.", fx = { align = { light = 1 } } },
        { text = "You're right. One honest debtor doesn't make credit wise.", next = "BACK", reply = "Thank you! I've waited six years for somebody to say so in front of him. He'll only smile, mind, because he always does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felika = {
      lines = {
        { id = "felika_default", text = "She does, and I've nothing against her. Felika walks the Drag and the valley with a tray, and catches those who can't be troubled to come indoors. I get the ones who buy by the crate. She says nothing annoys her like a customer who buys one of a thing, and on that we're sisters." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "trade_default", text = "For coin, anything that feeds a smith, so mining. For keeping yourself alive, first aid and cooking, and never mind that nobody boasts of them. Tailoring if you've patience, though you'll be laughed at by grunts. All of them will bring you back to this counter, so I've no favorite." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crafter = {
      lines = {
        { id = "crafter_default", text = "Let me see them, then, and turn them over for me. Yes, I thought as much. You're short of whatever you use most, since that's what everyone forgets to count. Buy a full stack of it today and put half away where you'll not find it until you're desperate." },
      },
      choices = {
        { text = "A full stack, and hide half from myself.", next = "BACK", reply = "That's the secret of every crafter who ever finished an order on time. You'll thank me in a month.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Flux is dear and thread is cheap, and vials go missing faster than I can stock them." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblins sell me dye and change the price while I'm reaching for my purse. I count my change twice with them." } },
    internment = { { id = "tp_internment", text = "We made nothing there. I think that's why so many of us took up a craft the moment we could." } },
    thrall = { { id = "tp_thrall", text = "He taxes the store fairly, and his collector can count. I ask no more of a warchief." } },
    advice = { { id = "tp_advice", text = "Count what you use most, since that's what you'll run out of." } },
    _none = { { id = "tp_none", text = "I've no notion. If a crafter doesn't burn through it, it doesn't cross my half of the floor." } },
  },
}

---------------------------------------------------------------------------
-- Trak'gen: orc general goods merchant at the Orgrimmar General Store, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "trakgen", id = TODO_NPC("Trak'gen"), name = "Trak'gen", title = "General Goods Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "warm", "easygoing" }, values = { "generous", "community" },
  notices = { "purse", "weary" },
  impression = {
    first = "Trak'gen sells general goods at the Orgrimmar General Store and has trouble charging full price to anyone who looks tired. He is a warm, easy orc who seems to know half the Valley of Strength by name.",
    third = "{name} met Trak'gen, the open-handed general goods merchant of the Orgrimmar General Store.",
  },
  greetings = {
    { id = "g_default", text = "Come in, friend, and set that pack down a moment. You look as though you've walked a long way to reach a shop." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! I was telling Shimra you'd be back, and she said I say that about everyone, which is true." },
    { id = "g_young", when = { maxLevel = 12 }, text = "New to the city, aren't you? Welcome, then. Stand anywhere you like, except across Shimra's line." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "That purse is nearly empty, friend. Don't be shy about it. Tell me what you truly need, and we'll find the plain one." },
    { id = "n_weary", cat = "weary", when = { minLevel = 30, durability = { max = 0.4 } },
      text = "You're worn to the bone, and so is your gear. Sit on that crate a while. Nobody's ever been charged for sitting in my half of the store." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Trak'gen, and this is the General Store. I've food, water, torches, rope, and whatever else a traveler finds he's forgotten. Shimra has the crafters' goods over there, behind the line she painted, and I'd not step over it if I were you." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I'm Trak'gen. You're only starting out, so let me tell you what's worth your coin. Buy water and bread first, and let the rest wait until you've earned a little." },
        { id = "h_veteran", when = { minLevel = 40 }, text = "I'm Trak'gen. You've been everywhere, by the look of you, and still you need bread like the rest of us. Sit down and tell me how it goes in the wide world." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you?" },
        { id = "h_again2", text = "Go on and ask, friend, because I'm never too busy." },
        { id = "h_again3", text = "Ask away, and take a seat while you do." },
      },
      choices = {
        { text = "Show me your goods, Trak'gen.", next = "BUSINESS" },
        { text = "Shimra says your generosity will ruin you.", next = "generous" },
        { text = "You seem to know everyone in this valley.", next = "valley" },
        { text = "What does a traveler forget most often?", next = "forget" },
        { text = "Tell me about this line on the floor.", next = "line" },
        { text = "I've little coin. What do I truly need?", next = "poor", when = { maxLevel = 12 } },
        { text = "Thank you for the welcome, Trak'gen.", next = "END" },
      },
    },
    generous = {
      lines = {
        { id = "generous_default", text = "She does say it, and she may be right. I've a soft place for anyone who comes in hungry. I can't help it, friend. I remember being hungry, and I remember exactly who shared with me and who didn't." },
      },
      choices = {
        { text = "Who shared with you?", next = "generous2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    generous2 = {
      lines = {
        { id = "generous2_default", text = "An old orc in the camps, whose name I never knew. He'd been a great warrior once, and he was nothing but bones by then. He gave me half his bread every evening for a winter and told me he wasn't hungry. I was a child, and I believed him." },
      },
      choices = {
        { text = "What became of him?", next = "generous3" },
        { text = "Something else, Trak'gen.", next = "BACK" },
      },
    },
    generous3 = {
      big = true,
      lines = {
        { id = "generous3_default", text = "He didn't see the spring. I understood, when I was older, what he'd done. So when a thin young one comes in short a few copper, I see my own hands held out. Shimra says that I'm repaying a dead orc with her rent, and she isn't wrong about the rent." },
      },
      choices = {
        { text = "Go on repaying him. That's a debt worth carrying.", next = "BACK", reply = "I mean to, for as long as the door stays open. I think he'd have liked the shop. He'd have liked the bread in it, at the least.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shimra's right. Kindness that sinks the shop helps nobody.", next = "BACK", reply = "That's the hard sense of it, friend, and I hear it from her most mornings. I try to give from my own half. It's not always enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = {
        { id = "valley_default", text = "Most of it. Gryshka at the inn sends her guests over when they need a waterskin. The three brothers at the bank change my coin, and Koma tells me about Hyjal while they count it. Doras comes down off the wind rider tower for jerky, and Olvia shouts at me across the way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = {
        { id = "forget_default", text = "Flint and tinder, more than anything. They buy a fine sword and a strong pack and march off to the Barrens, and at nightfall they can't make a fire. After that it's a second waterskin. Nobody believes how far apart the wells are until they've walked it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = {
        { id = "line_default", text = "Hah, she'll have told you her side. I gave away a crate of her thread once, to a tailor with children, and Shimra painted that line the next morning. The tailor paid in the end. The line stayed. I've come to like it, truly, since I always know where I stand." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    poor = {
      lines = {
        { id = "poor_default", text = "Water, friend, and a little bread, and flint, and you can leave all the rest. And if you're a copper or two short, we'll call it even this once, since you'll be back when your purse is fuller, and I've a long memory for faces." },
      },
      choices = {
        { text = "Water, bread and flint. I'll remember your face too.", next = "BACK", reply = "Good! Then we're friends already. Go carefully out there, and come back and tell me you're well.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "An old orc gave me half his bread for a winter. I've been trying to pass it on ever since." } },
    trade = { { id = "tp_trade", text = "Bread and water sell every day of the year. I'll never be rich, and I'll never be idle." } },
    thrall = { { id = "tp_thrall", text = "He came out of the same camps we did. I think that's why nobody goes hungry in his city if he can help it." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins send up lamp oil and sweets by wagon. They've never once given anything away, and I find that very strange." } },
    advice = { { id = "tp_advice", text = "Carry flint, friend. A sword won't warm you at night." } },
    _none = { { id = "tp_none", text = "I've not heard about that, friend. Sit a while, though, and someone who has may come in." } },
  },
}

---------------------------------------------------------------------------
-- Garyl: orc tabard vendor, Valley of Strength, beside the guild master Urtrun Clanbringer.
---------------------------------------------------------------------------
P:NPC {
  key = "garyl", id = TODO_NPC("Garyl"), name = "Garyl", title = "Tabard Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud", "precise" }, values = { "tradition", "craft" },
  notices = { "kit", "class" },
  impression = {
    first = "Garyl sells guild tabards in the Valley of Strength, beside the guild master, and treats every design as the banner of a clan being born. She is precise about colors, and quietly scornful of a badly chosen emblem.",
    third = "{name} met Garyl, who sells guild tabards in Orgrimmar and treats each one as a clan's banner.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka. If you've come for a tabard, I hope you've thought about your colors, because you'll be wearing them for a long time." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you settled on the emblem, or are you still torn between the wolf and the axe, like everyone?" },
    { id = "g_guild", when = { guild = true }, text = "You belong to a guild already, by the way you look over my racks. Then you know what a banner is for, and I hope that yours is kept clean." },
  },
  notice = {
    { id = "n_tabard", cat = "kit", when = { guild = true },
      text = "You've a guild at your back, and it shows in how you stand. I only hope that whoever chose its colors had seen them together in daylight first." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior with a bare chest plate, and no colors over it. Who do you fight beside, then, and how are they to find you in the press?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Garyl. Urtrun Clanbringer writes the charters for new guilds, and I make the tabards that show the world they exist. A charter is ink in a ledger, but a tabard is what your enemy sees coming over the hill." },
        { id = "h_guilded", when = { guild = true }, text = "I am Garyl. You've a guild of your own already, so I'll not lecture you on what a banner means. I'll only say that a tabard wants cold water and a stitch at the shoulder now and then, and that I can see to the stitch." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I am Garyl. You're young, and likely you've no guild yet. Don't hurry it. Choose the ones you'd bleed for, and then come and see me about the colors." },
      },
      again = {
        { id = "h_again", text = "Is there more you'd ask?" },
        { id = "h_again2", text = "Go on, I'm only sorting thread by shade." },
        { id = "h_again3", text = "Ask, and I'll give it proper thought." },
      },
      choices = {
        { text = "Show me your tabards, Garyl.", next = "BUSINESS" },
        { text = "Why does a tabard matter so much?", next = "matter" },
        { text = "What makes a good emblem?", next = "emblem" },
        { text = "You work beside Urtrun Clanbringer.", next = "urtrun" },
        { text = "Which colors do the guilds of the Horde favor?", next = "colors" },
        { text = "What makes a guild's tabard serve it well?", next = "mine", when = { guild = true } },
        { text = "Lok'tar, Garyl.", next = "END" },
      },
    },
    matter = {
      lines = {
        { id = "matter_default", text = "Because we lost our banners once. When the old Horde broke, the humans took every clan standard they could find and hung them in their halls as trophies. An orc in the camps had no sign to stand under. I think it was that, as much as the hunger, that left us sitting in the mud." },
      },
      choices = {
        { text = "Did you see the banners taken?", next = "matter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    matter2 = {
      lines = {
        { id = "matter2_default", text = "I saw my own clan's burned. I was a girl, and I'd helped my grandmother stitch the border of it. A human knight threw it on a cookfire to show us that it was only cloth. He was right, and it was only cloth, and I've never forgotten the smell of it." },
      },
      choices = {
        { text = "So now you make new banners.", next = "matter3" },
        { text = "Something else, Garyl.", next = "BACK" },
      },
    },
    matter3 = {
      big = true,
      lines = {
        { id = "matter3_default", text = "Hundreds of them. Guilds of orcs and trolls and tauren together, with emblems my grandmother wouldn't know. Urtrun says they are the new clans, and that the old ones should be let go. I stitch them gladly. But I keep a scrap of my own clan's red in my thread box, and I'm not ready to let it go." },
      },
      choices = {
        { text = "Keep it. The old clans should not be forgotten.", next = "BACK", reply = "I mean to. A people can take new banners and still remember the ones that burned. I'll tell Urtrun a stranger said so.", fx = { align = { order = 1 } } },
        { text = "Urtrun's right. The old banners led the Horde to ruin.", next = "BACK", reply = "Some of them did, and I'll not deny it. Mine was only a border my grandmother stitched. But I take your meaning, and I don't think you unkind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    emblem = {
      lines = {
        { id = "emblem_default", text = "One shape, and bold enough to read at two hundred paces. They all want a wolf holding an axe in front of a mountain, under lightning. I tell them to choose the wolf or the axe. A banner that needs explaining has already failed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    urtrun = {
      lines = {
        { id = "urtrun_default", text = "He treats every charter as a birth, and I suppose I'm the one who clothes the child. He asks the founders who they are, and I ask them what they wish to look like, and you'd be surprised how often the two answers disagree. We've talked more than one guild out of a foolish name." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    colors = {
      lines = {
        { id = "colors_default", text = "Red and black, far more than any other, since they're the Horde's own. The tauren guilds like earth colors and sky blue. The trolls ask for the brightest thing I have and then ask whether I've anything brighter. The Forsaken take purple and grey, and they never ask my opinion." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mine_default", text = "Since you ask, I'll be honest about what I see most. The colors are usually sound, since every guild argues over those for a week. It's the emblem that fails, cut a hand's width too small to read from a distance, because whoever chose it was looking at it on a counter and not across a field." },
      },
      choices = {
        { text = "I'll go and look at ours across a field.", next = "BACK", reply = "Do, and if it wants changing, tell them kindly. Nobody enjoys hearing that about a banner, and I've learned to say it once and then stop.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_second_war", text = "Our banners went into human halls as trophies. I'm told that some hang there still, and I'd dearly like them back." } },
    internment = { { id = "tp_internment", text = "No colors, no signs, and nothing to stand under. I'd not wish that on any people." } },
    thrall = { { id = "tp_thrall", text = "He gave us one banner to stand under and leave to make a thousand smaller ones. I think that was wiser than it looked." } },
    warsong = { { id = "tp_warsong", text = "Their standard was never taken, and they'll tell you so. I envy them, and I stitch their riders' tabards with extra care." } },
    advice = { { id = "tp_advice", text = "Choose one emblem and make it large. Your friends must be able to find you in a fight." } },
    _none = { { id = "tp_none", text = "I can't speak to that. If it can't be stitched in two colors, I've likely not considered it." } },
  },
}

---------------------------------------------------------------------------
-- Xan'tish: troll snake vendor who walks the Valley of Spirits with his baskets.

