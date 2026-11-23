-- Scarlet Monastery: the Crusade's leaders who speak before steel is drawn: High Inquisitor
-- Whitemane, Scarlet Commander Mograine, and Arcanist Doan in the library.
-- Voices: bibles/dg_whitemane.md, bibles/dg_mograine.md, bibles/dg_doan.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local SM_QUEST = TODO_QUEST("In the Name of the Light")
local SM_HORDE = TODO_QUEST("Into The Scarlet Monastery")

---------------------------------------------------------------------------
-- High Inquisitor Whitemane: the Crusade's fiercest zealot, priestess of the cathedral.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_whitemane", id = TODO_NPC("High Inquisitor Whitemane"), name = "High Inquisitor Whitemane",
  bible = "bibles/dg_whitemane.md", role = "boss", tier = "major",
  temper = { "stern", "fierce" }, values = { "zealous", "faithful" },
  notices = { "class", "race" },
  impression = {
    first = "Her faith burns hot enough to scorch anyone who stands too near.",
    third = "{name} heard High Inquisitor Whitemane preach in the Scarlet Cathedral.",
  },

  greetings = {
    { id = "g_default", text = "You stand in the Light's own house, stranger. Kneel and be judged, or rise and be burned." },
    { id = "g_quest", when = { questActive = SM_QUEST }, text = "Southshore sent you, did they? Raleigh's little crusade against the true Crusade, how very brave of him." },
    { id = "g_horde", when = { questActive = SM_HORDE }, text = "The Banshee Queen's errand-runner, with the stink of the grave on your gear. You'll find no mercy in this cathedral." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Undead, in the cathedral! The Light itself recoils at you, and so shall I." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, wearing the Light like a robe you've borrowed. I wonder if you have ever truly burned for it." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin who doesn't wear the scarlet. Uther's order is dead, and you ought to have joined the only one still fighting." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sally Whitemane, High Inquisitor of the Scarlet Crusade. Lordaeron fell because good people grew soft and trusted the wrong neighbors, and I have sworn the Light will never be so careless again." },
        { id = "h_pal", when = { class = "PALADIN" }, text = "I am Whitemane, and I know your kind well, paladin. Half your brothers stood aside at Stratholme while the plague spread, and the other half came to us." },
      },
      again = { { id = "h_again", text = "Speak, and choose your words as if your soul depends on them." }, { id = "h_again2", text = "Have you more to confess?" } },
      choices = {
        { text = "Why does the Crusade kill the living too?", next = "living" },
        { text = "What is the Scarlet Crusade, truly?", next = "crusade" },
        { text = "What is Mograine to you?", next = "mograine" },
        { text = "The Light doesn't need inquisitors.", next = "inquisition" },
        { text = "I've seen the Plaguelands too. I understand.", next = "understand" },
        { text = "Your crusade ends today.", next = "END" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "Because the plague hides in the living for days before it shows itself, and Lordaeron learned that lesson in blood. Better a hundred innocents burn than one carrier walk free into Tirisfal." } },
      choices = {
        { text = "That's not faith. That's murder.", next = "murder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murder = {
      lines = { { id = "m_default", text = "Call it what you will, but my conscience is clean, because I have never once let the dead walk through my gates. Can your kings say the same?" } },
      choices = {
        { text = "Innocent blood will damn you, Inquisitor.", next = "BACK", reply = "Then the Light will judge me, not you. Until then, I keep my vigil.", fx = { align = { light = 1 } } },
        { text = "Hard times demand hard choices. I see that.", next = "BACK", reply = "At last, someone with eyes. You might have worn the scarlet, in another life.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade = {
      lines = { { id = "c_default", text = "We are what remains of Lordaeron's faith, gathered by Grand Crusader Saidan Dathrohan when the kingdom fell. Our order holds Tyr's Hand and this monastery, and we purge the undead wherever they walk." } },
      choices = {
        { text = "And the Forsaken? They broke from the Lich King.", next = "forsaken" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "A corpse that walks is a corpse, whatever banner it carries. Sylvanas Windrunner was a hero once, and that only makes her a better liar now." },
        { id = "f_forsaken", when = { race = "Scourge" }, text = "You hear that, corpse? Your Dark Lady was a ranger of Quel'Thalas once, and what she is now is an abomination, and so are you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    mograine = {
      lines = { { id = "mg_default", text = "Renault Mograine is the Commander of our army in this monastery, and a son of the Ashbringer himself. He is my strong right arm, and I am the voice that raises him when he falls." } },
      choices = {
        { text = "Raises him?", next = "raise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raise = {
      lines = { { id = "r_default", text = "The Light answers me, stranger, as it answers few in this age. If you strike down my Commander, you'll see for yourself what my prayers can do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inquisition = {
      lines = { { id = "i_default", text = "The Light needed nothing until the plague came, and then it needed swords and fire and people willing to use them. I have questioned many hundreds, and I have found the rot in more of them than you would believe." } },
      choices = {
        { text = "How many were innocent?", next = "innocent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    innocent = {
      lines = { { id = "in_default", text = "Every one of them swore they were, and some may even have been right. The Light will sort them out, and I will not lose sleep over its arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    understand = {
      lines = { { id = "u_default", text = "Do you? Then you've seen Andorhal and the Bulwark, and you know there's no mercy left in the north to spare. Pity you came to my cathedral with a drawn blade instead of an open heart." } },
      choices = {
        { text = "Mercy is still a choice.", next = "BACK", reply = "Mercy is a luxury for those who were never betrayed. You'll learn that, or you'll die before you do.", fx = { align = { order = -1 } } },
        { text = "Order must be kept, at any cost.", next = "BACK", reply = "Spoken like a true crusader. Remember it when you leave, if I let you leave.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_sc", text = "The Scarlet Crusade, the last true servants of the Light in Lordaeron.", next = "crusade" } },
    _none = { { id = "tp_none", text = "I have no time for idle questions while the dead still walk." } },
  },
}

---------------------------------------------------------------------------
-- Scarlet Commander Mograine: Renault, the commander of the monastery's army.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_mograine", id = TODO_NPC("Scarlet Commander Mograine"), name = "Scarlet Commander Mograine",
  bible = "bibles/dg_mograine.md", role = "boss", tier = "quest",
  temper = { "proud", "cold" }, values = { "ambitious", "zealous" },
  notices = { "class" },
  impression = {
    first = "He wears his father's name like borrowed armor.",
    third = "{name} confronted Scarlet Commander Mograine before the cathedral's altar.",
  },

  greetings = {
    { id = "g_default", text = "Infidel! You've come a long way through my monastery to die at the foot of its altar." },
    { id = "g_quest", when = { questActive = SM_QUEST }, text = "Raleigh's hireling, I suppose. Southshore never could stomach doing its own fighting." },
  },

  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "Another paladin who forgot what the Light is for. My father would have known you for a traitor at a glance." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Renault Mograine, Commander of the Scarlet Crusade in this place, and son of Alexandros Mograine, the Ashbringer. No undead and no sympathizer walks past me." } },
      again = { { id = "h_again", text = "Get on with it, infidel." } },
      choices = {
        { text = "Tell me about your father.", next = "father" },
        { text = "What happened to the Ashbringer?", next = "ashbringer" },
        { text = "You fight like a man with something to prove.", next = "prove" },
        { text = "Draw your blade, Commander.", next = "END" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "The greatest knight of the Silver Hand, who carried the blade the dead feared most. He fell in the Plaguelands fighting the Scourge, and the Crusade carries his name and his cause." } },
      choices = {
        { text = "How exactly did he fall?", next = "fell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fell = {
      lines = { { id = "fl_default", text = "In battle, as any hero should, and I will hear no gossip about it from the likes of you. Ask again, and I'll take it as an insult to my house." } },
      choices = {
        { text = "Your voice shook just now.", next = "BACK", reply = "It did not! Mind your tongue before I cut it out.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashbringer = {
      lines = { { id = "a_default", text = "Lost, in the chaos after my father fell. Whoever holds it now is not worthy of it, and the Crusade will have it back in time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prove = {
      lines = { { id = "p_default", text = "I have nothing to prove to anyone but the Light and the High Inquisitor. Every corpse I burn proves itself well enough." } },
      choices = {
        { text = "Then you're no better than the Scourge.", next = "BACK", reply = "Careful, infidel. That's the sort of thing people say right before they're burned.", fx = { align = { light = 1 } } },
        { text = "A strong hand is what Lordaeron needs.", next = "BACK", reply = "Finally, someone who understands. Too late for you, though.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't trade words with infidels." } },
  },
}

---------------------------------------------------------------------------
-- Arcanist Doan: the Crusade's keeper of the library and its forbidden books.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_doan", id = TODO_NPC("Arcanist Doan"), name = "Arcanist Doan",
  bible = "bibles/dg_doan.md", role = "boss", tier = "quest",
  temper = { "precise", "cold" }, values = { "learned", "zealous" },
  notices = { "class" },
  impression = {
    first = "He guards his books as if they might escape.",
    third = "{name} met Arcanist Doan among the shelves of the Scarlet Library.",
  },

  greetings = {
    { id = "g_default", text = "You are standing in the Scarlet Library, and you are dripping on my floor. State your business, and then leave or burn." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A spellcaster. I can smell the arcane on you, and I wonder which of my books you've come to steal." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Doan, Arcanist of the Scarlet Crusade, and these shelves hold every scrap of knowledge the Crusade has saved or seized. Some of it is holy, and some of it is dangerous, and all of it is mine to keep." } },
      again = { { id = "h_again", text = "Well? I have reading to do." } },
      choices = {
        { text = "What books do you keep here?", next = "books" },
        { text = "A mage among zealots? That's odd.", next = "mage" },
        { text = "Do you burn the books you seize?", next = "burn" },
        { text = "I'm here for you, Arcanist.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Histories of Lordaeron, treatises on the Light, the confessions of necromancers, and a few volumes on older things that I keep locked away. The Crusade fights with swords, but it remembers with books." } },
      choices = {
        { text = "Older things?", next = "older" },
        { text = "Something else.", next = "BACK" },
      },
    },
    older = {
      lines = { { id = "o_default", text = "The titans and their makers, mostly, and stranger stories than that. Nothing a passing thief needs to understand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Dalaran fell to the dead the same as everywhere else, and its magi argued until the walls came down. I found a better use for my learning in the Crusade, where it serves the Light instead of the Kirin Tor's vanity." } },
      choices = {
        { text = "Magic in the Light's service is still magic.", next = "BACK", reply = "And a sword in the Light's service is still a sword. The Inquisitor understands that.", fx = { align = { order = -1 } } },
        { text = "Knowledge must serve a cause.", next = "BACK", reply = "Exactly so, and the Crusade is the only cause left worth serving.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "bu_default", text = "Only after I have read them, and only the ones that cannot be used against the dead. Fire is a fine librarian, but a poor scholar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That isn't in any book I care about." } },
  },
}
