-- Lord Ello Ebonlocke, mayor of Darkshire, Town Hall. Voice: bibles/ello.md
-- Every conversation comes back to one question: where is the Stormwind Army?
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ello", id = TODO_NPC("Lord Ello Ebonlocke"), name = "Lord Ello Ebonlocke",
  bible = "bibles/ello.md", role = "noble", tier = "major",
  communities = { "darkshire" }, temper = { "proud" }, values = { "lawful", "ambitious" },
  notices = { "status", "stormwind" },

  greetings = {
    { id = "g_mayor", text = "The mayor's time is precious. Darkshire's more so." },
    { id = "g_army", when = { minLevel = 25 }, text = "Has Stormwind sent you? Tell me Stormwind has sent you." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "Ah. Darkshire's favourite. Come in, come in. Mind the council's chairs; they're older than they look." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Night Watch has a file on you. A thick one." },
    { id = "g_bride", when = { questActive = TODO_QUEST("Bride of the Embalmer") }, text = "Have you the heart? Don't make that face. You know which heart." },
  },

  notice = {
    { id = "n_tabard", cat = "stormwind", when = { class = { "PALADIN", "WARRIOR" }, minLevel = 25 },
      text = "You've a soldier's bearing. Are you the vanguard, then? Is the Army behind you? No? No. Of course not." },
    { id = "n_shabby", cat = "status", when = { durability = { max = 0.25 } },
      text = "You'll forgive me if I don't offer you a seat. The council's upholstery has suffered enough this year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lord Ello Ebonlocke, mayor of Darkshire, head of its council. I have petitioned Stormwind for soldiers more times than I can count. The Night Watch cannot do this alone." },
        { id = "h_messenger", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Darkshire") },
          text = "A letter from Lakeshire? Solomon wants my help? I wrote to Stormwind for help. Perhaps Stormwind writes to Solomon. We could all save on ink." },
        { id = "h_embalmer", tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "A letter for me, from an Abercrombie? I know no one by that name. And this script is ancient; I can't read a word of it." },
        { id = "h_translate", when = { questActive = TODO_QUEST("Translate Abercrombie's Note") },
          text = "Sirra reads the old scripts. He reads them slowly. Today, of all days, I would like him to read quickly." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Translation to Ello"), days = 1 } },
          text = "Whatever that hermit made is coming for Darkshire. Stop it before it reaches the square. I'll be in the Town Hall. Directing." },
        { id = "h_bride", when = { questActive = TODO_QUEST("Bride of the Embalmer") },
          text = "His own heart, in his dead wife's breast. Nannies tell that story to frighten children. I'm asking you to dig it up." },
        { id = "h_revenge_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bride of the Embalmer"), days = 5 } },
          text = "The council has voted you its thanks. Unanimously. That has never happened. Please don't make a habit of being necessary." },
        { id = "h_westfall", when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
          text = "Westfall feels forgotten? Stormwind pulled its soldiers out of Duskwood when the king vanished. We've been forgotten so long we've started to rot." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the sky folk. I don't suppose your people can do anything about the dark? No. A pity. You'd be very popular here." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Church, in my hall. Stormwind sends us prayers by letter, you know. You're the first one that walked." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "You've the manners of the capital. Then you know the House of Nobles. You might know who reads my petitions, if anyone does." },
        { id = "h_letter", when = { metBefore = true }, text = "I have written to Stormwind again. Eloquently. At length. I expect the King's court is using my letters to start fires. It's cold in the capital, I hear." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Darkshire. Listen to the howling and tell me again that Stormwind has no cause to send soldiers." },
      },
      again = {
        { id = "h_again", text = "Go on. The council can wait. The council always waits." },
        { id = "h_again2", text = "What else? Briefly, if you can. I've a letter to finish." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. Nobody in Darkshire sleeps before the howling stops anyway." },
      },
      choices = {
        { text = "What does Darkshire need?", next = "need" },
        { text = "Why won't Stormwind send soldiers?", next = "army" },
        { text = "Tell me about the Night Watch.", next = "watch" },
        { text = "What does the council actually decide?", next = "council" },
        { text = "Who is this Embalmer?", next = "embalmer", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "Lakeshire needed your Watch, my lord.", next = "solomon", when = { questDone = TODO_QUEST("Messenger to Darkshire") } },
        { text = "Has anyone prayed over Raven Hill's graves?", next = "priest", when = { class = "PRIEST" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "The Army isn't coming. I'm here.", next = "soldier", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Good day, my lord.", next = "END" },
      },
    },

    need = {
      lines = {
        { id = "n_default", text = "Soldiers. Walls. Light that lasts past noon. Failing those, the Night Watch and whatever adventurers wander in out of the fog." },
      },
      choices = {
        { text = "Then I'll help the Night Watch.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, align = { order = 1 } } },
        { text = "Walls? Darkshire has none?", next = "need_walls" },
        { text = "Sounds grim.", next = "BACK" },
      },
    },
    need_walls = {
      lines = {
        { id = "nw_default", text = "A fence, a gate and a great many lanterns. The dead climb badly. The worgen climb well. The council does not discuss the worgen after dark." },
      },
      choices = {
        { text = "Then why does anyone stay?", next = "need_stay" },
        { text = "Something else, my lord.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    need_stay = {
      big = true,
      lines = {
        { id = "ns_default", text = "Because this was Grand Hamlet before it was Darkshire, and our graves are here. And because I'm the mayor. Mayors who leave are called something else." },
      },
      choices = {
        { text = "That's courage, my lord.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Or stubbornness.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    army = {
      big = true,
      lines = {
        { id = "a_default", text = "Because Duskwood is far from the Keep and close to everything that frightens it. So they leave the fog to us and send letters of support. I could paper the Town Hall with them." },
      },
      choices = {
        { text = "Darkshire deserves better.", next = "BACK", fx = { affinity = 2, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Maybe the Night Watch is enough.", next = "enough", fx = { opinion = { stormwind = "patience" } } },
        { text = "How many letters have you sent?", next = "letters" },
      },
    },
    enough = {
      lines = { { id = "e_default", text = "Tell that to the families at Raven Hill. Tell it loudly. They're hard of hearing, being dead." } },
      choices = {
        { text = "That was careless of me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Someone has to say it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    letters = {
      lines = {
        { id = "l_default", text = "Eleven this year. Each more eloquent than the last. The replies grow shorter. The latest was two lines and a seal. I've had it framed." },
      },
      choices = {
        { text = "What did the two lines say?", next = "letters_reply" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_reply = {
      lines = {
        { id = "lr_default", text = "That the Crown is aware of Darkshire's situation. Aware. I am aware of the fog. Being aware of it has never once made it lift." },
      },
      choices = {
        { text = "The court is slow for everyone.", next = "BACK", fx = { opinion = { stormwind = "patience" } } },
        { text = "Write a twelfth. Shorter. Angrier.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    watch = {
      lines = {
        { id = "w_default", text = "My kinswoman Althea commands it. Farmers, smiths, a baker or two. Stormwind took its guard home, so we raised and trained our own." },
      },
      choices = {
        { text = "Could you spare any of them elsewhere?", next = "solomon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    solomon = {
      lines = {
        { id = "so_default", text = "Solomon asked me for my Watch. Had I sent them, the dead would be in our square before they reached the forest's edge. I told him so. Politely." },
        { id = "so_done", when = { questDone = TODO_QUEST("Messenger to Darkshire") },
          text = "You carried his plea, and my refusal back. I'm sorry you had to. Solomon will curse me, and he'll be right to, and I'd do it again." },
      },
      choices = {
        { text = "Lakeshire's fighting orcs alone.", next = "solomon_push", fx = { align = { honor = 1 } } },
        { text = "You chose your own people. That's fair.", next = "BACK", fx = { affinity = 1, learn = { "blackrock" } } },
      },
    },
    solomon_push = {
      lines = {
        { id = "sp_default", text = "And we fight the dead alone. Tell Solomon I'm sorry. Then tell him to write to Stormwind. They adore letters there." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },

    council = {
      lines = {
        { id = "c_default", text = "Roads, graves, quarrels, and justice, when Stormwind permits it. This year we sentenced a grave robber to death. Stormwind took him off our hands instead." },
      },
      choices = {
        { text = "Who was he?", next = "council_ward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_ward = {
      big = true,
      lines = {
        { id = "cw_default", text = "Dextren Ward, who sold our dead out of Raven Hill to Morbent Fel, the necromancer on the hill. The Nobles keep him in their Stockade. Millstipe hasn't slept since.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "He should have hanged.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Prison is still punishment.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },

    embalmer = {
      big = true,
      lines = {
        { id = "em_default", text = "A nursery tale. A kind alchemist who couldn't let his wife go. We tell it to make children come home before dark. I thought it was a story." },
      },
      choices = {
        { text = "I carried his supplies. I didn't know.", next = "embalmer_guilt" },
        { text = "How do we break him?", next = "embalmer_heart" },
      },
    },
    embalmer_guilt = {
      lines = {
        { id = "eg_default", text = "No one did. You were kind to a lonely old man, and kindness nearly doomed this town. Let's see what it can do for us now." },
      },
      choices = {
        { text = "I'll make it right.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { darkshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    embalmer_heart = {
      lines = {
        { id = "eh_default", text = "In the story he put his own heart in her, and the curse made her hungry, so he keeps her buried. His heart is his power. Take it from her.",
          fx = { learn = { "embalmer" } } },
      },
      choices = {
        { text = "That's grotesque.", next = "BACK" },
        { text = "Then I'll find her grave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Prayed over it? There's more cemetery at Raven Hill than village now. Pray if you like. Then pray the dead hear it and stay where they're put." },
      },
      choices = {
        { text = "Has no one tended those graves?", next = "priest_graves" },
        { text = "I'll go at dawn.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { darkshire = 1 } } },
      },
    },
    priest_graves = {
      lines = {
        { id = "pg_default", text = "Not since a knight came home from Lordaeron, found his family's stones, and cut down the attendants. Few go up there to tend anything now. Ask Sirra.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Then the graves need a priest more than ever.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then you've sat in that chamber. When my letters are read aloud, does anyone listen? Or do they wait politely for luncheon?" },
      },
      choices = {
        { text = "They wait for luncheon.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Some of them listen.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll speak for Darkshire there.", next = "BACK", fx = { affinity = 3, standing = { darkshire = 2 } },
          journal = { first = "Told Lord Ello Ebonlocke I'd speak for Darkshire in the House of Nobles.",
                      third = "{name} promised the mayor of Darkshire a voice in the House of Nobles." } },
      },
    },
    soldier = {
      lines = {
        { id = "sd_default", text = "One sword. Stormwind sends me soldiers one at a time, by accident, on their way somewhere else. I'll take it. Report to Althea before you change your mind." },
      },
      choices = {
        { text = "I'll report to her.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, learn = { "night_watch" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Mayor of Darkshire, head of its council, and author of more letters to the Crown than any man living. The town is my story." } },
    advice = { { id = "tp_ad", text = "Keep to the road and inside the lamplight. If you must die in Duskwood, do it in Darkshire. We still bury people properly here." } },
    night_watch = { { id = "tp_watch", text = "Brave, underpaid, and outnumbered. My kinswoman runs it. Better than I would, I admit." } },
    worgen = { { id = "tp_worgen", text = "In the woods, every night. Closer every season. The council does not discuss them after dark." } },
    stalvan = { { id = "tp_stalvan", text = "Old business. Unpleasant business. Ask Smitts; he never let it go." } },
    blackrock = { { id = "tp_blackrock", text = "Lakeshire's problem. We have our own. Many of them." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer in a house above Raven Hill, buying our dead. If Stormwind wants a reason to send soldiers, there it sits." } },
    embalmer = {
      { id = "tp_embalmer_next", when = { questDone = TODO_QUEST("Translation to Ello") }, text = "A nursery tale that came down the road at us. Ask what you came to ask.", next = "embalmer" },
      { id = "tp_embalmer", text = "A story nannies tell in Darkshire. A husband, a dead wife, his own heart. I'd like it to stay a story." },
    },
    _none = { { id = "tp_none", text = "The council has no position on that. The council has too many positions on everything else." } },
  },
}
