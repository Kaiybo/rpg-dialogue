-- The Wetlands beyond Menethil: Dun Modr and Whelgar's Excavation. Voice: bibles/wetlands_roads.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longbraid", id = TODO_NPC("Longbraid the Grim"), name = "Longbraid the Grim",
  bible = "bibles/wetlands_roads.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "gruff" }, values = { "loyal", "brave" },
  notices = { "race" },

  impression = {
    first = "Longbraid the Grim holds what's left of Dun Modr against the Dark Irons, and he has earned his name.",
    third = "{name} met Longbraid the Grim, who leads the dwarves clinging to the edge of Dun Modr.",
  },

  greetings = {
    { id = "g_modr", text = "Keep yer head down, stranger. The Dark Irons have archers on the walls, and they're better shots than they look." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathin'? Good. In Dun Modr that's a compliment." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By standing where I put you and not moving, for the Dark Irons come up out of the old ruins in waves and they test every gap we leave. We lost the Span because one line broke, and I'll not lose this hill the same way." } },
      choices = {
        { text = "Put me where the line is thinnest. I'll stay.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the fight to them in the ruins.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Watch the ruins from the high ground and tell me when the Dark Irons move, for they gather before every push and my sentries never see it. And keep the raptors off the road behind us, for if we have to fall back, I'd rather not fall back into their jaws." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} could sit on the ridge and smell them coming, and I'd sleep better for it, if I slept at all." },
      },
      choices = {
        { text = "I'll watch and warn you, and hold my fire.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll pick off their scouts before they can gather.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Inside? Ye'd be the first since they took it who came out again, an' I'd want tae hear every word. They've Dark Iron sentries on the walls an' more in the cellars, so if ye go, go by night an' go alone." },
      },
      choices = {
        { text = "I'll bring you back their plans, nothing more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "And their captain's throat, if I can reach it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How did Dun Modr fall?", next = "fall" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Maybe no', but it burned through mine, an' they were good dwarves standin' behind them. If ye've ice enough tae cool a Dark Iron's temper, take it tae the Span an' show them what ye've got." },
      },
      choices = {
        { text = "I'll stand at the Span with you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way, where they least expect.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What happened to the Span?", next = "span" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That it was ours once, an' the Dragonmaw have it now, wi' a red dragon chained in the deep. Even the beasts won't go near that mountain." } },
      choices = {
        { text = "The red dragon must be freed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Leave that mountain and its dragons alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whoever's least hurt, which some days is me, an' I've no gift for it. We send the worst back tae Menethil, but the road's long an' the Dark Irons watch it." } },
      choices = {
        { text = "Then I'll stay a while and tend them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Send them all back. Your fighters need to fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stand on the bridge wi' us when the Dark Irons come, an' let the lads see someone who isnae afraid. Fear's been our worst enemy since the Span fell, an' fear doesnae die tae an axe." } },
      choices = {
        { text = "I'll stand on that bridge with you, Longbraid.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Holding a lost bridge is folly. Fall back to Menethil.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, out here? I've wounded enough tae keep ye busy, an' dead enough tae keep ye prayin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The Light's a long way from Dun Modr these days, so ye're welcome tae bring some o' it with ye." },
        { id = "h_default", key = true,
          text = "Longbraid, they call me, and they add 'the Grim' because I've had little to smile about since the Dark Irons came. They broke the Thandol Span and took Dun Modr, and we hold on by our fingernails." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's a face I'm glad to see, and there's no' many of those left round here. Come in out of the wet." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here! I've no quarrel wi' yer kind, only wi' the Dark Irons an' the dragons over Grim Batol." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, for Dun Modr needs every arm it can get, and it's had precious few." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have come up past the raptors, then, which tells me you know your trade." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the walls have ears." },
        { id = "h_again2", text = "Speak yer piece, then, and dinnae waste my breath or yers." },
      },
      choices = {
        { text = "What do you know of Grim Batol?", next = "druid_q", when = { class = "DRUID" } },
        { text = "How did the Dark Irons take Dun Modr?", next = "fall" },
        { text = "What about the Thandol Span?", next = "span" },
        { text = "Why do they call you Grim?", next = "grim" },
        { text = "I'm a dwarf of Ironforge. Tell me how to help.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I could get inside Dun Modr and learn what they're planning.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Dark Iron fire won't burn through a mage's ward.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How can a warrior help hold Dun Modr, Longbraid?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What could a hunter do for Dun Modr?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who tends your wounded out here, Longbraid?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you ask of a paladin, Longbraid?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Hold fast, Longbraid.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "They came out of the south in force, with powder and steel, and we were too few. Harlo Barnaby took an axe in the back covering the retreat, and he's lucky he lived." } },
      choices = {
        { text = "Why weren't you reinforced?", next = "fall_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_why = {
      lines = { { id = "fw_default", text = "Ironforge has a dozen fires to put out, and ours wasnae the biggest until it was too late. I'll no' curse the King for it, but I'll no' pretend it didnae hurt." } },
      choices = {
        { text = "The King should have come. Loyalty runs both ways.", next = "fall_end", fx = { align = { honor = -1 } } },
        { text = "You've held your post anyway. That's what matters.", next = "fall_end", fx = { align = { honor = 1 } } },
        { text = "What happens now?", next = "fall_end" },
      },
    },
    fall_end = {
      lines = { { id = "fe_default", text = "Now we take it back, a stone at a time if need be. Every Dark Iron ye put down out there is one less on my walls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },
    span = {
      lines = { { id = "s_default", text = "The great bridge into Arathi, or it was until the Dark Irons blew half of it into the gorge. Motley Garmason can tell ye more, for he's taken it to heart." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    grim = {
      lines = { { id = "g_default", text = "Because I lost good dwarves on these walls, and I remember each one by name. I'll smile again when Dun Modr's ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Then ye already know, kinsman: go out there and fight. And when ye get back to Ironforge, tell them Longbraid still holds." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know Dark Irons and walls, and naught else these days." } },
  },
}

P:NPC {
  key = "motley_garmason", id = TODO_NPC("Motley Garmason"), name = "Motley Garmason",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "sharp" }, values = { "loyal" },
  notices = { "class" },

  impression = {
    first = "Motley Garmason camps near the Thandol Span and can't stop thinking about the Dark Irons who broke it.",
    third = "{name} met Motley Garmason, a dwarf of Dun Modr bent on avenging the Thandol Span.",
  },

  greetings = {
    { id = "g_span", text = "Ye've come up the road from Menethil? Then ye've seen what's left of the bridge, and ye know why I'm angry." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A bridge, for a start, an' the dwarves who were on it when it fell, an' I'll no' rest till they've paid it back. Go down tae the Span an' ye'll find them crawlin' over the rubble like they own it." } },
      choices = {
        { text = "I'll fight them for the living, not for vengeance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll collect your debt in full, Motley.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "North across the broken Span tae Arathi, or back intae the hills toward Grim Batol, an' I cannae tell which. Find out for me, an' I'll know where tae send the next lot o' axes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} would follow a Dark Iron's stink through any bog, I'd wager, for they smell o' brimstone an' they never wash." },
      },
      choices = {
        { text = "I'll track them and bring you the truth of it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll track them and ambush them on their own trail.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's all I've got left that's worth wantin', since the Span took my cousin an' half the road with it. When it's done, maybe I'll want somethin' else, an' maybe then I'll come an' talk tae ye." } },
      choices = {
        { text = "Vengeance won't bring him back. Grieve first, Motley.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then make them pay, Motley. They earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My axe, if it's up tae me, but I'll grant ye a court would hang them just as dead an' wi' more folk watchin'. Either way they answer, an' that's all I ask." } },
      choices = {
        { text = "A court, then. Justice should be seen.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your axe. It's quicker and surer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If ye're here tae talk me out o' vengeance, save yer breath, for I've heard it all from my mother." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll understand, then, that some things need answerin' for, an' the Span's one of them." },
        { id = "h_default", key = true,
          text = "Motley Garmason, and I mean to see the Dark Irons pay for the Thandol Span. They blew it to cut us off from Arathi, and they're no' finished yet." },
        { id = "h_span", when = { questActive = TODO_QUEST("The Thandol Span") },
          text = "Go and see the Span for yerself, and find out what the Dark Irons left behind. They're bold enough to leave clues." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Good, for I've a list o' Dark Irons who owe me for the Span, an' I need someone tae collect." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? The Dark Irons at the Span leave tracks like anyone else, an' I'd like tae know where they lead." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've a vengeance to plan." },
        { id = "h_again2", text = "Speak yer mind, friend." },
      },
      choices = {
        { text = "Why did they blow up the Span?", next = "why" },
        { text = "Do you have family here?", next = "family" },
        { text = "How does it look from Arathi's side?", next = "arathi" },
        { text = "I know demolitions. Who set the charges?", next = "rogue", when = { class = "ROGUE" } },
        { text = "What do the Dark Irons owe you, Motley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where do you think the Dark Irons' tracks lead?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is vengeance all you want from the Dark Irons, Motley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Dark Irons answer to a court, or your axe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good luck, Motley.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "To split Khaz Modan from the human lands, so Ironforge stands alone. Clever, and cruel, and just like them." } },
      choices = {
        { text = "What will you do about it?", next = "why_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_do = {
      lines = { { id = "wd_default", text = "Find the ones who did it and send them back to Thaurissan in pieces. Or at least in chains, if Longbraid's watching." } },
      choices = {
        { text = "In chains. They should face the King's justice.", next = "why_end", fx = { align = { order = 1 } } },
        { text = "In pieces. They earned it.", next = "why_end", fx = { align = { order = -1 } } },
        { text = "You've thought about this a lot.", next = "why_end" },
      },
    },
    why_end = {
      lines = { { id = "we_default", text = "Every night since the bridge fell, aye. Help me and ye'll see it done right." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    family = {
      lines = { { id = "f_default", text = "My kin are scattered between here and Ironforge, those that are left. I don't speak of the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arathi = {
      lines = { { id = "a_default", text = "Orcs and trolls to the north, and Stromgarde's ruins beyond. Without the Span, we'd as well be on the moon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Dark Iron sappers, by the scorch marks, and good ones. If ye can read their work, ye'll be more use to me than ten soldiers." } },
      choices = { { text = "I'll take a look.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, and I've no time to find out. Ask Longbraid." } },
  },
}

P:NPC {
  key = "ormer_ironbraid", id = TODO_NPC("Ormer Ironbraid"), name = "Ormer Ironbraid",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "proud" }, values = { "brave" },
  notices = { "class" },

  impression = {
    first = "Ormer Ironbraid guards Whelgar's Excavation from the raptors, and he holds a grudge against every one of them.",
    third = "{name} met Ormer Ironbraid at Whelgar's Excavation, a dwarf with a score to settle against the local raptors.",
  },

  greetings = {
    { id = "g_dig", text = "Watch the long grass, friend. If it moves and ye didnae move it, run." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In threes an' fours, circlin' till one o' them finds a gap, an' then the rest pile in after it. Stand yer ground an' keep yer shield up, an' they'll lose interest before ye do, which is more than I can say for my diggers." } },
      choices = {
        { text = "I'll hold the gap so none get through.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll charge the pack before they finish circling.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Cleverer than a raptor's no' hard, friend, but quieter is, for they hear a twig snap from the far side o' the marsh. Get close tae the big ones an' ye'll find they've a soft spot under the jaw, if ye're quick." },
      },
      choices = {
        { text = "I'll take them clean and quick.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bleed them out from the brush.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why are the raptors so bold?", next = "raptors" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ye'd think so, but these lot only get angrier, an' an angry raptor's worse than a hungry one. Freeze them where they stand an' I'll do the rest wi' my axe." },
      },
      choices = {
        { text = "Together, then. Your axe, my frost.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll handle them myself, Ormer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's the dig for?", next = "dig" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Shallow graves under the ridge an' a stone each, for that's all we had time for wi' the raptors circlin'. I'd thank ye for a word over them, if ye've one tae spare." } },
      choices = {
        { text = "I'll go to the ridge and say the words.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living diggers need guarding more than the dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ormer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In front o' the diggers wi' yer back tae the trench, for the raptors go for whatever runs. Stand firm an' they'll circle, but run an' they'll have ye down." } },
      choices = {
        { text = "Then I'll stand in front and hold, Ormer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt them in the grass before they reach the dig.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ormer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! We've lost diggers tae the raptors an' buried them where they fell, an' none o' them had proper words." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I could use a shield when the raptors come at the dig, an' a holy one would do nicely." },
        { id = "h_default", key = true,
          text = "Ormer Ironbraid, and I keep the raptors off Whelgar's dig. They've taken diggers, mules and more lunches than I care to count." },
        { id = "h_revenge", when = { questActive = TODO_QUEST("Ormer's Revenge") },
          text = "The raptors round the dig need thinnin', and I want the big ones gone most of all. Do it for me, and do it for the lads they took." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Grand; the raptors come at the dig in packs, an' I could use someone who'll stand firm while they circle." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep yer eyes on the grass while ye ask." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Why do you hate the raptors so?", next = "raptors" },
        { text = "What's Whelgar digging for?", next = "dig" },
        { text = "How do you fight them?", next = "fight" },
        { text = "Raptors are fine prey. I'll hunt them.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Raptors hunt by smell. I'll have to be cleverer than usual.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Fire, then. Raptors fear fire, surely?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How do the raptors attack the dig, Ormer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Were the lost diggers given a proper burial, Ormer?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where should I stand when the raptors come, Ormer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good hunting, Ormer.", next = "END" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They took a friend of mine off the dig in broad daylight, while he was eatin' his bread. He never even screamed, and I'll hear that silence till I die." } },
      choices = {
        { text = "Is revenge worth it?", next = "raptors_rev" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors_rev = {
      lines = { { id = "rv_default", text = "Worth it? I dinnae know, but it's what I've got. Some say I should let it lie, and they werenae there." } },
      choices = {
        { text = "Vengeance won't bring him back. Guard the living instead.", next = "raptors_end", fx = { align = { light = 1 } } },
        { text = "He'd want the beasts dead. Make them pay.", next = "raptors_end", fx = { align = { light = -1 } } },
        { text = "What was his name?", next = "raptors_end" },
      },
    },
    raptors_end = {
      lines = { { id = "re_default", text = "Ye can ask, but I keep it to myself, for it's mine to carry. Help me with the raptors and that'll be enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dig = {
      lines = { { id = "d_default", text = "Old things in the earth, for the Explorers' League, and Whelgar won't say much more. Ask him yerself; he's near the caves." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    fight = {
      lines = { { id = "f_default", text = "Back to a wall and a shield up, for they come in pairs. Kill the first one fast, or the second one kills you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then ye're welcome here, hunter, more than most. Bring me the claws of the biggest and I'll drink to yer name." } },
      choices = { { text = "Consider it done.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldnae tell ye. All I think about these days is raptors." } },
  },
}

P:NPC {
  key = "whelgar", id = TODO_NPC("Prospector Whelgar"), name = "Prospector Whelgar",
  bible = "bibles/wetlands_roads.md", role = "scholar", tier = "service",
  communities = { "menethil" }, temper = { "steady" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Prospector Whelgar runs the excavation that bears his name, and he cares more about what's under the mud than what's in the grass.",
    third = "{name} met Prospector Whelgar, who leads the Explorers' League dig in the Wetlands.",
  },

  greetings = {
    { id = "g_dig", text = "Careful where ye step, friend. Ye could be standin' on a thousand years of history." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raptors from the grass, Mosshide gnolls from the hills to the east, and Ormer shouting at both of them. If you'd stand watch at the edge of the trench for a spell, we might actually get some work done." } },
      choices = {
        { text = "I'll stand watch. Your work matters, Prospector.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll stand watch for a share of what you find.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They keep my diggers from digging, which comes to the same thing, for nobody works well with one eye on the grass. Ormer's been thinning them, but there are more in the marsh than he has bullets, or patience." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine eye for the grass, I think, and I'd be glad to have it watching ours." },
      },
      choices = {
        { text = "I'll thin the pack so your diggers can work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them for the sport, not for the dig.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Hum, do they? Then I'll thank ye tae keep yer hands off them until the League's had a look. Whatever's under this marsh is older than Menethil, I'd wager, an' I'll no' have it blown up by accident." },
      },
      choices = {
        { text = "Agreed. The League should see it first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Knowledge belongs to whoever can read it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What have you found so far?", next = "finds" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "An' me, an' I'm no' as slow as I look. Everything here's catalogued an' bound for Ironforge, so if a piece goes missin', the League will know, an' the League never forgets." },
      },
      choices = {
        { text = "I'm here to help, not to pocket.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Catalogues can be wrong, Prospector.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Have the raptors hurt anyone?", next = "raptors" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fossils, mostly, and bones far bigger than any beast living now, which aren't the sort you bury. There's a strangeness in a few of them that makes the diggers uneasy, and they're not easily made uneasy." } },
      choices = {
        { text = "Some things are better left in the ground, Prospector.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dig it all up. Knowledge shouldn't fear the dark.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I ask myself that every night, and every morning the ground gives me some new reason to keep digging. The League will remember the finds, but I'll remember the names, and that's my burden, not theirs." } },
      choices = {
        { text = "Then honour them by finishing the work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No find is worth more lives. Pack it up.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Some of what we dig up here is old and some is very old, and a few pieces I'd rather a priest looked at before I touched them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! My diggers will stand a little straighter with you around, and I'll take all the straight backs I can get." },
        { id = "h_default", key = true,
          text = "Prospector Whelgar of the Explorers' League, and this is my excavation, raptors and all. The ground here hides more than mud, though it hides it under plenty of mud." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! The dig could use one, for my diggers keep looking over their shoulders instead of at the ground." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Good, for the raptors know this ground better than any of my maps, and you'll know the raptors." },
      },
      again = {
        { id = "h_again", text = "What else? I've a trench to check." },
      },
      choices = {
        { text = "What have you found?", next = "finds" },
        { text = "Are the raptors a danger to the dig?", next = "raptors" },
        { text = "A gnome scholar would love to see this.", next = "gnome", when = { race = "Gnome" } },
        { text = "Your finds hum with old magic, Prospector.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "A dig full of treasure, and only raptors for guards.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What has your diggers looking over their shoulders?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the raptors keep you from digging, Prospector?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What have you found that needs a priest's eye, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is your dig worth the lives it's cost, Prospector?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    finds = {
      lines = { { id = "f_default", text = "Old dwarven stonework, older than Ironforge's records, and some say older still. The League wants it all catalogued before the Dark Irons come lookin'." } },
      choices = {
        { text = "The past should stay buried. Leave it be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "It belongs in Ironforge's halls, properly recorded.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They're a nuisance, and Ormer takes them very personally. I let him, for he keeps my diggers alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Then tell them to come, for I've more stones than scholars. Mind the raptors on the way." } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's beyond me, I'm afraid, though I'll talk about old stones all day." } },
  },
}
