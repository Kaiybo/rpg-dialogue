-- Augustus the Touched, the plague-addled trader of Terrordale whom the Scourge walk past. Voice: bibles/augustus.md
-- Cheerful, scattered, half aware of what he's become; a shopkeeper who never noticed the town died around him.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "augustus_touched", id = TODO_NPC("Augustus the Touched"), name = "Augustus the Touched",
  bible = "bibles/augustus.md", role = "vendor", tier = "quest",
  communities = { "terrordale" }, temper = { "cheerful", "cowardly" }, values = { "curious" },
  notices = { "class", "purse" },
  impression = {
    first = "Augustus the Touched keeps shop in the ruins of Terrordale as if the town were still full of customers, and the Scourge shamble past him without a glance. He laughs too much, and he can't remember whether he's alive.",
    third = "{name} traded with Augustus the Touched, a plague-addled merchant whom the Scourge ignore in Terrordale.",
  },

  greetings = {
    { id = "g_shop", text = "A customer, a real one, with a pulse and everything! Come in, come in, mind the fellow in the doorway, he doesn't bite anymore, or at least not me." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I remembered your face, which is a good sign, because I've been forgetting my own lately." },
    { id = "g_book", when = { questActive = TODO_QUEST("Augustus' Receipt Book") }, text = "Have you found my receipt book? I'm sure it's in the old house up the lane, unless I left it somewhere else, which I very likely did." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and nobody's been in since but the usual shufflers, who never buy anything. Business is terrible, but the company's very quiet." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "Oh, please don't do anything holy at me, I've no idea what it would do, and I'd rather not find out in front of a customer." },
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now that's a purse that jingles properly! I don't suppose you'd like to spend some of it somewhere very safe, like here?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Augustus, purveyor of fine goods to Terrordale, and these days to anyone brave or daft enough to come looking. The town's been a bit slow since the plague, but I'm sure it'll pick up." },
        { id = "h_book_before", when = { questBefore = TODO_QUEST("Augustus' Receipt Book") },
          text = "I've lost my receipt book, you know, and a merchant without his receipts is just a man standing in a ruin holding things. It's somewhere in town, and the town's full of the dead, so I can't very well go and ask them." },
        { id = "h_book_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Augustus' Receipt Book"), days = 3 } },
          text = "My receipts, all of them, and only a little chewed! Now I can see who still owes me, though I suspect most of them are in no state to pay." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You're one of the walking ones but you're talking, which makes two of us, I think. Or perhaps only one of us, and I've never been quite sure which." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "I'll just keep my hand on the till while you're browsing, {class}, nothing personal. The dead don't steal, but the living have always been a worry." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all the time in the world, or a good bit of it, anyway." },
        { id = "h_again2", text = "Ask away! You're the first person in weeks to ask me anything but \"brains?\"" },
      },
      choices = {
        { text = "Why don't the Scourge attack you?", next = "touched" },
        { text = "What was Terrordale like before?", next = "town" },
        { text = "Who buys anything out here?", next = "trade" },
        { text = "Do you know the dwarf, Egan?", next = "egan" },
        { text = "What happened to your receipt book?", next = "book", when = { questBefore = TODO_QUEST("Augustus' Receipt Book") } },
        { text = "Let me cleanse you, Augustus. Hold still.", next = "cleanse", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },

    touched = {
      lines = { { id = "tc_default", text = "They think I'm one of them, I suppose, and they may be right. I caught the plague like everyone else, and I got very sick, and then one morning I got up and opened the shop, and nobody's bothered me since." } },
      choices = {
        { text = "Are you alive, Augustus?", next = "touched_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    touched_alive = {
      lines = { { id = "ta_default", text = "That's a very personal question to ask a shopkeeper! I eat, mostly, and I sleep, sometimes, and I don't smell any worse than the street does. I've decided not to think about it too hard, and I'd thank you not to either." } },
      choices = {
        { text = "Doesn't it frighten you, not knowing?", next = "touched_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    touched_fear = {
      big = true,
      lines = { { id = "tf_default", text = "Only at night, when they all stand still and listen to something I can't hear. What would you do, friend, if you woke up one day and found you might be one of them?" } },
      choices = {
        { text = "Hold on to who I was, and fight whatever's calling.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Make use of it. Walking unseen among them is a gift.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I honestly don't know, Augustus.", next = "BACK" },
      },
    },

    town = {
      lines = { { id = "to_default", text = "Busy, prosperous, a little smug, if I'm honest, being so near Stratholme and all that trade on the road. There was an inn with a very good stew and a baker who never once got my order right." } },
      choices = {
        { text = "And when the plague came?", next = "town_plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_plague = {
      lines = { { id = "tp_plague", text = "It came in the grain, they said afterward, though nobody said so at the time. Folk got sick, and then folk got up again, and the ones who didn't get up ran, and I stayed because somebody had to mind the shop." } },
      choices = {
        { text = "You stayed for the shop? Truly?", next = "town_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_stay = {
      lines = { { id = "ts_default", text = "Well, and because I was too sick to walk, but the shop sounds better. My mother always said a good merchant never closes early, and I've taken it rather further than she meant." } },
      choices = {
        { text = "Your mother would be proud, in her way.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's the saddest thing I've heard today.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    trade = {
      lines = {
        { id = "tr_default", text = "Adventurers, mostly, the Argent Dawn's lot, and once a Scarlet who ran off screaming before he paid. I've a few things nobody else this side of Stratholme sells, and you'd be surprised what the dead leave lying about." },
        { id = "tr_rep", when = { reputation = { faction = "Argent Dawn", min = "honored" } }, text = "The Dawn's people trade with me, and you look like one of their favorites. They're very polite, and they always check whether I'm still breathing before they haggle." },
      },
      choices = {
        { text = "Where does your stock come from?", next = "trade_stock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_stock = {
      big = true,
      lines = { { id = "tst_default", text = "Here and there, from houses nobody lives in anymore, which isn't stealing if the owners have moved on, is it? I tell myself so every morning, and some mornings I believe it." } },
      choices = {
        { text = "The dead have no use for it. Sell away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "It's still theirs, Augustus. It belongs to their kin.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    egan = {
      lines = { { id = "eg_default", text = "The little dwarf with the humming gun? He came by once, pointed it at me for a long moment, and then put it down and bought a spool of wire. I took that as a compliment." } },
      choices = {
        { text = "He frees the souls of Stratholme's dead.", next = "egan_souls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    egan_souls = {
      lines = { { id = "es_default", text = "Does he! Well, I hope he doesn't decide mine needs freeing, because it's quite comfortable where it is. Tell him I've more wire if he wants it, at a fair price." } },
      choices = {
        { text = "I'll pass it along.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    book = {
      lines = { { id = "bk_default", text = "I keep everything in it, who bought what, who owes me, my mother's recipe for apple cake. I had it under my arm when I went to look at the old house, and then I didn't, and the house was full of very rude people." } },
      choices = {
        { text = "I'll fetch it for you.", next = "book_fetch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_fetch = {
      lines = { { id = "bf_default", text = "Would you? Oh, splendid, and do try not to read the bit at the back, that's private. Bring it here and I'll make it worth your while, I promise, I'll even write you a receipt." } },
      choices = {
        { text = "Then let's do business.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cleanse = {
      lines = { { id = "cl_default", text = "No, no, no, thank you all the same! If you scrub the plague out of me I don't know what's left holding me up, and I'd hate to fall over in the middle of a sale." } },
      choices = {
        { text = "You'd rather stay as you are?", next = "cleanse_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleanse_stay = {
      big = true,
      lines = { { id = "cs_default", text = "I'd rather stay at all, friend. Perhaps that's cowardly, and perhaps you think it's wicked, but I've got a shop and a lane and the sun still comes up over it." } },
      choices = {
        { text = "Then I'll respect your choice. It's yours to make.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The plague isn't a choice. One day I'll cure you anyway.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Terrordale, sold things in Terrordale, and I'll probably go on selling things in Terrordale until the end of the world, or a little after." } },
    advice = { { id = "tp_ad", text = "Never close early, always count your change, and don't stand still at night when they're listening." } },
    argent_dawn = { { id = "tp_argent", text = "Lovely people at Light's Hope, very clean. They keep asking if I'd like to come and stay, and I keep saying I've a shop to run." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Rude, loud, and they never pay. One of them tried to set my awning on fire." } },
    _none = { { id = "tp_none", text = "I'm sure I knew that once, but it's gone wherever my receipt book went. Try asking someone with a full set of wits." } },
  },
}
