-- Maybell Maclure, Maclure Vineyards. Voice: bibles/maybell.md
-- In love with a Stonefield. The families mustn't know.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maybell", id = TODO_NPC("Maybell Maclure"), name = "Maybell Maclure",
  bible = "bibles/maybell.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "kind", "romantic" },
  notices = { "stealth", "craft" },

  greetings = {
    { id = "g_hush", text = "Shh. Not so loud. They'll hear you up at the house." },
    { id = "g_news", when = { questActive = TODO_QUEST("Young Lovers") }, text = "Did you find him? Is he all right?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "Oh! It's you. Hello. I'm not blushing, it's the sun." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Where did you- oh! You frightened me. How do you do that? Could you teach me? Please?" },
    { id = "n_herbs", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom. Tommy Joe picks it by the river for me. He thinks I don't know he picks the same patch every time." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "You vanished! Just like that! Oh, I wish I could do that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maclures and Stonefields don't speak. That's the rule, older than me. I've never been very good at rules." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Young Lovers") },
          text = "There's someone across the river I'm not allowed to see. If anyone asks, I'm out here counting grapes." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "Down by the river, near the Stonefield farm. Tommy Joe. Tell him I'm thinking of him. Don't let anyone hear you say it." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Young Lovers"), questBefore = TODO_QUEST("The Escape") },
          text = "He spoke to his Gramma? His Gramma! Oh, either that's very good or very, very bad." },
        { id = "h_escape", tags = { "news" }, when = { questActive = TODO_QUEST("The Escape") },
          text = "Is that it? The potion? My hands are shaking. Give it here before I lose my nerve." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "I keep waiting for someone to catch me. Then I think of him, and I find I don't much care." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 7 } },
          text = "I hate lying to my family. I do. But it's a smaller lie than pretending I don't love him." },
      },
      choices = {
        { text = "Why do the families fight?", next = "feud" },
        { text = "Your secret's safe with me.", next = "END", fx = { affinity = 1, opinion = { maybell_tommy = "romantic" } } },
        { text = "You should tell your family the truth.", next = "truth", fx = { opinion = { maybell_tommy = "honest" } } },
      },
    },
    feud = {
      lines = {
        { id = "f_default", text = "I asked once. I got sent to bed without supper. I was twelve. I've stopped asking." },
      },
      choices = {
        { text = "That's no reason to keep you apart.", next = "END", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Families have their reasons.", next = "END", fx = { affinity = -1 } },
      },
    },
    truth = {
      lines = {
        { id = "t_default", text = "You don't know my family. Some days I think the truth would be the end of us both." },
      },
      choices = {
        { text = "Then be careful.", next = "END" },
        { text = "Or it might be the end of the feud.", next = "END", fx = { trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_us", text = "Is it that obvious? Don't answer that. It's that obvious." } },
    lions_pride = { { id = "tp_inn", text = "William Pestle works out of the inn. He's kind to me. He doesn't ask questions." } },
    _none = { { id = "tp_none", text = "I only know grapes and one boy across the river. Sorry." } },
  },
}
