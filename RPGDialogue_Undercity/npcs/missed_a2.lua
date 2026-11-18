-- Undercity folk the rosters missed, part two: the last of the ring's auctioneers, the War Quarter's apprentice smith,
-- fletcher, pit fighter and spectators, the Apothecarium's doctors and their zombie, and a few who only walk the city.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Auctioneer Yarly: auctioneer in the ring; bored beyond the reach of any lot.
P:NPC {
  key = "uc_auctioneer_yarly", id = TODO_NPC("Auctioneer Yarly"), name = "Auctioneer Yarly", title = "Auctioneer", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "bored", "deadpan" }, values = { "indifferent" },
  notices = { "purse" },
  impression = {
    first = "Auctioneer Yarly calls a legendary blade and a sack of linen in exactly the same voice, and neither one stirs him. He is polite, accurate and utterly unmoved, and his customers seem to find it restful.",
    third = "{name} met Auctioneer Yarly, the most unimpressed caller in the Undercity's auction ring.",
  },
  greetings = {
    { id = "g_default", text = "Yes, this is the auction house, and yes, I'm an auctioneer. I assume you want to buy something or sell something, as everyone does." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I'd say I was pleased, but we both know I'd be reciting it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's night, apparently. It makes no difference down here, and it makes none to me." },
  },
  notice = {
    { id = "n_epic", cat = "purse", when = { level = { min = 50 } },
      text = "That's fine equipment you're wearing. Somebody listed its twin this morning, and I called it between two crates of cloth." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Auctioneer Yarly. I've called every sort of lot there is, from dragon scales to boiled eggs, and I've come to the view that it is all much the same once it's written in the ledger." },
      },
      again = {
        { id = "h_again", text = "There's more? Very well, I'm listening, in my fashion." },
        { id = "h_again2", text = "Go on. I can't claim to have anything better to do." },
      },
      choices = {
        { text = "Does nothing impress you?", next = "impress" },
        { text = "Surely a rare blade stirs something.", next = "blade" },
        { text = "Why keep at it, then?", next = "why" },
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "I'll leave you to your ledger.", next = "END" },
      },
    },
    impress = {
      lines = { { id = "i_default", text = "I died, I got up again, and I was given a ledger. After the first two, I'm afraid the third and everything since has seemed rather ordinary." } },
      choices = {
        { text = "Fair enough, when you put it so.", next = "BACK" },
        { text = "What about the Dark Lady?", next = "lady" },
      },
    },
    lady = {
      lines = { { id = "l_default", text = "The Dark Lady freed my will from the Lich King, and for that I'd call any lot she asked, at any hour, without the fee. I simply wouldn't raise my voice while I did it." } },
      choices = { { text = "That's loyalty, of a sort. Something else.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "b_default", text = "A rare blade arrives, two people ruin themselves over it, and a month later it's back on my list because its owner met a rarer one. I've called the same sword four times, and it was no sharper on the fourth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because the alternative is standing in the Trade Quarter with nothing to read, and at least the ledger changes. Cain finds meaning in it and Naxxremis finds sport, and I find that it passes the time, of which I have a great deal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was someone or other in Lordaeron. I don't recall being any more excited about it then." } },
    _none = { { id = "tp_none", text = "I don't know, and I find I can live with that, so to speak." } },
  },
}

-- Basil Frye: apprentice blacksmith at the War Quarter forge beside James Van Brunt. (Forever: Camping 101: Blacksmithing.)
P:NPC {
  key = "uc_basil_frye", id = TODO_NPC("Basil Frye"), name = "Basil Frye", title = "Apprentice Blacksmith", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "quest",
  communities = { "undercity" }, temper = { "earnest", "dry" }, values = { "diligent" },
  notices = { "craft" },
  impression = {
    first = "Basil Frye works the small anvil at the War Quarter forge, in James Van Brunt's shadow, and teaches beginners the things the master no longer has patience for. He is proud of nails and hinges, and he'll explain why at length.",
    third = "{name} met Basil Frye, the apprentice blacksmith who teaches beginners at the War Quarter forge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks, and mind the quench barrel, because what's in it isn't quite water any longer. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back at the small anvil, are you? Good, since the master's is taken and he doesn't like to be watched." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "You've a smith's forearms, or what's left of them. Come and tell me what you've been making." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You dig your own ore, by the look of your hands. That's half the cost of the craft saved, and Brom Killian will have told you so already." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Basil Frye, apprentice to James Van Brunt, though I do most of the teaching for those who are just starting. He makes the swords the Deathguard carry, and I make everything that holds this city's doors on." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") },
          text = "So you've been sent to learn what a blacksmith brings to a camp. You've come to the right anvil, because Master Van Brunt would only tell you it was beneath him." },
      },
      again = {
        { id = "h_again", text = "What else? The iron needs another heat before I can touch it anyway." },
        { id = "h_again2", text = "Ask away, and I'll work the bellows while you do." },
      },
      choices = {
        { text = "What does a blacksmith bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") } },
        { text = "What is Van Brunt like to work under?", next = "master" },
        { text = "Nails and hinges sound like dull work.", next = "nails" },
        { text = "Does a dead man's hammer arm tire?", next = "dead" },
        { text = "What should a new smith make first?", next = "first", when = { profession = "Blacksmithing" } },
        { text = "Teach me the basics.", next = "BUSINESS" },
        { text = "Keep at it, Basil.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Iron for the fire, chiefly, which means a spit, a hook to hang the pot from, and stakes that won't split when you drive them into frozen ground. A camp without a smith is a few people shivering around something they can't cook on." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
    master = {
      lines = { { id = "m_default", text = "He is the best smith the Forsaken have, and he knows it, and he has not said a full sentence to me since the spring. I learn by watching his hands, which is how he says he learned, from a master who was worse." } },
      choices = {
        { text = "Will he ever make you a journeyman?", next = "journeyman" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journeyman = {
      lines = { { id = "j_default", text = "When I can draw out a blade without a single cold shut in it, he says, and I've been one flaw short for longer than I care to count. The dead can afford a long apprenticeship, but I'd still like it to end." } },
      choices = { { text = "One flaw is close. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    nails = {
      lines = { { id = "n_default", text = "They are dull, and they're the first thing I teach, because a smith who can't make a hundred nails alike can't make two sword edges alike either. Besides, this whole city is hung on iron, from the elevator chains to the sewer grates, and somebody has to keep it there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dead = {
      lines = { { id = "d_default", text = "It doesn't tire, but it doesn't mend either, so I swing with care and keep my wrists well wrapped. I've seen a smith's hand come off at the anvil, and he was a week sewing it back to his own satisfaction." } },
      choices = { { text = "A grim trade hazard. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Sharpening stones and weightstones, and plenty of them, because they teach you the heat and they always sell. Leave the fancy copper armour until your hammer lands where you're looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I shod horses in a village smithy when I was alive. The horses are bones now, and they still want shoeing, so I've lost less than most." } },
    camping = { { id = "tp_camp", text = "Iron to cook on and stakes that hold, that's a smith's share of a camp." } },
    _none = { { id = "tp_none", text = "That's not forge business, so I couldn't tell you. Try Master Van Brunt, if you catch him between heats." } },
  },
}

-- Benijah Fenner: weapon merchant in the War Quarter; arrows and quivers.
P:NPC {
  key = "uc_benijah_fenner", id = TODO_NPC("Benijah Fenner"), name = "Benijah Fenner", title = "Weapon Merchant", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "patient", "dry" }, values = { "exacting" },
  notices = { "class" },
  impression = {
    first = "Benijah Fenner sells arrows and quivers in the War Quarter, and he sights down each shaft before he lets it leave the stall. He holds that the Forsaken make the best archers, since nothing in them trembles.",
    third = "{name} met Benijah Fenner, who sells arrows and quivers in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Arrows by the bundle and quivers to carry them in. Every shaft on this stall flies straight, because I've checked each one myself." },
    { id = "g_back", when = { metBefore = true }, text = "Empty quiver again? That's a good sign in an archer, provided the arrows went somewhere useful." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, at last, and not another swordsman asking whether I sell whetstones. Come and look at the fletching." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { class = "HUNTER", race = "Troll" },
      text = "Your people throw as well as they shoot, I hear. I can't help you with axes, but I can keep that bow fed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Benijah Fenner. The others along this row sell things to hit people with, and I sell the means to do it from a sensible distance, which I've always thought the better bargain." },
      },
      again = {
        { id = "h_again", text = "Something more? I can talk and sort shafts at once." },
        { id = "h_again2", text = "Ask it. I've a bundle to check, and it will wait." },
      },
      choices = {
        { text = "What makes a good arrow?", next = "arrow" },
        { text = "Do the Forsaken make good archers?", next = "archers" },
        { text = "Who else sells weapons here?", next = "row" },
        { text = "Which quiver suits a long hunt?", next = "quiver", when = { class = "HUNTER" } },
        { text = "Show me your arrows.", next = "BUSINESS" },
        { text = "Good day, Fenner.", next = "END" },
      },
    },
    arrow = {
      lines = { { id = "a_default", text = "A straight shaft, a head that's seated true, and three feathers from the same wing, since a mixed fletching makes it wander. I roll each one across the counter, and anything that wobbles goes on the fire." } },
      choices = {
        { text = "Where do you get feathers down here?", next = "feathers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feathers = {
      lines = { { id = "f_default", text = "From the carrion birds over the Glades, which are plentiful and well fed, for reasons you can guess. It seems only fair that they give something back to the war." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    archers = {
      lines = { { id = "ar_default", text = "The best there are, to my mind. We've no breath to hold and no heartbeat to shake the string, and the Dark Lady herself was Ranger-General of Silvermoon before she was anything else. An archer could have no better queen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    row = {
      lines = { { id = "r_default", text = "Francis Eliot and Geoffrey Hartwell have the blades and the rest of the ironmongery, and Nicholas Atwood sells shot for those who prefer noise. Archibald will teach you to use any of it, for a fee." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quiver = {
      lines = { { id = "q_default", text = "The heaviest one you can afford, and I don't say that only as the man selling it. Out in Silverpine there's no stall to run back to, and an archer with an empty quiver is merely a slow swordsman." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a fletcher for the town militia, in the days when the worst thing to shoot at was a wolf. The targets have grown since, and so has the trade." } },
    _none = { { id = "tp_none", text = "That's wide of my mark, I'm afraid. Ask someone who deals in rumours." } },
  },
}

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
  },
  topics = {
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

-- Dan Golthas: apprentice leatherworker in the Rogues' Quarter, under Arthur Moore.
P:NPC {
  key = "uc_dan_golthas", id = TODO_NPC("Dan Golthas"), name = "Dan Golthas", title = "Apprentice Leatherworker", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "plain", "wry" }, values = { "diligent" },
  notices = { "craft" },
  impression = {
    first = "Dan Golthas scrapes hides in the Rogues' Quarter under Arthur Moore's eye and teaches the first stitches to anyone who asks. He is cheerful about a foul job, having lost his sense of smell at the same time as his pulse.",
    third = "{name} met Dan Golthas, the apprentice leatherworker who teaches beginners in the Rogues' Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Come in, and don't mind the vats. I'm told they're dreadful, though I've had to take that on trust for some years." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, vats and all. That's stronger than most of the living manage." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "Another one for the needle and awl. Show me your stitching, and I'll tell you what Arthur would say about it, only more kindly." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin your own, I can tell by the knife. Take the hide off in one piece, and Killian Hagey and I will both think better of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dan Golthas, apprentice leatherworker. Arthur Moore is the master here, and I'm the one who scrapes, soaks and stretches until he says a hide is fit for his knife, and who teaches the beginners in between." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "Dan Golthas, apprentice leatherworker. You've gone a little green, which I take it is the vats, so stand upwind of the door and we'll talk from there." },
      },
      again = {
        { id = "h_again", text = "What else? This hide needs another hour before I can turn it." },
        { id = "h_again2", text = "Ask on. Scraping is dull work, and I'm glad of the talk." },
      },
      choices = {
        { text = "How do you tan a hide down here?", next = "tanning" },
        { text = "What's Arthur Moore like as a master?", next = "arthur" },
        { text = "The whole shop seems to be Moores.", next = "moores" },
        { text = "What should a beginner stitch first?", next = "first", when = { profession = "Leatherworking" } },
        { text = "Teach me the basics.", next = "BUSINESS" },
        { text = "Good luck with the hides.", next = "END" },
      },
    },
    tanning = {
      lines = { { id = "t_default", text = "The same way it's done up top, with salt, bark and patience, except that we've no sun to dry by and so everything takes twice as long. The canal air keeps the leather supple, at least, and I'd not ask what else it does." } },
      choices = {
        { text = "Where do the hides come from?", next = "hides" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Darkhounds and plague bats from Tirisfal, mostly, and wolf and bear out of Silverpine when the hunters are having a good month. Arthur won't take anything the Scourge has been at, because it never cures properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arthur = {
      lines = { { id = "a_default", text = "Fair, exact, and very sparing with praise. When he says a seam will do, I know I've done the best work of my death, and I live on it for a month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    moores = {
      lines = { { id = "m_default", text = "Arthur teaches, Joseph sells the thread and salt, and Gillian sells the finished armour, so yes, it's a family concern. I'm the only one here who isn't a Moore, and they've been decent enough not to hold it against me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Light armour kits, a great heap of them, until your stitches are all one length. Then make yourself a pair of boots, because nothing teaches you about seams like walking on your own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a saddler's boy near Brill. The saddler didn't get up again, and I did, so I suppose the shop came to me in a manner of speaking." } },
    _none = { { id = "tp_none", text = "You've got me there. I know hides, and beyond hides I mostly nod." } },
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

-- Doctor Herbert Halsey: alchemy trainer in the Apothecarium.
P:NPC {
  key = "uc_halsey", id = TODO_NPC("Doctor Herbert Halsey"), name = "Doctor Herbert Halsey", title = "Alchemy Trainer", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "cold", "exacting" }, values = { "ambitious", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Doctor Herbert Halsey teaches alchemy in the Apothecarium and studies everyone who comes near him as if deciding where to cut. Other Forsaken lower their voices around him, and he appears to enjoy it.",
    third = "{name} met Doctor Herbert Halsey, the alchemy trainer whom even the Apothecarium finds unsettling.",
  },
  greetings = {
    { id = "g_default", text = "Do come in, and touch nothing. Everything on these benches is either valuable or fatal, and I shan't tell you which is which." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned intact. How gratifying, for I had wondered whether my last advice would take." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Hold out your hands, so that I may see how many burns you have earned and how many you have learned from." },
    { id = "g_living", when = { ["not"] = { race = "Scourge" } }, text = "A living specimen, and in good condition. Forgive me, I meant to say a living student, of course." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { ["not"] = { race = "Scourge" } },
      text = "Your colour is excellent and your pulse is visible at the throat. I do so rarely get to observe a working circulation at this distance." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Doctor Herbert Halsey, and I teach alchemy to those with steady hands and unsteady scruples. The work of this hall is the Dark Lady's, and I'll thank you to remember that before you ask what is in the vats." },
      },
      again = {
        { id = "h_again", text = "You have a further question? Then ask it precisely." },
        { id = "h_again2", text = "Continue. I can spare you until that retort comes to the boil." },
      },
      choices = {
        { text = "What is in the vats?", next = "vats" },
        { text = "People here seem afraid of you.", next = "afraid" },
        { text = "How do you find your apprentice, Doctor Marsh?", next = "marsh" },
        { text = "What separates a good alchemist from a dead one?", next = "craft", when = { profession = "Alchemy" } },
        { text = "I've come to learn alchemy.", next = "BUSINESS" },
        { text = "Good day, Doctor.", next = "END" },
      },
    },
    vats = {
      lines = { { id = "v_default", text = "I did warn you. They hold the Society's answer to the Lich King, in several stages of promise, and anyone who needs to know more than that already does." } },
      choices = {
        { text = "And what do you test it on?", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "On whatever the Deathguard brings us, which is usually wearing red and shouting about the Light. They arrive certain that they are righteous, and they leave as a line in my notes, and I find the second state far more useful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    afraid = {
      lines = { { id = "a_default", text = "They are, and I've done nothing to earn it beyond being thorough. I ask what a thing is made of and I do not stop asking when the answer becomes unpleasant, and it seems that even the dead find that uncomfortable in a colleague." } },
      choices = { { text = "Thoroughness has its uses. Something else.", next = "BACK" } },
    },
    marsh = {
      lines = { { id = "m_default", text = "Doctor Marsh is diligent, which is the kindest word I have for him. He follows a recipe to the letter and is astonished every time, and so I have given him the beginners to teach, where astonishment does no harm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "c_default", text = "Notes, and nothing else. The gifted ones mix by instinct, and it serves them splendidly until the day it doesn't, whereas the dull one who wrote down every measure can tell me afterwards exactly what killed his colleague." } },
      choices = { { text = "I'll keep better notes. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a physician, and the plague taught me more in a week than the college had in twenty years. I've been its student ever since." } },
    _none = { { id = "tp_none", text = "I haven't examined the matter, and I do not offer opinions on what I haven't opened up." } },
  },
}

-- Doctor Marsh: apprentice alchemist in the Apothecarium; Algernon keeps him in herbs.
P:NPC {
  key = "uc_marsh", id = TODO_NPC("Doctor Marsh"), name = "Doctor Marsh", title = "Apprentice Alchemist", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "anxious", "fussy" }, values = { "diligent" },
  notices = { "craft" },
  impression = {
    first = "Doctor Marsh teaches beginners' alchemy in the Apothecarium and checks every measure three times, with one eye always on Doctor Halsey's bench. He holds the title of doctor a little tightly, as if someone might ask for it back.",
    third = "{name} met Doctor Marsh, the nervous apprentice alchemist who teaches beginners in the Apothecarium.",
  },
  greetings = {
    { id = "g_default", text = "One moment, please, I'm counting drops, and if I lose my place I shall have to begin the whole flask again. There, that's done, and what did you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Good, I'd been afraid it was Doctor Halsey coming to look over my shoulder again." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "A fellow alchemist! Do you measure by weight or by the drop? No, don't tell me, because I'll only start doubting myself." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Is that peacebloom on your gloves? Algernon brings mine, but he does sometimes bring them in a posy, which is no help to anyone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Doctor Marsh, apprentice alchemist, and yes, one may be both a doctor and an apprentice in this hall. I teach those who are new to the craft, and Algernon keeps my bench in herbs so that I needn't leave it." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I have a moment before the next step." },
        { id = "h_again2", text = "Do ask, only quietly, because sound carries to Doctor Halsey's end of the room." },
      },
      choices = {
        { text = "How is Algernon as a helper?", next = "algernon" },
        { text = "Doctor Halsey makes you nervous.", next = "halsey" },
        { text = "What do you teach a beginner?", next = "teach" },
        { text = "By the drop. Scales lie in this damp.", next = "drop", when = { profession = "Alchemy" } },
        { text = "I'd like to learn the basics.", next = "BUSINESS" },
        { text = "I'll let you count, Doctor.", next = "END" },
      },
    },
    algernon = {
      lines = { { id = "a_default", text = "He is slow, and he is never wrong, which is more than I can say of the quick ones. I ask for silverleaf and earthroot in a certain order, and they come in that order every single day, with those dreadful flowers of his nodding over the top." } },
      choices = {
        { text = "Do you know who the flowers are for?", next = "flowers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flowers = {
      lines = { { id = "f_default", text = "I asked him once, and he became so distressed at not remembering that I've never asked again. I simply tell him they're very nice, and he seems to work the better for it." } },
      choices = { { text = "That was kind of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    halsey = {
      lines = { { id = "h2_default", text = "Please don't say it so loudly. He is a brilliant man, and I am grateful for the post, and I would be more grateful still if he didn't look at me as though he were wondering how I'd respond to a new solvent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Healing draughts for the living and simple elixirs for everyone, with clean glass and a steady flame. It isn't the work that will win the war, I know that, but every apothecary in this hall began by boiling peacebloom without setting fire to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drop = {
      lines = { { id = "d_default", text = "That is exactly what I've always said, and nobody in this hall will listen! The damp gets into the pans and adds a grain here and there, whereas a drop is a drop wherever you let it fall." } },
      choices = { { text = "Hold to it, Doctor.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'd nearly finished my studies when the plague came, so I've been almost qualified for a very long time now." } },
    _none = { { id = "tp_none", text = "Oh, I couldn't say, and I'd hate to tell you something wrong. Perhaps one of the senior apothecaries knows." } },
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
      lines = { { id = "a_default", text = "You stay inside the reach of its hook, so that it can't get a swing, and you cut the stitching and not the meat. One of us holds its eye and the other opens the seams, and it comes apart like a badly sewn sack." } },
      choices = { { text = "I'll remember that in the Plaguelands.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a spear for Lordaeron, and I died holding it. They gave me a sword when I got up, and I've not been idle since." } },
    _none = { { id = "tp_none", text = "I don't know. I watch the gate, and that takes all the attention I have." } },
  },
}
