-- Menethil Harbor. Voice: bibles/menethil.md
-- The captain on the wall, the drunk by the tavern door, the priest with too much to do,
-- a wounded dwarf out of Dun Modr, a merchant sailor, the innkeeper, the League's man,
-- and a bartender who doesn't sell drinks.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stoutfist", id = TODO_NPC("Captain Stoutfist"), name = "Captain Stoutfist",
  bible = "bibles/menethil.md", role = "soldier", tier = "major",
  communities = { "menethil" }, temper = { "fierce" }, values = { "dutiful", "brave" },
  likesTone = "blunt", race = "Dwarf",
  notices = { "soldier", "kit", "lock_armor", "lock_shadow" },

  impression = {
    first = "He asked only whether I'd go where I was told.",
    third = "{name} reported to Captain Stoutfist, who holds Menethil Harbor against the Dragonmaw for Ironforge and the Alliance.",
  },

  greetings = {
    { id = "o_magni_failed", tags = { "news" }, when = { gossip = { topic = "magni", stance = "failed" } },
      text = "Longbraid the Grim tells me ye think the King left Dun Modr tae burn. Say that in my keep again an' I'll have ye on the wall wi' a bucket, for we've no time for that talk." },
    { id = "g_wall", text = "Quickly now. I've a wall to keep an' a hill full o' orcs to keep it from." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' good timin' too. I've more work than hands, an' ye've brought a pair." },
    { id = "g_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "Here's the one who brought me Nek'rosh's head. Stand up straight; the lads are watchin'." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the Dragonmaw havenae let up fer a day of it. Good, ye're back, so I've a pair o' hands again." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "Back after {away}, an' ye've the look o' someone who's held a wall o' their own since. I'll put ye where the fightin's thickest, an' ye'll thank me." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "One o' the lads says ye've been puttin' the fear into folk in the harbor. Save it fer the orcs on the hill, fer I'll no' have it inside my wall." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear ye've been doin' right by Menethil these past days. That's how a wall stays standin', one honest job at a time." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 24 },
      text = "Ye've the look o' someone who's held a line before, which is good, because I've more lines than I've folk to hold them." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's in ribbons. Get it seen to before ye go back up the road, for I'll no' send folk out half-dressed." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The torches along the wall leaned away from ye when ye came up the steps, every one o' them, an' I've a keep full o' soldiers who noticed it too. I'll speak wi' ye, for I need every hand I can get, but I'd thank ye tae stand where my men can see ye." },
    { id = "n_lock_ward", cat = "lock_armor", when = { class = "WARLOCK", aura = { 6229, 11739, 11740, 28610 } },
      text = "That black shell on ye's a ward against shadow, I'd wager, for I've seen the Horde's warlocks wear the like in the last war. It's a strange thing tae see on our side o' the line, but I'll grant it'd be useful against the Dragonmaw's shamans." },
  },

  start = "hello",
  nodes = {
    opn_jaina = {
      lines = {
        { id = "opn_jaina_q", text = "The Admiral's daughter. She stood wi' the orcs against her own father, an' now she keeps a peace wi' them across the water that the sailors swear by an' the old soldiers swear at. My boats run tae her harbour, so I've a stake in it. What's yer view?" },
      },
      choices = {
        { text = "She keeps the peace. That's worth more than a grudge.", next = "opn_jaina_r_admire", fx = { align = { light = 1 }, opinion = { jaina = "admire", peace = "peace" } } },
        { text = "She turned on her own father for orcs. I'd not trust her.", next = "opn_jaina_r_traitor", fx = { affinity = 1, align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "Brave, but young. Peace with orcs won't outlast her.", next = "opn_jaina_r_naive", fx = { trait = { skeptical = 1 }, opinion = { jaina = "naive" } } },
        { text = "She's a mage of the Kirin Tor. She knows her mind.", next = "opn_jaina_r_respect", when = { class = "MAGE" }, fx = { opinion = { jaina = "respect" } } },
        { text = "I've never met her, Captain.", next = "BACK" },
      },
    },
    opn_jaina_r = {
      lines = {
        { id = "opn_jaina_r_default", text = "Nor have I, an' I'd like tae keep it that way, for the last Proudmoore I met shouted at me for an hour about the harbour." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_jaina_r_admire = {
      lines = {
        { id = "opn_jaina_r_admire", text = "Maybe so, an' my sailors would kiss ye for sayin' it. I'll keep my walls manned all the same, for a peace across the water doesnae reach Grim Batol." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_jaina_r_traitor = {
      lines = {
        { id = "opn_jaina_r_traitor", text = "Hard words for a lass who saved more lives than I've got men. I'll no' say ye're wrong, mind, for the Admiral's sailors still drink in my tavern, an' they don't toast her." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_jaina_r_naive = {
      lines = {
        { id = "opn_jaina_r_naive", text = "Aye, that's my fear too, put neater than I'd put it. Peace is a fine thing until the one who made it is gone, an' then it's just a wall wi' no guards." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_jaina_r_respect = {
      lines = {
        { id = "opn_jaina_r_respect", text = "Ye'd know better than an old soldier. I only know her ships pay their dues an' her captains don't lie about cargo, an' ye cannae say the same for Booty Bay." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xpt_dwarf = {
      big = true,
      lines = { { id = "xpt_dwarf_default", text = "Well enough, for the humans built the harbour and we hold the road, and between us the Dragonmaw stay up at Grim Batol where they belong. But Menethil's a human town at heart, and a dwarf here learns to like fish whether he wants to or not." } },
      choices = {
        { text = "Humans and dwarves holding a road together. That's the Alliance.", next = "BACK", reply = "Aye, that's the Alliance as it ought tae be, an' Menethil's proof it can work. If ye're ever in Stormwind, tell the lords that, for some o' them have forgotten who holds their back door.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every folk should hold its own lands and leave the rest.", next = "BACK", reply = "Easy tae say when ye've lands tae hold. Ours were taken by the Dark Irons, an' without the humans' harbour we'd have nae foothold left at all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would, an' I'd no' sleep easy for it. The Horde had warlocks o' their own in the old war, an' I've seen what fel fire does tae a stone wall, so if ye mean tae fight the Dragonmaw wi' the same, ye'll fight from the far end where I can see ye." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I would, an' I'd no' sleep easy for it, an' I'll sleep worse now I've seen what ye keep at yer heel. The Horde had warlocks o' their own in the old war, an' I've seen what fel fire does tae a stone wall, so ye an' that thing will fight the Dragonmaw from the far end where I can see ye both." },
      },
      choices = {
        { text = "I'll fight cleanly, Captain, and stay where you can see me.", next = "BACK", reply = "That's all I ask, an' more than most warlocks offer. Stay in my sight, an' ye'll find me fair enough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire answers fire. The orcs taught us that.", next = "BACK", reply = "They taught us plenty, an' none o' it worth keepin'. I'll take yer fire against the Dragonmaw, but I'll no' have it inside my walls.", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "The Dragonmaw hold the hills from Dun Algaz to Grim Batol, an' they've no reason tae look for one quiet blade among the rocks. Bring me their numbers an' the name o' whoever leads them, an' I'll know where tae strike." },
      },
      choices = {
        { text = "I'll bring numbers, not heads. That's your soldiers' work.", next = "BACK", reply = "Numbers'll serve me better than heads, so ye've a soldier's sense. Bring them tae Valstag, an' I'll see ye're thanked proper.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I find their leader asleep, he won't wake.", next = "BACK", reply = "Then he'll no' be missed, an' the Dragonmaw will be squabblin' over who comes next. Just dinnae get caught, for I cannae spare a rescue.", fx = { align = { honor = -1 } } },
        { text = "Who leads them now?", next = "nekrosh" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Aye, it could, an' Dalaran's had other troubles since the war than sendin' mages tae a wet harbour. The Dragonmaw come down out o' the hills in war parties, an' a mage on the keep's wall would make them think twice." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome mage, out o' Gnomeregan's fall, an' I'll put ye on my wall gladly. Ironforge took yer people in when the troggs came, an' Menethil's Ironforge's as much as anyone's." },
      },
      choices = {
        { text = "Point me at the walls, Captain.", next = "BACK", reply = "Good, for that's where I need ye. The north wall takes the worst o' it, an' a mage on it is worth ten crossbows.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight, but I'll choose where.", next = "BACK", reply = "Fair, I suppose, though I'd rather ye chose somewhere I've posted ye. Let Valstag know where ye'll be, at least.", fx = { align = { order = -1 } } },
        { text = "Who are the Dragonmaw?", next = "dragonmaw" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They've chopped an' burned an' dragged the beasts out o' their dens for their wars. The orcs leave the land poorer wherever they march." } },
      choices = {
        { text = "Then we drive them out of the marsh.", next = "BACK", reply = "Aye, an' I'll lend ye every soldier I can spare for it. I want tae see Dun Modr's bridge without a Dragonmaw banner on it before I die.", fx = { align = { honor = 1 } } },
        { text = "Even orcs must live somewhere. Talk first.", next = "BACK", reply = "Talk? Tae the Dragonmaw? They'd have yer tongue for a necklace. Ye're kind, I'll grant ye, but I've buried too many lads who tried it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "On the Algaz road, between the Dragonmaw an' the folk who still try tae walk it, for that's where the Alliance is thinnest. Valstag will give ye the reports, an' ye'll no' like any o' them." } },
      choices = {
        { text = "Then I'll stand on that road, Captain, whatever comes.", next = "BACK", reply = "Good, for that's where the Alliance needs ye most. Valstag's reports will tell ye where they struck last.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather strike their camp by night and be done.", next = "BACK", reply = "By night? Ye've a soldier's courage, I'll grant, but their camp's bigger than ye think. Stand on the road first, an' see what ye're dealin' wi'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Good, an' I'll no' pretend otherwise. His Dark Iron hold Dun Modr up north an' they've been sniffin' at Thandol Span for years, an' every one o' them took orders from that throne. A headless army still bites, mind, but it bites in the wrong direction more often." } },
      choices = {
        { text = "Now's the time to push north and take Dun Modr back.", next = "BACK", reply = "Push north wi' what army? I'd like nothin' better, but Ironforge cannae spare the dwarves, an' neither can I.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hold the walls, Captain, and let the Dark Iron tear each other apart.", next = "BACK", reply = "That's a captain's thinkin', an' I've half a mind tae agree. Let the Dark Irons feud, an' we'll pick up the pieces after.", fx = { align = { honor = -1 } } },
        { text = "Who holds Dun Modr for them now?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Their own captains, an' I'll no' guess at names I havenae got. My scouts see them diggin' an' forgin' up there, an' Thandol Span's the only road between us an' Arathi, so I watch it like a hawk." } },
      choices = {
        { text = "Then I'll keep an eye on the Span when I pass.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_dwarf", tags = { "news" }, when = { party = { race = "Dwarf" }, faction = "Alliance" },
          text = "{companion} is a dwarf of Ironforge by the look of them, and you've no idea how good that is to see in a harbour full of humans and soggy boots." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Good; I've sailors on the wall who need tae see what a holy hammer looks like comin' down on an orc." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Alliance" },
          text = "I hear Thaurissan's dead in his own hall. The Dark Iron at Dun Modr havenae heard yet, or if they have, they're no' showin' it, but they will." },
        { id = "h_default", key = true,
          text = "Captain Stoutfist. I hold Menethil for Ironforge an' the Alliance both. The Dragonmaw have come down out o' the hills into Dun Algaz, an' if they hold it, the road to Loch Modan's shut." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Captain Stoutfist") },
          text = "Valstag Ironjaw sent ye? He's a good man, an' I asked him for soldiers who'd go where they're told, so let's find out if that's you." },
        { id = "h_banners", when = { questActive = TODO_QUEST("War Banners") },
          text = "They've a camp in the hills northeast o' here wi' their filthy banners hung over it. Bring me those banners, for I want 'em to wake up an' see bare poles." },
        { id = "h_gambit", tags = { "news" }, when = { questActive = TODO_QUEST("Nek'rosh's Gambit") },
          text = "Catapults! The brute's buildin' catapults to throw at my walls, so burn them before he finds the range." },
        { id = "h_nekrosh", tags = { "news" }, when = { questActive = TODO_QUEST("Defeat Nek'rosh") },
          text = "Nek'rosh Skullcrusher leads them. Cut off the head an' the Dragonmaw crawl back to their caves, so bring it to me in a sack; I'll want to see it for myself." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "An elf from the sky, is it? I don't suppose ye can see the orc camps from up there... no? Then ye'll walk to them like the rest of us." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Defeat Nek'rosh"), days = 3 } },
          text = "The lads sang last night, badly an' mostly about you, an' I let them. It was the first night in a year nobody watched the hills for torches." },
        { id = "h_statuette", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend of the Family") },
          text = "Ye've got the statuette, then. Take it straight to Highlord Fordragon in Stormwind, an' I mean straight: no' to a clerk, no' to a captain, but to Fordragon himself." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A proper beard, thank the Light! Half my garrison's sailors who think a hammer's for nails." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I'm on the night watch. The orcs like the dark, an' so do I, for it means I can see their fires." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There ye are! The lads on the wall have been askin' when ye'd be back, an' so have I, though I'll deny it if they ask." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "I've a wall tae hold an' no time for them that cannae be trusted on it. Speak quick." },
        { id = "h_xward", when = { origin = "dwarf_military_ward" },
          text = "Ye've the stance o' a {g:lad|lass} raised in the Military Ward, an' I'd know it anywhere, since I drilled in that yard myself. Good; I've no time to teach anyone which end o' the axe is the business end." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Menethil! The Wetlands could use one o' ye, because the whole marsh has been in a fury since the Dragonmaw came." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, is it? I'll take any hand that'll hold the wall, but keep whatever ye've got on that leash well away from my sailors." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dragonmaw", min = 40 } }, text = "The lads on the wall say there's fewer Dragonmaw on the hills each mornin', an' they've started callin' it yer doin'. Good; I'll have bare banner poles yet." },
        { id = "dd_thandol", when = { questDone = TODO_QUEST("The Thandol Span") },
          text = "Longbraid's men tell me ye went down intae the Thandol Span's footings after the Dark Irons. That bridge is the only road north tae Arathi, so I'm in yer debt, an' I hate bein' in debt." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, mind, for the wall doesnae keep itself." },
        { id = "h_again2", text = "Go on, I'm listenin' wi' one ear, though the other's on the hills." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask what ye like. I'll be up on these walls till dawn either way." },
      },
      choices = {
        { text = "The Dragonmaw seem to be wrecking the marsh.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Dragonmaw?", next = "dragonmaw" },
        { text = "Who leads them?", next = "nekrosh" },
        { text = "The harbour seems to be holding.", next = "harbour" },
        { text = "Something's stirring to the north, by the look of it.", next = "north" },
        { text = "Ironforge sent me to the frontier too, Captain.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Catapults? I could take one apart in an hour.", next = "gnome", when = { race = "Gnome" } },
        { text = "Your wounded and your dead. Who tends them?", next = "priest", when = { class = "PRIEST" } },
        { text = "I came out of Lordaeron. Your harbour carries our king's name.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Nek'rosh is dead. What happens now?", next = "after", when = { questDone = TODO_QUEST("Defeat Nek'rosh") } },
        { text = "Put me to work, Captain.", next = "BUSINESS", fx = { affinity = 1, standing = { menethil = 1 } } },
        { text = "Give me the worst stretch of wall, Captain.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "The raptors on the road. I could tame one.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "The earth spirits here are angry, Captain.", next = "xshaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I could get close to the Dragonmaw and count their axes.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Menethil could use a mage on the walls, Captain.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Where would a paladin serve Menethil best, Captain?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you put a warlock on your wall, Captain?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thaurissan is dead, Captain. I saw it done.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Alliance" } },
        { text = "My companion's from Ironforge. How does Menethil sit with dwarves?", next = "xpt_dwarf", when = { party = { race = "Dwarf" }, faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    dragonmaw = {
      big = true,
      lines = {
        { id = "d_default", text = "Orcs that rode dragons in the Second War. They burned half the coast from those beasts' backs. Now they've no dragons left to ride an' they're angrier for it." },
      },
      choices = {
        { text = "Then let's finish them.", next = "BACK", reply = "Aye, that's the spirit I've been waitin' on, an' there's few enough of it in this bog. Mind ye, Grim Batol's a long climb, so we'll start wi' their camps on the road an' work our way up.", fx = { affinity = 2, learn = { "dragonmaw" }, align = { honor = 1 } } },
        { text = "Let them rot in the hills, and spare our own dwarves.", next = "BACK", reply = "That's my aim exactly, an' it's why I keep the lads close tae the walls. The Dragonmaw can freeze up there in Grim Batol's shadow for all I care.", fx = { align = { honor = -1 } } },
        { text = "No dragons at all?", next = "none", fx = { learn = { "dragonmaw" } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "None that I've seen, an' believe me, I look. Every mornin', first thing, I'm up on the wall lookin'." } },
      choices = {
        { text = "Their dragons must have gone somewhere.", next = "grim_batol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim_batol = {
      lines = {
        { id = "gb_default", text = "The reds broke loose an' turned on their riders. That's how the Dragonmaw came to be hidin' in our hills. Now red dragonkin hold the gates o' Grim Batol, east o' here, an' let nobody up that road." },
      },
      choices = {
        { text = "Grim Batol was a dwarven hold, wasn't it?", next = "grim_batol_old" },
        { text = "Good riddance to the Dragonmaw.", next = "BACK", reply = "Aye, an' I'd no' weep if the reds finished the job. Still, they're sittin' on our hills, so it's no' over yet.", fx = { align = { order = 1 } } },
        { text = "Pity the dragons. They never chose their riders.", next = "BACK", reply = "Pity them, aye, for they never asked tae be chained. But pity doesnae stop a red from burnin' a village, so keep yer distance.", fx = { align = { order = -1 } } },
      },
    },
    grim_batol_old = {
      lines = {
        { id = "go_default", text = "It was a Wildhammer hold, before they went north to the Hinterlands. There's been somethin' black in that stone since the old clan wars, an' no dwarf I know would sleep there, dragons or no." },
      },
      choices = {
        { text = "Then the dragons can keep it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nekrosh = {
      lines = {
        { id = "nk_default", text = "Nek'rosh Skullcrusher, son o' Nekros, the warlock who chained the reds in the first place. The dragons ate his da, an' he's sworn to settle wi' them." },
      },
      choices = {
        { text = "He wants the dragons, not you?", next = "nekrosh_siege" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    nekrosh_siege = {
      big = true,
      lines = {
        { id = "ns_default", text = "He cannae reach the dragons, so he'll reach me instead: catapults in the hills, an' his lads in Dun Algaz so no help comes up the road. It's clever, I'll give him that, an' nothin' else." },
      },
      choices = {
        { text = "Then the catapults burn first.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I hope Menethil can hold a siege.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harbour = {
      lines = { { id = "hb_default", text = "Ships still come an' go, which is the point o' the place. While the boats run, the Alliance has a back door. I mean to keep it open." } },
      choices = {
        { text = "A back door to where?", next = "harbour_routes" },
        { text = "Something else.", next = "BACK", fx = { standing = { menethil = 1 } } },
      },
    },
    harbour_routes = {
      lines = {
        { id = "hr_default", text = "Boats to Theramore an' Auberdine, gryphons to Ironforge an' Southshore. Shut Dun Algaz an' the Thandol Span both, an' this harbour's all that joins Khaz Modan to the rest." },
      },
      choices = {
        { text = "What do you make of Lady Proudmoore in Theramore?", next = "opn_jaina" },
        { text = "Menethil looks like human work, not dwarven.", next = "harbour_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbour_name = {
      lines = {
        { id = "hn_default", text = "Admiral Proudmoore's men built it after the Second War an' named it for King Terenas. I'm proud o' that name, an' somebody ought to be, now." },
      },
      choices = {
        { text = "Then it's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    north = {
      lines = {
        { id = "no_default", text = "Dark Irons. They broke the Thandol Span an' took Dun Modr off Longbraid's lads. One enemy at a time, I keep tellin' my lot, an' they keep askin' which one." },
      },
      choices = {
        { text = "Ironforge could surely send more soldiers.", next = "north_ironforge" },
        { text = "Harlo Barnaby came from there.", next = "north_harlo", when = { heardLine = "harlo.h_default" } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    north_ironforge = {
      lines = {
        { id = "ni_default", text = "Ironforge sends its sons to every war the Alliance asks it to, an' that's the trouble: they're still out there, an' the Dark Irons noticed who wasnae home." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    north_harlo = {
      lines = {
        { id = "nh_default", text = "That's young Barnaby. He came in on a horse wi' an axe in his back an' asked if his lads were alive before he asked for a healer, an' that's a soldier for ye." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Then ye know what this place is. The Wetlands were ours once, holds an' roads both, an' Menethil's the bit that's left. I mean to keep it." },
      },
      choices = {
        { text = "Ironforge will win the rest again.", next = "BACK", reply = "Aye, they will, given time an' dwarves, an' I'd like tae see it. Menethil's a start, an' I'll no' give it up.", fx = { affinity = 2, align = { order = 1 }, standing = { menethil = 1 } } },
        { text = "The Wetlands belong to the marsh now. Let them go.", next = "BACK", reply = "The marsh? Ye've been listenin' tae the druids, have ye? These were dwarven lands long before the frogs moved in.", fx = { align = { order = -1 } } },
        { text = "Why not pull back to Loch Modan?", next = "dwarf_retreat" },
      },
    },
    dwarf_retreat = {
      lines = { { id = "dr_default", text = "Because then the boats stop, an' Ironforge would be talkin' to Theramore by shoutin'. No, we hold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gnome = {
      lines = {
        { id = "gn_default", text = "Ye could, I don't doubt it. I'd sooner ye burned it, an' took apart the ashes after. Mind, if ye see how they're built, tell me what's aimed at my wall." },
      },
      choices = {
        { text = "I'll bring you notes. And a drawing.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Burning's quicker anyway.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Brother Glorin Steelbrow, in the tavern, an' he'll tell ye he's no' enough. Bless the lads before they go up the road, if ye've time. They're braver when somebody's prayed." },
      },
      choices = {
        { text = "I'll pray with them before they go.", next = "BACK", reply = "Bless ye for it, for the lads are braver for a prayer an' a kind word. Glorin will be glad o' the help, though he'll no' say so.", fx = { affinity = 2, align = { light = 2 }, standing = { menethil = 1 } } },
        { text = "Prayers won't stop a Dragonmaw axe. Better armour will.", next = "BACK", reply = "Better armour, aye, if Ironforge would send it. Until then a prayer is what we've got, an' the lads believe in it.", fx = { align = { light = -1 } } },
        { text = "And the ones who don't return?", next = "priest_dead" },
      },
    },
    priest_dead = {
      big = true,
      lines = {
        { id = "pd_default", text = "We bury them on the high ground, where the sea cannae take them twice. Glorin says the words an' I stand there, an' I've never got used to it, nor want to." },
      },
      choices = {
        { text = "Then I'll stand with you at the next one.", next = "BACK", reply = "Thank ye. It's no' a duty I'd wish on anyone, but it's easier wi' company.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Dead is dead, Captain. The high ground won't matter to them.", next = "BACK", reply = "Maybe no' tae them, but it matters tae me, an' tae the lads who'll lie beside them. Keep yer cold words for the Dragonmaw.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lordaeron = {
      lines = {
        { id = "lo_default", text = "I never met King Terenas, but I keep his harbour all the same, an' I'll keep his name on the gate as long as I've breath." },
      },
      choices = {
        { text = "Thank you for that.", next = "BACK", fx = { affinity = 3 } },
        { text = "Terenas is dead, and Lordaeron with him.", next = "lordaeron_dead" },
      },
    },
    lordaeron_dead = {
      lines = { { id = "ld_default", text = "Aye, but the harbour's no'. That's what names are for, {g:lad|lass}; they outlast the folk who gave them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },

    after = {
      big = true,
      lines = {
        { id = "af_default", text = "It's quieter now. The banners are ash, the catapults are ash, an' the clan may never get up again. Somebody'll try to take his place, but till then my lads can sleep." },
      },
      choices = {
        { text = "And if someone does?", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Then my work here is done.", next = "BACK", fx = { affinity = 2, standing = { menethil = 2 } } },
      },
    },
    xwarrior = {
      big = true,
      lines = { { id = "xwa_default", text = "The worst stretch is the east gate, where the Dragonmaw come out o' the marsh at dusk, an' it's held by three lads an' a dog. Stand there one night an' I'll know what ye're worth." },
        { id = "xwa_gnome", when = { race = "Gnome" },
          text = "A gnome askin' for the worst o' the wall; now I've heard everything. The east gate, then, an' I'll find ye a crate to stand on so the Dragonmaw can see what's comin'." } },
      choices = {
        { text = "One night? I'll stand a week, and no relief.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { menethil = 1 } } },
        { text = "How is the harbour holding up otherwise?", next = "harbour" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Tame one o' those? Ye're mad, an' I like it. If ye can teach a raptor to bite a Dragonmaw instead o' my supply carts, I'll call it a draw between us an' the marsh." },
        { id = "xhu_pet", when = { pet = { type = "Beast" } },
          text = "Ye've a beast already, an' it's eyein' my goats. Keep it fed, an' if ye bring home a raptor as well, keep that one well clear o' the harbour; the sailors are jumpy enough." },
      },
      choices = {
        { text = "A raptor's loyal once it's broken.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "What else is out on the road?", next = "north" },
      },
    },
    xshaman = {
      big = true,
      lines = { { id = "xsh_default", text = "Are they, now? I've not made my mind up about Ironforge dwarves talkin' to the stones, for it's no' the way I was raised. But if the earth here's angry, I'd like to know whether it's angry at the Dragonmaw or at us." },
      },
      choices = {
        { text = "At the Dragonmaw. They chain its dragons.", next = "BACK", reply = "Aye, that's my guess too, an' I'd no' blame the earth for it. If ye can tell it Menethil's no' its enemy, I'd thank ye.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "At all of us. It doesn't take sides.", next = "BACK", reply = "At all of us, is it? Then I'll stop expectin' the stone tae take sides an' trust my own walls instead.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Why haven't you made up your mind?", next = "xshaman_wild" },
      },
    },
    xshaman_wild = {
      lines = { { id = "xsw_default", text = "Because when I was a lad the stone was for carvin' an' minin', no' for talkin' to. The world's changin' faster than an old captain can keep up wi', an' I'm tryin', so bear wi' me." } },
      choices = {
        { text = "Maybe Ironforge should listen.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, that's a rare thing tae hear on this wall, an' I'll no' turn it away. The lads have held Menethil on short rations an' shorter sleep, so I'll pass it on tae them." },
        { id = "s2", text = "Ha, ye've a good eye for soldierin', I'll say that. It's kind o' ye, an' it'll keep me warm on the night watch." },
      },
      fail = {
        { id = "f1", text = "I've nae time for sweet talk wi' the Dragonmaw on the hill. If ye think so well o' the garrison, grab a shield an' join it." },
        { id = "f2", text = "That's the sort o' thing a merchant says before he names his price. Speak plain tae me, for I'm a soldier an' I've nae ear for the other kind." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Ye've a mouth on ye like a sergeant I served under in the Second War, an' he was the best I ever knew. Aye, I can take it, an' I'll give ye worse back when I've a minute." },
        { id = "s2", text = "Cheeky, are ye? Good, for I'd sooner have someone wi' a bit o' fire than another recruit who salutes the mud." },
      },
      fail = {
        { id = "f1", text = "Ye'll no' talk tae me like that in my own keep, in front o' my own guard. One more word an' ye'll be scrubbin' the harbor steps wi' the tide comin' in." },
        { id = "f2", text = "I've lost good dwarves on this wall, an' I'll no' be laughed at by someone who's never stood on it. Get tae the point or get out." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Aye, all right, ye've a hard look an' I've nae doubt ye can back it. I've enemies enough outside the gate wi'out makin' one inside, so have yer say." },
        { id = "s2", text = "Ye'd make a fair drill sergeant, glowerin' like that. Fine, I'll give ye the point, for I've nae hands tae spare on a quarrel." },
      },
      fail = {
        { id = "f1", text = "I watched red dragons burn these hills, so ye'll forgive me if I dinnae quake. Try that again an' I'll show ye how a dwarf settles it." },
        { id = "f2", text = "Are ye leanin' on the captain o' Menethil Keep, wi' the whole garrison in earshot? Ye're either very brave or very daft, an' I've nae time tae find out which." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's keep business, an' I'll no' share it wi' someone I've no' seen fight. Earn yer place on the wall an' ask me again." },
      { id = "gt2", text = "I know well enough, but I'm no' tellin' a stranger. A captain keeps his mouth shut till he knows who's listenin'." },
    },
    knows = {
      { id = "tp_knows", text = "Every scout an' sentry on this coast reports tae me, an' most o' what they report is bad. Ask me about any o' this." },
    },
    thandol_span = { { id = "tp_span", text = "One bridge down, one standin', an' Longbraid's lads between the Dark Irons an' the rest of us." } },
    background = { { id = "tp_bg", text = "Ironforge gave me a wall an' a harbour behind it, an' that's the whole o' my story. I like it short." } },
    advice = { { id = "tp_ad", text = "Dinnae walk Dun Algaz alone, an' dinnae walk it at night. Ye'll meet orcs either way, but it's better to see them first." } },
    dragonmaw = {
      { id = "tp_dragonmaw", text = "Dun Algaz is theirs for now. 'For now' is doin' a lot o' work in that sentence." },
      { id = "tp_dragonmaw2", text = "A clan wi' no dragons an' a chief wi' a grudge. Ask me who leads them.", next = "nekrosh" },
    },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons took Dun Modr off us, up north. One enemy at a time, I keep tellin' the lads, an' they keep askin' which one." } },
    explorers_league = { { id = "tp_league", text = "The League's man upstairs wants an escort to his dig. I've no men to spare for bones." } },
    _none = { { id = "tp_none", text = "That's no' my concern, I'm afraid; my concern's the wall." } },
    grim_batol = {
      { id = "tp_grim_batol", text = "Grim Batol's the Dragonmaw's den, east past the highlands, an' in the war they kept a red dragon queen chained there. She's free now, they say, but the place still stinks o' dragon an' worse." },
      { id = "tp_grim_batol2", when = { disposition = { min = 65 } }, text = "Between us, the old dwarves won't even say its name, for it was the Wildhammer's home before the Dark Irons cursed it. I've sent scouts past it, but never in, an' I never will." },
    },
    magni = { { id = "tp_magni", text = "King Magni gave me this wall an' this harbour, an' he expects both standin' when he next asks. I write tae him every month, an' I've never once had tae write bad news about the wall." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer fly patrols over the highlands when it suits them, an' I'm glad o' the eyes. Mind, gettin' a report out o' a Wildhammer is like gettin' a straight answer from a gryphon." } },
    theramore = { { id = "tp_theramore", text = "Lady Jaina's ships come in from Theramore every week, an' her marines are good lads. Better sailors than soldiers, but I'll take either." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore made peace wi' the orcs over the sea, an' her own father died fightin' it. I don't know if she's right, but she's brave, an' I respect that." } },
    scourge = { { id = "tp_scourge", text = "The Scourge sits across the water in Lordaeron, an' the Thandol Span's the only dry road between them an' Ironforge. That's why we hold it, whatever it costs." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde was the strongest human kingdom in the north once, an' now it's a ruin wi' ogres in it. Their soldiers still hold Refuge Pointe, an' I send them what I can spare." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War when the orcs came up through Khaz Modan, an' I watched the Dragonmaw burn these hills wi' red dragons. Now they're back on the highland, an' I'm back on the wall." } },
  },
}

P:NPC {
  key = "fitzsimmons", id = TODO_NPC("First Mate Fitzsimmons"), name = "First Mate Fitzsimmons",
  bible = "bibles/menethil.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "maudlin" }, values = { "loyal" },
  notices = { "drink", "fright", "lock_soulstone" },

  impression = {
    first = "He has no ship left, and he isn't sober about it.",
    third = "{name} heard a tale from First Mate Fitzsimmons, a Kul Tiran sailor without a ship who sits by the door of the Deepwater Tavern.",
  },

  greetings = {
    { id = "g_tale", text = "Sit down, sit down! A drink and a tale, that's my price. You bring the drink, I'll bring the tale." },
    { id = "g_back", when = { metBefore = true }, text = "My friend, you came back! Nobody ever comes back. Sit down, sit downwind, as they all say, though I can't think why." },
    { id = "g_away", when = { away = 14 }, text = "You came back, after {away}! Nobody ever comes back, and you've done it twice now, so sit down and I'll find a tale worthy of it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, you've grown fearsome since you first bought me a drink! The old crew would have made you bosun, and I'd have saluted you myself." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody in the harbor caught you in a fib. Now, a tale's one thing and a fib's another, and I should know, because I tell a great many tales." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've had a few, haven't you? Good, good, now you're my kind of company." },
    { id = "n_sailor", cat = "fright", when = { resSick = true },
      text = "You've been dead, haven't you? I can always tell. You've the look my shipmates had, the ones that still walk, so sit by me a while; I don't mind." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "There's a soul bound in a stone hangin' on you, I can see it shiver, and it puts me in mind of my shipmates out on the wrecks. They're bound too, only nobody bound them on purpose, so drink with me and tell me it's worth it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Pray, curse, bargain and beg, and I've done all four in one storm. We don't call it spirits, we call it the sea, but no Kul Tiran would sail without a word to it first. The night the Wave Mistress went down, I'd forgotten the word, and I don't forget anymore." } },
      choices = {
        { text = "Keep saying the word. The sea respects respect.", next = "BACK", reply = "Aye, it does, and it's never once been impressed by a sailor who forgot to say please. I'll drink to that, if you're buying.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Words won't save a ship. Seamanship will.", next = "BACK", reply = "Seamanship! The Wave Mistress had the best crew in Kul Tiras, friend, and it didn't save her. Say your words, and say them loud.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only in my dreams, and only when I've run short of mead, so I make very sure I never run short. My old shipmates walk the wrecks out there, cursed and bound, and if you've a trick that can talk to the dead, I'd beg you not to use it on them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only in my dreams, and only when I've run short of mead, though your demon looks like something out of the worse sort of dream, and it's making me thirsty. My old shipmates walk the wrecks out there, cursed and bound, so I'd beg you not to send that thing anywhere near them." },
      },
      choices = {
        { text = "I'd never trouble your shipmates. Let them rest.", next = "BACK", reply = "That's kind, friend, kinder than most would be, and I'll drink to it. Let them rest, if the bay ever lets them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead know things. I'd ask them, if I could.", next = "BACK", reply = "Know things? They know the bottom of the bay and nothing else, and I'd thank you to leave them be. I sailed with those men, and I don't want to hear what they'd say now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothing from me, friend, for the bay took everything I had worth stealing when the Wave Mistress went down. If it's treasure you're after, there's a whole fleet of it sitting on the bottom of the bay, though the drowned crews still guard every coin of it." } },
      choices = {
        { text = "I'd not rob the drowned. Let them keep it.", next = "BACK", reply = "That's decent of you, friend, though half the harbour would call you soft. There's a pay chest down there with my name on the ledger, and it can stay down there.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The dead don't need gold. I'll fetch it up.", next = "BACK", reply = "You'd go down there for gold? Then mind the Third Fleet's lads, because they don't take kindly to visitors, and I'd hate to drink to you too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Marines, we called them, and they'd hold the rail against anything, pirates or worse, and then drink the hold dry after. I'd buy you a drink in their memory if I had a coin, which I don't, so you'll have to buy it." } },
      choices = {
        { text = "I'll drink to them, and buy the round myself.", next = "BACK", reply = "Now you're a proper shipmate, friend! To the marines, then, and may their rail hold forever.", fx = { align = { honor = 1 } } },
        { text = "Memories don't hold a rail. I'll keep my coin.", next = "BACK", reply = "No, but they do keep a man going on a cold night. Keep your coin, then, and I'll drink to them alone, as usual.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisks on the shore, and they'll have your leg if you're careless, for I've seen it happen to a better sailor than me. And murlocs, if you call that hunting, which I don't, since they come at you whether you want them or not." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crocolisks on the shore, mostly, and they'll have your leg if you're careless. {pet} would be welcome on any ship I ever sailed, provided it left the ship's cat alone." },
      },
      choices = {
        { text = "I'll keep the shore clear for the harbour's sake.", next = "BACK", reply = "That's kind of you, and the harbourfolk will thank you, even if the crocs won't. Mind your legs out there.", fx = { align = { honor = 1 } } },
        { text = "Crocolisk hide sells well. That's reason enough for me.", next = "BACK", reply = "Hide's hide, and a man has to eat, I suppose. Just remember the crocs think much the same about you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That's what the grumpy one up at the chapel says, Brother Glorin, and I believe him when I'm sober enough to. They're still at their posts out in the bay, you see, because nobody ever gave them the order to stand down." } },
      choices = {
        { text = "Then I'll give them that order and set them free.", next = "BACK", reply = "Would you? I've hoped for that since the night she sank, friend, and I'll buy you a drink when it's done, whatever it costs me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some posts are better kept, even in death.", next = "BACK", reply = "Kept? By drowned men in the dark? You've a hard heart, friend, or you've never stood a watch you couldn't leave.", fx = { align = { light = -1 } } },
        { text = "Something else, Fitzsimmons.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every night, friend, calling the watch the way they did aboard the Wave Mistress, and I answer them when I've had enough to drink. That's why I drink, if you were wondering, and you weren't, but there it is." } },
      choices = {
        { text = "Answer them sober once. They deserve a clear-headed shipmate.", next = "BACK", reply = "Sober? I've not been sober since the Wave Mistress, friend, and I'm not sure I'd know how. But I'll try, for them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Drink, then. Nobody owes the dead a sober ear.", next = "BACK", reply = "That's the kindest thing anyone's said to me in a month. Here's to you, friend, and to whatever ear you lend me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! We had a chaplain aboard the Wave Mistress, and he'd have liked you, though he never could hold his drink." },
        { id = "h_default", key = true,
          text = "Fitzsimmons, first mate of the Wave Mistress, Third Fleet of Kul Tiras... was first mate, I should say, since there's no ship left to be first mate of." },
        { id = "h_mead", tags = { "news" }, when = { questActive = TODO_QUEST("The Third Fleet") },
          text = "My mead. It's in the tavern cellar. I'd fetch it, but the stairs move about when I'm sober, and I'm terribly sober right now." },
        { id = "h_mead_done", when = { questRecent = { TODO_QUEST("The Third Fleet"), days = 3 } },
          text = "Ah, that's better, now I can talk. Now I can even talk about it, so pull up that barrel and listen." },
        { id = "h_crew", tags = { "news" }, when = { questActive = TODO_QUEST("The Cursed Crew") },
          text = "The wrecks in the bay aren't empty, you see. My crew never left them, and they're still at their posts when they shouldn't be, so set them free." },
        { id = "h_curse", when = { questDone = TODO_QUEST("Lifting the Curse") },
          text = "They're resting, all of them? Then I'll drink to them tonight, and tomorrow too, and mostly to them." },
        { id = "h_halyndor", tags = { "news" }, when = { questActive = TODO_QUEST("Lifting the Curse") },
          text = "Captain Halyndor still walks the Intrepid. Get his key, open that strongbox, and take what's in it to Brother Glorin. Don't look at it long." },
        { id = "h_greenwarden", when = { questActive = TODO_QUEST("The Greenwarden") },
          text = "Off to find old Greenie, are you? He's east of the road where it forks for Dun Modr, so bring a big stick, or better yet, bring two." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Listen... can you hear that, out on the water? No? Then you're lucky, because I hear it every night." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You'd have done well on the Wave Mistress, friend, for a deck's no different from a wall when the boarders come over the side." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? We had a hunter aboard once who kept a hawk on the mainmast, and it brought us fish when the stores ran low." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! We had a ship's cat aboard the Wave Mistress that I swore was a druid, because it always knew when a storm was coming." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, is it? Keep your hands where I can see them, friend, though there's nothing in my pockets but sand and the smell of mead." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Sit down, sit down; you can't smell any worse than I do, though I'd thank you to keep your demon downwind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, is it? You wouldn't happen to know how to ask the sea for a ship back, would you? I've lost one, and I'd like it returned." },
        { id = "dd_drown", when = { deathCause = "drowning" },
          text = "You've been under the water, haven't you? I can see it in the way you flinch at the harbour. The sea took my whole crew, so I'll forgive you for not liking her." },
      },
      again = {
        { id = "h_again", text = "Another question? Then it's another drink, and I believe it's your round." },
        { id = "h_again2", text = "Still here? You must be my only friend in the world, so sit closer... no, not that close." },
      },
      choices = {
        { text = "Your fleet seems to have met a bad end.", next = "fleet" },
        { text = "Why do you drink so much?", next = "why" },
        { text = "You keep looking out at the bay.", next = "bay" },
        { text = "Got a tale for an adventurer?", next = "greenwarden" },
        { text = "Let me pray for your crew.", next = "priest", when = { class = "PRIEST" } },
        { text = "To the Wave Mistress!", next = "toast", when = { drunk = { min = 1 } } },
        { text = "The cursed Eye from the wreck was cleansed in Stormwind.", next = "cleansed", when = { questDone = TODO_QUEST("Cleansing the Eye") } },
        { text = "I could conjure you something to drink.", next = "xmage", when = { class = "MAGE" } },
        { text = "You must have had warriors aboard the Wave Mistress.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's worth hunting around Menethil, Fitzsimmons?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can your crew's spirits still be set free, Fitzsimmons?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The bay's spirits are restless. Do you hear them at night?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What would a rogue find worth taking in Menethil, Fitzsimmons?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the drowned crews in the bay ever speak to you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do Kul Tiran sailors pray to the sea, Fitzsimmons?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Some other time.", next = "END" },
      },
    },
    fleet = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "Red dragons, with orcs on their backs, back in the Second War. They came out of the clouds and set the sails alight, ship after ship, and I lived when nobody else did, nobody at all." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "dragonmaw" } } },
        { text = "You were lucky.", next = "lucky", fx = { learn = { "dragonmaw" } } },
      },
    },
    lucky = {
      lines = { { id = "l_default", text = "Lucky, yes, that's what they call it. I've been lucky every single night since." } },
      choices = {
        { text = "What do you see, at night?", next = "dreams" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreams = {
      lines = {
        { id = "dm_default", text = "The Wave Mistress, whole again, with the lads at the ropes. Then they turn round and they're not the lads anymore, and I wake up and go looking for a bottle." },
      },
      choices = {
        { text = "They're still out there, aren't they?", next = "bay" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because when I'm drunk the bay's just water. When I'm sober it's a graveyard with my friends in it. You'd drink too." } },
      choices = {
        { text = "Maybe I would.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll buy you one.", next = "mead" },
        { text = "Drink won't change what happened.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    mead = {
      lines = {
        { id = "md_default", text = "Would you? A flagon of Helbrek's dwarven mead, then, and none of the watered stuff he sells sailors. Then I'll tell you the rest of it." },
      },
      choices = {
        { text = "One flagon first, then the tale.", next = "BUSINESS", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay = {
      big = true,
      lines = {
        { id = "by_default", text = "There are two wrecks off the north shore, the Wave Mistress and the Intrepid, and my crew are still aboard them, walking. Something on one of those ships won't let them sleep." },
      },
      choices = {
        { text = "What's holding them there?", next = "bay_curse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_curse = {
      lines = {
        { id = "bc_default", text = "Something in the Intrepid's strongbox. Captain Halyndor kept the key and never said what he'd locked away, the greedy old devil, and I'd have mutinied if I'd known." },
      },
      choices = {
        { text = "I'll go out to the wrecks.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    greenwarden = {
      lines = {
        { id = "gw_default", text = "Something called the Greenwarden lives in the marsh, east of where the road forks for Dun Modr. Leave your purse with me, since gold only gets stuck in teeth like that." },
      },
      choices = {
        { text = "Nice try, Fitz.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "What is it, this Greenwarden?", next = "greenwarden_what" },
      },
    },
    greenwarden_what = {
      lines = {
        { id = "gwh_default", text = "Ask it yourself, if it doesn't eat you first. Folk who come back say it talks. Folk who don't come back don't say much." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Pray loud, then, because they're a long way down and the water's cold. Brother Glorin tried once, and he said the bay didn't answer." },
      },
      choices = {
        { text = "Then I'll take the prayer out to them.", next = "BACK", reply = "Then take it, and pray loud, and maybe they'll hear you better than they heard Glorin. I'll be watching from the dock.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "If the bay didn't answer Glorin, it won't answer me.", next = "BACK", reply = "Maybe not, but they'd know somebody tried, and that's more than most have done. Don't give up on my old shipmates that easy.", fx = { align = { light = -1 } } },
        { text = "The Light hears, even underwater.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    toast = {
      lines = {
        { id = "t_default", text = "To the Wave Mistress, and her crew, and her rigging, and her ugly old figurehead! Ha, now you're a sailor." },
      },
      choices = { { text = "To absent friends.", next = "BACK", fx = { affinity = 2 } } },
    },
    cleansed = {
      lines = {
        { id = "cl_default", text = "Cleansed? Good, that's good. I still hear them some nights, though quieter, maybe... or maybe I'm only drunker." },
      },
      choices = {
        { text = "Give it time, Fitz.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "They're at rest. You can be too.", next = "BACK", reply = "At rest? I'd like that, friend, I really would. Maybe I'll try a night without the bottle, and see if they stay quiet.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Drink, then, if it keeps them quiet.", next = "BACK", reply = "It does, mostly, and it's cheaper than a priest. Here's to quiet, then, and to whoever has to carry me home.", fx = { align = { light = -1 } } },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Water, you mean? I've had enough water to last me, {g:lad|lass}, thank you; I've had the whole bay in my boots. Now if you could conjure a good Kul Tiran rum, I'd sign on as your first mate tonight." },
      },
      choices = {
        { text = "Water's all the arcane gives, I'm afraid.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "You've had enough, Fitzsimmons.", next = "why" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been sitting outside this tavern so long I've heard every tale in the harbour, twice. Ask me about any of this, friend, and maybe stand upwind." },
    },
    third_fleet = { { id = "tp_fleet", text = "That was my fleet, and don't make me talk about it sober.", next = "fleet" } },
    grim_batol = { { id = "tp_grim_batol", text = "That's where the dragons came from, and I don't look east anymore." } },
    background = { { id = "tp_bg", text = "First mate of the Wave Mistress, Third Fleet of Kul Tiras. If you say it fast enough, it doesn't hurt.", next = "fleet" } },
    advice = { { id = "tp_ad", text = "Never sail under a red sky, friend, or a red dragon, and mostly mind the dragon." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Them, the very same, up in the hills now without their dragons. I hope they miss them as much as I miss my ship." } },
    _none = { { id = "tp_none", text = "Don't know, friend. Buy me a drink and ask me again; I'll know even less." } },
    theramore = { { id = "tp_theramore", text = "The boat to Theramore leaves every few days, and I watch it go from this chair. The admiral's daughter rules there now, and I hear she's good to sailors." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore is the admiral's daughter, and she stood with the orcs when he came to Kalimdor to fight them. He died for it and she lived, and I'm still sorting out how I feel about that." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a goblin port where every sailor's welcome so long as his purse is full. I spent a month's wages there in one night once, and I'd do it again with a fuller purse." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail Buccaneers fly the red off the Stranglethorn coast, and no honest ship sails there without guns. I lost a mate to them once, and I don't forgive easy." } },
  },
}

P:NPC {
  key = "glorin", id = TODO_NPC("Glorin Steelbrow"), name = "Glorin Steelbrow",
  bible = "bibles/menethil.md", role = "priest", tier = "quest",
  communities = { "menethil" }, temper = { "grumpy" }, values = { "devout", "dutiful" },
  notices = { "fel", "class", "lock_taint" },

  impression = {
    first = "He blesses people in the same breath as he complains about them.",
    third = "{name} met Glorin Steelbrow, the overworked dwarf priest who tends to the souls of Menethil Harbor.",
  },

  greetings = {
    { id = "g_busy", text = "Hmph, another one. Aye, aye, the Light bless ye, now what is it? I've three things on the fire an' two o' them are smokin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Well, ye're useful, I'll give ye that, an' useful's rare round here." },
    { id = "g_away", when = { away = 14 }, text = "Hmph, gone {away} an' ye wander back in wi' half the bog on yer boots. Aye, the Light bless ye, now wipe yer feet." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a fair bit since last I blessed ye in passin'. The Light's kept an eye on ye, it seems, even if ye didnae ask it to." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear ye've put somebody in the harbor in a proper temper. I've enough grumblin' souls tae tend without ye makin' more, so go an' set it right." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody's been speakin' well o' ye round the harbor, which makes a pleasant change from the usual complainin'. Hmph, well done, I suppose." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "A warlock, is it? Then stand over there, no, further than that, for the Light an' I have enough to deal with in this marsh." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, thank the Light! Ye can take the next three blessings, for I've a backlog." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "Ye're green round the edges, an' it's no' the marsh damp, it's the fel, an' I can smell it on ye like brimstone in a wet cellar. The Light turns nobody out o' the chapel, but I'll ask ye tae stand at the back, for the candles are already sulkin'." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It troubles me some, an' I'll no' lie about it. The Church taught me the Light's the answer tae every darkness, an' here ye are wi' a different answer that seems tae work. But I've buried more drowned sailors than I can count, an' if yer waters keep one more off my table, I'll pray for ye whether ye like it or no'." } },
      choices = {
        { text = "Pray for me, Glorin. I'll take every blessing offered.", next = "BACK", reply = "I will, an' gladly, for the Light's blessing sits easy beside any other. Go wi' it, an' may it keep ye safe in the marsh.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your prayers. The waters answer me well enough.", next = "BACK", reply = "They answer ye, aye, an' I'll no' argue wi' it. But I'll pray for ye anyway, for that's what I do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Well enough, so long as nobody asks either one tae explain itself tae the other. Dalaran's mages stood wi' us when Lordaeron fell, an' I'll no' forget it, but I've buried enough folk who meddled wi' what they didnae understand." } },
      choices = {
        { text = "Magic needs a firm hand. You're right to be wary.", next = "BACK", reply = "Aye, that's my thinkin', though I'll no' say it too loud in front o' the mages. I've seen one young lad set his own sleeve alight in my chapel, an' I'll no' forget the smell.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Magic's a tool, Brother. It's people who meddle.", next = "BACK", reply = "People, aye, an' magic that makes it easy for them. I've buried too many tae believe it's all in the hands.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than I'd like an' fewer than I'd expect, given there's sailors stranded here wi' no ship an' no pay. I'd sooner feed a thief than hang one, but Captain Stoutfist sees it different, an' it's his wall." } },
      choices = {
        { text = "Feed them, Brother. Hunger makes most thieves.", next = "BACK", reply = "I will, an' ye've a kind heart for sayin' so. Most o' them are sailors who've lost everything, an' bread's cheaper than a rope.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A fed thief still steals. Let the Captain judge.", next = "BACK", reply = "Aye, he might, but the Light asks me tae feed him first. The Captain can judge what's left when I'm done.", fx = { align = { order = 1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They bleed, they curse, an' they come tae me tae be stitched an' blessed so they can go an' bleed again. I'll no' complain, though, for every one I patch up stands between the murlocs an' the harbour." } },
      choices = {
        { text = "I fight so others don't have to. The Light knows it.", next = "BACK", reply = "It does, an' so do I, an' I'll bless ye for it every time ye pass this door. Go careful, an' come back on yer own two feet.", fx = { align = { light = 1 } } },
        { text = "I fight for my own reasons, Brother. Bless me anyway.", next = "BACK", reply = "Yer reasons are yer own, an' the Light blesses ye all the same. Kneel, then, an' I'll say the words.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisks on the shore, raptors on the road, an' the murlocs, though I'll no' call a murloc a beast in front o' one. The raptors are the worst, for they've cut the road east, an' the folk who need my prayers cannae reach me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crocolisks on the shore an' raptors on the road, an' the raptors are the worst. I'll bless {pet} while I'm at it, for it'll need the Light's favour more than most in this swamp." },
      },
      choices = {
        { text = "Every raptor I bring down opens the road a little.", next = "BACK", reply = "Every one helps, an' I'm grateful for it. I've no' seen a cart from Ironforge in a fortnight, an' the bread's gone hard.", fx = { align = { honor = 1 } } },
        { text = "I hunt for the sport of it, not for the road.", next = "BACK", reply = "Sport or no, the road's safer for it, so I'll no' scold ye. Just dinnae leave the carcasses where the sailors walk.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "There's the old graves o' Menethil, an' they're overgrown wi' bramble an' marsh grass. I'd have them tended, but I'd sooner the land did it gently than I did it wi' a scythe." } },
      choices = {
        { text = "Let the marsh keep the graves. It's natural.", next = "BACK", reply = "Aye, that's my thinkin' too, though it's hard tae watch the stones sink a little more every spring.", fx = { align = { order = -1 } } },
        { text = "Graves should be kept tidy and remembered.", next = "BACK", reply = "They should, aye, an' I'd tend them maself if I had the time. If ye've an hour tae spare wi' a scythe, the dead would thank ye.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Lightforge iron, which the murlocs stole, an' patience, which the sailors stole. I can get by wi'out the patience, but Bishop Farthing in Darkshire's waitin' on that iron, an' I'll no' let him down." } },
      choices = {
        { text = "I'll wade in and take back every bar, Brother.", next = "BACK", reply = "Bless ye, though mind the murlocs, for they're nastier in the water than they look. I'll write tae Bishop Farthing the moment it's back on my altar.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murlocs sleep sometime. I'll take it back quietly.", next = "BACK", reply = "Quietly, eh? I'll no' ask how, but I'll thank ye if the iron comes back. The murlocs willnae miss it, an' Farthing will be glad.", fx = { align = { honor = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    dd_gl_deaths = {
      lines = {
        { id = "dd_gl_deaths1", text = "The Light leaves a mark when it drags a soul back, the way a rope leaves a burn on yer hand. Most folk never notice it, but I've buried enough sailors in this harbour tae know the look, an' ye've got it worse than most." },
      },
      choices = {
        { text = "Then the Light must want me alive for something.", next = "BACK", reply = "Maybe it does. I'd try tae find out what before ye spend the rest o' yer chances.", fx = { align = { light = 1 } } },
        { text = "The Light had nothing to do with it. I just got up.", next = "BACK", reply = "Say it however ye like, {g:lad|lass}. I know who did the liftin', even if ye don't.", fx = { align = { light = -1 } } },
        { text = "Something else, Glorin.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, thank the Light! A pair o' strong arms that know what they're blessin', so sit, an' I'll tell ye what's wrong wi' this harbour." },
        { id = "h_default", text = "Glorin Steelbrow, o' the Church. I tend Menethil's souls, an' nobody mentioned the souls come wi' mud, murlocs an' drowned sailors." },
        { id = "h_eye", tags = { "news" }, when = { questActive = TODO_QUEST("The Eye of Paleth") },
          text = "What's that ye've brought out o' the wreck? Don't hand it here, just put it down, gently now, for there's somethin' foul sleepin' in it." },
        { id = "h_cleanse", when = { questActive = TODO_QUEST("Cleansing the Eye") },
          text = "That cursed Eye'll take more than my prayer to scrub clean, so carry it to Archbishop Benedictus in Stormwind." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.f_default" },
          text = "He told ye about the fleet, did he? Poor soul. I've tried to get him off the drink, an' he listens, nods, an' asks if the Light comes in a bottle." },
        { id = "h_doomed", tags = { "news" }, when = { questActive = TODO_QUEST("The Doomed Fleet") },
          text = "Bishop Farthing sent ye all the way from Darkshire? Hmph, he always did send me his hardest questions. Sit down; it's about the iron, I'll wager." },
        { id = "h_ingots", when = { questActive = TODO_QUEST("The Lost Ingots") },
          text = "Murlocs, it would be murlocs! They've no use for holy iron, an' they took every bar anyway." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Evenin' prayers, an' then the sailors come in wantin' blessings for the mornin' tide. I bless them, but I don't promise anything." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, it's you, thank the Light. Come in out o' the wet, an' if ye've a spare prayer in ye, I've a spare sailor." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! I could use a hand, though I'll confess I'm no' sure how a druid's hand works in the first place." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Grand; ye can carry the drowned up from the shore when the murlocs leave any, for my back's no' what it was." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? Mind ye take yer kills tae the butcher an' no' tae my chapel, for I've had enough o' the smell." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue in the Church's house. If ye're after the poor box, I'll save ye the trouble: it's been empty since the fleet went down." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can ye dry socks wi' that fire o' yours? I've no' had a dry pair since I came off the boat." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'll no' pretend it sits easy wi' me, but the marsh has more souls in it than one priest can tend, an' I'll take help from wherever it comes." },
        { id = "dd_deaths", when = { deaths = { min = 5 } },
          text = "The Light's brought ye back more than once; I can see it on ye, a bit thin round the edges. I'll no' lecture ye, but I'll pray for ye, an' ye cannae stop me." },
        { id = "dd_drown", when = { deathCause = "drowning" },
          text = "Ye drowned, didn't ye? I can always tell, for the ones the sea gave back have a look about them, as if they're still listenin' for the tide." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before the next soul comes in drippin'." },
        { id = "h_again2", text = "Aye? Go on, then, I'm listenin', mostly." },
      },
      choices = {
        { text = "How can you tell I've died, Glorin?", next = "dd_gl_deaths", when = { deaths = { min = 5 } } },
        { text = "How could a druid help you here?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Can I help?", next = "help" },
        { text = "You seem a grumpy sort, Brother.", next = "grumpy" },
        { text = "What do you know of the wrecks?", next = "wrecks" },
        { text = "Brother, let me take some of the load.", next = "priest", when = { class = "PRIEST" } },
        { text = "Bishop Farthing sent me about lightforge iron.", next = "lightforge", when = { questActive = TODO_QUEST("The Doomed Fleet") } },
        { text = "What is an Eye of Paleth, exactly?", next = "eye", when = { questDone = TODO_QUEST("The Eye of Paleth") } },
        { text = "You're watching me like I've brought something with me, Brother.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Do the warriors here keep the Church busy, Brother?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What beasts trouble Menethil most, Brother?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the Church here need most, Brother?", next = "xapala", when = { class = "PALADIN" } },
        { text = "There must be thieves among Menethil's poor, Brother.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the Church and Dalaran get on, Brother?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does it trouble you that I don't pray to the Light, Glorin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Light keep you.", next = "END" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "Aye, by not needin' anything. Failing that, keep the dead in the bay where they belong an' the living out of it." } },
      choices = {
        { text = "I mean it, Brother. What needs doing?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "wk_default", text = "The drowned wash up wi' the tide, the Captain's lads come down from the hills wi' holes in them, an' Fitzsimmons needs savin' from himself daily. Pick one." },
      },
      choices = {
        { text = "Tell me about Fitzsimmons.", next = "fitz" },
        { text = "I'll see to the wounded myself.", next = "BACK", reply = "Bless ye, that's the hardest of the three. They're in the back room, an' some o' them havenae slept in days.", fx = { affinity = 2, align = { light = 1 }, standing = { menethil = 1 } } },
        { text = "Fitzsimmons can save himself. I'm no nursemaid.", next = "BACK", reply = "No, an' neither am I, but the Light says I must be. Ye'd be surprised what a word does for a drunk.", fx = { align = { light = -1 } } },
      },
    },
    fitz = {
      lines = {
        { id = "fz_default", text = "Last man o' the Third Fleet, an' he's spent every year since tryin' to drown in a flagon. I've tried prayer, sermons an' hidin' the mead, but Helbrek keeps findin' it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    grumpy = {
      big = true,
      lines = {
        { id = "g2_default", text = "I'm no' grumpy, I'm busy. Grumpy's only what busy looks like from the outside; inside, it's mostly prayer an' wet socks." },
      },
      choices = {
        { text = "I'll pray your socks dry out, then.", next = "BACK", fx = { affinity = 2 } },
        { text = "Somebody ought to look after you, then.", next = "grumpy_self" },
      },
    },
    grumpy_self = {
      lines = {
        { id = "gs_default", text = "Nobody, an' I prefer it that way. The Light an' I have an understandin': it sends me work, I do it, an' neither of us complains... well, one of us complains." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "Everyone needs someone, Brother. Even you.", tag = "Persuade", next = "grumpy_letter",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "grumpy_socks", fx = { affinity = -1 } } },
      },
    },
    wrecks = {
      lines = {
        { id = "wr_default", text = "The Third Fleet, out o' Kul Tiras, burned off this coast by red dragons in the last great war. An elven ship sailed wi' them for safety, the Flying Osprey, an' it didnae help her either." },
      },
      choices = {
        { text = "What was the elven ship carrying?", next = "lightforge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge = {
      big = true,
      lines = {
        { id = "lf_default", text = "Lightforge iron, a metal that strikes wi' holy truth, as the old smiths put it. She sank south o' the harbour, an' I'm told the murlocs have been at her hold." },
      },
      choices = {
        { text = "It would take a rare smith to work such metal.", next = "lightforge_smith" },
        { text = "Iron like that belongs in a paladin's hands.", next = "BACK", reply = "Aye, that's where it belongs, an' it's where Farthing means tae send it. Bring it back, an' ye'll see it put tae good use.", when = { class = "PALADIN" }, fx = { affinity = 1, align = { light = 1 } } },
        { text = "Iron like that would fetch a fine price in Ironforge.", next = "BACK", reply = "A fine price, aye, an' a poor end for holy iron. Bring it back tae me, an' leave the merchants out o' it.", when = { class = "PALADIN" }, fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge_smith = {
      lines = {
        { id = "ls_default", text = "Grimand Elmore, in Stormwind's Dwarven District. He'll no' have touched the stuff in years. Bring him the iron an' a good story; he likes both." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eye = {
      big = true,
      lines = {
        { id = "ey_default", text = "Human priests made the Eyes long ago, to see clear an' shine bright. Sour one wi' sorrow an' ye get what came out o' that wreck, an' Archbishop Benedictus can clean it where I cannae." },
      },
      choices = {
        { text = "Why can't you?", next = "eye_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye_why = {
      lines = {
        { id = "ew_default", text = "Because their makin's no' mine. Dwarven prayer on human craft is like fixin' a gnome's clock wi' a hammer: ye'd get a result, but no' the right one." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pq_default", text = "Thank the Light, a colleague! Where did they train ye, then: Northshire, the Cathedral, or did ye learn it on the road like the rest of us?" },
      },
      choices = {
        { text = "Northshire Abbey.", next = "priest_abbey", fx = { learn = { "northshire_abbey" } } },
        { text = "The Cathedral, in Stormwind.", next = "priest_cathedral" },
        { text = "On the road, mostly.", next = "priest_road" },
      },
    },
    priest_abbey = {
      lines = {
        { id = "pa_default", text = "Northshire, eh? Then ye know how to sit still an' pray, which is good, but forget it now, for out here ye pray wi' wet feet an' one eye on the door." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_cathedral = {
      lines = {
        { id = "pc_default", text = "One o' Benedictus's lot, then, an' he's a good man. Give him my regards when ye next carry him somethin' cursed I couldnae fix." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_road = {
      lines = {
        { id = "pw_default", text = "The best school there is, an' the worst. Ye'll do, so take the next three blessings, would ye? They're for sailors, an' sailors always want three." },
      },
      choices = {
        { text = "Three blessings for the sailors, then, and gladly.", next = "BACK", reply = "Gladly, ye say? Then ye'll make a fine priest yet. Bless them loud, for sailors are half deaf from the cannon.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Sailors can make do with one blessing like everyone else.", next = "BACK", reply = "Like everyone else? Ye've no' met many sailors, then. One blessin' an' they come back askin' if it took.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grumpy_letter = {
      big = true,
      lines = {
        { id = "gl_default", text = "Hmph. Two winters back I wrote to Ironforge askin' to be posted home, to a proper chapel wi' a dry floor an' a choir that can hold a note. They said aye, an' I tore the letter up the same night." },
        { id = "gl_after", text = "Because who'd bury the Third Fleet when the tide brings it in, an' who'd sit wi' Fitzsimmons when the drink turns on him? Naebody, that's who. So I stayed, an' I grumble, an' the grumblin's the price o' stayin'." },
        { id = "gl_priest", when = { class = "PRIEST" }, text = "An' now there's you, askin' after me like a proper colleague. I'll no' say it twice, so listen: it's good to have ye here." },
      },
      choices = {
        { text = "Menethil's lucky you stayed, Brother.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'll take a share of the burying.", next = "BACK", fx = { affinity = 2, standing = { menethil = 1 } } },
      },
    },
    grumpy_socks = {
      lines = {
        { id = "gk_default", text = "I've the Light an' a dry pair o' socks for Sundays, an' that's all the company a priest in a marsh needs. Now, did ye want somethin' or no'?" },
        { id = "gk_default2", text = "Kind o' ye, I'm sure, but I'm no' one o' yer drowned sailors to be fussed over. Save it for them that need it." },
      },
      choices = {
        { text = "Then I'll leave you to your socks, Brother.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xwl_default", text = "Because ye have, an' I can smell it from here, like brimstone in a wet cellar. I'll not turn ye out o' the chapel, since the Light turns nobody out, but I'd like ye to leave whatever's followin' ye on the step." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "Because ye have, an' it's standin' right behind ye on my chapel floor, an' the whole room smells like brimstone in a wet cellar. I'll not turn ye out, since the Light turns nobody out, but I'd like ye tae walk that thing back tae the step an' leave it there." },
      },
      choices = {
        { text = "It stays outside, Brother. You have my word.", next = "BACK", reply = "Thank ye, an' I'll hold ye tae it. The Light turns nobody out, but it's easier on my nose.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It goes where I go. Your chapel will cope.", next = "BACK", reply = "It'll cope, an' so will I, but I'll be prayin' louder while it's here. Keep the beast off my altar cloth, at least.", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Does the Light really turn nobody out?", next = "xwarlock_light" },
      },
    },
    xwarlock_light = {
      lines = { { id = "xwlt_default", text = "Nobody who comes askin', an' that's the worst o' the job, worse than the smell. Come askin' some day, without the smell, an' we'll talk about it properly." },
        { id = "xwlt_demon", when = { pet = { type = "Demon" } }, text = "Nobody who comes askin', an' that's the worst o' the job, worse than the smell, an' the smell's very bad today. Come askin' some day wi'out yer {pet} lookin' over yer shoulder, an' we'll talk about it properly." },
      },
      choices = {
        { text = "Maybe someday.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The dyin' an' the drownin' tell me things, more than I'd like. Ask me about any o' this, an' be quick, for the tide's comin' in." },
    },
    third_fleet = { { id = "tp_fleet", text = "Out o' Kul Tiras, an' burned off this coast. I've buried more of it than I'd like.", next = "wrecks" } },
    grim_batol = { { id = "tp_grim_batol", text = "A dark place, by all accounts, an' I've never been nor wanted to." } },
    background = { { id = "tp_bg", text = "An Ironforge priest o' the Church, posted to a marsh. Somebody up the chain has a sense o' humour." } },
    advice = { { id = "tp_ad", text = "Keep yer socks dry an' yer soul drier. The marsh gets into both." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "I bury what the Captain's lads bring back, so ask him about the orcs an' ask me about the buryin'." } },
    northshire_abbey = { { id = "tp_abbey", text = "Good bells, good bread, an' novices who've never seen a murloc. Lucky them." } },
    _none = { { id = "tp_none", text = "Hmph. That's no' my problem, an' I've plenty o' my own." } },
    holy_light = { { id = "tp_holy_light", text = "The Light's no' just for humans, ye know; dwarves sang tae it in the Great Forge long before I came out here. I pray over every body the tide brings in, whatever they were." } },
    scourge = { { id = "tp_scourge", text = "I've seen bodies wash up from across the water that didnae stay still on the slab. I keep a hammer by the burial ground now, an' a prayer, an' I use both." } },
    lordaeron = { { id = "tp_lordaeron", text = "Menethil was Lordaeron's harbour once, an' it's still full o' folk who fled the plague wi' nothin' but the clothes on their backs. I hear their confessions, an' some o' them I'll carry tae my grave." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn writes tae every priest on this coast askin' for help in the plaguelands. I've sent two o' my acolytes, an' I pray for them every mornin'." } },
  },
}

P:NPC {
  key = "harlo", id = TODO_NPC("Harlo Barnaby"), name = "Harlo Barnaby",
  bible = "bibles/menethil.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "bitter" }, values = { "brave", "proud" },
  notices = { "body", "kin", "lock_stones" },

  impression = {
    first = "He is laid up by healer's orders and resents every hour.",
    third = "{name} met Harlo Barnaby, a wounded dwarf recovering in Menethil after the Dark Iron attack on Dun Modr.",
  },

  greetings = {
    { id = "g_bed", text = "Don't mind me, I'm no' gettin' up; healer's orders. My own orders are different, but she's got the bigger stick." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Any word from the north, any word at all?" },
  },

  notice = {
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "One o' our own, so ye'll understand. A dwarf without his hold is just a short man in the rain." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "Ye look like I felt. Here's my advice: don't ever take an axe in the back, an' face 'em, always." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That's a healthstone ye've got, green as the marsh, an' I'll confess I'd take a bite o' one right now if it'd get me out o' this bed. Don't tell the healer I said so, for she's already got the bigger stick." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Fire an' powder, an' the ground split an' spat flame, an' I swear it was screamin'. I ran, an' I'm no' proud o' it, an' every time I see someone talkin' tae the earth, I hear that scream again." } },
      choices = {
        { text = "Running isn't shameful, Harlo. You lived to fight again.", next = "BACK", reply = "Thank ye for that. I tell myself the same, but it's easier tae believe from someone else.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You ran. Don't make your fear my problem.", next = "BACK", reply = "Aye, ye're right, an' I'll no' burden ye wi' it again. But ye didnae see what I saw, so dinnae judge too quick.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They burned the gatehouse from the inside, for a start, an' the lads on the walls came down screamin'. Whatever ye call on, I hope ye call it on them, for I'd no' weep tae see a Dark Iron burn by his own trade." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They burned the gatehouse from the inside, for a start, an' the lads on the walls came down screamin'. Whatever that thing at yer heel is, I hope ye set it on them, for I'd no' weep tae see a Dark Iron run screamin' from the likes o' it." },
      },
      choices = {
        { text = "I'll beat them, Harlo, but not by their methods.", next = "BACK", reply = "Good, for their methods are what burned my lads. Beat them clean, an' ye'll be a better dwarf than any o' them.", fx = { align = { light = 1 } } },
        { text = "Then I'll turn their own fire back on them.", next = "BACK", reply = "Turn it back, aye, an' let them taste what they gave us. I'll no' ask how ye do it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Harlo.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Dark Irons came over the walls at night, an' we held as long as we could, but there were more o' them than us an' they had fire. I'd go back tomorrow if the healer'd let me, for there's dwarves still holdin' out up there wi' Longbraid." } },
      choices = {
        { text = "Heed the healer, Harlo. I'll go north in your place.", next = "BACK", reply = "Would ye? Bless ye, then, for the healer's right an' I hate it. Tell Longbraid that Harlo's comin' back the moment he can walk.", fx = { align = { order = 1 } } },
        { text = "Healers fuss too much. Go back if your legs will carry you.", next = "BACK", reply = "Ha! Ye sound like me, an' the healer would have a fit. I'll go as soon as I can stand wi'out fallin' over.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Barely, from what the lads tell me, for the raptors hunt the Algaz road an' the Dark Irons hold the Thandol Span. A hunter could get through where a column couldnae, an' I'm desperate tae hear how Longbraid's holdin'." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} could make that trip quicker than any of us, I'd wager, for it's got four good legs an' none o' them axed." },
      },
      choices = {
        { text = "I'll go north and bring you news, Harlo.", next = "BACK", reply = "Thank ye, an' ye'd have my undyin' gratitude. Any word o' the lads would ease my mind.", fx = { align = { honor = 1 } } },
        { text = "I'll go if someone pays. News comes cheap otherwise.", next = "BACK", reply = "If someone pays? Ye've a cold way o' puttin' it. I've a few coppers, an' ye can have them, if it means news.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "No, they watch ours, which is how I got this axe in mine. If ye go up tae Dun Modr, go quiet an' keep low, for they've lookouts on the walls an' they're better at the sneakin' than ye'd think." },
      },
      choices = {
        { text = "I'll face them openly, for your sake.", next = "BACK", reply = "Openly? Ye're braver than me, an' maybe more foolish. They'll see ye comin' a mile off, so be ready.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll give them back the knife they gave you.", next = "BACK", reply = "Aye, an' twist it for me while ye're at it. I'd give my good leg tae see their faces.", fx = { align = { honor = -1 } } },
        { text = "What happened before Dun Modr fell?", next = "span" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Aye, they do; I watched it come over the walls at Dun Modr. If ye've frost enough tae put out a Dark Iron, there's a dwarf in Menethil who'll be glad tae hear of it, an' that's me, once I can stand." },
      },
      choices = {
        { text = "I'll fight them for Dun Modr, not for revenge.", next = "BACK", reply = "For Dun Modr, aye, an' that's the better reason. I went up there for revenge maself, an' look where it left me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll make them pay for what they did to you.", next = "BACK", reply = "Would ye? Ye're kind tae say it, but I'd rather ye made them pay for the lads that didnae come home.", fx = { align = { light = -1 } } },
        { text = "Who's still holding out against them?", next = "longbraid" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, it's Longbraid an' a handful o' lads holdin' on, an' that's all, for the King's got the Dark Irons at his own door too. If there's a paladin goin' north, I'd count it a sign Ironforge hasnae forgotten us." } },
      choices = {
        { text = "Then I'll go north and bring them that sign.", next = "BACK", reply = "Then Ironforge hasnae forgotten us after all. Bless ye, an' tell Longbraid that Harlo's prayin' for ye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dun Modr's lost, Harlo. The living should fall back.", next = "BACK", reply = "Lost? Ye didnae see the lads still fightin' up there. Dun Modr's no' lost while Longbraid stands.", fx = { align = { honor = -1 } } },
        { text = "Something else, Harlo.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It might, if ye're quick about it before the healer sees, for she's jealous o' her patients. Mostly I want tae be on my feet an' on the road north, an' I'll take healin' from anyone who'll hurry it." } },
      choices = {
        { text = "Healing takes the time it takes. Rest, as she says.", next = "BACK", reply = "Aye, aye, I'll rest, though it's drivin' me mad. Maybe ye could sneak me in a pint while she's no' lookin'.", fx = { align = { order = 1 } } },
        { text = "If you're fit to walk, walk. Hang the healer's rules.", next = "BACK", reply = "That's the spirit! I like ye already, though the healer willnae. Help me up, would ye?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_ha_di = {
      lines = {
        { id = "dd_ha_di1", text = "Have ye? Then ye've seen their eyes, like coals in a dead forge. They came at Dun Modr in the dark wi' blastpowder on their backs, an' I've wanted a reckonin' ever since, so tell me straight: is it justice, or is it just killin'?" },
      },
      choices = {
        { text = "It's justice. Dun Modr deserved an answer.", next = "BACK", reply = "Aye. Aye, it did, an' I'll sleep a bit easier for hearin' somebody say it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's just killing, Harlo. I happen to be good at it.", next = "BACK", reply = "Honest, at least. I suppose the dead lads don't mind which it is, so long as it's done.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! If ye've the Light in ye, ye might take a look at my back, for the healers have given up on it an' I've no'." },
        { id = "h_default", key = true,
          text = "I'm Harlo Barnaby. I was at Dun Modr when the Dark Irons came, an' I took an axe in the back runnin'; I woke up here, an' that's the whole bad story." },
        { id = "h_fall", tags = { "news" }, when = { questActive = TODO_QUEST("Fall of Dun Modr") },
          text = "Go north to Dun Modr an' see what's left, an' who's left. If any o' my lot are still breathin', tell 'em Harlo's waitin'." },
        { id = "h_fall_done", when = { questDone = TODO_QUEST("Fall of Dun Modr") },
          text = "So it's as bad as I dreamed, or worse. Thank ye for lookin'; somebody had to, an' I couldn't." },
        { id = "h_grim", tags = { "news" }, when = { questDone = TODO_QUEST("A Grim Task") },
          text = "Balgaras the Foul is dead, the Dark Iron coward who never came out to fight? Then I'll sleep tonight, for the first time since the bridge." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I can't sleep on my front an' I can't sleep on my back, so I lie here an' count the Dark Irons I owe. It's a long count." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit an' tell me where ye've been, for I've been lyin' here so long I've forgot what a fight smells like." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye've been out on the roads, then, so tell me what ye've seen o' the north." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! The healer's tried every poultice she owns on my back, so if ye've some green trick she hasnae, I'll lie still for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The Dark Irons that took Dun Modr had fire-callers wi' them, so I'll be watchin' yer hands." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I was at Dun Modr when the Dark Irons came, an' I saw the ground split under us, so I'd sooner ye stood back a step, if it's all the same tae ye." },
        { id = "dd_banners", when = { questDone = TODO_QUEST("War Banners") },
          text = "Captain Stoutfist says ye tore down the Dragonmaw war banners in the hills. I'd have given a year's pay tae see it, though I've no' had pay since Dun Modr, so that's an easy offer." },
        { id = "dd_darkiron", when = { killed = { name = "Dark Iron", min = 30 } },
          text = "Ye've been killin' Dark Irons, I hear, an' plenty o' them. Good, for every one is a debt paid for the lads at Dun Modr who never woke up in a cot like I did." },
      },
      again = {
        { id = "h_again", text = "Ask away, for I'm no' goin' anywhere till this rain stops, an' it never stops." },
        { id = "h_again2", text = "What else? Talkin' keeps my mind off the back." },
      },
      choices = {
        { text = "I've killed my share of Dark Irons, Harlo.", next = "dd_ha_di", when = { killed = { name = "Dark Iron", min = 30 } } },
        { text = "Who took Dun Modr?", next = "who" },
        { text = "Who was your commander?", next = "longbraid" },
        { text = "That wound looks bad.", next = "wound" },
        { text = "Ironforge will retake the north.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Let me pray over that wound.", next = "priest", when = { class = "PRIEST" } },
        { text = "Longbraid's alive. He asked after you.", next = "alive", when = { questDone = TODO_QUEST("Fall of Dun Modr") } },
        { text = "Dark Irons don't watch their backs. I'd know.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Dark Irons have fire magic. I've something colder.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What happened at Dun Modr, Harlo?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The roads north can't be running any more, Harlo.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did Ironforge send anyone to retake Dun Modr, Harlo?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a druid's healing mend what the poultices haven't?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What did the Dark Iron fire-callers do at Dun Modr?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What did you see at Dun Modr, Harlo?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rest easy.", next = "END", fx = { affinity = 1 } },
      },
    },
    who = {
      big = true,
      lines = {
        { id = "w_default", text = "Dark Irons, out o' the mountains. Fire an' black steel an' no mercy in 'em at all. They didnae want the fort. They wanted the road through it." },
      },
      choices = {
        { text = "I'll go north.", next = "BUSINESS", fx = { affinity = 2, learn = { "dark_iron" } } },
        { text = "Why the road?", next = "road", fx = { learn = { "dark_iron" } } },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Aye, that's the question. When I can stand, I'll ask one of 'em, politely, wi' an axe." } },
      choices = {
        { text = "Was it only the fort they hit?", next = "span" },
        { text = "Something else.", next = "BACK" },
      },
    },
    span = {
      lines = {
        { id = "sp_default", text = "The Thandol Span first. They brought down the west bridge wi' good dwarves on it. We pulled into Dun Modr, an' they were on us before we'd counted the dead." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then they'll pay for the bridge too.", next = "BACK", reply = "They will, every stone o' it, an' I'll be there tae see it if this leg ever heals.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bringing down that bridge was clever, I'll grant them.", next = "BACK", reply = "Clever? Aye, clever like a snake's bite. I'll no' grant them anything, no' after what they did.", fx = { align = { honor = -1 } } },
      },
    },
    longbraid = {
      lines = {
        { id = "lb_default", text = "Longbraid the Grim. He sounded the retreat horn, an' it was the last thing I heard before the axe. They put me on the only horse left, I'm told, though I don't remember it." },
      },
      choices = {
        { text = "He may well have lived.", next = "longbraid_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longbraid_hope = {
      lines = {
        { id = "lh_default", text = "If any dwarf could, he could. Grim's no' a name, it's a description. Go an' look, would ye? I'd go myself if I could stand." },
      },
      choices = {
        { text = "I'll find him.", next = "BUSINESS", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wound = {
      lines = {
        { id = "wd_default", text = "A stray axe, right between the shoulders. The healer says I'll walk, but she says it the way ye'd say the weather'll clear." },
      },
      choices = {
        { text = "You will walk.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Face them, always. I heard you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Aye, when the lads come home from the Alliance's wars an' see what happened while they were gone. Tell them so in Ironforge, an' tell them loud." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", reply = "Thank ye. Tell them Harlo sent ye, an' that Dun Modr's still waitin'.", fx = { affinity = 2, align = { order = 1 }, standing = { menethil = 1 } } },
        { text = "Ironforge has enough to hear about. Hold the line yourselves.", next = "BACK", reply = "Aye, an' we will, but it'd be nice tae know someone remembers. Hard words, those, an' I cannae say they're wrong.", fx = { align = { order = -1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Brother Glorin's prayed over it twice an' grumbled over it ten times, so go on, then... oh, that's warm, that's very warm. Thank ye." },
      },
      choices = {
        { text = "Rest, Harlo. It'll mend.", next = "BACK", reply = "I will, if Glorin lets me, though he'll grumble about it whether I do or no'. Thank ye again, from the bottom o' my heart.", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Keep your thanks. I did it to pass the time.", next = "BACK", reply = "Pass the time, eh? Then ye pass it better than most, an' I'll thank ye whether ye like it or no'.", fx = { align = { light = -1 } } },
      },
    },
    alive = {
      big = true,
      lines = {
        { id = "al_default", text = "He's alive! Then the regiment's alive, whatever's left of it. Tell him I'll be on my feet before he's done bein' grim about it." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 3, standing = { menethil = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I cannae stand, but I can still listen, an' folk talk freely around a man in a bed. Ask me about any o' this." },
    },
    thandol_span = { { id = "tp_span", text = "That's where it all started, an' I'll tell ye about it, if ye've the stomach for it.", next = "span" } },
    background = { { id = "tp_bg", text = "I served in Longbraid's regiment at Dun Modr. I'm a soldier an' I'll be one again, an' that's the whole of it.", next = "longbraid" } },
    advice = { { id = "tp_ad", text = "Watch the bridges up north. They're no' as solid as they look anymore." } },
    dark_iron = { { id = "tp_dark_iron", text = "They put me in this bed. I'll put a few o' them in worse. That's a promise, no' a threat." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The orcs are Captain Stoutfist's problem; mine's up north. Everyone's got a problem in the Wetlands." } },
    _none = { { id = "tp_none", text = "Ask someone who can walk." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol's a cursed place, an' every dwarf in Longbraid's regiment knows it. We'd sooner fight Dark Irons at Dun Modr than walk under that mountain." } },
    magni = { { id = "tp_magni", text = "King Magni'll have the Span back, mark me, an' I'll be standin' on it when he does. I cannae stand yet, but I will." } },
    wildhammer = { { id = "tp_wildhammer", text = "A Wildhammer gryphon rider pulled me off the Span when it fell, an' I never got his name. I'd stand him a barrel if I knew it." } },
  },
}

P:NPC {
  key = "karl", id = TODO_NPC("Karl Boran"), name = "Karl Boran",
  bible = "bibles/menethil.md", role = "worker", tier = "quest",
  communities = { "menethil" }, temper = { "steady" }, values = { "hardworking", "practical" },
  notices = { "kit", "lock_stones" },

  impression = {
    first = "He warned me before I tripped, and I liked him for it.",
    third = "{name} met Karl Boran, a merchant sailor who keeps cargo moving through the docks of Menethil Harbor.",
  },

  greetings = {
    { id = "g_dock", text = "Careful of the ropes, and the nets, and the crates... actually, just stand still a moment, would you?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are. The work never stops, but the company's better." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough out there? Course it is, so get yourself patched up and get back to it, because that's how we do things here." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone in your bag? I've handled crates marked for nobody in particular that ran warm like that, and I learned to keep them well away from the powder. Mind the ropes on your way past, for the tar burns easily." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In a heartbeat, if I thought the marsh could be reasoned with. The crates I lose go to rot or to raptors, and I've no answer for either. If your spirits can keep the damp out of the grain, I'll pay a shaman more than I pay my guards, and that'd make my guards very cross." } },
      choices = {
        { text = "The spirits aren't for hire, Karl. I'll help for nothing.", next = "BACK", reply = "Nothing? Then you're the first thing in this town that's come free, friend, and I'll not forget it when the next ship's in.", fx = { align = { honor = 1 } } },
        { text = "Pay me well, and I'll keep the damp out.", next = "BACK", reply = "That's honest, at least, and I'd pay if I thought it would work. Show me a dry crate at the end of the month and we'll talk numbers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Now and then a crate comes in from Stormwind marked for nobody in particular, aye. I don't open them and I don't ask, because a merchant marine who asks questions doesn't last long in the trade, but I do write down who collects them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Now and then a crate comes in from Stormwind marked for nobody in particular, aye, and your demon has gone straight to the one in the corner, which I'd rather it didn't. I don't open them and I don't ask, because a merchant marine who asks questions doesn't last long, but I do write down who collects them, and what they bring along." },
      },
      choices = {
        { text = "Good. Someone should keep a record of who buys what.", next = "BACK", reply = "Somebody should, and it's me, though I'd never admit it to the men who send those crates. I could tell you who bought rope in this harbour three winters back, and what for.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn that ledger, Karl. Some trade's best forgotten.", next = "BACK", reply = "Burn it? That ledger's the only thing keeping me out of trouble when the Stormwind men come asking. It stays, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else, Karl.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every other night, and they're not after the cargo so much as anything that smells of fish, which in Menethil is everything. Stand on my dock for an hour after dark and you'll see why I keep a cudgel by the ledgers." } },
      choices = {
        { text = "I'll stand a night watch on your docks.", next = "BACK", reply = "Would you? Then the night men will think twice, and so will the gulls. There's a lantern by the bollard, and a stool if you're lucky.", fx = { align = { order = 1 } } },
        { text = "I'll hunt them in the marsh before they come.", next = "BACK", reply = "Hunt them where? They come out of the water, friend, not the marsh, but if you can find where they nest I'll not say no.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisk hide, mostly, and the odd raptor skin when somebody's brave enough to go east. The skins sell well in Ironforge and Stormwind both, so a careful hunter can make a living off this swamp, if the swamp doesn't make a meal of him first." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crocolisk hide, mostly, and the odd raptor skin. Keep {pet} off the cargo, mind, for I had a wolf sit on a crate of eggs last month and I'm still explaining it to the buyer." },
      },
      choices = {
        { text = "I'll take only what the harbour needs.", next = "BACK", reply = "That's a decent way to work, and there's plenty of hunters who'd not bother. Bring what you've got and I'll ship it fair.", fx = { align = { honor = 1 } } },
        { text = "I'll take every hide I can sell.", next = "BACK", reply = "Every hide? Then you'd strip the marsh bare in a season, and I'd have nothing to ship next year. Take what you need, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Goes missing? It walks off the quay on its own, and half of it ends up in some smuggler's hold bound for Booty Bay. If you'd watch the docks of a night and tell me who's carrying what, I'd sleep a good deal better." },
      },
      choices = {
        { text = "I'll watch, and I'll name every thief I see.", next = "BACK", reply = "Name them all, and I'll write every one in my book. The harbour watch never sees a thing after dark.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll watch. Whether I tell you depends who's paying.", next = "BACK", reply = "Spoken like a smuggler, friend, and I've met enough of them to know. I'll pay you fair, but I'll not be outbid.", fx = { align = { honor = -1 } } },
        { text = "Where do the ships run to?", next = "ships" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Dry! You'd be the first in Menethil to manage it. If you could put a ward on a hold that keeps out the rain and the rot, you'd be rich by the end of the season, though I don't suppose the Kirin Tor stoop to grain sacks." },
      },
      choices = {
        { text = "Magic is for the war, not for grain sacks.", next = "BACK", reply = "That's what Dalaran says too, and I'll grant there's a war on. But I've thrown out more grain to the damp this year than the Dragonmaw ever stole.", fx = { align = { order = 1 } } },
        { text = "Magic should serve ordinary folk, cargo and all.", next = "BACK", reply = "Now there's a mage I'd buy a drink for! Come to the warehouse and look at my holds, if you've a spell for damp.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "How do you keep the harbour going?", next = "manage" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They're breeding in numbers I've never seen, and they've taken two of my carters on the east road this month. I'd sooner thin them than lose the whole road." } },
      choices = {
        { text = "Thin them, then. Your carters need protecting.", next = "BACK", reply = "Aye, an' I'll thank ye for it. The carters go out wi' a cudgel an' a prayer, an' the raptors have learned the prayers don't work.", fx = { align = { order = 1 } } },
        { text = "The raptors hunt to live. Guard your carters better.", next = "BACK", reply = "Guard it better? Wi' what, a stick an' a prayer? Ye've never kept sheep in a marsh full o' teeth, I can tell.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every boat from Auberdine has one or two, and the wrecks out in the bay had a good many more who never made it ashore at all. I send the living up to Brother Glorin, and the others I try not to think about." } },
      choices = {
        { text = "Send them to me as well. I'll help Glorin.", next = "BACK", reply = "Glorin will be glad of you, and the poor souls will be too. He's run off his feet, and the boats keep coming.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sick men on a dock are bad for trade, Karl.", next = "BACK", reply = "Bad for trade, aye, but I'd not leave a man coughing on the quay for the sake of a sale. You'd have him tossed in the bay, would you?", fx = { align = { light = -1 } } },
        { text = "Something else, Karl.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The garrison, when the Captain can spare them, which isn't often with the Dragonmaw in Algaz. Most days it's me, a lantern and a lot of shouting, and the shouting keeps the murlocs off better than the lantern does." } },
      choices = {
        { text = "The Alliance's supply lines must hold. I'll help guard them.", next = "BACK", reply = "That's what the Alliance needs, and what I need too. The crates for Ironforge go out at dawn, if you're up early.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the merchants guard their own crates, Karl.", next = "BACK", reply = "Then you'd see the crates go missing by morning, and the garrison starving by week's end. Somebody has to care, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, Karl.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Ships come in with sick men aboard more often than the harbourmaster likes to admit, so I'm glad to see one of you on the docks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Murlocs and marsh don't care about holy hammers, but my dockhands might, so stand where they can see you." },
        { id = "h_default", text = "Karl Boran, merchant marine. I keep cargo moving through this harbour, which is harder than it sounds with half the marsh trying to eat it." },
        { id = "h_crabs", when = { questActive = TODO_QUEST("Claws from the Deep") },
          text = "Claws, aye, from the deep water. Bring me what I asked for, and mind your fingers, since they're the only ten you get." },
        { id = "h_goods", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming Goods") },
          text = "Those are goods that were ours and aren't anymore, so bring back whatever you can carry. I'll take dented over gone." },
        { id = "h_statuette", when = { questActive = TODO_QUEST("Return the Statuette") },
          text = "That little carving was in one of the crates? Then it belongs to someone, so get it home. That's the job, every time: get it home." },
        { id = "h_statuette_done", when = { questDone = TODO_QUEST("Return the Statuette") },
          text = "The Blind Princess's captain near wept over that statuette. Captain Stoutfist says a thing like that shouldn't sit where the Dragonmaw can see it. He's not wrong." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Last boat's in, so I count the crates by lantern, and then I count them again, because the lantern lies." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Ye'll know the raptors o' the Wetlands better than most, I'd think, an' I'd ask ye what ye make o' them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? Good, for I lose crates to the murlocs and to the marsh both, and you can only fight one of those." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've crates of shot going out to Ironforge, and I'm told the dwarven hunters can't get enough of it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Stand off the crates, if you don't mind; I had a load of Ironforge powder go up once, and I've no wish to find out what your sort does to it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, here in Menethil! You wouldn't be able to keep the marsh from eating my cargo, would you? I'd pay for the service." },
        { id = "dd_crocskins", when = { questDone = TODO_QUEST("Young Crocolisk Skins") },
          text = "Halloran tells me you've been keeping him in crocolisk hides. I ship those skins east, so your work's sitting in a crate on my dock right now." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've crates waiting, but they'll wait." },
        { id = "h_again2", text = "Go on, talk while I stack." },
      },
      choices = {
        { text = "What troubles you about the raptors?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You seem to manage well enough out here.", next = "manage" },
        { text = "Something seems wrong on the coast.", next = "coast" },
        { text = "Where do the ships go from here?", next = "ships" },
        { text = "I came over on the Auberdine boat.", next = "nightelf", when = { race = "NightElf" } },
        { text = "Cargo goes missing in a harbour like this. I could see it doesn't.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Couldn't a mage keep your cargo dry?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd guess the murlocs raid the docks, Karl.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do Menethil's hunters ship out, Karl?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the ships bring in many sick or wounded, Karl?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who protects the cargo bound for Ironforge, Karl?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does anything for my trade come through your docks, Karl?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you hire a shaman to guard your cargo, Karl?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the cargo.", next = "END" },
      },
    },
    manage = {
      big = true,
      lines = {
        { id = "m_default", text = "Times are lean, and you don't fix lean by moaning. You pick up the next crate, and then the one after that, and one day you look up and the dock's clear." },
      },
      choices = {
        { text = "That's a good way to live.", next = "BACK", fx = { affinity = 2 } },
        { text = "And if the dock never clears?", next = "never" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Then you'll have moved a great many crates. There are worse ways to spend a life." } },
      choices = {
        { text = "Times seem lean in Menethil.", next = "lean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lean = {
      lines = {
        { id = "le_default", text = "The Dragonmaw sit on Dun Algaz, so nothing comes up from Loch Modan by road. It all comes by sea now, and the sea has murlocs in it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
    coast = {
      lines = {
        { id = "co_default", text = "Bluegill murlocs, building huts along the shore and raiding anything that floats too close. Not long ago they hit the Blind Princess and dragged half her cargo over the side." },
      },
      choices = {
        { text = "What did they take?", next = "statuette" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statuette = {
      lines = {
        { id = "st_default", text = "Crates, barrels, and one silver statuette of King Terenas, young, as a paladin with his hammer raised. Some say it's worth more than the ship and her crew together, and sadly the crew agree. The murlocs only want it because it shines." },
      },
      choices = {
        { text = "I'll find it.", next = "BUSINESS", fx = { affinity = 2, standing = { menethil = 1 } } },
        { text = "Terenas was my king.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then I'm sorry, and I'll see it gets where it should. Not much comes out of Lordaeron anymore, and every piece of it belongs to somebody." },
      },
      choices = { { text = "Thank you, Karl.", next = "BACK", fx = { affinity = 3 } } },
    },
    ships = {
      lines = {
        { id = "sh_default", text = "Theramore and Auberdine, across the sea. And every payday the Kul Tiras marines come the other way from Theramore, looking for a good time." },
      },
      choices = {
        { text = "The marines look a rough lot.", next = "ships_marines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_marines = {
      lines = {
        { id = "sm_default", text = "Loud, thirsty and paid, the lot of them: they drink, they sing, and they pay. Mikhail the barkeep watches them like a hawk, though I've never asked him why." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nightelf = {
      lines = {
        { id = "ne_default", text = "Then you've had the crossing. Your folk always come off that boat looking up, as if the sky's lower here, and I think it is; it's the rain." },
      },
      choices = {
        { text = "It is lower. And a good deal wetter.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every crate through this harbour comes with a bit of news packed in the straw. Ask me about any of this." },
    },
    third_fleet = { { id = "tp_fleet", text = "Every captain steers wide of those wrecks, and nobody needs telling twice." } },
    background = { { id = "tp_bg", text = "Merchant marine. I go where the cargo goes, and lately the cargo comes here." } },
    advice = { { id = "tp_ad", text = "Count your crates twice and your fingers three times. This coast takes both." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "They've cut the road east, so everything goes by sea now, which is good for me and bad for everyone else." } },
    _none = { { id = "tp_none", text = "Can't say. I only know what's in the crates, and not always that." } },
    theramore = { { id = "tp_theramore", text = "Most of my cargo goes to Theramore these days: grain, nails, lamp oil and powder. Lady Jaina's building a city on a marsh, and marshes eat supplies." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay pays the best rates on the seas, but the harbourmaster takes a cut and so do the sharks. I'd sail there more if the Bloodsails didn't." } },
    lordaeron = { { id = "tp_lordaeron", text = "Before the plague, half the cargo out of this harbour went north to Lordaeron. Now nothing goes north, and the boats that tried it never came back." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblin cartel insures most of the ships in these waters, and they charge for it as if the sea were their own property. I pay, because the sea does as it likes." } },
  },
}

P:NPC {
  key = "helbrek", id = TODO_NPC("Innkeeper Helbrek"), name = "Innkeeper Helbrek",
  bible = "bibles/menethil.md", role = "innkeeper", tier = "service",
  communities = { "menethil" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink", "lock_pact" },

  impression = {
    first = "He makes soaked strangers feel like regulars.",
    third = "{name} came in out of the rain at the Deepwater Tavern, kept by Innkeeper Helbrek of Menethil Harbor.",
  },

  greetings = {
    { id = "o_jaina_traitor", tags = { "news" }, when = { gossip = { topic = "jaina", stance = "traitor" } },
      text = "Careful what ye say about Lady Proudmoore in here; the Theramore sailors heard ye called her a turncoat, an' they've been glarin' at yer stool all week." },
    { id = "o_dragonmaw_march", tags = { "news" }, when = { gossip = { topic = "wl_dragonmaw", stance = "march" } },
      text = "Valstag Ironjaw's been tellin' the bar ye'd march straight up tae Grim Batol. The lads drank tae ye, an' then they drank tae yer funeral, just in case." },
    { id = "g_tavern", text = "In ye come, out o' the wet! The Deepwater's dry, warm, an' only leaks over the bar, which is where ye want it." },
    { id = "g_home", when = { homeInn = { "Menethil Harbor", "Deepwater Tavern" } }, text = "Hang yer cloak by the fire an' it'll steam like a kettle; they all do." },
    { id = "g_away", when = { away = 14 }, text = "In ye come after {away} away, an' soaked as ever by the look o' ye! Hang that cloak by the fire an' have a drink." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, ye've been gone {away}, an' I'd half reckoned the bog had swallowed ye! Sit down an' let the Deepwater dry ye out proper." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody's been tellin' the whole tavern what a fine sort ye are! That's worth a seat by the fire, an' the dry end o' the bar." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word over the bar is ye sold somebody in the harbor a tale that wasnae true. Sailors spin plenty o' those in here, mind, but they're mostly harmless." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've been wrestlin' the marsh an' the marsh won, by the look of ye. Sit down an' have some stew, an' no arguments." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy now. Ye're startin' to sound like Fitzsimmons, an' one o' him is plenty." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Ye're givin' off heat like a hearth, friend, an' it's no' the stew, for I've seen that flush on a warlock's friends before. That's an imp's pact sittin' in yer blood, an' I'd keep the window open tonight." },
  },

  start = "hello",
  nodes = {
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Aye, turn round, but you won't, so I'll say this instead: the Dragonmaw keep red drakes up there, and a company of five looks like a meal to a drake, not a threat. Stay low and stay in the trees, and come back here to dry out, because I'll want the story." } },
      choices = {
        { text = "We'll go carefully, as you say, and keep to the trees.", next = "BACK", reply = "That's all I ask, an' there'll be a seat by the fire when ye come back down. Mind the treeline, for the raptors are thicker in it than they look.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We'll meet the drakes head on. Five of us is plenty.", next = "BACK", reply = "Five o' ye, is it? Then I'll set five places for supper an' hope I've no' wasted the bread. Off ye go, an' good luck.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "About everythin'. The sailors want ye tae bless their boats, the soldiers want ye tae curse the orcs, an' the diggers want tae know if the earth's angry at them for diggin'. I tell them all tae buy a drink first, an' most o' them forget what they were askin'." } },
      choices = {
        { text = "I'll answer their questions straight, Helbrek.", next = "BACK", reply = "Good, they'll thank ye for it, though they might no' like the answers. Them diggers are touchy about the earth, so dinnae call it mud in front o' them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell them whatever keeps them buying drinks.", next = "BACK", reply = "Ha! Ye'd make a fine innkeeper. Just dinnae tell them the earth's angry, or I'll have diggers drinkin' till dawn an' payin' nothin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now an' again, on their way tae the boat for Theramore, for Lady Proudmoore draws Dalaran's folk like a lamp draws moths. They pay well an' they read at the table, which suits me, though one set the curtains alight an' called it an accident." } },
      choices = {
        { text = "Careless. A mage should mind their fire indoors.", next = "BACK", reply = "Careless, aye, an' expensive. I'll no' say no tae a mage's coin, but they'll sit by the window from now on.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Accidents happen, Helbrek. Curtains are cheap enough.", next = "BACK", reply = "Cheap? Ye've no' bought curtains in Menethil, then. Everythin' comes off a boat an' costs twice what it should.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Captain Stoutfist's lot, when they're off the wall, an' they drink like men who'll be back on it in six hours, which they will. They pay in coin an' stories, an' the stories lately are all about the Dragonmaw." } },
      choices = {
        { text = "I'll keep it to one, and save the rest for after.", next = "BACK", reply = "Sensible, an' rarer than ye'd think. The Captain will thank ye, an' so will yer head in the mornin'.", fx = { align = { order = 1 } } },
        { text = "Six hours is plenty of time. Pour me another.", next = "BACK", reply = "Plenty o' time, aye, an' plenty o' trouble if ye're no' careful. One more, then, an' no' a drop after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Often enough, an' they come in wet an' leave mud on my floor an' talk all night about raptors. I don't mind, for they bring in crocolisk tails, an' a crocolisk tail in the stew is the best thing this harbour has." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Often enough, an' they bring in crocolisk tails for the stew. {pet} can sleep by the fire, so long as it doesnae eat the regulars." },
      },
      choices = {
        { text = "I'll bring you a fresh tail for the stew.", next = "BACK", reply = "A fresh tail, an' I'll have the stew on by sundown. Ye'll get the first bowl for it, an' that's no' nothin'.", fx = { align = { honor = 1 } } },
        { text = "I'll sell you a tail, if the price is right.", next = "BACK", reply = "A price, eh? Bring it in, an' we'll haggle. I've been doin' it longer than ye've been huntin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Aye, an' the other half would break yer fingers for tryin'. Sailors drink here, an' sailors know every trick in every port, so if ye're after purses, try somewhere they can't swim after ye." },
      },
      choices = {
        { text = "I wasn't planning to. Just observing.", next = "BACK", reply = "Observin', is it? Then observe somewhere else, friend. Half the sailors in here lost a ship tae someone who was only observin'.", fx = { align = { honor = 1 } } },
        { text = "Noted. I'll do my work elsewhere.", next = "BACK", reply = "Good, an' I'll no' ask where. My customers' purses are safe under this roof, an' I'd like it tae stay that way.", fx = { align = { honor = -1 } } },
        { text = "Who are your regulars?", next = "regulars" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Sturdy lock, is it? I had one o' your sort in the end room last winter, an' I spent a week scrubbin' the smell o' sulphur out o' the boards. Ye can have the room, but if I find scorch marks, I'll want them gone before ye leave." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "Sturdy lock, is it? I had one o' your sort in the end room last winter, an' that's the same sulphur comin' off yer demon now that I spent a week scrubbin' out o' the boards. Ye can have the room, but that thing stays off the bed, an' if I find scorch marks, I'll want them gone before ye leave." },
      },
      choices = {
        { text = "You'll find nothing, Helbrek. I keep a clean room.", next = "BACK", reply = "I'll hold ye tae that, an' I'll be checkin'. A clean room's all I ask, an' no' too much sulphur.", fx = { align = { light = 1 } } },
        { text = "Scorch marks are part of the work.", next = "BACK", reply = "Part o' yer work, maybe, but no' part o' my floorboards. Ye'll pay for the scrubbin' if I find any.", fx = { align = { light = -1 } } },
        { text = "Any news from the road?", next = "news" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Now an' again, aye, off the boats from Auberdine. Most o' them don't stay long, for the Wetlands smell a fair bit worse than Darkshore." } },
      choices = {
        { text = "The marsh has its own beauty, friend.", next = "BACK", reply = "Beauty? Aye, if ye like frogs an' fog. I'll grant ye the sunset over the bay's somethin' tae see.", fx = { align = { light = 1 } } },
        { text = "I won't argue that. It's a sodden place.", next = "BACK", reply = "Sodden's the word, friend, an' my socks have been wet since I bought this place. Sit by the fire an' dry out.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Me, mostly, an' Brother Glorin when the first mate lets him, which isnae often. The man drinks tae drown his crew, an' I've no' the heart tae tell him it doesnae work." } },
      choices = {
        { text = "Then I'll sit with him. He shouldn't grieve alone.", next = "BACK", reply = "Bless ye, he could use the company, though he'll no' say so. He's at the end o' the bar most nights.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He chose the bottle, Helbrek. That's his own affair.", next = "BACK", reply = "His affair, aye, but it's my bar he does it in. I cannae just watch a man drown on dry land.", fx = { align = { light = -1 } } },
        { text = "Something else, Helbrek.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only on payday, an' only the sailors, if I'm fair about it. The garrison lads drink quiet an' leave early, for the Captain has them on the walls before dawn." } },
      choices = {
        { text = "Good. A soldier keeps discipline, even off duty.", next = "BACK", reply = "Aye, an' the Captain sees tae it. I've never had a soldier start a brawl in here, an' I'm grateful for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them carouse. They might not see another payday.", next = "BACK", reply = "Carouse all they like, so long as they pay an' dinnae break the chairs. I'll no' grudge them a good night.", fx = { align = { order = -1 } } },
        { text = "Something else, Helbrek.", next = "BACK" },
      },
    },
    dd_hb_nek = {
      lines = {
        { id = "dd_hb_nek1", text = "Singin', drinkin' an' breakin' my stools. The Dragonmaw have sat on the road north since the war ended, an' this is the first good news Menethil's had from that way in a long while, so I'll put up wi' the stools. What was he like, the orc?" },
      },
      choices = {
        { text = "Big, angry and slow. He died like any other orc.", next = "BACK", reply = "Ha! That's the verse they're missin'. I'll pass it along, an' they'll sing it worse.", fx = { align = { light = -1 } } },
        { text = "He fought for his clan. I'll grant him that.", next = "BACK", reply = "Fair words for an enemy. Don't say them too loud in here, mind, for the lads lost friends tae that clan.", fx = { align = { light = 1 } } },
        { text = "Something else, Helbrek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Five of you, all dripping on my floor at once, which is the Wetlands way of saying hello. Sit by the fire and wring out your boots, and tell me where you're bound." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Bless the stew if ye like, but it's been blessed by the cook already, an' that's mostly salt." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Deepwater! Mind yer hammer on the beams, for they're older than me an' about as steady." },
        { id = "h_default", text = "Helbrek, an' I keep the Deepwater for sailors, soldiers, diggers, an' one first mate who's been sittin' outside my door since before I owned it." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.h_default" },
          text = "Fitz told ye who he was? Aye, he's told everyone. I keep his mead in the cellar, for someone has to, an' better me than the bay." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well, an elf from the sky, in the wettest place on Azeroth! Ye'll miss yer clouds... no, ye won't, come to think of it, for we've plenty here." },
        { id = "h_mate", when = { metBefore = true }, text = "The first mate asked for his usual again, an' I didnae ask what it was, since neither of us remembers anymore. I just pour." },
        { id = "h_smuggler", when = { origin = "dwarf_loch_smuggler" },
          text = "Well, if it isnae the Loch road's least honest carter! Some o' the casks in my cellar came down that road in yer cart, I'd wager, an' I never asked where the tax stamps went, so dinnae tell me now." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Rain on the roof an' sailors singin' badly: that's Menethil at night, an' I wouldnae trade it, most nights." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Ye'll have come in out o' the rain, I'd hope, an' no' just wandered in as a bear lookin' for the pantry." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit near the door, if ye don't mind, for when the Dragonmaw news comes in, it comes in loud." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll want a room near the back, then, for I've learned that beasts don't care for the noise o' the bar." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could ye warm the hearth a bit? The damp gets in the logs, an' the sailors complain the fire's sulkin'." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman at the Deepwater! Ye'll fit right in, for my regulars are sailors, soldiers an' diggers, an' every one o' them's more superstitious than ye." },
        { id = "dd_goods", when = { questDone = TODO_QUEST("Reclaiming Goods") },
          text = "Karl Boran's been crowin' in my common room that ye pulled his crates back out o' the murlocs' hands. He bought a round on the strength of it, an' Karl never buys a round." },
        { id = "dd_nekrosh", tags = { "news" }, when = { questDone = TODO_QUEST("Defeat Nek'rosh") },
          text = "They're sayin' up at the keep that Nek'rosh is dead an' that it was you who did it. I've had soldiers singin' about it under my roof all week, so badly that the gulls left." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The stew's no' goin' anywhere, an' neither am I." },
        { id = "h_again2", text = "Aye? Pull up a chair while ye think." },
      },
      choices = {
        { text = "The soldiers are singing about Nek'rosh?", next = "dd_hb_nek", when = { questDone = TODO_QUEST("Defeat Nek'rosh") } },
        { text = "Do druids often come through Menethil?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "You seem to have a few regulars here.", next = "regulars" },
        { text = "My family brews too, back home.", next = "brewer", when = { origin = "dwarf_brewer" } },
        { text = "Half your regulars would make easy marks.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll need a room with a sturdy lock.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Plenty of soldiers must drink at the Deepwater, Helbrek.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters stay at the Deepwater often, Helbrek?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who looks after Fitzsimmons when he's had too much, Helbrek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The soldiers must bring trouble into the Deepwater, Helbrek.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do mages ever stay at the Deepwater, Helbrek?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are your regulars superstitious about shamans, Helbrek?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "We're bound for the hills below Grim Batol. Any advice?", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "Did you ever wonder where my casks came from, Helbrek?", next = "xorig_smug", when = { origin = "dwarf_loch_smuggler" } },
        { text = "Just drying off.", next = "END" },
      },
    },
    xorig_smug = {
      lines = {
        { id = "xos_default", text = "Every time, an' every time I decided I'd rather no' know, for a tavern at the end o' a long wet road takes its ale where it can get it. The Mountaineers came askin' after ye once, mind, an' I told them I'd never seen a dwarf in my life." },
      },
      choices = {
        { text = "Thank you for that. I owe you.", next = "xorig_smug2", fx = { affinity = 2 } },
        { text = "They learned my face anyway. That's why I stopped.", next = "xorig_smug2", fx = { trait = { cautious = 1 } } },
      },
    },
    xorig_smug2 = {
      lines = {
        { id = "xos2_default", text = "Aye, they've long memories, the Mountaineers, an' longer beards. The road's darker than it was, too, wi' the Dragonmaw out on it, so whatever ye carry these days, I'm glad it's no' casks through the marsh at midnight." },
      },
      choices = {
        { text = "So am I, Helbrek.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The Captain's sendin' folk at the orcs, the priest's sendin' folk at the wrecks, an' the bartender's sendin' folk somewhere he won't say. Pick one." } },
      choices = {
        { text = "Where's the bartender sending them?", next = "news_mikhail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_mikhail = {
      lines = { { id = "nm_default", text = "Ask him, an' he'll tell ye nothin', very politely. That's Mikhail, the best-mannered wall in the Wetlands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Fitz by the door, the League's man upstairs wi' his maps, Glorin in the corner prayin' at his soup. An' once a month, the Kul Tiras marines off the Theramore boat. Then I hide the good mugs." },
      },
      choices = {
        { text = "Fitzsimmons drinks your mead?", next = "mead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mead = {
      lines = { { id = "md_default", text = "Dwarven mead, by the flagon. He cannae pay for it, so strangers do. A good tale goes a long way in this tavern." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brewer = {
      lines = { { id = "br_default", text = "Do they, now! Then ye'll know my mead's honest, an' if ye think it's no', ye'll keep it to yerself, like family." } },
      choices = { { text = "It's honest work. Mostly.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Sailors, soldiers an' diggers all drink at the Deepwater, an' every one o' them talks. Ask me about any o' this!" },
    },
    background = { { id = "tp_bg", text = "I keep a dry room in a wet town. That's the whole o' my story, an' it's a good one." } },
    advice = { { id = "tp_ad", text = "Hang yer cloak by the fire an' yer boots by the door. Never the other way round." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The lads come back from the hills tired an' thirsty. That's how I know there's a war on." } },
    _none = { { id = "tp_none", text = "Ask the room. Sailors know everythin', an' what they don't know they'll make up." } },
    grim_batol = { { id = "tp_grim_batol", text = "Old soldiers at my bar won't say Grim Batol out loud; they just nod east an' drink. I've learned tae pour without askin'." } },
    theramore = { { id = "tp_theramore", text = "Sailors off the Theramore boat drink here first, an' every one o' them says the marsh over there is worse than ours. I take that as a compliment tae the Wetlands." } },
    magni = { { id = "tp_magni", text = "King Magni's portrait hangs over the fire, an' I dust it every mornin'. The damp's ruinin' his beard, but he's still the handsomest dwarf in Menethil." } },
    scourge = { { id = "tp_scourge", text = "Folk off the boats from the north sometimes won't eat or speak for days. I give them a dry room an' don't ask, an' that's all an innkeeper can do." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire never comes tae Menethil, an' I cannae blame them, for their wagons would sink. I've heard their ale's good, but it cannae be as good as mine." } },
  },
}

P:NPC {
  key = "flagongut", id = TODO_NPC("Archaeologist Flagongut"), name = "Archaeologist Flagongut",
  bible = "bibles/menethil.md", role = "scholar", tier = "quest",
  communities = { "menethil" }, temper = { "eager" }, values = { "curious" },
  notices = { "lore", "travel", "lock_shards" },

  impression = {
    first = "Mind the maps, he said, and the maps were everywhere.",
    third = "{name} met Archaeologist Flagongut of the Explorers' League, stuck in Menethil while raptors block the road to the dig at Whelgar's.",
  },

  greetings = {
    { id = "g_maps", text = "Careful, careful, that's a map! They're all maps. Mind where ye put yer elbows." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye're back! Have ye found anythin' old, anythin' at all? I'm no' fussy, ye know." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}! Tell me ye've found somethin' old while ye were away, anythin' at all, fer I've been starin' at these maps the whole time." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, ye've grown hardy since we last spoke! Hardy enough tae get past those raptors tae my dig, I'd say, an' I'd be ever so grateful." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear ye talked someone round in the harbor. Ye'd make a fine fundraiser fer the Explorers' League, if ever ye tire o' fightin'." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms! Then ye know how much history sits under yer boots. Most folk only notice the mud." },
    { id = "n_far", cat = "travel", when = { visited = "Ironforge" },
      text = "Ye've been to the Hall o' Explorers? Then next time, tell High Explorer Magellas I'm still here; he'll know what that means, which is that I'm stuck." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "Ye've a bag full o' soul shards an' they're hummin' louder than half the relics we crate up for Ironforge. I'd ask ye no' tae open it near my finds, for I've no wish tae find out what a three-thousand-year-old skull makes o' them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because the earth remembers what it buried, an' we're always guessin'! A shaman could tell us where a hall stood or which wall hides a chamber, an' that's worth a hundred shovels. The old guard says it's cheatin' history, but history's been cheatin' us for centuries, so I call it fair." } },
      choices = {
        { text = "I'll ask the earth's leave before I help you dig.", next = "BACK", reply = "Then ye're a better dwarf than most o' the League, an' I'll stand back while ye ask. Tell me if it says no, though, for I'll want it in my notes.", fx = { align = { honor = 1 } } },
        { text = "The earth owes us its secrets. I'll help you take them.", next = "BACK", reply = "That's the spirit! The League would hire ye on the spot, an' I'd sign the papers maself.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aye, more than the League lets on, for old tombs hold more than old dwarves. We crate up anythin' that hums an' send it tae Ironforge, where the scholars argue about it for a year an' then lock it in a cellar." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Aye, more than the League lets on, an' I'll tell ye, two o' the crates at my back started hummin' when yer demon walked up. We send anythin' that hums tae Ironforge, where the scholars argue about it for a year an' then lock it in a cellar, an' I'm thinkin' o' sendin' those two today." },
      },
      choices = {
        { text = "Lock it away. Some things shouldn't be studied.", next = "BACK", reply = "Some things, aye, but which ones? That's the question the League's been arguin' for fifty years. I'll leave it tae the scholars.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A locked cellar wastes it. I'd study the humming ones.", next = "BACK", reply = "The humming ones? Ye'd have the scholars in fits. Study what ye like, but no' in my cellar, an' no' on my watch.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raptors, great packs o' them, an' they've grown bold enough to take mules from under their riders. A warrior with a shield could walk that road, an' I'd follow close behind with my maps rolled tight." } },
      choices = {
        { text = "I'll walk the road with you and keep you safe.", next = "BACK", reply = "Would ye? Bless yer beard, if ye have one. I'll keep up, I promise, an' I'll no' stop tae look at every rock.", fx = { align = { honor = 1 } } },
        { text = "I'll clear it, but you'll owe me a share of the finds.", next = "BACK", reply = "A share, eh? I cannae promise ye the League's finds, but I'll buy ye a pint an' put yer name in my report.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bold enough to take a mule in broad daylight an' come back the next day for the cart. The diggers say a great old one leads the pack, but diggers will say anythin' after a pint." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bold enough tae take a mule in broad daylight. {pet} looks bigger than the last mule they took, mind, so I'd keep it close on that road." },
      },
      choices = {
        { text = "I'll thin the pack before anyone else gets hurt.", next = "BACK", reply = "Thank ye. There's diggers out there who'd sleep easier for it, an' so would I.", fx = { align = { honor = 1 } } },
        { text = "Find me that old leader. It'll make a fine trophy.", next = "BACK", reply = "A trophy, is it? Well, I'll no' stop ye, though I'd rather ye thinned the young ones first. The old one bit through a pick handle last week, an' the lad holdin' it near went with it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Study them? We argue over them for years, mostly, an' the League's mages are all in Ironforge squabblin' about Uldaman. My own find, the Stone o' Relu, might have a bit o' that about it, if a raptor hadn't swallowed it on the road." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome askin' about enchantments, an' yer people can spot a rune at forty paces. My own find, the Stone o' Relu, might have a bit o' that about it, if a raptor hadn't swallowed it on the road." },
      },
      choices = {
        { text = "When it's found, it goes to Ironforge under guard.", next = "BACK", reply = "Under guard, aye, an' I'll write the label maself. I'm no' losin' this one tae a sticky-fingered sailor on the Ironforge road.", fx = { align = { order = 1 } } },
        { text = "When it's found, let's test it right here.", next = "BACK", reply = "Here? In Menethil? Ye'd have the whole harbour runnin' for the boats. It goes tae Ironforge, an' I'll hear no more about it.", fx = { align = { order = -1 } } },
        { text = "What is this stone you're after?", next = "stone" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Past the raptors! I've been sittin' here a fortnight hopin' someone would say that. They hunt by smell, mind, so stay downwind an' keep out o' the long grass, an' tell Whelgar I'm still comin'." },
      },
      choices = {
        { text = "I'll go, and carry your message faithfully.", next = "BACK", reply = "Faithfully, aye, that's all I need. Tell Whelgar I'm well an' fed, an' that I'll be along when the road's clear.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go. Whatever I find on the way is mine.", next = "BACK", reply = "Whatever ye find? Then I'll thank ye tae find nothin' that belongs tae the League. Off ye go, an' mind the raptors.", fx = { align = { honor = -1 } } },
        { text = "Why are you stuck here?", next = "stuck" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Relics o' the old dwarven holds, from before Grim Batol was lost. The marsh has eaten most of it, though, an' it gives back very little." } },
      choices = {
        { text = "The marsh should keep what it has taken.", next = "BACK", reply = "Maybe it should, aye, an' some days I think so too. But the League pays me tae ask it nicely for what it took.", fx = { align = { light = -1 } } },
        { text = "Your people's past deserves to be recovered.", next = "BACK", reply = "Thank ye, that's how I see it too. The marsh is a poor keeper o' history, an' we're the only ones who remember.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "All the time, an' I'll no' pretend otherwise, though I put them back as gently as I can once the drawin's are done. Whelgar's diggin' at somethin' old an' big out east, an' I'd sooner a priest looked at it before it looks back." } },
      choices = {
        { text = "Study them if you must, but the dead deserve their rest.", next = "BACK", reply = "Rest, aye, an' I give it them, as gentle as I can. But a drawin' first, an' a name, so they're no' forgotten.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't mind. The past belongs to the living.", next = "BACK", reply = "That's the League's own creed, near enough, though I'd say it more kindly. These ones have waited long enough under the mud.", fx = { align = { light = -1 } } },
        { text = "Something else, Flagongut.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some of it hums, an' some of it smells, an' one piece made the barman's dog howl all night, so aye, I'd say so. The League says catalogue it an' ship it tae Ironforge, but the League isnae the one sleepin' next to it." } },
      choices = {
        { text = "Ship it to Ironforge, then. The League decided.", next = "BACK", reply = "Aye, the League decided, an' I'll do as they say. But I'll be glad tae see the back o' that howlin' piece.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bury the worst of it here. Some things shouldn't travel.", next = "BACK", reply = "Bury it? The League would have my beard for that. But between you an' me, I've thought about it.", fx = { align = { order = -1 } } },
        { text = "Something else, Flagongut.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then ye've seen the real thing, an' I've seen a fossil an' a wet map. The League's been after Uldaman since before I joined, an' Hammertoe Grez's notes were the first proof we had that it was there at all, so I'll raise a cup tonight to the dwarf who wrote them." } },
      choices = {
        { text = "Some places should stay sealed, out of respect for the dead.", next = "BACK", reply = "Ye sound like Hammertoe's ghost, an' maybe ye're right. But the League's been knockin' on Uldaman's door too long tae stop now.", fx = { align = { honor = 1 } } },
        { text = "Dig it all up, Flagongut. The past belongs to the living.", next = "BACK", reply = "Ha! That's what I'd say if I were braver. Write tae the League for me, would ye, an' ask them for more than a wet map.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Will you go and see it yourself?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "When the road's clear an' my knees agree, aye. Until then I'll read every report the Hall o' Explorers sends out an' pretend the mud on my boots came from somewhere more interestin'." } },
      choices = {
        { text = "I hope your road clears soon.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, for half the bones I dig up deserve a few words, an' the League never thinks tae send anybody who can say them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be no use wi' a trowel, but I'd let ye guard my maps, for they're the only good thing I've drawn all month." },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "Word reached even this tavern that ye went to the bottom o' Uldaman. Here I sit wi' raptors on the road, an' you walk into the greatest dig in Khaz Modan. Archaeology!" },
        { id = "h_default", text = "Flagongut, Explorers' League. I came here on my way to the dig at Whelgar's, an' then the raptors took the road. So I'm diggin' through a tavern, for now." },
        { id = "h_prospector", tags = { "news" }, when = { questActive = TODO_QUEST("The Absent Minded Prospector") },
          text = "Word from Prospector Remtravel across the sea? About time. He'd lose his own beard if it weren't attached, but he finds things nobody else can." },
        { id = "h_stoutfist", when = { heardLine = "stoutfist.h_default" },
          text = "The Captain told ye about the orcs? Raptors on the road, orcs in the hills, an' me in a tavern. Archaeology!" },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Candle's low an' the maps are still wrong. I keep hopin' one of them will correct itself overnight." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The Wetlands are full o' old things buried in the mud, an' I'd wager ye can feel where they lie better than I can." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You could clear the road to Whelgar's, an' then I could stop diggin' through this table." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Then ye know raptors, an' that means ye know more about this swamp than I do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Ye'd no' believe how many o' the League's finds turn out tae be cursed, so I'll ask ye tae look over a stone or two before I touch them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The League's been arguin' about dwarves like ye since the first one turned up in Ironforge, an' I'm firmly on the side that wants ye on every dig." },
      },
      again = {
        { id = "h_again", text = "What else? Only mind the maps." },
        { id = "h_again2", text = "Aye? Ask away. I've nothin' but time an' a tavern." },
      },
      choices = {
        { text = "What are you digging for in the Wetlands?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Whelgar's dig must hold something worth the trouble.", next = "dig" },
        { text = "Why not go to the dig yourself?", next = "stuck" },
        { text = "That fossil on your table seems precious to you.", next = "fossil" },
        { text = "I'm League too, sir.", next = "league", when = { origin = "dwarf_explorers_league" } },
        { text = "My people have ruins older than your dig.", next = "elf", when = { race = "NightElf" } },
        { text = "Does the League ever study enchanted finds?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I could get to Whelgar's dig past the raptors.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's keeping you off the road to the dig?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The raptors seem to have grown bold on the dig road.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever disturb the dead with your digging, Flagongut?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is anything in your finds dangerous, Flagongut?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the League's digs ever turn up anything fel?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why does the League want shamans on its digs, Flagongut?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been to the bottom of Uldaman, Flagongut.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "Old things, older than Ironforge some say: bones o' beasts nobody's named an' stone nobody's read. An' now a pack o' mottled raptors is sittin' on the lot." },
      },
      choices = {
        { text = "I'll clear a way for you.", next = "BUSINESS", fx = { affinity = 2, learn = { "explorers_league" } } },
        { text = "Surely the bones can wait.", next = "wait" },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "They've waited this long, aye. It's me that can't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stuck = {
      lines = {
        { id = "sk_default", text = "Waitin' on an escort. The road to Whelgar's runs through raptors, an' the Captain's no men to spare for an old dwarf's maps. I tried it alone once, an' lost the stone." },
      },
      choices = {
        { text = "What stone?", next = "stone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = {
        { id = "sn_default", text = "The Stone o' Relu, the key to my fossil, I'm sure of it. A raptor swallowed it on the road. Which one, I couldnae tell ye; they all look guilty." },
      },
      choices = {
        { text = "I'll find your stone.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "You want me to search raptor guts?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    fossil = {
      lines = {
        { id = "fo_default", text = "I showed it at the League's conference in Ironforge an' said there was power in it. Half the hall laughed. Whelgar didnae, an' he's got the original at the dig." },
      },
      choices = {
        { text = "Why did they laugh?", next = "fossil_laugh" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    fossil_laugh = {
      lines = {
        { id = "fl_default", text = "Because I said 'power' instead o' 'interestin'', an' because I'd had two ales, so I've learned my lesson: one ale." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    league = {
      lines = {
        { id = "lg_default", text = "League! Then ye know the creed: find it, note it, dinnae lick it. Who signed yer papers in the Hall?" },
      },
      choices = {
        { text = "High Explorer Magellas.", next = "BACK", fx = { affinity = 2, learn = { "explorers_league" } } },
        { text = "I'd rather not say.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    elf = {
      lines = {
        { id = "el_default", text = "Aye, an' ye won't let us near them! Ach, I'm only teasin', mostly. How old would ye say they are, roughly?" },
      },
      choices = {
        { text = "Older than your kingdom.", next = "BACK", fx = { affinity = 1 } },
        { text = "We don't count that way.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The League sends me reports even here, an' I've had plenty o' time tae read them. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "Explorers' League, field archaeologist, presently stranded. Put that on my stone when I go." } },
    advice = { { id = "tp_ad", text = "Never carry yer best find in an open pack on a raptor road. Ask me how I know.", next = "stone" } },
    explorers_league = { { id = "tp_league", text = "Best job in the world, when ye're no' stuck in a tavern. Which I am." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Orcs in the hills east o' the dig. I wrote to Ironforge. Ironforge wrote back to say there are orcs in the hills." } },
    _none = { { id = "tp_none", text = "If it's no' buried, I'm the wrong dwarf." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol's the finest ruin in Khaz Modan an' the one no archaeologist will touch. The Wildhammer left it, the Dark Irons cursed it an' the Dragonmaw fouled it, so there's three layers an' no' one o' them safe." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's where the real secrets are, down in the Badlands, an' Prospector Ironband's lot are dyin' tae get in. If I weren't stranded here, I'd be there wi' them." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer have the oldest songs o' any dwarves, an' half the League's theories started as a Wildhammer drinkin' song. They're no' wrong as often as ye'd think." } },
    magni = { { id = "tp_magni", text = "King Magni funds the League out o' his own coffers, an' he reads every report we send. There's no' many kings who'd bother for a pack o' diggers." } },
  },
}

P:NPC {
  key = "mikhail", id = TODO_NPC("Mikhail"), name = "Mikhail",
  bible = "bibles/menethil.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "watchful" }, values = { "loyal", "discreet" },
  notices = { "stealth", "drink", "lock_eyes" },

  impression = {
    first = "He told me to sit where I could see the door.",
    third = "{name} met Mikhail, a quiet man from Stormwind who keeps a bar in Menethil and sells nothing from it.",
  },

  greetings = {
    { id = "g_bar", text = "Evening. Before you ask, no, I don't sell drinks; Helbrek does that, and I just stand here." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, good. Sit where you can see the door; everyone should." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You came in quietly, and I noticed. I'd have noticed you louder, too, but quiet is what I notice most." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've been drinking, and not from me, or I'd have remembered." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes have that sheen, the one that sees through a shadow, and I knew a few people in Stormwind who paid well for it. I'll just say that a man who stands in a corner as much as I do doesn't love being looked at like that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of them have never thought about it. The few who fought in the Second War remember orc shamans calling storms down on their friends, and they don't much like the sound of yours. The rest are just glad of anyone who can tell them whether it'll rain tomorrow, which here it always does." } },
      choices = {
        { text = "I'd ease their fears gently, if they'd let me.", next = "BACK", reply = "They might, given time, and it's kind of you to try. Just don't call a storm in here, or they'll never let you.", fx = { align = { light = 1 } } },
        { text = "Their fears are their own business, Mikhail.", next = "BACK", reply = "Their own, yes, but they'll make it yours if you're not careful. I'd keep the thunder outside, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I did this and that in Stormwind, and some of it meant knowing which cellars to keep an eye on. I'll say only that the ones who thought nobody was watching were usually wrong, so you might bear that in mind." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I did this and that in Stormwind, and some of it meant knowing which cellars to keep an eye on, and what sort of thing came up out of them, which is why I've had one eye on your demon since you sat down. The ones who thought nobody was watching were usually wrong, so you might bear that in mind." },
      },
      choices = {
        { text = "I've nothing to hide. Watch all you like.", next = "BACK", reply = "Good, then we'll get along fine. I've had enough secrets for one lifetime, and I'd rather not go looking for more.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll make sure nobody's watching next time.", next = "BACK", reply = "You'll find I'm usually watching, friend, even when I'm pouring. Do what you like, but not under my roof.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some, bound for Theramore, and they're easy to spot, because they're the only ones who look at the books on my shelf instead of the bottles. I knew a few in Stormwind; they were clever, and they talked too much, which is a poor habit in clever people." } },
      choices = {
        { text = "A mage should know when to keep quiet.", next = "BACK", reply = "They should, and the good ones do. The others talk too much, and they're the ones I remember.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll say what I like. Secrets rot.", next = "BACK", reply = "Secrets rot, and so do the people who spill them, in my experience. Say what you like, but not in my bar.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A few, and most of them are in the ground now, or in the Stockade, or out in Westfall wearing a red mask. I left the city to get away from all that, and Menethil's been kind to me, mostly because nothing happens here." } },
      choices = {
        { text = "Then I'll help keep it that way while I'm here.", next = "BACK", reply = "Thank you, that's what I came here for. Keep the peace, and I'll keep the bar.", fx = { align = { order = 1 } } },
        { text = "Something always happens, Mikhail. You just haven't seen it yet.", next = "BACK", reply = "Maybe so, and maybe I'd rather not see it. Let me enjoy the quiet while it lasts, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because I've seen what comes out of it, and I'm fond of both my legs, thank you. You hunters are welcome to the shore; I'll stay behind this bar and keep an eye on the door." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours keeps watching the door too, I see, so perhaps we've more in common than I thought." },
      },
      choices = {
        { text = "Someone has to clear the shore. I'll do it.", next = "BACK", reply = "Good on you, and the harbour thanks you, even if the crocs don't. Mind your legs out there.", fx = { align = { honor = 1 } } },
        { text = "Wise man. Let the crocolisks have the fools.", next = "BACK", reply = "I like to think so, and my legs agree. Let the fools have the shore; I'll have the bar.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing they'd say twice, and nothing I'd repeat, so they feel safe saying it again. You'd make a better confessor than me, though, because I only listen, and I never forgive anyone." } },
      choices = {
        { text = "Everyone deserves a chance at forgiveness, Mikhail.", next = "BACK", reply = "Forgiveness is the Church's business, not mine. I'll listen, and I'll keep quiet, and that's as close as I come.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Listening is more useful than forgiving, in your trade.", next = "BACK", reply = "It is, and you understand my trade better than most. Listen well and say little, and you'll go far.", fx = { align = { light = -1 } } },
        { text = "Something else, Mikhail.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "For the town, let's say, and for some old friends in Stormwind who like to know who comes and goes. It's letters and keyholes and a lot of bad ale in bad taverns, and no paladin I know would enjoy it." } },
      choices = {
        { text = "Honest work should be done in the open, Mikhail.", next = "BACK", reply = "It should, and in a better world it would be. But the guards in this harbour sell their blind eyes by the hour, and I can't pay their rates.", fx = { align = { honor = 1 } } },
        { text = "Somebody has to read the letters. I understand.", next = "BACK", reply = "You do, and that tells me more about you than you might like. We'll say no more about it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Mikhail.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few every week, quiet and tall, and they mostly stand at the end of the dock looking back across the sea. I don't ask them anything, because I know that look, and it took me two years to stop wearing it after Stormwind." } },
      choices = {
        { text = "Looking back is only honest. We should remember what we left.", next = "BACK", reply = "It is, and I won't stop them. I'll pour them a drink when they come in from the dock, and leave it at that.", fx = { align = { honor = 1 } } },
        { text = "Leave the past behind. Nothing good comes of looking back.", next = "BACK", reply = "Easy to say when you've a home to go back to. They don't, and neither do I, in some ways.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. People tell me things across this bar that they ought to be telling you, and I wish they'd take it up the hill to the chapel." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You're very loud to look at, friend, so sit where you won't frighten off my customers." },
        { id = "h_default", text = "The name's Mikhail. I used to work in Stormwind, and now I keep a bar I don't sell from, in a town where nothing happens. I like it that way, mostly." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Elling Trias's business? Then it's serious, and it's quiet. Lean in. And if things get lively in here, step back and give it a moment." },
        { id = "h_md_resolved", tags = { "news" }, when = { thread = { id = "missing_diplomat", state = "resolved" } },
          text = "Elling wrote to me, which he never does, to say you followed that business all the way to Theramore. Most of the men I used to work with would have stopped at Menethil and called it a day." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "So Elling's found you, and his cheese. How is he? Don't tell him I asked. He'd take it as an invitation." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "It's the busiest hour, and nobody in here is doing anything wrong, or so I tell myself before I go on watching." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Sit where you can see the door, then, and I'll not ask what you're expecting to come through it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You'll have noticed the crocolisks, then, and you'll have noticed I don't go near the water." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf. You're off the boat from Auberdine, I'd guess, and you've the look of someone who hasn't decided yet whether you like it here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll notice I keep the candles trimmed, so there's nothing in here for you to light, should you get bored." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Sit with your back to the wall if you like, though I'd guess you've got something else watching it for you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. In Stormwind I'd have thought you a novelty. Up here, you're the most interesting thing to happen all month." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? Keep it quiet in here, if you please." },
        { id = "h_again2", text = "Go on. Eyes on the door while you talk, if you don't mind." },
      },
      choices = {
        { text = "You stand behind a bar but never sell a drink.", next = "drinks" },
        { text = "You weren't always a barman, I'd guess.", next = "past" },
        { text = "Who's worth watching in here?", next = "room" },
        { text = "Elling sent me. What's this really about?", next = "diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "You've the eyes of someone in my trade.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Did you know many warriors back in Stormwind, Mikhail?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why don't you go near the water, Mikhail?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "People must confess all sorts at your bar, Mikhail.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You watch everyone in here. Who are you working for, Mikhail?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many of my people come through Menethil from Auberdine?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do many mages come through Menethil, Mikhail?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Did you ever deal with warlocks in Stormwind, Mikhail?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do Menethil's humans make of dwarf shamans, Mikhail?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    drinks = {
      lines = { { id = "d_default", text = "Behind a bar, a man can watch the whole room and nobody wonders why. A man in a corner, people wonder. I don't like being wondered about." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
        { text = "So who are you watching for?", next = "room" },
      },
    },
    past = {
      big = true,
      lines = {
        { id = "p_default", text = "This and that, the kind of work you retire from if you're lucky. I was lucky, and I'd like to stay lucky, so let's leave it there." },
      },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "You sound as if you miss it.", next = "miss" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Every day, and don't you dare tell Elling." } },
      choices = {
        { text = "Why not tell him?", next = "miss_elling" },
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    miss_elling = {
      lines = {
        { id = "me_default", text = "Because he'd have me back in Stormwind by the end of the week, and I'd go. That's the trouble with old friends. They know which strings to pull." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    room = {
      lines = {
        { id = "rm_default", text = "Sailors who are sailors, sailors who aren't, and once a month a crowd of Kul Tiras marines in from Theramore with their pay. That's when I stand very still and listen." },
      },
      choices = {
        { text = "And the fellow upstairs?", next = "room_upstairs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    room_upstairs = {
      lines = {
        { id = "ru_default", text = "Samor Festivus. Sells poisons and calls himself a shady dealer, right there in his title. I respect a man who doesn't pretend." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    diplomat = {
      big = true,
      lines = {
        { id = "dp_default", text = "Whatever Elling told you, it's bigger than he said. He never sends anyone to me for small things. Talk low, and watch who's listening." },
      },
      choices = {
        { text = "You don't seem surprised.", next = "diplomat_calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_calm = {
      lines = {
        { id = "dc_default", text = "I'm never surprised; it's a professional habit, if a retired one. Ask me again when this is over, and I might be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = {
        { id = "rq_default", text = "Had, you mean; they're retired eyes now. They still work, mind, and yours spent a long time on the stairs before they found me." },
      },
      choices = {
        { text = "Old habits.", next = "BACK", reply = "Old habits, yes, and good ones, if they've kept you alive this long. Sit, and I'll pour you something.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I came up the stairs openly. I've nothing to hide.", next = "BACK", reply = "Openly, you say, after a long look from the landing. Never mind; I'd have done the same, and I'll pour you something anyway.", fx = { align = { honor = 1 } } },
        { text = "Who trained you?", next = "rogue_trained" },
      },
    },
    rogue_trained = {
      lines = { { id = "rt_default", text = "Nobody you'd find. That was rather the point." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Behind a bar, a man hears everything and repeats very little. These, I don't mind talking about." },
    },
    background = { { id = "tp_bg", text = "I retired from Stormwind and took up a bar. I'd tell you more, but then we'd both be uncomfortable.", next = "past" } },
    advice = { { id = "tp_ad", text = "Sit where you can see the door. Hold a full mug, even if you never drink it. Nobody watches a man with a full mug." } },
    defias = { { id = "tp_defias", text = "That's Stormwind's trouble, and I left it there, though it keeps sending letters." } },
    _none = { { id = "tp_none", text = "Couldn't say, and wouldn't if I could." } },
    si7 = { { id = "tp_si7", text = "SI:7? I've heard the name, same as everyone. I keep bar now, and a barman hears everything and repeats nothing." } },
    varian = { { id = "tp_varian", text = "I served in Stormwind a long time, and I'll only say that kings don't go missing by accident. Pour yourself another and forget I said it." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor came to court after I'd left it, which I've come to think was good timing on my part. People who knew the court before her speak of it differently from those who didn't." } },
    the_stockade = { { id = "tp_the_stockade", text = "I've seen the inside of the Stockade, from the side of the door with the keys. That's all I'll say about it." } },
  },
}
