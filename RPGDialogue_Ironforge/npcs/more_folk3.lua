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
    lr_gnome = {
      lines = { { id = "lrg_default", text = "Bought? They bought half my stock every season, an' paid on time, which is more than I can say for dwarves. Since the city fell, the ones in Tinker Town buy scrap an' fuses an' talk about goin' home, an' I sell it tae them cheap an' dinnae argue." } },
      choices = {
        { text = "We'll take Gnomeregan back one day.", next = "BACK", reply = "Aye, an' when ye do, I'll be first in line tae sell ye the powder for it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    lr_hunter = {
      lines = { { id = "lrh_default", text = "Then ye've fired my shot, for Hegnar loads nae other. Keep yer barrel clean an' yer powder dry, an' if it ever misfires, blame the gun an' no' the shot, for I weigh every one." } },
      choices = { { text = "I'll blame Hegnar, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
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
        { text = "Gnomeregan's engineers must have bought from you once.", next = "lr_gnome", when = { race = "Gnome" } },
        { text = "I shoot one of Hegnar's guns myself.", next = "lr_hunter", when = { class = "HUNTER" } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' the rams remember ye, {g:lad|lass}! Come tae the fence, for they've been lookin' for ye since ye left." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The rams'll sell tae anyone who can pay, for they're no' particular. I'm a wee bit more particular than they are." },
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
        { text = "A ram should be sold with its true temper told plain.", next = "BACK", reply = "Aye, for a ram that bucks on the mountain pass is a dwarf in a ravine, an' I'll no' have it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the bad-tempered ones to strangers. They'll learn to ride.", next = "BACK", reply = "They'll learn tae fly, more like, off the side o' the pass, an' I'll no' have that on my fence.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your rams.", next = "BUSINESS" },
        { text = "Why only dwarves and their friends?", next = "dwarves" },
        { text = "What makes an Amberstill ram the best?", next = "best" },
        { text = "How is the ranch faring?", next = "ranch" },
        { text = "Which ram would you pick for me?", next = "pick" },
        { text = "What does a ram eat through a Dun Morogh winter?", next = "d0_feed" },
        { text = "Your niece Yarlyn has lost her rabbit again.", next = "d0_yarlyn" },
        { text = "Good day, Veron.", next = "END" },
      },
    },
    d0_feed = {
      lines = { { id = "d0fe_default", text = "Hay we cut in the short summer an' stack till the barns groan, an' lichen off the rocks, which they dig out for themselves. A ram that's been fed soft all winter is a poor climber come spring, so I make them work for some of it." } },
      choices = {
        { text = "Where do you cut hay in country like this?", next = "d0_feed_hay" },
        { text = "My grandfather kept rams. He swore by lichen.", next = "BACK", when = { race = "Dwarf" }, reply = "Then he kent his beasts, an' it sounds like ye've his good sense. Lichen makes a ram's feet hard an' its temper harder." },
        { text = "Working for supper keeps them sharp.", next = "BACK" },
      },
    },
    d0_feed_hay = {
      lines = { { id = "d0fh_default", text = "The low meadows south o' the ranch, when the snow pulls back for a few weeks. It's the same ground the Frostmane like tae cross, so we cut wi' a rifle leanin' on the cart an' Ultham watchin' the ridge." } },
      choices = {
        { text = "Haymaking with a rifle to hand. Only in Dun Morogh.", next = "BACK" },
        { text = "Something else, Veron.", next = "BACK" },
      },
    },
    d0_yarlyn = {
      lines = { { id = "d0ya_default", text = "Fluffy, aye. That rabbit's been out o' its crate more than in it, an' every time the whole ranch stops work tae look under the hay. Turuk says rabbits have nae place on a ram ranch, an' then he builds her a new latch." } },
      choices = {
        { text = "And you? Do you help search?", next = "d0_yarlyn_you" },
        { text = "Every ranch needs a soft spot or two.", next = "BACK" },
      },
    },
    d0_yarlyn_you = {
      lines = { { id = "d0yy_default", text = "I'll deny it if ye tell anybody, but I've found the beast twice in the ram barn, curled up against the grey, an' carried her back. The grey's never let another soul near his stall, so he's a better judge o' rabbits than I am o' buyers." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' still walkin' straight! Ye took tae the saddle like a born rider, an' I'm proud o' ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. I'll teach ye the saddle, but I'll no' be catchin' ye when ye fall, an' ye will fall." },
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
        { text = "A riding instructor should push students hard but fair.", next = "BACK", reply = "Aye, for the mountain doesnae go easy on a careless rider, an' neither should I.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pass them all. They'll learn the hard way on the road.", next = "BACK", reply = "They'll learn it in a snowdrift wi' a broken leg, an' I'll no' send anyone out like that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to ride.", next = "BUSINESS" },
        { text = "What's the trick to staying on a ram?", next = "trick" },
        { text = "Four hundred falls?", next = "falls" },
        { text = "Why do dwarves ride rams at all?", next = "why" },
        { text = "Which ram should a beginner ask for?", next = "which" },
        { text = "What's the worst ground to ride a ram over?", next = "d0_country" },
        { text = "You rode with the mountaineers once.", next = "d0_mount" },
        { text = "Good day, Ultham.", next = "END" },
      },
    },
    d0_country = {
      lines = { { id = "d0co_default", text = "Wet rock, an' worse than that, wet rock wi' ice on it, which is half o' Dun Morogh from autumn on. The road tae Loch Modan's no' bad, but the old trails above Shimmer Ridge would make a ram say its prayers." } },
      choices = {
        { text = "How do you ride over ice, then?", next = "d0_country_ice" },
        { text = "Then I'll keep to the road.", next = "BACK" },
      },
    },
    d0_country_ice = {
      lines = { { id = "d0ci_default", text = "Slowly, an' wi' the ram's head down, for it sees the footing better than ye do. Tognus Flintfire at the Kharanos forge puts studs in the shoes for winter, an' that's worth more than any lesson I can give ye." } },
      choices = {
        { text = "Studded shoes. I'll remember that.", next = "BACK" },
        { text = "Something else, Ultham.", next = "BACK" },
      },
    },
    d0_mount = {
      lines = { { id = "d0mo_default", text = "Twenty years, on the high patrols between Kharanos an' the North Gate. We rode where the trolls thought nae dwarf could follow, an' I learned every way there is tae fall off a ram on duty." } },
      choices = {
        { text = "Why did you leave the patrols?", next = "d0_mount_leave" },
        { text = "My kin served with the mountaineers too.", next = "BACK", when = { race = "Dwarf" }, reply = "Then raise a mug tae them for me at the Thunderbrew. There's nae finer company on a cold ridge." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_mount_leave = {
      lines = { { id = "d0ml_default", text = "My knees, as I said, an' a ram called Boulder who went over a ledge wi' me on his back. We both lived, but he wouldnae carry a rider after, an' neither would my legs, so Veron offered me the pen an' Boulder the high pasture." } },
      choices = {
        { text = "Is Boulder still up there?", next = "BACK", reply = "Aye, fat an' grey an' content, an' he still comes tae the fence when I whistle." },
        { text = "Something else.", next = "BACK" },
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
    _none = { { id = "tp_none", text = "Nae idea, friend, an' if ye cannae ride it, then I'm nae use tae ye on the subject." } },
  },
}

---------------------------------------------------------------------------
-- Grif Wildheart: hunter trainer in Kharanos; Daera Brightspear sends young hunters to him.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_grif", id = TODO_NPC("Grif Wildheart"), name = "Grif Wildheart", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "kharanos" }, temper = { "gruff", "wild" }, values = { "nature", "honest" },
  notices = { "pet", "class" },
  impression = {
    first = "Grif Wildheart trains hunters on the hill above Kharanos and is happier with beasts than with dwarves. The guards say he spends too much time with animals, and he would agree that it is nowhere near enough.",
    third = "{name} met Grif Wildheart, the hunter trainer at Kharanos who sets Dun Morogh's young hunters their first taming.",
  },
  greetings = {
    { id = "g_hi", text = "Hrm, ye walk loud, so stand still a moment an' let the hill get used tae ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again, an' quieter this time, which is good, for the hill notices." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Daera sent ye, I'd wager, so sit an' tell me what ye saw on the road up, an' I'll ken how much ye've got tae learn." },
    { id = "g_tame", tags = { "news" }, when = { questActive = TODO_QUEST("Taming the Beast") }, text = "Well? Did it come tae the rod, or did it come for yer throat?" },
    { id = "g_tamed", when = { class = "HUNTER", pet = { type = "Beast" }, questDone = TODO_QUEST("Taming the Beast") }, text = "Hrm, there's the pair o' ye, an' the beast's walkin' on yer left like it means tae stay." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Yer {pet}'s favourin' a back leg, so look between the toes for ice, for it packs in an' cuts." },
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", maxLevel = 9 },
      text = "There's nae beast at yer side yet, an' that's right, for ye're no' ready an' the beast would ken it. Come back when ye've ten seasons o' sense." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Grif Wildheart. I teach huntin' out here, where there's somethin' tae hunt; the others teach under Belm's roof wi' a mug in hand, an' I've nae quarrel wi' that, but ye cannae learn tae track on floorboards." },
        { id = "h_young", when = { class = "HUNTER", maxLevel = 9 },
          text = "Ye're keen, an' I like keen, but ye're no' ready for a beast o' yer own. Go an' shoot wolves till ye've ten seasons on ye, an' then come up the hill an' we'll talk." },
        { id = "h_ready", when = { class = "HUNTER", minLevel = 10, questBefore = TODO_QUEST("Taming the Beast") },
          text = "Hrm, ye've the look o' somebody ready for a beast at last. I've a rod here that'll make a wild thing listen for as long as it takes tae decide about ye, an' three beasts on this mountain I'll have ye try it on." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Taming the Beast") },
          text = "Use the rod an' stand yer ground while it works, for the beast'll fight ye the whole time an' then all at once it'll stop. When it does, ye'll feel it, an' then let it go an' come back tae me." },
        { id = "h_done", when = { class = "HUNTER", questDone = TODO_QUEST("Taming the Beast"), questBefore = TODO_QUEST("Training the Beast") },
          text = "Boar, leopard an' bear, an' ye're still standin'. Ye've got the knack, so the next lesson isnae mine; go tae Belia Thundergranite in the Hall o' Arms, an' she'll teach ye tae keep what ye catch." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("Training the Beast") },
          text = "Ye're still here? Belia's in the Hall o' Arms, in the city, an' she'll no' come up the hill tae find ye." },
      },
      again = {
        { id = "h_again", text = "What else? The light's goin', an' so are the tracks." },
        { id = "h_again2", text = "Hrm. Ask, then, an' I'll answer if I can." },
        { id = "h_again3", when = { class = "HUNTER" }, text = "Go on, hunter. I've talked more today than in a week." },
      },
      choices = {
        { text = "I'm ready for a beast of my own, Grif.", next = "tame", when = { class = "HUNTER", minLevel = 10 } },
        { text = "When will I be ready for a beast?", next = "tame_wait", when = { class = "HUNTER", maxLevel = 9 } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What comes after taming, for a hunter?", next = "road", when = { class = "HUNTER", questDone = TODO_QUEST("Taming the Beast") } },
        { text = "They say you spend too long with animals.", next = "animals" },
        { text = "How does a hunter earn a beast's trust?", next = "trust" },
        { text = "What's worth hunting in Dun Morogh?", next = "game" },
        { text = "What signs should I watch for on the trail?", next = "signs" },
        { text = "Why do so many dwarves carry a rifle instead of a bow?", next = "dw_rifle", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "Humans don't often come up here to learn the hunt.", next = "hu_hunter", when = { race = "Human", class = "HUNTER" } },
        { text = "These snows are colder than any forest of my people.", next = "ne_snow", when = { race = "NightElf" } },
        { text = "I came a long way to learn from the mountain.", next = "sky", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "Good hunting, Grif.", next = "END" },
      },
    },
    tame_wait = {
      lines = { { id = "tw_default", text = "When ye've ten seasons on ye an' ye've stopped jumpin' at yer own shadow. A beast can smell fear an' it can smell green, an' just now ye smell o' both, so go an' shoot wolves an' come back." } },
      choices = {
        { text = "I'll come back when I'm ready.", next = "BACK", reply = "Good, an' I'll ken it when ye do, for ye'll walk up the hill quieter.", fx = { trait = { cautious = 1 } } },
        { text = "I could tame one now, if you'd let me.", next = "BACK", reply = "Ye could try, an' the beast would eat ye, an' I'd have tae tell Daera. Ten seasons.", fx = { trait = { brave = 1 } } },
      },
    },
    tame = {
      lines = {
        { id = "ta_default", text = "Then take this rod. It doesnae make a beast love ye; it only makes it listen long enough tae decide, an' while it's decidin' it'll fight ye wi' everythin' it's got. I want ye tae try it on a large crag boar first, then a snow leopard, then an ice claw bear, each one harder than the last." },
        { id = "ta_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "Ye've done it, all three, an' I watched ye from the ridge on the bear, which ye didnae know. Ye held still when it went for ye, an' that's the whole o' the trick." },
      },
      choices = {
        { text = "Why make me tame three and let them go?", next = "tame_three" },
        { text = "What if the beast fights back?", next = "tame_fight" },
        { text = "Which one should I keep?", next = "tame_keep" },
      },
    },
    tame_three = {
      lines = { { id = "tt_default", text = "Because the first one ye tame, ye'll think ye did it. By the third ye'll ken the beast did most o' the work, an' that's when ye're fit tae keep one. An' they go back tae the hill because they're the hill's, no' mine, an' no' yers either." } },
      choices = {
        { text = "That's fair to the beasts. I'll let them go.", next = "BACK", reply = "Hrm, aye. They'll remember ye, after, an' they'll no' bother ye on the road.", fx = { align = { light = 1 } } },
        { text = "It's a waste of a good beast, if you ask me.", next = "BACK", reply = "Nobody did ask ye, an' the beast didnae ask tae be tamed either. Ye'll see it different by the third.", fx = { align = { light = -1 } } },
        { text = "Something else, Grif.", next = "BACK" },
      },
    },
    tame_fight = {
      lines = { { id = "tf2_default", text = "It will, an' ye let it. Stand where ye are an' keep yer hands where it can see them, an' dinnae hit it back, whatever it does tae ye. If ye flinch the rod breaks its hold, an' then ye've an angry bear an' nae rod." } },
      choices = {
        { text = "I won't flinch.", next = "BACK", reply = "They all say that, but I'll believe it when I see yer boots still in the same snow.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_keep = {
      lines = { { id = "tk_default", text = "Whichever one looks at ye after, an' no' through ye. A boar's stubborn an' hard tae kill, a cat's quick an' cunnin', an' a bear'll stand in front o' ye when things go wrong. Dwarves tend tae keep the boar, for reasons I'll leave ye tae work out." } },
      choices = {
        { text = "A boar, then. Stubborn suits me.", next = "BACK", reply = "Hrm, it would. Feed it well an' it'll walk intae a trogg cave for ye.", fx = { trait = { stern = 1 } } },
        { text = "A cat. I'd rather strike first.", next = "BACK", reply = "Then ye'll want tae keep it fed an' happy, for a hungry cat goes its own way.", fx = { trait = { brave = 1 } } },
        { text = "A bear, to stand in front of me.", next = "BACK", reply = "Sensible. A bear won't win ye glory, but it'll get ye home.", fx = { trait = { cautious = 1 } } },
      },
    },
    road = {
      hub = true,
      lines = {
        { id = "rd_default", text = "A long road, an' I've walked most of it. Ye keep the beast, ye learn yer aspects an' yer stings, an' somewhere around thirty seasons ye learn tae fall down dead an' get up again, which I'll explain if ye ask." },
        { id = "rd_high", when = { minLevel = 40 }, text = "Ye've come a long way since the boar, I can see it in the mail on yer back an' the way the beast watches yer hands. What d'ye want tae know from an old dwarf on a hill?" },
      },
      again = { { id = "rd_again", text = "What else about the road?" } },
      choices = {
        { text = "How do I keep my beast loyal?", next = "loyal" },
        { text = "What's this about falling down dead?", next = "feign", when = { minLevel = 24 } },
        { text = "I've heard of an ancient who grows a bow in Felwood.", next = "rhok", when = { minLevel = 55 } },
        { text = "That's enough of the road. Something else.", next = "hello" },
      },
    },
    loyal = {
      lines = { { id = "lo_default", text = "Feed it what it likes an' feed it often, an' dinnae let it die on ye more than ye must. Every beast starts out wary an' learns tae trust ye a wee bit at a time, an' if it goes hungry long enough it'll leave ye, an' it'll be right tae." } },
      choices = {
        { text = "A hungry beast that leaves is only being honest.", next = "BACK", reply = "Aye, it is, an' I'd rather an honest beast than a loyal one I havnae earned.", fx = { align = { order = -1 } } },
        { text = "A beast that leaves its hunter wasn't trained well.", next = "BACK", reply = "Hrm. Or its hunter wasnae. Ye'll learn which, one day.", fx = { align = { order = 1 } } },
        { text = "Something else on the road.", next = "BACK" },
      },
    },
    feign = {
      lines = { { id = "fe_default", text = "Ye drop where ye stand an' stop breathin', an' whatever's chasin' ye loses interest. It's an old trick, older than dwarves; a fox does it, an' so does a beetle, an' if a beetle can manage it, so can ye. Learn it when yer trainer offers, an' practise where nobody's watchin', for at first ye'll look a fool." } },
      choices = {
        { text = "There's no shame in living to hunt again.", next = "BACK", reply = "None at all. The proud ones are under the snow.", fx = { align = { honor = -1 } } },
        { text = "Playing dead feels like cowardice to me.", next = "BACK", reply = "Then ye'll die proud, an' I'll say somethin' nice over ye. It's no' cowardice if ye get up again an' finish the job.", fx = { align = { honor = 1 } } },
        { text = "Something else on the road.", next = "BACK" },
      },
    },
    rhok = {
      big = true,
      lines = { { id = "rk_default", text = "Hrm. I've heard the tale an' I believe it, for the night elves dinnae lie about trees. They say an old ancient in Felwood, Hastat, will grow a bow for a hunter who's proved himself against the worst the world can throw, but it's a tale for the best of ye, no' for an old dwarf who likes his hill." } },
      choices = {
        { text = "Then I'll prove myself and bring the bow home.", next = "BACK", reply = "Bring it up the hill an' let me hold it, an' I'll die a happy dwarf.", fx = { trait = { brave = 1 } } },
        { text = "Something else on the road.", next = "BACK" },
      },
    },
    dw_rifle = {
      lines = { { id = "dr_default", text = "Because a rifle's a dwarven thing, built in a dwarven forge, an' it makes a noise that tells the whole mountain who's huntin'. I carry a bow myself, for the beasts hate the bang, but I'll no' tell a dwarf what tae carry." } },
      choices = {
        { text = "The rifle, then. Let the mountain hear me.", next = "BACK", reply = "Aye, it will. Mind ye dinnae frighten off yer own beast.", fx = { trait = { brave = 1 } } },
        { text = "A bow, then. I'd rather hunt quiet.", next = "BACK", reply = "Hrm, good. Ye'll see more o' the hill that way.", fx = { trait = { cautious = 1 } } },
      },
    },
    hu_hunter = {
      lines = { { id = "hh_default", text = "They don't, an' I didnae expect tae see one. I hear Stormwind's lettin' its folk take the bow an' the beast these days, an' the forest down there's gentle. Up here the beasts dinnae ken what a human is, so they'll judge ye on yer own." } },
      choices = {
        { text = "Then I'll give them a good first impression.", next = "BACK", reply = "Hrm, stand still an' dinnae shout, an' ye'll be ahead o' most dwarves.", fx = { affinity = 1 } },
        { text = "Something else, Grif.", next = "BACK" },
      },
    },
    ne_snow = {
      lines = { { id = "ns_default", text = "Aye, they would be. Yer folk hunt among the great trees, I'm told, an' ye walk soft enough tae make my wolves jealous. Up here the snow tells everythin' ye've done, so ye'll have tae learn tae walk where the wind's already been." } },
      choices = {
        { text = "I'll learn the snow, as I learned the forest.", next = "BACK", reply = "Hrm, I believe ye will. Ye've the patience for it, an' that's more than most.", fx = { affinity = 1 } },
        { text = "Something else, Grif.", next = "BACK" },
      },
    },
    sky = {
      lines = { { id = "sk_default", text = "Hrm, ye have, by the look o' ye. I dinnae ken yer island or yer beasts, an' I'll no' pretend tae, but the snow doesnae care where ye were born, an' neither does a boar." } },
      choices = {
        { text = "Then teach me as you'd teach a dwarf.", next = "BACK", reply = "I will, an' ye'll complain as much as one, I expect.", fx = { affinity = 1 } },
        { text = "Something else, Grif.", next = "BACK" },
      },
    },
    animals = {
      lines = { { id = "an_default", text = "The guards say that, an' the guards also stand in one spot all day an' call it work. A boar never lied tae me, an' a wolf never asked how I was keepin' when it didnae care tae hear." } },
      choices = {
        { text = "People aren't all bad.", next = "animals_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    animals_people = {
      lines = { { id = "ap_default", text = "No, they're no'. Daera Brightspear's all right, for she can sit an hour wi'out speakin', an' Belm sends up a pot o' stew when the snow's bad an' never mentions it after. That's two, an' I'm still thinkin' about a third." } },
      choices = { { text = "I'll try to be the third.", next = "BACK", reply = "Hrm, ye've stopped fidgetin', an' that's a start, for a beast reads yer hands before yer face.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tr_default", text = "Ye dinnae earn it, ye wait for it. Find the beast, sit where it can see ye, an' come back the next day an' the next, an' when it stops watchin' ye, it's decided; ye cannae hurry it, an' ye cannae buy it." } },
      choices = {
        { text = "Some hunters tame by force.", next = "trust_force" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_force = {
      big = true,
      lines = { { id = "tf_default", text = "Aye, they beat it down till it obeys, an' it works, an' quick. Ye get a beast that'll fight for ye till the day ye're weak, an' then ye find out what it thought o' ye all along." } },
      choices = {
        { text = "Then they deserve what they get.", next = "BACK", reply = "They do, an' I'll no' train them, an' I tell them why.", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Use what's quickest.", next = "BACK", reply = "Then ye've nae business on my hill, so think on it before ye come back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = { { id = "ga_default", text = "Crag boar for meat, snow leopard on the high ground if ye're patient, an' ice claw bear by the lake at Brewnall. Leave the wolves be unless they've come for the rams, for they were here before us." } },
      choices = { { text = "I'll leave the wolves.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    signs = {
      lines = { { id = "x1_default", text = "Look at what isnae there. Nae birds means somethin's huntin', an' nae tracks at a waterhole means somethin's watchin' it; folk look for prints, an' the prints are the last thing ye'll find." } },
      choices = {
        { text = "And if I find fresh prints?", next = "signs_fresh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    signs_fresh = {
      lines = { { id = "x2_default", text = "Then put yer hand in one. If the edge is sharp an' the snow inside is soft, it's close, so stop walkin' an' start thinkin' about which o' ye is the hunter." } },
      choices = { { text = "I'll check the edges.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    daera = { { id = "tp_daera", text = "Daera Brightspear, in the Hall o' Arms. She sends me the young ones before the city ruins their ears." } },
    belia = { { id = "tp_belia", text = "Belia Thundergranite trains the beasts in the Hall o' Arms, an' I send my hunters tae her once they've tamed somethin'. She talks tae them like bairns, an' they love her for it." } },
    kharanos = { { id = "tp_kharanos", text = "Too many chimneys, but the stew's good, an' it's a short walk from there tae where the tracks begin." } },
    peria = { { id = "tp_peria", text = "Peria Lamenur trains the beasts down by the inn. She's kind tae them, so I've nothin' tae say against her." } },
    background = { { id = "tp_bg", text = "I was born in the high valleys an' came down for the stew, an' that's all ye'll get out o' me." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye've returned, an' I can see ye've kept up yer prayers, for there's a light about ye that wasnae there before." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye've returned. I'll teach ye what the Light allows, but I'll be watchin' how ye use it." },
    { id = "g_hi", text = "Light be wi' ye. Mind the noise from below, an' tell me what brings ye up the stair." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've returned. Have ye kept up yer prayers, or only yer travels?" },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest, good. I'll hear how ye've used what ye were taught at Anvilmar before I teach ye more." },
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
        { text = "A priest should speak truth from the pulpit, even when it's unwelcome.", next = "BACK", reply = "Aye, for a priest who flatters is no priest at all, an' the Light knows the difference.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell the faithful what they want to hear. Comfort is kinder.", next = "BACK", reply = "Comfort's kind, aye, but a comforting lie is still a lie, an' the Light doesnae hear it kindly.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS" },
        { text = "A priest above a distillery is an odd sight.", next = "tavern" },
        { text = "How do you test your students?", next = "test" },
        { text = "How many wounded come through Kharanos?", next = "wounded" },
        { text = "What should a priest carry on the road?", next = "road" },
        { text = "You and Thamner Pol share the wounded, I hear.", next = "d0_thamner" },
        { text = "Where should a priest go after your teaching?", next = "d0_after" },
        { text = "Light keep you, Maxan.", next = "END" },
      },
    },
    d0_thamner = {
      lines = { { id = "d0th_default", text = "We do, an' we argue over every one o' them. Thamner trusts his splints an' his boilin' water, an' I trust the Light, an' between the two of us the patient usually lives long enough tae complain about us both." } },
      choices = {
        { text = "Does he doubt the Light?", next = "d0_thamner_doubt" },
        { text = "Splints and prayer together. A good pairing.", next = "BACK" },
      },
    },
    d0_thamner_doubt = {
      lines = { { id = "d0td_default", text = "No' doubt, exactly, for he's seen it close wounds an' he admits it. He says the Light can mend a bone set crooked as well as one set straight, so a physician had best set it straight first, an' I've nae answer for that but tae agree." } },
      choices = {
        { text = "He sounds like a wise man.", next = "BACK" },
        { text = "Something else, Maxan.", next = "BACK" },
      },
    },
    d0_after = {
      lines = { { id = "d0af_default", text = "Tae Ironforge, an' the Hall o' Mysteries. Theodrus Frostbeard an' Braenna Flintcrag teach there, an' High Priest Rohan will take the best of them, if they're willin' tae be humbled first." } },
      choices = {
        { text = "What does Rohan look for?", next = "d0_after_rohan" },
        { text = "I mean to study under Rohan one day.", next = "d0_after_rohan", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_after_rohan = {
      lines = { { id = "d0ar_default", text = "Somebody who'll sweep the floor o' the Hall wi'out askin' why. They say he once set a gifted student tae tendin' lamps for a whole season, an' the lad came out of it the finest healer o' his year." } },
      choices = {
        { text = "Humility before power. I understand.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
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
      lines = { { id = "x2_default", text = "Four words: Light, no' this one. I've said it over a hundred dwarves, an' it's been answered more often than no'. I teach it before any other." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' I've saved my worst joke for ye! Brace yerself, friend, for it's a terrible one an' ye deserve it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back again. I'll train ye, but I'll no' be tellin' ye any jokes today, an' that's the worst punishment I have." },
    { id = "g_hi", text = "Come in out o' the snow! Ye look frozen. D'ye ken why the trogg crossed the valley? Neither does he, that's the trouble wi' troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've a new joke, an' it's worse than the last, so brace yerself." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, ye'll be the one wi' the rune from Sten Stoutarm. Welcome, {g:lad|lass}. Sit by the fire an' we'll talk about the Light, an' I'll try no' tae jest. Much." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "First week out, is it? Ye've the look. Dinnae fret, everybody's hands shake at the start, an' the troggs here are slow." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Ye carry yerself careful, like ye're feared o' breakin' somethin', an' that's a healer's way, so ye'll do fine." },
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
        { text = "A priest should be honest with the sick, even about bad news.", next = "BACK", reply = "Aye, for a frightened dwarf deserves the truth, even if it's wrapped in a joke.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lie to the dying. They've enough to worry about.", next = "BACK", reply = "I'd sooner tell them a joke than a lie, an' a joke's the kinder thing, believe me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why all the jokes?", next = "jokes" },
        { text = "What does a novice priest learn first?", next = "first" },
        { text = "Who else teaches in Anvilmar?", next = "others" },
        { text = "What do you tell a novice who's afraid to fight?", next = "afraid" },
        { text = "What's the worst wound you've seen come in?", next = "d0_wound" },
        { text = "You'd make a fine innkeeper, with all those jokes.", next = "d0_inn" },
        { text = "Light be with you, Branstock.", next = "END" },
      },
    },
    d0_wound = {
      lines = { { id = "d0wo_default", text = "A recruit who wrestled a trogg for its club an' won, then broke his own foot tryin' tae swing it. The bad ones are the frostbite cases, though, for they come in quiet, an' the Light can only do so much for a toe that's gone black." } },
      choices = {
        { text = "How do you treat frostbite?", next = "d0_wound_frost" },
        { text = "Trogg teeth and dwarf pride. Both break.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    d0_wound_frost = {
      lines = { { id = "d0wf_default", text = "Warm water, never hot, an' prayer, an' patience, an' a great deal o' Durnan Furcutter's wool. Then I tell the one about the trogg an' the snowman till the recruit stops greetin', for a laughin' patient heals faster." } },
      choices = {
        { text = "I'll carry spare wool on the road.", next = "BACK" },
        { text = "Something else, Branstock.", next = "BACK" },
      },
    },
    d0_inn = {
      lines = { { id = "d0in_default", text = "Ha! My father said the same, for he wanted me in the brewin' trade. But an innkeeper tells jokes tae sell ale, an' I tell them tae steady hands, an' I've found I like the second sort o' customer better." } },
      choices = {
        { text = "Do the jokes ever fail you?", next = "d0_inn_fail" },
        { text = "My clan would say laughter has no place in a chapel.", next = "BACK", when = { race = "Dwarf" }, reply = "Mine said the same, but the Light made us tae laugh as well as weep, an' I'll stand on that at any altar." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_inn_fail = {
      lines = { { id = "d0if_default", text = "Once. A lass came in from the troll caves carryin' her brother's axe an' no brother, an' I had a joke ready an' didnae tell it. I sat wi' her till mornin' an' said nothin' at all, an' that was the right prayer that night." } },
      choices = {
        { text = "Knowing when to be quiet is a gift too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' the Light's been busy wi' ye again! Come up out o' the crush, friend, for I'm always glad tae see ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. I'll teach ye, for the Light is for everyone, but I'll no' pretend I'm glad o' it today." },
    { id = "g_hi", text = "Well met! Come up out o' the crush, there's room on the landing an' the Light's as good here as anywhere." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' still in one piece! The Light's been busy wi' ye." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "A paladin, grand! Show me how ye hold that hammer, an' then show me how ye kneel." },
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
        { text = "A paladin should face his enemy openly, never strike from hiding.", next = "BACK", reply = "Aye, for the Light doesnae skulk, an' a paladin who does has lost his way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strike from the shadows if it ends the fight sooner.", next = "BACK", reply = "Leave that tae the rogues, friend, for a paladin who hides has forgotten what he stands for.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS" },
        { text = "How long have you carried the hammer?", next = "long" },
        { text = "What do paladins do for Kharanos?", next = "kharanos" },
        { text = "Does teaching in a tavern tempt your students?", next = "tempt" },
        { text = "What's the first thing you ask a new paladin?", next = "ask" },
        { text = "What do you do when a student doubts?", next = "doubt" },
        { text = "What's the road to Ironforge like these days?", next = "d0_road" },
        { text = "You must miss the mountaineers.", next = "d0_mtn" },
        { text = "Light be with you, Azar.", next = "END" },
      },
    },
    d0_road = {
      lines = { { id = "d0ro_default", text = "Safer than it was, an' still no' safe. The Frostmane raid the low pastures, the wendigos come down out o' the Grizzled Den, an' there's talk o' Dark Irons watchin' the gates, so we ride it every week wi' the patrols." } },
      choices = {
        { text = "Where could a young paladin be useful?", next = "d0_road_help" },
        { text = "Sounds like the road keeps you busy.", next = "BACK" },
      },
    },
    d0_road_help = {
      lines = { { id = "d0rh_default", text = "Senator Mehr Stonehallow out at Gol'Bolar Quarry will take any hammer offered against the troggs. An' Rudra Amberstill will thank ye for any word o' the wendigo that's been takin' her rams." } },
      choices = {
        { text = "I'll start at Gol'Bolar.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else, Azar.", next = "BACK" },
      },
    },
    d0_mtn = {
      lines = { { id = "d0mt_default", text = "I'd miss them more if I didnae see them every day, but they come up the stair wi' the wounded. Half the lads Maxan patches carried rifles in my old company, an' they still call me by my old rank, which I pretend tae mind." } },
      choices = {
        { text = "Was it hard to put the rifle down?", next = "d0_mtn_rifle" },
        { text = "Once a mountaineer, always a mountaineer, they say.", next = "BACK", when = { race = "Dwarf" }, reply = "They do, an' it's true. I still wake at the change o' the watch, an' the Light hasnae cured me o' that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_mtn_rifle = {
      lines = { { id = "d0mr_default", text = "Harder than liftin' the hammer. A rifle keeps the trouble at a distance, an' a paladin walks right up tae it, which my old sergeant said was the daftest trade a sane dwarf ever chose." } },
      choices = {
        { text = "Your sergeant may have had a point.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    _none = { { id = "tp_none", text = "I couldnae say, friend, for I'm still learnin' myself, an' I'll be learnin' till my beard's white." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, splendid! You always have the best stories about things you've blown up on purpose, and I've been saving the bucket for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're back. Careful of the bucket, and careful of me, because I'm not in the mood for stories today." },
    { id = "g_hi", text = "Hello! Careful of the bucket, it's there for a reason, and the reason is mostly Tuesdays." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, splendid! Have you blown anything up, on purpose, I mean?" },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage, wonderful! Light this candle for me, would you, and only the candle, please, because the beam above it is load-bearing." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE", minLevel = 10 },
      text = "You've outgrown my little landing, I think! Go and see Bink in the Hall of Mysteries in Ironforge, and tell her I sent you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "I promise I'm very careful near the kegs, because Belm made me sign something about it." },
  },
  start = "hello",
  nodes = {
    mgs_poly = {
      big = true,
      lines = { { id = "mgsp_default", text = "Sheep, yes, and you'll want to practise on something that doesn't mind, and nothing in Dun Morogh minds less than a boar with a full belly. Please don't practise on the Thunderbrews' ram, because I did that once by accident and I'm still paying for the fence." } },
      choices = {
        { text = "A mage should only polymorph those who truly threaten others.", next = "BACK", reply = "Quite right, and the sheep in Dun Morogh would thank you for it if they could.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Polymorph anyone who annoys you. It's harmless, really.", next = "BACK", reply = "It's harmless until the Mystic Ward gets a complaint, and then it becomes my problem, and I hate paperwork.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll practise on troggs. They've earned it.", next = "BACK", reply = "They have, rather, though a trogg sheep is still very bad-tempered, so don't stand too close to it.", fx = { align = { light = -1 } } },
        { text = "I'll practise on something that won't be hurt by it.", next = "BACK", reply = "That's lovely of you, and the boars will thank you, in their way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Magis.", next = "BACK" },
      },
    },
    mgs_size = {
      big = true,
      lines = { { id = "mgss_default", text = "Frost, because a gnome my size can't outrun a trogg but can absolutely freeze one to the floor and then walk away with great dignity. Fire is for later, once you've learned to throw it over the heads of the dwarves in front of you." } },
      choices = {
        { text = "Frost first, then. Dignity matters.", next = "BACK", reply = "It does, and so does not being eaten, and frost manages both at once!", fx = { align = { order = 1 } } },
        { text = "Fire first. I want them gone, not stuck.", next = "BACK", reply = "I understand, I truly do, and I'll teach you fire, out on the snow, with the bucket.", fx = { align = { order = -1 } } },
        { text = "Something else, Magis.", next = "BACK" },
      },
    },
    mgs_dwarf = {
      lines = { { id = "mgsd_default", text = "Laugh? They're far too frightened! A dwarf who can throw a frostbolt is the most alarming thing on this landing, and Azar's paladins keep sneaking over to watch you, and your people take to frost very naturally, which I put down to the climate." } },
      choices = {
        { text = "The cold's in our bones, Magis.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Magis.", next = "BACK" },
      },
    },
    mgs_bink = {
      lines = { { id = "mgsb_default", text = "As soon as you can light my candle without singeing the beam, which by the look of you is today or tomorrow! Take the road west to Ironforge and find Bink in the Hall of Mysteries, tell her I sent you, and please don't mention the fires." } },
      choices = { { text = "I won't mention the fires. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_mgs_low", when = { class = "MAGE", maxLevel = 9 },
          text = "Your first spells already! Show me a Frostbolt at the post outside, and if it sticks, I'll show you how to pull water out of the air, which you'll be glad of on the Kharanos road." },
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
        { text = "Polymorph is next, isn't it? Sheep?", next = "mgs_poly", when = { class = "MAGE", minLevel = 6 } },
        { text = "Frost or fire, Magis, for a gnome my size?", next = "mgs_size", when = { race = "Gnome", class = "MAGE", maxLevel = 15 } },
        { text = "Do your students laugh at a dwarf mage, Magis?", next = "mgs_dwarf", when = { race = "Dwarf", class = "MAGE" } },
        { text = "When should I go on to Ironforge?", next = "mgs_bink", when = { class = "MAGE", minLevel = 8 } },
        { text = "Goodbye, Magis.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "I know, I know, but Belm and I have an agreement: frost and arcane indoors, fire out on the snow, and the bucket for the students who forget which is which. We've had three small fires and one very fast evacuation." } },
      choices = {
        { text = "Tell me about the evacuation.", next = "fire_evac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire_evac = {
      lines = { { id = "fe_default", text = "A student sneezed during a fire spell, right above the still room, and nothing caught, but forty dwarves have never left a tavern so quickly, and Jarven Thunderbrew carried out a full keg under each arm. He says he didn't feel the weight." } },
      choices = { { text = "A dwarf knows what to save first.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    paladins = {
      lines = { { id = "pa_default", text = "Azar Stronghammer has half the landing, and I have the other. His students pray while mine recite formulae, and after a month they'd all started humming the same tune. He's very kind, and he puts out the fires with his boot." } },
      choices = { { text = "A good neighbour for a mage.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wy_default", text = "After Gnomeregan, the High Tinker asked for volunteers to teach out in the valley, so the young ones wouldn't have to cross troll country to reach Ironforge. I put my hand up, because I'm not a great mage, but I'm a patient one." } },
      choices = {
        { text = "Is it hard, teaching refugees?", next = "why_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_hard = {
      big = true,
      lines = { { id = "wh_default", text = "Sometimes, yes, because they all want fire, and they all want it now, to burn the troggs out of our home. I teach them the slow way regardless, and some of them tell me I'm wasting time we don't have." } },
      choices = {
        { text = "Teach them properly. Haste gets mages killed.", next = "BACK", reply = "That's what I think, and thank you! I shall be very firm about the candle exercise.", fx = { align = { order = 1 } } },
        { text = "They're right. Give them what the fight needs.", next = "BACK", reply = "Oh dear, perhaps one extra fire lesson a week, then, outside on the snow.", fx = { align = { order = -1 } } },
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
      lines = { { id = "x2_default", text = "Oh, the bread's dreadful, though it's food, technically. I conjured a loaf for Innkeeper Belm once and he used it to prop the cellar door, and it's still there." } },
      choices = { { text = "A lasting contribution to the inn.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belm = { { id = "tp_belm", text = "Innkeeper Belm is very patient with me. I've replaced two of his curtains, and he only mentions it when I'm in earshot." } },
    gnomeregan = { { id = "tp_gnomer", text = "It's just over the hills to the west, and on a still day you can see the vents, so I try not to look." } },
    bink = { { id = "tp_bink", text = "Bink, in Ironforge, taught me my theory at the Academy. I send her my best students and hope they don't mention the fires." } },
    background = { { id = "tp_bg", text = "I was a lamp-enchanter for the tram tunnels, so teaching's a promotion, I think." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye again, an' this time ye came in by the side door wi'out a sound. Ye've learned well, an' I'll admit I'm proud." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again, an' by the front door. Shut it behind ye, an' let's get this lesson done quick." },
    { id = "g_hi", text = "Ye'll be wantin' the bar, friend, it's back the way ye came. Unless ye meant tae find me, in which case shut the door." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye came in by the front this time. I'd hoped I'd taught ye better." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "There ye are. I heard ye on the third stair, so we'll start wi' that." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE", minLevel = 10 },
      text = "Ye've come along. It's time ye went up tae Ironforge an' found Hulfdan Blackbeard in the Forlorn Cavern. Tell him Hogral sent ye, an' be ready for him tae be rude about it." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Ye're green as moss, an' that's fine, for naebody suspects the green ones, so make use of it while it lasts." },
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
        { text = "A rogue should never steal from those who can't afford it.", next = "BACK", reply = "Aye, for there's no skill in robbin' the poor, an' no honour either.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Steal from anyone. The poor are easiest to rob.", next = "BACK", reply = "Easiest, aye, an' cheapest, an' the shame of it lasts longer than the coin.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why the kitchen?", next = "kitchen" },
        { text = "Does Belm really not know?", next = "belm" },
        { text = "What use is a rogue to Dun Morogh?", next = "use" },
        { text = "What's the first lesson for a new rogue?", next = "lesson" },
        { text = "What does a kitchen hand overhear at the Thunderbrew?", next = "d0_hear" },
        { text = "You keep a very sharp set of knives.", next = "d0_knives" },
        { text = "I was never here, Hogral.", next = "END" },
      },
    },
    d0_hear = {
      lines = { { id = "d0he_default", text = "Everythin', an' it all comes through the hatch. The mountaineers argue over the trogg counts, the Senate men moan about the cost o' the road, an' now an' then a stranger asks one question too many about the gate patrols." } },
      choices = {
        { text = "What happens to that stranger?", next = "d0_hear_stranger" },
        { text = "A kitchen hatch makes a fine listening post.", next = "BACK" },
      },
    },
    d0_hear_stranger = {
      lines = { { id = "d0hs_default", text = "He gets a fine supper an' a long chat wi' a friendly kitchen hand, an' a note goes tae Ironforge by the mornin' post. Hulfdan's folk decide the rest, an' I go back tae my turnips." } },
      choices = {
        { text = "Remind me never to ask questions at the bar.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Hogral.", next = "BACK" },
      },
    },
    d0_knives = {
      lines = { { id = "d0kn_default", text = "A kitchen hand's knives should be sharp, friend, or Gremlock shouts. That they're balanced for throwin' is a happy accident I've never had tae explain tae anybody." } },
      choices = {
        { text = "Does Gremlock suspect anything?", next = "d0_knives_gremlock" },
        { text = "Mine are balanced the same way. Happy accident.", next = "BACK", when = { class = "ROGUE" }, reply = "Then we've both been very lucky wi' our cutlers, an' we'll say nae more about it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_knives_gremlock = {
      lines = { { id = "d0kg_default", text = "Gremlock suspects I'm too slow wi' the onions, an' that's the whole o' his suspicion. He's a cook through an' through, an' a dwarf who looks that hard at a pot never looks hard at the one stirrin' it." } },
      choices = {
        { text = "The best disguise is a dull one.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
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
    background = { { id = "tp_bg", text = "I'm a kitchen hand, friend, an' ye can ask anybody in the place." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are again! Belm's lost another round tae me on yer account, so sit down an' let me buy ye one wi' his money." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's yerself. Pull up a stool if ye must, but I'll no' be askin' ye tae settle any arguments today." },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for more, an' ye're my best customer for flux this winter! I'd know yer face in a snowstorm, an' I'd be glad tae see it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back for more? I'll sell ye what ye need, but I'll no' be makin' small talk while I do it." },
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
        { text = "A tradesman should sell good flux and fair thread to all.", next = "BACK", reply = "Aye, for my livin' depends on folk comin' back, an' they'll only come back if I'm honest.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cheap stock to the newcomers. They won't know better.", next = "BACK", reply = "They'll know better the second time, an' they'll no' come back a third, so I'll keep it honest.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your trade goods.", next = "BUSINESS" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "You count everything twice.", next = "thrift" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What do folk run out of most?", next = "short" },
        { text = "What news comes up with the wagon?", next = "wagon" },
        { text = "Who comes in asking for things you don't stock?", next = "d0_ask" },
        { text = "Your scales look older than the stall.", next = "d0_scales" },
        { text = "Good day, Golorn.", next = "END" },
      },
    },
    d0_ask = {
      lines = { { id = "d0as_default", text = "Every second customer. They want swords, an' I send them tae Grawn Thromwyn; they want boots, an' I send them tae Gamili; they want a drink, an' I point at the door wi' the singin' behind it." } },
      choices = {
        { text = "Does anyone ever thank you for it?", next = "d0_ask_thanks" },
        { text = "You'd make a fine town crier.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    d0_ask_thanks = {
      lines = { { id = "d0at_default", text = "Grawn does, wi' a sack o' coal at Winter Veil, an' Gamili sends me the odd scarf. The customers never do, but a dwarf who's been sent tae the right door comes back tae mine for his thread, an' that's thanks enough." } },
      choices = {
        { text = "Goodwill is its own coin.", next = "BACK" },
        { text = "Something else, Golorn.", next = "BACK" },
      },
    },
    d0_scales = {
      lines = { { id = "d0sc_default", text = "Older than me, an' truer than most dwarves. My grandfather had them made at the Great Forge, an' the weights are stamped an' checked every spring, so naebody in Kharanos has ever argued a measure wi' me twice." } },
      choices = {
        { text = "Has anyone argued once?", next = "d0_scales_argue" },
        { text = "A gnome could recalibrate those in an afternoon.", next = "BACK", when = { race = "Gnome" }, reply = "A gnome offered, last spring. I said if he touched them I'd recalibrate him, an' he took it very well." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_scales_argue = {
      lines = { { id = "d0sa_default", text = "A goblin pedlar, years back, who swore my flux was light by a quarter-ounce. I weighed it in front o' half the town, an' then I weighed his, an' he left Kharanos that same afternoon." } },
      choices = {
        { text = "Honest scales make short arguments.", next = "BACK" },
        { text = "Let me ask something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' all yer fingers still there! The gloves did their work again, an' I'm right glad tae see ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. I'll sell ye leather for the cold, but I'll no' be fussin' over yer fingers this time." },
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
        { text = "Cloth and leather should be sold warm enough for this country.", next = "BACK", reply = "Aye, for a coat that lets the wind through out here is a death sentence, an' I'll no' sell one.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell thin cloth as winter wear. Newcomers don't know the difference.", next = "BACK", reply = "They'll know it in the first blizzard, an' some o' them willnae live tae complain.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You line everything with fleece?", next = "fleece" },
        { text = "Is the cold truly so dangerous?", next = "cold" },
        { text = "What do the recruits forget?", next = "forget" },
        { text = "Where do you get your hides?", next = "hides" },
        { text = "Who else outfits travellers in Kharanos?", next = "shops" },
        { text = "Where do your travellers come from?", next = "d0_travel" },
        { text = "You sew right here at the counter, I see.", next = "d0_sew" },
        { text = "Stay warm, Gamili.", next = "END" },
      },
    },
    d0_travel = {
      lines = { { id = "d0tr_default", text = "Humans, mostly, up from the Wetlands or off the tram, who think a mountain in summer is warm because it's summer. Then there were the gnomes out o' Gnomeregan, who left everythin' behind an' arrived in their workshop aprons." } },
      choices = {
        { text = "Did you outfit many of the gnomes?", next = "d0_travel_gnomes" },
        { text = "Humans never believe the snow until it's on them.", next = "BACK" },
      },
    },
    d0_travel_gnomes = {
      lines = { { id = "d0tg_default", text = "Every one I could, an' I sent the bill tae nobody. They came over the passes in a long grey line wi' the wee ones blue at the lips, so I cut up my whole winter stock an' sewed through the night." } },
      choices = {
        { text = "My people still remember that kindness.", next = "BACK", when = { race = "Gnome" }, fx = { affinity = 2 } },
        { text = "That was generously done.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Gamili.", next = "BACK" },
      },
    },
    d0_sew = {
      lines = { { id = "d0se_default", text = "Aye, for a coat meant for Kharanos should be sewn where ye can hear the wind it's meant for. My mother sat at this same counter, an' she said a needle that forgets the cold makes a coat that forgets it too." } },
      choices = {
        { text = "What's the hardest piece to sew?", next = "d0_sew_hard" },
        { text = "Your mother sounds a wise woman.", next = "BACK" },
      },
    },
    d0_sew_hard = {
      lines = { { id = "d0sh_default", text = "Mittens, an' I'll hear nae argument. Every finger's a seam an' every seam's a place for the snow tae creep in, so I line them twice wi' Rudra's fleece, an' still I lose sleep over the thumbs." } },
      choices = {
        { text = "I'll never take mittens for granted again.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye again, an' wi' the same hammer as last time! Ye look after yer tools, an' that's a thing I always respect." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. Hammers are there, tongs are there, an' ye can pick them out yerself today." },
    { id = "g_hi", text = "Hammers, tongs, flux an' coal. If ye're here tae look at swords, the weaponsmith's that way." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Have ye worn out that hammer already, or only lost it?" },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, good! Tell me what ye're makin' an' I'll tell ye what ye're missin'." },
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
        { text = "A smith's tools should be sold sound, without hidden cracks.", next = "BACK", reply = "Aye, for a cracked hammer head flies off at the worst moment, an' I've seen the scars it leaves.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cracked tools cheap. The buyer should check them.", next = "BACK", reply = "The buyer checks wi' their face, usually, an' I'll no' have that on my conscience.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Your tools hang in a very exact order.", next = "order" },
        { text = "What does a village forge make most?", next = "village" },
        { text = "How is it, working beside Tognus?", next = "tognus" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "Which hammer should a beginner buy?", next = "hammer" },
        { text = "What was it like striking at the Great Forge?", next = "d0_forge" },
        { text = "Golorn says you two shook on who sells what.", next = "d0_golorn" },
        { text = "Good day, Thrawn.", next = "END" },
      },
    },
    d0_forge = {
      lines = { { id = "d0fo_default", text = "Loud, hot an' grand. A striker swings the big hammer where the master taps, an' ye learn tae hit exactly where the smith's wee hammer has just been, all day, wi'out a word between ye." } },
      choices = {
        { text = "How did your shoulder go?", next = "d0_forge_shoulder" },
        { text = "My uncle struck at the Great Forge, years ago.", next = "BACK", when = { race = "Dwarf" }, reply = "Then he'll have the same shoulder as me by now, an' the same deaf ear. Give him my regards, whoever he is." },
        { text = "Silent work between two smiths. I like that.", next = "BACK" },
      },
    },
    d0_forge_shoulder = {
      lines = { { id = "d0fs_default", text = "Twenty years o' the same swing, an' one cold mornin' it simply stopped. Bengus Deepforge found me this post an' said a dwarf who kens the weight o' every hammer by heart should be the one handin' them out." } },
      choices = {
        { text = "Bengus chose well.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Thrawn.", next = "BACK" },
      },
    },
    d0_golorn = {
      lines = { { id = "d0go_default", text = "We did, the day I opened, wi' Belm for a witness an' a mug apiece. I sell what a smith strikes wi', he sells what a smith uses up, an' if a customer wants both we send them across tae each other." } },
      choices = {
        { text = "Has either of you ever broken that deal?", next = "d0_golorn_break" },
        { text = "A fair bargain makes good neighbours.", next = "BACK" },
      },
    },
    d0_golorn_break = {
      lines = { { id = "d0gb_default", text = "Once, an' it was me. I sold a pot o' flux tae a desperate lad when Golorn was shut, an' I walked the coin across tae him the next mornin'. He counted it twice an' said nothin', which is how I ken we're friends." } },
      choices = {
        { text = "Counting twice is Golorn's handshake.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! The young bear's settled now, an' he likes ye already, which is more than he does for most strangers." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Welcome back. Keep yer hands low an' yer voice soft, for the bear an' I are both still decidin' about ye." },
    { id = "g_hi", text = "Hello there. Keep yer hands low an' yer voice soft a moment, for I've a young bear here who's still decidin' about strangers." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Let me see how ye've both been gettin' on." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, good. I'll no' ask how well ye shoot, but I will ask when yer beast last ate, an' whether ye ate first." },
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
        { text = "A beast should be trained with kindness, never with fear.", next = "BACK", reply = "Aye, for a beast trained wi' kindness will follow ye anywhere, an' one trained wi' fear will turn on ye.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fear trains a beast faster than kindness ever will.", next = "BACK", reply = "Faster, aye, an' it'll be the first thing it remembers when it finally decides tae bite.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train my companion.", next = "BUSINESS" },
        { text = "What do hunters get wrong with their beasts?", next = "wrong" },
        { text = "You and Grif seem very different.", next = "grif" },
        { text = "Which Dun Morogh beasts make good companions?", next = "beasts" },
        { text = "That young bear looks nervous.", next = "bear" },
        { text = "What should I feed a beast in this cold?", next = "feed" },
        { text = "How do I keep a beast happy once I have it?", next = "hp", when = { class = "HUNTER", minLevel = 10 } },
        { text = "I'm not ready for a beast yet. What should I learn?", next = "hp_young", when = { class = "HUNTER", maxLevel = 9 } },
        { text = "I've seen what wolves are like in my own forests.", next = "hp_elf", when = { race = "NightElf" } },
        { text = "Farewell, Peria.", next = "END" },
      },
    },
    hp_young = {
      lines = { { id = "hpy_default", text = "Learn tae watch beasts before ye ever think o' keepin' one. Sit outside the inn at dusk an' watch the wolves come down tae the bins, an' see which ones lead an' which ones wait, an' by the time Grif hands ye his rod ye'll ken more than most." } },
      choices = {
        { text = "I'll go and watch them tonight.", next = "BACK", reply = "Take a blanket, for they come late an' the cold doesnae.", fx = { trait = { cautious = 1 } } },
        { text = "Something else, Peria.", next = "BACK" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Feed it, keep it warm, an' dinnae let it die on ye, an' then do all three again tomorrow. A beast's loyalty grows slow, like a beard, an' it falls out a great deal faster if ye neglect it." },
        { id = "hp_pet", when = { pet = { type = "Beast" } }, text = "Let me see {pet}, now. Aye, it's eatin' well enough, but it's cold, an' a cold beast is a cross one; feed it, keep it warm, an' dinnae let it die on ye, an' it'll love ye the rest o' its days." },
      },
      again = { { id = "hp_again", text = "Anythin' else, softly?" } },
      choices = {
        { text = "My beast sulks when I've been away long.", next = "hp_sulk" },
        { text = "Can my beast learn new things?", next = "hp_learn" },
        { text = "Something else, Peria.", next = "hello" },
      },
    },
    hp_sulk = {
      lines = { { id = "hps_default", text = "It would, for it's been waitin' on ye. Feed it somethin' it likes an' sit wi' it a while, an' it'll forgive ye, but dinnae make a habit o' it, for a beast's patience runs out like anyone's, an' one day it simply willnae be there." } },
      choices = {
        { text = "It's right to sulk. I'll make it up to it.", next = "BACK", reply = "That's the answer o' somebody worth bein' sulked at.", fx = { align = { light = 1 } } },
        { text = "A beast ought to wait without complaint.", next = "BACK", reply = "Would ye? Nobody waits forever wi'out complaint, an' a beast's honest enough tae show it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_learn = {
      lines = { { id = "hpl_default", text = "It can, from me or from the wild. Bring it here an' I'll teach it tae growl an' tae bite harder, an' as ye travel ye'll meet beasts who know tricks I cannae teach, an' if ye tame them a while ye'll learn the trick yerself." } },
      choices = {
        { text = "Then I'll bring it back often.", next = "BACK", reply = "Do, for I like tae see how they grow.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_elf = {
      lines = { { id = "hpe_default", text = "Have ye? Then ye'll know wolves are no' cruel, only hungry an' careful, same as us. The ones up here are leaner than any in yer forests, I'd guess, for the snow takes a toll, an' they're bolder for it." } },
      choices = {
        { text = "Hunger makes every creature bold.", next = "BACK", reply = "Aye, it does, an' that's worth rememberin' when ye meet a hungry troll.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wrong_default", text = "They feed them last. A hunter comes in off the snow, sees tae his rifle, his boots an' his own supper, an' then throws the beast what's left. It kens. It'll fight for ye just the same, but it'll no' look at ye, an' ye'll never get its best." } },
      choices = { { text = "What else?", next = "wrong_else" }, { text = "Something else.", next = "BACK" } },
    },
    wrong_else = {
      lines = { { id = "wrong_else_default", text = "Shoutin', for a wolf hears ye whisper at fifty paces, an' every command I teach can be given under yer breath, an' the day ye need a beast tae hold still wi' a Frostmane scout ten feet off, ye'll be glad I was stubborn about it." } },
      choices = { { text = "Quiet commands. I'll practise.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    grif = {
      lines = { { id = "grif_default", text = "We are, an' we're no'. He cannae abide people an' I rather like them, but we'd both sooner sit wi' a boar than a senator. He sends me every beast his students tame, an' I've never once had tae undo somethin' he taught." } },
      choices = { { text = "He said he had nothing to say against you.", next = "BACK", reply = "From Grif, that's a love letter, an' I'll treasure it.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "beasts_default", text = "A crag boar, for a beginner, for they're stubborn an' greedy an' loyal as stone, which is tae say they're dwarves wi' tusks. The snow leopard's bonnier, but she'll test ye every day o' her life, an' the ice claw bear's for somebody wi' patience an' a deep larder." } },
      choices = { { text = "And wolves?", next = "beasts_wolves" }, { text = "Something else.", next = "BACK" } },
    },
    beasts_wolves = {
      lines = { { id = "beasts_wolves_default", text = "A winter wolf will give ye everythin', an' it'll break its heart if ye leave it stabled for a season. Dinnae take a wolf unless ye mean tae keep it at yer side. Shelby Stoneflint at the stable has two that pine, an' it's a hard thing tae watch." } },
      choices = { { text = "I wouldn't leave a wolf behind.", next = "BACK", fx = { trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    bear = {
      big = true,
      lines = { { id = "bear_default", text = "He is, poor lad. A hunter brought him in last week, thin an' flinchin' at a raised hand, an' wants him made fierce by spring; I can do it quickly, the way it was done tae him before, or I can take the time tae do it right an' send the hunter away angry." } },
      choices = {
        { text = "Take your time. A beast broken by fear is no companion.", next = "BACK", reply = "That's what I mean tae do, an' he can be as angry as he likes, for the bear's no' his tae ruin twice.", fx = { align = { light = 1 } } },
        { text = "Do as he asks. It's his beast, and his coin.", next = "BACK", reply = "It's his coin, aye. I've never thought a beast was anybody's the way a rifle is.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed = {
      lines = { { id = "feed_default", text = "Fat, an' plenty of it: boar belly for a wolf or a cat, an' never straight out o' the snow, for frozen meat chills a beast from the inside. Carry it under yer own coat for an hour first, an' if ye'll no' do that much for it, ye've nae business keepin' one." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back intact again, and your judgment along with you, by the look of it. That makes you my favourite student." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You've come back. Close the door, keep your voice down, and let's make this lesson as brief as we both prefer." },
    { id = "g_hi", text = "Close the door behind you. The dwarves are tolerant so long as they don't have to look, and I prefer to keep them tolerant." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back intact, and I'll assume your judgment has too until you show me otherwise." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Alamar Grimm taught you at Anvilmar, I expect, which means you know the incantations and have been told a great deal about whose fault everything is." },
    { id = "g_lockh", when = { class = "WARLOCK", race = "Human" }, text = "A human warlock in Kharanos is rare enough that I'll want to know who taught you before I teach you anything, so sit down and tell me." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your hands are steady and your eyes are tired, which is the correct arrangement. Reverse them and I would not teach you." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, and you'll want to tell me what I am. Azar Stronghammer does so weekly on the stair, and I've begun to time him." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He's standing over a chalk circle with a brass rule, measuring its radius for what is clearly not the first time today.",
      lines = {
        { id = "h_default", text = "Gimrizz Shadowcog. I teach the binding and use of demons behind the ale casks, by arrangement with an innkeeper who asks no questions, and I teach it on the understanding that a demon is an engine that wants to kill its operator." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I teach the binding and use of demons behind the ale casks, and I teach it on one understanding: a demon is an engine that wants to kill its operator. If you've come here thinking otherwise, Alamar has failed you and I'll start over." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it brief, because the circle's drying." },
        { id = "h_again2", text = "Carry on, if you've more to ask, and I'll keep measuring." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Is there another question? Ask it now, while the room's quiet, rather than later in the snow when it isn't." },
      },
      choices = {
        { text = "A warlock should be truthful with the dwarves about their arts.", next = "BACK", reply = "Truthful and discreet, because the dwarves are tolerant only so long as nobody lies to them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Keep the dwarves in the dark. What they don't know won't hurt them.", next = "BACK", reply = "It won't hurt them, perhaps, but it will certainly hurt you, the day they find out on their own.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS" },
        { text = "My imp likes me, I think.", next = "likes", when = { class = "WARLOCK", pet = { family = "Imp" } } },
        { text = "When can I bind something bigger than an imp?", next = "void", when = { class = "WARLOCK", maxLevel = 15 } },
        { text = "Why does Kharanos put up with a warlock?", next = "kharanos" },
        { text = "What's the first rule you teach?", next = "rule" },
        { text = "Why would a gnome take up this craft?", next = "why" },
        { text = "Who shares this back room with you?", next = "dannie" },
        { text = "Do you blame the dwarves for leaving Gnomeregan to its fate?", next = "blame", when = { race = "Gnome" } },
        { text = "I'll leave you to it, Gimrizz.", next = "END" },
      },
    },
    kharanos = {
      lines = { { id = "kharanos_default", text = "Because the Frostmane have shamans and the troggs have numbers, and a village with twelve mountaineers cannot be particular. Belm gave me the room, and Senir Whitebeard knows I'm here and has decided that he doesn't, which is a very dwarven sort of arrangement." } },
      choices = { { text = "And the priest upstairs?", next = "kharanos_priest" }, { text = "Let's talk about something else.", next = "BACK" } },
    },
    kharanos_priest = {
      lines = { { id = "kharanos_priest_default", text = "Maxan Anvol and I have spoken once. He said that my craft imperils my soul, and I said that his cots were full and that I could empty the ridge of what was filling them, and we have not needed to speak since, though he takes my students when they are burned." } },
      choices = { { text = "He heals them, all the same.", next = "BACK", reply = "He does, and I've noted it, so I don't pretend the man is a hypocrite.", fx = { trait = { kind = 1 } } }, { text = "Back to the craft, then.", next = "BACK" } },
    },
    rule = {
      lines = { { id = "rule_default", text = "That the demon is never on your side. An imp will flatter you and a voidwalker will obey you, and both are measuring the binding the whole time for the place it is weakest, so a student who tells me \"my imp likes me\" is sent home that day." } },
      choices = { { text = "That seems severe.", next = "rule_severe" }, { text = "I'll keep my opinions of my imp to myself.", next = "BACK" } },
    },
    rule_severe = {
      big = true,
      lines = { { id = "rule_severe_default", text = "I had a student, a clever one, who grew fond of her imp and loosened its binding by one clause, as a kindness. It burned her workshop and two neighbours' besides, and she lived, and I have refused to teach her since, though she asks each month." } },
      choices = {
        { text = "You're right to refuse. Some mistakes should close the door.", next = "BACK", reply = "That is my position, because control once surrendered is surrendered more easily the second time.", fx = { align = { order = 1 } } },
        { text = "Teach her again. Nobody knows the rule better now.", next = "BACK", reply = "Hm, that is not without logic. Dannie says the same, and I had dismissed it as sentiment.", fx = { align = { order = -1 } } },
        { text = "Does she still keep the imp?", next = "BACK", reply = "No. Dannie sent it back herself, and it went without a word, which I found more troubling than if it had screamed." },
      },
    },
    likes = {
      lines = { { id = "likes_default", text = "No, it doesn't, and you'll stop thinking so before you leave this room. Tell me what it did that made you believe it, and I'll tell you what it wanted." } },
      choices = {
        { text = "It warned me about an ambush.", next = "likes2" },
        { text = "It says I'm its favourite master.", next = "likes2", reply = "It says that to all of them, and it means it the way a lock means it to a key." },
      },
    },
    likes2 = {
      lines = { { id = "likes2_default", text = "Then it wanted you alive a little longer, because a living master can be talked into a looser binding and a dead one cannot. Send it back tonight, call it fresh in the morning, and watch how quickly it starts again." } },
      choices = { { text = "That's a sour thing to learn.", next = "BACK", reply = "Sour is cheap, and the alternative is expensive.", fx = { trait = { cautious = 1 } } } },
    },
    void = {
      lines = { { id = "void_default", text = "Around your tenth season of the craft you'll be ready for a voidwalker, and I won't be the one binding it. Lago Blackwrench in the Forlorn Cavern sends our people to Gakin the Darkbinder in Stormwind, and you'll need a soul shard and a steady stomach." } },
      choices = {
        { text = "How do I come by a soul shard?", next = "void2" },
        { text = "Lago, then Gakin. I'll remember.", next = "BACK" },
      },
    },
    void2 = {
      lines = { { id = "void2_default", text = "You drain the life from something as it dies, and what's left of it stays in your keeping. Do it to a Frostmane or a trogg rather than to a boar, because a boar's soul is a poor small thing and the voidwalker will know." } },
      choices = { { text = "I'll pick my quarry with care.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    why = {
      lines = { { id = "why_default", text = "Gnomeregan fell to troggs and to radiation, and neither was stopped by engineering. I am an engineer, and when your tools fail, you find stronger tools and read the warnings on them very carefully." } },
      choices = {
        { text = "And when Gnomeregan is retaken?", next = "BACK", reply = "Then I shall put the tools down. I have written the date in my notes, with a blank beside it.", fx = { trait = { curious = 1 } } },
        { text = "Stronger tools, careful hands.", next = "BACK" },
      },
    },
    dannie = {
      lines = { { id = "dannie_default", text = "Dannie Fizzwizzle, who trains the demons themselves once they are bound. She talks to them, which I discourage, and they obey her better than they obey me, which I have not been able to explain." } },
      choices = { { text = "Perhaps they like being talked to.", next = "BACK", reply = "Nothing in the Nether likes anything, but I grant you they respond to it, and that bothers me." }, { text = "Something else, then.", next = "BACK" } },
    },
    blame = {
      lines = { { id = "blame_default", text = "No. Alamar Grimm does, loudly, at Anvilmar, and it wins him nothing but a cold seat by the fire, whereas the dwarves gave us a hall in their capital and asked no rent. I don't mistake a neighbour for an army." } },
      choices = { { text = "A fair way to see it.", next = "BACK", fx = { affinity = 1 } }, { text = "Alamar lost more than most.", next = "BACK", reply = "He did, and so did I, and I've chosen not to make the dwarves pay for it." } },
    },
  },
  topics = {
    dannie = { { id = "tp_dannie", text = "Dannie Fizzwizzle is competent and far too cheerful. The demons find her confusing, and I suspect that is her method." } },
    alamar = { { id = "tp_alamar", text = "Alamar Grimm teaches the beginners at Anvilmar. He is skilled and bitter, and his students arrive here needing the second quality removed." } },
    belm = { { id = "tp_belm", text = "The innkeeper sends down a plate at night and has never once come down the stair himself, which makes him an excellent neighbour." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, hello again! Nothing's followed you in, and you've stopped noticing the brimstone, which means you're practically family." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, hello. Nothing's followed you in, has it? Good, then let's be quick, because I'm not in the mood for company." },
    { id = "g_hi", text = "Hello! Don't mind the smell, it's only brimstone, and you stop noticing after about a fortnight." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Nothing's followed you in, has it? No, good, though one does have to ask." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock! Lovely. Bring it out, then, and let's see whether it fears you yet." },
    { id = "g_void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } }, text = "Oh, a voidwalker, and a big gloomy one too! Mind the beam, dear, it's only six feet up and they never look." },
  },
  notice = {
    { id = "n_imp", cat = "class", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is sulking, I can tell from how you keep glancing down. It's been told off recently and it thinks it didn't deserve it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! You're very welcome, truly, but would you mind standing a little to the left? You're making the voidwalker go a funny colour." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Oh, a mage! Would you hold out your hand a moment? The felhunter's asleep in the corner, and I'd love to see whether it wakes up." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She's sitting cross-legged on an upturned keg with a fat notebook open on her knees and a pencil behind each ear.",
      lines = {
        { id = "h_default", text = "I'm Dannie Fizzwizzle! Gimrizz teaches the warlocks to bind a demon, and I teach the demon what's expected of it afterwards, and they don't want to learn, of course, but they do want things, and anything that wants things can be taught." },
      },
      again = {
        { id = "h_again", text = "What else? I've a little time before the next one's due." },
        { id = "h_again2", text = "Yes, go on! I'll keep writing while you talk, if you don't mind." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Anything else about your little horror? I can always use another page." },
      },
      choices = {
        { text = "A demon trainer should never let an untrained student summon alone.", next = "BACK", reply = "Never, because the first summoning is the one that goes wrong, and I've the scorch marks to prove it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let them summon alone. Failure is the best teacher.", next = "BACK", reply = "Failure's a fine teacher, but it usually doesn't leave a student behind to learn the lesson.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train my demon.", next = "BUSINESS" },
        { text = "Have a look at my demon, would you?", next = "look", when = { class = "WARLOCK" } },
        { text = "What does my demon hate most?", next = "hates", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "You don't seem afraid of them.", next = "afraid" },
        { text = "How do you teach something that hates you?", next = "teach" },
        { text = "Gimrizz says you talk to them.", next = "talk" },
        { text = "What do you keep in that notebook?", next = "notes" },
        { text = "Does the brimstone bother the brewers?", next = "brewers" },
        { text = "Which demon should a young warlock master first?", next = "imp" },
        { text = "Goodbye, Dannie.", next = "END" },
      },
    },
    look = {
      lines = {
        { id = "look_imp", when = { pet = { family = "Imp" } }, text = "Oh, he's a sharp one, look at those eyes going round the room counting the exits! He's not plotting anything yet, but he's taking notes, just like me, so give him plenty of work and not much to watch." },
        { id = "look_void", when = { pet = { family = "Voidwalker" } }, text = "Hello, you! He's very solid, and very bored, and bored is exactly what you want in a voidwalker. If he ever starts looking interested in something, dear, come and tell me straight away." },
        { id = "look_succ", when = { pet = { family = "Succubus" } }, text = "She's looking at you, not at me, which is a good sign for me and a less good one for you. Give her short orders and don't let her see you smile at her jokes." },
        { id = "look_fel", when = { pet = { family = "Felhunter" } }, text = "Oh, a felhunter! He's sniffing at my pencils, because I charmed them to sharpen themselves, and he can smell the spell. Feed him on a mage's magic and never on yours, and he'll be the best friend you'll never quite have." },
        { id = "look_default", text = "Oh, you haven't got it out! Call it up next time, because I can't tell anything from a description, and warlocks always describe them far too kindly." },
      },
      choices = {
        { text = "Is there anything I'm doing wrong?", next = "look2" },
        { text = "Thank you, Dannie.", next = "BACK" },
      },
    },
    look2 = {
      lines = { { id = "look2_default", text = "You keep it on the same side of you all the time, which means it's learned where you're slow to turn. Wren Darkspring taught me that, through the post, and she's never wrong about that sort of thing." } },
      choices = { { text = "I'll switch sides now and then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    hates = {
      lines = { { id = "hates_default", text = "Let me look it up! Imps hate being laughed at, voidwalkers hate whistling, and succubi hate being ignored, which is the most useful one on the list. I haven't found a single thing a felhunter hates apart from going hungry, and I've been looking for three years." } },
      choices = {
        { text = "What's the use of knowing what they hate?", next = "hates2" },
        { text = "I'll start whistling.", next = "BACK", reply = "Not too much, or he'll sulk for a week, and a sulking voidwalker is like living with a thundercloud.", fx = { trait = { witty = 1 } } },
      },
    },
    hates2 = {
      big = true,
      lines = { { id = "hates2_default", text = "It's the only lever you've got besides the binding, and the binding is a big blunt lever that wears every time you pull it. Gimrizz says using their hatreds is petty and beneath the craft. What do you think?" } },
      choices = {
        { text = "Gimrizz is right. Hold the binding and nothing else.", next = "BACK", reply = "You and he'd get on beautifully, and I mean that kindly.", fx = { align = { order = 1 } } },
        { text = "Use whatever works. They'd do the same to me.", next = "BACK", reply = "They would, and they do, so I don't feel a bit bad about the whistling.", fx = { align = { order = -1 } } },
      },
    },
    afraid = {
      lines = { { id = "afraid_default", text = "I'm afraid of troggs, and of green fog, and of the sound a lift makes when the cable goes, and I've met all three. An imp is a small angry thing on a leash, and compared to the stairs out of Gnomeregan it's very nearly company." } },
      choices = {
        { text = "That's a hard way to lose your fear.", next = "BACK", reply = "It is, and I wouldn't recommend it, but I did come out of it very difficult to startle.", fx = { trait = { kind = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "You find out what it wants and what it can't stand. An imp wants to be listened to, so you ignore it until it obeys, and a voidwalker wants to be left alone, so you give it a task and then peace, and a succubus wants you to argue, so you never do." } },
      choices = { { text = "And a felhunter?", next = "teach_fel" }, { text = "Something else, then.", next = "BACK" } },
    },
    teach_fel = {
      lines = { { id = "teach_fel_default", text = "A felhunter is hungry, always, for magic, the way a dog's hungry for scraps. You feed it on your enemy's spells and never, ever on your own, or it starts looking at you between meals, and I have that underlined twice." } },
      choices = { { text = "Never feed it my own magic. Understood.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    talk = {
      big = true,
      lines = { { id = "talk_default", text = "I do, and he hates it, because he says a demon is an engine and one doesn't chat with an engine. But they answer, you see, and they lie mostly, but a lie tells you what the liar wants, and I've learned more about the Burning Legion from one bored imp than from any book." } },
      choices = {
        { text = "Gimrizz is right. Listen long enough and it will own you.", next = "BACK", reply = "That's what he says, word for word, so I keep a clock running and stop when it rings.", fx = { align = { order = 1 } } },
        { text = "Keep talking. Knowledge is worth the risk.", next = "BACK", reply = "I think so too! I go carefully, though, because I'm cheerful, not stupid.", fx = { align = { order = -1 } } },
        { text = "What has the imp told you?", next = "BACK", reply = "That the Legion is very large and very old and doesn't think about us at all, which I found oddly comforting." },
      },
    },
    notes = {
      lines = { { id = "notes_default", text = "What each one hates! This imp can't bear singing, and that voidwalker goes sullen if you whistle, and I've forty pages of it. When a warlock comes back saying their demon's turned difficult, I look it up, and nine times in ten the cure is on the list." } },
      choices = {
        { text = "What does the singing do?", next = "BACK", reply = "He puts his claws over his ears and does exactly as he's told, and the dwarves next door provide it free, every night.", fx = { trait = { witty = 1 } } },
        { text = "Forty pages is a lot of hatred.", next = "BACK", reply = "It's a lot of demons, dear, and I've only just started." },
      },
    },
    brewers = {
      lines = { { id = "brewers_default", text = "Ragnar Thunderbrew came down once to say the lager had gone a bit sulphurous. I moved the summoning circle four feet east and it cleared right up, and he sends down a jug at Winter Veil now, and we've agreed not to discuss which batch." } },
      choices = { { text = "Wise of you both.", next = "BACK" } },
    },
    imp = {
      lines = { { id = "imp_default", text = "The imp, always, and they arrive here with one already, because Alamar Grimm binds the first at Anvilmar and Wren Darkspring teaches it its place. After that comes the voidwalker, which is a great deal quieter, and the warlocks usually look relieved." } },
      choices = { { text = "And after the voidwalker?", next = "BACK", reply = "The succubus, and then they stop looking relieved for a while." } },
    },
  },
  topics = {
    gimrizz = { { id = "tp_gimrizz", text = "Gimrizz Shadowcog is the most careful person I've ever met. He's never once smiled at me, and he's never once let a student get hurt." } },
    maxan = { { id = "tp_maxan", text = "The priest upstairs patches up our students when they've been silly. He disapproves very quietly, which I appreciate." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I ran the lifts on the east shaft, and I don't like to say more than that." } },
    wren = { { id = "tp_wren", text = "Wren Darkspring writes to me from Anvilmar about every imp she trains, and I write back about every one I see again. We've never met, which seems silly when you say it aloud." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' I've found the ball-peen hammer at last! I was hopin' ye'd come so I could show ye, for ye helped me look." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back again. Mind the tongs on the floor, for I'll no' be warnin' ye twice today." },
    { id = "g_hi", text = "Welcome tae the forge! Mind yer feet, there's a pair o' tongs on the floor somewhere, an' they may still be hot." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye havenae seen a wee ball-peen hammer on yer travels, have ye? I had it a minute ago." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, grand! Grab that bar an' hold it steady, I've three jobs on an' two hands." },
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
        { text = "A smith should own up to mistakes in the forge.", next = "BACK", reply = "Aye, an' I own up tae a great many, for I lose a hammer every hour an' I tell everyone.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Blame the apprentice. Masters don't make mistakes.", next = "BACK", reply = "That's how ye end up wi' nae apprentice at all, an' I need someone tae help me find my tongs.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me in blacksmithing.", next = "BUSINESS" },
        { text = "You seem to have lost something.", next = "lost" },
        { text = "What do you teach a beginner first?", next = "nails" },
        { text = "Who do you mend for?", next = "mend" },
        { text = "Thrawn says you've a gifted lad at the forge.", next = "lad" },
        { text = "What should a dwarf know about his own steel?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "What's the hardest thing you've mended?", next = "hard" },
        { text = "What was it like learning under Bengus Deepforge?", next = "d0_bengus" },
        { text = "What's the best piece you've ever made?", next = "d0_best" },
        { text = "Keep your fire hot, Tognus.", next = "END" },
      },
    },
    d0_bengus = {
      lines = { { id = "d0be_default", text = "Like standin' under a waterfall that only spoke once a day. Bengus never raised his voice, but he'd watch ye strike for an hour an' then say one word, an' ye'd spend a year understandin' it." } },
      choices = {
        { text = "What was the word?", next = "d0_bengus_word" },
        { text = "I'd have liked a teacher like that.", next = "BACK" },
      },
    },
    d0_bengus_word = {
      lines = { { id = "d0bw_default", text = "'Listen.' That was all. The iron tells ye when it's ready, by the colour an' the ring, an' a smith too busy hammerin' tae hear it makes nails that bend, so I tell my students the same an' they look at me just as daft as I looked at him." } },
      choices = {
        { text = "I'll listen to the iron.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Tognus.", next = "BACK" },
      },
    },
    d0_best = {
      lines = { { id = "d0bs_default", text = "A gate hinge for Anvilmar, believe it or no'. It's held the hall door through nine winters an' a trogg charge, an' every recruit in Coldridge walks under it wi'out once thinkin' about the smith." } },
      choices = {
        { text = "Not a sword, then?", next = "d0_best_sword" },
        { text = "Good work goes unnoticed. That's the point of it.", next = "BACK" },
      },
    },
    d0_best_sword = {
      lines = { { id = "d0bx_default", text = "Swords are for showin' off, an' I've made a few for the mountaineers that I'm proud of. But a sword fails a dwarf once, at the worst time, an' a hinge holds every day, an' I'd sooner be the smith o' the second thing." } },
      choices = {
        { text = "The stone's gift, used honestly.", next = "BACK", when = { race = "Dwarf" }, fx = { affinity = 1 } },
        { text = "Spoken like a true smith.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' ye look like ye've been eatin' properly at last! Sit down, for I've been worried about ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. Shut the door, for the draught's flattenin' my bread, an' let's get this lesson done." },
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
        { text = "A cook should feed anyone who's hungry, whatever they can pay.", next = "BACK", reply = "Aye, for nobody leaves my kitchen hungry, an' that's a rule I've kept for forty years.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Feed only those who pay. Charity empties the larder.", next = "BACK", reply = "It empties the larder, aye, but it fills somethin' else, an' I'll no' give that up.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's the first thing a cook should learn?", next = "first" },
        { text = "What do you cook from, in all this snow?", next = "larder" },
        { text = "Tell me about your kitchen hand.", next = "hogral" },
        { text = "You feed the wounded as well?", next = "wounded" },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "What did you cook for a mountaineer company?", next = "d0_company" },
        { text = "Ragnar's ale goes into half your dishes.", next = "d0_ale" },
        { text = "Thank you, Gremlock.", next = "END" },
      },
    },
    d0_company = {
      lines = { { id = "d0cm_default", text = "Stew, every night, for a hundred dwarves out o' the one pot, wi' whatever the scouts shot that day. Ye learn fast that a cook who feeds a company badly finds his bedroll full o' snow." } },
      choices = {
        { text = "What was the worst meal you ever served?", next = "d0_company_worst" },
        { text = "A hundred from one pot. That's a skill.", next = "BACK" },
      },
    },
    d0_company_worst = {
      lines = { { id = "d0cw_default", text = "A wendigo haunch, once, when the stores ran out on the high patrol above the Grizzled Den. It tasted o' wet wool an' bad temper, an' the captain ate two bowls an' said it was grand, which is why he was captain." } },
      choices = {
        { text = "Remind me never to eat wendigo.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Gremlock.", next = "BACK" },
      },
    },
    d0_ale = {
      lines = { { id = "d0al_default", text = "It does, an' Ragnar sulks every time I take a cask for the kitchen that he could sell by the mug. But beer basted boar ribs need Thunderbrew in them, an' the town would riot if I stopped, so he sulks an' sends the cask." } },
      choices = {
        { text = "Why must it be Thunderbrew?", next = "d0_ale_why" },
        { text = "Barleybrew stout would make a richer baste.", next = "BACK", when = { race = "Dwarf" }, reply = "Wheesht! Dinnae say that in this kitchen, for Ragnar's got ears in the cellar an' Rejold's got a cousin on every stool." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_ale_why = {
      lines = { { id = "d0aw_default", text = "Because it's sweet at the front an' bitter at the back, so the sweet goes intae the meat while the bitter cuts the fat. I've tried every brew in Dun Morogh, an' I'll no' tell Rejold Barleybrew what came second." } },
      choices = {
        { text = "Your secret's safe in my stomach.", next = "BACK" },
        { text = "Let me ask something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back an' upright, wi' clean hands again! Ye're my best student, an' I'd say so tae anyone who asked." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. I'll finish this splint first, an' then I'll see ye, though I'll no' be lingerin' over it." },
    { id = "g_hi", text = "If ye're no' bleedin', then ye can wait a moment while I finish this splint, an' I'll be wi' ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' upright, so show me the hands. Aye, they're clean, so ye listened." },
    { id = "g_hurt", when = { durability = { max = 0.3 } }, text = "Sit down. No, dinnae tell me ye're fine, everybody tells me they're fine. Where does it hurt when ye breathe in?" },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, is it? Maxan Anvol's upstairs. Between the Light an' a clean bandage we lose very few, an' I'll let ye guess which I think does the more." },
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
        { text = "A physician should treat the wounded in order of need, not rank.", next = "BACK", reply = "Aye, for a bleedin' miner's as worthy as a bleedin' senator, an' the wound doesnae care.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Treat the important ones first. They pay better.", next = "BACK", reply = "They pay better, aye, an' the miner bleeds out while ye count it, an' I'll no' do that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "What do you treat most?", next = "treat" },
        { text = "You and the priest divide the work?", next = "priest" },
        { text = "What should I carry on the road?", next = "carry" },
        { text = "You boil everything.", next = "boil" },
        { text = "How should I treat frostbite?", next = "frost" },
        { text = "What did the mountaineers teach you about healing?", next = "d0_company" },
        { text = "Belm sits up with the bad ones himself, you said.", next = "d0_belm" },
        { text = "Good day, Physician.", next = "END" },
      },
    },
    d0_company = {
      lines = { { id = "d0cp_default", text = "That a wound tended in the first hour heals, an' one left till mornin' often doesnae. In the field ye've nae table an' nae priest, only yer hands an' a strap, so ye learn tae work fast an' clean an' never tae look away." } },
      choices = {
        { text = "What do you teach first, then?", next = "d0_company_first" },
        { text = "I've had a wound tended in the field.", next = "BACK", when = { class = "WARRIOR" }, reply = "Then ye ken how much it matters who's kneelin' over ye. Thank them, if ever ye see them again." },
        { text = "Fast and clean. I'll remember.", next = "BACK" },
      },
    },
    d0_company_first = {
      lines = { { id = "d0cf_default", text = "Pressure. Before the bandage, before the splint, before the prayer, ye press on the bleedin' wi' the heel o' yer hand an' ye dinnae let go, for most folk who die on a road die because somebody let go too soon." } },
      choices = {
        { text = "Pressure first. Understood.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Physician.", next = "BACK" },
      },
    },
    d0_belm = {
      lines = { { id = "d0bl_default", text = "Aye, every time, an' he willnae hear o' me payin' for the candles. He sits by the cot wi' a mug he never drinks an' tells the lad stories about his own youth that I'm fair sure never happened." } },
      choices = {
        { text = "Do the stories help?", next = "d0_belm_help" },
        { text = "Belm has a kind heart under the bluster.", next = "BACK" },
      },
    },
    d0_belm_help = {
      lines = { { id = "d0bh_default", text = "More than half my remedies. A patient who's listenin' breathes slow an' steady, an' a patient who's arguin' that nae dwarf ever wrestled a bear isnae thinkin' about his leg." } },
      choices = {
        { text = "Then Belm's a physician too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again. Alamar hasn't complained once since you came in, which I've decided means he's fond of you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Hello again. Stay on this side of the bench, please, and let's keep the lesson as brief as possible." },
    { id = "g_hi", text = "Hello. Come round to this side of the bench, if you would, so you're not standing between the imp and the door." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. It's quieter today, and Alamar has only complained twice." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You've bound your first, I see, so let it have a look at me, and don't speak for a moment while it does." },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 20 }, text = "You've come a long way back to a little valley, and you've brought something bigger than an imp with you, I think. Sit down, and tell me how you've been." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp keeps to your left side, because it's learned you're right-handed, so change hands now and then and don't let it be sure." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Branstock sends his novices over to look at us, so they'll know what they're praying against. You're welcome to look, so long as you don't bless anything." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She has a small tin of burn salve open on the bench beside her, and her own fingers are shiny with it.",
      lines = {
        { id = "h_default", text = "I'm Wren Darkspring. When a novice binds an imp, Alamar teaches the novice and I teach the imp, and it's a small demon and a spiteful one, so it has to learn in its first week that spite gets it nowhere here." },
      },
      again = {
        { id = "h_again", text = "Was there something else? Take your time." },
        { id = "h_again2", text = "Yes? Go on, but quietly, because the imp's only just settled." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Anything else you've noticed about it? The small things are usually the important ones." },
      },
      choices = {
        { text = "A warlock should keep their pact with the demon to the letter.", next = "BACK", reply = "To the letter, because a demon will find every loophole you leave, and Alamar is very good at it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Break the pact when it suits you. A demon has no rights.", next = "BACK", reply = "It has no rights, perhaps, but it has a very long memory, and so do its friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train my demon.", next = "BUSINESS" },
        { text = "My imp set fire to my sleeve again.", next = "sleeve", when = { class = "WARLOCK", maxLevel = 12 } },
        { text = "Does it ever stop being frightening?", next = "fear", when = { class = "WARLOCK" } },
        { text = "How do you teach an imp its place?", next = "teach" },
        { text = "Alamar can't be easy to work beside.", next = "alamar" },
        { text = "What do the dwarves make of you?", next = "dwarves" },
        { text = "Why did you take up this work?", next = "why" },
        { text = "What happens when a novice loses control?", next = "lose" },
        { text = "Where do your novices go from here?", next = "onward" },
        { text = "Goodbye, Wren.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "By being duller than it is. An imp wants a reaction, so it insults you and sets fire to your sleeve and tells you your mother never loved you, and if you answer in the same flat voice every time, it runs out of things to try in about four days." } },
      choices = { { text = "And on the fifth day?", next = "teach_fifth" }, { text = "Let's talk about something else.", next = "BACK" } },
    },
    teach_fifth = {
      lines = { { id = "teach_fifth_default", text = "On the fifth day it does as it's told, and sulks. That's the best you'll get from an imp, and it's enough, and anyone who tells you theirs is loyal has an imp that's being patient." } },
      choices = { { text = "Obedient and sulking. I'll settle for that.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    sleeve = {
      lines = { { id = "sleeve_default", text = "Let me see the arm first, and then we'll talk about the imp. It's testing whether you'll shout, and every time you shout, it's learned something, so the next time, put the fire out and say nothing at all." } },
      choices = {
        { text = "It's hard not to shout when you're on fire.", next = "sleeve2" },
        { text = "Nothing at all. I'll try.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    sleeve2 = {
      lines = { { id = "sleeve2_default", text = "It is, and that's why it chose fire. Keep a wet cloth on your belt for a week, and you'll find it's much easier to be dull when you're already prepared." } },
      choices = { { text = "A wet cloth. Thank you, Wren.", next = "BACK", fx = { affinity = 1 } } },
    },
    fear = {
      lines = {
        { id = "fear_gnome", when = { race = "Gnome" }, text = "It gets quieter, but I hope it never stops altogether, for your sake. We came out of Gnomeregan with plenty of fear left over, and I've found it's better spent here than on bad dreams." },
        { id = "fear_default", text = "It gets quieter, but I hope it never stops altogether, for your sake. The warlocks who stop being frightened are the ones Alamar writes on his list." },
      },
      choices = {
        { text = "Alamar keeps a list?", next = "fear2" },
        { text = "Then I'll stay frightened.", next = "BACK", reply = "A little, and sensibly, the way you'd be frightened of a cliff edge." },
      },
    },
    fear2 = {
      lines = { { id = "fear2_default", text = "He does, in his breast pocket, and he thinks I don't know about it. Please don't ask him, because he'll tell you, and it costs him more than he lets on." } },
      choices = { { text = "I won't ask.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    alamar = {
      lines = { { id = "alamar_default", text = "The same way, really. He says something bitter and I say good morning, because he's a frightened man who got most of his crew out and can only remember the ones he didn't, and I'd be sour too." } },
      choices = {
        { text = "You're kinder to him than he deserves.", next = "BACK", reply = "I don't think kindness goes by deserving, or there'd be very little of it about.", fx = { trait = { kind = 1 } } },
        { text = "Does he know you see that?", next = "BACK", reply = "I hope not, because he'd be mortified.", fx = { trait = { discreet = 1 } } },
      },
    },
    dwarves = {
      lines = { { id = "dwarves_default", text = "They're polite, and they stand a step further back than they would from anyone else. Thran Khorman nods to me and Bromos Grummner doesn't, which I can't blame him for, since he's a paladin, and Durnan Furcutter mended my cloak for nothing and wouldn't hear a word about it." } },
      choices = {
        { text = "No dwarf has ever asked you to teach them?", next = "dwarves2" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dwarves2 = {
      lines = { { id = "dwarves2_default", text = "One did, a young mountaineer, very late one night and very quietly. I told him to sleep on it and come back in a week, and he never came back, and I think that was the right ending for him." } },
      choices = { { text = "You might have had a student.", next = "BACK", reply = "I might have had a very unhappy one, in a clan that wouldn't speak his name. Some doors are better left shut." } },
    },
    why = {
      lines = { { id = "why_default", text = "I was a nurse on the residential levels. When the fog came there was a locked door with children behind it, and nothing I knew how to do would open it, and a warlock opened it, so I asked him afterwards to teach me, and I've never asked myself whether I should have." } },
      choices = { { text = "Then you chose well.", next = "BACK", fx = { affinity = 1 } }, { text = "That's a heavy reason to carry.", next = "BACK", reply = "It's lighter than the door was.", fx = { trait = { kind = 1 } } } },
    },
    lose = {
      big = true,
      lines = { { id = "lose_default", text = "It's happened once here. A novice's imp slipped its binding and went for the fire where the recruits sleep, and I had a choice between banishing it, which takes a count of ten, or breaking it, which is instant and hurts the novice badly, and I broke it, and she couldn't cast for a month." } },
      choices = {
        { text = "You chose rightly. A hall of sleepers outweighs one novice's pain.", next = "BACK", reply = "That's what I tell myself. She's forgiven me, which I find harder than if she hadn't.", fx = { align = { light = 1 } } },
        { text = "Ten seconds wasn't long. You should have spared your student.", next = "BACK", reply = "I've counted to ten many times since, to see how long it is, and I still don't know.", fx = { align = { light = -1 } } },
        { text = "Where is she now?", next = "BACK", reply = "In Kharanos, with Gimrizz, and doing well. She writes at Winter Veil." },
      },
    },
    onward = {
      lines = { { id = "onward_default", text = "To Kharanos, when they've outgrown the valley, where Gimrizz Shadowcog teaches and Dannie Fizzwizzle takes their demons on from me. Dannie writes to ask what each imp hates, for her notebook, and I write back, and it's the only post I get." } },
      choices = {
        { text = "That sounds like a friendship.", next = "BACK", reply = "I suppose it is, though we've never met. I'd like to, one day, when the pass is quiet.", fx = { trait = { kind = 1 } } },
        { text = "Kharanos it is, then.", next = "BACK" },
      },
    },
  },
  topics = {
    alamar = { { id = "tp_alamar", text = "Alamar Grimm is a very good teacher who believes he's a bad man. I think he's wrong about the second." } },
    branstock = { { id = "tp_branstock", text = "Branstock Khalder brings us tea in the evenings and leaves it on the bench without a word. Alamar drinks it and says it's stewed." } },
    imps = { { id = "tp_imps", text = "Never laugh at one. They can bear being hated, but they can't bear being found funny." } },
    dannie = { { id = "tp_dannie", text = "Dannie Fizzwizzle in Kharanos, who writes the most cheerful letters about the most horrible creatures. I keep every one." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my friend returns again! The barrel's half full, you're in good health, and I haven't asked you for a single copper today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, it's you. The barrel's half full, and I'll teach you what you've come for, but I'll not be asking you for coppers." },
    { id = "g_hi", text = "Hello, hello! You wouldn't happen to have a few coppers about you? No, no, forget I asked, and tell me what I can do for you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my friend returns! And the barrel's still half full, so it's a good day all round." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, you'll be the one with the memorandum! Sit down, sit down, and we'll begin with frost, since there's so much of it lying about going to waste." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Your fingertips are a little blue, which is frost magic done properly, or frostbite, and either way you're in the right valley." },
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Oh, well done! You've found the good barrel. I'd lecture you on casting in that state, but I'd be a dreadful hypocrite." },
  },
  start = "hello",
  nodes = {
    mk_water = {
      lines = { { id = "mkw_default", text = "You cup your hands and think of the coldest, cleanest water you've ever tasted, and the spell does the rest, though I'd advise you not to think about ale, because I tried that once and got something very disappointing. It'll keep you alive on the road, and it costs you nothing but a little mana." } },
      choices = {
        { text = "Conjured water should be given freely to anyone who's thirsty.", next = "BACK", reply = "Exactly, and I give it freely myself, though I'll confess I sometimes ask for a copper afterwards.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell conjured water in the desert. Thirsty folk pay anything.", next = "BACK", reply = "They'd pay anything, until it vanished in their canteens, and then they'd come looking for you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Did you ever manage to conjure ale?", next = "BACK", reply = "Never once, and not for want of trying, so some magic is simply cruel." },
        { text = "Something else, Marryk.", next = "BACK" },
      },
    },
    mk_armor = {
      big = true,
      lines = { { id = "mka_default", text = "It is a snowbank, a small one, and it'll slow anything that hits you, which out here means wolves and troggs, mostly. Keep it on whenever you're out of doors, and you'll find the cold stops minding you, which is the nicest thing frost ever does for anyone." } },
      choices = {
        { text = "I'll wear it always, then. Caution first.", next = "BACK", reply = "Good, and you'll thank me the first time a wolf gets close and then gets very slow.", fx = { align = { order = 1 } } },
        { text = "I'd rather save the mana for frostbolts.", next = "BACK", reply = "That's a fair sum, and a wrong one, but a fair one, so try it my way for a week.", fx = { align = { order = -1 } } },
        { text = "Something else, Marryk.", next = "BACK" },
      },
    },
    mk_dwarf = {
      big = true,
      lines = { { id = "mkd_default", text = "Belong? You're the first dwarf in this valley who's ever asked me a question I couldn't answer with ale, so you belong more than I do. Your folk at Anvilmar will rib you, I expect, because they think magic is something gnomes do instead of mining, so throw a frostbolt at the icicle and let it answer for you." } },
      choices = {
        { text = "I'll show them it's honest work, like mining.", next = "BACK", reply = "That's the spirit, and Thran Khorman will back you, because he's seen what a frostbolt does to a trogg.", fx = { align = { order = 1 } } },
        { text = "Let them rib me. I don't need their approval.", next = "BACK", reply = "No, you don't, and a dwarf who knows it is a dangerous thing. I'll drink to that, naturally.", fx = { align = { order = -1 } } },
        { text = "Something else, Marryk.", next = "BACK" },
      },
    },
    mk_gnome = {
      big = true,
      narr = "He sets the mug down, and for once he doesn't pick it straight back up.",
      lines = { { id = "mkg_default", text = "No, nor did my brother, and I'm sorry, more sorry than a mug can say. Here's what I do, and you may take it or leave it: I teach as if every student is one of the ones I couldn't get up the stairs, and some days that's enough to get me to supper." } },
      choices = {
        { text = "Then I'll learn well, for both of ours.", next = "BACK", reply = "That's exactly it, and thank you, truly. Now, frost, before I need another mug.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll learn enough to burn the troggs out myself.", next = "BACK", reply = "And you may, one day, and I'll raise a mug to it. Learn the frost first, though, because the dead would want us to live long enough to try.", fx = { align = { light = -1 } } },
        { text = "Something else, Marryk.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_mk_memo", when = { class = "MAGE", maxLevel = 5 },
          text = "You've brought the Glyphic Memorandum, then, and you've read it on the way, which everybody does, so you'll know it calls me reliable. That's a generous word, and I mean to earn it this morning." },
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
        { text = "How do I conjure water, Marryk?", next = "mk_water", when = { class = "MAGE", minLevel = 3 } },
        { text = "Frost Armor feels like wearing a snowbank.", next = "mk_armor", when = { class = "MAGE" } },
        { text = "I'm a dwarf from Coldridge. Do I belong among mages?", next = "mk_dwarf", when = { race = "Dwarf", class = "MAGE", maxLevel = 15 } },
        { text = "My family didn't make it out of Gnomeregan.", next = "mk_gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "Farewell, Marryk.", next = "END" },
      },
    },
    ale = {
      lines = { { id = "ale_default", text = "I am, I am, because a gnome mage thinks very fast, you see, a great many thoughts at once, and since we left home most of mine are ones I'd sooner not have. Two mugs slows them to a walk, so it's medicinal, when you look at it properly." } },
      choices = {
        { text = "That sounds like grief, not thirst.", next = "ale_grief" },
        { text = "And who pays for the medicine?", next = "ale_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_grief = {
      big = true,
      lines = { { id = "ale_grief_default", text = "Hm, well, yes, I lost a workshop, a library and a brother, and I've found that I can teach perfectly well so long as I don't think about any of the three. The priest says I ought to face it sober, and the barrel has never said anything of the kind." } },
      choices = {
        { text = "The priest is right. The ale only puts off the day of reckoning.", next = "BACK", reply = "He is, I expect, because he usually is, under the jokes. Perhaps tomorrow, though I've said that before, of course.", fx = { align = { light = 1 } } },
        { text = "Drink, if it lets you work. You owe no one your sorrow.", next = "BACK", reply = "That's the kindest bad advice I've had all week. I'll take it, naturally.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ale_pay = {
      lines = { { id = "ale_pay_default", text = "My students, I'm ashamed to say, a copper here and a copper there, though I do pay it back in lessons: I've taught three of them to chill a mug without being asked, which no other trainer in Khaz Modan offers." } },
      choices = { { text = "A chilled mug is a fair trade.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "first_default", text = "Frost, in this valley, because the air does half the work for you, and then a little fire, carefully, indoors, with Thran Khorman's bucket standing by. He keeps it there for me, and he's only had to use it twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomeregan = {
      lines = { { id = "gnomeregan_default", text = "Don't go, and that's my whole lecture, which I give to every student. It isn't empty, whatever they tell you, because what's down there is sick and clever, and the green in the air gets into you, and I've seen brave people walk in to fetch one more crate." } },
      choices = { { text = "Did they come out?", next = "BACK", reply = "Some did, and they weren't well afterwards, so please, just don't go.", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cast = {
      lines = { { id = "cast_default", text = "Watch that icicle over the door, there, clean through the middle, and I'm on my third mug. The hands remember, and it's only the counting I lose, and you don't need to count to throw frost at a trogg." } },
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
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid, but ask me after another mug, and I may have a theory." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back from the pit again, wi' the dust on ye! Sit, sit, for ye're my best customer at Gol'Bolar, an' I've missed ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. Bread an' cheese an' ale, same as always, but I'll no' be sittin' wi' ye while ye eat it." },
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
        { text = "Ale should be sold full measure, even this far from Ironforge.", next = "BACK", reply = "Aye, for the miners here have little enough, an' I'll no' short them on their ale.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Short the miners. They're too tired to notice.", next = "BACK", reply = "They notice, an' then they riot, an' I've only the one table tae hide behind.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "How did the troggs take the quarry?", next = "troggs" },
        { text = "How are the crews bearing it?", next = "crews" },
        { text = "You're feeding them on credit.", next = "credit" },
        { text = "Who else is still up here?", next = "camp" },
        { text = "Where do your supplies come from now?", next = "supply" },
        { text = "What was Gol'Bolar like before the troggs?", next = "d0_before" },
        { text = "The quarry's gone very quiet.", next = "d0_quiet" },
        { text = "Good day, Kazan.", next = "END" },
      },
    },
    d0_before = {
      lines = { { id = "d0bf_default", text = "Loud from first light tae last, wi' three crews on the benches an' the wagons queued up tae haul granite tae Ironforge an' Kharanos. I sold ale by the barrel then, no' the mug, an' I never had a slate tae worry about." } },
      choices = {
        { text = "Where did all that stone go?", next = "d0_before_stone" },
        { text = "Good years, by the sound of them.", next = "BACK" },
      },
    },
    d0_before_stone = {
      lines = { { id = "d0bt_default", text = "Half the new walls in Kharanos are Gol'Bolar grey, an' the watchtowers along the Loch Modan road besides. Dank swears there's a stair in Ironforge cut from this quarry, an' he'll show ye the chisel marks if ye let him." } },
      choices = {
        { text = "I'll look for the chisel marks.", next = "BACK" },
        { text = "Something else, Kazan.", next = "BACK" },
      },
    },
    d0_quiet = {
      lines = { { id = "d0qu_default", text = "Quiet's the worst of it. A quarry should ring, an' now ye hear the troggs knockin' about on the lowest bench at night, an' the lads lie awake listenin' tae them." } },
      choices = {
        { text = "Can't the crews fight them off?", next = "d0_quiet_fight" },
        { text = "A dwarf shouldn't lie awake over troggs.", next = "BACK", when = { race = "Dwarf" }, reply = "Tell that tae a lad who saw his mate dragged intae the dark. Bravery comes easier in daylight, friend." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_quiet_fight = {
      lines = { { id = "d0qf_default", text = "Some tried, wi' picks an' shovels, an' came back wi' broken arms for it. These are quarrymen an' no' soldiers, so the Senator an' the Foreman are askin' anybody who can fight properly tae go down." } },
      choices = {
        { text = "I can fight properly.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for seconds again! Ye're the finest guest I've ever fed at Gol'Bolar, an' I'd say so tae the whole crew." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back for seconds. There's enough, as always, but I'll no' be pilin' yer plate quite so high today." },
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
        { text = "A cook should feed the whole crew the same, from boss to digger.", next = "BACK", reply = "Aye, an' I do, for the boss eats from the same pot as the diggers, whatever he might wish.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Give the boss the best cuts. That's how you keep your job.", next = "BACK", reply = "It'd keep my job, aye, but I'd lose the crew's respect, an' that's worth more than any boss.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What do you cook from, up here?", next = "larder" },
        { text = "Miners make good cooks?", next = "miners" },
        { text = "What's the one thing you won't cook?", next = "wont" },
        { text = "How do you make a meal from nothing?", next = "nothing" },
        { text = "What's the crew's favourite dish?", next = "favourite" },
        { text = "You were a quarryman before you took the kettle.", next = "d0_quarry" },
        { text = "What do you suppose the troggs eat?", next = "d0_troggs" },
        { text = "Thank you, Ghilm.", next = "END" },
      },
    },
    d0_quarry = {
      lines = { { id = "d0qy_default", text = "Eleven years on the benches, splittin' grey granite wi' Dank shoutin' at my elbow. Then a block came down the wrong way an' took two toes, an' Dank said a dwarf wi' eight toes could still stir a pot." } },
      choices = {
        { text = "Do you miss the stone?", next = "d0_quarry_miss" },
        { text = "My father lost a finger in the quarries.", next = "BACK", when = { race = "Dwarf" }, reply = "Then he paid the stone's toll like the rest of us. Tell him Ghilm o' Gol'Bolar drinks tae his hand." },
        { text = "Eight toes and a ladle. A fair trade.", next = "BACK" },
      },
    },
    d0_quarry_miss = {
      lines = { { id = "d0qm_default", text = "Every mornin', when the crews used tae go down. But a pick feeds nobody an' a kettle feeds forty, an' now that the quarry's stopped, my kettle's the only work still gettin' done on this hill." } },
      choices = {
        { text = "Then it's the most important job up here.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Ghilm.", next = "BACK" },
      },
    },
    d0_troggs = {
      lines = { { id = "d0tz_default", text = "Rock, for all I ken, for they've been chewin' through the lowest bench like it was bread. The Foreman reckons they came up after somethin' in the deep stone, an' I reckon they're just hungry, an' neither of us has asked one." } },
      choices = {
        { text = "Might they come for your stores?", next = "d0_troggs_stores" },
        { text = "Hungry troggs are dangerous troggs.", next = "BACK" },
      },
    },
    d0_troggs_stores = {
      lines = { { id = "d0ts_default", text = "They tried, two nights after the break-in. Kazan an' me held the store tent wi' a cleaver an' a fryin' pan till the Senator came runnin', an' there's a dent in that pan I'll never hammer out." } },
      choices = {
        { text = "A frying pan is a fine weapon in the right hands.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
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
      lines = { { id = "wont_default", text = "Trogg? Aye, I've been asked. When the stores ran thin last month, a few o' the lads said meat was meat, an' there's a deal o' it walkin' about down there. I said I'd throw the kettle in the pit first. They go on two legs, an' they've a kind o' speech." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' swingin' from the shoulder at last! Hmph, I'll admit it's a grand sight, an' I'm glad tae see it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. Still from the elbow, I'll wager, an' I'll no' be tellin' ye again, for ye clearly dinnae listen." },
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
        { text = "A miner should share a good vein with the crew who found it.", next = "BACK", reply = "Aye, for nobody finds a vein alone, an' a miner who forgets that soon has nobody tae dig with.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Keep the vein to yourself. You found it first.", next = "BACK", reply = "Then ye'll dig it alone, an' the troggs will find ye before the crew does.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Sixty years at one quarry?", next = "sixty" },
        { text = "Everyone swings a pick wrong, you say.", next = "swing" },
        { text = "Why won't you leave?", next = "leave" },
        { text = "What's so fine about Gol'Bolar stone?", next = "stone" },
        { text = "Yarr Hammerstone sends his regards.", next = "yarr" },
        { text = "What should a young miner learn first?", next = "first" },
        { text = "Who are the best miners you ever taught?", next = "d0_best" },
        { text = "That pick looks older than the quarry.", next = "d0_pick" },
        { text = "Good day, Dank.", next = "END" },
      },
    },
    d0_best = {
      lines = { { id = "d0bm_default", text = "The Foreman, though I'll no' tell him so, an' Ghilm, who'd the best eye for a split I ever saw till the block took his toes. The rest I've forgotten, an' that's a kindness tae them." } },
      choices = {
        { text = "What made Ghilm's eye so good?", next = "d0_best_ghilm" },
        { text = "You remember more than you let on.", next = "BACK", reply = "Hmph. I remember what's worth rememberin', an' that's less than ye'd think." },
      },
    },
    d0_best_ghilm = {
      lines = { { id = "d0bg_default", text = "Patience. He'd stand at a face an' look at it for an hour before he set a wedge, while the young ones swung the minute they arrived. Now he does the same wi' a stew, an' it's a waste o' a fine quarryman." } },
      choices = {
        { text = "His stew isn't wasted on the crews.", next = "BACK" },
        { text = "Something else, Dank.", next = "BACK" },
      },
    },
    d0_pick = {
      lines = { { id = "d0pk_default", text = "It is, near enough. My father's head on my third haft, wi' the grip worn down tae the shape o' my hand, an' when Frast Dokner offered tae make me a new one I told him I'd sooner swing his arm." } },
      choices = {
        { text = "Why keep a worn tool?", next = "d0_pick_why" },
        { text = "A tool that knows your hand is worth ten new ones.", next = "d0_pick_why", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_pick_why = {
      lines = { { id = "d0pw_default", text = "Because it kens the stone here better than any pick alive. It's rung true in this quarry for sixty years, an' when they bury me it goes in the ground wi' me, an' ye can tell the Foreman I said so." } },
      choices = {
        { text = "I'll tell him.", next = "BACK" },
        { text = "Let me ask something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're back, an' the edge held again! I'm right glad, for ye're the one customer whose axe I always worry about most." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're back. Did it hold? Never mind, I'll no' ask, for I've a feelin' ye'd no' tell me the truth anyway." },
    { id = "g_hi", text = "Good day! Are ye goin' down intae the pit? Then ye'll want somethin' heavy. I've axes, mostly, for axes are what folk here want." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Did it hold? Let me see the edge, then. Oh, that's a relief, I worried about that one." },
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
        { text = "An apprentice should sell only what's ready, even if the master's away.", next = "BACK", reply = "Aye, for a half-finished axe in the pit is worse than none at all, an' my master would skin me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the half-finished ones. The master will never know.", next = "BACK", reply = "The master knows everythin', an' the pit knows it quicker, an' I'll no' risk either.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Business must be good.", next = "business" },
        { text = "What works best on troggs?", next = "troggs" },
        { text = "An apprentice, alone out here?", next = "alone" },
        { text = "What did you do before the troggs came?", next = "before" },
        { text = "How do you forge without a proper smithy?", next = "forge" },
        { text = "What will you take back to Ironforge from here?", next = "d0_learn" },
        { text = "Senator Stonehallow's hammer caught your eye.", next = "d0_hammer" },
        { text = "Good luck, Frast.", next = "END" },
      },
    },
    d0_learn = {
      lines = { { id = "d0le_default", text = "That a weapon's worth what it does on the worst day, an' no' what it looks like on the rack. In Ironforge I'd have polished a blade for a week, but out here a lad takes it down the pit the same afternoon an' I hear by supper whether it held." } },
      choices = {
        { text = "Have any of yours failed?", next = "d0_learn_fail" },
        { text = "Hard teaching, but true.", next = "BACK" },
      },
    },
    d0_learn_fail = {
      lines = { { id = "d0lf_default", text = "One axe, the first month, which I'd tempered too hard. It chipped on a trogg's shoulder an' the lad nearly lost his hand, so I walked tae Kharanos that night tae ask Tognus Flintfire what I'd done wrong." } },
      choices = {
        { text = "What did Tognus tell you?", next = "BACK", reply = "That I'd done it wrong once, an' that was the cheapest lesson I'd ever get. He was right, too." },
        { text = "Something else, Frast.", next = "BACK" },
      },
    },
    d0_hammer = {
      lines = { { id = "d0ha_default", text = "It did, an' it's a wonder. Old Ironforge work, the head forged in one piece wi' nae weld at all, an' the haft's been replaced so often there's nothin' original left but the steel. He let me hold it a moment an' then took it back like a bairn takin' back a toy." } },
      choices = {
        { text = "Could you forge one like it?", next = "d0_hammer_forge" },
        { text = "A hammer like that is meant for the Light's work.", next = "BACK", when = { class = "PALADIN" }, reply = "Then it's in the right hands now, for the Senator fights for the quarry an' asks nothin' for it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_hammer_forge = {
      lines = { { id = "d0hf_default", text = "No' yet, an' maybe no' ever. Bengus Deepforge might ken how it was done, an' I mean tae ask him when my season here is over, if the troggs leave me a season tae finish." } },
      choices = {
        { text = "I hope they do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, my favourite! Fluffy likes you best of everyone, and she even let you hold her, which she never does with Da." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Fluffy's hiding, and I think she's hiding from you, so you'd better not try to catch her." },
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
        { text = "You should always tell your Da the truth, even about Fluffy.", next = "BACK", reply = "That's what Da says too, but it's harder when Fluffy's eaten all his carrots again.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Don't tell your Da. What he doesn't know won't hurt him.", next = "BACK", reply = "Oh, that's naughty, but he'd find out anyway, because Fluffy always leaves a trail.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your rabbits.", next = "BUSINESS" },
        { text = "How did Fluffy get out?", next = "fluffy" },
        { text = "How do you look after so many rabbits?", next = "care" },
        { text = "Why rabbits, on a ram ranch?", next = "rams" },
        { text = "What's it like growing up here?", next = "ranch" },
        { text = "Who buys your rabbits?", next = "buyers" },
        { text = "Who's your Da, Yarlyn?", next = "d0_da" },
        { text = "You know a lot about rabbits for seven.", next = "d0_know" },
        { text = "Good luck catching Fluffy.", next = "END" },
      },
    },
    d0_da = {
      lines = { { id = "d0da_default", text = "Da's Turuk, and he makes axes in the forge by the house, and he's the strongest dwarf in Dun Morogh, probably. He lets me pump the bellows if I stand on the bucket, and he says I'm the best bellows-girl he's ever had." } },
      choices = {
        { text = "Does he make axes for the mountaineers?", next = "d0_da_axes" },
        { text = "Bellows-girl sounds like an important job.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    d0_da_axes = {
      lines = { { id = "d0dx_default", text = "Yes, and for the hunters, and for anybody Uncle Veron says is all right. A mountaineer came last week and said Da's axe saved him from a wendigo, and Da went red right up into his beard." } },
      choices = {
        { text = "Your Da sounds like a good smith.", next = "BACK" },
        { text = "Something else, Yarlyn.", next = "BACK" },
      },
    },
    d0_know = {
      lines = { { id = "d0kw_default", text = "Seven and a half! And I know because I watch them, which is what Rudra says you do with any animal. Rabbits thump their back feet when they're scared and stop eating when they're sad, and Fluffy only ever thumps at Uncle Veron." } },
      choices = {
        { text = "Why does Fluffy thump at Uncle Veron?", next = "d0_know_veron" },
        { text = "Gnomes keep rabbits too, you know.", next = "BACK", when = { race = "Gnome" }, reply = "I know! That's why they buy them. A gnome lady said a rabbit is exactly the right size for a gnome to love, so I gave her the brown one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_know_veron = {
      lines = { { id = "d0kv_default", text = "Because he frowns at her, the same as he frowns at everybody. But I saw him give her a carrot when he thought nobody was looking, so I think she's only thumping for show." } },
      choices = {
        { text = "I think you're right about that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
