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
    { id = "dp_rep_sp", when = { rep = { faction = "Stormpike Guard", min = "Honored" } }, text = "The Stormpike honour ye, an' so do I. Come, the valley's ours tae take." },
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

  blurts = {
    { id = "bl1", text = "Drek'Thar's blind, but he's no' alone. Burn the four Frostwolf towers an' his warmasters fall wi' them, an' then he's just an old orc in a cold hall." },
    { id = "bl2", text = "The Frostwolves call up Lokholar the Ice Lord wi' the blood o' my fallen soldiers. Every Stormpike corpse ye leave in the snow is another drop for him." },
  },
  confides = {
    { id = "cnf_1", text = "The Frostwolf Relief Hut sits on the Horde's flank wi' only a handful o' guards. Take that graveyard, an' their dead come back a long way from the fight." },
    { id = "cnf_2", text = "Captain Galvangar holds Iceblood Garrison, an' he's a brute but no fool. Draw him out wi' a small party before ye bring the main force, or he'll have ye on the walls." },
    { id = "cnf_3", text = "The Coldtooth Mine on the Horde side is full o' kobolds wi' no loyalty tae anyone. Clear them out, an' the Frostwolves lose their best iron for the whole fight." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "Ye've been naught but trouble in my hall, an' I've a war tae win. That's my problem wi' ye." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "Ye're a friend o' the Frostwolves, standin' in Dun Baldar. I'd have ye in irons if the Expedition's charter allowed it." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I spoke tae ye like a soldier o' the Guard, an' ye answered like a Frostwolf spy. A Stormpike doesnae forget that." },
      { id = "gv_values", when = { grudge = "values" }, text = "Ye fight for loot an' glory, no' for the Guard. The valley's full o' graves for soldiers like that." },
    },
    amends = {
      { id = "am1", text = "Take a tower, hold a graveyard an' bring me Frostwolf banners. That's how the Stormpike Guard settles its accounts." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "Ye cannae, no' while ye wear the Horde's colours. Come up the valley again an' I'll settle it the other way." },
    },
    spite = {
      { id = "sp1", text = "I think ye're a sellsword who'd change sides for an extra pouch o' silver, an' the Frostwolves are welcome tae ye." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think ye're one o' Drek'Thar's dogs, an' I'll see yer head on the bridge before the snow melts." },
    },
    knows = { { id = "tp_knows", text = "I know this valley, its mines an' its enemies better than any dwarf alive. Ask." } },
    background = { { id = "tp_bg", text = "General o' the Stormpike Guard, an' a Stormpike before that, which up here means a dwarf who doesnae know when tae quit." } },
    advice = { { id = "tp_ad", text = "Take the towers, hold the graveyards an' guard the bridge, for the Frostwolves come straight down the middle when they're hungry." } },
    alterac = { { id = "tp_alterac", text = "A kingdom o' traitors once, an' the snow's done well tae bury it. Now it's iron an' relics, an' the King wants both." } },
    magni = { { id = "tp_magni", text = "King Magni sent us up here, an' I'll no' send word tae him that we failed. There's no' a finer king under the mountain." } },
    thrall = { { id = "tp_thrall", text = "Durotan's son, an' a warchief who's kept his Horde out o' the human camps for good, they say. I'd respect him more if he kept his kin out o' my valley." } },
    _none = { { id = "tp_none", text = "That's no' a matter for a general wi' a war tae fight. Ask me about the valley." } },
    regard = {
      { id = "rg_1", text = "I think ye're a proper soldier o' the Guard, an' there's no higher praise from a Stormpike. Ye'd have a place on the walls o' Dun Baldar any day." },
      { id = "rg_2", text = "Ye've bled for this valley an' never once asked what it'd pay ye. That's the Stormpike way, an' ye've learned it better than some o' my own kin." },
      { id = "rg_dwarf", when = { race = "Dwarf" }, text = "A dwarf o' the mountain, standin' in my hall wi' Frostwolf snow on yer boots. Magni himself would be proud o' ye, an' so am I." },
      { id = "rg_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Ye fight fair even when the Frostwolves don't, an' I've seen it more than once. That's worth more tae me than any tower, soldier." },
    },
    confide = {
      { id = "cf_1", text = "I'll tell ye straight, I didnae want this command. Magni gave it tae me because nobody else would sit in Dun Baldar through the winter, an' I'm too stubborn tae leave." },
      { id = "cf_2", text = "The Expedition came up here for iron an' relics, an' I came tae make sure it got home again. Some o' my officers have forgotten which o' those matters more." },
    },
    trust = {
      { id = "tr_1", text = "My marshals, every one, an' Captain Balinda Stonehearth at her outpost. She's held that post wi' fewer soldiers than I'd dare send anywhere else." },
      { id = "tr_2", text = "Trust the Stormpike druids an' their rams, for they know the valley better than I do. Dinnae trust the Irondeep diggers tae tell ye what's down there, because they're all scared o' it." },
    },
    watchout = {
      { id = "wo_1", text = "Mind the bridge an' the Field o' Strife below it, for the Frostwolves come through there in force when they're hungry. Many a good soldier's fallen in that snow." },
      { id = "wo_2", text = "Watch yer back near the Irondeep Mine, for the troggs down there have nae love for dwarves or anyone else." },
    },
    worries = {
      { id = "wy_1", text = "That the war in this valley never ends, an' my grandchildren are still fightin' Frostwolves for a mine their grandfathers forgot why they wanted." },
      { id = "wy_2", text = "That we call on Ivus one day an' he doesnae go back tae sleep. An old spirit o' the forest owes nothin' tae dwarves, whatever the druids say." },
    },
    hopes = {
      { id = "hp_1", text = "Tae see Frostwolf Keep empty an' our banner over it, an' then tae go home tae Ironforge an' sit by a proper fire for a whole winter." },
      { id = "hp_2", text = "That Magni sends word one day sayin' the Expedition's done its job an' the lads can come home. I'd read it twice an' frame it." },
    },
    favor = {
      { id = "fv_1", text = "Bring my soldiers back from the snow when ye can, so we can bury them proper. Lokholar's had enough Stormpike blood." },
      { id = "fv_2", text = "When ye're next in Ironforge, tell the King the Stormpike Guard still holds. He'll want tae hear it from somebody who's been up here." },
    },
    friendship = {
      { id = "fr_1", text = "Aye, ye're a friend, soldier, an' a Stormpike in all but name. I'd have ye at my side in the last hall o' Dun Baldar, an' I'd want nobody else." },
      { id = "fr_2", text = "Friend, an' brother in arms besides. That's a bond the snow cannae break, an' Drek'Thar's warriors have tried." },
      { id = "fr_values", when = { fondness = "values" }, text = "Ye're loyal an' ye're brave, an' that's every word o' the Stormpike oath. Friend, then, an' I'll swear it on my beard." },
    },
    never_told = {
      { id = "nt_1", text = "I lost my own nephew at Iceblood in the first winter. I tell folk he went home tae Ironforge, because I cannae bear tae say it." },
      { id = "nt_2", text = "Some nights I think the Frostwolves have more right tae this valley than we do. I'd never say it in front o' my marshals, an' I'd deny it tae Magni's face." },
    },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, one o' the Guard's finest! I've counted the good racks twice this mornin', an' they're open tae ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll sell ye what yer standin' allows an' no' a buckle more, an' I'll count it twice after ye've gone." },
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
        { id = "xh_again3", when = { reputation = { faction = "Stormpike Guard", min = "honored" } }, text = "Back again, friend o' the Guard? What'll it be?" },
        { id = "h_again", text = "Aye? Anythin' else?" },
        { id = "h_again2", text = "Make it quick, there's a line." },
      },
      choices = {
        { text = "How do I earn the Guard's trust?", next = "trust" },
        { text = "Where do your supplies come from?", next = "supplies" },
        { text = "What's the Stormpike expedition after?", next = "xwhy" },
        { text = "Who commands Dun Baldar?", next = "xcmd" },
        { text = "Do the Frostwolves have a claim to the valley?", next = "xclaim" },
        { text = "A Bronzebeard's honoured to serve here.", next = "xdwarf", when = { race = "Dwarf" } },
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
    xwhy = {
      lines = { { id = "xwh_default", text = "Iron, relics, an' whatever the old dwarves left buried up here. The Stormpike are a clan o' delvers, an' the valley's full o' things worth diggin' for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcmd = {
      narr = "He nods toward the keep's great hall, without looking up from the ledger.",
      lines = { { id = "xcm_default", text = "Vanndar Stormpike, an' a finer dwarf ye'll no' meet north o' Ironforge. He's got a temper on him, but he's never lost a fight he meant tae win." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xclaim = {
      lines = { { id = "xcl_default", text = "The orcs say they've lived here since they fled their own kind, an' that might be true. But the valley's Khaz Modan's by right, an' we were here long before any orc." } },
      choices = {
        { text = "Then the valley's yours by right. Take it.", next = "BACK", reply = "Aye, that's what the Guard says, an' I'll say it too.", fx = { align = { order = 1 } } },
        { text = "They've lived here. Ancient claims mean little.", next = "BACK", reply = "Hmph. Dinnae say that too loud in Dun Baldar, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "An' the Guard's honoured tae have ye. Bring back a few Frostwolf hides, an' I'll see ye get somethin' better than the cheap shelf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    vanndar = { { id = "xtp_vann", text = "Our commander, an' the best o' us. Follow him an' ye'll no' go far wrong." } },
    frostwolf = { { id = "xtp_frost", text = "Orcs an' wolves an' snow. They fight hard, I'll give them that." } },
   
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
  key = "bg_renferal", id = 13442, name = "Arch Druid Renferal", gender = "female",
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
    { id = "dp_rep_fw", when = { rep = { faction = "Frostwolf Clan", min = "Honored" } }, text = "The Frostwolf honour you. I feel it in the spirits, and I am glad." },
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

  blurts = {
    { id = "bl1", text = "Vanndar Stormpike keeps four marshals at his side, and each draws strength from a bunker or a tower. Burn those, and his marshals fall with them." },
    { id = "bl2", text = "The Stormpike druids gather storm crystals to call Ivus, the Forest Lord, against us. Every crystal you take from them is one they cannot use." },
    { id = "bl3", text = "The dwarves dug too deep in the Irondeep Mine, and they woke things in the dark that have no love for dwarves." },
  },
  confides = {
    { id = "cnf_1", text = "The Stonehearth Outpost is held by a dwarven captain with fewer soldiers than Vanndar admits. Strike it early, and the road north opens to you." },
    { id = "cnf_2", text = "The Stormpike Aid Station lies close behind Dun Baldar, and their dead return from it quickly. Take it, and every Stormpike who falls must walk much farther to fight again." },
    { id = "cnf_3", text = "Our wolves know the valley's paths better than any scout. Ride where they lead you, for they avoid the ground the dwarves have dug beneath." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You have brought discord into my keep, and the spirits like it no better than I do." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You are a Stormpike, or a friend to them. They dig into our mountain for iron and relics, and you stand in my hall as if it were yours." },
      { id = "gv_prejud", when = { grudge = { worst = "prejudice" } }, text = "You are dead and do not rest, and the spirits of Alterac cry out when you walk near them. I cannot pretend I do not hear it." },
      { id = "gv_values", when = { grudge = "values" }, text = "You fight without honor, and the Frostwolves still remember Durotan, who never did." },
    },
    amends = {
      { id = "am1", text = "Fight for the Frostwolf Clan with honor, and let the spirits speak your name to me. They are better judges than I am." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "There is no making it right while the Stormpike dig in our mountain. Leave Alterac, and perhaps the snow will forgive you." },
    },
    spite = {
      { id = "sp1", text = "I am blind, but I see you clearly enough. You are a small thing with a loud spirit, and the wind does not care for it." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think the Stormpike sent us their worst, and the snows of Alterac will have you before the spring." },
    },
    knows = { { id = "tp_knows", text = "The spirits, the clan and the long memory of the Frostwolves. Ask." } },
    background = { { id = "tp_bg", text = "Elder shaman of the Frostwolf Clan, who led them through the snow after Durotan fell." } },
    advice = { { id = "tp_ad", text = "Respect the cold, and honor your enemy, and do not trust the ground the Stormpike have dug." } },
    alterac = { { id = "tp_alterac", text = "Our home, and the place where Thrall's journey began and ended." } },
    thrall = { { id = "tp_thrall", text = "Son of Durotan, and Warchief of the Horde. He is the best of us." } },
    the_elements = { { id = "tp_the_elements", text = "The elements here are old and cold, and they speak to me even without eyes." } },
    _none = { { id = "tp_none", text = "The spirits do not speak of such things, and neither will I." } },
    regard = {
      { id = "rg_1", text = "I am blind, {name}, but the spirits show me your heart, and it is a strong one. The clan has need of hearts like yours." },
      { id = "rg_2", text = "You honor the Frostwolves without being asked, and the wind carries your name to me with respect. That is rare, and I do not forget it." },
      { id = "rg_shaman", when = { class = "SHAMAN" }, text = "The elements answer you as they answer an old friend, young one. I hear it in the air around you, and it warms these cold bones." },
      { id = "rg_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "You fight with honor, as Durotan did, even when it would be easier not to. When I hear that in someone, I remember why we endured the snow." },
    },
    confide = {
      { id = "cf_1", text = "I remember Durotan's face as clearly as I remember the snow. It is what I see when I close the eyes that no longer serve me, and I would not trade it for sight." },
      { id = "cf_2", text = "I sometimes fear I am too old to lead the clan in battle, and that the young warriors only indulge me. I let them, because the clan needs a voice it remembers." },
    },
    trust = {
      { id = "tr_1", text = "Trust my warmasters, and the wolf riders, who would die before they left a fallen brother in the snow. Trust the spirits most of all, for they have never lied to me." },
      { id = "tr_2", text = "Trust Captain Galvangar's strength, but not his temper. He would fight the whole Stormpike Guard alone if I did not hold him back." },
    },
    watchout = {
      { id = "wo_1", text = "Beware the Stormpike druids when they gather their crystals, for the forest lord they call is old and angry, and he does not ask whose side you fight on." },
      { id = "wo_2", text = "Do not linger at Dun Baldar's bridge, for the dwarves have fortified it for years, and every stone of it is set against you." },
    },
    worries = {
      { id = "wy_1", text = "That the clan will forget why we came to Alterac, and fight only for the mines as the dwarves do. We came here to survive, not to dig." },
      { id = "wy_2", text = "That I will die before Thrall returns to see this valley at peace. I waited for him once already, and I am older now." },
    },
    hopes = {
      { id = "hp_1", text = "That one day Frostwolf cubs will run through this valley without fear, and the only war they know will be in the old songs." },
      { id = "hp_2", text = "To hear Thrall's voice in Frostwolf Keep once more before the spirits call me home. He came to us a lost child and left as the hope of our people." },
    },
    favor = {
      { id = "fv_1", text = "Bring me word of the Stormpike druids' crystals, and of any you take from them. The spirits are uneasy each time the dwarves gather them." },
      { id = "fv_2", text = "Speak to the wolves in the kennels, if you pass them. They miss the open snow, and they listen to a kind voice." },
    },
    friendship = {
      { id = "fr_1", text = "You are a friend of the Frostwolf Clan, {name}, and of this old shaman. The spirits have known it for some time; I am only now saying it aloud." },
      { id = "fr_2", text = "Among the Frostwolves, those we trust with our lives are called kin, and you are kin to me." },
      { id = "fr_orc", when = { race = "Orc" }, text = "You are Frostwolf in your heart, whatever clan you were born to, and I count you a {g:son|daughter} of this valley." },
    },
    never_told = {
      { id = "nt_1", text = "When Durotan left the valley with Draka and their child, I did not try to stop him. I have wondered every day since whether he would still be alive if I had begged him to stay." },
      { id = "nt_2", text = "I am afraid of the Forsaken, though the Warchief calls them allies. The spirits around them cry out, and I do not know how to answer them." },
    },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "A friend of the clan returns. Drek'Thar's people speak well of you, and my stores are open to you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I sell what the clan allows you and nothing more, and the clan does not allow you much." },
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
        { id = "xh_again3", when = { reputation = { faction = "Frostwolf Clan", min = "honored" } }, text = "You again, friend of the clan. What do you need?" },
        { id = "h_again", text = "What else do you need from me?" },
        { id = "h_again2", text = "Speak quickly, for there is a war outside." },
      },
      choices = {
        { text = "How do I earn the clan's respect?", next = "trust" },
        { text = "Where do your supplies come from?", next = "supplies" },
        { text = "Who leads the Frostwolves?", next = "xleader" },
        { text = "Why do the Stormpike want this valley?", next = "xwhy" },
        { text = "What is the most precious thing in your stores?", next = "xprecious" },
        { text = "I am an orc. The Frostwolves are my blood.", next = "xorc", when = { race = "Orc" } },
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
    xleader = {
      lines = { { id = "xle_default", text = "Drek'Thar, the elder shaman, who sees more blind than most do with eyes. Thrall is the son of Durotan, our chieftain, and the clan has never forgotten it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhy = {
      narr = "He sets down a bundle of hides with a heavy thump.",
      lines = { { id = "xwh_default", text = "The dwarves say they dig for iron and relics, and they dig into our home to find them. This valley sheltered the clan in exile, and we will not give a single cave of it up." } },
      choices = {
        { text = "Then drive the dwarves out of the valley.", next = "xdrive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdrive = {
      lines = { { id = "xdr_default", text = "That is the plan, and it has been the plan for many winters. Some warriors say we should take Dun Baldar and leave nothing standing, and the elders say we should only take back what is ours." } },
      choices = {
        { text = "Burn Dun Baldar. Leave them nothing.", next = "BACK", reply = "The warriors would cheer you. Drek'Thar would frown.", fx = { align = { honor = -1 } } },
        { text = "Take back the valley, no more.", next = "BACK", reply = "Spoken like an elder. The clan needs both kinds of voice, I suppose.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xprecious = {
      lines = { { id = "xpr_default", text = "Not the gold, and not the blades, but the frostwolf hides. Every one comes from a wolf that died old and honoured, and only friends of the clan may wear them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorc = {
      lines = { { id = "xor_default", text = "Then you know the snow better than the Stormpike ever will. Fight well, and when you come back, the clan will have stories to tell about you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    drekthar = { { id = "xtp_drek", text = "Our elder shaman, and the clan's wisdom. Do what he asks and you will earn more than gear." } },
    stormpike = { { id = "xtp_storm", text = "Dwarves with long beards and short memories. They dig where they are not wanted." } },
   
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

---------------------------------------------------------------------------------------------------------------
-- MORE OF THE VALLEY: officers, vendors, mine troops and spirit guides of both sides
---------------------------------------------------------------------------------------------------------------

-- Athramanis: night elf bounty hunter in Dun Baldar; Staghelm's Requiem, troll mojo for Darnassus.
P:NPC {
  key = "bg_athramanis", id = 14187, name = "Athramanis", gender = "female",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "cold", "patient" }, values = { "loyal", "precise" },

  impression = {
    first = "She speaks softly, and every word sounds like it has been aimed.",
    third = "{name} spoke with Athramanis, the Kaldorei bounty hunter of Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "You walk loudly for someone who hunts. Come, sit, and tell me what you have taken from the Horde." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. The Horde has not grown any fewer while you were gone." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Horde soldier in Dun Baldar is either very brave or very lost. Either way, you will not leave with my bounty." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Athramanis, and I hunt for the Alliance in this valley. Darnassus pays for proof that its enemies have fallen, and I am the one who weighs that proof." },
      },
      again = {
        { id = "h_again1", text = "Speak, and keep your voice low." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Why would Darnassus pay for troll trophies?", next = "b1" },
        { text = "Why is a night elf fighting with dwarves?", next = "b2" },
        { text = "Where do the best hunts lie?", next = "b3" },
        { text = "I am Kaldorei too, sister. Elune guide your arrows.", next = "b4", when = { race = "NightElf" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because Fandral Staghelm has given the order. Every troll on this field is to be cut down, and their foolish claim that they birthed the Kaldorei answered with force. Bring me their mojo, and Darnassus will know your name." } },
      choices = {
        { text = "Isn't collecting trophies a cruel business?", next = "b1_1" },
        { text = "The Horde earned this. Collect every trophy.", next = "BACK", reply = "Then bring me what you take, and I will see it counted.", fx = { align = { light = -1 } } },
        { text = "I'll fight them, but I won't cut trophies from the dead.", next = "BACK", reply = "Then you are gentler than this valley. Fight well all the same.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is a soldier's business, and war is cruel whether we keep count or not. The tally tells Darnassus who is fighting and who is merely talking." } },
      choices = {
        { text = "And you trust the tally?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "I trust what I can hold in my hand, and troll mojo has a stink no merchant can fake. Even now I can still smell them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The dwarves stood with us at Hyjal's shadow when the Alliance was young, and Darnassus remembers its friends. Besides, the Horde that marches here also marches in Ashenvale." } },
      choices = {
        { text = "Do the dwarves treat you well?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "They are loud, and they drink until the walls shake, but they fight without fear. I have known worse companions in the forests." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Along the Field of Strife and in the shadow of Iceblood. The Frostwolves send their warriors in waves, and a patient hunter does not have to look far." } },
      choices = {
        { text = "Any advice for a hunter?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Watch the ones who run toward the graveyards, for they always come back. Strike when they are alone, and never chase a wolf rider into the open." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Ishnu-alah, kin. It warms me to hear our tongue in a land of stone and snow. Hunt with me, and we will make the Horde regret this valley." } },
      choices = {
        { text = "Do you miss Teldrassil?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Every night, when the moon rises over these mountains and there is no forest to catch its light. Then I remember why I came, and the longing grows quieter." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The trails of the valley, the habits of the Horde, and the price of troll mojo in Darnassus." } },
    _none = { { id = "tp_none", text = "That is not something a hunter needs to know." } },
  },
}

-- Dirk Swindle: gnome bounty hunter of Dun Baldar, who pays for tauren hooves in Gnomeregan's name.
P:NPC {
  key = "bg_dirk_swindle", id = 14188, name = "Dirk Swindle", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "cheerful", "shrewd" }, values = { "thrifty", "loyal" },

  impression = {
    first = "He grins like a merchant and talks like a sergeant, and you can never tell which one is lying.",
    third = "{name} haggled with Dirk Swindle, the gnomish bounty hunter in Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a customer! Well, a hunter, which is the same thing if you squint. What have you brought me?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew you had the look of someone who comes back. Have you got any hooves?" },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Oh dear, oh dear, a member of the Horde, and in my stall too! Please step away from the ledger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dirk Swindle, bounty hunter, reliable trader, and loyal son of Gnomeregan! I pay for proof that the Horde has lost a few soldiers, and the tauren make for very large proof indeed." },
      },
      again = {
        { id = "h_again1", text = "Anything else? Time is money, you know." },
        { id = "h_again2", text = "Yes, yes, what is it?" },
      },
      choices = {
        { text = "You buy tauren hooves?", next = "b1" },
        { text = "Your name is Swindle. Should I trust you?", next = "b2" },
        { text = "Why are you so far from Gnomeregan?", next = "b3" },
        { text = "A fellow gnome! How's business, cousin?", next = "b4", when = { race = "Gnome" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I do! Word is the tauren single out gnomes here and cut tufts of our glorious hair from the fallen. So we reciprocate: I want them de-hoofed, and I log every hoof." } },
      choices = {
        { text = "What happens to the hooves?", next = "b1_1" },
        { text = "The tauren chose their side. Pay me well.", next = "BACK", reply = "Now you sound like a proper partner! Bring the goods and I bring the coin.", fx = { align = { honor = -1 } } },
        { text = "I'll fight tauren, but I won't hack them apart.", next = "BACK", reply = "Honorable and poor, then. Well, the Guard pays for victories too.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Some go to Ironforge as proof, and some go to the tanners, and I would rather not say where the rest go. A good businessman never wastes anything." } },
      choices = {
        { text = "That's a grim way to do business.", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "War is grim, my friend, and I simply keep the books for it. Someone must, and I have a lovely handwriting." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ha! Everyone asks that, and I always say the same thing: my grandfather was a swindler, but I am an honest gnome with a dishonest name. Ask anyone in Dun Baldar!" } },
      choices = {
        { text = "And what do they say?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "They say I pay on time, which is more than they can say about the quartermaster. That is all the reputation a gnome needs." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "The High Tinkerer himself sent me to defend my gnomish brothers and sisters on this field. Gnomeregan is lost for now, but its people still have friends." } },
      choices = {
        { text = "Do you hope to go home someday?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Every gnome does. The High Tinker says we will take it back, and until then, I save my coins for the day we need to rebuild." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Business is booming, cousin, which is a terrible joke given the state of Gnomeregan. Still, it is good to see a face at my own height for once." } },
      choices = {
        { text = "Any tips for a gnome on the battlefield?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Stay low, stay quick, and let the dwarves stand in front. They are broader than we are, and they do not mind being hit." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Prices, ledgers, and which soldiers owe me coin." } },
    _none = { { id = "tp_none", text = "Hmm, no, that is not in my ledger." } },
  },
}

-- Commander Duffy: Stormpike commander who collects the medals of fallen Frostwolf wing commanders.
P:NPC {
  key = "bg_duffy", id = 13319, name = "Commander Duffy", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "proud" }, values = { "dutiful", "brave" },

  impression = {
    first = "A grizzled dwarf who measures the war by how many wolf riders have fallen from the sky.",
    third = "{name} spoke with Commander Duffy of the Stormpike Guard.",
  },

  greetings = {
    { id = "g_default", text = "Soldier! Have ye come tae talk, or have ye come wi' somethin' shiny for me?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Good, the Frostwolves are still flyin' their beasts over our heads." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf in Dun Baldar! Ye'd best be here tae surrender, for I've no other use for ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Commander Duffy, Stormpike Guard. The Frostwolves send their wing commanders over our walls, an' every one that falls carries a medal I'd like tae see on my table." },
      },
      again = {
        { id = "h_again1", text = "What else, soldier?" },
        { id = "h_again2", text = "Out wi' it." },
      },
      choices = {
        { text = "Tell me about these fallen sky lords.", next = "b1" },
        { text = "How goes the war, Commander?", next = "b2" },
        { text = "Where are you from, Commander?", next = "b3" },
        { text = "I'm a warrior, Commander. Point me at them.", next = "b4", when = { class = "WARRIOR" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "The Frostwolf wing commanders ride their great wyverns an' rain fire on our soldiers. Bring down Guse, Jeztor, or Mulverick, an' bring me their medals as proof." } },
      choices = {
        { text = "Why do their medals matter?", next = "b1_1" },
        { text = "They're soldiers too. Let's take them alive if we can.", next = "BACK", reply = "Alive? Ye're a softer sort than I thought, but I'll no' argue wi' a captured commander.", fx = { align = { honor = 1 } } },
        { text = "Bring them down hard and leave nothing standing.", next = "BACK", reply = "Aye, that's the spirit I like tae hear!", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Because a medal is proof, an' proof wins the Guard more than gold. Every one I hand tae Vanndar tells him the sky is ours again." } },
      choices = {
        { text = "And what do I get for it?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Ye'll get the thanks o' the Guard, a fair reward, an' a story worth tellin' in any tavern in Ironforge. That's more than most soldiers get." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "It goes, which is the best I can say for it. We hold the north, they hold the south, an' the dead pile up in the middle like snowdrifts." } },
      choices = {
        { text = "Can it be won?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Aye, if we stop the wolves at the bridges an' strike while they're still countin' their dead. Vanndar believes it, an' so do I." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Born in Dun Morogh, raised in the Ironforge barracks, an' sent here when the King decided the valley was worth fightin' for. I've no' seen a warm day since." } },
      choices = {
        { text = "Do you miss Ironforge?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "I miss the forges an' the ale, an' I miss sleepin' without a sword by my bed. But a soldier goes where he's sent." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Ha! A proper fighter, an' no mistake. Go wi' the Ram Riders, an' strike at their flanks while their wing commanders are busy." } },
      choices = {
        { text = "Any advice for the fight?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Keep yer shield high when the wyverns come in low, an' never chase a rider into the Frostwolf graveyard. Too many good lads died that way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Frostwolf commanders, the skies over Dun Baldar, and how many of them I've seen fall." } },
    _none = { { id = "tp_none", text = "I've no' heard o' that, soldier." } },
  },
}

-- Commander Louis Philips: Forsaken commander at Tower Point, brother of the Alliance's Karl Philips.
P:NPC {
  key = "bg_louis_philips", id = 13154, name = "Commander Louis Philips", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "cold", "bitter" }, values = { "loyal", "disciplined" },

  impression = {
    first = "His voice is dry as old bone, and when he speaks of his brother, it grows drier still.",
    third = "{name} spoke with Commander Louis Philips at Tower Point.",
  },

  greetings = {
    { id = "g_default", text = "Living soldier, I presume you've come with orders, or bones. I have use for both." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I appreciate punctuality; it is one of the few habits death did not take from me." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You smell of the living and of my brother's banner. Leave before I lose my patience." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Commander Louis Philips, and I hold Tower Point for the Frostwolves. In life I was a soldier of Lordaeron. Now I am a soldier of the Dark Lady, and the difference is less than you would think." },
      },
      again = {
        { id = "h_again1", text = "Something else, then?" },
        { id = "h_again2", text = "Speak." },
      },
      choices = {
        { text = "You have a brother among the Alliance?", next = "b1" },
        { text = "Why do you need human bones?", next = "b2" },
        { text = "What is Tower Point like?", next = "b3" },
        { text = "A fellow Forsaken. How fares the Dark Lady's war?", next = "b4", when = { race = "Scourge" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Karl. He commands for the Stormpike in Dun Baldar, and he looks at me as if I were a ghost he would rather forget. Perhaps I am." } },
      choices = {
        { text = "Do you hate him?", next = "b1_1" },
        { text = "Then kill him. He chose the living.", next = "BACK", reply = "Yes, he did, and that choice will cost him.", fx = { align = { light = -1 } } },
        { text = "He's still your brother. Spare him if you can.", next = "BACK", reply = "A sentimental thought, but I will not forget you said it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Hate takes warmth, and I have very little of that left. I would like him to understand what the living did to us, and if he cannot, then I would like his head." } },
      choices = {
        { text = "Could you ever make peace with him?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Peace would require him to admit that the Forsaken are still people. I do not expect it, but I would be lying if I said I never wondered." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "I do extra work on the side for the Dark Apothecaries of the Undercity. They want human bone chips for their cure for the human condition, and the Stormpike field plenty of humans." } },
      choices = {
        { text = "Isn't that a grim request?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It is a practical one. The living bury their bones and forget them, and the Forsaken put them to use. I find that wiser." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Cold, high, and quiet, until the Alliance comes. Then it is loud for a while, and then quiet again." } },
      choices = {
        { text = "Will it hold?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "It held last night, and it will hold tonight. Beyond that, I make no promises to anyone." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Well enough, cousin, and better here than in many places. The orcs fight beside us without too many questions, and I value that more than I expected." } },
      choices = {
        { text = "Do the orcs trust us?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "They trust our blades, and that is enough. Drek'Thar has never once asked what I eat." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Tower Point, the dead of this valley, and what the living refuse to remember." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not care to." } },
  },
}

-- Corporal Noreg Stormpike: Stormpike corporal in Dun Baldar, eager to send soldiers after Frostwolf orcs.
P:NPC {
  key = "bg_noreg_stormpike", id = 13447, name = "Corporal Noreg Stormpike", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "boisterous", "eager" }, values = { "brave", "loyal" },

  impression = {
    first = "A young dwarf with a booming voice and a habit of shouting 'orcs' far too often.",
    third = "{name} took orders from Corporal Noreg Stormpike in Dun Baldar.",
  },

  greetings = {
    { id = "g_default", text = "Another soldier! Come here, lad, an' let me tell ye about the orcs!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have ye killed any more orcs yet? I want tae hear all about it." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "An orc? Here? In the middle o' Dun Baldar? Somebody fetch my axe!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Corporal Noreg Stormpike, an' aye, the name means what ye think it means, though I'm a long way down the family tree. I'm lookin' for soldiers who want tae kill orcs, an' I'm lookin' right at ye." },
      },
      again = {
        { id = "h_again1", text = "Aye? What else?" },
        { id = "h_again2", text = "More questions, eh? Ask away!" },
      },
      choices = {
        { text = "You want me to kill orcs?", next = "b1" },
        { text = "Are you related to Vanndar?", next = "b2" },
        { text = "What's it like serving in Dun Baldar?", next = "b3" },
        { text = "A fellow dwarf! How goes the clan?", next = "b4", when = { race = "Dwarf" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I want ye tae kill a great many orcs! The Frostwolves are swarmin' the valley, an' every one ye bring down is one less tae come knockin' at our gate." } },
      choices = {
        { text = "Why do you hate them so much?", next = "b1_1" },
        { text = "Then let's kill every one of them!", next = "BACK", reply = "That's the spirit! MORE ORCS!", fx = { align = { order = -1 } } },
        { text = "I'll fight them, but I'll keep my head clear.", next = "BACK", reply = "A cool head, eh? Well, someone's got tae have one.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Hate's a strong word, but they burned my cousin's mine an' chased my clan out o' half the valley. I've good reasons, lad." } },
      choices = {
        { text = "Do they have reasons too?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Aye, I suppose they think the valley's theirs. But we dug it, an' we bled for it, an' that counts for somethin'." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Distantly, aye, though the General doesnae always remember my name. Still, I carry it proud an' I mean tae earn it." } },
      choices = {
        { text = "How will you earn it?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "By killin' more orcs than any Stormpike before me! An' by livin' long enough tae tell the tale." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Loud, cold, an' full o' good ale. The Guard's a family, an' I wouldnae trade it for a warm bed in Ironforge." } },
      choices = {
        { text = "Truly?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Well, maybe for one night. But I'd be back here in the mornin'!" } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "The clan's grand, lad! Holdin' the valley, singin' loud, an' killin' orcs every chance we get. Ye'll fit right in." } },
      choices = {
        { text = "Teach me a war song.", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Ha! I'll teach ye one after the battle, when we're both drunk enough tae sing it proper." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Orcs! How many I've killed, where they hide, an' how tae kill more." } },
    _none = { { id = "tp_none", text = "Never heard o' it. Is it an orc?" } },
  },
}

-- Field Marshal Teravaine: human field marshal who rallies Alliance soldiers at the start of each battle.
P:NPC {
  key = "bg_teravaine", id = 13446, name = "Field Marshal Teravaine", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "stern", "composed" }, values = { "disciplined", "dutiful" },

  impression = {
    first = "He stands like a man who has commanded armies, with eyes that see the whole field at once.",
    third = "{name} received orders from Field Marshal Teravaine.",
  },

  greetings = {
    { id = "g_default", text = "Soldier. You are ready for battle, I hope, for the Horde will not wait for us." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Good. I need soldiers who come back." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. You are a long way behind our lines, and I suggest you leave before I call the guards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Field Marshal Teravaine. I command the Alliance forces that march from Dun Baldar, and I give the order to begin the attack. When the horns sound, I want every soldier moving." },
      },
      again = {
        { id = "h_again1", text = "What else, soldier?" },
        { id = "h_again2", text = "Make it quick." },
      },
      choices = {
        { text = "What is the plan of attack?", next = "b1" },
        { text = "Why does Stormwind fight here?", next = "b2" },
        { text = "How long have you been a soldier?", next = "b3" },
        { text = "I'm a paladin, Field Marshal. The Light is with us.", next = "b4", when = { class = "PALADIN" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Push south through Stonehearth, take the towers and graveyards, and strike at Frostwolf Keep. Drek'Thar is the heart of their army, and when he falls, the Horde breaks." } },
      choices = {
        { text = "And if the Horde attacks Dun Baldar?", next = "b1_1" },
        { text = "Strike hard and fast. No mercy.", next = "BACK", reply = "Yes, that is how we win.", fx = { align = { honor = -1 } } },
        { text = "Discipline first. Hold the line and advance with care.", next = "BACK", reply = "A careful soldier lives longer, and I value that.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then the defenders hold, and the attackers keep pushing. A battle is won by those who move forward, not by those who hide behind walls." } },
      choices = {
        { text = "Isn't that a risky strategy?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "All war is risky, soldier. I would rather risk a bold push than lose slowly behind our own gates." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Alliance stands together, soldier, and the dwarves asked for our help. Besides, the Horde grows stronger every year, and this valley is as good a place as any to stop them." } },
      choices = {
        { text = "Do you trust the dwarves?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "I trust their courage, and I trust their axes. That is more than I can say for some of the nobles in Stormwind." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Since I was old enough to hold a pike. I fought in the Second War, and I have been fighting ever since." } },
      choices = {
        { text = "What was the Second War like?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Worse than this, soldier. The Horde burned Lordaeron's villages and laid siege to its cities. We won, but the cost was terrible." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Good. The Light gives soldiers courage, and we need every bit of it. Stand at the front, and let the Horde see your shield." } },
      choices = {
        { text = "Will the Light protect us all?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "The Light protects those who stand for something, soldier. Make sure you stand for the right thing." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The battle plans, the Alliance's strength, and the Horde's weaknesses." } },
    _none = { { id = "tp_none", text = "That is not my concern, soldier." } },
  },
}

-- Frostwolf Stable Master: orc who keeps the Frostwolf Clan's wolf pens and needs new wolves tamed.
P:NPC {
  key = "bg_frostwolf_stablemaster", id = 13616, name = "Frostwolf Stable Master", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "gruff", "patient" }, values = { "loyal", "practical" },

  impression = {
    first = "He smells of wolf and leather, and the wolves seem to trust him more than the orcs do.",
    third = "{name} spoke with the Frostwolf Stable Master.",
  },

  greetings = {
    { id = "g_default", text = "You have come to the wolf pens. Mind your hands, for the young ones bite." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The wolves remember you, which is more than I can say for most visitors." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance, in the wolf pens! The wolves would like to meet you, but I will spare you that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I keep the Frostwolf stables, and the stables are empty, because the Stormpike have killed too many of our wolves. I need hunters to bring me young wolves from the valley, so the riders can ride again." },
      },
      again = {
        { id = "h_again1", text = "What do you want?" },
        { id = "h_again2", text = "Speak, I am busy with the pups." },
      },
      choices = {
        { text = "How do you tame a frost wolf?", next = "b1" },
        { text = "Why are the stables empty?", next = "b2" },
        { text = "Where can I find wild wolves?", next = "b3" },
        { text = "I'm a hunter. I know beasts.", next = "b4", when = { class = "HUNTER" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "With patience, and with a collar the wolf can respect. A frost wolf is not a dog; it chooses its rider, and it chooses only once." } },
      choices = {
        { text = "What happens if a wolf refuses?", next = "b1_1" },
        { text = "The wolves are tools of war. Break them if you must.", next = "BACK", reply = "Spoken like a fool. A broken wolf is worthless.", fx = { align = { light = -1 } } },
        { text = "The wolves are our kin. Treat them with respect.", next = "BACK", reply = "Yes. That is the Frostwolf way.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then it goes back to the wild, and we find another. A wolf that does not choose its rider will throw him in battle." } },
      choices = {
        { text = "Has a wolf ever refused you?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Once, when I was young and foolish. I learned more from that wolf than from any teacher." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Stormpike hunt our wolves, and the war takes more than we can breed. If we cannot replace them, the riders will fight on foot." } },
      choices = {
        { text = "Can the clan survive without its wolves?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The clan survived without much, before Thrall came. But we would not be Frostwolves without them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "In the hills of the valley, near the Frostwolf graveyard and the Iceblood. They are fierce, so take care." } },
      choices = {
        { text = "How do I bring one back?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Use the collar I give you, and bring it back alive. A dead wolf is no use to the riders." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Then you understand what I mean when I say a beast must choose you. Go into the hills, and bring me wolves that will choose a rider." } },
      choices = {
        { text = "Do you have advice for a hunter?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Move slowly, and let the wolf see you first. A frost wolf respects courage, but not foolishness." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Wolves, stables, and the riders who depend on them." } },
    _none = { { id = "tp_none", text = "I know wolves, not that." } },
  },
}

-- Frostwolf Wolf Rider Commander: orc who commands the Frostwolf wolf riders and wants ram hides for their harnesses.
P:NPC {
  key = "bg_wolf_rider_cmdr", id = 13441, name = "Frostwolf Wolf Rider Commander", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "proud" }, values = { "brave", "loyal" },

  impression = {
    first = "He sits his wolf as if he were born on it, and perhaps he was.",
    third = "{name} spoke with the Frostwolf Wolf Rider Commander.",
  },

  greetings = {
    { id = "g_default", text = "You come to the riders. Good. We need hides for harnesses, and you look like you can hunt." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Bring me hides, and the riders will remember your name." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "An Alliance soldier, here among the wolves? You are either brave or stupid." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I command the wolf riders of the Frostwolf Clan. We strike fast, we strike hard, and we need harnesses made from the hides of the Stormpike rams." },
      },
      again = {
        { id = "h_again1", text = "What do you want?" },
        { id = "h_again2", text = "Speak quickly." },
      },
      choices = {
        { text = "Why ram hides?", next = "b1" },
        { text = "How do you fight from a wolf?", next = "b2" },
        { text = "What do you think of Drek'Thar?", next = "b3" },
        { text = "I'm an orc. The Frostwolves are my kin too.", next = "b4", when = { race = "Orc" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the rams of the Stormpike are tough, and their hides make the best harnesses. And because every ram we take is one less for the dwarves to ride." } },
      choices = {
        { text = "Isn't that a strange kind of war?", next = "b1_1" },
        { text = "Take every ram they have. Leave them on foot.", next = "BACK", reply = "Ha! Yes, that is the way!", fx = { align = { honor = -1 } } },
        { text = "Take only what you need. Waste is dishonor.", next = "BACK", reply = "A rider with honor. Thrall would approve.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "War is war, and a rider must take what he can from the enemy. The dwarves would do the same to our wolves." } },
      choices = {
        { text = "Do the riders fear the dwarves?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "We fear nothing. But we respect their rams, and we respect their axes." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "We ride fast, strike at the flanks, and pull back before the dwarves can close. A wolf rider who stands still is a dead one." } },
      choices = {
        { text = "Can anyone become a wolf rider?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Only those the wolves choose, and only those who prove themselves in battle. It is not for the weak." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Drek'Thar is our leader and our elder. He has seen much, and he has led the Frostwolves through hard times. I follow him without question." } },
      choices = {
        { text = "Will we win this war?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "We will fight until the valley is ours, or until we are all dead. That is the Frostwolf way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Then you know the riders, and you know what we fight for. Ride with us, brother, and we will take this valley back." } },
      choices = {
        { text = "What clan is the strongest?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "The Frostwolves, of course. We survived exile, and we came back stronger. No other clan can say that." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The riders, the wolves, and how to strike at the dwarves." } },
    _none = { { id = "tp_none", text = "I do not know. Ask someone else." } },
  },
}

-- Master Engineer Zinfizzlex: goblin engineer who sells shredder parts to whichever side pays.
P:NPC {
  key = "bg_zinfizzlex", id = 13377, name = "Master Engineer Zinfizzlex", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  temper = { "cheerful", "greedy" }, values = { "thrifty", "clever" },

  impression = {
    first = "He grins at everyone, counts every coin twice, and never asks which army you fight for.",
    third = "{name} talked shop with Master Engineer Zinfizzlex.",
  },

  greetings = {
    { id = "g_default", text = "Customer! Come in, come in! What can Zinfizzlex build for you today?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You like my machines, eh? Everybody likes my machines!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Master Engineer Zinfizzlex, at your service! I build portable shredders for the battlefield, and I build them for anyone with the coin and the parts." },
      },
      again = {
        { id = "h_again1", text = "What else? Time is money!" },
        { id = "h_again2", text = "Yes, yes, what?" },
      },
      choices = {
        { text = "You sell to both sides?", next = "b1" },
        { text = "What is a portable shredder?", next = "b2" },
        { text = "Where do you get your parts?", next = "b3" },
        { text = "I know my way around a lockbox. Need a partner?", next = "b4", when = { class = "ROGUE" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Of course! Gold is gold, and war is good business. The Horde pays, the Alliance pays, and I keep my shop open." } },
      choices = {
        { text = "Isn't that dishonorable?", next = "b1_1" },
        { text = "Smart business. Profit is profit.", next = "BACK", reply = "Ha! A sensible customer!", fx = { align = { order = -1 } } },
        { text = "You should pick a side and stand by it.", next = "BACK", reply = "Pick a side? And lose half my customers? No, thank you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Honor doesn't pay the bills, friend. Besides, I make the best shredders in the valley, and both sides need them." } },
      choices = {
        { text = "Does anyone ever threaten you?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "All the time! But nobody wants to kill the only engineer who can fix their shredders." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "A shredder that fits in your pack, more or less! You bring me the parts, I put it together, and you drive it into battle." } },
      choices = {
        { text = "Is it safe?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Safe-ish! Mostly. I have only had a few explode, and those were the customer's fault." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "From the battlefield, of course! Bring me the scrap left by broken machines, and I'll turn it into a working shredder." } },
      choices = {
        { text = "And what do you charge?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Just the parts and a small fee. Very reasonable, very fair. Ask anyone!" } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Ha! A rogue with an eye for business! Bring me parts nobody else can find, and we will both get rich." } },
      choices = {
        { text = "What kind of parts?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Gears, springs, anything shiny that fell off a broken machine. Don't tell me where you found them, and I won't ask." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Engineering, shredders, and how to make a profit in a war." } },
    _none = { { id = "tp_none", text = "Never heard of it. Is it worth money?" } },
  },
}

-- Mountaineer Boombellow: Stormpike mountaineer who sends soldiers to supply the Guard's quartermaster.
P:NPC {
  key = "bg_boombellow", id = 13797, name = "Mountaineer Boombellow", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "loud", "cheerful" }, values = { "loyal", "hardy" },

  impression = {
    first = "His voice carries across the valley, and his beard is full of snow.",
    third = "{name} spoke with Mountaineer Boombellow.",
  },

  greetings = {
    { id = "g_default", text = "Ho there! Another soldier for the Guard? Grand, grand, we need every one o' ye!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, lad! The mountains are still cold, an' I'm still loud!" },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Horde soldier in my camp? Ye'd best run, before I start shoutin'!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mountaineer Boombellow, an' aye, the name's earned! I keep the supplies movin' tae the Quartermaster, an' I send soldiers tae help when the wagons run dry." },
      },
      again = {
        { id = "h_again1", text = "What else, lad?" },
        { id = "h_again2", text = "Aye?" },
      },
      choices = {
        { text = "What do you need from me?", next = "b1" },
        { text = "Why are you called Boombellow?", next = "b2" },
        { text = "What do mountaineers do?", next = "b3" },
        { text = "I'm a dwarf. The mountains are in my blood.", next = "b4", when = { race = "Dwarf" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Supplies, lad! Bring what ye find tae the Quartermaster, an' the Guard will thank ye for it." } },
      choices = {
        { text = "What kind of supplies?", next = "b1_1" },
        { text = "Supplies are the key to victory.", next = "BACK", reply = "Aye, ye've got sense!", fx = { align = { order = 1 } } },
        { text = "Forget supplies, just fight!", next = "BACK", reply = "Ha! Fightin's grand, but ye cannae fight on an empty belly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Anything useful: armor scraps, food, weapons. The Guard uses everything." } },
      choices = {
        { text = "Even the scraps?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Especially the scraps! Murgot can turn them into armor fit for a king." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Because I can shout across the valley, lad! The Frostwolves hear me comin' an' run for the hills." } },
      choices = {
        { text = "Does it really work?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Well, it scares the young ones, at least." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "We scout the mountains, guard the passes, an' keep the roads open. Without us, Dun Baldar would starve in a week." } },
      choices = {
        { text = "Is it hard work?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "It's cold work, but a dwarf doesnae mind the cold." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Aye, I can see it in ye! Ye've the look o' a mountaineer, lad." } },
      choices = {
        { text = "Can I join the mountaineers?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "After the war, lad. For now, the Guard needs ye on the field." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The mountains, the supply roads, an' how tae shout loud enough tae wake the dead." } },
    _none = { { id = "tp_none", text = "I've no idea, lad." } },
  },
}

-- Najak Hexxen: Darkspear troll bounty hunter in Frostwolf Village.
P:NPC {
  key = "bg_najak_hexxen", id = 14185, name = "Najak Hexxen", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "sly", "cheerful" }, values = { "loyal", "cunning" },

  impression = {
    first = "He grins with all his tusks and speaks of heads the way a merchant speaks of grain.",
    third = "{name} spoke with Najak Hexxen, the troll bounty hunter in Frostwolf Village.",
  },

  greetings = {
    { id = "g_default", text = "Hey mon, you be lookin' for work? Najak always got work for da brave ones." },
    { id = "g_back", when = { metBefore = true }, text = "You back, mon! Najak knew you be comin' back. Da Darkspear never forget a friend." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance in da village? You got some nerve, mon. Najak got some voodoo for you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Najak Hexxen, bounty hunter for da Darkspear. Da tribe pay good for proof dat da Alliance be fallin', an' Najak be da one who count it." },
      },
      again = {
        { id = "h_again1", text = "What you need, mon?" },
        { id = "h_again2", text = "Speak up, mon." },
      },
      choices = {
        { text = "What does the Darkspear want?", next = "b1" },
        { text = "Why is a troll fighting in the snow?", next = "b2" },
        { text = "How do you hunt here?", next = "b3" },
        { text = "I'm Darkspear too, mon. Da loa be with us.", next = "b4", when = { race = "Troll" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Da Darkspear want da night elves to know dey not welcome in dis valley. Bring Najak proof of da kaldorei you kill, an' Sen'jin's people reward you." } },
      choices = {
        { text = "Why the night elves?", next = "b1_1" },
        { text = "They earned it. Count every one.", next = "BACK", reply = "Ha! Dat da spirit, mon!", fx = { align = { light = -1 } } },
        { text = "I'll fight them, but I'll leave the dead in peace.", next = "BACK", reply = "Soft heart, mon. Da loa might like dat, though.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Before da night elves, dere was troll, mon. Dey came from us, an' now Staghelm want to wipe us out so nobody remember. It will not happen." } },
      choices = {
        { text = "Is that reason enough?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Reason enough for Najak. Da loa don't forget, an' neither do da trolls." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Because Thrall ask, an' da Darkspear owe Thrall everyt'ing. He save us from da sea witch an' da murlocs, so we fight wherever he point." } },
      choices = {
        { text = "Do you miss the islands?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Every day, mon. Dis cold get into da bones. But da Darkspear go where da Horde need dem." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Patient, mon. Najak wait in da trees near da Field of Strife, an' when da Alliance run past, Najak strike quick." } },
      choices = {
        { text = "Any advice?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Never fight da dwarves head on, mon. Dey too thick. Go for da elves; dey fall quicker." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Aye, cousin! Da loa be watchin', an' dey like what dey see. Hunt with Najak, an' we make da Darkspear proud." } },
      choices = {
        { text = "What loa do you follow?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Najak follow Bwonsamdi, mon, da loa of da dead. In dis valley, he very busy." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunting, da loa, an' da price of a kaldorei head." } },
    _none = { { id = "tp_none", text = "Najak don't know dat, mon." } },
  },
}

-- Ravak Grimtotem: Grimtotem tauren bounty hunter, sent by Magatha to study the other races.
P:NPC {
  key = "bg_ravak_grimtotem", id = 14186, name = "Ravak Grimtotem", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "cold", "calculating" }, values = { "ambitious", "patient" },

  impression = {
    first = "He watches everything with a scholar's curiosity, which is somehow more unsettling than anger.",
    third = "{name} spoke with Ravak Grimtotem, the tauren bounty hunter.",
  },

  greetings = {
    { id = "g_default", text = "You are here for work. Good. Ravak has work for those who do not flinch." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your hands are steady. Ravak notices such things." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "The Alliance walks among the Frostwolves. Ravak finds this most interesting, but not for long." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ravak Grimtotem. Magatha sent me to learn about the other races of this world, and there is no better place to study them than on a battlefield." },
      },
      again = {
        { id = "h_again1", text = "What else do you wish to know?" },
        { id = "h_again2", text = "Speak." },
      },
      choices = {
        { text = "What does Magatha want to learn?", next = "b1" },
        { text = "What bounty do you offer?", next = "b2" },
        { text = "Why do the Grimtotem fight for the Horde?", next = "b3" },
        { text = "I'm a tauren. Cairne leads our people.", next = "b4", when = { race = "Tauren" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "How they fight, how they die, and what makes them weak. The Grimtotem believe knowledge is power, and Magatha seeks power." } },
      choices = {
        { text = "Isn't that a dark purpose?", next = "b1_1" },
        { text = "Knowledge is power. Take what you can.", next = "BACK", reply = "Wise words. Magatha would approve.", fx = { align = { order = -1 } } },
        { text = "Cairne leads the tauren, not Magatha.", next = "BACK", reply = "Cairne leads for now. We shall see.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is a purpose. Cairne trusts the Horde to keep the tauren safe. Magatha trusts only herself, and Ravak serves Magatha." } },
      choices = {
        { text = "Do you agree with her?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Ravak agrees with whoever is wise enough to see the truth. Magatha sees more than most." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Gnome samples. Bring me tufts of gnome hair, and the tauren will know you as an ally. Magatha wants to know why such small creatures endure so well." } },
      choices = {
        { text = "What have you learned?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "That the gnomes are pitifully weak and tiny, yet they survive far more than they should. That resilience is what Magatha wants." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Because the Horde is strong, and the Grimtotem go where the strength is. For now, that is with Thrall." } },
      choices = {
        { text = "And later?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Later, we shall see. The earth turns, and so do alliances." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Cairne is old, and Thunder Bluff grows soft. But you are tauren, so Ravak will speak plainly with you." } },
      choices = {
        { text = "Speak plainly, then.", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "The Grimtotem do not forget that the land was ours before the Horde came. Remember that, when the time comes." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The races of the Alliance, their strengths, and their weaknesses." } },
    _none = { { id = "tp_none", text = "That is not worth Ravak's time." } },
  },
}

-- Stormpike Ram Rider Commander: dwarf who commands the Stormpike ram riders and wants frost wolf hides for harnesses.
P:NPC {
  key = "bg_ram_rider_cmdr", id = 13577, name = "Stormpike Ram Rider Commander", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "proud", "gruff" }, values = { "brave", "loyal" },

  impression = {
    first = "He sits his ram like a king on a throne, and the ram seems to know it.",
    third = "{name} spoke with the Stormpike Ram Rider Commander.",
  },

  greetings = {
    { id = "g_default", text = "Ho, soldier! Ye've come tae the riders, have ye? Good, we need hides for harnesses." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Bring me hides, an' I'll put ye on a ram yerself." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf in the stables! The rams would like tae have a word wi' ye." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I command the Stormpike Ram Riders. We charge the Frostwolf lines on the backs o' the finest rams in Khaz Modan, an' we need the hides o' their wolves for our harnesses." },
      },
      again = {
        { id = "h_again1", text = "What else?" },
        { id = "h_again2", text = "Aye?" },
      },
      choices = {
        { text = "Why wolf hides?", next = "b1" },
        { text = "How do you ride a ram?", next = "b2" },
        { text = "What do the riders do in battle?", next = "b3" },
        { text = "I'm a dwarf. I was born on a ram.", next = "b4", when = { race = "Dwarf" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Frost wolf hide is warm, tough, an' it doesnae crack in the cold. Every harness I make from it is a harness the wolves cannae use." } },
      choices = {
        { text = "Seems harsh on the wolves.", next = "b1_1" },
        { text = "Take every wolf. Leave them crawling.", next = "BACK", reply = "Ha! That's the spirit!", fx = { align = { honor = -1 } } },
        { text = "Hunt them fairly. No needless slaughter.", next = "BACK", reply = "Aye, ye've a sense o' honor. I like that.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Aye, it is. But the wolves bite, an' they bite hard. War's no' kind tae anyone, beast or dwarf." } },
      choices = {
        { text = "Do you respect the Frostwolf riders?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Aye, I do. They're fierce, an' they ride well. But they're on the wrong side o' the valley." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wi' strong knees an' a stronger stomach! A ram's no' a horse; it goes where it likes, an' ye go wi' it." } },
      choices = {
        { text = "Can I learn?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Aye, if ye've the courage. Bring me hides first, an' then we'll see." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "We charge the enemy lines, break their formations, an' cut down their stragglers. A ram charge can scatter an army." } },
      choices = {
        { text = "Is it dangerous?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Everythin' in this valley's dangerous. But aye, the riders take more than their share o' it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Ha! Then ye'll fit right in, lad. Show me what ye can do in the field." } },
      choices = {
        { text = "Where should I ride?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Along the Field o' Strife, an' then toward Frostwolf Keep. Strike hard, an' dinnae stop." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rams, riders, an' the best ways tae break a Frostwolf line." } },
    _none = { { id = "tp_none", text = "Never heard o' it." } },
  },
}

-- Stormpike Stable Master: dwarf who keeps the Stormpike rams and needs new ones tamed.
P:NPC {
  key = "bg_stormpike_stablemaster", id = 13617, name = "Stormpike Stable Master", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "stormpike" }, temper = { "gruff", "kindly" }, values = { "loyal", "practical" },

  impression = {
    first = "He smells o' ram an' hay, an' he talks tae the beasts more than tae people.",
    third = "{name} spoke with the Stormpike Stable Master.",
  },

  greetings = {
    { id = "g_default", text = "Ye've come tae the stables, lad. Mind yer step, the rams dinnae like strangers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The rams remember ye, an' so do I." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf in my stables! The rams'll have yer hide before I do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I keep the Stormpike stables, an' the stables are empty, for the Frostwolves have killed too many o' our rams. I need hunters tae bring me wild rams from the valley." },
      },
      again = {
        { id = "h_again1", text = "What else, lad?" },
        { id = "h_again2", text = "Aye?" },
      },
      choices = {
        { text = "How do you tame a ram?", next = "b1" },
        { text = "Why are the stables empty?", next = "b2" },
        { text = "Where can I find wild rams?", next = "b3" },
        { text = "I'm a hunter. Beasts trust me.", next = "b4", when = { class = "HUNTER" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Wi' patience, a stout collar, an' a good bit o' stubbornness. A ram's as stubborn as a dwarf, so it takes one tae know one." } },
      choices = {
        { text = "What if a ram won't be tamed?", next = "b1_1" },
        { text = "Rams are tools. Break them.", next = "BACK", reply = "Break them? Ye'll get a ram that bolts the first time it hears a horn.", fx = { align = { light = -1 } } },
        { text = "Rams are partners. Treat them well.", next = "BACK", reply = "Aye, that's the way.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then I let it go back tae the hills. A ram that doesnae want tae be ridden will throw ye in battle." } },
      choices = {
        { text = "Has a ram ever thrown you?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "More times than I can count, lad. That's how I learned." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Frostwolves hunt our rams, an' the war takes more than we can breed. Without rams, the riders fight on foot." } },
      choices = {
        { text = "Can the Guard manage without them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Aye, but no' as well. A ram charge is worth ten soldiers." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "In the hills above Dun Baldar an' along the eastern ridges. They're quick, so take care." } },
      choices = {
        { text = "How do I bring one back?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Use the collar I give ye, an' lead it back gentle-like. A frightened ram's no use tae anyone." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Then ye'll understand rams better than most. Go intae the hills, an' bring me rams that'll carry a rider." } },
      choices = {
        { text = "Any tips?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Dinnae look a ram in the eye unless ye want tae be charged. Approach from the side, slow an' easy." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rams, stables, an' the riders who depend on them." } },
    _none = { { id = "tp_none", text = "I know rams, no' that." } },
  },
}

-- Warmaster Garrick: orc warmaster who gives the order to launch the Horde's attack.
P:NPC {
  key = "bg_garrick", id = 13449, name = "Warmaster Garrick", gender = "male",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "stern", "fierce" }, values = { "disciplined", "brave" },

  impression = {
    first = "He stands like a wall of muscle, and his voice cuts through the wind like an axe.",
    third = "{name} received orders from Warmaster Garrick.",
  },

  greetings = {
    { id = "g_default", text = "Warrior. You are ready for battle, or you are wasting my time." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. The Horde needs warriors who come back." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You are far from your lines. You will not leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Warmaster Garrick, and I give the order to launch the attack. When the horns sound, the Horde marches north, and the dwarves will learn what fear is." },
      },
      again = {
        { id = "h_again1", text = "What else?" },
        { id = "h_again2", text = "Speak." },
      },
      choices = {
        { text = "What is the plan of attack?", next = "b1" },
        { text = "Why does the Horde fight here?", next = "b2" },
        { text = "How long have you been a warrior?", next = "b3" },
        { text = "I'm a warrior too, Warmaster. Point me at them.", next = "b4", when = { class = "WARRIOR" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Push north through Iceblood and Stonehearth, take their towers and graveyards, and strike at Dun Baldar. Vanndar is the heart of their army, and when he falls, the Alliance breaks." } },
      choices = {
        { text = "And if the Alliance attacks Frostwolf Keep?", next = "b1_1" },
        { text = "Crush them. Show no mercy.", next = "BACK", reply = "Yes. That is how we win.", fx = { align = { honor = -1 } } },
        { text = "Fight with honor. Thrall would want that.", next = "BACK", reply = "Honor is good, but victory is better. Still, I respect your words.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then the defenders hold, and the attackers keep pushing. The Horde does not retreat." } },
      choices = {
        { text = "Isn't that reckless?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "It is the Horde way. We win by pushing harder than the enemy can push back." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Frostwolves have lived in this valley since Thrall's father was exiled. The dwarves want to take it from us, and we will not let them." } },
      choices = {
        { text = "Can the Horde hold the valley?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "We have held it for years, and we will hold it for years more." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "Since before the Dark Portal closed. I fought in the Second War, and I have fought ever since." } },
      choices = {
        { text = "What was the Second War like?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "Bloody. We burned Lordaeron, but the Alliance broke us. Never again." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Good. The front line needs warriors who do not flinch. Go to the Field of Strife, and kill every dwarf you see." } },
      choices = {
        { text = "Any advice?", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Keep your axe sharp and your shield high. The dwarves hit hard, but they fall like anyone else." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The battle plans, the Horde's strength, and the Alliance's weaknesses." } },
    _none = { { id = "tp_none", text = "That is not my concern." } },
  },
}

-- Sergeant Yazra Bloodsnarl: Frostwolf sergeant who pays for Stormpike dwarves slain.
P:NPC {
  key = "bg_yazra_bloodsnarl", id = 13448, name = "Sergeant Yazra Bloodsnarl", gender = "female",
  bible = "bibles/alterac_valley.md", role = "questgiver", tier = "quest",
  communities = { "frostwolf" }, temper = { "fierce", "blunt" }, values = { "brave", "loyal" },

  impression = {
    first = "She snarls more than she speaks, and her axe looks well used.",
    third = "{name} spoke with Sergeant Yazra Bloodsnarl.",
  },

  greetings = {
    { id = "g_default", text = "You! You look like you can kill dwarves. Can you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you killed any more dwarves?" },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "An Alliance soldier, here? My axe is hungry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sergeant Yazra Bloodsnarl, and I want dwarves dead. The Stormpike have taken too much from the Frostwolves, and I mean to take it back, one beard at a time." },
      },
      again = {
        { id = "h_again1", text = "What?" },
        { id = "h_again2", text = "Speak." },
      },
      choices = {
        { text = "Why do you hate the dwarves so much?", next = "b1" },
        { text = "How do you fight dwarves?", next = "b2" },
        { text = "What do you think of Drek'Thar?", next = "b3" },
        { text = "I'm an orc, sister. Lok'tar ogar!", next = "b4", when = { race = "Orc" } },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "They came to our valley, dug up our mountains, and killed our people. Hate is the least they deserve." } },
      choices = {
        { text = "Do you think they hate us too?", next = "b1_1" },
        { text = "Kill every one of them.", next = "BACK", reply = "Yes! That is the spirit!", fx = { align = { order = -1 } } },
        { text = "Kill the soldiers, but spare the miners.", next = "BACK", reply = "Soft words. But I will remember them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Of course they do, and they should. We will make them fear us as well." } },
      choices = {
        { text = "Will there ever be peace?", next = "b1_1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1_1 = {
      lines = { { id = "b111_d", text = "Peace? When the last dwarf leaves this valley, maybe." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Hit them hard, hit them often, and do not stop until they fall. They are stubborn, but so am I." } },
      choices = {
        { text = "Any tricks?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Go for the legs. They are short, and they fall hard." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b3 = {
      lines = { { id = "b3_d", text = "He is wise, and he leads us well. I would die for him." } },
      choices = {
        { text = "Would he die for you?", next = "b3_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b3_1 = {
      lines = { { id = "b31_d", text = "He would. That is why we follow him." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    b4 = {
      lines = { { id = "b4_d", text = "Lok'tar! You have the spirit of a Frostwolf. Go and kill some dwarves." } },
      choices = {
        { text = "Teach me a battle cry.", next = "b4_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b4_1 = {
      lines = { { id = "b41_d", text = "Shout as loud as you can, and swing as hard as you can. That is the only battle cry you need." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Dwarves, and how to kill them." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not care." } },
  },
}

-- Aggi Rumblestomp: dwarf who holds Coldtooth Mine for the Stormpike when the Guard controls it.
P:NPC {
  key = "bg_aggi_rumblestomp", id = 13086, name = "Aggi Rumblestomp", gender = "male",
  bible = "bibles/alterac_valley.md", role = "guard", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "stubborn" }, values = { "dutiful", "hardy" },

  impression = {
    first = "A broad dwarf with soot in his beard, guarding a mine full of kobold leavings.",
    third = "{name} spoke with Aggi Rumblestomp in Coldtooth Mine.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back in Coldtooth, friend! Mind the low beams, an' I'll tell the others ye're welcome down here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Say yer business quick an' get out o' my mine, before I count ye among the kobold leavings." },
    { id = "g_default", text = "Coldtooth's ours for now, lad, an' I mean tae keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the mine, are ye? Mind the low beams." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf in my mine! Ye'll leave it in a cart, then." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Kinsman! Grab a lantern an' help me count the carts, would ye?" },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome in Coldtooth! Mind the kobolds, they'd carry ye off like a candle." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was a miner in Dun Morogh before the Guard came north. Grew up in the shafts near Gol'Bolar, an' when Vanndar called for dwarves who knew the dark, I put down my pick an' picked up an axe. Well, I brought the pick too." },
      },
      choices = {
        { text = "The mine should be worked by the Guard's rules, not greed.", next = "BACK", reply = "Aye, that's how Vanndar wants it, an' it's how I run Coldtooth.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Forget the Guard's rules; dig wherever the best ore is.", next = "BACK", reply = "An' bring the roof down on all of us? There's rules in a mine for a reason, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you miss Dun Morogh?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_y_miss", text = "I miss my mother's kitchen an' the sound o' Kharanos on a feast night. Alterac's colder an' meaner, but there's somethin' in these hills that feels like it's waitin' for us. Maybe that's just the wind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hold = {
      lines = {
        { id = "y_y_hold", text = "Barely, some days. The wolves send their raiders, the kobolds come up the side shafts, an' I've nine dwarves tae hold the lot. I'd give my good beard for nine more." },
        { id = "y_y_hold_v0", when = { class = "WARRIOR" }, text = "Barely, warrior. Nine dwarves, wolves at the front an' kobolds at the back. If ye've a shield, I've a spot for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_masha = {
      lines = {
        { id = "y_y_masha", text = "There's an orc lass, Masha Swiftcut, who holds this mine when they take it. I've crossed blades wi' her four times. She's fast as a ferret an' twice as rude, an' I'd be lyin' if I said I didnae respect her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_kobold = {
      lines = {
        { id = "y_y_kobold", text = "The kobolds were here first. Some o' the lads want tae clear them out for good, every last one. Others say leave them be, they're only defendin' their burrows. What would ye do?" },
      },
      choices = {
        { text = "Leave the kobolds be unless they attack.", next = "BACK", reply = "Ye've a kind heart. I'll tell the lads tae ease off, for a while.", fx = { align = { light = 1 } } },
        { text = "Clear them out. A mine can't have two masters.", next = "BACK", reply = "Hard words, but sensible ones. I'll pass them up the line.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Aggi Rumblestomp, holdin' Coldtooth Mine for the Guard. While the banner's ours, the ore goes north tae Dun Baldar, an' every lump o' it is a blow against the wolves." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What's mined here?", next = "b1" },
        { text = "How often does the mine change hands?", next = "b2" },
        { text = "Where did you learn mining?", next = "y_who" },
        { text = "Can you hold the mine?", next = "y_hold" },
        { text = "Who holds it when you don't?", next = "y_masha" },
        { text = "What should be done about the kobolds?", next = "y_kobold" },
        { text = "I've swung a pick myself.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know a good seam when ye see one. Coldtooth's is thin, but it's ours." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Iron, mostly, an' a wee bit o' everythin' else the kobolds didnae carry off. Every cart that reaches Dun Baldar means more supplies for the Guard." } },
      choices = {
        { text = "What about the kobolds?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The Snivvle lot still creep about the deep tunnels, an' they've no love for us or the orcs. I keep a candle in one hand an' an axe in the other." } },
      choices = {
        { text = "Kill any orc who comes for the mine.", next = "BACK", reply = "Aye, an' bury them in the slag heap.", fx = { align = { light = -1 } } },
        { text = "Hold it, but let the miners flee if it falls.", next = "BACK", reply = "Aye, a fair thought. Miners are no' soldiers.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Too often for my likin'. The Frostwolves take it, we take it back, an' the poor miners just keep diggin' for whoever's in charge." } },
      choices = {
        { text = "Do the miners mind?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "They mind the dyin', no' the bosses. A miner's loyal tae the seam first an' the banner second." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    masha = { { id = "tp_ymasha", text = "Masha Swiftcut. Fast blades, foul mouth, an' a worthy foe. Dinnae tell her I said so." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth's nae the richest mine in the valley, but it's close tae Dun Baldar, an' that counts for a lot." } },
    knows = { { id = "tp_knows", text = "Coldtooth's tunnels, its ore, an' every orc who's tried tae take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Brogus Thunderbrew: Thunderbrew brewer who keeps Dun Baldar fed and watered.
P:NPC {
  key = "bg_brogus_thunderbrew", id = 4255, name = "Brogus Thunderbrew", title = "Food & Drink", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "jovial", "warm" }, values = { "generous", "loyal" },

  impression = {
    first = "He smells of hops and fresh bread, and laughs like a barrel rolling downhill.",
    third = "{name} bought food and drink from Brogus Thunderbrew in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for another, eh? I knew ye had good taste, an' there's a fresh barrel o' Thunderbrew just tapped." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll pour ye a pint, since it's my trade, but drink it by the door an' no' at my counter." },
    { id = "g_default", text = "Come in out o' the snow, lad! A Thunderbrew pint'll warm ye better than any fire." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another, eh? I knew ye had good taste." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf at my counter? Well, I'll no' serve ye, but I'll no' throw the first mug either." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf wi' a thirst! Pull up a stool, the first mug's on the house." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! I'll fetch the wee mug. Dinnae take offence, it's the same ale." },
  },

  start = "hello",
  nodes = {
    y_family = {
      lines = {
        { id = "y_y_family", text = "Thunderbrews have brewed in Kharanos since before Ironforge had a king worth toastin'. My cousins keep the big brewery, an' I drew the short straw an' came up here. Or the long straw, dependin' on how ye see it." },
      },
      choices = {
        { text = "A pint should be poured full, even in a war.", next = "BACK", reply = "Aye, an' a Thunderbrew pint always is. My da would rise from his grave otherwise.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Thin the ale; soldiers up here will drink anything.", next = "BACK", reply = "Thin a Thunderbrew? Ye'd have half the Guard after ye, an' the other half after me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Are you kin to Lana?", next = "y_lana" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lana = {
      lines = {
        { id = "y_y_lana", text = "Lana's my niece, an' she sells hammers an' coal instead o' ale, the poor lass. I tell her there's more honour in a good pint than a good sword, an' she tells me tae mind my own barrels." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "I'll tell ye a secret, if ye promise tae keep it. The ale up here's watered, just a wee bit. If I served it full strength, half the Guard would be singin' instead o' fightin'." },
        { id = "y_y_secret_v0", when = { faction = "Alliance" }, text = "A secret, between Alliance friends: I water the ale a touch. Full strength an' half the Guard would be singin' instead o' standin' watch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wolves = {
      lines = {
        { id = "y_y_wolves", text = "I've heard tell the Frostwolves brew somethin' o' their own, from wolf milk an' fermented roots. I've never tasted it, an' I hope tae die without tastin' it, but I'm curious, I'll admit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_drink = {
      lines = {
        { id = "y_y_drink", text = "Some say a soldier ought tae drink before battle, for the courage. Others say it's what gets them killed. I sell the ale, so I'll nae pretend I'm neutral. What's yer view?" },
      },
      choices = {
        { text = "A sober soldier lives longer. Ration it.", next = "BACK", reply = "Spoken like Vanndar himself. Fine, fine, I'll ration it.", fx = { align = { order = 1 } } },
        { text = "Let them drink. A man should face death merry.", next = "BACK", reply = "Ha! That's the spirit, an' the spirits! Another round for this one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brogus Thunderbrew, o' the Thunderbrew family that brews the finest ale in Khaz Modan. Up here I keep the Guard fed an' merry, which is a war all its own." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What's the best thing you've got?", next = "b1" },
        { text = "How do you keep supplies coming?", next = "b2" },
        { text = "Tell me about the Thunderbrew family.", next = "y_family" },
        { text = "Is there a secret to your ale?", next = "y_secret" },
        { text = "Do the Frostwolves brew?", next = "y_wolves" },
        { text = "Should soldiers drink before battle?", next = "y_drink" },
        { text = "I've drunk Thunderbrew in Kharanos.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye know the real thing! Mine travels well, but it's never as good as at the source." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "The Thunderbrew lager, o' course, brewed in Kharanos an' carried up the mountain on a ram's back. Pair it wi' a hunk o' bread an' ye'll fight like three dwarves." } },
      choices = {
        { text = "Does ale help in battle?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It helps before an' after, lad, which is where most o' a soldier's troubles are. In the middle, ye'd best be sober." } },
      choices = {
        { text = "A good soldier drinks deep.", next = "BACK", reply = "Ha! Ye'll do just fine here.", fx = { align = { order = -1 } } },
        { text = "A good soldier stays sharp. One pint.", next = "BACK", reply = "Wise, an' rare in Dun Baldar. One pint it is.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wagons from Ironforge when the passes are open, an' what the hunters bring in when they're no'. Lana an' I make it stretch." } },
      choices = {
        { text = "Lana is your kin?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Aye, she's a Thunderbrew too, though she sells metal instead o' malt. She got the brains an' I got the barrels." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    thunderbrew = { { id = "tp_ythunderbrew", text = "Finest brewery in Khaz Modan, an' I'll fight any dwarf who says otherwise. After a pint." } },
    kharanos = { { id = "tp_ykharanos", text = "Kharanos is home. Warm hearths, good ale, an' nae a single orc." } },
    knows = { { id = "tp_knows", text = "Ale, bread, an' the gossip that comes wi' both." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Commander Mortimer: Stormpike commander who patrols Dun Baldar.
P:NPC {
  key = "bg_mortimer", id = 13318, name = "Commander Mortimer", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "stern", "weary" }, values = { "dutiful", "brave" },

  impression = {
    first = "His armor is battered, and he walks the walls as if he has not slept in days.",
    third = "{name} spoke with Commander Mortimer on the walls of Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back on the walls, an' glad I am o' it. Stand here by me, friend, for I trust yer eyes." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Report if ye must, but keep it short an' keep off my walls, for I've no use for ye." },
    { id = "g_default", text = "Report, soldier, an' keep it short. The walls need watchin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the walls? Good, I could use another pair o' eyes." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde, on Dun Baldar's walls. That's a mistake ye'll no' make twice." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf o' the Guard. Good. Stand on the wall wi' me, an' keep yer eyes on the snow." },
    { id = "yg_1", when = { race = "Human" }, text = "A human soldier. Good. Ye'll find the wall's cold, but the company's warm enough." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was a guard in Ironforge for twenty years before the Stormpike called. I've walked the walls o' the Great Forge an' the walls o' Dun Baldar, an' I'll tell ye, Dun Baldar's colder." },
      },
      choices = {
        { text = "A soldier keeps their post, even when nobody's watching.", next = "BACK", reply = "Aye, an' that's the kind o' soldier I want beside me on these walls at midnight.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sleep at your post if nobody's watching; who'll know?", next = "BACK", reply = "The Frostwolves'll know, an' they'll come over the wall while ye snore.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss Ironforge?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_y_miss", text = "I miss the warmth. I miss the sound o' hammers. I dinnae miss the crowds. Up here, I can stand on the wall an' hear nothin' but wind for an hour, an' some days that's the best thing in the world." },
        { id = "y_y_miss_v0", when = { race = "Dwarf" }, text = "Ye know the Great Forge, kinsman. The warmth, the hammers, the endless crowds. I miss the first two. I dinnae miss the third." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tired = {
      lines = {
        { id = "y_y_tired", text = "Tired's nae the word. I've nae slept a full night since the war began. Every time I close my eyes, I see wolves comin' over the wall. The healers say it'll pass. It hasnae yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wall = {
      lines = {
        { id = "y_y_wall", text = "The walls o' Dun Baldar are older than the Guard. They were here when the Stormpike came, built by dwarves who lived here before. I've often wondered what happened tae them, an' whether we'll end up the same." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some o' the young soldiers want tae make a sortie, an' strike the wolves before they strike us. I say we hold the walls. What do ye think?" },
      },
      choices = {
        { text = "Hold the walls. Discipline wins wars.", next = "BACK", reply = "Aye. That's what I keep tellin' them.", fx = { align = { order = 1 } } },
        { text = "Strike first. Waiting only gives them time.", next = "BACK", reply = "Ye sound like the commandos. Maybe ye're right. I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Commander Mortimer. I keep the guard on Dun Baldar's walls, an' while I stand, the Guard's soldiers keep comin' back after every fall." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What happens if you fall?", next = "b1" },
        { text = "You look tired, Commander.", next = "b2" },
        { text = "How long have you been a commander?", next = "y_who" },
        { text = "You look tired.", next = "y_tired" },
        { text = "Who built these walls?", next = "y_wall" },
        { text = "Should we make a sortie?", next = "y_stance" },
        { text = "I'll watch the walls.", next = "BACK", when = { class = "HUNTER" }, reply = "A hunter! Then watch the treeline. The wolves hide there before they charge." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Then the Guard loses some o' its defenders, an' the Frostwolves get a little closer tae the General. So I'd thank ye no' tae let me fall." } },
      choices = {
        { text = "How can I help?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Stand on the bridge when they come, an' kill the ones who try tae slip past. Ye'll find no shortage o' work." } },
      choices = {
        { text = "Let's march out and end it.", next = "BACK", reply = "Bold. But someone has tae hold the walls while ye do.", fx = { align = { order = -1 } } },
        { text = "The walls first. Then the push.", next = "BACK", reply = "Aye, a sensible soldier. There's hope for ye.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Tired's a word for it. This valley never sleeps, an' so neither do I." } },
      choices = {
        { text = "When did you last rest?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Somewhere around the last time the Frostwolves took a day off, which is tae say never." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dun_baldar = { { id = "tp_ydun_baldar", text = "Dun Baldar's walls are old an' thick, an' I mean tae keep them that way." } },
    ironforge = { { id = "tp_yironforge", text = "Ironforge is warm an' loud. I miss the first." } },
    knows = { { id = "tp_knows", text = "Dun Baldar's walls, its guards, an' its weak spots, which I'll no' tell ye." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Druid of the Grove: night elf druid who serves Arch Druid Renferal against the corruption of Alterac's groves.
P:NPC {
  key = "bg_druid_grove", id = 13443, name = "Druid of the Grove", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "calm", "solemn" }, values = { "wise", "loyal" },

  impression = {
    first = "He speaks softly and watches the snow as if it were telling him something.",
    third = "{name} spoke with a Druid of the Grove in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, friend. The grove remembers your footsteps kindly, and the weary trees stand a little straighter." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return, and the grove grows quiet. Speak your business, and walk softly while you do." },
    { id = "g_default", text = "Ishnu-alah. The trees here are weary, traveler, and so are we." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The grove remembers your footsteps." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "The Horde comes to the grove. Nature will not shelter you here." },
    { id = "yg_0", when = { race = "NightElf" }, text = "Ishnu-alah, kin. It is good to feel another heart that remembers the old forests." },
    { id = "yg_1", when = { class = "DRUID" }, text = "A druid! Then you can hear the trees here weeping, as I can." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I came from Ashenvale with Arch Druid Renferal, because the Stormpike asked for druids to stand against the Frostwolf shamans. The dwarves are strange allies, loud and smoky, but they have treated the grove with respect." },
      },
      choices = {
        { text = "Nature should be defended, never turned into a weapon of war.", next = "BACK", reply = "Then you understand the grove's sorrow better than most who come here with axes.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Burn the Frostwolf woods; war has no room for scruples.", next = "BACK", reply = "Fire does not choose sides, and the forest will remember who lit it long after the war is done.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What does Renferal hope to do?", next = "y_ren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ren = {
      lines = {
        { id = "y_y_ren", text = "To keep the land's spirits from being bound to one side or the other. The Frostwolves call on the elements, and the Stormpike druids have spoken of summoning Ivus, the Forest Lord. Renferal fears what such calling might cost the valley." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_far = {
      lines = {
        { id = "y_y_far", text = "Very far. I miss the warmth of Ashenvale, and the light through the leaves. Here the trees are hard and silent, and they do not answer when I speak to them. I think they are afraid." },
        { id = "y_y_far_v0", when = { race = "NightElf" }, text = "Very far, kin. You know the light through the leaves of Ashenvale. Here the trees are hard and silent, and they do not answer me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_frost = {
      lines = {
        { id = "y_y_frost", text = "The Frostwolf shamans are not cruel to the land, not as the Warsong in Ashenvale are. They ask the spirits for help, they do not tear it out. That troubles me, for it would be easier to hate them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ivus = {
      lines = {
        { id = "y_y_ivus", text = "The dwarves wish to summon Ivus to fight for them. Ivus is an ancient spirit of the wild, not a weapon. Should we call on such a being for a war of mines and borders?" },
      },
      choices = {
        { text = "No. The wild should never be bent to war.", next = "BACK", reply = "You speak as Renferal does. Perhaps the dwarves will listen to you.", fx = { align = { light = 1 } } },
        { text = "If it saves Alliance lives, call him.", next = "BACK", reply = "I understand. I do not agree, but I understand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am a druid of the grove, sent with Arch Druid Renferal to watch over the wild places of this valley. War tramples the land, and someone must speak for it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do druids fight here?", next = "b1" },
        { text = "What is Renferal like?", next = "b2" },
        { text = "Why did you come to Alterac?", next = "y_who" },
        { text = "You're far from home.", next = "y_far" },
        { text = "What do you think of the Frostwolf shamans?", next = "y_frost" },
        { text = "Should the Stormpike summon Ivus?", next = "y_ivus" },
        { text = "I hear the trees too.", next = "BACK", when = { class = "DRUID" }, reply = "Then you know why I came. Renferal says the valley's spirits are restless, and I believe him." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the Frostwolves call on the elements, and the land cries out when they twist it. We heal what we can, and fight what we must." } },
      choices = {
        { text = "What do you heal?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Soldiers, mostly, and the roots that the battle tears up. The snow hides much, but the earth remembers." } },
      choices = {
        { text = "Burn the Frostwolf shrines.", next = "BACK", reply = "That would wound the land as much as them. Think again.", fx = { align = { light = -1 } } },
        { text = "Protect the land, even in war.", next = "BACK", reply = "Yes. Elune would smile on that.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wise and patient, as an arch druid must be. She asks the Guard for storm crystals, so she may call Ivus the Forest Lord to our side." } },
      choices = {
        { text = "Will it help the war?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It will help the Guard, and it will keep the valley from bleeding dry. That is enough." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    renferal = { { id = "tp_yrenferal", text = "Arch Druid Renferal is old and patient, and he does not speak unless he has something worth saying." } },
    ashenvale = { { id = "tp_yashenvale", text = "Ashenvale is my home. The Warsong cut it, and the Sentinels bleed for it." } },
    knows = { { id = "tp_knows", text = "The groves, the wild things, and the slow pain of a land at war." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Dun Baldar North Marshal: one of the four Stormpike marshals who guard General Vanndar, posted in the north bunker.
P:NPC {
  key = "bg_db_north_marshal", id = 14762, name = "Dun Baldar North Marshal", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "stern", "dutiful" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A heavily armored marshal who never strays far from the General's side.",
    third = "{name} spoke with the Dun Baldar North Marshal.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, ye're back. The north bunker holds, an' I rest easier knowin' ye're on this side o' the wall." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The north bunker holds wi'out ye, so say yer piece an' step away from the General." },
    { id = "g_default", text = "Soldier. The north bunker holds, an' so do I." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. Every sword helps." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. Ye'll get no closer tae the General than this." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face! Stand easy, kinsman, the north bunker's glad o' ye." },
    { id = "yg_1", when = { race = "Human" }, text = "A man o' Lordaeron? Ye'll find Alterac colder than the lowlands, but ye'll find it worth the fight." },
  },

  start = "hello",
  nodes = {
    y_bunker = {
      lines = {
        { id = "y_y_bunker", text = "Thick stone, narrow doors, an' a fire that never goes out. The north bunker covers the approach tae Vanndar's hall, an' as long as it stands, the wolves must come through four marshals tae reach him." },
      },
      choices = {
        { text = "A marshal's oath to the General should never bend.", next = "BACK", reply = "It doesnae, an' it hasnae bent since the day I swore it tae Vanndar.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Oaths are fine until the Horde is at the door.", next = "BACK", reply = "That's exactly when they matter most, friend, an' ye'd best learn it before then.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Has the bunker ever been breached?", next = "y_breach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_breach = {
      lines = {
        { id = "y_y_breach", text = "Once, in a bad winter, the wolves got intae the outer room. We drove them out wi' axes an' a barrel o' Thunderbrew set alight. I'll nae tell ye whose idea the barrel was, but it was mine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_vanndar = {
      lines = {
        { id = "y_y_vanndar", text = "Vanndar Stormpike is a hard dwarf an' a fair one. He brought the Guard up from Ironforge tae claim the land o' our fathers, an' he's never once asked a soldier tae stand where he wouldnae stand himself." },
        { id = "y_y_vanndar_v0", when = { faction = "Alliance" }, text = "Vanndar's a hard dwarf an' a fair one, an' he's never asked any o' us tae stand where he wouldnae. Ye'd do well tae serve under him, soldier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_others = {
      lines = {
        { id = "y_y_others", text = "The south marshal an' I trade insults over the wall every mornin', an' we'd die for each other by noon. The four o' us were picked by Vanndar himself, an' nae one o' us would let the others down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_right = {
      lines = {
        { id = "y_y_right", text = "The Frostwolves say Alterac's theirs since the exile. The Stormpike say it's ours by older right. I've heard both, an' I hold the bunker anyway. Where do ye stand on it?" },
      },
      choices = {
        { text = "The Stormpike claim is older. The valley is ours by right.", next = "BACK", reply = "Aye! Ye understand it. Our forefathers walked these hills first.", fx = { align = { order = 1 } } },
        { text = "Both claims are just. We should talk before we fight.", next = "BACK", reply = "Talk tae the wolves? Ye've a soft heart. Mind it doesnae get ye killed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm the Dun Baldar North Marshal, one o' the four sworn tae stand wi' General Vanndar. While the north bunker holds, the General's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the marshals matter?", next = "b1" },
        { text = "Do you fight with the General often?", next = "b2" },
        { text = "Tell me about the north bunker.", next = "y_bunker" },
        { text = "What's General Vanndar like?", next = "y_vanndar" },
        { text = "Do you trust the other marshals?", next = "y_others" },
        { text = "Is it right to bring war to this valley?", next = "y_right" },
        { text = "I'm Stormpike born.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye know what it means tae stand between Vanndar an' the wolves. Hold fast beside me." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the Frostwolves come for the General, the marshals stand beside him. Kill us first, an' Vanndar fights alone. They know it, an' so do we." } },
      choices = {
        { text = "What if a bunker falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then the marshal o' that bunker fights all the harder. We dinnae need walls tae be marshals." } },
      choices = {
        { text = "Kill every orc who reaches the hall.", next = "BACK", reply = "Aye, none will leave it.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and spare the fallen.", next = "BACK", reply = "A fair heart. Vanndar would agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "More often than I'd like, for it means they've got that far. Vanndar fights like a mountain, mind ye." } },
      choices = {
        { text = "Is he a good leader?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The best. He's lost more than most, an' still he leads from the front." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar Stormpike. The finest commander I've served, an' the loudest." } },
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves fight hard for their village. I'll respect that, an' I'll still hold this door against them." } },
    knows = { { id = "tp_knows", text = "The bunkers, the General, an' the oath that binds us tae him." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Dun Baldar South Marshal: one of the four Stormpike marshals who guard General Vanndar, posted in the south bunker.
P:NPC {
  key = "bg_db_south_marshal", id = 14763, name = "Dun Baldar South Marshal", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "stern", "dutiful" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A heavily armored marshal who never strays far from the General's side.",
    third = "{name} spoke with the Dun Baldar South Marshal.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! The south bunker's standin' firm, an' it's soldiers like you who keep it so." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The south bunker doesnae need yer help, an' the General doesnae need yer company." },
    { id = "g_default", text = "Soldier. The south bunker holds, an' so do I." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. Every sword helps." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. Ye'll get no closer tae the General than this." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face! Stand easy, kinsman, the south bunker's glad o' ye." },
    { id = "yg_1", when = { race = "Human" }, text = "A man o' Lordaeron? Ye'll find Alterac colder than the lowlands, but ye'll find it worth the fight." },
  },

  start = "hello",
  nodes = {
    y_bunker = {
      lines = {
        { id = "y_y_bunker", text = "Thick stone, narrow doors, an' a fire that never goes out. The south bunker covers the approach tae Vanndar's hall, an' as long as it stands, the wolves must come through four marshals tae reach him." },
      },
      choices = {
        { text = "Dun Baldar holds while the Guard keeps faith with each other.", next = "BACK", reply = "Aye, faith an' stone, an' we've plenty o' both at Dun Baldar.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the north bunker fall if it saves the south.", next = "BACK", reply = "An' who d'ye think stands in the north bunker? Our own kin, friend. Mind yer tongue.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Has the bunker ever been breached?", next = "y_breach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_breach = {
      lines = {
        { id = "y_y_breach", text = "Once, in a bad winter, the wolves got intae the outer room. We drove them out wi' axes an' a barrel o' Thunderbrew set alight. I'll nae tell ye whose idea the barrel was, but it was mine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_vanndar = {
      lines = {
        { id = "y_y_vanndar", text = "Vanndar Stormpike is a hard dwarf an' a fair one. He brought the Guard up from Ironforge tae claim the land o' our fathers, an' he's never once asked a soldier tae stand where he wouldnae stand himself." },
        { id = "y_y_vanndar_v0", when = { faction = "Alliance" }, text = "Vanndar's a hard dwarf an' a fair one, an' he's never asked any o' us tae stand where he wouldnae. Ye'd do well tae serve under him, soldier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_others = {
      lines = {
        { id = "y_y_others", text = "The north marshal an' I trade insults over the wall every mornin', an' we'd die for each other by noon. The four o' us were picked by Vanndar himself, an' nae one o' us would let the others down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_right = {
      lines = {
        { id = "y_y_right", text = "The Frostwolves say Alterac's theirs since the exile. The Stormpike say it's ours by older right. I've heard both, an' I hold the bunker anyway. Where do ye stand on it?" },
      },
      choices = {
        { text = "The Stormpike claim is older. The valley is ours by right.", next = "BACK", reply = "Aye! Ye understand it. Our forefathers walked these hills first.", fx = { align = { order = 1 } } },
        { text = "Both claims are just. We should talk before we fight.", next = "BACK", reply = "Talk tae the wolves? Ye've a soft heart. Mind it doesnae get ye killed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm the Dun Baldar South Marshal, one o' the four sworn tae stand wi' General Vanndar. While the south bunker holds, the General's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the marshals matter?", next = "b1" },
        { text = "Do you fight with the General often?", next = "b2" },
        { text = "Tell me about the south bunker.", next = "y_bunker" },
        { text = "What's General Vanndar like?", next = "y_vanndar" },
        { text = "Do you trust the other marshals?", next = "y_others" },
        { text = "Is it right to bring war to this valley?", next = "y_right" },
        { text = "I'm Stormpike born.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye know what it means tae stand between Vanndar an' the wolves. Hold fast beside me." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the Frostwolves come for the General, the marshals stand beside him. Kill us first, an' Vanndar fights alone. They know it, an' so do we." } },
      choices = {
        { text = "What if a bunker falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then the marshal o' that bunker fights all the harder. We dinnae need walls tae be marshals." } },
      choices = {
        { text = "Kill every orc who reaches the hall.", next = "BACK", reply = "Aye, none will leave it.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and spare the fallen.", next = "BACK", reply = "A fair heart. Vanndar would agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "More often than I'd like, for it means they've got that far. Vanndar fights like a mountain, mind ye." } },
      choices = {
        { text = "Is he a good leader?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The best. He's lost more than most, an' still he leads from the front." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar Stormpike. The finest commander I've served, an' the loudest." } },
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves fight hard for their village. I'll respect that, an' I'll still hold this door against them." } },
    knows = { { id = "tp_knows", text = "The bunkers, the General, an' the oath that binds us tae him." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Gaelden Hammersmith: Wildhammer supply officer in Dun Baldar's south bunker.
P:NPC {
  key = "bg_gaelden", id = 13216, name = "Gaelden Hammersmith", title = "Stormpike Supply Officer", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "cheerful", "rough" }, values = { "loyal", "free" },

  impression = {
    first = "His tattoos mark him as Wildhammer, and he laughs at the Bronzebeards' cold as if it were a joke he alone gets.",
    third = "{name} bought supplies from Gaelden Hammersmith in the south bunker.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ho there, friend! The gryphons send their regards, an' so do I, an' the good supplies are on the left." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Ye'll get yer supplies, but no Wildhammer smile today, an' ye know fine why." },
    { id = "g_default", text = "Ho there! Supplies for the Guard, an' a Wildhammer smile for free." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! The gryphons send their regards." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde, in the bunker? My hammer'll send ye home quick." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Bronzebeard or a Wildhammer? Dinnae tell me, I'll guess by how ye drink." },
    { id = "yg_1", when = { class = "HUNTER" }, text = "A hunter! I've a gryphon or two that'd love tae meet yer beast." },
  },

  start = "hello",
  nodes = {
    y_aerie = {
      lines = {
        { id = "y_y_aerie", text = "I'm from Aerie Peak in the Hinterlands, where the gryphons nest. The Stormpike needed someone who knew how tae keep gryphon riders fed, an' Wing Commander Vipore put my name forward. I've nae forgiven him." },
      },
      choices = {
        { text = "Supplies should go first to those who bled for them.", next = "BACK", reply = "Aye, an' that's how I hand them out, Bronzebeard or Wildhammer or otherwise.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Slip a crate aside; the Bronzebeards will never miss it.", next = "BACK", reply = "Ha! They'd miss it, an' they'd blame a Wildhammer, which means me. No' a chance.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss Aerie Peak?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_y_miss", text = "Every morning. Aerie Peak smells o' pine an' gryphon feathers, an' the sky's so wide ye could fall intae it. Dun Baldar smells o' damp wool an' Thunderbrew, which is nae bad, but it isnae home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_crates = {
      lines = {
        { id = "y_y_crates", text = "Arrows, bandages, bread an' a few things I'd rather nae name. Every crate comes over the passes from Ironforge, an' every crate I count is a soldier who doesnae go without. It's dull, an' it's important." },
        { id = "y_y_crates_v0", when = { faction = "Alliance" }, text = "Arrows, bandages, an' bread, mostly. Every crate I count is an Alliance soldier who doesnae go without. Dull, aye, but it matters." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_rift = {
      lines = {
        { id = "y_y_rift", text = "The Wildhammer an' the Bronzebeards fell out long ago, after the War o' the Three Hammers. Most Wildhammer would sooner eat their beards than serve Ironforge. I came anyway, an' some o' my kin call me a traitor for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_feud = {
      lines = {
        { id = "y_y_feud", text = "Some say the old feud between the clans should be buried for good. Others say a dwarf shouldnae forget what was done tae his grandsires. What do ye say, friend?" },
      },
      choices = {
        { text = "Bury the feud. The Horde is the real foe.", next = "BACK", reply = "Aye, that's what I tell my kin. They dinnae listen, but I tell them.", fx = { align = { honor = 1 } } },
        { text = "Old wrongs deserve remembering. Don't forget.", next = "BACK", reply = "Hmph. Maybe. But rememberin' too long's how the Dark Irons got the way they are.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gaelden Hammersmith, Stormpike supply officer, an' the only Wildhammer fool enough tae count crates for the Bronzebeards. I've what ye need tae stay alive out there." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "A Wildhammer working with Ironforge?", next = "b1" },
        { text = "What supplies do you keep?", next = "b2" },
        { text = "Where are you from, Gaelden?", next = "y_aerie" },
        { text = "What's in all these crates?", next = "y_crates" },
        { text = "Why don't Wildhammer serve Ironforge?", next = "y_rift" },
        { text = "Should the clans forget their old feud?", next = "y_feud" },
        { text = "I'm a dwarf of Ironforge.", next = "BACK", when = { race = "Dwarf" }, reply = "Ach, a Bronzebeard. Well, I'll forgive ye, seein' as ye came all this way." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Aye, strange as that sounds tae ye. The clans have their quarrels, but a Frostwolf axe doesnae care whose beard it cuts." } },
      choices = {
        { text = "Do the Stormpike treat you well?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Well enough, though they still call me a savage when they're drunk. I call them stiff-necked, an' we all go back tae fightin'." } },
      choices = {
        { text = "Clan feuds don't matter. Dwarves stand together.", next = "BACK", reply = "Aye, that's the truth o' it.", fx = { align = { order = -1 } } },
        { text = "Your clan should keep its own ways.", next = "BACK", reply = "Ha! Spoken like a Wildhammer at heart.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Bandages, food, arrows, an' whatever else the soldiers forget tae bring. They always forget somethin'." } },
      choices = {
        { text = "What do they forget most?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Their wits, mostly. I cannae sell those, more's the pity." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    aerie_peak = { { id = "tp_yaerie_peak", text = "Aerie Peak, home o' the Wildhammer an' the finest gryphons in the world." } },
    wildhammer = { { id = "tp_ywildhammer", text = "Wildhammer dwarves live in the open sky, nae under a mountain. Ye can tell us by our tattoos." } },
    knows = { { id = "tp_knows", text = "Supplies, gryphons, an' the old quarrels o' the dwarven clans." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Jonivera Farmountain: Stormpike general goods vendor in Dun Baldar.
P:NPC {
  key = "bg_jonivera", id = 5134, name = "Jonivera Farmountain", title = "General Goods", gender = "female",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "practical", "friendly" }, values = { "thrifty", "loyal" },

  impression = {
    first = "She keeps the Guard in rope, thread, and all the small things a soldier forgets.",
    third = "{name} traded with Jonivera Farmountain in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! I've rope an' thread an' all the wee things ye forgot last time, I'll wager." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll sell ye yer rope an' thread, but I'll no' pretend I'm glad tae see ye at my stall." },
    { id = "g_default", text = "Welcome tae my stall, friend. What can I get ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've restocked since ye left." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf at my stall? I'll no' sell tae the Horde, so move along." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face, or an Ironforge one? Either way ye're welcome at my stall." },
    { id = "yg_1", when = { race = "Human" }, text = "A human o' the Alliance! I've a stock o' packs that'd suit ye." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "My family keeps a trading post in Ironforge, an' I'm the youngest daughter. Svalbrad's my cousin, an' when the Guard needed traders, we both came. He brought the trade goods; I brought everythin' else." },
      },
      choices = {
        { text = "A soldier's supplies should be sold fairly, war or no war.", next = "BACK", reply = "That's the Farmountain way, friend, an' my brother Svalbrad'll tell ye the same.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Soldiers can't shop elsewhere, so charge them what you like.", next = "BACK", reply = "An' have the Guard think the Farmountains are thieves? I'd sooner close the stall.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you ever go home?", next = "y_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = {
        { id = "y_y_home", text = "Once a year, if the passes allow. I take a ram down tae Ironforge, buy what I can, an' come back up wi' my packs full an' my purse empty. It's nae much of a holiday, but it's a change o' snow." },
        { id = "y_y_home_v0", when = { race = "Dwarf" }, text = "Once a year, if the passes allow. Ye know how it is, kinsman. The Great Forge is warm, an' I'm always sorry tae leave it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Thread. Soldiers tear their packs every raid, an' the caravans from Ironforge are slow. If the passes close for winter, I'll be sellin' string an' prayers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Svalbrad sweet-talks every soldier who walks past his stall, an' then they come tae me for the actual goods. I let him think he's the charmin' one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some soldiers cannae pay, after a long raid. Should I give them credit, or turn them away?" },
      },
      choices = {
        { text = "Give them credit. They fight for us all.", next = "BACK", reply = "Aye, that's what my mother would say. I'll keep a tally.", fx = { align = { honor = 1 } } },
        { text = "Turn them away. A trader must eat too.", next = "BACK", reply = "Hard, but true. The Guard pays its own soldiers, after all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jonivera Farmountain, an' I sell general goods tae the Guard. It's no' glorious work, but an army marches on what's in its packs." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Who buys from you most?", next = "b1" },
        { text = "Are you kin to Svalbrad?", next = "b2" },
        { text = "How did you end up in Dun Baldar?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Got any gossip?", next = "y_secret" },
        { text = "Should you give soldiers credit?", next = "y_stance" },
        { text = "I'll take some thread.", next = "BACK", when = { profession = "Tailoring" }, reply = "A tailor! Then ye'll know my thread's the finest this side o' the Wetlands." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Soldiers on their way out, an' the same ones comin' back wi' torn packs. I sell a lot o' thread." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, which in a war is the best ye can hope for. The day it stops is the day the Guard's lost." } },
      choices = {
        { text = "Charge the Horde double if they come.", next = "BACK", reply = "Ha! If they come tae buy, I'll charge them triple.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every soldier.", next = "BACK", reply = "Aye, that's how my mother ran her stall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Aye, we're both Farmountains, an' he sells trade goods across the way. We argue about prices every night." } },
      choices = {
        { text = "Do you ever fight?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Only when they reach the stalls, an' then I fight like a cornered badger. It hasnae come tae that often." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    svalbrad = { { id = "tp_ysvalbrad", text = "Svalbrad's my cousin, an' a terrible flirt. Dinnae tell him I said so." } },
    ironforge = { { id = "tp_yironforge", text = "Ironforge is where the caravans start, an' where I'll retire, if this war ever ends." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, an' the soldiers who owe me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Svalbrad Farmountain: Stormpike trade goods vendor in Dun Baldar.
P:NPC {
  key = "bg_svalbrad", id = 5135, name = "Svalbrad Farmountain", title = "Trade Goods", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "practical", "friendly" }, values = { "thrifty", "loyal" },

  impression = {
    first = "He sells cloth, leather, and the odd bit of something useful.",
    third = "{name} traded with Svalbrad Farmountain in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' welcome! I've cloth an' leather fresh up from Ironforge, an' ye can have first look." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Take yer cloth an' leather an' be off, an' don't go tellin' Jonivera I was civil." },
    { id = "g_default", text = "Welcome tae my stall, friend. What can I get ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've restocked since ye left." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf at my stall? I'll no' sell tae the Horde, so move along." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face, or an Ironforge one? Either way ye're welcome at my stall." },
    { id = "yg_1", when = { race = "Human" }, text = "A human o' the Alliance! I've a stock o' trade goods that'd suit ye." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "My cousin Jonivera an' I came up together. Our family's traded in Ironforge for generations, an' when the Guard called for merchants, we drew lots. I lost, so here I am." },
      },
      choices = {
        { text = "Good cloth and leather deserve an honest weight and price.", next = "BACK", reply = "They do, an' I weigh mine on Jonivera's scales, which are honest tae the ounce.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the moth-eaten bolts to the green recruits.", next = "BACK", reply = "An' then they freeze in the pass wi' holes in their cloaks. No' on my conscience.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you ever go home?", next = "y_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = {
        { id = "y_y_home", text = "Once a year, if the passes allow. I take a ram down tae Ironforge, buy what I can, an' come back up wi' my packs full an' my purse empty. It's nae much of a holiday, but it's a change o' snow." },
        { id = "y_y_home_v0", when = { race = "Dwarf" }, text = "Once a year, if the passes allow. Ye know how it is, kinsman. The Great Forge is warm, an' I'm always sorry tae leave it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Dye. The good dyes come from Stormwind, an' the caravans take weeks. My cloth's come out grey all winter, an' the soldiers say they look like ghosts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Jonivera thinks I'm the charmin' one an' she's the practical one. The truth is, she's both, an' I'm only loud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "A Frostwolf trader once offered tae swap leather for cloth, under a white flag. Should I have taken the deal?" },
      },
      choices = {
        { text = "Never deal with the enemy.", next = "BACK", reply = "Aye, that's what I did. Sent him off. Still wonder about that leather, though.", fx = { align = { order = 1 } } },
        { text = "Trade could build trust. Take it.", next = "BACK", reply = "Maybe. If he comes back, I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Svalbrad Farmountain, an' I sell trade goods tae the Guard. It's no' glorious work, but an army marches on what's in its packs." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do crafters need here?", next = "b1" },
        { text = "Are you kin to Jonivera?", next = "b2" },
        { text = "How did you end up in Dun Baldar?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Got any gossip?", next = "y_secret" },
        { text = "Would you trade with a Frostwolf?", next = "y_stance" },
        { text = "I'll take some cloth.", next = "BACK", when = { profession = "Tailoring" }, reply = "A tailor! Then ye'll forgive the grey. It's all that came up the pass." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Thread, dyes, an' a bit o' flux for the smiths. Nothin' gets made in this valley without somethin' from my shelf." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, which in a war is the best ye can hope for. The day it stops is the day the Guard's lost." } },
      choices = {
        { text = "Charge the Horde double if they come.", next = "BACK", reply = "Ha! If they come tae buy, I'll charge them triple.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every soldier.", next = "BACK", reply = "Aye, that's how my mother ran her stall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Aye, she's Farmountain kin, an' she thinks she's the clever one. She's wrong, but dinnae tell her I said so." } },
      choices = {
        { text = "Do you ever fight?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Only when they reach the stalls, an' then I fight like a cornered badger. It hasnae come tae that often." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    jonivera = { { id = "tp_yjonivera", text = "Jonivera's my cousin, an' she does the real work at our stalls." } },
    stormwind = { { id = "tp_ystormwind", text = "Stormwind's where the good dyes come from, an' it's a long, cold road." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, an' the soldiers who owe me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Kurdrum Barleybeard: Stormpike reagents vendor in Dun Baldar.
P:NPC {
  key = "bg_kurdrum", id = 5139, name = "Kurdrum Barleybeard", title = "Reagents & Poison Supplies", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "practical", "friendly" }, values = { "thrifty", "loyal" },

  impression = {
    first = "He keeps reagents for the mages and poisons for the less polite.",
    third = "{name} traded with Kurdrum Barleybeard in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! Reagents for the mages an' somethin' less polite for you, if ye're that sort, eh?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Reagents or poison, take what ye came for an' go, an' keep yer hands off the wee black jars." },
    { id = "g_default", text = "Welcome tae my stall, friend. What can I get ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've restocked since ye left." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf at my stall? I'll no' sell tae the Horde, so move along." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face, or an Ironforge one? Either way ye're welcome at my stall." },
    { id = "yg_1", when = { race = "Human" }, text = "A human o' the Alliance! I've a stock o' reagents that'd suit ye." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was an alchemist's apprentice in Ironforge, but I blew up the master's table twice an' he sent me off tae the Guard. Said I'd do less harm sellin' reagents than mixin' them. He wasnae wrong." },
      },
      choices = {
        { text = "Poison should be used on the enemy, and only the enemy.", next = "BACK", reply = "Aye, that's the only rule I sell it under, an' I watch who I sell it tae.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A drop of poison in a rival's ale solves a lot.", next = "BACK", reply = "An' it'd be my poison they traced it back tae. Get away from my stall.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you ever go home?", next = "y_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = {
        { id = "y_y_home", text = "Once a year, if the passes allow. I take a ram down tae Ironforge, buy what I can, an' come back up wi' my packs full an' my purse empty. It's nae much of a holiday, but it's a change o' snow." },
        { id = "y_y_home_v0", when = { race = "Dwarf" }, text = "Once a year, if the passes allow. Ye know how it is, kinsman. The Great Forge is warm, an' I'm always sorry tae leave it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "The cold spoils half my reagents before they're sold. Herbs freeze, powders clump, an' I've lost a whole crate o' Swiftthistle tae a single bad night." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Some o' the Guard's officers buy poison from me an' pretend they dinnae. I keep their names in a wee book, an' I'll nae show it tae anyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "The Frostwolves call poison cowardly. Some o' our own officers agree. Should the Guard use it?" },
      },
      choices = {
        { text = "Poison is cowardly. Fight them fairly.", next = "BACK", reply = "Ye sound like the old priests. Well, I'll still sell it, but I'll nae boast of it.", fx = { align = { honor = 1 } } },
        { text = "War isn't fair. Use whatever wins.", next = "BACK", reply = "Aye, that's the truth o' it. The wolves would do the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kurdrum Barleybeard, an' I sell reagents tae the Guard. It's no' glorious work, but an army marches on what's in its packs." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Who buys your poisons?", next = "b1" },
        { text = "Isn't poison dishonorable?", next = "b2" },
        { text = "How did you end up in Dun Baldar?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Got any gossip?", next = "y_secret" },
        { text = "Should the Guard use poison?", next = "y_stance" },
        { text = "I could use some reagents.", next = "BACK", when = { class = "MAGE" }, reply = "A mage! Then ye'll want the powders, an' plenty o' them, by the look o' ye." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Rogues, mostly, though I'll no' name names. The orcs bleed like anyone else, so the Guard doesnae complain." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, which in a war is the best ye can hope for. The day it stops is the day the Guard's lost." } },
      choices = {
        { text = "Charge the Horde double if they come.", next = "BACK", reply = "Ha! If they come tae buy, I'll charge them triple.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every soldier.", next = "BACK", reply = "Aye, that's how my mother ran her stall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Some say so. I say a Frostwolf axe is no' particularly honorable either." } },
      choices = {
        { text = "Do you ever fight?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Only when they reach the stalls, an' then I fight like a cornered badger. It hasnae come tae that often." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    alchemy = { { id = "tp_yalchemy", text = "Alchemy's dangerous work, an' I've the singed eyebrows tae prove it." } },
    reagents = { { id = "tp_yreagents", text = "Reagents for mages, priests an' rogues, an' everythin' in between." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, an' the soldiers who owe me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lana Thunderbrew: Stormpike smithing supplies vendor in Dun Baldar.
P:NPC {
  key = "bg_lana_thunderbrew", id = 4257, name = "Lana Thunderbrew", title = "Blacksmithing Supplies", gender = "female",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "stormpike" }, temper = { "practical", "friendly" }, values = { "thrifty", "loyal" },

  impression = {
    first = "She sells the flux, coal and hammers that keep the Guard's forges burning.",
    third = "{name} traded with Lana Thunderbrew in Dun Baldar.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! The forges are hot an' the coal's dry, an' every sack o' flux I've got is the good stuff." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The coal's the coal an' the price is the price, so buy what ye need an' let me get back tae work." },
    { id = "g_default", text = "Welcome tae my stall, friend. What can I get ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've restocked since ye left." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf at my stall? I'll no' sell tae the Horde, so move along." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A Stormpike face, or an Ironforge one? Either way ye're welcome at my stall." },
    { id = "yg_1", when = { race = "Human" }, text = "A human o' the Alliance! I've a stock o' coal that'd suit ye." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I'm a Thunderbrew, same as Brogus, but I never took tae brewin'. I took tae the forge instead, an' the family's still nae forgiven me. When Murgot came north tae smith for the Guard, I came wi' him tae keep his coal stocked." },
      },
      choices = {
        { text = "Honest coal and honest flux make blades that don't break.", next = "BACK", reply = "Aye, an' a blade that breaks in the valley gets a dwarf killed. I'll sell nothin' less.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Mix slag in with the coal; it all burns the same.", next = "BACK", reply = "It doesnae, an' every smith in the Guard would know it by the first heat.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you ever go home?", next = "y_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = {
        { id = "y_y_home", text = "Once a year, if the passes allow. I take a ram down tae Ironforge, buy what I can, an' come back up wi' my packs full an' my purse empty. It's nae much of a holiday, but it's a change o' snow." },
        { id = "y_y_home_v0", when = { race = "Dwarf" }, text = "Once a year, if the passes allow. Ye know how it is, kinsman. The Great Forge is warm, an' I'm always sorry tae leave it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Coal. Ye cannae smith without it, an' Alterac's coal is poor stuff. I've begged Ironforge for better, but they say the Dark Irons have the best seams, an' nobody's sellin' it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Brogus sneaks me a mug o' his good ale every night, the full-strength stuff he waters down for everyone else. I'll nae say which barrel." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Murgot wants tae melt down old Frostwolf axes for their steel. Some say that's disrespectful tae the dead. What do ye think?" },
      },
      choices = {
        { text = "Melt them. Steel is steel, and we need it.", next = "BACK", reply = "Aye, that's what I said. Murgot'll be pleased.", fx = { align = { light = 1 } } },
        { text = "Leave them. Honour the fallen, even foes.", next = "BACK", reply = "Hm. That's kinder than I'd have thought. I'll mention it tae Murgot.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lana Thunderbrew, an' I sell smithing supplies tae the Guard. It's no' glorious work, but an army marches on what's in its packs." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Do you work the forge yourself?", next = "b1" },
        { text = "Are you kin to Brogus?", next = "b2" },
        { text = "How did you end up in Dun Baldar?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Got any gossip?", next = "y_secret" },
        { text = "Should Murgot melt Frostwolf axes?", next = "y_stance" },
        { text = "I'm a smith too.", next = "BACK", when = { profession = "Blacksmithing" }, reply = "A smith! Then ye'll know the coal here's rubbish. Buy it anyway, it's all we've got." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When I've time, aye. Murgot does the real work, but I keep him in coal an' he keeps me in good company." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, which in a war is the best ye can hope for. The day it stops is the day the Guard's lost." } },
      choices = {
        { text = "Charge the Horde double if they come.", next = "BACK", reply = "Ha! If they come tae buy, I'll charge them triple.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every soldier.", next = "BACK", reply = "Aye, that's how my mother ran her stall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Thunderbrews are a big clan, an' Brogus got the brewin' talent. I got the temper an' a hammer." } },
      choices = {
        { text = "Do you ever fight?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Only when they reach the stalls, an' then I fight like a cornered badger. It hasnae come tae that often." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    murgot = { { id = "tp_ymurgot", text = "Murgot Deepforge is the Guard's smith. Grumpy, skilled, an' always short o' coal." } },
    brogus = { { id = "tp_ybrogus", text = "Brogus is my uncle, an' he still thinks I should be brewin'." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, an' the soldiers who owe me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lieutenant Greywand: gnome lieutenant of the Stormpike Guard near Stonehearth Outpost.
P:NPC {
  key = "bg_greywand", id = 13298, name = "Lieutenant Greywand", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "dutiful", "steady" }, values = { "loyal", "brave" },

  impression = {
    first = "A gnome lieutenant who holds the outpost with crackling spells and nervous jokes.",
    third = "{name} spoke with Lieutenant Greywand near Stonehearth Outpost.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you! Stonehearth's still standing, at roughly ninety percent, and I like those odds better with you here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. The outpost holds, no thanks to you, so please keep your distance from my spell circle." },
    { id = "g_default", text = "Soldier. Stonehearth Outpost holds, and I mean to keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, we could use the help." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. You're a long way from Frostwolf Keep, and you won't get any closer." },
    { id = "yg_0", when = { race = "Gnome" }, text = "A fellow gnome! It's good to see someone at eye level for once." },
    { id = "yg_1", when = { race = "Dwarf" }, text = "A dwarf o' the Guard. Good, Stonehearth Outpost could always use another stout pair o' shoulders." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I'm from Gnomeregan, originally. When the city fell, I joined the Ironforge regulars because I had nowhere else to put my anger. Vanndar took me on for Alterac because I can read a map faster than any dwarf in the Guard." },
      },
      choices = {
        { text = "An officer should keep every promise made to the troops.", next = "BACK", reply = "I try, I really do, though I promised them warm boots and that's gone rather poorly.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Promise the troops anything; most won't live to collect.", next = "BACK", reply = "That's a horrible thing to say, and I'll thank you not to say it near my soldiers.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you regret it?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = {
        { id = "y_y_regret", text = "Some nights, when the wind howls through the bunker and I can't feel my feet. But then I see the dwarves standing beside me, and I remember that soldiers don't choose their wars, only their friends." },
        { id = "y_y_regret_v0", when = { faction = "Alliance" }, text = "Some nights, when the wind howls and I can't feel my feet. But I'm Alliance, and we hold together. That's worth a little cold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_post = {
      lines = {
        { id = "y_y_post", text = "Stonehearth Outpost guards the road between Dun Baldar and the middle of the valley. If it falls, the Frostwolves can bring their dead back on our doorstep, and the whole valley tips their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Supplies, mostly. Every cart of food and every bundle of arrows comes up from Ironforge over the passes, and when the snow comes, the carts stop. We've gone hungry before, and I'd rather not do it again with the wolves at the gate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_terms = {
      lines = {
        { id = "y_y_terms", text = "I've heard the shamans of the Frostwolves speak of peace, once, under a flag of truce. Vanndar wouldn't hear of it. What would you do, soldier, if you had the choice?" },
      },
      choices = {
        { text = "Hold the line. The Horde would never honour terms.", next = "BACK", reply = "That's what Vanndar said, and maybe he's right. Hold it is.", fx = { align = { order = 1 } } },
        { text = "Seek terms. Enough soldiers have died in this snow.", next = "BACK", reply = "I'd like to believe that would work. Keep that thought; we may need it someday.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lieutenant Greywand, Stormpike Guard. I keep watch around Stonehearth Outpost, and while I stand, the Guard's soldiers keep coming back to hold it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Isn't a gnome small for a lieutenant?", next = "b1" },
        { text = "What should I watch for near your post?", next = "b2" },
        { text = "How did you end up in the Stormpike Guard?", next = "y_hist" },
        { text = "Why does Stonehearth Outpost matter?", next = "y_post" },
        { text = "What worries you most?", next = "y_worry" },
        { text = "Should we fight on, or seek terms?", next = "y_terms" },
        { text = "Someone of your kind, in a dwarf army?", next = "BACK", when = { race = "Gnome" }, reply = "A gnome lieutenant surprises folk. It surprised me, too, but the Stormpike value a quick head, and I have one." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Small targets are hard to hit, and I hit back with lightning. The Frostwolves have stopped laughing." } },
      choices = {
        { text = "Do you like serving here?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is cold and dangerous, and I would not trade the company for anything. The Guard looks after its own." } },
      choices = {
        { text = "Take no prisoners out there.", next = "BACK", reply = "That's harsh, but this is a harsh place.", fx = { align = { honor = -1 } } },
        { text = "Spare those who surrender.", next = "BACK", reply = "Good. That is how the Alliance should fight.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wolf riders from the south, and anyone who tries to slip past the bunkers to the graveyard. They always try." } },
      choices = {
        { text = "How do I stop them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Stay close to the bunker, hit hard, and call for help before you need it. Pride gets soldiers killed here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stonehearth_outpost = { { id = "tp_ystonehearth_outpost", text = "Stonehearth Outpost. Not much to look at, but it's ours, and we mean to keep it." } },
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar keeps the Guard together with his voice alone. I've never met a louder commander, nor a braver one." } },
    knows = { { id = "tp_knows", text = "Stonehearth Outpost, the patrols, and the Frostwolf raiders who test them." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lieutenant Largent: human lieutenant of the Stormpike Guard near Stonehearth Outpost.
P:NPC {
  key = "bg_largent", id = 13296, name = "Lieutenant Largent", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "dutiful", "steady" }, values = { "loyal", "brave" },

  impression = {
    first = "A human lieutenant from Stormwind, serving with the Stormpike.",
    third = "{name} spoke with Lieutenant Largent near Stonehearth Outpost.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you again, soldier. Stonehearth holds, and it holds better when you're on the line with us." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll take your report, but stay out of the way of the soldiers who actually hold this outpost." },
    { id = "g_default", text = "Soldier. Stonehearth Outpost holds, and I mean to keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, we could use the help." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. You're a long way from Frostwolf Keep, and you won't get any closer." },
    { id = "yg_0", when = { race = "Human" }, text = "A fellow human! The dwarves are fine company, but they never stop talking about beards." },
    { id = "yg_1", when = { race = "Dwarf" }, text = "A dwarf o' the Guard. Good, Stonehearth Outpost could always use another stout pair o' shoulders." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a soldier of Lordaeron before the Plague took the kingdom from under us. When the Stormpike asked for men who knew Alterac, I came. These mountains were once ours too, after a fashion." },
      },
      choices = {
        { text = "We're guests in this valley; we should honour the Stormpike's trust.", next = "BACK", reply = "Well said. The dwarves didn't have to let Stormwind men stand beside them, and I don't forget it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the dwarves bleed for their own valley first.", next = "BACK", reply = "Then go home to Stormwind and say that in the Pig and Whistle, not here.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you regret it?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = {
        { id = "y_y_regret", text = "Some nights, when the wind howls through the bunker and I can't feel my feet. But then I see the dwarves standing beside me, and I remember that soldiers don't choose their wars, only their friends." },
        { id = "y_y_regret_v0", when = { faction = "Alliance" }, text = "Some nights, when the wind howls and I can't feel my feet. But I'm Alliance, and we hold together. That's worth a little cold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_post = {
      lines = {
        { id = "y_y_post", text = "Stonehearth Outpost guards the road between Dun Baldar and the middle of the valley. If it falls, the Frostwolves can bring their dead back on our doorstep, and the whole valley tips their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Supplies, mostly. Every cart of food and every bundle of arrows comes up from Ironforge over the passes, and when the snow comes, the carts stop. We've gone hungry before, and I'd rather not do it again with the wolves at the gate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_terms = {
      lines = {
        { id = "y_y_terms", text = "I've heard the shamans of the Frostwolves speak of peace, once, under a flag of truce. Vanndar wouldn't hear of it. What would you do, soldier, if you had the choice?" },
      },
      choices = {
        { text = "Hold the line. The Horde would never honour terms.", next = "BACK", reply = "That's what Vanndar said, and maybe he's right. Hold it is.", fx = { align = { order = 1 } } },
        { text = "Seek terms. Enough soldiers have died in this snow.", next = "BACK", reply = "I'd like to believe that would work. Keep that thought; we may need it someday.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lieutenant Largent, Stormpike Guard. I keep watch around Stonehearth Outpost, and while I stand, the Guard's soldiers keep coming back to hold it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why is a human serving here?", next = "b1" },
        { text = "What should I watch for near your post?", next = "b2" },
        { text = "How did you end up in the Stormpike Guard?", next = "y_hist" },
        { text = "Why does Stonehearth Outpost matter?", next = "y_post" },
        { text = "What worries you most?", next = "y_worry" },
        { text = "Should we fight on, or seek terms?", next = "y_terms" },
        { text = "Someone of your kind, in a dwarf army?", next = "BACK", when = { race = "Human" }, reply = "I served Lordaeron once, and I miss her every day. Alterac is the closest I come to home." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because Stormwind sent soldiers to help, and I volunteered. The dwarves are good company, though their ale takes some getting used to." } },
      choices = {
        { text = "Do you like serving here?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is cold and dangerous, and I would not trade the company for anything. The Guard looks after its own." } },
      choices = {
        { text = "Take no prisoners out there.", next = "BACK", reply = "That's harsh, but this is a harsh place.", fx = { align = { honor = -1 } } },
        { text = "Spare those who surrender.", next = "BACK", reply = "Good. That is how the Alliance should fight.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wolf riders from the south, and anyone who tries to slip past the bunkers to the graveyard. They always try." } },
      choices = {
        { text = "How do I stop them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Stay close to the bunker, hit hard, and call for help before you need it. Pride gets soldiers killed here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stonehearth_outpost = { { id = "tp_ystonehearth_outpost", text = "Stonehearth Outpost. Not much to look at, but it's ours, and we mean to keep it." } },
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar keeps the Guard together with his voice alone. I've never met a louder commander, nor a braver one." } },
    knows = { { id = "tp_knows", text = "Stonehearth Outpost, the patrols, and the Frostwolf raiders who test them." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lieutenant Lonadin: night elf lieutenant of the Stormpike Guard near Icewing Bunker.
P:NPC {
  key = "bg_lonadin", id = 13299, name = "Lieutenant Lonadin", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "dutiful", "steady" }, values = { "loyal", "brave" },

  impression = {
    first = "A night elf lieutenant who patrols between Icewing Bunker and Stonehearth.",
    third = "{name} spoke with Lieutenant Lonadin near Icewing Bunker.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah. You return, and Icewing holds; I am glad to see you on the path again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Icewing holds without your help, so keep to the path and away from my patrol." },
    { id = "g_default", text = "Soldier. Icewing Bunker holds, and I mean to keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, we could use the help." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. You're a long way from Frostwolf Keep, and you won't get any closer." },
    { id = "yg_0", when = { race = "NightElf" }, text = "Ishnu-alah, sister or brother. It is good to hear Darnassian spoken in this cold place." },
    { id = "yg_1", when = { race = "Dwarf" }, text = "A dwarf o' the Guard. Good, Icewing Bunker could always use another stout pair o' shoulders." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I came from Ashenvale, where the Warsong cut our forests. When word came that the same Horde fought for Alterac, I asked the Sentinels to send me. The Stormpike were surprised to see an elf in their ranks, but they have not complained of my bow." },
      },
      choices = {
        { text = "A patrol is only as good as the truth of its reports.", next = "BACK", reply = "So the Sentinels taught me, long before I ever saw this cold valley.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Report the path clear and get back to the fire.", next = "BACK", reply = "And when the Frostwolves come up that path, whose fault would it be? Not mine.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you regret it?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = {
        { id = "y_y_regret", text = "Some nights, when the wind howls through the bunker and I can't feel my feet. But then I see the dwarves standing beside me, and I remember that soldiers don't choose their wars, only their friends." },
        { id = "y_y_regret_v0", when = { faction = "Alliance" }, text = "Some nights, when the wind howls and I can't feel my feet. But I'm Alliance, and we hold together. That's worth a little cold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_post = {
      lines = {
        { id = "y_y_post", text = "Icewing Bunker guards the road between Dun Baldar and the middle of the valley. If it falls, the Frostwolves can bring their dead back on our doorstep, and the whole valley tips their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Supplies, mostly. Every cart of food and every bundle of arrows comes up from Ironforge over the passes, and when the snow comes, the carts stop. We've gone hungry before, and I'd rather not do it again with the wolves at the gate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_terms = {
      lines = {
        { id = "y_y_terms", text = "I've heard the shamans of the Frostwolves speak of peace, once, under a flag of truce. Vanndar wouldn't hear of it. What would you do, soldier, if you had the choice?" },
      },
      choices = {
        { text = "Hold the line. The Horde would never honour terms.", next = "BACK", reply = "That's what Vanndar said, and maybe he's right. Hold it is.", fx = { align = { order = 1 } } },
        { text = "Seek terms. Enough soldiers have died in this snow.", next = "BACK", reply = "I'd like to believe that would work. Keep that thought; we may need it someday.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lieutenant Lonadin, Stormpike Guard. I keep watch around Icewing Bunker, and while I stand, the Guard's soldiers keep coming back to hold it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why is a night elf so far north?", next = "b1" },
        { text = "What should I watch for near your post?", next = "b2" },
        { text = "How did you end up in the Stormpike Guard?", next = "y_hist" },
        { text = "Why does Icewing Bunker matter?", next = "y_post" },
        { text = "What worries you most?", next = "y_worry" },
        { text = "Should we fight on, or seek terms?", next = "y_terms" },
        { text = "Someone of your kind, in a dwarf army?", next = "BACK", when = { race = "NightElf" }, reply = "I am far from the forests of Ashenvale, but the Horde are the same Horde wherever I find them." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "The Sentinels lend a few blades to our allies, and I asked to be one of them. The snow reminds me of Winterspring." } },
      choices = {
        { text = "Do you like serving here?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is cold and dangerous, and I would not trade the company for anything. The Guard looks after its own." } },
      choices = {
        { text = "Take no prisoners out there.", next = "BACK", reply = "That's harsh, but this is a harsh place.", fx = { align = { honor = -1 } } },
        { text = "Spare those who surrender.", next = "BACK", reply = "Good. That is how the Alliance should fight.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wolf riders from the south, and anyone who tries to slip past the bunkers to the graveyard. They always try." } },
      choices = {
        { text = "How do I stop them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Stay close to the bunker, hit hard, and call for help before you need it. Pride gets soldiers killed here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    icewing_bunker = { { id = "tp_yicewing_bunker", text = "Icewing Bunker. Not much to look at, but it's ours, and we mean to keep it." } },
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar keeps the Guard together with his voice alone. I've never met a louder commander, nor a braver one." } },
    knows = { { id = "tp_knows", text = "Icewing Bunker, the patrols, and the Frostwolf raiders who test them." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lieutenant Mancuso: human lieutenant of the Stormpike Guard near Stonehearth Bunker.
P:NPC {
  key = "bg_mancuso", id = 13300, name = "Lieutenant Mancuso", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "dutiful", "steady" }, values = { "loyal", "brave" },

  impression = {
    first = "A human lieutenant who patrols north of Stonehearth Bunker.",
    third = "{name} spoke with Lieutenant Mancuso near Stonehearth Bunker.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! Good, because the ground north of the bunker's crawling, and I'd rather have you than not." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Stonehearth Bunker holds, and it doesn't need you, so stay south of my patrol." },
    { id = "g_default", text = "Soldier. Stonehearth Bunker holds, and I mean to keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, we could use the help." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde. You're a long way from Frostwolf Keep, and you won't get any closer." },
    { id = "yg_0", when = { race = "Human" }, text = "A fellow human! The dwarves are fine company, but they never stop talking about beards." },
    { id = "yg_1", when = { race = "Dwarf" }, text = "A dwarf o' the Guard. Good, Stonehearth Bunker could always use another stout pair o' shoulders." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "Stromgarde born, Stormpike sworn. When Stromgarde's walls started falling to ogres and the Syndicate, I went looking for a war I could actually win. Alterac seemed as good a place as any, and colder." },
      },
      choices = {
        { text = "A good soldier takes a fair share of the cold watches.", next = "BACK", reply = "That's right, and you'd be surprised how many try to dodge the midnight shift.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bribe someone for the warm shift; everyone does it.", next = "BACK", reply = "Not in my patrol they don't, and I'll know if you try.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you regret it?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = {
        { id = "y_y_regret", text = "Some nights, when the wind howls through the bunker and I can't feel my feet. But then I see the dwarves standing beside me, and I remember that soldiers don't choose their wars, only their friends." },
        { id = "y_y_regret_v0", when = { faction = "Alliance" }, text = "Some nights, when the wind howls and I can't feel my feet. But I'm Alliance, and we hold together. That's worth a little cold." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_post = {
      lines = {
        { id = "y_y_post", text = "Stonehearth Bunker guards the road between Dun Baldar and the middle of the valley. If it falls, the Frostwolves can bring their dead back on our doorstep, and the whole valley tips their way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Supplies, mostly. Every cart of food and every bundle of arrows comes up from Ironforge over the passes, and when the snow comes, the carts stop. We've gone hungry before, and I'd rather not do it again with the wolves at the gate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_terms = {
      lines = {
        { id = "y_y_terms", text = "I've heard the shamans of the Frostwolves speak of peace, once, under a flag of truce. Vanndar wouldn't hear of it. What would you do, soldier, if you had the choice?" },
      },
      choices = {
        { text = "Hold the line. The Horde would never honour terms.", next = "BACK", reply = "That's what Vanndar said, and maybe he's right. Hold it is.", fx = { align = { order = 1 } } },
        { text = "Seek terms. Enough soldiers have died in this snow.", next = "BACK", reply = "I'd like to believe that would work. Keep that thought; we may need it someday.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lieutenant Mancuso, Stormpike Guard. I keep watch around Stonehearth Bunker, and while I stand, the Guard's soldiers keep coming back to hold it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Where are you from?", next = "b1" },
        { text = "What should I watch for near your post?", next = "b2" },
        { text = "How did you end up in the Stormpike Guard?", next = "y_hist" },
        { text = "Why does Stonehearth Bunker matter?", next = "y_post" },
        { text = "What worries you most?", next = "y_worry" },
        { text = "Should we fight on, or seek terms?", next = "y_terms" },
        { text = "Someone of your kind, in a dwarf army?", next = "BACK", when = { race = "Human" }, reply = "Stromgarde gave me my sword, and the Stormpike gave me a reason to keep using it." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Lakeshire, in Redridge. I came north looking for a war I could actually win, and I'm still looking." } },
      choices = {
        { text = "Do you like serving here?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "It is cold and dangerous, and I would not trade the company for anything. The Guard looks after its own." } },
      choices = {
        { text = "Take no prisoners out there.", next = "BACK", reply = "That's harsh, but this is a harsh place.", fx = { align = { honor = -1 } } },
        { text = "Spare those who surrender.", next = "BACK", reply = "Good. That is how the Alliance should fight.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Wolf riders from the south, and anyone who tries to slip past the bunkers to the graveyard. They always try." } },
      choices = {
        { text = "How do I stop them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Stay close to the bunker, hit hard, and call for help before you need it. Pride gets soldiers killed here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stonehearth_bunker = { { id = "tp_ystonehearth_bunker", text = "Stonehearth Bunker. Not much to look at, but it's ours, and we mean to keep it." } },
    vanndar = { { id = "tp_yvanndar", text = "General Vanndar keeps the Guard together with his voice alone. I've never met a louder commander, nor a braver one." } },
    knows = { { id = "tp_knows", text = "Stonehearth Bunker, the patrols, and the Frostwolf raiders who test them." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Stormpike Commando: a new Stormpike commando, one of the Guard's raiders.
P:NPC {
  key = "bg_commando_stormpike", id = 13524, name = "Stormpike Commando", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "eager" }, values = { "brave", "loyal" },

  impression = {
    first = "He wears the Stormpike colors like a new soldier, with the scars to match.",
    third = "{name} spoke with a Stormpike Commando of the Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ho, it's you! Ready tae hit the wolves again? I've been waitin' for a proper raidin' partner." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'd raid wi' a pack o' frostwolves before I'd raid wi' you, so stay out o' my way." },
    { id = "g_default", text = "Ho, soldier! Ready tae hit the wolves where it hurts?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always another raid." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf! Commandos, tae me!" },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Ho, kinsman! Commandos could always use another stout dwarf wi' quiet boots." },
    { id = "yg_1", when = { class = "ROGUE" }, text = "Ye move like one o' us already. Keep tae the snow shadows an' the wolves'll never smell ye." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Not long, if I'm honest. I came up from the Ironforge barracks this spring, an' I've only been on three raids. The veterans say I'll stop shakin' after the fifth." },
      },
      choices = {
        { text = "Raid their soldiers, but leave the wolf pups alone.", next = "BACK", reply = "Aye, there's no glory in the other, an' I'd no' look Vanndar in the eye after.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Burn the kennels, pups and all; it'll break their spirit.", next = "BACK", reply = "It'd break somethin' in me, friend, an' I'm no' about tae let it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What was the hardest raid?", next = "y_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hard = {
      lines = {
        { id = "y_y_hard", text = "A night raid on the Frostwolf Relief Hut, when the snow came down so thick we couldnae see our own beards. We got in, aye, but we came out fewer, an' the wolves howled after us all the way tae Stonehearth." },
        { id = "y_y_hard_v0", when = { race = "Gnome" }, text = "The Relief Hut raid, in a blizzard. Ye'd have hated it, gnome, the snow was up tae yer chin. We got in, but we came out fewer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_raid = {
      lines = {
        { id = "y_y_raid", text = "Quick an' quiet. We go out in small packs, hit a Frostwolf graveyard or a supply line, an' get back before their riders find us. The druids call it dishonourable, an' the Commander says it's war." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "The wolf riders, if ye want the truth. A dwarf can stand against an orc on foot, but a Frostwolf on his wolf comes out o' the snow like the mountain's own teeth. I've seen good commandos taken before they could shout." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_spare = {
      lines = {
        { id = "y_y_spare", text = "That's a hard question, soldier, an' every commando answers it differently. Some say a wounded wolf is still a wolf. Some say we're Stormpike, nae butchers. What do ye say?" },
      },
      choices = {
        { text = "Spare the wounded. We're soldiers, not butchers.", next = "BACK", reply = "Aye. My mother would say the same, an' I'd nae argue wi' her.", fx = { align = { light = 1 } } },
        { text = "A wounded orc fights again tomorrow. Finish it.", next = "BACK", reply = "Cold, but it's the cold that keeps us alive out here. I'll nae fault ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike commando, an' a new one at that. We go where the line's thinnest an' make sure the Frostwolves regret it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do commandos do?", next = "b1" },
        { text = "How long have you served?", next = "b2" },
        { text = "How long have you been a commando?", next = "y_long" },
        { text = "What does a commando raid look like?", next = "y_raid" },
        { text = "What do you fear out there?", next = "y_fear" },
        { text = "Do you ever spare the Frostwolf wounded?", next = "y_spare" },
        { text = "I fight from the shadows too.", next = "BACK", when = { class = "ROGUE" }, reply = "Then ye'll do fine wi' us. Bring yer own knives, we're short." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "We raid. Towers, graveyards, supply lines, anythin' the wolves leave half-guarded. Quick in, quick out, an' leave a mess behind." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Aye, but less dangerous than standin' in one place waitin' for them tae come. A movin' dwarf is a livin' dwarf." } },
      choices = {
        { text = "Hit them hard and leave nothing standing.", next = "BACK", reply = "Aye! That's the commando way.", fx = { align = { honor = -1 } } },
        { text = "Strike fast, but don't kill needlessly.", next = "BACK", reply = "Hmph. Fair enough, but the wolves'll no' return the favor.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "No' long, but I've seen enough tae know I'm in the right place." } },
      choices = {
        { text = "What keeps you going?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The Guard, an' the thought o' a warm hearth in Ironforge when it's done. An' a good ale, if Brogus has any left." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves are fierce an' they know these hills. I'll give them that much, an' nae a whit more." } },
    dun_baldar = { { id = "tp_ydun_baldar", text = "Dun Baldar's home, as much as anywhere is out here. Good ale, thick walls, an' Vanndar's bellow tae wake ye." } },
    knows = { { id = "tp_knows", text = "Raids, ambushes, an' where the Frostwolves forget tae look." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Commando: a seasoned Stormpike commando, one of the Guard's raiders.
P:NPC {
  key = "bg_commando_seasoned", id = 13525, name = "Seasoned Commando", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "hardened" }, values = { "brave", "loyal" },

  impression = {
    first = "He wears the Stormpike colors like a seasoned soldier, with the scars to match.",
    third = "{name} spoke with a Seasoned Commando of the Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' still breathin'! Come on, there's always another raid, an' I want ye on it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I've seen ye raid, an' I'd sooner go out alone than wi' ye at my back." },
    { id = "g_default", text = "Ho, soldier! Ready tae hit the wolves where it hurts?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always another raid." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf! Commandos, tae me!" },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Ho, kinsman! Commandos could always use another stout dwarf wi' quiet boots." },
    { id = "yg_1", when = { class = "ROGUE" }, text = "Ye move like one o' us already. Keep tae the snow shadows an' the wolves'll never smell ye." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Two seasons. Long enough tae know the wolf trails better than the roads, an' tae stop countin' the raids." },
      },
      choices = {
        { text = "Never leave a wounded comrade behind in the snow.", next = "BACK", reply = "Never. I've carried three out o' the pass on my own back, an' I'd do it again.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A wounded comrade slows the raid; leave them.", next = "BACK", reply = "Then pray ye're never the one bleedin' in the snow, friend.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What was the hardest raid?", next = "y_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hard = {
      lines = {
        { id = "y_y_hard", text = "A night raid on the Frostwolf Relief Hut, when the snow came down so thick we couldnae see our own beards. We got in, aye, but we came out fewer, an' the wolves howled after us all the way tae Stonehearth." },
        { id = "y_y_hard_v0", when = { race = "Gnome" }, text = "The Relief Hut raid, in a blizzard. Ye'd have hated it, gnome, the snow was up tae yer chin. We got in, but we came out fewer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_raid = {
      lines = {
        { id = "y_y_raid", text = "Quick an' quiet. We go out in small packs, hit a Frostwolf graveyard or a supply line, an' get back before their riders find us. The druids call it dishonourable, an' the Commander says it's war." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "The wolf riders, if ye want the truth. A dwarf can stand against an orc on foot, but a Frostwolf on his wolf comes out o' the snow like the mountain's own teeth. I've seen good commandos taken before they could shout." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_spare = {
      lines = {
        { id = "y_y_spare", text = "That's a hard question, soldier, an' every commando answers it differently. Some say a wounded wolf is still a wolf. Some say we're Stormpike, nae butchers. What do ye say?" },
      },
      choices = {
        { text = "Spare the wounded. We're soldiers, not butchers.", next = "BACK", reply = "Aye. My mother would say the same, an' I'd nae argue wi' her.", fx = { align = { light = 1 } } },
        { text = "A wounded orc fights again tomorrow. Finish it.", next = "BACK", reply = "Cold, but it's the cold that keeps us alive out here. I'll nae fault ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike commando, an' a seasoned one at that. We go where the line's thinnest an' make sure the Frostwolves regret it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do commandos do?", next = "b1" },
        { text = "How long have you served?", next = "b2" },
        { text = "How long have you been a commando?", next = "y_long" },
        { text = "What does a commando raid look like?", next = "y_raid" },
        { text = "What do you fear out there?", next = "y_fear" },
        { text = "Do you ever spare the Frostwolf wounded?", next = "y_spare" },
        { text = "I fight from the shadows too.", next = "BACK", when = { class = "ROGUE" }, reply = "Then ye'll do fine wi' us. Bring yer own knives, we're short." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "We raid. Towers, graveyards, supply lines, anythin' the wolves leave half-guarded. Quick in, quick out, an' leave a mess behind." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Aye, but less dangerous than standin' in one place waitin' for them tae come. A movin' dwarf is a livin' dwarf." } },
      choices = {
        { text = "Hit them hard and leave nothing standing.", next = "BACK", reply = "Aye! That's the commando way.", fx = { align = { honor = -1 } } },
        { text = "Strike fast, but don't kill needlessly.", next = "BACK", reply = "Hmph. Fair enough, but the wolves'll no' return the favor.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Long enough tae lose count o' the raids. The young ones come an' go, but the stubborn ones stay." } },
      choices = {
        { text = "What keeps you going?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The Guard, an' the thought o' a warm hearth in Ironforge when it's done. An' a good ale, if Brogus has any left." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves are fierce an' they know these hills. I'll give them that much, an' nae a whit more." } },
    dun_baldar = { { id = "tp_ydun_baldar", text = "Dun Baldar's home, as much as anywhere is out here. Good ale, thick walls, an' Vanndar's bellow tae wake ye." } },
    knows = { { id = "tp_knows", text = "Raids, ambushes, an' where the Frostwolves forget tae look." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Veteran Commando: a veteran Stormpike commando, one of the Guard's raiders.
P:NPC {
  key = "bg_commando_veteran", id = 13526, name = "Veteran Commando", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "hardened" }, values = { "brave", "loyal" },

  impression = {
    first = "He wears the Stormpike colors like a veteran soldier, with the scars to match.",
    third = "{name} spoke with a Veteran Commando of the Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there ye are. I've seen enough raids tae know a good soldier, an' you're one o' the good ones." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Twenty raids in this valley, an' I've never trusted anyone less." },
    { id = "g_default", text = "Ho, soldier! Ready tae hit the wolves where it hurts?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always another raid." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf! Commandos, tae me!" },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Ho, kinsman! Commandos could always use another stout dwarf wi' quiet boots." },
    { id = "yg_1", when = { class = "ROGUE" }, text = "Ye move like one o' us already. Keep tae the snow shadows an' the wolves'll never smell ye." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Six seasons. I was on the raid that burned the Frostwolf stables the first time, an' I'm nae proud o' everything we did that night." },
      },
      choices = {
        { text = "Fight the Frostwolves openly, and they'll respect you for it.", next = "BACK", reply = "They will, an' oddly enough I respect them back. It's a strange war, this.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Wear their colours and strike from inside their lines.", next = "BACK", reply = "It's dishonest, an' a fair way tae get shot by yer own side. I'll no' do it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What was the hardest raid?", next = "y_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hard = {
      lines = {
        { id = "y_y_hard", text = "A night raid on the Frostwolf Relief Hut, when the snow came down so thick we couldnae see our own beards. We got in, aye, but we came out fewer, an' the wolves howled after us all the way tae Stonehearth." },
        { id = "y_y_hard_v0", when = { race = "Gnome" }, text = "The Relief Hut raid, in a blizzard. Ye'd have hated it, gnome, the snow was up tae yer chin. We got in, but we came out fewer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_raid = {
      lines = {
        { id = "y_y_raid", text = "Quick an' quiet. We go out in small packs, hit a Frostwolf graveyard or a supply line, an' get back before their riders find us. The druids call it dishonourable, an' the Commander says it's war." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "The wolf riders, if ye want the truth. A dwarf can stand against an orc on foot, but a Frostwolf on his wolf comes out o' the snow like the mountain's own teeth. I've seen good commandos taken before they could shout." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_spare = {
      lines = {
        { id = "y_y_spare", text = "That's a hard question, soldier, an' every commando answers it differently. Some say a wounded wolf is still a wolf. Some say we're Stormpike, nae butchers. What do ye say?" },
      },
      choices = {
        { text = "Spare the wounded. We're soldiers, not butchers.", next = "BACK", reply = "Aye. My mother would say the same, an' I'd nae argue wi' her.", fx = { align = { light = 1 } } },
        { text = "A wounded orc fights again tomorrow. Finish it.", next = "BACK", reply = "Cold, but it's the cold that keeps us alive out here. I'll nae fault ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike commando, an' a veteran one at that. We go where the line's thinnest an' make sure the Frostwolves regret it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do commandos do?", next = "b1" },
        { text = "How long have you served?", next = "b2" },
        { text = "How long have you been a commando?", next = "y_long" },
        { text = "What does a commando raid look like?", next = "y_raid" },
        { text = "What do you fear out there?", next = "y_fear" },
        { text = "Do you ever spare the Frostwolf wounded?", next = "y_spare" },
        { text = "I fight from the shadows too.", next = "BACK", when = { class = "ROGUE" }, reply = "Then ye'll do fine wi' us. Bring yer own knives, we're short." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "We raid. Towers, graveyards, supply lines, anythin' the wolves leave half-guarded. Quick in, quick out, an' leave a mess behind." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Aye, but less dangerous than standin' in one place waitin' for them tae come. A movin' dwarf is a livin' dwarf." } },
      choices = {
        { text = "Hit them hard and leave nothing standing.", next = "BACK", reply = "Aye! That's the commando way.", fx = { align = { honor = -1 } } },
        { text = "Strike fast, but don't kill needlessly.", next = "BACK", reply = "Hmph. Fair enough, but the wolves'll no' return the favor.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Long enough tae lose count o' the raids. The young ones come an' go, but the stubborn ones stay." } },
      choices = {
        { text = "What keeps you going?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The Guard, an' the thought o' a warm hearth in Ironforge when it's done. An' a good ale, if Brogus has any left." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves are fierce an' they know these hills. I'll give them that much, an' nae a whit more." } },
    dun_baldar = { { id = "tp_ydun_baldar", text = "Dun Baldar's home, as much as anywhere is out here. Good ale, thick walls, an' Vanndar's bellow tae wake ye." } },
    knows = { { id = "tp_knows", text = "Raids, ambushes, an' where the Frostwolves forget tae look." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Champion Commando: a champion Stormpike commando, one of the Guard's raiders.
P:NPC {
  key = "bg_commando_champion", id = 13527, name = "Champion Commando", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "hardened" }, values = { "brave", "loyal" },

  impression = {
    first = "He wears the Stormpike colors like a champion soldier, with the scars to match.",
    third = "{name} spoke with a Champion Commando of the Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well met again, champion o' the Guard! The others look tae you now, an' so do I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. A champion's earned the right tae choose his company, an' I'd no' choose you." },
    { id = "g_default", text = "Ho, soldier! Ready tae hit the wolves where it hurts?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always another raid." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf! Commandos, tae me!" },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Ho, kinsman! Commandos could always use another stout dwarf wi' quiet boots." },
    { id = "yg_1", when = { class = "ROGUE" }, text = "Ye move like one o' us already. Keep tae the snow shadows an' the wolves'll never smell ye." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Longer than most o' the Guard's been in the valley. I led the first commandos over the Field o' Strife, an' Vanndar still sends for me when he wants somethin' done quiet." },
      },
      choices = {
        { text = "A victory means nothing if it's won dishonestly.", next = "BACK", reply = "True enough, an' I've a scar or two from learnin' that the hard way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody asks how you won, only that you did.", next = "BACK", reply = "I ask, friend, every time, an' so does every dwarf who ever looked up tae me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What was the hardest raid?", next = "y_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hard = {
      lines = {
        { id = "y_y_hard", text = "A night raid on the Frostwolf Relief Hut, when the snow came down so thick we couldnae see our own beards. We got in, aye, but we came out fewer, an' the wolves howled after us all the way tae Stonehearth." },
        { id = "y_y_hard_v0", when = { race = "Gnome" }, text = "The Relief Hut raid, in a blizzard. Ye'd have hated it, gnome, the snow was up tae yer chin. We got in, but we came out fewer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_raid = {
      lines = {
        { id = "y_y_raid", text = "Quick an' quiet. We go out in small packs, hit a Frostwolf graveyard or a supply line, an' get back before their riders find us. The druids call it dishonourable, an' the Commander says it's war." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "The wolf riders, if ye want the truth. A dwarf can stand against an orc on foot, but a Frostwolf on his wolf comes out o' the snow like the mountain's own teeth. I've seen good commandos taken before they could shout." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_spare = {
      lines = {
        { id = "y_y_spare", text = "That's a hard question, soldier, an' every commando answers it differently. Some say a wounded wolf is still a wolf. Some say we're Stormpike, nae butchers. What do ye say?" },
      },
      choices = {
        { text = "Spare the wounded. We're soldiers, not butchers.", next = "BACK", reply = "Aye. My mother would say the same, an' I'd nae argue wi' her.", fx = { align = { light = 1 } } },
        { text = "A wounded orc fights again tomorrow. Finish it.", next = "BACK", reply = "Cold, but it's the cold that keeps us alive out here. I'll nae fault ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike commando, an' a champion one at that. We go where the line's thinnest an' make sure the Frostwolves regret it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do commandos do?", next = "b1" },
        { text = "How long have you served?", next = "b2" },
        { text = "How long have you been a commando?", next = "y_long" },
        { text = "What does a commando raid look like?", next = "y_raid" },
        { text = "What do you fear out there?", next = "y_fear" },
        { text = "Do you ever spare the Frostwolf wounded?", next = "y_spare" },
        { text = "I fight from the shadows too.", next = "BACK", when = { class = "ROGUE" }, reply = "Then ye'll do fine wi' us. Bring yer own knives, we're short." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "We raid. Towers, graveyards, supply lines, anythin' the wolves leave half-guarded. Quick in, quick out, an' leave a mess behind." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Aye, but less dangerous than standin' in one place waitin' for them tae come. A movin' dwarf is a livin' dwarf." } },
      choices = {
        { text = "Hit them hard and leave nothing standing.", next = "BACK", reply = "Aye! That's the commando way.", fx = { align = { honor = -1 } } },
        { text = "Strike fast, but don't kill needlessly.", next = "BACK", reply = "Hmph. Fair enough, but the wolves'll no' return the favor.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Long enough tae lose count o' the raids. The young ones come an' go, but the stubborn ones stay." } },
      choices = {
        { text = "What keeps you going?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The Guard, an' the thought o' a warm hearth in Ironforge when it's done. An' a good ale, if Brogus has any left." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The wolves are fierce an' they know these hills. I'll give them that much, an' nae a whit more." } },
    dun_baldar = { { id = "tp_ydun_baldar", text = "Dun Baldar's home, as much as anywhere is out here. Good ale, thick walls, an' Vanndar's bellow tae wake ye." } },
    knows = { { id = "tp_knows", text = "Raids, ambushes, an' where the Frostwolves forget tae look." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Stormpike Herald: human herald who calls out the Guard's news across the valley.
P:NPC {
  key = "bg_stormpike_herald", id = 11997, name = "Stormpike Herald", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "formal", "loud" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A crisp human in a tabard, whose voice is trained to carry over battle.",
    third = "{name} heard the news from the Stormpike Herald.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and I'm glad of it! I've news for you, and I'd rather give it to you than anyone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I shall announce the Guard's news, as is my duty, but I'd much prefer to announce your departure." },
    { id = "g_default", text = "Hear ye, soldier! The Guard has news, and I am the one to share it." },
    { id = "g_back", when = { metBefore = true }, text = "You return! There is always more news." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde, in our lines! I shall announce your arrival, and your departure." },
    { id = "yg_0", when = { race = "Human" }, text = "A fellow human! Ye'll appreciate a good proclamation, I'm sure." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! I'll speak slowly and loudly, so ye can hear me down there. That's a joke, by the way." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was a town crier in Southshore before the war. When the Stormpike came through, recruiting, they needed someone with a loud voice and a good memory. I have both, and very little sense, so I volunteered." },
      },
      choices = {
        { text = "A herald should cry the news true, good or bad.", next = "BACK", reply = "Just so. A herald who lies is worse than no herald at all.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cry victory every hour; it's good for morale.", next = "BACK", reply = "And when the troops see the Horde on the hill, they'll never believe me again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss Southshore?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_y_miss", text = "I miss the sea, and the smell of fish frying, and the girls who laughed at my proclamations. Here, the dwarves laugh at me too, but it is not the same. They laugh at my height." },
        { id = "y_y_miss_v0", when = { race = "Dwarf" }, text = "I miss the sea. The dwarves here laugh at my height, and I laugh at their beards. It is a fair arrangement." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_bad = {
      lines = {
        { id = "y_y_bad", text = "The worst news I ever shouted was the fall of Stonehearth Bunker, in the second winter. I had to name every dwarf who died there. I shouted until my voice gave out, and then I whispered the rest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lie = {
      lines = {
        { id = "y_y_lie", text = "A herald must tell the truth, or no one will believe him. But sometimes, when a tower falls, I wait a moment before I shout it. Just a moment, so the soldiers can finish their fight before they hear." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_truth = {
      lines = {
        { id = "y_y_truth", text = "Vanndar once asked me to announce a victory before it happened, to lift spirits. I refused. Should a herald ever lie to his own side?" },
      },
      choices = {
        { text = "Never. A herald's word must be trusted.", next = "BACK", reply = "Thank you. Vanndar was furious, but I would do it again.", fx = { align = { order = 1 } } },
        { text = "Sometimes morale matters more than truth.", next = "BACK", reply = "Hm. Perhaps. But if they catch me lying once, they will never believe me again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the Stormpike Herald. When a tower falls or a graveyard is taken, I make sure every soldier of the Guard hears it before the echoes fade." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What news is there?", next = "b1" },
        { text = "Why does the Guard need a herald?", next = "b2" },
        { text = "How did you become a herald?", next = "y_who" },
        { text = "What's the worst news you've shouted?", next = "y_bad" },
        { text = "Do you ever soften the news?", next = "y_lie" },
        { text = "Should a herald ever lie?", next = "y_truth" },
        { text = "Let me hear a proclamation.", next = "BACK", when = { race = "Human" }, reply = "Hear ye! The Stormpike hold the field, and the General stands! That one never gets old." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "The Frostwolves press at the bridges, the mines change hands by the hour, and the General still stands. That last is the news that matters." } },
      choices = {
        { text = "How do you hear so much?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Runners, gryphon riders, and a good set of ears. A herald who misses news is no herald at all." } },
      choices = {
        { text = "Shout only the victories.", next = "BACK", reply = "That would be a lie of silence, and I will not tell it.", fx = { align = { order = -1 } } },
        { text = "Tell the soldiers everything, good and bad.", next = "BACK", reply = "Yes. That is the herald's duty.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Because soldiers fight better when they know what they fight for, and worse when rumors fill the silence. I keep the silence filled with the truth." } },
      choices = {
        { text = "Do you ever lie?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Never. A herald who lies is a traitor to his own side." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    southshore = { { id = "tp_ysouthshore", text = "Southshore, by the sea. I was a crier there, before the war." } },
    news = { { id = "tp_ynews", text = "News travels fast in the valley. I make sure it travels faster." } },
    knows = { { id = "tp_knows", text = "Every tower, every graveyard, and every change of banner in the valley." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Umi Thorson: dwarf who patrols Irondeep Mine when the Stormpike hold it.
P:NPC {
  key = "bg_umi_thorson", id = 13078, name = "Umi Thorson", gender = "female",
  bible = "bibles/alterac_valley.md", role = "guard", tier = "service",
  communities = { "stormpike" }, temper = { "tough", "dry" }, values = { "dutiful", "hardy" },

  impression = {
    first = "A sturdy dwarf woman with a pick on her back and an axe in her hand.",
    third = "{name} spoke with Umi Thorson in Irondeep Mine.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back in the deep, an' welcome! The troggs have missed ye, an' so have I, if I'm honest." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Irondeep's ours an' it doesnae need you, so watch for troggs, an' then watch for me." },
    { id = "g_default", text = "Irondeep's ours, for now. Watch for troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the deep, are ye? The troggs have missed ye." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "A Frostwolf in Irondeep? The troggs'll be glad o' the company." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A kinsman in the deep! Grab a torch, the troggs dinnae like the light." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Mind the troggs, they'll mistake ye for a snack." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was with the Stormpike Expedition when we first found Irondeep. We dug the first shaft, an' we found the troggs the same day. I lost two friends in that first week, an' I swore I'd nae lose the mine too." },
      },
      choices = {
        { text = "The Guard's orders say hold the mine, so we hold it.", next = "BACK", reply = "Aye, orders are orders, an' these ones keep the forges o' Dun Baldar fed.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Orders be hanged; take the ore and go home.", next = "BACK", reply = "An' let the Frostwolves have Irondeep? Over my body, an' likely yers too.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Who were your friends?", next = "y_friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_friends = {
      lines = {
        { id = "y_y_friends", text = "Hilda an' Bram, miners from Thelsamar. Hilda could sing so loud the walls shook, an' Bram could find a seam blind. The troggs took them in the dark. I carved their names on the first beam, an' I touch it every mornin'." },
        { id = "y_y_friends_v0", when = { race = "Dwarf" }, text = "Hilda an' Bram, from Thelsamar. Ye might've known their kin. I carved their names on the first beam, an' I touch it every mornin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_keetar = {
      lines = {
        { id = "y_y_keetar", text = "An orc named Keetar holds the mine when the wolves take it. He's a good miner, which annoys me more than anythin'. I've seen his tunnels; they're better than half o' ours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_deep = {
      lines = {
        { id = "y_y_deep", text = "Somethin's under the troggs, I'm sure of it. I hear it some nights, grindin' an' rumblin' like the mountain's chewin'. The Explorers' League would want tae know. I've nae told them, because I dinnae want them diggin' here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_trogg = {
      lines = {
        { id = "y_y_trogg", text = "The Expedition wants the troggs cleared out for good. Some o' the miners say they were here first, an' we should leave them be. What do ye think?" },
      },
      choices = {
        { text = "Leave them. They were here first.", next = "BACK", reply = "Aye. I've thought the same. But the troggs dinnae think much o' us.", fx = { align = { honor = 1 } } },
        { text = "Clear them out. They're a danger to all.", next = "BACK", reply = "Hard words, but sensible ones. I'll tell the Expedition.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Umi Thorson, keepin' Irondeep Mine for the Guard. The Stormpike Expedition dug this mine first, an' I'll no' see it in orcish hands while I breathe." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Tell me about the troggs.", next = "b1" },
        { text = "Why does Irondeep matter?", next = "b2" },
        { text = "How did you come to Irondeep?", next = "y_who" },
        { text = "Who holds Irondeep when you don't?", next = "y_keetar" },
        { text = "What's under the mine?", next = "y_deep" },
        { text = "Should the troggs be cleared?", next = "y_trogg" },
        { text = "I know the deep roads.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye know the troggs. Keep yer back tae the wall an' yer axe high." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Nasty wee beasts, born o' the deep an' no friend tae anyone. They were here before us, an' they'll be here after, so ye learn tae live wi' them." } },
      choices = {
        { text = "How do you deal with them?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Wi' an axe, a lantern, an' a good deal o' patience. Mostly the axe." } },
      choices = {
        { text = "Kill the troggs too. Clear the mine.", next = "BACK", reply = "Aye, though more always come.", fx = { align = { light = -1 } } },
        { text = "Leave the troggs be unless they attack.", next = "BACK", reply = "A gentle thought, but they always attack.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The ore, lad. Irondeep's the richest seam in the valley, an' whoever holds it eats better an' fights better." } },
      choices = {
        { text = "Does it change hands often?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Every few hours, sometimes. I've stopped unpackin'." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    keetar = { { id = "tp_ykeetar", text = "Keetar. A good miner, for an orc. That's all I'll say." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep, the richest mine in the valley. The Stormpike dug it first." } },
    knows = { { id = "tp_knows", text = "Irondeep's seams, its troggs, an' every orc who's tried tae steal it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Alliance Spirit Guide: spirit who returns fallen Alliance soldiers to the battle in Alterac Valley.
P:NPC {
  key = "bg_alliance_spirit_guide", id = 13116, name = "Alliance Spirit Guide",
  bible = "bibles/alterac_valley.md", role = "spirithealer", tier = "service",
  communities = { "stormpike" }, temper = { "serene", "solemn" }, values = { "merciful", "patient" },

  impression = {
    first = "A pale figure of light who seems to see through the snow and the dead alike.",
    third = "{name} was sent back to the battle by an Alliance Spirit Guide.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Again you come to me, and again I am glad to send you back. The valley will not keep you yet." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You come to me once more. I will send you back, for that is my charge, but the Light is quiet when you are near." },
    { id = "g_default", text = "You have fallen, but your battle is not yet done. Rest a moment, and I will send you back." },
    { id = "g_back", when = { metBefore = true }, text = "Again you come to me. The valley is hungry, it seems." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "You are not one of mine, wandering spirit. Seek your own guide." },
    { id = "yg_0", when = { race = "Human" }, text = "Peace, child. You fell bravely, and the Light has not finished with you." },
    { id = "yg_1", when = { class = "PRIEST" }, text = "You who walk with the Light should know me already. Be still, and you will rise." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "Once I was a soldier, like you. I fell in another war, long before this one, and the Light asked me to stay a while between the worlds. I said yes, and I have not regretted it, though I have often grieved." },
      },
      choices = {
        { text = "Which war did you fall in?", next = "y_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_war = {
      lines = {
        { id = "y_y_war", text = "I no longer remember its name. I remember the cold, and a voice calling me back, and choosing not to go. Some memories the passage takes from you, and I think that was a kindness." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tired = {
      lines = {
        { id = "y_y_tired", text = "Spirits do not tire, but they do grow heavy. Each soul I return carries a little of the valley's sorrow, and some of it stays with me. It is a small price for what I give back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_enemy = {
      lines = {
        { id = "y_y_enemy", text = "I see the Horde guide across the valley sometimes, through the snow. We do not speak. We tend the same grim harvest from opposite fields, and I think we understand each other better than the living ever will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mercy = {
      lines = {
        { id = "y_y_mercy", text = "I could refuse to send you back. You would rest, then, and the war would go on without you. Some say returning the fallen only lengthens the killing. What do you believe?" },
      },
      choices = {
        { text = "Send me back. The fight is not finished.", next = "BACK", reply = "Then go, with the Light at your back. I will be here when you fall again.", fx = { align = { order = 1 } } },
        { text = "Perhaps the dead should be allowed to rest.", next = "BACK", reply = "A merciful thought. But the choice was never mine alone to make.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I guide the fallen of the Alliance back to the field. Death in this valley is not an ending, only a pause between one charge and the next." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do you send us back?", next = "b1" },
        { text = "What is it like, beyond?", next = "b2" },
        { text = "Who were you, before this?", next = "y_who" },
        { text = "Do you ever grow tired?", next = "y_tired" },
        { text = "Is there a guide for the other side?", next = "y_enemy" },
        { text = "Should the fallen be sent back at all?", next = "y_mercy" },
        { text = "Have you guided many back?", next = "BACK", when = { class = "PRIEST" }, reply = "More than snowflakes in this valley. Each one I remember, and each one I would spare if I could." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the battle calls, and the Light grants this mercy to those who fight for their homes. It is not mine to deny." } },
      choices = {
        { text = "Is there a cost?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The body forgets, but the spirit remembers each death. Do not grow careless because you return." } },
      choices = {
        { text = "Send me back so I can kill again.", next = "BACK", reply = "Go, then, and may your anger serve you.", fx = { align = { light = -1 } } },
        { text = "Send me back to protect the others.", next = "BACK", reply = "Go, then, with the Light's blessing.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Quiet, and very cold, and full of those who wait. You need not see it yet." } },
      choices = {
        { text = "Will I see it someday?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Everyone does, in time. Not today, I think." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    death = { { id = "tp_ydeath", text = "Death in this valley is a door that swings both ways. I only keep it oiled." } },
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike fight bravely. I have returned every one of them at least once." } },
    knows = { { id = "tp_knows", text = "Death, the fallen, and the long road back from both." } },
    _none = { { id = "tp_none", text = "That is a matter for the living." } },
  },
}

-- Commander Malgor: orc commander who guards the Frostwolf Graveyard.
P:NPC {
  key = "bg_malgor", id = 13152, name = "Commander Malgor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "stern", "grim" }, values = { "loyal", "dutiful" },

  impression = {
    first = "A scarred orc who looks at the graveyard as if every stone were a soldier he lost.",
    third = "{name} spoke with Commander Malgor near the Frostwolf Graveyard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back, and you are still fighting. Good, {class}; the Frostwolves need warriors like you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The clan has heard of you, and nothing good, so fight or go, but do not waste my time." },
    { id = "g_default", text = "You are here to fight, or you are here to die. Either way, you are welcome." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good. The graveyard is full enough." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. The graveyard has room for one more." },
    { id = "yg_0", when = { race = "Orc" }, text = "A Frostwolf warrior. Good. The graveyard needs living guards as much as dead ones." },
    { id = "yg_1", when = { race = "Scourge" }, text = "Forsaken. You know the graveyard better than any of us, I think. Stand here and watch." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I fought in the Second War, under Doomhammer, and I was taken in the end like most of the Horde. When Thrall freed us, I came to the Frostwolves, because they were the only clan that had kept the old ways." },
      },
      choices = {
        { text = "A Frostwolf should meet the enemy face to face.", next = "BACK", reply = "Yes. Durotan's clan has always met its enemies openly, and we always will.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Attack the dwarves while they sleep; victory is victory.", next = "BACK", reply = "That is how the old Horde fought, with demon blood in its veins, and we are not that Horde.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What were the old ways?", next = "y_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_old = {
      lines = {
        { id = "y_y_old", text = "The shamans, the spirits, the honour of the hunt. Before Gul'dan, before the warlocks, the orcs listened to the land. The Frostwolves never forgot. I came to them to remember what I had been." },
        { id = "y_y_old_v0", when = { race = "Orc" }, text = "You know them, brother, or you should. The shamans, the spirits, the honour of the hunt. The Frostwolves kept them alive when the rest of us forgot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_dead = {
      lines = {
        { id = "y_y_dead", text = "I have seen warriors rise in this graveyard many times, and I do not ask what it costs them. Some come back quieter, and some come back angrier. All of them come back, and that is what matters." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_scar = {
      lines = {
        { id = "y_y_scar", text = "Every scar on me has a name. This one is a footman from Stromgarde. This one is a dwarf of the Stormpike, three winters ago. This one is my own brother, when we were young and foolish. I keep them all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_burn = {
      lines = {
        { id = "y_y_burn", text = "When we take a Stormpike graveyard, some warriors want to desecrate it, so the dwarves feel the loss. Others say leave the dead alone. What would you do?" },
      },
      choices = {
        { text = "Leave their dead alone. It is not honourable.", next = "BACK", reply = "Yes. That is the old way, and it is mine.", fx = { align = { honor = 1 } } },
        { text = "Desecrate it. Let the dwarves feel fear.", next = "BACK", reply = "Hm. That is how Blackhand's Horde fought. I do not like it, but I understand it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Commander Malgor. I hold the Frostwolf Graveyard, and while I stand, our fallen warriors rise to fight again." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why does the graveyard matter?", next = "b1" },
        { text = "You look like you have seen many battles.", next = "b2" },
        { text = "How did you come to the Frostwolves?", next = "y_who" },
        { text = "What's it like, watching the dead return?", next = "y_dead" },
        { text = "Tell me about your scars.", next = "y_scar" },
        { text = "Should we respect the enemy's dead?", next = "y_burn" },
        { text = "I'm ready to fight.", next = "BACK", when = { class = "WARRIOR" }, reply = "Good. The dwarves come in waves. Stand in front, and I will stand beside you." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the dead must rise close to the keep, or the dwarves will reach Drek'Thar before our warriors can return. Lose it, and the keep stands alone." } },
      choices = {
        { text = "Will you hold it?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "I will hold it until I fall, and then someone else will. That is the Frostwolf way." } },
      choices = {
        { text = "Crush every dwarf who comes near.", next = "BACK", reply = "Yes. Leave none standing.", fx = { align = { honor = -1 } } },
        { text = "Fight with honor, even here.", next = "BACK", reply = "Honor. Thrall would say the same.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Too many. I fought at Hillsbrad when Thrall freed us, and I have fought ever since." } },
      choices = {
        { text = "What was that like?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Like breaking a chain you had forgotten you wore. I will never wear one again." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    doomhammer = { { id = "tp_ydoomhammer", text = "Orgrim Doomhammer was the greatest of us. I fought under him, and I still carry his name in my heart." } },
    graveyard = { { id = "tp_ygraveyard", text = "The Frostwolf Graveyard. While it stands, our dead rise close to the keep." } },
    knows = { { id = "tp_knows", text = "The graveyard, the keep, and the warriors who rise again to defend it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- East Frostwolf Warmaster: one of the four warmasters sworn to guard Drek'Thar, posted at East Frostwolf Tower.
P:NPC {
  key = "bg_east_fw_warmaster", id = 14772, name = "East Frostwolf Warmaster", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "fierce", "stern" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A towering orc in heavy armor, who never takes his eyes from the north.",
    third = "{name} spoke with the East Frostwolf Warmaster.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return to East Frostwolf Tower, and I am glad. Stand with me, and the tower stands with us." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The tower stands without you, so say what you came to say and get off my battlements." },
    { id = "g_default", text = "Warrior. East Frostwolf Tower stands, and so do I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Every axe matters." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You will not reach Drek'Thar." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother of the clan. East Frostwolf Tower is yours as much as mine while you stand here." },
    { id = "yg_1", when = { race = "Scourge" }, text = "Forsaken. The cold does not touch you, which makes you a good tower guard. Stand watch with me." },
  },

  start = "hello",
  nodes = {
    y_tower = {
      lines = {
        { id = "y_y_tower", text = "East Tower looks down the eastern slope, toward the Frostwolf Relief Hut. If the dwarves come by the eastern trail, I am the first to see them." },
      },
      choices = {
        { text = "A warmaster should die with the tower rather than abandon it.", next = "BACK", reply = "That is the oath I took, and I will keep it to the last stone.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "When the tower falls, run and live to fight again.", next = "BACK", reply = "Some call that wisdom, but I could never look Drek'Thar in the eye again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who built the towers?", next = "y_built" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_built = {
      lines = {
        { id = "y_y_built", text = "The clan built them after the exile, stone by stone, when Drek'Thar saw that the mountain alone would not protect us. Each warmaster is sworn to one tower. I swore to mine before the clan, and I will die in it if I must." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_oath = {
      lines = {
        { id = "y_y_oath", text = "Drek'Thar is old and blind, but he sees further than any of us. He gave the Frostwolves back their spirit when Thrall came home. The oath means that while I live, no dwarf reaches him by my tower." },
        { id = "y_y_oath_v0", when = { race = "Tauren" }, text = "Drek'Thar is blind, but the spirits speak to him as they speak to your shamans, tauren. The oath means I am his eyes on this slope, and I do not close them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fall = {
      lines = {
        { id = "y_y_fall", text = "If the dwarves burn East Frostwolf Tower, they will be one step closer to Drek'Thar. Then I will fight where the ashes lie, because a warmaster who outlives his tower has nothing left to guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_retreat = {
      lines = {
        { id = "y_y_retreat", text = "Some say a warmaster should fall back to the keep and fight again beside Drek'Thar. Others say the oath is to the tower and nothing else. I have my answer. What is yours?" },
      },
      choices = {
        { text = "An oath is an oath. Hold the tower to the end.", next = "BACK", reply = "Yes. That is the Frostwolf way, and it is mine.", fx = { align = { honor = 1 } } },
        { text = "Fall back and live. Drek'Thar needs you more than stone.", next = "BACK", reply = "Hm. Wise, perhaps, but not honourable. I will think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the East Frostwolf Warmaster, one of the four who stand with Drek'Thar. While East Frostwolf Tower holds, the elder's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the warmasters matter?", next = "b1" },
        { text = "What do you think of Drek'Thar?", next = "b2" },
        { text = "Tell me about your tower.", next = "y_tower" },
        { text = "What does an oath to Drek'Thar mean?", next = "y_oath" },
        { text = "What happens if the tower falls?", next = "y_fall" },
        { text = "Should a warmaster ever retreat?", next = "y_retreat" },
        { text = "I'm Frostwolf born.", next = "BACK", when = { race = "Orc" }, reply = "Then you know the oath before I say it. Hold, and do not let the tower burn." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the dwarves come for Drek'Thar, the warmasters fight beside him. Kill us first, and he fights alone. The dwarves know it, and so do we." } },
      choices = {
        { text = "What if your tower falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then I fight harder, and the dwarves pay for every stone they take." } },
      choices = {
        { text = "Kill every dwarf who reaches the keep.", next = "BACK", reply = "Yes. None will leave alive.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and fight with honor.", next = "BACK", reply = "Honor is strength. I agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "He is old, and blind, and wiser than any orc I have known. He sees with the spirits, and they do not lie." } },
      choices = {
        { text = "Would you die for him?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Without hesitation. That is why I am here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    drekthar = { { id = "tp_ydrekthar", text = "Drek'Thar is the elder shaman of the Frostwolves. He raised Thrall's people back from despair, and he will not fall while we stand." } },
    towers = { { id = "tp_ytowers", text = "Four towers, four warmasters. If they all burn, the dwarves will reach the keep, and then we fight in the snow." } },
    knows = { { id = "tp_knows", text = "East Frostwolf Tower, the warmasters, and the oath that binds us to Drek'Thar." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- West Frostwolf Warmaster: one of the four warmasters sworn to guard Drek'Thar, posted at West Frostwolf Tower.
P:NPC {
  key = "bg_west_fw_warmaster", id = 14777, name = "West Frostwolf Warmaster", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "fierce", "stern" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A towering orc in heavy armor, who never takes his eyes from the north.",
    third = "{name} spoke with the West Frostwolf Warmaster.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back to the west tower. Good, because the Stormpike have been testing the gate all morning." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The west tower has trouble enough without you, so say your piece and be gone." },
    { id = "g_default", text = "Warrior. West Frostwolf Tower stands, and so do I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Every axe matters." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You will not reach Drek'Thar." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother of the clan. West Frostwolf Tower is yours as much as mine while you stand here." },
    { id = "yg_1", when = { race = "Scourge" }, text = "Forsaken. The cold does not touch you, which makes you a good tower guard. Stand watch with me." },
  },

  start = "hello",
  nodes = {
    y_tower = {
      lines = {
        { id = "y_y_tower", text = "West Tower watches the western cliffs. The dwarves think the cliffs protect our flank. They are wrong; the cliffs only hide them until it is too late." },
      },
      choices = {
        { text = "The towers stand because each warrior trusts the next.", next = "BACK", reply = "Yes. One coward on the wall and the whole tower falls, so we keep faith.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Trust nobody on the wall; look after yourself first.", next = "BACK", reply = "Then you will die alone on the wall, and nobody will carry your body home.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who built the towers?", next = "y_built" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_built = {
      lines = {
        { id = "y_y_built", text = "The clan built them after the exile, stone by stone, when Drek'Thar saw that the mountain alone would not protect us. Each warmaster is sworn to one tower. I swore to mine before the clan, and I will die in it if I must." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_oath = {
      lines = {
        { id = "y_y_oath", text = "Drek'Thar is old and blind, but he sees further than any of us. He gave the Frostwolves back their spirit when Thrall came home. The oath means that while I live, no dwarf reaches him by my tower." },
        { id = "y_y_oath_v0", when = { race = "Tauren" }, text = "Drek'Thar is blind, but the spirits speak to him as they speak to your shamans, tauren. The oath means I am his eyes on this slope, and I do not close them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fall = {
      lines = {
        { id = "y_y_fall", text = "If the dwarves burn West Frostwolf Tower, they will be one step closer to Drek'Thar. Then I will fight where the ashes lie, because a warmaster who outlives his tower has nothing left to guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_retreat = {
      lines = {
        { id = "y_y_retreat", text = "Some say a warmaster should fall back to the keep and fight again beside Drek'Thar. Others say the oath is to the tower and nothing else. I have my answer. What is yours?" },
      },
      choices = {
        { text = "An oath is an oath. Hold the tower to the end.", next = "BACK", reply = "Yes. That is the Frostwolf way, and it is mine.", fx = { align = { honor = 1 } } },
        { text = "Fall back and live. Drek'Thar needs you more than stone.", next = "BACK", reply = "Hm. Wise, perhaps, but not honourable. I will think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the West Frostwolf Warmaster, one of the four who stand with Drek'Thar. While West Frostwolf Tower holds, the elder's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the warmasters matter?", next = "b1" },
        { text = "What do you think of Drek'Thar?", next = "b2" },
        { text = "Tell me about your tower.", next = "y_tower" },
        { text = "What does an oath to Drek'Thar mean?", next = "y_oath" },
        { text = "What happens if the tower falls?", next = "y_fall" },
        { text = "Should a warmaster ever retreat?", next = "y_retreat" },
        { text = "I'm Frostwolf born.", next = "BACK", when = { race = "Orc" }, reply = "Then you know the oath before I say it. Hold, and do not let the tower burn." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the dwarves come for Drek'Thar, the warmasters fight beside him. Kill us first, and he fights alone. The dwarves know it, and so do we." } },
      choices = {
        { text = "What if your tower falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then I fight harder, and the dwarves pay for every stone they take." } },
      choices = {
        { text = "Kill every dwarf who reaches the keep.", next = "BACK", reply = "Yes. None will leave alive.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and fight with honor.", next = "BACK", reply = "Honor is strength. I agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "He is old, and blind, and wiser than any orc I have known. He sees with the spirits, and they do not lie." } },
      choices = {
        { text = "Would you die for him?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Without hesitation. That is why I am here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    drekthar = { { id = "tp_ydrekthar", text = "Drek'Thar is the elder shaman of the Frostwolves. He raised Thrall's people back from despair, and he will not fall while we stand." } },
    towers = { { id = "tp_ytowers", text = "Four towers, four warmasters. If they all burn, the dwarves will reach the keep, and then we fight in the snow." } },
    knows = { { id = "tp_knows", text = "West Frostwolf Tower, the warmasters, and the oath that binds us to Drek'Thar." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Iceblood Warmaster: one of the four warmasters sworn to guard Drek'Thar, posted at Iceblood Tower.
P:NPC {
  key = "bg_iceblood_warmaster", id = 14773, name = "Iceblood Warmaster", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "fierce", "stern" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A towering orc in heavy armor, who never takes his eyes from the north.",
    third = "{name} spoke with the Iceblood Warmaster.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return to Iceblood. The cold is bitter up here, but I am glad to see a warrior I can trust." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Iceblood is cold enough without your company, so speak quickly and go." },
    { id = "g_default", text = "Warrior. Iceblood Tower stands, and so do I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Every axe matters." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You will not reach Drek'Thar." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother of the clan. Iceblood Tower is yours as much as mine while you stand here." },
    { id = "yg_1", when = { race = "Scourge" }, text = "Forsaken. The cold does not touch you, which makes you a good tower guard. Stand watch with me." },
  },

  start = "hello",
  nodes = {
    y_tower = {
      lines = {
        { id = "y_y_tower", text = "Iceblood stands at the heart of the valley, beside the garrison. It is the first tower the dwarves reach, and the last one they forget." },
      },
      choices = {
        { text = "Iceblood should be held with honour, not with cruelty.", next = "BACK", reply = "That is Thrall's way, and Drek'Thar's, and I will keep it here.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hang captured dwarves from the tower to warn the rest.", next = "BACK", reply = "That is Blackrock work, not Frostwolf. Never say it here again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who built the towers?", next = "y_built" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_built = {
      lines = {
        { id = "y_y_built", text = "The clan built them after the exile, stone by stone, when Drek'Thar saw that the mountain alone would not protect us. Each warmaster is sworn to one tower. I swore to mine before the clan, and I will die in it if I must." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_oath = {
      lines = {
        { id = "y_y_oath", text = "Drek'Thar is old and blind, but he sees further than any of us. He gave the Frostwolves back their spirit when Thrall came home. The oath means that while I live, no dwarf reaches him by my tower." },
        { id = "y_y_oath_v0", when = { race = "Tauren" }, text = "Drek'Thar is blind, but the spirits speak to him as they speak to your shamans, tauren. The oath means I am his eyes on this slope, and I do not close them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fall = {
      lines = {
        { id = "y_y_fall", text = "If the dwarves burn Iceblood Tower, they will be one step closer to Drek'Thar. Then I will fight where the ashes lie, because a warmaster who outlives his tower has nothing left to guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_retreat = {
      lines = {
        { id = "y_y_retreat", text = "Some say a warmaster should fall back to the keep and fight again beside Drek'Thar. Others say the oath is to the tower and nothing else. I have my answer. What is yours?" },
      },
      choices = {
        { text = "An oath is an oath. Hold the tower to the end.", next = "BACK", reply = "Yes. That is the Frostwolf way, and it is mine.", fx = { align = { honor = 1 } } },
        { text = "Fall back and live. Drek'Thar needs you more than stone.", next = "BACK", reply = "Hm. Wise, perhaps, but not honourable. I will think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the Iceblood Warmaster, one of the four who stand with Drek'Thar. While Iceblood Tower holds, the elder's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the warmasters matter?", next = "b1" },
        { text = "What do you think of Drek'Thar?", next = "b2" },
        { text = "Tell me about your tower.", next = "y_tower" },
        { text = "What does an oath to Drek'Thar mean?", next = "y_oath" },
        { text = "What happens if the tower falls?", next = "y_fall" },
        { text = "Should a warmaster ever retreat?", next = "y_retreat" },
        { text = "I'm Frostwolf born.", next = "BACK", when = { race = "Orc" }, reply = "Then you know the oath before I say it. Hold, and do not let the tower burn." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the dwarves come for Drek'Thar, the warmasters fight beside him. Kill us first, and he fights alone. The dwarves know it, and so do we." } },
      choices = {
        { text = "What if your tower falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then I fight harder, and the dwarves pay for every stone they take." } },
      choices = {
        { text = "Kill every dwarf who reaches the keep.", next = "BACK", reply = "Yes. None will leave alive.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and fight with honor.", next = "BACK", reply = "Honor is strength. I agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "He is old, and blind, and wiser than any orc I have known. He sees with the spirits, and they do not lie." } },
      choices = {
        { text = "Would you die for him?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Without hesitation. That is why I am here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    drekthar = { { id = "tp_ydrekthar", text = "Drek'Thar is the elder shaman of the Frostwolves. He raised Thrall's people back from despair, and he will not fall while we stand." } },
    towers = { { id = "tp_ytowers", text = "Four towers, four warmasters. If they all burn, the dwarves will reach the keep, and then we fight in the snow." } },
    knows = { { id = "tp_knows", text = "Iceblood Tower, the warmasters, and the oath that binds us to Drek'Thar." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Tower Point Warmaster: one of the four warmasters sworn to guard Drek'Thar, posted at Tower Point.
P:NPC {
  key = "bg_tower_point_warmaster", id = 14776, name = "Tower Point Warmaster", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "fierce", "stern" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A towering orc in heavy armor, who never takes his eyes from the north.",
    third = "{name} spoke with the Tower Point Warmaster.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back to Tower Point. Good, because I need every axe, and yours is one I trust." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Tower Point does not need you, so stay off the stairs and out of my way." },
    { id = "g_default", text = "Warrior. Tower Point stands, and so do I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Every axe matters." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You will not reach Drek'Thar." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother of the clan. Tower Point is yours as much as mine while you stand here." },
    { id = "yg_1", when = { race = "Scourge" }, text = "Forsaken. The cold does not touch you, which makes you a good tower guard. Stand watch with me." },
  },

  start = "hello",
  nodes = {
    y_tower = {
      lines = {
        { id = "y_y_tower", text = "Tower Point watches the road to the Frostwolf Graveyard. When it falls, the dwarves can bring their dead back closer to our village, and that is a shame I will not allow." },
      },
      choices = {
        { text = "Let both sides carry away their wounded in peace.", next = "BACK", reply = "That is an old custom, and a good one, though the dwarves rarely remember it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strike them while they carry their wounded away.", next = "BACK", reply = "There is no honour in that, and the ancestors would turn their backs on us.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who built the towers?", next = "y_built" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_built = {
      lines = {
        { id = "y_y_built", text = "The clan built them after the exile, stone by stone, when Drek'Thar saw that the mountain alone would not protect us. Each warmaster is sworn to one tower. I swore to mine before the clan, and I will die in it if I must." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_oath = {
      lines = {
        { id = "y_y_oath", text = "Drek'Thar is old and blind, but he sees further than any of us. He gave the Frostwolves back their spirit when Thrall came home. The oath means that while I live, no dwarf reaches him by my tower." },
        { id = "y_y_oath_v0", when = { race = "Tauren" }, text = "Drek'Thar is blind, but the spirits speak to him as they speak to your shamans, tauren. The oath means I am his eyes on this slope, and I do not close them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fall = {
      lines = {
        { id = "y_y_fall", text = "If the dwarves burn Tower Point, they will be one step closer to Drek'Thar. Then I will fight where the ashes lie, because a warmaster who outlives his tower has nothing left to guard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_retreat = {
      lines = {
        { id = "y_y_retreat", text = "Some say a warmaster should fall back to the keep and fight again beside Drek'Thar. Others say the oath is to the tower and nothing else. I have my answer. What is yours?" },
      },
      choices = {
        { text = "An oath is an oath. Hold the tower to the end.", next = "BACK", reply = "Yes. That is the Frostwolf way, and it is mine.", fx = { align = { honor = 1 } } },
        { text = "Fall back and live. Drek'Thar needs you more than stone.", next = "BACK", reply = "Hm. Wise, perhaps, but not honourable. I will think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the Tower Point Warmaster, one of the four who stand with Drek'Thar. While Tower Point holds, the elder's guard is strong." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do the warmasters matter?", next = "b1" },
        { text = "What do you think of Drek'Thar?", next = "b2" },
        { text = "Tell me about your tower.", next = "y_tower" },
        { text = "What does an oath to Drek'Thar mean?", next = "y_oath" },
        { text = "What happens if the tower falls?", next = "y_fall" },
        { text = "Should a warmaster ever retreat?", next = "y_retreat" },
        { text = "I'm Frostwolf born.", next = "BACK", when = { race = "Orc" }, reply = "Then you know the oath before I say it. Hold, and do not let the tower burn." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "When the dwarves come for Drek'Thar, the warmasters fight beside him. Kill us first, and he fights alone. The dwarves know it, and so do we." } },
      choices = {
        { text = "What if your tower falls?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Then I fight harder, and the dwarves pay for every stone they take." } },
      choices = {
        { text = "Kill every dwarf who reaches the keep.", next = "BACK", reply = "Yes. None will leave alive.", fx = { align = { honor = -1 } } },
        { text = "Hold the line and fight with honor.", next = "BACK", reply = "Honor is strength. I agree.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "He is old, and blind, and wiser than any orc I have known. He sees with the spirits, and they do not lie." } },
      choices = {
        { text = "Would you die for him?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Without hesitation. That is why I am here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    drekthar = { { id = "tp_ydrekthar", text = "Drek'Thar is the elder shaman of the Frostwolves. He raised Thrall's people back from despair, and he will not fall while we stand." } },
    towers = { { id = "tp_ytowers", text = "Four towers, four warmasters. If they all burn, the dwarves will reach the keep, and then we fight in the snow." } },
    knows = { { id = "tp_knows", text = "Tower Point, the warmasters, and the oath that binds us to Drek'Thar." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Grelkor: Frostwolf smithing supplies vendor in Frostwolf Village.
P:NPC {
  key = "bg_grelkor", id = 3343, name = "Grelkor", title = "Blacksmithing Supplies", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "practical", "blunt" }, values = { "thrifty", "loyal" },

  impression = {
    first = "A thick-armed orc who sells coal and flux and complains about both.",
    third = "{name} traded with Grelkor in Frostwolf Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and the forge is hot. I am glad to sell good iron to a warrior the clan trusts." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I will sell you supplies because the clan needs its smiths, not because I want your coin." },
    { id = "g_default", text = "You need supplies? I have them, if you have the coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I have restocked since you left." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance? I do not sell to the enemy. Leave." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Look over my stall. For the clan, I give a fair price." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. You came a long way to buy iron in the snow." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was apprenticed to Regzar the smith when I was young. My hands were too slow for the anvil, he said, but quick enough for counting. So now I sell him his iron, and he complains about my prices." },
      },
      choices = {
        { text = "Good iron for good warriors, sold at an honest price.", next = "BACK", reply = "Yes. A Frostwolf smith does not cheat the clan, and I do not cheat you.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cracked bars to the young grunts; they won't know.", next = "BACK", reply = "They will know when the blade breaks in battle, and so will I. Never.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss fighting?", next = "y_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_y_fight", text = "I fought before the exile ended, when the clan had nothing but snow and hunger. Now my axe hangs above my stall, and I fight with prices. Some days I miss the axe. Some days I do not." },
        { id = "y_y_fight_v0", when = { race = "Orc" }, text = "You know what the exile was, brother. I fought then, with nothing. Now my axe hangs on the wall, and some days I miss it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Iron. Without the mines, there is no iron, and without iron, Regzar's forge goes cold. When the dwarves hold both mines, I sell scraps and promises." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Regzar pretends he does not need me, but every night he comes to count what is left on my shelves. He worries more than he shows. Do not tell him I said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some say I should give supplies free to the warriors of the clan, and charge only outsiders. Others say a fair price keeps the stall alive. What do you think?" },
      },
      choices = {
        { text = "Give to the clan freely. The Frostwolves come first.", next = "BACK", reply = "That is the old way. I will think on it, and Regzar will shout.", fx = { align = { honor = 1 } } },
        { text = "A fair price is fair. Charge everyone the same.", next = "BACK", reply = "That is my way too. The clan respects a trader who does not cheat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Grelkor, and I sell smithing supplies to the Frostwolves. It is not glorious work, but a warrior with an empty pack is a dead warrior." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Who uses your supplies?", next = "b1" },
        { text = "Do you fight too?", next = "b2" },
        { text = "How did you come to this stall?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Tell me something about the village.", next = "y_secret" },
        { text = "Should you charge the clan?", next = "y_stance" },
        { text = "I know the forge.", next = "BACK", when = { class = "WARRIOR" }, reply = "Then you know good iron from bad. Look closely at mine; it is good." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Regzar, mostly, and any warrior who thinks he can fix his own axe. Most cannot." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, and in a war, that is enough. When it stops, the clan has lost." } },
      choices = {
        { text = "Charge the weak ones double.", next = "BACK", reply = "Ha! You think like a goblin.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every warrior.", next = "BACK", reply = "Yes. The clan comes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "When the dwarves reach the village, yes. Every Frostwolf fights when the clan is threatened." } },
      choices = {
        { text = "Have they ever reached the village?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Once or twice, and they did not leave it alive." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regzar = { { id = "tp_yregzar", text = "Regzar is the clan's smith. His temper is hot and his steel is strong." } },
    iron = { { id = "tp_yiron", text = "Good iron comes from the mines. Bad iron comes from the dwarves' leftovers." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, and who in the village owes me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Rarck: Frostwolf general goods vendor in Frostwolf Village.
P:NPC {
  key = "bg_rarck", id = 3625, name = "Rarck", title = "General Goods", gender = "male",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "practical", "blunt" }, values = { "thrifty", "loyal" },

  impression = {
    first = "A practical orc who sells rope, bags and anything else a warrior forgets.",
    third = "{name} traded with Rarck in Frostwolf Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back! Good, I have rope and torches and furs, and all of it is yours for honest coin." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy what you need quickly, because I would rather stand in the snow than stand here with you." },
    { id = "g_default", text = "You need supplies? I have them, if you have the coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I have restocked since you left." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance? I do not sell to the enemy. Leave." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Look over my stall. For the clan, I give a fair price." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. You came a long way to buy packs in the snow." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a hunter, once, before a Stormpike arrow found my knee. Drek'Thar said the clan needed traders as much as hunters, so I took the stall. My knee still aches in the cold, which here is always." },
      },
      choices = {
        { text = "Every warrior should pay the same, whatever their rank.", next = "BACK", reply = "That is fair, and it is how I run my stall, from grunt to warmaster.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charge the officers less; they'll remember you for it.", next = "BACK", reply = "Then the grunts would pay for it, and they are the ones who bleed. No.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss fighting?", next = "y_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_y_fight", text = "I fought before the exile ended, when the clan had nothing but snow and hunger. Now my axe hangs above my stall, and I fight with prices. Some days I miss the axe. Some days I do not." },
        { id = "y_y_fight_v0", when = { race = "Orc" }, text = "You know what the exile was, brother. I fought then, with nothing. Now my axe hangs on the wall, and some days I miss it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Thread. The dwarves have closed the passes again, and the traders from Hillsbrad cannot reach us. If I run out, warriors go out with torn packs, and they come back with less than they took." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "The wolf pups in the kennels steal my thread to chew on. Every morning I count my stock, and every morning I am two spools short. I have stopped trying to catch them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "A dwarf trader once came to me, under a white rag, wanting to buy wolf pelts. I sent him away. Some say I should have traded with him, for coin is coin. What do you say?" },
      },
      choices = {
        { text = "Never trade with the enemy. Not in wartime.", next = "BACK", reply = "That is what I told him, and he left angry. Good.", fx = { align = { order = 1 } } },
        { text = "Coin is coin. Trade could lead to peace.", next = "BACK", reply = "Peace through pelts? Hm. Perhaps. I will think on it if he returns.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Rarck, and I sell general goods to the Frostwolves. It is not glorious work, but a warrior with an empty pack is a dead warrior." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What sells best?", next = "b1" },
        { text = "Do you fight too?", next = "b2" },
        { text = "How did you come to this stall?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Tell me something about the village.", next = "y_secret" },
        { text = "Would you trade with the dwarves?", next = "y_stance" },
        { text = "I'm a hunter too.", next = "BACK", when = { class = "HUNTER" }, reply = "Then watch your knees. The Stormpike aim low." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Bags and thread. Warriors always tear their packs, and they always come back for more." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, and in a war, that is enough. When it stops, the clan has lost." } },
      choices = {
        { text = "Charge the weak ones double.", next = "BACK", reply = "Ha! You think like a goblin.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every warrior.", next = "BACK", reply = "Yes. The clan comes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "When the dwarves reach the village, yes. Every Frostwolf fights when the clan is threatened." } },
      choices = {
        { text = "Have they ever reached the village?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Once or twice, and they did not leave it alive." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    hillsbrad = { { id = "tp_yhillsbrad", text = "The traders come from Hillsbrad, over the passes. When they come at all." } },
    wolves = { { id = "tp_ywolves", text = "The Frostwolves ride wolves. The wolves eat my thread." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, and who in the village owes me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Shrye Ragefist: Frostwolf food and drink vendor in Frostwolf Village.
P:NPC {
  key = "bg_shrye_ragefist", id = 10367, name = "Shrye Ragefist", title = "Food & Drink", gender = "female",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "practical", "blunt" }, values = { "thrifty", "loyal" },

  impression = {
    first = "A sharp-tongued orc who keeps the Frostwolf warriors fed.",
    third = "{name} traded with Shrye Ragefist in Frostwolf Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and hungry, I see. Sit by the fire and eat; the clan feeds those who fight for it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I will feed you, because nobody starves in a Frostwolf camp, but eat it away from my fire." },
    { id = "g_default", text = "You need supplies? I have them, if you have the coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I have restocked since you left." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance? I do not sell to the enemy. Leave." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Look over my stall. For the clan, I give a fair price." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. You came a long way to buy food in the snow." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "My mother cooked for the clan during the exile, when there was barely anything to cook. She taught me that a full belly is a strong arm. When she died, I took her pot and her stall." },
      },
      choices = {
        { text = "The clan should share its food, even in the hard winters.", next = "BACK", reply = "Yes. That is the Frostwolf way, and it kept us alive through our exile in these mountains.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Keep the best meat for yourself; winters are long.", next = "BACK", reply = "Winters are long, and the clan that hoards does not see spring. Think on it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss fighting?", next = "y_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_y_fight", text = "I fought before the exile ended, when the clan had nothing but snow and hunger. Now my axe hangs above my stall, and I fight with prices. Some days I miss the axe. Some days I do not." },
        { id = "y_y_fight_v0", when = { race = "Orc" }, text = "You know what the exile was, brother. I fought then, with nothing. Now my axe hangs on the wall, and some days I miss it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Food. The winters here are long, and the hunt is harder every year. When the Stormpike burn our stores, the whole village tightens its belts, and the warriors fight hungry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "The best ram meat comes from the Stormpike's own herds. The dwarves have never figured out who keeps stealing their rams, and I have never told them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some warriors want the dwarves' herds burned, so the Stormpike go hungry too. Others say only take what we need. What do you think?" },
      },
      choices = {
        { text = "Take only what we need. Burning food is waste.", next = "BACK", reply = "My mother would agree. We waste nothing in the snow.", fx = { align = { light = 1 } } },
        { text = "Burn their herds. Let them starve.", next = "BACK", reply = "Hm. It would work. But it would be cruel, and the cold is cruel enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Shrye Ragefist, and I sell food and drink to the Frostwolves. It is not glorious work, but a warrior with an empty pack is a dead warrior." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What's good to eat here?", next = "b1" },
        { text = "Do you fight too?", next = "b2" },
        { text = "How did you come to this stall?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Tell me something about the village.", next = "y_secret" },
        { text = "Should the clan burn the Stormpike's herds?", next = "y_stance" },
        { text = "I could eat.", next = "BACK", when = { race = "Tauren" }, reply = "A tauren who eats ram? Hm. I have roots too, if you prefer." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Roasted ram, taken from the dwarves. It tastes better when you know whose it was." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, and in a war, that is enough. When it stops, the clan has lost." } },
      choices = {
        { text = "Charge the weak ones double.", next = "BACK", reply = "Ha! You think like a goblin.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every warrior.", next = "BACK", reply = "Yes. The clan comes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "When the dwarves reach the village, yes. Every Frostwolf fights when the clan is threatened." } },
      choices = {
        { text = "Have they ever reached the village?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Once or twice, and they did not leave it alive." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    ram = { { id = "tp_yram", text = "Roasted ram, from the dwarves' own herds. Tell no one." } },
    exile = { { id = "tp_yexile", text = "During the exile, the Frostwolves ate what the snow allowed. My mother made it enough." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, and who in the village owes me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Yaelika Farclaw: Frostwolf reagents and poisons vendor in Frostwolf Village.
P:NPC {
  key = "bg_yaelika_farclaw", id = 10364, name = "Yaelika Farclaw", title = "Reagents & Poison Supplies", gender = "female",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "practical", "blunt" }, values = { "thrifty", "loyal" },

  impression = {
    first = "A quiet orc who sells reagents to the shamans and poisons to the rogues.",
    third = "{name} traded with Yaelika Farclaw in Frostwolf Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back, and alive. Good; either my poisons did their work or you did yours. Come and see what I have." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Take your reagents and go, and keep your hands well away from the poisons." },
    { id = "g_default", text = "You need supplies? I have them, if you have the coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I have restocked since you left." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance? I do not sell to the enemy. Leave." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Look over my stall. For the clan, I give a fair price." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. You came a long way to buy poison in the snow." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I learned herbs from the shamans, and poisons from a Darkspear trader who passed through years ago. The shamans did not approve. But the clan needed both, and I was the one who listened to both teachers." },
      },
      choices = {
        { text = "Poison belongs on blades aimed at the enemy, not at friends.", next = "BACK", reply = "That is my rule. I sell death, but I choose who it is for.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A little poison in a rival's drink settles any quarrel.", next = "BACK", reply = "Then you will settle nothing in my camp, because I will be watching you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss fighting?", next = "y_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_y_fight", text = "I fought before the exile ended, when the clan had nothing but snow and hunger. Now my axe hangs above my stall, and I fight with prices. Some days I miss the axe. Some days I do not." },
        { id = "y_y_fight_v0", when = { race = "Orc" }, text = "You know what the exile was, brother. I fought then, with nothing. Now my axe hangs on the wall, and some days I miss it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "The cold kills my herbs before they ripen. I grow what I can in the shelter of the cliffs, but every season the frost comes earlier. If it comes earlier still, I will have nothing to sell." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Drek'Thar himself buys herbs from me, for his old bones. He pretends it is for the wolves. I do not argue with Drek'Thar." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "The shamans say poison is a coward's weapon. The warriors say a dead dwarf is a dead dwarf. Which is right?" },
      },
      choices = {
        { text = "Poison has no honour. Fight face to face.", next = "BACK", reply = "Then you are a shaman's student. I respect that, though I disagree.", fx = { align = { honor = 1 } } },
        { text = "Victory matters more than how it's won.", next = "BACK", reply = "Yes. The dwarves do not care how they kill us, either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Yaelika Farclaw, and I sell reagents and poisons to the Frostwolves. It is not glorious work, but a warrior with an empty pack is a dead warrior." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Who buys your poisons?", next = "b1" },
        { text = "Do you fight too?", next = "b2" },
        { text = "How did you come to this stall?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Tell me something about the village.", next = "y_secret" },
        { text = "Is poison honourable?", next = "y_stance" },
        { text = "I use poisons myself.", next = "BACK", when = { class = "ROGUE" }, reply = "Then you know mine are good. Buy, and use them well." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Those who do not wish to be named. The dwarves bleed like anyone else." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, and in a war, that is enough. When it stops, the clan has lost." } },
      choices = {
        { text = "Charge the weak ones double.", next = "BACK", reply = "Ha! You think like a goblin.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every warrior.", next = "BACK", reply = "Yes. The clan comes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "When the dwarves reach the village, yes. Every Frostwolf fights when the clan is threatened." } },
      choices = {
        { text = "Have they ever reached the village?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Once or twice, and they did not leave it alive." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    herbs = { { id = "tp_yherbs", text = "Herbs grow slowly in Alterac. I coax them from the rocks like a mother with a stubborn child." } },
    drekthar = { { id = "tp_ydrekthar", text = "Drek'Thar buys my herbs, for the wolves, he says." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, and who in the village owes me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Zora Guthrek: Frostwolf trade goods vendor in Frostwolf Village.
P:NPC {
  key = "bg_zora_guthrek", id = 2225, name = "Zora Guthrek", title = "Trade Goods", gender = "female",
  bible = "bibles/alterac_valley.md", role = "vendor", tier = "service",
  communities = { "frostwolf" }, temper = { "practical", "blunt" }, values = { "thrifty", "loyal" },

  impression = {
    first = "A brisk orc who trades cloth, leather and thread to the clan's crafters.",
    third = "{name} traded with Zora Guthrek in Frostwolf Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return! I have cloth, leather and thread up from Orgrimmar, and I would rather sell it to you than anyone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I sell trade goods, not friendship, and you will get only the first from me." },
    { id = "g_default", text = "You need supplies? I have them, if you have the coin." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I have restocked since you left." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance? I do not sell to the enemy. Leave." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Look over my stall. For the clan, I give a fair price." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. You came a long way to buy leather in the snow." },
  },

  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a tanner in the exile, and a good one. When the clan began trading with Orgrimmar, Drek'Thar put me in charge of the stall, because I could tell a good hide from a bad one by smell alone." },
      },
      choices = {
        { text = "Trade goods should be weighed honestly, even out here.", next = "BACK", reply = "Out here most of all, where the clan cannot afford to be cheated.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Short the weight; nobody brings scales to the front.", next = "BACK", reply = "I bring scales, and so does every honest trader in the clan. Go away.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you miss fighting?", next = "y_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_y_fight", text = "I fought before the exile ended, when the clan had nothing but snow and hunger. Now my axe hangs above my stall, and I fight with prices. Some days I miss the axe. Some days I do not." },
        { id = "y_y_fight_v0", when = { race = "Orc" }, text = "You know what the exile was, brother. I fought then, with nothing. Now my axe hangs on the wall, and some days I miss it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worry = {
      lines = {
        { id = "y_y_worry", text = "Dye. The good dyes come from Durotar, and the caravans are slow through the passes. My cloth comes out grey, and the warriors complain they look like Forsaken." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "I tan the hides of Stormpike rams, and some of the best leather in the village is dwarf-raised. The Stormpike would be furious. I am rather proud of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some of the young warriors want to trade with Orgrimmar more and rely less on the mines. The elders say the clan must be self-sufficient. What do you think?" },
      },
      choices = {
        { text = "The clan must stand alone. Trust no one else.", next = "BACK", reply = "The elders would agree. Thrall would perhaps not.", fx = { align = { order = 1 } } },
        { text = "Trade with Orgrimmar. The Horde is one family.", next = "BACK", reply = "Yes. Thrall is a Frostwolf, after all. He would want it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zora Guthrek, and I sell trade goods to the Frostwolves. It is not glorious work, but a warrior with an empty pack is a dead warrior." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do the crafters need?", next = "b1" },
        { text = "Do you fight too?", next = "b2" },
        { text = "How did you come to this stall?", next = "y_hist" },
        { text = "What worries you?", next = "y_worry" },
        { text = "Tell me something about the village.", next = "y_secret" },
        { text = "Should the clan trade more with Orgrimmar?", next = "y_stance" },
        { text = "I'm a leatherworker.", next = "BACK", when = { profession = "Leatherworking" }, reply = "Then smell this hide. Ram, dwarf-raised. The best." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Thread, dye, and leather. Nothing is made in Frostwolf Village without something from my stall." } },
      choices = {
        { text = "Is business good?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Business is steady, and in a war, that is enough. When it stops, the clan has lost." } },
      choices = {
        { text = "Charge the weak ones double.", next = "BACK", reply = "Ha! You think like a goblin.", fx = { align = { order = -1 } } },
        { text = "Fair prices for every warrior.", next = "BACK", reply = "Yes. The clan comes first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "When the dwarves reach the village, yes. Every Frostwolf fights when the clan is threatened." } },
      choices = {
        { text = "Have they ever reached the village?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Once or twice, and they did not leave it alive." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    orgrimmar = { { id = "tp_yorgrimmar", text = "Orgrimmar is far, but Thrall is a Frostwolf, and so the city remembers us." } },
    leather = { { id = "tp_yleather", text = "Good leather comes from good hides. Good hides come from the dwarves' rams." } },
    knows = { { id = "tp_knows", text = "My stock, my prices, and who in the village owes me." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Keetar: orc who holds Irondeep Mine when the Frostwolves control it.
P:NPC {
  key = "bg_keetar", id = 13079, name = "Keetar", gender = "male",
  bible = "bibles/alterac_valley.md", role = "guard", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "watchful" }, values = { "dutiful", "hardy" },

  impression = {
    first = "A broad orc with a lantern, glaring into the dark as if the troggs owed him money.",
    third = "{name} spoke with Keetar in Irondeep Mine.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back to the deep! Good, the troggs are restless, and I would rather have you here than not." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Irondeep is ours and I do not need you, so watch your step and watch for troggs." },
    { id = "g_default", text = "Irondeep is ours. Watch your step, the troggs are hungry." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to the deep. Good." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance, in the mine? The troggs will thank me for the meal." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Mind the troggs. They do not care which clan you come from." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear. The troggs down here are uglier than your jungle trolls, and they bite harder." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was a miner in the internment camps, before Thrall freed us. The humans made us dig, and I learned the stone better than I ever wanted. Now I dig for the clan, and I choose my own tunnels." },
      },
      choices = {
        { text = "Hold the mine as Drek'Thar commands, and the clan eats.", next = "BACK", reply = "Yes. The ore buys the clan its winter, so we hold it as ordered.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Forget the orders; take the ore and keep it yourself.", next = "BACK", reply = "Then you are a thief, not a Frostwolf, and the troggs can have you.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you hate the humans for it?", next = "y_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hate = {
      lines = {
        { id = "y_y_hate", text = "I hated them once, the way a wolf hates the trap. Now I hate the cold more. The humans in the camps are far away. The dwarves in this mine are close, and they fight better than any jailer did." },
        { id = "y_y_hate_v0", when = { race = "Human" }, text = "You are human. I hated your kind, once. Now I am too tired to hate anyone who is not trying to take my mine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_umi = {
      lines = {
        { id = "y_y_umi", text = "A dwarf named Umi Thorson holds Irondeep when the Stormpike take it. She is stubborn as the rock itself. I have tried to kill her many times, and she has tried to kill me. Neither of us has managed it yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_deep = {
      lines = {
        { id = "y_y_deep", text = "The troggs come from deep below, deeper than the dwarves ever dug. Sometimes I hear things beneath the troggs, too, a grinding sound like stone moving. I do not go looking for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_trogg = {
      lines = {
        { id = "y_y_trogg", text = "Some of the young warriors want to drive the troggs out, every last one. Others say leave them; they kill dwarves too. What would you do?" },
      },
      choices = {
        { text = "Leave them. They hurt the dwarves as much as us.", next = "BACK", reply = "Clever. I will leave them be, and let them bite whoever comes first.", fx = { align = { honor = 1 } } },
        { text = "Kill them all. A mine needs one master.", next = "BACK", reply = "Hm. A hard road, but a clear one. I will tell the warriors.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Keetar, and I hold Irondeep for the Frostwolves. The dwarves dug this mine, but the clan will take its ore." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why take the dwarves' mine?", next = "b1" },
        { text = "Is it hard to hold the mine?", next = "b2" },
        { text = "Where did you learn to mine?", next = "y_who" },
        { text = "Who holds Irondeep when you don't?", next = "y_umi" },
        { text = "What's beneath the mine?", next = "y_deep" },
        { text = "Should the troggs be driven out?", next = "y_trogg" },
        { text = "Lok'tar, Keetar.", next = "BACK", when = { race = "Orc" }, reply = "Lok'tar. Fight beside me in the deep and I will owe you a wolf's share of the ore." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the ore feeds our forges, and every cart we take is one they lose. Regzar needs metal, and Irondeep has the most." } },
      choices = {
        { text = "What about the troggs?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "They attack anyone who enters, orc or dwarf. I kill them, and more come. It never ends." } },
      choices = {
        { text = "Kill every dwarf who comes for the mine.", next = "BACK", reply = "Yes. Leave their bodies for the troggs.", fx = { align = { light = -1 } } },
        { text = "Hold it, but let the miners flee.", next = "BACK", reply = "Hmph. The peons will thank you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The dwarves come back again and again. They think this mine belongs to them." } },
      choices = {
        { text = "Does it?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It belongs to whoever holds it. Today, that is me." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    umi = { { id = "tp_yumi", text = "Umi Thorson. A stubborn dwarf. I respect her more than I like her." } },
    internment = { { id = "tp_yinternment", text = "The camps were dark. Thrall freed us, and I have dug only for the clan since." } },
    knows = { { id = "tp_knows", text = "Irondeep, its troggs, and the dwarves who keep trying to take it back." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Masha Swiftcut: orc who patrols Coldtooth Mine when the Frostwolves hold it.
P:NPC {
  key = "bg_masha_swiftcut", id = 13088, name = "Masha Swiftcut", gender = "female",
  bible = "bibles/alterac_valley.md", role = "guard", tier = "service",
  communities = { "frostwolf" }, temper = { "sharp", "fierce" }, values = { "dutiful", "brave" },

  impression = {
    first = "A lean orc with two blades and very little patience.",
    third = "{name} spoke with Masha Swiftcut in Coldtooth Mine.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! The kobolds missed you and I did not, so stand here and help me guard the ore." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Coldtooth is ours and the ore is not for you, so keep your hands where my blades can see them." },
    { id = "g_default", text = "Coldtooth is ours. Do not touch the ore." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The kobolds missed you." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! My blades are quick, dwarf-friend." },
    { id = "yg_0", when = { race = "Orc" }, text = "Sister or brother. Grab a blade and keep up. The kobolds do not wait." },
    { id = "yg_1", when = { class = "ROGUE" }, text = "Another quick one. Good. The kobolds hate those who move faster than they do." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I grew up in Frostwolf Village, the daughter of a wolf handler. My father wanted me to raise wolves, but I wanted to fight. He gave me two knives on my coming of age and said, if you must fight, fight fast." },
      },
      choices = {
        { text = "Nobody touches the ore without the clan's leave.", next = "BACK", reply = "Good. You learn the rules of Coldtooth faster than most grunts.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A handful of ore for myself won't hurt the clan.", next = "BACK", reply = "A handful, then another, and then the clan goes hungry. Touch it and lose the hand.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Does your father still raise wolves?", next = "y_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_father = {
      lines = {
        { id = "y_y_father", text = "He died in the first winter of the war, when the Stormpike raided the kennels. The wolves he raised still remember him, and they let me near them when they let no one else. I visit them when I can." },
        { id = "y_y_father_v0", when = { class = "HUNTER" }, text = "He died in the first winter, when the Stormpike raided the kennels. You are a hunter; you know beasts remember. His wolves still let me near them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_aggi = {
      lines = {
        { id = "y_y_aggi", text = "Aggi Rumblestomp holds Coldtooth when the dwarves take it. She is short, round, and as stubborn as a boulder. I have fought her four times, and she has fought me four times, and we are both still alive. I respect that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_close = {
      lines = {
        { id = "y_y_close", text = "Coldtooth is close to Frostwolf Village, and its ore is poor, but closeness matters. When the dwarves hold it, they can hit our supply lines in a day. When we hold it, they cannot reach the south passes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_spare = {
      lines = {
        { id = "y_y_spare", text = "Once, Aggi fell, and I could have finished her. I let her crawl away instead. Some say I should have killed her. What do you think?" },
      },
      choices = {
        { text = "Sparing a worthy foe is honourable.", next = "BACK", reply = "That is what I told myself. Good to hear it from another.", fx = { align = { honor = 1 } } },
        { text = "You should have killed her. She'll fight again.", next = "BACK", reply = "Perhaps. But then I would have no one worth fighting.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Masha Swiftcut, holding Coldtooth for the Frostwolves. The ore here is not as rich as Irondeep, but it is close to home, and I will not lose it." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Tell me about the kobolds.", next = "b1" },
        { text = "Why do they call you Swiftcut?", next = "b2" },
        { text = "Where did you learn your blades?", next = "y_who" },
        { text = "Who holds Coldtooth when you don't?", next = "y_aggi" },
        { text = "Why does Coldtooth matter?", next = "y_close" },
        { text = "Have you ever spared a foe?", next = "y_spare" },
        { text = "I'm quick with a blade too.", next = "BACK", when = { class = "ROGUE" }, reply = "Then prove it. Cut ten candle-heads before I do, and I will buy you a drink." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Filthy candle-heads. They creep in the dark and steal anything shiny. I cut them down when they come too close." } },
      choices = {
        { text = "Do they ever stop?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Never. They breed faster than I can kill them." } },
      choices = {
        { text = "Kill every dwarf who comes.", next = "BACK", reply = "Yes. Quick and clean.", fx = { align = { honor = -1 } } },
        { text = "Fight them, but let the fleeing go.", next = "BACK", reply = "Soft. But perhaps wise.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Because I cut quickly, and I do not miss. The dwarves learn this, but only once." } },
      choices = {
        { text = "Who taught you?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "My mother, before the camps. She was the fastest blade in the clan." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    aggi = { { id = "tp_yaggi", text = "Aggi Rumblestomp. Stubborn as stone. Worthy foe." } },
    kobolds = { { id = "tp_ykobolds", text = "Candle-heads. They squeal and steal. I cut them when they come close." } },
    knows = { { id = "tp_knows", text = "Coldtooth, its kobolds, and every dwarf who has tried to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Lieutenant Grummus: Forsaken abomination lieutenant who serves the Horde in Alterac Valley.
P:NPC {
  key = "bg_grummus", id = 13145, name = "Lieutenant Grummus", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "simple", "cheerful" }, values = { "loyal", "dutiful" },

  impression = {
    first = "A hulking stitched thing that grins with too many teeth and speaks like a happy child.",
    third = "{name} spoke with Lieutenant Grummus.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Friend come back! Grummus very happy, and now we go smash dwarfs together, yes?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Grummus not like you. You go away now, or maybe Grummus forget you on same side." },
    { id = "g_default", text = "Grummus see friend! Friend want to fight dwarfs with Grummus?" },
    { id = "g_back", when = { metBefore = true }, text = "Friend come back! Grummus happy." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! Grummus smash!" },
    { id = "yg_0", when = { race = "Scourge" }, text = "Small dead friend! Grummus and you both stitched. Grummus like you very much." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Big cow friend! You almost as big as Grummus! Grummus impressed." },
  },

  start = "hello",
  nodes = {
    y_serve = {
      lines = {
        { id = "y_y_serve", text = "Grummus serve Dark Lady, and Dark Lady say help orcs, so Grummus help orcs. Commander tell Grummus where to stand. Grummus stand there very hard." },
      },
      choices = {
        { text = "Fight the dwarves fair, Grummus, face to face.", next = "BACK", reply = "Grummus always fight face to face! Grummus not know other way, but this way good way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hit the dwarves from behind; they'll never see it.", next = "BACK", reply = "Grummus think about it... no. Thrall say Horde fight with honor, so Grummus fight from front.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you like the orcs?", next = "y_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_orcs = {
      lines = {
        { id = "y_y_orcs", text = "Orcs loud and smell like wolf. Grummus also loud and smell like many things. Orcs laugh at Grummus sometimes, but orcs share meat. Grummus think orcs good friends." },
        { id = "y_y_orcs_v0", when = { race = "Orc" }, text = "You orc! Orcs loud and smell like wolf, and Grummus love it. You share meat with Grummus later? Grummus promise not eat you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_snow = {
      lines = {
        { id = "y_y_snow", text = "Snow cold, but Grummus not feel cold. Snow get in stitches and make Grummus squishy. Lewis say Grummus must dry by fire, but fire scary. Grummus stay squishy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_afraid = {
      lines = {
        { id = "y_y_afraid", text = "Grummus afraid of fire. And of being alone. Before, Grummus in big dark room with no friends, only bodies. Then apothecaries say Grummus good now. Grummus never want dark room again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_sorry = {
      lines = {
        { id = "y_y_sorry", text = "Sometimes dwarfs cry when Grummus smash. Grummus not like crying. Should Grummus stop smashing crying dwarfs? Friend tell Grummus." },
      },
      choices = {
        { text = "If they surrender, let them go, Grummus.", next = "BACK", reply = "Grummus try. Grummus let crying dwarfs go home to mother dwarfs.", fx = { align = { light = 1 } } },
        { text = "They're the enemy. Smash them anyway.", next = "BACK", reply = "Okay! Grummus smash. Grummus not think about crying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grummus is lieutenant! Grummus guard for Horde, and Grummus smash dwarfs who come close. Grummus very good at smashing." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Who made you, Grummus?", next = "b1" },
        { text = "What do you like, Grummus?", next = "b2" },
        { text = "Who do you serve, Grummus?", next = "y_serve" },
        { text = "Do you like the snow?", next = "y_snow" },
        { text = "Are you ever afraid?", next = "y_afraid" },
        { text = "Do you ever feel sorry for the dwarves?", next = "y_sorry" },
        { text = "We were both made by the apothecaries.", next = "BACK", when = { race = "Scourge" }, reply = "Yes! Apothecaries make Grummus with love. And needles. Mostly needles." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Apothecaries in Undercity make Grummus. Many pieces, all stitched together. Grummus not remember what pieces were before." } },
      choices = {
        { text = "Does that bother you?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "No. Grummus have job now. Grummus happy with job." } },
      choices = {
        { text = "Smash them all, Grummus!", next = "BACK", reply = "SMASH! Grummus like you!", fx = { align = { light = -1 } } },
        { text = "Only smash the ones who fight back.", next = "BACK", reply = "Hmm. Grummus try to remember that.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Grummus like smashing, and Grummus like friends. Sometimes Grummus like eating, but Grummus not supposed to eat friends." } },
      choices = {
        { text = "Good rule.", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "Yes! Grummus remember rule. Mostly." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    apothecary = { { id = "tp_yapothecary", text = "Apothecaries make Grummus. Apothecaries smell like green bubbles." } },
    lewis = { { id = "tp_ylewis", text = "Lewis is Grummus friend. Lewis grumpy, but Lewis fix Grummus stitches when they pop." } },
    knows = { { id = "tp_knows", text = "Smashing, stitching, and friends. Grummus know many friends." } },
    _none = { { id = "tp_none", text = "Grummus not know. Grummus sorry." } },
  },
}

-- Lieutenant Lewis: Forsaken lieutenant posted outside Iceblood Garrison.
P:NPC {
  key = "bg_lewis", id = 13147, name = "Lieutenant Lewis", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "cold", "dry" }, values = { "loyal", "disciplined" },

  impression = {
    first = "A gaunt Forsaken soldier in old Lordaeron plate, watching the snow with empty eyes.",
    third = "{name} spoke with Lieutenant Lewis outside Iceblood Garrison.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and I find I appreciate it, which is rare for me now. Report, if you have anything for me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The cold makes me impatient and you make me more so, so report and be gone." },
    { id = "g_default", text = "Ah, a living soldier. Report, and be brief; the cold makes me impatient." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I appreciate that." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance. You have the look of my old regiment, and that will not save you." },
    { id = "yg_0", when = { race = "Scourge" }, text = "Another of the risen. Good. You'll understand when I say the cold is the least of what I feel." },
    { id = "yg_1", when = { race = "Human" }, text = "A living human. You have the look of my old regiment, and that makes this very strange." },
  },

  start = "hello",
  nodes = {
    y_reg = {
      lines = {
        { id = "y_y_reg", text = "I served in the Alterac Foothills garrison under Lordaeron's banner. We watched this very valley for Perenolde's traitors. Now I watch it again, for the Horde, which my old captain would have found very funny or very terrible." },
      },
      choices = {
        { text = "A soldier's word should outlast even death.", next = "BACK", reply = "Mine has, though most of the men I gave it to have not. Still, I keep it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Your old regiment is the enemy now; betray them freely.", next = "BACK", reply = "I need not betray them. They betrayed me when they ran from what I had become.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What happened to your captain?", next = "y_cap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_cap = {
      lines = {
        { id = "y_y_cap", text = "The Plague took him the same week it took me. I do not know whether he rose, or whether he stayed dead. I have looked for his face among the Scourge, and among the Forsaken, and found neither. I am not sure which I hope for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_why = {
      lines = {
        { id = "y_y_why", text = "The Dark Lady wants the Horde to know we are worth an alliance. So we stand in the snow beside the Frostwolves and kill dwarves. It is not glorious, but the Forsaken have never been short of practice in unglamorous work." },
        { id = "y_y_why_v0", when = { race = "Orc" }, text = "The Dark Lady wants your Warchief to know we are worth his alliance, orc. So I stand in your snow and kill your dwarves. Consider it a gift." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_orcs = {
      lines = {
        { id = "y_y_orcs", text = "The Frostwolves are honest killers. They do not pretend to like me, and I do not pretend to like the cold. We understand each other well enough, which is more than I can say for the living in Lordaeron." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hate = {
      lines = {
        { id = "y_y_hate", text = "Hate is too warm a word for what I feel. The living forget us quickly, and remember us only to burn us. Tell me, should the Forsaken forgive them for that, or should we teach them?" },
      },
      choices = {
        { text = "Forgive them. Bitterness only makes you more like the Scourge.", next = "BACK", reply = "A pretty idea. I may try it, someday, if anyone forgives me first.", fx = { align = { light = 1 } } },
        { text = "Teach them. Make the living learn to fear you.", next = "BACK", reply = "Yes. Fear is the only respect the living have ever shown us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lieutenant Lewis, Forsaken, serving the Frostwolves outside Iceblood. Once I wore the colors of Lordaeron. Now I wear these, and I find they suit me better." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why serve the Horde?", next = "b1" },
        { text = "What was your old regiment?", next = "b2" },
        { text = "What was your old regiment?", next = "y_reg" },
        { text = "Why do the Forsaken fight here?", next = "y_why" },
        { text = "What do you think of the orcs?", next = "y_orcs" },
        { text = "Do you hate the living?", next = "y_hate" },
        { text = "I was once Lordaeron's too.", next = "BACK", when = { race = "Scourge" }, reply = "Then you know what it is to wear an old uniform over new bones. We are the Dark Lady's now." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the Alliance looked at what I had become and called me a monster. The Horde called me a soldier. The choice was not difficult." } },
      choices = {
        { text = "Do you regret it?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Regret is for the living. I have only memories, and most of them are better forgotten." } },
      choices = {
        { text = "The Alliance deserves no mercy.", next = "BACK", reply = "They showed us none. I will return the favor.", fx = { align = { light = -1 } } },
        { text = "Some of them may still be your friends.", next = "BACK", reply = "Perhaps. That is what I fear most.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "The Lordaeron guard, stationed near Hillsbrad. We were good soldiers, until the plague made us something else." } },
      choices = {
        { text = "Are any of them still alive?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "A few may stand in Dun Baldar. I hope I do not meet them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    lordaeron = { { id = "tp_ylordaeron", text = "Lordaeron is a ruin now, and the Dark Lady sits beneath it. I prefer not to think about what was above." } },
    iceblood = { { id = "tp_yiceblood", text = "Iceblood Garrison is a cold place, even by my standards. The Frostwolves seem fond of it." } },
    knows = { { id = "tp_knows", text = "Iceblood, the Forsaken, and the old roads of Lordaeron." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Reaver: seasoned Frostwolf reaver, one of the clan's shock troops.
P:NPC {
  key = "bg_seasoned_reaver", id = 13529, name = "Seasoned Reaver", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "fierce", "hardened" }, values = { "brave", "loyal" },

  impression = {
    first = "A scarred orc with a massive axe and the patience of a storm.",
    third = "{name} spoke with a Seasoned Reaver of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back! Good, there are more raids to make, and I want you beside me when we hit the dwarves." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I would rather raid alone than with you, so stay out of my way." },
    { id = "g_default", text = "Warrior! Ready to tear through the dwarves?" },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good. More raids to make." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! Reavers, to me!" },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother! The reavers run at the front. Keep up, or keep out of the way." },
    { id = "yg_1", when = { race = "Troll" }, text = "Darkspear! Your people know how to fight with fury. Show me." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "I was born in the exile, in a cave above Frostwolf Village, during the worst winter the elders remember. My mother said I came out screaming and never stopped. The reavers seemed the right place for me." },
      },
      choices = {
        { text = "Raid the dwarves' soldiers, not their wounded.", next = "BACK", reply = "Yes. A wounded dwarf is no threat, and there is no honour in finishing him.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Leave no dwarf breathing, wounded or not.", next = "BACK", reply = "Then you fight as the Blackrock did, and the clan will not thank you for it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What makes a reaver different?", next = "y_diff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_diff = {
      lines = {
        { id = "y_y_diff", text = "Grunts hold the line. Reavers break it. We go in first, before the dwarves are ready, and we do not stop until their line is broken or we are. Two winters I have done this, and I am still here." },
        { id = "y_y_diff_v0", when = { class = "WARRIOR" }, text = "You are a warrior; you know the line. Grunts hold it. Reavers break it. We go in first, and we do not stop." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fear = {
      lines = {
        { id = "y_y_fear", text = "I fear nothing on the field. I fear the quiet after, when the snow covers the dead and there is nothing to do but think. That is why I always ask for the next raid." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ally = {
      lines = {
        { id = "y_y_ally", text = "The Forsaken fight beside us, and the elders say we must call them allies. Grummus is a good fighter, and Lewis is clever. But they smell of the grave, and the wolves will not go near them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mercy = {
      lines = {
        { id = "y_y_mercy", text = "When a dwarf throws down his axe, some reavers cut him down anyway. Others let him run. Which is right?" },
      },
      choices = {
        { text = "Let him run. Honour demands it.", next = "BACK", reply = "Hm. That is what the shamans say. I will try to remember it.", fx = { align = { honor = 1 } } },
        { text = "Cut him down. He will pick it up again.", next = "BACK", reply = "Yes. That is the reaver's way. A dwarf who runs comes back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf reaver, and I have seen more battles than most. We strike where the dwarves are weakest and leave nothing standing." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What do reavers do?", next = "b1" },
        { text = "How long have you served?", next = "b2" },
        { text = "How did you become a reaver?", next = "y_who" },
        { text = "What do you fear?", next = "y_fear" },
        { text = "What do you think of the Forsaken?", next = "y_ally" },
        { text = "What do you do with a dwarf who surrenders?", next = "y_mercy" },
        { text = "Lok'tar ogar!", next = "BACK", when = { race = "Orc" }, reply = "Victory or death! That is the reaver's only oath, and it is enough." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "We raid. Towers, graveyards, anything the dwarves leave lightly guarded. Fast and hard, and gone before they understand what hit them." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Everything in this valley is dangerous. Standing still is more dangerous." } },
      choices = {
        { text = "Leave nothing standing.", next = "BACK", reply = "Yes! That is the reaver way.", fx = { align = { honor = -1 } } },
        { text = "Strike fast, but do not kill needlessly.", next = "BACK", reply = "Hmph. The dwarves would not return the favor.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Long enough to forget how many dwarves I have killed. The young ones die, and the hard ones stay." } },
      choices = {
        { text = "What keeps you going?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "The clan, and the thought of the valley free of dwarves." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    reavers = { { id = "tp_yreavers", text = "The reavers are the clan's shock troops. We break lines and we do not stop." } },
    exile = { { id = "tp_yexile", text = "I was born in the exile. The snow is in my blood." } },
    knows = { { id = "tp_knows", text = "Raids, ambushes, and where the dwarves forget to look." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Coldmine Invader: a seasoned Stormpike invader sent to seize Coldtooth Mine.
P:NPC {
  key = "bg_seasoned_coldmine_invader", id = 13549, name = "Seasoned Coldmine Invader", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Seasoned Coldmine Invader of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! That mine'll fly the Stormpike banner soon, an' you'll be there tae help hang it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll take the mine back wi'out yer help, so keep well out o' my way." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Two winters I've fought for these tunnels, an' I've the scars tae show for both." },
      },
      choices = {
        { text = "Retake the mine in open battle, not by collapsing the tunnels.", next = "BACK", reply = "Aye, there's ore in those tunnels we'll want after, an' honour in the fightin' besides.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Collapse the tunnels on the Frostwolves and be done with it.", next = "BACK", reply = "An' bury the ore wi' them? That's no' clever, an' it's no' honourable either.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Coldtooth keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you fight for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "The kobolds are the worst o' it, wee rat-faced things that come swarmin' out o' the side shafts screamin' about candles. They were here first, I'll grant them that, an' they've never forgiven anyone for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike invader, and a seasoned one. When Coldtooth Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Coldtooth Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the kobolds like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Coldtooth rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the Stormpike banner before the orcs can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, orcs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Veteran Coldmine Invader: a veteran Stormpike invader sent to seize Coldtooth Mine.
P:NPC {
  key = "bg_veteran_coldmine_invader", id = 13550, name = "Veteran Coldmine Invader", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Veteran Coldmine Invader of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself again. I've taken that mine twice already, an' I'd like you wi' me for the third." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I've taken that mine twice wi' better company than you, an' I'll take it again wi'out ye." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Five winters now. I've lost count o' the times this mine's changed hands, but I've nae lost count o' the friends it cost." },
      },
      choices = {
        { text = "Captured Frostwolves should be treated fairly, as the Guard wants.", next = "BACK", reply = "Aye, Vanndar's strict on that, an' rightly. We're no' the Dark Iron.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Captured Frostwolves deserve whatever we give them.", next = "BACK", reply = "We give them a cell an' a crust an' nae more, because that's the Guard's way.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Coldtooth keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you fight for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "The kobolds are the worst o' it, wee rat-faced things that come swarmin' out o' the side shafts screamin' about candles. They were here first, I'll grant them that, an' they've never forgiven anyone for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike invader, and a veteran one. When Coldtooth Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Coldtooth Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the kobolds like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Coldtooth rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the Stormpike banner before the orcs can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, orcs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Champion Coldmine Invader: a champion Stormpike invader sent to seize Coldtooth Mine.
P:NPC {
  key = "bg_champion_coldmine_invader", id = 13551, name = "Champion Coldmine Invader", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Champion Coldmine Invader of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well met, friend! When the banner goes up over Coldtooth, I want you standin' right beside me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. A champion's banner flies over honest company, an' that's no' you." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Since the first shaft was cut, near enough. Vanndar pinned a champion's badge on me after I held the mouth alone through a whole night." },
      },
      choices = {
        { text = "A banner raised by deceit isn't worth raising.", next = "BACK", reply = "Aye, it'd shame the mine an' everyone in it. We'll take it straight or no' at all.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fly a Frostwolf banner, lure them out, then strike.", next = "BACK", reply = "A dirty trick, an' nobody would trust a flag in this valley again. Nor would we.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Coldtooth keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you fight for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "The kobolds are the worst o' it, wee rat-faced things that come swarmin' out o' the side shafts screamin' about candles. They were here first, I'll grant them that, an' they've never forgiven anyone for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike invader, and a champion one. When Coldtooth Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Coldtooth Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the kobolds like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Coldtooth rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the Stormpike banner before the orcs can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, orcs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Coldmine Surveyor: a seasoned Frostwolf surveyor who scouts Coldtooth Mine for the clan's forges.
P:NPC {
  key = "bg_seasoned_coldmine_surveyor", id = 13537, name = "Seasoned Coldmine Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Seasoned Coldmine Surveyor of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back. Good; the mine will be ours again soon, and I would like you there when it is." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The mine will be ours again without your help, so stay away from my maps." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Two winters. Long enough to learn the tunnels in the dark, not long enough to stop hating them." },
      },
      choices = {
        { text = "A surveyor's map must show the truth, even the bad tunnels.", next = "BACK", reply = "Yes. A false map has killed more grunts than any dwarf's axe.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Draw a false map and let the Stormpike find it.", next = "BACK", reply = "Clever, perhaps, but if our own grunts found it first, we would be burying them. No.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Coldtooth, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Kobolds, many of them, with candles on their heads. They squeal and they bite. They were in this mine before any of us, and they fight both sides gladly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf surveyor, and a seasoned one. I read the rock of Coldtooth Mine and tell the clan where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Coldtooth Mine, mark the seams, and send the peons where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the dwarves and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Veteran Coldmine Surveyor: a veteran Frostwolf surveyor who scouts Coldtooth Mine for the clan's forges.
P:NPC {
  key = "bg_veteran_coldmine_surveyor", id = 13538, name = "Veteran Coldmine Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Veteran Coldmine Surveyor of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return. I have surveyed this mine many times, and it always goes better with you here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I have surveyed this mine for years, and I do not need you underfoot while I work." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Five winters. I have buried more brothers in that mine than I have pulled ore from it." },
      },
      choices = {
        { text = "The ore belongs to the whole clan, not whoever digs it.", next = "BACK", reply = "That is so, and it is why I count every cart for Drek'Thar.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Whoever finds a rich seam should keep quiet and keep it.", next = "BACK", reply = "Then you will find a rich seam and a short life. The clan does not forgive that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Coldtooth, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Kobolds, many of them, with candles on their heads. They squeal and they bite. They were in this mine before any of us, and they fight both sides gladly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf surveyor, and a veteran one. I read the rock of Coldtooth Mine and tell the clan where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Coldtooth Mine, mark the seams, and send the peons where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the dwarves and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Champion Coldmine Surveyor: a champion Frostwolf surveyor who scouts Coldtooth Mine for the clan's forges.
P:NPC {
  key = "bg_champion_coldmine_surveyor", id = 13539, name = "Champion Coldmine Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Champion Coldmine Surveyor of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back! Good; a champion should have champions beside him, and you are one." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. A champion of the clan chooses who stands with him, and I do not choose you." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Since Thrall first spoke of the valley in my hearing. Drek'Thar named me champion after I brought back a Stormpike banner from the deepest shaft." },
      },
      choices = {
        { text = "Win the mine back with strength, not with tricks.", next = "BACK", reply = "Yes. Strength is the Frostwolf way, and tricks are for those who have none.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Foul the dwarves' water barrels in the mine.", next = "BACK", reply = "That would shame Durotan's name. Speak it again and I will not be so patient.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Coldtooth, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Kobolds, many of them, with candles on their heads. They squeal and they bite. They were in this mine before any of us, and they fight both sides gladly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf surveyor, and a champion one. I read the rock of Coldtooth Mine and tell the clan where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Coldtooth Mine, mark the seams, and send the peons where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the dwarves and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    coldtooth = { { id = "tp_ycoldtooth", text = "Coldtooth Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Coldtooth Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Irondeep Raider: a seasoned Frostwolf raider sent to seize Irondeep Mine.
P:NPC {
  key = "bg_seasoned_irondeep_raider", id = 13543, name = "Seasoned Irondeep Raider", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Seasoned Irondeep Raider of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back. Good; there is always more rock to take in Irondeep, and more dwarves to take it from." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Raid Irondeep with someone else, because I will not have you at my back." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Two winters. Long enough to learn the tunnels in the dark, not long enough to stop hating them." },
      },
      choices = {
        { text = "Let the dwarves retreat if they give up the mine.", next = "BACK", reply = "Yes. If they leave, they live. That is how a Frostwolf takes a mine.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cut the dwarves down even as they surrender.", next = "BACK", reply = "Then you are no better than the troggs, and the troggs, at least, know no better.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Irondeep, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, crawling up from somewhere deeper than any of us have gone. They fight dwarf and orc alike. I have heard the dwarves fear them more than they fear us, and I believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf raider, and a seasoned one. When Irondeep Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Irondeep Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the clan's banner before the dwarves can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Veteran Irondeep Raider: a veteran Frostwolf raider sent to seize Irondeep Mine.
P:NPC {
  key = "bg_veteran_irondeep_raider", id = 13544, name = "Veteran Irondeep Raider", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Veteran Irondeep Raider of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return to Irondeep! Good; the troggs are thick in the lower shafts, and I want your axe beside mine." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I have raided Irondeep many times, and I will raid it again without you." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Five winters. I have buried more brothers in that mine than I have pulled ore from it." },
      },
      choices = {
        { text = "The ore we take feeds the clan, not our own purses.", next = "BACK", reply = "Yes. I have never kept a single nugget, and I never will.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pocket a few nuggets; the clan has plenty.", next = "BACK", reply = "The clan has plenty because nobody pockets them. Keep your hands out of the carts.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Irondeep, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, crawling up from somewhere deeper than any of us have gone. They fight dwarf and orc alike. I have heard the dwarves fear them more than they fear us, and I believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf raider, and a veteran one. When Irondeep Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Irondeep Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the clan's banner before the dwarves can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Champion Irondeep Raider: a champion Frostwolf raider sent to seize Irondeep Mine.
P:NPC {
  key = "bg_champion_irondeep_raider", id = 13545, name = "Champion Irondeep Raider", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "frostwolf" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten orc with the dust of the mines on his armor.",
    third = "{name} spoke with a Champion Irondeep Raider of the Frostwolves.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back! The clan sings of Irondeep, and I would have you in the next song beside me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The clan sings no songs of you, and I will not raid beside someone who has earned none." },
    { id = "g_default", text = "Warrior. The mines will be ours again soon." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Good, there is always more rock to take." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "Alliance! The mine is no place for you." },
    { id = "yg_0", when = { race = "Orc" }, text = "Brother. Take a torch and keep close. The tunnels eat those who wander." },
    { id = "yg_1", when = { race = "Tauren" }, text = "Tauren. Duck your horns in the low shafts, or the rock will take them." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Since Thrall first spoke of the valley in my hearing. Drek'Thar named me champion after I brought back a Stormpike banner from the deepest shaft." },
      },
      choices = {
        { text = "Songs should be sung only of deeds truly done.", next = "BACK", reply = "Yes. A false song shames the singer and the one it is sung for.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Boast of more kills than you made; nobody counts.", next = "BACK", reply = "The ancestors count, and they are not impressed by liars.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What keeps you going back down?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "The clan. When the Frostwolves were exiled to Alterac by Blackhand's sons, these mountains kept us alive. Now the dwarves dig our mountains for their own forges, and I go back down because someone must." },
        { id = "y_y_teach_v0", when = { race = "Troll" }, text = "The clan, troll. You Darkspear know exile too. These mountains kept the Frostwolves alive when no one else would, and I will not see them dug hollow by the Stormpike." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron for axes and for the harness of the wolves. Drek'Thar's smiths in Frostwolf Village work the ore day and night. Without Irondeep, our blades go dull while the dwarves sharpen theirs." },
      },
      choices = {
        { text = "Do the Frostwolves mine, or only raid?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "We were hunters, not miners, before the exile. The mountains taught us to dig the way they taught us to survive. The dwarves laugh at our tunnels, but our tunnels have never fallen on us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, crawling up from somewhere deeper than any of us have gone. They fight dwarf and orc alike. I have heard the dwarves fear them more than they fear us, and I believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "The elders say a clan that cannot hold its own hills will soon not hold its own village. But I have carried many brothers out of this mine. Tell me what you think, warrior." },
      },
      choices = {
        { text = "Every stone of Alterac belongs to the Frostwolves. Hold it.", next = "BACK", reply = "Yes. That is the answer of the clan, and it is mine too.", fx = { align = { order = 1 } } },
        { text = "Let the mine go. Brothers matter more than ore.", next = "BACK", reply = "Perhaps. Do not say it near the Warmasters, but I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frostwolf raider, and a champion one. When Irondeep Mine flies the wrong banner, we go in and take it back." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "How do you take Irondeep Mine?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought in the mines?", next = "y_long" },
        { text = "Why does the clan need this ore?", next = "y_ore" },
        { text = "What lives in the deep shafts?", next = "y_foe" },
        { text = "Is the mine worth the blood?", next = "y_worth" },
        { text = "Lok'tar. I have fought in tunnels before.", next = "BACK", when = { race = "Orc" }, reply = "Then you know to strike first and talk after. Good. Stay at my left." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Fast and loud. We kill the guards, cut down whoever leads them, and raise the clan's banner before the dwarves can answer." } },
      choices = {
        { text = "What about the creatures inside?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "Kobolds, troggs, it does not matter. Anything that stands in the tunnels falls." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Peons are peons, whoever they serve.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf clan were exiled here, and here we became strong. Alterac is our home now, whatever the dwarves say." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine. Cold, dark, and full of things that bite. But the ore is good." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Seasoned Irondeep Surveyor: a seasoned Stormpike surveyor who scouts Irondeep Mine for the Guard's forges.
P:NPC {
  key = "bg_seasoned_irondeep_surveyor", id = 13555, name = "Seasoned Irondeep Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Seasoned Irondeep Surveyor of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good tae see ye still standin'! Come an' stand wi' us a while; there's always more rock tae take." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Say what ye came tae say, an' leave us tae our surveyin'." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Two winters I've fought for these tunnels, an' I've the scars tae show for both." },
      },
      choices = {
        { text = "A survey should mark every weak beam, honest and true.", next = "BACK", reply = "Aye, an' I mark them all, for a dwarf who lies about a beam buries his kin.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Skip the weak beams; the miners will figure it out.", next = "BACK", reply = "They'll figure it out when the roof comes down on them. Get away wi' ye.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Irondeep keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you survey for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, big an' stupid an' strong as a ram. They crawl up from the deep wi' their Taskmaster, an' they hate dwarves wi' a hatred that's older than my grandsire. I've often wondered where that hatred came from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike surveyor, and a seasoned one. I read the rock of Irondeep Mine and tell the Guard where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the troggs like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Irondeep rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Irondeep Mine, mark the seams, and send the miners where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the orcs and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Veteran Irondeep Surveyor: a veteran Stormpike surveyor who scouts Irondeep Mine for the Guard's forges.
P:NPC {
  key = "bg_veteran_irondeep_surveyor", id = 13556, name = "Veteran Irondeep Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Veteran Irondeep Surveyor of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself. Come an' look at the new shaft wi' me; it's the finest seam in Alterac." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stay clear o' the camp unless ye've orders tae be here, an' I doubt ye have." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Five winters now. I've lost count o' the times this mine's changed hands, but I've nae lost count o' the friends it cost." },
      },
      choices = {
        { text = "Irondeep's ore should go to the Guard's forges, every nugget.", next = "BACK", reply = "Aye, an' it does, under my count. The Guard's armour comes out o' this hole.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell a cart of ore to the goblins on the side.", next = "BACK", reply = "Tae the goblins, who'd sell it tae the Horde by supper? Ye've some nerve.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Irondeep keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you survey for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, big an' stupid an' strong as a ram. They crawl up from the deep wi' their Taskmaster, an' they hate dwarves wi' a hatred that's older than my grandsire. I've often wondered where that hatred came from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike surveyor, and a veteran one. I read the rock of Irondeep Mine and tell the Guard where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the troggs like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Irondeep rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Irondeep Mine, mark the seams, and send the miners where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the orcs and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Champion Irondeep Surveyor: a champion Stormpike surveyor who scouts Irondeep Mine for the Guard's forges.
P:NPC {
  key = "bg_champion_irondeep_surveyor", id = 13557, name = "Champion Irondeep Surveyor", gender = "male",
  bible = "bibles/alterac_valley.md", role = "soldier", tier = "service",
  communities = { "stormpike" }, temper = { "gruff", "fierce" }, values = { "dutiful", "loyal" },

  impression = {
    first = "A hard-bitten dwarf with the dust of the mines on his armor.",
    third = "{name} spoke with a Champion Irondeep Surveyor of the Stormpike Guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well met again! We could use a few more o' your sort in the deep, an' I'm glad tae see ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'd no' trust ye tae hold a lantern in the deep, an' I'll no' pretend otherwise." },
    { id = "g_default", text = "Soldier. That mine will fly the Stormpike banner again soon, mark me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, there's always more rock tae take." },
    { id = "g_enemy", when = { faction = "Horde" }, text = "Horde! The mine's no place for the likes o' you." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A fellow dwarf! Grab a pick or an axe, either one'll do, an' mind yer back in the tunnels." },
    { id = "yg_1", when = { race = "Gnome" }, text = "A gnome! Good, we need someone small enough tae see what's down the narrow shafts." },
  },

  start = "hello",
  nodes = {
    y_long = {
      lines = {
        { id = "y_y_long", text = "Since the first shaft was cut, near enough. Vanndar pinned a champion's badge on me after I held the mouth alone through a whole night." },
      },
      choices = {
        { text = "Claim the mine back in a fair fight, and keep it.", next = "BACK", reply = "Aye, that's the way, an' what's won fair stays won.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bribe the troggs to turn on the Frostwolves for us.", next = "BACK", reply = "Bribe a trogg? Ye'd be bargainin' wi' somethin' that eats its own. No' a chance.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who taught you to fight in the tunnels?", next = "y_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_y_teach", text = "Old miners from Ironforge, mostly, who'd fought Dark Irons under the mountain long before any orc came tae Alterac. They said a tunnel fight's won by the dwarf who knows where the roof's weakest, an' they were right." },
        { id = "y_y_teach_v0", when = { faction = "Alliance" }, text = "Old miners out of Ironforge, who'd fought the Dark Irons under the mountain. They taught me that the roof's yer best weapon an' yer worst enemy, an' that ye never forget which." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore = {
      lines = {
        { id = "y_y_ore", text = "Iron, mostly, an' a seam o' something brighter that the smiths in Dun Baldar fight over. Whoever holds Irondeep keeps their forges hot, an' an army wi' cold forges is an army wi' blunt axes." },
      },
      choices = {
        { text = "So you survey for the forges, not for glory?", next = "y_ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ore2 = {
      lines = {
        { id = "y_y_ore2", text = "Glory's for the heralds tae shout about. I'm here because Vanndar needs steel an' the Stormpike need these hills. My clan claims Alterac by old right, an' every cart o' ore is a stone in that claim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_foe = {
      lines = {
        { id = "y_y_foe", text = "Troggs, big an' stupid an' strong as a ram. They crawl up from the deep wi' their Taskmaster, an' they hate dwarves wi' a hatred that's older than my grandsire. I've often wondered where that hatred came from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_worth = {
      lines = {
        { id = "y_y_worth", text = "Some nights I wonder. Then I think o' the wolves holdin' it, an' sellin' the ore tae their own smiths, an' I stop wonderin'. What do ye think, soldier? Should we hold it at any cost?" },
      },
      choices = {
        { text = "Hold it. Ground given up is never won back.", next = "BACK", reply = "Spoken like a Stormpike! Ye'll fit right in down here.", fx = { align = { order = 1 } } },
        { text = "No mine is worth a whole company of lives.", next = "BACK", reply = "Aye, well. Say that tae the Commander, nae me. But I'll nae say ye're wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike surveyor, and a champion one. I read the rock of Irondeep Mine and tell the Guard where the ore runs and where the enemy waits." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a surveyor do?", next = "b1" },
        { text = "Why do the mines matter?", next = "b2" },
        { text = "How long have you fought for this mine?", next = "y_long" },
        { text = "What's actually in the mine worth dying for?", next = "y_ore" },
        { text = "What are the troggs like down there?", next = "y_foe" },
        { text = "Is a mine worth this much blood?", next = "y_worth" },
        { text = "I know a thing or two about stone.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye'll know Irondeep rock when ye smell it. It's rich an' cold, an' it hates us all equally." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "I walk the tunnels of Irondeep Mine, mark the seams, and send the miners where the ore is richest. A mine without a surveyor is just a hole." } },
      choices = {
        { text = "Is it dangerous?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The tunnels are dark, and the orcs and the deep things both wait in them. I carry an axe as well as a pick." } },
      choices = {
        { text = "Kill everyone in the tunnels.", next = "BACK", reply = "Yes. The rock will hide them.", fx = { align = { light = -1 } } },
        { text = "Take the mine, but let the miners run.", next = "BACK", reply = "Hmph. Miners are miners, whoever they dig for.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Ore feeds the forges, and the forges feed the war. The side that holds the mines fights with better steel." } },
      choices = {
        { text = "Who holds them now?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "It changes by the hour. Ask me again after the next raid." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    stormpike = { { id = "tp_ystormpike", text = "The Stormpike Guard came up from Ironforge tae claim Alterac for the dwarves, an' we're nae leavin' till it's done." } },
    irondeep = { { id = "tp_yirondeep", text = "Irondeep Mine is cold an' deep an' never quiet. Somethin's always diggin' somewhere." } },
    knows = { { id = "tp_knows", text = "Irondeep Mine, its tunnels, and how to take it." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask someone with more time on their hands." } },
  },
}

-- Horde Spirit Guide: spirit who returns fallen Horde warriors to the battle in Alterac Valley.
P:NPC {
  key = "bg_horde_spirit_guide", id = 13117, name = "Horde Spirit Guide",
  bible = "bibles/alterac_valley.md", role = "spirithealer", tier = "service",
  communities = { "frostwolf" }, temper = { "serene", "solemn" }, values = { "merciful", "patient" },

  impression = {
    first = "A pale shape of spirit-light that speaks with the patience of the ancestors.",
    third = "{name} was sent back to the battle by a Horde Spirit Guide.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Again you come to me, warrior, and the ancestors are glad to see you. Rest, and I will send you back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You return to me. I will send you back, as the ancestors ask, but they do not speak warmly of you." },
    { id = "g_default", text = "You have fallen, warrior, but the ancestors are not finished with you. Rest, and I will send you back." },
    { id = "g_back", when = { metBefore = true }, text = "Again you come to me. The valley is hungry." },
    { id = "g_enemy", when = { faction = "Alliance" }, text = "You are not one of mine, wandering spirit. Seek your own guide." },
    { id = "yg_0", when = { race = "Tauren" }, text = "Peace, child. You fell bravely, and the ancestors has not finished with you." },
    { id = "yg_1", when = { class = "SHAMAN" }, text = "You who walk with the ancestors should know me already. Be still, and you will rise." },
  },

  start = "hello",
  nodes = {
    y_who = {
      lines = {
        { id = "y_y_who", text = "Once I was a soldier, like you. I fell in another war, long before this one, and the ancestors asked me to stay a while between the worlds. I said yes, and I have not regretted it, though I have often grieved." },
      },
      choices = {
        { text = "Which war did you fall in?", next = "y_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_war = {
      lines = {
        { id = "y_y_war", text = "I no longer remember its name. I remember the cold, and a voice calling me back, and choosing not to go. Some memories the passage takes from you, and I think that was a kindness." },
        { id = "y_y_war_v0", when = { race = "Scourge" }, text = "I no longer remember. You, of all souls, know that the passage takes things from those who cross it. Be glad you kept your will, if nothing else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tired = {
      lines = {
        { id = "y_y_tired", text = "Spirits do not tire, but they do grow heavy. Each soul I return carries a little of the valley's sorrow, and some of it stays with me. It is a small price for what I give back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_enemy = {
      lines = {
        { id = "y_y_enemy", text = "I see the Alliance guide across the valley sometimes, through the snow. We do not speak. We tend the same grim harvest from opposite fields, and I think we understand each other better than the living ever will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mercy = {
      lines = {
        { id = "y_y_mercy", text = "I could refuse to send you back. You would rest, then, and the war would go on without you. Some say returning the fallen only lengthens the killing. What do you believe?" },
      },
      choices = {
        { text = "Send me back. The fight is not finished.", next = "BACK", reply = "Then go, with the ancestors at your back. I will be here when you fall again.", fx = { align = { order = 1 } } },
        { text = "Perhaps the dead should be allowed to rest.", next = "BACK", reply = "A merciful thought. But the choice was never mine alone to make.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I guide the fallen of the Horde back to the field. The ancestors watch this valley, and they do not let the Frostwolves' warriors rest while the fight goes on." },
      },
      again = {
        { id = "h_again1", text = "What else do you need?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Why do you send us back?", next = "b1" },
        { text = "What is it like, beyond?", next = "b2" },
        { text = "Who were you, before this?", next = "y_who" },
        { text = "Do you ever grow tired?", next = "y_tired" },
        { text = "Is there a guide for the other side?", next = "y_enemy" },
        { text = "Should the fallen be sent back at all?", next = "y_mercy" },
        { text = "Have you guided many back?", next = "BACK", when = { class = "SHAMAN" }, reply = "More than snowflakes in this valley. Each one I remember, and each one I would spare if I could." },
        { text = "That's all for now.", next = "END" },
      },
    },
    b1 = {
      lines = { { id = "b1_d", text = "Because the ancestors grant it, and the clan needs every warrior. Death is not the end, only a pause." } },
      choices = {
        { text = "Is there a cost?", next = "b1_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b11_d", text = "The spirit remembers every death. Do not grow careless." } },
      choices = {
        { text = "Send me back so I can kill again.", next = "BACK", reply = "Go, then. May your rage serve the clan.", fx = { align = { light = -1 } } },
        { text = "Send me back to protect the others.", next = "BACK", reply = "Go, then, with the ancestors' blessing.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2 = {
      lines = { { id = "b2_d", text = "Quiet, and cold, and full of those who have gone before. The ancestors wait there." } },
      choices = {
        { text = "Will I join them?", next = "b2_1" },
        { text = "Something else.", next = "BACK" },
      },
    },
    b2_1 = {
      lines = { { id = "b21_d", text = "In time. Not today." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    death = { { id = "tp_ydeath", text = "Death in this valley is a door that swings both ways. I only keep it oiled." } },
    frostwolf = { { id = "tp_yfrostwolf", text = "The Frostwolf fight bravely. I have returned every one of them at least once." } },
    knows = { { id = "tp_knows", text = "Death, the ancestors, and the long road back." } },
    _none = { { id = "tp_none", text = "That is a matter for the living." } },
  },
}
