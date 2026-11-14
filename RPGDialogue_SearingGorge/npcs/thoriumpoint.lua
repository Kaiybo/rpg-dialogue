-- Thorium Point: the Thorium Brotherhood's town on the cliffs above the Cauldron. Voice: bibles/searinggorge.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oilfist", id = TODO_NPC("Overseer Oilfist"), name = "Overseer Oilfist",
  bible = "bibles/searinggorge.md", role = "noble", tier = "quest",
  communities = { "thorium_point" }, temper = { "stern" }, values = { "proud", "practical" },
  notices = { "race", "profession" },

  greetings = {
    { id = "g_point", text = "Welcome tae Thorium Point. Everything that happens here, I'm responsible for. Including you, now." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good. Ye're either useful or lost. I'm hopin' useful." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, by yer beard. Our clans have bled each other for centuries. Up here, I've no time for it. Do ye?" },
    { id = "n_smith", cat = "profession", when = { profession = { "Blacksmithing", "Enchanting" } },
      text = "A craftsman. Then ye'll understand us better than most. We were made tae forge, an' we forged for a tyrant. Now we choose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Overseer Oilfist, of the Thorium Brotherhood. We're Dark Iron. We served Ragnaros in the depths of that mountain, makin' arms for his armies. Then we stopped." },
        { id = "h_kids", when = { metBefore = true },
          text = "The young ones were playin' too near the lava spiders again. I've told Hansel tae deal with it. He was restin', he says. He's always restin'." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The forges never go cold, even now. Habit. Down in the mountain, cold forges meant punishment. We keep 'em lit for different reasons now." },
      },
      choices = {
        { text = "How did you escape?", next = "escape" },
        { text = "I'll work with the Brotherhood.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    escape = {
      big = true,
      lines = {
        { id = "e_default", text = "We made our own way out. Enchanted gear, made at night, under the Firelord's own nose, piece by piece. When we had enough, we walked out of the depths and didnae look back. We settled across the gorge. Close enough tae the ore. Far enough tae sleep." },
      },
      choices = {
        { text = "That took courage.", next = "END", fx = { affinity = 3, trait = { brave = 1 } } },
        { text = "And now you sell to anyone?", next = "anyone" },
      },
    },
    anyone = {
      lines = {
        { id = "a_default", text = "Anyone who pays. Alliance, Horde, it makes no odds. We've had one master. We'll no' have another." },
      },
      choices = { { text = "I understand.", next = "END", fx = { affinity = 2, align = { order = -1 } } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "My kin. My shame and my sorrow. Most of them still bend the knee down there. I pray they'll stop. I've no' much hope." } },
    _none = { { id = "tp_none", text = "If it's no' on the Point, it's no' my concern." } },
  },
}

P:NPC {
  key = "hansel", id = TODO_NPC("Hansel Heavyhands"), name = "Hansel Heavyhands",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "thorium_point" }, temper = { "grumbling" }, values = { "loyal", "lazy" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_rest", text = "Och, what now? I'd just sat down. Fine. Fine! What is it?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good. Ye can do the thing they want me tae do. Everyone's happy." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Tauren" } },
      text = "Big, aren't ye? Folk say I'm built like an orc. I take it as a compliment. Do you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hansel Heavyhands. I'm the one Lolo sends when somebody needs a firm word. Or a firm fist. I'm very firm. Also very tired." },
        { id = "h_spiders", tags = { "news" }, when = { questActive = TODO_QUEST("Fiery Menace!") },
          text = "The Overseer says the lava spiders are frightenin' the bairns. So now it's my job. Twenty of 'em. Ye do it. I'll supervise. From this chair." },
        { id = "h_incendosaurs", when = { questActive = TODO_QUEST("Incendosaurs? Whateverosaur is More Like It") },
          text = "Incendosaurs. Fancy name for big burnin' lizards. Go an' put some out. Permanently." },
        { id = "h_tired", when = { metBefore = true },
          text = "Ye know what the best part o' freedom is? Sittin' down whenever ye like. Nobody tells ye tae stand. Except the Overseer. An' Lolo. An' now you." },
      },
      choices = { { text = "I'll handle it.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "They're no' us. We're nicer. An' we sit down more." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Couldnae be bothered, either. Ask Lolo." } },
  },
}

P:NPC {
  key = "lolo", id = TODO_NPC("Lookout Captain Lolo Longstriker"), name = "Lookout Captain Lolo Longstriker",
  bible = "bibles/searinggorge.md", role = "guard", tier = "quest",
  communities = { "thorium_point" }, temper = { "jovial" }, values = { "loyal", "proud" },
  notices = { "drink", "stealth" },

  greetings = {
    { id = "g_who", text = "Who goes there? Don't tell me. I'll know ye by yer step. Hmm. No idea. Who goes there?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah! I know that step now. Welcome back, friend. I never forget a footfall. Mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye've had a few! I can smell it. Good. A wee nip sharpens the nose. Mine's never been sharper." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Someone's sneakin'. Don't ask how I know. I've no eyes, but I've a nose like a hound an' ears like a bat." } },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lookout Captain Lolo Longstriker, at yer service. Blind as a mole, an' captain o' the lookouts. Don't laugh. Nobody's snuck up on the Point yet." },
        { id = "h_kalaran", when = { heardClaim = "kalaran_father" },
          text = "That fellow southeast o' here, with the sad story about his father? I've never once smelled grief on him. Smelled somethin'. No' grief." },
        { id = "h_maltorius", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Maltorius. Overseer o' the Dark Iron slaves in the Gorge, an' a cruel one. The poster's up. Bring me his head. I'll... know it when I feel it." },
        { id = "h_drink", when = { metBefore = true },
          text = "Folk say I drink too much for a lookout. I say I'd see nothin' at all without it. They've no answer tae that. Neither have I, come tae think of it." },
      },
      choices = {
        { text = "How do you keep watch, blind?", next = "watch" },
        { text = "I'll hunt Maltorius.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "Wind on the cliff tells me what's comin' up the road. The forge tells me the time. Hansel's snorin' tells me where Hansel is. Between the lot of 'em, I see plenty." },
      },
      choices = { { text = "Impressive.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never seen it. Ha! Never seen anything. Ask someone else." } },
  },
}

P:NPC {
  key = "kalaran", id = TODO_NPC("Kalaran Windblade"), name = "Kalaran Windblade",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "brooding" }, values = { "vengeful", "cunning" },
  notices = { "class" },

  greetings = {
    { id = "g_vengeance", text = "Another traveler. Good. I have need of someone with a strong arm and no love for the Dark Iron." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own. You'll understand, then, why the guilty must answer for what they've done." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kalaran Windblade. The Dark Iron took my father from me. Butchered him, here in this gorge. I mean to see them pay, and I can't do it alone.",
          fx = { hear = "kalaran_father" } },
        { id = "h_retribution", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Divine Retribution") }, { questActive = TODO_QUEST("The Flawless Flame") } } },
          text = "We'll need a flame that doesn't falter, and the means to carry it. Bring me what I ask, and I'll forge vengeance from it." },
        { id = "h_torch", when = { any = { { questActive = TODO_QUEST("The Torch of Retribution") }, { questActive = TODO_QUEST("Forging the Shaft") }, { questActive = TODO_QUEST("The Flame's Casing") } } },
          text = "The torch is nearly ready. Every piece you bring brings my father's killers closer to the reckoning they deserve." },
        { id = "h_father", when = { metBefore = true },
          text = "I dream of him. Of what they did. You'd think the dreams would fade. They don't. Good. I don't want them to." },
      },
      choices = {
        { text = "Tell me about your father.", next = "father" },
        { text = "I'll help you.", next = "END", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    father = {
      lines = {
        { id = "f_default", text = "He was... strong. Proud. The Dark Iron cut him down without a thought. That's all you need to know. That's all I'll say." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "END", fx = { affinity = 2 } },
        { text = "That's not much of a story.", next = "END", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "Murderers. Every one of them. Don't let the ones at Thorium Point fool you; it's in the blood." } },
    _none = { { id = "tp_none", text = "That doesn't concern my vengeance. Nothing else matters." } },
  },
}
