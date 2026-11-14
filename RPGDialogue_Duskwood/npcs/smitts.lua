-- Tavernkeep Smitts, the Scarlet Raven Tavern. Voice: bibles/smitts.md
-- Pours drinks, collects local lore, and has never let the Stalvan murders go.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "smitts", id = TODO_NPC("Tavernkeep Smitts"), name = "Tavernkeep Smitts",
  bible = "bibles/smitts.md", role = "innkeeper", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "curious", "generous" },
  notices = { "drink", "lore" },

  greetings = {
    { id = "g_raven", text = "Welcome to the Scarlet Raven. Warmest room in Duskwood, which isn't saying much." },
    { id = "g_back", when = { metBefore = true }, text = "Back in out of the fog. Your stool's free." },
    { id = "g_home", when = { homeInn = { "Darkshire", "Scarlet Raven Tavern" } }, text = "Home from the woods. Boots by the fire; they'll be dry by midnight." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had a few. Fine. Stay inside, though. The last drunk who went walking in Duskwood came back as a ghoul. Well. Didn't come back." },
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You read. I can tell. You looked at my shelf before you looked at my bottles. That's rare in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Smitts. I pour, I listen, and I keep a record of what this town forgets. Somebody should." },
        { id = "h_haggard", key = true, when = { heardLine = "haggard.h_raven" },
          text = "Haggard asked after me? The old goat. He and his lads used to fill that corner every night. Tell him I still keep his mug." },
        { id = "h_inquire", tags = { "news" }, when = { questActive = TODO_QUEST("Inquire at the Inn") },
          text = "A shadowy figure, you say. Writing in a book, in my tavern? I remember him. Jumpy fellow. Left in a hurry and never paid." },
        { id = "h_shadowy", when = { questActive = TODO_QUEST("Finding the Shadowy Figure") },
          text = "Raven Hill, last I heard. Nobody goes to Raven Hill on purpose. That's probably why he did." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Mud-stained pages, in a hand I could never match to anyone. Haggard and I spent a season on them. If you can finish it, finish it." },
        { id = "h_juice", when = { questActive = TODO_QUEST("Zombie Juice") },
          text = "Zombie juice, for the hermit. Strong stuff. I wouldn't drink it. He swears it's for his garden." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're the first of the sky people to sit at my bar. Tell me something true about your folk and I'll write it in my book. Only what you'd not mind me knowing." },
      },
      choices = {
        { text = "A drink, please.", next = "BUSINESS" },
        { text = "What did you and Haggard investigate?", next = "murders" },
        { text = "Heard anything?", next = "rumors" },
        { text = "Just warming up.", next = "END" },
      },
    },
    murders = {
      big = true,
      lines = {
        { id = "m_default", key = true,
          text = "A visiting noble family, murdered, years back. Haggard ran the Guard then. We found pages in the mud. Couldn't tie them to anyone. It's never sat right." },
      },
      choices = {
        { text = "I'll find out who did it.", next = "END", fx = { affinity = 2, learn = { "stalvan" }, trait = { curious = 1 } } },
        { text = "Some things stay buried.", next = "buried" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Not in Duskwood. Nothing stays buried in Duskwood. That's rather the problem." } },
      choices = { { text = "...", next = "END" } },
    },
    rumors = {
      lines = {
        { id = "r_default", text = "Lights at Manor Mistmantle again. The mayor's written another letter. And somebody's been buying a lot of thread up at Raven Hill." },
      },
      choices = { { text = "Thread?", next = "END", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    stalvan = { { id = "tp_stalvan", text = "A tutor named Mistmantle. The manor up the road was his. Don't go at night." } },
    night_watch = { { id = "tp_watch", text = "They drink here after shifts. Quietly. You learn to read a watcher's night by how quietly." } },
    worgen = { { id = "tp_worgen", text = "Howling past midnight, every night. Regulars stopped flinching years ago. Newcomers never do." } },
    lions_pride = { { id = "tp_inn", text = "Farley's place in Goldshire? Good ale, I hear. He's got the easier crowd." } },
    _none = { { id = "tp_none", text = "Not in my book, and my book's thick. Try Daltry at the Town Hall." } },
  },
}
