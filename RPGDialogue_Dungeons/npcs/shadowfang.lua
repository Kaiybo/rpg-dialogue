-- Shadowfang Keep: Archmage Arugal, mad master of the keep and its worgen, and Commander
-- Springvale, the fallen paladin who still holds the courtyard for him.
-- (The prisoners Adamant and Ashcrombe live in RPGDialogue_Silverpine.)
-- Voices: bibles/dg_arugal.md, bibles/dg_springvale.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Archmage Arugal: the Kirin Tor mage who called the worgen, and calls them his children.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_arugal", id = TODO_NPC("Archmage Arugal"), name = "Archmage Arugal",
  bible = "bibles/dg_arugal.md", role = "boss", tier = "major",
  temper = { "grand", "bitter" }, values = { "proud", "possessive" },
  notices = { "class", "race" },
  impression = {
    first = "He speaks like a teacher to a slow pupil, and his eyes never settle.",
    third = "{name} heard Archmage Arugal hold court among his worgen in Shadowfang Keep.",
  },

  greetings = {
    { id = "g_default", text = "Another guest climbs my stairs uninvited. Come closer, then, and let my children have a look at you." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Arugal Must Die") }, text = "Dalaran's lapdogs at the Sepulcher have sent you for my head, I suppose. They never could finish what they started." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Most who leave my keep do so in pieces, so I confess you interest me." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and Dalaran's training is all over you like dust. Did they tell you about me, or have they scrubbed my name from the records?" },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of Sylvanas's walking dead. You were the reason I summoned my children, you know, and here you stand as if you owned Silverpine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Arugal of the Kirin Tor, master of Shadowfang and father to the worgen. Lordaeron was dying while Dalaran argued, so I did what the council would not, and I have never once regretted it." },
        { id = "h_mage", when = { class = "MAGE" }, text = "You know the Violet Citadel, mage, so you know how its masters talk and talk while the world burns. I stopped talking, and I opened a door." },
      },
      again = {
        { id = "h_again", text = "Speak quickly, because my children grow restless." },
        { id = "h_again2", text = "Is there more, or shall we end this?" },
      },
      choices = {
        { text = "Where did the worgen come from?", next = "worgen" },
        { text = "You called them your children.", next = "children" },
        { text = "What happened to Baron Silverlaine?", next = "silverlaine" },
        { text = "Dalaran wants you to answer for this.", next = "dalaran" },
        { text = "You did this to fight the Scourge.", next = "scourge" },
        { text = "I've come to end you, Arugal.", next = "END" },
      },
    },
    worgen = {
      lines = { { id = "w_default", text = "From somewhere far beyond any map the Kirin Tor keeps, a place I reached through spells older than Dalaran itself. I called, and they answered, and they came through hungry and grateful and mine." } },
      choices = {
        { text = "You don't control them as well as you think.", next = "control" },
        { text = "Something else.", next = "BACK" },
      },
    },
    control = {
      lines = { { id = "c_default", text = "They tore through Pyrewood and the Greymane Wall's shadow and half of Silverpine, and you call that a lack of control? I call it enthusiasm, and every one of them still comes when I call." } },
      choices = {
        { text = "A man who loses control of his weapon deserves it.", next = "BACK", reply = "Then come and take my weapon from me, if you think I've dropped it. You'll find it has teeth.", fx = { align = { order = 1 }, learn = { "worgen" } } },
        { text = "Desperate times excuse a lot. Not this.", next = "BACK", reply = "Excuse? I asked no one's pardon, and certainly not yours. Desperate times made me, and I made something stronger than the dead.", fx = { align = { light = 1 }, learn = { "worgen" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    children = {
      lines = { { id = "ch_default", text = "They are, and better ones than any father in Lordaeron ever had. They do not lie to me or plot against me, and they love me with a devotion the Kirin Tor never managed for one afternoon." } },
      choices = {
        { text = "You sound very lonely, Archmage.", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      lines = { { id = "l_default", text = "Lonely? I have a whole keep full of family, and the whole of Silverpine to roam. Mind your tongue, or I will introduce you to them one by one." } },
      choices = {
        { text = "I meant no insult.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silverlaine = {
      lines = { { id = "s_default", text = "The baron was a generous host, and he never understood what I had brought into his house. He lies in his own halls now, and the keep is the better for my keeping it." } },
      choices = {
        { text = "So you murdered your host.", next = "host" },
        { text = "Something else.", next = "BACK" },
      },
    },
    host = {
      lines = { { id = "ho_default", text = "My children did, and I did not stop them, and I would not stop them again. Silverlaine had his chance to stand with me when the plague came, and he chose his locks and his walls instead." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "d_default", text = "Answer? Dalaran owes me answers, for every plea I made while they sat in their tower. Let them send their errand-runners, and I'll send them back without their errands or their throats." },
        { id = "d_quest", when = { questActive = TODO_QUEST("Arugal Must Die") }, text = "Dalar Dawnweaver, isn't it, hiding among the Forsaken at the Sepulcher? Tell him his old colleague remembers him, and that the memory is not fond." },
      },
      choices = {
        { text = "The Kirin Tor were right to fear you.", next = "BACK", reply = "Fear me? Good, at last they learned something useful. Shame it came too late to save them.", fx = { align = { order = 1 } } },
        { text = "Maybe they failed you first.", next = "BACK", reply = "Maybe they did, and maybe you're the first to say so aloud. It changes nothing for you, I'm afraid.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scourge = {
      lines = {
        { id = "sc_default", text = "I did, and the Scourge are gone from Silverpine, aren't they? The worgen drove the dead from these hills, and if a few villages went with them, that is the price of victory." },
        { id = "sc_forsaken", when = { race = "Scourge" }, text = "I did, and you of all things should feel it. My children were made for the hunting of the dead, and they have never been told the difference between yours and the Lich King's." },
      },
      choices = {
        { text = "That's not victory. That's another plague.", next = "BACK", reply = "Spoken like someone who never saw Andorhal fall. Leave me to my keep, or stay and be part of the price.", fx = { align = { light = 1 } } },
        { text = "Sometimes only monsters can fight monsters.", next = "BACK", reply = "Ah, a pupil with a little sense. Pity you came here to kill me, because we might have understood each other.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "My children, called from beyond the world to save it from the dead.", next = "worgen" } },
    _none = { { id = "tp_none", text = "Bore me with that again and my children will see to the rest of the conversation." } },
  },
}

---------------------------------------------------------------------------
-- Commander Springvale: a paladin of Lordaeron who swore himself to Arugal's keep.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_springvale", id = TODO_NPC("Commander Springvale"), name = "Commander Springvale",
  bible = "bibles/dg_springvale.md", role = "boss", tier = "quest",
  temper = { "stern", "grim" }, values = { "dutiful", "fallen" },
  notices = { "class" },
  impression = {
    first = "He still stands like a knight, though his oath has gone rotten.",
    third = "{name} faced Commander Springvale in the courtyard of Shadowfang Keep.",
  },

  greetings = {
    { id = "g_default", text = "Halt. This courtyard belongs to the master of Shadowfang, and I hold it for him as I once held a wall for my king." },
  },

  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I wore that Light once, and I'll tell you true that it gets very heavy when no one comes to help you carry it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Springvale, once a commander of Lordaeron's knights. When the dead came, my lord Arugal gave my men a purpose that the crown no longer could, and we have held these walls since." } },
      again = { { id = "h_again", text = "Say what you will, and then draw." }, { id = "h_again2", text = "Anything more before we settle this?" } },
      choices = {
        { text = "What became of your men?", next = "men" },
        { text = "Why serve Arugal?", next = "why" },
        { text = "Your oath was to the Light, not to him.", next = "oath" },
        { text = "Then let's settle this.", next = "END" },
      },
    },
    men = {
      lines = { { id = "m_default", text = "Some wear fur now, and some lie in the crypts beneath the keep, and some still walk the courtyard in what's left of their armor. They followed me here, and none of them has left." } },
      choices = {
        { text = "You led them to this.", next = "led" },
        { text = "Something else.", next = "BACK" },
      },
    },
    led = {
      lines = { { id = "l_default", text = "I led them out of Lordaeron alive when the capital fell, which is more than Arthas did for his. If this is what it cost, they paid it standing at my side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because he was the only one in all of Silverpine still fighting the Scourge when I came over the hills. The worgen tore through the dead like wolves through sheep, and I chose the wolves." } },
      choices = {
        { text = "Then the wolves turned on your own people.", next = "BACK", reply = "They did, and I have told myself every night since that it was necessary. I am still waiting to believe it.", fx = { align = { light = 1 } } },
        { text = "I'd have chosen the wolves too.", next = "BACK", reply = "Then you understand, and I'm sorry we have to fight. My lord does not let visitors leave.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oath = {
      lines = {
        { id = "o_default", text = "The Light was very quiet in Lordaeron when the grain came out of Andorhal tainted. I swore my oath again to someone who answered when I called." },
        { id = "o_pal", when = { class = "PALADIN" }, text = "You would say that, paladin, because your Light hasn't been tested the way mine was. Wait until it goes quiet on you, and then tell me about oaths." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't hold the courtyard to gossip, stranger." } },
  },
}
