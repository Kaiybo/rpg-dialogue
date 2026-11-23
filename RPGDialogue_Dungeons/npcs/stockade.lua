-- The Stockade: Stormwind's prison in riot. Bazil Thredd, the Defias go-between behind the
-- uprising, and Kam Deepfury, the Dark Iron dwarf held since Thandol Span, talk before they fight.
-- Voices: bibles/dg_bazil_thredd.md, bibles/dg_kam_deepfury.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bazil Thredd: Defias agent, the prisoner who started the riot.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_bazil_thredd", id = TODO_NPC("Bazil Thredd"), name = "Bazil Thredd",
  bible = "bibles/dg_bazil_thredd.md", role = "boss", tier = "quest",
  temper = { "sly", "smug" }, values = { "cunning", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "He smiles like a man who knows exactly where the keys are.",
    third = "{name} confronted Bazil Thredd, ringleader of the Stockade riot.",
  },

  greetings = {
    { id = "g_default", text = "Ah, visitors. Mind the blood on the floor; the guards weren't very cooperative." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Bazil Thredd") }, text = "Someone's paying good coin for my head, I see. Shame, really. I was enjoying the run of the place." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Then you know a riot is just a distraction, friend. The question is what it distracts from." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A good Stormwind citizen. How's the city above? Still pretending everything's fine?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bazil Thredd, at your service, or at least at the Brotherhood's. The Stockade was a fine place to sit and wait until the right people found a use for a riot." },
      },
      again = { { id = "h_again", text = "Still talking? The guards will be back eventually, so do hurry." } },
      choices = {
        { text = "Why start a riot here?", next = "riot" },
        { text = "Who are you working for?", next = "who" },
        { text = "What about the prisoners who aren't Defias?", next = "others" },
        { text = "You're going back in a cell.", next = "END" },
      },
    },
    riot = {
      lines = { { id = "r_default", text = "Because Stormwind keeps half the Brotherhood's men locked down here, and a city with a burning prison under its canal isn't watching its harbor or its mines. Every guard sent down here is one fewer anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "VanCleef, of course, and whoever VanCleef answers to, if he answers to anyone. I carry messages, I don't read them. Mostly." } },
      choices = {
        { text = "Give me names, and I'll speak for you.", next = "BACK", reply = "Generous, but a man who names names in this city doesn't live to enjoy the mercy. I'll take my chances with you.", fx = { align = { order = 1 } } },
        { text = "Keeping quiet is the only honor thieves have.", next = "BACK", reply = "Well said. You'd do fine on our side of the bars.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Dextren, Targorr, Hamhock, the Dark Iron fellow? Useful noise, nothing more. They'd have stayed rotting here forever, so I've done them a kindness, if you think about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    defias = { { id = "tp_def", text = "The Brotherhood remembers its friends, which is more than Stormwind does." } },
    _none = { { id = "tp_none", text = "Couldn't say. I've been locked up, you understand." } },
  },
}

---------------------------------------------------------------------------
-- Kam Deepfury: a Dark Iron dwarf imprisoned for the attack on Thandol Span.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kam_deepfury", id = TODO_NPC("Kam Deepfury"), name = "Kam Deepfury",
  bible = "bibles/dg_kam_deepfury.md", role = "boss", tier = "quest",
  temper = { "furious", "defiant" }, values = { "proud", "vengeful" },
  notices = { "race" },
  impression = {
    first = "He's chained no longer, and clearly has years of anger saved up.",
    third = "{name} confronted Kam Deepfury, the Dark Iron prisoner of the Stockade.",
  },

  greetings = {
    { id = "g_default", text = "Out of the cell for the first time in years, and the first face I see is yours. Fitting." },
    { id = "g_fury", when = { questActive = TODO_QUEST("The Fury Runs Deep") }, text = "Wetlands sent you, did they? Still sore about the bridge, are they? Good." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard. Your kind put me here, and your kind will regret it. Ironforge always does, in the end." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kam Deepfury, of the Dark Iron clan. They caught me after Thandol Span went down and threw me in here, thinking the walls would hold me forever." },
      },
      again = { { id = "h_again", text = "Talk quick. I've a lot of anger to spend." } },
      choices = {
        { text = "Why did the Dark Irons break Thandol Span?", next = "span" },
        { text = "Why do your clan hate Ironforge so much?", next = "clans" },
        { text = "Where will you go now?", next = "free" },
        { text = "You're not leaving this place.", next = "END" },
      },
    },
    span = {
      lines = { { id = "s_default", text = "Because it joined Ironforge to the rest of the Alliance, and every stone of it was an insult to us. Cut the bridge and you cut the alliance in two. Simple enough." } },
      choices = {
        { text = "Innocent travelers died there.", next = "BACK", reply = "Nobody who crosses a Bronzebeard bridge is innocent, as far as I'm concerned.", fx = { align = { light = 1 } } },
        { text = "It was a clever blow, I'll admit.", next = "BACK", reply = "Ha! Finally, someone with an eye for strategy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    clans = {
      lines = { { id = "c_default", text = "The War of the Three Hammers, if you know any history. Thaurissan lost, and the Bronzebeards and Wildhammers have been telling the story as if they were the heroes ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    free = {
      lines = { { id = "f_default", text = "Home to the mountain, to Blackrock Depths, where my clan will be glad to have me back. Then, one day, I'll come back here with a hammer and finish what I started." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I've no time for your chatter." } },
  },
}
