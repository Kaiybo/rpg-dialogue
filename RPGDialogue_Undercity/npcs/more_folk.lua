-- More of the Undercity: Andrew Brownell and the Coldbringer, the warlock and skinning trainers,
-- a Montague banker, the guild master, and the merchants of the Magic, Rogues' and War Quarters.
-- Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andrew Brownell: watches the Scourge abroad; wants Amnennar the Coldbringer's skull.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_brownell", id = TODO_NPC("Andrew Brownell"), name = "Andrew Brownell",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grave", "precise" }, values = { "dutiful", "knowledge" },
  notices = { "race", "class" },
  impression = {
    first = "Andrew Brownell keeps watch on the Scourge's doings far beyond Lordaeron, and he speaks of liches the way a physician speaks of a disease he has studied for too long. His reports are thorough, and none of them are good news.",
    third = "{name} met Andrew Brownell in the Magic Quarter, who studies the Scourge's reach into Kalimdor.",
  },

  greetings = {
    { id = "g_default", text = "Come in, but quietly. I'm in the middle of a report, and none of it is pleasant." },
    { id = "g_active", when = { questActive = TODO_QUEST("Bring the End") }, text = "Razorfen Downs, {class}, and the Coldbringer's skull. I'll not rest easy until I see it on this table." },
    { id = "g_done", when = { questDone = TODO_QUEST("Bring the End") }, text = "The one who ended the Coldbringer. My reports have grown a little shorter since, and I thank you for it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, here in the Undercity. You'll know more of the quilboar than any of my agents, I suspect, and I'd be glad of what you know." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You'll understand, better than most, what it means for a lich to bind the dead to its will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrew Brownell. The Dark Lady has eyes on the Scourge wherever it reaches, and some of those eyes report to me, which is why I seldom have good news for anyone." },
        { id = "h_before", tags = { "news" }, when = { minLevel = 33, questBefore = TODO_QUEST("Bring the End") },
          text = "In the Barrens lies a tangle of vines and thorn called Razorfen Downs. Our first look at it told us little, but what we've learned since is far more serious, {class}, and I need someone who can act on it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Bring the End") },
          text = "Amnennar the Coldbringer rules the quilboar of Razorfen Downs now, and every one of them moves to his will. Kill him and bring me his skull, and the Scourge loses a foothold in Kalimdor." },
        { id = "h_done", when = { questDone = TODO_QUEST("Bring the End") },
          text = "The Coldbringer's skull is on its way to the Apothecarium, where it will be studied with great care. The bond he held to the Lich King is cut, and the quilboar are only quilboar again." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly; I've no time for riddles." },
        { id = "h_again2", text = "Go on. The report can wait a moment." },
      },
      choices = {
        { text = "What's happening in Razorfen Downs?", next = "downs" },
        { text = "Who is Amnennar the Coldbringer?", next = "amnennar" },
        { text = "Who reports to you out there?", next = "agents" },
        { text = "My people have fought the quilboar for generations.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your report.", next = "END" },
      },
    },
    downs = {
      lines = { { id = "d_default", text = "The quilboar of the Downs have thrown in with the Scourge, {class}. They were always vicious, but now they march together and fight without fear, and that is not a thing quilboar do on their own." } },
      choices = {
        { text = "Why would the Scourge want quilboar?", next = "downs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    downs2 = {
      lines = { { id = "d2_default", text = "Bodies, first, and a foothold on Kalimdor, second. Every quilboar that falls in the Downs can be raised again, and the Barrens are a short march from Orgrimmar and Thunder Bluff both." } },
      choices = {
        { text = "Then the Horde must strike first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    amnennar = {
      lines = { { id = "a_default", text = "A lich, and a powerful one, sent to rule the Downs in the Lich King's name. He holds the quilboar with the weight of his mind alone, and through him the Lich King's will reaches all the way to the Barrens." } },
      choices = {
        { text = "How can one lich hold so many?", next = "bond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond = {
      lines = { { id = "b_default", text = "He has a direct link to Ner'zhul himself, the Lich King in his frozen throne. We must sever that bond, and the only certain way to sever a lich's bond is to end the lich." } },
      choices = {
        { text = "Would the bond break if he chose to turn?", next = "loyalty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyalty = {
      big = true,
      lines = { { id = "l_default", text = "A lich's loyalty is unswerving, {class}. We broke free of the Lich King because he faltered, but the Coldbringer never will, and such loyalty will bring him only destruction. Does that trouble you?" } },
      choices = {
        { text = "No. Some enemies can only be destroyed.", next = "BACK", reply = "Just so. Pity is a luxury for those who aren't fighting the Scourge on three continents.", fx = { align = { light = -1 } } },
        { text = "It does. He was someone once, like us.", next = "BACK", reply = "He was, and so were the quilboar he leads. Remember it if you like, but don't let it stay your hand in the Downs.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    agents = {
      lines = { { id = "ag_default", text = "Forsaken who travel, mostly, and a few of the living who are paid to keep their eyes open. I'll not give you their names, {class}, because the Scourge has ways of learning names." } },
      choices = {
        { text = "You trust the living with this?", next = "BACK", reply = "I trust them to want their coin, and to want the Scourge kept away from their homes. That's enough to build a report on." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Then you'll know what a quilboar looks like when it fights for itself, and you'll see the difference in the Downs at once. They don't flee and they don't scatter, and your people should be told." } },
      choices = {
        { text = "I'll tell the elders in Thunder Bluff.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "Wherever there are dead, there is the Scourge, and wherever there is the Scourge, I have a report to write. I've written a great many." } },
    kelthuzad = { { id = "tp_kt", text = "His name comes up in more of my reports than I'd like, though seldom with anything I can act upon." } },
    _none = { { id = "tp_none", text = "That's not in any of my reports. Ask someone who isn't busy." } },
  },
}

---------------------------------------------------------------------------
-- Luther Pickman: warlock trainer in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lpickman", id = TODO_NPC("Luther Pickman"), name = "Luther Pickman", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "condescending" }, values = { "power", "knowledge" },
  notices = { "class" },
  impression = {
    first = "Luther Pickman teaches warlocks in the Magic Quarter and treats every question as a small insult to his time. He seems to believe that fear is the first thing a student should learn and the last thing they should show.",
    third = "{name} met Luther Pickman, a warlock trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "If you're not a warlock, you're in the wrong room, and if you are, you're late." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another student. Show me what you've learned, and then I'll show you how little it is." },
  },

  notice = {
    { id = "n_notlock", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You've the look of someone who prays. Pray quietly, please; it distracts the imps." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Luther Pickman. I teach the shadow and the flame to those with the stomach for them, and I am not patient with those without it." },
      },
      again = {
        { id = "h_again", text = "Well? I've other students." },
        { id = "h_again2", text = "Ask, then, and be brief." },
      },
      choices = {
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What makes a good warlock?", next = "good" },
        { text = "Do you work with the other trainers here?", next = "others" },
        { text = "I'll go.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Control. The fel will give you anything you ask, and take twice as much in return, and the warlock who lets it take is no warlock at all, only a meal with ambitions." } },
      choices = {
        { text = "And how does one keep control?", next = "good2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good2 = {
      big = true,
      lines = { { id = "g2_default", text = "By never forgetting what you're touching. Some say the Forsaken are suited to this art because we've nothing left to lose. I say that's precisely why we must be careful. Where do you stand, {class}?" } },
      choices = {
        { text = "Power is a tool. Use all of it.", next = "BACK", reply = "Then you'll be powerful, and briefly. I've buried students who thought as you do, the second time.", fx = { align = { order = -1 } } },
        { text = "Discipline first. Power after.", next = "BACK", reply = "Good. That answer might keep you alive long enough to be useful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Richard Kerwin and I share this hall, and Carendin Halgar keeps to his own studies with the demons. We disagree on method, but we agree that the Dark Lady's warlocks should be the best in the Horde." } },
      choices = {
        { text = "And are they?", next = "BACK", reply = "They will be, once they stop asking me questions and start practising." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "We use their servants. We do not serve them. Remember the difference, or the Legion will remember it for you." } },
    _none = { { id = "tp_none", text = "That is not my concern, and therefore not yours, while you're in my hall." } },
  },
}

---------------------------------------------------------------------------
-- Killian Hagey: skinning trainer in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_hagey", id = TODO_NPC("Killian Hagey"), name = "Killian Hagey", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "matter_of_fact", "dry" }, values = { "craft", "practical" },
  notices = { "profession" },
  impression = {
    first = "Killian Hagey teaches skinning in the Rogues' Quarter and talks about it with the calm of a man who has never once been squeamish. He keeps his knives cleaner than anything else in the Undercity.",
    third = "{name} met Killian Hagey, the Undercity's skinning trainer.",
  },

  greetings = {
    { id = "g_default", text = "Knife, steady hand, and no stomach for nonsense. That's all skinning needs, and two of those I can teach." },
    { id = "g_skinner", when = { profession = "Skinning" }, text = "A skinner. Let's see how your cuts are coming along." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "A leatherworker. Arthur will want you to learn skinning too, if you haven't, and so will your purse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Killian Hagey, skinning trainer. I'll teach anyone who can hold a knife without shaking, and in this city, that's most people." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a blade to hone." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Teach me to skin.", next = "BUSINESS" },
        { text = "Is skinning easier now that you're dead?", next = "dead" },
        { text = "Who buys the hides?", next = "hides" },
        { text = "Not now.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Easier on the stomach, harder on the fingers. I don't mind the smell any more, but my hands don't always do what I tell them, so I've had to learn the cuts all over again." } },
      choices = {
        { text = "How did you relearn them?", next = "dead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead2 = {
      big = true,
      lines = { { id = "d2_default", text = "Slowly, on Tirisfal wolves, until the cuts came clean. Some of my students want to practise on things that walk on two legs, and I send them away. Do you think I'm too fussy, {class}?" } },
      choices = {
        { text = "No. There are lines even we shouldn't cross.", next = "BACK", reply = "Good. The apothecaries can do as they like with the Crusade; in my hall, we skin beasts.", fx = { align = { light = 1 } } },
        { text = "A hide's a hide. The Crusade would skin us.", next = "BACK", reply = "Maybe they would. But I teach a trade, not a grudge, and you'll learn it my way here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "h2_default", text = "Arthur Moore for his leatherworkers, Joseph Moore's shop for the supplies, and the auction house for whatever's left. A good hide never goes to waste in this city." } },
      choices = {
        { text = "Then I'll bring good hides.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I skin things. That one I can't help you with." } },
  },
}

---------------------------------------------------------------------------
-- Mortimer Montague: one of the Trade Quarter's Montague bankers.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_mmontague", id = TODO_NPC("Mortimer Montague"), name = "Mortimer Montague", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "dry" }, values = { "order", "discretion" },
  notices = { "purse" },
  impression = {
    first = "Mortimer Montague keeps the vaults of the Trade Quarter with the solemnity of a man guarding a tomb, which he says is more or less what a bank is. He counts everything twice and trusts nobody once.",
    third = "{name} met Mortimer Montague, one of the bankers of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Deposit or withdrawal? Speak clearly; the vault has an echo." },
    { id = "g_back", when = { metBefore = true }, text = "Your box is exactly where you left it. I checked, twice." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You're carrying rather a lot of gold on your person. I'd be happy to relieve you of the worry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mortimer Montague, banker. What goes into my vault stays in it until you ask for it back, which is more than can be said for anything else in this city." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Yes? I'm listening, and counting." },
      },
      choices = {
        { text = "I'd like to open my box.", next = "BUSINESS" },
        { text = "There are a lot of Montagues at this counter.", next = "family" },
        { text = "Who would rob a bank of the dead?", next = "rob" },
        { text = "Not today.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "So there are, and I'd thank you not to ask how we're related, because none of us is entirely sure. The name came back with us; the family tree didn't." } },
      choices = {
        { text = "That must be strange.", next = "BACK", reply = "Strange is a word for the living. For us it's simply the paperwork." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob = {
      lines = { { id = "r_default", text = "The Syndicate, the occasional rogue who thinks the Rogues' Quarter is an invitation, and once, a newly risen fellow who swore the box was his from before he died. It wasn't." } },
      choices = {
        { text = "What happened to him?", next = "rob2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob2 = {
      big = true,
      lines = { { id = "r2_default", text = "I showed him the ledger, and he went away very quietly. Some say I should have helped him look for whatever he lost. I say a bank that bends its rules for a sad story is no bank at all. Wouldn't you agree?" } },
      choices = {
        { text = "Rules are rules. You were right.", next = "BACK", reply = "Thank you. Not everyone at this counter appreciates a ledger.", fx = { align = { order = 1 } } },
        { text = "You could have helped him. It costs nothing.", next = "BACK", reply = "It costs time, which I have plenty of, admittedly. I'll consider it, should he come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syn", text = "They have tried my vault twice. They have not succeeded twice." } },
    _none = { { id = "tp_none", text = "I'm a banker. If it isn't counted, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Gillian Moore: leather armor merchant in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_gmoore", id = TODO_NPC("Gillian Moore"), name = "Gillian Moore", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "sly", "brisk" }, values = { "practical", "profit" },
  notices = { "class" },
  impression = {
    first = "Gillian Moore sells leather armor in the Rogues' Quarter, mostly to people who would rather not say what they need it for. She has a knack for knowing what a customer wants before they decide to lie about it.",
    third = "{name} met Gillian Moore, who sells leather armor in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Soft soles, dark leather, no creaks. Whatever you're up to, I've something that won't give you away." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of the quarter's regulars, or soon to be. You'll want the dark tan; everyone does." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank. Down here, that's a confession. The War Quarter sells plate; I sell silence." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gillian Moore. I sell leather armor in a quarter full of people who'd prefer not to be heard coming, and business has never been better." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, if you please." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Who are your customers?", next = "customers" },
        { text = "Is this leather from Killian's skins?", next = "source" },
        { text = "Not today.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Rogues, hunters, the odd apothecary going somewhere they shouldn't. I don't ask, and they don't tell, and that's the oldest arrangement in this quarter." } },
      choices = {
        { text = "Even the Syndicate?", next = "customers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers2 = {
      big = true,
      lines = { { id = "c2_default", text = "If a Syndicate man came to my counter, how would I know? They don't wear a sign. Would you turn away coin on a guess, {class}?" } },
      choices = {
        { text = "I would. Enemies of the Dark Lady get nothing.", next = "BACK", reply = "Very loyal of you. I'll leave the guessing to the Deathguard, then, and sell to whoever's left.", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. Sell, and keep your ears open.", next = "BACK", reply = "Now you're thinking like the quarter. A merchant hears a great deal, if she doesn't ask questions.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Some of it. Killian's students bring in Tirisfal wolf and boar, Joseph sells the thread and dye, and the leatherworkers turn it into something worth wearing. I just put it on the shelf." } },
      choices = {
        { text = "A whole quarter in one jerkin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syn", text = "I don't know any Syndicate, and if I did, I'd still say that." } },
    _none = { { id = "tp_none", text = "Not a thing I sell, so not a thing I know." } },
  },
}

---------------------------------------------------------------------------
-- Joseph Moore: leatherworking supplies in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_jmoore", id = TODO_NPC("Joseph Moore"), name = "Joseph Moore", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "plain", "patient" }, values = { "craft", "practical" },
  notices = { "profession" },
  impression = {
    first = "Joseph Moore sells thread, salt and dyes to the leatherworkers of the Rogues' Quarter and keeps careful lists of who buys what. He is the dullest man in the quarter and seems to take pride in it.",
    third = "{name} met Joseph Moore, who sells leatherworking supplies in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Thread, salt, dye and handles. If you work leather, you'll need all of it sooner or later." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. Coarse thread or fine? I've both, and the salt's fresh in." },
  },

  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "A skinner. Salt your hides before they come to me, or Arthur will hear about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Joseph Moore, leatherworking supplies. I sell the small things that turn a hide into armor, and nobody ever remembers buying them until they run out." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on. I've a list to finish." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You keep a list of every customer?", next = "list" },
        { text = "Quiet trade, for this quarter.", next = "quiet" },
        { text = "Not now.", next = "END" },
      },
    },
    list = {
      lines = { { id = "l_default", text = "Every one, by name and by purchase. It tells me when to order salt, and it tells me who's been working leather and who's been buying black dye by the barrel for no honest reason." } },
      choices = {
        { text = "Does anyone ask to see the list?", next = "list2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list2 = {
      big = true,
      lines = { { id = "l2_default", text = "The Deathguard, now and then, and once someone from the Royal Apothecary Society. I let the Deathguard look and I told the apothecary I'd lost it. Which would you have done?" } },
      choices = {
        { text = "Shown them both. The city's safety comes first.", next = "BACK", reply = "Spoken like a loyal citizen. The apothecary had a smile I didn't like, though.", fx = { align = { order = 1 } } },
        { text = "Neither. Your customers trust you.", next = "BACK", reply = "They do, and that trust is worth more than the salt. I'll keep your answer in mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, and I like it that way. Gillian sells the finished armor and gets all the interesting customers, and I sell salt and get none of them." } },
      choices = {
        { text = "Dull is underrated.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell supplies. You want Gillian for gossip." } },
  },
}

---------------------------------------------------------------------------
-- Jonathan Chambers: bag vendor in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_chambers", id = TODO_NPC("Jonathan Chambers"), name = "Jonathan Chambers", title = "Bag Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "chatty" }, values = { "practical", "profit" },
  notices = { "class" },
  impression = {
    first = "Jonathan Chambers sells bags in the Rogues' Quarter and believes, sincerely, that most of the world's troubles come from having nowhere to put things. He is the only cheerful person on his stretch of canal.",
    third = "{name} met Jonathan Chambers, who sells bags in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Bags! Bags for everything, and everything in its bag. Come and look." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? I knew it; you're full up. Everyone always is." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You'll want a quiver, I expect, and the bag vendor in the War Quarter will tell you he has better ones, but he doesn't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jonathan Chambers, bag vendor. I sell the most useful thing in the Undercity, and nobody ever thanks me until they're standing in a crypt with a pocket full of loot and nowhere to put it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a bag for that, I'm sure." },
        { id = "h_again2", text = "Go on!" },
      },
      choices = {
        { text = "Let me see your bags.", next = "BUSINESS" },
        { text = "You're very cheerful for the Undercity.", next = "cheer" },
        { text = "What do people carry, mostly?", next = "carry" },
        { text = "Not today.", next = "END" },
      },
    },
    cheer = {
      lines = { { id = "c_default", text = "Why wouldn't I be? I died, I came back, and I found a trade that will never go out of fashion. Some of my neighbours think a smile is bad manners on a Forsaken." } },
      choices = {
        { text = "What do you think?", next = "cheer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer2 = {
      big = true,
      lines = { { id = "c2_default", text = "I think we were given a second go at things, and I'd rather spend mine selling bags than sulking. But I've been told that's naive. Is it, {class}?" } },
      choices = {
        { text = "It isn't. Keep smiling, Jonathan.", next = "BACK", reply = "I will! And I'll sell you a bag to carry the smile in, if you like.", fx = { align = { light = 1 } } },
        { text = "It is. This unlife isn't a gift.", next = "BACK", reply = "Perhaps not. But it's the one we've got, and it still needs bags.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "ca_default", text = "Rogues carry lockpicks and other people's purses, apothecaries carry vials, and the newly risen carry everything they find, because they don't know yet what's worth keeping. That's why they come back to me." } },
      choices = {
        { text = "And what do you carry?", next = "BACK", reply = "More bags, of course. You never know when someone will need one." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, but I can sell you somewhere to keep the answer once you find it." } },
  },
}

---------------------------------------------------------------------------
-- Lucille Castleton: robe vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_castleton", id = TODO_NPC("Lucille Castleton"), name = "Lucille Castleton", title = "Robe Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "refined", "tart" }, values = { "taste", "craft" },
  notices = { "class" },
  impression = {
    first = "Lucille Castleton sells robes in the Magic Quarter and remembers the court fashions of Lordaeron in far more detail than she remembers her own life. She has opinions about every hem that walks past her.",
    third = "{name} met Lucille Castleton, who sells robes in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Robes for the learned, the devout and the dreadful. Do come in, and do stand up straight." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Ah, a caster in need of something better than that. Let me see what would suit you." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, in a robe shop. Are you lost, or buying a gift?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lucille Castleton. I dressed half the mages of Lordaeron once, or I sold their tailors the cloth, which is nearly the same thing, and now I dress the Dark Lady's casters instead." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on. And mind the sleeves." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "What did Lordaeron's mages wear?", next = "court" },
        { text = "Does fashion matter to the dead?", next = "matter" },
        { text = "Not today.", next = "END" },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Violet and silver, for those who'd studied in Dalaran, and anything that dragged on the floor, for those who wanted you to think they had. The priests wore white, of course, and the Plague made short work of that." } },
      choices = {
        { text = "Do you miss it?", next = "court2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court2 = {
      big = true,
      lines = { { id = "c2_default", text = "I miss the colours. We wear black and purple and green now, because it suits the rot, and I'm told I ought to be proud of that. Should I be, {class}?" } },
      choices = {
        { text = "Yes. We've no need to dress like the living.", next = "BACK", reply = "Spoken like the Dark Lady's own herald. Black it is, then, and plenty of it.", fx = { align = { order = 1 } } },
        { text = "No. Wear what colours you like.", next = "BACK", reply = "Careful, you'll have me stocking yellow. Imagine the looks in the Magic Quarter!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matter = {
      lines = { { id = "m_default", text = "More than ever, dear. When your face is falling off, a good collar draws the eye elsewhere, and I've made a study of collars." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "The Kirin Tor had the worst taste in sleeves of any order in the world, and the best cloth. A cruel combination." } },
    _none = { { id = "tp_none", text = "I've no idea, dear, and frankly, no interest. Try a robe on instead." } },
  },
}

---------------------------------------------------------------------------
-- Sheldon Von Croy: cloth armor merchant in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_voncroy", id = TODO_NPC("Sheldon Von Croy"), name = "Sheldon Von Croy", title = "Cloth Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "pompous", "dry" }, values = { "status", "craft" },
  notices = { "class" },
  impression = {
    first = "Sheldon Von Croy sells cloth armor in the Magic Quarter and pronounces his own name as if it ought to open doors. Whatever standing it once had died with Lordaeron, but he hasn't stopped expecting the doors to open.",
    third = "{name} met Sheldon Von Croy, who sells cloth armor in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Sheldon Von Croy, at your service. Cloth armor, of quality, for those who appreciate it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned. A discerning customer, I see." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A spellcaster. You'll want something that doesn't catch fire easily, I imagine. I have a few." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Von Croy, with a capital V, if you please. The family had lands in Lordaeron, once, and now I sell gloves and caps in a sewer, but one does maintain standards." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Do go on." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What became of the family lands?", next = "lands" },
        { text = "Lucille sells robes nearby. Rivals?", next = "lucille" },
        { text = "Not today.", next = "END" },
      },
    },
    lands = {
      lines = { { id = "l_default", text = "Scourge, Crusade, Scourge again, and now I'm told nothing lives there at all. I haven't been to see, and I don't intend to; I'd rather remember the orchard than meet whatever's living in it." } },
      choices = {
        { text = "Wouldn't you want them back?", next = "lands2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lands2 = {
      big = true,
      lines = { { id = "l2_default", text = "The Dark Lady says all of Lordaeron is ours, and the old titles mean nothing. Some of us find that harder to accept than others. What would you tell me, {class}?" } },
      choices = {
        { text = "She's right. The old titles died with the kingdom.", next = "BACK", reply = "So they did, and here I am selling caps. You needn't be so cheerful about it.", fx = { align = { order = 1 } } },
        { text = "Keep your name. Nobody can take that.", next = "BACK", reply = "Quite right. Von Croy, capital V. Someone has to remember it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucille = {
      lines = { { id = "lu_default", text = "Hardly. Mistress Castleton sells robes, which are for show, and I sell armor, which is for survival. We nod to each other, and that's quite enough." } },
      choices = {
        { text = "She'd say the same of you, I expect.", next = "BACK", reply = "She'd say it with more adjectives. She's very fond of adjectives." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "It was a fine kingdom with a great many fine families in it. I was one of them, I'll have you know." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beneath my notice." } },
  },
}

---------------------------------------------------------------------------
-- Zane Bradford: wand vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bradford", id = TODO_NPC("Zane Bradford"), name = "Zane Bradford", title = "Wand Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "eager", "nervous" }, values = { "knowledge", "craft" },
  notices = { "class" },
  impression = {
    first = "Zane Bradford sells wands in the Magic Quarter and tests every one himself, which explains the scorch marks on his coat. He is enthusiastic in a way the Forsaken rarely are, and slightly too close to his merchandise.",
    third = "{name} met Zane Bradford, who sells wands in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Wands! Mind where you point that one. Actually, mind where you point all of them." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A caster! You'll appreciate these. Every one tested, personally, some of them twice." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Oh, these won't work for you, I'm afraid. You need a bit of magic in you to make them go, and you'd only be waving a stick." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zane Bradford, wands. I stock everything from a novice's twig to something with real bite, and I can tell you exactly how each one feels when it goes off, because I've felt it." },
      },
      again = {
        { id = "h_again", text = "Anything else? Don't touch that one." },
        { id = "h_again2", text = "Go on, go on." },
      },
      choices = {
        { text = "Show me the wands.", next = "BUSINESS" },
        { text = "You test them all yourself?", next = "test" },
        { text = "Where do the wands come from?", next = "source" },
        { text = "Not today.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Every one. It's the only way to know they work, and I can't feel the burns anymore, which makes me ideal for the job. My coat has suffered more than I have." } },
      choices = {
        { text = "Is that wise?", next = "test2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test2 = {
      big = true,
      lines = { { id = "t2_default", text = "Wise? Probably not. But somebody has to, and the apothecaries would charge me for the bandages. Should I stop, do you think?" } },
      choices = {
        { text = "Yes. Be careful with yourself.", next = "BACK", reply = "That's kind. I'll try, though the wands rarely agree.", fx = { align = { order = 1 } } },
        { text = "No. A merchant who knows his wares is rare.", next = "BACK", reply = "Exactly what I keep telling everyone! Thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Enchanters in the city make most of them, and some come up from the Magic Quarter's own students, practising. The students' wands are cheaper, and much more exciting." } },
      choices = {
        { text = "Exciting how?", next = "BACK", reply = "Sometimes they fire both ways. Buy the enchanters' ones, is my advice." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Sorry, wands only. Ask me about wands!" } },
  },
}

---------------------------------------------------------------------------
-- Sydney Upton: staff merchant in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_upton", id = TODO_NPC("Sydney Upton"), name = "Sydney Upton", title = "Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "laconic", "dry" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Sydney Upton sells staves in the Magic Quarter and talks about wood grain the way others talk about wine. He has little to say about anything else, and says even that slowly.",
    third = "{name} met Sydney Upton, who sells staves in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Staves. Good wood, well cut. Have a look." },
    { id = "g_druid", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID" } }, text = "You'll want something to lean on and channel through. I've ash and yew both." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people know wood, I'm told. Tell me what you think of the grain on that one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sydney Upton. I sell staves to the Magic Quarter's casters, and I've learned more about wood since I died than I did in all the years before it." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me the staves.", next = "BUSINESS" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "Why learn wood after death?", next = "why" },
        { text = "Not now.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Tirisfal yew, mostly, and some from Silverpine when the carts get through. Tirisfal wood is dark and twisted now, which casters seem to like, and it holds a charge better than you'd think." } },
      choices = {
        { text = "Twisted by the Plague?", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      big = true,
      lines = { { id = "w2_default", text = "Likely. The trees took sick the same as we did, and like us, they didn't die properly. Some of my customers won't touch Plague wood. Would you?" } },
      choices = {
        { text = "Gladly. It's the wood of our land now.", next = "BACK", reply = "Good answer. The yew and I have a lot in common.", fx = { align = { light = -1 } } },
        { text = "I'd rather have something clean.", next = "BACK", reply = "Silverpine, then, when it comes. It costs more, and it's worth less, but it's clean.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because I needed something to do with my hands that didn't involve remembering. Wood doesn't ask who you were." } },
      choices = {
        { text = "That's a good reason.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know. Ask me about wood." } },
  },
}

---------------------------------------------------------------------------
-- Morley Bates: fungus and drink vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bates", id = TODO_NPC("Morley Bates"), name = "Morley Bates", title = "Fungus Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gloomy", "wry" }, values = { "practical", "community" },
  notices = { "race" },
  impression = {
    first = "Morley Bates sells mushrooms and drink in the Magic Quarter to customers who mostly can't taste them. He finds this funnier than it is and tells everyone so.",
    third = "{name} met Morley Bates, who sells fungus and drink in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Mushrooms and water. The finest the Undercity has to offer, which isn't saying much." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A living customer! You'll actually taste these. I'm almost jealous." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Take the brown cap, not the spotted one. The spotted one is for us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Morley Bates. I sell food to the dead, which is a joke I've been telling for so long that I've forgotten it isn't funny." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Why do the dead buy food?", next = "why" },
        { text = "Where do the mushrooms grow?", next = "grow" },
        { text = "Not now.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Habit, mostly. Some of us still need a little something to keep the flesh together, and some just like to sit and chew, the way we used to. It passes the time." } },
      choices = {
        { text = "Is that sad, or comforting?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Depends who you ask. The apothecaries call it a weakness, clinging to the living. I call it business. Which is it to you?" } },
      choices = {
        { text = "A weakness. We should let it go.", next = "BACK", reply = "Then you'll not be buying, I take it. Pity.", fx = { align = { light = -1 } } },
        { text = "A comfort. Let them have it.", next = "BACK", reply = "My thoughts exactly, and my purse agrees.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "In the dark, under the city, where the old cellars meet the sewers. They thrive on what the Undercity gives them, and I'd rather not say more than that." } },
      choices = {
        { text = "I won't ask.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea. Want a mushroom?" } },
  },
}

---------------------------------------------------------------------------
-- Mirelle Tremayne: heavy armor merchant in the War Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_tremayne", id = TODO_NPC("Mirelle Tremayne"), name = "Mirelle Tremayne", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "blunt", "hard" }, values = { "strength", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Mirelle Tremayne sells heavy armor in the War Quarter and sizes up every customer like a sergeant inspecting recruits. She has no patience for anyone who thinks armor is for show.",
    third = "{name} met Mirelle Tremayne, who sells heavy armor in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Mail and plate. If it's not heavy, it's not mine." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "A fighter. Good; you'll know what you're looking at." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's a disgrace. Fix it or replace it, and preferably the second." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mirelle Tremayne. I sell armor to the War Quarter, and the War Quarter is hard on armor, so I sell a great deal of it." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Speak up." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Do the Forsaken need heavy armor?", next = "need" },
        { text = "Who are your customers?", next = "customers" },
        { text = "Not today.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "More than the living do. We don't heal the way they do, so every blow that lands stays landed. Plate keeps the pieces where they belong." } },
      choices = {
        { text = "Then why do some go without?", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      big = true,
      lines = { { id = "n2_default", text = "Pride, or poverty, or both. Some think being dead makes them hard to kill. It doesn't. What do you think, {class}, is armor for cowards?" } },
      choices = {
        { text = "No. Only fools fight unarmored.", next = "BACK", reply = "Good. You'll live, or whatever we do, a while longer.", fx = { align = { honor = 1 } } },
        { text = "A real warrior doesn't need it.", next = "BACK", reply = "A real warrior is in pieces on the Crusade's doorstep. Buy the plate.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Warriors from the trainers down the way, Deathguard who've outgrown their issue kit, and orcs who come through the city and find our plate fits better than they expected." } },
      choices = {
        { text = "Orcs, in Forsaken plate?", next = "BACK", reply = "Plate doesn't care who wears it, and neither do I, so long as they pay." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care. Buy something." } },
  },
}

---------------------------------------------------------------------------
-- Christopher Drakul: guild master in the Trade Quarter, among the bolts of tabard cloth.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_drakul", id = TODO_NPC("Christopher Drakul"), name = "Christopher Drakul", title = "Guild Master",
  bible = "bibles/more_folk.md", role = "clerk", tier = "service",
  communities = { "undercity" }, temper = { "formal", "dry" }, values = { "order", "community" },
  notices = { "race" },
  impression = {
    first = "Christopher Drakul registers guilds in the Trade Quarter among bolts of tabard cloth, and he treats every charter as a small act of rebuilding. He carries a priest's staff and never says why.",
    third = "{name} met Christopher Drakul, the guild master of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "A guild charter, perhaps? Or only browsing the cloth?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you found your fellows yet?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A charter from the Undercity carries the Dark Lady's seal, but it serves the whole Horde. You needn't be Forsaken to sign." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Christopher Drakul, guild master. I register companies, write charters, and keep the cloth for their tabards, and in a city of the dead, that's as close to a christening as we get." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "I'd like to see about a guild.", next = "BUSINESS" },
        { text = "Why do the Forsaken form guilds?", next = "why" },
        { text = "You carry a priest's staff.", next = "staff" },
        { text = "Not today.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "For the same reason the living do: no one survives alone. The Forsaken came back without families, most of us, and a guild is a family you choose, with a tabard to prove it." } },
      choices = {
        { text = "Is a guild truly a family?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some are, and some are merely a convenience with a crest on it. I write the charter either way. Which sort would you make, {class}?" } },
      choices = {
        { text = "A family. Loyal to the last.", next = "BACK", reply = "Then I'll write it with care. Those are the charters that last.", fx = { align = { honor = 1 } } },
        { text = "A convenience. Loyalty is earned by results.", next = "BACK", reply = "Honest, at least. Those charters come back to me torn, usually, but they come back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff = {
      lines = { { id = "s_default", text = "I do. It was mine before, and it came back with me, which is more than most of my memories did. I find it steadies the hand when I sign." } },
      choices = {
        { text = "I won't pry.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not a matter of charters, I'm afraid." } },
  },
}
