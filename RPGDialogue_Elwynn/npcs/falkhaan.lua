-- Falkhaan Isenstrider, by the road out of Northshire. Voice: bibles/falkhaan.md
-- Sends tired recruits down the road to his best friend's inn.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falkhaan", id = TODO_NPC("Falkhaan Isenstrider"), name = "Falkhaan Isenstrider",
  bible = "bibles/falkhaan.md", role = "questgiver", tier = "quest",
  communities = { "northshire", "goldshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_road", text = "Road south, friend. Best road in Elwynn. Ends at a fire and a bed." },
    { id = "g_back", when = { questDone = TODO_QUEST("Rest and Relaxation") }, text = "Well? Is the Lion's Pride everything I said?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be walking. The inn's lamps are lit; follow them." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been dead. Have you been dead? You have. Go and sit by a fire for an hour." },
    { id = "n_battered", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Kobolds or wolves? Both? You've the look of someone who's had both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah. You've found the inn already, I see. Or a bottle found you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Falkhaan. I stand by this road and tell tired people where to sleep. Somebody has to." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Rest and Relaxation") },
          text = "Kobolds since sunup, by the look of you. Rest when you're worn down. The Lion's Pride in Goldshire is the place for it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Rest and Relaxation") },
          text = "Straight down the road south, you can't miss it. Tell Farley I sent you. He'll pretend to grumble." },
        { id = "h_after", when = { questDone = TODO_QUEST("Rest and Relaxation") },
          text = "Farley's my oldest friend. Is he still on about the cow? He is, isn't he." },
        { id = "h_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } },
          text = "You've made the Lion's Pride your home. Good choice. Mine too, most nights." },
        { id = "h_recruit", when = { maxLevel = 5, timesTalked = { max = 1 } },
          text = "New recruit. I can always tell. You still look at every wolf like it's personal." },
      },
      choices = {
        { text = "Tell me about the inn.", next = "inn" },
        { text = "Who's Melika?", next = "melika", when = { questDone = TODO_QUEST("Rest and Relaxation") } },
        { text = "I'll find my own bed, thanks.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "i_default", text = "Warm, honest, and the stew's the same stew it's been for twenty years. That's a compliment, whatever Farley says." },
      },
      choices = {
        { text = "I'll go and see.", next = "END", fx = { learn = { "lions_pride" }, affinity = 1 } },
        { text = "You must get a cut.", next = "cut", fx = { trait = { skeptical = 1 } } },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "A cut! Of stew? I get a chair by the fire and a friend who listens. Best pay there is." } },
      choices = { { text = "Fair enough.", next = "END" } },
    },
    melika = {
      lines = {
        { id = "m_default", text = "Melika? Family. She works the main room. If she rolls her eyes at my name, that's how you know she's family." },
      },
      choices = { { text = "I'll say hello.", next = "END" } },
    },
  },

  topics = {
    lions_pride = { { id = "tp_inn", text = "Best inn this side of the city. I'd say that even if Farley weren't listening." } },
    northshire_abbey = { { id = "tp_abbey", text = "Good people up there. They work recruits hard, then send them past me looking half-dead." } },
    defias = { { id = "tp_defias", text = "Not on my road. They keep to the vineyards and the woods. So far." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask in the inn. Ask Farley. He knows everything, mostly wrong." } },
  },
}
