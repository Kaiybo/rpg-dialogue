-- The Rebel Camp: soldiers of Kurzen's expedition who walked away from their colonel. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "doren", id = TODO_NPC("Lieutenant Doren"), name = "Lieutenant Doren",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "rebel_camp" }, temper = { "wary" }, values = { "dutiful", "loyal" },
  notices = { "kit", "soldier" },

  greetings = {
    { id = "g_halt", text = "Stop there and state your business. If you're one of the Colonel's, you won't be walking out of this camp." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. We've few enough friends this far from Stormwind." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Kurzen's men did that? Or the jungle? Either way, sit down before you fall down. We'll find you a patch." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like someone who's served. Then you'll understand that we didn't leave lightly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lieutenant Doren. We came into this jungle under Colonel Kurzen. Something took his mind, and his closest men with it. The rest of us left to find out what." },
        { id = "h_secrets", tags = { "news" }, when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "Private Thorsen was our man inside the Colonel's camp. Someone gave him away. I want the name." },
        { id = "h_herod", when = { questActive = TODO_QUEST("Bookie Herod") },
          text = "Bookie Herod takes bets from anyone with coin, and I think he takes coin from Kurzen too. Find out." },
        { id = "h_spy", when = { questActive = TODO_QUEST("The Spy Revealed!") },
          text = "So now we know who sold us. Good. Now we deal with it, and quietly." },
        { id = "h_patrol", when = { questActive = TODO_QUEST("Patrol Schedules") },
          text = "If we know when Kurzen's men march, we know when to hit them. Bring me their schedules." },
        { id = "h_kurzen", when = { questActive = TODO_QUEST("Colonel Kurzen") },
          text = "It's time. He won't come back to himself; we've waited long enough to be sure. End it." },
        { id = "h_roll", when = { metBefore = true }, text = "Called the roll this morning. Two short. They'll walk in by dusk, or they won't. I've stopped guessing which." },
      },
      choices = {
        { text = "What took his mind?", next = "mind" },
        { text = "I'm here to help.", next = "END", fx = { affinity = 2, standing = { rebel_camp = 1 }, learn = { "kurzen" } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    mind = {
      big = true,
      lines = {
        { id = "m_default", text = "Brother Nimetz thinks it was troll magic. To me it hardly matters what it was. The man who led us here is gone." },
      },
      choices = {
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "kurzen" } } },
        { text = "Then let's finish it.", next = "END", fx = { affinity = 2, trait = { stern = 1 }, learn = { "kurzen" } } },
      },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "He was a good officer once. Don't let anyone tell you different. That's what makes this hard." } },
    _none = { { id = "tp_none", text = "Ask the Brother. He does the thinking around here." } },
  },
}

P:NPC {
  key = "nimetz", id = TODO_NPC("Brother Nimetz"), name = "Brother Nimetz",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "rebel_camp" }, temper = { "earnest" }, values = { "devout", "curious" },
  notices = { "class", "craft" },

  greetings = {
    { id = "g_glass", text = "The Light keep you. Mind your step; I've glassware drying on every flat surface in this camp." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again. Any news is welcome here, even bad news." },
  },

  notice = {
    { id = "n_light", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A servant of the Light, out here. Then pray with me tonight. These men need it, and so do I." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Would you look at this residue for me? I've my suspicions, but a second eye never hurts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brother Nimetz. I came with the Colonel's expedition to tend the sick. Now I study what made them sick in the mind." },
        { id = "h_mystery", when = { questActive = TODO_QUEST("Kurzen's Mystery") },
          text = "I have a theory about what took the Colonel. I need proof before I say it aloud." },
        { id = "h_witchery", when = { questActive = TODO_QUEST("Troll Witchery") },
          text = "Troll magic, I'm nearly sure of it now. Bring me what I asked for and we'll be certain." },
        { id = "h_maizoth", tags = { "news" }, when = { questActive = TODO_QUEST("Mai'Zoth") },
          text = "Mai'Zoth. An ogre mage, and the root of it all. I swore he'd die before anyone else lost their mind the way the Colonel did." },
        { id = "h_dreams", when = { metBefore = true }, text = "One of the men woke screaming again. The Colonel's name. Whatever touched Kurzen's mind touches their dreams too." },
      },
      choices = {
        { text = "What made them sick?", next = "elixir" },
        { text = "The Light keep you, Brother.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    elixir = {
      lines = {
        { id = "e_default", text = "Kurzen's medicine men hand out an elixir. It makes a frightened man brave and a brave man reckless. I'm not done studying it, and I'm certainly not drinking it." },
      },
      choices = { { text = "Be careful, Brother.", next = "END", fx = { affinity = 2, trait = { curious = 1 }, learn = { "kurzen" } } } },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "I prayed for him every night. Now I pray for whoever finally stops him." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no answer. I'll add it to my list of questions; it's a long list." } },
  },
}

P:NPC {
  key = "thorsen", id = TODO_NPC("Private Thorsen"), name = "Private Thorsen",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "quest",
  communities = { "rebel_camp" }, temper = { "wary" }, values = { "loyal", "brave" },
  notices = { "stealth", "kit" },

  greetings = {
    { id = "g_careful", text = "Keep your voice down. This part of the jungle has ears, and some of them belong to Kurzen." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You ran into Kurzen's men, didn't you? They fight like they've got nothing left to lose. They haven't." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Good. Stay low. That's how I lived through Kurzen's camp. Mostly." } },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Private Thorsen. I spent time inside Kurzen's force, pretending to be one of them, and nearly didn't come out. I know what they're planning. Some of it." },
        { id = "h_supplies", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Supplies from Booty Bay? Bless Krazek, he remembered. I've been eating roots for a week." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "Kurzen's men carry orders, and orders are paper, and paper talks. Bring me what they carry. Lieutenant Doren needs to know what I know." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I still wake up reaching for their uniform. Then I remember which side I'm on. It takes a moment longer than I'd like." },
      },
      choices = { { text = "I'll help you.", next = "END", fx = { affinity = 2, align = { order = 1 } } } },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "The Colonel's not himself. His officers aren't either. Whatever's in that compound is in their heads now." } },
    _none = { { id = "tp_none", text = "I only know Kurzen. That's more than enough." } },
  },
}
