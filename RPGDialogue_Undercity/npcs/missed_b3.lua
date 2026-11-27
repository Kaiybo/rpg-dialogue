-- Undercity folk the first passes missed (part 3 of 3): Sergeant Rutger and the recruit Travist Bosk, Tyler of the
-- War Quarter pit, Silas Zimmer in the Temple of the Damned, Susan Tillinghast of the Rogues' Quarter, enchanting
-- supplier Thaddeus Webb, Theodore Griffs at his bookshelf, the sick tauren Thersa Windsong, Jezelle Pruitt's pupils
-- Victor Bartholomew and Winifred Kerwin, and apprentice tailor Victor Ward. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sergeant Rutger: a sergeant of the Deathguard in the War Quarter.
P:NPC {
  key = "uc_sergeant_rutger", id = TODO_NPC("Sergeant Rutger"), name = "Sergeant Rutger", title = "Sergeant", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "grim" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Sergeant Rutger keeps the Deathguard's rolls in the War Quarter and speaks in the flat, quick way of a man who has read too many casualty lists. Where Sergeant Houser shouts, Rutger simply waits until you've finished being wrong.",
    third = "{name} met Sergeant Rutger, a sergeant of the Deathguard in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You. Good. You're still on the rolls, and that's the best news I'll have all week." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I've a watch to post, and you're not on my list of people I've time for." },
    { id = "g_default", text = "State your business, {class}. I've a watch to post and four names fewer to post it with than I had last week." },
    { id = "g_back", when = { metBefore = true }, text = "You're still in one piece, I see. Then you're doing better than the patrol I sent to the Bulwark." },
  },
  notice = {
    { id = "n_fighter", cat = "class", when = { class = { "WARRIOR", "HUNTER", "ROGUE" } },
      text = "You look as though you can handle yourself, and I've a use for such people. Deathguard Dillinger in Brill and the Executor at the Bulwark never have enough of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Sergeant Rutger, of the Deathguard. Houser makes the soldiers and I decide where they stand, which is the less cheerful half of the work, since I'm the one who knows how many come back." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be quick about it." },
        { id = "h_again2", text = "Go on, {class}, I'm listening." },
      },
      choices = {
        { text = "Every name on the casualty roll deserves to be recorded properly.", next = "BACK", reply = "It does. I write them carefully, every one. It's all I can do for them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pad the rolls a little. Nobody checks the dead.", next = "BACK", reply = "I check them. That's the whole of my job, and I'll thank you not to mock it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where do you send them?", next = "posts" },
        { text = "How many come back?", next = "back" },
        { text = "The Horde could send you soldiers.", next = "horde", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "Who were you, before the Deathguard?", next = "sr_before" },
        { text = "As you were, Sergeant.", next = "END" },
      },
    },
    posts = {
      lines = { { id = "p_default", text = "The city's gates and lifts first, then Brill and the road, then the Bulwark where Tirisfal meets the Plaguelands. What's left goes south to the Sepulcher in Silverpine and to Tarren Mill, where the humans of Hillsbrad are still pretending we'll go away." } },
      choices = {
        { text = "Which post is the worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The Bulwark, without question, because the Scourge sends our own dead back at us there. The Scarlet Crusade in the north of Tirisfal is a close second, though at least a Scarlet has the courtesy to stay down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    back = {
      lines = { { id = "b_default", text = "Enough to hold the line and never enough to move it. We can't raise sons to replace the fallen as the living do, so every Deathguard I lose is one the Dark Lady doesn't get back, unless some old grave gives up a new recruit, and those are running short." } },
      choices = {
        { text = "That's a hard sum to live with.", next = "sum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sum = {
      lines = { { id = "s_default", text = "It's the only sum there is, {class}, and I do it every morning. It's why I'm sparing with them, and why I'll take a capable stranger over a brave recruit any day of the week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "It could, and now and then it does, and I'll say for your people that they fight well and ask few questions. They also can't stand the smell of the place for more than a week, so I've learned not to write them into the roster in ink." } },
      choices = { { text = "A fair complaint. Something else.", next = "BACK" } },
    },
    sr_before = {
      lines = { { id = "sr_b_default", text = "A sergeant in the Lordaeron foot, keeping the muster roll at the garrison by Andorhal. I counted men going out and men coming back for eleven years, and the difference was always somebody's son. Nothing about the job has changed except the uniform." } },
      choices = {
        { text = "Andorhal? The Scourge holds it now.", next = "sr_andorhal" },
        { text = "I've served at the Bulwark myself.", next = "BACK", when = { minLevel = 50 }, reply = "Then you're on my roll somewhere, and I'm glad to see you still standing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sr_andorhal = {
      lines = { { id = "sr_a_default", text = "It does. The granaries there sent out the plague grain, and I signed for some of it without a second look. I think of that whenever I sign for anything now, and I read every line twice." } },
      choices = {
        { text = "Should the Deathguard spend themselves retaking it?", next = "sr_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sr_stance = {
      lines = { { id = "sr_s_default", text = "Andorhal is a city of rot, and every soldier I send toward it is one fewer on the wall at the Bulwark. The High Executor wants it back, and the Dark Lady wants vengeance. I want my roll to stop shrinking, which counts for nothing." } },
      choices = {
        { text = "Orders are orders. If the Dark Lady wants Andorhal, take it.", next = "BACK", reply = "That's the soldier's answer, and I've given it myself, many times.", fx = { align = { order = 1 } } },
        { text = "Hold the wall and stop throwing lives at ruins.", next = "BACK", reply = "Say that to Houser and he'll have you scrubbing armour for a month. I'll not argue with you, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge_x", text = "They don't keep rolls, and they don't need to. Every one of ours they kill, they keep." } },
    lordaeron = { { id = "tp_lordaeron_x", text = "I served its king for eleven years. Its king killed my whole company in one winter." } },
    background = { { id = "tp_bg", text = "I was a soldier before the plague and I'm a soldier after it. Only the roll has changed, and it gets shorter every month." } },
    _none = { { id = "tp_none", text = "That's not a matter for the watch. Take it to someone with time to spare." } },
  },
}

-- Silas Zimmer: stands in the Temple of the Damned, across from Hannah Akeley.
P:NPC {
  key = "uc_silas_zimmer", id = TODO_NPC("Silas Zimmer"), name = "Silas Zimmer", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "quiet", "grim" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Silas Zimmer stands in the Temple of the Damned across from Hannah Akeley's reagent table, with powders and old charms laid out before him that he doesn't seem to be selling. He studies the warlocks who pass him with a collector's patience.",
    third = "{name} met Silas Zimmer, who keeps a table of old charms in the Undercity's Temple of the Damned.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you. Come look; I've decided one of these charms might be yours, if you want it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Look all you like, but you'll be looking at nothing that leaves my table." },
    { id = "g_default", text = "Look all you like, but nothing here is priced. I haven't decided yet whether any of it ought to leave my keeping." },
    { id = "g_back", when = { metBefore = true }, text = "You're back at my table. The charms haven't changed, and neither has my mind about them." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp's eyes went straight to the third charm from the left. It did the same last time one of you came by, which is why that one will never be for sale." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Silas Zimmer. I gather relics, the small sort that people kept in drawers and wore under their shirts, and I bring them here because the warlocks' temple is the one place in the city where nobody asks what a thing is for." },
      },
      again = {
        { id = "h_again", text = "Was there more? Don't lean on the table." },
        { id = "h_again2", text = "Ask, then. I'm in no haste." },
      },
      choices = {
        { text = "What sort of relics?", next = "relics" },
        { text = "Hannah Akeley sells; why don't you?", next = "hannah" },
        { text = "Is any of this safe to touch?", next = "safe" },
        { text = "Which relic means the most to you?", next = "sz_dear" },
        { text = "I'll leave you to them.", next = "END" },
      },
    },
    relics = {
      lines = { { id = "r_default", text = "Saints' medals, plague charms, a lock of hair in a silver case, and a farmer's token against the murrain that plainly did not work. Lordaeron was full of little protections, and I find it instructive to hold them now and consider what they were up against." } },
      choices = {
        { text = "Do any of them still work?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "w_priest", when = { class = "PRIEST" }, text = "One of the medals grows warm when a priest stands near it, and it is warm now. I mention it as a courtesy, and I'd ask you not to pray at it, because I don't know what it would do." },
        { id = "w_default", text = "One of the medals grows warm near a priest, and the lock of hair is colder than it ought to be. As for the rest, I think they did what such things always did, which was to give frightened people something to hold." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hannah = {
      lines = { { id = "h2_default", text = "Hannah sells what is used up, powders and candles, and the Temple could not run a day without her. I keep what cannot be made again, and she has nailed a horseshoe up to guard her table from mine, which I choose to find flattering." } },
      choices = {
        { text = "She's superstitious about you?", next = "superstition" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superstition = {
      lines = { { id = "s_default", text = "She is superstitious about everything, and cheerfully so. She told me my table is unlucky, and then she asked whether I had a charm for sore joints, so I don't think her heart is in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safe enough for the dead, since most of it was made to keep death off and has nothing further to say to us. I would advise the living to keep their hands in their sleeves, and not out of superstition." } },
      choices = { { text = "I'll keep my hands to myself. Something else.", next = "BACK" } },
    },
    sz_dear = {
      lines = { { id = "sz_d_default", text = "A tin locket with a lock of red hair in it, taken from a girl I buried in the last week of the plague. She asked me to keep it safe until her mother came. Her mother never came, so I've kept it safe a long while." } },
      choices = {
        { text = "Do you think the relics hold any power?", next = "sz_power" },
        { text = "A priest might bless that locket for you.", next = "BACK", when = { class = "PRIEST" }, reply = "A priest of the Forgotten Shadow? I'd rather it kept the old blessing, thank you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sz_power = {
      lines = { { id = "sz_p_default", text = "The warlocks say no, and they ought to know power when they see it. But people prayed over these things for years, and prayer must go somewhere. I think a little of it lingers, the way smoke lingers in a church." } },
      choices = {
        { text = "Should the Light still matter to the Forsaken?", next = "sz_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sz_stance = {
      lines = { { id = "sz_s_default", text = "The Light burns us now, and the priests of my old parish would have burned me faster. Yet I carry their saints in my pocket. I don't pretend that makes sense. I only know I can't put them down." } },
      choices = {
        { text = "The Light abandoned you. You owe it nothing.", next = "BACK", reply = "That's the warlocks' sermon, and they preach it well. I still keep the locket.", fx = { align = { light = -1 } } },
        { text = "Keep faith. The Light may yet remember you.", next = "BACK", reply = "Kind of you to say. I'll not tell Hannah you said it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lordaeron_x", text = "Every village had a chapel and a sexton. Now there are only the graves, and fewer to dig them." } },
    forsaken = { { id = "tp_forsaken_x", text = "We lost the Light and kept the habits. I still take my hat off when I pass a grave." } },
    background = { { id = "tp_bg", text = "I was a sexton in a parish of Lordaeron and buried people with these things round their necks. It seemed right that somebody should gather them up again." } },
    _none = { { id = "tp_none", text = "I've no relic that answers that, nor any knowledge either. Ask the warlocks, if you can pay what they charge for an answer." } },
  },
}

-- Susan Tillinghast: wanders the Rogues' Quarter; a woods-wise scavenger.
P:NPC {
  key = "uc_susan_tillinghast", id = TODO_NPC("Susan Tillinghast"), name = "Susan Tillinghast", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wary", "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Susan Tillinghast walks the Rogues' Quarter with a satchel and a trapper's eye for corners. She lived rough in Tirisfal after she rose, before there was an Undercity to come home to, and it shows in how little she carries and how much she notices.",
    third = "{name} met Susan Tillinghast, a wanderer of the Undercity's Rogues' Quarter who knows how to live rough.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're quieter now. Good. Come walk the corners with me and I'll show you where the rats nest." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're loud as ever. Walk somewhere else and let them hear you there." },
    { id = "g_default", text = "You walk loudly for someone in this quarter. Nobody will rob you for it, but they'll all know where you are." },
    { id = "g_back", when = { metBefore = true }, text = "I heard you on the bridge before I saw you. You're a little quieter than last time, I'll grant." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at heel and mud to the knee. You're the first soul this week who looks as though they've slept somewhere without a roof." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Susan Tillinghast. I walk the quarter because I can't abide standing in one place, which is a habit from the months I spent in the Tirisfal woods with the Scourge on one side and the Scarlets on the other." },
      },
      again = {
        { id = "h_again", text = "What else? Walk with me, I don't stop for long." },
        { id = "h_again2", text = "Go on, and keep your voice down." },
      },
      choices = {
        { text = "How did you survive out there?", next = "survive" },
        { text = "Why keep to the Rogues' Quarter?", next = "quarter" },
        { text = "Tirisfal's game is poor hunting.", next = "hunter", when = { class = "HUNTER" } },
        { text = "What was Agamand Mills like, before?", next = "st_mills" },
        { text = "Walk safely, Susan.", next = "END" },
      },
    },
    survive = {
      lines = { { id = "s_default", text = "The dead need no food or fire, which is two-thirds of living rough dealt with before you start. The rest was learning to lie still in a ditch while a Scarlet patrol rode past, and learning which of the things shambling about could still be reasoned with." } },
      choices = {
        { text = "How did you tell which could?", next = "tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I said my own name aloud, and watched whether they flinched at the sound of a voice. The ones the Dark Lady had freed looked round, and the Lich King's only kept walking, and I was wrong just the once, which cost me most of this hand." } },
      choices = { { text = "A hard way to learn it. Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Because the people here watch their own backs, and I understand that better than I understand the Trade Quarter's chatter. The Deathstalkers leave me alone, and now and then one of them asks me how to cross open ground at night." } },
      choices = {
        { text = "And what do you tell them?", next = "night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = { { id = "n_default", text = "That you go slowly, along the low ground, and stop whenever the bats stop. I also tell them a name is a poor thing to share with a plaguebringer, since I've a kinsman in that line of work who has made ours known in places I'd rather it weren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It is, since the plague. The deer are thin, the bats taste of nothing, and half the hounds you'll see have been dead longer than I have. Go south to Silverpine if you want meat that fights back, and mind the worgen while you're about it." } },
      choices = { { text = "I'll try Silverpine. Something else.", next = "BACK" } },
    },
    st_mills = {
      lines = { { id = "st_m_default", text = "Grain and millwheels and the Agamands lording it over all of us from the big house. I set snares on their land and sold them rabbits they'd already paid for, and nobody ever caught on. Now the Agamands walk about their own fields, and not prettily." } },
      choices = {
        { text = "You've been back there since you rose?", next = "st_back" },
        { text = "Any tips for a hunter in Tirisfal?", next = "BACK", when = { class = "HUNTER" }, reply = "Watch the treeline, not the path. The Scarlets hide where nobody looks up." },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_back = {
      lines = { { id = "st_b_default", text = "Once, to fetch my old knife from under a stone. The mill was full of the Agamands' risen dead, all of them still giving orders. I took my knife and left them to it, and I'll not say I didn't enjoy that a little." } },
      choices = {
        { text = "Should the Forsaken put down the mindless dead?", next = "st_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_stance = {
      lines = { { id = "st_s_default", text = "The Deathguard say they ought to be put down, every one, before the Scourge finds a use for them. I was mindless once and somebody spared me long enough to wake. I don't know which side of that I'd choose." } },
      choices = {
        { text = "Put them down. Mercy now stops the Scourge later.", next = "BACK", reply = "A clean answer, and probably the right one. I still can't do it myself.", fx = { align = { honor = -1 } } },
        { text = "Give them the chance you were given.", next = "BACK", reply = "That's what I'd want for them. The woods taught me it seldom comes.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet_crusade_x", text = "They hunted me through the woods for a season. I learned to be quieter than they were." } },
    advice = { { id = "tp_advice_x", text = "Carry less than you think you need. You run faster light, and you'll run." } },
    background = { { id = "tp_bg", text = "I set snares for a living near Agamand Mills, before the plague. I rose alone and stayed out in the woods until the Dark Lady's people found me." } },
    _none = { { id = "tp_none", text = "I don't know it, and I don't guess. Guessing is how people get found." } },
  },
}

-- Theodore Griffs: studies a bookshelf in the inner room of the Apothecarium.
P:NPC {
  key = "uc_theodore_griffs", id = TODO_NPC("Theodore Griffs"), name = "Theodore Griffs", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "absent", "mild" }, values = { "learned", "curious" },
  notices = { "profession" },
  impression = {
    first = "Theodore Griffs stands facing a bookshelf in the inner room of the Apothecarium and answers questions without turning round. He is mild and absent in a wing full of people who are neither, and he seems not to have noticed.",
    third = "{name} met Theodore Griffs, who reads at a bookshelf in the Undercity's Apothecarium.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you. Come in, come in. I've found a page you might like, though I've forgotten why." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Hm? Oh. Please don't touch the shelf, or the green volume, or anything else, thank you." },
    { id = "g_default", text = "Hm? Oh, do come in, only don't move the green volume, because I've left it open at a page I shall want again." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you, I know the footsteps. I'm on the same shelf, I'm afraid, though two books further along." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "You smell of fadeleaf and something burnt, so you're an alchemist. Then perhaps you can tell me why every author on this shelf spells 'distillate' differently." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Theodore Griffs. I look things up for the apothecaries, since they are far too busy making discoveries to check whether somebody made the same one two hundred years ago. Very often somebody did." },
      },
      again = {
        { id = "h_again", text = "Yes? I'm listening, though I may not look as if I am." },
        { id = "h_again2", text = "Do go on. I can read and hear at once, more or less." },
      },
      choices = {
        { text = "What's on that shelf?", next = "shelf" },
        { text = "Do the apothecaries thank you for it?", next = "thanks" },
        { text = "You never turn round, do you?", next = "turn" },
        { text = "What are you looking up today?", next = "tg_today" },
        { text = "I'll leave you to your shelf.", next = "END" },
      },
    },
    shelf = {
      lines = { { id = "s_default", text = "The herbals and pharmacopoeias of old Lordaeron, with some Dalaran treatises that were copied badly. The physicians who wrote them were trying to keep people alive, of course, and the Society reads them the other way up, so to speak." } },
      choices = {
        { text = "Does that sit well with you?", next = "sit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sit = {
      lines = {
        { id = "si_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "I try not to let it sit anywhere. I find the reference, I mark the page, and what Master Faranell does with it is his affair and the Dark Lady's. You look as though you'd like a different answer, and I haven't one to give." },
        { id = "si_default", text = "I try not to let it sit anywhere. I find the reference, I mark the page, and what Master Faranell does with it is his affair and the Dark Lady's. A librarian who asked what the books were for would never finish shelving." },
      },
      choices = { { text = "A careful answer. Something else.", next = "BACK" } },
    },
    thanks = {
      lines = { { id = "t_default", text = "Seldom, because nobody likes to hear that his new compound is on page forty of a dead man's notebook. The chemists Cuely and Fuely are the politest about it, and they still go on and repeat the experiment, to see it for themselves." } },
      choices = {
        { text = "And are the old books ever wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Constantly, and with great confidence. One of them recommends a poultice of swiftthistle for the plague, and I keep it on the shelf at eye level, to remind me how sure a man can be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    turn = {
      lines = { { id = "tu_default", text = "I lose my place if I do, and then I must begin the shelf again from the left. I'm told there are some remarkable things in the room behind me, in cages, and I've found that I read more comfortably without having seen them." } },
      choices = { { text = "You may be the wisest man here. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tg_today = {
      lines = { { id = "tg_t_default", text = "Whether a Gilnean alchemist wrote anything on bone-softening agents before the Greymane Wall went up. The apothecaries want to know, and they want to know by tomorrow, and the index was compiled by a man who could not spell Gilneas." } },
      choices = {
        { text = "Do the apothecaries tell you why they need it?", next = "tg_why" },
        { text = "I'm an alchemist myself.", next = "BACK", when = { profession = "Alchemy" }, reply = "Then you'll know how often the old recipes were simply wrong. I find that comforting." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tg_why = {
      lines = { { id = "tg_w_default", text = "Never, and I've learned not to wonder. A librarian who wonders what his readers want with a book ends up refusing them, and I've no wish to refuse the Royal Apothecary Society anything at all." } },
      choices = {
        { text = "Should knowledge be shared, whatever it's used for?", next = "tg_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tg_stance = {
      lines = { { id = "tg_s_default", text = "My old master burned three books he thought wicked, and I've never forgiven him for it. But I've seen what comes out of the inner rooms here, and some nights I wonder whether he had the right of it after all." } },
      choices = {
        { text = "Knowledge is never wicked. Only its users are.", next = "BACK", reply = "That was my creed for forty years. It still is, mostly.", fx = { align = { light = -1 } } },
        { text = "Some books ought to burn.", next = "BACK", reply = "Perhaps. I'd want to read them first, which is rather the trouble.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_new_plague_x", text = "I look things up. What they build from them is not something I'm told, and not something I ask about." } },
    advice = { { id = "tp_advice_x", text = "Check the index, then check whoever compiled the index. Half of scholarship is distrust." } },
    background = { { id = "tp_bg", text = "I catalogued a nobleman's library near the capital. He is gone and the library with him, but the habit of looking things up has proved hard to kill." } },
    _none = { { id = "tp_none", text = "It isn't on this shelf, and I've not reached the next. Ask me again in a month or so." } },
  },
}

-- Travist Bosk: a recruit drilling under Sergeant Houser with Alyssa Blaye and Eldin Partridge.
P:NPC {
  key = "uc_travist_bosk", id = TODO_NPC("Travist Bosk"), name = "Travist Bosk", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "earnest", "nervous" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Travist Bosk swings at a straw dummy in the War Quarter under Sergeant Houser's eye, a beat behind every order. He is the newest of the three recruits and the most anxious to be shouted at less.",
    third = "{name} met Travist Bosk, a recruit training under Sergeant Houser in the Undercity's War Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, good, it's you! Watch my stroke a moment. Is it better? Please say it's better." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Please don't stand there. The Sergeant shouts more when you're about, and I can't afford it." },
    { id = "g_default", text = "I can't stop to talk, the Sergeant's watching, so I'll have to keep swinging while you ask whatever it is." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again. I've hit it nine times running since you were last here, though the Sergeant says only six of them counted." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You're a real warrior, aren't you? Would you mind standing just there, so the Sergeant looks at you for a while and not at my elbows?" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Travist Bosk, recruit, though the Sergeant mostly calls me 'Bosk, you're late.' I'm training for the Deathguard with Alyssa Blaye and Eldin Partridge, and I'm the worst of us three, but I'm less the worst than I was." },
      },
      again = {
        { id = "h_again", text = "What else? I have to keep my feet moving while you ask." },
        { id = "h_again2", text = "Go on, quickly, he's looking the other way." },
      },
      choices = {
        { text = "I'd rather learn the drill properly than look good doing it.", next = "BACK", reply = "Me too. Only the Sergeant wants both, and I've only got the first.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Just look busy when Houser's watching. That's all soldiering is.", next = "BACK", reply = "Don't let him hear you say that. He hears everything, and he shouts.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why did you join the Deathguard?", next = "join" },
        { text = "Is Sergeant Houser as hard as he sounds?", next = "houser" },
        { text = "You drop your guard after each swing.", next = "guard", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "How are you finding the training?", next = "tb_training" },
        { text = "Keep at it, Bosk.", next = "END" },
      },
    },
    join = {
      lines = { { id = "j_default", text = "I woke up in a crypt near Deathknell with no notion of what I was for, and a Deathguard walked me to the road and told me where the city was. I thought I should like to be the one who does that for somebody, so here I am, hitting straw." } },
      choices = {
        { text = "What were you before?", next = "before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A baker's lad, I think, because my hands knew how to knead before they knew how to hold a sword. I don't remember much else, and Eldin says that's a mercy and I ought to stop poking at it." } },
      choices = { { text = "Eldin may be right. Something else.", next = "BACK" } },
    },
    houser = {
      lines = { { id = "h2_default", text = "He's harder, and he never runs out of breath for it. But Alyssa says he's only that loud with the ones he means to pass, and he once stayed two hours after the drill to fix my grip, shouting the whole time." } },
      choices = {
        { text = "What comes after the dummies?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "The pit, where Brother Malach raises things for Edward and Tyler to fight, and one day for us. I watch them from the rail when we're dismissed, and I've decided I should like to meet the ghoul first and the abomination a good deal later." } },
      choices = { { text = "A sound plan. Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g2_default", text = "Do I? The Sergeant says so too, only he says it with more words in it. If I bring the shield back before I look where the blow landed, would that mend it, do you think?" } },
      choices = {
        { text = "Yes. Shield first, then look.", next = "BACK", reply = "Shield first, then look. Thank you, I'll say it under my breath until it sticks.", fx = { affinity = 1 } },
        { text = "Ask your sergeant, not me.", next = "BACK", reply = "That's fair, and I will, when he stops for breath." },
      },
    },
    tb_training = {
      lines = { { id = "tb_t_default", text = "Hard. My arms don't tire, which you'd think would help, but they don't do what I tell them either. Alyssa says I swing like I'm kneading dough, and she's right, because I think I was a baker's lad and the hands remember." } },
      choices = {
        { text = "What does Houser say about you?", next = "tb_houser" },
        { text = "Try a hammer. It suits a kneader.", next = "BACK", when = { class = "WARRIOR" }, reply = "A hammer? I'll ask the Sergeant. He'll shout, but he might say yes." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_houser = {
      lines = { { id = "tb_h_default", text = "That I'm the slowest recruit he's had since the city was dug, and that I'll be the one he sends to the Bulwark first, because slow soldiers learn fastest there. I think that was meant to cheer me up." } },
      choices = {
        { text = "Do you want to go to the Bulwark?", next = "tb_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tb_stance = {
      lines = { { id = "tb_s_default", text = "Part of me does, to prove him wrong. Part of me wants to stay and bake something, though I can't eat it and nobody here can either. Do you think a Deathguard is allowed to be bad at it?" } },
      choices = {
        { text = "Do your duty, Bosk. The Forsaken need every guard.", next = "BACK", reply = "Yes. Yes, you're right. I'll hold my blade higher tomorrow.", fx = { align = { order = 1 } } },
        { text = "Bake, if that's who you are. Nobody owns you now.", next = "BACK", reply = "Don't say that near the Sergeant. But thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken_x", text = "We're free, the Sergeant says. Free to do drills, mostly." } },
    advice = { { id = "tp_advice_x", text = "Get up before the Sergeant tells you to. It's the only time he doesn't shout." } },
    background = { { id = "tp_bg", text = "I rose near Deathknell not long ago, and I think I was a baker's lad before that. I'm to be a Deathguard, if the Sergeant ever passes me." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm only a recruit. The Sergeant knows everything, but please don't tell him I sent you." } },
  },
}

-- Tyler: fights in the War Quarter pit beside Edward, against what Brother Malach summons.
P:NPC {
  key = "uc_tyler", id = TODO_NPC("Tyler"), name = "Tyler", gender = "male",
  bible = "bibles/missed_b.md", role = "soldier", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "reckless" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Tyler fights in the War Quarter's pit beside Edward, against whatever Brother Malach calls up, and grins while he does it. He talks between opponents in short bursts and never takes his weight off the balls of his feet.",
    third = "{name} met Tyler, who fights in the pit of the Undercity's War Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You! Good, stand by the rail, you're lucky. I fought my best bout last time you watched." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand off the rail, friend, I've a big one coming and don't need the bad luck." },
    { id = "g_default", text = "Talk fast, friend, because Malach doesn't wait, and the next one's usually bigger than the last." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to watch! Stay for the abomination; I've been working on something for it." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Now that's a fighter's stance. If Edward ever takes a day off, which he won't, I'd have you beside me down here." },
  },
  start = "hello",
  nodes = {
    ydesert = {
      lines = { { id = "ydesert_x", text = "Did he now? He's right. I ran from the Andorhal garrison to warn my mum about the grain. I got there three days too late. Edward covered for me, and I owe him every fight I'll ever win." } },
      choices = {
        { text = "You owe Edward the truth, and the captains deserved it too.", next = "BACK", reply = "Maybe. The captains are all dead, though, and Edward still gets it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Running home was right. Your mother mattered more than any garrison.", next = "BACK", reply = "That's what I tell myself every night, and I nearly believe it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Did you find your mother?", next = "ymum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymum = {
      lines = { { id = "ymum_x", text = "I found her walking the road with the others, eyes empty. I couldn't stop her. Someone else did, later. I don't know who, and I don't want to. Do you think a man should look for the one who put his mother down?" } },
      choices = {
        { text = "Yes. You deserve to know the truth.", next = "BACK", reply = "Maybe. Maybe one day. Not before the next bout, though.", fx = { align = { light = -1 } } },
        { text = "No. Let her rest, and let it be.", next = "BACK", reply = "Aye. That's what Edward says. He's usually right.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystop = {
      lines = { { id = "ystop_x", text = "Stop? Ha! Dead men don't retire. But if I did, I'd find a quiet bit of Tirisfal and grow pumpkins. Nothing grows in Tirisfal, mind. I'd still try." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Tyler, and that's Edward, and between us we knock down whatever Brother Malach raises. It's meant to be training, though I'll admit it's the most alive I've felt since I stopped being it." },
        { id = "yh_rogue", when = { class = "ROGUE" }, text = "A rogue, watching me. I like that. You see the feint before the crowd does, don't you?" },
      },
      again = {
        { id = "h_again", text = "What else? One eye on the gate while you ask, mind." },
        { id = "h_again2", text = "Go on, I've got until the next one stands up." },
      },
      choices = {
        { text = "What does Malach send against you?", next = "sends" },
        { text = "How do you and Edward fight together?", next = "edward" },
        { text = "Do you hear the crowd down here?", next = "crowd" },
        { text = "How would you take an abomination?", next = "abom", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Edward says you were a deserter.", next = "ydesert" },
        { text = "What will you do when you stop fighting?", next = "ystop" },
        { text = "Fight well, Tyler.", next = "END" },
      },
    },
    sends = {
      lines = { { id = "s_default", text = "Three human captives to start, and they come at you with everything, having nothing to lose. Then a ghoul and a zombie, so we don't forget what we're really training for, and an abomination to finish, which is the only one that ever worries Edward." } },
      choices = {
        { text = "The captives don't trouble you?", next = "captives" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captives = {
      lines = {
        { id = "c_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "They were Scarlets and Hillsbrad militia, and every one of them was taken with a torch or a pitchfork in his hand. They get a blade and a chance down here, friend, which is more than their kind ever gave one of us." },
        { id = "c_default", text = "They were Scarlets and Hillsbrad militia, and every one of them was taken with a torch or a pitchfork in his hand. They get a blade and a chance, which is more than they gave, and I sleep no worse for it, or I would if I slept." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    edward = {
      lines = { { id = "e_default", text = "He holds and I move, and it works because he never once looks to see whether I'm where I should be. He says I'm reckless and I say he's furniture, and neither of us would go through that gate with anyone else." } },
      choices = {
        { text = "Has he ever had to save you?", next = "saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saved = {
      lines = { { id = "sa_default", text = "More times than I've saved him, and he keeps the count, the wretch. I got him out from under the abomination once, though, when it had him by the leg, and I mean to dine out on that for a decade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cr_default", text = "Every word, and none of it's any use. There's a woman up there who tells me I drop my shoulder, and a fellow called Gossom who cheers when I fall over, and I've grown fond of the pair of them without ever learning what they look like." } },
      choices = { { text = "She's right about the shoulder. Something else.", next = "BACK" } },
    },
    abom = {
      lines = { { id = "a_default", text = "From behind, always, while somebody solid keeps its hook busy in front. It's three corpses stitched into one, and the stitches are the weak part, so you cut where the colours don't match and keep out from under it when it comes apart." } },
      choices = { { text = "I'll remember the stitches. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    edward = { { id = "ytp_edward", text = "Edward's the only man I'd trust at my back. He's earned it twice over." } },
    andorhal = { { id = "ytp_and", text = "Andorhal's where it started. The grain. I can still smell it, some nights." } },
    background = { { id = "tp_bg", text = "I was a brawler in Lordaeron, the sort who got thrown out of taverns. Now I'm paid for it, in a manner of speaking, and nobody throws me anywhere but the abomination." } },
    _none = { { id = "tp_none", text = "No idea, friend, and no time to think about it. Ask me when the gate's shut." } },
  },
}

-- Victor Bartholomew: a pupil at Jezelle Pruitt's demon lessons in the Magic Quarter.
P:NPC {
  key = "uc_victor_bartholomew", id = TODO_NPC("Victor Bartholomew"), name = "Victor Bartholomew", gender = "male",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "nervous", "dry" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "Victor Bartholomew attends Jezelle Pruitt's demon lessons in the Magic Quarter with Adrian Bartlett and Winifred Kerwin, and stands a careful half step behind them both. He takes notes on every demon and has not yet summoned so much as a spark himself.",
    third = "{name} met Victor Bartholomew, a cautious pupil at Jezelle Pruitt's demon lessons.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, you're back. Stand by me, and quietly. I'll lend you my notes on the felhunter." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Please, a little farther off. Mistress Pruitt is half summoning, and you make me nervous." },
    { id = "g_default", text = "Not so loud, please. Mistress Pruitt has something half summoned, and I'm told they come through in a worse temper if they're startled." },
    { id = "g_back", when = { metBefore = true }, text = "You again. We've had the imp twice since you left, and it remembered my name, which I didn't care for." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You have one of your own, bound and everything. Might I ask whether it hurt, the first time, or is that the sort of question one doesn't ask?" },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A clerk at the Scholomance, before it was the Scholomance. When it was still the Barov family's estate, I kept their household accounts. I saw strange men arrive in black robes and I wrote them down as guests." } },
      choices = {
        { text = "You saw the Cult of the Damned arrive?", next = "ycult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycult = {
      lines = { { id = "ycult_x", text = "I saw them, and I recorded them, and I said nothing to anyone. I tell myself I didn't know. I did know. Should a man be blamed for what he only wrote down?" } },
      choices = {
        { text = "Yes. Silence made you part of it.", next = "BACK", reply = "Yes. I suspected so. I'll write that down too.", fx = { align = { light = 1 } } },
        { text = "No. A clerk's only duty is the ledger.", next = "BACK", reply = "That's very generous. I'm not sure I believe it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynotes = {
      lines = { { id = "ynotes_x", text = "A treatise, eventually, on how a demon bargains. Mistress Pruitt thinks I'll never finish it. Winifred thinks I'll never start. Adrian thinks I should simply summon an imp and ask it. All three are probably right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybehind = {
      lines = { { id = "ybehind_x", text = "Because if anything goes wrong in the circle, the demon looks at the front row first. I've studied that very carefully. It's my most reliable finding to date." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Victor Bartholomew, student. Mistress Pruitt calls the demons up one at a time and tells us what each is good for, and I write it all down, because I've no power of my own yet and a notebook is what I have in its place." },
        { id = "yh_warlock", when = { class = "WARLOCK" }, text = "A warlock. Could I ask you, very quickly, what the first summoning felt like? For my notes. You needn't answer. I'll understand." },
      },
      again = {
        { id = "h_again", text = "Yes? Quietly, if you would, she's started the next circle." },
        { id = "h_again2", text = "Ask, but I may have to stop and write." },
      },
      choices = {
        { text = "No power of your own?", next = "power" },
        { text = "Which demon unsettles you most?", next = "demon" },
        { text = "What are your classmates like?", next = "class" },
        { text = "It didn't hurt. It argued terms, like a lawyer with teeth.", next = "argued", when = { class = "WARLOCK" } },
        { text = "What were you in life?", next = "ylife" },
        { text = "What do you plan to do with your notes?", next = "ynotes" },
        { text = "Why stand behind the others?", next = "ybehind" },
        { text = "Mind your notes, Victor.", next = "END" },
      },
    },
    power = {
      lines = { { id = "p_default", text = "Not a drop, as yet. Adrian can already feel the circle when she draws it, and Winifred was born to it, being a Kerwin, and I stand here like an empty inkwell hoping somebody will pour something in." } },
      choices = {
        { text = "Then why study demons at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I was a notary, and I have never been frightened of a contract. Mistress Pruitt says every binding is an agreement with terms, and that most warlocks who come to grief did so because they failed to read what they'd signed." } },
      choices = { { text = "Then you may outlast them all. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    demon = {
      lines = { { id = "d_default", text = "The succubus, and not for the reason Adrian supposes. The voidwalker does as it's told and the felhunter is only a hound with worse habits, but she looks at each of us in turn and you can see her working out the price." } },
      choices = {
        { text = "And the imp?", next = "imp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    imp = {
      lines = { { id = "i_default", text = "The imp talks, incessantly, and Mistress Pruitt says that is the lesson: the small ones wear you down with chatter until you agree to something. I've a page of things it has said about my handwriting, and I intend to hold it to none of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    class = {
      lines = { { id = "c_default", text = "Adrian wants a demon of his own so badly that it's uncomfortable to stand next to, and Winifred answers Mistress Pruitt's questions before they're finished. I'm the one who asks what happens if it goes wrong, and somebody has to, in my opinion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    argued = {
      lines = { { id = "a_default", text = "It argued! Then Mistress Pruitt has it right, and it is all terms and conditions in the end. You've no idea how much better that makes me feel; I can out-argue anything, given ink." } },
      choices = { { text = "Read every line twice. They hide the hooks in the margins.", next = "BACK" } },
    },
  },
  topics = {
    scholomance = { { id = "ytp_scholo", text = "The Barovs' old estate. I kept its books, once. I don't like to think about what it keeps now." } },
    jezelle_pruitt = { { id = "ytp_pruitt", text = "Mistress Pruitt is the most precise person I have ever met, and I've met clerks." } },
    background = { { id = "tp_bg", text = "I was a notary in Lordaeron and drew up other people's wills. I find the warlock's trade is the same work, with clients who bite." } },
    _none = { { id = "tp_none", text = "It isn't in my notes, and I shouldn't like to guess. Mistress Pruitt would know, once the lesson's over." } },
  },
}

-- Winifred Kerwin: a pupil at Jezelle Pruitt's demon lessons; kin to Richard Kerwin, the warlock trainer.
P:NPC {
  key = "uc_winifred_kerwin", id = TODO_NPC("Winifred Kerwin"), name = "Winifred Kerwin", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "undercity" }, temper = { "proud", "sharp" }, values = { "learned", "ambitious" },
  notices = { "class" },
  impression = {
    first = "Winifred Kerwin stands at the front of Jezelle Pruitt's demon lessons and answers each question a breath before it's finished. She is a Kerwin, like the warlock trainer Richard, and is determined that nobody shall think it's the name that got her there.",
    third = "{name} met Winifred Kerwin, the quickest pupil at Jezelle Pruitt's demon lessons.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Ask me anything; I've just learned the true name of a voidwalker, more or less." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. If you've a question, I suppose you'll have to ask Mistress Pruitt after all." },
    { id = "g_default", text = "If you have a question, ask me and not Mistress Pruitt, since she's mid-summoning and I very probably know the answer." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I have learned the felhunter's binding since you left, in theory, and I'd be glad to recite it." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A practising warlock. Then you studied under Richard Kerwin or one of the others, and you may tell me honestly whether he's as dull in a lesson as he is at home." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A Kerwin, which in Lordaeron meant a family of scribes and dull clerics. I was the dullest of them, by design. I went to the cathedral every day and prayed for something interesting to happen. Something did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywant = {
      lines = { { id = "ywant_x", text = "Power, plainly. Not Richard's kind, the slow kind, but enough that no Scourge and no Scarlet could ever bind me again. A demon on a leash is the surest freedom a Forsaken can buy. Don't you agree?" } },
      choices = {
        { text = "Yes. Power is the only real freedom.", next = "BACK", reply = "At last, someone sensible. I'll tell Adrian you said so.", fx = { align = { light = -1 } } },
        { text = "No. A leash binds both ends.", next = "BACK", reply = "Richard says that. I hoped you'd be more original.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfail = {
      lines = { { id = "yfail_x", text = "I worry that I'll succeed and find out Richard was right about everything. That's far worse than failing. Failing, at least, would be my own." } },
      choices = {
        { text = "Was there a pupil who failed before?", next = "ypupil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypupil = {
      lines = { { id = "ypupil_x", text = "There's a scorch mark on the floor by the third pillar, and Mistress Pruitt walks around it. Adrian thinks it was an imp. I think it was a felhunter, by the shape. Nobody will tell us, and that's a lesson in itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Winifred Kerwin. I attend Mistress Pruitt's lessons with Adrian Bartlett and Victor Bartholomew, and I intend to be the first of us permitted to summon, which shouldn't be difficult, given the competition." },
        { id = "yh_warlock", when = { class = "WARLOCK" }, text = "A warlock. Do you know my kinsman Richard? I trust you'll tell him I was at the front of the class today." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, I like them." },
        { id = "h_again2", text = "Go on, and be precise, please." },
      },
      choices = {
        { text = "What does Mistress Pruitt teach?", next = "teach" },
        { text = "You're kin to Richard Kerwin?", next = "richard" },
        { text = "You're hard on your classmates.", next = "mates" },
        { text = "Which demon would you bind first, if you dared?", next = "first", when = { class = "WARLOCK" } },
        { text = "Who were you in life?", next = "ylife" },
        { text = "What do you want from your studies?", next = "ywant" },
        { text = "Do you worry about failing?", next = "yfail" },
        { text = "Back to your lesson, then.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "She summons each of the common demons in turn, the imp, the voidwalker, the succubus and the felhunter, and has us learn its nature before we are trusted with its name. It is slow, and I've come to see that slow is the point, though I didn't enjoy coming to see it." } },
      choices = {
        { text = "What changed your mind?", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "A student before us drew her own circle after three lessons, to save time. Mistress Pruitt keeps what was left of her robe pinned to the wall, and she has never once referred to it, which is more persuasive than any lecture." } },
      choices = { { text = "A convincing argument. Something else.", next = "BACK" } },
    },
    richard = {
      lines = { { id = "r_default", text = "I am, and I chose Mistress Pruitt's lessons over his so that nobody could say I was passed on the strength of a surname. He teaches a curse as though it were penmanship, and I've had quite enough of that across the supper table." } },
      choices = {
        { text = "Does he approve of your studying elsewhere?", next = "approve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    approve = {
      lines = { { id = "a_default", text = "He said it was 'a sound decision, properly reasoned,' which from Richard is a declaration of love. I shall go to him for the advanced work when I've earned it, and not one day before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mates = {
      lines = { { id = "m_default", text = "I'm accurate about them, which isn't the same. Adrian wants a demon far too much and Victor wants one far too little, and of the two I'd sooner stand next to Victor, because at least he reads the wards before he steps over them." } },
      choices = { { text = "So you do like one of them. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "The voidwalker, because it obeys and it stands between you and whatever you've angered. Everyone begins with the imp, I know, but I see no merit in starting one's career with a servant who answers back." } },
      choices = { { text = "The imp teaches patience, and spite. Something else.", next = "BACK" } },
    },
  },
  topics = {
    richard_kerwin = { { id = "ytp_rich", text = "Richard trains warlocks and disapproves of me. I find both admirable." } },
    jezelle_pruitt = { { id = "ytp_pruitt", text = "Mistress Pruitt is the only teacher I've ever wanted to impress. Don't tell her." } },
    background = { { id = "tp_bg", text = "The Kerwins had a talent for the forbidden arts before the plague made them respectable. I mean to be better at them than any Kerwin yet, Richard included." } },
    _none = { { id = "tp_none", text = "I don't know, which annoys me. I shall look it up and know by tomorrow." } },
  },
}
