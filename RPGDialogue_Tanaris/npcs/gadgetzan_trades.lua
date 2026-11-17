-- Gadgetzan's tradesmen with nothing to say until now (0.39.0): the auction house, the stables,
-- the engineering hut and the mining trainer. Voice: bibles/tanaris.md ("Gadgetzan's trades")
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "beardo", id = TODO_NPC("Auctioneer Beardo"), name = "Auctioneer Beardo",
  bible = "bibles/tanaris.md", role = "auctioneer", tier = "service",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "profit" },
  notices = { "purse" },

  impression = {
    first = "Auctioneer Beardo runs Gadgetzan's auction house, where Horde and Alliance goods share one ledger. He talks prices the way other people talk weather, and he never once stopped smiling.",
    third = "{name} met Auctioneer Beardo, who runs the neutral auction house in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Buying or selling, friend? Either way the Cartel takes its little slice, and either way I'm happy to see you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Something of yours sold while you were out, or it didn't, and either way I've got a listing with your name on it." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 2000000 } },
      text = "Now there's a purse that walks into an auction house and makes the whole room sit up straight. Welcome, welcome, and do browse slowly." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sell well? They sell twice, friend, once when a warrior buys a new blade and again when he outgrows it and lists the old one. The Horde bids on Alliance steel and the Alliance bids on Horde axes, and I take a cut every time, smiling." } },
      choices = {
        { text = "I'd sooner earn my blade in battle than buy it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gold buys victories as surely as steel does.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because it hatched in the middle of a bidding war, and the winning bidder was frozen stiff before he'd paid. Now the Cartel's rule is that I can't list anything alive, which I think is very unfair to hunters, frankly." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not that I'd ever list {pet}, of course, so you can stop holding that lead quite so tight, friend; I'm smiling, but I mean it." },
      },
      choices = {
        { text = "The Cartel's right. Live beasts shouldn't go up for bidding.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a hunter wants to sell a beast, that's his business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I auction off anything the Cartel doesn't forbid, friend, and the Cartel only forbids what it can't sell. The troll who consigned it swore it was harmless, and the Forsaken who outbid everyone swore it was anything but." } },
      choices = {
        { text = "If the Cartel allows the sale, I won't argue with it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things belong to the loa, whatever the Cartel says.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Elemental essences, mostly, earth and fire and water, bottled by folk who don't say where they got them. Fire went up in price after somebody brought a crate in from Un'Goro, and I'm still not sure that crate's finished being on fire." } },
      choices = {
        { text = "Bottling elements is cruel. Those essences were alive.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Supply and demand. If it's bottled, it's for sale.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, every week, I'd imagine, and I'd never be able to prove it. The Cartel's rule is that a thing in my ledger belongs to whoever listed it, and I've found that rule keeps the peace better than any lock." } },
      choices = {
        { text = "Stolen goods shouldn't be sold here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What's listed is listed. That's fair trade.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk business instead.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Close enough for my ledger, friend, because you both turn sparkly things into gold. If you ever take up enchanting, come and see me first, because I can get you a price in Gadgetzan that Stormwind or Orgrimmar would never match." } },
      choices = {
        { text = "Arcane goods shouldn't be sold to the enemy.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gold is gold, whoever's paying it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Turn up? Friend, half of Tanaris passes through this house sooner or later, and I don't ask a seller where his boots have been. The Cartel's rule is that a fair sale is a fair sale, and I'd be out of business by sundown if I played judge over every pair of gloves." } },
      choices = {
        { text = "Selling a dead man's gear without asking is no fair sale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Not asking questions is good business, Beardo.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Pelts from beasts that had no business being hunted, eggs from nests that should have hatched, that sort of thing. I don't hunt them, I only sell them, and if I didn't, someone in Booty Bay would." } },
      choices = {
        { text = "Trade's trade. You didn't kill anything yourself.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "If no one bought them, no one would hunt them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Cursed rings, haunted swords, a jar that a gnome swore had a demon in it and turned out to have a very angry beetle. I've learned to look at everything twice, and when in doubt, I call the Bruisers and let them open it." } },
      choices = {
        { text = "Sensible rules. I'll keep to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules like that cost you the best sales, Beardo.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Anything that comes out of Zul'Farrak, for a start, because the trolls put curses on things the way other folk put locks. I sell them all the same, mind you, but I write 'buyer beware' on the tag, and I mean it." } },
      choices = {
        { text = "Selling cursed goods is wrong, warning or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A warning's fair. Buyers can decide for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Carved totems sell well, by the way, and if your spirits ever want to put anything up for auction, I'll take the usual cut and ask no questions." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've had candles, holy symbols and one alleged loa mask through the auction house this week, and if you're buying, the bidding opens right now." },
        { id = "h_default", key = true,
          text = "Auctioneer Beardo, at your service. This is the only house in Kalimdor where an orc can bid on a dwarf's old boots and nobody gets stabbed for it, so long as the Bruisers are watching." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The bidding never sleeps, friend, and neither do I, mostly. Desert nights are cool enough that the buyers come out like scorpions." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Now, I don't ask where my sellers get their goods, but I'd appreciate it if they came from a long way away, because the Bruisers do ask." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Wonderful, because enchanters' dust sells like water in a drought, and I've got bidders on both sides of the war waiting for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin at my counter! Welcome, welcome, and before you ask, everything on the block is honestly listed, or at least honestly enough for Gadgetzan." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Selling or buying? Plate goes fast in this house, because every adventurer in Kalimdor thinks the next suit will be the one that stops the Sandfury." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I've got rifles, bows, quivers, and once, very briefly, a basilisk egg, until the Bruisers made me take it down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at the auction house. I sell a lot of herbs here, and a few things you'd likely call cruel, so let's keep to the herbs, shall we?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock at the auction house! Bid on what you like, friend, but if you're selling, the Cartel's rules say nothing that bites, burns or whispers goes on my block." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, at the auction house! Are you buying or blessing? Because I've got a few lots that could use a blessing before anyone touches them." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The ledger's open." },
        { id = "h_again2", text = "Still with me? Good, because talking is free, and that makes it the only thing in here that is." },
      },
      choices = {
        { text = "What do you sell that a druid would call cruel?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does anything from the land itself pass through your auction?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what's up for auction.", next = "BUSINESS" },
        { text = "How is this house different from the city ones?", next = "neutral" },
        { text = "What sells best out here?", next = "sells" },
        { text = "Ever had stolen goods come through?", next = "stolen", when = { class = "ROGUE" } },
        { text = "Has anyone ever sold you stolen goods?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Mages and enchanters aren't the same thing, Beardo.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does stolen gear ever turn up on your auction block?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you really auction off a loa mask, Beardo?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors' weapons sell well at your auction, Beardo?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why did the Bruisers make you take down the basilisk egg?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What sort of things have people tried to sell here, Beardo?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Which lots need a blessing, Beardo?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "In Stormwind or Orgrimmar you only sell to your own side. Here the Cartel lists everything for everyone, Horde and Alliance alike, and charges a bigger cut for the privilege." },
        { id = "n_horde", when = { faction = "Horde" }, text = "In Orgrimmar you'd only sell to orcs and their friends. Here the Alliance can bid on your goods too, and the Cartel takes a bigger cut for making that possible." } },
      choices = {
        { text = "Why is the cut so much bigger?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "Because neutrality costs money, friend. Somebody has to pay the Bruisers who keep both sides civil, and somebody has to haul your goods across a desert, and that somebody is the commission." } },
      choices = {
        { text = "Peace between the factions is worth paying for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sounds like a goblin excuse for gouging.", next = "cut_gouge", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut_gouge = {
      lines = { { id = "cg_default", text = "Gouging is when you've got no choice, friend, and you can always walk back to your own city's house. But you came here, which tells me the price was worth it after all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "s_default", text = "Water skins and potions go fast, because the dunes are thirsty work. After that it's anything people drag out of Zul'Farrak, and cloth, always cloth, because everybody needs bandages sooner or later." } },
      choices = {
        { text = "Who buys the Zul'Farrak goods?", next = "sells_zf", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_zf = {
      lines = { { id = "sz_default", text = "Collectors in Booty Bay, mostly, and the odd scholar who wants a troll's idol for his shelf. I don't ask what happened to the troll, and I'd advise you not to tell me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stolen = {
      lines = { { id = "st_default", text = "Every item in this house was honestly found by somebody, friend, and I've no reason to wonder where. If the owner turns up with a receipt, the Bruisers will take it from there, and that's all I'll say." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've called bids for the Cartel longer than you've been carrying that pack, and I've never once missed a sale I could have made." } },
    advice = { { id = "tp_ad", text = "Never list something the morning after a big raid comes back, because everyone else is selling the same thing and the price drops like a stone." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel makes the rules here, and the rules are simple: everybody trades, nobody fights, and the house always takes its cut." } },
    _none = { { id = "tp_none", text = "If it isn't up for auction, I couldn't tell you what it's worth, and if I can't price it, I don't know about it." } },
  },
}

P:NPC {
  key = "laziphus", id = TODO_NPC("Laziphus"), name = "Laziphus", title = "Stable Master",
  bible = "bibles/tanaris.md", role = "stablemaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "weary" }, values = { "careful" },
  notices = { "pet" },

  impression = {
    first = "Laziphus keeps the stables in Gadgetzan and fights the heat on behalf of every animal in them. He pays the Water Company more than he'd like and complains about it to anyone who stands still.",
    third = "{name} met Laziphus, the goblin who keeps the stables in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Mind the troughs, they're full, and that's more than I can say for my purse after the Water Company's been round." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your {pet} is panting, friend. Let it have a drink before we talk business, because a hot beast is a cranky beast." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now and then, and I have to tell them a horse from Elwynn isn't built for Tanaris, so it spends the week in the shade drinking my water bill. You warriors ride your beasts as hard as you swing, and it's me who nurses them back after." } },
      choices = {
        { text = "A mount carries you into battle. It deserves better care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mount's a mount. Keep it fed and it'll do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I'd be grateful, friend, if your sort tends to animals, because the last priest through only blessed the riders. The fever comes from something in the old wells, I think, and the Water Company swears it's my fault for buying cheap." } },
      choices = {
        { text = "Every creature deserves care. Show me the sick ones.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A sick beast is a burden. Better to put it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Badly, and quietly, which is worse. A raptor that stops complaining is a raptor that needs a bucket thrown over it, and the Water Company charges me for every bucket." } },
      choices = {
        { text = "Then pay it. A keeper's beasts come before his purse.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ration their water. They'll toughen up soon enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They hate it, and they tell me so all night. The wolves pant, the cats sulk, and the only ones who seem happy are the scorpids people keep leaving with me, which I don't trust one bit." } },
      choices = {
        { text = "Some beasts belong to their own lands and shouldn't be dragged here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Beasts adapt, like the rest of us. They'll learn the desert.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Then it did something to that shade that looked a great deal like eating, and I'm not paying the Water Company to cool beasts that don't need cooling. Keep your demon with you, friend, and keep it out of the sun for your own sake." } },
      choices = {
        { text = "My demons are my business, not yours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fair. I'll keep my servant with me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "You'd be the first mage who offered, and I'd thank you for it. The heat here kills more animals than the scorpids do, and anyone who'd spare water for a beast that isn't theirs is welcome in my stable." } },
      choices = {
        { text = "Every creature deserves water in this heat.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I won't waste spells on animals.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Shade, water and patience, and a lot more of the last than the first two. The hunters leave me cats and wolves and scorpids and once, a turtle, and I treat every one the same, because a frightened beast in a small pen is a danger to everyone." } },
      choices = {
        { text = "Treating them all the same is fair and right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A scorpid isn't worth the same care as a wolf.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a goblin who wanted a hunter's cat to sell in Booty Bay, and the cat had other ideas. I found him the next morning up on the roof, and the cat asleep under it, and I've never had a lock on the pens since, because I've never needed one." } },
      choices = {
        { text = "I've no interest in stealing beasts. Your pens are safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A better thief would have charmed the cat first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, because the heat gets into them, and some of the hunters leave them longer than they should. I've buried two this year whose masters never came back from the desert, and I didn't know whether to feel sorry for the beasts or the hunters." } },
      choices = {
        { text = "Both deserve mourning. I'll pray for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're only beasts. You did all you could.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. The beasts settle when your kind are about, which is more than I can say for the Water Company's collectors." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, good, because two of my beasts came back from the dunes with a fever, and the Water Company won't sell me a drop extra to cool them." },
        { id = "h_default", key = true,
          text = "Laziphus, stable master. Hunters leave their beasts with me while they travel, and I keep them fed, watered and out of the sun, which in Tanaris is the hard part." },
        { id = "h_noon", when = { timeOfDay = "day" },
          text = "Come into the shade if you're talking to me, because I'm not standing out in that sun for anybody. The animals have the right idea; they haven't moved since breakfast." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid? Then you'll understand when I say every animal in this stable would rather be somewhere wetter, and frankly so would I." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "No, I don't stable demons, before you ask. Last warlock who left his voidwalker with me came back to find it had eaten the shade over three stalls." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you conjure water? My beasts drink more than the Bruisers, and the Water Company charges me as if every horse were a dragon." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, with no beast, which makes you my favorite kind of visitor today. You're not going to ask me to board a horse in this heat, are you?" },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You've got no beast for me, I suppose, unless that charger of yours needs stabling, and I'll warn you it'd hate the heat as much as you do." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue at my stables. If you're thinking of taking a beast that isn't yours, I'll tell you now that every one of them bites, and the scorpids do worse." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll find the beasts here don't care for prayers, but they do like a calm voice, and you look like you've got one." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a raptor that wants its lunch." },
        { id = "h_again2", text = "Ask away, but quickly, because the water's warming up while we chat." },
      },
      choices = {
        { text = "How do the beasts in your care feel about this desert?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do the animals bear this heat?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like to see my stabled animals.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you keep animals alive out here?", next = "heat" },
        { text = "What sort of beasts come through?", next = "beasts" },
        { text = "Do you keep mounts too?", next = "mounts" },
        { text = "Voidwalkers don't eat, Laziphus.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I could conjure water for your beasts.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you let me tend your sick beasts, Laziphus?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors ever leave their mounts with you, Laziphus?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How do you keep the beasts calm in this heat, Laziphus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has anyone tried to steal from your stables, Laziphus?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the beasts here ever fall ill, Laziphus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "Water, shade and wet cloth over the cages at noon. The water's the costly part, because the Wastewanders hold the best wells and Bilgewhizzle charges every drop he's got left." } },
      choices = {
        { text = "Couldn't the animals manage with less?", next = "heat_less" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_less = {
      lines = { { id = "hl_default", text = "A hunter who comes back to a dead wolf doesn't pay me, friend, and he tells all his friends not to pay me either. So no, they get as much as they want, and I grumble about it." } },
      choices = {
        { text = "Good. The animals deserve it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Seems a waste of water in a drought.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Wolves and cats from up north, mostly, and they hate it here. The ones caught locally, like the hyenas and the scorpids, are no trouble at all, since they think this is a lovely day." } },
      choices = {
        { text = "You keep scorpids?", next = "beasts_scorpid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_scorpid = {
      lines = { { id = "bs_default", text = "I keep what hunters bring me, and some of them bring scorpids. You feed them with long tongs and you never, ever turn your back on one, and that's all the training I got." },
        { id = "bs_hunter", when = { class = "HUNTER" }, text = "You'd know better than me why anyone tames a scorpid. I feed them with long tongs and count my fingers afterwards, and so far I've always got ten." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    mounts = {
      lines = { { id = "m_default", text = "No, friend, I only board hunters' companions; your horse or your kodo stays with you. Besides, a mount that's left in my shade for a week forgets it was ever meant to run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I took the stables because nobody else in Gadgetzan wanted to shovel after raptors, and there's always money in the work nobody wants." } },
    advice = { { id = "tp_ad", text = "Water your pet before you water yourself out there. You'll live through a dry afternoon, but it might not." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend; if it doesn't eat, drink or bite, it isn't my business." } },
  },
}

P:NPC {
  key = "buzzek", id = TODO_NPC("Buzzek Bracketswing"), name = "Buzzek Bracketswing", title = "Engineering Trainer",
  bible = "bibles/tanaris.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft", "race" },

  impression = {
    first = "Buzzek Bracketswing teaches engineering from a hut at the south end of Gadgetzan and talks about explosions with real affection. He respects anyone who can keep all ten fingers.",
    third = "{name} met Buzzek Bracketswing, the engineering trainer in Gadgetzan's southern hut.",
  },

  greetings = {
    { id = "g_default", text = "Careful where you step, that crate's live. No, the other one, that one's fine." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece, I see! That's the first sign of a promising engineer." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Scorch marks on your sleeves, and you still have your eyebrows. You're one of us, and a careful one at that." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in my hut! I won't hold it against you, as long as you don't call my work crude in front of the customers." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than you'd think! A good bomb clears a line of Wastewanderers faster than any axe, and you get to stand further back while it does, which keeps all ten fingers where they belong." } },
      choices = {
        { text = "My own arm does the work. I don't need bombs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a bomb wins the fight, I'll throw it gladly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bit of black powder in the wrong housing, that's all, and the hunter kept his eye, which I count as a success. These days I test every scope out the back on the dune Blizrik isn't using, and I haven't lost a lens in a month." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the workbench, though, because the last curious nose in here found a fuse, and I had to explain to the bank why the smoke was drifting their way again." },
      },
      choices = {
        { text = "Good hunting is patience and skill. Gadgets won't replace that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Any tool that gives me the edge, I'll use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Lost? None, friend, though a few have come back shorter in the eyebrows or the fingers, and one of them still walks funny. If you want to pray for anybody in Gadgetzan, pray for my apprentices, because they don't listen to me and the powder doesn't forgive." } },
      choices = {
        { text = "I'll pray for them, and patch them when the powder bites.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those who won't listen deserve the lesson. Let the powder teach.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I've wondered, honestly. After every big blast out back, the sand settles strangely for a day or two, like it's sulking, and the scorpids come up to look at the hole. Either the earth's annoyed, or the scorpids are admirers." } },
      choices = {
        { text = "The earth will answer one day. Mind your charges.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep blasting. The earth has survived worse than goblins.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what I tell my students, and it's true, but I've watched a rogue use blasting powder to open a strongbox and lose half a strongbox and two eyebrows. If you want to make things go bang, learn it properly, from someone who still has all his digits." } },
      choices = {
        { text = "Patience and care. That's the right way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sometimes you just need things to go bang.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Never mind explosives.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ha! Maybe, but when one of my gadgets goes wrong, I can take it apart and see why. When a spell goes wrong, you get a crater and a lot of questions, and I've seen enough craters to know which I prefer." } },
      choices = {
        { text = "Magic is more elegant than gears.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Engineering's more reliable. You're right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Probably, but the desert's creatures trouble me back, so I'd call it even. I blast at the southern end where there's nothing but sand and scorpids, and the scorpids have made their views very clear." } },
      choices = {
        { text = "Progress is noisy. The scorpids will adapt.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Even scorpids deserve some peace. Blast less.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only me, friend, and only by accident, and only when I'm working too fast. I teach every student the same thing: measure twice, light once, and stand behind something heavy, because that's the only way to get old in this trade." } },
      choices = {
        { text = "Good advice. Care keeps everyone safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Risk is the price of progress. Light the fuse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll admit I've wondered, because they don't mind heat and they're small enough to fit into the boilers. But the one time I tried it, the imp set the bellows on fire and laughed, and I don't think it was on my side." } },
      choices = {
        { text = "Demons don't belong in workshops. Leave it be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I could train mine to help, given time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Burns, mostly, and the odd broken finger, and once a gnome who blew himself clear over the town wall and landed in a cactus. They all come back, though, which tells you something about engineers." } },
      choices = {
        { text = "I'll keep bandages ready for your students.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They choose the risk. Let them learn from it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You call down lightning for free and I spend a fortune trying to bottle it, so I'd say that makes us colleagues, or rivals, or something in between." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? I'll bet you've patched up more engineers than any other trade, because we're the ones who stand too close to the boom." },
        { id = "h_default", key = true,
          text = "Buzzek Bracketswing, engineering trainer, at the southern end of town where the explosions don't bother the bank. If you've got the coin and the nerve, I'll teach you how to make things go bang on purpose." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Your lot always want to know about the explosives, and I always want to know how many fingers you'll have left when you're done." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Your lot never understand engineering, because you can just wave a hand and make things happen. We have to build them, piece by piece." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Don't touch anything on the bench, please, because you've got the hands of someone who hits first and reads the label later." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? I've got a scope that'll make your rifle see further than your beast can smell, and it only exploded the once." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You're probably here to complain about the noise, so get in line behind the vultures, because they were here first." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You're not here to tell me that explosives are against the Light, are you? Because I've heard that one, and the Light never seems to mind when it's an ogre on the other end." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Keep that imp away from my workbench, because it's the only thing in Gadgetzan more likely to set things on fire than my students." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, at the engineering hut! You're the first one who's come here without singed eyebrows, so either you're careful or you're lost." },
      },
      again = {
        { id = "h_again", text = "What else? I've got a fuse burning somewhere, I'm sure of it." },
        { id = "h_again2", text = "Go on, ask, but stand behind the crate while you do." },
      },
      choices = {
        { text = "Do your explosions trouble the desert's creatures?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does all your blasting shake the earth spirits loose?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Goblin or gnomish engineering: which is better?", next = "schools" },
        { text = "Why set up out here, at the edge of town?", next = "hut" },
        { text = "Can an engineer earn real money in Gadgetzan?", next = "money", when = { profession = "Engineering" } },
        { text = "Explosives are just another tool, Buzzek.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Engineering and magic aren't so different, Buzzek.", next = "xmage", when = { class = "MAGE" } },
        { text = "How many engineers have you lost to the boom, Buzzek?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is engineering any use to a warrior, Buzzek?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What happened when your scope exploded, Buzzek?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do your explosives ever hurt the wrong people, Buzzek?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could an imp actually be useful to an engineer, Buzzek?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do your students often get hurt, Buzzek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    schools = {
      lines = { { id = "s_default", text = "Goblin engineering makes things explode, and gnomish engineering makes things that might explode, but with more gears. If you want the goblin path, Nixx Sprocketspring is right next door; for the gnomish one, you'll have to find a gnome." },
        { id = "s_gnome", when = { race = "Gnome" }, text = "You'll say gnomish, and I'll say goblin, and we'll both be right about half the time. If you want the goblin path anyway, Nixx Sprocketspring is right next door, and he won't tell your friends." } },
      choices = {
        { text = "Explosions are the honest choice.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd rather build things that work properly.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut = {
      lines = { { id = "hu_default", text = "The bank asked politely, and then the Bruisers asked less politely. A man testing blasting powder doesn't make good neighbours, so I'm down here with the sand and the scorpids, who don't complain." } },
      choices = {
        { text = "Has anything ever gone badly wrong?", next = "hut_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut_wrong = {
      lines = { { id = "hw_default", text = "Define badly, friend. Nobody's died, the roof's been replaced twice, and I can hear perfectly well out of my left ear, so I call that a good record for an engineer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    money = {
      lines = { { id = "mo_default", text = "Plenty, if you sell to travelers. A water-finder that half works, a scope for a hunter's rifle, a bomb for the Wastewanders, and every one of them sells faster than you can build it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned in a workshop that doesn't exist anymore, for reasons I'd rather not explain to a customer." } },
    advice = { { id = "tp_ad", text = "Always measure the powder twice, and stand well back the first time you light it, however sure you are." } },
    _none = { { id = "tp_none", text = "If I can't build it, take it apart or blow it up, I don't know much about it." } },
  },
}

P:NPC {
  key = "pikkle", id = TODO_NPC("Pikkle"), name = "Pikkle", title = "Mining Trainer",
  bible = "bibles/tanaris.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "blunt" }, values = { "profit", "craft" },
  notices = { "craft", "race" },

  impression = {
    first = "Pikkle trains miners in Gadgetzan and treats every vein of ore as money someone else hasn't dug up yet. He knows where the good rock is and expects to be thanked for sharing it.",
    third = "{name} met Pikkle, the goblin who trains miners in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Pick, a good back and a little patience, friend; that's all mining takes, and I'll teach you the rest for a fee." },
  },

  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "There's rock dust in your boots, and that's the right kind of dirt. What have you been digging, and where?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf asking a goblin about mining? Either you're very humble or very lost, and I'll charge you the same either way." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Anyone can learn to swing a pick, but a warrior's the one still standing when the Dunemaul come down to see who's digging in their hills. There's iron and mithril in the hills here, and thorium west in Un'Goro if you're braver than me." } },
      choices = {
        { text = "A warrior should master more than one trade.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My arm is for fighting, not for digging rocks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every day, because a basilisk will curl up on a vein of mithril like it's guarding gold, and it won't move for anybody. I've lost more good ore to sleeping basilisks than to the Wastewanderers, and the basilisks don't even spend it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If {pet} could learn to chase a basilisk off a vein without getting stared stiff, I'd call it the most useful beast in Tanaris." },
      },
      choices = {
        { text = "The basilisks were there first. Mine around them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Ore's worth more than a basilisk's nap. Drive them off.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every miner prays, friend, mostly that the roof holds and the vein runs deeper than the last fellow's. The old troll diggings near Zul'Farrak are the worst, because the trolls left curses in the walls and the walls haven't forgotten them." } },
      choices = {
        { text = "Then I'll bless your tunnels before the next shift goes down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A troll curse is just old power. I'd dig it out myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Up in the hills round the edges, mostly, and in the old troll ruins, which is the trouble, because something always lives on top of the good veins. The deeper you dig the warmer the rock gets, too, and nobody's explained that to me yet." } },
      choices = {
        { text = "Take what the earth offers, and never more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dig it all out. The earth makes more.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Maybe, but nobody ever got arrested for mining a thorium vein. Mind you, the ogres in the hills might disagree, since they think every rock in Tanaris is theirs, and they're just as quick to crack your head for it." } },
      choices = {
        { text = "Honest work is still the best kind.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honest work doesn't pay as well.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the rich veins, where thorium grows thick, and sometimes there's a crystal locked inside it. Un'Goro's got good veins if you can dodge the devilsaurs, and I'll teach you to mine them if you'd rather not pay someone else for the privilege." } },
      choices = {
        { text = "I'd rather earn it myself than pay.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Better to pay an expert than risk my neck.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Pikkle.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not much lives in the hills where the ore is, just a few lizards and the odd basilisk, and they move along when I come. I fill the holes back in, mostly, because a rich vein is no good if the next fellow falls into it." } },
      choices = {
        { text = "Fill every hole. Leave the land as you found it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ore is ore. The land can mend itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than they should, and the Wastewanders are the worst, because they'll wait until you've dug out a nice vein and then take the whole lot. I tell my students to mine fast, mine quiet, and never mine alone." } },
      choices = {
        { text = "Then I'll guard the miners while they dig.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Miners should learn to defend their own claims.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every warlock who's tried tells me the same, so I'd guess so. Voidwalkers are strong enough, but they just stand there looking at the rock, and imps only want to set it on fire, which doesn't help anyone get the ore out." } },
      choices = {
        { text = "A pick and honest sweat, then. I'll learn it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mine could learn. It only needs the right orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's hard everywhere, but out here it's hot too, and the sand gets into the tunnels faster than you can clear it. I lost a student last year to a collapse, and I've made everyone mine in pairs ever since." } },
      choices = {
        { text = "I'll pray for him, and dig carefully.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Accidents happen. You can't save everyone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? You'll be telling me the earth has feelings, and I'll be telling you it has thorium, and we'll both be right, but only one of us gets paid." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Spend enough time down a mine and you'll start praying too, so I'll not laugh at you, but I'll not stop digging while you do it, either." },
        { id = "h_default", key = true,
          text = "Pikkle, mining trainer for Gadgetzan. The desert looks like nothing but sand, but there's metal under it and in the hills, and I'll teach you how to get it out." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You pick locks, I pick rock, and I'd wager my picks see a lot more honest work than yours do." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You'll be after arcane crystals, then, because every mage who comes through asks me where the rich thorium is. Don't look so surprised, it's always the same question." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior? You've got the shoulders for a pick, I'll give you that, and the patience of someone who hits things for fun." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, and you're looking at the hills instead of at me, which means you've already spotted something worth digging up or worth shooting." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I know your kind don't love a pick in the ground, but I only dig where nothing grows, and out here that's nearly everywhere." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Good, because there's ogres and bandits in half the hills worth mining around here, and I'd sooner send students with someone like you than on their own." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! You won't need a pick, I suppose, with a demon to do the digging, though I've never yet seen one that would." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, wanting to learn mining? Well, I've taught stranger, and the ore doesn't care who's swinging the pick." },
      },
      again = {
        { id = "h_again", text = "Anything else you want to know, or shall I get back to my ore samples?" },
        { id = "h_again2", text = "Ask, then. My time's not free, but my opinions very nearly are." },
      },
      choices = {
        { text = "Does mining here harm anything still living?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Where's the good ore in Tanaris, and what guards it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Where's the good ore around Tanaris?", next = "ore" },
        { text = "Is mining in the desert dangerous?", next = "danger" },
        { text = "Picking a lock takes more skill than mining.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Where would someone find arcane crystals?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do miners pray when they're deep in the earth, Pikkle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a warrior learn mining from you, Pikkle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the beasts out in the hills bother your miners, Pikkle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the miners often get attacked, Pikkle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a demon really refuse to dig, Pikkle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is mining hard work out here, Pikkle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Mithril and a little truesilver in the rocky hills around Tanaris, and you'll find it where the sand thins out to stone. For thorium, go west into Un'Goro Crater, where the rock is newer and so are the things that live there." } },
      choices = {
        { text = "What lives in Un'Goro?", next = "ore_ungoro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_ungoro = {
      lines = { { id = "ou_default", text = "Big lizards with teeth like pickaxes, friend, and plants that bite back. The folk at Marshal's Refuge will tell you more, but take a good sword along with your pick." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    danger = {
      lines = { { id = "d_default", text = "The rock won't hurt you, but the bandits will, because the Wastewanders like a miner who's already done the digging. Bring a friend, or dig fast, or both." } },
      choices = {
        { text = "I'll dig where I please and fight who comes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner sneak in, grab the ore and run.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I dug for the Cartel before I taught for it, and teaching pays almost as well without the cave-ins." } },
    advice = { { id = "tp_ad", text = "Sell your ore raw if you're in a hurry, but smelt it if you want to get paid properly." } },
    _none = { { id = "tp_none", text = "Not a rock, not my business, friend." } },
  },
}
