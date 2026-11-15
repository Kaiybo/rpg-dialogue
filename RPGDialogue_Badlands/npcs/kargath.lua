-- Kargath: the Horde's lone outpost in the Badlands, on the road to Blackrock. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "goretooth", id = TODO_NPC("Warlord Goretooth"), name = "Warlord Goretooth",
  bible = "bibles/badlands.md", role = "soldier", tier = "quest",
  communities = { "kargath" }, temper = { "boisterous" }, values = { "proud", "loyal", "brave" },
  notices = { "race", "class", "level" },

  greetings = {
    { id = "g_tower", text = "Another one climbs my tower, good! I was starting to talk to the vultures." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still alive! That's more than I can say for the last three I sent up the road." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! I was one, once, before they gave me a tower and a title, so swing an axe for me while you still can." },
    { id = "n_young", cat = "level", when = { maxLevel = 45 },
      text = "You're young for the Badlands, so stay south of the Spire; the Blackrock eat young things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Warlord Goretooth, and Kargath is mine to hold. Up the road sits Blackrock Spire, full of orcs who call themselves the true Horde, and I sit here watching, and waiting, and getting old." },
        { id = "h_kos", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("KILL ON SIGHT: Dark Iron Dwarves") }, { questActive = TODO_QUEST("KILL ON SIGHT: High Ranking Dark Iron Officials") } } },
          text = "So you read the posting, good! Kill Dark Irons, all of them, and the officers twice over, and bring me proof." },
        { id = "h_angerforge", when = { questActive = TODO_QUEST("Operation: Death to Angerforge") },
          text = "General Angerforge is down in the depths, giving orders to Dark Irons. Take the orders away from him, permanently." },
        { id = "h_command", when = { any = { { questActive = TODO_QUEST("Warlord's Command") }, { questActive = TODO_QUEST("Eitrigg's Wisdom") } } },
          text = "This is beyond Kargath now, and the Warchief himself needs to hear what we know about the Spire. Go to Orgrimmar and tell him Goretooth sent you." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall, so you know why we hold this rock. He sent us here, and here we stay." },
      },
      choices = {
        { text = "You sound like you'd rather be fighting.", next = "dream" },
        { text = "Point me at the Dark Irons.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { kargath = 1 } } },
      },
    },
    dream = {
      big = true,
      lines = {
        { id = "d_default", text = "Rather? I dream of it every night: me, an axe, a hundred Blackrock, and a song about it after. Instead I get a tower, reports, and two Forsaken ladies at the fire who laugh at my jokes because they're dead and nothing else is funny." },
      },
      choices = {
        { text = "The ladies at the fire?", next = "ladies" },
        { text = "Maybe you'll get your fight.", next = "END", fx = { affinity = 2 } },
      },
    },
    ladies = {
      lines = {
        { id = "l_default", text = "Theodora and Vivian, the Hierophant and the Shadowmage: fine company, with sharp tongues. Don't tell them I said fine." },
      },
      choices = { { text = "Your secret is safe.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Rend Blackhand sits up there in the Spire calling himself Warchief. There's one Warchief. I'd like to remind Rend of that with an axe." } },
    dark_iron = { { id = "tp_dark_iron", text = "They swarm out of the mountain like ants out of a kicked nest. We kick back." } },
    _none = { { id = "tp_none", text = "Never heard of it, but can I hit it?" } },
  },
}

P:NPC {
  key = "theodora", id = TODO_NPC("Hierophant Theodora Mulvadania"), name = "Hierophant Theodora Mulvadania",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "dramatic" }, values = { "curious", "mischievous" },
  notices = { "race" },

  greetings = {
    { id = "g_fire", text = "Oh, a new face at the fire! Sit, sit, darling, and you simply must tell me something dreadful, because it's been a dull week in the dust." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Another of us, how refreshing! The orcs are lovely, darling, but they do keep breathing at one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hierophant Theodora Mulvadania, of the Undercity and the Kargath Expeditionary Force. I keep the Warlord company. Someone has to, and Vivian can't do it alone." },
        { id = "h_109th", tags = { "news" }, when = { questActive = TODO_QUEST("The 109th Division") },
          text = "The 109th Division were our people, Expeditionary Force, and they were my friends, and General Angerforge and his golem lord butchered them in the depths. I'm done being charming about it, darling: kill them both." },
        { id = "h_guzzler", when = { questActive = TODO_QUEST("The Grim Guzzler") },
          text = "The Grim Guzzler is a tavern inside Blackrock Depths, if you can believe it. Do go and see, and tell me everything, especially the parts you shouldn't." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "Golems, darling, which the Dark Irons build out of stone and spite. There's a gnome out in the Dustbowl called Lotwil who knows about such things, so do go and bother him." },
        { id = "h_goretooth", when = { heardLine = "goretooth.h_default" },
          text = "Did the Warlord tell you about his dreams, the glorious death and the hundred foes? He tells everyone, and we nod, because it's kinder." },
      },
      choices = {
        { text = "Any gossip?", next = "gossip" },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    gossip = {
      lines = {
        { id = "g_default", text = "Goretooth thinks he's charming, and Vivian thinks so too, though she'd sooner be torn apart by ghouls than say it. I say nothing, darling; I'm a Hierophant, and I simply observe." },
      },
      choices = { { text = "Very wise.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Grim little people, though their ale is wonderful, or so I'm told." } },
    _none = { { id = "tp_none", text = "Never heard a whisper of it, darling, and I hear every whisper." } },
  },
}

P:NPC {
  key = "vivian", id = TODO_NPC("Shadowmage Vivian Lagrave"), name = "Shadowmage Vivian Lagrave",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "class" },

  greetings = {
    { id = "g_fire", text = "Oh! You startled me, not that I'm easily startled, of course; I'm a Shadowmage, and we're very composed." },
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
          text = "Shadowmage Vivian Lagrave, of the Kargath Expeditionary Force. I study the things in the mountain that the Dark Irons would rather we didn't, which is thrilling work, though mostly dust." },
        { id = "h_element", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Element") },
          text = "The Dark Irons put something in their golems to make them move, called Essence of the Elements, and I want ten. I have projects of my own that could use a heartbeat." },
        { id = "h_recipe", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave") }, { questActive = TODO_QUEST("Lost Thunderbrew Recipe") } } },
          text = "There's a Thunderbrew recipe lost somewhere in the Depths, and I want it, for research. Entirely for research!" },
        { id = "h_tablet", when = { any = { { questActive = TODO_QUEST("Vivian Lagrave and the Darkstone Tablet") }, { questActive = TODO_QUEST("The Darkstone Tablet") } } },
          text = "The Darkstone Tablet has old writing on it, old magic, and very likely a curse, so bring it to me carefully!" },
      },
      choices = {
        { text = "The Warlord speaks well of you.", next = "flustered" },
        { text = "I'll find it.", next = "END", fx = { affinity = 1 } },
      },
    },
    flustered = {
      lines = {
        { id = "f_default", text = "He does? I mean, does he, how nice, that's... hm, well. Did you need a quest? I have several, so please, take one." },
      },
      choices = { { text = "I'll take one.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Their fire magic is crude but powerful, like a hammer made of lava, and I'd love to study it from a safe distance." } },
    _none = { { id = "tp_none", text = "Hm! That's not my field, not yet." } },
  },
}

P:NPC {
  key = "lexlort", id = TODO_NPC("Lexlort"), name = "Lexlort",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "terse" }, values = { "practical", "loyal" },
  notices = { "class" },

  greetings = {
    { id = "g_shadow", text = "You found me, and most don't, which is either good news for you or bad news for me." },
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
          text = "Lexlort. The Expeditionary Force needs eyes on the Spire, and I'm the eyes, but sometimes I need hands." },
        { id = "h_grark", tags = { "news" }, when = { questActive = TODO_QUEST("Grark Lorkrub") },
          text = "Grark Lorkrub sold our plans to the Blackrock. He's hiding under their wing in the Burning Steppes. Put him in thorium shackles and walk him to the Searing Gorge. My men will be waiting." },
        { id = "h_predicament", when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "You've got Grark moving. Keep him close through the mountain. If he runs, he dies, and what he knows dies with him." },
        { id = "h_seen", when = { metBefore = true }, text = "You came in by the south path at noon; I know, because I always know. Don't take it personally." },
      },
      choices = { { text = "I'll be your hands.", next = "END", fx = { affinity = 1, align = { order = 1 } } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "I know their shift changes, their drinking songs and their names, because that's my job." } },
    _none = { { id = "tp_none", text = "Nothing I'll share." } },
  },
}

P:NPC {
  key = "shulkar", id = TODO_NPC("Innkeeper Shul'kar"), name = "Innkeeper Shul'kar",
  bible = "bibles/badlands.md", role = "innkeeper", tier = "service",
  communities = { "kargath" }, temper = { "warm" }, values = { "generous", "loyal" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in out of the dust and sit. There's water, there's grog, and there's a bunk nobody's bled on, recently." },
    { id = "g_home", when = { homeInn = { "Kargath" } }, text = "Back from the badlands! Tell me what you killed, because the grunts like a good story with their supper." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half dead, and I've got Forsaken guests, so I know what that looks like. Rest, friend." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, now; the road to the Spire is hard enough sober." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Shul'kar, and I keep the inn. Out here a hot meal and a dry bunk are worth more than gold, and I don't charge much more than gold for them." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he fought a Dark Iron the size of a door, and then it was two doors, and by morning it was a castle. Good story, though." },
      },
      choices = { { text = "A bunk, please.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, but tell me about your battles instead, because I like those." } },
  },
}
