-- Camp Gev'rek: the Windshapers' camp in Mulgore. Voice: bibles/mulgore.md
-- Skyborne facts ONLY from the brief (§10). Where the brief is silent, she stays vague.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "ayessa", id = TODO_NPC("Ayessa Dawnsinger"), name = "Ayessa Dawnsinger",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "gevrek" }, temper = { "steady" }, values = { "loyal", "devout", "proud" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "Ayessa Dawnsinger leads the Windshapers with a steady hand and a careful word. She is grateful to Thunder Bluff, and plainly determined that her people never give the tauren cause to regret their welcome.",
    third = "{name} met Ayessa Dawnsinger, leader of the Windshapers at Camp Gev'rek in Mulgore.",
  },

  greetings = {
    { id = "g_winds", text = "Winds be with you. You're welcome at Gev'rek, as long as you come in peace." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you, child of the isle. The ground still feels strange under your feet, doesn't it?" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to us. Sit, and tell me what the land below the sky taught you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "A druid. There are few of you among us. The Cenarion Circle will want to know you; let them, but remember it was the elements that raised you." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You've walked the elemental trials; I can see it in how you stand, and that is good." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Thunder Bluff opened its gates to us. We won't forget that, and we won't make the tauren regret it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ayessa Dawnsinger, and I lead the Windshapers. The Earthen Ring answered when we called, and the Horde gave us a place to stand." },
      },
      choices = {
        { text = "Why did you leave Skywall?", next = "skywall" },
        { text = "What do the Windshapers believe?", next = "believe" },
        { text = "And the High Order?", next = "order" },
        { text = "I've begun the trials, Elder. The elements answer me.", next = "shaman", when = { race = "Skyborne", class = "SHAMAN" } },
        { text = "I chose the blade over the trials. Is that a failing?", next = "warrior", when = { race = "Skyborne", class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "I'm a druid. Does that set me apart from the Windshapers?", next = "druid", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The Earthen Ring trained me too.", next = "ring", when = { race = { "Orc", "Troll", "Tauren" }, class = "SHAMAN" } },
        { text = "Winds be with you.", next = "END", fx = { affinity = 1, standing = { gevrek = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind is gentle today, and so is my patience." },
        { id = "h_again2", text = "Speak, then. Gev'rek keeps no secrets from its friends, or few." },
      },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "Then you carry the oldest thing we brought down from the sky. Our patrons fell silent, but the elements did not, and every Windshaper who learns to hear them is proof that the wind didn't abandon us entirely." },
      },
      choices = {
        { text = "I'll serve the elements, as our people always have.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The spirits left us once. I'll trust my own strength.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Why did the spirits go silent?", next = "shaman_silent" },
      },
    },
    shaman_silent = {
      lines = { { id = "ss_default", text = "I don't know, and anyone who tells you they know is guessing. They would never speak of the Windlord, and then one day they didn't speak at all. Listen hard down here, child, because the answer may be in the ground as easily as in the sky." } },
      choices = { { text = "I'll listen.", next = "BACK", fx = { affinity = 1, learn = { "al_aketh" } } } },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "No failing at all. The Peacekeepers carried blades on the isle, and Gev'rek needs blades as much as totems. Keep the camp safe while our shamans listen; that is its own kind of devotion." },
        { id = "wa_recruit", when = { origin = "skyborne_empyrean_recruit" },
          text = "You trained with the Empyrean Blades, didn't you? They guarded the Shal'nan once. Here there's no Shal'nan to guard, only us, and we're grateful." },
      },
      choices = { { text = "Then I'll guard the camp.", next = "BACK", fx = { affinity = 2, standing = { gevrek = 1 } } } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "It does, a little, and I'd rather say so than pretend. The elements raised you, but something in you answers the green as well, and the tauren druids here will understand that part better than I can." },
        { id = "dr_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "Nightclaw, from Shadowgale. They kept to themselves on the isle, and you'll be tempted to do the same here, so don't. The Horde trusts what it can see." },
      },
      choices = {
        { text = "I'll walk both paths, Elder.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I'm a Windshaper first, and always will be.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    ring = {
      lines = {
        { id = "ri_default", text = "Then we owe your teachers our home. The Earthen Ring answered when the sky was falling around us, and I'll never forget that. Sit with our initiates, if you'd like; they've only ever known one sky's spirits, and they could use another view." },
        { id = "ri_tauren", when = { race = "Tauren" },
          text = "A tauren shaman! Your people taught us how the Earth Mother is honored here, and our initiates have taken to it more readily than I expected. They ask me why the ground here hums at night, and I tell them to ask you." },
      },
      choices = { { text = "I'd be glad to sit with them.", next = "BACK", fx = { affinity = 2, standing = { gevrek = 1 } } } },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", text = "The spirits who sheltered us fell silent, and the isles began to drift apart. Then the Al'Aketh lit their beacon, and we left before the Windlord could answer it." },
      },
      choices = { { text = "That must have been hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "al_aketh" } } } },
    },
    believe = {
      lines = {
        { id = "b_default", text = "The four elements, and a debt to the wind that carried us. Our initiates pass the trials and take the sapta. The rest you learn by walking it." },
      },
      choices = {
        { text = "I'd like to learn.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The elements don't need my worship, and I don't need theirs.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    order = {
      lines = {
        { id = "o_default", text = "They went to the Kirin Tor; we went to the Earthen Ring. Some of what lies between us is old, and some of it is fresh graves. Don't ask me to pretend otherwise." },
      },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1, learn = { "two_orders" } } } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Sacred sites, old wrongs and new deaths. We'll speak of it another day, but not today." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes and shaved heads. If you ever see them on this side of the sky, tell me before you tell anyone else." } },
    windstones = { { id = "tp_windstones", text = "Power and coin both, on the isle. Down here they're a reminder of home, mostly." } },
    cenarion_circle = { { id = "tp_circle", text = "Our druids feel a pull toward them, and I won't stand in the way; the elements are generous enough to share." } },
    _none = { { id = "tp_none", text = "I don't know. Down here, there's a great deal I don't know yet." } },
  },
}
