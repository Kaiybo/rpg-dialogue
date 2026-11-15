-- The Bulwark: the Forsaken wall between Tirisfal and the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "derrington", id = TODO_NPC("High Executor Derrington"), name = "High Executor Derrington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "bulwark" }, temper = { "sharp", "steady" }, values = { "practical", "cunning" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_wall", text = "This is the Bulwark, built of junk and timber and the stubbornness of the dead, so speak quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back through the gate, which not everyone manages. Report, then." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "The cauldron-breaker returns, and the Dark Lady has your name now. Try to deserve it a second time." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of our living allies, I see. You'll want to sleep with your mouth covered; the air out there gets into the breathing." },
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "PRIEST" } },
      text = "You deal in the darker arts, and good. Out here delicacy is a luxury, and the Scourge has no shortage of corpses to argue with." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "High Executor Derrington. In Undercity they scheme over who sits nearest the throne, and here we scheme over who stays standing until morning, and I much prefer our kind of politics." },
        { id = "h_cauldrons", tags = { "news" }, when = { questActive = TODO_QUEST("The Scourge Cauldrons") },
          text = "Four cauldrons in the west spew plague for the Scourge, and Shadow Priestess Vandis has a plan for them. Do as she says, and whatever you do, don't ask her about the Light." },
        { id = "h_diversion", tags = { "news" }, when = { questActive = TODO_QUEST("Scarlet Diversions") },
          text = "The Crusade's camped between Felstone Field and Dalson's Tears, so burn their command tent and plant this Scourge banner in the ashes. Let the dead and the zealots wear each other out for a change." },
        { id = "h_diverted", when = { questRecent = { TODO_QUEST("Scarlet Diversions"), days = 3 } },
          text = "My scout reports that the Crusade took the bait, and they're hunting ghouls with tremendous enthusiasm. I very nearly admire them for it." },
        { id = "h_towers", tags = { "news" }, when = { questActive = TODO_QUEST("All Along the Watchtowers") },
          text = "Andorhal's towers direct their troops, so mark each of them with the beacon. We have one torch and five charges, and I'm told the charges are not refundable." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner is a lich, and he sits at the heart of Andorhal. Take allies, take his phylactery, and take your time dying if you must, only not before he does." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "Araj is destroyed, and the Dark Lady will be told it was the Bulwark's doing. You'll be mentioned too, briefly, which is how glory works in Undercity." },
        { id = "h_living", when = { metBefore = true },
          text = "Our living allies eat three times a day and expect thanks for it. I don't mind, really, since it reminds me what we're guarding." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it useful, and make it quick." },
        { id = "h_again2", text = "Go on, the wall can spare me for another minute." },
      },
      choices = {
        { text = "Why play the Crusade against the Scourge?", next = "play", when = { questBefore = TODO_QUEST("Mission Accomplished!") } },
        { text = "What's the Bulwark, exactly?", next = "wall" },
        { text = "What's to be done about Andorhal?", next = "andorhal" },
        { text = "You don't think much of Undercity's politics.", next = "politics" },
        { text = "We both serve the Dark Lady, Executor.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do the Forsaken truly trust the living here?", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "Send me east.", next = "END", fx = { affinity = 1, standing = { bulwark = 1 } } },
      },
    },
    play = {
      big = true,
      lines = {
        { id = "p_default", text = "Because I have one wall and not nearly enough soldiers for two wars. The Crusade would kill every Forsaken and the Scourge would kill everything, so while they're busy killing each other, they aren't killing us." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Waiting for your enemies to kill each other is a coward's game.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "There's no honor in it.", next = "honor" },
      },
    },
    honor = {
      lines = {
        { id = "ho_default", text = "Honor, yes, I remember it well enough. I had plenty of it when I was alive and losing, and I've since found I like winning a great deal better." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep mine, all the same.", next = "BACK", fx = { align = { honor = 1 }, trait = { stubborn = 1 } } },
      },
    },
    wall = {
      lines = {
        { id = "w_default", text = "When Capital City fell, the survivors fled here, to Uther's camp, and now it's our wall of debris, enough to keep the mindless out of Tirisfal. It wouldn't stop an army, of course, which is what we're for." },
      },
      choices = {
        { text = "Uther's camp?", next = "wall_uther" },
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, standing = { bulwark = 1 } } },
      },
    },
    wall_uther = {
      lines = {
        { id = "wu_default", text = "The living gathered here once under the Lightbringer's banner, and some of them are still here, after a fashion, standing on the other side of the gate. I find that history has a sense of humor, if not a kind one." },
      },
      choices = {
        { text = "That's grim.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    andorhal = {
      lines = {
        { id = "a_default", text = "Andorhal is where the Scourge gathers its strength in the west, under a lich who once ran the Scholomance. Break that city and the farms beyond it are ours to take back, for the Dark Lady.", fx = { learn = { "andorhal" } } },
      },
      choices = {
        { text = "Tell me about the lich.", next = "andorhal_araj" },
        { text = "Something else.", next = "BACK" },
      },
    },
    andorhal_araj = {
      lines = {
        { id = "aa_default", text = "Araj the Summoner keeps his life bound up in a phylactery, as liches do, so bring me that along with the news of his death. I'll rest easier with it in my hands than in his." },
      },
      choices = {
        { text = "I'll bring the phylactery.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    politics = {
      lines = {
        { id = "po_default", text = "In the Royal Quarter they count favors, and here we count arrows, and I know which sum keeps Tirisfal safe. Let them have their whispering, so long as they keep sending me supplies." },
      },
      choices = {
        { text = "They'd hear that as disloyalty.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "We do, and she freed us both from the same master, so I'll expect more of you than of the living. The Scourge out there was us, once, and they'd make us theirs again given half a chance." },
      },
      choices = {
        { text = "Never again.", next = "BACK", fx = { affinity = 2, standing = { bulwark = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = {
        { id = "li_default", text = "Trust is a large word for such a small wall. Your people fight out there beside mine and die beside them too, and for now that's all the trust either of us needs." },
      },
      choices = {
        { text = "That will do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that comes over this wall crosses my desk first, and I remember all of it. Ask about these, and keep it useful." },
    },
    background = { { id = "tp_ba", text = "I died, I rose, and the Dark Lady gave me back my mind and a wall to hold. The rest isn't your concern." } },
    advice = { { id = "tp_ad", text = "Burn whatever you kill out there, if you've the time. The Scourge wastes nothing, and neither should you." } },
    andorhal = { { id = "tp_andorhal", text = "That's where the Scourge gathers in the west, under a lich, and if we break it, the west is ours to reclaim for the Dark Lady.", next = "andorhal" }, { id = "tp_andorhal2", text = "It's east of the wall, and it's the one place I'd send my best and expect to lose some." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They're fanatics from Hearthglen, and useful fanatics, when they're pointed the right way." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "The cauldrons are the Lich King's breath on the land, and Vandis and Dithers mean to sour it." } },
    _none = { { id = "tp_none", text = "Does it come over the wall? If not, take it to Undercity, where they have time for such things." } },
  },
}

P:NPC {
  key = "vandis", id = TODO_NPC("Shadow Priestess Vandis"), name = "Shadow Priestess Vandis",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark" }, temper = { "sharp" }, values = { "practical", "faithless" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_dry", text = "Speak, I'm listening, though I'm also counting your fingers, out of habit." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the farms, are you? I hope you've brought me something foul." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Another priest, holy or shadow, and don't bother telling me which. Out there they both kill ghouls, and that's the only sermon I believe in." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, praying to the Earth Mother at the edge of the Plaguelands. She isn't listening here, I'm afraid, and neither is anything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadow Priestess Vandis. Bring me a sample from each of the four cauldrons and the apothecaries will turn the plague on its makers, which is all the miracle we're likely to get." },
        { id = "h_sample", tags = { "news" }, when = { questActive = TODO_QUEST("Return to the Bulwark") },
          text = "You have a bottle, so hand it over carefully. Dithers will have it opened, sniffed and argued with before you've found somewhere to sit." },
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to the Bulwark"), days = 2 } },
          text = "Dithers is pleased with your sample, and he actually hummed. I've never heard him hum before, and I found it rather unsettling." },
        { id = "h_faith", when = { metBefore = true },
          text = "When I was alive I prayed to the Light, and once it answered me. When I died I prayed again and heard nothing, so I learned to stop asking and start taking." },
      },
      again = {
        { id = "h_again", text = "Is there more? Ask it, then, I've samples waiting." },
        { id = "h_again2", text = "Still curious? It won't save you out there, but go on." },
      },
      choices = {
        { text = "Why shadow, not the Light?", next = "shadow" },
        { text = "How do the samples help?", next = "samples" },
        { text = "What do you make of Derrington?", next = "derrington" },
        { text = "I'm a priest too. Does the shadow cost much?", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll fetch your samples.", next = "END", fx = { affinity = 1, standing = { bulwark = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    shadow = {
      big = true,
      lines = {
        { id = "s_default", text = "The Light chose who it would stay with when the plague came, and it wasn't us. The shadow doesn't choose; it's there for anyone willing to reach for it, and I reached." },
      },
      choices = {
        { text = "The Light may still answer you.", next = "faith", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Reaching works.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    faith = {
      lines = {
        { id = "fa_default", text = "Perhaps it might, and perhaps the cauldrons will empty themselves out of shame. I've a great deal of work to do in the meantime, and I'd rather not wait on either of them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    samples = {
      lines = {
        { id = "sa_default", text = "Every cauldron brews its plague a little differently, so the apothecaries need a taste of each before they can spoil it. You kill the cauldron lord, take his key, fill the bottle, and we do the rest.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "And Dithers does the spoiling?", next = "dithers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dithers = {
      lines = {
        { id = "di_default", text = "Dithers does the spoiling, and the talking, and occasionally the singing. He's the best apothecary the Society could spare, and I suspect they were glad to spare him." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    derrington = {
      lines = {
        { id = "de_default", text = "He's clever and cold and he never wastes a soldier, which is rare in a commander, living or dead. I don't like him much, but I'd follow him." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "It costs exactly what you let it, and no more, whatever the priests in the cathedrals told you. Keep your wits and keep your purpose, and it'll serve you better than the Light ever served me." },
      },
      choices = {
        { text = "I still trust the Light.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I listen more than I pray these days, and I hear plenty. These I'll speak to, if you're asking." },
    },
    background = { { id = "tp_ba", text = "I prayed to the Light when I was alive, and then I was dead, and now I'm a priestess of something that actually answers. That's all the story there is.", next = "shadow" } },
    advice = { { id = "tp_ad", text = "Don't pray aloud where the dead can hear you out there, for they've learned what the sound means." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "Kill the cauldron lord, take his key and fill a bottle, which is simple enough, if you don't count the dying." } },
    _none = { { id = "tp_none", text = "I don't care to guess, so ask Derrington, who enjoys knowing things." } },
  },
}

P:NPC {
  key = "dithers", id = TODO_NPC("Apothecary Dithers"), name = "Apothecary Dithers",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark", "apothecarium" }, temper = { "jovial" }, values = { "curious", "morbid" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_knee", text = "Weather's turning, my knee says so, or at least the bit of it that's still showing does." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite courier! Don't tell the others, though I don't have any others, so don't tell them anyway." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, how lovely, come and smell this! No? Very wise, though I can't smell much at all anymore, which in my line of work is a real advantage." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Living, are you? Then don't lick anything out here, which I say to everyone, and which the living never listen to." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Dithers, of the Royal Apothecary Society, on loan to the Bulwark. I make the counter agent for the cauldrons and sell the quickener, and I'm building a key to the Scholomance out of bones, so it's a busy sort of afterlife." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "Skeletal fragments, please, and the sturdier the better. Andorhal's skeletons are lovely and dense, but don't tell them I said so." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "There's a goblin in Gadgetzan, Krinkle Goodsteel, who makes molds for the unspeakable. Bring him the fragments and your purse, and mostly your purse." },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "Araj ran the Scholomance before he moved to Andorhal, so his scarab ought to fit that door like a ring on a finger. A dead finger, naturally, but you know what I mean." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You've got the key! Bring me back a souvenir, would you, a note or a bone or a recipe, only not a student, please. Students follow you home." },
        { id = "h_knee", when = { metBefore = true },
          text = "I can tell a storm three days off by the ache in my knee, or two if it's the exposed bit. The Society wanted to study it, and they can have it when I'm finished with it." },
      },
      again = {
        { id = "h_again", text = "More questions? Marvelous, I love questions, they're so much tidier than answers." },
        { id = "h_again2", text = "Yes, yes, what else? Mind the green bottle, it's in a mood." },
      },
      choices = {
        { text = "How does the counter agent work?", next = "agent" },
        { text = "Tell me about this key.", next = "key" },
        { text = "How's the knee?", next = "knee" },
        { text = "What's in your quickener?", next = "alch", when = { profession = "Alchemy" } },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
    },
    agent = {
      lines = {
        { id = "a_default", text = "Every cauldron brews its own stew, so we find what makes it sing and add a note that sours it, quickener and runecloth and the right bits of the right dead. The quickener spoils in half an hour, though, so you'll have to run.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "Why does it spoil so fast?", next = "agent_quick" },
        { text = "Fascinating.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    agent_quick = {
      lines = {
        { id = "aq_default", text = "Because anything strong enough to quicken a reaction is strong enough to quicken itself right out of usefulness. It's like the living, really, burning bright and going off in no time at all." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    key = {
      lines = {
        { id = "k_default", text = "The Scholomance won't open for just anyone, so we make a key it can't refuse, out of the bones of the dead it already knows. A goblin pours the mold, a volcano sets it, and Araj's scarab gives it the right face." },
      },
      choices = {
        { text = "Who's this goblin?", next = "key_krinkle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    key_krinkle = {
      lines = {
        { id = "kk_default", text = "Krinkle Goodsteel, a smith in Gadgetzan, who'll make anything at all if you pay him enough, and he always asks for enough. I've never met him, but I admire his total lack of curiosity." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    knee = {
      lines = {
        { id = "kn_default", text = "It's very well, thank you for asking, and nobody ever does. Part of it is gone, which helps with the forecasting, and the rest of it creaks in a way I find quite companionable." },
      },
      choices = {
        { text = "Glad to hear it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alch = {
      lines = {
        { id = "al_default", text = "Ah, a fellow professional, but I'm afraid the Society would have my other knee if I told you. Let's say it's mostly very angry arcane powder, and leave it there." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I know all sorts of things, most of them rather alarming, and my knee knows the rest. Ask me about any of these!" },
    },
    background = { { id = "tp_ba", text = "I'm an apothecary of the Royal Society, and I was something else before I died, but I find this suits me far better." } },
    advice = { { id = "tp_ad", text = "Label everything you carry out there, or you'll forget which bottle was which, and the ghouls certainly won't remind you." } },
    scholomance = { { id = "tp_scholomance", text = "It's a school of necromancy, and just imagine the library! Actually, don't, since I've imagined it, and I didn't sleep, though of course I don't sleep anyway.", fx = { learn = { "scholomance" } } } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "They're my life's work, this month at least. Next month it'll be something else that wants to kill everyone." } },
    _none = { { id = "tp_none", text = "I really couldn't say, and my knee doesn't know either." } },
  },
}

P:NPC {
  key = "alexi", id = TODO_NPC("Alexi Barov"), name = "Alexi Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "bulwark" }, temper = { "proud", "sharp" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_bored", text = "Mm? Oh, another one of you, how tiresome. Do try to be interesting." },
    { id = "g_back", when = { metBefore = true }, text = "You again, is it? Tell me you've brought me something other than your face." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us, freed by the Dark Lady as I was. Of course, I was a Barov before I was a corpse, and what you were I really don't need to know." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is a disgrace. Bring me my fortune and you can buy better, and you'll still be a peasant, but at least a well-dressed one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alexi Barov. My family sold its soul to Kel'Thuzad and I'm the one who got free of him, while my brother Weldon kept his breath and now imagines he gets the money too.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "There are four deeds lost somewhere in the Scholomance, for Caer Darrow, Brill, Tarren Mill and Southshore. Fetch them, and don't read them, or you'll only feel poor." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "My brother hides at Chillwind Camp behind the Alliance's skirts, so slay him and bring me his head. Do hurry, because I'm told heads go off." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "So Weldon's gone, then. He spared me once, you know, the sentimental fool, and I've no such weakness, I've checked." },
        { id = "h_signet", when = { metBefore = true },
          text = "I still wear the family signet, though my fingers are thinner now and I had it sized. A Barov keeps up appearances, even this Barov." },
      },
      again = {
        { id = "h_again", text = "You're still here, I see. Well, go on, amuse me." },
        { id = "h_again2", text = "Another question? How very thorough of you." },
      },
      choices = {
        { text = "He spared your life. Doesn't that matter?", next = "spared" },
        { text = "What's in it for me?", next = "pay" },
        { text = "What was your family like?", next = "family" },
        { text = "We were both freed by the Dark Lady.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll look for the deeds.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I won't do a Barov's dirty work, living or dead.", next = "END", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    spared = {
      big = true,
      lines = {
        { id = "s_default", text = "He looked at me and couldn't do it, which was squeamishness, not mercy. If he'd finished me, he'd have his fortune, so that's his mistake, not my debt." },
      },
      choices = {
        { text = "That's cold, even for the dead.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Do you hate him?", next = "hate" },
        { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    hate = {
      lines = {
        { id = "ha_default", text = "Hate is for people with time on their hands, and I have eternity, which is quite different. I simply want what's mine, and he happens to be standing on it." },
      },
      choices = {
        { text = "You don't sound nearly as bored as you pretend.", tag = "Persuade", next = "hate_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Scourge" }, { trait = "witty" } } } },
          fail = { next = "hate_bored", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = {
        { id = "p_default", text = "Gold, and a great deal of it, more than you've ever seen in one place, I'd wager. I would know, having seen your boots." },
      },
      choices = {
        { text = "Deal.", next = "BACK", fx = { affinity = 1 } },
        { text = "And what's in the deeds for you?", next = "deeds" },
      },
    },
    deeds = {
      lines = {
        { id = "de_default", text = "The family's lands, of course, every acre from Caer Darrow to Southshore, and never mind who's living on them now. Kingdoms fall, but titles keep, and I intend to keep mine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = {
        { id = "fa_default", text = "We were rich, and we were bored, and when Kel'Thuzad offered us forever we were foolish enough to accept. Father turned our home into his school, and the rest of us paid the tuition." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scholomance" } } } },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "Freed, yes, though some of us had rather more worth freeing. Still, you have the look of someone who could fetch a deed without losing it, which already puts you ahead of most." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hate_truth = {
      big = true,
      lines = {
        { id = "ht_default", text = "Clever thing. Since you insist: what I can't forgive is that he looked at me and saw a monster, and spared me the way one spares a dog, while I was still in here, darling, every bit of me. As for the deeds, he'll swear Father meant them for him, and I'll swear the opposite, and Father isn't taking questions." },
      },
      choices = {
        { text = "So it isn't about the money.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then let the deeds decide it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_bored = {
      lines = {
        { id = "hb_default", text = "How touching, a peasant who thinks they can read a Barov's face. Mine stopped moving some time ago, so you're reading tea leaves, and badly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a great many things, darling, most of them about my family and none of them flattering. Ask about these, if you must." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get the short list, since you've hardly earned the long one. Choose quickly; I'm already bored." },
    },
    background = { { id = "tp_ba", text = "I'm a Barov of Caer Darrow, dead and free and owed a fortune. What more could you possibly need to know?", next = "family" } },
    advice = { { id = "tp_ad", text = "Never trust family, darling, and never, ever trust a brother with a conscience." } },
    scholomance = { { id = "tp_scholomance", text = "It was our home, until Father turned it into a school for necromancers, and the tuition was everyone we knew." } },
    _none = { { id = "tp_none", text = "How tedious. Is there money in it? No? Then why are we still talking about it?" } },
  },
}

P:NPC {
  key = "garush", id = TODO_NPC("Argent Officer Garush"), name = "Argent Officer Garush",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "bulwark", "argent_dawn" }, temper = { "steady" }, values = { "honorable", "fair" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_dawn", text = "For the Dawn, friend, so say it with me, and it gets easier each time." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you've brought me stones or a story. I'll gladly take either one." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc, then you know what it is to be a weapon someone else aimed. The Dawn aims at one thing only, and I like that about it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, so you'll feel how sick the spirits are here. Fight anyway, and they'll thank you for it when they're well again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Officer Garush, orc, Horde-born, and a soldier of the Argent Dawn, where every race faces one enemy. I fought for the Horde all my life, and now I fight for everybody." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission, and you'll find the dead out there carry scourgestones, what's left of the will that drives them. Bring them here, and every stone you bring is one less thing walking." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "A report from Everlook, in Gregor's hand? He writes small and I read slowly, but we always get there in the end." },
        { id = "h_pureheart", when = { metBefore = true },
          text = "Pureheart's at Chillwind on the Alliance side, and the two of us write to each other. Ten years ago one of us would have killed the other, and now we argue about rations." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Ask it plain, and I'll answer plain." },
        { id = "h_again2", text = "Something more? Ask it, I'm here at the wall until the sun goes down." },
      },
      choices = {
        { text = "Why join the Dawn?", next = "why" },
        { text = "What do the stones do?", next = "commission" },
        { text = "You write to an Alliance officer?", next = "pureheart" },
        { text = "I'm Alliance. Am I welcome here?", next = "alliance", when = { faction = "Alliance" } },
        { text = "Does the Horde not need you more?", next = "orc", when = { race = "Orc" } },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I had years in the camps after the war to think, and when I got out, I wanted a fight I could be proud of. The Scourge is the only enemy everyone agrees on, and that's a rare thing.", fx = { learn = { "argent_dawn" } } },
      },
      choices = {
        { text = "That's honorable.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The camps?", next = "camps" },
        { text = "The Horde needs you more.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    camps = {
      lines = {
        { id = "ca_default", text = "The humans' internment camps, where a great many orcs sat out the years after the Second War. Thrall freed us, and I honor him for it, but I'll spend what's left of my life where it does the most good." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    commission = {
      lines = {
        { id = "cm_default", text = "A scourgestone is the binding that holds a dead thing up, made solid when it falls. Bring them to me, and they'll never hold anything up again." },
      },
      choices = {
        { text = "And what do I get?", next = "stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "st_default", text = "The Dawn's respect, which is worth more than it sounds, for the Dawn keeps count and its quartermasters remember. Mostly you get fewer dead, though, and I'd hope that's enough." },
      },
      choices = {
        { text = "It's enough.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Respect won't feed me, so I'll want something more solid.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    pureheart = {
      lines = {
        { id = "pu_default", text = "I do, and she writes back, mostly about rations and the weather and how many we've each lost that week. It's strange to share a war with someone you'd have fought ten years ago, but I wouldn't trade it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alliance = {
      lines = {
        { id = "al_default", text = "At my table, yes, and at the wall, so long as you fight the dead. The Forsaken won't love you, but they'll leave you be if I ask, and I've asked." },
      },
      choices = { { text = "Thank you, Garush.", next = "BACK", fx = { affinity = 2 } } },
    },
    orc = {
      lines = {
        { id = "or_default", text = "The Horde has thousands of young warriors, brother, and the Dawn has very few orcs. If the dead take Tirisfal, Undercity falls with it, so this is the Horde's fight too, whatever anyone in Orgrimmar says." },
      },
      choices = {
        { text = "Lok'tar, then.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Orgrimmar's right, and the Forsaken can bury their own dead.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've walked these fields long enough to learn a few things worth telling. Ask about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I'm an orc who fought the Horde's wars, sat in the camps, and came out wanting a better fight. I found one here.", next = "why" } },
    advice = { { id = "tp_ad", text = "Keep moving out there. The dead are slow, but they never stop, and they never tire of following." } },
    argent_dawn = { { id = "tp_dawn", text = "There are no kings and no warchiefs in the Dawn, only the dead and the people who won't let them win." } },
    _none = { { id = "tp_none", text = "I don't know, friend, so ask Derrington, who knows everything and tells you half." } },
  },
}
