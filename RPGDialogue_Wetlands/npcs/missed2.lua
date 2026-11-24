-- Menethil Harbor and the Wetlands roads, the folk a roster scan found missing (part 2): the Deepwater
-- Tavern's regulars, the Halloran children, the keep's hands, and the road east. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jesse Halloran: the tanner's son, who climbs the wind tower.
P:NPC {
  key = "wl_jesse_halloran", id = TODO_NPC("Jesse Halloran"), name = "Jesse Halloran", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "menethil" }, temper = { "bold", "cheerful" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Jesse Halloran is the tanner's boy, and he was looking up at the wind tower in a way his mother would not have liked. He plays hide and seek with his sister Regina, and he says he always wins.",
    third = "{name} met Jesse Halloran, the tanner's son, who climbs things in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Shh, I'm hiding! Well, I'm about to be hiding, so don't tell Regina which way I went." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! You didn't tell my mum about the tower, did you?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You look like you're good at hiding. I bet you could get to the very top of the tower and nobody would ever see you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Jesse, and my dad's the tanner, and I've got the best hiding spot in the whole harbor. It's up the wind tower, and Regina can't find me there because she's too scared to climb it." } },
      again = {
        { id = "h_again", text = "What else? She's nearly done counting!" },
        { id = "h_again2", text = "Ask me quick!" },
      },
      choices = {
        { text = "Doesn't your mother mind you climbing?", next = "mum" },
        { text = "Isn't it frightening up there?", next = "scared" },
        { text = "What will you be when you're grown?", next = "grown" },
        { text = "Good luck hiding, Jesse.", next = "END" },
      },
    },
    mum = {
      lines = { { id = "m_default", text = "She minds a lot, and she says it isn't safe, but she only knows when Regina tells on me. I told Regina she'd better not tattle, and she tattled anyway." } },
      choices = {
        { text = "Your mother might be right about the tower.", next = "right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    right = {
      lines = { { id = "r_default", text = "That's what grown-ups always say. I only slipped the one time, and I landed fine, and my knee stopped bleeding before supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scared = {
      lines = { { id = "s_default", text = "No! Well, a bit when the wind blows and the whole thing wobbles, but you can see the ships from up there, all the way out past the lighthouse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grown = {
      lines = { { id = "g_default2", text = "A sailor, up in the crow's nest, because that's the highest place there is. Dad wants me to be a tanner like him, but tanning smells awful and you never get to climb anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Jesse Halloran. My dad makes leather and my sister tells on me." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask my dad, he's over by the smelly barrels." } },
  },
}

-- Regina Halloran: the tanner's daughter, who tells on her brother.
P:NPC {
  key = "wl_regina_halloran", id = TODO_NPC("Regina Halloran"), name = "Regina Halloran", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "menethil" }, temper = { "prim", "earnest" }, values = { "honest", "family" },
  notices = { "class" },
  impression = {
    first = "Regina Halloran is the tanner's daughter, and she was hunting for her brother Jesse with the grim patience of someone who knows exactly where he is. She believes firmly in rules, especially the ones Jesse breaks.",
    third = "{name} met Regina Halloran, the tanner's daughter in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Excuse me, have you seen my brother? He's supposed to be hiding, but he's not supposed to be hiding up high." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. He's gone up the tower again, I just know it." },
  },
  notice = {
    { id = "n_guard", cat = "class", when = { class = { "PALADIN", "WARRIOR" } },
      text = "You look like a guard. Could you tell Jesse the tower's against the rules? He doesn't listen to me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Regina Halloran, and I'm playing hide and seek with Jesse, except he cheats. Mum said not to climb the wind tower any more, and he climbs it every single time." } },
      again = {
        { id = "h_again", text = "Yes? I'm still looking for him." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Are you going to tell your mother?", next = "tell" },
        { text = "Why don't you climb up after him?", next = "climb" },
        { text = "Do you like living in the harbor?", next = "harbor" },
        { text = "I hope you find him, Regina.", next = "END" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I have to, because it's the truth and because he might fall. He calls it tattling, but it isn't tattling if it's dangerous, and Mum says so too." } },
      choices = {
        { text = "He won't thank you for it.", next = "thank" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thank = {
      lines = { { id = "th_default", text = "He never does. But he fell off it once and went all quiet and white, and I didn't like that at all, so I'd rather he was cross with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    climb = {
      lines = { { id = "c_default", text = "Because it's not allowed, and because it wobbles. I'm not scared, I'm just sensible, and that's a different thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    harbor = {
      lines = { { id = "ha_default", text = "I like the ships, and I like Gimlok from the shop even though he's very small and smells of crabs. I don't like the tannery smell, but Dad says it's the smell of supper being paid for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Regina. My dad is James Halloran the tanner, and my mum is Andrea." } },
    _none = { { id = "tp_none", text = "I don't know. You should ask a grown-up, that's what I'd do." } },
  },
}

-- Thomas Booker: a labourer about Menethil Keep.
P:NPC {
  key = "wl_thomas_booker", id = TODO_NPC("Thomas Booker"), name = "Thomas Booker", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "menethil" }, temper = { "cheerful", "cheeky" }, values = { "hardworking" },
  notices = { "class", "race" },
  impression = {
    first = "Thomas Booker hauls and digs and carries for Menethil Keep, and he does it with a grin and a running commentary. He has a friendly feud going with the dwarf Tarrel Rockweaver that seems to involve a good deal of thrown dirt.",
    third = "{name} met Thomas Booker, a labourer at Menethil Keep.",
  },
  greetings = {
    { id = "g_default", text = "Morning! Mind where you step, because I've only just shovelled that and I'd hate to do it twice." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come to lend a hand, or only to watch a man work?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You're not a friend of Tarrel Rockweaver's, are you? Only if you are, I never threw anything, and it was an accident." },
    { id = "n_strong", cat = "class", when = { class = "WARRIOR" },
      text = "Now there's a pair of shoulders! You could carry a crate under each arm, and I've got the crates if you're bored." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Thomas Booker, and I'm the fellow who does the lifting around here. If it's heavy and it needs to be somewhere else, the keep sends for me, and then complains about how long it took." } },
      again = {
        { id = "h_again", text = "What else? I can talk and shovel." },
        { id = "h_again2", text = "Go on, I'm due a rest anyway." },
      },
      choices = {
        { text = "What keeps you so busy?", next = "busy" },
        { text = "What's this about Tarrel Rockweaver?", next = "tarrel" },
        { text = "You seem cheerful for a man with a shovel.", next = "cheer" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    busy = {
      lines = { { id = "b_default", text = "Everything in this town sinks, that's what. The ground's half water, so the road wants filling, the wall wants shoring and the ditch wants digging out again, and by the time I've done all three the first one's gone soft." } },
      choices = {
        { text = "Sounds like work that never ends.", next = "ends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ends = {
      lines = { { id = "e_default", text = "It doesn't, and that's why I'll never be out of a job. Murphy West in the cellar thinks he's the clever one for staying dry, but nobody ever paid a man extra for sitting on a barrel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tarrel = {
      lines = { { id = "t_default", text = "He told me I dig like a human, and he meant it as an insult. So now and then a bit of dirt goes his way off the end of my shovel, and he pretends not to notice, and we both enjoy ourselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "Why wouldn't I be? I've steady pay, a dry bed at the Deepwater, and a wall between me and the orcs that I helped shore up myself. Plenty in the north can't say as much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a labourer for the keep. I dig, I haul, and I get blamed when it rains." } },
    _none = { { id = "tp_none", text = "No idea, friend. I only know what's at the end of a shovel." } },
  },
}

-- Mountaineer Thar: guards the tunnel road at Dun Algaz, between the Wetlands and Loch Modan.
P:NPC {
  key = "wl_mountaineer_thar", id = TODO_NPC("Mountaineer Thar"), name = "Mountaineer Thar", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "wetlands" }, temper = { "brisk", "watchful" }, values = { "dutiful" },
  notices = { "race", "soldier" },
  impression = {
    first = "Mountaineer Thar stands guard where the Dun Algaz road climbs out of the Wetlands toward Loch Modan. He looks every traveller over once, quickly, and then goes back to watching the hills.",
    third = "{name} met Mountaineer Thar, who guards the road at Dun Algaz.",
  },
  greetings = {
    { id = "g_default", text = "Hold a moment, {class}. Right, ye'll do, so go on through an' keep tae the road." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The pass is open, so dinnae dawdle in it." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Well met, {g:brother|sister}. If ye're bound for Thelsamar, tell them the pass still holds." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "HUNTER" } },
      text = "Ye look handy in a fight. There are orcs in these tunnels who could use the lesson, if ye've time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mountaineer Thar, o' the Ironforge guard. This pass is the only road between the Wetlands an' Loch Modan, an' I'm here tae see it stays a dwarven road." } },
      again = {
        { id = "h_again", text = "Aye? Be quick, I'm on watch." },
        { id = "h_again2", text = "What else, then?" },
      },
      choices = {
        { text = "What threatens the pass?", next = "threat" },
        { text = "What's the road like on the other side?", next = "loch" },
        { text = "And down into the Wetlands?", next = "wet" },
        { text = "Keep your watch, mountaineer.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "t_default", text = "Dragonmaw orcs, in the side tunnels an' on the slopes above. They've a camp in the hills an' they'd love tae cut Menethil off from Ironforge, so we hold the towers an' shoot whatever shows its head.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "Can you hold it?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "We've held it this long, an' we'll hold it longer. A dwarf wi' a rifle an' a wall tae lean on is worth five orcs in the open, an' I've the wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    loch = {
      lines = { { id = "l_default", text = "Up through the tunnels an' out above the loch, then down tae Thelsamar, where there's a bed an' a proper mug. It's a long climb, but it's dry, which is more than I can say for where ye're standin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wet = {
      lines = { { id = "w_default", text = "Bog an' reeds all the way tae the sea. Stay on the road till ye reach Menethil, for the raptors hunt in the long grass an' they're quicker than they look." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a mountaineer of Ironforge, posted tae the Dun Algaz pass." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs in the hills an' the tunnels. Keep tae the road an' ye'll likely nae meet them." } },
    _none = { { id = "tp_none", text = "Nae my post, nae my business. Ask in Menethil or Thelsamar." } },
  },
}

-- Roggo Harlbarrow: rifleman with Longbraid's company outside Dun Modr.
P:NPC {
  key = "wl_roggo_harlbarrow", id = TODO_NPC("Roggo Harlbarrow"), name = "Roggo Harlbarrow", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "thandol_span" }, temper = { "grim", "fierce" }, values = { "loyal", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "Roggo Harlbarrow is a rifleman with Longbraid's company outside Dun Modr, and he is still angry that he could not get word to Ironforge when the Dark Irons took the Thandol Span. He cleans his rifle as if the next shot were owed to somebody.",
    third = "{name} met Roggo Harlbarrow, a rifleman of Longbraid's company at Dun Modr.",
  },
  greetings = {
    { id = "g_default", text = "Keep yer head down, {class}. The Dark Irons hold the town ahead, an' they've sharp eyes on that wall." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathin', I see. That's better than many who've walked up this road." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Spark of Freedom") }, text = "Is that fire spirit loose yet? I'll rest easier when the Dark Irons have one less slave tae burn us with." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A {g:kinsman|kinswoman} from the mountain! Then ye'll feel it as I do, seein' Dark Iron filth sittin' in a dwarven town." },
    { id = "n_shaman", cat = "class", when = { class = { "MAGE", "SHAMAN" } },
      text = "Ye've a way wi' the elements, have ye? Then ye'll like what the Dark Irons do tae fire spirits even less than I do." },
  },
  start = "hello",
  nodes = {
    gt_rifle = {
      lines = { { id = "gt_rifle_l", text = "A Bronzebeard long-barrel, an' she's older than some o' the lads I served wi'. Keep yer powder dry in this swamp, hunter, for damp powder's killed more dwarves than any Dark Iron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_kin = {
      lines = { { id = "gt_kin_l", text = "Aye, a good many, an' I carved their names on a stone below the Span when the Dark Irons werenae lookin'. When ye're back in Ironforge, raise a mug for them, for I cannae go home yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Roggo Harlbarrow, rifleman. I was on the Span when the Dark Irons came, an' I tried tae get word tae our forces an' couldnae, an' good dwarves died waitin' for help that never knew tae come." },
        { id = "h_done", when = { questDone = TODO_QUEST("Spark of Freedom") }, text = "Ye set that fire spirit loose, an' I saw the glow of it from here. The Dark Irons will feel the lack of it, an' I thank ye for that." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Keep yer voice low." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "What happened at the Thandol Span?", next = "span" },
        { text = "Why couldn't you send word?", next = "word" },
        { text = "What are the Dark Irons doing in Dun Modr?", next = "darkiron" },
        { text = "You speak of a fire spirit.", next = "spirit" },
        { text = "I'm a hunter too. What rifle do you carry?", next = "gt_rifle", when = { class = "HUNTER" } },
        { text = "Did any of my kin from the mountain fall here?", next = "gt_kin", when = { race = "Dwarf" } },
        { text = "Shoot straight, Roggo.", next = "END" },
      },
    },
    span = {
      lines = { { id = "s_default", text = "They hit us from below an' behind, wi' powder charges laid under the bridge an' sappers on the stone. We were set tae watch the road, an' nobody was watchin' the cliffs.", fx = { learn = { "thandol_span", "dark_iron" } } } },
      choices = {
        { text = "And the company fell back here?", next = "fellback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fellback = {
      lines = { { id = "f_default", text = "What was left of it, aye. Longbraid pulled us south tae Dun Modr an' then out of Dun Modr, an' now we sit in the reeds lookin' at our own walls wi' the enemy's fires behind them." } },
      choices = {
        { text = "How does Longbraid bear it?", next = "longbraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longbraid = {
      lines = { { id = "lb_default", text = "They call him the Grim, an' he's earned it. He's nae smiled since the Span, but he's kept us fed an' fightin', an' I'd follow him back through that gate tomorrow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    word = {
      lines = { { id = "w_default", text = "The road north was cut the moment the bridge was mined, an' the road south is three days o' bog wi' orcs in it. By the time a runner could have reached Ironforge, there was naught left tae save but ourselves." } },
      choices = {
        { text = "That isn't your fault.", next = "BACK", reply = "So Rhag tells me, an' Longbraid too. I'll believe it the day we take the town back.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "d_default", text = "Diggin' in, an' makin' ready tae finish the Span for good. They're sorcerers as much as soldiers, the Dark Irons, an' they drag fire up out o' the deep places an' chain it tae their will.", fx = { learn = { "dark_iron" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spirit = {
      lines = {
        { id = "sp_default", text = "They've a fire elemental bound in the town, a captive, an' they mean tae turn it on us or on the bridge. I'd sooner see the thing free an' gone than leave it in their hands, for a slave that burns is still a slave." },
        { id = "sp_done", when = { questDone = TODO_QUEST("Spark of Freedom") }, text = "It went off across the marsh like a fallin' star, an' good riddance tae its chains. I never thought I'd cheer for a ball o' fire." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a rifleman of Ironforge, wi' Longbraid's company. We lost the Span, an' we mean tae have it back." } },
    thandol_span = { { id = "tp_ts", text = "The great bridge north o' here. The Dark Irons mined it, an' my friends were on it." } },
    dark_iron = { { id = "tp_di", text = "Traitors tae every other dwarf since the War o' the Three Hammers. They hold Dun Modr now." } },
    _none = { { id = "tp_none", text = "I dinnae ken, {class}. Ask Longbraid, if he'll talk." } },
  },
}

-- Terl Arakor: stands by his wagon on the road through Sundown Marsh.
P:NPC {
  key = "wl_terl_arakor", id = TODO_NPC("Terl Arakor"), name = "Terl Arakor", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "wetlands" }, temper = { "excitable", "possessive" }, values = { "curious", "self" },
  notices = { "class", "race" },
  impression = {
    first = "Terl Arakor stands beside a wagon on the road through Sundown Marsh and is very clear that it is his wagon. He has been all over the Wetlands and has a rumour about every dangerous beast in it.",
    third = "{name} met Terl Arakor, who guards his wagon on the Sundown Marsh road and trades in rumours.",
  },
  greetings = {
    { id = "g_default", text = "That's close enough, friend! This is my wagon, and I'm only saying so because people keep looking at it." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. You can stand there, but the wagon is still mine." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you'll want to hear what I've seen out in the marsh, because some of it would look very fine on a wall." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You're not with the Explorers' League, are you? Because whatever they say, I never took anything from Whelgar's dig that wasn't already lying about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Terl Arakor. I travel the Wetlands with my wagon, picking up this and that, and I see a good deal more than the folk who stay behind Menethil's walls. If you want to know what's out there, I'm your man." } },
      again = {
        { id = "h_again", text = "What else do you want to hear about?" },
        { id = "h_again2", text = "Go on, but mind the wagon." },
      },
      choices = {
        { text = "What have you seen at Whelgar's Excavation?", next = "whelgar" },
        { text = "What are the orcs up to?", next = "orcs" },
        { text = "Any strange beasts in the marsh?", next = "beasts" },
        { text = "Nobody wants your wagon, Terl.", next = "wagon" },
        { text = "Safe travels.", next = "END" },
      },
    },
    whelgar = {
      lines = { { id = "w_default", text = "I was up there attempting to, well, rescue a few relics from among the raptor bones, purely for safekeeping. The raptors have overrun the whole dig, and there's a big clever one the dwarves call Sarltooth who seems to run the pack.", fx = { learn = { "explorers_league" } } } },
      choices = {
        { text = "Rescue relics, or steal them?", next = "steal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steal = {
      lines = { { id = "s_default", text = "That's a hard word for it! The dwarves ran off and left them, and a thing left lying in a swamp belongs to whoever is brave enough to pick it up, which so far has not been me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "The Dragonmaw are pushing out of the Angerfang Encampment in the east, and they've been raiding caravans on the road. I take the western track now, because my wagon would burn as well as anyone's.", fx = { learn = { "dragonmaw" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "b_default", text = "On my way down from Dun Algaz I watched a Mosshide gnoll wade into a lake after one of those great threshadons, with a spear. If you've never seen a dog try to fish for something ten times its size, friend, you have missed a treat." } },
      choices = {
        { text = "Who won?", next = "won" },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "wo_default", text = "The threshadon, by a wide margin, and it hardly seemed to notice it was in a fight. They also say a raptor matriarch nests deep in Raptor Ridge, but I've no plans to go and count her eggs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wagon = {
      lines = { { id = "wa_default", text = "That's exactly what someone who wanted it would say. It's mine, I paid for it, and everything I own in the world is under that canvas, so I'll thank you to admire it from there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a travelling man with a wagon. I pick things up, I hear things, and I keep moving." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs at Angerfang, east of here. They've been hitting the caravans." } },
    explorers_league = { { id = "tp_el", text = "The dwarves who dig things up. They left a lot behind at Whelgar's when the raptors came." } },
    _none = { { id = "tp_none", text = "I haven't heard a thing about that, and I hear most things. It's not about my wagon, is it?" } },
  },
}

-- Sylessa Duskwhisper (Forever, id 270844): a Kaldorei traveller on the Menethil docks, waiting on the
-- Auberdine boat and making what peace she can with a human harbor. Had no entry, so she was speaking
-- the human citizen pool (and its line about laughing at night elves).
P:NPC {
  key = "wl_sylessa_duskwhisper", id = 270844, name = "Sylessa Duskwhisper", gender = "female",
  race = "NightElf", role = "citizen", tier = "service",
  communities = { "menethil", "kaldorei" }, temper = { "reserved", "wry" }, values = { "patient", "curious" },
  notices = { "race" },
  impression = {
    first = "Sylessa Duskwhisper is a Kaldorei woman waiting on the Menethil docks for the Auberdine boat. She watches the humans the way a hunter watches a herd: with patience, and a little more fondness than she lets show.",
    third = "{name} met Sylessa Duskwhisper, a night elf waiting for the Auberdine boat in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You are not one of the sailors, so I will assume you have not come to tell me the boat is late again." },
    { id = "g_nelf", when = { race = "NightElf" }, priority = 5,
      text = "Ishnu-alah, sister. It is good to see a face that will still be young when this harbor's grandchildren are old. Are you bound for home, or away from it?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. The boat has still not come, so the tide and I are keeping each other company." },
  },
  notice = {
    { id = "n_rc_human", cat = "race", when = { race = "Human" },
      text = "Your people built all of this in a few lifetimes, and half of it is already sinking. I find that both admirable and a little sad." },
    { id = "n_rc_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and not complaining about the damp. You must be new to the Wetlands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I came east to see the human kingdoms with my own eyes, rather than trust the stories the Sentinels bring home. Now I am going back, and I find I have more questions than I left with." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "I came east to see the human kingdoms with my own eyes, sister. The sailors laugh at us behind their hands, but they laugh at the dwarves too, and at each other most of all." },
      },
      again = { { id = "h_again", text = "Ask, then. The tide will not turn any faster for my silence." } },
      choices = {
        { text = "What did you make of the human lands?", next = "humans" },
        { text = "How do the people here treat you?", next = "treat" },
        { text = "Why go home now?", next = "home" },
        { text = "Safe crossing, Sylessa.", next = "END" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "They are loud, they are quick, and they forget everything within a generation. Yet they stood against the Burning Legion at Hyjal beside us, and I have not forgotten that, even if they have." } },
      choices = {
        { text = "Our peoples should stand closer together.", next = "BACK",
          reply = "I would like that. Some of the elders would sooner see the boats burned, but the elders were wrong about the Highborne too, once.", fx = { align = { order = 1 } } },
        { text = "The Kaldorei owe them nothing. Let them sink.", next = "BACK",
          reply = "Harsh words, but you are not the first to say them on this dock. I hope you meet a human worth changing your mind for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    treat = {
      lines = { { id = "t_default", text = "Well enough. The innkeeper overcharges me, the children follow me to see if I glow in the dark, and the guards call me 'miss' as though I might break. It is not unkind, only very young." } },
      choices = {
        { text = "They should show you more respect.", next = "BACK",
          reply = "Respect is earned slowly, and humans have so little time to spend on it. I would rather have their curiosity than their fear.", fx = { align = { honor = 1 } } },
        { text = "Laugh along with them. It costs you nothing.", next = "BACK",
          reply = "Perhaps you are right. I let a little girl pull my ear yesterday, and her mother nearly fainted, and I confess I enjoyed it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Word reached me that the trees in Darkshore are sickening, and that something walks the shore at night that should not. I am no Sentinel, but I can carry water and keep watch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Sylessa of Darnassus. I have walked the human roads for a season, and now I am waiting for a boat like everyone else." } },
    auberdine = { { id = "tp_aub", text = "Auberdine is the nearest thing my people have to a harbor. It is quieter than this one, and the gulls are better mannered." } },
    _none = { { id = "tp_none", text = "I have not been here long enough to know that. Ask a sailor; they will tell you something, even if it is not true." } },
  },
}
