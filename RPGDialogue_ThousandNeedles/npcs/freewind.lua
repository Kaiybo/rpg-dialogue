-- Freewind Post: tauren on the mesas above Thousand Needles. Voice: bibles/thousandneedles.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longhorn", id = TODO_NPC("Cliffwatcher Longhorn"), name = "Cliffwatcher Longhorn",
  bible = "bibles/thousandneedles.md", role = "soldier", tier = "major",
  communities = { "freewind" }, temper = { "grim" }, values = { "dutiful", "protective" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_watch", text = "From up here I see the centaur long before they see us. That is why we built on the mesas." },
    { id = "g_back", when = { metBefore = true }, text = "The canyon gave you back. Good. It keeps more than it returns." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Galak marked you. Let it heal, then remember it the next time you see their banners." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains, this far into the Needles. Stand with us on the mesa; it is good to see more horns." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Cliffwatcher Longhorn. Freewind keeps watch over the Needles. The Galak raid whatever walks below us, and we answer them." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("Message to Freewind Post") },
          text = "You carry word from the plains. Let me read it. News climbs to the mesas slowly." },
        { id = "h_pacify", when = { questActive = TODO_QUEST("Pacify the Centaur") },
          text = "The Galak have bled us long enough. Thin their raiders, and the canyon roads will breathe again." },
        { id = "h_spying", when = { questActive = TODO_QUEST("Grimtotem Spying") },
          text = "The Grimtotem on Darkcloud Pinnacle keep their own counsel. Too much of it. Find out what they plan." },
        { id = "h_arnak", when = { questActive = TODO_QUEST("Wanted - Arnak Grimtotem") },
          text = "Arnak Grimtotem. The poster says murder. If it speaks true, he has earned whatever finds him." },
        { id = "h_family", when = { questActive = TODO_QUEST("Family Tree") },
          text = "My brother Nataka. I write, and he does not answer. A year now. If you find him, tell him I am still writing." },
      },
      choices = {
        { text = "Why build so high?", next = "high" },
        { text = "What do you know of the Grimtotem?", next = "grimtotem" },
        { text = "Earth Mother watch over you.", next = "END", fx = { affinity = 1 } },
      },
    },
    high = {
      lines = {
        { id = "hi_default", text = "Centaur don't climb. Harpies do, but harpies are a nuisance. The Galak are a war." },
      },
      choices = { { text = "I'll help you fight it.", next = "END", fx = { affinity = 2, standing = { freewind = 1 } } } },
    },
    grimtotem = {
      big = true,
      lines = {
        { id = "gr_default", text = "They are tauren who want nothing to do with the Horde. That is their right. What they do on that pinnacle in the dark is not." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1, learn = { "grimtotem" } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Watch them. Smile if you must. But watch them." } },
    _none = { { id = "tp_none", text = "That is beyond what I can see from this mesa." } },
  },
}

P:NPC {
  key = "rau", id = TODO_NPC("Rau Cliffrunner"), name = "Rau Cliffrunner",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "freewind" }, temper = { "intent" }, values = { "curious", "patient" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_study", text = "Ah, a visitor. Forgive the mess; I've been staring at centaur carvings since dawn." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hoped you might. I've had questions piling up." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Circle's students. Then you'll understand why moonwell water is never carried lightly." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Easy, friend. These tablets are older than both of us, and you're wider than the doorway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rau Cliffrunner. The centaur keep a relic in their hold, the Cloven Hoof, behind a flame that never goes out. I'd very much like to know why." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("The Sacred Flame") },
          text = "The flame guarding their relic won't yield to steel. Water from a moonwell might. Bring me some, however you manage it." },
      },
      choices = {
        { text = "What is the Cloven Hoof?", next = "hoof" },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    hoof = {
      big = true,
      lines = {
        { id = "ho_default", text = "Something strange. I can feel it from here, the way you feel weather turning. Centaur history, perhaps. Or centaur trouble." },
      },
      choices = { { text = "Maybe both.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Hamuul's teachers. I owe them more than I can say; the land speaks to me because they taught me to listen." } },
    _none = { { id = "tp_none", text = "I don't know, but now I want to. Thank you for that." } },
  },
}

P:NPC {
  key = "hagar", id = TODO_NPC("Hagar Lightninghoof"), name = "Hagar Lightninghoof",
  bible = "bibles/thousandneedles.md", role = "scholar", tier = "quest",
  communities = { "freewind" }, temper = { "eager" }, values = { "curious" },
  notices = { "pet" },

  greetings = {
    { id = "g_egg", text = "You haven't seen an egg, have you? A very large one? No? Ah, well. It was worth asking." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I've been waiting to tell somebody. Anybody, really." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "A fine beast. Hatched or born? Forgive me; eggs are on my mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hagar Lightninghoof, of Thunder Bluff. I heard these canyons hid an egg unlike anything a wind serpent ever laid, so I came to see for myself." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("Alien Egg") },
          text = "The serpents guard it like a hoard. Get past them and bring the egg here. Gently, please. Very gently." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpent Wild") },
          text = "It hatched, and I know the shape from the old tales: Arikara, the Vengeance. Motega Firemane must hear of this." },
      },
      choices = {
        { text = "What kind of egg?", next = "egg" },
        { text = "Good luck with your egg.", next = "END" },
      },
    },
    egg = {
      lines = {
        { id = "e_default", text = "Too large, too warm, and the wrong color entirely. The serpents won't leave it alone. Either they think it's theirs, or they're afraid of it." },
      },
      choices = { { text = "Which do you think?", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Unless it hatches. Then it's my field." } },
  },
}

P:NPC {
  key = "thalia", id = TODO_NPC("Thalia Amberhide"), name = "Thalia Amberhide",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "freewind" }, temper = { "bitter" }, values = { "loyal", "stern" },
  notices = { "race" },

  greetings = {
    { id = "g_inn", text = "Sit if you like. Don't expect me to be good company." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you come with news, or just for the stew?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're tauren. Then you know the Grimtotem should be family. That's what makes it worse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thalia Amberhide. People have gone missing from these canyons, and every trail leads up the Grimtotem's pinnacle. Some come home. Not enough." },
        { id = "h_free", tags = { "news" }, when = { questActive = TODO_QUEST("Free At Last") },
          text = "Go up there, then. Bring our people down. And if a Grimtotem stands in your way, don't hesitate." },
      },
      choices = {
        { text = "Why so bitter?", next = "bitter" },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    bitter = {
      big = true,
      lines = {
        { id = "b_default", text = "Because the Grimtotem are tauren, and they do this to tauren. A centaur I could hate cleanly." },
      },
      choices = {
        { text = "Then let's make it right.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "grimtotem" } } },
        { text = "...", next = "END", fx = { learn = { "grimtotem" } } },
      },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Ask me again when they've answered for it." } },
    _none = { { id = "tp_none", text = "I don't care about that. Not today." } },
  },
}

P:NPC {
  key = "abeqwa", id = TODO_NPC("Innkeeper Abeqwa"), name = "Innkeeper Abeqwa",
  bible = "bibles/thousandneedles.md", role = "innkeeper", tier = "service",
  communities = { "freewind" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Rest here, traveler. The wind sings over the mesa at night; most guests find it soothing." },
    { id = "g_home", when = { homeInn = { "Freewind Post" } }, text = "Back to your own bed above the canyons. I kept the blankets dry." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked a hard road back from somewhere darker. Sit. Nothing on this mesa needs you for an hour." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Careful near the edge in that state. The canyon doesn't forgive a misstep." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The inn at Freewind. Beds, stew, and a view that will turn your knees to water if you look down. So don't look down." },
      },
      choices = {
        { text = "What's the news on the mesa?", next = "news" },
        { text = "Just a bed, thank you.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Hagar talks of nothing but his egg. Rau talks of nothing but his hoof. Thalia isn't talking at all, and that worries me most." } },
      choices = { { text = "I'll look in on her.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the Cliffwatcher. Little happens in the Needles that he misses." } },
  },
}
