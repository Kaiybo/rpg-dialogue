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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
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
        { text = "What became of the house near the palace?", next = "rg_house" },
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
    rg_house = {
      lines = { { id = "rg_h_default", text = "The roof fell in the winter after the prince came home, and the Scourge used the garden for a graveyard, which I thought rather unimaginative of them. I walked past it once, after I rose. The roses had done quite well, considering." } },
      choices = {
        { text = "Did anyone else of your family survive?", next = "rg_family" },
        { text = "I imagine a noble house kept a good library.", next = "BACK", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, reply = "It did, and the Apothecaries have most of it now. I've stopped asking for it back." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rg_family = {
      lines = { { id = "rg_f_default", text = "A nephew fled south to Stormwind with the family silver and, I'm told, a very good opinion of himself. He writes to nobody, and nobody writes to him, which is the custom among Grimsfords when one of us has died inconveniently." } },
      choices = {
        { text = "Do you resent the living nobles who fled?", next = "rg_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rg_stance = {
      lines = { { id = "rg_s_default", text = "Resent is a common word. I observe that they kept their titles and their pulses, and that we kept the kingdom's ruins and its debts. A gentleman can hold a grudge with perfect manners, you know; it's the only way we were taught." } },
      choices = {
        { text = "They broke faith with Lordaeron. They should be held to account.", next = "BACK", reply = "Precisely my view, though I'd phrase it with more cutlery.", fx = { align = { honor = 1 } } },
        { text = "They ran to live. I'd have done the same.", next = "BACK", reply = "How refreshingly candid. Do keep that out of Selina's hearing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lordaeron_x", text = "A kingdom with excellent manners and a very poor sense of timing." } },
    sylvanas = { { id = "tp_sylvanas_x", text = "A queen without a coronation. I don't hold it against her; ours had a poor run of them." } },
    background = { { id = "tp_bg", text = "A Grimsford of Capital City, with a house near the palace. The house is gone, but the name has outlasted better things." } },
    _none = { { id = "tp_none", text = "I couldn't say, and I make it a rule not to speculate in public. Ask Selina; she hears everything." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
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
        { text = "How do you judge a blade by watching it fight?", next = "rv_judge" },
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
    rv_judge = {
      lines = { { id = "rv_j_default", text = "By the sound it makes against bone, mostly. Good steel rings and bad steel thuds, and a thud means some poor Deathguard at the Bulwark is going to find out the hard way. I tell James which ones thudded, and he doesn't thank me." } },
      choices = {
        { text = "Have your blades ever failed in the pit?", next = "rv_fail" },
        { text = "I work a forge myself.", next = "BACK", when = { profession = "Blacksmithing" }, reply = "Then you'll know the thud I mean. Come and listen with me some afternoon." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rv_fail = {
      lines = { { id = "rv_f_default", text = "One snapped clean across an abomination's hide last winter, and Edward was left holding a hilt. I took the pieces home and found a flaw in the quench, our flaw, and I've not slept since. Not that I ever do." } },
      choices = {
        { text = "Should the Van Brunts arm anyone who pays?", next = "rv_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rv_stance = {
      lines = { { id = "rv_s_default", text = "There's a goblin been asking after our blades by the crate, for buyers he won't name. Samuel says gold is gold. I say a sword goes where it's carried, and I'd like to know whose hand it's in." } },
      choices = {
        { text = "Sell to the Horde and no one else.", next = "BACK", reply = "That's my thinking. Samuel will say I'm a sentimental fool.", fx = { align = { order = 1 } } },
        { text = "Gold's gold. Let the buyer worry about the rest.", next = "BACK", reply = "Samuel's answer, word for word. You two should go drinking, if either of you could.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken_x", text = "We're hard on our tools, and harder on ourselves. Good steel's the only thing down here that stays honest." } },
    advice = { { id = "tp_advice_x", text = "Listen to your blade, friend. It'll tell you it's failing before it does, if you know the sound." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
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
        { text = "Did you ever win big, in life?", next = "rw_big" },
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
    rw_big = {
      lines = { { id = "rw_b_default", text = "Once, at the summer fair in Brill, on a pig race. A fortnight's wages, all in one fistful, and I spent it on a coat that the plague ruined a year after. I still think about that coat more than I ought." } },
      choices = {
        { text = "Why keep wagering, then?", next = "rw_why" },
        { text = "Care to wager with me?", next = "BACK", when = { race = "Troll" }, reply = "Against a troll? Your lot have the voodoo on your side, and I've lost enough at the zeppelin tower already." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rw_why = {
      lines = { { id = "rw_w_default", text = "Because a wager is a reason to care how the afternoon turns out. Most of the dead down here have stopped caring, and you can see it on them. A copper on Tyler keeps me awake, in a manner of speaking." } },
      choices = {
        { text = "Is it fair to bet on lives in the pit?", next = "rw_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rw_stance = {
      lines = { { id = "rw_s_default", text = "Malach takes his own cut, so the church can hardly object. I never bet on whether the captives die, mind. Only on how long the fighters take. A man has to draw a line somewhere, even if it's a thin one." } },
      choices = {
        { text = "A line's a line. I respect that you keep one.", next = "BACK", reply = "Thank you. Nobody's said that to me since I was breathing.", fx = { align = { honor = 1 } } },
        { text = "Lines are for the living. Bet on whatever pays.", next = "BACK", reply = "You'd do well down here, then. Better than me, I expect.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_advice_x", text = "Never bet on Tyler staying on his feet. Bet on him getting back up." } },
    lordaeron = { { id = "tp_lordaeron_x", text = "The fairs were the best of it. Pig races, cider, and a constable who could be bribed with a pie." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
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
        { text = "What did Tyler do in life?", next = "rb_tyler_life" },
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
    rb_tyler_life = {
      lines = { { id = "rb_t_default", text = "Tyler drove the mail coach out of Brill, and I drove the cart that followed it, eating his dust for six years. When we both came back from the Scourge he knew my face straight off, which is more than my own brother managed." } },
      choices = {
        { text = "What happened to your brother?", next = "rb_brother" },
        { text = "Tyler might like a Tauren to cheer him too.", next = "BACK", when = { race = "Tauren" }, reply = "Ha! He'd like a Tauren to stand behind him in the pit, more like. Shout as loud as you like." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rb_brother = {
      lines = { { id = "rb_b_default", text = "He's a Scarlet now, up at the monastery, or so a Deathguard told me. He saw me at a window in Brill once, after I rose, and he crossed himself and ran. I keep hoping Malach brings him to the pit, and I keep hoping he doesn't." } },
      choices = {
        { text = "If he came to the pit, would you want him spared?", next = "rb_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rb_stance = {
      lines = { { id = "rb_s_default", text = "I don't know, and that's the honest answer. He'd burn me where I stand, given the chance, and he'd call it a kindness. But he was my brother first, and I was his." } },
      choices = {
        { text = "Blood is blood. Spare him, if you can.", next = "BACK", reply = "Aye. I think I would, and I think he'd hate me for it.", fx = { align = { light = 1 } } },
        { text = "He chose the Crusade. He gets what the Crusade gets.", next = "BACK", reply = "That's what Tyler says. Tyler never had a brother.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet_crusade_x", text = "Fanatics, and my brother's among them. I'd shout for them to lose, if I could bear to watch." } },
    forsaken = { { id = "tp_forsaken_x", text = "We're loud, we're dead, and we pick our side. I picked Tyler's." } },
    background = { { id = "tp_bg", text = "I was a carter in life and a corpse in the Scourge after. These days I stand here and shout for Tyler, and it's the best of the three." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me who's winning; that I know." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
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
    ylife = {
      lines = { { id = "ylife_x", text = "The Lordaeron court's archives, cataloguing letters between dead kings. I'm still cataloguing, only now the dead kings include my employer. Pierce says I never noticed I'd died, and I'm not certain he's wrong." } },
      choices = {
        { text = "Did you read anything of Arthas?", next = "yarthas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yarthas = {
      lines = { { id = "yarthas_x", text = "His letters as a boy, to his father. Polite, eager, full of horses. I keep them in a box in Gutterspeak translation so no one can read them easily. Should I burn them, do you think, or keep them for history?" } },
      choices = {
        { text = "Keep them. History must remember everything.", next = "BACK", reply = "That is the archivist's answer, and I'm glad to hear someone else give it.", fx = { align = { order = 1 } } },
        { text = "Burn them. He doesn't deserve to be remembered kindly.", next = "BACK", reply = "Perhaps not. I'll hold the match a little longer, but I'll hold it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystrange = {
      lines = { { id = "ystrange_x", text = "A Kirin Tor ledger listing the debts of a magister named Kel'Thuzad, unpaid since he left Dalaran. Whoever kept it wrote late in the margin, in red. I have read it eleven times and I still find it funny." } },
      choices = {
        { text = "Why does Gutterspeak matter to you?", next = "ytongue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytongue = {
      lines = { { id = "ytongue_x", text = "Gutterspeak is the only thing the Forsaken made that the Scourge never gave us. A dialect of the grave, our own. I'd sooner think in it than in the King's Common, which was his language, after all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Samantha Shackleton. I read for the mages of this quarter, which means I go through what was saved from Lordaeron's shelves and tell them which parts are true, and they thank me and then ignore the list." },
        { id = "yh_mage", when = { class = "MAGE" }, text = "A mage. Then you won't mind if I keep reading while we talk. Pierce never does, and he's family." },
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
        { text = "What did you study in life?", next = "ylife" },
        { text = "What's the strangest thing you've found here?", next = "ystrange" },
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
    gutterspeak = { { id = "ytp_gs", text = "Our own tongue, made of rot and stubbornness. I'm very fond of it." } },
    pierce_shackleton = { { id = "ytp_pierce", text = "Pierce teaches frost and fire to students who never listen. We get along by never speaking." } },
    background = { { id = "tp_bg", text = "The Shackletons were scholars in Lordaeron, of the sort who were never invited to Dalaran. I've more to read now than I ever had in life." } },
    _none = { { id = "tp_none", text = "I've not come across it in anything I've read, and I'd sooner say so than invent it. Ask Pierce, though he may invent it." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Don't mind Reginald, he's only clearing his throat for the next speech. You may talk to me while he does it." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. You came in by the lift and went to the bank first, which tells me most of what I wanted to know." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You'll have met Luther Pickman, then, who shares my name and none of my manners, and I'll thank you not to judge the family by him." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A lady's maid in a noble house near the capital, the sort of servant nobody notices. I learned that the quietest person in a room hears everything. Death has only made me quieter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ysecret = {
      lines = { { id = "ysecret_x", text = "That a certain apothecary has been buying Scarlet prisoners from Deathguard captains, privately, and not for the Society's records. I've told no one. I've only collected the names." } },
      choices = {
        { text = "What will you do with those names?", next = "ynames" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynames = {
      lines = { { id = "ynames_x", text = "That's the question, isn't it? I could give them to the Dark Lady's people, or keep them for the day I need a favour. Which would you do?" } },
      choices = {
        { text = "Give them to the Dark Lady. That's loyalty.", next = "BACK", reply = "Loyal, yes. Also short-lived, sometimes. I'll consider it.", fx = { align = { order = 1 } } },
        { text = "Keep them. Leverage is worth more than duty.", next = "BACK", reply = "You think like a maid. That's a compliment, I promise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysell = {
      lines = { { id = "ysell_x", text = "Never. I trade them, which is different. Davitt thinks I simply like to know things, and I let him think it. Reginald never notices anything, which makes him splendid company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Selina Pickman. I walk with Reginald and Davitt because one learns more on the move than standing still, and this city tells you everything if you pass the same doors at the same hour each day." },
        { id = "yh_rogue", when = { class = "ROGUE" }, text = "A rogue. We're in a similar trade, you and I, though I never take anything that isn't said aloud." },
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
        { text = "Who were you in life?", next = "ylife" },
        { text = "What's the biggest secret you know?", next = "ysecret" },
        { text = "Do you sell what you hear?", next = "ysell" },
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
    davitt_hickson = { { id = "ytp_davitt", text = "Davitt talks so I don't have to. It's the best arrangement I've ever had." } },
    royal_quarter = { { id = "ytp_rq", text = "The Royal Quarter has the best echoes in the city. I've learned a great deal from them." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome at our fire any night you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep your distance, and keep out of the way of real soldiers." },
    { id = "g_default", text = "Stand clear of the dummies, {class}, unless you want Bosk to take your ear off by mistake. He's improving, but not that quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you've come to watch, watch quietly, because these three need no more distractions than they've got." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold that weapon as though you've used it on something that hit back. Good; stand where my recruits can see what that looks like." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "The Lordaeron line at Hillsbrad, during the Second War, against the orcs themselves. Funny how it goes. Now I drill recruits to fight beside the folk I once fought. I'd have laughed at it, living." } },
      choices = {
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Does that sit easily with you?", next = "yeasy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeasy = {
      lines = { { id = "yeasy_x", text = "It sits. The orcs fight straight and keep their word, which is more than I can say for the Alliance that cast us out. Still, some of my old mates died to orc axes. Should a soldier forget that, or hold onto it?" } },
      choices = {
        { text = "Forget it. The Horde is your army now.", next = "BACK", reply = "Aye. A soldier serves the army he has. Good answer.", fx = { align = { order = 1 } } },
        { text = "Hold onto it. Your dead deserve remembering.", next = "BACK", reply = "Aye, I'll remember them, quietly. Don't tell the recruits.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfear = {
      lines = { { id = "yfear_x", text = "That I'll send them out before they're ready, because the Bulwark's always shouting for more. Blaye's eager, Partridge thinks too much, and Bosk hasn't said a word in a week. I'll lose one. I always lose one." } },
      choices = {
        { text = "Why doesn't Bosk speak?", next = "ybosk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybosk = {
      lines = { { id = "ybosk_x", text = "Travist Bosk woke in a Deathknell grave with no name and took the first one he heard. He drills like a golem and speaks like one too. I think he remembers something he'd rather not. I don't push." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Sergeant Houser. I've got Blaye, Partridge and Bosk for as long as it takes to make Deathguards of them, and I mean to send the Dark Lady three soldiers and not three more corpses for the Lich King to pick up." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc! Stand there and let my recruits see what a real soldier of the Horde looks like. Blaye, eyes front!" },
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
        { text = "Where did you serve in life?", next = "ylife" },
        { text = "What do you fear for them?", next = "yfear" },
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
    the_bulwark = { { id = "ytp_bulwark", text = "The Bulwark takes my recruits and sends back reports. Some of the reports have names on them." } },
    travist_bosk = { { id = "ytp_bosk", text = "Bosk says nothing and hits hard. I've had worse recruits." } },
    background = { { id = "tp_bg", text = "Sergeant of foot in Lordaeron's army, and now a sergeant in the Dark Lady's. I've changed sovereigns, but never trades." } },
    _none = { { id = "tp_none", text = "That's above a sergeant's station, {class}. Ask an officer, and salute him first." } },
  },
}
