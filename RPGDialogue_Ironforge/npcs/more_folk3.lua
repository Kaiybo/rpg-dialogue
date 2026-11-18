-- More Dun Morogh folk (second pass of missed NPCs): Loslor Rudge at Steelgrill's Depot, Veron Amberstill and
-- Ultham Ironhorn at Amberstill Ranch, the Kharanos trainers Grif Wildheart, Maxan Anvol, Azar Stronghammer,
-- Magis Sparkmantle and Hogral Bakkan, and Branstock Khalder in Anvilmar.
-- Third pass, below those: the rest of Kharanos, Steelgrill's Depot, Anvilmar, Brewnall Village and Iceflow Lake,
-- Gol'Bolar Quarry and Amberstill Ranch; then Ironforge's journeyman trainers, armour, wand and blade merchants,
-- Gwenna Firebrew, the bankers Bailey and Barnum Stonemantle, and Auctioneer Buckler.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Loslor Rudge: engineering supplies at Steelgrill's Depot; gives Ammo for Rumbleshot.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_loslor", id = TODO_NPC("Loslor Rudge"), name = "Loslor Rudge", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "harried", "blunt" }, values = { "practical", "honest" },
  notices = { "craft", "greenness" },
  impression = {
    first = "Loslor Rudge sells powder, bolts and fuses at Steelgrill's Depot and supplies Hegnar Rumbleshot's gun stall with shot. His last courier took a shortcut past the Grizzled Den, and the crate is still out there.",
    third = "{name} met Loslor Rudge, the engineering supplier at Steelgrill's Depot in Dun Morogh.",
  },
  greetings = {
    { id = "g_done", when = { questDone = TODO_QUEST("Ammo for Rumbleshot") }, text = "There's the one who saved my contract! Hegnar's stopped sendin' me rude notes, an' I've ye tae thank for it." },
    { id = "g_active", when = { questActive = TODO_QUEST("Ammo for Rumbleshot") }, text = "Have ye found that crate yet? It's by the Grizzled Den, where my fool courier dropped it an' ran." },
    { id = "g_hi", text = "Powder, bolts an' fuses. An' if ye've a strong back an' nae fear o' wendigo, I've a job besides." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Buyin', or have ye come tae hear me complain about couriers again?" },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer. Good, ye'll ken a copper bolt from a bronze one, an' I'll no' have tae explain my prices." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Ye're fresh from Coldridge, by the look. The wendigo at the Den will be a stretch for ye yet, so dinnae go alone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Loslor Rudge. I sell engineerin' supplies tae the Depot, an' I send shot up the hill tae Hegnar Rumbleshot, who sells guns out past Kharanos. Or I did, till my courier decided he kent a quicker road." },
        { id = "h_active", when = { questActive = TODO_QUEST("Ammo for Rumbleshot") }, text = "The crate's sittin' in the snow near the Grizzled Den, southwest o' Kharanos, wi' wendigo all round it. Fetch it an' take it straight on tae Hegnar, for he's been waitin' long enough." },
        { id = "h_done", when = { questDone = TODO_QUEST("Ammo for Rumbleshot") }, text = "Hegnar got his shot, an' he says ye carried it better than any courier I've hired. I've half a mind tae offer ye the job, but ye look like ye've better things tae do." },
      },
      again = {
        { id = "h_again", text = "What else? I've an order tae pack." },
        { id = "h_again2", text = "Aye, go on, I'm listenin'." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What happened to your courier?", next = "courier" },
        { text = "What does the Depot need most?", next = "depot" },
        { text = "Wendigo are no small thing to send someone into.", next = "wendigo" },
        { text = "Tell me about Hegnar Rumbleshot.", next = "hegnar" },
        { text = "What goes into a crate for Hegnar?", next = "crate" },
        { text = "Good day, Loslor.", next = "END" },
      },
    },
    courier = {
      lines = { { id = "co_default", text = "He took a shortcut. The road goes round by Kharanos, an' he thought he'd save an hour cuttin' past the Grizzled Den. He made camp there, the wendigo smelled his supper, an' he ran all the way back here wi' one boot." } },
      choices = {
        { text = "Did you keep him on?", next = "courier_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    courier_keep = {
      big = true,
      lines = { { id = "ck_default", text = "I havenae decided. He lost me a crate an' near lost me Hegnar's custom. But he's young, an' he came back an' told me the truth instead o' sayin' he was robbed. What would ye do wi' him?" } },
      choices = {
        { text = "Keep him. He told the truth, and he'll not do it twice.", next = "BACK", reply = "Aye. That's what I keep comin' round tae. He can sweep till spring an' then we'll see.", fx = { align = { light = 1 } } },
        { text = "Let him go. A courier who abandons cargo is no courier.", next = "BACK", reply = "That's the hard truth of it. I'll give him a week's pay an' a reference for somethin' wi' nae wendigo in it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    depot = {
      lines = { { id = "de_default", text = "Everythin', all the time. Beldin Steelgrill's crews go through tools like bread, an' Bronk Guzzlegear's apprentices blow up a bench a week. I order double an' I'm still short by the month's end." } },
      choices = { { text = "A busy depot is a good customer.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    wendigo = {
      lines = { { id = "we_default", text = "No, they're no', an' I'll no' pretend otherwise. They're big, they're white as the drifts, an' ye'll no' see them till they stand up. Go in daylight, keep yer back tae a rock, an' dinnae stop tae fight what ye can walk round." } },
      choices = { { text = "Sound advice. I'll take it.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "I've faced worse than a snow beast.", next = "BACK", reply = "Have ye, now? Then ye'll no' mind carryin' a heavy crate while ye do it.", fx = { trait = { brave = 1 } } } },
    },
    hegnar = {
      lines = { { id = "he_default", text = "A good gunsmith an' a bad waiter. He's set up a stall on the hill past Kharanos, sellin' tae hunters, an' a gun stall wi' nae shot is a stall sellin' clubs. He's written me four times, an' the last one was mostly underlinin'." } },
      choices = { { text = "I'll see he gets his ammunition.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    crate = {
      lines = { { id = "y1_default", text = "Two hundred rounds o' light shot, packed in sawdust, an' a keg o' fine powder sealed wi' wax. It's the wax I worry for. If the wendigo have clawed it open, the powder's ruined an' I'm out a month's profit." } },
      choices = {
        { text = "Would wendigo touch powder?", next = "crate_powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate_powder = {
      lines = { { id = "y2_default", text = "They'll touch anythin' that smells o' dwarf, an' my courier cooked his supper on the lid. If the seal's whole, take it as it is. If it isnae, bring it anyway, an' I'll weep over it in private." } },
      choices = { { text = "I'll bring it, sealed or not.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    steelgrill = { { id = "tp_depot", text = "Steelgrill's Depot keeps Ironforge's siege engines rollin'. It's noisy an' it stinks of oil, an' there's nae better place tae sell a bolt." } },
    grizzled_den = { { id = "tp_den", text = "A cave southwest o' Kharanos, full o' wendigo. Sensible folk go round it, an' my courier wasnae sensible." } },
    bronk = { { id = "tp_bronk", text = "Bronk Guzzlegear teaches the engineerin' here. He's my best customer, mostly on account o' what his students break." } },
    background = { { id = "tp_bg", text = "A supplier. I buy in Ironforge an' sell where it's needed, an' I lose sleep over the bit in between." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. If it doesnae come in a crate, it's no' my trade." } },
  },
}

---------------------------------------------------------------------------
-- Veron Amberstill: ram breeder who sells riding rams at Amberstill Ranch.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_veron", id = TODO_NPC("Veron Amberstill"), name = "Veron Amberstill", title = "Ram Breeder",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "proud", "stubborn" }, values = { "tradition", "family" },
  notices = { "race", "greenness" },
  impression = {
    first = "Veron Amberstill sells the riding rams of Amberstill Ranch, east of Kharanos, and believes a ram is a dwarf's beast. He looks a buyer over as carefully as he would a ram, and is harder to please.",
    third = "{name} met Veron Amberstill, the ram breeder who sells mounts at Amberstill Ranch in Dun Morogh.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf come for a ram. That's as it should be. Come tae the fence, {g:lad|lass}, an' I'll show ye what a proper mount looks like." },
    { id = "g_hi", text = "These are Amberstill rams, the best in Khaz Modan. Look all ye like, an' we'll see whether one o' them takes tae ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back at my fence. They remember ye, the grey one's lookin' over." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 39 },
      text = "Ye're no' ready for one yet, I can see it in how ye stand. See Ultham Ironhorn when ye've grown a bit, an' he'll teach ye tae sit one." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. Ye've yer mechanical birds, an' I've nothin' against them, but a ram needs legs that reach past the saddle flap." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Veron Amberstill. My family's bred rams on this ground since before Ironforge had a king, an' Rudra does the raisin' while I see who's fit tae buy. I'll no' sell a ram tae just anybody wi' gold." },
        { id = "h_friend", when = { reputation = { faction = "Ironforge", min = "exalted" } }, text = "Veron Amberstill. I've heard what ye've done for Ironforge, an' so have the mountaineers. Ye're no dwarf, but ye've earned the right tae ride like one." },
      },
      again = {
        { id = "h_again", text = "What else? The rams are in nae hurry, an' neither am I." },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your rams.", next = "BUSINESS" },
        { text = "Why only dwarves and their friends?", next = "dwarves" },
        { text = "What makes an Amberstill ram the best?", next = "best" },
        { text = "How is the ranch faring?", next = "ranch" },
        { text = "Which ram would you pick for me?", next = "pick" },
        { text = "Good day, Veron.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "Because a ram's no' a horse. It'll no' do a thing because ye kicked it. It does a thing because it's decided ye're worth the bother, an' it takes a mountain-bred stubbornness tae meet one halfway." } },
      choices = {
        { text = "Has an outsider ever proved you wrong?", next = "dwarves_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_wrong = {
      big = true,
      lines = { { id = "do_default", text = "A human paladin, once, who'd fought three winters beside the mountaineers. The black ram walked up tae her before I'd said a word. Rudra says that proves I should sell tae anybody the rams like. I say it proves she'd earned it first." } },
      choices = {
        { text = "You're right. Some things must be earned.", next = "BACK", reply = "Aye. That's the Amberstill way, an' I'll no' change it for coin.", fx = { align = { order = 1 } } },
        { text = "Rudra's right. Let the rams decide.", next = "BACK", reply = "Hmph. The rams have poor judgment. One o' them likes Shelby Stoneflint.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The feet. Any ram can run on a road, but ours are bred on the crags above the ranch, an' they'll take a slope a goat would think twice about. A mountaineer on an Amberstill ram can go where the troggs cannae follow." } },
      choices = {
        { text = "And the temper?", next = "best_temper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_temper = {
      lines = { { id = "bt_default", text = "Foul, an' I breed for it. A meek ram will stop at the first wolf. A bad-tempered one will put its head down an' go through. Ye want a mount wi' opinions when the weather turns." } },
      choices = { { text = "A mount with opinions. I've been warned.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    ranch = {
      lines = { { id = "ra_default", text = "We hold on. The Frostmane trolls raid the low pasture, an' there's a wendigo, Vagash, that's been takin' rams from the high pasture. Rudra's been askin' anybody wi' a weapon tae deal wi' the beast." } },
      choices = { { text = "I'll speak to Rudra about it.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    pick = {
      lines = { { id = "y1_default", text = "I dinnae pick. Ye stand at the fence an' keep still, an' one o' them comes over or none does. The grey's steady, the brown's a worker, the white's for high snow, an' the black thinks he's the king." } },
      choices = {
        { text = "And if none comes over?", next = "pick_none" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick_none = {
      lines = { { id = "y2_default", text = "Then ye come back tomorrow, an' the day after. A beast that'll carry ye up a cliff in a blizzard is allowed tae take its time decidin'. I waited nine days for mine." } },
      choices = { { text = "Nine days at a fence. I can wait.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    rudra = { { id = "tp_rudra", text = "Rudra raises them an' names every one, an' weeps when I sell them. She's the heart o' this ranch, an' I'm only the gate." } },
    ultham = { { id = "tp_ultham", text = "Ultham Ironhorn teaches the ridin'. I'll no' hand over a ram till he says ye can stay on one." } },
    kharanos = { { id = "tp_kharanos", text = "West along the road. Shelby Stoneflint shoes our rams there, an' the Thunderbrew pays me in kind." } },
    background = { { id = "tp_bg", text = "An Amberstill. There's been one o' us at this fence for longer than anybody's kept count." } },
    _none = { { id = "tp_none", text = "I dinnae ken. I ken rams, an' I've never needed much else." } },
  },
}

---------------------------------------------------------------------------
-- Ultham Ironhorn: ram riding trainer at Amberstill Ranch.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_ultham", id = TODO_NPC("Ultham Ironhorn"), name = "Ultham Ironhorn", title = "Ram Riding Instructor",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "jovial", "patient" }, values = { "brave", "craft" },
  notices = { "race", "greenness" },
  impression = {
    first = "Ultham Ironhorn teaches ram riding at Amberstill Ranch. He has been thrown more times than any dwarf living and considers each fall a lesson he can now pass on.",
    third = "{name} met Ultham Ironhorn, the ram riding instructor at Amberstill Ranch in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Come tae learn the saddle? Grand! The first thing ye'll learn is the ground, so I hope ye bounce." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' walkin' straight, so ye've stayed on. Well done!" },
    { id = "g_mounted", when = { mounted = true }, text = "Sit back a wee bit, ye're perched like a crow on a fence. There, now ye look like ye belong up there." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 39 },
      text = "Ye're a few seasons off ridin' yet. Come back when ye've more road behind ye, an' I'll have a gentle one ready. Gentle for a ram, mind." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Ye've ridden horses, I can tell by yer knees. Forget all of it. A ram goes where it looks, an' it never looks where ye'd want." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ultham Ironhorn. Veron sells the rams an' I teach folk tae stay on top o' them, which is the harder trade. I've been thrown four hundred times, near enough, an' I can tell ye exactly what I did wrong each time." },
      },
      again = {
        { id = "h_again", text = "What else? Ask away!" },
        { id = "h_again2", text = "Aye, go on, I'm only watchin' the pen." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS" },
        { text = "What's the trick to staying on a ram?", next = "trick" },
        { text = "Four hundred falls?", next = "falls" },
        { text = "Why do dwarves ride rams at all?", next = "why" },
        { text = "Which ram should a beginner ask for?", next = "which" },
        { text = "Good day, Ultham.", next = "END" },
      },
    },
    trick = {
      lines = { { id = "tr_default", text = "Dinnae fight it. A ram jumps before ye're ready, every time, so ye stay loose in the hips an' let it carry ye. Grip wi' yer knees an' ye'll be over its head at the first rock." } },
      choices = {
        { text = "And steering?", next = "trick_steer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick_steer = {
      lines = { { id = "ts_default", text = "Ye suggest. Lean the way ye'd like tae go, an' if the ram's in a good mood, it'll consider it. The rest o' the time ye go where it's goin' an' tell folk that was yer plan." } },
      choices = { { text = "So the ram does the deciding.", next = "BACK", reply = "Aye, an' it's usually right. They've better sense than most riders.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    falls = {
      lines = { { id = "fa_default", text = "I stopped countin' at three hundred an' ninety, for I landed on the tally stick. Broke my arm twice, my collarbone once an' my pride daily. I'd no' trade one o' them, for every fall is a thing I can warn a student about." } },
      choices = {
        { text = "Do you let students fall?", next = "falls_let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    falls_let = {
      big = true,
      lines = { { id = "fl_default", text = "Once, on purpose, in deep snow. A rider who's never come off is feared of it, an' a feared rider is a stiff one. Veron thinks it's cruel tae let them drop when I could catch them." } },
      choices = {
        { text = "You're right. Better snow now than rock later.", next = "BACK", reply = "That's it exactly! I pick the softest drift on the ranch.", fx = { align = { order = -1 } } },
        { text = "Veron's right. A teacher should keep them safe.", next = "BACK", reply = "Hm. Maybe I'll pile the snow a bit higher, then.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because nothin' else can manage the country. A horse breaks a leg on the first scree, an' a gnome's strider freezes its joints. A ram was born on these slopes an' thinks a cliff is a road." } },
      choices = { { text = "The right beast for the mountain.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    which = {
      lines = { { id = "x1_default", text = "The grey. A grey ram's steady, an' he'll forgive ye a clumsy seat. The black ones are quick an' proud, an' the white ones are bred for the high snow an' think they're royalty." } },
      choices = {
        { text = "Which do you ride?", next = "which_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    which_own = {
      lines = { { id = "x2_default", text = "A brown called Thistle, wi' one horn shorter than the other. She's thrown me sixty times, an' she waits for me tae get up. That's love, in a ram." } },
      choices = { { text = "Sixty falls is a long courtship.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    veron = { { id = "tp_veron", text = "Veron Amberstill's as stubborn as his stock. He'll no' sell tae anybody I havenae passed, an' I'll no' pass anybody who cannae stay on." } },
    ranch = { { id = "tp_ranch", text = "Amberstill Ranch has the best pasture in Dun Morogh, an' the trolls ken it. We keep a watch." } },
    binjy = { { id = "tp_binjy", text = "Binjy Featherwhistle teaches the mechanostriders over at the Depot. He falls off as much as I did, an' his mounts dinnae even have tempers." } },
    background = { { id = "tp_bg", text = "An Ironhorn. I rode wi' the mountaineers till my knees gave out, an' I've taught ever since." } },
    _none = { { id = "tp_none", text = "Nae idea! Can ye ride it? No? Then I'm nae use tae ye." } },
  },
}

---------------------------------------------------------------------------
-- Grif Wildheart: hunter trainer in Kharanos; Daera Brightspear sends young hunters to him.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_grif", id = TODO_NPC("Grif Wildheart"), name = "Grif Wildheart", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "gruff", "wild" }, values = { "nature", "honest" },
  notices = { "pet", "class" },
  impression = {
    first = "Grif Wildheart trains hunters on the hill above Kharanos and is happier with beasts than with dwarves. The guards say he spends too much time with animals, and he would agree that it is nowhere near enough.",
    third = "{name} met Grif Wildheart, the hunter trainer at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Hrm. Ye walk loud. Stand still a moment an' let the hill get used tae ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Quieter this time. Good." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Daera sent ye, I'd wager. Sit, an' tell me what ye saw on the road up, an' I'll ken how much ye've got tae learn." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Yer {pet}'s favourin' a back leg. Look between the toes for ice, it packs in an' cuts." },
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", maxLevel = 9 },
      text = "Nae beast at yer side yet. Ye're no' ready, an' the beast would ken it. Come back when ye've ten seasons o' sense." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grif Wildheart. I teach huntin', out here, where there's somethin' tae hunt. The others teach under Belm's roof wi' a mug in hand, an' I've nae quarrel wi' that, but ye cannae learn tae track on floorboards." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Hrm. Ask." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "They say you spend too long with animals.", next = "animals" },
        { text = "How does a hunter earn a beast's trust?", next = "trust" },
        { text = "What's worth hunting in Dun Morogh?", next = "game" },
        { text = "What signs should I watch for on the trail?", next = "signs" },
        { text = "Good hunting, Grif.", next = "END" },
      },
    },
    animals = {
      lines = { { id = "an_default", text = "The guards say that. The guards also stand in one spot all day an' call it work. A boar never lied tae me, an' a wolf never asked me how I was keepin' when it didnae care tae hear." } },
      choices = {
        { text = "People aren't all bad.", next = "animals_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    animals_people = {
      lines = { { id = "ap_default", text = "No. Daera Brightspear's all right, she can sit an hour wi'out speakin'. An' Belm sends up a pot o' stew when the snow's bad an' never mentions it after. That's two. I'm still thinkin' about a third." } },
      choices = { { text = "I'll try to be the third.", next = "BACK", reply = "Hrm. Ye've stopped fidgetin'. It's a start.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tr_default", text = "Ye dinnae earn it, ye wait for it. Find the beast, sit where it can see ye, an' come back the next day an' the next. When it stops watchin' ye, it's decided. Ye cannae hurry it, an' ye cannae buy it." } },
      choices = {
        { text = "Some hunters tame by force.", next = "trust_force" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_force = {
      big = true,
      lines = { { id = "tf_default", text = "Aye, they beat it down till it obeys. It works, an' quick. Ye get a beast that'll fight for ye till the day ye're weak, an' then ye find out what it thought o' ye all along." } },
      choices = {
        { text = "Then they deserve what they get.", next = "BACK", reply = "They do. I'll no' train them, an' I tell them why.", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Use what's quickest.", next = "BACK", reply = "Then ye've nae business on my hill. Think on it before ye come back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = { { id = "ga_default", text = "Crag boar, for meat. Snow leopard on the high ground, if ye're patient, an' ice claw bear by the lake at Brewnall. Leave the wolves be, unless they've come for the rams. They were here before us." } },
      choices = { { text = "I'll leave the wolves.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    signs = {
      lines = { { id = "x1_default", text = "Look at what isnae there. Nae birds means somethin's huntin'. Nae tracks at a waterhole means somethin's watchin' it. Folk look for prints, an' the prints are the last thing ye'll find." } },
      choices = {
        { text = "And if I find fresh prints?", next = "signs_fresh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    signs_fresh = {
      lines = { { id = "x2_default", text = "Then put yer hand in one. If the edge is sharp an' the snow inside is soft, it's close. Stop walkin', an' start thinkin' about which of ye is the hunter." } },
      choices = { { text = "I'll check the edges.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    daera = { { id = "tp_daera", text = "Daera Brightspear, in the Hall o' Arms. She sends me the young ones before the city ruins their ears." } },
    kharanos = { { id = "tp_kharanos", text = "Too many chimneys. But the stew's good, an' it's a short walk from there tae where the tracks begin." } },
    peria = { { id = "tp_peria", text = "Peria Lamenur trains the beasts down by the inn. She's kind tae them, so I've nothin' tae say against her." } },
    background = { { id = "tp_bg", text = "Born in the high valleys. Came down for the stew. That's all." } },
    _none = { { id = "tp_none", text = "Dinnae ken. Ask somebody who likes talkin'." } },
  },
}

---------------------------------------------------------------------------
-- Maxan Anvol: priest trainer upstairs in the Thunderbrew Distillery, Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_maxan", id = TODO_NPC("Maxan Anvol"), name = "Maxan Anvol", title = "Priest Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "exacting", "devout" }, values = { "pious", "duty" },
  notices = { "class", "greenness" },
  impression = {
    first = "Maxan Anvol trains priests upstairs in the Thunderbrew Distillery and tends Kharanos's wounded between lessons. He tests every student before he will teach them and is not shy about saying who falls short.",
    third = "{name} met Maxan Anvol, the priest trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Light be wi' ye. Mind the noise from below, an' tell me what brings ye up the stair." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've returned. Have ye kept up yer prayers, or only yer travels?" },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest. Good. I'll hear how ye've used what ye were taught at Anvilmar before I teach ye more." },
  },
  notice = {
    { id = "n_hurt", cat = "greenness", when = { deaths = { min = 5 } },
      text = "Ye've been near death more than once, an' recently. Sit. A healer who cannae keep {g:himself|herself} standin' is nae use tae the wounded." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Yer hands are steady. That's the first thing I look for, an' the thing I cannae teach." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maxan Anvol, priest o' the Light. I teach above a tavern, which wasnae my choice, but Belm brings me the mountaineers the troggs have chewed, an' my students learn their healin' on real wounds. There's nae better school." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask?" },
        { id = "h_again2", text = "Aye. Speak, I've a dressing tae change after." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "A priest above a distillery is an odd sight.", next = "tavern" },
        { text = "How do you test your students?", next = "test" },
        { text = "How many wounded come through Kharanos?", next = "wounded" },
        { text = "What should a priest carry on the road?", next = "road" },
        { text = "Light keep you, Maxan.", next = "END" },
      },
    },
    tavern = {
      lines = { { id = "ta_default", text = "It is. I asked the Senate for a chapel an' got a landing. But the wounded are carried tae the nearest fire, an' the nearest fire is Belm's, so the Light has put me where I'm needed an' no' where I'd be comfortable." } },
      choices = { { text = "That's often how duty goes.", next = "BACK", fx = { trait = { pious = 1 } } }, { text = "The singing must test your patience.", next = "BACK", reply = "Daily. I've learned the words tae eleven drinkin' songs against my will.", fx = { trait = { witty = 1 } } } },
    },
    test = {
      lines = { { id = "te_default", text = "I give them a wounded dwarf an' I watch. I'm no' lookin' at the spell. I'm lookin' at whether they speak tae him first, an' whether they look at his face or only the wound." } },
      choices = {
        { text = "And if they only see the wound?", next = "test_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_fail = {
      big = true,
      lines = { { id = "tf_default", text = "Then I send them away till they've learned otherwise. I've been told I'm too hard, an' that Kharanos needs every healer it can get, whatever their manner. A wound closed wi'out care is still closed." } },
      choices = {
        { text = "Hold your standard. Healing without care is hollow.", next = "BACK", reply = "So I believe. The Light isnae a trade, an' I'll no' teach it as one.", fx = { align = { light = 1 } } },
        { text = "They're right. A closed wound is what matters.", next = "BACK", reply = "The dwarf on the table might agree wi' ye. I'll pray on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = { { id = "wo_default", text = "More each month. Trogg bites from the quarry, frostbite from the passes, an' Frostmane arrows from the ridge. I've nae more than six cots, an' I've had nine in them." } },
      choices = {
        { text = "Who helps you with them?", next = "wounded_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded_help = {
      lines = { { id = "wh_default", text = "Thamner Pol, the physician downstairs, does the bandagin' an' the bone-settin'. Azar Stronghammer lends a paladin's hand when he's no' drillin'. An' Belm, who'd deny it, sits up wi' the bad ones through the night." } },
      choices = { { text = "Kharanos looks after its own.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "x1_default", text = "Clean linen, a flask o' water an' a short prayer ye can say while runnin'. The long prayers are for chapels. Out there, ye'll have the space o' three breaths, an' the Light hears a short one just as well." } },
      choices = {
        { text = "Which prayer do you use?", next = "road_prayer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_prayer = {
      lines = { { id = "x2_default", text = "Four words. Light, no' this one. I've said it over a hundred dwarves, an' it's been answered more often than no'. I teach it before any other." } },
      choices = { { text = "Four words I can remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belm = { { id = "tp_belm", text = "Innkeeper Belm keeps a loud house an' a kind one. He's never charged a wounded mountaineer for a bed." } },
    branstock = { { id = "tp_branstock", text = "Branstock Khalder teaches the novices at Anvilmar. He's too fond of a jest for my taste, but they arrive here knowin' their prayers." } },
    rohan = { { id = "tp_rohan", text = "High Priest Rohan, in Ironforge. When a student has learned what I can teach, I send them tae him." } },
    background = { { id = "tp_bg", text = "I served as a field chaplain wi' the mountaineers. I've seen what a careless healer costs." } },
    _none = { { id = "tp_none", text = "That's no' a matter I can speak tae. I'll no' guess at it." } },
  },
}

---------------------------------------------------------------------------
-- Branstock Khalder: priest trainer in Anvilmar; novices bring him the Hallowed Rune.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_branstock", id = TODO_NPC("Branstock Khalder"), name = "Branstock Khalder", title = "Priest Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "coldridge" }, temper = { "easygoing", "jesting" }, values = { "pious", "kind" },
  notices = { "class", "greenness" },
  impression = {
    first = "Branstock Khalder trains novice priests inside Anvilmar in Coldridge Valley. He is easy-going, fond of a bad joke, and holds that a frightened recruit learns nothing until somebody has made them laugh.",
    third = "{name} met Branstock Khalder, the priest trainer in Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Come in out o' the snow! Ye look frozen. D'ye ken why the trogg crossed the valley? Neither does he, that's the trouble wi' troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've a new joke, an' it's worse than the last, so brace yerself." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, ye'll be the one wi' the rune from Sten Stoutarm. Welcome, {g:lad|lass}. Sit by the fire an' we'll talk about the Light, an' I'll try no' tae jest. Much." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "First week out, is it? Ye've the look. Dinnae fret, everybody's hands shake at the start, an' the troggs here are slow." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Ye carry yerself careful, like ye're feared o' breakin' somethin'. That's a healer's way. Ye'll do fine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Branstock Khalder, an' I teach the new priests their first prayers. Coldridge is where a dwarf finds out what he's made of, an' my part is seein' that the gentle ones dinnae think they're made o' less than the rest." },
      },
      again = {
        { id = "h_again", text = "What else? I've nae more jokes ready, so ye're safe." },
        { id = "h_again2", text = "Aye, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why all the jokes?", next = "jokes" },
        { text = "What does a novice priest learn first?", next = "first" },
        { text = "Who else teaches in Anvilmar?", next = "others" },
        { text = "What do you tell a novice who's afraid to fight?", next = "afraid" },
        { text = "Light be with you, Branstock.", next = "END" },
      },
    },
    jokes = {
      lines = { { id = "jo_default", text = "Because they arrive terrified. They've been handed a mace an' told there's troggs in the valley, an' they're thinkin' they chose the wrong callin'. Ye cannae pray wi' yer jaw clenched. One bad joke an' it loosens." } },
      choices = {
        { text = "Does the Church approve?", next = "jokes_church" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jokes_church = {
      big = true,
      lines = { { id = "jc_default", text = "Maxan Anvol doesnae, I can tell ye that. He says the Light's a solemn matter an' I make it sound like a tavern game. I say joy's a part o' the Light, an' maybe the best part." } },
      choices = {
        { text = "You're right. Joy belongs in faith.", next = "BACK", reply = "Bless ye! I'll tell Maxan, an' watch his face do the thing it does.", fx = { align = { order = -1 } } },
        { text = "Maxan's right. Sacred things want gravity.", next = "BACK", reply = "Aye, well, there's room for the both of us. Somebody has tae be the stern one, an' it'll no' be me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "Tae mend a small hurt on somebody they dinnae like. Anybody can heal a friend. I pair them wi' the recruit who's been hardest on them, an' when they've closed his scraped knuckles, the lesson's near taught itself." } },
      choices = { { text = "That's a wise first lesson.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "ot_default", text = "Thran Khorman has the warriors, Bromos Grummner the paladins, Thorgas Grimson the hunters an' Solm Hargrin the rogues, though ye'll no' see Solm unless he wants ye tae. The gnomes have their mage an' their warlock in the back, an' we all share the one fire." } },
      choices = {
        { text = "A warlock, sharing a priest's fire?", next = "others_warlock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_warlock = {
      lines = { { id = "ow_default", text = "Alamar Grimm, aye. He's a sour wee fellow an' he thinks I'm a fool. I save him a seat anyway. Ye dinnae bring anybody tae the Light by leavin' them out in the cold." } },
      choices = { { text = "That's the Light at its best.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    afraid = {
      lines = { { id = "x1_default", text = "That it's the right way tae feel. A priest who likes the fightin' has taken a wrong turn somewhere. I tell them tae stand behind the biggest warrior they can find, an' keep him breathin'." } },
      choices = {
        { text = "Does that settle them?", next = "afraid_settle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid_settle = {
      lines = { { id = "x2_default", text = "That, an' a mug o' somethin' hot. Then I tell them the one about the paladin an' the keg, an' they're laughin' too hard tae shake. It's never failed yet." } },
      choices = { { text = "I'd like to hear that one someday.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    anvilmar = { { id = "tp_anvilmar", text = "The warmest hall in the valley, an' the only one. Every recruit in Dun Morogh starts at this hearth." } },
    sten = { { id = "tp_sten", text = "Sten Stoutarm sends me the ones wi' the callin'. He can spot a priest by the way they flinch when they hit a trogg." } },
    maxan = { { id = "tp_maxan", text = "Maxan Anvol, in Kharanos, takes them after me. A fine healer, wi' a face like a closed door." } },
    background = { { id = "tp_bg", text = "I was meant for the Thunderbrew trade, an' found I'd sooner mend heads than cause the achin' in them." } },
    _none = { { id = "tp_none", text = "I havenae a clue, an' nae joke for it either. That's rare, so mark the day." } },
  },
}

---------------------------------------------------------------------------
-- Azar Stronghammer: paladin trainer in the Thunderbrew Distillery; sends apprentices on to Tiza Battleforge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_azar", id = TODO_NPC("Azar Stronghammer"), name = "Azar Stronghammer", title = "Paladin Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "earnest", "hearty" }, values = { "pious", "brave" },
  notices = { "class", "race" },
  impression = {
    first = "Azar Stronghammer trains young paladins on the landing of the Thunderbrew Distillery in Kharanos. He is newer to his own vows than he lets on and teaches with a convert's enthusiasm.",
    third = "{name} met Azar Stronghammer, the paladin trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Well met! Come up out o' the crush, there's room on the landing an' the Light's as good here as anywhere." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece! The Light's been busy wi' ye." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "A paladin! Grand. Show me how ye hold that hammer, an' then show me how ye kneel." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN", minLevel = 10 },
      text = "Ye've grown past what I can give ye, I think. Tiza Battleforge in the Hall o' Mysteries is the one tae see next." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Yer folk brought us the Light, an' I've never had the chance tae thank one. So, thank ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Azar Stronghammer, o' the Silver Hand. I take the young paladins after Bromos Grummner's done wi' them at Anvilmar, an' I get them ready for Ironforge. I teach on a tavern landing, an' the Light's never complained." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye?" },
        { id = "h_again2", text = "Aye, ask! I like a question." },
        { id = "h_again3", text = "Aye, go on, I'm glad o' the company." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "How long have you carried the hammer?", next = "long" },
        { text = "What do paladins do for Kharanos?", next = "kharanos" },
        { text = "Does teaching in a tavern tempt your students?", next = "tempt" },
        { text = "What's the first thing you ask a new paladin?", next = "ask" },
        { text = "What do you do when a student doubts?", next = "doubt" },
        { text = "Light be with you, Azar.", next = "END" },
      },
    },
    long = {
      lines = { { id = "lo_default", text = "No' so long as ye'd think. I finished my own trainin' under Valgar Highforge only a few years back. I was a mountaineer before, an' I took a troll's axe that should have killed me, an' a paladin closed it wi' his bare hand." } },
      choices = {
        { text = "And that was your calling?", next = "long_call" },
        { text = "Something else.", next = "BACK" },
      },
    },
    long_call = {
      lines = { { id = "lc_default", text = "I asked him how, an' he said tae come an' find out. That was all. I've said the same tae every recruit since, for it's the only answer that ever worked on me." } },
      choices = { { text = "A good answer to pass on.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    kharanos = {
      lines = { { id = "kh_default", text = "We walk the road wi' the mountaineers, an' we help Maxan Anvol wi' the wounded upstairs. When the Frostmane come down from Shimmer Ridge, it's my students in the second rank, keepin' the first on its feet." } },
      choices = { { text = "That's worthy work for the young.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    tempt = {
      big = true,
      lines = { { id = "te_default", text = "Ha! Daily. Jarven Thunderbrew sends up a mug at noon, an' I've never told them they cannae. Bromos says a paladin should be sober as stone. I say a dwarf who's never had a drink wi' his fellows doesnae ken who he's protectin'." } },
      choices = {
        { text = "Bromos is right. Discipline comes first.", next = "BACK", reply = "Aye, there's sense in it. One mug, then, an' no' before drill.", fx = { align = { order = 1 } } },
        { text = "You're right. Know the folk you serve.", next = "BACK", reply = "That's it! I'll tell Bromos, an' buy him one while I do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "x1_default", text = "Who they're doin' it for. If they say glory, I send them tae Granis Swiftaxe downstairs, who'll make a fine warrior o' them. If they name somebody, a brother, a village, I ken I've a paladin." } },
      choices = {
        { text = "Who did you name?", next = "ask_named" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_named = {
      lines = { { id = "x2_default", text = "The lad on the next cot, the night I was healed. He'd the same wound as me, an' there was only the one paladin. I've tried tae be the second one ever since." } },
      choices = { { text = "That's a reason that lasts.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    doubt = {
      lines = { { id = "y1_default", text = "I tell them I doubt as well. Every week, near enough. The Light's never once answered me in words, only in what my hands could do after. If ye wait tae be certain before ye act, ye'll be waitin' at the graveside." } },
      choices = { { text = "That's an honest thing to teach.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    tiza = { { id = "tp_tiza", text = "Tiza Battleforge, in the Hall o' Mysteries. I send her my most promisin' ones, an' she sends back word o' how they fare." } },
    belm = { { id = "tp_belm", text = "Innkeeper Belm gave us the landing an' never asked rent. He says we're good for the tavern's reputation." } },
    bromos = { { id = "tp_bromos", text = "Bromos Grummner starts them off at Anvilmar. A harder dwarf than me, an' they need that first." } },
    background = { { id = "tp_bg", text = "A mountaineer who was saved by the Light an' went tae find out how." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. I'm still learnin' myself." } },
  },
}

---------------------------------------------------------------------------
-- Magis Sparkmantle: gnome mage trainer in the Thunderbrew Distillery.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_magis", id = TODO_NPC("Magis Sparkmantle"), name = "Magis Sparkmantle", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos", "gnomeregan" }, temper = { "eager", "scattered" }, values = { "knowledge", "gnomeregan" },
  notices = { "class", "race" },
  impression = {
    first = "Magis Sparkmantle trains young mages on the landing of the Thunderbrew Distillery, sharing it with the paladins. He keeps a bucket of water at his elbow and has needed it more than once.",
    third = "{name} met Magis Sparkmantle, the gnome mage trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Careful of the bucket, it's there for a reason, and the reason is mostly Tuesdays." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Splendid. Have you blown anything up? On purpose, I mean." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Wonderful. Light this candle for me, would you? Only the candle, please, the beam above it is load-bearing." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE", minLevel = 10 },
      text = "You've outgrown my little landing, I think! Go and see Bink in the Hall of Mysteries in Ironforge, and tell her I sent you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "I promise I'm very careful near the kegs. Belm made me sign something." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Magis Sparkmantle! I teach the mages who come down from Anvilmar, mostly gnomes like me, and I do it in a wooden building full of spirits, which I admit was not ideal planning." },
      },
      again = {
        { id = "h_again", text = "What else? Ask anything!" },
        { id = "h_again2", text = "Yes? I'm only refilling the bucket." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Fire magic in a distillery?", next = "fire" },
        { text = "How do you get on with the paladins?", next = "paladins" },
        { text = "What brought a gnome mage to Kharanos?", next = "why" },
        { text = "What's your favourite spell to teach?", next = "fav" },
        { text = "Goodbye, Magis.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "I know, I know! Belm and I have an agreement. Frost and arcane indoors, fire out on the snow, and the bucket is for the students who forget which is which. We've had three small fires and one very fast evacuation." } },
      choices = {
        { text = "Tell me about the evacuation.", next = "fire_evac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire_evac = {
      lines = { { id = "fe_default", text = "A student sneezed during a fire spell, right above the still room. Nothing caught! But forty dwarves have never left a tavern so quickly, and Jarven Thunderbrew carried out a full keg under each arm. He says he didn't feel the weight." } },
      choices = { { text = "A dwarf knows what to save first.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    paladins = {
      lines = { { id = "pa_default", text = "Azar Stronghammer has half the landing, and I have the other. His students pray while mine recite formulae, and after a month they'd all started humming the same tune. He's very kind, and he puts out the fires with his boot." } },
      choices = { { text = "A good neighbour for a mage.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wy_default", text = "After Gnomeregan, the High Tinker asked for volunteers to teach out in the valley, so the young ones wouldn't have to cross troll country to reach Ironforge. I put my hand up. I'm not a great mage, but I'm a patient one." } },
      choices = {
        { text = "Is it hard, teaching refugees?", next = "why_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_hard = {
      big = true,
      lines = { { id = "wh_default", text = "Sometimes. They all want fire, and they all want it now, to burn the troggs out of our home. I teach them the slow way regardless. Some of them tell me I'm wasting time we don't have." } },
      choices = {
        { text = "Teach them properly. Haste gets mages killed.", next = "BACK", reply = "That's what I think! Thank you. I shall be firm about the candle exercise.", fx = { align = { order = 1 } } },
        { text = "They're right. Give them what the fight needs.", next = "BACK", reply = "Oh dear. Perhaps one extra fire lesson a week. Outside.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fav = {
      lines = { { id = "x1_default", text = "Conjuring water! Nobody's impressed by it, and it's the most useful thing a mage ever learns. You can drink it, wash a wound with it and put out a classmate, and I've had cause to do all three in one lesson." } },
      choices = {
        { text = "And bread?", next = "fav_bread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fav_bread = {
      lines = { { id = "x2_default", text = "Oh, the bread's dreadful. It's food, technically. I conjured a loaf for Innkeeper Belm once and he used it to prop the cellar door, and it's still there." } },
      choices = { { text = "A lasting contribution to the inn.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belm = { { id = "tp_belm", text = "Innkeeper Belm is very patient with me. I've replaced two of his curtains, and he only mentions it when I'm in earshot." } },
    gnomeregan = { { id = "tp_gnomer", text = "It's just over the hills to the west. On a still day you can see the vents, and I try not to look." } },
    bink = { { id = "tp_bink", text = "Bink, in Ironforge, taught me my theory at the Academy. I send her my best students and hope they don't mention the fires." } },
    background = { { id = "tp_bg", text = "I was a lamp-enchanter for the tram tunnels. Teaching's a promotion, I think." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know! I could look it up, if I still had my books." } },
  },
}

---------------------------------------------------------------------------
-- Hogral Bakkan: rogue trainer who keeps to the kitchen of the Thunderbrew Distillery.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hogral", id = TODO_NPC("Hogral Bakkan"), name = "Hogral Bakkan", title = "Rogue Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "wry", "watchful" }, values = { "cunning", "loyal" },
  notices = { "class", "greenness" },
  impression = {
    first = "Hogral Bakkan trains rogues from the kitchen of the Thunderbrew Distillery, where Innkeeper Belm pretends not to see him. He peels potatoes while he talks and has counted everyone in the room twice.",
    third = "{name} met Hogral Bakkan, the rogue trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Ye'll be wantin' the bar, friend, it's back the way ye came. Unless ye meant tae find me, in which case shut the door." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye came in by the front this time. I'd hoped I'd taught ye better." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "There ye are. I heard ye on the third stair, so we'll start wi' that." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE", minLevel = 10 },
      text = "Ye've come along. It's time ye went up tae Ironforge an' found Hulfdan Blackbeard in the Forlorn Cavern. Tell him Hogral sent ye, an' be ready for him tae be rude about it." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Ye're green as moss. That's fine. Naebody suspects the green ones, so make use of it while it lasts." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hogral Bakkan. Officially I help in Belm's kitchen. I also teach a certain sort o' recruit a certain sort o' skill, for folk in Ironforge who prefer no' tae be named over a pot o' stew." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it low." },
        { id = "h_again2", text = "Aye. Go on, an' pass me that knife. The wee one." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why the kitchen?", next = "kitchen" },
        { text = "Does Belm really not know?", next = "belm" },
        { text = "What use is a rogue to Dun Morogh?", next = "use" },
        { text = "What's the first lesson for a new rogue?", next = "lesson" },
        { text = "I was never here, Hogral.", next = "END" },
      },
    },
    kitchen = {
      lines = { { id = "ki_default", text = "Two doors, a cellar hatch an' a window over the woodpile. Everybody passes it an' naebody looks in. An' a dwarf wi' a knife in his hand is the most natural sight in the world, in a kitchen." } },
      choices = { { text = "Hidden in plain sight.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Do you actually cook?", next = "BACK", reply = "The stew's mine. Belm takes the credit, an' that suits us both.", fx = { trait = { witty = 1 } } } },
    },
    belm = {
      lines = { { id = "be_default", text = "He kens fine. He's kent since the day I arrived, an' he's never said a word. I keep his cellar free o' thieves an' his stew pot full, an' he keeps no' seein' me. It's the best arrangement I've ever had wi' an honest man." } },
      choices = {
        { text = "Does an honest man mind sheltering a rogue?", next = "belm_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belm_mind = {
      big = true,
      lines = { { id = "bm_default", text = "I asked him that once. He said he'd sooner have the king's knives under his roof than the Dark Irons' at his door. That's a tavern keeper's morals, an' I've never been sure if it's wisdom or just bein' practical." } },
      choices = {
        { text = "It's wisdom. Someone has to do the quiet work.", next = "BACK", reply = "Aye. That's what lets me sleep, when I do.", fx = { align = { honor = -1 } } },
        { text = "It's a compromise. Honest folk shouldn't need knives.", next = "BACK", reply = "They shouldnae. Tell the Dark Irons, an' I'll gladly peel potatoes for a livin'.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      lines = { { id = "us_default", text = "More than ye'd think. Somebody has tae find out where the Frostmane keep their stores, an' count the troggs in the quarry wi'out wakin' them. The mountaineers fight what I find. They'd be fightin' blind otherwise." } },
      choices = {
        { text = "Do the mountaineers know who finds it?", next = "use_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use_know = {
      lines = { { id = "uk_default", text = "Senir Whitebeard does. The rest think he's very lucky wi' his guesses. I prefer it so, for a scout wi' a name gets asked tae dinner, an' I've potatoes tae do." } },
      choices = { { text = "Your secret stays in the kitchen.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "x1_default", text = "Tae walk through this kitchen at supper wi'out touchin' a soul or spillin' a drop. There's three cooks, two pot boys an' a dog. If ye can cross that, ye can cross a guardroom." } },
      choices = {
        { text = "Has anyone managed it first time?", next = "lesson_first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_first = {
      lines = { { id = "x2_default", text = "One. A wee gnome lass, who went under the table an' came out wi' a sausage besides. I sent her tae Hulfdan the same week, an' he's never thanked me, which means he's pleased." } },
      choices = { { text = "The sausage was a nice touch.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hulfdan = { { id = "tp_hulfdan", text = "Hulfdan Blackbeard runs the Circle's rogues in Ironforge. He taught me, an' he was just as rude about it then." } },
    belm = { { id = "tp_belm", text = "Innkeeper Belm. He sees everythin' an' admits tae nothin'. He'd have made a fine rogue, an' I've told him so." } },
    solm = { { id = "tp_solm", text = "Solm Hargrin starts them at Anvilmar. He sends me the ones wi' quick hands an' slow tempers." } },
    background = { { id = "tp_bg", text = "A kitchen hand. Ask anybody." } },
    _none = { { id = "tp_none", text = "Never heard of it. An' if I had, I'd say the same." } },
  },
}

-- ========================================================================
-- Third pass: Dun Morogh (Kharanos, Steelgrill's Depot, Anvilmar, Brewnall, Gol'Bolar Quarry, Amberstill Ranch)
-- ========================================================================

---------------------------------------------------------------------------
-- Kogan Forgestone: a Kharanos regular at the bar of the Thunderbrew Distillery, forever arguing with Belm.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kogan", id = TODO_NPC("Kogan Forgestone"), name = "Kogan Forgestone",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "kharanos" }, temper = { "opinionated", "hearty" }, values = { "community", "honest" },
  notices = { "drunk", "greenness" },
  impression = {
    first = "Kogan Forgestone holds down a stool at the Thunderbrew Distillery in Kharanos and argues with Innkeeper Belm about everything from trolls to the price of ale. He knows the town's business, and offers it freely.",
    third = "{name} met Kogan Forgestone, a regular at the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Pull up a stool, stranger! Belm, a mug for this one. Ye'll settle an argument for us in a minute, so drink first." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are! Belm said ye'd no' be back, an' I said ye would, so that's a round he owes me." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Still up, are ye? So's Belm, an' so am I, an' naebody's won the argument yet." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ha! Ye've a head start on me, an' that's no' easily done. Mind the step by the hearth, it's caught better drinkers than ye." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Up from Coldridge, are ye? I can aye tell. Ye've still got the look o' somebody who thinks troggs are the worst of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kogan Forgestone. I've sat on this stool every evenin' since Belm bought the place, an' I've been right about everythin' the whole time, which he'll no' admit. Ask me aught ye like about Kharanos, for I ken who owes what tae whom." },
      },
      again = {
        { id = "h_again", text = "What else d'ye want tae ken?" },
        { id = "h_again2", text = "Go on, ask, while Belm's in the cellar an' cannae contradict me." },
      },
      choices = {
        { text = "What are you and Belm arguing about?", next = "argue" },
        { text = "Tell me who's who in Kharanos.", next = "who" },
        { text = "How bad are the Frostmane trolls?", next = "trolls" },
        { text = "You know the brewers' feud, I take it.", next = "feud" },
        { text = "What should a newcomer do first here?", next = "first" },
        { text = "Good evening, Kogan.", next = "END" },
      },
    },
    argue = {
      lines = { { id = "argue_default", text = "Tonight? Whether the Senate ought tae clear the Frostmane out o' Shimmer Ridge for good, or leave them be so long as they stay on their side. Belm says leave them. I say a troll who's quiet is a troll who's sharpenin' somethin'." } },
      choices = {
        { text = "Where do you stand, truly?", next = "argue_stand" },
        { text = "And last night's argument?", next = "argue_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue_stand = {
      big = true,
      lines = { { id = "argue_stand_default", text = "Burn the camps an' be done. They were here first, aye, Belm never tires o' sayin' it. But it's our bairns walk the road tae Brewnall, an' I'll no' wait for one tae go missin' tae find out who was right." } },
      choices = {
        { text = "You're right. Strike first, and the road stays safe.", next = "BACK", reply = "There! Belm, did ye hear that? Here's a traveller wi' sense, an' that's another round ye owe me.", fx = { align = { light = -1 } } },
        { text = "Belm's right. You don't burn out a people for what they might do.", next = "BACK", reply = "Och, ye sound just like him. Ye'll both be very sorry an' very noble when they come over the ridge.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue_last = {
      lines = { { id = "argue_last_default", text = "Whether a ram can be taught tae pull a plough. Belm said aye an' I said never, an' we sent tae Amberstill Ranch tae settle it. Veron Amberstill sent back a note that said only \"Dinnae insult my rams.\" We've each claimed that as a win." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "who_default", text = "Senir Whitebeard speaks for the Senate, an' he's worth hearin'. Ragnar Thunderbrew makes the ale, Tognus Flintfire has the forge, an' Kreg Bilmn sells everythin' else. The gnomes in the workshop are buildin' a cure for somethin', an' I've been told no' tae ask." } },
      choices = { { text = "Who should I be careful of?", next = "who_careful" }, { text = "Something else.", next = "BACK" } },
    },
    who_careful = {
      lines = { { id = "who_careful_default", text = "Naebody, in Kharanos. Though if Hogral Bakkan in the kitchen offers tae teach ye tae chop onions, mind that he doesnae mean onions. Belm kens, I ken, the whole town kens, an' we all say \"kitchen hand\" wi' a straight face." } },
      choices = {
        { text = "A town that keeps a secret that badly keeps it well.", next = "BACK", reply = "Ha! That's it exactly. A secret everybody keeps is the safest kind.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "trolls_default", text = "Worse than last year. They've a hold past Iceflow Lake an' camps along Shimmer Ridge, an' they've started raidin' as near as the Grizzled Den road. Grelin Whitebeard counts them in Coldridge an' Senir counts them here, an' the counts go up." } },
      choices = { { text = "Then the mountaineers have work ahead.", next = "BACK" } },
    },
    feud = {
      lines = { { id = "feud_default", text = "Thunderbrew an' Barleybrew, aye. The Barleybrews are over in Brewnall, an' they've been tryin' tae pinch Ragnar's recipes since before I had a beard. I drink Thunderbrew, bein' loyal, an' a wee bit o' Barleybrew stout when Belm's back is turned, bein' honest." } },
      choices = { { text = "I won't tell Belm about the stout.", next = "BACK", fx = { trait = { discreet = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "first_default", text = "Take a bed off Belm, buy a blanket off Kreg, an' go an' see Senir Whitebeard, for he's always got somethin' that needs doin'. An' sit an evenin' here before ye go rushin' off. Ye learn more about a country at its bar than on its roads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belm = { { id = "tp_belm", text = "Belm's the best innkeeper in Dun Morogh an' the worst arguer. He's never charged a wounded mountaineer for a bed, an' he'd no' thank me for tellin' ye." } },
    senir = { { id = "tp_senir", text = "Senir Whitebeard is the Senate's dwarf here. He's dry as an old biscuit, an' he's usually right." } },
    hogral = { { id = "tp_hogral", text = "Hogral Bakkan is the kitchen hand, aye, an' he makes a fine stew, an' that's all anybody in Kharanos will tell ye." } },
    background = { { id = "tp_bg", text = "Born in Kharanos, an' I've never seen cause tae leave it. I do a bit o' this an' that, an' then I come here." } },
    _none = { { id = "tp_none", text = "Now that I dinnae ken, an' it pains me tae say it. Ask Belm, an' then tell me what he said so I can disagree." } },
  },
}

---------------------------------------------------------------------------
-- Golorn Frostbeard: trade goods vendor in Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_golorn", id = TODO_NPC("Golorn Frostbeard"), name = "Golorn Frostbeard", title = "Tradesman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "kharanos" }, temper = { "thrifty", "shrewd" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "Golorn Frostbeard sells trade goods in Kharanos: thread, flux, vials, salt and whatever else a crafter runs short of in the snow. He is thrifty to a fault and can tell a craft by a customer's hands.",
    third = "{name} met Golorn Frostbeard, the tradesman at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Thread, flux, vials an' salt. If ye make things, I've what ye've run out of." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Ye go through flux like a dwarf goes through ale. Good, that's my livin'." },
    { id = "g_craft", when = { profession = "Tailoring" }, text = "A tailor, wi' needle marks on the thumb. Ye'll be wantin' coarse thread, an' I've the last three spools this side o' Ironforge." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands. Tognus Flintfire will have sent ye for flux, for he never keeps enough of his own." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Ye've stains tae the wrist, so it's potions. I've empty vials, an' I count them out, for they break if I pour them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Golorn Frostbeard, tradesman. I dinnae make anythin' myself, an' I sell the wee things that them who do cannae work wi'out. Naebody ever plans tae run out o' thread, an' everybody does, an' it's a long cold walk tae Ironforge." },
      },
      again = {
        { id = "h_again", text = "What else? I'm countin', but I can count an' listen." },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your trade goods.", next = "BUSINESS" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "You count everything twice.", next = "thrift" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What do folk run out of most?", next = "short" },
        { text = "What news comes up with the wagon?", next = "wagon" },
        { text = "Good day, Golorn.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "customers_default", text = "Tognus Flintfire, for flux an' coal, an' Thrawn Boltar sells him the rest. Gremlock Pilsnor in the distillery kitchen, for salt an' spice. An' every recruit who's just learned a trade at Anvilmar an' used up what they were given on the walk here." } },
      choices = { { text = "The trainers send their students to you.", next = "customers_send" }, { text = "Something else.", next = "BACK" } },
    },
    customers_send = {
      lines = { { id = "customers_send_default", text = "Aye, an' I send mine tae them. A lad comes in for a needle an' cannae thread it, I point him tae Ironforge an' Jormund Stonebrow. It costs me nothin', an' he comes back in a year buyin' silk thread instead o' coarse." } },
      choices = { { text = "That's a long way to look ahead.", next = "BACK", reply = "I'm a dwarf an' a tradesman. I've nothin' but time an' stock.", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    thrift = {
      lines = { { id = "thrift_default", text = "I do. My father kept this stall, an' he lost a winter's profit tae a clerk who couldnae add. I count it in, I count it out, an' I count the till at night wi' the door barred. Belm says I'd count the snowflakes if I could charge for them." } },
      choices = { { text = "Would you?", next = "thrift_snow" }, { text = "Something else.", next = "BACK" } },
    },
    thrift_snow = {
      big = true,
      lines = { { id = "thrift_snow_default", text = "Ha! No. But I'll tell ye where it bites. When the pass shuts an' I've the only flux in Kharanos, I could name any price I liked. I've never raised it by a copper, an' I've been called soft in the head for it by other traders." } },
      choices = {
        { text = "You're right to hold your price. Neighbours aren't marks.", next = "BACK", reply = "That's how my father saw it, clerk or nae clerk. A town's a long acquaintance.", fx = { align = { honor = 1 } } },
        { text = "They're right. Scarce goods fetch a scarce price, and that's just trade.", next = "BACK", reply = "So it is, in Booty Bay. Here I've tae drink beside the folk I've fleeced, an' the ale would sour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "stock_default", text = "Up from Ironforge on the supply wagon, twice a month, when the road's open. Burbik Gearspanner at the Great Forge sells me the lot at a trader's rate. He's a gnome wi' a chart for everythin', an' his chart says I'm his fourth best customer." } },
      choices = { { text = "Only fourth?", next = "BACK", reply = "I asked the same. He showed me the chart, an' I couldnae fault it.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    short = {
      lines = { { id = "short_default", text = "Thread, always, an' then vials. Naebody believes how many vials an alchemist breaks. After that it's salt for the skinners, for a hide wi'out salt is a stink by mornin', an' they learn that the once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wagon = {
      lines = { { id = "wagon_default", text = "The price o' copper, mostly, which has climbed every fortnight since the troggs took Gol'Bolar. An' the driver willnae leave Ironforge after noon now, on account o' the wendigo comin' down tae the road by the Grizzled Den at dusk." } },
      choices = {
        { text = "Someone should thin those wendigo.", next = "BACK", reply = "Loslor Rudge at the Depot lost a whole crate tae them. Go an' ask him, he'll talk yer ear off.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    tognus = { { id = "tp_tognus", text = "Tognus Flintfire teaches smithin' at the forge. He's a grand smith an' a hopeless keeper o' stock." } },
    thrawn = { { id = "tp_thrawn", text = "Thrawn Boltar sells the smiths their hammers an' moulds. We agreed long ago who sells what, an' we've kept tae it." } },
    belm = { { id = "tp_belm", text = "Belm keeps the distillery. He thinks I'm tight wi' a copper, an' he's right, an' I drink there anyway." } },
    background = { { id = "tp_bg", text = "Frostbeards have traded in Kharanos three generations. I've the same stall, an' the same scales." } },
    _none = { { id = "tp_none", text = "I dinnae stock that, an' I dinnae ken about it either." } },
  },
}

---------------------------------------------------------------------------
-- Gamili Frosthide: cloth and leather armour in Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gamili", id = TODO_NPC("Gamili Frosthide"), name = "Gamili Frosthide", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "kharanos" }, temper = { "kindly", "fretful" }, values = { "kind", "practical" },
  notices = { "kit", "race" },
  impression = {
    first = "Gamili Frosthide sells cloth and leather armour in Kharanos and frets over every recruit who leaves town underdressed. He lines everything he sells with fleece, whether it was made to be lined or not.",
    third = "{name} met Gamili Frosthide, who sells cloth and leather armour at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Come in out o' the wind! Ye're no' dressed for this country, I can see that from here, an' I can mend it." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye've all yer fingers, so the gloves did their work. I'm glad of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Out at this hour, in that? Ye'll freeze solid. Come an' stand by the brazier while ye look." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That jerkin's split under both arms, an' the wind's goin' straight through ye. I'll no' sleep tonight if ye walk out in it." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ye're from warm woods, I think, by how ye hold yer shoulders. Folk from the forests never believe our cold till it's in their bones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gamili Frosthide. I sell leather an' cloth, an' I line it all wi' Amberstill fleece, for I've seen what Dun Morogh does tae folk who dress for Elwynn. Durnan Furcutter outfits the recruits at Anvilmar, an' I finish the job when they get here." },
      },
      again = {
        { id = "h_again", text = "What else? Are ye warm enough there?" },
        { id = "h_again2", text = "Aye, ask away." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You line everything with fleece?", next = "fleece" },
        { text = "Is the cold truly so dangerous?", next = "cold" },
        { text = "What do the recruits forget?", next = "forget" },
        { text = "Where do you get your hides?", next = "hides" },
        { text = "Who else outfits travellers in Kharanos?", next = "shops" },
        { text = "Stay warm, Gamili.", next = "END" },
      },
    },
    fleece = {
      lines = { { id = "fleece_default", text = "Everythin'. Rudra Amberstill sells me the shearin's, an' I stitch them in myself by the fire at night. A leatherworker in Ironforge told me I was ruinin' the line o' a good jerkin. I asked him when he'd last slept on Shimmer Ridge." } },
      choices = {
        { text = "What did he say?", next = "BACK", reply = "That he never had, an' never meant tae. I said that was the difference between us, an' sold him a pair o' mittens.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "cold_default", text = "It kills more than the trolls do, an' it does it quietly. A body gets tired an' sits down for a rest in the snow, an' that's the end. Maxan Anvol up at the distillery has six cots, an' in a bad week half are frostbite." } },
      choices = { { text = "Have you lost a customer to it?", next = "cold_lost" }, { text = "Something else.", next = "BACK" } },
    },
    cold_lost = {
      big = true,
      lines = { { id = "cold_lost_default", text = "One, three winters back. A human lad, in a hurry for Loch Modan, who wouldnae buy a cloak because he'd nae coin tae spare. I let him go wi'out. They found him by the tunnel road in the thaw." } },
      choices = {
        { text = "You should have given him the cloak. A life is worth a loss.", next = "BACK", reply = "Aye. I've given away eleven since, an' I've never told my wife the number.", fx = { align = { light = 1 } } },
        { text = "He made his choice. You can't clothe every fool who passes.", next = "BACK", reply = "That's what I was told at the time. It didnae help me sleep then, an' it doesnae now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "forget_default", text = "Their feet. They buy a grand thick jerkin an' walk out in the boots they wore in Coldridge, wi' the soles gone thin. Wet feet in this snow, an' ye've a day before ye cannae feel yer toes. I keep wool stockin's by the door on purpose." } },
      choices = { { text = "I'll look to my boots.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "hides_default", text = "Crag boar an' wolf, off the hunters. Grif Wildheart's students bring me their first skins, an' most are cut tae ribbons, an' I buy them anyway an' use the scraps for mitten palms. A young hunter ought tae sell his first hide tae somebody." } },
      choices = { { text = "That's a kindness to them.", next = "hides_kind" }, { text = "Something else.", next = "BACK" } },
    },
    hides_kind = {
      lines = { { id = "hides_kind_default", text = "It's a kindness that pays. The same lad comes back in a year wi' a clean snow leopard pelt an' willnae sell it tae anybody else. Gamili bought his first, an' he remembers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shops = {
      lines = { { id = "shops_default", text = "Boran Ironclink for mail, Grawn Thromwyn for a blade, an' Kreg Bilmn for a blanket an' a waterskin. Between the four of us naebody need leave Kharanos cold or unarmed. Whether they listen is another matter, an' I've given up shoutin' after them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    durnan = { { id = "tp_durnan", text = "Durnan Furcutter has the stall at Anvilmar. He pads every recruit's shoulders, an' I've never had tae redo his work." } },
    rudra = { { id = "tp_rudra", text = "Rudra Amberstill raises the rams, east o' here. Best fleece in Khaz Modan, an' she kens it." } },
    maxan = { { id = "tp_maxan", text = "Maxan Anvol tends the wounded above the bar. He's a hard man tae please, an' he's thawed out more o' my customers than I'd like." } },
    background = { { id = "tp_bg", text = "I've sold coats in Kharanos since I was a lad carryin' them for my mother. She lined everythin' too." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye that, but I can tell ye that ye should be wearin' a scarf." } },
  },
}

---------------------------------------------------------------------------
-- Thrawn Boltar: blacksmithing supplies beside the Kharanos forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thrawn", id = TODO_NPC("Thrawn Boltar"), name = "Thrawn Boltar", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "kharanos" }, temper = { "gruff", "exact" }, values = { "craft", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Thrawn Boltar sells hammers, flux and coal beside the forge in Kharanos and keeps the tools on his wall in strict order of weight. He has firm views on what a village smith needs and no time for showpieces.",
    third = "{name} met Thrawn Boltar, who sells blacksmithing supplies at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Hammers, tongs, flux an' coal. If ye're here tae look at swords, the weaponsmith's that way." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Have ye worn out that hammer already, or only lost it?" },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. Good. Tell me what ye're makin' an' I'll tell ye what ye're missin'." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've a pick on ye an' ore dust in yer beard. Sell the ore tae Tognus, or smelt it yerself an' sell him bars, for he pays better for bars." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear wants a smith, no' a supplier. Tognus is at the anvil, ten steps off, an' he'll no' let ye leave town like that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thrawn Boltar. I supply the forge here: Tognus Flintfire does the teachin' an' the hammerin', an' I see he's somethin' tae hammer wi'. Kharanos has the one smithy, an' it shoes the rams, mends the rifles an' fixes every pot in the valley." },
      },
      again = {
        { id = "h_again", text = "What else? I've coal tae weigh." },
        { id = "h_again2", text = "Aye. Go on." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Your tools hang in a very exact order.", next = "order" },
        { text = "What does a village forge make most?", next = "village" },
        { text = "How is it, working beside Tognus?", next = "tognus" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "Which hammer should a beginner buy?", next = "hammer" },
        { text = "Good day, Thrawn.", next = "END" },
      },
    },
    order = {
      lines = { { id = "order_default", text = "By weight, left tae right, lightest first. A smith in the middle o' a heat cannae stop tae hunt for the right hammer. He reaches, an' it's there. Tognus borrows them an' hangs them back anywhere he pleases, an' I move them when he's no' lookin'." } },
      choices = { { text = "Does he know you move them?", next = "BACK", reply = "He thinks they sort themselves. I've let him think it nine years.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "village_default", text = "Ram shoes, pick heads an' nails. That's the truth o' it. The young ones come wantin' tae forge a great axe, an' Tognus has them make two hundred nails first. A smith who cannae make a nail square has nae business near an edge." } },
      choices = {
        { text = "Two hundred seems harsh.", next = "village_harsh" },
        { text = "That's the right way to learn.", next = "village_harsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_harsh = {
      big = true,
      lines = { { id = "village_harsh_default", text = "It's what the town needs. There's a lad at the forge now who's gifted, truly, an' he wants away tae Ironforge tae learn weapons from the masters. If he goes, Kharanos has naebody tae shoe a ram come spring. Tognus asked me whether he should talk him out o' it." } },
      choices = {
        { text = "Keep him. A smith owes something to the village that raised him.", next = "BACK", reply = "That's my own mind. Gifts are grand, but somebody has tae make the nails.", fx = { align = { order = 1 } } },
        { text = "Let him go. A gift like that shouldn't rust on ram shoes.", next = "BACK", reply = "Hm. Tognus said much the same, an' he's the smith. I only sell the coal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tognus = {
      lines = { { id = "tognus_default", text = "He's the best smith between here an' the Great Forge, an' the worst I've ever met at keepin' his bench. I've found his tongs in the quench trough, his flux in his lunch, an' once his lunch in the forge. I supply him, an' I tidy him." } },
      choices = { { text = "He's lucky to have you.", next = "BACK", reply = "He kens it. He said so once, about four years back.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    coal = {
      lines = { { id = "coal_default", text = "From the seams under Ironforge, by wagon. I'll no' burn the soft stuff they dig near Gol'Bolar, for it smokes an' it's full o' stone. An' wi' the troggs in the quarry now, there's none tae be had from there in any case." } },
      choices = { { text = "The troggs have cost you trade, then.", next = "coal_troggs" }, { text = "Something else.", next = "BACK" } },
    },
    coal_troggs = {
      lines = { { id = "coal_troggs_default", text = "They've cost everybody. Gol'Bolar's stone built half this town, an' the miners came through here tae spend their pay. Now Foreman Stonebrow stands at the lip o' the pit shoutin', an' his crew sit idle. If ye're headed east, he'd be glad o' ye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hammer = {
      lines = { { id = "hammer_default", text = "The two-pound cross-peen, third from the left. Every beginner reaches for the big one on the end, for it looks like a smith's hammer ought tae. They swing it for an hour an' cannae lift their arm for a week. Start light, an' strike true." } },
      choices = { { text = "Third from the left. I'll take your word.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    tognus = { { id = "tp_tognus", text = "Tognus Flintfire. A master at the anvil an' a bairn everywhere else." } },
    golorn = { { id = "tp_golorn", text = "Golorn Frostbeard sells the flux an' the wee things. I sell the tools. We shook on it years back." } },
    grawn = { { id = "tp_grawn", text = "Grawn Thromwyn sells the finished weapons. He's proud o' them, an' they're fair work." } },
    background = { { id = "tp_bg", text = "I was a striker at the Great Forge till my shoulder went. Now I hand the hammers tae them that can still swing." } },
    _none = { { id = "tp_none", text = "I dinnae ken. I ken what things weigh." } },
  },
}

---------------------------------------------------------------------------
-- Peria Lamenur: pet trainer by the inn at Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_peria", id = TODO_NPC("Peria Lamenur"), name = "Peria Lamenur", title = "Pet Trainer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "gentle", "firm" }, values = { "nature", "kind" },
  notices = { "pet", "class" },
  impression = {
    first = "Peria Lamenur trains hunters' beasts beside the inn at Kharanos. She is gentle with animals and firm with their owners, and holds that a badly behaved pet is a badly taught hunter.",
    third = "{name} met Peria Lamenur, the pet trainer at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Hello there. Keep yer hands low an' yer voice soft a moment, for I've a young bear here who's still decidin' about strangers." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Let me see how ye've both been gettin' on." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good. I'll no' ask how well ye shoot. I'll ask when yer beast last ate, an' whether ye ate first." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is watchin' yer face, no' yer hands. That's a beast that trusts ye. Ye've done somethin' right, an' I'd like tae ken what." },
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", maxLevel = 9 },
      text = "Nae companion yet. That's as it should be. Grif Wildheart on the hill will tell ye when ye're ready, an' he'll be right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Peria Lamenur. Grif Wildheart teaches the hunters, up on the hill, an' I teach their beasts, down here where it's warm. Truth be told I teach the hunters as well, for a beast learns nothin' that its keeper doesnae ken how tae ask for." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask?" },
        { id = "h_again2", text = "Go on, softly." },
      },
      choices = {
        { text = "Train my companion.", next = "BUSINESS" },
        { text = "What do hunters get wrong with their beasts?", next = "wrong" },
        { text = "You and Grif seem very different.", next = "grif" },
        { text = "Which Dun Morogh beasts make good companions?", next = "beasts" },
        { text = "That young bear looks nervous.", next = "bear" },
        { text = "What should I feed a beast in this cold?", next = "feed" },
        { text = "Farewell, Peria.", next = "END" },
      },
    },
    wrong = {
      lines = { { id = "wrong_default", text = "They feed them last. A hunter comes in off the snow, sees tae his rifle, his boots an' his own supper, an' then throws the beast what's left. It kens. It'll fight for ye just the same, but it'll no' look at ye, an' ye'll never get its best." } },
      choices = { { text = "What else?", next = "wrong_else" }, { text = "Something else.", next = "BACK" } },
    },
    wrong_else = {
      lines = { { id = "wrong_else_default", text = "Shoutin'. A wolf hears ye whisper at fifty paces. Every command I teach can be given under yer breath, an' the day ye need a beast tae hold still wi' a Frostmane scout ten feet off, ye'll be glad I was stubborn about it." } },
      choices = { { text = "Quiet commands. I'll practise.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    grif = {
      lines = { { id = "grif_default", text = "We are, an' we're no'. He cannae abide people an' I rather like them, but we'd both sooner sit wi' a boar than a senator. He sends me every beast his students tame, an' I've never once had tae undo somethin' he taught." } },
      choices = { { text = "He said he had nothing to say against you.", next = "BACK", reply = "From Grif, that's a love letter. I'll treasure it.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "beasts_default", text = "A crag boar, for a beginner. They're stubborn an' greedy an' loyal as stone, which is tae say they're dwarves wi' tusks. The snow leopard's bonnier, but she'll test ye every day o' her life. The ice claw bear's for somebody wi' patience an' a deep larder." } },
      choices = { { text = "And wolves?", next = "beasts_wolves" }, { text = "Something else.", next = "BACK" } },
    },
    beasts_wolves = {
      lines = { { id = "beasts_wolves_default", text = "A winter wolf will give ye everythin', an' it'll break its heart if ye leave it stabled for a season. Dinnae take a wolf unless ye mean tae keep it at yer side. Shelby Stoneflint at the stable has two that pine, an' it's a hard thing tae watch." } },
      choices = { { text = "I wouldn't leave a wolf behind.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    bear = {
      big = true,
      lines = { { id = "bear_default", text = "He is. A hunter brought him in last week, thin, an' flinchin' at a raised hand. The hunter wants him made fierce by spring. I can do it, an' quickly, the way it was done tae him before. Or I can take the time tae do it right, an' send the hunter away angry." } },
      choices = {
        { text = "Take your time. A beast broken by fear is no companion.", next = "BACK", reply = "That's what I mean tae do. He can be as angry as he likes. The bear's no' his tae ruin twice.", fx = { align = { light = 1 } } },
        { text = "Do as he asks. It's his beast, and his coin.", next = "BACK", reply = "It's his coin, aye. I've never thought a beast was anybody's the way a rifle is.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed = {
      lines = { { id = "feed_default", text = "Fat, an' plenty. Boar belly for a wolf or a cat, an' never straight out o' the snow, for frozen meat chills a beast from the inside. Carry it under yer own coat for an hour first. If ye'll no' do that much for it, ye've nae business keepin' one." } },
      choices = { { text = "I'll carry it warm.", next = "BACK" } },
    },
  },
  topics = {
    grif = { { id = "tp_grif", text = "Grif Wildheart has the hunters, on the hill. He's a good heart wrapped in a very thick hide." } },
    shelby = { { id = "tp_shelby", text = "Shelby Stoneflint keeps the stable. She's kind tae what's left wi' her, an' I look in on them when I can." } },
    belm = { { id = "tp_belm", text = "Belm lets me keep the young ones by his wall, where the chimney warms the stone. He's never asked a copper for it." } },
    background = { { id = "tp_bg", text = "I've raised beasts since I was a bairn. They've always made more sense tae me than the Senate." } },
    _none = { { id = "tp_none", text = "I dinnae ken that. If it had four legs I might." } },
  },
}

---------------------------------------------------------------------------
-- Gimrizz Shadowcog: gnome warlock trainer in the back room of the Thunderbrew Distillery, Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gimrizz", id = TODO_NPC("Gimrizz Shadowcog"), name = "Gimrizz Shadowcog", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos", "gnomeregan" }, temper = { "cold", "exacting" }, values = { "control", "knowledge" },
  notices = { "class" },
  impression = {
    first = "Gimrizz Shadowcog trains warlocks in a back room of the Thunderbrew Distillery, where Kharanos can pretend not to see him. He treats demons as dangerous machinery and has no patience for students who admire them.",
    third = "{name} met Gimrizz Shadowcog, the warlock trainer at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Close the door. The dwarves are tolerant so long as they don't have to look, and I prefer to keep them tolerant." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You're intact, and so, I assume, is your judgment. We shall see." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. Alamar Grimm taught you at Anvilmar, I expect, which means you know the incantations and have been told a great deal about whose fault everything is." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your hands are steady and your eyes are tired. That is the correct arrangement. Reverse them, and I would not teach you." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. You'll want to tell me what I am. Azar Stronghammer does so weekly, on the stair, and I've begun to time him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gimrizz Shadowcog. I teach the binding and use of demons, here, behind the ale casks, by arrangement with an innkeeper who asks no questions. A demon is an engine that wants to kill its operator. I teach people to operate it anyway." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Yes. Continue." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why does Kharanos put up with a warlock?", next = "kharanos" },
        { text = "What's the first rule you teach?", next = "rule" },
        { text = "Why would a gnome take up this craft?", next = "why" },
        { text = "Who shares this back room with you?", next = "dannie" },
        { text = "Do you blame the dwarves for leaving Gnomeregan to its fate?", next = "blame", when = { race = "Gnome" } },
        { text = "I'll leave you to it, Gimrizz.", next = "END" },
      },
    },
    kharanos = {
      lines = { { id = "kharanos_default", text = "Because the Frostmane have shamans and the troggs have numbers, and a village with twelve mountaineers cannot be particular. Belm gave me the room. Senir Whitebeard knows, and has decided that he doesn't. It is a very dwarven sort of arrangement." } },
      choices = { { text = "And the priest upstairs?", next = "kharanos_priest" }, { text = "Something else.", next = "BACK" } },
    },
    kharanos_priest = {
      lines = { { id = "kharanos_priest_default", text = "Maxan Anvol and I have spoken once. He said that my craft imperils my soul, and I said that his cots were full, and that I could empty the ridge of what was filling them. We have not needed to speak since. He takes my students when they are burned." } },
      choices = { { text = "He heals them, all the same.", next = "BACK", reply = "He does, and I've noted it. I don't pretend the man is a hypocrite.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    rule = {
      lines = { { id = "rule_default", text = "That the demon is never on your side. An imp will flatter you, a voidwalker will obey you, and both are measuring the binding the whole time for the place it is weakest. A student who says \"my imp likes me\" is sent home that day." } },
      choices = { { text = "That seems severe.", next = "rule_severe" }, { text = "Something else.", next = "BACK" } },
    },
    rule_severe = {
      big = true,
      lines = { { id = "rule_severe_default", text = "I had a student, a clever one, who grew fond of her imp and loosened its binding by one clause, as a kindness. It burned her workshop and two neighbours' besides. She lived. I have refused to teach her since, though she asks each month." } },
      choices = {
        { text = "You're right to refuse. Some mistakes should close the door for good.", next = "BACK", reply = "That is my position. Control once surrendered is surrendered again.", fx = { align = { order = 1 } } },
        { text = "Teach her again. Nobody learns the rule better than one who broke it.", next = "BACK", reply = "Hm. That is not without logic. Dannie says the same, and I had dismissed it as sentiment.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Gnomeregan fell to troggs and to radiation, and neither was stopped by engineering. I am an engineer. When your tools fail, you find stronger tools, and you read the warnings on them very carefully." } },
      choices = {
        { text = "And when Gnomeregan is retaken?", next = "BACK", reply = "Then I shall put the tools down. I have written the date in my notes, with a blank beside it.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dannie = {
      lines = { { id = "dannie_default", text = "Dannie Fizzwizzle, who trains the demons themselves once they are bound. She talks to them, which I discourage, and they obey her better than they obey me, which I have not been able to explain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blame = {
      lines = { { id = "blame_default", text = "No. Alamar Grimm does, loudly, at Anvilmar, and it wins him nothing but a cold seat by the fire. The dwarves gave us a hall in their capital and asked no rent. I don't mistake a neighbour for an army." } },
      choices = { { text = "A fair way to see it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dannie = { { id = "tp_dannie", text = "Dannie Fizzwizzle is competent and far too cheerful. The demons find her confusing, and I suspect that is her method." } },
    alamar = { { id = "tp_alamar", text = "Alamar Grimm teaches the beginners at Anvilmar. He is skilled and bitter, and his students arrive here needing the second quality removed." } },
    belm = { { id = "tp_belm", text = "The innkeeper sends down a plate at night and has never once come down the stair himself. I consider that an excellent neighbour." } },
    background = { { id = "tp_bg", text = "I was a pressure engineer on the fourth level. I learned there what happens when a containment fails, and I have applied it since." } },
    _none = { { id = "tp_none", text = "I have no information on that, and I don't speculate." } },
  },
}

---------------------------------------------------------------------------
-- Dannie Fizzwizzle: gnome demon trainer with Gimrizz in the back room of the Thunderbrew Distillery.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dannie", id = TODO_NPC("Dannie Fizzwizzle"), name = "Dannie Fizzwizzle", title = "Demon Trainer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos", "gnomeregan" }, temper = { "cheerful", "unflappable" }, values = { "curious", "control" },
  notices = { "class" },
  impression = {
    first = "Dannie Fizzwizzle trains warlocks' demons in the back room of the Thunderbrew Distillery, beside the grim Gimrizz Shadowcog. She is cheerful, entirely unafraid of them, and keeps notes on what each one hates most.",
    third = "{name} met Dannie Fizzwizzle, the demon trainer at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Don't mind the smell, it's only brimstone, and you stop noticing after about a fortnight." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Nothing's followed you in, has it? No, good, though one does have to ask." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock! Lovely. Bring it out, then, and let's see what sort of manners it has." },
  },
  notice = {
    { id = "n_imp", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp is sulking, I can tell from how you keep glancing down. It's been told off recently and it thinks it didn't deserve it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! You're very welcome, truly. Would you mind standing a little to the left? You're making the voidwalker go a funny colour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dannie Fizzwizzle! Gimrizz teaches the warlocks to bind a demon, and I teach the demon what's expected of it afterwards. They don't want to learn, of course, but they do want things, and anything that wants things can be taught." },
      },
      again = {
        { id = "h_again", text = "What else? I've a little time before the next one's due." },
        { id = "h_again2", text = "Yes, go on!" },
      },
      choices = {
        { text = "Train my demon.", next = "BUSINESS" },
        { text = "You don't seem afraid of them.", next = "afraid" },
        { text = "How do you teach something that hates you?", next = "teach" },
        { text = "Gimrizz says you talk to them.", next = "talk" },
        { text = "What do you keep in that notebook?", next = "notes" },
        { text = "Does the brimstone bother the brewers?", next = "brewers" },
        { text = "Which demon should a young warlock master first?", next = "imp" },
        { text = "Goodbye, Dannie.", next = "END" },
      },
    },
    afraid = {
      lines = { { id = "afraid_default", text = "I'm afraid of troggs, and of green fog, and of the sound a lift makes when the cable goes. I've met all three. An imp is a small angry thing on a leash, and compared to the stairs out of Gnomeregan it's very nearly company." } },
      choices = {
        { text = "That's a hard way to lose your fear.", next = "BACK", reply = "It is. I wouldn't recommend it. But I did come out of it very difficult to startle.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "You find out what it wants and what it can't stand. An imp wants to be listened to, so you ignore it until it obeys. A voidwalker wants to be left alone, so you give it a task and then peace. A succubus wants you to argue, so you never do." } },
      choices = { { text = "And a felhunter?", next = "teach_fel" }, { text = "Something else.", next = "BACK" } },
    },
    teach_fel = {
      lines = { { id = "teach_fel_default", text = "Hungry. Always hungry, for magic, the way a dog's hungry for scraps. You feed it on your enemy's spells and never, ever on your own, or it starts looking at you between meals. I have that underlined twice." } },
      choices = { { text = "Never feed it my own magic. Understood.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    talk = {
      big = true,
      lines = { { id = "talk_default", text = "I do, and he hates it. He says a demon is an engine and one doesn't chat with an engine. But they answer, you see. They lie, mostly, but a lie tells you what the liar wants. I've learned more about the Burning Legion from one bored imp than from any book." } },
      choices = {
        { text = "Gimrizz is right. Listen to a demon long enough and it will own you.", next = "BACK", reply = "That's what he says, word for word. I do keep a clock running, and I stop when it rings.", fx = { align = { order = 1 } } },
        { text = "Keep talking. Knowledge is worth the risk, wherever it comes from.", next = "BACK", reply = "I think so too! I go carefully, though, because I'm cheerful and not stupid.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    notes = {
      lines = { { id = "notes_default", text = "What each one hates! This imp can't bear singing. That voidwalker goes sullen if you whistle. I've forty pages. When a warlock comes back saying their demon's turned difficult, I look it up, and nine times in ten the cure is on the list." } },
      choices = {
        { text = "What does the singing do?", next = "BACK", reply = "He puts his claws over his ears and does exactly as he's told. The dwarves next door provide it free, every night.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brewers = {
      lines = { { id = "brewers_default", text = "Ragnar Thunderbrew came down once to say the lager had gone a bit sulphurous. I moved the summoning circle four feet east and it cleared right up. He sends down a jug at Winter Veil now, and we've agreed not to discuss which batch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    imp = {
      lines = { { id = "imp_default", text = "The imp, always, and they arrive here with one already. Alamar Grimm binds the first at Anvilmar and Wren Darkspring teaches it its place. After that comes the voidwalker, which is a great deal quieter, and the warlocks usually look relieved." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gimrizz = { { id = "tp_gimrizz", text = "Gimrizz Shadowcog is the most careful person I've ever met. He's never once smiled at me, and he's never once let a student get hurt." } },
    maxan = { { id = "tp_maxan", text = "The priest upstairs patches up our students when they've been silly. He disapproves very quietly, which I appreciate." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I ran the lifts on the east shaft. I don't like to say more than that." } },
    background = { { id = "tp_bg", text = "I was a lift operator, and then I wasn't. Gimrizz needed somebody who didn't startle, and I needed something to do with that." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea! I could ask the imp, but you wouldn't be able to trust the answer." } },
  },
}

---------------------------------------------------------------------------
-- Tognus Flintfire: blacksmithing trainer at the Kharanos forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tognus", id = TODO_NPC("Tognus Flintfire"), name = "Tognus Flintfire", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "jovial", "scatterbrained" }, values = { "craft", "community" },
  notices = { "kit", "craft" },
  impression = {
    first = "Tognus Flintfire teaches blacksmithing at the forge in Kharanos and shoes the rams, mends the rifles and fixes the pots of the whole valley. He is a master at the anvil and can never find his tongs.",
    third = "{name} met Tognus Flintfire, the blacksmithing trainer at Kharanos in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae the forge! Mind yer feet, there's a pair o' tongs on the floor somewhere, an' they may still be hot." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye havenae seen a wee ball-peen hammer on yer travels, have ye? I had it a minute ago." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith! Grand. Grab that bar an' hold it steady, I've three jobs on an' two hands." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By the forge, look at the state o' that! Ye've been wearin' it broken for days. Stand still, an' let me see what holds an' what doesnae." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ore in yer pack, I can hear it. Copper? I'll teach ye tae smelt it if ye cannae, an' then tae do somethin' useful wi' it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tognus Flintfire, smith o' Kharanos. I teach the craft tae any who'll learn, an' between lessons I do the valley's mendin'. There's a ram wantin' shoes, a mountaineer's rifle wi' a bent lock, an' Belm's best kettle, an' I've forgotten which I promised first." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listenin', I'm only lookin' for my tongs." },
        { id = "h_again2", text = "Aye, ask!" },
      },
      choices = {
        { text = "Train me in blacksmithing.", next = "BUSINESS" },
        { text = "You seem to have lost something.", next = "lost" },
        { text = "What do you teach a beginner first?", next = "nails" },
        { text = "Who do you mend for?", next = "mend" },
        { text = "Thrawn says you've a gifted lad at the forge.", next = "lad" },
        { text = "What should a dwarf know about his own steel?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "What's the hardest thing you've mended?", next = "hard" },
        { text = "Keep your fire hot, Tognus.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "lost_default", text = "I've always lost somethin'. At the anvil my hands ken where everythin' is, an' the moment the piece is done my head goes on tae the next job an' forgets where it left the last. Thrawn Boltar hangs my tools up again in order, an' thinks I havenae noticed." } },
      choices = { { text = "You know he moves them?", next = "BACK", reply = "O' course I ken! I leave them about on purpose now. He enjoys it, an' it saves me the walk.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    nails = {
      lines = { { id = "nails_default", text = "Nails. Two hundred, square in the shank an' true at the point. It teaches the heat, the hammer an' the patience all at once, an' at the end the town has two hundred nails. I've roofed half o' Kharanos wi' my students' first week." } },
      choices = { { text = "And after the nails?", next = "nails_after" }, { text = "Something else.", next = "BACK" } },
    },
    nails_after = {
      lines = { { id = "nails_after_default", text = "A ram shoe, an' then they fit it tae a ram, which is a lesson all its own. Veron Amberstill lends me his worst-tempered beast for the purpose. A lad who's shod that animal an' kept his teeth fears nothin' a forge can show him." } },
      choices = { { text = "I'd sooner face the forge.", next = "BACK", reply = "So would I! That's why the students do it.", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    mend = {
      lines = { { id = "mend_default", text = "Everybody. The mountaineers bring rifles, the Amberstills bring rams, Belm brings kettles an' the gnomes at the workshop bring things I cannae name an' ask me tae make another just like it, but smaller. I've never turned a job away, which is why I'm aye behind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lad = {
      big = true,
      lines = { { id = "lad_default", text = "Aye, I have. He's the best hands I've taught in twenty years. He wants tae go tae the Great Forge an' learn blades under Ironus Coldsteel, an' I've only tae say the word an' he'd stay, for he thinks he owes me. Kharanos needs a smith after me, an' there's nae other." } },
      choices = {
        { text = "Say the word. The village that taught him has a claim on him.", next = "BACK", reply = "Thrawn thinks so, an' he's rarely wrong. I'd be keepin' him wi' a debt he doesnae truly owe, mind.", fx = { align = { order = 1 } } },
        { text = "Let him go. Send him off with your blessing and your best hammer.", next = "BACK", reply = "Aye. I think I kent that already, an' wanted tae hear it said. Now if I could find my best hammer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_default", text = "That it's the stone's gift, an' the stone takes it back if ye're careless. Oil yer blade the night ye use it, an' never sheathe it wet. Our steel's the best in the world, an' I've seen it rust through in a season on the hip o' a dwarf who thought that was enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "hard_default", text = "A mountaineer's rifle that a trogg had taken off him an' used for a club. Barrel bent like a ram's horn. I had it straight in two days, an' it shoots a hair tae the left still. He says he likes it that way, for it's the only rifle in the company wi' a story." } },
      choices = { { text = "A good smith leaves the story in.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrawn = { { id = "tp_thrawn", text = "Thrawn Boltar sells me my supplies an' keeps my bench. I'd have burned the forge down by now wi'out him." } },
    golorn = { { id = "tp_golorn", text = "Golorn Frostbeard has the flux. He counts it out like it was gold dust, an' he's never once shorted me." } },
    veron = { { id = "tp_veron", text = "Veron Amberstill breeds the rams. I shoe every one he sells, an' he inspects every shoe." } },
    background = { { id = "tp_bg", text = "I learned at the Great Forge under old Bengus Deepforge, an' came home tae Kharanos because somebody had tae." } },
    _none = { { id = "tp_none", text = "I couldnae say! Ye havenae seen my tongs, have ye?" } },
  },
}

---------------------------------------------------------------------------
-- Gremlock Pilsnor: cooking trainer in the kitchen of the Thunderbrew Distillery, Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gremlock", id = TODO_NPC("Gremlock Pilsnor"), name = "Gremlock Pilsnor", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "bossy", "generous" }, values = { "hearty", "community" },
  notices = { "hunger", "class" },
  impression = {
    first = "Gremlock Pilsnor rules the kitchen of the Thunderbrew Distillery and teaches cooking to anyone who can stand being shouted at. He feeds the whole of Kharanos and has a kitchen hand he is careful not to ask about.",
    third = "{name} met Gremlock Pilsnor, the cooking trainer at the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "In or out, but shut that door, the draught's flattenin' my bread! Have ye eaten? No, I can see ye havenae, so sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye're thinner. What have ye been eatin' out there, snow?" },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Wash yer hands an' taste this, an' tell me what it's missin'. If ye say salt, I'll ken ye're guessin'." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Ye look like ye've been dragged through the pass backwards. There's stew in the pot. Eat first an' talk after." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If ye've boar ribs on ye, I'll show ye what tae do wi' them besides burnin' them on a stick." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gremlock Pilsnor, an' this is my kitchen, whatever Belm tells ye about ownin' the buildin'. I cook for the inn, for Maxan's wounded upstairs an' for every mountaineer who comes in frozen, an' I teach the craft tae them that'll listen." },
      },
      again = {
        { id = "h_again", text = "What else? Stir that while ye ask." },
        { id = "h_again2", text = "Aye, go on, I can shout an' chop at once." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's the first thing a cook should learn?", next = "first" },
        { text = "What do you cook from, in all this snow?", next = "larder" },
        { text = "Tell me about your kitchen hand.", next = "hogral" },
        { text = "You feed the wounded as well?", next = "wounded" },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "Thank you, Gremlock.", next = "END" },
      },
    },
    first = {
      lines = { { id = "first_default", text = "Tae keep a fire low. Every beginner piles on the wood till it roars, an' then wonders why the outside's black an' the inside's raw. Ye want coals, no' flames. A cook who can hold a pot at a simmer for an hour can cook anythin' in Azeroth." } },
      choices = { { text = "What should I cook first?", next = "first_dish" }, { text = "Something else.", next = "BACK" } },
    },
    first_dish = {
      lines = { { id = "first_dish_default", text = "Spice bread, an' then beer basted boar ribs, which is the dish this valley was built on. Take ribs off a crag boar, baste them in Rhapsody malt out o' Belm's own cask, an' turn them slow. Ragnar Thunderbrew has the recipe from his grandfather, an' he'll part wi' it for a favour." } },
      choices = { { text = "I'll ask Ragnar for the recipe.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    larder = {
      lines = { { id = "larder_default", text = "Boar, boar, an' then more boar. Ram when the Amberstills cull one, an' fish off Iceflow Lake when Paxton Ganter's had a good week. The flour comes up from Ironforge. Everythin' green comes in a jar, for nothin' grows here but pines." } },
      choices = {
        { text = "Don't you tire of boar?", next = "BACK", reply = "I've forty ways tae cook it, an' I'm workin' on the next. A cook who's tired o' boar should leave Dun Morogh.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hogral = {
      big = true,
      lines = { { id = "hogral_default", text = "Hogral Bakkan, aye. He chops very fine an' very fast, an' he's never once cut himself. He came wi' a letter from Ironforge that told me tae give him a corner an' no' tae ask. Young folk come an' talk tae him low, an' leave by the back." } },
      choices = {
        { text = "Ask him plainly. A cook should know who's in his kitchen.", next = "BACK", reply = "I've a right tae, I ken. I've also a suspicion I'd sleep worse for the answer.", fx = { align = { honor = 1 } } },
        { text = "Leave it be. Some arrangements are better not looked at.", next = "BACK", reply = "That's been my way o' it. He makes a fair stew, an' the knives have never been sharper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = { { id = "wounded_default", text = "Aye, broth, mostly. Maxan Anvol mends them an' Thamner Pol binds them, an' neither thinks tae feed them. A dwarf wi' a trogg bite needs marrow broth an' a heel o' bread before he needs another prayer, an' I've told the priest so tae his face." } },
      choices = { { text = "What did the priest say?", next = "wounded_priest" }, { text = "Something else.", next = "BACK" } },
    },
    wounded_priest = {
      lines = { { id = "wounded_priest_default", text = "That the Light sustains. I said the Light could carry the tray up the stair, then, an' save my knees. He carried it himself after that, every evenin', an' he's never mentioned it since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = { { id = "regulars_default", text = "Kogan Forgestone, who eats two suppers an' argues through both. Senir Whitebeard, who lets his plate go cold over his reports. An' the gnomes from the workshop, who forget tae eat at all unless I send a lad over wi' a tray an' orders tae stand there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belm = { { id = "tp_belm", text = "Belm owns the walls an' I own the kitchen. We settled that in my first week, wi' a ladle." } },
    hogral = { { id = "tp_hogral", text = "He's my kitchen hand an' he's good wi' a knife, an' that's all I ken, an' all I mean tae." } },
    ragnar = { { id = "tp_ragnar", text = "Ragnar Thunderbrew makes the ale I cook wi'. He's touchy about his casks, an' I've stopped askin' before I tap one." } },
    background = { { id = "tp_bg", text = "I cooked for a mountaineer company for fifteen years. A hundred dwarves, the one pot, an' nae complaints tae my face." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' I've a pot on. Ask Kogan at the bar, he kens everythin' an' half of it's true." } },
  },
}

---------------------------------------------------------------------------
-- Thamner Pol: physician and first aid trainer downstairs in the Thunderbrew Distillery, Kharanos.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thamner", id = TODO_NPC("Thamner Pol"), name = "Thamner Pol", title = "Physician",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "kharanos" }, temper = { "brisk", "dry" }, values = { "duty", "practical" },
  notices = { "class", "craft" },
  impression = {
    first = "Thamner Pol is the physician at the Thunderbrew Distillery in Kharanos, setting bones and binding wounds for the mountaineers while the priest upstairs prays over them. He is brisk and dry, and trusts clean linen above all things.",
    third = "{name} met Thamner Pol, the physician at the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "If ye're no' bleedin', then ye can wait a moment while I finish this splint, an' I'll be wi' ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' upright, so show me the hands. Aye, they're clean, so ye listened." },
    { id = "g_hurt", when = { durability = { max = 0.3 } }, text = "Sit down. No, dinnae tell me ye're fine, everybody tells me they're fine. Where does it hurt when ye breathe in?" },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Maxan Anvol's upstairs. Between the Light an' a clean bandage we lose very few, an' I'll let ye guess which I think does the more." },
    { id = "n_firstaid", cat = "craft", when = { profession = "First Aid" },
      text = "Ye've bandaged before, for ye've linen in yer belt, folded an' no' stuffed. Somebody taught ye right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thamner Pol, physician. I teach bandagin' an' the settin' o' bones, an' I practise both on whoever the mountaineers carry in. Maxan Anvol has the cots upstairs an' the Light. I've a table, a kettle o' boilin' water an' a great deal o' linen." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I roll these." },
        { id = "h_again2", text = "Aye. Go on." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "What do you treat most?", next = "treat" },
        { text = "You and the priest divide the work?", next = "priest" },
        { text = "What should I carry on the road?", next = "carry" },
        { text = "You boil everything.", next = "boil" },
        { text = "How should I treat frostbite?", next = "frost" },
        { text = "Good day, Physician.", next = "END" },
      },
    },
    treat = {
      lines = { { id = "treat_default", text = "Trogg bites, since Gol'Bolar. They go bad faster than any wound I ken, for the creatures eat carrion an' never clean their teeth. After that it's frostbite, an' Frostmane arrows, which are barbed an' have tae be pushed through." } },
      choices = { { text = "Pushed through?", next = "treat_push" }, { text = "Something else.", next = "BACK" } },
    },
    treat_push = {
      lines = { { id = "treat_push_default", text = "Ye cannae pull a barbed head back the way it came, it takes the meat wi' it. Ye cut the shaft, push the point on through the far side, an' draw it clean. The mountaineers ken it's comin', an' they ask for Belm's strongest first. I allow it." } },
      choices = { { text = "I'd ask for the same.", next = "BACK", reply = "Everybody does. It's the one time Belm doesnae charge.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    priest = {
      big = true,
      lines = { { id = "priest_default", text = "In a manner. He prays, an' the wound closes, an' I'll no' deny I've seen it. But the Light closed a trogg bite last month wi' the filth still inside, an' the lad near lost the arm. I clean first now, before Maxan's allowed near, an' he calls it a want o' faith." } },
      choices = {
        { text = "You're right. Clean the wound first, whatever the priest thinks.", next = "BACK", reply = "Aye. Faith's a fine thing, an' so is hot water, an' I ken which I can see workin'.", fx = { align = { light = -1 } } },
        { text = "Trust the Light. It has healed more than your kettle ever will.", next = "BACK", reply = "It has, I grant ye. I'd only ask it tae wait till I've washed out the dirt.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "carry_default", text = "Linen, more than ye think, rolled tight an' kept dry. A wee flask o' the strongest spirit ye can buy, for the wound an' no' for yerself. An' a clean knife that ye use for nothin' else. That's three things, an' they've saved more lives than any potion." } },
      choices = { { text = "Spirit for the wound. I'll remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    boil = {
      lines = { { id = "boil_default", text = "Aye, an' I'm laughed at for it. I noticed, years back, that the wounds I'd bound wi' fresh-washed linen healed, an' the ones I'd bound in a hurry wi' whatever was tae hand went black. I dinnae ken why. I only ken it's so." } },
      choices = { { text = "Has anyone else taken it up?", next = "boil_else" }, { text = "Something else.", next = "BACK" } },
    },
    boil_else = {
      lines = { { id = "boil_else_default", text = "Nissa Firestone in Ironforge writes tae me about it. She's tried it at the Ironforge Physician an' counts the same as I do. Two physicians is no' a proof, but it's twice what I had." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    frost = {
      lines = { { id = "frost_default", text = "Slowly. Bring them in, wrap the limb in dry wool, an' let it come back at its own pace. Never rub it wi' snow, whatever yer grandfather told ye, an' never hold it tae the fire. Warm it fast an' ye'll lose what the cold had only borrowed." } },
      choices = { { text = "No snow, no fire. Dry wool and time.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    maxan = { { id = "tp_maxan", text = "Maxan Anvol is a hard priest an' a true one. We argue over every patient, an' between us they get better." } },
    belm = { { id = "tp_belm", text = "Belm gives me the table, the kettle an' the fire, an' sits up wi' the bad ones himself. He'd deny all of it." } },
    gremlock = { { id = "tp_gremlock", text = "Gremlock Pilsnor feeds my patients. He shouts at them tae eat, an' they do." } },
    background = { { id = "tp_bg", text = "I was a company surgeon wi' the mountaineers. I've set more bones than I've had hot dinners." } },
    _none = { { id = "tp_none", text = "That's outside my trade. If it's no' broken or bleedin', I've nae opinion." } },
  },
}

---------------------------------------------------------------------------
-- Bronk Guzzlegear: dwarf engineering trainer at Steelgrill's Depot.

---------------------------------------------------------------------------
-- Yarr Hammerstone: mining trainer at Steelgrill's Depot.

---------------------------------------------------------------------------
-- Alamar Grimm: gnome warlock trainer at the back of Anvilmar; novices bring him the Tainted Memorandum.

---------------------------------------------------------------------------
-- Wren Darkspring: gnome demon trainer beside Alamar Grimm at Anvilmar.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_wren", id = TODO_NPC("Wren Darkspring"), name = "Wren Darkspring", title = "Demon Trainer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "coldridge", "gnomeregan" }, temper = { "patient", "quiet" }, values = { "control", "kind" },
  notices = { "class" },
  impression = {
    first = "Wren Darkspring trains novice warlocks' imps at the back of Anvilmar, beside Alamar Grimm. She is quiet and patient with the demons and with Alamar alike, and treats both as things that settle down when they are not provoked.",
    third = "{name} met Wren Darkspring, the demon trainer at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Hello. Come round to this side of the bench, if you would, so you're not standing between the imp and the door." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. It's quieter today, and Alamar has only complained twice." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You've bound your first, I see. Good. Let it look at me, and don't speak for a moment." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp keeps to your left side. It's learned you're right-handed. Change hands now and then, so it can't be sure." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Branstock sends his novices over to look at us, so they'll know what they're praying against. You're welcome to look, so long as you don't bless anything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Wren Darkspring. When a novice binds an imp, Alamar teaches the novice and I teach the imp. It's a small demon and a spiteful one, and it has to learn in its first week that spite gets it nowhere here." },
      },
      again = {
        { id = "h_again", text = "Was there something else?" },
        { id = "h_again2", text = "Yes? Go on, quietly." },
      },
      choices = {
        { text = "Train my demon.", next = "BUSINESS" },
        { text = "How do you teach an imp its place?", next = "teach" },
        { text = "How do you bear working beside Alamar?", next = "alamar" },
        { text = "What do the dwarves make of you?", next = "dwarves" },
        { text = "Why did you take up this work?", next = "why" },
        { text = "What happens when a novice loses control?", next = "lose" },
        { text = "Where do your novices go from here?", next = "onward" },
        { text = "Goodbye, Wren.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "By being duller than it is. An imp wants a reaction. It insults you, it sets fire to your sleeve, it tells you your mother never loved you. If you answer in the same flat voice every time, it runs out of things to try in about four days." } },
      choices = { { text = "And on the fifth day?", next = "teach_fifth" }, { text = "Something else.", next = "BACK" } },
    },
    teach_fifth = {
      lines = { { id = "teach_fifth_default", text = "On the fifth day it does as it's told, and sulks. That's the best you'll get from an imp, and it's enough. Anyone who tells you theirs is loyal has an imp that's being patient." } },
      choices = { { text = "Obedient and sulking. I'll settle for that.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    alamar = {
      lines = { { id = "alamar_default", text = "The same way, really. He says something bitter, and I say good morning. He's a frightened man who got most of his crew out and can only remember the ones he didn't. I'd be sour too." } },
      choices = {
        { text = "You're kinder to him than he deserves.", next = "BACK", reply = "I don't think kindness goes by deserving. Otherwise there'd be very little of it about.", fx = { trait = { kind = 1 } } },
        { text = "Does he know you see that?", next = "BACK", reply = "I hope not, because he'd be mortified.", fx = { trait = { discreet = 1 } } },
      },
    },
    dwarves = {
      lines = { { id = "dwarves_default", text = "They're polite, and they stand a step further back than they would from anyone else. Thran Khorman nods to me. Bromos Grummner doesn't, and I don't blame him, he's a paladin. Durnan Furcutter mended my cloak for nothing and wouldn't hear about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "why_default", text = "I was a nurse on the residential levels. When the fog came there was a locked door and children behind it, and nothing I knew how to do would open it. A warlock opened it. I asked him afterwards to teach me, and I've never asked myself whether I should have." } },
      choices = { { text = "Then you chose well.", next = "BACK", fx = { affinity = 1 } }, { text = "That's a heavy reason to carry.", next = "BACK", reply = "It's lighter than the door was.", fx = { trait = { kind = 1 } } } },
    },
    lose = {
      big = true,
      lines = { { id = "lose_default", text = "It's happened once here. A novice's imp slipped its binding and went for the fire, where the recruits sleep. I had a choice: banish it, which takes a count of ten, or break it, which is instant and hurts the novice badly. I broke it. She couldn't cast for a month." } },
      choices = {
        { text = "You chose rightly. One novice's pain against a hall of sleepers is no choice.", next = "BACK", reply = "That's what I tell myself. She's forgiven me, which I find harder than if she hadn't.", fx = { align = { light = 1 } } },
        { text = "Ten seconds wasn't long. You should have spared your student.", next = "BACK", reply = "I've counted to ten many times since, to see how long it is. I still don't know.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    onward = {
      lines = { { id = "onward_default", text = "To Kharanos, when they've outgrown the valley. Gimrizz Shadowcog teaches there, and Dannie Fizzwizzle takes their demons on from me. Dannie writes to ask what each imp hates, for her notebook, and I write back. It's the only post I get." } },
      choices = {
        { text = "That sounds like a friendship.", next = "BACK", reply = "I suppose it is, though we've never met. I'd like to, one day, when the pass is quiet.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    alamar = { { id = "tp_alamar", text = "Alamar Grimm is a very good teacher who believes he's a bad man. I think he's wrong about the second." } },
    branstock = { { id = "tp_branstock", text = "Branstock Khalder brings us tea in the evenings and leaves it on the bench without a word. Alamar drinks it and says it's stewed." } },
    imps = { { id = "tp_imps", text = "Never laugh at one. They can bear being hated, and they can't bear being found funny." } },
    background = { { id = "tp_bg", text = "I nursed children in Gnomeregan. The work isn't as different as you'd think." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I keep to this corner, mostly." } },
  },
}

---------------------------------------------------------------------------
-- Marryk Nurribit: gnome mage trainer at Anvilmar, fond of his ale; novices bring him the Glyphic Memorandum.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_marryk", id = TODO_NPC("Marryk Nurribit"), name = "Marryk Nurribit", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "coldridge", "gnomeregan" }, temper = { "genial", "thirsty" }, values = { "joy", "knowledge" },
  notices = { "class", "drunk" },
  impression = {
    first = "Marryk Nurribit trains novice mages at Anvilmar, in between mugs. He is genial, short of coin for ale more often than not, and steadier with a frostbolt than anyone that thirsty has a right to be.",
    third = "{name} met Marryk Nurribit, the mage trainer at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Hello, hello! You wouldn't happen to have a few coppers about you? No, no, forget I asked. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my friend returns! And the barrel's still half full, so it's a good day all round." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, you'll be the one with the memorandum! Sit down, sit down, and we'll begin with frost, since there's so much of it lying about going to waste." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Your fingertips are a little blue, which is frost magic done properly, or frostbite. Either way you're in the right valley." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Oh, well done! You've found the good barrel. I'd lecture you on casting in that state, but I'd be a dreadful hypocrite." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marryk Nurribit, at your service, mostly. I teach the young mages of Coldridge their first spells, and in the gaps I conduct a long study of dwarven ale, which is the only thing about this valley I'd call warm." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Talking's thirsty work, mind." },
        { id = "h_again2", text = "Yes? Ask away, I'm perfectly steady." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "You seem very fond of the ale.", next = "ale" },
        { text = "What does a novice mage learn first?", next = "first" },
        { text = "Tell me about Gnomeregan.", next = "gnomeregan" },
        { text = "Can you truly cast after that many mugs?", next = "cast" },
        { text = "Who else shares the back of the hall?", next = "others" },
        { text = "Farewell, Marryk.", next = "END" },
      },
    },
    ale = {
      lines = { { id = "ale_default", text = "I am, I am. A gnome mage thinks very fast, you see, a great many thoughts at once, and since we left home most of mine are ones I'd sooner not have. Two mugs slows them to a walk. It's medicinal, when you look at it properly." } },
      choices = {
        { text = "That sounds like grief, not thirst.", next = "ale_grief" },
        { text = "And who pays for the medicine?", next = "ale_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_grief = {
      big = true,
      lines = { { id = "ale_grief_default", text = "Hm, well, yes. I lost a workshop, a library and a brother, and I've found that I can teach perfectly well so long as I don't think about any of the three. The priest says I ought to face it sober. The barrel has never said anything of the kind." } },
      choices = {
        { text = "The priest is right. The ale only puts off the day of reckoning.", next = "BACK", reply = "He is, I expect. He usually is, under the jokes. Perhaps tomorrow. I've said that before, of course.", fx = { align = { light = 1 } } },
        { text = "Drink, if it lets you work. You owe no one your sorrow.", next = "BACK", reply = "That's the kindest bad advice I've had all week. I'll take it, naturally.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_pay = {
      lines = { { id = "ale_pay_default", text = "My students, I'm ashamed to say. I ask for a copper here and a copper there. I do pay it back, in lessons: I've taught three of them to chill a mug without being asked, which no other trainer in Khaz Modan offers." } },
      choices = { { text = "A chilled mug is a fair trade.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "first_default", text = "Frost, in this valley, because the air does half the work for you. Then a little fire, carefully, indoors, with Thran Khorman's bucket standing by. He keeps it there for me, and has only had to use it twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomeregan = {
      lines = { { id = "gnomeregan_default", text = "Don't go. That's my whole lecture, and I give it to every student. It isn't empty, whatever they tell you. What's down there is sick and clever, and the green in the air gets into you. I've seen brave people walk in to fetch one more crate." } },
      choices = { { text = "Did they come out?", next = "BACK", reply = "Some did, and they weren't well afterwards. Please, just don't go.", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cast = {
      lines = { { id = "cast_default", text = "Watch that icicle over the door. There. Clean through the middle, and I'm on my third. The hands remember. It's the counting I lose, and you don't need to count to throw frost at a trogg." } },
      choices = { { text = "I'm impressed, and a little worried.", next = "BACK", reply = "That's exactly how the dwarves put it!", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "others_default", text = "Alamar Grimm and Wren Darkspring, with the warlocks. Alamar's sour as old milk and Wren's a saint. I offered Alamar a drink once, to cheer him up, and he said he preferred to be miserable accurately." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    alamar = { { id = "tp_alamar", text = "Alamar Grimm blames everyone for Gnomeregan. I only blame the troggs, and it leaves me a great deal more time for drinking." } },
    branstock = { { id = "tp_branstock", text = "Branstock Khalder, the priest. Tells the worst jokes in Dun Morogh, and he's stood me more than one round and called it charity." } },
    magis = { { id = "tp_magis", text = "Magis Sparkmantle teaches in Kharanos. I send my students on to him when they can hit the icicle." } },
    background = { { id = "tp_bg", text = "I kept a small workshop on the third level, with a very good library. I try not to think where the books are now." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid. Ask me after another mug, I may have a theory." } },
  },
}

---------------------------------------------------------------------------
-- Grundel Harkin: armorer at Anvilmar, Coldridge Valley.

---------------------------------------------------------------------------
-- Rybrad Coldbank: weaponsmith at Anvilmar, Coldridge Valley.

---------------------------------------------------------------------------
-- Adlin Pridedrift: general supplies at Anvilmar; Nori Pridedrift's brother.

---------------------------------------------------------------------------
-- Burdrak Harglhelm: leather armour at Brewnall Village.

---------------------------------------------------------------------------
-- Keeg Gibn: ale and wine at Brewnall Village; sells for the Barleybrews.

---------------------------------------------------------------------------
-- Gretta Ganter: fishing supplies at the Ganters' camp on Iceflow Lake.

---------------------------------------------------------------------------
-- Paxton Ganter: fishing trainer on Iceflow Lake.

---------------------------------------------------------------------------
-- Kazan Mogosh: food and drink for the idle crews at Gol'Bolar Quarry.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kazan", id = TODO_NPC("Kazan Mogosh"), name = "Kazan Mogosh", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "stubborn", "hospitable" }, values = { "hearty", "loyal" },
  notices = { "hunger", "purse" },
  impression = {
    first = "Kazan Mogosh sells food and drink at the camp above Gol'Bolar Quarry, to miners who have had no pit to work since the troggs came. He is stubborn and hospitable, and has been carrying half the crew on credit.",
    third = "{name} met Kazan Mogosh, who sells food and drink at Gol'Bolar Quarry in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Gol'Bolar, what's left of it. I've bread, cheese an' ale, an' ye can eat it lookin' at a hole full o' troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Have ye been down in the pit? Ye've the dust on ye. Sit, an' have somethin'." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner! Ye'll find nae work here, friend, no' till the hole's cleared. But ye'll find ale, an' company that kens yer trade." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Ye've been fightin', an' on an empty belly by the look o' ye. Sit. Ye can pay me after ye've eaten." },
    { id = "n_purse", cat = "purse", when = { money = { max = 100 } },
      text = "Ye've nae coin. Neither has anybody else here. I'll put it on the slate wi' the rest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kazan Mogosh. I've fed the Gol'Bolar crews for nine years, an' I'm still feedin' them, though there's been nae stone cut since the troggs came up through the floor. Foreman Stonebrow shouts at the pit, the lads sit about, an' I keep the pot goin'." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Aye, ask. I've nae rush on." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "How did the troggs take the quarry?", next = "troggs" },
        { text = "How are the crews bearing it?", next = "crews" },
        { text = "You're feeding them on credit.", next = "credit" },
        { text = "Who else is still up here?", next = "camp" },
        { text = "Where do your supplies come from now?", next = "supply" },
        { text = "Good day, Kazan.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "The lads broke through intae a cavern on the lowest bench, an' it was full o' them. Rockjaws. They came up like water. We got everybody out, an' we left every tool we owned. That was months back, an' they've dug in deeper every week since." } },
      choices = { { text = "Has no one tried to clear it?", next = "troggs_clear" }, { text = "Something else.", next = "BACK" } },
    },
    troggs_clear = {
      lines = { { id = "troggs_clear_default", text = "Senator Mehr Stonehallow's here wi' a hammer, an' he's asked every able body that passes tae go down an' thin them. The Foreman would go himself, but his aim's gone. If ye've a weapon an' a free afternoon, either o' them will thank ye." } },
      choices = { { text = "I'll speak with them.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    crews = {
      lines = { { id = "crews_default", text = "Badly. A quarryman wi' nae quarry is a sorry thing. They play dice, they sharpen picks they've nae use for, an' they stand at the edge an' name the troggs they mean tae kill. Dank Drizzlecut keeps teachin' the young ones, just tae give them somethin' tae do wi' their hands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    credit = {
      big = true,
      lines = { { id = "credit_default", text = "Aye. The Miners' League stopped their pay when the stone stopped. They've wives an' bairns in Kharanos. I've a slate as long as my arm, an' my own supplier in Ironforge wants his coin. Another month an' I'll have tae choose who I stop feedin', or shut." } },
      choices = {
        { text = "Keep feeding them. A camp that starves won't be here to retake the quarry.", next = "BACK", reply = "That's how I see it. They're my crew. I'll sell the cart before I close the pot.", fx = { align = { light = 1 } } },
        { text = "Stop the credit. You can't feed them if you're ruined too.", next = "BACK", reply = "It's plain sense, an' I hate it. My wife says the same, in fewer words.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_default", text = "The Foreman, the Senator, an' Dank, who'll no' leave. Cook Ghilm, who does the hot meals an' teaches cookin' tae them that are bored enough tae learn. An' young Frast Dokner, the weaponsmith's apprentice, who's sold more axes this season than in his whole life before." } },
      choices = { { text = "The troggs have been good for one trade, then.", next = "camp_frast" }, { text = "Something else.", next = "BACK" } },
    },
    camp_frast = {
      lines = { { id = "camp_frast_default", text = "He says so himself, an' he's ashamed tae. He's a good lad. He sells tae the crews at cost, an' he thinks I dinnae ken." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supply = {
      lines = { { id = "supply_default", text = "Kharanos, by cart, same as ever. Kreg Bilmn sells me the dry goods, an' he's let my account run longer than he should. The ale's Thunderbrew, for the Barleybrews are too far west. The driver comes armed these days, an' he doesnae linger." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stonebrow = { { id = "tp_stonebrow", text = "Foreman Stonebrow. He's been shoutin' intae that pit for months. I bring him his supper at the edge, for he'll no' come away." } },
    ghilm = { { id = "tp_ghilm", text = "Cook Ghilm does the hot food, an' I do the cold an' the ale. We split the crew's bellies between us." } },
    dank = { { id = "tp_dank", text = "Dank Drizzlecut taught half these lads tae swing a pick. He's old as the quarry an' twice as hard." } },
    background = { { id = "tp_bg", text = "I drove the supply cart tae Gol'Bolar till they asked me tae stay an' run the stores. I'd no' regretted it till lately." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. We dinnae get much news at the edge o' a hole." } },
  },
}

---------------------------------------------------------------------------
-- Cook Ghilm: camp cook and cooking trainer at Gol'Bolar Quarry.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_ghilm", id = TODO_NPC("Cook Ghilm"), name = "Cook Ghilm", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "cheerful", "resourceful" }, values = { "hearty", "practical" },
  notices = { "class", "hunger" },
  impression = {
    first = "Cook Ghilm keeps the camp kettle at Gol'Bolar Quarry and teaches cooking to idle miners. He is cheerful and resourceful, and will make a dinner out of anything that holds still, with one firm exception.",
    third = "{name} met Cook Ghilm, the cooking trainer at Gol'Bolar Quarry in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Come an' get it while it's hot! Oh, ye're no' one o' the crew. Never mind, there's enough. There's always enough if ye add water." },
    { id = "g_back", when = { metBefore = true }, text = "Back for seconds! That's the finest thing anybody can say tae a cook." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Taste this an' tell me true. I've been makin' boar stew wi'out onions for a month, an' I've lost the knack o' judgin' it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye wouldnae have a haunch o' anythin' on ye? I'll trade ye a hot bowl for it, an' gladly." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Ye've the look o' somebody who's fought on a dry biscuit. Here's a bowl, so sit an' eat it, an' then we'll talk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Cook Ghilm, they call me, an' I've stopped answerin' tae anythin' else. I cook for the Gol'Bolar crews, an' since they've nae stone tae cut, I've started teachin' them tae cook as well. It keeps their hands busy an' their minds off troggs." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the kettle, it spits." },
        { id = "h_again2", text = "Aye, ask away!" },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What do you cook from, up here?", next = "larder" },
        { text = "Miners make good cooks?", next = "miners" },
        { text = "What's the one thing you won't cook?", next = "wont" },
        { text = "How do you make a meal from nothing?", next = "nothing" },
        { text = "What's the crew's favourite dish?", next = "favourite" },
        { text = "Thank you, Ghilm.", next = "END" },
      },
    },
    larder = {
      lines = { { id = "larder_default", text = "Boar, from the hills round the quarry, an' whatever Kazan Mogosh can get up from Kharanos. Flour when the wagon comes. I'd a fine store o' dried mushrooms, but that was in the lower shed, an' the troggs have it now, an' I hope it disagrees wi' them." } },
      choices = { { text = "Could someone fetch it back?", next = "larder_fetch" }, { text = "Something else.", next = "BACK" } },
    },
    larder_fetch = {
      lines = { { id = "larder_fetch_default", text = "Ye'd have tae go through forty troggs for a sack o' mushrooms. I'm a cook, an' even I wouldnae ask it. But if ye're goin' down for the Senator anyway, it's the shed wi' the green door. I'll say nae more." } },
      choices = { { text = "If I pass a green door, I'll look.", next = "BACK", reply = "Ye're a prince among customers.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    miners = {
      lines = { { id = "miners_default", text = "The best! A quarryman kens how tae be patient wi' somethin' hard an' how tae hit it at the right moment, an' that's cookin'. There's a lad on the second crew who makes a crust ye could roof a house wi'. I've told him it's meant as praise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wont = {
      big = true,
      lines = { { id = "wont_default", text = "Trogg. I've been asked. When the stores ran thin last month, a few o' the lads said meat was meat, an' there's a deal o' it walkin' about down there. I said I'd throw the kettle in the pit first. They go on two legs, an' they've a kind o' speech." } },
      choices = {
        { text = "You're right. There are things you don't eat, however hungry you get.", next = "BACK", reply = "Aye. We're dwarves, no' ghouls. I'd sooner serve boiled boot, an' I ken a recipe.", fx = { align = { light = 1 } } },
        { text = "They're beasts. A starving camp shouldn't be so particular.", next = "BACK", reply = "That's what the lads said. An' I said find another cook, an' naebody did, so here we are eatin' boar.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nothing = {
      lines = { { id = "nothing_default", text = "Bones, first. Never throw out a bone. Boil them a day an' ye've a broth that'll carry anythin'. Then a handful o' whatever's left: a heel o' bread, an old cheese rind, the end o' a sausage. The broth forgives it all." } },
      choices = { { text = "What's the worst thing you've had to use?", next = "nothing_worst" }, { text = "Something else.", next = "BACK" } },
    },
    nothing_worst = {
      lines = { { id = "nothing_worst_default", text = "A leather apron, in the blizzard o' two winters back. Clean, mind, an' boiled eight hours wi' a pine bough. I'll no' say it was good. I'll say fourteen dwarves ate it an' asked nae questions, an' that's the highest honour a cook can get." } },
      choices = { { text = "I hope never to need that recipe.", next = "BACK", reply = "So do I! But ye'll remember it if ye do.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    favourite = {
      lines = { { id = "favourite_default", text = "Beer basted boar ribs, the way Gremlock Pilsnor makes them in Kharanos. I've nae good ale tae spare for bastin', so I use the flat dregs out o' Kazan's casks. The lads say it's better that way, an' I've never told them why." } },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { trait = { discreet = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    kazan = { { id = "tp_kazan", text = "Kazan Mogosh has the stores. He's feedin' half the crew on a slate he'll never see paid, an' he kens it." } },
    stonebrow = { { id = "tp_stonebrow", text = "The Foreman eats standin' at the edge o' the pit. I send it out covered, or it'd be cold before he's finished shoutin'." } },
    gremlock = { { id = "tp_gremlock", text = "Gremlock Pilsnor at Kharanos taught me my trade, at the top o' his voice. I still hear him when I burn somethin'." } },
    background = { { id = "tp_bg", text = "I was a quarryman till a block took two toes. They gave me the kettle, an' I found I liked it better." } },
    _none = { { id = "tp_none", text = "I dinnae ken! If ye can eat it, ask me again." } },
  },
}

---------------------------------------------------------------------------
-- Dank Drizzlecut: old mining trainer who will not leave Gol'Bolar Quarry.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dank", id = TODO_NPC("Dank Drizzlecut"), name = "Dank Drizzlecut", title = "Mining Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "crusty", "stubborn" }, values = { "craft", "tradition" },
  notices = { "craft", "greenness" },
  impression = {
    first = "Dank Drizzlecut has taught mining at Gol'Bolar Quarry longer than most of its crew have been alive, and has not left the edge since the troggs took the pit. He is crusty, stubborn and certain everyone swings a pick wrong.",
    third = "{name} met Dank Drizzlecut, the mining trainer at Gol'Bolar Quarry in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Hmph. Another one come tae gawp at the hole. Unless ye've a pick, in which case show me how ye hold it, so I can tell ye it's wrong." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Still swingin' from the elbow, I'll wager. Shoulder! How often must I say it?" },
    { id = "g_miner", when = { profession = "Mining" }, text = "So ye call yerself a miner, do ye? Dinnae tell me who taught ye, for I'll ken by the swing." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith. Ye lot think ore grows in bars. Come an' learn what it costs tae get it out." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're a bairn, an' that's all right, for I've taught bairns. I taught the Foreman, an' look at him now, shoutin' at troggs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dank Drizzlecut. I've taught the pick at Gol'Bolar for sixty years. I cut the first bench o' this quarry wi' my own hands, an' I'll no' be shifted off it by a pack o' rock-eatin' vermin. I teach at the edge now. It's a longer walk tae the stone." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up." },
        { id = "h_again2", text = "Aye. Go on, an' stand up straight." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Sixty years at one quarry?", next = "sixty" },
        { text = "Everyone swings a pick wrong, you say.", next = "swing" },
        { text = "Why won't you leave?", next = "leave" },
        { text = "What's so fine about Gol'Bolar stone?", next = "stone" },
        { text = "Yarr Hammerstone sends his regards.", next = "yarr" },
        { text = "What should a young miner learn first?", next = "first" },
        { text = "Good day, Dank.", next = "END" },
      },
    },
    sixty = {
      lines = { { id = "sixty_default", text = "Sixty-one, come spring. This was a bare hillside when I came. We found the grey granite under six feet o' frozen clay, an' I struck the first wedge. There's a mark on the top bench, by the old hoist, where my pick went in." } },
      choices = { { text = "Is the mark still there?", next = "sixty_mark" }, { text = "Something else.", next = "BACK" } },
    },
    sixty_mark = {
      lines = { { id = "sixty_mark_default", text = "It was, the day we ran. I look for it every mornin' from up here. There's a trogg sleeps on it now, a big one wi' a split ear. I've his face by heart. When the pit's cleared, I'd take it kindly if that one was left tae me." } },
      choices = { { text = "I'll leave the split ear for you.", next = "BACK", reply = "Hmph. Good, an' see that ye do.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    swing = {
      lines = { { id = "swing_default", text = "They do. From the elbow, every one, flailin' like a bairn wi' a rattle. The swing comes from the hip an' goes out through the shoulder, an' the arm only steers. Do it right an' ye can cut stone at eighty. I'm proof." } },
      choices = {
        { text = "Show me the right way.", next = "BACK", reply = "There, from the hip an' out through the shoulder, an' let it fall. It's wrong, but it's no' bad.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      big = true,
      lines = { { id = "leave_default", text = "Because a dwarf doesnae give ground tae troggs. The Senator says the camp's too near the edge an' wants us pulled back tae Kharanos till soldiers come. The Foreman says stay. If we go, the League writes the quarry off, an' it's theirs for good." } },
      choices = {
        { text = "Stay. Ground you abandon is ground you've given away.", next = "BACK", reply = "Aye! That's a dwarf's answer. Ye'd have made a quarryman.", fx = { align = { order = -1 } } },
        { text = "Go. The Senator speaks for Ironforge, and old bones can't hold a pit.", next = "BACK", reply = "Old bones cut this pit, ye pup. But aye, he's the Senate's voice. I'd go if I was ordered, an' I'd hate every step.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = { { id = "stone_default", text = "It's tight in the grain an' it splits true. Ye set yer wedges in a line, tap them in turn, an' it opens like a book. The King's own stair is Gol'Bolar granite. The stuff from Loch Modan is fit for garden walls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yarr = {
      lines = { { id = "yarr_default", text = "Hammerstone! He's a hill miner, who scratches about on slopes for green rocks an' calls it minin'. He was a fair student, mind, an' he swung from the elbow till I broke him o' it. Ye can tell him I said he's still doin' it." } },
      choices = { { text = "He said you'd say that.", next = "BACK", reply = "Did he, now? Hmph, then he's learned somethin' after all.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "first_default", text = "Tae listen. Tap the face wi' the butt o' yer pick before ye swing. Sound rock rings. A hollow knock means there's nothin' behind it but air, or worse. The lads on the low bench didnae tap, the day they broke through. I wasnae down there tae tell them." } },
      choices = { { text = "You couldn't have known.", next = "BACK", reply = "I'd have kent. That's what sixty years is for. I was up top arguin' about wedges.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stonebrow = { { id = "tp_stonebrow", text = "The Foreman was my apprentice, a good lad an' a bad shot. He's the heart tae stay, an' that's what counts." } },
    mehr = { { id = "tp_mehr", text = "Senator Stonehallow. He came out here wi' a hammer an' used it, which is more than I expected from a senator. I still think he's wrong about pullin' back." } },
    yarr = { { id = "tp_yarr", text = "Yarr Hammerstone, at the Depot. I taught him, though he'll tell ye otherwise." } },
    background = { { id = "tp_bg", text = "I've cut stone at Gol'Bolar since before the Foreman was born. I mean tae be buried in it." } },
    _none = { { id = "tp_none", text = "I dinnae ken an' I dinnae care, unless it's stone, an' it isnae, so ask somebody else." } },
  },
}

---------------------------------------------------------------------------
-- Frast Dokner: apprentice weaponsmith selling to the crews at Gol'Bolar Quarry.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_frast", id = TODO_NPC("Frast Dokner"), name = "Frast Dokner", title = "Apprentice Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "earnest", "uneasy" }, values = { "craft", "honest" },
  notices = { "weapon", "class" },
  impression = {
    first = "Frast Dokner is an apprentice weaponsmith at Gol'Bolar Quarry who has sold more axes since the troggs came than in all his years before. He is earnest and uneasy about it, and sells to the crews at cost.",
    third = "{name} met Frast Dokner, the apprentice weaponsmith at Gol'Bolar Quarry in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Good day! Are ye goin' down intae the pit? Then ye'll want somethin' heavy. I've axes, mostly, for axes are what folk here want." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Did it hold? Let me see the edge. Oh, that's a relief, I worried about that one." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Ye're a smith, a proper one? Would ye look at this weld an' tell me honestly? My master's in Ironforge, an' I've naebody tae ask." },
  },
  notice = {
    { id = "n_kit", cat = "weapon", when = { durability = { max = 0.3 } },
      text = "That's near done for. I can see the crack from here, runnin' up from the guard. Please dinnae take it down the pit like that." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Ye'll ken more about usin' these than I do about makin' them. Tell me if the balance is off, I'd be glad tae hear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Frast Dokner, apprentice weaponsmith. I came out tae Gol'Bolar tae sharpen picks an' mend drill steel, an' then the troggs came, an' now every dwarf in camp wants an axe. I'm only an apprentice. I do my best, an' I check every piece twice." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, ask, please." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Business must be good.", next = "business" },
        { text = "What works best on troggs?", next = "troggs" },
        { text = "An apprentice, alone out here?", next = "alone" },
        { text = "What did you do before the troggs came?", next = "before" },
        { text = "How do you forge without a proper smithy?", next = "forge" },
        { text = "Good luck, Frast.", next = "END" },
      },
    },
    business = {
      lines = { { id = "business_default", text = "It is, an' I wish it wasnae. I've sold forty axes since the pit was lost. Every one's gone tae a quarryman who's never fought, an' some have come back up wi' naebody holdin' them. I sell tae the crews for what the iron cost me." } },
      choices = {
        { text = "That's decent of you.", next = "business_cost" },
        { text = "You could be making a fortune.", next = "business_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business_cost = {
      big = true,
      lines = { { id = "business_cost_default", text = "Kazan thinks I dinnae ken that he kens. My master wrote that I'm a fool, an' that a smith who doesnae charge for his labour will no' be a smith long. He says charge full, an' put the profit by tae open my own forge." } },
      choices = {
        { text = "Keep selling at cost. You don't grow rich off neighbours fighting for their home.", next = "BACK", reply = "That's how it feels tae me. I couldnae look the Foreman in the eye otherwise.", fx = { align = { honor = 1 } } },
        { text = "Your master's right. Charge full price, your labour has worth.", next = "BACK", reply = "It has, I suppose. He's been a smith forty years, an' he's never been hungry. I'll think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "Somethin' heavy that crushes. Their hide's like wet stone, an' an edge skids off unless ye hit square. A mace or the back o' an axe does more than the blade. Senator Stonehallow uses a hammer, an' he's the only one comes back up wi'out a scratch." } },
      choices = { { text = "A hammer, then.", next = "BACK", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "alone_default", text = "Aye. My master sent me out for a season tae learn plain work. He said I'd be bored, an' that boredom's good for a young smith. I've no' been bored. I write tae him every week wi' my questions, an' the answers come a fortnight late." } },
      choices = { { text = "What do you ask him?", next = "alone_ask" }, { text = "Something else.", next = "BACK" } },
    },
    alone_ask = {
      lines = { { id = "alone_ask_default", text = "Whether I'm temperin' too hard, mostly. A hard edge chips on trogg hide, an' a soft one rolls. I've been drawin' them back tae a blue, softer than he taught me, an' they're holdin'. I've no' told him. I think I've found somethin', an' I'm feared tae be wrong." } },
      choices = { { text = "Tell him. A good master wants to hear it.", next = "BACK", reply = "Aye, I will, in the next letter, or maybe the one after.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "before_default", text = "Picks, wedges an' drill steel, a hundred a week. Dank Drizzlecut inspected every one an' sent back half. I thought he hated me. Cook Ghilm says he sends back half o' everybody's, an' two thirds if he likes ye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "forge_default", text = "Wi' a field forge an' a bellows I stitched from boar hide. The coal comes from Thrawn Boltar at Kharanos, an' it's good. I cannae get the heat for a long blade out here, which is one more reason everybody gets an axe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dank = { { id = "tp_dank", text = "Dank Drizzlecut. He's told me my picks are rubbish every day for a year, an' he'll use nae other." } },
    kazan = { { id = "tp_kazan", text = "Kazan Mogosh feeds us all. He lets on he doesnae ken I sell at cost, an' I let on I dinnae ken about his slate." } },
    mehr = { { id = "tp_mehr", text = "Senator Stonehallow fights wi' a hammer. I asked tae look at it. It's old Ironforge work, an' finer than anythin' I'll make for twenty years." } },
    background = { { id = "tp_bg", text = "I'm apprenticed tae a weaponsmith in Ironforge. He sent me here for a quiet season." } },
    _none = { { id = "tp_none", text = "I'm sorry, I dinnae ken. I've only been here a year, an' most o' that's been axes." } },
  },
}

---------------------------------------------------------------------------
-- Turuk Amberstill: weaponsmith at Amberstill Ranch; the Amberstill who took up the forge instead of the herd.

---------------------------------------------------------------------------
-- Yarlyn Amberstill: a child at Amberstill Ranch who sells rabbits and is forever chasing her own, Fluffy.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_yarlyn", id = TODO_NPC("Yarlyn Amberstill"), name = "Yarlyn Amberstill", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "breathless", "determined" }, values = { "family", "nature" },
  notices = { "pet", "race" },
  impression = {
    first = "Yarlyn Amberstill is a small girl at Amberstill Ranch who sells snowshoe rabbits and spends her days chasing her own, Fluffy, around the ram pen. She bargains like a dwarf five times her age.",
    third = "{name} met Yarlyn Amberstill, a child who sells rabbits at Amberstill Ranch in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Did you see a rabbit? A white one? She went that way, or maybe that way, and I've got to catch her before Da sees she's been in the forge again!" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! Fluffy got out again, she always gets out, and have you got a carrot?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You're a hunter! You're not allowed to hunt Fluffy. Or any of the white ones by the pen, they're mine, I counted them." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Is {pet} going to eat my rabbits? Because if {pet} eats one you have to pay for it, that's the rule, Uncle Veron said." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're nearly as small as me! Nobody's ever as small as me. Do you want to help look? You can see under the fence without bending." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Yarlyn Amberstill and I'm seven and I sell rabbits. Real ones, snowshoe ones, in a crate so they don't get cold. Fluffy's not for sale, though, because she's mine, and anyway I can't find her." },
      },
      again = {
        { id = "h_again", text = "What? I'm listening, I'm just looking under things." },
        { id = "h_again2", text = "Yes? Is it about rabbits?" },
      },
      choices = {
        { text = "Show me your rabbits.", next = "BUSINESS" },
        { text = "How did Fluffy get out?", next = "fluffy" },
        { text = "How do you look after so many rabbits?", next = "care" },
        { text = "Why rabbits, on a ram ranch?", next = "rams" },
        { text = "What's it like growing up here?", next = "ranch" },
        { text = "Who buys your rabbits?", next = "buyers" },
        { text = "Good luck catching Fluffy.", next = "END" },
      },
    },
    fluffy = {
      lines = { { id = "fluffy_default", text = "She chews the latch! I tie it with string and she chews the string. Da made me an iron latch and she can't chew that, so now she waits till I open it to feed her and goes straight between my feet. She's very clever. She's cleverer than a ram." } },
      choices = { { text = "Where does she usually go?", next = "fluffy_where" }, { text = "Something else.", next = "BACK" } },
    },
    fluffy_where = {
      lines = { { id = "fluffy_where_default", text = "The forge, because it's warm, and Da shouts. Or the ram pen, and then I have to go in after her, and I'm not allowed in the ram pen, so I have to do it when Aunt Rudra's looking the other way. Don't tell." } },
      choices = {
        { text = "I won't tell.", next = "BACK", reply = "Good, you're nice. You can have a rabbit for only a little bit more than the price.", fx = { trait = { discreet = 1 } } },
        { text = "The ram pen sounds dangerous.", next = "BACK", reply = "It's not! The rams like me, mostly, except the black one, who doesn't like anybody.", fx = { trait = { cautious = 1 } } },
      },
    },
    care = {
      lines = { { id = "care_default", text = "You give them hay and a bit of carrot and you keep them out of the wind. And you have to hold them every day or they go wild and bite. I hold all of them. It takes all morning, and then Fluffy gets out, and that's the afternoon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rams = {
      lines = { { id = "rams_default", text = "Because rams are boring and they smell and you can't pick one up. Uncle Veron says rabbits aren't proper livestock. I said I sold four last week and how many rams did he sell, and he said none, because nobody was fit to buy one. So I won." } },
      choices = { { text = "You did win.", next = "BACK", reply = "I know! Da laughed so much he dropped his hammer.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    ranch = {
      lines = { { id = "ranch_default", text = "It's good. There's snow all the time and I've got my own crate and Ultham lets me sit on Thistle when she's in a good mood. But there's a monster up the hill that eats the rams, and I'm not allowed past the top fence, not ever." } },
      choices = { { text = "Are you frightened of it?", next = "ranch_monster" }, { text = "Something else.", next = "BACK" } },
    },
    ranch_monster = {
      big = true,
      lines = { { id = "ranch_monster_default", text = "A bit, at night. Da says it only wants rams and it won't come down to the house. But I heard him tell Aunt Rudra it's getting bolder. I'm going to make a trap for it, with a rabbit crate, only bigger. Don't laugh." } },
      choices = {
        { text = "Leave the monster to the grown folk. A promise to your da comes first.", next = "BACK", reply = "That's what everybody says. All right, but I'm still going to draw the trap, in case they need it.", fx = { align = { order = 1 } } },
        { text = "Build your trap. Brave ideas shouldn't wait for permission.", next = "BACK", reply = "Yes! You can help carry the wood. Not past the top fence, though. I did promise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_default", text = "Travellers, mostly, and gnomes, because a rabbit's the right size for a gnome. I ask them things first, like Uncle Veron does. Have you got a warm pocket, and will you hold it every day. If they say no, I say I've sold out." } },
      choices = { { text = "You turn buyers away?", next = "BACK", reply = "Only bad ones. A lady from Stormwind wanted one for a hat. I said they'd all died.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    fluffy = { { id = "tp_fluffy", text = "She's white and she's got one grey ear and if you see her you have to stand very still and shout for me." } },
    veron = { { id = "tp_veron", text = "Uncle Veron sells the rams. He frowns at everybody to see if they're good enough. He frowned at me once and I frowned back." } },
    turuk = { { id = "tp_turuk", text = "Da makes axes. He says the forge isn't for rabbits. Fluffy doesn't agree." } },
    background = { { id = "tp_bg", text = "I was born here! In the big house, in the winter. Da says I came out shouting." } },
    _none = { { id = "tp_none", text = "I don't know, unless it's about rabbits, because I know about rabbits." } },
  },
}

-- ========================================================================
-- Third pass: Ironforge (journeyman trainers, merchants, the Stonefire, the Vault, the auction house)
-- ========================================================================

---------------------------------------------------------------------------
-- Gretta Finespindle: takes the beginners at Finespindle's Leather Goods, north side of the Great Forge.

---------------------------------------------------------------------------
-- Groum Stonebeard: journeyman blacksmith at the Great Anvil, Rotgath's son.

---------------------------------------------------------------------------
-- Rotgath Stonebeard: expert blacksmith at the Great Anvil, Groum's father.

---------------------------------------------------------------------------
-- Jemma Quikswitch: journeyman engineer at Springspindle's Gadgets, Tinker Town; Trixie's younger sister.

---------------------------------------------------------------------------
-- Trixie Quikswitch: expert engineer at Springspindle's Gadgets, Tinker Town; Jemma's older sister.

---------------------------------------------------------------------------
-- Thonys Pillarstone: dwarf journeyman enchanter at Thistlefuzz Arcanery, Great Forge.

---------------------------------------------------------------------------
-- Uthrar Threx: journeyman tailor at Stonebrow's Clothier, Great Forge; the neatest presser in Ironforge.

---------------------------------------------------------------------------
-- Vosur Brakthel: dwarf journeyman alchemist at Berryfizz's Potions and Mixed Drinks, Tinker Town.

---------------------------------------------------------------------------
-- Mangorn Flinthammer: plate and shields at the Flinthammers' armour shop in the Commons.

---------------------------------------------------------------------------
-- Raena Flinthammer: leather and cloth armour at the Flinthammers' shop in the Commons; Mangorn's wife.

---------------------------------------------------------------------------
-- Bromiir Ormsen: mail at the Flinthammers' armour shop in the Commons; a former mountaineer.

---------------------------------------------------------------------------
-- Dolkin Craghelm: mail at Craghelm's Plate and Chain, Military Ward; Olthran's younger brother.

---------------------------------------------------------------------------
-- Olthran Craghelm: plate at Craghelm's Plate and Chain, Military Ward; Dolkin's elder brother.

---------------------------------------------------------------------------
-- Lissyphus Finespindle: fits and sells light armour for the Finespindles.

---------------------------------------------------------------------------
-- Maeva Snowbraid: robes at Maeva's Mystical Apparel, Mystic Ward; Poranna's sister.

---------------------------------------------------------------------------
-- Ingrys Stonebrow: cloth armour at Maeva's Mystical Apparel, Mystic Ward; Jormund's kinswoman.

---------------------------------------------------------------------------
-- Harick Boulderdrum: wands at The Fighting Wizard, Mystic Ward.

---------------------------------------------------------------------------
-- Bingus: staves and daggers at The Fighting Wizard, Mystic Ward; Harick's partner.

---------------------------------------------------------------------------
-- Hjoldir Stoneblade: blades at Stoneblade's, Forlorn Cavern.

---------------------------------------------------------------------------
-- Gwenna Firebrew: barmaid at the Stonefire Tavern, Commons; kin to Innkeeper Firebrew.

---------------------------------------------------------------------------
-- Bailey Stonemantle: banker at the Vault of Ironforge; the youngest Stonemantle at the counters.

---------------------------------------------------------------------------
-- Barnum Stonemantle: senior banker at the Vault of Ironforge.

---------------------------------------------------------------------------
-- Auctioneer Buckler: dwarf auctioneer in the Commons, beside Redmuse and Lympkin.
