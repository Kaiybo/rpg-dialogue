-- Dustwallow, the missed folk (2 of 3): the Theramore Guard. Brother Karman and the Combat Masters by the
-- dummies, Captain Andrews' Red Team (Jarad, Lana, Tark) and Captain Thomas' Blue Team (Edward, Kahil,
-- Narrisha) in the sparring yard, Guard Lasiter at the butts, Guard Byron in the town, Pained in the Lady's
-- tower and Captain Wymor at Sentry Point. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Combat Master Criton: drills recruits at the training dummies.
P:NPC {
  key = "combat_master_criton", id = TODO_NPC("Combat Master Criton"), name = "Combat Master Criton", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "loud", "exacting" }, values = { "discipline" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Combat Master Criton drills the Theramore recruits at the training dummies, and his voice carries clear across the yard to the harbour. He corrected my stance before he'd asked my name.",
    third = "{name} met Combat Master Criton, who drills recruits for the Theramore Guard.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "There you are! Feet apart, yes, perfect. You've been practicing. Come, show me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Feet apart! No, wrong. Wrong again. What do you want?" },
    { id = "g_default", text = "Feet apart, {class}, you're standing like a man waiting for a carriage! There, that's better, now what do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still leaning on your back foot. We'll mend that yet." },
  },
  notice = {
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "Now there's a grip that's held a sword in earnest. Stand by that dummy a moment, so these recruits can see what a wrist is supposed to do." },
    { id = "n_dull", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your kit's a disgrace, and you'd be scrubbing the yard for it if you were one of mine. See the smith before you see the marsh again." },
  },
  start = "hello",
  nodes = {
    yworst = {
      lines = {
        { id = "ybcombatmastercriton1", text = "A fisherman's son who dropped his sword eleven times on his first morning. He's a sergeant on the north wall now, and the best I ever trained, so don't you tell me who can't learn." },
        { id = "ybcombatmastercriton2", when = { class = "WARRIOR" }, text = "Worse than you, if you can believe it. He's a sergeant now. Don't tell him I said that about either of you." },
      },
      choices = {
        { text = "Good footwork wins more fights than strength.", next = "BACK", reply = "Yes! Finally, someone who listens.", fx = { align = { order = 1 } } },
        { text = "Strength beats footwork every time.", next = "BACK", reply = "Then you'll fall on your face. Feet apart!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylordaeron = {
      lines = {
        { id = "ycombatmastercriton1", text = "Hard and honest, till the end. We drilled for orcs and got the dead instead, and every lesson I'd taught was half wrong. I rebuilt the whole drill on the ship coming over, and I've been fixing it since." },
      },
      choices = {
        { text = "What did you change?", next = "ychange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychange = {
      lines = {
        { id = "ycombatmastercriton2", text = "I teach them to stand when their friend falls, and not to look. That's the hardest lesson there is, because a dead friend may be standing again a minute later, and you've got to be ready." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yszigeti = {
      lines = {
        { id = "ycombatmastercriton3", text = "On swords, never. On soldiers, always. He wants them to think for themselves when the line breaks, and I want the line never to break. We argue about it over supper twice a week." },
      },
      choices = {
        { text = "Who's right?", next = "yright" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yright = {
      lines = {
        { id = "ycombatmastercriton4", text = "Tell me, then, since you're standing there with an opinion on your face." },
      },
      choices = {
        { text = "The line is everything. Hold it and live.", next = "BACK", reply = "Ha! I'll tell him a stranger agrees with me, and he'll smile that quiet smile and say nothing.", fx = { align = { order = 1 } } },
        { text = "A soldier who thinks for himself survives the breaking.", next = "BACK", reply = "Szigeti would buy you a drink for that. Mind he doesn't make a duellist of you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Combat Master Criton. They send me farm boys and sailors, and in a season I send the captains back something that can hold a line. The dummies don't complain, which is more than I can say for the recruits." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, they slack off when I turn my back." },
        { id = "h_again2", text = "Speak up, over the hammering." },
      },
      choices = {
        { text = "What do you teach them first?", next = "first" },
        { text = "How are this year's recruits?", next = "recruits" },
        { text = "Who takes them after you?", next = "after" },
        { text = "What was it like soldiering in Lordaeron?", next = "ylordaeron" },
        { text = "Do you and Szigeti agree on much?", next = "yszigeti" },
        { text = "Run me through your drill.", next = "BACK", when = { class = "WARRIOR" }, reply = "Shield up, feet wide, and take my count. Not bad. Not good, but not bad, and better than this lot by a mile." },
        { text = "What's the worst recruit you ever had?", next = "yworst" },
        { text = "Carry on, Combat Master.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How to stand, and then how to stand when they're tired, and then how to stand when the man next to them has gone down. Swordwork is easy next to that, and it's the standing that keeps a wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "r_default", text = "Keen, and green as marsh water, the lot of them. They grew up on this island hearing about the war, and every one thinks he'd have won it faster, so my first job is to scare them properly." } },
      choices = {
        { text = "And how do you scare them?", next = "scare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scare = {
      lines = { { id = "s_default", text = "I let Szigeti spar with them for a morning, and they come back to me quiet and attentive. He's never raised his voice in his life, and he's put more recruits on their backs than the fever has." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "a_default", text = "Andrews gets half and Thomas gets half, Red Team and Blue, and they knock the last of the softness out against each other. The two of them would wager their pensions on a sparring bout, and I've seen them come near it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    szigeti = { { id = "ycombatmastercriton5", text = "The quietest man on the island, and the most dangerous with a blade." } },
    recruits = { { id = "ycombatmastercriton6", text = "Farm boys and fishermen's sons. I'll make soldiers of them yet." } },
    background = { { id = "tp_bg", text = "Sergeant of foot in Lordaeron's army, and then the Lady's. I've trained three kinds of soldier for three kinds of war." } },
    _none = { { id = "tp_none", text = "Not my yard, not my worry. Ask the officers inside." } },
  },
}

-- Combat Master Szigeti: the quiet one who spars with recruits.
P:NPC {
  key = "combat_master_szigeti", id = TODO_NPC("Combat Master Szigeti"), name = "Combat Master Szigeti", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "quiet", "exact" }, values = { "skill" },
  notices = { "soldier", "class" },
  impression = {
    first = "Combat Master Szigeti teaches the Theramore Guard to fight, and he does it almost without speaking. Where Criton shouts, Szigeti simply shows a recruit the ground, and then helps him up.",
    third = "{name} met Combat Master Szigeti, who teaches swordwork to the Theramore Guard.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. You may stand closer today; I trust you to keep clear." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You may watch. Stand clear, and stay clear." },
    { id = "g_default", text = "Good day, {class}. You may watch, if you stand clear of the swing." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. You watched closely last time, and I noticed that." },
  },
  notice = {
    { id = "n_blade", cat = "soldier", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } },
      text = "You shifted your weight when that recruit lunged, without thinking of it. Someone taught you well, or something tried hard to kill you, and either will do." },
  },
  start = "hello",
  nodes = {
    ychoose = {
      lines = {
        { id = "ybcombatmasterszigeti1", text = "My father was a fencing master in Lordaeron's capital, and he taught nobles to duel for honour. I learned it as a game. The war taught me it was not, and I have taught it differently since." },
        { id = "ybcombatmasterszigeti2", when = { class = "ROGUE" }, text = "You would understand. A blade is a conversation. The sooner one stops talking, the better." },
      },
      choices = {
        { text = "Precision is the heart of swordsmanship.", next = "BACK", reply = "It is. My father taught me that.", fx = { align = { order = 1 } } },
        { text = "A sword is for hacking, not dancing.", next = "BACK", reply = "Then go and hack somewhere else.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "ycombatmasterszigeti1", text = "A wife and a daughter, in Andorhal. I was on the walls of the capital when the plague came there. I have not learned what happened to them, and I have stopped asking anyone who might know." },
      },
      choices = {
        { text = "I'm sorry.", next = "ysorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysorry = {
      lines = {
        { id = "ycombatmasterszigeti2", text = "Thank you. The recruits do not know this, and I would prefer they did not. They should think their teacher has nothing but the sword, so they do not wonder what they themselves might lose." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yteams = {
      lines = {
        { id = "ycombatmasterszigeti3", text = "Both are good, and both are too fond of the game. Andrews and Thomas wager on bouts, and the guards fight to win the wager instead of to stay alive. I have said so, and they have laughed." },
      },
      choices = {
        { text = "Should the wagers stop?", next = "ywagers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywagers = {
      lines = {
        { id = "ycombatmasterszigeti4", text = "I have been asked to decide whether to report it to Captain Vimes. It would end the game, and the game keeps them keen." },
      },
      choices = {
        { text = "Report it. Training is not a game.", next = "BACK", reply = "Then I will, gently. Andrews will sulk for a week, and Thomas will make a list of reasons I was wrong.", fx = { align = { order = 1 } } },
        { text = "Let it be. Keen soldiers train harder.", next = "BACK", reply = "Perhaps. I will watch, and if anyone is hurt for a cask of rum, I will not wait to ask you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Szigeti. Criton teaches them to stand in a line, and I teach them what to do when the line has broken and it's one man against another. I hope they never need my half, though they usually do." },
      },
      again = {
        { id = "h_again", text = "Ask, and I'll answer between bouts." },
        { id = "h_again2", text = "Yes, what else would you ask?" },
      },
      choices = {
        { text = "You don't shout the way Criton does.", next = "quiet" },
        { text = "What mistake do recruits make most?", next = "mistake" },
        { text = "Would you show me that last counter?", next = "counter", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Did you have a family in Lordaeron?", next = "yfamily" },
        { text = "What do you think of the Red and Blue teams?", next = "yteams" },
        { text = "My people fought the undead too.", next = "BACK", when = { race = "NightElf" }, reply = "I saw your sentinels at Hyjal only in the stories the Lady's guards told. If half of it is true, I'd learn a great deal from watching one of you." },
        { text = "Why did you choose the sword?", next = "ychoose" },
        { text = "I'll stand clear. Good day.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "A man who's shouted at learns to listen for shouting, and there'll be none of that when it matters. I'd rather they learned to watch a blade, since a blade never warns you first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mistake = {
      lines = { { id = "m_default", text = "They look at the sword, when they ought to look at the shoulder that moves it. The shoulder tells you the truth a half second before the steel does, and a half second is a long life in a fight." } },
      choices = {
        { text = "Where did you learn that?", next = "learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "Against the undead, in the last days of Lordaeron, where it didn't work at all. The dead have no tells, and so I learned everything else twice as well, to make up the difference." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    counter = {
      lines = { { id = "c_default", text = "Step inside the cut, not away from it, and let his own arm carry him past you. It feels like walking into the blow, and that's the reason nobody expects it." } },
      choices = { { text = "Inside the cut. My thanks.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    lordaeron = { { id = "ybcombatmasterszigeti3", text = "My father taught fencing there. The city is gone now, and so is he." } },
    andorhal = { { id = "ycombatmasterszigeti5", text = "I would rather not speak of Andorhal." } },
    criton = { { id = "ycombatmasterszigeti6", text = "He shouts, and I don't. We want the same thing for them, though we argue about how." } },
    background = { { id = "tp_bg", text = "I was a swordsman in Lordaeron, and I'm one here. I've found it's the only trade that's always wanted." } },
    _none = { { id = "tp_none", text = "I don't know. I'd not guess at it." } },
  },
}

-- Captain Andrews: Red Team Captain.
P:NPC {
  key = "captain_andrews", id = TODO_NPC("Captain Andrews"), name = "Captain Andrews", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "bluff", "competitive" }, values = { "his_team" },
  notices = { "soldier" },
  impression = {
    first = "Captain Andrews leads the Red Team in Theramore's sparring yard, and he shouts his guards on like a man with coin riding on every bout. He swears the Reds have never lost fairly to Captain Thomas' Blues.",
    third = "{name} met Captain Andrews, who leads the Red Team of the Theramore Guard in training.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ah, you! Watch, Tark's about to land one! Now, what can I do for you, friend?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hold on, Tark's about to land one. What do you want?" },
    { id = "g_default", text = "Hold a moment, {class}, Tark's about to land one! There, did you see that? Now, what can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back to watch the Reds win? You've good taste, I'll say that." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now you look like you could give my lot a proper bout. Don't let Thomas talk to you first, for he poaches every good sword he sees." },
  },
  start = "hello",
  nodes = {
    ycame = {
      lines = {
        { id = "ybcaptainandrews1", text = "On the third ship of the fleet, with forty soldiers and no orders but the Lady's. Thomas was on the same deck, seasick the whole way, and I've reminded him of it at every wager since." },
        { id = "ybcaptainandrews2", when = { race = "Human" }, text = "You'd know the old kingdoms, then. We left Lordaeron with nothing but our swords, and we built this town with them, one plank at a time." },
      },
      choices = {
        { text = "A bit of competition keeps the soldiers sharp.", next = "BACK", reply = "It does! The Reds are ahead, too.", fx = { align = { order = 1 } } },
        { text = "Training games are a waste of time.", next = "BACK", reply = "Then you've never seen a real fight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywager = {
      lines = {
        { id = "ycaptainandrews1", text = "A cask of Kul Tiras rum and the right to choose the patrol rota for a month. Thomas has the rum locked in his quarters already, which is very confident of him, and I mean to drink it in front of him." },
      },
      choices = {
        { text = "What if you lose?", next = "ylose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylose = {
      lines = {
        { id = "ycaptainandrews2", text = "Then I walk the dawn patrol through the bog for a month, and Thomas makes sure I know he's sleeping late. It's happened twice, and I'll not let it happen a third time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysleep = {
      lines = {
        { id = "ycaptainandrews3", text = "I do. My Reds are young, and most of them have never seen a real enemy closer than a murloc. I trained men like them in Lordaeron, and I watched half of them go down at the first charge of the dead." },
      },
      choices = {
        { text = "How do you prepare them for that?", next = "yprepare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yprepare = {
      lines = {
        { id = "ycaptainandrews4", text = "Some say make the yard as hard as the battlefield, and break them now so the enemy can't. Others say teach them to trust each other first, and the steel will follow. I go back and forth on it." },
      },
      choices = {
        { text = "Drill them hard. Discipline keeps soldiers alive.", next = "BACK", reply = "Aye, Criton would kiss you for that. I'll lean on them a little harder this week.", fx = { align = { order = 1 } } },
        { text = "Trust first. Men fight for the man beside them.", next = "BACK", reply = "That's how I learned it, too. Thomas will say I'm soft, and Thomas can say what he likes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Captain Andrews, Red Team. Jarad, Lana and Tark are mine, and we train against Thomas and his Blues until both sides can fight in their sleep. A guard who's only ever hit straw is no use to the Lady." },
      },
      again = {
        { id = "h_again", text = "What else? Keep an eye on the bout while you ask." },
        { id = "h_again2", text = "Go on, quickly now." },
      },
      choices = {
        { text = "Who's winning, Red or Blue?", next = "winning" },
        { text = "Tell me about your three.", next = "three" },
        { text = "Is all this sparring for a real threat?", next = "threat" },
        { text = "What's the wager this season?", next = "ywager" },
        { text = "Do you ever lose sleep over the real fight?", next = "ysleep" },
        { text = "I'd spar with your Reds.", next = "BACK", when = { class = "WARRIOR" }, reply = "Would you? Then come by at dawn and take Jarad, and don't go easy, for he'll learn more from losing to you than winning against Edward." },
        { text = "How did you come to Theramore?", next = "ycame" },
        { text = "Good luck to the Reds, Captain.", next = "END" },
      },
    },
    winning = {
      lines = { { id = "w_default", text = "Red, and you may tell Thomas I said so. He'll show you a tally that says otherwise, but he counts that business last month when Lana slipped in the mud, and no honest man would." } },
      choices = {
        { text = "What's between you and Thomas?", next = "thomas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thomas = {
      lines = { { id = "t_default", text = "Nothing but twenty years and a great many wagers. We came up through the ranks together, and I'd trust him with my life, which is exactly why I can't let him win at this." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    three = {
      lines = { { id = "th_default", text = "Jarad's strong and thinks that's enough, Tark's clever and thinks that's enough, and Lana's the only one who knows it takes both. Give me another year and I'll have three like her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "tr_default", text = "It's for whichever one comes first. We've an inn burned on our own road, deserters loose in the marsh and a Horde camp to the north, and I'll not have my guards meet any of them for the first time with live steel." } },
      choices = { { text = "That's sound thinking. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    lordaeron = { { id = "ybcaptainandrews3", text = "I soldiered there before the fall. I don't like to talk about the end of it." } },
    thomas = { { id = "ycaptainandrews5", text = "Captain Thomas keeps a slate and a grudge, and I've never seen him lose either." } },
    red_team = { { id = "ycaptainandrews6", text = "Jarad, Lana and Tark, my three, and the best team in the yard whatever the slate says." } },
    background = { { id = "tp_bg", text = "I've been soldiering since before the Lady was grown. Lordaeron first, and Theramore for as long as she'll have me." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Thomas, and then believe the opposite." } },
  },
}

-- Captain Thomas: Blue Team Captain.
P:NPC {
  key = "captain_thomas", id = TODO_NPC("Captain Thomas"), name = "Captain Thomas", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "dry", "methodical" }, values = { "his_team", "order" },
  notices = { "soldier" },
  impression = {
    first = "Captain Thomas leads the Blue Team in Theramore's sparring yard, and he keeps a running tally of every bout on a slate at his belt. He is quieter than Captain Andrews and at least as determined to beat him.",
    third = "{name} met Captain Thomas, who leads the Blue Team of the Theramore Guard in training.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. The figures show the Blues are ahead, and I'll gladly show you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. If Andrews told you the Reds are ahead, he's wrong." },
    { id = "g_default", text = "Good day, {class}. If Andrews has told you the Reds are ahead, I have the figures here that say otherwise." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The tally has moved two bouts in our favour since you were last here." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry your shield arm properly, which I can't say of everyone in this yard. The Blue Team could use someone to show them how it's done." },
  },
  start = "hello",
  nodes = {
    ycame = {
      lines = {
        { id = "ybcaptainthomas1", text = "On the same ship as Andrews, and if he tells you I was seasick, he's exaggerating. I was mildly indisposed for eleven days, and I kept the ship's roster the entire time." },
        { id = "ybcaptainthomas2", when = { race = "Human" }, text = "You'd know how it was, then. Lordaeron gone and the east in chaos. We came west because the Lady asked, and we stayed because she was right." },
      },
      choices = {
        { text = "A methodical approach wins in the end.", next = "BACK", reply = "It does. Andrews would disagree, of course.", fx = { align = { order = 1 } } },
        { text = "Luck wins more fights than method.", next = "BACK", reply = "Luck runs out. Method does not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytally = {
      lines = {
        { id = "ycaptainthomas1", text = "Every bout, every point, every touch, written in chalk and copied into a ledger each evening. Andrews says I'm a clerk with a sword, and I say his memory improves remarkably when he's losing." },
      },
      choices = {
        { text = "Do you keep other ledgers?", next = "yledger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yledger = {
      lines = {
        { id = "ycaptainthomas2", text = "One more, and it's not for wagers. I write down every guard who's left the island, by ship or by the marsh, and why, if I know it. The list's grown longer this year than I care to admit." },
      },
      choices = {
        { text = "Why keep such a list?", next = "ylist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylist = {
      lines = {
        { id = "ycaptainthomas3", text = "Because someone ought to remember them, deserters included. Some of the lads say a deserter's name should be struck from every record. I'm not sure I agree." },
      },
      choices = {
        { text = "Strike them. A traitor's name shames the Guard.", next = "BACK", reply = "That's the regulation, and you'll find Vimes agrees. I'll keep my list private, then.", fx = { align = { order = 1 } } },
        { text = "Keep them. Every name was a soldier once.", next = "BACK", reply = "Thank you. Some of those names trained in this yard, and I'll not pretend they didn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfar = {
      lines = {
        { id = "ycaptainthomas4", text = "Then I stop it, and the guard who pressed too hard runs the wall twice. We've had broken fingers and one broken nose, Jarad's, and Andrews claims that last one improved his looks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Captain Thomas, Blue Team. Edward, Kahil and Narrisha train under me, and we meet Andrews' Reds in the yard most days. He believes in spirit and I believe in drill, and the slate will show you which wins more often." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on. I can count and listen." },
      },
      choices = {
        { text = "What does the slate say?", next = "slate" },
        { text = "Tell me about your three.", next = "three" },
        { text = "They say you saluted a little girl.", next = "sara" },
        { text = "How do you keep the tally so precisely?", next = "ytally" },
        { text = "What happens if a bout goes too far?", next = "yfar" },
        { text = "Your Blues could use some Light-forged discipline.", next = "BACK", when = { class = "PALADIN" }, reply = "They could use any discipline at all on a hot afternoon. Come and show them how a paladin holds a line, and I'll put it on the slate." },
        { text = "How did you come to Theramore?", next = "ycame" },
        { text = "Good luck to the Blues, Captain.", next = "END" },
      },
    },
    slate = {
      lines = { { id = "s_default", text = "That Blue leads by four bouts this season, or by five if you count the day Guard Lana went down in the mud. Andrews says the mud doesn't count, and I say the marsh won't ask whether the ground was fair." } },
      choices = {
        { text = "You and Andrews go back a long way.", next = "andrews" },
        { text = "Something else.", next = "BACK" },
      },
    },
    andrews = {
      lines = { { id = "a_default", text = "Twenty years, across two continents. He's the best captain in the Guard after Vimes, and if you repeat that to him I shall deny it and double his next wager." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    three = {
      lines = { { id = "t_default", text = "Edward is steady, Kahil is quick, and Narrisha thinks two moves ahead of both of them. None of the three is the strongest in the yard, and together they beat the strongest more often than not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sara = {
      lines = { { id = "sa_default", text = "The Pierce girl, yes. She marched up to me and announced she was joining the Guard, and a recruit that certain deserves a salute. I've pencilled her in for the Blue Team in about ten years." } },
      choices = { { text = "She'll hold you to it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    vimes = { { id = "ybcaptainthomas3", text = "Captain Vimes commands the Guard. A sound man, and a tired one." } },
    andrews = { { id = "ycaptainthomas5", text = "Andrews is the best captain in the Guard after Vimes. I'll deny saying so." } },
    blue_team = { { id = "ycaptainthomas6", text = "Edward, Kahil and Narrisha. Steady, quick and clever, and that's a team." } },
    background = { { id = "tp_bg", text = "I've served since I was a boy, in Lordaeron and here. I've found that most problems give way to a list and some patience." } },
    _none = { { id = "tp_none", text = "I've no figures on that. Ask at the citadel." } },
  },
}

-- Guard Jarad: Red Team.
P:NPC {
  key = "guard_jarad", id = TODO_NPC("Guard Jarad"), name = "Guard Jarad", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "cocky" }, values = { "strength" },
  notices = { "soldier" },
  impression = {
    first = "Guard Jarad fights for the Red Team in Theramore's sparring yard, and he hits like a falling mast. He is very sure that hitting hard is all there is to it.",
    third = "{name} met Guard Jarad of the Theramore Guard's Red Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hey, you! Watch me land this one. Red Team's got the strongest arm in the yard!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Make it quick. I'm up in a moment." },
    { id = "g_default", text = "Make it quick, {class}, I'm up again in a moment. Red Team doesn't keep the Blues waiting, we just knock them down." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Stay and watch this time, I'm in good form today." },
  },
  notice = {
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "Those are a fighter's arms. I'd like to see which of us hits harder some day, though I think I know already." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Guard Jarad, Red Team, under Captain Andrews. I'm the strongest arm in this yard, and when I land a blow the other fellow knows the bout's over." },
      },
      again = {
        { id = "h_again", text = "What else? I've a Blue to flatten." },
        { id = "h_again2", text = "Go on, be quick about it." },
      },
      choices = {
        { text = "Strength is what wins fights.", next = "BACK", reply = "That's what I keep telling everyone!", fx = { align = { honor = 1 } } },
        { text = "Strength is nothing without patience.", next = "BACK", reply = "Patience is for the Blues. Watch this.", fx = { align = { honor = -1 } } },
        { text = "Who gives you the hardest bout?", next = "hardest" },
        { text = "Strength isn't everything in a fight.", next = "strength" },
        { text = "Who's the strongest on the Blue Team?", next = "xblue" },
        { text = "Have you ever lost a bout?", next = "xlost" },
        { text = "Strength isn't everything in a fight.", next = "xnot" },
        { text = "I'm a warrior too. Show me your stance.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Go flatten your Blue.", next = "END" },
      },
    },
    hardest = {
      lines = { { id = "h2_default", text = "Kahil, on the Blues, and it's maddening, because he hardly hits at all. He just isn't there when I swing, and by the third miss my arms feel like anchors." } },
      choices = {
        { text = "So how do you beat him?", next = "beat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beat = {
      lines = { { id = "b_default", text = "Lana says I should wait and let him come to me, and I hate to admit it works. I tried it once and had him on his back in a moment, and then I forgot and went back to swinging." } },
      choices = { { text = "Listen to Lana. Something else.", next = "BACK" } },
    },
    strength = {
      lines = { { id = "s_default", text = "That's what the Captain says, and what Szigeti says, and what Lana says twice a day. I'll allow there might be something in it, but I notice none of them wants to stand in front of my swing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xblue = {
      lines = { { id = "xxblue_d", text = "Edward, if you ask the Blues, but he's just stubborn, not strong. He stands there like a wall and lets you hit him until your arms give out, which isn't the same as winning." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlost = {
      narr = "He scowls at the far end of the yard, where Kahil is bouncing on his toes.",
      lines = { { id = "xxlost_d", text = "Once, to Kahil, and only because he ran circles around me until I fell over my own feet. The Captain made me run laps for a week, and Lana still hasn't stopped laughing." } },
      choices = {
        { text = "Did you learn anything from it?", next = "xlearn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlearn = {
      lines = { { id = "xxlearn_d", text = "I learned to keep my feet under me, and that Kahil gets tired if you make him wait. Tark says that's strategy, and I say it's common sense." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnot = {
      lines = { { id = "xxnot_d", text = "That's what Tark says, and Lana, and the Captain, and every Blue I've ever knocked down. Go on, what wins a fight, then?" } },
      choices = {
        { text = "Discipline. Strength without discipline breaks in a long fight.", next = "BACK", reply = "Hmph. You sound like Captain Andrews. Maybe I'll listen this time.", fx = { align = { order = 1 } } },
        { text = "Hit first and hit hardest. That's all there is.", next = "BACK", reply = "Ha! There, finally someone who talks sense in this yard.", fx = { align = { order = -1 } } },
      },
    },
    xwarrior = {
      lines = { { id = "xxwarrior_d", text = "Feet wide, weight low and swing from the hips, not the shoulders. Most of the young ones swing with their arms and wonder why they're tired in a minute, but you look like you know that already." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    blue_team = { { id = "tp_xblue_team", text = "Captain Thomas' lot. They're quick, but quick only gets you so far." } },
    red_team = { { id = "tp_xred_team", text = "Red Team's the strong one. Ask anyone, except the Blues." } },
   
    background = { { id = "tp_bg", text = "I hauled nets on the docks here before I enlisted. That's where the arms come from." } },
    _none = { { id = "tp_none", text = "No idea. Ask the Captain." } },
  },
}

-- Guard Lana: Red Team.
P:NPC {
  key = "guard_lana", id = TODO_NPC("Guard Lana"), name = "Guard Lana", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "level" }, values = { "discipline" },
  notices = { "soldier" },
  impression = {
    first = "Guard Lana fights for the Red Team in Theramore, and she is the one the other Reds look to when a bout goes badly. She has heard quite enough about the day she slipped in the mud.",
    third = "{name} met Guard Lana of the Theramore Guard's Red Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Guard Lana. Good to see you, friend. Ask what you like." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Guard Lana. If it's about the mud, keep walking." },
    { id = "g_default", text = "Guard Lana, Red Team. If you've come to ask about the mud, {class}, you can keep walking." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. You didn't mention the mud last time, and I appreciated it." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've stood in a real line, haven't you? It shows in how you watch the whole yard and not just the nearest sword." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I fight for Captain Andrews, alongside Jarad and Tark. One of them thinks with his arms and the other thinks too much, and my work is mostly keeping the pair of them pointed at the Blues." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm next up." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "A level head is worth more than a strong arm.", next = "BACK", reply = "It is. Jarad doesn't think so.", fx = { align = { order = 1 } } },
        { text = "A strong arm beats a level head.", next = "BACK", reply = "Then go and talk to Jarad.", fx = { align = { order = -1 } } },
        { text = "What did happen with the mud?", next = "mud" },
        { text = "Does the sparring make better guards?", next = "better" },
        { text = "How do you keep Jarad and Tark in line?", next = "xline" },
        { text = "Has Red Team been winning lately?", next = "xmud2" },
        { text = "You seem to watch the whole yard.", next = "xwatch" },
        { text = "I'm a paladin. Do you fight with faith?", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "Good fortune in the next bout.", next = "END" },
      },
    },
    mud = {
      lines = { { id = "m_default", text = "It rained, the yard turned to soup, and my heel went out from under me with Narrisha's sword already coming. She had the grace to help me up, and Captain Thomas had the gall to mark it on his slate." } },
      choices = {
        { text = "Narrisha sounds like a fair opponent.", next = "narrisha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    narrisha = {
      lines = { { id = "n_default", text = "She's the best of the Blues, and we share a bunk room, so I hear about every bout twice. If it ever comes to real fighting, hers is the shield I'd want on my left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    better = {
      lines = { { id = "b_default", text = "It does, because straw doesn't feint and a comrade does. I'd rather take a bruise from Edward today than learn the same lesson from a raptor on the north road." } },
      choices = { { text = "Well put. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xline = {
      lines = { { id = "xxline_d", text = "I tell Jarad to swing and Tark to stop thinking, and then I fight whoever's left standing on the Blue side. It's not complicated, but it took me a year to learn." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmud2 = {
      narr = "She nods toward a chalk-scrawled board nailed to the fence.",
      lines = { { id = "xxmud2_d", text = "Seven bouts to five this month, and two of the Blues' wins were Kahil running Jarad in circles. The Captains keep a tally on a board by the barracks, and Captain Thomas rubs it out when he thinks nobody's looking." } },
      choices = {
        { text = "Does Captain Andrews know?", next = "xfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfall = {
      lines = { { id = "xxfall_d", text = "He knows, and he chalks it back in every morning before drill. It's the closest thing to a war this yard has seen, and I think both of them enjoy it more than they'd admit." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwatch = {
      lines = { { id = "xxwatch_d", text = "Somebody has to. The best fighter in a line isn't the one with the biggest swing, it's the one who notices the gap before it opens. Do you think a soldier's first duty is to her team or to herself?" } },
      choices = {
        { text = "To her team. A line holds or it breaks together.", next = "BACK", reply = "Exactly. You'd fit on Red Team, if Captain Andrews would have you.", fx = { align = { order = 1 } } },
        { text = "To herself. A dead soldier helps no one.", next = "BACK", reply = "There's sense in that, and I've seen it save lives. But it's not how a line works.", fx = { align = { order = -1 } } },
      },
    },
    xpaladin = {
      lines = { { id = "xxpaladin_d", text = "With faith and a shield, and I'd rather have both. My mother prayed to the Light every morning in Lordaeron, and I still do, though it's quieter here." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    red_team = { { id = "tp_xred_team", text = "Jarad hits, Tark thinks, and I keep them alive. It works." } },
    mud = { { id = "tp_xmud", text = "Don't mention the mud." } },
   
    background = { { id = "tp_bg", text = "My mother was a marine of Kul Tiras, and I was carried off the ship here as a child. The Guard was always where I was going." } },
    _none = { { id = "tp_none", text = "I don't know. Captain Andrews might." } },
  },
}

-- Guard Tark: Red Team.
P:NPC {
  key = "guard_tark", id = TODO_NPC("Guard Tark"), name = "Guard Tark", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "wry", "thoughtful" }, values = { "cleverness" },
  notices = { "class" },
  impression = {
    first = "Guard Tark fights for the Red Team in Theramore, and he studies every opponent like a puzzle before he lifts his sword. Now and then he studies a little too long and gets hit for it.",
    third = "{name} met Guard Tark of the Theramore Guard's Red Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Guard Tark. Ah, you. Stand with me a moment; I've worked out what Edward does wrong." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Guard Tark. Give me a moment. Actually, give me a few." },
    { id = "g_default", text = "Guard Tark. Give me a moment, {class}, I'm working out why Edward drops his shoulder before he cuts left." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. I've solved Edward since we spoke, and now it's Narrisha I can't read." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You're watching the same things I am, the feet and the eyes. I'd wager you've won a few fights before the other side knew one had started." },
  },
  start = "hello",
  nodes = {
    ychange = {
      lines = {
        { id = "ybguardtark1", text = "I'd teach Jarad to wait, and Lana to take more risks. Neither of them would listen to me, mind, but they'd listen to the captain if I could make him think it was his idea." },
        { id = "ybguardtark2", when = { class = "ROGUE" }, text = "You'd know about planting ideas. Any advice for making a captain think he thought of it first?" },
      },
      choices = {
        { text = "Studying your opponent wins the fight.", next = "BACK", reply = "It does. Most just swing harder.", fx = { align = { order = 1 } } },
        { text = "Thinking too much slows you down.", next = "BACK", reply = "Maybe. But I'm still winning.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yandrews = {
      lines = {
        { id = "ybguardtark3", text = "Loud, cheerful, stubborn, and the bravest man in the yard. He'd charge a dragon with a practice sword if the wager was right. That's what makes him a fine captain, and what keeps me awake at night." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yshipwright = {
      lines = {
        { id = "yguardtark1", text = "Apprenticed in the yards by the docks, building the fishing boats. I can tell you where a hull will fail by tapping it, and I can tell you where a guard will fail by watching him walk." },
      },
      choices = {
        { text = "Why leave the yards?", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = {
        { id = "yguardtark2", text = "My mother wanted it. She marched with the Admiral, and she said a son of hers would carry a sword, not a mallet. I've wondered since whether I chose the Guard or she chose it for me." },
      },
      choices = {
        { text = "You serve your family's wishes. That's honor.", next = "BACK", reply = "Maybe. She was proud the day I took the oath, and that counts for something.", fx = { align = { honor = 1 } } },
        { text = "Choose for yourself. Your life is yours.", next = "BACK", reply = "That's what Lana says too. Perhaps I'll go back to the yards one day.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm with Captain Andrews' Red Team. Jarad wins by hitting things and Lana wins by being sensible, and I try to win by knowing what the other fellow will do before he does." },
      },
      again = {
        { id = "h_again", text = "What else? I can think and talk." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Does it work?", next = "work" },
        { text = "What have you worked out about the Blues?", next = "blues" },
        { text = "Do you resent Lady Proudmoore, as some Kul Tirans do?", next = "kt_jaina" },
        { text = "You were a shipwright?", next = "yshipwright" },
        { text = "You'd make a fine engineer.", next = "BACK", when = { profession = "Engineering" }, reply = "I've thought about it. Gears are only bouts that hold still. Maybe when I'm too old to spar." },
        { text = "What would you change about the Reds?", next = "ychange" },
        { text = "What do you think of Captain Andrews?", next = "yandrews" },
        { text = "I'll let you think.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "About two bouts in three, which is better than it sounds. The third is when I'm still admiring my own plan and somebody's sword arrives in the middle of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blues = {
      lines = { { id = "b_default", text = "Edward is as steady as a post and just as easy to walk around, and Kahil's quick but he always breaks to his right. Narrisha changes what she does every single day, and I've stopped trying to be clever with her." } },
      choices = {
        { text = "And what do you do against her?", next = "narrisha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    narrisha = {
      lines = { { id = "n_default", text = "I let Lana fight her, and I take Kahil. Knowing which bouts to leave to someone else is a kind of cleverness too, or so I tell the Captain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "No, and I've had that argument with my mother more times than I can count. She marched with the Admiral, but I grew up behind these walls in a peace the Lady paid for with her grief. When her father came to burn it down, she stood in his way, and that took more courage than anything he did." } },
      choices = {
        { text = "Your mother's right. Daelin died for his people.", next = "BACK", reply = "He died for his hatred, and he took good marines with him. I'll not change my mind, friend.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She chose her people over her father. I respect that.", next = "BACK", reply = "So do I, and so would my mother if she'd ever say it aloud. Thank you for that.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    andrews = { { id = "ybguardtark4", text = "The captain. He'd charge a dragon if the wager was right." } },
    edward = { { id = "yguardtark3", text = "He drops his shoulder before he cuts left. Don't tell him I told you." } },
    narrisha = { { id = "yguardtark4", text = "The only one I can't read. It's maddening." } },
    jaina = { { id = "tp_ktjaina", text = "I'd follow the Lady into the sea if she asked. My mother would follow her too, though she'd grumble the whole way." } },
    background = { { id = "tp_bg", text = "I was apprenticed to a shipwright before I enlisted. You learn to look twice at how a thing is put together." } },
    _none = { { id = "tp_none", text = "I haven't worked that one out. Try the citadel." } },
  },
}

-- Guard Edward: Blue Team.
P:NPC {
  key = "guard_edward", id = TODO_NPC("Guard Edward"), name = "Guard Edward", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "steady", "earnest" }, values = { "duty" },
  notices = { "soldier" },
  impression = {
    first = "Guard Edward fights for the Blue Team in Theramore, and he takes a blow on his shield the way a breakwater takes a wave. He isn't quick or showy, and nobody has yet moved him an inch he didn't mean to give.",
    third = "{name} met Guard Edward of the Theramore Guard's Blue Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Guard Edward, Blue Team. Good to see you, friend. Stand where you like today." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Guard Edward. Mind the chalk line, and mind yourself." },
    { id = "g_default", text = "Guard Edward, Blue Team. Good day to you, {class}, and mind you stand outside the chalk line." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. I'm still standing, as you can see." },
  },
  notice = {
    { id = "n_shield", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a shield as if you trust it. So do I, and it's kept my teeth where they belong so far." },
  },
  start = "hello",
  nodes = {
    yoffduty = {
      lines = {
        { id = "ybguardedward1", text = "Kahil plays dice and loses, Narrisha reads, and I sleep. Somebody has to be rested for the next bout, and the others are much too clever to ever do it themselves." },
        { id = "ybguardedward2", when = { race = "Dwarf" }, text = "Kahil would love a dwarf at the dice table. He'd lose all his pay, and maybe learn something." },
      },
      choices = {
        { text = "A steady stance holds the line.", next = "BACK", reply = "It does. That's my job on the Blues.", fx = { align = { order = 1 } } },
        { text = "Holding the line is boring. Attack instead.", next = "BACK", reply = "Then join the Reds. I'll hold.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ythomas = {
      lines = {
        { id = "ybguardedward3", text = "The best captain on the isle, and he'd say so too, with figures to back it up. He makes us run drills I hate, and I've never once lost a bout because of something he didn't prepare me for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfather = {
      lines = {
        { id = "yguardedward1", text = "He was a quiet man who whistled on watch, and he died of a fever the first wet season, when we were still building the walls. They buried him under the north tower, and I take my watch there when I can." },
      },
      choices = {
        { text = "Does it comfort you?", next = "ycomfort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycomfort = {
      lines = {
        { id = "yguardedward2", text = "Most nights. Some nights I wonder if he'd have wanted me to go home to Kul Tiras instead, where he came from. My aunt writes that there's a place for me on her boat." },
      },
      choices = {
        { text = "Stay. Your father gave his life to this place.", next = "BACK", reply = "That's what I keep telling myself. It's good to hear someone else say it.", fx = { align = { honor = 1 } } },
        { text = "Go. Your father's people are your people too.", next = "BACK", reply = "Maybe one day. Not while Captain Thomas still needs a middle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I serve under Captain Thomas, with Kahil and Narrisha. They do the clever part, and my part is to hold the middle and not fall down, which I'm told I'm good at." },
      },
      again = {
        { id = "h_again", text = "Was there something else?" },
        { id = "h_again2", text = "Go on, I've a moment before the next bout." },
      },
      choices = {
        { text = "What's it like facing Jarad?", next = "jarad" },
        { text = "Why did you join the Guard?", next = "why" },
        { text = "Do the Kul Tiras marines still follow Lady Proudmoore?", next = "kt_jaina" },
        { text = "What do you remember of your father?", next = "yfather" },
        { text = "Shield to shield, then?", next = "BACK", when = { class = { "WARRIOR", "PALADIN" } }, reply = "Any time, if you can stand still long enough. Most people who spar with me get bored and walk around." },
        { text = "What does the Blue Team do off duty?", next = "yoffduty" },
        { text = "What do you think of Captain Thomas?", next = "ythomas" },
        { text = "Hold the middle, Edward.", next = "END" },
      },
    },
    jarad = {
      lines = { { id = "j_default", text = "Like standing under a dropped crate, every time. But he only has the one swing, so I take it on the shield and count to three, and by then he's left himself wide open." } },
      choices = {
        { text = "Does he know you count?", next = "count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "c_default", text = "I told him so myself, because it didn't seem fair otherwise. He laughed and said it wouldn't help me, and so far he's been wrong four times." } },
      choices = { { text = "That's honestly done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "My father was a guard, and he's buried on this island. It seemed to me that somebody ought to go on standing where he stood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "Most of us do, though I won't pretend it's easy. I came over as one of the Admiral's marines, and I stood on the walls when his ships came to burn us out, and I've never decided whether I'm guarding the Lady or guarding against her father's ghost." } },
      choices = {
        { text = "Your oath was to the Admiral first.", next = "BACK", reply = "It was, and he's dead, and I've had to make my peace with that. Don't make it harder, friend.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "Your oath is to Theramore now. Hold it.", next = "BACK", reply = "I hold it every watch. Some nights I just hold it a little tighter than others.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thomas = { { id = "ybguardedward4", text = "Thomas keeps a slate of every bout. I'm on it more than I'd like." } },
    father = { { id = "yguardedward3", text = "He's buried under the north tower. I take my watch there when I can." } },
    jarad = { { id = "yguardedward4", text = "Strong, loud and honest. He only has the one swing, but it's a big one." } },
    jaina = { { id = "tp_ktjaina", text = "I came as one of the Admiral's marines, and I stayed as one of hers. I'm still not sure what that makes me." } },
    background = { { id = "tp_bg", text = "Theramore's the only home I remember. I mean to keep it as it is." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Captain Thomas would." } },
  },
}

-- Guard Kahil: Blue Team.
P:NPC {
  key = "guard_kahil", id = TODO_NPC("Guard Kahil"), name = "Guard Kahil", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "quick", "cheerful" }, values = { "speed" },
  notices = { "class" },
  impression = {
    first = "Guard Kahil fights for the Blue Team in Theramore, and he never stands still for as long as it takes to say so. He grins through every bout, which the Reds find very hard to bear.",
    third = "{name} met Guard Kahil of the Theramore Guard's Blue Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Guard Kahil! Friend, you're back! Talk while I stretch, I'm happy to see you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Guard Kahil. Talk while I stretch, or go." },
    { id = "g_default", text = "Guard Kahil, Blue Team! You'll have to talk while I stretch, {class}, or I'll stiffen up before the next bout." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Did you see the last one? Jarad swung so hard he turned himself round." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "You're light on your feet, I can tell from here. We ought to race the length of the pier some time, if the Captain isn't looking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm one of Captain Thomas' Blues. Edward stands, Narrisha plans, and I run rings around whoever's in front of me until they're too tired to lift a sword." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it lively!" },
        { id = "h_again2", text = "Go on, I'm listening, I'm only bouncing." },
      },
      choices = {
        { text = "Quick feet win more than heavy arms.", next = "BACK", reply = "They do! That's why I'm on the Blues.", fx = { align = { order = 1 } } },
        { text = "Speed is no match for strength.", next = "BACK", reply = "Tell that to Jarad, when I beat him.", fx = { align = { order = -1 } } },
        { text = "Doesn't all that dodging wear you out?", next = "tired" },
        { text = "Tark says you always break right.", next = "right" },
        { text = "What's your secret for winning?", next = "xsecret" },
        { text = "Where did you learn to fight?", next = "xwhere" },
        { text = "You never seem to stand still.", next = "xstill" },
        { text = "I'm a rogue. Speed is my trade too.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Keep moving, Kahil.", next = "END" },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "Less than swinging a sword does, and far less than being hit by Jarad. I ran messages across this island as a boy, and after the causeway at a sprint a sparring yard is a rest." } },
      choices = {
        { text = "Would it work outside the yard?", next = "outside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outside = {
      lines = { { id = "o_default", text = "Captain Thomas asks me that every week, and it's a fair question. A raptor won't get tired before I do, so he's got me drilling with Edward's shield, and I'm terrible at it." } },
      choices = { { text = "Keep at the shield. Something else.", next = "BACK" } },
    },
    right = {
      lines = { { id = "r_default", text = "Does he, now? Well, don't tell him he's correct, because I've been breaking right on purpose for a month so that I can go left when it counts." } },
      choices = { { text = "I never heard a thing. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xsecret = {
      lines = { { id = "xxsecret_d", text = "Never be where they swing. Jarad's got arms like tree trunks, but if I'm not in front of him, they're only waving at the air." } },
      choices = {
        { text = "What if they corner you?", next = "xcorner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcorner = {
      lines = { { id = "xxcorner_d", text = "Then I've made a mistake and I deserve the bruise. Narrisha says I'm reckless, and Edward says I'm lucky, and I say both of them are jealous." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhere = {
      narr = "He grins and does a quick hop backward, as if dodging the memory.",
      lines = { { id = "xxwhere_d", text = "In Stormwind's alleys, ducking the city watch, if I'm honest. The Captain caught me stealing apples once and said I'd be better off running for the Guard than from it." } },
      choices = {
        { text = "Do you miss those days?", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = { { id = "xxmiss_d", text = "A little, but I eat better now and nobody chases me. Was the Captain right to take a thief in, or should he have handed me to the watch?" } },
      choices = {
        { text = "He was right. Everyone deserves a second chance.", next = "BACK", reply = "That's what I tell myself every morning! Glad you agree.", fx = { align = { light = 1 } } },
        { text = "A thief's a thief. You got lucky.", next = "BACK", reply = "Lucky, maybe, but lucky's still winning, isn't it?", fx = { align = { light = -1 } } },
      },
    },
    xstill = {
      lines = { { id = "xxstill_d", text = "Can't afford to. If I stop I'll stiffen, and if I stiffen Jarad will catch me, and if Jarad catches me I'll be eating soup through a straw for a week." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xxrogue_d", text = "Then you know! Footwork wins every fight that matters. If you're ever around for a bout, I'd like to see how you move." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    red_team = { { id = "tp_xred_team", text = "Strong, slow and very proud of it. I like them anyway." } },
    captain_thomas = { { id = "tp_xcaptain_thomas", text = "Captain Thomas took me off the street. I owe him more than bruises." } },
   
    background = { { id = "tp_bg", text = "I was a runner for the citadel before I was old enough to enlist. I've never been any good at keeping still." } },
    _none = { { id = "tp_none", text = "Not a clue! Ask the Captain, he's got a slate for everything." } },
  },
}

-- Guard Narrisha: Blue Team.
P:NPC {
  key = "guard_narrisha", id = TODO_NPC("Guard Narrisha"), name = "Guard Narrisha", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "cool", "sharp" }, values = { "foresight" },
  notices = { "class" },
  impression = {
    first = "Guard Narrisha fights for the Blue Team in Theramore, and she seems to have finished each bout in her head before it begins. She speaks sparingly and misses nothing in the yard.",
    third = "{name} met Guard Narrisha of the Theramore Guard's Blue Team.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Guard Narrisha. Ah, you again. Ask your question, friend; I'll answer gladly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Guard Narrisha. You've been watching. Ask, and then go." },
    { id = "g_default", text = "Guard Narrisha. You've been watching from the rail a while, {class}, so you may as well ask what you came to ask." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Stand on the other side this time; the light's better for watching." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A spellcaster. I'd like to know how you'd fight any of us, for one day we may face something that doesn't use a sword." },
  },
  start = "hello",
  nodes = {
    yleave = {
      lines = {
        { id = "ybguardnarrisha1", text = "Sometimes, when the fog sits on the walls for a week. Then I think of my brother, and how he died for an argument about orcs, and I decide the best thing I can do is keep this place standing." },
        { id = "ybguardnarrisha2", when = { race = "Human" }, text = "You came from the east, I'd guess. Do the old kingdoms still talk about us, or have they forgotten?" },
      },
      choices = {
        { text = "A sharp plan wins before the fight starts.", next = "BACK", reply = "It does. I plan for the Blues.", fx = { align = { order = 1 } } },
        { text = "Plans fall apart once the fighting starts.", next = "BACK", reply = "Mine don't. Ask, and go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydecide = {
      lines = {
        { id = "yguardnarrisha1", text = "I watch how they walk to the chalk line. A guard who swaggers will overreach, and one who looks at the floor will hold back. It's the same in the marsh, I imagine, and in a citadel full of politics." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylana = {
      lines = {
        { id = "yguardnarrisha2", text = "We grew up three houses apart and have competed in everything since we could walk. She enlisted the day after me to prove she could, and I've never let her forget I was first." },
      },
      choices = {
        { text = "Do you get along?", next = "yalong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yalong = {
      lines = {
        { id = "yguardnarrisha3", text = "She's my closest friend, and I'd die for her, and I'd still beat her in the yard if I could. That's the trouble: Andrews wants me to transfer to the Reds so we're on the same side." },
      },
      choices = {
        { text = "Stay with the Blues. Loyalty to your team matters.", next = "BACK", reply = "That's what Thomas would say, and I think he's right. Lana will understand, eventually.", fx = { align = { honor = 1 } } },
        { text = "Go to Lana. Friendship comes before any team.", next = "BACK", reply = "I'd like to. I just wish it didn't feel like leaving Edward and Kahil behind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I serve on Captain Thomas' Blue Team with Edward and Kahil. I'm neither the strongest nor the fastest here, so I've made a habit of deciding how a bout will end before I step in." },
      },
      again = {
        { id = "h_again", text = "Was there something more you wanted?" },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "Tark says he can't read you.", next = "tark" },
        { text = "What are you really training for?", next = "training" },
        { text = "What do you think of Lady Proudmoore?", next = "kt_jaina" },
        { text = "How do you decide a bout before it starts?", next = "ydecide" },
        { text = "What's between you and Lana?", next = "ylana" },
        { text = "How would I fight you, then?", next = "BACK", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, reply = "Quickly, and from far away, I expect. I'd close the distance before your first spell, and if I failed, I'd lose. Shall we try it one day?" },
        { text = "Do you ever think of leaving Theramore?", next = "yleave" },
        { text = "I'll watch from the other side.", next = "END" },
      },
    },
    tark = {
      lines = { { id = "t_default", text = "He can't, because I watch him working me out and then do something else. He's the cleverest of the Reds, and it would be a pity if he ever learned to stop showing it on his face." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    training = {
      lines = { { id = "tr_default", text = "For the day it isn't a game. Somebody burned the Shady Rest, and good guards have walked off into the marsh, and I don't think either trouble is finished with us." } },
      choices = {
        { text = "You knew some of the deserters?", next = "deserters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters = {
      lines = { { id = "d_default", text = "I trained beside two of them in this yard. They were good soldiers who were loyal to an admiral that's dead, and I've wondered since what I would have said to stop them." } },
      choices = {
        { text = "It wasn't yours to stop.", next = "BACK", reply = "Perhaps not. I'd still rather have tried and failed than not have noticed.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "My brother sailed with the Admiral's fleet when it came for Durotar, and he didn't come back. The Lady could have stopped her father, they tell me, and instead she stood beside the orcs while he fell. I serve her because I swore to, and I'll keep that oath, but don't ask me to like it." } },
      choices = {
        { text = "She chose orcs over her own blood.", next = "BACK", reply = "She did, and my brother's in the sea for it. I'm glad someone outside the Guard sees it.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "Your brother followed a man who wouldn't hear reason.", next = "BACK", reply = "Maybe he did. That doesn't bring him home, and it doesn't make me love her for it.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lana = { { id = "yguardnarrisha4", text = "My oldest friend and my favourite rival. Don't tell her the first part." } },
    thomas = { { id = "yguardnarrisha5", text = "Captain Thomas thinks in lists. I think in bouts, and we get along." } },
    jaina = { { id = "tp_ktjaina", text = "I keep my oath to the Lady, but my brother sailed with the Admiral and never came home." } },
    background = { { id = "tp_bg", text = "I came across as a girl with the fleet. I enlisted the day I was old enough, and Lana enlisted the day after to spite me." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't guess. Ask at the citadel." } },
  },
}

-- Guard Lasiter: the archer, always at practice.
P:NPC {
  key = "guard_lasiter", id = TODO_NPC("Guard Lasiter"), name = "Guard Lasiter", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "intent", "modest" }, values = { "practice" },
  notices = { "class" },
  impression = {
    first = "Guard Lasiter is the Theramore Guard's archer, and I have never seen him anywhere but at the targets with a bow in his hand. He spoke to me between arrows and never once took his eye off the straw.",
    third = "{name} met Guard Lasiter, the archer of the Theramore Guard who never stops practising.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "One moment, friend. There. Dead centre, thanks to your luck. How can I help?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "One moment. A thumb low again. What do you want?" },
    { id = "g_default", text = "One moment, {class}, let me loose this one. There, a thumb's width low again. Now, how can I help you?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I've put four hundred arrows in that target since you left, and I'm still not satisfied." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've an archer's shoulders, and a real one's, earned on things that move. I'd be grateful if you watched my release and told me what you see." },
  },
  start = "hello",
  nodes = {
    ybow = {
      lines = {
        { id = "ybguardlasiter1", text = "A longbow Farran made me, yew from Elwynn and string waxed every morning. It's a little heavy for me still, and I mean to grow into it before the day comes when I need it." },
        { id = "ybguardlasiter2", when = { class = "HUNTER" }, text = "Look at the draw on that. You'll know the weight's more than I can manage. I'll grow into it, I suppose." },
      },
      choices = {
        { text = "A good archer practices every morning.", next = "BACK", reply = "I do. Every morning, rain or fog.", fx = { align = { order = 1 } } },
        { text = "Archery's luck more than skill.", next = "BACK", reply = "Then why do I keep missing? Go away.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynight = {
      lines = {
        { id = "yguardlasiter1", text = "Lights on the marsh, sometimes, and the murlocs coming up the rocks. Once, a great shadow over the water that blotted out the stars. I told the sergeant it was a cloud, and I didn't believe it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ystay = {
      lines = {
        { id = "yguardlasiter2", text = "The Lady's mages have offered me a place in the tower guard, which is safer and pays better. But the tower guard never looks over the wall, and that's where the danger comes from." },
      },
      choices = {
        { text = "What will you choose?", next = "ychoose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychoose = {
      lines = {
        { id = "yguardlasiter3", text = "I'd ask your advice, if you've a mind to give it. I've asked Farran and he only says to do what I'd regret least." },
      },
      choices = {
        { text = "Take the tower post. The Lady needs her best shots close.", next = "BACK", reply = "That's the sensible answer. I'll think on it, though the wall will miss me.", fx = { align = { order = 1 } } },
        { text = "Stay on the wall. You belong where you're needed.", next = "BACK", reply = "That's what my gut says too. I'll tell the mages no, politely.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Guard Lasiter. The others spar and I shoot, from first light until Farran runs out of arrows to sell me. If something ever comes over that wall, I want it to have an arrow in it before it lands." },
      },
      again = {
        { id = "h_again", text = "Ask away, I can talk between shots." },
        { id = "h_again2", text = "Go on, I'm only nocking." },
      },
      choices = {
        { text = "Don't you ever rest?", next = "rest" },
        { text = "Jensen Farran says you're the best shot here.", next = "best" },
        { text = "Your elbow drops as you loose.", next = "elbow", when = { class = "HUNTER" } },
        { text = "What do you see from the wall at night?", next = "ynight" },
        { text = "Do you mean to stay a guard?", next = "ystay" },
        { text = "My people are fine archers. Any advice?", next = "BACK", when = { race = "NightElf" }, reply = "I've only heard of your sentinels, never seen them. If you'll loose a few at my straw, I'll learn more from watching you than a year of practice." },
        { text = "What bow do you use?", next = "ybow" },
        { text = "I'll leave you to the target.", next = "END" },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "When it's too dark to see the straw, and I don't care for it much. A sword arm stays strong on its own, but an eye goes soft in a week if you let it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "He's kind to say it, but straw stands still and doesn't shoot back. I'll believe I'm good on the day it matters, and until then I'd sooner be better tomorrow than pleased today." } },
      choices = {
        { text = "Have you shot at anything living?", next = "living" },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "Murlocs, off the sea wall, when they come up the rocks at night. I didn't miss, and I was sick afterwards all the same, and I've never told the Captain that part." } },
      choices = { { text = "It stays with me. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    elbow = {
      lines = { { id = "e_default", text = "Does it? Then that's my thumb's width low, and I've been blaming the bow for a month. Thank you; nobody here shoots well enough to have seen it." } },
      choices = { { text = "Glad to help. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    elwynn = { { id = "ybguardlasiter3", text = "The best yew comes from Elwynn, Farran says. I've never been there." } },
    farran = { { id = "yguardlasiter4", text = "Jensen Farran makes the best arrows on the island and tells me so every morning." } },
    murlocs = { { id = "yguardlasiter5", text = "They come up the sea wall at night, and I've shot a few. I don't like to talk about it." } },
    background = { { id = "tp_bg", text = "I hunted duck on the marsh edge as a boy, for the family pot. The Guard gave me a better bow and a bigger reason." } },
    _none = { { id = "tp_none", text = "I couldn't say. I don't hear much out here but bowstrings." } },
  },
}

-- Pained: night elf at Lady Proudmoore's side in the tower.
P:NPC {
  key = "pained", id = TODO_NPC("Pained"), name = "Pained", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "terse", "watchful" }, values = { "her_charge" },
  notices = { "race", "stealth" },
  impression = {
    first = "Pained is a night elf warrior who stands near Lady Proudmoore in the tower at Theramore and watches everyone who climbs the stair. She measured the distance between me and the Lady, and did not trouble to hide that she was doing it.",
    third = "{name} met Pained, the night elf who stands watch beside Lady Jaina Proudmoore in Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "You may approach freely. The Lady trusts you, and so do I." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You may approach. Keep your hands in sight." },
    { id = "g_default", text = "You may approach, {class}. Keep your hands in sight, and speak to the Lady with courtesy." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. You gave me no cause for concern before, so do not begin now." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. You are wondering what one of our people does in a human tower, and I have heard the question in every tone there is." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I heard you on the fourth stair, where the board is loose. You are skilled, but you should know that I was listening." },
  },
  start = "hello",
  nodes = {
    yrest = {
      lines = {
        { id = "ybpained1", text = "When the Lady sleeps, I sit by her door and watch the stairs. It is rest enough. My people do not need as much sleep as yours, and the night is when I hear best." },
        { id = "ybpained2", when = { race = "NightElf" }, text = "You know how it is, sister. The night is ours, and Elune watches with me." },
      },
      choices = {
        { text = "Guarding the Lady is an honor.", next = "BACK", reply = "It is. I would give my life for her.", fx = { align = { order = 1 } } },
        { text = "The Lady can protect herself.", next = "BACK", reply = "She can. That is not the point. Keep your hands in sight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylong = {
      lines = {
        { id = "ypained1", text = "Since the Battle of Mount Hyjal, when the young races came west and fought beside us. She was very young, and very tired, and she did not once ask for thanks. I came to Theramore some time after." },
      },
      choices = {
        { text = "Why did you leave your people?", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = {
        { id = "ypained2", text = "That is my own affair, as I have said. I will say only that a debt to the Lady weighed more than a place among the sentinels, and that some of my sisters did not agree." },
      },
      choices = {
        { text = "A debt must be paid. You were right to come.", next = "BACK", reply = "I believe so, though I have walked many nights wondering.", fx = { align = { honor = 1 } } },
        { text = "Your people needed you more.", next = "BACK", reply = "Perhaps. Do not think I have not heard that voice before.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yguards = {
      lines = {
        { id = "ypained3", text = "Brave, and loud, and too fond of wagering on their sparring. Some of them watch me with suspicion, because I am not human. I do not hold it against them. Suspicion keeps a guard alive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am called Pained. I stand where the Lady stands, and I see that those who come before her leave as peacefully as they arrived. That is all you need to know of my duties." },
      },
      again = {
        { id = "h_again", text = "Ask, if you must." },
        { id = "h_again2", text = "Speak. I am listening, and watching." },
      },
      choices = {
        { text = "That's an unusual name.", next = "name" },
        { text = "Why does a night elf guard a human mage?", next = "why" },
        { text = "Is the Lady in danger?", next = "danger" },
        { text = "Have you known the Lady long?", next = "ylong" },
        { text = "What do you make of Theramore's guards?", next = "yguards" },
        { text = "Do you miss Ashenvale, sister?", next = "BACK", when = { race = "NightElf" }, reply = "Every day, and I do not speak of it. Elune watches here as well, though she shows herself less among the stone walls." },
        { text = "Do you ever rest?", next = "yrest" },
        { text = "I'll give you no trouble.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "It is the one I answer to, and I have not been asked to explain it by anyone I was obliged to answer. You are not the first to remark upon it, and you will learn as much as the others did." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because she stood with my people at Hyjal when it would have been easier to sail away. Few of the young races have earned a debt from the kaldorei, and she has, and I am how a part of it is paid." } },
      choices = {
        { text = "Do you find humans strange to live among?", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "They are loud, they hurry, and they build in stone where a tree would serve. But this one listens before she acts, which is rarer than you would think in any race, including my own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "One who wishes for peace between the Alliance and the Horde has enemies in both. I assume there is danger every hour of the day, and so far the assumption has cost me nothing but sleep." } },
      choices = { { text = "Then she is well guarded.", next = "BACK", reply = "She is. See that you remember it.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    hyjal = { { id = "ypained4", text = "Where the Lady stood with my people against the Burning Legion. I do not forget it." } },
    jaina = { { id = "ypained5", text = "The Lady. I guard her, and that is all you need know." } },
    background = { { id = "tp_bg", text = "I was a warrior of my people for a very long time before I came here. The rest is my own affair." } },
    _none = { { id = "tp_none", text = "That is not mine to discuss. Ask the Lady, if she has time for you." } },
  },
}

-- Captain Wymor: commands Sentry Point on the road north of Theramore.
P:NPC {
  key = "captain_wymor", id = TODO_NPC("Captain Wymor"), name = "Captain Wymor", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "weathered", "wary" }, values = { "vigilance", "loyal" },
  notices = { "soldier", "race" },
  impression = {
    first = "Captain Wymor commands the watch at Sentry Point, the tower on the road where Theramore's causeway meets the marsh. He has the patience of a man who has stared at the same fog for years and knows it hides something different every week.",
    third = "{name} met Captain Wymor, who commands the Theramore Guard's watch at Sentry Point.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ah, you. Good, you're no deserter. Come in, friend, and sit." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hold there. Let me look at you. Hmm. Say your piece quickly." },
    { id = "g_default", text = "Hold there, {class}, and let me have a look at you. Good, you're no deserter and no murloc, so you may pass or you may talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back through my post again. The marsh let you go, I see, which it doesn't do for everyone." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You're on the road late. Stay by the torches while we talk, for the things out there know to keep clear of them." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the look of someone who's stood a watch. Then you know the hard part isn't the fighting, it's the staring at nothing." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "That's near enough. The road north is yours to use and the causeway south is not, and I'd take it kindly if we both kept to that." },
  },
  start = "hello",
  nodes = {
    yhorde = {
      lines = {
        { id = "ycaptainwymor1", text = "Grunts from Brackenwall, now and then, and a tauren trader once who bowed to the tower before he passed. The Lady's peace holds on this road because both sides want it to, and I'd like to keep it that way." },
      },
      choices = {
        { text = "Keeping deserters out keeps Theramore strong.", next = "BACK", reply = "It does. One bad soldier spoils a hundred.", fx = { align = { order = 1 } } },
        { text = "Some deserters had good reasons.", next = "BACK", reply = "Perhaps. But that's not for me to judge.", fx = { align = { order = -1 } } },
        { text = "Do your guards share that view?", next = "yguards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yguards = {
      lines = {
        { id = "ycaptainwymor2", text = "Not all of them. A few lost brothers in the Admiral's fleet and they'd sooner shoot first. I've a choice to make about one of them, a good sentry with a bad temper." },
      },
      choices = {
        { text = "What will you do?", next = "ychoose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychoose = {
      lines = {
        { id = "ycaptainwymor3", text = "He's never broken an order, but he talks of breaking it, and talk spreads. I could send him back to the citadel, or keep him where I can watch him." },
      },
      choices = {
        { text = "Send him back. An angry sentry breaks a peace.", next = "BACK", reply = "That's my sense of it too. He'll hate me, but he'll be alive and so will the peace.", fx = { align = { order = 1 } } },
        { text = "Keep him. He's earned the chance to cool off.", next = "BACK", reply = "You're kinder than I am. I'll give him the month, and I'll stand his watches with him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysouth = {
      lines = {
        { id = "ycaptainwymor4", text = "The Wyrmbog, and the black dragons, and things that serve them. I don't send patrols past the bend in the causeway, and I'd advise you not to go alone. A few who went came back changed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Captain Wymor, Sentry Point. Everything that comes to Theramore by land comes past this tower, and my orders are to know about it before the town does. Most days that's traders and raptors, and I can tell them apart at a mile." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down, it carries over the water." },
        { id = "h_again2", text = "Go on, I've one eye on the road." },
      },
      choices = {
        { text = "What's the road north like?", next = "road" },
        { text = "What do you watch for most?", next = "watch" },
        { text = "It must be a thankless post.", next = "post" },
        { text = "Do you ever see the Horde on this road?", next = "yhorde" },
        { text = "What's south down the causeway?", next = "ysouth" },
        { text = "I'm Horde. Am I welcome past your tower?", next = "BACK", when = { faction = "Horde" }, reply = "You're welcome to walk the road north, under the Lady's peace, and I'll keep to it as long as you do. Don't take it further than that." },
        { text = "Keep a sharp watch, Captain.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Wet, narrow, and watched by everything with teeth from here to the Barrens. Keep to the planks where there are planks, and when you pass the burned inn don't stop to stare, because others stop there too." } },
      choices = {
        { text = "Who else stops at the inn?", next = "inn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Scavengers, and folk from Brackenwall poking through the ash, and Captain Vimes' people doing the same from our side. I've told my guards to count heads and leave it to Vimes, since a fight in those ruins would bury whatever truth is left in them." } },
      choices = { { text = "A cool head. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    watch = {
      lines = { { id = "w_default", text = "Our own deserters, if I'm honest, more than the Horde. An ogre comes at you from the front, but a man who knows our passwords and patrol hours is another matter, and there's a nest of them up at Lost Point." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    post = {
      lines = { { id = "p_default", text = "It's damp and it's dull, and I asked for it. If I do this work well then nothing ever reaches the town, and nobody there will know there was anything to thank me for, which is the way I'd have it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    sentry_point = { { id = "ycaptainwymor5", text = "My tower, my road. Nothing comes to Theramore by land without passing me first." } },
    deserters = { { id = "ycaptainwymor6", text = "Men who know our passwords and our patrols. They worry me more than any ogre." } },
    background = { { id = "tp_bg", text = "I've served the Lady since the crossing. She asked for someone she could trust on the road, and I've been on it ever since." } },
    _none = { { id = "tp_none", text = "That hasn't come down my road. Ask in Theramore." } },
  },
}
