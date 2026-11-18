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
    first = "Mux Manascrambler is a goblin engineer who wants to build a machine that sees ghosts, and he's run out of money halfway through. He talks about ectoplasm the way other goblins talk about gold, which with Mux amounts to the same thing.",
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
    first = "Shreev runs the Gadgetzan Gizmorium and builds rocket parts for the Mirage Raceway, and he's the only goblin I've met who believes in safety catches. He thinks Razzeric is going to blow himself up, and he's mostly right.",
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
    first = "Derotain Mudsipper is a Dark Iron dwarf of the Thorium Brotherhood who sells imperial plate plans for mountains of thorium and tells his customers to toughen up. He's rude, he's good at what he does, and he knows it.",
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
    first = "Nixx Sprocketspring teaches goblin engineering and sells it like a revival preacher. He'll explain the math of it to anybody: goblin plus engineering equals know-how, and anybody who disagrees can't add.",
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
    first = "Jhordy Lapforge is a gnome in a yellow shirt and goggles who has built a matter transporter in the middle of a goblin town. All he needs is a skilled gnomish engineer to build a beacon for it, and he's very sure it's safe.",
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

---------------------------------------------------------------------------
-- Wrinkle Goodsteel (Gadgetzan, superior armor; Krinkle's brother)
---------------------------------------------------------------------------
P:NPC {
  key = "wrinkle", id = TODO_NPC("Wrinkle Goodsteel"), name = "Wrinkle Goodsteel", title = "Superior Armor Crafter",
  bible = "bibles/gadgetzan_more.md", role = "vendor", tier = "service",
  communities = { "gadgetzan" }, temper = { "smooth", "proud" }, values = { "greedy", "craft" },
  notices = { "class", "kit", "purse" },
  impression = {
    first = "Wrinkle Goodsteel sells the best armor in Gadgetzan and says so before anyone can ask. His brother sells weapons two doors down, and Wrinkle sees nothing awkward in the arrangement.",
    third = "{name} met Wrinkle Goodsteel, the armor seller of Gadgetzan and brother to Krinkle.",
  },
  greetings = {
    { id = "g_default", text = "Step in, pal, step in! That's premium plate you're looking at, and I've got your size, because I've got everybody's size." },
    { id = "g_2", when = { metBefore = true }, text = "Back so soon? Either the armor worked or you're here to complain, and I've got a form for complaints, buddy, with a small filing fee." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's somebody who gets hit for a living! Friend, you and me are going to do a lot of business, and I mean that warmly." },
    { id = "n_2", cat = "purse", when = { money = { max = 2000 } },
      text = "I can hear your purse from here, pal, and it's not saying much. Have a look anyway, because looking's how wanting gets started." },
    { id = "n_3", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe, huh? I don't stock silk, chum, but I'll sell ya a helmet for the day your spells run dry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Wrinkle Goodsteel, pal, superior armor at superior prices, and I mean that both ways. Out here the sun cooks ya, the basilisks chew ya and the Wastewanderers stab ya, and I've got a plate for every one of 'em." },
        { id = "hello_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "A plate wearer! Friend, that breastplate's got more dents than a goblin's alibi, so let's talk about something newer before the next troll finishes the job." },
      },
      again = {
        { id = "hello_again1", text = "Something else, pal? Talk's free, right up until it ain't." },
        { id = "hello_again2", text = "Go on, buddy, I'm listening, and I'm also counting stock." },
        { id = "hello_again3", text = "Ask, ask, but lean on the counter and you've bought it." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "You and Krinkle sell both sides of every fight.", next = "brothers" },
        { text = "What does the desert do to armor?", next = "desert" },
        { text = "Good armor is wasted on anyone who can't pay.", next = "pay" },
        { text = "What would you wear into Zul'Farrak?", next = "zf", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } } },
        { text = "Do you buy from outside smiths?", next = "smiths", when = { profession = "Blacksmithing" } },
        { text = "Good trading, Wrinkle.", next = "END" },
      },
    },
    brothers = {
      lines = {
        { id = "brothers_default", text = "We do, and ain't it beautiful? Krinkle sells the fella a mace, I sell the other fella a helmet, and whoever walks away comes back to a Goodsteel for repairs. Our mother would've been proud, if she hadn't been our first competitor." },
      },
      choices = {
        { text = "Your mother was a rival?", next = "brothers_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_mother = {
      lines = {
        { id = "brothers_mother_default", text = "She ran a smithy in Ratchet, pal, and she undercut us for six straight years, on principle. Said it'd teach us the trade, and it did, and we still send her a cut out of plain fear." },
      },
      choices = {
        { text = "Who's the better smith, you or Krinkle?", next = "brothers_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_better = {
      lines = {
        { id = "brothers_better_default", text = "I am, and he'll tell ya he is, and neither of us will put it in writing, on account of the Repairers' Union reads everything. Let's say he makes holes and I prevent 'em, and prevention's the classier line." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    desert = {
      lines = {
        { id = "desert_default", text = "Sand in every joint, friend, and heat that'll bake ya inside your own breastplate. I line mine with wool from the Arathi sheep, which sounds crazy until ya learn that it keeps heat out as good as it keeps it in." },
      },
      choices = {
        { text = "Does the lining cost extra?", next = "desert_extra" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desert_extra = {
      lines = {
        { id = "desert_extra_default", text = "Everything costs extra, pal, that's what extra means. But I'll tell ya for free that the folks who skip the lining come back in a week, looking like boiled lobsters and asking real politely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      big = true,
      lines = {
        { id = "pay_default", text = "Now that's cold, buddy, and I say that as a goblin. I've had kids walk in here with nothing, headed for the troll city, and I've watched 'em walk out in leather scraps because rules are rules." },
      },
      choices = {
        { text = "Rules are rules. Charity ruins a business.", next = "BACK", reply = "That's the Cartel line, and I've got it framed on the wall. It don't help me sleep, exactly, but it's framed.", fx = { align = { light = -1 } } },
        { text = "Some things matter more than margin. Help them.", next = "BACK", reply = "Don't spread it around, pal, but there's a crate of seconds out back that I can't seem to keep an accurate count of.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zf = {
      lines = {
        { id = "zf_default", text = "Mail at the least, plate if ya can carry it, and something over the neck, because the Sandfury like to go high. And buy a spare shield, friend, because the big fella at the bottom of the stairs breaks 'em." },
      },
      choices = {
        { text = "A spare shield. Noted.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_default", text = "If it's good and it's cheap, sure, and I'll stamp my own name on it and mark it up, which is called retail. Bring me thorium work and we'll talk real numbers, pal." },
      },
      choices = {
        { text = "I'll bring you something worth stamping.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Born in Ratchet with a hammer in one hand and a price list in the other, pal. Came to Gadgetzan because that's where folks go to get hit." } },
    advice = { { id = "tp_advice", text = "Buy the helmet first. Everything else ya own is worth nothing if ya can't remember where ya left it." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Best town on the continent for my trade, buddy. Everyone who comes through is on their way to somewhere dangerous, and they all come back needing repairs or they don't come back." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "That troll city's the finest thing that ever happened to my sales figures. I'd send 'em a thank-you card if they wouldn't eat the courier." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel takes its cut and keeps the Bruisers on the wall. It's a fair price for nobody robbing me, since the Cartel's the one doing it instead." } },
    _none = { { id = "tp_none", text = "That's not armor, pal, so it's not my problem. Now, about that breastplate." } },
  },
}

---------------------------------------------------------------------------
-- Qizzik (Gadgetzan, banker)
---------------------------------------------------------------------------
P:NPC {
  key = "qizzik", id = TODO_NPC("Qizzik"), name = "Qizzik", title = "Banker",
  bible = "bibles/gadgetzan_more.md", role = "banker", tier = "service",
  communities = { "gadgetzan" }, temper = { "precise", "wary" }, values = { "careful", "greedy" },
  notices = { "purse", "class" },
  impression = {
    first = "Qizzik keeps one of the windows at the Gadgetzan bank and counts everything twice, the customers included. He treats each deposit as a solemn occasion and each withdrawal as a small betrayal.",
    third = "{name} met Qizzik, a banker at the Bank of Gadgetzan.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Bank of Gadgetzan, valued customer. Kindly keep your hands where the Bruisers can see 'em." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, a returning account holder! That's my favorite kind, pal, on account of the paperwork's already done." },
  },
  notice = {
    { id = "n_1", cat = "purse", when = { money = { min = 5000000 } },
      text = "Now that's a purse with some authority to it. Have you considered how much safer all that'd be behind my counter, friend?" },
    { id = "n_2", cat = "purse", when = { money = { max = 1000 } },
      text = "A little light this week, pal? Don't sweat it, we hold small sums with the same dignity as large ones, only with less enthusiasm." },
    { id = "n_3", cat = "class", when = { class = "ROGUE" },
      text = "I know that walk, buddy. The vault door's a foot of thorium and the Bruisers get a bonus per head, so let's keep this a professional visit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Qizzik, pal, of the Bank of Gadgetzan, licensed and bonded by the Steamwheedle Cartel. Your goods go in, your goods stay in, and nobody touches 'em but you and a small handling fee." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Wastewander Justice") }, text = "You're the one who's been thinning out the Wastewanderers! Friend, those bandits were murder on our insurance rates, so consider yourself a preferred customer." },
      },
      again = {
        { id = "hello_again1", text = "Anything further, valued customer? The window's open." },
        { id = "hello_again2", text = "Go on, pal. Questions are a free service, for the present." },
        { id = "hello_again3", text = "Yes? I'm listening, and I'm counting, and I never lose my place." },
      },
      choices = {
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "Is my gold really safe in the middle of a desert?", next = "safe" },
        { text = "There are two bankers at this counter.", next = "two" },
        { text = "A bank is just a polite way to hoard.", next = "hoard" },
        { text = "Has anyone ever robbed this place?", next = "robbed", when = { class = "ROGUE" } },
        { text = "What do preferred customers get?", next = "preferred", when = { reputation = { faction = "Gadgetzan", min = "honored" } } },
        { text = "Keep it safe, Qizzik.", next = "END" },
      },
    },
    safe = {
      lines = {
        { id = "safe_default", text = "Safer than anywhere, pal. Your vault here is the same vault you've got in Booty Bay and Ratchet and Everlook, on account of an arrangement that I'm not at liberty to explain and don't entirely understand." },
      },
      choices = {
        { text = "You don't understand your own vault?", next = "safe_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_how = {
      lines = {
        { id = "safe_how_default", text = "I understand that it works, friend, and that a gnome got paid a fortune to make it work, and that asking how voids the warranty. That's enough understanding for any banker." },
      },
      choices = {
        { text = "And if it stops working?", next = "safe_stops" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_stops = {
      lines = {
        { id = "safe_stops_default", text = "Then you fill out a claim form, pal, in triplicate, and the Cartel's adjusters look into it. In forty years nobody's had to, which is lucky, because I've never been able to find the form." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    two = {
      lines = {
        { id = "two_default", text = "That's Gimblethorn, and he's a fine banker, if ya like 'em slow. We keep two windows so the line moves, and so there's always one of us watching the other, which is the oldest security system in banking." },
      },
      choices = {
        { text = "Do you trust him?", next = "two_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    two_trust = {
      lines = {
        { id = "two_trust_default", text = "With my life, sure. With the ledger, I check his sums every night, and he checks mine, and neither of us takes it personal. Trust is what ya have after the audit, pal, and never before it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hoard = {
      big = true,
      lines = {
        { id = "hoard_default", text = "Hoard's an ugly word, friend. The Cartel takes what's sitting idle and lends it out to build ports and roads and racing sleds, and everybody gets richer, starting with the Cartel." },
      },
      choices = {
        { text = "Gold should work. Idle coin helps nobody.", next = "BACK", reply = "Now you're talking like a shareholder! There's hope for you yet, pal.", fx = { align = { order = -1 } } },
        { text = "Gold should be kept safe, not gambled with.", next = "BACK", reply = "And yours is, valued customer, every coin, right where you left it. It's other folks' gold that we gamble with.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robbed = {
      lines = {
        { id = "robbed_default", text = "Once, pal, before my time. Fella tunneled up through the floor, real professional, and came out inside the Bruisers' barracks by mistake. They still talk about it at the Cartel picnic." },
      },
      choices = {
        { text = "I'll use the front door.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    preferred = {
      lines = {
        { id = "preferred_default", text = "A nod from the Bruisers instead of a pat-down, pal, and I remember your name without checking the book. Around here that's about as warm as it gets." },
      },
      choices = {
        { text = "I'll take the nod.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Twenty years behind a counter, pal, in Booty Bay and then here. I came for the dry air, because damp is murder on ledgers." } },
    advice = { { id = "tp_advice", text = "Don't carry it all on ya. The desert's full of folks who'd like to help ya carry it." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "It's a town with one water tower, one bank and a hundred ways to get killed outside the wall. That makes it a real good town for a bank." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel signs my wages and audits my drawers. I've got nothing but good things to say, and I say 'em loudly, in case they're listening." } },
    booty_bay = { { id = "tp_booty_bay", text = "That's the head office, more or less, pal. The Baron's ledgers are bigger than this whole building, I hear." } },
    _none = { { id = "tp_none", text = "That's not a banking matter, valued customer. Would ya care to make a deposit instead?" } },
  },
}

---------------------------------------------------------------------------
-- Gikkix (Steamwheedle Port, fisherman; fish and drink)
---------------------------------------------------------------------------
P:NPC {
  key = "gikkix", id = TODO_NPC("Gikkix"), name = "Gikkix", title = "Fisherman",
  bible = "bibles/gadgetzan_more.md", role = "vendor", tier = "service",
  communities = { "steamwheedle_port" }, temper = { "laid-back", "sly" }, values = { "patient", "practical" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Gikkix sells fish and drink on the Steamwheedle Port dock and is the least hurried goblin on the coast. He claims that fishing is the only business where waiting counts as work.",
    third = "{name} met Gikkix, the fisherman of Steamwheedle Port.",
  },
  greetings = {
    { id = "g_default", text = "Easy there, pal, you'll scare the fish, and they're the only ones around here who owe me anything." },
    { id = "g_2", when = { metBefore = true }, text = "Hey, it's you again. Pull up a crate, friend, the tide's doing all the work today." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Fishing" },
      text = "Is that a rod on your back? Then you already know the secret, buddy, which is that the fish don't care how busy ya are." },
    { id = "n_2", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look like the desert wrung ya out, pal. Eat a fish and drink something wet, and we'll put it on a real small tab." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Name's Gikkix, and I catch 'em, cook 'em and sell 'em, right here off the dock. Everybody else in this port is running around making deals, pal, and I'm sitting down making a living, so you tell me who's smarter." },
        { id = "hello_2", when = { profession = "Fishing" }, text = "A fellow angler! Then sit down, friend, because I've got opinions about the stonescale run, and nobody else in Steamwheedle will listen to 'em." },
      },
      again = {
        { id = "hello_again1", text = "Something else, pal? I got nowhere to be." },
        { id = "hello_again2", text = "Go on, friend. The line's quiet anyhow." },
        { id = "hello_again3", text = "Ask away, and keep your voice down a little." },
      },
      choices = {
        { text = "What's fresh today?", next = "BUSINESS" },
        { text = "What bites off this coast?", next = "bites" },
        { text = "The Southsea pirates must be bad for business.", next = "pirates" },
        { text = "Sitting on a dock isn't what I'd call work.", next = "work" },
        { text = "Where do the stonescale eels run?", next = "eels", when = { profession = { "Fishing", "Cooking" } } },
        { text = "Tight lines, Gikkix.", next = "END" },
      },
    },
    bites = {
      lines = {
        { id = "bites_default", text = "Spotted yellowtail by the pilings and big mackerel a little further out, pal. Off Lost Rigger Cove you'll hook things with more teeth than sense, and I mean the fish, though it goes for the pirates too." },
      },
      choices = {
        { text = "What do you do with the toothy ones?", next = "bites_teeth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bites_teeth = {
      lines = {
        { id = "bites_teeth_default", text = "I sell 'em to Dirge Quikcleave in Gadgetzan, friend. He'll cook anything, and his customers have just crossed a desert, so they'll eat anything. It's the perfect arrangement." },
      },
      choices = {
        { text = "That's a long way to haul fish in this heat.", next = "bites_haul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bites_haul = {
      lines = {
        { id = "bites_haul_default", text = "Packed in wet kelp, on the evening caravan, and they get there before sunup. If the caravan runs late, pal, then Dirge calls it smoked and charges double." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = {
        { id = "pirates_default", text = "You'd think so, wouldn't ya? But a pirate eats like anybody else, and those Southsea boys can't fish to save their lives. I don't ask who's buying, friend, and Security Chief Bilgewhizzle don't ask me." },
      },
      choices = {
        { text = "You sell fish to the pirates?", next = "pirates_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates_sell = {
      lines = {
        { id = "pirates_sell_default", text = "I sell to a fella in a hat who rows up at night and pays in coin I don't look at too closely. The Chief'd have my license for it, so some would say I should turn the fella in." },
      },
      choices = {
        { text = "Turn him in. Feeding pirates feeds piracy.", next = "BACK", reply = "Yeah, yeah, I figured you'd say that. Maybe next time he rows up, the Chief just happens to be taking a walk.", fx = { align = { order = 1 } } },
        { text = "A customer's a customer. Keep quiet and sell.", next = "BACK", reply = "That's the Steamwheedle spirit, pal. You'd do real well in this port.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      big = true,
      lines = {
        { id = "work_default", text = "That's the beauty of it, friend. Every other goblin sweats for his gold, and me, I let a worm do the selling. If that ain't work, then I don't want to hear what is." },
      },
      choices = {
        { text = "There's wisdom in knowing when to sit still.", next = "BACK", reply = "See, now you get it. Sit down, pal, and I'll lend ya a line." },
        { text = "Time is money, and you're wasting both.", next = "BACK", reply = "I've heard the saying, buddy. The fella who taught it to me blew up at thirty, and I've got a boat." },
        { text = "Something else.", next = "BACK" },
      },
    },
    eels = {
      lines = {
        { id = "eels_default", text = "After dark, off the rocks south of the port, when the water's cooling down. Don't bother in daylight, pal, because they sit on the bottom and laugh at ya." },
      },
      choices = {
        { text = "After dark, south rocks. Thanks.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Used to run cargo out of Booty Bay, pal, till I worked out that the fish swimming under the boat were worth more than the freight on top." } },
    advice = { { id = "tp_advice", text = "Fish at dawn or dusk. At noon the only thing biting out here is the sun." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel don't tax what it can't count, friend, and nobody's ever counted fish. That's my whole business plan." } },
    rumors = { { id = "tp_rumors", text = "Folks say something big's been bumping the pilings at night. I say it's the tide, pal, and I've stopped night fishing off the end of the dock anyhow." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal. If it's got fins, try me again." } },
  },
}

---------------------------------------------------------------------------
-- Yorba Screwspigot (Steamwheedle Port: Yuka Screwspigot, her sister in the Burning Steppes, and their brother Ribbly)
---------------------------------------------------------------------------
P:NPC {
  key = "yorba", id = TODO_NPC("Yorba Screwspigot"), name = "Yorba Screwspigot",
  bible = "bibles/gadgetzan_more.md", role = "questgiver", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "exasperated", "sharp" }, values = { "family", "greedy" },
  notices = { "class", "race" },
  impression = {
    first = "Yorba Screwspigot waits at Steamwheedle Port for news of a brother who owes money to everyone she knows. She talks about family as other goblins talk about bad investments.",
    third = "{name} met Yorba Screwspigot at Steamwheedle Port, who seeks word of her brother Ribbly.",
  },
  greetings = {
    { id = "g_default", text = "You're not here about Ribbly, are ya? If he owes you money too, pal, get in line, and the line starts in Booty Bay." },
    { id = "g_2", when = { metBefore = true }, text = "You again! Any news? No? Then you're about as much use as my brother, though you smell better." },
    { id = "g_3", when = { questActive = TODO_QUEST("Yuka Screwspigot") }, text = "Why are ya still standing in Tanaris? My sister's at Flame Crest in the Burning Steppes, pal, and she ain't getting any more patient." },
    { id = "g_4", when = { questDone = TODO_QUEST("Ribbly Screwspigot") }, text = "So it's done, then. Well, the family's books are balanced, and I guess that's what he'd have wanted, if he'd ever wanted anything sensible." },
  },
  notice = {
    { id = "n_1", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You know the Blackrock tunnels, don't ya? Then you're exactly who I need, friend, so don't wander off." },
    { id = "n_2", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "You look like somebody who finds folks that don't want finding. I've got work for ya, and it pays better than sentiment does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "Yorba Screwspigot, and before ya ask, yes, those Screwspigots. My brother Ribbly's run off with a lot of other people's money, pal, and the whole family's been chasing him from one end of the world to the other." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("Yuka Screwspigot") }, text = "Ribbly's gone, and half the creditors in Kalimdor are at my door. My sister Yuka went east to hunt for him in the Burning Steppes, and she'll need a pair of hands that ain't shaking. Go and find her at Flame Crest, friend." },
        { id = "hello_3", when = { questActive = TODO_QUEST("Yuka Screwspigot") }, text = "Yuka's at Flame Crest, up in the Burning Steppes. Tell her that Yorba sent ya, and that Yorba's sick of answering the door." },
        { id = "hello_4", when = { questDone = TODO_QUEST("Yuka Screwspigot") }, text = "So ya found Yuka, and she's found where Ribbly's hiding. Whatever she asks of ya next, pal, remember that it was his own choice to stiff the family." },
      },
      again = {
        { id = "hello_again1", text = "What else, pal? I've got creditors to dodge." },
        { id = "hello_again2", text = "Ask quick. Every knock on that door costs me a year off my life." },
        { id = "hello_again3", text = "Go on, friend, I'm listening." },
      },
      choices = {
        { text = "What did Ribbly do, exactly?", next = "ribbly" },
        { text = "Your family sounds complicated.", next = "family" },
        { text = "Why wait here at Steamwheedle Port?", next = "port" },
        { text = "What would a goblin want in Blackrock?", next = "blackrock", when = { race = "Dwarf" } },
        { text = "Some debts get collected the hard way.", next = "hardway", when = { class = { "ROGUE", "WARLOCK" } } },
        { text = "I'll look for your sister.", next = "BUSINESS" },
        { text = "Good luck with the creditors.", next = "END" },
      },
    },
    ribbly = {
      lines = {
        { id = "ribbly_default", text = "He borrowed, pal. From me, from Yuka, from our uncle, from a fella in Ratchet with a very big wrench. He said it was for a sure thing, and then the sure thing and Ribbly both left town on the same night." },
      },
      choices = {
        { text = "What was the sure thing?", next = "ribbly_thing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribbly_thing = {
      lines = {
        { id = "ribbly_thing_default", text = "He never said, and that's how ya know it was a bad one. Last anybody heard, he was drinking the money in some Dark Iron tavern under Blackrock Mountain, where he figures none of us'll follow." },
      },
      choices = {
        { text = "Will you follow him there?", next = "ribbly_follow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribbly_follow = {
      lines = {
        { id = "ribbly_follow_default", text = "Me? I get nosebleeds on a stepladder, friend. That's what Yuka's for, and that's what folks like you are for, and I say that with real respect." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "family_default", text = "We're real close, pal, on account of we all owe each other money. A Screwspigot never forgets a birthday or a balance, and Ribbly forgot both." },
      },
      choices = {
        { text = "And if he paid it all back?", next = "family_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_back = {
      narr = "She stops fidgeting with her ledger for a moment.",
      lines = {
        { id = "family_back_default", text = "Then I'd hug him and I'd count it twice. But he won't, pal, and the creditors want a Screwspigot to answer for it. Yuka says it had better be the one who spent it." },
      },
      choices = {
        { text = "He's still your brother. Find a way to spare him.", next = "BACK", reply = "Don't think I ain't been up nights over it. If ya come up with a way that also pays the fella with the wrench, I'm all ears.", fx = { align = { light = 1 } } },
        { text = "He made his choice. Debts have to be answered.", next = "BACK", reply = "That's what Yuka says, word for word. I guess that's why she went east and I stayed here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    port = {
      lines = {
        { id = "port_default", text = "Because every ship from Booty Bay ties up at this dock, and if Ribbly ever runs for the sea, he runs through me. Also the Security Chief don't allow debt collectors on the pier, which I appreciate more every day." },
      },
      choices = {
        { text = "So you're hiding as much as waiting.", next = "port_hiding" },
        { text = "Something else.", next = "BACK" },
      },
    },
    port_hiding = {
      lines = {
        { id = "port_hiding_default", text = "I'm doing both at once, pal, which is what we call efficiency. Jabbey sells me my groceries on credit, bless him, and so I don't even have to go into Gadgetzan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    blackrock = {
      lines = {
        { id = "blackrock_default", text = "Somewhere to drink where the family can't reach, that's what. I hear the Dark Irons keep a tavern down there that'll serve anybody with coin, and Ribbly's got plenty of coin, all of it ours." },
      },
      choices = {
        { text = "I know those halls. He picked a bad place to hide.", next = "BACK", reply = "Good! Tell that to Yuka, friend, and she'll likely pay ya extra just for saying it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardway = {
      lines = {
        { id = "hardway_default", text = "Yeah, and I ain't a child, pal, I know what Yuka means to do when she finds him. I just don't say it out loud at the dock, where the gulls can hear." },
      },
      choices = {
        { text = "Then I won't say it either.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I know my family, pal, and I know who owes what to who, down to the copper. Ask, but none of it's cheerful." } },
    background = { { id = "tp_background", text = "I kept the books for the family business in Ratchet. Then Ribbly kept 'em for one season, and now there ain't a family business." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel don't mind a debtor so long as she's paying something to somebody. I pay Jabbey, and that keeps me legal." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "All I know is that there's a bar in it, and my brother's on a stool in that bar. That's already more than I ever wanted to know about the place." } },
    _none = { { id = "tp_none", text = "No idea, pal. If it ain't about Ribbly, I ain't had the time to care." } },
  },
}
