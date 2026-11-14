-- Foreman Oslow, at the Everstill Bridge. Voice: bibles/oslow.md
-- On schedule, under budget, and with no tools.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oslow", id = TODO_NPC("Foreman Oslow"), name = "Foreman Oslow",
  bible = "bibles/oslow.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "craft", "swim" },

  greetings = {
    { id = "g_busy", text = "Unless you're carrying a hammer, keep walking." },
    { id = "g_tools", when = { questActive = TODO_QUEST("The Lost Tools") }, text = "My toolbox? Have you got my toolbox? Then why are you dry?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "Look at that span. Go on, look at it. That's craftsmanship." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Engineering", "Mining" } },
      text = "You've a tradesman's hands. If you ever want honest work that isn't stabbing things, I'm hiring. I'm always hiring. Nobody stays." },
    { id = "n_wet", cat = "swim", when = { questReady = TODO_QUEST("The Lost Tools") },
      text = "You're dripping on my plans. Never mind. Is that my box? That's my box!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Oslow. I'm rebuilding the Everstill Bridge, on schedule and under budget, before the rains. That was the plan. Then the orcs had opinions." },
        { id = "h_tools", when = { questBefore = TODO_QUEST("The Lost Tools") },
          text = "My tools came across the lake by boat. A catapult put the boat at the bottom. My tools are down there with it. My good hammer." },
        { id = "h_tools_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Tools") },
          text = "Off the end of the wreck, at the bottom. Hold your breath, mind the murlocs, and don't drop it on the way up." },
        { id = "h_tools_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Lost Tools"), days = 3 } },
          text = "Rusted shut, but they're mine. Every one's got my mark on the handle. Back to work." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("The Everstill Bridge") },
          text = "Gnolls took a whole shipment of timber and stone. What does a gnoll want with dressed stone? They don't even build." },
        { id = "h_rains", when = { questDone = TODO_QUEST("The Everstill Bridge") },
          text = "The rains are coming. The bridge will be done before they do. Write that down somewhere I can point at later." },
        { id = "h_bridge", when = { metBefore = true }, text = "Laid another span yesterday. Straight as a ruler. I stood on it a while. Don't tell the crew. They'll think I've gone soft about bridges." },
      },
      choices = {
        { text = "Why does the bridge matter so much?", next = "why" },
        { text = "Good luck with the rains.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Without it, every guard, every wagon, every sack of grain goes the long way round the lake. A bridge is just a town's way of not being alone." },
      },
      choices = {
        { text = "I'll help you finish it.", next = "END", fx = { affinity = 2, learn = { "everstill_bridge" } } },
        { text = "Pretty speech for a builder.", next = "speech", fx = { trait = { witty = 1 } } },
      },
    },
    speech = {
      lines = { { id = "sp_default", text = "I had it carved on the last bridge. The orcs knocked that one down too." } },
      choices = { { text = "Ha. Fair.", next = "END" } },
    },
  },

  topics = {
    everstill_bridge = { { id = "tp_bridge", text = "Before the rains. That's not a hope, that's a schedule." } },
    blackrock = { { id = "tp_blackrock", text = "They knock down what I build. I build it again. One of us is going to get tired, and it isn't me." } },
    _none = { { id = "tp_none", text = "Is it load-bearing? Then I don't care." } },
  },
}
