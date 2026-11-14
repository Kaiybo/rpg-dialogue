-- Llane Beshere, warrior trainer, Northshire Abbey. Voice: bibles/llane.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "llane", id = TODO_NPC("Llane Beshere"), name = "Llane Beshere",
  bible = "bibles/llane.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "fitness", "stance" },

  greetings = {
    { id = "g_feet", text = "Feet apart. What do you need?" },
    { id = "g_drills", when = { class = "WARRIOR" }, text = "Back for more drills?" },
  },

  notice = {
    { id = "n_ressick", cat = "fitness", place = "before", when = { resSick = true },
      text = "You died recently. I can see it in how you stand. Sit before you fall." },
    { id = "n_naked", cat = "fitness", when = { nearlyNaked = true, class = "WARRIOR" },
      text = "A warrior without armor is a target with opinions." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Warriors are made, not born. Mostly by getting knocked down and standing back up." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Simple Letter"), days = 1 } },
          text = "So you can read. Good. Let's see if you can stand." },
        { id = "h_warrior_blooded", when = { class = "WARRIOR", band = "Blooded" },
          text = "You've put on some muscle. Still dropping your guard on the left, though." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Hunters. Always trying to win a fight from across the field." },
        { id = "h_other", when = { ["not"] = { class = { "WARRIOR", "HUNTER" } } },
          text = "Not my student. The drills wouldn't kill you, though. Probably." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Any advice?", next = "advice" },
        { text = "Later.", next = "END" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Hit first. Hit hard. Don't stop until it stops moving." },
        { id = "a_green", when = { class = "WARRIOR", band = "Greenhorn" },
          text = "Charge in, then keep them close. A warrior at range is a corpse with good intentions." },
      },
      choices = {
        { text = "Understood.", next = "END", fx = { trait = { brave = 1 } } },
        { text = "Sounds simple enough.", next = "END", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    kobolds = { { id = "t_kobolds", text = "Small, fast, cowardly. Perfect practice." } },
    _none = { { id = "t_none", text = "Do I look like a librarian?" } },
  },
}
