-- Darkshore off the road: Balthule Shadowstrike watching the Tower of Althalaxx for Delgren the Purifier,
-- and Sentinel Tysha Moonblade on the road west of Ameth'Aran. Classic only.
-- Voice: bibles/darkshore_roads.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Balthule Shadowstrike
---------------------------------------------------------------------------
P:NPC {
  key = "balthule", id = TODO_NPC("Balthule Shadowstrike"), name = "Balthule Shadowstrike",
  bible = "bibles/darkshore_roads.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "watchful", "earnest" }, values = { "dutiful", "devout" },
  notices = { "class", "stealth" },

  impression = {
    first = "He speaks of the Light with a new convert's shy pride.",
    third = "{name} met Balthule Shadowstrike, a night elf scout watching the Dark Strand cult at the Tower of Althalaxx for Delgren the Purifier.",
  },

  greetings = {
    { id = "g_hello", text = "Down, quickly, before they see you from the tower! Good. Now, who sent you?" },
    { id = "g_back", when = { metBefore = true }, text = "Keep your head low, friend. They've doubled the watch on the tower since you were last here." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Tower of Althalaxx") },
      text = "Elissa sent you after me, didn't she? I owe her an apology for my silence, and you a thank-you for the walk." },
  },

  notice = {
    { id = "n_pala", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Then you're one of Delgren's sort, and I could weep for the help. Light be with you, as he taught me to say." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I didn't hear you come, and I've been listening for days. The cultists won't hear you either, which is the best news I've had all week." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Balthule Shadowstrike, and I'm watching the Tower of Althalaxx for my master, Delgren the Purifier. A company of warlocks has taken the tower and the ground around it, and I don't yet know what they want." },
        { id = "h_parch", tags = { "news" }, when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "The warlocks carry scraps of parchment, orders or notes, I can't tell, and I've collected a few already. Bring me more, but don't go into the tower itself, because what's inside is beyond the two of us." },
        { id = "h_pala", when = { class = "PALADIN" },
          text = "A paladin of the Light, here at the tower! Delgren told me his order would send more of you one day, and I confess I didn't believe him." },
        { id = "h_nelf_pri", when = { race = "NightElf", class = "PRIEST" },
          text = "A priestess of Elune, or a priest, forgive me, the light's poor here. You may think me strange, a kaldorei learning a human faith, but I've found the two don't argue as much as you'd expect." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down when you ask it." },
        { id = "h_again2", text = "Go on. The tower isn't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Who are these warlocks?", next = "cult" },
        { text = "A night elf serving a human paladin?", next = "delgren" },
        { text = "Why not go back to Auberdine and report?", next = "stay" },
        { text = "What does the Light mean to you?", next = "light" },
        { text = "What did the parchments say?", next = "parchment", when = { questDone = TODO_QUEST("The Tower of Althalaxx") } },
        { text = "I'll keep my head down.", next = "END" },
      },
    },

    cult = {
      lines = { { id = "cu_default", text = "They call themselves the Dark Strand, and they've the look of Highborne leftovers about them, robed and proud and far too fond of fel fire. The tower was a Highborne place once, so perhaps they think it owes them something." } },
      choices = {
        { text = "Kaldorei, practising fel magic again?", next = "cult_kal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_kal = {
      lines = { { id = "ck_default", text = "Some of them, yes, and that's what frightens me most. We swore off the arcane ten thousand years ago because of what it did to us, and here they are, a day's walk from Auberdine, lighting the old fires again." } },
      choices = {
        { text = "Then they must be stopped, whatever it costs.", next = "BACK", reply = "It may cost a great deal, {class}, and I would rather it cost them than us. Still, I hope it does not come to blades.", fx = { align = { order = 1 }, learn = { "dark_strand" } } },
        { text = "They chose their path. Watch them, but don't start a war.", next = "BACK", reply = "That is wise, and probably what Delgren would say too. I will keep watching, and you keep listening.", fx = { align = { order = -1 }, learn = { "dark_strand" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    delgren = {
      lines = { { id = "de_default", text = "He came to Ashenvale with a company of paladins to fight demons and undead, and he asked the Sentinels for a scout who knew the northern woods. They sent me, mostly to be rid of me, I think, and I've learned more from him in a season than in a century of patrols." } },
      choices = {
        { text = "What has he taught you?", next = "light" },
        { text = "Do the Sentinels mind?", next = "delgren_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delgren_mind = {
      lines = { { id = "dm_default", text = "Some of the elder ones think I've forgotten Elune, and they say so, usually when I'm in earshot. I haven't forgotten her at all, but Delgren speaks to me as an equal, and the elders never once have." } },
      choices = {
        { text = "Good teachers earn loyalty. You chose well.", next = "BACK", reply = "They do, and I would choose him again a hundred times. He taught me to read a trail by moonlight when I could barely hold a bow.", fx = { align = { honor = 1 } } },
        { text = "Your elders have a point. Remember who you are.", next = "BACK", reply = "They do, I suppose, and I have never truly forgotten. But my elders never sat up with me through a fever, and he did.", fx = { align = { honor = -1 } } },
      },
    },

    stay = {
      lines = { { id = "st_default", text = "Because the day I leave will be the day they do something worth seeing, and I'll have missed it. Elissa will be cross, I know, and she'll be right to be." } },
      choices = {
        { text = "Duty first. A report late is a report wasted.", next = "BACK", reply = "You are probably right, and Elissa would agree with you. I will send the report, and stay a little longer anyway.", fx = { align = { order = 1 } } },
        { text = "You're right to stay. Trust your instincts.", next = "BACK", reply = "Thank you, though Elissa will be cross with both of us. I want to see what they do when they think no one is watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "That there's something in us that can stand against the dark without needing the moon to be up. Delgren says the Light and Elune may be two faces of the same thing, and I've no idea if that's true, but I like that he wonders about it." } },
      choices = {
        { text = "Faith is faith. The name matters less.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    parchment = {
      lines = { { id = "pa_default", text = "Pieces of a ritual, and names, and a place far to the south where they meant to gather. Delgren will make more sense of it than I can, so my letter goes to him at Maestra's Post, far south in Ashenvale, and the sooner the better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Sentinel Tysha Moonblade
---------------------------------------------------------------------------
P:NPC {
  key = "tysha", id = TODO_NPC("Sentinel Tysha Moonblade"), name = "Sentinel Tysha Moonblade",
  bible = "bibles/darkshore_roads.md", role = "soldier", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "steady", "dry" }, values = { "dutiful", "curious" },
  notices = { "class", "race" },

  impression = {
    first = "The ghosts of Ameth'Aran drove her off, and she admits it.",
    third = "{name} met Sentinel Tysha Moonblade by the road near Ameth'Aran, who sent them to read the tablets of the haunted ruin.",
  },

  greetings = {
    { id = "g_hello", text = "Hold a moment on the road, {class}. You're headed toward Ameth'Aran, and I'd like a word before you go." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the ruins, or still working up the nerve? I'll not judge either way." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") },
      text = "You read both tablets and came back with your wits. That's more than I managed." },
    { id = "g_outsider", when = { race = { "Human", "Dwarf", "Gnome" } }, priority = 5,
      text = "Mind the road, outlander, and mind the ruins more. The dead in Ameth'Aran were old before your people learned to write." },
    { id = "g_soft", when = { npcFlagBefore = "tysha_soft" }, priority = 10,
      text = "Ah, the outlander who reads before touching. Come and stand on my road a while; you've earned the shade of it." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You've a blessed look about you. The spirits in Ameth'Aran may not care for it, though, so don't count on it to keep them off." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "The ruins are our people's, sister or brother, and the dead in them were kaldorei once. Remember that, even when they're trying to kill you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Tysha Moonblade. To the east lie the ruins of Ameth'Aran, where Azshara's servants once worked their magic freely, and where their restless spirits still walk." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Fall of Ameth'Aran") },
          text = "There are two great tablets in the ruins, one telling the Lay of Ameth'Aran and one telling of its fall. Read them both and tell me what they say, because the spirits came for me before I'd finished either." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") },
          text = "A city that wanted more magic than the world could give it, and was given more than it could hold. I'll be thinking on that through a long watch, I suspect." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, walking toward Ameth'Aran. I hope you're going there to learn what not to do, {class}, because the ruins teach that lesson very well." },
        { id = "h_human", when = { race = "Human" },
          text = "A human on the Ameth'Aran road. Your people have lost two kingdoms to fire in the last thirty years, so forgive me if I walk beside you to the ruins and not behind." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and no pick on your shoulder, which I notice. The last of your kind on this road asked whether the carvings at Ameth'Aran would travel, and I told him the dead would sooner he did." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome. The last one through here carried a ticking box to measure the magic left in our tablets, so I'll ask you plainly whether you've brought one too." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, {g:brother|sister}. It's a relief to see a face on this road that won't be dust in a century, and I mean no cruelty to anyone by saying so." },
        { id = "h_soft", when = { npcFlagBefore = "tysha_soft" },
          text = "I told Glynda about you, the outlander who read the tablets through while the dead screamed. She didn't believe me, which is fair, because a season ago I wouldn't have believed me either." },
      },
      again = {
        { id = "h_again", text = "Anything else before you go east?" },
        { id = "h_again2", text = "Ask, then. The road is quiet today, for once." },
      },
      choices = {
        { text = "What happened at Ameth'Aran?", next = "ruin" },
        { text = "The spirits drove you off?", next = "spirits" },
        { text = "Why does it matter what the tablets say?", next = "why" },
        { text = "What did the tablets tell you, in the end?", next = "after", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") } },
        { text = "You don't seem fond of outsiders, Sentinel.", next = "young" },
        { text = "You look at me like a child loose in a temple.", next = "xyoung", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Between kaldorei, Tysha: do you truly despise them?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Still think we outlanders are children, Tysha?", next = "xsoft", when = { npcFlagBefore = "tysha_soft" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    ruin = {
      lines = { { id = "ru_default", text = "It was a Highborne town, before the Sundering, full of Azshara's favourites and their arts. When the Well was destroyed, the magic they'd built their lives on tore loose, and the ones who died there never found their way to rest." } },
      choices = {
        { text = "Do you pity them?", next = "pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pity = {
      lines = { { id = "pi_default", text = "Some days I do, because plenty of them were only servants and scribes who never chose anything. Other days I remember what Azshara's court did to the rest of us and I can't find much pity at all." } },
      choices = {
        { text = "Servants or not, they shared the blame.", next = "BACK", reply = "Perhaps they did, and the Sentinels would agree with you. Still, I cannot help pitying the scribes.", fx = { align = { light = -1 }, learn = { "highborne" } } },
        { text = "The dead deserve rest, whatever they did.", next = "BACK", reply = "They do, I suppose, though the ruins will not let them have it. Some nights I hear them weeping from the road.", fx = { align = { light = 1 }, learn = { "highborne" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    spirits = {
      lines = { { id = "sp_default", text = "They came up out of the stones while I was reading, cold and angry, and I ran. I'm a Sentinel, not a priestess, and I'd sooner face a dozen furbolgs than one thing my arrows go straight through." } },
      choices = {
        { text = "No shame in running from that.", next = "BACK", fx = { affinity = 1 } },
        { text = "A Sentinel shouldn't run from anything.", next = "spirits_run" },
      },
    },
    spirits_run = {
      lines = { { id = "sr_default", text = "A dead Sentinel guards nothing, {class}, and I've a road to watch. If you think yourself braver, the ruins are just east of here and they'll be glad of the company." } },
      choices = {
        { text = "Courage means standing your ground.", next = "BACK", reply = "It does, and I will stand mine, but on this road and not in those ruins. Someone has to warn the travellers.", fx = { align = { honor = 1 } } },
        { text = "You're right. Living to fight again is smarter.", next = "BACK", reply = "It is, and I am glad you understand. My sisters already have too many names to sing at the shrine.", fx = { align = { honor = -1 } } },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the Sentinels keep the memory of these ruins for Darnassus, and we've lost so much of it already. If a tablet says why a city fell, it's worth a few bruises to have it read before the moss eats the words." } },
      choices = {
        { text = "I'll read them carefully, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = { { id = "af_default", text = "That they sang of their city's beauty right up until the day it drowned in its own power, and that the singing didn't stop when the walls did. I think that's why the spirits are angry, because nobody ever told them the song was over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    -- Kaldorei factions: Tysha holds the younger races in quiet contempt, as children who break things.
    young = {
      lines = {
        { id = "yo_default", key = true,
          text = "They are children, {class}, and I don't say it to wound anyone. Humans burn their own kingdoms down every few generations, dwarves dig until the mountain falls on them, and gnomes poisoned their own city, and now all three have come to play in the ruins of mine." },
      },
      choices = {
        { text = "Who taught you to think so little of them?", next = "young_why" },
        { text = "Children grow up. Give them a few centuries.", next = "BACK", reply = "They don't have a few centuries, which is rather my point. Each generation starts again from nothing and makes the same mistakes a little louder.", fx = { align = { order = 1 } } },
        { text = "You're right. They break whatever they touch.", next = "BACK", reply = "They do, and then they write a ballad about how sorry they are. Remember that when one of them offers to carry something precious for you.", fx = { align = { order = -1 } } },
      },
    },
    young_why = {
      lines = {
        { id = "yw_default", text = "Ameth'Aran taught me. Last spring a gnome came down this road with a brass box that ticked, wanting to measure the magic still in our tablets, and a dwarf beside him asked whether the lintels would survive the trip to Ironforge, and they were both as cheerful about it as children in a temple." },
      },
      choices = {
        { text = "Did they take anything?", next = "young_took" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_took = {
      lines = {
        { id = "yt_default", text = "The ghosts saw to that, which is the only kindness those ghosts have ever done anyone. The gnome dropped his box and ran, and I keep it in my pack to remind me what the Alliance thinks our dead are for." },
      },
      choices = {
        { text = "Curiosity isn't contempt. They meant no harm.", next = "BACK", reply = "Children never mean harm, and the vase is broken all the same. Meaning well is a poor sort of glue.", fx = { align = { light = 1 } } },
        { text = "Keep the box. Some lessons deserve a keepsake.", next = "BACK", reply = "I intend to. The next time a human tells me the Alliance honours our ways, I'll take it out and wind it for him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xyoung = {
      lines = {
        { id = "xy_default", text = "I do, and I'll not pretend otherwise; to me you look like a child who has wandered into a shrine with mud on its boots. You may be a perfectly good child, but you'll be dead before the moss grows back over your footprints." },
      },
      choices = {
        { text = "Short lives still count. Judge me by what I do.", next = "xyoung_deeds", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then I'll stop pretending to admire your ruins.", next = "BACK", reply = "Good, that's honest at least. Admire them from the road, then, where your boots can't reach them.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I read the tablets while the dead screamed. Did a child do that?", tag = "Persuade", next = "xyoung_soft",
          check = { pass = { any = { { questDone = TODO_QUEST("The Fall of Ameth'Aran") }, { disposition = { min = 65 } } } } },
          fail = { next = "xyoung_fail", fx = { affinity = -1 } } },
      },
    },
    xyoung_deeds = {
      lines = {
        { id = "xyd_default", text = "Deeds, then. The kaldorei keep long tallies, and yours has very few lines in it yet, so fill them with care." },
      },
      choices = {
        { text = "I'll give you a long tally to read.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xyoung_soft = {
      lines = {
        { id = "xys_default", key = true, fx = { npcFlag = { set = { "tysha_soft" } } },
          text = "No, a child would have run, as I did. You went into Ameth'Aran and read the Lay through to its end with the dead howling at you, so perhaps I have been calling the wrong people children." },
      },
      choices = {
        { text = "That's all I wanted to hear.", next = "BACK", fx = { affinity = 2 } },
        { text = "Tell me about that gnome's box.", next = "young_why" },
      },
    },
    xyoung_fail = {
      lines = {
        { id = "xyf_default", text = "Words come quickly to your people, and so do the ballads afterward. Go out among the stones and show me with your hands, and then we'll talk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll go and show you.", next = "END" },
      },
    },

    xnelf = {
      lines = {
        { id = "xn_default", text = "Despise is too warm a word, {g:brother|sister}; I simply see them clearly. Thundris lets them sleep in our inn and Elissa counts their crates as if they were gifts, but we're the ones who'll still be here when their grandchildren have forgotten why they came." },
      },
      choices = {
        { text = "We needed them at Hyjal, and we'll need them again.", next = "BACK", reply = "Perhaps we will, and I'll fight beside them when we do. Needing a thing and admiring it are not the same, though.", fx = { align = { honor = 1 } } },
        { text = "Let them come and go. Our memory outlasts their mistakes.", next = "BACK", reply = "It does, and that's both our strength and our burden. Someone has to remember what they broke.", fx = { align = { honor = -1 } } },
        { text = "And the Highborne, Tysha? Were they children too?", next = "xnelf_high" },
      },
    },
    xnelf_high = {
      lines = {
        { id = "xnh_default", text = "No, they were the eldest and wisest of us, and they drowned a continent. I know what you're doing, and it's a fair blow, though I'd still rather the dead of Ameth'Aran were left to us than shipped to Ironforge in straw.",
          fx = { learn = { "highborne" } } },
      },
      choices = {
        { text = "Then perhaps age isn't the same as wisdom.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xsoft = {
      lines = {
        { id = "xso_default", text = "Not you, at least. I still carry the gnome's box, but I've stopped winding it, and I've told Glynda that one outlander reads the stones before touching them." },
      },
      choices = {
        { text = "Wind it for the next gnome, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Sentinel of Darnassus, set to watch this road and remember what lies at the end of it. The remembering is the harder half." } },
    explorers_league = { { id = "tp_league", text = "Dwarves who believe a ruin is a question to be dug up. Our ruins are answers, and they answered long ago." } },
    highborne = { { id = "tp_highborne", text = "Our eldest and our worst, and the reason I keep this road. Ameth'Aran is what their wisdom built." } },
    _none = { { id = "tp_none", text = "I watch one road and one ruin, {class}. Ask in Auberdine for the rest of the world." } },
  },
}
