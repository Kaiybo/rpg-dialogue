-- The Commons' trade: the auction house, the general store, the Visitor's Center (guild master, tabards) and the Vault.
-- Voices: bibles/commons_trade.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Auctioneer Redmuse: dwarf auctioneer in the Commons; knows the market's moods.
P:NPC {
  key = "if_redmuse", id = TODO_NPC("Auctioneer Redmuse"), name = "Auctioneer Redmuse",
  bible = "bibles/commons_trade.md", role = "auctioneer", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "sharp" }, values = { "practical", "honest" },
  notices = { "purse" },

  impression = {
    first = "Auctioneer Redmuse reads the Commons like a weather-glass, and can tell what copper will fetch before the miners have washed their hands. She is blunt about prices and kind about nothing else.",
    third = "{name} met Auctioneer Redmuse, who runs bids at the Ironforge auction house.",
  },

  greetings = {
    { id = "g_default", text = "Buyin' or sellin'? Either way, mind the deposit, for the house keeps it if yer goods don't move." },
    { id = "g_back", when = { metBefore = true }, text = "Back tae see if yer bids came good? Let's have a look at the ledger, then." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Ye're carryin' a heavy purse, by the way ye stand. Spend it slowly here, for the sharp sellers can smell gold from across the Commons." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Redmuse, auctioneer o' the Ironforge house. What ye list wi' me is seen in Stormwind an' Darnassus as well, so if somebody somewhere wants it, they'll find it." },
        { id = "h_evening", when = { timeOfDay = "night" },
          text = "Evenin's the busy time, when the miners an' the adventurers come in at once an' all want tae sell the same ore. Ye'd do better tae list in the mornin', if ye can wait." },
      },
      again = {
        { id = "h_again", text = "What else? The ledger's open." },
        { id = "h_again2", text = "Ask away, while there's a lull." },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "How does the house work?", next = "how" },
        { text = "What sells best in Ironforge?", next = "sells" },
        { text = "Who's the gnome working beside you?", next = "lympkin" },
        { text = "I'm a crafter. What do buyers want from me?", next = "k_craft", when = { profession = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" } } },
        { text = "Good trading, Redmuse.", next = "END" },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "Ye pay a wee deposit tae list, an' ye name a startin' bid an' a buyout if ye like. If it sells, the house takes its cut an' sends ye the rest by post, an' if it doesnae, ye get yer goods back an' the deposit's gone." },
      },
      choices = {
        { text = "Why keep the deposit if nothing sells?", next = "how_deposit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_deposit = {
      lines = {
        { id = "hd_default", text = "Because otherwise every fool in the city would list a single linen scrap at a hundred gold, just tae see. The deposit keeps the hall clear for folk who mean tae trade." },
      },
      choices = {
        { text = "A fair rule keeps a fair market.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A rule like that only protects the house.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    sells = {
      lines = {
        { id = "se_default", text = "Ore an' bars, always, for there's a forge in the middle o' the city that never cools. After that it's linen an' wool for bandages, an' anythin' that'll help a new adventurer live past Dun Morogh." },
        { id = "se_miner", when = { profession = { "Mining" } },
          text = "Ore, an' ye'll know it better than me, wi' that pick on yer belt. Tin moves faster than copper this season, for the smiths are makin' bronze for the Military Ward." },
      },
      choices = {
        { text = "Why bronze for the Military Ward?", next = "sells_bronze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_bronze = {
      lines = {
        { id = "sb_default", text = "The Ward's been outfittin' mountaineers for the Loch an' the Wetlands, an' they're short o' everythin' since the Dark Irons took tae raidin' the Thandol Span. I don't ask the quartermasters why; I just watch the prices." },
      },
      choices = {
        { text = "Profiting from a war doesn't sit right with me.", next = "BACK", fx = { align = { honor = 1 }, learn = { "dark_iron", "thandol_span" } } },
        { text = "Somebody has to supply the war. Might as well profit.", next = "BACK", fx = { align = { honor = -1 }, learn = { "dark_iron", "thandol_span" } } },
      },
    },

    lympkin = {
      lines = {
        { id = "ly_default", text = "That's Lympkin, an' she's quicker wi' a sum than any dwarf in this hall, me included. She came up out o' Gnomeregan wi' nothin' but a pencil, an' now half the bids in the Commons go through her." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    k_craft = {
      lines = {
        { id = "kc_default", text = "Buyers want things they can use today, no' things that look grand on a shelf. Make what the new adventurers need, an' price it so they can afford it, an' ye'll sell the lot by the week's end." },
        { id = "kc_ench", when = { profession = { "Enchanting" } },
          text = "Dust an' essences, mostly, for the other enchanters are always short. Ye'd be amazed what folk pay for a pinch o' glowin' powder." },
      },
      choices = {
        { text = "I'd rather price low and sell to everyone.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll price high and wait for the desperate.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've run bids in the Commons since before the gnomes came, an' I'll run them after the last one's gone home tae Gnomeregan, whenever that is." } },
    advice = { { id = "tp_ad", text = "Never sell the day a new mine opens, for everybody else will be sellin' the same thing." } },
    _none = { { id = "tp_none", text = "If it isnae on my ledger, I don't know about it, an' I don't much care." } },
  },
}

-- Auctioneer Lympkin: gnome auctioneer beside Redmuse; quick with sums, a Gnomeregan refugee.
P:NPC {
  key = "if_lympkin", id = TODO_NPC("Auctioneer Lympkin"), name = "Auctioneer Lympkin",
  bible = "bibles/commons_trade.md", role = "auctioneer", tier = "service",
  communities = { "ironforge" }, temper = { "quick" }, values = { "practical", "inventive" },
  notices = { "gnome" },

  impression = {
    first = "Auctioneer Lympkin works out a buyout before the seller has finished naming the goods. She keeps her ledgers in a gnomish shorthand nobody else can read, and seems to like it that way.",
    third = "{name} met Auctioneer Lympkin, a gnome who keeps the books at the Ironforge auction house.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Listing, bidding or browsing? I can do all three at once, if you talk quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I've already worked out what you're going to ask, so go on and ask it." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Oh, another one of us! Which level of the city were you from, before? I was on the third, near the accountancy pumps, though there's not much left of them now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lympkin, auctioneer, and the fastest pencil in the Commons, if I do say so, which I do. What can I tally for you today?" },
      },
      again = {
        { id = "h_again", text = "Next question! I've a column waiting." },
        { id = "h_again2", text = "Go on, I can listen and carry a column of figures at the same time." },
      },
      choices = {
        { text = "Show me what's for sale.", next = "BUSINESS" },
        { text = "How did you come to work here?", next = "how" },
        { text = "Do you miss Gnomeregan?", next = "gnomeregan" },
        { text = "How do I price something sensibly?", next = "price" },
        { text = "I lived through the fall of Gnomeregan too.", next = "k_refugee", when = { origin = "gnome_gnomeregan_refugee" } },
        { text = "Thank you, Lympkin.", next = "END" },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "I came up from Gnomeregan with the rest, and Redmuse caught me correcting her sums on the back of a list. Instead of throwing me out, she gave me a stool, and I've been sitting on it ever since." },
      },
      choices = {
        { text = "That was generous of her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do the dwarves treat you fairly here?", next = "how_fair" },
      },
    },
    how_fair = {
      lines = {
        { id = "hf_default", text = "Mostly, yes, and better than we'd any right to expect, turning up with nothing but our troubles. A few grumble that we're taking the Commons over, but they grumble while they buy our gadgets, so I don't mind." },
      },
      choices = {
        { text = "Ironforge owes your people that much as allies.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Guests ought to keep their heads down, though.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },

    gnomeregan = {
      lines = {
        { id = "gn_default", text = "Every day, though I try to miss it quietly so I don't put the customers off. The troggs came up from below, and our own defenses made the city poison, and Mekgineer Thermaplugg had a hand in it that nobody's ever properly explained." },
      },
      choices = {
        { text = "Will your people take it back?", next = "gnomeregan_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    gnomeregan_back = {
      lines = {
        { id = "gb_default", text = "High Tinker Mekkatorque says so, and I believe him, because the alternative is to stop believing, and I'm not built for that. Until then I keep a column in my ledger for things to buy for the new city." },
      },
      choices = {
        { text = "Then I hope that column fills up soon.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan" } } },
      },
    },

    price = {
      lines = {
        { id = "pr_default", text = "Look at what the same thing sold for this week, not what you wish it sold for, and list a copper or two under the cheapest. It isn't romantic, but it's arithmetic, and arithmetic is on your side." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    k_refugee = {
      lines = {
        { id = "kr_default", text = "Then you know the smell of the air down there that last week, and I'm sorry you do. We don't talk about it much in the Commons, do we, but it's good to see another face that got out." },
      },
      choices = {
        { text = "We'll go back. I'm sure of it.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan" } } },
        { text = "I try not to look back at all.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tallied water rates in Gnomeregan, and now I tally bids in Ironforge, which is much the same except nobody drowns if I get it wrong." } },
    advice = { { id = "tp_ad", text = "Write everything down, and then write down where you wrote it." } },
    _none = { { id = "tp_none", text = "That doesn't add up to anything I know about, I'm afraid. Ask Redmuse; she's been here longer." } },
  },
}

-- Bryllia Ironbrand: general goods in the Commons; bread, drink, bags, ammunition.
P:NPC {
  key = "if_bryllia", id = TODO_NPC("Bryllia Ironbrand"), name = "Bryllia Ironbrand",
  bible = "bibles/commons_trade.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "warm" }, values = { "practical", "generous" },
  notices = { "kit" },

  impression = {
    first = "Bryllia Ironbrand sells bread, water, bags and shot in the Commons, and looks at every customer as if checking whether they've eaten. She means it kindly, and she is usually right.",
    third = "{name} met Bryllia Ironbrand, who sells general goods in the Commons of Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Bread, water, bags an' shot, love, an' the bread's fresh this mornin', whatever the baker says." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again. Have ye been eatin' properly, out there?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "Great stones, where's the rest o' yer clothes? I cannae sell ye armor, but I can sell ye a bag tae carry what's left of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bryllia Ironbrand, general goods, an' I've everythin' an adventurer forgets tae pack. Ye'd be surprised how many brave souls march off tae Loch Modan wi'out a drop o' water." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Bryllia Ironbrand, general goods, an' I've shot an' arrows by the box, so ye needn't run all the way tae the Military Ward. Keep yer quiver full, for a hunter wi' an empty one is just a person wi' a pet." },
      },
      again = {
        { id = "h_again", text = "Anythin' else, love? There's a queue behind ye." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What should a new adventurer carry?", next = "carry" },
        { text = "Where does all your stock come from?", next = "stock" },
        { text = "What's the gossip in the Commons today?", next = "gossip" },
        { text = "That's all, thank you.", next = "END" },
      },
    },

    carry = {
      lines = {
        { id = "ca_default", text = "Water first, for ye'll faint before ye starve, an' then bread, an' then the biggest bag ye can afford. After that, a flint an' some wood, for Dun Morogh's cold at night an' a fire's worth more than a sword." },
      },
      choices = {
        { text = "More than a sword? Surely not.", next = "carry_sword" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_sword = {
      lines = {
        { id = "cs_default", text = "Ye can run from a wolf, love, but ye cannae run from the snow. I've buried more adventurers' boots than adventurers, an' that's because the ones who came back left their toes in Chill Breeze Valley." },
      },
      choices = {
        { text = "I'll take a fire over a sword, then.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "I'll take my chances with the sword.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },

    stock = {
      lines = {
        { id = "st_default", text = "Bread from the bakers in Kharanos, water from the springs under the mountain, an' bags from the gnomes in Tinker Town, who stitch better than they've any right tae. The shot comes from the Great Forge, still warm, some days." },
      },
      choices = {
        { text = "The gnomes stitch bags as well?", next = "stock_gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_gnomes = {
      lines = {
        { id = "sg_default", text = "They do now, for a gnome wi' no city tae tinker in will tinker wi' anythin', thread included. I'll not complain, for their bags hold more than they look like they should, an' nobody can tell me why." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    gossip = {
      lines = {
        { id = "go_default", text = "The Thunderbrews have a new ale they won't let anyone taste, the Military Ward's buyin' every crate o' bandages I have, an' Redmuse at the auction house says tin's dearer than she's ever seen it." },
      },
      choices = {
        { text = "Why does the Ward need so many bandages?", next = "gossip_ward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_ward = {
      lines = {
        { id = "gw_default", text = "The Dark Irons have been raidin' the Thandol Span, an' the Dragonmaw are thick in the Wetlands. My cousin's boy is a mountaineer in Menethil, an' I send him a bag o' biscuits every time a gryphon goes west." },
      },
      choices = {
        { text = "He's lucky to have you.", next = "BACK", fx = { affinity = 2, learn = { "dark_iron", "dragonmaw" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've kept this counter thirty years, an' my mother kept it before me, an' neither of us ever let an adventurer leave hungry." } },
    advice = { { id = "tp_ad", text = "Eat when ye sit down tae rest, an' drink before ye're thirsty. It's no' complicated, but ye'd be amazed." } },
    _none = { { id = "tp_none", text = "I sell bread, love, no' answers. Try the Library in the Hall o' Explorers." } },
  },
}

-- Jondor Steelbrow: guild master in the Visitor's Center; forms guilds and designs crests.
P:NPC {
  key = "if_jondor", id = TODO_NPC("Jondor Steelbrow"), name = "Jondor Steelbrow",
  bible = "bibles/commons_trade.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "loyal", "friendly" },
  notices = { "status" },

  impression = {
    first = "Jondor Steelbrow registers guilds in the Visitor's Center and sizes up every visitor as a possible guild master. He believes that a band of friends with a name and a crest can do more than any army.",
    third = "{name} met Jondor Steelbrow, the guild master of Ironforge's Visitor's Center.",
  },

  greetings = {
    { id = "g_default", text = "Ye've the look o' someone who could lead a company, friend. Come tae start a guild?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Found yer fellows yet, or are ye still collectin' names?" },
  },

  notice = {
    { id = "n_tabard", cat = "status", when = { tabard = true },
      text = "That's a tabard on yer back, so ye've a guild already. Good, for I like tae see a crest out in the world instead o' sittin' in my ledger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jondor Steelbrow, guild master for the Visitor's Center. Every guild that marches out o' Ironforge has its name written in my book first, an' I've written some grand ones." },
      },
      again = {
        { id = "h_again", text = "What else would ye know about runnin' a company o' friends?" },
        { id = "h_again2", text = "Go on, friend. Guilds are my favourite subject." },
      },
      choices = {
        { text = "I'd like to see about a guild.", next = "BUSINESS" },
        { text = "How does someone form a guild?", next = "form" },
        { text = "Why would anyone bother with a guild?", next = "why" },
        { text = "What makes a good guild name?", next = "names" },
        { text = "Thank you, Jondor.", next = "END" },
      },
    },

    form = {
      lines = {
        { id = "fo_default", text = "Ye buy a charter from me, an' then ye go round an' get enough folk tae sign it who mean tae stand wi' ye. Bring it back full, an' I write ye in the book, an' after that ye can come back for a crest." },
      },
      choices = {
        { text = "What if the signers don't mean it?", next = "form_mean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    form_mean = {
      lines = {
        { id = "fm_default", text = "Then ye'll find out the first time it rains, which is the usual way. A guild that's only names on paper falls apart in a month, an' I've seen a hundred go that way." },
      },
      choices = {
        { text = "A guild needs rules, then, and someone to enforce them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A guild needs friends, not rules.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because one adventurer can clear a trogg den, but it takes a dozen friends who trust each other tae walk intae Blackrock Mountain an' come out again. A guild's how ye find that dozen." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    names = {
      lines = {
        { id = "na_default", text = "Somethin' ye'll be proud tae shout across a battlefield, an' no' embarrassed tae say tae yer mother. I once had a band o' gnomes try tae register a name that was mostly numbers, an' I had tae send them away." },
      },
      choices = {
        { text = "What was wrong with numbers?", next = "names_gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names_gnomes = {
      lines = {
        { id = "ng_default", text = "Nothin', except nobody could shout it. They came back the next week as somethin' wi' a cog in it, an' they're still goin', so I suppose it worked out." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fought in the Second War wi' a company that had no name an' no crest, an' I've thought ever since that we'd have held together better wi' both." } },
    advice = { { id = "tp_ad", text = "Choose yer officers for their patience, no' their swordarms." } },
    _none = { { id = "tp_none", text = "That's no' guild business, friend, so I couldnae tell ye." } },
  },
}

-- Lyesa Steelbrow: tabard vendor in the Visitor's Center; proud of a well-made crest.
P:NPC {
  key = "if_lyesa", id = TODO_NPC("Lyesa Steelbrow"), name = "Lyesa Steelbrow",
  bible = "bibles/commons_trade.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "proud" }, values = { "proud", "practical" },
  notices = { "status" },

  impression = {
    first = "Lyesa Steelbrow sells tabards in the Visitor's Center and has an opinion on every crest ever stitched. She thinks a guild's colors should say something true about the people who wear them.",
    third = "{name} met Lyesa Steelbrow, who sells tabards in Ironforge's Visitor's Center.",
  },

  greetings = {
    { id = "g_default", text = "Lookin' for a tabard? I've the guild's colors here, if yer guild's registered wi' Jondor." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Has yer guild settled on its colors yet, or are they still arguin'?" },
  },

  notice = {
    { id = "n_tabard", cat = "status", when = { tabard = true },
      text = "Let me see that tabard. The stitchin' on the crest's no' bad at all, though I'd have used a heavier thread at the border." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lyesa Steelbrow, tabards. Once Jondor's written yer guild in his book an' ye've chosen a crest, I make the tabards tae match, an' I make them tae last." },
      },
      again = {
        { id = "h_again", text = "What else about crests an' colors can I tell ye?" },
        { id = "h_again2", text = "Ask, then. I've a hem tae finish." },
      },
      choices = {
        { text = "Let me see your tabards.", next = "BUSINESS" },
        { text = "Why do guilds wear tabards at all?", next = "why" },
        { text = "What makes a good crest?", next = "crest" },
        { text = "Are you kin to Jondor?", next = "kin" },
        { text = "Good day, Lyesa.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "So that when ye're in the thick o' a fight in some dark cavern, ye can tell yer friends from everyone else at a glance. Pride's part of it too, I'll admit, but mostly it's so ye don't stab the wrong dwarf." },
      },
      choices = {
        { text = "Wearing your colors openly is honest.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Wearing colors makes you a target.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    crest = {
      lines = {
        { id = "cr_default", text = "A simple one, that ye can recognize across a hall. The worst I ever stitched had a gryphon, an anvil, two axes an' a moon on it, an' from ten paces it looked like a pie somebody had sat on." },
      },
      choices = {
        { text = "Did you tell them so?", next = "crest_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest_tell = {
      lines = {
        { id = "ct_default", text = "I did, an' they paid for the tabards anyway an' wore them wi' pride, which taught me somethin'. A crest's no' mine tae judge once it's on someone's back, so now I only say my piece once." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    kin = {
      lines = {
        { id = "ki_default", text = "Everyone asks that, since we share a name an' a counter. There are a great many Steelbrows in Ironforge, an' I'll leave ye tae guess how many o' them are cousins tae how many others." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned stitchin' from my grandmother, who made banners for the Bronzebeard clan's soldiers in the Second War." } },
    advice = { { id = "tp_ad", text = "Wash a tabard in cold water, never hot, or the crest'll run." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye about that. I know thread an' crests, an' that's all I claim." } },
  },
}

-- Soleil Stonemantle: banker in the Vault of Ironforge; one of the Stonemantle bankers.
P:NPC {
  key = "if_soleil", id = TODO_NPC("Soleil Stonemantle"), name = "Soleil Stonemantle",
  bible = "bibles/commons_trade.md", role = "banker", tier = "service",
  communities = { "ironforge" }, temper = { "calm" }, values = { "dutiful", "honest" },
  notices = { "purse" },

  impression = {
    first = "Soleil Stonemantle keeps accounts in the Vault of Ironforge, as her family has for generations. She speaks quietly, counts precisely and seems to regard the vault's door as a personal friend.",
    third = "{name} met Soleil Stonemantle, a banker in the Vault of Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Welcome tae the Vault o' Ironforge. Yer things are just where ye left them, I promise ye." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Nothin's been touched since yer last visit, no' even by me." },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 100 } },
      text = "Ye've barely a copper tae yer name, by the sound o' that purse. The vault keeps goods as well as gold, mind, so ye needn't be rich tae use it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Soleil Stonemantle, at yer service. The Stonemantles have kept the Vault o' Ironforge longer than anyone can remember, an' we've never lost so much as a button." },
      },
      again = {
        { id = "h_again", text = "Is there anythin' else about the Vault ye'd like tae know?" },
        { id = "h_again2", text = "Ask what ye like. Discretion is part o' the service." },
      },
      choices = {
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "How safe is the Vault, truly?", next = "safe" },
        { text = "Are all the bankers here Stonemantles?", next = "family" },
        { text = "Can I store things in Stormwind as well?", next = "stormwind" },
        { text = "Thank you, Soleil.", next = "END" },
      },
    },

    safe = {
      lines = {
        { id = "sa_default", text = "The Vault's cut intae the deep rock o' the mountain, behind doors the Great Forge itself would struggle tae melt. Nobody's ever broken in, though now an' then a Dark Iron spy gets caught tryin', an' the guards enjoy that very much." },
      },
      choices = {
        { text = "What happens to the spies?", next = "safe_spies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_spies = {
      lines = {
        { id = "ss_default", text = "They go tae the guards, an' after that I don't ask, for a banker who asks too many questions soon has too many answers. I'm told the Military Ward has a few quiet rooms." },
      },
      choices = {
        { text = "Spies deserve whatever they get.", next = "BACK", fx = { align = { light = -1 }, learn = { "dark_iron" } } },
        { text = "I hope they're treated justly, spies or not.", next = "BACK", fx = { align = { light = 1 }, learn = { "dark_iron" } } },
      },
    },

    family = {
      lines = {
        { id = "fa_default", text = "No' all, but a good many. Barnum an' Bailey stand at the counters beside me, an' there's always another cousin learnin' the ledgers in the back room." },
      },
      choices = {
        { text = "Doesn't working with family get tiresome?", next = "family_tired" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_tired = {
      lines = {
        { id = "ft_default", text = "Sometimes, aye, but ye always know who tae trust wi' the keys. Barnum hums while he counts, which I've learned tae bear, the way ye learn tae bear the cold in Dun Morogh." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    stormwind = {
      lines = {
        { id = "sw_default", text = "Ye can, an' it's the same vault. The bankers o' the Alliance cities keep one ledger between them, so what ye leave here ye can take out in Stormwind or Darnassus, an' don't ask me how, for that's a secret o' the trade." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born above the Vault, near enough, an' I've counted coins since I could count." } },
    advice = { { id = "tp_ad", text = "Leave what ye don't need wi' us before ye go somewhere ye might not come back from." } },
    _none = { { id = "tp_none", text = "I'm afraid that's no' somethin' the Vault keeps a record of." } },
  },
}
