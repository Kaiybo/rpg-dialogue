-- Teldrassil, the folk we had missed: in Dolanaar, Sentinel Kyra Starsong (the Council of the Forest,
-- Seek Redemption!), Laurna Morninglight (priest trainer), Jannok Breezesong (rogue trainer, lovestruck)
-- and Seriadne (stable master); Sentinel Arynia Cloudsbreak at the Oracle Glade; Daryn Lightwind, the
-- historian of Rut'theran. Classic only (The Sisterhood of Elune is a 1.60 Forever quest).
-- Voice: bibles/teldrassil_folk.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sentinel Kyra Starsong
---------------------------------------------------------------------------
P:NPC {
  key = "kyra_starsong", id = TODO_NPC("Sentinel Kyra Starsong"), name = "Sentinel Kyra Starsong",
  bible = "bibles/teldrassil_folk.md", role = "soldier", tier = "quest",
  communities = { "dolanaar" }, temper = { "stern", "precise" }, values = { "lawful", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Kyra Starsong carries the Council of the Forest's orders to Dolanaar and delivers them as if reading from a scroll. She knows exactly who has helped the satyr Zenn Foulhoof, and she is not pleased about it.",
    third = "{name} met Sentinel Kyra Starsong in Dolanaar, who speaks for the Council of the Forest.",
  },

  greetings = {
    { id = "g_hello", text = "Halt a moment, {class}. The Council of the Forest has an eye on everyone who passes through Dolanaar." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust you've kept clear of satyrs since we last spoke." },
    { id = "g_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") },
      text = "The Council has heard that you aided Zenn Foulhoof, the satyr by the road. You'll want to hear what I have to say about that." },
    { id = "g_redeemed", when = { questDone = TODO_QUEST("Seek Redemption!") },
      text = "Foulhoof ate the cones, I hear, and the Council is satisfied. Consider your name clean, and keep it that way." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The Council expects more of you than of most, because you of all people should know better than to help a satyr." },
    { id = "n_human", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You're a guest on Teldrassil. The Council forgives guests a great deal, but not everything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Kyra Starsong, and I pass on the orders of the Council of the Forest. Those who keep Teldrassil's laws have nothing to fear from me, and those who don't will find me very hard to avoid." },
        { id = "h_seek", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "Fel cones are corrupted seeds that fall from the trees and billow green smoke. Gather three and give them to Foulhoof, and he'll think you've brought him a harmless snack, which will teach him something about trusting strangers." },
        { id = "h_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") },
          text = "You killed nature's creatures for a satyr, and the Council has heard of it. You must redeem yourself in its eyes if you wish to remain a friend of Teldrassil." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be brief; the Council's business is never finished." },
        { id = "h_again2", text = "Ask what you need to." },
      },
      choices = {
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "What's wrong with helping Zenn?", next = "zenn" },
        { text = "How bad are things in Teldrassil?", next = "trouble" },
        { text = "I didn't know he was a satyr.", next = "excuse", when = { questDone = TODO_QUEST("Zenn's Bidding") } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    council = {
      lines = { { id = "co_default", text = "Elders of the Sentinels and the druids, who see to the forest's laws while Darnassus sees to the city's. The Arch Druid and the High Priestess have the final word, but the Council has the first, and the first is the one most people hear." } },
      choices = {
        { text = "The forest needs its laws. I'll respect them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A forest has no use for councils.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    zenn = {
      lines = { { id = "ze_default", text = "Zenn Foulhoof is a satyr, and satyrs are the enemies of the forest, whatever charming story he tells. He has young adventurers kill nightsabers and webwood spiders for him, and nobody asks what he wants with the pieces." } },
      choices = {
        { text = "What does he want with them?", next = "zenn_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zenn_want = {
      lines = { { id = "zw_default", text = "He says it's to be free of a curse and returned to his old shape. Perhaps that's even true, but a satyr who wants something badly enough to lie for it is a satyr worth watching." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } } },
    },

    trouble = {
      lines = { { id = "tr_default", text = "The Gnarlpine furbolgs have turned savage, the grells breed in Shadowglen, and the harpies hold the glade around the Oracle Tree. Teldrassil is a young tree, and it seems everything wicked on it has noticed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },

    excuse = {
      lines = { { id = "ex_default", text = "Horns, hooves and a voice like honey poured over a knife, and you didn't know? The Council doesn't care what you knew, {class}, only what you'll do about it now." } },
      choices = {
        { text = "I'll make it right. I give you my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A satyr's coin spends like any other.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Sentinel Arynia Cloudsbreak
---------------------------------------------------------------------------
P:NPC {
  key = "arynia", id = TODO_NPC("Sentinel Arynia Cloudsbreak"), name = "Sentinel Arynia Cloudsbreak",
  bible = "bibles/teldrassil_folk.md", role = "soldier", tier = "quest",
  communities = { "teldrassil_wilds" }, temper = { "steady", "grim" }, values = { "dutiful", "protective" },
  notices = { "class" },

  impression = {
    first = "Sentinel Arynia Cloudsbreak guards the Oracle Tree with a handful of Sentinels and a growing list of harpies she'd like to see dead. She lost a runner to them and hasn't forgiven it.",
    third = "{name} met Sentinel Arynia Cloudsbreak, who guards the Oracle Tree's glade against the harpies.",
  },

  greetings = {
    { id = "g_hello", text = "Keep low and watch the branches. The harpies like to drop on you from above." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the glade. Did you bring harpy belts, or only bruises?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Enchanted Glade") },
      text = "The nests are thinner since you came. The Oracle Tree is grateful, and so am I." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "Good; you look like you can handle yourself. Bloodfeathers fight in threes, so never let one get behind you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Arynia Cloudsbreak. I was sent here with a few Sentinels to protect the Oracle Tree from the harpies that have nested all around this glade, and little by little we're pushing them back." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Enchanted Glade") },
          text = "The Bloodfeather harpies nest along the glade's edges. Bring me six of their belts as proof, and every one you bring is one less shrieking at the Oracle Tree's roots." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your eyes on the branches." },
        { id = "h_again2", text = "Ask, but stay alert." },
      },
      choices = {
        { text = "What is the Oracle Tree?", next = "oracle" },
        { text = "What happened to the runner?", next = "runner" },
        { text = "Where did these harpies come from?", next = "harpies" },
        { text = "I'll thin the nests.", next = "END" },
      },
    },

    oracle = {
      lines = { { id = "or_default", text = "An old and wise tree spirit, who sees further than most and sends word to Darnassus when it sees something worth telling. It can't move, and it can't fight, so it needs us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    runner = {
      lines = { { id = "ru_default", text = "The Oracle Tree sent a runner to Darnassus with a report, and the harpies caught her on the road and tore her apart. We found her satchel, but not the report, and we still don't know what the Tree wanted to say." } },
      choices = {
        { text = "Then we make the harpies pay.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Protect the next runner. That matters more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies = {
      lines = { { id = "ha_default", text = "From the mainland, I think, blown over on a storm or drawn by something we can't see. Whatever brought them, they like it here, and that worries me as much as their claws." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Laurna Morninglight (priest trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "laurna", id = TODO_NPC("Laurna Morninglight"), name = "Laurna Morninglight", title = "Priest Trainer",
  bible = "bibles/teldrassil_folk.md", role = "trainer", tier = "quest",
  communities = { "dolanaar" }, temper = { "warm", "earnest" }, values = { "devout", "kind" },
  notices = { "class" },

  impression = {
    first = "Laurna Morninglight trains Dolanaar's priests and would much rather be out tending the wounded than teaching. She sends her students to do the healing she can't leave to do herself.",
    third = "{name} met Laurna Morninglight, the priest trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's blessing on you. Come in, come in, the moon's not up yet but the kettle is." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, child of the Moon. How are your hands, steady?" },
    { id = "g_shaya", when = { questDone = TODO_QUEST("Garments of the Moon") },
      text = "Shaya came by to thank me, and I told her to thank you. She's back on her patrol already, the stubborn thing." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = "PRIEST" },
      text = "Shanda sent you down from Aldrassil, I can see it on you. She always sends me the gentle ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Laurna Morninglight, and I teach the priests of Elune who come down from Shadowglen. I'd rather be out on the roads with the Sentinels, but someone must train the next of us, and the Sisterhood chose me." },
        { id = "h_favor", when = { questActive = TODO_QUEST("In Favor of Elune") },
          text = "Shanda sent you. Good; then you're ready for your first real work, and for the garments that go with it." },
        { id = "h_garments", tags = { "news" }, when = { questActive = TODO_QUEST("Garments of the Moon") },
          text = "Sentinel Shaya is just south of Dolanaar, hurt on her patrol. Heal her, then grant her fortitude, and come back to me when you've done your duty to Elune." },
        { id = "h_sister", tags = { "news" }, when = { questActive = TODO_QUEST("The Sisterhood of Elune") },
          text = "Sister Aquinne awaits you in Darnassus. The Sisterhood has need of you, and I'm prouder than I can say that it's one of mine they've asked for." },
      },
      again = {
        { id = "h_again", text = "What else? The kettle's still warm." },
        { id = "h_again2", text = "Ask away, child." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Sisterhood of Elune?", next = "sisterhood" },
        { text = "Who is Sentinel Shaya?", next = "shaya" },
        { text = "Why do you teach, if you'd rather heal?", next = "teach" },
        { text = "Can men serve Elune too?", next = "men", when = { gender = "male", class = "PRIEST" } },
        { text = "Thank you, Laurna.", next = "END" },
      },
    },

    sisterhood = {
      lines = { { id = "si_default", text = "Before the Sundering, before the War of the Ancients, through the long vigil since, the Sisterhood has guided and healed our people. The High Priestess leads us now, as she led us at Hyjal, and every one of us would follow her into the dark." } },
      choices = {
        { text = "That's a long road to walk.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaya = {
      lines = { { id = "sh_default", text = "A young Sentinel who patrols the road south of town and refuses to come in when she's hurt, because she says a wound is no reason to leave a post. I send students to her because she won't come to me." } },
      choices = {
        { text = "Duty before comfort. She's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "She should come in. Pride kills good soldiers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Because one healer can only be in one place, and a dozen healers I've trained can be in a dozen. It's a hard lesson for someone who'd rather do a thing than talk about doing it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    men = {
      lines = { { id = "me_default", text = "Of course, though there have always been fewer of you, and the Sisterhood's name has never changed to suit. Elune hears a man's prayer as well as a woman's, whatever some of the old priestesses say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Jannok Breezesong (rogue trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "jannok", id = TODO_NPC("Jannok Breezesong"), name = "Jannok Breezesong", title = "Rogue Trainer",
  bible = "bibles/teldrassil_folk.md", role = "trainer", tier = "quest",
  communities = { "dolanaar" }, temper = { "jovial", "anxious" }, values = { "loving", "cunning" },
  notices = { "class" },

  impression = {
    first = "Jannok Breezesong trains Dolanaar's rogues between sighs. He is hopelessly in love with Syurna in Darnassus, who will not see him, and he seems to think that this is a perfectly normal way to live.",
    third = "{name} met Jannok Breezesong, Dolanaar's rogue trainer, who pines for Syurna in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor. Forgive me, I was thinking about Syurna, which I'm told I do too often." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been to Darnassus? Did you see Syurna?" },
    { id = "g_rose", when = { questDone = TODO_QUEST("The Apple Falls") },
      text = "You gave her the rose? What did she say? No, don't tell me, I can see it on your face, and it's all right." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! Syurna only speaks to rogues, you know, so you might be my best hope yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jannok Breezesong, and I teach rogues in Dolanaar when I'm not thinking of Syurna, the finest rogue in Darnassus. They say I'm lovestruck, and I suppose that's fair, given the paintings." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, good, very good. I can teach you, and you can do me a small favour in Darnassus, since she won't talk to anyone who isn't a rogue." },
        { id = "h_apple", tags = { "news" }, when = { questActive = TODO_QUEST("The Apple Falls") },
          text = "You've got the rose? Keep it out of the sun, and don't forget to tell her it's from Jannok. Say it nicely, if you can." },
      },
      again = {
        { id = "h_again", text = "What else? Unless you want to hear about her eyes again." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Tell me about Syurna.", next = "syurna" },
        { text = "Paintings?", next = "paintings" },
        { text = "Have you ever actually spoken to her?", next = "spoken" },
        { text = "Good luck with that.", next = "END" },
      },
    },

    syurna = {
      lines = { { id = "sy_default", text = "She moves like a shadow that's learned to dance, and she trains the best rogues in the city, and she once looked straight through me as if I were a window. It was the best moment of my life." } },
      choices = {
        { text = "That doesn't sound like a good sign.", next = "sign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign = {
      lines = { { id = "si_default", text = "It's a sign she noticed me enough to ignore me, which is more than most get. Love is patient, isn't it? I've got a few thousand years to wait." } },
      choices = {
        { text = "Then keep trying. Never give up on love.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "She's said no. Respect it and move on.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paintings = {
      lines = { { id = "pa_default", text = "A few. Thirty, perhaps, and some drawings, and a small statue that didn't come out well, so I keep it facing the wall. I don't eat much when I'm painting, and I paint a lot." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    spoken = {
      lines = { { id = "sp_default", text = "Once, at length, about the weather, and she agreed with me that it was likely to rain. I've thought about that conversation every day since, and I'm fairly sure there was something more in it." } },
      choices = {
        { text = "I'm sure there was.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Seriadne (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "seriadne", id = TODO_NPC("Seriadne"), name = "Seriadne", title = "Stable Master",
  bible = "bibles/teldrassil_folk.md", role = "stablemaster", tier = "service",
  communities = { "dolanaar" }, temper = { "cheerful", "gentle" }, values = { "kind", "patient" },
  notices = { "pet" },

  impression = {
    first = "Seriadne keeps the stables in Dolanaar and knows every animal by name, including the ones that only stay a night. She'd rather talk to your companion than to you.",
    third = "{name} met Seriadne, Dolanaar's stable master.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, hello! And hello to whoever's with you, too." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Your companions ask after you, you know." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Oh, {pet}! What a fine name. Did you choose it, or did it choose you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Seriadne, and I keep the stables here in Dolanaar. Leave a companion with me and I'll feed it and brush it and tell it stories until you come back." },
      },
      again = {
        { id = "h_again", text = "Anything else? The sabers are napping, so we can talk." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "What sort of stories do you tell them?", next = "stories" },
        { text = "Do the Gnarlpine trouble your animals?", next = "gnarlpine" },
        { text = "Thank you.", next = "END" },
      },
    },
    stories = {
      lines = { { id = "st_default", text = "Old ones, about Cenarius and Aessina and the great spirit beasts who fought beside our people long ago. The wolves like the wolf stories best, and the bears pretend not to care which, which is very like a bear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnarlpine = {
      lines = { { id = "gn_default", text = "They didn't use to. The Gnarlpine were friends once, and now the animals smell them coming and hide in the back of the stalls. It breaks my heart a little every time." } },
      choices = {
        { text = "They may still be saved. Don't give up on them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Friends or not, they're a danger now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Daryn Lightwind (Rut'theran)
---------------------------------------------------------------------------
P:NPC {
  key = "daryn", id = TODO_NPC("Daryn Lightwind"), name = "Daryn Lightwind", title = "Cenarion Lore Keeper",
  bible = "bibles/teldrassil_folk.md", role = "scholar", tier = "quest",
  communities = { "rutheran" }, temper = { "chatty", "precise" }, values = { "curious", "learned" },
  notices = { "class", "race" },

  impression = {
    first = "Daryn Lightwind keeps her books and her theories in Rut'theran Village and sends adventurers to every corner of Kalimdor to do the travelling she has no time for. She lends books reluctantly and talks about them freely.",
    third = "{name} met Daryn Lightwind, a historian in Rut'theran Village with an interest in everything from Feralas to giant turtles.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hello! Careful with that stack, it's in order, though I admit it doesn't look it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been somewhere interesting? Tell me everything." },
    { id = "g_book", when = { questDone = TODO_QUEST("Return to Troyas") },
      text = "You took my book to Feathermoon, and Troyas sent word he's treating it gently. You may borrow anything you like, within reason." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "DRUID" } },
      text = "You've a reader's look about you. Have you read Feralas: A History? No one has, which is why I like it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Do you know Greywhisker of the Explorers' League? We argue by letter about everything older than a thousand years, which is everything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daryn Lightwind, historian, and very busy, though always glad to talk. I study a great many things, and my latest fascination is the snapjaw turtles on the beaches of the Hinterlands, which I'll admit is a long way from Teldrassil." },
        { id = "h_feralas", tags = { "news" }, when = { questActive = TODO_QUEST("Feralas: A History") },
          text = "You want to borrow my book? For Troyas, at Feathermoon? Well, all right, but please take care of it, because it's the only copy I've ever seen." },
        { id = "h_borrower", tags = { "news" }, when = { questActive = TODO_QUEST("The Borrower") },
          text = "Take my letter to Curgle Cranklehop in Tanaris. She's made me a machine that captures a picture, a snapshot she calls it, and I want one of Gammerita, the great snapjaw." },
        { id = "h_starfall", tags = { "news" }, when = { questActive = TODO_QUEST("Starfall") },
          text = "Wynd Nightchaser spends most of his time at Starfall in Winterspring, and he knows the ruins there better than anyone. Tell him you're a student of mine, and he'll be kind to you." },
      },
      again = {
        { id = "h_again", text = "What else? I've three books open and no intention of closing any of them." },
        { id = "h_again2", text = "Ask! I love a question." },
      },
      choices = {
        { text = "Why turtles, of all things?", next = "turtles" },
        { text = "Why don't you travel yourself?", next = "travel" },
        { text = "What's in Feralas: A History?", next = "feralas" },
        { text = "What should I see in Winterspring?", next = "winterspring", when = { minLevel = 50 } },
        { text = "I'll let you read.", next = "END" },
      },
    },

    turtles = {
      lines = { { id = "tu_default", text = "Because they're old, and they remember things, in their way, which is more than most people do. A snapjaw as big as Gammerita has seen the beach change shape a dozen times, and I'd love to know what she thinks of it." } },
      choices = {
        { text = "Can a turtle really remember anything?", next = "turtle_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turtle_mind = {
      lines = { { id = "tm_default", text = "Not as we do, but she knows where the warm sand is and where the sharks wait, and she knew it before the humans built anything up there. That's a kind of history, even if it isn't written down." } },
      choices = {
        { text = "All life holds wisdom. That's worth studying.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "History is what's written. The rest is guessing.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    travel = {
      lines = { { id = "tr_default", text = "My studies keep me here, and my books don't travel well, and if I'm honest, I get seasick on the Moonspray just going to Auberdine. So I send people like you and read what they bring back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    feralas = {
      lines = { { id = "fe_default", text = "The history of the ancient elven ruins there, from Dire Maul to the coast, written by someone who walked them long before the ogres moved in. Troyas at Feathermoon has wanted it for years, and I've wanted to keep it for just as long." } },
      choices = {
        { text = "Knowledge should be shared. Lend it freely.", next = "feralas_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feralas_stance = {
      lines = { { id = "fs_default", text = "Easy to say when it isn't your only copy. But you're right, I suppose, and Troyas will look after it, or I'll hear about it." } },
      choices = {
        { text = "Shared knowledge grows. Locked knowledge dies.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep it safe. Borrowers rarely return things.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    winterspring = {
      lines = { { id = "wi_default", text = "Starfall, and the old elven ruins in the snow, and Wynd Nightchaser, who'll tell you more than I could. It's a harsh land, but it holds secrets, and I haven't been able to go back for a very long time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
