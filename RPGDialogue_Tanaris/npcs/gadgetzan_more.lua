-- Gadgetzan, more of the town: Mux Manascrambler (engineer of the supernatural), Shreev (the Gadgetzan
-- Gizmorium, and Razzeric's seaforium booster), Derotain Mudsipper (Thorium Brotherhood, imperial plate),
-- Nixx Sprocketspring (goblin engineering) and Jhordy Lapforge (gnome, the Ultrasafe Transporter).
-- Voice: bibles/gadgetzan_more.md
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mux Manascrambler
---------------------------------------------------------------------------
P:NPC {
  key = "mux", id = TODO_NPC("Mux Manascrambler"), name = "Mux Manascrambler",
  bible = "bibles/gadgetzan_more.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "excitable", "salesy" }, values = { "craft", "profit" },
  notices = { "craft", "class" },

  impression = {
    first = "He wants a machine that sees ghosts, and the money ran out.",
    third = "{name} met Mux Manascrambler, the Gadgetzan engineer building an extra-dimensional ghost revealer.",
  },

  greetings = {
    { id = "g_default", text = "Greetings, friend! Can I interest you in some ectoplasmic capacitors, or perhaps a nice omni-directional spectral assimilator?" },
    { id = "g_back", when = { metBefore = true }, text = "My favorite investor's back! Well, my favorite errand-runner, but in this town that's practically the same thing, pal." },
    { id = "g_ecto", when = { questActive = TODO_QUEST("Hunting for Ectoplasm") }, text = "Scorched ectoplasm from Silithus, frozen from Winterspring and stable from the Plaguelands, and don't forget to set the distiller down first, chum!" },
    { id = "g_away", when = { away = 21 }, text = "Gone {away}, and not a single ghost revealed in all that time. The machine's lonely, friend, and so's my ledger." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then you'll appreciate the elegance of a spectral assimilator, or at least you'll pretend to, which is all I ask of a customer." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "WARLOCK" } },
      text = "You deal with spirits for a living, don't ya? Then you're my target market, pal, and I'll want your opinion on my prototypes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mux Manascrambler, engineer of the supernatural, and if you think that's a contradiction, you haven't seen my invoices. I'm building an extra-dimensional ghost revealer, pal, and I'm one distiller, one power source and one rod short of a fortune." },
        { id = "h_young", when = { maxLevel = 54 },
          text = "You're a bit green for my line of work, friend, no offense, because the ghosts I need live in places that eat greenhorns for breakfast. Come back when you're tougher, and bring money." },
        { id = "h_distiller", when = { questDone = TODO_QUEST("The Ectoplasmic Distiller") },
          text = "The distiller works, pal, the distiller works! Now all it needs is ghosts in it, which is where you come in and where I stay home." },
        { id = "h_rod", when = { questDone = TODO_QUEST("A Shifty Merchant") },
          text = "The rod, the core, the ectoplasm, all of it! Put together right, we'll reach out to the souls that haven't quite left this world yet, and charge 'em a modest consultation fee." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Whoa, whoa, a customer who's already half ghost! No offense, pal, I mean that as a professional compliment." },
      },
      again = {
        { id = "h_again", text = "What else, pal? My assimilator's warming up." },
        { id = "h_again2", text = "Ask away, the questions don't cost ya, but the gadgets sure do." },
      },
      choices = {
        { text = "What's a ghost revealer for?", next = "revealer" },
        { text = "What do you need to build it?", next = "parts", when = { minLevel = 55 } },
        { text = "Where do I find the right ghosts?", next = "ghosts", when = { minLevel = 55 } },
        { text = "Where would I find the rod you need?", next = "imp", when = { minLevel = 55 } },
        { text = "Do you actually believe in ghosts?", next = "believe" },
        { text = "I'll see you around, Mux.", next = "END" },
      },
    },

    revealer = {
      big = true,
      lines = { { id = "re_default", text = "For finding the ones who haven't quite moved on, pal, and talking to 'em! Think of the market: lost inheritances, unfinished business, a buried chest nobody ever told the family about. Every ghost's a customer with a story and no wallet, so the family pays." } },
      choices = {
        { text = "The dead should be left in peace.", next = "re_more", fx = { align = { light = 1 } } },
        { text = "If the dead know something, I want to hear it.", next = "re_more", fx = { align = { light = -1 } } },
        { text = "Who pays you for all this?", next = "re_more" },
      },
    },
    re_more = {
      lines = { { id = "rem_default", text = "Right now? Nobody, which is the trouble, because I've run out of funds and manpower both. But once the thing works, they'll queue round the block from here to Steamwheedle Port, and you'll be able to say you knew me when." } },
      choices = {
        { text = "I'll help, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    parts = {
      lines = { { id = "pa_default", text = "First a distiller, to harvest the very fabric of death, which takes an arcanite converter, some greater eternal essences, stonescale oil and volcanic ash from the Burning Steppes for the filter. Plus forty gold, pal, because I'm broke, and I'm not ashamed to say it." } },
      choices = {
        { text = "And after the distiller?", next = "pa_core" },
        { text = "Forty gold? That's steep.", next = "pa_cost" },
      },
    },
    pa_core = {
      lines = { { id = "pac_default", text = "A portable power source, which means the magma core out of Magma Lord Bokk down in the Burning Steppes, south of Blackrock Mountain. An endless supply of heat, pal, and he won't need it once you're done with him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pa_cost = {
      lines = { { id = "pacc_default", text = "Steep? It's an investment, chum, in the future of supernatural engineering, and investments always feel steep until they pay off. Think of the reward I'm handing you as a dividend." } },
      choices = {
        { text = "Fine, then. Consider me invested.", next = "BACK", fx = { trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ghosts = {
      lines = { { id = "gh_default", text = "Different climates lend different consistencies to the spectral fabric of the dead, pal. The tortured night elves of Silithus, the highborne spirits of Winterspring and the ghosts and banshees of the Eastern Plaguelands each give a different ectoplasm, and I need all three." } },
      choices = {
        { text = "That's three corners of the world.", next = "gh_travel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_travel = {
      lines = { { id = "ght_default", text = "You need to travel a bit, I'm afraid, and by a bit I mean a lot. Think of it as sightseeing with a distiller, and be sure to put it down near the ghosts before you start harvesting, or you'll just be swinging at fog." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    imp = {
      lines = { { id = "im_default", text = "An imp in a cave at the mouth of Darkwhisper Gorge in southern Winterspring, who sells all manner of exotic goods, including an elemental rod that'd be perfect for channeling the core. I'm kicking myself for not buying it, pal, because he quoted me forty gold and I haggled." } },
      choices = {
        { text = "You haggled with an imp?", next = "im_haggle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    im_haggle = {
      lines = { { id = "imh_default", text = "I'm a goblin, pal, I haggle with everybody, including my own mother. Just make sure he only charges you forty, because that's the price he quoted me, and I'll know if you paid more." } },
      choices = {
        { text = "I'll hold him to it.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    believe = {
      lines = { { id = "be_default", text = "Believe? Pal, I've been to Darkshire, I've heard the Plaguelands moan at night, and I once sold a lamp to a man who swore his dead wife moved it every morning. Ghosts are real, and so is the money in 'em." } },
      choices = {
        { text = "Did she really move the lamp?", next = "be_lamp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    be_lamp = {
      lines = { { id = "bel_default", text = "I sold him three more lamps to find out, and she moved every one. Either it was a very busy ghost or a very clever cat, and either way he paid on time." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ectoplasm, ghosts, and the price of arcanite, pal." } },
    background = { { id = "tp_bg", text = "Gadget engineer turned ghost engineer. The money's in the dead, friend." } },
    advice = { { id = "tp_ad", text = "Never sell a haunted thing at a discount. The ghost's the feature, not the flaw." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel takes its cut, and I take mine, and the ghosts don't charge anybody." } },
    _none = { { id = "tp_none", text = "Is it dead or electrical? No? Then I don't know it, pal." } },
  },
}

---------------------------------------------------------------------------
-- Shreev
---------------------------------------------------------------------------
P:NPC {
  key = "shreev", id = TODO_NPC("Shreev"), name = "Shreev",
  bible = "bibles/gadgetzan_more.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "sardonic", "careful" }, values = { "craft", "safety" },
  notices = { "craft" , "race", "class" },

  impression = {
    first = "He is the only goblin I've met who believes in safety catches.",
    third = "{name} met Shreev, who runs the Gadgetzan Gizmorium and builds boosters for the goblin racers of the Shimmering Flats.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Gizmorium, pal. Touch nothing that's ticking, and if it's not ticking, still don't touch it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still got all your fingers? Good, keep it that way, it's bad for business when customers lose 'em in my shop." },
    { id = "g_booster", when = { questActive = TODO_QUEST("Safety First") }, text = "That's Razzeric the racer's booster in your bag, isn't it? Hand it over carefully, pal, like it's an egg made of fire." },
    { id = "g_away", when = { away = 21 }, text = "Gone {away}, and Razzeric's still alive, against every engineering principle I know." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer, and you're still whole, which tells me you respect a fuse. You're the rarest customer in Gadgetzan, friend." },
    { id = "n_b1", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and looking at my fuses like you could do better. Maybe you could, pal, but mine have never once gone off in the box." },
    { id = "n_b2", cat = "class", when = { class = "MAGE" },
      text = "A mage, huh? Do me a favor and keep the sparks in your sleeves, because this whole shop is one big fuse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shreev, proprietor of the Gadgetzan Gizmorium, and supplier of fine parts to the Mirage Raceway. My boosters go fast and stay in one piece, which is more than you can say for the drivers." },
        { id = "h_booster_done", when = { questDone = TODO_QUEST("Safety First") },
          text = "So I took the safety off for him, like he wanted. If he makes the slightest mistake, he won't be moving forward, he'll just be a burnt spot on the track, and I'll still want paying." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome in my shop! Relax, pal, I sell to both sides of the Raceway, though between you and me, your side's drivers at least wear helmets." },
      },
      again = {
        { id = "h_again", text = "What else? Talk, but don't lean on the counter, it's full of seaforium." },
        { id = "h_again2", text = "Ask away, friend. Questions don't explode, mostly." },
        { id = "h_again_b1", text = "Something else? Sure, pal, only stay on your side of the counter." },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "What's this about Razzeric's booster?", next = "booster" },
        { text = "Tell me about the Mirage Raceway.", next = "raceway" },
        { text = "A goblin who believes in safety?", next = "safety" },
        { text = "Everything in here is labeled twice.", next = "labels" },
        { text = "Where does a goblin get this much seaforium?", next = "seaforium" },
        { text = "What's your rule for a safe charge?", next = "charge", when = { profession = "Engineering" } },
        { text = "Do the gnome drivers buy from you too?", next = "gnomes", when = { race = { "Gnome", "Dwarf" } } },
        { text = "Goodbye, Shreev.", next = "END" },
      },
    },

    booster = {
      lines = { { id = "bo_default", text = "That booster is almost entirely seaforium explosives, pal, and I already modified it to deliver more of the payload on use. But Razzeric's never content unless he goes to eleven, and he wants the safety off, which is like asking me to take the bottom off a bucket." } },
      choices = {
        { text = "Will you do it?", next = "bo_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bo_do = {
      big = true,
      lines = { { id = "bod_default", text = "He's paying, so I'll do it, and you can tell him to be careful when he sets it off. Who knows if our nineteenth driver would be any good, and I'd hate to break in a new one." } },
      choices = {
        { text = "You should refuse. It'll kill him.", next = "BACK", reply = "Refuse a payin' customer? Pal, if I turned down every job that might kill the fellow, I'd have closed shop the day I opened it.", fx = { align = { honor = 1 } } },
        { text = "His neck, his choice, his gold.", next = "BACK", reply = "Now you sound like a proper businessman, friend, and I'll tell him you said so when they're pickin' him out of the dunes.", fx = { align = { honor = -1 } } },
        { text = "Nineteenth driver?", next = "bo_nineteen" },
      },
    },
    bo_nineteen = {
      lines = { { id = "bon_default", text = "We don't talk about the first eighteen, friend, except at the Raceway's yearly memorial, which has fireworks. They'd have wanted fireworks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    raceway = {
      lines = { { id = "ra_default", text = "Goblins against gnomes on the salt of the Shimmering Flats, pal, and the gnomes cheat with science and we cheat with explosives. I sell to both sides, because the Raceway pays my rent and I don't care who wins as long as somebody needs parts." } },
      choices = {
        { text = "Who usually wins?", next = "ra_win", fx = { learn = { "mirage_raceway" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ra_win = {
      lines = { { id = "raw_default", text = "Whoever's still on the track at the end, friend, which is usually about three racers, and one of them's on fire. The gnomes say they've won the most races, and the goblins say we've had the most exciting losses." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    safety = {
      lines = { { id = "sa_default", text = "I believe in repeat customers, pal, and a customer who blows himself up only buys once. A safety catch costs me a copper and saves me a client, and that's the best margin in the shop." } },
      choices = {
        { text = "That's sound business.", next = "BACK", fx = { affinity = 1, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    labels = {
      lines = {
        { id = "b_labels_default", text = "Once in Common and once in pictures, friend, on account of a customer who couldn't read and found out what the red powder does. He's fine, mostly, though he whistles when he breathes now." },
      },
      choices = {
        { text = "Do your neighbors worry about the shop?", next = "labels_neighbors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    labels_neighbors = {
      lines = {
        { id = "b_labels_neighbors_default", text = "Nixx Sprocketspring next door checks my storeroom every week, and I let him, because he's the best engineer in town and he works for free. The Bruisers just ask that I give 'em some warning, and I always say I will." },
      },
      choices = {
        { text = "Have you ever needed to warn them?", next = "labels_warn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    labels_warn = {
      lines = {
        { id = "b_labels_warn_default", text = "Once, pal, and I yelled plenty loud. The storeroom's got a new roof since then, and I stock the seaforium in smaller kegs, further apart, which is what I call learning from experience." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    seaforium = {
      lines = {
        { id = "b_seaforium_default", text = "It comes up from Booty Bay by boat to Steamwheedle Port, and then across the sand by kodo, real slow, with a goblin walking in front checking for holes. I pay triple for the careful drivers and it's worth every copper." },
      },
      choices = {
        { text = "What happens with a careless driver?", next = "seaforium_careless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seaforium_careless = {
      lines = {
        { id = "b_seaforium_careless_default", text = "There's a crater on the Steamwheedle road with a kodo saddle at the bottom of it, friend. I point it out to every new driver, and then we talk about my rates." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      lines = {
        { id = "b_charge_default", text = "Work out what you need, pal, then halve it, and then stand twice as far back as you think you should. I've sold ten thousand charges on that rule, and the folks who followed it all came back for more." },
      },
      choices = {
        { text = "Halve it and double the distance. I can do that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = {
        { id = "b_gnomes_default", text = "Sure they do, and they pay on time, and they read the instructions, which is more than I can say for my own side. Don't spread that around the goblin pit crew, though, or I'll be drinking alone." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Boosters, fuses, and how much seaforium is too much, which is less than everybody thinks." } },
    background = { { id = "tp_bg", text = "Started in a rocket shop in Undermine, and I'm the only apprentice from it who still has both ears." } },
    advice = { { id = "tp_ad", text = "If it hisses, step back. If it stops hissing, run." } },
    mirage_raceway = { { id = "tp_race", text = "Best customers I've got, pal, until they aren't customers anymore.", next = "raceway" } },
    steamwheedle = { { id = "tp_b_steamwheedle", text = "The Cartel licenses my explosives and takes a cut for the privilege, pal. In return nobody asks what's in the back room, and that suits us both." } },
    gadgetzan = { { id = "tp_b_gadgetzan", text = "Nice town, good custom, and the walls are thick, which matters in my line. If my shop ever goes up, the damage stops at the Bruisers' barracks, probably." } },
    _none = { { id = "tp_none", text = "Doesn't tick, doesn't blow, doesn't sell. Not my department, pal." } },
  },
}

---------------------------------------------------------------------------
-- Derotain Mudsipper
---------------------------------------------------------------------------
P:NPC {
  key = "derotain", id = TODO_NPC("Derotain Mudsipper"), name = "Derotain Mudsipper",
  bible = "bibles/gadgetzan_more.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brash", "mocking" }, values = { "craft", "profit" },
  notices = { "craft", "race" },

  impression = {
    first = "He's rude, he's good at what he does, and he knows it.",
    third = "{name} met Derotain Mudsipper, the Thorium Brotherhood smith in Gadgetzan who trades imperial plate plans for thorium.",
  },

  greetings = {
    { id = "g_default", text = "Aright, what d'ya want? If it ain't thorium, I ain't buyin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back fer more punishment, eh? I got plans, ya got bars, let's not waste each other's day." },
    { id = "g_away", when = { away = 30 }, text = "Gone {away}, and ya didn't bring me a single bar in all that time. Hmph." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! I can tell by the forearms, and by the way yer eyein' my anvil like it owes ya money." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf, starin' at a Dark Iron like he's seen a ghost. Relax, I'm Brotherhood, and the Brotherhood don't take orders from Thaurissan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Derotain Mudsipper, Thorium Brotherhood. I got a hot deal fer ya: I'm lookin' to offload some imperial plate recipes and need someone willin' to take on the burden. All I want in exchange is thorium bars, and a lot of 'em." },
        { id = "h_bs", when = { profession = "Blacksmithing" },
          text = "A smith, good, 'cause these plans ain't fer bakers. Imperial plate, the whole set, and it'll cost ya thorium till yer arms fall off." },
        { id = "h_young", when = { maxLevel = 54 },
          text = "Yer a bit soft fer what I'm sellin', and I mean that in the nicest way I know, which ain't very nice. Come back when ya can swing a thorium bar without wincin'." },
      },
      again = {
        { id = "h_again", text = "What else? I ain't got all day, and neither does the forge." },
        { id = "h_again2", text = "Speak up, I'm a busy dwarf." },
      },
      choices = {
        { text = "What's this hot deal?", next = "deal" },
        { text = "A Dark Iron in Gadgetzan?", next = "darkiron" },
        { text = "What's the Thorium Brotherhood?", next = "brotherhood" },
        { text = "That's a lot of thorium for one chestpiece.", next = "chest", when = { profession = "Blacksmithing" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    deal = {
      lines = { { id = "de_default", text = "Plans fer imperial plate: belt, boots, bracers, chest, helm, and the rest. Ya bring me the thorium, I hand ya the plans, and nobody asks where I got 'em." } },
      choices = {
        { text = "Where did you get them?", next = "de_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    de_where = {
      lines = { { id = "dew_default", text = "What did I just say about askin'? Fine, the Brotherhood keeps old plans, and old plans sell, and the Brotherhood needs thorium more than it needs secrets. That's all yer gettin'." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },

    chest = {
      lines = { { id = "ch_default", text = "Thirty bars fer the chest. Oh boy, there ya go again, are ya gonna run cryin' to the heavens about how life ain't fair? Toughen up, nobody ever said it was." } },
      choices = {
        { text = "I'm not crying. I'm calculating.", next = "ch_more", fx = { trait = { practical = 1 } } },
        { text = "You're a thief, Mudsipper.", next = "ch_more", fx = { affinity = -1 } },
      },
    },
    ch_more = {
      lines = { { id = "chm_default", text = "Heh, maybe I am, but I'm a thief with the plans, and yer the one who wants 'em. Bring me the bars, and wipe that look of disgust off yer face while yer at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    darkiron = {
      big = true,
      lines = { { id = "di_default", text = "Not every Dark Iron bows to Thaurissan and his fire lord, see. The Brotherhood work fer ourselves, and some of us work out here where the sun's hot and nobody's sacrificin' anybody to Ragnaros." } },
      choices = {
        { text = "Good. Breaking with a tyrant takes courage.", next = "di_more", fx = { align = { order = -1 } } },
        { text = "A clan should stand together, even under a bad king.", next = "di_more", fx = { align = { order = 1 } } },
        { text = "Do other Dark Irons trust you?", next = "di_more" },
      },
    },
    di_more = {
      lines = { { id = "dim_default", text = "Trust? Ha! The Shadowforge lot would melt me down fer a doorstop if they caught me, and the Ironforge lot cross the street when I walk by. Out here, nobody cares what color my beard is, so long as my goods are good." } },
      choices = {
        { text = "Then here's to good goods.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    brotherhood = {
      lines = { { id = "br_default", text = "Smiths, mostly Dark Iron, who'd rather sell their craft than burn fer a fire lord. Lokhtos Darkbargainer runs the trading in Blackrock Depths, and I run it out here, where the customers don't have to fight their way in." } },
      choices = {
        { text = "Who's Lokhtos?", next = "br_lok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    br_lok = {
      lines = { { id = "brl_default", text = "The Brotherhood's dealer, deep in the mountain, and a harder bargainer than me, if ya can believe it. Earn our trust and he'll sell ya things I can't, but ya'll pay fer every bit of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Thorium, plate, and what yer plans are worth. Ask." } },
    background = { { id = "tp_bg", text = "Dark Iron by birth, Brotherhood by choice, Gadgetzan by the sweat of my brow." } },
    advice = { { id = "tp_ad", text = "Never smelt thorium in a hurry. It knows, and it punishes ya fer it." } },
    dark_iron = { { id = "tp_di", text = "Not all of us are mad. Just most.", next = "darkiron" } },
    _none = { { id = "tp_none", text = "If ya can't hammer it, I don't know it, and I don't care." } },
  },
}

---------------------------------------------------------------------------
-- Nixx Sprocketspring
---------------------------------------------------------------------------
P:NPC {
  key = "nixx", id = TODO_NPC("Nixx Sprocketspring"), name = "Nixx Sprocketspring",
  title = "Goblin Engineering Trainer",
  bible = "bibles/gadgetzan_more.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "cocky", "fast" }, values = { "profit", "craft" },
  notices = { "craft" },

  impression = {
    first = "He sells goblin engineering like a revival preacher.",
    third = "{name} met Nixx Sprocketspring, Gadgetzan's goblin engineering trainer.",
  },

  greetings = {
    { id = "g_default", text = "Let me break down a little math for ya, pal: goblin plus engineering equals know-how, baby!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more math? Good, because I've got a whole ledger of it, and it all adds up to explosions." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer at the crossroads, pal! I can see it in your eyes: goblin or gnome, explosions or gadgets. Let me help ya decide, and by decide I mean pick goblin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nixx Sprocketspring, master of goblin engineering, and anyone who tells ya otherwise just doesn't know how to add. Goblin engineering is about practical uses for high profit and higher explosive power, pal, and I teach it right here." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, eh? Look, I know where your heart's leanin', but think about it: a gnome who builds goblin bombs, now that's a story they'd tell for years in Ironforge." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Every minute's a minute you're not blowing something up." },
        { id = "h_again2", text = "Go on, the pitch is free, the schemata ain't." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "What's this pledge of secrecy?", next = "pledge" },
        { text = "Goblin or gnome engineering, which is better?", next = "versus" },
        { text = "What can a goblin engineer actually build?", next = "build" },
        { text = "How'd you end up in Gadgetzan?", next = "gadgetzan" },
        { text = "I'd never turn my back on Gnomeregan for goblin bombs.", next = "gnome_never", when = { race = "Gnome" } },
        { text = "Dwarves were blowing things up before goblins were.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "So long, Nixx.", next = "END" },
      },
    },

    pledge = {
      lines = { { id = "pl_default", text = "Our schemata let ya make powerful bombs and mighty weaponry, and they're secret, so ya sign a pledge of life-long secrecy. Once you're a goblin engineer, that's that, pal, no gnome engineering for you ever, so think about it carefully." } },
      choices = {
        { text = "That's a big commitment.", next = "pl_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pl_more = {
      big = true,
      lines = { { id = "plm_default", text = "Course it is, pal, a secret's only worth somethin' if it's kept. Some folks think knowledge should be free, and those folks are generally broke." } },
      choices = {
        { text = "An oath is an oath. I'd keep it.", next = "BACK", reply = "You'd do well in the Cartel, pal, because a fellow who keeps his mouth shut is worth twice what a fellow who talks is worth.", fx = { align = { order = 1 } } },
        { text = "Knowledge should be shared, not locked in a ledger.", next = "BACK", reply = "Shared, eh? Then you can share your coin with me while I share nothin' back, and we'll see how long that idea lasts ya.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    versus = {
      lines = { { id = "ve_default", text = "Gnomes build things that do one clever thing very carefully, pal, and we build things that do one big thing very loudly. Ask yourself: when you're surrounded by trolls, do ya want clever or do ya want loud?" } },
      choices = {
        { text = "Loud, every time.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Clever keeps more fingers attached.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    build = {
      lines = { { id = "bu_default", text = "Bombs that crater a hillside, rocket helmets that knock a fella's head clean into next week, and the Goblin Jumper Cables XL, which bring a fella back from the dead about half the time. Half the time, pal, and you think about those odds next time you're face down in Blackrock!" } },
      choices = {
        { text = "Only half the time?", next = "build_cables" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build_cables = {
      lines = { { id = "bc_default", text = "Half the time beats none of the time, which is exactly what a gnome offers ya when you're lyin' in the dirt! The other half gets a little smoky, so stand back, but nobody's ever sued me from the grave, pal." } },
      choices = {
        { text = "What else is in the schemata?", next = "build_sapper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build_sapper = {
      lines = { { id = "bs_default", text = "The Goblin Sapper Charge, my pride and joy: ya strap it on, ya light it, and everything around ya has a very bad day, you included, a little. The insurance fellas call that collateral, and I call it a feature." } },
      choices = {
        { text = "That's a feature I could use.", next = "BACK" },
        { text = "Something else, Nixx.", next = "BACK" },
      },
    },
    gadgetzan = {
      lines = { { id = "gz_default", text = "Steamwheedle needed a guy to teach the trade out here where the Raceway and Booty Bay don't already have one, so I took the job and the sand in my shoes came free. Gadgetzan's neutral, pal, which means I sell to Horde and Alliance alike and they both pay full price." } },
      choices = {
        { text = "What do you make of Jhordy Lapforge?", next = "jhordy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jhordy = {
      lines = { { id = "jh_default", text = "The gnome with the transporter? Nice kid, terrible business sense, he's givin' away safety for free! I'll say this much, his machine turns folks into chickens about as often as mine blows 'em up, so on liability we're square." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome_never = {
      lines = { { id = "gnv_default", text = "Hey, nobody's askin' ya to betray anybody, pal, just to diversify your portfolio! But fine, go see Jhordy over there and learn his transporter, and when it turns ya into a chicken, ya know where my stall is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "With black powder and a lot of shoutin', sure, and I respect it, I really do. But a dwarf builds a cannon to last a hundred years and a goblin builds one to sell by Tuesday, and that's why we're the rich ones, pal." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Goblin engineering, pal, the only kind that adds up." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel keeps the peace and takes its cut, pal, and that's the best deal in Kalimdor." } },
    mirage_raceway = { { id = "tp_mr", text = "Rockets on wheels, pal! Goblin engineering's finest showroom, give or take a crash or six." } },
    background = { { id = "tp_bg", text = "Trained in Undermine, perfected in Gadgetzan, and never lost a limb I couldn't afford." } },
    advice = { { id = "tp_ad", text = "Read the manual twice, pal, then ignore half of it, but know which half." } },
    _none = { { id = "tp_none", text = "Don't know it, pal, and it doesn't add up to profit, so I don't care." } },
  },
}

---------------------------------------------------------------------------
-- Jhordy Lapforge
---------------------------------------------------------------------------
P:NPC {
  key = "jhordy", id = TODO_NPC("Jhordy Lapforge"), name = "Jhordy Lapforge",
  title = "Engineer",
  bible = "bibles/gadgetzan_more.md", role = "trainer", tier = "service",
  communities = { "gadgetzan" }, temper = { "earnest", "excitable" }, values = { "craft", "progress" },
  notices = { "craft", "race" },

  impression = {
    first = "He is very sure his matter transporter is safe.",
    third = "{name} met Jhordy Lapforge, the gnome engineer in Gadgetzan who teaches the Ultrasafe Transporter to gnomish engineers.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello, hello! Mind the cables, they're not live, probably, but mind them anyway." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! In one piece, too, which is always a good sign when you've used my transporter." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Tell me, did you get out of Gnomeregan with your notes, or did you leave them like I did? I still dream about my left-hand drawer." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Gnomish, I hope? If you're goblin, don't tell me, it'll only make me sad." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jhordy Lapforge, engineer! With some of the technology recovered by bold gnomes venturing back into Gnomeregan, I've built my greatest invention: the Ultrasafe Matter Transporter! All I need now is a skilled gnomish engineer to build a beacon attuned to it." },
        { id = "h_goblin_eng", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
          text = "Oh! A Horde visitor, in Gadgetzan, of course, everyone's welcome here. The transporter doesn't care what you are, though it might care how much you've eaten." },
      },
      again = {
        { id = "h_again", text = "What else? I can explain the transporter again, there are diagrams!" },
        { id = "h_again2", text = "Yes, yes? Ask anything, I love questions." },
      },
      choices = {
        { text = "Teach me the transporter.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Is it really ultrasafe?", next = "safe" },
        { text = "Technology from Gnomeregan?", next = "gnomeregan" },
        { text = "How does the transporter actually work?", next = "works" },
        { text = "Why build it in a goblin town?", next = "why_here" },
        { text = "I left Gnomeregan with nothing.", next = "gnome_nothing", when = { race = "Gnome" } },
        { text = "Would Ironforge want a transporter like this?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Mages teleport without any machines.", next = "mage", when = { class = "MAGE" } },
        { text = "Goodbye, Jhordy.", next = "END" },
      },
    },

    safe = {
      big = true,
      lines = { { id = "sa_default", text = "It's in the name! Well, mostly safe, sometimes there's a small side effect, like arriving somewhere slightly different, or arriving as a chicken for a moment, but everyone's turned back so far." } },
      choices = {
        { text = "Then you should warn people before they use it.", next = "sa_more", fx = { align = { honor = 1 } } },
        { text = "Don't mention the chickens. Nobody would buy it.", next = "sa_more", fx = { align = { honor = -1 } } },
        { text = "So far?", next = "sa_more" },
      },
    },
    sa_more = {
      lines = { { id = "sam_default", text = "Well, the readings are all within tolerances, and the tolerances are very generous, because I wrote them myself. Science is about risk, friend, and progress is about getting other people to take it first." } },
      choices = {
        { text = "That's not as reassuring as you think.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnomeregan = {
      lines = { { id = "gn_default", text = "Bold gnomes sneak back in and bring out bits of our old workshops, though the troggs and the leper gnomes make it terribly dangerous. Every scrap is a piece of home, and I've built my best work out of them." } },
      choices = {
        { text = "I'm sorry about your city.", next = "gn_more", fx = { learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gn_more = {
      lines = { { id = "gnm_default", text = "Thank you, that's kind of you to say. We'll take it back someday, I'm sure of it, and when we do, I'll transport straight into my old workshop, assuming I don't arrive as a chicken." } },
      choices = { { text = "I hope you do.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    works = {
      lines = { { id = "wk_default", text = "It breaks you down into a very orderly cloud of tiny parts, sends the cloud along a beam to the beacon, and puts you back together in the right order. Mostly the right order! I keep a checklist." } },
      choices = {
        { text = "Why do you need a beacon?", next = "works_beacon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    works_beacon = {
      lines = { { id = "wb_default", text = "Because without one the beam doesn't know where to stop, and you could come out anywhere, in the sea or the sky or the middle of a dune. The beacon here in Gadgetzan is the anchor, and only a gnomish engineer has the training to build one." } },
      choices = {
        { text = "Why only gnomish engineers?", next = "works_gnomish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    works_gnomish = {
      lines = { { id = "wg_default", text = "Because a goblin would sell it, take it apart to see which bit explodes, and then sell the pieces! Gnomish engineering is about making things that work beautifully, and the transporter needs that sort of patience, and a lot of very small screwdrivers." } },
      choices = {
        { text = "Something else, Jhordy.", next = "BACK" },
        { text = "Goodbye, Jhordy.", next = "END" },
      },
    },
    why_here = {
      lines = { { id = "wh_default", text = "The desert is perfect for testing, because there's nothing out there to land inside, and the goblins never ask awkward questions as long as I pay my rent to the Cartel. Nixx Sprocketspring keeps trying to poach my customers, but we get along, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome_nothing = {
      lines = { { id = "gno_default", text = "Oh, me too, friend, me too, except my goggles and one sock. We'll rebuild, though, you'll see, because we always do, and the very first thing I'm rebuilding is that left-hand drawer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Oh, I do hope so! King Magni's people have been so kind to us since the fall, and a transporter from Ironforge to anywhere would be my way of saying thank you, once I've sorted out the chickens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "They do, and it's ever so impressive, but they studied for decades and they can't teach a warrior to do it in an afternoon! My transporter works for anyone with an engineer and a beacon, and that's the difference between magic and progress." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Matter transportation, beacons, and diagrams, so many diagrams!" } },
    gadgetzan = { { id = "tp_gz", text = "Hot and sandy and full of goblins, but nobody's tried to irradiate it yet, which is lovely." } },
    steamwheedle = { { id = "tp_sw", text = "They charge rent on everything, even the shade, but they leave inventors alone, and I appreciate that." } },
    background = { { id = "tp_bg", text = "Gnomeregan born, Gadgetzan by circumstance, and transported in between, metaphorically." } },
    advice = { { id = "tp_ad", text = "Always check the beacon's calibration twice. Then once more, for luck." } },
    gnomeregan = { { id = "tp_gnome", text = "Our home, lost to radiation and troggs. We'll get it back.", next = "gnomeregan" } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that, but I could build something to find out!" } },
  },
}
