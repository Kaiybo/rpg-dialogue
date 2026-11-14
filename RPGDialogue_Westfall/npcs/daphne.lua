-- Daphne Stilwell, her farm above the Longshore. Voice: bibles/daphne.md
-- Picks apples, faithful to the Church, and handier with a weapon than the Defias expect.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daphne", id = TODO_NPC("Daphne Stilwell"), name = "Daphne Stilwell",
  bible = "bibles/daphne.md", role = "questgiver", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "pious", "brave" },
  notices = { "paladin", "kit" },

  greetings = {
    { id = "g_apples", text = "Mind the basket. Those are the good apples." },
    { id = "g_valor", when = { questActive = TODO_QUEST("The Tome of Valor") }, text = "Duthorian sent you? Then pick up a weapon, not an apple." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Tome of Valor") }, text = "My defender! Take an apple. Take two. You've earned the good ones." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", minLevel = 20 },
      text = "A paladin of the Church. Jordan would like you. He trained for it once, before his father's forge got him." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been along the shore, I see. They don't fight fair down there. Neither do I, when I have to." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Daphne Stilwell. This is my farm, and that's the sea, and somewhere down that hill the Defias are deciding whether today's the day. It never is, while I'm watching." },
        { id = "h_valor", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Valor") },
          text = "They'll come up from the shore. They always do. Stand with me, and we'll show the Brotherhood this farm isn't for taking." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Tome of Valor"), days = 3 } },
          text = "That's the last time they try my gate, I'd wager. I got two of them myself, you know. Don't tell Jordan. He worries." },
        { id = "h_jordan", text = "My husband Jordan's a smith, up by the gates of Ironforge. Devoted to the Church, the most faithful man I know. Far away, mind. We write." },
      },
      choices = {
        { text = "Aren't you afraid out here?", next = "afraid" },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Enjoy your apples.", next = "END" },
      },
    },
    afraid = {
      big = true,
      lines = {
        { id = "a_default", text = "Every day. Then I pick apples anyway. Fear's a poor reason to leave good trees to thieves." },
      },
      choices = {
        { text = "That's courage.", next = "END", fx = { affinity = 2, align = { light = 1 }, trait = { brave = 1 } } },
        { text = "It sounds like stubbornness.", next = "END", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "They want the farm because it overlooks their road to the sea. They can't have it." } },
    westfall = { { id = "tp_westfall", text = "Hard country now. Good apples, though. The trees don't know there's a war." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian's books. Valor comes after Divinity, he says. Out here it's the other way round." } },
    _none = { { id = "tp_none", text = "Couldn't say, love. The orchard keeps me busy enough." } },
  },
}
