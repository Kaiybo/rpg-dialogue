-- Stormwind folk the roster scan found missing (part 1): the recruiter in the Trade District, the
-- Chaddis family on their walk, the Champions' Hall quartermasters, two of the Sanctum's talkers
-- and the night elves of the Park. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Karlee Chaddis: walks the city with her children Gil and Paige, bound for Ancient Curios.
P:NPC {
  key = "karlee_chaddis", id = TODO_NPC("Karlee Chaddis"), name = "Karlee Chaddis", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "patient", "warm" }, values = { "family" },
  notices = { "kin" },
  impression = {
    first = "Karlee Chaddis crosses Stormwind with a shopping list in one hand and a child on either side, and answers the same question from her son every twenty paces. She never once raised her voice.",
    third = "{name} met Karlee Chaddis, a Stormwind mother on a long walk to the Mage Quarter with her two children.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Forgive us if we don't stop long, because if I stand still Gil will start asking how far it is again." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! We're still walking, as you can see, and it's still not far." },
  },
  notice = {
    { id = "n_mage", cat = "kin", when = { class = "MAGE" },
      text = "A mage! Please don't do anything clever in front of Gil, or I shall hear about nothing else until supper." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Karlee Chaddis, and these two are Gil and Paige. We're on our way to Ancient Curios in the Mage Quarter, and we're taking the long way so the pair of them are tired by bedtime." },
      },
      again = {
        { id = "h_again", text = "Was there something else? Paige, stay where I can see you." },
        { id = "h_again2", text = "Yes? Quickly, before Gil asks again." },
      },
      choices = {
        { text = "What do you need from Ancient Curios?", next = "list" },
        { text = "Your son seems eager to arrive.", next = "gil" },
        { text = "It's a long walk for small legs.", next = "walk" },
        { text = "Is Gil's father with you today?", next = "x_father" },
        { text = "Children should be told the truth, even hard truths.", next = "x_stance" },
        { text = "I know Charys's shop. Her reagents are good.", next = "x_mage", when = { class = "MAGE" } },
        { text = "Enjoy your walk.", next = "END" },
      },
    },
    list = {
      lines = { { id = "li_default", text = "A few things off my list, which Charys Yserian puts up for me whenever I call. The last one on it is the hard one to find, and she always has it, so I don't shop anywhere else." } },
      choices = {
        { text = "What's the last thing on the list?", next = "last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = { { id = "la_default", text = "Nothing that would interest anybody but me, and I'd sooner not say it in the street with small ears about. Charys knows what it is and what it's for, and that's enough people knowing." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    gil = {
      lines = { { id = "gil_default", text = "He's asked whether we're there yet since the Trade District, and he'll ask again at the canal. Once we arrive he forgets all of it, because Charys keeps a rabbit called Fizzles and Gil has a whole story about him." } },
      choices = { { text = "I'd like to hear that story. Something else.", next = "BACK", reply = "Then ask Paige, because she tells it better than he does." } },
    },
    walk = {
      lines = { { id = "w_default", text = "It is, but they see the whole city this way, the Cathedral and the canals and the guards on the bridges. I'd rather they knew their own streets than only the one we live on." } },
      choices = { { text = "That's a good reason. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_father = {
      lines = {
        { id = "x_father_l0", text = "He's with the Westfall caravans this month, driving grain to the city, which pays well because nobody else will take the road. I'd rather he took less coin and came home sooner." },
      },
      choices = {
        { text = "Is the road that dangerous?", next = "x_father2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_father2 = {
      lines = {
        { id = "x_father2_l0", text = "Defias stopped two wagons near the Jangolode Mine last month, and the drivers walked home in their smallclothes. He laughs about it in his letters, but he writes them more often than he used to." },
      },
      choices = {
        { text = "He writes to put your mind at ease.", next = "x_father3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_father3 = {
      lines = {
        { id = "x_father3_l0", text = "I know, and I let him think it works. The children think he's off on an adventure, and I'll let them think it a while longer." },
      },
      choices = {
        { text = "He'll be home soon. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Gil believes the rabbit was a wizard, and Paige believes whatever Gil does. I haven't the heart to tell them otherwise, and I'm not sure I'd be right." },
      },
      choices = {
        { text = "Let them have their stories while they're small.", next = "BACK", reply = "That's my thinking too, and the world will teach them soon enough.", fx = { align = { order = -1 } } },
        { text = "Children need the truth, or they'll never learn to judge.", next = "BACK", reply = "Perhaps, but I'll pick a different day than this one.", fx = { align = { order = 1 } } },
      },
    },
    x_mage = {
      lines = {
        { id = "x_mage_l0", text = "They are, and she's patient with my list, which is more than most shopkeepers manage with two children in tow. Would you tell Gil sheep spells don't make rabbits? He won't hear it from me." },
      },
      choices = {
        { text = "I'll leave that mystery alone. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived in Stormwind all my life, and I mean my children to know every street of it." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. We really must keep walking, I'm afraid." } },
  },
}

-- Paige Chaddis: Karlee's daughter; wants to pet Fizzles the rabbit.
P:NPC {
  key = "paige_chaddis", id = TODO_NPC("Paige Chaddis"), name = "Paige Chaddis", gender = "female",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "bright" }, values = { "family" },
  notices = { "pet" },
  impression = {
    first = "Paige Chaddis holds her mother's hand all the way across Stormwind and talks about a rabbit called Fizzles the whole time. She believes every word of her brother's story about him.",
    third = "{name} met Paige Chaddis, a little girl walking Stormwind with her mother and brother.",
  },
  greetings = {
    { id = "g_default", text = "Hello! We're going to see Fizzles, and Mommy says I can pet him if I'm gentle." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! We haven't got to Fizzles yet, because Gil walks too slow." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is {pet} yours? Does {pet} bite, or can I say hello?" },
  },
  start = "hello",
  nodes = {
    yfav = {
      lines = {
        { id = "ypaigechaddis1", text = "The dress shops in the Trade District, because the ladies there are always so pretty. And the Cathedral, because it has coloured glass windows, and when the sun shines through them it makes rainbows on the floor." },
        { id = "ypaigechaddis2", when = { class = "PRIEST" }, text = "Do you go to the Cathedral? I love the coloured windows. Are they magic?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymommy = {
      lines = {
        { id = "ypaigechaddis3", text = "She makes medicines and she knows all the herbs, even the ones that smell bad. When I'm sick she gives me a tea with honey in it, and I get better in a day. She says I can help her when I'm older." },
      },
      choices = {
        { text = "Would you like that?", next = "yhelp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhelp = {
      lines = {
        { id = "ypaigechaddis4", text = "I think so, but I'd rather have a rabbit and a shop full of dresses. Mommy says I can be anything I want, but Gil says girls should be healers and boys should be wizards." },
      },
      choices = {
        { text = "Your mommy's right. Be what you want.", next = "BACK", reply = "I'm going to be a wizard and have a rabbit, and Gil can be a healer.", fx = { align = { honor = 1 } } },
        { text = "A healer's work is an honour. Learn it well.", next = "BACK", reply = "Mommy would like that. Maybe I can do both.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrabbit = {
      lines = {
        { id = "ypaigechaddis5", text = "A white one, with a pink nose, called Snowball. I'd teach him to sit and to fetch, and if he turns out to be a wizard too, I'd let him read my books, as long as he doesn't eat them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Paige, and that's my mommy, and that's Gil, who is my brother and keeps asking if we're there yet. We're going to the shop with all the old things in it, where Fizzles lives." },
      },
      again = {
        { id = "h_again", text = "Do you want to know something else about Fizzles?" },
        { id = "h_again2", text = "What else? Mommy says we have to keep walking." },
      },
      choices = {
        { text = "Who is Fizzles?", next = "fizzles" },
        { text = "You must like the walk through the city.", next = "walk" },
        { text = "What would you ask Fizzles if he could talk?", next = "x_ask" },
        { text = "Your brother shouldn't tell you tall tales.", next = "x_stance" },
        { text = "What's your favourite part of Stormwind?", next = "yfav" },
        { text = "What does your mommy do?", next = "ymommy" },
        { text = "Do you want to see a gnome trick?", next = "BACK", when = { race = "Gnome" }, reply = "Yes, yes! Gil, look, the gnome's doing a trick! Do it again, slower, so Gil can see." },
        { text = "What rabbit would you have?", next = "yrabbit" },
        { text = "Be gentle with the rabbit, Paige.", next = "END" },
      },
    },
    fizzles = {
      lines = { { id = "f_default", text = "He's a rabbit, and he lives with Charys in the shop, and he's very soft. Gil says he used to be a great wizard, but one of his spells went wrong and now he's a rabbit forever." } },
      choices = {
        { text = "Do you think that's true?", next = "true_story" },
        { text = "Poor Fizzles.", next = "BACK", reply = "I know! That's why I pet him, so he isn't sad about it." },
        { text = "I'm a mage, and I'm still not a rabbit.", next = "BACK", when = { class = "MAGE" }, reply = "Not yet. You should be very careful with your spells, like Fizzles wasn't." },
      },
    },
    true_story = {
      lines = { { id = "t_default", text = "Gil says it is, and he's bigger than me, so he knows. Once Fizzles looked right at me and wiggled his nose, and I think he was trying to say a magic word." } },
      choices = { { text = "Maybe he was. Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "w_default", text = "I like the bridges, because you can see the fish, and I like the big statues by the gate. I don't like the part with the stairs, because my legs get tired and Mommy won't carry me any more." } },
      choices = { { text = "You're nearly there. Something else.", next = "BACK" } },
    },
    x_ask = {
      lines = {
        { id = "x_ask_l0", text = "I'd ask him if he's sad about being a bunny, and if he wants a carrot, and if he can do magic still, only small magic. If he says yes I'll give him my ribbon." },
      },
      choices = {
        { text = "That's very kind. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Gil's not telling tales, he's telling true things! Mommy didn't say it wasn't true, she only smiled." },
      },
      choices = {
        { text = "Stories are fun, true or not.", next = "BACK", reply = "Yes! And this one is true anyway.", fx = { align = { order = -1 } } },
        { text = "It's better to know what's really true.", next = "BACK", reply = "Then I'll ask Fizzles myself, and he'll tell me.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    fizzles = { { id = "ypaigechaddis6", text = "A soft rabbit at the shop. Gil says he's a wizard." } },
    gil = { { id = "ypaigechaddis7", text = "My brother. He walks too slow and asks if we're there yet." } },
    background = { { id = "tp_bg", text = "I'm Paige, and I live with Mommy and Gil, and I'm going to have a rabbit of my own one day." } },
    _none = { { id = "tp_none", text = "I don't know about that. You should ask my mommy." } },
  },
}

-- Lisan Pierce: one of three mages who sit at the foot of the Wizard's Sanctum arguing over a spell.
P:NPC {
  key = "lisan_pierce", id = TODO_NPC("Lisan Pierce"), name = "Lisan Pierce", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "stubborn" }, values = { "learning" },
  notices = { "mage" },
  impression = {
    first = "Lisan Pierce sits at the foot of the Wizard's Sanctum with two friends and argues about a spell none of them has finished. She is the one who writes everything down, and she is sure she is right.",
    third = "{name} met Lisan Pierce, a young mage who debates spellcraft with her friends below the Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello. You haven't come to settle the argument, have you, because Suzanne has already offered that job to three strangers this week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and no, we haven't agreed on anything yet, although I'm closer to being right than I was." },
  },
  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "You're a mage, so you'll understand me. Tell Janey that a spell should be written down before it's cast, and not the other way about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Lisan Pierce, and those two are Janey Anship and Suzanne. We study at the Sanctum, and we've spent most of a month trying to decide whether what we want to make is a spell or a potion." },
      },
      again = {
        { id = "h_again", text = "What else did you want to ask? I can spare a moment while Janey's talking." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Which do you say it is, spell or potion?", next = "which" },
        { text = "Why sit out here and not in the tower?", next = "outside" },
        { text = "It sounds as if you three enjoy the argument.", next = "enjoy" },
        { text = "Who teaches you three at the Sanctum?", next = "x_teach" },
        { text = "Rules slow magic down. You should experiment more.", next = "x_stance" },
        { text = "I've studied at the Sanctum too.", next = "x_mage", when = { class = "MAGE" } },
        { text = "I'll leave you to your debate.", next = "END" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "A spell, plainly, because a spell can be tested a piece at a time and a potion has to be drunk whole before you learn anything. Suzanne says a potion keeps on a shelf and a spell doesn't, which is true and beside the point." } },
      choices = {
        { text = "What is it supposed to do?", next = "does" },
        { text = "Something else.", next = "BACK" },
      },
    },
    does = {
      lines = { { id = "d_default", text = "That's the part we do agree on, and so it's the part we've sworn not to tell anybody until it works. I will say that nobody will be turned into anything, which is more than some students of the Sanctum can promise." } },
      choices = { { text = "That's reassuring. Something else.", next = "BACK" } },
    },
    outside = {
      lines = { { id = "o_default", text = "Because the masters upstairs like quiet, and we are not quiet. When it gets too heated we walk it off along the canals and through the Trade District, and by the time we're back somebody has usually had an idea." } },
      choices = { { text = "A sensible habit. Something else.", next = "BACK" } },
    },
    enjoy = {
      lines = { { id = "e_default", text = "I suppose we do, though I'd never say so in front of them. I'd have given up on the whole thing in a week by myself, and with those two I can't, because one of them would finish it without me." } },
      choices = { { text = "That's what friends are for. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_teach = {
      lines = {
        { id = "x_teach_l0", text = "Jennea Cannon takes the new students, and she's very strict about notes, which is where I learned to write everything down. Janey says I took the lesson too far, but Janey loses her notes weekly." },
      },
      choices = {
        { text = "What did Jennea say about your project?", next = "x_teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_teach2 = {
      lines = {
        { id = "x_teach2_l0", text = "She said to bring her a working theory, written out clean, before we light so much as a candle. So I've written eleven theories, and Janey has burnt three of them by accident." },
      },
      choices = {
        { text = "By accident?", next = "x_teach3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_teach3 = {
      lines = {
        { id = "x_teach3_l0", text = "She says so, and Suzanne believes her, and I've decided to believe her too for the sake of peace. I keep copies now, in a box with a lock." },
      },
      choices = {
        { text = "Wise. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "That's what Janey would say, and it's how half of Dalaran's apprentices lost their eyebrows. I'd rather have a slow spell than a quick accident." },
      },
      choices = {
        { text = "Caution is how good magic gets made. Keep your notes.", next = "BACK", reply = "Thank you! I'll tell Janey a passing {class} agreed with me.", fx = { align = { order = 1 } } },
        { text = "You'll never discover anything by playing safe.", next = "BACK", reply = "Oh, don't say that where Janey can hear you.", fx = { align = { order = -1 } } },
      },
    },
    x_mage = {
      lines = {
        { id = "x_mage_l0", text = "Then you'll know how long the stairs are, and how cross they get if you're late. Did you ever make anything new, or only learn the old spells?" },
      },
      choices = {
        { text = "Only the old ones, so far. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study at the Wizard's Sanctum, and I keep the notes for the three of us because nobody else will." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't like not knowing. Ask one of the masters in the tower." } },
  },
}

-- Suzanne: the third of the Sanctum's talkers; the peacemaker who favours the potion.
P:NPC {
  key = "suzanne_mage", id = TODO_NPC("Suzanne"), name = "Suzanne", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "easygoing", "wry" }, values = { "learning", "friendship" },
  notices = { "craft" },
  impression = {
    first = "Suzanne sits between her two friends at the foot of the Wizard's Sanctum and lets them argue until they tire, and then says the sensible thing. She laughs at all three of them, herself included.",
    third = "{name} met Suzanne, a young mage who keeps the peace in a long argument below the Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_default", text = "Hello there! Sit down if you like, and if you have an opinion about spells and potions, please keep it to yourself until they've finished shouting." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. You've missed nothing, I promise you, because we're exactly where you left us." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've the stains of an alchemist on your fingers. Wonderful, because you're on my side, and I shall tell Lisan so." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Suzanne. Lisan wants our little project to be a spell and Janey changes her mind every other day, and I think it ought to be a potion, so you can see how well we're getting on." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you, while they draw breath?" },
        { id = "h_again2", text = "Ask away, I'm not the one arguing." },
      },
      choices = {
        { text = "Why a potion?", next = "potion" },
        { text = "How long has this gone on?", next = "long" },
        { text = "You seem to be the calm one.", next = "calm" },
        { text = "Why would you leave your name off it?", next = "x_name" },
        { text = "A useful thing should be given away freely.", next = "x_stance" },
        { text = "An alchemist might help with your potion.", next = "x_alch", when = { profession = "Alchemy" } },
        { text = "Good luck with it, Suzanne.", next = "END" },
      },
    },
    potion = {
      lines = { { id = "p_default", text = "Because anybody can drink a potion, and only a mage can cast a spell. If the thing is as useful as we hope, I'd like a farmer in Elwynn to have it too, and not only the people in that tower." } },
      choices = {
        { text = "What does Lisan say to that?", next = "lisan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lisan = {
      lines = { { id = "l_default", text = "She says a potion can't be tested safely, and she's right, which is very annoying of her. So we need her spellwork to prove it first and my brewing to bottle it after, and one day she'll see that's what I've been saying all along." } },
      choices = { { text = "So you're both right. Something else.", next = "BACK", reply = "Don't tell her that, whatever you do. She'd be unbearable." } },
    },
    long = {
      lines = { { id = "lo_default", text = "About a month here on the steps, and a good while before that in the library. We've walked the canals and the Trade District so many times over it that the fruit sellers have started greeting us by name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    calm = {
      lines = { { id = "c_default", text = "Somebody has to be, or we'd have set fire to something by now. I was the middle child of five, and I learned very early that the one who waits until last usually gets listened to." } },
      choices = { { text = "A useful lesson. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_name = {
      lines = {
        { id = "x_name_l0", text = "Because Janey wants her name on things more than I do, and Lisan wants to be right more than I do, and somebody has to want the thing to work. I'd be happy to see a fisherman use it and never know my name." },
      },
      choices = {
        { text = "Do you have family by the water?", next = "x_name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_name2 = {
      lines = {
        { id = "x_name2_l0", text = "My father works the docks in the harbor, and he's seen two men drown off the piers this year. That's why it's water, if you want the truth, though the others don't know." },
      },
      choices = {
        { text = "You should tell them.", next = "x_name3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_name3 = {
      lines = {
        { id = "x_name3_l0", text = "Maybe, when it works, but I'd rather they kept arguing for the fun of it. They'll argue harder if they think it's only a game." },
      },
      choices = {
        { text = "I'll keep your secret. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "I think so, but Lisan says the Sanctum would want to sell it, and Janey says we should sell it ourselves and buy a house. I just want it to exist." },
      },
      choices = {
        { text = "Give it away. That's what it's for.", next = "BACK", reply = "That's what I said, and they both laughed at me.", fx = { align = { light = 1 } } },
        { text = "Sell it. Your work deserves payment.", next = "BACK", reply = "Janey would hug you for that, so be careful near her.", fx = { align = { light = -1 } } },
      },
    },
    x_alch = {
      lines = {
        { id = "x_alch_l0", text = "Would they? I've been reading about water-breathing draughts in the library, and I couldn't make half the words out. If you know the herbs, I'd love just the names." },
      },
      choices = {
        { text = "Blackmouth oil, for a start. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study at the Sanctum with Lisan and Janey, and I like brewing a good deal better than I like chanting." } },
    _none = { { id = "tp_none", text = "I haven't a clue, I'm sorry. Lisan might, since she writes everything down." } },
  },
}

-- Maldryn and Theridran (druid trainers in the Park) live in more_folk3.lua (deduped in the druid patch).
