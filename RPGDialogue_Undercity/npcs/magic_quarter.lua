-- The Magic Quarter: Carendin Halgar and the warlock trainers, the mage trainers beside Anastasia Hartwell,
-- the artisan enchanter, and the reagent seller. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Carendin Halgar: the warlock who teaches the Forsaken to bind their first voidwalker.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_halgar", id = TODO_NPC("Carendin Halgar"), name = "Carendin Halgar",
  bible = "bibles/uc_halgar.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold", "sharp" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet" },
  impression = {
    first = "Carendin Halgar teaches warlocks to bind the void in the Magic Quarter, and he talks about demons the way a kennel master talks about dogs. He seemed to enjoy it when I flinched.",
    third = "{name} met Carendin Halgar, who teaches the Forsaken's warlocks to bind their first voidwalker.",
  },

  greetings = {
    { id = "g_default", text = "Mind the chalk on the floor. Some of those lines are holding something in, and I prefer that they go on holding it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. That puts you ahead of a few of my students." },
    { id = "g_summons", when = { questActive = TODO_QUEST("Halgar's Summons") }, text = "Ah, the one I sent for. You came quickly, which tells me you're either eager or afraid, and both can be put to use." },
    { id = "g_binding", when = { questActive = TODO_QUEST("The Binding") }, text = "The circle is waiting, and so is the thing you're going to put in it. Don't keep either of them waiting long." },
  },

  notice = {
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker hovers like a servant who has already guessed the end of the story. Good. Keep it that way." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Still dragging the imp about, I see. It's been talking about you behind your back, you know; they always do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Carendin Halgar. I teach the Forsaken who have the stomach for it to call things out of the Twisting Nether and make them kneel, and I'm very good at it." },
        { id = "h_binding_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Binding"), days = 3 } },
          text = "You came back with the voidwalker leashed and your mind intact. I've seen students come back with only one of those, and it's usually the wrong one." },
        { id = "h_lock", when = { class = "WARLOCK", race = "Scourge" },
          text = "One of ours. The plague took your heartbeat, so you've already lost the thing most demons want to frighten out of you, and that's a head start." },
        { id = "h_lock_living", when = { class = "WARLOCK", race = { "Orc", "Troll" } },
          text = "An orc warlock, or near enough, in the Dark Lady's quarter. Your people learned this art from worse teachers than me, and paid a good deal more for the lessons." },
        { id = "h_notlock", when = { ["not"] = { class = "WARLOCK" } },
          text = "You're not one of mine, so keep your hands out of the circles. I'll answer a question or two, though, since the curious are often the next to come asking for lessons." },
      },
      again = {
        { id = "h_again", text = "Something more? Quickly, please; the candles burn down and the wards with them." },
        { id = "h_again2", text = "Go on. I'm listening, though half my mind is on the circle behind you." },
      },
      choices = {
        { text = "What sort of thing do you call out of the Nether?", next = "void" },
        { text = "Why does the Dark Lady allow warlocks?", next = "allow" },
        { text = "You didn't learn all this from books alone.", next = "learned" },
        { text = "I'm ready for the binding, Halgar.", next = "binding", when = { class = "WARLOCK" } },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "I'll leave you to your chalk.", next = "END" },
      },
    },

    void = {
      lines = { { id = "vo_default", text = "A scrap of the Nether that has learned to be hungry and patient at once. It will stand between you and a blade all day long, and every hour of it, it will be thinking about the day you slip." } },
      choices = {
        { text = "And if I do slip?", next = "void_slip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    void_slip = {
      lines = { { id = "vs_default", text = "Then it stops serving and starts feeding, and someone like me is sent to tidy up what's left. I've tidied up three students so far, and I keep their chalk in a box by the door." } },
      choices = {
        { text = "Holding them like that would frighten me.", next = "void_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    void_fear = {
      big = true,
      lines = {
        { id = "vf_default", text = "Fear is for things that can still take something from you. The Scourge took most of what I had, so I hold the leash steady and let the demon do the worrying." },
        { id = "vf_living", when = { ["not"] = { race = "Scourge" } }, text = "Fear is for things that can still take something from you, and you, living one, have rather a lot left to take. I'd keep that in mind before you pick up any chalk." },
      },
      choices = {
        { text = "A demon on a leash is a demon used well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some doors are better left shut, Halgar.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    allow = {
      lines = { { id = "al_default", text = "Because the Scourge doesn't fight fair, and neither does the Scarlet Crusade, and the Dark Lady has no patience for scruples she can't afford. A demon that dies for us is one less Forsaken who has to." } },
      choices = {
        { text = "Do the apothecaries approve of you?", next = "allow_apoth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    allow_apoth = {
      big = true,
      lines = { { id = "aa_default", text = "They approve of results, which I provide, and they borrow my circles now and then for work they don't explain. We nod to one another across the canal, and that's all the approval anyone in this city expects." } },
      choices = {
        { text = "Whatever wins the war is worth using.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Some weapons cost more than they're worth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learned = {
      lines = {
        { id = "le_default", text = "Some from books that were burned in Lordaeron before the plague, and the rest from a cult that thought it was using me. The Cult of the Damned taught its servants generously, and was careless about whom it taught." },
        { id = "le_cult", when = { origin = "forsaken_cult_remnant" }, text = "From the same people who taught you, I suspect, before the Dark Lady broke their hold on us. The Cult of the Damned was generous with its lessons and careless about whom it taught." },
      },
      choices = {
        { text = "So you were one of the Cult.", next = "learned_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_cult = {
      lines = { { id = "lc_default", text = "I was a fool who wanted power and thought the price would come later, and I was right about the price. It came in a plague cloud over Andorhal, and I've been paying it back to the Scourge ever since, with interest." } },
      choices = {
        { text = "Then we've both got debts to collect.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    binding = {
      lines = {
        { id = "bi_default", text = "Then you know the shape of it: the glyphs, the circle, and the moment the thing first realises who holds the leash. Don't hesitate at that moment, because it will notice." },
        { id = "bi_active", when = { questActive = TODO_QUEST("The Binding") }, text = "Take the glyphs to the circle, speak the words the way I taught you, and when the voidwalker rises, beat it down until it understands. It respects nothing else, and nor should you." },
      },
      choices = {
        { text = "I'll be its master, not its partner.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather earn its loyalty than beat it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I made one bad bargain in life and a great many good ones since. Ask me about the good ones." } },
    advice = { { id = "tp_ad", text = "Never let a demon hear you hesitate. They can smell doubt the way a hound smells blood." } },
    _none = { { id = "tp_none", text = "That's nothing I've summoned, studied or bound, so it's nothing I care about." } },
  },
}

---------------------------------------------------------------------------
-- Richard Kerwin: warlock trainer, patient and pedantic.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_kerwin", id = TODO_NPC("Richard Kerwin"), name = "Richard Kerwin", title = "Warlock Trainer",
  bible = "bibles/uc_kerwin.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "dry", "calm" }, values = { "precise" },
  notices = { "class" },
  impression = {
    first = "Richard Kerwin teaches warlocks in the Magic Quarter like a schoolmaster drilling sums, and he seems to think a curse is mostly a matter of good handwriting. He's oddly reassuring for a man who trades in demons.",
    third = "{name} met Richard Kerwin, a patient warlock trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Sit, if you're staying, and don't touch the inkwell. It isn't ink." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Let's see whether your last lesson stuck or rotted." },
    { id = "g_woman", when = { gender = "female", class = "WARLOCK" }, text = "Ah, madam. Your curses were the neatest in the quarter last time, and I've been waiting to see if you could keep it up." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your sigils are smudged. A smudged sigil is how a curse goes home to the person who cast it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Richard Kerwin. I train the warlocks of the Magic Quarter, which mostly means teaching clever people to be careful, and that's the hardest lesson there is." },
        { id = "h_notlock", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so I've nothing to teach you, but I'll answer a civil question. Nobody else in this quarter asks me any." },
      },
      again = {
        { id = "h_again", text = "Another question? Good. Questions are cheaper than mistakes." },
        { id = "h_again2", text = "Go on, I'm still here. I'm always still here." },
      },
      choices = {
        { text = "Why does careful matter so much?", next = "careful" },
        { text = "You have the manner of a teacher.", next = "before" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Good day, Kerwin.", next = "END" },
      },
    },
    careful = {
      lines = { { id = "ca_default", text = "Because every spell we cast is a contract, and the other party reads the small print far more closely than we do. I've seen a warlock lose his voice for a year over one misplaced syllable." } },
      choices = {
        { text = "Then the rules are worth keeping exactly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules are for those without the will to bend them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "be_default", text = "A tutor to a merchant's children in the capital, teaching letters and sums. I find the work hasn't changed much, except that my current pupils are more likely to set the room on fire." } },
      choices = {
        { text = "Do you miss the children?", next = "before_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_miss = {
      lines = { { id = "bm_default", text = "I try not to wonder where they are, because the answer is either the Plaguelands or somewhere I'll never be welcome again. Neither is a thought worth keeping, so I keep chalk instead." } },
      choices = {
        { text = "Remembering them is worth the ache.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Best to bury it, Kerwin.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Read every word twice, and say it once. The Nether doesn't take corrections." } },
    _none = { { id = "tp_none", text = "I don't teach that, and I make a point of not guessing about what I don't teach." } },
  },
}

---------------------------------------------------------------------------
-- Kaal Soulreaper: warlock trainer, grim and theatrical.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_soulreaper", id = TODO_NPC("Kaal Soulreaper"), name = "Kaal Soulreaper", title = "Warlock Trainer",
  bible = "bibles/uc_soulreaper.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "grim", "proud" }, values = { "ambitious" },
  notices = { "class", "race" },
  impression = {
    first = "Kaal Soulreaper chose his own name after he died, and he makes sure you know it. Under the theatre there's a teacher who wants his students to survive, though he'd sooner die again than admit it.",
    third = "{name} met Kaal Soulreaper, a warlock trainer in the Undercity who renamed himself after death.",
  },

  greetings = {
    { id = "g_default", text = "Another seeker in the dark. Come closer, and let the shadows see what you're made of." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the dark, as they all do in the end." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Your heart is very loud, living one. Every demon in this quarter can hear it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kaal Soulreaper, and I teach the darker arts to those of the Dark Lady's people who would wield them. Speak, and choose your words as carefully as you'd choose your pacts." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "A warlock, and not yet devoured. Your souls are your currency, so spend them well, and never on anything that smiles at you." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, slumming among the warlocks. Hartwell's students always come to look at us sooner or later, the way children look at a fire." },
      },
      again = {
        { id = "h_again", text = "Speak again, if you must. The dark is patient, and so, tonight, am I." },
        { id = "h_again2", text = "What else stirs in that head of yours?" },
      },
      choices = {
        { text = "Soulreaper can't have been your name in life.", next = "name" },
        { text = "What are soul shards for, really?", next = "shards" },
        { text = "Teach me, Soulreaper.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "In life I was called something soft, a baker's name, and it died with the rest of me. I chose this one when I woke, because a man who has been murdered by a king is entitled to a little theatre." } },
      choices = {
        { text = "What was the soft name?", next = "name_soft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_soft = {
      big = true,
      lines = { { id = "ns_default", text = "Buried, with the bread and the wife and the little shop by the gate. Bauhaus has it in his census, I expect, and he's welcome to keep it there." } },
      choices = {
        { text = "The man you were deserves remembering.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Good. A new name for a new life.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = { { id = "sh_default", text = "Fuel and coin and leash, all at once. You tear a sliver from a dying enemy and keep it in a bag, and if that turns your stomach, you're in the wrong quarter of the wrong city." } },
      choices = {
        { text = "Our enemies forfeited their souls. I'll take them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll use them, but I won't enjoy it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Never name a demon you intend to dismiss. It makes the parting so much harder for both of you." } },
    _none = { { id = "tp_none", text = "The shadows whisper many things, but not that." } },
  },
}

---------------------------------------------------------------------------
-- Kaelystia Hatebringer: mage trainer, venomous about the living Kirin Tor.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_kaelystia", id = TODO_NPC("Kaelystia Hatebringer"), name = "Kaelystia Hatebringer", title = "Mage Trainer",
  bible = "bibles/uc_kaelystia.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "sharp" }, values = { "ambitious" },
  notices = { "class", "race" },
  impression = {
    first = "Kaelystia Hatebringer teaches fire and frost in the Magic Quarter, and she chose her surname with the same care she gives a spell. Her anger is cold, patient and pointed north, at Dalaran.",
    third = "{name} met Kaelystia Hatebringer, a mage trainer of the Undercity with a long grudge against Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Speak quickly. The candle I'm reading by is the last one I have." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon. Either you're learning fast or forgetting faster." },
    { id = "g_human_tone", when = { gender = "male", class = "MAGE" }, text = "Another young man who thinks a fireball makes him interesting. Prove me wrong, please; I'd enjoy the novelty." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE", race = "Scourge" },
      text = "Frost suits the dead, you know. Our hands are already cold, so it never bites as hard as it does the living." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kaelystia Hatebringer, trainer of mages, and before you ask, yes, I chose the name myself. I teach the Dark Lady's sorcerers to burn and freeze her enemies, and I'm told I'm thorough about it." },
        { id = "h_dalaran", when = { origin = "forsaken_dalaran_apprentice" }, text = "A Dalaran apprentice, once, by the way you hold your hands. Then you know what they did to us, and you'll understand why I teach with such enthusiasm." },
      },
      again = {
        { id = "h_again", text = "Something else? Be brief; brevity is the soul of spellcraft." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Why Hatebringer?", next = "hate" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "I'll go.", next = "END" },
      },
    },
    hate = {
      lines = { { id = "ha_default", text = "Because the Kirin Tor sealed their gates while the plague came down the roads, and then walled off their city with us outside it, rotting. They called it caution, and I call it a debt I intend to collect." } },
      choices = {
        { text = "Is revenge enough to live on?", next = "hate_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_enough = {
      big = true,
      lines = { { id = "he_default", text = "I'm not living on anything, so the question doesn't trouble me. Revenge gets me out of bed in the evening, and I've yet to find anything else in the Undercity that does." } },
      choices = {
        { text = "Then let them pay for what they did.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Dalaran's mages bled too. Spare the innocent ones.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "To finish a spell, whatever happens around you. Fire that stops halfway is just a warm draught, and a mage who flinches is a corpse with good intentions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dal", text = "A violet tower full of cowards. I'll see it again one day, and they won't enjoy the visit." } },
    _none = { { id = "tp_none", text = "Ask Bethor Iceshard. He has the patience for questions; I have only the time for answers." } },
  },
}

---------------------------------------------------------------------------
-- Pierce Shackleton: mage trainer, absent-minded and gentle.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_shackleton", id = TODO_NPC("Pierce Shackleton"), name = "Pierce Shackleton", title = "Mage Trainer",
  bible = "bibles/uc_shackleton.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "warm", "dreamy" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Pierce Shackleton teaches magic in the Magic Quarter as if the plague were an unfortunate interruption to his reading. He's the gentlest of the dead I've met, and the most easily distracted.",
    third = "{name} met Pierce Shackleton, an absent-minded mage trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Oh! A visitor. Forgive me, I was halfway through a sentence in a book, and I've lost my place again." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again, isn't it? I never forget a face, though I sometimes misplace whose it is." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Your robes have scorch marks on the left sleeve. Too much fire from the off hand, I expect; we can fix that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pierce Shackleton, at your service, and at the service of anyone in the Magic Quarter who wants to learn a spell properly. I taught at a little school by Lordamere Lake, once, and I find I never quite stopped." },
        { id = "h_troll", when = { race = "Troll", class = "MAGE" }, text = "A troll mage! I've read that your people's magic comes from the old spirits, and I'd love to hear how it sits with the arcane, if you've a moment." },
      },
      again = {
        { id = "h_again", text = "Yes? Oh, yes, you were asking something; my memory came back from the grave with a few pages missing. Go on." },
        { id = "h_again2", text = "Another question? Splendid, I'd nearly run out of things to think about." },
      },
      choices = {
        { text = "Your school must have closed long ago.", next = "school" },
        { text = "Do the dead learn magic differently?", next = "dead" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "I kept the archives in Stratholme, Pierce, until the Culling.", next = "xorig_archive", when = { origin = "forsaken_stratholme_archivist" } },
        { text = "Goodbye, Pierce.", next = "END" },
      },
    },
    xorig_archive = {
      lines = {
        { id = "xar_default", text = "Stratholme's archives! I wrote to your keepers twice for a copy of an old treatise on ley lines, and nobody ever answered. I suppose that wasn't your fault. Did any of it survive, do you think?" },
      },
      choices = {
        { text = "I never learned. One day I'd like to go and look.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "No. Arthas left nothing in that city worth reading.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I may have lost your letters, Pierce. Sorry.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    school = {
      lines = { { id = "sc_default", text = "The plague reached it in the spring, and the pupils went home and never came back. I locked the door behind them and sat down to wait, and I've no memory of what came after until the Dark Lady woke me." } },
      choices = {
        { text = "I'm sorry, Pierce.", next = "school_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    school_sorry = {
      big = true,
      lines = { { id = "ss_default", text = "That's kind of you, though I'm not sure the dead are owed sorrow. I keep the school key on a string around my neck, and some evenings I can't decide whether that's devotion or just a bad habit." } },
      choices = {
        { text = "Keep the key. Some things should be kept.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Throw it in the canal and teach here instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "Slower to start and harder to stop, I'd say. We don't tire, so a Forsaken student will practise the same frost bolt until morning, which is wonderful until he freezes the canal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I may have read it somewhere, but if I did, I've shelved it in the wrong place." } },
  },
}

---------------------------------------------------------------------------
-- Josef Gregorian: artisan enchanter, a snob about dust.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_gregorian", id = TODO_NPC("Josef Gregorian"), name = "Josef Gregorian", title = "Artisan Enchanter",
  bible = "bibles/uc_gregorian.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "proud", "precise" }, values = { "ambitious" },
  notices = { "craft", "class" },
  impression = {
    first = "Josef Gregorian teaches enchanting at the artisan's level and does not let anyone forget the distinction. He talks about dust the way a sommelier talks about wine, and he handled my gear like a jeweller handling paste, which was humbling.",
    third = "{name} met Josef Gregorian, the Undercity's artisan enchanter.",
  },

  greetings = {
    { id = "g_default", text = "Please don't lean on the table. The runes on it are older than this city's new name." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope your rods are cleaner than last time." },
    { id = "g_artisan", when = { profession = { name = "Enchanting", min = 225 } }, text = "Ah, an enchanter of some standing at last. Come in, and do wipe your rod before it touches anything of mine." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "An enchanter. Show me your rod; I can tell more from a rod than from any letter of introduction." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll understand, then, that magic poured into steel is a different thing from magic flung across a room, and considerably more refined." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Josef Gregorian, artisan enchanter. Lavinia Crowe teaches the basics very ably, and when you've outgrown them, you come to me, and not a moment before." },
        { id = "h_notench", when = { ["not"] = { profession = "Enchanting" } }, text = "You're no enchanter, I see. Still, you're carrying a good deal of steel that's never had a kind word said over it, and that offends me professionally." },
      },
      again = {
        { id = "h_again", text = "Something further? Speak; the runes can wait, as they've waited for centuries." },
        { id = "h_again2", text = "Yes? Do be concise. Enchanting is the art of saying exactly enough, and I prefer conversation the same way." },
      },
      choices = {
        { text = "What separates an artisan from the rest?", next = "artisan" },
        { text = "You learned your craft somewhere fine, by the look of it.", next = "learned" },
        { text = "Isn't dust just dust?", next = "dust" },
        { text = "What do you think of Lavinia Crowe's teaching?", next = "crowe" },
        { text = "I disenchant everything I find. It's quicker.", next = "everything", when = { profession = "Enchanting" } },
        { text = "Teach me.", next = "BUSINESS", when = { profession = "Enchanting" } },
        { text = "Good day, Gregorian.", next = "END" },
      },
    },
    artisan = {
      lines = { { id = "ar_default", text = "Patience, mostly, and an eye for which dust is worth keeping. Anyone can break a sword into powder, but it takes years to learn which swords deserve it." } },
      choices = {
        { text = "Every craft needs a master's standards.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Results matter more than standards, Gregorian.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = { { id = "le_default", text = "In the palace above, as a junior to the court enchanter, who put a shine on King Terenas's ceremonial blades. I was polishing one of them on the day Prince Arthas came home, and I've not polished a blade for royalty since." } },
      choices = {
        { text = "So you saw Arthas return.", next = "learned_arthas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_arthas = {
      lines = { { id = "la_default", text = "I saw the bells ring and the petals fall, and I went back to my bench, because the work wasn't finished. I have had years since to think about that unfinished blade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dust = {
      lines = { { id = "du_default", text = "Dust is no more just dust than wine is just grapes. Strange dust from a farmhand's boots is thin and sour, but strange dust from a good soldier's blade has body to it, and a little warmth on the finish, and I can tell the two apart blindfolded." } },
      choices = {
        { text = "Blindfolded? How?", next = "dust_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust_how = {
      lines = { { id = "dh_default", text = "By the way it settles in the bowl, and by the faint hum against the rod, which most enchanters are far too hurried to hear. Let me test your eye in return: when you look at a fine sword, what do you see first?" } },
      choices = {
        { text = "The edge, and whether it'll hold.", next = "see_edge", fx = { trait = { practical = 1 } } },
        { text = "The hand that made it.", next = "see_maker", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "What it would fetch at auction.", next = "see_price", fx = { trait = { greedy = 1 } } },
      },
    },
    see_edge = {
      lines = { { id = "se_default", text = "A soldier's answer, sensible and a little dull. You'll keep your weapons sharp, and I'll keep the poetry, and we needn't trouble one another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see_maker = {
      lines = { { id = "sm_default", text = "Ah, now that is the beginning of taste. Every blade remembers its maker a little, and the best enchantments only coax that memory out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see_price = {
      lines = { { id = "sp_default", text = "Then you've the soul of a goblin, and I'll thank you to keep it on your side of the table. Some things are worth more than they fetch, though I don't expect you to believe me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    crowe = {
      lines = { { id = "cr_default", text = "Lavinia is thorough, and patient, and I could never do what she does with beginners. I do wish she'd stop letting them handle rods with bare hands, though, because I can taste their fingers in the dust for weeks afterwards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everything = {
      lines = { { id = "ev_default", text = "Everything? You break good steel and bad steel alike and call it efficiency? That is the habit of a quarry, not a craftsman, and I'll ask you to say it more quietly near my bench." } },
      choices = {
        { text = "Quick work keeps the Scourge back. That's what counts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right. I'll learn to choose with care.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's no concern of an enchanter, and therefore none of mine. Bring me something that hums, and we'll talk." } },
  },
}

---------------------------------------------------------------------------
-- Hannah Akeley: reagent vendor, brisk and superstitious.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_akeley", id = TODO_NPC("Hannah Akeley"), name = "Hannah Akeley", title = "Reagent Supplies",
  bible = "bibles/uc_akeley.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "warm" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Hannah Akeley sells reagents to the Magic Quarter and keeps a running tally of which customers come back. She has a horseshoe nailed over her table and a superstition for every occasion, and she was cheerful about it all, which in the Undercity feels almost rebellious.",
    third = "{name} met Hannah Akeley, who sells reagents in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Powders, candles, chalk and grave dust, the usual things for the unusual folk. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you would be; everyone runs out of something, and down here the dead run out of patience first." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Evening, love. Mind you step in with your right foot first; it's a dark night, and I'm not taking chances." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID" } },
      text = "You've the look of someone who's just run out of something important. Don't worry, I've got it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hannah Akeley, reagents and supplies. Mages, priests, warlocks, anyone who needs a pinch of something before the magic works, living or otherwise, they all end up at my table eventually." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "You don't look like a spellcaster, love. If you're lost, the War Quarter is that way, but you're welcome to browse." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've a queue of warlocks behind you, and they're not patient." },
        { id = "h_again2", text = "Go on, love, ask away. Just don't whistle while you do it; it's bad luck indoors." },
      },
      choices = {
        { text = "I'd guess the warlocks are your best customers.", next = "customers" },
        { text = "Where do you get it all?", next = "source" },
        { text = "Why is there a horseshoe over your table?", next = "horseshoe" },
        { text = "Do you sell soul shards?", next = "shards", when = { class = "WARLOCK" } },
        { text = "I'll need an ankh or two, Hannah.", next = "ankh", when = { class = "SHAMAN" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Goodbye, Hannah.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "cu_default", text = "The warlocks buy the most, because they spend souls like the living spend pennies. The mages complain the most, and the priests say thank you, which I've come to value more than either." } },
      choices = {
        { text = "Manners still matter, even here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Coin talks louder than thank you, Hannah.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Here and there, and from the apothecaries when they've something left over. I don't ask what was boiled to make the ash, and I'd recommend you don't either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horseshoe = {
      lines = { { id = "ho_default", text = "For luck, dear, same as it hung over my mother's door in Tirisfal. I know, I know, I died anyway, but I'd have died a good deal sooner without it, I'm sure of that." } },
      choices = {
        { text = "You're superstitious, then?", next = "superstition" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superstition = {
      lines = { { id = "su_default", text = "Dying didn't cure me of it, love, if that's what you're asking. I never sell the last candle in a box, I tap the table three times after a warlock pays, and I keep salt by the till, though I've no idea any longer which shoulder it goes over. What about you, have you got a lucky charm?" } },
      choices = {
        { text = "I do. I never fight without it.", next = "charm_yes", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Luck is for people without a good blade.", next = "charm_no", fx = { trait = { skeptical = 1 } } },
        { text = "You're my lucky charm now, Hannah.", next = "charm_you", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    charm_yes = {
      lines = { { id = "cy_default", text = "Good, and don't you dare tell me what it is, or it'll stop working. Keep it in the left pocket; that's the side nearer the heart, even if yours has stopped." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charm_no = {
      lines = { { id = "cn_default", text = "That's what my husband said, love, and he was the first in our street to go. I'm not saying the two are connected, but I'm not saying they aren't, either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charm_you = {
      lines = { { id = "cx_default", text = "Oh, go on with you! Well, then, you'd better come back regularly, because a charm only works if you keep it close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shards = {
      lines = { { id = "sh_default", text = "Light, no, dear, you make those yourself, and I'd thank you not to do it near my table. I'll sell you candles and chalk all day long, but whatever goes into those little purple stones, I want no part of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ankh = {
      lines = { { id = "an_default", text = "Ankhs, yes, I keep a few for the shamans that come through on the zeppelin. Strange things, love, a charm that brings you back from the dead, and I'll admit it's the only one I sell that I'm a little jealous of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a thing I sell, dear, and not a thing I know. Knock on wood before you ask anyone else, just in case." } },
  },
}
