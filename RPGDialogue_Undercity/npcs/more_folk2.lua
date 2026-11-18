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
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "How do you teach the craft?", next = "method" },
        { text = "That's a large scorch mark behind you.", next = "scorch" },
        { text = "What do you make of Doctor Halsey?", next = "halsey" },
        { text = "What's the best thing you make that burns?", next = "burn", when = { class = "WARLOCK" } },
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
      lines = { { id = "scorch_1", text = "Is there? Oh, that one. That was a fire oil that wanted more patience than I had on the day, and I maintain the recipe was sound and the flask was at fault. Algernon sold me the flask, and he has never apologised for it." } },
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
        { text = "I can wait for a steady hand.", next = "BACK", reply = "A patient warlock. Now I truly have seen everything this city has to show." },
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
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What does a beginner learn first?", next = "craft" },
        { text = "You speak highly of Lavinia Crowe.", next = "crowe" },
        { text = "Where do your materials come from?", next = "webb" },
        { text = "Why would a mage take to it faster?", next = "mage", when = { class = "MAGE" } },
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
        { text = "Teach me the shadoweave.", next = "BUSINESS" },
        { text = "What is shadoweave, truly?", next = "weave" },
        { text = "You've set your loom very near the temple.", next = "temple" },
        { text = "How do the quarter's other tailors rate?", next = "tailors" },
        { text = "Does the Shadow guide your needle?", next = "priest", when = { class = "PRIEST" } },
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
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "What do you sew, mostly?", next = "work" },
        { text = "It seems there's a ladder of tailors here.", next = "guild" },
        { text = "Where does the cloth come from?", next = "cloth" },
        { text = "How do you fit a tauren?", next = "tauren", when = { race = "Tauren" } },
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
        { text = "Teach me the forge.", next = "BUSINESS" },
        { text = "How do you start a beginner off?", next = "teach" },
        { text = "That's a strange place for a forge.", next = "forge" },
        { text = "Who else works this smithy?", next = "brothers" },
        { text = "What's wrong with a roadside edge?", next = "edge", when = { class = "WARRIOR" } },
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

