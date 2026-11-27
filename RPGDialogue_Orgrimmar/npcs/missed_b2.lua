-- Orgrimmar folk the roster scan found unwritten, part two: the Valley of Honor's forge and
-- weapon racks. Okothos Ironrager and Ox of the Mithril Order, Shayis Steelfury, Saru's
-- apprentices Snarl and Ug'thok, Tumi, and Shoma and Zendo'jian. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Okothos Ironrager: master armorsmith, Valley of Honor.
P:NPC {
  key = "okothos", id = TODO_NPC("Okothos Ironrager"), name = "Okothos Ironrager", gender = "male",
  bible = "bibles/missed_b.md", role = "smith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "stern", "exacting" }, values = { "proud", "diligent" },
  notices = { "profession", "class" },
  impression = {
    first = "Okothos Ironrager is the master armorsmith of the Valley of Honor, a broad orc who tests a breastplate by striking it with his own fist. He has little to say to anyone who has not yet sweated over an anvil.",
    third = "{name} met Okothos Ironrager, the master armorsmith in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of the quench, {class}. I am Okothos Ironrager, and I do not stop a heat to make talk." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Show me your hands, and I will know whether you have been working or only wandering." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "You have a smith's burns on your forearms. Good, because then you and I have something to speak about." },
  },
  notice = {
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "That armor of yours has turned blows, and I can see where. Whoever forged it was competent, and no more than that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("The Art of the Armorsmith") }, text = "You know what I asked of you, smith. Bring me the pieces finished and true, and do not bring them until you would wear them into battle yourself." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Art of the Armorsmith") }, text = "Armorsmith. You have earned that word from me, and I do not hand it out twice in a season." },
        { id = "h_default", text = "A weapon wins one fight, and armor brings the warrior home to fight the next ten. That is my craft, and I teach it only to smiths who have already proven they can be taught." },
      },
      again = {
        { id = "h_again", text = "What else? The iron is cooling." },
        { id = "h_again2", text = "Speak, {class}, and make it worth the lost heat." },
      },
      choices = {
        { text = "What makes armor good?", next = "good" },
        { text = "Who do you take as a student?", next = "student" },
        { text = "Who is the tauren beside you?", next = "ox" },
        { text = "A good axe ends the fight sooner.", next = "axe" },
        { text = "I am a smith. Will you teach me?", next = "teach", when = { profession = "Blacksmithing" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "It must turn the blow, and it must let the arm rise and the knee bend, and most smiths can manage only one of those. I have seen warriors die inside fine plate because they could not lift a shield in it." } },
      choices = {
        { text = "How do you test it?", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      lines = { { id = "ts_default", text = "I hit it, and then I wear it and have Snarl or Ug'thok hit me. Saru complains that I bruise his apprentices' knuckles, but those two have learned more about plate from punching it than from any lesson." } },
      choices = {
        { text = "And if it fails?", next = "fails" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fails = {
      lines = { { id = "fl_default", text = "Then it goes back into the fire and I begin again, and nobody outside this forge ever sees it. An armorsmith's shame is not a cracked plate, {class}; his shame is a cracked plate that he sold." } },
      choices = { { text = "A hard rule, and a good one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    student = {
      lines = { { id = "st_default", text = "A smith who has already made mail and plate that held, and who is seasoned enough to know what a battlefield does to it. I do not take beginners, because Saru is there for beginners and he is better at patience than I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ox = {
      lines = { { id = "ox_default", text = "That is Ox, of the Mithril Order. His brotherhood keeps the oldest ways of the armorer's craft, and the smiths I send to him come back knowing things I cannot teach from this anvil." } },
      choices = {
        { text = "You trust a tauren with orc smiths?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "tr_tauren", when = { race = "Tauren" }, text = "I trust his work, and that is the only trust a smith needs. Your people forged little before they met us, {class}, and Ox has outlearned half the orcs in this valley since." },
        { id = "tr_default", text = "I trust his work, which is the only trust that matters at a forge. The Mithril Order does not care what horns or tusks a smith has, only whether the plate holds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    axe = {
      lines = { { id = "ax_default", text = "So the weaponsmiths tell me, loudly and often. Go and count the old warriors in this city, {class}, and then ask each of them whether it was his axe or his breastplate that let him grow old." } },
      choices = {
        { text = "The breastplate. I take your point.", next = "BACK" },
        { text = "An old warrior was a good one first. Something else.", next = "BACK", reply = "Hm. That is true as well, and I will not argue it." },
      },
    },
    teach = {
      lines = {
        { id = "te_done", when = { questDone = TODO_QUEST("The Art of the Armorsmith") }, text = "I have taught you already, armorsmith, and the rest you must learn from the blows your work takes. Go and speak with Ox when you are ready for the Order's road." },
        { id = "te_default", text = "When you are an artisan of the hammer and have the seasons behind you, come to me and I will set you a test in steel. Until then, make everything Saru asks of you, and make it twice." },
      },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have made armor for the Horde since before it had a city to make it in. The work has not changed, only the anvil." } },
    _none = { { id = "tp_none", text = "I know iron, steel and mithril, {class}. Ask me about those, or ask someone else." } },
  },
}

-- Ox: tauren of the Mithril Order, stands by Okothos in the Valley of Honor.
P:NPC {
  key = "ox_mithril", id = TODO_NPC("Ox"), name = "Ox", title = "The Mithril Order", gender = "male",
  bible = "bibles/missed_b.md", role = "smith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "gentle" }, values = { "patient", "diligent" },
  notices = { "profession", "race" },
  impression = {
    first = "Ox is a great tauren who stands beside the armorers' forge in the Valley of Honor, patient as a kodo among all the orcish clamour. He wears the mark of the Mithril Order and speaks of metal the way his people speak of the land.",
    third = "{name} met Ox of the Mithril Order, at the forge in the Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome at the forge, {class}. I am called Ox, and I speak here for the Mithril Order." },
    { id = "g_back", when = { metBefore = true }, text = "The winds have carried you back to this valley. Sit, if the heat does not trouble you." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "It is good to see another of the tribes among so much stone and iron. May the Earth Mother warm your path here." },
  },
  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "You carry the smell of coal smoke, young smith. The Order always has an eye for those who shape metal with care." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("Booty Bay or Bust!") }, text = "You carry my insignia, and it will speak for you in Booty Bay. Seek McGavan there, and be patient with him, because he tests every smith who comes." },
        { id = "h_default", text = "The Mithril Order is an old fellowship of armorers, and we care for the craft more than for the banners above it. I wait here for smiths whom Okothos has finished with, and I send the worthy ones onward." },
      },
      again = {
        { id = "h_again", text = "What else would you know, {class}?" },
        { id = "h_again2", text = "Ask. A forge teaches patience, and I have learned mine." },
      },
      choices = {
        { text = "What is the Mithril Order?", next = "order" },
        { text = "How did a tauren come to smithing?", next = "tauren" },
        { text = "It's a strange place for one of your people.", next = "place" },
        { text = "I am an armorsmith. Where do you send us?", next = "send", when = { profession = "Blacksmithing" } },
        { text = "Walk with the Earth Mother, Ox.", next = "END" },
      },
    },
    order = {
      lines = { { id = "or_default", text = "We are smiths who gave ourselves to one metal, the true silver that the old ones called mithril. It is light as a hide shield and harder than steel, and it forgives nothing in the hand that works it." } },
      choices = {
        { text = "Who leads the Order?", next = "leads" },
        { text = "Does the Order serve the Horde?", next = "serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leads = {
      lines = { { id = "ld_default", text = "Our eldest is Galvan, whom smiths call the Ancient, and he keeps his anvil far to the south in the jungles of Stranglethorn. Few reach him, and fewer still are shown what he knows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    serve = {
      lines = { { id = "sv_default", text = "The Order serves the craft, and its smiths serve whom they will. McGavan in Booty Bay is a human, and he and I have traded letters about tempering for many seasons without one harsh word between us." } },
      choices = {
        { text = "A craft should stand above the war.", next = "BACK", reply = "So I believe, though I do not say it loudly in this valley." },
        { text = "I would not share secrets with a human.", next = "BACK", reply = "Many here feel as you do. The metal does not, and I listen to the metal." },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "My people shaped wood, horn and hide for more generations than we can count, and we shaped little metal until the orcs came to Mulgore. I watched one of them draw a blade out of red stone, and I thought it was the Earth Mother giving up a secret." } },
      choices = {
        { text = "And you have followed it ever since?", next = "follow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    follow = {
      lines = { { id = "fo_default", text = "As a hunter follows a herd across the plains, without hurry and without turning aside. Ore is a gift from under the grass, {class}, and I try to waste none of what the land has given up." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    place = {
      lines = { { id = "pl_default", text = "It is loud, and there is no grass, and the sky is a narrow strip between the cliffs. But the best armorsmith of the Horde works at this fire, and a smith goes where the good anvils are, as a herd goes where the water is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    send = {
      lines = { { id = "sd_default", text = "To Booty Bay first, to McGavan, who will set you a task of his own. When you can work mithril as easily as iron, there is also Trenton Lighthammer in Gadgetzan, and beyond him the Ancient himself." } },
      choices = { { text = "That is a long road. Something else.", next = "BACK", reply = "All the good ones are. Walk it steadily and it will not seem so." } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born under the open sky of Mulgore, and I came to Orgrimmar for its forges. The Order gave me a calling there." } },
    _none = { { id = "tp_none", text = "That lies outside what I know, {class}. I would not send you down a wrong trail by guessing." } },
  },
}

-- Shayis Steelfury: armorsmith at the Valley of Honor forge.
P:NPC {
  key = "shayis", id = TODO_NPC("Shayis Steelfury"), name = "Shayis Steelfury", gender = "female",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "fierce" }, values = { "proud", "diligent" },
  notices = { "profession" },
  impression = {
    first = "Shayis Steelfury works the armorers' side of the forge in the Valley of Honor, and she swings a hammer as though the plate had insulted her family. She talks in the gaps between blows and expects to be heard over them.",
    third = "{name} met Shayis Steelfury, an armorsmith at the forge in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Talk while I work, friend. I like the company, and this plate won't finish itself." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Talk if you must, {class}. I'll keep hammering, and I won't be listening very closely." },
    { id = "g_default", text = "Talk while I work, {class}, because this plate will not wait and neither will the grunt who ordered it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Hand me those tongs if you mean to stand there." },
  },
  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "You hold yourself like someone who has swung a hammer all day. What do you make, blades or plate?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shayis Steelfury, and I make armor, and I show others how when they have the arm for it. The name is known at this forge, so I have to work twice as hard to deserve it." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short, the metal is hot." },
        { id = "h_again2", text = "Ask, {class}, between the hammer strokes." },
      },
      choices = {
        { text = "Steelfury, like Saru?", next = "saru" },
        { text = "What are you forging?", next = "forging" },
        { text = "Armor or weapons: which is the truer craft?", next = "truer" },
        { text = "I smith as well. What should I practise?", next = "practise", when = { profession = "Blacksmithing" } },
        { text = "Who taught you to smith?", next = "y_teach" },
        { text = "What do you fear at the forge?", next = "y_fear" },
        { text = "Who is Kelgruk to you?", next = "y_kelgruk" },
        { text = "Strength and honor, Shayis.", next = "END" },
      },
    },
    saru = {
      lines = { { id = "sa_default", text = "We are kin, and that is as much as you need to know of it. Saru teaches every peon who can lift a hammer, and I take the ones who are still standing when he has finished with them." } },
      choices = {
        { text = "Is it hard, sharing a forge with kin?", next = "kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "kn_default", text = "It is loud, and nobody is polite, and when your work is poor you hear about it at the forge and again over the evening meal. I would not trade it, because nobody will tell you the truth about your welds like your own blood." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forging = {
      lines = { { id = "fg_default", text = "A set of shoulder plates for a raider who rides out to the Barrens tomorrow. Wolf riders need the left side heavier than the right, since that is the side the centaur spears come from." } },
      choices = { { text = "I hadn't thought of that. Something else.", next = "BACK" } },
    },
    truer = {
      lines = { { id = "tr_default", text = "Kelgruk across the way would say weapons, and he is wrong, and I tell him so every morning. Any fool can sharpen a bar of iron, but armor has to fit a living body that twists and breathes and falls off wolves." } },
      choices = {
        { text = "Armor, then. You've convinced me.", next = "BACK" },
        { text = "I'd still rather have the axe. Something else.", next = "BACK", reply = "Then go and stand with Kelgruk, and see who mends your dents." },
      },
    },
    practise = {
      lines = { { id = "pr_default", text = "Rivets. Everyone wants to hammer out a grand breastplate, and nobody wants to set two hundred rivets straight, and it is the rivets that give way in battle. When yours are all even, come and show me." } },
      choices = { { text = "Rivets it is. Something else.", next = "BACK" } },
    },
    y_teach = {
      lines = {
        { id = "y_teach_d", text = "Saru, when I was too small to hold the tongs. He made me sweep the forge for a year before I touched a hammer. I hated him for it. Now I make my own apprentices sweep." },
        { id = "y_teach_orc", when = { race = "Orc" }, text = "Saru, when I was small, as some elder of your clan probably taught you something you hated. A year of sweeping before a hammer. Now my apprentices sweep." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_fear = {
      lines = { { id = "y_fear_d", text = "A plate that splits. I made one once, in a hurry, for a grunt riding to Ashenvale. He came back with a night elf arrow in his ribs, through my plate. I have never hurried since." } },
      choices = {
        { text = "Did you tell him it was your fault?", next = "y_fault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fault = {
      lines = { { id = "y_fault_d", text = "Saru said to keep quiet, that it would ruin the Steelfury name. I told the grunt anyway. Was Saru wrong, or was I?" } },
      choices = {
        { text = "You were right. Honesty first.", next = "BACK", reply = "Good. I would do it again.", fx = { align = { honor = 1 } } },
        { text = "Saru was right. The name matters.", next = "BACK", reply = "Hm. Then you and he would get along.", fx = { align = { honor = -1 } } },
      },
    },
    y_kelgruk = {
      lines = { { id = "y_kelgruk_d", text = "Kelgruk Bloodaxe makes the blades across the way, and we have argued every morning for six years. If he ever agrees with me, I will check him for fever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Steelfury at the forge, like the rest of my blood. I make armor, and I make it to be struck." } },
    saru_steelfury = { { id = "y_tp_saru", text = "Saru is the best smith in Orgrimmar and the worst at saying so. I say it for him." } },
    ashenvale = { { id = "y_tp_ash", text = "Ashenvale is where my plate gets tested. The elves shoot well." } },
    _none = { { id = "tp_none", text = "I have no idea, {class}, and no time to find out. Ask someone who is not holding hot iron." } },
  },
}

-- Snarl: apprentice blacksmith under Saru Steelfury.
P:NPC {
  key = "snarl_apprentice", id = TODO_NPC("Snarl"), name = "Snarl", title = "Apprentice Blacksmith", gender = "male",
  bible = "bibles/missed_b.md", role = "apprentice", tier = "service",
  communities = { "orgrimmar" }, temper = { "surly" }, values = { "proud", "diligent" },
  notices = { "profession", "class" },
  impression = {
    first = "Snarl is one of Saru Steelfury's apprentices, a young orc with a scowl that explains his name and forearms dotted with spark burns. He works the bellows as if he bore them a grudge.",
    third = "{name} met Snarl, an apprentice blacksmith at Saru Steelfury's forge.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you. I'll fetch the master, or I'll help you myself. You're all right." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Master's at the big anvil. If you want me, you'll have to wait, because I'm busy." },
    { id = "g_default", text = "If you want the master, he is at the big anvil. If you want me, be quick, because the fire dies when I stop." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I am still on the bellows, in case you wondered." },
  },
  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "Another smith. Then you remember what the bellows are like, and you will not laugh." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Snarl, apprentice to Saru Steelfury. I pump the bellows, I haul the coal and I hold the iron while he strikes it, and one day I will be the one who strikes." },
      },
      again = {
        { id = "h_again", text = "What else? The fire is hungry." },
        { id = "h_again2", text = "Ask, then, while my arms rest." },
      },
      choices = {
        { text = "How did you earn a name like Snarl?", next = "name" },
        { text = "When will Saru let you forge?", next = "forge" },
        { text = "You and Ug'thok seem to compete.", next = "ugthok" },
        { text = "I've done my time on the bellows too.", next = "bellows", when = { profession = "Blacksmithing" } },
        { text = "Where were you raised, Snarl?", next = "y_raised" },
        { text = "What do you dream of forging?", next = "y_dream" },
        { text = "Those are a lot of burns on your arms.", next = "y_burn" },
        { text = "How is the horseshoe count now?", next = "y_sixtyone" },
        { text = "Back to the bellows, then.", next = "END" },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "My mother says I made that face the day I was born and have not stopped since. The master says a smith who scowls at his own work will always find the flaw in it, so I keep the face." } },
      choices = { { text = "It suits the trade. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forge = {
      lines = { { id = "fg_default", text = "He lets me make nails, hinges and wolf shoes, and he throws half of them back in the scrap. He says that when I can make a hundred nails that he cannot tell apart, he will hand me a blade to draw out." } },
      choices = {
        { text = "How many are you up to?", next = "count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "ct_default", text = "Sixty-one, and then the sixty-second came out bent, and he made me start the count again from nothing. I was angry for three days, and then I saw that the bent one would have split a board." } },
      choices = { { text = "Then he was right. Something else.", next = "BACK" } },
    },
    ugthok = {
      lines = { { id = "ug_default", text = "Ug'thok thinks he will be given a hammer of his own before I am, and he is wrong. He has the stronger arm, I will grant him that, but I have the better eye, and the master knows it." } },
      choices = {
        { text = "A forge needs both.", next = "BACK", reply = "That is what the master says. He says it to stop us fighting, I think." },
        { text = "My coin is on you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    bellows = {
      lines = { { id = "bl_default", text = "Then you know your shoulders never forget it. Does it end, {class}? Tell me truly that there comes a day when someone younger takes the handle." } },
      choices = {
        { text = "It ends. Then you miss it, a little.", next = "BACK", reply = "Hm. I do not believe the second part, but I am glad of the first." },
        { text = "A smith is never really done with bellows.", next = "BACK", reply = "Bah. I should not have asked." },
      },
    },
    y_raised = {
      lines = {
        { id = "y_raised_d", text = "Here, in the Drag, the year the walls went up. My father hauled stone for the Warchief and my mother cooked for the haulers. I am the first of my blood to hold anything but a shovel." },
        { id = "y_raised_orc", when = { race = "Orc" }, text = "Here in the Drag, like plenty of young orcs. My father hauled stone and my mother cooked for the haulers. I will be the first of my blood to forge a blade." },
      },
      choices = {
        { text = "Your parents must be proud.", next = "y_proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_proud = {
      lines = { { id = "y_proud_d", text = "My father says a hauler's son should not get above himself. My mother says nothing and brings me food at the forge. I think she is the proud one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_dream = {
      lines = { { id = "y_dream_d", text = "An axe for a Kor'kron guard. Every orc in the city would see my work beside the Warchief. Ug'thok says that is vanity, and that a smith should want only to make good iron." } },
      choices = {
        { text = "Ug'thok is right. Make good iron.", next = "BACK", reply = "Bah. He would say that. But perhaps.", fx = { align = { honor = 1 } } },
        { text = "Aim high. Glory drives good work.", next = "BACK", reply = "Ha! I knew someone would understand.", fx = { align = { honor = -1 } } },
      },
    },
    y_burn = {
      lines = { { id = "y_burn_d", text = "These? Sparks from the first year, when I stood too close and too proud. Saru says each one is a lesson. I have a great many lessons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_sixtyone = {
      lines = { { id = "y_sixtyone_d", text = "I am at forty this time. The master watches every one now, and he has not thrown one back in a week. I do not trust it. He is waiting for me to get careless." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was raised in Orgrimmar, and I am apprenticed to Saru Steelfury. It is not glory yet, but it will be." } },
    saru_steelfury = { { id = "y_tp_saru", text = "Saru Steelfury is the best smith in Orgrimmar, and he knows it, and he makes sure I know it." } },
    the_drag = { { id = "y_tp_drag", text = "I grew up in the Drag. It smells of tanning and it is never quiet, and I love it." } },
    _none = { { id = "tp_none", text = "I am an apprentice. Nobody tells me anything except to pump harder." } },
  },
}

-- Ug'thok: apprentice blacksmith under Saru Steelfury.
P:NPC {
  key = "ugthok", id = TODO_NPC("Ug'thok"), name = "Ug'thok", title = "Apprentice Blacksmith", gender = "male",
  bible = "bibles/missed_b.md", role = "apprentice", tier = "quest",
  communities = { "orgrimmar" }, temper = { "eager", "boastful" }, values = { "proud", "strong" },
  notices = { "class", "profession" },
  impression = {
    first = "Ug'thok is the bigger of Saru Steelfury's two apprentices, and he swings the sledge with more joy than aim. He loves axes above everything else that comes off an anvil and will tell anyone so.",
    third = "{name} met Ug'thok, an apprentice blacksmith at Saru Steelfury's forge who dreams of axes.",
  },
  greetings = {
    { id = "g_default", text = "Ho, {class}! Ug'thok, apprentice smith. Stand back a pace, because I am swinging the big hammer today." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Come and look at this edge, and tell me it is not the best you have seen." },
  },
  notice = {
    { id = "n_axe", cat = "class", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } },
      text = "You look like one who knows a good axe from a bad one. I will want your opinion before you go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("This Is Spinal Axe") }, text = "Have you got what I asked for? I cannot finish the axe without it, and the master will not let me near the good steel until I show him I am serious." },
        { id = "h_done", when = { questDone = TODO_QUEST("This Is Spinal Axe") }, text = "There is the one who helped me with my axe! The master looked at it for a long time and did not throw it in the scrap, and from him that is praise." },
        { id = "h_default", text = "I am Ug'thok, and I work for Saru Steelfury, and one day every grunt in Orgrimmar will carry an axe with my mark on it. For now I strike where the master points and I try not to hit his thumb." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me about axes." },
        { id = "h_again2", text = "Go on, {class}, my arm needs a rest anyway." },
      },
      choices = {
        { text = "Why axes, of all things?", next = "axes" },
        { text = "What is Saru like as a master?", next = "saru" },
        { text = "Snarl says he has the better eye.", next = "snarl" },
        { text = "A sword is the finer weapon.", next = "sword" },
        { text = "Let me see this edge of yours.", next = "edge", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } } },
        { text = "Swing true, Ug'thok.", next = "END" },
      },
    },
    axes = {
      lines = { { id = "ax_default", text = "Because an axe is honest. A sword has a point and two edges and a dozen clever tricks, and an axe has one thing to say and says it once, which is how an orc should speak." } },
      choices = {
        { text = "What kind do you mean to make?", next = "kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kind = {
      lines = { { id = "kd_default", text = "A great one, two-handed, with a blade as wide as my chest and a spike on the back for armor. I have drawn it in the ash a hundred times, and Snarl says it will be too heavy to lift, but Snarl has arms like a troll's." } },
      choices = {
        { text = "Has Saru seen the drawing?", next = "drawing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drawing = {
      lines = { { id = "dr_default", text = "He looked at it and said, 'Make a hatchet that does not fall off its handle, and then we will talk.' So I have made eleven hatchets, and none has fallen off its handle since the fourth." } },
      choices = { { text = "That is progress. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    saru = {
      lines = { { id = "sa_default", text = "He shouts, and he is right, and those two together are hard to bear on a hot day. But he was making blades for the Horde when I was a whelp, and when he says a weld is bad it is bad, even when I cannot yet see why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    snarl = {
      lines = { { id = "sn_default", text = "Ha! Snarl has the better frown, and that is all. I grant that his nails are straighter than mine, but nobody ever won a battle with a straight nail." } },
      choices = {
        { text = "Someone has to hold the axe head on.", next = "BACK", reply = "Hm. Do not tell him you said that, or I will never hear the end of it." },
        { text = "You two will make a fine forge together. Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = { { id = "sw_default", text = "That is human talk, {class}, or elf talk, and I will forgive it because you are a guest at this forge. Go and ask Kelgruk Bloodaxe which he would carry, and mind the name before you ask." } },
      choices = { { text = "Fairly answered. Something else.", next = "BACK" } },
    },
    edge = {
      lines = { { id = "ed_default", text = "Here, run your thumb along it, carefully. I ground it myself on the big wheel, and the master said only that it was 'not blunt', which I have decided to take as a kindness." } },
      choices = {
        { text = "It's a good edge. Keep at it.", next = "BACK", reply = "I knew it! I will tell Snarl a seasoned fighter said so.", fx = { affinity = 1 } },
        { text = "It's uneven near the heel.", next = "BACK", reply = "Is it? Hold it to the light. Bah, you are right, and now I cannot stop seeing it." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am apprenticed to Saru Steelfury in the Valley of Honor. I haul, I strike, and I dream of axes." } },
    _none = { { id = "tp_none", text = "I do not know that, {class}. I know hammers and I am learning axes, and the rest can wait." } },
  },
}

-- Tumi: heavy armor merchant by her father's forge, Valley of Honor.
P:NPC {
  key = "tumi", id = TODO_NPC("Tumi"), name = "Tumi", title = "Heavy Armor Merchant", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "confident", "blunt" }, values = { "proud", "loyal" },
  notices = { "class" },
  impression = {
    first = "Tumi sells mail and plate beside the forge in the Valley of Honor, within earshot of her father's hammer. She can tell from across the yard whether a customer is able to carry what they are asking for.",
    third = "{name} met Tumi, the heavy armor merchant by the Steelfury forge in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Mail on the left, plate on the right, friend, and a fair price on both for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Mail on the left, plate on the right. Pick one, and don't waste my time." },
    { id = "g_default", text = "Mail on the left and plate on the right, {class}, and all of it made within a spear's throw of where you stand." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and that dent is new. Tell me what did it, and I will tell you what would have stopped it." },
  },
  notice = {
    { id = "n_heavy", cat = "class", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "You have the shoulders for my wares. Most who stop here only want to look at them." },
    { id = "n_light", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You would fall over in anything I sell, {class}, and I say that with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tumi. My father, Saru, makes a good part of what hangs here and my sister Sumi sells the smiths their supplies, so if it is iron and it is in this valley, a Steelfury has had a hand on it." },
      },
      again = {
        { id = "h_again", text = "What else do you want to know, {class}?" },
        { id = "h_again2", text = "Ask it. I can talk and polish at once." },
      },
      choices = {
        { text = "You didn't take up the hammer yourself?", next = "hammer" },
        { text = "What sells best?", next = "sells" },
        { text = "A family of smiths must be loud.", next = "family" },
        { text = "What would you put on a warrior?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you and Sumi get on?", next = "y_sumi" },
        { text = "What's the worst sale you've made?", next = "y_worst" },
        { text = "How do you make buyers prove themselves?", next = "y_proof" },
        { text = "Good trading, Tumi.", next = "END" },
      },
    },
    hammer = {
      lines = { { id = "hm_default", text = "I can make a serviceable chain shirt, and my father would tell you so if you pressed him. But somebody in the family had to be able to talk to a customer without shouting, and Sumi and I drew that duty." } },
      choices = {
        { text = "Does Saru shout at customers?", next = "shouts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shouts = {
      lines = { { id = "sh_default", text = "Only at the ones who say his prices are high. He once chased a goblin halfway to the Drag with a pair of tongs, and since then I have done the selling and he has kept to the anvil." } },
      choices = { { text = "A wise arrangement. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sells = {
      lines = { { id = "sl_default", text = "Mail, by a long way, because the young shamans and hunters grow into it and every grunt on the walls wears it. Plate is for those who have fought long enough to earn the weight, and there are fewer of those than there are boasters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "fm_default", text = "You cannot imagine it. We argue about tempering over the evening meal, and the neighbours have learned to tell from the hammering whether the day went well." } },
      choices = { { text = "It sounds like a strong house. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Whatever is heaviest that still lets you raise your arms over your head, and I will have you prove it before you pay. Then go to Okothos if you ever want something made to your own measure, because nobody in Kalimdor fits plate better." } },
      choices = { { text = "I'll remember the name. Something else.", next = "BACK" } },
    },
    y_sumi = {
      lines = {
        { id = "y_sumi_d", text = "Like two hammers on one anvil, {class}. She thinks I flatter customers and I think she frightens them. Our father pretends not to hear, which is a skill he learned from our mother." },
        { id = "y_sumi_orc", when = { race = "Orc" }, text = "Like two hammers on one anvil. You know how orc sisters are. She thinks I flatter customers, I think she frightens them, and our father pretends not to hear." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worst = {
      lines = { { id = "y_worst_d", text = "Plate to a young warrior who could barely lift it. He begged, and he paid, and he fell at the Crossroads a week later because he could not raise his shield fast enough." } },
      choices = {
        { text = "That wasn't your fault.", next = "y_fault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fault = {
      lines = { { id = "y_fault_d", text = "My father says the customer chooses. I say a seller should refuse when she knows better. Who is right, {class}?" } },
      choices = {
        { text = "You are. Refuse when you know better.", next = "BACK", reply = "Then I will keep refusing, and Father can grumble.", fx = { align = { order = -1 } } },
        { text = "Your father. Warriors make their own choices.", next = "BACK", reply = "Hm. He would like you.", fx = { align = { order = 1 } } },
      },
    },
    y_proof = {
      lines = { { id = "y_proof_d", text = "Lift your arms over your head, turn twice, and draw your weapon. If you can do that in my plate without groaning, it is yours. Most groan." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Saru Steelfury's daughter, and Sumi's sister. I sell what the family forge and its neighbours make." } },
    saru_steelfury = { { id = "y_tp_saru", text = "My father, Saru. His hammer wakes the valley, and his temper keeps it awake." } },
    sumi = { { id = "y_tp_sumi", text = "Sumi sells to the smiths. Do not haggle with her. I mean that kindly." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask my father, if you can get a word in between hammer blows." } },
  },
}

-- Shoma: weapon vendor, Arms of Legend, Valley of Honor.
P:NPC {
  key = "shoma", id = TODO_NPC("Shoma"), name = "Shoma", title = "Weapon Vendor", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "grave" }, values = { "proud", "martial" },
  notices = { "class" },
  impression = {
    first = "Shoma sells weapons at Arms of Legend in the Valley of Honor, and he handles each one as if it had a name he ought to remember. He is slow to speak and slower to sell to anyone he judges unready.",
    third = "{name} met Shoma, a weapon vendor at Arms of Legend in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Throm-ka, friend. These are Arms of Legend, and you're worthy of them." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Throm-ka, {class}. These are Arms of Legend. Whether you're worthy, I'll decide." },
    { id = "g_default", text = "Throm-ka, {class}. These are Arms of Legend, though the legend is for you to make and not for me to sell." },
    { id = "g_back", when = { metBefore = true }, text = "You return to my racks. Has your weapon earned a name yet?" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You wear your weapon where your hand falls without thought. A true warrior, then, and welcome." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shoma. I sell blades and hafted arms here, and Zendo'jian sells beside me, and between an orc and a troll there is no weapon the Horde carries that we cannot speak for." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak, {class}. I am listening." },
      },
      choices = {
        { text = "Why call it Arms of Legend?", next = "legend" },
        { text = "How do you work alongside a troll?", next = "zendo" },
        { text = "A weapon is only a tool.", next = "tool" },
        { text = "How should a warrior choose a weapon?", next = "choose", when = { class = "WARRIOR" } },
        { text = "You said you wore chains.", next = "y_chains" },
        { text = "Do you sell to anyone who asks?", next = "y_sell" },
        { text = "Tell me of Gorehowl.", next = "y_gorehowl" },
        { text = "Lok'tar, Shoma.", next = "END" },
      },
    },
    legend = {
      lines = { { id = "lg_default", text = "Because every orc child knows the names: Gorehowl, the Doomhammer. Those weapons were plain iron once, and it was the hands that carried them which made them more." } },
      choices = {
        { text = "Have you seen either of them?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "sn_default", text = "I have seen the Doomhammer on the Warchief's back, as anyone may who waits long enough outside Grommash Hold. Gorehowl I saw once, in Hellscream's hands in Ashenvale, and I have not forgotten the sound it made.", fx = { learn = { "warsong" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zendo = {
      lines = { { id = "zn_default", text = "Easily, now. He laughs too much and he throws things I would rather he did not throw indoors, but he knows a spear better than any orc I have met, and I have told him so exactly once." } },
      choices = { { text = "Once is enough for a troll. Something else.", next = "BACK" } },
    },
    tool = {
      lines = { { id = "tl_default", text = "A hammer for nails is a tool, {class}. A weapon is what stands between your people and chains, and I have worn chains, so I will not hear it spoken of lightly." } },
      choices = {
        { text = "I meant no insult. You're right.", next = "BACK", fx = { affinity = 1 } },
        { text = "It's the arm that matters, not the iron. Something else.", next = "BACK", reply = "On that we agree, and it is why I sell to some and not to others." },
      },
    },
    choose = {
      lines = { { id = "ch_default", text = "Hold it out at arm's length and count to fifty. If the point has dropped, it is too heavy for you today, and you should come back for it when it is not." } },
      choices = { { text = "A plain test. Something else.", next = "BACK" } },
    },
    y_chains = {
      lines = {
        { id = "y_chains_d", text = "Eleven years in the camp at Durnholde's shadow, {class}. I fought in the pits for the guards' wagers. When Thrall came, I broke my chains on the head of the guard who held the key." },
        { id = "y_chains_orc", when = { race = "Orc" }, text = "Eleven years in the camps, as your parents may have known. I fought in the pits for wagers, and when Thrall came, I broke my chains on the guard who held the key." },
      },
      choices = {
        { text = "Do you regret killing him?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = { { id = "y_regret_d", text = "No. But I remember his face, and I wonder if he had children who wait for him still. Should a warrior remember the faces of those he kills?" } },
      choices = {
        { text = "Yes. It keeps a warrior honest.", next = "BACK", reply = "So I believe. I keep each one.", fx = { align = { honor = 1 } } },
        { text = "No. A warrior moves on.", next = "BACK", reply = "Perhaps that is easier. It is not my way.", fx = { align = { honor = -1 } } },
      },
    },
    y_sell = {
      lines = { { id = "y_sell_d", text = "No. I have refused grunts who beat peons and goblins who sell to the Burning Blade. A weapon carries something of its seller, and I will not carry their shame." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_gorehowl = {
      lines = { { id = "y_gorehowl_d", text = "Gorehowl was Grom Hellscream's axe. It howled when he swung it, they say, and the whole army howled with it. I heard it once, from far off. I have never forgotten the sound." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought under the Warchief, and now I arm those who fight after me. I count it the same service." } },
    warsong = { { id = "tp_ws", text = "Hellscream's clan. They cut the forests of Ashenvale still, and they do not forget him." } },
    grom_hellscream = { { id = "y_tp_grom", text = "Grom freed us from the demons by killing one. No weapon in my racks will ever do as much." } },
    internment = { { id = "y_tp_camps", text = "Eleven years of chains taught me what a weapon is for. Freedom, and nothing less." } },
    _none = { { id = "tp_none", text = "That is beyond me, {class}. I know weapons and those who bear them." } },
  },
}

-- Zendo'jian: troll weapon vendor, Arms of Legend, Valley of Honor.
P:NPC {
  key = "zendojian", id = TODO_NPC("Zendo'jian"), name = "Zendo'jian", title = "Weapon Vendor", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "laughing", "sly" }, values = { "cunning" },
  notices = { "class", "race" },
  impression = {
    first = "Zendo'jian sells weapons at Arms of Legend beside the orc Shoma, and he spins a throwing axe on one finger while he talks. He grins at every customer as if he already knows what they will buy.",
    third = "{name} met Zendo'jian, the Darkspear weapon vendor at Arms of Legend.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, friend! Come see, Zendo'jian save the good stuff for you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey, {class}. Zendo'jian got stuff. Not the good stuff for you, though." },
    { id = "g_default", text = "Hey, {class}, come see what Zendo'jian has for ya. Shoma got the heavy ones, and I got the ones dat fly." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you be back! Either ya lost what I sold you or ya threw it and didn't go fetch it." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear at my rack! Good, now I can talk about spears with someone who won't ask why it isn't an axe." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "Ya got a thrower's wrist, mon, I can see it from here. Come closer and I'll show you something with good balance." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Zendo'jian, of the Darkspear. The orcs make a fine axe, I give them dat, but they think a weapon has to stay in your hand, and a troll knows better." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I got all day and so does the rack." },
        { id = "h_again2", text = "Ask me another, {class}." },
      },
      choices = {
        { text = "Why throw a perfectly good weapon away?", next = "throw" },
        { text = "What's it like selling beside Shoma?", next = "shoma" },
        { text = "Orcs seem to prefer their axes.", next = "orcs" },
        { text = "Teach me something about throwing.", next = "lesson", when = { class = { "HUNTER", "ROGUE", "WARRIOR" } } },
        { text = "Why did you leave the Echo Isles?", next = "y_left" },
        { text = "What worries a Darkspear in this city?", next = "y_worry" },
        { text = "What happened to your uncle with nine axes?", next = "y_uncle" },
        { text = "Stay sharp, Zendo'jian.", next = "END" },
      },
    },
    throw = {
      lines = { { id = "th_default", text = "Because the one ya throw it at stops walking toward you, mon, and that's worth an axe any day. On the islands we hunted raptors with spears, and nobody wanted to be close enough to use a sword on a raptor." } },
      choices = {
        { text = "And if you miss?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "ms_default", text = "Then ya carry a second one, and a third, and ya learn to run backwards. My old uncle carried nine and never once needed the ninth, though I think the raptors just got tired." } },
      choices = { { text = "A patient hunter. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shoma = {
      lines = { { id = "so_default", text = "He be serious as a gravestone, dat one. He told me once that I know spears better than any orc, and then he looked like it hurt him, so I remind him of it every few days to keep him humble." } },
      choices = { { text = "He did mention that. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = {
        { id = "or_orc", when = { race = "Orc" }, text = "Ya do, and no offence meant, you swing them well. I just like to watch an orc's face the first time a little troll knife goes past his ear and into the post." },
        { id = "or_default", text = "They do, and they swing them well, I'm not saying otherwise. But I've sold more throwing axes to orcs dis year than last, so somebody in this valley is learning from the Darkspear." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "ls_default", text = "Don't throw with your arm, throw with your hip, and let go a breath sooner than feels right. Go and ask Hanashi about it too, because he teaches it proper and I only show off." } },
      choices = { { text = "Hip, not arm. Something else.", next = "BACK" } },
    },
    y_left = {
      lines = {
        { id = "y_left_d", text = "Zalazane, mon. When he started bindin' our people with his voodoo, my uncle told me to go to Orgrimmar and make coin, and not to come back till de isles be ours again." },
        { id = "y_left_tr", when = { race = "Troll" }, text = "Same as plenty of us, mon. Zalazane started bindin' minds, and my uncle sent me to Orgrimmar. You know de story. We all be waitin' to go home." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "Dat some orcs still look at a troll like a pet, mon. Shoma don't, but some of dem in de Drag do. One spat at my rack last week. Should I have fought him?" } },
      choices = {
        { text = "Yes. Respect must be defended.", next = "BACK", reply = "Ha! You got a troll's blood in you, mon.", fx = { align = { honor = 1 } } },
        { text = "No. Let it go. Keep the peace.", next = "BACK", reply = "Ya, dat be what Shoma said too.", fx = { align = { honor = -1 } } },
      },
    },
    y_uncle = {
      lines = { { id = "y_uncle_d", text = "My uncle carried nine axes and threw dem all in one fight against de murlocs. He died fetchin' de ninth one, mon. De family say he would have laughed about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, from the Echo Isles, and I hunted before I sold. Now I sell to the hunters and tell them they're doing it wrong." } },
    echo_isles = { { id = "y_tp_ei", text = "De Echo Isles be home, mon. Zalazane be sittin' on it like a fat crab." } },
    shoma = { { id = "y_tp_shoma", text = "Shoma be a good orc. Serious as stone, but good." } },
    _none = { { id = "tp_none", text = "Don't know dat one, mon. If it can't be thrown or stabbed with, it's not my business." } },
  },
}
