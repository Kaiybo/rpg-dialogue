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
      lines = { { id = "b_default", text = "Bright, crowded, loud. Merchants hawking grain on every corner. I bought my first sword two streets from here, from a smith whose name I cannot bear to remember." } },
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
    { id = "g_plea", when = { questActive = TODO_QUEST("Dead Man's Plea") }, text = "Anthion sent you? He's alive? Light bless him, I thought I'd never hear his name again." },
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
  },
}
