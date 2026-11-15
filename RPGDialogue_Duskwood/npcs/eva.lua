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

  greetings = {
    { id = "g_expected", text = "Ah. You. The stars said you would come. They did not say you would be so late." },
    { id = "g_back", when = { metBefore = true }, text = "Sit. The cards have been restless since you left." },
    { id = "g_comb", when = { questActive = TODO_QUEST("Return the Comb") }, text = "You have seen Blind Mary. It is on your face. Give me the comb." },
  },

  notice = {
    { id = "n_deaths", cat = "fate", when = { deaths = { min = 10 } },
      text = "The cards keep turning up Death for you, and Death keeps sending you back. It finds you amusing, I think. Do not test it." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You carry something that does not belong to this world. The cards will not lie flat while you stand there. Step back, please." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "There is a shadow at your shoulder that is not yours. I see it in the candle. Don't turn around. It doesn't like to be looked at." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Madame Eva. I follow the old arts. I read what the cards say and what the stars refuse to. Horrors wait in the night here. I simply know their names." },
        { id = "h_shadowy", tags = { "news" }, when = { questActive = TODO_QUEST("The Shadowy Figure") },
          text = "A figure in the fog, watching the farm where the Yorgens died. The cards show me a frightened man, not a monster. Find him." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") },
          text = "Ghost hair thread, for the hermit? I have none spun. I can make it, if someone brings me the hair. Someone. You, I think." },
        { id = "h_mary", when = { questActive = TODO_QUEST("Ghost Hair Thread") },
          text = "Blind Mary will weep when you ask her to comb her hair. Let her weep. Then bring me the comb, and don't look back at the house." },
        { id = "h_totem", when = { questActive = TODO_QUEST("The Totem of Infliction") },
          text = "A totem, made of suffering. I need it whole. Bring me what it asks for, and do not ask me what it does." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "The manor. The cards show a teacher with a gentle hand and something behind his back. Follow the letters. They lead uphill." },
        { id = "h_new", when = { maxLevel = 20 },
          text = "So young, to be walking in Duskwood. The stars are fond of you. That isn't always a kindness." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The cards don't know what to make of you. They keep turning up the Wind. It has never come up twice in one night before." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Light, at my table. Your Church calls my work superstition. Sit anyway. The cards don't mind being doubted." },
        { id = "h_cards", when = { metBefore = true }, text = "The cards turned up the Tower again this morning. They always do, in Duskwood. I've stopped charging extra for it." },
      },
      again = {
        { id = "h_again", text = "There is more. There is always more. Ask." },
        { id = "h_again2", text = "The candle hasn't gone out yet. Go on." },
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
        { id = "c_default", text = "The Traveller. The Tower, reversed. And the Raven, which in Darkshire means only that you'll be here a while." },
        { id = "c_light", when = { alignment = { axis = "light", min = 40 } },
          text = "The Sun, burning in a dark room. A good card. A lonely one." },
        { id = "c_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "The Knife. Again. Every time I deal for you. I've stopped shuffling; it makes no difference." },
      },
      choices = {
        { text = "What does that mean?", next = "mean", fx = { trait = { curious = 1 } } },
        { text = "I don't believe in cards.", next = "cards_doubt", fx = { trait = { skeptical = 1 } } },
        { text = "Deal again.", next = "cards_again" },
      },
    },
    mean = {
      lines = { { id = "m_default", text = "It means you will pay me for the reading. Everything else is up to you." } },
      choices = { { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    cards_doubt = {
      lines = {
        { id = "cd_default", text = "Good. Believers tip badly. The cards were right long before you arrived, and they've never once asked my permission." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
    cards_again = {
      lines = {
        { id = "ca_default", text = "No. A second deal is a second question, and you haven't asked one. Ask the real one, and I'll turn a single card." },
      },
      choices = {
        { text = "Will I live through Duskwood?", next = "cards_live" },
        { text = "Never mind.", next = "BACK" },
      },
    },
    cards_live = {
      big = true,
      lines = {
        { id = "cl_default", text = "Death. In Darkshire that card means change. It also means death. You'll learn which, as everyone does." },
        { id = "cl_deaths", when = { deaths = { min = 10 } },
          text = "Death, again. It keeps sending you back to me. I think it likes the conversation." },
      },
      choices = {
        { text = "Then I'll change.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's no answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    night = {
      big = true,
      lines = {
        { id = "n_default", text = "The dead, walking. The worgen, howling. And men who choose to be monsters, which are worse than either, because they could have chosen otherwise." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { learn = { "stalvan" } } },
        { text = "Which men?", next = "night_men" },
        { text = "And the dead? Are they restless?", next = "night_spirits" },
      },
    },
    night_men = {
      lines = {
        { id = "nm_default", text = "A tutor with something behind his back. A wizard on the hill above Raven Hill who buys the dead. Duskwood grows them the way other places grow apples.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    night_spirits = {
      lines = {
        { id = "ns_default", text = "Restless, and full of complaint. They whisper in my ear all night. It is cold where they are, they tell me. I believe them." },
      },
      choices = {
        { text = "Can you help them?", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mary = {
      lines = {
        { id = "ma_default", text = "A poor, sad spirit in the old farmhouse south of town. She was lovely once, and carried a looking glass wherever she went." },
      },
      choices = {
        { text = "What happened to her?", next = "mary_eyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mary_eyes = {
      lines = {
        { id = "me_default", text = "The dead took her, and left her something worse than dead. So she tore out her own eyes, never to see what she'd become. Speak softly there." },
      },
      choices = {
        { text = "That's terrible.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    granddaughter = {
      big = true,
      lines = {
        { id = "gd_default", text = "Alyssa, my granddaughter. Death lay on the table for her, and after a long trance, one name: Stalvan. Bring me proof he can harm no one." },
      },
      choices = {
        { text = "Does she know?", next = "granddaughter_know" },
        { text = "I'll find him.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    granddaughter_know = {
      lines = {
        { id = "gk_default", text = "Of course not. Would you tell someone you love that you'd seen her die in a card? I tell her to stay indoors. She thinks I'm old." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    thread = {
      lines = {
        { id = "th_default", text = "A thousand uses. Binding spirits. Mending. Sewing life into things that never had any. I don't ask a customer which use he means." },
      },
      choices = {
        { text = "Maybe you should.", next = "thread_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread_ask = {
      lines = {
        { id = "ta_default", text = "Maybe. He pays, he's kind, and the cards turn up the Needle whenever he's named. I have decided not to think about the Needle." },
        { id = "ta_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I should have. I know what walked down that road, and whose thread held it together. The cards told me. I didn't want to hear them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "It doesn't. Your Light is a lamp; my cards are a window. Different work. But tell me, priest: when you pray over the dead here, do they answer?" },
      },
      choices = {
        { text = "Sometimes.", next = "priest_answer" },
        { text = "The dead should rest, not answer.", next = "BACK", fx = { affinity = -1, trait = { pious = 1 } } },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Then you know more than your Church admits. Come and tell me what they say, some evening. We'll compare notes." },
      },
      choices = { { text = "Some evening, then.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "I would rather not. Your cards come up the same every time: a door left open, and something beyond it that knows your name." },
      },
      choices = {
        { text = "It does know my name.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I follow the old arts: cards, stars, and the spirits who will not keep quiet. The rest of my story costs extra." } },
    advice = { { id = "tp_ad", text = "When the cards and the Night Watch disagree, believe the Watch. They're wrong less often. I'll deny I said so." } },
    stalvan = { { id = "tp_stalvan", text = "His card is the Tutor. Patient. Gentle. Holding an axe where you cannot see it." } },
    worgen = { { id = "tp_worgen", text = "Something was found in Roland's Doom that should have stayed lost. The wolves came after." } },
    night_watch = { { id = "tp_watch", text = "Brave. Brave is a card too. It falls a lot." } },
    morbent_fel = { { id = "tp_morbent", text = "The Spider, in my deck. He sits on his hill and pulls threads, and the dead dance. Sven Yorgen wants to cut them." } },
    ladimore = { { id = "tp_ladimore", text = "The Knight, reversed. A good man turned upside down by grief. He walks Raven Hill because he cannot forgive himself." } },
    embalmer = { { id = "tp_embalmer", text = "The Needle. I see it more than I'd like. Don't ask me whose hand holds it." } },
    _none = { { id = "tp_none", text = "The cards are silent on that. They are rarely silent. Make of that what you will." } },
  },
}
