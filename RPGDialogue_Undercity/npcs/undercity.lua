-- The Undercity. Voice: bibles/undercity.md
-- Varimathras's later betrayal and the Society's real plans stay unspoken: arrogance and
-- irony only. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sylvanas", id = TODO_NPC("Lady Sylvanas Windrunner"), name = "Lady Sylvanas Windrunner",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "cold" }, values = { "proud", "vengeful" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "The Dark Lady speaks with the patience of someone who has all the time in the world and none of the forgiveness. When she names Arthas, the cold in her voice goes deeper still.",
    third = "{name} stood before Lady Sylvanas Windrunner, the Dark Lady and queen of the Forsaken, in the Royal Quarter of the Undercity.",
  },

  greetings = {
    { id = "g_queen", text = "Before you stands the Dark Lady. Kneel if you like; I won't insist, not today." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "One of my own. You were taken, and you took yourself back; never forget that, because I don't." },
    { id = "g_back", when = { metBefore = true }, text = "Once more you come to me. Speak, then; I have little patience, but I have a great deal of time." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living ally. The Horde has been useful to us, and I trust it remains so; tell your Warchief I said as much." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your elders spoke for us when no one else would, and I don't forget a debt. I don't always repay one, but I don't forget it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest who still prays, and to what, I wonder? Whatever answers you, use it on our enemies." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sylvanas Windrunner, once Ranger-General of Silvermoon and now queen of the Forsaken. Arthas made me this, and one day I will show him what he made." },
        { id = "h_zygand", when = { heardLine = "zygand.h_default" },
          text = "Zygand holds Tirisfal against the Crusade, and good; the zealots should learn that the dead have long memories." },
        { id = "h_hamuul", when = { heardLine = "hamuul.h_default" },
          text = "The tauren Arch Druid spoke for the Forsaken before the Horde, when the orcs would have turned us away. Remember that, when you hear the tauren speak of balance." },
      },
      choices = {
        { text = "What do the Forsaken want?", next = "want" },
        { text = "Tell me about Arthas.", next = "arthas" },
        { text = "I carry the Light, my lady, though it burns.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "I still pray to the Light, my lady.", next = "priest", when = { race = "Scourge", class = "PRIEST" } },
        { text = "I'd serve you from the shadows, my lady.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I served the Cult once, before the end.", next = "cult", when = { race = "Scourge", class = "WARLOCK" } },
        { text = "My people spoke for yours. Was it a mistake?", next = "tauren", when = { race = "Tauren" } },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2 } },
      },
      again = {
        { id = "h_again", text = "You have more to say. Say it." },
        { id = "h_again2", text = "Go on. I'll tell you when I've heard enough." },
      },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "So I'm told. The Light that let Arthas march into Quel'Thalas with a paladin's hammer, and now it answers to my people too. I find that more amusing than holy, but if it burns the Scourge, carry it, and let it hurt." },
        { id = "pa_knight", when = { origin = "forsaken_risen_knight" },
          text = "Silver Hand. Arthas wore your order's colours when he came for my people, and you wore them when he came for you. Remember that, every time it burns." },
      },
      choices = {
        { text = "The Light is mine, not his. I'll prove it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's a weapon, my lady. I'll aim it at him.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Does it trouble you that it still answers us?", next = "paladin_trouble" },
      },
    },
    paladin_trouble = {
      lines = { { id = "pt_default", text = "Trouble me? Nothing that answers the Forsaken troubles me, so long as it answers. What troubles me is anything my people love more than they love their freedom, so don't come to love it too much." } },
      choices = { { text = "I won't, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Do you? The Light watched Silvermoon burn and lifted no finger, and it watched every one of us die. Pray if it comforts you, but when it fails you again, the shadows will still be here, and so will I." } },
      choices = {
        { text = "It hasn't failed me yet, my lady.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. I'll turn to the shadow.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Everyone in my city serves from the shadows, one way or another. Go to the deathstalkers; they need knives that don't hesitate, and they'll tell me whether yours does." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "You're already one of them, I see. Good. My deathstalkers are my eyes in Silverpine and Hillsbrad, and I want to know everything they see, before anyone else does." },
      },
      choices = { { text = "Before anyone else. Understood.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll keep some secrets for myself, my lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } } },
    },
    cult = {
      big = true,
      lines = { { id = "cu_default", text = "Then you knelt to Kel'Thuzad, and you helped spread the plague that made us all. Many of my people would hang you in the Apothecarium for that, and I'm not certain they'd be wrong. Tell me why I shouldn't." } },
      choices = {
        { text = "Because I know how the Scourge thinks. Use me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I owe no one apologies. Least of all the dead.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "I have no reason, my lady. Only regret.", next = "cult_regret" },
      },
    },
    cult_regret = {
      lines = { { id = "cr_default", text = "Regret is a luxury of the living. Make it useful instead: the Cult still crawls in the north, and you know their signs. Bring me their names." } },
      choices = { { text = "You'll have their names.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "That depends on what your elders hoped to gain. Cairne speaks of a cure, and I let him, because his hope bought us a seat in the Horde. If he finds one, I'll consider it. Until then, the debt stands, and I'm aware of it." } },
      choices = {
        { text = "He means it, my lady. There's no bargain in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "And if there is no cure?", next = "tauren_nocure" },
      },
    },
    tauren_nocure = {
      lines = { { id = "tn_default", text = "Then we'll be what we are, and the tauren will have to decide whether they can bear us. I suspect they can; they bore the orcs." } },
      choices = { { text = "...", next = "BACK" } },
    },
    want = {
      big = true,
      lines = {
        { id = "w_default", text = "A home no one can take from us, and freedom from the Lich King's voice. And his ruin, slowly, piece by piece. Is that so much, after what was done to us?" },
      },
      choices = {
        { text = "It isn't.", next = "BACK", fx = { affinity = 2 } },
        { text = "And after that?", next = "after" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "After that is my concern. Yours is to be useful, and you have been, so far." } },
      choices = { { text = "...", next = "END" } },
    },
    arthas = {
      lines = { { id = "ar_default", text = "He burned my people's forests and murdered them in their homes, and then he made me watch, as this. I'll say no more of it, not to you and not to anyone." } },
      choices = {
        { text = "...", next = "END" },
        { text = "What do you remember of Quel'Thalas?", tag = "Persuade", next = "quelthalas",
          check = { pass = { any = { { disposition = { min = 70 } }, { race = "Scourge", disposition = { min = 55 } }, { class = "HUNTER" } } } },
          fail = { next = "quelthalas_no", fx = { affinity = -1 } } },
      },
    },
    quelthalas = {
      lines = {
        { id = "q_default", text = "You are persistent, and today I find I don't mind it. I remember the forests of Eversong, gold even in winter, and my rangers in the trees at the Elfgates, holding them for as long as we could. I remember every one of their names. The dead sleep poorly, and so we do not get to forget." },
        { id = "q_hunter", when = { class = "HUNTER" },
          text = "You carry a bow, so perhaps you'll understand. I was Ranger-General, and my rangers fought him from every tree between the Elfgates and Silvermoon. Some mornings I still reach for a quiver that isn't there." },
      },
      choices = {
        { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 1 } },
        { text = "He'll answer for all of it.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    quelthalas_no = {
      lines = {
        { id = "qn_default", text = "That is not yours to ask. I told you I would say no more, and I meant it." },
        { id = "qn_presume", text = "You presume. Many have, and none of them presumed twice." },
      },
      choices = { { text = "Forgive me, my lady.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Little happens in my kingdom that does not reach me, one way or another. Ask, and I will decide how much of it you need." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You have been useful, and I reward usefulness, so ask what you will, and I'll answer more plainly than is my habit." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer you, briefly, and then you will go." },
    },
    _none = { { id = "tp_none", text = "That isn't my concern. Varimathras will tell you if it should be." } },
  },
}

P:NPC {
  key = "varimathras", id = TODO_NPC("Varimathras"), name = "Varimathras",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "arrogant" }, values = { "proud" },
  notices = { "class", "fel" },
  impression = {
    first = "Varimathras calls himself the Dark Lady's most loyal servant and says he always chooses wisely. He is courteous in the way a cat is courteous to a mouse.",
    third = "{name} met Varimathras, the dreadlord who serves as majordomo to the Dark Lady in the Undercity.",
  },

  greetings = {
    { id = "g_dread", text = "You may approach, slowly. I serve the Dark Lady, and in her name I suffer visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Returned, have you? The Dark Lady finds you useful, and I find you, shall we say, adequate." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A warlock, how charming. You play with the toys of my kind, so do be careful; some of them bite back." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "A paladin, in the Horde? How the world changes, and I find I like it less every year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "You address Varimathras, majordomo to the Dark Lady and her most loyal servant. I keep her city safe from its many enemies, and serve her in all things." },
        { id = "h_deathstalkers", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "The Deathstalkers are the Dark Lady's eyes and blades. Go where they send you and do what they ask, and then tell me what they tell you." },
        { id = "h_hillsbrad", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "The living cling to Hillsbrad like rats to a ship. Help Darthalia sink it." },
        { id = "h_alliance", when = { questActive = TODO_QUEST("An Unholy Alliance") },
          text = "An alliance between our enemies? How very unholy. Break it before it learns to stand." },
      },
      choices = {
        { text = "How did you come to serve her?", next = "serve" },
        { text = "I command demons too, dreadlord.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The Light answers me. Does that trouble you?", next = "paladin", when = { class = "PALADIN" } },
        { text = "What does a dreadlord make of the arcane?", next = "mage", when = { class = "MAGE" } },
        { text = "I'll go.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Still here? How very persistent you are, so ask, then, and be quick about it." },
        { id = "h_again2", text = "Another question. The Dark Lady's servants are endlessly curious, I find." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "You command imps and voidwalkers, the smallest and most grateful of my kind, and you call that commanding. How sweet. Do tell me if anything larger ever answers you; I'd so like to know who it is." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll who whispers into the Nether. Your people's spirits must be terribly jealous. Do tell me what you hear; I may recognize the voice." },
      },
      choices = {
        { text = "I'll tell the Dark Lady first, dreadlord.", next = "BACK", fx = { affinity = -2, align = { order = 1 } } },
        { text = "And if something larger answers, I'll come to you.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Trouble me? It offends me, which is not the same thing. The Light is so very loud, and it insists on itself everywhere. Do keep it sheathed in my presence, and we'll get along as well as anyone does with me." } },
      choices = {
        { text = "The Light goes where I go, dreadlord.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "As you wish. I'll keep it sheathed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "A clever little tool, the arcane, and the Highborne were so very proud of it once. My kind found their pride most useful. I'd study it with care, if I were you, and wonder now and then who else is reading over your shoulder." } },
      choices = { { text = "I'll keep my books closed, then.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    serve = {
      big = true,
      lines = {
        { id = "s_default", text = "She defeated my brothers and me, and offered me a choice, and I chose wisely. I always choose wisely; it's my particular talent." },
      },
      choices = {
        { text = "That's not quite an answer.", next = "answer", fx = { trait = { skeptical = 1 } } },
        { text = "A wise choice.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    answer = {
      lines = { { id = "an_default", text = "That is precisely the answer you're getting. Now go and be useful elsewhere." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything in this city passes through my hands on its way to the Dark Lady, faithfully, as always. Ask, and I will share what she would wish you to know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "The Dark Lady values you, and therefore so do I, naturally. Ask me anything you like." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer, though purely out of loyalty to my queen, which, I assure you, is boundless." },
    },
    _none = { { id = "tp_none", text = "That is beneath my notice, and possibly beneath yours. Ask an apothecary." } },
  },
}

P:NPC {
  key = "faranell", id = TODO_NPC("Master Apothecary Faranell"), name = "Master Apothecary Faranell",
  bible = "bibles/undercity.md", role = "scholar", tier = "major",
  communities = { "undercity" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "craft", "race" },
  impression = {
    first = "Everything in the Apothecarium delights Master Apothecary Faranell, including the living, purely academically. His cheer is so bright that it takes a moment to notice what he is actually brewing.",
    third = "{name} met Master Apothecary Faranell, the gleeful head of the Royal Apothecary Society in the Undercity.",
  },

  greetings = {
    { id = "g_lab", text = "Welcome, welcome, to the Apothecarium! Mind the green, and mind the purple, too; actually, mind all the colours." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, my errand-runner! Do you have my reagents? Oh, you do, splendid; science thanks you!" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist, a kindred spirit! Well, a spirit, anyway, and we all have those here, but a kindred one! Let's compare tinctures some time." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living, how wonderful! Your blood is so very full of possibilities... purely academically, of course." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Faranell, Master Apothecary, master of every bottle in this room, keeper of the Royal Apothecary Society's finest work, at your service! The Dark Lady wants weapons against the Scourge, and I make them, and it's a joy." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "Bear hearts, spider blood, a journal from Pyrewood and a bit of murloc tumour: bring me everything on the list. Together they make something wonderful, for the Scourge, naturally." },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Lydon's colloid, applied correctly, and then a few reagents to wake the mixture! Don't sniff it, though; Lydon sniffed it, and Lydon has been melancholy ever since." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "Lydon, in Tarren Mill? Yes, yes, a brilliant mind and terrible company. He named his frog, and I told him not to name the frog!" },
      },
      choices = {
        { text = "What are you making?", next = "making" },
        { text = "I need poisons for my blades. Can you help?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I trained in Dalaran. Your work is a kind of magic.", next = "mage", when = { class = "MAGE" } },
        { text = "Do your brews work on demons?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "My people's elders treat the Forsaken. Do you work with them?", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Quickly, the green flask is making that noise again!" },
        { id = "h_again2", text = "More questions! How delightful. Ask away, and don't touch anything." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Help? My dear, the Society practically invented half the poisons on your belt! Crippling, mind-numbing, the deadly ones, all far too crude, of course. Bring me spider venom from Silverpine and I'll show you what a real toxin looks like." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker! My favourite customers; you always bring the bottles back empty. Do tell your captains the new batch is ready, and that it was very nearly an accident." },
      },
      choices = {
        { text = "Show me, then. The stronger the better.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I'll keep to the crude ones. Clean kills only.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Magic? Oh, don't let the Magic Quarter hear you say that, they're terribly territorial. Alchemy is the honest sister of your art: no incantations, no glowing hands, only what happens when you put two things together that shouldn't be." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran! Then you'll know the Kirin Tor never let the alchemists past the second floor of the Violet Citadel. Well, now we have a whole city, and they have a dome, and I know which I prefer." },
      },
      choices = { { text = "Two things that shouldn't be. I like that.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "I haven't the faintest idea, and I'd adore finding out! Lend me your imp for an afternoon, nothing dangerous, I swear, and we'll both learn something. Well, I will, at least; I can't promise the imp will be learning." } },
      choices = {
        { text = "Take the imp. It's been mouthy anyway.", next = "BACK", fx = { affinity = 2, trait = { cruel = 1 } } },
        { text = "My imp is not your test subject.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Magatha's remedies! Yes, yes, the Society and the Grimtotem crone have an arrangement, very cordial, very scientific. Her herbs make my patients remember the taste of bread, and I make notes. Whether it's a cure, well, that's a big word, and I'm a careful man." } },
      choices = {
        { text = "Careful? You?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "I hope it works.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    making = {
      big = true,
      lines = {
        { id = "m_default", text = "A cure, of sorts, for the Scourge problem: something that kills what can't be killed! The Dark Lady is very particular about who it's used on, and so am I. Mostly." },
      },
      choices = {
        { text = "Only on the Scourge?", next = "only", fx = { trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    only = {
      lines = { { id = "o_default", text = "What a suspicious mind you have, and I like it; you'd make a fine apothecary. Now run along." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I collect information the way I collect reagents: eagerly, and without asking too closely where it came from! Pick something, anything." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into water? Oh, I'd give a great deal for a sample. Helbrim is being very slow about it." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid! My department is bubbling, so do excuse me." } },
  },
}

P:NPC {
  key = "bethor", id = TODO_NPC("Bethor Iceshard"), name = "Bethor Iceshard",
  bible = "bibles/undercity.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold" }, values = { "pragmatic", "loyal" },
  notices = { "class" },
  impression = {
    first = "Bethor Iceshard still carries the wand from an apprentice's oath, though one of the friends who swore it sold himself to the Lich King. He says he has grown cold, and I believe him, though not entirely.",
    third = "{name} met Bethor Iceshard in the Magic Quarter, a Forsaken mage haunted by an old friend who became a lich.",
  },

  greetings = {
    { id = "g_magic", text = "The Magic Quarter. Knowledge is the only weapon the Forsaken never had to dig out of a grave. What do you need?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Dalaran taught me, before, and now I teach. The lessons have grown colder, and so have I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "My name is Bethor Iceshard. I studied at Dalaran with two friends, and we crossed our wands as apprentices and swore we'd always stand together. One of them sold his soul to the Lich King, and his name was Thule Ravenclaw." },
        { id = "h_renferrel", when = { heardLine = "renferrel.h_default" },
          text = "Renferrel's work in Silverpine keeps turning up my old friend's name. I'd rather it didn't, but I'd rather know than not." },
        { id = "h_prodigal", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Somewhere out there, a lich calls himself by an old friend's name. Find out if it's true, though I'd rather it weren't." },
        { id = "h_returns", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich Returns") },
          text = "It's Thule, truly him. End it, and bring me his head, and the last thing I owe him will be paid." },
        { id = "h_returns_done", when = { questDone = TODO_QUEST("The Prodigal Lich Returns") },
          text = "So he's gone. I thought I'd feel something, but all I felt was the wand in my pocket, and I still carry it." },
      },
      choices = {
        { text = "What happened to Thule?", next = "thule" },
        { text = "I studied in Dalaran too. Do you miss it?", next = "mage", when = { class = "MAGE", race = "Scourge" } },
        { text = "An orc mage. What does Dalaran's man make of that?", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I made bargains for power, as Thule did.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The Quarter is quiet; ask." },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Every day, and I'd never go back. They'd cast a cleansing on me at the gate and call it kindness. What I miss is the people I studied beside, and most of those are dead or worse." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "You were an apprentice there when the plague came, weren't you? Then you were in the same lecture halls Thule and I sat in, a few years later. I find I'm glad of the company." },
      },
      choices = {
        { text = "Dalaran abandoned us. Let it stay behind its walls.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "One day the Kirin Tor may welcome us back.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    orcmage = {
      lines = { { id = "om_default", text = "That Dalaran spent a war telling us orcs couldn't learn anything but the axe and the fel, and here you are, proving us wrong in the Undercity of all places. Learn carefully; the arcane rewards patience, and it punishes hunger." } },
      choices = { { text = "Patience, not hunger. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "As Thule did? He sold himself whole, and you rent pieces of yourself by the hour, but the ledger is kept by the same people. I don't judge you for it, but I'll be watching what you trade, because I didn't watch him, and I should have." } },
      choices = {
        { text = "Watch, then. I know where my line is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thule was weak. He sold too cheaply.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    thule = {
      big = true,
      lines = {
        { id = "t_default", text = "He wanted power more than he wanted us, and when the plague came he traded everything for it. I died and came back, while he sold himself and stayed sold. Between us, I know which I'd choose." },
      },
      choices = { { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Research it; that's what we do here." } },
  },
}

P:NPC {
  key = "norman", id = TODO_NPC("Innkeeper Norman"), name = "Innkeeper Norman",
  bible = "bibles/undercity.md", role = "innkeeper", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "hospitable" },
  notices = { "race", "weary" },
  impression = {
    first = "What Innkeeper Norman really sells is a chair and a place of one's own to people who no longer sleep. Nobody takes anyone's chair down there, he says, and he guards that last courtesy kindly.",
    third = "{name} found a chair at Innkeeper Norman's inn by the Trade Quarter, one of the few homely corners of the Undercity.",
  },

  greetings = {
    { id = "g_rest", text = "Sit yourself down and put your feet up, whatever state they're in. Mine have seen better centuries." },
    { id = "g_home", when = { homeInn = { "Undercity" } }, text = "Back under the city, then. Your bed's where you left it, and so's the damp." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living guest! I keep bread back for your sort, and it's fresh, too. Well, fresh-ish, but it's the freshest in the Undercity." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Bits of you are missing. Oh, wait, you're alive, it's just armour; sit down and I'll find you something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Norman, and I keep the inn by the Trade Quarter. We don't sleep, most of us, but we like a chair and a place that's ours, and that's what I sell, really." },
        { id = "h_chair", when = { metBefore = true }, text = "Your chair's still there, and nobody's taken it. Nobody takes anyone's chair down here; it's the last courtesy we keep." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask in the Apothecarium, since they know all sorts, but don't drink anything they offer." } },
  },
}
