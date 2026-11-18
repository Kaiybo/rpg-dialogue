-- Darnassus, folk the roster scan found missing (2 of 3): the Craftsmen's Terrace. Apprentices and
-- teachers of the crafts, the supply sellers beside them, and the tabard designer. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ellaercia: designs guild tabards on the Craftsmen's Terrace.
P:NPC {
  key = "dar_ellaercia", id = TODO_NPC("Ellaercia"), name = "Ellaercia", title = "Tabard Designer", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "artistic", "particular" }, values = { "beauty", "meaning" },
  notices = { "race" },
  impression = {
    first = "Ellaercia designs the tabards that guilds wear into battle, and she has ink on her fingers and firm opinions about colour. She will not be hurried into an emblem she thinks unworthy.",
    third = "{name} met Ellaercia, the tabard designer of the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you have come about a tabard, tell me first what your company stands for, and the colours will follow." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Have your companions agreed on an emblem yet, or are they still quarrelling?" },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Your people do love a lion on a blue field. I will draw you one if you insist, but I would be glad to try something else for once." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf will ask me for a hammer, an anvil or a tankard. I have drawn all three many times, and I confess the tankard is the hardest to make look noble." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Ellaercia, and I design tabards for the guilds that Lysheana charters. A band of strangers comes to me with a name, and I try to send them away with a sign that says what they are." } },
      again = {
        { id = "h_again", text = "What else would you ask me?" },
        { id = "h_again2", text = "Go on, I can sketch while you speak." },
      },
      choices = {
        { text = "I'd like to see about a tabard.", next = "BUSINESS" },
        { text = "How do you choose an emblem?", next = "emblem" },
        { text = "A tabard is only a bit of cloth.", next = "cloth" },
        { text = "Elune guide your hand.", next = "END" },
      },
    },
    emblem = {
      lines = { { id = "e_default", text = "I ask what they would still be if they lost everything else. Hunters say a beast, soldiers say a blade, and the honest ones take a long while to answer, which is how I know they are worth drawing for." } },
      choices = {
        { text = "And the dishonest ones?", next = "dishonest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dishonest = {
      lines = { { id = "d_default", text = "They want a skull, or a flame, or whatever will frighten the most people at the greatest distance. I draw it for them, since it is their coin and their name, but I keep it simple and I do not sign it." } },
      choices = { { text = "No skulls for me, then. Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "So is a banner, and people have died in great numbers for those. When the fighting is thick and the smoke is in your eyes, the colour on a friend's chest may be all that tells you where to stand." } },
      choices = { { text = "Put that way, it matters. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I painted for the Temple once. Now I paint for companies of adventurers, who argue a great deal more." } },
    _none = { { id = "tp_none", text = "I have no picture of that in my mind at all. Ask someone else, friend." } },
  },
}

-- Elynna: tailoring supplies.
P:NPC {
  key = "dar_elynna", id = TODO_NPC("Elynna"), name = "Elynna", title = "Tailoring Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "kindly", "talkative" }, values = { "craft", "community" },
  notices = { "craft" },
  impression = {
    first = "Elynna sells thread, dye and patterns to the tailors of the Craftsmen's Terrace, and she knows what every one of them is working on. She winds a spool while she talks and never tangles it.",
    third = "{name} met Elynna, who sells tailoring supplies on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, dear. Is it thread you need, or dye, or only somebody to tell you which is which?" },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? You must have run out of thread, as everybody does in the middle of a seam." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You have a tailor's pricked fingers, I see. Come and look at the new dyes, because the blue will not last the week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Elynna. I keep the tailors of this terrace in thread and dye, and since Me'lynn and young Trianna go through both like a river in spring, I am never idle." } },
      again = {
        { id = "h_again", text = "What else can I tell you, dear?" },
        { id = "h_again2", text = "Go on, I am only winding thread." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Tell me about the tailors here.", next = "tailors" },
        { text = "Where do your dyes come from?", next = "dyes" },
        { text = "Good day, Elynna.", next = "END" },
      },
    },
    tailors = {
      lines = { { id = "t_default", text = "Me'lynn is the teacher, and there is not a seam in Darnassus she could not improve by looking at it. Trianna is her apprentice, quick and eager, and of late she has had a stream of adventurers at her elbow asking how to sew a tent." } },
      choices = {
        { text = "Why tents, of all things?", next = "tents" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tents = {
      lines = { { id = "te_default", text = "Because they sleep on the ground out in the wilds, the poor things, and somebody has told them a tailor can make that more bearable. Trianna is very patient with them, and I sell them the canvas thread afterwards." } },
      choices = { { text = "I may be one of them. Something else.", next = "BACK" } },
    },
    dyes = {
      lines = {
        { id = "d_herb", when = { profession = "Herbalism" }, text = "From the same plants you gather, dear, though we want the roots and the bark where the alchemists want the flowers. If you ever have more than Ulthir will take, bring the rest to me." },
        { id = "d_default", text = "From roots and berries and the bark of trees that have already fallen. The red and the black come by ship from the dwarves, because nothing that grows on Teldrassil will give me either." },
      },
      choices = { { text = "I never thought to ask before. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold thread on this terrace since it was built, and I have seen a great many first seams." } },
    _none = { { id = "tp_none", text = "Oh, I would not know, dear. Ask Me'lynn, who hears everything I miss." } },
  },
}

-- Faldron: apprentice leatherworker; teaches the beginners with Telonis; Darianna's patient teacher.
P:NPC {
  key = "dar_faldron", id = TODO_NPC("Faldron"), name = "Faldron", title = "Apprentice Leatherworker", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "patient", "dry" }, values = { "craft", "teaching" },
  notices = { "craft" },
  impression = {
    first = "Faldron teaches the first steps of leatherworking on the Craftsmen's Terrace, and he has the long patience of someone who has watched a great many crooked stitches. He sighs before he corrects anything, and then corrects it kindly.",
    third = "{name} met Faldron, who teaches leatherworking on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If you have come to learn leather, sit down, and expect to pull out your first seam at least twice." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, which means that either the last lesson held or it came apart. Show me which." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "That is your own work on your belt, is it not? The stitching is even enough, though you are pulling the thread too tight at the corners." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Faldron. They still call me an apprentice, and I do not mind it, because Telonis is the master here and I have only been at this a few hundred years. Between us we teach the beginners, Darianna among them." } },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on. I have learned to listen and stitch at once." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "How is Darianna coming along?", next = "darianna" },
        { text = "What's the hardest thing to teach?", next = "hardest" },
        { text = "Steady hands, Faldron.", next = "END" },
      },
    },
    darianna = {
      lines = { { id = "d_default", text = "She has more energy than any three students and has not yet learned where to put it. Her stitches wander like a cub on its first hunt, but she watches everything, and those who watch do learn in the end." } },
      choices = {
        { text = "She speaks very highly of you.", next = "highly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    highly = {
      lines = { { id = "hi_default", text = "She speaks highly of everything, including the weather and my lunch. Still, I am glad to hear it, and I would be obliged if you did not tell her that I said so, because she would never sit still again." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hardest = {
      lines = {
        { id = "ha_skin", when = { profession = "Skinning" }, text = "Respect for the hide, and you who skin your own will understand me. Every flaw in the leather began with a careless knife, and no stitching of mine can put right what was torn in the taking." },
        { id = "ha_default", text = "Waiting is the hardest. Leather must be cured slowly and dried slowly, and the young always want a finished jerkin by nightfall, so that half my teaching is telling them to leave the thing alone." },
      },
      choices = { { text = "Patience, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I work leather under Telonis on the Craftsmen's Terrace, and I teach those who are newer to it than I am." } },
    _none = { { id = "tp_none", text = "I could not tell you. Telonis might know, and he will certainly have an opinion." } },
  },
}

-- Lalina Summermoon: apprentice enchanter; teaches the first lessons under Taladan.
P:NPC {
  key = "dar_lalina", id = TODO_NPC("Lalina Summermoon"), name = "Lalina Summermoon", title = "Apprentice Enchanter", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "earnest", "careful" }, values = { "learning", "caution" },
  notices = { "craft", "class" },
  impression = {
    first = "Lalina Summermoon is Taladan's apprentice in enchanting and teaches those who are newer than she is. She handles each glowing shard as though it might take offence.",
    third = "{name} met Lalina Summermoon, an apprentice enchanter on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you wish to learn enchanting, I can show you the beginnings, and Taladan will take you further when you are ready." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Did the last enchantment hold, or did it fade? You may tell me honestly." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There is a little dust on your sleeve, the kind that glows. You have been unmaking things, and I hope they were things you could spare." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You are a mage, and so you will find this easier than I did. I would ask you to be gentle with it all the same, while you stand under these boughs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lalina Summermoon. I study enchanting under Taladan, and I teach the first lessons so that he may give his attention to the difficult ones." } },
      again = {
        { id = "h_again", text = "Is there anything else you wish to ask?" },
        { id = "h_again2", text = "Yes? I will answer if I can." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "Is enchanting not a kind of sorcery?", next = "sorcery" },
        { text = "What is Taladan like as a teacher?", next = "taladan" },
        { text = "Elune light your studies.", next = "END" },
      },
    },
    sorcery = {
      lines = { { id = "s_default", text = "It is a fair question, and I asked it myself before I began. We take the power that already rests within a made thing and move it into another, and we call on nothing from outside the world, which is where my people's old mistakes were made.", fx = { learn = { "highborne" } } } },
      choices = {
        { text = "Do the elders accept that answer?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "Some of them do, and some watch this corner of the terrace more closely than they watch any other. I do not resent it, for we lost a world to careless magic once, and I would rather be watched than trusted too easily." } },
      choices = { { text = "A sensible way to bear it. Something else.", next = "BACK" } },
    },
    taladan = {
      lines = { { id = "t_default", text = "He is quiet and exact, and he never tells me that I am wrong. He only asks me to explain what I have done, and somewhere in the middle of explaining it I discover the mistake for myself." } },
      choices = { { text = "The best kind of teacher. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Summermoon family, and I am Taladan's apprentice. I have a great deal still to learn." } },
    highborne = { { id = "tp_hb", text = "They reached beyond the world for power, and the world broke. I keep that in mind whenever I work." } },
    _none = { { id = "tp_none", text = "I do not know, and I would rather not guess. Taladan may be able to tell you." } },
  },
}

-- Milla Fairancora: apprentice alchemist; teaches journeyman alchemy alongside Ainethil.
P:NPC {
  key = "dar_milla", id = TODO_NPC("Milla Fairancora"), name = "Milla Fairancora", title = "Apprentice Alchemist", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "cheerful", "eager" }, values = { "learning", "nature" },
  notices = { "craft" },
  impression = {
    first = "Milla Fairancora is the younger of the alchemy apprentices and has a faint green stain on most of her fingers. She is delighted by every potion that turns out as intended, and only slightly less so by the ones that do not.",
    third = "{name} met Milla Fairancora, an apprentice alchemist on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Oh, well met! Mind the bench, please, because that flask is still deciding what colour it wants to be." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Have you tried brewing what I showed you, and did it go the right colour?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You brew as well, for I can smell the peacebloom on you. Do your potions ever go cloudy in the damp, or is that only mine?" },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You have earth under your nails and a sprig of something in your pack. Gatherers are my favourite visitors, and Ulthir's as well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Milla Fairancora, and I am learning alchemy from Ainethil, who lets me teach the simple draughts to newcomers. Sylvanna teaches the harder ones, since she has been here longer and spills a great deal less than I do." } },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Do go on, I am only stirring." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What do you like about alchemy?", next = "like" },
        { text = "Ainethil seems a strict teacher.", next = "ainethil" },
        { text = "Good brewing, Milla.", next = "END" },
      },
    },
    like = {
      lines = { { id = "l_default", text = "That the forest has already made everything we need, and we have only to learn how to ask for it. A handful of silverleaf and a little patience will close a wound, and I still think that is wonderful, however often I do it." } },
      choices = {
        { text = "And when it goes wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Then it smells dreadful and I have learned something, which Ainethil says is the second best result. I once turned my own hair green for a whole turning of the moon, and Sylvanna has not let me forget it." } },
      choices = { { text = "Green might have suited you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ainethil = {
      lines = { { id = "a_default", text = "She is very exact, and she talks to her flasks, so that I am never certain which of us she is scolding. But she has never once let me pour out a mistake without first working out why it happened." } },
      choices = { { text = "That is how one learns. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ainethil's apprentice, the newer one. I teach the first draughts, and I clean a great many flasks." } },
    _none = { { id = "tp_none", text = "I do not know that one, I am sorry! Ainethil or Sylvanna would, I am sure." } },
  },
}

-- Saenorion: leatherworking supplies.
P:NPC {
  key = "dar_saenorion", id = TODO_NPC("Saenorion"), name = "Saenorion", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "gruff", "fair" }, values = { "thrift", "respect" },
  notices = { "craft" },
  impression = {
    first = "Saenorion sells salt, thread and dye to the leatherworkers, and he smells faintly of the curing sheds. He is short with idle talkers and generous with anyone who asks a real question.",
    third = "{name} met Saenorion, who sells leatherworking supplies on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met. If it is salt, thread or dye you want, I have it, and if it is something else then you want another stall." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You used up that salt quickly, which I hope means the hides are coming in." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and it has been used lately. Salt your hides the same day, or do not trouble to bring them up here at all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Saenorion. Telonis and Faldron make the leather, and I sell them what they need to make it with, along with anybody else who has the sense to cure a hide before it rots." } },
      again = {
        { id = "h_again", text = "Anything else? Ask it plainly." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do beginners get wrong?", next = "wrong" },
        { text = "You sound hard to please.", next = "hard" },
        { text = "Good day to you.", next = "END" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "They wait. They carry a fresh hide about for three days in the bottom of a pack and then wonder why it comes out stiff and stinking, when the salt should have gone on within the hour." } },
      choices = {
        { text = "And after the salt?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Then you scrape it, and scrape it again when you think you have finished. After that it is a matter for Faldron, who will teach you the rest more gently than I would." } },
      choices = { { text = "I'll take the lesson. Something else.", next = "BACK" } },
    },
    hard = {
      lines = {
        { id = "ha_hunter", when = { class = "HUNTER" }, text = "I am hard on waste, hunter, and on nothing else. An animal gave its life for that hide, and you of all people know that the least we owe it is to use the thing well." },
        { id = "ha_default", text = "I am hard on waste, and on nothing else. A beast died for every hide on this terrace, and I have little patience for those who spoil one through laziness." },
      },
      choices = { { text = "That's fair. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I ran the curing sheds before I sold supplies. I am too old for the lifting now, so I sell the salt." } },
    _none = { { id = "tp_none", text = "I do not know, and it is not my business. Ask somebody with time for gossip." } },
  },
}

-- Sylvanna Forestmoon: apprentice alchemist, the senior of the two; teaches expert alchemy.
P:NPC {
  key = "dar_sylvanna", id = TODO_NPC("Sylvanna Forestmoon"), name = "Sylvanna Forestmoon", title = "Apprentice Alchemist", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "composed", "wry" }, values = { "precision", "responsibility" },
  notices = { "craft" },
  impression = {
    first = "Sylvanna Forestmoon is the senior of Ainethil's two apprentices, and she measures everything twice in a level, unhurried way. She keeps one eye on her own flask and the other on Milla's.",
    third = "{name} met Sylvanna Forestmoon, an apprentice alchemist on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore, {class}. If you have come to study alchemy, wash your hands first, please." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. I trust nothing exploded in the meantime, or that you have at least written down why it did." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You keep your vials stoppered and upright, and that already places you above half the students I see. We may get somewhere, you and I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Sylvanna Forestmoon. Ainethil trusts me to teach the more demanding draughts, and Milla takes the newcomers, which suits both our tempers." } },
      again = {
        { id = "h_again", text = "What else do you wish to know?" },
        { id = "h_again2", text = "Yes? Speak while this settles." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "What makes a draught demanding?", next = "demanding" },
        { text = "You keep a close eye on Milla.", next = "milla" },
        { text = "Steady measures, Sylvanna.", next = "END" },
      },
    },
    demanding = {
      lines = { { id = "d_default", text = "The margin for error is what does it. A healing draught forgives a careless hand, whereas the stronger elixirs do not, and a few grains too much of the wrong root will turn a cure into something I would not give to a satyr." } },
      choices = {
        { text = "Has that ever happened here?", next = "happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened = {
      lines = { { id = "ha_default", text = "Never in anything that left this bench, because we test each batch ourselves before a stranger drinks it. That is Ainethil's rule, and it is the reason that I have, on occasion, been able to taste nothing at all for a week." } },
      choices = { { text = "A brave sort of rule. Something else.", next = "BACK" } },
    },
    milla = {
      lines = { { id = "m_default", text = "Somebody must, for she has more joy in the work than caution, and I would not change the first for anything. She will be better than I am one day, if she can keep her eyebrows until then." } },
      choices = { { text = "She's lucky to have you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have studied under Ainethil for a long while. I am an apprentice still, and in no hurry to be anything else." } },
    _none = { { id = "tp_none", text = "I will not guess at what I have not measured. Ask Ainethil." } },
  },
}

-- Taladan: enchanting trainer.
P:NPC {
  key = "dar_taladan", id = TODO_NPC("Taladan"), name = "Taladan", title = "Enchanter Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "exact" }, values = { "restraint", "knowledge" },
  notices = { "craft", "class" },
  impression = {
    first = "Taladan teaches enchanting on the Craftsmen's Terrace in a low, even voice, and he chooses each word as carefully as a rune. He practises an art that many of his people look at sidelong, and he knows it.",
    third = "{name} met Taladan, the enchanting trainer of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. If you seek to learn enchanting, you will find that I teach it slowly, and with reason." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me what you have enchanted since we spoke, and what you had to destroy to do it." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You carry a rod, and it has been used. I am glad of it, though I will want to see how you hold it before I teach you anything more." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I can feel what follows at your heels, warlock. I will teach you, since the Alliance asks it of us, but you will work at arm's length from my bench." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Taladan, and I teach the craft of enchanting. Lalina Summermoon takes the beginners, Vaean beside me sells what the work requires, and I see to those who are ready to learn what it costs." } },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak. I am listening." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "What does enchanting cost?", next = "cost" },
        { text = "Do your people trust this craft?", next = "trust" },
        { text = "Elune be with you.", next = "END" },
      },
    },
    cost = {
      lines = { { id = "c_default", text = "Every enchantment is paid for with something unmade. To place strength in a blade you must first take a made thing apart and gather what is left of it, and so an enchanter learns to destroy before he learns to give." } },
      choices = {
        { text = "That sits uneasily with you.", next = "uneasy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uneasy = {
      lines = { { id = "u_default", text = "It should sit uneasily with anyone, and I do not teach students who feel nothing at it. Balance is the first law of my people, and the craft is safe only in the hands of those who keep count of what they take." } },
      choices = { { text = "I'll keep count. Something else.", next = "BACK" } },
    },
    trust = {
      lines = {
        { id = "t_ne", when = { race = "NightElf" }, text = "You know as well as I do that some of them do not. They remember Azshara's court and see its shadow in every glowing rune, and I answer them by working in the open air, where any Sister may come and watch.", fx = { learn = { "highborne" } } },
        { id = "t_default", text = "Not all of them, no. Sorcery drew the Burning Legion to this world once, in the days of the Highborne, and although my craft draws on nothing beyond the world, I work in the open air so that anyone may come and see that for themselves.", fx = { learn = { "highborne" } } },
      },
      choices = { { text = "Openness is a good answer. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have taught enchanting in Darnassus since the city was raised. I taught it more quietly before that." } },
    highborne = { { id = "tp_hb", text = "They took without counting the cost, and all of us paid it. I teach the opposite." } },
    _none = { { id = "tp_none", text = "That is outside my knowledge, {class}, and I do not speak beyond it." } },
  },
}

-- Trianna: apprentice tailor; teaches beginners, and the camp-craft lesson (Camping 101: Tailoring).
P:NPC {
  key = "dar_trianna", id = TODO_NPC("Trianna"), name = "Trianna", title = "Apprentice Tailor", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "bright", "encouraging" }, values = { "craft", "hospitality" },
  notices = { "craft", "class" },
  impression = {
    first = "Trianna is Me'lynn's apprentice in tailoring, and she has pins in her collar and a length of cloth over one shoulder. She teaches as if every student were about to make something marvellous.",
    third = "{name} met Trianna, an apprentice tailor on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome! Have you come to learn the needle, or only to have something mended?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Come and show me what you have sewn since, and do not hide the crooked parts." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Camping 101: Tailoring") },
      text = "You have the look of someone who has been sleeping on bare roots. Did they send you to me to learn how to furnish a camp?" },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Oh, you sew already, for I can see it in your cuffs. Then we may skip the part where I explain which end of the needle is which." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter spends more nights under the sky than anyone. You of all people ought to know how to stitch yourself a little comfort." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "I am Trianna, and if it is camp craft you want, you have found the right needle. A fire will warm you, but it is cloth that turns a patch of ground into somewhere you would wish to stay." },
        { id = "h_default", text = "I am Trianna, apprentice to Me'lynn, and I teach tailoring to anyone willing to prick a finger or two. Lately I teach adventurers as well, who want to make their camps in the wilds a little kinder." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Ask away, I can talk and pin at once." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Camping 101: Tailoring") }, text = "Yes? And how is the camp coming along?" },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "I was told you teach camp craft.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "What does a tailor do for a camp?", next = "camp" },
        { text = "Tell me about Me'lynn.", next = "melynn" },
        { text = "Night elves sleep under the stars anyway.", next = "stars" },
        { text = "Elune watch over you.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "A great deal, as it happens! A cook can give you a fire, but somebody must still make the bedroll you lie on and the cloth that keeps the rain from your face. Learn the basics of tailoring from me, and you will be able to furnish a camp of your own." } },
      choices = {
        { text = "What should I learn to make first?", next = "first" },
        { text = "Why do adventurers come to you for this?", next = "whyme" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Start with a plain bolt of linen, because everything else begins there. Once your seams are straight you can sew something to sleep on, and as your skill grows your camp can hold larger and finer things." } },
      choices = {
        { text = "And if my seams are never straight?", next = "seams" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seams = {
      lines = { { id = "s_default", text = "Then your bedroll will be a little lopsided, and you will sleep in it just the same. Nobody's first seam is straight, mine least of all, and Me'lynn kept my first one to show me whenever I grow proud." } },
      choices = { { text = "That is some comfort. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    whyme = {
      lines = { { id = "w_default", text = "Because Me'lynn has masters to teach, and because I do not mind the same question forty times in a day. The other crafts do likewise, I am told, each of them adding something of its own to a traveller's camp." } },
      choices = { { text = "A camp built by many hands. Something else.", next = "BACK" } },
    },
    melynn = {
      lines = { { id = "m_default", text = "She is the finest tailor in Darnassus, and she can tell from across the terrace when I have skipped a stitch. She is strict, but she has never once made me feel foolish for asking, and I try to teach in the same way." } },
      choices = {
        { text = "What has she taught you that matters most?", next = "matters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    matters = {
      lines = { { id = "ma_default", text = "That a garment is made for a person and not for the tailor. I used to sew what I thought was beautiful, and now I ask where the wearer is going, which has made my work plainer and much better." } },
      choices = { { text = "A good lesson for any craft. Something else.", next = "BACK" } },
    },
    stars = {
      lines = {
        { id = "st_ne", when = { race = "NightElf" }, text = "We do, and you and I were raised to it, with a cloak and a mossy root for a bed. But our guests from across the sea were not, and I think there is no shame in learning a little comfort from them." },
        { id = "st_default", text = "We do, and gladly, with a cloak and a soft root for a pillow. Your people seem to need rather more than that, and I have found that I enjoy making it for them." },
      },
      choices = { { text = "Comfort has its uses. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Me'lynn's apprentice on the Craftsmen's Terrace. I teach beginners, and I learn from everybody." } },
    _none = { { id = "tp_none", text = "Oh, I do not know about that. I know cloth, and I am still learning even that." } },
  },
}

-- Ulthir: alchemy supplies.
P:NPC {
  key = "dar_ulthir", id = TODO_NPC("Ulthir"), name = "Ulthir", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "fussy", "kindly" }, values = { "order", "care" },
  notices = { "craft" },
  impression = {
    first = "Ulthir sells vials and herbs to the alchemists, and he keeps every one of them in a strict order that only he fully understands. He winces whenever glass clinks.",
    third = "{name} met Ulthir, who sells alchemy supplies on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Well met, and gently, please, for everything on this side of the stall will break if you look at it too hard." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back. How many of the last vials survived the road, if I may ask?" },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You gather herbs, and I see that you wrap them properly in damp cloth. You would be surprised how few people do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Ulthir, and I supply the alchemists. Ainethil and her apprentices use vials faster than the glassblowers can make them, and young Milla alone accounts for a good many of the breakages." } },
      again = {
        { id = "h_again", text = "Was there anything else?" },
        { id = "h_again2", text = "Yes? Mind your elbow there." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Milla breaks that many?", next = "milla" },
        { text = "Which herbs grow on Teldrassil?", next = "herbs" },
        { text = "Careful days, Ulthir.", next = "END" },
      },
    },
    milla = {
      lines = { { id = "m_default", text = "She gestures when she is excited, and she is nearly always excited. I have taken to setting her vials aside in a padded basket, which she believes is a kindness and which is in truth a measure for my own peace." } },
      choices = {
        { text = "You're fond of her, I think.", next = "fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond = {
      lines = { { id = "f_default", text = "I am fond of all three of them, though I would thank you not to repeat it at the bench. A supplier who is known to be soft-hearted is asked for credit, and glass does not blow itself." } },
      choices = { { text = "Not a word from me. Something else.", next = "BACK" } },
    },
    herbs = {
      lines = {
        { id = "he_druid", when = { class = "DRUID" }, text = "Peacebloom, silverleaf and earthroot grow freely, as you will know better than I do. The druids of the Enclave ask us to gather lightly near the moonwells, and I pass that on to every customer whether they wish to hear it or not." },
        { id = "he_default", text = "Peacebloom and silverleaf nearly everywhere, and earthroot on the rises. Gather lightly and leave the roots of the first two, because the druids notice when a glade has been stripped, and they remember who did it." },
      },
      choices = { { text = "I'll gather with care. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept the alchemists supplied for many years, and I count my vials every evening." } },
    _none = { { id = "tp_none", text = "I am afraid I have nothing on that shelf. Ask one of the alchemists." } },
  },
}

-- Vaean: enchanting supplies, beside Taladan.
P:NPC {
  key = "dar_vaean", id = TODO_NPC("Vaean"), name = "Vaean", title = "Enchanting Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "soft-spoken", "watchful" }, values = { "caution", "loyalty" },
  notices = { "craft" },
  impression = {
    first = "Vaean sells rods, dusts and essences beside Taladan the enchanter, and his whole stall glows faintly after dark. He answers questions fully, but he volunteers very little.",
    third = "{name} met Vaean, who sells enchanting supplies on the Craftsmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. I have rods, dust and essences, and I would ask you not to open the jars without need." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. You have used what you bought, I think, for there is a little of it still clinging to your hands." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune-adore. The stall is easy to find at this hour, since the dust gives more light than the lamps do." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You practise the craft, so you will know what you need without my guidance. Taladan is beside me if you wish to learn more of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Vaean, and I supply the enchanters. Taladan teaches the craft and Lalina helps him, and I see that neither of them ever has to stop a lesson for want of a copper rod." } },
      again = {
        { id = "h_again", text = "Is there something else you need?" },
        { id = "h_again2", text = "Yes? I am listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where does the glowing dust come from?", next = "dust" },
        { text = "You stand very close to Taladan's bench.", next = "close" },
        { text = "Moon light your way.", next = "END" },
      },
    },
    dust = {
      lines = { { id = "d_default", text = "From enchanted things that have been taken apart, such as a ring or a blade that somebody no longer wanted. What made the thing remarkable does not vanish when it is unmade, and I gather what is left of it and sell it by the pinch." } },
      choices = {
        { text = "Is it dangerous to keep so much?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "It is not dangerous in the jar, and I keep it in the jar. I count what comes in and what goes out, and at each new moon one of the Sisters looks over my tally, which I asked for myself and which nobody demanded of me." } },
      choices = { { text = "A careful arrangement. Something else.", next = "BACK" } },
    },
    close = {
      lines = { { id = "c_default", text = "I do, and by design. A student who must cross the terrace for a rod will come back having forgotten half the lesson, and Taladan does not care to say a thing twice." } },
      choices = { { text = "Practical of you both. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have stood beside Taladan's bench for as long as he has had one here. We do not need to say much to each other." } },
    _none = { { id = "tp_none", text = "I cannot say. Taladan might, if the matter touches on the craft." } },
  },
}
