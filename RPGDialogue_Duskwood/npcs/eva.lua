-- Madame Eva, fortune-teller, Darkshire. Voice: bibles/eva.md
-- The old arts. Cards, stars, and a voice that makes the candles lean.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eva", id = TODO_NPC("Madame Eva"), name = "Madame Eva",
  bible = "bibles/eva.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "steady" }, values = { "curious", "cunning" },
  spiritSensitive = true,
  notices = { "fate", "fel" },

  impression = {
    first = "Madame Eva behaved as though she had been expecting me for some time. I've no idea how she could have known, and I've decided not to ask.",
    third = "{name} called on Madame Eva, the Darkshire fortune teller who reads the cards and seems to know her visitors before they arrive.",
  },

  greetings = {
    { id = "g_expected", text = "Ah, there you are, {name}. The stars said you would come; they did not say you would be so late." },
    { id = "g_back", when = { metBefore = true }, text = "Sit, please. The cards have been restless since you left." },
    { id = "g_comb", when = { questActive = TODO_QUEST("Return the Comb") }, text = "You have seen Blind Mary; it is written on your face. Give me the comb, child." },
  },

  notice = {
    { id = "n_deaths", cat = "fate", when = { deaths = { min = 10 } },
      text = "The cards keep turning up Death for you, and Death keeps sending you back. I think it finds you amusing, so do not test it." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You carry something that does not belong to this world, and the cards will not lie flat while you stand there. Step back a little, please." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "There is a shadow at your shoulder that is not yours; I see it in the candle. Don't turn around, because it doesn't like to be looked at." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Madame Eva, and I follow the old arts. I read what the cards say and what the stars refuse to, and while horrors wait in the night here, I simply know their names." },
        { id = "h_shadowy", tags = { "news" }, when = { questActive = TODO_QUEST("The Shadowy Figure") },
          text = "There was a figure in the fog, watching the farm where the Yorgens died. The cards show me a frightened man rather than a monster, so go and find him." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") },
          text = "Ghost hair thread, for the hermit? I have none spun, but I can make it if someone brings me the hair, and I rather think that someone is you." },
        { id = "h_mary", when = { questActive = TODO_QUEST("Ghost Hair Thread") },
          text = "Blind Mary will weep when you ask her to comb her hair, and you must let her weep. Then bring me the comb, and don't look back at the house." },
        { id = "h_totem", when = { questActive = TODO_QUEST("The Totem of Infliction") },
          text = "The totem is made of suffering, and I need it whole. Bring me what it asks for, and do not ask me what it does." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "The cards show me a manor, and a teacher with a gentle hand and something hidden behind his back. Follow the letters, for they lead uphill." },
        { id = "h_new", when = { maxLevel = 20 },
          text = "So young, to be walking in Duskwood! The stars are fond of you, though that isn't always a kindness." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The cards don't know what to make of you, and they keep turning up the Wind, which has never come up twice in one night before." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Light, at my table. Your Church calls my work superstition, but sit anyway; the cards don't mind being doubted." },
        { id = "h_cards", when = { metBefore = true }, text = "The cards turned up the Tower again this morning, as they always do in Duskwood, and I've stopped charging extra for it." },
      },
      again = {
        { id = "h_again", text = "There is more, child; there is always more, so ask." },
        { id = "h_again2", text = "The candle hasn't gone out yet, so go on." },
      },
      choices = {
        { text = "Read my cards.", next = "cards" },
        { text = "What waits in the night?", next = "night" },
        { text = "Who is Blind Mary?", next = "mary" },
        { text = "Why does Stalvan frighten you?", next = "granddaughter", when = { questActive = TODO_QUEST("The Legend of Stalvan") } },
        { text = "What is ghost hair thread really for?", next = "thread", when = { questDone = TODO_QUEST("Return the Comb") } },
        { text = "The Light doesn't need cards.", next = "priest", when = { class = "PRIEST" } },
        { text = "Deal for me. If you dare.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },

    cards = {
      lines = {
        { id = "c_default", text = "The Traveller, the Tower reversed, and the Raven, which in Darkshire means only that you'll be here a while." },
        { id = "c_light", when = { alignment = { axis = "light", min = 40 } },
          text = "The Sun, burning in a dark room. It's a good card, but a lonely one." },
        { id = "c_hand", once = true, when = { heardLine = "pool:spirithealer.pr_default" }, fx = { hear = "spirithealer_other_hand" },
          text = "Death, upright, and across it someone has written 'not here, not yet' in a neat hand that isn't mine. I did not write that, so tell me who you have been talking to." },
        { id = "c_lantern", when = { heardLine = "pool:spirithealer.ln6" },
          text = "The Lantern. I have dealt that card for forty years and never once seen it lit, and tonight it burns, so someone, somewhere, has stopped waiting." },
        { id = "c_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "The Knife, again, every time I deal for you. I've stopped shuffling, since it makes no difference." },
      },
      choices = {
        { text = "What does that mean?", next = "mean", fx = { trait = { curious = 1 } } },
        { text = "I don't believe in cards.", next = "cards_doubt", fx = { trait = { skeptical = 1 } } },
        { text = "Deal again.", next = "cards_again" },
      },
    },
    mean = {
      lines = { { id = "m_default", text = "It means you will pay me for the reading; everything else is up to you." } },
      choices = { { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    cards_doubt = {
      lines = {
        { id = "cd_default", text = "Good, because believers tip badly. The cards were right long before you arrived, and they've never once asked my permission." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
    cards_again = {
      lines = {
        { id = "ca_default", text = "No. A second deal is a second question, and you haven't asked one yet, so ask the real one and I'll turn a single card." },
      },
      choices = {
        { text = "Will I live through Duskwood?", next = "cards_live" },
        { text = "Never mind.", next = "BACK" },
      },
    },
    cards_live = {
      big = true,
      lines = {
        { id = "cl_default", text = "Death. In Darkshire that card means change, and it also means death, and you'll learn which in time, as everyone does." },
        { id = "cl_deaths", when = { deaths = { min = 10 } },
          text = "Death, again, and it keeps sending you back to me. I think it rather likes the conversation." },
      },
      choices = {
        { text = "Then I'll change.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's no answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    night = {
      big = true,
      lines = {
        { id = "n_door", when = { heardLine = "pool:spirithealer.dr_default" },
          text = "The dead and the wolves, and the men who choose to be monsters, and past them all a door. You've heard of it, I see; the cards call it the Threshold, and I beg you not to knock." },
        { id = "n_default", text = "The dead walking and the worgen howling, and men who choose to be monsters, who are worse than either, because they could have chosen otherwise." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { learn = { "stalvan" } } },
        { text = "Which men?", next = "night_men" },
        { text = "And the dead? Are they restless?", next = "night_spirits" },
      },
    },
    night_men = {
      lines = {
        { id = "nm_default", text = "A tutor with something behind his back, and a wizard on the hill above Raven Hill who buys the dead. Duskwood grows them the way other places grow apples.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    night_spirits = {
      lines = {
        { id = "ns_default", text = "Restless, and full of complaint; they whisper in my ear all night long. It is cold where they are, they tell me, and I believe them." },
      },
      choices = {
        { text = "Can you help them?", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mary = {
      lines = {
        { id = "ma_default", text = "She is a poor, sad spirit in the old farmhouse south of town. She was lovely once, and carried a looking glass wherever she went." },
      },
      choices = {
        { text = "What happened to her?", next = "mary_eyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mary_eyes = {
      lines = {
        { id = "me_default", text = "The dead took her and left her something worse than dead, so she tore out her own eyes, never to see what she'd become. Speak softly when you're there." },
      },
      choices = {
        { text = "That's terrible.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    granddaughter = {
      big = true,
      lines = {
        { id = "gd_default", text = "Because of Alyssa, my granddaughter. Death lay on the table for her, and after a long trance I found one name beside it, Stalvan, so bring me proof he can harm no one." },
      },
      choices = {
        { text = "Does she know?", next = "granddaughter_know" },
        { text = "I'll find him.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I won't hunt a man down on the word of a card.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    granddaughter_know = {
      lines = {
        { id = "gk_default", text = "Of course not. Would you tell someone you love that you'd seen her die in a card? I tell her to stay indoors, and she thinks I'm simply old." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    thread = {
      lines = {
        { id = "th_default", text = "It has a thousand uses, from binding spirits and mending to sewing life into things that never had any. I don't ask a customer which use he means." },
      },
      choices = {
        { text = "Maybe you should.", next = "thread_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread_ask = {
      lines = {
        { id = "ta_default", text = "Perhaps. He pays, he's kind, and the cards turn up the Needle whenever his name is spoken, so I have decided not to think about the Needle." },
        { id = "ta_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I should have asked. I know what walked down that road and whose thread held it together, because the cards told me, and I didn't want to hear them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "No, it doesn't, because your Light is a lamp and my cards are a window, and that's different work. But tell me, priest: when you pray over the dead here, do they answer?" },
      },
      choices = {
        { text = "Sometimes.", next = "priest_answer" },
        { text = "The dead should rest, not answer.", next = "BACK", fx = { affinity = -1, trait = { pious = 1 } } },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Then you know more than your Church admits. Come and tell me what they say some evening, and we'll compare notes." },
      },
      choices = { { text = "Some evening, then.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "I would rather not. Your cards come up the same every time: a door left open, and something beyond it that knows your name." },
      },
      choices = {
        { text = "It does know my name.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Whatever's beyond that door, I keep it shut.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The cards show me a great many things, child, and the people of Darkshire show me the rest. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I follow the old arts, the cards and the stars and the spirits who will not keep quiet. The rest of my story costs extra." } },
    advice = { { id = "tp_ad", text = "When the cards and the Night Watch disagree, believe the Watch, because they're wrong less often. I'll deny I ever said so." } },
    stalvan = { { id = "tp_stalvan", text = "His card is the Tutor, patient and gentle, holding an axe where you cannot see it." } },
    worgen = { { id = "tp_worgen", text = "Something was found in Roland's Doom that should have stayed lost, and the wolves came after." } },
    night_watch = { { id = "tp_watch", text = "They're brave, and Brave is a card too, one that falls a great deal." } },
    morbent_fel = { { id = "tp_morbent", text = "He is the Spider, in my deck. He sits on his hill pulling threads, and the dead dance, and Sven Yorgen wants to cut every one of them." } },
    ladimore = { { id = "tp_ladimore", text = "The Knight, reversed: a good man turned upside down by grief. He walks Raven Hill because he cannot forgive himself." } },
    embalmer = { { id = "tp_embalmer", text = "That is the Needle, and I see it more often than I'd like. Don't ask me whose hand holds it." } },
    _none = { { id = "tp_none", text = "The cards are silent on that, and they are rarely silent, so make of it what you will." } },
  },
}
