-- Darnassus, folk the roster scan found missing (1 of 3): the Tradesmen's Terrace. The four
-- auctioneers and the terrace's merchants of arms, armor, robes and bags. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Auctioneer Golothas: the senior voice of the Darnassus auction house.
P:NPC {
  key = "dar_golothas", id = TODO_NPC("Auctioneer Golothas"), name = "Auctioneer Golothas", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "measured", "dry" }, values = { "fairness", "patience" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Golothas conducts the business of the Darnassus auction house as though it were a rite of the Temple. He seems faintly surprised, every day, that his people have taken to bidding at all.",
    third = "{name} met Auctioneer Golothas at the auction house on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. The auction house of Darnassus is open to you, and every lot in it is honestly described." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I hope the last bargain served you well. What will you look over today?" },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and already counting on your fingers. Your people bid faster than I can speak, so I ask only that you let me finish the sentence." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Golothas, and I keep the auctions here with Tolon, Cazarez and Silva'las. A thing is offered, a price is named, and the highest honest bid carries it away, which is simple enough once one has learned to hurry." } },
      again = {
        { id = "h_again", text = "Is there something more, or shall we turn to the lots?" },
        { id = "h_again2", text = "Speak on, {class}. The bids will keep a moment." },
      },
      choices = {
        { text = "Show me the auctions.", next = "BUSINESS" },
        { text = "Night elves did not always hold auctions?", next = "old" },
        { text = "What sells best in Darnassus?", next = "sells" },
        { text = "Elune light your path.", next = "END" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "For ten thousand years we traded as neighbours do, a bowstring for a basket of moonberries and a promise for the rest. The auction came to us with the Alliance, along with coin, haste, and the notion that a thing is worth whatever a stranger will shout for it." } },
      choices = {
        { text = "You sound as if you miss the old way.", next = "miss" },
        { text = "Coin is quicker than promises. Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss knowing the face of everyone I traded with, though I do not miss waiting a season for a cloak. The world outside our forests moves quickly now, and Darnassus must keep its accounts in order if it means to keep pace." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
    sells = {
      lines = {
        { id = "s_hunter", when = { class = "HUNTER" }, text = "For a hunter, arrows and good hides above all, and you will find both listed here by the bundle. The Sentinels buy what is left, so I would not wait long." },
        { id = "s_default", text = "Herbs from Teldrassil's boughs, hides from Darkshore, and whatever the ships bring up from Rut'theran Village. The human smiths of Stormwind send blades as well, and our young warriors bid on them more eagerly than their elders like." },
      },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept the auctions of Darnassus since the Tradesmen's Terrace was first raised. Before that I kept a great deal of quiet." } },
    teldrassil = { { id = "tp_tel", text = "The tree is young, as we count such things, and so is this city. We are all still learning its ways." } },
    _none = { { id = "tp_none", text = "That is no lot of mine, {class}. Ask me what something is worth, and I may answer you." } },
  },
}

-- Auctioneer Tolon: brisk, the one who actually enjoys it.
P:NPC {
  key = "dar_tolon", id = TODO_NPC("Auctioneer Tolon"), name = "Auctioneer Tolon", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "cheerful" }, values = { "trade", "fairness" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Tolon is quick for a night elf, and he plainly enjoys the bidding more than his colleague Golothas thinks proper. He watches a purse the way a hunter watches a trail.",
    third = "{name} met Auctioneer Tolon at the Darnassus auction house.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}! There are new lots since the morning, and some of them will not last until the moon rises." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back, and I think you have the look of someone with a bid in mind." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at my counter! Your kin drive the hardest bargains I have met, and I say so with real admiration." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Tolon, auctioneer of Darnassus, and glad of your custom. Golothas will tell you that all this bidding is a strange new habit, but I find there is a good hunt in it, and nobody is hurt at the end." } },
      again = {
        { id = "h_again", text = "What else, friend? I can talk and count at once." },
        { id = "h_again2", text = "Go on, and then let us see what you will bid." },
      },
      choices = {
        { text = "Let me see what's for sale.", next = "BUSINESS" },
        { text = "A hunt, you call it?", next = "hunt" },
        { text = "Do the other cities trade through you?", next = "cities" },
        { text = "Good fortune, Tolon.", next = "END" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "It is one, truly. You pick your quarry, you wait without letting the others see that you want it, and you strike at the last moment with a price nobody expected." } },
      choices = {
        { text = "And when someone outbids you?", next = "outbid" },
        { text = "Patience I have. Something else.", next = "BACK" },
      },
    },
    outbid = {
      lines = { { id = "ob_default", text = "Then the stag has outrun you, and you let it go with good grace, because another will come down the same path tomorrow. The ones who chase a lost bid past all sense are the ones who leave here poor." } },
      choices = { { text = "Wise enough. Something else.", next = "BACK" } },
    },
    cities = {
      lines = {
        { id = "c_human", when = { race = "Human" }, text = "They do, and your own Stormwind most of all. I have never seen your city, but I know its prices to the copper, and I think that tells me a good deal about it." },
        { id = "c_default", text = "Stormwind and Ironforge both, by ship to Auberdine and on up through Rut'theran. Their goods reach us late and salt-stained, and they still sell before I have finished describing them." },
      },
      choices = { { text = "Good to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a trader along the Darkshore coast before the auction house opened. This is the same work with a roof over it." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend, unless somebody has listed it for sale." } },
  },
}

-- Auctioneer Cazarez: newer to the house, precise, keeps the ledgers.
P:NPC {
  key = "dar_cazarez", id = TODO_NPC("Auctioneer Cazarez"), name = "Auctioneer Cazarez", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "precise", "reserved" }, values = { "order", "honesty" },
  notices = { "class" },
  impression = {
    first = "Auctioneer Cazarez speaks softly and records everything. One has the sense that no copper has ever gone astray within reach of his hand.",
    third = "{name} met Auctioneer Cazarez, who keeps careful accounts at the Darnassus auction house.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. If you have come to buy or to sell, I will see that it is recorded properly." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your name is already in my ledger, so we may begin at once." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move very quietly for a customer. I will say only that every lot here is counted twice, and leave the matter there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cazarez. The house grew too busy for Golothas and Tolon alone, so Silva'las and I were asked to join them, and I have kept the ledgers ever since." } },
      again = {
        { id = "h_again", text = "Is there more you wish to ask before we begin?" },
        { id = "h_again2", text = "Yes, {class}? I am listening." },
      },
      choices = {
        { text = "I'd like to browse the auctions.", next = "BUSINESS" },
        { text = "Why did the house grow so busy?", next = "busy" },
        { text = "You write everything down, I see.", next = "ledger" },
        { text = "Farewell.", next = "END" },
      },
    },
    busy = {
      lines = { { id = "b_default", text = "Because there are more travellers in Darnassus each season than the last. Humans, dwarves and gnomes come up from Rut'theran with full packs, and each of them expects to sell the contents before supper." } },
      choices = {
        { text = "Does that trouble you?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "It does not trouble me, though it tires me. They are honest in the main, and their haste is only the haste of people who have fewer years to spend than we do." } },
      choices = { { text = "Fewer years, but we use them. Something else.", next = "BACK" } },
    },
    ledger = {
      lines = { { id = "l_default", text = "I do, because a bargain that is not written down becomes two different bargains by the next new moon. Golothas trusts his memory and Tolon trusts his luck, and I prefer ink." } },
      choices = { { text = "Ink is the safest of the three. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept records for the Temple's stores before I came to the auction house. The sums here are larger and the people louder." } },
    _none = { { id = "tp_none", text = "I have no record of that, {class}, and I do not like to guess." } },
  },
}

-- Auctioneer Silva'las: the youngest of the four, curious about outlanders.
P:NPC {
  key = "dar_silvalas", id = TODO_NPC("Auctioneer Silva'las"), name = "Auctioneer Silva'las", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "curious", "polite" }, values = { "learning", "fairness" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Silva'las studies each customer as closely as the goods they bring. He asks more questions than an auctioneer needs to, and listens to all of the answers.",
    third = "{name} met Auctioneer Silva'las at the auction house in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have the dust of a long road on you, and I would guess a pack worth emptying." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. Tell me where you have been since, if you have a moment for it." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human of Stormwind, unless I mistake the accent. I have a dozen questions about your city, and I will try to ask only one of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Silva'las, the newest of the four who keep this house. Every lot that crosses my counter has come from somewhere I have never stood, and I confess that is half of why I took the post." } },
      again = {
        { id = "h_again", text = "What else would you tell me, or ask?" },
        { id = "h_again2", text = "Please, go on." },
      },
      choices = {
        { text = "Show me what's on offer.", next = "BUSINESS" },
        { text = "You've never left Teldrassil?", next = "left" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "Until next time.", next = "END" },
      },
    },
    left = {
      lines = { { id = "le_default", text = "I have been to Auberdine, which hardly counts, since one can see the great tree from its docks. So I learn the world from what it sends me, such as Stranglethorn pearls, dwarven powder and cloth that smells of other people's hearths." } },
      choices = {
        { text = "The world is rougher than its goods.", next = "rough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough = {
      lines = { { id = "r_default", text = "So Golothas tells me, and he has seen far more of it than I have. I think I would still like to judge for myself one day, when the house can spare me." } },
      choices = { { text = "Then I hope it can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strange = {
      lines = {
        { id = "st_gnome", when = { race = "Gnome" }, text = "Something made by your own people, I am afraid. It ticked, it had a small brass key, and the gnome who bought it would not tell me what it did, so I think of it often." },
        { id = "st_default", text = "A gnomish device that ticked, with a small brass key in its back. Nobody in Darnassus could say what it was for, and it sold within the hour to a gnome who seemed delighted." },
      },
      choices = { { text = "Best not to wind such things. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am the newest auctioneer of the four. Golothas says I ask too much, and Tolon says I do not ask about prices enough." } },
    _none = { { id = "tp_none", text = "I do not know, though now I would like to. Tell me if you find out." } },
  },
}

-- Anadyia: robe vendor; shares her shop with Andrus the staff merchant.
P:NPC {
  key = "dar_anadyia", id = TODO_NPC("Anadyia"), name = "Anadyia", title = "Robe Vendor", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "gracious", "exacting" }, values = { "tradition", "craft" },
  notices = { "class" },
  impression = {
    first = "Anadyia sells robes from a shop she shares with Andrus the staff merchant. She looks a customer over once, slowly, and seems to know the length of their arms by the end of it.",
    third = "{name} met Anadyia, who sells robes on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore. Come in out of the walkway, and let me see how that garment hangs on you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and the hem is muddier than when you left. Let us see what can be done." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "A daughter or son of the Temple is always welcome here. I cut the Sisterhood's robes the old way, and I would be glad to cut yours." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You are a mage, I think. I will dress you as well as anyone, though you will forgive me if I do not ask what the sleeves are meant to hide." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Anadyia, and I sell robes. Andrus keeps the staves on the other side of the shop, so between us a priestess may walk in bare-handed and walk out fit to stand before the High Priestess." } },
      again = {
        { id = "h_again", text = "Was there something else, before we look at cloth?" },
        { id = "h_again2", text = "Yes? I am listening, and so, I expect, is Andrus." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Who buys robes in a city of hunters?", next = "who" },
        { text = "You and Andrus share the shop.", next = "andrus" },
        { text = "Goddess watch over you.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Sisters of Elune first, and the druids of the Enclave when they remember that they have two legs. Of late I also dress the Alliance's spellcasters, who want more pockets than any robe should have." } },
      choices = {
        { text = "What do you make of the spellcasters?", next = "casters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    casters = {
      lines = { { id = "c_default", text = "They pay promptly and they are courteous, and I try to remember that. My people learned long ago what the arcane costs, at a price I hope theirs never pay, but a robe is only a robe and I will not refuse a guest one." } },
      choices = { { text = "That is generous of you. Something else.", next = "BACK" } },
    },
    andrus = {
      lines = { { id = "a_default", text = "We do, and we have for longer than the shop has stood on this terrace. He believes a robe exists to show off a staff and I believe the reverse, so neither of us is ever short of something to say." } },
      choices = { { text = "A good arrangement. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sewn robes for the Sisterhood for a very long time. The Tradesmen's Terrace is only the latest place I have done it." } },
    highborne = { { id = "tp_hb", text = "The Highborne dressed beautifully, and you see what became of them. I keep my cuts plain for a reason." } },
    _none = { { id = "tp_none", text = "I know cloth, and I know who wears it. Beyond that you must ask someone else." } },
  },
}

-- Andrus: staff merchant; shares the shop with Anadyia.
P:NPC {
  key = "dar_andrus", id = TODO_NPC("Andrus"), name = "Andrus", title = "Staff Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "wry" }, values = { "patience", "nature" },
  notices = { "class" },
  impression = {
    first = "Andrus sells staves beside Anadyia's robes, and he handles each one as if it might still put out leaves. He is unhurried even by the standards of his people.",
    third = "{name} met Andrus, a staff merchant on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, friend. Take one down and feel the weight of it, because a staff should be chosen with the hands." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Has the last one served you, or has it met something harder than itself?" },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid knows what I mean when I say the wood remembers. You will choose well without my help, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "My name is Andrus, and these staves are my trade. Anadyia will tell you that a staff is only something to lean on while wearing one of her robes, and I have been letting her think so for a long while." } },
      again = {
        { id = "h_again", text = "What else may I tell you?" },
        { id = "h_again2", text = "Ask, friend. I am in no hurry, and neither is the wood." },
      },
      choices = {
        { text = "Let me see your staves.", next = "BUSINESS" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "A staff seems a poor weapon to me.", next = "poor" },
        { text = "Walk with Elune.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "From boughs that have already fallen, on Teldrassil and in Ashenvale. No one here would take an axe to a living tree for the sake of a walking stick, and the forest drops enough in a storm to keep me in trade for years." } },
      choices = {
        { text = "Even Teldrassil sheds its branches?", next = "tel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tel = {
      lines = { { id = "t_default", text = "It does, and more often than a tree of its age should, or so the druids mutter when they think the merchants are not listening. I only gather what falls, and leave the reasons to the Cenarion Enclave.", fx = { learn = { "teldrassil" } } } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    poor = {
      lines = {
        { id = "p_warrior", when = { class = "WARRIOR" }, text = "A warrior would say so, with a sword on the hip. Yet I have watched a Sentinel put three recruits on their backs with a plain ash staff, and none of them called it poor afterwards." },
        { id = "p_default", text = "It has reach and it never needs sharpening, which is more than can be said for a sword. In the right hands it is also a way of asking the world for something, though that part I only sell and do not teach." },
      },
      choices = { { text = "Perhaps I misjudged it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have shaped and sold staves since before this tree was planted. Anadyia and I have kept shop together nearly as long." } },
    teldrassil = { { id = "tp_tel", text = "It drops more wood than it ought to. I say so quietly, because I am a merchant and not a druid." } },
    _none = { { id = "tp_none", text = "That is beyond me, friend. Ask me about ash or yew, and I will keep you here until moonrise." } },
  },
}

-- Caynrus: shield merchant.
P:NPC {
  key = "dar_caynrus", id = TODO_NPC("Caynrus"), name = "Caynrus", title = "Shield Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "steady", "blunt" }, values = { "protection", "duty" },
  notices = { "class" },
  impression = {
    first = "Caynrus sells shields, and he raps each one with his knuckles before he lets a customer touch it. He talks about them as other people talk about old friends who have never let them down.",
    third = "{name} met Caynrus, the shield merchant of the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met. If you mean to stand in front of something angry, you have come to the right shop." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and still in one piece, which I will take as praise for my wares." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the humans' Light. Your order understands a shield better than most, and I am glad to see one carried with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Caynrus, and I deal in shields. My people are known for the bow and the glaive, and that is all very well, but somebody must still stand at the front and be struck." } },
      again = {
        { id = "h_again", text = "Something more? Speak plainly, and I will do the same." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Show me your shields.", next = "BUSINESS" },
        { text = "Do many night elves carry shields?", next = "many" },
        { text = "What makes a good shield?", next = "good" },
        { text = "Stand firm, Caynrus.", next = "END" },
      },
    },
    many = {
      lines = { { id = "m_default", text = "Fewer than should. The Sentinels fight from the trees and trust to speed, and for ten thousand years that was enough, but the battle on Hyjal taught a good many of us what it is to be caught in the open." } },
      choices = {
        { text = "You were at Hyjal?", next = "hyjal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "I was on the mountain, as most of us were who could hold a weapon. I will not make a tale of it, except to say that I have sold shields ever since and have not once been ashamed of the trade." } },
      choices = { { text = "No one could ask more. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    good = {
      lines = {
        { id = "gd_warrior", when = { class = "WARRIOR" }, text = "You know the answer already, warrior, which is that it must be light enough to raise the hundredth time as quickly as the first. Wood and hide for a long march, and iron only when you know the blow that is coming." },
        { id = "gd_default", text = "It should be no heavier than you can lift when you are already tired, because that is when you will need it. A handsome shield that hangs at your side is worth less than an ugly one that is in the way of the blow." },
      },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought beside the Sentinels when the Legion came, and I sell shields now. The two things are connected." } },
    sentinels = { { id = "tp_sen", text = "The finest archers and riders in the world, and stubborn about armor. I keep trying." } },
    _none = { { id = "tp_none", text = "I cannot help you with that. I can only keep it from hitting you." } },
  },
}

-- Cyridan: leather armor merchant.
P:NPC {
  key = "dar_cyridan", id = TODO_NPC("Cyridan"), name = "Cyridan", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "observant" }, values = { "stealth", "craft" },
  notices = { "class" },
  impression = {
    first = "Cyridan sells leather armor and moves about his shop without making a sound. He listens to how a customer walks before he recommends anything.",
    third = "{name} met Cyridan, who sells leather armor on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. I heard you on the walkway well before I saw you, and we may be able to mend that." },
    { id = "g_back", when = { metBefore = true }, text = "You tread more softly than you did last time. Is that my leather, or have you been practising?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You, I did not hear at all, which is the best thing I can say to anyone. Come and see what I keep for people who walk as you do." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid wants leather that does not complain when the wearer changes shape. I have some that has learned to bear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cyridan, and leather is my trade. Melea sells mail down the terrace for those who wish to be heard coming, and Vinasia sells cloth for those who do not expect to be struck, and I serve everybody in between." } },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Yes? Speak, and I will hear it." },
      },
      choices = {
        { text = "Let me see your leathers.", next = "BUSINESS" },
        { text = "Why does quiet matter so much to you?", next = "quiet" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Go quietly, Cyridan.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "Because in the forest the loud thing is the thing that is eaten, or the thing that goes hungry. Our hunters and scouts have known that since before your grandsires' grandsires, and good leather is cut with it in mind." } },
      choices = {
        { text = "How do you cut leather for silence?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "You keep the seams away from where the limbs bend, you oil the hide until it stops creaking, and you leave off every buckle that the wearer can live without. The humans love a buckle, and I have stopped arguing with them about it." } },
      choices = { { text = "No buckles, then. Something else.", next = "BACK" } },
    },
    hides = {
      lines = {
        { id = "hi_hunter", when = { class = "HUNTER" }, text = "From hunters like yourself, for the most part, and from the leatherworkers on the Craftsmen's Terrace who cure them. If you take only what you need and skin it cleanly, they will always be glad of your hides there." },
        { id = "hi_default", text = "From the hunters of Teldrassil and Darkshore, by way of the leatherworkers on the Craftsmen's Terrace. Nothing is taken that the forest cannot spare, and nothing of the animal is wasted." },
      },
      choices = { { text = "As it should be. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted for many years before I sold armor. I learned what a creaking strap can cost." } },
    _none = { { id = "tp_none", text = "I have not heard anything of that, and I hear most things." } },
  },
}

-- Ealyshia Dewwhisper: two-handed weapon merchant.
P:NPC {
  key = "dar_ealyshia", id = TODO_NPC("Ealyshia Dewwhisper"), name = "Ealyshia Dewwhisper", title = "Two Handed Weapon Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "confident", "teasing" }, values = { "strength", "skill" },
  notices = { "class", "race" },
  impression = {
    first = "Ealyshia Dewwhisper sells the largest weapons on the Tradesmen's Terrace and lifts them one-handed to show them off. Her family name suggests something gentler than her stock.",
    third = "{name} met Ealyshia Dewwhisper, who sells two-handed weapons in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Everything on these racks needs both of your hands and all of your attention." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Either you have grown stronger or you have broken something, and I can help with both." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You have a warrior's shoulders. Take down the long blade behind you, and tell me truthfully whether it sits well in your grip." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "I mean no slight, small friend, but most of what I sell is taller than you are. I do keep one or two pieces a gnome might carry without toppling." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Ealyshia Dewwhisper, and yes, I have heard every jest about the name. I sell greatswords, long staves and polearms to anyone with the arms to swing them and the sense to know when not to." } },
      again = {
        { id = "h_again", text = "What else? Ask, and mind the rack behind you." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why two-handed weapons?", next = "why" },
        { text = "A dew whisper is a gentle thing.", next = "name" },
        { text = "Strength to you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because some things in this world do not notice a dagger. The furbolgs who have gone mad in the wilds, the corrupted treants and the great bears will each take a quick blade and keep coming, and then one wants weight." } },
      choices = {
        { text = "And the sense to know when not to?", next = "sense" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sense = {
      lines = { { id = "s_default", text = "A great weapon commits you, {class}, for once you have begun the swing you are going wherever it goes. The young ones buy the biggest blade on the wall and learn that in their first real fight, if they are fortunate enough to learn it at all." } },
      choices = { { text = "I'll swing with care. Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "So it is, and my mother chose a gentle trade to match it. I am told I was a great disappointment until the first time something with claws came too near the house." } },
      choices = { { text = "And after that? Something else.", next = "BACK", reply = "After that she stopped complaining about the noise I made in the yard, and that was praise enough for me." } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Dewwhispers are quiet folk, by and large. I am the one they mention last." } },
    _none = { { id = "tp_none", text = "I could not say. If it can be solved by hitting it very hard, come back and see me." } },
  },
}

-- Glorandiir: axe merchant; an uneasy trade among tree-dwellers.
P:NPC {
  key = "dar_glorandiir", id = TODO_NPC("Glorandiir"), name = "Glorandiir", title = "Axe Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "solemn", "principled" }, values = { "nature", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "Glorandiir sells axes in a city built in the branches of a tree, and he is well aware of how that looks. He is careful to say what his axes are for before anyone asks.",
    third = "{name} met Glorandiir, the axe merchant of the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. These are axes for war, {class}, and I will ask you to remember that when you carry one beneath our boughs." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I trust the last axe has been lifted only against those who earned it." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf will know a good axe, and I respect that. I ask only that you leave Teldrassil with as many trees as you found here." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = "NightElf" },
      text = "A warrior of our own people, and choosing the axe over the glaive. There is no shame in it, whatever the elders say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Glorandiir, and I sell axes, which is a strange calling among the kaldorei. Every blade here was forged to cleave armor and bone, and none of them has ever tasted living wood, nor will it while I have a say." } },
      again = {
        { id = "h_again", text = "What more would you ask of me?" },
        { id = "h_again2", text = "Speak, {class}." },
      },
      choices = {
        { text = "Let me see your axes.", next = "BUSINESS" },
        { text = "Do your people frown on your trade?", next = "frown" },
        { text = "An axe is an axe, wherever it lands.", next = "axe" },
        { text = "Elune be with you.", next = "END" },
      },
    },
    frown = {
      lines = { { id = "f_default", text = "Some do, and I do not blame them. In Ashenvale the Warsong orcs fell trees older than their whole people's memory, and to many here the axe has an orc's face on it.", fx = { learn = { "warsong" } } } },
      choices = {
        { text = "Then why sell them at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Sentinels who face those orcs deserve a weapon that answers in kind. I would rather a night elf held the axe and chose where it fell than leave the choosing to the Horde." } },
      choices = { { text = "I can't fault that. Something else.", next = "BACK" } },
    },
    axe = {
      lines = { { id = "a_default", text = "The steel is the same, I grant you, but the hand is not. I ask each buyer what they mean to do with it, and although I cannot stop a liar, I find that most people dislike lying to a face that has seen ten thousand years." } },
      choices = { { text = "Then I'll tell you true. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell axes on the Tradesmen's Terrace, and I answer for every one I sell." } },
    warsong = { { id = "tp_ws", text = "The orcs who log Ashenvale. They are the reason many here cannot look at my wares." } },
    _none = { { id = "tp_none", text = "That lies outside what I know. I would rather say so than mislead you." } },
  },
}

-- Kieran: weapon merchant (general arms).
P:NPC {
  key = "dar_kieran", id = TODO_NPC("Kieran"), name = "Kieran", title = "Weapon Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "affable", "practical" }, values = { "readiness", "trade" },
  notices = { "class" },
  impression = {
    first = "Kieran keeps a general armory on the Tradesmen's Terrace and seems to know every other merchant's stock as well as his own. He will cheerfully send a customer elsewhere if elsewhere is better.",
    third = "{name} met Kieran, a weapon merchant on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Tell me what you mean to fight, and I will tell you what to carry." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. Did the last one hold its edge?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You will want Landria for a bow, hunter, since she strings finer ones than I stock. For the knife at your belt, though, you may look no further." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Kieran. I keep a little of everything, which means that the specialists along this terrace all think me a dabbler and all send me the customers who cannot make up their minds." } },
      again = {
        { id = "h_again", text = "Anything else I can tell you?" },
        { id = "h_again2", text = "Ask away, friend." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Who are the specialists?", next = "specialists" },
        { text = "What do you tell someone who can't decide?", next = "decide" },
        { text = "Good trading, Kieran.", next = "END" },
      },
    },
    specialists = {
      lines = { { id = "s_default", text = "Merelyssa for blades and Ealyshia for anything that takes two hands. Glorandiir sells axes with a short sermon attached, Mythidan has maces, Turian has whatever you would like to throw, and Landria strings the bows." } },
      choices = {
        { text = "A sermon with the axes?", next = "sermon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sermon = {
      lines = { { id = "se_default", text = "He will have you promise not to touch a tree with it, and he means every word. Do not smile while he says it, friend, because he has good reasons and they all grow in Ashenvale." } },
      choices = { { text = "I'll keep a straight face. Something else.", next = "BACK" } },
    },
    decide = {
      lines = {
        { id = "d_rogue", when = { class = "ROGUE" }, text = "For one of your calling it is simple, since you want two short blades and nothing that catches the light. The rest of the wall is for people who expect to be seen." },
        { id = "d_default", text = "I tell them to pick up three and put down the two they have to think about. The hand usually knows before the head does, and I have rarely seen it choose wrongly." },
      },
      choices = { { text = "I'll trust the hand. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold arms here since the terrace opened. I know a little about every weapon and a great deal about my neighbours." } },
    _none = { { id = "tp_none", text = "That one is beyond me, friend. Somebody on this terrace will know, and I can probably tell you who." } },
  },
}

-- Melea: mail armor merchant.
P:NPC {
  key = "dar_melea", id = TODO_NPC("Melea"), name = "Melea", title = "Mail Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "forthright", "protective" }, values = { "duty", "care" },
  notices = { "class" },
  impression = {
    first = "Melea sells mail armor and frowns at anyone who walks past her shop wearing less. She fusses over a fitting like someone who has seen what happens without one.",
    third = "{name} met Melea, who sells mail armor on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. Turn about and let me see what stands between you and the next arrow." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and with new dents, I see. Come in, and we will see to them." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter in leather is well enough while you are young. When you have walked a few more roads you will want my mail, so remember where the shop is." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "I have nothing your sort can wear, more is the pity. Stand behind somebody who shops here, and you will do well enough." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Melea, and I sell mail. It weighs more than Cyridan's leather and it makes more noise, but I have never yet had a customer come back to complain that it stopped too much." } },
      again = {
        { id = "h_again", text = "What else, then?" },
        { id = "h_again2", text = "Go on, I am listening while I work." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "Do the Sentinels wear your mail?", next = "sentinels" },
        { text = "Mail rusts on a sea voyage.", next = "rust" },
        { text = "Keep well, Melea.", next = "END" },
      },
    },
    sentinels = {
      lines = { { id = "s_default", text = "Some of them do, and more since the fighting in Ashenvale grew worse. The old huntresses will tell you that armor only slows the hand, and then they come to me quietly after their first season against the Warsong.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "What changes their minds?", next = "minds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    minds = {
      lines = { { id = "m_default", text = "An orc's axe does, usually one that only just missed. I do not say it to them, because they are proud and they have earned their pride, so I only measure them and keep my thoughts behind my teeth." } },
      choices = { { text = "A kindness, in its way. Something else.", next = "BACK" } },
    },
    rust = {
      lines = { { id = "r_default", text = "It does, and the crossing from Auberdine is the worst for it. Oil it before you board and again when you land, and do not let a sailor tell you that salt air is good for iron." } },
      choices = { { text = "Oil it twice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fitted mail for the Sentinels and for anyone else with the sense to wear it." } },
    sentinels = { { id = "tp_sen", text = "Brave beyond reason, and slow to armor themselves. I do what I can for them." } },
    _none = { { id = "tp_none", text = "I do not know about that. I know rings and rivets, and who ought to be wearing them." } },
  },
}

-- Merelyssa: blade merchant.
P:NPC {
  key = "dar_merelyssa", id = TODO_NPC("Merelyssa"), name = "Merelyssa", title = "Blade Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "poised", "sharp" }, values = { "skill", "discipline" },
  notices = { "class" },
  impression = {
    first = "Merelyssa sells swords and daggers, and she tests an edge against her thumbnail while she talks. She has little patience for anyone who buys a blade for its looks.",
    third = "{name} met Merelyssa, the blade merchant of the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Show me how you hold the one you carry, and I will know what to offer you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. I hope you have been keeping that edge as I showed you." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You carry your daggers low and out of sight, as you should. I keep a few behind the counter that are not for display, if you care to see them." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "That is a soldier's grip, firm and a little too tight. Loosen the last two fingers and the blade will do more of the work for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Merelyssa. I sell blades from the dagger to the longsword, and I sharpen my opinion of a customer on how they treat the first one I hand them." } },
      again = {
        { id = "h_again", text = "What else do you wish to know?" },
        { id = "h_again2", text = "Ask, and be brief if you can." },
      },
      choices = {
        { text = "Let me see your blades.", next = "BUSINESS" },
        { text = "How should I treat a blade?", next = "treat" },
        { text = "Are these night elf blades?", next = "make" },
        { text = "Keep your edge, Merelyssa.", next = "END" },
      },
    },
    treat = {
      lines = { { id = "t_default", text = "Clean it after every use and oil it before every rest, and never put it away wet with anything. A sword is a patient servant, but it remembers neglect and it will remind you of it at the worst possible moment." } },
      choices = {
        { text = "You've seen that happen?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "I have seen a blade snap at the tang in the middle of a fight because its owner had let the rust creep under the hilt. She lived, thanks to her sisters, and she has been my most careful customer ever since." } },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
    make = {
      lines = { { id = "m_default", text = "Some of them are. The curved ones are our own work, made for a long draw and a clean cut, while the straight ones come from human forges, which are heavier and cruder and I admit very hard to break." } },
      choices = { { text = "Each has its use. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold blades to three generations of Sentinels. I taught a few of them to care for what they bought." } },
    _none = { { id = "tp_none", text = "I cannot say. I do not speak on things I have not tested." } },
  },
}

-- Mythidan: mace & staff merchant.
P:NPC {
  key = "dar_mythidan", id = TODO_NPC("Mythidan"), name = "Mythidan", title = "Mace & Staff Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "mild", "thoughtful" }, values = { "balance", "restraint" },
  notices = { "class" },
  impression = {
    first = "Mythidan sells maces and staves, weapons with no edge on them, and he has a mild, considering way of speaking. He seems to have thought a great deal about the difference between stopping an enemy and killing one.",
    third = "{name} met Mythidan, who sells maces and staves in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. You will find no edges in my shop, only weight and good balance." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope that what you bought has kept you whole." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest will want a mace, I expect, as the Sisters often do. It is a weapon that lets one defend the flock without growing fond of blood." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "The druids of the Enclave buy more from me than anyone, staves and cudgels both. You are welcome to try the weight of whatever you like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Mythidan, and I sell maces and staves. Andrus down the terrace sells staves as well, and we have agreed that his are for leaning upon and mine are for striking with, which keeps the peace between us." } },
      again = {
        { id = "h_again", text = "Is there something else I may answer?" },
        { id = "h_again2", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why no edged weapons?", next = "edges" },
        { text = "A mace seems a brutal thing.", next = "brutal" },
        { text = "Peace to you, Mythidan.", next = "END" },
      },
    },
    edges = {
      lines = { { id = "e_default", text = "Because those who come to me are mostly the Sisters of Elune and the druids of the Enclave, and neither is easy in the spilling of blood. A blunt weapon lets them turn an attacker aside and still, sometimes, leave him living." } },
      choices = {
        { text = "Does an enemy deserve that care?", next = "care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = { { id = "c_default", text = "The demons did not, and I never lost sleep over one of them. But a furbolg driven mad by a sickness in the land was a neighbour once, and I think it matters that we remember so while we defend ourselves." } },
      choices = { { text = "That gives me something to think on. Something else.", next = "BACK" } },
    },
    brutal = {
      lines = { { id = "b_default", text = "It can be, in a careless hand, and I will not pretend otherwise. Yet it is honest, since it needs no sharpening and no poison, and it does exactly as much harm as the arm behind it intends." } },
      choices = { { text = "Honest is one word for it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have supplied the Temple and the Enclave for many years. They are gentle customers with heavy purchases." } },
    _none = { { id = "tp_none", text = "I am sorry, I cannot help you there. Perhaps the Sisters at the Temple could." } },
  },
}

-- Turian: thrown weapons merchant.
P:NPC {
  key = "dar_turian", id = TODO_NPC("Turian"), name = "Turian", title = "Thrown Weapons Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "playful", "keen" }, values = { "precision", "practice" },
  notices = { "class", "race" },
  impression = {
    first = "Turian sells throwing knives and throwing axes, and there is a much-scarred wooden post at the back of his shop. He has a habit of flipping a small knife end over end while he talks, and never once looks at it.",
    third = "{name} met Turian, the thrown weapons merchant of the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met! Everything in this shop is meant to leave your hand at speed, so do mind where you point it." },
    { id = "g_back", when = { metBefore = true }, text = "You are back for more, which means that you have been missing, or else hitting and not going to fetch them." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue always wants a few knives that will not be missed when they are gone. I keep them balanced and plain, and I do not ask after their targets." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I have heard that your people throw axes for sport at feasts, and I would dearly love to see whether that is true." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Turian is my name, and throwing is my trade. Landria will sell you a bow and be right to, but a bow needs two hands and a moment, and there are times when you have only the one hand and no moment at all." } },
      again = {
        { id = "h_again", text = "What else? I can talk and juggle, as you see." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "How does one learn to throw well?", next = "learn" },
        { text = "That post has seen hard use.", next = "post" },
        { text = "Aim true, Turian.", next = "END" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "You throw ten thousand times at something that does not move, and then you begin to learn. The wrist does very little, whatever people believe, because the whole arm is the bowstring and the knife is only the arrow." } },
      choices = {
        { text = "And when the target moves?", next = "moves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moves = {
      lines = { { id = "m_default", text = "Then you throw at where it means to be, which is a matter of reading the creature and not of the arm at all. Hunters understand that at once, and warriors usually need it explained with a few lost axes." } },
      choices = { { text = "I'll try not to lose many. Something else.", next = "BACK" } },
    },
    post = {
      lines = { { id = "p_default", text = "It is the fourth I have had since I opened on this terrace. I test every knife before I sell it, because one that tumbles badly is worse than no knife, and I would be ashamed to learn of it from a customer." } },
      choices = { { text = "A careful merchant. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have thrown knives since I was a child, mostly at things my mother wished I would leave alone." } },
    _none = { { id = "tp_none", text = "That one flew straight past me, friend. Try somebody with a longer reach." } },
  },
}

-- Vinasia: cloth armor merchant.
P:NPC {
  key = "dar_vinasia", id = TODO_NPC("Vinasia"), name = "Vinasia", title = "Cloth Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "serene", "attentive" }, values = { "grace", "devotion" },
  notices = { "class" },
  impression = {
    first = "Vinasia sells cloth armor, soft things in the colours of moonlight and leaf-shadow. She folds each piece away with a care that is close to reverence.",
    third = "{name} met Vinasia, who sells cloth armor on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore. Please come in, and touch whatever you like, for cloth should be chosen by the feel of it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I am glad of it. The moon has turned since we last spoke, and I have new pieces to show you." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You serve at an altar, I think, whichever one it may be. I keep my finest weave for those who do, and you are welcome to see it." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You will find little here to wear in battle, I fear. Even so, a soldier needs something soft for the hours when the armor comes off." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Vinasia. I sell cloth for those whose strength is not in their arms, such as the Sisters, the healers and the scholars who have come to us from across the sea." } },
      again = {
        { id = "h_again", text = "Is there more you would ask?" },
        { id = "h_again2", text = "Yes? Take your time." },
      },
      choices = {
        { text = "Show me your cloth.", next = "BUSINESS" },
        { text = "Cloth won't stop a blade.", next = "blade" },
        { text = "Where is your cloth woven?", next = "woven" },
        { text = "Elune keep you, Vinasia.", next = "END" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "No, it will not, and I would never tell a customer otherwise. But a priestess who cannot lift her arms for the weight of mail heals no one, and so the best protection I can sell her is the freedom to do her work." } },
      choices = {
        { text = "Then who protects the priestess?", next = "protect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    protect = {
      lines = { { id = "p_default", text = "The Sentinels do, and the Goddess, and whoever among you stands in front. It is an old bargain among my people that the one who mends is guarded by the ones she mends, and it has held for ten thousand years." } },
      choices = { { text = "A bargain worth keeping. Something else.", next = "BACK" } },
    },
    woven = {
      lines = { { id = "w_default", text = "Much of it on the Craftsmen's Terrace, by the tailors there, and some far older than this city. Our weavers work slowly, since a bolt may take a season, and I think you can feel the patience in it." } },
      choices = { { text = "I can, now you say it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I once served in the Temple, and I serve it still, in a quieter fashion." } },
    sisterhood_of_elune = { { id = "tp_sis", text = "The Sisters guide us, as they always have. I am honoured to clothe them." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. The priestesses at the Temple are wiser than I am." } },
  },
}

-- Yldan: bag merchant.
P:NPC {
  key = "dar_yldan", id = TODO_NPC("Yldan"), name = "Yldan", title = "Bag Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "amused", "easygoing" }, values = { "thrift", "simplicity" },
  notices = { "race", "class" },
  impression = {
    first = "Yldan sells bags and is quietly amused by how much everybody seems to need to carry. He owns, as far as anyone can tell, a single small satchel of his own.",
    third = "{name} met Yldan, the bag merchant of the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, friend. Your pack is straining at the seams, so I think I can guess why you have come." },
    { id = "g_back", when = { metBefore = true }, text = "Full again already? You gather things faster than a squirrel before the frost." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Your people carry more tools than a whole terrace of craftsmen, and I have never understood where you keep them all." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter needs a quiver before a satchel. I have both, and I will not sell you the second until you have the first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Yldan, and I sell bags. For most of my life a night elf owned a bow, a cloak and whatever would fit in one pouch, and now I cannot stitch satchels fast enough to keep up." } },
      again = {
        { id = "h_again", text = "Something else, friend?" },
        { id = "h_again2", text = "Go on. I have room for another question." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What changed?", next = "changed" },
        { text = "What do you carry yourself?", next = "carry" },
        { text = "Travel light, Yldan.", next = "END" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "The world came calling, and it arrived with luggage. Adventurers from the Eastern Kingdoms pick up every pelt, stone and broken blade they pass, and our own young ones have caught the habit from them." } },
      choices = {
        { text = "Is that such a bad habit?", next = "habit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    habit = {
      lines = { { id = "ha_default", text = "It is not bad, only heavy. I have seen travellers too laden to run from a nightsaber, and I have sold them a larger bag afterwards, which I suppose makes me part of the trouble." } },
      choices = { { text = "At least you're honest about it. Something else.", next = "BACK" } },
    },
    carry = {
      lines = { { id = "ca_default", text = "A needle, a spool of thread, a little bread and a river stone my daughter once gave me. Everything else I have ever needed was either growing nearby or could be borrowed from a neighbour." } },
      choices = { { text = "I envy you that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I stitch bags and sell them. I own one, and it is not very large." } },
    _none = { { id = "tp_none", text = "I carry no knowledge of that, friend, and I try not to carry what I do not need." } },
  },
}
