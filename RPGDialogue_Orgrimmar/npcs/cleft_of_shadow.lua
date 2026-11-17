-- The Cleft of Shadow: the rogues' master, a warlock trainer, the demon trainer,
-- and the two merchants who sell poison and reagents beside Ragefire Chasm.
-- Voices: bibles/<key>.md for each. Zevrost and Neeru are in their own files.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Shenthul: the rogue trainer who watches the whole Cleft.
---------------------------------------------------------------------------
P:NPC {
  key = "shenthul", id = TODO_NPC("Shenthul"), name = "Shenthul", title = "Rogue Trainer",
  bible = "bibles/shenthul.md", role = "trainer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sharp", "smooth" }, values = { "cunning", "loyal" },
  notices = { "stealth", "class" },
  impression = {
    first = "Shenthul trains rogues in the Cleft of Shadow and seems to know everyone's business before they speak. The voice is soft and friendly, and that somehow makes it more unsettling.",
    third = "{name} met Shenthul, the rogue trainer who watches over the Cleft of Shadow in Orgrimmar.",
  },

  greetings = {
    { id = "g_hi", text = "Come in out of the light, {class}. Nobody in the Cleft likes being looked at too closely, not even the orcs who built it." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back down here, and without a guide this time. I'm almost proud of you." },
    { id = "g_stealth", when = { stealthed = true }, text = "I can hear you breathing, you know. Come out and talk properly." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in the city caught you in a lie, which is careless. A good lie is never caught, only forgotten." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true }, place = "before",
      text = "Your left boot squeaks when you step on it, and I heard you coming from the top of the ramp. Fix that before you try it on anyone who matters." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior in the Cleft, clanking like a pot cart. Don't worry, nobody here will stab you unless you ask for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shenthul, and I train those who work in the shadows for the Horde. Not every war is fought with banners and war drums, and the Warchief knows that better than the grunts who shout Lok'tar in his name." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Shenthul, and you're one of mine, by the look of your boots and the way you watched the exits when you came in. Good habits, so keep them." },
        { id = "h_rfc", when = { questActive = TODO_QUEST("Hidden Enemies") }, text = "Shenthul, and you've been asking about Ragefire, I hear. The Warchief has good reason to worry about what's festering down there, so keep your blade close when you go." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I have all the time in the world, and none to waste." },
        { id = "h_again2", text = "Go on. Nobody's listening, I've made sure of it." },
      },
      choices = {
        { text = "What do rogues do for the Horde?", next = "work" },
        { text = "Tell me about the Cleft of Shadow.", next = "cleft" },
        { text = "Does the Warchief trust your kind?", next = "trust" },
        { text = "I'm ready for my next lesson.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What would you have of a Forsaken rogue?", next = "forsaken", when = { race = "Scourge", class = "ROGUE" } },
        { text = "Farewell, Shenthul.", next = "END" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "We listen at doors in Theramore, we count the soldiers on the walls of Southshore, and now and then we make sure a Kolkar raid leader doesn't wake up. The grunts win the battles, but we choose which battles they fight." } },
      choices = {
        { text = "Choosing a man's death in his sleep is cowardly.", next = "work_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_honor = {
      big = true,
      lines = { { id = "wh_default", text = "Is it? One knife in the dark saves a hundred grunts from dying on a pike wall, and I've never met a grunt who'd rather die honorably than live. Grezz Ragefist disagrees with me loudly, but Grezz has never seen what we prevent." } },
      choices = {
        { text = "A hundred lives saved is worth any shame.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some victories aren't worth having. Grezz is right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "The warlocks keep to one side and the rogues to the other, the poison and the reagents get sold in the middle, and everyone pretends not to watch everyone else. Down at the bottom is Ragefire Chasm, which is where the real trouble lives." } },
      choices = {
        { text = "What's in Ragefire Chasm?", next = "ragefire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ragefire = {
      lines = { { id = "rf_default", text = "Troggs, fire and worse, and cultists of the Searing Blade who think the old ways of demons and blood were better. They're orcs, friend, from inside our own city, which is what troubles the Warchief more than any of it." } },
      choices = {
        { text = "How did cultists get into Orgrimmar?", next = "ragefire_how" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    ragefire_how = {
      big = true,
      lines = { { id = "rh_default", text = "The same way anything gets anywhere, by walking through the gate and smiling at the guards. Some of them were grunts in good standing last season, so now I watch the faces in the Drag a little more closely than I used to." } },
      choices = {
        { text = "Then root them out. Every last one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Watch, but don't make the city afraid of itself.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "He trusts that we're useful, which is better than being trusted, if you ask me. Trust can be broken, but usefulness only runs out, and I don't intend to let mine run out." } },
      choices = { { text = "Something else, Shenthul.", next = "BACK" } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "You walk without breathing and nobody hears your heartbeat, because you haven't got one. I'd have you in Lordaeron, listening to the humans who still think they can take it back, and you'd hear more than any of my orcs ever could." } },
      choices = {
        { text = "I'll go wherever I'm most useful to the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I serve the Dark Lady first, and you second.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Where I come from doesn't matter, and nobody who knows is going to tell you. That's rather the point." } },
    advice = { { id = "tp_ad", text = "Never stand in a doorway, never sit with your back to one, and never trust anyone who says they have nothing to hide." } },
    _none = { { id = "tp_none", text = "If I knew, I'd want to know why you're asking. Since I don't, I'll just wonder about you instead, the way a good orc wonders about anyone who asks." } },
  },
}

---------------------------------------------------------------------------
-- Mirket: warlock trainer, and much more honest about it than Zevrost.
---------------------------------------------------------------------------
P:NPC {
  key = "mirket", id = TODO_NPC("Mirket"), name = "Mirket", title = "Warlock Trainer",
  bible = "bibles/mirket.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp" }, values = { "ambitious", "practical" },
  notices = { "fel", "class" },
  impression = {
    first = "Mirket trains warlocks in the Cleft of Shadow and speaks about demons with the dry contempt of someone who has bound a great many of them. Mirket doesn't ask for anyone's approval, and doesn't seem to need it.",
    third = "{name} met Mirket, a warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "If you've come to stare at the warlocks, there's a better view from the top of the ramp." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another one for the Cleft. Your imp's been talking about you, and none of it was flattering." },
  },
  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp's grinning at me again. Tell it that if it sets fire to my robes, I'll send it home in pieces." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mirket, and I teach warlocks. The rest of the city remembers the blood curse and would rather we didn't exist, but it's glad enough of us when the Alliance comes over the hill." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Mirket, and you're a shaman, so you'll be wanting to tell me the spirits disapprove of me. Save your breath, because Kardris has already said it twice this season." },
      },
      again = { { id = "h_again", text = "What else? Be quick, my next student's late." } },
      choices = {
        { text = "Why does the city tolerate warlocks?", next = "tolerate" },
        { text = "Aren't demons what nearly destroyed the orcs?", next = "demons" },
        { text = "Teach me what you know.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Farewell, Mirket.", next = "END" },
      },
    },
    tolerate = {
      lines = { { id = "to_default", text = "Because the Warchief is practical, whatever the shamans whisper in his ear. Every warlock in the Cleft is one the Horde can watch, and one the Searing Blade didn't get to first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    demons = {
      lines = { { id = "de_default", text = "They did, because our fathers bowed to them and drank what they were offered. A warlock doesn't bow; a warlock holds the leash, and if you can't tell the difference, you shouldn't be standing in the Cleft." } },
      choices = {
        { text = "What if the leash breaks?", next = "leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = { { id = "le_default", text = "Then the warlock dies, and usually the warlock deserved it for being careless. I've buried three students who thought they were stronger than they were, and I'll bury more, because the Horde needs the power whether or not it likes the price." } },
      choices = {
        { text = "Power the Horde needs is worth the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "No power is worth bargaining with demons.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't care about that. Ask me about binding demons, or go and bother a grunt." } },
  },
}

---------------------------------------------------------------------------
-- Kurgul: the demon trainer, who sells grimoires and knows every imp's name.
---------------------------------------------------------------------------
P:NPC {
  key = "kurgul", id = TODO_NPC("Kurgul"), name = "Kurgul", title = "Demon Trainer",
  bible = "bibles/kurgul.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "patient", "curious" },
  notices = { "fel" },
  impression = {
    first = "Kurgul teaches warlocks' demons new tricks in the Cleft of Shadow and talks about imps and voidwalkers with something close to fondness. It is the strangest kind of affection to see.",
    third = "{name} met Kurgul, the demon trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Bring me your demon, and let's see what we can teach it this time." },
    { id = "g_imp", when = { pet = { family = "Imp" } }, text = "Ah, an imp. Hello, little one, and stop pulling faces at me." },
  },
  notice = {
    { id = "n_void", cat = "fel", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's drifting a little to the left. They do that when they're bored, so give it something to hit soon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kurgul, and I sell the grimoires that teach your demons new ways to serve. Our grandfathers served the demons and paid in blood; my books make sure it goes the other way now, and an imp shows you every trick it would rather hide." },
      },
      again = { { id = "h_again", text = "Anything else? My grimoires don't like being left open." } },
      choices = {
        { text = "Do demons have personalities?", next = "personal" },
        { text = "Where do the grimoires come from?", next = "books" },
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Farewell, Kurgul.", next = "END" },
      },
    },
    personal = {
      lines = { { id = "pe_default", text = "Oh, very much so, and none of them nice. Imps are vain and spiteful, voidwalkers are quiet and sulky, and succubi will try to talk you out of your own name if you let them." } },
      choices = {
        { text = "Do you ever pity them?", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      big = true,
      lines = { { id = "pi_default", text = "Pity a demon? They'd burn this city to the ground and laugh about it, so I find pity comes hard. But I don't torment them more than I need to, because a tormented demon is a dangerous one." } },
      choices = {
        { text = "They're tools. Use them however works.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Even a demon shouldn't be tormented for sport.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    books = {
      lines = { { id = "bo_default", text = "Some were copied from the old Shadow Council's books, the ones that weren't burned, and some I wrote myself after years of watching. I'd rather not say which ones are which, because people get nervous." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know anything about that, but I'll ask my imp. It lies, but sometimes it lies interestingly." } },
  },
}

---------------------------------------------------------------------------
-- Rekkul and Hagrus: poisons and reagents.
---------------------------------------------------------------------------
P:NPC {
  key = "rekkul", id = TODO_NPC("Rekkul"), name = "Rekkul", title = "Poison Supplier",
  bible = "bibles/rekkul.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Rekkul sells poisons and their makings in the Cleft of Shadow, and keeps the jars labelled in a hand nobody else can read. Rekkul smiles too much for someone in that trade.",
    third = "{name} met Rekkul, who sells poisons in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Don't touch the jars, please, or at least wash your hands before you eat anything." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you still have all your fingers. Good, that means you've been reading the labels." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Your blade's coating has gone dull, you know. A poison loses its bite after a few days in the sun." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rekkul, and I sell the makings of poisons to those who are trained to use them. I can't sell you a full jar of anything, but I'll sell you all the pieces, and you can make it yourself." },
      },
      again = { { id = "h_again", text = "Anything else? Mind the green jar, it's in a mood today." } },
      choices = {
        { text = "Who buys poisons in Orgrimmar?", next = "who" },
        { text = "Isn't poison dishonorable?", next = "honor" },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Farewell, Rekkul.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Rogues, of course, but you'd be surprised how many hunters and apothecaries come down here too. Even a grunt or two, who'd die before admitting it to the Valley of Honor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    honor = {
      big = true,
      lines = { { id = "ho_default", text = "So is dying, friend, and the Alliance doesn't send their soldiers home just because ours fight fair. A poisoned blade ends a fight quicker, and quicker means fewer orcs coming home on a stretcher." } },
      choices = {
        { text = "A quick end is a mercy to both sides.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather win clean or not at all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who taught you poisons?", next = "teacher" },
      },
    },
    teacher = {
      lines = { { id = "te_default", text = "A Darkspear witch doctor taught me which mushrooms kill and which ones only make you wish you were dead. The rest I learned the hard way, which is why I've got a cough that won't go away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that, and I won't guess. Guessing is how you poison yourself." } },
  },
}

P:NPC {
  key = "hagrus", id = TODO_NPC("Hagrus"), name = "Hagrus", title = "Reagent Vendor",
  bible = "bibles/hagrus.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "honest" },
  notices = { "class" },
  impression = {
    first = "Hagrus sells reagents in the Cleft of Shadow and complains about every single customer who buys from him. Hagrus seems to like the complaining more than the selling.",
    third = "{name} met Hagrus, who sells reagents to the spellcasters of Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Reagents, yes, and no, I don't have anything stronger, so don't ask." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You burn through powders faster than a mage in a bad temper." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, so you'll need powder for those portals, and you'll have run out at the worst moment, I expect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Hagrus, and I sell reagents. Mages want powder, shamans want ankhs, warlocks want soul shards they think I keep under the counter, and I sell what I've got and argue about the rest like any honest orc." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Hagrus, and you're a shaman, so you'll be wanting an ankh. Everybody dies sometime, and your kind just plan for it better." },
      },
      again = { { id = "h_again", text = "What else? I've got stock to count." } },
      choices = {
        { text = "Why sell reagents down here in the Cleft?", next = "cleft" },
        { text = "Who's your worst customer?", next = "worst" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Farewell, Hagrus.", next = "END" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "Because nobody in the Drag wanted me next to their stall, with the smell of the powders. Down here everybody smells odd anyway, so I fit in nicely." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worst = {
      lines = { { id = "wo_default", text = "The warlocks, every one of them, asking for things I don't sell and wouldn't sell if I could. I tell them I sell powders, not souls, and they look at me like I'm the strange one." } },
      choices = {
        { text = "Would you sell them if you could?", next = "souls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    souls = {
      big = true,
      lines = { { id = "so_default", text = "Never, and I don't care how much gold they offer. A trader has to draw the line somewhere, and I draw mine at anything that used to be alive and still might be." } },
      choices = {
        { text = "Good. Some trades shouldn't be made.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gold is gold. You're leaving money on the table.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care. Buy something, or go and ask a grunt who does." } },
  },
}
