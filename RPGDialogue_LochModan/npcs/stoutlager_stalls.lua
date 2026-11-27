-- The Stoutlager Inn's traders and Thelsamar's shops: Yanni Stoutheart, Drac Roughcut, Vrok Blunderblast, Rann Flamespinner. Voice: bibles/stoutlager_stalls.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Yanni Stoutheart: general supplies at the Stoutlager Inn.
P:NPC {
  key = "lm_yanni", id = TODO_NPC("Yanni Stoutheart"), name = "Yanni Stoutheart",
  bible = "bibles/stoutlager_stalls.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "brisk", "cheerful" }, values = { "practical", "friendly" },
  notices = { "kit", "level" },

  impression = {
    first = "She can tell at a glance what is missing from a pack.",
    third = "{name} met Yanni Stoutheart, who sells general supplies at Thelsamar's Stoutlager Inn.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are! I've tucked the bits ye always forget under the counter, for I knew ye'd be back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Buy what ye need an' dinnae dawdle, for there's folk waitin'." },
    { id = "g_default", text = "I'm Yanni Stoutheart, an' I sell general supplies, so if ye need it on the road, I've likely got it under this counter somewhere." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me guess: ye ran out o' somethin' ye swore ye had plenty of." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were ye? Then yer pack's half empty, an' I'm glad tae see ye." },
  },

  notice = {
    { id = "n_green", cat = "level", when = { maxLevel = 12 },
      text = "First time this far from Dun Morogh, I'd wager. Buy a flask o' water before ye buy anythin' shiny; ye'll thank me on the road." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've been in a scrap or three, by the look o' yer straps. I sell thread, but no' miracles, so see Morhan about the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I sell what ye need an' never what ye want, so the mountaineers like me an' the bairns sulk past my stall. Flasks, rope, thread an' the like, an' all of it priced so ye can afford tae come back." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late for shoppin', friend, but the inn never really closes, so neither do I. What d'ye need?" },
        { id = "dd_sausages", when = { questDone = TODO_QUEST("Thelsamar Blood Sausages") },
          text = "Vidra's been wavin' a spoon at me, sayin' ye fetched her sausage fixin's. Her sausages are the best in Loch Modan, an' don't ever tell her I said so." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a crate o' candles that wants movin'." },
        { id = "h_again2", text = "Go on, then. I'm only countin' nails, an' I've lost my place already." },
      },
      choices = {
        { text = "I'd always tell you if you'd given me too much change.", next = "BACK", reply = "I know ye would, an' that's why ye're always welcome at this counter.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A shopkeeper who can't count deserves to be shortchanged.", next = "BACK", reply = "Then it's lucky I can count, an' quick, so keep yer coins where I can see them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What do travellers always forget?", next = "forget" },
        { text = "What's the gossip at the inn?", next = "gossip" },
        { text = "How's trade in Thelsamar?", next = "trade" },
        { text = "Good day, Yanni.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "fg_default", text = "Water, every time, an' then rope, an' then somethin' tae light a fire with when the wind's up off the loch. I've sold more flasks tae folk comin' back from the Badlands than folk goin', an' that's backwards." },
      },
      choices = {
        { text = "Then sell them before they go.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      lines = {
        { id = "gs_default", text = "Ye'd do better askin' the Hearthstoves, for they hear it all over the bar. What I hear is what folk buy, an' lately they're buyin' a lot o' rope for the dam road, which makes me wonder." },
      },
      choices = {
        { text = "Why rope for the dam road?", next = "gossip_rope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_rope = {
      lines = {
        { id = "gr_default", text = "Climbin', I'd guess, round the troggs on the north ridge, or somethin' worse. Chief Engineer Hinderweir's lot at the dam have been twitchy about Dark Irons up there, an' twitchy engineers buy rope." },
      },
      choices = {
        { text = "Better to be ready than sorry.", next = "BACK", reply = "That's what I tell maself, an' it's why I sell so much rope. Ye'd be surprised how many dwarves come back for a second coil after the first one snapped.", fx = { align = { order = 1 }, learn = { "stonewrought_dam" } } },
        { text = "Twitchy folk see spies in every shadow.", next = "BACK", reply = "Aye, they do, an' I sell them lanterns for every shadow. Still, there's somethin' up there, I'll grant them that.", fx = { align = { order = -1 }, learn = { "stonewrought_dam" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "td_default", text = "It's steady, like the loch. Ironforge folk come for the fishin' an' the sausages, the League comes for the digs, an' everyone needs a flask on the way out." },
      },
      choices = {
        { text = "Steady is good.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who buys the most from you?", next = "trade_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_who = {
      lines = {
        { id = "tw_default", text = "The mountaineers, for they go through flasks an' bootlaces like a forge goes through coal. After them, the young ones off tae the Badlands, who buy everythin' I tell them tae an' still come back short." },
      },
      choices = {
        { text = "The young ones should listen better.", next = "BACK", reply = "They should, but they never do. I give them advice for free an' they leave it on the counter with the change.", fx = { align = { order = 1 } } },
        { text = "The road teaches better than any shopkeeper.", next = "BACK", reply = "It does, I'll grant ye, but it charges a lot more than I do. I'd rather they learned from me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Thelsamar born, an' I've kept this counter since my uncle handed it over wi' a bad back an' a crate o' unsold candles." } },
    advice = { { id = "tp_ad", text = "Pack for the trip ye'll have, no' the one ye're hopin' for." } },
    _none = { { id = "tp_none", text = "If I don't sell it, I probably don't know it. Try the bar." } },
  },
}

-- Drac Roughcut: tradesman at the Stoutlager Inn.
P:NPC {
  key = "lm_drac", id = TODO_NPC("Drac Roughcut"), name = "Drac Roughcut",
  bible = "bibles/stoutlager_stalls.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "gruff", "dry" }, values = { "practical", "craft", "honest" },
  notices = { "craft" },

  impression = {
    first = "He is gruff until he decides a customer is serious.",
    third = "{name} met Drac Roughcut, the tradesman at Thelsamar's Stoutlager Inn.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, an' welcome. I've a fresh crate o' flux in, an' I put the best of it aside for ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer goods an' go, for I've nae patience for ye today." },
    { id = "g_default", text = "I'm Drac Roughcut, an' I sell trade goods. If ye're makin' somethin', I've likely got the bit ye're missin'." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, for I've restocked the flux an' I'd like somebody tae buy it." },
  },

  notice = {
    { id = "n_goblin_eng", cat = "craft", when = { profession = "Mining" },
      text = "A miner, by the dust on ye. Ye'll want Karm Ironquill for picks, but come back tae me when ye need flux for what ye dig." },
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Engineering", "Leatherworking", "Tailoring", "Alchemy", "Cooking" } },
      text = "Ye've a crafter's hands, which means ye'll actually buy somethin'. Come in, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I sell vials for the alchemists, flux for the smiths, spice for the cooks an' thread for anyone who's torn somethin'. I don't sell finished goods, for that's somebody else's livin', an' I don't stock rubbish, for that's mine." },
        { id = "h_cook", when = { profession = "Cooking" },
          text = "A cook! Vidra's always after my spices, an' she'll tell ye herself my spice is half o' what makes her sausages, though she'll no' say which half." },
      },
      again = {
        { id = "h_again3", text = "Still here? Then buy somethin' or ask somethin', for I'll no' have ye just standin' on my clean floor." },
        { id = "h_again", text = "What else? I've stock tae count." },
        { id = "h_again2", text = "Ask, then, but be quick about it, for there's a crate o' vials on the step that wants bringin' in before it rains." },
      },
      choices = {
        { text = "A crafter's only as good as the honest goods they're sold.", next = "BACK", reply = "Aye, so dinnae let anyone tell ye otherwise. Rotten flux makes rotten work.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the damp flux. Most crafters won't know it's spoiled.", next = "BACK", reply = "Most of them will, an' they'll tell everyone in Thelsamar by sundown.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Where do your goods come from?", next = "goods" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "Do you sell Vidra her spices?", next = "spice", when = { profession = "Cooking" } },
        { text = "You run a stall inside an inn.", next = "inn" },
        { text = "I mine my own ore. What do smiths run short of?", next = "miner", when = { profession = { "Mining", "Blacksmithing" } } },
        { text = "Good day, Drac.", next = "END" },
      },
    },
    goods = {
      lines = {
        { id = "gd_default", text = "From Ironforge, by cart through the tunnel at the North Gate, an' some by ship tae Menethil an' down the Wetlands road through Dun Algaz when it's clear. The carts are slow an' the ships are dear, an' I charge accordingly, though no more than I must." },
      },
      choices = {
        { text = "The Wetlands road is dangerous these days?", next = "goods_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods_road = {
      lines = {
        { id = "gr_default", text = "When isn't it? The Dragonmaw are thick on the Wetlands side o' the pass, an' I've lost two crates o' spice tae them this year that I know of. An orc wi' a taste for cinnamon, I suppose." },
      },
      choices = {
        { text = "Someone should drive the Dragonmaw off that road.", next = "BACK", reply = "Someone should, an' I'd buy them a round. Until then I'll keep payin' for crates I never see.", fx = { align = { honor = 1 }, learn = { "dragonmaw" } } },
        { text = "Pay a guard, or pay the orcs. It's all trade.", next = "BACK", reply = "Ye sound like a goblin, an' maybe ye're right. But I'll no' pay an orc for my own spice, no' while I've breath.", fx = { align = { honor = -1 }, learn = { "dragonmaw" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "by_default", text = "Ghak the alchemist buys the most, for vials, an' he breaks them faster than I can bring them in. Then Morhan the smith for flux, an' then every young dwarf who thinks he'll be a tailor, right up until he pricks his thumb." },
      },
      choices = {
        { text = "Ghak breaks that many?", next = "buyers_ghak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_ghak = {
      lines = {
        { id = "bg_default", text = "Some he breaks, an' some explode, an' he counts those separately, for reasons I've stopped askin' about. Between Ghak an' his wee gnome still, I sell more glass than anyone this side o' Ironforge." },
      },
      choices = {
        { text = "Then his explosions are good for business.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    spice = {
      lines = {
        { id = "sp_default", text = "I do, an' she's never once told me what she does wi' it. I've a guess, but if I said it aloud she'd stop buyin', so I'll keep my guess an' my customer." },
      },
      choices = {
        { text = "A good merchant keeps a secret.", next = "BACK", reply = "It does, an' it keeps a customer too. I'll take my guess tae the grave, or at least tae the next harvest.", fx = { align = { honor = 1 } } },
        { text = "Tell me your guess anyway.", next = "BACK", reply = "An' lose my best spice buyer? No' a chance, friend. He'd hear it was me by suppertime.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "in_default", text = "Aye, an' I pay Innkeeper Hearthstove for the corner, which is cheaper than a roof o' my own. Every traveller on the loch comes through that door sooner or later, an' most o' them have torn or broken somethin' on the way." } },
      choices = {
        { text = "And the noise doesn't bother you?", next = "inn_noise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_noise = {
      lines = { { id = "nn_default", text = "It bothers me every night, an' I've learned tae count stock through a drinkin' song. The mountaineers come off watch thirsty an' loud, an' I'll no' grudge them, for it's their watch that keeps my carts comin'." } },
      choices = {
        { text = "They've earned their noise.", next = "BACK", reply = "They have, an' I've told them so exactly once. I'll no' be repeatin' it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = { { id = "mn_default", text = "Flux, always flux, an' coal in the winter when the carts are slow through the tunnel. Morhan Coppertongue would buy every ingot ye smelt, too, so dinnae haul yer copper all the way tae Ironforge for the sake o' a few coins." } },
      choices = { { text = "I'll see Morhan first, then.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    thelsamar = { { id = "tp_thel", text = "A small town that eats well an' argues loud. I've traded in worse, an' I'd no' move now." } },
    background = { { id = "tp_bg", text = "I carted goods between Ironforge an' the loch for years before I settled. My back decided for me." } },
    advice = { { id = "tp_ad", text = "Buy good flux. Cheap flux ruins a better day's work than ye'd believe." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The Dragonmaw are orcs on the Wetlands side o' the pass, an' they've cost me two crates o' good spice." } },
    _none = { { id = "tp_none", text = "Not my trade. Ask somebody who's paid tae know it." } },
  },
}

-- Vrok Blunderblast: gunsmith in Thelsamar.
P:NPC {
  key = "lm_vrok", id = TODO_NPC("Vrok Blunderblast"), name = "Vrok Blunderblast",
  bible = "bibles/stoutlager_stalls.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "jovial", "eager" }, values = { "craft", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "He is loud, cheerful and very fond of the word 'boom'.",
    third = "{name} met Vrok Blunderblast, Thelsamar's gunsmith.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' still wi' all yer fingers! That's my favourite kind o' customer." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer shot, an' dinnae point anythin' at me on the way out." },
    { id = "g_default", text = "I'm Vrok Blunderblast, an' I sell guns an' shot, an' aye, the name's earned. Come in, an' don't touch anythin' that's pointed at ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more shot already? Ye've been busy, an' I like a busy customer." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Now there's a customer who knows the difference between a rifle an' a club wi' a hole in it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", class = { "HUNTER", "WARRIOR", "ROGUE" } },
      text = "A dwarf who fights for a livin'! Then ye already know the finest sound in Khaz Modan is a good barrel goin' off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I sell shot an' pouches for anyone wi' a gun, an' repairs for anyone wi' a gun that's stopped bein' one. The mountaineers keep me in business, for the troggs never run short an' neither should they." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good! I've heavy shot in for the bears up by Farstrider, an' light shot for anythin' ye'd rather no' ruin the hide of." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A kaldorei! Yer folk favour the bow, I know, but ye've never heard a blunderbuss in a canyon, an' I'd dearly like tae change that." },
      },
      again = {
        { id = "h_again", text = "What else? I've a barrel cleanin' that won't clean itself." },
        { id = "h_again2", text = "Go on, ask, an' mind ye stand clear o' the bench while ye do." },
      },
      choices = {
        { text = "Every gun should be sold with a fair warning about its kick.", next = "BACK", reply = "Aye, an' that's why my customers have all their teeth, mostly.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the customer learn about the kick the hard way.", next = "BACK", reply = "Ha! That's how I earned my name, an' I'd no' wish it on anyone else.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "How did you earn the name Blunderblast?", next = "name" },
        { text = "Why guns, and not bows?", next = "guns" },
        { text = "Who's your best customer?", next = "customers" },
        { text = "Good day, Vrok.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "My grandfather packed a barrel wi' twice the powder it was built for, tae see what would happen. What happened was the family name, an' a hole in the smithy roof we never mended, for he said it let the smoke out grand." },
      },
      choices = {
        { text = "That's how progress is made.", next = "BACK", reply = "Progress, aye, an' a fine name for it. My grandfather said the same, wi' one less finger tae point.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "That's how fingers are lost.", next = "BACK", reply = "Aye, an' a few eyebrows besides. But the name stuck, an' so did the family trade, an' my grandsire never grew his eyebrows back.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = {
        { id = "gn_default", text = "A bow's a fine thing if ye've the arms o' an elf an' the patience o' a tree. A gun only asks that ye point it, an' a dwarf can always point." },
        { id = "gn_elf", when = { race = "NightElf" },
          text = "No offence tae yer people, friend, but a bow wants arms like yours an' the patience o' a tree, an' I've neither. A gun only asks that ye point it." },
      },
      choices = {
        { text = "Where do the best guns come from?", next = "guns_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns_where = {
      lines = {
        { id = "gw_default", text = "Ironforge, an' I'll fight anyone who says different, though the gnomes make a fair scope. Tinkers want everythin' tae whistle an' spin, mind, an' I just want it tae go boom when I ask." },
      },
      choices = {
        { text = "Simple and reliable is best.", next = "BACK", reply = "Simple an' reliable, aye, that's Ironforge in a word. Ye'll find nothin' else on my rack.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Give me the gnomish scope every time.", next = "BACK", reply = "The scope, aye, but no' the rest o' their whistlin' nonsense. I'll sell ye one, but it'll be on a proper dwarven stock.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "The mountaineers, by a long way, for Mountaineer Kadrell's lot fire more shot at the troggs than I'd have thought there were troggs. After them, the dam engineers, who buy powder an' then look guilty about it." },
      },
      choices = {
        { text = "Why guilty?", next = "customers_dam" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_dam = {
      lines = {
        { id = "cd_default", text = "Because Chief Engineer Hinderweir's told them no' tae go blastin' near the dam, an' they go blastin' near the dam. I sell the powder an' keep my nose out, for a gunsmith wi' opinions doesnae stay in business." },
      },
      choices = {
        { text = "You should tell Hinderweir.", next = "BACK", reply = "Tell Hinderweir? He'd have me shut down by mornin'. I'll keep my nose out an' my powder dry.", fx = { align = { order = 1 }, learn = { "stonewrought_dam" } } },
        { text = "What they do with it isn't your concern.", next = "BACK", reply = "That's my thinkin', an' it's kept me in business. I sell rifles, friend, no' sermons.", fx = { align = { order = -1 }, learn = { "stonewrought_dam" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Three generations o' Blunderblasts have worked this trade, an' every one o' us has lost an eyebrow tae the trade." } },
    advice = { { id = "tp_ad", text = "Keep yer powder dry an' yer barrel clean, an' never look down the end tae see why it didnae fire." } },
    _none = { { id = "tp_none", text = "If it doesnae go bang, I'm no' the dwarf tae ask." } },
  },
}

-- Rann Flamespinner: tailoring supplies in Thelsamar.
P:NPC {
  key = "lm_rann", id = TODO_NPC("Rann Flamespinner"), name = "Rann Flamespinner",
  bible = "bibles/stoutlager_stalls.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "calm", "wry" }, values = { "craft", "patient" },
  notices = { "craft", "kit" },

  impression = {
    first = "He is too polite to say what he thinks of your clothes.",
    third = "{name} met Rann Flamespinner, who sells tailoring supplies in Thelsamar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, come in, come in! I've a new bolt o' Stormwind blue, an' I thought o' ye the minute it came off the cart." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer thread, an' mind the bolts on yer way out." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're late, but come in. I cannae match colours by candle, mind, so dinnae ask me tae." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "I'm Rann Flamespinner. Come in, wee friend, an' I'll show ye where I keep the short-cut patterns, for I had a gnome customer who taught me tae stock them." },
    { id = "g_default", text = "I'm Rann Flamespinner, an' I sell thread an' dye an' patterns. Come in, friend, an' mind ye don't tread on the bolts." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Is that the shirt I sold ye the pattern for? It's come out better than I'd hoped." },
  },

  notice = {
    { id = "n_dwarf", cat = "kit", when = { race = "Dwarf", class = { "WARRIOR", "PALADIN" } },
      text = "Ye've a padded coat under that mail, an' it's worn through at the elbows. I've quilted linen that'd save yer skin, if ye can sew a straight line." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! I can tell by the stitchin' on yer cuffs, an' I've seen enough stitchin' tae know good work when it walks in." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Ye're wearin' very little, friend, an' the wind off the loch is no' kind. I've linen, if ye've a needle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I sell thread an' dye an' a pattern or two for anyone who'd sooner sew than buy. It's quiet work in a loud town, an' I like it that way." },
        { id = "h_mage", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "A robe-wearer, an' ye'll be wantin' to mend it yerself one day, for robes tear in the oddest places. Come an' look at the silk thread." },
      },
      again = {
        { id = "h_again3", text = "Ask what ye like. A question's easier tae untangle than a skein, most days." },
        { id = "h_again", text = "What else? Take yer time, for there's no hurry in thread." },
        { id = "h_again2", text = "Go on. I'll keep spinnin' while ye think." },
      },
      choices = {
        { text = "A tailor should never pass off another's pattern as their own.", next = "BACK", reply = "Aye, that's right. Every pattern I sell has the maker's name stitched in the corner.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Copy a rival's pattern and sell it as your own.", next = "BACK", reply = "Then ye'll sell it once, an' every tailor in Khaz Modan will know yer name after.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why 'Flamespinner'?", next = "name" },
        { text = "Who does tailoring in a mining town?", next = "who" },
        { text = "Who are your neighbours in trade here?", next = "neighbours" },
        { text = "I sew a little. What should I buy first?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Good day, Rann.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "My mother dyed cloth red, the kind o' red ye'd see in a forge, an' she sold it tae half the clans in Ironforge. The name came wi' the colour, an' I kept it, though I sell blue as often as red these days." },
      },
      choices = {
        { text = "Do you still make the red?", next = "name_red" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_red = {
      lines = {
        { id = "nr_default", text = "I do when I can get the right root, which grows on the far side o' the Wetlands an' costs me dear. Some years I make it, an' some years I sell my last bolt an' tell folk tae wait." },
      },
      choices = {
        { text = "A family craft is worth keeping alive.", next = "BACK", reply = "It is, an' that's why I keep payin' for the root. My mother would turn in her grave if the red died wi' me.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Find a new colour. Times change.", next = "BACK", reply = "A new colour? Ye might as well tell me tae change my name. My grandmother dyed that red in Dun Morogh, an' it'll stay red.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "More than ye'd think. Miners tear their sleeves every day, the mountaineers need cloaks for the hills, an' the League folk come back from their digs wi' their trousers in ribbons." },
      },
      choices = {
        { text = "And do they mend them themselves?", next = "who_mend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_mend = {
      lines = {
        { id = "wm_default", text = "The mountaineers do, an' badly, an' I've never had the heart tae tell them. The League folk bring them tae me an' expect miracles, an' I give them patches, which is near enough." },
      },
      choices = {
        { text = "Tell the mountaineers. They'd want to know.", next = "BACK", reply = "They would, an' they'd be hurt, an' they'd keep mendin' badly. I'd rather they kept tryin' an' I kept fixin'.", fx = { align = { honor = 1 } } },
        { text = "Kindness is worth a crooked seam.", next = "BACK", reply = "It is, an' I'll keep sayin' nothin' about it. The mountaineers have troggs tae worry about, no' my stitches.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "What's the strangest thing you've mended?", next = "who_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_strange = {
      lines = {
        { id = "ws_default", text = "A gnome's flyin' harness, after he'd come down in the loch wi' it, an' I'll say it still smelled o' fish when he took it away. He paid me in cogs, which I've kept in a jar, for I've no idea what else tae do wi' them." },
      },
      choices = {
        { text = "Keep them. They might be worth something.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    neighbours = {
      lines = { { id = "nb_default", text = "Drac Roughcut has the trade goods in the Stoutlager, an' he an' I split the thread custom wi'out ever havin' discussed it. Yanni Stoutheart sells the general goods, an' Vidra Hearthstove feeds the lot o' us." } },
      choices = { { text = "It sounds a settled sort of town.", next = "BACK", reply = "It is, an' I'd no' have it otherwise. I've had my fill o' cities.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Coarse thread an' a bolt o' linen, an' dinnae let anyone sell ye silk till yer seams lie flat. I've watched young tailors ruin good cloth because they wanted a robe before they could manage a shirt." } },
      choices = { { text = "Linen first. I'll be patient.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    dyes = { { id = "tp_dyes", text = "Red from root, blue from a flower that grows by the loch, an' black from oak gall an' iron. The black's the easiest an' the red's the dearest, an' folk always want the red." } },
    thelsamar = { { id = "tp_thel", text = "Loud, friendly an' full o' sausage smoke. It's a good town for a quiet dwarf, for nobody notices ye sayin' nothin'." } },
    background = { { id = "tp_bg", text = "I'm the son o' a dyer from Ironforge. I came tae the loch for the quiet an' stayed for the sausages." } },
    advice = { { id = "tp_ad", text = "Double the thread at the shoulder. That's where everything tears first." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend. Thread's my business, an' it keeps me busy enough." } },
  },
}
