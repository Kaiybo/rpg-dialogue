-- Gramma Stonefield, inside Stonefield Farm. Voice: bibles/gramma.md
-- The oldest Stonefield, and the only one with no patience for the feud.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gramma", id = TODO_NPC("Gramma Stonefield"), name = "Gramma Stonefield",
  bible = "bibles/gramma.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "kind", "honest", "witty" },
  notices = { "kit", "drink" },

  greetings = {
    { id = "g_door", text = "Wipe your feet. I just did that floor. Well, somebody did." },
    { id = "g_tommy", when = { questActive = TODO_QUEST("Speak with Gramma") }, text = "The boy sent you. I know that face; it's the face of someone sent." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "There's my accomplice. Come in, come in." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Where are your clothes, child? You'll catch your death, and then where will I be? Short an errand-runner, that's where." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Been at the Lion's Pride, have you? Sit down before you fall down. I've seen enough Stonefields do both." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Oldest Stonefield still breathing. That gives me the right to say this feud is a waste of good years, and I say it often." },
        { id = "h_speak", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Gramma") },
          text = "The boy's in love with a Maclure. Of course he is. I've known since spring; he started washing behind his ears." },
        { id = "h_note", when = { questActive = TODO_QUEST("Note to William") },
          text = "William Pestle, at the Lion's Pride. Give him that. Don't read it. Oh, read it, but don't tell him you did." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Note to William"), questBefore = TODO_QUEST("The Escape") },
          text = "William's a good friend and a slow one. Whatever he brews, it'll be right. It just won't be quick." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "Two young fools happy, and two old families none the wiser. Best day's work I've done in years." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 14 } },
          text = "They'll be found out one day. I'll be here when they are, with a stick, for anybody who raises their voice." },
      },
      choices = {
        { text = "Why do you help them?", next = "why" },
        { text = "How did the feud start?", next = "feud" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because I'm old, and I've buried people I was too proud to forgive. I'll not watch the boy do the same." },
      },
      choices = {
        { text = "That's a good reason.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "And the Maclures?", next = "maclures" },
      },
    },
    maclures = {
      lines = {
        { id = "mc_default", text = "Never mind the Maclures. The girl's sweet, and that's all of them I need to know." },
      },
      choices = { { text = "Fair.", next = "END" } },
    },
    feud = {
      lines = {
        { id = "f_default", text = "Ask three Stonefields, get four answers. I stopped caring which was true about forty years ago." },
      },
      choices = {
        { text = "Then it's time it ended.", next = "END", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Some grudges are earned.", next = "END", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_us", text = "Shh. The walls have Stonefields in them. Yes. It's going well." } },
    lions_pride = { { id = "tp_inn", text = "William Pestle keeps a room there. We go back further than either of us likes to say." } },
    defias = { { id = "tp_defias", text = "Thieves in red. When I was a girl, thieves had the decency to be ashamed of themselves." } },
    _none = { { id = "tp_none", text = "At my age you stop collecting gossip. You start collecting chairs." } },
  },
}
