-- More of Caer Darrow's ghosts: Artist Renfray, who painted the Fordrings; Rory the fisherman, who knows
-- he is dead; Joseph Dirte, who still hauls the Barovs' refuse; and Baker Masterson, who still bakes.
-- Most are seen only with the Spectral Essence. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Artist Renfray: ghost painter of Caer Darrow, friend of the Fordrings, who hid "Of Love and Family".
P:NPC {
  key = "renfray", id = TODO_NPC("Artist Renfray"), name = "Artist Renfray",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "gentle", "weary" }, values = { "beauty", "memory", "loyal" },
  notices = { "paladin", "lore" },

  impression = {
    first = "Artist Renfray is a ghost at Caer Darrow who remembers everything the other spirits have forgotten, which seems to be her curse. She painted the Fordrings once, and she still speaks of Tirion as an old friend.",
    third = "{name} met Artist Renfray, the ghost of the painter who made the Fordring family's portrait at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then you've come a long way, and through a great deal of darkness." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The others never remember a face, but I do." },
    { id = "g_painting", when = { questActive = TODO_QUEST("Of Love and Family") }, text = "The Scarlet Bastion, behind the painting of our twin moons. Chip gently; it is my master work underneath." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A paladin! For a moment, I thought Tirion had come at last. Forgive a ghost her hopes." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself as Tirion did, before they took the Silver Hand from him. I'd have painted you in the morning light." },
    { id = "n_lore", cat = "lore", when = { questDone = TODO_QUEST("Of Love and Family") },
      text = "He has it back, doesn't he? I can feel it, somehow, the way you feel a window open in another room." },
    { id = "n_hand", cat = "lore", when = { origin = { "human_paladin_squire", "forsaken_unsworn_squire", "forsaken_risen_knight" } },
      text = "You wear the old Order's bearing, and I think you once carried a squire's lantern. I painted a great many squires, and they all stood the way you do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I was Renfray, the artist, when this island had people on it who wanted their portraits painted. Many of the spirits here are cursed to relive their last happy memory, but I am one of the few who remembers all of it." },
        { id = "h_sent", tags = { "news" }, when = { questActive = TODO_QUEST("Of Love and Family") },
          text = "Tirion sent you? Tirion, my old friend, is that you, come to save us? No, of course not, but you've come from him, and that is nearly as good." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Of Love and Family") },
          text = "You found it, and you brought it to him. Perhaps this was the thing that kept me here, and perhaps I'll be free of it soon." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have nothing but time, and a great deal of it is memory." },
        { id = "h_again2", text = "Go on. It's good to be asked something." },
        { id = "h_again3", text = "Ask it. So few of the living come here that I've begun to ration my own stories." },
      },
      choices = {
        { text = "What happened to Caer Darrow?", next = "darrow" },
        { text = "Tell me about the Fordrings' portrait.", next = "portrait" },
        { text = "You knew Tirion Fordring?", next = "tirion" },
        { text = "Why do you remember, when the others don't?", next = "curse" },
        { text = "Tell me about the other spirits here.", next = "spirits" },
        { text = "I'd have liked to see your studio.", next = "studio" },
        { text = "I've stood in the Scarlet Bastion.", next = "bastion", when = { deed = "dungeon:Stratholme" } },
        { text = "I serve the Light, as Tirion did.", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Rest easy, Renfray.", next = "END" },
      },
    },

    darrow = {
      lines = {
        { id = "da_default", text = "A plague came up out of Scholomance, out of the Barovs' own cellars, and ate the town alive from the inside. It wasn't the Scourge; there was no Scourge yet, only men in robes beneath the Barov house and a sickness no priest could touch." },
      },
      choices = {
        { text = "The Barovs allowed this?", next = "darrow_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrow_barov = {
      lines = {
        { id = "db_default", text = "They sold their island to the Cult of the Damned for a promise, and the Cult kept its promise in its own way. Alexei Barov gave the order, and his children inherited the ruin." },
      },
      choices = {
        { text = "The Barovs should answer for it.", next = "darrow_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrow_answer = {
      big = true,
      lines = {
        { id = "dn_default", text = "Some say the sons are doing just that, sending others to kill each other's servants. I'm too tired to wish them harm, but I can't find it in me to wish them well." },
      },
      choices = {
        { text = "Let them answer to justice, then.", next = "BACK", reply = "Justice. I'd almost forgotten the word. I hope it finds them, if it can find anything here.", fx = { align = { light = 1 } } },
        { text = "Let them tear each other apart. It's earned.", next = "BACK", reply = "Perhaps it is. I only wish it didn't have to happen on my island.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    portrait = {
      lines = {
        { id = "po_default", text = "The Fordrings came here on family excursions, and on their last visit, I painted them along the beach: Tirion, his wife Karandra and their boy Taelan. I called it Of Love and Family, and it was the best thing I ever made." },
      },
      choices = {
        { text = "Where is it now?", next = "portrait_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portrait_where = {
      lines = {
        { id = "pw_default", text = "It hung on the wall of my workshop inside the Order's barracks in Stratholme for years. After Tirion's trial I knew I couldn't keep it visible, so I hid it under another painting, a painting of our twin moons." },
        { id = "pw_active", when = { questActive = TODO_QUEST("Of Love and Family") },
          text = "In Stratholme, deep in what is now the Scarlet Bastion, under a painting of our twin moons. Chip away at the paint until you uncover it, and may the Light guide your hand." },
      },
      choices = {
        { text = "Why hide it?", next = "portrait_hide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portrait_hide = {
      lines = {
        { id = "ph_default", text = "Because Tirion was stripped of his title and sent away for sparing an orc, and his name became something people spat. I wouldn't let them burn his family's faces for it." },
      },
      choices = {
        { text = "That was loyal of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tirion = {
      lines = {
        { id = "ti_default", text = "Very well, once. He laughed more than paladins are supposed to, and he held his son as if the boy might blow away. I don't know what became of them after the trial, and I'm afraid to ask." },
      },
      choices = {
        { text = "He's alive. He lives in exile.", next = "tirion_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tirion_alive = {
      big = true,
      lines = {
        { id = "ta_default", text = "Alive! And Taelan? No, don't tell me if it's bad. I would rather keep the boy on the beach a little longer." },
      },
      choices = {
        { text = "Then I won't. Keep him there.", next = "BACK", reply = "Thank you. That's a kindness the living rarely think to give us.", fx = { align = { honor = -1 } } },
        { text = "You deserve the truth, even if it hurts.", next = "BACK", reply = "Perhaps I do. But not today. Today let me be a painter with a happy picture.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    curse = {
      lines = {
        { id = "cu_default", text = "I don't know. Perhaps there's something I left undone, and the curse wants it done. Perhaps the thing you're asking about is why I haunt these ruins, and perhaps telling it shall set me free." },
      },
      choices = {
        { text = "Then I hope it does.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Masterson bakes for a town that isn't there, and Joseph hauls refuse from a house that has none. They are happy, in a fashion. Rory knows the truth as I do, and it has made him bitter, where it has only made me tired." } },
      choices = {
        { text = "Should they be told?", next = "spirits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits2 = {
      lines = { { id = "sp2_default", text = "I tried, in the first year. Masterson gave me a roll and said I was overwrought. I think the forgetting is the only mercy this island was shown, and I've decided it isn't mine to take away from them." } },
      choices = {
        { text = "That's a hard kindness to keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    studio = {
      lines = { { id = "su_default", text = "It was two rooms above the chandler's, with a north window over the water. I painted the Barov children there when they were small, and the magistrate, and half the fishermen, who paid me in perch. The light off Darrowmere was the best I ever worked in." } },
      choices = {
        { text = "And then you went to Stratholme.", next = "studio2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    studio2 = {
      lines = { { id = "su2_default", text = "The Order of the Silver Hand offered me a workshop in their barracks, to paint their knights for the chapter house. It was a great honour, and I took it, and I came home to Caer Darrow in the summers. It was a summer when the sickness came." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bastion = {
      lines = { { id = "ba_default", text = "Then you've walked my corridor, and I envy you even that. Tell me, do the Scarlets keep the paintings on the walls, or have they burned them for vanity? I painted forty knights for that hall." } },
      choices = {
        { text = "Some still hang. They're dark with smoke.", next = "BACK", reply = "Smoke can be cleaned, by a patient hand. Thank you. I can see them a little better for knowing.", fx = { affinity = 1 } },
        { text = "I didn't stop to look at the walls.", next = "BACK", reply = "No, I don't suppose one does, in that place now. It was a foolish thing to ask." },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = { { id = "li_default", text = "Then you'll understand why I loved to paint him. Most knights stood for me as if they were on parade. Tirion sat on a rock with his boots off and let his son climb on him, and the Light was in that more than in any armour." } },
      choices = {
        { text = "That's the Light I was taught, too.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    silver_hand = { { id = "tp_hand", text = "I painted them for eleven years. They were braver than they were wise, most of them, and I was fond of nearly all." } },
    scholomance = { { id = "tp_schol", text = "It was a school for the sons of gentlemen when I was a girl. I painted its headmaster once, and I wish now that I had refused the commission." } },
    _none = { { id = "tp_none", text = "I don't remember that, and I remember almost everything. It must not have mattered very much." } },
  },
}

-- Rory: ghost fisherman of Caer Darrow, who knows that the town is dead.
P:NPC {
  key = "rory_darrow", id = TODO_NPC("Rory"), name = "Rory",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "caer_darrow" }, temper = { "grim", "weary" }, values = { "memory", "honest" },
  notices = { "profession" },

  impression = {
    first = "Rory fishes off Caer Darrow's shore as a ghost, and unlike most of his neighbours he knows exactly what he is. He wants it understood that the Scourge didn't kill his town; something worse and older did.",
    third = "{name} met Rory, a ghost fisherman of Caer Darrow who remembers that the town is dead.",
  },

  greetings = {
    { id = "g_default", text = "Another one who can see us. Leave me to my line, if you please." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The fish haven't bitten since I died, in case you were wondering." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "You fish? Then you'll know the lake was good, once." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "A dead one that knows it. Well, that's two of us on this shore, then." },
  },

  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "That's a fisher's rod. Don't bother with the lake; nothing in it is worth eating now." },
    { id = "n_deed", cat = "profession", when = { deed = "dungeon:Scholomance" },
      text = "You've the smell of that school on you, under the lake water. You've been below, haven't you, and come out again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They don't realise that they're dead. They're cursed to relive the last memory they had before the town was eaten alive from the inside out, most of them, anyway. Some were less fortunate." },
      },
      again = {
        { id = "h_again", text = "Still here? Ask, then." },
        { id = "h_again2", text = "What else?" },
        { id = "h_again3", text = "Say it, then. The line's not going anywhere." },
      },
      choices = {
        { text = "The Scourge did this?", next = "scourge" },
        { text = "Why do you remember?", next = "remember" },
        { text = "Who were the less fortunate?", next = "unfortunate" },
        { text = "What was the fishing like, before?", next = "fishing" },
        { text = "Tell me about the day it happened.", next = "day" },
        { text = "I've been inside Scholomance.", next = "inside", when = { deed = "dungeon:Scholomance" } },
        { text = "I'm dead too, Rory. It can be borne.", next = "dead", when = { race = "Scourge" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    scourge = {
      lines = {
        { id = "sc_default", text = "You thought the Scourge did this? The Scourge did not yet exist, and if they had, we would at least have put up a damned fight. This was a plague out of Scholomance, and none survived." },
      },
      choices = {
        { text = "Scholomance is still full of them.", next = "scourge_school" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scourge_school = {
      big = true,
      lines = {
        { id = "ss_default", text = "I know. I watch the boats come and go from the island, carrying new students in and nothing out. If you're going in, burn it to the ground, and I'll go with you in spirit." },
      },
      choices = {
        { text = "I'll see it cleansed, Rory.", next = "BACK", reply = "Cleansed. Aye, that'd do. Go on, then, and good luck.", fx = { align = { light = 1 } } },
        { text = "I'll take what I need from it. That's all.", next = "BACK", reply = "Then you're no better than the ones who brought it here. Leave me to my sorrows.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = {
        { id = "re_default", text = "I don't know, and I'd give anything to forget. Masterson still bakes bread no one eats, and Joseph still hauls the Barovs' rubbish, and I'm the only one who can see that it's pointless." },
      },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    unfortunate = {
      lines = {
        { id = "un_default", text = "The ones who were taken below and made into what walks the halls of the school now. At least the rest of us got to keep our faces. Now leave me to my sorrows." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Goodbye, Rory.", next = "END" },
      },
    },
    fishing = {
      lines = { { id = "fi_default", text = "Perch and pike by the reeds, and eels as long as your arm off the north point. Darrowmere fed this island and half of Andorhal besides. I took a boat out every dawn for twenty years, and I never once came home empty." } },
      choices = {
        { text = "And now?", next = "fishing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing2 = {
      lines = { { id = "fi2_default", text = "Now the lake's full of things that were people, and the fish that are left have too many eyes. I cast anyway. A man who stops doing the one thing he knew how to do has nothing left to be but a ghost." } },
      choices = {
        { text = "Then keep casting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    day = {
      lines = { { id = "dy_default", text = "There wasn't a day. That's what nobody understands. It was a fortnight of people coughing and saying it was the damp, and then one morning the baker didn't open, and by evening the bells had nobody left to ring them." } },
      choices = {
        { text = "Did no one try to leave?", next = "day2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    day2 = {
      lines = { { id = "dy2_default", text = "The ferry was held at the mainland on Lord Barov's order, to keep the sickness from spreading, they said. I think it was to keep us where we'd be useful. Old Marduke the magistrate sent word across for help all the same, and no help ever came." } },
      choices = {
        { text = "Marduke's spirit is here as well?", next = "BACK", reply = "Up by the old square. He knows what he is, like me, and he's found something to do about it. Go and ask him." },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = { { id = "in_default", text = "Then you've seen what they did with us. Tell me one thing, and tell it straight. The ones they took below, do any of them still know their own names?" } },
      choices = {
        { text = "No. Whatever they were is gone.", next = "BACK", reply = "Good. That's the first kind thing I've heard in years. Then there's nobody down there to be sorry for, only things to be put down.", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "I couldn't tell. I didn't stop to ask.", next = "BACK", reply = "No. I'd not have stopped either. Leave it, then." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "Borne, aye. You've a body to bear it in, and somewhere to walk to. I've a rod and thirty yards of shore. Still, you're the first who's said it to me as one who'd know, and I'll not throw that back at you." } },
      choices = {
        { text = "Then I'll come by again.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "tp_schol", text = "A school, they called it. It was a kennel, and we were what they fed the dogs." } },
    scourge = { { id = "tp_scourge", text = "They came after. By the time there was a Scourge to blame, Caer Darrow was already a year in the ground." } },
    kelthuzad = { { id = "tp_kt", text = "I saw him once, on the ferry, in a fur collar. He tipped the ferryman well, and I remember thinking he had cold eyes for a generous man." } },
    _none = { { id = "tp_none", text = "Don't know. Don't care. I'm fishing." } },
  },
}

-- Joseph Dirte: ghost of Caer Darrow's refuse man, still at his shed.
P:NPC {
  key = "joseph_dirte", id = TODO_NPC("Joseph Dirte"), name = "Joseph Dirte", title = "Waste Management",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "caer_darrow" }, temper = { "cheerful", "touchy" }, values = { "pride", "work" },
  notices = { "kit" },

  impression = {
    first = "Joseph Dirte is a ghost who still believes he hauls the Barovs' rubbish, and he insists on the full title of Waste Management Specialist. Cross him and he threatens you with his fists of fury. He misses someone called Brandy.",
    third = "{name} met Joseph Dirte, the ghost of Caer Darrow's refuse man, who still minds his shed.",
  },

  greetings = {
    { id = "g_default", text = "Busy day, busy day. Mind the bins, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The Barov house never stops, so neither do I." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "Now there's somebody who appreciates a well-built handcart, I can see it. Have a look at those axles, friend, greased this morning." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at the state of your gear! I've hauled better off the Barov midden, and I should know." },
    { id = "n_dwarf", cat = "kit", when = { race = "Dwarf" },
      text = "A dwarf! Strong backs, your lot. If you ever want honest work, there's a second cart in the shed and nobody to push it." },
    { id = "n_warrior", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're a big strong sort. You could lift the far end of this bin for me, and save a specialist his back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Joseph Dirte, and my job title is Waste Management Specialist, thank you very much. The Barov house sure does keep me busy, because there's always some sort of refuse coming out of there." },
        { id = "h_met", when = { metBefore = true }, text = "Joseph Dirte, Waste Management Specialist, and you got the title right last time, so we're friends. There's been another load out of the Barov cellars since you were by, and it's heavier than the last." },
      },
      again = {
        { id = "h_again", text = "What else? These bins won't empty themselves." },
        { id = "h_again2", text = "Speak up, friend!" },
        { id = "h_again3", text = "Go on, then, I can talk and tip a bin." },
      },
      choices = {
        { text = "Refuse from the Barovs?", next = "refuse" },
        { text = "So you're the rubbish man.", next = "title" },
        { text = "Who's Brandy?", next = "brandy" },
        { text = "Where do you haul it all?", next = "haul" },
        { text = "How do you find the Barovs, as masters?", next = "barovs" },
        { text = "Do you know the others on the island?", next = "others" },
        { text = "Let me take the other end of that bin.", next = "lift", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } } },
        { text = "Good luck with the bins.", next = "END" },
      },
    },
    refuse = {
      lines = {
        { id = "rf_default", text = "Strange stuff lately, too: bones, and robes, and jars that smell of the grave. I don't ask, I just haul, but there's more of it every week, and none of it's from the kitchens." },
      },
      choices = {
        { text = "Joseph, the Barovs are gone. So is the town.", next = "refuse_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse_dead = {
      big = true,
      lines = {
        { id = "rd_default", text = "Gone? Don't be daft, I hauled their bins this morning, same as every morning. You're having a laugh at a working man, and I don't care for it." },
      },
      choices = {
        { text = "You're right. Forget I said anything.", next = "BACK", reply = "Forgotten already, friend. Now, where was I?", fx = { align = { honor = -1 } } },
        { text = "I'm not laughing. You died here, Joseph.", next = "BACK", reply = "I... no. No, I've the bins to do. I've always got the bins to do.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    title = {
      lines = {
        { id = "ti_default", text = "Waste Management Specialist! Perhaps you should speak into these sound-enhancing devices attached to my FISTS OF FURY. Say it properly, and we'll get on fine." },
      },
      choices = {
        { text = "Waste Management Specialist. My apologies.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brandy = {
      lines = {
        { id = "br_default", text = "Ah, my sweet Brandy, I miss her so! She went to the mainland to see her sister, and she's been gone ever so long. She'll be back any day now." },
      },
      choices = {
        { text = "I hope she comes back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    haul = {
      lines = { { id = "hl_default", text = "Down to the pit on the north shore, where the wind takes the smell out over the lake. The kitchen waste I burn, and the rest I bury. Lately there's been stuff the fire won't touch, and I've had to dig the pit a good deal deeper." } },
      choices = {
        { text = "What won't burn?", next = "haul2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    haul2 = {
      lines = { { id = "hl2_default", text = "Bones that have gone a funny colour, friend, and rags that hiss when they're wet. One of the gentlemen in the dark robes told me to bury those and not to mention them. He gave me a silver, so I'm not mentioning them, except to you." } },
      choices = {
        { text = "You should stay out of those cellars.", next = "BACK", reply = "I never go further than the scullery door, friend. I'm a specialist, and I'm not a fool.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barovs = {
      lines = { { id = "bv_default", text = "Lord Alexei pays on the quarter day and never looks at me, which is how I like a master. The young lords are another thing. Master Weldon and Master Alexi fight like cats in a sack, and I've carried out more broken crockery than a man should." } },
      choices = {
        { text = "What do they fight about?", next = "barovs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barovs2 = {
      lines = { { id = "bv2_default", text = "Who gets what when the old man goes. Caer Darrow, Brill, Tarren Mill and Southshore, they've the deeds to all four, and each boy wants the lot. I say there'll be nothing left worth having by the time they've done, but nobody asks the rubbish man." } },
      choices = {
        { text = "Waste Management Specialist, you mean.", next = "BACK", reply = "Hah! There, you see, you've got it. I forget it myself when I'm cross.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Course I do, I collect from all of them. Masterson's bins are all crusts and no trouble. The artist's are full of rags stiff with paint. And old Marduke the magistrate puts his out so tidy that I feel I ought to knock and thank him." } },
      choices = {
        { text = "And Rory, the fisherman?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = { { id = "ot2_default", text = "Rory's got it into his head that we're all dead, if you please! Stood on the jetty and told me so to my face. I said, Rory, if I'm dead, who's been emptying your fish guts every week? He'd no answer to that." } },
      choices = {
        { text = "It's a fair question.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lift = {
      lines = { { id = "lf_default", text = "Would you? There's a good sort. Mind, bend at the knees. Hup! There. Do you know, in all my years, not one of the gentry on this island has ever offered, and you a stranger off the ferry." } },
      choices = {
        { text = "Any working man would do the same.", next = "BACK", reply = "Any working man, aye. That's just what I'm saying.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "tp_schol", text = "The academy under the big house? I do their bins, and I wish I didn't. Nothing a school throws out should be that heavy." } },
    background = { { id = "tp_bg", text = "Born on the island, friend, same as my dad, who had the cart before me. He was only a rubbish man. I'm a specialist." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. I just haul what the Barovs throw out." } },
  },
}

-- Baker Masterson: ghost baker of Caer Darrow, still selling bread and drink.
P:NPC {
  key = "baker_masterson", id = TODO_NPC("Baker Masterson"), name = "Baker Masterson",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "caer_darrow" }, temper = { "warm", "cheerful" }, values = { "hospitality", "craft" },
  notices = { "hunger" },

  impression = {
    first = "Baker Masterson still bakes and sells bread at Caer Darrow, though he's been dead for years and doesn't seem to know it. He's warm and busy, and it's the saddest thing on the island.",
    third = "{name} met Baker Masterson, the ghost baker who still sells bread at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "Fresh from the oven! Well, fresh enough, it's been a busy morning." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like my rolls." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "Another hand for the ovens? No, I can see you're only passing, dear, but you've a cook's eye for the crust, haven't you?" },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved, poor thing! Sit, sit, and have a roll before you go any further." },
    { id = "n_tauren", cat = "hunger", when = { race = "Tauren" },
      text = "My word, you're a big one! I've never baked for one of your folk, dear, but I'd guess you'd want the whole tray and not the roll." },
    { id = "n_scourge", cat = "hunger", when = { race = "Scourge" },
      text = "You're looking very peaky, dear, grey as a dishcloth. That'll be the fever from the big house. Have something warm and sit by the oven a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Masterson's the name, and bread's the game, as my father used to say. The Barovs' guests eat well, and the townsfolk eat better, so long as I'm up before the sun." },
        { id = "h_met", when = { metBefore = true }, text = "Masterson's the name, and you've had my bread before, I never forget a customer. Now, was it the seed loaf or the plain? I'll have another batch out before the ferry bell." },
      },
      again = {
        { id = "h_again", text = "What else, dear? The loaves are rising." },
        { id = "h_again2", text = "Go on, I'm listening." },
        { id = "h_again3", text = "Yes, dear? Mind the peel, it's hot." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Who buys from you these days?", next = "customers" },
        { text = "You haven't noticed anything strange?", next = "strange" },
        { text = "How do you make your bread?", next = "bread" },
        { text = "Tell me about your neighbours.", next = "folk" },
        { text = "That's a fine oven for a small island.", next = "oven" },
        { text = "I bake a little myself.", next = "baker", when = { profession = "Cooking" } },
        { text = "Not today.", next = "END" },
      },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "Everyone! Well, it's been quiet this week, very quiet, and I can't think why. Maybe the Barovs have a fever going round the house again." },
      },
      choices = {
        { text = "A fever?", next = "customers_fever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_fever = {
      big = true,
      lines = {
        { id = "cf_default", text = "Some sickness or other, coming up out of the cellars, the maids say. I keep baking, because sick folk need bread more than anybody." },
      },
      choices = {
        { text = "That's kind. Keep baking.", next = "BACK", reply = "I will, dear, I always do.", fx = { align = { light = 1 } } },
        { text = "Nobody's coming, Masterson. They're all gone.", next = "BACK", reply = "Gone? Don't be silly. They'll be along once the fever's passed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = {
        { id = "st_default", text = "Strange? Only that the flour never seems to run out, and the oven's always warm. I'm not one to look a gift horse in the mouth, dear." },
      },
      choices = {
        { text = "No, I suppose not.", next = "BACK" },
        { text = "Let's see the bread.", next = "BUSINESS" },
      },
    },
    bread = {
      lines = { { id = "bd_default", text = "Darrowmere water and Andorhal flour, dear, and a starter my father kept going for thirty years before me. The flour comes over on the ferry every week, and the last few sacks have been lovely, so fine and so pale." } },
      choices = {
        { text = "Andorhal flour? Are you sure it's sound?", next = "bread2" },
        { text = "It sounds like honest bread.", next = "bread2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bread2 = {
      lines = { { id = "bd2_default", text = "Sound? It's the best grain in Lordaeron, dear, the king's own table gets it. There was some talk off the ferry about sickness in the mills, but folk will say anything to pass a crossing, and I've a town to feed." } },
      choices = {
        { text = "Of course. Forgive me.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk = {
      lines = { { id = "fk_default", text = "Oh, they're good people. Joseph takes my burnt ends away with the Barovs' rubbish and never grumbles, and Rory used to bring me a perch every week for a loaf. He's gone very sour lately, has Rory, and won't say why." } },
      choices = {
        { text = "And the artist?", next = "folk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk2 = {
      lines = { { id = "fk2_default", text = "Renfray! She buys the hard crusts to rub out her charcoal, would you believe, and pays full price for them. She did a little drawing of my shopfront once, and I've got it up by the till. Go and look at it, dear, it's just there." } },
      choices = {
        { text = "It's a lovely drawing.", next = "BACK", reply = "Isn't it? She's caught the smoke from the chimney and everything.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "There's nothing on that wall, Masterson.", next = "BACK", reply = "It's right there by the till, dear. You want your eyes seeing to, as well as a good dinner." },
      },
    },
    oven = {
      lines = { { id = "ov_default", text = "Lord Barov had it built when the academy took more students, dear, because scholars eat like soldiers. It's never gone cold since. I don't even recall the last time I laid the fire, now you mention it, and yet it's always just right." } },
      choices = {
        { text = "An oven that tends itself.", next = "BACK", reply = "That's good masonry for you. They don't build them like that on the mainland." },
        { text = "Something else.", next = "BACK" },
      },
    },
    baker = {
      lines = { { id = "bk_default", text = "Do you! Then you'll know that the dough tells you when it's ready, and never the clock. I've had apprentices who wouldn't learn it, always peeking and poking. What's your trouble, dear, the rise or the crust?" } },
      choices = {
        { text = "The crust. It comes out pale.", next = "baker2" },
        { text = "The rise. It falls when I turn it out.", next = "baker2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    baker2 = {
      lines = { { id = "bk2_default", text = "Then your oven's not hot enough when it goes in, and that's all it is. Get the stones roaring, put a pan of water on the floor of it, and don't open the door to look. Bread's like children, dear, it does best when you trust it." } },
      choices = {
        { text = "Thank you. I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    andorhal = { { id = "tp_and", text = "Best grain in the kingdom, dear. I'll not hear a word against Andorhal flour." } },
    scholomance = { { id = "tp_schol", text = "The academy? Hungry lads, all of them, and very pale. They don't get enough sun, studying down in those cellars." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask me about bread." } },
  },
}

---------------------------------------------------------------------------
-- Magistrate Marduke: ghost of Caer Darrow's magistrate, who remembers everything and means to unmake Ras Frostwhisper.
---------------------------------------------------------------------------
P:NPC {
  key = "marduke", id = TODO_NPC("Magistrate Marduke"), name = "Magistrate Marduke",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "grave", "exact" }, values = { "justice", "dutiful" },
  notices = { "deeds", "class" },
  impression = {
    first = "Magistrate Marduke is a ghost who stands by the door of Scholomance and remembers all of what was done to his town. He has spent his death building a case against the lich who runs the school, and he means to see sentence carried out.",
    third = "{name} met the ghost of Magistrate Marduke at Caer Darrow, who planned the destruction of Ras Frostwhisper.",
  },

  greetings = {
    { id = "g_default", text = "Some were spared the anguish that memories provide. I was not, and so I have had time to think." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Good. A magistrate learns to distrust those who promise and are not seen again." },
    { id = "g_keepsake", when = { questActive = TODO_QUEST("The Human, Ras Frostwhisper") }, text = "A keepsake of remembrance is a rare find, {class}. Have you been to Stromgarde?" },
    { id = "g_lich", when = { questActive = TODO_QUEST("The Lich, Ras Frostwhisper") }, text = "You carry the means to make him a man again. Then go below, and finish what this town could not." },
  },

  notice = {
    { id = "n_schol", cat = "deeds", when = { deed = "dungeon:Scholomance" },
      text = "You have been inside the school. I can see it on you, as one sees a courtroom on a man who has just been sentenced." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, properly trained. The one I mean to destroy was a hedge wizard who never earned his robes, and I think that is where his resentment began." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Marduke, magistrate of Caer Darrow, though there is no town left to hear my rulings. The Cult of the Damned made its school beneath us, and I have one case remaining on my docket, against its overseer." },
        { id = "h_before", when = { minLevel = 55, questBefore = TODO_QUEST("The Human, Ras Frostwhisper") }, text = "The lich Ras Frostwhisper cannot be killed as he is. I mean to rob him of his powers, return him to his mortal form, and then have him slain once and for all. For that I need a keepsake from his years among the living, and his home was Stromgarde." },
        { id = "h_found", when = { questDone = TODO_QUEST("The Human, Ras Frostwhisper"), questBefore = TODO_QUEST("The Lich, Ras Frostwhisper") }, text = "I had doubted that such an item could exist, and you have set it in my hand. Prepare yourself, {class}, because what I ask of you next will take you into the depths of that school." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Lich, Ras Frostwhisper") }, text = "Ras Frostwhisper died a man, in the place where he chose to stop being one. The sentence is carried out, and the court of Caer Darrow thanks you, though the court is one old ghost." },
      },
      again = {
        { id = "h_again", text = "Ask. I have nothing but time, and a great deal of evidence." },
        { id = "h_again2", text = "Go on. I shall answer as exactly as I am able." },
        { id = "h_again3", text = "Yes? Speak plainly, as before a bench." },
      },
      choices = {
        { text = "Who is Ras Frostwhisper?", next = "ras" },
        { text = "What is the Cult of the Damned, truly?", next = "cult" },
        { text = "How do you unmake a lich?", next = "plan" },
        { text = "What happened to your town?", next = "town" },
        { text = "I've walked his halls. He's worse than you say.", next = "walked", when = { deed = "dungeon:Scholomance" } },
        { text = "Was any of this lawful, magistrate?", next = "law", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Court is adjourned, magistrate.", next = "END" },
      },
    },
    ras = {
      lines = { { id = "r_default", text = "The overseer of this school, and the one who trains its dark masters. He was a favoured pupil of Kel'Thuzad, and before that a hedge mage of Stromgarde who never had his formal training from Dalaran." } },
      choices = {
        { text = "How did such a man become a lich?", next = "ras2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ras2 = {
      lines = { { id = "r2_default", text = "When Kel'Thuzad opened the Cult, Ras was among the first to join, because he believed dark magic would give him immortality. He rose quickly, and the Lich King himself granted the wish. So you see that he was given exactly what he asked for." } },
      choices = {
        { text = "Then he'll get what he's owed, too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "It has grown large in scope. Nearly every city, from the capitals to the small hamlets, has Cult members hidden among its people. They wear a uniform only for ritual, and it is quite possible that you have spoken with one and never known." } },
      choices = {
        { text = "Living people, serving the Scourge?", next = "cult2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      big = true,
      lines = { { id = "c2_default", text = "Consider which is worth more to Kel'Thuzad: one undead soldier, or a zealous living follower who can work his way into a town and then loose a plague upon thousands. This was always their method, and the Scholomance is where they learn it." } },
      choices = {
        { text = "Then every town should be searched.", next = "BACK", reply = "And every neighbour suspected? That is how the Scarlet Crusade began. No. Strike the school, and the pupils have no master.", fx = { align = { order = 1 } } },
        { text = "You can't purge a town on suspicion.", next = "BACK", reply = "No, you cannot, and I would not sign such an order. That is why we strike at the source instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan = {
      lines = {
        { id = "p_default", text = "There are very few ways in which a lich can truly be destroyed, and none of them are open to you or to me. So we do not destroy the lich. We take from him what makes him one, and we kill the man who is left." },
        { id = "p_active", when = { questDone = TODO_QUEST("The Human, Ras Frostwhisper") }, text = "With the keepsake, a lifestone can be made, and with that he can be forced back into the flesh he threw away. Leonid Barthalomew at Light's Hope Chapel knows more of the working than I do, and you will need him." },
      },
      choices = {
        { text = "And the keepsake makes that possible?", next = "plan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan2 = {
      lines = { { id = "p2_default", text = "The undead fear life as the living fear death. Most destroy every remnant of who they were, once turned. If Ras left even one such thing behind in Stromgarde, it is a thread still tied to his mortal self, and I intend to pull on it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "The Barovs sold the cellars of their house to the Cult, and a sickness came up out of them before there was any Scourge to blame. None survived. Most of my people walk here still, cursed to repeat their last contented hour." } },
      choices = {
        { text = "Why were you spared the forgetting?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "t2_default", text = "I do not know. Rory the fisherman remembers, and the artist, and I. Perhaps it is those of us who suspected something and did too little. I had complaints about that house on my desk for a year, and I was waiting for proof." } },
      choices = {
        { text = "You couldn't have known what it was.", next = "BACK", reply = "I could have asked sooner. It is kind of you, and I shall not accept it.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then this is your proof, late as it is.", next = "BACK", reply = "Just so. And a late verdict is still a verdict." },
        { text = "Something else.", next = "BACK" },
      },
    },
    walked = {
      lines = { { id = "w_default", text = "I do not doubt it. I have only the evidence of what came out of that door, and you have seen what remains within. Tell me one thing for the record. Do the students go to him willingly?" } },
      choices = {
        { text = "Willingly, and eagerly. They compete for it.", next = "BACK", reply = "Then they are accomplices, and I shall not mourn them. Let that be entered.", fx = { trait = { honest = 1 } } },
        { text = "Some looked afraid. I couldn't swear to more.", next = "BACK", reply = "Then some may be victims, and I am glad you said so. A court should know the difference, even at the end.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    law = {
      lines = { { id = "l_default", text = "A fair question, and I have put it to myself. I am a judge with no court, passing sentence on one who is beyond every statute Lordaeron ever wrote. I have decided that where there is no law, there may still be justice, if it is done soberly." } },
      choices = {
        { text = "The Light asks no more than that.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "tp_schol", text = "The primary source of the Cult's training. Everything that leaves it is a crime not yet committed." } },
    kelthuzad = { { id = "tp_kt", text = "He came to the Barovs as a gentleman with a proposal. I am told he was very courteous, and I have distrusted courtesy ever since." } },
    scourge = { { id = "tp_scourge", text = "They came after we were already dead. Do not let anyone tell you that the Scourge destroyed Caer Darrow. Men did it, for a fee." } },
    _none = { { id = "tp_none", text = "That is outside the matter before me, and I have only the one matter." } },
  },
}

---------------------------------------------------------------------------
-- Magnus Frostwake: dwarf ghost at Caer Darrow who still sells smithing plans and recipes from a forge long cold.
---------------------------------------------------------------------------
P:NPC {
  key = "magnus_frostwake", id = TODO_NPC("Magnus Frostwake"), name = "Magnus Frostwake",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "caer_darrow" }, temper = { "gruff", "proud" }, values = { "craft", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Magnus Frostwake is the ghost of a dwarven smith who kept a forge on Caer Darrow and still sells his plans from it. He believes trade has merely been slow, and he blames the ferry.",
    third = "{name} met Magnus Frostwake, a dwarven ghost who still sells smithing plans at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "Aye, come in out of the wind. I've plans and recipes, good ones, and not a customer since I can't say when." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "By my beard, a dwarf! Sit ye down, {g:lad|lass}. I've not heard a proper voice on this rock in an age." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Good. You're the only trade I've had all week, and I've stopped counting the weeks." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye've a smith's hands, and ye've burned them on the same spot I did. Then ye'll know my plans are worth what I ask." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, are ye? I took a few recipes in trade from the academy's own stillroom. I can't make head nor tail of them, but they're genuine." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll have opinions on my bellows, I've nae doubt. Go on, have a look, but put back anything ye unscrew." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Magnus Frostwake, smith. I came up from Ironforge to shoe Lord Barov's horses and stayed for the lake air, and I've a fair wee forge here, though the coals have been stubborn of late." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Magnus Frostwake, of Ironforge, a long time since. Tell me, {g:lad|lass}, does the Great Forge still burn? I've had nae letters, and I've begun to think the post is lost." },
      },
      again = {
        { id = "h_again", text = "Aye? What else are ye after?" },
        { id = "h_again2", text = "Go on, I've nae other custom to mind." },
        { id = "h_again3", text = "Speak up, the bellows are loud. Or they were." },
      },
      choices = {
        { text = "Show me your plans.", next = "BUSINESS" },
        { text = "What brought a dwarf to Caer Darrow?", next = "why" },
        { text = "Your forge is cold, Magnus.", next = "cold" },
        { text = "What do you make of the Barovs?", next = "barovs" },
        { text = "The Great Forge still burns. Ironforge stands.", next = "home", when = { race = "Dwarf" } },
        { text = "Where did you learn these designs?", next = "designs", when = { profession = "Blacksmithing" } },
        { text = "Good trading, Magnus.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Coin, at first. The Barovs keep forty horses and wanted a dwarf to shoe them, for the look of the thing. Then I found the fishing was good and the ale tolerable, and a smith with steady work doesn't go looking for more." } },
      choices = {
        { text = "Do you miss the mountain?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Every winter, when the lake freezes and looks a wee bit like Loch Modan. I keep meaning to go back for a visit. But there's always another order, and the ferryman's been unreliable. I'll go in the spring." } },
      choices = {
        { text = "In the spring, then.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Cold? It's banked, that's all. I've had trouble getting it to draw, I'll grant ye. The charcoal's damp, or the wind's wrong. I'll have it roaring by supper, ye'll see." } },
      choices = {
        { text = "I'm sure you will.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "It's been cold for years. You died here.", next = "cold2" },
      },
    },
    cold2 = {
      big = true,
      lines = { { id = "c2_default", text = "Died? Dinnae talk daft. A dwarf knows when he's dead, there's a hall and ancestors and a great deal of drink. I'm standing in my own smithy with a customer. Now are ye buying, or are ye here to upset an old man?" } },
      choices = {
        { text = "Buying. Forget I spoke.", next = "BACK", reply = "Aye, well. Nae harm done. Have a look at the plans.", fx = { align = { honor = -1 } } },
        { text = "You deserve the truth, even unwelcome.", next = "BACK", reply = "Then ye've said it, and I've heard it, and I'll thank ye to leave it there. I've work to do.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barovs = {
      lines = { { id = "b_default", text = "They pay, and that's the best I'll say. The old lord's grown strange, and there are robed fellows up at the house who order odd things. Hooks, and wee saws, and manacles sized for a child. I made the first lot. I'll nae make a second." } },
      choices = {
        { text = "You refused them?", next = "BACK", reply = "I told them the iron was short. A dwarf doesn't lie, as a rule, but there's a time for a thing being short.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "h2_default", text = "Does it! Och, that's the best word I've had in years. And King Magni, he's well? Good. Then all's as it should be under the mountain, and I can stop fretting. Ye've done an old smith a kindness, {g:lad|lass}." } },
      choices = {
        { text = "He's well. The city's as proud as ever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    designs = {
      lines = { { id = "d_default", text = "Half from my old master in the Great Forge, and half worked out here on long nights. There's a balance to a blade that nae plan can give ye, mind. Follow the drawing, and then pick it up, and if it doesn't sit right, start again." } },
      choices = {
        { text = "Start again. That's the hard part.", next = "BACK", reply = "It's the only part. The rest is just hitting things.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    magni = { { id = "tp_magni", text = "A fine king, and a better smith than most kings. I saw him at the anvil once, when I was an apprentice." } },
    scholomance = { { id = "tp_schol", text = "The academy under the big house? Their stewards buy lamp brackets, and pay in old coin. I don't ask what they're studying." } },
    advice = { { id = "tp_ad", text = "Never quench in a hurry. A blade remembers how it was treated." } },
    background = { { id = "tp_bg", text = "Ironforge born, Caer Darrow by choice. I've shod every horse on this island, and a few of the lords." } },
    scourge = { { id = "tp_scourge", text = "Scourge? I dinnae know the word. There's been talk of sickness at the big house, but there's always talk on an island." } },
    _none = { { id = "tp_none", text = "Cannae help ye. If it's nae iron, ask the magistrate; he knows everything and enjoys none of it." } },
  },
}

---------------------------------------------------------------------------
-- Melia: child ghost of Caer Darrow, forever racing Sammy round the fountain.
---------------------------------------------------------------------------
P:NPC {
  key = "melia_darrow", id = TODO_NPC("Melia"), name = "Melia",
  bible = "bibles/more_folk.md", role = "child", tier = "service",
  communities = { "caer_darrow" }, temper = { "bossy", "bright" }, values = { "play", "fair" },
  notices = { "pet", "class", "race" },
  impression = {
    first = "Melia is the ghost of a small girl who races her friend Sammy around Caer Darrow's fountain and wins more often than he thinks is fair. She does not know anything is wrong, except that the grown-ups have gone quiet.",
    third = "{name} met Melia, the ghost of a little girl still playing by the fountain at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "Ready. Set. Oh! You made me lose my count. Are you racing, or are you just standing there?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! I've beaten Sammy two more times since you went, and he says he wasn't ready, but he was." },
    { id = "g_tall", when = { race = { "Tauren", "Orc", "NightElf" } }, text = "You're very big. You can't race, it wouldn't be fair, but you can say go." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is that yours? Can I pat it? Sammy, look! Mother says I'm not to touch strange animals, but that one looks sensible." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You look like the priest who comes over on the ferry. He gave me a sweet once. Have you got any sweets?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You've got a beard like Mister Frostwake! He lets me work the bellows sometimes. Do you make horseshoes too?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Melia. That's Sammy, and he's my best friend, but he cheats. We're racing round the fountain, best two out of three, and I'm winning." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "I'm Melia. You're the same size as me! Are you a grown-up? You can race if you like, but Sammy has to say go, because I said it last time." },
      },
      again = {
        { id = "h_again", text = "What? Hurry up, we're about to go again." },
        { id = "h_again2", text = "Ask me quick. Sammy's getting a head start, I can tell." },
        { id = "h_again3", text = "Yes? I'm listening. I'm also watching Sammy." },
      },
      choices = {
        { text = "Who's winning?", next = "winning" },
        { text = "Where are your mother and father?", next = "parents" },
        { text = "It's very quiet on the island today.", next = "quiet" },
        { text = "I'll say go for you.", next = "go" },
        { text = "I'll race you. I'm your size.", next = "race", when = { race = { "Gnome", "Dwarf" } } },
        { text = "Have a sweet, Melia.", next = "sweet", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Go and play, Melia.", next = "END" },
      },
    },
    winning = {
      lines = { { id = "w_default", text = "Me. I've won lots of times, and Sammy's only won when I tripped on the loose stone, which doesn't count. He says I start before go. I don't. I start on the guh." } },
      choices = {
        { text = "Starting on the guh is cheating a little.", next = "winning2" },
        { text = "That sounds fair to me.", next = "winning2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winning2 = {
      big = true,
      lines = { { id = "w2_default", text = "Well, he pushes at the corner, so it's even. Anyway, we're friends again after. We're always friends again after. Father says that's the main thing about racing, but I think the main thing is winning." } },
      choices = {
        { text = "Your father's right. Friends come first.", next = "BACK", reply = "That's what grown-ups always say. I'll let Sammy win one. Maybe.", fx = { align = { honor = 1 } } },
        { text = "You're right. Win if you can.", next = "BACK", reply = "See! I'm telling Sammy a grown-up said so.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    parents = {
      lines = { { id = "p_default", text = "Father's at the big house. He works for Lord Barov, carrying things down to the cellars. Mother's got a cough and she's lying down. She said to go and play and not come in till supper, so I'm playing ever so hard." } },
      choices = {
        { text = "Has she had the cough long?", next = "parents2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parents2 = {
      lines = { { id = "p2_default", text = "Since the day before the day before yesterday. Lots of people have got it. Baker Masterson gave me a roll to take home for her, and she said it tasted funny, but she ate it to be polite. It'll be supper soon, won't it? It's been nearly supper for ages." } },
      choices = {
        { text = "Soon, I'm sure. Keep playing.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, isn't it? Nobody's shouted at us to stop running. Usually the magistrate comes out and says the square isn't a racetrack. He just stands by the school door now and looks sad. I waved, and he waved back, but slowly." } },
      choices = {
        { text = "He has a lot on his mind.", next = "BACK", reply = "Grown-ups always do. I'm never going to have things on my mind. I'm going to race." },
        { text = "Something else.", next = "BACK" },
      },
    },
    go = {
      lines = { { id = "g2_default", text = "Will you? Say it properly, though. Ready, set, go, and don't say it sneaky like Sammy does. Sammy! Come here, the big one's going to say it!" } },
      choices = {
        { text = "Ready. Set. GO!", next = "BACK", reply = "I win! I win! Did you see? Sammy, I won and a grown-up saw!", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    race = {
      lines = { { id = "r_default", text = "All right! But no magic and no pushing, and you have to go round the fountain twice. Sammy, you say it. Not yet. Not yet! Sammy!" } },
      choices = {
        { text = "I let her win by a nose.", next = "BACK", reply = "I beat a grown-up! I beat a grown-up! You're quite fast, though. Best two out of three?", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I ran my best and beat her.", next = "BACK", reply = "HEY! No fair! Your legs are older. Wanna race again? I wasn't ready." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sweet = {
      lines = { { id = "s_default", text = "Oh! Thank you. I can't taste it very much. I think I've got Mother's cough coming. But I'll save half for Sammy, because he gave me his apple on market day." } },
      choices = {
        { text = "That's a good friend to be.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "tp_schol", text = "That's the school. We're not allowed near it. The big boys who go there never come out to play." } },
    background = { { id = "tp_bg", text = "I'm seven and three quarters. I live in the house with the blue door, and I can run faster than anybody." } },
    advice = { { id = "tp_ad", text = "Watch the loose stone by the fountain. It gets you every time." } },
    darrowshire = { { id = "tp_darrow", text = "My cousin lives there! She's got a pony. I'm going to visit when the ferry comes." } },
    holy_light = { { id = "tp_light", text = "We say prayers on rest day. I'm supposed to keep my eyes shut, but I look at Sammy and he pulls faces." } },
    _none = { { id = "tp_none", text = "I don't know. Ask a grown-up. They never know either, but they take longer to say so." } },
  },
}

---------------------------------------------------------------------------
-- Sammy: child ghost of Caer Darrow, Melia's friend, who is sure she cheats and has started to notice things.
---------------------------------------------------------------------------
P:NPC {
  key = "sammy_darrow", id = TODO_NPC("Sammy"), name = "Sammy",
  bible = "bibles/more_folk.md", role = "child", tier = "service",
  communities = { "caer_darrow" }, temper = { "earnest", "worried" }, values = { "fair", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Sammy is the ghost of a small boy who races Melia around the fountain at Caer Darrow and loses with great dignity. He has noticed more than she has, and he keeps running so that he will not have to think about it.",
    third = "{name} met Sammy, the ghost of a little boy playing by the fountain at Caer Darrow.",
  },

  greetings = {
    { id = "g_default", text = "She cheated! Did you see? You were standing right there, you must have seen." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello. I still haven't won. I nearly did, and then she tripped me, by accident she says." },
    { id = "g_soldier", when = { class = { "WARRIOR", "PALADIN" } }, text = "Are you a real soldier? With a real sword? Can I hold it? Only for a second. I'll be careful." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "Are you from the school? No, you're not, your robe's the wrong colour. Good. I don't like the ones from the school." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "You look like the men who carry things out of Lord Barov's cellar at night. But you've got nicer eyes. Are you ill as well?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Are you a friend of Mister Frostwake's? He's nice. His forge used to be all orange inside. It's grey now, and he hasn't noticed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Sammy. I'm racing Melia, and she always says go when she's already going. I'm not cross. I just think there should be rules." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } }, text = "I'm Sammy. When I'm big I'm going to be a guardsman like my uncle, up on the wall with the cannon. He lets me polish his helmet. He hasn't come down for his dinner in a long time, though." },
      },
      again = {
        { id = "h_again", text = "What is it? I've got to watch her or she'll start." },
        { id = "h_again2", text = "Go on. She's tying her shoe, so we've got a minute." },
        { id = "h_again3", text = "Yes? I'm listening." },
      },
      choices = {
        { text = "Does Melia really cheat?", next = "cheat" },
        { text = "Have you noticed anything odd lately?", next = "odd" },
        { text = "Tell me about your uncle on the wall.", next = "uncle" },
        { text = "Why don't you like the school?", next = "school" },
        { text = "Here. Hold the hilt, carefully.", next = "sword", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm not ill, Sammy. I'm only different.", next = "ill", when = { race = "Scourge" } },
        { text = "Good luck in the race, Sammy.", next = "END" },
      },
    },
    cheat = {
      lines = { { id = "c_default", text = "She starts early. Every time. And when I say so, she says I pushed her at the corner, and I only pushed her once, a long time ago, and I said sorry. But she's my friend, so I keep racing." } },
      choices = {
        { text = "You could refuse to race until she's fair.", next = "cheat2" },
        { text = "Why keep racing, if it's not fair?", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      big = true,
      lines = { { id = "c2_default", text = "Because if we stop, there's nothing to do but go home. And it's quiet at home. I'd rather lose. Is that silly?" } },
      choices = {
        { text = "No. Stay with your friend. That matters more.", next = "BACK", reply = "That's what I thought. I'll tell her I don't mind losing. She won't believe me.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A bit. Rules matter, even between friends.", next = "BACK", reply = "I know. I'll say it to her again. She'll say guh isn't the same as go.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = { { id = "o_default", text = "The ferry hasn't come. And the birds have stopped. And I knocked at the baker's and he gave me a bun, and it was the same bun as yesterday, I'm nearly sure, with the same burnt bit." } },
      choices = {
        { text = "Have you told anyone?", next = "odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd2 = {
      lines = { { id = "o2_default", text = "I told Rory, the fisherman, because he listens. He went all quiet, and then he said I was a sharp lad and I should go and play as long as I could. So I am. I don't think he meant it in a nice way, but he gave me a fish hook." } },
      choices = {
        { text = "He meant it kindly, I think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uncle = {
      lines = { { id = "u_default", text = "He's a guardsman. He's got a cannon that can shoot right across the lake, and he's never fired it, not once, because nobody's ever attacked. He says that's the best kind of cannon. I'd fire it, if it was mine." } },
      choices = {
        { text = "He sounds like a wise man.", next = "BACK", reply = "He is. He's just a bit slow coming down for dinner. I've saved him a bun." },
        { text = "Something else.", next = "BACK" },
      },
    },
    school = {
      lines = { { id = "s_default", text = "The big boys go in and they don't come out to play any more. And there's a tall thin man who walks to the door at night, and the cold comes off him like when you open the ice house. I hid behind the fountain. He looked right at it." } },
      choices = {
        { text = "Stay away from that door, Sammy.", next = "BACK", reply = "I will. I do. I told Melia, and she said I made it up to get out of racing.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = { { id = "w_default", text = "Oh! It's heavy. It's really heavy. Uncle's is lighter, I think, or maybe I was littler. When I'm a guardsman I'm going to have one just like this, and nobody's going to make Melia's mother cough any more." } },
      choices = {
        { text = "You'll be a fine guardsman.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ill = {
      lines = { { id = "i_default", text = "Different how? Like the men from the cellar? They don't talk. You talk. So you're a different kind of different. That's all right, then. Do you want to say go for us? Melia won't let me." } },
      choices = {
        { text = "Ready. Set. GO!", next = "BACK", reply = "HEY! No fair! She went on the ready! You saw that, didn't you?", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scholomance = { { id = "tp_schol", text = "I don't like it. It used to have a bell for lessons. Now it hasn't got a bell." } },
    background = { { id = "tp_bg", text = "I'm eight. I live over the chandler's with my uncle, who's a guardsman, and I'm going to be one too." } },
    advice = { { id = "tp_ad", text = "If you're racing Melia, go on the ready. It's the only way." } },
    scourge = { { id = "tp_scourge", text = "I don't know what that is. Is it why the birds stopped?" } },
    holy_light = { { id = "tp_light", text = "The priest said the Light looks after children specially. I've been saying my prayers twice, just in case once isn't enough." } },
    _none = { { id = "tp_none", text = "I don't know that. I know about racing, and cannons, a bit." } },
  },
}
