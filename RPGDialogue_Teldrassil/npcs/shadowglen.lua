-- Shadowglen: the glade under Aldrassil where young night elves begin. Voice: bibles/teldrassil.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ilthalaine", id = TODO_NPC("Conservator Ilthalaine"), name = "Conservator Ilthalaine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "delighted" }, values = { "kind", "devout" },
  notices = { "greenness", "class" },

  greetings = {
    { id = "g_glade", text = "Look at the light through the leaves. Every morning it's new, and every morning I'm glad of it." },
    { id = "g_back", when = { metBefore = true }, text = "In the glade again. Does it still take your breath? It still takes mine." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Newly woken to the world, and already sent to me. Let's begin gently. The forest will be less gentle later." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A young druid! There's word waiting for you from your teacher. The glade has been expecting you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Conservator Ilthalaine. I keep the balance in Shadowglen. It's a lovely place, and lovely places need keeping more than most." },
        { id = "h_balance", tags = { "news" }, when = { questActive = TODO_QUEST("The Balance of Nature") },
          text = "Too many young nightsabers and thistle boars, and the glade suffers for it. Thin them, gently. The balance is a matter of numbers, not hatred." },
        { id = "h_sigil", when = { questActive = TODO_QUEST("Verdant Sigil") },
          text = "Your teacher's sigil came for you. Go and find them in Aldrassil. They'll show you the next step." },
      },
      choices = {
        { text = "What does keeping the balance mean?", next = "balance" },
        { text = "Thank you, Conservator.", next = "END" },
      },
    },
    balance = {
      big = true,
      lines = {
        { id = "b_default", text = "That nothing takes more than its share. Not the beasts, not the furbolgs, not us. When one thing grows too much, the rest of the forest pays for it." },
      },
      choices = { { text = "I'll remember that.", next = "END", fx = { affinity = 2, align = { light = 1 }, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle teaches what I try to practice. They're better at it than I am, but I'm more cheerful about it." } },
    _none = { { id = "tp_none", text = "No idea! Isn't it lovely, though, not knowing things? It leaves room." } },
  },
}

P:NPC {
  key = "melithar", id = TODO_NPC("Melithar Staghelm"), name = "Melithar Staghelm",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "earnest" }, values = { "dutiful", "patient" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_tree", text = "Peace, young one. Aldrassil is listening, as it always is. Speak kindly near it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the glade. The first lessons are the slowest. They're also the ones you'll lean on longest." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Ah, you've found the bear. Careful of the steps; Aldrassil's roots were not made for paws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Melithar Staghelm. I tend Aldrassil's roots and the young ones who come to it. Both need patience." },
        { id = "h_woodland", tags = { "news" }, when = { questActive = TODO_QUEST("The Woodland Protector") },
          text = "Seek out the woodland protector at the glade's edge. The grells have been spoiling the forest, and help is needed there." },
      },
      choices = {
        { text = "Are you kin to the Arch Druid?", next = "kin" },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Everyone asks. My work is here, at the roots. Whatever name I carry, the tree doesn't care, and neither should you." } },
      choices = { { text = "Fair enough.", next = "END" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Every druid in Shadowglen hopes the Circle will notice them one day. Few say so aloud." } },
    _none = { { id = "tp_none", text = "I can't say. Ask Tenaron, in Aldrassil." } },
  },
}

P:NPC {
  key = "tenaron", id = TODO_NPC("Tenaron Stormgrip"), name = "Tenaron Stormgrip",
  bible = "bibles/teldrassil.md", role = "noble", tier = "major",
  communities = { "shadowglen" }, temper = { "warm" }, values = { "wise", "kind" },
  notices = { "greenness", "race" },

  greetings = {
    { id = "g_aldrassil", text = "Welcome to the top of Aldrassil. From here you can see most of Shadowglen. It looks small from up here. It isn't." },
    { id = "g_back", when = { metBefore = true }, text = "You've made the climb again. I always have time for those who climb." },
  },

  notice = {
    { id = "n_ready", cat = "greenness", when = { minLevel = 5, maxLevel = 9 },
      text = "You've grown since you came to the glade. It shows in how you stand. Soon you'll go down for the last time." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Child of the kaldorei. The forest remembers us even when we forget it. Remember it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tenaron Stormgrip. I watch over Shadowglen from Aldrassil's crown. Every young elf who leaves the glade passes me on the way." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Tenaron's Summons") },
          text = "You came when I called. Good. There's a task that will take you beyond the glade, and you're ready for it." },
        { id = "h_crown", when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Take this vial to the moonwell and fill it. Then carry it down to Dolanaar. Corithras will know what to do with it." },
      },
      choices = {
        { text = "What lies beyond the glade?", next = "beyond" },
        { text = "I'll go when I'm ready.", next = "END" },
      },
    },
    beyond = {
      big = true,
      lines = {
        { id = "bd_default", text = "Dolanaar, then Darnassus, then the whole world below the tree. Some of it is beautiful. Some of it is sick. You'll learn to tell which. Go with my blessing." },
      },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 2, align = { light = 1 }, standing = { shadowglen = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That is beyond what I can see from here, and I can see a long way." } },
  },
}

P:NPC {
  key = "dirania", id = TODO_NPC("Dirania Silvershine"), name = "Dirania Silvershine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "wistful" }, values = { "kind", "loyal" },
  notices = { "pet" },

  greetings = {
    { id = "g_home", text = "All isn't well in the glade, I know. But coming back here always feels like coming home." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine companion. Be good to it. Friends are what get us through the dark parts of the forest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dirania Silvershine. I've come back to Shadowglen to help a friend. He's in trouble, and I can't fix it alone." },
        { id = "h_friend", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("A Good Friend") }, { questActive = TODO_QUEST("A Friend in Need") } } },
          text = "Iverron went into the spiders' cave and came back poisoned. Please, go and see him." },
        { id = "h_antidote", when = { questActive = TODO_QUEST("Iverron's Antidote") },
          text = "The antidote needs what the glade can give: herbs, and something from the spiders themselves. Hurry, if you can." },
      },
      choices = { { text = "I'll help him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my mind is on Iverron." } },
  },
}

P:NPC {
  key = "gilshalan", id = TODO_NPC("Gilshalan Windwalker"), name = "Gilshalan Windwalker",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "solitary" }, values = { "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_steps", text = "Oh. Hello. I was only sitting. The steps are good for sitting." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You work with venoms and draughts? Then you'll understand why I need what I need." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gilshalan Windwalker. I study the Webwood spiders in the cave to the northwest. From a distance, mostly." },
        { id = "h_venom", tags = { "news" }, when = { questActive = TODO_QUEST("Webwood Venom") },
          text = "I need their venom sacs. All of the venom, none of the spider. You understand." },
        { id = "h_egg", when = { questActive = TODO_QUEST("Webwood Egg") },
          text = "There's an egg deep in the cave. Bring it out. Carefully. I'd like to know what the mother has been eating." },
      },
      choices = { { text = "I'll go to the cave.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Spiders, I know. Most other things, less so." } },
  },
}
