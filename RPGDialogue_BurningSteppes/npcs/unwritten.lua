-- Burning Steppes: folk a roster scan found with no conversation yet. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Expeditionary Priest: Ironforge dwarf priests camped at Draco'dar in the far southwest of the Steppes.
P:NPC {
  key = "bs_expeditionary_priest", id = TODO_NPC("Expeditionary Priest"), name = "Expeditionary Priest",
  bible = "bibles/burningsteppes.md", role = "priest", tier = "service",
  communities = { "dracodar" }, temper = { "steady", "warm" }, values = { "faith", "duty" },
  notices = { "class" },
  impression = {
    first = "A dwarf priest of the Ironforge expedition camped at Draco'dar, as far from any road as a dwarf can get in the Burning Steppes. Soot sat in every line of the priest's face.",
    third = "{name} met an Ironforge expeditionary priest at Draco'dar in the Burning Steppes.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Light love ye, ye've found us a third time! I'll start believin' the Light sends ye on purpose, an' I'll thank it proper tonight." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye've found Draco'dar again, more's the pity. The Light bids me bless ye, an' so I will, but I'll keep it short." },
    { id = "g_default", text = "Light's blessing on ye, traveller, an' how in the world did ye find us out here? Nobody comes to Draco'dar but dragons an' the odd lost gryphon." },
    { id = "g_back", when = { metBefore = true }, text = "Ye found us twice! Either ye've a fine sense o' direction or the Light's playin' a joke on the both of us." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A fellow servant o' the Light! Ye'll understand, then, why a priest walks wi' the diggers, for there's no place in the world that needs blessin' more than this." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We're the expedition's priests, sent from Ironforge to keep the diggers whole an' their spirits up. The Steppes burn day an' night, an' between the Blackrock orcs an' the black dragons, there's always someone in need o' mendin'." } },
      again = { { id = "h_again", text = "Aye, what else is on yer mind?" } },
      choices = {
        { text = "The Light walks with the diggers, even this near the dragons.", next = "BACK", reply = "Aye, it does, an' I'd not be out here if I didnae believe it with my whole heart.", fx = { align = { light = 1 } } }, -- dp_stance
        { text = "No prayer will stop a dragon. Trust your axes instead.", next = "BACK", reply = "Axes are fine things, friend, but I've seen what's left of the lads who trusted only that.", fx = { align = { light = -1 } } }, -- dp_stance
        { text = "What is the expedition looking for here?", next = "dig" },
        { text = "How do you keep faith in a place like this?", next = "faith" },
        { text = "The Steppes look dead from the air.", next = "steppes" },
        { text = "Who leads the expedition?", next = "xlead" },
        { text = "Have the black dragons attacked you?", next = "xdragons" },
        { text = "What do you think of the Dark Irons?", next = "xdark" },
        { text = "I'm a dwarf too. How can I help?", next = "BACK", when = { race = "Dwarf" }, reply = "Bless ye, cousin. Bring water if ye can find it, an' a strong arm for the diggers. Every pair o' hands is worth a prayer out here." },
        { text = "Have you lost anyone out here?", next = "ylost" },
        { text = "Who do you pray for?", next = "ypray" },
        { text = "Light keep you.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Old things, an' answers about them, the way the Explorers' League is always after. There were dwarves in these lands before Thaurissan's folly set them burnin', an' we'd like to know what's left before the dragons take it all." } },
      choices = {
        { text = "Some ruins should stay buried.", next = "BACK", reply = "Maybe so, but I'd rather know what's under my feet than guess. Ignorance never saved a dwarf yet.", fx = { align = { order = 1 } } },
        { text = "Dig it all up. History belongs to Ironforge.", next = "BACK", reply = "That's the League talkin', an' I'll not argue wi' ye. Just mind ye don't dig up a dragon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = { { id = "f_default", text = "Same as anywhere, one prayer at a time. When a lad comes in wi' burns from Blackrock Mountain an' walks out again on his own feet, I don't need a sermon to tell me the Light's still here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steppes = {
      lines = { { id = "s_default", text = "Dead an' burnin', aye, ever since the Dark Irons called up Ragnaros an' the mountain split open. Morgan's Vigil holds the east, an' we hold this wee corner, an' the rest belongs to the orcs an' the flame." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlead = {
      lines = {
        { id = "xxlead_0", text = "The League sends a leader, but out here it's the diggers who decide where to dig an' the priests who decide when to stop. We argue about it every night, cheerfully enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdragons = {
      lines = {
        { id = "xxdragons_0", text = "Twice, from above, wi' fire. We lost a tent an' a good mule, an' two diggers were burned badly. I've seen dragon-fire wounds that wouldnae heal for weeks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdark = {
      lines = {
        { id = "xxdark_0", text = "They're dwarves, same as us, an' they chose fire over the mountain's heart. Some o' my brothers say they're beyond the Light. I'm not so sure. Are they?" },
      },
      choices = {
        { text = "No one is beyond the Light. Not even them.", next = "BACK", reply = "That's my heart's answer too. It's a hard one to keep, out here.", fx = { align = { light = 1 } } },
        { text = "They chose Ragnaros. Let them burn with him.", next = "BACK", reply = "Aye, many would agree. I'll pray for them anyway.", fx = { align = { light = -1 } } },
      },
    },
  
    ylost = {
      lines = {
        { id = "yexpedi_ylost_d", text = "Two, this season. A digger crushed in a tunnel collapse, an' a young priest who went out alone tae help a wounded scout. The scout lived. The priest didnae. I buried him by the camp, under a cairn o' black stone." },
      },
      choices = {
        { text = "Was it right for him to go alone?", next = "yright" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yright = {
      lines = {
        { id = "yexpedi_yright_d", text = "The expedition leader says nae, that he broke the rule an' paid for it. I say he did what a priest should do, an' the rule was wrong. We've argued about it every night since. Neither of us is winnin'." },
      },
      choices = {
        { text = "The rule keeps priests alive. He broke it.", next = "BACK", reply = "Aye. The leader says the same. Maybe I'm only grievin'.", fx = { align = { order = 1 } } },
        { text = "He did right. A priest goes where he's needed.", next = "BACK", reply = "Thank ye. I'll tell his mother that, when I write.", fx = { align = { order = -1 } } },
      },
    },
    ypray = {
      lines = {
        { id = "yexpedi_ypray_d", text = "For the diggers, for the dead, an' for the Dark Irons, though I'll nae say that last one too loud. Every soul under the Light, even the ones who turned from it. Especially those, maybe." },
        { id = "yexpedi_ypray_v0", when = { class = "PRIEST" }, text = "For the diggers, for the dead, an' for the Dark Irons, quietly. Ye're a priest yerself, so ye'll know. The ones who turned from the Light need it most." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dracodar = { { id = "yexpedi_tp_dracodar", text = "Draco'dar's the most dangerous dig in the Steppes. We're here because the League says it's worth it." } },
    morgans_vigil = { { id = "yexpedi_tp_morgans_vigil", text = "Morgan's Vigil holds the east of the Steppes. Good folk, though they're more soldiers than scholars." } },

    dark_irons = { { id = "tp_xdark_irons", text = "Our kin, lost to fire. I pray for them, though they'd laugh at it." } },
    explorers_league = { { id = "tp_xexplorers_league", text = "Fine folk, if a bit too eager to dig where they shouldnae." } },
    background = { { id = "tp_bg", text = "Ironforge raised me an' the Light called me, an' the expedition sent me somewhere hot." } },
    _none = { { id = "tp_none", text = "I'm a healer, not a scholar, friend. Ask the diggers, they never stop talkin'." } },
  },
}

-- Elder Dawnstrider: an ancestor spirit honoured during the Lunar Festival. She stands, improbably, at Flame Crest in the ash of the Burning Steppes.
P:NPC {
  key = "bs_elder_dawnstrider", id = 15585, name = "Elder Dawnstrider", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A tauren spirit, very far from the plains, standing in the ash.",
    third = "{name} paid respects to Elder Dawnstrider, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Even here, in all this smoke, the new year comes. Welcome, {class}, to an old walker's strange resting place." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the ash and the old walker. The Earth Mother is patient, and so am I." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dawnstrider the Elder") }, text = "You have my coin already. Carry it out of this burnt land and somewhere green." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "A child of the plains, here among the dragons and the fire? You are braver than you are sensible." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She looks out over the blackened Steppes, and the ash does not settle on her.",
      lines = { { id = "h_default", text = "I am Elder Dawnstrider, and in life I walked every road a tauren could find, from the Barrens to the far mountains. The Lunar Festival honours me, and it seems my wandering did not stop when my heart did." } },
      again = { { id = "h_again", text = "Ask, {class}. A walker always has time to talk." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My people fought orcs here once, Elder.", next = "kin", when = { faction = "Alliance" } },
        { text = "What was the strangest road you walked?", next = "yroad" },
        { text = "Why see this place, of all places?", next = "ywhy" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I walked at dawn and slept at dusk, and I saw more of this world than most of my people ever will. I saw these Steppes green, before the Dark Iron fire burned them, and I grieve for them still." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "My wandering holds me, and those who remember my stories. Somewhere there is a young tauren who heard of me and decided to see the world; while that one walks, so do I." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Good. Respect for the old ones is a road too, and it leads somewhere warm.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "Make your own way, then, but walk it at dawn. That is the best advice an old wanderer has.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year under the full moon, when every people honours its elders. The living give us their respect, and we give them a little luck and the coin of our line." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is where the festival burns brightest, and every elder feels it calling. I will go, in time, but I wanted to see one more strange land first." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I thank you for coming all this way through the fire, and I give you the coin of my line. Walk well, and walk out of here soon." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then your grandfathers and mine stood on opposite sides of more than one war. Tonight there are only the honoured dead, and the living who remember them." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  
    yroad = {
      lines = {
        { id = "yelderd_yroad_d", text = "A road through the Searing Gorge, before it was searing, when the dwarves still mined it peacefully. I walked it with a dwarf trader who taught me a drinking song. I have forgotten the words, but I remember the tune." },
        { id = "yelderd_yroad_v0", when = { race = "Dwarf" }, text = "A road through the Searing Gorge, before it burned, with a dwarf trader of your people. He taught me a drinking song. Perhaps you know it. I remember only the tune." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhy = {
      lines = {
        { id = "yelderd_ywhy_d", text = "Because I saw it green, long ago, and I wanted to see what fire had made of it. It is terrible, child, but there is a strange beauty in it too. Some say a wanderer should only seek beautiful places. I seek true ones." },
      },
      choices = {
        { text = "Is there beauty in ruin?", next = "yruin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yruin = {
      lines = {
        { id = "yelderd_yruin_d", text = "The young shaman say no, that the land weeps and should not be gazed upon. The old walkers say every place deserves to be seen, even broken ones. What do you say?" },
      },
      choices = {
        { text = "Every place deserves to be seen and remembered.", next = "BACK", reply = "Then you are a walker at heart, child. I am glad to have met you.", fx = { align = { light = 1 } } },
        { text = "The young shaman are right. Let it weep alone.", next = "BACK", reply = "Perhaps. But a wound that no one sees is a wound that never heals.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    steppes = { { id = "yelderd_tp_steppes", text = "The Burning Steppes were green once, with rivers. I remember them, and I mourn them." } },
    wandering = { { id = "yelderd_tp_wandering", text = "A wanderer's heart is never satisfied, even in death. That is a gift, and a curse." } },

    _none = { { id = "tp_none", text = "I never walked that road, {class}. Perhaps you will." } },
  },
}
