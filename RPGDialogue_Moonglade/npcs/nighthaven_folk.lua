-- More of Nighthaven: Umber the archivist, Valadar Starsong of the Lunar Festival,
-- and the two flight masters on the village's edges. Voices: bibles/umber.md, bibles/valadar.md,
-- bibles/sindrayl.md, bibles/faustron.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Umber, the Cenarion Circle's archivist
---------------------------------------------------------------------------
P:NPC {
  key = "umber", id = TODO_NPC("Umber"), name = "Umber",
  bible = "bibles/umber.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "chatty", "cheerful" }, values = { "curious", "craft" },
  notices = { "weary", "race" },

  impression = {
    first = "Umber is the Cenarion Circle's archivist, a human among druids, who loses a book every few minutes and finds two others while looking. The druids call him brilliant, and he agrees with them.",
    third = "{name} met Umber, the scatterbrained and brilliant human archivist of the Cenarion Circle in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Now where did I put that companion document? Oh, hello!" },
    { id = "g_shelves", text = "So many bookshelves, and so little time. Can I help you, or can you help me?" },
    { id = "g_chitin", when = { questActive = TODO_QUEST("Uncovering Past Secrets") }, text = "The chitin's coming along, slowly. Go and see the den mother, and come back to me later." },
    { id = "g_book", when = { questDone = TODO_QUEST("Under the Chitin Was...") }, text = "Still reading it! Still reading it, and it's still marvelous." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, have you? I hadn't noticed, but then I hadn't noticed I'd lost my quill either." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You look much more formidable than you did. Has someone been writing you a better chapter?" },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The druids have been saying nice things about you, which is rare; they mostly say nice things about trees." },
  },

  notice = {
    { id = "n_ripe", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Let me be a little honest with you, friend: you smell rather ripe, as if you've come straight in from the field. No offense meant, only you may want to freshen up before you meet the den mother." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human! There are so few of us in Moonglade that I sometimes forget what we look like. We look tired, mostly, don't we?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "If you want something the Cenarion Circle has archived, then I'm the one to talk to, though you'll need to know what you're looking for before I can help you find it. See how that works? Brilliant!" },
        { id = "h_layo", tags = { "news" }, when = { questActive = TODO_QUEST("Umber, Archivist") },
          text = "Well, great monkey toads, what have you got there? It's sort of book-shaped, under all that crust. Layo sent you all the way from Silithus? I've only heard hushed rumblings about what's going on out there, and I don't care for anything bug-like, so I'll stay here with the books." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Uncovering Past Secrets") },
          text = "I'm still working on that shell, and it's tougher than it looks. Go and check in with Rabine, our den mother, and never keep him waiting, unless you want to be doused in honey." },
        { id = "h_journal", tags = { "news" }, when = { questRecent = { TODO_QUEST("Under the Chitin Was..."), days = 3 } },
          text = "It's you again! I mean you, the one who found it. Let me start over: that thing from Silithus was a book, a journal written in a very old dialect of Darnassian, and it's going to take me ages, and I'm delighted." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf who isn't a druid, or perhaps you are, I can never tell until you turn into something. Either way, welcome to the archive, such as it is." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, before I forget what we were talking about." },
        { id = "h_again2", text = "Go on, go on. I'm listening, mostly." },
      },
      choices = {
        { text = "How did a human end up here?", next = "human" },
        { text = "What do you keep in the archive?", next = "archive" },
        { text = "What was in the chitin?", next = "journal", when = { questDone = TODO_QUEST("Under the Chitin Was...") } },
        { text = "Why call Rabine the den mother?", next = "rabine" },
        { text = "Could a mage help you with the old dialect?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },
    human = {
      lines = {
        { id = "hu_default", text = "I asked very nicely, and then I kept asking, and eventually the druids found it easier to let me in than to keep explaining why not. It turns out they have a great many books and nobody who enjoys looking after them." },
      },
      choices = {
        { text = "They trust you with their secrets?", next = "human_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_trust = {
      lines = {
        { id = "ht_default", text = "They trust me with their filing, which is nearly the same thing. A secret's no use to anyone if it's on the wrong shelf, and most of theirs were on the wrong shelf when I arrived." },
      },
      choices = {
        { text = "Do you ever read things you shouldn't?", next = "human_read" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_read = {
      big = true,
      lines = {
        { id = "hr_default", text = "All the time, it's the best part of the job! Though I'll admit some of the older writings here are things I'd rather not have read, and I put them back very carefully afterward." },
      },
      choices = {
        { text = "Knowledge should be read, whatever it holds.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some books are best left closed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    archive = {
      lines = {
        { id = "a_default", text = "Histories of the Circle, records of the barrow dens, old notes on every grove from here to Feralas, and a book by a goblin on gnomish military victories in which every page is blank. That last one I keep for the joke." },
      },
      choices = {
        { text = "Who else helps you keep it?", next = "dewey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dewey = {
      lines = {
        { id = "d_default", text = "Nobody, really, though I keep meaning to talk to Dewey about a proper system of notation, so these books are kept in better order. Dewey will think it's a terrible idea, which is how I know it's a good one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    journal = {
      lines = {
        { id = "j_default", text = "A journal, in a very ancient form of Darnassian, sealed inside the chitin as if something had grown over it. I'm going through it line by line, and what you found is extremely valuable to the Circle." },
      },
      choices = {
        { text = "What does it say so far?", next = "journal_say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journal_say = {
      lines = {
        { id = "js_default", text = "So far, mostly grammar, and complaints about sand, which suggests whoever wrote it was in Silithus a very long time ago. When I know more, the Circle will know more, and I promise I'll not lose it before then." },
      },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rabine = {
      lines = {
        { id = "r_default", text = "Because this village is a little bear camp, and Rabine keeps us all fed and in line and out of the Keeper's way. He doesn't seem to mind the name, or if he does, he's too polite to say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "A mage, reading Darnassian older than Darnassus? The druids would be horrified, and I'd love to see their faces. But no, thank you; I'd like to puzzle it out myself, slowly, with a great deal of tea." },
      },
      choices = {
        { text = "Then enjoy the tea, and the puzzle.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A human with a library card the druids never meant to give him. That's all of my story worth filing." } },
    advice = { { id = "tp_ad", text = "Always put a book back where you found it. Do as I say, you understand, not as I do." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle's very good at trees and rather bad at paperwork, which is where I come in." } },
    silithid = { { id = "tp_sil", text = "Bugs, and big ones, from what Layo writes. I'd rather read about them than meet them, thank you." } },
    _none = { { id = "tp_none", text = "I'm sure I've got a book about that somewhere. Now where did I put it?" } },
  },
}

---------------------------------------------------------------------------
-- Valadar Starsong, host of the Lunar Festival
---------------------------------------------------------------------------
P:NPC {
  key = "valadar", id = TODO_NPC("Valadar Starsong"), name = "Valadar Starsong", title = "Coin of Ancestry Collector",
  bible = "bibles/valadar.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "warm", "calm" }, values = { "devout", "kind" },
  notices = { "race", "level" },

  impression = {
    first = "Valadar Starsong welcomes the whole world to Nighthaven for the Lunar Festival, and he means it. He speaks of honoring elders as if it were the simplest and most important thing anyone could do.",
    third = "{name} met Valadar Starsong, who hosts the Lunar Festival in Nighthaven with his sister Fariel.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Nighthaven, and to the Lunar Festival. Elune's light on you." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Have you honored your elders yet? There's a coin of ancestry waiting with each of them." },
    { id = "g_omen", when = { questActive = TODO_QUEST("Elune's Blessing") }, text = "Omen still stirs under Lake Elune'ara. Gather your friends before you wake him." },
    { id = "g_blessed", when = { questDone = TODO_QUEST("Elune's Blessing") }, text = "You carry Elune's blessing now. Wear it gladly, and remember the hero it came from." },
    { id = "g_away", when = { away = 14 }, text = "You've come back to us after {away}. Nighthaven is glad of you, and Elune's light has kept your place by the lake." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since last we spoke, and your elders would be proud of it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The tauren honor their ancestors every day, not only at festival. You'll find the elders' coins come easily to you, I think." },
    { id = "n_young", cat = "level", when = { maxLevel = 30 },
      text = "You're young to have made the journey, and the elders will be glad of it. They like being visited by people who still have a great deal to learn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Valadar Starsong, and with my sister Fariel I welcome all who come to Nighthaven for the Lunar Festival. Our village is quiet and set apart for most of the year, but for this celebration we open our arms to everyone." },
        { id = "h_arrived", tags = { "news" }, when = { questRecent = { TODO_QUEST("Valadar Starsong"), days = 2 } },
          text = "You came through the moonlight with your invitation, as so many have. Enjoy your visit, and speak with me or with Fariel whenever you're ready." },
        { id = "h_omen_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Elune's Blessing"), days = 3 } },
          text = "Very well done. Omen's spirit has gone back to the waters of Elune'ara, and his anger will rest for another year; it's a victory for you, and a peace for him." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde and Alliance both come to the festival, and for these few days I ask only that you leave the war at the edge of the glade. Moonglade has always been neutral ground." },
      },
      again = {
        { id = "h_again", text = "What else would you know of the festival? It honours elders whose memories reach back further than most kingdoms." },
        { id = "h_again2", text = "Ask what you like. This is a time for talking." },
      },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Who is Omen?", next = "omen" },
        { text = "What are the coins of ancestry for?", next = "coins" },
        { text = "How do I summon Omen?", next = "summon", when = { minLevel = 55 } },
        { text = "My people honor the ancestors every day.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Elune's light on you, Valadar.", next = "END" },
      },
    },
    festival = {
      lines = {
        { id = "f_default", text = "A celebration of the new year and of the people who came before us. We honor our elders, and we light the sky so the ancestors can see we haven't forgotten them." },
      },
      choices = {
        { text = "Why hold it in Moonglade?", next = "festival_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival_why = {
      lines = {
        { id = "fw_default", text = "Because Moonglade belongs to no one side, and because this is where the old hero Omen was finally laid to rest. A festival for remembering ought to be held where there's something worth remembering." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    omen = {
      lines = {
        { id = "o_default", text = "Omen was a hero once, a wolf of great strength and luck who fought beside the defenders in the War of the Ancients. Demonic magic turned him against his allies, and he ran across the world spreading death until he was brought down here, in Moonglade." },
      },
      choices = {
        { text = "And now?", next = "omen_now", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    omen_now = {
      lines = {
        { id = "on_default", text = "He sleeps in the silt at the bottom of Lake Elune'ara, and every new year, during the festival, he stirs. Elune has blessed him, so he cannot die for good, and his rage has to be quieted again and again." },
      },
      choices = {
        { text = "Is that mercy, or a curse?", next = "omen_mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    omen_mercy = {
      big = true,
      lines = {
        { id = "om_default", text = "I have asked myself that every year since I was a boy. I've come to believe that each time we quiet him we give him a little peace, but I would not argue long with someone who thought otherwise." },
      },
      choices = {
        { text = "It's mercy. Every year, a little more peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's cruelty. He should be allowed to die.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins = {
      lines = {
        { id = "c_default", text = "To honor your elders is to honor your culture and your people, and the coins are a way of marking it. Visit the elders who rest across the world, and each will give you a coin of ancestry; bring them to me, and I'll reward your diligence." },
      },
      choices = {
        { text = "Where are these elders?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = {
        { id = "e_default", text = "Everywhere, in cities and in the wilds, at the places they loved best in life. Some are easy to find and some will take you halfway across the world, which is rather the point." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    summon = {
      lines = {
        { id = "s_default", text = "Go to the southeast banks of Lake Elune'ara, near the Stormrage Barrow Dens, where you'll find the launchers. Fire your rockets there, or Elune's candles, and Omen's minions will come; keep firing, and soon he'll wake himself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "Then you already know what this festival is for, better than many of my own people do. The elders here will be glad of you, and you of them." },
      },
      choices = {
        { text = "The Earth Mother keeps them all.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Fariel and I have kept the festival for longer than I'd like to admit. Every year I swear we'll bake fewer cakes, and every year Fariel bakes more." } },
    advice = { { id = "tp_ad", text = "Visit your elders while they're there to be visited. A coin is a poor substitute for a conversation." } },
    _none = { { id = "tp_none", text = "I'm afraid I think of little but the festival at this time of year. Ask Rabine; he keeps the rest of Nighthaven." } },
  },
}

---------------------------------------------------------------------------
-- Sindrayl, Hippogryph Master
---------------------------------------------------------------------------
P:NPC {
  key = "sindrayl", id = TODO_NPC("Sindrayl"), name = "Sindrayl", title = "Hippogryph Master",
  bible = "bibles/sindrayl.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "calm" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Sindrayl keeps the Alliance's hippogryphs at the edge of Moonglade, where the birds can see the lake. She treats the glade's peace like something fragile she has been asked to carry.",
    third = "{name} met Sindrayl, the hippogryph master who flies the Alliance out of Moonglade.",
  },

  greetings = {
    { id = "g_default", text = "Where would you like to fly? The birds are rested." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A night flight? The moon on the lake will light your way out." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}. The birds remembered you before I did." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Shan'do Stormrage sleeps beneath this glade, and you walk lighter for knowing it, I think. Most of our people do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I fly the Alliance out of Moonglade, to the north and south and back to Rut'theran beneath the great tree. The druids have their own birds, but mine will carry anyone who asks politely, as my people always have." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You could fly with Silva, you know, on the Circle's own birds. But you're welcome to mine, and they'll be pleased you chose them." },
      },
      again = { { id = "h_again", text = "Anything else, before you fly? Elune's light will guide the bird, so you need only hold on." } },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why keep your birds out here, away from the village?", next = "edge" },
        { text = "Do Horde and Alliance really share this place?", next = "peace" },
        { text = "Farewell.", next = "END" },
      },
    },
    edge = {
      lines = {
        { id = "e_default", text = "Because the druids like their quiet, and hippogryphs are noisy, whatever the songs say. From here the birds can see the lake, and that keeps them calm." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "p_default", text = "They do, and so do I, with the wind rider master on the far side of the glade. Keeper Remulos will not have blood spilled here, and nobody yet has been foolish enough to test him." },
      },
      choices = {
        { text = "Does it trouble you, sharing it?", next = "peace_feel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace_feel = {
      big = true,
      lines = {
        { id = "pf_default", text = "Sometimes, when I think of Ashenvale. But the birds don't care which banner you fly under, and here I try to be more like the birds." },
      },
      choices = {
        { text = "Peace here is worth guarding, whatever the war.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Horde doesn't belong here, truce or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the birds fed, and they keep me up half the night squabbling. There isn't much more to it." } },
    advice = { { id = "tp_ad", text = "Hold on tight over Felwood, and don't look down. The birds don't like what they see there either." } },
    _none = { { id = "tp_none", text = "I only know the birds and the sky, I'm afraid, and the moon that lights them. Ask in the village." } },
  },
}

---------------------------------------------------------------------------
-- Faustron, Wind Rider Master
---------------------------------------------------------------------------
P:NPC {
  key = "faustron", id = TODO_NPC("Faustron"), name = "Faustron", title = "Wind Rider Master",
  bible = "bibles/faustron.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "gruff" }, values = { "dutiful", "practical" },
  notices = { "race" },

  impression = {
    first = "Faustron keeps the Horde's wind riders on the western edge of Moonglade and plainly feels the eyes of the druids on his back. He minds his manners here, and he wants it noticed.",
    third = "{name} met Faustron, the orc wind rider master who flies the Horde out of Moonglade.",
  },

  greetings = {
    { id = "g_default", text = "Need a flight? The wind riders are fed and ready, and they're as eager to leave this quiet as any orc." },
    { id = "g_quiet", text = "Speak softly here. The druids hear everything in this glade." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back again. The beasts remember your smell." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The druids here treat your people well, and I'm glad of it. It makes my welcome a little warmer too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I fly the Horde out of Moonglade, and I keep my wind riders on this side of the glade where they won't bother the night elves. It's a strange post for an orc who has known the blood of war, but the Keeper's peace holds, and there's honor in keeping it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid can fly with Bunthen on the Circle's birds, but my wind riders will carry you just the same, and they're faster, whatever he tells you." },
      },
      again = { { id = "h_again", text = "Anything else, before you go? Speak plainly; I'm an orc, not a druid." } },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "How does an orc fare in Moonglade?", next = "orc" },
        { text = "Do you trust the Keeper's truce?", next = "truce" },
        { text = "Farewell.", next = "END" },
      },
    },
    orc = {
      lines = {
        { id = "o_default", text = "Quietly, which suits me. The night elves look at me as if they're remembering Ashenvale, and maybe they are, but no one here has raised a hand, and I've given them no reason to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    truce = {
      lines = {
        { id = "t_default", text = "I trust that Remulos would end anyone who broke it, which is close enough. On this ground I keep my axe on the wall and my temper in my belly." },
      },
      choices = {
        { text = "Is it hard, keeping peace with them?", next = "truce_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truce_hard = {
      big = true,
      lines = {
        { id = "th_default", text = "Some days. Then I remember the mountain, where orc and elf fought the Legion side by side, and I think that if we could do it then, I can do it here." },
      },
      choices = {
        { text = "That peace is worth keeping. Good.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The night elves would break it if they dared.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A wind rider master, posted in a glade full of elves because the Warchief needs one here. I mind my manners and scrape a lot of droppings." } },
    advice = { { id = "tp_ad", text = "Don't spit on the grass here. They notice." } },
    _none = { { id = "tp_none", text = "Don't know. Ask one of the druids, if they'll talk to you; I'd rather face a charge than one of their riddles." } },
  },
}
