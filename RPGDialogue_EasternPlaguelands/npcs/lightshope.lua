-- Light's Hope Chapel: the Argent Dawn's heart in the Eastern Plaguelands. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrosus", id = TODO_NPC("Lord Maxwell Tyrosus"), name = "Lord Maxwell Tyrosus",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "light_hope", "argent_dawn" }, temper = { "reserved" }, values = { "devout", "pragmatic" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_rare", text = "I don't often receive visitors. You'll forgive me if I'm out of practice." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. Few return from the Plaguelands twice. Fewer bother to call on me." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Horde. Some of my officers still flinch. I don't. The Scourge doesn't care whose blood it spills, and neither will I, when it's spilled for this." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I left the Silver Hand when it became the Scarlet Crusade. You may yet show me there was something worth keeping." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maxwell Tyrosus. I lead the Argent Dawn, since Lord Raymond George fell. We fight the Scourge, and anything else that would end this world. We ask no one which crown they serve." },
        { id = "h_summoned", tags = { "news" }, when = { questActive = TODO_QUEST("Lord Maxwell Tyrosus") },
          text = "The Duke sent you. Then he trusts you, and Nicholas trusts very few. Sit. We have a great deal to discuss, and Stratholme won't wait." },
        { id = "h_hold", when = { questActive = TODO_QUEST("The Argent Hold") },
          text = "The Argent Hold is open to you now. What's inside was made to be used against the dead. Use it." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I walk the chapel at dawn, before the guards change. It's the only hour the Plaguelands are quiet. I've come to treasure it." },
      },
      choices = {
        { text = "Why did you leave the Silver Hand?", next = "left" },
        { text = "How can I help?", next = "END", fx = { affinity = 2, standing = { light_hope = 1 } } },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", text = "I didn't leave it. It left. The Hand I knew healed the sick and shielded the weak. What became the Scarlet Crusade burns villages to save them. When they stopped asking whether someone was dead or only different, I walked away. Others came with me." },
      },
      choices = {
        { text = "You made the right choice.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Crusade does fight the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "It does. With fire and fear, at whatever cost. I won't call them enemies. I won't call them friends. Out here, that distinction matters less every year." },
      },
      choices = { { text = "I understand.", next = "END", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_dawn", text = "No crown, no warchief. Only the work, and the dead who'd undo it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "My old brothers, gone hard and blind. I pray for them. I also post guards." } },
    _none = { { id = "tp_none", text = "Not my concern while the Scourge stands." } },
  },
}

P:NPC {
  key = "leonid", id = TODO_NPC("Leonid Barthalomew the Revered"), name = "Leonid Barthalomew the Revered",
  bible = "bibles/easternplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "gentle" }, values = { "devout", "selfless" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hello", text = "Don't be alarmed by my face. The Light still hears me, whatever I've become." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One who was freed, as I was. We owe the Banshee Queen our minds. What we do with them is our own." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light. So do I. It surprises people. It surprised me most of all." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Leonid Barthalomew. I died in the Scourging and rose a mindless thing. The Banshee Queen freed my mind, and I gave it to the Argent Dawn. My undeath is a sickness. It is also a weapon. I mean to use it." },
        { id = "h_ras", when = { metBefore = true },
          text = "I was in Stratholme when Ras Frostwhisper became what he is. I remember his face as it changed. I'd like very much for him to stop." },
        { id = "h_sacrifice", when = { metBefore = true },
          text = "They call me Revered. I'd rather they didn't. I only did what anyone would, if they'd already lost everything else." },
      },
      choices = {
        { text = "Does the Light really answer you?", next = "light" },
        { text = "How can I help?", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    light = {
      lines = {
        { id = "l_default", text = "It burns, a little. Like warmth on frostbitten hands. I've decided the burning is the Light reminding me what I'm for." },
      },
      choices = { { text = "That's beautiful, and terrible.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_dawn", text = "They took me in when no one else would have. I'll serve them until there's nothing left to serve with." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I know the Scourge. That's knowledge enough for one unlife." } },
  },
}
