-- More of the Sepulcher: Astor Hadren (a courier with a secret employer, and the mark of
-- the rogues' Deathstalkers chain), Sarah Goode (stable master), Andrew Hilbert (trade
-- supplies), Patrice Dwyer (poisons), Johan Focht (mining) and Nadia Vernon (bowyer).
-- Voices: bibles/sepulcher_folk.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Patrice Dwyer
---------------------------------------------------------------------------
P:NPC {
  key = "patrice_dwyer", id = TODO_NPC("Patrice Dwyer"), name = "Patrice Dwyer", title = "Poison Supplies",
  bible = "bibles/sepulcher_folk.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "cheerful" }, values = { "curious", "proud" },
  notices = { "class" },

  impression = {
    first = "Patrice Dwyer sells poison supplies at the Sepulcher and talks about them the way other people talk about their gardens. The apothecaries look down on her, and she returns the favor.",
    third = "{name} met Patrice Dwyer, who sells poisons to the Sepulcher's rogues.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch the green jars, or the blue ones, and actually, keep your hands behind your back." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "A rogue! Come closer, I've a fresh batch that'll make a Dalaran wizard forget his own name." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrice Dwyer, poison supplies, and everything on my shelf is perfectly legal in the Undercity before you say a word. Rogues buy from me, apothecaries sneer at me, and the worgen have never once complained." },
      },
      again = {
        { id = "h_again", text = "Something else, dear? Mind the green jars." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do the apothecaries mind your trade?", next = "apoth" },
        { text = "Do poisons even work on the dead?", next = "dead" },
        { text = "I'll go.", next = "END" },
      },
    },
    apoth = {
      big = true,
      lines = { { id = "a_default", text = "Oh, they mind terribly, because they think anyone who mixes a poison outside the Apothecarium is a dabbler and a danger. I think a poison that drops one worgen at a time is a good deal tidier than some of what goes into their cauldrons, but nobody asked me." } },
      choices = {
        { text = "Poison is a coward's weapon, whoever brews it.", next = "BACK", reply = "A coward's weapon wins wars, my dear, and the Scourge are not owed a fair duel. Buy a vial or move along.", fx = { align = { honor = 1 } } },
        { text = "Poison wins fights. Pride loses them.", next = "BACK", reply = "Exactly, and the Apothecarium has more pride than the rest of the Undercity put together. Come back when you need a refill.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Not much, which is a great comfort to me, since I spill more than I'd like. On the worgen they work beautifully, and on Dalaran's wizards they work slowly, which is better, because a slow wizard can't cast." } },
      choices = {
        { text = "Have you tested them on worgen yourself?", next = "dead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead2 = {
      lines = { { id = "d2_default", text = "A deathstalker brought me a worgen pelt with a dart still in it, and I studied that pelt for a week. I've been working on something stronger ever since, though whatever lives in Shadowfang Keep seems to shrug most of it off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a clue, dear. If it isn't in a jar, it isn't my business." } },
  },
}

---------------------------------------------------------------------------
-- Johan Focht
---------------------------------------------------------------------------
P:NPC {
  key = "johan_focht", id = TODO_NPC("Johan Focht"), name = "Johan Focht", title = "Mining Trainer",
  bible = "bibles/sepulcher_folk.md", role = "trainer", tier = "service",
  communities = { "sepulcher" }, temper = { "gruff" }, values = { "practical", "craft" },
  notices = { "craft" },

  impression = {
    first = "Johan Focht teaches mining at the Sepulcher with the patience of a man who spent half his life underground. He keeps clear of Ambermill, where Dalaran's mages carry crates into the old workings and nothing out.",
    third = "{name} met Johan Focht, the Sepulcher's mining trainer.",
  },

  greetings = {
    { id = "g_default", text = "Mind the pick. It's sharper than it looks, and so am I." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Copper dust on your boots! You've been in the hills, then, and come back with all your fingers, which is a good start." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Johan Focht. I teach mining, which in Silverpine means teaching you to swing a pick without waking anything in the hills that ought to stay asleep." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask it plain." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where's the good ore around here?", next = "ore" },
        { text = "Did you mine in life?", next = "past" },
        { text = "I'll go.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper in the hills east of the road and tin if you look harder, and silver now and then where the rock's been split open. Keep clear of the old workings near Ambermill, because Dalaran's mages have taken a liking to them and they don't like visitors." } },
      choices = {
        { text = "Why would mages want old mine shafts?", next = "ore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore2 = {
      lines = { { id = "o2_default", text = "For whatever lies under Ambermill, I expect, which is none of my business and all of my curiosity. I've watched them carry crates in and nothing out, and that's all I'll say about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      big = true,
      lines = { { id = "p_default", text = "I dug silver in the hills north of the capital for twenty years, and the plague found me underground, which was a poor joke on its part. When I woke, the first thing I asked for was a pick, and the Dark Lady's people were good enough to give me one." } },
      choices = {
        { text = "Honest work is what keeps us whole.", next = "BACK", reply = "It does, I think. A pick in the hand reminds me I'm still a miner, and not just something the plague left behind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Twenty years underground? I'd want something new.", next = "BACK", reply = "New? I'm dead, friend, and the dead don't get much new. The tunnels are the one place that still feels like mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know rock, and that isn't rock, so ask somebody at the inn." } },
  },
}
