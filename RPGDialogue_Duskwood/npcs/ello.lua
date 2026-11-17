-- Lord Ello Ebonlocke, mayor of Darkshire, Town Hall. Voice: bibles/ello.md
-- Every conversation comes back to one question: where is the Stormwind Army?
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ello", id = TODO_NPC("Lord Ello Ebonlocke"), name = "Lord Ello Ebonlocke",
  rivals = { "althea" },
  bible = "bibles/ello.md", role = "noble", tier = "major",
  communities = { "darkshire" }, temper = { "proud" }, values = { "lawful", "ambitious" },
  notices = { "status", "stormwind" },

  impression = {
    first = "Lord Ello Ebonlocke has asked Stormwind for soldiers more times than he can count. He is courteous, a little grand, and quietly desperate under all of it.",
    third = "{name} met Lord Ello Ebonlocke, mayor of Darkshire, who has long petitioned Stormwind for soldiers the Night Watch badly needs.",
  },

  greetings = {
    { id = "g_op_watch_soldiers", when = { opinion = { topic = "night_watch", stance = "needs_soldiers" } }, text = "Ah, my ally in correspondence! The twelfth letter has gone, with your opinion in it underlined, and I await the Crown's thirteenth refusal with great interest." },
    { id = "g_mayor", text = "The mayor's time is precious, {class}, and Darkshire's is more precious still." },
    { id = "g_army", when = { minLevel = 25 }, text = "Has Stormwind sent you? Please, tell me that Stormwind has finally sent you." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "Ah, Darkshire's favourite! Come in, come in, and mind the council's chairs, because they're older than they look." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Night Watch keeps a file on you, and I'm told it's a thick one." },
    { id = "g_bride", when = { questActive = TODO_QUEST("Bride of the Embalmer") }, text = "Have you brought the heart? Don't make that face at me; you know perfectly well which heart I mean." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, {class}, and Darkshire has buried two more of its own while you were gone. Do sit, and tell me Stormwind has finally stirred." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "Back after {away}, and looking far more like an army than anything Stormwind has sent me! The council will be delighted, or they would be, if they were ever delighted." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The council tells me you've been of real service to Darkshire these past days. I shall mention it in my next letter to the Crown, for all the good it will do." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you've offended someone in my town, {class}. Darkshire has precious few friends left, so I'd thank you not to cost it any more." },
  },

  notice = {
    { id = "n_tabard", cat = "stormwind", when = { class = { "PALADIN", "WARRIOR" }, minLevel = 25 },
      text = "You've a soldier's bearing about you. Are you the vanguard, then, with the Army marching behind? No, of course you aren't." },
    { id = "n_shabby", cat = "status", when = { durability = { max = 0.25 } },
      text = "You'll forgive me if I don't offer you a seat. The council's upholstery has suffered enough this year." },
  },

  start = "hello",
  nodes = {
    op_watch = {
      lines = {
        { id = "op_watch_a", text = "Every night, around the second bottle of Smitts's red. Councilman Millstipe says the Night Watch is all the army Darkshire will ever get, so we ought to stop begging and start drilling bakers. I say a baker with a pike is still a baker. Which of us is right?" },
      },
      choices = {
        { text = "Millstipe's right. The Night Watch has held this long; trust it.", next = "op_watch_1", fx = { opinion = { night_watch = "holding", stormwind = "abandoned_its_own" }, align = { order = -1 } } },
        { text = "You're right, Lord Mayor. Darkshire needs real soldiers. Keep writing.", next = "op_watch_2", fx = { opinion = { night_watch = "needs_soldiers", stormwind = "patience" }, align = { order = 1 }, affinity = 2 } },
        { text = "Drill the bakers and keep writing. Do both.", next = "op_watch_3", fx = { opinion = { night_watch = "holding" }, trait = { practical = 1 }, affinity = 1 } },
        { text = "Write to Ironforge instead. They answer letters.", next = "op_watch_4", when = { race = "Dwarf" }, fx = { opinion = { night_watch = "needs_soldiers", dwarves = "loyal" } } },
        { text = "I'm sure the council knows best, Lord Mayor.", next = "BACK" },
      },
    },
    op_watch_1 = {
      lines = { { id = "op_watch_r1", text = "My kinswoman would agree with you, and she'd say it with a pike in her hand, which is a persuasive way to say anything. I'll keep writing all the same, because I'm a politician, and it's the only weapon I'm good with." } },
      choices = { { text = "Something else, Lord Mayor.", next = "BACK" } },
    },
    op_watch_2 = {
      lines = { { id = "op_watch_r2", text = "Thank you. I'll put that in the twelfth letter, that a traveller of some standing agrees with the Lord Mayor, and I'll underline it twice." } },
      choices = { { text = "Something else, Lord Mayor.", next = "BACK" } },
    },
    op_watch_3 = {
      lines = { { id = "op_watch_r3", text = "Both! Of course both; it's so obvious I'm embarrassed nobody on the council said it. I'll propose it as a motion and take the credit, if you don't mind." } },
      choices = { { text = "Something else, Lord Mayor.", next = "BACK" } },
    },
    op_watch_4 = {
      lines = { { id = "op_watch_r4", text = "I have, you know, twice, and I received a very courteous reply and a crate of something that exploded in the Town Hall. I'll write again, with your name in it." } },
      choices = { { text = "Something else, Lord Mayor.", next = "BACK" } },
    },
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Darkshire cares about one prisoner in that place, and the rest may rot or riot as they please. Ward sold our dead to a necromancer and I sentenced him for it, and the House of Nobles took him from us on a point of law, which I have not forgiven and do not intend to." } },
      choices = {
        { text = "The law is the law, my lord, even when it's slow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Darkshire's justice should be Darkshire's, whatever the House says.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What would you have done with Ward?", next = "xcl_stocks2" },
      },
    },
    xcl_stocks2 = {
      lines = { { id = "xcl_stocks2_default", text = "Hanged him at the edge of Raven Hill, where the families could see it done, and buried him somewhere nobody would think to dig. It isn't mercy, I know, but I'm a mayor and not a priest, and Darkshire ran out of mercy for men like him some time ago." } },
      choices = {
        { text = "Then I hope Darkshire gets its justice yet, my lord.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Rarely, and never with enough. I'm courteous, but desperate. A shaman's help would be welcome." } },
      choices = {
        { text = "Then I'll help Darkshire, my lord. Count on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop waiting on Stormwind. Rule Darkshire yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I begin to doubt it, and I say that as a loyal subject of the crown. Stormwind has its own troubles, I'm told, but the dead don't stop walking because the nobles are busy, so until they come, the Night Watch and warriors like you are all we have." } },
      choices = {
        { text = "Then I'll fight for Darkshire until Stormwind remembers you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stormwind won't come. You should stop asking and start hiring.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "I've considered every road to Stormwind's ear, including the less respectable ones, and I'm ashamed to say I've written to people I'd never have dined with. If you have such a road, I won't ask what it costs you." } },
      choices = {
        { text = "I'll use the proper channels, my lord.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Shadows open doors that petitions don't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What does Darkshire need from Stormwind?", next = "need" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Medivh's tower has troubled this valley since before my grandfather's time, and some say the forest darkened in the same years his madness grew. I don't know if that's true, mage, but I'd send no one up that pass alone." } },
      choices = {
        { text = "Such places need the Kirin Tor's oversight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some towers are best left to the brave and curious.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Why won't Stormwind send an army?", next = "army" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "My town fears everything, and with good reason, so you'll forgive them if they cross the road. I'm a courteous man and a desperate one, and I'll judge you by whether the wolves are fewer when you leave." } },
      choices = {
        { text = "Judge me on deeds. I'll earn it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fear is useful. Let them keep it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Tell me about the Night Watch.", next = "watch" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade", faction = "Alliance" },
          text = "I'm told you've been down through Stormwind's Stockade and put its riot to rest. If you passed a cell with Dextren Ward in it, I hope you looked him in the eye for Darkshire, because the House of Nobles never will." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "Althea speaks well of you, which means you told her pikes are worth more than paper. Perhaps they are, this week, but I'll still be writing to Stormwind when the pikes need replacing." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "My kinswoman tells me you don't think much of her Watch. She's wrong about my letters, and you may be wrong about her farmers, so sit down and we'll see which of us is more wrong." },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and welcome, for I have asked Stormwind for a hundred of you and received a polite letter instead. You'll forgive me if I'm glad of one." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I've asked Stormwind for soldiers more times than I can count. Will your spirits answer where they won't?" },
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
        { text = "What do you know of the grove in the heart of the wood?", next = "druid", when = { class = "DRUID" } },
        { text = "Your wolves are thinning. I've been hunting them.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Ironforge has its own wars, my lord, but I came.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "There are quieter roads to Stormwind's ear, my lord.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Karazhan is close. Its shadow must trouble Darkshire.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt Stormwind will ever send soldiers here, my lord.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your town fears me, Lord Ebonlocke.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Stormwind doesn't seem to answer your requests, Lord Ebonlocke.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The Stockade is quiet now, my lord. Does Darkshire care?", next = "xcl_stocks", when = { cleared = "The Stockade", faction = "Alliance" } },
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
        { text = "I saw no walls around Darkshire.", next = "need_walls" },
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
        { text = "Has the council ever thought of not asking Stormwind at all?", next = "op_watch" },
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
        { id = "so_default", text = "Magistrate Solomon of Lakeshire asked me for my Watch to fight his orcs. Had I sent them, the dead would have been in our square before they ever reached the forest's edge, and I told him so as politely as I could." },
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
        { id = "em_default", text = "It's a nursery tale, about a kind alchemist who couldn't let his wife go. We tell it to make children come home before dark, and until this month I thought it was only a story." },
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
        { text = "Nobody seems to tend those graves anymore.", next = "priest_graves" },
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
    druid = {
      lines = {
        { id = "dr_default", text = "The Twilight Grove? Very little, and I prefer it that way. The trees there are green when nothing else in Duskwood is, and the few hunters who went to look came back very quiet and wouldn't say why." },
      },
      choices = {
        { text = "Something there is worth protecting.", next = "druid_protect" },
        { text = "Perhaps it's best left alone.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    druid_protect = {
      lines = { { id = "dp_default", text = "Then protect it, by all means, and the council will thank you in a formal motion. I only ask that whatever lives there doesn't follow you back to my town hall." } },
      choices = {
        { text = "I'll go gently.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Have you really? Then you've done more for Darkshire's roads this week than Stormwind has all year, and I'll say so to the council. Tell me, are they worgen or simply wolves? My people can't agree." } },
      choices = {
        { text = "Both. And the worgen are worse.", next = "BACK", fx = { affinity = 1, learn = { "worgen" } } },
        { text = "Mostly wolves. Your people scare easily.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Which is more than I can say for the capital, and I've written to Ironforge too, you know. The King under the Mountain sent a very handsome letter declining, on very handsome paper." } },
      choices = {
        { text = "Ironforge keeps its promises when it makes them.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Then I'll be Ironforge's answer.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
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
    varian = { { id = "tp_varian", text = "I have written to the king more times than any man living, and since he went missing I write to the Highlord instead. The army has not come, and I begin to wonder whether my letters arrive at all." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Bolvar is a paladin of great honor, and I've no doubt he would send men if he could. Somebody in that Keep is telling him he can't, and I would very much like to know who." } },
    prestor = {
      { id = "tp_prestor", text = "Lady Prestor sends Darkshire the most beautiful refusals I have ever read. I keep them in a drawer, and some evenings I read them aloud to the council, for practice." },
      { id = "tp_prestor2", when = { disposition = { min = 65 } }, text = "Between us, every refusal from the Keep since Lady Prestor came to court has had the same gracious turn of phrase. I accuse nobody, but I've stopped believing it's a coincidence." },
    },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill was a thriving village under this council's care, and we lost it to the dead in a single winter. Its cemetery is the town's shame, and I'll not rest easy until it's quiet." } },
    dark_riders = { { id = "tp_dark_riders", text = "The Dark Riders come out of Deadwind Pass, burn what they please and ride back again. The council has reported them to Stormwind eleven times, and I can show you the copies." } },
    scourge = { { id = "tp_scourge", text = "Lordaeron fell to its dead within a year, and Darkshire has held out against its own for longer than that with farmers and lanterns. I should like someone in Stormwind to consider that before they tell me the army is stretched." } },
    holy_light = { { id = "tp_holy_light", text = "Darkshire's chapel lights its candles every evening, and the Light has kept us better than the Crown has. I say that as a loyal man, mind you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I once petitioned the Darkmoon Faire to come to Darkshire and lift the town's spirits. They sent a most courteous letter declining, which I filed beside the Keep's." } },
  },
}
