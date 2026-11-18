-- Raedon Duskstriker, Alliance Cloth Quartermaster on the Craftsmen's Terrace (0.72.0). Voice: bibles/raedon.md
-- Classic (1.5): A Donation of Wool, of Silk, of Mageweave, of Runecloth; Additional Runecloth.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raedon", id = TODO_NPC("Raedon Duskstriker"), name = "Raedon Duskstriker", title = "Alliance Cloth Quartermaster",
  bible = "bibles/raedon.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "earnest", "harried" }, values = { "duty", "thrift" },
  notices = { "craft", "purse" },
  impression = {
    first = "Raedon Duskstriker counts bolts of cloth as though each one were a Sentinel's life, and to him it might be. He thanks people for wool with more feeling than most give for gold.",
    third = "{name} met Raedon Duskstriker, the Alliance cloth quartermaster on Darnassus' Craftsmen's Terrace, who collects cloth for the kaldorei.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah, friend, and a moment of your time, if I may. Have you any cloth to spare?" },
    { id = "g_wool", when = { questDone = TODO_QUEST("A Donation of Wool") }, text = "Your wool went to the Sentinels at Astranaar last week. They'll sleep warmer for it." },
    { id = "g_rune", when = { questDone = TODO_QUEST("A Donation of Runecloth") }, text = "Runecloth from you again? I keep a tally, friend, and your name is near the top of it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and the shelves are as bare as ever. I'm glad to see you all the same." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown since your first bundle of wool, friend, and I expect your bags have grown with you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me on the Terrace that you've been helping folk about the city. That's the same work as mine, really, only with fewer bolts of linen." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { name = "Tailoring", min = 150 } },
      text = "A tailor, and a good one by the look of your stitching. You'll know better than anyone what a bolt of runecloth is worth, then." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Your purse looks light, friend, so don't give me what you can't spare. The Alliance would sooner have you clothed than generous." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Raedon Duskstriker, quartermaster for the Alliance's cloth here in Darnassus. My people have endured a great deal since we left the old forests for Teldrassil, and now, on top of everything, we find ourselves in a dire shortage of cloth." },
        { id = "h_young", when = { maxLevel = 25 },
          text = "You're young for this work, friend, and I'd not ask much of you yet. When you've cloth to spare, though, bring it here, because every bundle counts." },
        { id = "h_rune", when = { minLevel = 50 },
          text = "Runecloth is what we need most now, friend, the finest of it. If you have the materials to spare, I ask that you donate them, and the night elves will be grateful to you everywhere." },
        { id = "h_human", when = { race = "Human" },
          text = "A human of Stormwind! Your people have their own quartermaster at home, I know, but cloth given here warms Sentinels on Kalimdor's front, and they'll thank you for it." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I'll be here sorting bolts until the moon is up." },
        { id = "h_again2", text = "Go on. The cloth isn't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Why does Darnassus need so much cloth?", next = "shortage" },
        { text = "That's a great deal of cloth.", next = "where" },
        { text = "Why should I give cloth away?", next = "why" },
        { text = "I'm a tailor. I could sew instead of giving.", next = "tailor_r", when = { profession = "Tailoring" } },
        { text = "I'd like to donate.", next = "BUSINESS" },
        { text = "Good day, quartermaster.", next = "END" },
      },
    },

    shortage = {
      lines = {
        { id = "sh_default", text = "We built a city in a few short years, friend, and the Sentinels hold a long line from Ashenvale to Feralas. Every bandage, bedroll and banner has to come from somewhere, and our looms can't keep pace." },
      },
      choices = {
        { text = "Could the city not make more looms?", next = "shortage_looms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shortage_looms = {
      lines = {
        { id = "sl_default", text = "It could, and it has, but looms need weavers, and too many of our young weavers have taken up a bow instead. I don't blame them, though I'd like a few of them back." },
      },
      choices = {
        { text = "Then the war comes first.", next = "shortage_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shortage_war = {
      big = true,
      lines = {
        { id = "sw_default", text = "The war comes first, the elders say, and I'm not one to argue with elders. But a Sentinel with no bandage is only half a Sentinel, and somebody has to count the bandages." },
      },
      choices = {
        { text = "The bow matters more than the loom.", next = "BACK", reply = "Perhaps it does, friend, until the archer bleeds and there is nothing to bind the wound with. Then the loom matters very much indeed.", fx = { align = { order = 1 } } },
        { text = "Your work is as brave as theirs.", next = "BACK", reply = "That is kinder than most say, and I will carry it with me to the next bale of linen. Brave is a big word for counting bandages, but I thank you for it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },

    where = {
      lines = {
        { id = "wh_default", text = "Linen and wool go for bandages and bedrolls, and silk and mageweave for the priestesses' robes and the Sentinels' cloaks. Runecloth, the finest, we keep for those standing in the worst of it." },
      },
      choices = {
        { text = "Someone must stand in the worst of it.", next = "where_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_worst = {
      lines = {
        { id = "ww_default", text = "Ashenvale, where the Horde cut our trees, and Feathermoon, where the naga come up out of the sea. I send what I can and pray it's enough." },
      },
      choices = {
        { text = "I'll bring what I can.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "Goodbye, quartermaster.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "wy_default", text = "Because you'll earn the gratitude of night elves everywhere, friend, and gratitude is a currency here, whatever the goblins think. And because someone in Ashenvale is cold tonight." },
      },
      choices = {
        { text = "That's reason enough for me.", next = "BACK", reply = "Then Elune keep you, and keep whoever ends up wrapped in the cloth you bring. Ashenvale will be a little warmer for it.", fx = { align = { light = 1 } } },
        { text = "Gratitude won't pay for my repairs.", next = "BACK", reply = "No, it won't, and I would never pretend otherwise to you. But a good name opens doors in Darnassus that gold never could, and those doors lead to better work.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor_r = {
      lines = {
        { id = "tr_default", text = "I wish I could take you up on it, but the Alliance wants the cloth itself, counted and stored. Our own weavers cut it to the Sentinels' patterns, and they're very particular about seams." },
      },
      choices = {
        { text = "I'll leave it there. Something else.", next = "BACK" },
        { text = "Goodbye, quartermaster.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I count cloth, friend. It isn't glorious, but I've never had a Sentinel complain that her bedroll arrived." } },
    advice = { { id = "tp_ad", text = "Never sell your spare linen to a vendor for copper when someone might need a bandage. That's my whole philosophy, really." } },
    sentinels = { { id = "tp_sentinels", text = "They ask for so little and get even less, so I do what I can from up here." } },
    thrall = { { id = "tp_thrall", text = "The Horde's warchief, and he keeps his armies supplied better than I'd like. I count our cloth and I worry about his." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut Ashenvale and the Sentinels hold the line, and every bale of cloth I send goes to that line. Most of it comes back as bandages." } },
    theramore = { { id = "tp_theramore", text = "Theramore requisitions cloth from us when their ships are late, and Lady Proudmoore always pays her debts. I like a quartermaster on the other end of the ledger who keeps her word." } },
    booty_bay = { { id = "tp_booty_bay", text = "A goblin port that sells to both sides and smiles at each. I've bought cloth there when I had to, and I counted it twice." } },
    _none = { { id = "tp_none", text = "I only know cloth, friend, and I have had a long life to learn a great deal about it. Ask me about that." } },
  },
}
