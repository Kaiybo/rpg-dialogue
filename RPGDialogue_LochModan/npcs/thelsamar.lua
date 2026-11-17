-- Thelsamar, the dig and the dam. Voice: bibles/thelsamar.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kadrell", id = TODO_NPC("Mountaineer Kadrell"), name = "Mountaineer Kadrell",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "hearty" }, values = { "dutiful", "friendly" },
  notices = { "kit", "race" },

  impression = {
    first = "Mountaineer Kadrell pointed me straight to the bounty poster by the League's door. He watches Thelsamar's road with a cheerful readiness for whatever crawls out of the hills next.",
    third = "{name} met Mountaineer Kadrell, who keeps watch over the road through Thelsamar for the King of Ironforge.",
  },

  greetings = {
    { id = "g_town", text = "Welcome tae Thelsamar, friend, an' make yerself comfortable! While ye're at it, have a look at that poster by the League's door." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the loch, an' good tae see ye! The tunnel rats have been askin' after ye, though no' fondly." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye lost an argument wi' a trogg, which happens tae the best of us. Go an' get mended." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, good! The troggs that came up under yer city are all over these hills too, so ye'll want a bit o' payback." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ha! No, the spy's a Dark Iron, an' ye're plainly no' one. But a stranger who calls things up out o' the dark is just the sort I'm paid tae keep an eye on, so ye'll forgive me if I do." } },
      choices = {
        { text = "Watch all you like. I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watching me is a waste of your time, Kadrell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "East toward the Valley o' Kings, where the troggs come up out o' the earth in the night, an' south by the Silver Stream where the kobolds dig. The bounty board's got a job for every one o' them, so ye'll never stand idle." } },
      choices = {
        { text = "I'll work through the bounty board, one job at a time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where the fighting's thickest and forget the board.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Ha! Aye, I suppose it does. He's a Dark Iron who keeps to the shadows round the dam an' the dig, so if ye know where a body hides in a town this size, ye'll find him faster than my lads in their clankin' mail." },
      },
      choices = {
        { text = "I'll find him and drag him to you in irons.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If he's spying, I'll quietly make him disappear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why would he want the dam?", next = "spy_dam" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Need? We've a dam, a dig an' a valley full o' troggs, an' not a single mage tae our name, so aye, ye're welcome. Just keep yer fire away from the Stoutlager's casks, for Hearthstove would never forgive ye." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Aye, an' a gnome mage is twice welcome, for ye'll know what crawled out from under yer city. There's troggs in every hill here, an' they burn just as well as the ones at home." },
      },
      choices = {
        { text = "I'll put my fire where you point it, Mountaineer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where I'm needed, not where I'm sent.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who needs a hand around here?", next = "jobs" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Aye, since the troggs came boilin' out o' the ground at Uldaman way. The beasts are pushed out o' their dens an' half o' them take it out on my patrols." } },
      choices = {
        { text = "Then drive the troggs back and the beasts will settle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Maybe the beasts are right to defend their land.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better than ye'd think, for a dwarf takes a threat as a reason tae drink an' sing louder. But there's widows in town from the trogg raids, quieter than they let on, an' I'd take it kindly if ye looked in on them." } },
      choices = {
        { text = "I'll look in on every one of them, Kadrell.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Widows have family for that. I've a road to clear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Ironforge'll want him alive, tae find out what he knows about the dam an' who sent him. The lads at the Stoutlager would want somethin' else, an' I'll no' say I blame them." } },
      choices = {
        { text = "Take him alive to Ironforge. Justice should be done properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the lads have him. He'd do worse to them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mountaineer Kadrell, an' I watch the road through Thelsamar for the King. There's troggs in the hills, a Dark Iron spy somewhere about an' kobolds in the foothills, so it's never dull." },
        { id = "h_stout", tags = { "news" }, when = { questActive = TODO_QUEST("Stout to Kadrell") },
          text = "Stout, from Ironforge! Ye've brought me a taste o' home, an' I'll no' forget it." },
        { id = "h_rats", when = { questActive = TODO_QUEST("Rat Catching") },
          text = "Tunnel rats, we call 'em: kobolds, west o' town along the hills, diggin' dens an' foulin' good land. Bring me their ears an' earn the bounty." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Mountaineer Stormpike's Task") },
          text = "Mountaineer Stormpike's got a job wants doin'. He's a good dwarf, grumpy but good." },
        { id = "h_stonegear", when = { questActive = TODO_QUEST("Stonegear's Search") },
          text = "Stonegear's on a search o' his own. Help him find what he's after, an' mind the hills while ye do." },
        { id = "h_rockgar", when = { questActive = TODO_QUEST("Report to Mountaineer Rockgar") },
          text = "Rockgar's at Dun Algaz, up the north road past the tower. Take dry socks, for the Wetlands will have the rest o' ye." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Well, look who it is! Thelsamar's favourite visitor, an' I'll hear no argument about it. Come here, come here!" },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Aye, I see ye. I'll be civil, because it's my post, but don't be expectin' the warm welcome." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid on my road! Good. The bears in these hills have been in a foul temper all season, an' I'd wager ye could tell me why." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my road! Grand, for the troggs are bold this season, an' I like a shield beside mine when they come." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Grand, for the lads at the bounty board come back wi' scrapes they'd never show the healer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my road! The Light an' a good hammer, there's no better pair for troggs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I watch the road for the King, an' I'll be watchin' you as well, nothin' personal." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The road's quiet, for now." },
        { id = "h_again2", text = "Ask away. I've a post tae watch an' all day tae watch it." },
      },
      choices = {
        { text = "Have the hills been changing lately?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's this about a spy?", next = "spy" },
        { text = "How's the loch?", next = "loch" },
        { text = "Who needs a hand around here?", next = "jobs" },
        { text = "So, how was that stout?", next = "stout", when = { questDone = TODO_QUEST("Stout to Kadrell") } },
        { text = "The troggs came up under my city first.", next = "gnome", when = { race = "Gnome" } },
        { text = "I track for a living, Mountaineer. Need eyes on the hills?", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Your loch is lovely, but where are the trees?", next = "k_elf", when = { race = "NightElf" } },
        { text = "A spy, Mountaineer? Takes one to catch one.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has Thelsamar much need of a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Where's the fighting worst along the road, Mountaineer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How are Thelsamar's folk holding up, Kadrell, with all this?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should be done with the Dark Iron spy once he's caught?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a warlock might be your Dark Iron spy, Kadrell?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thanks, Kadrell.", next = "END" },
      },
    },
    spy = {
      big = true,
      lines = {
        { id = "s_default", text = "A Dark Iron, poking about the town an' the dam. There's a poster out by the League, so if ye see a dwarf who looks a wee bit too sooty, give us a shout." },
      },
      choices = {
        { text = "Why would they want the dam?", next = "spy_dam" },
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 2, learn = { "dark_iron" } } },
      },
    },
    spy_dam = {
      lines = {
        { id = "sd_default", text = "If it went, the loch would go wi' it, west intae the Wetlands. Hinderweir's on the dam day an' night, so ask him, if ye've an hour an' strong nerves." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    loch = {
      lines = { { id = "l_default", text = "Beautiful, an' full o' trouble, like most things worth havin'. Ye should see it at dawn from the dam." } },
      choices = {
        { text = "What's in the loch?", next = "loch_what" },
        { text = "I'll go and see it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    loch_what = {
      lines = {
        { id = "lw_default", text = "Crocolisks an' threshers, an' the Second War, for there's broken catapults on the bottom if ye dive. The orcs held this valley once, though no' for long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jobs = {
      lines = {
        { id = "jb_default", text = "Mountaineer Stormpike in the north tower wants a runner, an' Pilot Stonegear at Steelgrill's Depot wants ore. Then there's Rockgar at Dun Algaz, who wants anyone daft enough tae go north." },
      },
      choices = {
        { text = "Tell me about Stormpike.", next = "jobs_stormpike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jobs_stormpike = {
      lines = {
        { id = "js_default", text = "He's a good dwarf, if a grumpy one, an' he'll tell ye about his exploits before ye've asked. Let him; they're mostly true." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stout = {
      lines = {
        { id = "st_default", text = "Shimmer Stout! Barleybrew's brother brews it, an' by Magni's beard, I felt like I could fly. I couldnae, mind; I checked." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Aye, an' now they come up under us, the same troggs or their cousins. Get yer payback here, an' Thelsamar'll thank ye fer it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { thelsamar = 1 } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Always, an' a hunter's eyes are better than a Mountaineer's, for we're taught tae watch roads an' ye're taught tae watch everythin' else. The bears in the north hills have gone mean this year, an' I'd like tae know why before one o' them comes through the inn door." },
        { id = "xhu_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A tracker out o' the high snows, by yer boots, an' that's the best news I've had all week. The bears up north have gone mean, an' ye'll read their sign better than any o' my lads." },
      },
      choices = {
        { text = "Something's driving them. I'll find out what.", next = "BACK", fx = { affinity = 2, standing = { thelsamar = 1 } } },
        { text = "A mean bear's a bear that needs putting down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave them to the hills, Kadrell. They were here first.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_elf = {
      lines = {
        { id = "xel_default", text = "Ha! Under the water, mostly, from before the dam. Ye're a long way from Darnassus, an' every night elf who comes through here asks me that, so I've started tellin' them the trees are shy." },
      },
      choices = {
        { text = "The land remembers its trees, I think.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Shy trees. I'll tell that one at home.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I stand on this road all day, an' every traveller tells me somethin' on their way past. Ask me about any o' this!" },
    },
    background = { { id = "tp_bg", text = "I'm a Mountaineer o' Ironforge, posted tae Thelsamar. It's the best post in Khaz Modan, an' I'll argue wi' anyone who says otherwise." } },
    advice = { { id = "tp_ad", text = "Read the poster, then read faces. A Dark Iron can wash his beard, but no' the soot under his nails.", next = "spy" } },
    dark_iron = { { id = "tp_dark_iron", text = "Sneakin' about where they've no business. I'd like tae know what they want wi' a dam." } },
    troggs = { { id = "tp_troggs", text = "Stonesplinter, out o' the hills. Captain Rugelfuss counts 'em down in the Valley o' Kings, an' he's run out o' fingers." } },
    stonewrought_dam = { { id = "tp_dam", text = "It's holdin', though Hinderweir would tell ye otherwise every mornin'.", next = "spy_dam" } },
    _none = { { id = "tp_none", text = "Couldnae say. Ask at the inn, for they hear everythin'." } },
  },
}

P:NPC {
  key = "ironband", id = TODO_NPC("Prospector Ironband"), name = "Prospector Ironband",
  bible = "bibles/thelsamar.md", role = "scholar", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "honest", "practical" },
  notices = { "craft" },

  impression = {
    first = "Prospector Ironband admits his dig is slow and insists it will pick up any day now. He has the stubborn patience of someone who has been saying that for a while.",
    third = "{name} visited Prospector Ironband's excavation in Loch Modan, where the Explorers' League dig goes slowly but steadily.",
  },

  greetings = {
    { id = "g_dig", text = "Watch the trench, an' the ropes, an' the lads, for they're workin', slowly but workin'." },
    { id = "g_back", when = { metBefore = true }, text = "Good, ye came back. We could always use another pair o' hands that know which end's the shovel." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye'll know good stone from bad, then. Most o' what we find here is bad, but the good bits are worth it." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Troggs, mostly, which come up out o' the ground like weeds an' bite like badgers. If ye find anythin' down there that whispers, though, ye'll bring it tae me an' no' keep it, for it belongs tae the League an' tae Ironforge." } },
      choices = {
        { text = "Anything I find goes to the League.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What I find in the dark, I keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They come up wherever we dig, as if the earth sends them tae spite us, an' my diggers are scholars, no' soldiers. A warrior standin' at the cut wi' a good shield would let us work a full day for once." } },
      choices = {
        { text = "I'll stand guard so the work can go on.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pay me in what you dig up, and I'll guard it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, for the troggs leave tracks in the spoil heaps, an' if I knew which tunnels they used I'd stop diggin' intae them by accident. The bears in the hills have sense enough tae stay away, which is more than I can say for the troggs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep yer {pet} away from the trenches, mind, for the last beast that came through dug faster than my whole crew an' twice as careless." },
      },
      choices = {
        { text = "I'll mark their tunnels and leave the fighting to others.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather hunt them in their tunnels than mark them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Can ye now? Then ye're ahead o' me, for I've been diggin' a month an' all I feel is my back. The League in Ironforge thinks there's old work buried under these hills, an' if ye can feel it, I'll want it written down for them." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Then ye've a better nose than mine, an' I'll trust a Gnomeregan mage over my own sore back. Whatever it is, the troggs want it too, an' that worries me more than the magic." },
      },
      choices = {
        { text = "Whatever it is, seal it and send it to Ironforge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's crack one open and see what it does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Did your digging wake the troggs?", next = "idols_wake" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Did ye now? Well, I'll no' pretend I'm surprised, for every dwarf here has his head in a hole all day. If ye're so good at walkin' in, walk intae the Stonesplinter camps an' see what they've carried off from us." },
      },
      choices = {
        { text = "I'll get your things back and ask nothing for it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get them, and maybe a few trinkets of my own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where is your powder going?", next = "powder" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That the earth remembers every wound, an' that I'd answer for mine. Well, the earth's had a fair few wounds from troggs before me, an' I'm only after what's honest ore." } },
      choices = {
        { text = "Honest work is no crime, Prospector.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The druid was right. Dig with more care.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Agmond, my best surveyor, caught alone in the hills by the troggs. We buried him by the dig, but no' properly, for there was no priest, an' it's sat on me ever since." } },
      choices = {
        { text = "Then I'll say the rites over him properly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's buried, Prospector. The dig is his memorial now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, for if we stop every time somethin' digs up beside us, we'll never find a thing. The League's no' an army, but we're no' cowards either, an' I'll no' be run off my own dig." } },
      choices = {
        { text = "Then I'll guard the dig while you work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pack up when it's dangerous. Courage is for soldiers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ironband.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darteus Ironband, Explorers' League, an' this is my dig. It's slow work, an' I'll no' pretend otherwise, but it'll pick up, an' when it does ye'll hear about it in Ironforge." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Excavation Progress Report") },
          text = "A report for the League. Tell 'em it's slow but steady, that we need more hands, an' that the troggs are a nuisance, though they'll know the last bit already." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Protecting the Shipment") },
          text = "There's a shipment comin' up the road, an' the hills are crawlin'. See it gets here in one piece, for I'm countin' on it." },
        { id = "h_stormpike", when = { heardLine = "stormpike_p.h_default" },
          text = "Ye've met Stormpike in the Hall? He's curt, an' he's always been curt, but he reads every word o' my reports." },
        { id = "h_powder_in", tags = { "news" }, when = { questRecent = { TODO_QUEST("Protecting the Shipment"), days = 5 } },
          text = "Powder, at last! We're on top o' somethin' grand here, I can feel it. As for Saean, well, that's a matter for another day." },
        { id = "h_agmond", when = { questDone = TODO_QUEST("Agmond's Fate") },
          text = "Agmond's urns sit wi' my idols now. If there's a link between these carvin's an' the troggs, I'll find it, for his sake." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, eh? I suppose ye'll be wantin' tae lecture me about my diggin' like the last one did. Well, go on, I've heard worse." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? The troggs keep diggin' up through my dig, an' I've more trowels than swords about the place." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll have a good eye, then, an' a good eye's worth more on a dig than ye'd think." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at my dig. Bless it if ye like, for we need the luck, an' poor Agmond needs the words more." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll see the troggs off my dig, I hope, for trowels make poor weapons." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at my dig! Mind ye don't summon anythin' in the trenches; it's crowded enough wi' troggs." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the ropes while ye ask." },
        { id = "h_again2", text = "Ask away; diggin's slow, but talkin's quick." },
      },
      choices = {
        { text = "What did the last druid say about your digging?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are you digging for?", next = "dig" },
        { text = "Why is the dig so slow?", next = "slow" },
        { text = "Where does your blastpowder go?", next = "powder" },
        { text = "Stormpike sent me. You need legwork?", next = "agmond", when = { questActive = TODO_QUEST("Ironband Wants You!") } },
        { text = "The stone at your dig is restless, Ironband.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Your dig could use a gnome's touch.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Those idols carry an enchantment. I can feel it from here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your camp's easy to walk into, Prospector. I walked in.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the troggs trouble the dig much, Prospector?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter's eye be useful on a dig?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone been lost on this dig, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the League keep digging while the troggs are so close?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has your dig found anything a warlock should worry about?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck with the dig.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "The past, our past: what the old dwarves left in these hills before Ironforge was a single hall. Every shard's a page o' a book nobody's read." },
      },
      choices = {
        { text = "Found anything yet?", next = "idols" },
        { text = "That's worth digging for.", next = "BACK", fx = { affinity = 2, learn = { "explorers_league" } } },
      },
    },
    idols = {
      big = true,
      lines = {
        { id = "id_default", text = "Carved idols, a whole cache of 'em. Right after we lifted 'em, the troggs came up through the floor, an' the idols send 'em berserk, so I cannae call that coincidence." },
      },
      choices = {
        { text = "Did your dig wake them?", next = "idols_wake" },
        { text = "I know stone. Let me look at the carving.", next = "BACK", when = { profession = "Mining" }, fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    idols_wake = {
      lines = {
        { id = "iw_default", text = "Maybe, an' an honest dwarf says maybe. If our diggin' woke 'em, it's ours tae put right, an' I'll no' leave this site till it is." },
      },
      choices = {
        { text = "Spoken like an honest dwarf.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Or leave them be and fill the hole.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    slow = {
      lines = {
        { id = "sl_default", text = "Troggs in the trench, an' my blastpowder goes missin' between Thelsamar an' here. Jern sends it an' I never see it, so somebody does." },
      },
      choices = {
        { text = "Who's Jern?", next = "slow_jern" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slow_jern = {
      lines = {
        { id = "sj_default", text = "Jern Hornhelm, our man in Thelsamar. He sends my reports up tae Ironforge an' my powder down tae me, an' only one o' those arrives." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    powder = {
      lines = {
        { id = "pw_default", text = "Ask the road. Every shipment gets lighter between town an' trench, an' I'm a digger, no' a guard." },
        { id = "pw_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "A porter called Saean. Near a year he hauled for us, an' all that time he was sellin' us tae the Dark Irons, an' I keep turnin' it over." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    agmond = {
      lines = {
        { id = "ag_default", text = "Good. Prospector Agmond runs our sites in the Badlands, an' I've no' heard from him in weeks, so find him an' bring me his report, or bring me the news." },
      },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Restless, is it? I've heard that word from the troggs' side o' things, in a manner o' speakin', for they've been crawlin' up out o' the cut like somethin's shakin' them loose. If the stone's tellin' ye anythin', I'd take a warnin' over a surprise." },
      },
      choices = {
        { text = "Dig slower. The stone doesn't like being rushed.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Dig on. Ironforge needs what's down there.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_gnome = {
      lines = {
        { id = "xgn_default", text = "It could use a gnome's blastpowder, if ye've any, for mine's always stuck somewhere between here an' Ironforge. I'll pass on the gnome's touch, though; the last one touched my pump an' it's been singin' ever since." },
      },
      choices = {
        { text = "Singing pumps are a feature, Ironband.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A digger hears a lot down a trench, an' most o' it's troggs, but no' all. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "Darteus Ironband, prospector. I value results, an' I've had few lately, so I'm valuin' them very hard." } },
    advice = { { id = "tp_ad", text = "When the ground goes quiet, listen harder, for that's when the troggs are diggin'." } },
    explorers_league = { { id = "tp_league", text = "The finest lot o' diggers, scholars an' madmen in the world. I'm in the middle category." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're diggin' too, down south in Uldaman. I'd dearly like tae know what they're after." } },
    troggs = { { id = "tp_troggs", text = "They're big an' mean, an' they go berserk near our idols. I'd like tae know why before they do.", next = "idols" } },
    uldaman = { { id = "tp_uldaman", text = "That's the big dig, down south. If my idols stir troggs, I shudder tae think what Uldaman stirs." } },
    _none = { { id = "tp_none", text = "That's no' my field. My field's six feet down." } },
  },
}

P:NPC {
  key = "hearthstove", id = TODO_NPC("Innkeeper Hearthstove"), name = "Innkeeper Hearthstove",
  bible = "bibles/thelsamar.md", role = "innkeeper", tier = "service",
  communities = { "thelsamar" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Hearthstove claims the Stoutlager pours the best ale between Ironforge and the Wetlands, and he'll fight anyone who disagrees once they've paid. I didn't disagree.",
    third = "{name} drank at the Stoutlager Inn in Thelsamar, where Innkeeper Hearthstove pours what he calls the best ale in Loch Modan.",
  },

  greetings = {
    { id = "g_inn", text = "The Stoutlager welcomes ye! Sit down, have a pint an' tell us a tale, in that order." },
    { id = "g_home", when = { homeInn = { "Thelsamar", "Stoutlager Inn" } }, text = "The Stoutlager missed ye! Yer bed's warm an' yer mug's clean, or clean enough, anyway." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Troggs, was it? Sit down, for Vidra's got sausages on, an' they'll mend what the troggs broke." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's the spirit, or several spirits, by the look o' ye! Sit down before the floor comes up tae meet ye." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mountaineers off the trogg line, mostly, an' they drink like they fight, all at once an' wi' a lot o' noise. I don't mind, for they pay, an' the ones who come back from the Valley o' Kings have earned every drop." } },
      choices = {
        { text = "One ale, then back to the line.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll drink the cellar dry, then go find a trogg.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Vidra does, an' she's particular about it, for she'll take fresh boar from the hills an' turn her nose up at anythin' that's been dead too long. Bring her good meat an' she'll speak kindly o' ye, which is rarer than ye'd think." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' keep yer {pet} out o' the kitchen, friend, for Vidra's chased off bigger beasts wi' a ladle." },
      },
      choices = {
        { text = "I'll bring her the freshest boar in the hills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring what's easiest and let her sort it out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Chill my ale? Ye'll do no such thing! Dwarven ale's drunk cellar-cool an' no colder, an' any mage who freezes a cask o' Thelsamar's best will be payin' for the barrel." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome offerin' tae chill my ale, an' I suppose ye drank it half-frozen down in Gnomeregan wi' all yer fancy coolers. Here it's cellar-cool or nothin', so keep yer frost for the troggs." },
      },
      choices = {
        { text = "Your inn, your rules, Hearthstove.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good ale is whatever the drinker says it is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who drinks here, usually?", next = "regulars" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Private, is it? I've had mountaineers, miners an' the League's diggers up those stairs, an' none o' them ever needed quiet. Keep whatever ye do behind a shut door an' out o' Vidra's kitchen, an' we'll get along." },
      },
      choices = {
        { text = "It's study, nothing more. No harm will come of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's best you don't ask what I'm summoning.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who's the cook, then?", next = "vidra_ref" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The loch at dawn, when the mist sits on it an' the fish rise. The dam keeps the water deep, though the old folk say the valley looked different before it was built." } },
      choices = {
        { text = "The dam was worth building. Look at the town.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dams change the land. I'd like to see it old.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Where else would they bring it? They sing about the dam an' the troggs an' the old days, an' when one o' their own doesnae come back, they sing his name an' I pour one for the empty stool." } },
      choices = {
        { text = "That's an honest kind of grieving. I'll sing with them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale doesn't heal grief, Hearthstove. It only hides it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once a week, regular as a mine bell, an' always over the same argument: whose clan dug the deepest. I let them go two rounds an' then I bring out the stool-leg, an' that's the end o' it." } },
      choices = {
        { text = "Two rounds is too many. Stop it before it starts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them settle it. A good brawl clears the air.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Hearthstove, an' I keep the Stoutlager. It's the best ale between Ironforge an' the Wetlands, an' I'll fight anyone who says otherwise, after they've paid." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two miners fought over the last stool last night an' broke it, so now neither of 'em has a stool. There's a lesson in that somewhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, an' the miners are singin' about the dam again. Every verse is the same verse, only louder." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at my inn! Loch Modan's a fair green place for dwarven country, an' I'd hope ye find a corner o' it that pleases ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want a strong ale an' a stronger stool, for the last warrior I served broke one o' each." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Vidra'll want a word wi' ye, for she's always short o' boar for her sausages." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'll pour ye somethin' gentle, an' if ye've a blessing for the cellar, I'll take that too." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at the Stoutlager! Ye'll no' be drinkin' much, I'd wager, but ye'll keep the peace better than my stool-leg." },
      },
      again = {
        { id = "h_again", text = "Another? Sit, sit, there's room." },
        { id = "h_again2", text = "What else? Tell me a tale an' I'll pour." },
      },
      choices = {
        { text = "What do you love most about Loch Modan?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "What do the miners sing about?", next = "song" },
        { text = "I used to run casks across the loch, quiet-like.", next = "k_smuggle", when = { class = "ROGUE" } },
        { text = "I could chill your ale for you, if you like.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll need a quiet room. Some of my work is private.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many warriors drink at the Stoutlager, Hearthstove?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does your kitchen buy what hunters bring in?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the mountaineers bring their grief here, Hearthstove?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do brawls break out at the Stoutlager often, Hearthstove?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Just a pint.", next = "END" },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Mountaineers off the road, diggers from Ironband's trench, an' gryphon riders waitin' on the weather. Vidra feeds 'em an' I keep 'em, for somebody has tae." },
      },
      choices = {
        { text = "Vidra?", next = "vidra_ref" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vidra_ref = {
      lines = {
        { id = "vr_default", text = "She runs the kitchen. Don't go in, an' don't ask what's in the sausage, but do eat it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    song = {
      lines = {
        { id = "so_default", text = "The dam, mostly, an' what'd happen if it broke, for they're a cheerful lot. Every verse ends wi' the loch in the Wetlands an' everybody swimmin'." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_smuggle = {
      lines = {
        { id = "xsm_default", text = "Did ye now? Then keep yer voice down, for half the casks in my cellar came across that loch the same way, an' the Mountaineers drink here too. I'll pour ye one, an' we'll speak o' the weather." },
        { id = "xsm_loch", when = { origin = "dwarf_loch_smuggler" },
          text = "I know yer face, though I'll swear I don't if anyone asks. Ye brought me six casks o' Wetlands rum one winter, an' Kadrell's never worked out where my rum comes from." },
      },
      choices = {
        { text = "Our secret, Hearthstove.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I've gone straight. You should too.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Thelsamar drinks at the Stoutlager, an' every one o' them talks after the second mug. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I keep the Stoutlager, an' before that I drank in it. It was a short step." } },
    advice = { { id = "tp_ad", text = "Sit wi' yer back tae the wall an' yer face tae the fire, an' ye'll see everyone an' stay warm besides." } },
    stonewrought_dam = { { id = "tp_dam", text = "Ask the miners, for they've a song about it. Just don't ask them tae sing it.", next = "song" } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Buy a round an' ask the whole inn; ye'll get six answers." } },
  },
}

P:NPC {
  key = "vidra", id = TODO_NPC("Vidra Hearthstove"), name = "Vidra Hearthstove",
  bible = "bibles/thelsamar.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "brisk" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Vidra Hearthstove ran me out of her kitchen unless I'd brought something to cook. Her blood sausages are famous, she says, at least in Thelsamar.",
    third = "{name} met Vidra Hearthstove, who cooks Thelsamar's famous blood sausages in the Stoutlager's kitchen.",
  },

  greetings = {
    { id = "g_kitchen", text = "Out o' my kitchen, unless ye've brought me somethin' tae cook." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then ye'll want my sausage recipe, an' ye can't have it, but ye'll want it all the same." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bear meat, boar guts, spider ichor an' a secret I'll no' tell even a warlock, though ye might be the only customer who'd no' be put off by the list. Bring me the makin's, an' the whole town eats well for a week." } },
      choices = {
        { text = "I'll fetch the makings for the town, Vidra.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep your sausages. I've lost my appetite.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vidra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bear meat, boar guts, a dash o' spider ichor an' a secret I'll take tae my grave. Ye needn't look so pale, for I waste no part o' any beast I'm given." } },
      choices = {
        { text = "Wasting nothing honors the beast. I respect that.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some creatures deserve better than a sausage, Vidra.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More, an' faster, an' they never say thank ye till the plate's clean. Still, a warrior who's been fightin' troggs all day deserves a proper meal, so sit down an' I'll see what's left in the pot." } },
      choices = {
        { text = "I'll say my thanks first and eat second.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll eat first. Thanks can wait for an empty plate.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Lift? It's no' stealin' if it's off a beast, love, it's huntin'. Bring me what I'm after from the hills, an' I'll no' ask where ye were standin' when ye got it." },
      },
      choices = {
        { text = "I'll bring it honestly, every bit of it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring it, and maybe a cask from the cellar too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the ichor for?", next = "what_ichor" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ye could, an' a gnome tried it once, an' the kitchen smelt o' burnt hair for a fortnight. Sausage wants a slow fire an' patience, an' no amount o' magic will hurry it." },
      },
      choices = {
        { text = "Then I'll leave the cooking to the cook.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hand me the pan. I'll get it right this time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who eats your sausages, then?", next = "who" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every week, an' they get the good sausages, no' the burnt ones, for grief's hungry work. I dinnae make a fuss of it, an' I'll thank ye no' tae either." } },
      choices = {
        { text = "I won't say a word. That's real goodness, Vidra.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity's well enough, but you can't feed everyone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vidra.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe as anywhere wi' troggs in the hills an' a spy in the bushes, which is tae say no' very. But I've a cleaver an' a temper, an' I'd like tae see a trogg get past either one." } },
      choices = {
        { text = "You'll not need either. I'll keep them from your door.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then you'll manage on your own, Vidra.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vidra.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Vidra, an' I cook for the Stoutlager: Thelsamar blood sausages, famous from here tae Ironforge. Well, famous in Thelsamar, anyway." },
        { id = "h_sausages", tags = { "news" }, when = { questActive = TODO_QUEST("Thelsamar Blood Sausages") },
          text = "Bring me what I asked for an' ye'll have the best sausages ye've ever eaten. Don't ask what's in 'em, for it's in the name." },
        { id = "h_secret", when = { metBefore = true }, text = "Folk keep askin' what's in the blood sausage, an' I tell them: blood, an' sausage, an' a secret. The secret's mostly more sausage." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll be hungry, then, for I've never met one who wasnae." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in my kitchen? Bless the pot if ye must, but dinnae stand where I'm choppin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be wantin' more than one sausage, by the size o' that armour." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my kitchen! Ye'll no' be wantin' blood sausage, I suppose, but ye can sit an' watch, so long as ye don't touch the pots." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Ye'll be wantin' a blood sausage, I expect, for everybody who looks as grim as ye do is only hungry." },
      },
      again = {
        { id = "h_again", text = "What is it now? I have a pot on the fire, so be quick." },
        { id = "h_again2", text = "Ask quick, for sausages burn." },
      },
      choices = {
        { text = "What goes in the sausages?", next = "what" },
        { text = "Who eats them all?", next = "who" },
        { text = "Can I help?", next = "help" },
        { text = "I cook too. Trade secrets?", next = "cook", when = { profession = "Cooking" } },
        { text = "I could hunt the boar for your sausages.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "I could lift a few ingredients from the hills for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could I warm the sausages for you? It'd save the coal.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors really eat as much as they say, Vidra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you feed the families who've lost their providers, Vidra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is Thelsamar safe enough for your kitchen, Vidra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What goes into a Thelsamar blood sausage, Vidra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What goes into a Thelsamar blood sausage, Vidra?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll pass on the details.", next = "END", fx = { affinity = 1 } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Bear meat, boar guts for the casings, an' a dash o' spider ichor for spice. Don't make that face; ye've eaten worse an' liked it less." },
      },
      choices = {
        { text = "Spider ichor?", next = "what_ichor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_ichor = {
      lines = {
        { id = "wi_default", text = "It gives it a bite, an' some days a real one. I strain it, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    who = {
      lines = {
        { id = "wo_default", text = "Kids runnin' in an' out, diggers off Ironband's site, an' Mountaineers off the road. Thelsamar never runs short o' empty bellies." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = {
        { id = "hp_default", text = "Nobody eats free in my kitchen, not even a {class} in shiny boots. Fetch me bear meat an' we'll talk." },
      },
      choices = {
        { text = "I'll fetch it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Shall I bless the pot, at least?", next = "bless", when = { class = "PRIEST" } },
      },
    },
    bless = {
      lines = {
        { id = "bl_default", text = "Bless the bears, if ye like, but do it before, mind, for after, they're my business." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cook = {
      lines = {
        { id = "ck_default", text = "Then ye'll know a good casing from a bad one, an' most don't. Ye still can't have the recipe." },
      },
      choices = { { text = "Worth a try.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Could ye? Ye'd be the first hunter in a month who didnae ask what's in them first. Mountain boar from the hills east o' the loch, an' bring the blood back fresh, for that's the whole o' the recipe an' I'll no' say more." },
        { id = "xhu_pet", when = { pet = { type = "Beast" } },
          text = "Could ye? An' yer beast's already sniffin' at my pantry, so I'll take that as a yes. Mountain boar from the hills east o' the loch, an' keep yer friend's nose out o' the bowl." },
      },
      choices = {
        { text = "Fresh it is.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Folk talk while they wait for their sausages, an' I've ears as well as a ladle. Ask me about any o' this, quick, before the pot burns." },
    },
    background = { { id = "tp_bg", text = "I cook, an' that's my story, an' it's got sausages in it." } },
    advice = { { id = "tp_ad", text = "Eat it fresh. That goes for everythin', but sausages most of all." } },
    _none = { { id = "tp_none", text = "I cook; ask someone who talks." } },
  },
}

P:NPC {
  key = "rugelfuss", id = TODO_NPC("Captain Rugelfuss"), name = "Captain Rugelfuss",
  bible = "bibles/thelsamar.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "formal" }, values = { "dutiful" },
  notices = { "soldier" },

  impression = {
    first = "Captain Rugelfuss told me ceremony could wait until the troggs did. He has the worn calm of an officer who's been fighting the same fight from the same hill for too long.",
    third = "{name} met Captain Rugelfuss, who holds the Valley of Kings against troggs rising from under the hills.",
  },

  greetings = {
    { id = "g_ease", text = "At ease. Ceremony can wait until the troggs do." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting sort, good. The King's lands need defenders more than they need visitors." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the Valley o' Kings, among the old statues, where the troggs come up out o' the ground in packs. Freeze a pack an' my mountaineers can do the rest, an' between us we might keep them off the road for a week." } },
      choices = {
        { text = "I'll go where you send me, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose my own ground, Captain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With a shield wall at the cave mouths and a great deal of stubbornness, for the troggs have no discipline but there's no end to them. Hold a line for me and you'll learn more about war here than in any yard in Ironforge." } },
      choices = {
        { text = "I'll take my place in the shield wall.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go into the caves and end them at the source.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Do that and I'll owe you a debt, for every new tunnel we find is one less surprise in the night. Watch the bears on the high ground as you go, mind, for they're hungrier than the troggs and twice as quick." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will smell them before you see them, which is more than my sentries manage." },
      },
      choices = {
        { text = "I'll scout and report back before I strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I find their hole, I'll clear it myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Behind them? There's no behind, for they come up out o' the ground wherever they please. But if ye can find the holes they're usin' near the statues an' stay alive doin' it, I'll take the report gladly." },
      },
      choices = {
        { text = "I'll find the holes and mark them for your men.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find them, and their leader won't see morning.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's this about the statues?", next = "statues" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Demons, in the Valley o' Kings, under the faces o' the old kings themselves? I'll take every blade I can get, but if one o' yer imps goes near those statues, I'll put an axe in it before I ask whose it is." },
      },
      choices = {
        { text = "Understood. I'll keep it leashed and away from the kings.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your statues are stone. The troggs are what matters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who leads the troggs?", next = "leader" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Tell 'em tae stay off the roads an' out o' the farmer's fields. If they'll do that, my mountaineers will gladly leave 'em be." } },
      choices = {
        { text = "That's fair. I'll keep the peace between you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The beasts were here first, Captain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Poorly, if you want the truth, though they'd never say so. They sleep in shifts beneath the statues, and some of them talk to the old kings at night, which I allow, because the kings don't answer back." } },
      choices = {
        { text = "Let me sit with them. Weary souls need tending too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers must be hard. Comfort only makes them soft.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They climb them, scratch at them and nest at their feet, and I don't think they know what they are. Ignorance is no excuse in my book, but I've stopped expecting troggs to read." } },
      choices = {
        { text = "Then I'll clear every trogg from the kings' feet.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Statues are only stone, Captain. Spend your soldiers elsewhere.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Captain Rugelfuss, holding the Valley of Kings for Ironforge. The troggs rise from under the hills faster than we can put them down." },
        { id = "h_trogg", tags = { "news" }, when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "The troggs have dug in close. Thin them out and bring me proof, for I want the King to read numbers, not complaints." },
        { id = "h_lands", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "These are the King's lands, and the King's statues watch over them. I'll not have troggs nesting at their feet." },
        { id = "h_count", when = { metBefore = true }, text = "We put down eleven troggs yesterday, and twelve more came up where they fell. I've stopped counting and started digging trenches." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "A Mountaineer of Dun Morogh, good. You'll know what a short-handed post looks like, and this is one." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, good, it's you. The regiment's glad of you on these hills, and the captain is too, though he'll only say so the once." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, is it? I've a district full o' bears, boars an' angry wolves, an' I'll take any help that can speak tae them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good; I've been holding this valley with tired soldiers, and a fresh arm is the best news I've had all week." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I could use one; the troggs come out of holes I didn't know were there, and somebody has to find them first." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I have soldiers who have fought the troggs too long, and it's not only their bodies that need mending." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The King's statues have seen your order before, and they'd be glad to see it again." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! The troggs come up from under the hills faster than we can put them down, an' I'd take a hundred o' yer kind if Ironforge would send them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Stonesplinter", min = 40 } }, text = "My mountaineers say the Stonesplinter packs in the valley are thinner than they've been all year, an' they say yer name when they say it. Ironforge should hear o' that, an' I'll see it does." },
      },
      again = {
        { id = "h_again", text = "Is there anything further?" },
        { id = "h_again2", text = "Speak plainly, if you would; I prefer it." },
      },
      choices = {
        { text = "What would you have me tell the beasts?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where are your soldiers?", next = "reserve" },
        { text = "Who leads the troggs?", next = "leader" },
        { text = "Tell me about the statues.", next = "statues" },
        { text = "Why trogg teeth?", next = "teeth" },
        { text = "I stood the high passes too, Captain.", next = "mountaineer", when = { origin = "dwarf_mountaineer" } },
        { text = "How do you hold the Valley against so many troggs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Shall I track the troggs back to their holes, Captain?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll help defend them.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Put me on your line, Captain.", next = "k_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I can get behind the trogg lines for you, Captain.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Troggs fear fire. My demons could help hold the Valley.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do your soldiers bear the endless fighting, Captain?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the troggs dishonour the statues, Captain?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where could a mage do the most good, Captain?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The King's statues can guard themselves, Captain.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    reserve = {
      lines = {
        { id = "rs_default", text = "The Ironforge Reserve has been called up to the Alliance front, and my regiment holds the gate here and cannot leave it. So the hills go unwatched." },
      },
      choices = {
        { text = "Then I'll watch them.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Ironforge ought to bring its soldiers home.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is the front worth it?", next = "reserve_worth" },
      },
    },
    reserve_worth = {
      lines = {
        { id = "rw_default", text = "The King says it is, and I'm a captain. I say 'Yes, my king,' and I count troggs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "And what does the captain think off duty?", tag = "Persuade", next = "reserve_off",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Dwarf" }, { origin = "dwarf_mountaineer" } } } },
          fail = { next = "reserve_on", fx = { affinity = -1 } } },
      },
    },
    leader = {
      lines = {
        { id = "ld_default", text = "Our scouts name a chieftain, Grawmug. Two brutes guard him, Gnasher and Brawler, and never leave his side. Kill him and the rest may go back into the ground." },
      },
      choices = {
        { text = "And if they don't?", next = "leader2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leader2 = {
      lines = {
        { id = "l2_default", text = "Then we kill the next one, for troggs have more chieftains than sense." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    statues = {
      lines = {
        { id = "su_default", text = "Madoran Bronzebeard and Khardros Wildhammer, raised by their sons. They watch the pass south, where the land still burns. A warning to the Dark Iron." },
      },
      choices = {
        { text = "Do the Dark Iron heed it?", next = "statues2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    statues2 = {
      lines = {
        { id = "s2_default", text = "They came for the dam, didn't they? So no, they don't, but the statues don't mind, for they're patient, and I try to be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    teeth = {
      lines = {
        { id = "te_default", text = "They're proof. Eight teeth is eight troggs, while eight complaints is a captain who ought to be replaced." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mountaineer = {
      lines = {
        { id = "mo_default", text = "Then stand a watch with my regiment some night. You'll find the troggs keep worse hours than the Frostmane." },
      },
      choices = {
        { text = "Gladly, Captain.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { thelsamar = 1 } } },
        { text = "I'm done standing watches, so I'll hunt troggs my own way.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    reserve_off = {
      lines = {
        { id = "ro_default", text = "Off duty, the captain thinks Ironforge has sent its best to guard other people's kingdoms while its own valleys fill with troggs. He also thinks the King knows it, which is why the King looks so tired at council." },
        { id = "ro_after", text = "And off duty, the captain asked to march with the Reserve and was told his post was here. He was angry about it for a month, and then he was relieved, and he has never once forgiven himself for the relief." },
      },
      choices = {
        { text = "Someone has to hold the gate, Captain.", next = "BACK", fx = { affinity = 2 } },
        { text = "That stays between us.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    reserve_on = {
      lines = {
        { id = "rn_default", text = "The captain is never off duty in the Valley of Kings, which is the short answer. The long answer is the same, only with more troggs in it." },
        { id = "rn_default2", text = "My opinions belong to the regiment's book, and the book belongs to the King. Ask me about the troggs instead; I've plenty to say on them." },
      },
      choices = {
        { text = "Fair enough, Captain.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Gladly, for I've more line than soldiers. The troggs come out o' the ground in rushes, an' a shield in the right place at the right moment is worth ten rifles on the hill." },
        { id = "xwa_paladin", when = { class = "PALADIN" },
          text = "Gladly, an' if ye've a blessin' tae spare for my lads, spare it, for they've been diggin' trogg teeth out o' their boots for a month. The Light's no' often seen at the Valley o' Kings." },
        { id = "xwa_ward", when = { origin = "dwarf_military_ward" },
          text = "Ward-trained! Then ye'll know a proper line from a mob, an' ye'll forgive me for havin' only a mob. Stand by the statues an' let them see what a soldier looks like." },
      },
      choices = {
        { text = "I'll hold where you put me, Captain.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "I'll go where the troggs are thickest.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Where do they come from?", next = "leader" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The regiment's book records most of what happens in these hills, and I've read every page. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm the King's captain in the Valley of Kings. My history is the regiment's history, and the regiment keeps a book." } },
    advice = { { id = "tp_ad", text = "Bring proof, always. Nobody argues with a sack of teeth." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The same troggs, or their cousins. They came up under the gnomes, and now they're coming up under us." } },
    troggs = { { id = "tp_troggs", text = "They're Stonesplinter, tunneling up from every crevice in the loch's hills.", next = "leader" } },
    _none = { { id = "tp_none", text = "That's not my post, I'm afraid. Ask in Thelsamar." } },
  },
}

P:NPC {
  key = "hinderweir", id = TODO_NPC("Chief Engineer Hinderweir VII"), name = "Chief Engineer Hinderweir VII",
  bible = "bibles/thelsamar.md", role = "worker", tier = "quest",
  communities = { "thelsamar" }, temper = { "anxious" }, values = { "proud", "careful" },
  notices = { "craft" },

  impression = {
    first = "Chief Engineer Hinderweir VII begged me to hold the rail on a walkway he swore was perfectly safe. The weight of six forebears and one great dam sits squarely on his shoulders.",
    third = "{name} met Chief Engineer Hinderweir VII, seventh of his name to tend the Stonewrought Dam in Loch Modan.",
  },

  greetings = {
    { id = "g_dam", text = "Careful on the walkway! It's perfectly safe, mostly safe, engineered to be safe, but please hold the rail." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Come and look at these stress readings. No? Well, not everyone loves a stress reading, and that's their loss." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I fear it every morning and most nights, for they've been seen in the hills, and one keg of their powder in the wrong place would empty the loch into the Wetlands. My forebears built it to stand for ever, and I'd rather not test that with a battle on top of it." } },
      choices = {
        { text = "I'll stand watch at the gates and stay there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better to hunt them in the hills than wait for them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dark Irons, mostly, creeping about with their powder kegs, though the mountain bears give my guards a fright now and then. If you see a track that isn't a bear's or a dwarf's, please, please tell someone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} would hear a fuse hiss long before any of us would, I'm sure of it, so do keep it near the walkways." },
      },
      choices = {
        { text = "I'll report every track I find, Engineer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I find Dark Irons, I'll deal with them myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "That is precisely what keeps me awake at night, and I thank you for saying it aloud! If you can slip past my guards, so can a Dark Iron with a keg of blasting powder, so tell me where you'd go in and I'll put a dwarf there." },
      },
      choices = {
        { text = "I'll show you every gap and tell no one else.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll show you, but knowledge like that isn't free.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where have your guards gone?", next = "guards" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I don't doubt it, and I'd rather not know what else answers to you. The Dark Irons called up something under Blackrock that's been burning ever since, so forgive me if I'm wary of anyone who calls things up." },
      },
      choices = {
        { text = "Fair. I'll stand guard here like anyone else.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fire's fire, Engineer. Use it or lose your dam.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How could they bring the dam down?", next = "threat_how" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It holds back a loch's worth o' water an' keeps the valley from floodin'. Some'd call that harm, but I'd call it a gift tae every farm below it." } },
      choices = {
        { text = "Taming water is wise, not harmful.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rivers deserve to run free, Chief Engineer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The loch would empty down the valley in an hour, and Thelsamar with it, and every farm between here and the Badlands. I dream of it most nights, so if you've a prayer for sleep, I'll take that too." } },
      choices = {
        { text = "Then I'll pray for the dam, and for your sleep.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't hold water. Check your sluice gates.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Chief Engineer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Scream, probably, and then hit him with a spanner, and then report him to Captain Rugelfuss in triplicate. I'm an engineer, not a soldier, though for the dam I'd learn." } },
      choices = {
        { text = "Report him in triplicate. The law will deal with him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the forms. Throw him off the dam.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Hinderweir.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hinderweir the Seventh, Chief Engineer of the Stonewrought Dam. I'm seventh of the name, and I'll not be the one remembered for the day it fell." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("A Dark Threat Looms") },
          text = "Someone's been at the dam. Things have moved that shouldn't move and things have been left that shouldn't be here, so find out who, before it's too late to find out anything." },
        { id = "h_crack", when = { metBefore = true }, text = "I found a hairline crack on the east face this morning, which is nothing, probably nothing. I'll check it again tonight, and tomorrow, and forever." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Dark Threat Looms"), days = 7 } },
          text = "You saved her, the dam, my dam! She's safe, for the time being, though I've started checking at noon as well." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the dam! I'll have ye know the Stonewrought Dam is the finest piece o' engineering in Khaz Modan, an' the fish don't seem tae mind it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, thank goodness, for if the Dark Irons come for the dam, I'd much prefer you between them and the sluice gates." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? You'll have keen eyes, then, and I'd be ever so grateful if you'd turn them on the hills above the dam." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, could you bless the dam? I've tried everything else, and my grandfather swore by a good blessing." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Thank goodness, because if the Dark Irons come for the dam, you'll shine so brightly they'll know they're not welcome." },
      },
      again = {
        { id = "h_again", text = "Yes? Quickly, please; I've readings due." },
        { id = "h_again2", text = "Go on, and hold the rail while you do." },
      },
      choices = {
        { text = "Does the dam harm the land around it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "How old is the dam?", next = "old" },
        { text = "What are the Dark Iron after?", next = "threat" },
        { text = "Where are your guards?", next = "guards" },
        { text = "Who built the dam?", next = "built" },
        { text = "The stonewrought method was a Dark Iron's, I'm told.", next = "forgewright", when = { heardLine = "archesonus.d_default" } },
        { text = "A gnome would like a look at your dam, Chief Engineer.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "A mage's ward could shore up the dam.", next = "k_mage", when = { class = "MAGE" } },
        { text = "Your guards would never see a saboteur coming, Engineer.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Dark Irons wield fire. I know how to answer it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you fear the Dark Irons will attack the dam?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for in the hills above the dam?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would happen to the valley if the dam ever failed?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "If you caught a Dark Iron at the dam, what would you do?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    old = {
      big = true,
      lines = {
        { id = "o_default", text = "Older than my grandfather's grandfather, and holding back the whole loch. If it goes, the valley below goes with it. I check it every morning, every night, and sometimes in between." },
      },
      choices = {
        { text = "What happens if it goes?", next = "old_goes" },
        { text = "That's a lot of responsibility.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    old_goes = {
      lines = {
        { id = "og_default", text = "The loch goes west, all of it, down into the Wetlands. I don't sleep much, and now you can see why." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = {
        { id = "tr_default", text = "First they brought down the Thandol Span, then they pillaged Dun Modr. You needn't be a genius to see what's next on their list. I am one, and I see it plainly." },
      },
      choices = {
        { text = "What would they use?", next = "threat_how" },
        { text = "Then we stop them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'm an engineer. Let me check the ramp.", next = "BACK", when = { profession = "Engineering" }, fx = { affinity = 2 } },
      },
    },
    threat_how = {
      lines = {
        { id = "th_default", text = "Something that goes bang, in barrels. I've seen sappers on the eastern ramp, and sappers don't come for the view." },
        { id = "th_seaforium", when = { questDone = TODO_QUEST("A Dark Threat Looms") },
          text = "Seaforium! It's harmless dry, but wet, Stonesmirk says, it could blow Ironforge out of the mountain, and they brought it to a dam, of all things." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    guards = {
      lines = {
        { id = "gu_default", text = "Reassigned to the Alliance front, nearly all of them, and my best inspector with them. I have a clipboard, a rail, and you." },
      },
      choices = {
        { text = "That'll do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    built = {
      lines = {
        { id = "bu_default", text = "Before my time, and before my father's. It's stonewrought work, the finest in the world, and who laid the first stone matters less than who keeps the last one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgewright = {
      lines = {
        { id = "fw_default", text = "Dark Iron? The stonewrought... no, well, I suppose a method's a method and a dam's a dam. This one's mine now, and they can't have it back." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    k_gnome = {
      lines = {
        { id = "xgn_default", text = "A look, by all means, but no tinkering. Seven generations of Hinderweirs have kept her standing by changing nothing at all, and the last gnome who looked at her suggested a steam-powered spillway." },
      },
      choices = {
        { text = "A spillway might save her, you know.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "If she stands, leave her be.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "A ward on a dam? And when your ward wears off, and the stone underneath has forgotten how to hold on its own? I'll trust the stonewrought method and my own eyes, thank you." },
      },
      choices = {
        { text = "Fair. Stone's more patient than magic.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know, well, I know a great deal, mostly about the dam, but also other things, which I'll gladly tell you about if you ask about any of these, quickly, before I have to go and check the dam again." },
    },
    background = { { id = "tp_bg", text = "I'm the seventh of the name and Chief Engineer of the dam, and that's all of me; the rest is readings." } },
    advice = { { id = "tp_ad", text = "Check it twice, then check it again, and then hold the rail." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name near my dam, please, just don't. I've enough to worry about as it is.", next = "threat" } },
    stonewrought_dam = { { id = "tp_dam", text = "She's mine. Well, she's the King's, but she's mine.", next = "old" } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything but the dam right now. I rarely can." } },
  },
}
