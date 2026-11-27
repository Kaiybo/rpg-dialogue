-- Loch Modan folk the first passes missed, part 3: the Mountaineers of Algaz Station and the Wetlands
-- tunnels, and those of the Valley of Kings and the South Gate road. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mountaineer Hammerfall: Algaz Station gate guard; stern, tired of jokes about his name.
P:NPC {
  key = "lm_mtn_hammerfall", id = TODO_NPC("Mountaineer Hammerfall"), name = "Mountaineer Hammerfall", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "stern", "proud" }, values = { "dutiful", "family" },
  notices = { "soldier", "race" },
  impression = {
    first = "Mountaineer Hammerfall holds the gate at Algaz Station and asks every traveller their business before they reach the tunnel. He shares a name with an orc outpost in Arathi and has heard every joke there is about it.",
    third = "{name} met Mountaineer Hammerfall, who guards the gate at Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "I know ye, an' I'm glad tae see ye've come back through. Pass, friend, an' mind the tunnel." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll mark yer face an' let ye by, an' that's all ye'll get from me." },
    { id = "g_default", text = "Hold there. This is Algaz Station, an' beyond it the road belongs tae the orcs as much as tae us, so tell me where ye're bound." },
    { id = "g_back", when = { metBefore = true }, text = "I know ye. Pass, an' mind yerself in the tunnels." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Before ye say it, human: aye, like the orc town in the Highlands, an' nae, we're no' related. My family had the name three hundred years before the orcs had a word for hammer." },
  },
  start = "hello",
  nodes = {
    w2_post = {
      lines = {
        { id = "w2_post_l0", text = "Ye ask for it, or ye anger someone who decides for ye. I asked, for my father held this gate in the Second War, an' I wanted tae stand where he stood when the orcs came down the tunnel." },
      },
      choices = {
        { text = "Did they come through, back then?", next = "w2_post_war" },
        { text = "Following a father's steps is a fine reason.", next = "BACK" },
      },
    },
    w2_post_war = {
      lines = {
        { id = "w2_post_war_l0", text = "Nae, an' that's the whole point o' the gate. The Horde took Grim Batol an' the Wetlands beyond it, an' they never once came through Algaz while a Hammerfall stood here. I mean tae keep it that way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Hammerfall, gate watch. Naebody goes north through Dun Algaz wi'out me seein' their face first, so that somebody can say who they were if they dinnae come back.", fx = { learn = { "dragonmaw" } } } },
      again = {
        { id = "h_again", text = "What else? The gate's no' goin' tae watch itself." },
        { id = "h_again2", text = "Speak up, an' quick; there's a cart comin' through the tunnel." },
      },
      choices = {
        { text = "Every traveller through the gate should be named and counted.", next = "BACK", reply = "Aye, so that somebody can say who they were if they dinnae come back.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A gate guard who asks questions only slows honest folk.", next = "BACK", reply = "Honest folk dinnae mind a question. It's the other sort that complain about it.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What happened to the ones who didn't return?", next = "yham_lost" },
        { text = "Do you suspect every traveller?", next = "yham_suspect", when = { race = { "Gnome", "Human", "NightElf" } } },
        { text = "Tell me about the Hammerfall family.", next = "yham_family" },
        { text = "Do many fail to come back?", next = "fail" },
        { text = "Hammerfall. Like the place in Arathi?", next = "name" },
        { text = "I'm bound for the Wetlands.", next = "bound" },
        { text = "How does a dwarf end up posted at Algaz?", next = "w2_post" },
        { text = "Carry on, Mountaineer.", next = "END" },
      },
    },
    fail = {
      lines = { { id = "f_default", text = "Fewer than ye'd fear an' more than I'd like. The Dragonmaw dinnae hold the road, but they hold the side tunnels, an' a traveller alone at dusk is a gift tae them." } },
      choices = {
        { text = "Why hasn't the garrison cleared them?", next = "clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clear = {
      lines = { { id = "c_default", text = "Wi' five rifles an' a smith? Rockgar's asked Ironforge for a company every season since I was posted here, an' every season the company's needed somewhere worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "Like it, an' older than it, an' I'll thank ye tae remember which came first. The orcs named their camp for where their warchief fell, so I'm told, an' my forebears were named for the way they worked a forge." } },
      choices = { { text = "The better reason by far. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bound = {
      lines = { { id = "b_default", text = "Then keep tae the main tunnel, carry a light, an' dinnae stop for anythin' that calls tae ye from a side passage. Menethil's at the far end o' the marsh road, an' ye'll want tae reach the bridges before night." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    yham_lost = {
      lines = {
        { id = "yyham_lost_d", text = "I keep a ledger, an' every name in it has a mark beside it: a tick if they came back through, an' a ring if they didnae. There's eleven rings since I took this post, an' I know every one o' their faces." },
      },
      choices = {
        { text = "Do you search for them?", next = "yham_search" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yham_search = {
      narr = "He lays a broad hand flat on the ledger at his belt.",
      lines = {
        { id = "yyham_search_d", text = "When I can, wi' Brokk an' a torch, as far as the first side tunnel an' nae further, for Rockgar's orders. We've found two, an' buried them proper by the station, an' the other nine are still in the dark somewhere." },
      },
      choices = {
        { text = "Would you go further, with no orders?", next = "yham_orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yham_orders = {
      lines = {
        { id = "yyham_orders_d", text = "Every night I think on it. Nine dwarves an' men down there, an' maybe some still breathin' in a Dragonmaw pen, an' me standin' at a gate because I was told tae. It's no' an easy thing for a soldier tae swallow." },
      },
      choices = {
        { text = "Orders keep the station alive. Hold the gate.", next = "BACK", reply = "Aye, an' Rockgar would say the same. I'll hold it, an' hate it.", fx = { align = { order = 1 } } },
        { text = "Orders be damned. Go and find them.", next = "BACK", reply = "Dinnae say that too loud near the station. But I've thought it, aye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yham_suspect = {
      lines = {
        { id = "yyham_suspect_d", text = "Every one, friend, an' dinnae take it ill. The Dragonmaw have sent spies through in stolen cloaks before, an' I'd sooner offend a hundred honest travellers than wave one knife through tae the loch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yham_family = {
      lines = {
        { id = "yyham_family_d", text = "Smiths an' soldiers, as I said, an' every second one o' us named Thoren for some old grandfather naebody remembers. My cousin Thoren keeps a forge in Ironforge, an' my other cousin Thoren keeps a grudge against him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dun_algaz = { { id = "tp_ydun_algaz", text = "The tunnel north tae the Wetlands. Keep tae the main way an' keep a light burnin'." } },
    wetlands = { { id = "tp_ywetlands", text = "Menethil's at the far end, if ye get there. Tell the harbourmaster Hammerfall sent ye." } },
    background = { { id = "tp_bg", text = "I'm a Hammerfall o' Dun Morogh, smiths an' soldiers both. I keep the gate here." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs in the side tunnels o' Dun Algaz. Keep tae the main way an' keep movin'." } },
    _none = { { id = "tp_none", text = "That's no' gate business. Ask Rockgar." } },
  },
}

-- Mountaineer Luxst: Algaz Station; the garrison's marksman, quiet and exact.
P:NPC {
  key = "lm_mtn_luxst", id = TODO_NPC("Mountaineer Luxst"), name = "Mountaineer Luxst", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "quiet", "exact" }, values = { "craft", "patient" },
  notices = { "class" },
  impression = {
    first = "Mountaineer Luxst is the long rifle of Algaz Station, a still, narrow-eyed dwarf who measures distance while he listens. He says little and does not seem to blink as often as other people.",
    third = "{name} met Mountaineer Luxst, the marksman of Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Knew ye at three hundred paces this time. It's good tae see ye still walkin' tall." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I marked ye a long way off, an' I didnae lower the rifle till I was sure." },
    { id = "g_default", text = "Ye were a hundred an' forty paces off when I first marked ye. Welcome tae Algaz Station." },
    { id = "g_back", when = { metBefore = true }, text = "I knew yer walk at two hundred paces this time. Welcome back." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye judge range wi' yer eyes half shut, the way it should be done. What d'ye reckon tae that dead pine on the ridge?" },
  },
  start = "hello",
  nodes = {
    w2_hard = {
      lines = {
        { id = "w2_hard_l0", text = "Across the tunnel mouth at dusk, at a Dragonmaw scout holdin' a knife at a carter's neck. Ninety paces, bad light, an' the carter twitchin'. I took the scout through the shoulder, an' the carter fainted." },
      },
      choices = {
        { text = "You could have hit the carter.", next = "w2_hard_risk" },
        { text = "A clean shot, by any measure.", next = "BACK" },
      },
    },
    w2_hard_risk = {
      lines = {
        { id = "w2_hard_risk_l0", text = "Aye, I could have. I've thought on it every night since, an' I've decided I'd take the shot again. A miss would have killed him; no' shootin' at all would have killed him slower." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Luxst. The others guard the gate, an' I guard the ground in front of it, out as far as a ball will carry true." } },
      again = {
        { id = "h_again", text = "Aye? I'm listenin', though I'll no' look round." },
        { id = "h_again2", text = "Go on, then. I can listen an' watch the road both." },
      },
      choices = {
        { text = "A marksman should fire only on his captain's word.", next = "BACK", reply = "Aye, for a shot fired wrong cannae be called back, an' that's the whole of it.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A good shot should trust his own eye, not his captain.", next = "BACK", reply = "My eye's good, but it's no' the eye that sees the whole field. The Captain's is.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How did you learn to shoot like that?", next = "ylux_learn" },
        { text = "Teach a hunter something about range.", next = "ylux_hunter", when = { class = "HUNTER" } },
        { text = "What's special about your powder?", next = "ylux_powder" },
        { text = "How far does a ball carry true?", next = "far" },
        { text = "What do you shoot at, out here?", next = "shoot" },
        { text = "I'd call that pine two hundred and ten paces.", next = "pine", when = { class = "HUNTER" } },
        { text = "What's the hardest shot you've had to make here?", next = "w2_hard" },
        { text = "Good shooting, Mountaineer.", next = "END" },
      },
    },
    far = {
      lines = { { id = "f_default", text = "For most o' the garrison, a hundred paces on a still day. For me, on this rifle, wi' my own powder, near three hundred, though I'd no' wager a life on anythin' past two-fifty." } },
      choices = {
        { text = "What makes the difference?", next = "diff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diff = {
      lines = { { id = "d_default", text = "Patience, mostly, an' weighin' every charge on a scale instead o' pourin' by eye. The wind in this pass turns twice between the gate an' the bend, an' it took me a year o' misses tae learn where." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shoot = {
      lines = { { id = "s_default", text = "Dragonmaw scouts, when they show a head over the rocks tae count us. I've never let one finish countin', which is why they still think there's more of us than there are.", fx = { learn = { "dragonmaw" } } } },
      choices = { { text = "A useful lie to keep alive. Something else.", next = "BACK" } },
    },
    pine = {
      lines = { { id = "p_default", text = "Two hundred an' eighteen, but ye're closer than Zwarn's ever got, an' he's stood beside it. Ye've the eye, {g:lad|lass}, an' it only wants practice." } },
      choices = { { text = "I'll take that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ylux_learn = {
      lines = {
        { id = "yylux_learn_d", text = "From a Bronzebeard sharpshooter called Durga Steelsight, who fought at Grim Batol an' could split a hair at two hundred paces. She took me on because I was the only one o' her pupils who never asked how long the lessons would last." },
      },
      choices = {
        { text = "Is she still shooting?", next = "ylux_durga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylux_durga = {
      lines = {
        { id = "yylux_durga_d", text = "She lost her eyes tae a Dragonmaw firebomb in the last o' the war, an' she sits in Ironforge now by the Military Ward. I send her my best tallies every season, an' she writes back tellin' me they're no' good enough." },
      },
      choices = {
        { text = "Do you ever miss a shot?", next = "ylux_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylux_miss = {
      narr = "Luxst lowers the rifle for the first time and turns it slowly in his hands.",
      lines = {
        { id = "yylux_miss_d", text = "Once, at a scout who turned out tae be a lad no older than fifteen, an orc boy wi' a spear too big for him. I pulled the shot, an' he ran back intae the tunnel. Rockgar says it was a mistake, an' I'm no' sure he's wrong." },
      },
      choices = {
        { text = "Sparing a child was right, orc or not.", next = "BACK", reply = "Aye. I'd do it again, an' that worries me less than it should.", fx = { align = { light = 1 } } },
        { text = "Every orc grows up. That boy will kill dwarves.", next = "BACK", reply = "That's what Rockgar said. It's what I think on, some nights.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylux_hunter = {
      lines = {
        { id = "yylux_hunter_d", text = "Look at the grass, no' the target, for the grass tells ye the wind an' the target only tells ye where tae aim. An' count yer breaths, for a hunter who's holdin' it is a hunter whose hand is shakin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylux_powder = {
      lines = {
        { id = "yylux_powder_d", text = "I weigh it on Durga's old brass scale, every charge, an' I mix my own from Gothor's stock wi' a pinch o' somethin' I'll no' tell ye. It's the pinch that makes the difference, or so I like tae think." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    algaz_station = { { id = "tp_yalgaz_station", text = "My station. I know every rock in front of it out tae three hundred paces." } },
    durga_steelsight = { { id = "tp_ydurga_steelsight", text = "My old teacher. She'd say I'm still too slow on the trigger, an' she'd be right." } },
    background = { { id = "tp_bg", text = "I shoot for the station. There's little else tae tell, an' I'd sooner no' tell it." } },
    dragonmaw = { { id = "tp_dm", text = "Their scouts come tae count us. I see tae it they lose their place." } },
    _none = { { id = "tp_none", text = "I dinnae know. It's out o' my range, ye might say." } },
  },
}

-- Mountaineer Morran: Algaz Station; counts what goes up the road to the front.
P:NPC {
  key = "lm_mtn_morran", id = TODO_NPC("Mountaineer Morran"), name = "Mountaineer Morran", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "brisk", "practical" }, values = { "order", "dutiful" },
  notices = { "purse", "travel" },
  impression = {
    first = "Mountaineer Morran keeps the tally at Algaz Station of every cart, crate and traveller that goes north. She has a quartermaster's eye and can tell at a glance what a pack is missing.",
    third = "{name} met Mountaineer Morran, who keeps the tally of the road at Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're in my book a good few times now, an' every time ye come back I mark it wi' a wee star." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye're in the book. I'll mark ye in, an' leave the rest unsaid." },
    { id = "g_default", text = "One traveller, on foot, northbound or stayin'? I'll need tae know which for the tally." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're in my book already. I'll mark ye returned, an' glad tae." },
  },
  notice = {
    { id = "n_pack", cat = "travel", when = { maxLevel = 19 },
      text = "Yer pack's light for the Wetlands, friend. Ye'll want twice the water ye think, for there's plenty o' it in that marsh an' none ye'd dare drink." },
  },
  start = "hello",
  nodes = {
    w2_stores = {
      lines = {
        { id = "w2_stores_l0", text = "Two crates o' shot last month, an' a barrel o' salt pork the month before, an' nae Dragonmaw ever got past the gate tae take them. Either my sums are wrong, an' they're never wrong, or somebody's hungry an' quiet about it." },
      },
      choices = {
        { text = "Who would you suspect?", next = "w2_stores_who" },
        { text = "Every garrison loses a crate or two.", next = "BACK" },
      },
    },
    w2_stores_who = {
      lines = {
        { id = "w2_stores_who_l0", text = "I've a guess, an' I'll keep it tae myself till I can prove it. It's no' the sort o' thing ye say about a mountaineer at a station this small, no' unless ye want tae sleep wi' one eye open." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Morran. I stand my watch like the rest, an' I keep the station's count besides, for somebody has tae know what went up that road an' what came back." } },
      again = {
        { id = "h_again", text = "What else? I've a column tae finish." },
        { id = "h_again2", text = "Aye, go on, an' I'll count while ye talk." },
      },
      choices = {
        { text = "Good records keep a station honest and its people safe.", next = "BACK", reply = "Exactly so! Wi'out the tally, we'd no' even know who tae go lookin' for.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Nobody needs to know where I'm going or coming from.", next = "BACK", reply = "Then I'll write ye down as a stranger who wouldnae say, an' that's no' a kind note.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What do you do with the names that don't return?", next = "ymor_names" },
        { text = "I'll take a message to Dun Modr if you like.", next = "ymor_message", when = { minLevel = 20 } },
        { text = "What's Menethil Harbor like?", next = "ymor_menethil" },
        { text = "What goes up the road these days?", next = "goes" },
        { text = "And what comes back?", next = "back" },
        { text = "What's gone missing from the station's stores?", next = "w2_stores" },
        { text = "Mark me down as passing through.", next = "END" },
      },
    },
    goes = {
      lines = { { id = "g_default2", text = "Powder, shot, salt meat an' bandage linen, bound for Menethil an' for Longbraid's dwarves at Dun Modr beyond it. There's more goin' north every month, an' I take that tae mean it's goin' badly up there.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "What's happening at Dun Modr?", next = "modr" },
        { text = "Something else.", next = "BACK" },
      },
    },
    modr = {
      lines = { { id = "m_default", text = "The Dark Irons took the town an' broke the Thandol Span, an' what's left o' the garrison is camped outside its own walls. I only know what the carters tell me, but I know what they ask for, an' it's never less than last time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    back = {
      lines = { { id = "b_default", text = "Empty carts, mostly, an' carters who've aged a year in a fortnight. Now an' then a cart doesnae come back at all, an' I leave the line open in the book a full month before I close it." } },
      choices = { { text = "That's a hard line to rule. Something else.", next = "BACK" } },
    },
    ymor_names = {
      lines = {
        { id = "yymor_names_d", text = "I copy them intae a second book, separate from the tally, an' send it tae Ironforge every month. Somebody should know who went north an' didnae come home, an' the Mountaineer command never asks unless ye make them." },
      },
      choices = {
        { text = "How many names are in that book?", next = "ymor_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymor_count = {
      narr = "Morran turns the ledger at his belt around so you can see the thick second spine.",
      lines = {
        { id = "yymor_count_d", text = "Too many, an' more since the Dark Irons took Dun Modr. Carters, mostly, an' a few adventurers, an' one wee lass who said she was goin' tae find her da. I wrote her name in the first book an' then, a month later, in the second." },
      },
      choices = {
        { text = "Do you blame yourself?", next = "ymor_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymor_blame = {
      lines = {
        { id = "yymor_blame_d", text = "I let them through, so aye, a bit. Hammerfall says it's no' our place tae stop folk who want tae go, but I've wondered if I should have turned that lass back, even if she'd have cursed me for it." },
      },
      choices = {
        { text = "You should have stopped her. She was a child.", next = "BACK", reply = "Aye. Next time I'll turn the bairns back, an' let them curse me.", fx = { align = { order = 1 } } },
        { text = "It was her choice to make. Not yours.", next = "BACK", reply = "Maybe so. It doesnae make the second book any lighter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymor_message = {
      lines = {
        { id = "yymor_message_d", text = "That's kind o' ye, an' they could use it. Find Longbraid's camp outside Dun Modr an' tell them the powder's comin' as fast as Algaz can send it, which isnae fast enough, an' that Morran's still countin' every crate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymor_menethil = {
      lines = {
        { id = "yymor_menethil_d", text = "Wet, crowded an' noisy, wi' half the Alliance's ships comin' an' goin' an' the Dragonmaw watchin' from the hills. It's the only harbour in Khaz Modan, an' everythin' goes through it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dun_modr = { { id = "tp_ydun_modr", text = "The Dark Irons took it, an' Longbraid's folk are camped outside. Everythin' I send north goes there." } },
    menethil_harbor = { { id = "tp_ymenethil_harbor", text = "The far end o' the road an' the only harbour we've got. Ships, salt an' trouble." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer who can add, which makes me the station's clerk whether I like it or no'." } },
    dark_iron = { { id = "tp_di", text = "They've Dun Modr, by all accounts. I see it in what the north keeps askin' for." } },
    _none = { { id = "tp_none", text = "It's no' in my book, so I couldnae tell ye." } },
  },
}

-- Mountaineer Yuttha: Algaz Station; cheerful, the first friendly face after the Wetlands.
P:NPC {
  key = "lm_mtn_yuttha", id = TODO_NPC("Mountaineer Yuttha"), name = "Mountaineer Yuttha", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "cheerful", "homesick" }, values = { "kind", "dutiful" },
  notices = { "weary", "race" },
  impression = {
    first = "Mountaineer Yuttha greets travellers at Algaz Station as if each one were a cousin home from a long trip. She is the first friendly face on the road out of the Wetlands, and she takes the duty seriously.",
    third = "{name} met Mountaineer Yuttha, the cheerful guard at Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are again, an' lookin' grand! Ye remind me o' home, an' that's the nicest thing I can say tae anyone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Welcome tae Loch Modan, I suppose, though I'll no' pretend I mean it this time." },
    { id = "g_default", text = "Welcome tae Loch Modan! Ye're on dry ground now, an' among friends, an' there's ale in Thelsamar if ye've the legs for the road." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I'd wondered how ye fared, an' here ye are, lookin' fine." },
  },
  notice = {
    { id = "n_tired", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Oh, ye poor thing, look at the state o' yer gear. Gothor's forge is just there, an' he grumbles, but he'll put ye right." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf from over the sea! Ye'll have come by the Menethil boat an' walked the whole marsh, an' I think that's the bravest thing I've heard all week." },
  },
  start = "hello",
  nodes = {
    w2_news = {
      lines = {
        { id = "w2_news_l0", text = "That they're wet, mostly, an' I believe them, for they come out o' the tunnel steamin' like puddin's. After that it's raptors, an' crocolisks, an' the orcs at Grim Batol, an' then they ask where the ale is." },
      },
      choices = {
        { text = "What do they say about Grim Batol?", next = "w2_news_batol" },
        { text = "I'll be asking where the ale is myself.", next = "BACK" },
      },
    },
    w2_news_batol = {
      lines = {
        { id = "w2_news_batol_l0", text = "Nothin' good. The Dragonmaw hold it still, an' some say there's somethin' worse than orcs in the deep halls. I dinnae ask more than that, for it's my job tae make folk feel better, no' worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I'm Mountaineer Yuttha. Hammerfall asks folk where they're goin', an' I ask how they are, an' between us we cover the matter." } },
      again = {
        { id = "h_again", text = "What else can I tell ye, friend?" },
        { id = "h_again2", text = "Aye, go on, I like a chat, an' Hammerfall's no' much o' one." },
      },
      choices = {
        { text = "Every guard at Algaz is doing her duty to Ironforge.", next = "BACK", reply = "Aye, an' that's what I tell myself when I'm missin' the warm halls an' my mam's cookin'.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "If you miss home, just go. Nobody can really stop you.", next = "BACK", reply = "That's no' how it works, an' ye know it. Somebody has tae ask folk how they are.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why are you so cheerful here?", next = "yyut_cheer" },
        { text = "An elf feels welcome, thank you.", next = "yyut_elf", when = { race = "NightElf" } },
        { text = "Will you go back to Thelsamar?", next = "yyut_chair" },
        { text = "Where should I go from here?", next = "where" },
        { text = "You seem happy, for such a grim post.", next = "happy" },
        { text = "What do travellers from the Wetlands usually tell you?", next = "w2_news" },
        { text = "Thank you for the welcome.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "South along the road tae Thelsamar, an' ye cannae miss it, for it's the only town we've got. The Stoutlager Inn's on the square, an' ye're tae tell Innkeeper Hearthstove that Yuttha at the station still wants her old chair kept." } },
      choices = {
        { text = "Your old chair?", next = "chair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chair = {
      lines = { { id = "c_default", text = "By the fire, on the left, wi' the wobbly leg. I was Thelsamar garrison till they sent me up here tae make up the numbers, an' I mean tae sit in that chair again the day they send me home." } },
      choices = { { text = "I'll pass it on. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    happy = {
      lines = { { id = "ha_default", text = "Somebody has tae be, wi' Zwarn sighin' on one side o' me an' Luxst sayin' nothin' on the other. Folk come out o' that tunnel wet an' frightened, an' a smile costs me less than it's worth tae them." } },
      choices = { { text = "It was worth a good deal. Something else.", next = "BACK" } },
    },
    yyut_cheer = {
      lines = {
        { id = "yyyut_cheer_d", text = "Because the folk who come out o' that tunnel have just walked through the Dragonmaw's back yard, an' they need somebody tae tell them they're safe now. Hammerfall's good at many things, but makin' folk feel safe isnae one o' them." },
      },
      choices = {
        { text = "Do you ever feel afraid here?", next = "yyut_afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yyut_afraid = {
      narr = "Yuttha's smile stays, but her hands fold together a little tighter.",
      lines = {
        { id = "yyyut_afraid_d", text = "Every night, if I'm honest, when Zwarn's sighin' an' the wind's comin' down the pass. But I've learned that if I smile at a frightened traveller, I feel braver myself, so I smile a great deal." },
      },
      choices = {
        { text = "What would you do if the orcs came?", next = "yyut_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yyut_orcs = {
      lines = {
        { id = "yyyut_orcs_d", text = "Fight, I suppose, an' hope Luxst is as good as he says. But I've often wondered whether we could talk tae them first, for the Dragonmaw are beaten an' hungry, an' a hungry clan might take bread over blood." },
      },
      choices = {
        { text = "Try talking. Peace is worth the risk.", next = "BACK", reply = "Aye, that's what I think! Dinnae tell Rockgar I said so, mind.", fx = { align = { light = 1 } } },
        { text = "They're Dragonmaw. They'll only answer to steel.", next = "BACK", reply = "Maybe ye're right, an' I'm too soft for this post. I'll keep smilin' all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yyut_elf = {
      lines = {
        { id = "yyyut_elf_d", text = "Ye're most welcome! I've only met a few o' yer folk, but every one walked through that marsh like it was a garden. Would ye tell me, are the trees in yer land truly as tall as mountains?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yyut_chair = {
      lines = {
        { id = "yyyut_chair_d", text = "Aye, an' I mean tae have it back. Old Cragg's sittin' in it now, I hear, an' he'll no' give it up easily, but I've told the innkeeper tae keep it warm for me till the Reserve comes home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "My home, an' the best town in Khaz Modan. The Stoutlager has the warmest fire." } },
    zwarn = { { id = "tp_yzwarn", text = "He's sure we'll die tonight. I've been sure we'll no' for four years, an' I'm winnin'." } },
    background = { { id = "tp_bg", text = "Thelsamar born, an' posted tae Algaz for my sins. I'll be home by the fire again one day." } },
    _none = { { id = "tp_none", text = "Oh, I dinnae know that one, I'm sorry! Rockgar might, if ye catch him in a good mood." } },
  },
}

-- Mountaineer Zwarn: Algaz Station; gloomy, sure the Dragonmaw are coming tonight.
P:NPC {
  key = "lm_mtn_zwarn", id = TODO_NPC("Mountaineer Zwarn"), name = "Mountaineer Zwarn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "gloomy", "dry" }, values = { "dutiful", "vigilant" },
  notices = { "soldier" },
  impression = {
    first = "Mountaineer Zwarn stands at Algaz Station with his collar turned up against the wind from the pass and the settled gloom of a dwarf who expects the worst nightly. He has been wrong every night so far and takes no comfort in it.",
    third = "{name} met Mountaineer Zwarn, a gloomy guard at Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye're alive again, an' so am I, the two of us against all the odds. I'll count that a blessin'." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. If ye're the omen I've been waitin' for, I'm no' impressed." },
    { id = "g_default", text = "So ye've come tae Algaz. I hope ye've said yer farewells somewhere, for it'll be tonight, I can feel it in the wind." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're still alive, then. So am I, which I didnae expect." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's dark, an' the wind's from the north. If they're comin', it's now, so stand where I can see ye." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye look handy. Stay the night, why don't ye, for one more sword might mean one more of us sees the mornin'." },
  },
  start = "hello",
  nodes = {
    w2_plan = {
      lines = {
        { id = "w2_plan_l0", text = "I've thought on it every night for six years, so I've a plan. Ring the bell, fire once, run tae the powder store, an' hope Luxst has stopped enough o' them that I get there." },
      },
      choices = {
        { text = "And the powder store?", next = "w2_plan_powder" },
        { text = "That's a sound enough plan.", next = "BACK" },
      },
    },
    w2_plan_powder = {
      narr = "He lowers his voice, though there is nobody near.",
      lines = {
        { id = "w2_plan_powder_l0", text = "Bring the tunnel down on the lot o' them. Rockgar's never said it aloud, but there's a reason the barrels sit where they do, an' every one o' us knows it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Zwarn. I've the cold corner o' the station, where the wind comes straight down from Dun Algaz carryin' the smell o' orc fires, an' it's told me nothin' good yet." } },
      again = {
        { id = "h_again", text = "What else? Ask while there's time." },
        { id = "h_again2", text = "Go on, it'll pass the hour, an' it might be my last, so make it a good question." },
      },
      choices = {
        { text = "Keep to your post and trust the station's orders.", next = "BACK", reply = "I do, an' I'll keep doin' it till the night they come, which is likely tonight.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "If the orcs come, run. No post is worth dying on.", next = "BACK", reply = "Then who'd warn the town, eh? Somebody has tae stand here an' be eaten first.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why are you so sure they'll come?", next = "yzwa_sure" },
        { text = "I'm an orc. Should you fear me?", next = "yzwa_orc", when = { race = "Orc" } },
        { text = "What's on Yuttha's tally?", next = "yzwa_tally" },
        { text = "What will be tonight?", next = "tonight" },
        { text = "You've said that before, I'd guess.", next = "before" },
        { text = "What would you do if the Dragonmaw really came?", next = "w2_plan" },
        { text = "Keep your chin up, Zwarn.", next = "END" },
      },
    },
    tonight = {
      lines = { { id = "t_default", text = "The Dragonmaw, down the pass in force. There's enough o' them in those tunnels tae roll over five Mountaineers an' be in Thelsamar by breakfast, an' one o' these nights their chieftain will work that out.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "Why haven't they, in all these years?", next = "years" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years = {
      lines = { { id = "y_default", text = "Luxst says it's because they're a beaten clan wi' nae dragons left an' nae heart for it. I say a beaten orc is only one that's restin', but I'll grant ye he's been right longer than I have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "Every night for four years, an' Yuttha keeps a tally on the wall tae mock me wi'. But a watchman only has tae be right the once, an' I'd rather be laughed at than surprised." } },
      choices = { { text = "There's sense in that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yzwa_sure = {
      lines = {
        { id = "yyzwa_sure_d", text = "Because I was at Grim Batol when the Dragonmaw held it, a prisoner for three weeks in the year the war ended. I saw what they do wi' captives, an' I saw how many of them there were, an' they didnae all die when the dragons flew off." },
      },
      choices = {
        { text = "You were a prisoner?", next = "yzwa_prisoner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzwa_prisoner = {
      narr = "Zwarn turns his collar higher, though the wind has not changed.",
      lines = {
        { id = "yyzwa_prisoner_d", text = "Aye, wi' twenty other dwarves in a pen under the mountain. We were freed when Alliance soldiers broke the hold, but only six of us walked out. I've counted my nights since, an' every one feels borrowed." },
      },
      choices = {
        { text = "Does anyone know what you went through?", next = "yzwa_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzwa_know = {
      lines = {
        { id = "yyzwa_know_d", text = "Rockgar does, an' he lets me keep the cold corner. The others think I'm a sour old fool, an' I've no' told them otherwise, for I'd sooner they laughed at me than looked at me the way the healers did." },
      },
      choices = {
        { text = "Tell them. They'd stand closer beside you.", next = "BACK", reply = "Maybe. Yuttha would listen, I think. She's kinder than I deserve.", fx = { align = { honor = 1 } } },
        { text = "Keep it to yourself. It's your burden.", next = "BACK", reply = "Aye, it is, an' it's mine tae carry. Thank ye for understandin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzwa_orc = {
      lines = {
        { id = "yyzwa_orc_d", text = "Ye're no' Dragonmaw, I can see that much, for yer kit's Horde an' no' clan. But ye'll forgive me if my hand doesnae leave my axe while ye're stood there, for I've learned the hard way what an orc can do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yzwa_tally = {
      lines = {
        { id = "yyzwa_tally_d", text = "Four years o' marks, every night I said they'd come an' they didnae. She draws a wee orc wi' a frown beside each one, an' I've started tae look forward tae seein' what she draws next." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grim_batol = { { id = "tp_ygrim_batol", text = "I was held there, once. I'll no' speak more of it." } },
    algaz_station = { { id = "tp_yalgaz_station", text = "The cold corner's mine. Rockgar knows why." } },
    background = { { id = "tp_bg", text = "Four years at Algaz Station, an' I've expected tae die on every night o' them. It's wearin'." } },
    dragonmaw = { { id = "tp_dm", text = "Up the pass, in the tunnels. It'll be tonight, mark me." } },
    _none = { { id = "tp_none", text = "I dinnae know, an' I doubt it'll matter by mornin'." } },
  },
}

-- Mountaineer Ganin: patrols the road between Algaz Station and the North Gate Pass.
P:NPC {
  key = "lm_mtn_ganin", id = TODO_NPC("Mountaineer Ganin"), name = "Mountaineer Ganin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "easy", "gossipy" }, values = { "dutiful", "curious" },
  notices = { "travel", "race" },
  impression = {
    first = "Mountaineer Ganin patrols between Algaz Station and the North Gate Pass and collects news from every traveller he meets on the way. He trades what he hears at one end for what he hears at the other and considers it part of the job.",
    third = "{name} met Mountaineer Ganin, who patrols between Algaz Station and the North Gate Pass.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's yerself, an' ye always bring the best news! Out wi' it, for I'm starvin' for a story." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Keep yer news, for I'll get it from somebody friendlier." },
    { id = "g_default", text = "Well met on the road! Which way have ye come, an' what's the word from there?" },
    { id = "g_back", when = { metBefore = true }, text = "It's yerself! Ye'll have fresh news by now, I hope, for I've used up the last lot." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome on the pass road! Is there any word from Gnomeregan, friend? The lads at the outpost ask me every week an' I've never anythin' tae tell them." },
  },
  start = "hello",
  nodes = {
    w2_best = {
      lines = {
        { id = "w2_best_l0", text = "A wee bairn born tae the smith's wife at the North Gate, an' her husband up at Algaz on watch. I ran the whole road that day, an' he wept on my shoulder, an' Rockgar let him go home for a week." },
      },
      choices = {
        { text = "And the worst?", next = "w2_best_worst" },
        { text = "Good news deserves a quick foot.", next = "BACK" },
      },
    },
    w2_best_worst = {
      lines = {
        { id = "w2_best_worst_l0", text = "Gnomeregan, when the word came that it had fallen. I'd tae tell a gnome at the station that his whole city was gone, an' he only nodded an' went back tae his work, an' that was worse than if he'd cried." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Ganin. I walk from Algaz Station up tae the North Gate Pass an' back, which makes me the nearest thing tae a town crier these hills have got." } },
      again = {
        { id = "h_again", text = "What else d'ye want tae hear? Or tell, I'm no' fussy." },
        { id = "h_again2", text = "Aye, go on! Whatever ye tell me, I'll have it at the North Gate by supper." },
      },
      choices = {
        { text = "News should go through the captain before it reaches the gossips.", next = "BACK", reply = "Ach, ye're right, though the Captain's a terrible storyteller an' tells it all wrong.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Spread the word freely. Folk deserve to hear the news.", next = "BACK", reply = "That's my thinkin' too, though the Captain's warned me about it twice now.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Any word on the flying machine?", next = "ygan_machine" },
        { text = "I have news from Gnomeregan, of a kind.", next = "ygan_gnome", when = { race = "Gnome" } },
        { text = "Why do you carry news at all?", next = "ygan_crier" },
        { text = "What's the news from the station?", next = "station" },
        { text = "And from the North Gate?", next = "gate" },
        { text = "I've come from Ironforge, and it stands.", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "What's the best news you ever carried?", next = "w2_best" },
        { text = "Safe walking, Ganin.", next = "END" },
      },
    },
    station = {
      lines = { { id = "s_default", text = "Rockgar's asked Ironforge for more rifles again, Gothor's run short o' rivets, an' Zwarn says the orcs are comin' tonight. That last one isnae news, mind, for he's said it every night since he was posted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "g_default2", text = "Pilot Hammerfoot at the outpost is still watchin' the hills for a flyin' machine that went down out there. He'll no' rest till he knows what brought it down, an' the Mountaineers up there have learned tae walk soft around him." } },
      choices = {
        { text = "What do you think brought it down?", next = "down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    down = {
      lines = { { id = "d_default", text = "I've heard a buzzard, an' I've heard an ogre wi' a boulder, an' I've heard the pilot fell asleep, dependin' on who's had how many. I pass them all on evenly, for it's no' a crier's place tae pick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "i_default", text = "It does? Well, o' course it does, but it's good tae hear it said by somebody who's seen the gates this season. I'll have that at both ends o' the road by nightfall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ygan_machine = {
      lines = {
        { id = "yygan_machine_d", text = "Only that the pilot's sure it came down near the trogg hills, an' that he wants it found before the troggs strip it for scrap. He's a gnome, an' he says there's a part in it that's worth more than the whole North Gate outpost." },
      },
      choices = {
        { text = "What part?", next = "ygan_part" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygan_part = {
      lines = {
        { id = "yygan_part_d", text = "He wouldnae tell me, an' I'm no' a dwarf who's easily turned down. All he'd say is that it came out o' Gnomeregan before the fall, an' there's no' another like it left in the world now." },
      },
      choices = {
        { text = "Should the outpost spend men on it?", next = "ygan_spend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygan_spend = {
      narr = "Ganin taps the side of his nose, the way a dwarf does when he's about to share an opinion he shouldn't.",
      lines = {
        { id = "yygan_spend_d", text = "That's the argument at the outpost every night. Hammerfoot wants a search party, the sergeant wants the men on the wall, an' I carry each o' them the other's words twice a day an' try no' tae take sides, which I'm bad at." },
      },
      choices = {
        { text = "The wall comes first. Men matter more than machines.", next = "BACK", reply = "That's the sergeant's view, an' I'll tell him a stranger agreed. He'll like that.", fx = { align = { order = 1 } } },
        { text = "Find the machine. Gnomeregan's secrets can't be lost.", next = "BACK", reply = "Hammerfoot'll kiss ye for that, if he can reach. I'll pass it on.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygan_gnome = {
      lines = {
        { id = "yygan_gnome_d", text = "Then ye've more than I've ever had tae give the lads! Tell me plainly, though, an' I'll pass it on plainly: is there any hope o' takin' the city back, or are the gnomes in Ironforge tae stay?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygan_crier = {
      lines = {
        { id = "yygan_crier_d", text = "Because the station has nae courier an' the outpost has nae bird, so news either walks wi' me or it doesnae walk. I've carried word o' weddin's, deaths, debts an' one very rude letter, an' I never read them, mostly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    north_gate_pass = { { id = "tp_ynorth_gate_pass", text = "The outpost at the top o' my road. Cold, windy, an' full o' gnomes watchin' the sky." } },
    pilot_hammerfoot = { { id = "tp_ypilot_hammerfoot", text = "A gnome who's lost a flyin' machine an' won't stop lookin' till he's found every bolt of it." } },
    background = { { id = "tp_bg", text = "I walk the pass road an' carry the talk along it. Ye'd be surprised how much a garrison needs that." } },
    _none = { { id = "tp_none", text = "I've heard nothin' on that, an' it pains me tae say so. If ye learn it, tell me first." } },
  },
}

-- Mountaineer Brokk: patrols from Dun Algaz to Algaz Station.
P:NPC {
  key = "lm_mtn_brokk", id = TODO_NPC("Mountaineer Brokk"), name = "Mountaineer Brokk", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "fierce", "blunt" }, values = { "dutiful", "courage" },
  notices = { "soldier", "greenness" },
  impression = {
    first = "Mountaineer Brokk walks from Algaz Station to the mouth of Dun Algaz and back, closer to the Dragonmaw than any other dwarf in Loch Modan. He seems to regard the patrol as a daily invitation the orcs keep declining.",
    third = "{name} met Mountaineer Brokk, who patrols between Algaz Station and Dun Algaz.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back on my road, an' still in one piece! Did ye give the orcs a bloody nose for me?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Go an' fight yer own battles, an' keep well out o' mine." },
    { id = "g_default", text = "Ye're a long way up the pass, {class}. Either ye're bound for the Wetlands or ye're lookin' for a fight, an' I can help wi' the second." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my road! Did the orcs give ye any sport?" },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "Ye're green for this end o' the road, {g:lad|lass}. Walk behind me as far as the tunnel mouth if ye're set on goin', an' run the rest." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "Now there's an arm that's swung an axe. Come up tae the tunnel mouth wi' me an' we'll see if the Dragonmaw are feelin' brave today." },
  },
  start = "hello",
  nodes = {
    w2_close = {
      lines = {
        { id = "w2_close_l0", text = "Last spring, a Dragonmaw axe came out o' the side tunnel an' took the buckle off my belt, an' my breeches with it. I fought the rest o' that skirmish in my smalls, an' I won." },
      },
      choices = {
        { text = "You're making that up.", next = "w2_close_true" },
        { text = "That's the bravest thing I've ever heard.", next = "BACK" },
      },
    },
    w2_close_true = {
      lines = {
        { id = "w2_close_true_l0", text = "Ask Hammerfall; he wrote it in his ledger. He marked me \"returned, partially dressed,\" an' the whole station's called me that since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Brokk. My patrol ends at the mouth o' Dun Algaz, where I stand a minute so the orcs can see I'm no' afraid o' them, an' then I walk back.", fx = { learn = { "dragonmaw" } } } },
      again = {
        { id = "h_again", text = "What else? Speak up, I've a pass tae walk." },
        { id = "h_again2", text = "Aye, out wi' it, an' if it's a challenge, my answer's aye." },
      },
      choices = {
        { text = "Fight the orcs on your captain's word, not your temper.", next = "BACK", reply = "Aye, aye, I know, though my temper's quicker than the Captain's word most days.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Charge into Dun Algaz alone, and let them tremble.", next = "BACK", reply = "Ha! I like ye, but I like breathin' more, an' so does the Captain.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How long have you walked this patrol?", next = "ybrok_long" },
        { text = "Do you hate the orcs, Brokk?", next = "ybrok_hate", when = { race = "Orc" } },
        { text = "Who is Gothor?", next = "ybrok_gothor" },
        { text = "You stand there on purpose?", next = "stand" },
        { text = "What are the Dragonmaw doing in Dun Algaz?", next = "orcs" },
        { text = "What's the closest you've come to dying on this road?", next = "w2_close" },
        { text = "Give them my regards.", next = "END" },
      },
    },
    stand = {
      lines = { { id = "s_default", text = "Every day, in plain sight, wi' my rifle grounded. An orc respects nothin' but nerve, an' the day a Mountaineer stops showin' his face at that tunnel is the day they start wonderin' what else we've stopped doin'." } },
      choices = {
        { text = "Has one ever come out to meet you?", next = "meet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meet = {
      lines = { { id = "m_default", text = "Two, last winter, an' I came home wi' one o' their axes an' a new part in my beard. Gothor hung the axe over his forge, an' I let him, for he mended the helmet that saved me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Sulkin', mostly. They were the terror o' Khaz Modan when they'd dragons tae ride, an' now they squat in dwarven tunnels they didnae dig an' raid the marsh road for scraps." } },
      choices = { { text = "A long fall for them. Something else.", next = "BACK" } },
    },
    ybrok_long = {
      lines = {
        { id = "yybrok_long_d", text = "Four years, since the day Rockgar asked for a volunteer an' my hand was up before he'd finished askin'. My brother was on the Thandol Span when the Dragonmaw still had their dragons, an' I reckon I owe him a look at their faces." },
      },
      choices = {
        { text = "What happened to your brother?", next = "ybrok_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybrok_brother = {
      narr = "He grips the strap of his rifle and does not look at you for a moment.",
      lines = {
        { id = "yybrok_brother_d", text = "Burned on the Span wi' half his company, back in the Second War, when the dragons came down out o' Grim Batol. I was too young tae march wi' him, an' I've never quite forgiven the years for it." },
      },
      choices = {
        { text = "Is that why you stand at the tunnel?", next = "ybrok_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybrok_why = {
      lines = {
        { id = "yybrok_why_d", text = "Partly, an' partly because somebody has tae. Rockgar says I'll stand there one day too long an' get an arrow for my trouble, an' he's likely right, but I'd sooner that than have the orcs think we've gone soft." },
      },
      choices = {
        { text = "Showing your face is the bravest thing on this road.", next = "BACK", reply = "Ha! Ye'd make a Mountaineer, {class}. Come stand wi' me some mornin'.", fx = { align = { honor = 1 } } },
        { text = "That's pride, not duty. Rockgar is right.", next = "BACK", reply = "Maybe so, an' maybe pride's all that's kept those orcs in their holes. I'll think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybrok_hate = {
      lines = {
        { id = "yybrok_hate_d", text = "Hate's a big word for what's left o' them, though I'll no' pretend I'd share a drink wi' a Dragonmaw. Ye're no' of their clan, an' I've heard Thrall's lot keep different ways, so mind yer road an' I'll mind mine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ybrok_gothor = {
      lines = {
        { id = "yybrok_gothor_d", text = "Gothor Brumn, our smith at the station, an' the only dwarf here who curses louder than me. He's mended every dent the orcs ever put in me, an' he says he'll charge double the day I come back wi' a hole he cannae fix." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    algaz_station = { { id = "tp_yalgaz_station", text = "Rockgar's station, wi' five rifles an' a smith between the orcs an' the loch. It holds, though." } },
    grim_batol = { { id = "tp_ygrim_batol", text = "The Dragonmaw's old hold, past the Wetlands. I'll see it burned clean one day, or my son will." } },
    background = { { id = "tp_bg", text = "I've the Dun Algaz patrol, an' I asked for it. Somebody ought tae look those orcs in the eye." } },
    dragonmaw = { { id = "tp_dm", text = "Dragon riders wi' nae dragons, hidin' in our tunnels. I show them my face every day." } },
    _none = { { id = "tp_none", text = "I've nae idea. If I cannae shoot it or shout at it, I leave it tae Rockgar." } },
  },
}

-- Mountaineer Dokkin: patrols the tunnel leading to the Wetlands.
P:NPC {
  key = "lm_mtn_dokkin", id = TODO_NPC("Mountaineer Dokkin"), name = "Mountaineer Dokkin", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "hushed", "steady" }, values = { "dutiful", "tradition" },
  notices = { "craft", "race" },
  impression = {
    first = "Mountaineer Dokkin patrols the tunnel toward the Wetlands with a hooded lantern, and he keeps his voice low out of long habit. He knows the passage by its echoes and stops mid-sentence to listen to them.",
    third = "{name} met Mountaineer Dokkin, who patrols the tunnel to the Wetlands.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "I know that step, an' it's a welcome one. Walk softly wi' me a while, friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Hush, an' pass. I'd sooner listen tae the tunnel than tae ye." },
    { id = "g_default", text = "Softly, friend, softly. Sound carries a long way in here, an' no' only tae dwarven ears." },
    { id = "g_back", when = { metBefore = true }, text = "I know that step. Welcome back tae the dark." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "Ye're a miner, so ye'll see it: look at the dressin' on that wall, every block true after all these years. They knew their trade, the dwarves who cut Dun Algaz." },
    { id = "n_tall", cat = "race", when = { race = { "Human", "NightElf" } },
      text = "Mind yer head on the lintels further in, tall one. They were cut for dwarves an' they've nae mercy." },
  },
  start = "hello",
  nodes = {
    w2_sound = {
      lines = {
        { id = "w2_sound_l0", text = "Singin', once, from somewhere below the main tunnel, where there's nae passage I know of. No' dwarf singin', nor orc. Low an' slow, like stone remembering a song." },
      },
      choices = {
        { text = "Did you go looking for it?", next = "w2_sound_look" },
        { text = "Probably water in the rock.", next = "BACK" },
      },
    },
    w2_sound_look = {
      lines = {
        { id = "w2_sound_look_l0", text = "Nae, an' I'm no' ashamed tae say it. I've walked this tunnel for twenty years by knowin' which sounds tae follow an' which tae walk away from, an' that one I walked away from quick." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Dokkin. I walk the tunnel, an' I listen while I walk, for in here ye'll hear trouble long before a lantern shows it tae ye." } },
      again = {
        { id = "h_again", text = "What else? Low, mind; the tunnel carries a voice further than ye'd think." },
        { id = "h_again2", text = "Hush a moment. Nae, it's only water. Go on." },
      },
      choices = {
        { text = "In the dark, everyone should follow the one who knows the way.", next = "BACK", reply = "Aye, softly an' in order, an' that's how folk come out the other end.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "I'd rather trust my own feet than any guide's lantern.", next = "BACK", reply = "Then I hope yer feet can hear, for the tunnel doesnae warn ye twice.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How did you come to the tunnel patrol?", next = "ydok_how" },
        { text = "Do the orcs ever hear you first?", next = "ydok_orc", when = { race = "Orc" } },
        { text = "Tell me about your lantern.", next = "ydok_lantern" },
        { text = "What do you listen for?", next = "listen" },
        { text = "These tunnels are dwarven work.", next = "work" },
        { text = "What's the strangest sound you've heard in here?", next = "w2_sound" },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "Iron on stone, for an orc cannae help draggin' his axe when the roof's low. Drippin' water keeps a steady time, so when the time's broken, somethin's standin' under the drip.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "And what do you do then?", next = "then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["then"] = {
      lines = { { id = "t_default", text = "I shutter the lantern an' stand still till it moves or I'm sure. I've stood an hour that way wi' an orc breathin' round the next bend, an' I think he was doin' the same as me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Aye, every yard, an' fine work it is. It shames me that orcs sleep in the side halls, for it was built as a road between dwarven lands an' it's a road we can barely keep open now." } },
      choices = { { text = "It'll be yours again one day. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ydok_how = {
      lines = {
        { id = "yydok_how_d", text = "I was a miner at the Ironband dig before the troggs, an' a miner learns tae listen tae the rock before it falls on him. When Rockgar asked who could walk the dark wi'out a lantern blazin', I was the only one who didnae laugh." },
      },
      choices = {
        { text = "You worked at Ironband's dig?", next = "ydok_dig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydok_dig = {
      lines = {
        { id = "yydok_dig_d", text = "Three seasons, wi' the Explorers' League diggin' for titan stone. Then the troggs came up out o' the deep places, an' we left our picks where they lay. I still dream o' that last shaft, an' I couldnae tell ye why." },
      },
      choices = {
        { text = "What do you think woke the troggs?", next = "ydok_woke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydok_woke = {
      narr = "He lowers the lantern hood a little further and speaks even more softly.",
      lines = {
        { id = "yydok_woke_d", text = "The diggin', I fear. We went deeper than the old maps said tae go, an' Ironband wouldnae stop because the stone kept gettin' stranger. I've wondered since if some places are best left shut, though the League would call that cowardice." },
      },
      choices = {
        { text = "Some things belong buried. You were right to fear it.", next = "BACK", reply = "Aye, I think so too. It's a comfort tae hear it said aloud.", fx = { align = { light = 1 } } },
        { text = "Knowledge is worth the risk. The League should dig on.", next = "BACK", reply = "Brave words, an' maybe true. Ye didnae hear the troggs comin' up, though.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydok_orc = {
      lines = {
        { id = "yydok_orc_d", text = "Now an' then, aye, for an orc has keen ears in the dark, keener than mine. Ye're no' Dragonmaw by the look o' ye, an' I'll no' shutter the lantern on ye, but ye'll understand if I keep my hand near my axe." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydok_lantern = {
      lines = {
        { id = "yydok_lantern_d", text = "It was my father's, from the coal pits under Dun Morogh, an' the hood's been mended so often there's little o' the first one left. It lights a dwarf's feet an' naught else, which is all a tunnel guard needs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ironband_excavation = { { id = "tp_yironband_excavation", text = "I dug there once. Now it's trogg country, an' I dinnae go near it." } },
    wetlands = { { id = "tp_ywetlands", text = "Wet, green an' full o' things that bite. I see the end o' my tunnel an' turn back gladly." } },
    background = { { id = "tp_bg", text = "I've walked this tunnel six years. I could do it blind, an' some nights I near enough do." } },
    dragonmaw = { { id = "tp_dm", text = "They keep tae the side halls. Listen for iron draggin' on stone." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. Little news finds its way in here." } },
  },
}

-- Mountaineer Naarh: Valley of Kings guard; stands beneath the statues.
P:NPC {
  key = "lm_mtn_naarh", id = TODO_NPC("Mountaineer Naarh"), name = "Mountaineer Naarh", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "solemn", "proud" }, values = { "tradition", "dutiful" },
  notices = { "race", "lore" },
  impression = {
    first = "Mountaineer Naarh stands guard in the Valley of Kings beneath the two great statues and holds himself as if he were a third. He speaks of the stone kings by name and lowers his voice when he does.",
    third = "{name} met Mountaineer Naarh, who guards the Valley of Kings beneath its statues.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back tae the valley, friend. The kings above stand a wee bit taller when good folk return." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Bow tae the kings, if ye've any respect left in ye, an' then go." },
    { id = "g_default", text = "Ye stand in the Valley o' Kings, traveller. Look up before ye go on, for they've earned that much from everyone who passes." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've returned tae the valley. They've no' moved, an' neither have I." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Welcome, {g:brother|sister}. Ye'll have been told o' this place as a bairn, as we all were, but it's another thing tae stand under them." },
    { id = "n_wild", cat = "lore", when = { origin = "dwarf_wildhammer_kin" },
      text = "Ye've Wildhammer blood, by yer look. Then one o' these is yer own thane's likeness, an' ye're twice welcome in the valley." },
  },
  start = "hello",
  nodes = {
    w2_disrespect = {
      lines = {
        { id = "w2_disrespect_l0", text = "Some. A gnome tried tae fix a lantern tae a king's knee last year, for the light, he said, an' a human lad carved his name in the plinth. I spoke tae both of them, at some length." },
      },
      choices = {
        { text = "What did you say to the gnome?", next = "w2_disrespect_gnome" },
        { text = "They deserved worse than talking.", next = "BACK", reply = "Perhaps, but I'm a guard o' kings, no' a king myself. Words are what I'm given tae use.", fx = { align = { order = 1 } } },
        { text = "A lantern harms no one. Let folk enjoy the place.", next = "BACK", reply = "The kings were lit by the sun for a thousand years before that gnome. They dinnae need his help.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_disrespect_gnome = {
      lines = {
        { id = "w2_disrespect_gnome_l0", text = "That the king he was hangin' his lantern on had held these hills against trolls when the gnomes still lived in burrows. He took it down an' bowed, very low, an' I think he meant it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Naarh. Other guards keep a gate or a road, an' I keep the feet o' kings, which I hold tae be the highest post in Loch Modan." } },
      again = {
        { id = "h_again", text = "Ask what else ye will." },
        { id = "h_again2", text = "Aye, go on, traveller." },
      },
      choices = {
        { text = "We honour the old kings by keeping their laws.", next = "BACK", reply = "Well said. Their stone faces watch us still, an' I like tae think they approve.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Dead kings shouldn't rule the living. Let the old laws crumble.", next = "BACK", reply = "Watch yer tongue under their gaze, for stone remembers, an' so do I.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What happened between Bronzebeard and Wildhammer?", next = "ynaa_war" },
        { text = "I'm of Wildhammer blood. Tell me of my thane.", next = "ynaa_wild", when = { race = "Dwarf" } },
        { text = "Why did you ask for this post?", next = "ynaa_nine" },
        { text = "Who are the statues?", next = "who" },
        { text = "What do you guard them from?", next = "from" },
        { text = "Do travellers ever show the statues disrespect?", next = "w2_disrespect" },
        { text = "I'll pay my respects.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Madoran Bronzebeard an' Khardros Wildhammer, the two thanes who stood together when the clans broke an' the Dark Irons turned on their own kin. Their sons raised them here, facin' the pass, so that nae dwarf would forget what that war cost.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "A warning to the Dark Irons, then.", next = "warning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warning = {
      lines = { { id = "wa_default", text = "A warnin' tae them an' a reminder tae us, an' I think the second matters more. Bronzebeard an' Wildhammer havenae always been easy neighbours, an' it does nae harm tae see them shoulder tae shoulder in stone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    from = {
      lines = { { id = "f_default", text = "From troggs, who've nae more reverence than the rocks they crawled from, an' who'd foul the plinths if we let them near. Captain Rugelfuss holds them west o' the valley, an' I stand here in case he cannae.", fx = { learn = { "troggs" } } } },
      choices = { { text = "May it never come to that. Something else.", next = "BACK" } },
    },
    ynaa_war = {
      lines = {
        { id = "yynaa_war_d", text = "When Modimus Anvilmar died, the three clans fought for the throne in Ironforge, an' the Bronzebeards won it. The Wildhammers went north tae Grim Batol an' the Dark Irons went south an' sulked, an' then they struck at both." },
      },
      choices = {
        { text = "And the two thanes stood together?", next = "ynaa_stood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynaa_stood = {
      lines = {
        { id = "yynaa_stood_d", text = "Against the Dark Irons, aye, outside Thaurissan's walls, an' they broke them. Then the sorcerer Thaurissan called up somethin' in his fury that burned the Searing Gorge an' made the Burning Steppes, an' that was the end o' the war." },
      },
      choices = {
        { text = "Do you think the clans will unite again?", next = "ynaa_unite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynaa_unite = {
      narr = "Naarh looks up at the two great faces as if waiting for one of them to answer first.",
      lines = {
        { id = "yynaa_unite_d", text = "I hope for it every day I stand here. The Wildhammers in the Hinterlands still call us soft, an' there's Bronzebeards who call them savages, an' the kings above us would be ashamed o' both. One day it'll take another war tae bring us together." },
      },
      choices = {
        { text = "Unity is worth any price. Your kings would want it.", next = "BACK", reply = "Aye. That's what I believe, an' what I'll tell any dwarf who passes here.", fx = { align = { honor = 1 } } },
        { text = "The clans chose their roads. Respect their choices.", next = "BACK", reply = "Perhaps. But the kings chose one road together, an' that's why we stand here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynaa_wild = {
      lines = {
        { id = "yynaa_wild_d", text = "Khardros Wildhammer, who led yer folk tae Grim Batol an' made it the greatest hold in the north, till the Dark Irons' curse drove ye out. Look on him well, for there's nae finer likeness o' him in all o' Khaz Modan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ynaa_nine = {
      lines = {
        { id = "yynaa_nine_d", text = "Because I was born in the shadow o' these statues, in a farmstead that's gone now, an' my father brought me here every year on the day o' the kings' victory. I promised him I'd guard them when he couldnae, an' I keep my promises." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    valley_of_kings = { { id = "tp_yvalley_of_kings", text = "The valley where the two kings stand watch. I'll guard it till the stone wears away." } },
    bronzebeard = { { id = "tp_ybronzebeard", text = "The clan o' the King in Ironforge. Madoran was the first o' them tae rule there." } },
    background = { { id = "tp_bg", text = "I asked for this post an' I've held it nine years. I'd ask for nae other." } },
    dark_iron = { { id = "tp_di", text = "The kings above us stood against them once. We stand here still." } },
    troggs = { { id = "tp_tr", text = "Beasts wi' nae respect for stone that's been worked. They'll no' touch the kings while I draw breath." } },
    _none = { { id = "tp_none", text = "That's beyond my post, traveller. Ask in Thelsamar." } },
  },
}

-- Mountaineer Tyraw: Valley of Kings; bored gate hand, hungry for word of Ironforge.
P:NPC {
  key = "lm_mtn_tyraw", id = TODO_NPC("Mountaineer Tyraw"), name = "Mountaineer Tyraw", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "bored", "friendly" }, values = { "dutiful", "comfort" },
  notices = { "race", "greenness" },
  impression = {
    first = "Mountaineer Tyraw stands his watch in the Valley of Kings and is plainly bored by it. He brightens at anyone coming up from Dun Morogh and wants to know what is being served in Ironforge's taverns.",
    third = "{name} met Mountaineer Tyraw, a guard in the Valley of Kings who misses Ironforge.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's yerself, thank the stone! I've been bored half tae death, so give me some news before I start talkin' tae the statues." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd sooner be bored wi' the statues than talk wi' ye." },
    { id = "g_default", text = "Somebody new, thank the stone! Ye've come up from Dun Morogh, I hope, wi' a bit o' news on ye?" },
    { id = "g_back", when = { metBefore = true }, text = "It's yerself! Sit a moment, or stand a moment anyway, an' tell me somethin'." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll be lodgin' in Tinker Town, then. Is it true ye've a machine in there that toasts bread on both sides at once?" },
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "First time through the gate, is it? Ye'll do fine, an' ye've picked a bonny day tae see the loch." },
  },
  start = "hello",
  nodes = {
    w2_hours = {
      lines = {
        { id = "w2_hours_l0", text = "I count the stones in the left king's beard, which is three hundred an' twelve, or three hundred an' fourteen, dependin' on the light. Then I count them again tae be sure, an' then it's lunch." },
      },
      choices = {
        { text = "That sounds dreadful.", next = "w2_hours_lunch" },
        { text = "Patience is a soldier's best weapon.", next = "BACK" },
      },
    },
    w2_hours_lunch = {
      lines = {
        { id = "w2_hours_lunch_l0", text = "It is, an' lunch is worse, for it's whatever Kalmir's shot an' Naarh's cooked, an' Naarh cooks like he's makin' an offerin' tae the stone. Ye've no' lived till ye've eaten boar burnt in reverence." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Tyraw. I was Ironforge garrison till the spring, an' now I guard a valley where the liveliest thing is two statues, an' they dinnae say much." } },
      again = {
        { id = "h_again", text = "What else? Dinnae rush off." },
        { id = "h_again2", text = "Aye, go on, I've all day, more's the pity." },
      },
      choices = {
        { text = "Every post matters, even a quiet valley like this one.", next = "BACK", reply = "Aye, I suppose it does, though I'd swap it for the gates o' Ironforge in a heartbeat.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Ask for a transfer. Nobody should rot in a dull post.", next = "BACK", reply = "I've asked twice, friend, an' the Captain laughed both times.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you have family back in Ironforge?", next = "ytyr_family" },
        { text = "Tinker Town does have a double toaster.", next = "ytyr_gnome", when = { race = "Gnome" } },
        { text = "What were the troggs like up close?", next = "ytyr_troggs" },
        { text = "What do you miss about Ironforge?", next = "miss" },
        { text = "Is the valley really so dull?", next = "dull" },
        { text = "The Great Forge was burning bright when I left.", next = "forge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "How do you pass the hours on watch here?", next = "w2_hours" },
        { text = "Bear up, Tyraw.", next = "END" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "The noise, would ye believe, an' the heat o' the Great Forge on yer face when ye come in from the snow. Out here it's wind an' birdsong, an' a dwarf wasnae made for birdsong." } },
      choices = {
        { text = "Why were you sent out here?", next = "sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Tae fill a gap, when Loch Modan's own Mountaineers were sent tae the front. I didnae complain, for it was the King's order, but I count the days, an' I'm up tae a hundred an' six." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "d_default", text = "It's dull till it isnae, {g:lad|lass}. A pack o' troggs came down the west slope a fortnight back, an' for a quarter hour I'd have given a month's pay tae be bored again.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Careful what you wish for. Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "f_default", text = "Was it? Ah, ye've done me good just sayin' so. I can near enough feel it, an' I'll thank ye for that when the wind gets up tonight." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ytyr_family = {
      lines = {
        { id = "yytyr_family_d", text = "A sweetheart, Brenna, who works the bellows at the Great Forge an' writes me every week, though the letters take a fortnight tae reach the valley. She says I'm missin' nothin', an' I know she's lyin' because she's kind." },
      },
      choices = {
        { text = "Will you marry her when you're home?", next = "ytyr_marry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytyr_marry = {
      narr = "Tyraw grins and pats the breast of his tunic, where something small and square sits over his heart.",
      lines = {
        { id = "yytyr_marry_d", text = "I've the ring already, bought off a Commons jeweller wi' three months' pay. I meant tae ask before I was sent out, but I lost my nerve, an' now I'm stuck under two stone kings wi' a ring an' nae nerve at all." },
      },
      choices = {
        { text = "Why not ask her by letter?", next = "ytyr_letter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytyr_letter = {
      lines = {
        { id = "yytyr_letter_d", text = "I've thought on it, believe me, an' I've written it twice an' burned it twice. A proper dwarf asks face tae face, my da says, but a fortnight's post an' a hundred days left on my loan make for a long wait." },
      },
      choices = {
        { text = "Ask her face to face. She deserves that.", next = "BACK", reply = "Aye, ye're right, an' so's my da. A hundred days, then, an' I'll practise on the statues.", fx = { align = { honor = 1 } } },
        { text = "Write the letter. Life's too short to wait.", next = "BACK", reply = "Ye know, ye might be right. I'll write it tonight, an' maybe no' burn this one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytyr_gnome = {
      lines = {
        { id = "yytyr_gnome_d", text = "I knew it! I told Naarh an' he said nae machine could toast both sides wi'out burnin' the middle, an' he's been smug about it for a month. I owe ye a pint for that, friend, when I'm next near an inn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytyr_troggs = {
      lines = {
        { id = "yytyr_troggs_d", text = "Like a pack o' rats wi' rocks in their fists, an' about as clever, but there's a lot o' them an' they dinnae fear dyin'. Naarh stood like a wall an' I stood beside him, an' it was the best quarter hour o' my posting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    great_forge = { { id = "tp_ygreat_forge", text = "The heart o' Ironforge, an' the warmest place in the world. Brenna works the bellows there." } },
    valley_of_kings = { { id = "tp_yvalley_of_kings", text = "A grand place tae stand, if ye like quiet. I dinnae, much." } },
    background = { { id = "tp_bg", text = "Ironforge garrison, on loan tae the valley. A hundred an' six days, an' countin'." } },
    troggs = { { id = "tp_tr", text = "They liven the place up, I'll say that, an' I'd sooner they didnae." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, I'm new here myself. Ask Naarh, he's been stood under those statues for years." } },
  },
}

-- Mountaineer Kalmir: patrols the Valley of Kings; a tracker.
P:NPC {
  key = "lm_mtn_kalmir", id = TODO_NPC("Mountaineer Kalmir"), name = "Mountaineer Kalmir", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "keen", "terse" }, values = { "dutiful", "nature" },
  notices = { "class", "pet" },
  impression = {
    first = "Mountaineer Kalmir patrols the Valley of Kings with her eyes on the ground more than the hills. She reads tracks the way a clerk reads a ledger and reports what she finds to the Captain without decoration.",
    third = "{name} met Mountaineer Kalmir, who tracks trogg sign through the Valley of Kings.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Saw yer prints by the gate an' knew ye'd come. Welcome back, an' mind that rock there." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Yer tracks are all over my valley floor. Try tae keep tae the path for once." },
    { id = "g_default", text = "Mind where ye put yer feet, {class}. There's a set o' prints by that rock I've no' finished wi' yet." },
    { id = "g_back", when = { metBefore = true }, text = "I saw yer tracks by the gate an' thought it was ye. Ye favour the right leg." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've been lookin' at the same prints I have. Tell me what ye make o' them before I say, for I'd like a second opinion." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} off the west verge, if ye would. One good set o' paw prints over the top an' I've lost a mornin's readin'." },
  },
  start = "hello",
  nodes = {
    w2_trogtrack = {
      lines = {
        { id = "w2_trogtrack_l0", text = "That they're comin' from the south, no' the dig, an' in bigger bands than last year. Three weeks ago I found a print bigger than any trogg I've seen, an' it wasnae alone." },
      },
      choices = {
        { text = "Bigger? How much bigger?", next = "w2_trogtrack_big" },
        { text = "Then the captain should hear it.", next = "BACK" },
      },
    },
    w2_trogtrack_big = {
      lines = {
        { id = "w2_trogtrack_big_l0", text = "Half again, with a deeper heel, like somethin' carryin' a weight or wearin' one. I sketched it for the Captain an' he pinned it tae his wall, which is where my sketches go tae be forgotten." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Kalmir. I walk the valley floor an' read what's crossed it in the night, an' the Captain decides what tae do about it." } },
      again = {
        { id = "h_again", text = "What else? I'm losin' the light on these." },
        { id = "h_again2", text = "Go on, but keep tae the stones while ye talk; ye're near the prints." },
      },
      choices = {
        { text = "A tracker reports what she finds and lets the captain decide.", next = "BACK", reply = "Aye, that's the right way of it. I read the ground, an' he reads the war.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "If you've found the trogg's trail, follow it yourself.", next = "BACK", reply = "An' if I did, there'd be one less tracker an' one well-fed trogg.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why did you leave Dun Morogh's boar for this?", next = "ykal_why" },
        { text = "A hunter wants to know the valley's game.", next = "ykal_hunter", when = { class = "HUNTER" } },
        { text = "Have you found anything that wasn't a trogg?", next = "ykal_boot" },
        { text = "What crossed it last night?", next = "last" },
        { text = "How do you tell a trogg's track?", next = "track" },
        { text = "Three troggs, one limping, heading west.", next = "read", when = { class = "HUNTER" } },
        { text = "What do the tracks tell you about the troggs lately?", next = "w2_trogtrack" },
        { text = "Good hunting, Mountaineer.", next = "END" },
      },
    },
    last = {
      lines = { { id = "l_default", text = "Five troggs, down from the western slope tae within a stone's throw o' the south tower, an' then back the way they came. They didnae take anythin' an' they didnae fight, which means they came tae look.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "To look at what?", next = "look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "lo_default", text = "At how many of us there are, I'd say, an' where we stand after dark. I've told Captain Rugelfuss, an' he's moved the night watch about, so that they'll count a different number next time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    track = {
      lines = { { id = "t_default", text = "Wide, flat an' turned in at the toe, wi' the knuckle marks beside it where they lean on their hands. A trogg carryin' somethin' heavy leaves the knuckles off, an' those are the tracks I follow first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    read = {
      lines = { { id = "r_default", text = "Four, for one's steppin' in another's prints, but ye've the limp an' the headin' right, an' that's better than most Mountaineers manage. Ye'd be wasted anywhere but on a trail." } },
      choices = { { text = "Four. I'll look closer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ykal_why = {
      lines = {
        { id = "yykal_why_d", text = "Because the boar never meant me harm, an' the troggs do. I tracked tae feed my family once, but when the Stonesplinters came up I found I'd rather track tae keep families fed, an' this valley's fed half o' Loch Modan for centuries." },
      },
      choices = {
        { text = "Are the troggs getting cleverer?", next = "ykal_clever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_clever = {
      narr = "She crouches and lays two fingers lightly in an old print.",
      lines = {
        { id = "yykal_clever_d", text = "No' cleverer, but better led. These prints walk in a line now, wi' one set out ahead an' back again, like a scout reportin'. Troggs never did that before, an' somethin' is teachin' them, or somebody." },
      },
      choices = {
        { text = "What does the Captain think?", next = "ykal_captain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_captain = {
      lines = {
        { id = "yykal_captain_d", text = "Rugelfuss thinks I read too much intae mud, an' he's said so kindly, but he moved the watch all the same. I'd like him tae send a party over the ridge tae see who's leadin' them, but he says the valley cannae spare the rifles." },
      },
      choices = {
        { text = "The Captain's right. Keep the rifles home.", next = "BACK", reply = "Aye, he's the Captain an' I'm a tracker. I'll keep readin' the mud.", fx = { align = { order = 1 } } },
        { text = "Strike first. Find their leader before they come.", next = "BACK", reply = "That's what I'd do, if the green on my shoulder were a captain's.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_hunter = {
      lines = {
        { id = "yykal_hunter_d", text = "Boar an' bear on the eastern slopes, an' mountain buzzards circlin' over the old mine heads. Leave the crocolisks by the loch tae the Farstriders, for they'll take yer arm if ye misread the water." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ykal_boot = {
      lines = {
        { id = "yykal_boot_d", text = "A boot print, once, among the trogg tracks, hobnailed an' too small for a man. I've only seen it the once, an' I've no' told the Captain, for I couldnae swear tae it in the light I had." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    valley_of_kings = { { id = "tp_yvalley_of_kings", text = "A grand place tae stand guard, an' a grand place tae read tracks, for the floor's soft an' honest." } },
    dun_morogh = { { id = "tp_ydun_morogh", text = "Snow tracks are the easiest in the world. I miss them, some mornin's." } },
    background = { { id = "tp_bg", text = "I tracked boar in Dun Morogh before I took the green. Troggs are easier, an' I like them less." } },
    troggs = { { id = "tp_tr", text = "They've started scoutin' us. That's new, an' I dinnae like new in a trogg." } },
    _none = { { id = "tp_none", text = "Cannae say. It's left nae tracks where I walk." } },
  },
}

-- Mountaineer Zaren: patrols from the Valley of Kings to the crossroad to the north.
P:NPC {
  key = "lm_mtn_zaren", id = TODO_NPC("Mountaineer Zaren"), name = "Mountaineer Zaren", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "lively", "competitive" }, values = { "dutiful", "strong" },
  notices = { "travel", "race" },
  impression = {
    first = "Mountaineer Zaren patrols from the Valley of Kings to the crossroad north of it and seems to be racing someone only she can see. She is quick, cheerful and a little out of breath, and she keeps her best times scratched on her rifle stock.",
    third = "{name} met Mountaineer Zaren, who patrols from the Valley of Kings to the northern crossroad.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye again! I've beaten the shadow twice this week, an' I'll race ye tae the crossroad if ye've the legs." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll no' lose a step on yer account, so talk while I walk." },
    { id = "g_default", text = "Hello! Talk fast, friend, for I'm a hundred paces ahead o' yesterday an' I mean tae keep it." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! I beat my best tae the crossroad since I saw ye, by a good forty breaths." },
  },
  notice = {
    { id = "n_nelf", cat = "travel", when = { race = "NightElf" },
      text = "Look at the legs on ye! I'd no' race ye for money, elf, but I'd dearly like tae see ye take the hill tae the crossroad." },
  },
  start = "hello",
  nodes = {
    w2_fast = {
      lines = {
        { id = "w2_fast_l0", text = "My grandmother, an' I'm no' jokin'. She ran messages between Ironforge an' Thelsamar in the Second War, an' she says she outran an orc wolf-rider once, though the rider was drunk an' so was the wolf." },
      },
      choices = {
        { text = "Is she still running?", next = "w2_fast_gran" },
        { text = "Everyone's grandmother outran an orc, it seems.", next = "BACK" },
      },
    },
    w2_fast_gran = {
      lines = {
        { id = "w2_fast_gran_l0", text = "She walks tae the inn an' back each day, slower than she likes, an' she times me on my patrol from her window. If I'm late, I hear about it at supper." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Zaren. I've the road from the valley up tae the crossroad, an' I walk it against the sun, tae see if I can be there an' back before the shadow leaves the west tower." } },
      again = {
        { id = "h_again", text = "What else? Quick now!" },
        { id = "h_again2", text = "Aye, go on, I can spare ye a breath, maybe two if ye're quick." },
      },
      choices = {
        { text = "A patrol should be steady, not a race against the sun.", next = "BACK", reply = "Ach, ye sound like my sergeant, but I'm just as watchful at a run, I promise ye.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Run your patrol however you like. The road doesn't care.", next = "BACK", reply = "Exactly, an' the troggs cannae catch what they cannae keep up with!", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Have you always been a runner?", next = "yzar_runner" },
        { text = "Race me to the crossroad, then.", next = "yzar_race", when = { race = "NightElf" } },
        { text = "What happened with the boulder?", next = "yzar_boulder" },
        { text = "Why race your own patrol?", next = "race" },
        { text = "What's at the crossroad?", next = "cross" },
        { text = "Who's the fastest dwarf you know?", next = "w2_fast" },
        { text = "Don't let me slow you.", next = "END" },
      },
    },
    race = {
      lines = { { id = "r_default", text = "Because a patrol that comes by at the same hour every day is a patrol the troggs can set their supper by. If I'm early one day an' earlier the next, they never know when I'm due, an' it keeps my legs from goin' tae sleep." } },
      choices = {
        { text = "Has it ever caught them out?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "Twice! I came round the bend a quarter hour early an' found three o' them rollin' a boulder ontae the road, an' ye've never seen troggs look so put out. Greishan Ironstove was just behind me wi' his bread, an' he's called me his escort ever since.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cross = {
      lines = { { id = "x_default", text = "A signpost an' a choice: north tae Thelsamar, or east round the south shore toward the dig an' the lodge. Droken has the Thelsamar road from there, an' I hand folk on tae him like a parcel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yzar_runner = {
      lines = {
        { id = "yyzar_runner_d", text = "Since I was a bairn in Kharanos, racin' my brothers tae the top o' the hill an' back. I never once beat the eldest, an' he went off wi' the Reserve this spring, so I race the sun instead, which is a fairer match." },
      },
      choices = {
        { text = "Do you miss your brother?", next = "yzar_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzar_brother = {
      narr = "For once Zaren slows, and her breath comes a little ragged.",
      lines = {
        { id = "yyzar_brother_d", text = "More than I'll say tae his face when he's home. He's at the Alliance front somewhere north o' Arathi, an' his letters stopped a month back. The Captain says the post is slow, an' I run faster so I dinnae have tae think about it." },
      },
      choices = {
        { text = "What if the news is bad?", next = "yzar_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzar_bad = {
      lines = {
        { id = "yyzar_bad_d", text = "Then I'll run tae Ironforge an' back in a day an' a night, for there'll be nothin' else tae do wi' my legs. My mother says I should stop racin' an' sit wi' her, but I cannae sit still, I never could." },
      },
      choices = {
        { text = "Sit with your mother. Grief shared is lighter.", next = "BACK", reply = "Aye, maybe she needs me more than I need the road. I'll go tonight.", fx = { align = { light = 1 } } },
        { text = "Keep running. Everyone grieves their own way.", next = "BACK", reply = "Thank ye. That's what I needed tae hear, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yzar_race = {
      lines = {
        { id = "yyzar_race_d", text = "Ha! I'd lose, an' I know it, but I'd like tae see the look on Droken's face when an elf comes bargin' past him wi' me pantin' behind. Off ye go, then, an' I'll catch ye up, eventually." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yzar_boulder = {
      lines = {
        { id = "yyzar_boulder_d", text = "Three troggs rollin' it like bairns wi' a snowball, an' when they saw me they dropped it on their own feet an' ran. I laughed so hard I couldnae fire, an' Droken's no' let me forget it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kharanos = { { id = "tp_ykharanos", text = "Where I learned tae run. My mother's still there, waitin' for news." } },
    alliance_front = { { id = "tp_yalliance_front", text = "Somewhere north. My brother's there, an' I'm here, runnin'." } },
    background = { { id = "tp_bg", text = "I've the valley road, an' the best time on it, an' I'll race any Mountaineer who says otherwise." } },
    troggs = { { id = "tp_tr", text = "They watch for regular habits. So I havenae any." } },
    _none = { { id = "tp_none", text = "Dinnae know, an' I cannae stop tae wonder! Ask Droken up the road." } },
  },
}

-- Mountaineer Veek: patrols from the Valley of Kings to the South Gate Pass.
P:NPC {
  key = "lm_mtn_veek", id = TODO_NPC("Mountaineer Veek"), name = "Mountaineer Veek", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "unhurried", "kindly" }, values = { "dutiful", "patient" },
  notices = { "greenness", "race" },
  impression = {
    first = "Mountaineer Veek walks the road between the Valley of Kings and the South Gate Pass with a pipe in his teeth and no visible hurry. He has seen a great many young dwarves and gnomes come through that pass for the first time and remembers a surprising number of them.",
    third = "{name} met Mountaineer Veek, who patrols between the Valley of Kings and the South Gate Pass.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, I remember ye well, an' ye stand a wee bit taller every time ye come back. Welcome, friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. The view's still fine, but I'll enjoy it on my own today." },
    { id = "g_default", text = "Good day tae ye. Take yer time on this stretch, for the view o' the valley's the best ye'll get, an' it's only once ye see it for the first time." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I remember ye. Ye've a few more miles on ye than when I saw ye last, an' they suit ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Well now, look at ye! Ye came up this road a pup, an' ye've grown intae somethin' the troggs ought tae worry about." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "First time out o' Dun Morogh, unless I miss my guess. Ye'll be wantin' Thelsamar, straight on past the statues, an' ye'll want tae be there before dark." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another o' the wee folk headin' out intae the world. I've seen a good many o' ye pass since Gnomeregan, an' ye all walk like ye've somethin' tae prove." },
  },
  start = "hello",
  nodes = {
    w2_changed = {
      lines = {
        { id = "w2_changed_l0", text = "When I was a lad, there was nae Thelsamar inn worth the name, an' the troggs were a story tae frighten bairns. Now the inn's the best on the loch an' the troggs are real, so the world's given an' taken about even." },
      },
      choices = {
        { text = "Do you think it'll get worse?", next = "w2_changed_worse" },
        { text = "The world always balances out.", next = "BACK" },
      },
    },
    w2_changed_worse = {
      narr = "He takes the pipe from his teeth and looks at the stem for a while.",
      lines = {
        { id = "w2_changed_worse_l0", text = "Aye, I do, but I'm old an' that's what old dwarves think. The young ones comin' up this road look strong enough tae make me wrong, an' I hope they do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Veek. I've the road from the valley back tae the South Gate Pass, where the tunnel comes through from Dun Morogh, an' I've had it longer than some o' the stones have been laid." } },
      again = {
        { id = "h_again", text = "What else, then? There's nae rush." },
        { id = "h_again2", text = "Aye, go on, I've a pipe tae finish anyway." },
      },
      choices = {
        { text = "Even a quiet road needs a guard who keeps his post.", next = "BACK", reply = "Aye, it does, an' I'm content tae be that guard, for the valley keeps me company.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Wander off the road now and then. See the valley properly.", next = "BACK", reply = "Ach, I've seen it, friend, an' the road's where I'm needed most.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Tell me about the pipe.", next = "yvee_pipe" },
        { text = "I'm young. What should I know about the road?", next = "yvee_young", when = { maxLevel = 12 } },
        { text = "Tell me about the South Gate Pass.", next = "yvee_pass" },
        { text = "You must see everyone who comes through.", next = "everyone" },
        { text = "Is there trouble on this stretch?", next = "trouble" },
        { text = "What's changed on this road since you were young?", next = "w2_changed" },
        { text = "Good day, Mountaineer.", next = "END" },
      },
    },
    everyone = {
      lines = { { id = "e_default", text = "Every one, an' most o' them at a run, wi' their kit all new an' their eyes on the statues instead o' the road. I tell them all the same thing, tae look down now an' then, an' I think perhaps one in ten hears me." } },
      choices = {
        { text = "Do you remember the ones who come back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "I do, an' I remember the ones who dinnae, which is the harder list. It's why I stop them a moment on their way through, for a word costs me nothin' an' it's saved a life or two." } },
      choices = { { text = "It's a good custom. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Little enough, this close tae the pass. A wolf follows the tunnel through from the snow now an' then, an' the troggs keep further north, where Kalmir an' the Captain have their hands full.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yvee_pipe = {
      lines = {
        { id = "yyvee_pipe_d", text = "It was my wife's, would ye believe, for she smoked like a forge an' laughed like one too. She's been in the ground six years now, an' I light it every mornin' on this road because she'd have liked the view." },
      },
      choices = {
        { text = "I'm sorry. What was her name?", next = "yvee_wife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yvee_wife = {
      narr = "Veek takes the pipe from his teeth and turns it over slowly in his fingers.",
      lines = {
        { id = "yyvee_wife_d", text = "Rhona, an' she was the finest brewer in Kharanos till the fever took her in the cold winter. I asked for this road after, because the house was too quiet an' the road's never quiet for long." },
      },
      choices = {
        { text = "Do you think of going back to Kharanos?", next = "yvee_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yvee_back = {
      lines = {
        { id = "yyvee_back_d", text = "My son wants me tae, for he's opened her brewery again an' says it needs an old dwarf tae taste the ale. But I've a road here, an' young folk who need tellin' tae keep their heads, an' I'm no' sure he needs me more than they do." },
      },
      choices = {
        { text = "Go home. Your son needs his father.", next = "BACK", reply = "Aye, maybe he does. I'll write him tonight, an' see what the pipe says.", fx = { align = { honor = 1 } } },
        { text = "Stay on the road. The young ones need you more.", next = "BACK", reply = "That's what I tell myself, every mornin'. It's good tae hear somebody agree.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yvee_young = {
      lines = {
        { id = "yyvee_young_d", text = "Keep tae the road, keep a light pack an' a full waterskin, an' dinnae fight anythin' bigger than ye unless ye've a friend wi' ye. An' come back this way when ye're done, so I can see what ye've become." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yvee_pass = {
      lines = {
        { id = "yyvee_pass_d", text = "The South Gate tunnel, back tae Dun Morogh, cut by the old masons for the trade wagons. It's dry an' safe an' well-lit, which is more than I can say for the north one, so be glad ye came this way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kharanos = { { id = "tp_ykharanos", text = "My old town, in Dun Morogh. My son keeps the brewery there now." } },
    south_gate_pass = { { id = "tp_ysouth_gate_pass", text = "The tunnel from Dun Morogh. Dry an' safe, an' I've walked it more times than I can count." } },
    background = { { id = "tp_bg", text = "I've walked the South Gate road since before the last war. I mean tae walk it till my pipe goes out for good." } },
    troggs = { { id = "tp_tr", text = "North an' west o' my stretch, thank the stone. Ask the Captain." } },
    _none = { { id = "tp_none", text = "I couldnae say, {g:lad|lass}. I know my road, an' the faces on it, an' that's my lot." } },
  },
}
