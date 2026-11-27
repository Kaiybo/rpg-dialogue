-- The loch's edges: the Deepwaters on the western bank, and Mountaineer Pebblebitty at the Searing Gorge gate in the Valley of Kings. Voice: bibles/loch_edges.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Warg Deepwater: fishing trainer on the western bank.
P:NPC {
  key = "lm_warg", id = TODO_NPC("Warg Deepwater"), name = "Warg Deepwater",
  bible = "bibles/loch_edges.md", role = "trainer", tier = "service",
  communities = { "thelsamar" }, temper = { "calm", "dry" }, values = { "patient", "practical" },
  notices = { "craft", "class" },

  impression = {
    first = "He measures time in bites rather than hours.",
    third = "{name} met Warg Deepwater, who teaches fishing on the western shore of Loch Modan.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good, you're back. I've been looking forward to seeing how far you've come." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Train if you must, and spare me the conversation." },
    { id = "g_default", text = "Shh, friend, for they're bitin'. I'm Warg Deepwater, an' if ye've come tae learn fishin', sit down an' be quiet, for that's the first lesson." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Sit, then, an' tell me what ye caught, an' I'll tell ye what ye did wrong." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Mornin'. Best hour on the loch, this, before the wind comes up an' the mountaineers start shoutin' on the road." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "Ye've a fisher's squint, an' a line burn on yer thumb. Good; that means ye've had somethin' worth pullin'." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, an' ye'll think fishin' is huntin' wi' a string. It isnae, for here the patience is the whole o' it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I teach fishin' here on the bank, an' my sister Khara sells the tackle, so between us there's no excuse for anyone tae go hungry on the loch. The water's deep an' cold an' full o' good eatin', if ye've the patience." },
        { id = "h_rain", when = { timeOfDay = "night" },
          text = "Night fishin', is it? The big ones come up when the light goes, but so does the cold, so I hope ye've brought a cloak." },
      },
      again = {
        { id = "h_again", text = "What else? Keep yer voice down, mind." },
        { id = "h_again2", text = "Go on, then, quiet-like. The fish have ears, whatever the scholars say." },
      },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'd like to learn.", next = "BUSINESS" },
        { text = "What's in the loch?", next = "loch" },
        { text = "What's the secret to fishing?", next = "secret" },
        { text = "Tell me about Khara.", next = "khara" },
        { text = "Good day, Warg.", next = "END" },
      },
    },
    loch = {
      lines = {
        { id = "lo_default", text = "Trout an' perch near the shore, an' bigger things further out, where it's deep enough that nobody's ever found the bottom. The dam made the loch, an' the loch filled the valley, an' what lives down there now was here before either." },
      },
      choices = {
        { text = "What lives at the bottom?", next = "loch_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loch_deep = {
      lines = {
        { id = "ld_default", text = "Old houses, they say, an' a road, from before the valley was flooded. I've pulled up a door hinge once, rusted through, an' I hung it over my hearth, for I couldnae bring myself tae throw it back." },
      },
      choices = {
        { text = "Leave the drowned houses in peace.", next = "BACK", reply = "Aye, that's my thinkin', an' I hung the hinge on my door as a kind o' apology. Whoever lived down there deserves tae sleep.", fx = { align = { light = 1 } } },
        { text = "Dive down and see what's left.", next = "BACK", reply = "Dive? In that cold? Ye'd come up blue an' wi' nothin' but weed. Go on, though, an' tell me what's down there if ye find it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonewrought_dam" } } },
      },
    },
    secret = {
      lines = {
        { id = "se_default", text = "There's no secret, only sittin' still longer than ye think ye can, an' then a wee bit longer. Most folk quit just before the fish decides tae trust them." },
      },
      choices = {
        { text = "Patience wins in the end.", next = "BACK", reply = "It does, an' ye've the makin's o' a proper fisher for knowin' it. Sit down an' I'll show ye how long a wee bit longer is.", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "I'd rather try a new spot every hour.", next = "BACK", reply = "Every hour? Ye'll spend more time walkin' than fishin', an' the fish will laugh at ye from every spot ye leave.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    khara = {
      lines = {
        { id = "kh_default", text = "My sister, an' the busy one o' the two of us. She sells the hooks an' the lures an' the fish food, an' runs about all day while I sit, an' she says it's no' fair, an' she's right." },
      },
      choices = {
        { text = "Why don't you help her?", next = "khara_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khara_help = {
      lines = {
        { id = "kh2_default", key = true, text = "I tried, once, an' I sold a lure for half what she paid for it. She's banned me from the counter ever since, an' I cannae say I'm sorry." },
      },
      choices = {
        { text = "Everyone should stick to what they're good at.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born on this bank, an' I mean tae die on it, wi' a rod in my hand if I've any say." } },
    advice = { { id = "tp_ad", text = "Sit still. Most things in life go better if ye sit still a moment first." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. Ask me about fish." } },
  },
}

-- Khara Deepwater: fishing supplies on the western bank.
P:NPC {
  key = "lm_khara", id = TODO_NPC("Khara Deepwater"), name = "Khara Deepwater",
  bible = "bibles/loch_edges.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "brisk", "warm" }, values = { "practical", "friendly" },
  notices = { "craft" },

  impression = {
    first = "She is cheerful about every chore except her brother's idea of work.",
    third = "{name} met Khara Deepwater, who sells fishing supplies on the shore of Loch Modan.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "I'm Khara Deepwater, an' I sell fishin' supplies, but I've a lot o' chores today, so what can I get ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Lost another lure tae the big one, have ye? Everyone does." },
    { id = "g_clip", when = { questActive = TODO_QUEST("Silver of the Waves") }, text = "Ye've somethin' in yer hand that's glintin' like a fish scale, an' I'd know that glint anywhere." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Then ye'll be wantin' lures, an' I've some new ones that the perch cannae resist." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I sell hooks, lines, lures an' fish food, an' a recipe or two for when ye've caught somethin' worth cookin'. My brother Warg teaches, I sell, an' between us the loch's kept fed." },
        { id = "h_clip", tags = { "news" }, when = { questActive = TODO_QUEST("Silver of the Waves") },
          text = "Is that my hair clip? It is, wi' my letters on it an' all! I lost it off the boat last spring an' I'd given up hope." },
        { id = "h_clip_done", when = { questDone = TODO_QUEST("Silver of the Waves") },
          text = "See? It's shinin' again, just like I said it would. Every time I put it in, I think o' ye divin' about at the bottom o' the loch." },
      },
      again = {
        { id = "h_again", text = "What else? I've nets tae mend an' a delivery comin'." },
        { id = "h_again2", text = "Go on, quick-like, for there's a crate o' worms that won't sort itself." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "How did you lose your hair clip?", next = "clip", when = { any = { { questActive = TODO_QUEST("Silver of the Waves") }, { questDone = TODO_QUEST("Silver of the Waves") } } } },
        { text = "What sells best?", next = "sells" },
        { text = "Warg says you banned him from the counter.", next = "warg", when = { heardLine = "lm_warg.kh2_default" } },
        { text = "What's a busy day for you?", next = "chores" },
        { text = "Good day, Khara.", next = "END" },
      },
    },
    clip = {
      lines = {
        { id = "cl_default", text = "Out on the boat, reachin' for a line I'd tangled, an' the clip slipped right out an' down intae the deep. It was my mother's, an' I cried like a bairn, though I'll deny it if Warg asks." },
      },
      choices = {
        { text = "Some things are worth diving for.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sl_default", text = "Bright lures tae the young ones, who think fish care about shine, an' plain hooks tae the old ones, who know better. I sell the shiny ones at a better margin, an' I've no shame about it." },
      },
      choices = {
        { text = "Then tell the young ones the truth.", next = "BACK", reply = "The truth? An' lose half my shiny sales? I'll tell them when they're old enough tae appreciate it.", fx = { align = { honor = 1 } } },
        { text = "They'll learn. That's business.", next = "BACK", reply = "Aye, they will, an' they'll come back for plain hooks when they do. I've sold the same lad three shiny lures this month an' he's caught nothin' on any of them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warg = {
      lines = {
        { id = "wg_default", text = "He did, did he? Half price on my best lure, an' he was so pleased wi' himself he bought the fella a drink. I love him dearly, but he'll never touch my till again." },
      },
      choices = {
        { text = "Family and money don't mix.", next = "BACK", reply = "They dinnae, an' I married one who proves it every week. I'd no' trade him, mind, but I'll keep the till.", fx = { align = { order = 1 } } },
        { text = "Let him try again. Everyone deserves a chance.", next = "BACK", reply = "Again? He's had three chances this year! I'll give him a fourth, but only because I love the daft man.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chores = {
      lines = {
        { id = "ch_default", text = "I'm up before Warg, which isnae hard, an' then there's nets tae mend, worms tae dig, tackle tae count, an' then the Stoutlager wants fish for supper. Somewhere in there I try tae eat." },
      },
      choices = {
        { text = "Who wants the fish at the Stoutlager?", next = "chores_inn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chores_inn = {
      lines = {
        { id = "ci_default", text = "Innkeeper Hearthstove, though Vidra the cook would rather sell ye sausages than fish, an' says so tae anyone in earshot. I bring the fish anyway, an' the mountaineers eat every scrap." },
      },
      choices = {
        { text = "Fish over sausage, any day.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Deepwaters have fished this bank since before the dam was finished. Warg an' I are the last o' us here." } },
    advice = { { id = "tp_ad", text = "Mend yer nets before ye need them, an' never lend a lure tae a brother." } },
    _none = { { id = "tp_none", text = "No time tae think about that, friend. Ask me somethin' wi' fins." } },
  },
}

-- Mountaineer Pebblebitty: guards the gate of Stonewrought Pass into Searing Gorge.
P:NPC {
  key = "lm_pebblebitty", id = TODO_NPC("Mountaineer Pebblebitty"), name = "Mountaineer Pebblebitty",
  bible = "bibles/loch_edges.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "stern", "sharp" }, values = { "dutiful", "stubborn", "brave" },
  notices = { "race", "level", "class" },

  impression = {
    first = "She is stubborn as granite and still sore about losing her axe.",
    third = "{name} met Mountaineer Pebblebitty, who guards the sealed gate between Loch Modan and the Searing Gorge.",
  },

  greetings = {
    { id = "g_default", text = "Before ye ask, the answer's no. I will NOT open that gate, so save yer breath for the walk round." },
    { id = "g_back", when = { metBefore = true }, text = "You again, an' I can see the question in yer face from here. It's still no." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' ye've come back tae ask about the gate again, I suppose. My answer hasnae moved, an' neither have I." },
    { id = "g_horn", when = { questActive = TODO_QUEST("The Horn of the Beast") }, text = "Is that a horn ye're carryin'? Wait, let me see it, for there's somethin' stuck in it I'd know anywhere." },
    { id = "g_key", when = { questDone = TODO_QUEST("At Last!") }, text = "So Curator Thorius gave ye a key, did he? Then ye can open that gate yerself, an' I'll still no' do it for ye." },
  },

  notice = {
    { id = "n_low", cat = "level", when = { maxLevel = 40 },
      text = "Ye're no' ready for the Gorge, an' I'd say that even if the gate were open. Come back when ye've a few more years on ye." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "An' don't think about pickin' that lock either, for it's dwarven work an' it'll still be laughin' at ye come midwinter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Pebblebitty, an' my orders are tae keep this gate shut, for beyond it lies the Searing Gorge an' every Dark Iron who'd like tae walk intae Loch Modan. If I let one o' ye through, I'll have tae let ye all through, an' then where would we be?" },
        { id = "h_horn", tags = { "news" }, when = { questActive = TODO_QUEST("The Horn of the Beast") },
          text = "That's the horn o' Margol the Rager, an' that's MY axe head buried in it! I left it there when I ran, an' I've been waitin' for somebody daft enough tae go back for it." },
        { id = "h_proof", tags = { "news" }, when = { questActive = TODO_QUEST("Proof of Deed") },
          text = "Take my word tae Curator Thorius in Ironforge, at the Hall o' Explorers. He keeps the keys tae more doors than I'd like, an' he'll know what tae do." },
        { id = "h_after", when = { questDone = TODO_QUEST("Proof of Deed") },
          text = "Ye've been tae Ironforge an' back since I saw ye, by the dust on ye. I hope Thorius gave ye what ye came for, for he made me wait a month for mine." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Then ye know an order's an order, an' ye'll no' be askin' me tae open it. Will ye?" },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, an' ye'll be lookin' at the hinges thinkin' ye could have it off in a minute. Ye could, an' I'd have ye off the cliff in less." },
      },
      again = {
        { id = "h_again", text = "What else? An' if it's the gate, I'll hear the question an' say no just the same." },
        { id = "h_again2", text = "Ask away, friend, but the gate's no' a subject I'll be discussin'." },
        { id = "h_again3", text = "Go on. I've all day, for I'm no' goin' anywhere, an' neither's that gate." },
      },
      choices = {
        { text = "Please open the gate.", next = "gate" },
        { text = "Then how do I reach the Searing Gorge?", next = "route" },
        { text = "What's beyond the gate?", next = "gorge" },
        { text = "Tell me about this ogre and your axe.", next = "margol" },
        { text = "I'm invulnerable. The Gorge can't hurt me.", next = "boast" },
        { text = "I've brought you Margol's horn.", next = "horn", when = { questActive = TODO_QUEST("The Horn of the Beast") } },
        { text = "Fine. I'll leave you to it.", next = "END" },
      },
    },

    gate = {
      lines = {
        { id = "gt_default", key = true, text = "I will NOT open that gate! Ye can ask me in Common, Dwarvish or Thalassian, an' the answer's the same in all three." },
        { id = "gt_again", when = { heardLine = "lm_pebblebitty.gt_default" },
          text = "Did ye think the answer would change if ye asked again? I've stood here longer than ye've been askin', an' I'll stand here longer still." },
      },
      choices = {
        { text = "Why so stubborn about one gate?", next = "gate_why" },
        { text = "What if I said the king sent me?", next = "gate_king" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    gate_why = {
      lines = {
        { id = "gw_default", text = "Because one person through means the gate's open, an' an open gate goes both ways. The Dark Irons have been tryin' tae come up the pass since before ye were born, an' this door's the only reason they've no' managed it." },
      },
      choices = {
        { text = "Orders are orders. You're right to hold.", next = "BACK", reply = "Aye, they are, an' I'm glad someone understands. Most folk think I'm just bein' stubborn.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A rule with no exceptions is a foolish rule.", next = "BACK", reply = "Maybe it is, but it's kept the Dark Irons out o' Loch Modan since before ye were born. I'll keep my foolish rule.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_king = {
      lines = {
        { id = "gk_default", text = "Then I'd say the king can come an' tell me himself, an' bring a letter wi' his seal, an' I'd still check the seal twice. Don't push it, friend, or ye'll see how far the drop is from this ledge." },
      },
      choices = {
        { text = "Fair enough. I'll stop pushing.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    route = {
      lines = {
        { id = "rt_default", text = "The long way, through the Badlands, an' up from the south. It's a hard walk, an' ye'll curse me every step o' it, but ye'll arrive wi' all yer limbs, which is more than I'd promise if ye went through here." },
      },
      choices = {
        { text = "Is there no key to this gate?", next = "route_key" },
        { text = "I'll take the long way.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    route_key = {
      lines = {
        { id = "rk_default", text = "There's a key, aye, an' Curator Thorius keeps it in Ironforge, an' he doesnae hand it out tae anyone who asks. Do somethin' worth tellin' him about first, an' then we'll see." },
        { id = "rk_done", when = { questDone = TODO_QUEST("At Last!") },
          text = "Ye've got one, so stop askin' me about it. Open the gate yerself, an' close it behind ye, or I'll be after ye." },
      },
      choices = {
        { text = "What would be worth telling him?", next = "margol" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gorge = {
      lines = {
        { id = "gg_default", text = "That's the Searing Gorge, an' it's well named. Fire from the ground, Dark Iron slavers in the Cauldron, an' things in the rocks that I've no names for an' don't want any." },
      },
      choices = {
        { text = "Dark Iron slavers?", next = "gorge_slaves" },
        { text = "Has anyone friendly ever lived there?", next = "gorge_friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_slaves = {
      lines = {
        { id = "gs_default", text = "They take what workers they can catch an' work them in the Cauldron till they drop. Some say there are Dark Irons in the Gorge who've turned against their own, but I'll believe in a kind Dark Iron when one knocks on this gate an' says please." },
      },
      choices = {
        { text = "Even Dark Irons can change their ways.", next = "BACK", reply = "Maybe some can, an' I'd like tae believe it. But I'll no' bet the valley on it, no' wi' this gate.", fx = { align = { light = 1 }, learn = { "dark_iron" } } },
        { text = "A Dark Iron is a Dark Iron. Keep it shut.", next = "BACK", reply = "That's what the sergeant says, an' it's what the gate's for. Shut an' barred, an' my axe on it.", fx = { align = { light = -1 }, learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_friends = {
      lines = {
        { id = "gf_default", text = "Long ago, maybe, before the Firelord's fire came up out o' the mountain an' burned it all. Now there's only those that cannae leave an' those too stubborn tae, an' I'm no' sure which is worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock_depths" } } },
      },
    },

    margol = {
      lines = {
        { id = "mg_default", text = "Margol the Rager, a great brute of an ogre who lives down in the south-east o' the Gorge. I went in after him, an' I put my axe intae his horn, an' it stuck, an' I came back out without it, an' that's the whole o' the story." },
      },
      choices = {
        { text = "You fought an ogre alone?", next = "margol_alone" },
        { text = "Do you want your axe back?", next = "margol_axe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    margol_alone = {
      lines = {
        { id = "ma_default", text = "Aye, an' I'd do it again, though maybe wi' a heavier axe. My sergeant called it the bravest daft thing he'd ever seen, an' then he put me on gate duty for a year so I couldnae do it twice." },
      },
      choices = {
        { text = "Brave is never daft.", next = "BACK", reply = "Is it no'? Ye'd make a fine sergeant, an' I'd follow ye anywhere. Brave an' daft both, that's me.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Your sergeant was right to rein you in.", next = "BACK", reply = "Aye, he was, though I'll no' admit it tae his face. I wanted tae charge the whole trogg camp alone, an' I'd be in it now, in bits.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    margol_axe = {
      lines = {
        { id = "mx_default", text = "The axe I can do without, but I'd like that horn, for then everybody who laughed would know I hit him. Bring me Margol's horn, an' I'll put in a word wi' Curator Thorius that might be worth more than ye'd think." },
      },
      choices = {
        { text = "I'll bring you that horn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horn = {
      lines = {
        { id = "hn_default", text = "Ha! Look at that, my axe head still in it, rusted solid! Ye killed the brute, didn't ye, an' ye brought this back tae a stranger at a gate. I'll write ye a proof o' the deed, an' ye take it tae Curator Thorius in Ironforge." },
      },
      choices = {
        { text = "Keep the axe head. You earned it first.", next = "BACK", reply = "I will, then, an' I'll hang it over this gate for the sergeant tae see. Thank ye, truly.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I did the killing. The horn's my trophy.", next = "BACK", reply = "Yer trophy, aye, an' ye earned it fair. I'll only ask ye tae tell folk where the axe head came from.", fx = { align = { honor = -1 } } },
        { text = "What will Thorius do?", next = "route_key" },
      },
    },

    boast = {
      lines = {
        { id = "bs_default", text = "No one is invulnerable, friend, an' the Gorge has buried better boasters than you. I've heard that line from three folk, an' I've seen two o' them carried back." },
      },
      choices = {
        { text = "And the third?", next = "boast_third" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boast_third = {
      lines = {
        { id = "bt_default", text = "Never came back at all, so I suppose he might still be invulnerable somewhere down there. I wouldnae bet on it." },
      },
      choices = {
        { text = "Point taken.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this gate, an' what's behind it, an' who's tried tae get through. That's enough for anyone." } },
    background = { { id = "tp_bg", text = "I'm a Thelsamar Mountaineer, an' the gate's been mine since I came back from the Gorge without my axe." } },
    advice = { { id = "tp_ad", text = "Go round through the Badlands. Ye'll get there slower, but ye'll get there." } },
    dark_iron = { { id = "tp_di", text = "The Dark Irons would come up this pass in a heartbeat if I let them, so I don't." } },
    _none = { { id = "tp_none", text = "I'm a gate guard, friend, no' a scholar. Ask me about the gate, an' I'll still say no." } },
  },
}
