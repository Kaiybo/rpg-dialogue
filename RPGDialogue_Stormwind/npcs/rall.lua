-- Duthorian Rall, Cathedral of Light. Voice: bibles/rall.md
-- Tests new paladins with charity, penance and the Tome of Divinity.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rall", id = TODO_NPC("Duthorian Rall"), name = "Duthorian Rall",
  bible = "bibles/rall.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "pious", "stern", "honest" },
  spiritSensitive = true,
  notices = { "readiness", "humility" },

  greetings = {
    { id = "g_test", text = "Ready? No one is. Come anyway." },
    { id = "g_wilhelm", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tome of Divinity"), days = 2 } }, text = "Wilhelm sent you. He thinks well of you. Let us see if he's right." },
    { id = "g_tome", when = { questActive = TODO_QUEST("The Tome of Divinity") }, text = "Still at your task? Good. Haste is not a virtue in this work." },
  },

  notice = {
    { id = "n_unready", cat = "readiness", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "You've come into the Cathedral in pieces. Readiness is a virtue too. Mend that, then we'll speak of the Light." },
    { id = "n_proud", cat = "humility", when = { class = "PALADIN", minLevel = 30 },
      text = "You've grown strong since your first test. Strength is the easy part. Tell me you haven't forgotten the hard part." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Duthorian Rall. I test the paladins Brother Wilhelm and Brandur Ironhammer send me. Most pass. Not all the same way." },
        { id = "h_other", when = { ["not"] = { class = "PALADIN" } },
          text = "You're not one of mine, but the Cathedral's doors are open to everyone. Even the ones who only come to look at the windows." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "Whatever the Tome has set you to, it was never about you. It's about who you help on the way, and whether they can repay you. They shouldn't be able to." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "The Symbol of Life is not a trinket. It's a promise that someone will get up again. Carry it like that." },
        { id = "h_henze", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Henze Faulk walks because you knelt by him. Remember how that felt. You'll need to remember it on the days the Light feels far off." },
        { id = "h_stephanie", when = { heardLine = "stephanie.h_tome" },
          text = "Stephanie put you to work, did she? Good. Linen for orphans. You'd be amazed how many great paladins started there." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ironforge's paladins usually go to Brandur. You came to me. Either you're curious or lost. Both are forgivable." },
        { id = "h_daphne", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Valor") },
          text = "Daphne Stilwell's farm, above the Westfall shore. The Brotherhood wants it. Stand with her. She'll likely save you as often as you save her." },
        { id = "h_valor", when = { class = "PALADIN", minLevel = 20 },
          text = "There's another test when you're ready. A test of valor, not compassion. Most paladins prefer it. That's why it comes second." },
      },
      choices = {
        { text = "What does the Light ask of a paladin?", next = "ask" },
        { text = "Why test us at all?", next = "why" },
        { text = "I'll go, Rall.", next = "END" },
      },
    },
    ask = {
      big = true,
      lines = {
        { id = "a_default", text = "Compassion. Patience. Bravery. In that order. Anyone can be made brave. The other two have to be chosen, every day." },
      },
      choices = {
        { text = "Then I choose them.", next = "END", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Bravery should come first.", next = "brave", fx = { trait = { brave = 1 } } },
      },
    },
    brave = {
      lines = { { id = "b_default", text = "Brave without patience is a dead knight. Brave without compassion is something worse. Think on it." } },
      choices = { { text = "I will.", next = "END", fx = { align = { light = 1 } } } },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because a paladin left untested goes soft. The tasks keep you honest. They keep me honest too." },
      },
      choices = { { text = "Fair.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    tome_of_divinity = {
      { id = "tp_tome", text = "The Abbey's book. It's been to the Deadmines and back. Read it slowly. It took its time with us." },
    },
    northshire_abbey = { { id = "tp_abbey", text = "Where most of us began. Brother Sammuel still teaches there. Listen to him; he doesn't repeat himself." } },
    defias = { { id = "tp_defias", text = "Lost men. Some can be found again. Most won't want to be." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Cathedral. Ask in the Trade District; they'll sell you an answer." } },
  },
}
