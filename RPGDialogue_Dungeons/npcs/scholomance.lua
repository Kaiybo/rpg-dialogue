-- Scholomance: Darkmaster Gandling, headmaster of the Cult of the Damned's school of
-- necromancy, and Ras Frostwhisper, the lich who was once a man of Caer Darrow. Both speak
-- before they fight.
-- Voices: bibles/dg_gandling.md, bibles/dg_ras.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Darkmaster Gandling: headmaster of the Scholomance, cold and condescending.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_gandling", id = TODO_NPC("Darkmaster Gandling"), name = "Darkmaster Gandling", title = "Headmaster",
  bible = "bibles/dg_gandling.md", role = "boss", tier = "quest", gender = "male",
  temper = { "condescending", "cold" }, values = { "ambitious", "learned" },
  notices = { "class" },
  impression = {
    first = "He speaks to you like a tutor grading a disappointing essay.",
    third = "{name} faced Darkmaster Gandling, headmaster of the Scholomance in Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "A late applicant. How unusual. Most of our students arrive in chains." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You bargain with demons for scraps of power. Here we command death itself, and death does not haggle." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. How quaint. Your Light makes a pleasant glow, and it will not save a single student in these halls." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gandling, headmaster of the Scholomance. Kel'Thuzad founded this school to train the Cult's finest necromancers, and I have made it the finest school of its kind in the world." },
      },
      again = {
        { id = "h_again", text = "Another question? Class is nearly over." },
        { id = "h_again2", text = "Do continue. I so rarely get to lecture the living." },
      },
      choices = {
        { text = "What do you teach here?", next = "curriculum" },
        { text = "What happened to the Barovs?", next = "barov" },
        { text = "Who do you answer to?", next = "master" },
        { text = "School's out, Gandling.", next = "END" },
      },
    },
    curriculum = {
      lines = { { id = "c_default", text = "Raising the dead, binding the spirit, the dissection of the living and the reassembly of what remains. Practical subjects. Our graduates walk out of here and serve the Lich King for eternity." } },
      choices = {
        { text = "Knowledge is knowledge, whatever its use.", next = "BACK", reply = "Finally, an open mind. A pity it will soon be in a jar on my shelf.", fx = { align = { light = -1 } } },
        { text = "This is an abomination.", next = "BACK", reply = "So said every paladin who came through those doors. Many of them are on the faculty now.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barov = {
      lines = { { id = "b_default", text = "Lord Alexei Barov handed us his family's keep in exchange for immortality. We honoured the bargain. He and his lady wife now haunt the halls they once owned. Their children squabble outside over the deeds." } },
      choices = {
        { text = "The Barov heirs want this place back.", next = "heirs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirs = {
      lines = { { id = "he_default", text = "Weldon and Alexi, each sending adventurers to murder the other's servants. They will never set foot here. I almost admire how little the dead have changed them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = { { id = "m_default", text = "To Kel'Thuzad, who answers to the Lich King. The master watches from Naxxramas, and he is very pleased with our progress. You, I suspect, will be a footnote in my next report." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Ras Frostwhisper: the lich of Caer Darrow, once a living man of the island.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ras", id = TODO_NPC("Ras Frostwhisper"), name = "Ras Frostwhisper",
  bible = "bibles/dg_ras.md", role = "boss", tier = "quest", gender = "male",
  temper = { "icy", "melancholy" }, values = { "proud", "lost" },
  notices = {},
  impression = {
    first = "There is a faint echo of a man under all that frost, and it does not like being reminded.",
    third = "{name} faced Ras Frostwhisper, the lich of the Scholomance.",
  },

  greetings = {
    { id = "g_default", text = "The cold of this room is mine. You may breathe it, for now." },
    { id = "g_human", when = { questActive = TODO_QUEST("The Human, Ras Frostwhisper") }, text = "You carry something that smells of a life I left behind. Put it away." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ras Frostwhisper. I learned the arts of death in these halls and paid for them with my heart. Now I keep the Scholomance cold, and I do not miss the warmth." },
      },
      again = { { id = "h_again", text = "Speak. My patience is long, but it is not endless." } },
      choices = {
        { text = "Who were you before?", next = "before" },
        { text = "Why did you give up your life?", next = "why" },
        { text = "Your phylactery won't save you.", next = "END" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A man of Caer Darrow, with a family and a small house by the lake. I do not remember their faces any longer, and I tell myself that is a mercy." } },
      choices = {
        { text = "Some part of you still remembers.", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "r_default", text = "Then that part will die with me, today or in a thousand years. It is weak, and the weak are only material here." } },
      choices = {
        { text = "That part of you could still be saved.", next = "BACK", reply = "Saved. What a warm word. Say it again and I will freeze it on your tongue.", fx = { align = { light = 1 } } },
        { text = "Then you deserve whatever comes.", next = "BACK", reply = "Of course I do. Everyone in this building does. That has never stopped any of us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a living man is a candle, and I had seen what a single winter does to candles. The Lich King offered me the winter itself, and I took it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
