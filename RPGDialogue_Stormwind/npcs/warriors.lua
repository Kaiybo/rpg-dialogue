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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Stand firm, strike true, and never forget why you fight. Your spirits must teach the same." } },
      choices = {
        { text = "Never forget why you fight. Well said, Wu Shen.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why I fight doesn't matter. Winning does.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Everyone should learn to stand properly, because the day comes when the thing you summoned is gone and the enemy is not. I've seen warlocks fall because they forgot they had legs, and I'd teach you to use yours, if you can bear to hear the same lesson twenty times." },
      },
      choices = {
        { text = "Then teach me, Master Shen, twenty times if needed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon does the standing, Master Shen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Master Shen.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Lightly, and ready to become something else, but never so ready that you forget the shape you are in. Many of your people fight as if they are already the bear, and the bear does not come in time." } },
      choices = {
        { text = "Master each shape fully before reaching for the next.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Instinct is faster than any lesson, Wu Shen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothing, until the day you must stand, and on that day your feet will not know how. Every rogue I have watched die died running, because he had never learned the stance that would have saved him." } },
      choices = {
        { text = "Then I'll learn to stand when it matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Running has saved me more often than standing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a spell cast from a fallen body goes nowhere, and every mage I have trained in footwork has outlived the ones who laughed at me. The Sanctum teaches the mind, and I teach the ground beneath it." } },
      choices = {
        { text = "Then I'll learn footwork too. Discipline in everything.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spells keep enemies at bay. My feet don't matter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where to put your feet when the beast gets past the arrows, which it will. A hunter with good footing can back away and keep shooting, and a hunter with bad footing falls over and gets eaten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has better footing than most of my recruits, I'll tell you that. Watch how it moves, and learn." },
      },
      choices = {
        { text = "I'll learn the footwork. It might save my life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't plan to let anything get that close.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everyone should know where their feet are, priest or warrior, because the ground does not care what you believe. Stand well, and your prayers will have time to work." } },
      choices = {
        { text = "Then I'll learn to stand well, and pray steady.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My faith keeps me upright, Wu Shen, not my feet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Both, but the training first, because the Light will help you, but it won't stand for you. I've seen paladins fall because they believed they couldn't." } },
      choices = {
        { text = "Then I'll train as hard as I pray.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light is all I need, Wu Shen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Your feet are close together, like someone who prays more than they fight, and that's fine, but it won't save you." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Show me your feet, and then tell me why you trust the Light more than your own legs." },
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
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. Your feet are light, which is good, but they are always ready to run, which is not, and I can see it from here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You stand like a candle in a draught, and I could knock you over with one finger, though I suspect you'd set my sleeve alight on the way down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the warriors' hall. Your feet are good, which surprises me; hunters usually stand like they're waiting for something." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your feet do not know how many of them you will have in a moment, and I can see it in how you stand." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Your feet are wrong, but they're usually wrong on your sort, because you stand as though something else will do the fighting." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Every lesson is the same lesson. Your spirits may teach otherwise, but your feet will learn the same." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your weight on the balls of your feet while you ask." },
        { id = "h_again2", text = "Go on. The drills will wait for one more question." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I should be practising something, I suppose.", next = "practise", when = { class = "WARRIOR" } },
        { text = "I'm not sure what a warrior is for, Master Shen.", next = "purpose" },
        { text = "Why is the army so thin?", next = "army" },
        { text = "Dwarves fight differently from men, I've noticed.", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "The kaldorei trained me to fight.", next = "kaldorei", when = { race = "NightElf", class = "WARRIOR" } },
        { text = "I trained with the Empyrean Blades.", next = "empyrean", when = { race = "Skyborne", class = "WARRIOR" } },
        { text = "The other trainers here seem a mixed lot.", next = "others" },
        { text = "What's wrong with being ready to run?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why should a mage care how they stand?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What can a hunter learn from a warrior's training, Wu Shen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest learn to stand like a warrior, Wu Shen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin trust the Light or their training?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How should a druid stand when the ground keeps changing, Wu Shen?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Should a warlock learn to stand properly, Master Shen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What is the one lesson you teach, Wu Shen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "I'll need somewhere to go when you're done with me.", next = "army_go" },
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
        { text = "There are the paladins at the Cathedral too.", next = "others_paladins" },
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
    second_war = { { id = "tp_second_war", text = "I trained soldiers for the Second War, and I watched them go out and not come back. I teach more slowly now, because I've learned that haste kills more than orcs." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The fighters of the Gurubashi Arena fight without discipline, for gold, and they die young. I'd not send a student there, though some go anyway." } },
    silver_hand = { { id = "tp_silver_hand", text = "The paladins of the Silver Hand fought with a discipline I admired, and Uther was the finest of them. I'd like to have sparred with him, once." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The heroes in the Valley were warriors once, and they learned their stance like anyone else. I take my students there, and I tell them to look at the feet." } },
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
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "There's my recruit! Did you hit something today, and will you hit it harder tomorrow?" },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "Not a warrior? That's a shame, because you've almost got the shoulders for it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Look at the state of you! Somebody gave as good as they got, and I hope you gave it back twice." },
    { id = "n_fresh", cat = "fresh", when = { class = "WARRIOR", maxLevel = 14 },
      text = "Fresh off the farm, are you? Don't be embarrassed; so was I, and I still hit like a scythe." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than anything. A shaman recruit would be a first. Come back and I'll see what you're made of." } },
      choices = {
        { text = "I'll train honestly and fight fairly, Ilsa.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight however wins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think it's furious, and you've been keeping it on a leash because somebody told you balance was everything. Let it out once in a while, recruit, and see how much better you feel afterwards." } },
      choices = {
        { text = "Balance keeps the bear from hurting the wrong people.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Sometimes the bear should run loose.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Anger, love, the honest kind they train you to bottle up in the Sanctum. A mage who's never been angry casts like a clerk, but one who knows how to use it casts like a storm, and I know which I'd rather stand beside." } },
      choices = {
        { text = "I'll keep my anger in check. Control is everything.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll let it out, and let them feel it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "In everyone who comes through that door, and I teach them to aim it rather than drown in it. I'd say the same to you, except that your anger has a voice of its own, and it talks back." } },
      choices = {
        { text = "Then I'll aim it, and never let it rule me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My anger and I get along well enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every fighter does, and hunters hide theirs best, behind patience and a steady aim. But I've seen a hunter whose pet was killed, and I've never seen fury like it, not even in a berserker." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is the leash on your anger, I think, and the reason for it too. Keep it close, and keep it safe." },
      },
      choices = {
        { text = "I keep my anger under control. That's discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Anger has its uses. I let it out when needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everyone does, and priests most of all, because they spend all day watching people die and smiling through it. You need somewhere to put it, and a sword's as good a place as any." } },
      choices = {
        { text = "Anger can be healed, Ilsa, not just swung.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Maybe you're right. Anger needs somewhere to go.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only in what you call it, recruit. Anger is anger, and the Light just gives it a better excuse." } },
      choices = {
        { text = "Righteous anger is the Light's fire. It's different.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Anger is anger, whatever we call it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You've got anger too, recruit, I can see it, you just keep it buried under all that calm." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You've got fire in your belly, recruit, but you keep it locked up behind all that righteousness." },
        { id = "h_default", key = true,
          text = "Ilsa Corbin. Wu teaches you to stand and Ander teaches you to hide behind a shield, and I teach you what to do with all that anger you've been carrying about." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 40 },
          text = "Well, look who's grown teeth! Come here and show me the scars; I collect stories, and yours look like good ones." },
        { id = "h_gnome", when = { race = "Gnome", class = "WARRIOR" },
          text = "A gnome with a greatsword? Oh, I like you already, and I want to see you swing it, even if it takes both of us to lift." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Ilsa Corbin, warrior trainer. You're not one of mine, but if you ever get tired of whatever you are, come back and I'll find you a sword." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You've got all that fire in your hands and none of it in your belly, and I'd like to fix that." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and you've the same look as half my students, all that anger with nowhere to put it. Yours just happens to have horns." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in a warriors' hall. You've anger in you too, I'd wager, though you keep it on a leash with your beast." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You've got a bear inside you somewhere, recruit, and I'd love to know if it's as angry as I hope it is." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, recruit! Ever swung a sword that big? Your spirits won't help you lift it." },
      },
      again = {
        { id = "h_again", text = "What else, recruit? Quick, my arm's getting cold." },
        { id = "h_again2", text = "Go on, ask. I'm only polishing this, and it's polished." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I'd welcome your advice on what to practise.", next = "practise", when = { class = "WARRIOR" } },
        { text = "Isn't anger dangerous in a fight?", next = "anger" },
        { text = "A shield seems the wiser choice to me.", next = "blade", when = { class = "WARRIOR" } },
        { text = "Why does a gnome need a greatsword?", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "I held a corridor in Gnomeregan.", next = "rearguard", when = { origin = "gnome_rearguard" } },
        { text = "Do you fight the rogues for fun?", next = "rogues", when = { class = "ROGUE" } },
        { text = "What do you mean, fire in my belly?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Hunters seem too patient to carry anger, Ilsa.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you see anger in everyone, Ilsa?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think priests carry anger, Ilsa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is righteous anger different from ordinary anger, Ilsa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think the bear in me is angry, Ilsa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you enjoy teaching warriors, Ilsa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "I could carry both, one at a time.", next = "blade_both" },
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
        { text = "I ran too, when the line broke.", next = "rearguard_ran" },
        { text = "Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    rearguard_ran = {
      lines = { { id = "rr_default", text = "Everyone runs eventually, unless they're dead, and the dead don't get a vote. You held it long enough, and I'll knock the teeth out of anyone who says otherwise." } },
      choices = { { text = "Thank you, Ilsa.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogues = {
      lines = { { id = "ro_default", text = "Only on feast days, and only if they've stopped cheating, which they never have. Osborne owes me three silver from the last bout, so tell him I asked after it." } },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Gurubashi Arena's my kind of place, recruit, all blood and gold and no hesitating. I'd go tomorrow if Wu Shen didn't need me here to keep the young ones honest." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons fight like their mountain's on fire, which it usually is. I'd like a go at one with this sword, just to see if they're as tough as they look." } },
    second_war = { { id = "tp_second_war", text = "My mother swung a greatsword in the Second War, and she'd tell you an orc's just a man who hasn't learned to duck. I learned to duck from her, and I learned to swing from her too." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock orcs nest in that mountain north of Redridge, and they're the toughest fighters in the Eastern Kingdoms. I'd like to test that, recruit, and I'd like you beside me." } },
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
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Shield up and chin down, that's good. What do you need?" },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The line is thin in Westfall, thinner in Redridge, and thinnest of all in Duskwood. A shaman's spirits would be welcome." } },
      choices = {
        { text = "Hold the line, Ander. The kingdom needs it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The provinces can hold themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I trust anyone who stays where they're put and doesn't run when it goes badly, and some warlocks do, and some don't. The provinces need every hand they can get, so I'll take yours, but if your demon breaks the line, I'll hold you to account for it." },
      },
      choices = {
        { text = "Hold me to account, then. I'll keep it in line.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon holds lines better than your recruits.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Ander.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Wherever the line was about to break, I expect, because a bear that can heal itself holds a gap better than three recruits. But you'd have to stay there, and not wander off after something in the trees." } },
      choices = {
        { text = "I'd hold the line wherever you put me, Ander.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the forest calls, I'll go, line or no line.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not in a line, but beside one, because the man with the shield holds while the man with the knife finds the gap. I've seen SI:7's people work beside a shield wall, and the good ones never forgot who was holding the front." } },
      choices = {
        { text = "I'd never leave the shield-bearer to fall alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The shield-bearer's job is to hold. Mine is to win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I trust the ones who tell me before they cast, and I don't stand in front of the others twice. A line is only as strong as the trust behind it, and that goes for the ones throwing fire as well as the ones holding shields." } },
      choices = {
        { text = "I'll always warn the line before I cast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The line can watch out for itself, Ander.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "By staying behind it and keeping it standing, and by never stepping forward when you're needed back. The line holds because everyone knows their place in it." } },
      choices = {
        { text = "Then I'll keep my place and keep them standing.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If someone's falling, I'll step forward. Lines can bend.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not always, because a line that never bends will break. But a paladin stepping back is a signal to everyone else, and they'll follow you, so you'd better be right." } },
      choices = {
        { text = "I'll hold the line until the end, Ander.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll step back when it saves lives, whatever it signals.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll be behind the line, {class}, and the line's only as strong as the healer behind it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be in the line, {class}, and you'll hold it, because your order's never learned to step back." },
        { id = "h_default", key = true,
          text = "Ander Germaine. I teach the shield, and the line, and the plain fact that you're never fighting for yourself alone, whatever you tell yourself on the road." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 40 },
          text = "You came back. Not all of them do, you know, and I keep a list of the ones who don't; I'm glad to leave you off it." },
        { id = "h_redridge", when = { visited = "Lakeshire" },
          text = "You've been through Lakeshire, so tell me how the bridge is holding. I trained three of the watchmen there, and I haven't had a letter since spring." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Ander Germaine, warrior trainer. You've your own teachers, I'm sure, but if you ever need someone to stand in front of you, warriors are good for that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You work alone, I expect, and I'll tell you what I tell everyone: nobody's as alone as they think." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. I've stood in front of a good many of your kind, and I've only been set on fire twice, which I count as a fine record." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've been told your people can be a shield one moment and a healer the next, and I'd like to see how that fits in a line." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You stand behind the line, I suppose, and send your friend in front of it, which is not how I'd do it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The line needs every hand. Your spirits might help hold it, if they're steady." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the recruits are running laps." },
        { id = "h_again2", text = "Go on. Shield down for a moment, I won't tell Wu." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I'd like to know what to practise.", next = "practise", when = { class = "WARRIOR" } },
        { text = "What do you mean by the line?", next = "line" },
        { text = "That list must hold a lot of names.", next = "list" },
        { text = "Gnomes and dwarves can't fit easily in your line.", next = "allies", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Can a hunter hold your line?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I walked the Trade District with a halberd once.", next = "guard", when = { origin = "human_city_guard" } },
        { text = "Do you think rogues should fight in a line?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt you trust the mages you protect, Ander.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How should a priest serve the line, Ander?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it wrong to step back from the line, Ander?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where would a druid stand in your shield line, Ander?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you trust warlocks behind your line, Ander?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the provinces in trouble, Ander?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    second_war = { { id = "tp_second_war", text = "The shield wall held Stormwind's gate in the Second War, until it didn't, and I've never forgotten the lesson. Every soldier I train learns to hold the line, because one broken shield breaks the whole of it." } },
    scourge = { { id = "tp_scourge", text = "The dead don't stop, and they don't break, and they don't fear a shield wall. I've had reports from Lordaeron that would make you weep, and I train every soldier as if they'll face them someday." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "General Jonathan holds the Valley of Heroes with too few men, and I send him every soldier I can spare. I'd like to send him more, and I'd like the provinces to stop needing them." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord's a soldier, and he understands the line better than any noble in the Keep. I wish the Keep would let him hold it the way he'd like." } },
    background = { { id = "tp_bg", text = "I stood in a shield wall, and now I teach others to. That's all of it that matters.", next = "line" } },
    advice = { { id = "tp_ad", text = "Find the person beside you before the fight starts. You won't have time to look once it does." } },
    _none = { { id = "tp_none", text = "Can't help you there, I'm afraid. I only really know shields, and people's worries." } },
  },
}
