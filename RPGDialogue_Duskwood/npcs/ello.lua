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
    { id = "g_mayor", text = "The mayor's time is precious, {class}, and Darkshire's is more precious still." },
    { id = "g_army", when = { minLevel = 25 }, text = "Has Stormwind sent you? Please, tell me that Stormwind has finally sent you." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "Ah, Darkshire's favourite! Come in, come in, and mind the council's chairs, because they're older than they look." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Night Watch keeps a file on you, and I'm told it's a thick one." },
    { id = "g_bride", when = { questActive = TODO_QUEST("Bride of the Embalmer") }, text = "Have you brought the heart? Don't make that face at me; you know perfectly well which heart I mean." },
  },

  notice = {
    { id = "n_tabard", cat = "stormwind", when = { class = { "PALADIN", "WARRIOR" }, minLevel = 25 },
      text = "You've a soldier's bearing about you. Are you the vanguard, then, with the Army marching behind? No, of course you aren't." },
    { id = "n_shabby", cat = "status", when = { durability = { max = 0.25 } },
      text = "You'll forgive me if I don't offer you a seat. The council's upholstery has suffered enough this year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Lord Ello Ebonlocke, mayor of Darkshire and head of its council. I have petitioned Stormwind for soldiers more times than I can count, because the Night Watch cannot do this alone." },
        { id = "h_messenger", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Darkshire") },
          text = "A letter from Lakeshire, and Solomon wants my help? I wrote to Stormwind for help. Perhaps Stormwind could write to Solomon, and we'd all save on ink." },
        { id = "h_embalmer", tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "A letter for me, from an Abercrombie? I know no one by that name. And this script is ancient; I can't read a word of it." },
        { id = "h_translate", when = { questActive = TODO_QUEST("Translate Abercrombie's Note") },
          text = "Sirra reads the old scripts, though he reads them slowly. Today, of all days, I would like him to read quickly." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Translation to Ello"), days = 1 } },
          text = "Whatever that hermit made is coming for Darkshire, so stop it before it reaches the square! I'll be in the Town Hall, directing." },
        { id = "h_bride", when = { questActive = TODO_QUEST("Bride of the Embalmer") },
          text = "His own heart, in his dead wife's breast. Nannies tell that story to frighten children, and now I'm asking you to dig it up." },
        { id = "h_revenge_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bride of the Embalmer"), days = 5 } },
          text = "The council has voted you its thanks, unanimously, which has never once happened before. Please don't make a habit of being necessary." },
        { id = "h_westfall", when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
          text = "Westfall feels forgotten? Stormwind pulled its soldiers out of Duskwood when the king vanished, and we've been forgotten so long we've started to rot." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the sky folk! I don't suppose your people can do anything about the dark? A pity, because you'd be very popular here if you could." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Church, in my hall. Stormwind sends us its prayers by letter, you know, and you're the first one that ever walked here." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "You've the manners of the capital, so you'll know the House of Nobles. Perhaps you even know who reads my petitions, if anyone does." },
        { id = "h_letter", when = { metBefore = true }, text = "I have written to Stormwind again, eloquently and at great length. I expect the King's court is using my letters to start its fires; it's cold in the capital, I hear." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "This is night in Darkshire. Listen to that howling, and then tell me again that Stormwind has no cause to send soldiers." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, my friend, come in, come in! The council is delighted to see you, and so, unofficially and without minutes, am I." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "The council has no appointments today, and I have even fewer for you. What is it?" },
      },
      again = {
        { id = "h_again", text = "Go on. The council can wait, as the council always waits." },
        { id = "h_again2", text = "What else? Be brief if you can, because I've a letter to finish." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away. Nobody in Darkshire sleeps before the howling stops anyway." },
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
        { id = "n_default", text = "Soldiers, walls, and a light that lasts past noon. Failing those, we have the Night Watch and whatever adventurers wander in out of the fog." },
      },
      choices = {
        { text = "Then I'll help the Night Watch.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, align = { order = 1 } } },
        { text = "I'd sooner hunt these woods alone than march with the Watch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Walls? Darkshire has none?", next = "need_walls" },
        { text = "Sounds grim.", next = "BACK" },
      },
    },
    need_walls = {
      lines = {
        { id = "nw_default", text = "We have a fence, a gate and a great many lanterns. The dead climb badly and the worgen climb well, which is why the council does not discuss the worgen after dark." },
      },
      choices = {
        { text = "Then why does anyone stay?", next = "need_stay" },
        { text = "Something else, my lord.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    need_stay = {
      big = true,
      lines = {
        { id = "ns_default", text = "Because this was Grand Hamlet long before it was Darkshire, and our graves are here. And because I'm the mayor, and mayors who leave are called something else." },
      },
      choices = {
        { text = "That's courage, my lord.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Or stubbornness.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    army = {
      big = true,
      lines = {
        { id = "a_default", text = "Because Duskwood is far from the Keep and close to everything that frightens it. So they leave the fog to us and send letters of support instead; I could paper the Town Hall with them." },
      },
      choices = {
        { text = "Darkshire deserves better.", next = "BACK", fx = { affinity = 2, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Maybe the Night Watch is enough.", next = "enough", fx = { opinion = { stormwind = "patience" } } },
        { text = "How many letters have you sent?", next = "letters" },
      },
    },
    enough = {
      lines = { { id = "e_default", text = "Then tell that to the families at Raven Hill, and tell it loudly, because they're hard of hearing, being dead." } },
      choices = {
        { text = "That was careless of me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Someone has to say it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    letters = {
      lines = {
        { id = "l_default", text = "Eleven this year, each more eloquent than the last, and the replies grow shorter every time. The latest was two lines and a seal, and I've had it framed." },
      },
      choices = {
        { text = "What did the two lines say?", next = "letters_reply" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_reply = {
      lines = {
        { id = "lr_default", text = "That the Crown is aware of Darkshire's situation. Aware! I am aware of the fog, too, and being aware of it has never once made it lift." },
      },
      choices = {
        { text = "The court is slow for everyone.", next = "BACK", fx = { opinion = { stormwind = "patience" } } },
        { text = "Write a twelfth. Shorter. Angrier.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    watch = {
      lines = {
        { id = "w_default", text = "My kinswoman Althea commands it, and it's made of farmers, smiths and a baker or two. Stormwind took its guard home, so we raised and trained our own." },
      },
      choices = {
        { text = "Could you spare any of them elsewhere?", next = "solomon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    solomon = {
      lines = {
        { id = "so_default", text = "Magistrate Solomon asked me for my Watch. Had I sent them, the dead would have been in our square before they ever reached the forest's edge, and I told him so as politely as I could." },
        { id = "so_done", when = { questDone = TODO_QUEST("Messenger to Darkshire") },
          text = "You carried his plea here and my refusal back, and I'm sorry you had to. Solomon will curse me for it, and he'll be right to, and I would do it again." },
      },
      choices = {
        { text = "Lakeshire's fighting orcs alone.", next = "solomon_push", fx = { align = { honor = 1 } } },
        { text = "You chose your own people. That's fair.", next = "BACK", fx = { affinity = 1, learn = { "blackrock" }, align = { honor = -1 } } },
      },
    },
    solomon_push = {
      lines = {
        { id = "sp_default", text = "And we fight the dead alone. Tell Solomon I'm sorry, and then tell him to write to Stormwind, since they adore letters there." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = -1 } },
        { text = "That isn't the whole reason, is it, my lord?", tag = "Persuade", next = "solomon_whole",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { townStanding = { town = "darkshire", min = 30 } } } } },
          fail = { next = "solomon_stiff", fx = { affinity = -1 } } },
      },
    },

    council = {
      lines = {
        { id = "c_default", text = "Roads, graves and quarrels, and justice too, when Stormwind permits it. This year we sentenced a grave robber to death, and Stormwind took him off our hands instead." },
      },
      choices = {
        { text = "Who was he?", next = "council_ward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_ward = {
      big = true,
      lines = {
        { id = "cw_default", text = "Dextren Ward, who sold our dead out of Raven Hill to Morbent Fel, the necromancer on the hill. The House of Nobles keeps him in their Stockade, and Councilman Millstipe hasn't slept since.",
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
        { id = "em_default", text = "It's a nursery tale, about a kind alchemist who couldn't let his wife go. We tell it to make children come home before dark, and I truly thought it was only a story." },
      },
      choices = {
        { text = "I carried his supplies. I didn't know.", next = "embalmer_guilt" },
        { text = "How do we break him?", next = "embalmer_heart" },
      },
    },
    embalmer_guilt = {
      lines = {
        { id = "eg_default", text = "No one did. You were kind to a lonely old man, and that kindness nearly doomed this town, so let's see what it can do for us now." },
      },
      choices = {
        { text = "I'll make it right.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { darkshire = 1 } } },
        { text = "It wasn't my doing, and I won't carry it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    embalmer_heart = {
      lines = {
        { id = "eh_default", text = "In the story he put his own heart in her, and the curse made her hungry, so he keeps her buried. His heart is his power, so take it from her and bring it to me.",
          fx = { learn = { "embalmer" } } },
      },
      choices = {
        { text = "That's grotesque.", next = "BACK" },
        { text = "Then I'll find her grave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Prayed over it? There's more cemetery at Raven Hill than village now. Pray if you like, and then pray the dead hear you and stay where they're put." },
      },
      choices = {
        { text = "Has no one tended those graves?", next = "priest_graves" },
        { text = "I'll go at dawn.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { darkshire = 1 } } },
        { text = "Prayers won't keep the dead in the ground, but steel will.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    priest_graves = {
      lines = {
        { id = "pg_default", text = "Not since a knight came home from Lordaeron, found his family's stones and cut down the attendants. Few go up there to tend anything now; ask Sirra if you want the whole tale.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Then the graves need a priest more than ever.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Those graves are better left alone now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then you've sat in that chamber yourself. When my letters are read aloud, does anyone actually listen, or do they wait politely for luncheon?" },
      },
      choices = {
        { text = "They wait for luncheon.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 }, align = { honor = -1 } } },
        { text = "Some of them listen.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll speak for Darkshire there.", next = "BACK", fx = { affinity = 3, standing = { darkshire = 2 } },
          journal = { first = "Told Lord Ello Ebonlocke I'd speak for Darkshire in the House of Nobles.",
                      third = "{name} promised the mayor of Darkshire a voice in the House of Nobles." } },
      },
    },
    soldier = {
      lines = {
        { id = "sd_default", text = "One sword, then. Stormwind sends me soldiers one at a time, by accident, on their way somewhere else, and I'll gladly take it. Report to Althea before you change your mind." },
      },
      choices = {
        { text = "I'll report to her.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, learn = { "night_watch" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    solomon_whole = {
      big = true,
      lines = {
        { id = "sw_default", text = "No, it isn't. I counted the Watch the night his letter came, every farmer and baker of them, and there was no number I could send to Lakeshire that didn't leave one side of Darkshire dark." },
        { id = "sw_twelfth", text = "So I did the only thing a mayor without soldiers can do: my eleventh letter to the Crown wasn't about Darkshire at all, it was about Lakeshire. It came back with the same two lines as all the others, and I've not had the heart to tell Solomon I tried." },
      },
      choices = {
        { text = "He'd want to know, my lord.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That was a decent thing to do.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    solomon_stiff = {
      lines = {
        { id = "ss_default", text = "The council's decision is a matter of record, and the record is quite complete without any further commentary from its mayor. Good day to that subject." },
        { id = "ss_default2", text = "I have explained myself once, which is once more than the Crown ever explains itself to me. I'll not do it again for every traveller who passes through." },
      },
      choices = {
        { text = "As you say, my lord.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The council hears everything that goes bump in Duskwood, usually at great length and in the middle of the night. Ask me about any of this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For a friend of Darkshire, the council's knowledge is entirely at your disposal, minutes and all. Ask away." },
    },
    background = { { id = "tp_bg", text = "I'm the mayor of Darkshire, head of its council, and the author of more letters to the Crown than any man living. The town is my story, and it's a long one." } },
    advice = { { id = "tp_ad", text = "Keep to the road and inside the lamplight. If you must die in Duskwood, do it in Darkshire, where we still bury people properly." } },
    night_watch = { { id = "tp_watch", text = "They're brave, underpaid and outnumbered. My kinswoman runs it, and I'll admit she runs it better than I would." } },
    worgen = { { id = "tp_worgen", text = "They're in the woods every night, and closer every season. The council does not discuss them after dark." } },
    stalvan = { { id = "tp_stalvan", text = "That's old and unpleasant business. Ask Smitts at the Raven, because he never let it go." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock orcs are Lakeshire's problem, and we have more than enough of our own." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer in a house above Raven Hill, buying our dead. If Stormwind wants a reason to send soldiers, there it sits." } },
    embalmer = {
      { id = "tp_embalmer_next", when = { questDone = TODO_QUEST("Translation to Ello") }, text = "It's a nursery tale that came walking down the road at us. Ask what you came to ask.", next = "embalmer" },
      { id = "tp_embalmer", text = "It's a story nannies tell in Darkshire, about a husband, a dead wife and his own heart. I'd like it to stay a story." },
    },
    _none = { { id = "tp_none", text = "The council has no position on that, though it has far too many positions on everything else." } },
  },
}
