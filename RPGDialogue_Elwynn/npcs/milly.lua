-- Milly Osworth, Northshire Vineyards. Voice: bibles/milly.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "milly", id = TODO_NPC("Milly Osworth"), name = "Milly Osworth",
  bible = "bibles/milly.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "drink", "farmhand" },

  greetings = {
    { id = "g_vines", text = "Mind the vines!" },
    { id = "g_crates", when = { questActive = TODO_QUEST("Milly's Harvest") }, text = "Any crates? Even a few?" },
    { id = "g_thanks", when = { questDone = TODO_QUEST("Milly's Harvest") }, text = "There's my harvest hero. Mind the vines all the same." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "Is that our wine on your breath? At least you've good taste." },
    { id = "n_farmhand", cat = "farmhand", when = { origin = "human_westfall_farmhand" },
      text = "You've worked a harvest. I can tell by the way you stand around a crate." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The Defias walked in like they owned the place and now they mostly do. My harvest's sitting in their camp." },
        { id = "q_harvest_active", when = { questActive = TODO_QUEST("Milly's Harvest") },
          text = "Every crate you bring back is a week of bread for us. Mind the ones with the knives." },
        { id = "q_harvest_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Milly's Harvest"), days = 2 } },
          text = "You found them! I'd hug you if my hands weren't sticky to the elbow." },
        { id = "q_manifest", when = { questActive = TODO_QUEST("Grape Manifest") },
          text = "Take that manifest to Brother Neals. He'll want to know exactly how much the Abbey's getting. Exactly." },
        { id = "o_contradict", tags = { "news" }, when = { contradiction = "defias" },
          text = "You told the Marshal one thing about the Defias and Willem another. Word gets around a valley this small. Which is it?" },
        { id = "e_dughan", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Common thieves? Common thieves don't post a guard on a stolen grape crate. You tell Marshal Dughan that from me.",
          fx = { hear = "defias_trained" } },
      },
      choices = {
        { text = "Where are your crates?", next = "BUSINESS" },
        { text = "Why not just leave?", next = "leave" },
        { text = "I worked fields like these, before the Defias came.", next = "farm",
          when = { origin = "human_westfall_farmhand" } },
        { text = "Good luck with the harvest.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "Leave? This vineyard was my mother's. The Defias can leave." } },
      choices = {
        { text = "Then I'll help them leave.", next = "END", fx = { trait = { brave = 1 }, standing = { northshire = 2 }, affinity = 1 } },
        { text = "No vineyard is worth dying for.", next = "END", fx = { trait = { cautious = 1 }, affinity = -1 } },
      },
    },
    farm = {
      lines = { { id = "f_default", text = "Then you know. They say Westfall's lost. Don't let them say it about Northshire." } },
      choices = { { text = "I won't.", next = "END", fx = { affinity = 2, standing = { northshire = 1 } } } },
    },
  },

  topics = {
    defias = { { id = "t_defias", text = "They took my harvest and my sleep. Ask me again when they give either back." } },
    northshire_abbey = { { id = "t_abbey", text = "The brothers buy our wine. Brother Neals counts every barrel twice." } },
    _none = { { id = "t_none", text = "Grapes I know. That, I don't." } },
  },
}
