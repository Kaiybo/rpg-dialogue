-- Tirisfal folk an earlier pass missed: the Deathknell watch (Bartrand, Oliver, Phillip, Randolph), the road
-- patrol (Lundmark), Deathguard Kel, Harold Raims, Maquell Ebonwood and Maximillion in Deathknell, the dwarf in
-- the tavern cellar, Ratslin Maime in Brill and the two zeppelin masters. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Deathguard Bartrand: Deathknell watch.
P:NPC {
  key = "deathguard_bartrand", id = TODO_NPC("Deathguard Bartrand"), name = "Deathguard Bartrand", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "race" },
  impression = {
    first = "Deathguard Bartrand keeps watch over Deathknell with the patience of a man who has already been buried once. He counts the newly risen as they come up the hill and seems faintly surprised by each one.",
    third = "{name} met Deathguard Bartrand, one of the Deathknell watch.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Keep moving, {class}. Deathknell is a small place, and I like to know where everyone in it is standing." },
    { id = "g_back", when = { metBefore = true }, text = "You're still on your feet, I see. That puts you ahead of half the ones who climbed out with you." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A warm one, here among the graves. The Dark Lady calls you an ally, so I'll call you one too, though you'll forgive me if I keep count of you." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A sexton at the chapel here, when Deathknell was only a village with a big graveyard. I dug half these graves myself. It's a strange thing to watch the folk you buried climb back out and ask you for directions." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you recognise any of them?", next = "yrecog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrecog = {
      lines = { { id = "yrecog_x", text = "Now and then. The miller's son came up last week, and he didn't know me, and I didn't tell him. Should I have? Some of them are better off starting fresh." } },
      choices = {
        { text = "Tell them. They deserve their own past.", next = "BACK", reply = "Maybe so. I'll think on it, next time.", fx = { align = { order = -1 } } },
        { text = "Say nothing. The Dark Lady needs soldiers, not mourners.", next = "BACK", reply = "Aye, that's the Executor's view. I suppose it's mine too.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycount = {
      lines = { { id = "ycount_x", text = "Five, six, sometimes a dozen. Fewer than the first year, when they came up by the hundred. Why some rise and some stay down, nobody can tell me, not even the priests." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywrong = {
      lines = { { id = "ywrong_x", text = "Some wake mindless, still the Scourge's creatures. Those we put back down, quickly, and Shadow Priest Sarvis says a word over them. I keep a list of their names, when I knew them. Nobody asked me to." } },
      choices = {
        { text = "Why keep the list?", next = "ylist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylist = {
      lines = { { id = "ylist_x", text = "Because somebody should. They were people of this parish, once. I'll not have them forgotten just because they came back wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Bartrand, of the Deathknell watch. I stand here and see that what comes out of the crypt is one of ours, and that what comes down from the hills is dealt with before it reaches the chapel." },
        { id = "yh_human", when = { race = "Human" }, text = "A living human, this deep in Deathknell. Either you're very lost or very brave, and the Scarlets will want to know which." },
      },
      again = {
        { id = "h_again", text = "Was there something else? The graves don't watch themselves." },
        { id = "h_again2", text = "Go on, then, but be brief about it." },
      },
      choices = {
        { text = "What comes out of the crypt that isn't one of ours?", next = "crypt" },
        { text = "What comes down from the hills?", next = "hills" },
        { text = "It's a quiet post you have.", next = "quiet" },
        { text = "Who were you, before?", next = "ylife" },
        { text = "How many rise here each week?", next = "ycount" },
        { text = "What happens to those who wake wrong?", next = "ywrong" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    crypt = {
      lines = { { id = "c_default", text = "Some wake with their wits and walk up to Mordo like sensible corpses, and some wake with nothing behind the eyes at all. The second sort wander off toward the fields, and Shadow Priest Sarvis sends the first sort to put them down." } },
      choices = {
        { text = "That's hard work to give the newly risen.", next = "hard" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "It's the kindest lesson Deathknell teaches, because it shows them what they nearly were. Nobody who has cut down a mindless neighbour ever asks me again why we serve the Dark Lady." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    hills = {
      lines = { { id = "hl_default", text = "Scarlet zealots, mostly, who have decided that we're the plague and they're the cure. They hold a camp over the rise, and Executor Arren keeps a list of the ones he'd like removed from it." } },
      choices = { { text = "I'll speak to Arren. Another matter.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, and I've come to prefer it that way. I was a noisy man when I was alive, by all accounts, and it did me very little good in the end." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
  },
  topics = {
    sarvis = { { id = "ytp_sarvis", text = "Shadow Priest Sarvis greets the risen. I just count them." } },
    deathknell = { { id = "ytp_dk", text = "Deathknell was a quiet parish once. It's still quiet, mostly, in a different way." } },
    background = { { id = "tp_bg", text = "I died in Lordaeron's fall and woke in service to the Dark Lady, like every other soldier on this hill." } },
    scarlet_crusade = { { id = "tp_sc", text = "Fanatics in red, camped closer to Deathknell than I care for. Arren wants them thinned." } },
    _none = { { id = "tp_none", text = "That's no business of the watch. Ask Executor Arren, if you must ask someone." } },
  },
}

-- Deathguard Oliver: Deathknell watch.
P:NPC {
  key = "deathguard_oliver", id = TODO_NPC("Deathguard Oliver"), name = "Deathguard Oliver", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "wry" }, values = { "dutiful", "loyal" },
  notices = { "class" },
  impression = {
    first = "Deathguard Oliver stands his post in Deathknell with a soldier's straight back and a gravedigger's sense of humour. He seems to find the whole business of being dead mildly ridiculous.",
    third = "{name} met Deathguard Oliver, a dry-humoured guard of the Deathknell watch.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Welcome to Deathknell, {class}, where the air is foul and the company is worse. Mind the open graves on your way through." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Most people only need to visit a graveyard once, and I include myself in that." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold that blade as though you remember how. Dannal Stern drills the warriors here, and he's been short of anyone worth shouting at." },
  },
  start = "hello",
  nodes = {
    yking = {
      lines = { { id = "yking_x", text = "Terenas? I saw him once, at a parade, waving at the crowd from a white horse. He looked tired. I suppose kings do. I served his army nine years and never met him, which is the usual arrangement." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do you mourn him?", next = "ymourn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymourn = {
      lines = { { id = "ymourn_x", text = "Mourn him? He let the Cult grow under his nose and never noticed until his own son came home with a sword. But he was a decent man, they say. Can a decent king still fail his people?" } },
      choices = {
        { text = "Yes. He should have seen it coming.", next = "BACK", reply = "Aye, that's my view too, on the bad days.", fx = { align = { order = -1 } } },
        { text = "No. He was betrayed. A king can't be blamed for that.", next = "BACK", reply = "Hm. Loyal to a dead king. I admire it, a bit.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfunny = {
      lines = { { id = "yfunny_x", text = "Because the alternative is screaming, and I tried that for my first week. It doesn't help. A man can laugh at his own ribs poking out, or he can weep about it, and weeping takes eyes I'm not sure I've still got." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yserious = {
      lines = { { id = "yserious_x", text = "The Scarlets. There's nothing funny about a man who'd burn a child for waking up wrong. I've seen them do it at the Solliden farmstead, and I've not laughed at them since." } },
      choices = {
        { text = "What happened at Solliden?", next = "ysolliden" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysolliden = {
      lines = { { id = "ysolliden_x", text = "A family rose there, mother and two boys, and they came walking toward Deathknell. The Scarlets caught them first. I was too far away. I keep a joke ready for most things, but not that one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Oliver. I served in Lordaeron's garrison when it had a king, and I serve in Deathknell's now that it has a queen, and I'll confess the second posting has fewer parades." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren in Deathknell! Mind the low doorways, friend. The chapel lintel's taken more than one horn already, and the chapel complains." },
      },
      again = {
        { id = "h_again", text = "What else can a dead man tell you?" },
        { id = "h_again2", text = "Ask away, since I've nowhere to be until the world ends." },
      },
      choices = {
        { text = "You served the old king?", next = "king" },
        { text = "Where should someone newly risen go first?", next = "first" },
        { text = "You take death lightly.", next = "lightly" },
        { text = "What was the old king like?", next = "yking" },
        { text = "Why find death so funny?", next = "yfunny" },
        { text = "Is there anything you take seriously?", next = "yserious" },
        { text = "Carry on, Deathguard.", next = "END" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I stood a wall for Terenas, and then his son came home and put a sword through him, and through a good many of the rest of us after. I don't raise a glass to the house of Menethil these days." } },
      choices = {
        { text = "And now you serve Sylvanas.", next = "queen" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    queen = {
      lines = { { id = "qn_default", text = "She cut the Lich King's leash from my neck, which is more than any living lord ever did for me. I'd follow the Dark Lady into the sea for that, though I'd complain about the damp the whole way." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Undertaker Mordo will look you over when you climb out, and Shadow Priest Sarvis will find you something to kill. After that it's the road north to Brill, where Executor Zygand has work for anyone who can hold a weapon." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    lightly = {
      lines = { { id = "l_default", text = "I've tried taking it seriously, friend, and it made no difference to the smell. A man who can't laugh at his own funeral will find eternity a very long watch." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    terenas = { { id = "ytp_terenas", text = "Old King Terenas looked tired at the parade. I'd look tired too, in his shoes." } },
    scarlet_crusade = { { id = "ytp_sc", text = "The Scarlets are the only joke in Tirisfal that isn't funny." } },
    background = { { id = "tp_bg", text = "Garrison soldier under Terenas, and Deathguard under the Dark Lady. The pay was better the first time." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I've had a long time to think about most things." } },
  },
}

-- Deathguard Phillip: Deathknell watch.
P:NPC {
  key = "deathguard_phillip", id = TODO_NPC("Deathguard Phillip"), name = "Deathguard Phillip", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "stern" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Deathguard Phillip watches the road out of Deathknell as if he expects the Scarlet Crusade over the hill within the hour. He has no patience for idlers and says as much.",
    third = "{name} met Deathguard Phillip, a stern guard of the Deathknell watch.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome here, and I'll tell the others so if they ask." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "State your business or walk on, {class}. The Crusade doesn't rest, and neither does this watch." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I hope you've been useful to someone since we last spoke." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "One of Dark Cleric Duesten's flock, by the look of you. See that your faith is of some use on the field, because the Scarlets certainly believe theirs is." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A sergeant of the Lordaeron footmen, garrisoned at Brill. I trained boys to hold a pike. Then I watched most of them fall to the Scourge in a single night. The ones who didn't fall turned." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yhard = {
      lines = { { id = "yhard_x", text = "Because soft recruits die twice. I lost a whole squad at the Scarlet camp to the north, because I let them stop to gawk at their old homes. Never again. A hard word now saves a burning later." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "You can't blame them for looking back.", next = "ylook" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylook = {
      lines = { { id = "ylook_x", text = "I don't blame them. I blame myself. Should a sergeant drive his recruits hard and lose their love, or go gentle and lose their lives?" } },
      choices = {
        { text = "Drive them hard. Love won't stop a Scarlet blade.", next = "BACK", reply = "Aye. Good. You'd make a sergeant.", fx = { align = { order = 1 } } },
        { text = "Go gentle. Fear makes poor soldiers.", next = "BACK", reply = "Hm. Maybe. I'll think on that, between drills.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypatrol = {
      lines = { { id = "ypatrol_x", text = "Six of us went toward Solliden. Three came back. One of the three was me, which still surprises me. The others are buried in the field, properly this time, and they'll stay down." } },
      choices = {
        { text = "Why not burn the camp, then?", next = "yorders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yorders = {
      lines = { { id = "yorders_x", text = "Executor Arren wants the camp left alone until we've numbers to take it. I want it burned. Orders are orders. I watch the road instead, and I count." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Phillip. My post is this road, and my orders are that nothing in a red tabard walks it, so unless you've seen one I can't think what we have to discuss." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "Freshly risen, and already standing about. Move, recruit. The Crusade doesn't wait for you to find your feet." },
      },
      again = {
        { id = "h_again", text = "Well? Speak, and then let me get back to it." },
        { id = "h_again2", text = "Is there more, or may I return to my duty?" },
      },
      choices = {
        { text = "How close does the Crusade come?", next = "crusade" },
        { text = "You don't think much of the newly risen.", next = "risen" },
        { text = "Who were you in life?", next = "ylife" },
        { text = "Why are you so hard on the risen?", next = "yhard" },
        { text = "What happened to your patrol?", next = "ypatrol" },
        { text = "As you were, Deathguard.", next = "END" },
      },
    },
    crusade = {
      lines = { { id = "c_default", text = "Close enough that I can smell their torches when the wind turns. They've a camp in the hills east of the village, and they send their converts down to prove themselves on whoever is slowest out of the crypt." } },
      choices = {
        { text = "Why hasn't the watch burned the camp?", next = "burn" },
        { text = "Enough of that.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Because there are six of us and a village of half-woken dead to mind, and the Deathguard doesn't abandon its post to go hunting. Executor Arren sends the new ones against the camp, which bloods them and thins the Scarlets at one stroke." } },
      choices = { { text = "Enough of that.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "I think nothing of them until they've earned it, which is how I was taught and how I teach. Prove you can follow an order and keep your head, and you'll find me civil enough." } },
      choices = { { text = "I'll remember it. Enough of that.", next = "BACK" } },
    },
  },
  topics = {
    executor_arren = { { id = "ytp_arren", text = "Executor Arren has the patience of a gravestone. I have less." } },
    pikes = { { id = "ytp_pikes", text = "A pike keeps a Scarlet horse at bay. A sword doesn't. I wish more recruits learned that." } },
    background = { { id = "tp_bg", text = "I was a soldier before the plague and I am a soldier after it. Very little else about me is worth your time." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots who would burn every one of us and call it mercy. Kill them when you find them." } },
    _none = { { id = "tp_none", text = "That isn't a matter for the watch. Take it to the Executor." } },
  },
}

-- Deathguard Randolph: Deathknell watch.
P:NPC {
  key = "deathguard_randolph", id = TODO_NPC("Deathguard Randolph"), name = "Deathguard Randolph", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "calm" }, values = { "dutiful", "patient" },
  notices = { "race" },
  impression = {
    first = "Deathguard Randolph speaks slowly and misses nothing. He has the look of a man who was old before he died and saw no reason to change his habits afterwards.",
    third = "{name} met Deathguard Randolph, the oldest hand on the Deathknell watch.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Easy now, {class}. There's no call to hurry in Deathknell, since everyone here has already been late for the last time." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Stand a while if you like, for the hill is quiet tonight." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You've the stare of someone not long out of the ground. It passes, and what replaces it is mostly anger, which you'll find more useful." },
  },
  start = "hello",
  nodes = {
    yold = {
      lines = { { id = "yold_x", text = "Sixty-eight winters, and still standing watch for the militia. I'd outlived my wife and both my brothers. I thought the plague would be the end of me, and so it was, and then it wasn't." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Is the watch hard, at your age?", next = "ywatch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhardest = {
      lines = { { id = "yhardest_x", text = "The young ones. They wake up and ask for their mothers. I tell them gently that their mothers are gone, and that the Dark Lady is all the family they have now. Is that a lie, do you think?" } },
      choices = {
        { text = "No. The Forsaken are a family now.", next = "BACK", reply = "Good. I'll keep saying it, then, and believing it.", fx = { align = { order = 1 } } },
        { text = "Yes. They should be told the truth and choose.", next = "BACK", reply = "Hm. Choose what, though? There's not much choosing for the dead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = { { id = "yfamily_x", text = "A grandson, somewhere. He was at Andorhal when it fell. If he rose, he rose there, and I've never heard. I ask every Deathguard who comes back from the Bulwark. Nobody's seen a lad with my nose." } },
      choices = {
        { text = "I'll keep an eye out for him.", next = "BACK", reply = "Would you? His name's Tomas. Thank you, truly.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychapel = {
      lines = { { id = "ychapel_x", text = "The chapel bell hasn't rung since the plague. Shadow Priest Sarvis wants it melted for arrowheads. I'd sooner it stayed up there, quiet. Some things deserve to be left as they were." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywatch = {
      lines = { { id = "ywatch_x", text = "Watching is easy. It's the thinking that's hard. At my age, a man thinks about everything he's ever done, and on watch there's no one to talk to but the crows." } },
      choices = {
        { text = "What about the chapel bell?", next = "ychapel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Randolph. I've watched this hill since the Dark Lady freed us, and I have seen a great many of our people climb out of that crypt and stand blinking at the sky." },
        { id = "yh_human", when = { race = "Human" }, text = "A living human. Strange to see one here who isn't trying to burn us. Stay a while, then, and tell me how the world's changed." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, and I'll answer if I can." },
      },
      choices = {
        { text = "What do you say to them, when they wake?", next = "wake" },
        { text = "What was Deathknell, before?", next = "before" },
        { text = "You sound almost fond of the place.", next = "fond" },
        { text = "How old were you when you died?", next = "yold" },
        { text = "What's the hardest part of greeting the risen?", next = "yhardest" },
        { text = "Do you have family among the risen?", next = "yfamily" },
        { text = "Good watch to you.", next = "END" },
      },
    },
    wake = {
      lines = { { id = "w_default", text = "I tell them their name, if I know it, and I tell them they are free. Most of them don't believe the second part until they've walked to Brill and nobody has stopped them." } },
      choices = {
        { text = "And the ones who never believe it?", next = "never" },
        { text = "Tell me of something else.", next = "BACK" },
      },
    },
    never = {
      lines = { { id = "nv_default", text = "Some walk into the hills and don't come back, and a few go south looking for families who will scream at the sight of them. I can't stop them, and I've learned not to try, because every one of us has to find out for himself what he is now." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "A village with a chapel, where the farms of Tirisfal buried their dead under good stone. The plague filled the crypt faster than the diggers could manage, and now it empties itself, which I doubt the old priests had in mind." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    fond = {
      lines = { { id = "f_default", text = "Fond is a warm word, and I've no warmth left to spend on it. Call it habit, since a man must stand somewhere, and I've stood here long enough to know every stone." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
  },
  topics = {
    deathknell_chapel = { { id = "ytp_chapel", text = "The bell's still up there. I hope it stays." } },
    old_age = { { id = "ytp_age", text = "I was old when I died. Death didn't make me any younger, only stiffer." } },
    background = { { id = "tp_bg", text = "I was an old soldier when the plague took me, and death hasn't made me any younger." } },
    _none = { { id = "tp_none", text = "I can't help you there. I know this hill, and not a great deal beyond it." } },
  },
}

-- Deathguard Lundmark: walks the road between Deathknell and the Undercity; gives directions.
P:NPC {
  key = "deathguard_lundmark", id = TODO_NPC("Deathguard Lundmark"), name = "Deathguard Lundmark", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "travel" },
  impression = {
    first = "Deathguard Lundmark walks the road between Deathknell and the Undercity and knows every milestone on it. He gives directions the way other men give orders.",
    third = "{name} met Deathguard Lundmark, who patrols the Tirisfal road and points lost travellers on their way.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Lost already, {class}? Walk with me a moment and say where you're bound, because I don't stop for anyone." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back to the road, then. That's more than some manage." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The road's darker than it looks, and the hounds hunt it after sundown. Tell me where you're going and be quick." },
  },
  notice = {
    { id = "n_low", cat = "travel", when = { race = "Scourge", maxLevel = 9 },
      text = "You've the look of someone fresh from the crypt and pointed at the wrong horizon. Brill is north along this road, and you won't miss the gallows." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A carter. I drove grain from Brill to the capital twice a week for twenty years. I knew every pothole and every inn. The grain was what killed us, in the end. I drove it myself." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "You carried the plagued grain?", next = "ygrain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrain = {
      lines = { { id = "ygrain_x", text = "I didn't know. None of us did. The Cult paid well and the sacks looked like any others. Does a man who carried poison without knowing it share the blame, do you think?" } },
      choices = {
        { text = "No. The Cult of the Damned bears the guilt.", next = "BACK", reply = "Kind words. I've heard them before. They don't stick.", fx = { align = { light = 1 } } },
        { text = "Maybe. Ignorance doesn't bring the dead back.", next = "BACK", reply = "No. It doesn't. That's why I walk this road now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystrange = {
      lines = { { id = "ystrange_x", text = "A Scarlet monk, once, walking south toward the Undercity with his hands up. He said he wanted to see the Dark Lady. The Deathguard took him to the Apothecarium instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ysafe = {
      lines = { { id = "ysafe_x", text = "Between the milestones, in daylight, with the Deathguard about? Safe enough. After dark, the bats come down from Nightmare Vale, and the Scarlets send riders. Keep to the stones." } },
      choices = {
        { text = "You know those stones well.", next = "ymilestone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymilestone = {
      lines = { { id = "ymilestone_x", text = "There's a milestone past Brill with my old cart-mark scratched in it, a wheel with a nail through it. I touch it every time I pass. It's foolish. I keep doing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Lundmark, road patrol. I walk from Deathknell to the gates of the Undercity and back again, so if there's a place in the Glades you can't find, I've likely tripped over it." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc, off the zeppelin, I'd guess. Brill's east, the Undercity's south, and the Scarlets are everywhere else. That's all you need." },
      },
      again = {
        { id = "h_again", text = "Where else do you need pointing?" },
        { id = "h_again2", text = "Keep up, and ask as we go." },
      },
      choices = {
        { text = "Which way to Brill?", next = "brill" },
        { text = "How do I reach the Undercity?", next = "undercity" },
        { text = "What should I stay away from on this road?", next = "danger" },
        { text = "Who were you in life?", next = "ylife" },
        { text = "What's the strangest thing on this road?", next = "ystrange" },
        { text = "Is the road ever safe?", next = "ysafe" },
        { text = "I know my way. Farewell.", next = "END" },
      },
    },
    brill = {
      lines = { { id = "b_default", text = "Follow the road north and east from Deathknell and it runs straight through the middle of the town. The Gallows' End Tavern has beds, and Executor Zygand at the town hall has work for anyone who asks." } },
      choices = { { text = "Thank you. Another thing.", next = "BACK" } },
    },
    undercity = {
      lines = { { id = "u_default", text = "Past Brill the road bends south-east to the ruins of Lordaeron's capital. Walk through the old courtyard and the throne room, and the lifts beyond will take you down to the city proper." } },
      choices = {
        { text = "And the tower I can see outside the walls?", next = "tower" },
        { text = "Another thing.", next = "BACK" },
      },
    },
    tower = {
      lines = { { id = "t_default", text = "That's the goblins' zeppelin tower, north of the gates. One airship crosses to Orgrimmar and the other goes down to Grom'gol in Stranglethorn, and the goblins at the top will tell you which is which if you can bear the noise." } },
      choices = { { text = "Another thing.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Keep clear of the Agamand Mills to the north-west, where the Scourge still holds the family crypts, and of the Scarlet tower up the road from Brill. The murlocs along the north coast are a nuisance too, though only a fool gets killed by them twice." } },
      choices = { { text = "I'll keep to the road. Another thing.", next = "BACK" } },
    },
  },
  topics = {
    the_road = { { id = "ytp_road", text = "The road runs from Deathknell to the Undercity. I could walk it blind, and some nights I nearly do." } },
    brill = { { id = "ytp_brill", text = "Brill's the halfway house. Stop at the Gallows' End and tell them Lundmark sent you." } },
    background = { { id = "tp_bg", text = "I carried messages on these roads when Lordaeron lived, and I walk them still. Only the company has changed." } },
    _none = { { id = "tp_none", text = "If it isn't on my road, I can't tell you. Ask in Brill." } },
  },
}

-- Deathguard Kel: north of the Brill cemetery; the priest lesson Garments of Darkness mends him.
P:NPC {
  key = "deathguard_kel", id = TODO_NPC("Deathguard Kel"), name = "Deathguard Kel", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "gruff" }, values = { "dutiful", "brave" },
  notices = { "class" },
  impression = {
    first = "Deathguard Kel stands his ground north of Brill's cemetery with fresh cuts in his armour and no intention of going back to have them seen to. He would sooner bleed dust than leave a gap in the line.",
    third = "{name} met Deathguard Kel, who holds the ground north of the Brill cemetery.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "Mind where you tread, {class}. The dogs out here have the plague, and they don't care whose leg they take." },
    { id = "g_active", when = { questActive = TODO_QUEST("Garments of Darkness") }, text = "Beryl sent you, did she? Then do what you came to do, priest, because I've a hole in my side that's letting the wind in." },
    { id = "g_done", when = { questDone = TODO_QUEST("Garments of Darkness") }, text = "The priest who patched me up. I'm holding together well enough, and I told Beryl so." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, out past the graves. If you've any mending in you, there's always a Deathguard on this line who could use it." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A bowyer in Brill, believe it or not. I made longbows for the Lordaeron militia. Now I carry a sword because my fingers can't hold a string any more. The rot started in the fingertips, the way it does." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Does that weigh on you?", next = "yweigh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yweigh = {
      lines = { { id = "yweigh_x", text = "Every time I see a hunter at the inn. I'd give a great deal to hold a bow again. The apothecaries say they could stitch on a living hand, if I'd let them. What would you do?" } },
      choices = {
        { text = "Take the hand. The living owe us that much.", next = "BACK", reply = "That's the Society's view too. I'm not sure I'd sleep well, if I slept at all.", fx = { align = { light = -1 } } },
        { text = "Refuse. Some lines shouldn't be crossed.", next = "BACK", reply = "Aye. I'll keep my own rotten fingers, thank you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yberyl = {
      lines = { { id = "yberyl_x", text = "She sends her students out to mend us, and they practise on the line. It's a fair bargain. A Deathguard gets stitched, and a young priest learns what a darkhound bite looks like from the inside." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yrelief = {
      lines = { { id = "yrelief_x", text = "Every third night, a Deathguard called Dillinger comes up from Brill and takes the post. He talks to the hounds. I don't ask what they say back." } },
      choices = {
        { text = "Where do the Scarlet scouts come from?", next = "yscarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscarlet = {
      lines = { { id = "yscarlet_x", text = "Their scouts come from the tower to the north, the Scarlet Watch Post. They count our guards. I count their scouts. One day we'll both run out of numbers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deathguard Kel. I keep the ground north of the cemetery clear, so the hounds and the Scarlet scouts don't come wandering in among the headstones while decent folk are trying to rise." },
        { id = "yh_priest", when = { class = "PRIEST" }, text = "Deathguard Kel. A priest, at last. I keep the ground north of the cemetery clear, so the hounds and the Scarlet scouts don't wander in among the headstones. If you've a mending in you, I'll hold still for it." },
      },
      again = {
        { id = "h_again", text = "What else? I've a field to watch." },
        { id = "h_again2", text = "Speak up, then." },
      },
      choices = {
        { text = "You look wounded.", next = "wounds" },
        { text = "What comes at you out here?", next = "threats" },
        { text = "Why not fall back to Brill?", next = "fallback" },
        { text = "Who were you in life?", next = "ylife" },
        { text = "What do you think of Dark Cleric Beryl?", next = "yberyl" },
        { text = "Does anyone come to relieve you?", next = "yrelief" },
        { text = "Hold fast, Deathguard.", next = "END" },
      },
    },
    wounds = {
      lines = { { id = "w_default", text = "I am, and I'll be wounded again before the week is out. A darkhound opened my side at dusk, and I've stuffed the gap with a rag until Dark Cleric Beryl sends someone who can do better." } },
      choices = {
        { text = "Does it hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Less than it would have when I was breathing, and more than the apothecaries claim. What troubles me is the weakness, because a guard who can't lift his sword is only a scarecrow in good armour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threats = {
      lines = { { id = "t_default", text = "Hounds with the plague rotting them, bats the size of a dog, and now and then a Scarlet scout creeping down from their tower. The beasts I can manage alone, but the Scarlets come in threes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fallback = {
      lines = { { id = "f_default", text = "Because Deathguard Burgess has the town and I have the field, and if I leave it there's nothing between the cemetery and the hills. I'll go back to Brill when I'm relieved or when I'm in pieces." } },
      choices = { { text = "Stubborn. Something else.", next = "BACK" } },
    },
  },
  topics = {
    dark_cleric_beryl = { { id = "ytp_beryl", text = "Beryl sends her students to mend us. Most of them are getting better at it." } },
    brill_cemetery = { { id = "ytp_cem", text = "The cemetery's safe because I stand out here. That's the whole of the job." } },
    background = { { id = "tp_bg", text = "Deathguard of Brill, posted north of the graves. There's not much more to me than the post." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I watch a field, and the field doesn't gossip." } },
  },
}

-- Maquell Ebonwood: a Forsaken woman in Deathknell.
P:NPC {
  key = "maquell_ebonwood", id = TODO_NPC("Maquell Ebonwood"), name = "Maquell Ebonwood", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "deathknell" }, temper = { "cold", "sharp" }, values = { "practical", "proud" },
  notices = { "race" },
  impression = {
    first = "Maquell Ebonwood stands in Deathknell watching the newly risen stumble past, and she judges each of them in a glance. She speaks like a woman who once ran a household and resents having nothing left to run.",
    third = "{name} met Maquell Ebonwood, a sharp-tongued Forsaken woman of Deathknell.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Stand up straight, {class}. You may be dead, but there's no reason to look it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and with all your limbs. I had wondered." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Breathing, and in Deathknell of all places. You'll find the smell improves once you stop noticing it, or so I assume." },
  },
  start = "hello",
  nodes = {
    yhouse = {
      lines = { { id = "yhouse_x", text = "Lord Ebonwood's, near Lordamere Lake. I was his wife, not his housekeeper, though the servants would have said there was little difference. I kept forty rooms in order and a husband who never noticed." } },
      choices = {
        { text = "What became of Lord Ebonwood?", next = "ylord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylord = {
      lines = { { id = "ylord_x", text = "He fled south with the silver and the horses, and left me with the sick servants. I nursed them until I caught it too. I hear he lives in Stormwind now and tells everyone I died bravely. I did, rather." } },
      choices = {
        { text = "Find him. He owes you an answer.", next = "BACK", reply = "Oh, I intend to, one day. I'll wear my best gown and what's left of my face.", fx = { align = { honor = 1 } } },
        { text = "Forget him. Revenge is a waste of eternity.", next = "BACK", reply = "Perhaps. Though eternity is rather long, and I've nothing else to fill it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleft = {
      lines = { { id = "yleft_x", text = "My maid, Corinne, rose with me. She doesn't remember serving me. She calls me Maquell and borrows my combs, and I haven't the heart to correct her." } },
      choices = {
        { text = "How do you judge the newly risen?", next = "yrisen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychange = {
      lines = { { id = "ychange_x", text = "Everything. The newly risen sleep in the open, the crypt is filthy, and no one's swept the chapel steps since the plague. Give me a broom and three Deathguard, and I'd have it fit for the Dark Lady in a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yrisen = {
      lines = { { id = "yrisen_x", text = "I sort them as they pass, by habit. That one's a farmhand, that one was a clerk, that one never worked a day in her life. It's the only household I have left to run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Maquell Ebonwood. I woke on this hill some while ago and have stayed, because somebody ought to tell these poor creatures to brush the grave dirt off before they present themselves to an Executor." },
        { id = "yh_troll", when = { race = "Troll" }, text = "A troll, in Deathknell. Stand up straight, at least. One may be dead and still keep a decent posture." },
      },
      again = {
        { id = "h_again", text = "Yes? What else?" },
        { id = "h_again2", text = "Go on, I'm listening, after a fashion." },
      },
      choices = {
        { text = "Why stay in Deathknell?", next = "stay" },
        { text = "What do you make of the newly risen?", next = "risen" },
        { text = "You sound as though you miss your old life.", next = "miss" },
        { text = "Whose household did you run?", next = "yhouse" },
        { text = "Do you have anyone left?", next = "yleft" },
        { text = "What would you change about Deathknell?", next = "ychange" },
        { text = "Good day, madam.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Brill has a tavern and the Undercity has sewers, and I care for neither. Here at least there is a chapel roof, a little order, and a use for someone who remembers how things ought to be done." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "Half of them weep, a quarter of them rage, and the rest stand about waiting to be told what they are. I tell them they are Forsaken, and that the name is a fact and not a complaint." } },
      choices = {
        { text = "Which were you?", next = "which" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "I was the sort who looked at her own hands for a long while and then asked where she might find a comb. One keeps up standards, {class}, because once those go there is very little left of a person." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss having a table to set and people worth setting it for. But the people are ash and the table is firewood, so I'll thank you not to be sentimental on my behalf." } },
      choices = { { text = "As you wish. Something else.", next = "BACK" } },
    },
  },
  topics = {
    lordamere = { { id = "ytp_lord", text = "Our house stood by Lordamere Lake. I'm told it's a ruin now, which suits it." } },
    stormwind = { { id = "ytp_sw", text = "My husband lives in Stormwind. I don't, which I find gives me the advantage." } },
    background = { { id = "tp_bg", text = "I kept a respectable house in Tirisfal once. The plague had no respect for it." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, and I'm sure it's none of my concern." } },
  },
}

-- Maximillion: warlock trainer, Deathknell.
P:NPC {
  key = "maximillion", id = TODO_NPC("Maximillion"), name = "Maximillion", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "smooth", "cold" }, values = { "ambitious", "cunning" },
  notices = { "class" },
  impression = {
    first = "Maximillion teaches the shadow arts in the ruined chapel at Deathknell, and he teaches them like a man who enjoys being right. He was pleased to see a new student, and more pleased to tell me how many of the old ones had failed.",
    third = "{name} met Maximillion, who trains the Forsaken's warlocks in Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "You've wandered into a lesson, {class}. Sit quietly at the back, or better still, don't sit at all." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Come in, and let us find out whether death has left you with any talent worth the trouble of teaching." },
    { id = "g_scroll", when = { questActive = TODO_QUEST("Tainted Scroll") }, text = "You have my scroll, I see, and you had the sense to bring it rather than read it. That is a promising start." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and in one piece. I confess I had a small wager with Kayla on the matter." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" }, faction = "Alliance" },
      text = "I can smell the incense on you from here. The Light had a chapel on this very spot once, and you may judge by the roof how well it defended it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Maximillion, and I instruct those of the Forsaken who would rather command a demon than fear one. It is a narrow path with a long drop on either side, and I am told my manner on it is not encouraging." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "I am Maximillion, and for as long as you are on this hill you are my student. I shall teach you to bind what the living are too frightened to name, and you will oblige me by surviving the lessons." },
      },
      again = {
        { id = "h_again", text = "Was there another question? I do enjoy them, within reason." },
        { id = "h_again2", text = "Continue, and do try to be interesting." },
      },
      choices = {
        { text = "Why teach demon-binding to the newly risen?", next = "why" },
        { text = "How many of your students fail?", next = "fail" },
        { text = "Who is Kayla?", next = "kayla" },
        { text = "What is the first thing one of your students must learn?", next = "first", when = { class = "WARLOCK" } },
        { text = "The Light forbids what you teach.", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because we are few and our enemies are many, and the Dark Lady cannot afford to be squeamish about where her strength comes from. A mind that has already thrown off the Lich King is not easily mastered by an imp." } },
      choices = {
        { text = "The orcs trusted demons once.", next = "orcs" },
        { text = "Speak of something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "They did, and it is the most instructive mistake in the history of the craft. The orcs drank what the demons offered them, whereas a warlock of the Forsaken takes what he wants and offers nothing at all." } },
      choices = {
        { text = "And if the demon takes you instead?", next = "taken" },
        { text = "Speak of something else.", next = "BACK" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "Then you were a poor student, and Undertaker Mordo will see to what remains. I do not say it to be cruel, only so that you understand the art has no patience for the half-hearted." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "f_default", text = "Fewer than my reputation suggests, though I see no reason to correct it. Most who fail simply find they have no stomach for the work and go off to swing a sword for Dannal Stern, which is a kind of failure but not a fatal one." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    kayla = {
      lines = { { id = "k_default", text = "Kayla Smithe trains the demons, as I train those who hold their leashes. She has a firmer hand with an imp than anyone I have met, and she has never once let me forget that I said so." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "fi_default", text = "That a demon's name is a chain, and that whoever speaks it with enough will holds the other end. Your first servant will be an imp, which is a spiteful little thing, but it will teach you to keep your grip while something clever argues with you." } },
      choices = { { text = "I'll keep my grip, and tighten it. Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "The Light forbade a great many things in Lordaeron, and the plague was not among the things it prevented. I bear your faith no grudge, but you will understand if my people have stopped asking its permission." } },
      choices = { { text = "We'll not agree. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied things in life that I was careful not to mention in company. Death has made me a good deal more candid." } },
    warlocks = { { id = "tp_wl", text = "We take the demons' strength and give them only orders. Anyone who tells you it is the other way about has met the wrong warlocks." } },
    _none = { { id = "tp_none", text = "That lies outside my studies, and I do not pretend to knowledge I lack. It is a habit I recommend." } },
  },
}

-- Captured Mountaineer: a dwarf held in the cellar of the Gallows' End Tavern, Brill (Johaan's A New Plague).
P:NPC {
  key = "captured_mountaineer", id = TODO_NPC("Captured Mountaineer"), name = "Captured Mountaineer", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "gruff", "fierce" }, values = { "brave", "loyal" },
  notices = { "race" },
  impression = {
    first = "The Forsaken keep a dwarf in the cellar of the Gallows' End Tavern, a mountaineer of Ironforge taken somewhere on the road. He is thin and filthy and has not stopped cursing his captors since they brought him in.",
    third = "{name} met a captured dwarven mountaineer, held in the cellar of the Gallows' End Tavern in Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, friend. You've fought well, and the company remembers it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Say what you came to say, and then leave us to our work." },
    { id = "g_default", text = "Come tae gawp at the dwarf, have ye? Take a good long look, ye walking carcass, for I'm the liveliest thing in this whole stinking town." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "By my beard, a friendly face in this pit! Keep yer voice down, {g:lad|lass}, for the dead have ears even when they've nae got any." },
    { id = "g_pumpkin", when = { questActive = TODO_QUEST("A New Plague") }, text = "What's that ye've brought me, then? If it's food I'll take it, and if it's a trick I'm too hungry tae care." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still here and still breathing, which I'll wager annoys the lot of ye." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, keeping company with corpses! My grandfather fought yer kind at Blackrock Spire, and he'd have said ye'd fallen a long way since." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm a mountaineer of Ironforge, and that's all the name ye'll have from me. They took me on the road and chained me down here among the ale barrels, and nae a drop of it have they let me taste." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf, down here, and walking free! I'll nae ask how ye managed it, but if ye see Ironforge again, tell them a mountaineer held his tongue in Brill." },
      },
      again = {
        { id = "h_again", text = "Well? I've naught but time, and ye're wasting it." },
        { id = "h_again2", text = "Say yer piece, then." },
      },
      choices = {
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How were you taken?", next = "taken" },
        { text = "What do they want with you?", next = "want" },
        { text = "You're a long way from the mountains.", next = "mountains" },
        { text = "I can't free you, but I won't forget you.", next = "pity", when = { faction = "Alliance" } },
        { text = "Enjoy the cellar, dwarf.", next = "END" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "I was carrying word north through the hills when a pack of them rose up out of a ditch, quiet as fog. I put two back in the ground with my axe before the rest had me, and I count that a fair trade for one evening." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    want = {
      lines = { { id = "w_default", text = "They ask me nothing, which is what frets me. That apothecary of theirs comes down and looks me over like a butcher pricing a ram, and writes in his wee book, and goes away again." } },
      choices = {
        { text = "The apothecary is Johaan.", next = "johaan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    johaan = {
      lines = { { id = "j_default", text = "Aye, that'd be the one, with a stink of vinegar about him. A soldier I could spit at, but a man who never raises his voice and keeps taking notes is another matter, and I'll confess he turns my stomach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mountains = {
      lines = { { id = "m_default", text = "Aye, and I feel every mile of it. I'd give my left boot for one breath of cold air off Dun Morogh and a mug of anything that hasn't been within smelling distance of a corpse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pity = {
      lines = { { id = "p_default", text = "That's more than I'd hoped tae hear down here, and I'll nae ask ye tae throw yer life after mine. Get yerself out, and raise a mug in Ironforge for the one that didn't." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Mountaineer of Ironforge, and that's the whole of what I'll tell anyone in this town." } },
    _none = { { id = "tp_none", text = "Ye'll get nothing from me on that, nor on anything else." } },
  },
}

-- Ratslin Maime: a Forsaken who keeps to himself in Brill.
P:NPC {
  key = "ratslin_maime", id = TODO_NPC("Ratslin Maime"), name = "Ratslin Maime", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "sharp", "wry" }, values = { "cunning", "careful" },
  notices = { "stealth" },
  impression = {
    first = "Ratslin Maime keeps to the edge of things in Brill, where he can see who comes and goes without being part of it. He answered my questions with questions of his own until I gave up counting.",
    third = "{name} met Ratslin Maime, a watchful Forsaken who keeps to himself in Brill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "g_default", text = "You've a heavy tread, {class}. I heard you coming from the road, and so did everyone else in Brill worth worrying about." },
    { id = "g_back", when = { metBefore = true }, text = "The same boots again. Sit, if you're staying, because standing over a man makes him nervous." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Now you I didn't hear until you chose to be heard. Marion Call would have a use for feet like those, if she hasn't found you already." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "What did I do? What does any man do? I kept the toll at the Brill bridge, and I learned to tell a liar by his boots. Muddy heels meant he'd come the back way, and the back way meant he had a reason." } },
      choices = {
        { text = "Is the bridge still there?", next = "ybridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yheard = {
      lines = { { id = "yheard_x", text = "Heard? That the apothecaries in Brill are paying for rats. Live ones. Why would anyone want live rats? And why pay so well? I've stopped asking aloud." } },
      choices = {
        { text = "Should someone tell the Executor?", next = "yexec" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yexec = {
      lines = { { id = "yexec_x", text = "Tell Zygand? He'd thank me, or the apothecaries would thank me differently. Would you go to the Executor, or keep your own counsel?" } },
      choices = {
        { text = "Tell him. The town should know.", next = "BACK", reply = "Bold. I'll let you go first, and I'll watch what happens to you.", fx = { align = { order = 1 } } },
        { text = "Keep quiet. Information's worth more hidden.", next = "BACK", reply = "Now you're thinking like me. Shall we keep counsel together?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywho = {
      lines = { { id = "ywho_x", text = "Can't be trusted? Who can? The innkeeper waters the cider, the Deathguard sleep on watch, and the apothecaries smile too much. Of the lot, I trust the bats over the graveyard. At least they're honest about wanting blood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybridge = {
      lines = { { id = "ybridge_x", text = "The bridge? It's still there, isn't it? Nobody collects the toll. I stand by it some nights, out of habit, and wonder who'd pay." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ratslin Maime, and that's a name I give out sparingly. I keep my ears open in Brill, which is easy work, since a town full of the dead has very little to do except talk." },
        { id = "yh_rogue", when = { class = "ROGUE" }, text = "A rogue. You stepped over the loose board by the door. Who told you about it? Nobody? Then you're better than most." },
      },
      again = {
        { id = "h_again", text = "What else are you fishing for?" },
        { id = "h_again2", text = "Ask it quietly, whatever it is." },
      },
      choices = {
        { text = "What does a town of the dead talk about?", next = "talk" },
        { text = "Who are you listening for?", next = "listen" },
        { text = "You don't trust anyone, do you?", next = "trust" },
        { text = "What did you do before?", next = "ylife" },
        { text = "What have you heard lately?", next = "yheard" },
        { text = "Who in Brill can't be trusted?", next = "ywho" },
        { text = "I'll leave you to your listening.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "The Scarlets up the road, who took whose house, and what the apothecary is brewing in his corner that he won't discuss. Innkeeper Renee hears the most, though she tells it as stories, and you have to know which parts are true." } },
      choices = {
        { text = "What is the apothecary brewing?", next = "brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "Something he tests on hounds and murlocs, and lately on a dwarf they keep under the tavern. I haven't asked what it's for, because a man who asks the Royal Apothecary Society too many questions tends to become one of the answers." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "l_default", text = "Anyone who is somewhere they shouldn't be, saying something they oughtn't. I don't claim it's noble work, but Brill sleeps easier for it, and nobody has yet come to thank me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tr_default", text = "I trusted a king, a church and a city wall, and you can see for yourself how I was repaid. These days I trust what I've heard twice from people who dislike each other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    executor_zygand = { { id = "ytp_zyg", text = "Zygand runs Brill. Who runs Zygand? That's the better question." } },
    brill_bridge = { { id = "ytp_bridge", text = "I kept the toll on the bridge. Do you know how many lies cross a bridge in a year?" } },
    background = { { id = "tp_bg", text = "I made my living on other people's secrets when I breathed, and I've seen no cause to learn a new trade." } },
    _none = { { id = "tp_none", text = "If I knew, I'd want to know why you were asking." } },
  },
}
