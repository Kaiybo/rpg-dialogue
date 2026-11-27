-- More of Tirisfal: Yvette Farthing and the letter from Agamand Mills, the demon trainer in the
-- Gallows' End, the caretaker of Deathknell's crypts, five of Brill's Deathguard, and the
-- shopkeepers and smiths of Brill and Deathknell. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Yvette Farthing: Coleman's daughter; Thurman Agamand's lover once, and done with love now.
P:NPC {
  key = "tir_yvette", id = TODO_NPC("Yvette Farthing"), name = "Yvette Farthing",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "cold", "proud" }, values = { "family", "practical" },
  notices = { "race" },
  impression = {
    first = "Agamand Mills is a name she would rather not hear.",
    third = "{name} met Yvette Farthing, Coleman Farthing's daughter, in the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "g_default", text = "If you're looking for my father, he's the one with the pipe and the long face. If you're looking for me, I can't think why." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, if you like; the chairs here are no use to anyone who can't feel them." },
    { id = "g_letter", when = { questActive = TODO_QUEST("A Letter Undelivered") }, text = "You're holding something out to me. What is it, then? Don't make me guess." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Letter Undelivered") }, text = "The one who brought me Thurman's letter. I've put it away, and I'd thank you not to ask where." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're breathing. I'd forgotten how loud that is, in a quiet room." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Newly risen, or near enough. You'll find the memories come back whether you want them or not, and the trick is not to want them." },
  },

  start = "hello",
  nodes = {
    w3_family = {
      lines = {
        { id = "w3_family_1", text = "Gregor Agamand thought a miller's daughter was very well in her place, and her place was behind a flour sack. Thurman's brothers laughed at us, and his mother was civil, and Thurman didn't care, which was the whole of why I loved him and the whole of why he stayed behind." },
      },
      choices = {
        { text = "He stayed out of duty to them.", next = "w3_duty" },
        { text = "Gregor sounds a hard man.", next = "BACK", reply = "He was, and now he walks his mill with his eyes empty, and I find that I don't pity him as much as I ought to." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_duty = {
      lines = {
        { id = "w3_duty_1", text = "Duty, and fear of his father, and the hope that they'd come round in time, which they didn't. I told him duty would get him killed, and I was right, and I'll take no pleasure in that, though I'll not pretend I wasn't right." },
      },
      choices = {
        { text = "You warned him. That's something. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yvette Farthing. My father worked the Agamands' mills, and I meant to marry into the family that owned them, and now we sit in the Gallows' End because there's nowhere else that will have us." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("A Letter Undelivered") },
          text = "That hand on the envelope is Thurman's. I'd know it anywhere, even now. Where did you find it, {class}?" },
        { id = "h_done", when = { questDone = TODO_QUEST("A Letter Undelivered") },
          text = "I've read it twice, which is once more than I should have. Regrets are for the weak, and I've no use for them, but I'm glad to know what became of him." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick about it, or be quiet, and mind my father's chair." },
        { id = "h_again2", text = "Go on. My father's asleep in his chair, or doing whatever it is we do instead." },
      },
      choices = {
        { text = "I found a letter at Agamand Mills. It's addressed to you.", next = "letter", when = { questActive = TODO_QUEST("A Letter Undelivered") } },
        { text = "Who was Thurman Agamand?", next = "thurman" },
        { text = "You came from Agamand Mills?", next = "mills" },
        { text = "Your father looks like he carries a heavy load.", next = "father" },
        { text = "What did Thurman's family make of you?", next = "w3_family" },
        { text = "Nothing more. Good evening.", next = "END" },
      },
    },
    letter = {
      lines = { { id = "l_default", text = "Oh, my poor Thurman. I begged him to leave the mills with my father and me, but his family loyalty was too strong, and I knew it would be. And I knew Brand meant him harm, I just knew it." } },
      choices = {
        { text = "Who was Brand?", next = "brand" },
        { text = "I'm sorry. It must hurt to read.", next = "regrets" },
      },
    },
    brand = {
      lines = { { id = "b_default", text = "Someone Thurman trusted more than he should have, and that's all I'll say of him. The Plague did the rest, and the Scourge after it, and now the mills are full of bones that won't lie still." } },
      choices = {
        { text = "Then I'll make sure they lie still.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurman = {
      lines = { { id = "t_default", text = "The eldest son of Gregor Agamand, who owned the mills and most of the folk who worked them. Thurman was kind, which in that family was a kind of weakness, and I loved him for it." } },
      choices = {
        { text = "Why didn't he leave with you?", next = "thurman2" },
        { text = "Something else, Yvette.", next = "BACK" },
      },
    },
    thurman2 = {
      lines = {
        { id = "t2_default", text = "Because his father wouldn't, and his brothers wouldn't, and an Agamand doesn't walk away from Agamand land. So he stayed when the Plague came, and I suppose he's still there, in whatever way the Scourge allows." },
        { id = "t2_done", when = { questDone = TODO_QUEST("A Letter Undelivered") },
          text = "His letter says he meant to follow us, in the end, once his father saw sense. His father never did, and the letter never left the mills, and that's the whole of it." },
      },
      choices = {
        { text = "Do you still love him?", next = "regrets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regrets = {
      big = true,
      lines = { { id = "r_default", text = "As a Forsaken I have new goals, {class}, and love is not one of them. Whatever I felt for him was buried in the same ground as the rest of me, and I've no wish to dig it up." } },
      choices = {
        { text = "It's not weakness to remember him kindly.", next = "BACK", reply = "Perhaps not, for you. For me it's a door I'd rather keep shut, but I'll allow that you mean well.", fx = { align = { light = 1 } } },
        { text = "You're right. The dead have no business with love.", next = "BACK", reply = "Just so. The Dark Lady asks for our hands and our wits, and neither of those needs a sweetheart.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    mills = {
      lines = { { id = "m_default", text = "Agamand Mills, north and west of here. My father worked for the Agamands most of his life, and when the grain went bad I begged Thurman to leave with us, and he wouldn't." } },
      choices = {
        { text = "My father sent me to the mills already.", next = "mills2", when = { any = { { questActive = TODO_QUEST("Deaths in the Family") }, { questActive = TODO_QUEST("The Haunted Mills") } } } },
        { text = "What is it like there now?", next = "mills2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mills2 = {
      lines = { { id = "m2_default", text = "Full of the Agamand family and their servants, walking about as if there were still work to do. My father sends people there to put them down, and I don't ask him how he feels about it." } },
      choices = {
        { text = "If you find any more letters there, I'd take them.", next = "BACK", reply = "There won't be any more. Thurman never wrote twice when once would do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "He does. Coleman Farthing served that family faithfully for years, and now he hires strangers to kill them, and he does it because someone must. Speak to him if you want work; he always has some." } },
      choices = {
        { text = "You speak of him gently.", next = "BACK", reply = "Do I? Then I must be tired. He stayed at the mills when the Agamands asked him to, and he's never forgiven them for asking." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They took the mills, and Thurman with them. I don't hate them as much as I ought to, which worries my father more than it worries me." } },
    forsaken = { { id = "tp_forsaken", text = "We're free, the Dark Lady says, and I believe her. Free of the Scourge, free of the living, and free of most of what we used to care about." } },
    background = { { id = "tp_bg", text = "I was a mill hand's daughter who was going to marry above herself. That plan didn't survive the Plague, and neither did I." } },
    advice = { { id = "tp_ad", text = "Don't go looking for the people you used to know. If they're dead, they'll find you, and if they're alive, they'll run." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, and I wouldn't try. Ask my father; he still likes to be asked things." } },
  },
}

-- Ageron Kargal: demon trainer in the Gallows' End; sells grimoires to teach warlocks' minions.
P:NPC {
  key = "tir_ageron", id = TODO_NPC("Ageron Kargal"), name = "Ageron Kargal", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "dry", "precise" }, values = { "knowledge", "control" },
  notices = { "class", "pet" },
  impression = {
    first = "He talks about imps the way a kennel master talks about hounds.",
    third = "{name} met Ageron Kargal, the demon trainer who keeps his books in the Gallows' End Tavern.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you, and no shelf-bitten fingers this time. Come in; Rupert hasn't frightened you off, and I'm glad of it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Hands off the shelf, buy what you mean to buy, and let me get back to my books." },
    { id = "g_default", text = "Keep your hands off the shelf unless you mean to buy. Some of these books bite, and the rest are worse." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock, and a customer, I hope. I was beginning to think Rupert had frightened all the custom away." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, I see. How is your servant behaving?" },
    { id = "g_summons", when = { questActive = TODO_QUEST("Halgar's Summons") }, text = "Still in Brill? Halgar does not send for a student twice, so I would take the road to the Undercity before he decides you were not worth the message." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Your {pet} is looking at my books with far too much interest. Tell it to sit, or I'll tell it for you." },
    { id = "n_notlock", cat = "class", when = { class = { "WARRIOR", "ROGUE", "PRIEST", "MAGE" } },
      text = "You're no warlock, so I've nothing to sell you, but you're welcome to stand there and be curious. Most people are." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, reading my spines from a safe distance. Your masters in Dalaran had a locked room for books like these, and I always thought the lock said more about them than the books did." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ageron Kargal. Rupert Boch teaches the warlocks of Brill their spells, and I teach their demons manners, which is the harder job by some distance." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Your demon knows what it was summoned knowing, {class}, and not a scrap more. A grimoire from me will teach it something new, if you have the coin and it's the right book for its kind." },
        { id = "h_summon", when = { class = "WARLOCK", minLevel = 10, questBefore = TODO_QUEST("Halgar's Summons") }, text = "There you are. A message came up from the Undercity this morning with your name on it, {class}, and Carendin Halgar does not write to students he thinks are a waste of his ink." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Ageron Kargal, and I teach demons their manners. Your orcs know something about demons, I'm told, though they learned it the expensive way, and my books are a good deal cheaper." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the candles while you think." },
        { id = "h_again2", text = "Ask, then, and I'll answer. The books will keep." },
        { id = "h_again3", text = "Was there something more? The imps on this shelf have no patience, and I have only a little." },
      },
      choices = {
        { text = "A warlock who binds a demon owes it fair treatment.", next = "BACK", reply = "Fair treatment, yes, the way a kennel master treats a hound. Firm, but never cruel.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Beat your demon until it obeys. That's all they understand.", next = "BACK", reply = "They understand pain, certainly, and they remember it. You'll regret it when it slips its leash.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Halgar sent for me? Why?", next = "summons", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "My demon talks back more than I'd like.", next = "backtalk", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon anything?", next = "grimoires" },
        { text = "Odd place to keep demon books, a tavern.", next = "tavern" },
        { text = "Which demon gives its master the most trouble?", next = "kinds" },
        { text = "You and Rupert Boch seem to share a trade.", next = "rupert" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },

    summons = {
      narr = "He takes a folded note from inside his coat, holding it by one corner as though it were damp.",
      lines = {
        { id = "su_default", text = "To teach you the voidwalker, I expect, since that is the next thing worth learning and he will not trust anyone else to watch the binding. You'll find him in the Magic Quarter, near the Temple of the Damned, and I would go before he has time to grow bored of waiting." },
        { id = "su_done", when = { questDone = TODO_QUEST("Halgar's Summons") }, text = "You've been, I see, and he didn't send you back in pieces, so I count that a success for both of us. Whatever he has you fetching for him now, fetch it quickly, because he forgives slowness less than he forgives failure." },
      },
      choices = {
        { text = "What is Halgar like?", next = "summons2" },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },
    summons2 = {
      big = true,
      lines = { { id = "su2_default", text = "Short with everyone, and very good, and he knows both. I sent him four students last year and he kept three, which is a better rate than the Plague managed. Are you going to be the fourth?" } },
      choices = {
        { text = "No. I'll do exactly as he says.", next = "BACK", reply = "Then you'll come back with a voidwalker, and he'll call it adequate, which from him is a parade.", fx = { align = { order = 1 } } },
        { text = "I'll find my own way through his tests.", next = "BACK", reply = "His circle has opinions about that, and so does the thing inside it. Do let me know how it goes.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    backtalk = {
      lines = {
        { id = "bt_default", text = "Then it is an imp, because nothing else in the Nether talks half so much. There is no grimoire that will shut its mouth, {class}, but a demon kept busy with new work has less breath left for insolence." },
        { id = "bt_void", when = { pet = { family = "Voidwalker" } }, text = "A voidwalker that talks back is a rare thing, and I would watch it closely, because they usually save their hatred up in silence. Keep it busy with new work, {class}, and let it spend its temper on your enemies." },
      },
      choices = {
        { text = "Then I'll work it hard, and let it sulk in the dark.", next = "BACK", reply = "Let it sulk as loudly as it likes, so long as it obeys. Sulking is the only freedom it has left, and it costs you nothing." },
        { text = "Something else.", next = "BACK" },
      },
    },

    kinds = {
      lines = { { id = "k_default", text = "The imp is the noisiest, but the real trouble comes from the succubus, who is clever enough to make her master enjoy being led. I sell her books to warlocks who have a few years behind them, and I tell them twice to read the warnings." } },
      choices = {
        { text = "And the voidwalker?", next = "kinds2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    kinds2 = {
      lines = { { id = "k2_default", text = "The voidwalker is the one I would trust, if I trusted any of them. It stands where it is put and takes the blows meant for its master, and it has never once pretended to like him, which is more honesty than you will get from most of Brill." } },
      choices = {
        { text = "You sound almost fond of it.", next = "BACK", reply = "I am fond of anything that does its work without conversation. Deathguard Royann in the cellar is another, and I have told her so." },
        { text = "Something else, Ageron.", next = "BACK" },
      },
    },

    rupert = {
      lines = { { id = "ru_default", text = "We share a customer, which is not the same thing. Rupert Boch teaches the warlock to call the creature and to throw shadow about, and then the warlock comes down the room to me, because the creature arrived knowing almost nothing." } },
      choices = {
        { text = "Do the two of you get along?", next = "rupert2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    rupert2 = {
      lines = { { id = "ru2_default", text = "Well enough, since neither of us wants the other's work. Gina Lang keeps the dearer books upstairs and thinks I'm a brute with a leash, and Kayla Smithe sells the first books down in Deathknell to pupils who can barely stand." } },
      choices = {
        { text = "So the trade runs from the grave to your shelf.", next = "BACK", reply = "From the grave to Kayla, from Kayla to me, and from me to the Undercity, if they last that long. A fair number of them do." },
        { text = "Gina calls you a brute?", next = "gina" },
      },
    },
    gina = {
      big = true,
      lines = { { id = "gi_default", text = "She calls me worse when she thinks I can't hear through the floorboards. She bargains with her demons as if they were merchants, and I leash mine as what they are, and we have agreed to let our customers decide which of us is the fool." } },
      choices = {
        { text = "Show me the grimoires. All of them.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon anything?", next = "grimoires" },
        { text = "Odd place to keep demon books, a tavern.", next = "tavern" },
        { text = "My demon talks back. I'd like it to stop, permanently.", next = "backtalk", when = { class = "WARLOCK" } },
        { text = "Which demon gives its master the most trouble?", next = "kinds" },
        { text = "You and Rupert Boch seem to share a trade.", next = "rupert" },
        { text = "I'll leave you to your books.", next = "END" },
        { text = "A leash. Nothing that hates you deserves more.", next = "BACK", reply = "You'll keep your fingers, then. Tell Gina I said so, if you want to see her smile.", fx = { align = { order = 1 } } },
        { text = "Gina's way sounds wiser to me.", next = "BACK", reply = "Then go upstairs and buy her books, and come back to me when the bargain goes sour.", fx = { align = { order = -1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    grimoires = {
      lines = { { id = "gr_default", text = "You don't teach it, you instruct it. Each grimoire binds a new trick into the demon's leash, a firebolt for an imp or a sacrifice for a voidwalker, and the demon learns because it can't refuse." } },
      choices = {
        { text = "Do the demons resent it?", next = "leash" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = { { id = "le_default", text = "Every moment of every day. An imp will tell you so, loudly, and a voidwalker will tell you nothing and mean it more, and the warlock who forgets that his servant hates him doesn't stay a warlock long." } },
      choices = {
        { text = "Then they're weapons, and weapons should be kept sharp.", next = "BACK", reply = "Spoken like a sensible master. Keep them sharp and on a short leash, and never leave them alone in the room.", fx = { align = { light = -1 } } },
        { text = "Binding anything that hates you is a fool's bargain.", next = "BACK", reply = "Perhaps it is, but the Forsaken bargain with worse every day, and the demons at least are honest about it.", fx = { align = { light = 1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    tavern = {
      lines = { { id = "t_default", text = "Where else would I keep them? The Undercity has its own trainers, and Brill has the newly risen coming up from Deathknell with an imp at their heel and no notion what to do with it. Renee doesn't mind, so long as nothing catches fire." } },
      choices = {
        { text = "Has anything caught fire?", next = "fire" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Once or twice, and never anything that mattered. Imps are spiteful rather than ambitious, and a singed tablecloth is about the limit of their imagination." } },
      choices = {
        { text = "That's reassuring, in a way.", next = "BACK", reply = "It is the only reassurance I offer, so make the most of it." },
        { text = "Something else, Ageron.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "The things I deal with are the smallest and stupidest of the Legion's servants, and that is why they can be leashed at all. I'd not sell a book for anything larger." } },
    background = { { id = "tp_bg", text = "I studied in Lordaeron before the Plague, quietly, because the Kirin Tor did not approve. They have bigger problems now." } },
    advice = { { id = "tp_ad", text = "Never let your demon see you hesitate, because it will remember the moment long after you've forgotten it." } },
    forsaken = { { id = "tp_forsaken", text = "We are a people who were leashed once and slipped the leash, which gives a Forsaken warlock a certain sympathy for his demon. I advise my customers not to indulge it." } },
    trade = { { id = "tp_trade", text = "The Magic Quarter has demon trainers of its own and better shelves than mine. I stay in Brill because the beginners are here, and beginners buy more books than masters do." } },
    _none = { { id = "tp_none", text = "That's not my subject. Ask me about imps and you'll get an answer." } },
  },
}

-- Caretaker Caice: keeps a crypt by the Shadow Grave that no one enters; puzzles the newly risen.
P:NPC {
  key = "tir_caice", id = TODO_NPC("Caretaker Caice"), name = "Caretaker Caice",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "deathknell" }, temper = { "solemn", "odd" }, values = { "dutiful", "free_will" },
  notices = { "greenness" },
  impression = {
    first = "It is hard to tell what he actually takes care of.",
    third = "{name} met Caretaker Caice, who keeps a sealed crypt in the graveyard at Deathknell.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back again. Most don't, once they find the road to Brill, so let the world settle around you a moment." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand where you like, but don't expect me to let the world settle for you this time." },
    { id = "g_default", text = "Another one up from the earth. Stand a moment, and let the world settle around you." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Most don't, once they find the road to Brill." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest among the graves. Say what you like over them, so long as you say it quietly and leave my door alone." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You're still learning which way your knees bend. It comes back, mostly." },
    { id = "n_older", cat = "greenness", when = { minLevel = 12 },
      text = "You have been out in the world a good while, by the way you stand. Few who have gone that far come back to look at the hole they climbed out of." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I will ask you to keep your demon back from the crypt door. The dead in there have been troubled enough without something from the Nether sniffing at the hinges." },
  },

  start = "hello",
  nodes = {
    w3_words = {
      lines = {
        { id = "w3_words_1", text = "They ask whether it's morning, nine times in ten, because the last thing they saw was lamplight in a sickroom. I tell them it's whatever time they need it to be, and then I tell them the truth, which is that it's been years." },
        { id = "w3_words_2", when = { race = "Scourge" }, text = "They ask whether it's morning, as you may have done, because the last thing they saw was a sickroom lamp. I told you whatever you needed to hear, I expect, and then the truth." },
      },
      choices = {
        { text = "How do they take the truth?", next = "w3_truth" },
        { text = "That's a gentle way to wake someone.", next = "BACK", reply = "It's the only gentle thing they'll get today, so I try to make it last." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_truth = {
      lines = {
        { id = "w3_truth_1", text = "Some weep, without tears, and some laugh, and one or two lie back down in the earth and wait for me to cover them again. Those I take to the crypt, and they are the reason I keep its door." },
      },
      choices = {
        { text = "Then you keep both kinds safe. Something else.", next = "BACK" },
      },
    },
    wentback = {
      lines = { { id = "wb_default", text = "I did, and it is the truth. Not everyone who wakes in the Shadow Grave wants what they wake to, and a few of them walk back to the earth and ask to be let lie, and the Dark Lady does not chain them the way the Lich King would have." } },
      choices = {
        { text = "And you put them in your crypt.", next = "wentback2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wentback2 = {
      big = true,
      lines = { { id = "wb2_default", text = "I do, and I close the door behind them, and I think that is the last kindness anyone in the Glades can still offer. Undertaker Mordo calls it a waste of good limbs, and perhaps you agree with him." } },
      choices = {
        { text = "A choice to lie down is still a choice. Honor it.", next = "BACK", reply = "Then you understand the work better than Mordo does. Free will that can only say yes is no freedom at all.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Forsaken are too few to let anyone quit.", next = "BACK", reply = "That is the argument I hear from the Executor's people, and it is not a foolish one. I only notice that the Lich King reasoned the same way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yard = {
      lines = { { id = "y_default", text = "It is, and that should tell you how the war has gone for Lordaeron. The mindless dead wander the lower rows, the Rattlecages walk the fields beyond the wall, and the only quiet ground left in Deathknell is the patch behind my door." } },
      choices = {
        { text = "Who keeps the mindless ones off the graves?", next = "yard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yard2 = {
      lines = { { id = "y2_default", text = "Deathguard Saltain sends the newly risen out to put them down, and to bring back what is still worth sewing on. I do not care for the scavenging, but I will say for Saltain that he never sends anyone toward my crypt." } },
      choices = {
        { text = "Then you and he have an understanding.", next = "BACK", reply = "We have a silence, which among the Forsaken is very nearly the same thing." },
        { text = "Something else, Caretaker.", next = "BACK" },
      },
    },
    buried = {
      lines = { { id = "bu_default", text = "Then you remember more than most, and I am sorry for it. I may have been the one who shut the lid on you, {name}, for I buried a great many in the plague years and I did not learn half their names." } },
      choices = {
        { text = "Then I owe you thanks for a decent burial.", next = "BACK", reply = "You owe me nothing, but I will take the thanks. Nobody has offered me any since the day I rose myself.", fx = { affinity = 1 } },
        { text = "A poor job, since I didn't stay down.", next = "BACK", reply = "The digging was sound. It was the Lich King who spoiled my work, and I have not forgiven him for it." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am the caretaker here, and this crypt is in my care. You were the Lich King's once, as every corpse in these Glades was, but His grip on you is broken, and whatever the living think of you, you can choose your road, which no ghoul ever will." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of the living, walking among our graves. You'll forgive me if I don't ask whose dead you've come to see." },
      },
      again = {
        { id = "h_again", text = "What else would you ask the caretaker? The ground is quiet for once." },
        { id = "h_again2", text = "Speak. The crypt isn't going anywhere." },
        { id = "h_again3", text = "Ask what you came to ask. I have stood here long enough to learn patience, and I have a great deal of it left." },
      },
      choices = {
        { text = "What's inside the crypt?", next = "crypt" },
        { text = "What do the living think of us?", next = "judged" },
        { text = "Who else keeps this graveyard?", next = "others" },
        { text = "You said some rose and went back down.", next = "wentback" },
        { text = "This graveyard is busier than most towns.", next = "yard" },
        { text = "I remember being buried here, Caretaker.", next = "buried", when = { race = "Scourge" } },
        { text = "What do people say when they first rise?", next = "w3_words" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    crypt = {
      lines = { { id = "c_default", text = "The dead who didn't rise, or who rose and went back down. The door is shut and I keep it shut, and nobody has yet given me a reason to open it." } },
      choices = {
        { text = "Then what are you guarding it from?", next = "crypt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crypt2 = {
      big = true,
      lines = { { id = "c2_default", text = "From the curious, mostly, and the apothecaries, who look at a sealed door the way a hungry man looks at a pie. Some rest is owed, even here. Don't you think so?" } },
      choices = {
        { text = "They've earned their rest. Leave them be.", next = "BACK", reply = "Then we agree, and the door stays shut. Not everyone who comes up from the earth wants to.", fx = { align = { light = 1 } } },
        { text = "The dead should serve the Dark Lady. All of them.", next = "BACK", reply = "Spoken like a true Forsaken, and maybe you're right. But not this door, not while I'm keeping it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    judged = {
      lines = { { id = "j_default", text = "The living, who see a corpse and reach for a torch, and the Scarlet Crusade worst of all. They'll judge you by your skin and your smell and never ask your name." } },
      choices = {
        { text = "And what chances do I have?", next = "chances" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chances = {
      lines = { { id = "ch_default", text = "To choose, which the Scourge never will. A ghoul out in the Glades does what it's told, and you, {class}, can walk away from anyone who tells you anything. That's more than most of the living can say." } },
      choices = {
        { text = "That's worth guarding too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Undertaker Mordo stitches up what the earth gives back, and Shadow Priest Sarvis tells the newly risen what they are. The Shadow Grave beside me is busier than my crypt, and I'm content to let it be." } },
      choices = {
        { text = "You don't mind being left out?", next = "BACK", reply = "Somebody has to stand still while everyone else is busy. I find I'm good at it." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They are slaves who don't know it. Pity them if you like, but don't turn your back on them." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They'll burn you and call it mercy. Keep away from their towers until you're strong enough to stay away by choice." } },
    sylvanas = { { id = "tp_syl", text = "She broke the chain, and I will serve her for that as long as I stand. I only hope she remembers that she broke it so that we could choose." } },
    forsaken = { { id = "tp_forsaken", text = "We are the dead who were given back our own minds, and nothing more mysterious than that. What each of us does with the gift is the only question worth asking in this graveyard." } },
    lordaeron = { { id = "tp_lord", text = "Deathknell was a village with a chapel once, and I dug its graves when they were dug one at a time. Now it is a graveyard with a village attached, and Executor Arren commands it." } },
    _none = { { id = "tp_none", text = "I keep a crypt. Beyond the gate, I know little and care less." } },
  },
}

-- Deathguard Terrence: walks the Undercity road; sends the curious after the Argent emissaries.
P:NPC {
  key = "tir_terrence", id = TODO_NPC("Deathguard Terrence"), name = "Deathguard Terrence",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "wary", "dry" }, values = { "dutiful", "loyal" },
  notices = { "race", "greenness" },
  impression = {
    first = "He doesn't trust strangers, even helpful ones, even dead ones.",
    third = "{name} met Deathguard Terrence, who patrols the road between Brill and the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Keep to the road, and keep moving. That's the best advice I've got, and it's free." },
    { id = "g_emissary", when = { questActive = TODO_QUEST("The Argent Emissary") }, text = "Found that Argent fellow yet? Southeast, toward the city's outskirts, and keep your head down." },
    { id = "g_emdone", when = { questDone = TODO_QUEST("The Argent Emissary") }, text = "You found the emissary, then. I hope he was worth the walk." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "I'm walking, I'm walking. Point that thing somewhere else." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Horde, and alive. You'll be wanting the Undercity, I expect; it's straight on, and don't stare at the abominations." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Deathknell, by the look of you. Stay off the Crusade's land until you've more than a rusty knife." },
  },

  start = "hello",
  nodes = {
    d2_wander = {
      lines = {
        { id = "d2_wander_1", text = "They wander toward whatever they remember, mostly, which means Agamand Mills or Cold Hearth Manor or some farm that isn't there any more. I find them standing in an empty doorway, and I walk them back to Brill before the Rattlecages find them first." },
      },
      choices = {
        { text = "Do they go quietly?", next = "d2_wander2" },
        { text = "That's kinder work than I'd expect from you.", next = "d2_wander2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_wander2 = {
      lines = {
        { id = "d2_wander2_1", text = "Most of them do, because there's nobody in the doorway to argue for them. The ones from Agamand are the worst, since the family's still there in a manner of speaking, and the Agamands didn't rise clean." },
      },
      choices = {
        { text = "I'll keep an eye out for strays.", next = "BACK", reply = "Do, and send them to the Magistrate, not to me. I'll only end up walking them twice." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    d2_post = {
      lines = {
        { id = "d2_post_1", text = "At the gate, standing up, when Zygand doesn't need me in Brill. A Deathguard doesn't sleep so much as stop looking for a while, and I've found I can do that on my feet if the wind's not too bad." },
      },
      choices = {
        { text = "Who walks the road while you stop?", next = "d2_post2" },
        { text = "That sounds miserable.", next = "d2_post2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_post2 = {
      lines = {
        { id = "d2_post2_1", text = "Dillinger, if he's sober, which is a joke, since none of us can drink. The Bulwark takes every spare guard this side of the city, so the road gets what's left over, and what's left over is me." },
      },
      choices = {
        { text = "The road's lucky to have you, then.", next = "BACK", reply = "The road doesn't know it's lucky, and I'd thank you not to tell it." },
        { text = "Something else, Terrence.", next = "BACK" },
      },
    },
    d2_living = {
      lines = {
        { id = "d2_living_1", text = "You do, and I'll not pretend I'm not one of the starers. The Dark Lady says the Horde are our allies, so you're welcome on my road, but I've spent a long time learning that warm things in Tirisfal are usually Crusaders." },
      },
      choices = {
        { text = "The Crusade would cut me down as fast as you.", next = "BACK", reply = "Faster, I'd guess, since they've had more practice on things like you. Walk on, then, friend." },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Terrence. I walk this road from Brill to the city gates and back again, and I see everyone who uses it, which is more than they'd like." },
        { id = "h_before", tags = { "news" }, when = { questBefore = TODO_QUEST("The Argent Emissary") },
          text = "Not sure if you heard, but two emissaries of the Argent Dawn just passed through here. Both Forsaken, which doesn't make me any less nervous about them poking around Tirisfal unsupervised." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Argent Emissary") },
          text = "The one you want headed southeast, toward the outskirts of the city. There's a pack of Scourge cultists snooping around out there, and if the emissary heard about them, that's where he'll be." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Argent Emissary") },
          text = "So the Dawn's out there hunting cultists on our doorstep. I don't mind the Argent Dawn, {class}, but I'd mind them less if they asked first." },
      },
      again = {
        { id = "h_again", text = "What else? I've a long road and short patience." },
        { id = "h_again2", text = "Go on, walk with me a bit. I don't stop." },
      },
      choices = {
        { text = "Why don't you trust the Argent Dawn?", next = "dawn" },
        { text = "What cultists?", next = "cult" },
        { text = "This road must see a lot of traffic.", next = "road" },
        { text = "The Executor sent me to motivate you.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "What happens to the newly risen who wander off?", next = "d2_wander" },
        { text = "You don't stop, but you must sleep somewhere.", next = "d2_post" },
        { text = "The living get stared at on this road.", next = "d2_living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Safe walking, Deathguard.", next = "END" },
      },
    },
    dawn = {
      lines = { { id = "d_default", text = "I don't distrust them, exactly. They fight the Scourge and so do we, but they answer to their own commanders, and I'd like to know what they're looking for in our glades before they find it." } },
      choices = {
        { text = "They're Forsaken. Doesn't that count for something?", next = "dawn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn2 = {
      lines = { { id = "d2_default", text = "It counts for a little. But a Forsaken who swears to the Dawn has two masters, and I've only ever had room for the one. When it comes to it, which one will they follow?" } },
      choices = {
        { text = "So what would you have the Dawn do?", next = "dawn3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn3 = {
      big = true,
      lines = { { id = "d3_default", text = "Check in at Brill, tell the Executor their business, and let a Deathguard walk with them. That's not much to ask of guests, is it?" } },
      choices = {
        { text = "It's our land. Guests should follow our rules.", next = "BACK", reply = "Just so. The Dark Lady didn't take Lordaeron back so that every banner in the world could wander through it.", fx = { align = { order = 1 } } },
        { text = "They're killing cultists. Let them work without a minder.", next = "BACK", reply = "Hmph. Maybe you're right, and maybe I'm only sore that they're doing my job. Still, I'll be watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "Cult of the Damned, the living who serve the Scourge of their own free will. They've been seen southeast of the city, skulking about the outskirts, and they're not to be trifled with, so stay low and try not to be seen." } },
      choices = {
        { text = "Why would the living serve the Scourge?", next = "cult2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      lines = { { id = "c2_default", text = "Promises. Kel'Thuzad promised them they'd live forever, and they believed him. We're what forever looks like, and you'd think one look at us would cure them of the notion." } },
      choices = {
        { text = "Some of them might listen, shown the truth.", next = "BACK", reply = "Might. I've never met one who did, and I don't plan to wait around to meet one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Newly risen going to the city, apothecaries going to Brill, Horde from Durotar coming off the zeppelin, and the odd fool who thinks a Crusade tabard will get him through. It doesn't." } },
      choices = {
        { text = "Do you ever stop walking?", next = "BACK", reply = "Not if I can help it. The last Deathguard who stopped on this road got a visit from the Executor's motivator." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Me? I never stop walking, you ask anyone. Fine, fine, do what you must, and I'll be telling Zygand I was on my rounds when you found me." } },
      choices = {
        { text = "Consider yourself motivated.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    argent_dawn = { { id = "tp_dawn", text = "Good fighters, poor guests. That's all I'll say about the Dawn." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They come down the road sometimes, pretending to be pilgrims. They're very bad at it." } },
    _none = { { id = "tp_none", text = "If it isn't on this road, I don't know it. Ask in Brill." } },
  },
}

-- Deathguard Cyrus: a Brill guard who gives directions by the book and recites the rules.
P:NPC {
  key = "tir_cyrus", id = TODO_NPC("Deathguard Cyrus"), name = "Deathguard Cyrus",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "stiff", "proper" }, values = { "dutiful", "order" },
  notices = { "race" },
  impression = {
    first = "He would make a fine clerk, if Brill still had any.",
    third = "{name} met Deathguard Cyrus, one of the guards who keeps watch in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again, {class}. Your conduct has been exemplary, as far as I can tell, and I'll note it so." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. State your business in Brill, and I'll point you to it, and then I'd thank you to go." },
    { id = "g_default", text = "State your business in Brill, {class}, and I'll point you to it." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "There must be some mistake. My conduct has been exemplary, and I can produce witnesses." },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "I trust the Executor was satisfied with your work. I certainly was not." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {class}. I trust my directions were accurate, since nobody has yet come back to complain of them." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Visitors from the Horde are welcome in Brill, provided they keep the peace and don't eat anything from the apothecaries' tables." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your equipment is in a state that would earn a Deathguard extra watches. Abe Winters sells armor near the square, and I recommend him before you leave town." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I will remind you that Brill has a magistrate and a gallows, and that both are in working order. I mention it to everyone who walks as quietly as you do." },
  },

  start = "hello",
  nodes = {
    w3_before = {
      lines = {
        { id = "w3_before_1", text = "A clerk of some sort, I believe, since I dream of forms in triplicate and wake reaching for a quill. The Executor says it shows, and he does not intend it kindly, though I've chosen to take it that way." },
      },
      choices = {
        { text = "Forms in triplicate?", next = "w3_forms" },
        { text = "A clerk makes a thorough guard.", next = "BACK", reply = "Thank you. I have often thought so, and nobody else has ever said it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_forms = {
      lines = {
        { id = "w3_forms_1", text = "Requisitions, I think, for lamp oil and boots, signed and countersigned and stamped with a seal I can almost see. I keep a log of the Brill watch in that same hand, and nobody reads it, but I like to know it would pass inspection." },
      },
      choices = {
        { text = "I'm sure it would. Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = {
        { id = "tr_default", text = "The Gallows' End houses most of them. Rupert Boch teaches warlocks and Cain Firesong teaches mages, Marion Call sees to the rogues, and Austil de Mon drills warriors with more shouting than I think is strictly required." },
        { id = "tr_priest", when = { class = "PRIEST" }, text = "For a priest, that is Dark Cleric Beryl, in the Gallows' End with the rest of them. The other trainers keep rooms there too, should your companions need one." },
      },
      choices = {
        { text = "A Deathguard's report should be accurate, every last detail.", next = "BACK", reply = "Precisely, {class}. I keep my own reports in triplicate, and every detail is checked.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody reads the reports. Write whatever keeps the Executor happy.", next = "BACK", reply = "The Executor reads them, I assure you, and he'd hang you for a false one. I've seen him do it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "And for a trade, rather than a fight?", next = "trainers2" },
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    trainers2 = {
      lines = { { id = "tr2_default", text = "Carolai Anise teaches alchemy and Faruza teaches herbalism, both near the square, and Nurse Neela will show you how to bind a wound. For a horse you want Velma Warnam and Zachariah Post at the stable on the east side of town." } },
      choices = {
        { text = "You recite that as if it were written down.", next = "BACK", reply = "It is written down. I wrote it myself, and I revise the list whenever somebody moves, which they do without informing me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Somebody must. Deathguard Linnea is sound, and Burgess is sound when he is not talking, but Lawrence leans on the wall as though it were holding him up, and Mort has not been seen at street level in a month." } },
      choices = {
        { text = "Have you told the Executor so?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      big = true,
      lines = { { id = "ot2_default", text = "I have submitted my observations in writing, on three occasions, and Executor Zygand has thanked me for them each time. The others no longer sit with me off watch, and I am told the two facts are connected." } },
      choices = {
        { text = "A watch only works if someone reports the gaps.", next = "BACK", reply = "That is precisely my position, and I am glad to hear it said by someone who is not me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody loves an informer, Cyrus. Ease off them.", next = "BACK", reply = "I do not require to be loved. Still, I will consider whether Lawrence's posture is truly a matter for the Executor.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "lv_default", text = "I am told that it looks like a funeral that nobody has thought to end. You will find the people civil enough, {race}, provided you do not stare, do not wrinkle your nose, and do not ask anyone how they died." } },
      choices = {
        { text = "I'll keep my nose still, then.", next = "BACK", reply = "That is appreciated. Innkeeper Renee keeps a room for your kind, and the food there is fit for a stomach that still works." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Cyrus, on watch in Brill. If you need the inn, the Executor, an apothecary or a stable, I can direct you to any of them, and quickly." },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "Deathguard Cyrus, on watch in Brill. You are new to the town, I think, so note where the Executor stands and where the inn is, because everything else in Brill is found by walking from one to the other." },
      },
      again = {
        { id = "h_again", text = "Anything further? I'll note it in the log, whatever it is." },
        { id = "h_again2", text = "Go on. I'm listening, and watching, and keeping count of both." },
        { id = "h_again3", text = "Is there another location you require? I know them all, and the distances between them." },
      },
      choices = {
        { text = "Where can I find the Executor?", next = "directions" },
        { text = "You seem very sure of your duty.", next = "duty" },
        { text = "I'm here to motivate you. Executor's orders.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "I need a trainer, Deathguard.", next = "trainers" },
        { text = "You keep a close eye on the other guards.", next = "others" },
        { text = "How does Brill look to one of the living?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "What were you before the Deathguard?", next = "w3_before" },
        { text = "That's all, Deathguard.", next = "END" },
      },
    },
    directions = {
      lines = { { id = "d_default", text = "Executor Zygand stands in the middle of town, where he can see everyone and everyone can see him. The Gallows' End is the tavern with the noise coming out of it, and Zachariah Post will sell you a horse if you've the coin and the years for it." } },
      choices = {
        { text = "And Deathknell, if I needed to go back?", next = "directions2" },
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    directions2 = {
      lines = { { id = "d2_default", text = "West along the road, through the graves and past the farms the Crusade still likes to haunt. I wouldn't go back unless you've forgotten something, and the dead seldom forget much." } },
      choices = {
        { text = "Helpful as ever, Cyrus.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty = {
      big = true,
      lines = { { id = "du_default", text = "Duty is what's left when the rest is gone, {class}. I can't taste, I can't sleep, I can't remember my mother's face, but I can stand my post, and I do it properly." } },
      choices = {
        { text = "Then you stand it well. Brill is safer for it.", next = "BACK", reply = "It is, and I'll thank you not to tell the others I liked hearing it.", fx = { align = { order = 1 } } },
        { text = "A post isn't a life. You could want more.", next = "BACK", reply = "Perhaps, if I could remember what more looked like. Until then, I'll stand here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "I've never missed a watch, not one, and I'll have that noted. Very well, if the Executor insists, do it quickly and do it where the others can't see." } },
      choices = {
        { text = "Done. Back to your post, Deathguard.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They hold a tower on the road west and a great many farms they have no right to. Executor Zygand has standing work against them, if you report to him." } },
    forsaken = { { id = "tp_forsaken", text = "We serve the Dark Lady, and in Brill we serve her through Executor Zygand, who commands the town, and Magistrate Sevren, who judges it. I direct people between the two." } },
    advice = { { id = "tp_ad", text = "Report to the Executor when you arrive in any town, and learn where the inn is before dark. Everything else can be found by asking a Deathguard." } },
    _none = { { id = "tp_none", text = "That's not covered in my duties, I'm afraid. Try the Executor, or the inn." } },
  },
}

-- Deathguard Lawrence: a Brill guard who leans on things and resents the motivator.
P:NPC {
  key = "tir_lawrence", id = TODO_NPC("Deathguard Lawrence"), name = "Deathguard Lawrence",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "grumbling", "dry" }, values = { "comfort", "survival" },
  notices = { "race" },
  impression = {
    first = "He has a long list of complaints about the Executor.",
    third = "{name} met Deathguard Lawrence, a weary guard who keeps watch in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, and not from the Executor, I hope. Sit down, then, and let me tell you about my day." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, no. Not you again. I suppose Zygand sent you to check up on me, so get it over with." },
    { id = "g_default", text = "If you're lost, I can help. If you're from the Executor, I was just straightening up." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "Oh, no. Not you as well. Doesn't Zygand have anything better for his errand-runners to do?" },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "My shoulder still smarts, if you were wondering. I wasn't sure we could still feel that." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. Good, because I was beginning to worry that somebody important was coming." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, and not long up. Here's a tip: lean on the left foot, it's usually the one with fewer loose bits." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're breathing, which makes you the liveliest thing on this side of the square. Don't let the apothecaries see you doing it, or they'll want to know how it works." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You've a soldier's shoulders, so you'll know that half of soldiering is standing about. I've only gone and made a study of that half." },
  },

  start = "hello",
  nodes = {
    w3_lean = {
      lines = {
        { id = "w3_lean_1", text = "Right here, against the post by the well, where the wall keeps the wind off and you can see both ends of the street. I've tried them all, mind, and the one by the stable smells of Morganus's hounds, and the one by the inn has Cyrus." },
      },
      choices = {
        { text = "Cyrus spoils a good spot?", next = "w3_cyrus" },
        { text = "You've given this a great deal of thought.", next = "BACK", reply = "A guard has a great deal of time, {class}, and very little to spend it on except the quality of his posts." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_cyrus = {
      lines = {
        { id = "w3_cyrus_1", text = "He stands so straight beside it that leaning near him feels like a confession. I'm sure he means well, and I'm sure he's writing me down even now, from across the square, without looking up." },
      },
      choices = {
        { text = "He probably is. Something else.", next = "BACK" },
      },
    },
    view = {
      lines = { { id = "v_default", text = "It does, and I've earned it. From here I can see the Gallows' End door, the Executor's back and the road in from Deathknell, which is all three of the things a guard in Brill needs to keep an eye on." } },
      choices = {
        { text = "A soldier should own up when he's been shirking.", next = "BACK", reply = "Well, yes, I suppose so, but I'd rather the Executor didn't hear me agree to that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Shirk all you like. Just don't let Zygand catch you at it.", next = "BACK", reply = "Now that's sensible advice! It's a shame Zygand catches everything, every single time.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What comes up the Deathknell road?", next = "view2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view2 = {
      lines = { { id = "v2_default", text = "The newly risen, mostly, blinking and holding their jaws on with one hand. Now and then a darkhound follows one in from the fields, and once a Scarlet scout rode right up to the first houses before Linnea put an arrow through his horse." } },
      choices = {
        { text = "And what did you do?", next = "BACK", reply = "I shouted, and I shouted very well. Somebody has to raise the alarm, and it may as well be the one who was already looking that way." },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "Cyrus writes me up, Royann laughs at me, and Mort hasn't come downstairs long enough to have an opinion. Burgess is the only one who'll stand and talk, and that's because Burgess will talk to a fence post if it holds still." } },
      choices = {
        { text = "Cyrus writes you up?", next = "guards2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards2 = {
      lines = { { id = "gu2_default", text = "In a little book, with the date, and then he hands it to Zygand as though he were delivering the mail. I don't hold it against him, mind, because some men need a ledger the way I need a wall, and we all lean on something." } },
      choices = {
        { text = "That's generous of you, Lawrence.", next = "BACK", reply = "It's easier than being angry, and I've always done whatever was easier. It's served me well enough to get killed only the once." },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "Then you know the trick of it, {class}. You find the spot where the wind doesn't reach and the sergeant can't quite see, and you make it look like the most important spot on the wall." } },
      choices = {
        { text = "I always took the spot by the gate fire.", next = "BACK", reply = "The gate fire! There's a soldier who knows the craft. I'd shake your hand if I trusted mine to stay on.", fx = { affinity = 1 } },
        { text = "I stood where I was posted, Lawrence.", next = "BACK", reply = "Of course you did, and I expect you were promoted for it. Somebody has to be." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Lawrence, guarding Brill. I came back here when the Dark Lady took the town back, and I've been standing in roughly this spot ever since." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Deathguard Lawrence, guarding Brill, and you're a long way from wherever they sent you from. I've stood in roughly this spot since the Dark Lady took the town back, so if you want to know where anything is, I've had the time to look at all of it." },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time; I'm not going anywhere." },
        { id = "h_again2", text = "Ask away, if it doesn't involve me moving." },
        { id = "h_again3", text = "What else, then? I've nowhere to be until the watch changes, and it never does." },
      },
      choices = {
        { text = "What's the Executor like to serve under?", next = "zygand" },
        { text = "You knew Brill before, then?", next = "before" },
        { text = "Executor Zygand sent me with his motivator.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "This wall of yours has a fine view.", next = "view" },
        { text = "What do the other guards make of you?", next = "guards" },
        { text = "I stood watches myself, once.", next = "soldier", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Where's the best leaning spot in Brill?", next = "w3_lean" },
        { text = "Carry on, Lawrence.", next = "END" },
      },
    },
    zygand = {
      lines = { { id = "z_default", text = "Exacting. He keeps a ledger with all our names in it, and every so often he hands a stranger a stick and lets them work down the list. I'm near the top, apparently, though no one will tell me why." } },
      choices = {
        { text = "Perhaps it's the leaning.", next = "zygand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand2 = {
      big = true,
      lines = { { id = "z2_default", text = "A man can lean and watch at the same time. Nothing's got past me yet, not on my side of the square. But you tell me, {class}, is a guard who's resting a guard who's failing?" } },
      choices = {
        { text = "A guard should stand straight. The Executor's right.", next = "BACK", reply = "You and him both. Fine, I'll stand up straight until you're out of sight.", fx = { align = { order = 1 } } },
        { text = "If nothing's got past you, you're doing your job.", next = "BACK", reply = "That's what I keep saying! I'd have you speak for me, if Zygand ever let anyone speak.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "I knew it when it was a market town, with bread and beer and folk who complained about the weather. Now it's all apothecaries and gallows humour, and nobody complains about the weather because nobody feels it." } },
      choices = {
        { text = "Do you miss it?", next = "BACK", reply = "Miss is a strong word. I notice it's gone, the way you notice a tooth's gone, and then I get on with leaning." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Of course he did. Go on, then, get it over with, and tell him I was standing perfectly straight when you arrived." } },
      choices = {
        { text = "You were leaning, Lawrence.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They burn what they catch, so I make a point of not being caught. They mostly keep to their tower west of here, and I'm happy to let the Executor's volunteers go and argue with them." } },
    forsaken = { { id = "tp_forsaken", text = "We're the ones who got up again and kept our wits, more or less. I'd have chosen a softer afterlife if anyone had asked me, but nobody did." } },
    advice = { { id = "tp_ad", text = "Find a wall with a view and let the trouble come to you. It always does, and you'll be better rested when it arrives." } },
    _none = { { id = "tp_none", text = "No idea. Ask Cyrus; he knows everything and he'll tell you, at length." } },
  },
}

-- Deathguard Mort: keeps watch upstairs in Brill's south building; once walked the Garren's Haunt road.
P:NPC {
  key = "tir_mort", id = TODO_NPC("Deathguard Mort"), name = "Deathguard Mort",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "gloomy", "quiet" }, values = { "solitude", "dutiful" },
  notices = { "race" },
  impression = {
    first = "He has had far too much time to think and hated it.",
    third = "{name} met Deathguard Mort, who keeps watch from upstairs in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "So you've climbed the stairs again, and the third step's still missing. Sit with me a while, if you've the patience." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "So he's found me even up here, again. You know where the stairs are, so I'll trust you to find them on your way down." },
    { id = "g_default", text = "Up the stairs, are you? Not many bother. Mind the third step; it isn't there." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "So he's found me even up here. I suppose that's a compliment, of a sort." },
    { id = "g_back", when = { metBefore = true }, text = "You found the stairs again, and remembered the third step by the look of you. That makes you my most regular visitor." },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "You've come back up without the Executor's stick this time. I notice these things, since there is little else up here to notice." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You climbed all those stairs with lungs. I'd be impressed, if I could still be impressed." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You have a hunter's eyes, always on the far end of the road. Stand at the window a moment and tell me if that shape by the fence is a darkhound or a stump, because I have been wondering since noon." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You're not long out of the ground, are you? You'll find the nights are the hard part, when the town goes quiet and you remember that you used to sleep through them." },
  },

  start = "hello",
  nodes = {
    w3_step = {
      lines = {
        { id = "w3_step_1", text = "An abomination came up to fetch me for the Executor, a year past, and the step went under it like a biscuit. Nobody's mended it, and I've never asked, because now I hear anyone coming a good while before they arrive." },
      },
      choices = {
        { text = "You like knowing who's coming.", next = "w3_hear" },
        { text = "Shall I tell the Executor it's broken?", next = "BACK", reply = "Please don't. He'd have it mended, and then I'd have nothing to listen for." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_hear = {
      lines = {
        { id = "w3_hear_1", text = "I do. Most climb up cursing when they reach it, which tells me they've come for business, and one or two hop over it, which tells me they've been up before. You stepped over it neatly, so I suppose you're getting to know me." },
      },
      choices = {
        { text = "I suppose I am. Something else.", next = "BACK" },
      },
    },
    window = {
      lines = { { id = "wi_default", text = "North as far as the fences at Garren's Haunt on a clear day, and east to where the road bends toward Brightwater Lake. On a clear night I can see the lanterns at the Scarlet tower away to the west, and I count them, for something to do." } },
      choices = {
        { text = "A soldier stands his post even when he's forgotten up here.", next = "BACK", reply = "I do, though I've had a great deal of time to wonder why. Thank you for reminding me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If they've forgotten you, slip away. Who would ever notice?", next = "BACK", reply = "I've thought of it, more than once. The trouble is, Zygand never forgets anyone.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How many lanterns?", next = "window2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    window2 = {
      lines = { { id = "wi2_default", text = "Six, most nights, and seven when they are expecting someone. I send word down to Executor Zygand when it is seven, and he has stopped asking how I know, which I take for a kind of thanks." } },
      choices = {
        { text = "That's real work, Mort, whatever you call it.", next = "BACK", reply = "It's counting, and any child could do it. Still, nobody else in Brill is doing it, so I suppose it's mine.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moved = {
      lines = { { id = "mv_default", text = "Because I stopped on the road one evening, outside the Haunt, and did not start again until the morning watch came looking for me. I was not hurt and I was not afraid, I only stood there, and the Executor decided a man who stands is better used at a window." } },
      choices = {
        { text = "What were you looking at, all night?", next = "moved2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moved2 = {
      big = true,
      lines = { { id = "mv2_default", text = "The farmhouse door, and whatever was standing behind it looking back at me. The Rot Hide gnolls have the place now, dead things that dig up other dead things, and I could not stop thinking how little there is between their sort and ours." } },
      choices = {
        { text = "There is a mind between you. Hold on to that.", next = "BACK", reply = "That's what the Dark Lady's priests say, and on a good day I believe them. I'll try to have more good days.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Very little. We're only the ones who won.", next = "BACK", reply = "So I thought, standing there. It's a cold thing to hear agreed with, but I'd sooner have it honest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beenthere = {
      lines = { { id = "bt_default", text = "Then you have seen the gnolls, and the cellar, and I need not describe either. Apothecary Johaan sends people out there for what the Rot Hides carry on them, and I watch them go up the road and I count them coming back." } },
      choices = {
        { text = "Do they all come back?", next = "BACK", reply = "Most of them, and the rest come back later, on their own feet, rather worse dressed. Nothing in the Glades stays lost for long." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Mort. I used to walk the road between Brill and Garren's Haunt, until the Executor decided I'd be more use up here, watching it instead." },
        { id = "h_back", when = { metBefore = true }, text = "Still Deathguard Mort, and still at the window. The road to Garren's Haunt hasn't moved since you were last up here, and neither have I." },
      },
      again = {
        { id = "h_again", text = "Something else, while you're up here? Mind the step going down." },
        { id = "h_again2", text = "Go on. It's quiet, which is how I like it." },
        { id = "h_again3", text = "Ask, if there's more. I'll keep one eye on the road while you do." },
      },
      choices = {
        { text = "What's out at Garren's Haunt?", next = "garren" },
        { text = "You don't seem to mind the solitude.", next = "alone" },
        { text = "The Executor's motivator, I'm afraid.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "You can see a long way from this window.", next = "window" },
        { text = "Why did the Executor move you up here?", next = "moved" },
        { text = "I've been out to Garren's Haunt myself.", next = "beenthere", when = { minLevel = 8 } },
        { text = "What happened to the third step?", next = "w3_step" },
        { text = "I'll leave you to your window.", next = "END" },
      },
    },
    garren = {
      lines = { { id = "ga_default", text = "A farmstead to the north, full of hungry dead that nobody has bothered to clear. I walked past it every day for weeks, and every day something in there was watching me back." } },
      choices = {
        { text = "Did you ever go inside?", next = "garren2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garren2 = {
      big = true,
      lines = { { id = "g2_default", text = "Once, and I came out quicker than I went in. Some places should be burned, {class}, and some should be left to rot by themselves. I've never decided which that one is." } },
      choices = {
        { text = "Burn it. Leave nothing for the Scourge.", next = "BACK", reply = "Maybe. Though fire spreads, and Brill's no stranger to burning. I'll mention it to the Executor, if I ever see him.", fx = { align = { light = 1 } } },
        { text = "Leave it. Rot is what this land does now.", next = "BACK", reply = "That's the Forsaken way of looking at it, and maybe the wiser one. Let the Glades eat it slowly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "I don't mind it, no. Down there everyone is very busy pretending to be alive, and up here I can watch the road and not pretend anything." } },
      choices = {
        { text = "That sounds lonely, Mort.", next = "BACK", reply = "Lonely is for the living. This is just quiet, and quiet is what I've got." },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Fair enough. I've been up here so long I'd half forgotten I was supposed to be doing anything. Go ahead; I'll be watching the road again before you're down the stairs." } },
      choices = {
        { text = "Mind the third step.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "They're out there in the fields and the old farms, and they'd be in here if the Deathguard stopped walking the roads. I think about that more than I'd like to." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "I can see their tower lanterns from this window on a clear night. They keep better watch than we do, and I've told the Executor so." } },
    advice = { { id = "tp_ad", text = "Don't stop on the road after dark, not outside the Haunt and not anywhere. Keep walking, whatever you think is looking at you." } },
    _none = { { id = "tp_none", text = "Can't help you there. I only know what I see from this window." } },
  },
}

-- Deathguard Royann: guards the cellar of the Gallows' End Tavern.
P:NPC {
  key = "tir_royann", id = TODO_NPC("Deathguard Royann"), name = "Deathguard Royann",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "sardonic", "watchful" }, values = { "dutiful", "order" },
  notices = { "race", "class" },
  impression = {
    first = "She guards the tavern from its customers more than from the Crusade.",
    third = "{name} met Deathguard Royann, who guards the cellar of the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Down here again? You're the only one who comes looking for me, and I'll confess it makes the cellar less dull." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Down here again? You've a gift for finding me, and I'd rather you lost it." },
    { id = "g_default", text = "Lost on the way to the bar? It's upstairs, where it's always been." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "Down here? Really? I'm the only Deathguard in Brill who works indoors, and you still came looking." },
    { id = "g_back", when = { metBefore = true }, text = "You're down here again, and sober again, which makes twice. I'm beginning to think you come for my company." },
    { id = "g_disdone", when = { questDone = TODO_QUEST("Discipline") }, text = "Here's the Executor's errand-runner, back at the scene. You didn't crack a single barrel last time, and I'll admit I was nearly impressed." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Keep your imp off the barrels; the last one set fire to a perfectly good cask of something." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the living, in my cellar. The drink upstairs will actually work on you, so I can't think why you'd come down here to look at the casks instead." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I heard you on the fourth stair, rogue, so don't flatter yourself. Marion Call's pupils all try the cellar sooner or later, and I count the bottles after every one of them." },
  },

  start = "hello",
  nodes = {
    w3_rat = {
      lines = {
        { id = "w3_rat_1", text = "He comes out from behind the third cask at closing and sits on the bottom stair, and he never touches a barrel, which is more than I can say for the Deathguard. I've named him Sergeant, because he outranks half the town in discipline." },
      },
      choices = {
        { text = "You talk to him, don't you?", next = "w3_talk" },
        { text = "A rat in a cellar ought to be killed.", next = "BACK", reply = "Then you'd lose me my only reliable colleague, and I'd have to talk to Lawrence instead. Leave Sergeant be." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_talk = {
      lines = {
        { id = "w3_talk_1", text = "Every night, and he's a better listener than Renee, who's always busy upstairs. I tell him what I've heard through the ceiling, and he twitches his whiskers at the parts that matter, and so far he's never been wrong." },
      },
      choices = {
        { text = "A good sergeant indeed. Something else.", next = "BACK" },
      },
    },
    stores = {
      lines = { { id = "st_default", text = "Renee's casks, for the living guests and for the dead ones who like to hold a mug. Past those are the Executor's stores for the town, lamp oil and bandages and arrows, which are the real reason a Deathguard stands on these stairs." } },
      choices = {
        { text = "A guard should keep a tavern orderly, even for the drunkards.", next = "BACK", reply = "Especially for the drunkards, because they're the ones who need it most and like it least.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the drunkards brawl. It's no business of the Deathguard's.", next = "BACK", reply = "It's my business when they break the tables, and they always break the tables. No.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "So the joke about guarding beer isn't the whole story.", next = "stores2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores2 = {
      lines = { { id = "st2_default", text = "It never is, though I let people go on telling it. If the Scarlet Crusade ever comes up the road in strength, Brill fights out of this cellar, and I'd rather the Crusade's spies heard about a bored guard and some ale." } },
      choices = {
        { text = "Then I'll keep telling the joke.", next = "BACK", reply = "Good. Tell it loudly, and tell it at the bar, where it'll travel.", fx = { affinity = 1 } },
        { text = "Something else, Royann.", next = "BACK" },
      },
    },
    ceiling = {
      lines = { { id = "ce_default", text = "Every word, and the boards carry it better than they should. I know which apothecary is behind on his work and which trainer is short of pupils, and I know that Coleman Farthing says a good deal less than he's thinking." } },
      choices = {
        { text = "What do you do with all that?", next = "ceiling2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceiling2 = {
      big = true,
      lines = { { id = "ce2_default", text = "Most of it I keep, because gossip's only worth something while it's scarce. Anything that smells of the Crusade or the Scourge goes to Executor Zygand the same night, and I've wondered once or twice whether the rest ought to go with it." } },
      choices = {
        { text = "Tell him everything. Let the Executor decide what matters.", next = "BACK", reply = "That's what Cyrus would say, and he'd write it out in a fair hand too. Maybe I should stop being so choosy.", fx = { align = { order = 1 } } },
        { text = "A town needs some secrets left alone.", next = "BACK", reply = "That's my feeling. People talk over a mug because they think nobody's keeping count, and I'd sooner not prove them wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ageron = {
      lines = { { id = "ag_default", text = "Ageron Kargal keeps his books in order and his customers in line, so no, not him. It's the pupils who worry me, because every one of them has an imp, and every imp thinks a cellar full of oil is the funniest thing it has ever seen." } },
      choices = {
        { text = "Mine stays on a short leash, and it knows the cost of slipping.", next = "BACK", reply = "See that it does, {class}. I've a bucket of sand by the stairs, and I'm not particular about whether it lands on the fire or the imp." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Royann. I guard the cellar, which sounds like a joke until you've seen what comes down these stairs at closing time. If you need directions, I've those too." },
        { id = "h_back", when = { metBefore = true }, text = "Deathguard Royann, still minding the cellar. Nothing's come down those stairs today but you and a rat, and the rat had better manners about the barrels." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down; it carries." },
        { id = "h_again2", text = "Go on, then, while the cellar's quiet." },
        { id = "h_again3", text = "What else do you want to know? I've a whole cellar of time down here." },
      },
      choices = {
        { text = "What comes down the stairs at closing?", next = "closing" },
        { text = "Where would I find Innkeeper Renee?", next = "directions" },
        { text = "Executor Zygand sends his regards. And his motivator.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "What's actually kept down here?", next = "stores" },
        { text = "You hear the whole tavern through that ceiling.", next = "ceiling" },
        { text = "Ageron's shelf upstairs is full of fire. Does that worry you?", next = "ageron", when = { class = "WARLOCK" } },
        { text = "Tell me about the rat with good manners.", next = "w3_rat" },
        { text = "I'll go back up.", next = "END" },
      },
    },
    closing = {
      lines = { { id = "c_default", text = "Deathguard off watch, apothecaries who've sampled their own work, and newly risen who think the cellar's where the good stuff is kept. None of us can get drunk, mind, but you'd never know it to watch them try." } },
      choices = {
        { text = "What do you do with them?", next = "closing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    closing2 = {
      big = true,
      lines = { { id = "c2_default", text = "Send them back up, usually, and remember their faces for the Executor if they're rude about it. What would you do, {class}, if you had the stairs?" } },
      choices = {
        { text = "Report every one of them. Rules are rules.", next = "BACK", reply = "Spoken like Zygand himself. I'd keep a ledger too, if I could be bothered to write.", fx = { align = { order = 1 } } },
        { text = "Let them be. They've little enough left.", next = "BACK", reply = "Soft of you, but not wrong. I let most of them go with a glare, and the glare does the work.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    directions = {
      lines = { { id = "d_default", text = "Renee's upstairs behind the counter, where she always is. Coleman Farthing sits by the hearth if you're after work, and the trainers keep to their own rooms; ask Renee which, she knows them all." } },
      choices = {
        { text = "Thank you, Royann.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    motivate = {
      lines = { { id = "mo_default", text = "Fine, but make it quick, and don't knock over anything on your way out. Zygand can explain the barrels to Renee if you do." } },
      choices = {
        { text = "Careful as I can be.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They've a tower out west and scouts on every road. If they ever try Brill itself, they'll find this cellar a harder door than it looks." } },
    forsaken = { { id = "tp_forsaken", text = "We're a people keeping busy so that we needn't think, and the tavern upstairs is where everyone comes when that stops working. I hear all of it through the boards." } },
    advice = { { id = "tp_ad", text = "Say less than you know when you're near a bar. Coleman Farthing upstairs has made a whole afterlife out of doing it." } },
    _none = { { id = "tp_none", text = "Not down here, I'm afraid. Ask upstairs." } },
  },
}

-- Eliza Callen: Brill's leather armor merchant.
P:NPC {
  key = "tir_eliza", id = TODO_NPC("Eliza Callen"), name = "Eliza Callen", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "brisk", "dry" }, values = { "practical", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "She judges every customer by the state of their boots.",
    third = "{name} met Eliza Callen, who sells leather armor in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and your boots are holding up. That's my leather, and that's the best compliment you could pay me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again, and in the same scuffed boots. Buy what you need, and don't make me look at them too long." },
    { id = "g_default", text = "Leather, cured and stitched. It won't stop a Crusader's sword, but it'll make him work for it." },
    { id = "g_rogue", when = { class = { "ROGUE", "HUNTER", "DRUID", "SHAMAN" } }, text = "You've the look of someone who'd rather move than stand and be hit. Good; I sell to people like you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I can see how the last lot has been treating you. Turn about and let me look at the seams." },
    { id = "g_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "You'll want Abe Winters for mail, {class}, but stay a moment anyway. Even a soldier needs a decent belt and a pair of boots that don't squeak." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's falling off you, and I don't mean that as a joke about Forsaken. Buy something before something buys you." },
    { id = "n_skinner", cat = "profession", when = { profession = "Skinning" },
      text = "That's a skinning knife on your belt, and it has seen use. I buy nothing myself, but Rand Rhobart out east of town will tell you what a clean hide ought to look like." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll need a bigger cut than anything on my rack, and room for the breathing. I can find you a belt that fits, at least." },
  },

  start = "hello",
  nodes = {
    w3_mend = {
      lines = {
        { id = "w3_mend_1", text = "When it's worth mending, which most of it isn't by the time it reaches me. There's a Deathguard whose belt I've restitched three times, because it was his father's, and I've told him the fourth time it goes in the brazier and he'll have to grieve like the rest of us." },
      },
      choices = {
        { text = "Would you really burn it?", next = "w3_burn" },
        { text = "Some things are worth mending forever.", next = "BACK", reply = "Then bring me those things and a full purse, and I'll mend them forever. That's what I'm here for." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_burn = {
      lines = {
        { id = "w3_burn_1", text = "No, and he knows it, and I know he knows it. I'll stitch it a fourth time and complain the whole while, and he'll pay me double and pretend not to notice that I've lined it with new leather." },
      },
      choices = {
        { text = "That's kind of you, Eliza. Something else.", next = "BACK" },
      },
    },
    boots = {
      lines = { { id = "bo_default", text = "I do, because boots tell the truth. A purse can be borrowed and a sword can be stolen, but nobody walks in from the Glades with good soles unless they've had the sense to look after themselves." } },
      choices = {
        { text = "A leatherworker should tell you plainly what her armour can stop.", next = "BACK", reply = "I do. It won't stop a Crusader's sword, but it'll make him work for it, and that's the truth.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Swear the leather turns steel. The buyer won't know until it's too late.", next = "BACK", reply = "And then he's dead twice over and I'm a liar. No, I'll not sell my work that way.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "And what do mine say?", next = "boots2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boots2 = {
      lines = {
        { id = "bo2_default", text = "They say you've walked a long road on a short purse, which is the usual story in Brill. They'll last you to the Undercity and no further, so think about a new pair before you go south." },
        { id = "bo2_green", when = { maxLevel = 6 }, text = "They say you were buried in them, and that whoever dressed you for the grave wasn't expecting you to walk anywhere. They won't last you to the Crusader's tower and back, so think about a new pair." },
        { id = "bo2_high", when = { minLevel = 20 }, text = "They say you've been a great deal further than Brill and that somebody better than me made them. I've nothing on the rack to match those, and I'm honest enough to tell you so." },
      },
      choices = {
        { text = "I'll take that as fair warning.", next = "BACK" },
        { text = "Show me a pair, then.", next = "BUSINESS" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "Shelene Rhobart teaches the craft at her place east of town, and her husband Rand does the skinning. I don't make much myself any more, since my fingers aren't what they were, so I buy from the Rhobarts' pupils and mend what needs it." } },
      choices = {
        { text = "The dead lose their fingers' skill?", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = { { id = "tr2_default", text = "Some of it, and nobody warns you. I can still set a rivet and judge a hide across the room, but fine stitching wants a steadiness I left in the ground, so I leave the fancy work to hands that came back in better order." } },
      choices = {
        { text = "You judge a hide well enough to run a shop.", next = "BACK", reply = "I do, and I'll not be pitied for the rest. Half this town is missing something, and most of them lost more than a neat stitch." },
        { text = "Something else, Eliza.", next = "BACK" },
      },
    },
    skinner = {
      lines = { { id = "sk_default", text = "Then cut wide of the belly and don't hack at the legs, because every skinner in the Glades ruins the first dozen darkhounds that way. A clean hide makes a jerkin and a torn one makes bootlaces, and I've more bootlaces than Brill will ever need." } },
      choices = {
        { text = "I'll mind the legs.", next = "BACK", reply = "See that you do, and take the hides to Shelene. She pays attention to who brings her good ones." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Eliza Callen, leather armor. I've jerkins, boots, gloves and belts, and they're as good as anything you'll find short of the Undercity, and cheaper." },
        { id = "h_leather", when = { class = { "ROGUE", "HUNTER", "DRUID", "SHAMAN" } }, text = "Eliza Callen, leather armor. Everything on this rack bends where you bend, {class}, which you'll be glad of the first time you need to leave somewhere in a hurry." },
      },
      again = {
        { id = "h_again", text = "Anything else? Or are you buying?" },
        { id = "h_again2", text = "Go on. I'm listening, and measuring you while I do." },
        { id = "h_again3", text = "What else? I can talk while I stitch, but the stitching comes first." },
      },
      choices = {
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "Where does the leather come from?", next = "hides" },
        { text = "Do the newly risen buy much?", next = "risen" },
        { text = "You judge a customer by the boots, I'm told.", next = "boots" },
        { text = "Who else in Brill works leather?", next = "trade" },
        { text = "I skin my own kills, Eliza.", next = "skinner", when = { profession = "Skinning" } },
        { text = "Do you mend old leather as well?", next = "w3_mend" },
        { text = "Not today.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "h2_default", text = "Wolves and boars from the Glades, mostly, and whatever the Deathguard drag back from the Crusade's farms. A hide doesn't care who skinned it, and nor do I." } },
      choices = {
        { text = "Even Crusade horses?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      big = true,
      lines = { { id = "h3_default", text = "Once or twice, and it made fine saddle leather. Some of my customers think that's a crime, and some think it's the funniest thing they've heard all year. Which are you?" } },
      choices = {
        { text = "Waste nothing. The Crusade would do the same to us.", next = "BACK", reply = "They'd burn us rather than wear us, but I take your point. Waste not.", fx = { align = { light = -1 } } },
        { text = "The horses did nothing wrong. Leave them be.", next = "BACK", reply = "A tender heart in Brill! Keep it, if you can; most of us lost ours in the ground.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    risen = {
      lines = { { id = "r_default", text = "They come up from Deathknell in whatever they were buried in, which is never armor. I sell them a pair of boots first, because the road from the graveyard is long and their feet are in a dreadful state." } },
      choices = {
        { text = "Practical of you.", next = "BACK" },
        { text = "Something else, Eliza.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They wear good leather under all that red, I'll say that for them. The Deathguard bring me their belts now and then, and I take the buckles off before I sell them on." } },
    trade = { { id = "tp_trade", text = "Brill is a market town that lost its market and kept its shopkeepers. We sell to the newly risen on their way through, and that's a steadier trade than you'd think." } },
    advice = { { id = "tp_ad", text = "Oil your leather before it cracks and not after. If you want to learn the making of it, go to Shelene Rhobart east of town, because I only sell the finished article." } },
    _none = { { id = "tp_none", text = "I sell leather, not answers. Try the inn." } },
  },
}

-- Oliver Dwor: Brill's apprentice weaponsmith.
P:NPC {
  key = "tir_oliver", id = TODO_NPC("Oliver Dwor"), name = "Oliver Dwor", title = "Apprentice Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "earnest", "dry" }, values = { "craft", "ambitious" },
  notices = { "class" },
  impression = {
    first = "He says being dead has given him plenty of time to practise.",
    third = "{name} met Oliver Dwor, the apprentice weaponsmith in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and holding that blade like you mean it. Come and pick something heavier; you've earned it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The weapons are on the rack, and they're honestly made, so pick one and let me be." },
    { id = "g_default", text = "Swords, axes, maces and staves. Plain work, honestly made, and none of it will snap on you." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You hold yourself like someone who swings for a living. Come and pick something heavy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me see the edge on that before you say anything, because I can tell a lot from how a customer has kept it." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Daggers are on the left, {class}, and I've sharpened every one of them myself. Marion Call sends her pupils to me, so I know what you're after." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A caster, eh? I've a staff or two, and a dagger for when the spells run out. They always run out." },
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "You've got forge burns on your hands, the same as mine. There's nobody left in Brill to teach me, so if you learned anything clever in the Undercity, I'd be glad to hear it." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That weapon's been chewed half through, and I wouldn't trust it for another fight. I can sell you something sound for less than it'll cost you to carry that one about." },
  },

  start = "hello",
  nodes = {
    w3_master = {
      lines = {
        { id = "w3_master_1", text = "He'd swear at the temper of every blade and then hang one on the wall without telling me, which is what he did with the first knife I ever made. I keep a half-finished sword of his under the bench, and I've never had the nerve to finish it." },
      },
      choices = {
        { text = "Why not finish it?", next = "w3_finish" },
        { text = "He'd be proud of you, I think.", next = "BACK", reply = "Maybe. He'd never have said so, though, and I'd not know what to do if he had." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_finish = {
      lines = {
        { id = "w3_finish_1", text = "Because whatever I did to it, it would become mine, and then there'd be nothing left in Brill that was his. One day, when I'm good enough, I'll finish it properly, and I'll hang it on the wall without telling anyone." },
      },
      choices = {
        { text = "That's fitting. Something else.", next = "BACK" },
      },
    },
    ambition = {
      lines = { { id = "am_default", text = "I do, and I don't see why not. A living smith gets forty good years at the anvil if his back holds, and I've got as long as my arms stay on, so all I need is somebody to show me what I'm doing wrong." } },
      choices = {
        { text = "A smith should never sell a blade he knows will snap.", next = "BACK", reply = "Never. None of mine will snap on you, and I've had plenty of time since dying to make sure of it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If it lasts one fight, it's done its job. Sell the cheap ones.", next = "BACK", reply = "One fight's the one that kills you, if the blade breaks. I'll keep selling the honest ones.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where would you find a teacher now?", next = "ambition2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambition2 = {
      big = true,
      lines = { { id = "am2_default", text = "The Undercity has proper smiths in the War Quarter, and they'd take me if I asked. But then Brill would have nobody selling blades to the newly risen, and I can't decide whether staying is loyalty or only being afraid to go." } },
      choices = {
        { text = "Stay. The risen need you more than you need a title.", next = "BACK", reply = "That's what I tell myself at the anvil, and it's good to hear it from outside my own head. I'll stay a while yet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Go and learn. Brill will find another shopkeeper.", next = "BACK", reply = "It would, wouldn't it? Nobody's so needed as he thinks. I'll ask the next courier what the War Quarter's like.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    custom = {
      lines = { { id = "cu_default", text = "Swords for the ones who were soldiers, and maces for the ones who weren't, because any fool can hit a thing with a mace. The Deathguard come to me for an edge when the Executor's own grinder is busy, and I count that as a compliment." } },
      choices = {
        { text = "And the neighbours? Do they send you trade?", next = "custom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    custom2 = {
      lines = { { id = "cu2_default", text = "Abe Winters does, since he sells the armor and I sell what goes through it, and we've agreed not to think too hard about that. Mrs. Winters sends people to both of us, whether they asked her or not." } },
      choices = {
        { text = "A town that looks after its own.", next = "BACK", reply = "It has to. There's nobody else going to look after a town full of corpses, is there?" },
        { text = "Something else, Oliver.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "sh_default", text = "Then tell me this, because it's been bothering me for a month. My blades come out of the quench with a twist near the tip, about one in five, and I've tried heating slower and I've tried heating faster." } },
      choices = {
        { text = "Quench it point down, and straight.", next = "BACK", reply = "Point down! He used to say that, I can hear him saying it. Thank you, {name}, I'd lost that one entirely.", fx = { affinity = 2 } },
        { text = "I'm no further along than you are.", next = "BACK", reply = "Then we're two apprentices with no master between us. Come back when one of us has worked it out." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Oliver Dwor, apprentice weaponsmith. Apprentice to whom, you ask? Nobody now, since my master didn't come back, so I suppose I'm apprenticed to the work itself." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Oliver Dwor, apprentice weaponsmith, and it's good to meet someone else who works a forge. My master didn't come back from the Plague, so I'm apprenticed to the work itself and to anyone who'll talk shop with me." },
      },
      again = {
        { id = "h_again", text = "More? Go on, then, but I've a blade on the wheel that wants its edge before the next patrol." },
        { id = "h_again2", text = "Go on. I can talk and file, though the file's louder." },
        { id = "h_again3", text = "What else can I tell you? Ask me while this cools." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What happened to your master?", next = "master" },
        { text = "Plain work is all most of us need.", next = "plain" },
        { text = "You mean to be a master one day.", next = "ambition" },
        { text = "What do people in Brill ask you for most?", next = "custom" },
        { text = "I work a forge myself, Oliver.", next = "shop", when = { profession = "Blacksmithing" } },
        { text = "What would your master make of your work?", next = "w3_master" },
        { text = "Not today.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "He died in the Plague, same as me, but he stayed dead, which I suppose was his choice in the end. I kept his files and his hammer, and I've been teaching myself from what I remember." } },
      choices = {
        { text = "Do you remember much?", next = "master2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master2 = {
      big = true,
      lines = { { id = "m2_default", text = "His hands, mostly, and the way he swore at a bad temper. I can't remember his face at all. Do you think that's a mercy, {class}, or a theft?" } },
      choices = {
        { text = "A mercy. Faces only haunt you.", next = "BACK", reply = "That's what I tell myself, most days. The hands are enough to work by.", fx = { align = { light = -1 } } },
        { text = "A theft. Hold on to whatever you can.", next = "BACK", reply = "Then I'll keep trying. Maybe it'll come back while I'm at the anvil; things do, sometimes.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = { { id = "p_default", text = "It is, and that's what I tell the newly risen who want something with a skull on the pommel. A skull won't help you against a Scarlet Crusader; a good edge will." } },
      choices = {
        { text = "I'll take the good edge.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Their swords are well made, I'll admit, better than mine. I've taken a few apart to see how the tang's set, and I'm learning from them whether they like it or not." } },
    trade = { { id = "tp_trade", text = "Brill's a good town for a smith who's still learning, because the customers are all beginners too and nobody minds plain work. There's no smithing trainer nearer than the Undercity, more's the pity." } },
    advice = { { id = "tp_ad", text = "Wipe the blade before you sheathe it, every time. Nothing in the Glades bleeds anything that's good for steel." } },
    lordaeron = { { id = "tp_lord", text = "My master made swords for the garrison at the capital, and they wore his mark on parade. I've one of them still, and I don't sell it." } },
    _none = { { id = "tp_none", text = "Couldn't say. If it isn't steel, I don't know much about it." } },
  },
}

-- Hamlin Atkins: wandering mushroom farmer who sells fungus around Brill.
P:NPC {
  key = "tir_hamlin", id = TODO_NPC("Hamlin Atkins"), name = "Hamlin Atkins", title = "Mushroom Farmer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "cheerful", "rambling" }, values = { "craft", "community" },
  notices = { "race" },
  impression = {
    first = "His mushrooms like the dark as much as he now does.",
    third = "{name} met Hamlin Atkins, who grows and sells mushrooms around Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back for more! I knew you had the taste for them, and the cellar's been very good to me this week." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The mushrooms are in the basket, and you can choose your own, since you're so particular." },
    { id = "g_default", text = "Mushrooms! Fresh from the cellar, or as fresh as anything in Brill gets." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you had the taste for them." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A customer with a working stomach! Come here, friend, I've mushrooms in this basket that would be wasted on the rest of Brill." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll want the ones from the left side of the basket, friend; the right side is for those of us who don't digest any more." },
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You've got the stained fingers of somebody who picks things. Faruza's the one for herbs here in Brill, but if you ever find a good patch of cave mould, you come and tell old Hamlin first." },
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "Is that a cook's knife? Then you'll know that a mushroom wants butter and a hot pan and very little else, and you'd be amazed how few people in this town remember that." },
  },

  start = "hello",
  nodes = {
    w3_tasty = {
      lines = {
        { id = "w3_tasty_1", text = "The brown caps, friend, fried in a little fat, which is what my old neighbours swore by, though I can't taste a thing now and have to take their word. The pale ones are better for broth, and the ones with the purple gills are for the apothecaries and nobody else." },
        { id = "w3_tasty_2", when = { race = { "Orc", "Troll", "Tauren" } }, text = "For you, the brown caps, fried quick in fat, and tell me afterwards what they taste of, because I've not tasted one since I died. The purple-gilled ones are for the apothecaries, mind, so leave those in the basket." },
      },
      choices = {
        { text = "What happens if I eat a purple one?", next = "w3_purple" },
        { text = "I'll try the brown ones.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_purple = {
      lines = {
        { id = "w3_purple_1", text = "I'm not entirely sure, which is why I don't sell them to anybody but the apothecaries. One of the orcs from the zeppelin ate one for a wager and sang to the Brill windmill for an hour, and he seemed to enjoy it." },
      },
      choices = {
        { text = "I'll stick to the brown. Something else.", next = "BACK" },
      },
    },
    barley = {
      lines = { { id = "ba_default", text = "I did, on a good piece of land that drained well and caught the morning sun. It's all grey stubble now, and the last time I walked out to look at it there were duskbats roosting in what's left of my barn." } },
      choices = {
        { text = "A farmer should say plainly which mushrooms will kill the living.", next = "BACK", reply = "I do, every time. The Warchief's folk are our allies, and I'll not poison them by accident.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let the living learn which ones are poison. It's not your concern.", next = "BACK", reply = "It's my concern when the Deathguard come asking why an orc fell over in the square. I'll warn them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Would you go back, if the soil healed?", next = "barley2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barley2 = {
      lines = { { id = "ba2_default", text = "In a heartbeat, if I had one. But the soil won't heal in any time that matters, friend, and I'd be growing barley for a town that can't taste beer, so I've made my peace with the cellar." } },
      choices = {
        { text = "You've made the best of a bad harvest.", next = "BACK", reply = "That's all farming ever was, even in the good years. You plant, and then you make the best of whatever comes up.", fx = { affinity = 1 } },
        { text = "Something else, Hamlin.", next = "BACK" },
      },
    },
    cellar = {
      lines = { { id = "ce_default", text = "It's under a house on the north side that nobody came back to claim. It's damp and black as a grave down there, which is perfect, and I've got beds of spongy caps along one wall and the long pale ones along the other." } },
      choices = {
        { text = "Does anything trouble the crop?", next = "cellar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar2 = {
      lines = { { id = "ce2_default", text = "Rats, and one apothecary's assistant who keeps coming by to ask if anything down there glows. I told him that if it glowed I wouldn't be selling it for eating, and he looked so disappointed that I nearly felt sorry for him." } },
      choices = {
        { text = "Keep the glowing ones away from the basket.", next = "BACK", reply = "Oh, I do, friend, I do. Mostly. You'd know by now if I hadn't." },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      big = true,
      lines = { { id = "fa_default", text = "They do, and I knew some of them by name. They're the ones who wouldn't leave their land and wouldn't join the Crusade, and now the Deathguard are sent out to cut them down as if they were Scourge, which I've never been easy about." } },
      choices = {
        { text = "They'd turn us in to the Crusade. It has to be done.", next = "BACK", reply = "I expect you're right, and the Executor says the same. It doesn't sit any easier, though, when you've shared a harvest supper with a man.", fx = { align = { light = -1 } } },
        { text = "They're only farmers. Someone should leave them be.", next = "BACK", reply = "That's what I think, though I'd not say it near Zygand. A man who stays with his field isn't anybody's enemy, to my mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hamlin Atkins, mushroom farmer. I used to grow barley out past the Brightwater, and now I grow mushrooms in a cellar, and if you ask me, the mushrooms are better company." },
        { id = "h_back", when = { metBefore = true }, text = "Hamlin Atkins, with the mushrooms, as ever. I've been round the town twice already this morning, and the basket's a good deal lighter than when I started." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Hamlin Atkins, mushroom farmer, and you're just the sort of customer I grow them for. I used to raise barley out past the Brightwater, and now it's mushrooms in a cellar, and they're better company." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the basket." },
        { id = "h_again2", text = "Go on; I'm only walking in circles anyway." },
        { id = "h_again3", text = "What else, friend? I can stand still for a minute; the mushrooms won't mind." },
      },
      choices = {
        { text = "Let me see the basket.", next = "BUSINESS" },
        { text = "Why mushrooms?", next = "why" },
        { text = "You wander a lot for a farmer.", next = "wander" },
        { text = "You farmed barley out past Brightwater, you said.", next = "barley" },
        { text = "Tell me about this cellar of yours.", next = "cellar" },
        { text = "Half the farms out there still have farmers on them.", next = "farmers", when = { minLevel = 5 } },
        { text = "Which of these would a living person enjoy most?", next = "w3_tasty" },
        { text = "Not today.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nothing else will grow in the Glades now, not properly. The soil's been sour since the Plague, and the only things that thrive in it are fungus and apothecaries." } },
      choices = {
        { text = "Do the apothecaries buy from you?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some of them, for things I'd rather not know about. I sell to whoever asks, mind, but I'd sooner my mushrooms were eaten than boiled down for whatever they brew in the Undercity. What do you think, should a farmer care where his crop goes?" } },
      choices = {
        { text = "A crop's a crop. Sell to whoever pays.", next = "BACK", reply = "That's what my father would've said, and he never lost a harvest to fussiness. Still, I wonder.", fx = { align = { honor = -1 } } },
        { text = "Yes. A farmer answers for his harvest.", next = "BACK", reply = "Thank you! I'll sell the apothecaries the small ones, then, and keep the good ones for eating.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wander = {
      lines = { { id = "wa_default", text = "Farmers stay put when there's a field to mind, but a basket goes where the hungry are. I walk Brill from the stables to the graveyard and back, and somebody always wants a mushroom." } },
      choices = {
        { text = "Even in the graveyard?", next = "BACK", reply = "Especially there. Mourners get peckish, and the Forsaken are always mourning something." },
        { text = "Something else, Hamlin.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They burn any farm that shelters one of us, and they use the family's own lamp oil to do it. I don't go west of town with the basket any more." } },
    lordaeron = { { id = "tp_lord", text = "It was good barley country, friend, the best north of the lake, and the harvest suppers went on for three days. I try to remember the suppers and not what came after." } },
    advice = { { id = "tp_ad", text = "Butter, a hot pan, and a pinch of salt if you can find any. Renee at the Gallows' End does them properly for her living guests, and she buys from me." } },
    forsaken = { { id = "tp_forsaken", text = "We're a bit like my crop, friend, when you think on it. We came up in the dark out of something dead, and we're doing better than anyone expected." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me about mushrooms." } },
  },
}

-- Blacksmith Rand: Deathknell's apprentice armorer.
P:NPC {
  key = "tir_rand", id = TODO_NPC("Blacksmith Rand"), name = "Blacksmith Rand", title = "Apprentice Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "gruff", "steady" }, values = { "craft", "practical" },
  notices = { "greenness", "kit" },
  impression = {
    first = "He has armored a hundred of the newly risen and expects more.",
    third = "{name} met Blacksmith Rand, who sells armor to the newly risen in Deathknell.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Still in one piece? Good, and that mail's held up nicely. Come and let me take a look at the rivets." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Still in one piece, mostly, and that's all the conversation you'll get from me today." },
    { id = "g_default", text = "Fresh from the grave and wearing a shroud. Let's get some mail on you before the Crusade sees you like that." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece? Good. Mostly good." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You're one of Dannal Stern's, by the look of you. He drills them and I dress them, so stand still and let me see what size you've come back as." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You're still stiff from the ground, I can tell. Armor will feel heavy for a while; that passes." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That's been bitten through in three places. The Rattlecages go for the joints, so bring it here before one of them finds the gap." },
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You want cloth, and I don't sell it. Archibald Kava has robes across the way, though I'll tell you now that a robe has never once stopped a sword." },
  },

  start = "hello",
  nodes = {
    w3_dannal = {
      lines = {
        { id = "w3_dannal_1", text = "The warrior trainer at Deathknell, who takes the newly risen and teaches them which end of the sword to hold. He sends them to me afterwards, still blinking, and I fit them out while they ask me whether it's normal to have forgotten their own names." },
        { id = "w3_dannal_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "Your trainer, if I've read you right, and he'll have taught you which end of a sword to hold before he sent you here. He's hard on his pupils, and fair, and his are the only ones whose armour I don't have to refit twice." },
      },
      choices = {
        { text = "What do you tell them, about the names?", next = "w3_names" },
        { text = "He sounds a good teacher.", next = "BACK", reply = "He is, and don't tell him I said so. We've an understanding, and it relies on neither of us praising the other." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_names = {
      lines = {
        { id = "w3_names_1", text = "That it's normal, and that a name's not much use to a man in a fight anyway. Then I stamp a number on the inside of their bracers so I'll know whose armour comes back, and some of them end up going by the number." },
      },
      choices = {
        { text = "That's grim and practical. Something else.", next = "BACK" },
      },
    },
    fitting = {
      lines = { { id = "fi_default", text = "It's awkward more than thankless. Nobody comes back the size they went in, so a man who was fitted for his own mail in life finds it hangs off him like a sack, and I have to tell him why." } },
      choices = {
        { text = "An armourer should never sell mail he knows won't hold.", next = "BACK", reply = "Never. A hundred of the risen have walked out of here in my mail, and none of it's failed them yet.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The newly risen don't know good mail from bad. Sell them the scraps.", next = "BACK", reply = "They don't, but the Crusade's blades do. I'll not send a fresh corpse out in rubbish.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How do they take it?", next = "fitting2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fitting2 = {
      lines = { { id = "fi2_default", text = "Some laugh and some go quiet, and one big fellow sat down on my anvil and didn't speak for an hour. I let him sit, and then I took his straps in four holes and sent him to Executor Arren, and he's a Deathguard in Brill now." } },
      choices = {
        { text = "You did more than fit his armor.", next = "BACK", reply = "I gave him somewhere to sit, that's all. The straps did the rest, because a man feels better in armor that fits him.", fx = { affinity = 1 } },
        { text = "Something else, Rand.", next = "BACK" },
      },
    },
    shops = {
      lines = { { id = "sh_default", text = "Harold Raims sells the weapons, and he's an apprentice the same as I am. Archibald Kava has cloth and leather, and Joshua Kien keeps the general goods, so between the four of us nobody leaves Deathknell naked or empty-handed." } },
      choices = {
        { text = "Two apprentices, and no master smith?", next = "shops2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shops2 = {
      lines = { { id = "sh2_default", text = "The masters are in the Undercity, where the Dark Lady needs them. Deathknell gets the ones who are still learning, and that's fair enough, because the customers here are still learning how to walk." } },
      choices = {
        { text = "Then everyone in this village is a beginner.", next = "BACK", reply = "Every one of us, and that's the best thing about the place. Nobody here can look down on anybody." },
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = { { id = "pl_default", text = "Some of it, by the weight and the gilding. I've pulled the Silver Hand's mark off a breastplate before now and found the Crusade's flame stamped over it, so they were melting down their own past long before I got to it." } },
      choices = {
        { text = "Then the plate deserved a better end than theirs.", next = "BACK", reply = "It's getting one. Whatever it was sworn to before, it keeps a Forsaken on their feet now, and I'd call that honest work." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Blacksmith Rand. I sell armor to the risen of Deathknell, which means I sell a great deal of very simple armor to people who don't yet know which end of a gauntlet goes on first." },
        { id = "h_back", when = { metBefore = true }, text = "Blacksmith Rand, same as before. Let me see how that last piece is holding, because I like to know which of my rivets came back." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Blacksmith Rand. I don't get many living customers, and nothing on my bench was cut for a frame like yours, but I can let out a strap or two if you're stuck." },
      },
      again = {
        { id = "h_again", text = "Something else? There's a line behind you, or there will be." },
        { id = "h_again2", text = "Go on, and stand still while you talk, or I'll fit you crooked." },
        { id = "h_again3", text = "What else? Ask quick, the iron's hot." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Where do you get the metal out here?", next = "metal" },
        { text = "I don't think armor suits me.", next = "suits" },
        { text = "Fitting the newly risen must be thankless work.", next = "fitting" },
        { text = "Who else keeps shop in Deathknell?", next = "shops" },
        { text = "Was any of this Scarlet iron once paladin's plate?", next = "plate", when = { class = "PALADIN" } },
        { text = "Who's this Dannal Stern?", next = "w3_dannal" },
        { text = "Not now.", next = "END" },
      },
    },
    metal = {
      lines = { { id = "me_default", text = "The Undercity sends some by cart, and the rest I pull out of Scarlet scrap the Deathguard bring in. Melted down, a Crusader's helm makes a fine pair of greaves for a Forsaken." } },
      choices = {
        { text = "There's justice in that.", next = "metal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    metal2 = {
      big = true,
      lines = { { id = "me2_default", text = "There's iron in it, which is what I care about. But I'll admit I enjoy the hammering more when I know whose helm it was. Is that wrong of me, {class}?" } },
      choices = {
        { text = "Not at all. Let them arm the people they burn.", next = "BACK", reply = "That's how I see it. Every Crusader helm I melt is one more of us who walks out of here protected.", fx = { align = { light = -1 } } },
        { text = "Iron is iron. Hate makes for bad work.", next = "BACK", reply = "Maybe it does. I'll try hammering calmer, and we'll see if the greaves come out any straighter.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suits = {
      lines = { { id = "s_default", text = "Then take a pair of bracers at least, because nobody thinks armor suits them until an arrow finds the bit that wasn't covered. I've seen the Crusade's archers, and they aren't fussy." } },
      choices = {
        { text = "Bracers it is, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They camp south of the village and they make good scrap. I'd rather have them as iron than as neighbours." } },
    forsaken = { { id = "tp_forsaken", text = "Every one of us in Deathknell is a beginner at being dead. Executor Arren runs the place, and the rest of us get the newly risen dressed and armed and out of the gate." } },
    advice = { { id = "tp_ad", text = "Check your straps after every fight, because you won't feel it when one goes. The Rattlecages always find the piece that's hanging loose." } },
    lordaeron = { { id = "tp_lord", text = "Deathknell had a smith before me, a real one, and his mark's still stamped on the anvil. I work over it every day and I've never felt entitled to file it off." } },
    _none = { { id = "tp_none", text = "I hammer metal, not questions. Ask Mordo or the Shadow Priest." } },
  },
}

-- Abe Winters: Brill's apprentice armorer; married to Mrs. Winters of the general goods.
P:NPC {
  key = "tir_abe", id = TODO_NPC("Abe Winters"), name = "Abe Winters", title = "Apprentice Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "mild", "dry" }, values = { "family", "craft" },
  notices = { "kit" },
  impression = {
    first = "He speaks of Mrs. Winters with a fondness that surprises even him.",
    third = "{name} met Abe Winters, who sells armor in Brill and is married to Mrs. Winters of the general store.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! Did my wife send you? Never mind, I'm glad she did. Come and see the new mail." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. My wife sent you, I suppose, though I can't think why. Buy something and go." },
    { id = "g_default", text = "Mail and plate, made in Brill. Nothing fancy, but it'll keep your insides in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did my wife send you? She sends everyone." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "Now here's someone who'll actually wear what I sell. Come and try the weight of this, {class}, and tell me honestly if the shoulders sit right." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's more holes than metal. Let me show you something with fewer holes." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "You've only just come up the road from Deathknell, haven't you? Rand will have fitted you with the basics down there, and I can do the next size up when you're ready." },
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "You've a smith's hands, and steadier ones than mine. Have a look at my rivets and don't spare my feelings, because I'd rather hear it from you than from a customer." },
  },

  start = "hello",
  nodes = {
    w3_missus = {
      lines = {
        { id = "w3_missus_1", text = "Every noon, with a bowl of her pumpkin stew, which neither of us can taste and both of us pretend to enjoy. We sit on the bench out front and look at the street, and she tells me who's bought what, and I nod, and that's the best hour of my day." },
      },
      choices = {
        { text = "That sounds like a marriage to me.", next = "BACK", reply = "It's the only kind we've got, and I've decided it's a good one." },
        { text = "Who eats the stew, then?", next = "w3_stew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_stew = {
      lines = {
        { id = "w3_stew_1", text = "The orc who sweeps the zeppelin platform, mostly, who's taken to coming by at half past noon. The missus says it's a shame to waste good food, and the orc says it's the best thing he's eaten in Lordaeron, which I believe, since it's the only thing." },
      },
      choices = {
        { text = "Then nothing goes to waste. Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "be_default", text = "A clerk, if you can credit it. I kept the tally books for the grain merchants in this very town, and I could tell you the price of a bushel in any month of the last ten years I was breathing." } },
      choices = {
        { text = "A man should keep his word to his wife, even after death.", next = "BACK", reply = "I keep mine to her every day. Death didn't change that, and I'd not let it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Death ends every vow. Nobody holds the dead to their old promises.", next = "BACK", reply = "Maybe not, but I hold myself to them, and Mrs. Winters would never let me forget otherwise.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "That's a long way from an anvil.", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = { { id = "be2_default", text = "It is, and my arms told me so for the first month. But there's no grain in Tirisfal now and nobody to tally it for, and a suit of mail is a thing you can hold up at the end of the day and say that you made it." } },
      choices = {
        { text = "The anvil suits you better than the ledger did.", next = "BACK", reply = "Do you know, I think it does. Don't tell the missus I said so, because she liked being married to a clerk.", fx = { affinity = 1 } },
        { text = "Something else, Abe.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "ta_default", text = "An armorer came up from the Undercity for one season to get me started, and then the Dark Lady's army wanted him back. Since then it's been trial and error, and Oliver Dwor across the way, who's as much an apprentice as I am." } },
      choices = {
        { text = "Two apprentices teaching each other.", next = "taught2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught2 = {
      lines = { { id = "ta2_default", text = "It sounds worse than it is. He hits my armor with his swords and I tell him where his swords bent, and we've both improved a good deal. Blacksmith Rand down in Deathknell sends me a note now and then, when he's found a better way to set a strap." } },
      choices = {
        { text = "That's a sensible way to learn.", next = "BACK", reply = "It's the only way we've got, so it had better be sensible." },
        { text = "Something else.", next = "BACK" },
      },
    },
    street = {
      lines = { { id = "st_default", text = "We do, because nobody else is going to. Eliza Callen has the leather, Abigail Shiel has the trade goods, the missus has everything else, and Selina Weston keeps the alchemists supplied, so there's hardly a need in Brill that one of us can't meet." } },
      choices = {
        { text = "And all of you died here and came back to work.", next = "BACK", reply = "Put like that it sounds grim, doesn't it? I prefer to say we never let a little thing like the Plague close the shop." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivets = {
      lines = { { id = "ri_default", text = "There, along the shoulder. I peen them cold because I'm afraid of spoiling the plate, and I know a proper smith would do it hot, but I've ruined three pauldrons finding out how hot is too hot." } },
      choices = {
        { text = "Cold is honest work. They'll hold.", next = "BACK", reply = "That's a weight off, coming from someone who knows. I'll stop lying awake over it, or I would if I slept.", fx = { affinity = 1 } },
        { text = "Heat them, Abe. A dull red and no more.", next = "BACK", reply = "A dull red. I'll try it on the next piece, and if I spoil a fourth pauldron I'll know who to blame." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Abe Winters, armorer, or apprentice armorer, if you're going by the sign. The missus keeps the general goods across the way, and between the two of us we can clothe and feed half the town." },
        { id = "h_sent", when = { heardLine = "tir_winters.h_default" }, text = "Abe Winters, armorer. You've been to see the missus already, I can tell, because you have the look of someone who's been told where to shop next." },
        { id = "h_back", when = { metBefore = true }, text = "Abe Winters, still an apprentice and still polishing. What can I do for you this time?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've armour to polish and a stew to look forward to." },
        { id = "h_again2", text = "Go on, I'm only polishing." },
        { id = "h_again3", text = "What else can I tell you? Ask away, the rust will wait." },
        { id = "h_again4", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Anything more? I can't sell you much, but talk costs nothing." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You and Mrs. Winters are married?", next = "wife" },
        { text = "Apprentice? You look old enough to be a master.", next = "apprentice" },
        { text = "What were you, before you were a smith?", next = "before" },
        { text = "Who taught you, if not a master?", next = "taught" },
        { text = "Brill's shopkeepers seem to stand together.", next = "street" },
        { text = "I work metal too, Abe. Show me your rivets.", next = "rivets", when = { profession = "Blacksmithing" } },
        { text = "Does Mrs. Winters ever visit the shop?", next = "w3_missus" },
        { text = "Not today.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "w_default", text = "We are, or we were, and we've decided it still counts. Neither of us remembers the wedding properly, so we've agreed it was lovely, and that saves a lot of arguing." } },
      choices = {
        { text = "That's oddly sweet.", next = "wife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some in Brill say it's foolish, the dead keeping house as if nothing had changed. Gretchen Dedmar tells my wife so every week. What do you make of it?" } },
      choices = {
        { text = "Keep house. Whatever holds you together is worth keeping.", next = "BACK", reply = "That's what I tell her. I'll pass your vote along; she'll like having it.", fx = { align = { light = 1 } } },
        { text = "Gretchen's right. That life is over.", next = "BACK", reply = "Maybe it is. But it's a poor sort of afterlife that doesn't let a man keep his wife.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Old enough, aye, but I was no smith before the Plague. When I came back, the Undercity needed armorers more than anything I used to be, so here I am, learning at an age I'd rather not count." } },
      choices = {
        { text = "It's never too late to learn a trade.", next = "BACK", reply = "Not when you've got forever, it isn't. That's one thing the Plague gave us." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "I sold grain to half of them when they were just farmers' sons with a militia badge. It's a sad thing, what fear does to ordinary folk." } },
    lordaeron = { { id = "tp_lord", text = "I've lived in Brill all my life and a little bit after. It's quieter than it was, but the neighbours are the same people, give or take a jawbone." } },
    trade = { { id = "tp_trade", text = "You'll not learn smithing from me, since I'm barely learning it myself. The missus keeps the general goods across the way, and she'll know where to find anything I haven't got." } },
    advice = { { id = "tp_ad", text = "Ask Mrs. Winters, whatever it is. If something's happened in Brill, she knew about it before the person it happened to." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the missus; she hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Missed folk: Deathknell's weaponsmith, three more of Brill's trainers and traders, the
-- fishers on Brightwater Lake, the Rhobarts, and the goblins of the zeppelin tower.
---------------------------------------------------------------------------

-- Harold Raims: Deathknell's apprentice weaponsmith.
P:NPC {
  key = "tir_raims", id = TODO_NPC("Harold Raims"), name = "Harold Raims", title = "Apprentice Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "wry", "patient" }, values = { "craft", "practical" },
  notices = { "greenness", "class", "weary" },
  impression = {
    first = "Harold Raims sells the first weapon most of the newly risen ever hold, and he watches each of them pick one up as though he were laying a small bet. He is wry about it, and more careful than he sounds.",
    third = "{name} met Harold Raims, the apprentice weaponsmith who arms the newly risen of Deathknell.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back again, with all your fingers, and holding that blade better than ever. I'll call that a winning bet." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Pick one up, see how it sits, and then pay for it or put it back, as you like." },
    { id = "g_default", text = "Pick one up and see how it sits in your hand. Nobody in Deathknell knows what they can swing until they've tried." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and you've still got all your fingers. I'll take that as a compliment to the blade." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "You'll be wanting a staff or a dagger, and you'll tell me you don't need either. Take one anyway, because spells run dry and Rattlecages don't." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "Your grip's all thumbs, but that's only the grave in your knuckles. Hold something heavy for an hour a day and it comes back." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That edge has been through bone, and plenty of it. Let me sell you something that hasn't been chewed before you go back out to the fields." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of David Trias's pupils, by the way you looked at the daggers first and the door second. The short ones are on the left." },
  },

  start = "hello",
  nodes = {
    d2_steel = {
      lines = {
        { id = "d2_steel_1", text = "The Undercity sends it out by cart, rough bars from the War Quarter forges, and I draw and grind them here. The carts come along Terrence's road, and if he's in a bad mood they come late, and then I'm selling staves." },
      },
      choices = {
        { text = "Staves aren't much of a weapon.", next = "d2_steel2" },
        { text = "You could ask the miners for ore.", next = "d2_steel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_steel2 = {
      lines = {
        { id = "d2_steel2_1", text = "They're a good weapon in the right hands, and I've seen a mage brain a zombie with one that I sold for a few coppers. Walter Mason teaches mining over by the old church, and his pupils bring me copper that I can at least make knives from." },
      },
      choices = {
        { text = "Copper knives for copper coin.", next = "BACK", reply = "That's the whole of my trade in a sentence. I might paint it over the rack." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_return = {
      lines = {
        { id = "d2_return_1", text = "Somebody does, and it's me. The Deathguard bring back what they find on the road by the Scarlet camps, blades whose owners didn't come home, and I grind the edges fresh and put them back on the rack." },
      },
      choices = {
        { text = "You sell dead men's swords?", next = "d2_return2" },
        { text = "Waste nothing, I suppose.", next = "d2_return2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_return2 = {
      lines = {
        { id = "d2_return2_1", text = "Everyone in this village is a dead man, so I don't see that I've much choice. I do take the names off them, though, if there are any, and I keep the names in a box under the anvil, which Rand thinks is morbid." },
      },
      choices = {
        { text = "What do you do with the names?", next = "d2_return3" },
        { text = "Rand has a point.", next = "BACK", reply = "He usually does. I keep the box anyway." },
      },
    },
    d2_return3 = {
      lines = {
        { id = "d2_return3_1", text = "Nothing yet. I thought one day someone might come asking after a sword, and I'd know whose it was, but nobody's asked, and I'm starting to think nobody will." },
      },
      choices = {
        { text = "Keep the box. Someone may yet.", next = "BACK" },
        { text = "I'll ask you something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Harold Raims, apprentice weaponsmith. I sell swords, maces, daggers and staves to people who were lying in the ground this morning, so you'll understand if I keep the stock simple." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Harold Raims, and you're one of Dannal Stern's, I can tell by the stance. He drills them and I arm them, and between us we get a soldier out of a corpse in about a week." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Harold Raims, weapons. I'll warn you that everything here is made for Forsaken hands, which are lighter than they look, so you may find the grips a little mean for a fist like yours." },
        { id = "h_back", when = { metBefore = true }, text = "Harold Raims, same rack, same anvil. Let me see how the last one's held up before you tell me what you want this time." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a rack to fill before the next lot climbs out." },
        { id = "h_again2", text = "Go on. Asking's free, it's the steel that costs." },
        { id = "h_again3", text = "What else would you like to know? I can talk and sharpen." },
      },
      choices = {
        { text = "Tell the newly risen honestly which blade suits them.", next = "BACK", reply = "I always do, and they're usually right to listen. The wrong blade is a short life.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them the dearest blade, whether it suits them or not.", next = "BACK", reply = "And bet on how long they last with it? No, I'd rather lose a copper than a customer.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what's on the rack.", next = "BUSINESS" },
        { text = "You watch people choose. What do you look for?", next = "choose" },
        { text = "Simple stock, for a village at war.", next = "simple" },
        { text = "Who else works the forge with you?", next = "forge" },
        { text = "What should a new warrior carry, Harold?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Where does your steel come from?", next = "d2_steel" },
        { text = "Someone must clean up the blades that come back.", next = "d2_return" },
        { text = "Not today.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "ch_default", text = "Whether the hand remembers before the head does. A man who was a woodcutter reaches for the axe without knowing why, and a woman who kept a kitchen takes the knife, and I've stopped being surprised by which of them turn out dangerous." } },
      choices = {
        { text = "And the ones whose hands remember nothing?", next = "choose2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose2 = {
      big = true,
      lines = { { id = "ch2_default", text = "I give those a mace, because you can't hold a mace wrong, and I send them to Executor Arren like the rest. Some weeks I wonder whether I ought to, since half of them barely know their own names and I'm putting a weapon in their hands." } },
      choices = {
        { text = "They've a right to defend themselves. Arm them.", next = "BACK", reply = "That's how I settle it, most nights. Nobody asked them if they wanted to wake up, and the least we owe them is a fighting chance.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Arm them all. The Dark Lady needs every hand.", next = "BACK", reply = "That's the Executor's view, and it keeps my rack empty. I only wish the hands knew what they were being spent on.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    simple = {
      lines = { { id = "si_default", text = "Simple is what they can use. The mindless dead in the graveyard and the Rattlecages in the fields don't parry, so nobody here needs a duelling blade, only something that won't bend the third time it hits a skull." } },
      choices = {
        { text = "And against the Scarlet Crusade?", next = "simple2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    simple2 = {
      lines = { { id = "si2_default", text = "Against them you want reach and a clear road home. The Crusaders camped south of the village are trained and armoured, and I tell every customer that a new sword doesn't make a new swordsman, though not many of them hear it." } },
      choices = {
        { text = "I heard it.", next = "BACK", reply = "Then you're ahead of most, and you'll likely be back to buy a second one. That's all the proof I need.", fx = { affinity = 1 } },
        { text = "Something else, Harold.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "Blacksmith Rand, who does the armor, and we share one anvil and a good many arguments about whose turn it is. Archibald Kava has the cloth and leather across the way, and Joshua Kien the general goods, so the four of us outfit the whole graveyard." } },
      choices = {
        { text = "Two apprentices at one anvil. Who's teaching whom?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "fo2_default", text = "Nobody, and that's the joke of it. The masters are all in the Undercity's War Quarter, so Rand and I learn from our mistakes, and there's a pile of them behind the shed that we melt down every month and try again." } },
      choices = {
        { text = "That's still a way of learning.", next = "BACK", reply = "It's the slow way, but we've the time for it. Being dead is good for patience, if nothing else." },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "A sword and a shield until Dannal says otherwise, and he won't say otherwise for a good while. Leave the big two-handers alone for now, because your arms came back weaker than you think and the grave doesn't tell you so." } },
      choices = {
        { text = "Sword and shield, then.", next = "BUSINESS" },
        { text = "I'll remember it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Their steel is better than mine, and I'm not too proud to say so. What the Deathguard bring back from their camp, I study before I melt it." } },
    forsaken = { { id = "tp_forsaken", text = "Everyone who comes to my rack was somebody else a little while ago. I try to sell them something that suits who they are now." } },
    advice = { { id = "tp_ad", text = "Wipe it, oil it, and don't use it to pry open coffins. You'd be amazed how many I get back bent from that." } },
    lordaeron = { { id = "tp_lord", text = "I was a cooper in the old kingdom, I think, because my hands know hoops and staves better than they know blades. Barrels aren't wanted now, so I learned swords." } },
    scourge = { { id = "tp_scourge", text = "The mindless ones in the graveyard are what every customer of mine nearly was. I think of that each time I hand somebody a sword to use on them." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Executor Arren, or anyone who's been above ground longer than I have." } },
  },
}

-- Gina Lang: Brill's second demon trainer, upstairs at the Gallows' End.
P:NPC {
  key = "tir_gina", id = TODO_NPC("Gina Lang"), name = "Gina Lang", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "cool", "amused" }, values = { "control", "knowledge" },
  notices = { "class", "pet", "fel" },
  impression = {
    first = "Gina Lang sells grimoires from an upstairs room of the Gallows' End, and she talks to a customer's demon before she talks to the customer. She seems to find warlocks a good deal more amusing than the things they summon.",
    third = "{name} met Gina Lang, a demon trainer who keeps a room above the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you, and your demon's looking well kept. Close the door behind you, and let me say hello to it properly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Close the door, please, and keep your demon from turning pages it shouldn't." },
    { id = "g_default", text = "Close the door behind you, if you please. The draught turns the pages, and some of these should not be read by accident." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock, and one who climbed the stairs, which already sets you above the ones who stop at Ageron's shelf. Let me see what you've brought with you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I wondered whether you would come back, or whether your servant would come back without you." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is muttering in Eredun under its breath, and none of it is polite. It thinks I can't understand it, and I'd leave it thinking so." },
    { id = "n_void", cat = "pet", when = { class = "WARLOCK", pet = { family = "Voidwalker" } },
      text = "A voidwalker, and it stood in the doorway until you told it to come in. That is a well-kept servant, {class}, and I don't say so often." },
    { id = "n_succ", cat = "pet", when = { class = "WARLOCK", pet = { family = "Succubus" } },
      text = "Your succubus has looked at every man in the taproom on the way up, and at you not once. Mind that, {class}, because she has no need to look at you when she already knows where you are." },
    { id = "n_light", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You are standing as far from my shelf as the room allows. That is sensible of you, and I'm not offended in the least." },
  },

  start = "hello",
  nodes = {
    w3_wake = {
      lines = {
        { id = "w3_wake_1", text = "It whispers, generally, and it whispers to whoever is nearest, which is why I keep a chair between the shelf and the door. Once a grimoire on the binding of a succubus spoke all night to Ageron's cat, and the cat has been insufferable ever since." },
      },
      choices = {
        { text = "What did it tell the cat?", next = "w3_cat" },
        { text = "I'll keep my voice down near the shelf.", next = "BACK", reply = "Do, and keep your hands off it as well. A book that's been woken by a voice can be woken by a finger." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_cat = {
      lines = {
        { id = "w3_cat_1", text = "I've no idea, and the cat won't say, but it walks past me now as though it knows something I don't. Ageron says I'm imagining it, and Ageron has not been looked at by that cat the way I have." },
      },
      choices = {
        { text = "I'd watch that cat. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gina Lang, and I sell the books that teach a bound demon new work. Ageron Kargal does the same downstairs, so you may take it that Brill has more warlocks than its size would suggest." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Gina Lang. You have a servant from the Nether and it knows only what it arrived knowing, so tell me which kind it is, and I shall tell you which of my books it is ready for." },
        { id = "h_back", when = { metBefore = true }, text = "Gina Lang, as before, and the shelf has not changed, though you may have. Tell me what your servant has learned since we last spoke, and what it has refused to." },
      },
      again = {
        { id = "h_again", text = "Was there something more? Speak quietly, because the books on the top shelf are light sleepers." },
        { id = "h_again2", text = "Go on. I have all evening, and so does everything in this room." },
        { id = "h_again3", text = "Ask it, then. I do enjoy a question I haven't heard this week." },
      },
      choices = {
        { text = "A warlock owes his demon the truth about its bargain.", next = "BACK", reply = "You do, and the clever ones remember when you don't. Mine certainly did.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lie to your demon. It's only a tool, and tools don't need truth.", next = "BACK", reply = "Tools don't bite back, either, and demons do. You'll learn that lesson eventually.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your grimoires. I want the hungrier ones.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Two demon trainers, in one small tavern.", next = "two" },
        { text = "You speak to the demon before its master.", next = "speak" },
        { text = "Where do the books come from?", next = "books" },
        { text = "How will I know when my demon is ready for heavier chains?", next = "ready", when = { class = "WARLOCK" } },
        { text = "You keep the succubus books on the top shelf.", next = "succ", when = { class = "WARLOCK", minLevel = 16 } },
        { text = "What happens if a top-shelf book wakes?", next = "w3_wake" },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },

    two = {
      lines = { { id = "tw_default", text = "It is less strange than it sounds. Ageron keeps the common books by the stairs, where a beginner can find them, and I keep the ones a beginner ought not to find, and we send each other customers and have never once agreed about a demon." } },
      choices = {
        { text = "What do you disagree about?", next = "two2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    two2 = {
      big = true,
      lines = { { id = "tw2_default", text = "He holds that a demon is a hound, to be leashed short and never spoken to. I hold that a thing which can hate you can also bargain, and that a servant who has been given something to lose will serve the better for it. You have an opinion, I expect." } },
      choices = {
        { text = "Ageron's right. A leash, and nothing more.", next = "BACK", reply = "Then you will have obedient servants and dull ones. There are worse fates for a warlock, and I have watched most of them.", fx = { align = { order = 1 } } },
        { text = "I'd bargain. A willing servant is a sharper one.", next = "BACK", reply = "So I have found. Only remember that it is bargaining too, and that it has had ten thousand years more practice than you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    speak = {
      narr = "She bends a little toward the space at your heel, as if greeting someone shorter than you.",
      lines = { { id = "sp_default", text = "The demon tells me more. A warlock will say whatever flatters them, but an imp cannot help boasting of every order it has twisted, and a voidwalker's silence has a different weight when it has been ill used." } },
      choices = {
        { text = "And what do the demons of Brill say?", next = "speak2" },
        { text = "What does mine say about me?", next = "speak3", when = { class = "WARLOCK", pet = { type = "Demon" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    speak2 = {
      lines = { { id = "sp2_default", text = "That Rupert Boch's pupils are well drilled and frightened of him, which is as it should be. And that the newly risen make careless masters at first, because a person who has already died once is slow to believe that anything worse can happen." } },
      choices = {
        { text = "Something worse can always happen.", next = "BACK", reply = "It can, and I have a shelf of books describing it. I am glad that one of us did not need to read them to know.", fx = { affinity = 1 } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    speak3 = {
      lines = {
        { id = "sp3_default", text = "That you feed it on time and never thank it, which it finds confusing, and confusion is good for a demon. It thinks you are hiding something, and I should keep it thinking so." },
        { id = "sp3_imp", when = { pet = { family = "Imp" } }, text = "That you are slow, and smell of the grave, and once let it burn a Scarlet's hat off, which it remembers as the finest day of its servitude. On the whole it is a good report, by the standards of imps." },
      },
      choices = {
        { text = "I'll take that as praise.", next = "BACK", reply = "Do. It is the only praise you will ever have from that quarter." },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    succ = {
      lines = { { id = "sc_default", text = "Where a beginner can't reach them, yes. Carendin Halgar will call you to the Undercity for her binding when you're ready, and his blind man Godrick will send you hunting for hearts to lure her through, and I would read every warning in these books before you go." } },
      choices = {
        { text = "What makes her so dangerous?", next = "succ2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    succ2 = {
      big = true,
      lines = { { id = "sc2_default", text = "A voidwalker wants to be left alone and an imp wants to be noticed, but a succubus wants to know what you want, and she will learn it before you do. The Forsaken think we are safe from her because our wants have gone cold, and that is the very thing she enjoys proving wrong. Are you sure of yours?" } },
      choices = {
        { text = "Quite sure. I want nothing she can give.", next = "BACK", reply = "Hold on to that sentence, {class}. She will ask you to repeat it every night for a year.", fx = { align = { light = 1 } } },
        { text = "Let her learn. I'll use whatever she finds.", next = "BACK", reply = "Bold, and possibly clever. I have known one warlock in ten who could manage it, and I have sold the other nine's books twice.", fx = { align = { light = -1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    books = {
      lines = { { id = "bk_default", text = "From the Undercity, for the most part, copied in the Magic Quarter by scribes who are paid not to understand what they write. A few are older, out of private libraries in Lordaeron whose owners were hanged for keeping them, back when there was anyone to do the hanging." } },
      choices = {
        { text = "The kingdom burned such books. Now you sell them.", next = "books2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    books2 = {
      lines = { { id = "bk2_default", text = "The kingdom burned a great many things and was not saved by it. The Dark Lady has no such scruples, so the knowledge is taught in the open by people who know its dangers, which I consider safer than a cellar and a guilty conscience." } },
      choices = {
        { text = "Safer for whom?", next = "BACK", reply = "For the warlock, certainly. For everyone else, I should say it depends upon the warlock, as it always did." },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    ready = {
      lines = {
        { id = "rd_default", text = "When it has stopped testing the orders it already has. A servant that still looks for the gap in every command will find a wider gap in a new one, so bring it back to me when it obeys the old work without that little pause first." },
        { id = "rd_imp", when = { pet = { family = "Imp" } }, text = "With an imp, when it has stopped complaining about the last book and started complaining about being bored. That one of yours is nearly there, by the sound of it, and wants perhaps another week of honest work." },
      },
      choices = {
        { text = "I'll watch for the pause, and punish it.", next = "BACK", reply = "Do. Most never learn to see it, and those are the ones whose demons I end up selling on.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "What I deal in are the Legion's kitchen servants, taken one at a time and bound. Anyone who tells you they understand the masters of the house is selling something worse than a book." } },
    forsaken = { { id = "tp_forsaken", text = "We were bound to a will not our own, and we know exactly what it is like. I find that makes Forsaken warlocks either the kindest masters or the cruellest, and seldom anything between." } },
    advice = { { id = "tp_ad", text = "Give an order once, in words that can only mean one thing. If you find yourself explaining what you meant, you have already lost the argument." } },
    sylvanas = { { id = "tp_syl", text = "The Dark Lady keeps a dreadlord at her right hand, on a leash of her own making. Every warlock in Lordaeron should study how she manages it, and hope she goes on managing." } },
    kirin_tor = { { id = "tp_kirin", text = "They knew all of this and locked it away, and their city fell regardless. I do not find that an argument for locks." } },
    _none = { { id = "tp_none", text = "That is not in any book of mine, and I have read them all, some more than once." } },
  },
}

-- Selina Weston: alchemy and herbalism supplies, by the road north of the Gallows' End.
P:NPC {
  key = "tir_selina", id = TODO_NPC("Selina Weston"), name = "Selina Weston", title = "Alchemy & Herbalism Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "tidy", "tart" }, values = { "orderly", "craft" },
  notices = { "profession", "class", "race" },
  impression = {
    first = "Selina Weston sells vials and herbs from a stall by the road in Brill, with every jar labelled in a small square hand. She has firm views on apothecaries who do not wash their glassware, and she shares them freely.",
    third = "{name} met Selina Weston, who sells alchemy and herbalism supplies by the road in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "An alchemist I like, back again. The leaded vials are where they always are, and the rack is level, for once." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Don't lean on the table, because the rack is balanced, and I'll not rebalance it for you." },
    { id = "g_default", text = "Vials, herbs and clean glass. Please don't lean on the table, because the rack is balanced and I've only just got it level." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Good, then I needn't explain why you want the leaded vials and not the cheap ones." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I hope you rinsed the last lot before you corked them, though I know better than to ask." },
  },

  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You pick your own, I see, and you've wrapped them damp, which is correct. Faruza taught you that, or somebody who learned it from her." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A word of advice, since you still have a stomach. Nothing on this table is for eating, whatever it looks like, and the pale mushrooms least of all." },
    { id = "n_green", cat = "class", when = { maxLevel = 6, race = "Scourge" },
      text = "You're new to Brill, and you're looking at my jars as if one of them might be medicine. None of them will mend what we have, dear, but some will mend a cut." },
  },

  start = "hello",
  nodes = {
    w3_carolai = {
      lines = {
        { id = "w3_carolai_1", text = "Exacting, which I approve of, and impatient, which I don't. She sends her pupils to me with a list, and they come back an hour later to change half of it, because she's looked at what they bought and sighed at them." },
      },
      choices = {
        { text = "Do they ever get it right first time?", next = "w3_right" },
        { text = "Two exacting women in one town.", next = "BACK", reply = "One exacting woman and one impatient one. I'll let you decide which of us is which, but I know my answer." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_right = {
      lines = {
        { id = "w3_right_1", text = "One did, a quiet girl who read the list aloud to me twice before I'd put anything in the basket. Carolai never sighed at her once, and I've told every pupil since to do the same, and none of them ever has." },
      },
      choices = {
        { text = "Reading twice is good advice. Something else.", next = "BACK" },
      },
    },
    dried = {
      lines = { { id = "dr_default", text = "Fresh, always, if you can use it the same day, and almost nobody can. A dried herb gives up a little strength and gains a year on the shelf, and Tirisfal's herbs dry better than most, since they are slow to rot even when you would like them to." } },
      choices = {
        { text = "Every vial should be labelled plainly, cheap or leaded.", next = "BACK", reply = "Yes, and every one of mine is, in my own hand. The apothecaries could stand to learn that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cheap vials as leaded. Few would ever notice the difference.", next = "BACK", reply = "The ones who'd notice are the ones who'd be poisoned. I'll keep my labels honest, thank you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Faruza would say to pick your own.", next = "dried2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dried2 = {
      lines = { { id = "dr2_default", text = "Faruza would, and she is right, for anyone with the patience to walk the fences at dawn. I am here for the ones who haven't, and for the days when the Crusade is on the west road and nobody sensible goes picking at all." } },
      choices = {
        { text = "So you sell the walk they didn't take.", next = "BACK", reply = "Neatly put. I may have it painted on the stall.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Selina Weston, alchemy and herbalism supplies. Carolai Anise teaches the brewing and Faruza teaches the picking, and I sell everything either of their pupils forgot to bring." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "Selina Weston. I've empty vials in three sizes and the common herbs dried or fresh, and if you're one of Carolai's pupils, she's already told you that I don't give credit." },
        { id = "h_herb", when = { profession = "Herbalism" }, text = "Selina Weston. I buy nothing, I'm afraid, so keep what you've picked for your own brewing, but if you've run short of a common leaf between fields, I likely have it dried." },
      },
      again = {
        { id = "h_again", text = "Was there anything else? Mind your sleeve on the rack." },
        { id = "h_again2", text = "Go on, I can label and listen." },
        { id = "h_again3", text = "What else can I tell you? Ask it before the light goes, I've stock to cover." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Every jar is labelled. Even the empty ones.", next = "labels" },
        { text = "Brill seems to run on vials.", next = "vials" },
        { text = "Why keep a stall out by the road?", next = "road" },
        { text = "What sells to a working alchemist, Selina?", next = "working", when = { profession = "Alchemy" } },
        { text = "Dried or fresh, your sign says. Which is better?", next = "dried" },
        { text = "What's Carolai Anise like as a teacher?", next = "w3_carolai" },
        { text = "Not today.", next = "END" },
      },
    },
    labels = {
      lines = { { id = "la_default", text = "Especially the empty ones. An unlabelled vial is how a healing draught ends up in the same crate as something Apothecary Johaan mixed, and I have seen what that mistake does to a person, even a dead one." } },
      choices = {
        { text = "What did it do?", next = "labels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    labels2 = {
      lines = { { id = "la2_default", text = "He drank it thinking it would steady his hands, and it did, for good, along with the rest of him. They stood him in a corner of the apothecary's until it wore off, which took nine days, and he has labelled everything he owns ever since." } },
      choices = {
        { text = "A hard way to learn tidiness.", next = "BACK", reply = "There is no easy way. I merely try to sell people the lesson before they need it." },
        { text = "Something else, Selina.", next = "BACK" },
      },
    },
    vials = {
      lines = { { id = "vi_default", text = "It does, and I supply a good share of them. Abigail Shiel and I divide the trade, so she has the crafters' vials with her thread and dye, and I have the herbs and the glass for anyone who actually means to brew something." } },
      choices = {
        { text = "And the Royal Apothecary Society buys from you both?", next = "vials2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vials2 = {
      big = true,
      lines = { { id = "vi2_default", text = "By the crate, and they pay on the day. I know roughly what Johaan is working toward, because one can't sell a man that much gloom weed without drawing conclusions, and I have decided that a plague aimed at the Scourge is a tool like any other. Some of my customers disagree." } },
      choices = {
        { text = "A plague is a plague. It won't stop at the Scourge.", next = "BACK", reply = "That is what the careful ones say, and I can't call them fools. I shall go on selling, but I'll admit I count the crates.", fx = { align = { light = 1 } } },
        { text = "The Scourge made us with one. Let them taste their own.", next = "BACK", reply = "That is very nearly what the Society says, word for word. It has a pleasing symmetry, which is not the same as being wise, but it will do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "ro_default", text = "Because the herbs want air and the pickers come in from the fields this way. I catch them before they reach the tavern, while they still remember what they went out for, and I see everyone who passes between the Gallows' End and the north road." } },
      choices = {
        { text = "You must see a good deal from here.", next = "BACK", reply = "I see Hamlin Atkins go by with his basket six times a day, and Gordo once, with his arms full. The rest is Deathguard, and they never buy anything." },
        { text = "Something else.", next = "BACK" },
      },
    },
    working = {
      lines = { { id = "wk_default", text = "Peacebloom and silverleaf for the first draughts, and then earthroot and mageroyal once Carolai lets you near anything stronger. Buy twice the vials you think you need, because you will break a third of them and give away another." } },
      choices = {
        { text = "Twice the vials. I'll take your word.", next = "BUSINESS" },
        { text = "Good counsel. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_plague", text = "I sell the Society its glass and its herbs, and I don't ask to see the recipe. If you want to know more, Apothecary Johaan is the one to ask, and he may even tell you." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They burned the herb gardens at the old abbey farms, every bed, out of spite. I've not forgiven them the gardens, never mind the rest." } },
    advice = { { id = "tp_ad", text = "Label it, cork it, and store it upright. That is the whole of alchemy that anyone can be taught, and the rest is talent." } },
    forsaken = { { id = "tp_forsaken", text = "We lost our tempers, our sleep and our sense of smell, and kept our handwriting. I have built a trade on the last, and I recommend the principle." } },
    _none = { { id = "tp_none", text = "I couldn't say. If it doesn't go in a vial, it is somebody else's business." } },
  },
}

-- Vance Undergloom: enchanting trainer with a permanent room above the Gallows' End.
P:NPC {
  key = "tir_vance", id = TODO_NPC("Vance Undergloom"), name = "Vance Undergloom", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "absent", "precise" }, values = { "knowledge", "craft" },
  notices = { "profession", "arcane", "kit" },
  impression = {
    first = "Vance Undergloom teaches enchanting from a rented room over the Gallows' End, and he looks at a visitor's gear the way a jeweller looks at a ring. He would rather take a thing apart than own it.",
    third = "{name} met Vance Undergloom, the enchanting trainer who keeps a room above the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, colleague, you're back, and with clean grey dust under your nails. Sit, and let me see what you've been working on." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "One moment, I'm in the middle of a rune. You again, I see. Show me what you've brought and then let me work." },
    { id = "g_default", text = "One moment, I am in the middle of a rune. There. Now, what have you brought me to look at?" },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "You have dust under your nails, the grey kind that never quite washes out. Sit down, colleague, and show me your rod." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it is you. I have been thinking about that piece you were wearing last time, and I've decided I was right about it." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. Cain Firesong sends me his pupils when they've singed something valuable, on the theory that I can make it worth wearing again. He is right about one time in three." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your equipment is failing, and nothing I could lay on it would hold in metal that tired. See an armorer first, and then come and see me." },
  },

  start = "hello",
  nodes = {
    w3_rune = {
      lines = {
        { id = "w3_rune_1", text = "A ward for a Deathguard's shield that would not close, however I drew it, because the shield had been a Scarlet's and some part of the old blessing still lived in the iron. I worked on it for nine nights before I understood that the iron was refusing me." },
      },
      choices = {
        { text = "How did you get past it?", next = "w3_past" },
        { text = "Iron with an opinion. Unsettling.", next = "BACK", reply = "Fascinating, I should say. Most iron has no opinion at all, and I've learned to treasure the ones that do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_past = {
      lines = {
        { id = "w3_past_1", text = "I drew the old blessing out first, gently, like a splinter, and set it in a jar on the shelf. The ward closed at once after that, and the jar still glows a little on cold nights, which my pupils find very distracting." },
      },
      choices = {
        { text = "Keep the jar away from Gina's books. Something else.", next = "BACK" },
      },
    },
    pupils = {
      lines = { { id = "pu_default", text = "A handful, and they are an odd handful. Mages who want their staves improved, a tailor who wishes his cloaks to do more than keep the rain off, and one Deathguard who will not say why she is learning and has turned out to be the best of them." } },
      choices = {
        { text = "An enchanter should tell his client when a rune is poorly set.", next = "BACK", reply = "I do, every time, and then I set it again properly. A badly set rune is a disgrace to the craft.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hide a flawed rune. The client will blame bad luck, not you.", next = "BACK", reply = "And come back to me with a cursed blade, demanding I fix it for nothing? No, I'll be honest.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What makes a guard a good enchanter?", next = "pupils2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pupils2 = {
      lines = { { id = "pu2_default", text = "Stillness. She has stood watch for so long that her hand does not move unless she tells it to, and a rune asks for nothing else. The mages fidget and the tailor talks, and she simply closes the line and looks at me for the next one." } },
      choices = {
        { text = "I'd have guessed the mages would be best.", next = "BACK", reply = "Everyone does, the mages most of all. It is the chief reason they are not." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Vance Undergloom. I teach enchanting, which is the art of taking the magic out of one thing so that you may put it more usefully into another, and I've a few rods and formulae to sell besides." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "Vance Undergloom, and it is a pleasure to meet someone who already knows which end of a rod to hold. Tell me how far you've got, and I shall tell you what I can add to it." },
        { id = "h_back", when = { metBefore = true }, text = "Vance Undergloom, and you find me exactly where you left me, three runes further on. Have you brought me anything interesting to look at?" },
      },
      again = {
        { id = "h_again", text = "Was there something further? I can spare a moment between runes." },
        { id = "h_again2", text = "Go on, but stand out of the light, if you would." },
        { id = "h_again3", text = "Ask away. I think aloud in any case, so you may as well give me a subject." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "You took a room at an inn for good.", next = "room" },
        { text = "Taking magic out of a thing destroys it.", next = "unmake" },
        { text = "Where does a Brill enchanter find anything to work on?", next = "supply" },
        { text = "What's the first thing you'd have me enchant?", next = "first", when = { profession = "Enchanting" } },
        { text = "Do many in Brill come to you to learn?", next = "pupils" },
        { text = "What's the hardest rune you've ever set?", next = "w3_rune" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    room = {
      lines = { { id = "rm_default", text = "I did, and Innkeeper Renee was good enough to stop asking when I would be leaving. I need a table, a lamp and a door that shuts, and the Undercity's Apothecarium has too many people in it who want to know what one is doing." } },
      choices = {
        { text = "And the tavern below doesn't trouble you?", next = "room2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    room2 = {
      lines = { { id = "rm2_default", text = "I no longer hear it. Gina Lang has the room along the passage, with her grimoires, and we have an arrangement that her books do not whisper while I am inscribing and I do not disenchant anything of hers that wanders in." } },
      choices = {
        { text = "Has anything of hers wandered in?", next = "BACK", reply = "A bookmark, once, that was not a bookmark. I returned it in a jar, and we have been perfectly civil ever since." },
        { text = "Something else.", next = "BACK" },
      },
    },
    unmake = {
      big = true,
      lines = { { id = "br_default", text = "It does, completely, and that troubles some of my pupils more than I expected. A sword that a smith spent a week over becomes a pinch of dust and a sliver of essence in a moment, and they ask me whether it is right to unmake good work." } },
      choices = {
        { text = "It's waste. Good work ought to be used as it was made.", next = "BACK", reply = "A craftsman's answer, and Oliver Dwor across the square would shake your hand for it. I shall go on unmaking things, but more thoughtfully.", fx = { align = { order = 1 } } },
        { text = "Nothing's wasted. The magic only changes its coat.", next = "BACK", reply = "Precisely so, and I could not have put it better to my pupils. Nothing in this world is lost, only moved, as we of all people ought to know.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "su_default", text = "From the volunteers, chiefly. Executor Zygand sends them against the Crusade and the Scourge, and they come back with odd rings and charmed bracers they have no use for, and I teach them to render those down." } },
      choices = {
        { text = "Scarlet charms, turned to Forsaken use.", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = { { id = "su2_default", text = "The magic has no allegiance. A Crusader's ward against the undead yields the same strange dust as a farmer's lucky buckle, and I admit to a small satisfaction when the first becomes a protection on a Deathguard's shield." } },
      choices = {
        { text = "That's a neat kind of justice.", next = "BACK", reply = "It is merely thrift, but I allow myself to enjoy it.", fx = { affinity = 1 } },
        { text = "Something else, Vance.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "Your own bracers, with something small for health. It is the humblest formula there is, and it teaches you to keep the rune closed, which is the whole craft. Pupils who begin with something grand end by owing Renee for a table." } },
      choices = {
        { text = "Bracers, then, and a closed rune.", next = "BUSINESS" },
        { text = "I'll bear it in mind. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kirin_tor = { { id = "tp_kirin", text = "They taught enchanting as a minor study, beneath a real mage's attention. I have found it outlasts most of what they thought important." } },
    forsaken = { { id = "tp_forsaken", text = "We are, if you think of it, a disenchantment that went wrong: the life taken out and the pieces left walking. I try not to think of it while I work." } },
    advice = { { id = "tp_ad", text = "Close the rune before you admire it. That is the first rule and very nearly the only one." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Their chaplains lay wards on a soldier's gear without knowing why the wards work. It is crude, and it holds, and I have learned more from their leavings than I care to admit." } },
    lordaeron = { { id = "tp_lord", text = "The court enchanters of the old capital could set a glow in a ballroom ceiling that lasted a season. I was not one of them, but I repaired their work, and I knew where they had cut corners." } },
    _none = { { id = "tp_none", text = "I have no notion. If it cannot be rendered into dust, I have probably not looked at it closely." } },
  },
}

-- Clyde Kellen: fishing trainer on the southwestern shore of Brightwater Lake.
P:NPC {
  key = "tir_clyde", id = TODO_NPC("Clyde Kellen"), name = "Clyde Kellen", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "easy", "unhurried" }, values = { "patient", "solitude" },
  notices = { "profession", "race", "class" },
  impression = {
    first = "Clyde Kellen fishes the shore of Brightwater Lake and teaches anyone who will stand still long enough to learn. The Deathguard call him a bass master, and he is the calmest person I have met in Tirisfal.",
    third = "{name} met Clyde Kellen, the fishing trainer on the shore of Brightwater Lake.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, friend, and you came round the right side without being told. Sit, and let's see what's biting." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind your shadow on the water, and stay on your own side of the shore, if you please." },
    { id = "g_default", text = "Mind your shadow on the water, friend. Come round this side and I'll gladly talk." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "There's a rod on your back that's seen some water. Sit down and tell me what they're biting on where you come from." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. They've been rising since first light, so you've picked a good day for it." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Fishing") }, text = "Somebody's told you that a camp wants a fisherman, have they? They're right, and I'll show you why, if you can sit quiet a while." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You'll want to cook whatever you catch here, and cook it hard. The lake's cleaner than the land, but that's not saying a great deal." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Your folk fish with spears, I hear, standing in the shallows. I'd like to see that done, some time when the bass aren't looking." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter knows how to wait, so you're halfway to a fisherman already. The other half is not minding when nothing comes." },
  },

  start = "hello",
  nodes = {
    w3_strange = {
      lines = {
        { id = "w3_strange_1", text = "A Scarlet helmet, polished bright, with a little fish living inside it as snug as you please. I hung it on the post by my stool, fish and all, and it's still in there, and I've named it the Crusader." },
      },
      choices = {
        { text = "The fish is still alive in it?", next = "w3_crusader" },
        { text = "A fine trophy for a fisherman.", next = "BACK", reply = "The finest I've got. I've never caught anything prouder of its armour." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_crusader = {
      lines = {
        { id = "w3_crusader_1", text = "Alive and thriving, and it glares at anybody who comes near, which is how I know it's the right name. Martine wants to sell it to the apothecaries, and I've told her the Crusader stays on my post as long as I sit on this stool." },
      },
      choices = {
        { text = "Long may it glare. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Clyde Kellen. I fish Brightwater, and I teach fishing to whoever asks, which isn't many. Most of the dead think they've no use for it, since they don't eat, and I let them think so and keep the lake to myself." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Fishing") }, text = "So it's camp craft you're after. A fire's only half a camp, friend, and the other half is something to put over it, so I'll show you how to pull your supper out of whatever water you've pitched beside." },
        { id = "h_fisher", when = { profession = "Fishing" }, text = "Clyde Kellen, and it's good to meet another who carries a rod by choice. I can show you a thing or two more, if you've a mind to learn, or we can just watch the floats for a bit." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice easy, sound carries on the water." },
        { id = "h_again2", text = "Go on. I've a line out, but I can listen." },
        { id = "h_again3", text = "Ask away, friend. The fish are in no hurry and neither am I." },
      },
      choices = {
        { text = "A fisherman should never lie about the size of his catch.", next = "BACK", reply = "Never. A bass is a bass, and I'll weigh mine in front of anyone who doubts it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A fish tale's no fun unless it grows a little in the telling.", next = "BACK", reply = "It grows on its own, friend, without any help from me. I just tell the truth louder.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Why fish at all, if you can't eat?", next = "why" },
        { text = "The Deathguard call you a bass master.", next = "bass" },
        { text = "Is the lake safe? There are murlocs on these shores.", next = "lake" },
        { text = "What does a camp need from a fisherman?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Fishing") } },
        { text = "What's biting in Brightwater, Clyde?", next = "biting", when = { profession = "Fishing" } },
        { text = "What's the strangest thing you've pulled from the lake?", next = "w3_strange" },
        { text = "I'll leave you to the water.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because it's the one thing I do now exactly as I did it before. The line goes out, the float sits, and for as long as it sits I'm only a man by a lake, with nothing about me that would tell you which side of the grave I'm on." } },
      choices = {
        { text = "And what becomes of the fish?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "wy2_default", text = "Renee takes some for her living guests at the Gallows' End, and the rest go back in the water. Martine says that's daft, catching a thing only to let it go, and that I ought to sell the lot to the apothecaries, who'll pay for anything with a gall bladder." } },
      choices = {
        { text = "Let them go. Not everything has to be used.", next = "BACK", reply = "That's my feeling, though I've never put it so plainly. There's enough in these Glades being used.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Martine's right. A catch you waste is a catch wasted.", next = "BACK", reply = "You and her both. Well, maybe I'll sell the next ugly one, and see how it sits with me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bass = {
      lines = { { id = "bs_default", text = "They do, and I don't know who started it. I pulled a bass out of this lake that was as long as my arm, once, in front of a patrol, and Deathguard have little enough to talk about that it's lasted me a year." } },
      choices = {
        { text = "As long as your arm? Truly?", next = "bass2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bass2 = {
      lines = { { id = "bs2_default", text = "As long as my arm was at the time, which I grant you isn't quite the length it used to be. A fisherman's allowed that much. The fish was real enough, and it's still in there, because I put it back and I've been after it again ever since." } },
      choices = {
        { text = "I hope you never catch it.", next = "BACK", reply = "Do you know, so do I. It'd leave me with nothing to do tomorrow.", fx = { affinity = 1 } },
        { text = "Something else, Clyde.", next = "BACK" },
      },
    },
    lake = {
      lines = { { id = "lk_default", text = "This shore is, near enough. The Vile Fin keep to the north bank and the far coast, and they've learned that the Brill patrols come by here. Gunther Arcanus has the island out in the middle, and nothing much goes near him, which keeps the deep water quiet." } },
      choices = {
        { text = "You've a necromancer for a neighbour.", next = "lake2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake2 = {
      lines = { { id = "lk2_default", text = "I've had worse. He doesn't fish, he doesn't shout across the water, and his lights go out at a decent hour. A man who keeps to his own island is the best neighbour a fisherman could ask for, whatever else he gets up to on it." } },
      choices = {
        { text = "That's a generous way to see him.", next = "BACK", reply = "It's a lazy way, friend, and I've found the two come out much the same." },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "cp_default", text = "Supper, to begin with, and that matters more than folk allow. But a fisherman also knows which water's fit to drink and where the bank won't flood, because he's sat beside it for hours, and that's worth more to a camp than another sword." } },
      choices = {
        { text = "So pitch where the fisherman sits.", next = "BACK", reply = "You've got it in one. Find the old fellow with the rod, and put your tent behind him.", fx = { affinity = 1, learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    biting = {
      lines = { { id = "bi_default", text = "Brilliant smallfish close in, all day, and they'll take anything shiny. The longjaw mud snappers sit deeper, off that fallen trunk, and they want patience and an early start, so cast long and don't twitch the line." } },
      choices = {
        { text = "The fallen trunk. I'll try it.", next = "BACK", reply = "Leave me the left side of it. That's where the big one lies, and he and I have an understanding." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    camping = { { id = "tp_camp", text = "Pitch by water you'd be willing to fish, and you'll not go far wrong. If nothing lives in it, don't drink it." } },
    lordaeron = { { id = "tp_lord", text = "There used to be a regatta on this lake at midsummer, with lanterns on every boat. I caught nothing that week, every year, and I never minded." } },
    advice = { { id = "tp_ad", text = "Don't twitch the line. That's fishing, and I've found it covers most other things too." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. News doesn't come down to the water much, and I don't go up for it." } },
  },
}

-- Martine Tramblay: fishing supplies, beside Clyde Kellen on the lake shore.
P:NPC {
  key = "tir_martine", id = TODO_NPC("Martine Tramblay"), name = "Martine Tramblay", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "sharp", "lively" }, values = { "practical", "profit" },
  notices = { "profession", "purse", "race" },
  impression = {
    first = "Martine Tramblay sells rods, lines and bait on the shore of Brightwater Lake, and she does most of the talking for herself and the fisherman beside her. She would turn the whole lake to profit if he would only let her.",
    third = "{name} met Martine Tramblay, who sells fishing supplies on the shore of Brightwater Lake.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Now there's my favourite customer! Let me see that line of yours, because I'll wager you've kept it better than Clyde keeps his." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Rods, line and bait are on the table, and you know the prices, so I'll leave you to it." },
    { id = "g_default", text = "Rods, line, bait and lures! You'll catch nothing with your hands, whatever Clyde tells you about the old days." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "Now there's a customer who knows what they want. Let me see that line of yours, because I'll wager it's frayed." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more bait? I told you one tin wouldn't see you through." },
  },

  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 150 } },
      text = "You're light in the purse, aren't you? Take the plain pole, then; it catches the same fish as the fancy one, only you'll look worse doing it." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A customer who'll actually eat what they catch! Buy the big tin of bait, and thank me at supper." },
  },

  start = "hello",
  nodes = {
    w3_fish = {
      lines = {
        { id = "w3_fish_1", text = "Never, and I'll tell you why: I can't abide the waiting. Clyde can sit for a whole afternoon watching a float bob and call it peace, and I'd sooner talk to a murloc, which at least answers back." },
      },
      choices = {
        { text = "Then why sell fishing tackle?", next = "w3_why" },
        { text = "Clyde does seem very patient.", next = "BACK", reply = "Patient, or asleep. With the dead it can be hard to tell, and with Clyde it's harder than most." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_why = {
      lines = {
        { id = "w3_why_1", text = "Because I like the customers, and they like a person who'll talk them into a better rod, and that's the part of fishing I'm good at. Clyde catches the fish, I catch the fishermen, and between us this shore keeps busy." },
      },
      choices = {
        { text = "A fair division of labour. Something else.", next = "BACK" },
      },
    },
    shore = {
      lines = { { id = "so_default", text = "Every plank of it. There was a boathouse where those posts stick up, and a jetty, and on a fine day half of Brill came down to row about and get sunburnt. I kept a stall then too, just there, and it's the same pitch I've got now." } },
      choices = {
        { text = "A seller should tell you plainly which lures are worth buying.", next = "BACK", reply = "I do, and loudly, because Clyde won't. He thinks everyone should fish with their bare hands.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cheap lures first. Fishermen always come back for more.", next = "BACK", reply = "They come back to complain, and then Clyde hears about it, and then I hear about it from Clyde.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You took your old place back.", next = "shore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shore2 = {
      lines = { { id = "so2_default", text = "I did, the week I could walk straight. Nobody else wanted it, and I'll tell you something, friend, standing on your own spot does more for a body than all the Shadow Priest's speeches. Clyde turned up a month after, and he's never said so, but I think he came for the same reason." } },
      choices = {
        { text = "Then the two of you kept the shore alive.", next = "BACK", reply = "Alive's a strong word for it. We kept it open, and that's as good as this country gets.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Martine Tramblay, fishing supplies. Clyde there will teach you how to fish and I'll sell you what to fish with, and between you and me, mine is the half of the business that pays." },
        { id = "h_heard", when = { heardLine = "tir_clyde.h_default" }, text = "Martine Tramblay. You've been talking to Clyde, so you've heard how peaceful it all is, and now you'll want a pole, because nobody listens to that man for five minutes without wanting one." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Martine Tramblay, fishing supplies, and aren't you a welcome sight, a customer with an appetite! Clyde will teach you and I'll kit you out, and you can be eating by sundown." },
      },
      again = {
        { id = "h_again", text = "Anything else? Don't mind Clyde, he can't hear us when the float's moving." },
        { id = "h_again2", text = "Go on, I'm only sorting hooks." },
        { id = "h_again3", text = "What else do you want to know? Ask it loudly, it annoys him." },
      },
      choices = {
        { text = "Show me your tackle.", next = "BUSINESS" },
        { text = "You and Clyde make an odd pair.", next = "clyde" },
        { text = "Who buys fishing tackle in a land of the dead?", next = "buyers" },
        { text = "Where does your bait come from?", next = "bait" },
        { text = "What line holds a Brightwater bass, Martine?", next = "line", when = { profession = "Fishing" } },
        { text = "You remember this shore from before, I think.", next = "shore" },
        { text = "Do you ever fish yourself?", next = "w3_fish" },
        { text = "Not today.", next = "END" },
      },
    },
    clyde = {
      lines = { { id = "cl_default", text = "We do, and it works. He'd fish all day and never sell so much as a hook, and I'd sell hooks all day and never wet a line, so he draws the customers and I see they don't leave empty-handed." } },
      choices = {
        { text = "He says you'd sell his whole catch to the apothecaries.", next = "clyde2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clyde2 = {
      big = true,
      lines = { { id = "cl2_default", text = "I would, and I've the buyer waiting. Apothecary Johaan pays silver for fish oil and more for the livers, and that soft-headed man catches a basket a day and tips it back in the lake. I say the Forsaken can't afford to throw away anything of use." } },
      choices = {
        { text = "You're right. Sentiment won't feed the war.", next = "BACK", reply = "Thank you! Say it to him on your way past, and say it slowly. I've been saying it for a year.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "It's his catch. Let the man have his peace.", next = "BACK", reply = "Oh, I do, I do. I only complain about it, which is my peace, and he's never begrudged me that.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "by_default", text = "More than you'd think. The living ones off the zeppelin, for a start, who are amazed anything swims up here. Then there are the cooks, and the alchemists after oils, and a fair few Forsaken who only want something to do with their hands of an evening." } },
      choices = {
        { text = "A pastime, for the dead.", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "by2_default", text = "Why not? We don't sleep, and the nights in Tirisfal are long. I've sold poles to three Deathguard this month, and they stand along the bank after their watch like herons and never say a word to each other." } },
      choices = {
        { text = "That's almost a cheerful thought.", next = "BACK", reply = "It's a profitable one, which is better. But I'll allow it's nice to see them at it." },
        { text = "Something else, Martine.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "The worms I dig myself, behind the old boathouse, and there's no shortage of worms in Tirisfal, I can promise you. The shiny baubles come up from the Undercity with the trade cart, and Abigail Shiel in Brill takes her cut for passing them along." } },
      choices = {
        { text = "No shortage of worms. I can imagine why.", next = "BACK", reply = "Best not to imagine too hard. They're fat and the fish like them, and that's where I stop asking." },
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = { { id = "li_default", text = "The waxed one, doubled at the hook, and don't let anyone sell you silk for this lake. There's sunken fencing all along the old shore from when the water was lower, and silk cuts on it like thread on a knife." } },
      choices = {
        { text = "Waxed and doubled. I'll take a spool.", next = "BUSINESS" },
        { text = "That's worth knowing. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Bait sells every day and poles sell once, so I price the poles low and the bait fair. Don't tell the customers, it's the only secret I've got." } },
    lordaeron = { { id = "tp_lord", text = "This shore had a boathouse and a tea garden, and I sold lemonade to people in white hats. I sell worms now, to people in no hats at all, and the money's better." } },
    advice = { { id = "tp_ad", text = "Buy more bait than you think you need, and keep it out of the sun. That's sound whether you fish or not." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They've no use for a lake except to drown things in. If they ever come down this shore, I've a gaff hook that'll change the subject." } },
    forsaken = { { id = "tp_forsaken", text = "People think we've given up wanting things. I've a tin box of takings that says otherwise, and I count it every night." } },
    _none = { { id = "tp_none", text = "No idea. If it hasn't got fins or coin on it, I've not been paying attention." } },
  },
}

-- Shelene Rhobart: leatherworking trainer southeast of Brill; Rand Rhobart's wife.
P:NPC {
  key = "tir_shelene", id = TODO_NPC("Shelene Rhobart"), name = "Shelene Rhobart", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "firm", "warm" }, values = { "craft", "family" },
  notices = { "profession", "kit", "class" },
  impression = {
    first = "Shelene Rhobart teaches leatherworking at a house off the road southeast of Brill, and she runs her pupils and her husband with the same steady hand. She can tell who skinned a hide by the cuts on it.",
    third = "{name} met Shelene Rhobart, the leatherworking trainer southeast of Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Come in, come in, and keep clear of the frames. Find your stool; I've a new hide pegged out that you'll want to see." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Come in, but stay clear of the frames, and don't touch my husband's knives, because he's particular." },
    { id = "g_default", text = "Come in, but keep clear of the stretching frames. If you've come to learn, find a stool, and if you've come to gawp, be quick." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "That's a stitching awl in your belt, and you carry it where you can reach it. Good. Show me the last thing you made." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your hands, I want to know whether you've been practising or only meaning to." },
  },

  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "You skin your own, and you're taking the flank cut too shallow, I can see it on that hide. Rand will show you, if you ask him nicely and bring him a darkhound." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those straps are about to part. I'll not have anyone walk out of my house with their armor round their ankles, so sit down while I find a needle." },
    { id = "n_leather", cat = "class", when = { class = { "ROGUE", "HUNTER", "DRUID", "SHAMAN" } },
      text = "You wear leather, and you've worn it hard. You'd save yourself a deal of coin if you learned to mend it, {class}, and I happen to teach that." },
  },

  start = "hello",
  nodes = {
    w3_finest = {
      lines = {
        { id = "w3_finest_1", text = "A pair of gloves for a Deathguard with three fingers on one hand and five on the other, cut so neat that he could hold a sword without the empty fingers flapping. He wept when he put them on, or did what we do instead, and he's worn them every day since." },
      },
      choices = {
        { text = "That's the work of a real craftswoman.", next = "BACK", reply = "It's the work of someone who listened, which is most of craft. The stitching is the easy part." },
        { text = "How did you cut for the missing fingers?", next = "w3_cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_cut = {
      lines = {
        { id = "w3_cut_1", text = "I traced his hand on a hide, exactly as it was, and didn't try to make it look whole. Most of my pupils want to make the dead look as we were, and I tell them to make us fit as we are." },
      },
      choices = {
        { text = "Wise advice. Something else.", next = "BACK" },
      },
    },
    d2_orders = {
      lines = {
        { id = "d2_orders_1", text = "Gloves, mostly, because the dead lose fingers in this cold and never notice until one's missing. Executor Zygand sends a list every month, and it's always longer than the last, and he never once says please." },
      },
      choices = {
        { text = "Does he pay well?", next = "d2_orders2" },
        { text = "The Executor doesn't strike me as a pleaser.", next = "d2_orders2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_orders2 = {
      lines = {
        { id = "d2_orders2_1", text = "He pays in what the Undercity sends him, which is fair and slow. I've learned to keep a stack of plain gloves ready, so that when the list comes I can send most of it the same day and make him wait only for the fancy ones." },
      },
      choices = {
        { text = "You've the measure of him.", next = "BACK", reply = "I'd the measure of men like him long before I died. They don't change much." },
        { text = "Something else, Shelene.", next = "BACK" },
      },
    },
    d2_pupils = {
      lines = {
        { id = "d2_pupils_1", text = "Afraid of the frame behind them, more likely, since I've told every one of them it'll take a finger if they lean on it. I'm firm because leather is unforgiving, and a pupil who learns that from me learns it cheaper than from a ruined hide." },
      },
      choices = {
        { text = "Have you ever lost a pupil?", next = "d2_pupils2" },
        { text = "A firm hand makes good work.", next = "d2_pupils2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_pupils2 = {
      lines = {
        { id = "d2_pupils2_1", text = "To the Crusade, two of them, out gathering hides near Solliden's farm. I told them to stay on the Brill side of the road and they wanted the better darkhounds, and now I tell the story to every new pupil, which is the only use I can make of it." },
      },
      choices = {
        { text = "Then the story does some good.", next = "BACK" },
        { text = "I'll stay on the right side of the road.", next = "BACK", reply = "See that you do. I've no wish to add you to the story." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shelene Rhobart, and I teach leatherworking. My husband Rand does the skinning and teaches that, so between us a pupil can take a hide off a beast in the morning and be wearing it by the week's end." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "Shelene Rhobart. You've made a start on the craft already, so we can skip the part where I explain which side of the hide is the outside. Tell me what you can do, and I'll tell you what comes next." },
        { id = "h_back", when = { metBefore = true }, text = "Shelene Rhobart, and there's a stool free if you've come to work. Rand's out the back, talking to a hide, so you've caught the house on a quiet day." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I work this edge." },
        { id = "h_again2", text = "Go on, I can stitch and listen, and I'll know if you're dull." },
        { id = "h_again3", text = "Was there more? Ask it, and mind the frame behind you." },
      },
      choices = {
        { text = "A leatherworker should say when a hide is too thin to hold.", next = "BACK", reply = "Always. A thin hide splits at the worst moment, and I'll not have my name on that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Stretch a thin hide and sell it as thick. Nobody will measure.", next = "BACK", reply = "Rand would measure, and so would I. We'd both be ashamed, and I'd never hear the end of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "You and your husband both came back.", next = "rand" },
        { text = "Why set up out here, away from Brill?", next = "house" },
        { text = "Hides from Tirisfal can't be easy to work.", next = "hides" },
        { text = "What should I make first to get my hand in?", next = "firstwork", when = { profession = "Leatherworking" } },
        { text = "What do the Deathguard order from you?", next = "d2_orders" },
        { text = "Your pupils seem afraid of you.", next = "d2_pupils" },
        { text = "What's the finest piece you've ever made?", next = "w3_finest" },
        { text = "I'll let you get on.", next = "END" },
      },
    },
    rand = {
      lines = { { id = "ra_default", key = true, text = "We did, and within a day of each other, which I'm told hardly ever happens. I woke first and I sat by him until he stirred, because I'd decided that if he was coming back, the first thing he saw was going to be someone he knew." } },
      choices = {
        { text = "And if he hadn't woken?", next = "rand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rand2 = {
      big = true,
      lines = { { id = "ra2_default", text = "Then I'd have buried him again, properly, and gone on. Some of the neighbours say we only cling to each other out of habit, and that the dead ought to stand alone and owe nothing to who they were. I've thought about it, on the long nights." } },
      choices = {
        { text = "A vow outlasts the grave. Keep to him.", next = "BACK", reply = "That's what I came to, in the end. I said till death, and death turned out not to be the end of it, so here I am.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You owe the past nothing. Stay only if you choose it.", next = "BACK", reply = "I do choose it, every morning, and perhaps that's the better way to put it. He'd laugh to hear he's being chosen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    house = {
      lines = { { id = "ho_default", text = "Because of the smell, mostly. Tanning is a foul business even to a nose like mine, and Magistrate Sevren made it very clear that Brill has smells enough. Out here we've the road for customers and the lake for water, and nobody to complain." } },
      choices = {
        { text = "Who are your neighbours on this road?", next = "house2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house2 = {
      lines = { { id = "ho2_default", text = "Clyde Kellen and Martine Tramblay, down at the water, and they send us the odd fish skin to see what we'll make of it. The Deathguard pass twice a watch, and Eliza Callen comes out from Brill to buy whatever my pupils finish that's fit to sell." } },
      choices = {
        { text = "So your pupils' work ends up on her rack.", next = "BACK", reply = "The good pieces do. The rest I cut up for laces, and there are a great many laces." },
        { text = "Something else, Shelene.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "They're thin, and the grain's poor, because every beast in these Glades is half sick. A darkhound's the best of them. You learn to work around the bad patches, and it makes a careful cutter of you faster than good leather ever would." } },
      choices = {
        { text = "Do you ever get better hides from elsewhere?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      lines = { { id = "hi2_default", text = "Now and then, since the zeppelin started running. An orc came through with a bale of Durotar boar, thick as my thumb and stiff as a plank, and I spent a happy week on it. I'd not known how much I'd missed leather that fights back." } },
      choices = {
        { text = "The Horde has its uses, then.", next = "BACK", reply = "It has boars, which is use enough for me. Send more orcs, and tell them to bring luggage." },
        { text = "Something else.", next = "BACK" },
      },
    },
    firstwork = {
      lines = { { id = "fw_default", text = "Armor kits, a stack of them, until your stitches run even without your looking. Then a pair of boots for yourself, because you'll take more care over something you have to walk in. Bring me the boots and I'll tell you the truth about them." } },
      choices = {
        { text = "Kits first, then boots.", next = "BUSINESS" },
        { text = "I'll bring you the boots. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Their patrols have come within sight of this house twice. Rand keeps the big knife by the door, and I keep the awl, and so far we've needed neither." } },
    forsaken = { { id = "tp_forsaken", text = "Most of us came back alone, to nothing. I came back to a husband and a trade, and I try to remember how rare that is when my pupils are being slow." } },
    advice = { { id = "tp_ad", text = "Measure twice, cut once, and wax your thread. It was true when I was alive and nobody's repealed it." } },
    lordaeron = { { id = "tp_lord", text = "We had a tannery by the river, and Rand's father had it before him. The river's still there, which is more than can be said for the rest." } },
    trade = { { id = "tp_trade", text = "Eliza Callen in Brill sells what my pupils make, and Rand supplies the hides. If you want to buy leather, go to her, and if you want to make it, sit down." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Rand, he talks to everyone who passes while he's meant to be scraping." } },
  },
}

-- Rand Rhobart: skinning trainer; Shelene's husband.
P:NPC {
  key = "tir_rhobart", id = TODO_NPC("Rand Rhobart"), name = "Rand Rhobart", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "cheerful", "blunt" }, values = { "craft", "family" },
  notices = { "profession", "pet", "class" },
  impression = {
    first = "Rand Rhobart teaches skinning beside his wife's leather shop, and he talks the whole time his knife is moving. The Deathguard say he is a fair hand with a duskbat, which he takes as the highest praise.",
    third = "{name} met Rand Rhobart, the skinning trainer southeast of Brill and husband of Shelene Rhobart.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and keeping your knife sharp! Come and look at this duskbat, and tell me where I went wrong at the shoulder." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the pegged hide, and if you want to learn the knife, learn it quietly for once." },
    { id = "g_default", text = "Mind where you step, there's a hide pegged out just there. Have you come to learn the knife, or to talk? I can manage both at once." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "That's a skinner's knife, and you keep it sharp. Good! Come and look at this one, and tell me where I went wrong at the shoulder." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. Did you bring me anything dead? Anything else dead, I should say." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a handsome coat on {pet}. Don't look at me like that, I'm only admiring, and I never skin anything that has a name." },
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "You work leather, so you'll be one of Shelene's, or you ought to be. She'll tell you your stitching's crooked, and she'll be right, and you'll thank her in a month." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll not think much of my trade, I expect, but I'll say this for it: I take only what's already been killed, and I waste none of it." },
  },

  start = "hello",
  nodes = {
    w3_knife = {
      lines = {
        { id = "w3_knife_1", text = "It was my father's, and his father's before him, and it's been sharpened so often there's only half the blade left. I found it in the house when I woke, exactly where I'd left it, which is more than I can say for most things." },
      },
      choices = {
        { text = "Will you ever replace it?", next = "w3_replace" },
        { text = "A knife like that remembers the work.", next = "BACK", reply = "It does, and so do I, when I hold it. My father's hands knew a better cut than mine ever will." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_replace = {
      lines = {
        { id = "w3_replace_1", text = "When it breaks, and not a day before. Shelene says I'm sentimental, and she says it while lining her gloves with the bat wings I skinned with it, so I'd say we're both sentimental in our way." },
      },
      choices = {
        { text = "I'd say you are. Something else.", next = "BACK" },
      },
    },
    d2_other = {
      lines = {
        { id = "d2_other_1", text = "Murlocs, once, from Brightwater Lake, because a lad bet me I couldn't. I could, and it smelled worse than anything I've ever done, and Shelene made me sleep out with the hides for a week, which given we don't sleep was mostly a matter of principle." },
      },
      choices = {
        { text = "Was the hide worth anything?", next = "d2_other2" },
        { text = "I'd have taken that bet.", next = "d2_other2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_other2 = {
      lines = {
        { id = "d2_other2_1", text = "Not a copper. It went stiff as a board and then it went green, and the apothecaries took it off my hands because they'd never seen one. That's the trouble with Tirisfal: the only buyers for anything strange are Johaan's people in Brill." },
      },
      choices = {
        { text = "Johaan buys everything strange, I hear.", next = "BACK", reply = "He does, and he never says what for, and I've stopped asking." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d2_talk = {
      lines = {
        { id = "d2_talk_1", text = "So I'm told, and it's a family failing. My father talked to his sheep and I talk to hides, and I'd rather be a chatty corpse than one of those that stand in the corner of the Gallows' End staring at the wall." },
      },
      choices = {
        { text = "Some of them can't help it.", next = "d2_talk2" },
        { text = "Silence would suit this place better.", next = "d2_talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_talk2 = {
      lines = {
        { id = "d2_talk2_1", text = "No, they can't, and I don't blame them. I think the ones who go quiet are still somewhere back in the plague, and if I keep talking loud enough I stay up here with the rest of you, which is why Shelene lets me get away with it." },
      },
      choices = {
        { text = "Then keep talking, Rand.", next = "BACK", reply = "Oh, I mean to. You've no idea how hard it is to stop me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rand Rhobart, skinner. My wife Shelene makes the leather and I get it off the beast for her, and I'll teach you to do the same, if you've a knife and no objection to the smell." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "Rand Rhobart, and it's a treat to meet somebody who already knows the work. I can show you the cuts for the bigger beasts, if you're ready for them, or we can just compare knives." },
        { id = "h_back", when = { metBefore = true }, text = "Rand Rhobart, still scraping, as you see. Pull up that log and tell me where you've been, because nothing happens on this road and I rely on visitors." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep scraping, if it's all the same to you." },
        { id = "h_again2", text = "Go on, ask. Shelene says I'd talk to the hides if nobody else came by." },
        { id = "h_again3", text = "Anything more? I've the whole afternoon and half a darkhound." },
      },
      choices = {
        { text = "A skinner should take only what he needs from the beast.", next = "BACK", reply = "Exactly, and use all of it. A good skinner wastes nothing, and a duskbat has more use than you'd think.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Take the best hides and leave the rest for the crows.", next = "BACK", reply = "The crows'll thank you, but I won't. Waste is the worst kind of skinning, and I'll not teach it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to skin.", next = "BUSINESS" },
        { text = "The Deathguard say you're good with a duskbat.", next = "bats" },
        { text = "Your wife seems to run this house.", next = "shelene" },
        { text = "What's worth skinning in Tirisfal?", next = "beasts" },
        { text = "Where am I spoiling my hides, Rand?", next = "spoil", when = { profession = "Skinning" } },
        { text = "Do you skin anything besides beasts?", next = "d2_other" },
        { text = "You talk more than any dead man I've met.", next = "d2_talk" },
        { text = "That's an old knife you're using.", next = "w3_knife" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    bats = {
      lines = { { id = "bt_default", text = "They do, bless them, and it's the only thing I've ever been famous for. A duskbat's wing is thinner than a glove and tears if you breathe on it, so the trick is to peg it out first and work from the bone outward, with a knife no longer than your finger." } },
      choices = {
        { text = "What does anyone want with a bat's wing?", next = "bats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats2 = {
      lines = { { id = "bt2_default", text = "Shelene lines gloves with it, and there's nothing softer. The apothecaries want it too, for straining things I've not asked about, and they pay double for a wing with no holes, which is how the Deathguard came to hear of me." } },
      choices = {
        { text = "Famous among apothecaries. That's a mixed blessing.", next = "BACK", reply = "It is! I get the best customers in Tirisfal and I don't dare ask any of them in for supper." },
        { text = "Something else, Rand.", next = "BACK" },
      },
    },
    shelene = {
      lines = { { id = "se_default", text = "She does, and she did when we were alive, and I've never seen cause to change it. I'm the one who chats to the customers and she's the one who knows what anything costs, and a house needs both, but it needs hers more." } },
      choices = {
        { text = "She told me she sat by you until you woke.", next = "shelene2", when = { heardLine = "tir_shelene.ra_default" } },
        { text = "You're a lucky man, living or dead.", next = "BACK", reply = "Don't I know it. I tell her so once a day, and she tells me to get on with the scraping.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shelene2 = {
      lines = { { id = "se2_default", text = "She did. I opened my eyes in the dark with no notion of where I was or what had been done to me, and there was Shelene, saying my name as if I'd only overslept. I've not been properly afraid of anything since that morning." } },
      choices = {
        { text = "Then you woke better than most of us.", next = "BACK", reply = "Better than anyone I've met, and I know it. It's why I talk so much, I think. Somebody was kind to me first.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "Darkhounds, first and last, and the worgs if you go as far as the Silverpine road. The duskbats when you've got the hands for them. Leave the plagued bears alone, because the hide comes away in patches and the smell stays in your knife for a week." } },
      choices = {
        { text = "The sickness spoils even the skin, then.", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      big = true,
      lines = { { id = "be2_default", text = "It spoils everything, sooner or later. Each year the hides come in thinner and the beasts come in fewer, and Shelene and I have talked about whether the hunters ought to hold off a season and let the packs breed back. The Executor won't hear of it while there's a war on." } },
      choices = {
        { text = "Hold off. A land hunted bare feeds nobody.", next = "BACK", reply = "That's what I say, and I'm a man who makes his living off the hunting. If I can see it, I don't know why Zygand can't.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The war comes first. Take what the land has.", next = "BACK", reply = "That's the Executor's answer, and I'll not call it wrong. I only wonder what we'll be skinning in five years.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spoil = {
      lines = { { id = "sl_default", text = "At the legs, I'd bet my knife on it, because everyone does. You're cutting round the joint and then pulling, and the pull tears the belly. Slit down the inside of each leg to the middle first, and the whole hide will come away like a coat." } },
      choices = {
        { text = "Inside of the leg, then to the middle.", next = "BACK", reply = "That's it. Bring me the next one and I'll tell you whether your hands were listening.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They've hounds of their own, big red brutes, and I'll admit I've wondered about the hide. Shelene says I'm not to go and find out." } },
    forsaken = { { id = "tp_forsaken", text = "We're a gloomy lot, taken all round, and I can't say we've no reason. I just had a softer waking than most, so I try to be cheerful enough for a few of the others." } },
    advice = { { id = "tp_ad", text = "Keep the knife sharper than you think it needs to be. A dull knife is what takes fingers, and they don't all sew back on straight." } },
    lordaeron = { { id = "tp_lord", text = "My father tanned hides by the river and so did I, and the stags in the king's wood were the finest in the north. They're sickly things now, and I leave them be." } },
    trade = { { id = "tp_trade", text = "I don't sell the hides, they all go to Shelene. If you want one, you'll have to learn to take your own, and I can help you there." } },
    _none = { { id = "tp_none", text = "Now that I don't know, and I usually know a bit about everything. Ask Shelene, she actually listens when people talk." } },
  },
}

-- Zapetta: goblin zeppelin master for the Durotar ship, at the tower outside the Undercity.
P:NPC {
  key = "tir_zapetta", id = TODO_NPC("Zapetta"), name = "Zapetta", title = "Zeppelin Master",
  bible = "bibles/more_folk.md", role = "flightmaster", tier = "service",
  communities = { "brill" }, temper = { "brash", "quick" }, values = { "profit", "pride" },
  notices = { "race", "profession", "travel" },
  impression = {
    first = "Zapetta runs the Durotar zeppelin from the tower outside the Undercity and prices everything he says, including the weather. He talks about the airship the way other people talk about a clever child.",
    third = "{name} met Zapetta, the goblin zeppelin master who runs the Orgrimmar ship from Tirisfal Glades.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, it's my favourite passenger! She's on her way, pal, she's always on her way, and the view from the top's still the best in Tirisfal." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you again. The zeppelin's comin', and I'll take your fare, but don't expect me to chat you up about the weather." },
    { id = "g_default", text = "Orgrimmar zeppelin, this platform, friend! She's on her way, she's always on her way, and the wait don't cost you a copper." },
    { id = "g_orc", when = { race = { "Orc", "Troll" } }, text = "Headin' home to Durotar, pal? Smart, real smart, because this place does somethin' to the appetite and I'm speakin' from experience." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, a repeat customer! That's the best advertisement there is, on account of it proves you landed." },
  },

  notice = {
    { id = "n_engineer", cat = "profession", when = { profession = "Engineering" },
      text = "Whoa, hands where I can see 'em, tinker. You can look at the engine housing all you want, but anybody touches a valve on my ship and it's a liability matter." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "No offence, pal, but I'm gonna ask you to hold on with both hands this trip. We had a fella lose an arm over the Great Sea last month, and the paperwork was murder." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big fella, do me a favour and stand in the middle of the deck. It's a load balance thing, nothin' personal, the ship just flies better level." },
  },

  start = "hello",
  nodes = {
    w3_lost = {
      lines = {
        { id = "w3_lost_1", text = "Oh, everything, pal, hats, swords, a whole roast boar once, and a Forsaken left a finger, which I'm still holdin' for him at no charge, out of the goodness of my heart. The rest goes in the lost and found, and after a month the lost and found goes on sale." },
      },
      choices = {
        { text = "You sell people's lost things?", next = "w3_sell" },
        { text = "A finger? Truly?", next = "BACK", reply = "In a little box, labelled and everything. Customer care, friend, that's what separates me from the competition." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_sell = {
      lines = {
        { id = "w3_sell_1", text = "After a month, sure, and I give the owner first refusal at a very reasonable price if he turns up. Listen, listen, storage costs money, and that boar took up a whole crate, and it was not gettin' any fresher, believe me." },
      },
      choices = {
        { text = "Business is business. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Zapetta, and I run the zeppelin from Tirisfal to Orgrimmar and back, finest airship on the northern route. She's goblin built and goblin flown, so you know she's fast, and you got my personal word she's mostly safe." },
        { id = "h_dead", when = { race = "Scourge" }, text = "Zapetta, and the ship goes straight to Orgrimmar. You're gonna love Durotar, pal, it's dry, it's sunny, nothin' rots, and I hear that's a real novelty for you folks." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Talk fast, I'm watchin' the sky and the clock both." },
        { id = "h_again2", text = "Go ahead, pal, questions are on the house." },
        { id = "h_again3", text = "What else ya need? If it's about the ship, I got answers, and if it ain't, I got opinions." },
      },
      choices = {
        { text = "Where exactly does your ship put me down?", next = "route" },
        { text = "'Mostly safe' is an interesting promise.", next = "safe" },
        { text = "A goblin, working a tower in Tirisfal.", next = "posting" },
        { text = "That other goblin runs the Stranglethorn ship?", next = "hin" },
        { text = "What's holding your engine together, Zapetta?", next = "engine", when = { profession = "Engineering" } },
        { text = "What do passengers leave behind on the ship?", next = "w3_lost" },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    route = {
      lines = { { id = "rt_default", text = "Tower outside Orgrimmar's front gate, right in Durotar, and you can walk to the Warchief's door from there in the time it takes to get the sand outta your boots. One hop across the Great Sea, no stops, no detours, and the view's included in the price, which is nothin'." } },
      choices = {
        { text = "Nothing? Goblins don't fly anyone for nothing.", next = "route2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    route2 = {
      lines = { { id = "rt2_default", text = "Hey, listen, the passengers ride free because the Warchief and the Dark Lady pick up the tab, and they pay regular, which is the best kind of customer. Me, I'm on a contract, per crossing, plus a bonus for every month nothin' catches fire." } },
      choices = {
        { text = "How often do you collect the bonus?", next = "BACK", reply = "Often enough, pal, often enough. I don't discuss the exact numbers with passengers, it's company policy and it's better for everybody's nerves." },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sf_default", text = "It's an honest one, and you won't get that from the competition, on account of there ain't any. She's a bag of gas with a furnace hangin' under it, friend. I keep the two apart, and I've been keepin' 'em apart for a good long while now." } },
      choices = {
        { text = "And when they aren't kept apart?", next = "safe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe2 = {
      big = true,
      lines = { { id = "sf2_default", text = "Then you get a real pretty light over the water and I'm outta work, so believe me, I'm motivated. Look, some folks say I oughta tell passengers every little thing that could go wrong before they board. I say that's bad for business and worse for the passenger. What's your take?" } },
      choices = {
        { text = "Tell them. People should know what they're boarding.", next = "BACK", reply = "Yeah, yeah, an honest sign on the ramp. I'll think about it, pal, I'll price it out, but if bookings drop I'm sendin' you the bill.", fx = { align = { honor = 1 } } },
        { text = "Keep quiet. A calm passenger is a safe one.", next = "BACK", reply = "See, that's what I'm sayin'! Nobody ever fell off a ship from bein' too relaxed. You got a head for the trade, friend.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    posting = {
      lines = { { id = "po_default", text = "It's a job, and it pays the cold weather rate, which I negotiated personally. Sure, the trees are dead and the locals are dead and the fog gets in the fuel lines, but nobody up here haggles, pal. They just stare till you name a price." } },
      choices = {
        { text = "You get along with the Forsaken, then.", next = "posting2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    posting2 = {
      lines = { { id = "po2_default", text = "I get along with anybody who settles their account. There's a fella called Deyrek stands by the tower all day watchin' my ship come in, never rides, never buys, just watches. I offered him a discount on a free trip and he still said no, which I gotta respect." } },
      choices = {
        { text = "A discount on a free trip.", next = "BACK", reply = "It's about the principle, friend. You always leave the customer feelin' like they got a deal, even when there ain't one." },
        { text = "Something else, Zapetta.", next = "BACK" },
      },
    },
    hin = {
      lines = { { id = "hn_default", text = "Hin Denburg, yeah, he's got the other ship, down to Grom'gol. Slower ship, longer route, more mosquitoes on the far end. He'll tell ya his run's the prestige posting, and I let him, on account of I got the brother thing covered already." } },
      choices = {
        { text = "The brother thing?", next = "hin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hin2 = {
      lines = { { id = "hn2_default", key = true, text = "My brother Nez'raz works the Grom'gol tower, catchin' Hin's ship at the jungle end. So anythin' Hin does wrong on that route, I hear about it by the next crossing, and anythin' I do wrong, well, family don't talk. It's a real nice arrangement." } },
      choices = {
        { text = "Nice for one of you.", next = "BACK", reply = "For the one that counts, pal. That's business." },
        { text = "Something else.", next = "BACK" },
      },
    },
    engine = {
      lines = { { id = "en_default", text = "Rivets, optimism and about forty feet of copper pipe I ain't supposed to mention. Nah, listen, she's sound where it matters, the boiler's double walled and the gas bag's sewn in cells, so if one goes you only lose a little altitude and a little dignity." } },
      choices = {
        { text = "Cells in the bag. That's clever work.", next = "BACK", reply = "Thank you! Finally, somebody who appreciates the engineering and don't just ask if it's gonna explode.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_cartel", text = "The Cartel holds my contract and the Horde pays the Cartel, and everybody's happy so long as the ship shows up. Don't ask me about politics, pal, I just fly the route." } },
    thrall = { { id = "tp_thrall", text = "Pays on time, never argues the invoice, and he ain't once asked me to carry anythin' that ticks. On my mother's ledger, that's the best client I ever had." } },
    advice = { { id = "tp_ad", text = "Stand in the middle, hold the rail, and don't lean out to look at the whales. That's free, and it's worth every copper." } },
    forsaken = { { id = "tp_forsaken", text = "Listen, they're the easiest passengers I got. No luggage, no complaints, no lunch comin' back up over the rail. I just count the limbs on and count 'em off." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal. If it don't fly or pay, it ain't crossed my desk." } },
  },
}

-- Hin Denburg: goblin zeppelin master for the Grom'gol ship, at the same tower.
P:NPC {
  key = "tir_hin", id = TODO_NPC("Hin Denburg"), name = "Hin Denburg", title = "Zeppelin Master",
  bible = "bibles/more_folk.md", role = "flightmaster", tier = "service",
  communities = { "brill" }, temper = { "smooth", "fussy" }, values = { "profit", "careful" },
  notices = { "race", "level", "travel" },
  impression = {
    first = "Hin Denburg runs the zeppelin to Grom'gol from the tower outside the Undercity, with a clipboard and a great many warnings about the jungle. He is the careful one of the two goblins there, and he wants that known.",
    third = "{name} met Hin Denburg, the goblin zeppelin master who runs the Stranglethorn ship from Tirisfal Glades.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, pal, you're back! You read the clipboard last time, which puts you in the top ten percent of my passengers." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Bags checked, weapons checked, and no complaints, because I'm not filing another one on your account." },
    { id = "g_default", text = "Grom'gol Base Camp, Stranglethorn Vale, this side of the tower, friend. Check your bags, check your weapons, and check 'em again, 'cause I don't turn the ship around for a forgotten sword." },
    { id = "g_green", when = { maxLevel = 25 }, text = "Whoa, whoa, hold up, pal. You know where this ship goes, right? I'm askin' because I got a clipboard full of folks who didn't, and none of 'em filed a complaint, if ya take my meanin'." },
    { id = "g_back", when = { metBefore = true }, text = "You're back from the jungle in one piece! I'm markin' that down, friend, it does wonders for my figures." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, headed for Stranglethorn. You'll know the place better than I do, pal, so do me a favour and tell the other passengers the raptors ain't friendly." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Word of advice, friend, from one professional to another. The jungle's hot and it's wet and you folks don't keep so good in it, so pack somethin' to wrap up in." },
    { id = "n_high", cat = "level", when = { minLevel = 40 },
      text = "Now you, you look like you've seen a jungle or two. Good, that's one passenger I don't gotta worry about, and worry's overhead." },
  },

  start = "hello",
  nodes = {
    w3_saving = {
      lines = {
        { id = "w3_saving_1", text = "My own ship, pal, with my name on the bag and no Cartel middleman takin' his slice off every fare. Another six years on this tower, maybe five if the Warchief keeps payin' the bonus, and I'm a captain with my own route." },
      },
      choices = {
        { text = "Where would you fly her?", next = "w3_route" },
        { text = "Six years in Tirisfal sounds like a high price.", next = "BACK", reply = "It's an investment, friend. Cold now, rich later, and the dead don't steal, which saves me a fortune in locks." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_route = {
      lines = {
        { id = "w3_route_1", text = "Somewhere warm, with no fog and plenty of customers, Booty Bay to Ratchet maybe, the pirate run. Zapetta says I'll be broke in a month, and I say he'll be askin' me for a job in two." },
      },
      choices = {
        { text = "I'll ride with you, when she flies. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hin Denburg, zeppelin master, and that's my ship on the other mooring. She runs from here clear down the world to Grom'gol Base Camp in Stranglethorn, and she's the longest scheduled crossing the Horde's got, which I mention because nobody else will." },
        { id = "h_green", when = { maxLevel = 25 }, text = "Hin Denburg, and the ship's bound for Grom'gol in Stranglethorn Vale. Now listen, listen, I'll fly anybody, but that jungle eats greenhorns, so I gotta ask if you're real sure about this one." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Go ahead, I got a minute before I check the moorings again." },
        { id = "h_again2", text = "Ask away, friend, askin's free and so's the ride." },
        { id = "h_again3", text = "What else can I tell ya? I got it all written down here somewhere." },
      },
      choices = {
        { text = "What's waiting at the other end of your route?", next = "gromgol" },
        { text = "You keep careful count of your passengers.", next = "clipboard" },
        { text = "The Durotar master says his is the better ship.", next = "zapetta" },
        { text = "Cold work for a goblin, this tower.", next = "cold" },
        { text = "I'm from those jungles, mon. What do you warn them about?", next = "troll", when = { race = "Troll" } },
        { text = "What are you saving all that coin for, Hin?", next = "w3_saving" },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    gromgol = {
      lines = { { id = "gg_default", text = "A stockade full of orcs on the coast, with jungle on three sides and the sea on the fourth. Good folks, hard folks, and they'll put you to work before your feet stop wobblin'. Past their wall it's tigers, raptors, trolls that ain't the friendly kind, and bugs the size of my head." } },
      choices = {
        { text = "And if I wanted somewhere less deadly from there?", next = "gromgol2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gromgol2 = {
      lines = { { id = "gg2_default", text = "Then you walk south, a long way, and you come to Booty Bay, where my people run things and everybody's welcome so long as they're spendin'. Tell 'em Hin sent ya. It won't get you a thing, friend, but I like 'em to know I'm still alive up here." } },
      choices = {
        { text = "I'll pass on your regards.", next = "BACK", reply = "You're a pal. And hey, if anybody down there asks, the Princess runs on time, every time, got it?", fx = { affinity = 1, learn = { "booty_bay" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "booty_bay" } } },
      },
    },
    clipboard = {
      lines = { { id = "cb_default", text = "Every one of 'em, out and back. Zapetta over there thinks it's a waste of ink, but when the Cartel's auditors come round, I can show 'em what I carried and when, and that, friend, is the difference between a contract and a real long swim home." } },
      choices = {
        { text = "How many come back, of those who go out?", next = "clipboard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clipboard2 = {
      big = true,
      lines = { { id = "cb2_default", text = "Not enough, and it bugs me, I ain't gonna lie. Some stay down there, sure, but some just don't show up in either column. I been thinkin' I oughta turn the green ones away at the ramp, only it ain't my call who rides, and a refused fare's still a refused fare." } },
      choices = {
        { text = "Turn them away. A life is worth more than a fare.", next = "BACK", reply = "Yeah. Yeah, all right, maybe I start with a real stern talkin'-to and work up from there. Don't tell Zapetta, he'll say I've gone soft.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fly them. Where they go is their own affair.", next = "BACK", reply = "That's the contract talkin', and the contract ain't wrong. I just fly the ship, right? I just fly the ship.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zapetta = {
      lines = { { id = "zp_default", text = "Zapetta says a lotta things, mostly loud. His ship's faster, sure, I'll give him that, on a route a blind gnome could fly. Mine goes four times the distance over open water and puts down in a jungle, and I ain't singed a passenger yet, which he can't say." } },
      choices = {
        { text = "He mentioned his brother watches your landings.", next = "zapetta2", when = { heardLine = "tir_zapetta.hn2_default" } },
        { text = "You two bicker like partners.", next = "BACK", reply = "We're competitors who share a staircase, pal, it's worse. But he covers my platform when I eat, so I guess that's somethin'." },
        { text = "Something else.", next = "BACK" },
      },
    },
    zapetta2 = {
      lines = { { id = "zp2_default", text = "Nez'raz, yeah, down at the Grom'gol tower, and don't think I don't know it. So I land her like I'm settin' down a crate of eggs, every single time, and that weasel's got nothin' to write home about. Best thing that ever happened to my record, bein' spied on." } },
      choices = {
        { text = "So his spying made you the better pilot.", next = "BACK", reply = "Ha! Don't you dare tell him. I want him to keep payin' for the postage.", fx = { affinity = 1 } },
        { text = "Something else, Hin.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "co_default", text = "Tell me about it. The damp gets in the rope, the fog gets in the instruments, and every local I talk to looks like he's waitin' for me to keel over so he can see what happens next. But the hazard pay's handsome, and I'm bankin' every copper of it." } },
      choices = {
        { text = "Saving for something?", next = "BACK", reply = "A little place in Booty Bay with a roof that don't leak and no stairs. A fella can dream, pal, and I dream in round numbers." },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "The water, the fevers, and the fact that everythin' down there with teeth is faster than it looks. And I tell 'em the jungle trolls ain't Darkspear and won't care who the Warchief is. You got anythin' to add, pal, I'm all ears, I'll write it down." } },
      choices = {
        { text = "Tell them never to sleep by the river.", next = "BACK", reply = "Never sleep by the river. Got it, that's goin' on the board in big letters. You maybe just saved me a couple of blank columns, friend.", fx = { affinity = 2 } },
        { text = "You've covered it. The jungle teaches the rest.", next = "BACK", reply = "Yeah, that's what worries me. It ain't a patient teacher, from what I hear." },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty", text = "Steamwheedle town on the south cape of Stranglethorn, and the only place on that whole coast you can get a decent drink. Everybody's welcome and nobody's safe, so watch your purse." } },
    steamwheedle = { { id = "tp_cartel", text = "They hold the contract, I fly the ship, and the auditors come twice a year. Keep your books clean and the Cartel's the best boss in the world, pal." } },
    advice = { { id = "tp_ad", text = "Check your gear before you board, not after. There ain't a shop between here and the jungle, and the ship don't turn around." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wanted a line to his people in the jungle and he paid for it up front. I never met the fella, but I'd fly him anywhere, half rate." } },
    forsaken = { { id = "tp_forsaken", text = "Quiet folks, pay their way, don't get airsick. I'd take a deck full of 'em over one seasick orc, and you can quote me." } },
    _none = { { id = "tp_none", text = "That ain't on my clipboard, friend. Try somebody who gets out more." } },
  },
}
