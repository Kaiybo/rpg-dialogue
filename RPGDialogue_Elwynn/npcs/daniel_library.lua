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
    first = "I like him more than his master seems to.",
    third = "{name} met Daniel, Brother Paxton's distractible library assistant, who knows where every trade trainer in Elwynn can be found.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh! It's you! I've saved you a book, a really good one, and Brother Paxton doesn't even know it's missing." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. Hello. I'm, ah, very busy alphabetising, so if you could be quick, please." },
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
    d6_oldest = {
      lines = { { id = "d6_oldest_a", text = "A book of hymns from before the First War, with the binding half burned, because someone carried it out of the old Stormwind when the orcs came. Brother Paxton won't let anyone open it but himself, and he only opens it on holy days." } },
      choices = {
        { text = "Who carried it out of the fire?", next = "d6_oldest2" },
        { text = "A book that survived a war deserves that care.", next = "d6_oldest2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d6_oldest2 = {
      lines = { { id = "d6_oldest2_a", text = "Nobody knows, and that's the best part. There's a name written inside the cover, just one word, and Brother Paxton says it's a novice who died on the road, and I like to think it was someone who just walked out of the fire holding it and kept going." } },
      choices = {
        { text = "That's a good thing to believe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Daniel.", next = "BACK" },
      },
    },
    d6_life = {
      lines = { { id = "d6_life_a", text = "Bells, mostly, for prayers and meals and lessons, so you always know what you're late for. Marshal McBride runs the recruits in the yard, Brother Sammuel teaches the paladins, and I run between all of them with messages nobody else wants to carry." } },
      choices = {
        { text = "Do the priests here teach you as well?", next = "d6_life2", when = { class = "PRIEST" } },
        { text = "Do you ever want to be a recruit yourself?", next = "d6_life2" },
        { text = "It sounds like a busy little world.", next = "d6_life2" },
      },
    },
    d6_life2 = {
      lines = {
        { id = "d6_life2_a", text = "I tried, once, for a week, and Marshal McBride sent me back to the library with a note that just said 'not this one.' I didn't mind, honestly, because a sword is heavy and a book is not, and I'm better at knowing where things are than hitting them." },
        { id = "d6_life2_priest", when = { class = "PRIEST" }, text = "Sometimes, when Priestess Anetta has a spare hour, she lets me sit in on the prayers. I don't think I'll ever take the robes, though, because I'd spend every service wondering whether the hymnals were shelved right." },
      },
      choices = {
        { text = "Knowing where things are is a gift too.", next = "BACK" },
        { text = "Ask you something else, then.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Daniel, Brother Paxton's assistant here in the library. I'm meant to be counting what's on the shelves, and I am, mostly, between other things." },
        { id = "h_inv", tags = { "news" }, when = { questActive = TODO_QUEST("Book Inventory") },
          text = "Brother Paxton wants to know how many books are missing, and the honest answer is more than I'd like and fewer than he fears. I'll have a proper count for him, I promise, only don't tell him I said 'fewer than he fears'." },
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
        { text = "Is anything missing from the shelves?", next = "books" },
        { text = "How do you get on with Brother Paxton?", next = "paxton" },
        { text = "What are the other things you do, Daniel?", next = "trades" },
        { text = "Who should I see about my trade?", next = "trainer", when = { maxLevel = 15 } },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "What's the oldest book in the Abbey?", next = "d6_oldest" },
        { text = "What's life like at Northshire Abbey?", next = "d6_life" },
        { text = "Your father was a cobbler?", next = "e3_father" },
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
        { text = "Forgive them, if they return it. That's the Abbey's way.", next = "BACK", reply = "I hoped you'd say that, because I'd say it too, if anyone asked me. I'll leave a note on the shelf that says no questions asked.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A thief is a thief. Paxton should turn them out.", next = "BACK", reply = "I suppose that's the rule, isn't it, but I'd hate to be the one who told him. I think I'll keep counting and hope it's a mouse.", fx = { align = { light = -1 } } },
        { text = "Let's find the books first.", next = "BACK" },
      },
    },
    paxton = {
      lines = { { id = "p_default", text = "He thinks I'm useless, if you want the truth. He's not wrong about the shelving, but I'm very good at other things, only they aren't things he needs." },
      },
      choices = {
        { text = "What things are you good at?", next = "trades" },
        { text = "He seems hard on you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    trades = {
      lines = { { id = "t_default", text = "Knowing who teaches what, and where! There are smiths and tanners and herbalists all over Elwynn, and most novices leave here not knowing a single one of them." },
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
        { text = "A trade is honest work. Your father was right.", next = "BACK", reply = "He was, though he'd never admit it about anything else. I think he'd have liked you.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A sword arm earns more, and faster.", next = "BACK", reply = "It does, I suppose, until it doesn't, and then you're very glad of a trade. My father knew a lot of soldiers who ended up mending shoes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainer = {
      lines = { { id = "tr_default", text = "Well, Goldshire's the place to start, just south of here, and there's more in Stormwind for proper training. Tell me what you fancy and I'll point you the right way." },
      },
      choices = { { text = "Thank you, Daniel.", next = "BACK", fx = { affinity = 1 } } },
    },
    e3_father = {
      lines = {
        { id = "e3_father_l0", text = "In Goldshire, just off the square, and he could make a boot that would outlast the man wearing it. He wanted me to take the shop, but I liked the letters on the leather better than the leather, so he sent me to the Abbey to learn reading instead." },
      },
      choices = {
        { text = "Does he mind that you didn't follow him?", next = "e3_father2" },
        { text = "You'd have made a poor cobbler, I think.", next = "BACK" },
      },
    },
    e3_father2 = {
      lines = {
        { id = "e3_father2_l0", text = "He says not, and he sends me a pair of boots every winter with a note tucked in the toe asking if I've read anything good. I always write back with a list, and I always put a cobbler in one of the stories, just for him." },
      },
      choices = {
        { text = "That's lovely, Daniel. Something else.", next = "BACK" },
        { text = "You should visit him more.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're the only one who ever asks me about the books, and I really appreciate that. Really, I do." },
    },
    grievance = {
      { id = "dp_gv", text = "You were unkind, and I keep thinking about it while I alphabetise, which slows me down terribly." },
    },
    background = { { id = "tp_bg", text = "Assistant to Brother Paxton, keeper of the shelves, and the only person in Northshire who knows where the nearest tanner is." } },
    advice = { { id = "tp_ad", text = "Learn a trade early. You'll thank me when you're out of coin and full of copper ore." } },
    _none = { { id = "tp_none", text = "Hmm, that's not in any book I've counted. Brother Paxton might know, if you can catch him in a good mood." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "Archbishop Faol rebuilt this Abbey after the Second War and founded the Brotherhood to keep it, and Brother Paxton has made me copy that sentence out about forty times. I could recite it in my sleep, and some nights I do." } },
    holy_light = { { id = "tp_holy_light", text = "Half the books on these shelves are about the Light, and the other half are arguments about the first half. I mostly dust them, which I like to think is a kind of prayer." } },
    dalaran = { { id = "tp_dalaran", text = "Some of the sealed books in the library wing came from Dalaran before the Scourge took it, and nobody's allowed to touch them, me least of all. I've counted the spines, though, and there are forty-one." } },
    scholomance = { { id = "tp_scholomance", text = "Brother Paxton says there's a school in the north where they teach the darkest arts, and that some of our sealed books would fetch a fortune there. That's why they're sealed, I suppose, and why he checks the locks twice." } },
  },
}
