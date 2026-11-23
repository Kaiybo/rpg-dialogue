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
      },
      choices = {
        { text = "What sells best in Ironforge?", next = "sells" },
        { text = "You enjoy this work, I can tell.", next = "enjoy" },
        { text = "How do the three of you share the hall?", next = "three" },
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
      lines = { { id = "g_default", text = "They pay me in fliers and the joy of the thing, and I'd do it for less. A goblin will sell ye yer own boots, I know it well, but they run a straight contest because a crooked one would draw nae anglers the week after." } },
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a tinker in Gnomeregan, and now I tinker with blades in the Forlorn Cavern, which is mostly the same work with sharper parts." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, unless it has moving parts. Does it have moving parts?" } },
  },
}

-- Bombus Finespindle: leatherworking supplies in Finespindle's Leather Goods.
P:NPC {
  key = "if_bombus", id = TODO_NPC("Bombus Finespindle"), name = "Bombus Finespindle", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "brisk", "inventive" }, values = { "thrifty", "precise" },
  notices = { "craft" },
  impression = {
    first = "Bombus Finespindle keeps the thread, the dyes and the salt in drawers he has labelled twice, once in words and once in numbers. He is forever improving the shop's tools, whether or not they needed it.",
    third = "{name} met Bombus Finespindle, who sells leatherworking supplies beside the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "Thread, salt, dye or wax? I have all four, sorted by weight and by colour, and I can have any of them in your hand in under ten seconds." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread? You must be stitching faster than I estimated, which is good news for both of us." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Those are a leatherworker's fingers, with the needle calluses in exactly the right places. You'll want the coarse thread, then, and probably more salt than you think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bombus Finespindle, supplies. Fimble teaches the craft, Gretta is learning it, Balthus brings in the hides, and I make sure none of them ever has to stop work for want of a spool of thread." },
      },
      again = {
        { id = "h_again", text = "Anything else? The drawers are all in order, so I've a moment." },
        { id = "h_again2", text = "Yes, do go on." },
      },
      choices = {
        { text = "What does a leatherworker run out of first?", next = "runout" },
        { text = "They say you improve the shop's tools.", next = "tools" },
        { text = "How did gnomes come to leather?", next = "leather" },
        { text = "Just supplies today.", next = "END" },
      },
    },
    runout = {
      lines = { { id = "r_default", text = "Salt, every time, and nobody believes me until it happens. A hide that isn't salted spoils in a day or two, so the thread and the dye are no use to you at all if you've skimped on the cheapest thing in the shop." } },
      choices = { { text = "I'll buy the salt. Something else.", next = "BACK" } },
    },
    tools = {
      lines = { { id = "t_default", text = "I built a stretching frame with a crank and a counterweight that tensions a hide evenly in half the usual time! Balthus says it takes twice as long once you count the repairs, but he only has figures for the first prototype." } },
      choices = {
        { text = "How many prototypes have there been?", next = "proto" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proto = {
      lines = { { id = "p_default", text = "Seven, and the seventh has run for nine days without throwing a single bolt across the room. Balthus still stretches his hides by hand, out of what I can only call dwarven principle." } },
      choices = { { text = "Dwarves are like that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    leather = {
      lines = { { id = "l_default", text = "Every machine needs belts, gaskets and bellows, and those are all leather, so a good gnome workshop always kept a Finespindle or two. When Gnomeregan fell we brought the trade to Ironforge, and the dwarves, I'm pleased to say, wear out a great many boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Finespindles cut belts and gaskets for Gnomeregan's workshops, and now we keep a shop on the north side of the Great Forge." } },
    _none = { { id = "tp_none", text = "That isn't in any of my drawers, I'm afraid. Fimble may know, if you can get him to look up from his stitching." } },
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a shield in the Second War, and I've sold armour in the Commons ever since I put it down." } },
    _none = { { id = "tp_none", text = "I sell steel, friend, nae stories. Ask at the Stonefire Tavern, for they've plenty of the other." } },
  },
}
