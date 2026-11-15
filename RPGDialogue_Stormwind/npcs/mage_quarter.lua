-- The Mage Quarter: the Wizard's Sanctum upstairs and the Slaughtered Lamb's cellar below.
-- Voices: bibles/mage_quarter.md (Jennea Cannon and Gakin the Darkbinder are in city.lua.)
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Maginor Dumas: the Sanctum's most renowned master, and its sternest warning.
P:NPC {
  key = "maginor", id = TODO_NPC("Maginor Dumas"), name = "Maginor Dumas", title = "Master Mage",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "proud", "cautious" },
  notices = { "mage", "priest", "gnome" },
  impression = {
    first = "Maginor Dumas warned me that magic burns the untrained before he'd tell me anything else. He speaks like a man who has written books on the subject, and he has.",
    third = "{name} met Maginor Dumas, Master Mage of the Wizard's Sanctum and one of Stormwind's most renowned magi.",
  },

  greetings = {
    { id = "g_wary", text = "Well met, {class}. Be wary of magic; it burns the untrained." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Greetings, mage. Shall we see what you've learned since last time?" },
    { id = "g_xylem", when = { questActive = TODO_QUEST("Magecraft") }, text = "Azshara is far, but Xylem is worth the journey. Mind his servant." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You've grown into your power, I see; it sits on you more easily than it did. Good. The ones who struggle with it are the ones I worry about least, and the ones who find it easy, most." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest in the Sanctum. Your Light and our arcane are cousins, I've always thought, both disciplines of the will, though your people would call that heresy and mine would call it sentiment." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome", class = "MAGE" },
      text = "Gnomeregan trained some of the finest magi I ever corresponded with. I'm glad at least some of their students reached us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maginor Dumas, Master Mage of the Sanctum. My advice to you is this: as you travel the world, be wary of magic, for it will burn the untrained, and most of the world is untrained." },
        { id = "h_magecraft", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("Magecraft"), class = "MAGE" },
          text = "Archmage Xylem has been asking after mages of your experience, which is a compliment, though he'd never phrase it as one. He keeps a tower in Azshara, and he teaches what we here cannot." },
        { id = "h_magecraft_active", tags = { "news" }, when = { questActive = TODO_QUEST("Magecraft") },
          text = "Take the road where it forks at the ruins of Eldarath and go north to the cliffs. Xylem's servant, Sanath Lim-yo, will sneer at you and then send you up, and you'd do well to bear the sneer politely." },
        { id = "h_magecraft_done", when = { questDone = TODO_QUEST("Magecraft") },
          text = "So you've met Xylem. Brilliant, isn't he, and quite insufferable. I'd be grateful if you didn't tell him I said the first part." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind's magi have stood on their own since Dalaran closed its gates to the world. The Sanctum is all the kingdom has now, and I intend it to be enough." },
      },
      again = {
        { id = "h_again", text = "Is there more? I have students waiting, but they can wait." },
        { id = "h_again2", text = "Go on. Questions are the beginning of every discipline." },
      },
      choices = {
        { text = "What do you mean, magic burns?", next = "burn" },
        { text = "Who is Archmage Xylem?", next = "xylem" },
        { text = "Tell me about the Wizard's Sanctum.", next = "sanctum" },
        { text = "What should a mage of my level study?", next = "mage", when = { class = "MAGE" } },
        { text = "Is the Light a discipline like yours?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll be wary, Master Dumas.", next = "END" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Precisely what I say. Magic is a current, and it runs through everything; I wrote a book on the flows of it, which three people have read. Draw on it without discipline and it draws on you, and I've buried students who didn't believe me." } },
      choices = {
        { text = "Then magic should be tightly controlled.", next = "burn_control", fx = { align = { order = 1 } } },
        { text = "Anyone should be free to learn it.", next = "burn_control", fx = { align = { order = -1 } } },
        { text = "What happened to them?", next = "burn_control" },
      },
    },
    burn_control = {
      lines = { { id = "bc_default", text = "Some went too far into fire and some too far into the arcane itself, and they hungered for it the way a drunkard hungers for drink. That's why the Sanctum keeps watch on its students, and why I keep watch on the cellar of the tavern across the way." } },
      choices = {
        { text = "The Slaughtered Lamb?", next = "burn_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn_lamb = {
      big = true,
      lines = { { id = "bl_default", text = "I say nothing about the Lamb that would hold up before the House of Nobles. I'll say only that what's taught down there is a shortcut, and shortcuts in magic always end somewhere you didn't mean to go." } },
      choices = {
        { text = "Then they should be shut down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every power has its use, Master Dumas.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem = {
      lines = { { id = "x_default", text = "An archmage of great power who has made his home in a tower in Azshara, far from anyone who might ask him to share. He takes the occasional student, and the ones he sends back are worth ten of mine.",
        fx = { learn = { "xylem" } } } },
      choices = {
        { text = "Why Azshara?", next = "xylem_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem_why = {
      lines = { { id = "xw_default", text = "The night elves' old ruins lie all over that coast, and the arcane is thick there, like dust in an attic. Xylem studies it, and keeps his own counsel about what he finds, which is what worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sanctum = {
      lines = { { id = "s_default", text = "The heart of magic in this kingdom, now that Dalaran keeps to itself. We teach, we study, and we advise the court when the court remembers to ask, which is less often than it should." } },
      choices = {
        { text = "Who teaches here?", next = "sanctum_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sanctum_who = {
      lines = { { id = "sw_default", text = "Jennea Cannon, who believes everyone's fundamentals have gaps, and is usually right. Elsharin, who has been teaching apprentices since before I was one, and Larimaine Purdue, who teaches portals and will tell you that you aren't clever enough for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      big = true,
      lines = { { id = "m_default", text = "Whatever frightens you most. A mage who studies only what comes easily becomes a very good candle, and the world doesn't need more candles; it needs people who can hold back a fire." } },
      choices = {
        { text = "Then I'll study what frightens me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'd rather master one thing well.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    light = {
      lines = { { id = "l_default", text = "A discipline, yes, though of the heart rather than the mind. Yours asks you to believe and ours asks us to understand, and I've met very few people who could manage both at once." } },
      choices = {
        { text = "Faith needs no understanding.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd trust understanding over belief.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Sanctum hears from magi across the Alliance, and I read every letter, slowly. Ask, and I'll tell you what is known, and be honest about what is merely believed." },
    },
    background = { { id = "tp_bg", text = "I have studied the flows of magic all my life and written a book on them, which I recommend and nobody reads. That will do for a history." } },
    advice = { { id = "tp_ad", text = "Be wary of magic, for it burns the untrained. You may think you've heard that before; it bears repeating." } },
    xylem = { { id = "tp_xylem", text = "A brilliant archmage in Azshara and an insufferable one. Both are true, and both matter.", next = "xylem" } },
    _none = { { id = "tp_none", text = "That lies outside my study, I'm afraid. Try the Royal Library; Milton will be delighted to see you." } },
  },
}

-- Elsharin: a quel'dorei teacher of apprentices who stayed in Stormwind.
P:NPC {
  key = "elsharin", id = TODO_NPC("Elsharin"), name = "Elsharin", title = "Mage Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "proud", "patient" },
  notices = { "mage", "kaldorei" },
  impression = {
    first = "Elsharin is a high elf who teaches Stormwind's youngest mages, patiently, as if she has all the time in the world, which perhaps she does. She stayed when her homeland burned.",
    third = "{name} met Elsharin, a high elf who teaches apprentice mages in the Wizard's Sanctum.",
  },

  greetings = {
    { id = "g_well", text = "Well met. Be wary of magic; it burns the untrained." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Greetings, mage. Shall I give you a little more insight today?" },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", maxLevel = 20 },
      text = "You're one of the new ones. I can tell by how tightly you hold your focus, as if the spell might run off; it won't, I promise you, if you loosen your grip a little." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Ishnu-alah, if I have it right. Our peoples have a long and complicated history, kaldorei, and I'd rather we both left it at the door of the Sanctum." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Elsharin. I teach the apprentices of the Sanctum their first spells, and I try to teach them patience, which is harder. Humans are always in such a hurry." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "The fundamentals never stop mattering, whatever the more senior magi tell their students. Come back to me whenever a spell feels wrong in your hands, and we'll find out why." },
        { id = "h_human", when = { race = "Human" },
          text = "I've lived among your people for a long time now, and I've grown fond of the haste. Everything you build, you build as if you'd never get another chance." },
      },
      again = {
        { id = "h_again", text = "Yes? There is no hurry." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why stay here, so far from Quel'Thalas?", next = "stay" },
        { text = "What are your apprentices like?", next = "apprentices" },
        { text = "Farewell.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = { { id = "s_default", text = "Quel'Thalas burned when the Scourge came north, and the forests I knew are grey now. I was here, teaching, and I chose to keep teaching; there are those who say I should have gone home, and perhaps they're right." } },
      choices = {
        { text = "Your work here matters.", next = "stay_more", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Your people needed you more.", next = "stay_more", fx = { align = { honor = -1 } } },
        { text = "What's left there now?", next = "stay_more" },
      },
    },
    stay_more = {
      lines = { { id = "sm_default", text = "Fewer of my people than there were, and those who remain are angry and grieving. I hear very little from them, and I've learned not to ask the travellers too many questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    apprentices = {
      lines = { { id = "a_default", text = "Eager, clumsy and brave, as apprentices should be. One set his own sleeve alight last week and kept casting; I scolded him, and then I told him that was the right instinct, only aimed the wrong way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll leave you to them.", next = "END" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've watched this city for longer than most of its citizens have been alive, and I listen more than I speak. Ask." },
    },
    background = { { id = "tp_bg", text = "A teacher of the quel'dorei who has stayed in Stormwind longer than she meant to. That is all, and it is enough." } },
    advice = { { id = "tp_ad", text = "Loosen your grip. Magic, swords, grief: everything is easier held a little less tightly." } },
    _none = { { id = "tp_none", text = "I don't know that one. It is pleasant, at my age, to still have things I don't know." } },
  },
}

-- Larimaine Purdue: portals, and very little patience for anyone who can't make one.
P:NPC {
  key = "larimaine", id = TODO_NPC("Larimaine Purdue"), name = "Larimaine Purdue", title = "Portal Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "proud" }, values = { "proud" },
  notices = { "mage" },
  impression = {
    first = "Larimaine Purdue teaches portal magic and doubts that most people could grasp it. She said so to my face, politely enough, and seemed to think she'd done me a kindness.",
    third = "{name} met Larimaine Purdue, who teaches portal magic in the Wizard's Sanctum to the few she thinks capable of it.",
  },

  greetings = {
    { id = "g_doubt", text = "I don't believe you possess the acuity for portal magic, but do go on." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage. Then perhaps we have something to discuss." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You're ready, I think, or nearly. A mage of your standing can open a door back to this very room from anywhere in the world, and I can teach you how, if you can follow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Larimaine Purdue. I teach the conjuring of portals, which is to say I teach a select few mages how to fold the world in half and step across the crease. I don't believe you're one of them." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "As a mage, you belong to a select group that can conjure a portal back to this very place. I'll teach you when you're ready, and I'll tell you honestly if you aren't." },
      },
      again = {
        { id = "h_again", text = "Something further? Concisely, please." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE", minLevel = 40 } },
        { text = "How does a portal work?", next = "how" },
        { text = "Why so sure I couldn't learn it?", next = "acuity" },
        { text = "Good day.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "You anchor one end to a place you know intimately, open the other where you stand, and hold both in your mind at once without letting either slip. Most people can't hold one thought steadily, let alone two places." } },
      choices = {
        { text = "What if it slips?", next = "how_slip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_slip = {
      lines = { { id = "hs_default", text = "Then you arrive somewhere else, or partly somewhere else, and I don't teach that part because nobody has ever come back to describe it. Which is why I'm particular about my students." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    acuity = {
      big = true,
      lines = { { id = "a_default", text = "Because portal magic doesn't forgive, and I'd rather offend you than bury you. If that sounds arrogant, consider that every one of my students is still in one piece." } },
      choices = {
        { text = "Fair. Better proud than careless.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gatekeepers like you hold the world back.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know where every portal in the Alliance opens and who opened it last. Ask, if you think you'll follow the answer." },
    },
    background = { { id = "tp_bg", text = "I teach portals. I'm good at it. That is the relevant part." } },
    advice = { { id = "tp_ad", text = "Know one place so well you could find it with your eyes shut. Everyone should have that, mage or not." } },
    _none = { { id = "tp_none", text = "That's not my field, and I don't pretend to fields that aren't mine." } },
  },
}

-- Zardeth of the Black Claw: the Slaughtered Lamb's patient problem-solver.
P:NPC {
  key = "zardeth", id = TODO_NPC("Zardeth of the Black Claw"), name = "Zardeth of the Black Claw",
  bible = "bibles/mage_quarter.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "proud", "practical" },
  notices = { "warlock", "priest" },
  impression = {
    first = "Zardeth of the Black Claw has excellent manners and speaks of keeping a lord preoccupied in a way that made the cellar feel colder. Whatever the Lamb's coven needs done quietly, I suspect he is the one who does it.",
    third = "{name} met Zardeth of the Black Claw, who keeps the Slaughtered Lamb's coven safe from prying lords.",
  },

  greetings = {
    { id = "g_cellar", text = "Welcome to our little establishment. Do mind the stairs." },
    { id = "g_brew", when = { questActive = TODO_QUEST("A Noble Brew") }, text = "Have you found my ingredients? Wishock grows louder by the day." },
  },

  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "One of our own, and a promising one, I hear. The cellar protects its own, you'll find, and it's always grateful to those who help protect the cellar." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest, in my cellar. How refreshing; the last one who came down those stairs left very quickly and prayed very loudly on the way up." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Zardeth, of the Black Claw. I attend to the cellar's more delicate affairs, so that my colleagues may attend to their studies undisturbed. You'd be surprised how often studies are disturbed." },
        { id = "h_brew_before", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("A Noble Brew"), minLevel = 30 },
          text = "Lord Wishock is causing quite a stir in the House of Nobles. He's learned of our little establishment and wants a full inquiry, and I have a plan to keep him preoccupied, if you'd care to help." },
        { id = "h_brew_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Noble Brew") },
          text = "A small white flower called the Tear of Tilloa grows in the garden of Stalvan, outside Darkshire, and a Musquash Root grows at the foot of the falls below the Stonewrought Dam. Bring me both, and I'll brew his lordship something memorable." },
        { id = "h_brew_done", when = { questDone = TODO_QUEST("A Noble Brew") },
          text = "The House has gone remarkably quiet on the subject of taverns. We're very grateful, you and I, and we'll leave it at that." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind likes to think its magic all lives upstairs in the Sanctum. The city has always had a cellar, my friend; it's simply learned not to look." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all evening." },
        { id = "h_again2", text = "Go on. Discretion is my favourite subject." },
      },
      choices = {
        { text = "What do you want with Wishock?", next = "wishock" },
        { text = "What is this place?", next = "cellar" },
        { text = "What's in the brew, Zardeth?", next = "brew", when = { questActive = TODO_QUEST("A Noble Brew") } },
        { text = "I know what you are. The Light will find you.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    wishock = {
      lines = { { id = "w_default", text = "Only quiet. His lordship drank here on credit for a year, wandered where he shouldn't, and now he wants the House to send soldiers down our stairs. It would be very inconvenient for everyone, including the soldiers." } },
      choices = {
        { text = "He has a point about this place.", next = "wishock_point" },
        { text = "A drunk lord isn't worth worrying about.", next = "wishock_point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wishock_point = {
      big = true,
      lines = { { id = "wp_default", text = "Perhaps he does. But a man who'd drink a tavern dry on credit and then call for it to be burned isn't acting from principle, and I don't see why his hypocrisy should cost us our home. Do you?" } },
      choices = {
        { text = "Hypocrite or not, he's right about you.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "No. Let him learn some manners.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    cellar = {
      lines = { { id = "c_default", text = "A place of study for those whose studies the Sanctum finds distasteful. Gakin, Ursula and the others teach; Spackle keeps the books on demons; I keep the peace with the people upstairs." } },
      choices = {
        { text = "And the people upstairs know?", next = "cellar_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar_know = {
      lines = { { id = "ck_default", text = "They know and they don't, which is the way Stormwind prefers most of its truths. The Sanctum gets to feel superior, the guard gets a quiet street, and we get left alone. Everyone's content until a lord comes looking for the privy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "b_default", text = "A stout, a rather special one, with a flower from a dead man's garden and a root from the bottom of a waterfall. His lordship has a weakness for a good drink, and I'd hate for him to go without." } },
      choices = {
        { text = "You're going to kill him.", next = "brew_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_kill = {
      big = true,
      lines = { { id = "bk_default", text = "I'm going to keep him preoccupied, which is what I said. What becomes of him after that is between his lordship and his appetite. You're still carrying my ingredients, I notice." } },
      choices = {
        { text = "I won't be part of murder.", next = "END", fx = { affinity = -3, align = { honor = 1 } } },
        { text = "His appetite, his problem.", next = "BACK", fx = { affinity = 1, align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "It found my cellar long ago, my dear, and it comes down the stairs every Sunday with a candle and a frown, and then it goes back up again. Your Light is a very polite neighbour." } },
      choices = {
        { text = "Not every priest is so polite.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A great many people pass through this tavern on their way somewhere they shouldn't go. I listen to all of them. Ask." },
    },
    background = { { id = "tp_bg", text = "I have a talent for making problems go quiet. The Black Claw values that talent. The rest is nobody's affair." } },
    advice = { { id = "tp_ad", text = "Never wander a tavern looking for the privy. Ask the barkeep, like a civilised person." } },
    stalvan = { { id = "tp_stalvan", text = "A dead man with a lovely garden outside Darkshire. I'm told the house is unpleasant; the flowers, however, are exquisite." } },
    _none = { { id = "tp_none", text = "I couldn't say. And if I could, I'd want something for it." } },
  },
}

-- Ursula Deline: the cellar's teacher of discipline.
P:NPC {
  key = "ursula", id = TODO_NPC("Ursula Deline"), name = "Ursula Deline", title = "Warlock Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud" },
  notices = { "warlock", "priest" },
  impression = {
    first = "Ursula Deline believes the arcane only corrupts the weak, and she looked me up and down as if deciding which I was. She teaches warlocks in the Slaughtered Lamb's cellar and suffers no one else.",
    third = "{name} met Ursula Deline, who trains warlocks in the cellar of the Slaughtered Lamb.",
  },

  greetings = {
    { id = "g_weak", text = "The arcane only corrupts the weak. Which are you?" },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Your name has reached my ears as one seeking a master. Good." },
  },

  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "Keep up with your training, or you'll find the same fate as the ones who didn't. They're still here, some of them, in a manner of speaking." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest. I'll tell you what I tell the Cathedral's spies: we're very boring down here, and you're welcome to report that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ursula Deline. I teach discipline to those who would command what lies beyond the world. The darkness doesn't embrace everyone, so if it doesn't embrace you, I'd ask you to leave before it notices." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "You've come to learn, then, not to gawk. Keep up your training, because the arcane only corrupts those who are weak, and I don't intend to lose another student to weakness." },
      },
      again = {
        { id = "h_again", text = "More? Be brief." },
      },
      choices = {
        { text = "I'm ready to train.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What do you mean, corrupts the weak?", next = "weak" },
        { text = "What happened to your last student?", next = "student" },
        { text = "I'll go.", next = "END" },
      },
    },
    weak = {
      big = true,
      lines = { { id = "w_default", text = "Power has a price, and the weak pay it with themselves. The strong pay with will, and keep their souls. Everything else the Cathedral tells you about us is fear wearing a robe." } },
      choices = {
        { text = "Strength is all that matters, then.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "No one is strong enough for that bargain.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    student = {
      lines = { { id = "s_default", text = "He grew impatient and reached for more than he could hold, and what he reached for held him instead. We don't speak his name down here, and you won't either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Ask. I'll answer if it pleases me." },
    },
    background = { { id = "tp_bg", text = "I teach. My past belongs to me, and I've given away enough already." } },
    advice = { { id = "tp_ad", text = "Never bargain while tired. Whatever is on the other side never is." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. Neither should you." } },
  },
}

-- Spackle Thornberry: a cheerful gnome who sells the books that teach you to call demons.
P:NPC {
  key = "spackle", id = TODO_NPC("Spackle Thornberry"), name = "Spackle Thornberry", title = "Demon Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious", "practical" },
  notices = { "warlock", "gnome", "imp" },
  impression = {
    first = "Spackle Thornberry sells grimoires in the Slaughtered Lamb's cellar and talks about demons the way other gnomes talk about gears. He is cheerful about it, which somehow makes it worse.",
    third = "{name} met Spackle Thornberry, the gnome who sells demon grimoires in the Slaughtered Lamb's cellar.",
  },

  greetings = {
    { id = "g_books", text = "Grimoires, grimoires, fresh from the press! Oh, you're not a warlock. Never mind." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Come to teach your little friend a new trick? I've just the book." },
    { id = "g_morzul", when = { questActive = TODO_QUEST("Mor'zul Bloodbringer") }, text = "Off to the Burning Steppes? Bring a coat; it's hot, but you'll want the pockets." },
  },

  notice = {
    { id = "n_imp", cat = "imp", when = { pet = { family = "Imp" } },
      text = "Oh, look at him! Healthy colour, good sulk, nice little flames; you've been feeding him properly. Most people let their imps go all grey and mopey." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "A fellow gnome! Don't look at me like that; Gnomeregan's gone, and a gnome must earn a living somewhere, and demons are only clockwork with opinions, really." },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK", minLevel = 60 },
      text = "My, you've come a long way! I'd say you were ready for a very special mount, the kind that breathes fire and doesn't need feeding, but you'll have to earn it the hard way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Spackle Thornberry, purveyor of fine grimoires! Each one teaches a demon a new trick, which I'm sorry to say is only of any use to warlocks, but I'll happily talk about them to anyone." },
        { id = "h_morzul", key = true, tags = { "news" }, when = { class = "WARLOCK", minLevel = 60, questBefore = TODO_QUEST("Mor'zul Bloodbringer") },
          text = "Your mastery over the denizens of other worlds has grown very strong, and I think you're ready to bind a dreadsteed. Speak to Mor'zul Bloodbringer, at the Altar of Storms in the Burning Steppes, and bring plenty of gold." },
        { id = "h_morzul_done", when = { questDone = TODO_QUEST("Mor'zul Bloodbringer") },
          text = "Did you meet Mor'zul? Charming fellow, in an orcish sort of way. Whatever he asks of you, it'll cost blood, sweat and a great deal of money, and it's worth every bit." },
      },
      again = {
        { id = "h_again", text = "What else? I love a good chat between customers." },
      },
      choices = {
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How does a gnome end up down here?", next = "gnome" },
        { text = "What exactly is a grimoire?", next = "grimoire" },
        { text = "What's a dreadsteed?", next = "dreadsteed", when = { class = "WARLOCK", minLevel = 50 } },
        { text = "Goodbye, Spackle.", next = "END" },
      },
    },
    gnome = {
      lines = { { id = "g_default", text = "Same as most of us end up anywhere these days: Gnomeregan fell, we ran, and we took whatever work would have us. I was always good with instructions and little monsters, so here I am, and I do very well, thank you." } },
      choices = {
        { text = "You sound like you miss it.", next = "gnome_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_miss = {
      lines = { { id = "gm_default", text = "Oh, terribly. I had a workshop with a window, and the window had a view of the big gears turning. Down here the only things that turn are imps, and they turn on you if you're careless.",
        fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grimoire = {
      big = true,
      lines = { { id = "gr_default", text = "A book of instructions, really, that a warlock reads aloud to their demon, and the demon learns a new spell, grudgingly. Imps learn fire, voidwalkers learn to suffer for you, and succubi learn things I won't describe in company." } },
      choices = {
        { text = "Binding demons is an abomination.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A tool's a tool, whatever it's made of.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreadsteed = {
      lines = { { id = "d_default", text = "A demon horse from Xoroth, all hooves and fire, and the finest mount a warlock can own. Mor'zul Bloodbringer knows the ritual, and he camps near the Altar of Storms in the Burning Steppes, if you're brave and very rich." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Customers chatter, and demons chatter more, if you know how to listen. Ask me anything!" },
    },
    background = { { id = "tp_bg", text = "Gnomeregan, then the road, then this lovely cellar. A gnome must keep busy.", next = "gnome" } },
    advice = { { id = "tp_ad", text = "Name your imp something dignified. They live up to their names, and they never forgive a silly one." } },
    gnomeregan = { { id = "tp_gnome", text = "Home, once. I try not to think about the radiation, and mostly I manage." } },
    _none = { { id = "tp_none", text = "No idea! Is there a grimoire about it? There ought to be." } },
  },
}
