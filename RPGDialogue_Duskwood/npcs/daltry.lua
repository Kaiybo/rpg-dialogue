-- Clerk Daltry, Darkshire Town Hall. Voice: bibles/daltry.md
-- Keeps the town's records. Some of them are even current.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daltry", id = TODO_NPC("Clerk Daltry"), name = "Clerk Daltry",
  bible = "bibles/daltry.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "cowardly" }, values = { "lawful", "curious" },
  notices = { "lore" },

  greetings = {
    { id = "g_records", text = "Records, permits, deeds. Which form are you here to fill in wrong?" },
    { id = "g_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "The Mistmantle file. Again. Mind the dust; it's load-bearing." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader! You've no idea how rare. Most people here think a book is something you burn for warmth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Daltry, town clerk. I keep the records of Darkshire. Births, deaths, and lately a great many entries that say 'missing, presumed wolf'." },
        { id = "h_stalvan", tags = { "news" }, when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Mistmantle. Yes. Tutor to a noble family, years back, before it all went wrong. The papers are old and some are wrong. I'll find you what I can." },
        { id = "h_book", when = { questDone = TODO_QUEST("Inquire at the Inn") },
          text = "A blank book, you say? I sold one, a while back, to a nervous fellow who paid in coppers and wouldn't meet my eye. I write down every sale. I'm a clerk." },
        { id = "h_old", text = "Half these files are out of date. The people in them moved, or died, or both. I keep them anyway. Someone should remember who lived here." },
        { id = "h_files", when = { metBefore = true }, text = "I've re-filed the Night Watch reports by date. Then by street. Then by date again. It's calming. Don't judge me." },
      },
      choices = {
        { text = "Can I see the records?", next = "records" },
        { text = "Thank you, Daltry.", next = "END" },
      },
    },
    records = {
      lines = {
        { id = "r_default", text = "You may look. You may not touch. You may certainly not sneeze. Some of these are older than the fog." },
      },
      choices = { { text = "I'll be careful.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    stalvan = { { id = "tp_stalvan", text = "There's a file. It's thin. That's the strangest thing about it." } },
    night_watch = { { id = "tp_watch", text = "Their roster changes weekly. I've stopped using ink. Pencil." } },
    _none = { { id = "tp_none", text = "There's no file on that. I checked. I always check." } },
  },
}
