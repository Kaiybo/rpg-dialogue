-- Captain Thalo'thas Brightsun of the Thalo'dan Privateers, at Ratchet's docks. Voice: bibles/thalothas.md
-- A high elf captain with no flag but his own, who sails for Ratchet's trade and holds a grudge against Northwatch Hold.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thalothas", id = TODO_NPC("Captain Thalo'thas Brightsun"), name = "Captain Thalo'thas Brightsun",
  bible = "bibles/thalothas.md", role = "noble", tier = "quest",
  temper = { "dry" }, values = { "proud", "loyal" },
  notices = { "race", "travel" },
  impression = {
    first = "Captain Thalo'thas Brightsun is a high elf who commands the Thalo'dan Privateers out of Ratchet. He is courteous to everyone and forgiving of no one at Northwatch Hold, whose guns sank his ship.",
    third = "{name} met Captain Thalo'thas Brightsun in Ratchet, the high elf privateer whose ship was sunk by the guns of Northwatch Hold.",
  },

  greetings = {
    { id = "g_dock", text = "Mind the ropes, friend. My crew coils them as if their lives depend on it, and on a ship they do." },
    { id = "g_guns", when = { questActive = TODO_QUEST("The Guns of Northwatch") }, text = "Northwatch Hold, south along the coast. Their marines first, and then they'll think twice before firing on a privateer." },
    { id = "g_firebough", when = { questDone = TODO_QUEST("Free From the Hold") }, text = "Gilthares is still telling the story of his rescue, and it improves every night. You come out of it very well." },
    { id = "g_away", when = { away = 14 }, text = "Back from {away} ashore? The sea doesn't change, but Ratchet does, and usually for the louder." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry yourself like a seasoned hand now. I'd sign you on, if you could stand the smell of tar." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The docks say you were caught in a lie. A privateer lives on his word, friend, so I'd mend that one quickly." },
  },

  notice = {
    { id = "n_ally", cat = "race", when = { race = { "Human", "NightElf" } },
      text = "You'll forgive me if I look twice. My people and yours were allies once, and some days I miss it more than I let my crew see." },
    { id = "n_travel", cat = "travel", when = { mounted = true },
      text = "You'll want to leave that beast on the pier, friend. The planks are older than they look, and so am I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Captain Thalo'thas Brightsun, of the Thalo'dan Privateers. We sail for Ratchet and the Steamwheedle trade, and for no king, which suits a crew of exiles very well." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Guns of Northwatch"), faction = "Horde" },
          text = "The soldiers at Northwatch Hold fired on my ships without warning or cause, and they sank one with all hands, or so I thought. If the Horde has a quarrel with Theramore's zealots, then it has a friend in me." },
        { id = "h_guns_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Guns of Northwatch"), days = 3 } },
          text = "Northwatch's marines are fewer by your hand, and my crew raised a cup to you last night. The guns are still there, but the men behind them are thinking harder." },
        { id = "h_firebough_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Free From the Hold"), days = 3 } },
          text = "And to think we believed Firebough long dead! You have earned a place of honor with the Thalo'dan Privateers, and I don't say that lightly." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance colors in Ratchet. Peace, friend, I bear you no ill will, though I'll not pretend Theramore's soldiers have earned much of mine." },
      },
      again = {
        { id = "h_again", text = "Something more? The tide's not for an hour." },
        { id = "h_again2", text = "Go on, friend. I've time between cargoes." },
      },
      choices = {
        { text = "What happened with Northwatch Hold?", next = "northwatch" },
        { text = "A high elf captain in a goblin port is a strange sight.", next = "exile" },
        { text = "Who are the Thalo'dan Privateers?", next = "crew" },
        { text = "Northwatch answers to Theramore. I'm Alliance.", next = "alliance", when = { faction = "Alliance" } },
        { text = "What is it you need?", next = "BUSINESS" },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },
    northwatch = {
      lines = { { id = "n_default", text = "We were running a cargo between Ratchet and Booty Bay, nothing more dangerous than moonshine, when Northwatch's guns opened on us from the cliffs. They called us a threat to the Alliance, which would be funny if I hadn't lost a ship and a crew." } },
      choices = {
        { text = "Why would they fire on a trade ship?", next = "why" },
        { text = "I'd guess no one survived.", next = "firebough" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because some of Theramore's soldiers came to Kalimdor to fight orcs and were told to keep the peace instead. A ship that sails out of a Horde-friendly port looks like an enemy to men who are itching for one." } },
      choices = {
        { text = "So it was spite, not orders?", next = "why_end" },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    why_end = {
      big = true,
      lines = { { id = "we_default", text = "I don't know, friend, and I've stopped caring which. A sunk ship is a sunk ship, and someone will answer for it, whether by order of Lady Proudmoore or in spite of her." } },
      choices = {
        { text = "Then they'll answer for it. I'll see to it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Take it to Theramore's lady. Let her judge them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    firebough = {
      lines = {
        { id = "f_default", text = "One deckhand, Gilthares Firebough, or so I hope, because there were rumors of a prisoner in the hold's cells. If he lives, he's spent every day since in an Alliance cell for the crime of hauling barrels." },
        { id = "f_done", when = { questDone = TODO_QUEST("Free From the Hold") }, text = "Gilthares Firebough, and he's alive thanks to you. He hauls barrels for me again now, and he whistles while he does it, which I'll allow." },
      },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    exile = {
      lines = { { id = "e_default", text = "Where else would I be, friend? Quel'Thalas burned in the war, and the elves who are left either cling to the Alliance or go their own way. I chose a deck and a crew, and a goblin's coin spends as well as a king's." } },
      choices = {
        { text = "You must miss your homeland.", next = "home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "h2_default", text = "Every dawn, when the light comes over the water and turns it gold. Then the crew starts shouting and I remember I have work to do, which is the best cure I've found." } },
      choices = {
        { text = "The sea's a fair home, too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew = {
      lines = { { id = "c_default", text = "Elves without a kingdom, humans who don't care for Theramore, a goblin navigator who cheats at cards. We're loyal to each other and to the ship, and to the Cartel's coin when it pays well." } },
      choices = {
        { text = "That sounds like a good crew.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "Then you'll forgive me if I don't ask you to sail against them, friend. I'll not hold Northwatch's guns against everyone who wears the same tabard, but I'll not pretend they didn't sink my ship, either." } },
      choices = {
        { text = "Some of our soldiers forget whose peace they keep.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A ship from a Horde port takes its chances.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A captain of Quel'Thalas, once, and a captain of nothing but my ship now. That's more freedom than most elves have these days." } },
    advice = { { id = "tp_ad", text = "Never sail past a fort you haven't spoken to. Learn from my mistake, friend." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel keeps Ratchet open to anyone who pays, and that makes it the only harbor on this coast where an elf captain can tie up without a flag." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond what a sea captain hears, friend. Try the goblins; they hear everything and sell half of it." } },
  },
}
