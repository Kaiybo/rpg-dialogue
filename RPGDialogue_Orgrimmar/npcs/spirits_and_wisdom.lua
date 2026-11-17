-- The Valley of Spirits and the Valley of Wisdom: the priest, mage and shaman trainers,
-- the first aid trainer and the herbalist. Vol'jin and Kardris are in their own files.
-- Voices: bibles/<key>.md for each.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Ur'kyo: the Darkspear priest trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "urkyo", id = TODO_NPC("Ur'kyo"), name = "Ur'kyo", title = "Priest Trainer",
  bible = "bibles/urkyo.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class", "form" },
  impression = {
    first = "Ur'kyo trains priests in the Valley of Spirits and speaks of the loa and the Light as if they were neighbours who don't get along. He is patient, amused and hard to surprise.",
    third = "{name} met Ur'kyo, the Darkspear priest trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits be quiet today, mon. Come and sit, and let's see if they wake up for you." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "A Forsaken priest, and you still pray. That be the strangest thing in this whole valley, and I like it." },
  },
  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You wear the shadow like a cloak, mon, and it suits you a little too well. Take it off now and then, so you remember what you look like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ur'kyo, and I teach priests, mon, whatever they be praying to. The Light, the shadow, the loa, they all answer if you ask properly, and they all want something back." },
        { id = "h_troll", when = { race = "Troll" }, text = "Ur'kyo, and you be Darkspear, so you already know the loa be listening. Let's see what else you can learn." },
      },
      again = { { id = "h_again", text = "What else, mon? The spirits have time, and so do I." } },
      choices = {
        { text = "Do the loa and the Light get along?", next = "loa" },
        { text = "What do the spirits want back?", next = "want" },
        { text = "Teach me, Ur'kyo.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Farewell, Ur'kyo.", next = "END" },
      },
    },
    loa = {
      lines = { { id = "lo_default", text = "They be like two old women at the same market, mon, polite to each other's faces and grumbling behind their backs. I don't take sides, I just listen to whichever one be talking loudest." } },
      choices = {
        { text = "Which one talks loudest?", next = "loudest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loudest = {
      big = true,
      lines = { { id = "ld_default", text = "The shadow, these days, because it always has something to say and it never runs out of words. But the Light be the one that heals, and a priest who forgets that ends up talking to himself in the dark." } },
      choices = {
        { text = "Healing matters most. I'll keep to the Light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The shadow has power. I'll listen to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "Respect, mostly, and a little bit of your time. The loa want offerings, the Light wants you to be good, and the shadow wants you to keep coming back, which be the dangerous one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the spirits about that, mon. They be knowing more than me." } },
  },
}

---------------------------------------------------------------------------
-- Uthel'nay: the Darkspear mage trainer of the Darkbriar Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "uthelnay", id = TODO_NPC("Uthel'nay"), name = "Uthel'nay", title = "Mage Trainer",
  bible = "bibles/uthelnay.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp" }, values = { "ambitious", "curious" },
  notices = { "arcane", "class" },
  impression = {
    first = "Uthel'nay teaches magic in the Darkbriar Lodge in the Valley of Spirits and has no patience at all for slow students. She expects the Horde's mages to match any in Dalaran, and she says so often.",
    third = "{name} met Uthel'nay, a Darkspear mage trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "Speak quick, mon, I've got students setting fire to the curtains again." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, maybe this time you'll remember what I taught you." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Your fingers be twitching, mon. Too much arcane and not enough sleep will do that, so go and rest before you blow something up." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock in my lodge, and I can smell the brimstone from here. Don't touch anything, mon, and especially not the books." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Uthel'nay, and I teach mages in the Darkbriar Lodge. The humans in Dalaran think nobody else knows magic, and I mean to prove them wrong one student at a time." },
        { id = "h_forsaken", when = { race = "Scourge", class = "MAGE" }, text = "Uthel'nay, and you be one of the Forsaken who studied in Dalaran before you died, I think. Don't tell me they taught you better, mon, because they didn't." },
      },
      again = { { id = "h_again", text = "Anything else, mon? Quickly, quickly." } },
      choices = {
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Is magic dangerous?", next = "danger" },
        { text = "Teach me, Uthel'nay.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Farewell, Uthel'nay.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "da_default", text = "A city full of humans who think they invented magic, mon, and then hid behind a big wall when the Scourge came. They be clever, I'll give them that, but clever isn't the same as wise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "dg_default", text = "Very, which is why I don't teach fools. Too much arcane and you start wanting more and more, and then one day you be hungry for nothing else, and that be the end of you." } },
      choices = {
        { text = "Have you seen that happen?", next = "danger_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_seen = {
      big = true,
      lines = { { id = "ds_default", text = "Once, to a student who wouldn't stop, even when his hands shook and his eyes went pale. He left for the north looking for more power, and I never heard from him again, which be the best thing I can say." } },
      choices = {
        { text = "Magic needs limits. Discipline keeps you alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power should be pursued, whatever the cost.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't waste my time on that, mon, and neither should you." } },
  },
}

---------------------------------------------------------------------------
-- Searn Firewarder: a shaman trainer in the Valley of Wisdom.
---------------------------------------------------------------------------
P:NPC {
  key = "searn", id = TODO_NPC("Searn Firewarder"), name = "Searn Firewarder", title = "Shaman Trainer",
  bible = "bibles/searn.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "proud", "devout" },
  notices = { "class" },
  impression = {
    first = "Searn Firewarder trains shamans in the Valley of Wisdom and speaks of fire as if it were an old friend with a temper. He is warmer than his name, though not by much.",
    third = "{name} met Searn Firewarder, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_hi", text = "The fire spirits are restless today, so stand back from the brazier, if you value your eyebrows." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman, come to learn more. Good, because the elements always have more to teach." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the stink of the Cleft on you, warlock. The fire spirits don't like it, and neither do I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Searn Firewarder, and I teach shamans to speak with the elements, though fire is the one I know best. Fire is honest, because it shows you exactly what it wants and burns you if you don't listen." },
        { id = "h_orc", when = { race = "Orc", class = "SHAMAN" }, text = "Searn Firewarder, and you're an orc shaman, so you'll know our people forgot the spirits once and paid for it. We won't forget them again, not while I'm teaching." },
      },
      again = { { id = "h_again", text = "What else? The fire is waiting." } },
      choices = {
        { text = "Why fire, of all the elements?", next = "fire" },
        { text = "What happened when the orcs forgot the spirits?", next = "forgot" },
        { text = "Teach me, Searn.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Farewell, Searn.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Because fire cleanses, and the orcs needed cleansing after the demon blood. It burned the old poison out of us, and it reminded us that some things can't be tamed, only respected." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgot = {
      lines = { { id = "fo_default", text = "The warlocks came, and they offered power that didn't ask for respect, so our people took it and turned green. The spirits went silent for a whole generation, and only the Frostwolves kept the old ways until Thrall brought them home to the rest of us." } },
      choices = {
        { text = "Do the warlocks in the Cleft trouble you?", next = "warlocks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlocks = {
      big = true,
      lines = { { id = "wa_default", text = "Every day, and every day the Warchief tells me they're useful, and every day I swallow my words. I don't trust them, but I trust Thrall, so I watch and I wait." } },
      choices = {
        { text = "The Warchief knows best. Trust his judgement.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some dangers shouldn't be tolerated, whatever the Warchief says.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The fire hasn't told me that. Ask again another day." } },
  },
}

---------------------------------------------------------------------------
-- Arnok: the first aid trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "arnok", id = TODO_NPC("Arnok"), name = "Arnok", title = "First Aid Trainer",
  bible = "bibles/arnok.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "kind", "practical" },
  notices = { "craft", "weary" },
  impression = {
    first = "Arnok teaches first aid and spends most of his time patching up grunts from the training yards. He is kind, quick and tired of seeing the same wounds every day.",
    third = "{name} met Arnok, who teaches first aid in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "If you're bleeding, sit down, and if you're not, stand over there and wait your turn." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. That's more than I can say for most of the grunts." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You've got the grey look of someone who just came back from the spirit healer. Sit for a moment before you go anywhere." },
    { id = "n_fa", cat = "craft", when = { profession = { name = "First Aid", min = 100 } },
      text = "Your bandages are tighter than they were. Good, because a loose bandage is worse than none at all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Arnok, and I teach first aid to anyone who wants to keep their friends alive. Most of my days go to patching up grunts from the Valley of Honor, so if you're here to learn, you'll have plenty of practice." },
      },
      again = { { id = "h_again", text = "Anything else? I've got a grunt bleeding in the corner." } },
      choices = {
        { text = "What's the worst wound you've treated?", next = "worst" },
        { text = "Why should anyone learn first aid?", next = "why" },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Farewell, Arnok.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "wo_default", text = "A grunt who tried to catch a thrown axe with his bare hands, during a training match, to impress a girl. He kept the hand, just barely, and she married somebody else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wh_default", text = "Because shamans and priests can't be everywhere, and a bandage costs less than a funeral. Every orc who learns to tie a proper knot saves a life someday, even if it's only his own." } },
      choices = {
        { text = "Should every grunt be made to learn?", next = "everyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    everyone = {
      big = true,
      lines = { { id = "ev_default", text = "I've asked Overlord Runthak a dozen times, and he says the grunts have enough to learn already. I say they'd learn faster if they weren't bleeding all the time, but nobody listens to the bandage man." } },
      choices = {
        { text = "Make it law. Every grunt should know first aid.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let each grunt choose. Nobody likes being told.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know about that. I know about blood and bandages, and that's enough for one orc." } },
  },
}

---------------------------------------------------------------------------
-- Jandi: the herbalism trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "jandi", id = TODO_NPC("Jandi"), name = "Jandi", title = "Herbalism Trainer",
  bible = "bibles/jandi.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "craft" },
  impression = {
    first = "Jandi teaches herbalism in the Valley of Spirits and always has dirt under the fingernails. Jandi treats every plant like a small, stubborn patient.",
    third = "{name} met Jandi, the herbalism trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "Watch your feet, mon, there be seedlings everywhere." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you smell of the Barrens. You've been picking peacebloom, I can tell." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 100 } },
      text = "You pull the roots out with the leaves, mon, I can see it on your hands. Leave the roots, and the plant grows back for the next one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jandi, and I teach herbalism, mon. Durotar be a hard land for plants, so every one that grows here be stubborn, and the stubborn ones make the strongest medicine." },
      },
      again = { { id = "h_again", text = "Anything else, mon? The seedlings need water." } },
      choices = {
        { text = "What grows in Durotar?", next = "durotar" },
        { text = "Do you sell to the alchemists?", next = "alchemists" },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Farewell, Jandi.", next = "END" },
      },
    },
    durotar = {
      lines = { { id = "du_default", text = "Peacebloom and silverleaf, mostly, and earthroot if you know where to dig. Not much, mon, but enough, and the tauren bring better herbs from Mulgore if you ask them nicely." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alchemists = {
      lines = { { id = "al_default", text = "To Yelmak on the Drag, mostly, though I don't always like what becomes of my herbs in that shop. A plant be meant to heal, mon, and some of those potions turn grunts blue." } },
      choices = {
        { text = "Should herbs only be used for healing?", next = "heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      big = true,
      lines = { { id = "he_default", text = "That be what I believe, mon, but the world needs fire potions too, I suppose. I just wish the alchemists would ask the plants first, the way my grandmother taught me." } },
      choices = {
        { text = "Herbs should heal. That's their purpose.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon is a weapon, even if it grows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know, mon. Ask me about roots and leaves." } },
  },
}
