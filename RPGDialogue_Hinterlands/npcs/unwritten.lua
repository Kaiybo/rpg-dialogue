-- The Hinterlands: folk a roster scan found with no conversation yet: the Wildhammer sentries of Aerie Peak and
-- Oglethorpe Obnoticus's crashed robot chicken, OOX-09/HL. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Wildhammer Sentry: a guard on the approaches to Aerie Peak.
P:NPC {
  key = "hin_wildhammer_sentry", id = TODO_NPC("Wildhammer Sentry"), name = "Wildhammer Sentry",
  bible = "bibles/hinterlands.md", role = "guard", tier = "service",
  communities = { "aerie_peak" }, temper = { "hearty", "watchful" }, values = { "duty", "proud" },
  notices = { "race" },
  impression = {
    first = "A Wildhammer sentry with blue tattoos and a stormhammer at the belt, watching the trees for trolls and the sky for gryphons.",
    third = "{name} spoke with one of the Wildhammer sentries of Aerie Peak.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself! Pass, friend, an' welcome; ye've done right by the Peak, an' the watch knows it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watchin' ye, so keep yer hands where I can see them, sweet talk or no." },
    { id = "g_default", text = "Halt there, stranger, an' say who ye are. The Hinterlands are thick wi' trolls, an' they've learned tae talk sweet when it suits them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself again! Pass, then, an' mind the gryphon droppings." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, come up from under the mountain! Breathe deep, {g:lad|lass}, ye'll not have tasted air this clean in Ironforge." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, this close tae the Peak? Keep walkin', an' keep yer hands from yer weapons, or the gryphons will have ye for supper." },
  },
  start = "hello",
  nodes = {
    w2_horn = {
      lines = {
        { id = "w2_horn_l", text = "A wildkin's horn, taken in the hills west o' the Peak by my grandfather. He blew it at the Battle o' Grim Batol, or so he said, an' I've blown it at Witherbark scouts, which is a smaller sort o' glory." },
      },
      choices = {
        { text = "Did your grandfather fight at Grim Batol?", next = "w2_horn2" },
        { text = "Two of six is a fine count.", next = "BACK" },
      },
    },
    w2_horn2 = {
      lines = {
        { id = "w2_horn2_l", text = "Aye, against the Red Dragonflight an' the orcs that rode them. He came home wi' a burn down his arm an' a story he never told the same way twice. I believe the burn, an' I keep the horn." },
      },
      choices = {
        { text = "Two of six is a fine count.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I keep watch on the road tae Aerie Peak for Falstad an' the clan. The Witherbark an' Vilebranch trolls creep up through the forest, an' a good sentry spots them before they spot him." } },
      again = {
        { id = "h_again", text = "Aye, what else? Talk quick, the treeline's gone quiet, an' quiet means trolls." },
        { id = "xh_again2", text = "Still here? Then keep yer eyes on the treeline while we talk." },
      },
      choices = {
        { text = "Aerie Peak's rules keep the trolls out and the riders safe.", next = "BACK", reply = "Aye, they do, an' it's a rare stranger who says so tae a sentry's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "The Wildhammer never cared for rules, so why should I?", next = "BACK", reply = "We care for our own, stranger, an' if ye break one on my watch, ye'll learn how much.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "How often do the trolls attack?", next = "trolls" },
        { text = "Why do Wildhammer live up here?", next = "why" },
        { text = "Your tattoos are striking.", next = "tattoos" },
        { text = "Who is Falstad?", next = "xfalstad" },
        { text = "What's the worst troll tribe out here?", next = "xworst" },
        { text = "Have you ever ridden a gryphon into battle?", next = "xgryphon" },
        { text = "I'm a hunter. Gryphons must be fine beasts.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What do you do when you spot trolls?", next = "ws_spot" },
        { text = "What's life like at Aerie Peak?", next = "ws_life" },
        { text = "What's that horn at your belt carved from?", next = "w2_horn" },
        { text = "I'll pass on.", next = "END" },
      },
    },
    ws_spot = {
      lines = {
        { id = "ws_spot_1", text = "Blow the horn, an' the gryphon riders come down like thunder. If they're too slow, I hold the road wi' my stormhammer till they arrive, an' I've done that more times than I care tae count." },
      },
      choices = {
        { text = "Have you ever held the road alone?", next = "ws_alone" },
        { text = "I'd stand with you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ws_alone = {
      lines = {
        { id = "ws_alone_1", text = "Once, against six Witherbark, for the horn was frozen an' the riders couldnae hear me. I took two o' them before Gryphon Master Talonaxe came down out o' the clouds, an' he's never let me forget that I was outnumbered." },
      },
      choices = {
        { text = "Two of six is a fine count.", next = "BACK" },
        { text = "Talonaxe sounds like a good friend.", next = "BACK" },
      },
    },
    ws_life = {
      lines = {
        { id = "ws_life_1", text = "Loud, an' windy, an' full o' ale. Innkeeper Thulfram keeps the hearth, Fraggar Thundermantle keeps the trolls in check, an' Falstad keeps everyone else in line, which is the hardest job o' the lot." },
      },
      choices = {
        { text = "Who's Fraggar Thundermantle?", next = "ws_fraggar" },
        { text = "I'm a dwarf. I'd like to see the Peak.", next = "ws_fraggar", when = { race = "Dwarf" } },
      },
    },
    ws_fraggar = {
      lines = {
        { id = "ws_fraggar_1", text = "A warrior o' the clan, an' the one who sends folk tae thin the trolls. He'll pay ye in coin or in respect, an' a Wildhammer's respect is worth more than a bag o' gold." },
      },
      choices = {
        { text = "Then I'll find Fraggar.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "Every week a scout or a woodcutter goes missin', an' every month there's a raid on the outer camps. Since the Revantusk set up on the coast, we've got Horde trolls an' wild trolls both, an' I cannae always tell which is which." } },
      choices = {
        { text = "A troll is a troll. Treat them all as enemies.", next = "BACK", reply = "That's how my grandfather saw it, an' it kept him alive. Mostly.", fx = { align = { order = 1 } } },
        { text = "The Revantusk fight the same trolls you do.", next = "BACK", reply = "Aye, I've heard it said, an' maybe it's true. I'll believe it when one o' them saves my hide.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the sky's up here, {g:lad|lass}, an' the gryphons, an' none o' the Bronzebeards' rules. Our clan left Ironforge after the War o' the Three Hammers, an' we never looked back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tattoos = {
      lines = { { id = "ta_default", text = "Every Wildhammer wears them, an' every mark means somethin', a battle, a hunt, a gryphon bonded. My grandson will have more than me, if he lives long enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfalstad = {
      lines = { { id = "xfa_default", text = "Falstad Wildhammer, our thane, an' the finest gryphon rider alive. He fought the Horde in the Second War, an' he'd fight it again in a heartbeat if it came up here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xworst = {
      narr = "He spits into the bushes and glares at the treeline.",
      lines = { { id = "xwo_default", text = "The Vilebranch, by a long road, for they sacrifice their own tae the dark loa in Jintha'Alor. The Witherbark are savage, but at least they're honest about it." } },
      choices = {
        { text = "Then burn Jintha'Alor to the ground.", next = "BACK", reply = "Aye, an' I'll bring the torch. Falstad might even let me.", fx = { align = { light = -1 } } },
        { text = "Free their prisoners first. Then fight.", next = "BACK", reply = "A good heart ye've got. Keep it, for the trolls don't have one.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgryphon = {
      lines = { { id = "xgr_default", text = "Many times, an' there's nothin' like it. Ye dive out o' the clouds wi' a stormhammer in yer fist, an' the trolls look up just in time tae regret it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "The finest, an' they'll not be tamed by any but a Wildhammer. Ye can admire them from a distance, though, an' that's a kindness to yer fingers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    falstad = { { id = "xtp_fal", text = "Our thane, the loudest, bravest dwarf in the Hinterlands. Ye'll hear him before ye see him." } },
    vilebranch = { { id = "xtp_vile", text = "The worst o' the troll tribes, an' they'll get what's coming tae them." } },
   
    background = { { id = "tp_bg", text = "I'm a Wildhammer o' Aerie Peak, an' I've guarded this road since I could hold a hammer." } },
    _none = { { id = "tp_none", text = "Cannae help ye there. Ask in the keep." } },
  },
}

-- Homing Robot OOX-09/HL: Oglethorpe Obnoticus's robot chicken, crashed in the Hinterlands.
P:NPC {
  key = "hin_oox09hl", id = TODO_NPC("Homing Robot OOX-09/HL"), name = "Homing Robot OOX-09/HL",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "service",
  communities = {}, temper = { "mechanical", "anxious" }, values = { "duty" },
  notices = {},
  impression = {
    first = "OOX-09/HL is a battered robot chicken, one of Oglethorpe Obnoticus's homing robots, sitting in the grass of the Hinterlands and beeping at anything that comes near.",
    third = "{name} found Homing Robot OOX-09/HL, a crashed robot chicken in the Hinterlands.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Bzzt! Friendly biological entity confirmed. Hope levels rising to their highest recorded value." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Beep. Unfriendly biological entity detected. Please state your business quickly, and please do not step on me." },
    { id = "g_default", text = "Beep! Unknown biological entity detected. Please identify yourself, or at minimum, please do not step on me." },
    { id = "g_back", when = { metBefore = true }, text = "Bzzt! Biological entity recognized. Hope levels rising by twelve percent." },
  },
  start = "hello",
  nodes = {
    w2_wait = {
      lines = {
        { id = "w2_wait_l", text = "Internal chronometer reports eleven days, four hours and some minutes. Bzzt. During this period I have catalogued forty-one beetles, two passing gryphons and one troll who attempted to eat me." },
      },
      choices = {
        { text = "A troll tried to eat you?", next = "w2_wait2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_wait2 = {
      lines = {
        { id = "w2_wait2_l", text = "Affirmative. The troll obtained a mouthful of copper plating and departed at speed, making sounds my databanks classify as regret. Note: my chicken form is a defensive feature. Oglethorpe is very clever." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_home = {
      lines = {
        { id = "w2_home_l", text = "Upload flight data to Oglethorpe, receive maintenance, and be placed on the workbench beside OOX-17/TN and OOX-22/FE. Bzzt. Morale circuits indicate a desire to be reunited with my siblings." },
      },
      choices = {
        { text = "Robots have siblings?", next = "w2_home2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_home2 = {
      lines = {
        { id = "w2_home2_l", text = "All homing robots were assembled on the same bench, by the same gnome, from the same crate of copper. Logically, we are siblings. Emotionally, I am told I am the favourite, though Oglethorpe says that to all of us." },
        { id = "w2_home2_l1", when = { race = "Gnome" }, text = "All homing robots were assembled on the same bench from the same crate of copper. Logically we are siblings. A gnome will appreciate this reasoning. Oglethorpe says I am his favourite, though he says it to all of us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "This is Homing Robot OOX-09, Hinterlands model, property of Oglethorpe Obnoticus of Booty Bay. My flight systems have failed, my homing beacon is compromised, and local troll activity is very, very high." } },
      again = {
        { id = "h_again", text = "Bzzt. Additional query accepted. Please speak slowly; my audio receptor contains a beetle." },
        { id = "xh_again2", text = "Beep. Proximity of friendly entity is improving morale circuits." },
      },
      choices = {
        { text = "What happened to you?", next = "crash" },
        { text = "Who is Oglethorpe Obnoticus?", next = "ogle" },
        { text = "You're a chicken. A robot chicken.", next = "chicken" },
        { text = "What happened to the other robots?", next = "xothers" },
        { text = "What do you know about the trolls here?", next = "xtrolls" },
        { text = "Why does Oglethorpe build homing robots?", next = "xwhy" },
        { text = "I'm a gnome. Let me check your wiring.", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'm an engineer. Your gyros look loose.", next = "xeng", when = { profession = "Engineering" } },
        { text = "How long have you been sitting here?", next = "w2_wait" },
        { text = "What will you do once you get home?", next = "w2_home" },
        { text = "Hang on, little robot.", next = "END" },
      },
    },
    crash = {
      lines = { { id = "c_default", text = "Flight log indicates a catastrophic encounter with a tree, followed by a second catastrophic encounter with the ground. My locomotion still functions, but walking to Booty Bay without an escort has a projected survival rate of zero point zero percent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ogle = {
      lines = { { id = "o_default", text = "My creator, a gnome of great intellect and very small stature, who builds homing robots and sends them to the far corners of the world. He has done this nine times, and I am statistically one of the luckier ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chicken = {
      lines = { { id = "ch_default", text = "Affirmative, I have the form of a chicken, which Oglethorpe says is the most aerodynamically humble shape in nature. My dignity module was not included in the design." } },
      choices = {
        { text = "Leave it. A machine is just scrap.", next = "BACK", reply = "Bzzt. Feelings module reports distress. Please reconsider.", fx = { align = { light = -1 } } },
        { text = "You deserve a safe trip home, chicken or not.", next = "BACK", reply = "Beep beep! Gratitude subroutine engaged.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xothers = {
      narr = "The robot's head swivels left and right, then droops slightly.",
      lines = { { id = "xot_default", text = "OOX-17/TN crashed in Tanaris, and OOX-22/FE in Feralas. Their status is unknown, and my projections are not cheerful, though I am not programmed for cheer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtrolls = {
      lines = { { id = "xtr_default", text = "The Vilebranch, Witherbark and Revantusk all inhabit the Hinterlands. Two out of three are hostile, and my threat assessment cannot tell them apart from a distance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhy = {
      lines = { { id = "xwh_default", text = "Oglethorpe says it is to prove the homing principle, and to survey uncharted lands. I believe it is also because he enjoys building chickens." } },
      choices = {
        { text = "Science is worth a few crashed chickens.", next = "BACK", reply = "Bzzt. Logic accepted, though this chicken does not agree.", fx = { align = { light = -1 } } },
        { text = "He shouldn't send you out to crash.", next = "BACK", reply = "Beep! Affirmative. Please tell Oglethorpe this, emphatically.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Gnomish technician detected! Diagnostic access granted. Please avoid the red wire, the blue wire and the slightly purple wire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xeng = {
      lines = { { id = "xen_default", text = "Bzzt. Gyroscopic stabilizer loose by four point two degrees. Thank you, engineer, your expertise is noted in my databanks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    booty_bay = { { id = "xtp_bb", text = "Destination: Booty Bay, Stranglethorn Vale. Oglethorpe's workshop is there, along with my recharging station." } },
    oglethorpe = { { id = "xtp_ogle", text = "My creator. Small, clever and fond of chickens. Very fond of chickens." } },
   
    background = { { id = "tp_bg", text = "I am Homing Robot OOX-09/HL, built by Oglethorpe Obnoticus, currently grounded." } },
    _none = { { id = "tp_none", text = "Bzzt. Query not found in databanks." } },
  },
}

-- Revantusk Drummer: forest troll drummers who keep the rhythm of Revantusk Village.
P:NPC {
  key = "hin_revantusk_drummer", id = 14734, name = "Revantusk Drummer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "revantusk" }, temper = { "lively", "proud" }, values = { "tradition", "kin" },
  notices = { "faction" },
  impression = {
    first = "A forest troll beating a drum with a slow, steady rhythm that seems to follow the waves.",
    third = "{name} listened to a Revantusk drummer in the village by the sea.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ya come back, mon! Sit, sit, de drum been waitin' for you, an' so have I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it be you. De drum don't play for you today, so say what you need an' go." },
    { id = "g_default", text = "Ya hear dat? Da drum be talkin', mon. Sit and listen a while." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Da drum don't play for da Alliance. Move along." },
  },
  start = "hello",
  nodes = {
    w2_drum = {
      lines = {
        { id = "w2_drum_l", text = "Turtle shell from de shore below, mon, an' de skin of a wolf from de hills. My grandmother's drum be stone an' bone, from Jintha'Alor, but I leave it behind when we come to de sea." },
      },
      choices = {
        { text = "Why leave it behind?", next = "w2_drum2" },
        { text = "Ha. Something else.", next = "BACK" },
      },
    },
    w2_drum2 = {
      lines = {
        { id = "w2_drum2_l", text = "'Cause it beat for de Vilebranch too long, an' it learn their rhythm. A drum remember what it play, mon. Dis one only know de sea an' de Revantusk, an' dat be how I want it." },
      },
      choices = {
        { text = "Ha. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I be a drummer of da Revantusk. Da drum keep da village's heart beatin', and it remind da Vilebranch we still be here." } },
      again = {
        { id = "h_again", text = "Still here, mon. Da drum keep goin' an' so do I, so talk wit' da rhythm." },
        { id = "xh_again2", text = "Da drum don't stop, mon, but I can talk while it go." },
      },
      choices = {
        { text = "What does the drum say?", next = "say" },
        { text = "Why do the Vilebranch matter?", next = "vilebranch" },
        { text = "Who leads the Revantusk?", next = "xlead" },
        { text = "Why did the Revantusk join the Horde?", next = "xhorde" },
        { text = "What do you think of the Wildhammer?", next = "xwild" },
        { text = "I'm a troll too. Teach me the rhythm.", next = "xtroll", when = { race = "Troll" } },
        { text = "I'm a shaman. The drum calls the spirits.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Who taught you to drum?", next = "y_taught" },
        { text = "Does the drum ever go silent?", next = "y_silent" },
        { text = "What is your drum made from?", next = "w2_drum" },
        { text = "Keep drumming.", next = "END" },
      },
    },
    say = {
      lines = { { id = "s_default", text = "Dat da loa be watchin', da sea be calm, and da Revantusk don't forget nothin'. And sometimes it just say dinner be ready." } },
      choices = { { text = "Ha. Something else.", next = "BACK" } },
    },
    vilebranch = {
      lines = { { id = "v_default", text = "Dey be our cousins once, and now dey sacrifice to dark loa in Jintha'Alor. Da Revantusk left dem, and dey ain't forgiven us." } },
      choices = {
        { text = "They should be wiped out.", next = "BACK", reply = "Plenty here agree. Da drum be beatin' for war soon enough.", fx = { align = { light = -1 } } },
        { text = "Maybe some of them could still be saved.", next = "BACK", reply = "Maybe, mon. But I not be holdin' my breath.", fx = { align = { light = 1 } } },
      },
    },
    xlead = {
      lines = { { id = "xle_default", text = "Primal Torntusk, wise and fierce both. She brought us down to dis coast when we left da Vilebranch, and she keep us strong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhorde = {
      narr = "The drummer's hands slow, and the beat drops low and steady.",
      lines = { { id = "xho_default", text = "Because da Vilebranch went too far with da dark loa, and we needed friends to stand against dem. Da Horde help us, and we help da Horde, and dat be a fair trade, mon." } },
      choices = {
        { text = "The Horde is strong together. You chose well.", next = "BACK", reply = "Ya, mon, da drum agree with you.", fx = { align = { order = 1 } } },
        { text = "A tribe should stand on its own feet.", next = "BACK", reply = "Maybe, but standin' alone be a fast way to get eaten in dese hills.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwild = {
      lines = { { id = "xwi_default", text = "Dey fly dem big birds over our village and shout at us, but dey don't attack. Dey hate da Vilebranch more than dey hate us, and dat be enough for now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtroll = {
      lines = { { id = "xtr_default", text = "Ah, a cousin! Sit down, mon, and listen. One, two, and da third beat for da loa, dat be all you need to start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "Ya, it do, mon, and you can feel dem, can't you? Da earth and da sea, dey both like a good beat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_taught = {
      lines = {
        { id = "y_taught_d", text = "My grandmother, mon, in Jintha'Alor, before we left. She beat da drum for da Vilebranch priests, and she taught me every rhythm but one. Da last one, da sacrifice beat, she refused to teach me." },
        { id = "y_taught_tr", when = { race = "Troll" }, text = "My grandmother, cousin, in Jintha'Alor before da split. You know how da old ones teach. Every rhythm but da sacrifice beat, dat one she wouldn't give me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_silent = {
      lines = { { id = "y_silent_d", text = "Once, mon, when da Vilebranch raided and took two of our young ones up da hill. Torntusk stopped da drum for three days. Some say we should have gone up after dem, all of us, drums and spears." } },
      choices = {
        { text = "You should have gone after them.", next = "BACK", reply = "Ya, mon. Plenty here say so still.", fx = { align = { order = -1 } } },
        { text = "Torntusk was right to wait.", next = "BACK", reply = "Maybe. She lose two, but she don't lose da village.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    vilebranch = { { id = "xtp_vile", text = "Our old kin, now gone dark in Jintha'Alor. Da drum warn dem to stay away." } },
    revantusk = { { id = "xtp_rev", text = "My tribe, by da sea. We don't forget, and we don't forgive, but we do drum." } },
    jintha_alor = { { id = "y_tp_ja", text = "Jintha'Alor be da Vilebranch city on da hill. Da drum there beat for dark loa now." } },
    torntusk = { { id = "y_tp_tt", text = "Primal Torntusk lead us to da sea. Da drum beat for her first, always." } },
   
    _none = { { id = "tp_none", text = "Ask Primal Torntusk, mon. I just drum." } },
  },
}
