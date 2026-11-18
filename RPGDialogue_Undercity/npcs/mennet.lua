-- Mennet Carkad, in the Rogues' Quarter. Voice: bibles/mennet.md
-- The Deathstalkers' recruiter: courteous, amused, and always a step ahead of the person in front of him.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mennet", id = TODO_NPC("Mennet Carkad"), name = "Mennet Carkad",
  bible = "bibles/mennet.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "smooth", "sharp" }, values = { "cunning", "loyal" },
  notices = { "stealth", "class" },
  impression = {
    first = "Mennet Carkad recruits for the Deathstalkers with perfect manners and no illusions. He speaks as if every conversation were a test, and I suspect every one of them is.",
    third = "{name} met Mennet Carkad, who tests would-be Deathstalkers on Lord Varimathras's behalf in the Rogues' Quarter.",
  },

  greetings = {
    { id = "g_smooth", text = "Ah. I wondered when you'd find your way down here." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you've news for me, or you've missed my company, and I'm flattered either way." },
    { id = "g_astor", when = { questActive = TODO_QUEST("The Deathstalkers") }, text = "Have you brought Astor Hadren's effects? How you come by them is entirely your own affair." },
    { id = "g_fenwick", when = { questActive = TODO_QUEST("Fenwick Thatros") }, text = "Fenwick Thatros is at the decrepit dock on Lordamere Lake, I'm told, and he won't be expecting you, which is rather the point." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I had people keep an eye on you, naturally, but it's nicer to see you in person." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown dangerous since you first came to my summons. I take a certain professional pride in that." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you told someone a very good lie recently. I'll want to hear how you did it, purely for teaching purposes." },
    { id = "g_word_caught", when = { word = "caughtLying" }, text = "I hear someone caught you in a lie. A shame; the trick is not to be caught, and I'd assumed you knew it." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Do step out of the shadows. They're mine, and I can see you in them perfectly well." },
    { id = "n_living", cat = "class", when = { class = "ROGUE", race = { "Orc", "Troll" } },
      text = "One of the Warchief's knives, down in the Dark Lady's quarter. The Shattered Hand trains your kind well, I'm told, though perhaps a little loudly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mennet Carkad. I find promising people for Lord Varimathras's Deathstalkers, and I find out whether they're as promising as they look." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Mennet Carkad") },
          text = "No doubt you came here at the first mention of my summons. Of course you did; I'd expect nothing less of a prospective Deathstalker." },
        { id = "h_ledger", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Deathstalkers"), days = 7 }, questBefore = TODO_QUEST("Fenwick Thatros") },
          text = "Andron Gant's ledger shows he sells to the Syndicate, if you'll believe it. The lords of Alterac have fallen a long way since their betrayal, and now they're buying secrets from a drunk in our own city." },
        { id = "h_fenwick_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fenwick Thatros"), days = 3 } },
          text = "Fenwick's head, delivered with all the care I'd hoped for. I think it's time we furthered your training, and you've earned it." },
        { id = "h_recruit", when = { origin = "forsaken_deathstalker_recruit" },
          text = "One of our own recruits, come home to the quarter. I remember your file, and I remember thinking you'd either do very well or die very quickly." },
        { id = "h_notrogue", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } },
          text = "You're not one of mine, by the way you clank. Still, every soldier in this city works for the Dark Lady's eyes sooner or later, whether they know it or not." },
      },
      again = {
        { id = "h_again", text = "Something further? I've all the time in the world, which is one of the few perks of being dead." },
        { id = "h_again2", text = "Do go on. I'm listening, and so, I expect, is someone else." },
      },
      choices = {
        { text = "What are the Deathstalkers?", next = "deathstalkers" },
        { text = "What happens to people who ignore your summons?", next = "summons" },
        { text = "Andron Gant seems to know a great many people.", next = "andron", when = { questDone = TODO_QUEST("The Deathstalkers") } },
        { text = "Who was Fenwick Thatros?", next = "fenwick", when = { questDone = TODO_QUEST("Fenwick Thatros") } },
        { text = "Teach me something, Mennet.", next = "lesson", when = { class = "ROGUE" } },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },

    deathstalkers = {
      lines = { { id = "de_default", text = "Lord Varimathras's elite, and the Dark Lady's eyes in every forest and town where our enemies think they're alone. We go where we're sent, we see what we're sent to see, and some of us come back." } },
      choices = {
        { text = "How does one join?", next = "deathstalkers_join" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deathstalkers_join = {
      lines = { { id = "dj_default", text = "By passing tests you don't know you're taking, mostly. I won't lie to you: some of those tests have killed better candidates than you, and the ones who pass don't talk about it." } },
      choices = {
        { text = "You don't sound fond of serving Varimathras.", next = "deathstalkers_lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deathstalkers_lord = {
      big = true,
      lines = { { id = "dl_default", text = "I serve the Dark Lady, who chose him to command us, and I find it simplest not to have opinions about her choices. You'd be wise to find it simple too." } },
      choices = {
        { text = "Loyalty to the Dark Lady is enough for me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my own opinions, and my own counsel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    summons = {
      lines = { { id = "su_default", text = "Nothing dramatic. They simply stop being people I send for, and then, after a while, they stop being people anyone sends for." } },
      choices = {
        { text = "That sounds like a threat.", next = "summons_threat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    summons_threat = {
      lines = { { id = "st_default", text = "It's an observation, and a polite one. I find threats rather crude, and a well-placed silence says everything a threat would, and leaves nothing for anyone to repeat." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    andron = {
      lines = { { id = "an_default", text = "A drunk with a shop by the Apothecarium and too many friends outside the city. He hasn't the wits to be suspicious, which made him very useful to the Syndicate, and now very useful to us." } },
      choices = {
        { text = "Is he still selling secrets?", next = "andron_still" },
        { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } },
      },
    },
    andron_still = {
      lines = { { id = "as_default", text = "He's selling whatever we let him sell, and that is far more useful than a dead informant. Don't look so disappointed; a traitor you can read is worth three you've buried." } },
      choices = {
        { text = "Clever. Let him think he's safe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fenwick = {
      lines = { { id = "fe_default", text = "One of the dead who took root in Silverpine without asking anybody's leave, and who had ideas about leading the others. Lord Varimathras took a dim view of the ideas, and you took care of the rest." } },
      choices = {
        { text = "Was he Scourge, or one of us gone wrong?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      lines = {
        { id = "le_default", text = "Here's one for free: never be the most interesting person in a room. The guard watches the loud man, the barman watches the rich one, and nobody watches the quiet fellow by the door." },
        { id = "le_living", when = { race = { "Orc", "Troll" } }, text = "Here's one the Shattered Hand won't teach you: a blade is the last tool you reach for. By the time you need it, you've already failed at three quieter things." },
      },
      choices = {
        { text = "Quiet, then. Always.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else, Mennet.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've had a few lives, and only the current one is any of your business." } },
    advice = { { id = "tp_ad", text = "Always know who in the room is lying, and if you can't tell, assume it's everyone, yourself included." } },
    syndicate = { { id = "tp_syndicate", text = "The old nobles of Alterac, gone to knives and ledgers. They're good at secrets, but not quite good enough to keep them from us." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are surrounded by enemies who would burn us if they could, and the Deathstalkers make sure they never get the chance. That's all most of our people need to know about us." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Deathstalkers serve the Dark Lady directly, and we answer to no one else. If you're asking whether she's watching you, the answer is yes." } },
    alterac = { { id = "tp_alterac", text = "The Syndicate grew up in the ruins of Alterac's nobility, and they still think they deserve a kingdom. We've been correcting that assumption, one by one." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "There's a manor in the hills above Hillsbrad where certain people of my profession gather. I can't tell you more, and I'd advise you not to go looking." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran sits behind its shields and pretends the Forsaken don't exist. We have people watching those walls, and we know more about them than they'd like." } },
    _none = { { id = "tp_none", text = "If I knew, I wouldn't say, and if I didn't, I certainly wouldn't admit it." } },
  },
}
