-- Temple of Ahn'Qiraj: the qiraji temple-city above C'Thun's prison. Friendly here are the
-- Brood of Nozdormu's bronze dragonkin who appear inside after the gates open (Andorgos,
-- Vethsera and Kandrostrasz), and Prophet Skeram, who speaks before the first fight.
-- Voices: bibles/dg_andorgos.md, bibles/dg_vethsera.md, bibles/dg_kandrostrasz.md, bibles/dg_skeram.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andorgos: Brood of Nozdormu, eldest of the three bronze sentinels in the Temple.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_andorgos", id = TODO_NPC("Andorgos"), name = "Andorgos", title = "Brood of Nozdormu",
  bible = "bibles/dg_andorgos.md", role = "questgiver", tier = "major",
  temper = { "solemn", "patient" }, values = { "wise", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "He speaks as though each word has been weighed against centuries.",
    third = "{name} spoke with Andorgos of the Brood of Nozdormu in the Temple of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Mortal. You stand where few of the young races have stood and lived. Time has bent strangely to bring you here." },
    { id = "g_cthun", when = { killed = { name = "C'Thun", min = 1 } }, text = "The Old God's eye is closed. I felt the tremor in the timeways when it happened, and I confess I did not think I would live to feel it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The sands have not yet claimed you, and I am glad of it." },
  },

  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "A child of Elune. Your people bled here alongside my brood a thousand years ago. Anachronos remembers them, and so do I." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Do not tamper with the flow of time near me, even in jest. The Brood takes such things very seriously." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Andorgos, of the Brood of Nozdormu. My siblings and I were bound here after the War of the Shifting Sands, to watch the prison and to aid any who came to finish what we began. The sands of time have slipped through my claws a long while waiting for you." },
      },
      again = {
        { id = "h_again", text = "What more would you ask of me?" },
        { id = "h_again2", text = "Ask. We have time, and in here that is a rare thing to say." },
      },
      choices = {
        { text = "What is imprisoned beneath this temple?", next = "cthun" },
        { text = "Why have the bronze dragons involved themselves?", next = "nozdormu" },
        { text = "What happened in the War of the Shifting Sands?", next = "war" },
        { text = "Who rules the qiraji here?", next = "emperors" },
        { text = "Do you have work for me?", next = "BUSINESS" },
        { text = "Farewell, Andorgos.", next = "END" },
      },
    },
    cthun = {
      lines = { { id = "c_default", text = "C'Thun, one of the Old Gods who ruled this world before the Titans came. They could not destroy him, so they chained him in the deep places, and the qiraji grew in his shadow like mold beneath a stone. His whispers turn minds, mortal. Guard yours." } },
      choices = {
        { text = "Can a god truly be killed?", next = "killed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    killed = {
      lines = { { id = "k_default", text = "The Titans thought not, or thought it unwise. My Aspect has seen many possible threads, and in some of them the young races manage what the Titans would not. In others, they do not." } },
      choices = {
        { text = "Then we choose the thread where we win.", next = "BACK", reply = "Bold. Nozdormu would say that is precisely how the young races surprise him.", fx = { align = { order = -1 } } },
        { text = "Perhaps the Titans knew better than to try.", next = "BACK", reply = "Perhaps. Caution has preserved this world more often than courage, though rarely as gloriously.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nozdormu = {
      lines = { { id = "n_default", text = "The timeways would unravel if the Old God woke fully, and my Aspect is sworn to guard them. Nozdormu also gave something of his own to this prison, and Anachronos has kept that debt for him through all the long years." } },
      choices = {
        { text = "Anachronos waits outside, at the Caverns of Time.", next = "anachronos" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anachronos = {
      lines = { { id = "a_default", text = "Outside the gates, I mean, though the Caverns are his true home. He held the Scepter of the Shifting Sands until the young races were ready to bear it. That you stand here means someone among you proved worthy." } },
      choices = {
        { text = "Someone rang the gong. I'm here because of them.", next = "BACK", fx = { learn = { "scepter" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "A thousand years ago the qiraji poured out of these walls and nearly overran Kalimdor. The kaldorei fought them with Staghelm leading, and we dragons came to their aid. Anachronos of my own flight and the children of Alexstrasza and Ysera stood with us. In the end we could only seal them in." } },
      choices = {
        { text = "Only? That sounds like victory to me.", next = "victory" },
        { text = "Something else.", next = "BACK" },
      },
    },
    victory = {
      lines = { { id = "v_default", text = "A wall is not a victory. A wall is a promise that someone else will have to finish the fight. You are that someone." } },
      choices = {
        { text = "Then I'll keep that promise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    emperors = {
      lines = { { id = "e_default", text = "Vek'lor and Vek'nilash, the Twin Emperors, who share one mind and two bodies. Below them the prophet Skeram, the Bug Trio, Sartura, Fankriss, Viscidus, Huhuran and Ouro. Each is formidable, and each serves the Old God whether they know it or not." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cthun = { { id = "tp_cthun", text = "The Old God below. Do not linger on his name.", next = "cthun" } },
    nozdormu = { { id = "tp_noz", text = "The Timeless One, Aspect of my flight.", next = "nozdormu" } },
    _none = { { id = "tp_none", text = "That thread of time is not one I have followed." } },
  },
}

---------------------------------------------------------------------------
-- Vethsera: Brood of Nozdormu, the sharpest and least patient of the three.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vethsera", id = TODO_NPC("Vethsera"), name = "Vethsera", title = "Brood of Nozdormu",
  bible = "bibles/dg_vethsera.md", role = "questgiver", tier = "quest",
  temper = { "sharp", "proud" }, values = { "dutiful" },
  notices = { "race" },
  impression = {
    first = "Her eyes keep flicking toward the dark passages, as if counting enemies.",
    third = "{name} met Vethsera of the Brood of Nozdormu in the Temple of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Do not stand gawking, mortal. Every moment you waste is one the qiraji use." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good. I prefer allies who keep returning to ones who must be mourned." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people kept the old ways while the world forgot them. That will serve you better here than you know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Vethsera. Andorgos will tell you of histories and threads, and he is right to. I will tell you what kills people in this temple, because that is what you actually need." },
      },
      again = { { id = "h_again", text = "Well? Out with it." } },
      choices = {
        { text = "Then tell me what kills people here.", next = "kills" },
        { text = "You sound like you've lost friends here.", next = "friends" },
        { text = "What do you think of the young races?", next = "young" },
        { text = "Do you have work for me?", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    kills = {
      lines = { { id = "k_default", text = "Arrogance, mostly. Skeram splits himself and twists your companions' minds against you. Huhuran grows frenzied as she weakens, and her poison will wither a whole camp. And the Old God's eye sees everything in his chamber. Spread out, or die together." } },
      choices = {
        { text = "And Ouro? I've heard of a great worm.", next = "ouro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ouro = {
      lines = { { id = "o_default", text = "Ouro burrows through the sand like it was water. When he submerges, scatter. When he surfaces, pray you weren't standing where he chose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "In the war, yes. Bronze, red and green alike. Some of them fell to the qiraji, and some to the whispers of the Old God, which is worse. I have not forgiven this place." } },
      choices = {
        { text = "Vengeance is a fair reason to fight.", next = "BACK", reply = "Fair or not, it is mine. I will not pretend otherwise.", fx = { align = { light = -1 } } },
        { text = "Fight to protect the living, not avenge the dead.", next = "BACK", reply = "You sound like Andorgos. Perhaps you are both right, and I am only tired.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "y_default", text = "Short-lived and reckless, and somehow you keep winning wars that older races lose. My Aspect finds it fascinating. I find it exhausting, and a little hopeful." } },
      choices = {
        { text = "I'll take hopeful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Andorgos about that. He likes long answers." } },
  },
}

---------------------------------------------------------------------------
-- Kandrostrasz: Brood of Nozdormu, keeper of the brood's dealings with mortal allies.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kandrostrasz", id = TODO_NPC("Kandrostrasz"), name = "Kandrostrasz", title = "Brood of Nozdormu",
  bible = "bibles/dg_kandrostrasz.md", role = "vendor", tier = "quest",
  temper = { "warm", "measured" }, values = { "fair", "loyal" },
  notices = { "class" },
  impression = {
    first = "He is the only one of the three who smiles, and even then only a little.",
    third = "{name} traded with Kandrostrasz of the Brood of Nozdormu in the Temple of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, friend of the Brood. Rest a moment. The temple will still be here, I promise you that." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. The Brood remembers its friends, and you are becoming one." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keep your companion close; the qiraji think any beast is food." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kandrostrasz. My task is a simple one beside my siblings': to see that those who fight for the Brood of Nozdormu do not go unrewarded. Bring me the relics the qiraji guard, and the Brood will remember." },
      },
      again = { { id = "h_again", text = "What else can I do for you?" } },
      choices = {
        { text = "What does the Brood want from the qiraji?", next = "relics" },
        { text = "How do you three get along?", next = "siblings" },
        { text = "Is the Brood's favor worth the risk?", next = "favor" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    relics = {
      lines = { { id = "r_default", text = "The qiraji carry idols and scarabs carved with old power, and the Brood would see them out of qiraji hands. In return we craft gifts from them, armor and trinkets shaped with a little of time's own patience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    siblings = {
      lines = { { id = "s_default", text = "Andorgos thinks in centuries, Vethsera in heartbeats, and I try to stand somewhere in between. We have argued for a thousand years, and we will argue for a thousand more if the Old God leaves us any." } },
      choices = {
        { text = "That sounds like family.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    favor = {
      lines = { { id = "f_default", text = "That is for you to judge. Some fight here for the reward, some for the world. The Brood does not much care which, so long as the fighting is done." } },
      choices = {
        { text = "I fight for the world. The reward is incidental.", next = "BACK", reply = "Then the Brood is fortunate. Take the reward anyway; you will need it.", fx = { align = { light = 1 } } },
        { text = "I fight for what I can carry out of here.", next = "BACK", reply = "Honest, at least. Honesty is rarer in here than gold.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I know little of that. My thoughts stay with the Temple." } },
  },
}
