-- Light's Hope Chapel: the spirit in the crypt who tests priests.
-- Voice: bibles/eris_havenfire.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eris_havenfire", id = TODO_NPC("Eris Havenfire"), name = "Eris Havenfire",
  bible = "bibles/eris_havenfire.md", role = "priest", tier = "quest",
  communities = { "light_hope" }, temper = { "calm", "gentle" }, values = { "pious", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Eris Havenfire is a spirit beneath Light's Hope who speaks of Light and Shadow as two hands of one healer. She weighed me before she spoke, and I'm still not sure what she found.",
    third = "{name} met Eris Havenfire, a priestly spirit who keeps a quiet vigil in the crypt beneath Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_vigil", text = "Few come down here with their eyes open, and fewer still can see me. Be welcome, and speak softly; the stones remember everything." },
    { id = "g_back", when = { metBefore = true }, text = "You've come down to the crypt again. I'm glad, for the living bring warmth even when they don't intend to." },
    { id = "g_trial", when = { questActive = TODO_QUEST("The Balance of Light and Shadow") }, text = "The frightened ones are waiting on the road. Heal them and guard them both, and don't let pride tell you that one hand is enough." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}. I counted the days by the prayers said above me, and there were fewer than there ought to have been." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, and one who has walked far to stand here. I can see both lights in you, {class}, the bright and the dim, and neither one is wicked by itself." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You died and returned, as I died and did not quite leave. We are neither of us where we were meant to be, I think, and yet here we both stand." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eris Havenfire. In life I served the Light, and in death I keep watch beneath this chapel for those who would learn its harder lessons." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Balance of Light and Shadow") },
          text = "You kept them alive, and you kept the dead from them, and you did both at once. That is the lesson, and it is one most priests never learn in a lifetime." },
        { id = "h_notpriest", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "SHAMAN", "DRUID" } },
          text = "My trial is for priests, and you are not one, though you may sit with me awhile if you like. The dead are glad of company, whatever road brought it." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, the Light's sword and shield together. My trial isn't yours to take, but you understand already that the Light must sometimes strike, so we'll get along." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The crypt is patient, and so am I." },
        { id = "h_again2", text = "There's more on your mind; I can see it. Go on." },
      },
      choices = {
        { text = "What is the balance you speak of?", next = "balance" },
        { text = "What is your trial?", next = "trial" },
        { text = "Who were you, in life?", next = "life" },
        { text = "Why keep watch beneath Light's Hope?", next = "chapel" },
        { text = "Some say Shadow has no place in a priest.", next = "shadow", when = { class = "PRIEST" } },
        { text = "Can a Forsaken priest still serve the Light?", next = "forsaken", when = { race = "Scourge", class = "PRIEST" } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },

    balance = {
      lines = { { id = "ba_default", text = "The Light mends and the Shadow ends, and a healer who can only mend will watch her patients die of what she won't strike down. A priest must carry both, and know which one the moment asks for." } },
      choices = {
        { text = "Isn't Shadow dangerous to wield?", next = "balance_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_danger = {
      lines = { { id = "bd_default", text = "Very, as fire is dangerous and a knife is dangerous, and we use both every day. The danger is in loving it, in reaching for the Shadow because it answers quicker than the Light." } },
      choices = {
        { text = "Which do you trust more?", next = "balance_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance_trust = {
      big = true,
      lines = { { id = "bt_default", text = "I trust the hand that holds them, and nothing else. Now I'll ask you, since you've asked me: if you could carry only one, which would you choose?" } },
      choices = {
        { text = "The Light. Healing is worth more than any killing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Shadow. A dead enemy harms no one else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Both, as you said. I won't choose.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
      },
    },

    trial = {
      lines = {
        { id = "tr_default", text = "Frightened folk flee along the road, and the Scourge hunts them from the trees. A priest must keep them living with one hand and keep death off them with the other, and many must reach safety, or the trial is lost." },
        { id = "tr_other", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "SHAMAN", "DRUID", "PALADIN" } }, text = "It is a priest's test, and I'll tell you of it only because you asked kindly. Frightened folk flee along a road while the Scourge hunts them, and the priest must heal and fight at once." },
      },
      choices = {
        { text = "Are those people real?", next = "trial_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trial_real = {
      lines = { { id = "trr_default", text = "They were, once. The Plaguelands are full of the moment folk ran and didn't make it, and I can call that moment back for a little while. This time they might make it, and that matters to them, I think, even now." } },
      choices = {
        { text = "So the trial is a mercy for them too.", next = "trial_mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trial_mercy = {
      big = true,
      lines = { { id = "tm_default", text = "I hope so, though I can't be certain, and I've wondered whether I'm wrong to wake them at all. Tell me what you think, since you'll be the one standing among them." },
      },
      choices = {
        { text = "Giving them a second chance is right. Wake them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the dead rest. Find another way to test us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I can't answer that, Eris.", next = "BACK" },
      },
    },

    life = {
      lines = { { id = "li_default", text = "A priestess of Lordaeron, as many were, and not a famous one. I tended the sick in the plague's first months, and I learned there what this trial teaches, though I learned it too late for most of them." } },
      choices = {
        { text = "How did you die?", next = "life_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_death = {
      lines = { { id = "ld_default", text = "Tending a village that had already turned, and not knowing it until the first of them rose. I had only healing in my hands that night, and healing was not what the night needed." } },
      choices = {
        { text = "I'm sorry, Eris.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    chapel = {
      lines = { { id = "ch_default", text = "This ground is holy, and the Scourge will not walk it willingly, so the dead who are not theirs gather here. I am one of them, and I've made myself useful, which is more than most ghosts manage." } },
      choices = {
        { text = "Does Lord Tyrosus know you're here?", next = "chapel_tyrosus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chapel_tyrosus = {
      lines = { { id = "ct_default", text = "He comes down at dawn sometimes and prays, and I think he feels me listening, though he has never said so. Leonid knows, of course; the risen always know their own." } },
      choices = {
        { text = "Then you're in good company.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shadow = {
      lines = { { id = "sh_default", text = "Those who say so have never watched a patient die of what they refused to strike. Shadow is not evil, {class}; it is only dark, and a priest should not be frightened of the dark." } },
      choices = {
        { text = "My teachers would call that heresy.", next = "shadow_heresy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_heresy = {
      big = true,
      lines = { { id = "shh_default", text = "Your teachers lived in cities with walls, and I lived here, at the end of things. Whose lesson will you carry out of this crypt, theirs or mine?" } },
      choices = {
        { text = "Yours. The Plaguelands taught you what walls never could.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Theirs. Doctrine keeps priests from losing themselves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      lines = { { id = "fo_default", text = "If you can call it and it answers, then it serves you, and that's all the answer the Light gives anyone. It burns you a little, I expect, and you call it anyway, which says more of your faith than any sermon." } },
      choices = {
        { text = "It burns. I call it anyway.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess of Lordaeron who learned her best lesson too late, and has spent her death teaching it." } },
    advice = { { id = "tp_ad", text = "Never let your patient die of your principles. Heal what you can, and end what you must." } },
    argent_dawn = { { id = "tp_argent", text = "The living who keep this chapel, and they keep it well. They pray above me every dawn, and I listen." } },
    _none = { { id = "tp_none", text = "That is a matter for the living above, and I've not been one of them for a long while. Ask in the chapel." } },
  },
}

