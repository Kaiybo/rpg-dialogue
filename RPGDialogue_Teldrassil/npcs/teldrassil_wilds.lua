-- Teldrassil between the glades: Lake Al'Ameth, Shadowglen's poisoned scout, Dolanaar's cook, Rut'theran's perch.
-- Voice: bibles/teldrassil_wilds.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "denalan", id = TODO_NPC("Denalan"), name = "Denalan",
  bible = "bibles/teldrassil_wilds.md", role = "scholar", tier = "quest",
  communities = { "dolanaar" }, temper = { "calm" }, values = { "curious" },
  notices = { "class" },

  impression = {
    first = "Denalan studies the plants of Teldrassil from his camp at Lake Al'Ameth, and something about them is troubling him.",
    third = "{name} met Denalan, a druidic scholar who tends his experiments by Lake Al'Ameth.",
  },

  greetings = {
    { id = "g_lake", text = "Ishnu-alah, traveller. Step carefully, for my sprouts are planted closer to the path than they should be." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The lake has been quiet, and my sprouts less so." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They grow strangely, twisted and sickly. I study them, but I cannot find the cause. Your spirits might know." } },
      choices = {
        { text = "Then study them carefully, Denalan. Find the cause.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burn them. Sickness spreads.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not by any prayer I know, because whatever twists them comes from the soil and the seeds rather than from a wound. But I've come to think all living things deserve some pity, even the ones that attack me, so a prayer for them would not be wasted." } },
      choices = {
        { text = "Every living thing deserves pity, so I'll pray for them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're walking trees, and I'll save my prayers for people.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Twisted, I'm almost certain, for they were born from Teldrassil like everything else here and something in the soil has gone wrong. Fight them if they come for you, but bring me their seeds as well, and perhaps one day we'll have fewer of them to fight." } },
      choices = {
        { text = "Then I'll fight them only when I must.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Twisted or not, they attack travelers, and I'll cut them down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They should be gentle growing things, but something in Teldrassil's soil has made them savage, and they attack anyone who comes near the lake. I need them thinned so that I can study their seeds, so please swing carefully, because I want what's left of them and not splinters." } },
      choices = {
        { text = "I'll cut carefully and bring you what's left.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Splinters are what happens. Study those.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and that troubles me more than their tempers, because a plant has no business hunting. Something in the young tree's growth has gone strange, and I can't yet tell whether it's sickness or simply youth." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't trust them either, I see, for it has been watching the trees since you came. Animals feel these things before scholars do." },
      },
      choices = {
        { text = "Let me track them for you. Their patterns may help.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Things that hunt get hunted. I'll clear them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Arcane? I hope not, for that would mean someone brought it here, and I would rather it were only a young tree's growing pains. If you sense something, tell me, but do not go casting at my timberlings to find out." },
      },
      choices = {
        { text = "I'll watch, and cast nothing near them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If magic did this, magic can find it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's wrong with the timberlings?", next = "timber" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then watch them, and tell me how they behave when they think no one is near, for they are wary of me now. Their seeds may tell us what is wrong, so bring me those if you can." },
      },
      choices = {
        { text = "I'll watch them, and harm none needlessly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Easier to cut a few open and look inside.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why work by the lake?", next = "lake" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I've wondered, I confess, because the seeds I've taken from them are wrong in ways the soil alone can't explain. If you sense anything of your own craft in them, I'd want to know it, even if I wouldn't enjoy hearing it." },
      },
      choices = {
        { text = "I'll tell you whatever I sense, good or ill.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What I sense is my own affair.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The timberlings I study are sick in a way I don't yet understand, and I wonder whether a healer's eye might see what mine has missed." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out by Lake Al'Ameth? You're welcome, though I hope you'll forgive me if I go on taking notes while we talk." },
        { id = "h_default", key = true,
          text = "I am Denalan, and I study how the life of Teldrassil grows. The great tree is young, and the creatures born of it are not always what we hoped." },
        { id = "h_earth", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "My earth from Darnassus, at last! Thank you, for I had nearly given up on it, and the planting cannot wait much longer." },
        { id = "h_seeds", when = { questActive = TODO_QUEST("Timberling Seeds") },
          text = "The timberlings around the lake carry seeds within them. Bring me some, and we may learn what the tree is trying to say." },
        { id = "h_sprouts", when = { questActive = TODO_QUEST("Timberling Sprouts") },
          text = "The sprouts by the water have grown in ways I did not expect. Gather what you can, and be gentle if they let you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The timberlings around the lake have become violent, and I would rather you trimmed them than I did." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have seen the timberlings moving through the trees, and you'll have noticed that they move like hunting things now." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at my lake. I'd like you to keep your servant away from the timberlings, because they're strange enough already without a demon setting them off." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The plants of Teldrassil trouble me. Something in them is wrong. Do your earth spirits feel it?" },
      },
      again = {
        { id = "h_again", text = "Is there something more you would ask?" },
        { id = "h_again2", text = "I am listening, though my mind is half on the soil." },
      },
      choices = {
        { text = "What is wrong with the timberlings?", next = "timber" },
        { text = "Why study plants out here, not in Darnassus?", next = "why" },
        { text = "Tell me about Lake Al'Ameth.", next = "lake" },
        { text = "As a druid, I feel something amiss in the land.", next = "druid", when = { class = "DRUID" } },
        { text = "Something arcane may be twisting your timberlings.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your timberlings never hear me. I could watch them for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's wrong with the timberlings, Denalan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the timberlings stalk prey like true beasts now?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can a sickness like the timberlings' be healed, Denalan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are the timberlings evil, or only twisted?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could fel magic be what's twisting the timberlings?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What is wrong with the plants, Denalan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Elune guide your work.", next = "END" },
      },
    },
    timber = {
      lines = { { id = "t_default", text = "They are the tree's own children, yet many have turned angry and strange. I want to know whether the fault lies in them or in the soil they rose from." } },
      choices = {
        { text = "And what do you suspect?", next = "timber_sus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    timber_sus = {
      lines = { { id = "ts_default", text = "That Teldrassil was planted without nature's blessing, and the land knows it. I say that quietly, for not everyone in Darnassus would like to hear it." } },
      choices = {
        { text = "Then the Archdruid must be told plainly.", next = "timber_end", fx = { align = { order = -1 } } },
        { text = "The Archdruid knows best. Trust his judgment.", next = "timber_end", fx = { align = { order = 1 } } },
        { text = "What will you do?", next = "timber_end" },
      },
    },
    timber_end = {
      lines = { { id = "te_default", text = "Study, and gather proof, and say nothing I cannot show. Help me with the seeds, and we may know soon enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    why = {
      lines = { { id = "w_default", text = "Because the city tends its gardens too carefully, and I need to see what grows when no one is watching. The lake shows me the truth of things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lake = {
      lines = { { id = "l_default", text = "It is a calm place, and its waters are clear, though the furbolgs near Ban'ethil grow restless. Dolanaar is close, should you need rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you feel what I feel, and I am glad not to be alone in it. Listen to the timberlings; they will tell you more than I can." } },
      choices = { { text = "I will listen.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I do not know, friend. The soil and I keep to ourselves." } },
  },
}

P:NPC {
  key = "iverron", id = TODO_NPC("Iverron"), name = "Iverron",
  bible = "bibles/teldrassil_wilds.md", role = "citizen", tier = "quest",
  communities = { "shadowglen" }, temper = { "gentle" }, values = { "kind" },
  notices = { "class" },

  impression = {
    first = "Iverron lay sick on the road by the spider cave, poisoned by the webwood venom, and grateful for every kindness.",
    third = "{name} met Iverron, a young kaldorei of Shadowglen who was poisoned by the spiders near the cave.",
  },

  greetings = {
    { id = "g_road", text = "Forgive me for not rising, friend. The venom has made my legs into water." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm standing now, mostly, and I have you to thank for it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I am, but kindness helps. Every one who stops gives me hope. Your spirits might help more." } },
      choices = {
        { text = "I will help you, Iverron. Rest now.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You should not have gone near the spiders.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd rather you didn't do it for my sake, because I was the one who wandered too near their cave. But the young ones of Shadowglen walk that way every day, so if you go, go for them, and I'll be grateful all the same." } },
      choices = {
        { text = "No one should face that cave alone, so I'll go.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spiders are spiders, and I'll go when it suits me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Rest easy a moment.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Keep them off the path, if you can, because they've grown bolder every day since I was bitten. Dirania worries that they'll take the next fool who wanders by, and I'd hate to be proven only the first of many." } },
      choices = {
        { text = "I'll keep the path clear for whoever comes next.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fools who wander near spider caves learn quickly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mushrooms and moonpetal lilies, Dirania says, and ichor from the great spider deep in the cave. A hunter would find the herbs quicker than anyone, and as for the spider, well, someone has to." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from the cave mouth, because the webs will hold it and the venom works on beasts just as it works on fools like me." },
      },
      choices = {
        { text = "I'll gather what Dirania needs and bring it back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take some venom for my own arrows first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "You know poisons? Then you know how slow this one is, and I would rather not hear how it ends. Dirania has gone for a cure, but if you can tell me how long I have, perhaps I could stop counting." },
      },
      choices = {
        { text = "The truth is it's serious, but slow. You have time.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You'll be fine. Don't think on it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who is Dirania to you?", next = "dirania" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A spell? I would not know, and forgive me, I am not sure I want to learn it from a stranger's magic. Dirania is bringing a remedy of herbs, and our people trust herbs more than spells." },
      },
      choices = {
        { text = "Herbs it is. I won't interfere.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If she's late, I'm trying the spell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What happened in the cave?", next = "cave" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Try if you like, and thank you, though I think Dirania is right that it wants the antidote. What I'd really like is for someone of the Circle to tell me why the spiders have grown so large." } },
      choices = {
        { text = "Rest easy, and I'll help Dirania finish the antidote.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wandering near that cave was your own fault, Iverron.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Terribly, and I'd be braver if the venom weren't making the trees spin. Dirania will have the antidote ready if someone brings her what she needs, and I'd be so grateful if it were you, so long as your friend waits at the cave mouth." },
      },
      choices = {
        { text = "It'll wait. Rest, and I'll fetch what Dirania needs.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It goes where I go. You'll manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin? Forgive me if I don't rise, {class}, because the venom has made my legs heavy, though seeing you makes me feel a little braver." },
        { id = "h_default", key = true,
          text = "I am Iverron, and I was foolish enough to wander too near the spiders' cave. The venom works slowly, which is a mercy and a torment both." },
        { id = "h_antidote", when = { questActive = TODO_QUEST("Iverron's Antidote") },
          text = "Dirania is making an antidote, and she needs things from the glade to finish it. Please hurry, for my strength fades by the hour." },
        { id = "h_done", when = { questDone = TODO_QUEST("Iverron's Antidote") },
          text = "The antidote worked, and I owe you my life. I'll stay well away from that cave from now on, I promise." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You can't fight what's in my blood, I'm afraid, though I'd enjoy watching you try." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you see the spider that bit me, it was a big one, and it looked very pleased with itself." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. If you have any healing in you I'd welcome it, though the venom is stubborn and Dirania says only her antidote will draw it out." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Is that a demon? Oh, please don't let it near me, I've had quite enough of things with too many teeth today." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Thank you for stopping. The venom burns. Your spirits might ease it." },
      },
      again = {
        { id = "h_again", text = "Is there more? Talking keeps my mind off the pain." },
        { id = "h_again2", text = "Ask what you like, friend." },
      },
      choices = {
        { text = "Why were you near the cave?", next = "cave" },
        { text = "Who is Dirania to you?", next = "dirania" },
        { text = "What lives in Shadowglen?", next = "glen" },
        { text = "Let me see the wound. I'm a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I know poisons. I could tell you what this is.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a spell draw the venom out?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can I do anything about the spiders, Iverron?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does the antidote need from the Webwood?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Shall I deal with the spiders that poisoned you, Iverron?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Shall I try my healing on the venom, Iverron?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are you afraid of my servant, Iverron?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are you badly poisoned, Iverron?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rest easy, Iverron.", next = "END" },
      },
    },
    cave = {
      lines = { { id = "c_default", text = "I wanted to see the webwood spiders up close, for they're beautiful in a terrible way. One of them saw me first." } },
      choices = {
        { text = "Should the spiders be cleared out?", next = "cave_clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_clear = {
      lines = { { id = "cc_default", text = "Some say so, since they've grown bold and many. Others say the cave was theirs first, and I was the one who trespassed." } },
      choices = {
        { text = "The forest is theirs too. Leave them in peace.", next = "cave_end", fx = { align = { light = 1 } } },
        { text = "They nearly killed you. Burn them out.", next = "cave_end", fx = { align = { light = -1 } } },
        { text = "What do you think?", next = "cave_end" },
      },
    },
    cave_end = {
      lines = { { id = "ce_default", text = "I think I'll keep my curiosity on the near side of the path next time. That's the only lesson I'm sure of." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dirania = {
      lines = { { id = "d_default", text = "A dear friend, and a far better healer than I am a scout. She'll scold me when I'm well, and I'll deserve every word." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glen = {
      lines = { { id = "g_default", text = "Young druids, sentinels and a great many grells, which the elders say are the work of the Burning Legion's leftovers. It's peaceful, mostly, if you stay away from caves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Elune bless you for the thought, but Dirania says only the antidote will clear it. Your prayers are still welcome, though." } },
      choices = { { text = "Then you'll have them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I've spent too long lying in the grass to hear the news." } },
  },
}

P:NPC {
  key = "zarrin", id = TODO_NPC("Zarrin"), name = "Zarrin",
  bible = "bibles/teldrassil_wilds.md", role = "vendor", tier = "quest",
  communities = { "dolanaar" }, temper = { "warm" }, values = { "generous" },
  notices = { "craft" },

  impression = {
    first = "Zarrin cooks for Dolanaar and keeps the old kaldorei recipes alive, one pot at a time.",
    third = "{name} met Zarrin, the cook of Dolanaar, who guards the recipes of the kaldorei.",
  },

  greetings = {
    { id = "g_cook", text = "Welcome, welcome! Come closer to the fire, for nothing tastes as good as food made where you can smell it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are, for they keep our history alive. A shaman's spirits might remember older tastes than mine." } },
      choices = {
        { text = "Keep them alive, Zarrin. They matter.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Old recipes are old. Try something new.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whenever the priestesses come down from Darnassus, and they always say the same blessing over the bread that my mother said. I like to think a meal shared with thanks is half a prayer already, whoever is listening." } },
      choices = {
        { text = "Then let me say the blessing over the bread.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread's bread, and I'll eat it without the ceremony, thanks.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something hot and slow-cooked, with the old herbs my mother taught me, because a meal eaten in a hurry gives back only half its strength. Sit down properly, take your gauntlets off and eat like someone who means to live a long while." } },
      choices = {
        { text = "Then I'll sit and eat properly, as your mother would want.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll eat on the road, because rules about meals are for the comfortable.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They did, my mother said, because some of these recipes fed the soldiers who marched against the Legion long ago, and they were meant to last long roads. Season it slowly and pack it tight, and it'll keep you standing in Ashenvale as it kept them standing then." } },
      choices = {
        { text = "Then I'll eat as they did, and remember them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Food's food. I don't need old stories with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thistle boar, if you ask me, and the stags from the high slopes when I can get them. The recipes of the kaldorei need a few things you can only find in the wilds, so a hunter is the best friend a cook can have." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it has been eating well already, so I suspect you're a good hunter. Don't let it near my pots, mind you." },
      },
      choices = {
        { text = "I'll hunt with respect and bring you the best cuts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll hunt what's easiest. Respect won't fill a pot.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Conjured bread! A human traveler offered me some once, and it tasted of nothing but its own cleverness. Sit and eat a proper meal, and tell me afterwards which you prefer." },
      },
      choices = {
        { text = "Your cooking, of course. I'll stay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured bread keeps me fed, and it never goes stale.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the oldest recipe you keep?", next = "recipe" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "My spice cupboard is guarded by my good opinion of my guests, which you are testing. Ask, and I will share; take, and you will eat elsewhere." },
      },
      choices = {
        { text = "I'd only ever ask, Zarrin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I was only testing your lock.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who eats here, mostly?", next = "guests" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "One or two of the oldest call for a nest's worth of eggs, and the druids of Dolanaar look at me as though I'd robbed a cradle. I take only what the birds can spare now, because the old ways are worth keeping but not at any cost." } },
      choices = {
        { text = "Keep the old recipes exactly as your mother made them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old recipes should change when the forest needs them to.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not often, but a guest is a guest, and the old kaldorei kept their tables open to anyone who came in from the dark. Some of the elders in Dolanaar would grumble at that, but they grumble at my seasoning too." },
      },
      choices = {
        { text = "Your elders are right to grumble about my kind.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them grumble. A guest is a guest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit down and eat, because I've never met a healer who remembered to feed themselves while they were busy looking after everyone else." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You look as though you've lived on trail rations for a month, {class}, and I can't allow that while you're in Dolanaar." },
        { id = "h_default", key = true,
          text = "I am Zarrin, and I cook for Dolanaar as my mother did before me. The recipes of the kaldorei are older than Teldrassil, and I mean to keep them that way." },
        { id = "h_recipe", when = { questActive = TODO_QUEST("Recipe of the Kaldorei") },
          text = "The old recipe needs what the forest around Dolanaar provides, and I've no time to hunt it myself. Bring it, and I'll teach you a taste of home." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll need a good meal before the road, and the old recipes were made for travellers who fought." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring me a good haunch and I'll show you what the kaldorei were doing with one long before Teldrassil grew." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've had herb broth on since dawn, and the Circle's folk are the only ones who can tell me whether the herbs I picked were happy to be picked." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at my table. Sit, eat, and keep your servant out of my kitchen, because I've never yet found an old recipe that called for a pinch of brimstone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I cook the old kaldorei recipes, one pot at a time. Would your spirits like a taste?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Taste this while you think; I fear it wants a pinch more moonroot." },
        { id = "h_again2", text = "Ask away, friend; I can talk and cook at once." },
      },
      choices = {
        { text = "What is the kaldorei recipe?", next = "recipe" },
        { text = "Who comes to eat here?", next = "guests" },
        { text = "What was it like before Teldrassil?", next = "before" },
        { text = "I cook too. Any secrets to share?", next = "cook", when = { profession = "Cooking" } },
        { text = "I can conjure bread. You needn't cook for me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your spice cupboard is very poorly guarded.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did the old kaldorei warriors eat like this?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which of Teldrassil's beasts make the best meals, Zarrin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do priests often eat at your table, Zarrin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you feed someone who fights for a living?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the old recipes call for anything the Circle frowns on?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you cook for warlocks often, Zarrin?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the old recipes important to you, Zarrin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Zarrin.", next = "END" },
      },
    },
    recipe = {
      lines = { { id = "r_default", text = "A stew we made under the stars of Kalimdor, before the World Tree was planted. The ingredients are found here now, so the taste is a little different, but the heart is the same." } },
      choices = {
        { text = "Should the old ways change for a new land?", next = "recipe_change" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe_change = {
      lines = { { id = "rc_default", text = "That is the question of our people, friend, in the kitchen as much as the council chamber. Some say we must hold fast, and others that we must grow." } },
      choices = {
        { text = "The old ways are worth keeping exactly as they were.", next = "recipe_end", fx = { align = { order = 1 } } },
        { text = "A recipe should change with the land.", next = "recipe_end", fx = { align = { order = -1 } } },
        { text = "And you?", next = "recipe_end" },
      },
    },
    recipe_end = {
      lines = { { id = "re_default", text = "I keep the heart and change the herbs, and nobody has complained yet. Bring me the ingredients and judge for yourself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    guests = {
      lines = { { id = "g_default", text = "Sentinels off their watch, druids back from the glades and travellers like you. Everyone eats, and that's why I always have work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "We lived among the trees of Ashenvale and Hyjal, and there was no great tree to build on. I miss those forests, but Teldrassil is home now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "c_default", text = "Patience, mostly, and fresh herbs. And never trust a recipe that says 'until done'." } },
      choices = { { text = "Wise words.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask me about food instead." } },
  },
}
