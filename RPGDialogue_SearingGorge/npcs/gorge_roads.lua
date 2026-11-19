-- The Searing Gorge off the road: Dorius Stonetender's last dig. Voice: bibles/gorge_roads.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dorius", id = TODO_NPC("Dorius Stonetender"), name = "Dorius Stonetender",
  bible = "bibles/gorge_roads.md", role = "scholar", tier = "quest",
  communities = { "thoriumpoint" }, temper = { "eager" }, values = { "curious", "loyal" },
  notices = { "race", "lock_shards" },

  impression = {
    first = "He won't leave his missing team behind.",
    third = "{name} met Dorius Stonetender, Curator Thorius's brother, digging for the Suntara Stones in the Searing Gorge.",
  },

  greetings = {
    { id = "g_gorge", text = "Keep yer voice down, friend! The Dark Irons have patrols on every ridge, an' I'd like tae keep my head, seein' as my hat only fits the one." },
  },

  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Ye've got soul shards in that pack, a fair heap by the chill comin' off it, an' the stones in my satchel have started tae hum along wi' them. I'll thank ye tae step back a pace before they decide they like the tune." },
  },

  start = "hello",
  nodes = {
    dw_thorius = {
      lines = {
        { id = "dw_thorius_default", text = "Aye, Thorius, who keeps the Hall o' Explorers tidier than his own beard. He reads about the Suntara Stones; I came tae dig for them. We've argued about which o' us is the real scholar since we were bairns, an' if I die out here, he wins." },
      },
      choices = {
        { text = "Scholarship belongs in the field, not a museum.", next = "BACK", reply = "Ha! I'll tell him ye said that, if I live. He'll write ye a letter four pages long.", fx = { align = { order = -1 } } },
        { text = "Your brother's the wiser one. He's still alive.", next = "BACK", reply = "Aye, well, that's a point, an' it's his favourite one. Ye'll get on wi' him, I can tell.", fx = { align = { order = 1 } } },
        { text = "Something else, Dorius.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they would, I'd have asked them on my knees by now. The Gorge is all Dark Iron fire an' slag, an' I'd wager the earth here has had its fill o' dwarves, so tread kindly." } },
      choices = {
        { text = "Then I'll ask the earth's pardon for what the Dark Irons did.", next = "BACK", reply = "That's a kindly thought, an' maybe the earth will hear it. Tread gently, an' come back tae me wi' news.", fx = { align = { light = 1 } } },
        { text = "The earth here answers strength. I'll make it tell me.", next = "BACK", reply = "Then ye'll find it fights back, like everythin' else in this Gorge. Go carefully.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fight like dwarves who've spent their lives workin' for a fire lord, which is tae say without fear an' without mercy. Their golems an' their slavers will come at ye together, so keep yer shield up an' yer back tae the rock." } },
      choices = {
        { text = "I'll stand beside you and face them squarely, Dorius.", next = "BACK", reply = "Aye, I'll be glad o' ye beside me, an' so would my team. Shield up, an' back tae the rock.", fx = { align = { honor = 1 } } },
        { text = "Better to slip past them than fight them in the open.", next = "BACK", reply = "Slip past, then, if ye can, an' I'll no' fault ye. Just find my team.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dwarf boots, heavy ones, an' the ruts o' a cart full o' diggin' tools, for that's what my team carried when they went on ahead. The basilisks an' the lava spiders trample over everythin', but a good hunter can tell a dwarf's print from a beast's, I'd hope." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dwarf boots, heavy ones, an' the ruts o' a cart full o' diggin' tools, for that's what my team carried when they went on ahead. The basilisks an' the lava spiders trample over everythin', but a good hunter can tell a dwarf's print from a beast's, I'd hope. Yer {pet} might sniff them out faster than either of us, for my lads didnae wash often, an' a dwarf who's been diggin' all day leaves a scent ye'll not forget." },
      },
      choices = {
        { text = "I'll find them, Dorius, alive if they can be found.", next = "BACK", reply = "Alive, aye, that's all I ask. Bless ye for sayin' it, for nobody else in this Gorge has.", fx = { align = { light = 1 } } },
        { text = "They're likely dead. I'll look, but don't hope too much.", next = "BACK", reply = "I know, I know, but I'll keep hopin' until ye tell me otherwise. Look anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Green hills an' honest mines, if the old Ironforge records are right, before Thaurissan called up Ragnaros an' set the whole mountain alight. That was more than two hundred years gone, an' the Gorge still hasnae cooled." } },
      choices = {
        { text = "It will heal one day, once the fire is out.", next = "BACK", reply = "I'd like tae think so, though no' in my lifetime. Maybe my bairns will see it.", fx = { align = { light = 1 } } },
        { text = "What Thaurissan burned, let his people choke on.", next = "BACK", reply = "They have, for two hundred years, an' the earth's no' forgiven anyone. I'd sooner see it healed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, if ye keep low an' stay tae the ridgeline above the Slag Pit. My team went ahead wi' plenty o' noise an' no' much sense, an' I'd sooner lose none o' the folk I've got left." } },
      choices = {
        { text = "Anything of your team's I find comes back to you.", next = "BACK", reply = "That's a fair-minded thing tae promise. Mind the ridgeline, an' the Slag Pit below it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever I find down there, Dorius, I keep.", next = "BACK", reply = "Then ye'll answer tae the League for it, friend, an' tae me. Bring back what's mine.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's the question that keeps me up at night, for they're no' diggin' for the joy of it. Their sorcerers bound fire tae their will once, an' look what came o' that, so I'd sooner the Stones sat in a League case in Ironforge than in their hands." } },
      choices = {
        { text = "Some old power should stay locked away.", next = "BACK", reply = "Aye, my thinkin' exactly, an' I'll see them under glass in Ironforge. Bless ye.", fx = { align = { order = 1 } } },
        { text = "Power belongs to whoever has the wit to use it.", next = "BACK", reply = "That's what Thaurissan thought, an' look what came o' it. Mind yer wit, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, Dorius.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for them alive, if ye please, for I've no' given up on them yet. The Dark Irons keep slaves in the Gorge, an' a slave can still be freed, where a dead dwarf cannae." } },
      choices = {
        { text = "Hope is a prayer too. I'll pray they're alive.", next = "BACK", reply = "Thank ye, an' I'll hold on tae it a bit longer. Bless ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope blinds you, Dorius. Prepare for the worst.", next = "BACK", reply = "Maybe it does, but I'd sooner be blind than give up on them. Pray if ye like, either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Behind them, under them an' all through them, by the League's reckonin'. Thaurissan called Ragnaros up out o' the deep two hundred years gone, an' the Dark Irons have served him in Blackrock ever since, so every slaver in this Gorge answers tae fire sooner or later." } },
      choices = {
        { text = "Some can still be saved. Thorium Point proves it.", next = "BACK", reply = "Aye, maybe, an' the Brotherhood's done more than I'd have believed. I'll keep my eyes open.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then they're lost. Strike them down wherever they stand.", next = "BACK", reply = "That's how most o' Ironforge sees it, an' after what they did tae my lads, I'll no' argue. Mind yerself on the ridges.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because nobody rightly knows what the Stones are, an' the Dark Irons want them badly enough tae kill my diggers over them. If there's power in them, I'd sooner it went tae Ironforge than intae anythin' wi' horns, an' I'll no' apologize for sayin' so." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because nobody rightly knows what the Stones are, an' the Dark Irons want them badly enough tae kill my diggers over them. An' now there's a demon standin' at my dig site starin' at the cases like it knows, so if there's power in them, it's goin' tae Ironforge an' no' tae that." },
      },
      choices = {
        { text = "Then the Stones go to Ironforge's scholars, and nowhere else.", next = "BACK", reply = "That's what I'd hoped tae hear. The League will thank ye for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they hold power, I'd study them myself, Dorius.", next = "BACK", reply = "Study them yerself, is it? I'll keep an eye on ye, then, an' on the Stones.", fx = { align = { order = -1 } } },
        { text = "Something else, Dorius.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ye've a reek o' brimstone, stranger. I'll take any help I can get findin' my team, though I'd ask ye keep whatever follows ye well clear o' the Suntara Stones, for I've enough trouble wi' fire in this place already." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, thank the Light! I've walked half the Gorge wi' no one tae speak a word over my lost team, an' I'd rest easier knowin' someone would, if it comes tae that." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in the Searing Gorge! The Dark Irons hereabouts serve the Firelord himself, an' I'd dearly like tae see one o' their sorcerers meet the Light up close." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage in the Gorge! If ye can tell me why the Dark Irons want the Suntara Stones so badly, ye'll have beaten the whole Hall of Explorers tae it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, an' a quiet one, I hope. The Dark Irons hereabouts sleep wi' one eye open, but they've never once thought tae look up at the ridge, an' that's where ye'll want tae be." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, in the Searing Gorge! I'm sorry tae say there's no' a tree within a day's walk that hasnae been burned tae charcoal, an' the ground's still warm besides." },
        { id = "h_default", key = true,
          text = "Dorius Stonetender, of the Explorers' League, an' I came here for the Suntara Stones. My team went ahead an' never came back, an' I'll no' leave the Gorge without them." },
        { id = "h_stones", when = { questActive = TODO_QUEST("Suntara Stones") },
          text = "Ye'll walk wi' me, then? Good, for I've a feelin' the Dark Irons have been waitin' for me as much as I've been lookin' for them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, thank the stones! The Dark Iron took my team somewhere along this road, an' I'd sleep sounder tonight wi' a shield beside me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll see tracks I'd miss, an' maybe ye'll find where my team went, for I've seen nothin' but spiders an' basilisks since I came down here." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf wi' a shaman's totems! I've been talkin' tae the stones o' this Gorge for weeks, an' it would be a fine thing tae meet someone they answer." },
        { id = "dd_darkiron", when = { killed = { name = "Dark Iron", min = 30 } },
          text = "Ye've been killin' Dark Irons all over this Gorge, I hear. It'll no' bring my team back, but I'll sleep a wee bit better knowin' the ones who took them are fewer." },
      },
      again = {
        { id = "h_again", text = "What else? We cannae linger here long." },
        { id = "h_again2", text = "Quickly, friend, ask an' then keep yer eyes on the ridge." },
      },
      choices = {
        { text = "What did this place look like before, Dorius?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Suntara Stones sound like something out of an old story.", next = "stones" },
        { text = "What happened to your team?", next = "team" },
        { text = "I'd wager anyone at home has no idea you're out here.", next = "thorius" },
        { text = "I'm a dwarf of Ironforge. I'll stand with you.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Could I scout the Dark Iron camps ahead of you, Dorius?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would the Dark Irons want the Suntara Stones?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should I pray for your missing team, Dorius?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does every Dark Iron in this Gorge answer to the Firelord?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do these Dark Iron fight, compared to your lot?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What sort of tracks should I be looking for?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's your quarrel with what follows me, Dorius?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the stones here tell me where your team went?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The stone speaks to me, Dorius. It's restless here.", next = "xorig_stone", when = { origin = "dwarf_stone_listener" } },
        { text = "Your brother is Curator Thorius in Ironforge? What's he like?", next = "dw_thorius" },
        { text = "Be careful, Dorius.", next = "END" },
      },
    },
    xorig_stone = {
      lines = {
        { id = "xst_default", text = "Speaks tae ye? Och, my brother would have ye in a glass case in the Hall o' Explorers by supper. I'll no' laugh, though, for my grandmother swore the stone sang in her sleep, an' this Gorge has been burnin' since before any dwarf can remember. What does it say?" },
      },
      choices = {
        { text = "It's angry. Something under the mountain keeps it burning.", next = "xorig_stone2", fx = { trait = { curious = 1 } } },
        { text = "It's grieving, I think. For whatever was lost here.", next = "xorig_stone2", fx = { trait = { kind = 1 } } },
        { text = "I'd rather not try to put it into words.", next = "BACK" },
      },
    },
    xorig_stone2 = {
      lines = {
        { id = "xst2_default", text = "Aye, that sounds like this place, right enough. If it ever tells ye where my team went, ye'll tell me first, before the League, before anyone, an' I'll believe ye, whatever the priests say about such things." },
      },
      choices = {
        { text = "I'll listen for them, Dorius.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = { { id = "s_default", text = "Old stones o' power from the legends, an' the scholars call them a fairy tale. I say legends are just finds nobody's dug up yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    team = {
      lines = { { id = "t_default", text = "They went deeper intae the Gorge after a lead, an' the Dark Irons took them. I hear they're bein' worked like slaves, an' it's eatin' me alive." } },
      choices = {
        { text = "Why not wait for help from Ironforge?", next = "team_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    team_wait = {
      lines = { { id = "tw_default", text = "Because help from Ironforge takes months, an' my lads havenae got months. If I'm a fool for goin', then I'm a fool." } },
      choices = {
        { text = "A leader goes after his people. You're right.", next = "team_end", fx = { align = { honor = 1 } } },
        { text = "Dead leaders save no one. Wait for an army.", next = "team_end", fx = { align = { honor = -1 } } },
        { text = "What if it's a trap?", next = "team_end" },
      },
    },
    team_end = {
      lines = { { id = "te_default", text = "Then it's a trap, an' I'll walk intae it wi' my eyes open. If anythin' happens, tell my brother I was thinkin' o' him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },
    thorius = {
      lines = { { id = "th_default", text = "My brother Thorius knows I'm diggin', but no' how deep. He keeps the museum in Ironforge, an' he worries more than a curator ought, mostly about whether I've dusted the finds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Then I'm glad o' ye, kinsman, more than I can say. We'll bring my lads home, or we'll try." } },
      choices = { { text = "We'll bring them home.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons have patrols on every ridge, an' they'd as soon put an axe in ye as look at ye. My team's somewhere in their hands, an' I'll no' leave them." } },
    magni = { { id = "tp_magni", text = "King Magni sent the League out to find the Suntara Stones, an' I mean to bring him back somethin' worth the cost. I just wish the cost weren't so high." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Under the mountain the Dark Irons have a whole city, an' a fire lord to rule it. Nae dwarf o' Ironforge has seen it an' come back the same." } },
    thaurissan = { { id = "tp_thaurissan", text = "The Dark Irons' old capital is a ruin now, burned by their own summonin'. Thaurissan called up somethin' he couldnae put back, an' the whole land paid." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. Ask me about stones, or the Dark Irons." } },
  },
}
