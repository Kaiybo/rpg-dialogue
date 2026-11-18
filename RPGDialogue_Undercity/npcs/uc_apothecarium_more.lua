-- More of the Apothecarium: the chemist brothers Cuely and Fuely, and Parqual Fintallas, the
-- historian who asks the Test of Lore's question. Voices: bibles/uc_apothecarium_more.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Chemist Cuely: studies a sick tauren with great interest and little warmth.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_cuely", id = TODO_NPC("Chemist Cuely"), name = "Chemist Cuely",
  bible = "bibles/uc_apothecarium_more.md", role = "scholar", tier = "quest",
  communities = { "undercity", "apothecarium" }, temper = { "cheerful", "precise" }, values = { "curious", "loyal" },
  notices = { "race", "craft" },
  impression = {
    first = "Chemist Cuely works beside his brother in the Apothecarium and studies a sick tauren named Thersa Windsong as if she were the most interesting thing in Lordaeron. He's very helpful, which somehow makes it worse.",
    third = "{name} met Chemist Cuely, an apothecary studying the illness of Thersa Windsong in the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the bucket, she's been ill again. Now, what can I do for you?" },
    { id = "g_vials", when = { questActive = TODO_QUEST("Seeping Corruption") }, text = "Have you filled the vials? Thersa's colour is going from grey to green, and I'd like the samples before she reaches blue." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Another tauren, how splendid. Would you mind if I took your pulse, purely for comparison? No? Pity." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, good, then you'll appreciate a properly labelled vial. Most of our errand-runners mix up the numbers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Chemist Cuely, at your service, and that's my brother Fuely at the next bench. You see that tauren behind me, the one who looks as though she's about to be ill? She's my current study, and she's fascinating." },
        { id = "h_before", when = { minLevel = 48, questBefore = TODO_QUEST("Seeping Corruption") },
          text = "Thersa says naga wounded her in the Ruins of Eldarath in Azshara, and then she drank from a tide pool on the beach, and now she's nauseous, among other things. I'd very much like to know what she drank, and I have a box of empty vials for whoever fetches it." },
        { id = "h_after", when = { questDone = TODO_QUEST("Seeping Corruption") },
          text = "Thersa drank the elixir and she's still standing, which I count as a success, though I've written it down as a partial one. Thank you for your help with her." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have notes to write, but I can write and talk at once." },
        { id = "h_again2", text = "Yes? Ask away, I love a question." },
      },
      choices = {
        { text = "What's wrong with Thersa?", next = "thersa" },
        { text = "Why does the Society care about a tauren?", next = "why" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "She's one of my people. Is she in danger?", next = "kin", when = { race = "Tauren" } },
        { text = "I'll leave you to your patient.", next = "END" },
      },
    },
    thersa = {
      lines = { { id = "th_default", text = "Nausea, fever, a greenish tint, and she's been sick three or four times on my floor today, which is quite a lot for one tauren. Whatever's in those tide pools came from the naga's ruins, and I suspect it's been seeping into the sea for a very long time." } },
      choices = {
        { text = "Will your elixir cure her?", next = "elixir" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixir = {
      lines = { { id = "el_default", text = "Perhaps it will cure her, and perhaps not, and we won't know until after she drinks it. That's rather the exciting part, isn't it?" } },
      choices = {
        { text = "That's no way to treat a patient.", next = "patient" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patient = {
      big = true,
      lines = { { id = "pa_default", text = "She came to us, friend, after the priests and the shaman both failed her, and I'm the only one still trying. If she's also teaching the Society something useful while I try, I don't see the harm in it." } },
      choices = {
        { text = "Knowledge gained from her pain is still knowledge.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "She's a person, not a sample. Remember that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The Society cares about anything that makes a living body sick, and Thersa is a living body with a very unusual sickness. What poisons a tauren might poison other things, and the Dark Lady has a great many enemies with stomachs." } },
      choices = { { text = "Something else, Cuely.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },
    brother = {
      lines = { { id = "br_default", text = "Fuely studies slimes and oozes, and I study whatever the slimes and oozes do to people, so we share a bench and most of our arguments. We were chemists together in Lordaeron, before, and dying didn't change that much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "ki_default", text = "In danger? She's been in danger since she drank from that pool, friend, and I'm the one keeping her upright. If you'd like to sit with her while she drinks the elixir, I'd welcome it, since she seems calmer around her own kind." } },
      choices = { { text = "Something else, Cuely.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A chemist in Lordaeron, a chemist in the Undercity, and in between a short period I don't recall. It hasn't affected my work." } },
    advice = { { id = "tp_ad", text = "Never drink from a tide pool near naga ruins. I'd have thought that was obvious, but here we are." } },
    _none = { { id = "tp_none", text = "Not something I've studied, I'm sorry to say. Try my brother, he's studied stranger things." } },
  },
}

---------------------------------------------------------------------------
-- Chemist Fuely: slimes, oozes, and utter devotion to the Dark Lady.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_fuely", id = TODO_NPC("Chemist Fuely"), name = "Chemist Fuely",
  bible = "bibles/uc_apothecarium_more.md", role = "scholar", tier = "quest",
  communities = { "undercity", "apothecarium" }, temper = { "cheerful", "grim" }, values = { "loyal", "curious" },
  notices = { "race", "craft" },
  impression = {
    first = "Chemist Fuely studies slimes and oozes at the bench beside his brother Cuely, and speaks of Lady Sylvanas the way a lost man speaks of a lighthouse. He smiles a great deal, and none of it reaches his eyes.",
    third = "{name} met Chemist Fuely, an apothecary in the Undercity studying oozes for Lady Sylvanas.",
  },

  greetings = {
    { id = "g_hi", text = "Careful, that jar is alive, more or less. What brings you to my bench?" },
    { id = "g_slime", when = { questActive = TODO_QUEST("A Sample of Slime...") }, text = "Felwood samples? Put them by the testing equipment, and we'll see which of them are most corrupt." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, and walking about doing errands for the Dark Lady. Good, good, that's how it should be." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Chemist Fuely, of the Royal Apothecary Society. Lady Sylvanas has ordered the investigation of the natural phenomena of Azeroth, because she feels there's something great to be learned from its secretive past, and I'm investigating slimes." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Chemist Fuely, and my brother and I have dedicated ourselves to Sylvanas, our beacon when times were darkest. We'll take what's owed to us, and we'll repay the pain tenfold, and we'll do it with smiles on our faces." },
        { id = "h_melding", when = { questDone = TODO_QUEST("Melding of Influences") },
          text = "The merged sample, what a tale it told! Who would have thought the corrupt ooze and the pure one would treat each other that way? I'll be years working through it." },
      },
      again = {
        { id = "h_again", text = "More questions? I adore questions, nearly as much as samples." },
        { id = "h_again2", text = "Go on, then. The oozes aren't going anywhere, I hope." },
      },
      choices = {
        { text = "Why study slimes?", next = "slimes" },
        { text = "What do you want from Felwood?", next = "felwood" },
        { text = "Why are you so devoted to Sylvanas?", next = "devotion" },
        { text = "What does the Dark Lady want with all this?", next = "purpose", when = { race = "Scourge" } },
        { text = "I'll leave you to your jars.", next = "END" },
      },
    },
    slimes = {
      lines = { { id = "sl_default", text = "The creatures all seem alike in their make-up, but greatly affected by their surroundings, which makes them a perfect record of the land they live in. A slime from Felwood is a different thing from a slime in Un'Goro, and the difference tells you what the land has been through." } },
      choices = {
        { text = "And what has Felwood been through?", next = "felwood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = { { id = "fe_default", text = "Infernals, demons and the Scourge, and the slimes there supposedly crept up through the earth during the attacks, around pools touched by fel. Bring me samples and use the testing equipment beside me, and we'll have a control group against everything else." } },
      choices = {
        { text = "And then?", next = "ungoro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ungoro = {
      lines = { { id = "un_default", text = "Then we take the most corrupt of them to Un'Goro Crater, where the primal oozes are as pure as anything left in the world, and we let the two meet. I suspect Lady Sylvanas's hunch was more insightful than even she knew." } },
      choices = { { text = "Something else, Fuely.", next = "BACK" } },
    },
    devotion = {
      big = true,
      lines = { { id = "de_default", text = "She broke our chains when the Lich King's voice was all we had in our heads, and she gave us a city and a purpose instead. We will not remain weak, and we won't be told by the living what we're allowed to become." } },
      choices = {
        { text = "The Forsaken have earned the right to choose.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Devotion that blind is dangerous, chemist.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose = {
      big = true,
      lines = { { id = "pu_default", text = "Whatever she wants, and I've learned not to ask. The Society's masters have their own work, with their own plans, and I'd be lying if I said I knew all of it, but I trust her completely." } },
      choices = {
        { text = "So do I. She's earned it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Trust is fine. I'd still like to know.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I worked beside my brother in Lordaeron, making tinctures for the nobility. Now we work for someone who deserves it." } },
    advice = { { id = "tp_ad", text = "Never let an ooze sit near the window, friend, they get ideas." } },
    _none = { { id = "tp_none", text = "If it isn't slime, I'm afraid I can't help you. Cuely might, if it makes someone sick." } },
  },
}

---------------------------------------------------------------------------
-- Parqual Fintallas: the historian who asks the Test of Lore's question.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_parqual", id = TODO_NPC("Parqual Fintallas"), name = "Parqual Fintallas",
  bible = "bibles/uc_apothecarium_more.md", role = "scholar", tier = "quest",
  communities = { "undercity", "apothecarium" }, temper = { "sharp", "proud" }, values = { "curious", "honest" },
  notices = { "race", "class" },
  impression = {
    first = "Parqual Fintallas was a great historian of Lordaeron before the plague took him, and he still knows more of the kingdom's past than anyone else in the Undercity. He is sceptical of everyone, scornful of brawn, and quietly starved for books.",
    third = "{name} met Parqual Fintallas, a Forsaken historian in the Apothecarium who sets the Test of Lore's question.",
  },

  greetings = {
    { id = "g_hi", text = "If you've come to borrow a book, I haven't any, and if you've come to steal one, I haven't any either." },
    { id = "g_test", when = { questActive = TODO_QUEST("Test of Lore") }, text = "Ah, the candidate. Have you brought the book, or have you come to tell me how strong you are again?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, so you've at least held a book before. Whether you read it is another question." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren student of lore, which still surprises me. Your people remember everything by song, I'm told, and I've always envied that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Parqual Fintallas, historian, though there's very little history in this city that anyone wants recorded. I knew all there was to know about Lordaeron once, and I'm still learning, though of a different nature now." },
        { id = "h_braug", when = { questActive = TODO_QUEST("Test of Lore") },
          text = "Braug sent you? You braved Dor'Danil, took a leap of faith, and overpowered an elemental, did you? You're probably some adventurer who overheard it in a tavern, but so be it, I'll set you my task." },
        { id = "h_passed", when = { questDone = TODO_QUEST("Final Passage") },
          text = "You passed, and I'll admit I had my doubts whether you'd studied that book. Knowledge outlasts strength, {name}, and it seems you have some of both." },
      },
      again = {
        { id = "h_again", text = "Well? A scholar asks more than one question." },
        { id = "h_again2", text = "Go on. I have nothing but time, and almost nothing to read." },
      },
      choices = {
        { text = "What is the Test of Lore?", next = "test" },
        { text = "Why is knowledge worth more than strength?", next = "knowledge" },
        { text = "Where would I find this book?", next = "monastery" },
        { text = "You were a historian in life?", next = "life" },
        { text = "Do you miss your books from before?", next = "books", when = { race = "Scourge" } },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    test = {
      lines = { { id = "te_default", text = "Dorn Plainstalker in Thousand Needles sets his candidates their tests of faith and strength, and Braug Dimspirit in Stonetalon asks the first half of this one. I ask the second, which tests the mind, the part most candidates forget they have." } },
      choices = {
        { text = "What will you ask me?", next = "question" },
        { text = "Something else.", next = "BACK" },
      },
    },
    question = {
      lines = { { id = "qu_default", text = "I'll ask you only after you've brought me the book and read it, and I won't tell you more than that. Take all the time you need to answer, because there's no pressure to answer quickly, only to answer correctly." } },
      choices = { { text = "Something else, Parqual.", next = "BACK" } },
    },
    knowledge = {
      big = true,
      lines = { { id = "kn_default", text = "Because even as others pass you by in strength, your knowledge of the world goes on being useful long after your arm gives out. Every fool with a sword in Lordaeron died just as quickly as the scholars did, and the scholars at least understood why." } },
      choices = {
        { text = "Understanding why didn't save anyone, Parqual.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll learn the history before I swing again.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    monastery = {
      lines = { { id = "mo_default", text = "In the Scarlet Monastery, north in Tirisfal Glades, there's a library, and in it a book called Beginnings of the Undead Threat. The paladins there use it to train their recruits to hate us, so you'll find it well guarded and very well thumbed." } },
      choices = {
        { text = "Why that book in particular?", next = "monastery2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    monastery2 = {
      lines = { { id = "m2_default", text = "Because it tells how the plague began, and who carried it, and the Crusade has taught it wrong for years. A student of lore should know the truth of how this kingdom died, even if, especially if, it makes uncomfortable reading." } },
      choices = { { text = "Something else, Parqual.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    life = {
      lines = { { id = "li_default", text = "I wrote the histories of a dozen noble houses in Lordaeron, and I could tell you which ones lied about their ancestors. Most of them did, and most of them are standing in this city now, pretending they never had any." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    books = {
      big = true,
      lines = { { id = "bo_default", text = "The Forsaken are strongly discouraged from going back to our old lives, so I tried to fetch my books quietly, and they were taken from me at the gate. I don't regret trying, though I'd advise you to be more careful than I was." } },
      choices = {
        { text = "The past is gone. The Dark Lady is right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your books are yours. They had no right.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept the records of a kingdom that no longer exists, which makes me either very important or entirely useless." } },
    advice = { { id = "tp_ad", text = "Read the book your enemy reads, {class}. It tells you what he thinks he's fighting." } },
    _none = { { id = "tp_none", text = "I don't know, and I dislike saying so, so I'll thank you not to ask me again." } },
  },
}
