-- Searing Gorge: folk a roster scan found with no conversation yet. Voice: bibles/gorge_roads.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC = P.TODO_NPC

-- Graw Cornerstone: Ironforge mail armor merchant at Thorium Point.
P:NPC {
  key = "sg_graw_cornerstone", id = TODO_NPC("Graw Cornerstone"), name = "Graw Cornerstone", title = "Mail Armor Merchant", gender = "male",
  bible = "bibles/gorge_roads.md", role = "vendor", tier = "service",
  communities = { "thorium_point" }, temper = { "dour", "steady" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Graw Cornerstone sells mail from a pack of rings and rivets at Thorium Point, and he keeps one eye on the Dark Irons around him the whole time he talks.",
    third = "{name} met Graw Cornerstone, an Ironforge dwarf who sells mail armor in the Searing Gorge.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my best customer, an' still breathin'! I've a coat o' links put by that I wouldnae sell to just any Dark Iron passin' through." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Aye, it's you. I'll sell ye mail, since coin's coin, but I'll be countin' the rings after ye've gone." },
    { id = "g_default", text = "Mail, {g:lad|lass}, good Ironforge links, an' the only honest armor ye'll find on this side o' the Gorge. Mind the cinders on yer boots." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' yer mail's still in one piece. That's more than I can say for most folk who come through here." },
  },
  notice = {
    { id = "n_mail", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "A {class} wearin' mail, aye, that's the sensible choice. Leather burns in this heat an' plate cooks ye like a pie." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another o' the clans, an' a welcome sight among all these Dark Iron faces. Keep yer voice down when ye speak o' Thaurissan, though." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Graw Cornerstone, mail smith an' merchant, late o' Ironforge an' now, Light help me, a guest o' the Thorium Brotherhood. They pay good coin for news from home, an' I sell armor to whoever's brave enough to walk the Gorge." } },
      again = {
        { id = "h_again", text = "Aye, what else can I tell ye?" },
        { id = "h_again2", text = "Ask away, {g:lad|lass}, the rivets'll keep." },
      },
      choices = {
        { text = "I'd rather pay fair for good work, even out here.", next = "BACK", reply = "Aye, that's the Ironforge way, an' it's why my links hold when the Dark Irons' don't.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Out here, folk will pay whatever you ask. Charge them double.", next = "BACK", reply = "An' have the Brotherhood laugh me out o' Thorium Point? Ye've a mercenary streak, I'll grant ye that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "An Ironforge dwarf trading with Dark Irons?", next = "brotherhood" },
        { text = "What's the Gorge like for a traveller?", next = "gorge" },
        { text = "Your mail looks light for the heat.", next = "mail" },
        { text = "Why did you come south to the Gorge?", next = "ywhy" },
        { text = "What news do you sell the Brotherhood?", next = "ynews" },
        { text = "I'm a warrior. What would you have me wear?", next = "ywarrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Let me see your wares.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Strange, isn't it? These ones broke with the Emperor an' his fire lord, or so they swear, an' they want trade an' craftsmen more than they want old grudges. I watch my purse an' my back, an' so far both are still where I left them." } },
      choices = {
        { text = "A Dark Iron is a Dark Iron. Don't trust them.", next = "BACK", reply = "Ye'd not be the first to say it, an' I've thought it myself on a long night. Still, their coin spends.", fx = { align = { order = 1 } } },
        { text = "If they broke with Thaurissan, they deserve a chance.", next = "BACK", reply = "Aye, maybe so. My grandfather would spit, but my grandfather never had to make a living out here.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge = {
      lines = { { id = "g2_default", text = "Hot as a forge an' twice as smoky, wi' fire elementals in the slag an' Dark Iron slavers in the Cauldron. The Brotherhood's camp here at Thorium Point is the only place I'd sleep wi' my boots off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = { { id = "m_default", text = "Light, aye, an' riveted loose so the air can move through it, or ye'll faint before ye ever reach Blackrock. I learned that the hard way my first summer here." } },
      choices = { { text = "Something else, Graw.", next = "BACK" } },
    },
    ywhy = {
      lines = {
        { id = "ywy_default", text = "Debt, if I'm honest, an' pride. I owed a sum to a Mining Guild lender after a bad investment in a Loch Modan seam, an' the Brotherhood pays three times the Ironforge rate for good mail. Two more seasons, an' I'm square." },
        { id = "ywy_dwarf", when = { race = "Dwarf" }, text = "Debt an' pride, same as most of us, ye'll know how it is. A bad seam in Loch Modan an' a Guild lender wi' a long memory. The Brotherhood pays thrice the Ironforge rate. Two more seasons." },
      },
      choices = {
        { text = "Is it worth working with Dark Irons?", next = "yworth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworth = {
      narr = "He sets down the hammer and wipes the soot from his beard with the back of a glove.",
      lines = { { id = "ywo_default", text = "Some days I think so. Other days Lokhtos asks me what the guards on Ironforge's gates wear, an' how many, an' I start to wonder what I'm really sellin'. Should a smith care where his news goes, if the coin's honest?" } },
      choices = {
        { text = "Care. Don't sell out your own city.", next = "BACK", reply = "Aye. I've been tellin' Lokhtos less an' less. He's noticed.", fx = { align = { honor = 1 } } },
        { text = "Coin is coin. Pay the debt and go home.", next = "BACK", reply = "That's what my lender would say, an' he's a cold one.", fx = { align = { honor = -1 } } },
      },
    },
    ynews = {
      lines = { { id = "yne_default", text = "Prices, mostly, an' what the Ironforge smiths are makin', an' who's buyin' thorium. The Brotherhood wants to trade wi' my folk someday, open-like, an' they need to know what we value. That's how they tell it, anyway." } },
      choices = { { text = "Keep an eye on them. Something else.", next = "BACK" } },
    },
    ywarrior = {
      lines = { { id = "ywa_default", text = "Plate, out o' the Gorge, an' mail in it, if ye've any sense. A plate-wearer who walks the slag at noon comes back cooked, an' I've seen it. Light mail, loose rivets, an' a wet cloth on yer neck." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    thorium = { { id = "yt_thor", text = "Thorium's the metal o' the Gorge, an' the Brotherhood works it better than any smith in Ironforge. Don't tell them I said so." } },
    lokhtos = { { id = "yt_lokhtos", text = "Lokhtos Darkbargainer runs the Brotherhood's trade. He smiles like a lender an' bargains like one too." } },
    ironforge = { { id = "yt_if", text = "Ironforge has the finest forges in the world, an' the worst lenders. I miss the first an' flee the second." } },
    background = { { id = "tp_bg", text = "I'm an Ironforge smith who came south for the trade, an' I've stayed longer than I meant to." } },
    _none = { { id = "tp_none", text = "Cannae say, {g:lad|lass}. Ask one o' the Brotherhood, if ye can get a straight word out o' them." } },
  },
}

-- Thorium Brotherhood Lookout: a Dark Iron sentry at Thorium Point.
P:NPC {
  key = "sg_thorium_lookout", id = TODO_NPC("Thorium Brotherhood Lookout"), name = "Thorium Brotherhood Lookout", gender = "male",
  bible = "bibles/gorge_roads.md", role = "guard", tier = "service",
  communities = { "thorium_point" }, temper = { "wary", "terse" }, values = { "duty", "loyal" },
  notices = { "race" },
  impression = {
    first = "A Dark Iron lookout of the Thorium Brotherhood, scanning the Gorge from the scaffolds of Thorium Point. He didn't lower his crossbow much when I spoke.",
    third = "{name} spoke with a lookout of the Thorium Brotherhood at Thorium Point.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "I had you in my sights from the bottom of the switchback and lowered the bow the moment I knew your walk. Go on up, friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've watched you from these scaffolds before, and I didn't like what I saw. Keep your hands where I can see them." },
    { id = "g_default", text = "Stop there and keep your hands open. Thorium Point welcomes traders and fighters, but I've seen too many of the Emperor's spies wearing honest faces." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Go on up, then, and don't make me regret remembering you." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard, by the look of you. Yes, I'm Dark Iron, and no, I've no wish to talk about the War of the Three Hammers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep watch for the Brotherhood, and from up here I can see the whole Gorge, from the Cauldron to the Blackrock road. Anything that comes this way, I see it first, and I'd prefer it was you rather than a war party." } },
      again = { { id = "h_again", text = "Anything else? Be quick, I'm meant to be watching." } },
      choices = {
        { text = "The Brotherhood's rules keep Thorium Point standing. I'll follow them.", next = "BACK", reply = "Good. Every Dark Iron here broke one law to leave the Emperor, so we hold the rest of ours tight.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Rules are for Thaurissan's people. Out here, I make my own.", next = "BACK", reply = "That's what the Emperor's spies say too, right before I put a bolt through them.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What are you watching for?", next = "watch" },
        { text = "Why did the Brotherhood leave Thaurissan?", next = "why" },
        { text = "You don't trust outsiders much.", next = "trust" },
        { text = "Have you ever spotted a spy?", next = "xspy" },
        { text = "What's the view like at night?", next = "xnight" },
        { text = "Do you have family under the mountain?", next = "xfamily" },
        { text = "I'm a hunter. My eyes are sharp too.", next = "BACK", when = { class = "HUNTER" }, reply = "Are they? Then tell me what's moving by the slag pit, north of the third tower. No? Then mine are sharper." },
        { text = "What made you leave Thaurissan yourself?", next = "yleave" },
        { text = "I'll go on up.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Slavers from the Cauldron, fire elementals that wander up out of the slag, and the Emperor's own agents, who'd dearly love to see this camp burned. The Brotherhood has a price on its head down in Blackrock Depths." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "Because a smith wants to make things, not bow to a lord of fire who'd burn the whole world for his own glory. Ragnaros owns the Emperor body and soul, and we decided we'd rather own ourselves." } },
      choices = {
        { text = "Breaking from your own people took real courage.", next = "BACK", reply = "Courage, or stubbornness. Among Dark Irons there's not much difference.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A traitor once is a traitor always.", next = "BACK", reply = "Say that a little louder and see how far you get up these stairs.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Would you, in my boots? Half the world wants my kind dead for what the Emperor did, and the other half works for him. You earn trust here by work, the same as anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xspy = {
      lines = {
        { id = "xxspy_0", text = "Three this season. One dressed as a merchant, one as a miner and one as a Bronzebeard dwarf, which was the boldest of the lot. They don't come back up the stairs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnight = {
      lines = {
        { id = "xxnight_0", text = "The Cauldron glows red, the forges smoke and the fire elementals drift across the slag like lanterns. It would be beautiful if it weren't all trying to kill us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfamily = {
      lines = {
        { id = "xxfamily_0", text = "A brother and an old mother, in Blackrock Depths, still loyal to the Emperor. I chose the Brotherhood and they chose Thaurissan. Should I try to bring them over, or let them be?" },
      },
      choices = {
        { text = "Try to bring them over. Kin is kin.", next = "BACK", reply = "Kin who'd sell me to the Emperor. Still, I'd like to try.", fx = { align = { order = -1 } } },
        { text = "Let them be. You chose your path.", next = "BACK", reply = "Aye. That's the hard truth of it.", fx = { align = { order = 1 } } },
      },
    },
    yleave = {
      narr = "He keeps his eyes on the Gorge as he answers, never once looking at you.",
      lines = {
        { id = "yle_default", text = "I was a forge-hand in Shadowforge, and one day the priests came for my apprentice to feed the fire lord's altar. He was fourteen. I went up the stairs that night with a hammer and a lantern and never looked back. I still dream of the stairs." },
        { id = "yle_dwarf", when = { race = "Dwarf" }, text = "The priests came for my apprentice, a lad of fourteen, for the fire lord's altar. I went up the stairs that night with a hammer. You Bronzebeards think we all chose this. Some of us chose the stairs." },
      },
      choices = { { text = "You did right. Something else.", next = "BACK" } },
    },
  },
  topics = {
    lokhtos = { { id = "yt_lokh", text = "Lokhtos keeps the Brotherhood's coin and its secrets. Pay him well and he remembers you kindly." } },
    cauldron = { { id = "yt_caul", text = "The Cauldron is where they keep the slaves, and where the slag runs hottest. Some of our kin still dig there." } },
    ragnaros = { { id = "yt_rag", text = "The Firelord sits under the mountain, and Thaurissan bows to him. We left, and we don't say his name twice." } },
    thorium_brotherhood = { { id = "tp_xthorium_brotherhood", text = "Smiths who chose the forge over the fire lord." } },
    thaurissan = { { id = "tp_xthaurissan", text = "The Emperor. Don't say that name too loud here." } },
    background = { { id = "tp_bg", text = "I'm Dark Iron born, Thorium Brotherhood by choice, and a lookout because I've the sharpest eyes in camp." } },
    _none = { { id = "tp_none", text = "Not my business. Ask Lokhtos, if you've got the gold to make it his." } },
  },
}

---------------------------------------------------------------------------
-- Enslaved Archaeologist: dwarven diggers held by the Dark Iron in the Slag Pit.
---------------------------------------------------------------------------
P:NPC {
  key = "sg_enslaved_archaeologist", id = 8402, name = "Enslaved Archaeologist", gender = "male",
  role = "captive", tier = "service",
  communities = { "ironforge" }, temper = { "weary" }, values = { "knowledge", "survival" },
  notices = { "race" },
  impression = {
    first = "A gaunt dwarf in a torn Explorers' League coat chips at the rock deep in the Slag Pit, his ankles chained and his hands black with soot.",
    third = "{name} spoke with an enslaved archaeologist in the Slag Pit.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back down into the pit for me! The League will hear of it, I swear, if I ever see daylight again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again, and still nae key in your hand. Leave me be before the overseers notice you standing there." },
    { id = "g_default", text = "Quiet, quiet! If the overseers see me talkin', they'll take it out of my hide." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I came to the Gorge with the Explorers' League, and the Dark Irons caught us before we'd dug a single trench. Now we dig for them instead, and they're not kind employers." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "One of our own, free and armed! By my beard, I thought I'd never see it again." },
      },
      again = { { id = "h_again", text = "Quickly, what else?" } },
      choices = {
        { text = "What are they making you dig for?", next = "dig" },
        { text = "How did you get captured?", next = "captured" },
        { text = "What happened to your friends?", next = "xfriends" },
        { text = "What relics have they found?", next = "xrelics" },
        { text = "How do you keep going?", next = "xgoing" },
        { text = "I'm a dwarf. I'll free you, cousin.", next = "BACK", when = { race = "Dwarf" }, reply = "Cousin! Bless ye. If ye can, find the overseer's keys, but don't get yerself chained beside me. One captive's enough for the family." },
        { text = "Who's waiting for you in Ironforge?", next = "yhome" },
        { text = "I'll find a way to help.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Ore and old relics, both, though they care more for the ore. Thaurissan's folk need iron for their forges, and the Gorge is full of it if you don't mind dyin' for it." } },
      choices = {
        { text = "The Dark Irons will pay for this.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your head down and live. Revenge can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "They're dwarves too. Why do this?", next = "why" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because they've hated us since the War of the Three Hammers, and Ragnaros has their ear now. Whatever's down in the mountain has turned them crueller than they ever were." } },
      choices = { { text = "Then someone must stop them.", next = "BACK" } },
    },
    captured = {
      lines = { { id = "c_default", text = "We were mapping the old tunnels west of the pit when they came out of the dark with chains ready. Two of my friends fought back, and they're not with us any more." } },
      choices = { { text = "I'm sorry.", next = "BACK" } },
    },
    xfriends = {
      lines = {
        { id = "xxfriends_0", text = "Two died fighting the day we were taken. The rest dig beside me, or did. Brannoc collapsed last week from the heat, and they dragged him away. I don't know where." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrelics = {
      lines = {
        { id = "xxrelics_0", text = "Old Dark Iron carvings, from before the War of the Three Hammers, showing their kings and ours side by side. The overseers smash anything that shows a Bronzebeard face." },
      },
      choices = {
        { text = "Should the relics be saved?", next = "xsave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsave = {
      lines = {
        { id = "xxsave_0", text = "I'd risk my neck to smuggle out one tablet, so the League knows what's here. My friends say it's not worth dying for a stone. What would you tell them?" },
      },
      choices = {
        { text = "Save it. History matters more than comfort.", next = "BACK", reply = "Aye. That's why I came. I'll try, quietly.", fx = { align = { honor = -1 } } },
        { text = "Stay alive. A stone is not worth your life.", next = "BACK", reply = "You're right, I suppose. But it's a very good stone.", fx = { align = { honor = 1 } } },
      },
    },
    xgoing = {
      lines = {
        { id = "xxgoing_0", text = "I recite the names of every dig I've ever worked, from Uldaman to the Loch. When I run out of names, I start again, and the overseer thinks I'm praying." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhome = {
      narr = "He glances at the overseer's back and keeps his pick moving while he talks.",
      lines = {
        { id = "yho_default", text = "A wife in the Mystic Ward who told me the Gorge was a fool's errand, an' a wee lad who wanted a Dark Iron rune for his collection. I'd give every rune in this pit to tell her she was right, an' I'd still bring the lad his rune." },
        { id = "yho_gnome", when = { race = "Gnome" }, text = "A wife in Ironforge who called the Gorge a fool's errand, an' a lad who wanted a rune. Your folk took rooms near ours in Tinker Town after the fall. If ye pass, tell her I'm alive." },
      },
      choices = { { text = "I'll tell her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    brannoc = { { id = "yt_brannoc", text = "Brannoc was the best digger in our party. They dragged him away when the heat took him. I'll find out where." } },
    thaurissan = { { id = "yt_thaur", text = "Thaurissan's folk need iron for the Firelord's forges. We dig it, an' they forge it, an' the mountain grows hungrier." } },
    uldaman = { { id = "yt_ulda", text = "I dug at Uldaman before this. The titans' halls there are cool an' quiet, an' I'd give my beard to be back." } },
    overseers = { { id = "yt_over", text = "The overseers carry whips an' keys both. The tall one, Grimly, sleeps at his post after noon." } },
    dark_irons = { { id = "tp_xdark_irons", text = "They're cruel taskmasters, but some of them look as tired as we are." } },
    explorers_league = { { id = "tp_xexplorers_league", text = "The best folk in Ironforge. They'll come for us, I'm sure of it." } },
    _none = { { id = "tp_none", text = "I cannae think of anythin' but getting out of here. Ask me again when I'm free." } },
  },
}

-- Raze, Nilith's Guardian: the infernal bound to Nilith Lokrav near Blackrock Mountain.
P:NPC {
  key = "sg_raze", id = 8441, name = "Raze", title = "Nilith's Guardian", gender = "male",
  role = "citizen", tier = "service",
  communities = {}, temper = { "menacing", "slow" }, values = { "obedience" },
  notices = { "class" },
  impression = {
    first = "A hulking infernal of black stone and green fire stands motionless beside Nilith's camp.",
    third = "{name} faced Raze, the infernal that guards Nilith Lokrav.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "The stone of me knows your face, little flesh, and the mistress has not told me to break it. Stand near the fire if you wish." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The fire in me burns hotter when you come near, little flesh. One word from the mistress, and I would be glad of it." },
    { id = "g_default", text = "You stand too close to the mistress's fire, little flesh, and the stone of me remembers every face that does." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" }, text = "You smell of the binding circle, as she does, so you know what I am and what holds me here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Raze, and I was flung from the Twisting Nether to break whatever I struck, until the mistress bound me to guard her spiders instead. Speak, if you must, but speak slowly, because I am in no hurry." } },
      narr = "Green fire crawls along the cracks in its shoulders, and the ground near its feet has fused to glass.",
      again = { { id = "h_again", text = "More words, little flesh? Very well, the mistress has not told me to stop you." } },
      choices = {
        { text = "Do you serve Nilith willingly?", next = "serve" },
        { text = "What do you guard against?", next = "guard" },
        { text = "What was the Twisting Nether like?", next = "xnether" },
        { text = "Does Nilith treat you well?", next = "xnilith" },
        { text = "Have you ever slipped your binding?", next = "xslip" },
        { text = "I'm a warlock. I could command you instead.", next = "BACK", when = { class = "WARLOCK" }, reply = "You could try, little binder. The mistress's circle is strong, and yours would have to be stronger. Most are not." },
        { text = "What did you break, for the Legion?", next = "ylegion" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    serve = {
      lines = { { id = "s_default", text = "Willing is a word for those with a choice, and the circle took mine from me. Still, she feeds me heat and gives me poachers to break, and that is more than the Legion ever gave." } },
      choices = {
        { text = "Would you break free, if you could?", next = "free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "I would burn this gorge to cinders and then I would burn the mountain, and the mistress knows it, and that is why she never forgets the leash. You are wise to ask, and wiser not to hope." } },
      choices = {
        { text = "Then the binding must hold. Good.", next = "BACK", reply = "It holds, little flesh, for now.", fx = { align = { order = 1 } } },
        { text = "No creature should be chained forever.", next = "BACK", reply = "Pity from flesh. How strange it sounds.", fx = { align = { order = -1 } } },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "The Dark Iron who wander from the mountain, the poachers who kill her spiders, and anyone she does not like, which is most of them. The Dark Iron have learned to walk around me, which pleases me less than breaking them would." } },
      choices = { { text = "I'll stay on her good side. Something else.", next = "BACK" } },
    },
    xnether = {
      lines = {
        { id = "xxnether_0", text = "A storm with no ground, full of hunger and screaming. I fell through it for an age before a circle caught me. Your world is small and slow, but at least it holds still." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnilith = {
      lines = {
        { id = "xxnilith_0", text = "She feeds me heat and gives me the poachers who touch her spiders. That is more kindness than the Legion ever showed, and less than I would take if free." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xslip = {
      lines = {
        { id = "xxslip_0", text = "Once, for a heartbeat, when the circle cracked in a quake. I took one step and the earth burned under it. She mended the circle before the second step. Should she have let me go?" },
      },
      choices = {
        { text = "No. Some prisons keep the world safe.", next = "BACK", reply = "Spoken like flesh that has never been chained.", fx = { align = { light = 1 } } },
        { text = "You've served long enough. Let her free you.", next = "BACK", reply = "She will not. But I will remember you said it.", fx = { align = { light = -1 } } },
      },
    },
    ylegion = {
      narr = "The fire in its cracks flares bright, then settles to a low smoulder.",
      lines = {
        { id = "yle_default", text = "Walls, little flesh. Towers. A city of the elves, long ago, whose name I never learned because I did not care to. I fell on it from the sky and it broke beneath me, and the Legion called that a good day's work." },
        { id = "yle_nelf", when = { race = "NightElf" }, text = "Walls and towers. A city of your kind, kaldorei, long ago. I fell on it from the sky and it broke. You look at me as they did, before. I remember the look. It does not trouble me." },
      },
      choices = { { text = "I'm glad you're bound. Something else.", next = "BACK" } },
    },
  },
  topics = {
    warlocks = { { id = "yt_warl", text = "Binders. Small, clever and careful. The careless ones I remember fondly, for they did not last." } },
    spiders = { { id = "yt_spiders", text = "The mistress's spiders spin in the heat. I guard them. They are small and busy, and they do not fear me." } },
    dark_iron = { { id = "yt_di", text = "The Dark Iron walk wide around me now. They have learned. Flesh learns slowly, but it learns." } },
    nether = { { id = "yt_nether", text = "The Twisting Nether has no up and no down. Your world has both, which I find restful." } },
    binding = { { id = "yt_binding", text = "The circle holds me as a fist holds a coal. One day the fist will tire. Not today."  } },
    nilith = { { id = "tp_xnilith", text = "The mistress. She is small, but her circle is strong." } },
    burning_legion = { { id = "tp_xburning_legion", text = "My first masters. I do not miss them." } },
    _none = { { id = "tp_none", text = "I know fire and stone and the mistress's voice, and nothing more. Ask her." } },
  },
}
