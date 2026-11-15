-- Southshore, the rest of the town: Dalaran's emissary, the town historian, the barkeep, a
-- former Kirin Tor mage chasing a new plague, the stablehand, the cook, the horse breeder and
-- the fishing trainer. Voice: bibles/southshore_more.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jacques", id = TODO_NPC("Emissary Jacques"), name = "Emissary Jacques",
  bible = "bibles/southshore_more.md", role = "noble", tier = "quest",
  communities = { "southshore" }, temper = { "formal" }, values = { "dutiful", "proud" },
  notices = { "class", "arcane" },

  impression = {
    first = "Emissary Jacques came down from Dalaran to ask the Alliance for help, and it plainly costs him something to ask. He is polite, careful with his words, and more frightened than he lets on.",
    third = "{name} met Emissary Jacques of the Kirin Tor, who came to Southshore seeking aid for the troubled city of Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Well met, traveller. I wish I came to Southshore bearing better news." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good; there are fewer of you willing to listen than I'd hoped." },
    { id = "g_sent", when = { questDone = TODO_QUEST("An Alarming Request") }, text = "Modera tells me you answered. The Kirin Tor won't say thank you aloud, so I'll say it for them." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You've studied the arcane; I can feel it on you like static. Then you'll understand what it means when a city's ley lines turn against it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Dalaran has never been comfortable asking the Light for help, but we're past comfortable now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Jacques, emissary of the Kirin Tor. Dalaran needs the aid of the Alliance's kingdoms, and I've been sent to ask for it quietly, which is harder than it sounds in a town this size." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("An Alarming Request") },
          text = "Archmage Modera's image waits near the city, beside Lordamere Lake. Go to her and she'll tell you more than I'm permitted to." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("An Alarming Request"), days = 7 } },
          text = "You've been inside the walls, then, and seen what we've been hiding. I'd ask you to keep it to yourself, but I suspect it's far too late for that." },
      },
      again = {
        { id = "h_again", text = "Is there more? Ask it quietly, if you would." },
        { id = "h_again2", text = "Go on. I've learned to listen in this town; it's the speaking I find difficult." },
      },
      choices = {
        { text = "What's happened in Dalaran?", next = "trouble" },
        { text = "Why keep it quiet?", next = "secret" },
        { text = "Who sent you?", next = "modera" },
        { text = "Isn't Dalaran in ruins?", next = "ruins" },
        { text = "I trained in Dalaran's ways. Tell me plainly.", next = "mage", when = { class = "MAGE" } },
        { text = "I'll think on it, Emissary.", next = "END" },
      },
    },

    trouble = {
      lines = {
        { id = "t_default", text = "Something has disrupted the ley lines beneath the city, and the constructs that serve us have turned erratic and destructive. We don't yet know the cause, only that the city is being overrun while the council debates." },
      },
      choices = {
        { text = "Constructs? What kind?", next = "trouble_constructs" },
        { text = "I'll go.", next = "BACK", when = { questBefore = TODO_QUEST("An Alarming Request") }, fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_constructs = {
      lines = {
        { id = "tc_default", text = "Guardians, servants, things we built to sweep floors and guard doors. A broom that attacks you is funny exactly once, and then it is very much not." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    secret = {
      big = true,
      lines = {
        { id = "s_default", text = "The high council fears the shame of it. Dalaran was the Alliance's pride once, and to admit we can't keep our own house in order, so soon after the war, would be a blow to the order's name." },
      },
      choices = {
        { text = "Pride is killing your city. Tell everyone.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Some secrets protect people. Keep it quiet.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "And you? What do you think?", next = "secret_you" },
      },
    },
    secret_you = {
      lines = {
        { id = "sy_default", text = "I think we can't keep up the charade forever, and that I'm standing in a town hall in Southshore asking strangers for help. That should tell you what I think." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    modera = {
      lines = {
        { id = "m_default", fx = { learn = { "alterac" } },
          text = "Archmage Modera dispatched me, and she's sent her image to wait near the city, by Lordamere Lake. It isn't strictly permitted, what she's doing, but she won't let pride turn away allies when we need them most." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ruins = {
      lines = {
        { id = "r_default", text = "Much of it, yes, since the Legion's lord burned it in the war. The Kirin Tor have been rebuilding behind our wards ever since, and the rebuilding is exactly where the trouble started." },
      },
      choices = {
        { text = "Did the war leave something behind?", next = "ruins_war" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    ruins_war = {
      lines = {
        { id = "rw_default", text = "That's one of the theories, and not the most comforting. I'm an emissary, not a scholar of ley lines, so I carry the questions and leave the answering to cleverer people." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mage = {
      lines = {
        { id = "ma_default", text = "Then plainly: the ley lines are wrong, the wards are failing in places, and senior magi are being sent to their rooms by their own furniture. If you can hold a shield spell, Modera wants you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the council permits me to say, and a little more besides. Choose carefully, and I'll answer as fully as I dare." } },
    background = { { id = "tp_bg", text = "I serve the Kirin Tor as a voice rather than a wand, which suits me; I was never much good with the wand." } },
    advice = { { id = "tp_ad", text = "If a construct in Dalaran stops to look at you, don't wait to see what it decides." } },
    alterac = { { id = "tp_alterac", text = "Dalaran's walls look down on what's left of Alterac. Neither is the neighbour it once was." } },
    _none = { { id = "tp_none", text = "That's beyond my brief, I'm afraid." } },
  },
}

P:NPC {
  key = "kundric", id = TODO_NPC("Kundric Zanden"), name = "Kundric Zanden",
  bible = "bibles/southshore_more.md", role = "scholar", tier = "quest",
  communities = { "southshore" }, temper = { "chatty" }, values = { "curious", "careful" },
  notices = { "lore", "race" },

  impression = {
    first = "Kundric Zanden is Southshore's historian, and he seems to regard the present mainly as material for later. He remembers the town's every flood, war and refugee boat, and expects me to as well.",
    third = "{name} met Kundric Zanden, Southshore's town historian.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Sit, sit, you'll be history someday, and I'd like your side of it first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've added you to my notes; nothing flattering yet, but there's time." },
    { id = "g_strahn", when = { questDone = TODO_QUEST("Strahnbrad Mystery") }, text = "There's my Strahnbrad correspondent! I've been through it all twice, and I'm still writing." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { class = { "MAGE", "PRIEST" } },
      text = "You've the look of someone who reads. Good; nobody in this town reads, and I'm tired of explaining what a century is." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Dun Garok's just up the road, you know, and your people's part in Southshore's history is badly underwritten. By me, mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kundric Zanden, historian of Southshore. Everyone else in town fishes, farms or fights, and someone has to write down what happened while they were doing it." },
        { id = "h_strahn_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Strahnbrad Mystery"), days = 7 } },
          text = "What you brought me from Strahnbrad has kept me up two nights running. Alterac's old roads still have stories in them, and the Syndicate would rather they stayed buried." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep writing while you think." },
        { id = "h_again2", text = "Go on. Every question's a footnote, and I love a footnote." },
      },
      choices = {
        { text = "Tell me Southshore's history.", next = "history" },
        { text = "What about Strahnbrad?", next = "strahnbrad" },
        { text = "What happened to Alterac?", next = "alterac" },
        { text = "What about Tarren Mill?", next = "tarren" },
        { text = "Why does history matter, out here?", next = "matter" },
        { text = "I'll leave you to your notes.", next = "END" },
      },
    },

    history = {
      lines = {
        { id = "hi_default", text = "A fishing village, until the boats came from Stormwind full of refugees, with Lothar and his young mage on the first one. A seaport in the Second War, and now one of the last human towns standing in Lordaeron." },
      },
      choices = {
        { text = "Who remembers the boats?", next = "history_boats" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_boats = {
      lines = {
        { id = "hb_default", text = "Marshal Redpath, for one; he was headman then. I've asked him to tell it a dozen times, and he tells it the same way every time, which in a historian's eyes makes him either honest or rehearsed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    strahnbrad = {
      lines = {
        { id = "st_default", text = "A town in the Alterac foothills, once, and now a nest of the Syndicate, who are Alterac's old nobility gone to banditry. Whatever's turned up there, I want to know about it, and I'll pay in gratitude." },
        { id = "st_done", when = { questDone = TODO_QUEST("Strahnbrad Mystery") },
          text = "You know as much about it now as I do, and you were there, which is more than I'll ever manage. I'm writing it up as we speak." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },

    alterac = {
      big = true,
      lines = {
        { id = "al_default", fx = { learn = { "alterac" } },
          text = "Its king, Perenolde, sold the Alliance to the Horde in the Second War, and Lordaeron took his kingdom apart for it. His nobles became the Syndicate, and some folk here still say Alterac's people paid for one man's treachery." },
      },
      choices = {
        { text = "Treason must be answered. Lordaeron was right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Punishing a kingdom for its king was wrong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tarren = {
      lines = {
        { id = "ta_default", text = "Our neighbour up the valley, before the plague. We shared the river, the fields and a good many marriages, and now the Forsaken live in it, which makes for an awkward chapter." },
      },
      choices = {
        { text = "Do you write about the Forsaken?", next = "tarren_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren_forsaken = {
      lines = {
        { id = "tf_default", text = "Carefully. Some of them were Tarren Mill folk once, and a few might remember being written about. I'd hate to be wrong about someone who could come and correct me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    matter = {
      lines = {
        { id = "m_default", text = "Because everyone forgets, and then they make the same mistakes with fresh faces. Southshore took in refugees once; I'd like it to remember that the next time strangers come to its door." },
      },
      choices = {
        { text = "A good reason.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a great deal that nobody's asked about in years. Please, ask about any of it." } },
    background = { { id = "tp_bg", text = "I write down Southshore; that's the whole of it, and more interesting than it sounds." } },
    advice = { { id = "tp_ad", text = "Keep a journal. Nobody remembers anything properly, least of all heroes." } },
    alterac = { { id = "tp_alterac", text = "A kingdom undone by its own king. I've three shelves on it and none of them are cheerful.", next = "alterac" } },
    syndicate = { { id = "tp_syndicate", text = "Nobles in masks. They have long family trees and short tempers." } },
    _none = { { id = "tp_none", text = "I've nothing on that, which annoys me more than you'd think." } },
  },
}

P:NPC {
  key = "kelly", id = TODO_NPC("Barkeep Kelly"), name = "Barkeep Kelly",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "jovial" }, values = { "friendly", "practical" },
  notices = { "drink", "class" },

  impression = {
    first = "Barkeep Kelly pours at the Southshore inn and seems to know every rumour in town before the town does. He trades in gossip the way Bilger trades in brew.",
    third = "{name} met Barkeep Kelly, who tends the bar at Southshore's inn.",
  },

  greetings = {
    { id = "g_default", text = "What'll it be, friend? The ale's Bilger's and the gossip's mine, and both are free with a coin." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Same as before, or are you feeling brave?" },
    { id = "g_talk", when = { questActive = TODO_QUEST("Talk of the Town") }, text = "Still on that little matter I asked about? No hurry, but don't let it go cold." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Somebody found the cellar before the bar! Was it Bilger's moonshine? Don't answer; I can tell by the eyes." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Bilger will want to talk to you, or hide from you, depending on his mood." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelly's the name, and I keep the bar. Anderson keeps the beds, Bilger keeps the cellar, and I keep track of who's saying what about whom, which is the real business of any inn." },
        { id = "h_talk_done", when = { questDone = TODO_QUEST("Talk of the Town") },
          text = "You saw to that business of mine, and folk have been talking about you since, so you're part of the talk of the town now. Enjoy it while it lasts." },
      },
      again = {
        { id = "h_again", text = "What else? I'm wiping the same mug, so I'm free." },
        { id = "h_again2", text = "Go on. Nobody's listening, and if they are, they'll tell me later anyway." },
      },
      choices = {
        { text = "Show me your drinks.", next = "BUSINESS" },
        { text = "What's the town talking about?", next = "gossip" },
        { text = "Tell me about Bilger.", next = "bilger" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "Is gossip any way to run an inn?", next = "gossip_right" },
        { text = "Just passing through.", next = "END" },
      },
    },

    gossip = {
      lines = {
        { id = "go_default", fx = { learn = { "syndicate" } },
          text = "The Syndicate, mostly, and who's been robbed this week, and whether the magistrate's shutters are bolted. The rest is fish prices and who's courting whom, and you're welcome to that too." },
        { id = "go_dalaran", when = { questDone = TODO_QUEST("An Alarming Request") },
          text = "Folk say something's gone wrong up in Dalaran, and that the fellow in the town hall in purple is begging for help. I don't believe half of what I hear, but I'm starting to believe that half." },
      },
      choices = {
        { text = "Anything about Tarren Mill?", next = "gossip_mill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_mill = {
      lines = {
        { id = "gm_default", text = "Only that the Forsaken are up to something with all those herbs and frogs. Phin Odelic's been asking about strange beasts, and Phin doesn't ask about anything without a reason." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },

    bilger = {
      lines = {
        { id = "b_default", text = "Best brewer north of Ironforge, and the worst at staying out of his own barrels. He was something grander once, they say, and we're all careful not to ask." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    regulars = {
      lines = {
        { id = "r_default", text = "Fishermen at dawn, guards at dusk, and Lieutenant Farren any time he can slip away from the beach. He drinks like a man trying to forget the murlocs, which he is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gossip_right = {
      big = true,
      lines = {
        { id = "gr_default", text = "It's the only way to run an inn. A barkeep who knows what's said can stop a fight before it starts, warn a man his horse is about to go missing, and keep the guards honest, more or less." },
      },
      choices = {
        { text = "Loose talk ruins people. Keep your counsel.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Knowledge is armour. Keep listening.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "You've come to the right man; I hear everything said in this town, eventually. What do you want to know?" } },
    background = { { id = "tp_bg", text = "I've poured drinks in Southshore longer than I'll admit, and I've no plans to stop." } },
    advice = { { id = "tp_ad", text = "Lock up your horse at night. The Syndicate love a good horse more than they love money." } },
    syndicate = { { id = "tp_syndicate", text = "Nobles in masks, thieving horses and murdering magistrates. They don't drink here, or if they do, they tip badly." } },
    _none = { { id = "tp_none", text = "Haven't heard a thing about it, and that's saying something." } },
  },
}

P:NPC {
  key = "phin", id = TODO_NPC("Phin Odelic"), name = "Phin Odelic",
  bible = "bibles/southshore_more.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "sharp" }, values = { "curious", "loyal" },
  notices = { "arcane", "class" },

  impression = {
    first = "Phin Odelic used to be Kirin Tor and now leads a little band chasing odd happenings around Hillsbrad. He's sure the Forsaken are brewing something, and he worries about his friends more than he admits.",
    third = "{name} met Phin Odelic, a former Kirin Tor mage in Southshore who suspects the Forsaken of brewing a new plague.",
  },

  greetings = {
    { id = "g_default", text = "Hail, and well met. Got a moment for a man who sees plots in dead dogs?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any news of my troublemakers?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Hints of a New Plague?") }, text = "Quae and Kinelory, Go'Shek Farm, Arathi. Please hurry; it's been days." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! You'll forgive me for staring; I don't meet many colleagues since I left the Kirin Tor, and fewer who'd admit to knowing me." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Good; if this is the plague I think it is, we'll need your sort, and plenty of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Phin Odelic. I lead a small group of adventurers looking into odd happenings around Hillsbrad, and lately there have been more odd happenings than I'm comfortable with." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hints of a New Plague?") },
          text = "My cousin Ray had to put down his dog Stanley. The poor beast grew to an unnatural size and went for anyone who came near, and I don't believe for a moment that happened on its own." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hints of a New Plague?"), days = 7 } },
          text = "So my two troublemakers are alive after all! Ha! Those two are irreplaceable, as friends and as company on the road, and I owe you for both of them." },
      },
      again = {
        { id = "h_again", text = "What else? I'm sorting Quae's notes, and her handwriting needs a translator." },
        { id = "h_again2", text = "Go on. Thinking out loud helps, and you're a better audience than the wall." },
      },
      choices = {
        { text = "What happened to Stanley?", next = "stanley" },
        { text = "Who are Quae and Kinelory?", next = "friends" },
        { text = "What do you think the Forsaken are doing?", next = "plague" },
        { text = "Why did you leave the Kirin Tor?", next = "kirintor" },
        { text = "What should be done about Tarren Mill?", next = "mill" },
        { text = "Good hunting, Phin.", next = "END" },
      },
    },

    stanley = {
      lines = {
        { id = "s_default", text = "A farm dog, friendly as anything, until he suddenly grew huge and savage and Ray had no choice. Something was put in that animal, and I mean to find out what, and who." },
      },
      choices = {
        { text = "Poisoned, you think?", next = "stanley_poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stanley_poison = {
      lines = {
        { id = "sp_default", text = "Poisoned, or tested on, which is worse. Dogs don't swell like that from bad meat, and the Forsaken have an apothecary up the valley with an awful lot of jars." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },

    friends = {
      lines = {
        { id = "f_default", text = "Two of my best, gone to the Go'Shek Farm in the Arathi Highlands to watch the orcs and anything the Forsaken bring them. They haven't checked in for days, and they always check in, if only to complain." },
        { id = "f_done", when = { questDone = TODO_QUEST("Hints of a New Plague?") },
          text = "Staying on at the farm a while longer, in case of reprisals, and sending me notes. Kinelory looks worse after a night in the tavern, Quae says, which I'll take as good news." },
      },
      choices = {
        { text = "I'll find them.", next = "BACK", when = { questBefore = TODO_QUEST("Hints of a New Plague?") }, fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    plague = {
      big = true,
      lines = {
        { id = "p_default", fx = { learn = { "new_plague" } },
          text = "Making a new plague, their own, to finish what the Scourge started. I've no proof yet, only a giant dog and a farm in Arathi where orcs and Forsaken keep strange company, but I'd stake my old robes on it." },
      },
      choices = {
        { text = "Then strike Tarren Mill before it's finished.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Find proof first. We can't act on suspicion.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why would they do it?", next = "plague_why" },
      },
    },
    plague_why = {
      lines = {
        { id = "pw_default", text = "Revenge on the living, I'd guess, or a weapon nobody else has. The Forsaken remember what was done to them, and some of them seem to want to share it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kirintor = {
      lines = {
        { id = "k_default", text = "I liked the questions more than the committees, and the Kirin Tor are mostly committees. Out here I chase a mystery for a week and nobody asks me to fill in a form about it." },
        { id = "k_jacques", when = { questDone = TODO_QUEST("An Alarming Request") },
          text = "And now the Kirin Tor send an emissary to Southshore to ask for help. If they're asking strangers, it's worse up there than Jacques is allowed to say." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mill = {
      lines = {
        { id = "mi_default", text = "Watch it, and learn what they're doing before anyone does anything foolish. Southshore and Tarren Mill trade blows every week; one more raid won't stop a plague, but the right piece of knowledge might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I collect odd happenings the way other men collect stamps. Pick one, and I'll tell you what I've pieced together." } },
    background = { { id = "tp_bg", text = "Dalaran trained me, the committees bored me, and Hillsbrad's mysteries kept me." } },
    advice = { { id = "tp_ad", text = "If an animal starts growing for no good reason, leave and tell someone." } },
    new_plague = { { id = "tp_plague", text = "I can't prove it, so call it a hunch with evidence. The Forsaken are brewing something.", next = "plague" } },
    _none = { { id = "tp_none", text = "Interesting, but not my mystery, I'm afraid." } },
  },
}

P:NPC {
  key = "malvew", id = TODO_NPC("Darren Malvew"), name = "Darren Malvew",
  bible = "bibles/southshore_more.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "gruff" }, values = { "hardworking", "loyal" },
  notices = { "mount", "animal" },

  impression = {
    first = "Darren Malvew is the stablehand in Southshore, and he loves his horses more than most people love anything. He swears on his granddaddy's grave that mountain lions are the worst of Hillsbrad's thieves.",
    third = "{name} met Darren Malvew, Southshore's stablehand, who blames the Alterac mountain lions for his lost horses.",
  },

  greetings = {
    { id = "g_default", text = "Ain't got time to jaw, friend, them horses won't brush themselves." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Well, at least you ain't a mountain lion." },
    { id = "g_active", when = { questActive = TODO_QUEST("Costly Menace") }, text = "Well? Less jawin', more huntin', hero." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Now that's a fine animal under you! Treat it right, and keep it away from them hills." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darren Malvew, stablehand. Ain't nothin' irks me more than losin' these beautiful horses, and we've lost a heap to the undead, the Syndicate and every scoundrel in the hills. But the mountain lions are worse than all of 'em." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Costly Menace"), days = 5 } },
          text = "Now ain't that fine news! Should've found me a proper war hero from the start, and saved myself a dozen good horses." },
        { id = "h_later", when = { questDone = TODO_QUEST("Costly Menace") },
          text = "Ain't lost a single foal since you went up them hills. The horses are sleepin' easier, and so am I." },
      },
      again = {
        { id = "h_again", text = "Something more? You can talk while I brush; the mare won't mind." },
        { id = "h_again2", text = "Go on, the horses don't mind listenin'." },
      },
      choices = {
        { text = "Why the mountain lions?", next = "lions" },
        { text = "Who else takes your horses?", next = "thieves" },
        { text = "Tell me about your horses.", next = "horses" },
        { text = "Should we hunt every lion in Alterac?", next = "hunt" },
        { text = "I'll keep an eye out.", next = "END" },
      },
    },

    lions = {
      lines = {
        { id = "l_default", text = "They come down from Alterac every night, bold as you like, and take a foal right out from under its mother's nose. The undead and the Syndicate only steal horses; the lions eat 'em." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", when = { questBefore = TODO_QUEST("Costly Menace") }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thieves = {
      lines = {
        { id = "t_default", fx = { learn = { "syndicate" } },
          text = "Syndicate riders out of Durnholde, mostly, and the dead from up the valley when they get a mind to. I lock the stable every night, and some mornings it's still open." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horses = {
      lines = {
        { id = "h2_default", text = "Best stock in Lordaeron, every one of 'em, and Merideth won't sell a one of 'em to anyone she don't trust. I just feed 'em, brush 'em and fret over 'em." },
      },
      choices = {
        { text = "Merideth breeds them?", next = "horses_merideth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses_merideth = {
      lines = {
        { id = "hm_default", text = "That she does, and she's sharp as a pitchfork and twice as pointy. Folk say she's a bit mad, and I say she knows horses better than any of 'em, so I don't mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hunt = {
      big = true,
      lines = {
        { id = "hu_default", text = "Every last one? I'd say yes on a bad night. On a good one, I reckon they're just hungry, same as anything else up there." },
      },
      choices = {
        { text = "The town's horses come first. Thin them hard.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Leave the hills wild. Build a better fence.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know horses and the things that take 'em, and that's about it, friend. What you want?" } },
    background = { { id = "tp_bg", text = "I brush horses in Southshore and swear at lions; my granddaddy did the same." } },
    advice = { { id = "tp_ad", text = "Don't leave your horse tied by the road overnight, not round here." } },
    syndicate = { { id = "tp_syndicate", text = "Horse thieves with fancy names. I'd as soon see 'em eaten by lions." } },
    _none = { { id = "tp_none", text = "Don't know nothin' about that, friend." } },
  },
}

P:NPC {
  key = "jessen", id = TODO_NPC("Chef Jessen"), name = "Chef Jessen",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "proud" }, values = { "proud", "generous" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Chef Jessen claims Southshore has the best cooking north of Stormwind and that folk came from Darkshire for his turtle bisque. He hasn't made it in a while, and it pains him to say why.",
    third = "{name} met Chef Jessen, Southshore's cook, famous for his Soothing Turtle Bisque.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course you are. Everyone's hungry who smells my kitchen." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, are you? Good, I like a customer who knows what's what." },
    { id = "g_active", when = { questActive = TODO_QUEST("Soothing Turtle Bisque") }, text = "Any turtle meat yet? The pot's waiting, and so is half of Southshore." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! I can tell by the burns. We'll talk, you and I, but you're not getting my bisque recipe." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Chef Jessen. If there's one thing you'll learn in Southshore, it's that we cook better here than anywhere north of Stormwind, and my turtle bisque is the proof. Or it was, when I could make it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Soothing Turtle Bisque"), days = 5 } },
          text = "The bisque is back on the menu! Folk were queuing round the inn last night, and one old fisherman wept into his bowl, and I didn't charge him." },
      },
      again = {
        { id = "h_again", text = "Something more? Mind the steam, and talk while I stir." },
        { id = "h_again2", text = "The bisque needs another hour, so I'm yours until it does." },
      },
      choices = {
        { text = "Show me what you're selling.", next = "BUSINESS" },
        { text = "Why can't you make the bisque?", next = "bisque" },
        { text = "What's in it?", next = "recipe" },
        { text = "Do folk really come from Darkshire?", next = "darkshire" },
        { text = "Is good cooking worth risking lives for?", next = "worth" },
        { text = "Smells good. Goodbye.", next = "END" },
      },
    },

    bisque = {
      lines = {
        { id = "b_default", text = "I used to go up past Dalaran to Lordamere Lake myself and hunt the snapjaws for the meat. It's too dangerous now, with the unrest in the hills, and a cook with an arrow in him makes poor soup." },
      },
      choices = {
        { text = "I'll bring you turtle meat.", next = "BACK", when = { questBefore = TODO_QUEST("Soothing Turtle Bisque") }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    recipe = {
      lines = {
        { id = "r_default", text = "Turtle, and the rest is a secret I'll take to my grave. I'll tell you this much: it's soothing, it's in the name, and a bowl of it makes even Farren stop complaining for a quarter hour." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    darkshire = {
      lines = {
        { id = "d_default", text = "I've known folk to come all that way for a bowl, and I'd come from Darkshire too if I lived there; I'd come from anywhere to get away from Darkshire. Maybe the bisque was only part of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    worth = {
      big = true,
      lines = {
        { id = "w_default", text = "Now you sound like my mother. A town that can't eat well forgets why it bothers fighting at all, but I won't pretend a bowl of soup's worth a life." },
      },
      choices = {
        { text = "A good meal is worth fighting for.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Soup's soup. Stay home and stay alive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know food, and who in Southshore eats what, and who doesn't pay. Ask away." } },
    background = { { id = "tp_bg", text = "I cook in Southshore, and I'm the best at it, and that's my story." } },
    advice = { { id = "tp_ad", text = "Eat before you go up into Alterac; the ogres won't feed you." } },
    _none = { { id = "tp_none", text = "Can't help you there, friend, unless it's about soup." } },
  },
}

P:NPC {
  key = "merideth", id = TODO_NPC("Merideth Carlson"), name = "Merideth Carlson",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "proud" }, values = { "proud", "stubborn" },
  notices = { "class", "mount" },

  impression = {
    first = "Merideth Carlson breeds Southshore's horses and won't sell them to just anyone. The Silver Hand once called her mad, and she has not forgiven them, or the rest of the world, for it.",
    third = "{name} met Merideth Carlson, Southshore's horse breeder, who once claimed she could feed a spirit horse.",
  },

  greetings = {
    { id = "g_default", text = "These are the finest horses in Lordaeron, so look, but don't touch." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you come to buy, or only to admire?" },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A PALADIN. Of course. Come to call me mad as well, have you?" },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Hm, that beast you're riding could use a good feed and a better rider. Well, the feed I can help with." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Merideth Carlson, horse breeder. My steeds go to the people of Stormwind, and to those Stormwind trusts completely, and to no one else, because I won't see them in an enemy's hands." },
        { id = "h_human", when = { race = "Human" },
          text = "One of Stormwind's own, I see, so you may buy if you can afford it. A horse is a companion for years, so choose with your head, not your eyes." },
        { id = "h_exalted", when = { reputation = { faction = "Stormwind", min = "exalted" } },
          text = "Stormwind trusts you completely, I'm told, and so I'll trust you a little. Take your time choosing." },
        { id = "h_feed", tags = { "news" }, when = { questActive = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "Have you got the biscuits, and the gold? Yes, the gold, all of it, because I've earned every coin of it in misery." },
        { id = "h_feed_done", when = { questDone = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "You paid me for wrongs you didn't commit, paladin. I misjudged you, and I don't say that often, but I'm keeping the money." },
      },
      again = {
        { id = "h_again", text = "Anything else? The horses are watching you, and so am I." },
        { id = "h_again2", text = "Go on, then, but don't spook the mares." },
      },
      choices = {
        { text = "Let me see your horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
        { text = "Why won't you sell to everyone?", next = "trust" },
        { text = "Why did the Silver Hand call you mad?", next = "mad" },
        { text = "I need feed for a spirit horse.", next = "feed", when = { class = "PALADIN", minLevel = 60 } },
        { text = "Was the Silver Hand wrong about you?", next = "silverhand" },
        { text = "Fine horses. Good day.", next = "END" },
      },
    },

    trust = {
      lines = {
        { id = "t_default", text = "Because a good horse is a weapon, as surely as a sword, and I'll not arm the Syndicate or the dead. Earn Stormwind's trust and come back; I'll sell to you then, gladly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mad = {
      lines = {
        { id = "m_default", text = "Because I said I could make a feed to nourish spirit horses, the kind paladins call to them. They laughed, every one, and some called me worse things than mad." },
      },
      choices = {
        { text = "Can you?", next = "mad_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_can = {
      lines = {
        { id = "mc_default", text = "Of course I can! It takes manna biscuits that only the Argent Dawn sell, and a great deal of patience. Some day a paladin will come asking, and then we'll see who's mad." },
        { id = "mc_done", when = { questDone = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "And now I have, and the horse ate it, and I was right all along. You've no idea how good that feels." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },

    feed = {
      lines = {
        { id = "f_default", text = "Oh, so NOW the Silver Hand needs me? Bring me twenty enriched manna biscuits from the Argent Dawn, and gold, a good deal of it, for my ruffled feelings. Show me the sacrifice you all talk about so much." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "silver_hand" } } } },
    },

    silverhand = {
      big = true,
      lines = {
        { id = "sh_default", text = "Wrong? They were cruel, which is worse. Proud men, the lot of them, so sure the Light only spoke through them that they couldn't hear a horse breeder from Southshore." },
      },
      choices = {
        { text = "They were wrong. You deserve an apology.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Grudges are poison. Let it go.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, feed, and the faults of the Silver Hand; I know them all very well. Which?" } },
    background = { { id = "tp_bg", text = "I breed horses, and I was right about the feed, and those are the important things." } },
    advice = { { id = "tp_ad", text = "Never buy a horse that won't look you in the eye." } },
    silver_hand = { { id = "tp_silverhand", text = "Laughed at me, all of them, and now they'll come to me for feed. I'll remember every name.", next = "silverhand" } },
    _none = { { id = "tp_none", text = "If it isn't about horses, then I'm not interested." } },
  },
}

P:NPC {
  key = "rabonne", id = TODO_NPC("Donald Rabonne"), name = "Donald Rabonne",
  bible = "bibles/southshore_more.md", role = "trainer", tier = "service",
  communities = { "southshore" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Donald Rabonne teaches fishing from the Southshore docks and treats the bay as his parish. He's seen murlocs, naga and refugee boats come in on the same tide and judges none of them by their fins.",
    third = "{name} met Donald Rabonne, who teaches fishing on the Southshore docks.",
  },

  greetings = {
    { id = "g_default", text = "Easy on the boards, friend, fish can hear you walking." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The tide's good, so let's get you casting." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher, good! Lindea's got the bait, I've got the lessons, and the bay's got everything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Donald Rabonne. I teach fishing, and Lindea there sells the gear, and the bay pays both of us if we're patient. It's been a fishing town longer than anything else, Southshore, and it'll be one after." },
        { id = "h_coast", when = { questDone = TODO_QUEST("Down the Coast") },
          text = "Someone cleared the Torn Fin off the Western Strand, and the fishermen got their nets back. I thought it'd be the lieutenant, but he's still sulking at the inn." },
      },
      again = {
        { id = "h_again", text = "The line's in the water, so I've all the time in the world. Ask away." },
        { id = "h_again2", text = "Go on, softly now." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "How's the fishing in the bay?", next = "bay" },
        { text = "Do you know Lindea well?", next = "lindea" },
        { text = "What about the murlocs on the coast?", next = "murlocs" },
        { text = "Tight lines.", next = "END" },
      },
    },

    bay = {
      lines = {
        { id = "b_default", text = "Good, if you stay close in. Murlocs further down the strand, naga out past the point, and ships that come in looking ragged. The fish don't care about any of it, which I admire." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lindea = {
      lines = {
        { id = "l_default", text = "We've worked these docks side by side so long that folk stopped asking how we're related. I don't tell them, and neither does she, and it keeps them guessing." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "m_default", text = "They fish the same water we do, and they're better at it, which is half the trouble. The other half is they've started taking nets, and then fishermen, and that I can't forgive." },
      },
      choices = {
        { text = "Drive them off the strand for good.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave them the strand. Fish the bay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the bay, the tides and the murlocs' bad habits. Pick one." } },
    background = { { id = "tp_bg", text = "Southshore fisherman, Southshore teacher; that's the beginning and the end." } },
    advice = { { id = "tp_ad", text = "Fish the turning tide, and keep one eye on the strand." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask me about tides." } },
  },
}
