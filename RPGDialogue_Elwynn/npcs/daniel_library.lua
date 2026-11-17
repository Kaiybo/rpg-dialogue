-- Daniel, Brother Paxton's assistant in Northshire Abbey's library wing. Voice: bibles/daniel_library.md
-- Meant to be counting the missing books; would much rather talk about Elwynn's trade professions.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daniel_library", id = TODO_NPC("Daniel"), name = "Daniel",
  title = "Librarian's Assistant",
  bible = "bibles/daniel_library.md", role = "scholar", tier = "quest",
  communities = { "northshire" }, temper = { "eager" }, values = { "curious", "craft" },
  notices = { "profession", "lore" },

  impression = {
    first = "Daniel is meant to be counting Brother Paxton's missing books, and he will tell you about every trainer in Elwynn before he gets round to it. I liked him more than his master seems to.",
    third = "{name} met Daniel, Brother Paxton's distractible library assistant, who knows where every trade trainer in Elwynn can be found.",
  },

  greetings = {
    { id = "g_shelf", text = "Oh! Sorry, I was just, ah, alphabetising. Can I help you find something?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you taken up a profession yet? You should, you know, everyone should." },
    { id = "g_inv", when = { questActive = TODO_QUEST("Book Inventory") }, text = "Brother Paxton sent you about the inventory, didn't he? I can tell by your face; he makes everyone look like that." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}! I've reshelved the whole history section twice while you were away, and I still can't find what's missing." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've been out in the world since I last saw you, haven't you? I can always tell; people come back taller somehow." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The brothers have been saying nice things about you at supper. That never happens to me, so well done." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Somebody at the Abbey says you told them a fib. I won't tell Brother Paxton, but you know how he is about honesty." },
  },

  notice = {
    { id = "n_prof", cat = "profession", when = { profession = { "Blacksmithing", "Tailoring", "Leatherworking", "Alchemy" } },
      text = "Is that a trade I see? Oh, tell me who taught you; I keep a list, and I'm always missing someone." },
    { id = "n_book", cat = "lore", when = { class = "MAGE" },
      text = "A mage! You won't have borrowed any of our books by accident, will you? I'm only asking everyone." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Daniel, Brother Paxton's assistant here in the library. I'm meant to be counting what's on the shelves, and I am, mostly, between other things." },
        { id = "h_inv", tags = { "news" }, when = { questActive = TODO_QUEST("Book Inventory") },
          text = "He wants to know how many are missing, and the honest answer is more than I'd like and fewer than he fears. I'll have a proper count for him, I promise, only don't tell him I said 'fewer than he fears'." },
        { id = "h_done", when = { questDone = TODO_QUEST("Book Inventory") },
          text = "The count's done, and Brother Paxton says it's the first useful thing I've given him. I'm choosing to take that as praise." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin in the library! The Holy Light section is just there, though I'd guess you've read it already." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with? Anything at all, really." },
        { id = "h_again2", text = "Go on. I've a moment before Brother Paxton comes looking." },
      },
      choices = {
        { text = "You seem to be missing a good many books.", next = "books" },
        { text = "Brother Paxton calls you useless.", next = "paxton" },
        { text = "You seem keen on trades.", next = "trades" },
        { text = "Who should I see about my trade?", next = "trainer", when = { maxLevel = 15 } },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "I'll let you get back to counting.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Histories, mostly, and a few of the older prayer books, the ones with the good bindings. Nobody's signed them out, and the brothers swear they haven't moved them." },
      },
      choices = {
        { text = "So someone took them.", next = "books_who" },
        { text = "Maybe they're just misplaced.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    books_who = {
      lines = { { id = "bw_default", text = "That's what Brother Paxton thinks, though he won't say it at supper. The Abbey has novices coming and going every day, and I'd hate to think it was one of them." },
      },
      choices = {
        { text = "Then we should find out who.", next = "books_judge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_judge = {
      big = true,
      lines = { { id = "bj_default", text = "And if it is a novice? A hungry one, say, who sold a book for bread? I'd want them to bring it back, but I wouldn't want them thrown out of the Abbey." },
      },
      choices = {
        { text = "Forgive them, if they return it. That's the Abbey's way.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A thief is a thief. Paxton should turn them out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's find the books first.", next = "BACK" },
      },
    },
    paxton = {
      lines = { { id = "p_default", text = "He does, doesn't he? He's not wrong about the shelving, but I'm very good at other things, only they aren't things he needs." },
      },
      choices = {
        { text = "What things are you good at?", next = "trades" },
        { text = "He seems hard on you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    trades = {
      lines = { { id = "t_default", text = "Knowing who teaches what, and where! There are smiths and tanners and herbalists all over Elwynn, and half the novices leave here not knowing a single one of them." },
      },
      choices = {
        { text = "Why does that matter so much to you?", next = "trades_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trades_why = {
      lines = { { id = "tw_default", text = "Because a trade lasts longer than a sword arm, my father said, and he was a cobbler who never went hungry. A book teaches you what a thing is, and a trade teaches you how to make it." },
      },
      choices = {
        { text = "A trade is honest work. Your father was right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A sword arm earns more, and faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainer = {
      lines = { { id = "tr_default", text = "Well, Goldshire's the place to start, just south of here, and there's more in Stormwind for proper training. Tell me what you fancy and I'll point you the right way." },
      },
      choices = { { text = "Thank you, Daniel.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Assistant to Brother Paxton, keeper of the shelves, and the only person in Northshire who knows where the nearest tanner is." } },
    advice = { { id = "tp_ad", text = "Learn a trade early. You'll thank me when you're out of coin and full of copper ore." } },
    _none = { { id = "tp_none", text = "Hmm, that's not in any book I've counted. Brother Paxton might know, if you can catch him in a good mood." } },
  },
}
