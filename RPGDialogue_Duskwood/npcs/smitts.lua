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
    { id = "g_indoors", when = { timeOfDay = "night" }, text = "In, in. Door shut behind you. Best to stay indoors these nights." },
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
        { id = "h_rot", when = { questActive = TODO_QUEST("Gather Rot Blossoms") },
          text = "Rot blossoms grow inside the skulls of the walking dead. Don't ask how I know. I read it. I swear I read it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're the first of the sky people to sit at my bar. Tell me something true about your folk and I'll write it in my book. Only what you'd not mind me knowing." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Sit near the fire, {g:Brother|Sister}. My regulars talk easier when someone's listening who isn't me." },
        { id = "h_case", when = { metBefore = true }, text = "I spent the night with my old notes again. Nothing new in them. Same as every night. I read them anyway." },
      },
      again = {
        { id = "h_again", text = "What else? I've a long memory and a short queue." },
        { id = "h_again2", text = "Go on. The fog's bad for trade; I've time." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. Nobody's leaving before dawn anyway." },
      },
      choices = {
        { text = "A drink, please.", next = "BUSINESS" },
        { text = "What did you and Haggard investigate?", next = "murders" },
        { text = "Heard anything?", next = "rumors" },
        { text = "Who drinks here these days?", next = "regulars" },
        { text = "I found your jumpy writer.", next = "jitters", when = { questDone = TODO_QUEST("Finding the Shadowy Figure") } },
        { text = "Would your regulars take a blessing?", next = "priest", when = { class = "PRIEST" } },
        { text = "Was it Mistmantle? Be honest.", next = "suspect", when = { topicKnown = "stalvan" } },
        { text = "That juice you sent the hermit...", next = "juice", when = { questDone = TODO_QUEST("Juice Delivery") } },
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
        { text = "I'll find out who did it.", next = "BACK", fx = { affinity = 2, learn = { "stalvan" }, trait = { curious = 1 } } },
        { text = "Some things stay buried.", next = "buried" },
        { text = "What was on the pages?", next = "murders_pages" },
        { text = "What was Haggard like, then?", next = "murders_haggard" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Not in Duskwood. Nothing stays buried in Duskwood. That's rather the problem." } },
      choices = { { text = "Fair point.", next = "BACK" } },
    },
    murders_pages = {
      lines = {
        { id = "mp_default", text = "A man's hand. Neat, schooled, careful with its letters. Talk of tears, and of blood. We showed it round half the county. Nobody knew it." },
      },
      choices = {
        { text = "Schooled. A teacher, then?", next = "murders_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murders_teacher = {
      lines = {
        { id = "mt_default", text = "Haggard wondered the same. A clerk could settle it: Daltry has every signature this town ever put to paper. Nobody thought to ask him then." },
      },
      choices = {
        { text = "Then I'll ask him now.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    murders_haggard = {
      lines = {
        { id = "mh_default", text = "Sharp as a tack and twice as stubborn. Last I heard, his eyes are going. Hard thing, for a man who looked at everything." },
      },
      choices = {
        { text = "He still asks after you.", next = "BACK", when = { heardLine = "haggard.h_raven" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rumors = {
      lines = {
        { id = "r_default", text = "Lights at Manor Mistmantle again. The mayor's written another letter. And somebody's been buying a lot of thread up at Raven Hill." },
      },
      choices = {
        { text = "Thread?", next = "rumors_thread", fx = { trait = { curious = 1 } } },
        { text = "Lights at the manor?", next = "rumors_manor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rumors_thread = {
      lines = {
        { id = "rt_default", text = "The hermit past the cemetery. Polite old fellow. Thread from Madame Eva, and he's asked me about a liquor nobody drinks. I'm sure it's nothing." },
      },
      choices = {
        { text = "You don't sound sure.", next = "BACK", fx = { trait = { skeptical = 1 }, learn = { "raven_hill" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rumors_manor = {
      lines = {
        { id = "rm_default", text = "Manor Mistmantle, north of town. Empty for years, and still somebody lights a candle. The Watch won't go near it after dark. Neither will you, if you've sense.",
          fx = { learn = { "stalvan" } } },
      },
      choices = {
        { text = "Who lived there?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    regulars = {
      lines = {
        { id = "rg_default", text = "Watchers after a shift, mostly. They drink slow and say little. Grual feeds them. Trelayne puts the ones who can't walk home upstairs." },
      },
      choices = {
        { text = "And strangers?", next = "regulars_strangers" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    regulars_strangers = {
      lines = {
        { id = "rs_default", text = "Fewer every year. The last one worth remembering took a room for a few nights, wrote at that end of the bar till dawn, and left owing me." },
      },
      choices = {
        { text = "Where did he go?", next = "strangers_west" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers_west = {
      lines = {
        { id = "sw_default", text = "West, muttering that something was hunting him. West of here there's nothing but Raven Hill and the graves. I hope he found a roof." },
      },
      choices = {
        { text = "I hope so too.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },

    jitters = {
      lines = {
        { id = "jt_default", text = "Alive? Good. Tell him his tab can wait. Tell him I said so; he won't believe it from anyone else." },
      },
      choices = {
        { text = "He's sorry he left owing you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Take one? Look at them. Bless the room if you like, quietly. Some lost friends up at Raven Hill and haven't said a word since." },
      },
      choices = {
        { text = "I'll say a prayer for Raven Hill's dead.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, align = { light = 1 } } },
        { text = "Who did they lose?", next = "priest_lost" },
      },
    },
    priest_lost = {
      lines = {
        { id = "pl_default", text = "Watchers. Some to the ordinary dead, and some to the knight that walks the cemetery. After a while they stop saying the names. That's when I worry.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Then I'll say the names for them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    suspect = {
      lines = {
        { id = "su_default", text = "Honest? I've thought it. Haggard thought it. Thinking's cheap. A court wants a hand that matches, and we never had one." },
      },
      choices = {
        { text = "Then let's find one.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    juice = {
      lines = {
        { id = "ju_default", text = "I said that juice could wake the dead. It was a joke. Tell me it was a joke." },
        { id = "ju_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I brewed part of that thing. Me. The bit about waking the dead was a joke. I've stopped making the stuff." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'm not sure it was.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the Scarlet Raven, and a book of everything Darkshire would rather forget. The beer's the easy part." } },
    advice = { { id = "tp_ad", text = "Stay indoors after dark. It's the oldest rule in Darkshire, and the only one everybody keeps." } },
    rumors = {
      { id = "tp_rumors_next", text = "Lights at the manor, thread at Raven Hill, the mayor's eleventh letter. Pick one.", next = "rumors" },
      { id = "tp_rumors", text = "The fog's thicker, the Watch is thinner, and Grual swears the crab's fresh. One of those is a lie." },
    },
    stalvan = { { id = "tp_stalvan", text = "A tutor named Mistmantle. The manor up the road was his. Don't go at night." } },
    night_watch = { { id = "tp_watch", text = "They drink here after shifts. Quietly. You learn to read a watcher's night by how quietly." } },
    worgen = { { id = "tp_worgen", text = "Howling past midnight, every night. Regulars stopped flinching years ago. Newcomers never do." } },
    lions_pride = { { id = "tp_inn", text = "Farley's place in Goldshire? Good ale, I hear. He's got the easier crowd." } },
    ladimore = { { id = "tp_ladimore", text = "A knight of this town, before the war. What walks the cemetery now is what's left of him. I don't talk about it at the bar." } },
    embalmer = { { id = "tp_embalmer", text = "A story we told children, to keep them out of the graveyard. It worked on me. It didn't work on him." } },
    _none = { { id = "tp_none", text = "Not in my book, and my book's thick. Try Daltry at the Town Hall." } },
  },
}
