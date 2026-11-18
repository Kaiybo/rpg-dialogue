-- Undercity folk the first passes missed (part 2 of 3): the strollers Reginald Grimsford and Selina Pickman,
-- apprentice tailor Rhiannon Davis, the pit-side crowd (Richard Van Brunt, Riley Walker, Robert Gossom),
-- book dealer Salazar Bloch, the researcher Samantha Shackleton, the suppliers Samuel Van Brunt and Sarah Killian,
-- and Sergeant Houser at the training dummies. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Reginald Grimsford: strolls the Magic and Trade Quarters with Selina Pickman and Davitt Hickson.
P:NPC {
  key = "uc_reginald_grimsford", id = TODO_NPC("Reginald Grimsford"), name = "Reginald Grimsford", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "pompous", "dry" }, values = { "proud" },
  notices = { "race" },
  impression = {
    first = "Reginald Grimsford strolls between the Magic Quarter and the Trade Quarter with Selina Pickman and Davitt Hickson, as a gentleman once took the air in the capital's gardens. He holds opinions on everything he passes and delivers them without being asked.",
    third = "{name} met Reginald Grimsford, a Forsaken gentleman who strolls the Undercity's quarters.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. We are taking our constitutional, such as it is, and you may accompany us as far as the bridge if you've something to say." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again on the promenade. I was just explaining to Selina what is wrong with the auction house, and I've barely begun." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, in the cellars of Lordaeron's palace. My grandfather would have fainted, and I confess I find that the most agreeable thing about you." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Reginald Grimsford. Selina, Davitt and I walk from the Magic Quarter to the Trade Quarter and back each day, because a gentleman who stops taking exercise soon stops being a gentleman, dead or otherwise." },
      },
      again = {
        { id = "h_again", text = "Was there something further? We do have a schedule to keep." },
        { id = "h_again2", text = "Proceed, and walk on my left, if you would." },
      },
      choices = {
        { text = "A gentleman, in the sewers?", next = "gentleman" },
        { text = "What's wrong with the auction house?", next = "auction" },
        { text = "Tell me about your companions.", next = "companions" },
        { text = "Enjoy your walk.", next = "END" },
      },
    },
    gentleman = {
      lines = { { id = "g2_default", text = "The Grimsfords had a house near the palace and a pew in the cathedral, and I see no reason to forget it merely because both are rubble. One may live under a city and still decline to behave like something that crawled out from beneath it." } },
      choices = {
        { text = "Does anyone down here care about pews?", next = "pews" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pews = {
      lines = {
        { id = "p_scourge", when = { race = "Scourge" }, text = "You ought to, as a child of Lordaeron yourself. The Dark Lady gave us back our will, and I intend to spend mine on manners, since the living have made it plain they'll spare us none of theirs." },
        { id = "p_default", text = "Very few, and I count that among the city's failings. The Dark Lady gave us back our will, and I intend to spend mine on manners, since somebody ought to." },
      },
      choices = { { text = "Well said, in its way. Something else.", next = "BACK" } },
    },
    auction = {
      lines = { { id = "a_default", text = "It is run by goblins, to begin with, who shout prices at one another in the Trade Quarter as if this were a fish market. In my day one sent a servant, and the servant was discreet." } },
      choices = {
        { text = "And yet you walk there every day.", next = "every_day" },
        { text = "Something else.", next = "BACK" },
      },
    },
    every_day = {
      lines = { { id = "e_default", text = "One must know what one disapproves of, or the disapproval lacks authority. Besides, Davitt likes to look at the bat handlers, and Selina likes to look at who's borrowing from the bank." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    companions = {
      lines = { { id = "c_default", text = "Selina Pickman is the sharpest of us and pretends otherwise, and Davitt Hickson passes a remark on everyone we meet, which saves me the trouble. We fell in together because we were the only three on the ring walking at a civilised pace." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Grimsford of Capital City, with a house near the palace. The house is gone, but the name has outlasted better things." } },
    _none = { { id = "tp_none", text = "I couldn't say, and I make it a rule not to speculate in public. Ask Selina; she hears everything." } },
  },
}

-- Rhiannon Davis: apprentice tailor in the Magic Quarter; teaches beginners alongside Victor Ward.
P:NPC {
  key = "uc_rhiannon_davis", id = TODO_NPC("Rhiannon Davis"), name = "Rhiannon Davis", title = "Apprentice Tailor", gender = "female",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "quiet", "dry" }, values = { "craft", "patient" },
  notices = { "profession" },
  impression = {
    first = "Rhiannon Davis is an apprentice tailor who teaches the first stitches in the Magic Quarter, a few paces from Victor Ward and his humming. She pins as she talks and has never yet pricked herself, or has never yet noticed.",
    third = "{name} met Rhiannon Davis, an apprentice tailor who teaches beginners in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "If you want to learn to sew, sit there and hold this bolt. If you don't, you may hold it anyway while you tell me what you came for." },
    { id = "g_back", when = { metBefore = true }, text = "Let me see your seams before you say anything. Yes, I thought as much; we shall talk about tension." },
  },
  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "You've threaded a needle before, I can see it in how you look at my hems. That saves us the first afternoon, which is always the dullest." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Rhiannon Davis, apprentice tailor. I teach linen and the beginnings of wool, and when you've outgrown me there are better hands in this quarter than mine to take you on." },
      },
      again = {
        { id = "h_again", text = "Go on. I can listen while I pin." },
        { id = "h_again2", text = "Something else? Mind the shears as you lean in." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "What do the Forsaken need tailors for?", next = "need" },
        { text = "How do you get on with Victor Ward?", next = "victor" },
        { text = "Do cloth-wearers make better students?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Good day, Rhiannon.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "More than the living do, if you think on it. We came out of the ground in whatever we were buried in, and a shroud is a poor thing to face the Scarlet Crusade in, so the first thing a new Forsaken wants after a weapon is a decent robe." } },
      choices = {
        { text = "What did you rise in?", next = "rose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rose = {
      lines = { { id = "r_default", text = "My sister's second-best dress, which was too short in the sleeve and had been let out badly at the waist. I unpicked it and made it over within the week, and I think that was when I knew I still had a trade." } },
      choices = { { text = "A good way to begin again. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    victor = {
      lines = { { id = "v_default", text = "Well enough, since we teach the same lessons and split the students between us. He hums while he cuts, the same four bars over and over, and I've found that if I count my stitches aloud he loses his place and stops." } },
      choices = {
        { text = "And where do your students buy cloth?", next = "cloth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "c_default", text = "Millie Gregorian has the thread and dye, and she'll look you over before she sells you anything fine. Angela Ward sells patterns, and she is Victor's sister, though you would do well to let her be the one to mention it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    caster = {
      lines = { { id = "ca_default", text = "They make more interested ones, since they're the ones who'll be wearing it when the arrows come. A mage who has hemmed her own robe knows exactly how little stands between her and a Scarlet crossbow, and she sews accordingly." } },
      choices = { { text = "That is a sobering thought. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I took in mending in a village of Lordaeron. It's the same work here, though the customers hold stiller for a fitting." } },
    _none = { { id = "tp_none", text = "I know cloth and thread, and that is neither. Ask one of the masters; they like to be asked." } },
  },
}

-- Richard Van Brunt: cheering at the War Quarter pit; kin to James and Samuel Van Brunt.
P:NPC {
  key = "uc_richard_van_brunt", id = TODO_NPC("Richard Van Brunt"), name = "Richard Van Brunt", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "loud", "blunt" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Richard Van Brunt cheers the fighters in the War Quarter with a smith's arms folded across his chest. His kinsmen James and Samuel work the forges nearby, and he seems to be the Van Brunt who'd sooner watch iron used than make it.",
    third = "{name} met Richard Van Brunt, who watches the fights in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Watch Edward's shield arm, stranger. That's Van Brunt steel on it, and it has not buckled yet." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another round? You've come at the right time, for Malach's about to bring out something big." },
  },
  notice = {
    { id = "n_smith", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "That's a fair weight of plate you carry, and you carry it properly. James would want to look at the rivets, so don't walk past the forge unless you've an hour to lose." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Richard Van Brunt. My family makes the arms in this quarter, and I come to see them tested, because a blade that looks well on the rack and fails in the pit is no advertisement for anybody." },
      },
      again = {
        { id = "h_again", text = "What else? Say it between bouts, if you can." },
        { id = "h_again2", text = "Go on, I'm listening with one ear." },
      },
      choices = {
        { text = "Who's the better fighter, Edward or Tyler?", next = "better" },
        { text = "You don't work the forge yourself?", next = "forge" },
        { text = "Why does Malach use human captives?", next = "captives" },
        { text = "I'll leave you to the fight.", next = "END" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "Edward is steadier and Tyler is quicker, and the abomination doesn't care which, so they've learned to fight as a pair. If you made me choose, I'd take Edward, but don't say so near Robert Gossom unless you want an argument that lasts till the next bout." } },
      choices = {
        { text = "Robert backs Tyler, then.", next = "robert" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robert = {
      lines = { { id = "r_default", text = "Loudly, and with no evidence at all. He and I have stood at this rail for longer than either of us can reckon, and I don't believe we have agreed on a single blow in all that time." } },
      choices = { { text = "It sounds like you enjoy it. Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "f_default", text = "I can swing a hammer, but James has the art of it and Samuel has the head for stock, so there was little left for me but to carry things and have opinions. I've become very good at the opinions." } },
      choices = {
        { text = "What do your kinsmen think of that?", next = "kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "James says nothing, because James only speaks about metal. Samuel says I'm the reason the family has a reputation among the fighters, and I've chosen to take that as praise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    captives = {
      lines = {
        { id = "c_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "Because it's humans our recruits will meet in Hillsbrad and at the Scarlet Monastery, and they had better know how one moves. I see that it sits ill with you, {race}, but nobody asked the captives' kin to burn our farms either." },
        { id = "c_default", text = "Because it's humans our recruits will meet in Hillsbrad and at the Scarlet Monastery, and they had better know how one moves. A straw dummy doesn't beg or bolt, and a soldier needs to have seen both before it matters." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Van Brunts were smiths in Lordaeron and we're smiths below it. I'm the one who watches the work get used." } },
    _none = { { id = "tp_none", text = "I know steel and fighting, friend, and that's neither one. Try somebody who reads." } },
  },
}

-- Riley Walker: in the crowd at the War Quarter pit; the one who wagers.
P:NPC {
  key = "uc_riley_walker", id = TODO_NPC("Riley Walker"), name = "Riley Walker", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "sly", "cheerful" }, values = { "cunning" },
  notices = { "purse" },
  impression = {
    first = "Riley Walker watches the War Quarter fights with a few coppers always riding on the outcome. He claims to have a system, and by his own account the system is right about half the time.",
    third = "{name} met Riley Walker, who wagers on the fights in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Hush a moment, I've four coppers on how long the zombie lasts, and Gossom is trying to distract me." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again. I lost on the last bout, so if you've brought any luck with you, stand a little closer." },
  },
  notice = {
    { id = "n_rogue", cat = "purse", when = { class = "ROGUE" },
      text = "I saw you count the purses along this rail before you looked at the fight. Mine is the thin one, so you'll do better elsewhere." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Riley Walker. I don't bet on who wins, because Edward and Tyler always win, so I bet on how long each thing lasts and whether Tyler gets knocked down first. It keeps the afternoons from all being the same afternoon." },
      },
      again = {
        { id = "h_again", text = "What else? Keep one eye on the pit for me while you ask." },
        { id = "h_again2", text = "Go on, the next one isn't up yet." },
      },
      choices = {
        { text = "What's your system?", next = "system" },
        { text = "Are you kin to Christoph Walker?", next = "christoph" },
        { text = "Who do you bet against?", next = "against" },
        { text = "Good luck with your coppers.", next = "END" },
      },
    },
    system = {
      lines = { { id = "s_default", text = "The captives last as long as they keep running, the ghoul lasts until Edward gets bored, and the abomination lasts exactly as long as it takes Tyler to remember that it has a back. I time them by counting, since nobody down here owns a clock that works." } },
      choices = {
        { text = "And the system loses half the time?", next = "loses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loses = {
      lines = { { id = "l_default", text = "It does, because Brother Malach doesn't always call them up in the same humour, and an angry ghoul throws off all my figures. I've asked him to be more consistent, and he looked at me as if I were the next thing in the pit." } },
      choices = { { text = "I'd stop asking him. Something else.", next = "BACK" } },
    },
    christoph = {
      lines = { { id = "c_default", text = "The warrior trainer? We share the name, and he's had the decency never to say whether we share more. He told me once that I'd make a fair soldier if I watched less and swung more, which I took as proof we're not related." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    against = {
      lines = { { id = "a_default", text = "Robert Gossom, mostly, who bets with his heart and always backs Tyler to stay on his feet. Marla Fowler won't wager at all, and says shouting is its own reward, which is easy to say when you're as good at it as she is." } },
      choices = {
        { text = "Gossom must owe you a fortune.", next = "owes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    owes = {
      lines = { { id = "o_default", text = "We've passed the same eleven coppers back and forth since we started, near enough. I think of it as one purse that takes turns living in two pockets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I ran errands and laid small wagers in Capital City. The stakes haven't grown, but I've a great deal more time to lose them in." } },
    _none = { { id = "tp_none", text = "I'd not put a copper on my answer to that. Ask somebody with better odds of knowing." } },
  },
}

-- Robert Gossom: in the crowd at the War Quarter pit; Tyler's loudest backer.
P:NPC {
  key = "uc_robert_gossom", id = TODO_NPC("Robert Gossom"), name = "Robert Gossom", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "loud", "warm" }, values = { "loyal" },
  notices = { "class" },
  impression = {
    first = "Robert Gossom bellows for Tyler from the edge of the War Quarter's fighting floor and takes every blow the man receives as a personal insult. He is as loyal a follower as any fighter ever had, and probably louder than the fighter would like.",
    third = "{name} met Robert Gossom, Tyler's loudest supporter in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Did you see that? Tyler had it by the throat! Well, he had it, anyway, and that's what counts." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Come and stand on my side, Van Brunt's got too many people agreeing with him today." },
  },
  notice = {
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc warrior! Your people know a proper fight when they see one. Tell this lot that Tyler's the one to watch, go on." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Robert Gossom's the name, and Tyler's my man. Edward's sound enough, I'll not hear him run down, but Tyler fights as though he's enjoying it, and there's little enough of that in this city." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before the next one comes up!" },
        { id = "h_again2", text = "Go on, I'm all ears, or one ear, at least." },
      },
      choices = {
        { text = "Why Tyler over Edward?", next = "tyler" },
        { text = "What do the fights accomplish?", next = "point" },
        { text = "This pit would be small by Orgrimmar's measure.", next = "orc", when = { race = "Orc" } },
        { text = "Cheer him on for me.", next = "END" },
      },
    },
    tyler = {
      lines = { { id = "t_default", text = "Because he gets knocked flat and gets up laughing, every time. I was in the Lich King's ranks beside men who couldn't get up for themselves at all, and I'll tell you there's nothing finer to watch than a dead man doing it by choice." } },
      choices = {
        { text = "Have you ever spoken to him?", next = "spoken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spoken = {
      lines = { { id = "s_default", text = "Once, when he came up out of the pit for a new blade. I said 'well fought,' and he said 'which part?' and I couldn't think of an answer, and I've been rehearsing a better one ever since." } },
      choices = { { text = "You'll get another chance. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    point = {
      lines = { { id = "p_default", text = "They make Deathguards, friend. Brother Malach raises what they'll meet out there, the living and the Scourge both, so that the first time one of ours sees an abomination coming it's not on the road to Andorhal with nobody watching his back." } },
      choices = {
        { text = "And the crowd is part of the training?", next = "crowd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowd = {
      lines = { { id = "c_default", text = "I like to think so. A soldier ought to know there's somebody who wants him to come back, even if it's only six idlers at a rail, and Marla Fowler alone is worth a regiment's cheering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "o_default", text = "So I hear, and I'd give a good deal to see it, though they say the sun out there would do my skin no favours. You'd not find an abomination in an Orgrimmar ring, mind, so we've that over you." } },
      choices = { { text = "I'll grant you the abomination. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a carter in life and a corpse in the Scourge after. These days I stand here and shout for Tyler, and it's the best of the three." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me who's winning; that I know." } },
  },
}

-- Salazar Bloch: book dealer in the Magic Quarter.
P:NPC {
  key = "uc_salazar_bloch", id = TODO_NPC("Salazar Bloch"), name = "Salazar Bloch", title = "Book Dealer", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "dry" }, values = { "learned" },
  notices = { "class" },
  impression = {
    first = "Salazar Bloch deals in books in the Magic Quarter, most of them salvaged from the ruined city overhead. He handles each volume by its edges and winced when I set my elbow near one.",
    third = "{name} met Salazar Bloch, the book dealer of the Undercity's Magic Quarter.",
  },
  greetings = {
    { id = "g_default", text = "You may browse, provided your hands are dry. I have lost too many good bindings to canal slime to be polite about it." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope you read the last one before you came looking for another, though few do." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "You read for your living, I can tell, for you looked at the spines before you looked at me. That is the proper order, and I'm not offended." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Salazar Bloch, dealer in books. Lordaeron had libraries, private and royal, and when the city fell nobody thought to loot the shelves, so I have spent my death carrying them down the stairs an armful at a time." },
      },
      again = {
        { id = "h_again", text = "Was there another question? Do keep your voice down near the vellum." },
        { id = "h_again2", text = "Yes? I'm cataloguing, but I can spare a moment." },
      },
      choices = {
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "You salvage them from the ruins yourself?", next = "salvage" },
        { text = "Who buys books in the Undercity?", next = "buyers" },
        { text = "Have you anything from Dalaran?", next = "dalaran", when = { class = "MAGE" } },
        { text = "Good day, Bloch.", next = "END" },
      },
    },
    salvage = {
      lines = { { id = "s_default", text = "I do, by night, with a sack and a lantern I daren't light near the paper. The damp has had four years at them, and the rats rather less time, but a surprising number were only waiting for somebody to care." } },
      choices = {
        { text = "What's the best thing you've found?", next = "best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "A household account book from a merchant's cellar, every page of it bread and candles and a daughter's music lessons. It is worth nothing to a mage and I will never sell it, because it's the only book I own in which nobody dies." } },
      choices = { { text = "I can see why you keep it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The mages and warlocks of this quarter, the apothecaries when their own notes fail them, and Samantha Shackleton, who reads everything and returns it with corrections in the margin. I've told her the margins are not hers, and she corrects that too." } },
      choices = {
        { text = "And the orcs and trolls?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "h_tauren", when = { race = "Tauren" }, text = "Your people are the best of the visitors, I'll say that freely. A tauren asked me for a history of this land last month and then sat on my floor and read it through, turning the pages with two fingers as gently as a nurse." },
        { id = "h2_default", text = "An orc bought an atlas once, and looked at the map of Lordaeron for a long time without speaking. I had expected to dislike him, and found I couldn't quite manage it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Scraps, and I price them accordingly. The Kirin Tor keep what's left of their city under a dome and their books with it, so what reaches me came out in refugees' pockets before the end, and Bethor Iceshard usually has first refusal." } },
      choices = { { text = "I'll look through the scraps. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a bookshop off the market square in Capital City. The square is ash now, so I brought the trade downstairs." } },
    _none = { { id = "tp_none", text = "I haven't a volume on that, which pains me to admit. Try the mages; they hoard what they don't sell to me." } },
  },
}

-- Samantha Shackleton: researcher in the Magic Quarter; speaks Gutterspeak by habit. Kin to Pierce Shackleton.
P:NPC {
  key = "uc_samantha_shackleton", id = TODO_NPC("Samantha Shackleton"), name = "Samantha Shackleton", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "distracted", "dry" }, values = { "learned", "curious" },
  notices = { "race" },
  impression = {
    first = "Samantha Shackleton reads and mutters over her books in the Magic Quarter, in the Forsaken's own tongue, and has to be coaxed out of it for anyone else. She shares a name and a habit of distraction with Pierce Shackleton, the mage trainer.",
    third = "{name} met Samantha Shackleton, a Forsaken researcher of the Undercity's Magic Quarter.",
  },
  greetings = {
    { id = "g_default", when = { race = "Scourge" }, text = "One moment, I'm in the middle of a sentence, and it's a long one. There, now, what did you want?" },
    { id = "g_living", text = "Oh. You'll want me to speak Orcish, I suppose, so bear with me, for I think in Gutterspeak and the words come out in the wrong order." },
    { id = "g_back", when = { metBefore = true }, text = "You were here before, and I was on this same page. That reflects worse on the page than on me, I assure you." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You've been listening to me mutter, and you didn't follow a word of it. That's rather the reason we have a tongue of our own, though I mean nothing by it." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Samantha Shackleton. I read for the mages of this quarter, which means I go through what was saved from Lordaeron's shelves and tell them which parts are true, and they thank me and then ignore the list." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? I've lost my place already, so you may as well ask." },
        { id = "h_again2", text = "Go on, but slowly, I'm translating as I listen." },
      },
      choices = {
        { text = "What are you reading now?", next = "reading" },
        { text = "Why keep to Gutterspeak?", next = "gutter" },
        { text = "Are you Pierce Shackleton's kin?", next = "pierce" },
        { text = "It's good to hear our own tongue spoken.", next = "ours", when = { race = "Scourge" } },
        { text = "I'll let you read.", next = "END" },
      },
    },
    reading = {
      lines = { { id = "r_default", text = "A court physician's notes on the first weeks of the plague, written before anyone knew the grain was the cause. He was very nearly right three times, and each time he talked himself out of it, which is the most instructive thing I've read all year." } },
      choices = {
        { text = "What use is that now?", next = "use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      lines = { { id = "u_default", text = "The Royal Apothecary Society is making a plague of its own, and I should like them to be better at reasoning than the man who failed to stop the last one. I send my notes to the Apothecarium, and I'm told that somebody there uses them to level a table." } },
      choices = { { text = "Their loss. Something else.", next = "BACK" } },
    },
    gutter = {
      lines = { { id = "g2_default", text = "It is the one thing we made for ourselves after we woke, patched together from the Common we were raised in and whatever else lay to hand. I find I'm more exact in it, and I'd sooner be exact than understood by passers-by." } },
      choices = {
        { text = "Even by your allies?", next = "allies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    allies = {
      lines = { { id = "a_default", text = "The Horde took us in when nobody else would, and I'm grateful in an orderly sort of way. But gratitude is one thing and conversation another, and I've yet to meet an orc who wanted to hear about a dead physician's handwriting." } },
      choices = { { text = "You might be surprised. Something else.", next = "BACK" } },
    },
    pierce = {
      lines = { { id = "p_default", text = "I am, and you can tell us apart because he loses his place in a lecture and I lose mine in a book. He teaches the mages their spells, and I tell him afterward which of his sources were wrong, so we remain on excellent terms." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ours = {
      lines = { { id = "o_default", text = "Isn't it? There are words in it for things the living never needed to name, such as the hour one woke in the dark, and I intend to write them all down before somebody decides we should stop using them." } },
      choices = { { text = "Write them down. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Shackletons were scholars in Lordaeron, of the sort who were never invited to Dalaran. I've more to read now than I ever had in life." } },
    _none = { { id = "tp_none", text = "I've not come across it in anything I've read, and I'd sooner say so than invent it. Ask Pierce, though he may invent it." } },
  },
}

-- Samuel Van Brunt: blacksmithing supplies in the War Quarter; kin to James and Richard.
P:NPC {
  key = "uc_samuel_van_brunt", id = TODO_NPC("Samuel Van Brunt"), name = "Samuel Van Brunt", title = "Blacksmithing Supplies", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "steady", "dry" }, values = { "practical", "craft" },
  notices = { "profession" },
  impression = {
    first = "Samuel Van Brunt sells flux, coal and hammers beside the War Quarter forges, where his kinsman James teaches the trade. He keeps the family's accounts and seems to be the only Van Brunt who knows what any of it costs.",
    third = "{name} met Samuel Van Brunt, who sells blacksmithing supplies in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Flux, coal and a smith's hammer, if you've not got one. James will teach you what to do with them, and I'll see that you don't run out halfway." },
    { id = "g_back", when = { metBefore = true }, text = "More coal already? Good, that means the forge has been hot, and a hot forge is all this family asks of anyone." },
  },
  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "There's scale burned into your sleeves, so you've stood at an anvil. Buy your flux by the stack, for you'll use more than you think, and everyone does." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Samuel Van Brunt. James makes the steel and I make sure there's something to make it with, and Richard stands at the pit telling everyone whose steel it is. Between the three of us it comes out as a business." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm in no hurry, the coal keeps." },
        { id = "h_again2", text = "Ask away, I'm only counting flux." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "What does the War Quarter forge make most?", next = "makes" },
        { text = "Any advice for a new smith?", next = "advice", when = { profession = "Blacksmithing" } },
        { text = "Good day, Samuel.", next = "END" },
      },
    },
    coal = {
      lines = { { id = "c_default", text = "Some comes up the coast by way of the zeppelins and the goblins, at prices I won't repeat, and some we dig out of the old city's own cellars. Lordaeron laid in a good deal for winters it never got to have." } },
      choices = {
        { text = "That's a grim sort of inheritance.", next = "inherit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inherit = {
      lines = { { id = "i_default", text = "It is, but it burns the same, and I'd sooner it armed a Deathguard than sat in the dark. Everything we have down here was somebody's once, and I've stopped apologising to the coal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    makes = {
      lines = { { id = "m_default", text = "Blades and plate for the Deathguard, first and always, and after that whatever the trainers break on their recruits. Sergeant Houser's lot go through practice swords faster than James can temper them." } },
      choices = {
        { text = "Does James mind the waste?", next = "james" },
        { text = "Something else.", next = "BACK" },
      },
    },
    james = {
      lines = { { id = "j_default", text = "James minds nothing so long as he is holding tongs. He works bare-handed in the fire now, since it can't hurt him, and I have to remind him that the leather on a hilt is not so lucky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Make sharpening stones and plain copper until you're sick of them, and then make some more. Brom Killian and my neighbour Sarah will keep you in ore and picks, and the rest is only time, which you may have noticed we've plenty of." } },
      choices = { { text = "I'll get to work. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Van Brunts had a smithy on the capital's east side. I kept its books then, and I keep them now, with fewer living customers." } },
    _none = { { id = "tp_none", text = "That's not in my ledgers. Ask James if it's made of metal, and somebody else if it isn't." } },
  },
}

-- Sarah Killian: mining supplies in the War Quarter; kin to Brom and Edrick Killian.
P:NPC {
  key = "uc_sarah_killian", id = TODO_NPC("Sarah Killian"), name = "Sarah Killian", title = "Mining Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "blunt" }, values = { "practical" },
  notices = { "profession" },
  impression = {
    first = "Sarah Killian sells picks and miners' gear in the War Quarter, beside Brom Killian and his lessons. She has the family's good humour about being underground and tests each pick's edge on her own thumbnail.",
    third = "{name} met Sarah Killian, who sells mining supplies in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Mining picks, good and heavy. Brom will tell you where to swing one, but you'll want to buy it from me first." },
    { id = "g_back", when = { metBefore = true }, text = "You've worn out a pick already? That's what I like to hear, from a customer and from a miner." },
  },
  notice = {
    { id = "n_miner", cat = "profession", when = { profession = "Mining" },
      text = "There's rock dust in the creases of your knuckles, and it will never come out, as you'll learn. Welcome to the trade; it's the only one that suits a people who've been buried." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Sarah Killian. The Killians have always gone into the ground one way or another, and I sell the tools for doing it on purpose. Brom teaches, Edrick wanders about the ring, and I mind the stock." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The picks won't sell themselves, but they'll wait." },
        { id = "h_again2", text = "Go on, I've a moment between customers." },
      },
      choices = {
        { text = "Let me see your picks.", next = "BUSINESS" },
        { text = "What makes a good pick?", next = "pick" },
        { text = "Why does Edrick wander?", next = "edrick" },
        { text = "Where should a new miner start?", next = "start", when = { profession = "Mining" } },
        { text = "Good day.", next = "END" },
      },
    },
    pick = {
      lines = { { id = "p_default", text = "A head that's heavier than you think you want and a haft that won't split when you hit a seam wrong, which you will. The living choose a light one to spare their arms, and since ours don't ache, I sell us the heavy sort." } },
      choices = {
        { text = "Is there any use for one in a fight?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "More than one miner in Silverpine has found out there is, when a worgen came into the cut behind him. I'd not recommend it over a sword, but it's a comfort to have something in your hands already." } },
      choices = { { text = "I'll bear that in mind. Something else.", next = "BACK" } },
    },
    edrick = {
      lines = { { id = "e_default", text = "He says he's looking over the city's stonework, and he does stop to tap a wall now and then, so perhaps he is. He walks with Mattie Alred, and the two of them talk the whole way round, so I get the city's news a lap after everyone else." } },
      choices = {
        { text = "And Brom?", next = "brom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brom = {
      lines = { { id = "b_default", text = "Brom is the head of us, and he would dig out the whole of Lordaeron's foundations if the Dark Lady let him. He makes the same joke about having already been put in the ground to every student, and I laugh every time, because he's family." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    start = {
      lines = { { id = "s_default", text = "Copper in the hills of Tirisfal, round the edges where the rock shows through, and tin once you get down into Silverpine. Smelt what you find at the forge here, and sell the bars to Samuel Van Brunt's customers if you've no use for them." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Killians were quarrymen north of the capital, and they buried us in ground we'd dug ourselves. We found it funnier than most did." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, unless it's ore or iron. Ask Brom; he's always glad of a reason to stop working." } },
  },
}

-- Selina Pickman: strolls the Magic and Trade Quarters with Reginald Grimsford and Davitt Hickson.
P:NPC {
  key = "uc_selina_pickman", id = TODO_NPC("Selina Pickman"), name = "Selina Pickman", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "sharp", "amused" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Selina Pickman walks between the Magic Quarter and the Trade Quarter with Reginald Grimsford and Davitt Hickson, saying less than Reginald and seeing a good deal more. She collects other people's business the way some collect buttons.",
    third = "{name} met Selina Pickman, who walks the Undercity's quarters and misses very little.",
  },
  greetings = {
    { id = "g_default", text = "Don't mind Reginald, he's only clearing his throat for the next speech. You may talk to me while he does it." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. You came in by the lift and went to the bank first, which tells me most of what I wanted to know." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You'll have met Luther Pickman, then, who shares my name and none of my manners, and I'll thank you not to judge the family by him." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Selina Pickman. I walk with Reginald and Davitt because one learns more on the move than standing still, and this city tells you everything if you pass the same doors at the same hour each day." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I may even tell you." },
        { id = "h_again2", text = "Go on, Reginald's still talking to himself." },
      },
      choices = {
        { text = "What has the city told you lately?", next = "told" },
        { text = "How do you put up with Reginald?", next = "reginald" },
        { text = "Are you related to Luther Pickman?", next = "luther" },
        { text = "What did you learn about me?", next = "me" },
        { text = "Good day, Selina.", next = "END" },
      },
    },
    told = {
      lines = { { id = "t_default", text = "That the apothecaries are sending more couriers to the bat handlers than they did a month ago, and that the mages have noticed and are pretending they haven't. I also know which auctioneer waters her ink, but I'm saving that one." } },
      choices = {
        { text = "What do you do with all this?", next = "do_with" },
        { text = "Something else.", next = "BACK" },
      },
    },
    do_with = {
      lines = { { id = "d_default", text = "Nothing whatever, and that is the pleasure of it. In life I kept a boarding house and had to act on what I knew, and now I may simply know it, like a miser with a chest she never opens." } },
      choices = { { text = "A harmless vice. Something else.", next = "BACK" } },
    },
    reginald = {
      lines = { { id = "r_default", text = "He was somebody once and it's the only thing he has left, so I let him be somebody at me for an hour a day. Davitt laughs with him and I argue with him, and between us he gets exactly the audience he needs." } },
      choices = { { text = "That's kinder than it sounds. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    luther = {
      lines = { { id = "l_default", text = "Distantly, and I keep it distant. He teaches warlocks to be frightening, and I've always held that anyone who has to work at it that hard isn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    me = {
      lines = {
        { id = "m_scourge", when = { race = "Scourge" }, text = "That you still check your reflection in the canal when you cross a bridge, as the newly risen do. It passes in a year or so, dear, and then you'll miss minding." },
        { id = "m_default", text = "That you look up at the ceiling more than a Forsaken would, and breathe through your mouth near the canal. You'll get used to both, and the smell is worse in summer, I'm told by those who can still smell." },
      },
      choices = { { text = "You do miss very little. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a boarding house in the capital and knew every lodger's business. I've a larger house now and a good many more lodgers." } },
    _none = { { id = "tp_none", text = "Now that I haven't heard, and it irritates me. Give me a week of walking and ask again." } },
  },
}

-- Sergeant Houser: drills Alyssa Blaye, Eldin Partridge and Travist Bosk at the War Quarter's training dummies.
P:NPC {
  key = "uc_sergeant_houser", id = TODO_NPC("Sergeant Houser"), name = "Sergeant Houser", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "loud", "stern" }, values = { "dutiful", "loyal" },
  notices = { "class" },
  impression = {
    first = "Sergeant Houser drills three recruits at the War Quarter's straw dummies and can be heard from the canal. He soldiered for Lordaeron before he soldiered for the Dark Lady, and he shouts as if the Scourge were already on the stairs.",
    third = "{name} met Sergeant Houser, who drills the Dark Lady's recruits in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of the dummies, {class}, unless you want Bosk to take your ear off by mistake. He's improving, but not that quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you've come to watch, watch quietly, because these three need no more distractions than they've got." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold that weapon as though you've used it on something that hit back. Good; stand where my recruits can see what that looks like." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Sergeant Houser. I've got Blaye, Partridge and Bosk for as long as it takes to make Deathguards of them, and I mean to send the Dark Lady three soldiers and not three more corpses for the Lich King to pick up." },
      },
      again = {
        { id = "h_again", text = "What else? Make it brisk; Partridge has stopped moving his feet again." },
        { id = "h_again2", text = "Speak up, and keep clear of the swings." },
      },
      choices = {
        { text = "How are your recruits shaping up?", next = "recruits" },
        { text = "You served Lordaeron before this.", next = "served" },
        { text = "Straw dummies won't teach them much.", next = "dummies" },
        { text = "Have you a word for a warrior of the Horde?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Carry on, Sergeant.", next = "END" },
      },
    },
    recruits = {
      lines = { { id = "r_default", text = "Blaye hits hard enough and thinks too little, Partridge thinks plenty and hits like a clerk, and Bosk does whatever I shouted last, a full second late. Put the three in one body and I'd have a fair soldier." } },
      choices = {
        { text = "Which will make it?", next = "make_it" },
        { text = "Something else.", next = "BACK" },
      },
    },
    make_it = {
      lines = { { id = "m_default", text = "All three, because I'll not pass them otherwise. I marched boys out of Lordaeron who weren't ready, and then I met some of them again on the other side of a Scourge line, and I don't intend to train anyone for that twice." } },
      choices = { { text = "They're lucky to have you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    served = {
      lines = { { id = "s_default", text = "I did, a sergeant of foot under the old king, and I drilled men in the yard that's rubble over our heads now. The banner has changed and so has my complexion, but a shield wall is still a shield wall." } },
      choices = {
        { text = "Is the Dark Lady a better commander?", next = "lady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = { { id = "l_default", text = "She was Ranger-General of Silvermoon and held a kingdom's border against Arthas with next to nothing, so she knows what it costs to lose soldiers. The old king's son knew it too, and decided he didn't mind, and that's all the comparison I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dummies = {
      lines = { { id = "d_default", text = "You're right, they won't, and I tell the recruits so twice a day. Straw can afford to be merciful, and nothing they'll meet at the Bulwark will be, so once they stop missing the straw they go down to Brother Malach's pit and meet something with teeth." } },
      choices = { { text = "A sensible order of things. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = {
        { id = "w_scourge", when = { race = "Scourge" }, text = "Only this: you don't tire and you don't bleed out, and that'll make you careless if you let it. A Forsaken who's been cut in half is no more use to the Dark Lady than a living man would be." },
        { id = "w_default", text = "Only this: when you stand in a line with my Deathguards, remember they'll hold longer than you can, and don't break your heart trying to match them. Fight the way the living fight, and let them fight like the dead." },
      },
      choices = { { text = "Understood, Sergeant. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Sergeant of foot in Lordaeron's army, and now a sergeant in the Dark Lady's. I've changed sovereigns, but never trades." } },
    _none = { { id = "tp_none", text = "That's above a sergeant's station, {class}. Ask an officer, and salute him first." } },
  },
}
