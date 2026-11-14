-- Deathknell: where the Forsaken wake. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mordo", id = TODO_NPC("Undertaker Mordo"), name = "Undertaker Mordo",
  bible = "bibles/tirisfal.md", role = "worker", tier = "quest",
  communities = { "deathknell" }, temper = { "matter_of_fact" }, values = { "practical" },
  notices = { "greenness" },

  greetings = {
    { id = "g_grave", text = "Ah. You're up. Sit a moment if you need to. The first few minutes are the strangest." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still yourself. That's a fine sign." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Look at your hands. Go on. Yes, they're yours. No, they won't get better. You'll stop minding." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Undertaker Mordo. I tend the graves here, and sometimes the graves tend to stir. You stirred. Welcome back." },
        { id = "h_rude", tags = { "news" }, when = { questActive = TODO_QUEST("Rude Awakening") },
          text = "Shadow Priest Sarvis will explain the rest. He's in the chapel. Try not to stare at the others; they're new too." },
      },
      choices = {
        { text = "What happened to me?", next = "what" },
        { text = "I'll find Sarvis.", next = "END" },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "The plague took you, and the Scourge raised you. The Dark Lady broke their hold, so now you're your own again. Mostly." },
      },
      choices = { { text = "Mostly?", next = "END", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I bury things. I don't explain them. Ask Sarvis." } },
  },
}

P:NPC {
  key = "sarvis", id = TODO_NPC("Shadow Priest Sarvis"), name = "Shadow Priest Sarvis",
  bible = "bibles/tirisfal.md", role = "priest", tier = "major",
  communities = { "deathknell" }, temper = { "sardonic" }, values = { "loyal", "sharp" },
  notices = { "class" },

  greetings = {
    { id = "g_chapel", text = "Another one walks in under their own power. Splendid. Death couldn't keep you, so let's see what you're good for." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon. Death seems to suit you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I'll admit the Light makes me uneasy. It used to make me feel safe. Step back a little while you're glowing, if you don't mind." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Whatever you prayed to before, it didn't save you. The shadows were here when you woke. Think about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadow Priest Sarvis. We Forsaken have already died once. It's hard to take death seriously after that." },
        { id = "h_mindless", tags = { "news" }, when = { questActive = TODO_QUEST("The Mindless Ones") },
          text = "Not everyone wakes as themselves. The mindless shamble about the graves. Put them back down; they're past helping." },
        { id = "h_rattle", when = { questActive = TODO_QUEST("Rattling the Rattlecages") },
          text = "Rattlecage skeletons in the fields. Scourge leftovers. Break them. They won't mind." },
        { id = "h_path", when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "A scroll came for you. It reeks of the Light. Read it over there, please, not here. Then go to Aramis." },
      },
      choices = {
        { text = "Who are the Forsaken?", next = "forsaken" },
        { text = "I'll get to work.", next = "END" },
      },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "f_default", text = "We're what the Scourge made and the Dark Lady freed. The living fear us; the Lich King wants us back. We serve Lady Sylvanas, and we answer to no one else." },
      },
      choices = {
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And what do we want?", next = "want" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "To exist without asking anyone's permission. It's a modest ambition. The world finds it outrageous." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They burn what they don't understand. They don't understand very much." } },
    _none = { { id = "tp_none", text = "A good question for someone with more patience than I have." } },
  },
}

P:NPC {
  key = "arren", id = TODO_NPC("Executor Arren"), name = "Executor Arren",
  bible = "bibles/tirisfal.md", role = "soldier", tier = "quest",
  communities = { "deathknell" }, temper = { "clipped" }, values = { "dutiful", "loyal" },
  notices = { "kit" },

  greetings = {
    { id = "g_post", text = "You. Can you hold a weapon? Then Deathknell needs every pair of hands that still works." },
    { id = "g_back", when = { metBefore = true }, text = "Report." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Crusade did that? They'll do worse if you let them. Get it fixed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Executor Arren. I keep Deathknell. The Scarlet Crusade has a camp to the southeast, and they're bold enough to come for us here." },
        { id = "h_crusade", tags = { "news" }, when = { questActive = TODO_QUEST("The Scarlet Crusade") },
          text = "Their camp is close. Too close. Thin them out, and bring back proof." },
        { id = "h_messenger", when = { any = { { questActive = TODO_QUEST("The Red Messenger") }, { questActive = TODO_QUEST("Vital Intelligence") } } },
          text = "They send runners between their camps. Whatever those runners carry, I want it, and so will Brill." },
        { id = "h_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "You've earned a breath. There's a traveler camped on the road by Brill. Not one of the Crusade, she claims. See what she's about." },
      },
      choices = {
        { text = "Why do the Crusaders hate us?", next = "hate" },
        { text = "Understood, Executor.", next = "END", fx = { affinity = 1, standing = { deathknell = 1 } } },
      },
    },
    hate = {
      lines = { { id = "ha_default", text = "Because we remind them what the plague did. Easier to burn us than to look at us. I don't need them to understand. I need them gone." } },
      choices = { { text = "Then they'll be gone.", next = "END", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Zealots in red. Ask Executor Zygand in Brill; he's been fighting them longer than I have." } },
    _none = { { id = "tp_none", text = "Not my concern. Deathknell is." } },
  },
}

P:NPC {
  key = "aramis", id = TODO_NPC("Aramis Hammerhand"), name = "Aramis Hammerhand",
  bible = "bibles/tirisfal.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "steadfast" }, values = { "devout", "patient" },
  notices = { "class" },

  greetings = {
    { id = "g_church", text = "Come in. The church still remembers what it was for, even if the town has forgotten." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "You came. I wondered whether you would. Many don't." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "It hurts, doesn't it? The Light, in this body. It hurts me too. Don't let go of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Aramis Hammerhand. I teach those of us who woke still holding the Light. There aren't many. I'd like there to be more." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "You read the scroll. Then your training can begin. Whatever you do, don't turn away from the Light. It hasn't turned away from you." },
        { id = "h_rediscover", when = { any = { { questActive = TODO_QUEST("Rediscovering the Light") }, { questActive = TODO_QUEST("Coming to Terms") } } },
          text = "The pain is a forge. It burns, and what's left is stronger. That's the whole of the lesson, and it takes years." },
      },
      choices = {
        { text = "Why does the Light still answer us?", next = "why" },
        { text = "I'll keep training.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "y_default", text = "I don't know. I've stopped needing to know. It answers, and it hurts, and it answers again. That's enough faith for one dead man." },
      },
      choices = { { text = "It's enough for me too.", next = "END", fx = { affinity = 2, align = { light = 2 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I can't say. Ask me about the Light; I've thought about little else." } },
  },
}
