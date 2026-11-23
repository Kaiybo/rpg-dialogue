-- Alterac Valley, inside the battleground: Dun Baldar and the Stormpike Guard in the north, Frostwolf Keep and
-- the Frostwolf Clan in the south. Voices: bibles/alterac_valley.md
local P = RPGDialogueAPI:Pack("rpgd.battlegrounds")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------------------------------------------
-- STORMPIKE GUARD (Alliance)
---------------------------------------------------------------------------------------------------------------

-- Vanndar Stormpike: General of the Stormpike Guard, commanding from Dun Baldar.
P:NPC {
  key = "bg_vanndar", id = 11948, name = "Vanndar Stormpike",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "major",
  communities = { "stormpike" }, temper = { "proud", "gruff" }, values = { "loyal", "dutiful", "brave" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "He speaks of the valley as Ironforge's by right, and of his soldiers as kin.",
    third = "{name} spoke with General Vanndar Stormpike in the great hall of Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "Soldier! Ye've come tae Dun Baldar in a hard hour, but then, there's never been an easy one in this valley." },
    { id = "g_back", when = { metBefore = true }, text = "Back in my hall, are ye? Good, for the Frostwolves have no' gone anywhere since ye left." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the snow's swallowed a good many o' my lads since. Glad tae see ye standin', soldier." },
    { id = "g_honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "Now there's a name the Guard speaks wi' pride! Come in out o' the wind an' report." },
    { id = "g_horde", when = { faction = "Horde" }, text = "A Frostwolf hound in my own hall? Guards! No, wait, let the fool speak first, for I'd hear what Drek'Thar sends." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "Ye carry yerself like a soldier, an' I've buried enough o' them tae know the look. Stand near the bridge when the wolves come." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } },
      text = "Every Stormpike in this valley knows yer name, an' I'll have it carved on the hall's stone when the war's won." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Vanndar Stormpike, General o' the Stormpike Guard, an' this is Dun Baldar. The Frostwolves want me dead an' the valley emptied o' dwarves, so I'd be grateful if ye'd disappoint them." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A son o' Khaz Modan in my hall! Then ye know what the King's iron means, an' why we'll no' be leavin' this valley." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome o' Gnomeregan, standin' wi' the Guard. Yer people lost their home tae treachery, so ye'll understand why we fight so hard for this one." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One o' the Kaldorei, this far from yer forests. The Arch Druid's kin are welcome here, an' yer bows are welcomer still." },
        { id = "h_battle", tags = { "news" }, when = { questActive = 7142 },
          text = "Ye've come for the battle, then. Strike at Drek'Thar in his keep an' bring this war tae its end, an' I'll drink tae yer name for a month." },
        { id = "h_rank", when = { pvpRank = 6 },
          text = "The Frostwolves know yer face now, {rank}, an' they'll send their best tae find ye. Good; let them find ye standin'." },
      },
      again = {
        { id = "h_again", text = "What else, soldier? Speak quick, for the horns could sound any moment." },
        { id = "h_again2", text = "Aye? Out wi' it." },
        { id = "h_again3", text = "Ask yer question. Dun Baldar's no' goin' anywhere, an' neither am I." },
      },
      choices = {
        { text = "Why is Ironforge fighting for this valley?", next = "claim" },
        { text = "Tell me about the Frostwolves and Drek'Thar.", next = "enemy" },
        { text = "How is the line held, General?", next = "defense" },
        { text = "This hall must have stood a long time.", next = "hall" },
        { text = "What do you need from me?", next = "orders" },
        { text = "I'm Horde, dwarf, and your keep will fall.", next = "horde", when = { faction = "Horde" } },
        { text = "The Guard knows my name, General.", next = "honored", when = { reputation = { faction = "Stormpike Guard", min = "honored" } } },
        { text = "For Ironforge, General.", next = "END" },
      },
    },

    claim = {
      lines = {
        { id = "cl_default", text = "The Stormpike Expedition came up here tae dig, an' we found iron, an' then we found relics older than Ironforge itself under the snow. The King calls the valley a sovereign imperative, an' after what we've seen in the deep, so do I." },
      },
      choices = {
        { text = "What kind of relics?", next = "claim_relics" },
        { text = "The Frostwolves were here first.", next = "claim_first" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    claim_relics = {
      lines = {
        { id = "cr_default", text = "Carvin's in the old stone, an' metal no dwarf has worked in an age, an' the Explorers' League would sell their beards tae see half of it. I'll no' say more, for the Frostwolves have ears in every snowdrift." },
        { id = "cr_dwarf", when = { race = "Dwarf" },
          text = "Ye'll have heard the talk in Ironforge, about the titans an' where we came from. Some o' what lies under this valley might answer it, an' that's why the King will no' let it go." },
      },
      choices = {
        { text = "Then the valley is worth any price.", next = "claim_price" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    claim_price = {
      big = true,
      lines = {
        { id = "cp_default", text = "Any price? I've written too many letters tae widows in Dun Morogh tae say that lightly. It's worth a great deal, an' we're payin' it, an' I'd have ye think about what yer own share might be." },
      },
      choices = {
        { text = "The King commands it. We hold the valley, whatever it costs.", next = "BACK", reply = "Spoken like a Stormpike, an' I'll hold ye tae it when the wolves come over the ridge.", fx = { align = { order = 1 } } },
        { text = "No relic is worth a dwarf's life. Fight for the soldiers instead.", next = "BACK", reply = "Hmph. Ye'd make a poor courtier an' a decent sergeant, an' I'll take a sergeant any day.", fx = { align = { order = -1 } } },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    claim_first = {
      big = true,
      lines = {
        { id = "cf_default", text = "Aye, they were, exiled here by their own warlocks an' left tae starve in the snow, an' they didnae starve, I'll grant them that. But bein' first to a cold place doesnae make the iron beneath it theirs." },
        { id = "cf_warm", when = { disposition = { min = 65 } },
          text = "Between us, I've thought on it in the long nights. The orcs have the better claim tae the snow, an' we've the better claim tae what's under it, an' neither o' us is willin' tae share, so here we are." },
      },
      choices = {
        { text = "Then we take it fairly, on the field, with honor.", next = "BACK", reply = "That's how I'd have it, an' how Drek'Thar would too, I'd wager, which is the one thing we agree on.", fx = { align = { honor = 1 } } },
        { text = "Claims don't matter. Whoever holds it, owns it.", next = "BACK", reply = "Hard words, but no' wrong ones up here, where the snow buries the argument along wi' the arguers.", fx = { align = { honor = -1 } } },
        { text = "Something else, General.", next = "BACK" },
      },
    },

    enemy = {
      lines = {
        { id = "en_default", text = "Drek'Thar's an old blind shaman who sees more than most sighted generals, an' he holds Frostwolf Keep at the valley's south end. His wolves ride fast an' his warriors fight like the cold itself is on their side." },
      },
      choices = {
        { text = "Blind, and he still commands the clan?", next = "enemy_blind" },
        { text = "They say the Warchief himself was born a Frostwolf.", next = "enemy_thrall" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    enemy_blind = {
      lines = {
        { id = "eb_default", text = "He led them after their chieftain Durotan was murdered, an' he raised them up in this snow wi' nothin' but spirits an' stubbornness. I'd no' underestimate a foe like that, an' I've lost good dwarves who did." },
      },
      choices = {
        { text = "You respect him.", next = "enemy_respect" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    enemy_respect = {
      big = true,
      lines = {
        { id = "ers_default", text = "I respect anyone who'll no' break, soldier, an' that old orc hasnae broken in twenty winters. I'll still see his keep in Stormpike hands before I die, mind." },
      },
      choices = {
        { text = "A worthy enemy deserves an honorable fight.", next = "BACK", reply = "Aye, an' he'll get one from my Guard, steel tae steel an' no knives in the dark.", fx = { align = { honor = 1 } } },
        { text = "Respect wins nothing. Strike him however we can.", next = "BACK", reply = "Ye've a cold head on ye, an' the valley rewards that more than I'd like.", fx = { align = { honor = -1 } } },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    enemy_thrall = {
      lines = {
        { id = "et_default", text = "Aye, Durotan's son, an' that's why the whole Horde comes runnin' every time we push south. Thrall would never let his father's clan lose its home, an' I cannae say I'd do different in his boots." },
      },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },

    defense = {
      lines = {
        { id = "df_default", text = "Bunkers an' towers along the road, graveyards for the fallen tae rise at, an' the bridge before this hall. Balinda Stonehearth holds the outpost tae the south, an' my marshals guard these walls, an' if they fall, it's down tae me an' my hammer." },
      },
      choices = {
        { text = "Who are your marshals?", next = "defense_marshals" },
        { text = "And the gryphon riders?", next = "defense_air" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    defense_marshals = {
      lines = {
        { id = "dm_default", text = "Four good dwarves, one for each o' the Dun Baldar bunkers' approaches, an' they'll stand by me tae the last. Keep them alive, soldier, for the Frostwolves cannae reach me while they're standin'." },
      },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },
    defense_air = {
      lines = {
        { id = "da_default", text = "Wing Commanders Ichman, Slidore an' Vipore, an' when the Frostwolves aren't holdin' them prisoner, their gryphons rain death on the south. Bring them the medals o' fallen Frostwolves an' they'll fly for ye." },
      },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },

    hall = {
      lines = {
        { id = "ha_default", text = "Dun Baldar's stone was cut by the Expedition's first masons, an' there's no' a draft in it the forge cannae beat. It's no' Ironforge, but it'll hold till Ironforge comes tae finish the job." },
        { id = "ha_paladin", when = { class = "PALADIN" },
          text = "Ye'll want a word wi' the Light before the battle, {class}, an' this hall's as good a chapel as ye'll find in the snow. Many a dwarf's prayed here an' marched out the better for it." },
      },
      choices = {
        { text = "It smells of forge smoke and bad beer.", next = "hall_beer" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    hall_beer = {
      lines = {
        { id = "hb_default", text = "Ha! Bad beer's the only kind that survives the trip up from Dun Morogh, an' the smoke's Murgot Deepforge, who'd sooner sleep in his forge than in a bed. See him if yer armor's lookin' thin." },
      },
      choices = { { text = "Something else, General.", next = "BACK" } },
    },

    orders = {
      lines = {
        { id = "or_default", text = "Commander Karl Philips will give ye yer marchin' orders, the towers an' graveyards an' mines. The Arch Druid needs storm crystals, Murgot needs armor scraps, an' the Prospector needs someone daft enough tae raid Coldtooth Mine." },
      },
      choices = {
        { text = "I'll take whatever work you have.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, General.", next = "BACK" },
      },
    },

    horde = {
      lines = {
        { id = "hr_default", text = "Bold words in a dwarf's hall. Yer chieftain's sent better than ye up that road an' they're lyin' in the snow wi' Stormpike bolts in their backs, so say yer piece an' go." },
      },
      choices = { { text = "We'll see who's in the snow, General.", next = "END" } },
    },

    honored = {
      lines = {
        { id = "ho_default", text = "Aye, an' I hear it often. Ye've done more for this valley than most who were born in its shadow, an' the Guard does no' forget." },
      },
      choices = {
        { text = "I'll keep earning it, General.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, General.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this valley, its mines an' its enemies better than any dwarf alive. Ask." } },
    background = { { id = "tp_bg", text = "General o' the Stormpike Guard, an' a Stormpike before that, which up here means a dwarf who doesnae know when tae quit." } },
    advice = { { id = "tp_ad", text = "Take the towers, hold the graveyards an' guard the bridge, for the Frostwolves come straight down the middle when they're hungry." } },
    alterac = { { id = "tp_alterac", text = "A kingdom o' traitors once, an' the snow's done well tae bury it. Now it's iron an' relics, an' the King wants both." } },
    magni = { { id = "tp_magni", text = "King Magni sent us up here, an' I'll no' send word tae him that we failed. There's no' a finer king under the mountain." } },
    thrall = { { id = "tp_thrall", text = "Durotan's son, an' a warchief who's kept his Horde out o' the human camps for good, they say. I'd respect him more if he kept his kin out o' my valley." } },
    _none = { { id = "tp_none", text = "That's no' a matter for a general wi' a war tae fight. Ask me about the valley." } },
  },
}

-- Commander Karl Philips: hands out the Stormpike Guard's field orders in Dun Baldar.
P:NPC {
  key = "bg_karl_philips", id = 13320, name = "Commander Karl Philips",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "stern", "dry" }, values = { "dutiful", "disciplined", "loyal" },
  notices = { "soldier" },

  impression = {
    first = "A human officer among dwarves, he treats the valley like a map that bleeds.",
    third = "{name} took orders from Commander Karl Philips in Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "You're reporting for duty, I hope, because I've more ground to take than soldiers to take it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier. Good; the map hasn't gotten any smaller since you left." },
    { id = "g_towers", when = { questActive = 7102 }, text = "The towers and bunkers, soldier. Find the flags, take them, and let our banner fly over the south." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", faction = "Alliance" },
      text = "A warrior who looks like they've held a line before. I'll put you where it's thickest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Karl Philips, and I keep General Vanndar's orders moving out to the field. Towers, graveyards, mines; every one we hold is a step closer to Frostwolf Keep, and every one we lose is a step back." },
        { id = "h_human", when = { race = "Human" },
          text = "Another son of Stormwind or Lordaeron, among all these beards. The dwarves are good company, but I'll admit it's nice to hear a voice without a burr." },
        { id = "h_gy_done", tags = { "news" }, when = { questRecent = { 7081, days = 3 } },
          text = "That graveyard's ours thanks to you, and every soldier who rises there will owe you a step. Well done." },
      },
      again = {
        { id = "h_again", text = "What else? The map's waiting." },
        { id = "h_again2", text = "Go on, soldier, but keep it brief." },
      },
      choices = {
        { text = "What are my orders, Commander?", next = "orders" },
        { text = "Why the graveyards?", next = "graveyards" },
        { text = "You're not a dwarf, Commander.", next = "human" },
        { text = "These orders sound like a lot of dying.", next = "dying" },
        { text = "I'm Lordaeron-born too, Commander. Where did you serve?", next = "lordaeron", when = { race = "Human" } },
        { text = "Dismissed, then.", next = "END" },
      },
    },

    orders = {
      lines = {
        { id = "or_default", text = "Assault a tower or bunker and plant our flag, take a graveyard and hold it, and capture a mine from whoever's sitting in it. Any of those, done well, is worth more to the General than a hundred dead Frostwolves." },
      },
      choices = {
        { text = "Which matters most?", next = "orders_most" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    orders_most = {
      lines = {
        { id = "om_default", text = "The towers, because when they burn the Frostwolf generals lose their guard, and Drek'Thar loses his. The mines feed us, and the graveyards keep us coming, but the towers win wars." },
      },
      choices = {
        { text = "And if the Horde rushes past us?", next = "orders_rush" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    orders_rush = {
      big = true,
      lines = {
        { id = "orr_default", text = "Then it becomes a race, and races are won by whoever's least afraid of losing. I'd rather we fought every yard, myself, but I've seen it done both ways." },
      },
      choices = {
        { text = "Fight for every yard. That's how soldiers win.", next = "BACK", reply = "My thinking exactly. Go and hold something, then.", fx = { align = { order = 1 } } },
        { text = "Forget the yards. Kill their general before they kill ours.", next = "BACK", reply = "Reckless, but not wrong. Just don't leave the General's bridge empty behind you.", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },

    graveyards = {
      lines = {
        { id = "gy_default", text = "Because the Spirit Healers will raise our fallen wherever our banner flies, and a soldier who rises near the front is a soldier who's back in the fight. Stormpike Graveyard, Stonehearth, Snowfall, take them and hold them." },
      },
      choices = {
        { text = "The Frostwolves have Spirit Healers too, I suppose.", next = "graveyards_horde" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },

    human = {
      lines = {
        { id = "hu_default", text = "No, and the General's never held it against me. Ironforge needed officers who'd read a map without beer stains on it, and I needed a war that made sense, so here we both are." },
      },
      choices = {
        { text = "Does it make sense, though?", next = "human_sense" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    human_sense = {
      lines = {
        { id = "hs_default", text = "More than fighting the Scourge in my own fields did, I can tell you that. Here the enemy has a face and a keep, and you can see where the line is." },
      },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },

    dying = {
      lines = {
        { id = "dy_default", text = "It is, and you'll get back up at the graveyard and do it again, which is more than most soldiers in history could say. That's no excuse for carelessness, mind." },
      },
      choices = {
        { text = "Something else, Commander.", next = "BACK" },
        { text = "I've died a few times already.", next = "BACK", reply = "Then you've learned more than the ones who didn't. Back to the map.", when = { pvpRank = 3 } },
        { text = "The Light lifts the fallen, Commander. I'm not afraid.", next = "BACK", reply = "Good, though I'd still rather you came back on your own two feet.", when = { class = "PALADIN" } },
      },
    },
    graveyards_horde = {
      lines = {
        { id = "gh_default", text = "They do, and that's why a graveyard is worth fighting over twice: once to take it, and once to keep their dead from rising on it. Snowfall's changed hands more often than I can count, so don't trust a flag there for long." },
      },
      choices = {
        { text = "How do you keep one, then?", next = "graveyards_hold" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    graveyards_hold = {
      lines = {
        { id = "gd_default", text = "Leave three good soldiers on the flag and let the heroes chase glory elsewhere. Nobody sings about the soldier who stood on a hill all day, but the General notices, and so do I." },
      },
      choices = {
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lo_default", text = "The garrison at Hearthglen, before the Scarlets turned it into their fortress, and then the long road south when the plague took everything else. Most of the men I served with are in the Plaguelands still, and not resting." },
      },
      choices = {
        { text = "Do you ever think of going back?", next = "lordaeron_back" },
        { text = "Let\'s talk of something else.", next = "BACK" },
      },
    },
    lordaeron_back = {
      lines = {
        { id = "lb_default", text = "Every night, soldier, but there's nothing to go back to that the Forsaken or the Crusade haven't claimed. So I hold the Alterac line for Ironforge instead, and I tell myself it's the same war by another road." },
      },
      choices = {
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every tower, bunker and graveyard in this valley, and who's holding it right now." } },
    background = { { id = "tp_bg", text = "A Lordaeron officer once, and the Stormpike Guard's now. The pay's worse but the cause is cleaner." } },
    advice = { { id = "tp_ad", text = "Follow the flags, soldier. Wherever a flag changes hands, that's where the war is." } },
    _none = { { id = "tp_none", text = "Not on my map, soldier. Ask me about the valley." } },
  },
}

-- Stormpike Quartermaster: sells the Guard's gear to those it trusts.
P:NPC {
  key = "bg_stormpike_qm", id = 12096, name = "Stormpike Quartermaster",
  bible = "bibles/alterac_valley.md", role = "quartermaster", tier = "service",
  communities = { "stormpike" }, temper = { "gruff" }, values = { "dutiful", "thrifty" },
  notices = { "reputation" },

  impression = {
    first = "He counts every buckle twice and trusts nobody until the Guard does.",
    third = "{name} browsed the Stormpike Quartermaster's stores in Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "Stores are open, soldier, though what I'll sell ye depends on what the Guard thinks o' ye." },
    { id = "g_honored", when = { reputation = { faction = "Stormpike Guard", min = "revered" } }, text = "Ah, one o' the Guard's best! Come, the good racks are open tae ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Stormpike Quartermaster, keeper o' the Guard's stores. Prove yerself tae the Stormpike an' my racks open up; until then, it's bandages an' the cheap stuff." },
        { id = "h_rep", when = { reputation = { faction = "Stormpike Guard", min = "exalted" } },
          text = "Exalted wi' the Guard! There's nothin' on my shelves ye cannae have, provided ye've the coin for it." },
      },
      again = {
        { id = "h_again", text = "Aye? Anythin' else?" },
        { id = "h_again2", text = "Make it quick, there's a line." },
      },
      choices = {
        { text = "How do I earn the Guard's trust?", next = "trust" },
        { text = "Where do your supplies come from?", next = "supplies" },
        { text = "Just browsing.", next = "END" },
      },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "Fight in the valley, finish what the Commander an' the others ask o' ye, an' kill Frostwolves when they're in front o' ye. The Guard notices, an' so do I." },
      },
      choices = {
        { text = "And then the good gear?", next = "trust_gear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_gear = {
      lines = {
        { id = "tg_default", text = "Then the good gear, at a fair price, an' no' a copper less. I dinnae haggle, soldier, so dinnae try." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = {
        { id = "su_default", text = "Ironforge, mostly, up the long road through the mountains, an' whatever Irondeep Mine coughs up when the troggs leave it be. Some days the Frostwolves get the wagons first, so dinnae ask me for miracles." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every crate an' buckle in Dun Baldar, an' who owes me for which." } },
    _none = { { id = "tp_none", text = "Is it on my shelves? No? Then I've no idea." } },
  },
}

-- Murgot Deepforge: Dun Baldar's smith, who turns armor scraps into better gear for the Guard.
P:NPC {
  key = "bg_murgot", id = 13257, name = "Murgot Deepforge",
  bible = "bibles/alterac_valley.md", role = "blacksmith", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "cheerful" }, values = { "industrious", "proud" },
  notices = { "class" },

  impression = {
    first = "Soot to the elbows, he talks to his anvil more kindly than to most soldiers.",
    third = "{name} brought armor scraps to Murgot Deepforge at the forge of Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "Mind the sparks, {g:lad|lass}! Ye've brought me scraps, I hope, for I'm runnin' low." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The forge remembers ye, an' so do I." },
    { id = "g_scraps", when = { questActive = 7223 }, text = "Armor scraps off the dead Frostwolves, {g:lad|lass}, as many as ye can carry. Their gear's thick, an' I can use every bit." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's a set o' plate that's seen use! Bring it by after, an' I'll tell ye where it's thinnin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Murgot Deepforge, smith tae the Stormpike Guard. Bring me the armor scraps off fallen Frostwolves an' I'll beat them intae somethin' better for our own lads, an' that's a trade I like." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A fellow dwarf! Ye know the smell o' a proper forge, then, an' ye'll know mine's the hottest in the valley." },
        { id = "h_more", tags = { "news" }, when = { questDone = 7223 },
          text = "Them scraps ye brought were good iron, an' there's more where they came from. I'll take every load ye carry." },
      },
      again = {
        { id = "h_again", text = "What else? The iron's coolin'." },
        { id = "h_again2", text = "Aye, aye, out wi' it." },
      },
      choices = {
        { text = "What do you do with Frostwolf scraps?", next = "scraps" },
        { text = "You make more than armor, I hear.", next = "upgrades" },
        { text = "How long have you been in this valley?", next = "valley" },
        { text = "Do you know smithing, Murgot? Real smithing?", next = "smith", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Keep the fire hot, smith.", next = "END" },
      },
    },

    scraps = {
      lines = {
        { id = "sc_default", text = "Melt them down, sort the good from the rubbish, an' it all goes intae the Guard's gear. Orcish iron's crude but there's plenty of it, an' I'd rather it on our backs than theirs." },
      },
      choices = {
        { text = "Wearing the enemy's armor seems wrong.", next = "scraps_wrong" },
        { text = "Something else, Murgot.", next = "BACK" },
      },
    },
    scraps_wrong = {
      big = true,
      lines = {
        { id = "sw_default", text = "Wrong? It's iron, {g:lad|lass}, an' iron doesnae care who it's served. Mind, some o' the lads feel like ye do, an' I don't tell them where their buckles came from." },
      },
      choices = {
        { text = "Take what the dead don't need. That's war.", next = "BACK", reply = "Aye, an' the dead have never once complained about it.", fx = { align = { light = -1 } } },
        { text = "The dead deserve respect, even Frostwolf dead.", next = "BACK", reply = "Fair, fair. I'll say a word over the next load, if it makes ye feel better.", fx = { align = { light = 1 } } },
        { text = "Something else, Murgot.", next = "BACK" },
      },
    },

    upgrades = {
      lines = {
        { id = "up_default", text = "When enough scraps come in, I can outfit the Guard's own troops in better plate, an' the bunkers fight harder for it. The more ye bring, the tougher our lads get, an' the Frostwolves will notice it." },
      },
      choices = {
        { text = "Then I'll bring you more.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Murgot.", next = "BACK" },
      },
    },

    valley = {
      lines = {
        { id = "va_default", text = "Since the Expedition came up, an' I carried the first anvil myself, on my back, through the pass. My knees havenae forgiven me yet." },
      },
      choices = {
        { text = "You carried an anvil through the mountains?", next = "valley_anvil" },
        { text = "Something else, Murgot.", next = "BACK" },
      },
    },
    valley_anvil = {
      lines = {
        { id = "vn_default", text = "Well, half o' one, an' Regzar's lot stole the other half in the first raid, or so I tell the young ones. The truth's duller, but it doesnae make as good a story." },
      },
      choices = { { text = "Something else, Murgot.", next = "BACK" } },
    },

    smith = {
      lines = {
        { id = "sm_default", text = "Real smithin'? I was beatin' iron in Ironforge's Great Forge while yer grandparents were learnin' tae walk. Mind yer tongue near the fire, {class}." },
      },
      choices = { { text = "Something else, Murgot.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Iron, fire an' the fit o' armor. Everythin' else is someone else's business." } },
    background = { { id = "tp_bg", text = "A smith o' the Great Forge, before Vanndar asked for one who didnae mind the cold." } },
    _none = { { id = "tp_none", text = "Cannae hear ye over the anvil. Ask me about iron." } },
  },
}

-- Prospector Stonehewer: inside the valley, sends Stormpike soldiers to raid Coldtooth Mine.
P:NPC {
  key = "bg_stonehewer", id = 13816, name = "Prospector Stonehewer",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "cheerful", "greedy" }, values = { "industrious", "curious" },
  notices = { "race" },

  impression = {
    first = "He sees the valley as a ledger of ore, and the war as a delay.",
    third = "{name} spoke with Prospector Stonehewer about the mines of Alterac Valley.",
  },

  greetings = {
    { id = "g_default", text = "Ye've the look o' someone who could carry a crate! Come here, come here, I've work for ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more crates? Good; the mines havenae run dry yet." },
    { id = "g_cold", when = { questActive = 6982 }, text = "Coldtooth's supplies, {g:lad|lass}, from the mine down south. The Frostwolves will no' miss what they don't know they've lost." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Prospector Stonehewer, an' I came up here tae find iron, no' tae fight a war. Still, there's two mines in this valley an' the Frostwolves are sittin' on one o' them, so there's crates tae be taken." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ah, a dwarf! Ye'll know a good seam when ye smell it, an' Coldtooth's got a fine one wasted on kobolds an' orcs." },
        { id = "h_done", tags = { "news" }, when = { questDone = 6982 },
          text = "Them Coldtooth crates were a treat, an' the Quartermaster's been smilin' since, which I didnae think he could do." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've crates tae count." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "Tell me about the mines.", next = "mines" },
        { text = "What's in those supply crates?", next = "crates" },
        { text = "You seem more interested in ore than war.", next = "ore" },
        { text = "Didn't I see you at the valley's gate?", next = "gate" },
        { text = "A gnome could rig you a drill that triples your yield.", next = "gnome", when = { race = "Gnome" } },
        { text = "I'll get you your crates.", next = "END" },
      },
    },

    mines = {
      lines = {
        { id = "mi_default", text = "Irondeep, up near us, where the troggs crawl out o' the deep, an' Coldtooth, down by the Frostwolves, full o' kobolds. Whoever holds a mine gets its supplies, an' supplies win wars as surely as axes." },
      },
      choices = {
        { text = "Troggs this far north?", next = "mines_troggs" },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    mines_troggs = {
      lines = {
        { id = "mt_default", text = "Troggs everywhere we dig, these days, Uldaman an' Gnomeregan an' now here. Some o' the Explorers' League folk say they're tied tae the old relics somehow, an' I say they're a nuisance either way." },
      },
      choices = {
        { text = "Maybe we should stop digging so deep.", next = "mines_deep" },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    mines_deep = {
      big = true,
      lines = {
        { id = "md_default", text = "Stop diggin'? Ye might as well ask a dwarf tae stop breathin'. Mind, every time we go deeper somethin' comes up tae meet us, an' I've started tae wonder about that." },
      },
      choices = {
        { text = "Dig. Whatever's down there belongs to Ironforge.", next = "BACK", reply = "That's the spirit, an' the King would say the same.", fx = { align = { order = 1 } } },
        { text = "Some things are buried for a reason. Leave them.", next = "BACK", reply = "Ye sound like an old priest, {g:lad|lass}, but I'll no' say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },

    crates = {
      lines = {
        { id = "cr_default", text = "Ore, tools, food, whatever the miners haul up an' pack away. Bring Coldtooth's crates back tae me an' it's theirs no more, it's ours." },
      },
      choices = {
        { text = "And who gets the crates once they're here?", next = "crates_who" },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Course I am! The war's the General's business. Mine's what's under the snow, an' when the fightin's done, someone'll still need tae dig it out." },
      },
      choices = {
        { text = "You've already staked claims for after the war, haven't you?", next = "ore_claims" },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },

    gate = {
      lines = {
        { id = "ga_default", text = "Ye might have; I'm up an' down that road more than the supply wagons. The gate's for gettin' soldiers in, though, an' in here's where the ore is." },
      },
      choices = { { text = "Something else, Prospector.", next = "BACK" } },
    },
    crates_who = {
      lines = {
        { id = "cw_default", text = "The Stormpike Quartermaster takes the lot an' doles it out, an' Murgot Deepforge at the forge grumbles that he never sees enough iron. Between the two o' them, I'm the most popular dwarf in Dun Baldar, an' it's no' for my singin'." },
      },
      choices = {
        { text = "Does the Guard pay you for them?", next = "crates_pay" },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    crates_pay = {
      lines = {
        { id = "cp_default", text = "Pay? The General pays in thanks an' the odd slap on the back, {g:lad|lass}. My reward's the seam itself, once the orcs are gone an' the kobolds are cleared out o' Coldtooth." },
      },
      choices = {
        { text = "Somethin' else, then.", next = "BACK" },
      },
    },
    ore_claims = {
      lines = {
        { id = "oc_default", text = "Ha! Caught me. I've a map wi' every seam marked, an' my name's on half o' them in pencil, which is near as good as ink in this cold. Don't tell the General, for he thinks I'm here for king an' country." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", reply = "Good {g:lad|lass}! There'll be a crate in it for ye someday, or a kind word at least." },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Triples it, does it? I've heard that afore, from a gnome who's still pickin' gears out o' his beard. Mind, if yer drill works, I'd split the first cart wi' ye, an' I've no' said that tae anyone since Gnomeregan went sour." },
      },
      choices = {
        { text = "Let\'s talk of something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ore, seams, mines an' how much a crate weighs. That's my whole trade." } },
    _none = { { id = "tp_none", text = "Does it have ore in it? No? Then I cannae help ye." } },
  },
}

-- Arch Druid Renferal: summons Ivus the Forest Lord from Storm Crystals the Guard gathers.
P:NPC {
  key = "bg_renferal", id = 13442, name = "Arch Druid Renferal",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike", "cenarion" }, temper = { "calm", "stern" }, values = { "balance", "wise" },
  notices = { "class", "race" },

  impression = {
    first = "A Kaldorei druid among dwarves, she speaks of the valley as a wound in the wild.",
    third = "{name} spoke with Arch Druid Renferal about Ivus the Forest Lord.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. The valley is loud with steel, but the old forests here are still listening." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you brought the crystals, or only more questions?" },
    { id = "g_crystal", when = { questActive = 7386 }, text = "The storm crystals, gathered from the fallen Frostwolves. Each one carries the strength Ivus needs to answer." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, walking in this frozen place. Then you can feel it too, the forest lord stirring beneath the snow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Renferal, Arch Druid, and I stand with the Stormpike for my own reasons. Bring me the storm crystals the Frostwolves carry, and when there are enough, I will call Ivus the Forest Lord to fight beside us." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A sister of Elune, so far from Ashenvale. You know what it costs me to ask an ancient to make war, and you know I would not ask lightly." },
        { id = "h_ivus", tags = { "news" }, when = { questDone = 6881 },
          text = "Ivus walked because of you, and the Frostwolves will remember his footsteps for a long time." },
      },
      again = {
        { id = "h_again", text = "Speak; I am listening." },
        { id = "h_again2", text = "What else troubles you?" },
      },
      choices = {
        { text = "Who is Ivus the Forest Lord?", next = "ivus" },
        { text = "What are the storm crystals?", next = "crystals" },
        { text = "Why does a druid fight for dwarves?", next = "why" },
        { text = "I walk the Dream's path too, Arch Druid.", next = "druid", when = { class = "DRUID" } },
        { text = "Elune keep you, Arch Druid.", next = "END" },
      },
    },

    ivus = {
      lines = {
        { id = "iv_default", text = "An ancient of the forest, old and slow and patient, who sleeps in the green places of these mountains. When he wakes and walks, the earth itself fights for whoever called him." },
      },
      choices = {
        { text = "And the Frostwolves have their own spirit?", next = "ivus_lok" },
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    ivus_lok = {
      lines = {
        { id = "il_default", text = "Lokholar, the Ice Lord, an elemental of the winter that their shaman wake with the blood of our fallen. Where Ivus walks, the forest wakes, and where Lokholar walks, everything freezes." },
      },
      choices = {
        { text = "Using spirits for war seems dangerous.", next = "ivus_danger" },
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    ivus_danger = {
      big = true,
      lines = {
        { id = "id_default", text = "It is, and I do not do it gladly, for an ancient is not a weapon. But the Frostwolves have already woken the Ice Lord, and I will not let the cold walk unopposed." },
      },
      choices = {
        { text = "The forest should not be bent to war at all.", next = "BACK", reply = "Malfurion would agree with you, and perhaps one day so will I.", fx = { align = { light = 1 } } },
        { text = "Use every power we have. The enemy does.", next = "BACK", reply = "That is the reasoning that drove the Highborne to ruin, but it is also why I am here.", fx = { align = { light = -1 } } },
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },

    crystals = {
      lines = {
        { id = "cy_default", text = "Shards of the storm that gather in the Frostwolves' totems and on their dead, full of the valley's wild power. A great many of them are needed, for Ivus does not wake for a trickle." },
      },
      choices = { { text = "Something else, Arch Druid.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wh_default", text = "I do not fight for dwarves, I fight for the Alliance, and the Alliance's cause here happens to wear a beard. And the Frostwolves have bent this valley's spirits to their will, which I cannot ignore." },
      },
      choices = { { text = "Something else, Arch Druid.", next = "BACK" } },
    },

    druid = {
      lines = {
        { id = "dr_default", text = "Then you will understand what I cannot say to the dwarves: that this valley hurts, and that every battle opens the wound a little wider. Walk gently, even here." },
      },
      choices = { { text = "Something else, Arch Druid.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The spirits of these mountains, the ancients asleep in them, and the cost of waking either." } },
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle, trained in Moonglade, who came north when the Alliance asked." } },
    _none = { { id = "tp_none", text = "That is beyond the forest's concern, and mine." } },
  },
}

-- Sergeant Durgen Stormpike: leads the Stormpike Ram Riders.
P:NPC {
  key = "bg_durgen", id = 13777, name = "Sergeant Durgen Stormpike",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "proud" }, values = { "loyal", "brave" },
  notices = { "class" },

  impression = {
    first = "He smells of ram and rides like he was born in the saddle.",
    third = "{name} spoke with Sergeant Durgen Stormpike about the Stormpike Ram Riders.",
  },

  greetings = {
    { id = "g_default", text = "Mind the rams, {g:lad|lass}, they bite! Ye here tae help me fill these stables?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The rams have missed ye, which is more than they've ever said about me." },
    { id = "g_stables", when = { questActive = 7027 }, text = "The Alterac rams are out in the hills, wild an' angry. Tame one an' bring it back here tae the stables." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye'll know how tae talk tae a beast, then, which is half the trick wi' a ram." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Durgen Stormpike, Ram Rider commander, though my stables are a sorry sight right now. Bring me wild rams an' Frostwolf hides for harnesses, an' I'll have a cavalry chargin' down that valley." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf who'll know a ram when ye see one! Ye've ridden in Dun Morogh, I'll wager, an' ye'll find these Alterac beasts a sight meaner." },
        { id = "h_harness", tags = { "news" }, when = { questActive = 7026 },
          text = "Frostwolf hides, soldier, from the wolves they ride. Their own beasts will make our harnesses, an' I find that fittin'." },
      },
      again = {
        { id = "h_again", text = "Aye? The rams are waitin'." },
        { id = "h_again2", text = "Speak up, I'm half deaf from the bleatin'." },
      },
      choices = {
        { text = "Why are the stables empty?", next = "stables" },
        { text = "What are the Ram Riders?", next = "riders" },
        { text = "Are you kin to the General?", next = "kin" },
        { text = "I can tame a beast, Sergeant.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll find your rams.", next = "END" },
      },
    },

    stables = {
      lines = {
        { id = "st_default", text = "The Frostwolves killed half my mounts in the last push, an' the rest got loose in the snow. There's wild Alterac rams in the hills that'll do, if ye can tame one without losin' a hand." },
      },
      choices = {
        { text = "Killing the mounts was a cowardly thing.", next = "stables_cowardly" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    stables_cowardly = {
      big = true,
      lines = {
        { id = "sc_default", text = "Cowardly or clever, depends who ye ask, an' I'll grant it slowed us right down. I'd have done the same tae their wolves, if I'm honest." },
      },
      choices = {
        { text = "Then do it. Kill their wolves and slow them.", next = "BACK", reply = "Hah, ye've a cold heart for a {race}, but ye'll do well up here.", fx = { align = { honor = -1 } } },
        { text = "Beasts don't choose sides. Fight the riders, not the mounts.", next = "BACK", reply = "Fair words, an' I'll try tae keep them, though I'll no' promise.", fx = { align = { honor = 1 } } },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },

    riders = {
      lines = {
        { id = "ri_default", text = "Stormpike dwarves on ram-back, chargin' through the Frostwolf lines wi' axes swingin'. When the stables are full an' the harnesses made, I'll lead them out, an' the snow'll shake." },
      },
      choices = { { text = "Something else, Sergeant.", next = "BACK" } },
    },

    kin = {
      lines = {
        { id = "ki_default", text = "We're all Stormpikes up here, by clan if no' by close blood, an' the General's never asked me tae prove it. I'll say he's a fine dwarf an' leave the family tree tae the scribes." },
      },
      choices = { { text = "Something else, Sergeant.", next = "BACK" } },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Then ye're more use tae me than ten warriors! Go gentle wi' the rams, an' if one takes a likin' tae ye, I'll no' tell the stables." },
      },
      choices = { { text = "Something else, Sergeant.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rams, riding an' the fastest way down the valley. Ask." } },
    _none = { { id = "tp_none", text = "That's no' a ram's concern, so it's no' mine." } },
  },
}

-- Wing Commander Ichman: Stormpike gryphon commander, called to strike with Frostwolf commander's medals.
P:NPC {
  key = "bg_ichman", id = 13437, name = "Wing Commander Ichman",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "stormpike", "wildhammer" }, temper = { "fierce", "proud" }, values = { "brave", "loyal" },
  notices = { "class" },

  impression = {
    first = "A gryphon rider who'd rather be in the sky than in any hall.",
    third = "{name} met Wing Commander Ichman of the Stormpike gryphon riders.",
  },

  greetings = {
    { id = "g_default", text = "Free at last, an' yer the one tae thank for it! Now let's give the Frostwolves somethin' tae look up at." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier! The sky's clear an' my riders are restless." },
    { id = "g_quest", when = { questActive = 6943 }, text = "Bring me the medals o' Frostwolf commanders, an' my fleet will fly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Ichman, o' the Stormpike's gryphon riders, an' I spent far too long in a Frostwolf cell. Bring me medals from fallen Frostwolf commanders, an' I'll call down an air strike they'll talk about in Orgrimmar." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ye'll have seen gryphons over the Hinterlands, I'll wager, an' mine fly just as proud." },
      },
      again = {
        { id = "h_again", text = "Aye? Speak while I'm on the ground." },
        { id = "h_again2", text = "What else, soldier?" },
      },
      choices = {
        { text = "How did you end up a prisoner?", next = "prisoner" },
        { text = "Why commanders' medals?", next = "medals" },
        { text = "What's it like, flying a gryphon?", next = "flying" },
        { text = "I've tamed beasts of my own. How do you train a gryphon?", next = "gryphon_train", when = { class = "HUNTER" } },
        { text = "I'll bring your medals.", next = "END" },
      },
    },

    prisoner = {
      lines = {
        { id = "pr_default", text = "Shot out o' the sky over the Frostwolf towers, an' dragged intae a cell before I could get up. My gryphon flew home, the coward, an' I'll have words wi' him." },
      },
      choices = {
        { text = "How did they treat you?", next = "prisoner_treat" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    prisoner_treat = {
      lines = {
        { id = "pt_default", text = "Better than I'd feared, I'll admit; cold food an' colder stone, but no worse. Orcs keep their prisoners alive, it seems, which is more than I'd heard." },
      },
      choices = {
        { text = "Maybe orcs aren't the brutes we think.", next = "prisoner_orcs" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    prisoner_orcs = {
      big = true,
      lines = {
        { id = "po_default", text = "Maybe no', though they'd still have killed me in the field, an' I'd have done the same. War's a strange business, soldier." },
      },
      choices = {
        { text = "They showed mercy. We should do the same.", next = "BACK", reply = "Aye, if the chance comes, I'll try. No promises from the air, mind.", fx = { align = { light = 1 } } },
        { text = "They kept you alive for ransom. Show them nothing.", next = "BACK", reply = "Ye may be right, an' it'll make the strike easier tae fly.", fx = { align = { light = -1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    medals = {
      lines = {
        { id = "me_default", text = "Proof that the Frostwolf commanders are fallin', an' that my riders aren't flyin' intae a full army. Enough medals, an' I'll know the way's clear." },
      },
      choices = {
        { text = "And when you have enough, what does the strike hit?", next = "medals_strike" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    flying = {
      lines = {
        { id = "fl_default", text = "Cold, loud an' the finest thing in the world! Ye've no' lived till ye've seen Frostwolf Keep from above, burnin'." },
      },
      choices = {
        { text = "You miss that gryphon of yours, coward or not.", next = "flying_miss" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    medals_strike = {
      lines = {
        { id = "ms_default", text = "The towers first, Tower Point an' the Iceblood, where their archers have been pluckin' my riders out o' the air all season. Once they're burnin', the way tae Frostwolf Keep is open for everyone below." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    flying_miss = {
      lines = {
        { id = "fm_default", text = "Aye, I do, an' don't ye tell him. He was hatched in the Hinterlands an' came tae me half-wild, an' he's never once flown away from a fight before that day, so I suppose he'd earned one." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    gryphon_train = {
      lines = {
        { id = "gt_default", text = "Ye don't train a gryphon, {class}, ye earn one, an' that takes a year o' raw meat an' bitten fingers. A hunter's beast follows ye because ye feed it; a gryphon follows ye because it's decided ye're worth followin'." },
      },
      choices = {
        { text = "Then I hope mine decides the same of me.", next = "BACK", reply = "If it's stayed this long, it already has. Look after it." },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The sky above this valley, an' every arrow tower that's ever tried tae knock me out of it." } },
    _none = { { id = "tp_none", text = "Cannae say. I was in the air at the time." } },
  },
}

-- Wing Commander Slidore: Stormpike gryphon commander, called to strike with Frostwolf lieutenant's medals.
P:NPC {
  key = "bg_slidore", id = 13438, name = "Wing Commander Slidore",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "stormpike", "wildhammer" }, temper = { "cheerful", "proud" }, values = { "brave", "loyal" },
  notices = { "class" },

  impression = {
    first = "Grinning through the frostbite, he treats a rescue like a free drink.",
    third = "{name} met Wing Commander Slidore of the Stormpike gryphon riders.",
  },

  greetings = {
    { id = "g_default", text = "Ye got me out! I'd buy ye an ale if Dun Baldar had any worth the name." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my rescuer! What can I do for ye now, soldier?" },
    { id = "g_quest", when = { questActive = 6942 }, text = "Frostwolf lieutenants' medals, soldier. Bring me enough, an' my fleet's in the air." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Slidore, gryphon rider an' former guest o' the Frostwolves. Bring me medals off their lieutenants, an' I'll send my fleet tae burn whatever ye point at." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! I've a gryphon that'd carry ye an' three o' yer friends, if ye fancy a flight after the war." },
      },
      again = {
        { id = "h_again", text = "What else, soldier?" },
        { id = "h_again2", text = "Speak, before the wind changes." },
      },
      choices = {
        { text = "How did you end up in a Frostwolf cell?", next = "capture" },
        { text = "Why lieutenants' medals?", next = "medals" },
        { text = "What do you think of the other commanders?", next = "others" },
        { text = "I'll hold you to that flight, Wing Commander.", next = "gnome_flight", when = { race = "Gnome" } },
        { text = "I'll find you medals.", next = "END" },
      },
    },

    capture = {
      lines = {
        { id = "ca_default", text = "Flew too low over Iceblood, chasin' a wolf rider, an' their archers didnae miss. Embarrassin', but I'm alive tae tell it." },
      },
      choices = {
        { text = "That was reckless.", next = "capture_reckless" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    capture_reckless = {
      lines = {
        { id = "cr_default", text = "It was, an' the General said so at some length. But that wolf rider's no' ridin' anymore, so I'd call it a draw." },
      },
      choices = {
        { text = "Was one rider worth your capture?", next = "capture_worth" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    capture_worth = {
      big = true,
      lines = {
        { id = "cw_default", text = "Worth it tae me, at the time, an' maybe no' tae the soldiers who had tae fight their way in tae get me. What do ye think, since ye were one o' them?" },
      },
      choices = {
        { text = "Fight boldly. The valley rewards nerve.", next = "BACK", reply = "Ha! Ye'd make a good rider, so ye would.", fx = { align = { order = -1 } } },
        { text = "Follow orders, Commander. Others paid for your daring.", next = "BACK", reply = "Fair, fair, an' I'll fly higher next time.", fx = { align = { order = 1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    medals = {
      lines = {
        { id = "me_default", text = "Lieutenants lead the Frostwolf lines, an' when they're fallin', the lines are thinnin'. Enough medals, an' I'll know it's safe for my riders tae strike." },
      },
      choices = {
        { text = "You're very calm about going straight back out there.", next = "medals_calm" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    others = {
      lines = {
        { id = "ot_default", text = "Ichman's the best flier o' us an' knows it, an' Vipore's the cleverest an' never stops sayin' so. I'm the handsome one, obviously." },
      },
      choices = {
        { text = "And the Frostwolf wing commanders?", next = "others_horde" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    medals_calm = {
      lines = {
        { id = "mc_default", text = "Calm? I'm terrified, soldier, but a rider who shows it makes his gryphon nervous, an' a nervous gryphon's how ye end up in a cell. So I grin, an' the beast thinks it's all a lark." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    others_horde = {
      lines = {
        { id = "oh_default", text = "Guse, Jeztor an' Mulverick, an' our lads have had each o' them locked up at one time or another, same as they've had us. It's near a tradition by now, swappin' prisoners an' insults across the Field o' Strife." },
      },
      choices = {
        { text = "Do you respect them?", next = "others_respect" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    others_respect = {
      lines = {
        { id = "or_default", text = "I'd no' say it in Vanndar's hearing, but aye, I do. Anyone who'll ride one o' those wyverns intae dwarven guns has more nerve than sense, an' I'd know." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    gnome_flight = {
      lines = {
        { id = "gf_default", text = "An' I'll keep it, {g:lad|lass}, though ye'll need tae strap yerself down, for the last gnome I flew went sailin' off over Ironforge an' landed in a forge. He said it was the best day o' his life, so I count it a success." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Flyin', fightin', an' where the Frostwolves keep their prisoners." } },
    _none = { { id = "tp_none", text = "No idea, soldier. Ask someone with their feet on the ground." } },
  },
}

-- Wing Commander Vipore: Stormpike gryphon commander, called to strike with Frostwolf soldiers' medals.
P:NPC {
  key = "bg_vipore", id = 13439, name = "Wing Commander Vipore",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "stormpike", "wildhammer" }, temper = { "dry", "proud" }, values = { "cunning", "loyal" },
  notices = { "class" },

  impression = {
    first = "Sharp-eyed and dry, he plans an air strike like a game of stones.",
    third = "{name} met Wing Commander Vipore of the Stormpike gryphon riders.",
  },

  greetings = {
    { id = "g_default", text = "You're the one who opened my cell. My thanks; now let's put that freedom to use." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I have plans that need a pair of hands." },
    { id = "g_quest", when = { questActive = 6941 }, text = "Medals off common Frostwolf soldiers. Many of them; the common soldier is the backbone of any army." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Vipore, of the Stormpike gryphon fleet, and recently a prisoner of the Frostwolves. Bring me the medals of their soldiers, and when the count is high enough, my riders will strike at their heart." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue. You'll understand that the best strike is the one they never see coming, and so will my gryphons." },
      },
      again = {
        { id = "h_again", text = "Yes? Make it count." },
        { id = "h_again2", text = "Go on, then, and make it brief." },
      },
      choices = {
        { text = "What's your plan, Wing Commander?", next = "plan" },
        { text = "Why soldiers' medals?", next = "medals" },
        { text = "The Wildhammer and the Stormpike fight together?", next = "wildhammer" },
        { text = "Strike unseen and be gone before they turn. I know that work.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll gather your medals.", next = "END" },
      },
    },

    plan = {
      lines = {
        { id = "pl_default", text = "Strike where they're weakest, when they're busy elsewhere, and be gone before the archers turn. It's simple, and it works because they never expect it." },
      },
      choices = {
        { text = "Hit and run. Not much honor in it.", next = "plan_honor" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    plan_honor = {
      big = true,
      lines = {
        { id = "ph_default", text = "Honor's for duels, not wars. The orcs fight with their spirits and their wolves, and I fight with the sky; neither of us is playing fair." },
      },
      choices = {
        { text = "Winning matters. Strike however you can.", next = "BACK", reply = "Exactly, and you would make a fine strategist.", fx = { align = { honor = -1 } } },
        { text = "Even in war, we should face our enemy.", next = "BACK", reply = "Spoken like a paladin. I'll keep that in mind, though I'll keep flying, too.", fx = { align = { honor = 1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    medals = {
      lines = {
        { id = "me_default", text = "Soldiers are the many, and when enough of them fall, the few have no one to command. Count the medals and you count the gaps in their line." },
      },
      choices = {
        { text = "You count soldiers the way a merchant counts coin.", next = "medals_coin" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    wildhammer = {
      lines = {
        { id = "wi_default", text = "Some of my riders learned from the Wildhammer, and the clans have their quarrels, but a gryphon doesn't care whose beard is braided which way. Up here we fly together or not at all." },
      },
      choices = {
        { text = "Does Aerie Peak send riders to this valley?", next = "wildhammer_aerie" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    medals_coin = {
      lines = {
        { id = "mc_default", text = "I do, and I'd sooner be called cold than careless. A merchant who loses count goes broke, and a wing commander who loses count sends his riders into arrows that weren't supposed to be there." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    wildhammer_aerie = {
      lines = {
        { id = "wa_default", text = "Not officially, for Thane Falstad has his own troubles with the trolls of the Hinterlands. But a few of his riders have found their way here for the fighting, and nobody at Dun Baldar has thought to ask them to leave." },
      },
      choices = {
        { text = "And the Bronzebeards don't mind?", next = "wildhammer_mind" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    wildhammer_mind = {
      lines = {
        { id = "wm_default", text = "They mind a great deal over ale and not at all in a battle, which is the right way round. When the Frostwolves are gone they'll go back to arguing about the Three Hammers, and I'll be glad to hear it." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Then you'll understand why I like having you on the ground, {class}. The Frostwolves watch the sky now that they know about us, and while they're watching it, they aren't watching the shadows behind their towers." },
      },
      choices = {
        { text = "Point me at a tower, then.", next = "BACK", reply = "Tower Point. Light the flag while they're looking up, and I'll do the rest." },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Tactics, gryphons, and the weak points of every tower in the south." } },
    _none = { { id = "tp_none", text = "Irrelevant to the battle. Ask me something useful." } },
  },
}

---------------------------------------------------------------------------------------------------------------
-- FROSTWOLF CLAN (Horde)
---------------------------------------------------------------------------------------------------------------

-- Drek'Thar: blind elder shaman of the Frostwolves, commanding from Frostwolf Keep.
P:NPC {
  key = "bg_drekthar", id = 11946, name = "Drek'Thar",
  prejudice = { race = "Scourge", amount = 5, why = "An old shaman's unease at spirits that do not rest." },
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "major",
  communities = { "frostwolf" }, temper = { "calm", "proud" }, values = { "honorable", "wise", "loyal" },
  notices = { "class", "reputation" },

  impression = {
    first = "Blind, he turns toward you before you speak, as if the wind told him your name.",
    third = "{name} stood before Drek'Thar, elder shaman of the Frostwolves, in Frostwolf Keep.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "The spirits whisper that something walks here which should be resting. Speak, Forsaken, for the Warchief calls you ally, and I will listen." },
    { id = "g_default", text = "I hear your footsteps, and the spirits tell me the rest. Come closer, {class}; the keep is cold, but you are welcome in it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The wind spoke of you while you were gone." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the Stormpike dug deeper in your absence. I am glad the snow did not take you." },
    { id = "g_honored", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } }, text = "A friend of the clan. Sit, if you wish, and speak; the clan owes you that much." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A Stormpike hound, standing in my keep. Speak, if you came to speak, for my warriors are not as patient as I." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The elements walk with you, young one. I feel it, as I felt it in Thrall when he first came to us." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "Frostwolf Clan", min = "exalted" } },
      text = "The clan sings of you by its fires. Even blind, I see the honor you have earned." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Drek'Thar, elder of the Frostwolf Clan, and this valley has been our home since Gul'dan cast us out. The Stormpike would dig out its heart for their king, and I will not allow it while I draw breath." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, and you smell of the camps' long shadow, or of the freedom after it. Either way, you are welcome among your clan's kin." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of the Earth Mother's children, in the cold. The spirits of this valley know the shu'halo, and they welcome you as I do." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear. Thrall told me of Sen'jin's sacrifice, and the Frostwolves honor it." },
        { id = "h_battle", tags = { "news" }, when = { questActive = 7142 },
          text = "You fight for the valley, then. Strike down Vanndar in his hall, and the Stormpike will remember why the Frostwolves never left." },
        { id = "h_rank", when = { pvpRank = 6 },
          text = "The Stormpike speak your name, {rank}, and it carries on the wind even to me. Good; let them fear it." },
      },
      again = {
        { id = "h_again", text = "Speak, young one. I am listening." },
        { id = "h_again2", text = "What else does your heart carry?" },
        { id = "h_again3", text = "The wind waits; so do I." },
      },
      choices = {
        { text = "Tell me of the Frostwolf Clan.", next = "clan" },
        { text = "You knew Thrall when he was young?", next = "thrall" },
        { text = "Why do the Stormpike want this valley?", next = "stormpike" },
        { text = "How do you see, Elder?", next = "blind" },
        { text = "What must be done to hold the valley?", next = "orders" },
        { text = "Teach me of the spirits, Elder.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'm Alliance, orc. Your keep will fall.", next = "alliance", when = { faction = "Alliance" } },
        { text = "For the Frostwolves, Elder.", next = "END" },
      },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "We spoke against Gul'dan when the rest of the Horde drank demon blood, and he exiled us here for it. Durotan led us through the snow, and we learned to ride wolves and listen to the spirits, and we survived." },
      },
      choices = {
        { text = "What happened to Durotan?", next = "clan_durotan" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    clan_durotan = {
      lines = {
        { id = "cd_default", text = "He left the valley to warn Orgrim Doomhammer of Gul'dan's treachery, and he and Draka were murdered by Gul'dan's assassins. Their son was taken by humans, and we did not know it for many years." },
      },
      choices = {
        { text = "That's a heavy debt to carry.", next = "clan_debt" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    clan_debt = {
      big = true,
      lines = {
        { id = "cdb_default", text = "It is not a debt, it is a memory, and the clan keeps it. Durotan died because he would not bow to darkness, and the Frostwolves will not bow to dwarves." },
      },
      choices = {
        { text = "Honor his memory by fighting with honor.", next = "BACK", reply = "Spoken as a Frostwolf would. Durotan would have welcomed you.", fx = { align = { honor = 1 } } },
        { text = "Memory won't win the valley. Strength will.", next = "BACK", reply = "Strength, yes, but strength without memory is the Horde of Gul'dan, and we have seen where that leads.", fx = { align = { honor = -1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },

    thrall = {
      lines = {
        { id = "th_default", text = "He came to us grown, escaped from a human fortress, knowing nothing of his people. I knew him by the blanket he carried, his mother's weave, and I taught him the ways of the shaman." },
      },
      choices = {
        { text = "What was he like then?", next = "thrall_young" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    thrall_young = {
      lines = {
        { id = "ty_default", text = "Angry, and hungry, and strong, but he listened, which is rare in the young. The spirits chose him, and then he chose the Horde, and freed it from the camps." },
      },
      choices = {
        { text = "Does he still visit the valley?", next = "thrall_visit" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    thrall_visit = {
      lines = {
        { id = "tv_default", text = "He has a Horde to lead in Durotar, far from here. But he sends warriors, and he sends word, and he has not forgotten his father's clan." },
      },
      choices = { { text = "Something else, Elder.", next = "BACK" } },
    },

    stormpike = {
      lines = {
        { id = "st_default", text = "Iron, and relics buried in the old stone, which they say belong to their ancestors. They dig, and they disturb the spirits, and the land groans with it." },
      },
      choices = {
        { text = "Could there ever be peace with them?", next = "stormpike_peace" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    stormpike_peace = {
      big = true,
      lines = {
        { id = "sp_default", text = "Perhaps, if they left their picks and cannons in Ironforge and came with open hands. They have not, and I do not think they will, but the spirits have surprised me before." },
      },
      choices = {
        { text = "Then we fight until they leave. No terms.", next = "BACK", reply = "That is the Frostwolf way, and it has served us.", fx = { align = { order = -1 } } },
        { text = "Seek terms. Even dwarves can be reasoned with.", next = "BACK", reply = "You speak like Thrall. Perhaps one day the valley will listen.", fx = { align = { order = 1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },

    blind = {
      lines = {
        { id = "bl_default", text = "The spirits of earth and wind tell me what my eyes cannot, and they have never lied to me. I see more of this valley than any Stormpike with a spyglass." },
      },
      choices = {
        { text = "And Lokholar, the Ice Lord?", next = "blind_lok" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    blind_lok = {
      lines = {
        { id = "bk_default", text = "The spirit of winter in these mountains, and Primalist Thurloga can wake him with the blood of fallen Stormpike. The dwarves have their forest lord, and we have the cold itself." },
      },
      choices = { { text = "Something else, Elder.", next = "BACK" } },
    },

    orders = {
      lines = {
        { id = "or_default", text = "Take their towers and bunkers, hold the graveyards, and raid Irondeep Mine for supplies. Thurloga needs blood, Regzar needs scraps, and Jotek needs hides; each of them will tell you more." },
      },
      choices = {
        { text = "I'll do what the clan needs.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "Listen to the land before you ask it for anything, young one, and never ask for more than it can give. The Stormpike forgot that rule, and the spirits remember." },
      },
      choices = { { text = "Something else, Elder.", next = "BACK" } },
    },

    alliance = {
      lines = {
        { id = "al_default", text = "Many have said so, and the snow covers them now. Go, while my patience lasts." },
      },
      choices = { { text = "We'll see, old orc.", next = "END" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The spirits, the clan and the long memory of the Frostwolves. Ask." } },
    background = { { id = "tp_bg", text = "Elder shaman of the Frostwolf Clan, who led them through the snow after Durotan fell." } },
    advice = { { id = "tp_ad", text = "Respect the cold, and honor your enemy, and do not trust the ground the Stormpike have dug." } },
    alterac = { { id = "tp_alterac", text = "Our home, and the place where Thrall's journey began and ended." } },
    thrall = { { id = "tp_thrall", text = "Son of Durotan, and Warchief of the Horde. He is the best of us." } },
    the_elements = { { id = "tp_the_elements", text = "The elements here are old and cold, and they speak to me even without eyes." } },
    _none = { { id = "tp_none", text = "The spirits do not speak of such things, and neither will I." } },
  },
}

-- Frostwolf Quartermaster: sells the clan's gear to those it trusts.
P:NPC {
  key = "bg_frostwolf_qm", id = 12097, name = "Frostwolf Quartermaster",
  bible = "bibles/alterac_valley.md", role = "quartermaster", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff" }, values = { "dutiful", "thrifty" },
  notices = { "reputation" },

  impression = {
    first = "He counts every hide twice and trusts only those the clan trusts.",
    third = "{name} browsed the Frostwolf Quartermaster's stores in Frostwolf Keep.",
  },

  greetings = {
    { id = "g_default", text = "You want supplies? Then you should have earned the clan's trust first." },
    { id = "g_honored", when = { reputation = { faction = "Frostwolf Clan", min = "revered" } }, text = "A friend of the clan. My stores are open to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Frostwolf Quartermaster, keeper of the clan's stores. Earn the Frostwolves' respect, and you'll find my shelves more generous." },
        { id = "h_rep", when = { reputation = { faction = "Frostwolf Clan", min = "exalted" } },
          text = "The clan sings your name. Take what you need; you've earned the right to buy it." },
      },
      again = {
        { id = "h_again", text = "What else do you need from me?" },
        { id = "h_again2", text = "Speak quickly, for there is a war outside." },
      },
      choices = {
        { text = "How do I earn the clan's respect?", next = "trust" },
        { text = "Where do your supplies come from?", next = "supplies" },
        { text = "Just looking.", next = "END" },
      },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "Fight, and finish what Drek'Thar and the others ask of you. Kill Stormpike, take their towers, and the clan will learn your name." },
      },
      choices = {
        { text = "And then I can buy better gear?", next = "trust_gear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_gear = {
      lines = {
        { id = "tg_default", text = "Then the good gear is yours, at its fair price. The clan does not haggle with its friends, and it does not sell to strangers." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = {
        { id = "su_default", text = "The hunt, Coldtooth Mine, and what Orgrimmar sends north, which is never enough. What the Stormpike leave in Irondeep, we take." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know every hide, blade and crate in the keep, and who has paid for which." } },
    _none = { { id = "tp_none", text = "I keep the clan's stores, not its gossip, so ask the warriors by the fire." } },
  },
}

-- Smith Regzar: Frostwolf Keep's smith, turning Stormpike scraps into clan armor.
P:NPC {
  key = "bg_regzar", id = 13176, name = "Smith Regzar",
  bible = "bibles/alterac_valley.md", role = "blacksmith", tier = "quest",
  communities = { "frostwolf" }, temper = { "gruff", "proud" }, values = { "industrious", "proud" },
  notices = { "class" },

  impression = {
    first = "He hammers like each blow is a Stormpike skull.",
    third = "{name} brought armor scraps to Smith Regzar at Frostwolf Keep.",
  },

  greetings = {
    { id = "g_default", text = "You bring scraps? Good, the forge is hungry." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Bring more dwarf iron, and I will make it Frostwolf iron." },
    { id = "g_scraps", when = { questActive = TODO_QUEST("Armor Scraps (Horde)") }, text = "Armor scraps from the Stormpike dead, as many as you can carry. Dwarven iron is good iron, even on the wrong side." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "Plate, scarred by Stormpike axes. Bring it to me when the fight is done." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Smith Regzar of the Frostwolves, and this forge has burned since the clan came to the valley. Bring me armor scraps off the Stormpike dead, and I will make the clan's warriors stronger." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc who knows the weight of good steel. The Frostwolves forged their own blades when the rest of the Horde took demon gifts." },
        { id = "h_more", tags = { "news" }, when = { questDone = 6741 },
          text = "The last scraps you brought became armor for three warriors. Bring more, and I will make more." },
      },
      again = {
        { id = "h_again", text = "What else? The iron cools." },
        { id = "h_again2", text = "Speak, and then go and fight." },
      },
      choices = {
        { text = "What do you do with Stormpike scraps?", next = "scraps" },
        { text = "Dwarves are said to be the best smiths.", next = "dwarves" },
        { text = "How long has this forge burned?", next = "forge" },
        { text = "Show me your work, smith.", next = "work", when = { class = { "WARRIOR", "SHAMAN" } } },
        { text = "Keep the forge hot.", next = "END" },
      },
    },

    scraps = {
      lines = {
        { id = "sc_default", text = "Melt them, sort them, and forge them into armor for the clan's warriors. The dwarves send their iron into our valley, and I send it back at them in Frostwolf shape." },
      },
      choices = {
        { text = "Wearing the enemy's armor seems wrong.", next = "scraps_wrong" },
        { text = "Something else, smith.", next = "BACK" },
      },
    },
    scraps_wrong = {
      big = true,
      lines = {
        { id = "sw_default", text = "Wrong? The dead do not need it, and the living do. The Frostwolves learned in the snow to waste nothing, not even our enemies." },
      },
      choices = {
        { text = "Use everything. The dead don't need it.", next = "BACK", reply = "You understand the clan's way, and the snow will not waste you either.", fx = { align = { light = -1 } } },
        { text = "The fallen should be respected, even dwarves.", next = "BACK", reply = "Drek'Thar would agree with you. I respect them by using their iron well.", fx = { align = { light = 1 } } },
        { text = "Something else, smith.", next = "BACK" },
      },
    },

    dwarves = {
      lines = {
        { id = "dw_default", text = "They are good, I will not lie, and Deepforge across the valley is better than most. But a Frostwolf blade has never broken in the cold, and theirs have." },
      },
      choices = {
        { text = "You know Murgot Deepforge?", next = "dwarves_murgot" },
        { text = "Something else, smith.", next = "BACK" },
      },
    },
    dwarves_murgot = {
      lines = {
        { id = "dm_default", text = "I know his work, from the armor we strip off his dead. He is a good smith, and I would like to break one of his anvils someday, to see if it is as strong as he thinks." },
      },
      choices = { { text = "Something else, smith.", next = "BACK" } },
    },

    forge = {
      lines = {
        { id = "fo_default", text = "Since Durotan led us here, and before I was born. My father kept it, and his father, and the fire has never gone out." },
      },
      choices = { { text = "Something else, smith.", next = "BACK" } },
    },

    work = {
      lines = {
        { id = "wo_default", text = "Look at this edge; it will cut through dwarven mail like snow. Fight well with steel like this, and the clan will notice." },
      },
      choices = { { text = "Something else, smith.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Iron, fire, and how to make a blade that lasts." } },
    _none = { { id = "tp_none", text = "I hammer steel, not words. Ask the shaman." } },
  },
}

-- Voggah Deathgrip: sends Frostwolf soldiers to raid Irondeep Mine.
P:NPC {
  key = "bg_voggah", id = 13817, name = "Voggah Deathgrip",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "greedy" }, values = { "cunning", "practical" },
  notices = { "race" },

  impression = {
    first = "He grins like a wolf at the thought of dwarven crates.",
    third = "{name} spoke with Voggah Deathgrip about raiding Irondeep Mine.",
  },

  greetings = {
    { id = "g_default", text = "You have strong arms. Good, because the dwarves have heavy crates." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more raiding? Irondeep has plenty left." },
    { id = "g_iron", when = { questActive = 6985 }, text = "Irondeep Supplies, from the mine in the north. The troggs dig them up, and the dwarves think they own them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Voggah Deathgrip, and I take things from the Stormpike. Their mine at Irondeep is full of supplies, and every crate we steal is one less they use against us." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! You know the value of a good raid, then. Our fathers lived on them before the camps." },
        { id = "h_done", tags = { "news" }, when = { questDone = 6985 },
          text = "Those crates were well taken. The dwarves are still counting what is missing." },
      },
      again = {
        { id = "h_again", text = "What else? The crates are waiting." },
        { id = "h_again2", text = "Speak, and then go and raid them." },
      },
      choices = {
        { text = "Tell me about Irondeep Mine.", next = "mine" },
        { text = "Raiding seems like a thief's work.", next = "thief" },
        { text = "How did you get your name?", next = "name" },
        { text = "My father raided too, before the humans caged him.", next = "camps", when = { race = "Orc" } },
        { text = "I'll bring you your crates.", next = "END" },
      },
    },

    mine = {
      lines = {
        { id = "mi_default", text = "North of the bridge, near Dun Baldar, full of troggs who crawled up from the deep. The dwarves dug too far, and now they fight their own mine as well as us." },
      },
      choices = {
        { text = "Troggs this far north?", next = "mine_troggs" },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    mine_troggs = {
      lines = {
        { id = "mt_default", text = "The dwarves woke them, digging. Drek'Thar says the land does not like being cut open, and the troggs are its answer." },
      },
      choices = {
        { text = "Then the dwarves brought this on themselves.", next = "mine_themselves" },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    mine_themselves = {
      big = true,
      lines = {
        { id = "ms_default", text = "They did, and we take advantage of it. What would you do with an enemy who digs his own grave?" },
      },
      choices = {
        { text = "Let them dig. The land will punish them.", next = "BACK", reply = "That is patient of you, and Drek'Thar would like you for it.", fx = { align = { order = 1 } } },
        { text = "Push them in. Raid harder while they're busy.", next = "BACK", reply = "Ha! That is how I think too, and why the dwarves fear me.", fx = { align = { order = -1 } } },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },

    thief = {
      lines = {
        { id = "th_default", text = "Thief? The Stormpike came into our valley and dug up our mountains. I only take back what they stole." },
      },
      choices = {
        { text = "The Stormpike would say the mountain is theirs.", next = "thief_claim" },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "na_default", text = "I caught a Stormpike scout by the throat in the first winter and did not let go. The clan named me for it, and I wear the name proudly." },
      },
      choices = {
        { text = "And the scout? Did he live?", next = "name_scout" },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    thief_claim = {
      lines = {
        { id = "tc_default", text = "They say a great deal, and they put flags on everything they say it about. The Frostwolves were here when the dwarves were still drinking in Ironforge, and the snow remembers that even if they do not." },
      },
      choices = {
        { text = "Then their crates are fair game.", next = "BACK", reply = "Now you speak like a Frostwolf. Go and fill your arms." },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    name_scout = {
      lines = {
        { id = "ns_default", text = "He lived, because I let go when Drek'Thar told me to, and the clan traded him back for three of ours. The dwarves call me Deathgrip as a curse now, and I like that even better." },
      },
      choices = {
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "cp_default", text = "Then he knew hunger and shame both, and so did mine. Thrall broke those camps, and the Frostwolves took him in when he had nothing, so every crate I take from the dwarves is a little of that debt repaid." },
      },
      choices = {
        { text = "Where is your father now?", next = "camps_father" },
        { text = "Something else, Voggah.", next = "BACK" },
      },
    },
    camps_father = {
      lines = {
        { id = "cf_default", text = "Dead, in the camps, before Thrall came. I raid in his name, and when I bring a dwarven crate across the bridge, I tell him about it at the fire." },
      },
      choices = {
        { text = "Let\'s talk of something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Raids, crates, and where the dwarves keep their supplies." } },
    _none = { { id = "tp_none", text = "If there is no crate in it, then I do not care about it." } },
  },
}

-- Primalist Thurloga: summons Lokholar the Ice Lord with the blood of fallen Stormpike.
P:NPC {
  key = "bg_thurloga", id = 13236, name = "Primalist Thurloga",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "calm", "fierce" }, values = { "wise", "honorable" },
  notices = { "class", "race" },

  impression = {
    first = "She speaks to the cold as if it were an old friend.",
    third = "{name} spoke with Primalist Thurloga about Lokholar the Ice Lord.",
  },

  greetings = {
    { id = "g_default", text = "The ice is stirring, and so are you. Have you come to help wake the winter's lord?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. Lokholar is waiting, and so am I." },
    { id = "g_blood", when = { questActive = 7385 }, text = "The blood of fallen Stormpike, gathered from the snow. Lokholar wakes only for blood." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The cold speaks to you as it speaks to me, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Thurloga, Primalist of the Frostwolves, and I call on Lokholar, the Ice Lord of these mountains. Bring me the blood of fallen Stormpike, and when there is enough, the winter itself will walk against them." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, child of the Earth Mother. You understand the spirits of the land; the Ice Lord is one of them, though colder than you are used to." },
        { id = "h_lok", tags = { "news" }, when = { questDone = 6801 },
          text = "Lokholar walked because of you, and the Stormpike are still digging their dead from the ice." },
      },
      again = {
        { id = "h_again", text = "Speak. The cold listens too." },
        { id = "h_again2", text = "What else, young one?" },
      },
      choices = {
        { text = "Who is Lokholar?", next = "lok" },
        { text = "Why blood?", next = "blood" },
        { text = "The Alliance has a forest lord, I hear.", next = "ivus" },
        { text = "I hear the elements too, Primalist.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll bring you blood.", next = "END" },
      },
    },

    lok = {
      lines = {
        { id = "lo_default", text = "The spirit of winter in these mountains, old as the snow itself. He sleeps in the deep ice, and wakes when the blood of the valley's enemies calls him." },
      },
      choices = {
        { text = "Does he serve the Frostwolves?", next = "lok_serve" },
        { text = "Something else, Primalist.", next = "BACK" },
      },
    },
    lok_serve = {
      lines = {
        { id = "ls_default", text = "He serves no one; he answers. The Frostwolves have lived in his snow for a generation, and he knows us, and the Stormpike are strangers to him." },
      },
      choices = {
        { text = "Waking spirits for war is dangerous.", next = "lok_danger" },
        { text = "Something else, Primalist.", next = "BACK" },
      },
    },
    lok_danger = {
      big = true,
      lines = {
        { id = "ld_default", text = "It is, and I do not do it lightly. But the Stormpike have their druid and her ancient, and the clan will not face the forest without the winter at its side." },
      },
      choices = {
        { text = "The spirits should be left to rest.", next = "BACK", reply = "Perhaps they should, and they will rest again when the dwarves leave.", fx = { align = { light = 1 } } },
        { text = "Use every weapon. The dwarves would.", next = "BACK", reply = "You think like a warrior, not a shaman, but this is a war.", fx = { align = { light = -1 } } },
        { text = "Something else, Primalist.", next = "BACK" },
      },
    },

    blood = {
      lines = {
        { id = "bl_default", text = "Blood is life, and life is what wakes the sleeping spirits. The Stormpike spill it on the snow every battle; I only gather it." },
      },
      choices = { { text = "Something else, Primalist.", next = "BACK" } },
    },

    ivus = {
      lines = {
        { id = "iv_default", text = "Ivus, the Forest Lord, woken by the Kaldorei druid with storm crystals from our dead. When the forest and the winter meet, the valley shakes." },
      },
      choices = { { text = "Something else, Primalist.", next = "BACK" } },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "Then listen to the cold here, young one. It is old and patient, and it remembers everything that has died in it." },
      },
      choices = { { text = "Something else, Primalist.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The ice, the spirits of winter, and the price of waking them." } },
    the_elements = { { id = "tp_the_elements", text = "In this valley, the elements are cold and old, and they know the Frostwolves." } },
    _none = { { id = "tp_none", text = "The ice does not speak of that, and neither do I." } },
  },
}

-- Jotek: Frostwolf wolf-rider handler, wanting ram hides for harnesses.
P:NPC {
  key = "bg_jotek", id = 13798, name = "Jotek",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "practical", "loyal" },
  notices = { "class" },

  impression = {
    first = "He smells of wolf and leather, and his hands are scarred from both.",
    third = "{name} met Jotek, who makes harnesses for the Frostwolf Wolf Riders.",
  },

  greetings = {
    { id = "g_default", text = "You there, can you hunt rams? I need their hides, and the hills are full of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The wolves need harnesses, and I need hides." },
    { id = "g_hides", when = { questActive = 7002 }, text = "Ram hides, from the Alterac rams in the hills. The Stormpike ride them; we make harnesses from them." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You will find the rams easy prey, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Jotek, and I make the harnesses for the Frostwolf Wolf Riders. Bring me ram hides from the hills, and the riders will charge the Stormpike lines." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! You know the wolves are our brothers, and the riders our pride." },
      },
      again = {
        { id = "h_again", text = "What else do you need from me?" },
        { id = "h_again2", text = "Speak, and then go and hunt while there is light." },
      },
      choices = {
        { text = "Why ram hides?", next = "hides" },
        { text = "Tell me about the Wolf Riders.", next = "riders" },
        { text = "The Stormpike ride those rams.", next = "rams" },
        { text = "I can hunt rams easily.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll hunt your rams.", next = "END" },
      },
    },

    hides = {
      lines = {
        { id = "hi_default", text = "They are tough, and the harnesses must hold a frost wolf in full charge. Nothing else in this valley is strong enough." },
      },
      choices = { { text = "Something else, Jotek.", next = "BACK" } },
    },

    riders = {
      lines = {
        { id = "ri_default", text = "Frostwolf warriors on frost wolves, as Durotan rode, charging through the snow. When enough harnesses are made, they ride, and the Stormpike scatter." },
      },
      choices = {
        { text = "The wolves are more than mounts to you.", next = "riders_wolves" },
        { text = "Something else, Jotek.", next = "BACK" },
      },
    },
    riders_wolves = {
      lines = {
        { id = "rw_default", text = "They are clan. We raise them from pups, and they fight beside us, and when they die we mourn them as we mourn warriors." },
      },
      choices = {
        { text = "The Stormpike kill your wolves in battle.", next = "riders_killed" },
        { text = "Something else, Jotek.", next = "BACK" },
      },
    },
    riders_killed = {
      big = true,
      lines = {
        { id = "rk_default", text = "They do, and I remember each one. But we kill their rams, so we are even in that, at least." },
      },
      choices = {
        { text = "The beasts are innocent. Spare them when you can.", next = "BACK", reply = "Fair words, but war is not fair, and the rams will not thank you for them.", fx = { align = { honor = 1 } } },
        { text = "Kill their rams. Slow them down.", next = "BACK", reply = "Yes. Their cavalry is nothing without mounts.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jotek.", next = "BACK" },
      },
    },

    rams = {
      lines = {
        { id = "ra_default", text = "They do, and that is why we take the hides. Every ram we skin is one fewer for the Stormpike Ram Riders." },
      },
      choices = { { text = "Something else, Jotek.", next = "BACK" } },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Then bring many hides, and quickly. The riders are waiting." },
      },
      choices = { { text = "Something else, Jotek.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know wolves and hides and the harnesses that join them, and little else matters to me." } },
    _none = { { id = "tp_none", text = "I know wolves, and that is not about wolves, so ask someone else." } },
  },
}

-- Wing Commander Guse: Frostwolf war rider commander, called to strike with Stormpike soldiers' flesh.
P:NPC {
  key = "bg_guse", id = 13179, name = "Wing Commander Guse",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "proud" }, values = { "brave", "loyal" },
  notices = { "class" },

  impression = {
    first = "He paces like a caged beast, eager for the sky.",
    third = "{name} met Wing Commander Guse of the Frostwolf war riders.",
  },

  greetings = {
    { id = "g_default", text = "You freed me from the dwarves' cell. Now help me take to the sky again." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The war riders are waiting." },
    { id = "g_quest", when = { questActive = 6825 }, text = "Bring me the flesh of fallen Stormpike soldiers, and my war riders will strike." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Guse, of the Frostwolf war riders, and I sat too long in a Stormpike cell. Bring me the flesh of their soldiers to feed my mounts, and we will strike at Dun Baldar from the sky." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Then you know the pride of the war riders." },
      },
      again = {
        { id = "h_again", text = "What else do you need from me?" },
        { id = "h_again2", text = "Speak, and then go and fight." },
      },
      choices = {
        { text = "How were you captured?", next = "captured" },
        { text = "Why soldiers' flesh?", next = "flesh" },
        { text = "What are the war riders?", next = "riders" },
        { text = "My clan fought on wolfback. Why take to the sky?", next = "orc_sky", when = { race = "Orc" } },
        { text = "I'll bring you flesh.", next = "END" },
      },
    },

    captured = {
      lines = {
        { id = "ca_default", text = "Shot down over Stonehearth by dwarven guns, and dragged into their bunker. The dwarves fed me bread and called it mercy." },
      },
      choices = {
        { text = "They kept you alive, though.", next = "captured_alive" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    captured_alive = {
      lines = {
        { id = "cl_default", text = "They did, and I do not understand why. Perhaps they hoped to trade me, or perhaps dwarves have honor after all." },
      },
      choices = {
        { text = "Show them the same mercy?", next = "captured_mercy" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    captured_mercy = {
      big = true,
      lines = {
        { id = "cm_default", text = "I have thought of it in the cell, many nights. What would you do, if a Stormpike lay at your feet?" },
      },
      choices = {
        { text = "Spare him. Honor demands it.", next = "BACK", reply = "Perhaps you are right, and I will think on it more before I fly again.", fx = { align = { light = 1 } } },
        { text = "Kill him. Mercy is weakness here.", next = "BACK", reply = "That is the clan's way, in the snow.", fx = { align = { light = -1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    flesh = {
      lines = {
        { id = "fl_default", text = "The war riders need to be fed, and the Stormpike are fat on their beer and bread. Bring enough, and my riders will be strong enough to strike." },
      },
      choices = {
        { text = "Feeding the dead to beasts is a grim errand.", next = "flesh_grim" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    riders = {
      lines = {
        { id = "ri_default", text = "Great beasts of the air, and orcs brave enough to ride them. When we strike, the dwarves learn to fear the sky." },
      },
      choices = {
        { text = "Where did the Frostwolves find such beasts?", next = "riders_where" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    flesh_grim = {
      lines = {
        { id = "fg_default", text = "It is, and I do not ask you to enjoy it. But the dwarves fed my riders to their guns, so I feel no shame in feeding the dwarves to my riders." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    riders_where = {
      lines = {
        { id = "rw_default", text = "They are wind riders from Kalimdor, brought across the sea when the Warchief led the Horde to Durotar. Orgrimmar sent us a few for this war, and they hate the cold almost as much as they hate dwarves." },
      },
      choices = {
        { text = "Then they suffer for the clan, like the rest of us.", next = "BACK", reply = "Yes, and they suffer it better than some orcs I know." },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    orc_sky = {
      lines = {
        { id = "os_default", text = "Because the dwarves taught us, {class}. Their gryphons hunted our wolf riders on every open field, and a wolf cannot bite what it cannot reach, so we learned to fly or we learned to die." },
      },
      choices = {
        { text = "The wolves are still the clan's heart.", next = "BACK", reply = "They are, and I would never say otherwise in front of Drek'Thar." },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the sky, the war riders and every one of the dwarves' bunkers." } },
    _none = { { id = "tp_none", text = "I am a flier, not a talker, so ask the shaman about such things." } },
  },
}

-- Wing Commander Jeztor: Frostwolf war rider commander, called to strike with Stormpike lieutenants' flesh.
P:NPC {
  key = "bg_jeztor", id = 13180, name = "Wing Commander Jeztor",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "frostwolf" }, temper = { "cunning", "proud" }, values = { "practical", "loyal" },
  notices = { "class" },

  impression = {
    first = "He speaks quietly, like a hunter waiting for the moment to strike.",
    third = "{name} met Wing Commander Jeztor of the Frostwolf war riders.",
  },

  greetings = {
    { id = "g_default", text = "You freed me. I remember debts, and I remember them well." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you brought what I asked?" },
    { id = "g_quest", when = { questActive = 6826 }, text = "The flesh of Stormpike lieutenants. My riders are hungry for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Jeztor, of the Frostwolf war riders, freed from the Stormpike's cells by your hand. Bring me the flesh of their lieutenants, and my riders will strike where they are weakest." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll. You know the value of a hunt, and the patience it takes." },
      },
      again = {
        { id = "h_again", text = "What else do you need from me?" },
        { id = "h_again2", text = "Speak quietly. The dwarves have ears." },
      },
      choices = {
        { text = "Why lieutenants?", next = "lieutenants" },
        { text = "What do you remember of your capture?", next = "capture" },
        { text = "You seem calmer than the other commanders.", next = "calm" },
        { text = "Patience I have, mon. Tell me where to wait.", next = "troll_wait", when = { race = "Troll" } },
        { text = "I'll bring you what you need.", next = "END" },
      },
    },

    lieutenants = {
      lines = {
        { id = "li_default", text = "They lead the Stormpike lines, and when they fall, the soldiers scatter. A good strike aims at the head, not the body." },
      },
      choices = {
        { text = "That's a cold way to fight.", next = "lieutenants_cold" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    lieutenants_cold = {
      lines = {
        { id = "lc_default", text = "It is the valley's way. Everything here is cold, and those who fight warm die quickly." },
      },
      choices = {
        { text = "Is there no honor in it?", next = "lieutenants_honor" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    lieutenants_honor = {
      big = true,
      lines = {
        { id = "lh_default", text = "Honor is for warriors on the ground, face to face. In the sky, there is only the strike and the escape." },
      },
      choices = {
        { text = "Strike hard and fast. Winning matters most.", next = "BACK", reply = "You understand the sky, and you would make a fine war rider.", fx = { align = { honor = -1 } } },
        { text = "Even from the sky, we fight with honor.", next = "BACK", reply = "Perhaps you are right, for Drek'Thar would say the same.", fx = { align = { honor = 1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    capture = {
      lines = {
        { id = "ca_default", text = "Cold, and dark, and the dwarves singing their drinking songs all night. That was the worst part." },
      },
      choices = {
        { text = "Dwarven songs can't be worse than a cell.", next = "capture_songs" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    calm = {
      lines = {
        { id = "ca2_default", text = "Guse is all fire, and Mulverick all thunder. Someone must think before we strike, and that is me." },
      },
      choices = {
        { text = "Do the other two listen to you?", next = "calm_listen" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    capture_songs = {
      lines = {
        { id = "cs_default", text = "You have not heard forty dwarves sing about their beards until dawn. I counted every guard change between the verses, though, and if they take me again I will know the way out." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    calm_listen = {
      lines = {
        { id = "cl_default", text = "Guse listens after he has shouted, and Mulverick listens after he has crashed. Between the two of them I am always right eventually, which is the only kind of right a commander can expect." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    troll_wait = {
      lines = {
        { id = "tw_default", text = "At the edge of Stonehearth, where the bunker's archers cannot see the ridge. When their lieutenants ride out to meet our charge, they leave the bunker thin, and a patient hunter does not need a second chance." },
      },
      choices = {
        { text = "And if they never ride out?", next = "troll_never" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    troll_never = {
      lines = {
        { id = "tn_default", text = "Then you wait longer than they do. The Darkspear hunted the jungle that way for a thousand years, so I think you will not find it hard." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the sky over this valley, and how to strike from it and live." } },
    _none = { { id = "tp_none", text = "That is not worth my thought, and it should not be worth yours while the war goes on." } },
  },
}

-- Wing Commander Mulverick: Frostwolf war rider commander, called to strike with Stormpike commanders' flesh.
P:NPC {
  key = "bg_mulverick", id = 13181, name = "Wing Commander Mulverick",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "loud" }, values = { "brave", "proud" },
  notices = { "class" },

  impression = {
    first = "Loud as thunder, he laughs at the danger of the sky.",
    third = "{name} met Wing Commander Mulverick of the Frostwolf war riders.",
  },

  greetings = {
    { id = "g_default", text = "Ha! You freed me from those stinking dwarves! Now let us make them pay!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you come to watch me fly?" },
    { id = "g_quest", when = { questActive = 6827 }, text = "The flesh of Stormpike commanders! Bring it, and we will burn Dun Baldar from the sky!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wing Commander Mulverick, the loudest of the war riders, and the dwarves learned that in their cells! Bring me the flesh of their commanders, and my riders will turn their hall to ash." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc! Then you know the joy of the charge, and the war riders charge from the sky." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up!" },
        { id = "h_again2", text = "Ha! More questions?" },
      },
      choices = {
        { text = "Why commanders' flesh?", next = "commanders" },
        { text = "The dwarves held you in Dun Baldar?", next = "baldar" },
        { text = "You seem to enjoy this war.", next = "enjoy" },
        { text = "I'll shout louder than you when we charge.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll bring you what you need.", next = "END" },
      },
    },

    commanders = {
      lines = {
        { id = "co_default", text = "Kill the head, and the body falls! When the Stormpike commanders are dead, nothing stands between my riders and Vanndar's hall." },
      },
      choices = {
        { text = "Which commander falls first?", next = "commanders_first" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    baldar = {
      lines = {
        { id = "ba_default", text = "In the heart of their stronghold, where I shouted every night until they wished they had killed me. They should have!" },
      },
      choices = {
        { text = "Why didn't they?", next = "baldar_why" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    baldar_why = {
      lines = {
        { id = "bw_default", text = "Vanndar wanted to trade me, I think, or to show his dwarves a living orc. Fools, both reasons." },
      },
      choices = {
        { text = "Maybe Vanndar has honor.", next = "baldar_honor" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    baldar_honor = {
      big = true,
      lines = {
        { id = "bh_default", text = "Honor? He kept me in a cage! But perhaps he could have killed me and did not, and that is worth something." },
      },
      choices = {
        { text = "Then respect him, and kill him cleanly.", next = "BACK", reply = "Ha! I will, and I will do it from the sky where he can see me coming.", fx = { align = { honor = 1 } } },
        { text = "He's a dwarf. Burn his hall and laugh.", next = "BACK", reply = "Yes, that is the way, and I will laugh loudest of all!", fx = { align = { honor = -1 } } },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },

    enjoy = {
      lines = {
        { id = "en_default", text = "I enjoy flying, and I enjoy watching dwarves run! The war just gives me reasons to do both." },
      },
      choices = {
        { text = "Someone ought to worry about you, Wing Commander.", next = "enjoy_worry" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    commanders_first = {
      lines = {
        { id = "cf_default", text = "Balinda Stonehearth, the human mage in the bunker, because she has frozen more of our warriors than winter has! After her, whoever is foolish enough to stand in her place." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    enjoy_worry = {
      lines = {
        { id = "ew_default", text = "Jeztor worries enough for all three of us, and Guse broods about it, so there is no worrying left for me! When I die, I will die laughing over Dun Baldar, and the clan will sing that it was loud." },
      },
      choices = {
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Ha! Many have said that, {class}, and none of them have done it. Come to the Field of Strife when my riders strike, and we will see whose voice the dwarves remember." },
      },
      choices = {
        { text = "Lok'tar ogar! They'll hear me in Ironforge.", next = "BACK", reply = "LOK'TAR! Ha, that was almost loud enough!" },
        { text = "Something else, Wing Commander.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Flying, fighting, and shouting! I am the best at all three." } },
    _none = { { id = "tp_none", text = "Ha! That is boring. Ask me about the sky." } },
  },
}
