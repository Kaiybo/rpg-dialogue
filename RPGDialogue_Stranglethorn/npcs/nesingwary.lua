-- Nesingwary's Expedition: Hemet Nesingwary's hunting camp in northern Stranglethorn. Voice: bibles/stranglethorn.md
-- Classic has the father, Hemet Nesingwary (his son took over the camp only when he left for Outland).
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nesingwary", id = TODO_NPC("Hemet Nesingwary"), name = "Hemet Nesingwary",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "major",
  communities = { "nesingwary_camp" }, temper = { "gruff" }, values = { "brave", "proud" },
  notices = { "class", "pet", "kit" },

  greetings = {
    { id = "g_camp", text = "Quiet, now. Ye'll scare the game. Sit, if ye must. Then be useful." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back with all yer limbs. Good. The jungle doesnae give many second chances." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, eh? Doesnae matter. A good shot's a good shot, whatever colors it's wearin'." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Proper, by the look o' yer kit. Ye'll understand what this place is, then. The finest huntin' ground in the world." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Fine animal, {pet}. Keep it close here. Every beast in this jungle would love tae make a meal o' yer friend." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Somethin' had a go at ye. Raptors, by the look. They hunt in packs. Learn that, or learn nothin' else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hemet Nesingwary. I came tae Stranglethorn for the huntin', an' I'm stayin' for the huntin'. Raptors, panthers, tigers, an' the great cat himself. There's nothin' else worth the trip." },
        { id = "h_welcome", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Welcome to the Jungle") }, { questActive = TODO_QUEST("Hunting in Stranglethorn") }, { questActive = TODO_QUEST("Hemet Nesingwary") } } },
          text = "Somebody sent ye tae me. Good. I've more beasts than hunters, an' I like it that way, but even I cannae shoot them all." },
        { id = "h_raptors", when = { questActive = TODO_QUEST("Raptor Mastery") },
          text = "Raptors. Fast an' clever, an' they never come alone. Thin them, an' ye'll start tae think like one. That's the point." },
        { id = "h_bangalash", when = { questActive = TODO_QUEST("Big Game Hunter") },
          text = "King Bangalash. The great cat o' the jungle. I've seen him once, at dusk, an' I've thought of nothin' else since. Bring me his head." },
        { id = "h_dusk", when = { timeOfDay = "night" },
          text = "Listen. Hear that? Somethin' big, west o' camp, movin' slow. Tomorrow. Tonight we drink." },
      },
      choices = {
        { text = "Why hunt at all?", next = "why" },
        { text = "I'll hunt for you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because a man finds out what he is when somethin' bigger than him is lookin' back. Most never find out. In the jungle, everybody does. Usually quick." },
      },
      choices = {
        { text = "And what are you?", next = "what" },
        { text = "I'll find out, then.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    what = {
      lines = {
        { id = "wt_default", text = "Still here. That's the answer, every mornin'. It's a good answer. Write it down. Barnil does." },
      },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Does it have fur, claws or teeth? No? Then I couldnae care less." } },
  },
}

P:NPC {
  key = "barnil", id = TODO_NPC("Barnil Stonepot"), name = "Barnil Stonepot",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "patient" }, values = { "loyal", "orderly" },
  notices = { "race" },

  greetings = {
    { id = "g_pages", text = "Mind where ye step, friend. If ye see a loose page anywhere, it's ours. Don't step on it. Pick it up." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in this heat! Ye'll melt. I did, the first month. Then ye stop noticin'. Mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Barnil Stonepot. I keep the master's camp, his kit, an' his book. He's a hero o' the Alliance, ye know. Ye wouldnae think it, the way he snores." },
        { id = "h_book", tags = { "news" }, when = { questActive = TODO_QUEST("The Green Hills of Stranglethorn") },
          text = "I was proofreadin' the master's book, The Green Hills of Stranglethorn, when the wind took the lot. Pages all over the jungle now. Find them. Please. He doesnae know yet." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I like it here, truth be told. Cleanin' rifles, packin' for the next trip. Peaceful. I miss a good fight sometimes, but the jungle's always happy tae provide one." },
      },
      choices = {
        { text = "What's the book about?", next = "book" },
        { text = "I'll look for the pages.", next = "END", fx = { affinity = 2 } },
      },
    },
    book = {
      lines = {
        { id = "b_default", text = "The huntin', mostly. The jungle, the beasts, the master bein' brave at them. It's good. Too many words about the master's rifle, but don't tell him I said so." },
      },
      choices = { { text = "Your secret's safe.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the master. He'll tell ye. At length." } },
  },
}

P:NPC {
  key = "ajeck", id = TODO_NPC("Ajeck Rouack"), name = "Ajeck Rouack",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "focused" }, values = { "proud", "brave" },
  notices = { "class" },

  greetings = {
    { id = "g_bow", text = "Careful. I'm restringing. Talk if you like; I'll listen." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Show me your bow. Hm. Not bad. Your draw's short. Fix that before you go after anything with stripes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ajeck Rouack. My father put a bow in my hands before I could read, and taught me tigers before he taught me manners. I teach tiger hunting now. One day I'll take Sin'Dall." },
        { id = "h_tigers", tags = { "news" }, when = { questActive = TODO_QUEST("Tiger Mastery") },
          text = "Young tigers first. Then the older ones. Then the ones the trolls are afraid of. That's how my father taught me, and he was never wrong about tigers." },
        { id = "h_sindall", when = { metBefore = true },
          text = "I saw Sin'Dall's tracks this morning, by the river. Fresh. He knew I'd find them. He's teasing me." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Tigers hunt at night. So I sleep in the day, when I can. Hemet thinks it's lazy. Hemet snores." },
      },
      choices = {
        { text = "Who is Sin'Dall?", next = "sindall" },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    sindall = {
      lines = {
        { id = "s_default", text = "The oldest tiger in Stranglethorn. Clever, patient, and bigger than any I've seen. My father hunted him for years. I mean to finish what he started." },
      },
      choices = { { text = "Good hunting.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not tigers. Not my concern." } },
  },
}

P:NPC {
  key = "erlgadin", id = TODO_NPC("Sir S. J. Erlgadin"), name = "Sir S. J. Erlgadin",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "nesingwary_camp" }, temper = { "bitter" }, values = { "honorable", "proud" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_sir", text = "Sir Erlgadin. Just 'Sir', thank you. I've given up the rest." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Honest about it, at least. That's more than I can say for my former colleagues in the House of Nobles." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sir S. J. Erlgadin. I was a count, once, in Stormwind's House of Nobles. I've stopped answering to it. I hunt panthers now. Panthers, at least, are honest about what they want." },
        { id = "h_panthers", tags = { "news" }, when = { questActive = TODO_QUEST("Panther Mastery") },
          text = "Panthers. They hide better than tigers and strike faster. Learn to see one before it sees you, and you'll have learned something the nobles never did." },
        { id = "h_city", when = { metBefore = true },
          text = "A letter came from Stormwind. They want me back for a vote. I used it to start this morning's fire. It burned beautifully." },
        { id = "h_hemet", when = { heardLine = "nesingwary.h_default" }, text = "Hemet told you about the hunting? He tells everyone. It's the only story he knows, and he tells it better every time." },
      },
      choices = {
        { text = "Why did you leave the House of Nobles?", next = "nobles" },
        { text = "I'll hunt panthers.", next = "END", fx = { affinity = 2 } },
      },
    },
    nobles = {
      big = true,
      lines = {
        { id = "n_default", text = "The stonemasons rebuilt our city, and the nobles refused to pay them. I sat in that hall and watched it happen. I said nothing. What came of it is in Westfall now, wearing red masks. I won't sit in that hall again." },
      },
      choices = {
        { text = "You can't undo it.", next = "END", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Leaving was honest.", next = "END", fx = { affinity = 3, align = { honor = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Cheated men, turned thieves. I'd hang the thieves. I'd want the cheats hanged first." } },
    _none = { { id = "tp_none", text = "I've no opinion on it. I've given up having opinions in public. They cost too much." } },
  },
}
