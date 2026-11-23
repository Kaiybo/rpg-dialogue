-- Uldaman: the titan vault beneath the Badlands. Ironaya, the stone keeper who speaks before she
-- wakes to fight, and Archaedas, the ancient stone watcher of the Titans' disc chamber.
-- Voices: bibles/dg_ironaya.md, bibles/dg_archaedas.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Annora: a master enchanter hiding in a scorpid-infested chamber of Uldaman.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_annora", id = 11073, name = "Annora", title = "Master Enchanter", role = "trainer", tier = "service",
  temper = { "reclusive", "sharp" }, values = { "craft", "solitude" },
  notices = { "craft" },
  greetings = {
    { id = "g_default", text = "So you got past my scorpids. That's more than most manage, and I suppose it earns you a moment of my time." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = { "Enchanting" } },
      text = "An enchanter. I thought as much, since nobody else would bother coming this far to find me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I'm Annora, and I teach the higher arts of enchanting to those who are clever and brave enough to find me. These ruins are quiet, the scorpids keep the curious away, and the titans' stone hums with old magic." } },
      again = { { id = "h_again", text = "Anything else? I was in the middle of something." } },
      choices = {
        { text = "Why hide in Uldaman?", next = "hide" },
        { text = "The titans' stone hums?", next = "stone" },
        { text = "Teach me.", next = "BUSINESS", when = { profession = { "Enchanting" } } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    hide = {
      lines = { { id = "h2_default", text = "Because cities are noisy and full of people asking me to enchant their boots for free. Here the only interruptions are troggs and dwarves of the Explorers' League, and the scorpids handle both nicely." } },
      choices = {
        { text = "Knowledge should be shared, not hidden.", next = "BACK", reply = "I share it, with those who come looking. That's a test, not a wall.", fx = { align = { order = 1 } } },
        { text = "I'd hide too, if I were you.", next = "BACK", reply = "Then you understand me better than most.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "The titans built this place to hold something, and their magic still runs through every carved wall. An enchanter can feel it in her fingers, like the air before a storm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I came here to be left alone, so I don't keep up with gossip." } } },
}
