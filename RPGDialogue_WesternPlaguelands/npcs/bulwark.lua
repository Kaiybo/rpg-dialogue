-- The Bulwark: the Forsaken wall between Tirisfal and the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "derrington", id = TODO_NPC("High Executor Derrington"), name = "High Executor Derrington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "bulwark" }, temper = { "sharp", "steady" }, values = { "practical", "cunning" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_wall", text = "The Bulwark. Junk and timber and the stubbornness of the dead. Speak quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back through the gate. Not everyone does. Report." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "The cauldron-breaker. The Dark Lady has your name. Try to deserve it twice." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of our living allies. You'll want to sleep with your mouth covered. The air out there gets into the breathing." },
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "PRIEST" } },
      text = "You deal in the dark arts. Good. Out here, delicacy is a luxury and the Scourge has no shortage of corpses to argue with." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "High Executor Derrington. In Undercity they scheme over who sits nearest the throne. Here we scheme over who stays standing until morning. I prefer our kind of politics." },
        { id = "h_cauldrons", tags = { "news" }, when = { questActive = TODO_QUEST("The Scourge Cauldrons") },
          text = "Four cauldrons in the west spew plague for the Scourge, and Shadow Priestess Vandis has a plan for them. Do what she says. Don't ask her about the Light." },
        { id = "h_diversion", tags = { "news" }, when = { questActive = TODO_QUEST("Scarlet Diversions") },
          text = "The Crusade's camped between Felstone Field and Dalson's Tears. Burn their command tent and plant this Scourge banner in the ashes. Let the dead and the zealots tire each other out." },
        { id = "h_diverted", when = { questRecent = { TODO_QUEST("Scarlet Diversions"), days = 3 } },
          text = "My scout reports the Crusade took the bait. They're hunting ghouls with great enthusiasm. I almost admire them." },
        { id = "h_towers", tags = { "news" }, when = { questActive = TODO_QUEST("All Along the Watchtowers") },
          text = "Andorhal's towers direct their troops. Mark them with the beacon. We have one torch and five charges, and I'm told the charges are not refundable." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner sits at the heart of Andorhal. A lich. Take allies, take his phylactery, and take your time dying if you must. Just not before he does." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "Araj is destroyed. The Dark Lady will be told it was the Bulwark's doing. You'll be mentioned. Briefly. That's how glory works in Undercity." },
        { id = "h_living", when = { metBefore = true },
          text = "Our living allies eat three times a day and want thanks for it. I don't mind. It reminds me what we're guarding." },
      },
      choices = {
        { text = "Why play the Crusade against the Scourge?", next = "play", when = { questBefore = TODO_QUEST("Mission Accomplished!") } },
        { text = "What's the Bulwark, exactly?", next = "wall" },
        { text = "Send me east.", next = "END", fx = { affinity = 1, standing = { bulwark = 1 } } },
      },
    },
    play = {
      big = true,
      lines = {
        { id = "p_default", text = "Because I have one wall and not enough soldiers for two wars. The Crusade would kill every Forsaken; the Scourge would kill everything. Busy killing each other, they aren't killing us." },
      },
      choices = {
        { text = "Clever.", next = "END", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "There's no honor in it.", next = "honor" },
      },
    },
    honor = {
      lines = {
        { id = "ho_default", text = "Honor. Yes, I remember it. I had some, when I was alive and losing. I've found I like winning better." },
      },
      choices = { { text = "Fair enough.", next = "END", fx = { align = { honor = 1 } } } },
    },
    wall = {
      lines = {
        { id = "w_default", text = "When Capital City fell, the survivors fled here, to Uther's camp. Now it's our wall of debris, enough to keep the mindless out of Tirisfal. It wouldn't stop an army; we do that." },
      },
      choices = { { text = "Then I'll help hold it.", next = "END", fx = { affinity = 2, standing = { bulwark = 1 } } } },
    },
  },

  topics = {
    andorhal = { { id = "tp_andorhal", text = "Where the Scourge gathers in the west, under a lich. Break it, and the west is ours to reclaim. For the Dark Lady." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Fanatics from Hearthglen. Useful fanatics, when pointed the right way." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "The Lich King's breath on the land. Vandis and Dithers mean to sour it." } },
    _none = { { id = "tp_none", text = "Does it come over the wall? No? Then take it to Undercity. They have time for such things." } },
  },
}

P:NPC {
  key = "vandis", id = TODO_NPC("Shadow Priestess Vandis"), name = "Shadow Priestess Vandis",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark" }, temper = { "sharp" }, values = { "practical", "faithless" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_dry", text = "Speak. I'm listening. I'm also counting your fingers. Habit." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the farms. Did you bring me something foul?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Another priest. Holy or shadow? Don't answer. Out there they both kill ghouls. That's the only sermon I believe in." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, praying to the Earth Mother at the edge of the Plaguelands. She's not listening here. Nothing is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadow Priestess Vandis. Bring me a sample from each of the four cauldrons, and the apothecaries will turn the plague on its makers. That's all the miracle we're getting." },
        { id = "h_sample", tags = { "news" }, when = { questActive = TODO_QUEST("Return to the Bulwark") },
          text = "You have a bottle. Hand it over, carefully. Dithers will have it opened, smelled and argued with before you've found a place to sit." },
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to the Bulwark"), days = 2 } },
          text = "Dithers is pleased with your sample. He hummed. I've never heard him hum. It was unsettling." },
        { id = "h_faith", when = { metBefore = true },
          text = "When I was alive I prayed to the Light, and once it answered. When I died I prayed again. Nothing. I learned to stop asking and start taking." },
      },
      choices = {
        { text = "Why shadow, not the Light?", next = "shadow" },
        { text = "I'll fetch your samples.", next = "END", fx = { affinity = 1, standing = { bulwark = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    shadow = {
      big = true,
      lines = {
        { id = "s_default", text = "The Light chose who it would stay with when the plague came. It wasn't us. The shadow doesn't choose. It's there for anyone willing to reach. I reached." },
      },
      choices = {
        { text = "The Light may still answer you.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Reaching works.", next = "END", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
  },

  topics = {
    plague_cauldrons = { { id = "tp_cauldrons", text = "Kill the cauldron lord, take his key, fill a bottle. Simple, if you don't count dying." } },
    _none = { { id = "tp_none", text = "I don't care to guess. Ask Derrington. He enjoys knowing things." } },
  },
}

P:NPC {
  key = "dithers", id = TODO_NPC("Apothecary Dithers"), name = "Apothecary Dithers",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark", "apothecarium" }, temper = { "jovial" }, values = { "curious", "morbid" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_knee", text = "Weather's turning. My knee says so. The bit of it that's showing, anyway." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite courier! Don't tell the others. I don't have others. Don't tell them anyway." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Come, smell this. No? Wise. I can't smell much anymore, which is a professional advantage." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Living, are you? Don't lick anything out here. I say that to everyone. Living people never listen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Dithers, of the Royal Apothecary Society, on loan to the Bulwark. I make the counter agent for the cauldrons, sell the quickener, and I'm building a key to the Scholomance out of bones. It's a busy afterlife." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "Skeletal fragments, the sturdier the better. Andorhal's skeletons are lovely and dense. Don't tell them I said so." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "A goblin in Gadgetzan, Krinkle Goodsteel, makes molds for the unspeakable. Bring him the fragments and your purse. Mostly your purse." },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "Araj ran the Scholomance before he moved to Andorhal. His scarab should fit the door like a ring on a finger. A dead finger. You know what I mean." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You've the key! Bring me back a souvenir. A note, a bone, a recipe. Not a student. Students follow you home." },
        { id = "h_knee", when = { metBefore = true },
          text = "I can tell a storm three days off by the ache in my knee, two if it's the exposed bit. The Society wanted to study it. They can have it when I'm done with it." },
      },
      choices = {
        { text = "How does the counter agent work?", next = "agent" },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
    },
    agent = {
      lines = {
        { id = "a_default", text = "Every cauldron brews its own stew; we find what makes it sing and add a note that sours it. Quickener, runecloth and the right bits of the right dead. The quickener spoils in half an hour, so run.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = { { text = "Fascinating.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "A school. Of necromancy. Imagine the library. No, don't. I've imagined it. I didn't sleep. Well, I don't sleep. But I'd have stopped." , fx = { learn = { "scholomance" } } } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "My life's work, this month. Next month it'll be something else that wants to kill everyone." } },
    _none = { { id = "tp_none", text = "Couldn't say. My knee doesn't know either." } },
  },
}

P:NPC {
  key = "alexi", id = TODO_NPC("Alexi Barov"), name = "Alexi Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "bulwark" }, temper = { "proud", "sharp" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_bored", text = "Mm? Oh. Another one. Do try to be interesting." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you've brought me something that isn't your face." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, freed by the Dark Lady like me. Of course, I was a Barov before I was a corpse. You were... never mind, I don't need to know." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is a disgrace. Bring me my fortune and you can buy better. You'll still be a peasant, but a well-dressed one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alexi Barov. The family sold its soul to Kel'Thuzad, and I'm the one who got free of him. My brother Weldon kept his breath, and now he thinks he gets the money too.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "Four deeds, lost somewhere in the Scholomance. Caer Darrow, Brill, Tarren Mill, Southshore. Fetch them. Don't read them. You'll only feel poor." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "My brother hides at Chillwind Camp, behind the Alliance's skirts. Slay him. Bring me his head. Do hurry; I'm told heads go off." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "Weldon's gone, then. He spared me once, you know. Sentimental fool. I've no such weakness. I checked." },
        { id = "h_signet", when = { metBefore = true },
          text = "I still wear the family signet. My fingers are thinner now; I had it sized. A Barov keeps up appearances. Even this one." },
      },
      choices = {
        { text = "He spared your life. Doesn't that matter?", next = "spared" },
        { text = "What's in it for me?", next = "pay" },
        { text = "I'll look for the deeds.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    spared = {
      big = true,
      lines = {
        { id = "s_default", text = "He looked at me and couldn't do it: squeamishness, not mercy. If he'd finished me, he'd have his fortune. That's his mistake, not my debt." },
      },
      choices = {
        { text = "That's cold, even for the dead.", next = "END", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Understood.", next = "END", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    pay = {
      lines = {
        { id = "p_default", text = "Gold. A great deal of it. More than you've seen in one place, I'd wager, and I would know: I've seen your boots." },
      },
      choices = { { text = "Deal.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "Home. Father turned it into a school for necromancers. The tuition was everyone we knew." } },
    _none = { { id = "tp_none", text = "How tedious. Does it have money in it? No? Then why are we talking?" } },
  },
}

P:NPC {
  key = "garush", id = TODO_NPC("Argent Officer Garush"), name = "Argent Officer Garush",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark", "argent_dawn" }, temper = { "steady" }, values = { "honorable", "fair" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_dawn", text = "For the Dawn. Say it with me. It gets easier." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You've stones for me, or a story. I'll take either." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc. Then you know what it is to be a weapon someone else aimed. The Dawn aims at one thing only. I like that." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Shaman. The spirits are sick here. You'll feel it. Fight anyway. They'll thank you when they're well." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Officer Garush, orc, Horde-born, and soldier of the Argent Dawn: every race, one enemy. I fought for the Horde all my life. Now I fight for everybody." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission. The dead out there carry scourgestones, what's left of the will that drives them. Bring them here. Every stone is one less thing walking." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "A report from Everlook? Gregor's hand. He writes small. I read slow. We get there." },
        { id = "h_pureheart", when = { metBefore = true },
          text = "Pureheart's at Chillwind, on the Alliance side, and we write each other. Ten years ago one of us would've killed the other. Now we argue about rations." },
      },
      choices = {
        { text = "Why join the Dawn?", next = "why" },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I had years in the camps after the war to think. When I got out, I wanted a fight to be proud of. The Scourge is the only enemy everyone agrees on, and that's rare.", fx = { learn = { "argent_dawn" } } },
      },
      choices = {
        { text = "That's honorable.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Horde needs you more.", next = "END", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_dawn", text = "No kings, no warchiefs. Just the dead, and the people who won't let them win." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Derrington. He knows everything and tells you half." } },
  },
}
