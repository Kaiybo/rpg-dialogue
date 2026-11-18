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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Now an' again, an' mostly carved by someone who's never heard an element in his life. The buyers cannae tell the difference, an' I'm no' paid tae tell them. If ye ever carved a real one, I'd list it at three times the price an' say so in big letters." } },
      choices = {
        { text = "A real totem isn't for sale, Redmuse.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Three times the price? I'll carve you a dozen.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Peacebloom an' silverleaf sell everywhere, for every alchemist needs them an' dwarves cannae grow a thing under a mountain. What sells best is what's scarce, so a druid who knows where the rare herbs grow could do very well here." } },
      choices = {
        { text = "Herbs belong to whoever finds them, and the market sets the price.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Some groves should never be stripped for a merchant's profit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Shields, mostly, for a warrior breaks one a month an' never thinks tae buy two. The prices go up every time the troggs come out o' the Gol'Bolar Quarry, an' I'll no' apologise for that." } },
      choices = {
        { text = "I'll pay a fair price and not haggle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy cheap when the troggs are quiet, and sell dear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bear pelts from the high snows an' boar hide from Loch Modan, for every leatherworker in Ironforge wants them an' none o' them want tae go out an' get them. A hunter who knows the market can do very well, if he doesnae flood it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep yer {pet} off the counter, mind, for the last one ate a buyer's gloves an' I'm still hearin' about it." },
      },
      choices = {
        { text = "I'll sell what I take, and no more than I need.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hold my pelts back till the price climbs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every day, friend, wi' false names an' shill bids an' goods that turn tae lead in the bag. I've caught a few o' the Hidden Circle tryin' tae sell back what they stole from the bidders, an' they didnae enjoy what came after." } },
      choices = {
        { text = "A fair market keeps the city honest. I'll respect it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A market's a game, Redmuse. Somebody has to win it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a buyer in Stormwind complained that his purchase talked tae him at night, an' the Stonemantles very nearly shut us down for it. Sell me cloth an' ore an' honest goods, an' we'll get along fine." } },
      choices = {
        { text = "Fair rules. I'll keep my darker goods out of your house.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then the best things will sell somewhere else, at a better price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They try, an' I turn half o' them away, for every second chancer in the Wetlands swears his rusty amulet was blessed by Uther himself. If it's really holy, it should go tae the Mystic Ward an' no' tae the highest bidder, an' I'll say so tae the seller's face." } },
      choices = {
        { text = "Holy things shouldn't have a price at all. You're right to refuse.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If someone wants to pay for a blessing, let the market decide.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about the market instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not twice, for I've seen a Silver Hand dwarf take a crooked seller tae the guards by his collar, an' the house backed him. A fair price is the only rule I hold tae as tight as the paladins hold their oaths." } },
      choices = {
        { text = "A fair price is honest dealing. I respect that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every trader bends the truth. I'd rather just haggle hard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Back to the auctions, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Enchanted bits, mostly, an' whatever ye've pulled out o' a dungeon that ye cannae use yerself, because the market's hungry for anythin' that glows. The mages who do well here sell steady an' sell cheap, an' the ones who try tae corner a market learn quick that dwarves outlast them." },
      },
      choices = {
        { text = "Steady and cheap. Sound advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll corner the market anyway, Redmuse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Ye'll be sellin' cloth an' buyin' wands, I expect, for that's what yer sort always does, an' I'll tell ye now that wands are dear this week." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Ye'll be after plate, then, an' heavy plate at that, an' I'll warn ye it goes for a fortune when the Military Ward's recruitin'." },
        { id = "h_default", key = true,
          text = "Redmuse, auctioneer o' the Ironforge house. What ye list wi' me is seen in Stormwind an' Darnassus as well, so if somebody somewhere wants it, they'll find it." },
        { id = "h_evening", when = { timeOfDay = "night" },
          text = "Evenin's the busy time, when the miners an' the adventurers come in at once an' all want tae sell the same ore. Ye'd do better tae list in the mornin', if ye can wait." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I see ye've been watchin' the bids before ye came over. That's sharp work, an' I'll keep an eye on ye for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Before ye list anythin', I'll tell ye we dinnae sell soul shards or anythin' else that whispers. That's the rule o' the house." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll be after a better blade, I suppose, an' the house has a few, if ye've the coin." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? The house moves more pelts than any shop in the Commons, an' half o' them come from folk like ye." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The kaldorei send fine leather an' herbs through my house from Darnassus, so I know yer people's goods, if no' yer people." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Conjured water fetches nothin' at this house, so dinnae try it, but runecloth an' enchanted bits fetch plenty, if ye've any tae spare." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, an' a dwarf! I've had folk try tae list Wildhammer charms in my house, but I've never had the genuine article walk up tae the counter." },
      },
      again = {
        { id = "h_again", text = "What else? The ledger's open." },
        { id = "h_again2", text = "Ask away, while there's a lull." },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "How does the house work?", next = "how" },
        { text = "Ore must sell well in a city built around a forge.", next = "sells" },
        { text = "Who's the gnome working beside you?", next = "lympkin" },
        { text = "I'm a crafter. What do buyers want from me?", next = "k_craft", when = { profession = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" } } },
        { text = "People must try to cheat the auction house.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why won't the house sell anything that whispers?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do warriors buy most at the auction house?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What pelts sell best at the auction house?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does anyone sell holy relics through the house, Redmuse?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do sellers ever cheat paladins on plate, Redmuse?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do kaldorei herbs sell well this far from the forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do mages sell well at the auction house?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do totems ever come through the auction house, Redmuse?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { id = "ly_default", text = "That's Lympkin, an' she's quicker wi' a sum than any dwarf in this hall, me included. She came up out o' Gnomeregan wi' nothin' but a pencil, an' now most o' the big bids in the Commons cross her ledger." },
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
    booty_bay = { { id = "tp_booty_bay", text = "Everythin' that comes up from Booty Bay is a week behind the market an' twice the price. The goblins call it shipping, an' I call it robbery wi' a ledger." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's auctioneers will sell tae the Horde an' the Alliance in the same breath, an' they're rich for it. I'll stick tae our own buyers, though I'll watch their prices like a hawk." } },
    scourge = { { id = "tp_scourge", text = "Since the north fell, nobody's buyin' Lordaeron wool an' everybody's buyin' holy water. A plague's bad fer folk an' strange fer trade." } },
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
    { id = "g_default", text = "Hello, hello! Listing, bidding or browsing? I can do all three at once, with a margin of error under two percent, if you talk quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I've already worked out the three most probable things you're going to ask, so go on and tell me which one it is." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Oh, another one of us! Which level of the city were you from, before? I was on the third, near the accountancy pumps, though there's not much left of them now." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A puzzle, naturally! The stone talks to you, but you can't show me the mechanism, and I can't measure it with anything I own. Tinker Town's split between those who think it's a resonance effect and those who think you're all simply very good listeners, and I'm keeping a tally of the arguments." } },
      choices = {
        { text = "I'll answer whatever your tinkers ask, and answer it straight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them keep guessing. A little mystery is good for gnomes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I make a note of them, because druids sell herbs and leather and buy almost nothing, which throws my averages off terribly. Still, a seller who never haggles is the sort my ledger likes best." } },
      choices = {
        { text = "Fair trade keeps every people honest, gnome or kaldorei.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I trade as the forest does, by need rather than ledger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By breaking things, mostly, and then buying more of them in a hurry, which is the best kind of buying. A warrior back from the Wetlands with a notched axe is worth three bankers to me, and I'm always honest about numbers." } },
      choices = {
        { text = "I'll have my axe mended before I buy another.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Easier to buy new than wait on a smith.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Pelts are up, meat's down, and anything with a claw on it sells to the alchemists by the ounce, and dear. Bring me a good bear hide from Dun Morogh, and I'll have it sold before you've finished your ale." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet}'s not for sale, I take it? A pity, for I could get a very good price." },
      },
      choices = {
        { text = "Never. My beast is a companion, not stock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Everything has a price. Let's hear yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Everything that wouldn't fit in a pocket, and some of what would. A few have bought their own books back at the auction since, at twice the price, and I'd call that the saddest sum I've ever done." } },
      choices = {
        { text = "Then I'll hunt their lost books down and return them freely.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A book belongs to whoever pays for it, Lympkin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It sheltered them, at least, and taught a good many before the troggs came up and the radiation came down. Now they're scattered, and I hear people whisper about them in the Commons, which seems unkind to a refugee." } },
      choices = {
        { text = "Whispers are earned. I'll show the Commons we can be trusted.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them whisper. I'd rather be feared than pitied.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh my, yes, burns and radiation sickness and the coughing that wouldn't stop, and the priests of the Mystic Ward worked through the nights for weeks. Four hundred and twelve gnomes in Tinker Town owe their lungs to some dwarf with a prayer, and I tallied the bandages, so I know." } },
      choices = {
        { text = "Then I'll help where I can. The work isn't over yet.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mending lungs won't take Gnomeregan back. That takes engineers and soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about prices, Lympkin.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd think a whole company of them could, if the High Tinker would let anyone near the place before he's finished his plans, which he hasn't. Until then, the leper gnomes and the troggs keep Gnomeregan, and I keep a column of numbers I'd rather not add up." } },
      choices = {
        { text = "When the High Tinker calls, I'll answer. Gnomeregan deserves rescuing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Plans take too long. Someone should go in now, permission or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave Gnomeregan be for now.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because half the Commons would love to know who's buying what, and the other half would love to know for how much! After Gnomeregan I learned to keep the things that matter where nobody else can read them, and so far nobody's managed it." },
      },
      choices = {
        { text = "Clever. Your secrets are safe from me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Give me a week. I'll crack it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest! You'll want healing potions, I suppose, though I always think your sort shouldn't need them, and then I remember you're the one healing everybody else." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a ledger column just for hammers and plate, and your sort fills it up faster than anybody." },
        { id = "h_default", key = true,
          text = "Lympkin, auctioneer, and the fastest pencil in the Commons, eleven sums a minute on a good day, if I do say so, which I do. What can I tally for you today?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'd be amazed how many Gnomeregan mages sold their books in this very house to pay for a bed in Tinker Town, and I tallied every one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Oh my, a warlock. Some of the brightest gnomes of Gnomeregan studied your sort of magic before the fall, you know, so I've stopped being shocked." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Your sort keeps the arms market lively, and I'm grateful, though I'd be more grateful if you broke swords at a steadier rate, because the spikes ruin my averages." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be selling, not buying, I expect, and I can tell you what anything's worth before you've finished saying what it is." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a night elf druid! I've tallied a great many kaldorei goods but very few kaldorei, so I may have to count you twice, just to be sure." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! I keep my ledgers in gnomish shorthand, you know, so there's no use reading them over my shoulder, though I'd be impressed if you tried." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! That's a column I don't have in my ledger, so I'll have to rule a new one, and I do love ruling a new column." },
      },
      again = {
        { id = "h_again", text = "Next question! I've a column waiting, and a column with nothing in it is a terrible waste of good ruled paper." },
        { id = "h_again2", text = "Go on, I can listen and carry a column of figures at the same time." },
      },
      choices = {
        { text = "Show me what's for sale.", next = "BUSINESS" },
        { text = "How did you come to work here?", next = "how" },
        { text = "You must miss Gnomeregan.", next = "gnomeregan" },
        { text = "How do I price something sensibly?", next = "price" },
        { text = "I lived through the fall of Gnomeregan too.", next = "k_refugee", when = { origin = "gnome_gnomeregan_refugee" } },
        { text = "Did the gnome mages lose much in Gnomeregan's fall?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "So Gnomeregan trained warlocks.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do warriors keep the arms market lively, Lympkin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What are a hunter's goods worth at auction these days?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did Gnomeregan's refugees need much healing when they came here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you think a paladin could help win Gnomeregan back?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does a gnomish auctioneer make of druids, then?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why keep your ledgers in gnomish shorthand?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What would a gnome make of a dwarf shaman, Lympkin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Lympkin.", next = "END" },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "I came up from Gnomeregan with the rest, and Redmuse caught me correcting her sums on the back of a list, four errors in thirty lines. Instead of throwing me out, she gave me a stool, and I've been sitting on it ever since." },
      },
      choices = {
        { text = "That was generous of her.", next = "BACK", fx = { affinity = 1 } },
        { text = "The dwarves seem to treat you fairly here.", next = "how_fair" },
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
        { id = "pr_default", text = "Look at what the same thing sold for this week, not what you wish it sold for, and list a copper or two under the cheapest. It isn't romantic, but it's arithmetic, and arithmetic is the one machine in Ironforge that never jams." },
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
    advice = { { id = "tp_ad", text = "Write everything down, and then write down where you wrote it, and then cross-reference both, because a figure you can't find is the same as a figure you never had." } },
    _none = { { id = "tp_none", text = "That doesn't add up to anything I know about, I'm afraid, and I've checked the sum twice. Ask Redmuse; she's been here longer." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan runs the only market that'll sell tae both sides, an' it charges both sides for the privilege. I've been tryin' tae work out their commission for a year, an' I'm afraid it's simply 'yes'." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's prices change wi' the tide an' the mood o' the Baron. I keep a column for it in my book an' it's mostly question marks." } },
    everlook = { { id = "tp_everlook", text = "A goblin market in the snow sellin' furs an' frostsaber pelts, an' at prices that'd make a miner weep. I've written tae ask how they ship, an' they've written back askin' what I'd pay tae know." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some mutter when ye pass, an' one or two said they'd no' sell tae anybody practisin' orc magic. But I've seen what a shaman's hands can do for a wounded mountaineer, an' I'll sell tae ye at the same price as anyone, an' they can mutter at me instead." } },
      choices = {
        { text = "Thank you. I'll earn the Commons' trust the proper way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them mutter. I don't need the Commons' good opinion.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Water, mostly, for even a druid cannae drink snow forever wi'out a sore belly. I'll sell ye what ye need an' trust the forest for the rest, though I'd feel better if ye took a loaf as well." } },
      choices = {
        { text = "Preparation keeps you alive. I'll pack properly this time.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The land provides. I'd rather carry as little as I can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, an' a bandage or two, an' bread enough for a day longer than ye think ye'll be out. The ones who come back from Loch Modan half-starved all say the same thing: they thought they'd be home by supper." } },
      choices = {
        { text = "I'll pack for the long road, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll travel light. Hunger keeps me sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, an' arrows too, for the elves an' the humans who come through, though the dwarves buy the shot by the sackful. Ye'd no' believe how many hunters leave Ironforge wi' a fine rifle an' nothin' tae put in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' a wee bit o' meat for yer {pet}, if ye like, for a hungry beast is a cranky beast, same as a hungry dwarf." },
      },
      choices = {
        { text = "I'll buy enough for me and leave some for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy you out before anyone else can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice, an' both times the guards caught a gnome who'd been paid tae carry the bag. The thief himself was long gone, an' that's what galls me, the cowardice o' it." } },
      choices = {
        { text = "Using a gnome to take the blame is low. I'd never.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The thief was clever, Bryllia. You have to give him that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ye can, an' it fills the belly, but there's no taste tae it, an' everyone in the Commons knows it. Conjured bread is for the road, an' Ironforge bread is for livin', so buy a loaf an' see." } },
      choices = {
        { text = "You're right, Bryllia. Proper bread supports proper bakers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured bread keeps me free of anyone's shop, Bryllia.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Somebody wi' sense an' a full waterskin, which is usually me, for priests who come through here forget tae eat, the lot o' them. The Light, or Elune, or whatever ye pray tae, will mend a broken arm, but it'll no' fill an empty belly, an' I'll stake my shop on that." } },
      choices = {
        { text = "A healer's duty is to others first. My belly can wait.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. A healer who starves heals nobody. I'll eat first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see your wares, Bryllia.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than the warriors, I'd say, though they're more polite about it an' they always pay. One o' the Silver Hand lads from the Mystic Ward buys half my bread every week an' gives it away in the Forlorn Cavern, so I've stopped askin' why." } },
      choices = {
        { text = "Feeding the poor is a paladin's work. I'd do the same.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Charity's fine, but the Cavern folk should earn their bread.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Back to the shopping, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I couldnae say, but I've seen an imp make off wi' a whole loaf from my counter, so somethin' must happen tae it. Buy yerself some proper food an' keep it in yer own pack, for ye look like ye need it more than it does." },
      },
      choices = {
        { text = "Thank you. I'll look after myself better.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My imp eats what it likes, Bryllia.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll want water, plenty o' it, for I've seen yer sort pray yerselves dry out in Loch Modan an' fall over wi' nobody left tae heal the healer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be needin' more food than ye think, for all that plate's heavy, an' I've never met one o' yer lot who could walk past my bread." },
        { id = "h_default", key = true,
          text = "Bryllia Ironbrand, general goods, an' I've everythin' an adventurer forgets tae pack. Ye'd be surprised how many brave souls march off tae Loch Modan wi'out a drop o' water." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Bryllia Ironbrand, general goods, an' I've shot an' arrows by the box, so ye needn't run all the way tae the Military Ward. Keep yer quiver full, for a hunter wi' an empty one is just a person wi' a pet." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I count my stock twice when one o' your kind walks in, an' I'll no' apologise for it, though I'll still sell ye bread." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, so ye'll want water an' bread an' never think ye'll run out. Ye will, an' that's why I keep the good stuff by the door." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want food an' water before ye want anythin' else, for an empty stomach drops a shield faster than any trogg." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' a night elf too. Have ye eaten? Ye kaldorei are all so tall an' thin that I worry a Dun Morogh wind will carry ye off." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, an' pale as milk. Have ye eaten anythin' today, or does that wee beastie o' yours get all the bread?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, is it? Ye'll be wantin' somethin' tae carve totems from, I expect, an' I've only got kindlin', but ye're welcome tae look." },
      },
      again = {
        { id = "h_again", text = "Anythin' else, love? There's a queue behind ye." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What should a new adventurer carry?", next = "carry" },
        { text = "Your stock must come from all over Khaz Modan.", next = "stock" },
        { text = "The Commons must be full of gossip today.", next = "gossip" },
        { text = "I'd guess rogues have robbed you before, Bryllia.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can't a mage simply conjure what they need?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What should a warrior carry that most forget, Bryllia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you stock shot for a hunter's rifle, Bryllia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who looks after the healers, Bryllia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Paladins seem to eat like ogres, Bryllia.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you stock anything for travellers who live off the land?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do demons even eat bread, Bryllia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do folk in the Commons mind selling to a shaman, Bryllia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "That's all, thank you.", next = "END" },
      },
    },

    carry = {
      lines = {
        { id = "ca_default", text = "Water first, for ye'll faint before ye starve, an' then bread, an' then the biggest bag ye can afford. After that, a flint an' some wood, for Dun Morogh's cold at night, an' a fire'll save yer life more often than a sword will." },
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
        { text = "So the gnomes stitch bags as well.", next = "stock_gnomes" },
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
    scourge = { { id = "tp_scourge", text = "I've had refugees from Lordaeron at this counter wi' nothin' but the clothes on their backs, an' I fed them what I could. The plague took their homes, an' they still said thank ye." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells food on sticks, an' half o' it's no' food at all, an' I'd thank ye no' tae eat it. Come back here fer a proper loaf after." } },
    theramore = { { id = "tp_theramore", text = "Theramore buys our bread by the barrel, I'm told, for Lady Jaina feeds soldiers an' refugees both. I'm glad tae think somethin' o' mine is keepin' somebody warm across the sea." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Aye, if ye paid the fee an' chose a name I could spell. The Senate's old families would grumble that I'd given good Ironforge ink tae Wildhammer mystics, an' they'd grumble at me in the Commons, where everyone could hear. I'd write it anyway, for the book's for anyone wi' coin an' a crest." } },
      choices = {
        { text = "Then we'll register properly, fee, crest and all.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The earth doesn't need a guild charter, Jondor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Welcome an' wanted, for a guild that can heal, fight an' scout wi' one member is a guild that saves on rations. I've seen dwarves an' kaldorei march under one crest, an' they argued the whole way an' never once broke." } },
      choices = {
        { text = "A guild is a sworn bond. I'd stand by it to the end.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'd join while it suits me, and leave when it doesn't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some do, for they're used tae holdin' a line an' keepin' others behind it. The best guilds I've written had a warrior who'd stand in a doorway an' let the rest get out, an' the worst had one who charged in first an' left them all behind." } },
      choices = {
        { text = "I'd stand in the doorway. That's what a warrior's for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd charge in first. Someone has to lead the way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Small ones, mostly, for hunters like their own company an' their beasts' better than anyone else's. I wrote one last month called the Riflemen o' the High Snows, an' every one o' them brought a ram tae the signin'." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Ye'd want yer {pet} on the crest, I'd wager, an' Lyesa would stitch it well enough tae fool its own mother." },
      },
      choices = {
        { text = "A guild makes a hunter stronger, beasts and all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather hunt alone than share the spoils.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shadows o' this an' Daggers o' that, mostly, an' one lad who wanted tae call his lot the Hidden Circle until I told him it was taken. I'll write down any honest name ye like, but I'll no' register a gang o' cutpurses under the King's seal." } },
      choices = {
        { text = "A guild should keep its oath to the city it's founded in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A name's a name, Jondor. What we do is our affair.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They wanted a crest wi' a burnin' eye, an' the whole Commons asked if the Legion had come back. They settled on a black candle after a week o' shoutin', an' folk calmed down, which is what a good crest should help them do." } },
      choices = {
        { text = "A crest should reassure folk. I'll choose something modest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The burning eye was honest. Let them be frightened.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than ye'd think, for a band o' healers that goes tae Loch Modan or the Wetlands together brings back more soldiers than it buries. I'll write ye down if ye like, but pick a name wi' some spine in it, an' none o' this 'Gentle Hands' business." } },
      choices = {
        { text = "A gentle name for gentle work. I'll keep the soft names.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A guild of healers should sound like it could fight, too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else about guilds, Jondor.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Somethin' about protectin' the weak an' standin' by yer brothers, mostly, an' I write it on the page beside the name, for they get cross if I don't. I've seen two o' those guilds break up over who said the oath wrong, so I'd keep it short." } },
      choices = {
        { text = "An oath sworn together should be kept together, word for word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fight over words? The deeds matter. I'd keep it loose.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jondor.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some o' the best, for they're used tae keepin' a great many things in their heads at once, an' a guild's mostly that. The trouble is they forget the warriors need feedin' too, so if ye start one, put a dwarf in charge o' the supper." },
      },
      choices = {
        { text = "I'd lead fairly and see everyone fed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A guild should follow the cleverest. That's me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest wantin' a guild! Every guild needs a healer, an' I've written a few just for priests, though they're always too polite tae pick a proper name." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've written down more paladin guilds than I can count, an' every one o' them swears an oath at the founding, whether I ask for it or no'." },
        { id = "h_default", key = true,
          text = "Jondor Steelbrow, guild master for the Visitor's Center. Every guild that marches out o' Ironforge has its name written in my book first, an' I've written some grand ones." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue wantin' tae found a guild, is it? Ye'll be surprised how many do, an' ye'll be less surprised at the names they pick." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I've written a warlocks' guild into the book before, an' it caused a fair bit o' grumblin' at the Visitor's Center. I'll write yours too, but mind what ye call it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Every good guild needs a warrior at the front, an' I've written a hundred names wi' a shield on the crest." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've a soft spot for hunters' guilds, for they always pick the grandest names an' the strangest crests." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid! I've written a few o' yer people's names in my book, an' they always want their guild named after a tree." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Many a fine guild was started by a mage wi' a head for plannin', an' I'd wager ye've a name for one already." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've written guilds o' paladins an' guilds o' hunters, but never a guild o' dwarves who talk tae the rocks. Give it time, an' I'll be writin' one." },
      },
      again = {
        { id = "h_again", text = "What else would ye know about runnin' a company o' friends?" },
        { id = "h_again2", text = "Go on, friend. Guilds are my favourite subject." },
      },
      choices = {
        { text = "I'd like to see about a guild.", next = "BUSINESS" },
        { text = "How does someone form a guild?", next = "form" },
        { text = "Why would anyone bother with a guild?", next = "why" },
        { text = "A good guild name must be hard to find.", next = "names" },
        { text = "What sort of names do rogues pick for their guilds?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What happened with the last warlocks' guild?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do warriors make good guild leaders, Jondor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What sort of guilds do hunters start, Jondor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Guilds of priests must do some good out there.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What oath do the paladin guilds swear, Jondor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a druid be welcome in a dwarven guild?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages make good guild masters, Jondor?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you register a guild of dwarven shamans, Jondor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Guilds that fight together come back from the Gurubashi Arena wi' scars an' stories, an' sometimes wi' fewer members. A good band shares the gold an' the bandages alike." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's a fine place tae recruit, for anybody who'll ride that great wheel will follow ye intae a dungeon. Bring a banner an' a stout voice." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The big guilds talk o' Blackrock Spire like it's a proving ground, an' it is. I've registered a dozen bands that went in an' come out wi' half their names." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've been thinkin' on it since ye walked up! An anvil, for Ironforge, wi' a flame an' a wave an' a gust round it, so nobody could say ye'd forgotten where ye came from. The Wildhammers would want a gryphon on it, I expect, but I'd fight them on that." } },
      choices = {
        { text = "The anvil first. I'm Ironforge before I'm anything else.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Put the gryphon on it. The Wildhammers kept the old ways alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A single leaf on a field o' night blue, simple an' true, for I think yer people say more wi' less. Dwarves want hammers an' anvils on everythin', an' I'm a wee bit tired o' stitchin' anvils." } },
      choices = {
        { text = "Keep it simple. A crest should tell the truth about its wearer.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Make it grand. Folk judge you by the colors you wear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A shield or an axe, if ye're plain about it, but I always say a crest should tell the truth about who wears it. The best warrior's tabard I ever made was a hammer over a broken trogg club, an' the dwarf who wore it had earned every stitch." } },
      choices = {
        { text = "Stitch me something plain. Deeds speak louder than crests.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Make it grand. The troggs should fear my colours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Browns an' greys for the hills, white for the high snows, an' green if ye're bound for the Wetlands, though the mud'll make it brown soon enough. I made one for a dwarf hunter once wi' her ram stitched on the front, an' she cried when she saw it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' I could put yer {pet} on a crest, if ye'd like, for I've stitched bears an' wolves an' one very difficult owl." },
      },
      choices = {
        { text = "Put my beast on it, not my kills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stitch my best trophy on it, big and proud.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only the once, an' he was very apologetic, but he'd been practisin' his fireball in a crowd. I stitch them tae last, but cloth is cloth, an' I'd thank ye tae practise in the Mystic Ward." } },
      choices = {
        { text = "I'll practise where it's safe, Lyesa. You have my word.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A mage who never practises in a crowd never learns control.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Skulls I'll do, an' flames, for every guild's got those, but I'll no' stitch a demon's sigil onto good Ironforge cloth. I had a lass ask me once, an' she couldnae tell me what it meant, which was worse." } },
      choices = {
        { text = "Then I'll ask for nothing you'd be ashamed of.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The sigil was only thread, Lyesa. You'd be well paid for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some think so, an' they come in wantin' plain grey wi' naught on it, which I'll make, though it breaks my heart a wee bit. Others want a sun or a moon or a hand, an' I'll stitch those too, for a crest that says what ye believe is no' pride, it's honesty." } },
      choices = {
        { text = "Plain grey suits a servant of the faith. Pride has no place.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the crest shine. Faith shouldn't be hidden.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Show me your tabards, Lyesa.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A few, for the dwarves who came home from Lordaeron an' wanted the old colours, though I had tae work from a sketch some old knight drew in the Stonefire Tavern. I got the hand wrong the first time, an' he made me unpick every stitch." } },
      choices = {
        { text = "He was right to. The colours deserve to be done properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A crest is only cloth. Nobody bleeds for a tabard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lyesa.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Somethin' plain an' dark wi' no beast on it at all, for I think a rogue's colours ought tae say they'd rather no' be noticed. Mind ye, I've stitched daggers an' skulls for young ones who wanted everyone tae know, an' they were sorry soon enough." },
      },
      choices = {
        { text = "Plain and dark suits me fine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd want daggers. Let them know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've a lovely white an' gold for a priest's guild, though I'll warn ye it shows every speck o' mud from here tae Thelsamar." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'll stitch ye a hammer or a sun or a gauntlet, an' I'll stitch it so it'll still be there when the Dark Irons have finished hittin' it." },
        { id = "h_default", key = true,
          text = "Lyesa Steelbrow, tabards. Once Jondor's written yer guild in his book an' ye've chosen a crest, I make the tabards tae match, an' I make them tae last." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've a lovely blue that would suit yer guild's tabard, an' I promise it won't catch if ye set somethin' alight beside it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll make ye a tabard, warlock, but I'll no' stitch in anythin' I'd be ashamed for my mother tae see." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want a tabard that'll take a blow an' still look proud, an' I make the only ones in the Commons that will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll want somethin' muted, I'd guess, for there's no sense stalkin' a bear in a bright red tabard." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, is it? I've stitched a good few crests for kaldorei guilds, an' they're terrible fussy about the exact shade o' green." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Ye'll be wantin' a tabard ye can take off quick, I imagine, an' I'll no' ask why." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I'd love tae make ye a tabard, though I'm no' sure what colours the elements prefer. Earth's brown, I suppose, but fire's a bonny red." },
      },
      again = {
        { id = "h_again", text = "What else about crests an' colors can I tell ye?" },
        { id = "h_again2", text = "Ask, then. I've a hem tae finish." },
      },
      choices = {
        { text = "Let me see your tabards.", next = "BUSINESS" },
        { text = "Why do guilds wear tabards at all?", next = "why" },
        { text = "What makes a good crest?", next = "crest" },
        { text = "You must be kin to Jondor.", next = "kin" },
        { text = "Do mages often set your tabards alight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What wouldn't you stitch for a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What crest would you stitch for a warrior's tabard?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What colours would suit a hunter's tabard, Lyesa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest's tabard be plain, Lyesa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you made tabards for the Silver Hand, Lyesa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What crest would you stitch for a druid like me?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What crest would you stitch for a rogue, Lyesa?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What crest would you give a dwarf shaman, Lyesa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "I hope you told them so.", next = "crest_tell" },
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
    wildhammer = { { id = "tp_wildhammer", text = "Wildhammer colors are all blues an' greens an' feathers, an' they wear them on their skin besides. I'd never get them intae a tabard, but I'd dearly love tae try." } },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand's tabard was the finest ever stitched, silver on blue an' a hand in mail. I've a sample in the back, an' nobody asks for it now, more's the pity." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "Red an' white an' far too much gold thread, an' I'll no' make one for anybody. A tabard should say who ye are, an' theirs says only who they hate." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd sooner it didnae, an' my family's been arguin' about it since dwarves started listenin'. My uncles want the vaults lined wi' somethin' the earth cannae hear through, but my mother says if the mountain wanted our gold, it would never have let us dig it out." } },
      choices = {
        { text = "I'd never pry into the Vault. Your trust is safe with me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the stone tells me, that's the stone's business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That's their business an' no' mine tae say, for the Stonemantles have never told one customer what another keeps. I'll only say that some o' yer people keep very old things here, an' they visit them like old friends." } },
      choices = {
        { text = "Discretion is a good rule. Keep their secrets well.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If it's kaldorei history, my people have a right to see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, for a warrior owns more steel than he can carry at once. I've a vault full o' spare shields for a mountaineer at Thelsamar, an' he's never once come back for one." } },
      choices = {
        { text = "The Vault's the place for it. I trust your door.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I keep my steel on my back, where I can reach it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, an' the ones who cure them first are welcome. I once had a bear hide in here that smelled so badly the whole row had tae be aired out, an' the Stonemantles have long memories." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' no beasts past the counter, if ye please, though yer {pet} looks better behaved than most o' my customers." },
      },
      choices = {
        { text = "I'll cure every hide before it comes near your vault.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A pelt's a pelt. It'll keep fine as it is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Many have tried, an' none have managed it, for the Vault was cut into the mountain by dwarves who knew a thing or two about thieves. The last fellow got as far as the second door an' then asked tae be let out, which we did, intae the guards' arms." } },
      choices = {
        { text = "I'd never rob a bank that keeps honest folk's savings.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every vault has a weakness. Nobody's found this one's yet.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Old ones, set by the Stonemantles' own mages long before Gnomeregan fell, an' renewed by the gnomes since. I'll no' tell ye more than that, but I'll tell ye the last mage who tested them woke up in the Commons." } },
      choices = {
        { text = "Good. Wards like that protect honest savings.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wards are puzzles, and I'd enjoy testing those someday.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Letters, mostly, an' books, an' now an' again a relic somebody's family wants kept safer than any chapel can keep it. I don't ask what they are, for the Stonemantles never ask, though one box hums at night, an' I'd take it kindly if its owner came back for it." } },
      choices = {
        { text = "A relic belongs in a chapel, where people can pray before it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better locked in the Vault than stolen from a chapel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about my vault instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once, durin' the Second War, when the city feared the Horde might reach the gates, an' my grandmother kept the ledgers by candlelight wi' a Silver Hand dwarf at the door. Nobody came, but she said she never slept so sound in her life." } },
      choices = {
        { text = "Guarding what others trust you with is honourable work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Guarding gold is a guard's job. A paladin has better work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Soleil.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Anythin' that breathes, whispers or tries tae open its own box, an' I've had all three in my time. My family's kept the Vault for generations, an' this door's never once been opened from the inside, so I'd like tae keep it that way." },
      },
      choices = {
        { text = "Fair rules. I'll keep my things quiet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A whispering box would liven the place up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Ye'll be keepin' a holy book or two in the Vault, I expect, an' I'll keep them dry for ye, as the Stonemantles keep everythin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The guards at the door stand a wee bit straighter when one o' yer sort comes in, an' I can't say I mind." },
        { id = "h_default", key = true,
          text = "Soleil Stonemantle, at yer service. The Stonemantles have kept the Vault o' Ironforge longer than anyone can remember, an' we've never lost so much as a button." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The Vault's guards have seen ye, rogue, an' they've seen the way ye looked at the doors. I'd look at them less, if I were you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' I'll ask ye no' tae blink yerself past the counter. It's been tried, an' the Vault has wards o' its own." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll be wantin' a safe place for yer spare axe, I expect, an' there's none safer than the Vault." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Ye'll be after a place tae keep yer pelts, I imagine, though I'd ask ye tae cure them first." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Vault. Ye kaldorei keep yer treasures in groves, I'm told, an' I confess I've never understood how ye lock a tree." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The Vault keeps all sorts, so I'll keep yours too, though I'll ask ye no' tae deposit anythin' that breathes." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'll ask ye kindly no' tae ask the stone what's in the Vault, for the Stonemantles have kept it quiet this long." },
      },
      again = {
        { id = "h_again", text = "Is there anythin' else about the Vault ye'd like tae know?" },
        { id = "h_again2", text = "Ask what ye like. Discretion is part o' the service." },
      },
      choices = {
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "How safe is the Vault, really?", next = "safe" },
        { text = "Every banker here seems to be a Stonemantle.", next = "family" },
        { text = "Can I store things in Stormwind as well?", next = "stormwind" },
        { text = "Someone must have tried to rob the Vault.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What wards does the Vault have?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors keep much in the Vault, Soleil?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters really store pelts in the Vault?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do priests keep in the Vault, Soleil?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have paladins ever defended the Vault, Soleil?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the kaldorei keep in your vault, Soleil?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would you refuse to keep in the Vault?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would the stone tell me what's in the Vault, Soleil?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Working with family must get tiresome.", next = "family_tired" },
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
    booty_bay = { { id = "tp_booty_bay", text = "The goblins keep their bank in Booty Bay, an' it's said tae have more locks than walls. I'd love tae see the door, though I'm sure ours is better." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Goblin banks will keep yer gold for ye an' charge for the keepin', an' charge again for the remindin'. Our vault has never sent a customer a bill for remembering their name." } },
    magni = { { id = "tp_magni", text = "The King's own treasury rests beneath us, an' the King never once asks what's in it, which I find very restful. He trusts the vault, an' the vault returns the favour." } },
    _none = { { id = "tp_none", text = "I'm afraid that's no' somethin' the Vault keeps a record of." } },
  },
}
