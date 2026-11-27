-- More of the Undercity, second file: the remaining profession trainers, the Apothecarium, Magic and
-- Rogues' Quarter suppliers, and four people with errands (Jezelle Pruitt, Godrick Farsan, Estelle
-- Gendry, Thersa Windsong). Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Doctor Herbert Halsey: senior alchemy trainer of the Apothecarium; certain a rival stole his notes.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_halsey", id = TODO_NPC("Doctor Herbert Halsey"), name = "Doctor Herbert Halsey", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "exacting", "vain" }, values = { "knowledge", "craft" },
  notices = { "profession", "race" },
  impression = {
    first = "Doctor Herbert Halsey teaches the highest alchemy in the Apothecarium and corrects people before they have finished being wrong. He is sure a rival stole his notes, and nobody near him seems eager to discuss it.",
    third = "{name} met Doctor Herbert Halsey, the senior alchemy trainer of the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again, and you've remembered what I told you, which already puts you ahead of the rest. Come in." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Before you speak, you're wrong, and I'd rather not hear the details today." },
    { id = "g_1", text = "Do not lean on that bench, because everything on it is either mine, volatile, or both." },
    { id = "g_2", when = { profession = "Alchemy" }, text = "An alchemist, by the stains on your fingers. Stand where I can see your hands and we shall find out how badly you were taught." },
    { id = "g_3", when = { metBefore = true }, text = "You again. I had begun a distillation that wants nine minutes of silence, so you may have eight of them." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Herbalism" },
      text = "You gather herbs, I see. Then learn to cut the stem cleanly, because half of what reaches my bench has been torn up like a weed and bleeds its virtue all the way here." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your witch doctors brew by smell and by song, and it galls me a little that their results are as good as they are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Doctor Herbert Halsey. I teach alchemy to those who have already learned everything Felben and Marsh can give them, and I ask only that you measure twice and speak half as often." },
        { id = "hello_2", when = { profession = "Alchemy" }, text = "Doctor Herbert Halsey. If you have come up through Felben and Marsh, you will have their bad habits, and I shall spend the first month removing them before I teach you anything at all." },
      },
      again = {
        { id = "hello_a1", text = "Was there something further? The flask will not watch itself." },
        { id = "hello_a2", text = "Go on, then, but keep your sleeves away from the burner." },
        { id = "hello_a3", text = "Ask, and be brief about it." },
      },
      choices = {
        { text = "An alchemist should publish his findings with his own name on them.", next = "BACK", reply = "Yes, and nobody else's. Some of us were robbed of that privilege.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Borrow a rival's notes if he's careless enough to leave them.", next = "BACK", reply = "So you're the sort. I knew there was a sort, and I'll watch my desk.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me what you know of alchemy.", next = "BUSINESS" },
        { text = "How is the teaching divided down here?", next = "ladder" },
        { text = "I heard some of your notes went missing.", next = "notes" },
        { text = "What does the Society have you brewing?", next = "work" },
        { text = "Would you ever study under a witch doctor?", next = "troll", when = { race = "Troll" } },
        { text = "I'll leave you to your flasks.", next = "END" },
      },
    },
    ladder = {
      lines = { { id = "ladder_1", text = "Felben takes the beginners, who cannot yet be trusted with a flame. Marsh takes them once they can, and when Marsh runs out of things to say they come to me, which happens sooner than Marsh likes to admit." } },
      choices = {
        { text = "You don't think much of Doctor Marsh.", next = "ladder2" },
        { text = "Marsh told me he does the real work.", next = "marsh", reply = "I am sure he did, and I am sure he believed it while he was saying it. Ask him who checks his proportions.", when = { heardLine = "uc_marsh.hello_1" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ladder2 = {
      lines = { { id = "ladder2_1", text = "I think him competent, which is a word he hears as an insult. He is quick and he is careless in exactly equal measure, and in this trade the second quality is the one that gets a man remembered." } },
      choices = {
        { text = "A careful teacher is worth more than a quick one.", next = "BACK", reply = "Just so. I shall tell him a passing stranger said it, and he will sulk until supper.", fx = { affinity = 1 } },
        { text = "Perhaps a little haste would do this place good.", next = "BACK", reply = "Haste did for the last occupant of this bench, and we are still finding pieces of his spectacles." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    marsh = {
      lines = { { id = "marsh_1", text = "He checks his own work, which is to say nobody does. I look over his shelf on the quiet when he steps out, and I have corrected three labels this month without a word of thanks, since he does not know." } },
      choices = {
        { text = "That was decent of you.", next = "BACK", reply = "It was prudent of me. I share a ceiling with the man." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    notes = {
      lines = { { id = "notes_1", text = "Missing is a generous word for it. Four months of work on a stabilised transmutation vanished from a locked case overnight, and I know of only two people in this city who could have read it, let alone wanted it." } },
      choices = {
        { text = "Who do you suspect?", next = "notes2" },
        { text = "A locked case doesn't empty itself.", next = "notes2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    notes2 = {
      big = true,
      lines = { { id = "notes2_1", text = "I name no one, because I cannot prove it, and an accusation without proof is only gossip in a white coat. I will say that Doctor Marsh was remarkably cheerful that week. What would you do in my place?" } },
      choices = {
        { text = "Confront him openly and have done with it.", next = "BACK", reply = "Plainly put. I may yet, when I have something better than a mood to accuse him with.", fx = { align = { honor = 1 } } },
        { text = "Search his shelves while he's out.", next = "BACK", reply = "I have been doing so for a month, as it happens, and found nothing but mislabelled salts.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "work_1", text = "The Royal Apothecary Society asks, and I supply. Master Faranell sets the questions upstairs, and a good many of his answers begin in a flask on this bench, though you will not find my name on them." } },
      choices = {
        { text = "Does that trouble you?", next = "work2" },
        { text = "Somebody ought to put your name on them.", next = "work2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    work2 = {
      lines = { { id = "work2_1", text = "It used to. I had a name in Lordaeron, a chair, students who stood when I entered. Now I have a bench in a sewer and the Dark Lady's work to do, and I find the work is better than the chair ever was." } },
      choices = {
        { text = "The work outlasts the name.", next = "BACK", reply = "So I tell myself, most evenings.", fx = { trait = { kind = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "troll_1", text = "Study under one, no. Stand quietly at the back of the hut and take notes, certainly. Your people keep recipes in songs, where no thief can find them, and after this year I begin to think that the wiser arrangement." } },
      choices = {
        { text = "The songs are harder to steal, mon.", next = "BACK", reply = "Then perhaps I shall learn to sing. Do not repeat that." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We do not tire and we do not need supper, so the work is never interrupted. I count that the one clear gain in the whole sorry business." } },
    plague = { { id = "tp_plague", text = "I teach alchemy. What the Society does with a well-made reagent is a question for Master Faranell, and I advise you to ask him politely." } },
    lordaeron = { { id = "tp_lordaeron", text = "I held a chair in the capital. The lecture hall is somewhere above us, I believe, under a quantity of roof." } },
    advice = { { id = "tp_advice", text = "Label everything, and date the label. Memory is the first reagent to spoil." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady asks for results and does not ask how long I stayed at the bench. I have had worse patrons with pulses." } },
    _none = { { id = "tp_none", text = "That is outside my field, and I make a point of having no opinions outside my field." } },
  },
}

---------------------------------------------------------------------------
-- Doctor Marsh: the middle alchemy trainer; quick, careless, and sure he does the real teaching.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_marsh", id = TODO_NPC("Doctor Marsh"), name = "Doctor Marsh", title = "Expert Alchemist",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "quick", "boastful" }, values = { "craft", "ambition" },
  notices = { "profession", "class" },
  impression = {
    first = "Doctor Marsh teaches alchemy at the Apothecarium between Felben's beginners and Halsey's finished students. He works fast, talks faster, and has a scorch mark on the wall behind him that he has stopped noticing.",
    third = "{name} met Doctor Marsh, an alchemy trainer of the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you! Quick, come in, quick; I've a reaction going and you're the only one who doesn't flinch." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand by the scorch mark; it's the safest place in the room for people I don't like." },
    { id = "g_1", text = "Come in, come in, mind the puddle, because it has been eating the floor since Tuesday." },
    { id = "g_2", when = { profession = "Alchemy" }, text = "Another alchemist! Good. Tell me what you can make and I will tell you what you are doing wrong, and we shall both enjoy it." },
    { id = "g_3", when = { metBefore = true }, text = "Back again, and with both eyebrows. You have been ignoring my methods, I can tell." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Alchemy" },
      text = "You hold a vial by the neck, like a man who expects it to go off. Hold it by the body and trust it a little, and it will reward you nine times in ten." },
    { id = "n_2", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Your kind are my best customers for anything that burns, and you never once ask what is in it." },
  },

  start = "hello",
  nodes = {
    d2_finest = {
      lines = {
        { id = "d2_finest_1", text = "A restorative so strong that a deathguard drank it at the Bulwark and walked back on a broken leg without noticing until the next morning. Halsey said the formula was unstable, and I said so was the deathguard, and only one of us was wrong." },
      },
      choices = {
        { text = "Can you brew it again?", next = "d2_finest2" },
        { text = "That sounds dangerous.", next = "d2_finest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_finest2 = {
      lines = {
        { id = "d2_finest2_1", text = "I could, if I could remember precisely what I put in it, which I can't, because I was working fast. I've a shelf of attempts since, each one labelled 'nearly,' and one of these days one of them will be the real thing." },
      },
      choices = {
        { text = "Write it down next time.", next = "BACK", reply = "That is what Halsey says, and I resent it every time he says it." },
        { text = "Ask you something else, Doctor.", next = "BACK" },
      },
    },
    d2_felben = {
      lines = {
        { id = "d2_felben_1", text = "Felben keeps them busy, and then they come to me with their eyebrows singed and their confidence intact, which I then remove. He's a gentle teacher, and the gentleness has to come out of them somewhere, and here is where it comes out." },
      },
      choices = {
        { text = "How do you do it?", next = "d2_felben2" },
        { text = "You enjoy that part.", next = "d2_felben2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_felben2 = {
      lines = {
        { id = "d2_felben2_1", text = "I give them a recipe that will boil over if they look away, and then I talk to them about something interesting. The ones who keep watching the flask go on to Halsey, and the ones who listen to me go back to Felben, sadder and a little wiser." },
      },
      choices = {
        { text = "A cruel trick.", next = "BACK", reply = "A cheap one. The Bulwark's tricks are dearer." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_curdle = {
      lines = {
        { id = "d2_curdle_1", text = "Then you're heating it too quickly and stirring it too slowly, which is everyone's fault the first year. Take the flame down by half and stir with the other hand, so you aren't tempted to stop and look at it." },
      },
      choices = {
        { text = "I'll try that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Doctor Marsh. Felben teaches them not to drink the reagents and Halsey teaches them to write a tidy label, and everything a working alchemist needs between those two lessons, they get from me." },
        { id = "hello_2", when = { metBefore = true }, text = "Doctor Marsh, still. I have three batches going and a fourth I have forgotten about, so talk quickly and listen for hissing." },
      },
      again = {
        { id = "hello_a1", text = "What else? Something is about to boil over, though I couldn't say which." },
        { id = "hello_a2", text = "Go on, I can listen and pour." },
        { id = "hello_a3", text = "Ask away, and stand a little to the left." },
      },
      choices = {
        { text = "Measure every reagent twice before it goes into the flask.", next = "BACK", reply = "Twice, yes, I keep meaning to, and the wall keeps reminding me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pour by eye. Real alchemists don't waste time with scales.", next = "BACK", reply = "That's how I got the scorch mark, and I'm the fast one here.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "How do you teach the craft?", next = "method" },
        { text = "That's a large scorch mark behind you.", next = "scorch" },
        { text = "What do you make of Doctor Halsey?", next = "halsey" },
        { text = "What do you make that burns slowly enough to hurt?", next = "burn", when = { class = "WARLOCK" } },
        { text = "What's the finest thing you've ever brewed?", next = "d2_finest" },
        { text = "Felben's beginners must keep you busy.", next = "d2_felben" },
        { text = "My potions keep curdling in the flask.", next = "d2_curdle", when = { profession = "Alchemy" } },
        { text = "I'll get out of the way.", next = "END" },
      },
    },
    method = {
      lines = { { id = "method_1", text = "By doing it. I put a recipe in front of a student, I light the burner, and I step back two paces. Halsey would have them copy out proportions for a month first, and by then half of them have gone off to be tailors." } },
      choices = {
        { text = "And when a batch goes wrong?", next = "method2" },
        { text = "Two paces doesn't sound far enough.", next = "method2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    method2 = {
      lines = { { id = "method2_1", text = "Then they learn something Halsey's copyists never will, which is what wrong smells like. A sour note before the flash, a little blue at the edge of the flame. I can teach that in an afternoon, and it has saved more students than any label." } },
      choices = {
        { text = "That's worth knowing.", next = "BACK", reply = "It is the only thing worth knowing. The rest is in books.", fx = { affinity = 1 } },
        { text = "It sounds like teaching by accident.", next = "BACK", reply = "Every discovery in this hall was an accident first. I only arrange to have them on purpose." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    scorch = {
      lines = { { id = "scorch_1", key = true, text = "Is there? Oh, that one. That was a fire oil that wanted more patience than I had on the day, and I maintain the recipe was sound and the flask was at fault. Algernon sold me the flask, and he has never apologised for it." } },
      choices = {
        { text = "Does Algernon ever say anything at all?", next = "scorch2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    scorch2 = {
      lines = { { id = "scorch2_1", text = "He groans, and I have learned the groans. One sort means he has what you want, another means he has not, and a third I think is only his chest settling. He is the most honest supplier in the city, since he has not the wit to cheat anyone." } },
      choices = {
        { text = "A shopkeeper who can't lie is rare.", next = "BACK", reply = "Rare, and wasted on a zombie. I'd give a year's wages for a living one." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    halsey = {
      lines = { { id = "halsey_1", text = "A fine alchemist and a dreadful colleague. He walks past my shelf every time I leave the room, and I've started turning one bottle a quarter turn so that I can tell. It is always turned back, and always relabelled." } },
      choices = {
        { text = "He thinks someone stole his notes.", next = "halsey2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    halsey2 = {
      big = true,
      lines = { { id = "halsey2_1", text = "He thinks I stole his notes, and you needn't be delicate about it. I did not. I would not need them, for one thing, and for another I have seen his handwriting. Tell me honestly, do I look like a thief to you?" } },
      choices = {
        { text = "No. A thief would be tidier.", next = "BACK", reply = "Ha! I shall take that as a character reference.", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "I'd want to hear his side first.", next = "BACK", reply = "Then go and hear it, and bring a chair, because he has four months of it." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "burn_1", text = "A fire oil thick enough to cling, which I brew for the deathguards and which your imp would think was its birthday. I'll teach you the making of it when your hand is steady enough, and not one day before, because I have only the one wall left." } },
      choices = {
        { text = "I can wait. Patience makes the burning sweeter.", next = "BACK", reply = "A patient warlock. Now I truly have seen everything this city has to show." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "The dead make bold alchemists. When you've already had the worst day of your life, a little smoke doesn't frighten you." } },
    plague = { { id = "tp_plague", text = "That is Faranell's great work, upstairs and behind a door. I brew what is on my list, and the list does not explain itself." } },
    advice = { { id = "tp_advice", text = "Keep a bucket of sand by your left foot. You will not need it often, but you will never need it slowly." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was an apothecary's assistant in a market town, grinding chalk for a man who took the credit. Death has been a promotion." } },
    sylvanas = { { id = "tp_sylvanas", text = "She wants things that work. So do I, and that makes her the first ruler I ever agreed with." } },
    _none = { { id = "tp_none", text = "No idea, and I won't pretend otherwise. Ask Halsey, since he has an opinion filed on everything." } },
  },
}

---------------------------------------------------------------------------
-- Malcomb Wynn: the junior enchanting trainer under Lavinia Crowe; apologetic and careful.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_wynn", id = TODO_NPC("Malcomb Wynn"), name = "Malcomb Wynn", title = "Journeyman Enchanter",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "meek", "earnest" }, values = { "craft", "knowledge" },
  notices = { "profession", "class" },
  impression = {
    first = "Malcomb Wynn teaches the first steps of enchanting in the Apothecarium and apologises for most of them. He handles a rod as though it might bruise, and he plainly reveres Lavinia Crowe, who teaches beside him.",
    third = "{name} met Malcomb Wynn, a junior enchanting trainer in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, you came back. I'm so sorry, I'm glad, I mean. Come and hold the rod; gently, please." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I'm sorry, but would you mind not touching anything at all today?" },
    { id = "g_1", text = "Oh! Forgive me, I was counting dust, and I've lost the number now, though that's no fault of yours." },
    { id = "g_2", when = { profession = "Enchanting" }, text = "You're an enchanter. I can always tell, because you looked at my rod before you looked at me, and I'm not offended in the least." },
    { id = "g_3", when = { metBefore = true }, text = "Hello again. I've kept your place, in a manner of speaking, though of course nobody else wanted it." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Enchanting" },
      text = "Your fingertips have that faint shine. It never quite washes off, I'm afraid, and Mistress Crowe says we ought to be proud of it." },
    { id = "n_2", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll take to this faster than most, I expect, and then you'll be bored of me within the week and want Mistress Crowe." },
  },

  start = "hello",
  nodes = {
    d2_apoth = {
      lines = {
        { id = "d2_apoth_1", text = "Not unkindly, no, though they do walk past my bench rather quickly. Now and then one asks me to ward a flask so it won't crack, and I always do it, and I always try very hard not to ask what's going into it." },
      },
      choices = {
        { text = "Do you ever wonder?", next = "d2_apoth2" },
        { text = "That sounds wise.", next = "d2_apoth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_apoth2 = {
      lines = {
        { id = "d2_apoth2_1", text = "Every time, and I'm sorry to say I've stopped warding the green ones. Mistress Crowe told me I was free to refuse work, and I wasn't sure I was, until she said it." },
      },
      choices = {
        { text = "Then you're freer than you thought.", next = "BACK", reply = "I suppose I am. It's a strange feeling, and not entirely comfortable." },
        { text = "Ask you something else, Malcomb.", next = "BACK" },
      },
    },
    d2_hard = {
      lines = {
        { id = "d2_hard_1", text = "A ring from Stratholme that a deathguard brought me, which had been worn so long the magic had grown into the silver. I worked at it for three days, and when it finally came apart, I heard someone sigh, though there was nobody in the room." },
      },
      choices = {
        { text = "Someone sighed?", next = "d2_hard2" },
        { text = "That would unsettle me.", next = "d2_hard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_hard2 = {
      lines = {
        { id = "d2_hard2_1", text = "I think it was the ring, or what was left of the person who'd worn it. Mistress Crowe said it was only the magic leaving, and that I'd imagined the rest, and I've chosen to believe her, mostly." },
      },
      choices = {
        { text = "Believe her, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_prayer = {
      lines = {
        { id = "d2_prayer_1", text = "Oh, a little, I think. You put your whole attention on one small thing and wait for something greater to answer, though in my case it's the arcane answering and not the Light. I'd never say so to Father Lankester, mind you." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Malcomb Wynn. I teach the beginnings of enchanting, the breaking down and the simple bindings, and when a student is past me I send them two steps to the left, to Mistress Crowe." },
        { id = "hello_2", when = { profession = "Enchanting" }, text = "Malcomb Wynn. I can show you the early formulae, if you still need them, and if you don't then I'm glad for you, truly, and Mistress Crowe is just there." },
      },
      again = {
        { id = "hello_a1", text = "Was there anything else? I don't mind at all." },
        { id = "hello_a2", text = "Please, go on. I've only dust to get back to." },
        { id = "hello_a3", text = "Yes? I'll help if I can." },
      },
      choices = {
        { text = "An enchantment should be gentle with the thing it's put into.", next = "BACK", reply = "Oh, yes. Mistress Crowe says the same, and she's always right.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Force the magic in. The item will hold or it won't.", next = "BACK", reply = "It won't, usually, and then I'll have to apologise to the item.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What does a beginner learn first?", next = "craft" },
        { text = "You speak highly of Lavinia Crowe.", next = "crowe" },
        { text = "Where do your materials come from?", next = "webb" },
        { text = "Why would a mage take to it faster?", next = "mage", when = { class = "MAGE" } },
        { text = "Do the apothecaries ever trouble you?", next = "d2_apoth" },
        { text = "What's the hardest thing you've ever disenchanted?", next = "d2_hard" },
        { text = "Does enchanting feel like prayer, to you?", next = "d2_prayer", when = { class = "PRIEST" } },
        { text = "Thank you, Malcomb. That's all.", next = "END" },
      },
    },
    craft = {
      lines = { { id = "craft_1", text = "To take a thing apart. Every enchanted object has a seam in it where the magic was folded in, and if you find the seam and press, the thing comes away into dust and essence. It is rather sad the first few times." } },
      choices = {
        { text = "Why sad?", next = "craft2" },
        { text = "You feel sorry for the objects.", next = "craft2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft2 = {
      lines = { { id = "craft2_1", text = "I do, a little. Somebody made that ring, and somebody wore it, and I turn it into a pinch of powder in my palm. But the powder goes on into something new, and I have found that a comforting thought, given my own circumstances." } },
      choices = {
        { text = "Nothing's wasted, then.", next = "BACK", reply = "Nothing at all. I'd like that carved over the door, but I haven't dared ask.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It's a ring, Malcomb.", next = "BACK", reply = "Yes. Yes, of course it is. You're quite right." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    crowe = {
      lines = { { id = "crowe_1", text = "She is the finest enchanter in Lordaeron, and I say that having stood beside her for a year without once seeing her check a formula. She corrects me perhaps four times a day, and each time I've been wrong, which is a kind of comfort." } },
      choices = {
        { text = "Does she ever praise you?", next = "crowe2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    crowe2 = {
      lines = { { id = "crowe2_1", text = "Once. I bound a minor ward into a deathguard's bracer and she looked at it for some time and said, \"Adequate.\" I wrote the date down. Thaddeus Webb says she has never said as much to him, and he has sold her dust for years." } },
      choices = {
        { text = "From her, that's high praise.", next = "BACK", reply = "That is exactly what I thought! I'm so glad somebody else sees it." },
        { text = "You deserve better than adequate.", next = "BACK", reply = "Oh, I don't know that I do. But it's kind of you to say." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    webb = {
      lines = { { id = "webb_1", text = "Thaddeus Webb, just there, sells the rods and the vials and whatever dust he's bought in. He's a careful weigher. The rarer shards come from adventurers who've broken something fine, and I try not to ask what it was." } },
      choices = {
        { text = "Does the Society use much enchanting?", next = "webb2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    webb2 = {
      lines = { { id = "webb2_1", text = "More than you'd think. The apothecaries want their glass warded so it doesn't crack, and their gloves, and lately their doors. I ward what I'm handed. I've noticed the doors are always warded from the outside, and I have decided not to notice it any further." } },
      choices = {
        { text = "That's probably wise down here.", next = "BACK", reply = "I think so too. I'd like to keep this post." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mage_1", text = "Because you already feel where the arcane sits in a thing, as I had to learn to. A mage finds the seam in a day. I took a month, and I cried twice, although I'd be grateful if you didn't mention that to Mistress Crowe." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", reply = "Thank you. You're very decent, for a mage." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "I was shy when I was alive as well, so death hasn't changed me as much as it has some. I think that's a mercy." } },
    advice = { { id = "tp_advice", text = "Save your dust, even the plain sort. There is always a week when nobody has any, and then you're everybody's friend." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a jeweller's apprentice. I never finished the apprenticeship, and I suppose this is the other half of it." } },
    sylvanas = { { id = "tp_sylvanas", text = "I saw her once, crossing the Royal Quarter. I looked at the floor, and I think that was the correct thing to do." } },
    dalaran = { { id = "tp_dalaran", text = "They were the great enchanters. I'd have liked to see their workshops before the walls came down around them." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I really only know dust." } },
  },
}

---------------------------------------------------------------------------
-- Josephine Lister: master tailor by the temple in the Magic Quarter; teaches shadoweave to those ready for it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lister", id = TODO_NPC("Josephine Lister"), name = "Josephine Lister", title = "Master Shadoweave Tailor",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "severe", "reverent" }, values = { "craft", "faith" },
  notices = { "profession", "class" },
  impression = {
    first = "Josephine Lister sews beside the temple in the Magic Quarter and teaches the shadoweave, a cloth with darkness worked into the thread. She speaks of it as a rite and looks at ordinary tailoring the way a priest looks at a market stall.",
    third = "{name} met Josephine Lister, the master shadoweave tailor of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. The thread has been dark and willing today. Come and feel the shadoweave before it settles." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep your plain cloth far from my table; it spoils the darkness in the weave." },
    { id = "g_1", text = "Lower your voice, if you please. The cloth is listening, and it takes after whatever it hears." },
    { id = "g_2", when = { profession = "Tailoring" }, text = "A tailor. Show me the inside of your cuff. I can learn more from a seam nobody was meant to see than from any fine front." },
    { id = "g_3", when = { class = "PRIEST" }, text = "One who walks in the Shadow, and knows it by name. You may come closer than the others." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Tailoring" },
      text = "Your stitches are even, I'll grant. They are also frightened, every one the same length for fear of being noticed, and the shadoweave will not sit in frightened work." },
    { id = "n_2", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the dark the way a porter carries a trunk. The cloth I make would suit you, though I doubt you'd understand why." },
  },

  start = "hello",
  nodes = {
    d2_wearers = {
      lines = {
        { id = "d2_wearers_1", text = "The priests of the Forgotten Shadow, first and foremost, and the warlocks who can afford it, and a very few mages who want their shadow spells to bite. I've made robes for Aelthalyste herself, and she wore one to the temple steps without a word of thanks, which is the highest praise she gives." },
      },
      choices = {
        { text = "She never thanks anyone?", next = "d2_wearers2" },
        { text = "A robe for the temple's mistress.", next = "d2_wearers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_wearers2 = {
      lines = {
        { id = "d2_wearers2_1", text = "Not that I have ever heard. She looked at the hem once, a long time, and then nodded, and I went home and wept, or did what the dead do instead of weeping, which is to sit very still." },
      },
      choices = {
        { text = "A great honour.", next = "BACK" },
        { text = "Ask you something else, Mistress Lister.", next = "BACK" },
      },
    },
    d2_pupils = {
      lines = {
        { id = "d2_pupils_1", text = "They should be. Shadoweave is not a hobby, and a careless stitch with shadow in the thread can make a robe that drinks from its wearer. I have seen it happen once, and I will not see it happen in my workshop." },
      },
      choices = {
        { text = "What happened to the wearer?", next = "d2_pupils2" },
        { text = "Then fear is a good teacher.", next = "d2_pupils2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_pupils2 = {
      lines = {
        { id = "d2_pupils2_1", text = "He grew thin and grey and quiet, over a month, before anyone thought to look at his robe. I unpicked it myself, and he was better within the week, and the tailor who made it no longer sews." },
      },
      choices = {
        { text = "A hard lesson.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_lock = {
      lines = {
        { id = "d2_lock_1", text = "They would, and so would anything that lives in the dark. That is precisely why I sew it carefully, so that it serves the wearer and not whatever the wearer calls. Keep your demons at arm's length from my silk." },
      },
      choices = {
        { text = "I'll keep them on a short leash.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Josephine Lister. Other tailors in this city make clothes, and they make them well enough. I weave shadow into silk until the cloth remembers the dark, and I teach that to the few who can be trusted with it." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "Josephine Lister. If Rhiannon Davis and Josef Gregorian have finished with you, then you can sew. Whether you can weave is another matter, and I shall be the one who decides it." },
      },
      again = {
        { id = "hello_a1", text = "Speak, but softly." },
        { id = "hello_a2", text = "What else would you know? The loom can wait a little." },
        { id = "hello_a3", text = "Go on. I've thread to wax while you talk." },
      },
      choices = {
        { text = "Shadoweave should be sewn with reverence for what it holds.", next = "BACK", reply = "Yes. It's a rite, not a trade, and you understand that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Shadoweave is only cloth. Stitch it like any other.", next = "BACK", reply = "Only cloth. I'll remember you said that when it unravels in your hands.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me the shadoweave.", next = "BUSINESS" },
        { text = "What is shadoweave, truly?", next = "weave" },
        { text = "You've set your loom very near the temple.", next = "temple" },
        { text = "How do the quarter's other tailors rate?", next = "tailors" },
        { text = "Does the Shadow guide your needle?", next = "priest", when = { class = "PRIEST" } },
        { text = "Who wears your shadoweave?", next = "d2_wearers" },
        { text = "Your pupils look frightened of you.", next = "d2_pupils" },
        { text = "My demons would approve of this cloth.", next = "d2_lock", when = { class = "WARLOCK" } },
        { text = "I'll leave you to the loom.", next = "END" },
      },
    },
    weave = {
      lines = { { id = "weave_1", text = "Silk, to begin with, the finest the spiders of the south can give. Then a dye that is mostly patience, and a working over each bolt in a room with no lamp. The dark settles into the thread the way damp settles into stone, and it stays." } },
      choices = {
        { text = "And what does it do for the wearer?", next = "weave2" },
        { text = "It sounds closer to prayer than tailoring.", next = "weave2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave2 = {
      lines = { { id = "weave2_1", text = "It is both, and I'll thank you for seeing it. A robe of it lends weight to every shadow the wearer calls. The living tailors who knew the craft kept it close and half ashamed, but we of the Undercity have no reason left to be ashamed of the dark." } },
      choices = {
        { text = "Who taught it to you?", next = "weave3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    weave3 = {
      lines = { { id = "weave3_1", text = "Nobody living. I sewed vestments for the cathedral in the capital, white and gold, forty years of them. When I woke down here my hands still knew the work and my heart wanted the other colour, so I taught myself, one ruined bolt at a time." } },
      choices = {
        { text = "Forty years of skill wasn't wasted.", next = "BACK", reply = "No. It only changed its allegiance, as I did.", fx = { affinity = 1 } },
        { text = "White and gold to black is a long fall.", next = "BACK", reply = "I don't call it a fall. I call it finishing the garment." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    temple = {
      lines = { { id = "temple_1", text = "On purpose. Aelthalyste and the fathers of the Forgotten Shadow teach that the dark is a power to be mastered and never a shame. They bless my dye vat on the quiet, and I sew their vestments, and neither of us sends a bill." } },
      choices = {
        { text = "Do you hold to their faith yourself?", next = "temple2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    temple2 = {
      big = true,
      lines = { { id = "temple2_1", text = "I hold that the Light left us in the ground and the Shadow was there when we woke. That is less a faith than a plain observation. You have an opinion, I can see it sitting in your face, so say it." } },
      choices = {
        { text = "The Shadow kept faith with you. Honor it.", next = "BACK", reply = "It did, and I do, with every bolt.", fx = { align = { light = -1 } } },
        { text = "The Light didn't abandon you. Arthas did that.", next = "BACK", reply = "A kind distinction, and one I've heard from kinder mouths than yours. It never warmed me.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailors = {
      lines = { { id = "tailors_1", text = "Victor Ward takes the beginners and is gentle with them, which they need. Rhiannon Davis is steady and Josef Gregorian is skilled, and Millie sells us all our thread. They make good clothes for a cold city, and I don't despise it." } },
      choices = {
        { text = "That's generous, from you.", next = "BACK", reply = "It is accurate. I leave generosity to Victor." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "priest_1", text = "I'd put it the other way about. I guide the needle, and the Shadow consents to follow, and on the days it does not consent I unpick the whole evening's work. You'll know that from your own practice, I think, if you're honest." } },
      choices = {
        { text = "Some days it will not come.", next = "BACK", reply = "Then you rest, and you do not force it. Forced shadow frays." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We are cut from what was left over, and I've always made my best garments from remnants." } },
    advice = { { id = "tp_advice", text = "Unpick a bad seam at once. It never improves by being left, and you only sew more good work on top of it." } },
    lordaeron = { { id = "tp_lordaeron", text = "I dressed three archbishops' households. Not one of them could have told you my name." } },
    sylvanas = { { id = "tp_sylvanas", text = "I should like to sew for the Dark Lady. I'm told she wears leather and mail and has no patience for fittings, so I admire her from this side of the canal." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They wear white and red, and they dye it badly. The red runs. I find that fitting." } },
    _none = { { id = "tp_none", text = "That is no concern of mine. Ask it of someone who deals in talk." } },
  },
}

---------------------------------------------------------------------------
-- Rhiannon Davis: the steady middle tailoring trainer of the Magic Quarter; sews the city's working clothes.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rdavis", id = TODO_NPC("Rhiannon Davis"), name = "Rhiannon Davis", title = "Expert Tailor",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "steady", "plain" }, values = { "craft", "duty" },
  notices = { "profession", "race" },
  impression = {
    first = "Rhiannon Davis teaches tailoring in the Magic Quarter to students past their first seams. She is plain-spoken and unhurried, and she seems to be the one who actually keeps the city's dead in coats and shrouds.",
    third = "{name} met Rhiannon Davis, a tailoring trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back. Good. I've two dozen shrouds to finish, and I'd welcome the company." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Shrouds are on the left, coats on the right, and my patience is on the floor." },
    { id = "g_1", text = "Good day to you. Mind the pins on the floor, since I drop more than I used to." },
    { id = "g_2", when = { profession = "Tailoring" }, text = "You sew, by that callus on your finger. Sit, then, and tell me what's given you trouble." },
    { id = "g_3", when = { metBefore = true }, text = "You're back. I've a hem to finish, but I can do that and listen both." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Tailoring" },
      text = "You've been using linen thread on wool. It holds for a season and then it saws through, so use wool on wool and save yourself the mending." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren. I've cut for one of your people only once, and I used every yard in the shop and borrowed two from Millie." },
  },

  start = "hello",
  nodes = {
    d2_hard = {
      lines = {
        { id = "d2_hard_1", text = "One for a deathguard with three arms, after an apothecary's experiment went wrong and he decided to keep the extra one. I had to cut the pattern from scratch and set a third sleeve where nobody had ever set a sleeve before." },
      },
      choices = {
        { text = "Did it work?", next = "d2_hard2" },
        { text = "That's a story.", next = "d2_hard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_hard2 = {
      lines = {
        { id = "d2_hard2_1", text = "It did, and he wore it to the Bulwark, and he says the third sleeve's saved his life twice. I keep the pattern in a drawer, in case the apothecaries make another, which I'd not put past them." },
      },
      choices = {
        { text = "Keep it handy.", next = "BACK", reply = "I do. You never know, in this city." },
        { text = "Ask you something else, Rhiannon.", next = "BACK" },
      },
    },
    d2_lauren = {
      lines = {
        { id = "d2_lauren_1", text = "She does, and she's the only one who checks every bolt before she pays for it. That's how I know she's a good armourer, because the bad ones never look at the cloth, only at the price." },
      },
      choices = {
        { text = "You like her, then.", next = "d2_lauren2" },
        { text = "A careful customer.", next = "d2_lauren2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_lauren2 = {
      lines = {
        { id = "d2_lauren2_1", text = "I respect her, which is better. She sent back a bolt once with a note saying the weave was uneven at the selvedge, and she was right, and I'd missed it. I've never missed it since." },
      },
      choices = {
        { text = "Good to have someone keep you sharp.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_seams = {
      lines = {
        { id = "d2_seams_1", text = "Then your stitches are too long, or your thread's too thin for the cloth, or both. Use a heavier thread for wool than for linen, and keep the stitches as short as you can stand, and they'll hold through a winter." },
      },
      choices = {
        { text = "Shorter stitches, heavier thread.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Rhiannon Davis. I teach the tailoring that comes after the first seams and before the fancy work, which is most of tailoring, when you come to count it. Victor sends them to me, and I send the best on to Josef or to Mistress Lister." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "Rhiannon Davis. If Victor Ward's had you, you'll know a running stitch from a backstitch. I'll teach you to line a coat and set a sleeve, and neither's as dull as it sounds." },
      },
      again = {
        { id = "hello_a1", text = "What else can I tell you?" },
        { id = "hello_a2", text = "Go on. The hem will keep." },
        { id = "hello_a3", text = "Ask, and hand me those shears while you're at it." },
      },
      choices = {
        { text = "A shroud deserves the same care as a lord's coat.", next = "BACK", reply = "It does. The dead wear them longer than any lord wore a coat.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Shrouds are for the grave. Stitch them quick and cheap.", next = "BACK", reply = "Half this city's in its shroud still, and they'll tell you otherwise.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "What do you sew, mostly?", next = "work" },
        { text = "It seems there's a ladder of tailors here.", next = "guild" },
        { text = "Where does the cloth come from?", next = "cloth" },
        { text = "How do you fit a tauren?", next = "tauren", when = { race = "Tauren" } },
        { text = "What's the hardest coat you've ever made?", next = "d2_hard" },
        { text = "Lauren Newcomb buys your padded cloth.", next = "d2_lauren" },
        { text = "My seams keep pulling apart.", next = "d2_seams", when = { profession = "Tailoring" } },
        { text = "I'll let you get back to your hem.", next = "END" },
      },
    },
    work = {
      lines = { { id = "work_1", text = "Working clothes. Coats for the deathguards that won't catch on their own ribs, aprons for the apothecaries that can take a splash, gloves by the hundred. Nobody admires an apron, but this city would stop in a week without them." } },
      choices = {
        { text = "And shrouds? Victor mentioned shrouds.", next = "work2", when = { heardLine = "uc_vward.h_default" } },
        { text = "Do the dead wear out their clothes quickly?", next = "work2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work2 = {
      lines = { { id = "work2_1", text = "Quicker than the living. We don't feel a nail catch or a seam chafe, so the first we know of a tear is when a sleeve comes away. I sew everything double at the elbow and the knee, and I've started lining cuffs with leather from Joseph Moore." } },
      choices = {
        { text = "That's a sensible way to cut.", next = "work3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    work3 = {
      lines = { { id = "work3_1", text = "It's the only way down here. I had a shop in Andorhal that made wedding clothes, lace and seed pearls and all the rest. It was pretty work and it lasted a day. A good apron lasts ten years, and I find I'm prouder of the apron." } },
      choices = {
        { text = "Useful beats pretty.", next = "BACK", reply = "It does. It took dying for me to learn it.", fx = { affinity = 1 } },
        { text = "I'd still rather see the lace.", next = "BACK", reply = "So would I, some evenings. Don't tell the apprentices." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    guild = {
      lines = { { id = "guild_1", text = "There is, and it works. Victor Ward has the beginners, I have them after, Josef Gregorian takes the ones with real hands, and Josephine Lister takes the one in fifty who can be taught the shadoweave. Millie Gregorian sells thread to the lot of us." } },
      choices = {
        { text = "What's Mistress Lister like to work beside?", next = "guild2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    guild2 = {
      lines = { { id = "guild2_1", text = "Quiet, exacting, and a little frightening, if I'm honest. She thinks what I make is cloth and what she makes is worship. But she sent a girl back to me last month to relearn her sleeves, so she knows well enough whose work hers stands on." } },
      choices = {
        { text = "She needs you more than she'd say.", next = "BACK", reply = "She'd bite her thread before she said it. But yes." },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cloth_1", text = "Linen and wool come up from Tarren Mill and down from Brill. Silk comes a long way, from spider country in the south, and mageweave from adventurers who've emptied some ruin of its ghosts. I ask no questions about bolts that smell of smoke." } },
      choices = {
        { text = "Smoke washes out.", next = "BACK", reply = "It does, on the third wash. I've had practice." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tauren_1", text = "With a ladder and a length of knotted rope, and a great deal of walking round. The one I dressed stood as patiently as a barn while I did it, and thanked me after in a voice I felt in my feet. I'd do it again gladly." } },
      choices = {
        { text = "We are patient with good craft.", next = "BACK", reply = "So I found. I wish my other customers had half the manners." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're a hard-wearing people in badly worn clothes. I do what I can about the second part." } },
    advice = { { id = "tp_advice", text = "Measure the customer standing and sitting both. Folk forget they bend." } },
    lordaeron = { { id = "tp_lordaeron", text = "Andorhal had four tailors and work for all of us. I don't let myself think about the shop." } },
    sylvanas = { { id = "tp_sylvanas", text = "She gave us a city, and a city needs clothing. I keep to my part of the bargain." } },
    scourge = { { id = "tp_scourge", text = "They wear what they died in until it rots off them. I'd know a Scourge ghoul from one of ours by the tailoring alone." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I know cloth, and not a great deal else these days." } },
  },
}

---------------------------------------------------------------------------
-- Basil Frye: the junior blacksmithing trainer of the War Quarter, under James Van Brunt.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_frye", id = TODO_NPC("Basil Frye"), name = "Basil Frye", title = "Journeyman Blacksmith",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "patient" }, values = { "craft", "strength" },
  notices = { "profession", "class" },
  impression = {
    first = "Basil Frye teaches the first heats of blacksmithing in the War Quarter. He is a big, slow-spoken man who lets a beginner ruin a bar of copper without comment and then asks what they noticed.",
    third = "{name} met Basil Frye, a blacksmithing trainer in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you came back. There's copper heating, and I've a feeling you'll ruin it less this time." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Take a bar and try. I'll not say anything, and I'll not say anything kind." },
    { id = "g_1", text = "Stand clear of the quench barrel, friend, because it spits." },
    { id = "g_2", when = { profession = "Blacksmithing" }, text = "A smith. I can see it in the forearm, and in the way you looked at my fire before anything else in the room." },
    { id = "g_3", when = { metBefore = true }, text = "Back to the forge, are you? Good. It's dull work, hammering for an audience of one." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Mining" },
      text = "You dig your own ore, by the look of your boots. That makes a better smith in the end, since you know what the metal cost somebody." },
    { id = "n_2", cat = "class", when = { class = "WARRIOR" },
      text = "That edge has been ground on a rock by the roadside. It'll serve, but bring it to a proper stone before it chips on you." },
  },

  start = "hello",
  nodes = {
    d2_students = {
      lines = {
        { id = "d2_students_1", text = "Some at James Van Brunt's anvil, some at the Sepulcher with Guillaume Sorouy, if they're patient, and some at the Bulwark mending armour in the field. A few give it up, and I don't blame them, because a forge is a hard place to learn." },
      },
      choices = {
        { text = "Do any come back to see you?", next = "d2_students2" },
        { text = "Guillaume's a hard teacher, I hear.", next = "d2_students2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_students2 = {
      lines = {
        { id = "d2_students2_1", text = "A handful, and they bring me something they've made, and I look it over and tell them what's wrong with it. They seem to like that better than praise, and I've never understood why." },
      },
      choices = {
        { text = "Honesty is a kind of praise.", next = "BACK", reply = "Maybe so. I'd not know how to give the other sort anyway." },
        { text = "Ask you something else, Basil.", next = "BACK" },
      },
    },
    d2_copper = {
      lines = {
        { id = "d2_copper_1", text = "A cartload a month, from Sarah Killian's pupils in the Tirisfal hills, and every bar of it beaten crooked before it's beaten straight. Samuel counts the bars in and out, and he's never once lost one, which is more than I can say for my students." },
      },
      choices = {
        { text = "What happens to the ruined bars?", next = "d2_copper2" },
        { text = "Samuel's very exact.", next = "d2_copper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_copper2 = {
      lines = {
        { id = "d2_copper2_1", text = "They go back in the fire and come out again, and they go round and round until somebody gets them right. There's a bar on my shelf that's been ruined by eleven different students, and I'm keeping it for the twelfth." },
      },
      choices = {
        { text = "I'll not be the twelfth.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_orc = {
      lines = {
        { id = "d2_orc_1", text = "They do, and they get a harder bar for it, and a brittler one. Your people make weapons to break things, and mine make them to last, and I'd say there's room in the Horde for both." },
      },
      choices = {
        { text = "There's room for both.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Basil Frye. I teach the beginning of smithing, the copper and the bronze and how to hold a hammer so it doesn't hold you. When a student can draw out a bar without folding it, I send them over to James Van Brunt." },
        { id = "hello_2", when = { profession = "Blacksmithing" }, text = "Basil Frye. If you're past bronze you'll want James Van Brunt, at the big anvil. If you aren't, I've a bar of copper with your name on it and all the time there is." },
      },
      again = {
        { id = "hello_a1", text = "What else, friend?" },
        { id = "hello_a2", text = "Go on. The iron needs a minute to come up anyway." },
        { id = "hello_a3", text = "Ask it. I can talk between heats." },
      },
      choices = {
        { text = "A smith should learn from every bar he spoils.", next = "BACK", reply = "Aye. What did you notice? That's the question, every time.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Spoil the bar and blame the copper. Nobody can tell.", next = "BACK", reply = "The copper can. And so can I, by the colour of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me the forge.", next = "BUSINESS" },
        { text = "How do you start a beginner off?", next = "teach" },
        { text = "That's a strange place for a forge.", next = "forge" },
        { text = "Who else works this smithy?", next = "brothers" },
        { text = "What's wrong with a roadside edge?", next = "edge", when = { class = "WARRIOR" } },
        { text = "Where do your students end up?", next = "d2_students" },
        { text = "You must go through a great deal of copper.", next = "d2_copper" },
        { text = "Orc smiths beat the bar hotter than you do.", next = "d2_orc", when = { race = "Orc" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "teach_1", text = "I give them a bar and a hammer and I say nothing at all. They beat it flat, or they beat it crooked, or they burn it, and then I ask what they saw the metal do. The ones who can answer will make smiths." } },
      choices = {
        { text = "And the ones who can't answer?", next = "teach2" },
        { text = "You let them ruin good copper.", next = "teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach2 = {
      lines = { { id = "teach2_1", text = "Copper's cheap, and a lesson you were told is worth less than one you burned your thumb on. The ones who can't say what they saw, I send to Brom Killian to swing a pick. There's no shame in it, and the mines want arms more than the forge does." } },
      choices = {
        { text = "That's a fair way to sort them.", next = "BACK", reply = "It's how I was sorted, forty years back, by a man with less patience." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "forge_1", text = "It is. We're under a dead king's city with a river of slime for a neighbour, and the smoke has to find its own way up through the old drains. But the heat keeps the damp off the tools, and the War Quarter's never short of customers for a blade." } },
      choices = {
        { text = "Who buys the most from this smithy?", next = "forge2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "forge2_1", text = "The deathguards, first and always. After them the weapon merchants along the ring, Fenner and Eliot and Hartwell, who put their own marks on our work and sell it dearer. I don't grudge them. A man who can sell is a different animal from a man who can make." } },
      choices = {
        { text = "You'd rather make than sell.", next = "forge3" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    forge3 = {
      big = true,
      lines = { { id = "forge3_1", text = "I would. A sword I made is honest about what it is, and a price never is. Though I'll tell you, I think on where those swords go, some nights. They're not all swung at the Scourge, are they?" } },
      choices = {
        { text = "A smith answers for the blade, not the hand.", next = "BACK", reply = "That's what I tell myself, and it's sound enough to sleep on, if I slept.", fx = { align = { order = 1 } } },
        { text = "You should know whose throat you're arming.", next = "BACK", reply = "Maybe so. It's a hard thing to ask at the counter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = { { id = "brothers_1", text = "James Van Brunt has the big anvil and the name, and he's earned both. His kinsman Samuel sells the coal and flux and the hammers. Sarah Killian has the mining gear next along, and her Brom teaches the digging. We're a small trade and we get along." } },
      choices = {
        { text = "It sounds like a decent crew.", next = "BACK", reply = "It is. Better than the one I had breathing." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    edge = {
      lines = { { id = "edge_1", text = "Nothing, the day you do it. But a field stone is never flat, so you grind a wave into the edge, and the thin part of the wave is where it chips. Give it ten minutes on the wheel there and it'll hold through a season of hard use." } },
      choices = {
        { text = "I'll see to it.", next = "BACK", reply = "Do. I hate to watch good steel die of neglect." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We don't feel the heat, which makes for brave smiths and short ones. I've seen a man lean on a hot anvil and not know till he smelled it." } },
    advice = { { id = "tp_advice", text = "Let the metal tell you when it's ready. If you're guessing, it isn't." } },
    lordaeron = { { id = "tp_lordaeron", text = "I shod horses for the king's cavalry. Fine animals, and I can't think where one of them is now." } },
    scourge = { { id = "tp_scourge", text = "Their blades are pitted rubbish, most of them. They win by numbers, and never by steel." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady's own bow isn't our work, more's the pity. I'd like to have had the making of the arrowheads." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. If it won't go in the fire, I've not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Dan Golthas: junior leatherworking trainer in the Rogues' Quarter; over-oils everything.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_golthas", id = TODO_NPC("Dan Golthas"), name = "Dan Golthas", title = "Journeyman Leatherworker",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "eager", "clumsy" }, values = { "craft", "belonging" },
  notices = { "profession", "race" },
  impression = {
    first = "Dan Golthas teaches beginners' leatherworking in the Rogues' Quarter, under Arthur Moore. He is keen and good-natured and smells strongly of neatsfoot oil, and his own work has a strap or two in odd places.",
    third = "{name} met Dan Golthas, a junior leatherworking trainer in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, you came back! Come look, I've finished a belt with only one strap in an odd place this time." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Arthur says I'm to be polite, so I'm being polite, but only just." },
    { id = "g_1", text = "Hello! Careful where you sit, since most of these stools have got something drying on them." },
    { id = "g_2", when = { profession = "Leatherworking" }, text = "You work leather! I thought so. Here, feel this hide and tell me whether it's too stiff, because Arthur says it is and I can't tell any more." },
    { id = "g_3", when = { metBefore = true }, text = "Oh, it's you again. Good! I've finished a quiver since you came, and it's nearly the right way up." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Skinning" },
      text = "A skinner. Killian Hagey says most people nick the hide at the shoulder, and then I get it, and then I have to hide the nick under a pocket." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "I hope the leather doesn't trouble you. I've wondered whether it's rude, selling hides in front of a tauren, and nobody's ever told me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Dan Golthas. I teach the first part of leatherworking, the cutting and punching and the plain stitches, and Arthur Moore teaches everything after. I'm still learning from him myself, between you and me." },
        { id = "hello_2", when = { profession = "Leatherworking" }, text = "Dan Golthas. I can show you light armour kits and simple boots, and for anything cleverer you'll want Arthur. He's just there, pretending he isn't watching me." },
      },
      again = {
        { id = "hello_a1", text = "What else? I like the company." },
        { id = "hello_a2", text = "Go on, I'm only waiting for this to dry." },
        { id = "hello_a3", text = "Ask me anything. Well, anything about leather." },
      },
      choices = {
        { text = "Good leather work should last as long as the wearer.", next = "BACK", reply = "And down here that's a very long time. I'll keep at it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Make it look nice. Nobody checks the stitching underneath.", next = "BACK", reply = "Arthur checks it. Arthur checks everything, and then he sighs at me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you can teach.", next = "BUSINESS" },
        { text = "You use a great deal of oil.", next = "oil" },
        { text = "What's it like learning under Arthur Moore?", next = "arthur" },
        { text = "I heard about a satchel with the strap inside.", next = "satchel", when = { heardLine = "uc_chambers.m2_default" } },
        { text = "Why do the leatherworkers sit in the Rogues' Quarter?", next = "place" },
        { text = "Hides don't offend us, if they're honoured.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to it, Dan.", next = "END" },
      },
    },
    oil = {
      lines = { { id = "oil_1", text = "Does it show? Gillian Moore says my jerkins arrive smelling like a lamp. The thing is, I can't feel when the leather's had enough, not with these hands, so I give it a bit more to be safe, and then a bit more after that." } },
      choices = {
        { text = "How did you judge it when you were alive?", next = "oil2" },
        { text = "Dead fingers must make it hard.", next = "oil2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oil2 = {
      lines = { { id = "oil2_1", text = "By touch. You'd press a thumb in and feel it give and spring back. Now I press and it's like pressing through a glove, so Arthur's teaching me to judge by the colour and by bending a corner. I'm getting it, slowly." } },
      choices = {
        { text = "You'll get there.", next = "BACK", reply = "I think so too! Arthur says by midwinter, and he never says things to be kind.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then count the spoonfuls and stop guessing.", next = "BACK", reply = "Count them. That's so simple I'm cross I never thought of it." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    arthur = {
      lines = { { id = "arthur_1", text = "He's the best in the city and he knows it, and he's never once shouted at me, though I've given him cause. He just holds the piece up to the lamp and looks at it for a long while, and that's worse than shouting, honestly." } },
      choices = {
        { text = "What's the worst thing you've handed him?", next = "arthur2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    arthur2 = {
      lines = { { id = "arthur2_1", text = "A pair of boots with two left feet. I'd cut both from the one pattern and never turned it over. He looked at them, and looked at me, and said there must be a customer for them somewhere in a city of the dead. And there was! A deathguard bought them within the week." } },
      choices = {
        { text = "The Undercity provides.", next = "BACK", reply = "It does! I've never felt so lucky to live somewhere so unlucky." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    satchel = {
      lines = { { id = "satchel_1", text = "Jonathan Chambers still has it? Oh no. He said he'd sold it. I sewed the strap on before I turned the bag, that's all, and then it was on the inside, and by then I'd waxed the seams. He shows it to people, doesn't he?" } },
      choices = {
        { text = "Only to people having a bad day.", next = "BACK", reply = "Then I suppose it's doing some good. I'll make him another." },
        { text = "Something else.", next = "BACK" },
      },
    },
    place = {
      lines = { { id = "place_1", text = "The smell, mostly. Tanning stinks, and nobody in the Magic Quarter would have us. The rogues don't mind, and they're good customers besides, since they want everything soft and dark and without a single buckle that could clink." } },
      choices = {
        { text = "Do the Deathstalkers buy from you?", next = "place2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    place2 = {
      lines = { { id = "place2_1", text = "From Arthur, they do. They come at odd hours and they never give a name, and they pay in exact coin. I'm not allowed to do their fittings yet. I asked Arthur why and he said because I'd tell everybody about it, which I suppose I just have." } },
      choices = {
        { text = "I won't pass it on.", next = "BACK", reply = "Thank you. I really must stop doing that." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tauren_1", text = "Oh, that's a relief. Honoured how, though? I'd like to do it properly. We get the hides from Killian with nothing said over them at all, and it's never sat quite right with me." } },
      choices = {
        { text = "Thank the beast, and waste none of it.", next = "BACK", reply = "I can do that. I've been wasting less every month, so that's half of it already." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "I was nineteen when the plague came, and I'd only been an apprentice a year. I've had longer at the bench dead than alive, now." } },
    advice = { { id = "tp_advice", text = "Turn the pattern over for the second boot. I can't say that strongly enough." } },
    lordaeron = { { id = "tp_lordaeron", text = "My master's shop was by the east gate. He got out, I think. I hope he did." } },
    sylvanas = { { id = "tp_sylvanas", text = "I've never seen her. Arthur made a quiver for one of her rangers once and wouldn't let me so much as hold it." } },
    syndicate = { { id = "tp_syndicate", text = "They wear good leather, I'll say that. I've had one of their jerkins in to copy, and I didn't ask how we came by it." } },
    _none = { { id = "tp_none", text = "I don't know, sorry! Arthur might, and he might even tell you." } },
  },
}

---------------------------------------------------------------------------
-- Jezelle Pruitt: lectures on demon summoning in the Magic Quarter to three students.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_jezelle", id = TODO_NPC("Jezelle Pruitt"), name = "Jezelle Pruitt",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = { "undercity" }, temper = { "theatrical", "exacting" }, values = { "knowledge", "control" },
  notices = { "class", "race" },
  impression = {
    first = "Jezelle Pruitt lectures on the summoning of demons in the Magic Quarter, calling each creature up in turn before three students. She treats the demons as teaching aids and the students as only slightly more promising.",
    third = "{name} met Jezelle Pruitt, who lectures on demon summoning in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_1", text = "If you have come for the lecture, stand at the back and do not feed anything that appears in the circle." },
    { id = "g_2", when = { class = "WARLOCK" }, text = "A practitioner. You may stay for the lecture, and you may keep your corrections to yourself until the students have gone." },
    { id = "g_3", when = { metBefore = true }, text = "You return. The class begins again shortly, as it always does, and I am told repetition is the mother of learning." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp is sulking behind your left shoulder, wherever you have banished it to. Mine sulks too, and I find it means the binding is sound." },
    { id = "n_2", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You look at my circle as if it had insulted your mother. Look all you wish, but stay outside the chalk." },
    { id = "n_3", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people learned this art at a ruinous price, and I notice the ones who come to my lectures always stand nearest the door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Jezelle Pruitt. I teach the summoning of demonic servants, from the imp to the felsteed, to Victor Bartholomew, Winifred Kerwin and Adrian Bartlett, who between them have very nearly mastered the imp." },
        { id = "hello_2", when = { class = "WARLOCK" }, text = "Jezelle Pruitt. I teach the young ones what you presumably know already, which is that each demon is a tool with one use and several ways of turning in the hand." },
      },
      again = {
        { id = "hello_a1", text = "Another question? Good. My students never have any." },
        { id = "hello_a2", text = "Go on. The circle will hold a while longer." },
        { id = "hello_a3", text = "Ask it, and step back from the chalk when you do." },
      },
      choices = {
        { text = "What does the lecture cover?", next = "lecture" },
        { text = "Your three students look nervous.", next = "students" },
        { text = "The orcs paid dearly for this knowledge.", next = "price" },
        { text = "I sense no magic in you at all.", next = "mana", when = { class = { "WARLOCK", "MAGE", "PRIEST" } } },
        { text = "We stand by the door for good reason.", next = "orc", when = { race = "Orc" } },
        { text = "I'll leave you to your class.", next = "END" },
      },
    },
    lecture = {
      lines = { { id = "lecture_1", text = "Five creatures, in the order a student may hope to command them. The imp, which is small and spiteful. The voidwalker, which endures. The succubus, the felhunter, and last the felsteed, which is less a servant than a means of leaving quickly." } },
      choices = {
        { text = "Which is the most dangerous to its master?", next = "lecture2" },
        { text = "The succubus draws the crowd, I'd wager.", next = "lecture2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lecture2 = {
      lines = { { id = "lecture2_1", text = "The succubus, and for the reason you suppose. The voidwalker obeys because it cannot think of anything else to do, and the felhunter because it is fed. The succubus obeys because she has decided to, and what is decided can be undecided." } },
      choices = {
        { text = "Has one ever slipped your binding?", next = "lecture3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    lecture3 = {
      lines = { { id = "lecture3_1", text = "Once, in the middle of a lecture, for about the space of a breath. She did nothing whatever with it but smile at me. I have rebuilt that binding from the first stroke, and I have thought about that smile every day since." } },
      choices = {
        { text = "She wanted you to know she could.", next = "BACK", reply = "Precisely so, and she was right to think it would cost me more sleep than a wound." },
        { text = "Then banish her and teach from a book.", next = "BACK", reply = "A summoner who teaches from a book is a cook who teaches from a painting." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "students_1", text = "They should be. Bartholomew is clever and lazy, Kerwin is diligent and frightened, and Bartlett would summon something large tomorrow if I turned my back. Between them they make one adequate warlock, and I have not yet worked out how to combine them." } },
      choices = {
        { text = "Which of them will go furthest?", next = "students2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    students2 = {
      lines = { { id = "students2_1", text = "Kerwin, the frightened one. Fear checks its chalk lines. Luther Pickman across the quarter prefers the bold ones, and he and I have agreed to differ, loudly, about once a month." } },
      choices = {
        { text = "Fear makes careful summoners.", next = "BACK", reply = "It makes living ones, or what passes for living here.", fx = { affinity = 1 } },
        { text = "Boldness is what the art rewards.", next = "BACK", reply = "It rewards boldness once, grandly, and then sends the remains home in a jar." },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      big = true,
      lines = { { id = "price_1", text = "They did, and so will we, I expect, though the Forsaken come to it with less to lose. A demon is a loaded crossbow that hates you. The whole of my teaching is where to point it. Do you think that a fit thing to teach the young?" } },
      choices = {
        { text = "Yes. Better taught than stumbled into.", next = "BACK", reply = "So I hold. Ignorance never yet kept a demon out of a circle.", fx = { align = { order = 1 } } },
        { text = "No. Some doors ought to stay shut.", next = "BACK", reply = "The doors are open already. I only teach them where the hinges are.", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    mana = {
      lines = { { id = "mana_1", text = "You are observant, and somewhat rude. I have none, it is true. Whatever I had was burned out of me when I rose. Yet the demons still come when I call them, and I confess I do not altogether know what it is they are answering." } },
      choices = {
        { text = "That doesn't trouble you?", next = "mana2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    mana2 = {
      lines = { { id = "mana2_1", text = "It interests me, which is a healthier habit than being troubled. Carendin Halgar has a theory about debts, and Kaal Soulreaper has a ruder one. I let them argue it and I go on teaching, since the method works whether or not I can explain it." } },
      choices = {
        { text = "A working method is its own answer.", next = "BACK", reply = "For the present. I should still like to see the bill before it falls due." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_1", text = "I know it, and I do not mock it. Your people were handed this art by a master who meant to spend them. I teach it here with no master in the room, and I ask my students to remember your people's lesson before they learn any of mine." } },
      choices = {
        { text = "Then you teach it better than Gul'dan did.", next = "BACK", reply = "That is a low fence to clear, but I thank you for it." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    demons = { { id = "tp_demons", text = "Servants, never allies. The day a student calls one \"friend\" is the day I send them to Father Lankester instead." } },
    forsaken = { { id = "tp_forsaken", text = "We were enslaved once by a will not our own. It gives us a certain professional insight into binding." } },
    advice = { { id = "tp_advice", text = "Check the circle, and then check it again from the other side. Chalk looks whole from wherever you happen to be standing." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady tolerates our art because it is useful. I should not wish to be the warlock who made it inconvenient." } },
    burning_legion = { { id = "tp_burning_legion", text = "The source of everything I teach, and the reason I teach caution first. I have no wish to meet the owners of my servants." } },
    _none = { { id = "tp_none", text = "That is not on the syllabus, and I do not speculate before students." } },
  },
}

---------------------------------------------------------------------------
-- Godrick Farsan: blind assistant to Carendin Halgar in the Magic Quarter; sets warlocks to gather hearts.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_godrick", id = TODO_NPC("Godrick Farsan"), name = "Godrick Farsan",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "soft-spoken", "unsettling" }, values = { "knowledge", "patience" },
  notices = { "class", "race" },
  impression = {
    first = "Godrick Farsan is blind, and turns his face to people a moment before they speak. He assists the warlock Carendin Halgar in the Magic Quarter and asks for dreadful things in a mild and patient voice.",
    third = "{name} met Godrick Farsan, the blind assistant of the warlock Carendin Halgar in the Undercity.",
  },

  greetings = {
    { id = "g_1", text = "You need not announce yourself, for I heard your boots choose this direction some time ago." },
    { id = "g_2", when = { class = "WARLOCK" }, text = "There is a small dark flame standing where you stand, so you are a warlock. Come closer, since Carendin said one would be along." },
    { id = "g_devourer", when = { questActive = TODO_QUEST("Devourer of Souls") }, text = "Carendin sent you, I think, about the succubus. Do not think less of me because my sight is gone, for I see what lies behind things now, more clearly than I ever did with eyes." },
    { id = "g_3", when = { questActive = TODO_QUEST("Hearts of the Pure") }, text = "You have come back, but you are no heavier than when you left. I need those two hearts, {class}, and Carendin needs them more." },
    { id = "g_4", when = { metBefore = true }, text = "The same step as before, a little surer, and welcome back." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is making faces at me. They always do, since they suppose a blind man cannot tell, and they are always wrong." },
    { id = "n_succ", cat = "class", when = { class = "WARLOCK", pet = { family = "Succubus" } },
      text = "Your succubus burns very prettily, and she is trying to work out what I want, and finding nothing to hold. It vexes her, and I confess I enjoy it." },
    { id = "n_2", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You are very bright to stand beside, and I do not mean it as praise. It is something like standing too near a forge." },
    { id = "n_3", cat = "race", when = { race = "Tauren" },
      text = "The floor told me a tauren had come in before the air did. You walk heavily, and you walk kindly, and that is a rare pairing." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "He turns his face toward you a moment before you speak, his clouded eyes fixed a little to the left of yours.",
      lines = {
        { id = "hello_1", key = true, text = "Godrick Farsan. I keep Carendin Halgar's notes and his circles in order, and I see to the students he has no patience for. My eyes went in the plague, and I have found I do not much miss them." },
        { id = "hello_2", when = { all = { { class = "WARLOCK" }, { questBefore = TODO_QUEST("Hearts of the Pure") }, { minLevel = 20 } } }, text = "Godrick Farsan. Carendin tells me you are ready to bind a devourer of souls, and that I am to prepare you, and for that I shall need the hearts of two good men, which are harder to find in Lordaeron than you would think." },
        { id = "hello_3", when = { questDone = TODO_QUEST("Hearts of the Pure") }, text = "Godrick Farsan, and I remember what you brought me. The heart of a good man looks much like any other, once it is out, and I think that troubled you less than it should have." },
      },
      again = {
        { id = "hello_a1", text = "Yes? I am listening, and I am never doing anything else." },
        { id = "hello_a2", text = "Ask what you like. I am not easily tired." },
        { id = "hello_a3", text = "Go on, then, and take your time, since I have plenty of it." },
      },
      choices = {
        { text = "Carendin sent me about the succubus.", next = "hearts", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "Farsan. There's a warlock of that name in Ratchet.", next = "name", when = { class = "WARLOCK", minLevel = 28 } },
        { text = "How do you see, without eyes?", next = "sight" },
        { text = "What is it like, working for Carendin Halgar?", next = "halgar" },
        { text = "Why the hearts of the pure? Is innocence so sweet to her?", next = "hearts", when = { class = "WARLOCK" } },
        { text = "Farsan. I've met a Farsan in Ratchet.", next = "name", when = { class = "WARLOCK" } },
        { text = "You tend the circles by touch.", next = "circles" },
        { text = "I'll go quietly, Godrick.", next = "END" },
      },
    },

    sight = {
      lines = { { id = "sight_1", text = "Differently, and not the wall or your face or the lamp, but whatever burns. The living are a steady yellow, the Forsaken a low grey, and those who traffic with demons carry a second, smaller flame that is not their own." } },
      choices = {
        { text = "What do the demons look like?", next = "sight2" },
        { text = "That sounds like a poor trade for eyes.", next = "sight2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    sight2 = {
      lines = { { id = "sight2_1", text = "It was a fair trade, to my mind. Demons are holes in the shape of creatures, with heat pouring through them from somewhere else, and that is why I am useful to Carendin, because a binding that looks sound to him may leak where only I can tell." } },
      choices = {
        { text = "And what do you see in me?", next = "sight3" },
        { text = "Another matter, then.", next = "BACK" },
      },
    },
    sight3 = {
      lines = {
        { id = "sight3_1", text = "A flame that leans forward, as if into wind, because you are going somewhere and you are impatient with the road. I have seen that shape go out quickly, and I have seen it grow very large, and I can't tell you which yours will do." },
        { id = "sight3_2", when = { class = "WARLOCK" }, text = "Your own flame, steady enough, and the little one beside it, pulling at its leash. It pulls less than most, which tells me you bound it properly, but do not let that make you fond of it." },
      },
      choices = {
        { text = "I intend to grow large.", next = "BACK", reply = "Most do, and I shall listen for how it goes.", fx = { trait = { brave = 1 } } },
        { text = "I'd rather not know.", next = "BACK", reply = "That is wise of you. I often wish I didn't." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },

    halgar = {
      lines = { { id = "halgar_1", text = "Restful, oddly, because he is short with everyone and expects nothing kind in return, so no one has to pretend. He reads and I listen, and now and then he says \"Farsan, is that line whole?\" and I tell him, and he grunts, which is as near to friendship as he comes." } },
      choices = {
        { text = "Do you trust him?", next = "halgar2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    halgar2 = {
      lines = { { id = "halgar2_1", text = "I trust him to be exactly what he is, which is more than I could say of anyone I knew while I was breathing. He wants knowledge and does not much care what it costs other people, and I know where I stand, even if I can't see where that is." } },
      choices = {
        { text = "An honest villain is easier company.", next = "BACK", reply = "I should not say villain within his hearing, but yes.", fx = { trait = { witty = 1 } } },
        { text = "You deserve a kinder master.", next = "BACK", reply = "Kindness is very difficult to see. I prefer what I can find in the dark." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    hearts = {
      lines = { { id = "hearts_1", text = "A succubus cannot be dragged across without a lure, and nothing lures her like goodness she can spoil. It took me a long while of listening to travellers' talk, but I found two men who should do, and I shall show you their faces as I see them." } },
      choices = {
        { text = "Who are they?", next = "hearts_who" },
        { text = "That's a grim sort of bait.", next = "hearts2" },
        { text = "Another matter, then.", next = "BACK" },
      },
    },
    hearts_who = {
      narr = "He lifts one hand and holds it flat in the air, as though resting it on a head you cannot see.",
      lines = { { id = "hw_1", text = "This is Dalin Forgewright, who fled Lordaeron with his love when the plague came, and stayed at the Greymane Wall to tend the refugees his own kin turn away. And this is Comar Villard, whose wife was taken from Menethil Harbor two weeks after their wedding, and who still walks the Wetlands looking for her." } },
      choices = {
        { text = "They sound like good men.", next = "hearts2" },
        { text = "Then I'll bring their hearts to Carendin.", next = "BACK", reply = "Do. He will hold them up to the lamp and tell you they look like anyone's, and he will be right." },
      },
    },
    hearts2 = {
      big = true,
      lines = { { id = "hearts2_1", text = "They are, and fools for it, and that is the whole of why she will come. The living would call this murder and I suppose it is, so I ask every student the same thing before they go: does it sit easily with you?" } },
      choices = {
        { text = "They chose this war. Their hearts are fair payment.", next = "BACK", reply = "Then you will sleep, and she will find less to work with. Good.", fx = { align = { light = -1 } } },
        { text = "No, and I hope it never does.", next = "BACK", reply = "Keep that. A warlock who has stopped minding is very nearly a demon's meal already.", fx = { align = { light = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },

    name = {
      lines = { { id = "name_1", text = "Strahad, yes, my kinsman, and a living man still, and a far grander warlock than I. We wrote before the plague, and he has not written since, and I do not blame him, for there is no good way to begin a letter to a dead cousin." } },
      choices = {
        { text = "Carendin's sending me to him for a felhunter.", next = "name2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "name2_1", text = "Then you will hear his voice before I do again, which is a strange thing to envy. Tell him nothing of me unless he asks, and if he asks, tell him I see well enough." } },
      choices = {
        { text = "I'll tell him, if he asks.", next = "BACK", reply = "Thank you. He will not ask, I think, but I like knowing the answer is ready.", fx = { affinity = 1 } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    circles = {
      lines = { { id = "circles_1", text = "By touch and by heat. Chalk is cool, and a line with power in it is faintly warm, like a sill the sun has just left, and I walk each circle barefoot before Carendin uses it and have never yet let him step into a cold one." } },
      choices = {
        { text = "He's fortunate to have you.", next = "BACK", reply = "He would say he is adequately served, and from him it is the same thing." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    demons = { { id = "tp_demons", text = "Do not look at them too long. I am spared that mistake, and I count it the chief advantage of my condition." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They are very bright and very certain, and from a distance their monastery looks like a town on fire." } },
    forsaken = { { id = "tp_forsaken", text = "We burn low and long, like banked coals, and it is not an unpleasant colour." } },
    advice = { { id = "tp_advice", text = "Listen before you enter any room. Rooms tell you who is in them, if you are patient for the space of a breath." } },
    sylvanas = { { id = "tp_sylvanas", text = "I have been near her once, and she does not burn grey like the rest of us. I should not like to say what colour it was." } },
    _none = { { id = "tp_none", text = "I can't see that far, I fear. Ask Carendin, when he is in a tolerable humour." } },
  },
}

---------------------------------------------------------------------------
-- Estelle Gendry: outfitter to the Deathstalkers in the Rogues' Quarter; issues thieves' tools.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_estelle", id = TODO_NPC("Estelle Gendry"), name = "Estelle Gendry",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "brisk", "sardonic" }, values = { "cunning", "thrift" },
  notices = { "class", "purse" },
  impression = {
    first = "Estelle Gendry outfits the Deathstalkers from a corner of the Rogues' Quarter, and she counts every lockpick out and expects to count it back in. She sizes people up quickly and prices them a moment later.",
    third = "{name} met Estelle Gendry, the Deathstalkers' outfitter in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_1", text = "Hands where I can see them, dear, since it's nothing personal and I say it to everyone." },
    { id = "g_2", when = { class = "ROGUE" }, text = "Another of Mennet's hopefuls. Let me see your fingers. Hm, long enough, and you've still got all of them, which puts you ahead of the last one." },
    { id = "g_3", when = { questActive = TODO_QUEST("Tools of the Trade") }, text = "You've the tools, you've had the lesson, and Ambermill's that way. I don't issue courage, so you'll have to bring your own." },
    { id = "g_4", when = { metBefore = true }, text = "Back again. If you've lost my picks you can turn round and go and find them." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "You've a pick tucked in your sleeve seam, on the wrong side, where it'll catch when you reach. Move it to the left cuff and you'll thank me some dark night." },
    { id = "n_2", cat = "purse", when = { money = { max = 5000 } },
      text = "Light pockets. Well, that's what locks are for, dear, other people's ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Estelle Gendry. I keep the Deathstalkers in picks, wire, wax and soft-soled boots, and I keep a list of who has what. Mennet Carkad sends them to me, and I send them out able to open a door without knocking." },
        { id = "hello_2", when = { all = { { class = "ROGUE" }, { questActive = TODO_QUEST("Tools of the Trade") } } }, text = "Estelle Gendry, and you'll be the one Mennet's sending to Ambermill for the Dalaran wizards' papers. Take the tools and mind them. The Kirin Tor don't lock a chest the way a farmer does, so go slowly and listen for the second click." },
        { id = "hello_3", when = { questDone = TODO_QUEST("Tools of the Trade") }, text = "Estelle Gendry, and you came back from Ambermill with the report and my picks both. That's twice as much as I get from most of them." },
      },
      again = {
        { id = "hello_a1", text = "What else, dear? I'm counting." },
        { id = "hello_a2", text = "Go on, but I'm not lending anything." },
        { id = "hello_a3", text = "Ask away. Talk's the one thing I don't have to inventory." },
      },
      choices = {
        { text = "What goes into a Deathstalker's kit?", next = "kit" },
        { text = "Tell me about locks.", next = "locks", when = { class = "ROGUE" } },
        { text = "How do you get on with Mennet Carkad?", next = "mennet" },
        { text = "Everyone in this quarter watches everyone else.", next = "quarter" },
        { text = "I'll keep my hands to myself. Farewell.", next = "END" },
      },
    },
    kit = {
      lines = { { id = "kit_1", text = "Six picks, graded fine to coarse, and a tension bar. A stick of candle wax for taking a key's likeness, a coil of wire, chalk, and a little pot of grease for hinges. Boots from Arthur Moore with no nails in the sole. Everything else is nerve." } },
      choices = {
        { text = "No blades?", next = "kit2" },
        { text = "That's a modest kit for a spy.", next = "kit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit2 = {
      lines = { { id = "kit2_1", text = "Blades are Charles Seaton's business, along the canal, and poisons are Ezekiel Graves's. I do the quiet half. A Deathstalker who's had to use Seaton's goods has already made a mess of using mine, and Mennet says so at some length when they come home." } },
      choices = {
        { text = "Which do they lose most often?", next = "kit3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    kit3 = {
      lines = { { id = "kit3_1", text = "The tension bar, every time, and never the picks. They put it between their teeth while they work and then somebody coughs in the next room. I've started tying a thread to them, like a child's mitten, and not one of them has thanked me." } },
      choices = {
        { text = "It's a sound idea.", next = "BACK", reply = "Of course it is. I had four sons, once. I know about mittens.", fx = { affinity = 1 } },
        { text = "A spy with mitten strings. Truly fearsome.", next = "BACK", reply = "Laugh, dear. You'll want one the first time you hear a cough." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    locks = {
      lines = { { id = "locks_1", text = "A lock is a small argument, and the key is whoever wins it. Farm locks have three pins and no opinions. Guild locks have five, and a ward. Wizards' locks, such as you'll meet at Ambermill, have a pin that isn't there until you touch it, so you feel for the cold one and leave it till last." } },
      choices = {
        { text = "And if I rush it?", next = "locks2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    locks2 = {
      lines = { { id = "locks2_1", text = "Then the pick snaps, the pins drop, and you start again with one pick fewer and somebody upstairs wondering about the noise. I've never yet buried a lockpicker who was slow. Go at the pace of a man shaving in the dark." } },
      choices = {
        { text = "Slowly, and listening. I have it.", next = "BACK", reply = "Good. Say it again on the doorstep, when your hands are telling you otherwise." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mennet = {
      lines = { { id = "mennet_1", text = "Well enough. He picks them and trains their nerve, and I equip them and train their fingers. He thinks he has the harder job, and I let him think it, since he's the one Lord Varimathras sends for when something goes wrong." } },
      choices = {
        { text = "Does much go wrong?", next = "mennet2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    mennet2 = {
      big = true,
      lines = { { id = "mennet2_1", text = "Less than you'd fear and more than Mennet reports. We lost a lad at Ambermill in the spring, a careful one too. Mennet wrote \"delayed\" in the ledger, and it's said \"delayed\" ever since. I'd have written the truth. What would you have had him write?" } },
      choices = {
        { text = "The truth. The dead are owed that much.", next = "BACK", reply = "So I think. I keep my own list, and it says what happened.", fx = { align = { honor = 1 } } },
        { text = "Delayed. A ledger is no place for grief.", next = "BACK", reply = "That's Mennet's view exactly. You'd get on.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = { { id = "quarter_1", text = "That's the whole charm of the place, dear. Mennet watches the recruits, Carolyn Ward and her trainers watch Mennet, Ezekiel watches his jars, and I watch everybody's hands. Nothing's been stolen in this quarter in a year, which is a strange thing to say of a den of thieves." } },
      choices = {
        { text = "Honour among thieves, then.", next = "BACK", reply = "Arithmetic among thieves. There's simply nobody left unwatched to rob." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deathstalkers = { { id = "tp_deathstalkers", text = "The Dark Lady's eyes and knives. I only see to it that the eyes can get through a keyhole." } },
    forsaken = { { id = "tp_forsaken", text = "We're patient, we don't breathe loudly, and nobody misses us. You couldn't design a better burglar." } },
    dalaran = { { id = "tp_dalaran", text = "Wizards behind a wall, writing everything down. People who write everything down are a gift to my trade." } },
    advice = { { id = "tp_advice", text = "Never carry a key you can't explain. Take the wax likeness and leave the key where it lay." } },
    syndicate = { { id = "tp_syndicate", text = "Amateurs with good tailoring. They break windows, and anyone can break a window." } },
    _none = { { id = "tp_none", text = "Not on my list, dear, and if it isn't on my list I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Thersa Windsong: a sick tauren in the Apothecarium, poisoned by Azshara's tide pools, studied by the chemists.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_thersa", id = TODO_NPC("Thersa Windsong"), name = "Thersa Windsong",
  bible = "bibles/more_folk.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "gentle", "weary" }, values = { "nature", "endurance" },
  notices = { "race", "class" },
  impression = {
    first = "Thersa Windsong is a tauren who drank from a tide pool in Azshara and has been sick ever since. She came to the Apothecarium because no healer of her own people could help, and she bears the chemists' interest in her with tired grace.",
    third = "{name} met Thersa Windsong, an ailing tauren who sought a cure from the apothecaries of the Undercity.",
  },

  greetings = {
    { id = "g_1", text = "Forgive me if I do not rise, friend, for the floor and I have reached an understanding today." },
    { id = "g_2", when = { race = "Tauren" }, text = "A face from home! Come and sit by me a moment, and let me smell the grass on you, if any of it has lasted this far." },
    { id = "g_3", when = { questActive = TODO_QUEST("Seeping Corruption") }, text = "The chemists say you are gathering something on my account. Walk carefully, then, and may the Earth Mother see you back." },
    { id = "g_4", when = { metBefore = true }, text = "You came again. That is kind, since few visit this room for any reason but to measure me." },
  },

  notice = {
    { id = "n_1", cat = "race", when = { race = "Tauren" },
      text = "You carry the plains with you. I had forgotten how wide a voice sounds when it has had room to grow in." },
    { id = "n_2", cat = "class", when = { class = { "DRUID", "SHAMAN" } },
      text = "You listen to the land. Then you will understand what I mean when I say that the water of that shore was not asleep. It was sick, and awake." },
    { id = "n_3", cat = "class", when = { class = "PRIEST" },
      text = "A healer. Many have laid hands on me, and I thank you for the thought before you offer it, but this is not a hurt that hands can find." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "I am Thersa Windsong, of Thunder Bluff. I fought the naga on the shores of Azshara, and afterward I drank from a tide pool, being thirsty and foolish. Whatever was in that water has not left me since." },
        { id = "hello_2", when = { race = "Tauren" }, text = "I am Thersa Windsong. Our own healers sang over me for a month, and the trolls tried their roots, and the orcs their poultices. When all of it failed I came to the dead, sister of the plains, for there was no one left to ask." },
        { id = "hello_3", when = { questDone = TODO_QUEST("Seeping Corruption") }, text = "I am Thersa Windsong, and I am told you carried what the chemists asked for. They are very pleased. I am still waiting to learn what it is they are pleased about." },
      },
      again = {
        { id = "hello_a1", text = "Ask what you will. Talking is easier than standing." },
        { id = "hello_a2", text = "I am glad of the company, truly." },
        { id = "hello_a3", text = "Yes, friend?" },
      },
      choices = {
        { text = "What happened on that shore?", next = "azshara" },
        { text = "You don't look well at all.", next = "sick" },
        { text = "The chemists seem very taken with you.", next = "chemists" },
        { text = "You are a long way from Mulgore.", next = "home" },
        { text = "The water was awake, you say.", next = "listen", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Rest, Thersa. I'll go.", next = "END" },
      },
    },
    azshara = {
      lines = { { id = "azshara_1", text = "We tracked a band of naga along the eastern strand, a day's walk from any fresh water. The fight was long and it went our way. I was parched after, and the pool looked clean as glass, with small bright things moving in it. I drank deep." } },
      choices = {
        { text = "When did the sickness begin?", next = "azshara2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    azshara2 = {
      lines = { { id = "azshara2_1", text = "By nightfall. First a cold in my belly, then a heat, and by morning my hands shook too much to hold my spear. The others carried me to the road. I remember the pools shining behind us in the dark, though there was no moon to shine on them." } },
      choices = {
        { text = "Light with no moon. That's an ill sign.", next = "azshara3" },
        { text = "What do you think was in the water?", next = "azshara3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    azshara3 = {
      lines = { { id = "azshara3_1", text = "I do not know, and that is what frightens me. That land was drowned in an old ruin of magic, long before my people's stories begin. I think something of that ruin seeps there still, and I drank a mouthful of a thing ten thousand years in the dying." } },
      choices = {
        { text = "Then the apothecaries may truly help.", next = "BACK", reply = "Perhaps. They know poisons as my people know grass.", fx = { affinity = 1 } },
        { text = "You should never have come to this place.", next = "BACK", reply = "You may be right. But I had run out of other places." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    sick = {
      lines = { { id = "sick_1", text = "No. My coat is dull, and I have lost a third of my weight, and some mornings my legs will not have me. It comes in tides, which seems a cruel joke. Today is low water, and so I can sit and speak with you." } },
      choices = {
        { text = "Is there much pain?", next = "sick2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    sick2 = {
      lines = { { id = "sick2_1", text = "Some. It is the strangeness that wears on me more. I dream of the sea every night, and I never saw the sea before that march. In the dream I am walking down into it quite calmly, and I am not afraid, and that is the worst of it." } },
      choices = {
        { text = "Hold to the plains when you wake.", next = "BACK", reply = "I do. I name the mesas, one by one, until the salt goes out of my mouth.", fx = { trait = { kind = 1 } } },
        { text = "Dreams are only dreams.", next = "BACK", reply = "I told myself so, the first month." },
        { text = "Something else.", next = "BACK" },
      },
    },
    chemists = {
      big = true,
      lines = { { id = "chemists_1", text = "Chemist Cuely and his brother. They are polite to me, in the way one is polite to a rare flower. They take a little blood, a little hair, they ask what I dreamed. I do not think it is my health they love. Would you trust them, in my place?" } },
      choices = {
        { text = "Yes. Their curiosity may yet save you.", next = "BACK", reply = "Then I will go on holding out my arm, and hoping.", fx = { align = { order = 1 } } },
        { text = "No. Leave while your legs still carry you.", next = "BACK", reply = "My heart says the same, on the high-water days. But where would it carry me?", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_1", text = "Farther than I ever meant to go. I would give a great deal for one morning on the Bluff, with the wind coming up off the Golden Plains and the smell of cookfires. Here there is no wind at all, only the green river breathing." },
        { id = "home_2", when = { race = "Tauren" }, text = "You know how far, as I do. When you stand again on the Bluff, will you face the east for me at sunrise? I should like to think An'she was greeted once in my name." },
      },
      choices = {
        { text = "I'll remember you to the plains.", next = "BACK", reply = "Then I am a little less far from them. Walk with the Earth Mother." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "listen_1", text = "You hear it, then. Water sleeps, in a pool, and wakes in a river, and the sea is always half awake. That pool was watching me as I knelt. I felt it and I drank anyway, because I was tired, and I have had many nights since to think about that." } },
      choices = {
        { text = "The Earth Mother does not hold thirst against you.", next = "BACK", reply = "No. But I hold it against myself, a little, still." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    azshara = { { id = "tp_azshara", text = "A beautiful shore, with something sick under it. Tell any of our people who go there to carry their own water." } },
    forsaken = { { id = "tp_forsaken", text = "They do not sleep, or eat, or feel the cold. I do not know what the Earth Mother makes of them, but they opened a door to me when I was ill." } },
    naga = { { id = "tp_naga", text = "Cold-eyed and quick, and at home in that water as I was not. I wonder now whether they drink from the pools, and what it has made of them." } },
    advice = { { id = "tp_advice", text = "Do not drink where nothing else comes to drink. I saw no tracks at that pool, and I should have asked myself why." } },
    thunder_bluff = { { id = "tp_thunder_bluff", text = "My home. I say the name to myself, down here, to remember there is sky somewhere." } },
    _none = { { id = "tp_none", text = "I can't say, friend. My thoughts do not range far beyond this room of late." } },
  },
}

---------------------------------------------------------------------------
-- Algernon: the Apothecarium's zombie alchemy supplier; sells by groan and gesture.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_algernon", id = TODO_NPC("Algernon"), name = "Algernon", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "mute", "dutiful" }, values = { "duty", "order" },
  notices = { "profession", "race" },
  impression = {
    first = "Algernon sells vials and reagents in the Apothecarium, and he is a zombie who answers in groans. Each groan seems to mean something particular, and the alchemists around him have plainly learned the difference.",
    third = "{name} met Algernon, the zombie who sells alchemy supplies in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hhnnuh! Uhn, uhn." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Grrhhn." },
    { id = "g_1", narr = "He lifts one grey hand, slowly, toward the shelf of empty vials.", text = "Uuuhhnn." },
    { id = "g_2", when = { profession = "Alchemy" }, narr = "The groan is brighter than the last, and he pushes a crate of crystal vials an inch toward you.", text = "Hrrnn!" },
    { id = "g_3", when = { metBefore = true }, narr = "He looks at you for some time, and then nods once, as if a ledger had been found and opened.", text = "Uhhn." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Alchemy" },
      narr = "He taps a stained finger against your satchel where the vials clink, and then against his own shelf, twice.", text = "Mmmrrh." },
    { id = "n_2", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      narr = "He leans toward you and sniffs, long and carefully, and then steps back behind his counter of his own accord.", text = "Hhhhnn." },
  },

  start = "hello",
  nodes = {
    d2_like = {
      lines = {
        { id = "d2_like_1", narr = "He looks around him slowly, at the green vats and the hurrying chemists and the cages along the far wall. Then he looks back at his shelf, and his hand rests on it, and he nods once.", text = "Uhn." },
      },
      choices = {
        { text = "The shelf is yours, at least.", next = "d2_like2" },
        { text = "It's a grim place to work.", next = "d2_like2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_like2 = {
      lines = {
        { id = "d2_like2_1", narr = "He taps the shelf, then his chest, then the till, the same as before. Then he points at the cages and shakes his head, very slowly, and goes back to straightening the vials.", text = "Hhrn." },
      },
      choices = {
        { text = "You keep the shelf, and leave the cages.", next = "BACK", reply = "Uhhn.", narr = "He nods, more firmly than before." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d2_boyle = {
      lines = {
        { id = "d2_boyle_1", narr = "Something like a smile pulls at his face. He mimes a man holding a flask very level with both hands, and then he waves at it, cheerfully, the way a neighbour waves across a street.", text = "Bhhoyl." },
      },
      choices = {
        { text = "You're friends, then.", next = "d2_boyle2" },
        { text = "Boyle's very proud of that flask.", next = "d2_boyle2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_boyle2 = {
      lines = {
        { id = "d2_boyle2_1", narr = "He takes a sprig of peacebloom from a bundle under the counter and holds it up, and then points across the room toward the bench where Boyle stands. He means, as far as you can tell, that he gives one to the flask every morning.", text = "Uhhn." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", reply = "Hrrn.", narr = "He puts the sprig back very carefully." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_speak = {
      lines = {
        { id = "d2_speak_1", narr = "He goes very still and looks at your hands for a long while. Then he shakes his head and touches his jaw, which is held together with wire, and taps the slate of prices beside the till.", text = "Nnnh." },
      },
      choices = {
        { text = "The slate speaks for you. I understand.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, narr = "He lays a hand flat on his own chest, and then on the counter, where the vials are ranked by size in rows as straight as a drill square.", text = "Uuhhn. Al... ger... non." },
        { id = "hello_2", when = { metBefore = true }, narr = "He has already set out the size of vial you looked at last time.", text = "Uhhn. Al-ger-non." },
      },
      again = {
        { id = "hello_a1", text = "Hrrn?" },
        { id = "hello_a2", narr = "He waits, with one hand on the till.", text = "Uuuh." },
        { id = "hello_a3", narr = "He tilts his head a little to the left.", text = "Mmmh." },
      },
      choices = {
        { text = "Sell the vials at a fair price, Algernon.", next = "BACK", reply = "Hunh. Uhn.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charge the alchemists double. They'll never argue with a zombie.", next = "BACK", reply = "Hrrrrnnn.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your vials and reagents.", next = "BUSINESS" },
        { text = "You keep a very tidy shelf, Algernon.", next = "shelf" },
        { text = "Who taught you to keep shop?", next = "who" },
        { text = "Doctor Marsh says you sold him a bad flask.", next = "marsh", when = { heardLine = "uc_marsh.scorch_1" } },
        { text = "It's all right. I won't come closer.", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Do you like it here, in the Apothecarium?", next = "d2_like" },
        { text = "Boyle says you greet the flowers.", next = "d2_boyle" },
        { text = "Shall I try to help you speak again?", next = "d2_speak", when = { class = "PRIEST" } },
        { text = "Thank you, Algernon.", next = "END" },
      },
    },
    shelf = {
      lines = { { id = "shelf_1", narr = "He straightens a vial that was already straight. Then he holds up three fingers, and points along the rows: empty glass, then leaded glass, then crystal. He does it slowly, so that you can follow.", text = "Hrrrn." } },
      choices = {
        { text = "Three grades of vial. I see.", next = "shelf2" },
        { text = "You know your stock better than most living merchants.", next = "shelf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shelf2 = {
      lines = { { id = "shelf2_1", narr = "It is nearly a word. He reaches under the counter and brings up a slate, on which someone else has written the prices in a neat hand, and he holds it level in front of you until you have read the whole of it.", text = "Uhhn!" } },
      choices = {
        { text = "Who writes your prices for you?", next = "shelf3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    shelf3 = {
      lines = { { id = "shelf3_1", narr = "He points toward the senior alchemist's bench, and then draws one finger down the slate, line by line, and shakes his head hard. As far as you can tell, he means that not one price has ever been wrong.", text = "Hhhn. Hal... sey." } },
      choices = {
        { text = "Then you're both to be trusted.", next = "BACK", reply = "Uhhn.", narr = "He puts the slate away, very gently." },
        { text = "Halsey keeps you honest, does he?", next = "BACK", reply = "Hrrrn.", narr = "He taps his own chest twice, and then the till, and looks at you steadily." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "who_1", narr = "He is quiet for a while. Then he mimes it for you: a hand passing something across a counter, a nod, a hand receiving coin. He does it twice more, and you see that the movements are much older than his death.", text = "Mmmrh." } },
      choices = {
        { text = "You kept a shop when you were alive.", next = "who2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    who2 = {
      big = true,
      lines = { { id = "who2_1", narr = "He nods, slowly. He looks at his hands, and at the shelf, and back to you, and makes a sound that is lower than the others and goes on rather longer. Then he straightens the nearest vial again.", text = "Uuuhhn." } },
      choices = {
        { text = "It's good that something stayed with you.", next = "BACK", reply = "Hrrn.", narr = "He pushes one small empty vial across the counter and closes your hand around it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They should have let you rest.", next = "BACK", reply = "Hhhh.", narr = "He shakes his head, once, and puts his hand flat on the counter as if to keep it from being moved.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh = {
      lines = { { id = "marsh_1", narr = "It is the loudest sound he has made. He takes a flask from the shelf, holds it up to the green light, turns it all the way round to show you there is no crack in it, and sets it down with great dignity.", text = "HRRNN." } },
      choices = {
        { text = "I believe you. The fault was Marsh's.", next = "BACK", reply = "Uhhn.", narr = "He nods, and looks toward Doctor Marsh's scorched wall for a long moment." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "living_1", narr = "He nods, and grips the edge of the counter with both hands, and keeps them there. After a moment he lets go with one of them and slides the slate of prices to the far edge, where you can read it at arm's length.", text = "Uuhh." } },
      choices = {
        { text = "You're a better shopkeeper than most, Algernon.", next = "BACK", reply = "Mmmh.", narr = "He does not let go of the counter, but he seems pleased." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", narr = "He points at himself, and then at the alchemists, and holds his two hands at different heights.", text = "Uuhn." } },
    sylvanas = { { id = "tp_sylvanas", narr = "He stands a little straighter, and bows his head.", text = "Hhhnn." } },
    scourge = { { id = "tp_scourge", narr = "He takes one step back from the counter and shakes his head, slowly, from side to side.", text = "Hrrr." } },
    advice = { { id = "tp_advice", narr = "He picks up a vial, stoppers it, and tips it upside down to show you that it does not leak.", text = "Uhhn." } },
    plague = { { id = "tp_plague", narr = "He looks toward the inner doors, and then very deliberately back at his shelf.", text = "Mmmh." } },
    _none = { { id = "tp_none", narr = "He looks at the slate, finds nothing on it that helps, and shrugs one shoulder.", text = "Uuuhh?" } },
  },
}

---------------------------------------------------------------------------
-- Katrina Alliestar: sells herb pouches and sickles in the Apothecarium beside her sister Martha.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_katrina", id = TODO_NPC("Katrina Alliestar"), name = "Katrina Alliestar", title = "Herbalism Supplier",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "tart", "fond" }, values = { "nature", "family" },
  notices = { "profession", "race" },
  impression = {
    first = "Katrina Alliestar sells herbalists' supplies in the Apothecarium, beside her sister Martha, who teaches the craft. She is the sharper-tongued of the two and still keeps window boxes, though only grave moss will grow in them.",
    third = "{name} met Katrina Alliestar, the herbalism supplier of the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you. Come in, you're one of the few who doesn't tread on my grave moss." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind my window boxes, and mind your manners, and I might sell you something." },
    { id = "g_1", text = "Good day. Don't touch the hanging bunches, because they're drying and they sulk if they're handled." },
    { id = "g_2", when = { profession = "Herbalism" }, text = "An herbalist. You've green under your nails, which is the only honest reference there is in this trade." },
    { id = "g_3", when = { metBefore = true }, text = "You're back. Martha said you would be. She's insufferable when she's right." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Herbalism" },
      text = "That pouch of yours is oilcloth. It'll sweat your herbs to mush in a day. Buy a linen one, from me or from anybody, but buy one." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Martha will want to ask you forty questions about plains herbs. I'd say you could hide behind me, but I don't think it would work." },
  },

  start = "hello",
  nodes = {
    d2_stall = {
      lines = {
        { id = "d2_stall_1", text = "Herbs and honey and cut flowers on feast days, and a tisane for coughs that half of Brill swore by. Martha grew the lot and I sold the lot, and I talked the farmers' wives into buying twice what they'd come for." },
      },
      choices = {
        { text = "You miss it.", next = "d2_stall2" },
        { text = "Sounds like a fine stall.", next = "d2_stall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_stall2 = {
      lines = {
        { id = "d2_stall2_1", text = "I miss the flowers, not the stall. Selling's the same anywhere, but a whole bucket of marigolds on a summer morning was something you'd never find in this city, and I'll not pretend the window boxes are a substitute." },
      },
      choices = {
        { text = "They're a brave try, though.", next = "BACK", reply = "That's what Martha says, when she's feeling kind. It's not often." },
        { text = "Ask you something else, Katrina.", next = "BACK" },
      },
    },
    d2_gather = {
      lines = {
        { id = "d2_gather_1", text = "Once a month, with Martha, up to the fields round Brill for silverleaf and peacebloom. We keep to the near side of the road, because the Scarlets shoot at anything bending over, and we've both been shot at once and didn't care for it." },
      },
      choices = {
        { text = "Did they hit you?", next = "d2_gather2" },
        { text = "The Scarlets shoot at herbalists?", next = "d2_gather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_gather2 = {
      lines = {
        { id = "d2_gather2_1", text = "Martha took an arrow through the bonnet, which ruined the bonnet and not much else. She was more cross about the bonnet than the arrow, and she's never let me forget I laughed." },
      },
      choices = {
        { text = "I'd have laughed too.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_light = {
      lines = {
        { id = "d2_light_1", text = "I know they do, and I know they won't get it. But if a druid wants to come and say a word over them, I'll not stop you, because nothing else has worked and I'm too stubborn to throw them out." },
      },
      choices = {
        { text = "I'll see what I can do.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Katrina Alliestar. My sister Martha teaches people to find herbs, and I sell them the pouches and sickles to do it with. I also sell the herbs to the ones who can't be bothered to go and look." },
        { id = "hello_2", when = { profession = "Herbalism" }, text = "Katrina Alliestar. If Martha's taught you, then you know more than I'm going to tell you, but she can't sell you a sharp sickle, and I can." },
      },
      again = {
        { id = "hello_a1", text = "What else? I'm only tying bunches." },
        { id = "hello_a2", text = "Go on. Martha's not listening, for once." },
        { id = "hello_a3", text = "Ask away." },
      },
      choices = {
        { text = "Sell herbs that are fresh, even if old stock is cheaper.", next = "BACK", reply = "Quite right. Martha would give it away, but I'll at least sell it honestly.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Dry the old herbs and sell them as fresh. Who'll know?", next = "BACK", reply = "Martha would know, and she'd never speak to me again. Neither would I.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "You and Martha work side by side.", next = "sisters" },
        { text = "Can anything grow down here?", next = "grow" },
        { text = "Who buys the most herbs?", next = "buyers" },
        { text = "What would Martha ask a tauren?", next = "plains", when = { race = "Tauren" } },
        { text = "What did you sell at your stall outside Brill?", next = "d2_stall" },
        { text = "Do you ever go up to gather yourself?", next = "d2_gather" },
        { text = "Your window boxes need the sun, not lamps.", next = "d2_light", when = { class = "DRUID" } },
        { text = "I'll leave you to your bunches.", next = "END" },
      },
    },
    sisters = {
      lines = { { id = "sisters_1", text = "Forty years, living and dead. We kept a garden and a stall outside Brill, and she did the growing and I did the selling, because she'd give the stock away to anybody with a cough. Nothing's changed but the address." } },
      choices = {
        { text = "You both rose together?", next = "sisters2" },
        { text = "It's rare, kin who woke side by side.", next = "sisters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sisters2 = {
      lines = { { id = "sisters2_1", text = "We did, in the same churchyard, three plots apart. She dug herself out first and then sat on my stone and waited, talking the whole time, so that the first thing I heard in my second life was Martha telling me I was late." } },
      choices = {
        { text = "You were lucky in each other.", next = "BACK", reply = "We were. Don't tell her I said so, I'd never hear the end.", fx = { affinity = 1 } },
        { text = "Forty years of that would wear on anyone.", next = "BACK", reply = "It does, daily. I wouldn't be without it." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "grow_1", text = "Grave moss, and mushrooms, and very little else. I've three window boxes behind the stall with no window, and I've tried peacebloom in them every spring out of plain stubbornness. It comes up white and thin and falls over in a week." } },
      choices = {
        { text = "Why keep trying?", next = "grow2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    grow2 = {
      big = true,
      lines = { { id = "grow2_1", text = "Because one year it might not fall over. Martha says it's foolish, and the apothecaries say it's sentiment, as though that were a disease. I say a gardener who stops planting is only a shopkeeper. Which of us has it right, do you think?" } },
      choices = {
        { text = "You do. Plant them again next spring.", next = "BACK", reply = "I shall, then, and you may come and see them fall over.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The apothecaries. Peacebloom has no place here.", next = "BACK", reply = "Hm. Well, you may be right, and I shall plant them anyway.", fx = { align = { light = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_1", text = "The Society, by the cartload. Doctor Halsey's students take the common sort, and Master Faranell's people take things I'm asked to weigh behind a screen. After them it's the cooks, and Eunice Burch is the only one who ever smells a bunch before she buys it." } },
      choices = {
        { text = "What do you weigh behind the screen?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "buyers2_1", text = "Gloomweed, mostly, and doom weed from Tirisfal, and I'm not paid to wonder what it's for. I know what those do in a garden, though. Nothing grows for a yard around either one. I shouldn't think they're any kinder in a bottle." } },
      choices = {
        { text = "You know more than you let on.", next = "BACK", reply = "I know plants. The rest I leave upstairs, where it's wanted." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    plains = {
      lines = { { id = "plains_1", text = "Whether your people truly dry earthroot in the open wind, and what you burn for a cough, and if it's so that you sing to the plants when you cut them. She has a list. She's had it since the first tauren came down the lift." } },
      choices = {
        { text = "We do sing. The plant should know it's thanked.", next = "BACK", reply = "There! She'll be unbearable. Go and tell her yourself, and mind your shins." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We don't need medicine any longer, and so I sell herbs to poisoners and cooks. It's a comedown, but it's a living, so to speak." } },
    advice = { { id = "tp_advice", text = "Cut above the second leaf, and the plant'll forgive you and grow back. Pull it up, and you've had your last harvest there." } },
    lordaeron = { { id = "tp_lordaeron", text = "Brill had the best soil north of the lake. It's ash and bone meal now, and the pumpkins have never done better, which I find in poor taste." } },
    plague = { { id = "tp_plague", text = "I sell what's ordered, dear. Ask me about peacebloom instead." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady came from a country of gardens, they say. I wonder sometimes if she misses the green." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it hasn't got roots, ask my sister, since she'll guess regardless." } },
  },
}

---------------------------------------------------------------------------
-- Thaddeus Webb: sells rods, vials and dust in the Apothecarium beside the enchanters.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_webb", id = TODO_NPC("Thaddeus Webb"), name = "Thaddeus Webb", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "precise" }, values = { "thrift", "order" },
  notices = { "profession", "purse" },
  impression = {
    first = "Thaddeus Webb sells enchanting supplies in the Apothecarium and weighs dust on a scale he will let nobody else touch. He is fussy, exact, and quietly aggrieved that Lavinia Crowe has never once complimented his stock.",
    third = "{name} met Thaddeus Webb, who sells enchanting supplies in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Good. I've weighed you out a portion of strange dust myself, exactly, to the grain." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Don't touch the scale. Don't even look at the scale." },
    { id = "g_1", text = "Please don't breathe across the scale, since it's weighing to the grain and you'll cost somebody a copper." },
    { id = "g_2", when = { profession = "Enchanting" }, text = "An enchanter, and one who's short of strange dust, unless I miss my guess. Everyone is, this month." },
    { id = "g_3", when = { metBefore = true }, text = "Ah, it's you. I've kept the accounts square since you were here, as I always do." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Enchanting" },
      text = "You carry your dust loose in a pouch. I can hear it sifting. A third of it's in the seams by now, and I could weep." },
    { id = "n_2", cat = "purse", when = { money = { min = 1000000 } },
      text = "You've the look of someone who could afford a golden rod without counting twice. I do like a customer who doesn't count twice." },
  },

  start = "hello",
  nodes = {
    d2_check = {
      lines = {
        { id = "d2_check_1", text = "I check it myself, every morning, against a set of brass weights from the capital's assay office that I carried out of the ruins in my coat. They're the last honest weights in Lordaeron, so far as I know." },
      },
      choices = {
        { text = "You carried them out yourself?", next = "d2_check2" },
        { text = "The last honest weights. Grand claim.", next = "d2_check2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_check2 = {
      lines = {
        { id = "d2_check2_1", text = "In my coat, on the day I rose, before I knew what I was or where I was going. I didn't know my own name for a week, but I knew those weights were in my pocket, and I've never let them out of my sight since." },
      },
      choices = {
        { text = "Some habits outlast everything.", next = "BACK" },
        { text = "Ask you something else, Thaddeus.", next = "BACK" },
      },
    },
    d2_wynn = {
      lines = {
        { id = "d2_wynn_1", text = "He is, and he's the best beginner's teacher Mistress Crowe has ever had, which she will never tell him. I'd tell him myself, but he'd only apologise for it, and I'd have to stand there while he did." },
      },
      choices = {
        { text = "You're fond of him.", next = "d2_wynn2" },
        { text = "Someone should tell him.", next = "d2_wynn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_wynn2 = {
      lines = {
        { id = "d2_wynn2_1", text = "I'm fond of anyone who weighs his dust twice before he uses it, and Wynn weighs it three times. If he'd only stop saying sorry to the rods, he'd be a very fine enchanter indeed." },
      },
      choices = {
        { text = "He apologises to the rods?", next = "BACK", reply = "Every time he picks one up. I've heard him. I've stopped commenting on it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_profit = {
      lines = {
        { id = "d2_profit_1", text = "Green cloth and leather, the ordinary sort the deathguards bring back from the Glades, since the dust sells steadily and nobody else wants the pieces. Leave the weapons to the merchants, who'll pay more for them whole." },
      },
      choices = {
        { text = "Sound advice.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Thaddeus Webb. I sell rods, vials, and what dust and essence I can buy in, all weighed fair on a scale I check each morning. Mistress Crowe and young Wynn do the teaching, and I see to it that they've something to teach with." },
        { id = "hello_2", when = { profession = "Enchanting" }, text = "Thaddeus Webb. You'll know what you need, so I shan't waste your time, except to say the copper rods are from James Van Brunt's forge this week and they're better than the last lot." },
      },
      again = {
        { id = "hello_a1", text = "Was there something else? Mind the scale." },
        { id = "hello_a2", text = "Do go on. I can weigh and listen." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "Weigh the dust exactly, even when nobody is watching.", next = "BACK", reply = "Precisely. Not that Lavinia Crowe would ever notice, but I would.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A grain short here and there won't hurt anybody.", next = "BACK", reply = "It will hurt my scale's reputation, and that's all I have.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "You're very particular about that scale.", next = "scale" },
        { text = "Where does your dust come from?", next = "dust" },
        { text = "You supply Lavinia Crowe herself.", next = "crowe" },
        { text = "These rods are forge work, not magic.", next = "rods" },
        { text = "Who checks your scale, if nobody may touch it?", next = "d2_check" },
        { text = "Malcomb Wynn seems a meek sort.", next = "d2_wynn" },
        { text = "What should I disenchant for profit?", next = "d2_profit", when = { profession = "Enchanting" } },
        { text = "I'll leave you to your weighing.", next = "END" },
      },
    },
    scale = {
      lines = { { id = "scale_1", text = "I ought to be. It came out of an assay office in the capital, and it's true to a single grain of soul dust. A supplier is only as honest as his scale, and there are stalls in the Trade Quarter where the pans are dented on purpose." } },
      choices = {
        { text = "Which stalls?", next = "scale2" },
        { text = "An honest scale in a city of rogues.", next = "scale2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scale2 = {
      lines = { { id = "scale2_1", text = "I name no names. I'll say only that I've bought a pinch from every dust seller in this city and reweighed it here, and I keep the results in a little book. It's dull reading for anyone but me. I find it very calming." } },
      choices = {
        { text = "A man should know his competitors.", next = "BACK", reply = "He should know them to the grain.", fx = { affinity = 1 } },
        { text = "That's a petty way to spend an evening.", next = "BACK", reply = "It's an exact way, which is a different thing, though I grant they look alike." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    dust = {
      lines = { { id = "dust_1", text = "From whatever adventurers have pulled apart. Somebody clears a crypt, finds a ring that does nothing for them, and has an enchanter break it. The dust comes to me in twists of paper, and I never know from one week to the next what I'll have." } },
      choices = {
        { text = "So your shelf follows the fighting.", next = "dust2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dust2 = {
      big = true,
      lines = { { id = "dust2_1", text = "Exactly so. When the Scarlet Monastery's been raided I'm rich in essence, and when it's quiet I've copper rods and apologies. It's an odd thing, to have one's livelihood depend on how many graves were opened this week. Does that strike you as an honest trade?" } },
      choices = {
        { text = "Honest enough. The dead things were going spare.", next = "BACK", reply = "Quite. Waste is the only real sin, in my view.", fx = { align = { order = -1 } } },
        { text = "It's a little close to grave robbing.", next = "BACK", reply = "I've had the thought. I prefer not to have it during business hours.", fx = { align = { order = 1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    rods = {
      lines = { { id = "rods_1", text = "Quite right, and most customers never notice. A rod is only good metal until an enchanter wakes it. James Van Brunt's forge draws the copper and silver ones, and I reject about one in six for a seam or a bend, which has not made me popular in the War Quarter." } },
      choices = {
        { text = "One in six is a hard standard.", next = "BACK", reply = "It is the standard. A flawed rod spoils the working and the enchanter blames the dust, which is to say me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowe = {
      lines = { { id = "crowe_1", text = "Eleven years I've supplied that woman, living and dead, and never a short measure. She examines every vial against the light, finds nothing wrong, and says nothing. Young Wynn got an \"adequate\" out of her last spring, and I'll admit it stung." } },
      choices = {
        { text = "Perhaps silence is her praise.", next = "crowe2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    crowe2 = {
      lines = { { id = "crowe2_1", text = "That's what I tell myself. If she'd found a fault in eleven years, I'd certainly have heard of it, at length. So I take the silence and I enter it in the book as satisfaction. A man has to keep accounts of something." } },
      choices = {
        { text = "Eleven faultless years speaks for itself.", next = "BACK", reply = "Thank you. I shall enter that as well." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Steady hands, no appetite, and no need for sleep. We make good clerks. I always did think the living were wasted on shopkeeping." } },
    advice = { { id = "tp_advice", text = "Keep your dust in glass, stoppered, away from damp. Paper twists are for carrying it home, and for nothing else." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept the stores for the royal assay office. It's the same work, with worse light." } },
    sylvanas = { { id = "tp_sylvanas", text = "I've never had the Dark Lady's custom. I keep a rod of truesilver set by, in case." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "Dreadful people, and an excellent source of small enchanted trinkets. I try to keep the two thoughts apart." } },
    _none = { { id = "tp_none", text = "I've no entry for that, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Salazar Bloch: the book dealer who sells and never lends.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bloch", id = TODO_NPC("Salazar Bloch"), name = "Salazar Bloch", title = "Book Dealer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "possessive", "learned" }, values = { "knowledge", "pride" },
  notices = { "class", "race" },
  impression = {
    first = "Salazar Bloch deals in books and parts with each one as if it were a tooth. He will sell to anybody with the coin, and he will not lend so much as a pamphlet to the Dark Lady herself.",
    third = "{name} met Salazar Bloch, the Undercity's book dealer.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. I've a book in that I'd sell to you and nobody else, though I'll still charge you for it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Every book here has a price, and yours has just gone up." },
    { id = "g_1", text = "You may look, and you may buy, but you may not read standing up, because this is a shop and no library." },
    { id = "g_2", when = { class = "MAGE" }, text = "A mage. Your sort always asks to borrow. The answer is no, and I say it now to spare us both the conversation." },
    { id = "g_3", when = { metBefore = true }, text = "You're back. Did you finish the last one, or are you one of those who buys for the spine?" },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "Your thumb's stained with ink at the first joint. A margin scribbler. I ought to refuse you, but at least it means you read them." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc, in a bookshop. No, don't bristle. I've sold more primers to your people this year than to my own, and they pay without haggling." },
  },

  start = "hello",
  nodes = {
    d2_valuable = {
      lines = {
        { id = "d2_valuable_1", text = "A herbal from Andorhal, hand-painted, every plant in the northern kingdom drawn from life. It's worth a fortune to the Society, and they've offered me one, and I've refused, because they'd cut the pages out for their notebooks." },
      },
      choices = {
        { text = "And to you, what's it worth?", next = "d2_valuable2" },
        { text = "You'd sooner keep it than sell it.", next = "d2_valuable2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_valuable2 = {
      lines = {
        { id = "d2_valuable2_1", text = "More than they could pay. The woman who painted it was a farmer's daughter with no schooling at all, and she drew every leaf as though she loved it, and that's not a thing the Society knows how to value." },
      },
      choices = {
        { text = "Keep it safe.", next = "BACK" },
        { text = "Ask you something else, Bloch.", next = "BACK" },
      },
    },
    d2_parqual = {
      lines = {
        { id = "d2_parqual_1", text = "He does, the only man in this city I let read without buying, and only because he's the only one who turns the pages properly. We argue about the dates of the Second War, and he's wrong about them, and I let him be wrong." },
      },
      choices = {
        { text = "He says the same of you.", next = "d2_parqual2" },
        { text = "An odd friendship.", next = "d2_parqual2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_parqual2 = {
      lines = {
        { id = "d2_parqual2_1", text = "Does he? Then we're both generous fools, and the books are the better for it. He reads more carefully than any scholar from Dalaran I ever met, and that includes the one who stole my hundred and forty volumes." },
      },
      choices = {
        { text = "A rare reader.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_mage = {
      lines = {
        { id = "d2_mage_1", text = "Then you'll know the difference between a primer and a grimoire, and you'll know that these are mostly primers. The grimoires the deathguards find go straight to Bethor Iceshard, and I'm told to be grateful for what's left." },
      },
      choices = {
        { text = "I'll look through the primers.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Salazar Bloch. I buy books from the ruins and sell them to the worthy, and to the unworthy too, at the same price. What I do not do is lend, to anyone, on any security whatever." },
        { id = "hello_2", when = { metBefore = true }, text = "Salazar Bloch. The stock's changed since you last came. A deathguard brought me a crate out of Andorhal, and half of it is only scorched at the edges." },
      },
      again = {
        { id = "hello_a1", text = "Something further? Don't crack that spine." },
        { id = "hello_a2", text = "Go on, then." },
        { id = "hello_a3", text = "Ask it. I can dust while you talk." },
      },
      choices = {
        { text = "Knowledge should be paid for fairly, by whoever wants it.", next = "BACK", reply = "Fairly, and in coin. Exactly my policy, and the Dark Lady's no exception.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Steal the books you want. Knowledge should belong to nobody.", next = "BACK", reply = "Then I'll know your face, and the books won't have you back.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Why won't you lend?", next = "lend" },
        { text = "Where do your books come from?", next = "stock" },
        { text = "Who reads, in the Undercity?", next = "readers" },
        { text = "What do orcs buy from you?", next = "orc", when = { race = "Orc" } },
        { text = "What's the most valuable book you own?", next = "d2_valuable" },
        { text = "Parqual Fintallas reads your books, I hear.", next = "d2_parqual" },
        { text = "I studied from books much like these.", next = "d2_mage", when = { class = "MAGE" } },
        { text = "I'll leave your shelves in peace.", next = "END" },
      },
    },
    lend = {
      lines = { { id = "lend_1", text = "Because I lent, once. A hundred and forty volumes, to a scholar of Dalaran with excellent manners and a signed receipt. The receipt is all I have. He's behind their dome now, with my books, and I trust they give him no pleasure." } },
      choices = {
        { text = "A hundred and forty? That's a library.", next = "lend2" },
        { text = "Jorah Annison says you won't lend, even to scholars.", next = "lend2", when = { heardLine = "uc_jorah.rd_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lend2 = {
      lines = { { id = "lend2_1", text = "It was the better half of my life's collecting, and I've rebuilt perhaps a third. So you'll understand that when Jorah Annison asks to borrow a treatise for one night, I tell him the price and wish him a pleasant evening." } },
      choices = {
        { text = "A book unread on a shelf serves no one.", next = "lend3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    lend3 = {
      big = true,
      lines = { { id = "lend3_1", text = "So every borrower has told me. A book on my shelf is safe, and whole, and here a hundred years from now, when we shall all still be about to want it. A book lent is a book hoped for. I'll hear you argue it, though. Go on." } },
      choices = {
        { text = "Knowledge kept from use is knowledge wasted.", next = "BACK", reply = "Prettily said. It will cost you four silver to act on it.", fx = { align = { order = -1 } } },
        { text = "You're right. What's kept is what survives.", next = "BACK", reply = "You're the first to say so in a year. I may give you a bookmark.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "stock_1", text = "Out of dead houses, mostly. The deathguards know I pay for paper, so they bring me what the Scourge didn't burn and the rats didn't nest in. Hymnals, farm almanacs, a great many cookery books, and now and then something worth the whole crate." } },
      choices = {
        { text = "What was the best thing a crate ever held?", next = "stock2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "stock2_1", text = "A surveyor's atlas of the northern kingdom, every road and mill, drawn a year before the plague. It's the last true picture of Lordaeron there is. I've refused two offers for it, and I look at it on evenings when I want to be miserable in an exact fashion." } },
      choices = {
        { text = "I'd like to see it, one day.", next = "BACK", reply = "Buy enough primers and I may hold it open for you. From a distance." },
        { text = "Something else.", next = "BACK" },
      },
    },
    readers = {
      lines = { { id = "readers_1", text = "More than you'd suppose. The mages, naturally, and the apothecaries, who want anatomy and want it illustrated. Parqual Fintallas buys every history I get and then tells me what's wrong with it. And the common dead buy novels, the sillier the better." } },
      choices = {
        { text = "Even the dead want a love story.", next = "BACK", reply = "They want one most of all. I can't keep them on the shelf." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_1", text = "Spelling books, and histories of the wars written by the other side. I asked one grunt why he wanted to read what humans said of the Horde, and he told me a warrior ought to know what his enemy remembers. I gave him the second volume at cost." } },
      choices = {
        { text = "He spoke well. We learn from what was said of us.", next = "BACK", reply = "So I thought. I've stopped being surprised by orcs, and started stocking for them." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "Thieves with a university. I'll hear no good of them." } },
    forsaken = { { id = "tp_forsaken", text = "A people with endless evenings. If we don't become the best-read nation in the world, it'll be my fault for overcharging." } },
    lordaeron = { { id = "tp_lordaeron", text = "It's all in the atlas. Every lane of it, and not one of them leads anywhere now." } },
    advice = { { id = "tp_advice", text = "Never lend a book you'd grieve for. Sell it, or keep it, and sleep." } },
    sylvanas = { { id = "tp_sylvanas", text = "Her people's libraries burned with Silvermoon. I should think she understands me better than my customers do." } },
    _none = { { id = "tp_none", text = "I've nothing on that subject, and if I had, it would be for sale." } },
  },
}

---------------------------------------------------------------------------
-- Millie Gregorian: sells thread, dye and needles to every tailor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_millie", id = TODO_NPC("Millie Gregorian"), name = "Millie Gregorian", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "chatty", "shrewd" }, values = { "community", "thrift" },
  notices = { "profession", "race" },
  impression = {
    first = "Millie Gregorian sells thread and dye to every tailor in the Magic Quarter, and so she knows what each of them is making and how badly it is going. She tells it cheerfully and keeps her prices firm.",
    third = "{name} met Millie Gregorian, who sells tailoring supplies in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again! Come in, I've just heard what Bowen is stitching, and it's going terribly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, you. Thread's there. The price is the price, and no gossip for you today." },
    { id = "g_1", text = "Hello, love. Thread's on the left, dye's on the right, and the gossip's free with either." },
    { id = "g_2", when = { profession = "Tailoring" }, text = "A tailor! Lovely. Whose student are you, then? No, don't say, I'll have it from your thread in a minute." },
    { id = "g_3", when = { metBefore = true }, text = "Back for more? You go through thread like Victor's beginners, and I mean that kindly." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Tailoring" },
      text = "Coarse thread and a fine needle. You're one of Rhiannon's, or you learned from someone like her. Good plain habits." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "Now there's a head of hair I'd like to match a dye to. What do you call that colour, love? I've nothing on the shelf near it." },
  },

  start = "hello",
  nodes = {
    d2_dear = {
      lines = {
        { id = "d2_dear_1", text = "Spider silk thread from Silverpine, spun so fine that a spool weighs no more than a feather. Josephine Lister buys every bit of it, and I can't keep any by for anyone else, which I mention so you'll know not to ask." },
      },
      choices = {
        { text = "Why does she need so much?", next = "d2_dear2" },
        { text = "You're shrewd about her.", next = "d2_dear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_dear2 = {
      lines = {
        { id = "d2_dear2_1", text = "Shadoweave eats thread, love, because half of what she sews she unpicks again when it doesn't feel right. She's the most wasteful tailor I've ever sold to, and the finest, and the two go together, I suppose." },
      },
      choices = {
        { text = "Good for your business.", next = "BACK", reply = "Very good. I'd never say so to her, mind." },
        { text = "Ask you something else, Millie.", next = "BACK" },
      },
    },
    d2_guard = {
      lines = {
        { id = "d2_guard_1", text = "By the cartload, plain grey wool and coarse black thread, for mending their own kit between patrols. They never ask about colour and never haggle, and I always throw in a needle for nothing, because I know they'll lose the last one." },
      },
      choices = {
        { text = "Generous of you.", next = "d2_guard2" },
        { text = "They must lose a lot of needles.", next = "d2_guard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_guard2 = {
      lines = {
        { id = "d2_guard2_1", text = "Dozens a week. I found one stuck in a deathguard's arm once, and he hadn't noticed it for a fortnight. I took it out and gave it back to him, and told him to keep it in his hat." },
      },
      choices = {
        { text = "A practical answer.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_tauren = {
      lines = {
        { id = "d2_tauren_1", text = "Do they? Oh, you must tell me which plants, love, because everything I've got down here is lichen and the apothecaries' leavings. If I could get a dye that came from sunshine, I'd put it in the window and charge double." },
      },
      choices = {
        { text = "I'll ask our weavers.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Millie Gregorian. Josef's my husband, and he does the clever sewing, and I sell thread to him and to everybody else in the quarter. There's not a seam goes into this city that didn't pass over my counter on a spool." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "Millie Gregorian. You'll want bleach, dye and a good stock of thread, and I've all three. I'll tell you which of the others has been buying the same, if you want to know what's in fashion." },
      },
      again = {
        { id = "hello_a1", text = "Anything else, love?" },
        { id = "hello_a2", text = "Go on, I've all day and no customers but you." },
        { id = "hello_a3", text = "Ask away. I like a chat." },
      },
      choices = {
        { text = "A dye merchant should keep her customers' secrets to herself.", next = "BACK", reply = "Oh, I do. Mostly. The interesting ones I keep for my friends.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the gossip with the thread. It's worth more than dye.", next = "BACK", reply = "Ha! You'd do well here, but I'd watch what you told me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your thread and dyes.", next = "BUSINESS" },
        { text = "You must know every tailor's business.", next = "tailors" },
        { text = "Where do you get dye in a sewer?", next = "dyes" },
        { text = "What's it like being wed to a master tailor?", next = "josef" },
        { text = "What colour would you call troll hair?", next = "hair", when = { race = "Troll" } },
        { text = "What's the dearest thread you sell?", next = "d2_dear" },
        { text = "Do the Deathguard buy from you?", next = "d2_guard" },
        { text = "Our weavers dye with plants of the plains.", next = "d2_tauren", when = { race = "Tauren" } },
        { text = "I'll be off. Thank you, Millie.", next = "END" },
      },
    },
    tailors = {
      lines = { { id = "tailors_1", text = "I know what they buy, and that's as good. Victor Ward takes ten spools of cheap white a week, since his beginners waste nine. Rhiannon buys grey wool by the stone. And Josephine Lister buys black silk thread and pays without a word, as if I'd handed her a relic." } },
      choices = {
        { text = "And which of them is the best?", next = "tailors2" },
        { text = "Lister sounds a difficult customer.", next = "tailors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailors2 = {
      lines = { { id = "tailors2_1", text = "Josephine's the finest, and my Josef's the cleverest, and Rhiannon's the one I'd have make my own coat, because it'd still be a coat in twenty years. Don't tell either of the others I said so. I've to sell to all three of them." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", reply = "Bless you. I do say too much, I know it.", fx = { affinity = 1 } },
        { text = "A shopkeeper should keep her opinions.", next = "BACK", reply = "She should, love, and I never have, and I'm too old and too dead to start." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    dyes = {
      lines = { { id = "dyes_1", text = "Some comes by zeppelin, and it's dear. The rest I make. There's a lichen on the canal walls that gives a fair green, and the rust off the old sluice gates makes a brown you can't shift. For violet I go to the apothecaries and ask no questions." } },
      choices = {
        { text = "No questions about violet?", next = "dyes2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dyes2 = {
      lines = { { id = "dyes2_1", text = "They've a great copper vat of something they throw out on the first of the month, and it dyes silk the loveliest purple you ever saw. It also takes the varnish off my bucket. I wash everything three times and I wear gloves, and nobody's complained yet." } },
      choices = {
        { text = "I think I'll buy the green.", next = "BACK", reply = "Wise, love. The green's only wall." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    josef = {
      big = true,
      lines = { { id = "josef_1", text = "Quiet. He hasn't said twenty words a day since we rose, and he used to sing at his work. But he still cuts a sleeve like nobody else, and he still sets my chair by the lamp each evening. I've had to decide whether that's enough of him. What would you say?" } },
      choices = {
        { text = "What work does he take on?", next = "josefwork" },
        { text = "It's enough. Keep what remains of him.", next = "BACK", reply = "That's what I settled on. It's nice to hear it from outside my own head.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The man you married is gone. Face it squarely.", next = "BACK", reply = "Well. You don't dress things up, do you? I'll thank you not to say it in his hearing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hair = {
      lines = { { id = "hair_1", text = "It isn't blue and it isn't green, it's what a kingfisher is when the light catches it. I've been trying to get it out of lichen and copper salts for a year. Would you stand by the lamp a moment while I hold a few skeins up?" } },
      choices = {
        { text = "Go ahead. Look as long as ya like.", next = "BACK", reply = "Oh, you're a dear. There, the third one's close, with a bit more copper." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    josefwork = {
      lines = { { id = "josefwork_1", text = "He takes the students who've outgrown Rhiannon, and the commissions with any embroidery to them. He did a mantle for one of the Dark Lady's rangers last winter, all in grey on grey, and I've never sold so much grey thread in my life." } },
      choices = {
        { text = "Grey on grey sounds like the Undercity's colours.", next = "BACK", reply = "Doesn't it just? I've put in a standing order." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We keep busy, love. That's the whole trick of it. Busy hands don't sit and think." } },
    advice = { { id = "tp_advice", text = "Buy more thread than you think you need, and I don't only say it because I sell it." } },
    lordaeron = { { id = "tp_lordaeron", text = "We'd a shop on the weavers' row in the capital. I could walk you to the very cellar it fell into." } },
    sylvanas = { { id = "tp_sylvanas", text = "A ranger of hers came to Josef for a mantle, and paid on the nail, and said thank you. You can tell a household from its servants." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They buy red dye by the barrel from somewhere, and it isn't from me. I'd sell them the sort that runs." } },
    _none = { { id = "tp_none", text = "Haven't a notion, love. Ask me about anything you can wind on a spool." } },
  },
}

---------------------------------------------------------------------------
-- Lizbeth Cromwell: sells rods, line and bait by the Magic Quarter canal, beside Armand Cromwell.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lizbeth", id = TODO_NPC("Lizbeth Cromwell"), name = "Lizbeth Cromwell", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "placid", "wry" }, values = { "patience", "family" },
  notices = { "profession", "race" },
  impression = {
    first = "Lizbeth Cromwell sells fishing tackle at the edge of the Magic Quarter canal, beside Armand Cromwell, who teaches the fishing. She is placid and dryly funny and has clear opinions about what should and should not be pulled out of green water.",
    third = "{name} met Lizbeth Cromwell, who sells fishing supplies in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Armand said you'd be back. I've a new lure, and nothing's bitten it yet, which is promising." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Tackle's there. Don't pull anything out of the canal that ought to stay in." },
    { id = "g_1", text = "Afternoon. Mind your feet on the edge there, since the canal's deeper than it looks and a good deal less pleasant." },
    { id = "g_2", when = { profession = "Fishing" }, text = "A fisher. I can always tell, because you looked at the water before you looked at the stall." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. Did you catch anything, or did you only feed them?" },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Fishing" },
      text = "That's a fair rod, but your line's frayed a yard above the hook. It'll part on the first thing with any fight in it." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your folk fish with spears, I'm told, and standing in the water. I shouldn't stand in this water, if I were you." },
  },

  start = "hello",
  nodes = {
    d2_big = {
      lines = {
        { id = "d2_big_1", text = "An eel as long as a deathguard, pulled up by a newly risen girl on her first day with a rod. It took Armand and three bystanders to land it, and it bit one of the bystanders, who didn't feel it, but was very put out about his sleeve." },
      },
      choices = {
        { text = "What happened to the eel?", next = "d2_big2" },
        { text = "Beginner's luck.", next = "d2_big2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_big2 = {
      lines = {
        { id = "d2_big2_1", text = "The apothecaries took it, naturally, and gave the girl a silver, and she's been coming back every day since hoping for another. Armand says she's the best pupil he's had, because she'll wait for ever and she doesn't mind what bites." },
      },
      choices = {
        { text = "A good attitude for the canal.", next = "BACK" },
        { text = "Ask you something else, Lizbeth.", next = "BACK" },
      },
    },
    d2_herself = {
      lines = {
        { id = "d2_herself_1", text = "Not on your life, love. I tried once, in the canal, and pulled up something that looked back at me, so I put it back and went home. I leave the fishing to Armand and keep the selling to myself, and we're both happier for it." },
      },
      choices = {
        { text = "What looked back at you?", next = "d2_herself2" },
        { text = "Sensible.", next = "d2_herself2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_herself2 = {
      lines = {
        { id = "d2_herself2_1", text = "I didn't stay to find out. It had more eyes than a fish ought to and fewer fins, and Armand says it's one of the apothecaries' runaways. He calls it Wilfred and throws it a worm whenever he sees it." },
      },
      choices = {
        { text = "Of course he does.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_cook = {
      lines = {
        { id = "d2_cook_1", text = "Don't, love. Take your fish from the lake shore in Tirisfal or the coast at Brill, and leave the canal ones to the apothecaries. Eunice Burch boiled one once, and her pot's still a funny colour." },
      },
      choices = {
        { text = "Lake fish, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Lizbeth Cromwell. Armand teaches people how to fish, and I sell them what they need to do it, and between us we've got half the Undercity sitting on the canal steps holding a pole." },
        { id = "hello_2", when = { profession = "Fishing" }, text = "Lizbeth Cromwell. I've line, hooks, bobbers and a bucket of nightcrawlers, and a shiny bauble or two for those who think the fish care. Armand says they do. I've my doubts." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? The bait's not going anywhere, more's the pity." },
        { id = "hello_a2", text = "Go on. Nothing's biting anyway." },
        { id = "hello_a3", text = "Ask away." },
      },
      choices = {
        { text = "Throw back anything from the canal that's still twitching oddly.", next = "BACK", reply = "Wise. Some things in there are better left where they are.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If it bites the hook, it's yours to keep, whatever it is.", next = "BACK", reply = "You say that until it bites you back. Then you'll learn.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your tackle.", next = "BUSINESS" },
        { text = "Does anyone truly fish in that canal?", next = "canal" },
        { text = "You and Armand share a trade and a name.", next = "armand" },
        { text = "Why would the dead take up fishing?", next = "why" },
        { text = "We fish the sea, where it's clean.", next = "spear", when = { race = "Troll" } },
        { text = "What's the biggest catch you've seen here?", next = "d2_big" },
        { text = "Do you ever fish yourself?", next = "d2_herself" },
        { text = "How would you cook a canal fish?", next = "d2_cook", when = { profession = "Cooking" } },
        { text = "Good fishing to you, Lizbeth.", next = "END" },
      },
    },
    canal = {
      lines = { { id = "canal_1", text = "Every day. There's things live in it, don't ask me how. Armand's pulled out fish with no eyes and fish with too many. He looks each one over, writes it in his book, and throws it back, and I think that's the right order to do it in." } },
      choices = {
        { text = "Has anyone eaten what comes out?", next = "canal2" },
        { text = "I'd not want that on a plate.", next = "canal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal2 = {
      lines = { { id = "canal2_1", text = "Eunice Burch boiled one for a wager, and the pot's never been the same since. No, love, the eating fish come from the Tirisfal lakes and the coast. The canal's for practice, and for the peace of it, and to see what the apothecaries have been pouring away." } },
      choices = {
        { text = "The peace of it?", next = "canal3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    canal3 = {
      lines = { { id = "canal3_1", text = "You'd be surprised. It's the one spot in the city where nobody's selling or brewing or plotting. A dozen dead folk sat in a row, not talking, watching a bobber on green water. I've seen deathguards come off a week at the Bulwark and sit here six hours, and go away better." } },
      choices = {
        { text = "Everyone needs somewhere to be still.", next = "BACK", reply = "They do. I ought to charge for the step and give the hooks away.", fx = { affinity = 1 } },
        { text = "Six hours staring at slime isn't peace.", next = "BACK", reply = "It's what peace there is, and I'd not sneer at it till you've come off the Bulwark." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    armand = {
      lines = { { id = "armand_1", text = "Brother and sister, before you guess otherwise. He was always the one with the patience and I was the one with the purse. He'd fish through his own funeral, and for all I know he did, since I wasn't awake for it." } },
      choices = {
        { text = "He's a good teacher?", next = "armand2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    armand2 = {
      lines = { { id = "armand2_1", text = "The best, if you can stand silence. He'll sit a pupil down, bait the hook, and say nothing for an hour. Then he'll say \"now,\" and they strike, and there's a fish. He never explains how he knew, and I've stopped asking him." } },
      choices = {
        { text = "Some things can't be explained.", next = "BACK", reply = "So he says, on the days he says anything." },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = { { id = "why_1", text = "For the waiting, I think. We've got more time than anyone ever wanted, and nothing that fills it properly. A rod gives you something to hold while it passes. Some call that making the best of it, and some call it giving up. Which would you say?" } },
      choices = {
        { text = "Making the best of it. Time should be filled.", next = "BACK", reply = "That's my view too. Here, have a bobber on the house. No, I'm joking, they're two coppers.", fx = { align = { order = 1 } } },
        { text = "Giving up. The Forsaken have a war to win.", next = "BACK", reply = "Then go and win it, love, and come and sit here after.", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    spear = {
      lines = { { id = "spear_1", text = "Very sensible. I've heard about your islands, warm water you can see the bottom through. I can't picture it. The clearest water I've got is the rain barrel, and something's moved into that as well." } },
      choices = {
        { text = "Come south one day, and I'll show ya.", next = "BACK", reply = "Me, on a troll beach, in the sun. I'd fall apart in a week, but it'd be a good week." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're patient. It's the one virtue death hands you free." } },
    advice = { { id = "tp_advice", text = "Check your line before every cast. It's always the yard you didn't look at that goes." } },
    lordaeron = { { id = "tp_lordaeron", text = "We'd a cottage on Lordamere. I can't go and look at the lake now. It's the same lake, which is the trouble." } },
    sylvanas = { { id = "tp_sylvanas", text = "I doubt she fishes. Rangers hunt, and it's another temper altogether." } },
    plague = { { id = "tp_plague", text = "Whatever they tip into the canal, the fish get it first. I watch the fish, and I draw my own conclusions." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask Armand, and bring a chair while you wait for the answer." } },
  },
}

---------------------------------------------------------------------------
-- Charles Seaton: sells blades by the Rogues' Quarter canal, to cut-throats and craftsmen alike.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_seaton", id = TODO_NPC("Charles Seaton"), name = "Charles Seaton", title = "Blade Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "smooth", "discreet" }, values = { "profit", "discretion" },
  notices = { "class", "purse" },
  impression = {
    first = "Charles Seaton sells blades along the Rogues' Quarter canal, and he is equally pleasant to assassins and to the skinner next door. He never asks what a knife is for and makes a small show of never asking.",
    third = "{name} met Charles Seaton, the blade merchant of the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a friend. I've a new edge here, and I shan't ask what it's for, as usual." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. A knife's a knife, and I'll sell you one, but I'll keep the counter between us." },
    { id = "g_1", text = "Good evening. Do feel free to handle the stock, since a blade ought to be met before it's bought." },
    { id = "g_2", when = { class = "ROGUE" }, text = "Ah, a professional. I'll bring out the second tray, then, which I don't show to the browsers." },
    { id = "g_3", when = { metBefore = true }, text = "Welcome back. I trust the last purchase gave satisfaction, and I shan't ask to whom." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "You wear your main blade low on the right and something smaller at the small of your back. Sensible. I could improve on the smaller one." },
    { id = "n_2", cat = "purse", when = { money = { min = 500000 } },
      text = "You've the comfortable look of a customer who needn't choose between the pair. I do so enjoy selling pairs." },
  },

  start = "hello",
  nodes = {
    d2_customers = {
      lines = {
        { id = "d2_customers_1", text = "Mennet Carkad's deathstalkers, who buy in the dark and pay in coin that's still warm. Then the skinners and the leatherworkers, who need an honest edge, and then a few people whose business I make a point of not knowing." },
      },
      choices = {
        { text = "Do the deathstalkers trust you?", next = "d2_customers2" },
        { text = "Carkad's people must pay well.", next = "d2_customers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_customers2 = {
      lines = {
        { id = "d2_customers2_1", text = "As far as they trust anyone, which is to say they check every blade against the light before they leave the stall. I've never once been offended, because a man who doesn't check his blade doesn't stay a customer for long." },
      },
      choices = {
        { text = "Wise of them.", next = "BACK" },
        { text = "Ask you something else, Mr. Seaton.", next = "BACK" },
      },
    },
    d2_quarter = {
      lines = {
        { id = "d2_quarter_1", text = "It is, and that's why I keep my stall here. The Rogues' Quarter has the best quiet in the city, because everyone in it is listening, and nobody wants to be the one making a noise." },
      },
      choices = {
        { text = "Do you listen, too?", next = "d2_quarter2" },
        { text = "A strange sort of peace.", next = "d2_quarter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_quarter2 = {
      lines = {
        { id = "d2_quarter2_1", text = "Constantly, and I forget everything I hear by the end of the day, or I say I do, which in this quarter amounts to the same. A seller of knives with a long memory would be a short-lived seller of knives." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "No, you won't. That's rather the point." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_offhand = {
      lines = {
        { id = "d2_offhand_1", text = "Then a short sword, not a dagger, for a warrior's off hand wants weight to parry with. The plain ones on the first tray are James Van Brunt's, and I'd trust any of them to turn a Scarlet's blade." },
      },
      choices = {
        { text = "Let me see the first tray.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Charles Seaton, purveyor of edges. Daggers, short swords, the occasional stiletto for the customer with a narrow sort of problem. I sell to anyone the Dark Lady hasn't told me not to, and I never ask what it's for." },
        { id = "hello_2", when = { class = "ROGUE" }, text = "Charles Seaton. You'll want balance over weight and a dull finish over a bright one, and I've both in the second tray. Mennet Carkad's people buy from that tray, though of course I couldn't confirm it." },
      },
      again = {
        { id = "hello_a1", text = "Anything further I can show you?" },
        { id = "hello_a2", text = "Do go on. Discretion costs nothing extra." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "A blade merchant should sell only to folk he'd trust.", next = "BACK", reply = "I trust everyone who pays. It's a very pleasant way to live.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell knives to anyone. What they cut is their business.", next = "BACK", reply = "That's my motto, more or less. I keep it quiet, of course.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "You never ask what a blade is for?", next = "ask" },
        { text = "Where does your steel come from?", next = "steel" },
        { text = "Killian Hagey buys his skinning knives from you.", next = "hagey", when = { heardLine = "uc_hagey.k2_default" } },
        { text = "What's on the second tray?", next = "tray", when = { class = "ROGUE" } },
        { text = "Who are your best customers?", next = "d2_customers" },
        { text = "This stretch of the canal is very quiet.", next = "d2_quarter" },
        { text = "I want a dagger for my off hand.", next = "d2_offhand", when = { class = "WARRIOR" } },
        { text = "Good evening, Mr. Seaton.", next = "END" },
      },
    },
    ask = {
      lines = { { id = "ask_1", text = "Never. A man who sells rope doesn't ask if you mean to hang washing. If I knew, I'd be obliged to have a view, and a merchant with views loses half his customers, and in this quarter possibly more than his customers." } },
      choices = {
        { text = "That's a convenient sort of innocence.", next = "ask2" },
        { text = "Surely you guess, though.", next = "ask2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask2 = {
      big = true,
      lines = { { id = "ask2_1", text = "I guess constantly. It's my chief entertainment. A stiletto sold on a Monday, a funeral in the Trade Quarter on the Thursday. I simply don't say it aloud. I gather you think a seller ought to answer for his goods?" } },
      choices = {
        { text = "He should. You know what you're arming.", next = "BACK", reply = "A defensible position, and an expensive one. I admire it from over here.", fx = { align = { honor = 1 } } },
        { text = "No. The hand that strikes owns the deed.", next = "BACK", reply = "Just so. I only supply the punctuation.", fx = { align = { honor = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    steel = {
      lines = { { id = "steel_1", text = "The plain stock is from James Van Brunt's forge in the War Quarter, and it's honest work. The better pieces I buy in, from adventurers and from estates. A great many fine blades lost their owners in the war, and they come to me still in the scabbard." } },
      choices = {
        { text = "Dead men's daggers.", next = "steel2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    steel2 = {
      lines = { { id = "steel2_1", text = "In this city, that describes the customers as well as the stock. I clean them, I hone them, and I don't pass on their histories. One or two have names engraved. I leave the names, since it seems the least a blade is owed." } },
      choices = {
        { text = "That's a decent custom.", next = "BACK", reply = "I have one or two. I keep them where they won't hurt trade.", fx = { affinity = 1 } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    hagey = {
      lines = { { id = "hagey_1", text = "He does, and he asked me to keep his on a separate shelf from the ones I sell to assassins. I told him steel doesn't know the difference. He said he does. So there's a shelf with his name on it, and nobody else has ever asked for one." } },
      choices = {
        { text = "He's a particular man.", next = "BACK", reply = "He's an honest one, in a quarter where that's the rarer vice." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tray = {
      lines = { { id = "tray_1", text = "Blackened steel, no cross-guard to snag on a cloak, and a grip wound in cord, which stays dry in the hand as leather doesn't. There's one with a channel along the flat, for whatever Ezekiel Graves has sold you. I'd point out that it works without it, too." } },
      choices = {
        { text = "Do rogues from the other cities buy here?", next = "tray2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    tray2 = {
      lines = { { id = "tray2_1", text = "Orgrimmar's people come through now and then. They've good steel of their own, but it's all made to be seen. An orc wants his enemy to admire the knife. My customers would prefer the enemy never learned there'd been one." } },
      choices = {
        { text = "The unseen blade is the one that lands.", next = "BACK", reply = "You've read my shop sign, or you would have, if I'd been fool enough to hang one." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deathstalkers = { { id = "tp_deathstalkers", text = "I've heard of them, naturally. I couldn't tell you a thing about what they buy." } },
    forsaken = { { id = "tp_forsaken", text = "We are a people who've already been stabbed in the back once. It breeds a certain interest in the tools." } },
    advice = { { id = "tp_advice", text = "Buy the blade that fits your hand, and never the one that fits your pride. They are very rarely the same blade." } },
    syndicate = { { id = "tp_syndicate", text = "They overpay, they boast, and they dress their daggers with jewels. I'd sell to them gladly, if it were permitted." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady favours the bow. A pity, from where I stand, but I can't fault her results." } },
    _none = { { id = "tp_none", text = "I couldn't say, and you'll find I'm rather good at not saying." } },
  },
}

---------------------------------------------------------------------------
-- Nathaniel Steenwick: sells throwing knives and axes in the Rogues' Quarter; keeps a scarred target board.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_steenwick", id = TODO_NPC("Nathaniel Steenwick"), name = "Nathaniel Steenwick", title = "Thrown Weapons Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "jovial", "competitive" }, values = { "skill", "sport" },
  notices = { "class", "race" },
  impression = {
    first = "Nathaniel Steenwick sells throwing knives and axes in the Rogues' Quarter and keeps a target board hacked almost through beside his stall. He is cheerful for a dead man and will back his own aim against anyone's.",
    third = "{name} met Nathaniel Steenwick, the thrown weapons merchant of the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again! Care to throw against me? I'll give you two throws' head start, since I like you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Stand clear of the target board. I don't miss, but I'm in the mood to." },
    { id = "g_1", text = "Step up, step up, and stand to one side of the board, friend, because I miss about once a year and I'm overdue." },
    { id = "g_2", when = { class = { "ROGUE", "WARRIOR" } }, text = "Now there's an arm that's thrown something in anger. Knives or axes? No, let me guess from the shoulder." },
    { id = "g_3", when = { metBefore = true }, text = "You're back! Good. I've had nobody to show off to since you left." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll tell me a bow's better, and I'll tell you a knife doesn't need stringing, and we'll neither of us shift." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "A troll! Your people throw an axe better than anyone living or dead, and I'd give a week's takings to learn that wrist of yours." },
  },

  start = "hello",
  nodes = {
    d2_wager = {
      lines = {
        { id = "d2_wager_1", text = "Always, though I'll warn you I've not lost a wager on that board since the Dark Lady took the city. Ten paces, three knives, and the closest to the centre takes a copper off the other, which is all I'll risk against a stranger." },
      },
      choices = {
        { text = "Has anyone ever beaten you?", next = "d2_wager2" },
        { text = "Just a copper? You're cautious.", next = "d2_wager2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_wager2 = {
      lines = {
        { id = "d2_wager2_1", text = "Carolyn Ward, once, with her eyes shut, which I've chosen to believe was luck. She's never let me forget it, and she's never once agreed to throw again, which is how I know it was luck." },
      },
      choices = {
        { text = "Or she's wiser than you.", next = "BACK", reply = "That's what she says. I've no answer to it, which is very annoying." },
        { text = "Ask you something else, Nathaniel.", next = "BACK" },
      },
    },
    d2_supply = {
      lines = {
        { id = "d2_supply_1", text = "James Van Brunt makes the axes, and I balance them myself, since he puts the weight where an axe in the hand wants it and not where an axe in the air does. The knives come from a goblin in Orgrimmar who never sends two alike." },
      },
      choices = {
        { text = "Is that a problem?", next = "d2_supply2" },
        { text = "You trust a goblin for knives?", next = "d2_supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_supply2 = {
      lines = {
        { id = "d2_supply2_1", text = "It's a challenge, and I enjoy it. I sort them by weight on the bench and sell them in matched sets of six, and nobody else in the city bothers, which is why the rogues come to me." },
      },
      choices = {
        { text = "Clever work.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_rusty = {
      lines = {
        { id = "d2_rusty_1", text = "Then throw a hundred a day until it isn't, which is all I do. Start at five paces and step back one every time you hit the centre three times running, and don't step back until you have." },
      },
      choices = {
        { text = "A hundred a day. Right.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Nathaniel Steenwick. I sell things that are meant to leave the hand: knives, axes, and a weighted dart or two. Everything on this stall flies true, and that board there has the scars to prove it." },
        { id = "hello_2", when = { metBefore = true }, text = "Nathaniel Steenwick, still at it. The board's a little thinner than when you saw it last, and I'll have to ask Arthur Moore for a new backing soon." },
      },
      again = {
        { id = "hello_a1", text = "What else, friend?" },
        { id = "hello_a2", text = "Go on, I can talk and throw." },
        { id = "hello_a3", text = "Ask away. Watch this one first, though." },
      },
      choices = {
        { text = "Win at the target board fairly, or don't bother winning.", next = "BACK", reply = "That's the only way I'd care to. A cheated win doesn't count.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Distract your rival before the throw. It's all part of it.", next = "BACK", reply = "Try it on me and see where the axe lands.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "That board has seen hard use.", next = "board" },
        { text = "What makes a good throwing knife?", next = "craft" },
        { text = "Who's the best throw in the city?", next = "rivals" },
        { text = "It's all in letting go late, mon.", next = "wrist", when = { race = "Troll" } },
        { text = "Fancy a wager on a throw?", next = "d2_wager" },
        { text = "Who supplies your blades?", next = "d2_supply" },
        { text = "My throwing arm's gone rusty.", next = "d2_rusty", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Keep your aim true, Nathaniel.", next = "END" },
      },
    },
    board = {
      lines = { { id = "board_1", text = "Third one this year. I throw between customers, a hundred or so a day, to keep the arm honest. A dead arm doesn't tire, you see, but it forgets, and you must remind it. The knot at the middle there fell out in the spring, so now I aim for the hole." } },
      choices = {
        { text = "Why did you take it up?", next = "board2" },
        { text = "A hundred a day is a soldier's drill.", next = "board2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board2 = {
      lines = { { id = "board2_1", text = "I was a fairground man, before. Knives round a girl on a wheel, twice a day and three times on market days. Never touched her in eleven years. She married a cooper. I think of the wheel sometimes when I throw, and I don't miss then, either." } },
      choices = {
        { text = "Eleven years is a fine record.", next = "BACK", reply = "It's the one thing I did perfectly, and I did it for pennies.", fx = { affinity = 1 } },
        { text = "A fairground trick isn't a battlefield skill.", next = "BACK", reply = "A man's throat is a good deal bigger than the gap beside a girl's ear, friend." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    craft = {
      lines = { { id = "craft_1", text = "Balance, and nothing else. I'll sell you a pretty one or a plain one, and if the weight sits right at the guard, either will fly. Hold it flat across one finger. If it tips, hand it back to whoever sold it you, point first if you like." } },
      choices = {
        { text = "And a throwing axe?", next = "craft2" },
        { text = "Who buys from you, mostly?", next = "buyers" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_1", text = "The rogues take the flat knives, a dozen at a time, and the deathguards take axes for the Bulwark, since an axe will stop a ghoul where an arrow only annoys it. And once a month Mirelle Tremayne's lad buys one dart, just the one, and I've never learned what for." } },
      choices = {
        { text = "One dart a month is a mystery worth solving.", next = "BACK", reply = "I've a wager with Ezekiel Graves about it. He says rats, and I say a sweetheart." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    craft2 = {
      lines = { { id = "craft2_1", text = "An axe wants to turn, so you let it. One full turn at five paces, two at ten, and you step forward or back to make the count come right. Folk try to force it with the wrist and it lands on the handle, and then they blame the axe." } },
      choices = {
        { text = "I'll count the turns.", next = "BACK", reply = "Do, and bring it back and show me. I like to see my stock used well." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      big = true,
      lines = { { id = "rivals_1", text = "Me, and I say so in front of anyone. Miles Dexter is quicker on the draw and Carolyn Ward's deadlier up close, but over twenty paces, at a mark the size of a coin, it's Steenwick. A man ought to know what he's best at and say so. Don't you think?" } },
      choices = {
        { text = "Aye. False modesty is only another lie.", next = "BACK", reply = "There! Shake my hand. Gently, the thumb's on loose.", fx = { align = { honor = 1 } } },
        { text = "A wise man hides his best skill.", next = "BACK", reply = "That's rogues' talk, and you may be right, but I never could keep a secret I was proud of.", fx = { align = { honor = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    wrist = {
      lines = { { id = "wrist_1", text = "Late! I've been letting go early all my life and all my death. Show me. No, slower. Ah, the fingers trail. That's the whole business, isn't it, the fingers trail. I'll be at that board till morning." } },
      choices = {
        { text = "Ya got it. Now do it a thousand times.", next = "BACK", reply = "A thousand's ten days' work. I'll have it by the new moon." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We don't flinch any more, and flinching ruined more throws than bad knives ever did. There's that to be said for it." } },
    advice = { { id = "tp_advice", text = "Never throw your last knife. A thrown knife's a gift to the other fellow if you miss." } },
    lordaeron = { { id = "tp_lordaeron", text = "I worked every fair from Stratholme to Southshore. Good crowds. I wonder who's left that remembers the wheel." } },
    deathstalkers = { { id = "tp_deathstalkers", text = "They buy the small flat ones by the dozen and never the axes. I don't ask." } },
    sylvanas = { { id = "tp_sylvanas", text = "Now there's an aim. I'd not put my knives against the Dark Lady's bow for all the copper in the bank." } },
    _none = { { id = "tp_none", text = "No notion, friend. If you can't throw it, I've not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Elizabeth Van Talen: sells engineering parts in the Rogues' Quarter beside the trainers; keeps Graham's accounts.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_evantalen", id = TODO_NPC("Elizabeth Van Talen"), name = "Elizabeth Van Talen", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "exasperated", "capable" }, values = { "order", "family" },
  notices = { "profession", "race" },
  impression = {
    first = "Elizabeth Van Talen sells bolts, powder and tools to the Undercity's engineers, and she keeps a bucket of sand within reach at all times. She speaks of the trainers beside her like a woman minding large children with fuses.",
    third = "{name} met Elizabeth Van Talen, who sells engineering supplies in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you. Good. Hold this bucket of sand while I find you some decent powder." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep away from the powder, and keep away from Graham. He's having a day." },
    { id = "g_1", text = "Good day. If you hear a whistling noise, step behind the pillar, and don't stop to ask me why." },
    { id = "g_2", when = { profession = "Engineering" }, text = "An engineer. Wonderful, another one. Show me your hands. All ten, good, so you've been careful or lucky." },
    { id = "g_3", when = { metBefore = true }, text = "You're back, and nothing's on fire, so it's a good day so far." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Engineering" },
      text = "There's blasting powder leaking from your left pocket. No, don't pat it. Walk over to the sand bucket, slowly." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people's engineers build big, loud and sturdy, and I approve of two of those." },
  },

  start = "hello",
  nodes = {
    d2_worst = {
      lines = {
        { id = "d2_worst_1", text = "A clockwork bat, to carry messages, which flew perfectly until it saw a real bat and tried to court it. It's somewhere in the rafters over the Trade Quarter still, ticking, and Michael Garrett's bats won't roost near it." },
      },
      choices = {
        { text = "Can't anyone get it down?", next = "d2_worst2" },
        { text = "A lovesick clockwork bat.", next = "d2_worst2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_worst2 = {
      lines = {
        { id = "d2_worst2_1", text = "Graham won't let anyone try, because he says it'll come down when it's ready, as if it were a cat. I've sent him a bill for every bat Garrett's lost because of it, and he's paid every one with a smile." },
      },
      choices = {
        { text = "He sounds happy.", next = "BACK", reply = "He is. That's the most exasperating part of all." },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
    d2_lloyd = {
      lines = {
        { id = "d2_lloyd_1", text = "The cleverer one, as I said, who builds the deathguards' bombs and keeps his fingers by counting them twice a day. He's careful and sensible and very dull, and I like him enormously, because nothing he makes has ever tried to court anything." },
      },
      choices = {
        { text = "What does he think of Graham?", next = "d2_lloyd2" },
        { text = "Dull is good, with explosives.", next = "d2_lloyd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_lloyd2 = {
      lines = {
        { id = "d2_lloyd2_1", text = "He thinks Graham's a genius who should never be left alone with a fuse, and he's right on both counts. They argue all day about recoil, and then they go off together to test something, and I stand by with my bucket of sand." },
      },
      choices = {
        { text = "Keep the bucket full.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_bulk = {
      lines = {
        { id = "d2_bulk_1", text = "Then buy it now, because I'll be out by the end of the week, and if I am you'll have to go to Daniel Bartlett, who'll have three crates of it and a long face about selling it. Keep it dry, and keep it well away from Graham." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Elizabeth Van Talen. Graham teaches the engineering and Franklin Lloyd teaches the cleverer sort, and I sell them and their students every bolt, tube and pinch of powder. I also keep the sand bucket full, which nobody thanks me for." },
        { id = "hello_2", when = { profession = "Engineering" }, text = "Elizabeth Van Talen. I've handfuls of bolts, copper tube, flint, powder and the plain tools. Buy what you need from me and learn what to do with it from Graham, and do it a good way off from my stall." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? I'm listening for whistles." },
        { id = "hello_a2", text = "Go on. It's quiet, and that never lasts." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An engineer's supplier should warn buyers about unstable stock.", next = "BACK", reply = "I warn everyone. They never listen, which is why the sand bucket's here.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the unstable powder cheap. Let the buyer find out.", next = "BACK", reply = "They find out quickly, and then they find out the canal's wet.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your parts.", next = "BUSINESS" },
        { text = "You're kin to Graham Van Talen?", next = "graham" },
        { text = "How often does something explode?", next = "blasts" },
        { text = "What do Forsaken engineers build?", next = "trade" },
        { text = "Which of the three don't you approve of?", next = "orc", when = { race = "Orc" } },
        { text = "What's the worst thing Graham's ever built?", next = "d2_worst" },
        { text = "Tell me about Franklin Lloyd.", next = "d2_lloyd" },
        { text = "I'll need blasting powder in bulk.", next = "d2_bulk", when = { profession = "Engineering" } },
        { text = "I'll go before something whistles.", next = "END" },
      },
    },
    graham = {
      lines = { { id = "graham_1", text = "His wife, for my sins, in life and after. He was a clockmaker, a quiet careful man with a loupe in his eye. Then he rose, and found he couldn't feel a burn, and decided clocks were dull. I married a clockmaker and I'm buried with a bombardier." } },
      choices = {
        { text = "Do you miss the clockmaker?", next = "graham2" },
        { text = "He sounds happier for it.", next = "graham2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graham2 = {
      big = true,
      lines = { { id = "graham2_1", text = "He is happier, that's the vexing part. He laughs now. He never laughed over a clock. I can't decide whether I've lost my husband or met him properly for the first time. You've a face that's seen a few things. Which would you call it?" } },
      choices = {
        { text = "You've met him properly. Be glad of it.", next = "BACK", reply = "I think so too, on the days he hasn't blown a hole in the ceiling.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "You've lost him. Rein him in while you can.", next = "BACK", reply = "I've tried, with a ledger and a sand bucket. He's very hard to rein.", fx = { align = { order = 1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    blasts = {
      lines = { { id = "blasts_1", text = "Twice a week, in a quiet week. Mostly small. Franklin Lloyd is careful, I'll give him that, and it's Graham's beginners who do the damage. I've marked a line on the floor in chalk, and nobody lights a fuse on my side of it." } },
      choices = {
        { text = "Does the chalk line hold?", next = "blasts2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    blasts2 = {
      lines = { { id = "blasts2_1", text = "It held until a student's mechanical squirrel ran across it carrying something lit. I've added a second line since, and a broom. The rogues along the canal complained about the noise once, and I told them to complain to the squirrel." } },
      choices = {
        { text = "And did they?", next = "BACK", reply = "One of them stabbed it, yes. Graham's still upset." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "trade_1", text = "Bombs for the deathguards, mostly, and pumps, because this whole city would be under green water in a month without them. The pumps are the real work. Nobody visits a pump, though, and they all come to watch a bomb." } },
      choices = {
        { text = "Who keeps the pumps running?", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = { { id = "trade2_1", text = "I do, if we're honest, with a spanner, on the first of every month, while the two geniuses argue about recoil. There are eleven of them under the canals, older than the plague. Dwarf-built, I think. I've never had one fail, and I talk to them nicely." } },
      choices = {
        { text = "The city owes you more than it knows.", next = "BACK", reply = "It does. I'd settle for someone else filling the sand bucket." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_1", text = "The loud. I've been to the engineers' yard in Orgrimmar, and you couldn't hear a fuse hiss in there if you sat on it. A workshop ought to be quiet enough to hear something going wrong, and I say the same to Graham." } },
      choices = {
        { text = "The noise tells us the work is going well.", next = "BACK", reply = "It tells you it's going. Well is another question, and I'd want to hear the answer." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We can't feel burns, so we take risks the living wouldn't. I count fingers at the end of every day, mine and theirs." } },
    advice = { { id = "tp_advice", text = "Keep sand closer than water. Water only spreads an oil fire, and I've seen that lesson learned the hard way." } },
    lordaeron = { { id = "tp_lordaeron", text = "Our clock shop faced the fountain in the capital. I'd hear forty clocks strike noon together. I'd like to hear that once more." } },
    gnomes = { { id = "tp_gnomes", text = "Brilliant, and mad, and I hear their whole city went up in its own fumes. I've used that as a lesson more than once." } },
    sylvanas = { { id = "tp_sylvanas", text = "She's never visited the workshop. I think she's got more sense." } },
    _none = { { id = "tp_none", text = "I don't know, and I've learned not to guess about things that might be flammable." } },
  },
}

