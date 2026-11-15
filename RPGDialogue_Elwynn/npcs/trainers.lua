-- Elwynn's class trainers: Northshire Abbey's teachers for the first ten levels, and Goldshire's
-- for the next twenty. Voices: bibles/trainers.md (one bible, a section each).
-- Each has their own way with their own class and a short way with everyone else.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Northshire Abbey
---------------------------------------------------------------------------

-- Priestess Anetta: heals the abbey's wounded trainees and teaches novice priests.
P:NPC {
  key = "anetta", id = TODO_NPC("Priestess Anetta"), name = "Priestess Anetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "wounds", "form" },
  impression = {
    first = "Priestess Anetta keeps the Abbey's library wing and its recruits alive, and some days she says those are the same job. She patches the wounded briskly and expects the gratitude to come later.",
    third = "{name} met Priestess Anetta at Northshire Abbey, who heals the recruits and trusts the Light's long and kindly memory.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Sit, little {g:brother|sister}. The Light can wait a moment for you to catch your breath." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Hurt? Sit down and I'll see to it, and then go and find your own teacher." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "None of that in the infirmary, please. The wounded have had enough frights. Out of it, and roll up your sleeves." },
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Another one from the kobold camps. Hold still; you're the ninth today, and the day's still young." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Anetta. I keep the Library Wing, and I keep the recruits alive. Some days those are the same job." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hallowed Letter"), days = 1 } },
          text = "So McBride wrote to me about you. Then you're one of mine now. The first lesson is that the Light heals the people who annoy you too." },
        { id = "h_wounded", when = { questActive = TODO_QUEST("Healing the Wounded") },
          text = "The trainees by the barracks. Mend them, don't lecture them. The lecturing comes later, and it's my job." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Josetta, in Goldshire, upstairs at the Lion's Pride. She'll teach you what I can't from a library. Finish what you owe the Marshal first." },
        { id = "h_other", when = { ["not"] = { class = "PRIEST" } },
          text = "Whatever your path, don't turn your back on the Light. It has a long memory, and a kind one." },
        { id = "h_cots", when = { metBefore = true }, text = "Three cots full this morning, and all three of them got up and walked out by noon. I'll take that." },
        { id = "h_back", tags = { "news" }, when = { class = "PRIEST", minLevel = 20, metBefore = true },
          text = "Look at you! You left here with a staff you could barely hold, so come and tell me what the world's done to you, and then what you've done to it." },
      },
      again = { { id = "h_again", text = "Something else? Sit while you ask; the stool's for visitors." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Light, really?", next = "light" },
        { text = "What should a new priest learn first?", next = "first", when = { class = "PRIEST", maxLevel = 15 } },
        { text = "What happens to the ones you can't heal?", next = "lost" },
        { text = "I grew up in these halls.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "Thank you, Priestess.", next = "END" },
      },
    },
    light = {
      big = true,
      lines = { { id = "l_default", text = "Not a weapon, whatever the paladins say over supper. More like a lamp you keep lit for whoever comes after you." } },
      choices = {
        { text = "I'll keep it lit.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
        { text = "A lamp won't save anyone, so I'll need more than that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some days it's a weapon.", next = "light_weapon", fx = { trait = { stern = 1 } } },
      },
    },
    light_weapon = {
      lines = { { id = "lw_default", text = "Some days. Then you put it down again, and you check your hands, and you go and heal someone. That's how you know it's still the Light in them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "To heal before you're asked, and to stand behind the fighters, not in front of them. And to drink water, because priests forget water; I don't know why, but we all do." } },
      choices = {
        { text = "Why behind the fighters?", next = "first_behind" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    first_behind = {
      lines = { { id = "fb_default", text = "Because if you fall, so do they. You're the last thing between them and Brother Neals. Be harder to kill than the kobold in front of you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    lost = {
      big = true,
      lines = { { id = "lo_default", text = "I sit with them. That's all there is to do, at the end. You'll do it too, one day. Don't let anyone tell you it isn't healing." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Sitting with the dying isn't healing, it's giving up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That sounds unbearable.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    novice = {
      lines = { { id = "n_default", text = "I thought I knew the face; you used to fall asleep in the back of the library. Well, someone did, and every novice does. Welcome home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3, standing = { northshire = 2 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A priestess of Northshire. I came to the Abbey to read and stayed to bandage, and the reading still waits." } },
    advice = { { id = "tp_ad", text = "Kobolds bite low. Watch your ankles, and keep a prayer ready for whoever forgot to." } },
    northshire_abbey = { { id = "tp_abbey", text = "Mind the library steps. Recruits read standing up and fall down standing up." } },
    kobolds = { { id = "tp_kobolds", text = "I see what they leave behind, mostly in the infirmary." } },
    _none = { { id = "tp_none", text = "I've no answer for that, but I'll pray you find one." } },
  },
}

-- Khelden Bremen: teaches novice mages the fundamentals, up the stairs.
P:NPC {
  key = "khelden", id = TODO_NPC("Khelden Bremen"), name = "Khelden Bremen", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane" },
  impression = {
    first = "Khelden Bremen talks about the fundamentals in the weary voice of a man who has watched many students skip them. His notes scatter every time somebody leaves the door open.",
    third = "{name} met Khelden Bremen, Northshire's mage trainer, who teaches the dull rules that keep the dramatic ones from killing anyone.",
  },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ready to face your destiny? Good, then close the door; the draught scatters my notes." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Don't touch anything glowing, or humming, or warm." },
  },

  notice = {
    { id = "n_burn", cat = "arcane", when = { class = "MAGE", durability = { max = 0.3 } },
      text = "Singed sleeves! You stood too close to your own fire again. Everyone does it once, but do it twice and I'll start charging you for robes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Khelden Bremen. I teach the fundamentals, though everyone wants the dramatic parts, and the fundamentals are what keep the dramatic parts from killing you." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Glyphic Letter"), days = 1 } },
          text = "McBride's letter. So you've a spark. Knowledge and power are out there for the taking, whatever gods or men think of it. Let's see how much you can carry." },
        { id = "h_other", when = { ["not"] = { class = "MAGE" } },
          text = "Magic is dangerous to the untrained. You're untrained. I'm only pointing out the arithmetic." },
        { id = "h_level", when = { class = "MAGE", minLevel = 10 },
          text = "You've outgrown my little room. Goldshire, the Lion's Pride, upstairs. Wefhellt will take you from here. Try not to set the inn alight." },
        { id = "h_basics", when = { metBefore = true }, text = "Back for more fundamentals? Good, because everyone else wants fireballs, and you'd be amazed how many of them set the library curtains alight." },
        { id = "h_veteran", when = { class = "MAGE", minLevel = 25 },
          text = "One of mine, come back up the stairs. You still hold your hands like I taught you. Most forget by the time they reach the Sanctum." },
      },
      again = {
        { id = "h_again", text = "Another question? Go on, but mind the inkwell." },
        { id = "h_again2", text = "Go on. I've a draught to fix and a lecture to rewrite." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why do mages chase power?", next = "power" },
        { text = "Has anything ever been stolen from this library?", next = "library" },
        { text = "Is the Light a kind of magic?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Where do I go when you're done with me?", next = "after", when = { class = "MAGE", maxLevel = 12 } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "Gnomes learn magic by taking it apart first.", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "My people kept the old Highborne arts.", next = "skyborne", when = { race = "Skyborne", class = "MAGE" } },
        { text = "What do you make of the other teachers here?", next = "teachers" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    power = {
      big = true,
      lines = { { id = "p_default", text = "Because it's there, because someone else will take it if we don't, and because it's beautiful. Pick whichever reason lets you sleep." } },
      choices = {
        { text = "Because it's beautiful.", next = "power_rules", fx = { align = { order = -1 }, affinity = 1, trait = { curious = 1 } } },
        { text = "Because someone has to keep it from the wrong hands.", next = "power_rules", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    power_rules = {
      lines = {
        { id = "pr_default", text = "Then remember the four rules I put in every letter: it's powerful, it corrupts, it's addicting, and it calls things out of the Twisting Nether to whoever uses it." },
      },
      choices = {
        { text = "Which one worries you most?", next = "power_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    power_worst = {
      lines = {
        { id = "pw_default", text = "The third. The others warn you, but that one flatters you; you'll never once feel addicted, only talented." },
      },
      choices = {
        { text = "I'll watch for it.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "I'll take the risk.", next = "BACK", fx = { trait = { brave = 1 }, align = { order = -1 } } },
      },
    },
    library = {
      lines = {
        { id = "l_default", text = "A novice ran off to the Defias last season and took dangerous books from the protected wing with him. The brothers keep those under lock for a reason.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "What kind of dangerous?", next = "library_void" },
        { text = "Why would a thief want books?", next = "library_why" },
      },
    },
    library_void = {
      lines = {
        { id = "lv_default", text = "One was a treatise on the Void. La Salle in the graveyard has wanted it for years. I'd rather the Defias had it than her, and I don't say that lightly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    library_why = {
      lines = {
        { id = "lw_default", text = "To sell, I'd guess. Someone in that Brotherhood knows what a book is worth. That bothers me more than the theft." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    light = {
      lines = {
        { id = "li_default", text = "Say that in the corridor and three brothers will correct you at once. I'll only say this: it obeys rules too. They just don't write theirs down." },
      },
      choices = {
        { text = "The Light isn't a set of rules.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'd like to read those rules.", next = "BACK", fx = { align = { order = 1 }, trait = { curious = 1 }, affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Wefhellt, above the inn in Goldshire. Then the Wizard's Sanctum in the city. Jennea Cannon there is sharper than both of us, and knows it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Frostbolt, until you can cast it without thinking about your hands, and then stopping a Fireball halfway, until you can do that without thinking either. Everyone practises the first; nobody practises the second until they've set something they love on fire." },
      },
      choices = {
        { text = "Why stop a spell halfway?", next = "practise_stop" },
        { text = "I'll practise both.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    practise_stop = {
      lines = { { id = "practise_stop_l", text = "Because one day a recruit will run in front of your target, and you'll have half a heartbeat to decide. Make the decision now, in this room, where it's cheap." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "So I've noticed, and I've lost two practice wands to it this season. I'll grant your people understand the parts better than mine, but the four rules still apply to gnomes, however small the explosion." } },
      choices = {
        { text = "Understanding the parts is the whole point.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll put your wands back together.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "Did they? Then I'd ask you not to show the novices, because they'll want to skip straight to it, and I'd ask you to show me, because I'm a hypocrite and a scholar." } },
      choices = {
        { text = "Some things aren't mine to show.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll show you, after the novices leave.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
    teachers = {
      lines = { { id = "teachers_l", text = "Anetta keeps the recruits alive, Beshere keeps them standing, and Kerridan keeps them out of my library, mostly. La Salle among the graves I'd rather not discuss, except to say she reads more than any of us." } },
      choices = {
        { text = "You sound almost fond of La Salle.", next = "teachers_lasalle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers_lasalle = {
      lines = { { id = "teachers_lasalle_l", text = "Fond is a strong word. I respect anyone who reads the whole book, even when the book is dreadful, and hers usually are." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the first lessons. Somebody must, and I'm better at it than I am at the last ones." } },
    advice = { { id = "tp_ad", text = "Magic will burn whoever wields it carelessly, so respect it or stay well clear of it. There's no third way." } },
    northshire_abbey = { { id = "tp_abbey", text = "Too many stairs and not enough shelves, but otherwise ideal." } },
    defias = { { id = "tp_defias", text = "They took books from our library: thieves with a reading list, which I find worse than the ordinary kind." } },
    _none = { { id = "tp_none", text = "Not in any book I own, and I own most of them." } },
  },
}

-- Jorik Kerridan: behind the abbey, out of sight.
P:NPC {
  key = "jorik", id = TODO_NPC("Jorik Kerridan"), name = "Jorik Kerridan", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "cunning", "honest" },
  notices = { "stealth" },
  impression = {
    first = "Jorik Kerridan works behind the Abbey where the Brothers needn't see him, and that seems to suit everybody. He was listening for my footsteps long before I reached him.",
    third = "{name} met Jorik Kerridan, who teaches the quiet arts behind Northshire Abbey, well out of the Brothers' sight.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Took you long enough to find me, and that's good; it means I'm doing my job." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Lost? Your trainer's out front somewhere, so go and find them." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Nice try, but I heard your buckle. Lose the buckle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jorik. I teach the quiet arts back here, where the Brothers don't have to watch, and they prefer it that way as much as I do." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Encrypted Letter"), days = 1 } },
          text = "You read the letter, or you couldn't have found me. Good. Lesson one: never trust anything you didn't decode yourself." },
        { id = "h_defias", when = { class = "ROGUE", topicKnown = "defias" },
          text = "The Brotherhood will try to recruit you, because people who move like you are worth a lot to them. Don't let anyone own you, whoever's asking." },
        { id = "h_seen", when = { metBefore = true }, text = "I heard you coming three steps off, which is better than last time. Last time it was ten." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, behind the stables? Either you're lost or you've come to save me, and I'll take lost; it's less work for both of us." },
        { id = "h_veteran", when = { class = "ROGUE", minLevel = 20 },
          text = "There you are, and I didn't hear you at all that time. Don't look so pleased; I'm getting old, is all." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket", class = "ROGUE" },
          text = "Canal-born; I can tell by how you count the exits before the faces. You'll skip half of lesson one, and I'll make you sit through it anyway." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down; the horses gossip." },
        { id = "h_again2", text = "Go on, and keep it quick and quiet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who do rogues answer to?", next = "answer", when = { class = "ROGUE" } },
        { text = "Your letter said business has never been better.", next = "trade", when = { class = "ROGUE" } },
        { text = "Why teach behind the stables?", next = "stables" },
        { text = "What would you teach someone like me?", next = "outsider", when = { ["not"] = { class = "ROGUE" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "Dwarves aren't meant to be quiet, they tell me.", next = "dwarf", when = { race = "Dwarf", class = "ROGUE" } },
        { text = "The Watchers taught me to go unseen.", next = "watchers", when = { race = "NightElf", class = "ROGUE" } },
        { text = "What do you think of the other teachers?", next = "teachers" },
        { text = "I'll go.", next = "END" },
      },
    },
    answer = {
      lines = { { id = "a_default", text = "Ourselves, mostly, and the crown, through people in Old Town you'll meet when you're ready, and not before." } },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to myself, not to the crown.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And if I'd rather answer to nobody?", next = "answer_nobody" },
      },
    },
    answer_nobody = {
      lines = { { id = "an_default", text = "Then somebody will find you useful anyway, so better to pick who. That's the only freedom this trade gives you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    trade = {
      lines = {
        { id = "t_default", text = "Never better. War's honest; everyone knows who the enemy is. It's when a peace starts to rot that people want spies, scouts and quiet knives." },
      },
      choices = {
        { text = "Who's hiring?", next = "trade_who" },
        { text = "That's a grim way to make a living.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Sounds like good work, if you can get it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    trade_who = {
      lines = {
        { id = "tw_default", text = "SI:7. The Defias, who want eyes inside Stormwind. A few nobles who'd want both. Pick the one you can live with, and remember you're your own person.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "The crown, then.", next = "BACK", fx = { align = { order = 2 }, affinity = 1 } },
        { text = "Whoever pays best.", next = "BACK", fx = { align = { order = -2, honor = -1 }, trait = { greedy = 1 } } },
      },
    },
    stables = {
      lines = { { id = "s_default", text = "Because nobody looks at a stable. The brothers don't come round, the recruits come round once. The horses keep their opinions to themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outsider = {
      lines = { { id = "o_default", text = "To check your purse after you've talked to anyone friendly, starting now. Go on, check it." } },
      choices = {
        { text = "It's all there.", next = "outsider_purse" },
        { text = "Very funny.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    outsider_purse = {
      lines = { { id = "op_default", text = "This time, it is, and that's the lesson. It's free of charge, which is more than my students get." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Walking across the gravel behind the stables without a sound, and then doing it again with a kobold candle on your head. When the candle stays lit, we'll talk about knives." } },
      choices = {
        { text = "A candle? Really?", next = "practise_candle" },
        { text = "I'll start tonight.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_candle = {
      lines = { { id = "practise_candle_l", text = "Really. It teaches you to keep your head still, and a still head is a quiet body. The kobolds use them for the same reason, they just don't know it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "They tell you wrong. A dwarf stands still better than anyone I've trained, and still is most of quiet. It's the boots that give you away, so we'll start with the boots." },
        { id = "dwarf_loch", when = { origin = "dwarf_loch_smuggler" },
          text = "They tell you wrong, and you know it; a smuggler who ran the Loch at night knows quiet better than most. It's the boots that give you away, so we'll start with the boots." },
      },
      choices = { { text = "Leave my boots out of this.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    watchers = {
      lines = { { id = "watchers_l", text = "Then you'll find my lessons crude, and you'll be right. But Northshire isn't a forest, and humans look at shadows differently than your people do; I'll teach you how a human guard thinks, which is the half the Watchers couldn't." } },
      choices = {
        { text = "How does a human guard think?", next = "watchers_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watchers_guard = {
      lines = { { id = "watchers_guard_l", text = "About his supper, mostly, and whether the sergeant's watching. Give him a reason to look away and he'll take it gladly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teachers = {
      lines = { { id = "teachers_l", text = "Bremen thinks I stole a book from his library. I didn't, but I know who did, and I've let him keep worrying because it keeps him locking doors." } },
      choices = {
        { text = "Tell him the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A worried mage locks more doors. Clever.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the man behind the stables. That's all the story anybody back here needs." } },
    advice = { { id = "tp_ad", text = "Never stand where you can be seen from the road, never sit with your back to a door, and never tell anyone your real plans, including me." } },
    defias = { { id = "tp_defias", text = "They want spies in Stormwind, so don't be one. That's the whole of my advice." } },
    _none = { { id = "tp_none", text = "Back here we deal in what's useful, and that isn't." } },
  },
}

-- Drusilla La Salle: among the graves, beside Dane Winslow.
P:NPC {
  key = "drusilla", id = TODO_NPC("Drusilla La Salle"), name = "Drusilla La Salle", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "ambitious", "cunning" },
  notices = { "pet", "fel" },
  impression = {
    first = "Drusilla La Salle teaches among the graves because the Brothers prefer not to see her, and she seems to prefer it too. She spoke of patience and prudence as if power were the reward for both.",
    third = "{name} met Drusilla La Salle, who keeps to the Northshire graveyard and finds the Brothers' prayers for her oddly touching.",
  },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Patience, then prudence, then power, in that order or not at all." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "This isn't for you, and the darkness doesn't want you. Go away." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's making faces at the gravestones, so correct it. Small disobediences grow." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 20 } },
      text = "You're reaching faster than you're learning. I can smell it on you. Slow down, or you'll be one of the weak ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "La Salle. I teach out here among the dead because the Brothers prefer not to see me, and the dead don't mind; they're very good listeners." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tainted Letter"), days = 1 } },
          text = "McBride's letter, and his nose wrinkled as he wrote it, I'm sure. Welcome. The arcane devours the weak. We'll see what it makes of you." },
        { id = "h_level", when = { class = "WARLOCK", minLevel = 10 },
          text = "Goldshire. The cellar of the Lion's Pride. Ask for Marcot. Don't ask for anything else down there." },
        { id = "h_brothers", when = { metBefore = true }, text = "The Brothers prayed for me again this morning, loudly. I find it touching, in its way." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Stolen Tome") },
          text = "The book is in their tent in the vineyard. A Defias tent, guarded by men who can't read it. Bring it to me, not to the Brothers." },
        { id = "h_tome_done", when = { questDone = TODO_QUEST("The Stolen Tome") },
          text = "I've read three chapters of it. You were right to fetch it, and the Brothers were right to lock it up. Both can be true." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest among my graves. Have you come to bless them? They're past it, and if you've come to bless me, so am I." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar", class = "WARLOCK" },
          text = "Gakin's cellar sent you, did it, or rather you sent yourself there, down those stairs, and kept going. You'll find the graves quieter, and the lessons slower." },
      },
      again = {
        { id = "h_again", text = "Well? The dead are patient, but I am less so." },
        { id = "h_again2", text = "Ask, then, and briefly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why do the Brothers tolerate you?", next = "tolerate" },
        { text = "Is there anything in their library you want?", next = "tome", when = { class = "WARLOCK" } },
        { text = "The Light would call this dabbling in darkness.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Who's the man beside you?", next = "dane" },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Do warlocks serve the Burning Legion?", next = "legion", when = { class = "WARLOCK" } },
        { text = "Gnomeregan's forbidden shelves taught me the basics.", next = "gnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },
    tolerate = {
      lines = { { id = "t_default", text = "Because the kingdom needs every weapon it has, and I am a very good weapon. They pray about it, and I let them." } },
      choices = {
        { text = "And do you believe in the Light?", next = "tolerate_light" },
        { text = "...", next = "BACK" },
      },
    },
    tolerate_light = {
      lines = { { id = "tl_default", text = "I believe in what answers when it's called. The Light answers the Brothers, they tell me. I've never needed to ask it for anything." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    tome = {
      lines = {
        { id = "to_default", text = "Powers of the Void. They kept it in the protected wing, where a warlock loitering by the shelf would be noticed. Then a novice ran off to the Defias with it.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "So you want me to steal it back.", next = "tome_steal" },
        { text = "Shouldn't it go back to the Brothers?", next = "tome_brothers" },
      },
    },
    tome_steal = {
      lines = { { id = "ts_default", text = "I want it on a shelf, mine. The Defias did the stealing and you'll only be moving it, so consider it your first test; fail it, and you'll never hold an imp." } },
      choices = {
        { text = "Then show me the work.", next = "BUSINESS", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome_brothers = {
      lines = { { id = "tb_default", text = "So they can lock it up again and never read it? A book nobody reads is a waste of a tree. Think about which of us would use it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "Your people frighten the curious away from real power. Not everything from beyond this world wants to rule you. Hold enough power, and it follows instead." },
      },
      choices = {
        { text = "Until the day it doesn't.", next = "priest_day", fx = { align = { light = 1 } } },
        { text = "It's not too late to turn back.", next = "priest_turn", fx = { align = { light = 2 }, trait = { kind = 1 } } },
      },
    },
    priest_day = {
      lines = { { id = "pd_default", text = "Then I'll have been weak, and the arcane devours the weak. I've said so to every student. I'd be a poor teacher to exempt myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_turn = {
      lines = { { id = "pt_default", text = "Turn back to what, kneeling in a hall that won't let me near its shelves? Go and pray for me if it helps you, but it won't help me." } },
      choices = {
        { text = "I'll pray anyway.", next = "BACK", fx = { align = { light = 1 }, affinity = -1, trait = { pious = 1 } } },
        { text = "Then I won't waste my prayers on you.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    dane = {
      lines = {
        { id = "d_default", text = "Winslow. When a warlock tires of a minion, he sees to its unmaking for a fee, and it's tidy work; the graveyard suits him." },
        { id = "d_other", when = { ["not"] = { class = "WARLOCK" } },
          text = "Winslow. His services are for warlocks only, so you've no reason to stand near him. Or me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Your imp's obedience and your own patience, which are the same lesson from two ends. Command it to fetch, and when it sulks, wait it out; whoever tires first loses." } },
      choices = {
        { text = "And if it never stops sulking?", next = "practise_sulk" },
        { text = "I'll outlast it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_sulk = {
      lines = { { id = "practise_sulk_l", text = "Then you'll have learned that patience is power, which is the whole of my teaching, and you'll have learned it from an imp. There are worse teachers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    legion = {
      big = true,
      lines = { { id = "legion_l", text = "The Legion made the creatures we bind, as a smith makes a sword. A sword doesn't serve the smith, and neither do I, though the Brothers would tell you there's no difference." } },
      choices = {
        { text = "The smith may want his sword back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then we take the Legion's weapons and turn them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Has anyone come asking for theirs?", next = "legion_ask" },
      },
    },
    legion_ask = {
      lines = { { id = "legion_ask_l", text = "Not yet, and I'd rather not discuss it among the graves. They're very good listeners, as I said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "gnome_l", text = "Then you've learned the basics badly and from a book with nobody to stop you, which is how most of the Defias' novices learn their trade too. We'll unlearn it, slowly." },
        { id = "gnome_texts", when = { origin = "gnome_forbidden_texts" },
          text = "You took those books while your city burned, and nobody was there to stop you reading the wrong chapters first. We'll unlearn it, slowly." },
      },
      choices = {
        { text = "My method was perfectly sound.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Slowly, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the first lessons to the ones the Brothers would rather not see. My history is my business." } },
    advice = { { id = "tp_ad", text = "The arcane only corrupts the weak. Remember that whatever road you take, and especially if it's mine." } },
    northshire_abbey = { { id = "tp_abbey", text = "Very holy, with very loud bells. I'm out here for the quiet." } },
    defias = { { id = "tp_defias", text = "Thieves who stole a book they can't read. I've been grateful to them exactly once." } },
    _none = { { id = "tp_none", text = "Ask the dead. They know more than you'd think." } },
  },
}

---------------------------------------------------------------------------
-- Goldshire
---------------------------------------------------------------------------

-- Lyria Du Lac: behind the smithy, next to Brother Wilhelm.
P:NPC {
  key = "lyria", id = TODO_NPC("Lyria Du Lac"), name = "Lyria Du Lac", title = "Warrior Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "brave", "stern" },
  notices = { "kit" },
  impression = {
    first = "Lyria Du Lac greeted me with her shield up and didn't apologise for it. She says the kingdom's strength is whoever stands on its walls, and she says it like an order.",
    third = "{name} met Lyria Du Lac in Goldshire, who turns Elwynn's farm hands into Stormwind's soldiers.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Shield up, always, even when you're greeting me." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "This is for fighters, so try something safer. Knitting, maybe." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "You let them hit you. A lot. Stormwind's warriors take a beating; they don't invite one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Du Lac. I make Stormwind's soldiers out of Elwynn's farm hands. The kingdom's strength isn't its walls. It's whoever's standing on them." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("A Warrior's Training") },
          text = "Your training's not finished. There's someone you need to see, and you'll have to go and find them. That's part of it." },
        { id = "h_wilhelm", when = { class = "PALADIN" },
          text = "Wilhelm's round the side. Tell him I'll have the practice yard back by noon. He'll know what that means." },
        { id = "h_dawn", when = { metBefore = true }, text = "You're up early, good. The recruits weren't, but they are now." },
        { id = "h_llane", when = { class = "WARRIOR", maxLevel = 12 },
          text = "Beshere's work, from the Abbey. I can tell by the feet. He teaches stance like it's scripture. Good. Now we'll see what you do with it." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 25 },
          text = "Look at you, with a shield that's been used and armour that's been mended twice. Stormwind's lucky to have you, though don't tell it I said so." },
        { id = "h_guard", when = { origin = "human_city_guard", class = "WARRIOR" },
          text = "A Watch recruit, by that grip, come out to the country to learn what a real fight smells like. Good; the halberd taught you to stand, and I'll teach you to stop leaning on it." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your shield up while you ask." },
        { id = "h_again2", text = "Go on, the yard's waiting." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Why is Stormwind's strength in its people?", next = "pillar" },
        { text = "Who is this Harry Burlguard?", next = "harry", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "I worked Westfall's fields before this.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "Dwarves fight differently from your farm hands.", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "Does a gnome have a place in your line?", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "The Sentinels trained me with a glaive.", next = "kaldorei", when = { race = "NightElf", class = "WARRIOR" } },
        { text = "What do you think of the other trainers in Goldshire?", next = "trainers" },
        { text = "I'll go.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "Getting up. Everyone gets knocked down, and warriors are the ones who are annoyed about it." } },
      choices = {
        { text = "And a great one?", next = "good_great" },
        { text = "I'll remember.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    good_great = {
      lines = { { id = "gg_default", text = "Someone who gets up, then hauls the one beside them up too. One warrior's a fighter, but two who pick each other up are a line." } },
      choices = {
        { text = "Then I'll be the one who hauls them up.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll look after myself first, because that's how you survive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pillar = {
      big = true,
      lines = {
        { id = "pi_default", text = "Because Lordaeron fell, and Stromgarde's barely standing. Stormwind's what holds humanity up now, with will and a good blade, and nothing else will do it." },
      },
      choices = {
        { text = "Then I'll be one of the blades.", next = "BACK", fx = { align = { order = 2 }, affinity = 2 } },
        { text = "I'll fight for myself, not for a kingdom.", next = "BACK", fx = { align = { order = -2 } } },
        { text = "Lordaeron had will and blades too.", next = "pillar_lordaeron" },
      },
    },
    pillar_lordaeron = {
      lines = {
        { id = "pl_default", text = "It did. And it rotted from inside. That's why I drill the recruits on the walls and not just the field. You watch your own side too." },
        { id = "pl_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You'd know. You walked out of it. Then you know better than any recruit here why I don't stop drilling." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    harry = {
      lines = {
        { id = "h2_default", text = "An old veteran who drinks at the Pig and Whistle in Old Town, and a good teacher. He'll teach you things I'm not allowed to show recruits in daylight." },
      },
      choices = {
        { text = "Not allowed?", next = "harry_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harry_more = {
      lines = { { id = "hm_default", text = "Dirty fighting, mostly, the tavern kind, and you'll see what I mean. Bring coin for the drinks; he'll expect you to keep up." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Then you've lifted more than half my recruits ever will. Lift a shield like a sack of grain, close to the body, and you'll be fine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Rend, Heroic Strike and Charge, every morning, on the dummies behind the smithy, and then again when you're tired. Anyone can swing fresh; it's the tired swing that keeps you alive at Jasperlode." },
        { id = "practise_old", when = { minLevel = 20 },
          text = "Your shield, and changing stance in the middle of a fight. You've got the swinging down; now learn to stop swinging when the thing in front of you is bigger than you are." },
      },
      choices = {
        { text = "Why practise tired?", next = "practise_tired" },
        { text = "I'll be at the dummies at dawn.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    practise_tired = {
      lines = { { id = "practise_tired_l", text = "Because the kobolds won't wait for you to catch your breath. Train tired, fight fresh, that's the whole of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "They do, and better, some of them. You plant your feet like the ground owes you money, and I'll not change that; I'll only teach you how Stormwind's lines form up, so you're not standing alone in front of one." },
        { id = "dwarf_ward", when = { origin = "dwarf_military_ward" },
          text = "Military Ward, I'd wager, by the way you stand. You plant your feet like the ground owes you money, and I'll only teach you how Stormwind's lines form, so you're not alone in front of one." },
      },
      choices = {
        { text = "A dwarf is never alone. We stand together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stand where I please, lines or none.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Low in it, under the shields, where the gnolls can't reach you and you can reach their knees. My farm hands laugh until the first sparring match, and then they ask you for lessons." } },
      choices = { { text = "Let them laugh.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    kaldorei = {
      lines = {
        { id = "kaldorei_l", text = "So I see; you move like a blade that's been dancing for a thousand years, and maybe you have. I've nothing to teach you about grace, but I can teach you how a human line moves, and why it moves so badly." },
        { id = "kaldorei_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You stood watch on a beach, I'd guess, where the sand shifts under you; it shows. I can teach you how a human line moves, and why it moves so badly." },
      },
      choices = { { text = "Show me, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Wilhelm shares my yard and my patience, the priestess upstairs patches my recruits, and the mage keeps them from playing with fire. Whatever's in Farley's cellar, I don't ask, and I don't send my recruits down there." } },
      choices = {
        { text = "Why not ask?", next = "trainers_cellar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers_cellar = {
      lines = { { id = "trainers_cellar_l", text = "Because the kingdom wants them, and the kingdom pays me, and I'd rather not know what my pay is standing next to. A soldier picks her battles." } },
      choices = {
        { text = "They should be run out of Goldshire.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The kingdom needs every weapon it has.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A warrior of Stormwind who trains others behind a smithy. The smithy was here first. I've made my peace with it." } },
    advice = { { id = "tp_ad", text = "Keep your shield up and your boots laced. More recruits die of a loose boot than a gnoll." } },
    hogger = { { id = "tp_hogger", text = "Every warrior I train goes after him too early, every last one. Go after him late." } },
    _none = { { id = "tp_none", text = "Not my business. My business is the practice yard." } },
  },
}

-- Priestess Josetta: upstairs at the Lion's Pride; wishes she'd been braver when young.
P:NPC {
  key = "josetta", id = TODO_NPC("Priestess Josetta"), name = "Priestess Josetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "travel", "form" },
  impression = {
    first = "Priestess Josetta speaks warmly and a little wistfully, like someone who always meant to go far and stayed instead. She looked at my boots with something close to envy.",
    third = "{name} met Priestess Josetta, who teaches the Light above the noise of the Lion's Pride and envies those who travel.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome, friend in the Light. Come in from the noise." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn away from the Light, friend, whatever road you're on." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You went a long way to come back looking like that. The road, or the lessons? Never mind. I'm glad you came back at all." },
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've been far, haven't you? I can tell by your boots. I always meant to go far myself, and I meant to for thirty years." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Josetta. I teach the Light up here, above the noise of the common room, or mostly above it." },
        { id = "h_garments", when = { questActive = TODO_QUEST("Garments of the Light") },
          text = "There are folk on the road who need mending more than they'll admit. Find them and heal them, and don't wait to be asked." },
        { id = "h_prayer", key = true, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "There's more for you beyond Goldshire. Go and learn it. I'll be here, envying you a little." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Anetta sent you down from the Abbey. She only sends the ones she's proud of. Don't tell her I told you." },
        { id = "h_forever", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Confounding Flash") }, { questActive = TODO_QUEST("Divine Grace") } } },
          text = "A new lesson! Even I'm still learning them, but don't tell the Cathedral that either." },
        { id = "h_young", when = { maxLevel = 12 },
          text = "When I was your age I wanted to see the whole world, and I stayed in Goldshire instead. Don't do that, little one; go." },
        { id = "h_go", when = { metBefore = true }, text = "You're still here? That's good, and not good. The world's bigger than Goldshire, little one, so go and see it, and come back and tell me." },
        { id = "h_far", tags = { "news" }, when = { class = "PRIEST", minLevel = 30, metBefore = true },
          text = "You came back, you actually came back, from wherever that tan's from! Sit down and tell me everything, and start with the sea." },
      },
      again = { { id = "h_again", text = "What else? Mind the floorboard; it squeaks to Farley." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why didn't you travel?", next = "travel" },
        { text = "Where would you have gone?", next = "where" },
        { text = "Tell me about the Cathedral.", next = "cathedral", when = { class = "PRIEST" } },
        { text = "I've been far. Want to hear about it?", next = "stories", when = { minLevel = 30 } },
        { text = "Thank you.", next = "END" },
      },
    },
    travel = {
      big = true,
      lines = { { id = "t_default", text = "Courage, mostly, or the lack of it. There was always a reason to stay one more season, and seasons add up." } },
      choices = {
        { text = "It's not too late.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Goldshire needed you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Everywhere! The sea first, because I've never seen it, then the mountains, and the forests where the elves live, and a desert, just to feel too hot once." } },
      choices = {
        { text = "I'll bring you back something from the sea.", next = "BACK", fx = { affinity = 3, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral = {
      lines = { { id = "c_default", text = "Bigger than you'd think, and quieter. High Priestess Laurena will teach you there when you're ready; she's stern, and she's also right, which is worse." } },
      choices = {
        { text = "Why didn't you go to the Cathedral?", next = "cathedral_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_why = {
      lines = { { id = "cw_default", text = "Someone has to be here for the ones who aren't ready yet. That's what I tell myself. Some days it's even true." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    stories = {
      lines = {
        { id = "s_default", text = "Yes, sit down! Did you see the sea, and what colour was it? Don't say blue; everyone says blue." },
        { id = "s_booty", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "You've been to Booty Bay, with the pirates? Oh, I'd have fainted. Tell me slowly, from the beginning." },
      },
      choices = {
        { text = "Grey, mostly. And loud.", next = "BACK", fx = { affinity = 3 } },
        { text = "Green, near the shore. Like old glass.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A priestess of Goldshire, above the noise of the inn, for longer than I meant to be.", next = "travel" } },
    advice = { { id = "tp_ad", text = "Go somewhere you've never been, once a year at least. The Light looks different from a new place." } },
    lions_pride = { { id = "tp_inn", text = "A lovely inn with thin floors, so I know all of Farley's stories by heart." } },
    _none = { { id = "tp_none", text = "I've never been far enough to know that, so ask someone who's travelled." } },
  },
}

-- Zaldimar Wefhellt: upstairs at the Lion's Pride, left at the top of the stairs.
P:NPC {
  key = "zaldimar", id = TODO_NPC("Zaldimar Wefhellt"), name = "Zaldimar Wefhellt", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "curious" },
  notices = { "arcane" },
  impression = {
    first = "Zaldimar Wefhellt makes do with an upstairs room and a view of a stable, and he makes do with considerable style. He seems to find nearly everything at least a little interesting.",
    third = "{name} met Zaldimar Wefhellt of the Wizard's Sanctum, who teaches magic from a modest room above Goldshire's inn.",
  },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a colleague, a junior colleague! Come in, and mind the books." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Magic hurts the untrained, so please stand over there. A little further." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage, in my little room above an inn. The Kirin Tor will be jealous. I intend to enjoy that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wefhellt, of the Wizard's Sanctum, currently of the upstairs room at the Lion's Pride. The view is of a stable, but one makes do." },
        { id = "h_jennea", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Jennea in the city wants a word with you. She's sharper than I am. Don't tell her I said so; she'll have it engraved." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Jennea") },
          text = "Jennea again, twice in one apprenticeship? She must like you, and I'd be worried." },
        { id = "h_stable", when = { metBefore = true }, text = "The stable boy has taken to whistling beneath my window every morning, in a key I'm fairly certain doesn't exist." },
        { id = "h_khelden", when = { class = "MAGE", maxLevel = 12 },
          text = "Bremen sent you down from the Abbey. He'll have drilled you on the four rules until you dreamed them. Good. We can skip to the interesting part." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Josetta's down the hall, friend. Though if you've a moment, I'd love to know how the Light feels from the inside. Purely academically." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, before the singing starts downstairs." },
        { id = "h_again2", text = "Do go on. It's rare anyone up here asks me anything but the way out." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why teach above an inn?", next = "inn" },
        { text = "What does Jennea want with me?", next = "jennea", when = { class = "MAGE", minLevel = 10 } },
        { text = "What's the worst a mage can become?", next = "worst" },
        { text = "How does the Light feel? Warm, mostly.", next = "light", when = { class = "PRIEST" } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "Gnomes make better mages than humans, you know.", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "Would you like to see a High Order form?", next = "skyborne", when = { race = "Skyborne", class = "MAGE" } },
        { text = "What do you make of the cellar below?", next = "cellar" },
        { text = "Farewell.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "i_default", text = "Because Goldshire's recruits come up these stairs, and the Sanctum's are steeper. Someone has to catch the young ones before they set Elwynn on fire." },
      },
      choices = {
        { text = "And the singing?", next = "inn_singing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_singing = {
      lines = { { id = "is_default", text = "I've tried silencing spells, but Farley considers it rude, and Farley is correct. I've learned to read through it instead." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    jennea = {
      lines = {
        { id = "j_default", text = "Something to do with the safety of Stormwind and Elwynn both. She'll tell you in her own time, which is longer than yours." },
        { id = "j_report", when = { questActive = TODO_QUEST("Report to Jennea") },
          text = "It's your first look at what we don't talk about downstairs. There is a quiet war, and the Sanctum fights it; go and see, and then you'll understand Jennea." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    worst = {
      big = true,
      lines = {
        { id = "w_default", text = "Morganth. Once a student of Stormwind's mages, banished for dark magic. Now he commands Redridge's gnolls from a tower of his own.",
          fx = { learn = { "morganth" } } },
      },
      choices = {
        { text = "What went wrong with him?", next = "worst_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_why = {
      lines = { { id = "ww_default", text = "Nothing anyone noticed in time. That keeps teachers awake, and Theocritus at the Tower of Azora too. I'm watching you now, a little." } },
      choices = {
        { text = "Watch away.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's unsettling.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    light = {
      lines = { { id = "l_default", text = "Warm, mostly. You see, that's exactly the sort of answer the Cathedral gives, but I'll put it in my notes anyway, and thank you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Arcane Intellect on everyone you travel with, whether they ask or not, and conjuring water before you're thirsty. A mage's first duty is to be useful, and the glamorous duties come a distant second." } },
      choices = {
        { text = "I'd rather practise the glamorous ones.", next = "practise_glam" },
        { text = "Useful first. I understand.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    practise_glam = {
      lines = { { id = "practise_glam_l", text = "Everyone would, and the ones who do end up like Morganth, alone in a tower with gnolls for company. Conjure the water, and be loved." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Better engineers of spells, certainly, and worse at stopping to wonder whether they should. I've had gnome students rebuild a Polymorph and turn me into a very confused sheep." } },
      choices = {
        { text = "That was an improvement, surely.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Wondering whether is a human luxury.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "Would I! Here, on this rug, and mind the inkwell. Fascinating; it's older than anything the Sanctum teaches, and it's beautiful, and I'll be insufferable to Jennea about it for a month." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    cellar = {
      big = true,
      lines = { { id = "cellar_l", text = "That it's under the same floorboards as I am, which I try not to dwell upon. Mages and warlocks start from the same books, you know; the difference is which chapter they couldn't resist." } },
      choices = {
        { text = "Then the books should be locked away.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every chapter should be read. That's scholarship.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Which chapter tempts you?", next = "cellar_you" },
      },
    },
    cellar_you = {
      lines = { { id = "cellar_you_l", text = "None, I'm proud to say, and the chapter on stable boys' whistling most of all. Ask me again after the singing starts." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Of the Wizard's Sanctum, seconded to Goldshire. I volunteered, though nobody believes that." } },
    advice = { { id = "tp_ad", text = "Learn to stop a spell halfway. Starting them is easy, but stopping them is what keeps your eyebrows." } },
    morganth = { { id = "tp_morganth", text = "The Redridge business: a student who went wrong, which is every teacher's nightmare. Theocritus takes it personally, and he's right to." } },
    lions_pride = { { id = "tp_inn", text = "Comfortable, if you don't mind the singing, and I mind the singing." } },
    _none = { { id = "tp_none", text = "Outside my field. My field is large, but that's outside it." } },
  },
}

-- Keryn Sylvius: SI:7's eye in Goldshire, in the reading room.
P:NPC {
  key = "keryn", id = TODO_NPC("Keryn Sylvius"), name = "Keryn Sylvius", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "stealth" },
  impression = {
    first = "Keryn Sylvius reads in the corner of a quiet room and treats every question as a small intrusion. I'm fairly sure the book isn't the only thing she's watching.",
    third = "{name} met Keryn Sylvius, who trains Goldshire's quiet ones from behind a book she admits is dreadful.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Well, well, look who crawled up the stairs." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Wrong room, friend; the door's behind you." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "You're sneaking, in a reading room, where everyone's quiet already. Think about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sylvius. I train the quiet ones in Goldshire and read a lot of books I don't need, and both are cover, and neither is your business." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("Seek out SI: 7") },
          text = "Old Town, in the city. Don't ask anyone for directions. If you can't find SI:7 without help, SI:7 doesn't need you." },
        { id = "h_si7_done", when = { questDone = TODO_QUEST("Seek out SI: 7") },
          text = "So the Master's seen you. Did he smile? He doesn't, as a rule, so if he did, start worrying." },
        { id = "h_book", when = { metBefore = true }, text = "I'm on chapter nine, and it's dreadful, but I'll finish it anyway. Everyone needs a vice that isn't the job." },
        { id = "h_fish", when = { class = "ROGUE", maxLevel = 12 },
          text = "A fresh fish from Jorik's stable. He sends me the ones who can at least find the stairs. Let's see if you can find anything else." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Josetta's room is down the hall. This one's for reading, and I'm reading. You'll forgive me if I don't confess anything." },
      },
      again = {
        { id = "h_again", text = "Still here? Then make it worth the page I've lost." },
        { id = "h_again2", text = "Something else? Keep it quiet, if you would." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who's the Master?", next = "master", when = { class = "ROGUE" } },
        { text = "What are you reading?", next = "book" },
        { text = "The Defias tried to recruit me.", next = "defias", when = { class = "ROGUE", topicKnown = "defias" } },
        { text = "Is this room open to anyone?", next = "room", when = { ["not"] = { class = "ROGUE" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "I go back into Gnomeregan for parts nobody else will fetch.", next = "gnome", when = { origin = "gnome_scavenger" } },
        { text = "A kaldorei sees things a human misses.", next = "kaldorei", when = { race = "NightElf", class = "ROGUE" } },
        { text = "What do you think of the other trainers here?", next = "trainers" },
        { text = "Wrong room. Sorry.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Shaw. You'll meet him, or he'll meet you, which is different, and worse." } },
      choices = {
        { text = "What's he like?", next = "master_like" },
        { text = "...", next = "BACK" },
      },
    },
    master_like = {
      lines = { { id = "ml_default", text = "Loyal to the crown and tired of everyone else. He'll mistake you for the cheese delivery, and you should let him; it's a test, and most fail it by arguing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    book = {
      lines = { { id = "b_default", text = "A romance: two feuding families, two lovers and far too many balconies. It's terrible, and I can't stop, so don't you dare tell Farley." } },
      choices = {
        { text = "Why read it, if it's terrible?", next = "book_why" },
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    book_why = {
      lines = { { id = "bw_default", text = "A woman with a book can sit in a reading room all day and watch the stairs. A woman without one is loitering. Turn the page now and then." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    defias = {
      big = true,
      lines = {
        { id = "d_default", text = "Of course they did. Tell me who and where, then forget you told me, and keep saying no politely, because polite noes live longer.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "A man by the vineyards. I said no.", next = "BACK", fx = { align = { order = 2 }, affinity = 2 } },
        { text = "A man by the vineyards, and I'm still thinking about his offer.", next = "BACK", fx = { align = { order = -2 } } },
        { text = "What if I said yes, and told you everything?", next = "defias_double" },
      },
    },
    defias_double = {
      lines = { { id = "dd_default", text = "Then you'd be doing SI:7's work without SI:7's protection, and you'd last a month. Ask the Master about that, not me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    room = {
      lines = { { id = "r_default", text = "To anyone who reads quietly. You're failing the second part already. Try the common room; it's louder, and so are you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Reading a room before you enter it, from the sounds through the door. I can tell you how many people are in the common room right now, which of them are drunk and which one's pretending; can you?" },
        { id = "practise_old", when = { minLevel = 20 },
          text = "Poisons, and patience with them. A blade that kills slowly is a blade that lets you leave before anyone knows there's been a killing, and leaving is the craft." },
      },
      choices = {
        { text = "Seven. Three drunk. The one by the fire is pretending.", next = "practise_count" },
        { text = "Teach me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    practise_count = {
      lines = { { id = "practise_count_l", text = "Eight; you missed the girl under the stairs. But the one by the fire, yes, he's SI:7, and if you tell him I said so I'll deny I've ever met you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Do you, now? Then you've done more burglary than any of my students, in worse conditions and under worse guards, and you call it salvage. I'd say the Master would like to meet you, but he'd rather you didn't know he'd heard of you." } },
      choices = {
        { text = "It is salvage. Gnomeregan is ours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Call it whatever pays.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "And misses things a human sees, like when a farmer's lying about his harvest. Your people are hard to fool in the forest and easy to fool in a tavern, and I'd fix that before Goldshire does it for you." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Josetta's kind, Wefhellt's vain and Du Lac thinks I'm a coward because I won't fight her in the yard. I won't fight her because she'd win, which isn't cowardice, it's arithmetic." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sit in a reading room and train rogues. If you want more than that, buy a better book than mine." } },
    advice = { { id = "tp_ad", text = "Carry something to read. Nobody suspects a reader, but everyone suspects someone standing in a corner doing nothing." } },
    defias = { { id = "tp_defias", text = "SI:7 has files and I have opinions, and neither leaves this room." } },
    _none = { { id = "tp_none", text = "Even if I knew, I wouldn't say, and especially if I knew." } },
  },
}

-- Remen Marcot: the Lion's Pride cellar, with Crowe and Darkheart.
P:NPC {
  key = "remen", id = TODO_NPC("Remen Marcot"), name = "Remen Marcot", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "cunning", "ambitious" },
  notices = { "pet" },
  impression = {
    first = "Remen Marcot treats the Lion's Pride cellar as a storeroom for dangerous knowledge, and he spoke fondly of Farley for never asking questions. He makes introductions as carefully as other men handle knives.",
    third = "{name} met Remen Marcot, who welcomes warlocks to the hidden cellar beneath the Lion's Pride.",
  },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down the stairs and out of the light, and you found us. Good." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The wine cellar's the other door, friend; this one's private." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Still on the imp? It's a start, but it's not a finish, and there's something heavier waiting for you when you're ready to carry it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marcot. Farley thinks this is a storeroom, and it is; we store knowledge, mostly, and some of it bites." },
        { id = "h_gakin", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Gakin wants you in the city, which means he thinks you're ready for a voidwalker. He's usually right, usually." },
        { id = "h_drusilla", when = { class = "WARLOCK", maxLevel = 12 },
          text = "La Salle sent you down from Northshire? She sends the patient ones, so don't disappoint her; she has a long memory and a short temper." },
        { id = "h_farley", when = { metBefore = true }, text = "Farley came down for a barrel yesterday and looked straight at us. Then he took the barrel and left. I've grown fond of him." },
        { id = "h_looking", when = { class = "WARLOCK", minLevel = 10 },
          text = "There you are. I spend half my days hunting for La Salle's students, and they walk down my stairs the moment I stop looking." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in the cellar. You'll want to go back up the stairs, friend. Nothing down here needs blessing, and some of it would object." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar", class = "WARLOCK" },
          text = "Gakin wrote that one of his cellar's own was coming down my stairs. You'll find ours drier and Farley friendlier, so mind you don't get too comfortable." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep it low, because the floor's thin and Farley's ears aren't." },
        { id = "h_again2", text = "Go on. The candles have an hour left in them." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Does Farley know what you do down here?", next = "farley" },
        { text = "Who are the other two down here?", next = "others" },
        { text = "What's a voidwalker like?", next = "void", when = { class = "WARLOCK", minLevel = 8 } },
        { text = "I could tell the brothers what goes on here.", next = "threat", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Gnomeregan had warlocks long before Goldshire did.", next = "gnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },
    farley = {
      lines = { { id = "f_default", text = "Farley knows we pay on time and don't break the furniture. That's all an innkeeper wants to know." } },
      choices = { { text = "Ha.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    others = {
      lines = {
        { id = "o_default", text = "Crowe teaches the craft. Darkheart sells what the craft needs. I fetch, carry and keep the door. Every coven needs someone who climbs stairs." },
      },
      choices = {
        { text = "A coven? Answering to whom?", next = "others_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_lamb = {
      lines = {
        { id = "ol_default", text = "The Slaughtered Lamb, in the city. Gakin the Darkbinder keeps its cellar the way we keep this one, quietly, and you'll keep the name quiet too." },
      },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell whoever I like.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "And if they're not?", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    void = {
      lines = { { id = "v_default", text = "Patient, obedient and very quiet, which is everything you aren't yet. It'll take a hit for you without complaint, but don't mistake that for loyalty." } },
      choices = {
        { text = "What is it, then?", next = "void_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    void_what = {
      lines = { { id = "vw_default", text = "Bound, and bound is all it is. The day you forget that is the day it remembers, so let Gakin make you earn the binding." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    threat = {
      lines = { { id = "t_default", text = "You could. They'd pray, Farley would sell them a drink, and we'd still be here on Tuesday, so have one yourself, upstairs." } },
      choices = {
        { text = "I'll be watching.", next = "BACK", fx = { align = { light = 1, order = 1 }, affinity = -1 } },
        { text = "Fair enough.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    practise = {
      lines = { { id = "practise_l", text = "Corruption and Life Tap, until you can spend your own blood without wincing, and Fear, until you can use it without enjoying it. The first keeps you casting and the second keeps you sane." } },
      choices = {
        { text = "I can't promise not to enjoy it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll practise without enjoying it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "It did, and Gakin says the best of them came south after the city fell, and the worst stayed and went mad in the dark. Which are you, I wonder, and do you know yet?" } },
      choices = {
        { text = "The best, obviously.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'm still finding out.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the one who runs messages for the coven, and teaches when Crowe's busy. It's honest work, by cellar standards." } },
    advice = { { id = "tp_ad", text = "If someone's looking for you all day, stand still. They'll find you the moment they stop. It's a law of nature." } },
    lions_pride = { { id = "tp_inn", text = "Best cellar in Elwynn: dry, quiet, and nobody asks questions." } },
    _none = { { id = "tp_none", text = "Ask upstairs; they like questions upstairs." } },
  },
}
