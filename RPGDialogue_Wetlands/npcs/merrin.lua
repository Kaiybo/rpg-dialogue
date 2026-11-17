-- Merrin Rockweaver: Explorers' League digger trapped on the ridge at Whelgar's Excavation Site. Voice: bibles/merrin.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wl_merrin", id = TODO_NPC("Merrin Rockweaver"), name = "Merrin Rockweaver",
  bible = "bibles/merrin.md", role = "scholar", tier = "quest",
  communities = { "menethil" }, temper = { "steady", "sharp" }, values = { "curious", "brave", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Merrin Rockweaver is trapped on the ridge above Whelgar's dig with the survivors of a raptor attack, and still argues about where to dig next. She talks about her husband Tarrel the way other dwarves talk about home.",
    third = "{name} met Merrin Rockweaver, an Explorers' League digger who survived the raptor attack at Whelgar's Excavation Site.",
  },

  greetings = {
    { id = "g_default", text = "Welcome tae our home away from home, though I wish we'd a bit more hospitality tae offer. Keep low on the ridge, for the raptors watch it." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the ridge! Ormer'll be pleased, though he'll never say it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' we're still here, still diggin' when the raptors let us. Any letters from Menethil in yer pack?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown handy since ye first climbed up here. The raptors have noticed, an' so have I." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reached us even up here that ye've been helpin' folk. Thank ye, an' if any o' them was Tarrel, thank ye twice." },
    { id = "g_note", when = { questActive = TODO_QUEST("In Search of The Excavation Team") }, text = "Tarrel will be beside himself by now. Get word back tae him quick, if ye please." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", origin = "dwarf_explorers_league" },
      text = "A League dwarf! Ye'll know what we've lost down there better than any, an' I'm sorry ye had tae climb up tae see it." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" }, faction = "Alliance" },
      text = "A healer, thank the Light. We've a digger wi' a raptor bite that won't close, an' my bandagin' only goes so far." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Merrin Rockweaver, Explorers' League, an' one o' the lucky ones. We were uncoverin' rare artifacts down there when the raptors came over the dig, an' now we're trapped on this ridge wi' our hard work lyin' in ruin." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("In Search of The Excavation Team") },
          text = "Oh, thank the heavens ye're here! Tarrel sent ye, didn't he, the soft-hearted fool, an' I've never been so glad o' him in my life." },
        { id = "h_tarrel", when = { questDone = TODO_QUEST("In Search of The Excavation Team") },
          text = "Tarrel's written back, an' his letter shakes worse than mine did. He says he's tried tae come twice an' turned back at the fork, an' I'm glad o' it, for he'd be raptor food in a day." },
        { id = "h_ormer", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ormer's Revenge"), days = 5 } },
          text = "Ormer's been quieter since ye helped him with the raptors, an' I think it's done him good. He saved the Prospector an' me, an' he's been carryin' the rest o' them ever since." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Then ye'll understand why we didnae just run back tae Menethil. Ye don't leave a dig half done, raptors or no raptors." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, up here! If ye've any clever way o' keepin' raptors off a dig, I'll hear it gladly." },
      },
      again = {
        { id = "h_again", text = "What else? Keep yer voice down, for they've good ears." },
        { id = "h_again2", text = "Ask on. There's little else tae do up here but talk an' wait." },
      },
      choices = {
        { text = "What happened at the dig?", next = "attack" },
        { text = "What were you digging for?", next = "dig" },
        { text = "Tell me about Ormer.", next = "ormer" },
        { text = "Tarrel misses you.", next = "tarrel" },
        { text = "I can tend that raptor bite.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "Stay safe, Merrin.", next = "END" },
      },
    },

    attack = {
      lines = {
        { id = "at_default", text = "We'd begun tae find bones, great big ones, an' then the mottled raptors were all over the site before anyone could shout. Many lives were lost, an' Ormer held them off long enough for the Prospector an' me tae reach the ridge." },
      },
      choices = {
        { text = "Why did the raptors come?", next = "attack_why" },
        { text = "Something else, Merrin.", next = "BACK" },
      },
    },
    attack_why = {
      big = true,
      lines = {
        { id = "aw_default", text = "That's what I'd like tae know. They'd left us alone for weeks, an' then the day the big bones came up, they came wi' them, as if we'd dug intae somethin' that was theirs." },
      },
      choices = {
        { text = "Then leave the bones in the ground.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Finish the dig. Knowledge is worth the risk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dig = {
      lines = {
        { id = "dg_default", text = "Old stonework an' old bones, an' the bones were older than the stone, which had the Prospector very excited. Somethin' huge lived an' died in these hills long before any dwarf set foot in them." },
      },
      choices = {
        { text = "You argue with Whelgar about the digging?", next = "dig_whelgar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_whelgar = {
      lines = {
        { id = "dw_default", text = "Every day, an' twice on rest days! He wanted the north trench an' I wanted the slope, an' I was right, as it happens, though bein' right is what got us all chased up a ridge." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    ormer = {
      lines = {
        { id = "or_default", text = "So brave, an' he'd hate me sayin' it. He stood between the raptors an' the rest o' us wi' nothin' but a pick an' his own stubbornness, an' he lost friends down there he'll no' talk about." },
      },
      choices = {
        { text = "How is he holding up?", next = "ormer_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ormer_how = {
      lines = {
        { id = "oh_default", text = "Angry, mostly, which is better than grievin' out loud, I suppose. He wants tae go back down an' kill every raptor in the Wetlands, an' if ye've a mind tae help him, he'll take it." },
      },
      choices = { { text = "Something else, Merrin.", next = "BACK" } },
    },

    tarrel = {
      lines = {
        { id = "ta_default", text = "Does he now? He's a weaver in Menethil, gentle as a summer rain an' about as much use in a fight. I've written him every week, an' when the letters stopped, I knew he'd be pacin' the harbour bridge." },
      },
      choices = {
        { text = "Why did you come out here without him?", next = "tarrel_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarrel_why = {
      big = true,
      lines = {
        { id = "tw_default", text = "Because the League needed diggers, an' he's no digger, an' I couldnae have stood him watchin' me fret about him the whole time. We agreed I'd write, an' he'd wait, an' it seemed a fine plan till the raptors came." },
        { id = "tw_warm", when = { disposition = { min = 65 } },
          text = "Truth be told, I wanted somethin' that was mine, a find wi' my name on it in the League's books. I'll no' tell Tarrel that, an' I'll thank ye no' tae either." },
      },
      choices = {
        { text = "Your work matters. He'll understand.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some things are better kept from a husband.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heal = {
      lines = {
        { id = "he_default", text = "Would ye? He's over by the tents, the young one wi' the red beard, an' he's been very brave about it, which means he's been cursin' quietly all night." },
      },
      choices = {
        { text = "I'll see to him now.", next = "BACK", fx = { affinity = 2, standing = { menethil = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this dig, an' the hills round it, an' every bone we pulled out o' them. Ask." } },
    background = { { id = "tp_bg", text = "I'm a digger for the Explorers' League an' a weaver's wife, an' I'm better at the first than the second." } },
    advice = { { id = "tp_ad", text = "Never turn yer back on a quiet raptor, for a quiet one's a hungry one." } },
    explorers_league = { { id = "tp_league", text = "We dig where nobody else will, an' sometimes we find out why." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, I've been on this ridge too long. Ask in Menethil, if ye get back before me." } },
    grim_batol = { { id = "tp_grim_batol", text = "We dug as far east as we dared an' no further, because Grim Batol's past those hills. The League wanted samples, an' I told them tae fetch their own." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's the dig every Explorer dreams o', down in the Badlands. They say the titans built it, an' if that's true, half o' what we think we know about dwarves might be wrong." } },
    magni = { { id = "tp_magni", text = "King Magni wants tae know where dwarves came from, an' he's payin' the League tae find out. I like a king wi' questions." } },
  },
}
