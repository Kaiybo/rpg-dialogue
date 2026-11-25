-- Sharlindra, the banshee who counsels the Dark Lady and sends for the Crown of Will, and
-- Jorah Annison, the Magic Quarter's cartographer who would rather be reading. Voices: bibles/uc_royal_more.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sharlindra: banshee counsellor in the Royal Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_sharlindra", id = TODO_NPC("Sharlindra"), name = "Sharlindra",
  bible = "bibles/uc_royal_more.md", role = "noble", tier = "quest",
  communities = { "undercity" }, temper = { "cold", "sharp" }, values = { "loyal", "cunning" },
  notices = { "race", "class" },
  impression = {
    first = "To her, every visitor is a tool of undecided usefulness.",
    third = "{name} met Sharlindra, a banshee who serves Lady Sylvanas in the Royal Quarter of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "You are standing in the Dark Lady's court. Speak quickly, and speak to the point." },
    { id = "g_crown", when = { questActive = TODO_QUEST("The Crown of Will") }, text = "My lieutenant Melisara waits for you in Tarren Mill, and the ogre Mug'Thol still wears the Dark Lady's crown. Why are you still here?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Crown of Will") }, text = "The Dark Lady has heard of you. Do not let it go to your head, because she hears of a great many people." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You carry the shadow well, priest, for one who still has a heartbeat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sharlindra, and I counsel the Dark Lady when she wishes to be counselled, which is rarely. I also see to the matters she has no time for, and one of those matters is an ogre with something on his head that belongs to us." },
        { id = "h_before", when = { minLevel = 36, questBefore = TODO_QUEST("The Crown of Will") },
          text = "Mug'Thol and his ogre warband were sent into Alterac to bring back the Crown of Will for Lady Sylvanas, and instead the idiot tried it on. Ogres can't resist anything bright and shiny, and now the crown lets him resist the possession placed upon him." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I am Sharlindra, and you are one of the Dark Lady's own, so I'll spare you the warnings I give the living. Serve her well and you will find me patient, and serve her badly and you will find me otherwise." },
      },
      again = {
        { id = "h_again", text = "Is there more? I have very little patience for idle chatter." },
        { id = "h_again2", text = "Ask, then, and be brief." },
      },
      choices = {
        { text = "What is the Crown of Will?", next = "crown" },
        { text = "Who is Mug'Thol?", next = "mugthol" },
        { text = "What is it you do for the Dark Lady?", next = "counsel" },
        { text = "Who is Melisara?", next = "melisara" },
        { text = "What was it like, being made a banshee?", next = "banshee", when = { race = "Scourge" } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    crown = {
      lines = { { id = "cr_default", text = "A relic from the ruins of Alterac, small and plain, and it lets the one who wears it shrug off any will laid upon his own. The Dark Lady wants it for reasons that are hers, and I will tell you only that she wants it badly." } },
      choices = {
        { text = "Couldn't someone use it against her?", next = "crown2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown2 = {
      lines = { { id = "c2_default", text = "That is exactly why it must be in her hands and nobody else's. Strange that something so simple could hold such power, and stranger that it fell to a creature as clumsy as an ogre." } },
      choices = { { text = "Something else, Sharlindra.", next = "BACK" } },
    },
    mugthol = {
      lines = { { id = "mu_default", text = "The chieftain of the Crushridge ogres, whom we bound to our service and sent to fetch the crown from Alterac. He's an irritant now, and my lieutenant Melisara will deal with him quickly, thoroughly, and without incident." } },
      choices = {
        { text = "You possessed an ogre warband?", next = "possession" },
        { text = "Something else.", next = "BACK" },
      },
    },
    possession = {
      big = true,
      lines = { { id = "po_default", text = "We possessed their chieftain, which is far more efficient than persuading two hundred ogres one at a time. The living use whips and coin to make others serve them, and we use what we have." } },
      choices = {
        { text = "Bending the will of brutes serves the Dark Lady well.", next = "BACK", reply = "It does, and the ogres have never been more useful. The Dark Lady rewards results, and that was a very good result.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Possession is a cruelty, even done to ogres.", next = "BACK", reply = "Perhaps it is, but so was the plague, and nobody offered us a choice in it either. I'll not lose sleep over ogres.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    counsel = {
      big = true,
      lines = { { id = "co_default", text = "I listen, and I watch the faces of those who come before her, and later I tell her which of them lied. She trusts few people, and she is right not to, and I count it an honour that I'm one of them." } },
      choices = {
        { text = "Loyalty like that is rare. She's lucky to have it.", next = "BACK", reply = "She is, and she knows it, which is why I'm still standing beside her. Mind your own face when you go before her.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Someone should be watching your face too, Sharlindra.", next = "BACK", reply = "Someone does, every day, and she's very good at it. I've nothing to hide from my queen.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    melisara = {
      lines = { { id = "me_default", text = "My lieutenant, at Tarren Mill, among the Deathguard. She has even less patience than I do, so don't waste her time with questions when you arrive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    banshee = {
      lines = { { id = "ba_default", text = "The body was taken from me, and what remained was made into a weapon, so I became one. When the Dark Lady broke free, she gave the banshees back our minds, and nothing else she could have given would have meant as much." } },
      choices = { { text = "Something else, Sharlindra.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "What I was before is nobody's concern now, least of all mine." } },
    advice = { { id = "tp_ad", text = "Never wear what you haven't been told is safe to wear. Mug'Thol should have known that." } },
    _none = { { id = "tp_none", text = "That is not worth the Dark Lady's time, and so it isn't worth mine." } },
  },
}

---------------------------------------------------------------------------
-- Jorah Annison: a cartographer who would trade every map for one good book.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_jorah", id = TODO_NPC("Jorah Annison"), name = "Jorah Annison",
  bible = "bibles/uc_royal_more.md", role = "scholar", tier = "quest",
  communities = { "undercity" }, temper = { "cheerful", "anxious" }, values = { "curious" },
  notices = { "class", "race" },
  impression = {
    first = "He despises every map he draws and loves books instead.",
    third = "{name} met Jorah Annison, a book-starved Forsaken cartographer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "If you're after a map, take one, they're all the same and they're all wrong. If you're after a book, now that's a different conversation." },
    { id = "g_tome", when = { questActive = TODO_QUEST("Tome of the Cabal") }, text = "The Tome of the Cabal! Have you found the rest of it? Tell me you've found the rest of it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you bring a book? No? Well, come in anyway, I've a map to ignore." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, and a well-read one, I can tell from your eyes. You have the squint." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, so you've had a library at your back all your life and probably never thanked it. I'd give this whole desk for one afternoon in Dalaran's stacks." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! Your people keep their histories in songs, I've read, and never write them down. That's either very wise or the saddest thing I've ever heard." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jorah Annison, cartographer, or so it says on my desk. Maps are pictures and estimations of reality, and I've no use for them, because narrative and description are where the truth lies." },
        { id = "h_tome", when = { class = "WARLOCK", questDone = TODO_QUEST("Tome of the Cabal") },
          text = "That complete Tome of the Cabal was the most interesting thing I've held in years. The selection here is mostly geography, and I've read every page of it twice." },
      },
      again = {
        { id = "h_again", text = "What else? I'll stop drawing for you, it's no hardship." },
        { id = "h_again2", text = "Go on, I've nothing better to read." },
        { id = "h_again3", text = "Yes, anything. The coastline of Silverpine can wait, since it's waited this long." },
      },
      choices = {
        { text = "Why work as a cartographer if you hate maps?", next = "job" },
        { text = "What sort of books do you want?", next = "books" },
        { text = "Tell me about the Tome of the Cabal, and what it once held.", next = "tome", when = { class = "WARLOCK" } },
        { text = "What do you know of Strahad Farsan in Ratchet?", next = "strahad", when = { class = "WARLOCK" } },
        { text = "Which books does the city actually have?", next = "shelf" },
        { text = "Who else reads, down here?", next = "readers" },
        { text = "I've been to places your maps get wrong.", next = "wrong", when = { minLevel = 30 } },
        { text = "I'll leave you to your maps.", next = "END" },
      },
    },
    job = {
      lines = { { id = "jo_default", text = "Because the city needed mapmakers more than readers, and someone in the Overseer's office looked at my old trade and wrote cartographer. I copied deeds and charters in Lordaeron, which is close enough to maps for a clerk, apparently." } },
      choices = {
        { text = "Are the maps any use?", next = "maps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maps = {
      lines = { { id = "ma_default", text = "They show the roads, and the roads change every time the Scourge burns a village or the Crusade builds a wall. A map of Lordaeron is out of date before the ink dries, so I draw them in pencil now." } },
      choices = { { text = "Something else, Jorah.", next = "BACK" } },
    },
    books = {
      big = true,
      lines = { { id = "bo_default", text = "I'd trade every map in this shop for one book on the rise of necromancy, or a true account of the Dark Lady's triumphs. The Society keeps its texts to itself, and the living burned most of the rest." } },
      choices = {
        { text = "Necromancy's history should be studied, not hidden.", next = "BACK", reply = "At last, a customer with taste. If you ever find such a book, bring it here before the Society hears of it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Some books deserved burning, Jorah.", next = "BACK", reply = "Some did, and the living burned them anyway, along with a great many that didn't. I'll mourn the rest without you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome = {
      lines = { { id = "to_default", text = "The Tome of the Cabal was written by the first warlocks to summon a felhunter unaided, and it was once kept in Lordaeron's own library. Someone vandalized it and tore out nearly half its pages, which is a crime I can barely bring myself to speak of." } },
      choices = {
        { text = "Who holds the missing pages now? I want them.", next = "tome2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome2 = {
      lines = { { id = "t2_default", text = "Rumour says they fell into the hands of the centaur in Thousand Needles, who are hardly known for their libraries. Bring them back, and I'll put the tome together again, and read it, if you'll allow me a moment." } },
      choices = { { text = "Something else, Jorah.", next = "BACK" } },
    },
    strahad = {
      lines = { { id = "st_default", text = "Strahad Farsan, who trains warlocks down in Ratchet, writes to me now and then, and his letters are the best reading I get. I've hinted that he might send me a copy of the tome when he's finished with it, and I'll keep hinting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shelf = {
      lines = { { id = "sh_default", text = "Forty-one, if you leave out ledgers and the Apothecary Society's locked cases. There are gazetteers, a herbal, a history of the Arathi kings with the last chapters missing, and a book of Lordaeron's inn signs, which I've come to love." } },
      choices = {
        { text = "A book of inn signs?", next = "shelf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shelf2 = {
      lines = { { id = "sh2_default", text = "Every one in the kingdom, drawn by a tax assessor who plainly enjoyed his rounds. The Gallows' End in Brill is in it, and when I showed the page to Innkeeper Renee up there, she stood and looked at it for a good long while." } },
      choices = {
        { text = "That's worth more than a map.", next = "BACK", reply = "It is the only true map I own. It shows where people were glad to stop.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    readers = {
      lines = { { id = "rd_default", key = true, text = "Fewer than you'd hope. Salazar Bloch sells books in the Trade Quarter and won't lend, Parqual Fintallas knows more history than any page I own, and a mage called Faith Duggins lent me half a novel that has ruined my peace entirely." } },
      choices = {
        { text = "The Shepherdess of Darrowmere?", next = "readers2", when = { heardLine = "uc_faith_duggins.sy3_default" } },
        { text = "Why ruined?", next = "readers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    readers2 = {
      lines = { { id = "rd2_default", text = "It stops at the top of a page, in the middle of a storm, with the shepherdess on the wrong side of the lake. I have three theories about the ending, and Mistress Duggins says all three are sentimental, which I take to mean she hopes one is right." } },
      choices = {
        { text = "Which theory do you favour?", next = "BACK", reply = "That she rows across. I can't prove it, but I'm a man who needs somebody to have made it over that lake." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "I don't doubt it for a moment! Tell me one, and tell it as a traveller would, with what you saw and smelled. I'll not put it on a map, I promise you. I'll write it down properly, in sentences." } },
      choices = {
        { text = "The road through Hillsbrad is half graves now.", next = "wrong2" },
        { text = "Desolace isn't empty. It's crowded with bones.", next = "wrong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      lines = { { id = "wr2_default", text = "There, you see, no map would ever say so! A line and a name, that's all the sheet would give it. I'll set down your words tonight under your own name, {name}, and that's the first true page this desk has produced." } },
      choices = {
        { text = "I'll bring you more when I've seen more.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I copied charters for the crown in Lordaeron. The crown's gone, and I'm still copying, so perhaps it was never about the crown." } },
    advice = { { id = "tp_ad", text = "Read everything you find, {class}, especially what someone's tried to hide." } },
    dalaran = { { id = "tp_dal", text = "The greatest library in the north, sealed under a dome. I think about it the way a starving man thinks about a locked larder." } },
    lordaeron = { { id = "tp_lord", text = "I copied its charters for twenty years. The kingdom was mostly paper, and paper burns so easily." } },
    _none = { { id = "tp_none", text = "If it's not in a book I've read, I don't know it, and I've read all the books here." } },
  },
}
