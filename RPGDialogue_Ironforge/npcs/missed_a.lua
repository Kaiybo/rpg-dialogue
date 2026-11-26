-- Ironforge folk the first passes missed (A to Bromiir): the third auctioneer, two more Stonemantle bankers,
-- Finespindle's Leather Goods, the Commons' reagents and heavy armour, the Fighting Wizard, Stoneblade's,
-- Goldfury's guns, a gnome warlock in Runes and Dooms, the Keymaster and the fishing promoter.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Auctioneer Buckler: dwarf auctioneer in the Commons, beside Redmuse and Lympkin.
P:NPC {
  key = "if_buckler", id = TODO_NPC("Auctioneer Buckler"), name = "Auctioneer Buckler", gender = "male",
  bible = "bibles/missed_a.md", role = "auctioneer", tier = "service",
  communities = { "ironforge" }, temper = { "loud", "cheerful" }, values = { "practical", "fair" },
  notices = { "craft" },
  impression = {
    first = "Auctioneer Buckler has a voice built for calling lots across a full hall, and he uses it even when the buyer is standing a foot away. He loves a good bidding war the way other dwarves love a good brawl.",
    third = "{name} met Auctioneer Buckler, who calls lots at the Ironforge auction house.",
  },
  greetings = {
    { id = "g_default", text = "Step up, step up, {class}! If it can be mined, forged, skinned or brewed, somebody in this hall is sellin' it, and I'll find ye the lot." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning bidder! I like those best, for they've already learned what the deposit costs." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've rock dust on yer sleeves, so ye're a miner. Bring yer bars to me before ye bring them to a smith, for the hall pays better than any one buyer will." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Buckler, at yer service! Redmuse keeps the ledger straight and wee Lympkin does the sums, and I do the shoutin', which suits all three of us." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Auctioneer Buckler, at yer service! I'll lean down so ye needn't shout, friend gnome, for Lympkin tells me the counter's a wee bit high for yer folk." },
      },
      again = {
        { id = "h_again", text = "What else can I call for ye?" },
        { id = "h_again2", text = "Go on, then, the hall's nae quiet but I can hear ye." },
        { id = "h_again_x0", when = { profession = "Mining" }, text = "Back with more bars, miner? Bring them here, and let the hall decide what they're worth." },
      },
      choices = {
        { text = "What sells best in Ironforge?", next = "sells" },
        { text = "You enjoy this work, I can tell.", next = "enjoy" },
        { text = "How do the three of you share the hall?", next = "three" },
        { text = "What's the grandest lot you've ever called?", next = "grand" },
        { text = "Do goblins sell through your hall?", next = "goblins" },
        { text = "Does cloth sell well here?", next = "cloth", when = { profession = "Tailoring" } },
        { text = "Is Lympkin a gnome from Gnomeregan too?", next = "BACK", when = { race = "Gnome" }, reply = "Aye, came up wi' the first refugees and walked straight to the counter. She's the quickest pair of hands in the hall, and she knows it." },
        { text = "I'll look over the lots.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Ore and bars, always, for there's a mountain under us and every smith at the Great Forge is hungry. After that it's leather from the snows and anything a gnome has bolted together, though I'll nae vouch for what the gnome things do." } },
      choices = {
        { text = "And what never sells?", next = "never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Grey rubbish priced like mithril, and there's a fresh heap of it every morning. A seller who thinks the hall owes him a fortune loses his deposit and learns somethin', and I count that a fair trade." } },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
    enjoy = {
      lines = { { id = "e_default", text = "Aye, I do, and I'll nae pretend otherwise! Two buyers who both want the same axe will pay double what it's worth out of pure dwarven stubbornness, and it warms my heart every time." } },
      choices = { { text = "Stubbornness is good for trade. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    three = {
      lines = { { id = "t_default", text = "Redmuse has been at it longest and she's the sharpest of us, so when she says a price is daft, it's daft. Lympkin came up from Gnomeregan with nothin' but a head for numbers, and I'd nae trade either of them for a cask of Thunderbrew." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grand = {
      narr = "He spreads his arms wide, as if the whole hall were still listening.",
      lines = { { id = "xgrand_default", text = "A runed hammer off a Dark Iron captain, brought in by a pair of adventurers who'd been to Blackrock and back. Two smiths and a senator's nephew bid on it till the hall went silent, and I called it in a voice that cracked a lamp." } },
      choices = {
        { text = "Who won it?", next = "won" },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "xwon_default", text = "The senator's nephew, and he paid three times what it was worth, out of pure stubbornness and because the smiths wouldnae back down. I've never been prouder of a bidding war, nor a wee bit more ashamed." } },
      choices = {
        { text = "Ashamed? Why?", next = "ashamed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashamed = {
      lines = { { id = "xashamed_default", text = "Because I could have called it closed sooner and let the lad keep his coin. Redmuse says a bidder's pride is his own lookout, and I say an auctioneer ought to cool a hot head now and then. Who's right?" } },
      choices = {
        { text = "Cool them down. A fair hall protects its bidders.", next = "BACK", reply = "Aye, that's my conscience talking too. I'll mind it next time, though it'll cost me a grand afternoon.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A bidder's pride is his own business.", next = "BACK", reply = "That's Redmuse's view, and she's kept this hall afloat longer than I have. Still, I'll not sleep easier for it.", fx = { align = { honor = -1 } } },
      },
    },
    goblins = {
      lines = { { id = "xgoblins_default", text = "Not here, for this is an Ironforge hall and every lot goes to Alliance folk. If ye want to trade across the lines, ye'll need the goblins' own hall in Gadgetzan, and ye'll pay their cut for the privilege." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "xcloth_default", text = "Linen and wool by the stack, aye, for every tailor wants more than they can cut. Bandages, too, sell faster than I can call them, which tells ye something about the folk who come through this hall." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK", reply = "Do. A sharp seller watches what the hall wants." } },
    },
  },
  topics = {
    commons = { { id = "tp_xcommons", text = "The Commons is the busiest ward in the city, and my hall's the loudest corner of it." } },
    gadgetzan = { { id = "tp_xgadgetzan", text = "The goblins run their own hall in Gadgetzan, where Horde and Alliance bid side by side. I'd like to hear it, once." } },
    background = { { id = "tp_bg", text = "I've called lots in the Commons since my beard was short, and I've the lungs to show for it." } },
    _none = { { id = "tp_none", text = "That's nae on my lot sheet, friend. Ask Redmuse, for she hears everything that crosses this hall." } },
  },
}

-- Bailey Stonemantle: banker in the Vault of Ironforge; one of the Stonemantle family.
P:NPC {
  key = "if_bailey", id = TODO_NPC("Bailey Stonemantle"), name = "Bailey Stonemantle", gender = "male",
  bible = "bibles/missed_a.md", role = "banker", tier = "service",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "careful", "loyal" },
  notices = { "purse" },
  impression = {
    first = "Bailey Stonemantle counts coin with a grin, as if every deposit were a small show put on for the customer. For all the cheer, he has never been a copper out in his life.",
    third = "{name} met Bailey Stonemantle, a banker in the Vault of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Vault of Ironforge, {class}! There's a mountain between yer gold and any thief, and a Stonemantle between the thief and the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Yer box is right where ye left it, and I'd be ashamed if it weren't." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse to carry about the Commons, friend. Leave the better part of it with us, for the Vault has never lost a coin and the road loses plenty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bailey Stonemantle, banker. My brother Barnum is the serious one at the next window, so if ye want yer gold counted with a smile, ye've come to the right Stonemantle." },
      },
      again = {
        { id = "h_again", text = "Anything more I can do for ye?" },
        { id = "h_again2", text = "Aye, go on, the ledger will wait a moment." },
      },
      choices = {
        { text = "How many Stonemantles work here?", next = "family" },
        { text = "How safe is the Vault, truly?", next = "safe" },
        { text = "You seem cheerful for a banker.", next = "cheer" },
        { text = "What's the strangest thing anyone's deposited?", next = "xb_odd" },
        { text = "Do you trust gnomes with ledgers?", next = "xb_gnome", when = { race = "Gnome" } },
        { text = "Just my box, thank you.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Four of us, and it's been Stonemantles at these windows for longer than anyone's kept count. Barnum and Soleil work the counters with me, and Dinita administers the whole Vault, which means she tells the three of us what we've done wrong." } },
      choices = {
        { text = "Does she find much wrong?", next = "dinita" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dinita = {
      lines = { { id = "d_default", text = "With Barnum, never, and with me, about once a day. She says a banker who jokes makes the customers nervous, and I say a banker who doesn't makes them miserable, so we've agreed to disagree till one of us retires." } },
      choices = { { text = "I hope it's a long wait. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    safe = {
      lines = { { id = "s_default", text = "It's cut into the living rock of the mountain, with doors a siege engine couldnae dent and locks Brombar the Keymaster looks over himself. Ragnaros could boil the whole Great Forge dry and yer gold would still be sittin' here, a wee bit warm." } },
      choices = { { text = "That's comfort enough. Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "Why wouldn't I be? I spend my days surrounded by gold and none of the worry of ownin' it, which is the best arrangement a dwarf ever struck." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xb_odd = {
      lines = {
        { id = "xbo_default", text = "Och, that's easy. A Wildhammer once left us a gryphon feather the length of my arm and made me swear it'd nae be bent. I've checked it every week for three years, and it's straighter than Barnum." },
      },
      choices = {
        { text = "Did he ever come back for it?", next = "xb_odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xb_odd2 = {
      lines = {
        { id = "xbo2_default", text = "Nae yet, and that's the trouble with the Vault, friend. Folk put things in for safekeepin' and then the road keeps them instead. We've boxes down here older than me, and nobody left to open them." },
      },
      choices = {
        { text = "What happens to a box nobody claims?", next = "xb_unclaimed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xb_unclaimed = {
      lines = {
        { id = "xbu_default", text = "By the old law it sits a hundred years, and then it goes to the Crown. Dinita follows the law to the letter. I'd sooner hunt down a grandchild and hand it over myself, but I'm only a banker at a window." },
      },
      choices = {
        { text = "The law is the law. Dinita is right.", next = "BACK", reply = "Aye, and that's why she runs the Vault and I tell the jokes. I'll nae pretend ye're wrong.", fx = { align = { order = 1 } } },
        { text = "Find the grandchild. Kin matters more than the Crown.", next = "BACK", reply = "Ha, ye've a soft heart for a stranger. Keep it quiet, but I've done it twice already.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xb_gnome = {
      lines = {
        { id = "xbg_default", text = "Trust them? I'd hire one tomorrow if Dinita let me. The gnomes that came up after Gnomeregan fell keep accounts like they're buildin' a clock, every figure fitted just so. It shames a few of the dwarves in this hall, and it ought to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "A sad business. Half the gnomes who bank with us now came up with nothin' but the clothes they wore, and we opened their boxes free of charge." } },
    magni = { { id = "tp_magni", text = "The King banks here, same as anyone, though I'll nae tell ye what's in his box. I'll say it's heavy." } },
    background = { { id = "tp_bg", text = "Born a Stonemantle, so I was always going to be a banker. I never minded, for it's honest work and it's warm in here." } },
    _none = { { id = "tp_none", text = "I only know what's in the ledgers, friend, and the ledgers are private. Try the Commons for gossip." } },
  },
}

-- Barnum Stonemantle: banker in the Vault of Ironforge; kin to Bailey, Soleil and Dinita.
P:NPC {
  key = "if_barnum", id = TODO_NPC("Barnum Stonemantle"), name = "Barnum Stonemantle", gender = "male",
  bible = "bibles/missed_a.md", role = "banker", tier = "service",
  communities = { "ironforge" }, temper = { "grave", "exact" }, values = { "careful", "dutiful" },
  notices = { "purse" },
  impression = {
    first = "Barnum Stonemantle handles other people's gold as solemnly as a priest handles a relic. He counts everything twice, and the second count has never once disagreed with the first.",
    third = "{name} met Barnum Stonemantle, a banker in the Vault of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Good day to ye, {class}. State yer business plainly and I'll see to it properly, for that's how the Vault has always been run." },
    { id = "g_back", when = { metBefore = true }, text = "Yer account is in order, as it was when ye left it. What will it be today?" },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 10000 } },
      text = "A light purse is nae shame, friend. Every great hoard under this mountain began as a single coin that somebody had the sense to put away." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Barnum Stonemantle, banker of the Vault. My family has kept Ironforge's gold for generations, and in all that time nae a single coin has gone astray, so I'll thank ye to be patient while I count." },
      },
      again = {
        { id = "h_again", text = "Is there somethin' further?" },
        { id = "h_again2", text = "Go on, and I'll mark my place in the ledger." },
      },
      choices = {
        { text = "Never a single coin lost?", next = "lost" },
        { text = "Your brother seems the merrier one.", next = "bailey" },
        { text = "What do folk keep here besides gold?", next = "keep" },
        { text = "How does a family keep a trust so long?", next = "xn_trust" },
        { text = "A dwarf should know how the Vault was built.", next = "xn_dwarf", when = { race = "Dwarf" } },
        { text = "My box, please.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "Never, and I'd stake my beard on it. The Vault stood through the War of the Three Hammers and both wars against the orcs, and every box was accounted for when the doors opened again." } },
      choices = {
        { text = "What would happen if one were?", next = "ifone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ifone = {
      lines = { { id = "i_default", text = "Then a Stonemantle would make it good from his own pocket and resign his window by nightfall. It has never come to that, and while Dinita administers the Vault I do nae believe it ever will." } },
      choices = { { text = "A hard standard. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bailey = {
      lines = { { id = "b_default", text = "Bailey jokes with the customers, aye, and they seem to like it. I'll say this for him, that his sums are as good as mine, or I'd have had words with him long ago." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = {
        { id = "k_default", text = "Deeds, heirlooms, a grandfather's hammer, and a good many things I do nae ask about. What's in a customer's box is the customer's business, and I only see to it that it's still there." },
        { id = "k_dwarf", when = { race = "Dwarf" }, text = "What our folk always keep, {g:lad|lass}: a grandfather's hammer, a clan seal, the deed to a seam somebody means to dig one day. I do nae ask, and I only see to it that it's still there." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xn_trust = {
      lines = {
        { id = "xnt_default", text = "By never once makin' an exception. Every Stonemantle learns the rules before the letters, and the first rule is that the gold is nae ours, nae a copper of it, nae for a single night." },
      },
      choices = {
        { text = "Has anyone in the family broken that rule?", next = "xn_broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xn_broke = {
      lines = {
        { id = "xnb_default", text = "One, in my grandfather's time. A cousin borrowed from a box to pay a debt and meant to put it back by morning. He did put it back, every coin, and he was struck from the ledger all the same." },
      },
      choices = {
        { text = "That seems harsh, if he repaid it.", next = "xn_harsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xn_harsh = {
      lines = {
        { id = "xnh_default", text = "Harsh, aye, and right. If the Vault forgives one borrowed night, then every Stonemantle after him gets to wonder whether his own night might be forgiven too. I'd rather be harsh than wonder." },
      },
      choices = {
        { text = "A trust that bends once is broken. You're right.", next = "BACK", reply = "I'm glad ye see it. Most folk call me cold, and I'd sooner be called that than careless.", fx = { align = { order = 1 } } },
        { text = "He made it right. Mercy has a place in any ledger.", next = "BACK", reply = "Perhaps in yer ledger, friend. Nae in this one, though I'll grant ye mean it kindly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xn_dwarf = {
      lines = {
        { id = "xnd_default", text = "Then hear it from a Stonemantle. The Vault was cut by the same masons who carved the Great Forge, in the days of Modimus Anvilmar, and the deepest boxes sit lower than the Forlorn Cavern. Our clan has kept the keys since the first coin was counted." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    great_forge = { { id = "tp_forge", text = "The Forge keeps the city warm and the Vault keeps it honest. I'd argue mine is the harder task." } },
    dark_iron = { { id = "tp_darkiron", text = "Nae Dark Iron has ever held an account here, and while I stand at this window, none ever will." } },
    background = { { id = "tp_bg", text = "I've stood at this window since I was old enough to see over it. I've never wished for another trade." } },
    _none = { { id = "tp_none", text = "That is nae a banking matter, and so it is nae mine. Good day to ye." } },
  },
}

-- Barrus: fishing promoter in the Commons, handing out fliers for the Stranglethorn Fishing Extravaganza.
P:NPC {
  key = "if_barrus", id = TODO_NPC("Barrus"), name = "Barrus", gender = "male",
  bible = "bibles/missed_a.md", role = "promoter", tier = "quest",
  communities = { "ironforge" }, temper = { "eager", "loud" }, values = { "sporting" },
  notices = { "craft" },
  impression = {
    first = "Barrus stands in the Commons with a fistful of fliers and the look of a dwarf who has found the one thing he loves more than ale. He will talk about fish to anyone who slows down.",
    third = "{name} met Barrus, who promotes the Stranglethorn Fishing Extravaganza in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}! Have ye heard about the Fishin' Extravaganza down in Stranglethorn, or must I tell ye the whole glorious thing?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back, so ye must be thinkin' about it. Good, for the tastyfish will nae wait for the timid." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Now there's a body who knows which end of a pole to hold! Ye've the patient look of an angler, and that's exactly who I'm after." },
  },
  start = "hello",
  nodes = {
    ba_dwarf = {
      lines = { { id = "bad_default", text = "Do they now! Then ye'll ken the trick of a cold lake at dawn, and that's half the battle. Tell them from me that the Stranglethorn coast is warmer, and the fish bite back." } },
      choices = { { text = "I'll pass it on. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ba_gnome = {
      lines = { { id = "bag_default", text = "Ha! I've seen gnomish poles, {g:lad|lass}, and one of them took a fellow's eyebrows off in Thelsamar. The contest wants a steady hand and a good lure, though if yers cast farther I'll nae stop ye." } },
      choices = { { text = "Mine probably won't explode. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Barrus is the name, and fishin' is the game. The goblins of Booty Bay are holdin' a grand contest along the Stranglethorn coast, and I'm here to see that Ironforge sends its best poles south." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye? I've fliers enough for the whole Commons." },
        { id = "h_again2", text = "Go on, ask, for I could talk fish all day." },
      },
      choices = {
        { text = "Could I get a fishing flier?", next = "flier" },
        { text = "How does the contest work?", next = "contest" },
        { text = "A dwarf promoting a goblin contest?", next = "goblins" },
        { text = "Dwarves aren't known for fishing.", next = "dwarves" },
        { text = "My kin fish Loch Modan every summer.", next = "ba_dwarf", when = { race = "Dwarf" } },
        { text = "A gnome could build a better fishing pole.", next = "ba_gnome", when = { race = "Gnome" } },
        { text = "Not for me. Good day.", next = "END" },
      },
    },
    flier = {
      lines = { { id = "f_default", text = "That ye can, and gladly. It has the day, the place and the rules on it in good plain letters, so read it over a pint and then go and sharpen yer hooks." } },
      choices = { { text = "I'll read it. Something else.", next = "BACK" } },
    },
    contest = {
      lines = { { id = "c_default", text = "On the day, shoals of tastyfish come thick along the Stranglethorn coast, and every angler from here to Kalimdor goes after them. The first to bring a full catch to Riggle Bassbait in Booty Bay is named master angler, and the rest of us go home with sore arms." } },
      choices = {
        { text = "What chance does a newcomer have?", next = "chance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chance = {
      lines = { { id = "ch_default", text = "A fair one, if ye know the coast before the horn sounds. The clever ones walk the shore the day before and mark where the shoals gather, and the rest run about like headless chickens while the fish are landed around them." } },
      choices = {
        { text = "And the Horde fishes the same water?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Aye, the same shoals, for the goblins take anyone's entry and call it good business. Keep one eye on yer float and the other on the tree line, for a troll with a spear cares nothin' for sportin' rules." } },
      choices = { { text = "I'll watch the trees. Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "goblins_default", text = "They pay me in fliers and the joy of the thing, and I'd do it for less. A goblin will sell ye yer own boots, I know it well, but they run a straight contest because a crooked one would draw nae anglers the week after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "And that's the shame I mean to mend! We've Loch Modan at our door and the Forlorn Cavern's own pool under our feet, where old Grimnur teaches the craft, yet folk think a dwarf only knows what's under a rock." } },
      choices = { { text = "Then I wish you a good catch. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've fished every water from Loch Modan to the Cape of Stranglethorn, and the Cape is the finest of them, pirates and all." } },
    _none = { { id = "tp_none", text = "If it doesnae have fins, I've nae much to say on it. Ask me about the contest instead!" } },
  },
}

-- Bingus: gnome weapon merchant in the Fighting Wizard, Mystic Ward.
P:NPC {
  key = "if_bingus", id = TODO_NPC("Bingus"), name = "Bingus", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "fussy" }, values = { "precise" },
  notices = { "class" },
  impression = {
    first = "Bingus sells staves and daggers to people who would rather not have to use them, and he has measured the balance point of every one. He talks about a quarterstaff the way an engineer talks about a load-bearing strut.",
    third = "{name} met Bingus, a gnome who sells weapons at the Fighting Wizard in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Fighting Wizard! Everything on this wall is weighted for a caster's arm, and I can give you the exact figures if you'd like them." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Has the last one held up, or have you come to tell me about a structural failure?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A spellcaster, splendid, you're precisely who the shop is for. You'll want something light enough that your casting hand isn't tired when it matters." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Oh dear, a warrior. I'm afraid nothing here will survive what you'd do to it, so you may want Timberline Arms in the Military Ward instead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Bingus, and I handle the staves and blades, while Harick over there handles the wands. Between the two of us, a wizard can walk out of here prepared for the sixty percent of problems a spell solves and the forty percent it doesn't." },
      },
      again = {
        { id = "h_again", text = "Was there another question? I do like questions." },
        { id = "h_again2", text = "Yes, go on, I've finished counting the daggers." },
      },
      choices = {
        { text = "Why would a wizard need a weapon?", next = "why" },
        { text = "How do you choose a staff?", next = "staff" },
        { text = "A gnome and a dwarf sharing a shop?", next = "harick" },
        { text = "Which wand pairs best with a staff?", next = "xg_pair" },
        { text = "I'm a mage. What should I carry?", next = "xg_mage", when = { class = "MAGE" } },
        { text = "I'll browse the wall.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because spells run out, and troggs, in my experience, do not. I watched some very fine arcanists in Gnomeregan discover that at the worst possible moment, so now I sell the remedy." } },
      choices = { { text = "A hard way to learn it. Something else.", next = "BACK" } },
    },
    staff = {
      lines = { { id = "s_default", text = "You hold it at arm's length for a slow count of thirty, and if the tip dips, it's too heavy for you. Everyone wants the grand one with the crystal on top, and nearly everyone ought to buy the plain ash one beside it." } },
      choices = {
        { text = "And a dagger?", next = "dagger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dagger = {
      lines = { { id = "d_default", text = "A dagger is for the moment something has already got past the staff, so it should be short, simple and where your hand expects it. I recommend the left hip, since most people reach there by instinct in roughly four cases out of five." } },
      choices = { { text = "You've counted that? Something else.", next = "BACK" } },
    },
    harick = {
      lines = { { id = "ha_default", text = "Harick Boulderdrum is the least excitable person I have ever met, which makes him an ideal colleague for a gnome. I supply the enthusiasm, he supplies the long silences, and the shop's accounts balance to the copper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xg_pair = {
      lines = {
        { id = "xgp_default", text = "Ooh, good question! A long staff and a quick wand give you reach and rate of fire, which covers most tactical situations. Harick says you should just pick the one that feels right, which isn't a method, it's a mood." },
      },
      choices = {
        { text = "What happens when a mage gets cornered anyway?", next = "xg_corner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xg_corner = {
      lines = {
        { id = "xgc_default", text = "Then the staff earns its price! Most casters hold it like a candle, but if you set your feet and swing from the hips, even a gnome can crack a kobold's skull. I've drawn a diagram, if you'd like one." },
      },
      choices = {
        { text = "Should casters learn to fight at all?", next = "xg_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xg_fight = {
      lines = {
        { id = "xgf_default", text = "That's the great argument in the Mystic Ward! The old magi say a wizard who swings a stick has already failed. I say a wizard who can't swing a stick will eventually fail somewhere quite dark and quite far from help." },
      },
      choices = {
        { text = "A true mage relies on the arcane alone.", next = "BACK", reply = "Hm, that's the Dalaran view, and very elegant. I'll keep a dagger on the shelf for when elegance runs out.", fx = { align = { order = 1 } } },
        { text = "Use whatever works. Tradition doesn't save lives.", next = "BACK", reply = "Exactly! Practicality is the root of all good engineering, and of most good survival.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xg_mage = {
      lines = {
        { id = "xgm_default", text = "A staff with good intellect weighting, first, and a dagger second for when you've gone dry of mana. Keep the dagger short, because you'll draw it in a panic and a long blade catches on robes. That's tested, I'm sorry to say." },
      },
      choices = {
        { text = "Thanks. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "I had a little workshop in the fourth ring. I think of it whenever something squeaks, which is often." } },
    dalaran = { { id = "tp_dalaran", text = "The magi of Dalaran sniff at a wizard with a dagger. I've sold a dozen to the ones who came through anyway." } },
    background = { { id = "tp_bg", text = "I came out of Gnomeregan with the other refugees, and I've sold a caster's weapons in the Mystic Ward ever since." } },
    _none = { { id = "tp_none", text = "I haven't any data on that, I'm sorry to say. Somebody in the Hall of Mysteries next door might." } },
  },
}

-- Binny Springblade: gnome in Stoneblade's, Forlorn Cavern, beside Hjoldir Stoneblade.
P:NPC {
  key = "if_binny", id = TODO_NPC("Binny Springblade"), name = "Binny Springblade", gender = "female",
  bible = "bibles/missed_a.md", role = "craftsman", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "quick", "cheerful" }, values = { "inventive" },
  notices = { "class" },
  impression = {
    first = "Binny Springblade perches on a stool in Stoneblade's with a dagger in pieces across her lap, as if a knife were just a very simple machine. She talks quickly and never quite stops fiddling.",
    third = "{name} met Binny Springblade, a gnome who keeps company with the blades at Stoneblade's.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a customer! Hjoldir does the selling, so talk to him about prices, but talk to me if you'd like to know how any of it works." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've had this hilt apart three more times since you left, and I think it's finally right." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk very quietly for someone your size. The Forlorn Cavern is full of people who walk like that, and they are our very best customers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Binny Springblade, and no, I didn't choose the name to suit the shop, though I admit it's a happy coincidence. Hjoldir forges and sells the blades, and I keep thinking of ways to improve them, which he bears very patiently." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've plenty of opinions left." },
        { id = "h_again2", text = "Go on, I can talk and fiddle at once." },
      },
      choices = {
        { text = "How would you improve a dagger?", next = "improve" },
        { text = "What does Hjoldir make of your ideas?", next = "hjoldir" },
        { text = "It's a gloomy corner for a gnome.", next = "cavern" },
        { text = "What's your best invention so far?", next = "xy_best" },
        { text = "Could you improve my lockpicks too?", next = "xy_picks", when = { class = "ROGUE" } },
        { text = "I'll speak with Hjoldir.", next = "END" },
      },
    },
    improve = {
      lines = { { id = "i_default", text = "Springs, mostly! A blade that leaps into your hand saves about a third of a second on the draw, and a third of a second is a very long time when somebody is trying to stab you first." } },
      choices = {
        { text = "Has it ever gone wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Once, and the dagger went through the shop sign instead of into my hand, which is why the sign hangs a little crooked. I've adjusted the tension since, and Hjoldir has asked me to test the next one facing the wall." } },
      choices = { { text = "A wise request. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hjoldir = {
      lines = { { id = "hj_default", text = "He says a blade wants good steel and a true edge and nothing else, and he says it about twice a day. Then he quietly makes the hilt a little hollower so my spring will fit, so I don't think he minds as much as he claims." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cavern = {
      lines = { { id = "c_default", text = "It's dim and it's damp, but nobody down here asks a gnome why she's taking knives apart. After Gnomeregan I find I like a place where people mind their own workbench." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xy_best = {
      lines = {
        { id = "xyb_default", text = "The spring-loaded hilt! You squeeze the grip and the blade kicks forward a finger's width, just enough to surprise someone. Hjoldir calls it a toy, but he hasn't stopped testing it, so I'm counting that as a compliment." },
      },
      choices = {
        { text = "Would you sell it?", next = "xy_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xy_sell = {
      lines = {
        { id = "xys_default", text = "Not yet, it fails about one time in twelve, and when it fails the blade goes backwards. I'd like it to fail one time in a thousand before I put it in anyone's hand. Hjoldir says one in a hundred is plenty." },
      },
      choices = {
        { text = "Who's right, you or Hjoldir?", next = "xy_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xy_right = {
      lines = {
        { id = "xyr_default", text = "Well, he says folk down here need an edge today, not a perfect one next year. I say a blade that bites its owner isn't an edge at all. We've been arguing it for a month, and the hilt is still in pieces on my lap." },
      },
      choices = {
        { text = "Wait until it's perfect. People's hands depend on it.", next = "BACK", reply = "Thank you! I'll quote you to Hjoldir, and he'll grunt, and I'll take that as a win.", fx = { align = { honor = 1 } } },
        { text = "Sell it now and warn buyers. Let them choose.", next = "BACK", reply = "Hm, that's a very cavern sort of answer. I suppose folk here do like to choose their own risks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xy_picks = {
      lines = {
        { id = "xyp_default", text = "Oh, quietly, yes. A good pick is just a very small lever with opinions. Bring me yours and I'll file the tension wrench so it stops talking back, but don't mention it near Brombar the Keymaster, please." },
      },
      choices = {
        { text = "My lips are sealed. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "It's dim and damp and nobody asks questions. For a tinker who blows things up now and then, that's ideal." } },
    gnomeregan = { { id = "tp_gnomer", text = "I left with a toolbox and a coat with one sleeve. I've made the other sleeve since, and it has pockets." } },
    background = { { id = "tp_bg", text = "I was a tinker in Gnomeregan, and now I tinker with blades in the Forlorn Cavern, which is mostly the same work with sharper parts." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, unless it has moving parts. Does it have moving parts?" } },
  },
}

-- Brombar Higgleby: the Keymaster, standing close to the forge at the Great Forge.
P:NPC {
  key = "if_brombar", id = TODO_NPC("Brombar Higgleby"), name = "Brombar Higgleby", gender = "male",
  bible = "bibles/missed_a.md", role = "keymaster", tier = "service",
  communities = { "ironforge" }, temper = { "wary", "dry" }, values = { "secretive", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Brombar Higgleby wears a ring of keys that would anchor a gryphon, and he rests one hand on it the whole time he talks. He looks at strangers the way a lock looks at a bent nail.",
    third = "{name} met Brombar Higgleby, the Keymaster of Ironforge, by the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "Aye, they're keys, and nae, ye cannae hold them. Now that's settled, what do ye want with the Keymaster?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The answer about holdin' the keys has nae changed since last time." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know that stare, for ye're countin' the wards on my keys from where ye stand. Count all ye like, {g:lad|lass}, for it's the locks ye'd have to beat, and I cut those too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brombar Higgleby, Keymaster. If there's a door in this city that matters, I cut its lock and I carry its key, and I stand by the forge because good brass wants good heat." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Keep yer hands where I can see them." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "What do all those keys open?", next = "open" },
        { text = "What makes a lock hard to pick?", next = "lock" },
        { text = "It must be a heavy trust to carry.", next = "trust" },
        { text = "How did you become Keymaster?", next = "xk_how" },
        { text = "I'm a smith. Who cast your best lock?", next = "xk_smith", when = { profession = "Blacksmithing" } },
        { text = "I'll keep my hands to myself.", next = "END" },
      },
    },
    open = {
      lines = { { id = "o_default", text = "Some open the Vault's inner doors, some open store-rooms under the Military Ward, and some open things I'll nae name to a stranger. There's one that fits a door in Old Ironforge, and I've turned it perhaps three times in my life." } },
      choices = {
        { text = "What lies in Old Ironforge?", next = "old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = { { id = "ol_default", text = "The old city under the High Seat, where the thanes of the old days lie in their tombs. The lorekeepers see to the halls, but there are doors down there that only my key answers, and that's as much as a keymaster says." } },
      choices = { { text = "Then I'll ask no more. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lock = {
      lines = {
        { id = "l_default", text = "Patience in the makin' of it. Any smith can cast a lock, but the ones that hold are filed by hand till every pin sits a hair different, and a thief has to guess at each of them." },
        { id = "l_smith", when = { profession = "Blacksmithing" }, text = "Ye work metal yerself, so ye'll understand me. Castin' is easy, and it's the filin' by hand, till every pin sits a hair different, that makes a lock a thief has to guess at." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "Heavier than the ring, and the ring's nae light. I've never married and I never drink more than two pints, for a keymaster who talks in his sleep or in his cups is nae keymaster at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xk_how = {
      lines = {
        { id = "xkh_default", text = "By bein' the only apprentice who never once lost a key. Old Keymaster Thorgas tested us. He'd hide a key in our coats while we slept and then ask for it in the mornin'. I always knew where it was." },
      },
      choices = {
        { text = "And when Thorgas retired?", next = "xk_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xk_how2 = {
      lines = {
        { id = "xkh2_default", text = "He didnae retire. He died at his bench with a half-cut key in his hand, and they found every other key accounted for. I finished that last one for him, and it hangs on this ring yet, though the lock it fits is long gone." },
      },
      choices = {
        { text = "Do you ever refuse to open a door?", next = "xk_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xk_refuse = {
      lines = {
        { id = "xkr_default", text = "Aye, when the asker hasnae the right, whoever they are. A thane came down once, drunk and shoutin', and demanded the archive. I told him to come back sober with a writ, and he came back with both, and an apology." },
      },
      choices = {
        { text = "Good. Rank shouldn't open doors that law keeps shut.", next = "BACK", reply = "That's it exactly. A key that turns for anyone loud enough is nae a key at all.", fx = { align = { order = 1 } } },
        { text = "Some doors deserve opening, writ or no writ.", next = "BACK", reply = "Hmph. That's the talk of folk who end up meetin' the guards, but I'll nae pretend I've never wondered.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xk_smith = {
      lines = {
        { id = "xks_default", text = "I cast the brass myself, and I'd trust nae other smith with it. The trick is a slow cool in sand, so the metal doesnae warp. Ye'd know the feel of it, a smith would." },
      },
      choices = {
        { text = "I would. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    great_forge = { { id = "tp_forge", text = "There's nae heat in Azeroth like the Great Forge for brass. That's why I stand here and nae elsewhere." } },
    magni = { { id = "tp_magni", text = "Aye, I hold keys the King himself uses. Nae, I'll nae say which." } },
    background = { { id = "tp_bg", text = "I was a locksmith's apprentice before I was Keymaster, and I've spent my whole life beside this forge." } },
    _none = { { id = "tp_none", text = "If I knew, I'd nae say, and as it happens I do nae know. That's two locks on the one door." } },
  },
}

-- Bromiir Ormsen: heavy armor merchant in the Commons.
P:NPC {
  key = "if_bromiir", id = TODO_NPC("Bromiir Ormsen"), name = "Bromiir Ormsen", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "hearty", "blunt" }, values = { "proud", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Bromiir Ormsen raps his knuckles on every breastplate he sells, to let the customer hear what good steel sounds like. He judges people by how they stand in armour, and he judges quickly.",
    third = "{name} met Bromiir Ormsen, who sells heavy armour in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Plate and mail, {class}, forged under this very mountain! Stand up straight and let me see what ye could carry." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece, I see, so the armour did its work. What needs replacin'?" },
  },
  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's a pair of shoulders made for plate! Ye'll nae find better steel than mine between here and Stormwind, and I've been to Stormwind." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By my beard, yer gear looks as though a trogg's been chewin' on it. See a smith about the mendin' before ye buy a single new piece, for there's nae sense in polishin' half a ruin." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye're a robe-wearer, friend, and I've nothin' here ye could lift, let alone walk in. Maeva's in the Mystic Ward is the shop ye want." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bromiir Ormsen, heavy armour. A dwarf who goes to war without good steel on his back comes home on a shield, so I sell the steel and I sleep well at night." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye?" },
        { id = "h_again2", text = "Aye, go on, {class}." },
      },
      choices = {
        { text = "How do I know good steel?", next = "steel" },
        { text = "Plate or mail, for a long march?", next = "march" },
        { text = "Who forges what you sell?", next = "forge" },
        { text = "What was the Second War like?", next = "xm_war" },
        { text = "I'm a paladin. Will your plate take a blessing?", next = "xm_pal", when = { class = "PALADIN" } },
        { text = "I'll look it over.", next = "END" },
      },
    },
    steel = {
      lines = { { id = "s_default", text = "Ye listen to it. Good plate rings clean when ye knock it, like a bell with a short temper, and bad plate gives a dull clank, as if it's already sorry for itself." } },
      choices = {
        { text = "And if I can't hear the difference?", next = "hear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = { { id = "he_default", text = "Then look where the plates join, for a lazy smith hides his shame in the rivets. If they're set even and flush, the rest was made with care, and if they wander about like sheep, put it back on the rack." } },
      choices = { { text = "Rivets like sheep. I'll remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    march = {
      lines = { { id = "m_default", text = "Mail, if ye must walk all day and fight at the end of it, for plate on a long road will wear ye out before the enemy can. But if ye're standin' in a tunnel mouth with troggs comin', ye'll want every pound of plate ye can bear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "f_default", text = "The smiths of the Great Forge, every piece, and I can tell ye which anvil most of it came off. I'll nae sell Stormwind plate, for they make it thin to look handsome on parade, and a parade is all it's good for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xm_war = {
      lines = {
        { id = "xmw_default", text = "Cold and loud and long. I stood in a shield wall at the Thandol Span when the Horde came north, and I learned there that good plate is nae about lookin' grand. It's about bein' alive at sundown." },
      },
      choices = {
        { text = "You held the bridge?", next = "xm_war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xm_war2 = {
      lines = {
        { id = "xmw2_default", text = "We held it long enough. A grunt's axe split my pauldron clean, and the shoulder under it was barely bruised, because Thorgrum Flintbeard forged it and he never cut a corner. I've sold steel ever since, so others get the same luck." },
      },
      choices = {
        { text = "Do you still think about the orcs?", next = "xm_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xm_orcs = {
      lines = {
        { id = "xmo_default", text = "Most days. They're penned up in camps now, and some say they ought to be let go, that the fight's gone out of them. Maybe, but I remember the bridge." },
      },
      choices = {
        { text = "Keep them penned. The Alliance can't take the risk.", next = "BACK", reply = "Aye, that's my thinkin', and I'll nae apologise for it.", fx = { align = { light = -1 } } },
        { text = "Even orcs can change. The camps can't last forever.", next = "BACK", reply = "Ye've a kinder heart than mine, {class}. I hope ye're right, I truly do.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xm_pal = {
      lines = {
        { id = "xmp_default", text = "It will, and it'll thank ye for it. Good steel holds the Light the way it holds an edge, and I've had priests of the Cathedral swear our plate glows a touch brighter. I've nae seen it, but I'll nae argue with a priest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    second_war = { { id = "tp_war", text = "I carried a shield in it and I'll carry the memory longer. Ask me over an ale, nae over a counter." } },
    thandol_span = { { id = "tp_span", text = "I stood on that bridge once with the whole Horde comin' at it. Keep it in good repair, I say, whatever it costs." } },
    background = { { id = "tp_bg", text = "I carried a shield in the Second War, and I've sold armour in the Commons ever since I put it down." } },
    _none = { { id = "tp_none", text = "I sell steel, friend, nae stories. Ask at the Stonefire Tavern, for they've plenty of the other." } },
  },
}
