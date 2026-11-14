-- Talonbranch Glade: the Alliance's only post in Felwood, around its moonwell. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "golhine", id = TODO_NPC("Golhine the Hooded"), name = "Golhine the Hooded", title = "Druid Trainer",
  bible = "bibles/felwood.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet" }, values = { "wise", "patient" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "You've come far to train in a sick forest. Good. Sit by the well." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "The moonwell is clean. Little else here is. Rest a moment, if you need to." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Careful in that shape out there. The bears of Felwood are sick, and they'll take you for kin. Then for food." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Golhine. I teach the druids who come this far north. Few do. A druid who only knows healthy places hasn't learned much." },
        { id = "h_hood", when = { metBefore = true },
          text = "You're wondering about the hood. Everyone does. It keeps the ash off. That's all. People prefer a better story." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moonwell is brightest now. Look at it, then look at the trees. That's the difference we're fighting for." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why teach here?", next = "why" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because a forest this sick needs druids who aren't afraid of it. I can't make the young ones unafraid. I can make them used to it." },
      },
      choices = { { text = "That's a hard lesson.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle heals the south of the forest. We hold the north. The middle belongs to the demons, for now." } },
    _none = { { id = "tp_none", text = "I don't know." } },
  },
}
