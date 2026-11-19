-- Raedon Duskstriker, Alliance Cloth Quartermaster on the Craftsmen's Terrace (0.72.0). Voice: bibles/raedon.md
-- Classic (1.5): A Donation of Wool, of Silk, of Mageweave, of Runecloth; Additional Runecloth.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Raedon's grudge (authored, not canon): he signs the Alliance's manifests because Tyrande asked it,
-- and thinks joining was her mistake. Courteous, never rude; a player can soften him (npcFlag raedon_soft).
P:Claim {
  id = "raedon_alliance_brought_horde", by = "raedon", truth = "partly",
  text = "The Alliance's wars brought the Horde to Kalimdor, and now Stormwind asks the kaldorei to bleed for it.",
  truthNote = "The orcs did flee the human internment camps and Lordaeron to Kalimdor (canon), but Thrall sailed west at the Prophet's urging, and humans and orcs both fought beside the kaldorei at Hyjal. Raedon counts the cost and leaves out the debt.",
  tell = "true",
  exposedBy = { "thyntel.wa_default" },
}

P:NPC {
  key = "raedon", id = TODO_NPC("Raedon Duskstriker"), name = "Raedon Duskstriker", title = "Alliance Cloth Quartermaster",
  bible = "bibles/raedon.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "earnest", "harried" }, values = { "duty", "thrift" },
  notices = { "craft", "purse" },
  impression = {
    first = "He thanks people for wool more warmly than most do for gold.",
    third = "{name} met Raedon Duskstriker, the Alliance cloth quartermaster on Darnassus' Craftsmen's Terrace, who collects cloth for the kaldorei.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah, friend, and a moment of your time, if I may. Have you any cloth to spare?" },
    { id = "g_wool", when = { questDone = TODO_QUEST("A Donation of Wool") }, text = "Your wool went to the Sentinels at Astranaar last week. They'll sleep warmer for it." },
    { id = "g_rune", when = { questDone = TODO_QUEST("A Donation of Runecloth") }, text = "Runecloth from you again? I keep a tally, friend, and your name is near the top of it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and the shelves are as bare as ever. I'm glad to see you all the same." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown since your first bundle of wool, friend, and I expect your bags have grown with you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me on the Terrace that you've been helping folk about the city. That's the same work as mine, really, only with fewer bolts of linen." },
    { id = "g_human", when = { race = "Human" }, priority = 5,
      text = "Ishnu-alah, friend of Stormwind. You'll forgive me if I count your bundle twice; it's nothing personal, only a habit I learned from your king's quartermasters." },
    { id = "g_soft", when = { npcFlagBefore = "raedon_soft" }, priority = 10,
      text = "Ah, my honest donor. I've stopped counting your bundles twice, and my assistant has written that in the ledger as though it were news from the front." },
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
          text = "I am Raedon Duskstriker, quartermaster for the Alliance's cloth here in Darnassus. My people have endured the loss of Hyjal and the long years of rebuilding on Teldrassil, and now, on top of everything, we find ourselves in a dire shortage of cloth." },
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
        { text = "You say \"Alliance\" as though it tastes of something.", next = "alliance" },
        { text = "Is cloth from a human welcome here, quartermaster?", next = "xhuman_r", when = { race = "Human" } },
        { text = "Between kaldorei, Raedon, was joining the Alliance wise?", next = "xnelf_r", when = { race = "NightElf" } },
        { text = "Still counting the Alliance's share, Raedon?", next = "xsoft_r", when = { npcFlagBefore = "raedon_soft" } },
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

    alliance = {
      big = true,
      lines = {
        { id = "al_default", key = true,
          text = "Does it? I'm a courteous elf, friend, so I'll put it courteously: I think the High Priestess made a mistake when she set our name beside Stormwind's, and I count the cost of it in cloth every day." },
        { id = "al_human", when = { race = "Human" },
          text = "You've a sharp ear for a human. I'll be as courteous as you are, then: I think the High Priestess erred when she set our name beside your king's, and I count the cost of it in cloth every day." },
      },
      choices = {
        { text = "What cost? The Alliance sends you cloth as well.", next = "alliance_cost" },
        { text = "Tyrande has led your people since the Sundering. Trust her.", next = "BACK",
          reply = "I do trust her, friend, in everything but this, and that is exactly why it troubles me so. Even the moon has a dark side.", fx = { align = { order = 1 } } },
        { text = "Then say so to her face, not over bolts of linen.", next = "BACK",
          reply = "Wiser elves than I have said it to her face, and she heard them out. I say it over linen because linen is what I have.", fx = { align = { order = -1 } } },
      },
    },
    alliance_cost = {
      lines = {
        { id = "ac_default", fx = { hear = "raedon_alliance_brought_horde" },
          text = "The orcs came to Kalimdor fleeing human camps and human wars, and now the Warsong cut Ashenvale while Stormwind asks us for archers besides. We bled at Hyjal for a world the younger races broke, and I would rather our bandages stayed on our own wounds." },
      },
      choices = {
        { text = "Without the Alliance, Archimonde would have taken Hyjal.", next = "BACK",
          reply = "Without Thrall's orcs too, friend, and nobody asks me to send runecloth to Orgrimmar. Hyjal was a battle shared, not a debt that never ends.", fx = { align = { honor = 1 }, opinion = { alliance = "trust" } } },
        { text = "You're right. Let Stormwind fight its own wars.", next = "BACK",
          reply = "Quietly, friend, quietly, for I still have to press the Alliance's seal on every crate. But I'm glad someone else can do the arithmetic.", fx = { align = { honor = -1 }, opinion = { alliance = "distrust" } } },
        { text = "Where does the Alliance's share go?", next = "alliance_share" },
      },
    },
    alliance_share = {
      lines = {
        { id = "as_default", text = "Some to Theramore, whose lady at least pays her debts, and some to Stormwind's quartermasters for fronts I'll never see. I sign the manifests with a steady hand because the High Priestess asked it of me, and I keep my opinion folded in a drawer." },
      },
      choices = {
        { text = "Mathiel on the Warrior's Terrace would argue with you.", next = "BACK",
          reply = "He would, cheerfully and at length, and then he'd write a letter to a dwarf about it. Mathiel trusts everyone, which is a fine quality in a smith and a poor one in a quartermaster." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_r = {
      lines = {
        { id = "xh_default", text = "Welcome, and I'll take it with thanks, because a Sentinel's wound doesn't care whose sheep the wool came from. Only don't expect me to love your king for it; I have watched humans make promises to my people since Hyjal, and I have watched them keep about half." },
      },
      choices = {
        { text = "Stormwind has kept faith with you. Give it time.", next = "BACK",
          reply = "Time is the one thing I have more of than you, friend, so I'll give it gladly. I simply don't expect to be surprised.", fx = { align = { order = 1 } } },
        { text = "Fair enough. Kings make promises; people keep them.", next = "BACK",
          reply = "That I can believe, and it's why I'll still take your wool. People I can count; kings I can only endure.", fx = { align = { order = -1 } } },
        { text = "Then judge me by my cloth, not my king.", tag = "Persuade", next = "xsoft_set",
          check = { pass = { any = { { disposition = { min = 60 } }, { questDone = TODO_QUEST("A Donation of Silk") }, { questDone = TODO_QUEST("A Donation of Runecloth") }, { trait = "generous" } } } },
          fail = { next = "xhuman_fail", fx = { affinity = -1 } } },
      },
    },
    xsoft_set = {
      lines = {
        { id = "xs_default", key = true, fx = { npcFlag = { set = { "raedon_soft" } } },
          text = "Well, that's fair, and it's my own ledger that proves it. Your bundles have never come short and never come with a speech, so perhaps I've been judging Stormwind by its seals and not by its people, and I'll think on that." },
      },
      choices = {
        { text = "That's all I ask, quartermaster.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_fail = {
      lines = {
        { id = "xf_default", text = "Fine words, friend, and Stormwind's envoys say them better every season. Bring me cloth for a while, and we'll see what the words weigh." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Good day, quartermaster.", next = "END" },
      },
    },
    xnelf_r = {
      lines = {
        { id = "xn_default", text = "Between us, no. We kept the Legion out of this world alone for ten thousand years, and now the Alliance asks for our archers in lands we had never heard of while Ashenvale burns at home." },
      },
      choices = {
        { text = "We swore to the Alliance. Kaldorei keep their oaths.", next = "BACK",
          reply = "We do, and that is the trap of it: we keep oaths for a thousand years that humans make for one lifetime. I'll keep this one, though it chafes.", fx = { align = { honor = 1 } } },
        { text = "Then we should leave it and keep our archers home.", next = "BACK",
          reply = "Say that in the Temple and you'll get a long look from the priestesses. Say it to the old Sentinels and you'll get a drink.", fx = { align = { honor = -1 } } },
        { text = "Does the High Priestess know you feel this way?", next = "xnelf_tyr" },
      },
    },
    xnelf_tyr = {
      lines = {
        { id = "xt_default", text = "She knows half the Terrace feels it, and she has heard it from wiser elves than me. She answered that we fought alone once already and lost the world anyway, and in all these years I have not found a reply." },
      },
      choices = {
        { text = "Perhaps there isn't one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsoft_r = {
      lines = {
        { id = "xso_default", text = "Still counting, though I count yours only once now. I sent a bale of silk to Theramore last month without grumbling, and my assistant has not stopped staring at me since." },
      },
      choices = {
        { text = "Progress, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I count cloth, friend. It isn't glorious, but I've never had a Sentinel complain that her bedroll arrived." } },
    advice = { { id = "tp_ad", text = "Never sell your spare linen to a vendor for copper when someone might need a bandage. That's my whole philosophy, really." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels ask for so little and get even less, so I do what I can from up here." } },
    thrall = { { id = "tp_thrall", text = "The Horde's warchief, and he keeps his armies supplied better than I'd like. I count our cloth and I worry about his." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut Ashenvale and the Sentinels hold the line, and every bale of cloth I send goes to that line. Most of it comes back as bandages." } },
    theramore = { { id = "tp_theramore", text = "Theramore requisitions cloth from us when their ships are late, and Lady Proudmoore always pays her debts. I like a quartermaster on the other end of the ledger who keeps her word." } },
    booty_bay = { { id = "tp_booty_bay", text = "A goblin port that sells to both sides and smiles at each. I've bought cloth there when I had to, and I counted it twice." } },
    _none = { { id = "tp_none", text = "I only know cloth, friend, and I have had centuries to learn its every weave. Ask me about that." } },
  },
}
