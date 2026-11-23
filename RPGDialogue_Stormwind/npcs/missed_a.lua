-- Stormwind folk the roster scan found missing (part 1 of 3): Mazen's assistant in the library, a
-- boy on the canals, two old soldiers who walk to the Pig and Whistle, the mail and cloth sellers at
-- Lionheart Armory, the staff seller in the Mage Quarter, Miss Danna's three pupils, and the archmage
-- and two door guards of the Champions' Hall. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Acolyte Dellis: upper floor of the Academy library on the canals; Mazen Mac'Nadir's assistant.
P:NPC {
  key = "acolyte_dellis", id = TODO_NPC("Acolyte Dellis"), name = "Acolyte Dellis", gender = "male",
  bible = "bibles/missed_a.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "nervous", "earnest" }, values = { "learning", "order" },
  notices = { "magic", "travel" },
  impression = {
    first = "Acolyte Dellis keeps the upper shelves of the Academy's library, and he handles every book as if it might bruise. He is missing a hat, and he would rather not say where it went.",
    third = "{name} met Acolyte Dellis, who tends the Academy's library for Mazen Mac'Nadir.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Good day to you. Please mind the stack by the stair, because I've only just put it in order." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and nothing's fallen over since you left, which I count as a good day." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "You're a student of the arcane, aren't you? Then you'll know not to open the red folios without asking, which is more than I can say for most visitors." },
    { id = "n_travel", cat = "travel", when = { minLevel = 35 },
      text = "You look as though you've slept outdoors a great deal, and on purpose. I can't think why anyone would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("Mazen's Behest") },
          text = "Master Mazen has sent you after the Essays, hasn't he? I'm sorry, truly, because that book was in my hands and it's my fault it's lying in a swamp." },
        { id = "h_default", text = "I'm Acolyte Dellis, and I look after the Academy's books for Master Mazen. If you want a volume, tell me the title and I'll find it faster than you could read the shelf marks." },
      },
      again = {
        { id = "h_again", text = "Was there another book, or another question?" },
        { id = "h_again2", text = "Go on, but softly, please, because voices carry up here." },
      },
      choices = {
        { text = "What sort of books do you keep here?", next = "books" },
        { text = "You look like a man who's lost his hat.", next = "hat" },
        { text = "What is Mazen like to work for?", next = "mazen" },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Histories of the Guardians, treatises on the ley lines, and a good many copies made from Dalaran's shelves before the city fell. Master Mazen says a library is a kingdom's memory, and I'd like ours to be a long one." } },
      choices = {
        { text = "Could a mage borrow one of those treatises?", next = "borrow", when = { class = "MAGE" } },
        { text = "Do many people come to read them?", next = "readers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    borrow = {
      lines = { { id = "bo_default", text = "You may read anything here at the table, and I'll fetch it for you gladly. Nothing leaves the building any more, though, and you may guess why I'm the one who made that rule." } },
      choices = { { text = "A sensible rule. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    readers = {
      lines = { { id = "r_default", text = "Students from the tower, mostly, and a clerk from the Keep now and then who wants an old treaty. Once a month a dwarf from the Explorers' League comes and argues with the maps, and I rather look forward to him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hat = {
      lines = { { id = "ht_default", text = "It's in the Swamp of Sorrows, along with a book I was meant to carry to Nethergarde Keep. There are plants in that swamp that walk, and one of them took a very personal dislike to me." } },
      choices = {
        { text = "Plants chased you out of a swamp?", next = "plants" },
        { text = "The road east is hard on anyone. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    plants = {
      lines = { { id = "p_default", text = "They did, and I'm not ashamed to say I ran until I reached the Darkshire road. I was made for catalogues and quiet rooms, and I've promised Master Mazen I'll never volunteer for an errand again." } },
      choices = { { text = "Stay with the catalogues, then. Something else.", next = "BACK" } },
    },
    mazen = {
      lines = { { id = "m_default", text = "He's patient, and he forgets where he's put his spectacles four times a day, and he knows more than any three archmages I've met. He forgave me for the Essays before I'd finished confessing, which made me feel a good deal worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the Academy as a boy to learn spells, and found I liked the books better than the casting. Master Mazen took me on, and I've been up these stairs ever since." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid, but if it's written down anywhere, Master Mazen will know which shelf." } },
  },
}

-- Adam: a boy fishing the Canals with his friend Billy.
P:NPC {
  key = "adam_canals", id = TODO_NPC("Adam"), name = "Adam", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "stubborn", "matter-of-fact" }, values = { "truth" },
  notices = { "fishing" },
  impression = {
    first = "Adam fishes the canals beside his friend Billy and doesn't believe a word Billy says. He's the sort of boy who counts things, and he has counted exactly one crab.",
    third = "{name} met Adam, a boy who fishes the Stormwind canals with Billy.",
  },
  greetings = {
    { id = "g_default", text = "Shh, you'll scare them off! Well, there aren't any to scare, but that's what you're supposed to say." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Billy still hasn't caught anything, in case you were wondering." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "You've got a real fishing pole! Tell Billy there aren't any big fish in the canal, because he won't listen to me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Adam, and that's Billy, and he says there's a fish under the bridge as big as a boat. There isn't, because I've looked, and all I ever saw was an old boot." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not busy, the fish aren't biting." },
        { id = "h_again2", text = "You can ask me another one if you like." },
      },
      choices = {
        { text = "Have you ever caught anything?", next = "crab" },
        { text = "Billy says you can't fish.", next = "billy" },
        { text = "Why fish here, if there's nothing to catch?", next = "why" },
        { text = "Good luck, Adam.", next = "END" },
      },
    },
    crab = {
      lines = { { id = "c_default", text = "I caught a crab last week, a real one, with both claws! Billy says a crab doesn't count, but he's only saying that because he's never caught one." } },
      choices = {
        { text = "What did you do with the crab?", next = "crab2" },
        { text = "A crab counts. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    crab2 = {
      lines = { { id = "c2_default", text = "I took it home in my hat, and my mum screamed and made me put it back in the canal. So it's still down there somewhere, and I bet it's bigger now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    billy = {
      lines = { { id = "b_default", text = "Billy says lots of things, like how he pulled out a fish bigger than himself at camp. He's my best friend, but if he'd really caught it, he'd have kept it, wouldn't he?" } },
      choices = { { text = "Maybe he would. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because my dad says the harbor's too deep for boys, and the lake's all the way out past Goldshire. Anyway, it's nice here, and sometimes the cheese man's wife gives us the broken bits." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live by the canals, and I'm going to be a real fisherman with a boat when I'm big. Billy can come too, if he stops fibbing." } },
    _none = { { id = "tp_none", text = "I don't know about that. You could ask Billy, but he'd only make something up." } },
  },
}

-- Aedis Brom: old dwarven soldier who walks from the Canals to the Pig and Whistle with Christoph Faral.
P:NPC {
  key = "aedis_brom", id = TODO_NPC("Aedis Brom"), name = "Aedis Brom", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind", "second_war" }, temper = { "hearty", "loud" }, values = { "comrades", "ale" },
  notices = { "soldier", "drink" },
  impression = {
    first = "Aedis Brom is a grey-bearded dwarf who walks the same road to the Pig and Whistle every day with his friend Christoph, refighting the Second War at the top of his voice. Half the street knows his stories by heart.",
    third = "{name} met Aedis Brom, an old dwarven soldier who drinks at the Pig and Whistle.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {g:lad|lass}! Walk wi' us if ye like, for we're bound for the Pig and Whistle and the road's short." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, it's yerself again! Christoph, look who's come back for the rest o' the story." },
  },
  notice = {
    { id = "n_dwarf", cat = "soldier", when = { race = "Dwarf" },
      text = "A dwarf in Stormwind, and no' one o' the forge lot by the look o' ye! It does my old heart good, {g:lad|lass}." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "Ye've a soldier's shoulders, and I'd wager ye've stood a line or two yerself." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've started without us, I see! Well, there's no law against it, more's the pity for yer head tomorrow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Aedis Brom, late o' more campaigns than I've fingers left tae count them on. Christoph and I fought the Horde from Darrowmere tae the Black Morass, and now we fight over who buys the first round." },
      },
      again = {
        { id = "h_again", text = "What else, then? The ale's no' getting any colder, mind." },
        { id = "h_again2", text = "Aye, go on, I've breath enough for another." },
      },
      choices = {
        { text = "Where did the two of you fight?", next = "war" },
        { text = "How did a dwarf end up in Stormwind?", next = "stormwind" },
        { text = "You two never seem to stop talking.", next = "christoph" },
        { text = "Enjoy your ale, Aedis.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Darrowmere first, all night in the fog wi' the mud up tae my beard, and I'll never be warm again for the memory of it. After that we marched on Alterac, and ye should have seen the traitor Perenolde's face when the army came up tae his front door." } },
      choices = {
        { text = "And the Black Morass?", next = "morass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morass = {
      lines = { { id = "m_default", text = "Danath gathered every sellsword in Stormwind and marched us south tae Nethergarde, and a wetter, fouler place for a war I never saw. We held, though, and I've no' eaten a frog since, on principle." } },
      choices = { { text = "You earned your ale. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stormwind = {
      lines = { { id = "s_default", text = "I came south tae help rebuild the place after the war, and somehow never went home. Ironforge has the better ale, I'll no' lie tae ye, but Christoph's here, and a man shouldn't drink alone at my age." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    christoph = {
      lines = { { id = "c_default", text = "Forty years o' practice, {g:lad|lass}! He remembers every battle wrong, and I've tae walk beside him and put it right, or folk would believe him." } },
      choices = {
        { text = "What does he get wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "He swears it was himself that started the brawl in Lordaeron, when the whole regiment knows it was me. Ask Reese at the Pig and Whistle, for he's heard both tellings so often he could settle it in his sleep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born under the mountain and soldiering since my beard was red. These days I walk, I drink and I remember, and that's work enough for an old dwarf." } },
    _none = { { id = "tp_none", text = "That's past my knowing, {g:lad|lass}. Ask me about a battle, and I'll no' disappoint ye." } },
  },
}

-- Christoph Faral: old human soldier who walks with Aedis Brom.
P:NPC {
  key = "christoph_faral", id = TODO_NPC("Christoph Faral"), name = "Christoph Faral", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind", "second_war" }, temper = { "wry", "easy" }, values = { "comrades", "peace" },
  notices = { "soldier" },
  impression = {
    first = "Christoph Faral walks with his dwarven friend Aedis, slower than he used to and smiling more. He lets the dwarf do the shouting and slips in the correction afterwards.",
    third = "{name} met Christoph Faral, an old soldier who walks to the Pig and Whistle with Aedis Brom.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you, friend. Don't mind Aedis, because he's only loud until the second mug." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. We've not got any further than the canal bridge, as you can see." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You wear your sword the way we were taught to, low and ready. It's good to see somebody still drills." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Christoph Faral, once a sellsword and now a man who walks to the tavern for his health. A warm room and a cold ale are all Aedis and I ask of the world these days." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Ask away, for we've the whole afternoon." },
      },
      choices = {
        { text = "Aedis says he started the brawl in Lordaeron.", next = "brawl" },
        { text = "Do you miss soldiering?", next = "miss" },
        { text = "The city has changed since your day, I'd guess.", next = "city" },
        { text = "Good health to you both.", next = "END" },
      },
    },
    brawl = {
      lines = { { id = "b_default", text = "He would say that. I threw the first mug, and he threw the first sergeant, so I suppose it depends on what you call starting." } },
      choices = {
        { text = "What was the brawl about?", next = "brawl2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brawl2 = {
      lines = { { id = "b2_default", text = "Neither of us remembers, which tells you how good the ale was. I woke up in Northshire three weeks later with a new scar and no notion of how I'd come by it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss the men, and I don't miss the mud. A night in a trench at Darrowmere cures you of wanting glory, and anyone who says otherwise spent that war behind a desk." } },
      choices = {
        { text = "There's still fighting to be had, in Westfall and Redridge.", next = "today" },
        { text = "Something else.", next = "BACK" },
      },
    },
    today = {
      lines = { { id = "t_default", text = "So I hear, and it's young folk like you who'll do it. We fought an army you could see coming; you've bandits who used to be our own masons, and I think yours is the harder war.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "It's all new stone, friend, because the orcs left us nothing but the foundations. I helped carry rubble out of Old Town when we came home, and the Pig and Whistle was one of the first roofs to go back up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold my sword through the Second War and came home with most of my limbs. Aedis and I have been walking to the same tavern ever since." } },
    defias = { { id = "tp_defias", text = "The men who rebuilt this city and were never paid for it. I'll not excuse what they've become, but I remember what they were." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. Aedis will have an opinion, though, and he'll give it to you whether it's right or not." } },
  },
}

-- Andi: one of Miss Danna's pupils, walking Stormwind with the class.
P:NPC {
  key = "andi_pupil", id = TODO_NPC("Andi"), name = "Andi", gender = "female",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "curious", "bright" }, values = { "learning" },
  notices = { "magic" },
  impression = {
    first = "Andi walks at the front of Miss Danna's little class, close enough to ask the first question at every stop. She asked me three before I'd said hello.",
    third = "{name} met Andi, one of Miss Danna's pupils on their walk through Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hello! We're on a school walk, and I'm allowed to talk to people if I'm polite." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Did you go anywhere exciting since last time?" },
  },
  notice = {
    { id = "n_elf", cat = "magic", when = { race = "NightElf" },
      text = "Are you a real night elf? Miss Danna says your people are older than Stormwind, older than anything." },
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "Are you a mage? I'm going to the Academy when I'm old enough, Miss Danna says I might." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Andi, and Miss Danna is showing us the whole city so we'll know our history. I like the statues best, because every one of them was a real person once." },
      },
      again = {
        { id = "h_again", text = "Can I ask you something now? Oh, you go first, then." },
        { id = "h_again2", text = "What else do you want to know?" },
      },
      choices = {
        { text = "What has Miss Danna taught you today?", next = "lesson" },
        { text = "Which statue is your favourite?", next = "statue" },
        { text = "You seem to be the one asking the questions.", next = "questions" },
        { text = "Mind your teacher, Andi.", next = "END" },
      },
    },
    lesson = {
      lines = { { id = "l_default", text = "That the orcs burned the old city down, and people came back and built this one on top with stone from the quarries. Geoff said that was boring, but I think it's the bravest thing I ever heard." } },
      choices = { { text = "It was brave. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    statue = {
      lines = { { id = "s_default", text = "The lady at the front gate, the elf with the bow! Miss Danna says she was a ranger who went through the Dark Portal and never came home." } },
      choices = {
        { text = "Why her?", next = "statue2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statue2 = {
      lines = { { id = "s2_default", text = "Because she's the only one who looks like she's about to go somewhere, and the others just look stern. I'd like to go somewhere too, when I'm big." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    questions = {
      lines = { { id = "q_default", text = "Miss Danna says a question is how you get cleverer, so I ask lots. Jimmy says I ask so many that we never get to the sweet shop, and that's a little bit true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class with Geoff and Jimmy, and I'm the best at reading. Miss Danna didn't say so, but I can tell." } },
    _none = { { id = "tp_none", text = "I don't know that one yet. I'll ask Miss Danna, because she knows everything." } },
  },
}

-- Geoff: one of Miss Danna's pupils.
P:NPC {
  key = "geoff_pupil", id = TODO_NPC("Geoff"), name = "Geoff", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "restless", "bold" }, values = { "adventure" },
  notices = { "soldier" },
  impression = {
    first = "Geoff trails behind Miss Danna's class, swinging a stick at enemies only he can see. History bores him unless somebody in it had a sword.",
    third = "{name} met Geoff, one of Miss Danna's pupils, who would rather be a knight.",
  },
  greetings = {
    { id = "g_default", text = "Hey! Is that a real weapon? Can I hold it? Miss Danna's not looking." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you fight anything since I saw you?" },
  },
  notice = {
    { id = "n_knight", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Whoa, you've got real armor on! Does it clank when you run, and is it heavy?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Geoff, and we've been walking for hours and hours and it's all old buildings. I wanted to see the Stockade, but Miss Danna says it isn't suitable." },
      },
      again = {
        { id = "h_again", text = "Tell me something else, quick, before she calls us." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Why the Stockade?", next = "stockade" },
        { text = "What do you want to be when you're grown?", next = "grown" },
        { text = "A stick isn't much of a sword.", next = "stick" },
        { text = "Keep up with your class, Geoff.", next = "END" },
      },
    },
    stockade = {
      lines = { { id = "s_default", text = "Because that's where they keep the bandits, the ones with the red masks! Jimmy's brother says you can hear them shouting through the bars at night, and I want to hear it too.", fx = { learn = { "defias" } } } },
      choices = { { text = "Your teacher's right about that one. Something else.", next = "BACK" } },
    },
    grown = {
      lines = { { id = "g_default2", text = "A knight, with a horse and a lion on my shield, and I'll go to Redridge and chase all the orcs out. Andi says I'd have to learn my letters first, but I bet knights don't read much." } },
      choices = {
        { text = "Knights read their orders, Geoff.", next = "grown2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grown2 = {
      lines = { { id = "g2_default", text = "They do? Oh, bother. Well, I'll learn the letters that are in orders, then, and I'll skip the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stick = {
      lines = { { id = "st_default", text = "It's a practice sword, and that's different. The guards by the gate practise with wooden ones too, I've seen them, so there." } },
      choices = { { text = "So they do. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, but only until I'm old enough to be a squire." } },
    defias = { { id = "tp_defias", text = "They wear red masks and they live in the Stockade now, some of them. I'm not scared of them, not much." } },
    _none = { { id = "tp_none", text = "I dunno. Ask Andi, she knows everything, and she'll tell you even if you don't ask." } },
  },
}

-- Jimmy: one of Miss Danna's pupils.
P:NPC {
  key = "jimmy_pupil", id = TODO_NPC("Jimmy"), name = "Jimmy", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "hungry", "cheerful" }, values = { "sweets" },
  notices = { "food" },
  impression = {
    first = "Jimmy is the smallest of Miss Danna's pupils and the one most likely to ask when lunch is. He knows where every bakery in Stormwind stands, which is its own kind of scholarship.",
    third = "{name} met Jimmy, one of Miss Danna's pupils, who knows every bakery in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Have you got anything to eat? I'm not supposed to ask, but have you?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! We still haven't had lunch, in case you wondered." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen, a good one! Do you make pies, and are they the kind with crust on top?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jimmy, and my feet hurt, and we've walked past three bakeries without stopping at any of them. Miss Danna says learning comes first, but I learn better after a bun." },
      },
      again = {
        { id = "h_again", text = "What else? Is it about food?" },
        { id = "h_again2", text = "You can ask me another thing." },
      },
      choices = {
        { text = "Which bakery is the best?", next = "bakery" },
        { text = "Do you like the school walks?", next = "walks" },
        { text = "Your friends look to be leaving you behind.", next = "behind" },
        { text = "Run along, Jimmy.", next = "END" },
      },
    },
    bakery = {
      lines = { { id = "b_default", text = "The one in the Trade District by the fountain, because the lady there gives you the end of the loaf if you stand and look sad. I'm really good at looking sad." } },
      choices = {
        { text = "Show me your sad look.", next = "sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sad = {
      lines = { { id = "s_default", text = "Like this, see, with my chin down and my eyes big. Geoff tried it once and the lady laughed at him, because he can't keep from grinning." } },
      choices = { { text = "That is very sad indeed. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    walks = {
      lines = { { id = "w_default", text = "I like the canals, because there's boys fishing and sometimes a boat, and I like the Cathedral because it's quiet and you can sit down. I don't like the bit with all the stairs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    behind = {
      lines = { { id = "bh_default", text = "They always wait at the corner, because Miss Danna counts us. Andi's asking a question anyhow, so I've got ages yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class with Andi and Geoff. I'm the littlest, but I'm not the slowest, that's Geoff when he's fighting things." } },
    _none = { { id = "tp_none", text = "I don't know. Is it something you can eat?" } },
  },
}
