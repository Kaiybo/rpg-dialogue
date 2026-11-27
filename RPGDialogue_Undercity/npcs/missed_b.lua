-- Undercity folk the first passes missed (part 1 of 3): the War Quarter gossips Joanna Whitehall and Leona Tharpe,
-- the suppliers Katrina Alliestar, Lizbeth Cromwell, Millie Gregorian, Nathaniel Steenwick and Nicholas Atwood,
-- apprentice enchanter Malcomb Wynn, and the bystanders Lucian Fenner, Marla Fowler and Mattie Alred.
-- Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Joanna Whitehall: War Quarter; talks with Leona Tharpe and Gerard Abernathy about the mindslave Theresa.
P:NPC {
  key = "uc_joanna_whitehall", id = TODO_NPC("Joanna Whitehall"), name = "Joanna Whitehall", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "dry", "sharp" }, values = { "practical" },
  notices = { "race" },
  impression = {
    first = "Joanna Whitehall stands in the War Quarter with Leona Tharpe and Gerard Abernathy, talking over Gerard's human mindslave as other people talk over the weather. She was a soldier's wife once and mentions it the way one mentions an old address.",
    third = "{name} met Joanna Whitehall, a Forsaken of the War Quarter with firm opinions on mindslaves.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are! Come stand with us, and don't mind Theresa; she's quite used to people by now." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Gerard would prefer you didn't stare, and I'd prefer you didn't linger." },
    { id = "g_default", text = "If you've come to stare at Theresa, do it quickly, because Gerard dislikes it when she's distracted from her errands." },
    { id = "g_back", when = { metBefore = true }, text = "You again. We are still talking about the same thing, since very little else happens in this corner." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You needn't look at the girl like that, {race}. She feels nothing at all, which is more than I can say for the rest of us down here." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Joanna Whitehall. Leona and I were only saying that a living servant is a strange thing to keep in a city of the dead, though I'll grant that Theresa carries a parcel faster than any of us." },
      },
      again = {
        { id = "h_again", text = "Was there more? Leona will only start again without me." },
        { id = "h_again2", text = "Go on, then, and I'll answer what I can." },
      },
      choices = {
        { text = "Who is Theresa?", next = "theresa" },
        { text = "You don't sound troubled by it.", next = "troubled" },
        { text = "Who were you, before the plague?", next = "before" },
        { text = "Does the War Quarter suit a soldier's widow?", next = "jw_quarter" },
        { text = "I'll leave you to your talk.", next = "END" },
      },
    },
    theresa = {
      lines = { { id = "t_default", text = "A human woman whose mind has been emptied and filled again with Gerard Abernathy's instructions. She fetches and carries about the city all day, and she'll walk past you as though you were a pillar." } },
      choices = {
        { text = "Does she remember who she was?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = {
        { id = "r_scourge", when = { race = "Scourge" }, text = "That is Leona's question, and she asks it daily. You and I both know what it is to have another will sitting where our own should be, so I'd think you could guess the answer as well as I can." },
        { id = "r_default", text = "That is Leona's question, and she asks it daily. I say it hardly matters, because whoever she was isn't the one carrying the parcels, and Gerard is not a man who gives things back." },
      },
      choices = { { text = "A cold answer. Something else.", next = "BACK" } },
    },
    troubled = {
      lines = { { id = "tr_default", text = "The living burned us out of our own farms and called it mercy, so no, I can't say I lose much rest over one of them sweeping a floor. I merely think it untidy, having something breathing underfoot." } },
      choices = { { text = "Untidy is one word for it.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "I was married to a soldier named Reuben, and I kept his house while he marched about for a king who is now a stain on the throne room floor. The vow said until death, and death was punctual, so I consider the matter closed." } },
      choices = {
        { text = "Do you know what became of him?", next = "reuben" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reuben = {
      lines = { { id = "re_default", text = "I do not, and I've stopped turning over helmets to find out. If he lives, he would not thank me for knocking at his door looking as I do, and if he doesn't, then he's somebody else's soldier now." } },
      choices = { { text = "I'm sorry I asked. Something else.", next = "BACK" } },
    },
    jw_quarter = {
      lines = { { id = "jw_q_default", text = "Better than the parlour ever did. I hear the Deathguard drilling and know what every shout means, because Reuben practised them on the dog. A quarter full of soldiers is the only company I ever learned to keep." } },
      choices = {
        { text = "What do you make of the Deathguard?", next = "jw_guard" },
        { text = "I'm a soldier myself, as it happens.", next = "BACK", when = { class = "WARRIOR" }, reply = "Then stand up straight. Reuben always did when a lady was watching, even a dead one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    jw_guard = {
      lines = { { id = "jw_g_default", text = "Better soldiers than Terenas ever paid for, since they can't desert and they don't need feeding. They march to the Bulwark knowing what waits there, and they go anyway. I respect that more than I ever respected a parade." } },
      choices = {
        { text = "Would you send them against the living, too?", next = "jw_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jw_stance = {
      lines = { { id = "jw_s_default", text = "The Dark Lady will send them where she pleases, and she won't ask me. But I think the living chose their side when they barred the gates and lit the pyres. Tell me where you stand, since you're so curious." } },
      choices = {
        { text = "Not every living soul barred a gate against you.", next = "BACK", reply = "No, some of them only watched. I find I can't tell the two apart any longer.", fx = { align = { light = 1 } } },
        { text = "Then let them answer for it, every one.", next = "BACK", reply = "Now you sound like a Whitehall. Reuben would have liked you, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lordaeron_x", text = "A kingdom of parades and pyres, and I saw rather more of the second. I don't mourn the flags." } },
    forsaken = { { id = "tp_forsaken_x", text = "We are what was left when the king's men finished being merciful. I find it suits me well enough." } },
    background = { { id = "tp_bg", text = "A soldier's wife in Lordaeron, and now a widow who happens to be the one who died. I keep to the War Quarter, where at least the noise is honest." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, and I'd rather not guess. Ask Gerard; he enjoys being asked things." } },
  },
}

-- Leona Tharpe: War Quarter; the one who keeps asking about Theresa.
P:NPC {
  key = "uc_leona_tharpe", id = TODO_NPC("Leona Tharpe"), name = "Leona Tharpe", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "thoughtful", "uneasy" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Leona Tharpe watches the mindslave Theresa cross the War Quarter and cannot seem to stop wondering about her. Joanna Whitehall has an answer for everything Leona asks, and none of the answers have settled her.",
    third = "{name} met Leona Tharpe, a Forsaken of the War Quarter who wonders what a mindslave remembers.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you. I'm glad. Did you see her go past again? I'd like to watch for her with someone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "It's you. I'd rather you didn't stand so near, today, if you don't mind." },
    { id = "g_default", text = "Did you see her go by just now, the living woman with the empty face? I watch for her every time, and I couldn't tell you why." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and so has she, twice, with a basket each time. I've been counting." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You're a priest, so you have been inside other minds. I'd like to know what it's like in there, though I suspect I wouldn't enjoy the answer." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Leona Tharpe. Joanna says I think too much about Gerard's servant, and Gerard says a tool is a tool, but I was a tool myself for a season, and I remember rather more of it than I'd like." },
      },
      again = {
        { id = "h_again", text = "Ask me something else, before she comes round again and I lose my thread." },
        { id = "h_again2", text = "Yes? I'm listening, mostly." },
      },
      choices = {
        { text = "You mean your time in the Scourge.", next = "scourge" },
        { text = "What do Joanna and Gerard say?", next = "others" },
        { text = "What does a priest do to a mind like hers?", next = "priest", when = { class = "PRIEST" } },
        { text = "Have you ever spoken to Theresa yourself?", next = "lt_spoke" },
        { text = "Good day, Leona.", next = "END" },
      },
    },
    scourge = {
      lines = { { id = "s_default", text = "I do. I walked where the Lich King pointed me, and all the while there was a small part of me at the back, watching my own hands and unable to shout. The Dark Lady broke that hold, and I've wondered ever since whether Theresa has a small part at the back as well." } },
      choices = {
        { text = "And if she does?", next = "if_so" },
        { text = "Something else.", next = "BACK" },
      },
    },
    if_so = {
      lines = { { id = "i_default", text = "Then we have done to her what was done to us, and Joanna will tell me the living deserve it. Perhaps they do, but I notice that I can't watch her walk past without looking at her eyes." } },
      choices = { { text = "You'd not be the first to wonder. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "Joanna says the girl is furniture and I'm sentimental. Gerard says very little, since he's the one who gives Theresa her orders, and a man seldom questions an arrangement that fetches his supper things for him." } },
      choices = {
        { text = "Joanna seems very sure of herself.", next = "joanna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    joanna = {
      lines = { { id = "j_default", text = "Joanna is sure about everything, and it has carried her through dying, which is more than doubt has done for me. I'd still rather stand next to her than next to anyone who agreed with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "I've heard the priests of the Forsaken can push a mind aside for a short while, and that the owner comes back to it afterward. What holds Theresa is the same trick made permanent, I think, and nobody has been able to tell me whether the owner is still waiting." } },
      choices = { { text = "I couldn't tell you either. Something else.", next = "BACK" } },
    },
    lt_spoke = {
      lines = { { id = "lt_sp_default", text = "Once. I asked her name, and she told me, and then she told me where Gerard's parcel was going, in exactly the same voice. I couldn't think what to ask her after that, so I let her go on her way." } },
      choices = {
        { text = "What would you ask her now?", next = "lt_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lt_ask = {
      lines = { { id = "lt_a_default", text = "Whether she hears herself, at the back, the way I did. If she does, then someone ought to tell her she isn't mad, because nobody told me, and I spent a long while thinking I was." } },
      choices = {
        { text = "And if Gerard caught you at it?", next = "lt_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lt_stance = {
      lines = { { id = "lt_st_default", text = "Gerard would say I'd interfered with his property, and the law of this city would probably agree with him. I'm not brave, you understand. I only keep wondering what the right thing would be." } },
      choices = {
        { text = "Ask her anyway. Some things matter more than the law.", next = "BACK", reply = "You make it sound simple. Perhaps it is, from the outside.", fx = { align = { order = -1 } } },
        { text = "Leave it be. The city's laws keep the peace down here.", next = "BACK", reply = "That's what Joanna says, more or less. I suppose you're both right.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken_x", text = "We're the ones who woke up. Some days that feels like a gift, and some days like a sentence." } },
    background = { { id = "tp_bg", text = "I was nobody of note in Lordaeron, and then I was a body in the Lich King's ranks, and now I stand in the War Quarter asking questions nobody wants." } },
    _none = { { id = "tp_none", text = "I don't know, and I've enough unanswered questions already. Joanna might have an opinion; she usually does." } },
  },
}

-- Lucian Fenner: loiters in the Rogues' Quarter; knows locks.
P:NPC {
  key = "uc_lucian_fenner", id = TODO_NPC("Lucian Fenner"), name = "Lucian Fenner", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "sly", "quiet" }, values = { "cunning" },
  notices = { "class" },
  impression = {
    first = "Lucian Fenner stands about the Rogues' Quarter with the air of a man waiting for a door to be left unattended. He talks about locks as others talk about old friends, and he looked at my pack's buckles longer than I liked.",
    third = "{name} met Lucian Fenner, a Forsaken of the Rogues' Quarter with a professional interest in locks.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, friend. Your buckles are still on, you'll notice. I only admire the friends I like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ah, you. Keep a hand on that purse, then; I'll not take offence, but I won't pretend I'm not looking." },
    { id = "g_default", text = "I'm not selling anything, friend, and I'm not buying, so you may put your hand back on your purse and relax." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back with everything you left with, I trust. I'd hate to be blamed for somebody else's work." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Those are a picker's fingers, and you keep them loose the way Mennet's people are taught. We'll get along, provided you keep them out of my coat." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Lucian Fenner. I used to open things for a living in Capital City, and since nobody down here locks anything worth having, I mostly stand and remember how it was done." },
      },
      again = {
        { id = "h_again", text = "Anything further? I've a wall to lean on." },
        { id = "h_again2", text = "Ask away, quietly if you can." },
      },
      choices = {
        { text = "You were a locksmith?", next = "locks" },
        { text = "What goes on in this quarter?", next = "quarter" },
        { text = "Any advice for someone learning locks?", next = "advice", when = { class = "ROGUE" } },
        { text = "Did you ever get caught, back in Capital City?", next = "lf_caught" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    locks = {
      lines = { { id = "l_default", text = "A locksmith by day, and the reason people needed one by night, which was a tidy way to run a trade. The merchants of the capital paid me twice for every door, and never once put the two bills together." } },
      choices = {
        { text = "What became of all those doors?", next = "doors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doors = {
      lines = { { id = "d_default", text = "They're up above us in the ruins, hanging open, with nothing behind them but rats and the Dark Lady's sentries. It offends me a little, to tell the truth, that the Scourge got into every house in Lordaeron without picking a single lock." } },
      choices = { { text = "They did skip that step. Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Mennet Carkad's Deathstalkers train in the back, the poison sellers and the knife merchants do steady trade, and everyone minds their own affairs very loudly. It's the one part of the city where being watched is a compliment." } },
      choices = {
        { text = "And who watches you?", next = "watched" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watched = {
      lines = { { id = "w_default", text = "Everyone, I expect, and I watch them back, so we are all kept honest by mutual suspicion. A kinsman of mine sells arrows in the War Quarter and says it is friendlier there, but he has never had a talent for subtlety." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Practise on cheap locks until your hands do it without you, because the day you have to think about a tumbler is the day somebody comes round the corner. And never carry your picks in the same pocket as your excuses." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lf_caught = {
      lines = { { id = "lf_c_default", text = "Once, by a magistrate's housekeeper who came down for a glass of milk. She hit me with the jug, and I spent a season in the king's gaol below the capital. It was the only holiday I ever took." } },
      choices = {
        { text = "What was the gaol like?", next = "lf_stockade" },
        { text = "Were you a Ravenholdt man?", next = "BACK", when = { class = "ROGUE" }, reply = "I never earned the invitation, and I was wise enough not to go looking for it uninvited." },
        { text = "Something else.", next = "BACK" },
      },
    },
    lf_stockade = {
      lines = { { id = "lf_s_default", text = "Damp, and full of people who knew more than I did. I learned more about locks in that cell than in ten years of honest burglary, mostly from an old Alterac fence who wouldn't stop talking." } },
      choices = {
        { text = "And what do you think of thieving now?", next = "lf_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lf_stance = {
      lines = { { id = "lf_st_default", text = "I think a door is a promise, and a thief is the fellow who checks whether it was kept. The Dark Lady's people call it intelligence work now and pay for it, which takes some of the shine off." } },
      choices = {
        { text = "A thief's still a thief, whoever pays him.", next = "BACK", reply = "Spoken like someone who has never been paid well. I envy you a little.", fx = { align = { honor = 1 } } },
        { text = "Taking from fools who don't lock up is fair game.", next = "BACK", reply = "A sound philosophy. I lived by it for twenty years and died by something else entirely.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deathstalkers = { { id = "tp_deathstalkers_x", text = "Mennet's lot. They do what I did, but with knives and permission." } },
    lordaeron = { { id = "tp_lordaeron_x", text = "Every lock in the capital is open now. I'd have liked to do it slowly, one at a time." } },
    background = { { id = "tp_bg", text = "I kept a locksmith's shop in the capital and a second trade after dark. Death closed the shop, though I've kept the habits." } },
    _none = { { id = "tp_none", text = "That's a door I've not been through. Ask in the back, among the Deathstalkers, if they'll speak to you." } },
  },
}

-- Marla Fowler: in the crowd cheering Edward and Tyler in the War Quarter; kin to Baltus Fowler.
P:NPC {
  key = "uc_marla_fowler", id = TODO_NPC("Marla Fowler"), name = "Marla Fowler", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "loud", "cheerful" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Marla Fowler stands in the crowd around the War Quarter's fighting floor and shouts advice at Edward and Tyler, none of which they can hear. She is a Fowler, like Baltus the warrior trainer, and has the family's lungs.",
    third = "{name} met Marla Fowler, who cheers the fighters in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are! Stand here beside me and help me shout; Tyler's dropping his left again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand somewhere else and shout your own advice, if you've any." },
    { id = "g_default", text = "Stand here if you want to see, but don't block me, because I've been shouting at Tyler's footwork all day and I'm not finished." },
    { id = "g_back", when = { metBefore = true }, text = "You're back for the next bout! Good, you've missed nothing but a ghoul, and it didn't last." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Now you look as if you could go a round down there yourself. Don't tell Baltus I said so, or he'll have you doing drills until your arms come off." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Marla Fowler! Brother Malach calls something up, Edward and Tyler knock it down, and the rest of us tell them how they should have done it. It's the best entertainment in the Undercity, and it's free." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, they're about to start again." },
        { id = "h_again2", text = "Go on, I can listen and shout at the same time." },
      },
      choices = {
        { text = "What are they fighting down there?", next = "fight" },
        { text = "Are you related to Baltus Fowler?", next = "baltus" },
        { text = "Who else is in the crowd?", next = "crowd" },
        { text = "Who were you before you came to the fights?", next = "mf_before" },
        { text = "Enjoy the bout.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Malach starts them on human captives, who are quick enough but go down easily, and then a ghoul and a zombie to remind them what the Scourge feels like. He finishes with an abomination, and that's when it's worth having a good place at the front." } },
      choices = {
        { text = "Has the abomination ever won?", next = "abom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abom = {
      lines = { { id = "a_default", text = "Not while I've been watching, though it had Edward by the leg once and swung him about a good while before Tyler got round behind it. I shouted myself hoarse, and I haven't even got a throat to speak of." } },
      choices = { { text = "I'd have liked to see that. Something else.", next = "BACK" } },
    },
    baltus = {
      lines = { { id = "b_default", text = "He's family, and you can hear it, because no Fowler ever said a thing quietly that could be bellowed. He teaches warriors across the quarter, and I come here to see whether any of it has done them any good." } },
      choices = {
        { text = "And has it?", next = "good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "Edward keeps his shield up now, which he never did before, so I'll give Baltus that much. Tyler still drops his shoulder before he swings, and I've told him so forty times from up here." } },
      choices = { { text = "Tell him forty-one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crowd = {
      lines = { { id = "c_default", text = "Robert Gossom and Richard Van Brunt are the loud ones after me, Riley Walker wagers on every bout and wins about half, and Chloe Curthas and Andrew Hartwell argue over which is the better fighter. We're here most days, since the dead have few other appointments." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mf_before = {
      lines = { { id = "mf_b_default", text = "I kept a tavern by the docks at Lordamere, and I broke up more fights than Baltus ever started. You learn to read a brawl before it starts, which is why I can tell you Tyler's going to drop that shoulder again." } },
      choices = {
        { text = "Do you miss the tavern?", next = "mf_tavern" },
        { text = "I could teach Tyler a thing or two.", next = "BACK", when = { class = { "WARRIOR", "SHAMAN" } }, reply = "Go on, then, but he won't listen to you either. He doesn't listen to anybody." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mf_tavern = {
      lines = { { id = "mf_t_default", text = "I miss the noise, and this is the nearest thing to it in the whole city. Nobody drinks now and nobody sings, but they'll still shout at a fight, and that will have to do me." } },
      choices = {
        { text = "Is it right, setting captives against the fighters?", next = "mf_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mf_stance = {
      lines = { { id = "mf_s_default", text = "Malach says the humans in the pit were Scarlets who'd have burned us on sight, and I've no cause to doubt him. Still, one of them called for his mother last week, and the crowd went quiet for a moment." } },
      choices = {
        { text = "They're our enemies. The pit is fair enough.", next = "BACK", reply = "That's what I told myself, and I went on cheering after a while.", fx = { align = { light = -1 } } },
        { text = "Killing prisoners for sport isn't fighting. It's cruelty.", next = "BACK", reply = "Maybe so. Don't say it too loud near Malach, mind.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken_x", text = "We're loud enough, when there's something worth shouting about. There isn't often." } },
    advice = { { id = "tp_advice_x", text = "Keep your shield up and your shoulder down, and never fight a Fowler before breakfast." } },
    background = { { id = "tp_bg", text = "The Fowlers were loud in Lordaeron and we're loud down here. Dying didn't change much about us but the colour." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I can't think about it while there's a bout on. Ask me after the abomination." } },
  },
}

-- Mattie Alred: walks the War Quarter and the inner ring with Edrick Killian.
P:NPC {
  key = "uc_mattie_alred", id = TODO_NPC("Mattie Alred"), name = "Mattie Alred", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wry", "restless" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Mattie Alred walks the Undercity's inner ring and the War Quarter with Edrick Killian, round and round, talking the whole way. She says a city is only yours once your feet know it, and hers know every flagstone.",
    third = "{name} met Mattie Alred, who walks the rings of the Undercity with Edrick Killian.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and your feet are learning the stones too. Fall in; Edrick's already round the corner." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Walk on, then. Edrick and I go our own way round, and it isn't yours." },
    { id = "g_default", text = "Walk with us if you want to talk, because Edrick won't stop and I'd sooner not lose him at the next bridge." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. We've been round the ring twice since we saw you last, by my count." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Keep to the middle of the walkway, {race}, and don't lean over the canal. The living come over dizzy from the fumes, and nobody wants to fish you out." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Mattie Alred, and that's Edrick Killian setting the pace. We walk the inner ring and through the War Quarter and back again, and if there's something worth knowing in between, we've usually heard it." },
      },
      again = {
        { id = "h_again", text = "What else, then? Keep up, we're nearly at the bridge." },
        { id = "h_again2", text = "Go on, I can talk and walk." },
      },
      choices = {
        { text = "Why do you walk the ring all day?", next = "why" },
        { text = "What have you heard lately?", next = "heard" },
        { text = "I'm lost. Which way to the quarters?", next = "lost" },
        { text = "Do your feet remember any other city?", next = "ma_other" },
        { text = "I'll let you walk on.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the dead don't tire and don't sleep, and a body that sits still down here starts to feel like it belongs in one of the wall niches. Edrick took it up first, and I found I thought more clearly at his pace." } },
      choices = {
        { text = "What is Edrick like?", next = "edrick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    edrick = {
      lines = { { id = "e_default", text = "He's a Killian, so he looks at every wall as though he'd like to know what is behind it, like Brom the miner and Sarah with her picks. He'll talk of ore and weather for a whole lap of the ring, and I talk of everything else, so neither of us has ever had to put up with a silence." } },
      choices = { { text = "A good match for a long walk. Something else.", next = "BACK" } },
    },
    heard = {
      lines = { { id = "h2_default", text = "The apothecaries are buying more than they'll explain, the Deathguards coming back from the Bulwark say the Scourge is no thinner, and Sergeant Houser has been louder than usual at his recruits. That last one you can check for yourself from three bridges away." } },
      choices = {
        { text = "What's happening at the Bulwark?", next = "bulwark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark = {
      lines = { { id = "b_default", text = "It's the barricade on the road east, where Tirisfal runs into the Plaguelands, and it is all that stands between us and what we used to be. The ones who come home from it don't walk the ring with us; they stand very still for a few days first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      lines = { { id = "l_default", text = "Everyone is, the first week. The bank and the bat handlers are in the middle, and the four quarters hang off the outer ring: War, Rogues', Magic, and the Apothecarium beyond, with the canal running through all of it." } },
      choices = { { text = "That helps. Something else.", next = "BACK" } },
    },
    ma_other = {
      lines = { { id = "ma_o_default", text = "Southshore, a little, before I married inland. I can still feel the planks of the jetty if I close my eyes, but I don't go back, because the Alliance holds it and they'd not know me for the girl who sold mussels there." } },
      choices = {
        { text = "Would you go back, if you could?", next = "ma_back" },
        { text = "I've walked Southshore recently, as it happens.", next = "BACK", when = { race = "Human" }, reply = "Then you've seen more of it than I'll ever see again. Don't tell me if the jetty's gone." },
        { text = "Something else.", next = "BACK" },
      },
    },
    ma_back = {
      lines = { { id = "ma_b_default", text = "Only to walk it once, round and round like here, until my feet were sure of it. Edrick says that's maudlin, and that a Forsaken has no business with old roads. He's probably right, but he says it walking." } },
      choices = {
        { text = "Should the Forsaken take back the old lands?", next = "ma_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ma_stance = {
      lines = { { id = "ma_s_default", text = "The Deathguard talk of it every time they pass, how Hillsbrad and Southshore were Lordaeron once and ought to be again. I only want to walk on them, but I suppose walking needs a road someone holds." } },
      choices = {
        { text = "Those lands were Lordaeron's. The Forsaken should reclaim them.", next = "BACK", reply = "Then the Deathguard will be glad of you. Mind you come home to tell me.", fx = { align = { order = 1 } } },
        { text = "Let the living keep them. We've enough graves already.", next = "BACK", reply = "That's Edrick's answer, and he hasn't lost a step yet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lordaeron_x", text = "Every road in it is somebody's grave road now. I'd still walk them, given leave." } },
    advice = { { id = "tp_advice_x", text = "Learn the ring first, then the quarters. A lost soul down here can end up in the Apothecarium by mistake." } },
    background = { { id = "tp_bg", text = "I lived in the capital above us and never once came down to its sewers. Now I know them better than I knew my own street." } },
    _none = { { id = "tp_none", text = "We haven't heard a word about that on our rounds. Ask me again in a lap or two." } },
  },
}
