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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Precious little, and most of it out of date by the time a druid remembers to tell me. You've come from the human lands more recently than I have, I'd wager, so what do you make of Stormwind these days, with the King gone?" },
      },
      choices = {
        { text = "Bolvar holds it together. He's a good man.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { bolvar = "trust" } } },
        { text = "Something's rotten at court. Lady Prestor sits too close.", next = "op_r2", fx = { trait = { skeptical = 1 }, opinion = { prestor = "distrust" } } },
        { text = "The nobles let Westfall starve and cheated the stonemasons.", next = "op_r3", fx = { align = { honor = -1 }, opinion = { stormwind = "distrust", defias = "pity" } } },
        { text = "The King's gone, and nobody's looking hard enough.", next = "op_r4", fx = { trait = { brave = 1 }, opinion = { varian = "missing" } } },
        { text = "I've been away too long to say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Fordragon? Good. I read his name in the old war rolls, and I hoped he'd grow into the job." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Prestor? The name means nothing to me, which is either reassuring or very worrying, given how much I read." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Ah, the old trouble. Cities always forget who built them, and the builders never forget being forgotten." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "A king who walks out of the world usually walks into a story. I'll keep an eye on the shelves for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "o_twilights_hammer_dangerous", tags = { "news" }, when = { gossip = { topic = "twilights_hammer", stance = "dangerous" } },
          text = "Rabine says you think the Twilight's Hammer answers to someone. Good instinct; I've three shelves on old cults, and not one of them ends well." },
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
        { text = "How much news reaches you from the human kingdoms?", next = "op_ask" },
        { text = "How did a human end up here?", next = "human" },
        { text = "Your archive must hold a great deal.", next = "archive" },
        { text = "Something must have been sealed inside that chitin.", next = "journal", when = { questDone = TODO_QUEST("Under the Chitin Was...") } },
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
        { text = "I'd guess you read things you shouldn't.", next = "human_read" },
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
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "Oh, now there's a subject! Ancient walls in Silithus and a war the druids won't discuss, and a library card that only goes so far. I'm working on it, slowly." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Emerald Dream is fascinating, and the druids won't let me anywhere near it. I've read everything they'll let me read about it, and some things they won't." } },
    dalaran = { { id = "tp_dalaran", text = "I studied near Dalaran once, a long time ago, before the walls went up. They're rebuilding now, I'm told, and slowly, as wizards do everything." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor have marvellous libraries and terrible lending policies. I preferred the druids, who simply don't have a policy." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children are mentioned in every druidic text and explained in none of them. I've filled three notebooks with questions and no answers." } },
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
        { text = "Your sister seems to enjoy the festival rather loudly.", next = "fariel" },
        { text = "Whom do you honour, Valadar?", next = "own_elder" },
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
        { text = "These elders must be scattered far and wide.", next = "elders" },
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
    fariel = {
      lines = {
        { id = "fa_default", text = "She does, and Elune bless her for it, because left to me the festival would be very solemn and very quiet and nobody would come back the next year. Fariel lights the sky, and I try to make sure people remember why it's lit." },
      },
      choices = {
        { text = "Do the two of you ever disagree?", next = "fariel_disagree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fariel_disagree = {
      big = true,
      lines = {
        { id = "fd_default", text = "About Omen, every year. She says Elune's blessing is a kindness and we're helping him rest, and I lie awake wondering whether we only keep him from it. Which of us do you think has the right of it?" },
      },
      choices = {
        { text = "Fariel does. Elune's blessing is a kindness.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You do. Some things should be allowed to end.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    own_elder = {
      lines = {
        { id = "oe_default", text = "Our grandmother, who kept this festival before Fariel and I were old enough to carry the cakes. She remembered the world before the Sundering, or claimed she did, and she told us that the ones we honour are only truly gone when nobody says their names." },
      },
      choices = {
        { text = "And who do you think I should honour?", next = "own_elder_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    own_elder_ask = {
      big = true,
      lines = {
        { id = "oea_default", text = "That's for you to say, not me, but I'll ask you this: is there someone who taught you something you still use every day? Most people find their elder in that question, even if they've never thought of them that way." },
        { id = "oea_scourge", when = { race = "Scourge" }, text = "That's for you to say, friend, and I know the question may be harder for you than for most. Is there someone from your first life whose lessons you still carry? The festival welcomes that memory as gladly as any other." },
      },
      choices = {
        { text = "There is. I'll speak their name tonight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've no use for the past. I look ahead.", next = "BACK", fx = { align = { light = -1 } } },
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
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire is all well and good, but our festival has better cakes and fewer goblins. Fariel would want me to say that, and it's also true." } },
    elune = { { id = "tp_elune", text = "Elune's moon shines brightest during the Lunar Festival, and every elder in the world comes to see it. It's the best night of the year, and the busiest." } },
    cairne = {
      { id = "tp_cairne", text = "I've had tauren elders come for the festival who've known Cairne Bloodhoof since he was a calf. The stories they tell would curl your ears." },
      { id = "tp_cairne2", when = { race = "Tauren" }, text = "Your Cairne sends an elder every year, and the old bull always eats the most cakes. Tell Cairne we'd be delighted to see him in person." },
    },
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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Faustron and I share a field and a water trough, and we have never come to blows, which not everyone outside the glade would believe. What do you make of the Horde?" },
      },
      choices = {
        { text = "A threat. Moonglade's truce is the exception.", next = "op_r1", fx = { align = { honor = -1 }, trait = { cautious = 1 }, opinion = { horde = "enemy" } } },
        { text = "People like us, mostly. Their leaders want peace.", next = "op_r2", fx = { affinity = 1, align = { honor = 1 }, opinion = { horde = "respect" } } },
        { text = "I am the Horde, and I'm standing politely in your field.", next = "op_r3", fx = { affinity = 1, trait = { witty = 1 }, opinion = { horde = "proud" } }, when = { faction = "Horde" } },
        { text = "I'd rather not say here.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "It is an exception, and I treasure it all the more for that. I've seen what the threat looks like in Ashenvale too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Thrall wants it, I think. I'm less sure about the ones he sends to Ashenvale." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "So you are, and I am standing politely in mine. It's a good start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "o_night_elves_distrust", tags = { "news" }, when = { gossip = { topic = "night_elves", stance = "distrust" } },
          text = "Faustron tells me you've no love for my people. My birds will carry you all the same, because they have no politics." },
        { id = "h_default", key = true, text = "I fly the Alliance out of Moonglade, to the north and south and back to Rut'theran beneath the great tree. The druids have their own birds, but mine will carry anyone who asks politely, as my people always have." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You could fly with Silva, you know, on the Circle's own birds. But you're welcome to mine, and they'll be pleased you chose them." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "My birds won't carry you, I'm afraid; your wind riders are across the glade with Faustron. But you're welcome to stand and talk, since nobody draws a blade in Moonglade." },
      },
      again = {
        { id = "h_again", text = "Anything else, before you fly? Elune's light will guide the bird, so you need only hold on." },
        { id = "h_again2", text = "Ask, if you like. The birds won't mind waiting a little longer." },
      },
      choices = {
        { text = "What do you make of the Horde, sharing this field?", next = "op_ask" },
        { text = "Show me where I can fly.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Why keep your birds out here, away from the village?", next = "edge" },
        { text = "Where do your birds fly from here?", next = "routes" },
        { text = "Horde and Alliance seem to share this place.", next = "peace" },
        { text = "Do you ever speak with the wind rider master?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Our shan'do sleeps beneath this glade, doesn't he?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Would your birds mind my companion?", next = "xpet", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    edge = {
      lines = {
        { id = "e_default", text = "Because the druids like their quiet, and hippogryphs are noisy, whatever the songs say. From here the birds can see the lake, and that keeps them calm." },
      },
      choices = {
        { text = "Why should the lake calm them?", next = "edge_lake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge_lake = {
      lines = {
        { id = "el_default", text = "Hippogryphs were the Mother Moon's creatures before they were ever ours, or so the priestesses say, and they settle wherever her light lies on still water. When I first came here I kept them by the road, and they screamed all night and plucked their own feathers." },
        { id = "el_night", when = { timeOfDay = "night" }, text = "Look at them now, with the moon on Elune'ara, and you'll see what I mean. They're quiet as cats, every one of them." },
      },
      choices = {
        { text = "They're lucky to have someone who listens to them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes = {
      lines = {
        { id = "r_default", text = "South over Felwood to Talonbranch Glade, north to Everlook in Winterspring, and west across the water to Rut'theran, at the foot of Teldrassil. Every one of those flights crosses something the birds dislike, and Felwood is the worst of them." },
      },
      choices = {
        { text = "What troubles them about Felwood?", next = "routes_felwood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_felwood = {
      lines = {
        { id = "rf_default", text = "The smell, first, because the whole forest reeks of fel and rot from above, and then the things that fly up out of the trees. I lost a young bird there last spring to something that came out of Jaedenar, and the rider walked the rest of the way to Talonbranch." },
      },
      choices = {
        { text = "Then the corruption there has to be burned out.", next = "routes_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_stance = {
      big = true,
      lines = {
        { id = "rs_default", text = "Burned, or healed? The druids would say healed, and they'd say it slowly, over a hundred years. I only know that I'd like my birds to cross that forest without their feathers standing on end, and I'm not patient enough to wait a century for it." },
      },
      choices = {
        { text = "Heal it, however long it takes. Burning only spreads the ruin.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn out the worst of it. Some things can't be saved.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "xh_default", text = "Now and then, when a wind rider and a hippogryph decide to quarrel over the same patch of sky. Faustron is a courteous orc, more courteous than I expected, and he keeps his beasts on his side of the glade as carefully as I keep mine." },
      },
      choices = {
        { text = "It's strange, hearing an elf speak kindly of an orc.", next = "xhorde_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde_stance = {
      big = true,
      lines = {
        { id = "xhs_default", text = "Here it's easy, because the Keeper makes it easy. In Ashenvale I'd have put an arrow in him and he'd have put an axe in me, and I don't know which of those two is the truer version of us. Do you?" },
      },
      choices = {
        { text = "This one is. The war is what's false.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ashenvale is the truth. This glade is a pause.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      big = true,
      lines = {
        { id = "xn_default", text = "In the Barrow Dens by the lake, asleep and walking the Emerald Dream, as the druids do. I fly over that hill every day and I still lower my voice when I pass it, which is foolish, but I can't help it. Do you ever wish he'd wake?" },
      },
      choices = {
        { text = "His work in the Dream matters. Let him sleep.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We need him awake. Our people are struggling without him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpet = {
      lines = {
        { id = "xp_default", text = "Not if it's polite, and most hunters' beasts are better mannered than their masters. Keep it from stalking the young ones, though, because a hippogryph that thinks it's being hunted will try to fly with the saddle half buckled." },
        { id = "xp_cat", when = { pet = { family = "Cat" } }, text = "Oh, a cat. Keep {pet} close to you, please, and well away from the roost. The birds remember nightsabers, and not fondly." },
      },
      choices = {
        { text = "I'll keep it close.", next = "BACK" },
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
    nordrassil = { { id = "tp_nordrassil", text = "My birds hatched on Hyjal, and they squabble less when the wind blows from the north. I think they're homesick." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw throw rocks at my birds when they fly too low. I've stopped arguing with the furbolgs and started flying higher." } },
    theramore = { { id = "tp_theramore", text = "Theramore's a long flight south, and my birds don't love the marsh air. I'll send you if you insist, but bring them something nice." } },
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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "I fly my wyverns beside elf hippogryphs here and nobody draws steel, and out in Ashenvale those same elves shoot at my riders. Tell me, what do you think of the kaldorei?" },
      },
      choices = {
        { text = "Proud tree-huggers. They'd see the Horde starve.", next = "op_r1", fx = { align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Brave folk defending their home. I respect that.", next = "op_r2", fx = { affinity = 1, align = { honor = 1 }, opinion = { night_elves = "respect" } } },
        { text = "We are not your enemy, flight master. The Warsong are.", next = "op_r3", fx = { trait = { brave = 1 }, opinion = { night_elves = "proud", warsong = "hate" } }, when = { race = "NightElf" } },
        { text = "I've no quarrel to air here.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Some of them would, I'll grant you. The ones here feed my wyverns when I'm late, though, so I can't hate the lot of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Respect's the right word. The Warchief said the same of them after Hyjal, and he was there to see it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Maybe so, elf. I don't cut trees, I fly wyverns, and the sky's wide enough for both of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "o_horde_enemy", tags = { "news" }, when = { gossip = { topic = "horde", stance = "enemy" } },
          text = "Sindrayl says you call us a threat. I'll fly you anyway, friend, since gold is the same colour on both sides of a war." },
        { id = "h_default", key = true, text = "I fly the Horde out of Moonglade, and I keep my wind riders on this side of the glade where they won't bother the night elves. It's a strange post for an orc who has known the blood of war, but the Keeper's peace holds, and there's honor in keeping it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid can fly with Bunthen on the Circle's birds, but my wind riders will carry you just the same, and they're faster, whatever he tells you." },
      },
      again = {
        { id = "h_again", text = "Anything else, before you go? Speak plainly; I'm an orc, not a druid." },
        { id = "h_again2", text = "Ask, then. The beasts aren't going anywhere without me." },
      },
      choices = {
        { text = "How do you get on with the kaldorei here?", next = "op_ask" },
        { text = "Show me where I can fly.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How does an orc fare in Moonglade?", next = "orc" },
        { text = "The Keeper's truce seems to hold.", next = "truce" },
        { text = "Where do your wind riders fly from here?", next = "routes" },
        { text = "How do the beasts take to this place?", next = "beasts" },
        { text = "The Earth Mother's children are at home here.", next = "xtauren", when = { race = "Tauren" } },
        { text = "I'm Alliance. Will you still talk to me?", next = "xalliance", when = { faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    orc = {
      lines = {
        { id = "o_default", text = "Quietly, which suits me. The night elves look at me as if they're remembering Ashenvale, and maybe they are, but no one here has raised a hand, and I've given them no reason to." },
      },
      choices = {
        { text = "Ashenvale? You mean the Warsong's logging camps.", next = "orc_ashenvale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_ashenvale = {
      lines = {
        { id = "oa_default", text = "I do. The Horde needs timber, and the forest is full of it, and the elves say every tree is sacred, so somebody bleeds every week at Splintertree. I understand both sides better than I'd like, which is likely why the Warchief sent me here and not there." },
      },
      choices = {
        { text = "So who's in the right, the Warsong or the elves?", next = "orc_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_stance = {
      big = true,
      lines = {
        { id = "os_default", text = "That's a question I don't answer on elf ground. I'll tell you what I think of whoever's asking, though, by what they say next, so go on and say it." },
        { id = "os_alliance", when = { faction = "Alliance" }, text = "You're asking an orc that, in a glade full of druids? You have nerve, I'll give you that, so say what you think and I'll judge you by it." },
      },
      choices = {
        { text = "A people has to live. The Horde needs that timber.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's their forest. The Horde should find another way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes = {
      lines = {
        { id = "r_default", text = "South to Bloodvenom Post in Felwood, where the Horde holds a camp among the poison, and north to Everlook, where the goblins sell to anyone with coin. Past those it's a long way home to Orgrimmar or the Bluff, and the beasts know every mile of it." },
      },
      choices = {
        { text = "What's it like flying over Felwood?", next = "routes_felwood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_felwood = {
      lines = {
        { id = "rf_default", text = "Like flying over a wound that's gone bad. The riders keep high so the beasts don't breathe it, and when they land at Bloodvenom they want water and a good long rest, and I don't blame them, because I've smelled that forest myself." },
        { id = "rf_lock", when = { class = "WARLOCK" }, text = "You'd know the stink better than I would, warlock, since it's the same green fire your sort plays with. Burned into the trees by the Legion, the druids say, and it hasn't let go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "Badly, at first, because a wind rider likes hot rock and open sky, and Moonglade is all wet grass and quiet. They sulk in the rain and squabble with the hippogryphs across the glade, and I spend my mornings scraping up what they leave behind." },
      },
      choices = {
        { text = "Squabble? Over what?", next = "beasts_sky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_sky = {
      lines = {
        { id = "bs_default", text = "Sky, mostly. A wind rider thinks every bit of air belongs to it, and so does a hippogryph, so Sindrayl and I have an arrangement about who takes off when. She's a fair elf, and she keeps to it better than some orcs I've served with." },
      },
      choices = {
        { text = "An orc and an elf with an arrangement. Good.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "You are, and I'm glad of it, because the druids here look at a tauren and see one of their own. When they look at me they see an axe, so I stand near Bunthen when I can and let some of his welcome rub off." },
      },
      choices = {
        { text = "You're welcome here too, Faustron. Earn it and they'll see.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalliance = {
      big = true,
      lines = {
        { id = "xa_default", text = "On this ground I will, and civilly, because the Keeper asks it and I keep my word. I won't fly you anywhere, and I won't pretend I'd greet you like this in Ashenvale, but here we're just two travellers far from home." },
      },
      choices = {
        { text = "That's honest. I'll be civil in return.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Civility's easy when an ancient's watching. It means little.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "th_default", text = "Some days it is. Then I remember the mountain, where orc and elf fought the Legion side by side, and I think that if we could do it then, I can do it here." },
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
    advice = { { id = "tp_ad", text = "Don't spit on the grass in Moonglade, because the druids notice, and they remember it longer than you'd think." } },
    thrall = { { id = "tp_thrall", text = "The Warchief needs a wind rider master here, so I'm here. I mind my manners among the elves, because he'd want me to." } },
    cairne = { { id = "tp_cairne", text = "Cairne's people come through often for the Circle, and they're good riders. They're also heavy, and my wind riders complain." } },
    tyrande = { { id = "tp_tyrande", text = "The elves' high priestess, the one whose Sentinels fight our people in Ashenvale. Here in the glade I keep my mouth shut about her, and I'd advise you to do the same." } },
    centaur = { { id = "tp_centaur", text = "Centaur are a menace in the Barrens, and my riders have dropped a few rocks on them. I'm not sorry." } },
    _none = { { id = "tp_none", text = "Don't know. Ask one of the druids, if they'll talk to you; I'd rather face a charge than one of their riddles." } },
  },
}
