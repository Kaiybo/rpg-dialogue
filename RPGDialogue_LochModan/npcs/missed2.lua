-- Loch Modan folk the first passes missed, part 2: the Mountaineers who stand guard in Thelsamar and
-- walk the roads out of it. Each has a post, a temper and a thing they watch for. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mountaineer Bludd: Thelsamar guard; the Stoutlager's door and its brawlers.
P:NPC {
  key = "lm_mtn_bludd", id = TODO_NPC("Mountaineer Bludd"), name = "Mountaineer Bludd", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "bluff", "thirsty" }, values = { "dutiful", "fair" },
  notices = { "drink" },
  impression = {
    first = "Mountaineer Bludd stands his watch within sight of the Stoutlager Inn and knows to the minute how long it is until he may go inside. He keeps the peace at the door with a big hand and a bigger voice.",
    third = "{name} met Mountaineer Bludd, who keeps the peace near the Stoutlager Inn in Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. The streets feel a little safer with you walking them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep an eye open. Mind yourself." },
    { id = "g_default", text = "Well met, {class}. The inn's open an' the ale's good, an' ye can drink my share while I stand out here lookin' at the door." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! Still upright, I see, so ye've no' found the bottom o' Hearthstove's barrel yet." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've a fair list tae port, friend. Walk it off round the square before ye try the steps, for I'm tired o' carryin' folk up them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Bludd. I've the watch by the Stoutlager, which is the cruellest post in Loch Modan, for a dwarf can smell every pint an' touch none o' them." } },
      again = {
        { id = "h_again", text = "Anythin' else? I've nowhere tae be for hours yet, worse luck." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Does the inn give you much trouble?", next = "trouble" },
        { text = "How long until your watch ends?", next = "watch" },
        { text = "What's the best ale at the Stoutlager?", next = "xale" },
        { text = "Where did the garrison march off to?", next = "xfront" },
        { text = "What's the worst trouble you've had at this door?", next = "xworst" },
        { text = "A dwarf on watch with no ale. That's cruel.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'm a paladin. Don't you take a cup on duty?", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "I'll raise one to you inside.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "A brawl most nights, an' a good-natured one, for it's miners an' Mountaineers who'll be drinkin' together again by the next round. I only step in when the furniture's at risk, because Hearthstove bills the garrison for chairs." } },
      choices = {
        { text = "Who starts them?", next = "starts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starts = {
      lines = { { id = "s_default", text = "Whoever says the Stoutlager's ale isnae the best in Khaz Modan, usually, an' the innkeeper himself finishes it. I've learned tae let that one run its course." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Too long, {g:lad|lass}, an' longer since half the garrison marched off tae the Alliance front. We stand double watches now, an' the ale's flat by the time I get tae it." } },
      choices = { { text = "That's a hard thing. Something else.", next = "BACK" } },
    },
    xale = {
      narr = "He closes his eyes and breathes in through his nose, slowly.",
      lines = { { id = "xal_default", text = "The Thelsamar Blood Sausage pairs wi' the dark, an' the dark is the best brown ale this side o' Dun Morogh. Hearthstove brews it himsel', an' he'll tell ye it's the loch water that makes it, though I think it's the stubbornness." } },
      choices = {
        { text = "Better than Thunderbrew?", next = "xthunder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xthunder = {
      lines = { { id = "xth_default", text = "Och, dinnae start that here, or ye'll have the whole inn on its feet. Thunderbrew's fine for Kharanos folk, but a Loch Modan dwarf drinks Loch Modan ale, an' that's the end o' it." } },
      choices = {
        { text = "Thunderbrew is the king of ales. Everyone knows it.", next = "BACK", reply = "Then mind ye say that well outside the door, for I'll no' stop the brawl.", fx = { align = { order = -1 } } },
        { text = "A town should drink its own. You're right.", next = "BACK", reply = "Spoken like a sensible soul. I'll tell Hearthstove ye said so.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfront = {
      lines = { { id = "xfr_default", text = "Some went tae Arathi tae help the League, an' some tae the Wetlands where the Dragonmaw are pressin' Menethil. The rest of us hold Thelsamar wi' half the rifles an' twice the hours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xworst = {
      lines = { { id = "xwo_default", text = "A Dark Iron spy, sat in the corner an' bought rounds for the dam workers till one o' them talked too much. I caught him wi' a map o' the Stonewrought in his boot, an' the Captain still owes me a pint for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "Cruel, aye, ye understand! Ye'll drink the first one for me, an' slowly, so I can hear it through the window." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpaladin = {
      lines = { { id = "xpa_default", text = "Never on watch, an' I'll swear it on the Light if ye like. After watch, though, I'll take two, an' the Light can look the other way for a wee while." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stoutlager = { { id = "xtp_stout", text = "The finest inn in the loch country, an' I can only look at it. Go in, have one, an' think o' me." } },
    dark_iron = { { id = "xtp_di", text = "They send spies intae the inn now an' then. I've caught one, an' I'm watchin' for the next." } },
   
    background = { { id = "tp_bg", text = "I've been a Mountaineer fifteen years, an' on this door for more o' them than I'd like." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask inside, for somebody at the bar'll have an opinion, right or wrong." } },
  },
}

-- Mountaineer Cragg: Thelsamar guard; old veteran with a knee that reads the weather.
P:NPC {
  key = "lm_mtn_cragg", id = TODO_NPC("Mountaineer Cragg"), name = "Mountaineer Cragg", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "gruff", "old" }, values = { "dutiful", "tradition" },
  notices = { "soldier" },
  impression = {
    first = "Mountaineer Cragg is the oldest guard in Thelsamar, grey to the belt and stiff in one knee. He stayed behind when the younger Mountaineers marched to the front, and he has not forgiven the knee for it.",
    third = "{name} met Mountaineer Cragg, an old veteran on guard in Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "State your business quickly, and then be on your way." },
    { id = "g_default", text = "Aye, I see ye. I've been seein' folk come up that road since before ye were born, an' ye're no' the strangest by a long way." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? The knee said somebody was comin', though it says that about rain as well." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye stand like ye've held a line before. There's few enough left in this town who have, wi' the best of us sent north." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Cragg. I've stood guard on this town through two wars an' the quiet between, an' I'll tell ye for nothin' that the quiet was harder on the knees." } },
      again = {
        { id = "h_again", text = "What else? Speak tae my good side." },
        { id = "h_again2", text = "Go on, I'm no' goin' anywhere quickly." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Who taught you to stand a watch?", next = "ycrag_teach" },
        { text = "My people held the gates beside yours, old one.", next = "ycrag_dwarf", when = { race = "Dwarf" } },
        { text = "What do you make of the young guards?", next = "ycrag_young" },
        { text = "Two wars? You fought the orcs?", next = "wars" },
        { text = "What does the knee say about today?", next = "knee" },
        { text = "Stand easy, Mountaineer.", next = "END" },
      },
    },
    wars = {
      lines = { { id = "w_default", text = "I was here when the Horde came through Khaz Modan, an' I was here when the Alliance drove them back out. We held Ironforge's gates shut the whole time between, an' I've never been so glad tae see a human as the day Lothar's army came up the pass." } },
      choices = {
        { text = "And now they've sent the garrison away.", next = "sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Aye, the Reserve went tae the Alliance front, an' it was owed, for they came when we needed them. I only wish they'd left us more than old dwarves an' boys tae mind the troggs.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    knee = {
      lines = { { id = "k_default", text = "Rain off the loch by evenin', an' a cold night after. It took an orc's hammer at the gates tae make a weather-glass o' me, an' it's the only useful thing an orc ever did." } },
      choices = { { text = "I'll pack a cloak. Something else.", next = "BACK" } },
    },
    ycrag_teach = {
      lines = {
        { id = "yycrag_teach_d", text = "A Mountaineer named Hrolf Coalbrow, who had one eye an' a voice like a falling wall. He said a guard's only job is tae still be standin' when the trouble's done, an' I've done that through two wars, so I reckon he taught me right." },
      },
      choices = {
        { text = "Is Hrolf still living?", next = "ycrag_hrolf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycrag_hrolf = {
      narr = "Cragg shifts his weight off the bad knee and looks down the road toward the loch.",
      lines = {
        { id = "yycrag_hrolf_d", text = "Nae, he fell at the gates o' Ironforge when the Horde came through Dun Morogh, an' I carried him back inside myself. I was half his age then an' I'm twice it now, which is a strange thing tae think on." },
      },
      choices = {
        { text = "Do you ever think of retiring?", next = "ycrag_retire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycrag_retire = {
      lines = {
        { id = "yycrag_retire_d", text = "Every mornin' when the knee wakes before I do. The Magistrate's offered me a pension an' a stool by Honni's oven, but who'd watch the gate? The young ones are all at the front, an' the ones left behind are no' much older than ye." },
      },
      choices = {
        { text = "Stay at the post. Thelsamar needs an old hand.", next = "BACK", reply = "Aye, that's what I tell the knee. It doesnae listen either.", fx = { align = { order = 1 } } },
        { text = "Take the stool. You've earned your rest.", next = "BACK", reply = "Maybe I have. I'll think on it once the troggs are back underground.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycrag_dwarf = {
      lines = {
        { id = "yycrag_dwarf_d", text = "Then ye'll know what it cost, an' I'll no' have tae tell ye. Bronzebeard kept the gates shut an' the Horde broke its teeth on the stone, an' every dwarf who held that line has a right tae a seat by any fire in Khaz Modan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycrag_young = {
      lines = {
        { id = "yycrag_young_d", text = "They're keen, I'll give them that, an' some o' them can shoot. But they've never seen a Horde coming down a valley in their thousands, an' I pray tae the stone they never will, for keenness doesnae help much wi' that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "My town, near enough. I've guarded it longer than most o' its roofs have stood." } },
    second_war = { { id = "tp_ysecond_war", text = "The Horde came through Khaz Modan like a flood, an' we held. That's all I'll say o' it over a pint." } },
    background = { { id = "tp_bg", text = "I'm the oldest Mountaineer still drawin' pay in Thelsamar. They'll have tae carry me off this post." } },
    troggs = { { id = "tp_tr", text = "In my day they stayed under the ground where they belong. Somethin' stirred them up, an' I dinnae like no' knowin' what." } },
    _none = { { id = "tp_none", text = "That's after my time or before it, I cannae tell which. Ask a younger dwarf." } },
  },
}

-- Mountaineer Dalk: Thelsamar guard; posted by the gryphon roost, watches the sky.
P:NPC {
  key = "lm_mtn_dalk", id = TODO_NPC("Mountaineer Dalk"), name = "Mountaineer Dalk", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "wistful", "friendly" }, values = { "dutiful", "freedom" },
  notices = { "travel" },
  impression = {
    first = "Mountaineer Dalk guards Thelsamar with his chin tilted up, watching the gryphons come and go over the loch. He would trade his rifle for a saddle tomorrow, and says so to anyone who lands.",
    third = "{name} met Mountaineer Dalk, a Thelsamar guard who watches the gryphons.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Good day tae ye! Did ye fly in, or did ye walk it like the rest of us poor souls?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. I thought I saw ye come in over the water, or somebody very like ye." },
  },
  notice = {
    { id = "n_wild", cat = "travel", when = { origin = "dwarf_wildhammer_kin" },
      text = "Ye've Wildhammer in ye, I'd swear it, by the feathers in yer gear. Tell me true, is it as grand up there as they say?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Dalk. I mind the town an' I mind the sky over it, an' I'll confess the sky gets the better part o' my attention." } },
      again = {
        { id = "h_again", text = "What else? Hold on, that's only a buzzard. Go on." },
        { id = "h_again2", text = "Aye, I'm listenin', wi' one ear anyway." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What are you watching the sky for?", next = "sky" },
        { text = "You'd rather be flying, I think.", next = "fly" },
        { text = "Who is Thorgrum?", next = "xthorgrum" },
        { text = "Where would you fly first?", next = "xwhere" },
        { text = "Have you ever seen a Wildhammer flyer?", next = "xwild" },
        { text = "I'm a dwarf. I've flown with Thorgrum's birds.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Clear skies, Mountaineer.", next = "END" },
      },
    },
    sky = {
      lines = { { id = "s_default", text = "Thorgrum's gryphons, mostly, tae see they come home wi' riders on them. A bird that lands empty means somebody's lyin' in a field between here an' Ironforge, an' I'm the one who raises the shout." } },
      choices = {
        { text = "Has one ever come back empty?", next = "empty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    empty = {
      lines = { { id = "e_default", text = "Once, last autumn, an' we found the rider sittin' in a tree near the dam wi' a broken strap an' a red face. Thorgrum checked every buckle in the roost that night an' hasnae stopped checkin' since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fly = {
      lines = { { id = "f_default", text = "Is it that plain? I asked Thorgrum tae take me on at the roost, an' he said his birds prefer a dwarf who doesnae talk so much. I'm workin' on it, as ye can hear." } },
      choices = { { text = "Keep at it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xthorgrum = {
      lines = { { id = "xtg_default", text = "Thorgrum Borrelson, the gryphon master by the inn, an' the gruffest dwarf in Thelsamar. He loves his birds more than his own kin, an' I cannae say I blame him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhere = {
      narr = "He points over the loch toward the distant ridges.",
      lines = { { id = "xwh_default", text = "Over the dam an' up tae the Wetlands, then all the way tae Aerie Peak tae see how the Wildhammer do it. They say the Wildhammer fly wi'out saddles, an' they throw their hammers from the sky." } },
      choices = {
        { text = "The Wildhammer have it right. Freedom over rules.", next = "BACK", reply = "Aye! Ye see it too. Don't tell the Captain, he'd have me on double watch.", fx = { align = { order = -1 } } },
        { text = "Your post is here. Duty first.", next = "BACK", reply = "Aye, aye, I know it, an' I'll keep it. My head can wander even if my boots cannae.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwild = {
      lines = { { id = "xwi_default", text = "Once, when I was a lad, a Wildhammer came down over the loch on a great grey gryphon, tattoos an' all, an' landed right in the market square. He bought a keg, tied it on, an' flew off again, an' I've wanted tae be him ever since." } },
      choices = {
        { text = "Do Bronzebeards and Wildhammers get along?", next = "xalong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalong = {
      lines = { { id = "xag_default", text = "Well enough, these days, though there's old grudges from the War o' the Three Hammers. The Wildhammer think we've gone soft under the mountain, an' we think they've gone daft in the wind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "Have ye now? Then tell me everythin', what the loch looks like from up there, an' does the stomach drop, an' does it ever stop droppin'." } },
      choices = { { text = "It never stops. Something else.", next = "BACK", reply = "Ha! I knew it. That's half the fun, I'd wager." } },
    },
  },
  topics = {
    aerie_peak = { { id = "xtp_aerie", text = "The Wildhammer roost, far up in the Hinterlands. I'll see it one day, I swear." } },
    gryphons = { { id = "xtp_gry", text = "Finest creatures in Khaz Modan. Thorgrum's lot are proud, an' they've every right tae be." } },
   
    background = { { id = "tp_bg", text = "I'm a Mountaineer wi' my feet on the ground an' my head elsewhere. The Captain's told me so more than once." } },
    _none = { { id = "tp_none", text = "I dinnae know, friend. Ask Thorgrum, for the gryphon riders hear news from everywhere." } },
  },
}

-- Mountaineer Fazgard: Thelsamar guard; south end of town, grim about the troggs.
P:NPC {
  key = "lm_mtn_fazgard", id = TODO_NPC("Mountaineer Fazgard"), name = "Mountaineer Fazgard", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "grim", "watchful" }, values = { "dutiful", "vigilant" },
  notices = { "soldier" },
  impression = {
    first = "Mountaineer Fazgard watches the hills west of Thelsamar and barely glances at the road. He is sure the troggs will come for the town itself one night, and he intends to be the dwarf who sees them first.",
    third = "{name} met Mountaineer Fazgard, who watches the western hills from Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Keep movin' if ye're only passin', {class}, an' keep yer eyes on that ridge if ye're stayin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Did ye see anythin' on the hill as ye came in?" },
    { id = "g_troggs", when = { questDone = TODO_QUEST("The Trogg Threat") },
      text = "I heard ye went up among the Stonesplinters an' came back wi' the Captain's thanks. That's a few less for me tae count, an' I'm grateful." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "Ye look like ye can fight. Captain Rugelfuss is payin' for troggs, an' I'd sooner ye killed them out there than I killed them in the square." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Fazgard. That ridge tae the west is where they'll come from when they come, an' I've said so tae the Captain, the Magistrate an' anybody else who'll stand still.", fx = { learn = { "troggs" } } } },
      again = {
        { id = "h_again", text = "What else? Be quick, I dinnae like takin' my eyes off it." },
        { id = "h_again2", text = "Aye?" },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why won't anyone listen to you?", next = "yfaz_listen" },
        { text = "Could a dwarf like me help you watch?", next = "yfaz_dwarf", when = { race = "Dwarf" } },
        { text = "What happened at the quarry?", next = "yfaz_quarry" },
        { text = "You think the troggs will attack the town?", next = "attack" },
        { text = "It looks quiet enough up there.", next = "quiet" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    attack = {
      lines = { { id = "a_default", text = "They've taken the valley, they've taken the quarry hills, an' they're in Ironband's dig on the far shore. Tell me why a thing like that would stop at a town wi' a dozen guards an' a full larder." } },
      choices = {
        { text = "What would you do about it?", next = "do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["do"] = {
      lines = { { id = "d_default", text = "Bring the Reserve home an' burn the Stonesplinters out o' their holes, an' I'd do it tomorrow. Since I'm only a Mountaineer, I stand here an' count heads on the skyline instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "Quiet's what worries me. A trogg's a noisy brute when it's hungry, so when the hill goes still, it means they're doin' somethin' other than huntin'." } },
      choices = { { text = "That's an unpleasant thought. Something else.", next = "BACK" } },
    },
    yfaz_listen = {
      lines = {
        { id = "yyfaz_listen_d", text = "They listen, they just dinnae act. Rugelfuss nods an' sends adventurers up the hill, the Magistrate nods an' writes it in his ledger, an' the troggs keep breedin' faster than either o' them can count." },
      },
      choices = {
        { text = "You've seen something up there, haven't you?", next = "yfaz_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfaz_seen = {
      narr = "Fazgard does not take his eyes off the ridge as he answers.",
      lines = {
        { id = "yyfaz_seen_d", text = "Fires, three nights runnin', further along the crest than any trogg's lit before. Somebody's teachin' them tae keep watch, an' I dinnae think it's a trogg doin' the teachin'." },
      },
      choices = {
        { text = "Who could be teaching them?", next = "yfaz_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfaz_who = {
      lines = {
        { id = "yyfaz_who_d", text = "I've a guess, an' it's a Dark Iron one, but a guess isnae proof an' the Captain wants proof. So I wait, an' I watch, an' I sleep in my boots, an' my sister says I'll be an old dwarf by thirty at this rate." },
      },
      choices = {
        { text = "Wait for proof. A false alarm would hurt the town.", next = "BACK", reply = "Aye, ye sound like Rugelfuss. He's no' wrong, which is the worst of it.", fx = { align = { order = 1 } } },
        { text = "Raise the alarm now. Proof will come too late.", next = "BACK", reply = "That's my thinkin' exactly. I'll go tae the Magistrate again tomorrow, an' louder.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfaz_dwarf = {
      lines = {
        { id = "yyfaz_dwarf_d", text = "Ye could, an' I'd thank ye for it. Stand on the wall by the inn after sundown an' watch the crest tae the left o' the old tower. If ye see a light that moves, run for the Captain an' dinnae stop tae make sure." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfaz_quarry = {
      lines = {
        { id = "yyfaz_quarry_d", text = "The Stonesplinters took the old quarry in the hills an' they've been cuttin' at it ever since, though what for I couldnae say. A trogg doesnae build, so either they're diggin' for somethin' or makin' room for more o' themselves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonesplinter_valley = { { id = "tp_ystonesplinter_valley", text = "Trogg country over the ridge. I've a map o' every cave mouth I've seen, an' it's longer every week." } },
    captain_rugelfuss = { { id = "tp_ycaptain_rugelfuss", text = "A good soldier who wants proof before he'll spend men. I'd want the same, if I didnae already know." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer, an' I watch the west. There's nae more tae me than that until the troggs are gone." } },
    troggs = { { id = "tp_tr", text = "They'll come over that ridge one night. I mean tae be awake for it." } },
    _none = { { id = "tp_none", text = "I dinnae know an' I've nae time tae wonder. Ask in the town." } },
  },
}

-- Mountaineer Harn: Thelsamar guard; prefers the night watch and knows the town by its sounds.
P:NPC {
  key = "lm_mtn_harn", id = TODO_NPC("Mountaineer Harn"), name = "Mountaineer Harn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "quiet", "thoughtful" }, values = { "dutiful", "peace" },
  notices = { "stealth" },
  impression = {
    first = "Mountaineer Harn is a soft-spoken guard who asks for the night watch and seems out of place in daylight. He knows Thelsamar by its sounds and can tell which door has opened without turning his head.",
    third = "{name} met Mountaineer Harn, a quiet guard who favours Thelsamar's night watch.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Good day tae ye. Forgive the squint, for I'm more used tae lamplight than sun." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Evenin'. Ye've a heavy step on the left side, did ye know? I heard ye from the smithy." },
    { id = "g_back", when = { metBefore = true }, text = "I thought that was yer step. Welcome back tae Thelsamar." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Ye walk soft, softer than most, but yer buckle ticks against yer belt on every third step. I'd see tae that, if soft's yer trade." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Harn. I take the night watch when they'll let me, because a town tells ye more about itself in the dark than it ever does at noon." } },
      again = {
        { id = "h_again", text = "Was there more? I'm in nae hurry." },
        { id = "h_again2", text = "Go on, I'm listenin'. It's what I do best." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why do you prefer the night?", next = "yhar_why" },
        { text = "A rogue could learn a lot from you.", next = "yhar_rogue", when = { class = "ROGUE" } },
        { text = "What about Honni and her ovens?", next = "yhar_honni" },
        { text = "What does Thelsamar tell you at night?", next = "night" },
        { text = "What do you listen for?", next = "listen" },
        { text = "A quiet watch to you.", next = "END" },
      },
    },
    night = {
      lines = { { id = "n_default", text = "That Honni's at her ovens three hours before dawn, that the Magistrate paces when he cannae sleep, an' that Dakk Blunderblast is up at his window wi' a boot in his hand again. Ye learn who's worried in a town by who's awake." } },
      choices = {
        { text = "What's Dakk doing with a boot?", next = "dakk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dakk = {
      lines = { { id = "d_default", text = "Waitin' for spiders, poor soul. The forest lurkers do come down off the western hill after dark, an' I've turned two away from his wall myself, though I've no' told him it was two." } },
      choices = { { text = "Kind of you. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "l_default", text = "For anythin' that doesnae belong. A trogg grunts when it climbs, a kobold drags its tail, an' a Dark Iron wears hobnails, which I've never yet heard on these stones an' hope I never do.", fx = { learn = { "dark_iron" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yhar_why = {
      lines = {
        { id = "yyhar_why_d", text = "My mother was blind, an' she taught me tae know a room by its sounds before I knew it by sight. Daylight's too loud for me, if ye can follow that, for everythin' shouts at once an' ye cannae hear what's whisperin'." },
      },
      choices = {
        { text = "What have you heard that nobody else has?", next = "yhar_heard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_heard = {
      narr = "Harn lowers his voice, though there is nobody near enough to listen.",
      lines = {
        { id = "yyhar_heard_d", text = "A cart that came intae town after midnight wi' nae lantern, three nights back, an' left before dawn by the west road. It stopped behind the smithy, an' I heard coin change hands, though I couldnae see whose." },
      },
      choices = {
        { text = "Have you told the Captain?", next = "yhar_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_told = {
      lines = {
        { id = "yyhar_told_d", text = "No' yet, for I'm no' sure what I heard, an' a town like this can turn on itself if a guard starts pointin' fingers at shadows. If I'm wrong, I've shamed an honest smith. If I'm right, somethin's bein' sold tae the troggs or worse." },
      },
      choices = {
        { text = "Tell the Captain. Truth matters more than shame.", next = "BACK", reply = "Aye. I'll go at the change o' watch, an' I'll tell it straight.", fx = { align = { honor = 1 } } },
        { text = "Watch longer. Don't ruin a name on a guess.", next = "BACK", reply = "That's my thinkin'. One more night, maybe two, an' then I'll know.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_rogue = {
      lines = {
        { id = "yyhar_rogue_d", text = "Aye, an' I'd sooner ye learned it on my side o' the law than the other. Walk on the sides o' yer feet, keep yer breath slow, an' never trust a floorboard ye've no' stood on before. Now see tae that buckle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_honni = {
      lines = {
        { id = "yyhar_honni_d", text = "Honni's the first light in Thelsamar every mornin', an' the smell o' her bread is the sign my watch is near done. I've never told her that, an' I'd thank ye no' tae either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "A quiet town by day an' a quieter one by night, if ye know how tae listen tae it." } },
    dakk_blunderblast = { { id = "tp_ydakk_blunderblast", text = "Dakk waits up for spiders wi' a boot in his hand. I've told him it's no' a weapon." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer who likes the dark hours. Somebody has tae, an' I've the ears for it." } },
    dark_iron = { { id = "tp_di", text = "Hobnailed boots an' a smell o' coal smoke, so the old hands say. I listen for the first." } },
    _none = { { id = "tp_none", text = "I've heard nothin' about that, an' I hear most things. I'm sorry." } },
  },
}

-- Mountaineer Janha: Thelsamar guard; sharp-eyed, watches strangers' hands around the stalls.
P:NPC {
  key = "lm_mtn_janha", id = TODO_NPC("Mountaineer Janha"), name = "Mountaineer Janha", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "sharp", "dry" }, values = { "dutiful", "honest" },
  notices = { "stealth", "purse" },
  impression = {
    first = "Mountaineer Janha guards the shops of Thelsamar and watches hands rather than faces. She is polite, quick, and has a way of standing between a stranger and whatever the stranger was looking at.",
    third = "{name} met Mountaineer Janha, who watches over Thelsamar's shops.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "State your business quickly, and then be on your way." },
    { id = "g_default", text = "Welcome tae Thelsamar. The shops are honest here, an' I'm the reason the customers are too." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye paid for everythin' last time, so we're still friends." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I know that way o' standin', wi' the weight on the toes. Keep yer fingers in yer own purse while ye're in my town an' we'll get on fine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Janha. The others watch the hills for troggs, an' I watch the counters, because a town can be robbed from the inside as well as the out." } },
      again = {
        { id = "h_again", text = "Somethin' else? Keep yer hands where I can see them an' ask away." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Who taught you to watch hands?", next = "yjan_taught" },
        { text = "Do gnomes get blamed for the thefts?", next = "yjan_gnome", when = { race = "Gnome" } },
        { text = "Tell me about Vrok's shop.", next = "yjan_vrok" },
        { text = "Is there much thieving in Thelsamar?", next = "thieves" },
        { text = "You've been watching my hands.", next = "hands" },
        { text = "I'm only in town to work, I promise.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Good day, Mountaineer.", next = "END" },
      },
    },
    thieves = {
      lines = { { id = "t_default", text = "Less than there was, an' most of it's kobolds after candles an' tunnel rats after everythin' else. The two-legged sort come through wi' the caravans, an' they tend tae leave quicker than they arrived.", fx = { learn = { "kobolds" } } } },
      choices = {
        { text = "What was the boldest theft you stopped?", next = "bold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bold = {
      lines = { { id = "b_default", text = "A fellow walked out o' Vrok's shop wi' a blunderbuss down his trouser leg, stiff as a dwarf wi' a wooden knee. I let him get as far as the inn steps, because I wanted tae see how he'd manage them." } },
      choices = { { text = "And how did he?", next = "BACK", reply = "Badly, an' loudly, an' Vrok got his gun back wi' a dent in it. He still blames me for the dent." } },
    },
    hands = {
      lines = { { id = "ha_default", text = "I have, an' ye've kept them tae yerself, which I appreciate. Faces lie tae ye all day long, but I've never met a pair o' hands that could." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Then work outside the walls, where there's troggs wi' pockets full o' stolen silver an' naebody tae mind if ye lighten them. I've nae quarrel wi' a trade, only wi' where it's plied." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    yjan_taught = {
      lines = {
        { id = "yyjan_taught_d", text = "My granda, who ran a stall in the Ironforge Commons for forty years an' never lost a copper tae a cutpurse. He used tae say the hand moves before the mind's decided, so watch the hand an' ye'll know the mind." },
      },
      choices = {
        { text = "Did you ever want a stall of your own?", next = "yjan_stall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yjan_stall = {
      lines = {
        { id = "yyjan_stall_d", text = "I did, once, an' I'd the coin saved for it. Then the Reserve marched north an' the Magistrate asked for anyone who could hold a rifle, an' I found I'd sooner guard other folk's counters than mind my own." },
      },
      choices = {
        { text = "Is there trouble you can't stop?", next = "yjan_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yjan_trouble = {
      narr = "Janha glances toward the smithy and then back at you, a little too quickly.",
      lines = {
        { id = "yyjan_trouble_d", text = "There's a merchant buyin' trogg-stolen goods off adventurers an' sellin' them back tae the folk they were stolen from, at a markup. It's no' quite thievin', an' the Magistrate says there's nae law against it, but it sits ill wi' me." },
      },
      choices = {
        { text = "If there's no law, leave him be.", next = "BACK", reply = "Aye, the law's the law. I'll watch him all the same, mind.", fx = { align = { order = 1 } } },
        { text = "Law or no law, run him out of town.", next = "BACK", reply = "Ha, I like ye. I'll no' do it, but I'll think about it every day.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yjan_gnome = {
      lines = {
        { id = "yyjan_gnome_d", text = "Now an' then, by folk who should know better, for there's been a lot o' new faces since Gnomeregan fell. I tell them a gnome's hands are as honest as any dwarf's, an' quicker, which is why I watch them a wee bit closer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yjan_vrok = {
      lines = {
        { id = "yyjan_vrok_d", text = "Vrok sells blunderbusses an' powder an' never smiles, an' he's been robbed more than anyone in town because he will turn his back tae reach the top shelf. I've told him tae build a lower shelf." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "Honest shops an' honest folk, mostly. I'm here for the rest." } },
    vrok_blastmaster = { { id = "tp_yvrok_blastmaster", text = "He'll sell ye a blunderbuss an' a scowl, an' both are worth the coin." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer who'd rather catch a thief than shoot a trogg. Every garrison needs one." } },
    kobolds = { { id = "tp_kob", text = "Candle thieves. They'll take the wax an' leave the silver, the daft wee things." } },
    _none = { { id = "tp_none", text = "I couldnae say. If it didnae happen at a shop counter, I likely missed it." } },
  },
}

-- Mountaineer Kamdar: Thelsamar guard; cheerful, posted downwind of Vidra's kitchen.
P:NPC {
  key = "lm_mtn_kamdar", id = TODO_NPC("Mountaineer Kamdar"), name = "Mountaineer Kamdar", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "cheerful", "hungry" }, values = { "comfort", "loyal" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Mountaineer Kamdar is a broad, cheerful guard who has arranged to stand wherever the smell of Vidra Hearthstove's kitchen is strongest. He judges every stranger by whether they look like they might be carrying food.",
    third = "{name} met Mountaineer Kamdar, a cheerful Thelsamar guard with a nose for the kitchen.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "State your business quickly, and then be on your way." },
    { id = "g_default", text = "Hello there! Ye wouldnae be carryin' anythin' tae eat, would ye, only it's a long while till the bell." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself! Have ye tried the sausages yet, like I told ye?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "Ye smell o' woodsmoke an' drippin', friend, an' I mean it as the highest praise. Ye're a cook, or I've lost my nose." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Kamdar, at yer service. I guard this side o' the square, an' it's pure chance that it's the side Vidra Hearthstove's chimney blows across." } },
      again = {
        { id = "h_again", text = "What else? Talkin' keeps my mind off my belly." },
        { id = "h_again2", text = "Aye, go on, friend." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Have you always loved your food this much?", next = "ykam_food" },
        { text = "You're a hearty dwarf. Do you miss Ironforge?", next = "ykam_dwarf", when = { race = "Dwarf" } },
        { text = "What does Uthan think of the swap?", next = "ykam_uthan" },
        { text = "Pure chance, is it?", next = "chance" },
        { text = "What's worth eating in Thelsamar?", next = "eat" },
        { text = "I have brought Vidra her sausage makings.", next = "sausage", when = { questDone = TODO_QUEST("Thelsamar Blood Sausages") } },
        { text = "Enjoy your supper, when it comes.", next = "END" },
      },
    },
    chance = {
      lines = { { id = "c_default", text = "Well, I may have swapped posts wi' Mountaineer Uthan, who wanted the side nearer the League hall an' its books. He thinks he got the better o' the bargain, an' so do I, which is the best sort o' trade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eat = {
      lines = { { id = "e_default", text = "Vidra's blood sausages, first an' always, on a heel o' Honni Goldenoat's bread while it's still warm. Folk talk about the ale here, but I've marched on that sausage an' I'd march on it again." } },
      choices = {
        { text = "What goes into them?", next = "into" },
        { text = "Something else.", next = "BACK" },
      },
    },
    into = {
      lines = { { id = "i_default", text = "Bear, boar an' spider, an' I'd advise ye no' tae think on the third until after ye've eaten. Vidra's always short o' makings, so if ye're huntin' round the loch, she'll want a word wi' ye." } },
      choices = { { text = "Spider. Right. Something else.", next = "BACK" } },
    },
    sausage = {
      lines = { { id = "s_default", text = "That was ye? Then I owe ye for the best supper I've had this month, an' so does half the garrison. Ye've done more for the defence o' Thelsamar than ye know." } },
      choices = { { text = "Glad to serve. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ykam_food = {
      lines = {
        { id = "yykam_food_d", text = "Since I could hold a spoon, friend, an' my mam said I'd ask for seconds before the firsts had cooled. But I'll tell ye a secret: I eat like this because I spent the winter o' the Second War in a siege cellar on half a biscuit a day." },
      },
      choices = {
        { text = "That must have been hard.", next = "ykam_siege" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykam_siege = {
      narr = "Kamdar's broad grin falters for a moment, then comes back a little thinner.",
      lines = {
        { id = "yykam_siege_d", text = "Hard enough that I swore I'd never be hungry again if I could help it. The Horde sat outside Ironforge's gates an' we sat inside, an' there were nights we boiled leather. I was eleven, an' I've no' stopped eatin' since." },
      },
      choices = {
        { text = "Do you share your food with the others?", next = "ykam_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykam_share = {
      lines = {
        { id = "yykam_share_d", text = "Always, an' that's the trouble, for there's young Gwarth who never brings her own an' old Cragg who says he's no' hungry an' then eats half my pie. Vidra says I should make them pay, but I cannae watch a dwarf go hungry." },
      },
      choices = {
        { text = "Keep sharing. A full garrison fights better.", next = "BACK", reply = "Aye, that's what I say! I'll tell Vidra ye agree, an' she'll scowl.", fx = { align = { honor = 1 } } },
        { text = "Make them pay. Your kindness is being used.", next = "BACK", reply = "Maybe it is, but I'd sooner be used than be the dwarf who said no.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykam_dwarf = {
      lines = {
        { id = "yykam_dwarf_d", text = "Miss the Stonefire Tavern an' the bakers on the Commons? Every day, friend. But Thelsamar's got Vidra an' Honni, an' between the two o' them a dwarf could die happy an' never notice the town's half the size." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ykam_uthan = {
      lines = {
        { id = "yykam_uthan_d", text = "Uthan's a fine lad wi' his nose in a book, an' he thinks he swapped posts tae be near the Explorers' League. He did, mind, but he also swapped me a hot supper for a cold draught, so I reckon we both won." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    vidra_hearthstove = { { id = "tp_yvidra_hearthstove", text = "The best sausage-maker this side o' the Great Forge, an' I'll fight anyone who says different." } },
    honni_goldenoat = { { id = "tp_yhonni_goldenoat", text = "Her bread's warm before the sun's up, an' I'm usually the first at her door." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer, an' a well-fed one, an' I see nae shame in either." } },
    _none = { { id = "tp_none", text = "I dinnae know, friend. Ask at the inn, an' bring me back a crust while ye're there, if they've one goin' spare." } },
  },
}

-- Mountaineer Modax: Thelsamar guard; drill-minded, sore about the Reserve being sent away.
P:NPC {
  key = "lm_mtn_modax", id = TODO_NPC("Mountaineer Modax"), name = "Mountaineer Modax", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "stern", "exacting" }, values = { "dutiful", "order" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Mountaineer Modax stands guard in Thelsamar as if on parade, every strap squared and every buckle bright. He inspects passers-by out of habit and finds most of them wanting.",
    third = "{name} met Mountaineer Modax, a drill-minded guard in Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Halt a moment, {class}. Nae, ye've done nothin', I only wanted a look at how ye carry that kit." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' yer straps are still twisted. We spoke about that." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "I've seen scarecrows better turned out. Get that gear tae a smith before ye call yerself armed, for I'd no' let ye on a wall like that." },
    { id = "n_soldier", cat = "soldier", when = { origin = "dwarf_mountaineer" },
      text = "Ye've worn the Mountaineer's green yerself, or I'm nae judge. Whose company were ye, an' did they teach ye tae stand like that?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Modax. I drill what's left o' this garrison every mornin' at first light, an' I stand my own watch after, so ye'll forgive me if I've nae patience for slouchin'." } },
      again = {
        { id = "h_again", text = "What else? Stand up straight when ye ask it." },
        { id = "h_again2", text = "Go on, an' be brief." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Where did you learn your drill?", next = "ymod_learn" },
        { text = "I'm a warrior. Drill me, Mountaineer.", next = "ymod_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Who is your best recruit?", next = "ymod_gwarth" },
        { text = "What's left of the garrison?", next = "left" },
        { text = "How does my kit pass inspection?", next = "inspect" },
        { text = "As you were, Mountaineer.", next = "END" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "The Reserve was sent tae the Alliance front, an' what stayed is the old, the green an' the lame, wi' myself tae make soldiers o' them. I'd follow the King's order tae the letter, but I'd have liked a say in who went." } },
      choices = {
        { text = "Can the ones who stayed hold the town?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "They can now. Young Gwarth couldnae load in under a minute when she came tae me, an' she's down tae twenty breaths, though she still polishes her buttons when she should be oilin' her lock." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inspect = {
      lines = {
        { id = "i_plate", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Better than most, I'll grant ye, for ye've oiled the joints an' ye carry the weight on yer hips. Tighten the left pauldron a notch an' I'd have ye on my wall." },
        { id = "i_default", text = "Ye'd no' pass, but ye'd no' be the worst I've seen today, either. Keep yer weapon where yer hand falls naturally an' ye'll have fixed the half of it." },
      },
      choices = { { text = "I'll see to it. Something else.", next = "BACK" } },
    },
    ymod_learn = {
      lines = {
        { id = "yymod_learn_d", text = "In the Ironforge Guard, under a sergeant who made us polish the soles o' our boots, for he said ye never know when ye'll be lyin' on yer back lookin' up at an enemy. I thought him daft, an' then I learned he was right." },
      },
      choices = {
        { text = "Why aren't you at the front with the Reserve?", next = "ymod_front" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymod_front = {
      narr = "Modax straightens even further, which you would not have thought possible.",
      lines = {
        { id = "yymod_front_d", text = "Because I was ordered tae stay an' drill whatever was left, an' an order's an order. I'll no' pretend it didnae sting, watchin' my company march out wi'out me, but somebody has tae turn bairns intae soldiers." },
      },
      choices = {
        { text = "Are they soldiers yet?", next = "ymod_yet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymod_yet = {
      lines = {
        { id = "yymod_yet_d", text = "Some are, an' some never will be, an' I've a choice tae make about the second lot. I could send them home tae their mams, or I could keep drillin' an' hope, for the town needs every rifle on the wall when the troggs come." },
      },
      choices = {
        { text = "Keep them. Every rifle counts, even a poor one.", next = "BACK", reply = "Aye. I'll keep them, an' drill them harder, an' pray they never need it.", fx = { align = { order = 1 } } },
        { text = "Send them home. A bad soldier is a dead one.", next = "BACK", reply = "Hard words, but maybe kind ones. I'll think on it tonight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymod_warrior = {
      lines = {
        { id = "yymod_warrior_d", text = "Feet apart, weight forward, an' dinnae lock yer knees, for a locked knee's a knee that cannae move when the axe comes. There, ye've the stance already, which is more than half the garrison had. Now hold it till I say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymod_gwarth = {
      lines = {
        { id = "yymod_gwarth_d", text = "Young Gwarth's the best o' them, though I'll never tell her so, for a soldier who's praised stops tryin'. She's down tae twenty breaths on the reload, an' I mean tae have her at fifteen before midsummer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "A town wi' an old garrison an' a green one. I'm the bit in between." } },
    mountaineers = { { id = "tp_ymountaineers", text = "The Ironforge Mountaineers. We're fewer than we were, but we'll stand." } },
    background = { { id = "tp_bg", text = "I'm the drill-master o' whatever Thelsamar has left tae drill. It keeps me busy." } },
    _none = { { id = "tp_none", text = "That's no' a garrison matter, so I've nae answer for ye. Ask the Magistrate." } },
  },
}

-- Mountaineer Ozmok: Thelsamar guard; lochside edge of town, a fisherman at heart.
P:NPC {
  key = "lm_mtn_ozmok", id = TODO_NPC("Mountaineer Ozmok"), name = "Mountaineer Ozmok", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "placid", "slow" }, values = { "patient", "nature" },
  notices = { "craft" },
  impression = {
    first = "Mountaineer Ozmok guards the side of Thelsamar that looks down on the loch and watches the water like a man waiting for a float to dip. He speaks slowly and seems to think that most trouble will pass if left alone.",
    third = "{name} met Mountaineer Ozmok, who watches the loch from Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. The streets feel a little safer with you walking them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep an eye open. Mind yourself." },
    { id = "g_default", text = "Mornin', or whatever it is by now. The loch's calm today, an' so am I." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's yerself. The water's hardly changed since ye left." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Is that a rod on yer back? Then ye'll want the reeds below the western bank at dusk, an' ye didnae hear it from a Mountaineer on duty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Ozmok. I've the lochside watch, which suits me, for there's little comes out o' the water that a patient dwarf cannae see comin' a long way off." } },
      again = {
        { id = "h_again", text = "Aye? Take yer time, the loch's no' goin' anywhere." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What comes out of the water?", next = "water" },
        { text = "You'd rather be fishing than guarding.", next = "fish" },
        { text = "What's the best catch in the loch?", next = "xcatch" },
        { text = "Do you ever worry about the dam?", next = "xdam" },
        { text = "Patience is a good trait in a guard.", next = "xpatience" },
        { text = "I'm a druid. The loch has a calm spirit.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Calm waters, Mountaineer.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "Crocolisks, when the weather warms, sunnin' themselves on the near bank as if they paid rent. They leave the town be so long as naebody's daft enough tae go paddlin' at dusk." } },
      choices = {
        { text = "And if somebody is daft enough?", next = "daft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daft = {
      lines = { { id = "d_default", text = "Then I shout, an' if shoutin' doesnae do it, I shoot, an' Marek at the lodge gets another hide for his wall. I've only had tae shoot the once, an' the lad kept both legs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = { { id = "f_default", text = "Wouldn't any dwarf wi' sense? Warg Deepwater sits on the western bank all day wi' a line in, an' naebody calls it idleness because he calls it teachin'." } },
      choices = { { text = "You sound envious. Something else.", next = "BACK", reply = "Aye, a wee bit, an' I'll admit it. Go on, then." } },
    },
    xcatch = {
      narr = "He holds his hands apart, then thinks better of it and moves them closer.",
      lines = { { id = "xca_default", text = "Loch frenzy, when they're runnin', though they bite back, an' there's a big old lunker under the dam that naebody's landed. Warg swears he hooked him once an' lost his whole rod tae it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdam = {
      lines = { { id = "xda_default", text = "The Stonewrought's held since before my grandfather, but the Dark Irons have been at it, sneakin' about the base. If it went, the whole valley would be one long loch, an' I'd be fishin' from my rooftop." } },
      choices = {
        { text = "The Mountaineers should strike the Dark Irons first.", next = "xstrike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstrike = {
      lines = { { id = "xst_default", text = "That's what Captain Rugelfuss would like, aye, an' I'd go if he asked. But a hasty dwarf makes more trouble than he stops, an' the dam's engineer keeps sayin' it's sound." } },
      choices = {
        { text = "Strike now, before they strike first.", next = "BACK", reply = "Bold words. I'll pass them on, though slowly, as is my way.", fx = { align = { honor = -1 } } },
        { text = "Wait and watch. Patience wins the long fight.", next = "BACK", reply = "A dwarf after my own heart. The loch teaches the same.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpatience = {
      lines = { { id = "xpa_default", text = "Kind o' ye tae say, though the Captain calls it slowness. I'd say it's both, an' the difference is just whether trouble comes or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "Does it, now? I've felt somethin' like that on still mornings, when the mist's on the water. I'd no' have known what tae call it, but ye've the better word." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stonewrought_dam = { { id = "xtp_dam", text = "It holds the loch back, an' it's been holdin' since long before me. Dinnae let the Dark Irons near it." } },
    fishing = { { id = "xtp_fish", text = "Dusk, reeds, western bank. That's all the wisdom I've got, an' it's served me well." } },
   
    background = { { id = "tp_bg", text = "I'm a Mountaineer by trade an' a fisherman by nature. The lochside watch lets me be a bit o' both." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. It'll come tae me in an hour or two, maybe, if ye're still about." } },
  },
}

-- Mountaineer Roghan: Thelsamar guard; a father, minds the town's children and cellars.
P:NPC {
  key = "lm_mtn_roghan", id = TODO_NPC("Mountaineer Roghan"), name = "Mountaineer Roghan", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "warm", "protective" }, values = { "family", "dutiful" },
  notices = { "race", "greenness" },
  impression = {
    first = "Mountaineer Roghan guards the houses of Thelsamar and knows every child in them by name. He is a big, gentle dwarf who took up the rifle to keep a town safe, and he says the town means the people in it.",
    third = "{name} met Mountaineer Roghan, who watches over Thelsamar's homes.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. The streets feel a little safer with you walking them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Well met, friend. Mind the wee ones if ye're ridin' through, for they run out wi'out lookin'." },
    { id = "g_back", when = { metBefore = true }, text = "Good tae see ye back safe. That's always the best news a guard gets." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Ye'll be one o' the Gnomeregan folk. We've had a few o' yer families through, an' if ye've kin still on the road, tell them Thelsamar has room." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Ye're young tae be this far from the valley, {g:lad|lass}. Stay on the road an' ye'll do, an' come an' find me if ye dinnae." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Roghan. I've three bairns o' my own in that house wi' the green door, so I guard this street as if my family lived on it, because they do." } },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Go on, friend, I'm listenin'." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What do you miss about masonry?", next = "yrog_mason" },
        { text = "My kin are still on the road from Gnomeregan.", next = "yrog_gnome", when = { race = "Gnome" } },
        { text = "Tell me about your eldest.", next = "yrog_ladle" },
        { text = "Is the town safe for children?", next = "safe" },
        { text = "Why did you become a Mountaineer?", next = "why" },
        { text = "Keep them safe, Roghan.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Inside the houses, aye, an' I'll see it stays so. It's the edges that worry me, the cellars an' the wood piles, where a tunnel rat or a kobold can get in an' a child can get curious.", fx = { learn = { "kobolds" } } } },
      choices = {
        { text = "Kobolds come into the cellars?", next = "cellar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar = {
      lines = { { id = "c_default", text = "One did, last winter, an' my eldest found it sittin' on the tattie sacks eatin' a candle. She chased it out wi' a ladle before I'd my boots on, which made me proud an' aged me ten years." } },
      choices = { { text = "She sounds like a Mountaineer already.", next = "BACK", fx = { affinity = 1 }, reply = "That's what frightens me, friend. Go on, what else?" } },
    },
    why = {
      lines = { { id = "w_default", text = "I was a mason, an' a contented one, till the troggs came up an' the Reserve went north the same year. Somebody had tae stand here, an' I found I couldnae lay stone while other dwarves' sons did it for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yrog_mason = {
      lines = {
        { id = "yyrog_mason_d", text = "The quiet o' it, an' the way a wall goes up a stone at a time an' stands for a hundred years. I built half the new houses on this street, an' it's an odd thing tae guard a door ye hung yerself." },
      },
      choices = {
        { text = "Will you go back to it?", next = "yrog_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrog_back = {
      lines = {
        { id = "yyrog_back_d", text = "When the Reserve comes home, aye, an' I've already got the first job promised. Old Bluntnose wants a new tower on the town hall, an' I've the plans drawn on the back o' a duty roster." },
      },
      choices = {
        { text = "What worries you most in town?", next = "yrog_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrog_worry = {
      narr = "Roghan glances at the green door behind him, where small faces are pressed against the glass.",
      lines = {
        { id = "yyrog_worry_d", text = "That my bairns'll grow up thinkin' troggs an' kobolds are just how the world is. I want them tae know there was a time when ye could leave a cellar door open, an' I'm no' sure they'll ever believe me." },
      },
      choices = {
        { text = "Teach them hope. The troggs won't last forever.", next = "BACK", reply = "Aye. I'll tell them stories o' the old days, an' make them true again.", fx = { align = { light = 1 } } },
        { text = "Teach them caution. The world is dangerous.", next = "BACK", reply = "Maybe ye're right. I'd sooner they were careful than sorry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrog_gnome = {
      lines = {
        { id = "yyrog_gnome_d", text = "Then tell them tae come tae Thelsamar if Ironforge is too crowded. We've room in the old granary an' blankets enough, an' my wife makes a stew that would warm a gnome down tae the gears." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yrog_ladle = {
      lines = {
        { id = "yyrog_ladle_d", text = "Morra, she's called, eight years old an' fiercer than a bear. She's taken tae carryin' the ladle wherever she goes, an' I havenae the heart tae tell her it's no' a proper weapon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thelsamar = { { id = "tp_ythelsamar", text = "A good town wi' good folk, an' I mean tae keep it that way." } },
    magistrate_bluntnose = { { id = "tp_ymagistrate_bluntnose", text = "He keeps the town's business an' wants a new tower. I'll build it for him one day." } },
    background = { { id = "tp_bg", text = "I was a mason before I was a Mountaineer, an' I'll be one again when the troggs are back underground." } },
    kobolds = { { id = "tp_kob", text = "More nuisance than danger, unless ye're small. I keep them out o' the cellars." } },
    _none = { { id = "tp_none", text = "I'm sorry, I dinnae know. Ask Magistrate Bluntnose, for he keeps the town's business." } },
  },
}

-- Mountaineer Swarth: Thelsamar guard; taciturn, mistrusts magic.
P:NPC {
  key = "lm_mtn_swarth", id = TODO_NPC("Mountaineer Swarth"), name = "Mountaineer Swarth", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "dour", "suspicious" }, values = { "dutiful", "tradition" },
  notices = { "class" },
  impression = {
    first = "Mountaineer Swarth is a dark-bearded, unsmiling guard who trusts stone, steel and powder, in that order. Anything that glows he regards as a matter for the watch.",
    third = "{name} met Mountaineer Swarth, a dour guard in Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "State your business quickly, and then be on your way." },
    { id = "g_default", text = "State yer business in Thelsamar, an' state it plain." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye caused nae trouble last time, an' I'll expect the same today." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell brimstone on ye from here. Keep whatever follows ye on a short leash in this town, for I'll shoot it first an' hear yer reasons after." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A spell-flinger. Keep yer sparks away from the powder store by the League hall, an' we'll have nae quarrel." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Swarth. I'm no' much for talk, so ask what ye need an' I'll answer what I can." } },
      again = {
        { id = "h_again", text = "Is there more?" },
        { id = "h_again2", text = "Go on, then, if ye must." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why do you trust powder over people?", next = "yswa_trust" },
        { text = "I'm a dwarf. Do I pass your inspection?", next = "yswa_dwarf", when = { race = "Dwarf" } },
        { text = "Where is the powder store?", next = "yswa_powder" },
        { text = "You don't care for visitors, do you?", next = "visitors" },
        { text = "What do you watch for?", next = "watch" },
        { text = "My magic bothers you, I can tell.", next = "magic", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    visitors = {
      lines = { { id = "v_default", text = "I care for them well enough once I know what they are. It's the no' knowin' I dislike, an' these days half o' what comes up the road is somethin' I've nae name for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Dark Irons. Everybody else has their eyes on the troggs, an' a trogg couldnae plan a supper, yet somebody knew just where tae lay for the League's powder on the dig road.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "You think there are spies in Loch Modan?", next = "spies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spies = {
      lines = { { id = "s_default", text = "I think a Dark Iron's a dwarf, an' can pass for one of us in a hood on a wet night. I look hard at every beard that comes through, an' I'll no' apologise for it." } },
      choices = { { text = "That's a grim way to live. Something else.", next = "BACK", reply = "It's a grim neighbour we have. What else?" } },
    },
    magic = {
      lines = { { id = "m_default", text = "It does, an' I'll say so tae yer face rather than behind ye. It was sorcery that buried the Dark Irons' own city in fire, an' I've never seen why we should trust it more than they should have." } },
      choices = { { text = "Honest, at least. Something else.", next = "BACK" } },
    },
    yswa_trust = {
      lines = {
        { id = "yyswa_trust_d", text = "Because powder does what it's told an' people dinnae. I trusted a cousin once, a Bronzebeard born an' raised, an' he sold the plans o' the Thandol Span tae a Dark Iron agent for a purse o' gold. I've no' trusted easy since." },
      },
      choices = {
        { text = "What happened to your cousin?", next = "yswa_cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yswa_cousin = {
      narr = "Swarth's jaw tightens beneath the dark beard.",
      lines = {
        { id = "yyswa_cousin_d", text = "They hanged him in Ironforge, an' my family's name went wi' him for a generation. I took the green tae win it back, an' I'll no' rest till I've caught a Dark Iron spy wi' my own hands." },
      },
      choices = {
        { text = "Have you caught one yet?", next = "yswa_caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yswa_caught = {
      lines = {
        { id = "yyswa_caught_d", text = "No' yet, though I've stopped three dwarves I was sure of an' been wrong about every one. The Magistrate says I'm makin' enemies o' honest folk, an' he's likely right, but I'd sooner shame three honest dwarves than miss one traitor." },
      },
      choices = {
        { text = "Better to shame the innocent than miss a spy.", next = "BACK", reply = "Aye. Ye understand, then. Most dinnae, till it's too late.", fx = { align = { order = 1 } } },
        { text = "Suspicion without proof poisons a town. Stop it.", next = "BACK", reply = "Maybe it does. But a spy poisons it worse, an' quieter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yswa_dwarf = {
      lines = {
        { id = "yyswa_dwarf_d", text = "Ye've a Bronzebeard's look an' an honest eye, which counts for somethin' an' no' for everythin'. Ye'll pass today, friend, but dinnae take offence if I look twice tomorrow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yswa_powder = {
      lines = {
        { id = "yyswa_powder_d", text = "Beside the Explorers' League hall, in a stone cellar wi' an iron door, an' it's the only thing in Thelsamar I'd give my life tae keep. If the Dark Irons want tae hurt this town, that's where they'll strike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thandol_span = { { id = "tp_ythandol_span", text = "The great bridge north o' the Wetlands. The Dark Irons broke it, wi' help they shouldnae have had." } },
    explorers_league = { { id = "tp_yexplorers_league", text = "They dig an' they talk. I guard their powder an' leave the talkin' tae them." } },
    background = { { id = "tp_bg", text = "I'm a Mountaineer. That's all ye need from me." } },
    dark_iron = { { id = "tp_di", text = "They're dwarves, an' that's the danger. Look twice at any beard ye dinnae know." } },
    _none = { { id = "tp_none", text = "I've nothin' tae say on that." } },
  },
}

-- Mountaineer Uthan: Thelsamar guard; bookish, posted by the Explorers' League hall.
P:NPC {
  key = "lm_mtn_uthan", id = TODO_NPC("Mountaineer Uthan"), name = "Mountaineer Uthan", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "curious", "earnest" }, values = { "knowledge", "dutiful" },
  notices = { "lore", "craft" },
  impression = {
    first = "Mountaineer Uthan stands guard near the Explorers' League hall in Thelsamar and listens through the door when he thinks no one is looking. He has a soldier's post and a scholar's questions.",
    third = "{name} met Mountaineer Uthan, a bookish guard by Thelsamar's League hall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Well met! Ye havenae come from one o' the digs, by any chance? I'd dearly like tae hear what they've turned up." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Have ye seen anythin' old an' strange since we last spoke?" },
  },
  notice = {
    { id = "n_league", cat = "lore", when = { origin = "dwarf_explorers_league" },
      text = "Ye've the League's look, wi' the dust in yer cuffs an' a notebook in yer coat. I'd give my rifle tae have what's in that book." },
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "A miner's pick! Have ye ever broken intae anythin' that wasnae just rock, a worked wall or a carved stone? I'm always askin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Uthan. I guard the League's door, an' I'd be on the other side of it if my father hadnae been a Mountaineer an' his father before him.", fx = { learn = { "explorers_league" } } } },
      again = {
        { id = "h_again", text = "What else? I've plenty o' questions myself, if ye run short." },
        { id = "h_again2", text = "Aye, go on!" },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What dig would you most like to see?", next = "yuth_dig" },
        { text = "Do the night elves remember the titans?", next = "yuth_elf", when = { race = "NightElf" } },
        { text = "What's Jern Hornhelm like?", next = "yuth_hornhelm" },
        { text = "What is the League digging for?", next = "dig" },
        { text = "You'd rather be a prospector.", next = "rather" },
        { text = "I've been to Ironband's dig, as it happens.", next = "been", when = { questDone = TODO_QUEST("Ironband's Excavation") } },
        { text = "Good day, Mountaineer.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "For where we came from, nae less. The League holds that the dwarves were made by somethin' far older, shaped out o' the stone itself, an' that the proof's lyin' under hills like these." } },
      choices = {
        { text = "Do you believe it?", next = "believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe = {
      lines = { { id = "b_default", text = "I want tae, which isnae the same, as Jern Hornhelm keeps tellin' me. But I've stood in the Valley o' Kings an' looked at what dwarves can carve, an' I wonder what carved the first of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rather = {
      lines = { { id = "r_default", text = "I would, an' I'll no' deny it. I read what I can beg from Hornhelm's shelf on my off hours, an' Torren Squarejaw lets me ask three questions a day, which he counts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    been = {
      lines = { { id = "be_default", text = "Ye have? Then tell me, is it true the lower diggin's go down intae worked stone, wi' walls that naebody living cut? Nae, dinnae tell me here, for I'll be useless on watch all day thinkin' about it." } },
      choices = { { text = "Another time, then. Something else.", next = "BACK" } },
    },
    yuth_dig = {
      lines = {
        { id = "yyuth_dig_d", text = "Uldaman, in the Badlands, where the League says there's a whole hall o' titan work under the mountain. My father wouldnae hear o' it, but he's gone now, an' I've saved enough tae buy a pick an' a ticket south one day." },
      },
      choices = {
        { text = "Why didn't your father approve?", next = "yuth_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yuth_father = {
      lines = {
        { id = "yyuth_father_d", text = "He said the past was for those who had nae present, an' a Mountaineer had a present every day he drew breath. He was a good soldier an' a hard man, an' I loved him, though I never once agreed wi' him." },
      },
      choices = {
        { text = "Will you leave the Mountaineers for the League?", next = "yuth_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yuth_leave = {
      narr = "Uthan glances at the League door, then down at the green on his shoulder.",
      lines = {
        { id = "yyuth_leave_d", text = "That's the question I ask myself every night. The town's short o' rifles, an' my father's name is on the wall o' the garrison, but there's a whole world under the ground waitin' tae tell us what we are. I dinnae know what's right." },
      },
      choices = {
        { text = "Stay. The town needs your rifle now.", next = "BACK", reply = "Aye, that's my father's answer, an' maybe it's mine too. For now, anyway.", fx = { align = { order = 1 } } },
        { text = "Go. A life spent wishing is no life at all.", next = "BACK", reply = "Ye sound like Hornhelm. I'll think on it, an' maybe I'll listen this time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yuth_elf = {
      lines = {
        { id = "yyuth_elf_d", text = "Ye do? Ah, I'd give a month's pay tae sit wi' one o' yer scholars. The League has theories, but yer folk were there when the world was young, or near enough, an' I'd love tae know if yer tales match ours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yuth_hornhelm = {
      lines = {
        { id = "yyuth_hornhelm_d", text = "Jern's a careful dwarf who doubts everythin' till he's seen it three times, an' then doubts it once more for luck. He lends me books but never the good ones, an' I've begun tae think he keeps those for himself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    uldaman = { { id = "tp_yuldaman", text = "The great titan dig in the Badlands. I'll see it one day, if I live long enough." } },
    titans = { { id = "tp_ytitans", text = "The makers o' the dwarves, if the League is right. I hope it is." } },
    background = { { id = "tp_bg", text = "Third Mountaineer in my family, an' the first who can name every dig the League's opened." } },
    explorers_league = { { id = "tp_el", text = "They're diggin' for our beginnin's. I guard the door an' wish I were through it." } },
    _none = { { id = "tp_none", text = "I dinnae know, but I'd like tae! If ye find out, come back an' tell me." } },
  },
}

-- Mountaineer Wuar: Thelsamar guard; minds the rams and riders in the street.
P:NPC {
  key = "lm_mtn_wuar", id = TODO_NPC("Mountaineer Wuar"), name = "Mountaineer Wuar", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "cranky", "fond" }, values = { "dutiful", "nature" },
  notices = { "pet", "race" },
  impression = {
    first = "Mountaineer Wuar polices the road through Thelsamar and has a standing quarrel with anyone who rides through it too fast. He is short with people and remarkably tender with anything that has hooves.",
    third = "{name} met Mountaineer Wuar, who minds the riders and rams on Thelsamar's road.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "State your business quickly, and then be on your way." },
    { id = "g_default", text = "Walk yer beast through the town, {class}, if ye've one. There's nae race bein' run here that I've heard of." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye kept tae a walk last time, so I've nae complaint." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a handsome creature ye've got at heel, an' better mannered than most o' the riders I see. What d'ye feed it?" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Ye're no' bringin' one o' those clankin' strider contraptions through here, are ye? The last one put Lina's rams off their feed for a week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Wuar. I keep the road through town clear, which means shoutin' at riders, an' I keep an eye on the stable, which means I get tae see some decent company." } },
      again = {
        { id = "h_again", text = "What else? Out wi' it." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How did you come to love rams?", next = "ywua_rams" },
        { text = "My pet here is well-trained.", next = "ywua_pet", when = { class = "HUNTER" } },
        { text = "Who keeps the stables?", next = "ywua_lina" },
        { text = "Do riders really cause that much trouble?", next = "riders" },
        { text = "You like the animals better than the people.", next = "animals" },
        { text = "I'll keep to a walk.", next = "END" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "A courier came through at a gallop last month an' put a cart in the ditch, a hen in the well an' the Magistrate in a temper, all before he'd reached the inn. I've had the speed o' this road as my business ever since." } },
      choices = {
        { text = "What became of the courier?", next = "courier" },
        { text = "Something else.", next = "BACK" },
      },
    },
    courier = {
      lines = { { id = "c_default", text = "He spent an afternoon fishin' a hen out o' a well wi' a bucket, an' he walked his ram out o' town after. The hen's fine, though she'll no' go near water now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    animals = {
      lines = { { id = "a_default", text = "A ram tells ye when it's angry an' forgives ye by supper, an' I cannae say the same for most dwarves. Lina Hearthstove at the stable's the same way o' thinkin', an' she's the best company in Thelsamar for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywua_rams = {
      lines = {
        { id = "yywua_rams_d", text = "My family's farmed rams in the hills above Kharanos for six generations, an' I was ridin' before I was walkin'. My da wanted me tae take the farm, but I fancied the green, so my sister has the farm an' I have the shoutin'." },
      },
      choices = {
        { text = "Do you regret taking the green?", next = "ywua_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywua_regret = {
      lines = {
        { id = "yywua_regret_d", text = "Some mornin's, when the snow's fresh on the hills an' I think o' the herd out on it. But a ram farm needs only one dwarf tae run it, an' my sister's better at it than I'd ever be." },
      },
      choices = {
        { text = "Is anything wrong at the stables?", next = "ywua_stable" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywua_stable = {
      narr = "Wuar rubs the back of his neck and looks over at the stable fence.",
      lines = {
        { id = "yywua_stable_d", text = "Two o' Lina's rams have gone lame this month, an' she thinks somebody's been feedin' them somethin' bad through the fence. I've a suspicion it's a rival trader from Ironforge who wants her custom, but I cannae prove it." },
      },
      choices = {
        { text = "Bring it to the Magistrate. Let the law handle it.", next = "BACK", reply = "Aye, that's proper. I'll go tae Bluntnose tomorrow wi' what I've got.", fx = { align = { order = 1 } } },
        { text = "Catch him yourself and teach him a lesson.", next = "BACK", reply = "Dinnae tempt me, {class}. I've a fist that's been itchin' for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywua_pet = {
      lines = {
        { id = "yywua_pet_d", text = "Aye, I can see it is, an' better behaved than most o' the dwarves in this town. Keep it at heel through the square, an' if it fancies a drink, there's a trough by the stable that Lina keeps fresh." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ywua_lina = {
      lines = {
        { id = "yywua_lina_d", text = "Lina Hearthstove, Vidra's sister, an' the kindest hand wi' a ram I've ever seen. She knows every beast in her stable by name an' temper, an' she'd sooner lose a customer than sell a ram tae a bad rider." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rams = { { id = "tp_yrams", text = "The finest beasts in Khaz Modan. I'd trust a ram before most dwarves." } },
    lina_hearthstove = { { id = "tp_ylina_hearthstove", text = "She keeps the stable, an' she keeps it well. I keep the road clear for her beasts." } },
    background = { { id = "tp_bg", text = "I was raised on a ram farm in Dun Morogh before I took the green. I've never lost the smell o' it, an' I dinnae want tae." } },
    _none = { { id = "tp_none", text = "Nae idea. If it's no' on four legs or on my road, I've likely missed it." } },
  },
}

-- Mountaineer Stenn: patrols from Thelsamar a short way north.
P:NPC {
  key = "lm_mtn_stenn", id = TODO_NPC("Mountaineer Stenn"), name = "Mountaineer Stenn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "thelsamar" }, temper = { "wry", "restless" }, values = { "dutiful", "humor" },
  notices = { "travel" },
  impression = {
    first = "Mountaineer Stenn walks the shortest patrol in Loch Modan, from Thelsamar a little way up the north road and back. He has counted every step of it and is funny about it in the way of someone who would rather not be.",
    third = "{name} met Mountaineer Stenn, who patrols the short stretch of road north of Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep an eye open. Mind yourself." },
    { id = "g_default", text = "Hello, {class}. Walk wi' me if ye like, though I warn ye we'll be turnin' round before ye've finished a sentence." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! I've been tae the turnin' post an' back forty times since I saw ye last." },
  },
  notice = {
    { id = "n_far", cat = "travel", when = { race = { "NightElf", "Human" } },
      text = "Ye've come a long road tae get here, further than I'll walk in a year o' patrols laid end tae end. What's it like, goin' somewhere?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Stenn. My patrol runs from the town's edge tae a white stone on the north road, which is six hundred an' twelve paces, an' then it runs back again." } },
      again = {
        { id = "h_again", text = "What else? We've a few paces left before I turn." },
        { id = "h_again2", text = "Aye, go on, an' walk while ye talk." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why such a short patrol?", next = "short" },
        { text = "Does anything ever happen on it?", next = "happen" },
        { text = "What do you think about on your walk?", next = "xthink" },
        { text = "Who's Mountaineer Flint?", next = "xflint" },
        { text = "Would you rather have a longer patrol?", next = "xlonger" },
        { text = "I'm a hunter. I'd find six hundred paces dull.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Enjoy the walk, Stenn.", next = "END" },
      },
    },
    short = {
      lines = { { id = "s_default", text = "Because Mountaineer Flint has the road beyond the stone, all the way tae Algaz, an' the Captain wants a rifle within a shout o' the town at every hour. I'm the shout, ye might say." } },
      choices = {
        { text = "Do you ever go past the stone?", next = "past" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "Once, by eleven paces, tae see what it felt like. Flint was comin' the other way an' asked if I was lost, an' I've no' heard the end of it at the Stoutlager since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    happen = {
      lines = { { id = "ha_default", text = "A bear came down tae the road in the spring an' looked at me, an' I looked at it, an' we both decided we'd somewhere else tae be. That's the year's excitement, an' I'm glad of it, for a dull patrol means a safe town." } },
      choices = { { text = "That's the right way to see it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xthink = {
      narr = "He counts under his breath as he walks, then loses his place and starts again.",
      lines = { { id = "xth_default", text = "Mostly the count, for if I lose it I've tae start over, an' that's a long walk back. Sometimes I think about the troggs in the north hills, an' sometimes about my supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xflint = {
      lines = { { id = "xfl_default", text = "My opposite on the long road, a fine Mountaineer an' a terrible winner at cards. He's seen troggs an' Dark Irons an' once a bear wearin' a pot for a helmet, so he says." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlonger = {
      lines = { { id = "xlo_default", text = "Some days I would, aye, out tae Algaz an' the pass where the real work is. Other days I think the town needs one Mountaineer who's always close enough tae hear it shout." } },
      choices = {
        { text = "Ask for the long road. Prove yourself.", next = "BACK", reply = "Maybe I will. Flint will laugh, but maybe I will.", fx = { align = { order = -1 } } },
        { text = "Stay close. A town needs its near guard.", next = "BACK", reply = "Aye, that's how the Captain sees it too. I'll keep my six hundred.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Dull, aye, but every stone on this road has a name now, an' I know which rabbits live under which. Ye'd be surprised what ye notice when ye walk the same path a thousand times." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thelsamar = { { id = "xtp_thel", text = "My town, an' a good one. I see more o' its north edge than anyone alive." } },
    troggs = { { id = "xtp_trogg", text = "They stay in the north hills, mostly. If one comes down my road, I'll be the first tae know." } },
   
    background = { { id = "tp_bg", text = "I'm the Mountaineer wi' the shortest walk in Khaz Modan. Somebody has tae be." } },
    _none = { { id = "tp_none", text = "I couldnae say. News has tae come tae me, for I dinnae get far enough tae fetch it." } },
  },
}

-- Mountaineer Flint: patrols the road between Thelsamar and Algaz Station.
P:NPC {
  key = "lm_mtn_flint", id = TODO_NPC("Mountaineer Flint"), name = "Mountaineer Flint", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "brisk", "sharp" }, values = { "dutiful", "vigilant" },
  notices = { "travel", "soldier" },
  impression = {
    first = "Mountaineer Flint walks the north road between Thelsamar and Algaz Station at a pace that makes conversation an effort. He reads the verge for tracks as he goes and seldom breaks stride to do it.",
    third = "{name} met Mountaineer Flint, who patrols the road between Thelsamar and Algaz Station.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've done right by this place, and the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Keep up if ye want tae talk, {class}, for I've a road tae cover before dark." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're on my road again. Any trouble behind ye?" },
  },
  notice = {
    { id = "n_hunter", cat = "soldier", when = { class = "HUNTER" },
      text = "Ye read the ground as ye walk, same as I do. See that scuff by the ditch? That's a bear, an' it crossed within the hour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Flint. I've the north road from the white stone tae Algaz Station, an' everythin' that crosses it is my affair, whether it's on two legs, four or eight." } },
      again = {
        { id = "h_again", text = "What else? Talk as we go." },
        { id = "h_again2", text = "Aye, quickly." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Those hobnailed prints. Where did they lead?", next = "yfli_prints" },
        { text = "Teach me to read the ground like you.", next = "yfli_teach", when = { class = { "HUNTER", "ROGUE", "DRUID" } } },
        { text = "Where is the white stone?", next = "yfli_white" },
        { text = "What crosses your road most?", next = "cross" },
        { text = "Is the road safe to travel?", next = "safe" },
        { text = "I won't slow you down.", next = "END" },
      },
    },
    cross = {
      lines = { { id = "c_default", text = "Bears goin' down tae the loch tae drink, an' spiders comin' out o' the trees after the bears. The troggs cross further south, an' I'd be obliged if they kept tae that habit." } },
      choices = {
        { text = "And anything on two legs?", next = "two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    two = {
      lines = { { id = "t_default", text = "Travellers from the Wetlands, lookin' half drowned, an' now an' then a boot print I cannae place, narrow an' hobnailed an' headin' off the road. I've told Rockgar at the station, an' he likes it nae more than I do.", fx = { learn = { "dark_iron" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "By day, on the stones, aye. Leave the road for the trees on the west side an' ye're in lurker country, an' I'll no' be comin' in after ye till I've finished my round." } },
      choices = { { text = "I'll keep to the stones. Something else.", next = "BACK" } },
    },
    yfli_prints = {
      lines = {
        { id = "yyfli_prints_d", text = "Off the road tae the west, toward the Stonewrought Dam, an' then onto bare rock where I lost them. Three sets, walkin' close an' heavy, like folk carryin' somethin' they didnae want tae drop." },
      },
      choices = {
        { text = "Have you told anyone?", next = "yfli_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfli_told = {
      lines = {
        { id = "yyfli_told_d", text = "I told Rockgar, an' he sent word tae the dam, an' the dam's foreman sent back that all was well. I'd like tae believe him, but a foreman who says all's well is usually a foreman who hasnae looked." },
      },
      choices = {
        { text = "What do you think they were carrying?", next = "yfli_carry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfli_carry = {
      narr = "He stops walking for the first time and lowers his voice.",
      lines = {
        { id = "yyfli_carry_d", text = "Powder, if ye want my fear o' it. Dark Iron love their black powder, an' that dam holds back the whole loch. I'd go look myself, but if I leave the road an' somethin' crosses it, that's on my head as well." },
      },
      choices = {
        { text = "Stay on your road. That's your post.", next = "BACK", reply = "Aye, that's the soldier's answer, an' I'll give it. Maybe ye'll go look for me.", fx = { align = { order = 1 } } },
        { text = "Go to the dam. The prints matter more.", next = "BACK", reply = "Ye might be right. I'll ask Harn tae cover me an' go at first light.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfli_teach = {
      lines = {
        { id = "yyfli_teach_d", text = "Look low an' look for what's wrong, no' for what's there. A bent stalk, a turned stone wet on top, a print wi' the edge still sharp. Ye've the eye already, I can see, ye only need tae slow down, which is a strange thing tae hear from me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfli_white = {
      lines = {
        { id = "yyfli_white_d", text = "The white stone by the fork, where the road splits for the station an' the town. My patrol starts there because my da's patrol did, an' his da's before that, though naebody remembers why it's white." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonewrought_dam = { { id = "tp_ystonewrought_dam", text = "The dam holds the loch. I've seen prints near it I dinnae like, an' naebody else seems worried." } },
    algaz_station = { { id = "tp_yalgaz_station", text = "North end o' my road. Rockgar's there, an' he listens, though he cannae do much." } },
    background = { { id = "tp_bg", text = "I walk the north road, there an' back, every day. I know it better than my own hearth." } },
    dark_iron = { { id = "tp_di", text = "I've found prints I dinnae like. That's all I'll say till I've found the boots." } },
    _none = { { id = "tp_none", text = "Dinnae know. Ask at whichever end o' the road ye're headed for." } },
  },
}

-- Mountaineer Droken: patrols from Thelsamar to the Valley of Kings.
P:NPC {
  key = "lm_mtn_droken", id = TODO_NPC("Mountaineer Droken"), name = "Mountaineer Droken", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lochmodan" }, temper = { "steady", "talkative" }, values = { "dutiful", "helpful" },
  notices = { "greenness", "travel" },
  impression = {
    first = "Mountaineer Droken walks the long south road between Thelsamar and the Valley of Kings and treats it like a street he lives on. He gives directions before anyone asks for them and is usually right about where they were going.",
    third = "{name} met Mountaineer Droken, who patrols the road from Thelsamar to the Valley of Kings.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome here, and I'll tell the others so if they ask." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Good day tae ye! Thelsamar's north along the road an' the valley's south, an' if ye want anywhere else, I can likely point ye." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know yer face. Did ye find the place I sent ye?" },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Fresh up from Dun Morogh, are ye? Then keep tae this road as far as Thelsamar an' dinnae let the hills tempt ye west, for that's trogg ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Droken. I've the south road, from the town tae the valley gates, an' I've walked it so often I could tell ye which stones are loose." } },
      again = {
        { id = "h_again", text = "Where else can I point ye?" },
        { id = "h_again2", text = "Aye, ask away." },
      },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you ever get tired of the same road?", next = "ydro_tired" },
        { text = "Where's the best place for a hunter to camp?", next = "ydro_hunt", when = { class = "HUNTER" } },
        { text = "Do you buy from Greishan's cart?", next = "ydro_greishan" },
        { text = "What should a newcomer know about this road?", next = "road" },
        { text = "Where does the danger lie?", next = "danger" },
        { text = "Thanks for the directions.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "That it's a longer walk than it looks from the valley, an' that there's naught tae eat on it unless ye meet Greishan Ironstove wi' his bread. The Stoutlager's at the far end, an' it's worth the blisters." } },
      choices = {
        { text = "Who is Greishan Ironstove?", next = "greishan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greishan = {
      lines = { { id = "g_default2", text = "A baker who took his shop on the road, for he reckoned hungry guards were surer custom than a town. He walks from the valley clear up tae Dun Algaz, an' every Mountaineer on the way knows the sound o' his step." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "West o' the road, the whole way down. The Stonesplinter troggs hold the valley over that ridge, an' they've started comin' tae the crest tae watch the carts go by, which I dinnae care for.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ydro_tired = {
      lines = {
        { id = "yydro_tired_d", text = "Tired? Nae, for it's never the same road twice. One day it's a merchant's cart stuck in the mud by the brook, the next it's a bear on the bridge or a lost gnome lookin' for Ironforge, an' I'm the one who sorts them all out." },
      },
      choices = {
        { text = "Do you have a family in Thelsamar?", next = "ydro_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydro_family = {
      lines = {
        { id = "yydro_family_d", text = "A wife an' two wee ones in the house by the inn, aye, an' they think the road's the most excitin' place in the world because o' the tales I bring home. I bend the tales a bit, I'll admit, so the bears are bigger an' I'm braver." },
      },
      choices = {
        { text = "Does it worry your wife, you on the road?", next = "ydro_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydro_worry = {
      narr = "Droken scratches his beard and glances west toward the ridge.",
      lines = {
        { id = "yydro_worry_d", text = "It does now, since the troggs started watchin' the carts from the crest. She wants me tae ask for the town gate instead, an' I keep tellin' her the road needs a dwarf who knows it, but I've no' told her about the arrow that missed me last week." },
      },
      choices = {
        { text = "You should tell her. She deserves the truth.", next = "BACK", reply = "Ye're right, an' I know it. I'll tell her tonight, over supper, an' bear the shoutin'.", fx = { align = { honor = 1 } } },
        { text = "Keep it quiet. Why frighten her for nothing?", next = "BACK", reply = "Aye, that's what I thought. Still, it sits heavy on me when I walk in the door.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydro_hunt = {
      lines = {
        { id = "yydro_hunt_d", text = "The hills east o' the road, by the farms, where the boars come down tae root an' the bears follow them. Keep away from the west side, for the troggs'll find ye before ye find any game." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydro_greishan = {
      lines = {
        { id = "yydro_greishan_d", text = "Greishan says I'm his best customer an' his worst, for I buy a loaf every mornin' an' never pay on the same day. He keeps a slate for me at the Thelsamar end, an' I settle it every month, near enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    valley_of_kings = { { id = "tp_yvalley_of_kings", text = "The south end o' my road, wi' the great stone kings watchin' the gate. Ye'll feel small walkin' under them." } },
    greishan = { { id = "tp_ygreishan", text = "The bakin' dwarf who walks the roads. Best bread in Loch Modan, an' he'll tell ye so himself." } },
    background = { { id = "tp_bg", text = "I walk the south road an' I point folk where they're goin'. It's a useful life." } },
    troggs = { { id = "tp_tr", text = "West o' my road, over the ridge. They watch the carts now, an' I watch them back." } },
    _none = { { id = "tp_none", text = "I cannae point ye tae that one, I'm afraid. Try the Magistrate in Thelsamar." } },
  },
}
