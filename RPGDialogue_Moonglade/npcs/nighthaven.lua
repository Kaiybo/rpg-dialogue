-- Nighthaven and the Shrine of Remulos. Voice: bibles/nighthaven.md
-- Moonglade is neutral: nothing here assumes the player's faction.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "remulos", id = TODO_NPC("Keeper Remulos"), name = "Keeper Remulos",
  bible = "bibles/nighthaven.md", role = "noble", tier = "major",
  communities = { "nighthaven" }, temper = { "serene" }, values = { "protective", "firm" },
  spiritSensitive = true,
  notices = { "form", "fel", "race" },

  greetings = {
    { id = "g_glade", text = "Be welcome in Moonglade, little one. Every creature that comes in peace may rest here." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A child of the Circle. Come, walk with me a little, for the glade is glad of you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The trees remember your step, and so do I." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "You wear the bear well: heavy, patient, slow to anger. Let the shape teach you while you wear it." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Swift and quiet, I see. The cat's is a sharp lesson, so mind it doesn't teach you only how to hunt." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "The fel clings to you like smoke to a cloak. You may stand here, but you may not call upon it here. Do we understand each other?" },
    { id = "n_skyborne_druid", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "You honour the winds first, and the moon after, if at all; I know it. The Circle has never asked every druid to kneel to the same sky." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Remulos, son of Cenarius, keeper of this glade. Moonglade is the heart of the druids' craft. I guard it for all of them, whatever banners they fly beyond its hills." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "The tauren came to the Circle late and were made welcome. Not everyone in Darnassus wished it, but I did, and I do still." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Child of the forest, tell me, does the new tree on Teldrassil sing to you? I listen for it, and I do not hear what I hoped to." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Shen'dorei, the hidden people, come out of hiding. The winds kept you a long while, and I hope they taught you gently." },
      },
      choices = {
        { text = "What is the Cenarion Circle?", next = "circle" },
        { text = "What troubles you, Keeper?", next = "troubles" },
        { text = "I'll leave you to the glade.", next = "END", fx = { affinity = 1 } },
      },
    },
    circle = {
      lines = {
        { id = "c_default", text = "Druids of every people who will hear the wild: elves, tauren, others now. We keep the balance where we can, and grieve it where we can't." },
      },
      choices = { { text = "I'd like to help keep it.", next = "END", fx = { affinity = 2, learn = { "cenarion_circle" }, align = { order = 1 } } } },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The Emerald Dream was the purest of places, and something has crept into it. Druids who walk there come back changed, or not at all, and I watch, and I do not like what I see." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stopped", fx = { learn = { "cenarion_circle" } } },
        { text = "I'll be careful in my dreams.", next = "END", fx = { affinity = 1 } },
      },
    },
    stopped = {
      lines = { { id = "s_default", text = "Everything can be stopped, little one, if enough hands hold it back. When you are strong, come and lend me yours." } },
      choices = { { text = "I will.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "My father's children, in a way, and not all of them agree with one another. That is how I know it lives." } },
    worgen = { { id = "tp_worgen", text = "Wolves that are not wolves, in the human forests. I have heard of them, and I am troubled, for such things do not happen without a cause." } },
    _none = { { id = "tp_none", text = "That is beyond the glade. Rabine keeps better track of the world than I do." } },
  },
}

P:NPC {
  key = "rabine", id = TODO_NPC("Rabine Saturna"), name = "Rabine Saturna",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "grave" }, values = { "careful", "loyal" },
  notices = { "lore", "form" },

  greetings = {
    { id = "g_house", text = "Be at ease here. I keep the Keeper's house in order, and the Keeper's visitors. Speak, please." },
    { id = "g_back", when = { metBefore = true }, text = "Again you come to Nighthaven, and I don't think that's chance. I don't believe in chance." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader, good. The world remembers less than it thinks it does, and readers keep the rest." },
    { id = "n_form", cat = "form", when = { form = "travel" },
      text = "You came in at a run on four legs, so rest them. Nighthaven isn't going anywhere, and neither are its troubles." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rabine Saturna, majordomo to Keeper Remulos. He watches the glade; I watch everything else, so he needn't. It's a quieter job than it sounds, most days." },
        { id = "h_locket", tags = { "news" }, when = { questActive = TODO_QUEST("Unlocking the Secrets Within") },
          text = "A locket, smoke-stained, carrying memories that aren't yours. Let me look, gently; some things remember too much to be opened quickly." },
        { id = "h_locket_done", when = { questDone = TODO_QUEST("Unlocking the Secrets Within") },
          text = "A son, a war, an old grief that never closed. I'll not say more, for some memories belong to their owners, even when they're dead." },
        { id = "h_remulos", when = { heardLine = "remulos.t_default" },
          text = "The Keeper spoke to you of the Dream? He doesn't tell many, so take it as a sign of trust, and a warning, both." },
      },
      choices = {
        { text = "What happens in Nighthaven?", next = "village" },
        { text = "You don't believe in chance?", next = "chance" },
        { text = "Goodbye, Rabine.", next = "END" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "Druids come to learn and rest. Wardens keep the peace between peoples who'd otherwise not share a road. And I keep the ledger of who owes the Circle what." } },
      choices = { { text = "...", next = "END", fx = { learn = { "cenarion_circle" } } } },
    },
    chance = {
      big = true,
      lines = {
        { id = "c_default", text = "I've lived long enough to see the same patterns come round twice. When something seems like chance, it's usually a thread we haven't followed yet." },
      },
      choices = {
        { text = "Then I'll follow it.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Sometimes chance is just chance.", next = "just" },
      },
    },
    just = {
      lines = { { id = "j_default", text = "Perhaps. Come back in a few hundred years and tell me if you still think so." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Keeper's charge, the Archdruid's pride, and my paperwork, though not in that order, some days." } },
    _none = { { id = "tp_none", text = "I'd have to look into it, and I do look into things. Give me time." } },
  },
}

P:NPC {
  key = "dendrite", id = TODO_NPC("Dendrite Starblaze"), name = "Dendrite Starblaze",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "formal" }, values = { "balance", "dutiful" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_trial", text = "Balance be with you. If you've come for the trials, you've come to the right elf. If not, the village is lovely this time of year." },
    { id = "g_druid", when = { class = "DRUID", maxLevel = 12 }, text = "A young druid, fresh from the trainer? Good. The Circle has been expecting you, even if you didn't know it." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the Great Bear Spirit's gift sits well on you. Remember where you learned it." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "Not a druid, are you? You're welcome all the same, though the trials are another matter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Dendrite Starblaze, and I guide young druids through the Circle's first trials: the bear, the cleansing, the water. Each one teaches you something your trainer couldn't." },
        { id = "h_bear", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "West along the mountains, you'll find the Great Bear Spirit, so listen to it. It doesn't say much, which makes what it says worth hearing." },
        { id = "h_bear_done", when = { questDone = TODO_QUEST("Great Bear Spirit"), maxLevel = 15 },
          text = "The Bear has seen you; I can tell by how you stand, rooted. Go back to your trainer now and claim what you've earned." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Power over Poison") },
          text = "Poison is only nature turned the wrong way, so learn to turn it back. That's a druid's whole art, in small." },
        { id = "h_lake", tags = { "news" }, when = { questActive = TODO_QUEST("Trial of the Lake") },
          text = "The lake holds what you need. Dive, and keep diving until the water feels like a friend rather than a threat." },
        { id = "h_sealion", when = { questActive = TODO_QUEST("Trial of the Sea Lion") },
          text = "The sea lion's trial is out where the land ends. Our flight masters will carry you; tell them the Circle sent you." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea's yours now, as much as the forest. Few druids feel at home in both, so try to be one of the few." },
        { id = "h_skyborne", when = { race = "Skyborne", class = "DRUID" },
          text = "A druid of the shen'dorei! There are few of you, I'm told, and you look to the winds before the moon, but the trials don't mind which. Balance is balance." },
      },
      choices = {
        { text = "What are the trials for?", next = "trials" },
        { text = "Thank you, Dendrite.", next = "END" },
      },
    },
    trials = {
      big = true,
      lines = {
        { id = "t_default", text = "A druid who can wear a shape but doesn't understand it is just a person in a costume. The trials teach the understanding. The shapes come after." },
      },
      choices = {
        { text = "I understand.", next = "END", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "The shapes seem like the fun part.", next = "fun" },
      },
    },
    fun = {
      lines = { { id = "f_default", text = "They are, and I'd never say otherwise. But a bear that doesn't know why it's a bear makes a very poor bear." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Our order and our duty, and Nighthaven is its hearth." } },
    _none = { { id = "tp_none", text = "That's not my trial to teach, but Loganaar might know, or Rabine." } },
  },
}

P:NPC {
  key = "loganaar", id = TODO_NPC("Loganaar"), name = "Loganaar",
  bible = "bibles/nighthaven.md", role = "trainer", tier = "service",
  communities = { "nighthaven" }, temper = { "calm" }, values = { "balance", "kind" },
  notices = { "class" },

  greetings = {
    { id = "g_calm", text = "Peace, friend. Even inside these stone walls it's there, if you stop long enough to find it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "{g:Brother|Sister}, come in. If you're ready to learn, then I'm ready to teach." },
  },

  notice = {
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You're no druid, but sit if you like. The quiet here costs nothing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Loganaar, and I train the druids who find their way to Nighthaven. Balance isn't somewhere you go; it's something you carry, and I help you pack." },
        { id = "h_dream", when = { minLevel = 20, class = "DRUID" },
          text = "One day the Dream will call you, and you'll sleep a long while among the purest of things. Learn all you can awake, first." },
        { id = "h_tea", when = { metBefore = true }, text = "Sit, if you have a moment, not for training but only to sit. Most druids forget to, and it shows in their bears." },
      },
      choices = {
        { text = "What brought you to Nighthaven?", next = "why" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "How do you find balance?", next = "balance" },
        { text = "Farewell.", next = "END" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "Look inward before you look outward. Most of what's out of balance in the world started out of balance in someone." } },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "The quiet. Everywhere else the world was asking something of me, but here it only asks that I listen, and I've found that's plenty." },
      },
      choices = { { text = "I'll try to listen.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Home, for those of us who've no other, and for some who have." } },
    _none = { { id = "tp_none", text = "Ask the quiet first, and then ask Rabine." } },
  },
}

P:NPC {
  key = "great_bear", id = TODO_NPC("Great Bear Spirit"), name = "Great Bear Spirit",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "patient" }, values = { "strength", "patience" },
  spiritSensitive = true,
  notices = { "form" },

  greetings = {
    { id = "g_calm", text = "The great bear looks at you, calm and unhurried. Its voice, when it comes, is in your chest more than your ears." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "The spirit's gaze softens. You wear its shape, and it seems to know you, the way kin know kin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Old as the hills you walked to reach me, I am, and I do not hurry. Sit, and when you are still, I will speak." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "You come to learn the bear, so learn this first: strength that cannot wait is not strength. It is only noise." },
        { id = "h_not", when = { ["not"] = { class = "DRUID" } },
          text = "Not of the Circle, this one. Still, you came all this way to sit with an old bear. That is a kind of wisdom too." },
        { id = "h_return", when = { metBefore = true }, text = "You came back, and most do not. They think one visit is a lesson learned, when it is only a lesson begun." },
      },
      choices = {
        { text = "What does the bear teach?", next = "teach" },
        { text = "(Sit quietly a while.)", next = "sit", fx = { affinity = 2 } },
      },
    },
    teach = {
      big = true,
      lines = {
        { id = "t_default", text = "To endure, and to protect what stands behind you, and to sleep when the world is cold and wake when it is ready. Most of what is worth doing is waiting well." },
      },
      choices = { { text = "I'll remember.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
    sit = {
      lines = { { id = "s_default", text = "Good; few sit. Most come wanting, and leave still wanting, but you may come back whenever the world is too loud." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The bear says nothing. It does not seem to think the question needs an answer." } },
  },
}

P:NPC {
  key = "silva", id = TODO_NPC("Silva Fil'naveth"), name = "Silva Fil'naveth",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "warm" }, values = { "dutiful" },
  notices = { "class" },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Alliance" }, text = "Going home? The Circle's hippogryphs will carry you to Rut'theran, so climb on." },
    { id = "g_horde", when = { class = "DRUID", faction = "Horde" }, text = "Your flight's with Bunthen, friend, over by the wind riders. He'll see you to Thunder Bluff." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "I'm sorry, but these birds fly for druids only. The Circle's rule, not mine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Silva, and I keep the Circle's hippogryphs. They fly one road only, to Rut'theran by Teldrassil, and only for druids; they're very particular." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'd rather have your own wings, I imagine. These ones bite less than you'd think, if only slightly less." },
        { id = "h_names", when = { metBefore = true }, text = "The oldest of my hippogryphs won't fly unless I say her name first, and politely. I've stopped finding it strange." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night flights are the best. Teldrassil's lights come up out of the sea like someone's left a lantern for you." },
      },
      choices = {
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Farewell.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I fly birds; Rabine knows everything else." } },
  },
}

P:NPC {
  key = "bunthen", id = TODO_NPC("Bunthen Plainswind"), name = "Bunthen Plainswind",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Horde" }, text = "Earth Mother keep you. The wind rider's saddled; Thunder Bluff is a long way and a short flight." },
    { id = "g_alliance", when = { class = "DRUID", faction = "Alliance" }, text = "Your flight's with Silva, little friend; her hippogryphs go to Rut'theran." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "You're no druid, and these riders fly for the Circle alone. I'm sorry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bunthen Plainswind is my name, and I keep the Circle's wind riders, who fly for druids to Thunder Bluff. It's a short road through the sky, from one home to another." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "From the sky to the Bluff, your folk came, I hear, and the Earthen Ring vouched for you. The winds are kind to you. Let my riders be kind too." },
        { id = "h_rider", when = { metBefore = true }, text = "My riders grumble at Nighthaven's quiet, because they like the wind on the Bluff. So do I, if I'm honest, but don't tell the Keeper." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Mu'sha's eye is open over the lake, and it's a good night for flying. The riders know it too; listen to them fidget." },
      },
      choices = {
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Farewell.", next = "END" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle took my people in when others would not, and we remember that. The tauren remember everything kind." } },
    _none = { { id = "tp_none", text = "I fly the riders, friend. Ask the elves in the village." } },
  },
}
