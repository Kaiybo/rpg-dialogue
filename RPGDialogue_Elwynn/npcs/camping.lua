-- Sam Sarsaparilla: the adventurer camped on the road by Goldshire (Forever's camping). Voice: bibles/camping.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sam", id = TODO_NPC("Sam Sarsaparilla"), name = "Sam Sarsaparilla",
  bible = "bibles/camping.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cheerful" }, values = { "friendly", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_fire", text = "Well, hello there! Pull up a log. The fire's going and the kettle's nearly there." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favorite passer-by! Fire's still warm. Sit." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? Then you're halfway to a camp already. Everything starts with a fire." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! You'll want to learn to pitch a tent. Rest by a fire with a tent beside it and you'll feel like a new person." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sam Sarsaparilla. I'm an adventurer, or trying to be. Mostly I walk a long way and then sit by a fire. It's the best part." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "The Marshal sent you to check on me? Ha! Fair enough. Strangers on the road, and all. Sit down and I'll show you how harmless I am." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire a while. No, longer than that. You'll feel it when you've properly rested." },
      },
      choices = {
        { text = "Why camp, with an inn right there?", next = "why" },
        { text = "Enjoy the fire.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Inns are lovely, but they're for stopping. A camp's for going on. And anyone walking past can share your fire, which is how you meet people worth knowing." } },
      choices = { { text = "Teach me.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A campfire first; any cook can learn it. Then a tent if you work leather, a rack if you fish. The more trades at a fire, the better the rest." } },
    _none = { { id = "tp_none", text = "No idea! I've only just got here. Ask in Goldshire." } },
  },
}
