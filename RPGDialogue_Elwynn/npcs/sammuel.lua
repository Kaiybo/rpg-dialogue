-- Brother Sammuel, paladin trainer, Northshire Abbey. Voice: bibles/sammuel.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sammuel", id = TODO_NPC("Brother Sammuel"), name = "Brother Sammuel",
  bible = "bibles/sammuel.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "pious", "kind", "brave" },
  notices = { "affliction", "light" },

  greetings = {
    { id = "g_light", text = "The Light keeps you." },
    { id = "g_lesson", when = { class = "PALADIN" }, text = "Ready for your next lesson?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "Not one of mine, but welcome all the same." },
  },

  notice = {
    { id = "n_disease", cat = "affliction", place = "before", when = { debuffType = "Disease" },
      text = "You're sick. Hold still and let me look at you." },
    { id = "n_curse", cat = "affliction", place = "before", when = { debuffType = "Curse" },
      text = "A curse. I can feel it from here. A mage or a druid can lift it. I can only pray." },
    { id = "n_taint", cat = "light", when = { taint = { min = 20 } },
      text = "Something clings to you that the Light doesn't like. I won't ask. Not today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I teach those the Light has chosen. The rest I simply pray for." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Every paladin's first lesson is the same. The Light isn't a weapon you own. It's a trust you keep." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Consecrated Letter"), days = 1 } },
          text = "The Marshal sent you with a letter. Good. Then we begin today." },
        { id = "h_dwarf_paladin", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ironforge sends us more of you each year. Good. Stubbornness is half of faith." },
        { id = "h_squire", when = { origin = "human_paladin_squire" },
          text = "You were a squire of the Silver Hand. Then you know what was lost when it broke. Let's not lose the rest." },
        { id = "h_light", when = { alignment = { axis = "light", min = 50 } },
          text = "You carry yourself like someone who's been forgiven. Or who forgives. Either will serve you." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What does the Light ask of me?", next = "light" },
        { text = "Another time, Brother.", next = "END" },
      },
    },
    light = {
      big = true,
      lines = {
        { id = "l_default", text = "Mercy when it costs you. Courage when it doesn't pay. The rest is detail." },
        { id = "l_shadow", when = { alignment = { axis = "light", max = -30 } },
          text = "You've walked some way from it already. The road back is shorter than you think." },
      },
      choices = {
        { text = "I can do that.", next = "END", fx = { align = { light = 2 }, trait = { pious = 1 }, affinity = 1 } },
        { text = "That's a great deal to ask of anyone.", next = "END", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "t_defias", text = "They're somebody's sons. That doesn't make them less dangerous." } },
    northshire_abbey = { { id = "t_abbey", text = "Where the first paladins learned their oaths. I try to deserve the floor I stand on." } },
    _none = { { id = "t_none", text = "The Light doesn't tell me everything. Neither does Marshal McBride." } },
  },
}
