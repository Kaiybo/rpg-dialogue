-- Trade District people with no quests and no gossip worth the name: the bank, the
-- auction house, the guild registry, Weller's Arsenal and Pestle's Apothecary.
-- Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Olivia Burnside: banker, proud of the vault's record, and a little too insistent about it.
P:NPC {
  key = "olivia_burnside", id = TODO_NPC("Olivia Burnside"), name = "Olivia Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "order", "proud" },
  notices = { "purse", "watch" },
  impression = {
    first = "Olivia Burnside keeps the vaults at the Bank of Stormwind and told me twice that nothing has ever been stolen from them. The second time she sounded as if she were reassuring herself.",
    third = "{name} met Olivia Burnside, a banker of Stormwind who is very proud of her vaults.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Bank of Stormwind. Your valuables are safer here than anywhere else in the kingdom, and I mean that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your box is exactly where you left it, as it always will be." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } }, place = "before",
      text = "Goodness, that's a great deal of coin to be carrying about the Trade District. Do let us look after some of it before a cutpurse does." },
    { id = "n_rogue", cat = "watch", when = { class = "ROGUE" }, place = "before",
      text = "You'll forgive me if I keep my eyes on your hands while we talk. It's nothing personal; I do it with everyone who walks the way you do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Olivia Burnside, at your service. We keep accounts and safe deposit boxes, and no one has ever stolen a thing out of this bank, not in its whole history." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Ah, a dwarf! You'll want to see our vaults, I expect, and compare them with Ironforge's. I promise ours will stand the comparison." },
      },
      again = {
        { id = "h_again", text = "Is there something more the Bank of Stormwind can do for you?" },
        { id = "h_again2", text = "Please, ask whatever you like. The queue can wait a moment." },
      },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Nothing has ever been stolen, not even once?", next = "thief" },
        { text = "Who keeps their money here?", next = "who" },
        { text = "Good day, Olivia.", next = "END" },
      },
    },
    thief = {
      lines = { { id = "t_default", text = "Not once! Well, there was a fellow last winter who tried the cellar door, but he never got past the first lock, so that doesn't count. The guards walk past every hour, and the vault doors were forged in Ironforge." } },
      choices = {
        { text = "What happened to the fellow?", next = "thief2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thief2 = {
      lines = { { id = "t2_default", text = "The guards took him to the Stockade, and I'm told he's still there with the Defias who were thrown in after him. I don't like to think about it, if I'm honest; I'd rather think about the locks." } },
      choices = {
        { text = "Good. A thief belongs behind bars.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Desperate people try desperate things. Hard to blame him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Merchants, nobles, soldiers home on leave, and more adventurers every week. The nobles keep the largest boxes, and they visit the least, which I've always found rather curious." } },
      choices = {
        { text = "Do the stonemasons keep money here?", next = "masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masons = {
      lines = { { id = "m_default", text = "Some did, before the trouble over their wages, and then they came in one by one and closed their accounts. It's not my place to say who owed them what, so I don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've worked these counters since the city was rebuilt, and my family has kept the ledgers longer than that." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't something we keep on record here." } },
  },
}

-- Newton Burnside: the dry one, who reads people by what they deposit.
P:NPC {
  key = "newton_burnside", id = TODO_NPC("Newton Burnside"), name = "Newton Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "dry" }, values = { "order", "discreet" },
  notices = { "purse", "trophy" },
  impression = {
    first = "Newton Burnside says the bank sees more of the kingdom than the king does, because everyone sooner or later comes to put something away. He was polite, precise and quietly amused by all of it.",
    third = "{name} met Newton Burnside, a dry and observant banker of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Is it a deposit or a withdrawal? I can usually tell, but I've been wrong once or twice." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Let me guess: something heavier going in than coming out." },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } }, place = "before",
      text = "You'll not need a large box, I think, and there's no shame in that. Most fortunes in this city began with a small one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Newton Burnside. I keep boxes and accounts for half the Trade District, and I've learned that what people put away tells you more about them than anything they say across a counter." },
        { id = "h_lowlevel", when = { maxLevel = 15 }, text = "A new face, and a young one. Most of our new customers start with a few spare linen shirts and a sword they've outgrown, so don't be shy about what you bring." },
      },
      again = {
        { id = "h_again", text = "Something else? I have time, and the ledger certainly isn't going anywhere." },
        { id = "h_again2", text = "Ask away. I'll answer what a banker can." },
      },
      choices = {
        { text = "Open my box, please.", next = "BUSINESS" },
        { text = "So what do people put away?", next = "boxes" },
        { text = "What does my box say about me?", next = "mine" },
        { text = "Good day, Newton.", next = "END" },
      },
    },
    boxes = {
      lines = { { id = "b_default", text = "Soldiers leave letters home and their good boots, merchants leave coin, and adventurers leave the oddest things: a tusk, a stone that hums, a lock of somebody's hair. I don't ask, and they don't tell me." } },
      choices = {
        { text = "Don't you ever wonder?", next = "boxes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boxes2 = {
      lines = { { id = "b2_default", text = "Every day, but a banker who asks questions soon has no customers. What a person keeps is their own business, so long as it doesn't start whispering at night." } },
      choices = {
        { text = "Quite right, some things should stay private.", next = "BACK", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "If it were dangerous, I'd want somebody to look.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mi_default", text = "That you come back alive, which is more than I can say for some. The ones who stop coming are the reason we keep the boxes sealed for a year before anyone may claim them." },
        { id = "mi_priest", when = { class = "PRIEST" }, text = "That you keep more cloth than coin, which is common among the Cathedral's people. You'd be surprised how many priests store a spare set of vestments and nothing else." },
      },
      choices = {
        { text = "What happens after the year?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "The family may claim it if they can prove themselves, and if no one comes, it goes to the crown. I'd rather it went to the families, but nobody asked my opinion when the law was written." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Burnside, like the others behind these windows. We've counted Stormwind's coin for generations, and I expect we'll go on counting it." } },
    _none = { { id = "tp_none", text = "No ledger of mine records that, and a banker who guesses soon loses his post." } },
  },
}

-- John Burnside: first window on the right, so he greets everyone first; cheerful and young.
P:NPC {
  key = "john_burnside", id = TODO_NPC("John Burnside"), name = "John Burnside", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "community", "order" },
  notices = { "kin", "travel" },
  impression = {
    first = "John Burnside has the first window inside the bank's door, so he greets everyone who comes in, and he seems to genuinely enjoy it. He wanted to know where I'd been more than what I'd brought.",
    third = "{name} met John Burnside, the cheerful banker at the first window of the Bank of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Good day, and welcome in! First window on the right, which is me, and I'm free." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Where's the road taken you since I last saw you?" },
  },
  notice = {
    { id = "n_human", cat = "kin", when = { race = "Human" }, place = "before",
      text = "Stormwind born, are you? Then you'll know my family's name from the old bank, before the orcs burned it down with everything else." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "John Burnside. I've the first window, so I see everyone before my kin do, and I like to think I give the city a friendly face when they've only come to count their coin." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! We've had a few of your people in since Gnomeregan, and every one of them has asked to see how the locks work. I'm not allowed to show you, I'm sorry to say." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The others can wait." },
        { id = "h_again2", text = "Go on, I like the talk better than the counting." },
      },
      choices = {
        { text = "Just my box, John.", next = "BUSINESS" },
        { text = "The orcs burned the old bank?", next = "old" },
        { text = "Who comes in through that door?", next = "door" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "When the Horde sacked the city, yes. My grandfather carried the ledgers out in a handcart, and that's how we knew whose gold was whose when the stonemasons built this place again." } },
      choices = {
        { text = "Your grandfather sounds like a brave man.", next = "old2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old2 = {
      lines = { { id = "o2_default", text = "Brave, or too stubborn to leave the books behind, which is the Burnside way. He used to say a city can be rebuilt but a debt forgotten is gone forever." } },
      choices = {
        { text = "He was right, and debts should be honored.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some debts are better forgotten, I'd say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "Everyone, sooner or later. Dwarves from the district by the gate, night elves who look at the ceiling as if it might fall on them, and lately a great many folk from Westfall with nothing much to put away at all." } },
      choices = {
        { text = "What do the Westfall folk want?", next = "westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    westfall = {
      lines = { { id = "wf_default", text = "Mostly to ask whether a farm's deed is worth anything now, and I have to tell them it's only paper while the Defias hold the land. It's the worst part of the work, and I try to say it gently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born a Burnside, raised behind a counter, and happy enough there. My grandfather saved the ledgers when the city burned, and we've kept them since." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, I wouldn't know about that. Ask me about the bank and I'm your man." } },
  },
}

-- Auctioneer Chilton: leftmost podium; a showman with a rule for everything.
P:NPC {
  key = "auctioneer_chilton", id = TODO_NPC("Auctioneer Chilton"), name = "Auctioneer Chilton", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "showy" }, values = { "trade", "order" },
  notices = { "purse", "craft" },
  impression = {
    first = "Auctioneer Chilton runs the left-hand podium of Stormwind's auction house and believes a fair sale needs rules, a deposit and a little theatre. He talked about a linen cloth as though it were a crown.",
    third = "{name} met Auctioneer Chilton, a showman of Stormwind's auction house.",
  },
  greetings = {
    { id = "g_default", text = "Buying or selling, friend? Either way, step up; the hall is open and the bidding is warm." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the hall! Did your last lot sell, or are we trying again with a better price?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking" } }, place = "before",
      text = "A crafter! Then you're the reason this hall exists, because adventurers sell us the raw stuff and folk like you turn it into something worth bidding on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Chilton, at the left podium. Leave your goods with me, set your price and your deposit, and every buyer in Stormwind will have the chance to fight over them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Your people do run a fine auction in Ironforge, but I'll wager ours is warmer, and the bidders here haven't learned to haggle as hard." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The hall never closes, but my voice does." },
        { id = "h_again2", text = "Go on, ask while the bidding's slow." },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "Why do I have to pay a deposit?", next = "deposit" },
        { text = "What sells best here?", next = "sells" },
        { text = "Good day, Chilton.", next = "END" },
      },
    },
    deposit = {
      lines = { { id = "dp_default", text = "Because without one, every rogue in the city would list a rusty dagger for a thousand gold and clog the hall for a week. The deposit keeps you honest, and you get it back if your lot sells." } },
      choices = {
        { text = "And if it doesn't sell?", next = "deposit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deposit2 = {
      lines = { { id = "dp2_default", text = "Then the hall keeps the deposit and the goods come back to you by post. It stings, I know, but a sale that doesn't happen still costs us a clerk's afternoon." } },
      choices = {
        { text = "That's fair. Rules keep the hall honest.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sounds like the hall wins either way.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "s_default", text = "Cloth, always, because every tailor in the city needs it and no tailor wants to fight a gnoll for it. After that, ore and herbs, and then anything that glows." },
        { id = "s_mage", when = { class = "MAGE" }, text = "Cloth first, and then anything that glows, which is your people's fault. Half the bids on enchanted goods come from the Mage Quarter, and they always want it yesterday." },
      },
      choices = {
        { text = "Who buys the glowing things?", next = "glow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glow = {
      lines = { { id = "gl_default", text = "Nobles, mostly, who buy them to look dangerous at dinner. Since Dalaran fell there's been precious little enchanted work coming into the city, so anything with a shine fetches twice what it's worth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I started as a clerk in this hall, carrying parcels to the post, and talked my way onto the podium. It's the best job in the city for a man who likes the sound of his own voice." } },
    _none = { { id = "tp_none", text = "Never heard of it, friend, and if it were worth anything, I would have." } },
  },
}

-- Auctioneer Fitch: middle podium; careful, quiet, a stickler for the clerk's book.
P:NPC {
  key = "auctioneer_fitch", id = TODO_NPC("Auctioneer Fitch"), name = "Auctioneer Fitch", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "precise" }, values = { "order", "honest" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Fitch keeps the middle podium and the auction house's book, and he writes every bid down in a small, careful hand. He seemed to think fraud was the greatest danger the city faced.",
    third = "{name} met Auctioneer Fitch, the careful keeper of the auction house's book.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you'll give me your name for the book, we can begin." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I have you in the book already. Welcome back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Fitch. Chilton calls the bids and Jaxon charms the buyers, and I write everything down, which is why nobody in this hall has ever been cheated on my watch." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'll note your name very carefully, if you don't mind. It isn't an accusation; it's simply that the book has a long memory and I'd like you to know that." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I'd like to finish this page before the ink dries." },
        { id = "h_again2", text = "Go on, I'm listening, though I'll keep writing." },
      },
      choices = {
        { text = "Show me what's up for auction.", next = "BUSINESS" },
        { text = "Has anyone tried to cheat the hall?", next = "cheat" },
        { text = "Why keep such a careful book?", next = "book" },
        { text = "Thank you, Fitch.", next = "END" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "Every month someone tries to sell a painted copper ring as gold, or bid with a name that isn't theirs. The book catches them, because a swindler can change his face but not his handwriting." } },
      choices = {
        { text = "What happens to them?", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      lines = { { id = "c2_default", text = "They are barred from the hall and their names go to the guard, and in a city this size, word gets round. A merchant who can't sell in Stormwind soon has to try his luck in Booty Bay." } },
      choices = {
        { text = "Good. Cheats deserve no second chance.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Everyone deserves a second chance, even a swindler.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = { { id = "b_default", text = "Because coin is only trust that clinks, and trust needs a record. If every buyer knows the book is honest, they'll bid, and if they bid, the whole Trade District eats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a scribe in the House of Nobles once, copying deeds, and I left because I preferred honest bidding to what I saw written there." } },
    _none = { { id = "tp_none", text = "I have nothing written on that, I'm afraid, and I don't repeat what isn't written." } },
  },
}

-- Auctioneer Jaxon: right podium; warm, practical, a mother who knows every regular.
P:NPC {
  key = "auctioneer_jaxon", id = TODO_NPC("Auctioneer Jaxon"), name = "Auctioneer Jaxon", title = "Auctioneer",
  bible = "bibles/unsung.md", role = "auctioneer", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "practical", "community" },
  notices = { "greenness", "purse" },
  impression = {
    first = "Auctioneer Jaxon knows every regular in Stormwind's auction house by name and most of them by their habits. She gave me sensible advice about prices and then teased me for not taking it sooner.",
    third = "{name} met Auctioneer Jaxon, the warm and practical auctioneer of Stormwind's hall.",
  },
  greetings = {
    { id = "g_default", text = "Hello, love. Selling something, or just looking at what everyone else is selling?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I wondered when you'd be back with more of that cloth." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 }, place = "before",
      text = "Oh, you're new to the hall, aren't you? Don't list your first linen at the price the nobles pay for silk, love, or it'll be back in your mailbox by morning." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Jaxon. I have the right-hand podium, and I'll tell you honestly what your goods will fetch, which is more than Chilton will, bless him." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "Hello, dear. Your people bring the loveliest things in from Darnassus, and they never know what to charge for them, so do ask me before you list anything." },
      },
      again = {
        { id = "h_again", text = "What else, love?" },
        { id = "h_again2", text = "Ask me quick, love, before Chilton starts shouting the next lot." },
      },
      choices = {
        { text = "Let me browse the auctions.", next = "BUSINESS" },
        { text = "So how do I price something?", next = "price" },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "Thanks, Jaxon.", next = "END" },
      },
    },
    price = {
      lines = { { id = "p_default", text = "Look at what's already listed, then come in a few coppers under the cheapest. Greedy folk wait a week for a sale and patient folk eat supper, and I've seen enough of both to know." } },
      choices = {
        { text = "I'd rather hold out for a fair price.", next = "price2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price2 = {
      lines = { { id = "p2_default", text = "Then hold out, love, and good luck to you. Mind you, a fair price is whatever somebody pays, and there's no shame in a quick sale when you need the coin." } },
      choices = {
        { text = "Underselling everyone hurts the honest crafters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Business is business, and the quick sale wins.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = { { id = "r_default", text = "Tailors from the Mage Quarter, buying every bolt of wool we get, and an old soldier who comes in each morning to bid on swords he never wins. And the nobles' stewards, who never say whose money they're spending." } },
      choices = {
        { text = "Why does the soldier never win?", next = "soldier" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "Because he bids a silver and a copper on everything, every time, and he's done it since before the Second War ended. I think he only comes for the company, and I don't mind at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've a family at home and a podium here, and between the two I never sit down. I wouldn't change it, though." } },
    _none = { { id = "tp_none", text = "No idea, love, but if it's for sale, I'll have heard the price." } },
  },
}

-- Aldwin Laughlin: guild master; registers charters and crests, and takes it seriously.
P:NPC {
  key = "aldwin_laughlin", id = TODO_NPC("Aldwin Laughlin"), name = "Aldwin Laughlin", title = "Guild Master",
  bible = "bibles/unsung.md", role = "worker", tier = "service",
  communities = { "stormwind" }, temper = { "formal" }, values = { "order", "loyal" },
  notices = { "status" },
  impression = {
    first = "Aldwin Laughlin registers Stormwind's guilds and designs their crests, and he treats every charter as a small promise made in front of the crown. He was formal, kind and very fond of his paperwork.",
    third = "{name} met Aldwin Laughlin, who keeps the Stormwind guild registry.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the guild registry. Are you here to found a guild, or to give an old one a new crest?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope your companions are keeping their oaths to one another." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Aldwin Laughlin, guild master of the Stormwind registry. I keep the charters of every guild that calls this city home, and I design their crests, which I'll admit is the part I enjoy." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "One of the Silver Hand! Your order is the oldest brotherhood I can think of, so you'll understand better than most why I insist that a charter be signed properly." },
      },
      again = {
        { id = "h_again", text = "What else may the registry help you with, friend?" },
        { id = "h_again2", text = "Ask what you will; I enjoy talking about guilds more than filing their papers." },
      },
      choices = {
        { text = "I'd like to see about a charter or crest.", next = "BUSINESS" },
        { text = "How does someone found a guild?", next = "found" },
        { text = "What makes a good crest?", next = "crest" },
        { text = "Good day, Aldwin.", next = "END" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "You buy a charter from me, and then you find enough others to sign it, real people who mean it. When it's full, bring it back, and I enter your guild's name in the registry for as long as it stands." } },
      choices = {
        { text = "Why does it need so many signatures?", next = "found2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found2 = {
      lines = { { id = "f2_default", text = "Because a guild of one is only a person with a fancy name. A charter is a promise that you'll stand by each other, and the crown likes to know that a promise has witnesses." } },
      choices = {
        { text = "A guild should answer to the crown.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A guild answers to its members, not the crown.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest = {
      lines = { { id = "c_default", text = "Something simple enough to paint on a shield in a hurry, and bold enough to be seen across a battlefield. The worst crests I've seen tried to say everything at once, and the best said one thing very clearly." } },
      choices = {
        { text = "Which crest is your favourite?", next = "crest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest2 = {
      lines = { { id = "c2_default", text = "There was a company of Lordaeron refugees who chose a plain white tower on grey, for the home they'd lost. I've never designed anything sadder or finer, and I don't know whether they're still alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a herald's clerk before the city's guilds needed a registry, so I've spent my whole life drawing other people's banners." } },
    _none = { { id = "tp_none", text = "That's not in the registry, friend, and I'd rather not guess." } },
  },
}

-- Woo Ping: weapon master in Weller's Arsenal; patient teacher, unflappable.
P:NPC {
  key = "woo_ping", id = TODO_NPC("Woo Ping"), name = "Woo Ping", title = "Weapon Master",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "discipline", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Woo Ping teaches weapons in a corner of Weller's Arsenal and watches how a student stands before he looks at what they hold. He was calm and patient, and said more with one correction than most do with a speech.",
    third = "{name} met Woo Ping, the weapon master who teaches in Weller's Arsenal.",
  },
  greetings = {
    { id = "g_default", text = "Stand still a moment and let me see how you hold yourself. Good, now we may talk." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your feet are better placed than before. I noticed." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest who wants to fight with more than prayer. I can teach you the staff and the dagger, and you'll find that both reward patience, as your faith does." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, place = "before",
      text = "A hunter. You'll want the crossbow from me, I expect, and perhaps a polearm for when the beast reaches you before your bolt does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Woo Ping, and I teach the weapons this arsenal sells: swords, staves, daggers, polearms and the crossbow. Gunther sells the steel and I teach the hand, and between us we make soldiers out of shopkeepers." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior should know every weapon, because the one you favour will break at the worst moment. Learn the polearm from me, and learn it well." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage at my door is rare, and welcome. I can teach you the sword or the staff, so that when your spells are spent, you are not yet helpless." },
      },
      again = {
        { id = "h_again", text = "Ask. A student who asks learns twice as fast." },
        { id = "h_again2", text = "Speak, and keep your feet where I placed them while you do." },
      },
      choices = {
        { text = "Teach me a new weapon.", next = "BUSINESS" },
        { text = "Where do I learn axes, maces or bows?", next = "elsewhere" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Which weapon do you prefer?", next = "prefer" },
        { text = "Thank you, master.", next = "END" },
      },
    },
    elsewhere = {
      lines = { { id = "e_default", text = "Axes, maces and guns belong to the dwarves, so go to Ironforge and find their weapon master there. For the bow, the night elves of Darnassus are the finest teachers, and they will tell you so themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "How to stand, before I ever put a weapon in your hand. A fighter who stands badly is beaten by their own weight, and no blade can save them from that." } },
      choices = {
        { text = "I'd rather learn to strike first.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Everyone would, and everyone who learns that way spends their second lesson on the floor. Patience is cheap, and a fool's courage is very expensive." } },
      choices = {
        { text = "Then I'll learn patience first, master.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "I learn best by getting knocked down.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prefer = {
      lines = { { id = "pr_default", text = "The staff, because it forgives a mistake and punishes arrogance. But I don't tell my students which weapon to love; that is something they discover on their own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have taught here for many years, and before that I trained the city's recruits. It is better work to teach a hand than to command a thousand of them." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask me how to hold a blade, and I'll answer properly." } },
  },
}

-- Marda Weller: the other counter of Weller's Arsenal; brisk, sharp with the ledger.
P:NPC {
  key = "marda_weller", id = TODO_NPC("Marda Weller"), name = "Marda Weller", title = "Weapons Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "honest" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Marda Weller keeps the second counter of Weller's Arsenal and the shop's books with it. She was brisk and sharp, and plainly the reason the arsenal still turns a profit.",
    third = "{name} met Marda Weller, who keeps the books and the second counter at Weller's Arsenal.",
  },
  greetings = {
    { id = "g_default", text = "Weller's Arsenal. If Gunther's busy talking about balance, I can sell you a sword much faster." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? Good, because that blade you bought should be needing an edge by now." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 10 }, place = "before",
      text = "Fresh from Northshire, are you? Then buy something cheap and sturdy from me today, and save your silver for something good once you know what you like." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Look at that edge, it's nearly gone. Get it seen to before you go anywhere, or the next thing you hit will be the last." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marda Weller. Gunther forges and fusses, Woo Ping teaches, and I keep the counter and the ledger, which is why this shop still has a roof." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, so it's a mace or a two-hander you're after. We've a few heavy pieces on the back wall, though Gerik Koen in Old Town has more if ours don't suit you." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've a customer waiting at the other counter." },
        { id = "h_again2", text = "Quickly, then; the shop doesn't run itself." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How's business since the auction house opened?", next = "auction" },
        { text = "Who buys the most weapons?", next = "buyers" },
        { text = "I'll leave you to it, Marda.", next = "END" },
      },
    },
    auction = {
      lines = { { id = "a_default", text = "Gunther grumbles about it, but I've no complaint, because the folk who buy cheap blades there come to us when they break. Woo Ping's students keep us busy too, though they knock things off the walls." } },
      choices = {
        { text = "Does Woo Ping send you much custom?", next = "woo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woo = {
      lines = { { id = "w_default", text = "Every student he teaches walks ten paces to my counter afterwards, and I call it the best arrangement this shop ever made. Gunther says it was his idea, and I let him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Adventurers, mostly, now that the army buys straight from Ironforge. And frightened merchants who want something to keep under the counter in case the Defias come into the city." } },
      choices = {
        { text = "Do you sell to anyone who asks?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "b2_default", text = "Anyone who pays and doesn't look like a cutthroat, and I've turned a few away. Gunther thinks I'm too fussy, and I think he's too trusting." } },
      choices = {
        { text = "Good. Better to turn away a buyer than arm a thief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A shopkeeper can't judge everyone. Sell, and let the guard sort it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this counter with Gunther for many years, and I know every blade on these walls by its price." } },
    _none = { { id = "tp_none", text = "No idea. Ask me what a sword costs, though, and I'll tell you to the copper." } },
  },
}

-- Keldric Boucher: arcane goods at Pestle's Apothecary; knowledgeable, a little superior.
P:NPC {
  key = "keldric_boucher", id = TODO_NPC("Keldric Boucher"), name = "Keldric Boucher", title = "Arcane Goods Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "learned" }, values = { "craft", "proud" },
  notices = { "arcane", "craft" },
  impression = {
    first = "Keldric Boucher sells vials and arcane goods in Pestle's Apothecary and can explain every powder on his shelves at length. He liked being asked, and liked being right even more.",
    third = "{name} met Keldric Boucher, who sells arcane goods at Pestle's Apothecary.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Pestle's. If it comes in a vial or a pouch, I most likely have it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Running short on something already, are we?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" }, place = "before",
      text = "An alchemist, I can always tell by the stains. You'll be wanting vials, and I'd buy a few more than you think you need, because you'll drop one." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "before",
      text = "A mage, good. You'll want arcane powder for your brilliance and runes for your portals, and I keep both, which is more than the Mage Quarter's shops can always say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keldric Boucher. Morgan Pestle has the potions, Kyra has the reagents by the door, and I keep the vials and the finer arcane goods for alchemists and spellcasters who know what they're doing." },
      },
      again = {
        { id = "h_again", text = "Anything else? I do enjoy a question I can answer." },
        { id = "h_again2", text = "Do continue; I rarely get questions from anyone who listens to the answers." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What makes a vial so special?", next = "vial" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Good day, Keldric.", next = "END" },
      },
    },
    vial = {
      lines = { { id = "v_default", text = "A good vial doesn't react with what you put in it, and a bad one ruins a potion before you've corked it. The cheap ones are fine for healing draughts, but anything stronger wants leaded glass." } },
      choices = {
        { text = "Why leaded glass?", next = "vial2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vial2 = {
      lines = { { id = "v2_default", text = "Because it holds a stronger draught without cracking, though nobody can tell me exactly why. The gnomes have theories, which is what gnomes always have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "Ironforge, mostly, since Dalaran fell and its suppliers with it. The dwarves make fine glass but they charge for every bubble, and I pass the cost along, I'm sorry to say." } },
      choices = {
        { text = "You could try cheaper suppliers.", next = "stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "s2_default", text = "I could, and I'd sell cheaper glass that cracks in an alchemist's hand. Morgan won't have it in the shop, and frankly, neither will I." } },
      choices = {
        { text = "Quality is worth paying for.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Most buyers would never know the difference.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied alchemy for a few years before I learned I preferred selling the tools to using them. Kyra and I have worked in Pestle's shop ever since." } },
    _none = { { id = "tp_none", text = "That's outside my shelves, I'm afraid." } },
  },
}

-- Kyra Boucher: reagents by the door of Pestle's; quick, friendly, knows every class's needs.
P:NPC {
  key = "kyra_boucher", id = TODO_NPC("Kyra Boucher"), name = "Kyra Boucher", title = "Reagent Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quick" }, values = { "practical", "community" },
  notices = { "class" },
  impression = {
    first = "Kyra Boucher sells reagents just inside the door of Pestle's Apothecary and knows what every sort of spellcaster runs out of. She seemed to have memorised half the city's habits by what they bought.",
    third = "{name} met Kyra Boucher, the reagent seller at Pestle's Apothecary.",
  },
  greetings = {
    { id = "g_default", text = "Welcome! Let me know if you need help finding anything; I keep it all right here by the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me guess what you've run out of." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", minLevel = 34 }, place = "before",
      text = "Light feathers, I expect, for when you'd rather float than fall. The Cathedral's priests buy them by the handful before they go out into the hills." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, place = "before",
      text = "A druid! I keep seeds for your rebirth and berries for your gifts, though I'll admit I don't fully understand what you do with them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kyra Boucher. Reagents for every kind of spellcaster, right by the door so nobody has to walk past Keldric's lectures on glass. Keldric is my kin, so I'm allowed to say that." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. You'll want symbols of divinity, I expect, though I hope you never need to use one. The Silver Hand's people always look so solemn when they buy them." },
      },
      again = {
        { id = "h_again", text = "Who's next, then? Oh, still you; what else have you run short of?" },
        { id = "h_again2", text = "Anything else? I've another customer at the door." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "What do priests buy from you?", next = "priest", when = { class = "PRIEST" } },
        { text = "What do mages run out of?", next = "mage", when = { class = "MAGE" } },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Thank you, Kyra.", next = "END" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Light feathers for levitating, and holy candles for the prayers that strengthen a whole company at once. The Cathedral's sisters buy candles by the box before they go to the front." },
        { id = "pr_low", when = { maxLevel = 33 }, text = "Not much yet, I'm afraid, but once you learn to float, you'll need light feathers, and later holy candles for the bigger prayers. I'll be here when you do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Runes of teleportation, always, because a mage would rather walk home by magic than by foot. Arcane powder, too, once you're strong enough to grant your brilliance to a whole group." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "The Mage Quarter, when its own shops run dry, and the Cathedral, which never does. Rogues buy flash powder from me and never look me in the eye, which I find rather sweet." } },
      choices = {
        { text = "You sell to rogues without asking questions?", next = "rogues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogues = {
      lines = { { id = "r_default", text = "Flash powder isn't a crime, and half the guard's own scouts buy it from me. If I asked every customer what they meant to do with their reagents, I'd sell nothing at all." } },
      choices = {
        { text = "Fair enough. What they do isn't your concern.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A careful seller should still keep an eye out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Keldric and I have kept these shelves in Morgan Pestle's shop for years, and I like the door better than the back room." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that, but if it fits in a pouch, ask me." } },
  },
}
