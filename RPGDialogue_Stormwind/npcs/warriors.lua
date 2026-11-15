-- Stormwind, Old Town: the city's warrior trainers, near the Champions' Hall and SI:7's door.
-- Wu Shen (the senior, stance and discipline), Ilsa Corbin (fury and the two-handed blade),
-- Ander Germaine (the shield and the line). Voices: bibles/warriors.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Wu Shen: the senior warrior trainer; calm, exacting, dry.
P:NPC {
  key = "wu_shen", id = TODO_NPC("Wu Shen"), name = "Wu Shen", title = "Warrior Trainer",
  bible = "bibles/warriors.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "dutiful", "patient" },
  notices = { "kit", "guard" },
  impression = {
    first = "Wu Shen teaches warriors in Old Town as if every lesson were the same lesson said again, and perhaps it is. He watched my feet before he looked at my face.",
    third = "{name} met Wu Shen, the senior of Stormwind's warrior trainers in Old Town, who teaches stance before anything else.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Feet first, then the blade. Show me your stance." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "This hall is for warriors, friend, though you may watch if you stand by the wall." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "You've been taking blows on your armour that your feet should have stepped away from. Mend it, and then we'll mend the feet." },
    { id = "n_guard", cat = "guard", when = { origin = "human_city_guard" },
      text = "You stood the Watch, I think; you still hold your weapon like a halberd. We'll shorten that grip before it shortens you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wu Shen. I train Stormwind's warriors, and I teach them the same thing every day until they stop needing to be told: where your feet are decides whether you live." },
        { id = "h_young", when = { class = "WARRIOR", maxLevel = 15 },
          text = "Du Lac sent you up from Goldshire, and she taught you to stand. Here we teach you to move without forgetting how to stand, which is harder than it sounds." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 40 },
          text = "You've fought real enemies since you were last here; I can see it in how you stand. Good. Now let's find what bad habits they taught you." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Wu Shen. I train warriors, and you aren't one, but sit by the wall if you like; there's a great deal to learn from watching someone fall over properly." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The hall's quiet at this hour, and the Champions' Hall next door has emptied into the Pig and Whistle. This is when I practise, so the students can't see me make mistakes." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your weight on the balls of your feet while you ask." },
        { id = "h_again2", text = "Go on. The drills will wait for one more question." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "What is a warrior for, Master Shen?", next = "purpose" },
        { text = "Why is the army so thin?", next = "army" },
        { text = "How do dwarves fight differently?", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "The kaldorei trained me to fight.", next = "kaldorei", when = { race = "NightElf", class = "WARRIOR" } },
        { text = "I trained with the Empyrean Blades.", next = "empyrean", when = { race = "Skyborne", class = "WARRIOR" } },
        { text = "What do you make of the other trainers here?", next = "others" },
        { text = "I'll leave you to your drills.", next = "END" },
      },
    },

    practise = {
      lines = {
        { id = "pr_default", text = "Your stances, and the change between them. A warrior who needs a breath to go from battle stance to defence is a warrior who's dead for one breath, so drill the change until your body does it before you've decided." },
        { id = "pr_old", when = { minLevel = 30 },
          text = "Your temper. You've learned to make rage from every blow you take, and now you must learn to spend it as carefully as gold, because a warrior who spends it all at once stands empty-handed when the second enemy arrives." },
      },
      choices = {
        { text = "Show me the change, then.", next = "practise_show" },
        { text = "I'd rather learn to hit harder.", next = "practise_harder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise_show = {
      lines = { { id = "ps_default", text = "Battle, then defence, then battle; don't look at your hands, look at me. Again, and again, and once more tomorrow, and every day until you're bored, because boredom is how a drill becomes yours." } },
      choices = {
        { text = "I'll drill until it's mine.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise_harder = {
      lines = { { id = "ph_default", text = "Everyone would, and Corbin will happily teach you. Come back to me when you've hit something very hard and it was standing behind you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    purpose = {
      big = true,
      lines = { { id = "f_default", text = "To stand between the people who can't fight and the things that would hurt them. Glory comes after, sometimes, and gold, and songs, but a warrior who fights for those first will run the day the songs stop." } },
      choices = {
        { text = "Then I'll fight for the people behind me.", next = "for_people", fx = { affinity = 2, align = { honor = 2 } } },
        { text = "I fight for myself, and the rest is talk.", next = "for_self", fx = { align = { honor = -1 } } },
        { text = "Who taught you that?", next = "for_who" },
      },
    },
    for_people = {
      lines = { { id = "fp_default", text = "Good. Remember you said it, because the first time someone behind you doesn't thank you, you'll want to forget it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    for_self = {
      lines = { { id = "fs_default", text = "Honest, at least, and I'll still train you. I've seen that change, usually on the day someone stands in front of you instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    for_who = {
      lines = { { id = "fw_default", text = "The sergeant who trained me, when this city was still being rebuilt from the First War's ashes. I don't remember his face anymore, only that he said it every morning, and I've said it every morning since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    army = {
      lines = { { id = "a_default", text = "Because the Second War emptied it and the Third scattered what was left. Half my students go to Redridge or Duskwood and never come back to Old Town, and I can't tell whether that's the kingdom's failure or its last good habit." } },
      choices = {
        { text = "Where should I go when you're done with me?", next = "army_go" },
        { text = "The nobles should pay for more soldiers.", next = "army_nobles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    army_go = {
      lines = { { id = "ag_default", text = "Wherever General Jonathan's letters are thickest. Lakeshire, this season, and Darkshire after; ask him at the Valley of Heroes, if he'll see you, and he usually will." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    army_nobles = {
      lines = { { id = "an_default", text = "They should, and they don't, and saying so in Old Town costs nothing, which is exactly what it buys. Train hard instead; you're cheaper than a regiment." } },
      choices = {
        { text = "The crown should make them pay.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the people should stop waiting on nobles.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    dwarf = {
      lines = { { id = "d_default", text = "Lower, and closer, and with less patience for anything fancy. Your people fight like a wall that's learned to walk, and I've tried to teach humans that and failed, because humans can't help reaching." } },
      choices = {
        { text = "I'll teach you a dwarven drill, if you like.", next = "dwarf_drill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_drill = {
      lines = {
        { id = "dd_default", text = "I'd like that very much, and I'll steal it shamelessly for the recruits. Come at dawn, before Corbin's awake to laugh at me." },
        { id = "dd_ward", when = { origin = "dwarf_military_ward" },
          text = "A drill from the Military Ward itself? Then I'll be up before dawn, and I'll steal every bit of it for the recruits." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    kaldorei = {
      lines = {
        { id = "k_default", text = "So I'd guessed; you fight on your toes, like a dancer, and you keep moving when a human would plant his feet. It's beautiful, and it's dangerous in a tight line, so let me show you where the line will need you to stand still." },
        { id = "k_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "On Darkshore's beaches, I'd guess, where the sand never holds still. You keep moving when a human would plant his feet, and that's dangerous in a tight line, so let me show you where to stand." },
      },
      choices = {
        { text = "Standing still gets warriors killed.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Show me, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    empyrean = {
      lines = { { id = "e_default", text = "I've no idea who they are, I'm afraid, though you say it as if I ought to. Tell me what they guarded, and I'll tell you whether we'd have got on." } },
      choices = {
        { text = "They guarded our leader, before the isles fell.", next = "empyrean_guard" },
        { text = "It's a long story, Master Shen.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    empyrean_guard = {
      lines = { { id = "eg_default", text = "Then they were guards first and fighters second, which is the right order. You've no one to guard now, I take it; Stormwind has more people needing it than it has guards, if you're looking." } },
      choices = {
        { text = "Then I'll guard what I can here.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll choose what I guard, not Stormwind.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    others = {
      lines = { { id = "o_default", text = "Corbin teaches fury and Germaine teaches the shield, and between them they make one decent warrior out of two halves. Burlguard at the Pig and Whistle teaches the dirty tricks I won't, and I send him the ones who need them." } },
      choices = {
        { text = "And the paladins at the Cathedral?", next = "others_paladins" },
        { text = "And the rogues next door?", next = "others_rogues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_paladins = {
      lines = { { id = "op_default", text = "Good soldiers with better armour and someone to pray to when they're tired. Lord Shadowbreaker came to watch my drills once and stayed an hour, which from him I took as high praise." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    others_rogues = {
      lines = { { id = "or_default", text = "Osborne stands at that door all night and thinks we can't see him. We can, and we let him think it, which is the closest thing to friendship Old Town allows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I served, and then I taught, and teaching turned out to be the harder posting. That's all the history a trainer needs.", next = "purpose" } },
    advice = { { id = "tp_ad", text = "Never step backwards without knowing what's behind you. More warriors have died to a step than to a sword." } },
    _none = { { id = "tp_none", text = "I don't know. Ask me something about feet; I know a great deal about feet." } },
  },
}

-- Ilsa Corbin: fury, the two-handed blade, and no patience for hesitation.
P:NPC {
  key = "ilsa_corbin", id = TODO_NPC("Ilsa Corbin"), name = "Ilsa Corbin", title = "Warrior Trainer",
  bible = "bibles/warriors.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "brave", "ambitious" },
  notices = { "kit", "fresh" },
  impression = {
    first = "Ilsa Corbin trains warriors in Old Town with a grin and a very large sword, and she plainly enjoys both. She called me recruit and made it sound like a dare.",
    third = "{name} met Ilsa Corbin, a cheerful and ferocious warrior trainer in Stormwind's Old Town.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "There's my recruit! Hit something today? Hit it harder tomorrow." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Not a warrior? Shame. You've the shoulders for it, almost." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Look at the state of you! Somebody gave as good as they got, and I hope you gave it back twice." },
    { id = "n_fresh", cat = "fresh", when = { class = "WARRIOR", maxLevel = 14 },
      text = "Fresh off the farm, are you? Don't be embarrassed; so was I, and I still hit like a scythe." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ilsa Corbin. Wu teaches you to stand and Ander teaches you to hide behind a shield, and I teach you what to do with all that anger you've been carrying about." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 40 },
          text = "Well, look who's grown teeth! Come here and show me the scars; I collect stories, and yours look like good ones." },
        { id = "h_gnome", when = { race = "Gnome", class = "WARRIOR" },
          text = "A gnome with a greatsword? Oh, I like you already, and I want to see you swing it, even if it takes both of us to lift." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Ilsa Corbin, warrior trainer. You're not one of mine, but if you ever get tired of whatever you are, come back and I'll find you a sword." },
      },
      again = {
        { id = "h_again", text = "What else, recruit? Quick, my arm's getting cold." },
        { id = "h_again2", text = "Go on, ask. I'm only polishing this, and it's polished." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "Isn't anger dangerous in a fight?", next = "anger" },
        { text = "Shield or two-handed blade?", next = "blade", when = { class = "WARRIOR" } },
        { text = "Why does a gnome need a greatsword?", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "I held a corridor in Gnomeregan.", next = "rearguard", when = { origin = "gnome_rearguard" } },
        { text = "Do you fight the rogues for fun?", next = "rogues", when = { class = "ROGUE" } },
        { text = "I'll go.", next = "END" },
      },
    },

    practise = {
      lines = {
        { id = "pr_default", text = "Charging, and stopping. Any fool can run at an enemy, but a warrior who charges and then stands there wondering what to do next is just a fast way to die, so practise the second step." },
        { id = "pr_old", when = { minLevel = 30 },
          text = "Finishing. You've got the swing, now practise knowing when they're nearly done; one good blow to a wounded enemy is worth ten to a fresh one, and Execute isn't just a word." },
      },
      choices = {
        { text = "What's the second step?", next = "practise_second" },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise_second = {
      lines = { { id = "ps_default", text = "Hamstring them so they can't run, or hit them hard enough that they don't want to. I teach both; Wu prefers the first, and I prefer whichever's quicker." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    anger = {
      big = true,
      lines = { { id = "a_default", text = "Only if it's driving you. A warrior's rage is a horse: ride it and you'll cover ground no one else can, but let it ride you and you'll end up in a ditch with your friends wondering where you went." } },
      choices = {
        { text = "I'll keep my rage on a short rein.", next = "anger_rein", fx = { align = { order = 1 } } },
        { text = "I'll let it run. That's what it's for.", next = "anger_run", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "What does Wu say?", next = "anger_wu" },
      },
    },
    anger_rein = {
      lines = { { id = "ar_default", text = "Wu would be proud of you, and I'm a little disappointed, but I'll grant it's the answer that lives longer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    anger_run = {
      lines = { { id = "arr_default", text = "That's my recruit! Just look back once in a while to make sure your friends are still behind you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    anger_wu = {
      lines = { { id = "aw_default", text = "That anger is a poor master and a good servant, or something wise like that. He's right, and I'll never tell him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    blade = {
      big = true,
      lines = { { id = "b_default", text = "The blade, obviously, though Ander will tell you otherwise and he's not entirely a fool. A shield keeps you alive, and a greatsword makes sure the other fellow isn't, so you tell me which sounds like more fun." } },
      choices = {
        { text = "The shield. Someone has to hold the line.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The blade. End it fast.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Why not both, one at a time?", next = "blade_both" },
      },
    },
    blade_both = {
      lines = { { id = "bb_default", text = "Now that's the right answer, and I hate it. Carry both, recruit, and learn when to change; the best warriors I've known were never in love with one weapon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    gnome = {
      lines = { { id = "g_default", text = "Because nobody expects it, which is half of winning! A gnome who gets inside a troll's reach with a blade that size is a gnome who goes home to tell the tale, and the troll doesn't." } },
      choices = {
        { text = "And getting inside the reach?", next = "gnome_reach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_reach = {
      lines = { { id = "gr_default", text = "That's the trick, and you've got it already: you're under their elbows before they've looked down. Let them swing high, and then remind them where their knees are." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    rearguard = {
      lines = { { id = "rg_default", text = "Did you, now? Then you've done what I teach better than I ever have, because I've never had to hold a door while my whole city ran through it. Sit down; I'll stop calling you recruit." } },
      choices = {
        { text = "I ran in the end, too.", next = "rearguard_ran" },
        { text = "Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    rearguard_ran = {
      lines = { { id = "rr_default", text = "Everyone runs in the end, unless they're dead. You held it long enough, and that's the only part anyone should remember." } },
      choices = { { text = "Thank you, Ilsa.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogues = {
      lines = { { id = "ro_default", text = "Only on feast days, and only if they've stopped cheating, which they never have. Osborne owes me three silver from the last bout, so tell him I asked after it." } },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Elwynn farm girl, then a soldier, then a trainer, and I hit things at every one of those jobs. The middle one's nobody's business." } },
    advice = { { id = "tp_ad", text = "Hit first. If you can't hit first, hit hardest. If you can't do either, get behind Ander." } },
    _none = { { id = "tp_none", text = "No idea, recruit. Ask Wu; he knows everything, and he'll tell you slowly." } },
  },
}

-- Ander Germaine: the shield, the line, and the people behind it.
P:NPC {
  key = "ander_germaine", id = TODO_NPC("Ander Germaine"), name = "Ander Germaine", title = "Warrior Trainer",
  bible = "bibles/warriors.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "loyal", "dutiful" },
  notices = { "kit", "ally" },
  impression = {
    first = "Ander Germaine teaches the shield and talks about the line as if it were a living thing he's responsible for. He seemed worried about the provinces, and about me, in roughly that order.",
    third = "{name} met Ander Germaine, a steady warrior trainer in Stormwind's Old Town who teaches the shield and the line.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Shield up, chin down. Good. What do you need?" },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Not one of mine, but welcome all the same. The line has room for everyone." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "You've been holding something off on your own, haven't you? I can see it in the dents. Next time, find someone to stand beside." },
    { id = "n_ally", cat = "ally", when = { class = "WARRIOR", race = { "Dwarf", "Gnome", "NightElf", "Skyborne" } },
      text = "Good to see more than human faces in this hall. The Alliance's line was never meant to be all one people, whatever the House of Nobles thinks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ander Germaine. I teach the shield, and the line, and the plain fact that you're never fighting for yourself alone, whatever you tell yourself on the road." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 40 },
          text = "You came back. Not all of them do, you know, and I keep a list of the ones who don't; I'm glad to leave you off it." },
        { id = "h_redridge", when = { visited = "Lakeshire" },
          text = "You've been through Lakeshire. How's the bridge holding? I trained three of the watchmen there, and I haven't had a letter since spring." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Ander Germaine, warrior trainer. You've your own teachers, I'm sure, but if you ever need someone to stand in front of you, warriors are good for that." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the recruits are running laps." },
        { id = "h_again2", text = "Go on. Shield down for a moment, I won't tell Wu." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "What do you mean by the line?", next = "line" },
        { text = "Who's on your list?", next = "list" },
        { text = "Do gnomes and dwarves fit in your line?", next = "allies", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Can a hunter hold your line?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I walked the Trade District with a halberd once.", next = "guard", when = { origin = "human_city_guard" } },
        { text = "I'll go.", next = "END" },
      },
    },

    practise = {
      lines = {
        { id = "pr_default", text = "Taking a blow on the shield's face, not its edge, and turning it so the next one slides. Then Taunt, because a defender who can't make the enemy look at them is just a person with a door strapped to their arm." },
        { id = "pr_old", when = { minLevel = 30 },
          text = "Holding more than one. When three come at you, you can't win, so you make them all want you instead of the priest behind you; that's the craft, and it takes years." },
      },
      choices = {
        { text = "Why should they want me?", next = "practise_why" },
        { text = "I'll practise until my arm aches.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_why = {
      lines = { { id = "pw_default", text = "Because if they want you, they don't want the healer, and the healer is what keeps you all alive. It's not pride, it's arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    line = {
      big = true,
      lines = { { id = "l_default", text = "Everyone who's standing between the kingdom and whatever wants it, from the guards on this wall to a farmer with a pitchfork at Sentinel Hill. It's thin, it's long, and every one of you is holding a piece of it whether you know it or not." } },
      choices = {
        { text = "Then I'll hold my piece.", next = "line_hold", fx = { affinity = 2, align = { order = 2 } } },
        { text = "I hold no line. I go where I please.", next = "line_free", fx = { align = { order = -2 } } },
        { text = "Even the farmers at Sentinel Hill?", next = "line_westfall" },
      },
    },
    line_hold = {
      lines = { { id = "lh_default", text = "Then I'll sleep a little better. Not much, but a little; I worry for a living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    line_free = {
      lines = { { id = "lf_default", text = "You will, and you'll still end up standing in front of somebody, because that's what warriors do. I'll be here when you notice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    line_westfall = {
      lines = { { id = "lw_default", text = "Especially them. Stoutmantle holds Westfall with men the crown forgot, and I think about that every time I see the House of Nobles' carriages roll past.", fx = { learn = { "westfall" } } } },
      choices = {
        { text = "The crown should send soldiers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The farmers are better off without the crown.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    list = {
      lines = { { id = "li_default", text = "The ones I trained who didn't come back. It's a long list, longer since the Blackrock came down into Redridge, and I read it every morning before the recruits arrive." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "list_heavy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list_heavy = {
      lines = { { id = "lh2_default", text = "It is, and it should be. The day it stops being heavy is the day I should stop teaching." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    allies = {
      lines = {
        { id = "al_default", text = "Better than humans, some days. A dwarf in a shield wall is a stone you can build on, and a gnome under it is the one who finds the gap in theirs; I've never understood the recruits who laugh at either." },
        { id = "al_gnome", when = { race = "Gnome" },
          text = "Better than you'd think. A gnome under a shield wall is the one who finds the gap in theirs, and I've never understood the recruits who laugh at that." },
      },
      choices = {
        { text = "They laugh at gnomes?", next = "allies_laugh" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    allies_laugh = {
      lines = { { id = "all_default", text = "Once. Then Corbin puts them in the ring with one, and they stop. It's my favourite lesson of the year." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Not with your own body, I'd hope, but your beast can, for a while, and I've seen a good hunter's wolf hold a gnoll longer than some of my recruits. Stand behind it and keep it alive, and you're part of the line." },
        { id = "hu_human", when = { race = "Human" },
          text = "A human hunter! Not with your own body, I'd hope, but your beast can, and I've seen a good wolf hold a gnoll longer than some of my recruits." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    guard = {
      lines = { { id = "gu_default", text = "I thought so; you still look at the rooftops before the street. The Watch is a good school and a poor posting, and I'm glad you left it for somewhere you're needed." } },
      choices = {
        { text = "The Watch needed me too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Watch only needed someone to stand there.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stood in a shield wall, and now I teach others to. That's all of it that matters.", next = "line" } },
    advice = { { id = "tp_ad", text = "Find the person beside you before the fight starts. You won't have time to look once it does." } },
    _none = { { id = "tp_none", text = "Can't help you there, I'm afraid. I only really know shields, and people's worries." } },
  },
}
