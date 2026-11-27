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
    first = "He measured me with his eyes the way he measures powders.",
    third = "{name} met Doctor Martin Felben, the alchemy trainer of the Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite specimen of good health. The green flask has been asking after you, in its fashion." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stand well back from the tables. I've measured you once already and didn't care for the result." },
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
    w3_case = {
      lines = {
        { id = "w3_case_1", text = "A Deathguard who came in complaining of a rattle in his chest, which turned out to be a nest of carrion beetles who'd moved in while he stood guard in Brill. I removed them, every one, and he thanked me and went back to the same post, where I expect they've since returned." },
      },
      choices = {
        { text = "Couldn't you have warned him?", next = "w3_warn" },
        { text = "At least they didn't hurt him.", next = "BACK", reply = "No, they don't hurt. That's rather the problem with the Forsaken, as a physician sees it; nothing tells us when to come in." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_warn = {
      lines = {
        { id = "w3_warn_1", text = "I did, and he said the beetles were quieter company than the other guards. As a physician I disapprove, and as a man who has stood his own share of long watches, I find I can't argue the point." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Doctor Martin Felben. I was a physician in Lordaeron, and now I teach alchemy in the Apothecarium, which is much the same work except that nobody thanks me for it." },
        { id = "h_notalch", when = { ["not"] = { profession = "Alchemy" } }, text = "You're not one of my students, but a doctor never minds a visitor. Mind the floor; it's been mopped, but not with water." },
      },
      again = {
        { id = "h_again", text = "Another question? I'm mid-distillation, and it takes an hour whatever I do, so ask away." },
      },
      choices = {
        { text = "Alchemy should heal the Dark Lady's people before it harms anyone.", next = "BACK", reply = "A tidy sentiment. The Royal Apothecaries may not share it, but I do.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A potion's worth is in how much damage it can do.", next = "BACK", reply = "Spoken like Faranell's best pupil. I'd keep you off my healing draughts.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You speak of your patients as if they're gone.", next = "patients" },
        { text = "What does the Society actually make here?", next = "society" },
        { text = "Teach me alchemy.", next = "BUSINESS", when = { profession = "Alchemy" } },
        { text = "How did a physician come to the Society?", next = "join" },
        { text = "What's in the green flask?", next = "flask" },
        { text = "Can your alchemy help the living, Doctor?", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "What's the first lesson of alchemy?", next = "lesson", when = { profession = "Alchemy" } },
        { text = "What's the hardest case you've treated down here?", next = "w3_case" },
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
        { text = "A healer should still heal, Doctor.", next = "BACK", reply = "A healer heals, aye, but my patients are all dead now. I'll heal what the Society lets me, and study the rest.", fx = { align = { light = 1 } } },
        { text = "Knowing a sickness is power. Use it.", next = "BACK", reply = "It is, and the Society knows it better than anyone. Still, I'd rather not think of my old patients that way.", fx = { align = { light = -1 } } },
      },
    },
    society = {
      lines = { { id = "so_default", text = "Potions, mostly, of the ordinary sort, for the Deathguard and the city. What Master Apothecary Faranell does in the back rooms is his business, and I've found it healthy not to ask." } },
      choices = {
        { text = "And what happens in those back rooms?", next = "society_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    society_back = {
      lines = { { id = "sb_default", text = "Locked doors, a great deal of glassware coming in, and a smell I can't name, though I knew every smell in Lordaeron's sickrooms. The Deathguard bring in prisoners from the Scarlet camps now and then, and they don't go out by the front door." } },
      choices = { { text = "Something else, Doctor.", next = "BACK" } },
    },
    join = {
      lines = { { id = "jo_default", text = "When I woke, the Society asked for anyone who could read a label and hold a flask steady, and I could do both. Master Apothecary Faranell interviewed me himself, and he asked me exactly one question." } },
      choices = {
        { text = "What was the question?", next = "join_faranell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    join_faranell = {
      lines = { { id = "jf_default", text = "Whether I could watch a man die without looking away. I told him I'd watched four hundred, and that I'd never once looked away, because they deserved a witness, and he wrote something down and said I'd do." } },
      choices = {
        { text = "That's a grim thing to be hired for.", next = "join_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    join_grim = {
      lines = { { id = "jg_default", text = "It's a grim city, and a grim Society, and I'm a grim sort of doctor these days. Still, I teach the young ones to measure properly and wash their glassware, and I like to think that saves someone somewhere, even if I never learn who." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flask = {
      lines = { { id = "fl_default", text = "A tonic for the Deathguard, to slow the rot in their joints so they can march to Brill and back without dropping a finger on the road. It moves a little on its own, which I'm told is a sign it's working, and which I choose to believe." } },
      choices = {
        { text = "Does it work on all the Forsaken?", next = "flask_works" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flask_works = {
      lines = {
        { id = "fw_default", text = "On most, for a while, and then the body forgets the dose and the rot goes on as it likes. The dead are poor patients, I'm afraid, since none of us ever quite heals." },
        { id = "fw_undead", when = { race = "Scourge" }, text = "On most of us, for a while, and you'll have felt your own joints stiffen on a long march, I expect. Come back when your knees start grinding, and I'll measure you a dose for the price of the ingredients." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "lv_default", text = "Of course, and better than it helps us, since a living body wants to heal and only needs a push. Your Horde's healing potions are brewed in this very room by people who can't drink them, which I think is a rather fine joke, if a quiet one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "le_default", text = "Stir with the hand you write with, and never with the hand you eat with, which is why you've that burn on your thumb. After that, label everything, because the second worst thing in alchemy is an explosion and the worst is a mystery." } },
      choices = {
        { text = "Precision first, then. I'll remember it.", next = "BACK", fx = { affinity = 1, trait = { careful = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A physician in Lordaeron with four hundred patients, and then none. Now I teach alchemy and keep my notes." } },
    advice = { { id = "tp_ad", text = "Label everything. A mystery on a shelf has killed more alchemists than any explosion." } },
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
    first = "She keeps a pot of peacebloom alive under a ceiling grate.",
    third = "{name} met Martha Alliestar, a herbalism trainer of the Undercity who grows peacebloom beneath a grate.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my dearie! Come see, the peacebloom's put out two new leaves since you last visited." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Mind you don't stand over my pot, dearie; it wilts when certain folk lean near it." },
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
    w3_garden = {
      lines = {
        { id = "w3_garden_1", text = "Everything a village needs when the nearest physician is a day's ride off, dear: feverfew for the children, silverleaf for cuts, and a bed of mageroyal that the bees thought was theirs. Folk came from three farms over for her poultices, and she'd never take a copper, only eggs." },
        { id = "w3_garden_2", when = { race = { "Orc", "Tauren", "Troll" } }, text = "Everything a village needs, dear, with no physician near: feverfew, silverleaf for cuts, and mageroyal the bees thought was theirs. Your own healers would have liked her, I think, because she'd never take coin, only eggs." },
      },
      choices = {
        { text = "Do you still remember her poultices?", next = "w3_poultice" },
        { text = "She sounds like the heart of the village.", next = "BACK", reply = "She was, and she'd have hated hearing it said, so I'll say it for her now she can't stop me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_poultice = {
      lines = {
        { id = "w3_poultice_1", text = "Every one, dear, and they work as well as ever on the living. Silverleaf pounded with a little honey and bound on a cut, and you'll heal clean, though I can't use it myself any more, more's the pity, since honey does nothing at all for a Forsaken." },
      },
      choices = {
        { text = "I'll try the silverleaf. Something else.", next = "BACK" },
        { text = "I gather silverleaf myself.", next = "BACK", when = { profession = "Herbalism" }, reply = "Then pick it in the morning, dear, while the dew's on, and it'll keep a week longer." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Martha Alliestar. I teach herbalism to anyone with the patience for it, and I learned it on a farm near Brill, where my mother kept a garden the whole village came to for remedies." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Oh, you'll know far more than I do about growing things. Will you look at my peacebloom and tell me if it's happy?" },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've all the time in the world, and the peacebloom doesn't mind a chat." },
      },
      choices = {
        { text = "Herbs should be gathered gently, leaving roots for next season.", next = "BACK", reply = "Bless you. That's how the old herbalists taught it, and they were right.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strip the field bare. There's always more growing somewhere.", next = "BACK", reply = "There isn't, dearie, not near here. The Plague saw to most of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'm surprised peacebloom grows down here at all.", next = "peacebloom" },
        { text = "Tell me about the farm.", next = "farm" },
        { text = "Teach me herbalism.", next = "BUSINESS", when = { profession = "Herbalism" } },
        { text = "What still grows in Tirisfal these days?", next = "herbs" },
        { text = "You mentioned your late husband.", next = "husband" },
        { text = "What can the living learn from you?", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "Your peacebloom looks happy enough to me.", next = "druid", when = { class = "DRUID" } },
        { text = "What did your mother grow in her garden?", next = "w3_garden" },
        { text = "Take care, Martha.", next = "END" },
      },
    },
    peacebloom = {
      lines = { { id = "pe_default", text = "There's a grate over it that lets in an hour of light at noon, if the clouds are kind. I sing to it, which the apothecaries find very funny, but it's still alive and theirs aren't." } },
      choices = {
        { text = "Keep singing, Martha. It's clearly working.", next = "BACK", reply = "I shall, and I'll sing a little louder now that someone's on my side. It's the only green thing in the Undercity.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants don't care about songs, Martha.", next = "BACK", reply = "Perhaps not, but they care about light, and my song lasts longer than the noon hour. Leave me my silly habit.", fx = { align = { light = -1 } } },
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
    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf near Brill still, dear, and earthroot along the river, though everything comes up a little grey now, as if it's been sleeping badly. Grave moss grows in the churchyards, and the apothecaries pay well for it, which tells you something about the apothecaries." },
        { id = "he_herb", when = { profession = "Herbalism" }, text = "You'll have seen it yourself, dearie: peacebloom and silverleaf near Brill, earthroot by the river, and all of it greyer than it ought to be. Pick from the high ground where the plague settled thinnest, and wash your hands after, even if you've no skin left to worry about." },
      },
      choices = {
        { text = "Why does it all come up grey?", next = "herbs_rot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_rot = {
      lines = { { id = "hr_default", fx = { learn = { "scourge" } }, text = "The plague got into the soil when the Scourge came through, and the soil remembers, just as we do. My mother used to say the land heals slower than people, and I used to think she meant it kindly." } },
      choices = {
        { text = "Who buys your herbs now?", next = "herbs_society" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_society = {
      big = true,
      lines = { { id = "hs_default", text = "The Society, mostly, by the basket, and they never tell me what it's for, and I've stopped asking. Some days I think I ought to ask, and then I think of the young apothecaries teasing me about my singing, and I can't believe they'd do anything truly wicked." } },
      choices = {
        { text = "You should ask what they're making with it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better not to know, Martha. Take the coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband = {
      lines = { { id = "hu_default", text = "Thomas, dearie, a farmer with a great many questions and very few answers, and he'd have liked you. He took sick the same week as the cows, and he didn't wake up again afterward, the way I did." } },
      choices = {
        { text = "Have you looked for him among the Forsaken?", next = "husband_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband_look = {
      lines = { { id = "hl_default", text = "Every face in the city, for a whole year, and then I asked Bauhaus to look in his census, and Thomas wasn't in it. I've decided that means he's resting properly, and I'll thank you not to tell me otherwise." } },
      choices = {
        { text = "Then he's at peace, Martha.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "li_default", text = "Oh, very little, dear, since you've hands that can feel the soil warm up in the morning, and I'd give anything for that. But I can tell you where the herbs hide in Tirisfal, and in return you can tell me what the sun feels like on the Barrens, because I've quite forgotten." } },
      choices = {
        { text = "Hot, Martha. Hot and endless and golden.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Do you think so? Oh, you've made my evening, truly, because nobody down here can tell a happy plant from a sulking one. I'll tell the apothecaries a druid said so, and they can laugh at that if they like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farm wife from out past Brill, dear, with my mother's garden in my hands. That's all there is to tell, and it's plenty." } },
    advice = { { id = "tp_ad", text = "Pick from the high ground and wash your hands after, dearie, whether you think you need to or not." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They burned our barn, dear, and called it purifying. I've no kind words for them, and I've looked hard for some." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask me about roots, and I'll talk your ear off, since I've no breath left to run short of." } },
  },
}
