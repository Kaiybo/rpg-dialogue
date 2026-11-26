-- Undercity folk the rosters missed, part two: the last of the ring's auctioneers, the War Quarter's apprentice smith,
-- fletcher, pit fighter and spectators, the Apothecarium's doctors and their zombie, and a few who only walk the city.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Boyle: zombie in the Apothecarium, a flask always in hand.
P:NPC {
  key = "uc_boyle", id = TODO_NPC("Boyle"), name = "Boyle", gender = "male",
  bible = "bibles/missed_a.md", role = "worker", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "slow", "placid" }, values = { "obedient" },
  notices = { "craft" },
  impression = {
    first = "Boyle is a zombie who stands in the Apothecarium holding a flask very level, as he was told to. He talks about the flask and about very little else, and he seems content with that.",
    third = "{name} met Boyle, the zombie who minds a flask in the Apothecarium.",
  },
  greetings = {
    { id = "g_default", text = "Boyle is holding the flask, and he must not spill it. You can talk, but please do not bump Boyle." },
    { id = "g_back", when = { metBefore = true }, text = "You came before, and Boyle did not spill it then either." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You smell like the green room. You are a potion person, so you know why Boyle has to hold still." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Boyle holds the flask for the doctors until they want it. It is a careful job, and they gave it to Boyle because Boyle does not get bored." },
      },
      again = {
        { id = "h_again", text = "Boyle is still here, and the flask is still full." },
        { id = "h_again2", text = "You can ask another thing. Boyle is not going anywhere." },
      },
      choices = {
        { text = "What's in the flask?", next = "flask" },
        { text = "How long have you been holding it?", next = "long" },
        { text = "Do you know Algernon?", next = "algernon" },
        { text = "Do you remember anything before the flask?", next = "by_before" },
        { text = "Hold steady, Boyle.", next = "END" },
      },
    },
    flask = {
      lines = { { id = "f_default", text = "It is green, and it is warm, and sometimes it moves when Boyle is not moving. The doctors said not to drink it, and Boyle said he would not, and he has not." } },
      choices = {
        { text = "What happens if it spills?", next = "spill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spill = {
      lines = { { id = "s_default", text = "There was another one who held the flask before Boyle, and he spilled it. Now there is a mark on the floor over there, and the doctors walk around it." } },
      choices = { { text = "Then I'll stand well back. Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "Boyle does not count the days, because the lamps down here never go out. He thinks it has been a long time, since the doctor with the loud voice has changed his coat twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    algernon = {
      lines = { { id = "a_default", text = "Algernon is the other slow one, and he has the flowers. He walks past with the herbs and says good morning to Boyle every time, even when it is not morning, and Boyle likes that." } },
      choices = { { text = "It's good to have a friend. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    by_before = {
      lines = { { id = "by_b_default", text = "Boyle remembers a cart, and a horse that did not like Boyle. Then there was a long walking, with many others, and somebody shouting inside Boyle's head. Then the shouting stopped, and the doctors came, and the flask came." } },
      choices = {
        { text = "Who was shouting inside your head?", next = "by_shout" },
        { text = "That shouting was the Lich King. I heard it too.", next = "BACK", when = { race = "Scourge" }, reply = "You heard it too? Then you know why Boyle likes the quiet flask better." },
        { text = "Something else.", next = "BACK" },
      },
    },
    by_shout = {
      lines = { { id = "by_s_default", text = "Boyle does not know the name. It was very big and very cold, and it wanted Boyle to bite people. Boyle did not want to bite people, but Boyle did anyway. Now Boyle holds the flask, and nobody wants Boyle to bite anybody." } },
      choices = {
        { text = "Do you like the doctors better than the shouting?", next = "by_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    by_stance = {
      lines = { { id = "by_st_default", text = "The doctors are not kind, but they are quiet. They say Boyle is useful. Boyle thinks useful is a good thing to be. Do you think useful is a good thing to be?" } },
      choices = {
        { text = "Yes, Boyle. Doing your task well is a fine thing.", next = "BACK", reply = "Boyle thinks so too. Boyle will hold the flask very well.", fx = { align = { order = 1 } } },
        { text = "You should choose your own task, Boyle.", next = "BACK", reply = "Choose? Boyle will think about that. Slowly, so the flask does not spill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge_x", text = "The big cold shouting. Boyle does not want to hear it again." } },
    advice = { { id = "tp_advice_x", text = "Hold it level. That is all Boyle knows, and it is enough." } },
    background = { { id = "tp_bg", text = "Boyle woke up, and somebody put a flask in his hand. That is all of it." } },
    _none = { { id = "tp_none", text = "Boyle does not know that. Boyle knows the flask." } },
  },
}

-- Cedric Stumpel: wanders the Rogues' Quarter.
P:NPC {
  key = "uc_cedric_stumpel", id = TODO_NPC("Cedric Stumpel"), name = "Cedric Stumpel", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wary", "sly" }, values = { "secretive" },
  notices = { "class" },
  impression = {
    first = "Cedric Stumpel drifts about the Rogues' Quarter with no stall and no errand, and he looks at a stranger's purse before he looks at the stranger's face. He answers a question with another one more often than not.",
    third = "{name} met Cedric Stumpel, who wanders the Rogues' Quarter and gives very little away.",
  },
  greetings = {
    { id = "g_default", text = "You're walking loudly for this quarter, friend. Was it me you wanted, or only somebody like me?" },
    { id = "g_back", when = { metBefore = true }, text = "The same face twice in one quarter. I shall start to think you're following me." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "I didn't hear you come up, and I don't say that to many. What does the trade want with old Cedric?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've been keeping your purse on the inside since you came down the stairs. Good, because somebody taught you properly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Cedric Stumpel, and that's as much as I give away for nothing. I walk this quarter because I like to know who else is walking it, and tonight that seems to be you." },
      },
      again = {
        { id = "h_again", text = "Still here? Ask, then, and I'll see whether it's worth an answer." },
        { id = "h_again2", text = "Go on. I've walked this round a thousand times, and it can spare me a minute." },
      },
      choices = {
        { text = "What do you do down here?", next = "work" },
        { text = "You watch people very closely.", next = "watch" },
        { text = "Who runs this quarter?", next = "runs" },
        { text = "Does Mennet Carkad have work for one of us?", next = "trade", when = { class = "ROGUE" } },
        { text = "Mind how you go, Cedric.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "I walk, I listen, and now and then I mention what I've heard to people who find it useful. It's not a trade with a title, which is rather the best thing about it." } },
      choices = {
        { text = "Mention it to whom?", next = "whom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whom = {
      lines = { { id = "wh_default", text = "Now that would be giving it away for nothing, wouldn't it? I'll say only that the Deathstalkers like to know who comes and goes, and that I've never yet been short of boot leather." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "wa_default", text = "It's an old habit, from a life spent in places where you counted the exits before you ordered a drink. Dying cured me of the drink, but the counting seems to have stayed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    runs = {
      lines = { { id = "r_default", text = "Nobody does, officially, and Mennet Carkad does in every way that matters. The trainers teach, the Moores tan their hides, the Van Talens blow things up, and all of them step aside when he walks by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trade = {
      lines = { { id = "t_default", text = "He always has, for hands that are quick and mouths that stay shut. Go and stand where he can see you, say little, and let him decide what you're good for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've been a good many things in a good many ports, and I answer for none of them now. Death wipes a slate very clean." } },
    _none = { { id = "tp_none", text = "I might know, and I might not. Either way, it isn't the kind of thing I say aloud." } },
  },
}

-- Chloe Curthas: spectator at the War Quarter's fighting pit; kin to Angela Curthas, the warrior trainer.
P:NPC {
  key = "uc_chloe_curthas", id = TODO_NPC("Chloe Curthas"), name = "Chloe Curthas", gender = "female",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "sharp", "critical" }, values = { "competitive" },
  notices = { "class" },
  impression = {
    first = "Chloe Curthas watches the pit fights with her arms folded and finds fault with every stroke. She has a warrior trainer for a kinswoman, and she has borrowed all of the opinions and none of the lessons.",
    third = "{name} met Chloe Curthas, a sharp-tongued spectator at the War Quarter's fighting pit.",
  },
  greetings = {
    { id = "g_default", text = "If you've come to watch, watch Tyler's feet. Everyone here stares at the blades, and they miss the whole of it." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the rail? Then you've sense, or at least a taste for blood, and either will do." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. Good, then you can tell Andrew that I'm right about footwork, since he won't hear it from me." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Angela would have you run the stairs in that armour before she taught you a thing. She says a tired fighter is the only honest one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Chloe Curthas. I come for the fighting, and I stay for the pleasure of telling Andrew Hartwell he has backed the wrong man again. Tyler is the better of the two, and anyone with eyes can see it." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while they're resetting the sand." },
        { id = "h_again2", text = "Go on, but I'm watching the gate while I listen." },
      },
      choices = {
        { text = "Why Tyler over Edward?", next = "tyler" },
        { text = "Curthas. You're related to the trainer?", next = "angela" },
        { text = "Have you ever fought down there yourself?", next = "fought" },
        { text = "Footwork wins fights. You're right.", next = "right", when = { class = "WARRIOR" } },
        { text = "Enjoy the bout.", next = "END" },
      },
    },
    tyler = {
      lines = { { id = "t_default", text = "Edward stands his ground and trades blows, which looks very fine until the abomination comes out. Tyler never stops moving, and against a thing with a cleaver on a chain, that's all that keeps your arms attached." } },
      choices = {
        { text = "Has the abomination ever won?", next = "abom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abom = {
      lines = { { id = "a_default", text = "Not against those two together, not yet. Brother Malach keeps stitching it back up in the hope that one day it will, and I think half this crowd comes to be here when it does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    angela = {
      lines = { { id = "an_default", text = "Angela Curthas is my kin, and she trains the Dark Lady's warriors across the quarter. She says I've the eye for it and none of the discipline, and she says it at every family occasion we still have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fought = {
      lines = { { id = "f_default", text = "No, and don't smirk at me for it. I know exactly what should be done down there, and I know just as well that my arms wouldn't do it, which is more self-knowledge than Andrew has ever managed." } },
      choices = { { text = "Knowing it is half of it. Something else.", next = "BACK" } },
    },
    right = {
      lines = { { id = "r_default", text = "Thank you! Say it again, and louder, in the direction of the man with the big mouth on my left." } },
      choices = { { text = "I'll leave that war to you.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Curthas family kept arms for the old kingdom, and Angela keeps them for the new one. I keep the commentary." } },
    _none = { { id = "tp_none", text = "I've no idea. Ask me about a fight, and I'll tell you who ought to have won it." } },
  },
}

-- Davitt Hickson: strolls the Magic and Trade Quarters with Selina Pickman and Reginald Grimsford.
P:NPC {
  key = "uc_davitt_hickson", id = TODO_NPC("Davitt Hickson"), name = "Davitt Hickson", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "idle", "sardonic" }, values = { "sociable" },
  notices = { "race" },
  impression = {
    first = "Davitt Hickson walks the Magic and Trade Quarters with two companions and no evident purpose, passing remarks on everything he sees. He treats the Undercity as a promenade and its citizens as the entertainment.",
    third = "{name} met Davitt Hickson, who strolls the Undercity with Selina Pickman and Reginald Grimsford.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Fall in beside us if you like, since we're only walking, and we've been round twice already." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again. We've done another circuit since, and I can report that nothing has improved." },
    { id = "g_living", when = { ["not"] = { race = "Scourge" } }, text = "A living visitor, in our humble sewer! Selina, Reginald, do come and see, and try not to stare at the breathing." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, come down from all that red dust. You'll find our climate damp and our company drier." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Davitt Hickson. Selina Pickman, Reginald Grimsford and I take a turn through the Magic Quarter and the Trade Quarter each day, because one must do something with eternity, and we were none of us brought up to work." },
      },
      again = {
        { id = "h_again", text = "What else shall we talk of? We've the whole ring ahead of us." },
        { id = "h_again2", text = "Do go on. Reginald has run out of things to say, and I welcome the change." },
      },
      choices = {
        { text = "You just walk, all day?", next = "walk" },
        { text = "Tell me about your companions.", next = "friends" },
        { text = "What's worth seeing on your round?", next = "sights" },
        { text = "What do you make of your living allies?", next = "allies", when = { ["not"] = { race = "Scourge" } } },
        { text = "Enjoy your walk.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "We do, and I'll thank you not to sound so shocked. We used to take the air in the palace gardens above, and since the gardens are ash and the air is no use to us, we've kept the walking and dropped the rest." } },
      choices = {
        { text = "The Dark Lady has no task for you?", next = "task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task = {
      lines = { { id = "t_default", text = "I dare say she will find one, and when she does, I shall go wherever I'm pointed, since she is the only reason I have a will to waste. Until then I consider it my duty to keep up the city's conversation." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "Selina has a warlock for a relation and a tongue to match, and Reginald agrees with whoever spoke last. They are the best company I have, and I should be dreadfully bored in the ground without them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sights = {
      lines = { { id = "s_default", text = "Stop at the Magic Quarter when Jezelle Pruitt is showing her pupils a demon, which is as good as a play. Then come round to the Trade Quarter and watch the auctioneers, who are a comedy when the bidding turns sour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    allies = {
      lines = { { id = "a_default", text = "You're loud, you're warm, and you track mud down the elevators, and I confess the city is livelier for it. Don't repeat that to Selina, who maintains that she finds you all unbearable." } },
      choices = { { text = "Your secret is safe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I had a small estate and no occupation, in the old kingdom. I've lost the estate and kept the lack of occupation." } },
    _none = { { id = "tp_none", text = "I couldn't say, and I make it a rule never to look things up. Ask someone industrious." } },
  },
}

-- Edrick Killian: walks the War Quarter and the inner ring with Mattie Alred; kin to Brom and Sarah Killian.
P:NPC {
  key = "uc_edrick_killian", id = TODO_NPC("Edrick Killian"), name = "Edrick Killian", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "dry" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Edrick Killian walks the War Quarter and the inner ring beside Mattie Alred, talking as they go about ore, weather and the stupidity of the living. He comes from a mining family and looks at the Undercity's walls as a miner looks at a seam.",
    third = "{name} met Edrick Killian, who walks the Undercity's inner ring with Mattie Alred.",
  },
  greetings = {
    { id = "g_default", text = "Walk along if you want a word, because Mattie and I don't stop, or we'd never start again." },
    { id = "g_back", when = { metBefore = true }, text = "You again. We've been round the ring a time or two since, and it's the same ring." },
    { id = "g_miner", when = { profession = "Mining" }, text = "That's a pick on your back, and a used one. You'll have met my kinsman Brom, then, and been lectured for your pains." },
  },
  notice = {
    { id = "n_dwarfish", cat = "craft", when = { profession = "Mining" },
      text = "You've rock dust in your seams that no laundress will ever shift. It's the mark of the trade, and I say it with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Edrick Killian. That's Mattie Alred beside me, and we take the ring and the War Quarter at a walking pace every day. It keeps the joints from seizing, and it lets us see what the city is up to." },
      },
      again = {
        { id = "h_again", text = "What else, then? Keep up while you ask it." },
        { id = "h_again2", text = "Go on. Mattie doesn't mind, and I mind only a little." },
      },
      choices = {
        { text = "Killian. Like the mining trainer?", next = "family" },
        { text = "What's the city up to, then?", next = "city" },
        { text = "You look at these walls like a mason.", next = "walls" },
        { text = "Where's the good ore near here?", next = "ore", when = { profession = "Mining" } },
        { text = "I'll let you walk.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Brom teaches the mining and Sarah sells the picks, and I'm the Killian who put his down. Three of us got up out of the ground again, which is fitting enough for a family that spent its whole life under it." } },
      choices = {
        { text = "Why did you put the pick down?", next = "pick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick = {
      lines = { { id = "p_default", text = "I spent forty years in the dark below Lordaeron and then woke up in a grave, and it seemed to me I'd had my fill of holes. So now I walk in a city that's one great hole, and Mattie has the grace not to point it out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "The War Quarter's louder than it was, with more recruits at the dummies and more steel going out the gates. Somebody upstairs means to push east at the Scarlets or the Scourge before long, and I'd not care to wager which." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    walls = {
      lines = { { id = "w_default", text = "These were the old king's sewers and crypts, cut by men who expected nobody to look at them. The stone's sound, mind you, and it's held a ruined palace on its back all these years without a crack that I can find." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "o_default", text = "There's copper all through the Tirisfal hills if you follow the ridges, and tin once you cross into Silverpine. Brom will tell you the same, and take a deal longer about it." } },
      choices = { { text = "My thanks. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A miner, and a miner's son. The family's still in the trade, and I'm still in the family, and that's the sum of it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Mattie, who hears more than I do, or says she does." } },
  },
}

-- Edward: fights in the War Quarter pit beside Tyler against whatever Brother Malach sends in.
P:NPC {
  key = "uc_edward", id = TODO_NPC("Edward"), name = "Edward", gender = "male",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "terse", "steady" }, values = { "disciplined" },
  notices = { "class" },
  impression = {
    first = "Edward fights in the War Quarter's pit beside a man named Tyler, against captives, ghouls and worse, and he talks only in the gaps between them. He keeps his eyes on the gate the whole time he is speaking.",
    third = "{name} met Edward, one of the two fighters in the War Quarter's pit.",
  },
  greetings = {
    { id = "g_default", text = "Say it quickly, because Brother Malach doesn't wait for conversations to finish before he opens that gate." },
    { id = "g_back", when = { metBefore = true }, text = "You're back between rounds again. You've a knack for the timing, I'll give you that." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "You know what this is, by the way you stand. Keep to the edge of the sand, and we'll talk until the gate moves." },
  },
  notice = {
    { id = "n_living", cat = "class", when = { ["not"] = { race = "Scourge" } },
      text = "You're alive, so stay out of the middle. The abomination doesn't check whose side a warm body is on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Edward. Tyler and I hold the sand, and Brother Malach sends things in to see whether we still can. It's training, and it's a show for that lot at the rail, and I try to think of it only as the first." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it." },
        { id = "h_again2", text = "Go on, while the gate's still shut." },
      },
      choices = {
        { text = "What does he send in?", next = "sends" },
        { text = "How do you and Tyler fight together?", next = "tyler" },
        { text = "What do you make of the crowd?", next = "crowd" },
        { text = "How do you bring down the abomination?", next = "abom", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Watch the gate, Edward.", next = "END" },
      },
    },
    sends = {
      lines = { { id = "s_default", text = "Three human captives to begin with, then a ghoul and a zombie, and an abomination to finish. It's the same order each time, and it's the same things the Deathguard meets in the field, which is the reason for it." } },
      choices = {
        { text = "The captives. Does that sit easily?", next = "captives" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captives = {
      lines = { { id = "c_default", text = "They're given steel and they come at us meaning it, so it's a fight and not a butchering. I end it quickly, which is the one mercy the sand allows me, and I don't look at the rail while I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tyler = {
      lines = { { id = "t_default", text = "I stand and he moves. Whatever comes through the gate has to choose between the one who won't give ground and the one it can't catch, and it mostly chooses wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cr_default", text = "They shout advice, and none of it has ever been of use. One of them has backed me every bout this season and still tells me how to hold my shield, and I'll thank you not to encourage him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    abom = {
      lines = { { id = "a_default", text = "You stay inside the swing of its chain, where the cleaver can't reach you, and you cut the stitching and not the meat. One of us holds its eye and the other opens the seams, and it comes apart like a badly sewn sack." } },
      choices = { { text = "I'll remember that in the Plaguelands.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a spear for Lordaeron, and I died holding it. They gave me a sword when I got up, and I've not been idle since." } },
    _none = { { id = "tp_none", text = "I don't know. I watch the gate, and that takes all the attention I have." } },
  },
}
