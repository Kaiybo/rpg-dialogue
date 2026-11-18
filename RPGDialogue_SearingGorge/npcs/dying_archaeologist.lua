-- The Dying Archaeologist: the last living man of Dorius Stonetender's unit, slumped by the Altar of Suntara in the Slag Pit. Voice: bibles/dying_archaeologist.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dying_archaeologist", id = TODO_NPC("Dying Archaeologist"), name = "Dying Archaeologist",
  bible = "bibles/dying_archaeologist.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds", "explorers_league" }, temper = { "weary", "urgent" }, values = { "loyal", "dutiful" },
  notices = { "race", "light" },

  impression = {
    first = "The archaeologist by the Altar of Suntara is dying and knows it, and he spent what breath he had asking me to help the others. I never learned his name, and I'm not sure he remembered it.",
    third = "{name} found a dying dwarf archaeologist of Dorius Stonetender's unit beside the Altar of Suntara in the Slag Pit.",
  },

  greetings = {
    { id = "g_default", text = "Forget about me, friend, and help the others, for I've not got long and they've got longer to suffer." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back, and I'm still here, more or less, which surprises me as much as it does ye." },
    { id = "g_freed", when = { questDone = TODO_QUEST("Release Them") }, text = "They're quiet now, the lads, and I can hear the fire again instead of their hammers. Thank ye for that." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, from home, and I'd hoped one of us would come before the end. Tell Ironforge we found what we came for, and wish we hadn't." },
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "Don't waste yer prayers on me, friend, for I'm past mending. Save them for the lads at the altar, who need the peace more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I was with Dorius Stonetender's unit, digging for the Suntara Stones, and now I'm the only one left breathing, and not for long. The others are still working the altar, even dead, because the power of the Suntara won't let them stop." },
        { id = "h_justice", tags = { "news" }, when = { questActive = TODO_QUEST("Dwarven Justice") },
          text = "Thorius sent ye, didn't he, to see to Dorius's last wish? Then forget about me and free the others, for that's what he'd want and what I want too." },
        { id = "h_release", tags = { "news" }, when = { questActive = TODO_QUEST("Release Them") },
          text = "Northwest, in the hills above the cave, the Twilight's Hammer guard a relic. Bring it here and set it on the altar of Suntara, and the lads can finally lay down their tools." },
        { id = "h_obsidion", tags = { "news" }, when = { questActive = TODO_QUEST("Rise, Obsidion!") },
          text = "It was all a trap, friend, from the very start, and the traitor laughed while it closed on us. Kill him for us, and for Thorius, and kill the thing he's woken too." },
        { id = "h_obsidion_done", tags = { "news" }, when = { questDone = TODO_QUEST("Rise, Obsidion!") },
          text = "Ye did it, then, and the traitor's paid. I can go easy now, I think, though I've said that every hour since ye left." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, are ye? A week ago I'd have reached for my pick, but I can't lift it now, and the dead at that altar don't care whose side ye're on." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, but I may drift off in the middle of yer question." },
        { id = "h_again2", text = "Go on, then, while I've still got breath for it." },
      },
      choices = {
        { text = "What happened to your unit?", next = "unit" },
        { text = "That altar looks older than anything the Dark Irons ever built.", next = "altar" },
        { text = "Who betrayed you?", next = "traitor", when = { questDone = TODO_QUEST("Release Them") } },
        { text = "Let me tend your wounds.", next = "wounds" },
        { text = "Let me pray over you, at least.", next = "xpray", when = { class = { "PRIEST", "PALADIN", "SHAMAN" } } },
        { text = "Rest. I'll see to your men.", next = "END" },
      },
    },

    unit = {
      lines = {
        { id = "un_default", text = "We came into the Gorge with Dorius, good diggers all, and found the stones were real and the Dark Iron knew it. They took us at the Slag Pit, and they set the lads to work, and when the lads died they kept on working." },
      },
      choices = {
        { text = "Where is Dorius now?", next = "unit_dorius" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unit_dorius = {
      lines = {
        { id = "ud_default", text = "Dead, I'd guess, or worse, for he went to fetch help and never came back. He'd a good heart, Dorius, too good for the people he trusted, and I'll not say more than that while I'm unsure." },
        { id = "ud_done", when = { questDone = TODO_QUEST("Dwarven Justice") },
          text = "Dead, ye say, and his last letter reached Thorius too late to save him. He went for help and found the traitor instead, and I'm sorry I ever doubted him." },
      },
      choices = {
        { text = "I'll make sure his last wish is kept.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },

    altar = {
      lines = {
        { id = "al_default", text = "Old stone, and holy to somebody, though not to us, and whatever power the Suntara hold, it binds anyone who works for it and doesn't let go. I can feel it pulling at me even now, like a cold hand on my collar." },
      },
      choices = {
        { text = "How does the relic help?", next = "altar_relic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    altar_relic = {
      lines = {
        { id = "ar_default", text = "The Twilight's Hammer brought it here to bind the altar, so it should unbind it too, if ye set it right. I'm guessing, friend, but I'm a dying man and guessing's all I've got left." },
      },
      choices = {
        { text = "Then I'll take the relic, whatever it costs.", next = "altar_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    altar_choice = {
      lines = {
        { id = "ac_default", text = "The Hammer will fight ye for it, so go with friends if ye have them. And if the relic does something else besides, then at least the lads will be free of it, and that's worth any risk to me." },
      },
      choices = {
        { text = "Their peace is worth the risk. I'll do it.", next = "BACK", reply = "Bless ye, friend, an' the lads will bless ye too, wherever they've gone. Go wi' the stone at yer back.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll do it, but I'll keep the relic if it's useful.", next = "BACK", reply = "Keep it if ye must, but break whatever binds them first. I'll no' rest otherwise, an' I've no' long tae rest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    traitor = {
      lines = {
        { id = "tr_default", text = "Lathoric the Black, he calls himself now, and he led us into it smiling, and then he called up Obsidion to guard what we'd dug. I'll not tell ye who he was before, friend, because that's for Thorius to hear first." },
      },
      choices = {
        { text = "That name Obsidion sounds like nothing I'd care to meet.", next = "traitor_obsidion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traitor_obsidion = {
      lines = {
        { id = "to_default", text = "A great thing of black stone and fire, raised out of the Slag Pit to stand guard for him. Kill Lathoric first if ye can, because I think the beast only wakes properly when its master calls." },
      },
      choices = {
        { text = "Lathoric dies for this. No mercy.", next = "BACK", reply = "Aye, an' I'll no' weep for him. Just mind the beast when its master falls.", fx = { align = { honor = -1 } } },
        { text = "He'll face Ironforge's justice if he yields.", next = "BACK", reply = "More than he gave us, an' more than I'd give him. But ye're a better soul than me, an' I'll no' argue.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wounds = {
      lines = {
        { id = "wo_default", text = "Kind of ye, but it's past bandages, friend, for the cut's deep and the heat's in it. Spend yer time on the living and on the lads at the altar, and I'll be well enough content." },
      },
      choices = { { text = "As you wish.", next = "BACK", fx = { affinity = 1 } } },
    },

    xpray = {
      big = true,
      lines = {
        { id = "xp_default", text = "If ye must, then pray for the lads first, for they're still bound and I'm only dying. I was never much for temples, but I'd not mind a kind word said over me by someone who means it." },
      },
      choices = {
        { text = "I'll pray for all of you, bound and dying alike.", next = "BACK", reply = "Thank ye, friend. That's a kindness I'll carry wi' me, wherever I'm goin'.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Prayers won't free them. Steel will.", next = "BACK", reply = "Aye, maybe, an' I'll no' fault ye for that. Take the steel, then, an' free them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A digger of the Explorers' League, and proud of it, though I'd have been prouder still to dig somewhere that didn't kill us." } },
    advice = { { id = "tp_ad", text = "Never trust a man who's too eager to show ye the way in, friend." } },
    magni = { { id = "tp_magni", text = "Tell the king, if ye ever see him, that the League died diggin' for him. I think he'd want to know." } },
    uldaman = { { id = "tp_uldaman", text = "I dug at Uldaman before this, an' I thought that was dangerous. I was wrong about a great many things." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons found us before we found anythin' worth findin'. Watch the ridges, friend, they're always watchin' back." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons have a whole city under the mountain, I've heard, with a forge that never cools. I'd have liked to see it, from a safe distance." } },
    _none = { { id = "tp_none", text = "I don't know, friend, and I've not the breath to guess." } },
  },
}
