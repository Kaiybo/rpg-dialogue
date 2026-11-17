-- Loch Modan folk we'd missed: Huldar and Miran (Ironband's powder haulers, the Saean ambush),
-- Lina Hearthstove (stable master), Yanni Stoutheart (general goods), Vrok Blunderblast (gunsmith).
-- Voice: bibles/loch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_RESUPPLY = TODO_QUEST("Resupplying the Excavation")
local Q_AMBUSH = TODO_QUEST("After the Ambush")
local Q_SHIPMENT = TODO_QUEST("Protecting the Shipment")

---------------------------------------------------------------------------
-- Huldar
---------------------------------------------------------------------------
P:NPC {
  key = "lm_huldar", id = TODO_NPC("Huldar"), name = "Huldar",
  bible = "bibles/loch_folk.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady", "proud" }, values = { "dutiful", "loyal" },
  notices = { "race", "kit" },

  impression = {
    first = "Huldar is a broad, grey-bearded hauler who sits on a barrel of blasting powder as if it were a kitchen stool. He keeps one eye on the road south of the loch and the other on his cart, and he doesn't seem to trust either of them any more.",
    third = "{name} met Huldar, who hauls blasting powder from Thelsamar to Prospector Ironband's dig and was betrayed on the road by his own partner.",
  },

  greetings = {
    { id = "g_road", text = "Mind the barrels, friend, an' mind where ye put yer pipe. There's enough powder on this cart tae send us both tae Ironforge the quick way." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again, an' a welcome sight on this road. I've been countin' strangers since the ambush, an' ye're one o' the few I'm glad tae see." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} an' back on the loch road! The carts have been runnin' while ye were away, an' no' one barrel lost since." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Thelsamar's been sayin' good things about ye, an' a hauler hears everythin' twice, once goin' an' once comin' back." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard face, an' an honest one by the look o' it. I've learned no' tae trust a beard on sight any more, mind, but I'll trust that one a wee bit." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye've been through the same ambush I have. Morhan in town will see tae that mail before the next one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Huldar, hauler for Prospector Ironband, an' this cart's my charge. Every barrel on it goes tae the dig south o' the loch, an' there's folk out there who'd rather it went somewhere else." },
        { id = "h_resupply", tags = { "news" }, when = { questActive = Q_RESUPPLY },
          text = "Hornhelm sent ye? Then ye've come just as the dust settles, an' ye'll forgive me if I'm still shakin'. Dark Irons came out o' the rocks at us, an' Saean... Saean stood there an' let them." },
        { id = "h_ambush_active", when = { questActive = Q_AMBUSH },
          text = "Miran's checkin' his straps by the other cart. Go an' tell him ye'll walk wi' him, an' I'll rest easier watchin' these barrels on my own." },
        { id = "h_ambush_done", when = { questDone = Q_SHIPMENT },
          text = "Miran made it tae the dig wi' every barrel, an' he says it was yer doin'. Ironband's blastin' again, an' I can hear it from here on a still mornin'." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ye've the look o' a Dun Morogh dwarf, an' I'll no' hold it against ye that I've just been stabbed in the back by one o' our own kind. Well, Saean was Dark Iron at heart, whatever he looked like." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome on the loch road! Ye'll know a thing or two about powder, I'd wager, so ye'll understand why I flinch at every spark." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk while I re-tie this rope, for I'll no' trust a knot I didnae tie myself again." },
        { id = "h_again2", text = "Go on, I'm listenin'. The road's quiet, an' quiet makes me nervous now." },
      },
      choices = {
        { text = "Tell me about the ambush.", next = "ambush" },
        { text = "What's all this powder for?", next = "powder" },
        { text = "Is the road safe now?", next = "road" },
        { text = "I'll keep an eye on the barrels while you work.", next = "watch", when = { questActive = Q_AMBUSH } },
        { text = "A dwarf betraying dwarves. How does that happen?", next = "kin", when = { race = "Dwarf" } },
        { text = "Safe travels, Huldar.", next = "END" },
      },
    },

    ambush = {
      lines = {
        { id = "am_default", text = "We'd stopped tae rest the ponies when they came, three Dark Irons out o' the gully wi' their axes already swingin'. Saean was meant tae be watchin' that gully, an' when I looked round he was smilin' at me." },
        { id = "am_after", when = { questDone = Q_RESUPPLY },
          text = "Ye were there for the end o' it, so ye saw his face when it went wrong for him. Near a year we hauled together, an' I'd have trusted him wi' my own hearth." },
      },
      choices = {
        { text = "Did you never suspect him?", next = "ambush_signs" },
        { text = "What did he say to you?", next = "ambush_words" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    ambush_signs = {
      lines = { { id = "as_default", text = "I've been turnin' it over every night since, an' maybe there were signs. He always asked which day we'd leave, an' he went off on his own in Thelsamar tae see a cousin I never once met." },
      },
      choices = {
        { text = "A cousin you never met. That's worth telling the Mountaineers.", next = "ambush_tell" },
        { text = "Anyone could miss that. Don't blame yourself.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    ambush_tell = {
      big = true,
      lines = { { id = "at_default", text = "I've told Kadrell, an' he wrote it down slow an' careful like a magistrate. Bluntnose would have the whole town questioned, but I cannae tell if that'd catch a spy or just make the honest folk hate us." },
      },
      choices = {
        { text = "Question everyone. A spy hides behind honest neighbours.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the town be. Trust is what keeps a place together.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Huldar.", next = "BACK" },
      },
    },
    ambush_words = {
      lines = { { id = "aw_default", text = "\"Sorry, Huldar,\" he said, as if he'd trod on my foot at the bar. Then he said he'd misled me, which is a gentle way o' puttin' it when there's an axe comin' for yer head." },
      },
      choices = {
        { text = "He'll answer for it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    powder = {
      lines = { { id = "po_default", text = "Blastin' powder for Ironband's excavation, south past the loch. He's diggin' for somethin' old under the hills, an' he cannae get through the rock without a good loud bang every few hours." },
      },
      choices = {
        { text = "What's he digging for?", next = "powder_dig" },
        { text = "Why would the Dark Irons want it?", next = "powder_dark", fx = { learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_dig = {
      lines = { { id = "pd_default", text = "Ask Ironband an' he'll talk yer ears off about it, but between us I think he's no' sure himself. Old titan stone, the League says, an' I just haul the barrels an' let the clever folk argue." },
      },
      choices = {
        { text = "Some things are better left buried.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_dark = {
      lines = { { id = "pdk_default", text = "Powder enough tae crack a dig can crack a dam, friend, an' the Stonewrought holds back the whole loch. I'd no' sleep at all if I let that thought stay in my head, so I try tae keep it out." },
      },
      choices = {
        { text = "Then every barrel must reach the dig.", next = "BACK", fx = { learn = { "stonewrought_dam" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    road = {
      big = true,
      lines = { { id = "ro_default", text = "Safer than it was, but the gully's still there an' the Dark Irons know the way. Ironband wants us movin' daily, an' I'd rather wait for an escort, an' we've argued it twice already." },
      },
      choices = {
        { text = "Ironband's right. The dig can't wait on fear.", next = "road_after", fx = { align = { honor = -1 } } },
        { text = "Wait for an escort. Lives matter more than schedules.", next = "road_after", fx = { align = { honor = 1 } } },
        { text = "Who else uses this road?", next = "road_who" },
      },
    },
    road_after = {
      lines = { { id = "ra_default", text = "Aye, well, I'll tell him ye said so, an' he'll tell me what he always does, that the rock doesnae care about my nerves. Neither does the Dark Iron, come tae that." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    road_who = {
      lines = { { id = "rw_default", text = "Kobolds come down tae the water, an' the odd trogg from the east if the night's dark enough. An' the Mountaineers ride by when they remember us, which isnae often enough." },
      },
      choices = {
        { text = "I'll clear the road as I go.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    watch = {
      lines = { { id = "wa_default", text = "That's kind, but it's Miran needs ye more than me. He's carryin' the rest o' the load tae Ironband on his own, an' if they come again, they'll come for him." },
      },
      choices = {
        { text = "Then I'll go with Miran.", next = "END" },
        { text = "Something else first.", next = "BACK" },
      },
    },

    kin = {
      lines = { { id = "ki_default", text = "Gold, or grudges, or some old Dark Iron story his granny told him. Thaurissan's clan has been waitin' a long time tae hurt Ironforge, an' they've learned they can buy a door as easy as break it." },
      },
      choices = {
        { text = "Then we watch our own as closely as our enemies.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the loch road, I know the weight o' a powder barrel, an' I know what a traitor's smile looks like now. Ask." } },
    background = { { id = "tp_bg", text = "I've hauled for the League six seasons, an' never lost a barrel till Saean." , next = "ambush" } },
    dark_iron = { { id = "tp_di", text = "They came out o' the gully like they'd been waitin' a week, an' maybe they had." } },
    _none = { { id = "tp_none", text = "If it doesnae go on a cart, I've no' thought about it, friend." } },
  },
}

---------------------------------------------------------------------------
-- Miran
---------------------------------------------------------------------------
P:NPC {
  key = "lm_miran", id = TODO_NPC("Miran"), name = "Miran",
  bible = "bibles/loch_folk.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "cowardly", "friendly" }, values = { "loyal", "careful" },
  notices = { "race", "class" },

  impression = {
    first = "Miran is a young, sturdy hauler with powder burns on his sleeves and the nervous habit of counting his barrels under his breath. He wants very badly to be brave about the road ahead, and he's honest enough to admit he isn't yet.",
    third = "{name} met Miran, the young hauler who had to carry Ironband's powder to the dig after his partner Saean sold them out to the Dark Irons.",
  },

  greetings = {
    { id = "g_road", text = "Oh! Sorry, I thought ye were... never mind what I thought. Hello, friend, an' mind the barrels." },
    { id = "g_back", when = { metBefore = true }, text = "It's ye again, an' I'm glad of it, for the gully's no' half so frightenin' when there's two of us lookin' at it." },
    { id = "g_done", when = { questDone = Q_SHIPMENT }, text = "My escort! Ironband still talks about the day the powder came through, though he gives most o' the credit tae the powder." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's proper armour, an' I'd sleep under a cart beside it any night." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll no' strike a light near the cart, will ye? I've heard stories about yer workshops." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Miran, an' I haul for the dig wi' Huldar. Since the ambush we've split the load, so I'm takin' the rest tae Prospector Ironband an' tryin' no' tae think about the gully on the way." },
        { id = "h_ambush", tags = { "news" }, when = { questActive = Q_AMBUSH },
          text = "Huldar sent ye tae walk wi' me? Thank the Light, for I've checked these straps four times already an' I was about tae start a fifth. Just let me finish an' we'll be off." },
        { id = "h_ship", when = { questActive = Q_SHIPMENT },
          text = "Ready when ye are, friend. Keep yer eyes on the rocks, an' if anythin' moves, shout before ye think about it." },
        { id = "h_done", when = { questRecent = { Q_SHIPMENT, days = 7 } },
          text = "Every barrel at the dig, an' not a scratch on me, which my mother will never believe. I owe ye a drink at the Stoutlager, an' I mean tae pay it someday." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, good, for I'm no fighter, an' Saean always said I'd hide under the cart if trouble came. I didnae, as it happens, but it was close." },
      },
      again = {
        { id = "h_again", text = "Aye? What else, friend? I've a minute while the ponies drink." },
        { id = "h_again2", text = "Go on, ask. It keeps my mind off the gully." },
      },
      choices = {
        { text = "I'll walk with you to the dig.", next = "escort", when = { questActive = Q_AMBUSH } },
        { text = "You knew Saean well?", next = "saean" },
        { text = "Why do you keep hauling, after all that?", next = "why" },
        { text = "What's Prospector Ironband like?", next = "ironband" },
        { text = "You seem nervous, Miran.", next = "nerves" },
        { text = "I have to go, Miran.", next = "END" },
      },
    },

    escort = {
      lines = { { id = "es_default", text = "Ye will? Then let me check the straps once more an' we'll go by the loch's curve, the flat road. If the Dark Irons come again, they'll come from the rocks on the left, so watch that side for me." },
      },
      choices = {
        { text = "Nobody touches you or the powder.", next = "escort_vow" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    escort_vow = {
      big = true,
      lines = { { id = "ev_default", text = "I like the sound o' that. Ironband says if it comes tae it, I'm tae save the powder first, an' I've been wonderin' all mornin' whether he meant it." },
      },
      choices = {
        { text = "You come first, Miran. Powder can be bought again.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "He meant it. The dig matters more than either of us.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    saean = {
      lines = { { id = "sa_default", text = "Well enough tae share a fire, or so I thought. He taught me how tae tie a load so it wouldnae shift, an' all that time he was learnin' when we'd leave an' which way we'd go." },
      },
      choices = {
        { text = "Do you hate him?", next = "saean_hate" },
        { text = "What becomes of him now?", next = "saean_fate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saean_hate = {
      big = true,
      lines = { { id = "sh_default", text = "I want tae, an' then I tie a load the way he showed me an' I cannae quite manage it. Huldar says I'm soft, an' maybe I am, but I keep wonderin' what they promised him." },
      },
      choices = {
        { text = "Hate him. He'd have watched you die.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Wondering why isn't soft. It's how you stay decent.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    saean_fate = {
      lines = { { id = "sf_default", text = "If he lived through it, he's run tae his Dark Iron friends in the Wetlands or somewhere worse. Kadrell has his name on a list now, an' Kadrell doesnae forget a name." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the dig needs powder, an' because I'd be ashamed tae go home an' tell my mother I quit after one bad day. Mostly the second one, if I'm honest." },
      },
      choices = {
        { text = "That's braver than you think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Where's home?", next = "why_home" },
      },
    },
    why_home = {
      lines = { { id = "wy_default", text = "Kharanos, up in Dun Morogh, where my mother brews an' worries in equal measure. She thinks hauling's safe work, an' I've decided she can go on thinkin' it." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },

    ironband = {
      lines = { { id = "ir_default", text = "Loud, an' happy, an' always certain the next blast will turn up somethin' wonderful. He's kind tae us haulers, mind, though I think he'd be just as kind tae a pony if it carried powder." },
      },
      choices = {
        { text = "Has he ever found anything?", next = "ironband_found" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironband_found = {
      lines = { { id = "if_default", text = "Rocks, mostly, an' a lot o' angry troggs, an' once a carved stone he wouldnae let anyone touch. He sent it tae Ironforge under guard, an' that was the day I first saw him go quiet." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    nerves = {
      lines = { { id = "ne_default", text = "Can ye blame me? I'm sittin' on enough powder tae flatten a house, an' last week a man I trusted brought axes tae the road. My hands only stop shakin' when they've a rope tae tie." },
      },
      choices = {
        { text = "Fear keeps you alert. Use it.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Then tie something and keep talking.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the south road, the weight o' a barrel, an' that I'll never trust a smile again. Ask me anythin'." } },
    background = { { id = "tp_bg", text = "Kharanos lad, hauler for the League, an' a lot jumpier than I was a month ago.", next = "why" } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend, I only know the road an' the barrels." } },
  },
}

---------------------------------------------------------------------------
-- Lina Hearthstove
---------------------------------------------------------------------------
P:NPC {
  key = "lm_lina", id = TODO_NPC("Lina Hearthstove"), name = "Lina Hearthstove",
  title = "Stable Master",
  bible = "bibles/loch_folk.md", role = "stablemaster", tier = "service",
  communities = { "thelsamar" }, temper = { "hearty", "steady" }, values = { "friendly", "kind" },
  notices = { "pet", "race" },

  impression = {
    first = "Lina Hearthstove keeps the stables outside the Stoutlager Inn, a round, red-cheeked dwarf with straw in her braids and a feed bucket never far from her hand. She talks to the animals first and their owners second.",
    third = "{name} met Lina Hearthstove, Thelsamar's stable master and one of the Hearthstove family who keep the Stoutlager Inn.",
  },

  greetings = {
    { id = "g_stable", text = "Come in, come in, an' shut the gate behind ye, for the rams think every open gate is an invitation tae the loch." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've a stall swept an' a bucket full, so whoever ye're leavin' wi' me will eat better than ye do." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "An' who's this, then? {pet}, is it? Oh, aye, ye're a handsome one, an' ye know it too." },
    { id = "n_hunter", cat = "race", when = { class = "HUNTER", race = "NightElf" },
      text = "A night elf hunter! Yer cats always look at my rams like supper, so I'll put them at opposite ends o' the barn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lina Hearthstove, an' this is my stable, an' those are my rams, an' that's my brother's inn, so ye could say Thelsamar's half Hearthstove by now. What can I do for ye an' yer beast?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good, for I like folk who look after their animals. Bring them in out o' the wind an' tell me what they eat." },
        { id = "h_pet", when = { pet = { named = true } },
          text = "Is that {pet}? Hello, sweetheart, ye've come a long road by the look o' yer paws. Yer {g:lad|lass} there can wait a moment while we say hello." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Talk while I fork this straw, for it'll no' fork itself." },
        { id = "h_again2", text = "Aye? Go on, the rams don't mind." },
      },
      choices = {
        { text = "I'd like to stable an animal.", next = "BUSINESS" },
        { text = "So you're family to the innkeeper?", next = "family" },
        { text = "What are the rams like?", next = "rams" },
        { text = "Any advice for keeping a pet in these hills?", next = "advice", when = { class = "HUNTER" } },
        { text = "Good day, Lina.", next = "END" },
      },
    },
    family = {
      lines = { { id = "fa_default", text = "His sister, an' Vidra's aunt, though she treats me like a younger sister an' bosses me accordingly. Brother pours the stout, Vidra makes the sausages, an' I muck out, which is the job nobody fought me for." },
      },
      choices = {
        { text = "Do you mind it?", next = "family_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_mind = {
      big = true,
      lines = { { id = "fm_default", text = "Not a bit, for animals don't complain about the beer or try tae pay in IOUs. Though there's a dwarf from the dam owes me three weeks' stablin', an' I've half a mind tae keep his ram." },
      },
      choices = {
        { text = "Keep the ram. A debt's a debt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Give him a fair warning first.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
      },
    },
    rams = {
      lines = { { id = "ra_default", text = "Stubborn, loyal, an' cleverer than they let on. They'll climb anythin', eat anythin', an' they've worked out the latch on the feed shed twice this month." },
      },
      choices = {
        { text = "Can I ride one?", next = "rams_ride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams_ride = {
      lines = {
        { id = "rr_default", text = "No' mine, ye can't, for these are boarders. If ye want a ram o' yer own, ye'll need tae see the breeders in Dun Morogh, an' ye'll need a good deal o' coin." },
        { id = "rr_dwarf", when = { race = "Dwarf" }, text = "Ye'll want Veron Amberstill in Dun Morogh for that, for he breeds the best. Save yer silver, {g:lad|lass}, for he doesnae haggle." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "ad_default", text = "Keep them off the dam road at night, for the troggs set snares there. An' if yer beast won't eat, bring it tae me before ye bring it tae a priest." },
      },
      choices = { { text = "Thanks, Lina.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rams, ponies, hunters' beasts an' my family's business, which is everyone's business in Thelsamar." } },
    _none = { { id = "tp_none", text = "Ask my brother, he's the one who listens tae gossip. I only listen tae the rams." } },
  },
}

---------------------------------------------------------------------------
-- Yanni Stoutheart
---------------------------------------------------------------------------
P:NPC {
  key = "lm_yanni", id = TODO_NPC("Yanni Stoutheart"), name = "Yanni Stoutheart",
  title = "General Supplies",
  bible = "bibles/loch_folk.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "brisk", "shrewd" }, values = { "practical" },
  notices = { "kit", "purse" },

  impression = {
    first = "Yanni Stoutheart runs the general goods counter in the Stoutlager Inn: rope, flasks, thread and all the small things people forget until they're halfway up a hill. She knows exactly what you'll need before you do and isn't shy about saying so.",
    third = "{name} met Yanni Stoutheart, who sells general goods inside Thelsamar's Stoutlager Inn.",
  },

  greetings = {
    { id = "g_shop", text = "Ye've forgotten somethin', I can see it on yer face. Rope, is it, or a flask?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for whatever ye forgot last time? It's always the second visit that pays my rent." },
  },

  notice = {
    { id = "n_bags", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Ye're held together wi' string an' hope, by the look o' ye. I sell the string." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Yanni Stoutheart, general goods, an' if it's small an' useful I've likely got it. Flint, flasks, thread, bags, the lot, so tell me where ye're headed an' I'll tell ye what ye've forgotten." },
        { id = "h_low", when = { maxLevel = 15 },
          text = "First trip past the dam? Then ye'll want a bigger bag than that, an' a flask o' water that isnae from the loch, trust me." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've time, the inn's quiet till the miners come in." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What do people forget most?", next = "forget" },
        { text = "What's the talk at the inn?", next = "talk" },
        { text = "Goodbye, Yanni.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "fo_default", text = "Water skins, every time, because they think the loch's right there. Then they drink from it, an' I sell them somethin' for their stomach the next mornin'." },
      },
      choices = {
        { text = "What's wrong with the loch water?", next = "forget_loch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_loch = {
      big = true,
      lines = { { id = "fl_default", text = "Nothin', if ye're a crocolisk. The dam keeps it high an' still, an' still water grows things, so I sell flasks an' let the Light sort out the rest." },
      },
      choices = {
        { text = "You could warn people before they drink it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. Let them learn and buy twice.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    talk = {
      lines = { { id = "ta_default", text = "Troggs, the dam, an' whether Ironband will ever find anythin' but rocks. An' the haulers, these days, for poor Huldar was set on by Dark Irons, an' his own partner was in on it." },
      },
      choices = {
        { text = "I've heard about that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rope, flint, who's buyin' what, an' who hasnae paid. Ask." } },
    _none = { { id = "tp_none", text = "If it doesnae come in a crate, I've no idea, friend." } },
  },
}

---------------------------------------------------------------------------
-- Vrok Blunderblast
---------------------------------------------------------------------------
P:NPC {
  key = "lm_vrok", id = TODO_NPC("Vrok Blunderblast"), name = "Vrok Blunderblast",
  title = "Gunsmith",
  bible = "bibles/loch_folk.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "hearty", "proud" }, values = { "craft" },
  notices = { "class", "race" },

  impression = {
    first = "Vrok Blunderblast is a stocky, half-deaf gunsmith who shouts everything and smells of black powder and gun oil. His family name, he insists, is a mark of honour.",
    third = "{name} met Vrok Blunderblast, Thelsamar's gunsmith, who is loud, proud and slightly deaf from a lifetime of test firing.",
  },

  greetings = {
    { id = "g_shop", text = "EH? Oh, a customer! Come in, come in, an' speak up, for I've been testin' barrels all mornin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last one shoot straight? Course it did, it's a Blunderblast." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Show me that gun. No, I'll no' laugh, I promise, unless it's elven." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vrok Blunderblast, gunsmith, an' the best ye'll find this side o' Ironforge! Every barrel tested by my own hand, which is why I cannae hear a word ye're sayin', so point at what ye want." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, at last! Ye'll want a proper dwarven boomstick, no' some bent stick an' string, so step up an' feel the weight o' this one." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A night elf in a gun shop! I've heard yer lot prefer bows, but there's no shame in tryin' somethin' that actually works." },
      },
      again = {
        { id = "h_again", text = "WHAT ELSE? Sorry, sorry, what else, friend?" },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Blunderblast? That's quite a name.", next = "name" },
        { text = "Guns or bows. Which is better?", next = "bows" },
        { text = "Farewell, Vrok.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "My grandfather earned it at the siege o' Grim Batol, or so he told it, when his gun went off so loud it scared the orcs' wolves off the field. Others say he blew the roof off his own workshop, but I don't listen tae others." },
      },
      choices = {
        { text = "Which story do you believe?", next = "name_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_true = {
      lines = { { id = "nt_default", text = "Both, friend, for he did blow his roof off, an' then he took the same gun tae Grim Batol. A Blunderblast learns from every bang, an' I've the eyebrows tae prove it, or I did once." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    bows = {
      big = true,
      lines = { { id = "bo_default", text = "A bow's a fine thing if ye've the arms an' the patience, an' a gun's a fine thing if ye've neither. Ha! No, I'll say this, a gun does the same job wi' a good deal more ceremony." },
      },
      choices = {
        { text = "Guns. Loud and certain beats quiet and clever.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bows. A good hunter doesn't announce every shot to the valley.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Guns, powder, barrels an' bangs. Ask me about anythin' that goes off." } },
    _none = { { id = "tp_none", text = "EH? No, I've nothin' on that, friend." } },
  },
}
