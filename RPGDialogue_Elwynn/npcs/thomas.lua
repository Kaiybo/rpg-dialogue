-- Guard Thomas, the bridge west of Eastvale Logging Camp. Voice: bibles/thomas.md
-- Two of his footmen went up the river and didn't come back.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thomas", id = TODO_NPC("Guard Thomas"), name = "Guard Thomas",
  bible = "bibles/thomas.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "lawful", "brave" },
  notices = { "kit", "death" },

  greetings = {
    { id = "g_business", text = "State your business with the Stormwind Army." },
    { id = "g_search", when = { questActive = TODO_QUEST("Find the Lost Guards") }, text = "Anything? North, along the river. Anything at all." },
    { id = "g_after", when = { questDone = TODO_QUEST("Report to Thomas") }, text = "Citizen. You have my thanks still." },
    { id = "g_frontier", when = { questActive = TODO_QUEST("Protect the Frontier") }, text = "Wolves and bears. The logging camp's counting on you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's not fit for the frontier. I've buried men who thought theirs was. See a smith in Goldshire." },
    { id = "n_died_here", cat = "death", when = { deathsHere = { min = 2 } },
      text = "You've been carried off this road twice already. I'd rather not write a third report with your name in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Thomas, Stormwind Army. I hold this bridge. East of here, the forest stops being friendly." },
        { id = "h_concerns", tags = { "news" }, when = { questActive = TODO_QUEST("Further Concerns") },
          text = "Dughan sent you. Good. I asked for soldiers and got one adventurer. I'll take it." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Find the Lost Guards") },
          text = "Rolf Hartford and Malakai Stone. I sent them north along the river to look into the murloc talk. They never came back." },
        { id = "h_malakai", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Find the Lost Guards"), days = 2 } },
          text = "Malakai's medallion. I'll see it reaches his family. That's the job no one tells you about when you sign." },
        { id = "h_rolf", tags = { "news" }, when = { questActive = TODO_QUEST("Discover Rolf's Fate") },
          text = "Rolf's still out there. Webbed tracks, you said, toward the lake. Find him. Whatever's left, I want to know." },
        { id = "h_report", tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Thomas"), days = 3 } },
          text = "Murlocs. Remy at the inn said it first, and half of Goldshire called him a liar. I'll be buying Remy a drink. Light help me.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "h_later", when = { questLater = { TODO_QUEST("Report to Thomas"), days = 7 } },
          text = "Two names on a page to the Marshal. It's never enough page." },
        { id = "h_westfall", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Westfall needs hands more than I do. Gryan Stoutmantle, Sentinel Hill. Tell him the Elwynn bridge sends regards." },
        { id = "h_hero", when = { townStanding = { town = "eastvale", min = 30 } },
          text = "The loggers talk about you. So do my men, the ones I have left. All good." },
      },
      choices = {
        { text = "What happened to your men?", next = "men", when = { questDone = TODO_QUEST("Find the Lost Guards") } },
        { text = "What's out east?", next = "east" },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    men = {
      big = true,
      lines = {
        { id = "m_default", text = "They did their duty. They went where they were sent. That's all the comfort I've got, and some days it's thin." },
      },
      choices = {
        { text = "They'd be proud you remember them.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Then make sure it wasn't for nothing.", next = "END", fx = { affinity = 1, trait = { stern = 1 }, align = { order = 1 } } },
      },
    },
    east = {
      lines = {
        { id = "e_default", text = "The logging camp, Marshal Haggard's place, the tower where the mage lives. Wolves and bears get bolder the further you are from Goldshire." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "END", fx = { learn = { "eastvale" } } },
      },
    },
  },

  topics = {
    murlocs_east = {
      { id = "tp_murlocs", text = "Up the river and around Stone Cairn Lake. Don't go alone. My men did." },
    },
    lost_footmen = { { id = "tp_footmen", text = "Rolf Hartford. Malakai Stone. Remember the names, if you remember nothing else." } },
    eastvale = { { id = "tp_eastvale", text = "Loggers and their quotas. They'd cut through a bear if it stood still long enough." } },
    defias = { { id = "tp_defias", text = "Westfall's problem, mostly. Gryan Stoutmantle's handling it, without much help from the city." } },
    _none = { { id = "tp_none", text = "That's above my post. Ask the Marshal in Goldshire." } },
  },
}
