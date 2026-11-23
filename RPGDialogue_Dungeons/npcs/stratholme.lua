-- Stratholme: Aurius, the paladin who waits in the Scarlet Bastion's shadow for the Medallion
-- of Faith; Ysida Harmon, held captive by Baron Rivendare until rescued; and Magistrate
-- Barthilas, the last of the city's living magistrates turned to the Scourge.
-- Voices: bibles/dg_aurius.md, bibles/dg_ysida.md, bibles/dg_barthilas.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Aurius: a paladin of the old Silver Hand, sworn to stand against Baron Rivendare.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_aurius", id = TODO_NPC("Aurius"), name = "Aurius",
  bible = "bibles/dg_aurius.md", role = "questgiver", tier = "quest", gender = "male",
  temper = { "solemn", "earnest" }, values = { "faithful", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "A man who has prayed so long in the dark that he has stopped expecting an answer, and prays anyway.",
    third = "{name} met Aurius, a paladin waiting in the ruin of Stratholme for the chance to face Baron Rivendare.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice low. The Scourge do not sleep, but they do listen." },
    { id = "g_med", when = { questActive = TODO_QUEST("The Medallion of Faith") }, text = "You have the medallion, or you are close to it. I can feel the Light stir around you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A brother of the Light. Then you know why I came here alone, and you will not ask me to leave." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. My hand is on my hammer, but I will hear you out. The Baron is a greater enemy than you are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aurius. I served the Silver Hand before Arthas broke it, and I came back to Stratholme because the man who rules its dead, Baron Rivendare, still sits on the throne of my city." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "Light be with you. Aurius, once of the Silver Hand. I take it you are here for the same reason I am: someone must answer for this city." },
      },
      again = {
        { id = "h_again", text = "Ask what you must. Then go carefully." },
        { id = "h_again2", text = "I am still here. What else?" },
      },
      choices = {
        { text = "Who is Baron Rivendare?", next = "rivendare" },
        { text = "What is the Medallion of Faith?", next = "medallion" },
        { text = "What was Stratholme like before?", next = "before" },
        { text = "Why come back alone?", next = "alone" },
        { text = "I'm of the Light too. Ride with me against him.", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I was one of this city's dead once.", next = "forsaken", when = { race = "Scourge" } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "Stay safe, paladin.", next = "END" },
      },
    },
    rivendare = {
      lines = { { id = "r_default", text = "Titus Rivendare was a lord of Lordaeron who sold himself to the Cult of the Damned for a promise of eternal life. Kel'Thuzad kept the promise, after his fashion. Now he is a death knight and he holds this city for the Scourge." } },
      choices = {
        { text = "Then he'll die a second time.", next = "rivendare2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivendare2 = {
      lines = { { id = "r2_default", text = "He will, if the Light allows it. But his ziggurats feed him, and he will not face you while the acolytes in them still stand. Break them first." } },
      choices = {
        { text = "Vengeance for the city is reason enough.", next = "BACK", reply = "Be careful with that word. Vengeance is how Arthas began. Let it be justice, or let it be nothing.", fx = { align = { light = -1 } } },
        { text = "This is about mercy for the dead.", next = "BACK", reply = "Yes. The people in these streets deserve to sleep. That is why I am here, and I am glad it is why you are here too.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion = {
      lines = { { id = "m_default", text = "A holy relic, carried by one of my order who fell in these streets. It holds a blessing strong enough to turn a blade against the Baron. Find it among the dead, and bring it to me." } },
      choices = {
        { text = "And then?", next = "medallion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion2 = {
      lines = { { id = "m2_default", text = "Then I will consecrate it, and you will carry the Light into the Baron's hall. If I fall before then, take it anyway. The Light does not care whose hand holds it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "It was bright and crowded and loud, with merchants hawking grain on every corner. I bought my first sword two streets from here, from a smith whose name I cannot bear to remember." } },
      choices = {
        { text = "What happened the day it fell?", next = "culling" },
        { text = "Something else.", next = "BACK" },
      },
    },
    culling = {
      narr = "His hand tightens on the hilt of his sword until the leather creaks.",
      lines = { { id = "cu_default", text = "The grain was plagued, and Arthas would not wait to learn who had eaten it. He put every soul in the city to the sword, and Uther and Jaina rode away rather than help him. I was not here, and I have never decided whether that was mercy or cowardice." } },
      choices = {
        { text = "Arthas did what had to be done.", next = "culling_side", reply = "Did he? Then look at what came of it, and tell me again.", fx = { align = { light = -1 } } },
        { text = "Nothing justifies murdering a city.", next = "culling_side", reply = "No, and the Light will not let me forget that the man who did it was one of ours.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    culling_side = {
      lines = { { id = "cs_default", text = "Whatever we believe about that day, the dead still walk these streets, and the Baron keeps them walking. That much we can end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Gladly, for the Silver Hand was never meant to fight alone. When we reach his hall, stand where I can see you, and if I falter, take the Medallion and press on without me." } },
      choices = {
        { text = "Neither of us will falter.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Then you know better than I what this city suffered. I will not pretend to trust your Dark Lady, but tonight we want the same thing, and the Light can sort the rest out later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "a_default", text = "The Argent Dawn sends patrols, and the Scarlets send armies, but neither will set foot in the Baron's hall. I would rather die trying than wait outside another winter." } },
      choices = {
        { text = "Patience would serve you better.", next = "BACK", reply = "Perhaps. Patience is a virtue for those who have time. Look around you; the dead have all the time there is.", fx = { align = { order = 1 } } },
        { text = "Sometimes one sword has to go first.", next = "BACK", reply = "Then let mine be one of two. I am glad you came.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Ysida Harmon: Anthion Harmon's beloved, held prisoner by Baron Rivendare.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ysida", id = TODO_NPC("Ysida Harmon"), name = "Ysida Harmon",
  bible = "bibles/dg_ysida.md", role = "questgiver", tier = "quest", gender = "female",
  temper = { "frightened", "brave" }, values = { "loving", "hopeful" },
  notices = { "race" },
  impression = {
    first = "Shaking from cold and fear, but still standing straight.",
    third = "{name} freed Ysida Harmon from Baron Rivendare's cage in Stratholme.",
  },

  greetings = {
    { id = "g_default", text = "You're alive. Please tell me you're real, and not another of his tricks." },
    { id = "g_plea", when = { questActive = TODO_QUEST("Dead Man's Plea") }, text = "Anthion sent you? Then some part of him is still out there looking for me. Light bless him, I thought I'd never hear his name again." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Oh. You're... like them. But you opened the cage, didn't you? I don't understand, but thank you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name is Ysida Harmon. The Baron kept me alive for his amusement, to watch what he did to the others. I'm not sure how long I was in there." },
      },
      again = {
        { id = "h_again", text = "I'm sorry, I'm still shaking. What did you ask?" },
        { id = "h_again2", text = "Anything you want to know. Just stay close." },
      },
      choices = {
        { text = "Anthion is waiting for you.", next = "anthion" },
        { text = "How were you captured?", next = "captured" },
        { text = "Did you see anything we should know?", next = "saw" },
        { text = "What was Stratholme like, before?", next = "before" },
        { text = "I was of Lordaeron once, like you.", next = "forsaken", when = { race = "Scourge" } },
        { text = "May the Light give you strength, Ysida.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Let's get you out of here.", next = "END" },
      },
    },
    anthion = {
      lines = { { id = "an_default", text = "Anthion was meant to meet me at the city gate the day the plague grain came. I never got there. If he's still out there, he must have searched for me for years." } },
      choices = {
        { text = "He never stopped looking.", next = "anthion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anthion2 = {
      lines = { { id = "an2_default", text = "Then I'll go to him. Tell him I'm coming home, and that I kept his ring hidden the whole time. They never found it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    captured = {
      lines = { { id = "c_default", text = "I hid in a cellar with my sister when the dead rose. They found her first. The Baron's men dragged me out and said I'd make an interesting pet." } },
      choices = {
        { text = "Rivendare will pay for that.", next = "BACK", reply = "I hope so. I hope he feels every bit of it, if things like him can still feel.", fx = { align = { light = -1 } } },
        { text = "You're safe now. That's what matters.", next = "BACK", reply = "You're kind. I'm trying to believe it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    saw = {
      lines = { { id = "s_default", text = "The acolytes in the ziggurats chant at night, and the Baron grows stronger when they do. And there was a slaughterhouse. I don't want to talk about the slaughterhouse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "bf_default", text = "Beautiful, if you can believe it, with bells in the morning and bakers shouting on every street. Anthion and I used to walk by the King's Square on market days, and I'd pretend not to notice him buying flowers." } },
      choices = {
        { text = "What happened to the city?", next = "purge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purge = {
      lines = { { id = "pg_default", text = "The grain came first, and the sickness, and then Prince Arthas came with his soldiers and put the whole city to the sword. Some say he did it to spare us from the plague, and some say he only did it sooner." } },
      choices = {
        { text = "He did what had to be done.", next = "BACK", reply = "Maybe so. But it was my street, and my sister, and I can't forgive it.", fx = { align = { order = 1 } } },
        { text = "Nothing excuses a massacre of the living.", next = "BACK", reply = "Thank you. Nobody ever says it plainly, and it needs to be said.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Then you know what this city was, and what it became. I don't understand what you are now, but you opened the cage when the dead I knew only ever locked it, and I'll remember that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "lt_default", text = "I stopped praying in the cage, because I didn't think anyone was listening. Maybe someone was, after all, and maybe it was you they sent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Magistrate Barthilas: a city magistrate turned servant of the Scourge, speaking before he fights.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_barthilas", id = TODO_NPC("Magistrate Barthilas"), name = "Magistrate Barthilas",
  bible = "bibles/dg_barthilas.md", role = "boss", tier = "quest", gender = "male",
  temper = { "pompous", "cracked" }, values = { "officious", "fearful" },
  notices = {},
  impression = {
    first = "Still reciting regulations to a city full of corpses.",
    third = "{name} confronted Magistrate Barthilas, the plague-touched official who still claims Stratholme's authority.",
  },

  greetings = {
    { id = "g_default", text = "Halt! You are in violation of the quarantine of Stratholme, by order of the magistrate. That is me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Magistrate Barthilas. I kept order in this city when Prince Arthas came, and I keep it still. Order is all that remains, you see. Order and the Baron." },
      },
      again = {
        { id = "h_again", text = "State your business. Clearly. For the record." },
      },
      choices = {
        { text = "What happened when Arthas came?", next = "culling" },
        { text = "You serve the Baron now?", next = "baron" },
        { text = "Stand aside, magistrate.", next = "END" },
      },
    },
    culling = {
      lines = { { id = "c_default", text = "The grain was bad. The prince said everyone had eaten it. I signed the papers that sealed the gates so no one could leave. Someone had to sign them. It was all very proper." } },
      choices = {
        { text = "You helped him butcher your own city.", next = "BACK", reply = "I followed procedure! The prince had the authority, and I had the seal. You cannot blame a man for his seal.", fx = { align = { order = -1 } } },
        { text = "You did what you were ordered to do.", next = "BACK", reply = "Yes. Yes, exactly. Thank you. No one ever understands that part.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    baron = {
      lines = { { id = "b_default", text = "The Baron restored the city's government. He let me keep my office. I have only had to change the way I keep the census, as there are fewer living citizens to count." } },
      choices = {
        { text = "Are you still alive?", next = "alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive = {
      lines = { { id = "a_default", text = "That question is outside your jurisdiction. Guards! Guards, this person is asking improper questions!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
