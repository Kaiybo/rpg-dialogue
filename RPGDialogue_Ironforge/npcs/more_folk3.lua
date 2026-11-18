-- More Dun Morogh folk (second pass of missed NPCs): Loslor Rudge at Steelgrill's Depot, Veron Amberstill and
-- Ultham Ironhorn at Amberstill Ranch, the Kharanos trainers Grif Wildheart, Maxan Anvol, Azar Stronghammer,
-- Magis Sparkmantle and Hogral Bakkan, and Branstock Khalder in Anvilmar.
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
