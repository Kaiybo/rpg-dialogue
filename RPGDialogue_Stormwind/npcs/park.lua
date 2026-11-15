-- The Park: Stormwind's kaldorei, a druid and an herbalist among the trees inside the walls.
-- Voices: bibles/park.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sheldras Moontree: balance inside stone walls.
P:NPC {
  key = "sheldras", id = TODO_NPC("Sheldras Moontree"), name = "Sheldras Moontree", title = "Druid Trainer",
  bible = "bibles/park.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "form", "priest", "kaldorei" },
  impression = {
    first = "Sheldras Moontree teaches druids under the trees of Stormwind's Park and insists that peace can be found even inside stone walls. He seemed amused by the city and fond of it all the same.",
    third = "{name} met Sheldras Moontree, a night elf druid who teaches in Stormwind's Park.",
  },

  greetings = {
    { id = "g_balance", text = "Even within stone walls, there is peace, if you look for it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Ishnu-alah, young druid. Sit beneath the leaves a moment." },
    { id = "g_moonglade", when = { questActive = TODO_QUEST("Moonglade") }, text = "Moonglade waits for you. It is patient; be less so." },
  },

  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You've walked into a human city wearing another shape, and the guards haven't run screaming. That is progress, for them and for us." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest of the human Light, come to the trees. Your Cathedral rings a bell at sunset for my people, did you know? It is a kindness I never thanked them for." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Far from Teldrassil, aren't we both? I come here when the walls feel close; the trees are young and human-planted, but they try very hard." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sheldras Moontree. Even within cold stone walls like these, one may find tranquillity, and in truth you may find it anywhere at all, if you look inside yourself for balance. The Park only makes it easier." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You are far from the Cenarion Circle, young one, and closer than you think. Every druid carries the Dream with them, even through the gates of a human city." },
        { id = "h_moonglade", key = true, tags = { "news" }, when = { class = "DRUID", questBefore = TODO_QUEST("Moonglade") },
          text = "It is time you saw Moonglade, where the Circle meets and every druid is welcome. The way there is a spell you'll soon know, and the journey is one you'll never quite finish." },
        { id = "h_child", tags = { "news" }, when = { questRecent = { TODO_QUEST("Child of Nature"), days = 3 } },
          text = "So you've learned the first lesson, that nature isn't a thing you stand apart from. Good. The rest of the lessons are only the first one, said more slowly." },
        { id = "h_human", when = { race = "Human" },
          text = "Your people planted these trees inside your walls, which tells me you missed the forest even while you were building against it. I find that very human, and rather touching." },
        { id = "h_dusk", when = { timeOfDay = "dusk" },
          text = "Listen: the Cathedral's sunset bell. Your priests ring it for my people, so we remember the day is ending. In Darnassus we'd only look at the sky." },
      },
      again = {
        { id = "h_again", text = "What else would you ask beneath the leaves?" },
        { id = "h_again2", text = "Go on. The trees and I are in no hurry." },
      },
      choices = {
        { text = "Train me, Sheldras.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why live in a human city?", next = "city" },
        { text = "What is balance?", next = "balance" },
        { text = "What is Moonglade?", next = "moonglade" },
        { text = "Does your Elune differ from our Light?", next = "light", when = { class = "PRIEST" } },
        { text = "Peace be with you.", next = "END" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Because the Alliance is a long word for a short friendship, and someone must stand in it and listen. The humans need to see that we're not ghosts in the trees, and I need to remember that walls aren't only prisons." } },
      choices = {
        { text = "Are you welcome here?", next = "city_welcome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_welcome = {
      big = true,
      lines = { { id = "cw_default", text = "Mostly. The children ask whether I sleep in the trees, and the guards ask whether my cat bites. Some of the older folk remember that elves meant the quel'dorei, and they look at me as if I've come to the wrong house." } },
      choices = {
        { text = "The Alliance is stronger with you here.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Every people should keep to its own lands.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "The wolf and the deer, the storm and the calm, growth and decay, each answering the other. Nature doesn't take sides, young one; it keeps the scales level, and a druid's work is to help when they tip." } },
      choices = {
        { text = "And when one side is evil?", next = "balance_evil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_evil = {
      big = true,
      lines = { { id = "be_default", text = "Then it is no longer part of nature, and we fight it, the Burning Legion and its servants most of all. But a hungry wolf is not evil, and a forest fire is not evil, and a great deal of harm is done by people who cannot tell the difference." } },
      choices = {
        { text = "Some things are simply evil.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nothing is evil. Only hungry.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "A sacred vale in the north of Kalimdor, between Felwood and Winterspring, where the Cenarion Circle gathers and where no blood is spilled. Every druid goes there, sooner or later, and comes back a little quieter.",
        fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "Could I go there, not being a druid?", next = "moonglade_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade_go = {
      lines = { { id = "mg_default", text = "Anyone may walk there who comes in peace, though the road is long and passes through a sick forest. Bring nothing you'd be ashamed to set down, because Moonglade has a way of making you set things down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "Elune is the Mother Moon, and your Light, I think, is something more like a promise. Both are kind to those who suffer, and both have been used as an excuse by those who caused it. I like your bell, at least." } },
      choices = {
        { text = "The Light and Elune can stand together.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The Light is the only truth.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The trees of this park hear a great deal, and so do I, sitting among them. Ask what you will." },
    },
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle who has spent longer among humans than he expected to. The trees here are young; perhaps I am keeping them company." } },
    advice = { { id = "tp_ad", text = "Look inside yourself for balance before you look for it in the world. The world is very noisy, and you are much quieter than it." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids of Kalimdor, sworn to the balance, who meet in Moonglade.", next = "moonglade" } },
    teldrassil = { { id = "tp_teldrassil", text = "Our new world-tree, rising off the northern coast. I miss its shade, even here." } },
    _none = { { id = "tp_none", text = "I don't know, and I'm content not to. Not every question needs to be caught." } },
  },
}

-- Shylamiir: an herbalist with no patience and a great deal of skill.
P:NPC {
  key = "shylamiir", id = TODO_NPC("Shylamiir"), name = "Shylamiir", title = "Herbalism Trainer",
  bible = "bibles/park.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud", "curious" },
  notices = { "herbalist", "druid" },
  impression = {
    first = "Shylamiir greeted me as an interruption and then decided I might be useful. She is the finest herbalist in the Park and quite certain of it, and she wants a plant from inside Dalaran's walls.",
    third = "{name} met Shylamiir, a night elf herbalist in Stormwind's Park who doubts anyone's skill matches her own.",
  },

  greetings = {
    { id = "g_work", text = "I hope this interruption is for a good cause. I was busy." },
    { id = "g_sample", when = { questActive = TODO_QUEST("A Green Sample") }, text = "Well? Did you get into Dalaran, or did the Kirin Tor shoo you off?" },
  },

  notice = {
    { id = "n_herbalist", cat = "herbalist", when = { profession = "Herbalism" },
      text = "Another herbalist, hmm. I doubt your skill matches mine, but I can teach you a few proper techniques, so you'll at least stop tearing the roots." },
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "A druid. Then you'll know why I can't stand the way humans pick flowers: by the stem, all at once, as if the plant had done something to them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Shylamiir. I train herbalists, when they can be trained, and in between I study what grows here, which is more than you'd think for a park full of humans." },
        { id = "h_sample", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("A Green Sample"), minLevel = 40 },
          text = "If you're going to bother me, you can make yourself useful. Dalaran has a surprising interest in botany for a city of mages, and I'd very much like a sample of whatever grows in their central garden." },
        { id = "h_sample_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Green Sample") },
          text = "The Kirin Tor keep to themselves behind that barrier of theirs, but you seem comfortable going where you're not wanted. Find a way in, and bring me whatever is growing in the middle." },
        { id = "h_sample_done", when = { questDone = TODO_QUEST("A Green Sample") },
          text = "That blossom is wrong in a dozen fascinating ways; the mana has twisted it into something the Kirin Tor surely never planted on purpose. I haven't slept, and I'm delighted." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. Your healers in the Cathedral buy my peacebloom by the basket and never once ask how it grows. You might, as a novelty." },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Herbalism" } },
        { text = "What grows in a park like this?", next = "grows" },
        { text = "Why do you want Dalaran's plants?", next = "dalaran" },
        { text = "How does peacebloom grow, then?", next = "peacebloom", when = { class = "PRIEST" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "g_default", text = "Elwynn's ordinary weeds, mostly, and peacebloom where the humans haven't trampled it, and a little silverleaf by the pond that I'm watching very closely. Every city park is an experiment nobody meant to run." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    dalaran = {
      big = true,
      lines = { { id = "d_default", text = "Because nobody else has seen what centuries of mana in the soil does to a living thing, and the Kirin Tor won't tell anyone. Knowledge kept behind a barrier is knowledge wasted, and I don't care how many archmagi disagree." } },
      choices = {
        { text = "Agreed. Knowledge shouldn't be locked away.", next = "dalaran_more", fx = { align = { order = -1 } } },
        { text = "The Kirin Tor have their reasons.", next = "dalaran_more", fx = { align = { order = 1 } } },
        { text = "What do you expect to find?", next = "dalaran_more" },
      },
    },
    dalaran_more = {
      lines = { { id = "dm_default", text = "Something changed, something that drinks magic instead of water, perhaps. If it's dangerous, better that a herbalist understands it than a mage who only knows how to set it on fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peacebloom = {
      lines = { { id = "pb_default", text = "In sunlight, near running water, and only where the ground has been left alone for a season. That's why there's so much in Elwynn and so little in Westfall now; a field that's been fought over forgets how to grow gentle things." } },
      choices = {
        { text = "That's sad, and true.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know plants, and the people who walk through the Park on their way to somewhere else. Ask, but make it worth my time." },
    },
    background = { { id = "tp_bg", text = "I study herbs. I'm better at it than anyone in this city. What more would you need to know?" } },
    advice = { { id = "tp_ad", text = "Take the leaf and leave the root. Then there's something to pick next year." } },
    _none = { { id = "tp_none", text = "Is it a plant? Then I don't care." } },
  },
}
