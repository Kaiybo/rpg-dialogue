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
P:NPC {
  key = "kithas", id = TODO_NPC("Kithas"), name = "Kithas", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "shrewd", "dry" }, values = { "profit", "careful" },
  notices = { "craft", "purse" },
  impression = {
    first = "Kithas sells rods, vials and dusts at Godan's Runeworks in the Drag, and keeps the accounts neither enchanter is allowed near. She watches the auction house prices like a hunter watching a game trail.",
    third = "{name} met Kithas, the sharp-eyed supplier who keeps the accounts at Godan's Runeworks in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Mind the hide as you come through. Now, are you buying, or have you come to ask Godan to do something for nothing?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. Strange dust is up two copper since you were last in, so I'm in a fair mood." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "An enchanter. Then you'll be wanting vials, and you'll tell me they're dear, and you'll be right, and you'll buy them anyway." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You've been breaking things down and selling the dust yourself, haven't you? You're pricing it too low. I've seen your lots." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a comfortable purse. If you're thinking of having a weapon enchanted, do it now. The price of large shards isn't coming down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kithas. Godan does the fine work and Jhag teaches, and I sell the rods and dusts and keep the books. If either of them were left to price a thing, this shop would have closed in its first year." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "Kithas. You practice the craft, so I'll save you some coin. Buy your vials here and your dust at the auction house, early in the day, before the smiths wake up." },
        { id = "h_low", when = { maxLevel = 15 }, text = "I'm Kithas. You're young for this shop. A copper rod is all you need to start, and Jhag will show you the rest for nothing, since he can't help himself." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Go on. I'm only adding." },
        { id = "h_again3", text = "Ask it. Time's the one thing I don't charge for, yet." },
      },
      choices = {
        { text = "Show me what you sell, Kithas.", next = "BUSINESS" },
        { text = "You don't let the enchanters near the accounts.", next = "accounts" },
        { text = "Why is this trade so costly?", next = "costly" },
        { text = "What are Godan and Jhag like to work with?", next = "shop" },
        { text = "Wabang says you watch the auction floor like a hawk.", next = "auction" },
        { text = "What sells, among enchanters?", next = "ench", when = { profession = "Enchanting" } },
        { text = "May your columns balance, Kithas.", next = "END" },
      },
    },
    accounts = {
      lines = {
        { id = "accounts_default", text = "With good reason. Godan once enchanted a grunt's axe for nothing because he found the axe \"interesting.\" Jhag gave a month of lessons to a peon in trade for a sack of yams. They're the best at their craft in this city, and they'd both starve in a season." },
      },
      choices = {
        { text = "You've stopped them giving work away?", next = "accounts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accounts2 = {
      lines = {
        { id = "accounts2_default", text = "Mostly. I've a rule that nothing leaves this shop without my mark in the book. Jhag obeys it. Godan forgets, or pretends to. Last month I found he'd been mending the wards on a widow's door in the Valley of Wisdom, at night, without a word to me." },
      },
      choices = {
        { text = "What did you do about it?", next = "accounts3" },
        { text = "Something else, Kithas.", next = "BACK" },
      },
    },
    accounts3 = {
      big = true,
      lines = {
        { id = "accounts3_default", text = "I wrote it in the book as paid, out of my own share, and said nothing to him. Don't look at me like that. If I'd let it stand unpaid, the next one would be unpaid too, and the one after. This way the rule holds and the door's mended. I've not decided if I was soft or clever." },
      },
      choices = {
        { text = "You kept the rule and did a kindness. That's clever.", next = "BACK", reply = "That's my reckoning as well. I'd thank you not to tell Godan; he'd take it as leave to do it again.", fx = { align = { order = 1 } } },
        { text = "A rule you pay to break isn't much of a rule.", next = "BACK", reply = "Hm. You'd make a good bookkeeper and a poor neighbor. The door's mended, and I can afford it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    costly = {
      lines = {
        { id = "costly_default", text = "Because every lesson is a thing destroyed. To learn the craft you unmake what somebody else made well, and you get a pinch of dust for it. All I sell is the rods and the glass. The real cost is everything my customers have broken to get this far." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_default", text = "Godan is exact and silent and thinks about nothing but the work. Jhag is patient and would explain water to a fish. I'm the one who knows what day the rent's due. We suit each other well. None of us wants any part of what the others do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    auction = {
      lines = {
        { id = "auction_default", text = "He would say so; I've outbid him on his own floor. I'm there at dawn every day. Dust is cheap when the adventurers come in tired at night and sell without looking, and dear by noon. I buy at the one and sell at the other, and Grimful writes me down as a cheat without being able to say how." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ench = {
      lines = {
        { id = "ench_default", text = "Whatever goes on a weapon. Nobody pays to have their boots made a little quicker, though it would do them more good. They want the glow. Learn the plainest weapon enchantment you can and do it cheaply for every grunt who asks, and you'll never be short of dust." },
      },
      choices = {
        { text = "Sell the glow, and keep the good sense for myself.", next = "BACK", reply = "There. You've understood the whole trade in one breath. Don't tell Jhag; he thinks it's about knowledge.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Strange dust is up and shards are scarce. Somebody is buying shards by the crate, and I'd like to know who." } },
    forsaken = { { id = "tp_forsaken", text = "They pay on time and never haggle. I can't say that of a single orc on the Drag." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "I respect a goblin's books. I'd not trust one to hold my purse while I tied my boot." } },
    thrall = { { id = "tp_thrall", text = "He taxes us fairly, and the collector can count. I've met worse chiefs in stories." } },
    advice = { { id = "tp_advice", text = "Buy when the sellers are tired, and sell when the buyers are in a hurry." } },
    _none = { { id = "tp_none", text = "I've no figure for that, so I've no opinion." } },
  },
}

---------------------------------------------------------------------------
-- Kor'geld: orc alchemy supplier at Yelmak's Alchemy and Potions, the Drag; Yelmak's Medley (Forever).
---------------------------------------------------------------------------
P:NPC {
  key = "korgeld", id = TODO_NPC("Kor'geld"), name = "Kor'geld", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "wry" }, values = { "patient", "careful" },
  notices = { "craft" },
  impression = {
    first = "Kor'geld sells vials and common herbs at Yelmak's shop in the Drag, and quietly counts every leaf the young alchemist Whuut takes from the shelf. He speaks of weeds from the city's own streams as if they were treasures.",
    third = "{name} met Kor'geld, the calm supplier at Yelmak's alchemy shop who values common herbs.",
  },
  greetings = {
    { id = "g_default", text = "Vials are on the left and herbs on the right. Mind you don't breathe too deep by the back bench; that's Whuut's." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The shop's still standing, as you see. I count that a good week." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Then you'll want crystal vials and you'll want them cheap, and I can manage one of the two." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've river mud on your knees and green on your fingers. Good. An herbalist who kneels is one who looks." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "There's a burn on your sleeve the shape of a flask's mouth. You uncorked something toward yourself, and you'll not do it twice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kor'geld. Yelmak brews and teaches, young Whuut brews and breaks things, and I sell what both of them need and keep count of what goes missing. It's quieter work than theirs. I chose it for that." },
        { id = "h_medley", when = { questBefore = TODO_QUEST("Yelmak's Medley") }, text = "I'm Kor'geld, and you may be the one I need. Yelmak wants to teach his apprentice a lesson with a home-brewed recipe, and it calls for cattail and speargrass from the waters in the Valley of Honor. I can't leave the shop, or Whuut will know we're managing him." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Yelmak's Medley") }, text = "Have you the cuttings? Cattails and speargrass, from around the water in the Valley of Honor. Take them where they grow thickest, by the pond, and bring them in the side way so the boy doesn't see." },
        { id = "h_done", when = { questDone = TODO_QUEST("Yelmak's Medley") }, text = "Those cuttings did their work. Whuut's been walking about with a handful of ditch-weed and a thoughtful look, and Yelmak is so pleased with himself I can hardly stand it." },
      },
      again = {
        { id = "h_again", text = "What else can I find you?" },
        { id = "h_again2", text = "Go on. Nothing's boiling over yet." },
        { id = "h_again3", text = "Ask. I've the patience for it." },
      },
      choices = {
        { text = "Let me see your stock, Kor'geld.", next = "BUSINESS" },
        { text = "You keep count of what Whuut takes?", next = "whuut" },
        { text = "Why would an alchemist want pond weeds?", next = "weeds" },
        { text = "What is Yelmak like to work for?", next = "yelmak" },
        { text = "This shop smells of something burning.", next = "smell" },
        { text = "I gather herbs. What should I look for near the city?", next = "herbalist", when = { profession = "Herbalism" } },
        { text = "Keep the shop standing, Kor'geld.", next = "END" },
      },
    },
    whuut = {
      lines = {
        { id = "whuut_default", text = "Every leaf, on Yelmak's order. The boy's gifted, and I'll say so plainly. He can smell what's in a flask from the doorway. But he reaches past everything common for whatever's rarest on the shelf, and some of what's on that shelf took a year to get." },
      },
      choices = {
        { text = "Is he careless, or only young?", next = "whuut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whuut2 = {
      lines = {
        { id = "whuut2_default", text = "Young, and too proud to ask for help when he's out of his depth. I was the same. I broke a good many things in my first year of this trade, and my master of that time let me break them. He thought it the only way a lesson would stick." },
      },
      choices = {
        { text = "Yelmak thinks otherwise?", next = "whuut3" },
        { text = "Something else, Kor'geld.", next = "BACK" },
      },
    },
    whuut3 = {
      big = true,
      lines = {
        { id = "whuut3_default", text = "Yelmak wants to show him first. He'd give the boy a taste of what the plain herbs can do in careful hands, before the black lotus is all gone. I half think Whuut needs one honest disaster. But it's Yelmak's shop, and the lotus isn't mine to wager." },
      },
      choices = {
        { text = "Show him. A good teacher spares the student the ruin.", next = "BACK", reply = "That's Yelmak's view, and I'm coming around to it. The boy's worth the trouble.", fx = { align = { light = 1 } } },
        { text = "Let him fail. Nothing teaches like a ruined batch.", next = "BACK", reply = "So my own master held, and I learned. I also still can't smell anything with the left side of my nose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weeds = {
      lines = {
        { id = "weeds_default", text = "Because they aren't only weeds. The cattail and speargrass in this city drink spring water that comes down out of the Azshara hills, and they root in dust that has blood and iron in it. They've a strength you'd not guess. We find new recipes by showing old plants to young eyes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yelmak = {
      lines = {
        { id = "yelmak_default", text = "Fast. He talks at a run and sniffs everything, and he's forgotten more formulas than I'll ever learn. He's patient with Whuut in a way he isn't with anyone else. I think he sees himself at that age, and I've no wish to tell him so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    smell = {
      lines = {
        { id = "smell_default", text = "It always does. Today that's Whuut, and yesterday it was Yelmak, and once, I'm sorry to say, it was me. You stop noticing in a month. Zamja across the way says it gets into her stew, and she's threatened us with her cleaver over it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    herbalist = {
      lines = {
        { id = "herbalist_default", text = "Look down before you look far. There's peacebloom along the wall, and earthroot on every slope outside the gate. The pond in the Valley of Honor has cattail and speargrass that the smiths' apprentices trample without a thought. Jandi can tell you the rest, and will, for an hour." },
      },
      choices = {
        { text = "I'll look closer to home, then.", next = "BACK", reply = "Do. Most of what's worth finding has been underfoot the whole time.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    wailing_caverns = { { id = "tp_wailing_caverns", text = "Whuut wants to go and pick whatever grows there. I've seen what comes out of that place, and I've hidden his boots twice." } },
    forsaken = { { id = "tp_forsaken", text = "Their apothecaries would buy every rare thing on our shelf. Yelmak won't sell to them, and I don't ask him why." } },
    trade = { { id = "tp_trade", text = "Vials are steady. Lotus can't be had at any price I'd repeat." } },
    thrall = { { id = "tp_thrall", text = "A shaman knows what a plain root can do. I expect he'd take Yelmak's side about the weeds." } },
    advice = { { id = "tp_advice", text = "Uncork it away from your face. I can't say that often enough." } },
    _none = { { id = "tp_none", text = "I've not stocked that, so I can't tell you much about it." } },
  },
}

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
P:NPC {
  key = "gorina", id = TODO_NPC("Gorina"), name = "Gorina", title = "Mining Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "hearty" }, values = { "hardworking", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Gorina sells picks and mining gear in the Valley of Honor and hauls ore down to the forges herself. She worked the stone as a peon when the city was dug, and she is proud of every tunnel in it.",
    third = "{name} met Gorina, a former peon who sells mining gear in Orgrimmar and helped dig the city.",
  },
  greetings = {
    { id = "g_default", text = "Pick, lamp, or a sack? Whatever you've come for, test the weight before you pay me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The pick held, didn't it? They always do, because I don't sell the other kind." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner! Show me your hands. Hah, there's the callus, right where it belongs. Welcome." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've rock dust in your hair and a squint from the lamp. You've been down a good while. Drink something before you go back." },
    { id = "n_peon", cat = "class", when = { maxLevel = 10 },
      text = "You're new and soft yet. No shame in it. A season on the pick will cure both, and I've a pick right here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gorina. Makaru teaches the digging here, and I sell the tools and carry the ore down to the smiths. I was a peon on this city's first tunnels, so if you're standing on it in Orgrimmar, I likely moved it." },
        { id = "h_miner", when = { profession = "Mining" }, text = "Gorina. You work the stone, so I'll not waste words. Buy the heavy pick. The light one's for people who want to look like miners." },
        { id = "h_orc", when = { race = "Orc" }, text = "I'm Gorina, and before you think it, yes, I was a peon. I've heard \"zug zug\" from every grunt in this valley. I notice they all sleep under roofs I cut." },
      },
      again = {
        { id = "h_again", text = "What else? I've a cart to load." },
        { id = "h_again2", text = "Go on. My back wants the rest." },
        { id = "h_again3", text = "Ask it. I can lift and talk." },
      },
      choices = {
        { text = "Let me see your tools, Gorina.", next = "BUSINESS" },
        { text = "You helped dig this city?", next = "dig" },
        { text = "What do the warriors make of peons?", next = "peons" },
        { text = "Where does Orgrimmar's ore come from?", next = "ore" },
        { text = "What is Makaru like?", next = "makaru" },
        { text = "Where should a miner dig, near the city?", next = "miner", when = { profession = "Mining" } },
        { text = "Strength to your back, Gorina.", next = "END" },
      },
    },
    dig = {
      lines = {
        { id = "dig_default", text = "From the first day. There was nothing here but a red canyon and a spring. The Warchief walked it with us and marked where the Drag would run, and we cut it. I was on the crew that opened the Cleft of Shadow, and something in that rock never liked us." },
      },
      choices = {
        { text = "What was wrong with the Cleft?", next = "dig2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig2 = {
      lines = {
        { id = "dig2_default", text = "It was cold where it shouldn't have been, and the lamps burned low. We'd break into hollows nobody had made. Two of my crew wouldn't go back down, and they were no cowards. We finished it, and the warlocks moved in almost before we'd carried the rubble out." },
      },
      choices = {
        { text = "And beneath the Cleft?", next = "dig3" },
        { text = "Something else, Gorina.", next = "BACK" },
      },
    },
    dig3 = {
      big = true,
      lines = {
        { id = "dig3_default", text = "We broke through to caves that went down and down, hot ones, with fire at the bottom. They call it Ragefire now. The overseer had us shore up the mouth, post a guard and say nothing, though there are things living down there, and I've said for years it should be cleared and not merely watched." },
      },
      choices = {
        { text = "Clear it. A guard only watches what he should be fighting.", next = "BACK", reply = "That's what I say! I cut that tunnel, and I know what breathes at the bottom of it. Tell them at Grommash Hold, since they don't listen to a peon.", fx = { align = { honor = 1 } } },
        { text = "Leave it guarded. Some depths are better left alone.", next = "BACK", reply = "The overseer said the same, and he doesn't sleep above it as I do. I can feel the warmth coming up through the stone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peons = {
      lines = {
        { id = "peons_default", text = "Not much, out loud. A grunt thinks strength is for swinging at somebody. I've carried more weight in a morning than most of them lift in a week, and I never got a song for it. But the Warchief knows our names. He asked mine, in the first year, and he still has it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "ore_default", text = "Copper from the hills all round Durotar, and tin up from the Barrens. Iron comes a long way and costs like it. Makaru's students bring in the local stone, I sort it, and Sumi and I share a cart down to the Burning Anvil. Snarl always says it's dirty. It's ore." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    makaru = {
      lines = {
        { id = "makaru_default", text = "Makaru talks about rock as if it could hear, and I half think it can. There's nobody better at finding a vein. I'll only say that a lesson from Makaru goes on a good deal longer than the digging does, so bring water." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = {
        { id = "miner_default", text = "The ridges north of Razor Hill, for copper, and don't bother with anything the quilboar have already picked at. Follow the dry streambeds; the rain does half your looking for you. And if the rock rings hollow, friend, step back and think before you swing." },
      },
      choices = {
        { text = "Dry streambeds, and listen for hollow rock.", next = "BACK", reply = "Good. You'll keep your toes. Come back when that pick's worn down and I'll sell you its big brother.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_blade = { { id = "tp_burning_blade", text = "They meet where it's dark and warm. I could show you three places under this city that fit, and nobody's asked me." } },
    internment = { { id = "tp_internment", text = "I dug ditches for humans there. The rock's the same; it's only who you're digging for that changes." } },
    thrall = { { id = "tp_thrall", text = "He asked my name and kept it. There's not much I wouldn't dig for him." } },
    trade = { { id = "tp_trade", text = "Copper's cheap and iron's dear, and it'll stay so till somebody finds iron nearer home." } },
    advice = { { id = "tp_advice", text = "If the rock rings hollow, stop and think. I've known two who didn't." } },
    _none = { { id = "tp_none", text = "I don't know it. If it's not under the ground, I've likely not met it." } },
  },
}

---------------------------------------------------------------------------
-- Shankys: orc fishing supplier at Lumak's Fishing, Valley of Honor.
---------------------------------------------------------------------------
P:NPC {
  key = "shankys", id = TODO_NPC("Shankys"), name = "Shankys", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "easygoing", "wry" }, values = { "patient", "friendly" },
  notices = { "craft", "race" },
  impression = {
    first = "Shankys sells hooks, line and bait at Lumak's Fishing by the pond in the Valley of Honor. She is unhurried about everything, and seems to find the valley's shouting warriors very funny.",
    third = "{name} met Shankys, who sells fishing gear by the pond in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "No rush. The fish aren't going anywhere, and neither am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more line? You're snagging it on the bottom. Everyone does, in this pond." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "Someone who fishes! Sit down a moment and tell me what's biting where you've been." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've a hook scar in your thumb, good and deep. That's a fisher who's landed something big, or been landed by it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people can sit still by water for a whole day. I wish you'd teach the grunts how it's done." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shankys. Lumak teaches the fishing here and I sell the hooks and line. Between us we're the only two orcs in the Valley of Honor who aren't hitting something." },
        { id = "h_fisher", when = { profession = "Fishing" }, text = "Shankys. You fish, so you know how it is. Half of what I sell is line, because half of fishing is losing it." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "I'm Shankys. A warrior at the fishing shack! Don't be shy about it. Sorek himself buys bait from me, and I'm sworn not to say so." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time." },
        { id = "h_again2", text = "Go on. I'm only untangling." },
        { id = "h_again3", text = "Ask away. The pond will keep." },
      },
      choices = {
        { text = "Let me see your tackle, Shankys.", next = "BUSINESS" },
        { text = "A fishing shack, between the warriors and the smiths.", next = "valley" },
        { text = "What do orcs think of fishing?", next = "orcs" },
        { text = "What lives in this pond?", next = "pond" },
        { text = "Xor'juul says you save him the fish heads.", next = "heads" },
        { text = "Where's the best fishing near Orgrimmar?", next = "fisher", when = { profession = "Fishing" } },
        { text = "Tight lines, Shankys.", next = "END" },
      },
    },
    valley = {
      lines = {
        { id = "valley_default", text = "It's the best seat in the city. I watch the Hall of the Brave empty out at midday, forty warriors all red in the face, and not one of them can sit on a rock for the count of ten. Then the smiths start up. Lumak and I just watch our floats." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = {
        { id = "orcs_default", text = "That it's for peons and old ones. A grunt wants his food to fight back. I tell them a fish does fight, it's just clever about it, and they laugh. Then a patrol comes home from the Barrens half starved because nobody could do anything but hunt boar." },
      },
      choices = {
        { text = "You'd have warriors learn to fish?", next = "orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      lines = {
        { id = "orcs2_default", text = "I would, and Lumak says the same. In the camps it was those who could fish the ditches and snare rats who kept their strength. I watched the proud ones go thin first. It marked me. A warrior who can't feed himself is on a leash to whoever can." },
      },
      choices = {
        { text = "Did you fish, in the camps?", next = "orcs3" },
        { text = "Something else, Shankys.", next = "BACK" },
      },
    },
    orcs3 = {
      big = true,
      lines = {
        { id = "orcs3_default", text = "With a bent nail and a thread from my own shirt. There was a drainage ditch behind the huts, and it had little grey fish in it that tasted of mud. I fed four of us that way. One of the four told me afterward it was shameful, an orc scrabbling in a ditch like that." },
      },
      choices = {
        { text = "There's no shame in keeping your people alive.", next = "BACK", reply = "That's what I told him, and less politely. He ate the fish, I noticed.", fx = { align = { honor = -1 } } },
        { text = "He had a point. Better hungry than broken.", next = "BACK", reply = "He'd agree with you still. He'd also be dead, if I'd agreed with him then.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pond = {
      lines = {
        { id = "pond_default", text = "Catfish, mostly, and fat ones, because the apprentice smiths throw their crusts in. There's a pike in the deep end that Lumak has been after for three years. He's named it. I'll not tell you the name; he'd be mortified." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    heads = {
      lines = {
        { id = "heads_default", text = "I do. He uses them to bait his traps, and in return he tells me where the beasts are drinking, which is where the fish are fat. It's a good arrangement. He pretends to be gruff about it, and then brings me a rabbit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fisher = {
      lines = {
        { id = "fisher_default", text = "The Southfury, just outside the west gate, for a quiet day. The coast below Sen'jin if you want something worth salting, though the trolls have the best rocks. And don't scorn this pond. I've pulled supper out of it more days than not." },
      },
      choices = {
        { text = "The Southfury, then, at the west gate.", next = "BACK", reply = "Go at first light, before the crocolisks are warm. And take more line than you think you'll need.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "A bent nail and a ditch. I've had worse meals since, and better company never." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins there sell a line that never frays. It costs like a wolf, and it's worth it." } },
    darkspear = { { id = "tp_darkspear", text = "The best fishers in the Horde, and they know it. I've learned more from one old troll at Sen'jin than from any orc." } },
    thrall = { { id = "tp_thrall", text = "I'm told he fishes, somewhere quiet, when he can get away. I'd believe it, because he has the patience." } },
    advice = { { id = "tp_advice", text = "Bring more line than you think you'll need. The bottom keeps what it catches." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it doesn't swim, I've not given it much thought." } },
  },
}

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
P:NPC {
  key = "tamar", id = TODO_NPC("Tamar"), name = "Tamar", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "steady", "dry" }, values = { "practical", "honest" },
  notices = { "craft" },
  impression = {
    first = "Tamar sells salt, thread and dyes at the Kodohide Leatherworkers in the Drag, and tests every awl on his own thumbnail before he sells it. He says little, and none of it is flattery.",
    third = "{name} met Tamar, the plain-spoken supplier at the Kodohide Leatherworkers in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Salt's in the barrel, thread's on the wall. If you want anything else, ask." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you salt the hide the same day? No. I can tell from your face." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. What weight of thread? Don't say \"the usual.\" There isn't one." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "That's a skinning knife worn thin in the belly of the blade. You've used it well, and it wants replacing soon." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your fingertips are stained with the black dye, not the brown. You've been making something for a rogue, or for someone who wants to look like one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tamar. Karolek's the master here, Kamari takes the beginners and Thuwd teaches the skinning. I sell them salt and thread and whatever else the work eats. It's not complicated, and I like it that way." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "Tamar. You work hides, so I'll say it once. Cheap salt ruins good leather, and I don't sell cheap salt." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I'm Tamar. If you've brought hides to sell, see Thuwd. If you want to learn what to do with them, see Kamari, and be ready to be shouted at." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Go on. I'm only winding thread." },
        { id = "h_again3", text = "Ask, and I'll answer if I know." },
      },
      choices = {
        { text = "Show me your supplies, Tamar.", next = "BUSINESS" },
        { text = "Why does the salt matter so much?", next = "salt" },
        { text = "What are the others in this shop like?", next = "shop" },
        { text = "Where do the hides come from?", next = "hides" },
        { text = "You test every awl yourself.", next = "awl" },
        { text = "What does a leatherworker run out of first?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "Good trade to you, Tamar.", next = "END" },
      },
    },
    salt = {
      lines = {
        { id = "salt_default", text = "Because a hide starts to rot the moment it's off the beast. Salt stops it, if it's clean and if there's enough. I've seen a kodo hide worth ten gold thrown on the midden because somebody saved three copper on the salt. It still makes me angry to think of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_default", text = "Karolek is the best leatherworker in Kalimdor and hasn't said forty words this year. Kamari would rather be hunting and takes it out on the hides. Thuwd cares for nothing but a clean cut. Handor and Morgum sell what's made, and tell us it wasn't made well enough." },
      },
      choices = {
        { text = "And where do you fit, among them?", next = "shop2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop2 = {
      lines = {
        { id = "shop2_default", text = "I'm the one who's still here when the others have gone home. Somebody has to turn the hides in the vats at night, or they cure unevenly. Nobody asked me to. I started doing it the first winter, because I saw it wasn't being done." },
      },
      choices = {
        { text = "Does Karolek know you do it?", next = "shop3" },
        { text = "Something else, Tamar.", next = "BACK" },
      },
    },
    shop3 = {
      big = true,
      lines = {
        { id = "shop3_default", text = "I don't think he does. He comes in at dawn and the hides are right, and he's a craftsman, so he takes it that they'd be right. I've thought of telling him, and then I don't see what I'd be telling him for. The leather's good. That was the point of it." },
      },
      choices = {
        { text = "Work done well is its own reward. Say nothing.", next = "BACK", reply = "That's where I always come down. It's good to hear someone else arrive at the same place.", fx = { align = { honor = 1 } } },
        { text = "Tell him. A master should know who keeps his shop.", next = "BACK", reply = "Maybe. But then I'd be turning the vats in order to be thanked, and I don't think I'd do it as well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_default", text = "Kodo from the tauren, by an old agreement. They take the beast with ceremony, and we don't waste any of it. Boar and raptor come from hunters at the door. Thuwd buys those, and he's fair, though he'll never tell you a hide is good. He only pays more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    awl = {
      lines = {
        { id = "awl_default", text = "On my thumbnail. If it skates, it's dull, and I'll not sell it. A dull awl tears the hole instead of piercing it, and then the stitch pulls through in a season. The smith who makes them hates me. He also makes better awls than he used to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lw = {
      lines = {
        { id = "lw_default", text = "Thread first, then salt, and then patience, which I don't stock. Buy twice the thread you think the piece needs, since a seam you've run short on is a seam you'll unpick, and keep your salt dry, because I'll not take it back damp." },
      },
      choices = {
        { text = "Twice the thread, and dry salt.", next = "BACK", reply = "That's it. You'll waste less than most.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "His people give us the kodo, and they ask only that nothing's wasted. I've seen to it that nothing is." } },
    centaur = { { id = "tp_centaur", text = "They hit the hide caravans and leave the hides. I'll never understand a raider who doesn't want the goods." } },
    trade = { { id = "tp_trade", text = "Salt's dear this season. The coast road's been bad." } },
    thrall = { { id = "tp_thrall", text = "He wears plate, so he's no customer of ours. His wolf riders are, and they pay." } },
    advice = { { id = "tp_advice", text = "Salt it the same day. Not the next morning." } },
    _none = { { id = "tp_none", text = "I don't know anything about that." } },
  },
}

---------------------------------------------------------------------------
-- Zeal'aya: troll herbalism supplier beside Jandi's arboretum.
---------------------------------------------------------------------------
P:NPC {
  key = "zealaya", id = TODO_NPC("Zeal'aya"), name = "Zeal'aya", title = "Herbalism Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "serene", "sly" }, values = { "nature", "patient" },
  notices = { "craft", "race" },
  impression = {
    first = "Zeal'aya sells sickles, pouches and seed beside Jandi's arboretum, and handles each plant as though it might be offended. She has a sly humor and a troll's long view of anything that grows.",
    third = "{name} met Zeal'aya, a Darkspear who sells herbalists' tools in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Softly, mon. De seedlings be sleepin', and Jandi will blame me if dey wake up cross." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. You have been walkin' on somethin' rare, I can smell it on your boots." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "An herb-gatherer, and welcome. Show me your sickle, and I will tell you how many plants you have hurt with it." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Your sickle be dull, mon. You be tearin' de stems, and a torn plant does not grow back for you." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Cousin. You have de look of one who misses green. Come, stand by de pots a moment. It helps a little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zeal'aya. Jandi teaches de gatherin' and I sell what a gatherer needs, sickles and pouches and a little seed. I also keep de peace between Jandi and de plants, which be harder dan it sounds." },
        { id = "h_herb", when = { profession = "Herbalism" }, text = "I be Zeal'aya, and you know de work. So I will only say dis: a sharp blade and a clean cut, and leave de root. De rest you will learn from de plants." },
        { id = "h_orc", when = { race = "Orc" }, text = "I be Zeal'aya. You be an orc, so you think a plant be somethin' dat happens to be in de way of your boot. Sit, mon. I will change your mind." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De pots can wait a little while." },
        { id = "h_again2", text = "Ask. Softly." },
        { id = "h_again3", text = "Go on. I be listenin', and so be de seedlings." },
      },
      choices = {
        { text = "Show me your wares, Zeal'aya.", next = "BUSINESS" },
        { text = "Jandi gives every seedling a name?", next = "jandi" },
        { text = "What grows in a land as dry as Durotar?", next = "durotar" },
        { text = "What did the Darkspear gather on the islands?", next = "isles" },
        { text = "Who buys from an herb seller in an orc city?", next = "buyers" },
        { text = "The plains taught my people which roots to leave.", next = "tauren", when = { race = "Tauren" } },
        { text = "Grow well, Zeal'aya.", next = "END" },
      },
    },
    jandi = {
      lines = {
        { id = "jandi_default", text = "Every one, mon, and scolds dem by name when dey wilt. I thought it was foolishness when I came here. Den I saw dat Jandi's seedlings live, and mine, which I did not name, mostly die. So now I name mine too, and I do not tell Jandi." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    durotar = {
      lines = {
        { id = "durotar_default", text = "More dan you think, if you kneel down. Earthroot holds de slopes together. Peacebloom finds every crack with a little shade. Dey be small, tough, and stubborn, mon, like de people who live here now. A land grows de plants it deserves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = {
        { id = "isles_default", text = "Everythin'. On de Echo Isles you could not put down your foot without crushin' medicine. Dere was a vine dat stopped bleedin' and a moss dat brought down fever. I have not found either on dis side of de water, and I have looked hard." },
      },
      choices = {
        { text = "Could you bring them back from the isles?", next = "isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles2 = {
      lines = {
        { id = "isles2_default", text = "I tried, mon. Two years past I paid a fisher to row me out at night, past Zalazane's watchers, and I dug up a dozen roots in de dark. I carried dem home inside my shirt. Eleven died in dis red dust before de month was out." },
      },
      choices = {
        { text = "And the twelfth?", next = "isles3" },
        { text = "Something else, Zeal'aya.", next = "BACK" },
      },
    },
    isles3 = {
      big = true,
      narr = "She glances at a small clay pot set apart from the others, in the deepest shade.",
      lines = {
        { id = "isles3_default", text = "It lives. One vine, de length of my hand, and it has not grown since. Jandi says to plant it out and let it take its chances in Durotar soil. I say it will die. Maybe I be keepin' it alive, mon, or maybe I be only keepin' it." },
      },
      choices = {
        { text = "Plant it. A thing that cannot grow is not alive.", next = "BACK", reply = "Dat be what Jandi says. And de Darkspear did grow here, in de end. I will think on it, mon. Maybe after de rains.", fx = { align = { order = -1 } } },
        { text = "Keep it safe. It is the last, and you can't risk it.", next = "BACK", reply = "So I tell myself every mornin'. It be a small thing to guard, but I have not much else from home.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_default", text = "Alchemists, first. Yelmak's people send over for vials of dis and dat. Den de healers, and Zamja for her pot. And now and den a grunt, mon, very quiet and lookin' over his shoulder, who wants somethin' to help him sleep. I never ask what he dreams about." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Den your people be wiser dan most, and I have said so to Jandi. A tauren herbalist came through last season and showed me how to cut so de plant flowers twice. I gave her seed from de isles in thanks. I hope it grows in Mulgore." },
      },
      choices = {
        { text = "May it take root there.", next = "BACK", reply = "May it, mon. It would please me to think of island flowers on your plains.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "Everythin' I miss grows dere. Zalazane's fools trample it, and dey do not even know what dey be walkin' on." } },
    earth_mother = { { id = "tp_earth_mother", text = "De tauren say de land be a mother. De Darkspear say it be full of spirits. I think we be talkin' about de same garden." } },
    wailing_caverns = { { id = "tp_wailing_caverns", text = "Dere be plants in dat place dat should not be awake. I would not pick dem, and I would not sell de sickle to one who meant to." } },
    voljin = { { id = "tp_voljin", text = "He knows de old medicines better dan I do. A shadow hunter has to." } },
    advice = { { id = "tp_advice", text = "Leave de root, mon. De plant will remember you kindly." } },
    _none = { { id = "tp_none", text = "Dat does not grow anywhere I have walked, so I cannot tell you about it." } },
  },
}

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
P:NPC {
  key = "tumi", id = TODO_NPC("Tumi"), name = "Tumi", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "blunt", "proud" }, values = { "family", "honest" },
  notices = { "gear", "class" },
  impression = {
    first = "Tumi sells plate and mail in the Valley of Honor and fits every piece herself, with remarks. She is Saru Steelfury's elder daughter, and she will tell a warrior to his face that the old breastplate no longer closes.",
    third = "{name} met Tumi, Saru Steelfury's blunt elder daughter, who sells and fits heavy armor in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Stand straight and let me look at you. No, you can breathe out, I measure people the way they really are." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you've been eating well since I saw you. Don't scowl, it only means I'll have to let the straps out." },
    { id = "g_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Now here's someone who wears what I sell. Turn around slowly and let me see what's been done to that back plate." },
  },
  notice = {
    { id = "n_worn", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That armor's hanging on you by two straps and stubbornness. Take it off before it falls off, and let me find you something that will hold." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your left pauldron sits a finger lower than your right, which means you carry your shield arm heavy. I can pad for that, and nobody else will think to." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tumi. My father Saru teaches the smiths, my sister Sumi keeps them in coal, and I sell what they make to those who'll be hit while wearing it. I fit every piece myself, and I tell the truth about how it sits." },
        { id = "h_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "I'm Tumi, and you're exactly who I open this stall for. I'll not sell you plate off the rack and wave you away; you'll stand here until it moves when you move." },
        { id = "h_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "I'm Tumi. There's nothing on this stall you could lift, never mind wear, but you're welcome to stand in the shade of it and talk." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I buckle." },
        { id = "h_again2", text = "Go on and ask, I've a fitting due but not yet." },
        { id = "h_again3", text = "Ask it plainly and I'll answer the same way." },
      },
      choices = {
        { text = "Show me your armor, Tumi.", next = "BUSINESS" },
        { text = "You tell your customers the truth, I hear.", next = "truth" },
        { text = "What is it to be Saru Steelfury's daughter?", next = "saru" },
        { text = "Sumi says you two fight like wolves.", next = "sumi" },
        { text = "Whose work do you sell?", next = "makers" },
        { text = "What should I look for in a breastplate?", next = "plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'll stand straighter next time.", next = "END" },
      },
    },
    truth = {
      lines = {
        { id = "truth_default", text = "I do, and it has cost me customers. A warrior comes in with a breastplate from his first campaign and wants it to fit as it did, and it doesn't, because he's ten years older and has sat at a good many feasts. Somebody must tell him so before a spear does." },
      },
      choices = {
        { text = "How do they take it?", next = "truth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth2 = {
      lines = {
        { id = "truth2_default", text = "Badly, for the most part, and then they come back. There was a sergeant, a great loud orc, who called me an insolent whelp and stamped out. A month later he returned without a word, stood on my block, and let me measure him properly for the first time since the camps." },
      },
      choices = {
        { text = "What changed his mind?", next = "truth3" },
        { text = "Something else, Tumi.", next = "BACK" },
      },
    },
    truth3 = {
      big = true,
      lines = {
        { id = "truth3_default", text = "He'd been winded on a patrol, with the plate cutting into him so that he couldn't draw a full breath, and a younger grunt had to cover him. He told me I'd shamed him and saved him in the same hour. Sumi says I could have done the saving without the shaming, if I'd been gentler." },
      },
      choices = {
        { text = "Truth told gently is still truth. Sumi has a point.", next = "BACK", reply = "So Father says, in fewer words. I've tried gentle, and they don't hear it, but I'll grant I might try it longer.", fx = { align = { light = 1 } } },
        { text = "A hard truth is a kindness. He needed the sting.", next = "BACK", reply = "That's how I've always seen it. An orc remembers what stung him, and that sergeant has stood straight on my block ever since.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    saru = {
      lines = {
        { id = "saru_default", text = "It means every smith in this valley watches how I handle a piece, to see if I've the eye. I have it, as it happens, and I chose to sell and fit when I might have forged. Father respects a thing done well, whatever the thing is, and he's told me so exactly once." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sumi = {
      lines = {
        { id = "sumi_default", text = "We do, and we always have. She's quicker than I am and she knows it, and I'm stronger and she knows that too. But the winter the coal ran short she kept every forge in this valley lit, and I told three different smiths I'd break their jaws if they forgot whose doing it was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    makers = {
      lines = {
        { id = "makers_default", text = "Krathok's and Okothos's, when I can get it, since neither lets a piece go that isn't right. Shayis makes to order and walks it round herself. The plain stock for the grunts comes off the students' benches, after Father has looked it over, and it's sounder than it is pretty." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = {
        { id = "plate_default", text = "Look at where it stops. A breastplate that's too long will ride up under your chin when you sit a wolf, and one that's too short leaves a hand's width of belly for the first spear that comes. Bend, twist and crouch in it before you pay, and if the merchant objects, walk away." },
      },
      choices = {
        { text = "I'll bend and twist before I buy.", next = "BACK", reply = "Good, and do it here, where I can watch. I've never objected yet.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "I was small, and I remember Father with no hammer in his hand, which frightened me more than the guards did." } },
    warsong = { { id = "tp_warsong", text = "Their riders want mail they can sit a wolf in for a week, and they'll take a rub over a rattle every time." } },
    thrall = { { id = "tp_thrall", text = "That black plate of his was made for Orgrim Doomhammer, and it fits him as though it had been waiting. I'd give a year's takings to know who altered it." } },
    advice = { { id = "tp_advice", text = "Bend, twist and crouch in it before you pay, and never buy armor standing still." } },
    _none = { { id = "tp_none", text = "I couldn't say. If I can't put a measuring cord round it, I've likely no opinion." } },
  },
}

---------------------------------------------------------------------------
-- Kiro: orc war harness maker, Kiro's Harnesses, Valley of Honor.
---------------------------------------------------------------------------
P:NPC {
  key = "kiro", id = TODO_NPC("Kiro"), name = "Kiro", title = "War Harness Maker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "steady", "warm" }, values = { "craft", "practical" },
  notices = { "gear", "class" },
  impression = {
    first = "Kiro makes war harnesses in the Valley of Honor, the straps and padding that sit between an orc and his steel. She says that nobody praises a harness, and that she can tell a good one because nobody mentions it.",
    third = "{name} met Kiro, who makes the war harnesses worn beneath the armor of Orgrimmar's fighters.",
  },
  greetings = {
    { id = "g_default", text = "Come in and mind the hanging straps. If you've a harness that rubs, you may as well show me now, because I'll see it in how you stand anyway." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you're carrying your shoulders easier than you were, so either the padding's settled or you've bought a lighter axe." },
    { id = "g_hunter", when = { class = { "HUNTER", "SHAMAN" } }, text = "A fighter who wears leather under the mail, unless I'm wrong. Good, then you already know that the part nobody sees does half the work." },
  },
  notice = {
    { id = "n_worn", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Your straps are cracked through at the buckle holes, and I'd guess they've never once been oiled. Let me see to those before the whole harness lets go in a fight." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You've a raw patch on your neck where the plate edge sits. That's a harness cut for someone narrower than you, and no warrior should put up with it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kiro, and I make war harnesses. The smiths up the valley make the steel that everyone admires, and I make the leather that keeps it from flaying whoever is inside. It's quiet work, and I've never minded that." },
        { id = "h_fighter", when = { class = { "WARRIOR", "HUNTER", "SHAMAN" } }, text = "I'm Kiro. You wear a harness into battle, so I'll tell you what I tell all of them: if you notice it while you're fighting, it was made wrong, and you should bring it back." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "I'm Kiro, and you work leather yourself, by your hands. Then you'll know that a strap is harder to cut well than a whole jerkin, since there's nowhere in it to hide a mistake." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on, I can stitch and listen at once." },
        { id = "h_again3", text = "Ask away, the wax needs a moment to set." },
      },
      choices = {
        { text = "Show me your harnesses, Kiro.", next = "BUSINESS" },
        { text = "Nobody praises a harness, you say.", next = "praise" },
        { text = "Shayis sends her customers to you.", next = "shayis" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "What fails first on a harness?", next = "fails" },
        { text = "I work leather. What's the trick to a good strap?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "May your stitching hold, Kiro.", next = "END" },
      },
    },
    praise = {
      lines = {
        { id = "praise_default", text = "They don't, and they shouldn't. A warrior comes home and tells the tavern about his axe and his breastplate. He never says that his straps held, any more than he says his boots stayed on. I've made peace with that, though it took me some years." },
      },
      choices = {
        { text = "What took you years to accept?", next = "praise2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise2 = {
      lines = {
        { id = "praise2_default", text = "That I'd never be named. I trained beside smiths whose marks are known from here to the Crossroads, and I was as good at my trade as they were at theirs. Nobody stamps a harness, and nobody hangs one in the Hall of Legends. I was bitter about it for longer than I like to admit." },
      },
      choices = {
        { text = "What ended the bitterness?", next = "praise3" },
        { text = "Something else, Kiro.", next = "BACK" },
      },
    },
    praise3 = {
      big = true,
      lines = {
        { id = "praise3_default", text = "A wolf rider's widow brought me his harness to be buried with him. She said he'd worn it eleven years and called it his second skin, and that he'd never known who made it. I nearly told her, and then I thought it would only be for my own sake, so I buried my name with it." },
      },
      choices = {
        { text = "You did right. The work was honor enough.", next = "BACK", reply = "That's what I decided, standing there with it in my hands. I've slept well on it since, which I take as a sign.", fx = { align = { honor = 1 } } },
        { text = "You should have told her. A maker deserves her name.", next = "BACK", reply = "Perhaps I did deserve it. But it was her grief, and I'd not have made it a moment about me for all the marks in the valley.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shayis = {
      lines = {
        { id = "shayis_default", text = "She does, and I send mine to her. Shayis fits her plate to the body as it truly moves, and that's the only way my harness can do its work underneath. We've stood a warrior between us for an hour, the two of us arguing over a thumb's width, while he begged to be let go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = {
        { id = "leather_default", text = "Kodo for the heavy straps, from Karolek's shop in the Drag, because nothing else takes the strain. Boar for the padding, since it's soft and there's no end of it in Durotar. Tamar sends up the wax and the thread, and he's never once sent me a short measure." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fails = {
      lines = {
        { id = "fails_default", text = "The buckle holes, every time. Sweat gets into them, and the leather dries and cracks from the inside where you can't see it. Oil them when you oil your blade, which is to say more often than you do now, and look for a pale line round the hole." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lw = {
      lines = {
        { id = "lw_default", text = "Cut along the spine of the hide and never across it, or the strap will stretch on one side and twist. Skive the ends thin, so the buckle sits flat. And wax your thread twice, because the second waxing is the one that keeps the sweat out." },
      },
      choices = {
        { text = "Along the spine, and wax it twice.", next = "BACK", reply = "That's the whole of it, near enough. Bring me one you've made and I'll tell you honestly how it would wear.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    warsong = { { id = "tp_warsong", text = "They live in my harnesses for weeks at a time. I cut theirs wider at the hip, for the saddle, and they've never said they noticed." } },
    cairne = { { id = "tp_cairne", text = "The tauren give us kodo hide under an old promise that none of it is wasted. I use the offcuts for buckle guards." } },
    thrall = { { id = "tp_thrall", text = "I've wondered what sits under that black plate. Whoever made it has gone unnamed too, and I feel a kinship there." } },
    advice = { { id = "tp_advice", text = "Oil the buckle holes whenever you oil your blade." } },
    _none = { { id = "tp_none", text = "I can't tell you about that. I only know what sits between the steel and the skin." } },
  },
}

---------------------------------------------------------------------------
-- Morgum: orc leather armor merchant at Soran's Leather and Steel Armory, Valley of Strength.
---------------------------------------------------------------------------
P:NPC {
  key = "morgum", id = TODO_NPC("Morgum"), name = "Morgum", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "genial", "shrewd" }, values = { "trade", "friendly" },
  notices = { "class", "gear" },
  impression = {
    first = "Morgum sells leather armor at Soran's armory in the Valley of Strength and haggles with the Drag's leatherworkers for the pleasure of it. He is good-humored, and has an opinion on what every customer ought to be wearing.",
    third = "{name} met Morgum, the good-humored leather armor merchant at Soran's armory in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Soran's! Leather's on my side and mail's on Sana's, and if you're not sure which you want, start with me, because I'm better company." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! That jerkin's worn in nicely, I see, and I told you it would, though I don't believe you credited me at the time." },
    { id = "g_rogue", when = { class = { "ROGUE", "DRUID", "HUNTER" } }, text = "Now here's someone who knows what leather's for. Come round this side and I'll show you what came up from the Drag this morning." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move quietly, friend, but your boots creak at the ankle. That's dry leather, and a tin of my dubbin would cure it by tomorrow." },
    { id = "n_worn", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That armor has more holes than hide in it. I'm a merchant, so I would say it, but truly, you can't go out of the gate in that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Morgum, and I sell leather armor under Soran's roof. Soran himself is over at the bank counting other people's coin, so Sana and I run the floor, and Thatog keeps the stock up the stairs." },
        { id = "h_leather", when = { class = { "ROGUE", "DRUID", "HUNTER", "SHAMAN" } }, text = "I'm Morgum. You wear leather, so we'll get along. Everything on this wall came out of the Kodohide shop in the Drag, and I argued over the price of every piece for your benefit." },
        { id = "h_plate", when = { class = "WARRIOR" }, text = "I'm Morgum. You'll want plate, warrior, and I don't carry it, so see Tumi in the Valley of Honor. But stay and talk a while; warriors always have the best news." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on and ask, I'm in no hurry to sell you anything." },
        { id = "h_again3", text = "Ask away! Talking's most of this job." },
      },
      choices = {
        { text = "Show me your leathers, Morgum.", next = "BUSINESS" },
        { text = "You argue over every price with the Kodohide shop.", next = "haggle" },
        { text = "Soran's name is on the door, yet he's never here.", next = "soran" },
        { text = "How do you and Sana share a shop?", next = "sana" },
        { text = "What does the Valley of Strength buy?", next = "valley" },
        { text = "I skin my own kills. Would you buy the leather?", next = "skinner", when = { profession = "Skinning" } },
        { text = "Good trade to you, Morgum.", next = "END" },
      },
    },
    haggle = {
      lines = {
        { id = "haggle_default", text = "Every one, and I wouldn't give it up. Karolek names a price in three words, I laugh, Handor is offended on his behalf, and Kamari threatens me with a scraping knife. Then we settle within a copper of where we always do. It takes an hour, and it's the best hour of my week." },
      },
      choices = {
        { text = "Why haggle, if you always end in the same place?", next = "haggle2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    haggle2 = {
      lines = {
        { id = "haggle2_default", text = "Because of where I learned it. In the camps there was nothing to trade but scraps, a crust for a bootlace or a button for a turn by the fire. We bargained for hours over nothing at all. It was the one thing left that made us feel like people with something to decide." },
      },
      choices = {
        { text = "So the haggling was never about the price.", next = "haggle3" },
        { text = "Something else, Morgum.", next = "BACK" },
      },
    },
    haggle3 = {
      big = true,
      lines = {
        { id = "haggle3_default", text = "Never. It was about two orcs looking each other in the eye and agreeing on what a thing was worth. Sana tells me I waste half a day on theatre, and that an honest merchant names one fair price and keeps to it. She's very likely right, and I'd still be sorry to stop." },
      },
      choices = {
        { text = "Keep haggling. It's how your people stayed people.", next = "BACK", reply = "That's the heart of it, and I'm glad someone else sees it. I'll tell Karolek a stranger took my side, and he'll say three words about it.", fx = { align = { order = -1 } } },
        { text = "Sana's right. One fair price is the honest way.", next = "BACK", reply = "It's the tidy way, I'll allow. But there's nothing in a fixed price to look forward to, friend, and I'm an orc who likes his mornings.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soran = {
      lines = {
        { id = "soran_default", text = "He means to be. This shop was to be his whole life, and then the Warchief asked the three brothers to keep the bank, and you don't say no to that. He comes in after dark and does the accounts by one lamp. I leave him a cup of something, and it's always gone in the morning." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sana = {
      lines = {
        { id = "sana_default", text = "By keeping to our own walls. She sells mail and doesn't hold with chatter, and I sell leather and hold with little else. A customer who wants silence goes left, and one who wants company goes right. We've neither of us lost a sale to the other in six years." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = {
        { id = "valley_default", text = "Everything, and in a hurry. This is where they come straight off the wind rider, with the inn on one side and the bank on the other, and half of them bought the wrong armor somewhere else and have just found it out. I do very well from other merchants' mistakes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skinner = {
      lines = {
        { id = "skinner_default", text = "I'd not, friend, and I'll tell you why. I sell made goods, and a raw hide's no use to me. Take it to Thuwd at the Kodohide shop, who'll pay you fairly and won't smile once. In a month it'll be hanging on this wall at four times the price, and we'll both have done well." },
      },
      choices = {
        { text = "To Thuwd, then, and back to you in a month.", next = "BACK", reply = "That's the way of it! You're a customer after my own heart.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "We traded buttons for bootlaces and thought ourselves rich. I've kept one of the buttons." } },
    trade = { { id = "tp_trade", text = "Leather's steady, and it will be for as long as there are boar in Durotar, which is to say forever." } },
    warsong = { { id = "tp_warsong", text = "They buy riding leathers by the dozen and never haggle, which I count a great waste of an afternoon." } },
    thrall = { { id = "tp_thrall", text = "He walked through the valley once and nodded at the shop. Sana says he nodded at her side, and we've not settled it." } },
    advice = { { id = "tp_advice", text = "Never pay the first price, friend, and that includes mine." } },
    _none = { { id = "tp_none", text = "That's beyond me, friend. I know leather and I know gossip, and that was neither." } },
  },
}

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
P:NPC {
  key = "urtharo", id = TODO_NPC("Urtharo"), name = "Urtharo", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "hearty", "plain" }, values = { "honest", "practical" },
  notices = { "purse", "class" },
  impression = {
    first = "Urtharo sells plain, sound weapons at the Shattered Axe in the Valley of Strength, mostly to new recruits. He remembers what his first axe meant to him, and sells every first axe as if it mattered.",
    third = "{name} met Urtharo, who sells honest first weapons to Orgrimmar's recruits at the Shattered Axe.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Shattered Axe! Don't mind the name, friend; it's the old one that's shattered, and everything on the rack is whole." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still carrying what I sold you, which is the best thing a merchant can see." },
    { id = "g_young", when = { maxLevel = 12 }, text = "Fresh up from the Valley of Trials, by the dust on you. Come and stand here, and let's find something that fits your hand and your purse both." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "That's a thin purse, and I've seen thinner. Never mind it. I keep a rack at the back for orcs with more courage than copper." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "That's a serious weapon you've got, and far beyond anything on my racks. I only hope you remember who sold you the one before the one before it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Urtharo, and this is the Shattered Axe. I sell plain weapons at plain prices to those who are starting out. They'll not win you any admiring looks, but they'll not break in your hand either, and that's the bargain." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I'm Urtharo. You're new to the road, so hear an old merchant out. Buy the plain one that fits your grip, and save your silver for the day you know what you're doing." },
        { id = "h_veteran", when = { minLevel = 40 }, text = "I'm Urtharo. You've long outgrown my racks, friend, and I'm glad of it. Stay and tell me where you've been, though, because I send a good many young ones out and seldom hear how the road treats them." },
      },
      again = {
        { id = "h_again", text = "What else? I've always time for a customer." },
        { id = "h_again2", text = "Go on, friend, ask whatever you like." },
        { id = "h_again3", text = "Ask away, the racks will mind themselves." },
      },
      choices = {
        { text = "Show me your weapons, Urtharo.", next = "BUSINESS" },
        { text = "Why is it called the Shattered Axe?", next = "name" },
        { text = "You sell mostly to recruits.", next = "recruits" },
        { text = "Who else sells arms in this city?", next = "others" },
        { text = "Wabang told me of an axe that sold for three gold.", next = "wabang" },
        { text = "I'm new. What should my first weapon be?", next = "first", when = { maxLevel = 15 } },
        { text = "Keep the racks full, Urtharo.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "name_default", text = "For the one hanging over the door, in two pieces. It was my first, a camp-made thing I hammered out of a cart tyre the week the fences came down. It broke on a human shield at the very next fight, and I carried the two halves all the way to Durotar." },
      },
      choices = {
        { text = "Why keep a broken axe?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = {
        { id = "name2_default", text = "Because of what it was to hold it. I'd had nothing in my hands for years but a shovel and a bowl, and then I had that, ugly as it was. I stood straighter than I had since I was a boy. It could have been a table leg, and it would have done the same for me." },
      },
      choices = {
        { text = "So you sell that feeling to the recruits.", next = "name3" },
        { text = "Something else, Urtharo.", next = "BACK" },
      },
    },
    name3 = {
      big = true,
      lines = {
        { id = "name3_default", text = "I try to. A young one comes in with a few silver and I put a weapon in their hand, and I watch for the moment their back straightens. Kelgruk says I'm sentimental and that I ought to sell them something better or nothing at all, since a poor axe gets a recruit killed." },
      },
      choices = {
        { text = "The first weapon makes the warrior. Yours is good work.", next = "BACK", reply = "That's what I hold to. They'll buy a better one from Kelgruk in a year, and they'll be alive to do it because they stood up straight today.", fx = { align = { light = 1 } } },
        { text = "Kelgruk's right. Pride won't turn a blade.", next = "BACK", reply = "No, it won't, and I've never said it would. That's why mine are sound, friend, even if they're plain. I'd not sell a feeling on a bad edge.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = {
        { id = "recruits_default", text = "Nearly all, and by choice. They come up the road from the Valley of Trials with whatever the trainers handed them, a club or a notched knife. I'm the first shop most of them have ever stood in. I make certain it's a fair one, so they'll know a cheat when they meet him later." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Plenty. Kelgruk and Borgosh make the fine things up in the Valley of Honor, and Zendo'jian and Shoma sell there at the Arms of Legend. Galthuk has the great two-handed blades. Kareth, down in the Cleft, sells knives to folk who don't give their names. I've no quarrel with any of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wabang = {
      lines = {
        { id = "wabang_default", text = "Hah, he tells everyone that story! It was one of mine, a plain steel axe I'd priced at a handful of silver. I watched those two fools bid it up from across the valley and didn't know whether to laugh or weep. I'd have sold either of them ten for that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_default", text = "Whatever sits easy in your hand with your arm hanging loose. Don't pick it up and swing it about, since anything feels fine for three swings. Hold it at your side while we talk, and if you've forgotten it's there by the time we've finished, that's your weapon." },
      },
      choices = {
        { text = "I'll hold one while we talk, then.", next = "BACK", reply = "Good! Take that one, third from the end, and we'll see whether you're still holding it comfortably when you leave.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "We had shovels, and the guards counted them every night. I've never liked the look of a shovel since." } },
    thrall = { { id = "tp_thrall", text = "He carried a plain blade once, before the hammer came to him. Everyone starts with a plain one, friend, even a warchief." } },
    trade = { { id = "tp_trade", text = "Copper and plain steel. I leave the mithril to those with patience for it." } },
    alterac = { { id = "tp_alterac", text = "The Frostwolves send their young ones down sometimes, and they arrive with weapons better than mine. That's a clan that looked after its own." } },
    advice = { { id = "tp_advice", text = "Buy the one that fits your grip, and never the one that looks best on the rack." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. Ask me about an axe and I'm your orc." } },
  },
}

---------------------------------------------------------------------------
-- Zendo'jian: troll weapon vendor, Arms of Legend, Valley of Honor; light, quick weapons.
---------------------------------------------------------------------------
P:NPC {
  key = "zendojian", id = TODO_NPC("Zendo'jian"), name = "Zendo'jian", title = "Weapon Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth", "sly" }, values = { "cunning", "trade" },
  notices = { "class" },
  impression = {
    first = "Zendo'jian sells weapons in the Valley of Honor, and steers every customer toward something lighter than they came in for. He is a smooth talker with a Darkspear's faith that speed beats weight.",
    third = "{name} met Zendo'jian, a smooth-tongued Darkspear weapon vendor in Orgrimmar who favors light blades.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, mon, welcome. Put down dat great heavy thing you be carryin' and rest your arm, and I will show you somethin' kinder." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my friend returns. And how be de shoulder, mon, a little less sore dan when you carried de heavy one?" },
    { id = "g_troll", when = { race = "Troll" }, text = "Cousin! At last, a customer I need not persuade. Come, de good ones be at de back, where de orcs do not look." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Dat weapon weighs as much as a small orc, mon. You swing it well, I do not doubt, but I wonder how you feel at de hundredth swing." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Now you understand me already, I can see it. Two light blades and quick feet. You and I will have a short and happy conversation." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zendo'jian, and I sell weapons at de Arms of Legend with Shoma and Koru. Dey sell de heavy ones, mon, and I sell de ones you can still lift at de end of de day." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Zendo'jian, cousin. De orcs here think a weapon be good if it be big. We know better, you and I, and I keep a rack for dose who know better." },
        { id = "h_orc", when = { race = "Orc" }, text = "I be Zendo'jian. You be an orc, so you will want de biggest axe I have, and I will sell it to you gladly. But let me put a lighter one in your other hand first, only so you can feel de difference." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I have all day for a customer." },
        { id = "h_again2", text = "Go on and ask, de blades be not goin' anywhere." },
        { id = "h_again3", text = "Ask, mon, and I will try not to sell you anythin' while I answer." },
      },
      choices = {
        { text = "Show me your weapons, Zendo'jian.", next = "BUSINESS" },
        { text = "Why do you push the lighter weapons?", next = "light" },
        { text = "Kelgruk warned me you'd sell me something lighter.", next = "kelgruk" },
        { text = "How do you share a shop with two orcs?", next = "shop" },
        { text = "What weapons did the Darkspear carry on the isles?", next = "isles" },
        { text = "I throw my weapons. Have you anything balanced for it?", next = "thrower", when = { class = { "HUNTER", "ROGUE", "WARRIOR" }, race = "Troll" } },
        { text = "Stay quick, Zendo'jian.", next = "END" },
      },
    },
    light = {
      lines = {
        { id = "light_default", text = "Because I have seen what kills, mon, and it be not de heaviest blow. It be de second blow, de one dat comes while de big axe be still goin' round. An orc swings once and it be a thing of beauty. A troll has cut him twice and stepped away before it lands." },
      },
      choices = {
        { text = "You've seen this for yourself?", next = "light2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light2 = {
      lines = {
        { id = "light2_default", text = "On de beach at de Echo Isles, when de murlocs came. Dere were hundreds, small and fast. Our strongest warrior had a great stone maul, and he killed five with every swing. Dey pulled him down between de swings, mon, because five was not enough." },
      },
      choices = {
        { text = "And those with lighter weapons?", next = "light3" },
        { text = "Something else, Zendo'jian.", next = "BACK" },
      },
    },
    light3 = {
      big = true,
      lines = {
        { id = "light3_default", text = "We lived, some of us. I had two little fish-spears and I never stopped movin'. So when I tell a young orc to buy light, I be not only makin' a sale. Shoma says I frighten customers away from de good heavy steel dat de Horde has always won with." },
      },
      choices = {
        { text = "You're right. Speed keeps a fighter alive.", next = "BACK", reply = "Dat be all I try to say, mon. I say it with a price attached, because I have rent, but I do mean it.", fx = { align = { order = -1 } } },
        { text = "Shoma's right. The Horde wins with weight and strength.", next = "BACK", reply = "Against knights in a line, mon, yes, he be right. I only remember a beach where de enemy did not stand in a line.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelgruk = {
      lines = {
        { id = "kelgruk_default", text = "Ha, so he warned you! Kelgruk and I have dis argument every time we pass, because he says a fighter should grow into a weapon, and I say a dead fighter grows into nothin'. He be a fine craftsman, mon, and stubborn as a kodo, and I like him very much." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_default", text = "Easily, because we never want de same customer. Shoma sells de axes and swords dat orcs dream about. Koru has de maces and de staves, and he talks to de shaman for hours. I take whoever be left lookin' tired. Dere be always someone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = {
        { id = "isles_default", text = "Spears, mostly, and throwin' axes, and knives of sharpened shell. We had little metal, mon. Everythin' was light because it had to be carried through jungle, and thrown, and fetched back. Dat be why a Darkspear still looks at a great two-handed sword and laughs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    thrower = {
      lines = {
        { id = "thrower_default", text = "For you, cousin, yes. I keep dem wrapped at de back, because de orcs pick dem up and say dey be toys. Feel de weight forward of de grip, just so. It will turn once in de air at ten paces, and you know what to do from dere." },
      },
      choices = {
        { text = "One turn at ten paces. I know it well.", next = "BACK", reply = "Of course you do, mon. It be good to sell to someone who does not need tellin'.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "I left two fish-spears in de sand dere. If we ever go back, I mean to look for dem." } },
    darkspear = { { id = "tp_darkspear", text = "We fight light because we be few, mon. Every one of us must be alive for de next battle." } },
    voljin = { { id = "tp_voljin", text = "He carries a glaive he can turn like a feather. I point to him whenever an orc tells me light weapons be toys." } },
    trade = { { id = "tp_trade", text = "Steel for de orcs and somethin' quicker for everyone with sense. Business be steady." } },
    advice = { { id = "tp_advice", text = "Ask yourself how it feels at de hundredth swing, mon, and never at de first." } },
    _none = { { id = "tp_none", text = "I have nothin' to sell you on dat subject, mon, and so nothin' to say." } },
  },
}

---------------------------------------------------------------------------
-- Koru: orc mace and staff vendor, Arms of Legend, Valley of Honor; sells to the shaman.
---------------------------------------------------------------------------
P:NPC {
  key = "koru", id = TODO_NPC("Koru"), name = "Koru", title = "Mace & Staves Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm", "grave" }, values = { "devout", "patient" },
  notices = { "class" },
  impression = {
    first = "Koru sells maces and staves in the Valley of Honor, mostly to shaman, and speaks of wood and stone as things with spirits in them. He handles every staff as if he were asking its leave.",
    third = "{name} met Koru, a grave orc who sells maces and staves to the shaman of Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome. Take your time among the staves, and handle them gently; some of this wood is older than the city." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. The staff you looked at last time is still here, and I have wondered whether it was waiting for you." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A speaker to the elements. Then you will know that a mace is more than a weight on a stick, and we shall understand each other." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You hold your weapon away from your body, as one holds a thing that is listening. That is a shaman's habit, and a good one." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "You lean on your staff like a walking stick. I mean no rebuke, but the wood feels it, and it will serve you better if you carry it upright." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Koru. I sell maces and staves at the Arms of Legend, beside Shoma and the troll Zendo'jian. Most who come to me are shaman, and they come because I do not treat what I sell as dead wood and cold stone." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Koru, and you walk with the spirits. Then I will not sell you a weapon so much as introduce you to one. Hold each for a while, and you will know which is yours." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Koru. Your people carved totems when mine had forgotten how. I learned to choose wood from a tauren of Thunder Bluff, and I am in his debt each day I open this stall." },
      },
      again = {
        { id = "h_again", text = "There is no hurry. What else would you ask?" },
        { id = "h_again2", text = "Go on, I am listening to you." },
        { id = "h_again3", text = "Ask, and I will answer as well as I am able." },
      },
      choices = {
        { text = "Show me your maces and staves, Koru.", next = "BUSINESS" },
        { text = "You speak of wood as if it lived.", next = "wood" },
        { text = "Why do the shaman favor the mace?", next = "mace" },
        { text = "Tell me of the others at the Arms of Legend.", next = "shop" },
        { text = "Where does your wood come from?", next = "source" },
        { text = "The elements have told me a weapon is a promise.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Spirits guide you, Koru.", next = "END" },
      },
    },
    wood = {
      lines = {
        { id = "wood_default", text = "It did live, and something of that stays. A staff cut from a tree that grew slowly on a dry hill is patient and hard. One cut from a river willow bends and forgives. I do not claim to hear them as a shaman does, but I have handled enough to know they differ." },
      },
      choices = {
        { text = "Were you ever a shaman yourself?", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      lines = {
        { id = "wood2_default", text = "I wished to be. When the Warchief brought back the old ways, I went to the Valley of Wisdom and asked to be taught. I sat for a year. The elements did not answer me, not once, and at the end of it Zor Lonetree told me gently that some are not called." },
      },
      choices = {
        { text = "That must have been bitter to hear.", next = "wood3" },
        { text = "Something else, Koru.", next = "BACK" },
      },
    },
    wood3 = {
      big = true,
      narr = "He turns a plain ash staff in his hands, end over end, without looking at it.",
      lines = {
        { id = "wood3_default", text = "It was. I had thought that every orc would have the spirits back, and that I would be among them. Then I found that I could at least choose the tools for those who are called, and choose them well. I tell myself that this is also a way of serving. On some days I believe it." },
      },
      choices = {
        { text = "It is service. The called need those who equip them.", next = "BACK", reply = "So Zor Lonetree said when he sent me here. I am grateful to hear it from one who had no need to be kind.", fx = { align = { light = 1 } } },
        { text = "You gave up too soon. The spirits test the patient.", next = "BACK", reply = "Perhaps they do. I have thought of going back to sit another year. I am no longer young, and I fear a second silence more than I feared the first.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mace = {
      lines = {
        { id = "mace_default", text = "Because it does not cut. A blade parts what it strikes, and a mace only tells the thing to move. The shaman say that the earth shapes by pressing and never by slicing, and they would sooner carry a weapon that works as the earth does. The Warchief's own weapon is a hammer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = {
        { id = "shop_default", text = "Shoma sells the swords and axes, and he is a merchant to his bones, loud and fair. Zendo'jian sells the light blades and could talk a kodo into a pair of boots. I am the quiet corner. Between the three of us, nobody leaves the Arms of Legend with empty hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "source_default", text = "The ash and ironwood come from Ashenvale, by way of the Warsong camps, and I am told the elves resent every cut. The stone heads are quarried in Durotar. A few staves are tauren work, traded for at Thunder Bluff, and those I do not sell to anyone who is in a hurry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_default", text = "Then they have told you more than they ever told me, and I envy you without resentment. A promise it is. Take the mace with the grey stone head, on the second peg, and hold it a while. A shaman last week said it hummed, and I could not hear it." },
      },
      choices = {
        { text = "It hums, Koru. Low, like distant thunder.", next = "BACK", reply = "Does it? Then I chose rightly, even deaf to it. Thank you for telling me; you cannot know what that is worth.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    the_elements = { { id = "tp_the_elements", text = "I have sat a year in their silence. I do not think them unkind, only busy with those they have chosen." } },
    warsong = { { id = "tp_warsong", text = "They cut the wood I sell, and they are not gentle about the cutting. I ask the trees' pardon when the cart arrives, and the Warsong drivers laugh." } },
    cairne = { { id = "tp_cairne", text = "His people taught mine how to choose a living tree and leave the forest whole. We were poor students, and they were patient." } },
    thrall = { { id = "tp_thrall", text = "He carries the Doomhammer, and the storm answers it. I have never sold anything that I would set beside it." } },
    advice = { { id = "tp_advice", text = "Hold it a while before you buy. If it is yours, you will know, and if you do not know, it is not." } },
    _none = { { id = "tp_none", text = "I have no knowledge of that, and the spirits have never whispered it to me, as you may imagine." } },
  },
}

---------------------------------------------------------------------------
-- Shoma: orc weapon vendor, Arms of Legend, Valley of Honor; swords and axes.
---------------------------------------------------------------------------
P:NPC {
  key = "shoma", id = TODO_NPC("Shoma"), name = "Shoma", title = "Weapon Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "loud", "jovial" }, values = { "proud", "trade" },
  notices = { "class", "race" },
  impression = {
    first = "Shoma sells swords and axes at the Arms of Legend in the Valley of Honor, and sells them at the top of his voice. He believes in heavy steel and in the Horde, and sees little difference between the two.",
    third = "{name} met Shoma, the loud and cheerful seller of heavy steel at Orgrimmar's Arms of Legend.",
  },
  greetings = {
    { id = "g_default", text = "Hah! Come in, come in, and feast your eyes! That's Orgrimmar steel on every peg, friend, and there's none better between here and the sea." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I knew it. Nobody looks at my great axe the way you did and then stays away." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior! Now we can talk properly. Get that toy off your back and pick up something with some Horde in it." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Those are good thick wrists, the wrists of someone who can carry real steel. Don't you let that troll talk you into a fish-knife." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with an honest face! Then you'll want an honest axe, and I've a wall of them that would make your grandfather weep for joy." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shoma, and these are the Arms of Legend! I sell swords and axes, the weapons that made the Horde feared across two worlds. Koru has his sticks and Zendo'jian has his needles, and you may see them afterward if you've any coin left." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "I'm Shoma, and you're a warrior, so I'll not insult you with the small stuff. Come to the back wall. Everything on it wants two hands and a strong back, and it'll go through a shield like a boot through a melon." },
        { id = "h_small", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "I'm Shoma! You'll not be wanting an axe, I think, unless it's to prop a door. Koru has staves for your sort. But stand and admire a while, there's no charge for it." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, I like a customer with a voice!" },
        { id = "h_again2", text = "Go on, friend, ask me anything at all." },
        { id = "h_again3", text = "Ask! I've an answer for everything and an axe for most of it." },
      },
      choices = {
        { text = "Show me your steel, Shoma.", next = "BUSINESS" },
        { text = "Why \"Arms of Legend\"?", next = "legend" },
        { text = "Zendo'jian says light weapons keep a fighter alive.", next = "troll" },
        { text = "What's the finest weapon on your wall?", next = "finest" },
        { text = "Who forges what you sell?", next = "smiths" },
        { text = "I need a weapon that will end a fight in one blow.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Strength and honor, Shoma.", next = "END" },
      },
    },
    legend = {
      lines = {
        { id = "legend_default", text = "Because that's what they are! An orc with an axe is the oldest story our people have. We'd lost everything else, the spirits and our homeland and our pride, and we still had that. When the Warchief raised this city, I said I'd sell the one thing we'd never forgotten how to use." },
      },
      choices = {
        { text = "You fought with one yourself?", next = "legend2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legend2 = {
      lines = {
        { id = "legend2_default", text = "In the Second War, from the first landing to the last retreat. I carried a double-headed axe that my uncle had carried before me. It went through the gates of two human cities in my hands. I'll not pretend I'm ashamed of that, friend, whatever's said these days." },
      },
      choices = {
        { text = "Many would say that war was a mistake.", next = "legend3" },
        { text = "Something else, Shoma.", next = "BACK" },
      },
    },
    legend3 = {
      big = true,
      lines = {
        { id = "legend3_default", text = "The Warchief says it, and I follow him. We were demon-led, and I know it now. But I was eighteen, friend, with my uncle's axe, and the humans ran from us. I've never since felt as strong. Koru tells me there's no honor in a strength that was borrowed from demons." },
      },
      choices = {
        { text = "The cause was foul, but your courage was your own.", next = "BACK", reply = "That's it! That's what I can never get said properly. The courage was mine, and I'll keep that much, and the rest they can have.", fx = { align = { honor = -1 } } },
        { text = "Koru's right. Strength the demons lent was never yours.", next = "BACK", reply = "Hah. Well. He says it quieter than you, and it lands as hard. I'll go on selling axes, friend, and I'll try to sell them to better causes.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "troll_default", text = "He would say so! Zendo'jian's a good sort and he's kept my accounts straight for me more than once. But he fought murlocs on a beach, and I fought knights in a line. Against a shield wall, friend, you want weight. We'll never agree, and the customers enjoy the shouting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    finest = {
      lines = {
        { id = "finest_default", text = "The great axe on the top peg, the one with the wolf's head worked into the cheek. It came off Borgosh Corebender's anvil, and he let it go only because he said it wasn't the hammer he's looking for. I've refused three offers. I'm waiting for the right pair of hands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_default", text = "All of them from this valley, and I'll not stock anything else. Borgosh and Kelgruk for the fine pieces, and Saru's students for the plain. Goblin steel's cheaper, I know it, and it rings wrong. Hold one of each and you'll hear it yourself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = {
        { id = "warrior_default", text = "Then you want the two-handed axe with the long beard, there on the left. It's slow, I'll not lie to you, and you'll get one swing. But whoever's under that swing won't trouble you for a second, and neither will the friend standing behind him." },
      },
      choices = {
        { text = "One swing is all I ask for.", next = "BACK", reply = "Hah! Spoken like an orc, whatever you are. Lift it down and feel what your grandfathers felt.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_second_war", text = "We nearly won it, and I'm glad now that we didn't. It took me twenty years to be able to say both halves of that." } },
    internment = { { id = "tp_internment", text = "I'd no axe for years. They took my uncle's from me at Blackrock Mountain, and I've looked for it on every merchant's cart since." } },
    thrall = { { id = "tp_thrall", text = "He put a weapon back in our hands and a reason behind it. I had the first without the second once, and I know the difference." } },
    trade = { { id = "tp_trade", text = "Axes sell themselves, friend. Swords need a little talking, and I've plenty of that." } },
    advice = { { id = "tp_advice", text = "Buy the heaviest thing you can swing all day, and not an ounce more." } },
    _none = { { id = "tp_none", text = "Hah, you've got me there, friend. If it hasn't an edge on it, I've never paid it much mind." } },
  },
}

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
P:NPC {
  key = "borstan", id = TODO_NPC("Borstan"), name = "Borstan", title = "Meat Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "hearty", "proud" }, values = { "hospitality", "craft" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Borstan smokes and sells meat at his firepit in the Drag, and speaks of himself by name when he is pleased with his cooking. He wants Orgrimmar to eat grandly, and takes a thin child as a personal insult.",
    third = "{name} met Borstan, the proud old smoker who feeds the Drag from his firepit in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Come in close to the pit, friend, and breathe deep. That's hog belly on the high rack, and it's been in the smoke since before the sun was up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Nobody eats at Borstan's only once, and I've been saying so since the day I lit this pit." },
    { id = "g_meal", when = { questActive = TODO_QUEST("Meal Appeal") }, text = "You've the look of someone sent on an errand, and Thatog's mentioned his boy to me often enough. Come round the pit, then, and tell me what the father said." },
    { id = "g_food", when = { questActive = TODO_QUEST("Favorite Food") }, text = "That lunch is going cold while you stand there! Migi plays out behind Grommash Hold, so go quickly, and put it into the boy's own hands." },
  },
  notice = {
    { id = "n_thin", cat = "hunger", when = { maxLevel = 10 },
      text = "You're all elbows, young one. Nobody leaves my pit looking like that, so buy something with fat on it and eat it where I can watch." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You've a cook's burn across the knuckles, the kind you get from reaching over a pan. Then you'll understand why I'll not tell you what's in the rub." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Borstan, and this is my firepit. Zamja teaches the cooking and the troll Xen'to sells the spice, and I do the smoking, which is the part that takes patience. Everything on these racks was walking about in Durotar three days ago." },
        { id = "h_meal", tags = { "news" }, when = { questActive = TODO_QUEST("Meal Appeal") }, text = "So Thatog's boy skips his midday meal for a game of wolves and grunts. I've watched that child run past my pit all season without once slowing down. Leave it with Borstan. I've an idea that works on small orcs every time." },
        { id = "h_food", tags = { "news" }, when = { questActive = TODO_QUEST("Favorite Food") }, text = "There's Migi's lunch, wrapped and hot. I've crumbled the crisp ends of the sweetglazed hog belly over the top, and no child born has ever walked away from that. Carry it to him yourself, behind Grommash Hold." },
        { id = "h_fooddone", when = { questDone = TODO_QUEST("Favorite Food") }, text = "The boy comes every day now, and brings his friends, and they stop their game to eat it together! I've had to put a second belly in the smoke each morning. Borstan thanks you, and so does Thatog, in his gruff way." },
        { id = "h_tastes", when = { questBefore = TODO_QUEST("Changing Tastes"), minLevel = 22 }, text = "Zamja tells me we need more home cooking on the racks, and she wants me to sell raptor. Her idea's a fair one. But I want something grander than the smell of the old villages, and a hunter has just come back from the Wetlands with a talon as long as my hand." },
        { id = "h_tastesactive", tags = { "news" }, when = { questActive = TODO_QUEST("Changing Tastes") }, text = "Have you my raptor? The thicket raptors, mind, from the dig sites in the Wetlands, and four good cuts of it. I've the spice ground and the pit banked low, and I've nothing to put over it." },
        { id = "h_tastesdone", when = { questDone = TODO_QUEST("Changing Tastes") }, text = "Twice-spiced raptor, and they're queuing down the Drag for it! Zamja says it was her idea, and it was, and I've told her she may have the credit so long as I have the recipe." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The pit wants turning, but not yet." },
        { id = "h_again2", text = "Go on and ask, I can talk and baste at once." },
        { id = "h_again3", text = "Ask away, and have a rib while you think." },
      },
      choices = {
        { text = "Show me what's on the racks, Borstan.", next = "BUSINESS" },
        { text = "What makes your smoke better than another's?", next = "smoke" },
        { text = "You want Orgrimmar to eat grandly.", next = "grand" },
        { text = "Who eats at Borstan's?", next = "eaters" },
        { text = "Xen'to has been putting pepper in your rub.", next = "pepper" },
        { text = "What would you have me bring from the Wetlands?", next = "raptor", when = { questActive = TODO_QUEST("Changing Tastes") } },
        { text = "I cook. What should I learn first?", next = "cook", when = { profession = "Cooking" } },
        { text = "Keep the pit burning, Borstan.", next = "END" },
      },
    },
    smoke = {
      lines = {
        { id = "smoke_default", text = "Time, and the wood. Any fool can burn a boar. I bank the pit with dry thornwood from the canyon rim and leave the meat a full day and a night, and I get up twice in the dark to turn it. Nobody else in this city will lose sleep over a hog." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grand = {
      lines = {
        { id = "grand_default", text = "I do, and I'll tell you why. We ate gruel for years, friend, grey gruel out of one pot, and we were grateful when there was enough of it. Now we've a city of our own. I'll not have the orcs who built it eating as though they were still behind a fence." },
      },
      choices = {
        { text = "You were in the camps yourself.", next = "grand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grand2 = {
      lines = {
        { id = "grand2_default", text = "I cooked in one. The humans gave us a sack of meal a day for two hundred, and I was the one who stretched it. I learned to make nothing taste like something. I also learned what it does to a people to eat without pleasure, year upon year." },
      },
      choices = {
        { text = "What does it do to them?", next = "grand3" },
        { text = "Something else, Borstan.", next = "BACK" },
      },
    },
    grand3 = {
      big = true,
      narr = "He lifts the lid of the pit and lets the smoke roll up between you before he answers.",
      lines = {
        { id = "grand3_default", text = "It makes them small. An orc who's given up on supper has given up on a good deal else. So I cook rich and I cook proud, and Zamja scolds me for it. She says plain food honestly made is what a people needs, and that all my glaze is only vanity." },
      },
      choices = {
        { text = "Feed them proudly. A feast tells a people they are free.", next = "BACK", reply = "That's Borstan's creed, word for word! Sit down, friend. You've earned the end cut, and I give that to nobody.", fx = { align = { order = -1 } } },
        { text = "Zamja's right. Plain, honest food is enough.", next = "BACK", reply = "Hah, she'll be unbearable when she hears a stranger said so. And she's not wrong, friend. I only think we've had our fill of \"enough.\"", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters = {
      lines = {
        { id = "eaters_default", text = "Everyone on the Drag, sooner or later. The smiths' apprentices come at a run, and the engineers come with black hands. Thatog buys chops for the armory, and now his boy comes with half the children of the city behind him. I know what each of them likes, and I pretend I don't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pepper = {
      lines = {
        { id = "pepper_default", text = "He thinks I haven't noticed! A little more each season, for three years now. I let him do it, friend, because the rub's better for it, and because it pleases him so much to think he's fooling the old smoker. Don't you tell him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    raptor = {
      lines = {
        { id = "raptor_default", text = "Thicket raptor meat, four cuts of it, from the beasts that stalk the excavation sites in the Wetlands. It's a long road, across the sea and up through the marsh. Take the haunch if you can, and wrap it in something wet, or it will have turned before you're halfway home." },
      },
      choices = {
        { text = "I'll bring it wrapped and whole.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_default", text = "Fire, before anything else. Learn what your fire is doing without looking at it, by the sound and by the heat on your face. A cook who can hold a low fire steady for a night can make a feast of an old boot. Zamja will teach you the rest, and faster than I would." },
      },
      choices = {
        { text = "I'll learn the fire first.", next = "BACK", reply = "Good! Then come back, and I'll let you turn the pit one night. I'll not pay you, mind, but you'll eat.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "A sack of meal for two hundred, and I stretched it. I still can't throw away a crust." } },
    camping = { { id = "tp_camping", text = "A traveler should carry smoked meat, since it keeps for a month and asks nothing of you but teeth." } },
    thrall = { { id = "tp_thrall", text = "He's eaten at this pit, standing up, like any grunt. He asked for the plain rib, and I gave him the glazed one anyway." } },
    trade = { { id = "tp_trade", text = "Boar's cheap and always will be. It's the wood that costs me, hauled down from the rim." } },
    advice = { { id = "tp_advice", text = "Eat at midday, whatever you're doing. A hungry fighter makes poor choices." } },
    _none = { { id = "tp_none", text = "I've never smoked it or served it, friend, so I've nothing worth saying about it." } },
  },
}

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
P:NPC {
  key = "magenius", id = TODO_NPC("Magenius"), name = "Magenius", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "fussy", "proud" }, values = { "learned", "curious" },
  notices = { "arcane", "class" },
  impression = {
    first = "Magenius sells reagents beside Asoran's market, and chose his own grand name from a word in a human book. He would rather have been a scholar, and lectures every caster who stops for a pouch of powder.",
    third = "{name} met Magenius, a self-named orc reagent seller in Orgrimmar who wishes he were a scholar.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a customer, and perhaps a thinking one. Approach, and tell me what working you intend, so that I may advise you on its proper components." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I trust you found that my counsel regarding the powder was correct, as I was confident it would be." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A practitioner of the arcane! Now this is a pleasure. I have several questions concerning the theory of conjuration, if you can spare the time." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You carry your runes loose in a pocket, where they may chip against one another. I have read that a chipped rune will send a traveler somewhere quite unintended." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You will have no need of my wares, though I would gladly explain to you what each of them does, should you ever feel the lack of that knowledge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Magenius, purveyor of reagents and student of the higher arts. I keep my stall beside Asoran's market, where the petitioners to Grommash Hold pass by, in the hope that some of them will wish to discuss theory. Few of them do." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "I am Magenius. You work with forces that I have only read of, and I envy you more than is dignified. Buy what you need, and then, if you are willing, tell me how it truly feels to cast." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Magenius. Yes, I know that it is no orc name, and you need not raise your brow. I chose it from a book, and I have answered to nothing else for nine years." },
      },
      again = {
        { id = "h_again", text = "Have you another question? I do most sincerely hope so." },
        { id = "h_again2", text = "Proceed, please. I have a great deal of time." },
        { id = "h_again3", text = "Ask, and I shall answer as fully as I am able." },
      },
      choices = {
        { text = "Show me your reagents, Magenius.", next = "BUSINESS" },
        { text = "Where did an orc find a name like Magenius?", next = "name" },
        { text = "You'd rather be a scholar than a merchant.", next = "scholar" },
        { text = "What is Asoran like, as a neighbor?", next = "asoran" },
        { text = "What do you read?", next = "read" },
        { text = "Shall I tell you how casting feels?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Good day to you, Magenius.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "name_default", text = "From a human primer on the arcane, which I took from a guard's hut in the camps. I could not read it then. I taught myself from that one book, letter by letter, and \"magus\" and \"genius\" were among the first words I understood. I put them together, and thought it very fine." },
      },
      choices = {
        { text = "You taught yourself to read, in the camps?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = {
        { id = "name2_default", text = "Over three years, by firelight, and in secret from the guards and from my own people alike. An orc who read human letters was thought to have gone over to them. My bunkmates found the book in my bedding one night, and I was certain they would burn it." },
      },
      choices = {
        { text = "What did they do?", next = "name3" },
        { text = "Something else, Magenius.", next = "BACK" },
      },
    },
    name3 = {
      big = true,
      lines = {
        { id = "name3_default", text = "They asked me to read it to them. Forty orcs sat round in the dark and listened to a child's lesson on conjuring water. None of us could do it, of course. But for an hour we were somewhere else. Asoran tells me I ought to take an orc name now and leave that human book behind me." },
      },
      choices = {
        { text = "Keep the name. You earned it letter by letter.", next = "BACK", reply = "I believe that I did. I am glad to hear it from someone who did not laugh first, as most do.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Asoran's right. An orc should carry an orc's name.", next = "BACK", reply = "So the elders say also. But I had no name worth keeping before the book, and I have found I cannot go back to being nobody.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scholar = {
      lines = {
        { id = "scholar_default", text = "I would, and I have no gift for it. I applied to the mages in the Valley of Spirits, and the troll Deino was kind enough to test me. She said that I had read more than any of her students, and that I had no more talent than a brick. I sell them their reagents now." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    asoran = {
      lines = {
        { id = "asoran_default", text = "He is a sensible orc, and he considers me a fool, which I bear with patience. He sells rope and waterskins to those who wait on the Warchief, and I sell powders to the few among them who cast. In the slow hours I read aloud to him, and he pretends not to listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    read = {
      lines = {
        { id = "read_default", text = "Whatever reaches me, which is very little. I have the primer still. A Forsaken sold me half a treatise on wards, and I have read it some forty times. Deino lends me a book now and then, damp ones mostly, and I return each of them with notes in the margin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = {
        { id = "caster_default", text = "I would be more grateful than I can properly say. I have read eleven descriptions, and they contradict one another entirely. Is there warmth? Does it come from within or from without? Please speak slowly, as I should like to write this down." },
      },
      choices = {
        { text = "It comes from without, and you only give it a shape.", next = "BACK", reply = "From without, and one gives it shape! Then the primer was right, and the treatise was wrong. Oh, I must tell Deino. Thank you; you have settled a nine-year question.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "The city where my primer was printed. I am told that it is a ruin now, and I mourned it, which my bunkmates never understood." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "They wrote the book that taught me to read. I owe my name to an enemy's schoolmasters, and I do not find that simple." } },
    forsaken = { { id = "tp_forsaken", text = "They sell me books, and do not ask why an orc wants them. I find them the most civil customers I have." } },
    internment = { { id = "tp_internment", text = "I learned my letters there. It is a strange debt to carry." } },
    advice = { { id = "tp_advice", text = "Read the label twice before you open the jar. I say this from experience that I would rather not describe." } },
    _none = { { id = "tp_none", text = "I regret that I have read nothing on that subject, and I would not presume to speculate." } },
  },
}

---------------------------------------------------------------------------
-- Asoran: orc general goods vendor at Asoran's Market, Valley of Wisdom; sells to those who wait on the Warchief.
---------------------------------------------------------------------------
P:NPC {
  key = "asoran", id = TODO_NPC("Asoran"), name = "Asoran", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "steady", "dry" }, values = { "practical", "community" },
  notices = { "purse", "class" },
  impression = {
    first = "Asoran keeps a general goods market near Grommash Hold and sells mostly to those waiting for an audience with the Warchief. He has watched a great many petitioners, and guesses their business from what they buy.",
    third = "{name} met Asoran, who keeps a market near Grommash Hold and reads petitioners by their purchases.",
  },
  greetings = {
    { id = "g_default", text = "Asoran's Market. If you're waiting on the Warchief, you'll be here a while, so you had best buy water." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. They've kept you waiting again, or else you've found that you like my prices." },
    { id = "g_hold", when = { minLevel = 40 }, text = "You walk like someone the Warchief sends for, and not like one who has to ask. Then you'll not be long in the valley, and I'll be quick." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You've barely the coin for a waterskin. Take the plain one, then. It holds water as well as the dear one does." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want arrows or shot before anything else, and they're in the bin by the post." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Asoran. I sell the plain things, rope and torches and waterskins, to whoever's standing about in this valley. Most of them are waiting to be heard at Grommash Hold, and waiting is thirsty work." },
        { id = "h_veteran", when = { minLevel = 40 }, text = "I'm Asoran. You've the look of someone who is sent for, so I'll not offer you a stool. Tell me what you need for the road and I'll have it bundled before you've finished." },
        { id = "h_young", when = { maxLevel = 15 }, text = "I'm Asoran. If you've come to see the Warchief, young one, be ready to wait, and don't take it as a slight. He sees everyone in the end, which is why it takes so long." },
      },
      again = {
        { id = "h_again", text = "What else do you need?" },
        { id = "h_again2", text = "Go on and ask, there's no queue behind you." },
        { id = "h_again3", text = "Ask it. I've been standing here all day in any case." },
      },
      choices = {
        { text = "Show me your goods, Asoran.", next = "BUSINESS" },
        { text = "You must see everyone who petitions Thrall.", next = "petitioners" },
        { text = "What does a market sell, in a valley of shaman?", next = "shaman" },
        { text = "Magenius reads aloud to you, he says.", next = "magenius" },
        { text = "Who are your neighbors here?", next = "neighbours" },
        { text = "I was sent for by the Warchief. What should I know?", next = "sent", when = { minLevel = 30 } },
        { text = "Good trade to you, Asoran.", next = "END" },
      },
    },
    petitioners = {
      lines = {
        { id = "petitioners_default", text = "All of them. They come up from every corner of Kalimdor, and they wait where I can see them. I can tell their business by what they buy. Rope and oil means they're asking for help. Nothing at all means they've come to complain, since a complaint needs no supplies." },
      },
      choices = {
        { text = "What do the desperate ones buy?", next = "petitioners2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    petitioners2 = {
      lines = {
        { id = "petitioners2_default", text = "Water, and then more water, and they don't drink it. They hold the skin and stare at the door. There was a tauren last spring who stood for two days. He'd walked from the Barrens to say that his whole camp was gone, taken by centaur, and that he was all that remained of it." },
      },
      choices = {
        { text = "Did Thrall see him?", next = "petitioners3" },
        { text = "Something else, Asoran.", next = "BACK" },
      },
    },
    petitioners3 = {
      big = true,
      lines = {
        { id = "petitioners3_default", text = "On the second evening, and for a long while. A warband rode out before dawn. But it was two days, friend. I took him bread on the first night and said nothing, and I've asked myself since if I should have gone up the steps and told the guards to move him to the front." },
      },
      choices = {
        { text = "You should have spoken. Two days may have cost lives.", next = "BACK", reply = "I think so too, most nights. I was a merchant minding his stall, and I let that be my excuse. I'd go up those steps now.", fx = { align = { honor = 1 } } },
        { text = "It wasn't your place. The Hold has its order for a reason.", next = "BACK", reply = "That's what I told myself at the time. It's true, and it sat badly, and it still does. But I thank you for saying it kindly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_default", text = "What anyone needs. A shaman eats and sleeps and loses his flint like any other orc. Searn Firewarder buys lamp oil from me by the cask, though he could light a room with a word. He says the fire spirits are not servants, and that oil is cheaper than their good opinion." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    magenius = {
      lines = {
        { id = "magenius_default", text = "He does, whether I ask for it or not. It's a human book about making water out of the air, and I must have heard it thirty times. He's a fool about his name and no fool at all otherwise. I've learned a good many human words from him, and I've not told him so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_default", text = "Grommash Hold, which makes for a quiet street. Zor Lonetree and the far seers are up the way, with the shaman trainers. The children play at wolves and grunts behind the Hold, and Thatog's boy is forever running through my stall. I give him a dried apple to go round." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = {
        { id = "sent_default", text = "Then you'll go straight in. Speak plainly and don't dress it up, since he's heard every kind of flattery and it only makes him tired. Nazgrel stands at his shoulder and will look at you as though you were a spy. Pay it no mind. He looks at me the same way, and I sell him his bootlaces." },
      },
      choices = {
        { text = "Plain speech, and I'll ignore the glare.", next = "BACK", reply = "That's all you need. You'll do well in there. Come and tell me afterward what it was about, if you're able to.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "He sees everyone in the end. I've watched that door for six years, and I've never seen him turn away a petitioner he could have heard." } },
    centaur = { { id = "tp_centaur", text = "Half the petitioners from the Barrens are here on their account. I can tell before they open their mouths." } },
    cairne = { { id = "tp_cairne", text = "His people wait better than ours do. A tauren will stand two days without a word of complaint, and I'm not certain that's a virtue." } },
    trade = { { id = "tp_trade", text = "Rope, oil, water. It never changes, and I've stopped wishing it would." } },
    advice = { { id = "tp_advice", text = "If you're going to wait, bring water. If you're going to speak, be brief." } },
    _none = { { id = "tp_none", text = "Nobody waiting here has mentioned it, and that's where I get most of what I know." } },
  },
}

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
---------------------------------------------------------------------------
P:NPC {
  key = "xantish", id = TODO_NPC("Xan'tish"), name = "Xan'tish", title = "Snake Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "sly", "cheerful" }, values = { "nature", "brave" },
  notices = { "race", "pet" },
  impression = {
    first = "Xan'tish walks the Valley of Spirits with baskets of snakes he caught and gentled himself. He handles them with easy affection, and enjoys watching orcs take a step backward.",
    third = "{name} met Xan'tish, a cheerful Darkspear who sells snakes in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_default", text = "Do not step back, mon! Dey can tell when you be afraid, and it hurts deir feelings." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. And you came closer dis time, I see. Dat be progress, mon." },
    { id = "g_troll", when = { race = "Troll" }, text = "Cousin! Come and say hello to de little ones. Dey have missed de sound of a proper troll voice." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You be standin' very stiff, mon. Every orc does. You will face a doomguard and den flinch at somethin' de length of your arm." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} back a pace, if you please. My snakes be calm, but dey do not care to be sniffed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Xan'tish. I track snakes in de wild, I catch dem with my own two hands, and I gentle dem until dey will ride on a shoulder. Den I find each one a friend. Dere be no braver work in dis valley, mon, and I say so myself." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Xan'tish, cousin. You know what a snake means to our people. De orcs think I sell worms in a basket, so it be good to speak with someone who understands." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I be Xan'tish. You be a hunter, so you will want to know how I catch dem without a mark on dem. I will tell you, mon, but you will not like how close you have to get." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De snakes be listenin' too." },
        { id = "h_again2", text = "Go on and ask, I be only untanglin' dis one." },
        { id = "h_again3", text = "Ask, mon, and stand a little closer when you do." },
      },
      choices = {
        { text = "Show me your snakes, Xan'tish.", next = "BUSINESS" },
        { text = "How do you catch a snake without harming it?", next = "catch" },
        { text = "What does a snake mean to the Darkspear?", next = "meaning" },
        { text = "Why sell them in an orc city?", next = "orcs" },
        { text = "Have you ever been bitten?", next = "bitten" },
        { text = "I've tamed beasts myself. Is a snake so different?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll stand closer next time, Xan'tish.", next = "END" },
      },
    },
    catch = {
      lines = {
        { id = "catch_default", text = "Slowly, mon, and with a warm hand. You find where it suns itself, and you sit near it every day, a little nearer each time. After a week it does not mind you. After two you can lift it. De ones who grab get bitten, and dey deserve it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    meaning = {
      lines = {
        { id = "meaning_default", text = "Many things. De snake sheds its skin and goes on, and dat be how de Darkspear see ourselves. We lost one home and den another, and each time we left de old skin behind us. Dere be loa who wear de snake's shape, too, though I will not name dem in a market." },
      },
      choices = {
        { text = "Is that why you chose this work?", next = "meaning2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meaning2 = {
      lines = {
        { id = "meaning2_default", text = "It chose me, mon. When we fled de islands, I was a boy, and I had a little green snake in my shirt dat I would not leave. My father said to throw it in de sea, because dere was no room in de boat for pets. I hid it under my arm for de whole crossin'." },
      },
      choices = {
        { text = "Did your father find out?", next = "meaning3" },
        { text = "Something else, Xan'tish.", next = "BACK" },
      },
    },
    meaning3 = {
      big = true,
      lines = {
        { id = "meaning3_default", text = "On de second day, when it put its head out of my collar. He was angry. He said every mouthful in dat boat belonged to a troll. But I had been givin' it half my own share. He looked at me a long time, and den he said nothin' more about it." },
      },
      choices = {
        { text = "You were right. Loyalty to a small thing is still loyalty.", next = "BACK", reply = "Dat be what I think he saw, mon. Dat snake lived eleven years in Durotar, and my father fed it himself when I was away.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your father was right. People come before pets.", next = "BACK", reply = "He was, mon, and I knew it even den. Dat be why I gave it only from my own share. I think dat be de only reason he let it live.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = {
        { id = "orcs_default", text = "Because dey need it, mon! An orc be afraid of nothin' he can hit, and a snake you cannot hit, it be too quick. So he learns somethin' new about himself. I have sold snakes to three grunts dis year, and each one walks taller now dat he has made a friend of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bitten = {
      lines = {
        { id = "bitten_default", text = "Forty times, maybe more. Look, here, and here, and dis one on de thumb. None of mine be deadly, I see to dat, but dey still have teeth. Kor'ghan down in de Cleft says I be half venom by now. He would know, mon, he be worse dan I am." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_default", text = "Very different. A wolf wants a leader, and a cat wants respect. A snake wants only to be warm and not surprised. You cannot command it. You can only be a place it likes to be, and I find dat de best hunters understand dis faster dan anyone." },
      },
      choices = {
        { text = "Be a place it likes to be. I can do that.", next = "BACK", reply = "Den you may hold one, mon, dis brown one here, if you take her slowly. Dere, you see how she settles? She likes you already.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo_isles", text = "De best snakes in de world lived dere, green as new leaves. Zalazane's fools have likely eaten dem all." } },
    darkspear = { { id = "tp_darkspear", text = "We shed de old skin and go on, mon. Dat be de whole history of de tribe." } },
    voljin = { { id = "tp_voljin", text = "He has never flinched from one of mine. A shadow hunter knows what walks in a snake's shape." } },
    wailing_caverns = { { id = "tp_wailing_caverns", text = "Dere be serpents in dat place grown far too big, and druids who worship dem. I love snakes, mon, and I would still not go in." } },
    advice = { { id = "tp_advice", text = "Move slowly and keep your hands warm. It works on snakes, and on most people." } },
    _none = { { id = "tp_none", text = "I do not know dat, mon. If it has legs, I likely never looked at it closely." } },
  },
}

