-- Supervisor Raelen, Eastvale Logging Camp. Voice: bibles/raelen.md
-- A lumber order, a deadline, and wolves sitting on the wood.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raelen", id = TODO_NPC("Supervisor Raelen"), name = "Supervisor Raelen",
  bible = "bibles/raelen.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "sharp" }, values = { "lawful", "ambitious" },
  notices = { "idle", "build" },

  greetings = {
    { id = "g_busy", text = "Make it quick. That order won't fill itself." },
    { id = "g_bundles", when = { questActive = TODO_QUEST("A Bundle of Trouble") }, text = "Bundles. Do you have bundles? Then why are you talking?" },
    { id = "g_after", when = { questDone = TODO_QUEST("A Bundle of Trouble") }, text = "Order went out on time. Barely. I don't thank people. Consider this the closest I get." },
  },

  notice = {
    { id = "n_drunk", cat = "idle", when = { drunk = { min = 1 } },
      text = "You're drunk. On my camp. In the middle of the day. Do you know what an axe does to a drunk's foot?" },
    { id = "n_shoulders", cat = "build", when = { class = "WARRIOR" },
      text = "Look at those shoulders. Ever swing an axe at something that isn't trying to kill you? Pays steady." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Supervisor Raelen. I make sure the wood gets cut, stacked and shipped on time. Everybody else makes sure it doesn't." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Bundle of Trouble") },
          text = "Wolves and bears up north ran my lads off. The wood's cut. It's lying there. Nobody will go and fetch it. And the order's due." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Bundle of Trouble") },
          text = "Eight bundles. North, where the animals are. Not kindling, not twigs. Bundles." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Bundle of Trouble"), days = 2 } },
          text = "Wagon's loaded. If the buyer complains about bark, that's on him." },
        { id = "h_rainer", text = "I told the deputy about the animals. Days ago. Rainer, his name is. Has anyone seen him since? Anyone at all?" },
        { id = "h_frontier", when = { questDone = TODO_QUEST("Protect the Frontier") },
          text = "Fewer wolves this week. Somebody's been busy. If that was you, the lads are grateful. I'm too busy to be." },
      },
      choices = {
        { text = "Where's the deputy?", next = "rainer" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    rainer = {
      lines = {
        { id = "r_default", text = "Westbrook, apparently. The other end of the forest. I asked a deputy for help and got directions to a different deputy." },
      },
      choices = {
        { text = "Want me to have a word with him?", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like you'll have to manage.", next = "END", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    eastvale = { { id = "tp_eastvale", text = "Best timber in Elwynn. Worst luck. Write that on my stone." } },
    kobolds = { { id = "tp_kobolds", text = "Not my problem until they start eating lumber. Give it time." } },
    _none = { { id = "tp_none", text = "Does it ship? No? Then I don't know about it." } },
  },
}
