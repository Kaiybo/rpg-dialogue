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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I was nobody of note in Lordaeron, and then I was a body in the Lich King's ranks, and now I stand in the War Quarter asking questions nobody wants." } },
    _none = { { id = "tp_none", text = "I don't know, and I've enough unanswered questions already. Joanna might have an opinion; she usually does." } },
  },
}

-- Katrina Alliestar: herbalism supplier in the Apothecarium, kin to Martha Alliestar.
P:NPC {
  key = "uc_katrina_alliestar", id = TODO_NPC("Katrina Alliestar"), name = "Katrina Alliestar", title = "Herbalism Supplier", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "dry" }, values = { "practical", "craft" },
  notices = { "profession" },
  impression = {
    first = "Katrina Alliestar sells herb pouches and seed in the Apothecarium, beside her kinswoman Martha, who teaches the trade. Martha talks to the plants and Katrina counts them, and between the two of them nothing is wasted.",
    third = "{name} met Katrina Alliestar, who sells herbalists' supplies in the Undercity's Apothecarium.",
  },
  greetings = {
    { id = "g_default", text = "Herb pouches and gathering supplies. The apothecaries take the best of everything that comes in, so buy what you need before they come by." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I hope you've been keeping your cuttings dry, because damp ruins more herbs than clumsy fingers do." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You've green under your nails, or what passes for nails. Martha will be pleased; she likes to know somebody still goes up into the daylight to pick things." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Katrina Alliestar. Martha teaches you how to find a herb and I sell you something to carry it home in, which is the half of the business that actually pays." },
      },
      again = {
        { id = "h_again", text = "What else? The Society's runner is due, and he never waits." },
        { id = "h_again2", text = "Ask, or buy, or both if you can manage it." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How are you and Martha related?", next = "martha" },
        { text = "Where do the Society's herbs come from?", next = "society" },
        { text = "What sells best to the orcs and tauren?", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    martha = {
      lines = { { id = "m_default", text = "By marriage and by the plague, which between them make a close family. She kept a garden near Brill and I kept the accounts of a seed merchant in the capital, so you can see how the work divided itself." } },
      choices = {
        { text = "She keeps a peacebloom by a grate.", next = "peacebloom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peacebloom = {
      lines = { { id = "p_default", text = "She does, and she turns the pot twice a day so it gets what light comes down. I told her it was a waste of a good pot, and then I found myself watering the thing when she was out, so you may draw your own conclusions." } },
      choices = { { text = "I'll say nothing to her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    society = {
      lines = { { id = "s_default", text = "Gatherers bring them down from Tirisfal and Silverpine, and the Royal Apothecary Society buys by the crate, mostly the unpleasant sorts. I have learned not to ask what a man wants with forty bundles of grave moss." } },
      choices = {
        { text = "And what do you suppose he wants?", next = "moss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moss = {
      lines = { { id = "mo_default", text = "The New Plague, like everything else in this wing, and it will be ready when Master Faranell says it's ready. Until then I sell pouches and keep my suppositions to myself, and I'd advise you to do likewise." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "The tauren buy more pouches than anyone and thank each plant before they cut it, which Martha finds charming and I find slow. Your orcs want whatever stops bleeding, and they want it by the armful." } },
      choices = { { text = "That sounds right. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a seed merchant's books in Capital City. Now I keep my own, under what's left of it, and the sums come out much the same." } },
    _none = { { id = "tp_none", text = "That's not something I stock or know. Try Martha, if it grows, or Doctor Felben, if it bubbles." } },
  },
}

-- Lizbeth Cromwell: fishing supplies in the Magic Quarter, beside Armand Cromwell.
P:NPC {
  key = "uc_lizbeth_cromwell", id = TODO_NPC("Lizbeth Cromwell"), name = "Lizbeth Cromwell", title = "Fishing Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "wry", "patient" }, values = { "practical" },
  notices = { "profession" },
  impression = {
    first = "Lizbeth Cromwell sells poles, lures and bait in the Magic Quarter, next to Armand Cromwell and his lessons. She keeps her worms in a covered bucket and speaks of them with more fondness than she spares for most customers.",
    third = "{name} met Lizbeth Cromwell, who sells fishing supplies in the Undercity's Magic Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Poles, baubles and nightcrawlers, all of them fresher than I am. Mind the bucket, if you please." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more bait? Either the fish are biting or you've been feeding the canal again." },
  },
  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "You hold yourself like someone who's stood on a bank for hours without complaint. Armand says patience can't be taught, and then he charges for trying." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Lizbeth Cromwell. Armand teaches the casting and I sell everything that goes on the end of the line, so between us the Cromwells will have your silver one way or the other." },
      },
      again = {
        { id = "h_again", text = "Something else? The worms aren't going anywhere, and neither am I." },
        { id = "h_again2", text = "Go on. I've all the time there is." },
      },
      choices = {
        { text = "Let me see your tackle.", next = "BUSINESS" },
        { text = "Where do you get worms down here?", next = "worms" },
        { text = "Is there anywhere near worth fishing?", next = "where" },
        { text = "Good day.", next = "END" },
      },
    },
    worms = {
      lines = { { id = "w_default", text = "This city sits under a graveyard the size of a kingdom, dear, so worms are the one thing we have never run short of. I pick them over myself, because a fat nightcrawler is worth three thin ones to a mud snapper." } },
      choices = {
        { text = "That's an unsettling harvest.", next = "harvest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harvest = {
      lines = {
        { id = "ha_scourge", when = { race = "Scourge" }, text = "You and I have both been on the other side of that arrangement, so I think we're entitled to collect. I find it rather satisfying to be the one holding the bucket." },
        { id = "ha_default", text = "It unsettles the living, I've noticed, and yet they still buy the bait. The worms had their turn at us, and now it is ours, which seems fair enough to me." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "Not in the canals, whatever the bold ones tell you, because that green muck eats line and hook together. Take the lift up and try Brightwater Lake or the north coast of Tirisfal, where the fish are thin and gloomy but they are at least fish." } },
      choices = {
        { text = "What bites up there?", next = "bites" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bites = {
      lines = { { id = "b_default", text = "Smallfish and mud snapper in the lake, and slitherskin mackerel off the shore if you've the reach for it. A shiny bauble helps on a dull day, and Tirisfal hasn't had any other kind since the plague." } },
      choices = { { text = "I'll take a bauble, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Cromwells fished the lakes of Lordaeron for generations. We've only changed which side of the worm we stand on." } },
    _none = { { id = "tp_none", text = "I only know what bites and what it bites on. Ask Armand, and bring a chair, for he'll take his time answering." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a locksmith's shop in the capital and a second trade after dark. Death closed the shop, though I've kept the habits." } },
    _none = { { id = "tp_none", text = "That's a door I've not been through. Ask in the back, among the Deathstalkers, if they'll speak to you." } },
  },
}

-- Malcomb Wynn: apprentice enchanter in the Apothecarium; teaches beginners.
P:NPC {
  key = "uc_malcomb_wynn", id = TODO_NPC("Malcomb Wynn"), name = "Malcomb Wynn", title = "Apprentice Enchanter", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "earnest", "dry" }, values = { "craft" },
  notices = { "profession" },
  impression = {
    first = "Malcomb Wynn is an apprentice enchanter who teaches the first steps of the craft to anyone newer than himself. He handles a copper rod as if it might be taken away from him, and he quotes Lavinia Crowe in every other sentence.",
    third = "{name} met Malcomb Wynn, an apprentice enchanter who teaches beginners in the Undercity.",
  },
  greetings = {
    { id = "g_default", text = "If you want to learn enchanting from the beginning, you've found the right man, since the beginning is the part I'm trusted with." },
    { id = "g_back", when = { metBefore = true }, text = "Have you been practising? Mistress Crowe says a rod left idle for a week has to be taught its manners again." },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "There is dust on your cuffs, and it's the good kind, so somebody has already started you. I can take you a little further before you'll need my betters." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Malcomb Wynn, apprentice enchanter. I teach the first lessons, which are mostly how to break a thing down to dust without losing your eyebrows, supposing you still have any." },
      },
      again = {
        { id = "h_again", text = "Is there more? I've a rod to finish before Mistress Crowe inspects it." },
        { id = "h_again2", text = "Yes, go on, I can talk and polish at once." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "Why does an apprentice teach?", next = "teach" },
        { text = "What is the first lesson, exactly?", next = "lesson" },
        { text = "How does dust feel to dead fingers?", next = "dead", when = { race = "Scourge" } },
        { text = "Good day, Malcomb.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Because the masters have no patience left for people who hold the rod by the wrong end, and I held it that way myself not long ago. Lavinia Crowe takes them once I've made them safe to stand near." } },
      choices = {
        { text = "Is she a hard teacher?", next = "crowe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowe = {
      lines = { { id = "c_default", text = "She is exacting, which I've decided is a different thing. She once made me disenchant the same pair of gloves in my head for an hour before she let me touch them, and I have not wasted an essence since." } },
      choices = { { text = "That sounds like a lesson learned. Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "l_default", text = "You take something with a little magic in it and you unpick the magic from the thing, carefully, so that you're left holding dust and not a scorch mark. Everything else in the craft is putting that dust back somewhere more useful." } },
      choices = {
        { text = "And where do I find the supplies?", next = "supplies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "Thaddeus Webb, just here, sells rods and vellum and the formulas a beginner can afford. He'll also tell you what he thinks of your prospects, which costs nothing and is worth about as much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dead = {
      lines = { { id = "d_default", text = "You'll find you can't feel the grain of it as the living do, so you learn to watch how it catches the light instead. I think it makes us better at the work, since we aren't distracted by the tingling they all complain about." } },
      choices = { { text = "Good to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a clerk's boy in Lordaeron who never touched magic. I found the craft after I rose, and I intend to be a master of it, given that I've the time." } },
    _none = { { id = "tp_none", text = "I'm only an apprentice, and that's beyond my lessons. Mistress Crowe would know, if you catch her in a good temper." } },
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I lived in the capital above us and never once came down to its sewers. Now I know them better than I knew my own street." } },
    _none = { { id = "tp_none", text = "We haven't heard a word about that on our rounds. Ask me again in a lap or two." } },
  },
}

-- Millie Gregorian: tailoring supplies in the Magic Quarter; kin to Josef Gregorian.
P:NPC {
  key = "uc_millie_gregorian", id = TODO_NPC("Millie Gregorian"), name = "Millie Gregorian", title = "Tailoring Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "prim", "dry" }, values = { "craft", "practical" },
  notices = { "profession" },
  impression = {
    first = "Millie Gregorian sells thread, dye and bolts of cloth to the tailors of the Magic Quarter. She is a Gregorian, like Josef, and shares his opinion that most people's work could stand to be done again properly.",
    third = "{name} met Millie Gregorian, who sells tailoring supplies in the Undercity's Magic Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Thread, dyes and needles. Please don't finger the bolts unless you mean to buy, because grave dirt does not wash out of linen." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, so either the thread held or it didn't. I would like to hear which before I sell you more." },
  },
  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "That hem is your own work, I think, and it's straighter than most I see. You'll want the fine thread, then, and not the coarse spool I sell to the apprentices." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Millie Gregorian. I supply the tailors of this quarter, and I can tell you that the Forsaken have become very particular about their clothes since they started having to be sewn into them." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I've spools to sort by weight." },
        { id = "h_again2", text = "Yes? Ask, and mind the dye pots." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Sewn into them?", next = "sewn" },
        { text = "Are you kin to Josef Gregorian?", next = "josef" },
        { text = "Which dyes sell best in the Undercity?", next = "dyes" },
        { text = "Good day.", next = "END" },
      },
    },
    sewn = {
      lines = { { id = "s_default", text = "A robe hides a great deal, but it hangs badly on a shoulder that has come loose, so a careful tailor will take a stitch or two in the wearer as well. I sell a waxed thread for the purpose, and I don't put it on the sign." } },
      choices = {
        { text = "Does that trouble the tailors?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "t_scourge", when = { race = "Scourge" }, text = "It troubles them far less than a customer who rattles, as you'll know if you've ever lost a finger in a sleeve. Come to me before the seam goes, and not after, is all I ask." },
        { id = "t_default", text = "It troubled them once, and then they noticed how much better the robes sat afterward. Pride in one's work survives a good deal, I've found, including the customer's death and one's own." },
      },
      choices = { { text = "Practical of you. Something else.", next = "BACK" } },
    },
    josef = {
      lines = { { id = "j_default", text = "I am, and you'll find the family resemblance is mostly in the standards. Josef can tell at a glance whether a thing was made with care, and I can tell at a glance whether the person buying my silk deserves it." } },
      choices = {
        { text = "And do I deserve it?", next = "deserve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserve = {
      lines = { { id = "d_default", text = "You've asked, which most don't, so I'll allow that you might. Buy the linen first and bring me something you've made from it, and then we can discuss silk like civilised people." } },
      choices = { { text = "Linen it is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dyes = {
      lines = { { id = "dy_default", text = "Black, grey and purple, in that order, with red for those who want the Dark Lady's colours on their sleeve. I sold a pot of yellow once, to a troll, and I have thought about it ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Gregorians kept a draper's shop in Capital City. The shop is rubble, but the ledgers were in my head, so I began again below it." } },
    _none = { { id = "tp_none", text = "That's no concern of a draper's. Ask someone whose trade it is, and let me get on with mine." } },
  },
}

-- Nathaniel Steenwick: thrown weapons merchant in the Rogues' Quarter.
P:NPC {
  key = "uc_nathaniel_steenwick", id = TODO_NPC("Nathaniel Steenwick"), name = "Nathaniel Steenwick", title = "Thrown Weapons Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "sly", "precise" }, values = { "craft", "cunning" },
  notices = { "class" },
  impression = {
    first = "Nathaniel Steenwick sells throwing knives and axes in the Rogues' Quarter and weighs each one on a fingertip before he hands it over. He's polite in the way of a man who could put a blade in a doorframe beside your ear if you haggled.",
    third = "{name} met Nathaniel Steenwick, who sells thrown weapons in the Undercity's Rogues' Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Knives and axes for throwing, every one of them balanced by me. Pick one up, by all means, but point it at the wall and not at the other customers." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back, and I assume the last lot are still stuck in something a long way off. That is the nature of the trade, and I don't complain of it." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You stand side-on without thinking about it, which is how a thrower stands. The Deathstalkers buy the small balanced daggers, and I'd suggest the same for a wrist like yours." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nathaniel Steenwick. I deal in weapons that leave the hand, which makes my customers the only ones in the Undercity who are pleased when they come back with nothing." },
      },
      again = {
        { id = "h_again", text = "Something more? I've a crate of axes to true." },
        { id = "h_again2", text = "Ask, and I'll answer as straight as I throw." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What makes a good throwing knife?", next = "knife" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Would a warrior have use for these?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Good day, Steenwick.", next = "END" },
      },
    },
    knife = {
      lines = { { id = "k_default", text = "The balance, and nothing else comes close to mattering. A pretty knife that tumbles badly is jewellery, and an ugly one that turns over once and arrives point first is worth every copper I ask for it." } },
      choices = {
        { text = "And an axe?", next = "axe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    axe = {
      lines = { { id = "a_default", text = "An axe forgives a poor throw, because whichever part of it reaches the target will do some harm. I recommend them to beginners and to orcs, and I mean no insult to either, since both seem happy with the arrangement." } },
      choices = { { text = "None taken. Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Mennet Carkad's Deathstalkers, chiefly, who want something quiet for a sentry on a wall. After them come the warriors who are tired of running after things, and the odd troll who critiques my stock at length and then buys the cheapest axe." } },
      choices = {
        { text = "The trolls know their throwing.", next = "trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = {
        { id = "tr_troll", when = { race = "Troll" }, text = "You do, and I'd never say otherwise to your face, with those arms. I'll only observe that a Darkspear axe is carved to look frightening and mine are ground to fly straight, and we may let the target judge between us." },
        { id = "tr_default", text = "They do, and I've learned a thing or two from watching how they loose from the shoulder. I simply wish they would learn in return that a merchant must eat, or at any rate must pay his rent." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "More than you would think. Something always runs, or stands on a ledge, or hides behind a friend, and a thrown axe brings it back to where your sword can discuss the matter." } },
      choices = { { text = "I'll keep one on my belt. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I threw knives at fairs in Lordaeron, for coins and applause. The crowds here are quieter and the targets less willing, but the principle holds." } },
    _none = { { id = "tp_none", text = "That's wide of anything I know. I'd only be guessing, and I dislike missing." } },
  },
}

-- Nicholas Atwood: gun merchant in the War Quarter.
P:NPC {
  key = "uc_nicholas_atwood", id = TODO_NPC("Nicholas Atwood"), name = "Nicholas Atwood", title = "Gun Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Nicholas Atwood sells blunderbusses and shot in the War Quarter, to a people who mostly prefer blades and curses. He treats black powder with the respect of a man who knows he would burn very quickly.",
    third = "{name} met Nicholas Atwood, the gun merchant of the Undercity's War Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Guns, shot and powder. Keep any torches, pipes and fire spells well back from the table, because I'm drier than kindling and so is my stock." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more shot, are you? Then the last lot went somewhere useful, I hope." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and a living one, as they all are. You're the only folk who walk in here knowing what they want, so tell me the bore and I'll find the shot." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll oblige me by keeping your hands cold while you're near the powder kegs." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nicholas Atwood, gunsmith's merchant. The pieces are dwarf-pattern and goblin-pattern, bought through Booty Bay, and I'll admit no Forsaken hand designed them, but a dead man's aim is steady and he never flinches at the bang." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've barrels to oil." },
        { id = "h_again2", text = "Speak up, the forges are loud today." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Do the Forsaken buy many guns?", next = "forsaken" },
        { text = "Why does fire worry you so much?", next = "fire" },
        { text = "What would you sell a hunter like me?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Good day, Atwood.", next = "END" },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Fewer than I'd like. The Deathguard trusts its blades, the mages think powder is vulgar, and the apothecaries would rather poison a man slowly. It's the warriors and the Deathstalkers who keep me in business, along with every orc who wanders down the lift." } },
      choices = {
        { text = "What do the Deathstalkers want with guns?", next = "stalkers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalkers = {
      lines = { { id = "s_default", text = "One shot, from a long way off, at a Scarlet officer who thinks his wall is high enough. It's noisy work for quiet people, so they buy one good piece and very little shot, and they don't tell me how it went." } },
      choices = { { text = "I can guess how it went. Something else.", next = "BACK" } },
    },
    fire = {
      lines = { { id = "fi_default", text = "Because the living scorch and heal, and we simply go up like old paper. I watched the Scarlet Crusade put a torch to a Forsaken in Tirisfal once, and it was over before he had finished turning round." } },
      choices = {
        { text = "And yet you sell black powder.", next = "powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder = {
      lines = { { id = "p_default", text = "I do, and I store it in sealed kegs on the canal side, where the damp does half my worrying for me. A man may keep a wolf, provided he never once forgets that it is a wolf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "A solid blunderbuss if you're starting out, and the long-barrelled pieces once you can afford to miss less often. Your beast won't like the noise the first week, so loose a few shots somewhere open before you trust it in a fight." } },
      choices = { { text = "Good counsel. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold fowling pieces to the gentry of Lordaeron. The gentry are dead and so am I, and the customers shoot at worse than pheasants now." } },
    _none = { { id = "tp_none", text = "I know barrels and shot, and that isn't either. Try the trainers across the quarter." } },
  },
}
