-- Barkeep Daniels, Lakeshire Inn. Voice: bibles/daniels.md
-- The orcs have cut off his shipments, and a dry bar is a sad bar.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daniels", id = TODO_NPC("Barkeep Daniels"), name = "Barkeep Daniels",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "generous", "witty" },
  notices = { "drink", "travel" },

  greetings = {
    { id = "g_bar", text = "What'll it be? Don't say ale. I'm nearly out of ale." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Any luck? Tell me there's a keg in that pack." },
    { id = "g_after", when = { questDone = TODO_QUEST("Dry Times") }, text = "My saviour! The good bottles are back on the shelf, thanks to you." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had plenty somewhere else. Shame. I could've used the custom." },
    { id = "n_travel", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been to Darkshire! Did you try the moonshine? Course you did. You've got the look." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daniels. I keep the bar. Or I did, when there was something to keep. The orcs hit the road and my shipment never came." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dry Times") },
          text = "Thunderbrew lager from the hills in Westfall, merlot from Stormwind, moonshine from Darkshire, sweet rum from Goldshire. A proper bar needs all four. I've got none." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Each one, mind. Don't drink them on the way. I'll know. I always know." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dry Times"), days = 3 } },
          text = "Listen to that room. That's the sound of Lakeshire forgetting about orcs for an evening. You did that." },
        { id = "h_wiley", when = { metBefore = true },
          text = "Wiley's in the corner, if you're looking for him. Nobody's ever looking for Wiley. Except the ones who are." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky folk drink? Course they do. Whatever they pour up there, down here it's whatever I've got left." },
      },
      choices = {
        { text = "Pour me whatever you've got.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Just passing through.", next = "END" },
      },
    },
    news = {
      lines = {
        { id = "n_default", text = "Guards drink, guards talk. The orcs are getting bolder, the bridge is getting nowhere, and the magistrate's writing another letter." },
      },
      choices = { { text = "Sounds about right.", next = "END", fx = { learn = { "blackrock" } } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "They stopped my wagons. That's personal." } },
    everstill_bridge = { { id = "tp_bridge", text = "The bridge crew drink here. They drink like men who've rebuilt the same thing three times." } },
    _none = { { id = "tp_none", text = "A barkeep hears everything and remembers nothing. House rule." } },
  },
}
