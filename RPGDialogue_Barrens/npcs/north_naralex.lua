-- The Wailing Caverns: the Disciples of Naralex keeping vigil in the hillside cave above the
-- entrance (Ebru, Nalpak), Falla Sagewind waiting for word of the dream, and the Disciple of
-- Naralex who walks the caverns trying to wake his master.
-- Voices: bibles/ebru.md, bibles/nalpak.md, bibles/falla.md, bibles/naralex_disciple.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ebru: a Disciple of Naralex who wants the deviate beasts in the caverns thinned out.
---------------------------------------------------------------------------
P:NPC {
  key = "ebru", id = TODO_NPC("Ebru"), name = "Ebru", title = "Disciple of Naralex",
  bible = "bibles/ebru.md", role = "questgiver", tier = "quest",
  temper = { "grim", "earnest" }, values = { "dutiful", "faithful" },
  notices = { "class", "form" },
  impression = {
    first = "Ebru keeps watch in the cave above the Wailing Caverns and speaks of the twisted beasts below as a sickness to be cut out. There is grief under the hard words, for the friends who went down and turned.",
    third = "{name} met Ebru, one of the Disciples of Naralex keeping vigil above the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. The caverns breathe, and sometimes what's below hears us up here." },
    { id = "g_erad", when = { questActive = TODO_QUEST("Deviate Eradication") }, text = "Have you been down? Every ravager and viper you kill is one less thing the nightmare can send up into the Barrens." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you understand what was lost down there better than most, and I'm sorry you have to see it." },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat" } },
      text = "Please take your own shape while we talk. The last thing I saw walking on four legs out of those caves had no mind left in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ebru, of the Disciples of Naralex. We followed him here to heal the Barrens, and now we keep watch at the mouth of the caverns while the beasts he meant to save grow stranger every season." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid of the Circle, or near enough. Then you'll know what Naralex hoped to do here, and you'll be able to see for yourself how badly it went." },
        { id = "h_erad_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deviate Eradication"), days = 3 } }, text = "The caverns are quieter, and I thank you. It won't last, because the nightmare breeds them faster than we can thin them, but quiet is a gift down here." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Ask, but keep your voice down." },
      },
      choices = {
        { text = "What happened to Naralex?", next = "naralex" },
        { text = "The beasts near the caverns look wrong, somehow.", next = "deviates" },
        { text = "Did any of your order fall to the dream?", next = "fang" },
        { text = "I've walked the Emerald Dream myself, a little.", next = "dream", when = { class = "DRUID" } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    naralex = {
      lines = { { id = "n_default", text = "He went into the Emerald Dream to call the green back into the Barrens, and something in the Dream took hold of him instead. He sleeps somewhere deep in the caverns, and his dreams have turned to nightmares that seep into the water and the stone." } },
      choices = {
        { text = "Can he be woken?", next = "woken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woken = {
      lines = { { id = "w_default", text = "One of us believes so, and he's gone down to try. If someone strong enough walks with him past the Druids of the Fang and the beasts, he says he can call Naralex back, though I've buried enough hope in those caves not to count on it." } },
      choices = {
        { text = "Then I'll help him try.", next = "BACK", reply = "Then go with him, and may the Earth Mother guide your steps through the dark. If you bring Naralex back, I'll dig up all that buried hope and plant it again.", fx = { align = { light = 1 }, learn = { "naralex" } } },
        { text = "Some sleepers are better left alone.", next = "BACK", reply = "Some are, and I've wondered whether he is one of them. But whatever he dreams is spilling into our world, so leaving him alone has stopped being a choice.", fx = { align = { light = -1 }, learn = { "naralex" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "naralex" } } },
      },
    },
    deviates = {
      lines = { { id = "d_default", text = "Raptors, serpents, plants and stranger things, all drinking from water fouled by the nightmare. They grow too large and too vicious, and they've started coming up into the Barrens to hunt." } },
      choices = {
        { text = "Surely they could be healed.", next = "healed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    healed = {
      lines = { { id = "hd_default", text = "I tried, for a year, and I lost two friends to it. Whatever the nightmare did to them goes deeper than the flesh, and the kindest thing left is to end them cleanly and give the land back its quiet." } },
      choices = {
        { text = "A clean end is a mercy. I'll give it.", next = "BACK", reply = "It is, though it took me that whole year to believe it. Be quick with them, friend, and remember they were druids and beasts of the land before the dream twisted them.", fx = { align = { order = 1 } } },
        { text = "Killing them is giving up. Keep trying.", next = "BACK", reply = "You sound the way I did a year ago, and I wish you better luck than I had. Try if your heart demands it, but don't let the caverns take you while you're trying.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fang = {
      lines = { { id = "f_default", text = "They were our brothers and sisters once, the ones who went down first to help him. The dream took them too, and now they call themselves the Druids of the Fang and guard his sleep like jailers." } },
      choices = {
        { text = "You speak of them like old friends.", next = "knew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knew = {
      lines = { { id = "k_default", text = "I shared a fire with Cobrahn for three winters, and Anacondra taught me the names of every herb in Ashenvale. If you meet them below, don't hesitate on my account, because whoever they were is already gone." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "Then be careful, druid, more careful than Naralex was. The Dream is beautiful and vast, and somewhere in it something has learned to wear that beauty like a mask." } },
      choices = {
        { text = "I'll keep that warning close.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    naralex = { { id = "tp_nar", text = "Naralex is our teacher, a night elf of the Cenarion Circle, asleep in the caverns below and dreaming badly.", next = "naralex" } },
    wailing_caverns = { { id = "tp_wc", text = "The caverns lie below us, wet and winding and full of things that used to be gentle." } },
    _none = { { id = "tp_none", text = "I'm sorry, but my thoughts are with the caverns. I can't help you with that." } },
  },
}

---------------------------------------------------------------------------
-- Nalpak: a Disciple of Naralex with a practical streak, who wants deviate hides to study.
---------------------------------------------------------------------------
P:NPC {
  key = "nalpak", id = TODO_NPC("Nalpak"), name = "Nalpak", title = "Disciple of Naralex",
  bible = "bibles/nalpak.md", role = "questgiver", tier = "quest",
  temper = { "curious", "dry" }, values = { "wise", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Nalpak studies the deviate beasts of the Wailing Caverns through their hides, hoping to learn what the nightmare is doing to the living. He is drier and more practical than his fellow disciples, and less hopeful.",
    third = "{name} met Nalpak, a Disciple of Naralex studying the twisted beasts of the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Mind the hides drying by the wall, {class}. They stink, but they're the most useful things in this cave." },
    { id = "g_hides", when = { questActive = TODO_QUEST("Deviate Hides") }, text = "Any hides yet? I'd take them torn, scorched or bloody, as long as they came off something deviate." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I've a new hide to show you, and nobody else here will look at it without flinching." },
    { id = "g_cleared", when = { cleared = "Wailing Caverns" }, text = "They say you went all the way down. Then you saw what I've only guessed at from skins, and I would give a great deal to hear it plainly." },
    { id = "g_away", when = { away = 14 }, text = "It's been some weeks. The beasts have changed again since you were here, and not for the better." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "A skinner, by your hands. Then you'll be gentler with the hides than most, and I'll thank you for it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keep your beast away from anything in the caverns, because I've seen what the nightmare does to an animal that eats there." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll have opinions about what we did here, and you're entitled to them. Come and look at the evidence before you give them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nalpak, of the Disciples. While the others pray for Naralex, I study what his dreams are doing to the beasts below, because you can't cure a sickness you don't understand." },
        { id = "h_hides_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deviate Hides"), days = 3 } }, text = "The hides you brought are fascinating, and horrible. The scales have grown through the fur in places, as if the beast couldn't decide what it was meant to be." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides to scrape." },
        { id = "h_again2", text = "What else, {class}?" },
        { id = "h_again3", text = "Go on. The hide will not get any worse for waiting, and neither will I." },
      },
      choices = {
        { text = "What do the hides tell you?", next = "hides" },
        { text = "Naralex might still be saved.", next = "saved" },
        { text = "How did you come to follow Naralex?", next = "follow" },
        { text = "I'm a skinner. What should I look for?", next = "skinner", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Ebru prays and you scrape hides. An odd pair.", next = "ebru" },
        { text = "This cave is a bleak place to keep a vigil.", next = "cave" },
        { text = "A druid might read the beasts another way.", next = "druid", when = { class = "DRUID" } },
        { text = "Naralex is of my people. Has Darnassus sent no help?", next = "nightelf", when = { race = "NightElf" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hd_default", text = "That the change comes from inside, through the water they drink. The beasts closest to the deep pools are the most twisted, and the ones near the entrance are only a little wrong, so the nightmare spreads from the center outward." } },
      choices = {
        { text = "I'd guess it could spread beyond the caverns.", next = "spread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spread = {
      lines = { { id = "sp_default", text = "It already has. The oases to the south are going bad, and the tauren druids at the Crossroads are seeing the same sickness in the water there, so the caverns aren't keeping their secret to themselves." } },
      choices = {
        { text = "Which druid at the Crossroads?", next = "spread2" },
        { text = "Then the caverns must be cleansed, whatever it costs.", next = "BACK", reply = "Whatever it costs is a heavy price to promise in those caves, but someone must pay it. The Barrens can't wait for the sickness to reach every pool and spring.", fx = { align = { order = -1 }, learn = { "oases" } } },
        { text = "Study first. Rushing in made all this worse.", next = "BACK", reply = "You may be right, and that's why I want these hides, so we stop guessing. Naralex rushed toward a cure, and look what his haste has woken.", fx = { align = { order = 1 }, learn = { "oases" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } },
      },
    },
    saved = {
      lines = { { id = "sv_default", text = "I believe he's still alive, which isn't the same thing. Whether there's enough of him left to wake is a question the hides can't answer, and I've stopped asking them to." } },
      choices = {
        { text = "You've lost faith, then.", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = { { id = "fa_default", text = "I've traded it for patience, which lasts longer. Ebru has faith enough for the both of us, and the disciple who went below has more than is good for him." } },
      choices = {
        { text = "Patience will see him home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    follow = {
      lines = { { id = "fo_default", text = "He promised the Barrens could bloom again, and I'd spent enough years watching it bake to want that badly. I still want it, so here I stay with a cave full of stinking hides." } },
      choices = {
        { text = "That's a worthy thing to want.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skinner = {
      lines = { { id = "sk_default", text = "Look at the underside, where the hide is thinnest. If the veins show green through it, the beast drank from the deep pools, and I'll want that one most of all." } },
      choices = {
        { text = "I'll bring you the green ones.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spread2 = {
      lines = { { id = "sp2_default", text = "Tonga Runetotem, at the Crossroads. Not every druid of Thunder Bluff thinks kindly of what Naralex tried here, but Tonga sent a runner up the hill asking what I'd found, and I sent back everything. Pride is a poor thing to keep when the water's turning." } },
      choices = {
        { text = "What did you tell him?", next = "spread3" },
        { text = "Something else, Nalpak.", next = "BACK" },
      },
    },
    spread3 = {
      big = true,
      lines = { { id = "sp3_default", text = "That we did this. Naralex meant to draw water up through the Dream and make the plains bloom, and something answered that wasn't water. I didn't soften it. If the tauren are to mend their oases, they need to know the wound was made by friends and not by chance." } },
      choices = {
        { text = "The truth was owed to them. You did right.", next = "BACK", reply = "I thought so. Ebru was horrified, and wanted it put more gently. But you can't treat a sickness you've lied about.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You've handed them a grievance against the Disciples.", next = "BACK", reply = "Perhaps I have. I would sooner be blamed for what I did than thanked for hiding it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ebru = {
      lines = { { id = "eb_default", text = "We are, and we need each other. Ebru keeps hoping, which I can no longer do, and I keep counting, which she can't bear to. When I tell her the beasts are worse this month, she tells me Naralex is still breathing, and both things are true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cave = {
      lines = { { id = "ca_default", text = "It is. We came to the Barrens with tents and seed and a plan for an orchard at the cave mouth. Now we've a hole in a hillside, the entrance to the caverns below us, and every so often something crawls up out of it that used to be a raptor." } },
      choices = {
        { text = "Why not leave?", next = "cave2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave2 = {
      lines = { { id = "ca2_default", text = "Because nobody else knows what the caverns were like before, and so nobody else can tell how far they've turned. I'm the measure, for what I'm worth. When someone finally goes down to wake him, they'll want to know which changes are his nightmare and which were always there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "I hope you will, because I'm no druid myself. I followed Naralex for his purpose, not his gift. If you can feel what's in a hide that I can only see, sit down by the rack and tell me, and I'll write down every word." } },
      choices = { { text = "I'll look them over with you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "We did, at the start. The Circle answered that Naralex was warned, and that the Barrens were not ours to remake. They weren't wrong. So we are left with what help walks up this hill, and I've found that passing adventurers ask fewer questions than archdruids do." } },
      choices = {
        { text = "The Circle should not abandon its own.", next = "BACK", reply = "I've thought so on bad nights. On better ones I remember that we were told, and came anyway.", fx = { align = { light = 1 } } },
        { text = "He defied them. This is what defiance earns.", next = "BACK", reply = "It is. I only wish it had been earned by him alone, and not by every beast that drinks here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    naralex = { { id = "tp_nar", text = "My teacher, in purpose if not in craft. He wanted a green Barrens more than he feared the Dream, and I admired that until I saw the bill." } },
    wailing_caverns = { { id = "tp_wc", text = "Below us. Steam vents, deep pools and far more water than this land shows on top. It was beautiful, once, in a wet and echoing way." } },
    cenarion_circle = { { id = "tp_cc", text = "They told Naralex not to try. I've had a long time in this cave to think about how right they were." } },
    advice = { { id = "tp_ad", text = "Don't drink from anything down there, however clear it looks. I have the hides of things that did." } },
    oases = { { id = "tp_oasis", text = "The oases are being fouled from below, because the caverns' sickness rises through the water. I'm nearly sure of it." } },
    _none = { { id = "tp_none", text = "Not my study, I'm afraid. Ask me about hides." } },
  },
}

---------------------------------------------------------------------------
-- Falla Sagewind: a tauren druid on the hill above the caverns, who receives the glowing
-- shard that adventurers bring up from Naralex's chamber.
---------------------------------------------------------------------------
P:NPC {
  key = "falla", id = TODO_NPC("Falla Sagewind"), name = "Falla Sagewind",
  bible = "bibles/falla.md", role = "questgiver", tier = "quest",
  temper = { "gentle", "thoughtful" }, values = { "faithful", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Falla Sagewind waits on the hill above the Wailing Caverns for any sign from the dream below. She is gentle and slow to speak, and she listens to the wind before she answers.",
    third = "{name} met Falla Sagewind, a tauren druid keeping watch over the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly, little one. The ground here remembers when it was green." },
    { id = "g_shard", when = { questActive = TODO_QUEST("The Glowing Shard") }, text = "You carry something from below, I can feel it. Show me, please." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the hill. The grass bent toward the path before you came, and I thought it might be you." },
    { id = "g_cleared", when = { cleared = "Wailing Caverns" }, text = "The wind from the cave has been softer since you went below. I do not know all that you did there, but the land does, and it is grateful." },
    { id = "g_away", when = { away = 14 }, text = "Many days have gone by, little one. The shards have dimmed and brightened twice since you stood here last." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Shu'halo, so far from Mulgore. The Earthmother walks with you here too, though she weeps a little in this place." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you can feel it too, the wrongness under the grass, like a fever in the ground." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "One who hears the elements. Then you will have noticed that the water under this hill does not answer as water should." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Falla Sagewind. I wait here for word from the caverns, because Naralex's dream reaches up through the land, and sometimes it sends us a sign." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of the Earthmother. I am Falla Sagewind, and I keep watch here, because what sleeps below the Barrens troubles the land our people walk." },
        { id = "h_shard_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Glowing Shard") }, text = "The shard you brought up still glows when I hold it, though dimmer each day. I take that as a sign that Naralex still dreams, and still fights." },
      },
      again = {
        { id = "h_again", text = "Is there more, little one?" },
        { id = "h_again2", text = "The wind is patient, and so am I. Ask." },
        { id = "h_again3", text = "Speak, little one. I have been listening to the ground all day, and a voice is welcome." },
      },
      choices = {
        { text = "What signs come from the caverns?", next = "signs" },
        { text = "How do tauren see Naralex's mistake?", next = "tauren" },
        { text = "What lies beneath the Barrens?", next = "beneath" },
        { text = "I've reached the depths of the caverns.", next = "depths", when = { cleared = "Wailing Caverns" } },
        { text = "I have something for you.", next = "BUSINESS" },
        { text = "You keep this watch alone on an open hill.", next = "alone" },
        { text = "The Disciples above the cave keep their own vigil.", next = "disciples" },
        { text = "I'm a druid. What does the land say to you here?", next = "druid", when = { class = "DRUID" } },
        { text = "My people have little love for the Dream's meddlers.", next = "shuhalo", when = { race = "Tauren" } },
        { text = "A night elf did this. I won't excuse him.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "The spirits of this place are in pain, I think.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Earthmother keep you.", next = "END" },
      },
    },
    signs = {
      lines = { { id = "s_default", text = "Crystals that glow with his dreaming, carried up by those who go deep enough. When they shine, I know he still lives, and when they dim, I know the nightmare has pressed closer." } },
      choices = {
        { text = "What do you do with them?", next = "shards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = { { id = "sh_default", text = "I hold them, and I listen, and I send word to Thunder Bluff when I hear something the Archdruid should know. It's slow work, but the earth is slow, and it doesn't reward impatience." } },
      choices = {
        { text = "I'll bring you any I find.", next = "BACK", fx = { affinity = 1, learn = { "naralex" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "naralex" } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Some of the elders say a night elf had no right to reshape our land, even to heal it. I say he loved the land as we do and tried too hard, which is a gentler kind of wrong." } },
      choices = {
        { text = "What do the elders say he should have done?", next = "tauren2" },
        { text = "Good intentions don't excuse the harm done.", next = "BACK", reply = "No, they don't, and Naralex would say so himself if he could wake. Still, I'd rather judge his heart kindly and judge his deeds honestly, both at once.", fx = { align = { light = -1 } } },
        { text = "He meant well. That counts for something.", next = "BACK", reply = "It does, to me, and to the land too, I think. The Earth Mother forgives those who love her clumsily, as long as they keep trying to set it right.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beneath = {
      lines = { { id = "b_default", text = "Water, long tunnels and the roots of very old things. The Wailing Caverns are named for the wind that moans through them, and the tauren have heard that moan for as long as we've walked the Barrens." } },
      choices = {
        { text = "You speak as if the wailing has changed.", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "It has. It used to sound like wind, and now on some nights it sounds like weeping, and the kodo won't graze within a mile of the entrance." } },
      choices = {
        { text = "Then something must be done.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
      },
    },
    depths = {
      lines = { { id = "d_default", text = "Then you have seen him, or seen where he sleeps. Did the land feel any different when you came out, lighter perhaps? I would like to believe it did." } },
      choices = {
        { text = "It felt lighter, like something down there had changed.", next = "BACK", fx = { affinity = 2 } },
        { text = "It felt the same. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tauren2 = {
      lines = { { id = "t2_default", text = "That the plains were given to us as they are, dry and wide, and that we learned to live by what they offer. A green Barrens would be another land with the same name. Arch Druid Hamuul hears those elders, and he hears me, and he has not yet said which of us is right." } },
      choices = {
        { text = "And what do you believe?", next = "tauren3" },
        { text = "Something else, Falla.", next = "BACK" },
      },
    },
    tauren3 = {
      big = true,
      lines = { { id = "t3_default", text = "That the Earthmother does not ask us to love only what is easy. Naralex saw thirst and wished to end it, and that wish was good, though his reaching was too proud. I would see him woken and taught, not left to the dark as a lesson to others." } },
      choices = {
        { text = "Mercy for one who meant well is no weakness.", next = "BACK", reply = "So I have said in Thunder Bluff, to fewer nods than I hoped for. It gladdens me to hear it on this hill.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "He broke the land. Let him bear what he made.", next = "BACK", reply = "He bears it now, little one, every hour, in a dream he cannot leave. I think the debt is nearly paid.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "Not wholly alone. The grunts from the Crossroads ride by and leave water, and a goblin from Ratchet once sat with me a whole evening trying to buy the shards. And the kodo come to the edge of the hill at dusk and look at the cave mouth, and then at me, as if I might explain it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    disciples = {
      lines = { { id = "di_default", text = "They do, in the cave on the hillside, and they carry a heavier grief than mine. Ebru hopes and Nalpak counts. I climb up when the moon is new and we share what we have heard, and I tell them that Thunder Bluff does not all wish them gone. It is a small comfort, and I give it anyway." } },
      choices = {
        { text = "They wronged your land, and you comfort them.", next = "BACK", reply = "They are frightened people who meant the land well. The Earthmother has room for that, and so must I.", fx = { align = { light = 1 } } },
        { text = "They owe your people more than tears.", next = "BACK", reply = "They do, and they know it. The debt will be paid by the waking, if it comes, and not by my hardness.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "That it is being asked to grow faster than it can bear. Put your hand flat on the earth near the oasis and you will feel it straining, like a calf made to carry a bull's load. The green there is not health. Tonga Runetotem at the Crossroads would be glad of another who can feel it." } },
      choices = { { text = "I'll go to Tonga. Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
    shuhalo = {
      lines = { { id = "su_default", text = "I know it, and I do not ask you to love them. I ask only that you remember the night elves taught our first druids in a generation, Hamuul among them. It is hard to learn from a people and then refuse them pity when they stumble." } },
      choices = { { text = "That is fairly said. Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "Then you are harder on your kin than I am, little one. I have heard it is the way of your people to judge your own most sternly, having lived long enough to see every mistake repeated. Perhaps that is wisdom. I am younger, and I still hope." } },
      choices = { { text = "Hope, then, for both of us. Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "shm_default", text = "They are, and I thank you for hearing it. The water has been turned from its own course by a will that is not its own, and it cries out in the only voice it has. That is the wailing. When Naralex wakes, I believe the water will be the first to forgive him." } },
      choices = { { text = "May it be soon. Something else.", next = "BACK" } },
    },
  },

  topics = {
    earth_mother = { { id = "tp_em", text = "She is under the dry grass as surely as under the green. I do not think she wished the Barrens otherwise, but I think she understands those who did." } },
    oases = { { id = "tp_oases", text = "They grow too quickly now, fed from below by something that is not rain. Tonga Runetotem studies them from the Crossroads." } },
    cenarion_circle = { { id = "tp_cc", text = "Tauren and night elf druids together, under the old teachings. Hamuul Runetotem sits among them, and I send my word to him." } },
    cairne = { { id = "tp_cairne", text = "Our High Chieftain asked that a watch be kept here, when others would have sealed the cave and forgotten it. I am that watch." } },
    advice = { { id = "tp_ad", text = "Listen before you mend, little one. Most harm I have seen was done by someone in a hurry to help." } },
    naralex = { { id = "tp_nar", text = "Naralex is a night elf who dreamed of a green Barrens and found a nightmare instead. He still sleeps below us." } },
    wailing_caverns = { { id = "tp_wc", text = "The Wailing Caverns are the caves beneath us, where the wind weeps and the beasts grow strange." } },
    _none = { { id = "tp_none", text = "The wind hasn't told me about that, little one." } },
  },
}

---------------------------------------------------------------------------
-- Disciple of Naralex: the night elf who waits inside the caverns for someone strong enough
-- to escort him to his master's side for the awakening.
---------------------------------------------------------------------------
P:NPC {
  key = "naralex_disciple", id = TODO_NPC("Disciple of Naralex"), name = "Disciple of Naralex",
  bible = "bibles/naralex_disciple.md", role = "questgiver", tier = "quest",
  temper = { "earnest", "weary" }, values = { "faithful", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "The Disciple of Naralex has been waiting in the caverns for someone strong enough to walk him to his master's side. He is tired almost past speaking, and holds on to the hope of the awakening anyway.",
    third = "{name} met the Disciple of Naralex in the Wailing Caverns, the last follower still trying to wake his master.",
  },

  greetings = {
    { id = "g_default", text = "You made it this far, stranger. Then perhaps, Elune willing, you can make it further, with me." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back into the dark for him. I had not let myself count on it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "You carry the Dream's touch, I can feel it even here. Then you understand what has been done to this place, and what it will take to undo it." },
    { id = "g_elf", when = { race = "NightElf" }, text = "Elune-adore, child of the stars. I did not think to see one of our own in these tunnels again, unless it was with a serpent's eyes." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. If anything goes wrong during the ritual, I'll need your help to hold the nightmare back." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "One of the Horde, come to help a night elf in the dark. Naralex would be glad of that, I think." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "PALADIN", "SHAMAN" } },
      text = "You have a mender's hands. Keep some strength in them for the end, because when he wakes he will be weaker than a newborn fawn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am a disciple of Naralex, the last of us who still walks these caverns with a clear mind. I have the means to wake him, but not the strength to fight my way to him alone, and my shan'do has slept too long already." },
        { id = "h_cleared", when = { cleared = "Wailing Caverns" }, text = "You came back. I feel him stirring more each time someone reaches his chamber, as if the nightmare loosens a little with every blow struck against it." },
      },
      again = {
        { id = "h_again", text = "What else? We should not wait long; even the kaldorei cannot outlast a nightmare." },
        { id = "h_again2", text = "Ask quickly, because the nightmare is stirring." },
        { id = "h_again3", text = "Speak, friend. Your voice is the first in a long time that was not an echo or a hiss." },
      },
      choices = {
        { text = "How will you wake him?", next = "wake" },
        { text = "What happened to the other disciples?", next = "others" },
        { text = "Why did you stay?", next = "stay" },
        { text = "The Fang leaders are dead.", next = "leaders", when = { cleared = "Wailing Caverns" } },
        { text = "Let's begin.", next = "BUSINESS" },
        { text = "You've been alone down here a long while.", next = "alone" },
        { text = "Tell me what Naralex was like, before.", next = "before" },
        { text = "Ishnu-alah. A kaldorei should not wake alone.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I walk the Dream's edge myself. What will I feel?", next = "druid", when = { class = "DRUID" } },
        { text = "It was a tauren land he tried to change.", next = "tauren", when = { race = "Tauren" } },
        { text = "The dead know something of sleep that won't end.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Not yet.", next = "END" },
      },
    },
    wake = {
      lines = { { id = "w_default", text = "A ritual of awakening, sung at his side, with the Fang's leaders slain so their dream gems no longer hold him down. Walk with me and keep the beasts from me while I sing, and we may yet bring him home." } },
      choices = {
        { text = "What might go wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "The nightmare will fight back, and I don't know what form it will take. Something has fed on his dreams for years, something the Emerald Dream itself should never have held, and it won't like being driven out." } },
      choices = {
        { text = "Have you seen this thing yourself?", next = "wrong2" },
        { text = "Whatever comes, I'll face it.", next = "BACK", reply = "You have courage, and Elune knows I'll need it beside me. Stay close when I begin the ritual, because the dark will come for whoever holds the light.", fx = { align = { honor = 1 } } },
        { text = "If it gets bad, I'm leaving you.", next = "BACK", reply = "Then at least you've told me plainly, and I'd rather that than a lie. But if you run, the nightmare will follow you out of these caves, and it won't stop at the entrance.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "The leaders became the Druids of the Fang, and they guard him now like a prize. The rest fled up into the sunlight and keep watch at the cave mouth, praying for news I hope to bring them." } },
      choices = {
        { text = "You must blame the Fang for this.", next = "blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      lines = { { id = "b_default", text = "I blame what got into them. They went down for love of him, as I did, and the only difference between us is that the dream chose them first." } },
      choices = {
        { text = "Then they deserve pity.", next = "BACK", reply = "Thank you, friend, because they were my brothers and sisters in the circle. If any part of them is left inside, I hope it finds rest when Naralex wakes.", fx = { align = { light = 1 } } },
        { text = "They chose to stay. They deserve what's coming.", next = "BACK", reply = "Perhaps they did, at the very end, and perhaps the dream did the choosing for them. Either way, you'll meet them in the dark, so strike as you must and leave the judging to Elune.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because he would have stayed for me. He brought us here to heal a land that wasn't even ours, and if I left him to rot in his own dream, I'd be no disciple at all." } },
      choices = {
        { text = "Then let's get him out.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leaders = {
      lines = { { id = "l_default", text = "Then their hold on him is broken, and the way is open. I owe you more than I can say, so stay close when we begin, because the hardest part is still ahead." } },
      choices = {
        { text = "I'll stay close.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      lines = { { id = "wr2_default", text = "I have only heard it, at the edge of his chamber, when the water goes still. There is a breathing under his breathing that is not his. The Fang call it a blessing and say the Dream has given him a guardian. I have known the Dream for three thousand years, and it does not breathe like that." } },
      choices = {
        { text = "If it rises when you sing, what then?", next = "wrong3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong3 = {
      big = true,
      lines = { { id = "wr3_default", text = "Then you fight it, and I do not stop singing, whatever you see happen to me. If the song breaks he sinks deeper than before, and no one will reach him again. I am asking you to guard a stranger who may not be able to thank you. I know what that asks." } },
      choices = {
        { text = "Sing. Nothing will reach you while I stand.", next = "BACK", reply = "Then I can begin without fear, for the first time since the others turned. Elune's light on you, friend.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "If it goes badly, I'll save myself first.", next = "BACK", reply = "That is honest, and I will not reproach you for it. Stay as long as you can, and I will sing as fast as the rite allows.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "I have. I sleep in the high ledges where the raptors cannot climb, and I eat moss and the pale fish, though I know I should not. I count the days by the steam vents. They were regular once, and now they come when the dream is at its worst." } },
      choices = {
        { text = "The nightmare hasn't touched you?", next = "alone2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone2 = {
      lines = { { id = "al2_default", text = "It has knocked. Some nights I wake with scales in my thoughts, and a voice that says the others were right to yield and that it would be warm. I say his name aloud until it stops. It has taken longer to stop, of late, and that is why I must not wait much more." } },
      choices = { { text = "Then we won't wait. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    before = {
      lines = { { id = "be_default", text = "He laughed more than a shan'do is supposed to. He would stand in the worst of the Barrens, with dust to his knees, and describe to us the trees that would grow there, down to the birds. We half believed we could see them. I think that is how he led so many of us so far from home." } },
      choices = {
        { text = "A vision like that is worth following.", next = "BACK", reply = "It was. I would follow it again, and I would walk more carefully this time.", fx = { align = { order = -1 } } },
        { text = "The Circle warned him, and he went anyway.", next = "BACK", reply = "They did, and so did the land, in its way. He heard only the thirst. I loved him for that, and it has cost us everything.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "naralex" } } },
      },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "Ishnu-dal-dieb. It eases me more than you know to hear the old tongue. When this is done, carry word to Darnassus that Naralex's disciples did not all fall, and that one of us at least kept faith in the dark. I would not have our people remember only the Fang." } },
      choices = { { text = "I'll carry it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "A pulling, as if the Dream here ran downhill. Do not shift your shape near his chamber unless you must, and do not let your mind follow the pull to see where it goes. Serpentis thought he could look and return. Hold to the waking world, and to me." } },
      choices = { { text = "I'll hold to the waking world. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "It was, and we did not ask your people's leave. We told ourselves that a gift needs no permission. If he wakes, the first thing I will counsel him is to walk to Thunder Bluff on his own feet and say so to your chieftain." } },
      choices = { { text = "Cairne would hear him. Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Then you understand better than the living do, and I am sorry for how you came by it. He is not dead, but he has been taken from himself, and I am told your people know that road. Help me bring him back along it." } },
      choices = { { text = "No one should be kept from themselves. Something else.", next = "BACK" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_wc", text = "They were his sanctuary, chosen for the water. Now every pool in them dreams his nightmare, and the beasts drink it." } },
    green_dragons = { { id = "tp_dream", text = "The Emerald Dream is Ysera's realm, and it has never before turned on one of her druids so. What has happened here should trouble more than this cave." } },
    cenarion_circle = { { id = "tp_cc", text = "They forbade this, and we came. I will answer to them gladly, if I live to bring him before them." } },
    advice = { { id = "tp_ad", text = "When something in the dark speaks kindly to you, say a name you love aloud. It has kept me whole." } },
    oases = { { id = "tp_oases", text = "The first of them rose where he willed it, and we wept for joy. I did not know then what was feeding them." } },
    naralex = { { id = "tp_nar", text = "Naralex is my teacher. He sleeps below, and I mean to wake him.", next = "wake" } },
    _none = { { id = "tp_none", text = "I can't think of that now. Naralex is all that matters, and Elune grant I reach him in time." } },
  },
}
