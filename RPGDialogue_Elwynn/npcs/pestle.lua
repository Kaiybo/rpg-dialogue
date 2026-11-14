-- William Pestle, Lion's Pride Inn, Goldshire. Voice: bibles/pestle.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pestle", id = TODO_NPC("William Pestle"), name = "William Pestle",
  bible = "bibles/pestle.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_mind", text = "Don't touch the green one. Or the blue one, actually." },
    { id = "g_candles", when = { questActive = TODO_QUEST("Kobold Candles") }, text = "Any candles? The kobold kind, mind." },
  },

  notice = {
    { id = "n_alchemist", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Smell this. No, closer. Isn't that marvelous?" },
    { id = "n_herbalist", cat = "craft", when = { profession = "Herbalism" },
      text = "You've peacebloom on your gloves. You pick it too early, by the way. Everyone does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Candles, tinctures, a few small mercies in bottles. What can I do for you?" },
        { id = "q_candles", when = { questActive = TODO_QUEST("Kobold Candles") },
          text = "Kobold candles burn longer than any wax in Stormwind. Don't ask me why. I've stopped asking." },
        { id = "q_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "The kelp is for a potion. A private potion, for a private matter. You understand." },
        { id = "q_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "They got away? Both of them? Oh, good. Don't tell the Stonefields I had a hand in it." },
      },
      choices = {
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Tell me about Maybell and Tommy Joe.", next = "lovers",
          when = { any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "Nothing for now.", next = "END" },
      },
    },
    lovers = {
      big = true,
      lines = {
        { id = "l_default", key = true,
          text = "A Maclure and a Stonefield. Their families haven't shared a fence post in years. Young love doesn't care about fence posts.",
          fx = { learn = { "maybell_tommy" } } },
      },
      choices = {
        { text = "Love will find a way.", next = "END", fx = { trait = { kind = 1 }, align = { order = -1 }, opinion = { maybell_tommy = "romantic" } } },
        { text = "They should listen to their families.", next = "END", fx = { align = { order = 2 }, opinion = { maybell_tommy = "dutiful" } } },
      },
    },
  },

  topics = {
    maybell_tommy = { { id = "t_lovers", text = "If anyone asks, I only sell candles." } },
    kobolds = { { id = "t_kobolds", text = "They make the candles. I don't ask how, and they don't ask why I want them." } },
    _none = { { id = "t_none", text = "Hmm? Sorry. I was counting drops. Ask me again later." } },
  },
}
