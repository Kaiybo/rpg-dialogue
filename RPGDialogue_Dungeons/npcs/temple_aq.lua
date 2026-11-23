-- Temple of Ahn'Qiraj: the qiraji temple-city above C'Thun's prison. Friendly here are the
-- blue, green and red dragonkin serving the Brood of Nozdormu, who appear after the gates open (Andorgos,
-- Vethsera and Kandrostrasz), and Prophet Skeram, who speaks before the first fight.
-- Voices: bibles/dg_andorgos.md, bibles/dg_vethsera.md, bibles/dg_kandrostrasz.md, bibles/dg_skeram.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andorgos: Brood of Malygos, the blue dragon among the three companions who serve the bronze in the Temple.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_andorgos", id = TODO_NPC("Andorgos"), name = "Andorgos", title = "Brood of Malygos",
  bible = "bibles/dg_andorgos.md", role = "questgiver", tier = "major",
  temper = { "solemn", "patient" }, values = { "wise", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "He speaks as though each word has been weighed against centuries.",
    third = "{name} spoke with Andorgos of the Brood of Malygos in the Temple of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Mortal. You stand where few of the young races have stood and lived. Time has bent strangely to bring you here." },
    { id = "g_cthun", when = { killed = { name = "C'Thun", min = 1 } }, text = "The Old God's eye is closed. I felt the tremor in the timeways when it happened, and I confess I did not think I would live to feel it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The sands have not yet claimed you, and I am glad of it." },
  },

  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "A child of Elune. Your people bled here alongside the dragonflights a thousand years ago. Anachronos remembers them, and so do I." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Do not tamper with the flow of time near me, even in jest. My flight guards magic jealously, and the bronze guard time more jealously still." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Andorgos, of the Brood of Malygos. My companions and I came at the bronze flight's asking, to watch this prison and to aid any who come to finish what the War of the Shifting Sands began. I have waited a long while for you." },
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
        { text = "Why would a blue dragon serve the bronze flight?", next = "siblings" },
        { text = "My people still remember Staghelm's son, lost in that war.", next = "valstann", when = { race = "NightElf" } },
        { text = "What would happen if I tried to bend time here?", next = "mage_time", when = { class = "MAGE" } },
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
      lines = { { id = "k_default", text = "The Titans thought not, or thought it unwise. The bronze Aspect has seen many possible threads, and in some of them the young races manage what the Titans would not. In others, they do not." } },
      choices = {
        { text = "Then we choose the thread where we win.", next = "BACK", reply = "Bold, and Nozdormu would say that is precisely how the young races surprise him.", fx = { align = { order = -1 } } },
        { text = "Perhaps the Titans knew better than to try.", next = "BACK", reply = "Perhaps. Caution has preserved this world more often than courage, though rarely as gloriously.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nozdormu = {
      lines = { { id = "n_default", text = "The timeways would unravel if the Old God woke fully, and Nozdormu is sworn to guard them. Nozdormu also gave something of his own to this prison, and Anachronos has kept that debt for him through all the long years." } },
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
      lines = { { id = "w_default", text = "A thousand years ago the qiraji poured out of these walls and nearly overran Kalimdor. The kaldorei fought them with Staghelm leading, and we dragons came to their aid. Anachronos of the bronze and the children of Alexstrasza and Ysera stood with them. In the end we could only seal them in." } },
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
        { text = "How do you fight two bodies with one mind?", next = "twins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twins = {
      lines = { { id = "tw_default", text = "You keep them apart, for they draw strength from one another's nearness. One shrugs off steel and the other shrugs off spells, and they will trade places when it suits them. Plan for that, or the second will finish what the first began." } },
      choices = {
        { text = "And the Old God himself, when we reach him?", next = "twins_cthun" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twins_cthun = {
      lines = { { id = "tc_default", text = "Then you will fight an eye that sees through stone, and a stomach that swallows heroes whole. I can tell you what the flights remember, but no one has faced C'Thun awake and returned to describe it." } },
      choices = {
        { text = "Then we'll be the first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    siblings = {
      lines = { { id = "si_default", text = "Because the Old God threatens every flight, not the bronze alone, and Nozdormu asked. Vethsera of the green, Kandrostrasz of the red and I of the blue answer to his brood while this prison stands." } },
      choices = {
        { text = "Did you ever doubt anyone would come?", next = "siblings_doubt" },
        { text = "Vethsera seems far less patient than you.", next = "siblings_vethsera" },
        { text = "Something else.", next = "BACK" },
      },
    },
    siblings_doubt = {
      lines = { { id = "sd_default", text = "Doubt is a mortal habit, and I have caught it from your kind as one catches a cold. Yes, I doubted, but Nozdormu had seen this day among the threads, and so I waited on his word rather than my own." } },
      choices = {
        { text = "Faith in the bronze kept you here.", next = "BACK", reply = "Faith, and duty, which for a dragon are nearly the same thing.", fx = { align = { order = 1 } } },
        { text = "I'd have left long ago.", next = "BACK", reply = "Then it is fortunate you are not a dragon. Though perhaps the young races are right to be restless.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    siblings_vethsera = {
      lines = { { id = "sv_default", text = "She is young, as we reckon it, and she counts the dead of the last war more often than I do. Do not take her sharpness for contempt, for she simply has no patience left to spend on courtesy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valstann = {
      lines = { { id = "va_default", text = "Valstann Staghelm fell before the gates of Ahn'Qiraj, and his father's grief shaped everything that followed. I watched Fandral hold the line for months with a broken heart, and he has never forgiven this place." } },
      choices = {
        { text = "Then I fight for Valstann too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_time = {
      lines = { { id = "mt_default", text = "In most places, very little, for your spells only ripple the surface. Here the Old God's presence has worn the timeways thin, and a careless ripple could carry you somewhere you do not wish to be. I would rather not hunt for you in yesterday." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    cthun = { { id = "tp_cthun", text = "The Old God below. Do not linger on his name.", next = "cthun" } },
    nozdormu = { { id = "tp_noz", text = "The Timeless One, Aspect of the bronze flight, whom we serve here.", next = "nozdormu" } },
    _none = { { id = "tp_none", text = "That thread of time is not one I have followed." } },
  },
}

---------------------------------------------------------------------------
-- Vethsera: Brood of Ysera, the green dragon sent to the Temple; the sharpest and least patient of the three.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vethsera", id = TODO_NPC("Vethsera"), name = "Vethsera", title = "Brood of Ysera",
  bible = "bibles/dg_vethsera.md", role = "questgiver", tier = "quest",
  temper = { "sharp", "proud" }, values = { "dutiful" },
  notices = { "race" },
  impression = {
    first = "Her eyes keep flicking toward the dark passages, as if counting enemies.",
    third = "{name} met Vethsera of the Brood of Ysera in the Temple of Ahn'Qiraj.",
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
        { text = "Why would a green dragon come to the desert?", next = "green" },
        { text = "The druids say Ysera watches over the Dream.", next = "dream", when = { class = "DRUID" } },
        { text = "My people were raised with tales of your kind.", next = "dream", when = { race = "NightElf" } },
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
      choices = {
        { text = "And what waits at the very bottom?", next = "cthun" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cthun = {
      lines = { { id = "ct_default", text = "C'Thun, and I will not say more of him than I must, because even his name has weight in this place. If you reach his chamber, keep your mind your own, and do not listen when the walls begin to speak." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    green = {
      lines = { { id = "gr_default", text = "Because the bronze flight asked, and my Aspect does not refuse Nozdormu lightly. A thousand years ago all the flights sent their children to hold the qiraji back, and the green bled in this sand as freely as the rest." } },
      choices = {
        { text = "So the flights still work together?", next = "flights" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flights = {
      lines = { { id = "fl_default", text = "When the danger is great enough, yes, and not a moment sooner. Andorgos speaks for the blue, Kandrostrasz for the red, and I for the green, and together we answer to the bronze while this prison stands." } },
      choices = {
        { text = "The flights should stand together always.", next = "BACK", reply = "A pretty thought, and a mortal one. Dragons have long memories and longer grudges.", fx = { align = { order = 1 } } },
        { text = "Better that each flight keeps its own counsel.", next = "BACK", reply = "Spoken like someone who has met dragons. You may be wiser than you look.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "She does, and she would be glad to know the dreamers have not forgotten her. Keep your own dreams clean while you walk these halls, because the thing below whispers into sleep as easily as into waking." } },
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
-- Kandrostrasz: Brood of Alexstrasza, the red dragon who keeps the Brood of Nozdormu's dealings with mortal allies.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kandrostrasz", id = TODO_NPC("Kandrostrasz"), name = "Kandrostrasz", title = "Brood of Alexstrasza",
  bible = "bibles/dg_kandrostrasz.md", role = "vendor", tier = "quest",
  temper = { "warm", "measured" }, values = { "fair", "loyal" },
  notices = { "class" },
  impression = {
    first = "He is the only one of the three who smiles, and even then only a little.",
    third = "{name} traded with Kandrostrasz of the Brood of Alexstrasza in the Temple of Ahn'Qiraj.",
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
        { id = "h_default", key = true, text = "I am Kandrostrasz. My task is a simple one beside my companions': to see that those who fight for the Brood of Nozdormu do not go unrewarded. Bring me the relics the qiraji guard, and the Brood will remember." },
      },
      again = { { id = "h_again", text = "What else can I do for you?" } },
      choices = {
        { text = "What does the Brood want from the qiraji?", next = "relics" },
        { text = "How do you three get along?", next = "siblings" },
        { text = "Is the Brood's favor worth the risk?", next = "favor" },
        { text = "You're a long way from the red flight.", next = "red" },
        { text = "Keep the qiraji off my pet and we'll get along.", next = "pet", when = { class = "HUNTER" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Goodbye.", next = "END" },
      },
    },
    relics = {
      lines = { { id = "r_default", text = "The qiraji carry idols and scarabs carved with old power, and the Brood would see them out of qiraji hands. In return we craft gifts from them, armor and trinkets shaped with a little of time's own patience." } },
      choices = {
        { text = "What power is carved into them?", next = "carvings" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carvings = {
      lines = { { id = "cv_default", text = "Their makers' faith, mostly, and a little of the Old God's will poured into the stone. In qiraji hands it feeds the swarm, and in ours it can be turned to armor, so every idol you bring me is one less prayer for C'Thun." } },
      choices = {
        { text = "Then I'll strip every idol from this temple.", next = "BACK", reply = "Do, and I will see that each one is put to good use.", fx = { align = { order = 1 } } },
        { text = "I'd sooner keep that power for myself.", next = "BACK", reply = "Many have thought so. The stone remembers who carved it, friend, and it is not patient with thieves.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    red = {
      lines = { { id = "rd_default", text = "I am, and I feel it every day in this dry dark. Alexstrasza gives life, and this place is the opposite of everything she loves, which is exactly why she sent one of her own to stand against it." } },
      choices = {
        { text = "Is it true the orcs once held her at Grim Batol?", next = "grimbatol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimbatol = {
      lines = { { id = "gb_default", text = "That is not a question I will answer lightly, and not here. The orcs held her a long time, and the red flight does not speak of those years to strangers, however kindly they ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "pt_default", text = "A fair bargain, and one I'll gladly keep where I can. The red flight has always had a soft place for those who keep faith with a beast, because loyalty like that is a kind of life too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    siblings = {
      lines = { { id = "s_default", text = "Andorgos thinks in centuries, Vethsera in heartbeats, and I try to stand somewhere in between. Blue, green and red, we have argued since the War of the Shifting Sands, and we will argue for a thousand years more if the Old God leaves us any." } },
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

---------------------------------------------------------------------------
-- The Prophet Skeram: qiraji prophet who greets intruders at the temple's first gate.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_skeram", id = TODO_NPC("The Prophet Skeram"), name = "The Prophet Skeram",
  bible = "bibles/dg_skeram.md", role = "boss", tier = "major",
  temper = { "zealous", "cruel" }, values = { "devout" },
  notices = { "race" },
  impression = {
    first = "His voice seems to come from several places at once.",
    third = "{name} heard the Prophet Skeram's sermon at the gates of the Temple of Ahn'Qiraj.",
  },

  greetings = {
    { id = "g_default", text = "Are you so eager to die? I will be happy to accommodate you." },
  },

  notice = {
    { id = "n_ne", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Staghelm's wall could not hold forever, and neither will you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Skeram, prophet of the qiraji and voice of the one who dreams beneath. You have walked into the house of a god, and he has already seen your end." },
      },
      again = { { id = "h_again", text = "Speak again, and your words will be your last." } },
      choices = {
        { text = "What god do you serve?", next = "god" },
        { text = "What have you foreseen?", next = "prophecy" },
        { text = "Your prophecies won't save you.", next = "END" },
      },
    },
    god = {
      lines = { { id = "g_text", text = "The one who was before your world had a name. His eye opens, and all flesh becomes his. You will hear him soon enough, whispering in the dark, and you will love him." } },
      choices = {
        { text = "No god deserves that kind of worship.", next = "BACK", reply = "Every god deserves exactly what he can take.", fx = { align = { light = 1 } } },
        { text = "Faith that strong is almost admirable.", next = "BACK", reply = "Then kneel, and be spared nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prophecy = {
      lines = { { id = "p_default", text = "I see your friends turning their blades upon you, with my voice in their ears. I see the sands drinking your blood. I see the emperors rising. These things are already true; you have only not yet arrived at them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Your questions are dust. Only the dreamer matters." } },
  },
}
