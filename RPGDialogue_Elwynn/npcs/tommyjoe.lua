-- Tommy Joe Stonefield, on the riverbank by Stonefield Farm. Voice: bibles/tommyjoe.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tommyjoe", id = TODO_NPC("Tommy Joe Stonefield"), name = "Tommy Joe Stonefield",
  bible = "bibles/tommyjoe.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "romantic" },
  notices = { "craft", "pet" },

  greetings = {
    { id = "g_river", text = "Just watching the river. That's all I'm doing. Watching it." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Young Lovers") }, text = "You've come from the vineyard. I can tell. You've got that look." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "Hello again. Isn't it a fine day? Every day's a fine day lately." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish? This bend's the best on the river. I come here to think, mostly. Sometimes I catch something by accident." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Good-looking animal. We had a dog like that. Gramma says it was the only Stonefield with any sense." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tommy Joe. Stonefield, if you're asking, and folk around here usually are. Family thinks I'm mending the east fence." },
        { id = "h_young", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "She sent you? Maybell sent you? Is she well? Did she say anything? About me, I mean. Did she?" },
        { id = "h_gramma", when = { questActive = TODO_QUEST("Speak with Gramma") },
          text = "Gramma's up at the farmhouse. She's the only one in the family who doesn't spit when the Maclures come up. Mostly." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Speak with Gramma"), questBefore = TODO_QUEST("The Escape") },
          text = "Gramma's up to something. She's sent word to the inn. She hums when she's scheming, and she's been humming all week." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "She came. She actually came, right down to the river, and nobody saw. Don't tell anyone. Well. Tell Gramma." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 7 } },
          text = "We're careful. We're very careful. One day we'll stop being careful, and I'll stand in that vineyard and say it out loud." },
      },
      choices = {
        { text = "What's the feud about?", next = "feud" },
        { text = "Good luck, Tommy Joe.", next = "END", fx = { affinity = 1 } },
      },
    },
    feud = {
      lines = {
        { id = "f_default", text = "Ask my father and he'll talk an hour. Ask him again the next day and it's a different reason. That tells you something." },
      },
      choices = {
        { text = "Sounds like it's about nothing.", next = "END", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Every feud's about something.", next = "END", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_us", text = "She's the cleverest person in Elwynn and she likes me. I don't understand it either." } },
    murlocs_east = { { id = "tp_murlocs", text = "Murlocs? Further east, folk say. I keep an eye on the water, all the same." } },
    _none = { { id = "tp_none", text = "Couldn't say. I'm just a farmer who stands by rivers." } },
  },
}
