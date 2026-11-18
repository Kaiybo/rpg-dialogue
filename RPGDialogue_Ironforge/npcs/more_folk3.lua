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
P:NPC {
  key = "mf_bronk", id = TODO_NPC("Bronk Guzzlegear"), name = "Bronk Guzzlegear", title = "Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "loud", "proud" }, values = { "craft", "brave" },
  notices = { "race", "craft" },
  impression = {
    first = "Bronk Guzzlegear teaches engineering at Steelgrill's Depot, where the siege engines are kept, and his apprentices blow up a workbench most weeks. He holds that dwarven engineering is built to last and gnomish engineering is built to surprise.",
    third = "{name} met Bronk Guzzlegear, the engineering trainer at Steelgrill's Depot in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Mind yer head an' mind the bench! That one's new. The last one's up there, in the rafters." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! An' I've still a roof, so it's been a quiet week." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Dwarf-taught or gnome-taught? Never mind, I'll ken in a minute by how ye hold a spanner." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome at the Depot! Ye'll have opinions about my steam tank. Everybody from Tinker Town does. Write them down an' I'll read them when I'm old." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "That's a rough blastin' powder burn on yer sleeve. Ye packed it tight an' lit it short. Good! Ye'll no' do that twice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bronk Guzzlegear! I teach engineerin' the dwarven way: thick plate, big rivets an' enough powder tae be sure. Beldin Steelgrill keeps the siege engines here, an' my apprentices learn their trade keepin' them runnin', or tryin' tae." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, my ears are no' what they were." },
        { id = "h_again2", text = "Aye! Ask!" },
      },
      choices = {
        { text = "Train me in engineering.", next = "BUSINESS" },
        { text = "Your apprentices blow up a bench a week?", next = "bench" },
        { text = "What's the dwarven way, exactly?", next = "dwarven" },
        { text = "Tell me about the siege engines.", next = "engines" },
        { text = "Your hearing seems to have suffered.", next = "ears" },
        { text = "What should a new engineer build first?", next = "build" },
        { text = "Good day, Bronk.", next = "END" },
      },
    },
    bench = {
      lines = { { id = "bench_default", text = "On a slow week! Loslor Rudge sells me the powder an' the new timber both, an' he's the only dwarf in the Depot who smiles when he hears a bang. A lad who's never blown up a bench has never found out where the edge is." } },
      choices = {
        { text = "Has anyone been badly hurt?", next = "bench_hurt" },
        { text = "That's a reckless way to teach.", next = "bench_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bench_hurt = {
      big = true,
      lines = { { id = "bench_hurt_default", text = "Eyebrows, mostly. One lad lost two fingers last winter, an' Beldin Steelgrill wants me tae lock up the powder an' hand it out by the measure, wi' a ledger. He's a point. But a lad who's never had the keg in his own hands learns tae fear it an' no' tae ken it." } },
      choices = {
        { text = "Lock it up. No lesson is worth a boy's fingers.", next = "BACK", reply = "Aye, that's Beldin's tune. The lad himself says he'd do it all again, mind, an' he's my best now.", fx = { align = { order = 1 } } },
        { text = "Leave it open. Engineers are made by their mistakes.", next = "BACK", reply = "That's how I was made! I'll grant I've nine fingers an' one good ear tae show for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarven = {
      lines = { { id = "dwarven_default", text = "If it might break, make it thicker. If it might still break, add a rivet. A gnome builds a thing tae do nine jobs an' ye need a diagram tae start it. I build a thing tae do one job in a blizzard after a trogg's been at it wi' a rock." } },
      choices = { { text = "The gnomes build clever things.", next = "dwarven_gnomes" }, { text = "Something else.", next = "BACK" } },
    },
    dwarven_gnomes = {
      lines = { { id = "dwarven_gnomes_default", text = "They do, an' I'll say it tae their faces. Yon flyin' machines the pilots keep here are gnome work, an' I've had the cowlin' off one, an' I couldnae tell ye how half of it stays up. But I can tell ye it'll no' start when it's cold enough, an' mine will." } },
      choices = { { text = "Each has its place, then.", next = "BACK", reply = "Aye. Theirs for goin' up, an' mine for when it comes down.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    engines = {
      lines = { { id = "engines_default", text = "Steam tanks an' the old ballistae, kept for the day Ironforge needs them. Pilot Stonegear has his Trollplow in for mendin', an' he's very particular who touches it. Beldin sees tae the parts, an' my apprentices do the greasin', for a lad learns a machine from underneath." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ears = {
      lines = { { id = "ears_default", text = "Eh? Ha, that was a jest, though the left one's gone entire. A mortar round cooked off on the bench when I was a 'prentice, an' I was leanin' over it at the time. I teach from the right side now, an' I teach them no' tae lean." } },
      choices = { { text = "A lesson worth an ear, I suppose.", next = "BACK", reply = "It was a dear lesson, an' I've made sure forty lads got it cheaper.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "build_default", text = "Rough blastin' powder, an' then a handful o' copper bolts, by hand, till every thread runs true. After that I let them make a rough boomstick an' fire it at the snowbank behind the shed. If the stick survives, they've passed. If the shed survives, so have I." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    loslor = { { id = "tp_loslor", text = "Loslor Rudge sells the supplies. He complains about his couriers from dawn tae dusk, an' he's never once been short when I needed powder." } },
    beldin = { { id = "tp_beldin", text = "Beldin Steelgrill runs the Depot. He frets about parts an' paperwork, an' the engines run because of it." } },
    stonegear = { { id = "tp_stonegear", text = "Pilot Stonegear loves that Trollplow more than his own beard. I've been allowed tae look at it." } },
    background = { { id = "tp_bg", text = "I served a mortar team in the Second War. Everythin' I teach, I learned by it goin' wrong first." } },
    _none = { { id = "tp_none", text = "Eh? I didnae catch that, an' I doubt I'd ken the answer if I had." } },
  },
}

---------------------------------------------------------------------------
-- Yarr Hammerstone: mining trainer at Steelgrill's Depot.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_yarr", id = TODO_NPC("Yarr Hammerstone"), name = "Yarr Hammerstone", title = "Mining Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "patient", "plain" }, values = { "craft", "tradition" },
  notices = { "craft", "greenness" },
  impression = {
    first = "Yarr Hammerstone teaches mining at Steelgrill's Depot and reads the hills of Dun Morogh the way other folk read a ledger. He is patient and plain, and believes a miner should leave a seam fit for the next dwarf.",
    third = "{name} met Yarr Hammerstone, the mining trainer at Steelgrill's Depot in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Good day tae ye. If ye've come tae learn the pick, ye've come tae the right hill." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let's see yer pick. Aye, ye've been usin' it, the point's worn honest." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner. What have ye found, an' where? I like tae ken what the hills are givin' up this season." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith who's come tae learn where the metal's from. That's the right order o' things, though most do it the other way about." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're new, an' that pick's newer. Dinnae fret. Copper's soft an' it's near the surface, an' it forgives a bad swing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Yarr Hammerstone. I teach the findin' an' the takin' o' ore. The Depot needs copper an' tin for its engines, an' Bronk Guzzlegear's lads need it faster than any dwarf can dig, so I train every pair o' hands that'll hold a pick." },
      },
      again = {
        { id = "h_again", text = "What else would ye ken?" },
        { id = "h_again2", text = "Aye, ask. The ore's been there a long while, it'll wait." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where is the copper in Dun Morogh?", next = "copper" },
        { text = "How do you read a hillside?", next = "read" },
        { text = "Do you leave ore in the ground on purpose?", next = "leave" },
        { text = "Has the trouble at Gol'Bolar reached you?", next = "quarry" },
        { text = "What should a miner carry?", next = "kit" },
        { text = "Good day, Yarr.", next = "END" },
      },
    },
    copper = {
      lines = { { id = "copper_default", text = "Along the foot o' every cliff, where the frost has split the rock an' shown the green. Try the hills south o' here toward the Grizzled Den, if ye can keep clear o' the wendigo, an' the slopes above Brewnall. Dinnae go lookin' at Gol'Bolar till the troggs are out." } },
      choices = { { text = "And tin?", next = "copper_tin" }, { text = "Something else.", next = "BACK" } },
    },
    copper_tin = {
      lines = { { id = "copper_tin_default", text = "Tin's deeper an' it's further east, toward the pass intae Loch Modan. Learn yer copper first. When ye can smelt a bar that doesnae crumble, come back, an' I'll tell ye how tae marry it wi' tin for bronze." } },
      choices = { { text = "Copper first, then.", next = "BACK" } },
    },
    read = {
      lines = { { id = "read_default", text = "Look for where the snow melts first. Ore holds the day's warmth longer than plain rock, so of a mornin' ye'll see a bare patch on a white slope, an' there's yer vein. My father showed me that, an' his showed him." } },
      choices = {
        { text = "That's a fine trick.", next = "BACK", reply = "It's nae trick. It's fifty years o' cold mornin's, handed down.", fx = { affinity = 1 } },
        { text = "Does it work in summer?", next = "BACK", reply = "We've nae summer. Ask me again in Loch Modan.", fx = { trait = { witty = 1 } } },
      },
    },
    leave = {
      big = true,
      lines = { { id = "leave_default", text = "Aye, a third o' every vein. Ye take what ye need an' leave the root, an' in a generation the hill's given more. The Depot wants every scrap now, for the engines, an' Beldin's asked me tae teach the lads tae strip a seam bare." } },
      choices = {
        { text = "Leave the third. The next dwarf has a right to the hill too.", next = "BACK", reply = "That's the old law o' the pick. I'll keep teachin' it, an' Beldin can count his copper twice.", fx = { align = { order = 1 } } },
        { text = "Strip it. Ironforge needs the metal now, not in a generation.", next = "BACK", reply = "There's a war on, aye, there's always a war on. An' there's always a hill at the end o' it wi' nothin' left inside.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarry = {
      lines = { { id = "quarry_default", text = "It has. Half my students came from the Gol'Bolar crews, an' now they sit about the Depot wi' nae pit tae work. Dank Drizzlecut still teaches at the quarry's edge, the stubborn old goat, wi' troggs in the hole below him." } },
      choices = { { text = "You think he should leave?", next = "quarry_dank" }, { text = "Something else.", next = "BACK" } },
    },
    quarry_dank = {
      lines = { { id = "quarry_dank_default", text = "I think he'll leave when the Foreman does, an' the Foreman will leave feet first. They're quarrymen. I'm a hill miner, an' I can walk tae another hill. A quarryman's only got the one hole, an' he'll no' give it up tae a trogg." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kit = {
      lines = { { id = "kit_default", text = "A pick, a lamp, a coil o' rope an' a whistle. The whistle's the one they laugh at. A shout doesnae carry out o' a slide, an' a whistle does. An' never dig alone under an overhang in a thaw, for the hill's lookin' for an excuse." } },
      choices = { { text = "I'll carry the whistle.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bronk = { { id = "tp_bronk", text = "Bronk Guzzlegear teaches the engineers. He uses my copper faster than I can find it, an' most of it ends up in the rafters." } },
    dank = { { id = "tp_dank", text = "Dank Drizzlecut, at Gol'Bolar. He taught me tae swing a pick, an' he's still tellin' me I do it wrong." } },
    beldin = { { id = "tp_beldin", text = "Beldin Steelgrill runs the Depot. He counts ore by the cart, an' he's never held a pick." } },
    background = { { id = "tp_bg", text = "Hammerstones have mined these hills since before the Depot had a roof. I ken every slope by its mornin' face." } },
    _none = { { id = "tp_none", text = "I dinnae ken that. I ken what's under the snow." } },
  },
}

---------------------------------------------------------------------------
-- Alamar Grimm: gnome warlock trainer at the back of Anvilmar; novices bring him the Tainted Memorandum.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_alamar", id = TODO_NPC("Alamar Grimm"), name = "Alamar Grimm", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "coldridge", "gnomeregan" }, temper = { "sour", "bitter" }, values = { "gnomeregan", "control" },
  notices = { "class", "race" },
  impression = {
    first = "Alamar Grimm trains novice warlocks at the back of Anvilmar and is sour with nearly everyone in it. He has not forgiven the fall of Gnomeregan, and he is not particular about whom he blames on a given day.",
    third = "{name} met Alamar Grimm, the warlock trainer at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Yes? If you've come to stare at the warlock, you may do it from over there, with the others." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I assumed the troggs would have had you by now. I'm told I should be pleased." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "So you're the one with the memorandum. Sit down. You'll learn quickly or not at all, because I've no patience for the second kind." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You flinched when the brazier flared. Stop that. Whatever you call up will be watching for exactly that." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Come to make sure the gnome isn't summoning anything under your nice safe mountain, I suppose." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Alamar Grimm. I teach the first bindings to those with the nerve for them, here at the back, where the dwarves have put me so the priest needn't look. Gnomeregan is lost, and I intend that the next thing that comes for us finds us better armed." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Alamar Grimm. You're one of ours, at least. I teach the first bindings, at the back of a dwarven hall, because that is what we have been reduced to. Remember who left us there." },
      },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Go on. I haven't all day, though I've little else to do with it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "You don't seem fond of Anvilmar.", next = "anvilmar" },
        { text = "Whom do you blame for Gnomeregan?", next = "blame" },
        { text = "Why teach demons to novices?", next = "why" },
        { text = "The priest here saves you a seat by the fire.", next = "seat" },
        { text = "Who trains the demons once they're bound?", next = "wren" },
        { text = "I'll leave you to your corner.", next = "END" },
      },
    },
    anvilmar = {
      lines = { { id = "anvilmar_default", text = "It is cold, it smells of wet wool, and the dwarves speak to me as one speaks to a kettle that may boil over. They were generous to take us in. I'm reminded of it daily, usually by them." } },
      choices = { { text = "They did take you in.", next = "anvilmar_took" }, { text = "Something else.", next = "BACK" } },
    },
    anvilmar_took = {
      lines = { { id = "anvilmar_took_default", text = "They did. And when the High Tinker asked for an army to retake our city, they found they needed every soldier for their own passes. I can be grateful for a roof and still count who came when we called." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blame = {
      big = true,
      lines = { { id = "blame_default", text = "Thermaplugg, first. Then every adventurer who went treasure-hunting in our halls and stirred up what was sleeping. Then the dwarves, who sent blankets when we asked for rifles. And the humans, for whom the dwarves were saving the rifles." } },
      choices = {
        { text = "That's unjust. Ironforge sheltered you when no one else would.", next = "BACK", reply = "So Branstock tells me, with that smile. Perhaps. Bitterness is the one thing I carried out, and I'm not ready to put it down.", fx = { align = { light = 1 } } },
        { text = "You're right. Allies who send blankets aren't allies.", next = "BACK", reply = "Ha. At last, somebody who can count. Don't say it too loudly, they'll move my corner further back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because I watched engineers with thirty years of training die holding wrenches. A novice with one bound imp could have held a stair for an hour. I don't teach this because it's safe. I teach it because safe was tried." } },
      choices = { { text = "And the risk to the novice?", next = "why_risk" }, { text = "Something else.", next = "BACK" } },
    },
    why_risk = {
      lines = { { id = "why_risk_default", text = "Is considerable, and I tell them so, in writing, before the first lesson. That is more than anyone told the people on the lower levels. Gimrizz Shadowcog in Kharanos takes them from me when they've lived long enough to need more." } },
      choices = { { text = "At least you warn them.", next = "BACK", reply = "I do. I'm bitter, I'm not a liar.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    seat = {
      lines = { { id = "seat_default", text = "Khalder. Yes. Every evening he leaves a stool empty beside him and looks over here. I've never taken it. He thinks I'm stubborn, and I think he's a fool, and the stool has now been empty long enough that it would be awkward to sit on it." } },
      choices = {
        { text = "Sit on it once. What's the harm?", next = "BACK", reply = "He'd tell me a joke. I've heard his jokes through the wall. That is the harm.", fx = { trait = { witty = 1 } } },
        { text = "He means it kindly.", next = "BACK", reply = "I know he does. That's what makes it so difficult to refuse politely.", fx = { trait = { kind = 1 } } },
      },
    },
    wren = {
      lines = { { id = "wren_default", text = "Wren Darkspring, at the next bench. She trains what my students summon. She's patient with the creatures and with me, and I'm not certain which of us tries her more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    wren = { { id = "tp_wren", text = "Wren Darkspring handles the demons after binding. She is the only person in this hall who doesn't lower her voice when she speaks to me." } },
    branstock = { { id = "tp_branstock", text = "The priest. He tells jokes, he saves me a seat, and he is entirely sincere. I find all three exhausting." } },
    gimrizz = { { id = "tp_gimrizz", text = "Gimrizz Shadowcog teaches in Kharanos. He's colder than I am and a better teacher, and I resent him for only one of those." } },
    background = { { id = "tp_bg", text = "I was a foreman on the lower levels of Gnomeregan. I got my crew to the lifts. I didn't get all of them into the lifts." } },
    _none = { { id = "tp_none", text = "I neither know nor care. Ask a dwarf, they have opinions on everything." } },
  },
}

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
P:NPC {
  key = "mf_grundel", id = TODO_NPC("Grundel Harkin"), name = "Grundel Harkin", title = "Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "steady", "fatherly" }, values = { "duty", "practical" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Grundel Harkin sells mail and shields at Anvilmar to recruits who have never been hit yet. He is steady and fatherly, and counts the shields that come back against the ones he sold.",
    third = "{name} met Grundel Harkin, the armorer at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Anvilmar, recruit. Let's see what ye're wearin'. Aye. That'll no' do, will it?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' on yer feet. Show me the shield. Dented, good, that's what it's for." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior. Thran Khorman will have ye in the troggs by noon, so ye'll want a shield on yer arm before then." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That's taken a batterin', an' good, for it means ye were where the fightin' was, an' it means ye need another." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "First day, is it? Dinnae be ashamed o' it. Every mountaineer on the wall stood where ye're standin', wi' the same look." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grundel Harkin, armourer tae Anvilmar. I sell mail an' shields tae the recruits before they go down intae the valley. Rybrad Coldbank gives them somethin' tae hit wi', an' I give them somethin' tae be hit on." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}?" },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What does a recruit need first?", next = "need" },
        { text = "What's waiting out in the valley?", next = "valley" },
        { text = "You count the shields that come back.", next = "count" },
        { text = "Who else outfits the recruits?", next = "others" },
        { text = "How should I look after a shield?", next = "care" },
        { text = "Good day, Grundel.", next = "END" },
      },
    },
    need = {
      lines = { { id = "need_default", text = "A shield, if ye can carry one, an' a mail shirt if ye cannae. The troggs here swing clubs, an' a club doesnae cut. It breaks. Ye want somethin' that spreads the blow, an' leather alone willnae do that." } },
      choices = { { text = "And if I can't afford both?", next = "need_afford" }, { text = "Something else.", next = "BACK" } },
    },
    need_afford = {
      lines = { { id = "need_afford_default", text = "Then go an' see Sten Stoutarm outside. He wants wolf meat for the camp, an' he pays in gear. Half my customers come back from Sten wi' gloves on an' coin for a shield. That's how the valley's meant tae work." } },
      choices = { { text = "I'll speak with Sten.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "valley_default", text = "Wolves near the hall, troggs past the frozen pond, an' Frostmane trolls in the caves tae the south an' west. Grelin Whitebeard's camped down there countin' the trolls for the Senate. It's a hard wee valley, an' it's meant tae be." } },
      choices = { { text = "Meant to be?", next = "valley_meant" }, { text = "Something else.", next = "BACK" } },
    },
    valley_meant = {
      big = true,
      lines = { { id = "valley_meant_default", text = "Aye. We send them out green, on purpose. Balir Frosthammer could clear those troggs wi' ten mountaineers in a day, an' he doesnae, for the recruits have tae learn on somethin'. Some dinnae come back. I've asked myself whether that's a fair price for the ones who do." } },
      choices = {
        { text = "It's fair. Soldiers who've never been tested fail when it matters.", next = "BACK", reply = "That's Balir's answer, an' it was my sergeant's before him. It's the right one, I think. It doesnae make the countin' easier.", fx = { align = { order = 1 } } },
        { text = "It's wrong. Clear the valley and train them where none need die.", next = "BACK", reply = "I've said as much, once. I was told I'd gone soft from sellin' shields tae bairns. Maybe I have.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "count_default", text = "I do. I sold forty-one shields last season, an' thirty-eight came through that door again, on an arm. I ken the three. I've their names on a slate under the counter, an' I'll no' wipe it." } },
      choices = { { text = "You remember every one.", next = "BACK", reply = "Somebody should. They were here a week. I was the last tae fit them.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "others_default", text = "Rybrad Coldbank for weapons, an' Durnan Furcutter for cloth an' leather, an' Adlin Pridedrift for the food an' the bedroll. We eat at the one table. Rybrad says I mother the recruits, an' he sharpens every blade twice before he sells it, so he can talk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    care = {
      lines = { { id = "care_default", text = "Look tae the straps, no' the face. A dented face still turns a club. A strap that's stretched wi' the wet lets the shield swing wide just when ye need it close. Check them after every fight, an' dry them by the fire, never on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    rybrad = { { id = "tp_rybrad", text = "Rybrad Coldbank sells the weapons. He's gruff as a boar, an' he's never let a blunt edge leave the hall." } },
    balir = { { id = "tp_balir", text = "Balir Frosthammer commands in Coldridge. He's a hard dwarf an' a fair one, an' he kens every recruit's name by the third day." } },
    sten = { { id = "tp_sten", text = "Sten Stoutarm outfits the ones wi' nae coin, for a bit o' honest huntin'. Half the valley wears his gloves." } },
    background = { { id = "tp_bg", text = "I carried a shield in the Second War. Now I hand them tae others, an' I think that's the harder job." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, {g:lad|lass}. I ken mail an' I ken this hall." } },
  },
}

---------------------------------------------------------------------------
-- Rybrad Coldbank: weaponsmith at Anvilmar, Coldridge Valley.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_rybrad", id = TODO_NPC("Rybrad Coldbank"), name = "Rybrad Coldbank", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "gruff", "exact" }, values = { "craft", "duty" },
  notices = { "weapon", "greenness" },
  impression = {
    first = "Rybrad Coldbank sells recruits their first weapons at Anvilmar and sharpens every edge twice before it leaves his rack. He is gruff with the young ones, and has never knowingly sold one a blade too heavy to lift.",
    third = "{name} met Rybrad Coldbank, the weaponsmith at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Aye, it's weapons ye'll be wantin'. Hold out yer arm, straight, an' keep it there till I say." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so give it here. Hmph, ye've been hittin' rock wi' it. Troggs are softer than rock, so aim for those." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ye'll be one o' Solm Hargrin's. Daggers are on the end. I dinnae need tae ken what ye'll do wi' them." },
  },
  notice = {
    { id = "n_kit", cat = "weapon", when = { durability = { max = 0.3 } },
      text = "That edge is a disgrace. Ye could ride tae Ironforge on it an' no' cut yerself. Leave it wi' somebody who mends, or buy another." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Yer arm's shakin' already. Ye've picked up too much weapon, the way they all do. Put that down an' try the short one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rybrad Coldbank. I sell the recruits o' Coldridge their first steel: axes, hammers, short swords an' a few daggers. It's plain work, an' it's sharp. I'll no' sell ye what ye cannae swing, whatever ye think ye want." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Aye. Speak." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why make me hold out my arm?", next = "arm" },
        { text = "What suits a beginner best?", next = "beginner" },
        { text = "Grundel says you sharpen everything twice.", next = "twice" },
        { text = "What do you make of this year's recruits?", next = "recruits" },
        { text = "Where does your steel come from?", next = "steel" },
        { text = "Good day, Rybrad.", next = "END" },
      },
    },
    arm = {
      lines = { { id = "arm_default", text = "Tae see how long it stays up. If it drops inside a slow count o' twenty, ye're no' ready for a two-handed axe, an' I'll no' sell ye one. A recruit wi' too much weapon gets one grand swing an' then stands there puffin' while the trogg takes his turn." } },
      choices = { { text = "What if I insist on the big axe?", next = "arm_insist" }, { text = "Something else.", next = "BACK" } },
    },
    arm_insist = {
      big = true,
      lines = { { id = "arm_insist_default", text = "Then we've an argument, for it's yer coin. I've had recruits shout that I've nae right tae refuse a sale, an' they're correct, I havenae. I've refused all the same, an' been reported tae Balir Frosthammer for it twice." } },
      choices = {
        { text = "Keep refusing. You know better than a recruit what will get him killed.", next = "BACK", reply = "Aye. Balir said the same, both times, an' sent them back tae me for the short axe.", fx = { align = { order = 1 } } },
        { text = "Sell it. A free dwarf chooses his own weapon and his own mistakes.", next = "BACK", reply = "Hmph. An' I carry him back up the hill after. Ye've a point, an' I dinnae like it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beginner = {
      lines = { { id = "beginner_default", text = "A one-handed axe or a mace, an' a shield off Grundel. An axe forgives a bad angle. A sword doesnae, it turns in the hand an' slaps flat. Leave swords till somebody's taught ye the edge." } },
      choices = { { text = "And for a caster?", next = "beginner_caster" }, { text = "Something else.", next = "BACK" } },
    },
    beginner_caster = {
      lines = { { id = "beginner_caster_default", text = "A staff, tae lean on an' tae keep a wolf at arm's length. The gnomes at the back send me their mages, an' every one asks for a dagger because it looks clever. I give them a stick. They're no' goin' tae stab a trogg, an' they ken it." } },
      choices = { { text = "A stick it is.", next = "BACK", reply = "Good. Ye're easier than most.", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    twice = {
      lines = { { id = "twice_default", text = "I do. Once when it comes up from the forge at Kharanos, an' again the mornin' I sell it. An edge goes dull just hangin' on a rack in this damp. A recruit shouldnae find out his axe is blunt wi' a trogg in front o' him." } },
      choices = { { text = "That's care, whatever you call it.", next = "BACK", reply = "It's my trade, properly done. Dinnae make it soft.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "recruits_default", text = "Younger than they were, an' more o' them. There's gnomes now, an' the odd human come north. The gnomes listen, I'll say that. They ask what the weapon weighs an' how it balances, an' they write it down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steel = {
      lines = { { id = "steel_default", text = "Kharanos. Tognus Flintfire forges it an' sends it through Coldridge Pass, when the troggs havenae shut the tunnel. I've been short o' hammers a fortnight on account o' that. Mountaineer Thalos keeps promisin' me the road, an' the troggs keep takin' it back." } },
      choices = { { text = "Someone should clear that tunnel.", next = "BACK", reply = "Aye. Go an' tell Thalos ye volunteer. He'll be glad o' ye.", fx = { trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    grundel = { { id = "tp_grundel", text = "Grundel Harkin sells the armour. He frets over every recruit like a hen, an' the hall's the better for it. Dinnae tell him." } },
    tognus = { { id = "tp_tognus", text = "Tognus Flintfire at Kharanos forges most o' my stock. Grand steel, an' it arrives when he remembers tae send it." } },
    solm = { { id = "tp_solm", text = "Solm Hargrin has the rogues. Ye'll no' see him unless he's a mind tae be seen. I leave his order by the door, an' it's gone by mornin'." } },
    background = { { id = "tp_bg", text = "I was a company armourer wi' the mountaineers. I've sharpened more axes than I've had breakfasts." } },
    _none = { { id = "tp_none", text = "Dinnae ken. Ask somebody who talks for a livin'." } },
  },
}

---------------------------------------------------------------------------
-- Adlin Pridedrift: general supplies at Anvilmar; Nori Pridedrift's brother.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_adlin", id = TODO_NPC("Adlin Pridedrift"), name = "Adlin Pridedrift", title = "General Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "orderly", "exasperated" }, values = { "practical", "family" },
  notices = { "hunger", "greenness" },
  impression = {
    first = "Adlin Pridedrift sells food, water and bedrolls at Anvilmar and keeps his stall in perfect order. His brother Nori wanders the valley with a kettle and no sense of time, and Adlin has been making excuses for him for years.",
    third = "{name} met Adlin Pridedrift, who sells general supplies at Anvilmar in Coldridge Valley.",
  },
  greetings = {
    { id = "g_hi", text = "Good day tae ye. Bread, water, a bedroll an' a flint. Ye'll want all four, whatever ye think now." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more. Ye've no' seen my brother out there, have ye? Wee kettle, great hurry, goin' the wrong way?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're up late. If ye're headed out, take a torch. If ye're headed in, the fire's that way an' the floor's free." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Ye look as if ye've no' eaten since yesterday. I've bread an' I've cheese. Sit an' have it before ye fall over." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "New, are ye? Then here's the first lesson, an' it's free: eat before ye're hungry an' drink before ye're thirsty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Adlin Pridedrift. I keep the general stall: food, water, bedrolls, flint an' a bit o' rope. It's all on the shelf where it should be. If ye've met a dwarf in the valley wi' a kettle who was late for somethin', that's my brother Nori, an' I'm sorry." },
      },
      again = {
        { id = "h_again", text = "What else can I get ye?" },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Tell me about your brother.", next = "nori" },
        { text = "What should I carry into the valley?", next = "carry" },
        { text = "How does food get up to Anvilmar?", next = "supply" },
        { text = "Your stall is very tidy.", next = "tidy" },
        { text = "Who's hardest to keep fed in Anvilmar?", next = "feed" },
        { text = "Good day, Adlin.", next = "END" },
      },
    },
    nori = {
      lines = { { id = "nori_default", text = "Nori brews a hot drink he calls Scaldin' Mornbrew, an' he carries it about Coldridge tae sell tae the sentries. It's good. It'd be better if it ever reached them hot. He sets out on time an' arrives a day late, an' I've never worked out where the day goes." } },
      choices = { { text = "Why not sell it from your stall?", next = "nori_stall" }, { text = "Something else.", next = "BACK" } },
    },
    nori_stall = {
      big = true,
      lines = { { id = "nori_stall_default", text = "I've offered. I've a shelf cleared for it. He says a brew should be carried tae folk in the cold, an' no' sat on a shelf waitin' for them. So he's out in the snow, late, losin' mugs, an' I'm coverin' his debts wi' the cooper." } },
      choices = {
        { text = "Stop paying. He'll never learn to mind his own affairs otherwise.", next = "BACK", reply = "Aye, everybody says it. I've the last bill here, an' I've no' paid it yet. We'll see how long I hold out.", fx = { align = { order = 1 } } },
        { text = "Keep paying. He brings hot drink to freezing sentries, and that matters more.", next = "BACK", reply = "That's what the sentries say, when it arrives. He's my brother, so I'll likely pay.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "carry_default", text = "Bread that keeps, a full waterskin under yer coat so it doesnae freeze, an' a bedroll, for ye'll be caught out by dark at least once. An' a flint. Ye'd be amazed how many go down intae a frozen valley wi' nae way tae make a fire." } },
      choices = { { text = "Under the coat. That's sensible.", next = "BACK", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    supply = {
      lines = { { id = "supply_default", text = "Through Coldridge Pass, from Kharanos, when the troggs allow. They've had the tunnel more than once this year. Hands Springsprocket waits at the far end wi' the crates, an' Mountaineer Thalos sees them through when he can spare the rifles." } },
      choices = { { text = "And when the pass is shut?", next = "supply_shut" }, { text = "Something else.", next = "BACK" } },
    },
    supply_shut = {
      lines = { { id = "supply_shut_default", text = "Then we eat boar, an' I ration the bread. I've twelve days' flour put by that naebody kens about but me an' Balir Frosthammer. An' now ye, so I'll thank ye tae keep it tae yerself." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { trait = { discreet = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    tidy = {
      lines = { { id = "tidy_default", text = "Somebody in the family has tae be. Our mother used tae say she had one son who kent where everythin' was an' one who kent where everybody was, an' between us we made a whole dwarf. Nori kens every sentry in Coldridge by name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "feed_default", text = "Thran Khorman, who eats for three an' trains for six. Marryk Nurribit, who'd take his whole ration in ale if I let him. An' wee Felix Whindlebolt, who lost everythin' he had tae the trolls an' is too proud tae ask. I tell him the bread's stale an' would only go tae waste." } },
      choices = { { text = "That's a kind lie.", next = "BACK", reply = "It's stock management. That's what I've written in the book, anyway.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    nori = { { id = "tp_nori", text = "My brother Nori. He's late, he's lost my best kettle twice, an' there's no' a sentry in this valley who wouldnae walk through a blizzard for him." } },
    grundel = { { id = "tp_grundel", text = "Grundel Harkin sells the armour. He's the steadiest dwarf in the hall, an' he never wastes a crumb." } },
    balir = { { id = "tp_balir", text = "Balir Frosthammer has the command. He checks my stores himself, the first o' each month." } },
    background = { { id = "tp_bg", text = "Pridedrifts have kept shop in Coldridge since Anvilmar was built. I keep the shop. Nori keeps the name known." } },
    _none = { { id = "tp_none", text = "I've nae idea. Ask Nori, if ye can catch him. He hears everythin' out there." } },
  },
}

---------------------------------------------------------------------------
-- Burdrak Harglhelm: leather armour at Brewnall Village.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_burdrak", id = TODO_NPC("Burdrak Harglhelm"), name = "Burdrak Harglhelm", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "bluff", "watchful" }, values = { "practical", "brave" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Burdrak Harglhelm sells leather armour at Brewnall Village, the last shop before Iceflow Lake and the Frostmane Hold beyond it. He is bluff and watchful, and keeps a loaded blunderbuss under the counter.",
    third = "{name} met Burdrak Harglhelm, who sells leather armour at Brewnall Village in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Brewnall. Ye're a long way from the road, so ye're either thirsty or lookin' for trouble, an' I sell tae both." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back from the lake, then. Good. No' everybody does, wi' the trolls where they are." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, this far west. Ye'll be after the bears on the ice, or Old Icebeard's hide. I've leathers that'll no' creak in the cold." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Somethin's had a good chew on that jerkin. Ice claw, by the spacin'. Ye'll want a thicker shoulder, an' I've one." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Ye're young for this end o' the valley. The Frostmane Hold's just over the ice, an' they dinnae send their recruits out tae meet ours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Burdrak Harglhelm. I sell leather tae the folk o' Brewnall an' tae whoever's headed out past it. There's nothin' west o' my door but ice, bears an' Frostmane, so I see everybody on their way out, an' I count them on their way back." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Aye, go on, I'm listenin' wi' one ear on the lake." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What's out past the village?", next = "west" },
        { text = "Tell me about Brewnall.", next = "brewnall" },
        { text = "Why leather, out here?", next = "leather" },
        { text = "You keep looking toward the lake.", next = "watch" },
        { text = "Which hides do the hunters bring you?", next = "hides" },
        { text = "Good day, Burdrak.", next = "END" },
      },
    },
    west = {
      lines = { { id = "west_default", text = "Iceflow Lake, wi' the Ganters' fishin' camp out on the ice. Beyond that the Frostmane Hold, cut intae the mountain, where the trolls keep their chief. Senir Whitebeard in Kharanos pays well for word o' what goes on there. South, there's Tundra MacGrann's camp, an' the yeti that robbed him." } },
      choices = { { text = "The yeti robbed him?", next = "west_yeti" }, { text = "Something else.", next = "BACK" } },
    },
    west_yeti = {
      lines = { { id = "west_yeti_default", text = "Old Icebeard. Chased MacGrann out o' his own cave an' sat down on his meat locker. MacGrann's been up a hill ever since, glarin' at it. He'd be grateful tae anybody who fetched his dried meat back, an' he'd say so at length." } },
      choices = { { text = "I may look in on him.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    brewnall = {
      lines = { { id = "brewnall_default", text = "It's a brewers' village. The Barleybrews built it round their vats, an' the rest of us came after tae sell them things. Marleth an' Rejold Barleybrew do the brewin', Keeg Gibn does the sellin', an' I'm the only soul here whose trade isnae drink." } },
      choices = { { text = "You must hear a lot about the Thunderbrews.", next = "brewnall_feud" }, { text = "Something else.", next = "BACK" } },
    },
    brewnall_feud = {
      lines = { { id = "brewnall_feud_default", text = "Mornin', noon an' night. Tae hear Marleth, the Thunderbrews stole the sun. I've drunk both, an' I'll tell ye quietly that they're both grand, an' the whole feud's about whose name is on the cask in Ironforge." } },
      choices = { { text = "I won't repeat that to Marleth.", next = "BACK", reply = "See that ye dinnae, for I've tae live here.", fx = { trait = { discreet = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    leather = {
      lines = { { id = "leather_default", text = "Because mail freezes tae ye. I've seen a mountaineer take off a ring shirt out on the ice an' leave skin in it. Good oiled leather over wool keeps the wind off an' lets ye move. An' out here, movin' quick is worth more than standin' firm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      big = true,
      lines = { { id = "watch_default", text = "Aye. Three nights back there were torches on the far shore, a line o' them, comin' this way an' then turnin' back. The brewers say it's nothin'. I think the Frostmane are learnin' how close they can come. I've half a mind tae cross the ice an' fire a shot, tae let them ken we saw." } },
      choices = {
        { text = "Don't. A shot across the ice could start the very raid you fear.", next = "BACK", reply = "That's Rejold's argument, near enough. Aye. I'll keep the gun under the counter a while yet.", fx = { align = { light = 1 } } },
        { text = "Do it. Show them the village has teeth before they test it.", next = "BACK", reply = "That's my own thinkin'. Trolls respect a thing that bites. I'll wait for a clear night.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hides_default", text = "Ice claw bear, for the heavy coats, an' snow leopard when somebody's been patient. I send the best o' them on tae the Finespindles in Ironforge for sewin', an' they come back a month later lookin' like somethin' a thane would wear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    keeg = { { id = "tp_keeg", text = "Keeg Gibn sells the ale an' wine. He's a cheerful soul, an' he's the only neutral party in the brewers' war." } },
    ganters = { { id = "tp_ganters", text = "Gretta an' Paxton Ganter, out on the ice. They'll no' come in till the lake thaws, an' the lake doesnae thaw." } },
    macgrann = { { id = "tp_macgrann", text = "Tundra MacGrann is a good trapper wi' a bad temper an' worse luck." } },
    background = { { id = "tp_bg", text = "I was a mountaineer at the western posts. When they pulled the post back, I stayed, an' opened a shop where it stood." } },
    _none = { { id = "tp_none", text = "Couldnae say. If it didnae come across the ice, I likely missed it." } },
  },
}

---------------------------------------------------------------------------
-- Keeg Gibn: ale and wine at Brewnall Village; sells for the Barleybrews.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_keeg", id = TODO_NPC("Keeg Gibn"), name = "Keeg Gibn", title = "Ale & Wine",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "cheerful", "diplomatic" }, values = { "hearty", "community" },
  notices = { "drunk", "race" },
  impression = {
    first = "Keeg Gibn sells ale and wine at Brewnall Village, pouring Barleybrew over the counter and keeping a small cask of Thunderbrew out of sight. He is cheerful and careful, and the one neutral party in the brewers' feud.",
    third = "{name} met Keeg Gibn, who sells ale and wine at Brewnall Village in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, welcome! Ye've walked a fair way through the snow, an' there's only one cure for that. What'll ye have?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I kent ye would be. Naebody has just the one Barleybrew." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A late one! Sit ye down by the counter, friend. The vats bubble all night here, an' I've been told it's soothin', if ye dinnae think about it." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ho, ye're well along! Was it mine, or the other lot's? Dinnae answer that where Marleth can hear." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A fellow dwarf! Then I'll no' insult ye wi' the light stuff. I've a stout here that Rejold swears will put a beard on a gnome." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keeg Gibn, an' I sell what the Barleybrews brew. Marleth makes the ale, Rejold makes the stout, an' I pour it an' take the coin an' agree wi' whichever of them spoke last. It's a fine life, so long as naebody says \"Thunderbrew.\"" },
      },
      again = {
        { id = "h_again", text = "What else? Another, maybe?" },
        { id = "h_again2", text = "Aye, ask, I've nothin' but time an' casks." },
      },
      choices = {
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "What's the best thing you pour?", next = "best" },
        { text = "You said not to mention Thunderbrew.", next = "thunderbrew" },
        { text = "Where does your wine come from?", next = "wine" },
        { text = "Who drinks in Brewnall?", next = "drinkers" },
        { text = "What goes into a Barleybrew ale?", next = "brew" },
        { text = "Good health, Keeg.", next = "END" },
      },
    },
    best = {
      lines = { { id = "best_default", text = "Rejold's stout, when he has it. He's convinced the perfect brew wants shimmerweed, off Shimmer Ridge, where the Frostmane grow it. So the best stout in Dun Morogh depends on somebody bein' daft enough tae rob trolls o' their herbs." } },
      choices = { { text = "Has anyone been daft enough?", next = "best_daft" }, { text = "Something else.", next = "BACK" } },
    },
    best_daft = {
      lines = { { id = "best_daft_default", text = "Now an' again. Rejold asks every traveller who looks handy. If ye're headed up that way, have a word wi' him. I'll say only that the batch he made wi' it was the finest thing I ever poured, an' I've been pourin' thirty years." } },
      choices = { { text = "I'll have a word with Rejold.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    thunderbrew = {
      big = true,
      lines = { { id = "thunderbrew_default", text = "Wheesht! Aye, well. I've a wee cask o' Thunder Ale under the floor, for the travellers who ask for it by name. They've walked from Kharanos, they want what they ken. Marleth would skin me. She says a Barleybrew house pours Barleybrew or it's nae house o' hers." } },
      choices = {
        { text = "Pour only Barleybrew. You work for them, and you owe them that.", next = "BACK", reply = "Aye, I ken it. Every time I lift that board I feel like a thief. I may let the cask run dry an' no' fill it.", fx = { align = { honor = 1 } } },
        { text = "Keep the cask. A barman serves the customer, not the feud.", next = "BACK", reply = "That's how I've squared it! A thirsty traveller's a thirsty traveller. Mind where ye step, the board's loose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wine = {
      lines = { { id = "wine_default", text = "Up from Stormwind by way o' the tram an' Ironforge, an' it costs me dear by the time it's crossed the snow. I keep a dozen bottles for the humans who come through, an' for Gretta Ganter, who says ale on the ice freezes an' wine only thickens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drinkers = {
      lines = { { id = "drinkers_default", text = "The brewers, who drink their own an' criticise it. Burdrak Harglhelm, who has one an' watches the lake. The mountaineers, when they patrol this far. An' Tundra MacGrann, when he comes down off his hill tae complain about the yeti, which is weekly." } },
      choices = { { text = "Does MacGrann pay his tab?", next = "drinkers_tab" }, { text = "Something else.", next = "BACK" } },
    },
    drinkers_tab = {
      lines = { { id = "drinkers_tab_default", text = "He pays in jerky, or he did, till Old Icebeard took the lot. He's on credit now, an' I've told him he can settle when he's his locker back. It's a long tab. I'm fond o' the old goat, so I dinnae count too hard." } },
      choices = { { text = "That's neighbourly of you.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "brew_default", text = "Barley up from Loch Modan, hops from the Wetlands, an' water off Iceflow Lake, cut out in blocks an' melted. Marleth says the water's the secret, for it's never been anythin' but ice. Rejold says it's the yeast. They've argued it for ten years over my counter." } },
      choices = { { text = "And what do you say?", next = "BACK", reply = "I say \"aye\" tae each o' them in turn. It's kept me in work a long while.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    marleth = { { id = "tp_marleth", text = "Marleth Barleybrew makes the ale an' the opinions. She's sharp, she's bonny, an' she'll no' hear a good word about Kharanos." } },
    rejold = { { id = "tp_rejold", text = "Rejold Barleybrew is the stout man. He thinks about hops the way a priest thinks about the Light." } },
    burdrak = { { id = "tp_burdrak", text = "Burdrak Harglhelm sells leather next door. He was a mountaineer, an' he's never quite come off watch." } },
    background = { { id = "tp_bg", text = "I poured at the Stonefire in Ironforge when I was young. I came out here for the quiet, an' found brewers." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Have a drink, an' maybe it'll come tae one of us." } },
  },
}

---------------------------------------------------------------------------
-- Gretta Ganter: fishing supplies at the Ganters' camp on Iceflow Lake.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gretta_g", id = TODO_NPC("Gretta Ganter"), name = "Gretta Ganter", title = "Fishing Supplies", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "tart", "hardy" }, values = { "practical", "family" },
  notices = { "cold", "race" },
  impression = {
    first = "Gretta Ganter sells fishing tackle from a camp on the ice of Iceflow Lake, where she and her husband Paxton fish through holes they cut themselves. She is tart, hardy and unimpressed by the trolls across the water.",
    third = "{name} met Gretta Ganter, who sells fishing supplies on Iceflow Lake in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Mind where ye put yer feet! The holes are marked wi' the red flags, an' I'll no' be fishin' ye out o' one." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye didnae fall in last time, so ye're welcome back." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "An angler! Good. What are ye usin' for bait? No, dinnae tell me, I can smell it. That'll never do here." },
  },
  notice = {
    { id = "n_cold", cat = "cold", when = { durability = { max = 0.3 } },
      text = "Ye're half frozen an' yer gear's in tatters. Get by the brazier before ye say another word." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ye walk on the ice as if it were a floor. Lighter on yer feet than a dwarf, I'll give ye that. Paxton went through twice his first winter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gretta Ganter. My husband Paxton teaches the fishin', an' I sell the poles, the line an' the bait, an' mend the nets while he talks. We've camped on this lake eleven winters, an' I can tell ye how thick the ice is by the sound o' yer boots." },
      },
      again = {
        { id = "h_again", text = "What else? I've a net tae mend." },
        { id = "h_again2", text = "Aye, ask, an' stay off the thin bit there." },
      },
      choices = {
        { text = "Show me your tackle.", next = "BUSINESS" },
        { text = "Why live out on the ice?", next = "ice" },
        { text = "What do you catch here?", next = "catch" },
        { text = "The Frostmane Hold is just across the lake.", next = "trolls" },
        { text = "What's your husband like to work beside?", next = "paxton" },
        { text = "What bait works under the ice?", next = "bait" },
        { text = "Tight lines, Gretta.", next = "END" },
      },
    },
    ice = {
      lines = { { id = "ice_default", text = "Because the fish are under it. Paxton said that tae me the day we wed, as if it settled the matter, an' I suppose it did. A cottage in Brewnall would be warmer, but ye'd spend half the day walkin' tae yer own holes, an' somebody would rob them." } },
      choices = { { text = "Who robs a fishing hole?", next = "ice_rob" }, { text = "Something else.", next = "BACK" } },
    },
    ice_rob = {
      lines = { { id = "ice_rob_default", text = "Bears. An ice claw will sit by a hole I've cut an' wait for the fish tae rise, the lazy great lump. I've chased three off wi' a ladle. Paxton says tae leave them, for they were fishin' this lake before we were." } },
      choices = {
        { text = "He has a point.", next = "BACK", reply = "He has, an' he's no' the one who cuts the holes.", fx = { trait = { witty = 1 } } },
        { text = "A ladle against a bear is bold.", next = "BACK", reply = "It's a big ladle. An' I've a loud voice.", fx = { trait = { brave = 1 } } },
      },
    },
    catch = {
      lines = { { id = "catch_default", text = "Loch frenzy an' longjaw mud snapper, an' a slitherskin mackerel when the luck's in. The brilliant smallfish come up in shoals at dusk. Gremlock Pilsnor at Kharanos takes all we can send, an' complains it's never enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      big = true,
      lines = { { id = "trolls_default", text = "Aye, I can see their fires from my bed. They fish the far side an' we fish this, an' in eleven winters they've never crossed, nor have we. There's a line down the middle naebody drew. The mountaineers want us off the lake, for our own safety, they say." } },
      choices = {
        { text = "Stay. You've kept the peace on that ice better than any patrol.", next = "BACK", reply = "That's my mind. We leave them be, they leave us be. If we go, the next folk on this ice will be soldiers.", fx = { align = { light = 1 } } },
        { text = "Go. No quiet lasts with Frostmane, and you'll be the first they reach.", next = "BACK", reply = "So the mountaineers say, an' they may be right. But I've mended nets in sight o' those fires a long while tae start runnin' now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paxton = {
      lines = { { id = "paxton_default", text = "He's the best angler in Khaz Modan, an' he'd fish through his own funeral. He'll stand at a hole six hours an' no' feel the cold, an' then come in an' tell me the kettle's too hot. I've stopped expectin' sense. I married him for his patience, an' he's plenty." } },
      choices = { { text = "Six hours takes a certain kind of dwarf.", next = "paxton_kind" }, { text = "Something else.", next = "BACK" } },
    },
    paxton_kind = {
      lines = { { id = "paxton_kind_default", text = "It does, an' ye'll no' find another. Go an' have him teach ye. He'll no' say twenty words, but ye'll come away able tae feel a nibble through yer mittens, an' that's worth a winter o' somebody else's talkin'." } },
      choices = { { text = "I'll go and see him.", next = "BACK" } },
    },
    bait = {
      lines = { { id = "bait_default", text = "Somethin' that shines. It's dark down there, an' a fish will come a long way tae look at a bit o' polished tin. Worms are nae use, they freeze stiff before they're through the hole. I keep mine in my mittens when I must use them, an' Paxton pretends no' tae ken." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    paxton = { { id = "tp_paxton", text = "My husband. He talks tae the fish more than tae me, an' I've decided no' tae mind." } },
    keeg = { { id = "tp_keeg", text = "Keeg Gibn in Brewnall keeps wine for me. Ale freezes out here, an' wine only thickens." } },
    burdrak = { { id = "tp_burdrak", text = "Burdrak Harglhelm watches the lake from the village. He frets about the trolls more than we do, an' we're nearer." } },
    background = { { id = "tp_bg", text = "I was a net-maker's daughter in Thelsamar. I came tae this lake for a husband, an' stayed for the quiet." } },
    _none = { { id = "tp_none", text = "I dinnae ken that. If it swims, ask me. If it doesnae, ask in the village." } },
  },
}

---------------------------------------------------------------------------
-- Paxton Ganter: fishing trainer on Iceflow Lake.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_paxton", id = TODO_NPC("Paxton Ganter"), name = "Paxton Ganter", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "placid", "sparing" }, values = { "patient", "nature" },
  notices = { "craft", "class" },
  impression = {
    first = "Paxton Ganter teaches fishing through the ice of Iceflow Lake and can stand at a hole for six hours without shifting his feet. He is placid and sparing with words, and saves most of them for the fish.",
    third = "{name} met Paxton Ganter, the fishing trainer on Iceflow Lake in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Wheesht a moment, I've one nosin' at the line. Ach, he's gone, an' it's nae matter. Good day tae ye." },
    { id = "g_back", when = { metBefore = true }, text = "Aye, ye're back. Stand downwind o' the hole, if ye would." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "Ye fish. I can tell by how ye came up. Ye walked soft the last ten yards." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Ye've a callus on yer first finger from the line. That's a few hundred hours. It's a start." },
    { id = "n_loud", cat = "class", when = { class = "WARRIOR" },
      text = "Ye clank. The fish can hear that through four feet o' ice. Stand still, or stand further off." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Paxton Ganter. I fish, an' I teach it. Gretta sells the gear, yonder. There's no' much tae say about fishin' that the fish cannae tell ye better, but I'll say what there is." },
      },
      again = {
        { id = "h_again", text = "Aye?" },
        { id = "h_again2", text = "Go on. Quietly." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "How do you fish through ice?", next = "hole" },
        { text = "You don't say much.", next = "quiet" },
        { text = "Doesn't the cold trouble you?", next = "cold" },
        { text = "What's the biggest thing in this lake?", next = "big" },
        { text = "Your wife chases bears from your holes.", next = "bears" },
        { text = "Tight lines, Paxton.", next = "END" },
      },
    },
    hole = {
      lines = { { id = "hole_default", text = "Cut it no wider than yer two hands. A wide hole lets in light, an' the fish below see the sky where there shouldnae be one. Drop the line till it touches bottom, an' lift it the length o' yer forearm. Then ye wait." } },
      choices = { { text = "How long do you wait?", next = "hole_wait" }, { text = "Something else.", next = "BACK" } },
    },
    hole_wait = {
      lines = { { id = "hole_wait_default", text = "Till it's time, an' that's no' a jest. Ye'll feel the line go a wee bit heavier, like a thought ye've no' quite had. Folk pull then, an' they're too soon. Count three more breaths, an' then lift, smooth, as if ye didnae care." } },
      choices = { { text = "Three breaths after the weight. I'll try it.", next = "BACK", reply = "Aye. Ye'll pull too soon the first ten times. Everybody does.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "quiet_default", text = "Sound goes through ice like through a drum. Every word I say up here, they hear down there. So I've got out o' the way o' it. Gretta says I've said more tae ye already than tae her this week, an' she's likely right." } },
      choices = { { text = "I'm honoured, then.", next = "BACK", reply = "Hm, dinnae be. Ye asked, an' she doesnae need tae.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "cold_default", text = "No. Ye stop fightin' it. A body that shivers is a body arguin' wi' the weather. Stand easy, breathe slow, an' let it be cold. It's cold whether ye mind or no'." } },
      choices = {
        { text = "I'm not sure I could learn that.", next = "BACK", reply = "Ye could. It takes a winter. I'd no' recommend it tae anybody wi' somewhere else tae be.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big = {
      lines = { { id = "big_default", text = "There's a longjaw down by the east shelf as long as I am. I've had him on the line four times in eleven years. Gretta's seen him. I could take him wi' a net an' a second pair o' hands." } },
      choices = { { text = "Then why haven't you?", next = "big_why" }, { text = "Something else.", next = "BACK" } },
    },
    big_why = {
      big = true,
      lines = { { id = "big_why_default", text = "Because then he'd be caught, an' I'd have nothin' tae wait for. Gremlock at Kharanos has offered good coin for a fish that size, an' we could use it. Gretta says a fish is a fish. I'm no' so sure this one is." } },
      choices = {
        { text = "Leave him. Some things are worth more in the water than on a plate.", next = "BACK", reply = "Aye. That's how it sits wi' me. He's the best company on this lake, after Gretta.", fx = { align = { light = 1 } } },
        { text = "Net him. Sentiment won't mend your tent or fill your larder.", next = "BACK", reply = "That's what Gretta says, an' she keeps the purse. Maybe next winter. I've said that ten winters now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bears = {
      lines = { { id = "bears_default", text = "She does, wi' a ladle. I've told her tae leave them. A bear at a hole means there's fish under it, an' he's savin' me the trouble o' lookin'. I wait till he's had his, an' then I take my turn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gretta = { { id = "tp_gretta", text = "My wife. She does the talkin' for both of us, an' the mendin', an' the sums. I do the fishin'." } },
    lake = { { id = "tp_lake", text = "Iceflow. It's never thawed in my time. There's fish under there that have never seen a dwarf." } },
    trolls = { { id = "tp_trolls", text = "They're across the water, an' they fish their own side. They're good at it, I'll say that." } },
    background = { { id = "tp_bg", text = "I fished Loch Modan as a lad, but there were too many folk about, so I came here." } },
    _none = { { id = "tp_none", text = "Dinnae ken. The fish havenae mentioned it." } },
  },
}

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
P:NPC {
  key = "mf_turuk", id = TODO_NPC("Turuk Amberstill"), name = "Turuk Amberstill", title = "Dwarven Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "blunt", "proud" }, values = { "family", "craft" },
  notices = { "weapon", "mount" },
  impression = {
    first = "Turuk Amberstill is the one Amberstill who makes weapons rather than raising rams, and he sells them from the ranch east of Kharanos. He is blunt and proud, and his daughter Yarlyn's rabbit has the run of his forge.",
    third = "{name} met Turuk Amberstill, the weaponsmith at Amberstill Ranch in Dun Morogh.",
  },
  greetings = {
    { id = "g_hi", text = "Aye? If it's rams ye want, see Veron. If ye want somethin' tae keep the wolves off them, ye've found the right Amberstill." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did ye see a wee lass an' a rabbit go by? No? Then she's in the pen again, an' I'll have words." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Rudra will have told ye about Vagash. If ye mean tae go after that beast, take an axe as well as yer rifle, for it'll no' stay at range." },
  },
  notice = {
    { id = "n_kit", cat = "weapon", when = { durability = { max = 0.3 } },
      text = "That blade's seen hard use an' nae oil. This is ram country. There's lanolin in every shed, an' nae excuse for a rusty edge." },
    { id = "n_mounted", cat = "mount", when = { mounted = true, race = "Dwarf" },
      text = "That's one o' ours ye're ridin', by the set o' the horns. Veron chose ye well. See ye're worthy o' the beast." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Turuk Amberstill. The family breeds rams, an' I make what guards them. Axes, mostly, an' a few good hammers. Every herder on this ranch carries my work, an' so do half the mountaineers at the Kharanos post." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Aye. Ask it." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "An Amberstill who doesn't raise rams?", next = "rams" },
        { text = "What threatens the herd?", next = "threat" },
        { text = "Is that your daughter chasing a rabbit?", next = "yarlyn" },
        { text = "What do you forge for a herder?", next = "herder" },
        { text = "Where did you learn the forge?", next = "learn" },
        { text = "Good day, Turuk.", next = "END" },
      },
    },
    rams = {
      lines = { { id = "rams_default", text = "I've nae patience for them. Rudra can stand in a pen all day sweet-talkin' a beast that's just kicked her. Veron can look a ram in the eye an' ken its grandsire. I look at one an' see mutton. So I took up the hammer, an' the family was glad tae have a smith." } },
      choices = { { text = "Did they take it well at first?", next = "rams_well" }, { text = "Something else.", next = "BACK" } },
    },
    rams_well = {
      lines = { { id = "rams_well_default", text = "My father didnae speak tae me for a season. Then a wolf pack came down in the hard winter, an' the herders held the low pasture wi' my axes. He walked intae the forge after, looked at the rack, an' said \"Make more.\" That was the end o' it." } },
      choices = { { text = "\"Make more\" is high praise, from a dwarf.", next = "BACK", reply = "It's the only kind he had. I've it carved over the door.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "threat_default", text = "Wolves, always. Frostmane raiders on the low pasture, who take a ram an' are gone before ye can shout. An' Vagash on the high ground, a great white brute that's been killin' our stock for years. Rudra's askin' every traveller tae hunt it." } },
      choices = { { text = "Have you gone after Vagash yourself?", next = "threat_vagash" }, { text = "Something else.", next = "BACK" } },
    },
    threat_vagash = {
      big = true,
      lines = { { id = "threat_vagash_default", text = "Once, wi' two herders, an' it broke one lad's arm an' was gone up the rocks. I've a mind tae go again, alone, wi' the big axe. Rudra says I've a bairn an' a forge an' nae business dyin' on a mountain for pride. She's likely right, an' it still galls me." } },
      choices = {
        { text = "Rudra's right. Your daughter needs a father more than the ranch needs a trophy.", next = "BACK", reply = "Aye, I ken it. I look at the wee one an' I ken it, an' the axe stays on the wall.", fx = { align = { light = 1 } } },
        { text = "Go. A dwarf settles his own family's score himself.", next = "BACK", reply = "That's what my blood says. If ye hear I've gone up the mountain, tell Rudra it wasnae yer idea.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yarlyn = {
      lines = { { id = "yarlyn_default", text = "Aye, that's my Yarlyn, an' that's Fluffy, an' between them they've been through my forge six times since breakfast. She breeds the things. She sells them, too, tae travellers, an' drives a harder bargain than Veron." } },
      choices = { { text = "She takes after the family, then.", next = "BACK", reply = "She does. She's the rams' patience an' my temper. Stone help whoever she marries.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    herder = {
      lines = { { id = "herder_default", text = "A hand axe wi' a hammer poll on the back. The blade's for wolves an' the poll's for fence posts, an' ye'll use the poll ten times for every once ye use the blade. A weapon ye only carry for fightin' gets left in the shed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "learn_default", text = "Under Tognus Flintfire, at Kharanos. He had me make two hundred nails an' then shoe a ram, an' the ram he chose was one o' ours, the worst-tempered beast Veron ever bred. I'd kent that ram since it was a lamb. It kicked me anyway." } },
      choices = { { text = "Family counts for nothing with a ram.", next = "BACK", reply = "Less than nothin'. That's the first thing an Amberstill learns.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    veron = { { id = "tp_veron", text = "Veron sells the rams, an' he's particular who tae. He's turned away lords. I've never seen him wrong about a rider." } },
    rudra = { { id = "tp_rudra", text = "Rudra raises the herd. She's the hardest worker on the ranch, an' the only one who can tell me I'm bein' a fool an' have me listen." } },
    yarlyn = { { id = "tp_yarlyn", text = "My daughter. Seven years old, an' she's already a better trader than I'll ever be." } },
    background = { { id = "tp_bg", text = "Born on this ranch, same as all of us. I learned the forge under Tognus Flintfire at Kharanos." } },
    _none = { { id = "tp_none", text = "Dinnae ken. Ask Veron, he talks tae more folk than I do." } },
  },
}

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
P:NPC {
  key = "mf_gretta", id = TODO_NPC("Gretta Finespindle"), name = "Gretta Finespindle", title = "Apprentice Leatherworker", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "patient", "cheerful" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Gretta Finespindle teaches beginners at the family leather shop by the Great Forge. She is patient with clumsy hands, keeps a box of everyone's first ruined stitches, and says the box is the most useful thing in the shop.",
    third = "{name} met Gretta Finespindle, who teaches beginning leatherworkers at Finespindle's Leather Goods in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! If you've never held an awl before, you've come to exactly the right table, because this one is mine and it's for beginners." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, you're back! Show me your hands, and I'll tell you whether you've been practising." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker already! Let me see a seam of yours, any seam, and then we'll know where to start." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin, don't you? There's a nick on your thumb in exactly the place the knife slips. Balthus in the corner can cure you of that in an afternoon." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You'll find the stools a little low, I'm afraid. We keep one dwarf-sized bench by the rack, and Balthus says you may borrow it if you put it back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Gretta Finespindle, and I teach the first steps of leatherworking, which are mostly about not stabbing yourself. My cousin Fimble takes people once they can sew a straight line, and my whole job is getting them to that line." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "I'm Gretta Finespindle, and I teach the first steps of leatherworking. It's nice to see a gnome at my table, because the needles are already the right size for you and I don't have to apologise for the stools." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've a strap soaking, but it can soak." },
        { id = "h_again2", text = "Go on, ask! Questions are what the beginners' table is for." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What do beginners get wrong first?", next = "wrong" },
        { text = "I see a box of scraps under your table.", next = "box" },
        { text = "How do the Finespindles share one shop?", next = "family" },
        { text = "Where should a new leatherworker find hides?", next = "hides" },
        { text = "Goodbye, Gretta.", next = "END" },
      },
    },
    wrong = {
      lines = { { id = "wrong_default", text = "They pull the thread too tight, every single one of them. They think a tight stitch is a strong stitch, and then the leather puckers and tears at the holes, and they look at me as though the hide had betrayed them." } },
      choices = { { text = "How do you cure them of it?", next = "wrong_cure" }, { text = "Something else.", next = "BACK" } },
    },
    wrong_cure = {
      lines = { { id = "wrong_cure_default", text = "I have them sew one seam with their eyes shut. You can't see the stitch, so you have to feel when the thread sits snug, and after twenty stitches their fingers know something their eyes never told them." } },
      choices = {
        { text = "I'll try it with my eyes shut.", next = "BACK", reply = "Do it sitting down, please, and with the awl put away first.", fx = { affinity = 1 } },
        { text = "That sounds like a way to lose a finger.", next = "BACK", reply = "Only with the awl, and I take the awl away first. I'm patient, not careless.", fx = { trait = { cautious = 1 } } },
      },
    },
    box = {
      lines = { { id = "box_default", text = "You noticed! That's the first-stitch box. Every student leaves me the first thing they ever sewed, however dreadful, and when they come back months later complaining that they're not improving, I take it out and show them." } },
      choices = { { text = "Is Fimble's first stitch in there?", next = "box_fimble" }, { text = "Something else.", next = "BACK" } },
    },
    box_fimble = {
      lines = { { id = "box_fimble_default", text = "He says not, and he says it very quickly. I've a little crooked coin purse at the bottom with an F burned into it, though, and I'm keeping it for the day he's too hard on one of my beginners." } },
      choices = {
        { text = "Keep it safe. Everyone starts somewhere.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "You should hang it over his bench.", next = "BACK", reply = "Oh, I couldn't! Well, I could, and that's rather the point of having it.", fx = { trait = { witty = 1 } } },
      },
    },
    family = {
      lines = { { id = "family_default", text = "Everybody has a corner, and nobody touches anybody else's. Fimble has the bench, Bombus has the counter and the books, Lissyphus fits the armour, and I have this table. Balthus Stoneflayer has the skinning corner, and he's the only one of us who never argues." } },
      choices = { { text = "And when you do argue?", next = "family_argue" }, { text = "Something else.", next = "BACK" } },
    },
    family_argue = {
      lines = { { id = "family_argue_default", text = "Then it's at stocktaking, and it's about thread. Bombus counts it, Fimble uses it, and I give far too much of it away to students who've run short. I'm told this is a failing, but I notice the students come back." } },
      choices = { { text = "A little free thread buys a loyal customer.", next = "BACK", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "hides_default", text = "Start with the crag boars and the wolves of Dun Morogh, because light leather forgives mistakes and there's no shortage of it. Learn to skin, or make friends with someone who does, and salt everything the same day you take it." } },
      choices = { { text = "I'll remember the salt.", next = "BACK" } },
    },
  },
  topics = {
    fimble = { { id = "tp_fimble", text = "Fimble is the best leatherworker in Ironforge, and he fusses, and both of those things are true at once. I send him my students when they're ready, and he sends them back when they're not." } },
    bombus = { { id = "tp_bombus", text = "Bombus keeps the books and sells the supplies. He's the kindest of us, though he hides it behind a ledger." } },
    balthus = { { id = "tp_balthus", text = "Balthus Stoneflayer says about ten words a day, and they're always the right ten. The beginners are a little afraid of him, which is good for their knife work." } },
    background = { { id = "tp_bg", text = "We made belting for the machines in Gnomeregan. I was still learning when we left, so I finished my lessons here, by the Forge." } },
    _none = { { id = "tp_none", text = "I'm afraid that's past the beginners' table. Fimble might know, or Bombus, if it has a price." } },
  },
}

---------------------------------------------------------------------------
-- Groum Stonebeard: journeyman blacksmith at the Great Anvil, Rotgath's son.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_groum", id = TODO_NPC("Groum Stonebeard"), name = "Groum Stonebeard", title = "Journeyman Blacksmith",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "earnest", "patient" }, values = { "craft", "family" },
  notices = { "kit", "craft" },
  impression = {
    first = "Groum Stonebeard is a journeyman smith at the Great Anvil who teaches beside his father Rotgath. He is patient at the forge, hungry for a word of praise, and has learned not to expect it from that direction.",
    third = "{name} met Groum Stonebeard, a journeyman blacksmith who teaches at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the sparks, friend. If ye've come tae learn the hammer, I can take ye as far as a journeyman goes, an' my father can take ye on from there." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil, are ye? Good, for I've a bar heatin' an' I could use somebody tae tell me the colour." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith! Show me yer hammer hand. Aye, ye've the callus in the right place, so somebody taught ye properly." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's near fallin' off ye. I cannae mend it for ye here, but there's a repair man two steps away, an' I'd no' leave the city wi'out seein' him." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye dig yer own ore? Then ye already ken half o' what I teach, for a smith who's never swung a pick doesnae ken what he's meltin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Groum Stonebeard, journeyman o' the Great Anvil. I teach the second stretch o' the craft, when a smith can make a nail but cannae yet make a blade. The first stretch an' the last belong tae older beards than mine." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye? The bar will keep a minute yet." },
        { id = "h_again2", text = "Aye, go on, I'm listenin' wi' one ear an' watchin' the fire wi' the rest o' me." },
      },
      choices = {
        { text = "Train me in blacksmithing.", next = "BUSINESS" },
        { text = "You work beside your father.", next = "father" },
        { text = "What does a journeyman smith need to learn?", next = "learn" },
        { text = "Tell me about the Great Anvil.", next = "anvil" },
        { text = "A gnome told me he borrowed you to pace the Forge.", next = "paces", when = { race = "Gnome" } },
        { text = "Who else works the Forge?", next = "others" },
        { text = "Keep your fire hot, Groum.", next = "END" },
      },
    },
    father = {
      lines = { { id = "father_default", text = "Aye, Rotgath's my father, an' he stands just there, where he can see every stroke I make. He's taught half the smiths in this hall, an' I'm the only one o' them he's never once told a piece was good." } },
      choices = {
        { text = "He may be prouder than he says.", next = "father_proud" },
        { text = "That would wear on anyone.", next = "father_proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_proud = {
      big = true,
      lines = { { id = "father_proud_default", text = "So Thurgrum Deepforge tells me, when my father's back is turned. I've thought o' takin' a bench somewhere he cannae watch me, in Thelsamar maybe, an' findin' out whether I'm any good wi'out him lookin' on." } },
      choices = {
        { text = "Stay. A craft handed from father to son is worth some hard silence.", next = "BACK", reply = "Aye, an' it's his hammer I'll have one day. I suppose I can wait for the word that goes wi' it.", fx = { align = { order = 1 } } },
        { text = "Go. You'll never know your own worth standing in his shadow.", next = "BACK", reply = "That's what I tell myself at night, an' in the mornin' I light his fire for him anyway. I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "learn_default", text = "Patience wi' the heat. A beginner learns tae hit, an' a journeyman has tae learn when no' tae. Black iron an' steel will crack on ye if ye strike them a shade too cold, an' ye cannae hear the crack till the piece is finished." } },
      choices = { { text = "How do you judge the heat?", next = "learn_heat" }, { text = "Something else.", next = "BACK" } },
    },
    learn_heat = {
      lines = { { id = "learn_heat_default", text = "By colour, an' never by the clock. Straw yellow for most work, an' cherry for the heavy drawin' out. I learned it in a dark corner o' the hall, for the Forge's own glow will fool yer eye if ye let it." } },
      choices = { { text = "Straw for most work, cherry for drawing out.", next = "BACK", reply = "That's it. Ye listen better than I did at yer age.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    paces = {
      lines = { { id = "paces_default", text = "Burbik Gearspanner! Aye, he had me walk the ring six times while he counted my steps, so he'd ken how far a dwarf will go for a box o' rivets. I told him it was the most gnomish thing I'd ever heard, an' he thanked me." } },
      choices = { { text = "He meant it as thanks, too.", next = "BACK", reply = "I ken he did, an' his stall's eleven paces nearer the anvil now, so who's the fool?", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    anvil = {
      lines = { { id = "anvil_default", text = "It's the heart o' the mountain. The lava runs under the floor in channels cut before my grandfather's grandfather was born, an' it's never been let go cold. Every smith in Ironforge has struck a piece on the Great Anvil, an' ye can feel it in the ring." } },
      choices = { { text = "I can hear the ring from here.", next = "BACK" } },
    },
    others = {
      lines = { { id = "others_default", text = "Bengus Deepforge is master o' the hall an' teaches the craft entire. Grumnus Steelshaper has the armourers an' Ironus Coldsteel the weaponsmiths, an' Thurgrum Deepforge sells the flux an' coal. My father an' I take the ones in between." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    rotgath = { { id = "tp_rotgath", text = "Rotgath Stonebeard, my father. He's the best teacher in the hall an' the hardest, an' he'd say those were the same thing." } },
    ironus = { { id = "tp_ironus", text = "Ironus Coldsteel teaches the weaponsmiths. He's a quiet one, an' kinder tae the young smiths than ye'd guess from the look o' him." } },
    bengus = { { id = "tp_bengus", text = "Bengus Deepforge runs the hall. If ye want tae ken the whole craft from nail tae breastplate, he's the dwarf." } },
    background = { { id = "tp_bg", text = "Born in Ironforge, raised in the smoke. I could tell the colour o' hot steel before I could read." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I ken iron, an' no' a great deal else yet." } },
  },
}

---------------------------------------------------------------------------
-- Rotgath Stonebeard: expert blacksmith at the Great Anvil, Groum's father.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_rotgath", id = TODO_NPC("Rotgath Stonebeard"), name = "Rotgath Stonebeard", title = "Expert Blacksmith",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "stern", "proud" }, values = { "craft", "tradition" },
  notices = { "kit", "craft" },
  impression = {
    first = "Rotgath Stonebeard teaches expert smiths at the Great Anvil and has no praise to spare for anyone, least of all his son Groum. He watches the lad's every stroke all the same, and misses none of them.",
    third = "{name} met Rotgath Stonebeard, an expert blacksmith who teaches at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Stand clear o' the quench trough. If ye've come tae learn, show me what ye can do first, an' I'll tell ye whether I've anythin' tae add." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. I hope ye've been at an anvil since I saw ye, for I can tell if ye havenae." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, are ye? We'll see about that, for there are a great many folk in this city who own a hammer." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear's a disgrace. Whoever made it did honest work, an' ye've let it go tae ruin. See it mended before ye stand at my forge." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye hold yer shoulders like a smith, at least. That's more than I can say for most who come askin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rotgath Stonebeard. I teach smiths who already ken their trade an' want tae ken it better. I've stood at this anvil forty years, an' I've nae patience for anybody who wants the skill wi'out the sweat." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, the iron willnae wait on talk." },
        { id = "h_again2", text = "Aye. Ask it." },
      },
      choices = {
        { text = "Train me in blacksmithing.", next = "BUSINESS" },
        { text = "Your son teaches beside you.", next = "son" },
        { text = "What marks an expert's work?", next = "expert" },
        { text = "You don't hand out praise easily.", next = "praise" },
        { text = "What would you have a dwarf forge first?", next = "first", when = { race = "Dwarf" } },
        { text = "Who else teaches at the Great Anvil?", next = "hall" },
        { text = "Good day, Master Stonebeard.", next = "END" },
      },
    },
    son = {
      lines = { { id = "son_default", text = "Groum. Aye, he's mine. He's a fair hand wi' the hammer, an' he'd be a better one if he didnae look over at me after every stroke tae see what I made of it." } },
      choices = {
        { text = "He's waiting to hear that he's good.", next = "son_word" },
        { text = "What do you make of it?", next = "son_word" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_word = {
      big = true,
      lines = { { id = "son_word_default", text = "He's better than I was at his age, an' that's the truth, an' ye'll no' repeat it. My own father never told me I was any good, an' I worked like a dwarf possessed tae prove him wrong. I've thought it did me nae harm." } },
      choices = {
        { text = "Tell him. A word from you would cost nothing and mean everything.", next = "BACK", reply = "Hmph. It'd cost me a good deal, as it happens. But I heard ye.", fx = { align = { light = 1 } } },
        { text = "Keep silent. Hunger made you a master, and it will make him one.", next = "BACK", reply = "Aye, so I've always held. I only wish the lad didnae look quite so much like his mother when he's disappointed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    expert = {
      lines = { { id = "expert_default", text = "Ye cannae see where it was made. A journeyman's piece shows every blow, an' ye can count them. An expert's piece looks as if the metal grew that way, an' the work's all hidden inside it." } },
      choices = { { text = "How long does that take to learn?", next = "expert_long" }, { text = "Something else.", next = "BACK" } },
    },
    expert_long = {
      lines = { { id = "expert_long_default", text = "I'll tell ye when I've learned it. Forty years, an' I still finish a blade now an' then that I'd no' put my mark on. Those ones go back in the fire, an' naebody sees them but me." } },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Even masters throw work away, then.", next = "BACK", reply = "The good ones throw away more than anybody. Mind that.", fx = { trait = { curious = 1 } } },
      },
    },
    praise = {
      lines = { { id = "praise_default", text = "Praise is cheap, an' the folk who give it out freely are the ones whose students make cheap work. Bengus Deepforge says I'm too hard, an' Thurgrum Deepforge goes behind me tellin' the young ones they're doin' fine. I let him, for somebody ought tae." } },
      choices = { { text = "So you do know he does it.", next = "BACK" } },
    },
    first = {
      lines = { { id = "first_default", text = "A pick. No' a sword, whatever the young ones want. Make the tool that digs the ore, an' use it a season, an' ye'll forge like a dwarf who kens where iron comes from. Our fathers did it so, an' so will ye if ye learn from me." } },
      choices = { { text = "A pick first, then. That's the old way.", next = "BACK", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hall = {
      lines = { { id = "hall_default", text = "Bengus Deepforge has the hall an' the beginners, an' Grumnus Steelshaper an' Ironus Coldsteel take the armourers an' the weaponsmiths once they've chosen. Thurgrum Deepforge sells the coal an' flux, since his arm was burned an' he cannae swing a hammer the day long, an' he's far too soft on my son." } },
      choices = {
        { text = "A burned smith who still serves the forge has my respect.", next = "BACK", reply = "Aye, an' mine. He kens more about coal than the rest of us put together.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    groum = { { id = "tp_groum", text = "My son. He's the makin's of a master, an' I'll thank ye no' tae tell him I said so." } },
    bengus = { { id = "tp_bengus", text = "Bengus Deepforge is master o' this hall. He's soft on the beginners, but I'll grant he kens his steel." } },
    ironus = { { id = "tp_ironus", text = "Ironus Coldsteel makes a fine blade, finer than a dwarf has any right tae at his years. I've never worked out who taught him." } },
    background = { { id = "tp_bg", text = "Stonebeards have worked the Great Forge since it was lit. That's all the history I need." } },
    _none = { { id = "tp_none", text = "That's nae business o' mine. Ask somebody wi' time tae gossip." } },
  },
}

---------------------------------------------------------------------------
-- Jemma Quikswitch: journeyman engineer at Springspindle's Gadgets, Tinker Town; Trixie's younger sister.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_jemma", id = TODO_NPC("Jemma Quikswitch"), name = "Jemma Quikswitch", title = "Journeyman Engineer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "brisk", "exact" }, values = { "craft", "knowledge" },
  notices = { "craft", "race" },
  impression = {
    first = "Jemma Quikswitch teaches journeyman engineers at Springspindle's Gadgets in Tinker Town. She measures everything twice and writes it down, mostly because her sister Trixie does neither.",
    third = "{name} met Jemma Quikswitch, a journeyman engineer at Springspindle's Gadgets in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Please don't touch the bench on the left, it's Trixie's, and I can't tell you which parts of it are live." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and with the same number of fingers, I see. That's a good sign in a student." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Splendid. Tell me the last thing you built and the last thing that went wrong with it, in that order." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "There's a powder burn on your left cuff, about two days old. You measured by eye, didn't you? Everybody does, once." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in Tinker Town! Mind the pipes at the door, they're hung at exactly the height of a dwarven forehead, and not on purpose." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jemma Quikswitch. I teach the middle part of engineering, where you stop following plans and start understanding them. Springspindle teaches the rest, when he isn't busy abolishing the wheel." },
      },
      again = {
        { id = "h_again", text = "What else can I explain? I've the diagrams right here." },
        { id = "h_again2", text = "Yes? Ask away, I've only the one fuse to trim." },
      },
      choices = {
        { text = "Train me in engineering.", next = "BUSINESS" },
        { text = "You and Trixie seem to work very differently.", next = "sister" },
        { text = "What does a journeyman engineer learn?", next = "learn" },
        { text = "Springspindle wants to abolish the wheel.", next = "wheel" },
        { text = "What did you save from Gnomeregan?", next = "saved", when = { race = "Gnome" } },
        { text = "Where do you get your parts?", next = "parts" },
        { text = "Goodbye, Jemma.", next = "END" },
      },
    },
    sister = {
      lines = { { id = "sister_default", text = "We do! Trixie is my older sister and the better engineer, and she has never written down a measurement in her life. She builds a thing, it works, and then she can't tell anyone how, so I follow her about with a notebook." } },
      choices = { { text = "Doesn't that drive you mad?", next = "sister_mad" }, { text = "Something else.", next = "BACK" } },
    },
    sister_mad = {
      big = true,
      lines = { { id = "sister_mad_default", text = "Daily. She says a real engineer feels the tolerances, and that my notebooks slow down the inventing. I say that a device nobody else can build is a trick and not engineering, and then one of her devices does something wonderful and I lose the argument for a week." } },
      choices = {
        { text = "You're right. Knowledge that isn't written down dies with its maker.", next = "BACK", reply = "Thank you! I'm going to write that down, which I realise proves the point.", fx = { align = { order = 1 } } },
        { text = "She's right. Rules and notebooks never invented anything.", next = "BACK", reply = "Oh, don't tell her that, she'll have it engraved. She may even be right, but somebody still has to label the wires.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "learn_default", text = "Tolerances, mostly. A beginner makes a part that fits, and a journeyman makes a part that fits every time, in the cold, after it's been dropped. The difference is about a hair's width, and that hair is the whole of my lessons." } },
      choices = { { text = "How do you measure a hair's width?", next = "learn_measure" }, { text = "Something else.", next = "BACK" } },
    },
    learn_measure = {
      lines = { { id = "learn_measure_default", text = "With calipers I made myself, and I check them each morning against a brass block I carried out of Gnomeregan. It's the only thing in this shop I know to be exactly the size it claims to be." } },
      choices = { { text = "One true block. That's worth carrying.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    saved = {
      lines = { { id = "saved_default", text = "A brass gauge block and four notebooks, which is everything I could carry down the stair with a sister under the other arm. Trixie brought a half-built gyro and no shoes. We've each told the other, since, that we chose correctly." } },
      choices = { { text = "You both chose what you couldn't replace.", next = "BACK", reply = "That's a generous way to describe a gyro, but yes, I suppose we did.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    wheel = {
      lines = { { id = "wheel_default", text = "He does, and he's quite serious. I've checked his figures, since nobody else would, and the alarming part is that they're sound as far as they go. They just stop going a page before the part where the replacement has to hold a wagon up." } },
      choices = { { text = "So the wheel is safe for now.", next = "BACK", reply = "For at least a page. Please don't tell him I said so.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    parts = {
      lines = { { id = "parts_default", text = "Gearcutter Cogspinner next door sells the bolts and the powder, and he's fair about it. For anything stranger, the students bring me scrap from Dun Morogh, and half of what I teach is how to tell good scrap from a trogg's dinner." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    trixie = { { id = "tp_trixie", text = "Trixie is brilliant and impossible. If you learn from both of us, you'll come out about right." } },
    springspindle = { { id = "tp_springspindle", text = "Springspindle Fizzlegear owns the shop and teaches the masters. He's a genius for nine minutes in every ten." } },
    gearcutter = { { id = "tp_gearcutter", text = "Gearcutter Cogspinner sells engineering supplies next door. He weighs his powder properly, which I can't say for everyone." } },
    background = { { id = "tp_bg", text = "I was an assembly checker in Gnomeregan. I found other people's mistakes for a living, and I still do." } },
    _none = { { id = "tp_none", text = "I haven't any data on that, and I won't guess. Guessing is how benches catch fire." } },
  },
}

---------------------------------------------------------------------------
-- Trixie Quikswitch: expert engineer at Springspindle's Gadgets, Tinker Town; Jemma's older sister.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_trixie", id = TODO_NPC("Trixie Quikswitch"), name = "Trixie Quikswitch", title = "Expert Engineer", gender = "female",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "reckless", "bright" }, values = { "craft", "curious" },
  notices = { "craft", "class" },
  impression = {
    first = "Trixie Quikswitch teaches expert engineers at Springspindle's Gadgets and builds by feel, with no plans at all. Her devices work beautifully, and nobody, including Trixie, can say exactly why.",
    third = "{name} met Trixie Quikswitch, an expert engineer at Springspindle's Gadgets in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello! Hold this for a moment, would you, and whatever you do, keep your thumb on the red part until I say." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Most people don't after I hand them something. You may let go of that now, by the way." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Wonderful, then you won't mind if I think out loud, since half of it will be about what's ticking." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You've a spanner on your belt with the jaws worn on one side only. You force your bolts, and I approve, because so do I." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You people do with a word what takes me a week and a crate of copper, and I've never decided whether I'm jealous or just better entertained." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Trixie Quikswitch, and I teach the engineers who already know the rules, which means I teach them when to stop minding the rules. My sister Jemma hands them to me neat and careful, and I hand them back to the world a little singed." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I work, I can do both, mostly." },
        { id = "h_again2", text = "Go on! I'm listening, and that noise is supposed to happen." },
      },
      choices = {
        { text = "Train me in engineering.", next = "BUSINESS" },
        { text = "Your sister says you never write anything down.", next = "notes" },
        { text = "What does an expert learn that a journeyman doesn't?", next = "expert" },
        { text = "What are you building right now?", next = "building" },
        { text = "That thing on your bench is smoking.", next = "smoke" },
        { text = "How does Tinker Town suit you?", next = "town" },
        { text = "Goodbye, Trixie. Mind the red part.", next = "END" },
      },
    },
    notes = {
      lines = { { id = "notes_default", text = "She's right, I don't! By the time I've written a thing down I've thought of a better way to do it, and then the note is wrong and I've wasted the pencil. Jemma writes it down for me afterwards, and she's usually only a version behind." } },
      choices = { { text = "What happens to a design you forget?", next = "notes_forget" }, { text = "Something else.", next = "BACK" } },
    },
    notes_forget = {
      lines = { { id = "notes_forget_default", text = "Then it's gone, and I build something else. I lost a self-winding torque wrench that way, the best thing I ever made, and all I've got left of it is Jemma's sketch of the outside. She still brings that up at dinner." } },
      choices = {
        { text = "She has a point about the wrench.", next = "BACK", reply = "She has a very small point, and she has been making it for two years.", fx = { trait = { witty = 1 } } },
        { text = "You'll build a better one.", next = "BACK", reply = "That's exactly what I said! I haven't yet, but I said it.", fx = { affinity = 1 } },
      },
    },
    expert = {
      lines = { { id = "expert_default", text = "Judgment. A journeyman knows that the plan says a quarter-turn. An expert knows what the machine sounds like when a quarter-turn is too much, and stops. You can't put that in a diagram, whatever my sister tells you." } },
      choices = { { text = "How do you teach a sound?", next = "expert_sound" }, { text = "Something else.", next = "BACK" } },
    },
    expert_sound = {
      lines = { { id = "expert_sound_default", text = "I make them build the same gyro nine times, and on the ninth I have them do it with wax in their ears. If it runs, they've got it in their hands. If it doesn't, we all stand well back and I learn something too." } },
      choices = { { text = "Nine gyros is a lot of copper.", next = "BACK", reply = "It is, and Gearcutter Cogspinner sends me a card every Winter Veil.", fx = { trait = { practical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    building = {
      lines = { { id = "building_default", text = "It was going to be a clockwork squirrel, but it has since developed opinions and a second spring. At the moment it's a device that winds itself up and then won't say what for. I'm letting it run to see what it wants." } },
      choices = {
        { text = "Machines don't want things, Trixie.", next = "BACK", reply = "That's what Jemma says. This one bit her, so I think the question is open.", fx = { trait = { skeptical = 1 } } },
        { text = "I hope it wants something harmless.", next = "BACK", reply = "So do I! That's most of the fun.", fx = { trait = { curious = 1 } } },
      },
    },
    smoke = {
      big = true,
      lines = { { id = "smoke_default", text = "Oh, it does that. It's a small smoke, a friendly one. Springspindle says I ought to test things in the blast pit like everyone else, with the forms filled in, and I say the forms take longer than the fire does." } },
      choices = {
        { text = "Fill in the forms. One careless spark could burn out half of Tinker Town.", next = "BACK", reply = "You sound exactly like my sister. It's unsettling how often she's right.", fx = { align = { order = 1 } } },
        { text = "Skip the forms. Nothing new was ever built by asking leave.", next = "BACK", reply = "Ha! Come and stand over here, then, where it's safest. Safer, anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "town_default", text = "It's a very good workshop with a mountain on top of it. The dwarves gave us the hall, the tram runs to Stormwind from just behind us, and nobody minds the noise, because nobody could hear a complaint over the Forge anyway." } },
      choices = {
        { text = "It isn't Gnomeregan, though.", next = "BACK", reply = "No, it isn't. But the ceilings are higher, and I've started building things that need the room.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jemma = { { id = "tp_jemma", text = "Jemma's my little sister. She's the reason anything I build can be built twice, and I'd be lost without her, so don't tell her." } },
    springspindle = { { id = "tp_springspindle", text = "Springspindle Fizzlegear owns the shop. We agree about everything except wheels and paperwork." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I had a workshop on the third level with a window onto the gear train. I try to think about the gear train and not about the rest." } },
    background = { { id = "tp_bg", text = "I've been taking things apart since I could reach a table. Putting them back together came later, and differently." } },
    _none = { { id = "tp_none", text = "No idea! But if you find out, come and tell me, I love a new thing." } },
  },
}

---------------------------------------------------------------------------
-- Thonys Pillarstone: dwarf journeyman enchanter at Thistlefuzz Arcanery, Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thonys", id = TODO_NPC("Thonys Pillarstone"), name = "Thonys Pillarstone", title = "Journeyman Enchanter",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gentle", "thoughtful" }, values = { "craft", "knowledge" },
  notices = { "craft", "race" },
  impression = {
    first = "Thonys Pillarstone is a dwarf who chose enchanting over the hammer and teaches it at Thistlefuzz Arcanery. He unmakes enchanted things at the back table as gently as another dwarf might lay a hearthstone.",
    third = "{name} met Thonys Pillarstone, a journeyman enchanter at Thistlefuzz Arcanery in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, an' welcome. Set down anythin' enchanted on the cloth there an' no' on the bare table, if ye would, for the table remembers." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I've kept yer place at the table, in a manner o' speakin'." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "An enchanter. Good. Then ye'll ken tae speak softly near the dust jars, for they dinnae like a shout." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Ye've dust under yer nails, the fine silver sort. Ye broke somethin' small this mornin', an' ye didnae wash after. Wash after, always." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, an' ye're lookin' at me the way my uncles do. Aye, I ken there's a forge next door. I can hear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thonys Pillarstone, journeyman enchanter. Gimble Thistlefuzz teaches the craft from the first rune tae the last, an' I take the students between, an' break down what folk bring us at the back table." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask? There's nae hurry in here." },
        { id = "h_again2", text = "Aye, go on. The dust will settle whether I watch it or no'." },
      },
      choices = {
        { text = "Train me in enchanting.", next = "BUSINESS" },
        { text = "A dwarf enchanter is a rare thing.", next = "dwarf" },
        { text = "What happens at the back table?", next = "unmake" },
        { text = "What does a journeyman enchanter learn?", next = "learn" },
        { text = "How do you find working for gnomes?", next = "gnomes" },
        { text = "What do adventurers bring you most?", next = "bring" },
        { text = "Peace to you, Thonys.", next = "END" },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_default", text = "So my family tells me at every feast. The Pillarstones are masons, every one, an' my father had a chisel in my hand before I could walk. I was a fair mason, too, till the day I felt somethin' hummin' in an old keystone an' couldnae leave it be." } },
      choices = { { text = "What did your family say?", next = "dwarf_family" }, { text = "Something else.", next = "BACK" } },
    },
    dwarf_family = {
      lines = { { id = "dwarf_family_default", text = "That stone is honest an' magic is for gnomes an' elves. I told them the runes on the gates o' Ironforge were cut by dwarves long before either came, an' my grandmother said that was different. She's never said how." } },
      choices = {
        { text = "The old dwarves knew their runes.", next = "BACK", reply = "Aye, they did, an' I'd like tae think I'm pickin' up a chisel they set down.", fx = { trait = { curious = 1 } } },
        { text = "Families come round in time.", next = "BACK", reply = "Mine move at the speed o' masonry, but aye, I've hopes.", fx = { trait = { kind = 1 } } },
      },
    },
    unmake = {
      lines = { { id = "unmake_default", text = "Disenchantin'. Folk bring a ring or a blade they've outgrown, an' I draw the magic out an' leave it as dust an' shards for the next enchantment. Tilli finds it sad, an' I've told her the magic only moves house." } },
      choices = { { text = "Do you believe that yourself?", next = "unmake_believe" }, { text = "Something else.", next = "BACK" } },
    },
    unmake_believe = {
      big = true,
      lines = { { id = "unmake_believe_default", text = "Most days. I broke a soldier's bracers last month, an' his widow had brought them. She wanted the coin, an' she had the right. But there was years o' somebody's care in them, an' it's a pinch in a jar now, an' I did that." } },
      choices = {
        { text = "You did right. Old things should serve the living, not sit in a drawer.", next = "BACK", reply = "Aye, that's what I told myself. The dust went intae a healer's staff, an' I think he'd have liked that.", fx = { align = { order = -1 } } },
        { text = "Some things should be kept whole. I'd have asked her to wait.", next = "BACK", reply = "I very nearly did. Next time I think I'll ask, an' let them be cross wi' me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "learn_default", text = "Tae listen before ye cut. Every piece o' metal or cloth will take some enchantments gladly an' fight others, an' a journeyman learns tae feel which, the way a mason taps a block tae hear whether it's sound." } },
      choices = { { text = "So your mason's ear still serves you.", next = "BACK", reply = "Every day. I've never told my father that, an' I think I should.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "gnomes_default", text = "They're good tae me. Gimble jumps when a door shuts an' Tilli never jumps at anythin', an' between the two there's a calm sort o' middle where I do my work. They built me a stool the right height my first week, an' said nothin' about it." } },
      choices = { { text = "That's a kindness worth more than talk.", next = "BACK" } },
    },
    bring = {
      lines = { { id = "bring_default", text = "Green things they've grown out of, for the most part: a belt from Loch Modan, a ring out o' the Wetlands. Now an' again somebody sets down a piece that hums so loud I can feel it in my teeth, an' I send for Gimble, an' he jumps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gimble = { { id = "tp_gimble", text = "Gimble Thistlefuzz is master here. He's a nervous wee soul, but his rune work is the steadiest in Ironforge." } },
    tilli = { { id = "tp_tilli", text = "Tilli Thistlefuzz sells the rods an' the dust. She thinks unmakin' is sad, an' I think she's half right." } },
    forge = { { id = "tp_forge", text = "I hear the Great Anvil all day through the wall. I've come tae like it, the way ye like a brother's snorin'." } },
    background = { { id = "tp_bg", text = "A Pillarstone, an' the only one wi'out a chisel. I laid stone in the Military Ward before I ever touched a rune." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' I'd rather say so than guess. Tilli hears more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Uthrar Threx: journeyman tailor at Stonebrow's Clothier, Great Forge; the neatest presser in Ironforge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_uthrar", id = TODO_NPC("Uthrar Threx"), name = "Uthrar Threx", title = "Journeyman Tailor",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "careful", "hasty" }, values = { "craft", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Uthrar Threx is Jormund Stonebrow's journeyman at Stonebrow's Clothier and the neatest presser in Ironforge. He checks his iron three times before it touches cloth, and there is a scorched bolt of silk behind that habit.",
    third = "{name} met Uthrar Threx, a journeyman tailor at Stonebrow's Clothier in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day tae ye. Mind the pressin' board, if ye please, the iron's hot, an' I've checked." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Hold a moment while I see tae the iron, an' then I'm all yours." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Let's see yer buttonholes. No, on second thought, dinnae show me, for Master Jormund will ask if I looked." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "That hem's been taken up in a hurry, wi' a runnin' stitch. I'd ken it anywhere, for I've done it myself, an' been made tae unpick it." },
    { id = "n_cloth", cat = "class", when = { class = "MAGE" },
      text = "A mage's robe wants pressin' from the inside, or the heat dulls the thread. Ye'd be surprised how few mages ken it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Uthrar Threx, journeyman tae Master Jormund Stonebrow. I teach the plain sewin', the linens an' the wool, an' when a student's ready for silk I send them up tae the master. I also do every bit o' pressin' in this shop." },
      },
      again = {
        { id = "h_again", text = "What else? I've a seam tae finish, but it'll wait." },
        { id = "h_again2", text = "Aye, ask, an' I'll keep an eye on the iron." },
      },
      choices = {
        { text = "Train me in tailoring.", next = "BUSINESS" },
        { text = "You've checked that iron twice since I came in.", next = "iron" },
        { text = "What does a journeyman tailor learn?", next = "learn" },
        { text = "What's Jormund like to work for?", next = "master" },
        { text = "Who buys what this shop makes?", next = "buyers" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "Good day, Uthrar.", next = "END" },
      },
    },
    iron = {
      lines = { { id = "iron_default", text = "Three times, if ye count when ye came through the door. I scorched a bolt o' Master Jormund's silk in my fifth week here, a whole bolt, an' the smell stayed in the shop for a month. I did six weeks at the board for it instead o' the usual four." } },
      choices = { { text = "Was that fair of him?", next = "iron_fair" }, { text = "Something else.", next = "BACK" } },
    },
    iron_fair = {
      lines = { { id = "iron_fair_default", text = "Aye, it was. He never raised his voice. He hung the burnt end where I'd see it from the board, an' it hung there till I could press a silk sleeve wi'out a mark. I asked tae keep it when he took it down." } },
      choices = {
        { text = "You kept the scorched silk?", next = "BACK", reply = "It's in my kit. I touch it before I lift the iron, an' I've no' burned a thread since.", fx = { trait = { curious = 1 } } },
        { text = "A quiet lesson lasts longest.", next = "BACK", reply = "So it does. I'd have forgotten a shoutin' in a week.", fx = { affinity = 1 } },
      },
    },
    learn = {
      lines = { { id = "learn_default", text = "Tae slow down, which is the hard part for me. I can sew a straight seam quicker than anybody in the shop, an' Master Jormund says that's my whole trouble. A buttonhole wants forty stitches, an' I'm aye lookin' for a way tae do it in thirty." } },
      choices = {
        { text = "Thirty would do, if they hold.", next = "learn_thirty" },
        { text = "Then do the forty.", next = "learn_thirty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn_thirty = {
      big = true,
      lines = { { id = "learn_thirty_default", text = "That's the argument, right there. A soldier's shirt wi' thirty-stitch buttonholes goes out the door a day sooner, an' there's a war on somewhere, always. The master says a Stonebrow garment is finished or it isnae, an' there's nae such thing as soon." } },
      choices = {
        { text = "The master's right. Work done properly is the only work worth selling.", next = "BACK", reply = "Aye. I ken it every time I see one o' his coats, thirty years old an' no' a button lost.", fx = { align = { order = 1 } } },
        { text = "A shirt on a soldier's back today beats a perfect one next week.", next = "BACK", reply = "I've thought the same, an' quietly. Dinnae say it where he can hear ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "master_default", text = "Jormund Stonebrow is the finest tailor under the mountain, an' he kens it, an' he's earned it. He's dignified about everythin', even thread. I've seen him send a senator away for standin' badly at a fittin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "buyers_default", text = "Mages an' priests from the Mystic Ward, for the most part. We sew here, an' Ingrys Stonebrow an' Maeva Snowbraid sell the robes at Maeva's shop by the Hall o' Mysteries. Poranna Snowbraid, beside me, sells the thread an' dye tae anybody who'd rather sew their own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "cloth_default", text = "Linen an' wool come up from the adventurers, who take it off things I'd rather no' think about. The silk is spider silk out o' the Wetlands an' Duskwood, an' I wash every bolt twice before the master will let it near a needle." } },
      choices = { { text = "I'd wash it three times.", next = "BACK", reply = "So did I, the first year. Ye learn tae stop smellin' it.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    jormund = { { id = "tp_jormund", text = "Master Jormund Stonebrow. He taught me everythin' I ken, an' he's no' finished." } },
    poranna = { { id = "tp_poranna", text = "Poranna Snowbraid keeps the thread an' the dyes. She can match a colour from across the Forge, by firelight." } },
    ingrys = { { id = "tp_ingrys", text = "Ingrys Stonebrow sells our work in the Mystic Ward. She sends back word o' what the mages complain about, an' it's always the sleeves." } },
    background = { { id = "tp_bg", text = "My father's a miner an' wanted me one. I'd rather mend the shirt than tear it." } },
    _none = { { id = "tp_none", text = "I couldnae say. Ask the master, though mind how ye stand when ye do." } },
  },
}

---------------------------------------------------------------------------
-- Vosur Brakthel: dwarf journeyman alchemist at Berryfizz's Potions and Mixed Drinks, Tinker Town.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_vosur", id = TODO_NPC("Vosur Brakthel"), name = "Vosur Brakthel", title = "Journeyman Alchemist",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady", "curious" }, values = { "knowledge", "craft" },
  notices = { "craft", "drunk" },
  impression = {
    first = "Vosur Brakthel is a dwarf who walked into a gnomish potion shop and asked to learn, and now teaches alchemy there. He has the steadiest hands in Tinker Town and a habit of tasting things he ought not to.",
    third = "{name} met Vosur Brakthel, a journeyman alchemist at Berryfizz's Potions and Mixed Drinks in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Berryfizz's. Potions on the left an' drinks on the right, an' I'd take care tae ask which shelf before ye sip." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good. Smell this for me an' tell me whether it's meant tae smell like that." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Then ye'll no' flinch if I keep stirrin' while we talk, for this one sulks if ye leave it." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Ye've peacebloom in yer pack, an' it's bruised. Carry it flat between two cloths, an' it'll give ye half again as much." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had a few, friend. Stay well away from the left-hand shelf, for it's nae place for an unsteady hand." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Vosur Brakthel, journeyman alchemist. Tally Berryfizz is the master an' does the teachin' proper, Soolie keeps the supplies, an' I do the stirrin' an' take the students who've got past their first potion wi'out poisonin' anybody." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk an' stir, so long as I count under my breath." },
        { id = "h_again2", text = "Aye, ask, an' dinnae mind me countin'. Forty-one, forty-two, go on." },
      },
      choices = {
        { text = "Train me in alchemy.", next = "BUSINESS" },
        { text = "What's a dwarf doing in a gnome's potion shop?", next = "dwarf" },
        { text = "I heard you were hired to sweep the floor.", next = "sweep" },
        { text = "What does a journeyman alchemist learn?", next = "learn" },
        { text = "They say you taste what you brew.", next = "taste" },
        { text = "Which herbs should I gather in Dun Morogh?", next = "herbs" },
        { text = "Steady hands, Vosur.", next = "END" },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_default", text = "Learnin' from the best. I brewed ale for twenty years, an' I thought I kent what there was tae ken about boilin' things. Then I watched a gnome turn swiftthistle intae somethin' that made a dwarf run like a ram, an' I felt like an apprentice again." } },
      choices = { { text = "So you asked Tally to teach you.", next = "dwarf_ask" }, { text = "Something else.", next = "BACK" } },
    },
    dwarf_ask = {
      lines = { { id = "dwarf_ask_default", text = "I walked in the week they opened an' told her gnomes had forgotten more alchemy than dwarves ever kent. It was the truth, an' it was also the right thing tae say tae a gnome who'd just lost her city." } },
      choices = {
        { text = "That was kindly done.", next = "BACK", reply = "It was honestly done, which is better. The kindness was a happy accident.", fx = { trait = { kind = 1 } } },
        { text = "Flattery opens most doors.", next = "BACK", reply = "It wasnae flattery, an' she'd have kent it if it were. Gnomes can measure anythin'.", fx = { trait = { skeptical = 1 } } },
      },
    },
    sweep = {
      lines = { { id = "sweep_default", text = "Ha! Soolie's been talkin'. Aye, I offered tae sweep the floor if Tally would let me watch, an' I've never once lifted the broom. She put a stirrin' rod in my hand the first mornin' an' I've no' had a hand free since." } },
      choices = { { text = "The floor's loss is the cauldron's gain.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "learn_default", text = "Timin'. Any fool can follow a recipe for a minor healin' potion. The stronger ones turn on a count o' ten, an' if ye lift the flask off the flame at eleven ye've made a very dear bottle o' pond water." } },
      choices = { { text = "How do you keep the count?", next = "learn_count" }, { text = "Something else.", next = "BACK" } },
    },
    learn_count = {
      lines = { { id = "learn_count_default", text = "I sing. Brewers' songs, the old ones, for every verse is the same length an' I ken them in my sleep. Tally uses a wee clock, an' the two of us have never once disagreed by more than a breath." } },
      choices = {
        { text = "Which song for a healing potion?", next = "BACK", reply = "Three verses o' The Miller's Red Daughter, an' ye stop before the chorus. I'll no' sing it here.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taste = {
      big = true,
      lines = { { id = "taste_default", text = "Only a drop, on the tip o' the tongue, an' only the ones I've made a hundred times. A brewer tastes his mash, an' I cannae see why a potion should be different. Tally says that's how alchemists end up wi' blue ears, an' she's forbidden it in the shop." } },
      choices = {
        { text = "Tally's right. Her shop, her rule, and you gave her your word.", next = "BACK", reply = "Aye, I did, near enough. I'll keep my tongue in my head, an' miss it.", fx = { align = { order = 1 } } },
        { text = "Trust your tongue. A master's instinct counts for more than a rule.", next = "BACK", reply = "That's a brewer's answer, an' I like it. Ye'll no' mention it tae Tally.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "herbs_default", text = "Peacebloom an' silverleaf along the roads, an' earthroot wherever the ground rises steep, for it likes a slope. That'll make ye every potion a beginner needs. Reyna Stonebranch in the Great Forge teaches the pickin', if ye've never done it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    tally = { { id = "tp_tally", text = "Tally Berryfizz kens more alchemy than anybody I've met, an' she keeps the potions an' the drinks on separate shelves, mostly." } },
    soolie = { { id = "tp_soolie", text = "Soolie Berryfizz runs the supplies. She's the only one who can find anythin' in here, an' she reminds us weekly." } },
    tinkertown = { { id = "tp_tinkertown", text = "It's loud an' it's cramped an' somethin's always on fire. I've come tae like it better than my own street." } },
    background = { { id = "tp_bg", text = "I was a brewer in the Commons for twenty years. Ale's only alchemy that's in nae hurry." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. If it can be boiled, ask me again." } },
  },
}

---------------------------------------------------------------------------
-- Mangorn Flinthammer: plate and shields at the Flinthammers' armour shop in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_mangorn", id = TODO_NPC("Mangorn Flinthammer"), name = "Mangorn Flinthammer", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "hearty", "loud" }, values = { "craft", "family" },
  notices = { "kit", "class" },
  impression = {
    first = "Mangorn Flinthammer sells plate and shields in the Commons and proves each piece by thumping it with a mallet. His wife Raena sells leather at the next counter, and the two disagree loudly about which keeps a body alive.",
    third = "{name} met Mangorn Flinthammer, a heavy armour merchant in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, come in! If ye're wantin' somethin' between yerself an' an axe, ye've found the right counter." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, ye're still in one piece! Then either my armour's good or ye've been hidin', an' I'll take the credit either way." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior! Now there's a customer who kens what a breastplate is for. Step up an' let me see the breadth o' ye." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By my beard, that armour's been through a rockslide. I sell new, an' I'd say ye're due." },
    { id = "n_cloth", cat = "class", when = { class = "MAGE" },
      text = "A robe, in my shop? Ye'll be wantin' my wife's counter, or the Mystic Ward. I'd no' sell plate tae a mage, for ye'd fall over an' I'd feel responsible." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mangorn Flinthammer, an' this is good dwarven plate, hammered under this mountain an' sold by a dwarf who's worn it. I keep the plate an' the shields, Bromiir Ormsen has the mail, an' my wife Raena sells leather tae folk who'd rather run than stand." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk armour till the Forge goes cold." },
        { id = "h_again2", text = "Aye, ask away!" },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You and your wife sell against each other.", next = "wife" },
        { text = "How do I know your plate is sound?", next = "sound" },
        { text = "What should a fighter buy first?", next = "first" },
        { text = "Who buys the most plate these days?", next = "buyers" },
        { text = "Who are your neighbours in the Commons?", next = "commons" },
        { text = "Good day, Mangorn.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "wife_default", text = "We do, an' we've done it thirty years. Raena says a fighter ye cannae hit needs nae armour, an' I say everybody gets hit in the end. We keep a tally on the back wall o' customers who come back, an' I'll no' tell ye who's ahead." } },
      choices = { { text = "She's ahead, isn't she?", next = "wife_ahead" }, { text = "Something else.", next = "BACK" } },
    },
    wife_ahead = {
      lines = { { id = "wife_ahead_default", text = "By four, an' three o' those were rogues, who come back tae every shop whether they've paid or no'. I've told her rogues shouldnae count, an' she's told me tae sell better armour." } },
      choices = {
        { text = "Rogues shouldn't count.", next = "BACK", reply = "Thank ye! Say it louder, she's just there.", fx = { trait = { witty = 1 } } },
        { text = "A returning customer is a returning customer.", next = "BACK", reply = "Och, no' ye as well. She's paid ye, hasn't she?", fx = { trait = { practical = 1 } } },
      },
    },
    sound = {
      lines = { { id = "sound_default", text = "Like this. Ye hear that ring? That's the mallet on a breastplate, an' a cracked plate gives a dull knock instead. I strike every piece that comes in from the Great Forge, an' the dull ones go straight back tae Grumnus Steelshaper wi' a rude note." } },
      choices = { { text = "Has he ever sent a rude note back?", next = "sound_note" }, { text = "Something else.", next = "BACK" } },
    },
    sound_note = {
      lines = { { id = "sound_note_default", text = "Once. I'd sent back a helm that was sound, on account of a head cold that had dulled my ear. He returned it wi' a note that said only \"Listen again,\" an' I've kept it pinned over the counter tae keep me humble." } },
      choices = { { text = "A smith's pride and a merchant's ear.", next = "BACK" } },
    },
    first = {
      big = true,
      lines = { { id = "first_default", text = "The shield, every time. Recruits want the big shiny breastplate, for it looks grand in the Commons. A shield's what stops the blow, an' it's half the price. I could sell them the breastplate an' make double, an' some days I'm sore tempted." } },
      choices = {
        { text = "Sell them the shield. An honest merchant keeps his customers alive.", next = "BACK", reply = "Aye, an' live customers buy breastplates later. That's what I tell Raena, anyway.", fx = { align = { honor = 1 } } },
        { text = "Sell them what they ask for. Their coin, their mistake.", next = "BACK", reply = "There's a deal o' merchants in this city who'd agree wi' ye. I notice their customers dinnae come back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_default", text = "The mountaineers, for the Senate buys by the crate for the passes an' for Dun Algaz. After them come the recruits out o' the Hall o' Arms, an' a good many humans from Stormwind, who've found out what their own smiths charge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    commons = {
      lines = { { id = "commons_default", text = "Steelfury's Weapon Emporium is next door, an' Dolman Steelfury an' I send each other trade all day, for a dwarf who's bought an axe wants a shield tae go wi' it. The Stonefire's across the way, an' that's where the profit goes." } },
      choices = { { text = "A shop beside a tavern is a dangerous thing.", next = "BACK", reply = "Raena says the same, an' she keeps the cash box for that very reason.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    raena = { { id = "tp_raena", text = "Raena's my wife, an' she's the cleverer of us. She'll tell ye so herself, so I may as well." } },
    bromiir = { { id = "tp_bromiir", text = "Bromiir Ormsen sells the mail at our third counter. He's a quiet lad who was a mountaineer, an' kens what a ring shirt's worth in the snow." } },
    grumnus = { { id = "tp_grumnus", text = "Grumnus Steelshaper forges half o' what I sell. He's a stern old boot, an' the best armourer in the city." } },
    background = { { id = "tp_bg", text = "A Flinthammer's kept an armour stall in the Commons since the Commons was a quarry. I was born behind this counter, near enough." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. If it cannae be hammered, it's no' my trade." } },
  },
}

---------------------------------------------------------------------------
-- Raena Flinthammer: leather and cloth armour at the Flinthammers' shop in the Commons; Mangorn's wife.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_raena", id = TODO_NPC("Raena Flinthammer"), name = "Raena Flinthammer", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "sharp", "teasing" }, values = { "practical", "family" },
  notices = { "class", "purse" },
  impression = {
    first = "Raena Flinthammer sells leather and cloth armour in the Commons, beside her husband Mangorn's plate. She has a quick tongue, a quicker eye for a customer's purse, and a running tally she is winning.",
    third = "{name} met Raena Flinthammer, a light armour merchant in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, dear. If that great loud dwarf has tried tae sell ye a breastplate already, come an' stand over here where it's quieter." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' that's one more on my side o' the wall. Dinnae tell Mangorn, I like tae watch him count." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Light on yer feet, I see. My leathers are on the left, an' I'll thank ye tae keep yer hands where I can see them while ye browse." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Ye'll want leather that doesnae creak, an' I oil mine twice for exactly that reason." },
    { id = "n_purse", cat = "purse", when = { money = { max = 100 } },
      text = "Ye've a thin purse, dear, an' I'll no' pretend otherwise. Look at the padded cloth on the end, for it's honest an' it's cheap." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Raena Flinthammer. I sell leather an' cloth for folk who mean tae move about in a fight, an' my husband sells iron for folk who mean tae stand still in one. We share a roof an' a bed, an' no' one opinion about armour." },
      },
      again = {
        { id = "h_again", text = "What else, dear?" },
        { id = "h_again2", text = "Ask, an' be quick, before himself starts thumpin' somethin'." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Your husband says everybody gets hit in the end.", next = "hit" },
        { text = "How do I choose good leather?", next = "leather" },
        { text = "What's it like, keeping shop in the Commons?", next = "commons" },
        { text = "Where do your leathers come from?", next = "source" },
        { text = "Good day, Raena.", next = "END" },
      },
    },
    hit = {
      lines = { { id = "hit_default", text = "So he does, an' he's right about folk who stand where the blow's comin'. I've sold leathers tae scouts who've walked through Dun Algaz an' back wi' never a scratch, for they were never where the orcs were lookin'." } },
      choices = { { text = "And the tally on the wall?", next = "hit_tally" }, { text = "Something else.", next = "BACK" } },
    },
    hit_tally = {
      lines = { { id = "hit_tally_default", text = "I'm four ahead. He'll tell ye rogues shouldnae count, which is rich from a dwarf who counts the Senate's whole crate order as one customer when it suits him an' fifty when it doesnae." } },
      choices = {
        { text = "You both cheat at the tally, then.", next = "BACK", reply = "Thirty years wed, dear. A wee bit o' cheatin' at the tally is what keeps it lively.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "leather_default", text = "Bend it. Good leather folds an' comes back wi'out a line, an' poor leather keeps the crease an' cracks there by winter. Smell it, too, for if it smells o' anythin' but oil, somebody's hurried the curin'." } },
      choices = { { text = "Where should I bend it?", next = "leather_bend" }, { text = "Something else.", next = "BACK" } },
    },
    leather_bend = {
      lines = { { id = "leather_bend_default", text = "At the elbow an' behind the knee, for that's where ye bend. Half the folk who come in here test the chest, which never moves, an' then wonder why their sleeves split on the road tae Loch Modan." } },
      choices = { { text = "Elbows and knees. I'll remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    commons = {
      lines = { { id = "commons_default", text = "It's the best pitch in the city. The gates are forty steps that way, an' every traveller who comes in off the snow passes my door before he's found the bank or the inn. He's cold, he's sore, an' he's just learned what his old jerkin was worth." } },
      choices = {
        { text = "You profit from their misery, then.", next = "commons_profit" },
        { text = "Then you see everyone who arrives.", next = "commons_profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    commons_profit = {
      big = true,
      lines = { { id = "commons_profit_default", text = "I sell warm, sound gear tae cold folk at a fair price, an' if ye want tae call that profit from misery ye may. There's a lad two doors down who doubles his prices when the snow's bad, an' I could do the same an' be rich by spring." } },
      choices = {
        { text = "Keep your prices fair. Folk remember who robbed them in the cold.", next = "BACK", reply = "So they do, dear, an' they remember who didnae. That's my tally.", fx = { align = { honor = 1 } } },
        { text = "Double them. A merchant charges what the weather allows.", next = "BACK", reply = "Hm. Ye'd do well in Booty Bay. No' so well in a city where yer customers live next door.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "source_default", text = "The hides come down from the Finespindles by the Great Forge, an' the gnomes sew a finer seam than any dwarf, though ye'll no' hear a dwarf say it. The padded cloth I buy from Stonebrow's Clothier, an' I pay on the day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    mangorn = { { id = "tp_mangorn", text = "My husband. He's loud an' he's stubborn an' he's never once sold a bad piece, an' I'd no' trade him." } },
    bromiir = { { id = "tp_bromiir", text = "Bromiir Ormsen has the mail counter. He was a mountaineer, an' I think he took the job for the warm room." } },
    finespindles = { { id = "tp_finespindles", text = "The Finespindle gnomes sew most o' my leather. Fimble's fussy, an' fussy is what ye want in a seam." } },
    background = { { id = "tp_bg", text = "I was a Stoutlager before I wed. I married intae armour, an' I've made the best of it." } },
    _none = { { id = "tp_none", text = "I couldnae say, dear. Try the tavern, they ken everythin' in there." } },
  },
}

---------------------------------------------------------------------------
-- Bromiir Ormsen: mail at the Flinthammers' armour shop in the Commons; a former mountaineer.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bromiir", id = TODO_NPC("Bromiir Ormsen"), name = "Bromiir Ormsen", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quiet", "steady" }, values = { "duty", "practical" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Bromiir Ormsen sells mail at the Flinthammers' shop in the Commons and says little while the Flinthammers say a great deal. He wore a ring shirt in the passes for years and sells nothing he would not have worn there.",
    third = "{name} met Bromiir Ormsen, who sells mail armour in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day. The mail's here, an' the plate's wi' Mangorn. Take yer time." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Did the last piece sit right across the shoulders?" },
    { id = "g_hunter", when = { class = "HUNTER", minLevel = 40 }, text = "Ye've the years tae wear mail now, hunter. It's heavier than leather, an' ye'll thank it the first time a boar gets inside yer aim." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer links are openin' at the shoulder. That's from the pack strap, an' it'll go all at once when it goes." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 10 },
      text = "Ye're new tae the road. Buy the gloves before the helm, for it's yer hands that freeze first out there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bromiir Ormsen. I sell ring an' chain, an' I leave the talkin' tae the Flinthammers, who've enough for the three of us. I carried a rifle in the passes before this, an' I ken what mail's worth when it's snowin' sideways." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye?" },
        { id = "h_again2", text = "Aye, I'm listenin'." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "You were a mountaineer?", next = "mountaineer" },
        { text = "Why mail and not plate?", next = "mail" },
        { text = "How do you get on with the Flinthammers?", next = "flint" },
        { text = "How should I look after a ring shirt?", next = "care" },
        { text = "What do the mountaineers tell you these days?", next = "news" },
        { text = "Good day, Bromiir.", next = "END" },
      },
    },
    mountaineer = {
      lines = { { id = "mountaineer_default", text = "Twelve years, most o' them at the North Gate Pass an' the last two above Gol'Bolar. I came in when my knees stopped likin' the cold. Mangorn had sold me every shirt I ever wore, so I asked him for a counter." } },
      choices = { { text = "Do you miss the passes?", next = "mountaineer_miss" }, { text = "Something else.", next = "BACK" } },
    },
    mountaineer_miss = {
      lines = { { id = "mountaineer_miss_default", text = "I miss the quiet. I dinnae miss the troggs, or the sound the wind makes in a helm at night. When a young mountaineer comes in for a shirt, I fit it myself an' I take my time, an' that's as near as I need tae be." } },
      choices = {
        { text = "You still look after them, in your way.", next = "BACK", fx = { affinity = 1 } },
        { text = "A warm shop is fair pay for twelve years.", next = "BACK", reply = "So I tell my knees. They've yet tae disagree.", fx = { trait = { practical = 1 } } },
      },
    },
    mail = {
      lines = { { id = "mail_default", text = "Ye can sleep in mail. Plate turns a harder blow, I'll no' argue, but ye cannae lie down in it, an' a sentry who's taken his armour off tae rest is the one the troggs find. Mail lets ye be tired an' alive both." } },
      choices = { { text = "You've seen that happen.", next = "mail_seen" }, { text = "Something else.", next = "BACK" } },
    },
    mail_seen = {
      big = true,
      lines = { { id = "mail_seen_default", text = "Once. A lad on my watch took off his breastplate tae sleep, against orders, an' I let it pass because he'd marched two days. I've asked myself since whether I should have woken him an' made him wear it." } },
      choices = {
        { text = "You showed a tired lad mercy. The troggs did the rest, not you.", next = "BACK", reply = "That's what the captain said. I've never quite managed tae believe it, but I thank ye.", fx = { align = { order = -1 } } },
        { text = "Orders exist for that night. You should have woken him.", next = "BACK", reply = "Aye. I think so too. It's why I sell mail.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flint = {
      lines = { { id = "flint_default", text = "Well enough. They argue from openin' tae closin', an' it means nothin', for I've seen him carry her stock in before his own every mornin' for years. I count the customers for their tally when they're no' lookin', an' I keep it honest." } },
      choices = { { text = "Who's truly ahead?", next = "BACK", reply = "She is, by six. They both think it's four, an' I'll leave it so.", fx = { trait = { discreet = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    care = {
      lines = { { id = "care_default", text = "Oil it, an' roll it in a barrel o' sand once a season if ye can find one. Never fold it wet. An' check the rings under the arm, where the sweat sits, for rust starts where ye cannae see it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = { { id = "news_default", text = "That the troggs have Gol'Bolar Quarry an' mean tae keep it, an' that the Frostmane are raidin' out o' Shimmer Ridge again. Senir Whitebeard in Kharanos sends the reports in. I hear them a day early, from the lads who come in for mendin'." } },
      choices = { { text = "The Senate should send more rifles.", next = "BACK", reply = "Aye, it should. It'll send a senator first, tae look. It always does.", fx = { trait = { skeptical = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    mangorn = { { id = "tp_mangorn", text = "Mangorn Flinthammer. He's loud, an' he's as honest as his plate." } },
    raena = { { id = "tp_raena", text = "Raena Flinthammer misses nothin'. She kent I'd been a mountaineer before I'd opened my mouth." } },
    passes = { { id = "tp_passes", text = "The North Gate Pass, an' Gol'Bolar after it. It's bonny country when nothin's tryin' tae eat ye." } },
    background = { { id = "tp_bg", text = "Twelve years a mountaineer. I've been warm for three, an' I'm still no' used tae it." } },
    _none = { { id = "tp_none", text = "I wouldnae ken. I keep tae my counter." } },
  },
}

---------------------------------------------------------------------------
-- Dolkin Craghelm: mail at Craghelm's Plate and Chain, Military Ward; Olthran's younger brother.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dolkin", id = TODO_NPC("Dolkin Craghelm"), name = "Dolkin Craghelm", title = "Mail Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "competitive" }, values = { "craft", "family" },
  notices = { "kit", "class" },
  impression = {
    first = "Dolkin Craghelm sells chain at Craghelm's Plate and Chain in the Military Ward, across the shop from his brother Olthran's plate. He counts every sale against his brother's and is forever one behind.",
    third = "{name} met Dolkin Craghelm, a mail armour merchant at Craghelm's Plate and Chain in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Craghelm's! The chain's on this side, an' it's the better side, whatever the sign says first." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back tae my side o' the shop. I'll be mentionin' that tae my brother." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "A paladin. Ye'll wear plate in time, I ken, but ye'll wear my chain first, an' ye'll remember who fitted ye." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That hauberk's hangin' by a prayer. I've its better here, an' it'll no' take ye a minute tae try." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior fresh from the Hall o' Arms, by yer stance. Kelv Sternhammer drills them all tae stand like that, an' it sits a mail shirt well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dolkin Craghelm. The shop's called Plate an' Chain, in that order, because Olthran's the elder an' he painted the sign. I sell the chain, an' I sell more pieces than he does, though he'll tell ye plate costs more an' so he wins." },
      },
      again = {
        { id = "h_again", text = "What else? I've a shirt tae hang, but go on." },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "Who is winning, you or your brother?", next = "brother" },
        { text = "Who are your customers in the Military Ward?", next = "ward" },
        { text = "What makes good chain?", next = "chain" },
        { text = "You should repaint the sign.", next = "sign" },
        { text = "When does a hunter change to chain?", next = "hunters" },
        { text = "Good day, Dolkin.", next = "END" },
      },
    },
    brother = {
      lines = { { id = "brother_default", text = "It depends how ye count, an' we've never agreed how. By pieces, I've had him every month for nine years. By coin, he's had me every month but one, an' that was the month the Senate fitted out a whole company o' riflemen in my shirts." } },
      choices = { { text = "What did Olthran say that month?", next = "brother_month" }, { text = "Something else.", next = "BACK" } },
    },
    brother_month = {
      lines = { { id = "brother_month_default", text = "No' a word, for three days. On the fourth he bought me a drink at Bruuk's Corner an' said the riflemen looked well. That's as near as a Craghelm comes tae sayin' he's proud o' ye, an' I've lived on it since." } },
      choices = {
        { text = "Brothers are like that.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "You'd miss the contest if you won.", next = "BACK", reply = "Dinnae say that where he can hear. But aye, I would.", fx = { trait = { witty = 1 } } },
      },
    },
    ward = {
      lines = { { id = "ward_default", text = "Soldiers, start tae finish. The Hall o' Arms is round the bend, so every recruit who passes muster comes tae us for a first shirt. The hunters from Goldfury's come for chain when they've the years for it, an' the Timberline lot send us folk who've just bought a sword an' noticed they've nothin' tae wear wi' it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chain = {
      lines = { { id = "chain_default", text = "Riveted rings, every one. There's cheap mail about wi' the rings only butted closed, an' it looks the same on a stand. A spear point opens butted mail like a purse, an' ye find out which sort ye bought at the worst moment." } },
      choices = { { text = "How can I tell them apart?", next = "chain_tell" }, { text = "Something else.", next = "BACK" } },
    },
    chain_tell = {
      lines = { { id = "chain_tell_default", text = "Look for the wee flat spot on each ring where the rivet sits. If the rings are plain round wire all the way about, put it down an' walk out, an' tell the merchant Dolkin Craghelm sent ye." } },
      choices = { { text = "I'll look for the rivets.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    sign = {
      big = true,
      lines = { { id = "sign_default", text = "I've a pot o' paint under the counter, an' I've had it there six years. I could do it in a night, \"Chain an' Plate,\" an' he'd no' notice till a customer said. But he's the elder, an' Father left the sign tae him along wi' the shop." } },
      choices = {
        { text = "Leave it. The elder's place is the elder's, and that's the old way.", next = "BACK", reply = "Aye, I ken it. The paint's likely dried in the pot anyway.", fx = { align = { order = 1 } } },
        { text = "Paint it. A name should say who does the work.", next = "BACK", reply = "Ha! I'll think on it. If ye hear shoutin' from the Military Ward, ye'll ken I did.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters = {
      lines = { { id = "hunters_default", text = "When Regnus Thundergranite in the Hall o' Arms says they've the strength for it, an' no' a day before. They come in hatin' the weight. I tell them tae wear it a week before they judge, an' I've never had a shirt brought back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    olthran = { { id = "tp_olthran", text = "Olthran's my elder brother. He's slow, he's proud, an' he's never sold a customer the wrong size in his life." } },
    kelv = { { id = "tp_kelv", text = "Kelv Sternhammer drills the warriors in the Hall o' Arms. Half my trade is recruits he's just finished shoutin' at." } },
    bruuk = { { id = "tp_bruuk", text = "Bruuk's Corner is where the ward drinks. Olthran an' I sit at opposite ends, an' leave together." } },
    background = { { id = "tp_bg", text = "Craghelms have armoured the Military Ward since Father's father. I'm the second son, an' I sell the second thing on the sign." } },
    _none = { { id = "tp_none", text = "I cannae help ye there. Ask Olthran, he's had longer tae learn it." } },
  },
}

---------------------------------------------------------------------------
-- Olthran Craghelm: plate at Craghelm's Plate and Chain, Military Ward; Dolkin's elder brother.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_olthran", id = TODO_NPC("Olthran Craghelm"), name = "Olthran Craghelm", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "deliberate", "proud" }, values = { "craft", "tradition" },
  notices = { "kit", "class" },
  impression = {
    first = "Olthran Craghelm sells plate at Craghelm's Plate and Chain in the Military Ward and takes as long over a fitting as it needs. He is the elder brother, he painted the sign, and he has noticed the paint under Dolkin's counter.",
    third = "{name} met Olthran Craghelm, a heavy armour merchant at Craghelm's Plate and Chain in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day tae ye. Stand there, in the light, an' let me look at ye before ye tell me what ye think ye need." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so turn about. Aye, it still sits right, an' so it should." },
    { id = "g_war", when = { class = "WARRIOR", minLevel = 40 }, text = "Ye've the shoulders for full plate now. I've been waitin' for ye tae grow intae it, in a manner o' speakin'." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That plate's dented in at the ribs, an' it's pressin' on ye when ye breathe. Ye've been short o' wind an' blamin' the stairs." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Ye'll want room at the shoulder for the hammer swing, an' maist armourers fit ye as if ye stood still tae pray." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Olthran Craghelm, of Craghelm's Plate an' Chain. I fit plate, an' I dinnae sell it until it fits. My brother Dolkin sells chain across the floor, a great deal faster, an' ye may judge for yerself what that says about chain." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Take yer time, for I always do." },
      },
      choices = {
        { text = "Show me your plate.", next = "BUSINESS" },
        { text = "You take your time over a fitting.", next = "fitting" },
        { text = "Your brother says he outsells you.", next = "brother" },
        { text = "Has the ward changed since your father's day?", next = "ward" },
        { text = "Dolkin keeps a pot of paint under his counter.", next = "paint" },
        { text = "Who forges the plate you sell?", next = "forged" },
        { text = "Good day, Olthran.", next = "END" },
      },
    },
    fitting = {
      lines = { { id = "fitting_default", text = "Aye, an hour, where another shop takes a quarter o' that. Plate that's a finger too wide at the waist will bruise yer hip raw in a day's march, an' ye'll take it off, an' then ye've paid for armour ye're carryin' in a sack." } },
      choices = { { text = "Do customers have the patience?", next = "fitting_patience" }, { text = "Something else.", next = "BACK" } },
    },
    fitting_patience = {
      lines = { { id = "fitting_patience_default", text = "The ones who've marched do. The young ones fidget, an' I let them go tae Dolkin, an' in a few years they come back tae me wi' a scar an' stand as still as a post. I've never had tae say a word about it." } },
      choices = { { text = "The scar teaches patience.", next = "BACK", reply = "It's the only teacher some o' them will hear.", fx = { trait = { stern = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "brother_default", text = "By the piece, he does. He was aye quick, even as a bairn, an' he could sell snow tae a mountaineer. I'll tell ye what I'd never tell him: the month the Senate bought his shirts for the riflemen, I walked past that company three times tae look at them." } },
      choices = {
        { text = "You should tell him that.", next = "BACK", reply = "I bought him a drink. Between Craghelms, that's a speech.", fx = { trait = { kind = 1 } } },
        { text = "He already knows, I think.", next = "BACK", reply = "Aye, maybe so. He kens me better than I like.", fx = { affinity = 1 } },
      },
    },
    ward = {
      lines = { { id = "ward_default", text = "It's younger. In Father's time the Hall o' Arms turned out forty recruits a year, an' I kent their names. Now it's forty a month, wi' the Dark Irons an' the orcs an' the trouble in the north, an' I fit lads who've no' the beard tae fill a gorget." } },
      choices = { { text = "Do you ever refuse to fit one?", next = "ward_refuse" }, { text = "Something else.", next = "BACK" } },
    },
    ward_refuse = {
      big = true,
      lines = { { id = "ward_refuse_default", text = "I've thought on it. A lad came in last week who was too young by years, an' he'd lied tae the recruiters. If I'd sent him off wi' nae armour, he might have gone home. I fitted him the best I had instead, an' it's sat ill wi' me." } },
      choices = {
        { text = "You did right. He'd have marched anyway, and now he's armoured.", next = "BACK", reply = "Aye. That's what I told myself while I did up the straps.", fx = { align = { light = 1 } } },
        { text = "You should have reported him. The rules on age exist for his sake.", next = "BACK", reply = "Maybe so. I ken his captain, an' I've no' ruled out a quiet word yet.", fx = { trait = { stern = 1 } } },
        { text = "His lie, his risk. A merchant only sells.", next = "BACK", reply = "That's a cold way tae see a boy in a breastplate. I've heard it said, though.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paint = {
      lines = { { id = "paint_default", text = "Six years, he's had it. I see it every time I reach for the ledger. He thinks I dinnae ken, an' he thinks he'll paint \"Chain an' Plate\" some night an' I'll rage about it." } },
      choices = { { text = "Would you rage?", next = "BACK", reply = "I'd rage for a week, for form's sake. Then I'd leave it. Father would have laughed himself sick.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    forged = {
      lines = { { id = "forged_default", text = "Grumnus Steelshaper an' his best students, at the Great Anvil. I walk down myself each week an' choose piece by piece. He's stern, an' I'm slow, an' we've spent whole mornin's arguin' over a single pauldron an' enjoyed every minute." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dolkin = { { id = "tp_dolkin", text = "My wee brother. He's quick an' he's cheeky, an' he's a better merchant than I am. Ye'll no' repeat it." } },
    hall = { { id = "tp_hall", text = "The Hall o' Arms sends me its recruits. Kelv Sternhammer trains them hard, an' I'm glad of it." } },
    timberline = { { id = "tp_timberline", text = "Timberline Arms sells the blades in this ward. We send each other customers, for a sword an' a breastplate go together." } },
    background = { { id = "tp_bg", text = "I've fitted plate in this shop since I could reach the straps. Father left it tae me, an' I mean tae leave it tae the both of us." } },
    _none = { { id = "tp_none", text = "I dinnae ken that, for plate is what I ken." } },
  },
}

---------------------------------------------------------------------------
-- Lissyphus Finespindle: fits and sells light armour for the Finespindles.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_lissyphus", id = TODO_NPC("Lissyphus Finespindle"), name = "Lissyphus Finespindle", title = "Light Armor Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "precise", "lively" }, values = { "craft", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Lissyphus Finespindle fits and sells the light armour her family sews, and takes eleven measurements where a dwarven armourer takes three. She has opinions about how soldiers stand and shares them freely.",
    third = "{name} met Lissyphus Finespindle, a gnome who fits and sells light armour in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Stand up straight, please, or rather stand the way you actually stand, because that's the person I have to fit." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! Lift your arms for me, would you? Yes, good, it hasn't stretched, I knew it wouldn't." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "A rogue! You'll want it quiet and you'll want it dark, and I have both, and no, I won't ask what for." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You draw a bow with your left shoulder forward, I can see it in how your jerkin's worn. I cut the left sleeve looser for archers, and nobody else in Ironforge bothers." },
    { id = "n_tall", cat = "race", when = { race = "Human" },
      text = "Goodness, you go up a long way. Wait there, I'll fetch the steps, I keep them for humans and night elves." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Lissyphus Finespindle. My cousins sew the leather, and I fit it and sell it, because a jerkin that's beautifully made in the wrong size is only an expensive way to be uncomfortable. I take eleven measurements, and I use all of them." },
      },
      again = {
        { id = "h_again", text = "What else? I've pins in my mouth, so speak clearly." },
        { id = "h_again2", text = "Yes, go on!" },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Eleven measurements seems like a great many.", next = "eleven" },
        { text = "How does a gnome come to fit soldiers?", next = "soldiers" },
        { text = "Tell me about the rest of the Finespindles.", next = "family" },
        { text = "What wears out first on a jerkin?", next = "wear" },
        { text = "Do customers come from outside Ironforge?", next = "tram" },
        { text = "Goodbye, Lissyphus.", next = "END" },
      },
    },
    eleven = {
      lines = { { id = "eleven_default", text = "A dwarven armourer takes chest, waist and length, and then lets the buckles do the rest. I take both shoulders separately, because nobody's are the same, and the reach, and the neck, and how far you twist. People are much less symmetrical than they think." } },
      choices = { { text = "Which measurement matters most?", next = "eleven_most" }, { text = "Something else.", next = "BACK" } },
    },
    eleven_most = {
      lines = { { id = "eleven_most_default", text = "The twist. Have someone hold your hips and turn as far as you can, and that's how far your armour has to go without riding up. I had a mountaineer tell me it saved him, because he could turn far enough in the saddle to see what was behind him." } },
      choices = { { text = "What was behind him?", next = "BACK", reply = "A wendigo, he said, and rather close. I've put \"twist\" at the top of the form ever since.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    soldiers = {
      lines = { { id = "soldiers_default", text = "By being short, mostly! I'm at the height of everybody's belt, and that's where armour goes wrong. The dwarves at Craghelm's fit from the shoulders down, and I fit from the hips up, and Dolkin Craghelm has started sending me his awkward ones." } },
      choices = {
        { text = "The dwarves don't mind a gnome in their trade?", next = "soldiers_mind" },
        { text = "You've made a place for yourself.", next = "soldiers_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers_mind = {
      big = true,
      lines = { { id = "soldiers_mind_default", text = "Some did. A sergeant told me, my first year, that he'd not be dressed by a refugee, and he said it in front of a full shop. I fitted him anyway, perfectly, and charged him the usual. Bombus says I should have doubled it." } },
      choices = {
        { text = "You answered him the right way. Good work shames a fool better than spite.", next = "BACK", reply = "That's what I thought. He's sent me eleven of his own soldiers since, and never said a word about that day.", fx = { align = { light = 1 } } },
        { text = "Bombus is right. Rudeness should cost something.", next = "BACK", reply = "Ha! It would have paid for the new shears. I'll admit I priced it up in my head.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "family_default", text = "Fimble teaches and does the fine work, Gretta takes the beginners, Bombus keeps the books and sells the thread, and Balthus Stoneflayer, who isn't a Finespindle but puts up with us, teaches the skinning. I'm the one who goes out and meets the customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wear = {
      lines = { { id = "wear_default", text = "The inside of the elbow, and then the strap holes. Rub a little tallow into the elbow every week and you'll double its life. If a strap hole starts to stretch into an oval, bring it to me before it tears and not after." } },
      choices = { { text = "Tallow at the elbow. Thank you.", next = "BACK" } },
    },
    tram = {
      lines = { { id = "tram_default", text = "More every month! They come up on the Deeprun Tram from Stormwind, because somebody told somebody that a gnome in Ironforge fits a jerkin properly. I had three humans in one morning, and I was up and down those steps like a piston." } },
      choices = { { text = "Word of good work travels.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    fimble = { { id = "tp_fimble", text = "Fimble sews the smallest stitch in Ironforge. He also inspects mine, which I bear with grace, mostly." } },
    bombus = { { id = "tp_bombus", text = "Bombus knows what everything costs. I know what everything's worth, and we meet in the middle." } },
    craghelm = { { id = "tp_craghelm", text = "The Craghelm brothers sell plate and chain in the Military Ward. Dolkin sends me customers, and Olthran pretends he doesn't know about it." } },
    background = { { id = "tp_bg", text = "I fitted pressure suits in Gnomeregan, for the deep engineers. A jerkin is much easier, since nobody boils if I'm wrong." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't a measurement for it. Sorry!" } },
  },
}

---------------------------------------------------------------------------
-- Maeva Snowbraid: robes at Maeva's Mystical Apparel, Mystic Ward; Poranna's sister.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_maeva", id = TODO_NPC("Maeva Snowbraid"), name = "Maeva Snowbraid", title = "Robe Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "gracious", "vain" }, values = { "style", "family" },
  notices = { "class" },
  impression = {
    first = "Maeva Snowbraid sells robes at Maeva's Mystical Apparel in the Mystic Ward and dresses half the Hall of Mysteries. She is gracious, well aware of her looks, and quietly envious of her sister Poranna's eye for colour.",
    third = "{name} met Maeva Snowbraid, the robe merchant at Maeva's Mystical Apparel in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Maeva's Mystical Apparel. Come in out o' the draught, an' let's find ye somethin' worthy o' the Hall." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! An' wearin' it well, if I may say so, though I'd have taken the hem up a finger." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest! Ye'll be seen at the front o' a chapel, then, an' we cannae have ye lookin' like a sack o' meal while ye're there." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "There are scorch marks on yer cuffs, dear. Every mage has them, an' I sew a doubled cuff for exactly that." },
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "Ye clank, dear. I've nothin' here that'd survive ye, but ye're welcome tae admire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maeva Snowbraid, an' the shop bears my name, so I answer for every thread. I sell robes tae the mages an' priests o' the Hall o' Mysteries, an' Ingrys Stonebrow beside me sells the plainer cloth for those who think a robe is puttin' on airs." },
      },
      again = {
        { id = "h_again", text = "What else can I show ye, or tell ye?" },
        { id = "h_again2", text = "Aye, dear, ask." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Your sister sells thread by the Great Forge.", next = "sister" },
        { text = "Who wears your robes?", next = "wearers" },
        { text = "Does a robe really matter to a spell?", next = "matter" },
        { text = "What makes a robe worth the price?", next = "price" },
        { text = "The Mystic Ward seems quieter than the rest.", next = "ward" },
        { text = "Good day, Maeva.", next = "END" },
      },
    },
    sister = {
      lines = { { id = "sister_default", text = "Poranna, aye. She'll have told ye I got the looks an' she got the eye for colour, for she tells everybody. It's true, an' I'd trade her in a heartbeat, for looks dinnae sell a robe an' a good purple does." } },
      choices = { { text = "Does she choose your colours?", next = "sister_colour" }, { text = "Something else.", next = "BACK" } },
    },
    sister_colour = {
      lines = { { id = "sister_colour_default", text = "Every season, an' she's never been wrong. I once chose a green on my own, tae prove I could. I've forty yards o' that green in the back room still, an' Poranna has been kind enough tae mention it only at family dinners." } },
      choices = {
        { text = "What was wrong with the green?", next = "BACK", reply = "High Priest Rohan said it made his novices look seasick. He wasnae wrong.", fx = { trait = { witty = 1 } } },
        { text = "You each have your gift.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    wearers = {
      lines = { { id = "wearers_default", text = "Everybody in the Hall, near enough. Bink the mage trainer wears mine, an' so does Juli Stormkettle, though she'd wear a flour sack if it had enough pockets. High Priest Rohan sends his novices tae me for their first proper robe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    matter = {
      lines = { { id = "matter_default", text = "The mages say no' a whit, an' then they stand straighter the moment they put a good one on. A caster who feels like a wizard casts like one. I've watched a wee gnome apprentice walk in here tremblin' an' walk out ready tae argue wi' a senator." } },
      choices = {
        { text = "So you sell confidence.", next = "matter_conf" },
        { text = "That's vanity, not magic.", next = "matter_conf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    matter_conf = {
      big = true,
      lines = { { id = "matter_conf_default", text = "Call it what ye like. There's a lass who comes in, a poor one, studyin' under Nittlebur. She tries on the same blue robe every week an' cannae afford it. I've thought o' tellin' her it's flawed an' markin' it down, though there's nothin' wrong wi' it at all." } },
      choices = {
        { text = "Tell the lie. It harms no one, and she'll have her robe.", next = "BACK", reply = "I think I will, dear. The Light can forgive a flaw that isnae there.", fx = { align = { honor = -1 } } },
        { text = "Don't lie to her. Tell her plainly it's a gift, or hold it for her.", next = "BACK", reply = "She's proud, an' she'd refuse a gift. But I could hold it, aye. I'd no' thought o' that.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "price_default", text = "The linin'. Anybody can sew a bonny outside. A robe's worth is in whether it's lined so it doesnae cling when ye raise yer arms tae cast, an' whether the hem's weighted tae hang straight on a stair. Jormund Stonebrow's are, every one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ward = {
      lines = { { id = "ward_default", text = "It is, an' it's why I took the shop. There's the pool, an' the Hall, an' folk who think before they speak. Ginny Longberry has the reagents across the way an' The Fighting Wizard is next door, though I could do wi'out Harick's wands goin' off at night." } },
      choices = {
        { text = "He told me nobody believes that.", next = "BACK", reply = "I believe it, dear. I heard his window go. I simply dinnae give him the satisfaction.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    poranna = { { id = "tp_poranna", text = "My sister Poranna. She can see a colour once an' match it a year later. I'm very proud o' her, an' a wee bit jealous." } },
    ingrys = { { id = "tp_ingrys", text = "Ingrys Stonebrow sells the cloth armour at my other counter. She's Jormund's kin, an' she's as plain-spoken as he is grand." } },
    jormund = { { id = "tp_jormund", text = "Jormund Stonebrow sews what I sell. He's the finest tailor in Ironforge, an' he kens it tae the last stitch." } },
    background = { { id = "tp_bg", text = "The Snowbraids have been in cloth for three generations. I'm the one they put at the front o' the shop." } },
    _none = { { id = "tp_none", text = "I'm sure I couldnae say, dear. It isnae the sort o' thing one hears in a robe shop." } },
  },
}

---------------------------------------------------------------------------
-- Ingrys Stonebrow: cloth armour at Maeva's Mystical Apparel, Mystic Ward; Jormund's kinswoman.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_ingrys", id = TODO_NPC("Ingrys Stonebrow"), name = "Ingrys Stonebrow", title = "Cloth Armor Merchant", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "plain", "dry" }, values = { "practical", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Ingrys Stonebrow sells cloth armour at Maeva's Mystical Apparel and has no patience for finery. She is a Stonebrow, kin to the master tailor Jormund, and judges a garment by whether it survives the road.",
    third = "{name} met Ingrys Stonebrow, a cloth armour merchant at Maeva's Mystical Apparel in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day. If ye want somethin' bonny, see Maeva. If ye want somethin' that'll last past Loch Modan, ye're at the right counter." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so let's have a look at the knees. Aye, they've held, just as I told ye they would." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. I'll sell tae ye the same as anybody, an' I'll thank ye tae leave whatever follows ye about outside the door." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer robe's in ribbons. That's no' fashion, that's neglect, an' ye'll catch yer death in the passes." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Ye sew, I see, for ye're lookin' at my seams an' no' my prices. Look all ye like. My kinsman Jormund sewed them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ingrys Stonebrow. I sell the workin' cloth: padded vests, wool trews, gloves an' boots for folk who cast spells in the mud. Maeva has the robes an' the customers who want tae be looked at, an' I've the ones who want tae come home." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on, I'm no' busy." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You don't think much of fine robes.", next = "finery" },
        { text = "Jormund Stonebrow is your kinsman.", next = "jormund" },
        { text = "What do casters ruin first?", next = "ruin" },
        { text = "What do you hear from the Hall of Mysteries?", next = "hall" },
        { text = "What should a caster wear into the Wetlands?", next = "wetlands" },
        { text = "Good day, Ingrys.", next = "END" },
      },
    },
    finery = {
      lines = { { id = "finery_default", text = "I think they're grand, for standin' in a hall. I've seen a mage come back from the Wetlands wi' a silk hem that had soaked up half the marsh an' tripped him intae a crocolisk. Wool sheds water, an' naebody ever admired wool, an' there ye have it." } },
      choices = { { text = "Does Maeva take offence?", next = "finery_maeva" }, { text = "Something else.", next = "BACK" } },
    },
    finery_maeva = {
      lines = { { id = "finery_maeva_default", text = "Maeva an' I have an understandin'. She sells them the robe for the Hall, an' I sell them the vest that goes under it for the road, an' between us they're dressed an' alive. We only quarrel about the window, which she fills wi' purple." } },
      choices = { { text = "Purple does catch the eye.", next = "BACK", reply = "So does a fire. I dinnae put those in the window either.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    jormund = {
      lines = { { id = "jormund_default", text = "He's my father's cousin. I was meant tae sew for him, an' I've nae hands for it, for my stitches wander like a drunk gnome. So he put me at a counter, where a sharp tongue is worth more than a neat seam." } },
      choices = { { text = "That was shrewd of him.", next = "BACK", fx = { trait = { practical = 1 } } }, { text = "Do you regret not sewing?", next = "BACK", reply = "No. I'd rather sell one good thing than ruin ten.", fx = { affinity = 1 } } },
    },
    ruin = {
      lines = { { id = "ruin_default", text = "Gloves. They burn them, freeze them, an' dip them in things I'll no' name. I tell every mage tae buy two pair an' they buy one, an' they're back in a month wi' their fingers showin'." } },
      choices = { { text = "And warlocks?", next = "ruin_warlock" }, { text = "Something else.", next = "BACK" } },
    },
    ruin_warlock = {
      big = true,
      lines = { { id = "ruin_warlock_default", text = "Warlocks ruin everythin', an' it's never fire. The cloth goes thin, like it's been worn fifty years in a week. I ken what does it. Some shops in this ward willnae sell tae them at all, an' I've been asked tae join them." } },
      choices = {
        { text = "Sell to them. Coin is coin, and a cold warlock is still cold.", next = "BACK", reply = "That's my view. I sell cloth, an' I'm nae priest tae judge who wears it.", fx = { align = { order = -1 } } },
        { text = "Refuse them. The ward is right to shut its doors on that craft.", next = "BACK", reply = "There's plenty would agree wi' ye. I'd want a better reason than a thin sleeve tae turn a body out in the snow.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = { { id = "hall_default", text = "More than they think I do. The priests complain o' the mages' noise, the mages complain o' the priests' incense, an' the paladins complain o' nothin' an' break the benches. Ginny Longberry at the reagent shop hears the rest, an' we compare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wetlands = {
      lines = { { id = "wetlands_default", text = "Wool next tae the skin, oiled boots tae the knee, an' nothin' that trails. Cut yer hem tae the calf before ye go, an' sew it back when ye're home. The marsh takes a hand's width o' cloth off everybody, an' ye may as well choose which." } },
      choices = { { text = "I'll cut the hem myself, then.", next = "BACK" } },
    },
  },
  topics = {
    maeva = { { id = "tp_maeva", text = "Maeva Snowbraid owns the shop an' dresses the Hall. She's vain as a peacock, an' she's never once cheated a customer." } },
    jormund = { { id = "tp_jormund", text = "Jormund Stonebrow, master tailor, by the Great Forge. He's my kinsman, an' every seam I sell is his or his students'." } },
    ginny = { { id = "tp_ginny", text = "Ginny Longberry sells reagents across the way. She keeps a tally o' everybody who comes through the ward, an' I've never asked why." } },
    background = { { id = "tp_bg", text = "A Stonebrow who cannae sew. They found a use for me anyway." } },
    _none = { { id = "tp_none", text = "I dinnae ken, for I sell vests an' I leave the rest tae cleverer folk." } },
  },
}

---------------------------------------------------------------------------
-- Harick Boulderdrum: wands at The Fighting Wizard, Mystic Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_harick", id = TODO_NPC("Harick Boulderdrum"), name = "Harick Boulderdrum", title = "Wands Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "booming", "superstitious" }, values = { "craft", "practical" },
  notices = { "class", "craft" },
  impression = {
    first = "Harick Boulderdrum sells wands at The Fighting Wizard in the Mystic Ward and handles each one as though it might go off. He cannot cast a spell himself, and he trusts wood grain further than he trusts wizards.",
    third = "{name} met Harick Boulderdrum, the wand merchant at The Fighting Wizard in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae The Fighting Wizard! Dinnae point anythin' at me, an' we'll get on fine." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye've both eyebrows. The wand suited ye, then." },
    { id = "g_caster", when = { class = "MAGE" }, text = "A mage! Good, ye'll ken which end tae hold. Ye'd be amazed how often I have tae say." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, an' nae wand on ye. Ye cannae pray at a trogg from forty paces, {g:lad|lass}, or ye can, but a wand's quicker." },
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Ye've the look o' an enchanter. Ye'll be makin' yer own wands soon, an' puttin' me out o' trade, so I'll enjoy yer custom while I have it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Harick Boulderdrum. I sell wands, an' my partner Bingus sells the staves an' daggers at the other counter. I've nae magic in me at all, which is why ye can trust me: I sell the ones that havenae blown up in my hand." },
      },
      again = {
        { id = "h_again", text = "What else? Mind where ye wave that." },
        { id = "h_again2", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your wands.", next = "BUSINESS" },
        { text = "A wand seller who can't cast?", next = "cast" },
        { text = "How do you test a wand, then?", next = "test" },
        { text = "The Fighting Wizard is an odd name.", next = "name" },
        { text = "You keep them in sand.", next = "sand" },
        { text = "Which wood makes the best wand?", next = "wood" },
        { text = "Good day, Harick.", next = "END" },
      },
    },
    cast = {
      lines = { { id = "cast_default", text = "No' a spark. I was a cooper, an' I ken wood. A wand's a stave wi' a temper, an' I can tell by the grain whether it'll hold a charge or split. The magic I leave tae them that put it in." } },
      choices = { { text = "Who puts it in?", next = "cast_who" }, { text = "Something else.", next = "BACK" } },
    },
    cast_who = {
      lines = { { id = "cast_who_default", text = "Gimble Thistlefuzz at the Arcanery does the most o' mine, an' his journeyman Thonys Pillarstone the plainer sort. I cut the blanks, they do the hummin' an' glowin', an' I carry them back across the city in a box o' wet sand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    test = {
      lines = { { id = "test_default", text = "I hand it tae Bingus. He's a gnome, he's quick, an' he's closer tae the ground if it goes wrong. He points it at the iron plate on the back wall, an' if the plate rings an' Bingus is still standin', it goes on the shelf." } },
      choices = { { text = "That hardly seems fair to Bingus.", next = "test_fair" }, { text = "Something else.", next = "BACK" } },
    },
    test_fair = {
      big = true,
      lines = { { id = "test_fair_default", text = "He volunteered! Well. He lost at cards, an' he's lost every week for three years, an' I've never quite told him I mark the deck. He likes the testin', mind. He says it keeps him sharp." } },
      choices = {
        { text = "Tell him about the cards. A partner deserves the truth.", next = "BACK", reply = "Aye, I suppose he does. I'll tell him after stocktakin', when he's in a good humour.", fx = { align = { honor = 1 } } },
        { text = "Say nothing. He's happy, and the wands get tested.", next = "BACK", reply = "That's how I've seen it. Still, it itches at me, an' that's a bad sign in a dwarf.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "name_default", text = "Bingus chose it. He says a wizard wi' only a spellbook is a scholar, an' a wizard wi' a wand in one hand an' a dagger in the other is a customer. We've the sign in dwarven an' in gnomish, an' the gnomish is longer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sand = {
      lines = { { id = "sand_default", text = "Wet sand, aye. A wand left on a dry shelf will sometimes discharge o' its own accord in the night. I lost a window that way, an' a very good hat. Naebody at the Hall o' Mysteries believes me, an' naebody there has had tae buy a new hat." } },
      choices = { { text = "I believe you about the hat.", next = "BACK", reply = "Thank ye. It was my father's, an' it had a feather.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    wood = {
      lines = { { id = "wood_default", text = "Ash, from the shores o' Loch Modan, cut in winter when the sap's down. It's straight in the grain an' it gives a wee bit before it breaks. I'll no' touch Dun Morogh pine, for the resin pops when the charge goes in, an' that's how I lost the first window." } },
      choices = { { text = "How many windows have you lost?", next = "BACK", reply = "Two, an' a hat. I count the hat separate.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bingus = { { id = "tp_bingus", text = "Bingus is my partner. He sells the blades an' staves, an' he could talk a paladin intae a dagger." } },
    gimble = { { id = "tp_gimble", text = "Gimble Thistlefuzz enchants my wands. He jumps when ye knock, so I've learned tae cough first." } },
    hall = { { id = "tp_hall", text = "The Hall o' Mysteries is just yonder. They're my bread an' butter, an' I wish they'd stop practisin' near my window." } },
    background = { { id = "tp_bg", text = "I was a cooper in the Commons. Barrels never once went off in my hand." } },
    _none = { { id = "tp_none", text = "I've nae idea, an' I'll no' guess. Guessin' is for wizards." } },
  },
}

---------------------------------------------------------------------------
-- Bingus: staves and daggers at The Fighting Wizard, Mystic Ward; Harick's partner.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bingus", id = TODO_NPC("Bingus"), name = "Bingus", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "fast-talking", "fearless" }, values = { "practical", "friendship" },
  notices = { "class", "race" },
  impression = {
    first = "Bingus sells staves and daggers to spellcasters at The Fighting Wizard and tests his partner Harick's wands against an iron plate. He talks fast, fears nothing, and knows perfectly well that Harick marks the cards.",
    third = "{name} met Bingus, the gnome weapon merchant at The Fighting Wizard in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to The Fighting Wizard, where we arm the people who say they don't need arming! What do you do when the mana runs out? Exactly, so come in and have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you have to use it? You did, I can tell, you've got the look of somebody who's glad they bought a dagger." },
    { id = "g_caster", when = { class = "PRIEST" }, text = "A priest! Lovely. You'll want a staff, and before you say you won't hit anyone with it, everyone says that, and everyone does." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "You're a bit large for my stock, friend. Timberline Arms in the Military Ward does the big ones. I do the ones that fit up a sleeve." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Oh, good, somebody I don't have to look up at! I've a rack at the proper height, just there, behind the dwarf-sized ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Bingus! Just Bingus, the rest was lost in the move. I sell staves, daggers and the odd short sword to mages, priests and warlocks, who all believe they'll never need one, right up until something gets within arm's reach." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and sharpen, watch." },
        { id = "h_again2", text = "Go on, ask, I've nothing ticking at the moment." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why would a wizard need a dagger?", next = "dagger" },
        { text = "Harick has you test his wands.", next = "wands" },
        { text = "How did a gnome and a dwarf end up partners?", next = "partners" },
        { text = "What's \"the rest\" of your name?", next = "name" },
        { text = "What staff should a novice carry?", next = "staff" },
        { text = "Goodbye, Bingus.", next = "END" },
      },
    },
    dagger = {
      lines = { { id = "dagger_default", text = "Because spells take a breath, and a murloc doesn't wait for you to take it! I've had eleven customers come back to tell me the dagger saved them. I've had none come back to say they never needed it, though that might be for a different reason." } },
      choices = { { text = "That's a grim way to count.", next = "dagger_grim" }, { text = "Something else.", next = "BACK" } },
    },
    dagger_grim = {
      lines = { { id = "dagger_grim_default", text = "It's the only honest way! I was a mage's assistant in Gnomeregan, and when the troggs came up through the floor my master had a head full of the finest spells you ever saw and nothing in his hands. I had a wrench, and I'm the one telling the story." } },
      choices = {
        { text = "So now you put something in their hands.", next = "BACK", reply = "Every one of them, whether they like it or not.", fx = { affinity = 1 } },
        { text = "I'm sorry about your master.", next = "BACK", reply = "Thank you. He'd have hated the shop's name, and I think of that fondly.", fx = { trait = { kind = 1 } } },
      },
    },
    wands = {
      lines = { { id = "wands_default", text = "He does! I point them at the iron plate and count to three. I lose at cards every week and that's the forfeit, and before you say anything, yes, I know about the deck. I've known for two years and ten months." } },
      choices = { { text = "Why keep playing a marked deck?", next = "wands_deck" }, { text = "Something else.", next = "BACK" } },
    },
    wands_deck = {
      big = true,
      lines = { { id = "wands_deck_default", text = "Because I'd test them anyway! Somebody has to, and Harick's hands shake around magic, poor old thing. This way he thinks he's being clever, and he buys the ale out of guilt. I've wondered whether to tell him I know." } },
      choices = {
        { text = "Tell him. Friends shouldn't keep a lie between them, even a kind one.", next = "BACK", reply = "You're probably right. I'll miss the free ale, but I'd rather he stopped fretting over it.", fx = { align = { honor = 1 } } },
        { text = "Keep quiet. Let him have his trick, and you your ale.", next = "BACK", reply = "That's been my reasoning! Everybody wins, and only one of us knows the score.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    partners = {
      lines = { { id = "partners_default", text = "He had a shop and no customers, and I had customers and no shop. I'd been selling daggers to mages off a blanket outside the Hall of Mysteries, and he came out to complain that I was blocking his door, and stayed to ask how I was doing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "name_default", text = "There was a great deal more of it. Gnomish names go on, you know, with the family and the workshop and the district. The district's full of troggs, the workshop's under green fog, and I decided I'd carry the short part until there's somewhere to put the rest." } },
      choices = {
        { text = "You'll have the rest back one day.", next = "BACK", reply = "That's the plan! High Tinker Mekkatorque's plan, anyway, and I'm in favour of it.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff = {
      lines = { { id = "staff_default", text = "A plain one, no taller than your nose, and heavier at the bottom than the top. The fancy ones with a crystal on the end are for standing in doorways. You want something you can lean on for forty miles and then swing without it turning in your hands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    harick = { { id = "tp_harick", text = "Harick Boulderdrum is my partner. He knows wood better than anyone alive, and he flinches every time a wand hums." } },
    hall = { { id = "tp_hall", text = "The Hall of Mysteries is where my customers learn everything except what to do up close. I handle that part." } },
    timberline = { { id = "tp_timberline", text = "Timberline Arms sells proper soldiers' weapons in the Military Ward. Brenwyn there sends me anyone in a robe." } },
    background = { { id = "tp_bg", text = "I assisted a mage in Gnomeregan. I carried his books, and I wish I'd carried him." } },
    _none = { { id = "tp_none", text = "Not a clue! Ask me about something with an edge on it." } },
  },
}

---------------------------------------------------------------------------
-- Hjoldir Stoneblade: blades at Stoneblade's, Forlorn Cavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hjoldir", id = TODO_NPC("Hjoldir Stoneblade"), name = "Hjoldir Stoneblade", title = "Blade Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "wary", "dry" }, values = { "discretion", "craft" },
  notices = { "kit", "class" },
  impression = {
    first = "Hjoldir Stoneblade sells blades from his shop in the Forlorn Cavern, where the customers prefer not to be asked their business. He asks nothing, remembers every face, and keeps a clean ledger for the day someone comes asking.",
    third = "{name} met Hjoldir Stoneblade, the blade merchant at Stoneblade's in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, an' shut the door behind ye. The cavern's damp, an' damp is nae friend tae steel." },
    { id = "g_back", when = { metBefore = true }, text = "I ken yer face. Ye bought from me before, an' ye paid in full, so ye're welcome." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ye walk quiet. Fenthwick's lot are down the way, if it's teachin' ye want. If it's a blade, ye've found it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That edge has been used hard an' put away dirty. I'll no' ask on what. I'll only say a new one costs less than a broken one." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Ye'll be from the far end o' the cavern. Yer folk buy the thin knives, an' I've learned no' tae wonder what they're for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hjoldir Stoneblade. I sell daggers, short swords an' the odd longer piece, an' I sell them in the Forlorn Cavern because the rent's a third o' the Commons. The neighbours are quiet, an' I've learned why." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Aye. Ask, an' keep yer voice down, sound carries over the water." },
      },
      choices = {
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "Why keep shop down here?", next = "cavern" },
        { text = "Who are your neighbours?", next = "neighbours" },
        { text = "You must sell to some dark customers.", next = "dark" },
        { text = "What makes a good dagger?", next = "dagger" },
        { text = "What do the fishermen catch in that pool?", next = "pool" },
        { text = "Good day, Hjoldir.", next = "END" },
      },
    },
    cavern = {
      lines = { { id = "cavern_default", text = "Rent, as I said, an' peace. Up in the Military Ward ye've Timberline Arms wi' four counters an' a line out the door. Down here a customer can take an hour over a blade wi' naebody at his elbow. There's a sort o' buyer who values that." } },
      choices = { { text = "What sort of buyer?", next = "dark" }, { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "neighbours_default", text = "Fenthwick an' his rogues, who pay prompt an' never haggle. Tynnus Venomsprout, who sells what he calls remedies. The warlocks at the far end, Briarthorn an' his fellows, who keep tae themselves. An' the fishermen at the pool, who see everythin' an' say less than I do." } },
      choices = { { text = "Does it trouble you, living among them?", next = "neighbours_trouble" }, { text = "Something else.", next = "BACK" } },
    },
    neighbours_trouble = {
      lines = { { id = "neighbours_trouble_default", text = "No. A rogue's the safest neighbour there is, for they dinnae foul their own doorstep. I've never been robbed down here. I was robbed twice in the Commons, in daylight, by respectable folk." } },
      choices = { { text = "Honour among thieves, then.", next = "BACK", reply = "Good sense among thieves. It lasts longer than honour.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    dark = {
      big = true,
      lines = { { id = "dark_default", text = "I sell tae whoever puts coin on the counter, an' I write every sale in the ledger wi' a name, real or no', an' a description that's always real. If the guard ever comes askin' after a blade o' mine, I'll have tae choose whether tae open that book." } },
      choices = {
        { text = "Open it. A merchant who shields murderers shares their guilt.", next = "BACK", reply = "Aye. That's why I keep it. I'd no' be writin' descriptions if I meant tae burn it.", fx = { align = { order = 1 } } },
        { text = "Burn it. Your customers trust your silence, and that trust is your trade.", next = "BACK", reply = "It is my trade, an' ye're no' wrong. But I've a conscience as well as a shop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dagger = {
      lines = { { id = "dagger_default", text = "Balance, before edge. Any fool can sharpen a blade. Lay it across yer finger at the guard, an' if the point drops, it's a pry bar. If it sits level, it'll go where yer hand goes wi'out ye thinkin' on it." } },
      choices = { { text = "What about the steel?", next = "dagger_steel" }, { text = "Something else.", next = "BACK" } },
    },
    dagger_steel = {
      lines = { { id = "dagger_steel_default", text = "Ironforge steel, from the Great Forge, an' I'll no' stock other. Ironus Coldsteel's students make the most o' mine. I had a crate from Stormwind once, bonny tae look at, an' three o' them snapped at the tang in my own hands." } },
      choices = { { text = "Dwarven steel it is.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    pool = {
      lines = { { id = "pool_default", text = "Pale wee things wi' nae eyes tae speak of, for the water comes up from under the mountain an' has never seen the sun. The fishermen swear by them. I've lived beside that pool nine years, an' I buy my fish in the Commons." } },
      choices = { { text = "A cautious dwarf.", next = "BACK", reply = "A livin' one. The two go together down here.", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    fenthwick = { { id = "tp_fenthwick", text = "Fenthwick teaches the rogues, down the way. He's cheerful, he pays on the day, an' I count my stock after he leaves anyway." } },
    tynnus = { { id = "tp_tynnus", text = "Tynnus Venomsprout sells remedies next door. He's a soft-spoken wee man, an' I buy nothin' from him." } },
    guard = { { id = "tp_guard", text = "The guards come through twice a day. They look at the water, an' they dinnae look at us." } },
    background = { { id = "tp_bg", text = "Stoneblades have made an' sold edges for longer than the cavern's been called forlorn. I'm the one who moved us down here." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' if I did, I'd likely no' say. It's that sort o' street." } },
  },
}

---------------------------------------------------------------------------
-- Gwenna Firebrew: barmaid at the Stonefire Tavern, Commons; kin to Innkeeper Firebrew.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gwenna", id = TODO_NPC("Gwenna Firebrew"), name = "Gwenna Firebrew", title = "Barmaid", gender = "female",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "lively", "shrewd" }, values = { "hearty", "family" },
  notices = { "drunk", "weary" },
  impression = {
    first = "Gwenna Firebrew carries the ale at the Stonefire Tavern in the Commons, where her uncle keeps the inn. She can balance six mugs, end a quarrel with a look, and tell a traveller's home by what they order.",
    third = "{name} met Gwenna Firebrew, the barmaid at the Stonefire Tavern in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae the Stonefire! Find a seat near the hearth if ye can, an' I'll be wi' ye before ye've got yer gloves off." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'll guess: the same as last time, an' closer tae the fire." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're a late one. The kitchen's banked, but the ale never sleeps, an' neither do I, by the look o' things." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had yer fill somewhere else, I see. Sit down before ye fall down, an' I'll bring ye water an' call it ale." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Ye look like ye've walked through a war. Sit. Uncle will see ye have a bed, an' I'll see ye have somethin' hot first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gwenna Firebrew. My uncle keeps the inn an' I keep the mugs full, an' between us we've heard every tale that's come through the gates o' Ironforge. What'll it be, a drink or a bit o' talk? I can manage both." },
      },
      again = {
        { id = "h_again", text = "What else, love?" },
        { id = "h_again2", text = "Aye, go on, I've a moment before that table starts shoutin' again." },
      },
      choices = {
        { text = "Let me see what you're pouring.", next = "BUSINESS" },
        { text = "What do travellers drink, these days?", next = "drinks" },
        { text = "You must hear every rumour in the city.", next = "rumours" },
        { text = "How do you keep the peace in here?", next = "peace" },
        { text = "I'm told you trade stories with the barmaid at Bruuk's Corner.", next = "edris" },
        { text = "What does a human order that gives them away?", next = "human", when = { race = "Human" } },
        { text = "Thank you, Gwenna.", next = "END" },
      },
    },
    drinks = {
      lines = { { id = "drinks_default", text = "I can tell ye where a body's from by the order. Dwarves want stout an' nae talk till the second. Gnomes want somethin' wi' a name as long as their arm. Humans ask what's good, an' the night elves ask for water an' look at the mug as if it might bite." } },
      choices = { { text = "And what's the house best?", next = "drinks_best" }, { text = "Something else.", next = "BACK" } },
    },
    drinks_best = {
      lines = { { id = "drinks_best_default", text = "Thunderbrew lager, up from Kharanos, for them that want it light. For a proper dwarf I pour Uncle's own dark, which he brews in the back an' willnae give the recipe for, even tae me. I've been watchin' him do it for nine years, an' I'm close." } },
      choices = {
        { text = "You'll have it out of him yet.", next = "BACK", reply = "I've the malt an' the hops. It's whatever he drops in at the end while he's standin' in my way.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rumours = {
      lines = { { id = "rumours_default", text = "I hear all o' them, an' most are froth. Dark Iron spies in the Senate, the King's daughter seen in three places at once, a gnome who's built a machine tae dig Gnomeregan out by spring. I pass on the ones about the roads, for those keep folk alive." } },
      choices = { { text = "What do you hear about the roads?", next = "rumours_roads" }, { text = "Something else.", next = "BACK" } },
    },
    rumours_roads = {
      lines = { { id = "rumours_roads_default", text = "That Dun Algaz is thick wi' orcs again, so go in company. That the troggs at Gol'Bolar have dug themselves in, an' the Senate's sent a senator tae look at the hole. An' that the Loch road's fine, if ye dinnae stop tae pet the bears." } },
      choices = { { text = "I'll keep to company in Dun Algaz.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    peace = {
      big = true,
      lines = { { id = "peace_default", text = "Wi' a look, mostly, an' a full mug set down hard between two fools. Last week a human sellsword called a gnome a half-pint an' the gnome went for his knee. Uncle wanted them both thrown in the snow. I only threw the human, for he started it." } },
      choices = {
        { text = "You judged it fairly. The one who starts it should pay for it.", next = "BACK", reply = "That's how I saw it. The gnome bought the house a round after, so I think the house agreed.", fx = { align = { honor = 1 } } },
        { text = "Your uncle was right. House rules apply to both, or to no one.", next = "BACK", reply = "So he said, an' at some length. He's the innkeeper, an' I'm only the one carryin' the tray.", fx = { trait = { stern = 1 } } },
        { text = "The gnome drew first blood. I'd have thrown him and kept the paying customer.", next = "BACK", reply = "Then I'm glad it's no' yer tavern, love.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    edris = {
      lines = { { id = "edris_default", text = "Edris Barleybeard, aye, at Bruuk's place in the Military Ward. We meet on our half day an' compare the worst singers o' the week. She gets the soldiers an' I get the merchants, an' the merchants are worse, for they think they're good." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "human_default", text = "\"Wine.\" Every time, as if we kept a vineyard under the mountain. I pour them the Stormwind red we keep for the purpose, an' they look so grateful ye'd think I'd pulled a thorn out o' their paw." } },
      choices = { { text = "Guilty. I'd have asked for wine.", next = "BACK", reply = "I ken ye would, love. It's already on the tray.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    firebrew = { { id = "tp_firebrew", text = "Innkeeper Firebrew is my uncle. He's jolly as a feast day till somebody waters the ale, an' then ye'll see a different dwarf." } },
    edris = { { id = "tp_edris", text = "Edris Barleybeard pours at Bruuk's Corner. She's a good friend an' a terrible gossip, an' I'm the same." } },
    myra = { { id = "tp_myra", text = "Myra Tyrngaarde brings our bread round every mornin', still warm. I've never worked out when that woman sleeps." } },
    background = { { id = "tp_bg", text = "I came tae help Uncle for one Winter Veil, nine years back. I'm still helpin'." } },
    _none = { { id = "tp_none", text = "I've no' heard a word about that, an' I hear most things. Ask me again next week." } },
  },
}

---------------------------------------------------------------------------
-- Bailey Stonemantle: banker at the Vault of Ironforge; the youngest Stonemantle at the counters.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bailey", id = TODO_NPC("Bailey Stonemantle"), name = "Bailey Stonemantle", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful", "exact" }, values = { "duty", "family" },
  notices = { "purse", "class" },
  impression = {
    first = "Bailey Stonemantle is the youngest of the Stonemantles at the counters of the Vault of Ironforge. He is cheerful for a banker, quick with the ledgers, and rather in awe of the vault door.",
    third = "{name} met Bailey Stonemantle, a banker at the Vault of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae the Vault of Ironforge! What can I fetch up for ye, or put away?" },
    { id = "g_back", when = { metBefore = true }, text = "Good tae see ye again. Yer box is just as ye left it, an' I'd ken if it wasnae." },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Good day tae ye! I can hear that purse from here, an' I'd be glad tae give it somewhere safer tae sleep." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 100 } },
      text = "Ye're travellin' light in the purse, friend. There's nae shame in an empty box, an' we keep them just as carefully as the full ones." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye've a way o' lookin' at the door behind me. Everybody in yer trade does. It's nine feet o' dwarven steel, an' it's been looked at before." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bailey Stonemantle, at yer service. The Stonemantles have kept this vault for longer than anybody's written down, an' I'm the newest of us at the counter, which means Barnum checks my sums an' Soleil checks his." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, ask away, the ledgers will keep." },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "How does a Stonemantle learn the trade?", next = "learn" },
        { text = "Tell me about the vault door.", next = "door" },
        { text = "Has anyone ever tried to rob the Vault?", next = "rob" },
        { text = "You must have walked a long way to bank here.", next = "far", when = { race = "NightElf" } },
        { text = "Do you ever wonder what's in the boxes?", next = "boxes" },
        { text = "When is the Vault busiest?", next = "busy" },
        { text = "Good day, Bailey.", next = "END" },
      },
    },
    learn = {
      lines = { { id = "learn_default", text = "In the back room, for seven years, wi' a slate. Ye copy ledgers till yer hand cramps, an' ye're no' let near a customer till ye can add a column upside down. I came out tae the counter two winters ago, an' I've no' made an error yet." } },
      choices = { { text = "Not one, in two winters?", next = "learn_error" }, { text = "Something else.", next = "BACK" } },
    },
    learn_error = {
      lines = { { id = "learn_error_default", text = "No' one that left the counter. Barnum caught a copper out o' place in my first week, an' he never said a word about it. He set the ledger in front o' me, open, an' went tae his dinner. I found it before he'd finished his soup." } },
      choices = {
        { text = "That's a good way to be taught.", next = "BACK", fx = { affinity = 1 } },
        { text = "One copper hardly matters.", next = "BACK", reply = "It matters tae whoever's copper it is. That's the first thing on the slate.", fx = { trait = { stern = 1 } } },
      },
    },
    door = {
      lines = { { id = "door_default", text = "Nine feet across an' as thick as I am tall, cast in one piece at the Great Forge in my great-grandfather's day. It took forty dwarves an' a team o' rams tae bring it up the ring. I oil the hinges on the first o' each month, an' I'll admit I talk tae it." } },
      choices = { { text = "What do you say to it?", next = "BACK", reply = "Good mornin', mostly. Soleil does the same, so I ken I'm no' daft.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    rob = {
      lines = { { id = "rob_default", text = "Tried, aye. A Dark Iron crew tunnelled for it in my grandfather's time, an' came up in the wrong chamber, an' met the guard at breakfast. An' there's a mage every few years who thinks the wards are for show, an' wakes up in the Commons wi' a sore head." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "far_default", text = "There's a few o' yer people bank wi' us, an' they keep very old things here, older than the Vault itself. Soleil says they visit them the way ye'd visit a friend. I've never liked tae ask what's in them, an' I'm no' allowed tae anyway." } },
      choices = { { text = "Old things are safest under old stone.", next = "BACK", reply = "That's kindly said, an' ye're welcome under it as long as ye like.", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    boxes = {
      big = true,
      lines = { { id = "boxes_default", text = "Every day. There's one on the third row that's no' been opened in sixty years, an' the fee's paid each spring by a letter wi' nae name. I've the key on my ring. I've held it, an' I've stood in front o' that box." } },
      choices = {
        { text = "Leave it shut. A banker who looks once will look again.", next = "BACK", reply = "Aye. That's what the slate says, an' it's what I've done. I only needed tae hear it from somebody who isnae a Stonemantle.", fx = { align = { honor = 1 } } },
        { text = "Look. Sixty years is long enough, and no one would ever know.", next = "BACK", reply = "I'd know. An' the door would, I think. No, friend, ye'll no' talk me round.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    busy = {
      lines = { { id = "busy_default", text = "When a tram's come in, an' again at dusk, when the adventurers are back from Loch Modan wi' their packs full. There's a steady run between us an' the auction house besides. I've seen a gnome make the trip nine times in an hour, sellin' the one hat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    barnum = { { id = "tp_barnum", text = "Barnum Stonemantle stands at the next counter. He's the steadiest dwarf I ken, an' he's never once been late." } },
    soleil = { { id = "tp_soleil", text = "Soleil Stonemantle has the quietest voice in the Vault an' the sharpest pencil. I'd no' cross her ledger for a king's ransom." } },
    vault = { { id = "tp_vault", text = "We've never lost so much as a button. I mean tae be an old dwarf sayin' the same." } },
    background = { { id = "tp_bg", text = "Seven years in the back room, an' two at the counter. I'm a Stonemantle, so naebody asked what else I'd like tae be." } },
    _none = { { id = "tp_none", text = "I couldnae say, an' if it's about a customer, I wouldnae." } },
  },
}

---------------------------------------------------------------------------
-- Barnum Stonemantle: senior banker at the Vault of Ironforge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_barnum", id = TODO_NPC("Barnum Stonemantle"), name = "Barnum Stonemantle", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "ironforge" }, temper = { "grave", "steady" }, values = { "duty", "tradition" },
  notices = { "purse", "class" },
  impression = {
    first = "Barnum Stonemantle is the senior Stonemantle at the counters of the Vault of Ironforge. He is grave, exact and unhurried, and has not been late or wrong in the memory of anyone who works beside him.",
    third = "{name} met Barnum Stonemantle, a banker at the Vault of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day. Yer name, if ye please, an' then what ye'd have brought up." },
    { id = "g_back", when = { metBefore = true }, text = "Good day tae ye again. Yer account is in order. It always is, here." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Good day, {g:brother|sister}. Yer family's banked wi' mine a good while, I'd wager. Most have." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Ye're carryin' a great deal on yer person. I'd advise against it. The roads are what they are." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Yer order keeps certain things wi' us that it would rather no' keep in a chapel. They're safe, an' that's all I'll say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Barnum Stonemantle. I keep accounts in the Vault of Ironforge, as my father did an' his before him. What's left wi' us stays wi' us till ye ask for it, an' naebody else's askin' counts for anythin'." },
      },
      again = {
        { id = "h_again", text = "Is there anythin' further?" },
        { id = "h_again2", text = "Aye. Go on." },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "Nobody's asking? Not even the King's?", next = "king" },
        { text = "What do you make of young Bailey?", next = "bailey" },
        { text = "What's the strangest thing left in the Vault?", next = "strange" },
        { text = "How has the Vault fared since Gnomeregan fell?", next = "gnomes" },
        { text = "Every banker here is a Stonemantle.", next = "family" },
        { text = "Good day, Barnum.", next = "END" },
      },
    },
    king = {
      lines = { { id = "king_default", text = "The King banks here himself, an' he stands in the line. A Stonemantle once refused a thane his own brother's box, in the War o' the Three Hammers, an' was near hanged for it. He's the one whose portrait we keep in the back room." } },
      choices = { { text = "What if the Senate demanded a box?", next = "king_senate" }, { text = "Something else.", next = "BACK" } },
    },
    king_senate = {
      big = true,
      lines = { { id = "king_senate_default", text = "It has happened, in my time. A senator came wi' a writ for a box he said belonged tae a Dark Iron agent. He may well have been right. I told him tae bring the owner, or the owner's death notice, an' he left very angry." } },
      choices = {
        { text = "You were right. If the Vault opens for one writ, it opens for every one.", next = "BACK", reply = "So my father taught me. The day we open a box for the powerful, we're nae longer a bank.", fx = { align = { order = -1 } } },
        { text = "You were wrong. Ironforge's safety outweighs a banker's rule.", next = "BACK", reply = "I've lost sleep over that very thought. The box is still shut, an' I'm still no' certain.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bailey = {
      lines = { { id = "bailey_default", text = "He talks tae the door. He thinks I dinnae ken. He's also the quickest hand wi' a ledger I've trained, an' he found his own first error before I'd finished my soup. He'll have my counter one day, an' the Vault will be none the worse." } },
      choices = { { text = "Have you told him that?", next = "BACK", reply = "I set the ledger in front o' him an' walked away. He understood.", fx = { trait = { reserved = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "strange_default", text = "I'll no' tell ye what's in any box. I'll tell ye that one hums at night, that one has tae be kept cold, an' that one is paid for each spring by a letter wi' nae name on it. Soleil has asked the owner o' the first tae come an' fetch it." } },
      choices = { { text = "Does the humming not worry you?", next = "strange_hum" }, { text = "Something else.", next = "BACK" } },
    },
    strange_hum = {
      lines = { { id = "strange_hum_default", text = "It has hummed for eleven years an' done nothin' else. I worry about fire, flood an' errors in addition, in that order. A box that hums is a box that's still there." } },
      choices = { { text = "A banker's sort of comfort.", next = "BACK", reply = "It's the only sort I trust.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "gnomes_default", text = "We took in every gnome who reached the gates wi' somethin' tae keep, an' we waived the first year's fee. Some came wi' a single gear in a handkerchief. We boxed the gear, an' wrote it in the ledger like anythin' else." } },
      choices = { { text = "That was generously done.", next = "BACK", reply = "It was correctly done. They'd lost a city, an' they'd no' lose a gear in my keepin'.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "family_default", text = "Aye, an' for a reason. Ye cannae hire trust. A Stonemantle bairn is taught the slate before the hammer, an' them that marry in sit the same seven years in the back room. My own wife did, an' she found an error o' my father's in her second." } },
      choices = {
        { text = "What did your father say?", next = "BACK", reply = "He thanked her, an' corrected it, an' it's in the ledger in his own hand. That's the family, right there.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    bailey = { { id = "tp_bailey", text = "Bailey is the youngest at the counters. He's cheerful, which is unusual in the family, an' I've decided no' tae cure him of it." } },
    soleil = { { id = "tp_soleil", text = "Soleil Stonemantle checks my sums an' I check hers. In thirty years we've found two errors between us, an' both were mine." } },
    door = { { id = "tp_door", text = "Cast in one piece at the Great Forge. It's been attempted, an' it's never been opened by a hand that wasnae ours." } },
    background = { { id = "tp_bg", text = "I've stood at this counter thirty-one years. Before that I was in the back room wi' a slate, like every Stonemantle." } },
    _none = { { id = "tp_none", text = "That isnae a matter for the Vault. I've nothin' tae say on it." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Buckler: dwarf auctioneer in the Commons, beside Redmuse and Lympkin.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_buckler", id = TODO_NPC("Auctioneer Buckler"), name = "Auctioneer Buckler",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "ironforge" }, temper = { "booming", "fair" }, values = { "order", "practical" },
  notices = { "purse", "wealth" },
  impression = {
    first = "Auctioneer Buckler calls the lots at the Ironforge auction house in a voice that carries to the gates. He is the house's stickler for its rules, and has the deposit schedule by heart.",
    third = "{name} met Auctioneer Buckler, who calls lots at the Ironforge auction house.",
  },
  greetings = {
    { id = "g_hi", text = "Step up, step up! Buyin' or sellin', it all goes through the book, an' the book's open." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more! Let's see whether yer lots found a buyer, or whether the house is keepin' yer deposit." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner, by the dust on ye. Copper's dear this week an' tin's cheap, an' if ye've silver I'll want tae hear about it quietly." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 100 } },
      text = "Ye've nae coin tae bid wi', friend, but ye've a pack. Turn it out, for one dwarf's rubbish is a gnome's missin' part." },
    { id = "n_rich", cat = "wealth", when = { money = { min = 1000000 } },
      text = "Now there's a purse wi' some weight tae it. Bid as ye please, an' mind the bid's bindin' once I've called it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Buckler, auctioneer. Redmuse reads the market an' Lympkin does the sums, an' I call the lots an' keep the rules, because somebody has tae, an' I've the voice for it. They can hear me in the Stonefire, an' I've had complaints." },
      },
      again = {
        { id = "h_again", text = "What else? I've a lot closin' shortly." },
        { id = "h_again2", text = "Aye, ask, quick as ye like." },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "What are the rules of the house?", next = "rules" },
        { text = "What sells best in Ironforge?", next = "sells" },
        { text = "Tell me about Redmuse and Lympkin.", next = "others" },
        { text = "Does anyone ever try to cheat the house?", next = "cheat" },
        { text = "Your voice must reach the gates.", next = "voice" },
        { text = "Good day, Buckler.", next = "END" },
      },
    },
    rules = {
      lines = { { id = "rules_default", text = "Three, an' they're simple. Ye pay a deposit tae list, an' ye lose it if the lot doesnae sell. A bid is bindin' the moment it's called. An' the house takes its cut from the seller, never the buyer, so naebody can say we charged them for the pleasure o' spendin'." } },
      choices = { { text = "Why keep the deposit?", next = "rules_deposit" }, { text = "Something else.", next = "BACK" } },
    },
    rules_deposit = {
      lines = { { id = "rules_deposit_default", text = "Or every fool in the Commons would list his old boots at a hundred gold on the chance o' a drunk biddin'. The deposit makes a seller think. I've explained it eleven times this mornin', an' I'll explain it eleven more before supper." } },
      choices = {
        { text = "It's a fair rule.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "It falls hardest on the poor seller.", next = "BACK", reply = "Aye, it does, an' I'll no' pretend otherwise. I've yet tae hear a better rule, though.", fx = { trait = { kind = 1 } } },
      },
    },
    sells = {
      lines = { { id = "sells_default", text = "Ore an' bars, before anythin'. This city eats copper an' iron the way a furnace eats coal. After that it's cloth for the tailors, herbs for Tinker Town, an' whatever the adventurers drag back from Loch Modan that they cannae wear themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "others_default", text = "Redmuse can tell ye what tin will fetch on Thursday by lookin' at who's in the Commons on Tuesday. Lympkin can add a page while ye're still readin' the first line. I can be heard over both o' them, an' that's my whole contribution." } },
      choices = { { text = "You sell yourself short.", next = "BACK", reply = "I'm a dwarf, I do everythin' short. But thank ye.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cheat = {
      lines = { { id = "cheat_default", text = "Weekly. They bid on their own lots through a cousin, tae push the price. Or two sellers agree tae hold the copper back till the smiths are desperate. I ken the faces by now, an' I ken the cousins." } },
      choices = { { text = "What do you do when you catch them?", next = "cheat_catch" }, { text = "Something else.", next = "BACK" } },
    },
    cheat_catch = {
      big = true,
      lines = { { id = "cheat_catch_default", text = "The house rule says I bar them a month. But the last one I caught was a widow sellin' her man's tools, wi' her brother biddin' them up so she'd clear the rent. By the rule she's barred, same as any sharp." } },
      choices = {
        { text = "Bar her. A rule that bends for one bends for all.", next = "BACK", reply = "That's the rule, an' I'm its keeper. I barred her, an' I've no' liked myself for it since.", fx = { align = { order = 1 } } },
        { text = "Let her be. Rules are for sharps, not for widows.", next = "BACK", reply = "I very near did. If ye see a set o' mason's tools listed under my own name, ye'll ken how I settled it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    voice = {
      lines = { { id = "voice_default", text = "It was trained tae. I called ore lots beside the Great Anvil, over the hammers, for twenty years. The only soul in the Commons louder than me is Myra Tyrngaarde wi' her bread, an' she does it walkin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    redmuse = { { id = "tp_redmuse", text = "Redmuse is blunt as a mallet about prices an' she's never wrong. I'd no' bid against her advice." } },
    lympkin = { { id = "tp_lympkin", text = "Lympkin came out o' Gnomeregan wi' a pencil an' nothin' else. She keeps her ledger in a shorthand none of us can read." } },
    stonefire = { { id = "tp_stonefire", text = "The Stonefire Tavern's across the way. Gwenna Firebrew says my voice curdles the ale, an' brings me a mug anyway." } },
    background = { { id = "tp_bg", text = "I called the ore lots at the Great Forge for twenty years. The Commons is quieter, if ye'll believe it." } },
    _none = { { id = "tp_none", text = "That's no' been listed wi' this house, so I couldnae put a price on it." } },
  },
}
