-- Henze Faulk, on the stone ring outside Heroes' Vigil. Voice: bibles/henze.md
-- Killed by the Defias saving his friend; brought back by a young paladin's Symbol of Life.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "henze", id = TODO_NPC("Henze Faulk"), name = "Henze Faulk",
  bible = "bibles/henze.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "honest" },
  spiritSensitive = true,
  notices = { "paladin" },

  greetings = {
    { id = "g_low", text = "Still breathin'. Just about. Don't make me laugh, it hurts." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "Ah! My favourite paladin. Ye're the only one I've got, mind." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", questActive = TODO_QUEST("The Symbol of Life") },
      text = "Is that the Symbol of Life ye've got there? Then mind yer aim. I'd rather not come back halfway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Henze Faulk. Gazin an' me were watchin' the Defias for the king's advisors. They caught Gazin, near enough. I went in after him. They caught me properly." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "I was dead. I know I was. Cold, quiet, nothin'. Then there was you, an' a light, an' a terrible taste in my mouth. Thank ye. I mean it." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Symbol of Life"), days = 7 } },
          text = "Gazin's still feelin' guilty. Tell him to stop. I'd go in after him again. I'd just bring a paladin next time." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Ye wouldnae have a drop of somethin' warmin' on ye? For medicinal purposes. Medicinal." },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf talkin' to the elements! My granddad would've fallen off his stool. I'm just glad somebody's listenin' to the ground. It's got plenty to say." },
        { id = "h_dead", when = { metBefore = true }, text = "Still dead-ish? No, still alive. I check every morning. It's a good habit once ye've been the other thing." },
      },
      choices = {
        { text = "What was it like?", next = "dead" },
        { text = "Rest easy, Henze.", next = "END" },
      },
    },
    dead = {
      big = true,
      lines = {
        { id = "d_default", text = "Quiet. Not bad, not good. Just quiet, like the forge on a holiday. I didnae mind it. I mind bein' back less, though." },
      },
      choices = {
        { text = "I'm glad you're back.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That's oddly comforting.", next = "END", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "They don't fight fair an' they don't leave witnesses. I'm the exception. I'm very proud." } },
    tome_of_divinity = { { id = "tp_tome", text = "Whatever's in that book, it brought me back. I'll read it myself one day. Maybe." } },
    _none = { { id = "tp_none", text = "I was dead for a bit. I've missed some news." } },
  },
}
