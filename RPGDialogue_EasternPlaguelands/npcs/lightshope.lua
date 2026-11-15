-- Light's Hope Chapel: the Argent Dawn's heart in the Eastern Plaguelands. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrosus", id = TODO_NPC("Lord Maxwell Tyrosus"), name = "Lord Maxwell Tyrosus",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "light_hope", "argent_dawn" }, temper = { "reserved" }, values = { "devout", "pragmatic" },
  notices = { "race", "class", "form" },

  impression = {
    first = "Lord Maxwell Tyrosus leads the Argent Dawn and says he's out of practice with visitors, though he hardly seemed it. He asks nothing about whose crown anyone serves, only whether they'll stand.",
    third = "{name} met Lord Maxwell Tyrosus, who leads the Argent Dawn from the chapel at Light's Hope.",
  },

  greetings = {
    { id = "g_rare", text = "I don't often receive visitors. You'll forgive me if I'm out of practice." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. Few return from the Plaguelands twice, and fewer bother to call on me." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "The Crusade would never have let you through the gate looking like that, but the Dawn will take your help. That's the whole difference between us, really." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Horde. Some of my officers still flinch, but I don't. The Scourge doesn't care whose blood it spills, and neither will I, when it's spilled for this." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I left the Silver Hand when it became the Scarlet Crusade, and you may yet show me there was something worth keeping." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maxwell Tyrosus. I lead the Argent Dawn, since Lord Raymond George fell, and we fight the Scourge and anything else that would end this world. We ask no one which crown they serve." },
        { id = "h_summoned", tags = { "news" }, when = { questActive = TODO_QUEST("Lord Maxwell Tyrosus") },
          text = "The Duke sent you, so he trusts you, and Nicholas trusts very few. Sit; we have a great deal to discuss, and Stratholme won't wait." },
        { id = "h_hold", when = { questActive = TODO_QUEST("The Argent Hold") },
          text = "The Argent Hold is open to you now. What's inside was made to be used against the dead, so use it." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I walk the chapel at dawn, before the guards change, because it's the only hour the Plaguelands are quiet. I've come to treasure it." },
      },
      again = { { id = "h_again", text = "What else? Speak freely; the chapel keeps no secrets from its own." } },
      choices = {
        { text = "Why did you leave the Silver Hand?", next = "left" },
        { text = "How did you come to lead the Dawn?", next = "lead" },
        { text = "What's happening in Stratholme?", next = "stratholme" },
        { text = "The Silver Hand is gone. Where does a paladin belong now?", next = "paladin", when = { class = "PALADIN" } },
        { text = "My training ended when the Hand broke apart.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "Gregor Greystone in Everlook sends his regards.", next = "gregor", when = { heardLine = "gregor.h_default" } },
        { text = "What does the Dawn need from a healer?", next = "priest_dawn", when = { class = "PRIEST" } },
        { text = "How can I help?", next = "END", fx = { affinity = 2, standing = { light_hope = 1 } } },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", key = true, text = "I didn't leave it; it left. The Hand I knew healed the sick and shielded the weak, and what became the Scarlet Crusade burns villages to save them. When they stopped asking whether someone was dead or only different, I walked away, and others came with me." },
      },
      choices = {
        { text = "You made the right choice.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Crusade's methods are harsh, but harsh times need them.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "The Crusade does fight the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "It does, with fire and fear, at whatever cost. I won't call them enemies, and I won't call them friends; out here, that distinction matters less every year." },
      },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
    lead = {
      lines = { { id = "ld_default", text = "Lord Raymond George fell, and someone had to stand where he stood. I'd have chosen anyone else, but nobody else was offered." } },
      choices = {
        { text = "What was he like?", next = "lead_raymond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lead_raymond = {
      lines = { { id = "lr_default", text = "Patient, and kind to fools, which I am not always. He'd have liked you; he liked anyone who came east of their own will." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stratholme = {
      lines = { { id = "s_default", text = "The heart of the plague, still beating. The Scourge holds most of it, the Crusade holds a corner, and between them lies everything that once lived there. Duke Zverenhoff has plans, and so do I." } },
      choices = {
        { text = "Plans?", next = "stratholme_plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_plans = {
      lines = { { id = "sp_default", text = "When you're ready to walk into that city and walk out again, I'll share them, and not before. I've buried enough of the merely brave." } },
      choices = {
        { text = "I've walked out of Stratholme already. Tell me.", tag = "Persuade", next = "stratholme_truth",
          check = { pass = { any = { { deed = "dungeon:Stratholme" }, { disposition = { min = 70 } }, { all = { { class = "PRIEST" }, { minLevel = 55 } } } } } },
          fail = { next = "stratholme_not_yet", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    paladin = {
      big = true,
      lines = { { id = "p_default", text = "Wherever the dead walk and someone stands against them. The Hand was a banner, but the Light was never in the banner; stand here long enough and you'll see it doesn't need one." } },
      choices = {
        { text = "Then I'll stand here.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { light_hope = 2 } } },
        { text = "I still miss the banner.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, align = { order = 1 } } },
      },
    },
    squire = {
      lines = { { id = "sq_default", text = "Then you're one of hundreds who were halfway to something when the ground fell away, so finish it here. The Dawn knights people; we just don't make a fuss about it." } },
      choices = {
        { text = "I'd like that.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'll fight beside the Dawn, but I don't need a title.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    gregor = {
      lines = { { id = "g_default", text = "Good man, Gregor. He writes the longest reports in the Dawn and every word is useful, which is rarer than courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_dawn = {
      lines = { { id = "pd2_default", text = "More than it needs swords. A sword stops the dead; a healer keeps the living from joining them. Stay a while at the chapel, priest, and Leonid and the wounded will both be glad of you." } },
      choices = {
        { text = "I'll stay a while.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { light_hope = 2 } } },
        { text = "The wounded will keep, and I'd rather be out burning the dead.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_truth = {
      big = true,
      lines = {
        { id = "st_default", text = "Then hear it as the Duke and I say it to each other: the Dawn hasn't the soldiers to take that city, and won't have them in my lifetime. So we send small companies like yours to cut the heads off, the Baron in his ziggurats first, and we pray the body falls after." },
        { id = "st_crusade", when = { deed = "dungeon:Stratholme" },
          text = "You've seen the Crusade's corner of it, so you'll understand the rest. I don't trust whatever holds that bastion any more than I trust the Baron, and I'd not say that in front of my officers, some of whom still have brothers in red." },
      },
      choices = {
        { text = "Then I'll go back in.", next = "BACK", fx = { affinity = 2, standing = { light_hope = 1 }, trait = { brave = 1 } } },
        { text = "You suspect the Crusade's leaders?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_not_yet = {
      lines = {
        { id = "sn_default", text = "Saying you've walked out of a place and having done it are different things, and I've learned to wait for the second. Come back with the city's ash on your boots and ask me again." },
      },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Dawn hears a great deal, and a fair part of it reaches this chapel. These are the matters I can speak to with some authority." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've earned plain answers from me, and I don't give many. Ask me about any of these and I'll hold nothing back that the Dawn can spare." },
    },
    background = { { id = "tp_ba", text = "A paladin of the Silver Hand, until the Hand forgot what it was for. Now the Argent Dawn, which hasn't forgotten yet.", next = "left" } },
    advice = { { id = "tp_ad", text = "Carry the Dawn's tokens, and never fight the Scourge alone at night. It doesn't sleep, but you must." } },
    argent_dawn = { { id = "tp_dawn", text = "No crown and no warchief, only the work, and the dead who'd undo it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "My old brothers, gone hard and blind. I pray for them, and I also post guards." } },
    _none = { { id = "tp_none", text = "Not my concern while the Scourge stands." } },
  },
}

P:NPC {
  key = "leonid", id = TODO_NPC("Leonid Barthalomew the Revered"), name = "Leonid Barthalomew the Revered",
  bible = "bibles/easternplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "gentle" }, values = { "devout", "selfless" },
  notices = { "race", "class", "form" },

  impression = {
    first = "Leonid Barthalomew apologized for his face before anything else. He is dead and knows it, and has decided to use that, with a calm I found more unsettling than any rage.",
    third = "{name} met Leonid Barthalomew the Revered, the undead priest who serves the Argent Dawn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_hello", text = "Don't be alarmed by my face. The Light still hears me, whatever I've become." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, at the chapel. The Dawn turns away no one who'll stand against the Scourge, but the wounded here have seen enough darkness. Step out of it when you visit them." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One who was freed, as I was. We owe the Banshee Queen our minds, but what we do with them is our own." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light, and so do I. It surprises people; it surprised me most of all." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Leonid Barthalomew. I died in the Scourging and rose a mindless thing, until the Banshee Queen freed my mind, and I gave it to the Argent Dawn. My undeath is a sickness, but it is also a weapon, and I mean to use it." },
        { id = "h_ras", when = { metBefore = true },
          text = "I was in Stratholme when Ras Frostwhisper became what he is. I remember his face as it changed. I'd like very much for him to stop." },
        { id = "h_sacrifice", when = { metBefore = true },
          text = "They call me Revered, though I'd rather they didn't. I only did what anyone would, if they'd already lost everything else." },
      },
      again = { { id = "h_again", text = "Yes? I have time; it's one of the few things the dead have plenty of." } },
      choices = {
        { text = "Does the Light really answer you?", next = "light" },
        { text = "Why the Dawn, and not the Banshee Queen?", next = "why" },
        { text = "Who is Ras Frostwhisper?", next = "ras" },
        { text = "We're the same, you and I.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'd like to help the Dawn, if you'll have me.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll work with the dead when I must, but I won't trust them.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    light = {
      lines = {
        { id = "l_default", text = "It burns, a little, like warmth on frostbitten hands. I've decided the burning is the Light reminding me what I'm for." },
      },
      choices = { { text = "That's beautiful, and terrible.", next = "BACK", fx = { affinity = 3 } } },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "She gave me back my mind, and I'm grateful, but I'd rather spend it ending the Scourge than settling scores. The Dawn has no other cause, and that suits me." } },
      choices = {
        { text = "Does she know?", next = "why_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_know = {
      lines = { { id = "wk_default", text = "I imagine the Banshee Queen knows a great deal. She hasn't come for me, and I take that as permission, or indifference. Either serves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ras = {
      lines = { { id = "r_default", text = "A man I knew, once, who wanted to live forever and found a way that cost everything worth living for. He teaches in Scholomance now, and I'd like his lessons to end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "In what we are, yes; in what we choose, we'll see. Choose well, and you'll find the living here are kinder than you expect, some of them." } },
      choices = {
        { text = "I'll choose well.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll choose what keeps me standing, and kindness rarely does.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've had a long death and a short second life to learn things in, and I'll share what I can. Ask me about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I lived, I died in Stratholme, and I rose. The third life is the one I mean to spend well.", next = "why" } },
    advice = { { id = "tp_ad", text = "If you're bitten, go to a priest at once, not tomorrow, at once." } },
    argent_dawn = { { id = "tp_dawn", text = "They took me in when no one else would have. I'll serve them until there's nothing left to serve with." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I know the Scourge, and that's knowledge enough for one unlife." } },
  },
}
