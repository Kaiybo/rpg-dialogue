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
    { id = "g_away", when = { away = 14 }, text = "Back on the loch after {away}, an' a fine sight ye are! The poster by the League's door has a few new faces on it since ye left." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "By the Bronzebeard, ye've grown handy since I first pointed ye at that poster! The tunnel rats'll be wantin' a new hidin' place." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole town's been talkin' about the help ye've been givin', friend! Thelsamar doesnae forget a good turn." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear ye've got somebody in town fair cross wi' ye. Best patch it up, fer Thelsamar's too small a place tae be carryin' grudges." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye lost an argument wi' a trogg, which happens tae the best of us. Go an' get mended." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, good! The troggs that came up under yer city are all over these hills too, so ye'll want a bit o' payback." },
  },

  start = "hello",
  nodes = {
    opn_orcs = {
      lines = {
        { id = "opn_orcs_q", text = "After the war? They went intae the camps, an' then a good many o' them walked out again under this Thrall. My da says they should've been put tae the axe, an' my mam says they were sick wi' some warlock's poison an' couldnae help it. Where d'ye stand, then?" },
      },
      choices = {
        { text = "They burned this valley. Your da's right.", next = "opn_orcs_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { orcs = "hate" } } },
        { text = "Your mam's right. They were poisoned by their own warlocks.", next = "opn_orcs_r_pity", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { orcs = "pity" } } },
        { text = "It doesn't matter now. They're free, and they're on Kalimdor.", next = "opn_orcs_r_wary", fx = { trait = { practical = 1 }, opinion = { orcs = "wary" } } },
        { text = "I've met orcs since. Some are honest enough.", next = "opn_orcs_r_respect", when = { minLevel = 30 }, fx = { opinion = { orcs = "respect" } } },
        { text = "I'd rather hear about the loch.", next = "BACK" },
      },
    },
    opn_orcs_r = {
      lines = {
        { id = "opn_orcs_r_default", text = "The loch it is, then. It's a safer subject, unless ye're a fish." },
      },
      choices = {
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    opn_orcs_r_hate = {
      lines = {
        { id = "opn_orcs_r_hate", text = "Ha! I'll tell him a {class} agreed wi' him, an' he'll be insufferable at supper for a week. There's catapults on the bottom o' this loch that'd agree wi' ye too." },
      },
      choices = {
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    opn_orcs_r_pity = {
      lines = {
        { id = "opn_orcs_r_pity", text = "Mam'll be glad tae hear it, though I'll no' tell da. I've never met one, ye see, so I don't know what tae think, only what they think." },
      },
      choices = {
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    opn_orcs_r_wary = {
      lines = {
        { id = "opn_orcs_r_wary", text = "Aye, an' Kalimdor's a long way off, an' I'd like it tae stay that way. That's the sort o' answer my captain gives when he doesnae want tae argue." },
      },
      choices = {
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    opn_orcs_r_respect = {
      lines = {
        { id = "opn_orcs_r_respect", text = "Have ye now? Ye'll have tae tell me about it some time, quietly, an' no' anywhere near the Stoutlager." },
      },
      choices = {
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Now there's a thought! He's a Dark Iron, an' they've their own dealings wi' the fire under the mountains, so maybe the stone would know him. I'll take any help I can get, so long as ye bring him tae me an' dinnae leave it tae the earth tae swallow him." } },
      choices = {
        { text = "I'll bring him in alive, Kadrell, for Ironforge's justice.", next = "BACK", reply = "Alive, aye, that's the way o' it, an' the King will thank ye for the questions he answers. Bring him in, an' I'll stand ye a pint.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the earth swallows him, that's justice enough.", next = "BACK", reply = "Justice enough for some, maybe, but Ironforge wants tae know who sent him. The earth cannae tell us that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ha! No, the spy's a Dark Iron, an' ye're plainly no' one. But a stranger who calls things up out o' the dark is just the sort I'm paid tae keep an eye on, so I'll be keepin' it on ye." } },
      choices = {
        { text = "Watch all you like. I've nothing to hide.", next = "BACK", reply = "Good, then ye'll no' mind me standin' about. I'll be quiet about it, mostly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watching me is a waste of your time, Kadrell.", next = "BACK", reply = "Maybe it is, an' I'll be glad tae say so when the spy's in irons. Till then, I watch everyone.", fx = { align = { order = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "East toward the Valley o' Kings, where the troggs come up out o' the earth in the night, an' north by the Silver Stream where the kobolds dig. The bounty board's got a job for every one o' them, so ye'll never stand idle." } },
      choices = {
        { text = "I'll work through the bounty board, one job at a time.", next = "BACK", reply = "One at a time, aye, that's how the board gets cleared. Start wi' the troggs, for they're the loudest an' the nearest.", fx = { align = { order = 1 } } },
        { text = "I'll go where the fighting's thickest and forget the board.", next = "BACK", reply = "Thickest, aye, an' ye'll find it east, toward the valley. Just bring me somethin' tae write on the board when ye're back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Ha! Aye, I suppose it does. He's a Dark Iron who skulks round the dam an' the dig, so if ye know where a body hides in a town this size, ye'll find him faster than my lads in their clankin' mail." },
      },
      choices = {
        { text = "I'll find him and drag him to you in irons.", next = "BACK", reply = "In irons, aye, an' I'll have the cell swept for him. Thank ye, friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If he's spying, I'll quietly make him disappear.", next = "BACK", reply = "Disappear? Ironforge wants him talkin', no' vanished. Bring him in, or ye'll answer tae the King's men.", fx = { align = { honor = -1 } } },
        { text = "Why would he want the dam?", next = "spy_dam" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Need? We've a dam, a dig an' a valley full o' troggs, an' not a single mage tae our name, so aye, ye're welcome. Just keep yer fire away from the Stoutlager's casks, for Hearthstove would never forgive ye." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Aye, an' a gnome mage is twice welcome, for ye'll know what crawled out from under yer city. There's troggs in every hill here, an' they burn just as well as the ones at home." },
      },
      choices = {
        { text = "I'll put my fire where you point it, Mountaineer.", next = "BACK", reply = "Point it, I will, an' gladly. Start at the Stonesplinter camps, an' leave the inn standin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where I'm needed, not where I'm sent.", next = "BACK", reply = "Needed, aye, an' that's everywhere in this valley. Go where ye like, so long as the troggs suffer for it.", fx = { align = { order = -1 } } },
        { text = "Who needs a hand around here?", next = "jobs" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Aye, since the troggs came boilin' out o' the ground at Uldaman way. The beasts are pushed out o' their dens an' half o' them take it out on my patrols." } },
      choices = {
        { text = "Then drive the troggs back and the beasts will settle.", next = "BACK", reply = "That's the way o' it, an' the patrols will thank ye. Drive them back far enough, an' the bears might stop bitin' my lads.", fx = { align = { honor = 1 } } },
        { text = "Maybe the beasts are right to defend their land.", next = "BACK", reply = "Defend it from my patrols? They're welcome tae try, but we're no' the ones diggin' up the valley.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better than ye'd think, for a dwarf takes a threat as a reason tae drink an' sing louder. But there's widows in town from the trogg raids, quieter than they let on, an' I'd take it kindly if ye looked in on them." } },
      choices = {
        { text = "I'll look in on each of them, Kadrell.", next = "BACK", reply = "Bless ye for that, for they'll no' ask, an' they need it. Start wi' old Hilda by the well; she's been alone longest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Widows have family for that. I've a road to clear.", next = "BACK", reply = "Family, aye, if they've any left. The road's important, I'll grant, but it'll keep for an hour.", fx = { align = { light = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Ironforge'll want him alive, tae find out what he knows about the dam an' who sent him. The lads at the Stoutlager would want somethin' else, an' I'll no' say I blame them." } },
      choices = {
        { text = "Take him alive to Ironforge. Justice should be done properly.", next = "BACK", reply = "Properly, aye, an' I'll be glad tae hand him over. The lads will grumble, but they'll have their day when the King's judges hear it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the lads have him. He'd do worse to them.", next = "BACK", reply = "They'd thank ye for it, an' I'd look the other way, maybe. But Ironforge wants him, an' Ironforge gets him.", fx = { align = { order = -1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Aye, an' ye came back, which is the part folk forget tae do. The Mountaineers have been fightin' troggs on this road since before the dam was finished, so anythin' that thins them at the source is good news for Thelsamar." } },
      choices = {
        { text = "The Mountaineers should march on the trogg dens while they're weak.", next = "BACK", reply = "While they're weak, aye, an' if I had the dwarves I'd march tomorrow. Tell that tae Ironforge for me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the troggs their holes, Kadrell. Just guard the road.", next = "BACK", reply = "Guard the road, aye, that's what we do, an' it's what we'll keep doin'. But the troggs keep diggin' up through the road, so it's no' as simple as that.", fx = { align = { honor = -1 } } },
        { text = "Where do the troggs come from, really?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "Out o' the deep stone, that's all anyone knows for certain. The League says they were down there before us, sleepin' in the dark, an' that the diggin' woke them, so ye'll understand why I'm no' fond o' diggin'." } },
      choices = {
        { text = "Diggers and troggs both, then. I'll remember that.", next = "BACK" },
      },
    },
    dd_kd_rug = {
      lines = {
        { id = "dd_kd_rug1", text = "Aye, by runner, an' the runner was out o' breath. He wrote that the troggs are fewer an' that ye fight like a Mountaineer, which from Rugelfuss is near enough a medal, though he'll also say they'll be back by spring, for he always does." },
      },
      choices = {
        { text = "Then I'll come back in spring and kill them again.", next = "BACK", reply = "That's the spirit, an' I'll put ye on the board in chalk so it's easy tae change the date.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "They're vermin, but I take no joy in the killing.", next = "BACK", reply = "No, nor do I, though I'd never say it in front o' the captain. It's work that wants doin', that's all.", fx = { align = { light = 1 } } },
        { text = "Something else, Kadrell.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "I hear ye went down intae Uldaman an' came out the far end. The troggs in my hills are the same breed as the ones in there, so ye've my thanks, an' the thanks o' every farmer on the loch." },
        { id = "h_default", key = true,
          text = "I'm Mountaineer Kadrell, an' I watch the road through Thelsamar for the King. There's troggs in the hills, a Dark Iron spy somewhere about an' kobolds in the foothills, so it's never dull." },
        { id = "h_stout", tags = { "news" }, when = { questActive = TODO_QUEST("Stout to Kadrell") },
          text = "Stout, from Ironforge! Ye've brought me a taste o' home, an' I'll no' forget it." },
        { id = "h_rats", when = { questActive = TODO_QUEST("Rat Catching") },
          text = "We call the kobolds tunnel rats, an' they're west o' town along the hills, diggin' dens an' foulin' good land. Bring me their ears an' earn the bounty." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Mountaineer Stormpike's Task") },
          text = "Mountaineer Stormpike's got a job wants doin'. He's a good dwarf, grumpy but good." },
        { id = "h_stonegear", when = { questActive = TODO_QUEST("Stonegear's Search") },
          text = "Pilot Stonegear's on a search o' his own. Help him find what he's after, an' mind the hills while ye do." },
        { id = "h_rockgar", when = { questActive = TODO_QUEST("Report to Mountaineer Rockgar") },
          text = "Mountaineer Rockgar's at Algaz Station, up the north road past the tower. Take dry socks, for the Wetlands will have the rest o' ye." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Well, look who it is! Thelsamar's favourite visitor, an' I'll hear no argument about it. Come here, come here!" },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Aye, I see ye. I'll be civil, because it's my post, but don't be expectin' the warm welcome." },
        { id = "h_smuggler", when = { origin = "dwarf_loch_smuggler" },
          text = "Hold there, I know that face. It used tae come up the Wetlands road after dark wi' a cart that sat a wee bit low fer an honest load, so what's it doin' on my road in daylight?" },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid on my road! Good. The bears in these hills have been in a foul temper all season, an' I'd wager ye could tell me why." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my road! Grand, for the troggs are bold this season, an' I like a shield beside mine when they come." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Grand, for the lads at the bounty board come back wi' scrapes they'd never show the healer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my road! The Light an' a good hammer, there's no better pair for troggs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I watch the road for the King, an' I'll be watchin' you as well, nothin' personal." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman on my road! The troggs come up out o' the hills, an' I've always wanted somebody who could tell me which hill first." },
        { id = "dd_troggthreat", when = { questDone = TODO_QUEST("The Trogg Threat") },
          text = "Captain Rugelfuss sent word down from the Valley o' Kings that ye thinned his troggs proper. He doesnae praise anybody, so I'd frame that if I were ye." },
        { id = "dd_stonesplinter", when = { killed = { name = "Stonesplinter", min = 60 } },
          text = "Ye've killed that many Stonesplinters that the hills have gone quiet on my side o' the road. I'm no' sure I like the quiet, mind, for troggs are never quiet unless they're plannin'." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The road's quiet, for now." },
        { id = "h_again2", text = "Ask away. I've a post tae watch an' all day tae watch it." },
      },
      choices = {
        { text = "Rugelfuss sent word about me?", next = "dd_kd_rug", when = { questDone = TODO_QUEST("The Trogg Threat") } },
        { text = "The hills seem to have changed lately.", next = "druid_q", when = { class = "DRUID" } },
        { text = "I keep hearing talk of a spy.", next = "spy" },
        { text = "How's the loch?", next = "loch" },
        { text = "Who needs a hand around here?", next = "jobs" },
        { text = "You look like a dwarf who's had a good stout.", next = "stout", when = { questDone = TODO_QUEST("Stout to Kadrell") } },
        { text = "The troggs came up under my city first.", next = "gnome", when = { race = "Gnome" } },
        { text = "I track for a living, Mountaineer. Need eyes on the hills?", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Your loch is lovely, but where are the trees?", next = "k_elf", when = { race = "NightElf" } },
        { text = "A spy, Mountaineer? Takes one to catch one.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has Thelsamar much need of a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Where's the fighting worst along the road, Mountaineer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How are Thelsamar's folk holding up, Kadrell, with all this?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should be done with the Dark Iron spy once he's caught?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a warlock might be your Dark Iron spy, Kadrell?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the earth tell me where your Dark Iron spy is hiding?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I went down into Uldaman, Kadrell.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "Those carts are behind me, Mountaineer. Mostly.", next = "xorig_smug", when = { origin = "dwarf_loch_smuggler" } },
        { text = "Thanks, Kadrell.", next = "END" },
      },
    },
    xorig_smug = {
      lines = {
        { id = "xos_default", text = "Mostly, says the smuggler, an' the tax men in Thelsamar would laugh tae hear it. I chased ye three nights runnin' past the dam once an' never caught ye, so I'll grant ye were good at it, whatever else ye were." },
      },
      choices = {
        { text = "The tax men were slow. Somebody had to keep the ale moving.", next = "xorig_smug2", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "I'm not proud of it. I'd rather work the right side now.", next = "xorig_smug2", fx = { align = { honor = 1 } } },
        { text = "What made you give up the chase?", next = "xorig_smug2" },
      },
    },
    xorig_smug2 = {
      lines = {
        { id = "xos2_default", text = "The Wetlands road got darker, that's what, an' I'd rather chase a smuggler than bury one the raptors found first. Keep yer cart honest on my road an' we'll call it settled, though I'll be watchin' how low it sits." },
      },
      choices = {
        { text = "Aye, Kadrell. Point taken.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spy = {
      big = true,
      lines = {
        { id = "s_default", text = "He's a Dark Iron, poking about the town an' the dam. There's a poster out by the League, so if ye see a dwarf who looks a wee bit too sooty, give us a shout." },
      },
      choices = {
        { text = "The dam seems a strange thing for a spy to want.", next = "spy_dam" },
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 2, learn = { "dark_iron" } } },
      },
    },
    spy_dam = {
      lines = {
        { id = "sd_default", text = "If it went, the loch would go wi' it, west intae the Wetlands. Chief Engineer Hinderweir's on the dam day an' night, so ask him, if ye've an hour an' strong nerves." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    loch = {
      lines = { { id = "l_default", text = "It's beautiful, an' full o' trouble, like most things worth havin'. Ye should see it at dawn from the dam." } },
      choices = {
        { text = "That loch must hide a few things beneath the water.", next = "loch_what" },
        { text = "I'll go and see it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    loch_what = {
      lines = {
        { id = "lw_default", text = "There's crocolisks an' threshers, an' bits o' the Second War, for there's broken catapults on the bottom if ye dive. The orcs held this valley once, though no' for long." },
      },
      choices = {
        { text = "What do you think should have been done with the orcs?", next = "opn_orcs" },
        { text = "Something else.", next = "BACK" },
      },
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
        { id = "st_default", text = "Shimmer Stout, from Dun Morogh! By Magni's beard, I felt like I could fly. I couldnae, mind; I checked." },
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
        { text = "A mean bear's a bear that needs putting down.", next = "BACK", reply = "Aye, an' I'll thank ye for it. One o' my lads came back from the north hills wi' his shield bitten through, an' the bear's still out there.", fx = { align = { order = 1 } } },
        { text = "Leave them to the hills, Kadrell. They were here first.", next = "BACK", reply = "They were, I'll grant ye, an' I'd leave them be if they'd leave my patrols be. They willnae.", fx = { align = { order = -1 } } },
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
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are sneakin' about where they've no business. I'd like tae know what they want wi' a dam." } },
    troggs = { { id = "tp_troggs", text = "They're Stonesplinter troggs, out o' the hills. Captain Rugelfuss counts 'em down in the Valley o' Kings, an' he's run out o' fingers." } },
    stonewrought_dam = { { id = "tp_dam", text = "The dam's holdin', though Chief Engineer Hinderweir would tell ye otherwise every mornin'.", next = "spy_dam" } },
    _none = { { id = "tp_none", text = "Couldnae say. Ask at the inn, for they hear everythin'." } },
    magni = { { id = "tp_magni", text = "King Magni's Mountaineers hold Loch Modan for him, an' I'm proud tae be one. He sends word tae Thelsamar now an' then, an' we all stand a bit straighter for a week." } },
    wildhammer = { { id = "tp_wildhammer", text = "Wildhammer riders come down tae the Stoutlager now an' then, loud as a storm an' twice as thirsty. I like them, whatever the old folk say." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol's over the mountains in the Wetlands, an' a dark place by every account. The Dragonmaw use it now, an' I'm glad there's a range o' hills between them an' my road." } },
    scourge = { { id = "tp_scourge", text = "If the dead come south, they'll come over the Span an' down through Algaz, an' I'll be standin' on this road when they do. Ironforge won't fall the way Lordaeron did." } },
  },
}

P:NPC {
  key = "ironband", id = TODO_NPC("Prospector Ironband"), name = "Prospector Ironband",
  prejudice = { race = "NightElf", amount = 8, why = "A druid sat in his cousin Durn's Darkshore trench humming until the crew walked off." },
  bible = "bibles/thelsamar.md", role = "scholar", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "honest", "practical" },
  notices = { "craft" },

  impression = {
    first = "Prospector Ironband admits his dig is slow and insists it will pick up any day now. He has the stubborn patience of someone who has been saying that for a while.",
    third = "{name} visited Prospector Ironband's excavation in Loch Modan, where the Explorers' League dig goes slowly but steadily.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A night elf at my dig. If you've come to tell me the ground is sacred and the stones are sleeping, my cousin heard that speech in Darkshore last summer, and it cost him a season." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, there's my night elf. You've not once called my trenches a wound in the earth, and I've started saving you a seat by the fire." },
    { id = "o_league_dangerous_lm", tags = { "news" }, when = { opinion = { topic = "explorers_league", stance = "dangerous" } },
      text = "Word gets around, an' I hear ye think we're diggin' up trouble. Come an' stand in the trench a night, an' then tell me again." },
    { id = "g_dig", text = "Watch the trench, an' the ropes, an' the lads, for they're workin', slowly but workin'." },
    { id = "g_back", when = { metBefore = true }, text = "Good, ye came back. We could always use another pair o' hands that know which end's the shovel." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the dig's moved on a good few feet since. Slowly, mind, but it's movin'." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a good deal more capable since ye last stood by my trench. I'd hand ye the heavy shovel now, an' that's no small honour." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear ye talked someone round in town. Ye'd no' fancy talkin' the Explorers' League into sendin' me more lads, would ye?" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye'll know good stone from bad, then. Most o' what we find here is bad, but the good bits are worth it." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "My cousin Durn had a dig on the Darkshore coast with a permit from Magni himself, and a druid sat in his trench for a week humming at him until the crew walked off. Your people don't own the past, friend, they only act as though they do." } },
      choices = {
        { text = "Some ruins should stay buried. My people have their reasons.", next = "prej_a", fx = { align = { order = 1 } } },
        { text = "Dig where you like. The past belongs to everyone.", next = "prej_b", fx = { align = { order = -1 } } },
        { text = "What are you hoping to find here, Prospector?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Reasons, aye, and they never tell anyone what they are, which is the part that drives an honest digger mad. Tell me one someday, and I might listen." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Ha, now you sound like a dwarf! Mind you don't say it in Darnassus, or they'll have you sitting in a trench humming." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "The truth about where we came from, and maybe the Titans' own hand in it. The troggs make that hard going, mind, but it's worth a few bruises." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    opn_dig = {
      lines = {
        { id = "opn_dig_q", text = "High Explorer Magellas would have my beard for askin', but I've asked it myself at three in the mornin' wi' the troggs howlin' in the trench. Ye've seen the dig an' ye've seen what came up out of it. What would ye do in my boots?" },
      },
      choices = {
        { text = "Keep digging. The past is worth the risk.", next = "opn_dig_r_admire", fx = { affinity = 1, align = { order = -1 }, opinion = { explorers_league = "admire" } } },
        { text = "Fill in the trench. Some doors should stay shut.", next = "opn_dig_r_dangerous", fx = { affinity = -1, align = { order = 1 }, opinion = { explorers_league = "dangerous" } } },
        { text = "Dig, but put a garrison on the hole first.", next = "opn_dig_r_useful", fx = { trait = { practical = 1 }, opinion = { explorers_league = "useful" } } },
        { text = "The earth is restless. Listen to it before you dig.", next = "opn_dig_r_careless", when = { class = "SHAMAN" }, fx = { affinity = 1, opinion = { explorers_league = "careless", the_elements = "listen" } } },
        { text = "That's for the League to decide.", next = "BACK" },
      },
    },
    opn_dig_r = {
      lines = {
        { id = "opn_dig_r_default", text = "Aye, an' the League decides from a warm hall in Ironforge. Never mind me; I'm only tired." },
      },
      choices = {
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    opn_dig_r_admire = {
      lines = {
        { id = "opn_dig_r_admire", text = "That's what I tell myself at dawn, an' it's good tae hear it from someone else for a change. I'll keep diggin', then, an' keep a sword by the trowels." },
      },
      choices = {
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    opn_dig_r_dangerous = {
      lines = {
        { id = "opn_dig_r_dangerous", text = "Shut? We're the ones who opened it, so we're the ones who have tae stand in it. I hear ye, mind, an' I'll no' pretend I've an answer that'd satisfy ye." },
      },
      choices = {
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    opn_dig_r_useful = {
      lines = {
        { id = "opn_dig_r_useful", text = "A garrison! I've asked for one twice, an' Captain Rugelfuss sends me his regrets an' a Mountaineer wi' a cold. Still, ye're right, an' I'll ask again." },
      },
      choices = {
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    opn_dig_r_careless = {
      lines = {
        { id = "opn_dig_r_careless", text = "Listen tae it, aye, an' if it says anythin' useful, ye'll come straight back an' tell me, for I've been listenin' for months an' all I hear is troggs." },
      },
      choices = {
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Troggs, mostly, which come up out o' the ground like weeds an' bite like badgers. If ye find anythin' down there that whispers, though, ye'll bring it tae me an' no' keep it, for it belongs tae the League an' tae Ironforge." } },
      choices = {
        { text = "Anything I find goes to the League.", next = "BACK", reply = "Good, that's the League's way, an' it's mine. Ye'll have yer name in the report for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What I find in the dark, I keep.", next = "BACK", reply = "Then ye'll no' be diggin' in my site, friend. Anythin' that whispers goes tae Ironforge, an' that's flat.", fx = { align = { order = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They come up wherever we dig, as if the earth sends them tae spite us, an' my diggers are scholars, no' soldiers. A warrior standin' at the cut wi' a good shield would let us work a full day for once." } },
      choices = {
        { text = "I'll stand guard so the work can go on.", next = "BACK", reply = "Bless ye, the diggers will sleep easier for it. Stand at the cut, an' we'll work round ye.", fx = { align = { honor = 1 } } },
        { text = "Pay me in what you dig up, and I'll guard it.", next = "BACK", reply = "In what I dig up? It's no' mine tae give, friend, it's the League's. I'll pay ye in coin an' thanks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, for the troggs leave tracks in the spoil heaps, an' if I knew which tunnels they used I'd stop diggin' intae them by accident. The bears in the hills have sense enough tae stay clear o' my digs, but the troggs come straight for them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep yer {pet} away from the trenches, mind, for the last beast that came through dug faster than my whole crew an' twice as careless." },
      },
      choices = {
        { text = "I'll mark their tunnels and leave the fighting to others.", next = "BACK", reply = "Mark them, aye, an' I'll steer the diggers round them. A map o' their tunnels is worth more tae me than a pile o' dead troggs.", fx = { align = { order = 1 } } },
        { text = "I'd rather hunt them in their tunnels than mark them.", next = "BACK", reply = "Hunt them in their tunnels? Ye're braver than me. Mark the way in, at least, so I know where tae look for ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Can ye now? Then ye're ahead o' me, for I've been diggin' a month an' all I feel is my back. The League in Ironforge thinks there's old work buried under these hills, an' if ye can feel it, I'll want it written down for them." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Then ye've a better nose than mine, an' I'll trust a Gnomeregan mage over my own sore back. Whatever it is, the troggs want it too, an' that worries me more than the magic." },
      },
      choices = {
        { text = "Whatever it is, seal it and send it to Ironforge.", next = "BACK", reply = "Seal it an' send it, aye, that's what the League wants. I'll have the crates ready.", fx = { align = { order = 1 } } },
        { text = "Let's crack one open and see what it does.", next = "BACK", reply = "Crack one open? Ye've been listenin' tae too many gnomes. No' in my dig, an' no' while I'm prospector.", fx = { align = { order = -1 } } },
        { text = "Did your digging wake the troggs?", next = "idols_wake" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Did ye now? Well, I'll no' pretend I'm surprised, for every dwarf here has his head in a hole all day. If ye're so good at walkin' in, walk intae the Stonesplinter camps an' see what they've carried off from us." },
      },
      choices = {
        { text = "I'll get your things back and ask nothing for it.", next = "BACK", reply = "Nothin' for it? Then ye're a better soul than ye let on. Bring them back, an' I'll no' forget it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get them, and maybe a few trinkets of my own.", next = "BACK", reply = "A few o' yer own? Then I'll be countin', an' the League will be countin', an' we'll both find ye.", fx = { align = { honor = -1 } } },
        { text = "Where is your powder going?", next = "powder" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That the earth remembers every wound, an' that I'd answer for mine. Well, the earth's had a fair few wounds from troggs before me, an' I'm only after what's honest ore." } },
      choices = {
        { text = "Honest work is no crime, Prospector.", next = "BACK", reply = "Thank ye, an' I'll tell that tae the next druid who scolds me for scarrin' the hill.", fx = { align = { light = 1 } } },
        { text = "The druid was right. Dig with more care.", next = "BACK", reply = "Maybe she was, an' maybe I should. I'll think on it, which is more than I promised her.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Agmond, my best surveyor, went out tae the Badlands sites an' the troggs caught him alone, I fear. If he's gone, he's had no priest tae say the words over him, an' that's sat on me ever since." } },
      choices = {
        { text = "Then I'll say the rites over him properly.", next = "BACK", reply = "Would ye? Then Agmond can rest, an' so can I. Thank ye, from the bottom o' my heart.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's gone, Prospector. The dig is his memorial now.", next = "BACK", reply = "His memorial, aye, an' a fine one it'll be when we've finished. But he deserves the rites too, an' I'll see he gets them.", fx = { align = { light = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, for if we stop every time somethin' digs up beside us, we'll never find a thing. The League's no' an army, but we're no' cowards either, an' I'll no' be run off my own dig." } },
      choices = {
        { text = "Then I'll guard the dig while you work.", next = "BACK", reply = "Then ye're the help I've been prayin' for. Stand guard, an' we'll find what's down there.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pack up when it's dangerous. Courage is for soldiers.", next = "BACK", reply = "Courage is for everyone, friend, an' the League's got its share. We'll no' pack up while there's work tae do.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ironband.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then ye've been where my wee dig in the hills is only scratchin' at, an' I'll admit I'm jealous. The League reckons the troggs came up out o' those deep halls, so if somethin' at the bottom's been put tae rest, mayhap they'll stop pourin' out over my hills." } },
      choices = {
        { text = "Agmond died for this. Keep digging and finish his work.", next = "BACK", reply = "Finish his work, aye, an' that's what I mean tae do. Thank ye for sayin' it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No relic is worth another Agmond, Ironband. Close the dig.", next = "BACK", reply = "Another Agmond? Ye've a cold way o' puttin' it, but maybe ye're right. I'll think on it, though I'll no' promise.", fx = { align = { honor = -1 } } },
        { text = "Do you think the troggs will stop now?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "I doubt it, for there's thousands o' them in the deep places an' they breed like rabbits. But a dwarf can hope, an' ye've given me a wee reason tae." } },
      choices = {
        { text = "Then I'll keep an eye on the hills for you.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Alliance" },
          text = "They say ye went right down intae Uldaman, past all the stone keepers. My idols an' Agmond's urns all point that way, so I'd dearly like tae hear what ye saw." },
        { id = "h_default", key = true,
          text = "I'm Darteus Ironband o' the Explorers' League, an' this is my dig. It's slow work, an' I'll no' pretend otherwise, but it'll pick up, an' when it does ye'll hear about it in Ironforge." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Excavation Progress Report") },
          text = "A report for the League. Tell 'em it's slow but steady, that we need more hands, an' that the troggs are a nuisance, though they'll know the last bit already." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Protecting the Shipment") },
          text = "There's a shipment comin' up the road, an' the hills are crawlin'. See it gets here in one piece, for I'm countin' on it." },
        { id = "h_stormpike", when = { heardLine = "stormpike_p.h_default" },
          text = "Ye've met Prospector Stormpike in the Hall o' Explorers? He's curt, an' he's always been curt, but he reads every word o' my reports." },
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
        { id = "h_miner", when = { origin = "dwarf_ironforge_miner" },
          text = "Ye stand at the edge o' my trench like it's the only safe bit o' ground in the loch, which tells me ye were born under the mountain. The sky out here gets tae the deeps lads; ye'll get used tae it, or ye won't." },
        { id = "dd_dam", tags = { "news" }, when = { questDone = TODO_QUEST("A Dark Threat Looms") },
          text = "Word came up the road that ye stopped the Dark Irons blowin' the dam. If that dam went, my dig would be the bottom o' a lake, so I owe ye more than a pint." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the ropes while ye ask." },
        { id = "h_again2", text = "Ask away; diggin's slow, an' the lads are all nursin' blisters, so talkin's the only quick thing round here." },
      },
      choices = {
        { text = "You've had trouble with my people, Prospector?", next = "prej", when = { prejudiced = true } },
        { text = "What did the last druid say about your digging?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are you digging for?", next = "dig" },
        { text = "The dig seems to be going slowly.", next = "slow" },
        { text = "Does anything go missing from your dig?", next = "powder" },
        { text = "Prospector Stormpike sent me. You need legwork?", next = "agmond", when = { questActive = TODO_QUEST("Ironband Wants You!") } },
        { text = "The stone at your dig is restless, Ironband.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Your dig could use a gnome's touch.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Those idols carry an enchantment. I can feel it from here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your camp's easy to walk into, Prospector. I walked in.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the troggs trouble the dig much, Prospector?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter's eye be useful on a dig?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone been lost on this dig, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the League keep digging while the troggs are so close?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has your dig found anything a warlock should worry about?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I went to the bottom of Uldaman, Ironband.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Alliance" } },
        { text = "I grew up in the Ironforge deeps. Your trench feels like home.", next = "xorig_deeps", when = { origin = "dwarf_ironforge_miner" } },
        { text = "Good luck with the dig.", next = "END" },
      },
    },
    xorig_deeps = {
      lines = {
        { id = "xod_default", text = "Does it now? Then ye'll be the first in a month who didnae complain about the mud. A deeps miner reads the stone better than most o' my League scholars, so tell me, what d'ye make o' the seam on the north wall?" },
      },
      choices = {
        { text = "It's soft. I'd shore it up before you dig further.", next = "xorig_deeps2", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "It'll hold. Dig faster and stop fretting.", next = "xorig_deeps2", fx = { trait = { brave = 1 } } },
        { text = "I'd rather not guess at another dwarf's stone.", next = "BACK" },
      },
    },
    xorig_deeps2 = {
      lines = {
        { id = "xod2_default", text = "Hah, that's a miner's answer, an' it's near enough what I'd say myself. The League sends me scholars who can read a tablet an' no' a wall, so if ye ever tire o' wanderin', there's a shovel here wi' yer name on it." },
      },
      choices = {
        { text = "I'll keep it in mind, Ironband.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "We're diggin' for the past, our past, what the old dwarves left in these hills before Ironforge was a single hall. Every shard's a page o' a book nobody's read." },
      },
      choices = {
        { text = "You must have found something by now.", next = "idols" },
        { text = "That's worth digging for.", next = "BACK", fx = { affinity = 2, learn = { "explorers_league" } } },
      },
    },
    idols = {
      big = true,
      lines = {
        { id = "id_default", text = "We found carved idols, a whole cache of 'em. Right after we lifted 'em, the troggs came up through the floor, an' the idols send 'em berserk, so I cannae call that coincidence." },
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
        { text = "Should the League stop digging, then?", next = "opn_dig" },
        { text = "Spoken like an honest dwarf.", next = "BACK", reply = "Thank ye, an' I'll try tae live up tae it. Puttin' right is harder than diggin' up, I've found.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Or leave them be and fill the hole.", next = "BACK", reply = "Fill the hole? An' leave the troggs tae wake up angry under someone else's town? No, it's ours tae fix.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    slow = {
      lines = {
        { id = "sl_default", text = "There's troggs in the trench, an' my blastpowder goes missin' between Thelsamar an' here. Jern sends it an' I never see it, so somebody does." },
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
          text = "It was a porter called Saean. Near a year he hauled for us, an' all that time he was sellin' us tae the Dark Irons, an' I keep turnin' it over." },
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
        { text = "Dig slower. The stone doesn't like being rushed.", next = "BACK", reply = "Slower, aye, an' maybe gentler. I'll tell the lads tae ease off the deep cut for a week.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Dig on. Ironforge needs what's down there.", next = "BACK", reply = "It does, an' so does the League. On we go, then, an' may the stone forgive us.", fx = { align = { order = 1 }, affinity = 2 } },
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
    background = { { id = "tp_bg", text = "I'm Darteus Ironband, prospector. I value results, an' I've had few lately, so I'm valuin' them very hard." } },
    advice = { { id = "tp_ad", text = "When the ground goes quiet, listen harder, for that's when the troggs are diggin'." } },
    explorers_league = { { id = "tp_league", text = "The League's the finest lot o' diggers, scholars an' madmen in the world. I'm in the middle category." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are diggin' too, down south in Uldaman. I'd dearly like tae know what they're after." } },
    troggs = { { id = "tp_troggs", text = "They're big an' mean, an' they go berserk near our idols. I'd like tae know why before they do.", next = "idols" } },
    uldaman = { { id = "tp_uldaman", text = "That's the big dig, down south. If my idols stir troggs, I shudder tae think what Uldaman stirs." } },
    _none = { { id = "tp_none", text = "That's no' my field. My field's six feet down." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol has the oldest dwarven stonework in Khaz Modan, an' I'd give my left hand tae dig it. The Dragonmaw would take my right, so I'm stayin' here." } },
    magni = { { id = "tp_magni", text = "King Magni's set on findin' where dwarves came from, an' bless him for it, because his gold pays my diggers. I'll find his answers, or at least a very interestin' rock." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer's old songs speak o' stone men an' makers, an' my digs keep turnin' up things that sound like the songs. I'm no' sayin' they're right; I'm sayin' I'm listenin'." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their city tae troggs that came up from below, an' my digs here turned up troggs too. I don't like what that says about what's under Khaz Modan." } },
  },
}

P:NPC {
  key = "hearthstove", id = TODO_NPC("Innkeeper Hearthstove"), name = "Innkeeper Hearthstove", gender = "male",
  bible = "bibles/thelsamar.md", role = "innkeeper", tier = "service",
  communities = { "thelsamar" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Hearthstove claims the Stoutlager pours the best ale between Ironforge and the Wetlands, and he'll fight anyone who disagrees once they've paid. I didn't disagree.",
    third = "{name} drank at the Stoutlager Inn in Thelsamar, where Innkeeper Hearthstove pours what he calls the best ale in Loch Modan.",
  },

  greetings = {
    { id = "o_alliance_burden", tags = { "news" }, when = { gossip = { topic = "alliance", stance = "burden" } },
      text = "The Magistrate's been tellin' anyone at the bar who'll listen ye think the Alliance bleeds us dry. The Mountaineers drink here too, mind, so I'd sit near the door if I were ye." },
    { id = "o_orcs_hate", tags = { "news" }, when = { gossip = { topic = "orcs", stance = "hate" } },
      text = "Young Kadrell says ye'd have put every orc in the camps tae the axe. His da's been buyin' rounds in yer name ever since, so drink up." },
    { id = "g_inn", text = "The Stoutlager welcomes ye! Sit down, have a pint an' tell us a tale, in that order." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "hearthstove_flirt_no" } }, cooldown = "2d",
      text = "Well now, the Stoutlager's brightened up! Sit by the bar, lass, where the light's best, an' I'll pretend I'm polishin' this mug." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "hearthstove_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "There's my favourite! I've told the miners that stool by the taps is spoken for, an' the first one tae sit on it gets shown the door." },
    { id = "g_flirt_no", when = { npcFlagBefore = "hearthstove_flirt_no" }, priority = 8, once = true,
      text = "Ale an' a bed an' nothin' fancy, lass, for I've learned my lesson. Well, I've learned half of it, an' the other half's comin'." },
    { id = "g_home", when = { homeInn = { "Thelsamar", "Stoutlager Inn" } }, text = "The Stoutlager missed ye! Yer bed's warm an' yer mug's clean, or clean enough, anyway." },
    { id = "g_away", when = { away = 14 }, text = "The Stoutlager's missed ye these {away}! Sit down, have a pint, an' then I'll want a tale fer every one o' those days." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, I'll be, {away} gone an' ye walk back in like ye'd stepped out fer air! Sit, sit, fer that tale'll need a good few pints." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody's been sayin' fine things about ye over my bar, an' I'll drink tae that! Well, I'll drink tae most things." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word round the tables is somebody swallowed a tale o' yours that wasnae quite true. Tall tales are welcome here, friend, but mind they stay on the right side o' fun." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Troggs, was it? Sit down, for Vidra's got sausages on, an' they'll mend what the troggs broke." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's the spirit, or several spirits, by the look o' ye! Sit down before the floor comes up tae meet ye." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A few o' the miners mutter, but they mutter about everythin', includin' the ale, an' they still drink it. The mountaineers like yer kind fine, for a shaman patched up one o' their lads on the north road an' he's told everyone. I'll serve ye the same as anybody, an' ye can tell the cask tae behave." } },
      choices = {
        { text = "Then I'll earn the miners' trust too, Hearthstove.", next = "BACK", reply = "Good, an' ye will, given time an' a few rounds. They warm tae anyone who sits through a mining story without yawnin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The miners can mutter. I'll drink where I like.", next = "BACK", reply = "Drink where ye like, an' pay what ye owe, an' we'll get along fine. The miners grumble at everybody the first week.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mountaineers off the trogg line, mostly, an' they drink like they fight, all at once an' wi' a lot o' noise. I don't mind, for they pay, an' the ones who come back from the Valley o' Kings have earned every drop." } },
      choices = {
        { text = "One ale, then back to the line.", next = "BACK", reply = "One ale, aye, an' back tae the line. The Captain would be proud o' ye.", fx = { align = { order = 1 } } },
        { text = "I'll drink the cellar dry, then go find a trogg.", next = "BACK", reply = "Ha! The cellar's deeper than ye think, friend. Go find yer trogg first, an' come back when ye're thirsty.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Vidra does, an' she's particular about it, for she'll take fresh boar from the hills an' turn her nose up at anythin' that's been dead too long. Bring her good meat an' she'll speak kindly o' ye, which is rarer than ye'd think." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Vidra does, an' she's particular about it, for she'll take fresh boar from the hills an' turn her nose up at anythin' that's been dead too long. An' keep yer {pet} out o' the kitchen, friend, for Vidra's chased off bigger beasts wi' a ladle." },
      },
      choices = {
        { text = "I'll bring her the freshest boar in the hills.", next = "BACK", reply = "Fresh, aye, an' she'll love ye for it. Ye'll smell her sausages from the bridge.", fx = { align = { honor = 1 } } },
        { text = "I'll bring what's easiest and let her sort it out.", next = "BACK", reply = "Easiest, eh? She'll throw it back at ye, an' I'll no' stop her. Fresh or nothin', for Vidra.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Chill my ale? Ye'll do no such thing! Dwarven ale's drunk cellar-cool an' no colder, an' any mage who freezes a cask o' Thelsamar's best will be payin' for the barrel." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome offerin' tae chill my ale, an' I suppose ye drank it half-frozen down in Gnomeregan wi' all yer fancy coolers. Here it's cellar-cool or nothin', so keep yer frost for the troggs." },
      },
      choices = {
        { text = "Your inn, your rules, Hearthstove.", next = "BACK", reply = "Thank ye, an' ye'll be welcome in it. The last mage in here froze my best cask solid tae show off.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good ale is whatever the drinker says it is.", next = "BACK", reply = "Whatever the drinker says? No' in my inn, friend. My ale comes up cold from the cellar, an' anyone who wants it warm can drink by the fire.", fx = { align = { order = -1 } } },
        { text = "Who drinks here, usually?", next = "regulars" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Private, is it? I've had mountaineers, miners an' the League's diggers up those stairs, an' none o' them ever needed quiet. Keep whatever ye do behind a shut door an' out o' Vidra's kitchen, an' we'll get along." },
      },
      choices = {
        { text = "It's study, nothing more. No harm will come of it.", next = "BACK", reply = "Study, is it? Then study quiet, an' dinnae set the curtains alight. That's all I ask.", fx = { align = { light = 1 } } },
        { text = "It's best you don't ask what I'm summoning.", next = "BACK", reply = "Then I'll no' ask, but I'll be listenin'. Keep it behind the door, an' keep the door shut.", fx = { align = { light = -1 } } },
        { text = "Who's the cook, then?", next = "vidra_ref" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The loch at dawn, when the mist sits on it an' the fish rise. The dam keeps the water deep, though the old folk say the valley looked different before it was built." } },
      choices = {
        { text = "The dam was worth building. Look at the town.", next = "BACK", reply = "It was, an' the town's grown for it. Thelsamar's no' a bad place, troggs an' all.", fx = { align = { order = 1 } } },
        { text = "Dams change the land. I'd like to see it old.", next = "BACK", reply = "So would I, some days. My granda swore the valley was all meadow before the water came, though I've only ever known the loch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Where else would they bring it? They sing about the dam an' the troggs an' the old days, an' when one o' their own doesnae come back, they sing his name an' I pour one for the empty stool." } },
      choices = {
        { text = "That's an honest kind of grieving. I'll sing with them.", next = "BACK", reply = "Ye'd sing wi' them? Then ye're welcome at my bar any night, an' I'll pull up a stool for ye by the hearth.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale doesn't heal grief, Hearthstove. It only hides it.", next = "BACK", reply = "It doesnae, aye, but it gets them through the night. I'll let the morning take care o' the rest.", fx = { align = { light = -1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once a week, regular as a mine bell, an' always over the same argument: whose clan dug the deepest. I let them go two rounds an' then I bring out the stool-leg, an' that's the end o' it." } },
      choices = {
        { text = "Two rounds is too many. Stop it before it starts.", next = "BACK", reply = "Too many, aye, an' I've thought so too. But they need the first round, an' I need the coin.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them settle it. A good brawl clears the air.", next = "BACK", reply = "It does, an' my chairs pay for it. Still, they're better friends after, so I let them.", fx = { align = { order = -1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
      },
    },
    dd_hs_dam = {
      lines = {
        { id = "dd_hs_dam1", text = "He did, an' he counted every copper of it twice. That dam holds back the whole loch, friend, an' if it went, the Stoutlager would be lodgin' fish by mornin', so the whole town drank tae ye whether ye were here or no'." },
      },
      choices = {
        { text = "The dam's safe. That's reward enough for me.", next = "BACK", reply = "Spoken like a Mountaineer, an' I'll tell Hinderweir ye said so. He'll go red tae the beard.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tell Hinderweir the next round should be mine to drink, not his.", next = "BACK", reply = "Ha! I'll tell him, an' I'll watch his face while I do it. That alone's worth the trouble.", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Ye've the same thirst on ye as {alt}, a {altclass} who drank my Stoutlager an' didnae complain once, which is rarer than ye'd think in Thelsamar. Sit, an' let's see if ye've the same good manners." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} was in again the other night, singin' about the dam wi' the miners like a local. If ye're kin, tell that one they've a voice like a rockslide, an' I mean it fondly." },
        { id = "h_default", text = "I'm Hearthstove, an' I keep the Stoutlager. It's the best ale between Ironforge an' the Wetlands, an' I'll fight anyone who says otherwise, after they've paid." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "hearthstove_flirt_no" } }, cooldown = "3d",
          text = "Ye've a fine braid on ye, or ye'd look fine in one, whichever it is. Ach, never mind me, for I've been sniffin' the casks again." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "hearthstove_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "Back at my bar, lass, an' I've polished this same mug since ye walked in. It's never been cleaner, an' I've never been more foolish." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two miners fought over the last stool last night an' broke it, so now neither of 'em has a stool. There's a lesson in that somewhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, an' the miners are singin' about the dam again. Every verse is the same verse, only louder." },
        { id = "h_brewer", when = { origin = "dwarf_brewer" },
          text = "Ye sniffed my taps before ye looked at me, an' only a brewer's bairn does that. Go on, then, tell me what's wrong wi' it, for yer family'll have told ye somethin' is." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at my inn! Loch Modan's a fair green place for dwarven country, an' I'd hope ye find a corner o' it that pleases ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want a strong ale an' a stronger stool, for the last warrior I served broke one o' each." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Vidra'll want a word wi' ye, for she's always short o' boar for her sausages." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'll pour ye somethin' gentle, an' if ye've a blessing for the cellar, I'll take that too." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at the Stoutlager! Ye'll no' be drinkin' much, I'd wager, but ye'll keep the peace better than my stool-leg." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman at the Stoutlager! Ye'll tell me if the cellar's happy, for my best cask went sour last week, an' I'll no' blame the brewer." },
        { id = "dd_rats", when = { questDone = TODO_QUEST("Rat Catching") },
          text = "Kadrell's been tellin' the whole bar ye brought him a sack o' kobold ears, an' he tells it louder every pint. I'd sooner not hear about ears while folk are eatin', but well done all the same." },
        { id = "dd_dam", tags = { "news" }, when = { questDone = TODO_QUEST("A Dark Threat Looms") },
          text = "Hinderweir came in last night an' bought a round for the house, which he's never done in his life. He says ye kept the Dark Irons from blowin' his dam, an' I believe him, for he was smilin'." },
      },
      again = {
        { id = "h_again", text = "Another? Sit, sit, there's room." },
        { id = "h_again2", text = "What else? Tell me a tale an' I'll pour." },
      },
      choices = {
        { text = "Hinderweir really bought a round?", next = "dd_hs_dam", when = { questDone = TODO_QUEST("A Dark Threat Looms") } },
        { text = "What do you love most about Loch Modan?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "You must see all sorts at this bar.", next = "regulars" },
        { text = "What do the miners sing about?", next = "song" },
        { text = "I used to run casks across the loch, quiet-like.", next = "k_smuggle", when = { class = "ROGUE" } },
        { text = "I could chill your ale for you, if you like.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll need a quiet room. Some of my work is private.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many warriors drink at the Stoutlager, Hearthstove?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does your kitchen buy what hunters bring in?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the mountaineers bring their grief here, Hearthstove?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess brawls break out here often enough, Hearthstove.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do folk in Thelsamar mind a shaman at the Stoutlager?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My family brews. I came to see where the barrels end up.", next = "xorig_brew", when = { origin = "dwarf_brewer" } },
        { text = "You're in a cheerful mood tonight, Hearthstove.", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "hearthstove_flirt_no" } } },
        { text = "Just a pint.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "That's on account o' the company, lass. I'll tell ye straight, as a dwarf should: ye're the best thing tae walk through that door since the spring cask, an' I was very fond o' that cask." },
        { id = "fl_again", when = { npcFlagBefore = "hearthstove_flirt_yes" }, priority = 5,
          text = "Same reason as last time, lass, an' she's sittin' on my best stool. Vidra says I'm too old tae grin like this, but Vidra cannae see what I see." },
      },
      choices = {
        { text = "Then pour me a pint, and keep the grin.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hearthstove_flirt_yes" }, clear = { "hearthstove_flirt_no" } } } },
        { text = "Compare me to a cask again and I'll sit on your bar.", next = "flirt_yes", when = { race = "Dwarf" },
          reply = "Ha! Now there's a lass who knows how tae talk tae a dwarf, an' I'll mind my bar.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hearthstove_flirt_yes" }, clear = { "hearthstove_flirt_no" } } } },
        { text = "You'd need to stoop a long way to court me, Hearthstove.", next = "flirt_yes", when = { race = "Gnome" },
          reply = "Ach, I've bent lower than that for a dropped copper, lass, an' ye're worth a good deal more.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hearthstove_flirt_yes" }, clear = { "hearthstove_flirt_no" } } } },
        { text = "You're a dear, Hearthstove, but I only want the ale.", next = "BACK",
          reply = "An' the ale ye'll have, lass, wi' no more o' my blether on top. I had tae try, though.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "hearthstove_flirt_no" }, clear = { "hearthstove_flirt_yes" } } } },
        { text = "Mind your manners, innkeeper.", next = "BACK",
          reply = "Aye, aye, they're minded, an' put back on the shelf where they belong. No harm meant, lass.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "hearthstove_flirt_no" }, clear = { "hearthstove_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "That I will, an' I'll pour it slow so it takes me longer. Ye're welcome at my bar any night, lass, an' I'll fight anyone who says otherwise, after they've paid." } },
      choices = {
        { text = "Slow pours suit me fine, Hearthstove.", next = "BACK",
          reply = "Then sit, an' I'll be here grinnin' like a fool an' polishin' the same mug." },
      },
    },
    xorig_brew = {
      lines = {
        { id = "xob_default", text = "Well, a good many of 'em end up here, an' the rest end up in a miner's belly halfway up the north road. It's a sorry thing for a brewer tae see, though, because by the time a barrel crosses the loch, it's been jolted, warmed an' cursed at, an' it tastes o' all three." },
      },
      choices = {
        { text = "That's the road's fault, not the brew's.", next = "xorig_brew2", fx = { affinity = 1 } },
        { text = "Then I'll tell my family to pack them better.", next = "xorig_brew2", fx = { trait = { witty = 1 } } },
        { text = "Is that why the miners sing so loud?", next = "song" },
      },
    },
    xorig_brew2 = {
      lines = {
        { id = "xob2_default", text = "Ye've a brewer's loyalty, I'll give ye that! The Stoutlager's a fine place tae watch where the barrels go, an' I'll wager ye find the end o' the road's no' half as grand as the start." },
      },
      choices = {
        { text = "I'll find out for myself.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Hearthstove.", next = "BACK" },
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
        { id = "vr_default", text = "Vidra runs my kitchen. Don't go in, an' don't ask what's in the sausage, but do eat it." },
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
        { id = "xsm_default", text = "Did ye now? Then keep yer voice down, for a fair few casks in my cellar came across that loch the same way, an' the Mountaineers drink here too. I'll pour ye one, an' we'll speak o' the weather." },
        { id = "xsm_loch", when = { origin = "dwarf_loch_smuggler" },
          text = "I know yer face, though I'll swear I don't if anyone asks. Ye brought me six casks o' Wetlands rum one winter, an' Kadrell's never worked out where my rum comes from." },
      },
      choices = {
        { text = "Our secret, Hearthstove.", next = "BACK", reply = "Our secret, aye, an' we'll keep it that way. Have a drink on me, for yer silence.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I've gone straight. You should too.", next = "BACK", reply = "Straight, is it? Good for ye, an' maybe someday. But the casks come cheaper this way, an' the Mountaineers dinnae ask where they came from.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Thelsamar drinks at the Stoutlager, an' every one o' them talks after the second mug. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I keep the Stoutlager, an' before that I drank in it. It was a short step." } },
    advice = { { id = "tp_ad", text = "Sit wi' yer back tae the wall an' yer face tae the fire, an' ye'll see everyone an' stay warm besides." } },
    stonewrought_dam = { { id = "tp_dam", text = "Ask the miners, for they've a song about the dam. Just don't ask them tae sing it.", next = "song" } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Buy a round an' ask the whole inn; ye'll get six answers." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I've heard the Darkmoon Faire's ale is weak, an' I've told everyone who'll listen. Nobody's come from the Faire tae argue, so I must be right." } },
    wildhammer = { { id = "tp_wildhammer", text = "Wildhammer riders drink here when they pass through, an' they drink as if the barrels had insulted them. I keep the tab honest, which is more than they do." } },
    magni = { { id = "tp_magni", text = "There's a toast tae King Magni every night at the Stoutlager, an' I've never once had tae start it. That's the kind o' king he is." } },
    scourge = { { id = "tp_scourge", text = "A refugee from Lordaeron stopped here once on his way tae Ironforge, an' he wouldnae sit near the fire. Said he'd seen too many villages burnin', so I gave him the corner table an' left him be." } },
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
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' ye come back tae my kitchen empty-handed, I'll wager. Well, sit, since ye're here." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear ye've been bein' pleasant tae folk in town. Pleasant's all very well, but have ye brought me anythin' tae cook?" },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk say ye've been helpin' about Thelsamar. Good, then ye'll no' mind helpin' me in the kitchen next." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then ye'll want my sausage recipe, an' ye can't have it, but ye'll want it all the same." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd no' be surprised! My old stove spits at me every mornin', an' my mam always said a fire needs a kind word an' a dry log. If ye can give it the kind word, I'll supply the log, an' we'll see whose sausages come out best." } },
      choices = {
        { text = "A kind word to the fire costs nothing. Here's mine.", next = "BACK", reply = "Bless ye, an' I'll tell the stove ye were kind. Maybe it'll stop spittin' at me for a day.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The fire needs dry logs, not kind words, Vidra.", next = "BACK", reply = "Dry logs, aye, an' ye're no' wrong. But my mam said a kind word, so I'll keep sayin' it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bear meat, boar guts, spider ichor an' a secret I'll no' tell even a warlock, though ye might be the only customer who'd no' be put off by the list. Bring me the makin's, an' the whole town eats well for a week." } },
      choices = {
        { text = "I'll fetch the makings for the town, Vidra.", next = "BACK", reply = "Bless ye, love, the whole town will thank ye. Bring it fresh, an' I'll make ye the first link.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep your sausages. I've lost my appetite.", next = "BACK", reply = "Lost it? Ye'll find it again the first time ye smell them fryin'. Everyone does.", fx = { align = { honor = -1 } } },
        { text = "Something else, Vidra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bear meat, boar guts, a dash o' spider ichor an' a secret I'll take tae my grave. Ye needn't look so pale, for I waste no part o' any beast I'm given." } },
      choices = {
        { text = "Wasting nothing honors the beast. I respect that.", next = "BACK", reply = "It does, an' I'm glad ye see it. Every bit o' the beast goes tae good use in my kitchen.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some creatures deserve better than a sausage, Vidra.", next = "BACK", reply = "Better? There's nothin' better than one o' my sausages, love. Ye'll change yer mind when ye taste them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More, an' faster, an' they never say thank ye till the plate's clean. Still, a warrior who's been fightin' troggs all day deserves a proper meal, so sit down an' I'll see what's left in the pot." } },
      choices = {
        { text = "I'll say my thanks first and eat second.", next = "BACK", reply = "Thanks first, aye, an' ye're the first warrior who's ever said so. I'll put an extra on yer plate.", fx = { align = { honor = 1 } } },
        { text = "I'll eat first. Thanks can wait for an empty plate.", next = "BACK", reply = "Ha! Like all the rest o' them, then. Eat up, an' I'll be waitin' for that thank ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Lift? It's no' stealin' if it's off a beast, love, it's huntin'. Bring me what I'm after from the hills, an' I'll no' ask where ye were standin' when ye got it." },
      },
      choices = {
        { text = "I'll bring every bit of it, and skim none.", next = "BACK", reply = "Honestly, aye, an' I'll no' ask any more questions. Bring it fresh.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring it, and maybe a cask from the cellar too.", next = "BACK", reply = "A cask from the cellar, is it? Hearthstove would have both our heads. Just the makings, love, an' leave his cellar alone.", fx = { align = { honor = -1 } } },
        { text = "What's in your sausages, anyway?", next = "what" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ye could, an' a gnome tried it once, an' the kitchen smelt o' burnt hair for a fortnight. Sausage wants a slow fire an' patience, an' no amount o' magic will hurry it." },
      },
      choices = {
        { text = "Then I'll leave the cooking to the cook.", next = "BACK", reply = "Good, for the kitchen's still recoverin' from the gnome. Sit down, an' I'll bring ye a plate.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hand me the pan. I'll get it right this time.", next = "BACK", reply = "This time? There's no' goin' tae be a this time, no' in my kitchen. Hands off the pan, love.", fx = { align = { order = -1 } } },
        { text = "Who eats your sausages, then?", next = "who" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every week, an' they get the good sausages, no' the burnt ones, for grief's hungry work. I dinnae make a fuss of it, an' I'll thank ye no' tae either." } },
      choices = {
        { text = "I won't say a word. That's real goodness, Vidra.", next = "BACK", reply = "Thank ye, an' that's all I ask. The widows dinnae want thanks, only a full plate an' nobody talkin' about it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity's well enough, but you can't feed everyone.", next = "BACK", reply = "No, but I can feed these ones, an' that's enough for me. Ye'd do the same if ye saw their faces.", fx = { align = { light = -1 } } },
        { text = "Something else, Vidra.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe as anywhere wi' troggs in the hills an' a spy in the bushes, which is tae say no' very. But I've a cleaver an' a temper, an' I'd like tae see a trogg get past either one." } },
      choices = {
        { text = "You'll not need either. I'll keep them from your door.", next = "BACK", reply = "Bless ye, love, an' I'll save ye a link for every trogg ye stop. My cleaver can rest, then.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then you'll manage on your own, Vidra.", next = "BACK", reply = "I will, an' I'll enjoy it, too. The first trogg through my door gets the cleaver.", fx = { align = { honor = -1 } } },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in my kitchen! Ye'll no' be wantin' tae bless the sausages, will ye? Folk might start sayin' they're magic, an' then I'd have tae charge more." },
        { id = "dd_choksul", when = { questDone = TODO_QUEST("WANTED: Chok'sul") },
          text = "Somebody brought down that ogre Chok'sul, an' I hear it was you. He took two o' my best hams off a cart last spring, so I'll call that justice served, an' wi' mustard." },
      },
      again = {
        { id = "h_again", text = "What is it now? I have a pot on the fire, so be quick." },
        { id = "h_again2", text = "Ask quick, for sausages burn." },
      },
      choices = {
        { text = "Those sausages smell like nothing I've eaten before.", next = "what" },
        { text = "Who eats them all?", next = "who" },
        { text = "Can I help?", next = "help" },
        { text = "I cook too. Care to trade secrets?", next = "cook", when = { profession = "Cooking" } },
        { text = "I could hunt the boar for your sausages.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "I could lift a few ingredients from the hills for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could I warm the sausages for you? It'd save the coal.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors really eat as much as they say, Vidra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you feed the families who've lost their providers, Vidra.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is Thelsamar safe enough for your kitchen, Vidra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What goes into a Thelsamar blood sausage, Vidra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What goes into a Thelsamar blood sausage, Vidra?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think the fire cooks better for a shaman, Vidra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll pass on the details.", next = "END", fx = { affinity = 1 } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Bear meat, boar guts for the casings, an' a dash o' spider ichor for spice. Don't make that face; ye've eaten worse an' liked it less." },
      },
      choices = {
        { text = "Spider ichor sounds a strange sort of spice.", next = "what_ichor" },
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
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells sausages on sticks, I'm told, an' they're no' a patch on mine. I'd like tae go an' prove it." } },
    magni = { { id = "tp_magni", text = "King Magni's a famous eater, an' I've heard he likes his sausages spiced. If he ever comes tae Thelsamar, I'll have a pot on." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor told me they put fish in their sausages down in Booty Bay. I've never been so offended in my life." } },
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
    { id = "g_ease", text = "At ease, {g:lad|lass}. Ceremony can wait until the troggs do, and they never do." },
    { id = "g_away", when = { away = 14 }, text = "At ease, and welcome back after {away} away. The troggs kept the same hours while ye were gone, so nothing's changed on this hill but the depth of my trenches." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been away {away}, and you've come back with the bearing of a seasoned fighter. I'll forgo the ceremony, but consider yourself saluted." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "A report reached me that someone in Thelsamar caught you in a falsehood. I run this post on honest reports, so see that yours stay that way." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I'm told you've been of service to the town these past days. Well done, and I mean that formally." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighting sort, good. The King's lands need defenders more than they need visitors, and the stone here has had its fill of visitors." },
  },

  start = "hello",
  nodes = {
    opn_wildhammer = {
      lines = {
        { id = "opn_wildhammer_q", text = "Officially, Captain Rugelfuss has no opinion on the Wildhammer clan, who are allies of the throne. Unofficially, the captain notes they fly about on gryphons with their beards in braids and never once filled a garrison roster. What does the traveller think?" },
      },
      choices = {
        { text = "They fought the Horde at Grim Batol. That's worth respect.", next = "opn_wildhammer_r_respect", fx = { affinity = -1, align = { order = -1 }, opinion = { wildhammer = "respect" } } },
        { text = "Undisciplined and proud of it. Ironforge is better off.", next = "opn_wildhammer_r_distrust", fx = { affinity = 1, align = { order = 1 }, opinion = { wildhammer = "distrust" } } },
        { text = "Brothers who fell out. Both statues still face the same pass.", next = "opn_wildhammer_r_kin", fx = { trait = { kind = 1 }, opinion = { wildhammer = "kin" } } },
        { text = "The Wildhammer are my clan, Captain. Mind your roster.", next = "opn_wildhammer_r_proud", when = { race = "Dwarf", origin = "dwarf_wildhammer_kin" }, fx = { affinity = -1, opinion = { wildhammer = "proud" } } },
        { text = "I couldn't say, Captain.", next = "BACK" },
      },
    },
    opn_wildhammer_r = {
      lines = {
        { id = "opn_wildhammer_r_default", text = "A careful answer. You'd make a fine captain, which I mean as a warning." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_wildhammer_r_respect = {
      lines = {
        { id = "opn_wildhammer_r_respect", text = "Grim Batol was a long time ago and a long way from the Valley of Kings. The captain will grant it was well fought, and note that it is not on his roster." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_wildhammer_r_distrust = {
      lines = {
        { id = "opn_wildhammer_r_distrust", text = "The captain could not possibly agree with you in uniform. He will, however, buy you a drink at the Stoutlager when he is out of it." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_wildhammer_r_kin = {
      lines = {
        { id = "opn_wildhammer_r_kin", text = "They do, don't they? I'd never thought of it that way. Madoran and Khardros, looking south together, and neither one of them willing to turn his head." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    opn_wildhammer_r_proud = {
      lines = {
        { id = "opn_wildhammer_r_proud", text = "The captain meant no offence to any clan of the Alliance, and he will mind his roster. He would mind it better still if a few of your cousins were on it." },
      },
      choices = {
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they come in time, they could save lives. My soldiers say the ground hums before a trogg rush, and I've ordered them to stop saying it because it frightens the new recruits. If you tell me the hum means something, I'll stop ordering them and start listening." } },
      choices = {
        { text = "Keep order in the ranks. I'll do the listening for you.", next = "BACK", reply = "Will you? Then my soldiers can stop whispering about humming, and you can tell me when it starts. That suits me well.", fx = { align = { order = 1 } } },
        { text = "Let your soldiers listen. Orders won't hear the troggs coming.", next = "BACK", reply = "You may be right, and it galls me to say so. I'll let them listen, so long as they keep their shields up while they do it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the Valley o' Kings, among the old statues, where the troggs come up out o' the ground in packs. Freeze a pack an' my mountaineers can do the rest, an' between us we might keep them off the road for a week." } },
      choices = {
        { text = "I'll go where you send me, Captain.", next = "BACK", reply = "Good, then I'll send you to the western statues, where the packs are thickest. My mountaineers will be glad of you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose my own ground, Captain.", next = "BACK", reply = "Your own ground, is it? Then choose it well, and don't come crying to me when the troggs choose it for you.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With a shield wall at the cave mouths and Bronzebeard stubbornness, for the troggs have no discipline but there's no end to them. Hold a line for me and you'll learn more about war here than in any yard in Ironforge." } },
      choices = {
        { text = "I'll take my place in the shield wall.", next = "BACK", reply = "Then you'll fit in here, and the lads will be glad to have another shoulder beside them. Hold firm, and we'll hold the valley.", fx = { align = { order = 1 } } },
        { text = "I'll go into the caves and end them at the source.", next = "BACK", reply = "Into the caves? That's where good soldiers go to die, and I've lost enough of them. Go if you must, but go knowing it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Do that and I'll owe you a debt, for every new tunnel we find is one less surprise in the night. Watch the bears on the high ground as you go, mind, for they're hungrier than the troggs and twice as quick." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Do that and I'll owe you a debt, for every new tunnel we find is one less surprise in the night. Your {pet} will smell them before you see them, which is more than my sentries manage." },
      },
      choices = {
        { text = "I'll scout and report back before I strike.", next = "BACK", reply = "That's sensible, and I'll thank you for it. Report to me first, and then we'll decide together.", fx = { align = { order = 1 } } },
        { text = "If I find their hole, I'll clear it myself.", next = "BACK", reply = "Clear it yourself? You've more courage than sense, but I'll not stop you. Tell me where you went, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Behind them? There's no behind, for they come up out o' the ground wherever they please. But if ye can find the holes they're usin' near the statues an' stay alive doin' it, I'll take the report gladly." },
      },
      choices = {
        { text = "I'll find the holes and mark them for your men.", next = "BACK", reply = "Mark them, and my men will do the rest. That's worth more to me than a stack of dead troggs.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find them, and their leader won't see morning.", next = "BACK", reply = "Their leader? If they have one, I'd like him gone too, and I'll ask no questions about how. Just come back.", fx = { align = { honor = -1 } } },
        { text = "What's this about the statues?", next = "statues" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Demons, in the Valley o' Kings, under the faces o' the old kings themselves? I'll take every blade I can get, but if one o' yer imps goes near those statues, I'll put an axe in it before I ask whose it is." },
      },
      choices = {
        { text = "Understood. I'll keep it leashed and away from the kings.", next = "BACK", reply = "Thank you, that's all I ask. The kings deserve better than a demon picking at their beards.", fx = { align = { light = 1 } } },
        { text = "Your statues will keep. The troggs won't.", next = "BACK", reply = "They'll keep, will they? Those statues have stood for longer than you've lived, and I'll see they stand longer still.", fx = { align = { light = -1 } } },
        { text = "Who leads the troggs?", next = "leader" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Tell 'em tae stay off the roads an' out o' the farmer's fields. If they'll do that, my mountaineers will gladly leave 'em be." } },
      choices = {
        { text = "That's fair. I'll keep the peace between you.", next = "BACK", reply = "That's fair, aye, an' I'd be glad o' it. If the beasts keep tae the hills, my lads will keep tae the roads.", fx = { align = { order = 1 } } },
        { text = "The beasts were here first, Captain.", next = "BACK", reply = "Maybe so, but my farmers are here now, an' they need feedin'. I'll leave the beasts be if they leave us be.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Poorly, if you want the truth, though they'd never say so. They sleep in shifts beneath the statues, and some of them talk to the old kings at night, which I allow, because the kings don't answer back." } },
      choices = {
        { text = "Let me sit with them. Weary souls need tending too.", next = "BACK", reply = "They would thank you, though they'd never say it. Go and sit with them tonight, under the statues, and let them talk if they want to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers must be hard. Comfort only makes them soft.", next = "BACK", reply = "Hard, yes, but not brittle. You'd know the difference if you'd seen a soldier break.", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They climb them, scratch at them and nest at their feet, and I don't think they know what they are. Ignorance is no excuse in my book, but I've stopped expecting troggs to read." } },
      choices = {
        { text = "Then I'll clear every trogg from the kings' feet.", next = "BACK", reply = "Clear them, and I'll see the statues scrubbed of trogg filth by the end of the week. The kings of Ironforge shouldn't have vermin at their feet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Statues are only stone, Captain. Spend your soldiers elsewhere.", next = "BACK", reply = "Only stone? Those are the kings of Khaz Modan, and I'll spend what I must to keep them clean.", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    dd_rg_deaths = {
      lines = {
        { id = "dd_rg_deaths1", text = "Then ye're still standin', which is the whole o' the lesson. I lost eleven good dwarves on these slopes the year the troggs came up, an' not one o' them got tae try again, so whatever brings ye back, thank it, an' then stop needin' it." },
      },
      choices = {
        { text = "Your dwarves deserved that chance. I'll learn caution.", next = "BACK", reply = "Good. Caution's no' cowardice, whatever the young ones say over their ale.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If something brings me back, why bother being careful?", next = "BACK", reply = "Because one day it won't, an' ye'll no' get a warnin' first. Mind that, {class}.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Captain Rugelfuss, holding the Valley of Kings for Ironforge and King Magni. The troggs rise from under the hills faster than we can put them down, like water through a cracked seam." },
        { id = "h_trogg", tags = { "news" }, when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "The troggs have dug in close. Thin them out and bring me proof, for I want the King to read numbers, not complaints." },
        { id = "h_lands", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "These are the King's lands, and the King's statues watch over them. I'll not have troggs nesting at their feet." },
        { id = "h_count", when = { metBefore = true }, text = "We put down eleven troggs yesterday, and twelve more came up where they fell. I've stopped counting and started digging trenches, which at least is honest dwarven work." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "A Mountaineer of Dun Morogh, good. You'll know what a short-handed post looks like, and this is one." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, good, it's you. The regiment's glad of you on these hills, and the captain is too, though he'll only say so the once." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, is it? I've a district full o' bears, boars an' angry wolves, an' I'll take any help that can speak tae them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good; I've been holding this valley with tired soldiers and blunt axes, and a fresh arm is the best news I've had all week." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I could use one; the troggs come out of holes I didn't know were there, and somebody has to find them first." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I have soldiers who have fought the troggs too long, and it's not only their bodies that need mending." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The King's statues have seen your order before, and they'd be glad to see it again." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! The troggs come up from under the hills faster than we can put them down, an' I'd take a hundred o' yer kind if Ironforge would send them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Stonesplinter", min = 40 } }, text = "My mountaineers say the Stonesplinter packs in the valley are thinner than they've been all year, an' they say yer name when they say it. Ironforge should hear o' that, an' I'll see it does." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've held this valley against troggs for months, and if you can feel them coming through the stone, you're worth ten of my tired soldiers." },
        { id = "dd_rats", when = { questDone = TODO_QUEST("Rat Catching") },
          text = "Kadrell tells me ye cleared his tunnel rats out o' the foothills. Good, for every kobold ye kill down there is one less diggin' intae my valley from the west." },
        { id = "dd_deaths", when = { deaths = { min = 10 } },
          text = "Ye've the look o' someone who's been carried back from the hills more than once. There's no shame in it, but a soldier learns somethin' every time he's laid out, or he doesnae last." },
      },
      again = {
        { id = "h_again", text = "Is there anything further? Speak it, an' I'll hear it." },
        { id = "h_again2", text = "Speak plainly, if ye would; I prefer it, as any dwarf o' the regiment does." },
      },
      choices = {
        { text = "I've died more times than I'd like, Captain.", next = "dd_rg_deaths", when = { deaths = { min = 10 } } },
        { text = "What would you have me tell the beasts?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Your soldiers seem thin on the ground, Captain.", next = "reserve" },
        { text = "Who leads the troggs?", next = "leader" },
        { text = "Tell me about the statues.", next = "statues" },
        { text = "What proof do you want of the troggs?", next = "teeth" },
        { text = "I stood the high passes too, Captain.", next = "mountaineer", when = { origin = "dwarf_mountaineer" } },
        { text = "How do you hold the Valley against so many troggs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Shall I track the troggs back to their holes, Captain?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll help defend the King's lands.", next = "END", reply = "Good, then go with the regiment's thanks, and come back when you've earned your stripes in the valley.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Put me on your line, Captain.", next = "k_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I can get behind the trogg lines for you, Captain.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Troggs fear fire. My demons could help hold the Valley.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do your soldiers bear the endless fighting, Captain?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The troggs seem to have no respect for the statues, Captain.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where could a mage do the most good, Captain?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could a shaman's warnings help hold the Valley, Captain?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The King's statues can guard themselves, Captain.", next = "END", reply = "Can they? Then you'll find me here, beneath them, doing the guarding they cannot. Off you go.", fx = { align = { order = -1 } } },
      },
    },
    reserve = {
      lines = {
        { id = "rs_default", text = "The Ironforge Reserve has been called up to the Alliance front, and my regiment holds the gate here and cannot leave it. So the hills go unwatched." },
      },
      choices = {
        { text = "Then I'll watch them for you.", next = "BACK", reply = "Will you? Then you're worth more to me than half a regiment. Start in the eastern hills, where the fires were last seen.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Ironforge ought to bring its soldiers home.", next = "BACK", reply = "They should, and I've written to say so. Ironforge doesn't answer letters quickly, I'm afraid.", fx = { align = { order = -1 } } },
        { text = "Is the front worth it?", next = "reserve_worth" },
      },
    },
    reserve_worth = {
      lines = {
        { id = "rw_default", text = "The King says it is, and I'm a captain. I say 'Aye, my king,' and I count troggs." },
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
        { id = "l2_default", text = "Then we kill the next one, for troggs have more chieftains than sense, and less sense than a stone." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    statues = {
      lines = {
        { id = "su_default", text = "Those are Madoran Bronzebeard and Khardros Wildhammer, raised by their sons to watch the pass south, where the land still burns. They stand as a warning to the Dark Iron." },
      },
      choices = {
        { text = "The Wildhammer left Ironforge. What do you make of them?", next = "opn_wildhammer" },
        { text = "Do the Dark Iron heed it?", next = "statues2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    statues2 = {
      lines = {
        { id = "s2_default", text = "A Dark Iron spy came sniffing round the dam this season, didn't he? So no, they don't, but the statues don't mind, for they're patient, and I try to be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    teeth = {
      lines = {
        { id = "te_default", text = "Their teeth, for proof. Eight teeth is eight troggs, while eight complaints is a captain who ought to be replaced." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mountaineer = {
      lines = {
        { id = "mo_default", text = "Then stand a watch with my regiment some night. You'll find the troggs keep worse hours than the Frostmane." },
      },
      choices = {
        { text = "Gladly, Captain.", next = "BACK", reply = "Glad to hear it, and glad to have you. Report at dusk, and bring a warm cloak, because the wind off the pass bites.", fx = { affinity = 2, align = { order = 1 }, standing = { thelsamar = 1 } } },
        { text = "I'm done standing watches, so I'll hunt troggs my own way.", next = "BACK", reply = "Your own way, is it? Then I hope it's a good way, and that you come back from it. I've a wall of names here from men who did things their own way.", fx = { align = { order = -1 } } },
      },
    },
    reserve_off = {
      lines = {
        { id = "ro_default", text = "Off duty, the captain thinks Ironforge has sent its best to guard other people's kingdoms while its own valleys fill with troggs. He also thinks the King knows it, and that's why Magni looks so tired at council." },
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
        { text = "Understood, Captain.", next = "BACK" },
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
        { text = "I'll hold where you put me, Captain.", next = "BACK", reply = "That's what I need, and I'll put you where it counts. Hold there, and the line holds with you.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "I'll go where the troggs are thickest.", next = "BACK", reply = "Thickest, eh? Then you'll be in the thick of it soon enough. Just don't break my line on your way there.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Who leads them?", next = "leader" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The regiment's book records most of what happens in these hills, and I've read every page. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm the King's captain in the Valley of Kings. My history is the regiment's history, an' the regiment keeps a book, bound in ram's hide and older than my beard." } },
    advice = { { id = "tp_ad", text = "Bring proof, always. Nobody argues with a sack of teeth." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs here are the same as Gnomeregan's, or their cousins. They came up under the gnomes, and now they're coming up under us." } },
    troggs = { { id = "tp_troggs", text = "They're Stonesplinter, tunneling up from every crevice in the loch's hills.", next = "leader" } },
    _none = { { id = "tp_none", text = "That's not my post, I'm afraid. Ask in Thelsamar, at the Stoutlager, where every dwarf in the loch has an opinion." } },
    magni = { { id = "tp_magni", text = "The regiment serves King Magni, and the regiment's book records every order he has sent us. There are fewer pages than I'd like, but each one is in his own hand." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons have a chapter in the regiment's book that goes back to the War of the Three Hammers. We're still writing it." } },
    second_war = { { id = "tp_second_war", text = "The regiment's book has a whole volume on the Second War, when the Horde marched through Khaz Modan. Every name in it fought, and too many of them died in this valley." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer appear in our book as allies, which surprises the young soldiers. A dwarf is a dwarf when there's an orc in front of him." } },
  },
}

P:NPC {
  key = "hinderweir", id = TODO_NPC("Chief Engineer Hinderweir VII"), name = "Chief Engineer Hinderweir VII",
  bible = "bibles/thelsamar.md", role = "worker", tier = "quest",
  communities = { "thelsamar" }, temper = { "anxious" }, values = { "proud", "careful" },
  notices = { "craft" },

  impression = {
    first = "Chief Engineer Hinderweir VII begged me to hold the rail on a walkway he swore was perfectly safe. He has six forebears glaring down from their portraits and one great dam dripping on his head.",
    third = "{name} met Chief Engineer Hinderweir VII, seventh of his name to tend the Stonewrought Dam in Loch Modan.",
  },

  greetings = {
    { id = "g_dam", text = "Careful on the walkway, {g:lad|lass}! It's perfectly safe, mostly safe, engineered to be safe, but please hold the rail." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you're back after {away}! The dam held the whole time, of course it held, it was engineered to hold." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown rather sturdy since your last visit. Do be gentle on the walkway, though, because it's rated for sturdy, but only just." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody in Thelsamar has been speaking well of you! It's nice to hear good news, because I usually only hear about cracks." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Come and look at these stress readings. No? Well, not everyone loves a stress reading, and that's their loss." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I don't know, and that's what frightens me. The dam's stood for generations, but every engineer of my line has listened to the stone at night and sworn it was straining. If the water's pushing, I'd like to know before the Dark Irons give it a push of their own." } },
      choices = {
        { text = "The dam is good dwarven work. We'll keep it strong.", next = "BACK", reply = "Strong, yes, and I'll keep checking every stone. I'm glad someone believes in her as much as I do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe the water wants its valley back, Engineer.", next = "BACK", reply = "Don't say that, not even in jest. Seven generations of my family have kept the water where it belongs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I fear it every morning and most nights, for they've been seen in the hills, and one keg of their powder in the wrong place would empty the loch into the Wetlands. My forebears built it to stand for ever, but I've no wish to test that with a battle on top of it." } },
      choices = {
        { text = "I'll stand watch at the gates and stay there.", next = "BACK", reply = "Thank you, truly. I've had three guards go wandering after troggs this month, and the dam doesn't guard itself.", fx = { align = { order = 1 } } },
        { text = "Better to hunt them in the hills than wait for them.", next = "BACK", reply = "Hunt them, by all means, but someone must stay at the gates. I'll not leave her unguarded.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dark Irons, mostly, creeping about with their powder kegs, though the mountain bears give my guards a fright now and then. If you see a track that isn't a bear's or a dwarf's, please, please tell someone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dark Irons, mostly, creeping about with their powder kegs, though the mountain bears give my guards a fright now and then. And your {pet} would hear a fuse hiss long before any of us would, I'm sure of it, so do keep it near the walkways." },
      },
      choices = {
        { text = "I'll report every track I find, Engineer.", next = "BACK", reply = "Every track, yes, please, and I'll have them on my desk by nightfall. You're a godsend.", fx = { align = { order = 1 } } },
        { text = "If I find Dark Irons, I'll deal with them myself.", next = "BACK", reply = "Deal with them, and then tell me, so I can stop worrying for one night. Just don't leave the bodies near the dam.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "That is precisely what keeps me awake at night, and I thank you for saying it aloud! If you can slip past my guards, so can a Dark Iron with a keg of blasting powder, so tell me where you'd go in and I'll put a dwarf there." },
      },
      choices = {
        { text = "I'll show you every gap and tell no one else.", next = "BACK", reply = "Thank you, and keep it that way. I'll have every gap filled by next week.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll show you, but knowledge like that isn't free.", next = "BACK", reply = "Not free? Of course not, nothing's free in Khaz Modan. I'll pay what I can, and gladly.", fx = { align = { honor = -1 } } },
        { text = "Your guards seem to have gone missing.", next = "guards" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I don't doubt it, and I won't ask what else answers to you. The Dark Irons called up something under Blackrock that's been burning ever since, so I keep a wary eye on anyone who calls things up." },
      },
      choices = {
        { text = "Fair. I'll stand guard here like anyone else.", next = "BACK", reply = "Good, that's all I ask. I'll sleep easier with you here and your friends somewhere else.", fx = { align = { light = 1 } } },
        { text = "Fire's fire, Engineer. Use it or lose your dam.", next = "BACK", reply = "Use it? And risk her cracking from the heat? No, I'll stand by the old ways, same as the six Hinderweirs before me.", fx = { align = { light = -1 } } },
        { text = "How could they bring the dam down?", next = "threat_how" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It holds back a loch's worth o' water an' keeps the valley from floodin'. Some'd call that harm, but I'd call it a gift tae every farm below it." } },
      choices = {
        { text = "Taming water is wise, not harmful.", next = "BACK", reply = "Thank ye, that's how I see it too. Ask the farmers below whether they'd like the loch back on their fields.", fx = { align = { order = 1 } } },
        { text = "Rivers deserve to run free, Chief Engineer.", next = "BACK", reply = "Free? Then free tae drown every farm in the valley. I'll keep my dam, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The loch would empty through the pass in an hour, down into the Wetlands, and every farm below the dam would go with it. I dream of it most nights, so if you've a prayer for sleep, I'll take that too." } },
      choices = {
        { text = "Then I'll pray for the dam, and for your sleep.", next = "BACK", reply = "Thank you, that's kind of you. My sleep could use it more than the dam does.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't hold water. Check your sluice gates.", next = "BACK", reply = "I check them every morning, and every night, and twice on a bad day. Pray for them anyway, if you've a prayer spare.", fx = { align = { light = -1 } } },
        { text = "Something else, Chief Engineer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd scream, probably, and then hit him with a spanner, and then report him to Captain Rugelfuss in triplicate. I'm an engineer, not a soldier, though for the dam I'd learn." } },
      choices = {
        { text = "Report him in triplicate. The law will deal with him.", next = "BACK", reply = "Triplicate, yes, quite right. Captain Rugelfuss likes his forms, and so do I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the forms. Throw him off the dam.", next = "BACK", reply = "Throw him off? I'd never manage it, and I'd have to fill out the forms anyway. Bring him to Rugelfuss.", fx = { align = { order = -1 } } },
        { text = "Something else, Hinderweir.", next = "BACK" },
      },
    },
    dd_hw_di = {
      lines = {
        { id = "dd_hw_di1", text = "More than I'd like an' fewer than they'd like, thanks tae you. They come up out o' the Searing Gorge an' the Badlands, Thaurissan's rotten get, an' they hate this dam because it's Bronzebeard work that'll outlast anything they build." },
      },
      choices = {
        { text = "Ironforge should march on Blackrock and end it.", next = "BACK", reply = "Aye, an' many a dwarf has said so over a pint. The King says the mountain's too strong yet, an' I'll no' argue wi' Magni.", fx = { align = { honor = 1 } } },
        { text = "Better to catch their spies quietly than fight in the open.", next = "BACK", reply = "Quiet suits me fine, so long as the quiet ends wi' them in irons an' my dam still standin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Chief Engineer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Hinderweir the Seventh, Chief Engineer of the Stonewrought Dam. I'm seventh o' the name, an' I'll not be the one remembered for the day she fell, not while there's a beard on my chin." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("A Dark Threat Looms") },
          text = "Someone's been at the dam. Things have moved that shouldn't move and things have been left that shouldn't be here, so find out who, before it's too late to find out anything." },
        { id = "h_crack", when = { metBefore = true }, text = "I found a hairline crack on the east face this morning, which is nothing, probably nothing, stone settles, ye know. I'll check it again tonight, and tomorrow, and forever." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Dark Threat Looms"), days = 7 } },
          text = "You saved her, the dam, my dam! She's safe, for the time being, though I've started checking at noon as well." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at the dam! I'll have ye know the Stonewrought Dam is the finest piece o' engineering in Khaz Modan, an' the fish don't seem tae mind it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, thank the stone, for if the Dark Irons come for the dam, I'd much prefer you between them and the sluice gates." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? You'll have keen eyes, then, and I'd be ever so grateful if you'd turn them on the hills above the dam." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, could you bless the dam? I've tried everything else, and my grandfather swore by a good blessing." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Thank goodness, because if the Dark Irons come for the dam, you'll shine so brightly they'll know they're not welcome." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, could you ask the water whether it's content behind the dam? My grandfather would turn in his grave if it wasn't, and so would his." },
        { id = "dd_shipment", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "Miran tells me ye saw her shipment safe through the Dark Iron ambush on the excavation road. The same beards have been sniffin' round my dam, so I'll take any friend that frightens them." },
        { id = "dd_darkiron", when = { killed = { name = "Dark Iron", min = 25 } },
          text = "Ye've put a fair few Dark Irons in the dirt, by the count the Mountaineers keep. Every one o' them was a pair o' hands that might've been settin' a charge under my dam." },
      },
      again = {
        { id = "h_again", text = "Yes? Quickly, please, for I've readings due an' the stone won't wait." },
        { id = "h_again2", text = "Go on, and hold the rail while you do." },
      },
      choices = {
        { text = "How many Dark Irons are still out there?", next = "dd_hw_di", when = { killed = { name = "Dark Iron", min = 25 } } },
        { text = "Does the dam harm the land around it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The dam looks older than anything in Thelsamar.", next = "old" },
        { text = "Who would want the dam to fall?", next = "threat" },
        { text = "Where are your guards?", next = "guards" },
        { text = "Whoever built this dam knew their stonework.", next = "built" },
        { text = "The stonewrought method was a Dark Iron's, I'm told.", next = "forgewright", when = { heardLine = "archesonus.d_default" } },
        { text = "A gnome would like a look at your dam, Chief Engineer.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "A mage's ward could shore up the dam.", next = "k_mage", when = { class = "MAGE" } },
        { text = "Your guards would never see a saboteur coming, Engineer.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Dark Irons wield fire. I know how to answer it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You look like a dwarf who fears for this dam.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for in the hills above the dam?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would happen to the valley if the dam ever failed?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "If you caught a Dark Iron at the dam, what would you do?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is the water restless behind the Stonewrought Dam, Engineer?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My uncle taught me the rifle on your dam, Engineer.", next = "xorig_damrifle", when = { origin = "dwarf_dam_rifleman" } },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    xorig_damrifle = {
      lines = {
        { id = "xodamrifle_default", text = "Did he, now! I've had a good few riflemen on my walls, an' the troggs in Stonesplinter know every one o' them by the sound o' their shot. If ye've come home, there's always a post on the dam for a steady eye, so will ye take a turn on the wall while ye're here?" },
      },
      choices = {
        { text = "Aye, a turn or two, Engineer.", next = "BACK", fx = { affinity = 2, standing = { thelsamar = 1 } } },
        { text = "The trail's my home now, but I'll come by.", next = "BACK", fx = { trait = { independent = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      big = true,
      lines = {
        { id = "o_default", text = "Older than my grandfather's grandfather, and holding back the whole loch with dwarven stone and dwarven stubbornness. If it goes, the valley below goes with it, so I check it every morning, every night, and sometimes in between." },
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
        { id = "tr_default", text = "The Dark Irons, who else? First they brought down the Thandol Span, then they pillaged Dun Modr. You needn't be a genius to see what's next on their list. I am one, and I see it plainly." },
      },
      choices = {
        { text = "They'd need a mountain of powder to crack that dam.", next = "threat_how" },
        { text = "Then we stop them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'm an engineer. Let me check the ramp.", next = "BACK", when = { profession = "Engineering" }, fx = { affinity = 2 } },
      },
    },
    threat_how = {
      lines = {
        { id = "th_default", text = "They'd use something that goes bang, in barrels. I've seen sappers on the eastern ramp, and sappers don't come for the view." },
        { id = "th_seaforium", when = { questDone = TODO_QUEST("A Dark Threat Looms") },
          text = "Seaforium! It's harmless dry, but wet, they tell me, it could blow Ironforge out of the mountain, and they brought it to a dam, of all things." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    guards = {
      lines = {
        { id = "gu_default", text = "They were reassigned to the Alliance front, nearly all of them, and my best inspector with them. I have a clipboard, a rail, and you." },
      },
      choices = {
        { text = "That'll do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    built = {
      lines = {
        { id = "bu_default", text = "It was built before my time, and before my father's. It's stonewrought work, the finest in the world, an' who laid the first stone matters less than who keeps the last one." },
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
        { text = "A spillway might save her, you know.", next = "BACK", reply = "A spillway? You sound like the last gnome, and he nearly had me fooled. Maybe, but not without a hundred years of study, and I've only got sixty left in me.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "If she stands, leave her be.", next = "BACK", reply = "Exactly, and that's what my grandfather said, and his father before him. Seven generations of Hinderweirs, and she's never leaked a drop.", fx = { align = { order = 1 }, affinity = 2 } },
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
      { id = "tp_knows", text = "I know, well, I know a lot, mostly about the dam, but also other things, which I'll gladly tell you about if you ask about any of these, quickly, before I have to go and check the dam again." },
    },
    background = { { id = "tp_bg", text = "I'm the seventh o' the name and Chief Engineer of the dam, and that's all of me; the rest is readings an' a very worried beard." } },
    advice = { { id = "tp_ad", text = "Check it twice, then check it again, and then hold the rail." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name near my dam, please, just don't. I've enough to worry about as it is.", next = "threat" } },
    stonewrought_dam = { { id = "tp_dam", text = "She's mine. Well, she's the King's, but she's mine.", next = "old" } },
    _none = { { id = "tp_none", text = "I'm sorry, I cannae think about anything but the dam right now. I rarely can." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan was an engineering marvel, a marvel, and now it's lost, which is, well, it's a lesson in maintenance, really. I check my seals twice a day because of it." } },
    magni = { { id = "tp_magni", text = "King Magni visited the dam once, well, my grandfather says he did, or his father did, and called it a fine piece of work. Every Hinderweir since has been living up to it." } },
    troggs = { { id = "tp_troggs", text = "The troggs dig, you see, and digging near a dam is, well, it's the worst thing, really, the very worst. I've asked the Mountaineers to keep them at least a mile off, and they've asked me how." } },
  },
}
