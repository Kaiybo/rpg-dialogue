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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! I've been practising the parry you watched me botch, and I'd like a fair witness to my improvement." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I've written your name in my little book, I'm afraid, and not on the page you'd like." },
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
    w3_travist = {
      lines = {
        { id = "w3_travist_1", text = "Because Travist swings as though the dummy had insulted his mother, and he has split three of them since the month began. Houser says strength without aim is just a way of tiring yourself out before the ghouls arrive, and he says it at Travist, at length, every morning." },
      },
      choices = {
        { text = "He sounds like he'd do well at the Bulwark.", next = "w3_posting" },
        { text = "Better too hard than too timid.", next = "BACK", reply = "Houser would agree, I suspect, though he'd sooner die again than admit it in front of Travist." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_posting = {
      lines = {
        { id = "w3_posting_1", text = "I expect that's where we'll all go, to the Bulwark and its walls, once Houser is satisfied. I've worked out the odds of the three of us coming back whole, and I'd rather not tell you what they are, because I'd like to keep thinking of them as a rough draft." },
      },
      choices = {
        { text = "Then don't tell me. Something else.", next = "BACK" },
        { text = "Odds change once the fighting starts.", next = "BACK", reply = "So people keep telling me. I find it a comfort, and also not at all." },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "I kept the tax rolls for the parish of Brill, which is how I know half the names on the graveyard stones. I counted their sheep and their debts, and then I counted their dead, and then I joined them." } },
      choices = {
        { text = "A soldier should keep faith with the dead he serves beside.", next = "BACK", reply = "That's why I keep my list. Someone has to stay faithful to them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The dead have no claim on anyone. Look after yourself.", next = "BACK", reply = "Then who will remember them? Not the sergeant, and not the stones at Brill.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you still keep accounts?", next = "yaccounts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yaccounts = {
      lines = { { id = "yaccounts_x", text = "Only of the recruits who don't come back. I keep a little list, with names and dates, and I read it before drill. Alyssa says it's morbid. I say somebody ought to remember them properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yworry = {
      lines = { { id = "yworry_x", text = "That I'll think when I ought to act, and someone will pay for it. Houser says trust your arm. I say an arm without a head is a ghoul. Which of us is right, do you suppose?" } },
      choices = {
        { text = "Houser. Discipline wins battles, not thinking.", next = "BACK", reply = "Discipline. Very well, I'll write that at the top of my list.", fx = { align = { order = 1 } } },
        { text = "You. Thinking soldiers live longer.", next = "BACK", reply = "That's very kind, and I'll be certain not to repeat it to the sergeant.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhouser = {
      lines = { { id = "yhouser_x", text = "Once. He told Alyssa that she'd do. She didn't speak for an hour afterwards, and I've never seen her hit the dummy harder. I am still waiting for my own verdict." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Eldin Partridge, recruit. Sergeant Houser is making soldiers of Alyssa, Travist and me, and he has told me that I'd be the best of the three if I would only stop thinking about it." },
        { id = "yh_mage", when = { class = "MAGE" }, text = "A mage. You'll understand, I hope, that a sword stroke has its theory too, though Sergeant Houser denies it with real feeling." },
      },
      again = {
        { id = "h_again", text = "Was there more? He's still busy with Travist, and by the sound of it, so is the dummy." },
        { id = "h_again2", text = "Ask on. I think better when I'm talking, which is half my trouble." },
      },
      choices = {
        { text = "What is there to think about in a sword stroke?", next = "think" },
        { text = "You weren't a soldier in life.", next = "life" },
        { text = "How do you get on with Alyssa?", next = "alyssa" },
        { text = "Stop thinking and trust your arm.", next = "arm", when = { class = "WARRIOR" } },
        { text = "What did you do in life?", next = "ylife" },
        { text = "What worries you about the front?", next = "yworry" },
        { text = "Does Houser ever praise anyone?", next = "yhouser" },
        { text = "Why does the sergeant shout at Travist so much?", next = "w3_travist" },
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
      lines = { { id = "ghoul_default", text = "Only the one they keep chained for us in the yard, and I studied it so long that it nearly had my arm. Alyssa finished it and has mentioned the fact every day since." } },
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
    brill = { { id = "ytp_brill", text = "I could tell you who owed what to whom in Brill, if any of them were still alive to collect." } },
    sergeant_houser = { { id = "ytp_houser", text = "The sergeant is loud, correct and impossible to argue with, which is a dreadful combination." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, you're back! I've moved my readings four and a half feet to the left so you can stand nearer." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Perhaps stand six feet off today, if it's all the same to you. Seven, even." },
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
    w3_calc = {
      lines = {
        { id = "w3_calc_1", text = "How much of me glows, and how fast it stops! I count the green on my fingers every morning with a little copper dial I made out of a spoon, and so far I'm down by four parts in a hundred, or else the spoon is wrong, which is also likely." },
        { id = "w3_calc_2", when = { profession = "Engineering" }, text = "How much of me glows! You'll appreciate this, you're a tinkerer, I can smell the solder: I built a little dial out of a spoon and a copper coil, and it says I'm down four parts in a hundred, though the coil's bent." },
      },
      choices = {
        { text = "A dial made from a spoon? Show me.", next = "w3_spoon" },
        { text = "Four in a hundred sounds like good news.", next = "BACK", reply = "It does, doesn't it? At this rate I'll be safe to hug in about twenty-five years, give or take a spoon." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_spoon = {
      lines = {
        { id = "w3_spoon_1", text = "Oh, I can't, the tall dead people took it to copy, and they wrote \"fascinating\" on a label and put it in a drawer. They're very polite about stealing things, which is nicer than troggs, though not as nice as asking." },
      },
      choices = {
        { text = "They should give it back.", next = "BACK" },
        { text = "Build another one. Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = { { id = "ymiss_x", text = "The gears! The sound of them, all day and all night, tick, tock, clank. It's so quiet here, nobody hums. I've started humming myself, in the right pitch, and the apothecaries write it down." } },
      choices = {
        { text = "They write down your humming?", next = "yhum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhum = {
      lines = { { id = "yhum_x", text = "Everything I do, they write down! How long I sleep, what I eat, how green my skin goes under the lamp. I'm a very important measurement, they tell me. Nobody in Gnomeregan ever said that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yafraid = {
      lines = { { id = "yafraid_x", text = "No! Well, a little. A tiny bit. They're kind to me, and they feed me, and they ask about the radiation. Then sometimes they ask who else came out of Gnomeregan like me, and how many, and where. Should I tell them?" } },
      choices = {
        { text = "Tell them nothing. Protect the others.", next = "BACK", reply = "Nothing? Oh. Yes. I can do nothing. I'm quite good at it.", fx = { align = { light = 1 } } },
        { text = "Tell them. Knowledge is worth the price.", next = "BACK", reply = "That's what they say! Exactly that! You must be very clever.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhome = {
      lines = { { id = "yhome_x", text = "Home is full of troggs and radiation and Mekgineer Thermaplugg, who isn't nice at all. So I suppose I'm home now, in a way. It's damp, but nobody's tried to blow me up yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Ganoosh, and I live here now, with the tall dead people and their lovely bubbling vats. They wanted to know what the green air in Gnomeregan did to me, and I wanted somewhere to stand, so the arrangement suits everybody." },
        { id = "yh_gnome", when = { race = "Gnome" }, text = "A gnome! A clean one! Oh, hello, hello, are you from the city, did you get out, did anyone get out? Never mind, don't answer, I'll cry." },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? I'm between calculations, more or less." },
        { id = "h_again2", text = "Ask me another one! I get about seven in ten right, eight if I haven't looked at the vats today." },
      },
      choices = {
        { text = "What happened to you in Gnomeregan?", next = "gnomeregan" },
        { text = "What do the apothecaries want with you?", next = "study" },
        { text = "You seem cheerful, considering.", next = "cheerful" },
        { text = "Do you remember who you were, before?", next = "before", when = { race = "Gnome" } },
        { text = "What do you miss most about Gnomeregan?", next = "ymiss" },
        { text = "Are you afraid of the apothecaries?", next = "yafraid" },
        { text = "Would you go home, if you could?", next = "yhome" },
        { text = "What are you calculating, Ganoosh?", next = "w3_calc" },
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
    gnomeregan = { { id = "ytp_gnomer", text = "Gnomeregan was the greatest city in the world, and then it was the greenest. Tick, tock." } },
    thermaplugg = { { id = "ytp_therm", text = "Thermaplugg pushed the button. I know he did. I saw his face." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My most perceptive admirer returns. Do come and watch Theresa fetch my gloves; she's improved remarkably." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, the one who failed to appreciate my work. Theresa, we needn't fetch anything for this one." },
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
    w3_keep = {
      lines = {
        { id = "w3_keep_1", text = "She eats what I put in front of her and sleeps where I tell her to lie down, and both are a nuisance. The living need bread from the Trade Quarter every day and a blanket against the damp, and I resent every copper of it, though I'll admit the bother is a kind of proof that she's still alive in there." },
      },
      choices = {
        { text = "Then let her go, Abernathy.", next = "w3_free" },
        { text = "You talk about her like a horse you keep.", next = "w3_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_free = {
      lines = {
        { id = "w3_free_1", text = "And send her where, exactly, to wander up the stair and into a ghoul's arms in the Glades? Whatever she was, she has no home left above us, and I'm the only one in this city who knows her name, so you may call that cruelty if it comforts you." },
      },
      choices = {
        { text = "A slave is a slave, whatever you tell yourself.", next = "BACK", reply = "How righteous. You'll forgive me if I don't stop the demonstration on your account.", fx = { align = { light = 1 } } },
        { text = "She's alive and fed. Worse fates walk Lordaeron.", next = "BACK", reply = "At last, someone with a sense of proportion. Theresa, bow to the {class}.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_errands = {
      lines = {
        { id = "d2_errands_1", text = "Everywhere a message can be carried, and a great many places where it needn't be. She takes my letters to the Magic Quarter, my laundry to the canals and my insults to Father Lankester, and she has never once been late or asked me why." },
      },
      choices = {
        { text = "Does anyone stop her?", next = "d2_errands2" },
        { text = "You use her like a footman.", next = "d2_errands2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_errands2 = {
      lines = {
        { id = "d2_errands2_1", text = "The royal guards stopped her once on the bridge, because a living woman walking alone in the Undercity is either lost or a spy. She stood there in silence until they sent for me, and I've never enjoyed explaining anything so much in my life." },
      },
      choices = {
        { text = "And they let her go?", next = "BACK", reply = "They did, and now they nod to her on the bridge, which she doesn't notice. I notice for her." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d2_society = {
      lines = {
        { id = "d2_society_1", text = "Of course they do, since nothing in this city happens without the Apothecarium sniffing at it. One of Faranell's chemists came to watch Theresa for an afternoon and took notes, and asked whether the method could be done to a hundred at once." },
      },
      choices = {
        { text = "And could it?", next = "d2_society2" },
        { text = "That's an ugly question.", next = "d2_society2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_society2 = {
      lines = {
        { id = "d2_society2_1", text = "Not by me, and I told him so, because I'm an artist and not a factory. They have their own plans for the living, and theirs involve barrels, and I find it all rather crude by comparison." },
      },
      choices = {
        { text = "Crude, coming from you.", next = "BACK", reply = "I know. I enjoy being the refined one for once." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_human = {
      lines = {
        { id = "d2_human_1", text = "She looks at everyone like that, and it means nothing, I assure you. There's no one left in there to know you, only the habit of looking, which I've kept because it unsettles people so nicely." },
      },
      choices = {
        { text = "I don't believe you.", next = "BACK", reply = "Nobody does, the first time. Come back in a month and see whether she remembers your face." },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Where do you send her, on these errands?", next = "d2_errands" },
        { text = "Does the Royal Apothecary Society know of this?", next = "d2_society" },
        { text = "She looked at me just now as if she knew me.", next = "d2_human", when = { race = "Human" } },
        { text = "Does Theresa eat, or sleep?", next = "w3_keep" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Your tracks again, and I knew them before I looked up. You've a light step now, friend. Come and sit by the drain." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I smelled you coming down the stair. I'd hoped the trail would turn off before it reached me." },
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
    w3_me = {
      lines = {
        { id = "w3_me_1", text = "You favour your right side when you turn, and you set your feet down like someone used to roads more than woods. I'd know you from a hundred others by the second print, which is a thing worth knowing about yourself if anyone ever has cause to follow you." },
        { id = "w3_me_2", when = { race = "Tauren" }, text = "Hooves leave the plainest sign there is, friend, and yours are heavy behind and light at the front, as if you're always ready to charge. I'd know you from a hundred others by the second print, so mind that if anyone ever has cause to follow you." },
        { id = "w3_me_3", when = { class = "ROGUE" }, text = "You walk on the outside of your foot, as your sort are taught, and you think it leaves nothing. It leaves a narrower print, that's all, and a narrower print is still a print." },
      },
      choices = {
        { text = "Could you follow a Scarlet scout as easily?", next = "w3_scarlet" },
        { text = "I'd rather nobody followed me at all.", next = "BACK", reply = "Then cross water and stone, and never stop by a leather stall. Most folk can't manage the last one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_scarlet = {
      lines = {
        { id = "w3_scarlet_1", text = "Easier, because they walk in iron-shod boots and believe the Light will keep them from being seen. I tracked one from the Brill road almost to the Monastery fields last spring, and he never looked behind him once, which says a great deal about the Crusade." },
      },
      choices = {
        { text = "What did you do when you caught him?", next = "BACK", reply = "I told the Deathguard where he slept. They did the rest, and I didn't ask about it." },
        { text = "Something else, Winslow.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "The Silverpine woods, from Pyrewood to the coast. Baron Silverlaine's game warden, if you can believe it, and I knew every badger's sett by name. Now the wolves out there walk on two legs at night." } },
      choices = {
        { text = "The worgen of Silverpine?", next = "yworgen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworgen = {
      lines = { { id = "yworgen_x", text = "Something wrong came out of Shadowfang Keep, and the wolves aren't wolves any more. I've seen the prints, deep and clawed, walking on their hind legs. I'd hunt them myself if I trusted my old legs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylately = {
      lines = { { id = "ylately_x", text = "A rogue in soft boots carrying something heavy, about an hour ago, toward Mennet's corner. Two Deathguard, drunk on something. And a living child, which is the one that bothers me." } },
      choices = {
        { text = "A living child? Down here?", next = "ychild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychild = {
      lines = { { id = "ychild_x", text = "Small prints, bare, and fresh. They went toward the Apothecarium and they didn't come back. I've told nobody. Would you have me report it, or follow the track myself and see?" } },
      choices = {
        { text = "Report it. The city guards its own business.", next = "BACK", reply = "Aye. The city will deal with it, one way or another. I'll go now.", fx = { align = { order = 1 } } },
        { text = "Follow it yourself. Don't trust the Society.", next = "BACK", reply = "That's what my gut said. I'll go quietly, and you never heard it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrack = {
      lines = { { id = "ytrack_x", text = "Now and then. Varimathras's people ask me where a man went, and I tell them. I try not to think about why they want to know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gothard Winslow. I tracked game and lost travellers in the Tirisfal woods for thirty years, and there's nothing down here to track but people, so I keep my hand in with those." },
        { id = "yh_hunter", when = { class = "HUNTER" }, text = "A hunter. You walk heel first, like a city man. Roll it toward the toe, or every beast in the wood will hear you coming." },
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
        { text = "Where did you hunt, in life?", next = "ylife" },
        { text = "Who's passed here lately?", next = "ylately" },
        { text = "Do you ever track for the Dark Lady?", next = "ytrack" },
        { text = "What would you read from my own trail?", next = "w3_me" },
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
    silverpine = { { id = "ytp_silver", text = "Silverpine was the best hunting in the kingdom. It's the worst now, for different reasons." } },
    rogues_quarter = { { id = "ytp_rq", text = "Every rogue thinks he walks silent here. The floor disagrees." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Eleven, twelve. Stand where you like today; you've earned the spot behind my left shoulder, and you know it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're standing in my line of fire. I'd move, if I were you, and I wouldn't dawdle about it." },
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
    w3_count = {
      lines = {
        { id = "w3_count_1", text = "I do, because on the walls you lose track of how many you have left, and the one you didn't count is the one that isn't there when a ghoul comes over the parapet. It's an old soldier's habit, and I learned it from a dead man who didn't learn it in time." },
      },
      choices = {
        { text = "Who taught you that?", next = "w3_teacher" },
        { text = "Doesn't the noise bother anyone down here?", next = "w3_noise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_teacher = {
      lines = {
        { id = "w3_teacher_1", text = "A sergeant of the Stratholme watch named Hale, who could hit a crow on a weathervane and couldn't add past twenty. He ran dry on the city wall during the culling, and I've counted every shot since, even the ones I fire at a sack." },
      },
      choices = {
        { text = "Then count well, Atwood. Something else.", next = "BACK" },
      },
    },
    w3_noise = {
      lines = {
        { id = "w3_noise_1", text = "The bats in the vaulting hate it, and so do the rogues, who think a city of whispers ought to stay quiet. Nicholas says the noise is good for business, because every shot reminds somebody they ought to buy powder." },
      },
      choices = {
        { text = "Your cousin's a shrewd one. Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "I shot crows off my uncle's barley near Stratholme. Then I shot ghouls off the barley. Then I didn't shoot fast enough. Nicholas sold me my first rifle after I rose, and wouldn't take a copper for it." } },
      choices = {
        { text = "A marksman should give fair warning before the shot.", next = "BACK", reply = "To a man, perhaps. Ghouls never warned me, and I stopped warning them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The best shot is the one nobody sees coming.", next = "BACK", reply = "Thirteen. Aye, and I've made that shot more times than I'll tell you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why wouldn't he take payment?", next = "ypay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypay = {
      lines = { { id = "ypay_x", text = "Because he sold the rifle I carried in life too, and he thinks it failed me. It didn't. I failed it. I've spent every day since making sure that doesn't happen again. Nine. Ten." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybest = {
      lines = { { id = "ybest_x", text = "A Scarlet captain at two hundred paces, near the Monastery wall, as he raised his hand to burn a captured Forsaken. The Deathguard called it murder from cover. I called it a rescue. What would you call it?" } },
      choices = {
        { text = "A rescue. He was about to burn one of ours.", next = "BACK", reply = "Thank you. I'll count that one twice. Eleven.", fx = { align = { honor = -1 } } },
        { text = "Murder, honestly. You never gave him a chance.", next = "BACK", reply = "Then I'm a murderer who saved a life. I can live with that. Eleven.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhunter = {
      lines = { { id = "yhunter_x", text = "A rifle, every time. A bow wants a living arm's strength and I haven't got it any more. Powder doesn't care how dead you are, and that's the most honest thing in the Undercity." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Helena Atwood. I shoot here every day until Nicholas tells me that I've used up his profit in powder, and then I shoot a little longer, because he is family and can't very well stop me." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "A dwarf, watching me shoot? I'll take any advice you've got, as long as it's quiet. Six. Seven." },
      },
      again = {
        { id = "h_again", text = "What else? I'm reloading, so you have about as long as that takes." },
        { id = "h_again2", text = "Go on, between shots, and don't flinch at the next one." },
      },
      choices = {
        { text = "Why the rifle, and not a bow?", next = "rifle" },
        { text = "Nicholas is the gun merchant?", next = "nicholas" },
        { text = "What are you practising for?", next = "purpose" },
        { text = "You're pulling right. Ease your grip.", next = "grip", when = { class = "HUNTER" } },
        { text = "What did you do before you died?", next = "ylife" },
        { text = "What's your best shot ever?", next = "ybest" },
        { text = "I'm a hunter. Rifle or bow?", next = "yhunter", when = { class = "HUNTER" } },
        { text = "You count your shots under your breath.", next = "w3_count" },
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
    nicholas_atwood = { { id = "ytp_nick", text = "Nicholas sells guns in the War Quarter. He's my uncle's cousin, and the only family I've got left." } },
    scarlet_monastery = { { id = "ytp_sm", text = "The Monastery walls make good targets. The men on them make better ones." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my left-hand walker. Fall in, then, and tell me who's been bothering you lately." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Walk on someone else's left today. My right hand's in a mood, and it remembers you." },
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
    w3_late = {
      lines = {
        { id = "w3_late_1", text = "I don't give out names, but I'll tell you there's a young man who borrowed against a trip to Shadowfang Keep and came back without the treasure he promised, or his left hand. I'm going to see him this afternoon, and I'll be gentle, because a man with one hand is halfway to repaying in sympathy." },
      },
      choices = {
        { text = "You'd go easier on him because he's maimed?", next = "w3_soft" },
        { text = "Sounds like Shadowfang paid him already.", next = "BACK", reply = "Ha! It took its interest, right enough. My people would like the principal." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_soft = {
      lines = {
        { id = "w3_soft_1", text = "Easier isn't the word, but a broken man pays nothing, and a frightened one pays slowly. I'll tell him the debt can wait a fortnight, and he'll spend that fortnight working twice as hard to stay out of my way, which suits everyone." },
      },
      choices = {
        { text = "That's cleverer than it sounds. Something else.", next = "BACK" },
      },
    },
    ywho = {
      lines = { { id = "ywho_x", text = "Merchants in the Trade Quarter who lend to adventurers, mostly. Coin goes out to fools, I bring it back. The rogues leave me be because I'm good at it, and because I once taught one of them to count with broken fingers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "I worked a dockside tavern in Southshore, breaking up fights. It turns out the skills carry over after death. The fists stay the same, only the knuckles show." } },
      choices = {
        { text = "Southshore? That's Alliance now.", next = "ysouth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysouth = {
      lines = { { id = "ysouth_x", text = "So it is. My old tavern still stands, I'm told, and the man who owned it still pours. I owe him wages. Strange thing to think about, that a debt can outlast you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yoff = {
      lines = { { id = "yoff_x", text = "Once. A young warrior with nothing but a broken sword and a sister in the Bulwark. I paid his debt myself and told the merchant I'd beaten it out of him. Was that weakness, would you say?" } },
      choices = {
        { text = "No. That was the right thing to do.", next = "BACK", reply = "Keep it to yourself, then. I have a reputation to keep.", fx = { align = { light = 1 } } },
        { text = "Yes. A collector who forgives stops collecting.", next = "BACK", reply = "Aye, that's what I'm afraid of. Never again, I tell myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Hepzibah Sedgewick. I walk from the Rogues' Quarter to the Trade Quarter and back again, and people who owe certain other people money tend to remember it when they see me coming." },
        { id = "yh_rogue", when = { class = "ROGUE" }, text = "A rogue. You'll know the difference between a reminder and a warning, then. I deliver both." },
      },
      again = {
        { id = "h_again", text = "What else? Keep walking while you ask, and keep on my left." },
        { id = "h_again2", text = "Go on, then. I've a way to go before I've anyone to call on." },
      },
      choices = {
        { text = "Why fist weapons, and not a blade?", next = "fists" },
        { text = "You collect debts, then.", next = "debts" },
        { text = "What's the Trade Quarter to you?", next = "trade" },
        { text = "Daggers are quicker than fists, surely.", next = "daggers", when = { class = "ROGUE" } },
        { text = "Who do you collect for?", next = "ywho" },
        { text = "What did you do in life?", next = "ylife" },
        { text = "Have you ever let someone off?", next = "yoff" },
        { text = "Who's late paying this week?", next = "w3_late" },
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
    trade_quarter = { { id = "ytp_tq", text = "Half the Trade Quarter owes the other half. I keep the arithmetic honest." } },
    southshore = { { id = "ytp_ss", text = "Southshore's tavern had the best fights. I'd go back for one more evening, if the Alliance would let me." } },
    background = { { id = "tp_bg", text = "I kept order in a dockside tavern, long ago. The work's the same, only the customers are harder to bruise." } },
    _none = { { id = "tp_none", text = "Not my business, and I've made it a rule to know only my own. Ask at the bank." } },
  },
}
