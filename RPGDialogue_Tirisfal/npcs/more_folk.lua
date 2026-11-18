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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yvette Farthing. My father worked the Agamands' mills, and I meant to marry into the family that owned them, and now we sit in the Gallows' End because there's nowhere else that will have us." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("A Letter Undelivered") },
          text = "That hand on the envelope is Thurman's. I'd know it anywhere, even now. Where did you find it, {class}?" },
        { id = "h_done", when = { questDone = TODO_QUEST("A Letter Undelivered") },
          text = "I've read it twice, which is once more than I should have. Regrets are for the weak, and I've no use for them, but I'm glad to know what became of him." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick about it, or be quiet." },
        { id = "h_again2", text = "Go on. My father's asleep in his chair, or doing whatever it is we do instead." },
      },
      choices = {
        { text = "I found a letter at Agamand Mills. It's addressed to you.", next = "letter", when = { questActive = TODO_QUEST("A Letter Undelivered") } },
        { text = "Who was Thurman Agamand?", next = "thurman" },
        { text = "You came from Agamand Mills?", next = "mills" },
        { text = "Your father looks like he carries a heavy load.", next = "father" },
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
    { id = "g_default", text = "Keep your hands off the shelf unless you mean to buy. Some of these books bite, and the rest are worse." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. Good; I was beginning to think Rupert had frightened all the custom away." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How is your little friend behaving?" },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Your {pet} is looking at my books with far too much interest. Tell it to sit, or I'll tell it for you." },
    { id = "n_notlock", cat = "class", when = { class = { "WARRIOR", "ROGUE", "PRIEST", "MAGE" } },
      text = "You're no warlock, so I've nothing to sell you, but you're welcome to stand there and be curious. Most are." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, reading my spines from a safe distance. Your masters in Dalaran had a locked room for books like these, and I always thought the lock said more about them than the books did." },
  },

  start = "hello",
  nodes = {
    backtalk = {
      lines = {
        { id = "bt_default", text = "Then it is an imp, because nothing else in the Nether talks half so much. There is no grimoire that will shut its mouth, {class}, but a demon that is kept busy with new work has less breath left for insolence." },
        { id = "bt_void", when = { pet = { family = "Voidwalker" } }, text = "A voidwalker that talks back is a rare thing, and I would watch it closely, because they usually save their hatred up in silence. Keep it busy with new work, {class}, and let it spend its temper on your enemies." },
      },
      choices = {
        { text = "Then I'll keep it busy and let it sulk.", next = "BACK", reply = "Let it sulk as loudly as it likes, so long as it obeys. Sulking is the only freedom it has left, and it costs you nothing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    kinds = {
      lines = { { id = "k_default", text = "The imp is the noisiest, but the trouble comes from the succubus, who is the only one clever enough to make her master enjoy being led. I sell her books to warlocks who have a few years behind them, and I tell them twice to read the warnings." } },
      choices = {
        { text = "And the voidwalker?", next = "kinds2" },
        { text = "Something else.", next = "BACK" },
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
        { text = "Something else.", next = "BACK" },
      },
    },
    rupert2 = {
      lines = { { id = "ru2_default", text = "Well enough, since neither of us wants the other's work. Kayla Smithe sells the first books down in Deathknell, to pupils who can barely stand, and by the time they reach Brill they have usually learned which end of an imp bites." } },
      choices = {
        { text = "So the trade runs from the grave to your shelf.", next = "BACK", reply = "From the grave to Kayla, from Kayla to me, and from me to the Undercity, if they last that long. A fair number of them do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ageron Kargal. Rupert Boch teaches the warlocks of Brill their spells, and I teach their demons manners, which is the harder job by some distance." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Your demon knows what it was summoned knowing, {class}, and not a scrap more. A grimoire from me will teach it something new, if you've the coin and it's the right book for its kind." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Ageron Kargal, and I teach demons their manners. Your orcs know something about demons, I'm told, though they learned it the expensive way, and my books are a good deal cheaper." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the candles." },
        { id = "h_again2", text = "Ask, then. The books will keep." },
        { id = "h_again3", text = "Was there something more? The imps on this shelf have no patience, and I have only a little." },
      },
      choices = {
        { text = "Show me the grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do you teach a demon anything?", next = "grimoires" },
        { text = "Odd place to keep demon books, a tavern.", next = "tavern" },
        { text = "My demon talks back more than I'd like.", next = "backtalk", when = { class = "WARLOCK" } },
        { text = "Which demon gives its master the most trouble?", next = "kinds" },
        { text = "You and Rupert Boch seem to share a trade.", next = "rupert" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    grimoires = {
      lines = { { id = "gr_default", text = "You don't teach it, you instruct it. Each grimoire binds a new trick into the demon's leash, a firebolt for an imp or a sacrifice for a voidwalker, and the demon learns because it can't refuse." } },
      choices = {
        { text = "Do the demons resent it?", next = "leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = { { id = "le_default", text = "Every moment of every day. An imp will tell you so, loudly, and a voidwalker will tell you nothing and mean it more. The warlock who forgets that his servant hates him doesn't stay a warlock long." } },
      choices = {
        { text = "Then they're weapons, and weapons should be kept sharp.", next = "BACK", reply = "Spoken like a sensible master. Sharp, and on a short leash, and never left alone in the room.", fx = { align = { light = -1 } } },
        { text = "Binding anything that hates you seems a fool's bargain.", next = "BACK", reply = "Perhaps it is. But the Forsaken bargain with worse every day, and the demons at least are honest about it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tavern = {
      lines = { { id = "t_default", text = "Where else? The Undercity has its own trainers, and Brill has the newly risen coming up from Deathknell with an imp at their heel and no notion what to do with it. Renee doesn't mind, so long as nothing catches fire." } },
      choices = {
        { text = "Has anything caught fire?", next = "fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Once or twice, and never anything that mattered. Imps are spiteful, not ambitious, and a singed tablecloth is about the limit of their imagination." } },
      choices = {
        { text = "That's reassuring, in a way.", next = "BACK" },
        { text = "Something else, Ageron.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "The things I deal with are the smallest and stupidest of the Legion's servants, and that's precisely why they can be leashed. I'd not sell a book for anything larger." } },
    background = { { id = "tp_bg", text = "I studied in Lordaeron before the Plague, quietly, because the Kirin Tor did not approve. They have bigger problems now." } },
    advice = { { id = "tp_ad", text = "Never let your demon see you hesitate. It will remember." } },
    forsaken = { { id = "tp_forsaken", text = "We are a people who were leashed once and slipped the leash, which gives a Forsaken warlock a certain sympathy for his demon. I advise my customers not to indulge it." } },
    trade = { { id = "tp_trade", text = "The Magic Quarter has demon trainers of its own and better shelves than mine. I stay in Brill because the beginners are here, and beginners buy more books than masters do." } },
    _none = { { id = "tp_none", text = "Not my subject. Ask me about imps and you'll get an answer." } },
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
        { id = "h_again", text = "What else would you ask the caretaker?" },
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
    trainers = {
      lines = {
        { id = "tr_default", text = "The Gallows' End houses most of them. Rupert Boch teaches warlocks and Cain Firesong teaches mages, Marion Call sees to the rogues, and Austil de Mon drills warriors with more shouting than I think is strictly required." },
        { id = "tr_priest", when = { class = "PRIEST" }, text = "For a priest, that is Dark Cleric Beryl, in the Gallows' End with the rest of them. The other trainers keep rooms there too, should your companions need one." },
      },
      choices = {
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
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on. I'm listening, and watching." },
        { id = "h_again3", text = "Is there another location you require? I know them all, and the distances between them." },
      },
      choices = {
        { text = "Where can I find the Executor?", next = "directions" },
        { text = "You seem very sure of your duty.", next = "duty" },
        { text = "I'm here to motivate you. Executor's orders.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "I need a trainer, Deathguard.", next = "trainers" },
        { text = "You keep a close eye on the other guards.", next = "others" },
        { text = "How does Brill look to one of the living?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
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
    view = {
      lines = { { id = "v_default", text = "It does, and I've earned it. From here I can see the Gallows' End door, the Executor's back and the road in from Deathknell, which is all three of the things a guard in Brill needs to keep an eye on." } },
      choices = {
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
    window = {
      lines = { { id = "wi_default", text = "North as far as the fences at Garren's Haunt on a clear day, and east to where the road bends toward Brightwater Lake. On a clear night I can see the lanterns at the Scarlet tower away to the west, and I count them, for something to do." } },
      choices = {
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
        { id = "h_again", text = "Something else, while you're up here?" },
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
    stores = {
      lines = { { id = "st_default", text = "Renee's casks, for the living guests and for the dead ones who like to hold a mug. Past those are the Executor's stores for the town, lamp oil and bandages and arrows, which are the real reason a Deathguard stands on these stairs." } },
      choices = {
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
        { text = "Mine stays on a short leash.", next = "BACK", reply = "See that it does, {class}. I've a bucket of sand by the stairs, and I'm not particular about whether it lands on the fire or the imp." },
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
        { id = "h_again2", text = "Go on, then." },
        { id = "h_again3", text = "What else do you want to know? I've a whole cellar of time down here." },
      },
      choices = {
        { text = "What comes down the stairs at closing?", next = "closing" },
        { text = "Where would I find Innkeeper Renee?", next = "directions" },
        { text = "Executor Zygand sends his regards. And his motivator.", next = "motivate", when = { questActive = TODO_QUEST("Discipline") } },
        { text = "What's actually kept down here?", next = "stores" },
        { text = "You hear the whole tavern through that ceiling.", next = "ceiling" },
        { text = "Does Ageron's shelf upstairs ever worry you?", next = "ageron", when = { class = "WARLOCK" } },
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
    boots = {
      lines = { { id = "bo_default", text = "I do, because boots tell the truth. A purse can be borrowed and a sword can be stolen, but nobody walks in from the Glades with good soles unless they've had the sense to look after themselves." } },
      choices = {
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
    ambition = {
      lines = { { id = "am_default", text = "I do, and I don't see why not. A living smith gets forty good years at the anvil if his back holds, and I've got as long as my arms stay on, so all I need is somebody to show me what I'm doing wrong." } },
      choices = {
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
        { id = "h_again", text = "Anything else? I've an edge to finish." },
        { id = "h_again2", text = "Go on. I can talk and file." },
        { id = "h_again3", text = "What else can I tell you? Ask me while this cools." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What happened to your master?", next = "master" },
        { text = "Plain work is all most of us need.", next = "plain" },
        { text = "You mean to be a master one day.", next = "ambition" },
        { text = "What do people in Brill ask you for most?", next = "custom" },
        { text = "I work a forge myself, Oliver.", next = "shop", when = { profession = "Blacksmithing" } },
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
    barley = {
      lines = { { id = "ba_default", text = "I did, on a good piece of land that drained well and caught the morning sun. It's all grey stubble now, and the last time I walked out to look at it there were duskbats roosting in what's left of my barn." } },
      choices = {
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
    fitting = {
      lines = { { id = "fi_default", text = "It's awkward more than thankless. Nobody comes back the size they went in, so a man who was fitted for his own mail in life finds it hangs off him like a sack, and I have to tell him why." } },
      choices = {
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
      },
      again = {
        { id = "h_again", text = "Something else? There's a line behind you, or there will be." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "What else? Ask quick, the iron's hot." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Where do you get the metal out here?", next = "metal" },
        { text = "I don't think armor suits me.", next = "suits" },
        { text = "Fitting the newly risen must be thankless work.", next = "fitting" },
        { text = "Who else keeps shop in Deathknell?", next = "shops" },
        { text = "Was any of this Scarlet iron once paladin's plate?", next = "plate", when = { class = "PALADIN" } },
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
    before = {
      lines = { { id = "be_default", text = "A clerk, if you can credit it. I kept the tally books for the grain merchants in this very town, and I could tell you the price of a bushel in any month of the last ten years I was breathing." } },
      choices = {
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
        { id = "h_again", text = "Anything else?" },
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
