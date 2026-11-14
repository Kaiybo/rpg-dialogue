-- Kargath: the Horde's lone outpost in the Badlands, on the road to Blackrock. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "goretooth", id = TODO_NPC("Warlord Goretooth"), name = "Warlord Goretooth",
  bible = "bibles/badlands.md", role = "soldier", tier = "quest",
  communities = { "kargath" }, temper = { "boisterous" }, values = { "proud", "loyal", "brave" },
  notices = { "race", "class", "level" },

  greetings = {
    { id = "g_tower", text = "Another one climbs my tower! Good. I was starting to talk to the vultures." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Still alive. That's more than I can say for the last three I sent up the road." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. I was one, once, before they gave me a tower and a title. Swing an axe for me while you still can." },
    { id = "n_young", cat = "level", when = { maxLevel = 45 },
      text = "You're young for the Badlands. Stay south of the Spire. The Blackrock eat young things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Warlord Goretooth, and Kargath is mine to hold. Up the road sits Blackrock Spire, full of orcs who call themselves the true Horde. I sit here. Watching. Waiting. Getting old." },
        { id = "h_kos", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("KILL ON SIGHT: Dark Iron Dwarves") }, { questActive = TODO_QUEST("KILL ON SIGHT: High Ranking Dark Iron Officials") } } },
          text = "You read the posting. Good. Dark Irons, all of them, and the officers twice over. Bring me proof." },
        { id = "h_angerforge", when = { questActive = TODO_QUEST("Operation: Death to Angerforge") },
          text = "General Angerforge. Down in the depths, giving orders to Dark Irons. Take the orders away from him. Permanently." },
        { id = "h_command", when = { any = { { questActive = TODO_QUEST("Warlord's Command") }, { questActive = TODO_QUEST("Eitrigg's Wisdom") } } },
          text = "This is beyond Kargath now. The Warchief himself needs to hear what we know about the Spire. Go to Orgrimmar. Tell him Goretooth sent you." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall. Then you know why we hold this rock. He sent us here, and here we stay." },
      },
      choices = {
        { text = "You sound like you'd rather be fighting.", next = "dream" },
        { text = "Point me at the Dark Irons.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { kargath = 1 } } },
      },
    },
    dream = {
      big = true,
      lines = {
        { id = "d_default", text = "Rather? I dream of it. Every night. Me, an axe, a hundred Blackrock, and a song about it after. Instead I get a tower, reports, and two Forsaken ladies at the fire who laugh at my jokes because they're dead and nothing else is funny." },
      },
      choices = {
        { text = "The ladies at the fire?", next = "ladies" },
        { text = "Maybe you'll get your fight.", next = "END", fx = { affinity = 2 } },
      },
    },
    ladies = {
      lines = {
        { id = "l_default", text = "Theodora and Vivian. The Hierophant and the Shadowmage. Fine company. Sharp tongues. Don't tell them I said fine." },
      },
      choices = { { text = "Your secret is safe.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Rend Blackhand sits up there in the Spire calling himself Warchief. There's one Warchief. I'd like to remind Rend of that with an axe." } },
    dark_iron = { { id = "tp_dark_iron", text = "They swarm out of the mountain like ants out of a kicked nest. We kick back." } },
    _none = { { id = "tp_none", text = "Never heard of it. Can I hit it?" } },
  },
}

P:NPC {
  key = "theodora", id = TODO_NPC("Hierophant Theodora Mulvadania"), name = "Hierophant Theodora Mulvadania",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "dramatic" }, values = { "curious", "mischievous" },
  notices = { "race" },

  greetings = {
    { id = "g_fire", text = "Oh, a new face at the fire! Sit, sit. You simply must tell me something dreadful. It's been a dull week in the dust." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Another of us! How refreshing. The orcs are lovely, darling, but they do keep breathing at one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hierophant Theodora Mulvadania, of the Undercity and the Kargath Expeditionary Force. I keep the Warlord company. Someone has to, and Vivian can't do it alone." },
        { id = "h_109th", tags = { "news" }, when = { questActive = TODO_QUEST("The 109th Division") },
          text = "The 109th Division. Our people, Expeditionary Force, and they were my friends. General Angerforge and his golem lord butchered them in the depths. I'm done being charming about it. Kill them both." },
        { id = "h_guzzler", when = { questActive = TODO_QUEST("The Grim Guzzler") },
          text = "The Grim Guzzler. A tavern, inside Blackrock Depths, if you can believe it. Go. See. Tell me everything, especially the parts you shouldn't." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "Golems, darling. The Dark Irons build them out of stone and spite. There's a gnome out in the Dustbowl who knows about such things. Lotwil. Do go and bother him." },
        { id = "h_goretooth", when = { heardLine = "goretooth.h_default" },
          text = "Did the Warlord tell you about his dreams? Glorious death, a hundred foes? He tells everyone. We nod. It's kinder." },
      },
      choices = {
        { text = "Any gossip?", next = "gossip" },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    gossip = {
      lines = {
        { id = "g_default", text = "Goretooth thinks he's charming. Vivian thinks so too, though she'd sooner be torn apart by ghouls than say it. I say nothing. I'm a Hierophant. I simply observe." },
      },
      choices = { { text = "Very wise.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Grim little people. Their ale is wonderful, though. I'm told." } },
    _none = { { id = "tp_none", text = "Never heard a whisper of it. And I hear every whisper." } },
  },
}

P:NPC {
  key = "vivian", id = TODO_NPC("Shadowmage Vivian Lagrave"), name = "Shadowmage Vivian Lagrave",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "class" },

  greetings = {
    { id = "g_fire", text = "Oh! You startled me! Not that I'm easily startled. I'm a Shadowmage. We're very composed." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A fellow practitioner! Finally someone at this fire who knows a ley line from a clothesline." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadowmage Vivian Lagrave, Kargath Expeditionary Force. I study the things in the mountain that the Dark Irons would rather we didn't. Thrilling work. Mostly dust." },
        { id = "h_element", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Element") },
          text = "The Dark Irons put something in their golems to make them move. Essence of the Elements. Bring me ten. I have projects of my own that could use a heartbeat." },
        { id = "h_recipe", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave") }, { questActive = TODO_QUEST("Lost Thunderbrew Recipe") } } },
          text = "There's a Thunderbrew recipe lost somewhere in the Depths. I want it. For research. Entirely for research." },
        { id = "h_tablet", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave and the Darkstone Tablet") }, { questActive = TODO_QUEST("The Darkstone Tablet") } } },
          text = "The Darkstone Tablet. Old writing, old magic, and very likely a curse. Bring it to me. Carefully!" },
      },
      choices = {
        { text = "The Warlord speaks well of you.", next = "flustered" },
        { text = "I'll find it.", next = "END", fx = { affinity = 1 } },
      },
    },
    flustered = {
      lines = {
        { id = "f_default", text = "He does? I mean. Does he. How nice. That's. Hm. Did you need a quest? I have several. Please take one." },
      },
      choices = { { text = "I'll take one.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Their fire magic is crude but powerful. Like a hammer made of lava. I'd love to study it from a safe distance." } },
    _none = { { id = "tp_none", text = "Hm! Not my field. Yet." } },
  },
}

P:NPC {
  key = "lexlort", id = TODO_NPC("Lexlort"), name = "Lexlort",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "terse" }, values = { "practical", "loyal" },
  notices = { "class" },

  greetings = {
    { id = "g_shadow", text = "You found me. Most don't. That's either good news for you or bad news for me." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of ours, in trade if not in uniform. You'll understand why I don't say much." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lexlort. The Expeditionary Force needs eyes on the Spire. I'm the eyes. Sometimes I need hands." },
        { id = "h_grark", tags = { "news" }, when = { questActive = TODO_QUEST("Grark Lorkrub") },
          text = "Grark Lorkrub sold our plans to the Blackrock. He's hiding under their wing in the Burning Steppes. Put him in thorium shackles and walk him to the Searing Gorge. My men will be waiting." },
        { id = "h_predicament", when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "You've got Grark moving. Keep him close through the mountain. If he runs, he dies, and what he knows dies with him." },
        { id = "h_seen", when = { metBefore = true }, text = "You came in by the south path at noon. I know. I always know. Don't take it personally." },
      },
      choices = { { text = "I'll be your hands.", next = "END", fx = { affinity = 1, align = { order = 1 } } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "I know their shift changes. Their drinking songs. Their names. That's my job." } },
    _none = { { id = "tp_none", text = "Nothing I'll share." } },
  },
}

P:NPC {
  key = "shulkar", id = TODO_NPC("Innkeeper Shul'kar"), name = "Innkeeper Shul'kar",
  bible = "bibles/badlands.md", role = "innkeeper", tier = "service",
  communities = { "kargath" }, temper = { "warm" }, values = { "generous", "loyal" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come out of the dust. Sit. There's water, there's grog, and there's a bunk nobody's bled on. Recently." },
    { id = "g_home", when = { homeInn = { "Kargath" } }, text = "Back from the badlands! Tell me what you killed. The grunts like a good story with their supper." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half dead. And I've got Forsaken guests, so I know what that looks like. Rest." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy. The road to the Spire is hard enough sober." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shul'kar. I keep the inn. Out here a hot meal and a dry bunk are worth more than gold, and I don't charge much more than gold for them." },
        { id = "h_story", when = { metBefore = true }, text = "Grunt told me last night he fought a Dark Iron the size of a door. Then it was two doors. By morning it was a castle. Good story." },
      },
      choices = { { text = "A bunk, please.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know. Tell me about your battles instead. I like those." } },
  },
}
