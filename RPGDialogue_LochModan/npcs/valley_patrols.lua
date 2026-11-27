-- The Mountaineers who walk the Valley of Kings and the south road: Wallbang, Langarr and Gwarth.
-- Voices: bibles/valley_patrols.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mountaineer Wallbang: loud, cheerful, fond of his rifle.
P:NPC {
  key = "lm_wallbang", id = TODO_NPC("Mountaineer Wallbang"), name = "Mountaineer Wallbang",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "jovial", "fierce" }, values = { "brave", "loyal" },
  notices = { "soldier", "class" },

  impression = {
    first = "He talks at the volume of a rifle shot.",
    third = "{name} met Mountaineer Wallbang, a loud and cheerful rifleman who patrols the Valley of Kings.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ha, it's yerself! Still breathin', an' always welcome on my patrol." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep away from my troggs, for I'll handle them myself." },
    { id = "g_default", text = "Ho there! Mountaineer Wallbang, an' if ye heard a bang a minute ago, that was me, an' the trogg's no' comin' back." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, it's you again! Still breathin', I see, which in this valley counts as a fine day." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Is that a gun on yer back? Let's see it. No, I'll no' fire it, I only want tae smell the oil." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "A warrior! Get in close an' I'll shoot over yer shoulder, for that's the finest partnership in all o' Khaz Modan." },
  },

  start = "hello",
  nodes = {
    dd_wb_100 = {
      lines = {
        { id = "dd_wb_1001", text = "A hundred! I've been at it six years an' stopped countin' at four hundred, so ye've a way tae go, but it's a fine start. The trouble is they keep comin' up out o' the dig at Uldaman faster than either of us can count." },
      },
      choices = {
        { text = "Fight the troggs face to face, not from the shadows.", next = "BACK", reply = "Ha! That's the way! A trogg deserves tae see the dwarf that's about tae flatten it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A knife in a trogg's back is still a dead trogg.", next = "BACK", reply = "Aye, it is, but there's nae glory in it, an' nae story for the inn.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll stop counting and just keep killing.", next = "BACK", reply = "That's how it goes, in the end. The numbers stop meanin' anythin' after the first few hundred.", fx = { align = { light = -1 } } },
        { text = "I count so I remember what it costs.", next = "BACK", reply = "Hm. That's a priest's answer, but I'll no' laugh at it. Somebody ought tae remember.", fx = { align = { light = 1 } } },
        { text = "Something else, Wallbang.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wallbang o' the Mountaineers, an' I walk the Valley o' Kings from the statues tae the south gate an' back again. The troggs come up out o' the hills, an' I send them back down, louder than they came." },
        { id = "h_trogg", when = { questActive = TODO_QUEST("The Trogg Threat") },
          text = "Huntin' troggs for the Captain? Grand! Aim for the head, for they've skulls like anvils an' no' much in them tae miss." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Walk wi' me a bit, for the statues like tae see their own kin pass by, or so my gran always said." },
        { id = "dd_kingslands", when = { questDone = TODO_QUEST("In Defense of the King's Lands") },
          text = "Langarr tells me ye've been workin' the slopes for the King's Lands bounty. Good, for the troggs I dinnae kill on my side end up on his, an' he complains." },
        { id = "dd_stone100", when = { killed = { name = "Stonesplinter", min = 100 } },
          text = "A hundred Stonesplinters, if the lads are countin' right, an' they usually are when it's somebody else's tally. Ye're near enough a Mountaineer yerself now." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Speak up, for my ears have been ringin' since the Second War." },
      },
      choices = {
        { text = "I've killed a hundred Stonesplinters, Wallbang.", next = "dd_wb_100", when = { killed = { name = "Stonesplinter", min = 100 } } },
        { text = "Tell me about the statues.", next = "statues" },
        { text = "How bad are the troggs here?", next = "troggs" },
        { text = "Why do they call you Wallbang?", next = "name" },
        { text = "That rifle's seen more care than most babes.", next = "rifle" },
        { text = "Who gives the orders out here?", next = "captain" },
        { text = "Gnomes made the best rifles once, you know.", next = "gnome", when = { race = "Gnome" } },
        { text = "Fancy a shooting match, Mountaineer?", next = "match", when = { class = "HUNTER" } },
        { text = "Carry on, Mountaineer.", next = "END" },
      },
    },

    rifle = {
      lines = {
        { id = "ri_default", text = "An' so she should, for she's never once let me down, which is more than I can say for my knees. Bronzebeard make, Military Ward, wi' a barrel I oil every mornin' an' a stock I carved maself from Dun Morogh pine." },
      },
      choices = {
        { text = "Does she have a name?", next = "ri_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ri_name = {
      lines = {
        { id = "rn_default", text = "Hearthstove, after the innkeeper, for they both make a terrible noise an' they both keep me alive. Dinnae tell him, mind, for he's still sore about his wall." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    captain = {
      lines = {
        { id = "ca_default", text = "Captain Rugelfuss, down by the gate, an' a fine officer he is, though he worries like an old hen since the Reserve went off tae the Alliance front. He's sendin' every lad wi' a gun intae the hills, an' half the ones without." },
      },
      choices = {
        { text = "Is he right to worry?", next = "ca_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ca_worry = {
      lines = {
        { id = "cw_default", text = "Aye, though I'd never say it tae his face. Wi' the Reserve gone it's us an' the farmers between the troggs an' Thelsamar, an' the Dark Irons at the dam know that as well as we do." },
      },
      choices = {
        { text = "Then the King should bring the Reserve home.", next = "BACK", fx = { align = { order = -1 } },
          reply = "Ha! Write him a letter, friend, an' tell him Wallbang sent ye." },
        { text = "The Alliance needs them more. Hold the line yourselves.", next = "BACK", fx = { align = { order = 1 } },
          reply = "That's the oath we swore, an' that's what we'll do. Loudly." },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      lines = {
        { id = "gn_default", text = "Did they now? I'll grant ye the sights, wee one, for nobody grinds a lens like a gnome. But the barrel's dwarven, an' the bang's dwarven, an' I'll hear no more about it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    match = {
      lines = {
        { id = "ma_default", text = "Ha! I'd love one, but the Captain says the last match cost him a chimney pot. Shoot a trogg for me instead, an' we'll call it a draw." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    statues = {
      lines = {
        { id = "st_default", text = "Madoran Bronzebeard an' Khardros Wildhammer, carved by their sons tae stand guard over the pass south. They're there tae remind the Dark Irons that the old kings are still watchin', an' so am I." },
      },
      choices = {
        { text = "Do the Dark Irons still come this way?", next = "statues_di" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statues_di = {
      big = true,
      lines = {
        { id = "sd_default", text = "No' wi' banners, no' any more, but they sneak about the dam an' the south road like rats in a granary. If one ever walks up this valley in the open, I'll greet him wi' a ball o' lead an' let the kings watch." },
      },
      choices = {
        { text = "The Dark Irons are kin, whatever they've done.", next = "BACK", reply = "Kin, aye, an' they'll be kin right up until they put a knife in yer back. Thaurissan's lot forgot that, so I'll no' remember it for them.", fx = { align = { light = 1 } } },
        { text = "Good. Kin who betray you are worse than strangers.", next = "BACK", reply = "That's the truth o' it, an' it's why I keep my rifle loaded. A stranger I can forgive, but a Dark Iron who shares my blood an' still burns my kin, never.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },

    troggs = {
      lines = {
        { id = "tg_default", text = "Bad enough that the Captain's had tae pull us off the south gate tae walk the valley, an' that's no' a thing he does lightly. They've a chieftain up in the hills now, Grawmug, an' he's got the beasts organised, which isnae natural." },
      },
      choices = {
        { text = "Who is this Grawmug?", next = "tg_grawmug" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    tg_grawmug = {
      lines = {
        { id = "tgg_default", text = "A big brute o' a trogg wi' a stone club an' more sense than the rest put together, which isnae sayin' much. The troggs came boilin' up out o' Ironband's dig, an' Grawmug came up first, so ye can blame the prospectors for the lot o' them." },
      },
      choices = {
        { text = "What were the prospectors digging for?", next = "tg_dig" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    tg_dig = {
      lines = {
        { id = "tgd_default", text = "Old titan stone, they say, the kind the Explorers' League would give their beards for. Whatever it was, they dug too deep an' found troggs instead, an' now we're the ones payin' for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Because I once put a shot through the wall o' the Stoutlager Inn, an' Hearthstove never let me forget it. It was a rat, mind, an' I got it, so I call that a fair shot." },
      },
      choices = {
        { text = "That's a fine name to earn, Wallbang.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the valley, the statues an' every trogg hole between here an' the gate." } },
    troggs = { { id = "tp_troggs", text = "Troggs are ugly, stubborn an' thick in the head, an' still too many of them.", next = "troggs" } },
    rugelfuss = { { id = "tp_rugelfuss", text = "A fine captain who worries like an old hen. Dinnae tell him I said so." } },
    dark_iron = { { id = "tp_darkiron", text = "Rats at the dam. If one walks up this valley, the kings an' I'll be waitin'." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask Langarr, he reads." } },
  },
}

-- Mountaineer Langarr: dour, precise, a counter of things.
P:NPC {
  key = "lm_langarr", id = TODO_NPC("Mountaineer Langarr"), name = "Mountaineer Langarr",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "dry", "watchful" }, values = { "dutiful", "careful" },
  notices = { "stealth", "kit" },

  impression = {
    first = "He seemed faintly disappointed that I hadn't arrived as a trogg.",
    third = "{name} met Mountaineer Langarr, a dour and watchful Mountaineer of the Valley of Kings.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, an' quieter than ever. I didnae hear ye at all, which I'll count a compliment." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Move along quietly, an' we'll get along fine." },
    { id = "g_default", text = "Stop there an' let me look at ye. Aye, ye'll do. Move along, but quietly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'd have heard ye comin', but ye've learned tae walk softer." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ye can come out o' the shadows. I saw the grass bend three steps back." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've been in a scrap an' ye lost, by the look o' yer armour. Thelsamar's that way, an' so's Morhan." },
  },

  start = "hello",
  nodes = {
    w2_count = {
      lines = {
        { id = "w2_count_l0", text = "Forty-one seen, nineteen shot, six that might have been the same one twice. I keep it in a book, an' the book goes tae Rugelfuss, an' Rugelfuss sends it tae Ironforge, an' nobody in Ironforge reads it." },
      },
      choices = {
        { text = "How do you know nobody reads it?", next = "w2_count_read" },
        { text = "Counting troggs won't stop them.", next = "BACK" },
      },
    },
    w2_count_read = {
      lines = {
        { id = "w2_count_read_l0", text = "Because I wrote \"the dam is on fire\" on page thirty, as a test, an' no one sent so much as a bucket. I've no' told Rugelfuss, an' I'll thank ye no' tae either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Langarr. I walk the valley an' watch the hills, an' I'll tell ye now there are troggs on the slopes tae the east, so stay off the high ground unless ye mean tae fight." },
        { id = "h_defense", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "Mountaineer Cobbleflint's sent ye tae the troggs, has he? Mind the ones wi' the stone teeth round their necks, for those are the ones that hit hardest." },
        { id = "dd_troggthreat", when = { questDone = TODO_QUEST("The Trogg Threat") },
          text = "Rugelfuss says ye brought him the proof he needed on the trogg threat. That'll mean more Mountaineers up here, I hope, for my feet are tired." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Be brief, for I'm watchin' the ridge while we talk." },
      },
      choices = {
        { text = "A guard who sees trouble should give fair warning first.", next = "BACK", reply = "Aye, a fair warnin' first, an' then the rifle if they dinnae heed it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Shoot first, and the questions won't matter.", next = "BACK", reply = "They'll matter tae the Captain when he finds ye've shot a lost shepherd.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What are you watching for?", next = "watch" },
        { text = "Is the patrol a lonely one?", next = "lonely" },
        { text = "What about the Dark Irons at the dam?", next = "dam" },
        { text = "You don't trust anyone, do you?", next = "trust" },
        { text = "How did you spot me? I was careful.", next = "spotted", when = { class = { "ROGUE", "DRUID" } } },
        { text = "My people keep vigil too, under the moon.", next = "elf", when = { race = "NightElf" } },
        { text = "How many troggs have you counted this month?", next = "w2_count" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    watch = {
      lines = {
        { id = "wt_default", text = "Troggs comin' down, Dark Irons comin' up an' anythin' else that doesnae belong. Mostly it's troggs, an' mostly I count them, for the Captain likes his numbers." },
      },
      choices = {
        { text = "How many this week?", next = "watch_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_count = {
      big = true,
      lines = {
        { id = "wc_default", text = "Forty-one sighted, twenty-six put down, an' one that I'd swear was carryin' a carved idol like a babe in its arms. I've told the Captain, an' the Captain told Ironband, an' Ironband went very quiet." },
      },
      choices = {
        { text = "Then hunt the idol-carriers first.", next = "BACK", reply = "Aye, that's my reckonin' too, an' I've told the Captain twice. The idol-carriers know somethin' the others don't.", fx = { align = { order = 1 } } },
        { text = "Counting troggs won't stop them. Kill them all.", next = "BACK", reply = "Counting is how I know whether they're stopped or no'. Kill them all, by all means, but I'll be countin' while ye do it.", fx = { align = { order = -1 } } },
        { text = "Why did Ironband go quiet about the idol?", next = "idol" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    idol = {
      lines = {
        { id = "id_default", text = "Because his diggers turned up carved things in the deep earth before the troggs came out, an' he's no' keen on folk askin' whether one led tae the other. I've written it down, an' I'll keep writin' it down until somebody wiser reads it." },
      },
      choices = {
        { text = "Who would be wiser?", next = "idol_wise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    idol_wise = {
      lines = {
        { id = "iw_default", text = "The Explorers' League in Ironforge, at the Hall o' Explorers, if they'd stop lookin' at old maps long enough. Take it tae them if ye're passin', an' tell them Langarr counted forty-one." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    dam = {
      lines = {
        { id = "da_default", text = "The Stonewrought Dam holds back the whole loch, an' the Dark Irons have been seen pokin' about the base o' it wi' powder kegs. If that dam goes, Thelsamar goes wi' it, so ye'll understand why I watch the south as hard as the hills." },
      },
      choices = {
        { text = "Who guards the dam?", next = "dam_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dam_guard = {
      lines = {
        { id = "dg_default", text = "The engineers who built it, mostly, an' a handful o' Mountaineers who'd rather be anywhere else. They're good wi' a wrench an' poor wi' a rifle, which is the wrong way round when Dark Irons come callin'." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    trust = {
      lines = {
        { id = "tr_default", text = "I trust Wallbang tae make a noise an' the troggs tae come down the hill, an' I've never been wrong about either. Folk I trust when I've watched them a while, an' I've only watched ye a minute." },
      },
      choices = {
        { text = "Fair enough. Trust should be earned.", next = "BACK", fx = { affinity = 1 },
          reply = "Aye. Keep earnin' it, then, every day ye're here." },
        { text = "Something else.", next = "BACK" },
      },
    },

    spotted = {
      lines = {
        { id = "sp_default", text = "Ye were careful, but the grass in this valley doesnae spring back in the cold, an' ye left a trail like a ram. Walk on the stones next time, an' I might no' see ye till the third step." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    elf = {
      lines = {
        { id = "el_default", text = "So I've heard, an' I'll say this for yer folk, ye know how tae stand still. Most young dwarves fidget like their beards are on fire, an' a sentry who fidgets is a sentry who misses things." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lonely = {
      lines = {
        { id = "lo_default", text = "No, for there's Wallbang, an' Wallbang's company enough for ten dwarves whether ye want it or no'. The statues are better listeners, mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what moves in this valley. Ask." } },
    troggs = { { id = "tp_troggs", text = "Forty-one sighted this week. Twenty-six put down. I'm countin' still." } },
    dark_iron = { { id = "tp_darkiron", text = "Seen at the base o' the dam wi' powder kegs. I watch the south for them." } },
    _none = { { id = "tp_none", text = "Couldnae say. I watch the hills, no' the gossip." } },
  },
}

-- Mountaineer Gwarth: young, keen, new to the valley (female, per the wiki).
P:NPC {
  key = "lm_gwarth", id = TODO_NPC("Mountaineer Gwarth"), name = "Mountaineer Gwarth", gender = "female",
  bible = "bibles/valley_patrols.md", role = "soldier", tier = "service",
  communities = { "thelsamar" }, temper = { "eager", "earnest" }, values = { "brave", "dutiful" },
  notices = { "greenness", "race" },

  impression = {
    first = "She still polishes her buttons, and she's braver than she is careful.",
    third = "{name} met Mountaineer Gwarth, the youngest Mountaineer on the Valley of Kings patrol.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you! I've been practisin' my halt, an' I think it's gettin' quite fierce now." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I'll halt ye properly, so dinnae think I've forgotten how." },
    { id = "g_default", text = "Halt, an' state yer business! Ah, ye're no' a trogg. Sorry, friend, I'm new tae the patrol." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! I've been practisin' my halt since last time, did ye hear it?" },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Ye look as new tae the road as I am tae the patrol. We'll both learn, I suppose, an' hopefully no' the hard way." },
    { id = "n_race", cat = "race", when = { race = "Gnome" },
      text = "A gnome! My mother says gnomes saved half o' Ironforge's pipes after Gnomeregan, an' I believe every word she says." },
  },

  start = "hello",
  nodes = {
    w2_scary = {
      lines = {
        { id = "w2_scary_l0", text = "A trogg shaman, up on the ridge, with a ring o' stones lit round it like candles. I was meant tae shoot it, an' I froze, an' Langarr shot it instead an' said nothin' about it, which was worse than shoutin'." },
      },
      choices = {
        { text = "Everyone freezes once.", next = "w2_scary_once" },
        { text = "A Mountaineer can't afford to freeze.", next = "BACK" },
      },
    },
    w2_scary_once = {
      lines = {
        { id = "w2_scary_once_l0", text = "That's what Wallbang said, when I told him. He said he froze his first time too, against a gnoll, an' then he said it was a very big gnoll, which I think he added for my sake." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Gwarth, two months in the King's Mountaineers an' one in the valley. Langarr says I'll make a fine soldier once I learn tae shut my mouth, an' Wallbang says I'll never learn, for he never did." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "That's proper armour! I've been savin' for a breastplate from Morhan, but at a Mountaineer's pay I'll be grey before I've got it." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've time, for Langarr does the watchin' an' I do the walkin'." },
      },
      choices = {
        { text = "A new guard should earn her place by honest duty.", next = "BACK", reply = "Aye, that's what I'm tryin' tae do, an' it's good tae hear somebody say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Take credit for the veterans' kills. Nobody will check.", next = "BACK", reply = "That wouldnae be right! I'd sooner be the green one than a liar.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why did you join the Mountaineers?", next = "join" },
        { text = "What's the valley like for a new recruit?", next = "valley" },
        { text = "What do you make of Wallbang and Langarr?", next = "elders" },
        { text = "You're holding that rifle like it might bite.", next = "rifle" },
        { text = "Ye remind me of myself at your age, lass.", next = "dwarf", when = { race = "Dwarf", minLevel = 20 } },
        { text = "I could use a strong arm. Ever fought beside a paladin?", next = "paladin", when = { class = "PALADIN" } },
        { text = "What's the scariest thing you've seen out here?", next = "w2_scary" },
        { text = "Good luck on your patrol, Gwarth.", next = "END" },
      },
    },

    join = {
      lines = {
        { id = "jn_default", text = "My father was a Mountaineer at Algaz, an' his father before him, an' I wasnae goin' tae be the first Gwarth tae work a bellows. Besides, the King needs dwarves on the roads now the Reserve's gone tae the Alliance front." },
      },
      choices = {
        { text = "Do you wish you'd gone to the front?", next = "join_front" },
        { text = "Tell me about your father at Algaz.", next = "join_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    join_front = {
      big = true,
      lines = {
        { id = "jf_default", text = "Some nights, aye, for that's where the songs get written. But the Captain says the front's only a front if somebody holds the back, an' I've decided tae believe him." },
      },
      choices = {
        { text = "The Captain's right. Holding home matters most.", next = "BACK", reply = "I think so too, most days, though it's good tae hear somebody else say it. Somebody has tae mind the gate while the brave ones go chargin' off.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Go where the glory is, lass. Life's short.", next = "BACK", reply = "It is short, aye, an' I've thought about it every night. But the Captain needs me here, an' I'd no' let him down.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    join_father = {
      lines = {
        { id = "jfa_default", text = "He held the Algaz gate against the Horde in the Second War, an' he's got a scar from his ear tae his chin tae prove it. He doesnae talk about it much, but when I joined he gave me his old powder horn an' told me tae come home wi' it." },
      },
      choices = {
        { text = "Is Algaz still held?", next = "join_algaz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    join_algaz = {
      lines = {
        { id = "ja_default", text = "Aye, by the Mountaineers at the station, though the trolls an' the Wetlands beasts give them no rest. It's the gate between Khaz Modan an' the north, so we'll hold it as long as there's a dwarf tae stand in it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    valley = {
      lines = {
        { id = "vl_default", text = "Cold, wet an' full o' troggs, an' I love every bit o' it. The statues look down on ye while ye walk, an' I swear old Khardros frowns when I trip." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    elders = {
      lines = {
        { id = "el_default", text = "They're the finest Mountaineers in Khaz Modan! Wallbang can put a ball through a trogg's eye at two hundred paces, an' Langarr can tell ye how many troggs are on a hill just by smellin' the wind, or so I've heard." },
      },
      choices = {
        { text = "Have you seen Langarr do that?", next = "el_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    el_seen = {
      lines = {
        { id = "els_default", text = "No' exactly, but he said 'eleven' once an' there were eleven, an' that's near enough for me. I'm keepin' a book o' their sayin's so I'll be as good as them one day." },
      },
      choices = {
        { text = "Don't copy heroes. Find your own way.", next = "BACK", fx = { align = { order = -1 } },
          reply = "My own way? I hadnae thought o' that. I'll write it in the book." },
        { text = "Good. Learn from your elders and follow them.", next = "BACK", fx = { align = { order = 1 } },
          reply = "That's what my father said too. I'll keep at it." },
        { text = "Something else.", next = "BACK" },
      },
    },

    rifle = {
      lines = {
        { id = "rf_default", text = "It might! It's a borrowed one from the Captain's rack, an' it pulls left, an' Wallbang says it's the rifle's fault an' Langarr says it's mine. I've hit three troggs wi' it, so far, an' a fence post I'd rather no' talk about." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Do I? That's the kindest thing anyone's said tae me since I put on the tabard! Ye've the look o' someone who's seen the real thing, an' I hope I come back lookin' half as steady." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    paladin = {
      lines = {
        { id = "pa_default", text = "Never, but I've heard the stories o' the Silver Hand from the Second War, an' Uther himself! If ye ever need a rifle at yer back, ask the Captain for Gwarth, an' I'll come runnin', if he lets me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a bit, an' I'm learnin' more every day. Ask, an' I'll try." } },
    algaz = { { id = "tp_algaz", text = "My father held the gate there in the Second War. Scar from ear tae chin." } },
    troggs = { { id = "tp_troggs", text = "I've hit three wi' this rifle. An' a fence post. Dinnae ask." } },
    _none = { { id = "tp_none", text = "I dinnae know that one, sorry! Langarr might, if ye can get a word out o' him." } },
  },
}
