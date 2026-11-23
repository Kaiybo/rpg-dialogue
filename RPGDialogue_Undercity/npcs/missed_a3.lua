-- Undercity folk the rosters missed, part three: a recruit, an engineer's supplier, two weapon merchants and a
-- markswoman in the War Quarter, a leper gnome among the apothecaries, a man with a mindslave, Carendin Halgar's
-- blind assistant, and two who walk the Rogues' Quarter. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Eldin Partridge: drills in the War Quarter with Alyssa Blaye and Travist Bosk under Sergeant Houser.
P:NPC {
  key = "uc_eldin_partridge", id = TODO_NPC("Eldin Partridge"), name = "Eldin Partridge", gender = "male",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "thoughtful", "dry" }, values = { "careful" },
  notices = { "class" },
  impression = {
    first = "Eldin Partridge drills under Sergeant Houser in the War Quarter and considers each stroke a moment longer than the sergeant likes. He has the look of a clerk who was handed a sword and resolved to understand it properly.",
    third = "{name} met Eldin Partridge, a careful recruit drilling under Sergeant Houser in the War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Good day. I can talk for as long as the sergeant is shouting at Travist, which is usually a fair while." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I've improved since you saw me last, though the sergeant hasn't noticed and the dummy hasn't either." },
    { id = "g_mage", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "You've a scholar's hands, as I had once. Tell me, does it ever stop feeling absurd to be sent to war?" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You don't think before you strike, do you? I can see it in the shoulders, and I envy it a good deal." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Eldin Partridge, recruit. Sergeant Houser is making soldiers of Alyssa, Travist and me, and he has told me that I'd be the best of the three if I would only stop thinking about it." },
      },
      again = {
        { id = "h_again", text = "Was there more? He's still busy with Travist." },
        { id = "h_again2", text = "Ask on. I think better when I'm talking, which is half my trouble." },
      },
      choices = {
        { text = "What is there to think about in a sword stroke?", next = "think" },
        { text = "You weren't a soldier in life.", next = "life" },
        { text = "How do you get on with Alyssa?", next = "alyssa" },
        { text = "Stop thinking and trust your arm.", next = "arm", when = { class = "WARRIOR" } },
        { text = "Back to it, recruit.", next = "END" },
      },
    },
    think = {
      lines = { { id = "t_default", text = "A great deal, as it turns out, such as where his weight is, where mine is, and what he'll do when I miss. The sergeant says a ghoul won't wait while I work it out, and I'm sorry to say that he is right." } },
      choices = {
        { text = "Have you faced a ghoul yet?", next = "ghoul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghoul = {
      lines = { { id = "g_default", text = "Only the one they keep chained for us in the yard, and I studied it so long that it nearly had my arm. Alyssa finished it and has mentioned the fact every day since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      lines = { { id = "l_default", text = "I kept the parish records in a village north of the lake, and I wrote down the births and the burials. Then the burials outran the births, and one morning I found that my own name belonged in the second column." } },
      choices = { { text = "And now you fight for the Dark Lady.", next = "BACK", reply = "I do, and gladly. She gave me back the pen in my own head, and a sword seems a small thing to carry in return.", fx = { affinity = 1 } } },
    },
    alyssa = {
      lines = { { id = "a_default", text = "Alyssa Blaye hits first and thinks never, and she is very good at it. I've decided to stand next to her in any real fight, because whatever I'm still considering, she will already have killed." } },
      choices = { { text = "A sound plan. Something else.", next = "BACK" } },
    },
    arm = {
      lines = { { id = "ar_default", text = "That is precisely what Sergeant Houser says, in rather shorter words. I'll try it on the next pass, and if I lose a hand, I shall know whom to thank." } },
      choices = { { text = "You'll keep the hand.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A parish clerk, and now a recruit. I've simply moved from recording the dead to joining them, and then to adding to them." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd rather not guess, because I'd only end up arguing both sides of it." } },
  },
}

-- Ganoosh: leper gnome in the Apothecarium.
P:NPC {
  key = "uc_ganoosh", id = TODO_NPC("Ganoosh"), name = "Ganoosh", gender = "male",
  bible = "bibles/missed_a.md", role = "worker", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "manic", "addled" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Ganoosh is a leper gnome, green-skinned and bright-eyed, who has somehow fetched up among the apothecaries. He chatters about readings and percentages that no longer add up, and he is delighted that nobody here tells him to stop.",
    third = "{name} met Ganoosh, a leper gnome who lives among the apothecaries of the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello, hello! Stand just there, please, about four and a half feet off, because that's the distance where I stop making people's teeth itch." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again, the same you! I've a note of you somewhere, under 'visitors, not yet glowing'." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! A clean one, with the proper colour and everything! Don't come closer, I mean it kindly, I'm at least sixty parts in a hundred unsafe." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You've come from Tinker Town, haven't you, or wherever they all went? I remember the tram, I think, and a great many stairs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Ganoosh, and I live here now, with the tall dead people and their lovely bubbling vats. They wanted to know what the green air in Gnomeregan did to me, and I wanted somewhere to stand, so the arrangement suits everybody." },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? I'm between calculations, more or less." },
        { id = "h_again2", text = "Ask me another one! I get about seven in ten of them right." },
      },
      choices = {
        { text = "What happened to you in Gnomeregan?", next = "gnomeregan" },
        { text = "What do the apothecaries want with you?", next = "study" },
        { text = "You seem cheerful, considering.", next = "cheerful" },
        { text = "Do you remember who you were, before?", next = "before", when = { race = "Gnome" } },
        { text = "Keep well, Ganoosh.", next = "END" },
      },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "The troggs came up from underneath, and then somebody opened all the valves to drive them out, and the air went a very pretty green. After that I don't remember being frightened at all, which I've calculated is the most worrying part of it." } },
      choices = {
        { text = "How did you get all the way here?", next = "journey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journey = {
      lines = { { id = "j_default", text = "I walked, I believe, for a very long while and in mostly the wrong direction, and people kept running away, which saved a lot of conversation. The first ones who didn't run were the dead ones, and they had a cart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    study = {
      lines = { { id = "s_default", text = "They take a little of my blood on the first day of the week and a little of my breath on the fourth, in a jar, and they write things down and nod. I've offered to help with the sums, but they say my sevens have begun to look like something else." } },
      choices = { { text = "Be careful of them, Ganoosh. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cheerful = {
      lines = { { id = "c_default", text = "I am, aren't I? I think the part of me that did the worrying was the first part to go, and I've decided not to look for it, since everything is so much more interesting without it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "I had a workbench on the third level with my name stamped on a little brass plate, and I was very particular about my wrenches. That's all that comes when I reach for it, a brass plate and the wrenches, but they were excellent wrenches." } },
      choices = { { text = "I'm sure they were. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was an engineer in Gnomeregan, on the third level, and then the air went green and so did I. That is my whole file, the tall ones tell me." } },
    _none = { { id = "tp_none", text = "I don't know! Isn't that marvellous? I'll add it to the list of things I mean to work out." } },
  },
}

-- Gerard Abernathy: War Quarter; shows off his human mindslave Theresa to Leona Tharpe and Joanna Whitehall.
P:NPC {
  key = "uc_gerard_abernathy", id = TODO_NPC("Gerard Abernathy"), name = "Gerard Abernathy", gender = "male",
  bible = "bibles/missed_a.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "smug", "cruel" }, values = { "ambitious", "vain" },
  notices = { "race", "class" },
  impression = {
    first = "Gerard Abernathy holds court in the War Quarter with two admirers and a silent human woman who fetches and carries at his word. He speaks of her as a piece of work he has finished, and he waits to be congratulated on it.",
    third = "{name} met Gerard Abernathy, who keeps a human mindslave named Theresa in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a new audience. You've arrived in time to see Theresa run an errand, which she does without a word of complaint." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and so does she, every time I send her. I never tire of the demonstration." },
    { id = "g_human", when = { race = "Human" }, text = "A living human, here of your own will, or so you suppose. Do come closer, for Theresa so seldom sees her own kind." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest. You'll know a mind control when you see one, and you will also know how quickly yours wears off." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Don't look so stricken on her account. She feels nothing about it at all, and I took considerable pains to make sure of that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gerard Abernathy. The woman with the empty eyes is Theresa, and she is mine in a way that no spell of the ordinary sort could make her, because she will stay so whether I'm attending to her or not." },
      },
      again = {
        { id = "h_again", text = "You have more questions? Naturally you do, as everyone has." },
        { id = "h_again2", text = "Go on. Leona and Joanna have heard it all, and I enjoy a fresh ear." },
      },
      choices = {
        { text = "What did you do to her?", next = "method" },
        { text = "Who was she, before?", next = "who" },
        { text = "Father Lankester doesn't care for you.", next = "lankester" },
        { text = "A dominated mind always slips free. How?", next = "priest", when = { class = { "PRIEST", "WARLOCK" } } },
        { text = "This is vile, Abernathy.", next = "vile" },
        { text = "I've seen enough.", next = "END" },
      },
    },
    method = {
      lines = { { id = "m_default", text = "You can hardly expect the whole recipe from me. I'll allow that it took pain, patience and a surgeon's steadiness, and that she was awake for it, since the mind has to be present for its own alteration." } },
      choices = {
        { text = "And your friends approve?", next = "friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends = {
      lines = { { id = "f_default", text = "Leona Tharpe wants the method and Joanna Whitehall wants one of her own, with a bell on the collar, she says. They doubted me for a year, and I find their admiration all the sweeter for having been so late." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "I never asked, and she is no longer able to say. She was somebody's daughter from a farm that the Deathguard cleared, I suppose, and she is a far more useful creature now than she ever was then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lankester = {
      lines = { { id = "l_default", text = "I send Theresa to the Father with a small gift, and he sends her back with an insult, and both of us enjoy it more than he would admit. A priest who still frets over the living has mistaken which city he woke up in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "It slips because the will is still in there, pushing back, and you are holding the door shut with your own strength. I stopped holding the door and removed what was pushing, and that is the only hint a colleague will have from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vile = {
      lines = { { id = "v_default", text = "It is, by the standards of the people who burned us in our homes and called it mercy. I owe the living nothing, and the Dark Lady has uses for any method that turns an enemy into a servant." } },
      choices = {
        { text = "The Lich King did the same to you.", next = "BACK", reply = "You're hardly the first to say so, and I've stopped hearing it. He took a kingdom, and I've taken one farm girl, and I think the scale excuses me." },
        { text = "I'll not argue with you.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied the mind at Dalaran's fringes, where they found my questions distasteful. Nobody here has ever told me to stop asking." } },
    _none = { { id = "tp_none", text = "A tedious question, and outside my field. Ask Theresa, and see how far that gets you." } },
  },
}

-- Gothard Winslow: found in the Rogues' Quarter.
P:NPC {
  key = "uc_gothard_winslow", id = TODO_NPC("Gothard Winslow"), name = "Gothard Winslow", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "quiet", "watchful" }, values = { "patient" },
  notices = { "class", "pet" },
  impression = {
    first = "Gothard Winslow stands in the Rogues' Quarter and reads the wet floor the way other men read a notice board. He was a tracker in life, and he can still say who passed, how lately, and how much they were carrying.",
    third = "{name} met Gothard Winslow, an old tracker who watches the comings and goings of the Rogues' Quarter.",
  },
  greetings = {
    { id = "g_default", text = "You came down by the west stair and stopped once on the way, at the leather stall, I'd say. Don't look alarmed, for it's only the mud on your boots talking." },
    { id = "g_back", when = { metBefore = true }, text = "You've been out in the Glades since last time, and through a stream. Welcome back to the dry, or what passes for it." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and a living one. It does me good to see the trade carried on by somebody the beasts will still come near." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "Your beast doesn't like me, and it's right not to. No animal has let me within arm's length since I got up out of the ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gothard Winslow. I tracked game and lost travellers in the Tirisfal woods for thirty years, and there's nothing down here to track but people, so I keep my hand in with those." },
      },
      again = {
        { id = "h_again", text = "What else? Go on, I'm in no hurry." },
        { id = "h_again2", text = "Ask away. A tracker learns to wait, and the dead have the time for it." },
      },
      choices = {
        { text = "What can you read from this floor?", next = "floor" },
        { text = "Why don't you track game any more?", next = "game" },
        { text = "Why keep to the Rogues' Quarter?", next = "quarter" },
        { text = "Teach me something about reading sign.", next = "sign", when = { class = "HUNTER" } },
        { text = "Good hunting, Winslow.", next = "END" },
      },
    },
    floor = {
      lines = { { id = "f_default", text = "Canal damp holds a print for the better part of an hour, and everyone forgets that. I can tell you that two Deathstalkers went by lately in a hurry, and that the courier who followed them had a short left stride and a heavy satchel." } },
      choices = {
        { text = "Do the rogues mind you reading them?", next = "mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "The clever ones come and ask me what they left behind, and then they go away and stop leaving it. Mennet Carkad sends me his new pupils for exactly that, and I've not caught the same one twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    game = {
      lines = { { id = "g2_default", text = "Because the hounds won't work for a dead man, and a deer winds me from half a mile off. I can find a trail as well as ever I could, but everything on the other end of it is gone before I arrive." } },
      choices = { { text = "That's a hard loss for a woodsman.", next = "BACK", reply = "It is, and I thank you for seeing it. I miss the dogs more than I miss breathing.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "It's the one part of the city where people care how they walk. The Trade Quarter is all couriers and shufflers, with nothing in it worth reading, whereas down here every second set of prints is trying not to be one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sign = {
      lines = { { id = "s_default", text = "Then look at where the sign stops and not at the sign. Any fool can follow a clear print, and the beast is always found in the place where it took the trouble to leave none." } },
      choices = { { text = "I'll remember it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A woodsman of Tirisfal, back when it had green in it. I knew those woods by their tracks, and I'd not know them now." } },
    _none = { { id = "tp_none", text = "There's no trail to that one that I can find. Ask somebody who deals in talk and not in tracks." } },
  },
}

-- Helena Atwood: practises with a rifle in the War Quarter; kin to Nicholas Atwood, the gun merchant.
P:NPC {
  key = "uc_helena_atwood", id = TODO_NPC("Helena Atwood"), name = "Helena Atwood", gender = "female",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "focused", "curt" }, values = { "exacting" },
  notices = { "class" },
  impression = {
    first = "Helena Atwood practises with a rifle in the War Quarter, loading and firing with a regularity that would shame a clock. She speaks without taking her cheek from the stock and counts every shot aloud.",
    third = "{name} met Helena Atwood, who practises her marksmanship in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Stand behind me and to the left, and don't speak until after the shot. Now then, what is it?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've put another two hundred through the target since, and I can still find the first hole." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You shoot, I see. Stand there and watch the next three, and tell me honestly whether I'm pulling to the right." },
  },
  notice = {
    { id = "n_dwarfgun", cat = "class", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren" } },
      text = "You carry a bow, which is a quiet and honourable thing. I prefer something that the Scarlets can hear coming and still can't avoid." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Helena Atwood. I shoot here every day until Nicholas tells me that I've used up his profit in powder, and then I shoot a little longer, because he is family and can't very well stop me." },
      },
      again = {
        { id = "h_again", text = "What else? I'm reloading, so you have about as long as that takes." },
        { id = "h_again2", text = "Go on, between shots." },
      },
      choices = {
        { text = "Why the rifle, and not a bow?", next = "rifle" },
        { text = "Nicholas is the gun merchant?", next = "nicholas" },
        { text = "What are you practising for?", next = "purpose" },
        { text = "You're pulling right. Ease your grip.", next = "grip", when = { class = "HUNTER" } },
        { text = "I'll let you shoot.", next = "END" },
      },
    },
    rifle = {
      lines = { { id = "r_default", text = "Because my hands are steadier than they ever were alive, and a rifle rewards steadiness more than strength. I have no breath to hold and no pulse to time the shot between, and so the ball simply goes where the barrel points." } },
      choices = {
        { text = "Is there a drawback to shooting dead?", next = "drawback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drawback = {
      lines = { { id = "d_default", text = "The recoil, which has to be respected. A living shoulder bruises and mends, and mine only loosens, so I pad the stock and have Mary Edras look at the stitching once a month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nicholas = {
      lines = { { id = "n_default", text = "Nicholas Atwood, on the weapons row, who sells shot and powder to anyone with silver. He kept the family's gunroom in life and I was never allowed in it, which I believe is why I can't now be kept away from a rifle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    purpose = {
      lines = { { id = "p_default", text = "The Deathguard wants marksmen for the towers at the Bulwark, where the Scourge comes up the road in a line. I mean to be on that wall by winter, and I mean every ball to be worth what Nicholas charged for it." } },
      choices = { { text = "They'll be glad of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    grip = {
      lines = { { id = "g2_default", text = "Am I really? Hold on, then, and let me try it your way. There, that went dead centre, and it's irritating to be told a thing I ought to have noticed for myself, so thank you." } },
      choices = { { text = "It happens to every shooter.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An Atwood of Lordaeron, and we were gunsmiths to the gentry. I was meant to marry well and never touch the stock, and look how that turned out." } },
    _none = { { id = "tp_none", text = "I don't know. If it can't be shot at, I've not studied it." } },
  },
}

-- Hepzibah Sedgewick: walks a round through the Rogues' Quarter and the Trade Quarter, fist weapons on her hands.
P:NPC {
  key = "uc_hepzibah_sedgewick", id = TODO_NPC("Hepzibah Sedgewick"), name = "Hepzibah Sedgewick", gender = "female",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "blunt", "amused" }, values = { "independent" },
  notices = { "class", "stealth" },
  impression = {
    first = "Hepzibah Sedgewick walks between the Rogues' Quarter and the Trade Quarter with spiked steel strapped over her knuckles and an easy, unhurried stride. She looks at people as if working out how they would fall.",
    third = "{name} met Hepzibah Sedgewick, who walks the Undercity with fist weapons on her hands.",
  },
  greetings = {
    { id = "g_default", text = "Walk on my left if you're going to walk with me, because the right hand likes its room." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You've a nerve, coming up on me from behind a second time, and I rather like it." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You're one of Carkad's, or you'd like to be. Keep your hands out of your sleeves while we talk, and we'll get along." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You were trying to walk softly just now. It was good, but I could tell you were trying, and that's the part to work on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hepzibah Sedgewick. I walk from the Rogues' Quarter to the Trade Quarter and back again, and people who owe certain other people money tend to remember it when they see me coming." },
      },
      again = {
        { id = "h_again", text = "What else? Keep walking while you ask." },
        { id = "h_again2", text = "Go on, then. I've a way to go before I've anyone to call on." },
      },
      choices = {
        { text = "Why fist weapons, and not a blade?", next = "fists" },
        { text = "You collect debts, then.", next = "debts" },
        { text = "What's the Trade Quarter to you?", next = "trade" },
        { text = "Daggers are quicker than fists, surely.", next = "daggers", when = { class = "ROGUE" } },
        { text = "I'll walk my own way.", next = "END" },
      },
    },
    fists = {
      lines = { { id = "f_default", text = "A blade can be knocked out of your hand, and nobody has yet knocked my hand out of my hand. Besides, I like to be close enough to see somebody change his mind." } },
      choices = {
        { text = "Do the dead even feel a punch?", next = "feel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feel = {
      lines = { { id = "fe_default", text = "Not as pain, which is why the spikes are there. You can't hurt one of us into paying, but you can break what he needs for his trade, and a tailor will think very hard about his fingers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    debts = {
      lines = { { id = "d_default", text = "I never said so, and you'll not find anyone who has. I pay calls, and the people I call on usually discover afterwards that they'd meant to settle up all along." } },
      choices = { { text = "Of course. Something else.", next = "BACK" } },
    },
    trade = {
      lines = { { id = "t_default", text = "It's where the money sits, with the bank in the middle and the auctioneers all round the ring. The Rogues' Quarter is where it's owed, and so my boots wear out on the stairs between the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    daggers = {
      lines = { { id = "da_default", text = "They are quicker, and they're final, and that's the fault in them for my line of work. A dead debtor pays nothing, even in this city, and my callers want their silver far more than they want a corpse." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept order in a dockside tavern, long ago. The work's the same, only the customers are harder to bruise." } },
    _none = { { id = "tp_none", text = "Not my business, and I've made it a rule to know only my own. Ask at the bank." } },
  },
}
