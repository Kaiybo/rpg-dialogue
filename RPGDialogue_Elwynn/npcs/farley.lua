-- Innkeeper Farley, Lion's Pride Inn, Goldshire. Voice: bibles/farley.md
-- The rumor mill of Goldshire. Hearsay, so some of it is wrong.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "farley", id = TODO_NPC("Innkeeper Farley"), name = "Innkeeper Farley",
  bible = "bibles/farley.md", role = "innkeeper", tier = "major",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "generous", "witty" },
  notices = { "guest", "pet", "drink" },

  greetings = {
    { id = "g_welcome", text = "Welcome to the Lion's Pride! Sit anywhere the dog isn't." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Your usual corner's free." },
    { id = "g_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } }, text = "Home again! Boots off by the fire, if you please." },
  },

  notice = {
    { id = "n_imp", cat = "pet", place = "before", when = { pet = { family = "Imp" } },
      text = "Your imp doesn't sleep in the beds. I don't care what it promises you." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough for tonight, friend. Dobbins! Water for this one, and bread." },
    { id = "n_away", cat = "guest", when = { homeInn = { "Goldshire", "Lion's Pride Inn" }, daysSince = { min = 14 } },
      text = "Look who remembered where they sleep! Two weeks, near enough. I nearly let your room." },
  },

  react = {
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Not in here! Not near the curtains!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Mind the tables! That's oak, that is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My family's kept the Lion's Pride since the first King Llane's day. We've never watered a drink. Ask anyone." },
        { id = "h_falkhaan", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rest and Relaxation"), days = 1 } },
          text = "Falkhaan sent you? Then take the good chair by the fire. Any friend of his is a friend of mine." },
        { id = "h_liked", when = { townStanding = { town = "goldshire", min = 30 } },
          text = "Half the town's asked after you this week. The other half's jealous." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Stalvan? He did stay here, years back. Paid in coin, kept to himself, wrote letters he never sent." },
      },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Heard anything interesting?", next = "rumors" },
        { text = "Just stopping in.", next = "END" },
      },
    },

    -- Rumors: local news, word from nearby, reactions to the player's own deeds.
    rumors = {
      lines = {
        { id = "r_default", text = "Quiet week. In Goldshire that means three fights, a lost cow and one bard we asked to leave." },
        { id = "r_hogger", key = true, when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Another hunter went after Hogger yesterday. Came back on a cart. They always come back on a cart.",
          fx = { hear = "hogger_unbeatable", learn = { "hogger" } } },
        { id = "r_hogger_you", when = { questRecent = { TODO_QUEST("WANTED: \"Hogger\""), days = 3 } },
          text = "They say someone finally put Hogger down. That wasn't you, was it? Sit, sit. Tell me everything.",
          tags = { "news" } },
        { id = "r_murlocs", key = true, when = { questBefore = TODO_QUEST("A Fishy Peril") },
          text = "Remy's telling everyone there are murlocs in the eastern streams. Telling them twice, naturally.",
          fx = { hear = "murlocs_in_elwynn", learn = { "murlocs_east" } } },
        { id = "r_lovers", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "William's been mixing something private upstairs. Smells of the sea. I asked no questions. I'm a good innkeeper.",
          fx = { learn = { "maybell_tommy" } } },
      },
      choices = {
        { text = "Thanks, Farley.", next = "END" },
        { text = "Hogger can't be that bad.", next = "END", when = { heardClaim = "hogger_unbeatable" }, fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    lions_pride = { { id = "t_inn", text = "Best inn between Stormwind and Lakeshire, and I'll argue with anyone who says otherwise. Politely." } },
    defias = { { id = "t_defias", text = "They rob travelers on the Westfall road. Bad for business, worse for the travelers." } },
    hogger = { { id = "t_hogger", text = "Can't be killed, they say. Every hunter that tries comes back on a cart.", fx = { hear = "hogger_unbeatable" } } },
    murlocs_east = { { id = "t_murlocs", text = "Remy swears by it. Remy swears by a lot of things." } },
    the_collector = { { id = "t_collector", text = "Some rider paid me in gold dust once. Gold dust! Never saw him again." } },
    gold_dust = { { id = "t_dust", text = "Remy buys it, Remy sells it, Remy talks about it. Mostly he talks about it." } },
    _none = { { id = "t_none", text = "Not a word of that's reached my bar. That's rare." } },
  },
}
