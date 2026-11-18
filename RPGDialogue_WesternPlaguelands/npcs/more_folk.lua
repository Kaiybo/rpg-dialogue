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
    first = "Remembering what the other spirits have forgotten seems to be her curse.",
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
    first = "He insists something older and worse than the Scourge killed his town.",
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
    first = "Cross him and he threatens you with his fists of fury.",
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
    first = "He doesn't know he is dead, and it's the saddest thing here.",
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
