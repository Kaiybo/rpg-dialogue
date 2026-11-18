-- The Apothecarium's teachers beside Faranell and Zinge: Doctor Martin Felben (alchemy) and Martha Alliestar (herbalism).
-- Voices: bibles/<key>.md. The New Plague is the Society's business: hinted, never explained.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Doctor Martin Felben: alchemy trainer, a physician who lost his patients and kept his methods.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_felben", id = TODO_NPC("Doctor Martin Felben"), name = "Doctor Martin Felben", title = "Alchemy Trainer",
  bible = "bibles/uc_felben.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "precise", "dry" }, values = { "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Doctor Martin Felben teaches alchemy in the Apothecarium with a physician's bedside manner and no patients left to use it on. He measured me with his eyes the way he measures powders.",
    third = "{name} met Doctor Martin Felben, the alchemy trainer of the Apothecarium.",
  },

  greetings = {
    { id = "g_default", text = "Stand clear of the green flask, please. It's not dangerous, exactly, but it is curious about you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my returning student. Your colour is better, or worse; it's hard to tell with the dead." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. You've a burn on your thumb from stirring with the wrong hand; most beginners do." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You're breathing quite heavily for someone standing still. The fumes, I expect; the dead don't notice them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Doctor Martin Felben. I was a physician in Lordaeron, and now I teach alchemy in the Apothecarium, which is much the same work except that nobody thanks me for it." },
        { id = "h_notalch", when = { ["not"] = { profession = "Alchemy" } }, text = "You're not one of my students, but a doctor never minds a visitor. Mind the floor; it's been mopped, but not with water." },
      },
      again = {
        { id = "h_again", text = "Another question? I'm in the middle of a distillation, but it'll take an hour whatever I do." },
      },
      choices = {
        { text = "You speak of your patients as if they're gone.", next = "patients" },
        { text = "What does the Society actually make here?", next = "society" },
        { text = "Teach me alchemy.", next = "BUSINESS", when = { profession = "Alchemy" } },
        { text = "Good day, Doctor.", next = "END" },
      },
    },
    patients = {
      lines = { { id = "pa_default", text = "They died in the plague, every one, and I tried every cure in my books and a few I invented. None of them worked, and I've kept the notes, because a failed cure still teaches you what the sickness wants." } },
      choices = {
        { text = "I'd guess you still look for a cure.", next = "patients_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patients_cure = {
      big = true,
      lines = { { id = "pc_default", text = "For what? There's nobody left of mine to cure. The Society studies sickness from the other end now, and I've made my peace with it, mostly." } },
      choices = {
        { text = "A healer should still heal, Doctor.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowing a sickness is power. Use it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    society = {
      lines = { { id = "so_default", text = "Potions, mostly, of the ordinary sort, for the Deathguard and the city. What Master Apothecary Faranell does in the back rooms is his business, and I've found it healthy not to ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "I've heard the phrase, and I've decided not to have heard it. I'd advise you to do the same." } },
    _none = { { id = "tp_none", text = "Not in my books, I'm afraid, and I've read all of them twice." } },
  },
}

---------------------------------------------------------------------------
-- Martha Alliestar: herbalism trainer, a farm wife who still talks to plants.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_alliestar", id = TODO_NPC("Martha Alliestar"), name = "Martha Alliestar", title = "Herbalism Trainer",
  bible = "bibles/uc_alliestar.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "warm", "wistful" }, values = { "kind" },
  notices = { "craft", "gender" },
  impression = {
    first = "Martha Alliestar teaches herbalism under the city and misses the sun more than anyone I've met down here. She keeps a pot of peacebloom alive by a grate in the ceiling, and she's very proud of it.",
    third = "{name} met Martha Alliestar, a herbalism trainer of the Undercity who grows peacebloom beneath a grate.",
  },

  greetings = {
    { id = "g_default", text = "Oh, mind the pot, dearie. That's my peacebloom, and it's the only one in the city." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you bring me anything green? No? Well, never mind; nothing grows down here but mould and grudges." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of earthroot and silverleaf. Lovely, you've no idea how lovely that is, down here." },
    { id = "n_man", cat = "gender", when = { gender = "male", race = "Tauren" },
      text = "Goodness, a tauren gentleman. My late husband would have asked you a hundred questions about the plains, and I'll try to keep it to ten." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Martha Alliestar. I teach herbalism to anyone with the patience for it, and I learned it on a farm near Brill, where my mother kept a garden the whole village came to for remedies." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Oh, you'll know far more than I do about growing things. Will you look at my peacebloom and tell me if it's happy?" },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've all the time in the world, and nothing to plant it in." },
      },
      choices = {
        { text = "I'm surprised peacebloom grows down here at all.", next = "peacebloom" },
        { text = "Tell me about the farm.", next = "farm" },
        { text = "Teach me herbalism.", next = "BUSINESS", when = { profession = "Herbalism" } },
        { text = "Take care, Martha.", next = "END" },
      },
    },
    peacebloom = {
      lines = { { id = "pe_default", text = "There's a grate over it that lets in an hour of light at noon, if the clouds are kind. I sing to it, which the apothecaries find very funny, but it's still alive and theirs aren't." } },
      choices = {
        { text = "Keep singing. It's working.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants don't care about songs, Martha.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm = {
      lines = { { id = "fa_default", text = "It's still there, out past Brill, but the Scarlets burned the barn and the field's gone to weeds. I walked out to see it once, and I don't think I'll go again." } },
      choices = {
        { text = "Why not?", next = "farm_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_why = {
      lines = { { id = "fw_default", text = "Because the weeds were doing beautifully, and I couldn't decide whether to be glad or heartbroken. That's no way to feel about a place you loved." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask me about roots, and I'll talk your ear off, since I've no breath left to run short of." } },
  },
}
