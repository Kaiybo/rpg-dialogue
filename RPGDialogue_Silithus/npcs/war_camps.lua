-- The two faction camps in the desert: the Ironforge Brigade outside Hive'Zora (Marshal Bluewall, Captain Blackanvil,
-- Janela Stouthammer) and the Orgrimmar Legion near Hive'Regal (General Kirika).
-- Voice: bibles/war_camps.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Marshal Bluewall
---------------------------------------------------------------------------
P:NPC {
  key = "bluewall", id = TODO_NPC("Marshal Bluewall"), name = "Marshal Bluewall",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "gruff", "brisk" }, values = { "duty", "loyal" },
  notices = { "pvp" },

  impression = {
    first = "Marshal Bluewall commands the Alliance's silithyst gathering outside Hive'Zora and is furious that it started late. He talks about the Horde's head start like a debt he means to collect.",
    third = "{name} met Marshal Bluewall, the dwarf marshal running the Alliance's silithyst effort in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Another recruit! Good, the Alliance needs every able body, and the desert's been eating them." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more sand? Good {g:lad|lass}, there's always more silithyst out there." },
    { id = "g_scour", when = { questActive = TODO_QUEST("Scouring the Desert") }, text = "Find the silithyst, carry it to the extractor, and don't let a Horde scout take it off you on the way." },
  },

  notice = {
    { id = "n_pvp", cat = "pvp", when = { honorKills = { min = 100 } },
      text = "You've the look of someone who's fought the Horde and won more often than not. Good, because out there they'll want your silithyst more than they want your life." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marshal Bluewall, Ironforge Brigade. The Horde started gathering silithyst out here well before we did, and they get steady reinforcements from the north, so every crystal we bring in counts double." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Scouring the Desert"), days = 1 } },
          text = "Thank the Light you made it back! If we'd only started this sooner our need wouldn't be so desperate, but every crystal you bring in is one the Horde doesn't get." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You've a nerve walking into a Brigade camp wearing those colors. Say your piece and be off, before one of my riflemen decides you're a target." },
      },
      again = {
        { id = "h_again", text = "What else? The extractor doesn't fill itself." },
        { id = "h_again2", text = "Speak up. The wind's loud out here." },
      },
      choices = {
        { text = "What is silithyst?", next = "silithyst" },
        { text = "How did the Horde get ahead?", next = "late" },
        { text = "What happens to the silithyst we gather?", next = "extractor" },
        { text = "Who serves under you here?", next = "camp" },
        { text = "Ironforge should have sent more soldiers sooner.", next = "late", when = { race = "Dwarf" } },
        { text = "Back to the desert, then.", next = "END" },
      },
    },
    silithyst = {
      lines = { { id = "si_default", text = "Crystals that grow in the sand where the old magic runs close to the surface. Nobody's quite sure what it all does yet, but the Horde wants it badly, and that tells me we want it too." } },
      choices = {
        { text = "That's your whole reason?", next = "silithyst_reason" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithyst_reason = {
      big = true,
      lines = { { id = "sr_default", text = "It's reason enough in a war, recruit. Whatever the Horde gathers, they'll use against us, and if it turns out the crystals are worthless, then we've wasted some sweat and they've wasted a good deal more." } },
      choices = {
        { text = "Then we gather it all. Deny them everything.", next = "BACK", reply = "Aye, that's the spirit, recruit, every crystal in our sacks is one they'll never carry home, so get out there and fill yours.", fx = { align = { order = 1 } } },
        { text = "Fighting over crystals nobody understands is folly.", next = "BACK", reply = "Folly or not, the Horde's out there gathering, and I'll not be the dwarf who sat on his hands while they stripped the dunes bare.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "la_default", text = "We paid them no mind, that's how. We thought the desert wasn't worth a big garrison, and while we thought it, they were digging. By the time the reports reached Ironforge, they'd had a season's start on us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    extractor = {
      lines = { { id = "ex_default", text = "It goes into the extractor here at the camp, and then north, where cleverer heads than mine can argue about it. I'm not paid to be clever, only to make sure there's more of it in our pile than in theirs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "ca_default", text = "Captain Blackanvil keeps the field duty soldiers in line, and Janela Stouthammer keeps them armed, and she's the one you want to please if you ever need a new blade. The rest are riflemen and footmen, and they're all short on water and patience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Silithyst, the Horde's camps, and how far behind we are." } },
    silithid_hives = { { id = "tp_hives", text = "Hive'Zora's right on our doorstep. We don't sleep much." } },
    _none = { { id = "tp_none", text = "Not my concern, recruit. Silithyst is my concern." } },
  },
}

---------------------------------------------------------------------------
-- Captain Blackanvil
---------------------------------------------------------------------------
P:NPC {
  key = "blackanvil", id = TODO_NPC("Captain Blackanvil"), name = "Captain Blackanvil", title = "Ironforge Brigade Captain",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "gruff", "jovial" }, values = { "duty", "brave" },
  notices = { "dwarf" },

  impression = {
    first = "Captain Blackanvil signs the field duty papers at the Ironforge Brigade's camp outside Hive'Zora, and he likes to make newcomers sweat a little before he does. He calls the war against the hives \"skirmishing\" and seems to mean it.",
    third = "{name} met Captain Blackanvil, the dwarf captain of the Ironforge Brigade in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Another of Kaldon's strays! Come on, then, let's see if you're good for anything." },
    { id = "g_duty", when = { questActive = TODO_QUEST("Field Duty") }, text = "You'll want your papers signed, aye? Do some proper work at the hive first, and then we'll talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Kaldon must like you, or he's run out of better ones." },
  },

  notice = {
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf! Thank the Titans, someone who'll understand me when I swear. Where's your clan from, then?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Blackanvil of the Ironforge Brigade, and this is my camp, with the biggest bug nest in Silithus right over that hill. Windcaller Kaldon sends me his fresh recruits for field duty, and I send most of them back to him with sunburn and stories." },
        { id = "h_papers", when = { questActive = TODO_QUEST("Field Duty") },
          text = "Aye, I suppose that little skirmish will pass as field duty nowadays. Take these papers back to Cenarion Hold, and I'm sure they'll have a cushy job ready for you, though don't hold your breath." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're in the wrong camp, friend. The Orgrimmar Legion's down south by Hive'Regal, and Kaldon keeps us apart for good reason." },
      },
      again = { { id = "h_again", text = "Anything else? I've a camp full of thirsty soldiers to shout at." } },
      choices = {
        { text = "What does field duty actually involve?", next = "duty" },
        { text = "Why is the Ironforge Brigade here?", next = "why" },
        { text = "What's Hive'Zora like up close?", next = "hive" },
        { text = "What do you think of the Circle?", next = "circle" },
        { text = "Which clan are you from, Captain?", next = "clan", when = { race = "Dwarf" } },
        { text = "I'll get to work.", next = "END" },
      },
    },
    duty = {
      lines = { { id = "du_default", text = "Kill bugs. Carry crates. Patch up the lads who got bit. Do enough of that and I'll sign your papers, and then you go back to Kaldon and he gives you briefings, and then you come back here and do the same thing with more paperwork." } },
      choices = {
        { text = "That sounds like most wars.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because King Magni has an eye on Kalimdor, and because somebody had to stand between the hives and the Circle's druids, who are brave enough but can't hold a shield wall to save their lives. Half our supplies sank on the way over, mind, so we're making do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hive = {
      lines = { { id = "hi_default", text = "Loud. Like a forge full of beetles, all day and all night, and every so often the ground shakes and something big comes out to see who's knocking. We knock anyway, because if we stop, the hive starts knocking on us." } },
      choices = {
        { text = "What comes out?", next = "hive_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hive_what = {
      big = true,
      lines = { { id = "hw_default", text = "Drones, soldiers, things with too many legs and no names yet. I lost two good footmen last week to something I never saw clearly. The druids want us to leave the hives alone until they understand them, and I'd like to understand them from the far side of a cannon." } },
      choices = {
        { text = "Burn the hive out before it grows.", next = "BACK", reply = "By my beard, I'd like nothing better, and if the druids ever turn their backs for a day, I'll have the torches lit before supper.", fx = { align = { order = -1 } } },
        { text = "Hold the line and wait for the Circle's word.", next = "BACK", reply = "Aye, that's the sensible answer, and I'll hold it, though it galls me tae sit still while those things breed under our boots.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "Odd folk, all leaves and patience, but they're the reason anyone's alive in this desert at all. Kaldon's a good sort, for a night elf, and he's the only one who ever sends me enough water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clan = {
      lines = { { id = "cl_default", text = "Blackanvils of the eastern Dun Morogh hills, smiths and soldiers both, though I was always better at the soldiering. My old da still thinks I'm stationed somewhere with snow, and I've not had the heart to tell him otherwise." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Field duty, the Brigade, and the beetles over the hill." } },
    _none = { { id = "tp_none", text = "Ask Kaldon. He's the clever one." } },
  },
}

---------------------------------------------------------------------------
-- Janela Stouthammer
---------------------------------------------------------------------------
P:NPC {
  key = "janela", id = TODO_NPC("Janela Stouthammer"), name = "Janela Stouthammer",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "ironforge_brigade" }, temper = { "brisk", "warm" }, values = { "practical", "duty" },
  notices = { "smith", "paladin" },

  impression = {
    first = "Janela Stouthammer is Captain Blackanvil's lieutenant and the Brigade's supply officer, a paladin who has spent more of the war counting blades than swinging one. She is tired of hearing about dull swords.",
    third = "{name} met Janela Stouthammer, the dwarf lieutenant who keeps the Ironforge Brigade supplied in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "If you've brought weapons, you're my new favorite. If you've brought complaints, join the queue." },
    { id = "g_arms", when = { questDone = TODO_QUEST("Arms for the Field") }, text = "My lads haven't said a word about dull blades since your broadswords came in. It's been lovely." },
  },

  notice = {
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "A smith! Please tell me you can make a Moonsteel Broadsword, because half my soldiers are fighting with butter knives." },
    { id = "n_pala", cat = "paladin", when = { class = "PALADIN" },
      text = "Light be with you, sibling. It's good to see another of the Silver Hand out here, even one with sand in their boots." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Janela Stouthammer, Captain Blackanvil's lieutenant. Many of our supplies were lost on the way here, so I spend my days begging the Circle for weapons and armor kits, and my nights listening to soldiers complain about what they've got." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Arms for the Field"), days = 3 } },
          text = "Oh, excellent! Two Moonsteel Broadswords, and properly balanced, too. I won't have to hear complaints about dull blades for at least a week, and I could kiss you for that." },
        { id = "h_kits", when = { questActive = TODO_QUEST("Armor Kits for the Field") },
          text = "Armor kits! You've no idea how many dents a silithid can put in a breastplate. Bring them as soon as you can." },
      },
      again = { { id = "h_again", text = "What else? I've a ledger with too many minus signs in it." } },
      choices = {
        { text = "How did you lose your supplies?", next = "lost" },
        { text = "What does the Brigade need most?", next = "need" },
        { text = "You're of the Silver Hand?", next = "hand" },
        { text = "What's Captain Blackanvil like?", next = "captain" },
        { text = "I serve the Light too. How do you keep faith out here?", next = "hand", when = { class = "PALADIN" } },
        { text = "I'll leave you to your ledger.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Half of it went down with a ship off the Tanaris coast, and the other half was 'borrowed' by goblins in Gadgetzan who swore blind they'd never seen it. I've stopped asking which half hurts more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    need = {
      lines = { { id = "ne_default", text = "Blades, armor kits, bandages and water, in that order, except on hot days, when it's water first. The Circle sends what it can, and adventurers like you make up the rest, and I write every bit of it down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hand = {
      big = true,
      lines = { { id = "ha_default", text = "I am, though I've not held a proper vigil in months. Out here the Light feels very far away, and some days I think the Silver Hand's place is in the Plaguelands, not guarding beetles in a desert." },
      },
      choices = {
        { text = "The Light is wherever you stand to protect others.", next = "hand_end", fx = { align = { light = 1 } } },
        { text = "Faith won't stop a silithid. Steel will. Focus on steel.", next = "hand_end", fx = { align = { light = -1 } } },
        { text = "Why did you come here, then?", next = "hand_end" },
      },
    },
    hand_end = {
      lines = { { id = "he_default", text = "Because Ironforge asked, and because if these hives spill out, there'll be no Plaguelands left to save. I keep telling myself that, and most days I believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    captain = {
      lines = { { id = "cp_default", text = "Loud, brave, and kinder than he wants anyone to know. He calls every fight a skirmish so the young ones don't panic, and then he sits up all night writing letters to the families of the ones who don't come back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, the Brigade's needs, and the captain's bad handwriting." } },
    silver_hand = { { id = "tp_sh", text = "I'm a sister of the Hand, though I've not seen Lordaeron in years." } },
    _none = { { id = "tp_none", text = "Not in my ledger, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- General Kirika
---------------------------------------------------------------------------
P:NPC {
  key = "kirika", id = TODO_NPC("General Kirika"), name = "General Kirika",
  bible = "bibles/war_camps.md", role = "soldier", tier = "quest",
  communities = { "orgrimmar_legion" }, temper = { "blunt", "fierce" }, values = { "duty", "ambitious" },
  notices = { "pvp", "orc" },

  impression = {
    first = "General Kirika commands the Orgrimmar Legion's silithyst gathering near Hive'Regal and has no time for small talk. She treats the desert as a race against the dwarves, and she means to win it.",
    third = "{name} met General Kirika, the orc general running the Horde's silithyst effort in Silithus.",
  },

  greetings = {
    { id = "g_default", text = "You're here. Good. There's no time to waste making small talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The dwarves haven't stopped, so neither do we." },
    { id = "g_scour", when = { questActive = TODO_QUEST("Scouring the Desert") }, text = "The silithyst won't walk to the extractor. Get out there, and kill any dwarf who tries to take it from you." },
  },

  notice = {
    { id = "n_pvp", cat = "pvp", when = { honorKills = { min = 100 } },
      text = "You've blooded yourself against the Alliance, I can see it. Good, because out there it's you or a dwarf, and I want it to be the dwarf." },
    { id = "n_orc", cat = "orc", when = { race = "Orc" },
      text = "An orc, and you've kept your edge. Too many of ours have gone soft in Orgrimmar's streets." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "General Kirika, Orgrimmar Legion. For a long while the only dangers we faced here were the beasts and the heat, but now the Alliance has caught on to what we found in this desert, and it's a race between us. I need every set of hands, and I hope I have yours." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Scouring the Desert"), days = 1 } },
          text = "You've done well. Every crystal goes to our stockpile, and every bit is our gain and the Alliance's loss." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're Alliance, in my camp. Speak quickly, and then go, before my grunts remember they're bored." },
      },
      again = {
        { id = "h_again", text = "More questions? Fine, but make them short." },
        { id = "h_again2", text = "What else? Speak while you walk." },
      },
      choices = {
        { text = "Why does the Horde want silithyst?", next = "why" },
        { text = "What do you think of the dwarves?", next = "dwarves" },
        { text = "Do you answer to the Circle here?", next = "circle" },
        { text = "How did you become a general?", next = "rank" },
        { text = "For the Horde. I'll get to it.", next = "END", when = { faction = "Horde" } },
        { text = "I'm going.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "We tapped this desert's crystals before anyone else thought to look, and the Warchief means to know what they're worth. Whatever they are, they're ours by right of finding, and I won't have the Alliance stealing them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      big = true,
      lines = { { id = "dw_default", text = "Stubborn, well-armed and too many of them, because they get fresh soldiers off every ship. I respect a stubborn enemy. I'd still rather bury one, and some of my grunts say we should hit their camp now, before Kaldon's precious peace gets any older." } },
      choices = {
        { text = "Strike their camp. Take the crystals by force.", next = "dwarves_end", fx = { align = { order = -1 } } },
        { text = "Win the race fairly. Gather faster than they do.", next = "dwarves_end", fx = { align = { order = 1 } } },
        { text = "What will you do?", next = "dwarves_end" },
      },
    },
    dwarves_end = {
      lines = { { id = "de_default", text = "I'll follow the Warchief's orders and the Circle's terms, for now. But I keep my grunts' axes sharp, and the dwarves know it, and that's a kind of peace too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "ci_default", text = "The Circle gives the orders at Cenarion Hold, and Krug Skullsplit takes them, and I take the desert. The druids keep us apart from the dwarves, and I don't mind, because it saves my grunts from being hanged for murder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rank = {
      lines = { { id = "ra_default", text = "By being alive when better orcs weren't, and by learning from each of their deaths. That's how anyone makes general in the Horde, whatever the songs say." } },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Silithyst, the Legion, and the dwarves' weak points." } },
    silithid_hives = { { id = "tp_hives", text = "Hive'Regal is ours to watch. It hasn't come out in force yet." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Back to work." } },
  },
}
