-- Un'Goro beyond the Refuge's fire: Hol'anyee Marshal, Torwa Pathfinder, the bloodpetal growers, and the lost souls down in the crater.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "holanyee", id = TODO_NPC("Hol'anyee Marshal"), name = "Hol'anyee Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Hol'anyee Marshal is Williden's sister and co-leader of the expedition, a sharpshooter who takes the crater's dangers personally.",
    third = "{name} met Hol'anyee Marshal, co-leader of the Marshal Expedition at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Hold up there. Let me see if you're injured before you come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back, and in one piece. That's more than I can say for my brother's tent." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "They hunt in packs and they're cleverer than any wolf I've seen, so yes. I know they were here long before us, but I've buried two scholars this season and I'm out of patience with them." } },
      choices = {
        { text = "You're in their crater. Learn their ways.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then thin the packs before you lose more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Wilder, and the elementals that walk its slopes don't stay put, either. I've shot at things on that ridge that took a bullet the way a candle takes a raindrop, so I go round it now, and I'd advise you to do the same." } },
      choices = {
        { text = "Fire like that needs binding before it spreads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the mountain be. Its fire isn't ours to tame.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than another rifle would, some days. A scout who can slip past a devilsaur without stirring it can warn a camp before the raptors reach it, and my last two scouts were brave and loud, and I buried them both." } },
      choices = {
        { text = "A good scout slips past the beast. Fighting it is a fool's job.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather face a beast than creep around it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've watched a mage freeze a whole raptor pack in the mud, so I won't pretend it doesn't work. But mana runs dry and I've never yet run out of shot, so I'd want both, and I'd want the mage standing behind my rifle." } },
      choices = {
        { text = "Then hire mages. The expedition needs proper guards.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every scholar ought to learn to defend themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "That's enough on spells.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I like to count, and I count every one of them. We lost both base camps, and some of the folk who were there we never found, so I don't know whether to pray for them or keep looking." } },
      choices = {
        { text = "Keep looking, and pray as you search. Hope costs nothing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mourn them and move on. The crater doesn't give back its dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe it should, and I've said so to Williden more than once, but he won't leave without his crystals, and I won't leave without him. So I keep the raptors off the scholars, and I hope someone like you is around when I can't." } },
      choices = {
        { text = "Your leader has decided. Stand by him and see it through.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Lives matter more than crystals. Drag him out if you must.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, maybe you can tell me why the ground in this crater is warm to the touch even at midnight, because nobody else can, and it keeps me awake." },
        { id = "h_default", key = true, text = "Hol'anyee Marshal, Williden's sister and the better shot of the two of us, whatever he tells you. While he plans, I go out and keep the raptors from eating our scholars." },
        { id = "h_c0", when = { class = "HUNTER" }, text = "A hunter! Finally, someone who understands why I sleep with my rifle. The raptors here hunt like nothing else in Azeroth." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Williden will want to ask you about the plants, but I'd rather know whether you can talk the raptors out of eating our scholars." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came up my path without me hearing a single step, and that's a rare thing in this crater. I could use feet like yours on patrol, because the raptors hear everything else." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A spellcaster at my campfire, so Williden will want you near his crystals by sundown. Just don't set anything alight, because the ferns down there burn quicker than you'd think." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, down here? Good, because my scholars keep coming back from the crater bitten, stung and poisoned all at once, and Williden's bandages only go so far." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Williden will want to give you a speech about the scholarly value of the crater, but I'd rather give you a rifleman's advice, which is never to charge a devilsaur." },
      },
      again = { { id = "h_again", text = "What else? I've got a patrol soon." }, { id = "h_again2", text = "Ask away, quickly." } },
      choices = {
        { text = "Is the Fire Plume as wild as it looks from up here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are the raptors truly so dangerous?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's it like hunting in the crater?", next = "b1_1" },
        { text = "Tell me about Williden.", next = "b2_1" },
        { text = "Why did the camps fall?", next = "b3_1" },
        { text = "I'll fight anything down there.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should the expedition pull out?", next = "s_1" },
        { text = "Would quiet feet really help your patrols down there?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would magic guard your scholars better than rifles?", next = "xmage", when = { class = "MAGE" } },
        { text = "How many of your people has the crater taken?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shouldn't the expedition leave before more people die?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Like nothing else in the world, and I've hunted a good deal of it. The raptors hunt in packs and think like soldiers, and the devilsaurs don't think at all; they just eat." } },
      choices = { { text = "You lost scouts?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I lost two good scouts to raptors in the first month, which taught me to always watch my flanks. Now I teach that lesson to everyone who comes to the Refuge." } },
      choices = { { text = "Never chase a lone raptor?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you go hunting down there, never chase a lone raptor. There's never only one." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "He's my brother, he's brilliant, and he worries too much, which makes him a decent leader and a terrible camper. I love him, and I wouldn't let anyone else watch his back." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "We pushed in too fast, too far, and the crater pushed back. I told Williden we needed more guards, and he agreed, and we still didn't have enough." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Brave words, and maybe you can. Just remember, the crater doesn't care how brave you are, only how fast you can run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden won't give up, and part of me admires him for it. The other part wonders how many more we'll lose." } },
      choices = { { text = "Keep going. Discovery is worth the risk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pull out before you lose anyone else.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, and I don't think the crater does either." } } },
}

P:NPC {
  key = "torwa", id = TODO_NPC("Torwa Pathfinder"), name = "Torwa Pathfinder",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Torwa Pathfinder is a tauren hunter camped near the Refuge who has set his sights on the great raptor Lar'korwi.",
    third = "{name} met Torwa Pathfinder, a tauren hunter in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "The Earth Mother walks here, stranger, and so do great beasts. Tread carefully." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, hunter. The trails have missed you." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Because that is how the lesson ends, with the student proving what he has learned. I take no pleasure in it, but I will honor him with the hunt and waste nothing he leaves behind." } },
      choices = {
        { text = "That is the way of the hunt. Honor him well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A teacher should be thanked, not hunted.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "She speaks louder here, I think, and with less patience. The beasts are larger, the plants hungrier and the mountain breathes fire, as if this were a place she shaped first and never finished taming." } },
      choices = {
        { text = "Then we must hunt here with great care and humility.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wild land rewards the boldest hunter. Take what you can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The great raptor hides in the ferns and strikes from them, and no one calls him dishonorable. I would only ask that you take what you kill with respect, whether you killed it in the open or from the shadows." } },
      choices = {
        { text = "A kill is a kill. The prey doesn't care how it died.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather meet my quarry face to face.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Earth Mother made the raptors and the ferns and the fire under this crater, and none of them were made to be bound. What you call upon was made somewhere else entirely, and the creatures of Un'Goro know it, even if your own people pretend not to." } },
      choices = {
        { text = "Power is power. I use what answers me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I keep it leashed. I know the danger better than you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We should speak of other things.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman comes into the crater. Then you have felt it too: the land here is young and old at once, and the Earth Mother's breath is very close to the surface." },
        { id = "h_default", key = true, text = "I am Torwa Pathfinder. I came to this crater to learn from its beasts, and the greatest of them, Lar'korwi, has become my teacher and my quarry." },
        { id = "h_c0", when = { questActive = TODO_QUEST("The Bait for Lar'korwi") }, text = "Lay the bait where Lar'korwi hunts, and be ready, for he will come quickly and he will not come gently." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid has come to the crater. Then you will understand why I call Lar'korwi my teacher, for nothing here hunts as purely as he does." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk softly, stranger, which is the first lesson Lar'korwi would teach you. But a raptor smells what it cannot hear, so softness alone will not save you here." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "There is a sourness on you that the beasts can smell, and so can I. Whatever you carry in your shadow, keep it leashed while you walk near my camp." },
      },
      again = { { id = "h_again", text = "Ask, and I'll answer while I watch the treeline for raptors." }, { id = "h_again2", text = "Speak, hunter." } },
      choices = {
        { text = "Does the Earth Mother speak differently in this crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why hunt your own teacher, Torwa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who is Lar'korwi?", next = "b1_1" },
        { text = "Why come to Un'Goro?", next = "b2_1" },
        { text = "Is it dangerous out here?", next = "b3_1" },
        { text = "The Earth Mother guide you, Torwa.", next = "x_1", when = { race = "Tauren" } },
        { text = "Should Lar'korwi be left alone?", next = "s_1" },
        { text = "Do you think hunting from hiding is dishonorable, Torwa?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does my magic offend you, hunter?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The greatest of the crater's raptors, the one the others follow. I have tracked him for many moons, and he has led me to places no other hunter has seen." } },
      choices = { { text = "Hunting as honor?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "To hunt him is to honor him. I will not take him lightly, nor will I take him without purpose, for he deserves a hunter's respect." } },
      choices = { { text = "And then?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When he falls, his strength will feed many, and his spirit will return to the Earth Mother. That is the way of things." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "This crater is like the world when it was young. The Earth Mother's children here are stronger and older, and a hunter can learn much from them." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Very, but so is all of life. A hunter who fears danger does not hunt, and a hunter who does not respect it does not live." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "And you, kin. It is good to see a tauren face so far from Mulgore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the beast should be left in peace. I say the hunt is part of the balance." } },
      choices = { { text = "The hunt is part of the balance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Some beasts should be left to live.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is not something the trails have taught me." } } },
}

P:NPC {
  key = "muigin", id = TODO_NPC("Muigin"), name = "Muigin",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Muigin tends unusual plants at Marshal's Refuge and talks about bloodpetals with real affection.",
    third = "{name} met Muigin, a botanist at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Oh! Mind the sprouts, please, they're very delicate." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The sprouts are growing nicely, thank you for asking." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Heat from below, water from the springs and something in the soil I can't name, all pushing them to grow faster than anything I studied back home. The bloodpetals bite, the vines strangle, and some of the bigger ones get up and walk about, which Larion insists is perfectly natural." } },
      choices = {
        { text = "Wild growth needs pruning. Study it, then control it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Life this wild should be left to grow as it will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only a little spell, and only on the small ones, because the big ones bite. Plants that eat meat shouldn't exist anywhere, so I can't help wondering if something odd was done to this crater long ago, and magic might be how we find out." } },
      choices = {
        { text = "Science should be careful. Larion's right to worry.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Try it. You'll never learn anything by being timid.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll think about it. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They do, just a little, the way they lean from a cold draught! I don't know what that means, and I'm not sure I want to, but if you'd stand still by that pot for a moment, I'd be ever so grateful for the data." } },
      choices = {
        { text = "Study it. Every power should be understood.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Maybe the plants know better than we do.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits ever talk to plants, do you think? Some of my bloodpetals behave as if they're listening, and frankly it's a little unsettling." },
        { id = "h_default", key = true, text = "Muigin, botanist! I study the plants of Un'Goro, especially the bloodpetals, which are as fascinating as they are dangerous. My partner Larion and I have been experimenting with them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Muigin and Larion") }, text = "Bring me those bloodpetal sprouts, and mind the ones that bite. They're very hungry this time of year." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Oh, a mage! You must tell me whether the bloodpetals react to arcane magic, because Larion insists it's dangerous to try and I suspect he's simply jealous he didn't think of it." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "You're a warlock, aren't you? I can tell by the way the bloodpetal sprouts lean away from you, which I've never seen them do for anyone else, and I'd very much like to take notes." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask me about the plants!" } },
      choices = {
        { text = "Why do the crater's plants grow so fierce?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are bloodpetals?", next = "b1_1" },
        { text = "Who is Larion?", next = "b2_1" },
        { text = "Do the plants really bite?", next = "b3_1" },
        { text = "Is there magic in that sap?", next = "x_1", when = { class = { "MAGE", "DRUID" } } },
        { text = "Is it right to experiment on living plants?", next = "s_1" },
        { text = "Would you really have me cast at your bloodpetals?", next = "xmage", when = { class = "MAGE" } },
        { text = "The plants lean away from me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Carnivorous plants, and very clever ones, which is why I love them. They lure insects and small creatures, and sometimes larger creatures, too, if they're hungry enough." } },
      choices = { { text = "Amazing properties?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Larion and I believe their sap has amazing properties, though we're still working out exactly which ones. It's very exciting." } },
      choices = { { text = "Both?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "And very dangerous, of course, but exciting! Science is often both." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "My research partner, and a very patient one. He handles the field collection and I handle the analysis, though we argue about which part is harder." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Oh, yes, and some of them quite hard. I've lost two pairs of gloves and nearly a finger." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, wonderful, someone who asks the right question! It's a mana-reactive compound, I'm almost certain, though Larion says I'm guessing. I'm not guessing, I'm hypothesizing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge think the plants should be left alone. I think understanding them is the highest form of respect." } },
      choices = { { text = "Understanding is a form of respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Leave the crater's plants in peace.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but it probably grows somewhere in the crater!" } } },
}

P:NPC {
  key = "ringo", id = TODO_NPC("Ringo"), name = "Ringo",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Ringo is a lost expedition member who wandered too far into the crater and could barely keep going.",
    third = "{name} met Ringo, a lost member of the Marshal Expedition in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Oh, thank goodness, a person! I thought I'd never see another face." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I wasn't sure you would." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The springs, honestly; I wanted to see the steam vents near the volcano up close, and then the ground got hotter and the paths kept changing. I'd swear the crater moved its trails about behind me, just to be unkind." } },
      choices = {
        { text = "The crater was warning you. You should have turned back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You followed your curiosity. That's no crime.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, oh, thank goodness, can you call up some water, even a little? I've been talking to the rocks myself for two days, and they haven't said a single helpful thing." },
        { id = "h_default", key = true, text = "Ringo, of the Marshal Expedition, or I was until I got lost. I've been wandering for days, and I'm so tired and thirsty I can barely stand." },
        { id = "h_c0", when = { questActive = TODO_QUEST("A Little Help From My Friends") }, text = "You'll take me back to the Refuge? Please, and if I faint, use the water from the spring, it brings me round." },
      },
      again = { { id = "h_again", text = "What else? I'm listening, barely." }, { id = "h_again2", text = "Go on, I'm just resting my eyes." } },
      choices = {
        { text = "What drove you so far into the crater, Ringo?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who's Spraggle?", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "Let me tend to you before we go.", next = "x_1", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "Should you have gone alone?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was looking for crystals out past the ridge, and I followed a trail I shouldn't have. By the time I turned back, everything looked the same." } },
      choices = { { text = "Drinking from puddles?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been hiding from the raptors and drinking from puddles, which I don't recommend. Spraggle must be frantic." } },
      choices = { { text = "Owe me everything?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you get me home, I'll owe you everything, and Spraggle will too." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Spraggle Frock, my friend at the Refuge, and the worrier of the expedition. If anyone's been looking for me, it's Spraggle." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Not badly, just exhausted and very, very thirsty. The crater's heat takes everything out of you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, that feels better already. Thank you, friend, I didn't think I'd last another night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden told us to always go in pairs. I didn't listen, and look where it got me." } },
      choices = { { text = "Rules exist for good reason. Follow them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Sometimes you have to take your own path.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, I'm too tired to think about it." } } },
}

P:NPC {
  key = "krakle", id = TODO_NPC("Krakle"), name = "Krakle",
  bible = "bibles/ungoro.md", role = "citizen", tier = "service",
  impression = {
    first = "Krakle is a goblin who has taken a great interest in the hot springs of Un'Goro, mostly the profitable kind.",
    third = "{name} met Krakle, a goblin near the hot springs of Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Hey, careful there, friend! The water's hotter than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Got any readings for me?" },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Everything gets sold eventually, pal, and better me than some Venture Company crew with a drill. I just want the water, and they'd want the whole crater." } },
      choices = {
        { text = "Leave the springs alone. Some things aren't for sale.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better you than the Venture Company. Sell away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The volcano, mostly, or whatever's under it, pushing heat up through the rock until the water can't sit still. There's minerals in it too, fizzy ones, and I swear a dip in there takes ten years off you, or at least ten layers of skin." } },
      choices = {
        { text = "Those springs are sacred water. Don't sell them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hot water, good health, fair price. Bottle it, Krakle.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not the spring, the idea! If the Venture Company hears there's bottled mineral water to be had in Un'Goro, they'll be down here with pumps before I've finished drawing the label, and you look like you'd know how they think." } },
      choices = {
        { text = "A good idea belongs to whoever gets there first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Stake your claim properly with the Cartel, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Never mind the water.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not boil, temper! The minerals do something to aches and pains, and if a mage could cool it to drinking heat, I could sell it in Gadgetzan by the barrel. I'm not saying the Kirin Tor would approve, but the Kirin Tor aren't paying my bills." } },
      choices = {
        { text = "Magic isn't for peddling bathwater.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A spell's worth whatever someone will pay for it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Krakle.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Sell's an ugly word, friend, when I'd be offering a premium bathing experience with spiritual benefits. The springs really do ease a sore back, mind you, so if your Light wants to take a bit of the credit, I'm happy to share it, for a percentage." } },
      choices = {
        { text = "Blessings aren't for sale. Find another way to get rich.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If folk feel better, a little exaggeration does no harm.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, perfect! You talk to water spirits, right? Ask the ones in Golakka what they'd want for exclusive bottling rights, because I'm prepared to negotiate." },
        { id = "h_default", key = true, text = "Krakle's the name, and the hot springs are my game. These springs are boiling with heat and minerals, and somebody's going to figure out how to sell them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Ooh, a druid! Your folks love a good hot spring, right, all that steam and nature? I could use an endorsement once I figure out how to bottle these." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got the look of someone who finds things before anybody else does, friend. I've got a hot spring here that's worth a fortune, and I'd hate for it to wander off while I'm not looking." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Tell me, can you make water hot or cold on command, because if you can, I've got a business proposition that'll make the springs look like small change." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say, would you bless my springs? Holy hot springs, blessed by the Light, would sell like water in Tanaris, which is to say very well." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Talk quick, the springs won't wait." } },
      choices = {
        { text = "What makes the Golakka Hot Springs boil, Krakle?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Should the springs really be sold, Krakle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's special about the springs?", next = "b1_1" },
        { text = "Is it safe here?", next = "b2_1" },
        { text = "Should these springs be sold?", next = "s_1" },
        { text = "Worried someone will steal a whole hot spring?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You want me to boil your springs for coin?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really sell blessings, Krakle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They're hot, they're full of strange minerals, and some of them glow. Something's heating them from deep underground, and I'd love to know what." } },
      choices = { { text = "Something bigger?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Maybe it's the Fire Plume, or maybe it's something bigger. Either way, heat like that is worth money." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe enough, if you don't fall in. The bigger danger is the beasts that come to drink, so keep your eyes open." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the crater shouldn't be bought and sold. I say everything's for sale, if the price is right." } },
      choices = { { text = "Nature shouldn't be for sale.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Profit is how anything gets done.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, friend, but I bet it's worth something." } } },
}
