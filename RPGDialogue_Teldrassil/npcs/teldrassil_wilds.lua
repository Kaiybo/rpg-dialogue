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
      lines = { { id = "xdsham_default", text = "The plants and timberlings here grow twisted and sickly, and I cannot find the cause. Perhaps your spirits know it." } },
      choices = {
        { text = "Then study them carefully, Denalan. Find the cause.", next = "BACK", reply = "I will, and I will not rest until I do, for the forest deserves to know what ails it. Your trust means a great deal, shaman.", fx = { align = { order = 1 } } },
        { text = "Burn them. Sickness spreads.", next = "BACK", reply = "And if the sickness is in the soil, shall we burn the whole tree? Fire is a poor cure for a sickness we do not yet understand.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not by any prayer I know, because whatever twists them comes from the soil and the seeds rather than from a wound. But I've come to think all living things deserve some pity, even the ones that attack me, so a prayer for them would not be wasted." } },
      choices = {
        { text = "Every living thing deserves pity, so I'll pray for them.", next = "BACK", reply = "Thank you, priest, and Elune bless you for it. They did not choose what they have become.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're walking trees, and I'll save my prayers for people.", next = "BACK", reply = "They were gentle growing things once, and they may be again. I will pray for them myself, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Twisted, I'm almost certain, for they were born from Teldrassil like everything else here and something in the soil has gone wrong. Fight them if they come for you, but bring me their seeds as well, and perhaps one day we'll have fewer of them to fight." } },
      choices = {
        { text = "Then I'll fight them only when I must.", next = "BACK", reply = "That is all I ask, paladin, and more mercy than most travellers show. Every timberling saved is a seed I can study.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Twisted or not, they attack travelers, and I'll cut them down.", next = "BACK", reply = "They do, and I cannot ask you to bleed for my studies. Only bring me their seeds when you have done it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They should be gentle growing things, but something in Teldrassil's soil has made them savage, and they attack anyone who comes near the lake. I need them thinned so that I can study their seeds, so please swing carefully, because I want what's left of them and not splinters." } },
      choices = {
        { text = "I'll cut carefully and bring you what's left.", next = "BACK", reply = "Thank you, warrior, for that is more care than I expected from a blade. Every seed matters.", fx = { align = { order = 1 } } },
        { text = "Splinters are what happens. Study those.", next = "BACK", reply = "Splinters will tell me nothing, I am afraid. Try, at least, to leave me something whole.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and that troubles me more than their tempers, because a plant has no business hunting. Something in the young tree's growth has gone strange, and I can't yet tell whether it's sickness or simply youth." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, and that troubles me, because a plant has no business hunting. Your {pet} doesn't trust them either, I see, for it has been watching the trees since you came." },
      },
      choices = {
        { text = "Let me track them for you. Their patterns may help.", next = "BACK", reply = "You would, wouldn't you? A hunter's eye might see what mine has missed, and I would be very grateful.", fx = { align = { honor = 1 } } },
        { text = "Things that hunt get hunted. I'll clear them.", next = "BACK", reply = "And then there will be no timberlings left to study, and the sickness will simply wait for the next ones. Please, a little patience.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Arcane? I hope not, for that would mean someone brought it here, and I would rather it were only a young tree's growing pains. If you sense something, tell me, but do not go casting at my timberlings to find out." },
      },
      choices = {
        { text = "I'll watch, and cast nothing near them.", next = "BACK", reply = "Thank you, mage, for the young tree has enough troubles without a spell gone astray. Watch closely and tell me what you see.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If magic did this, magic can find it.", next = "BACK", reply = "Perhaps it could, but I would rather it were not magic at all. Look carefully, and I will pray you find nothing.", fx = { align = { order = -1 } } },
        { text = "What's wrong with the timberlings?", next = "timber" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then watch them, and tell me how they behave when they think no one is near, for they are wary of me now. Their seeds may tell us what is wrong, so bring me those if you can." },
      },
      choices = {
        { text = "I'll watch them, and harm none needlessly.", next = "BACK", reply = "Thank you, and they will be grateful even if they do not know it. Watch the seeds most of all.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Easier to cut a few open and look inside.", next = "BACK", reply = "You could, and I would learn something, but the timberlings would learn to fear us all the more. Watch first, please.", fx = { align = { light = -1 } } },
        { text = "What is this lake like?", next = "lake" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I've wondered, I confess, because the seeds I've taken from them are wrong in ways the soil alone can't explain. If you sense anything of your own craft in them, I'd want to know it, even if I wouldn't enjoy hearing it." },
      },
      choices = {
        { text = "I'll tell you whatever I sense, good or ill.", next = "BACK", reply = "Thank you, warlock, and I will listen, whatever it is. I would rather know than wonder.", fx = { align = { honor = 1 } } },
        { text = "What I sense is my own affair.", next = "BACK", reply = "Then keep it, but know that I will keep wondering. If it is fel, I would rather know before the forest does.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The timberlings I study are sick in a way I don't yet understand, and I wonder whether a healer's eye might see what mine has missed." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out by Lake Al'Ameth? You're welcome, though I'll go on taking notes while we talk, if you don't object." },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The plants of Teldrassil trouble me, for something in them has grown wrong, and I wonder whether your earth spirits feel it too." },
      },
      again = {
        { id = "h_again", text = "Is there something more you would ask? I have time; the tree grows slowly, and so do my answers." },
        { id = "h_again2", text = "I am listening, though my mind is half on the soil." },
      },
      choices = {
        { text = "The timberlings here seem angry.", next = "timber" },
        { text = "Why study plants out here, not in Darnassus?", next = "why" },
        { text = "Tell me about Lake Al'Ameth.", next = "lake" },
        { text = "As a druid, I feel something amiss in the land.", next = "druid", when = { class = "DRUID" } },
        { text = "Something arcane may be twisting your timberlings.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your timberlings never hear me. I could watch them for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The timberlings by the lake look anything but gentle, Denalan.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
    emerald_dream = { { id = "tp_emerald_dream", text = "My sprouts were meant to be a small piece of the Dream made real, healthy and green. Instead they grow twisted, and I fear the soil of this tree knows something I don't." } },
    nordrassil = { { id = "tp_nordrassil", text = "Seeds from Nordrassil's grove grow straight and true, I'm told. I've begged the Circle for a handful, and they keep telling me to make do." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss twists everything it touches, and I've found traces of it near the lake. I'm watching my sprouts very closely now." } },
    green_dragons = { { id = "tp_green_dragons", text = "If Ysera's children had blessed this tree, my sprouts might grow right. I don't say it in Darnassus, but I say it to the lake." } },
    _none = { { id = "tp_none", text = "I do not know, friend. The soil and I keep to ourselves, and we have both found it a peaceful arrangement." } },
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
      lines = { { id = "xdsham_default", text = "I am, but kindness helps, and everyone who stops gives me a little more hope. Perhaps your spirits could ease the venom." } },
      choices = {
        { text = "I will help you, Iverron. Rest now.", next = "BACK", reply = "Thank you, {class}, and I will rest, since the venom does not leave me much choice. Dirania will be glad of you.", fx = { align = { light = 1 } } },
        { text = "You should not have gone near the spiders.", next = "BACK", reply = "No, I should not have, and Dirania has said so at length. Please do not make me hear it twice today.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd rather you didn't do it for my sake, because I was the one who wandered too near their cave. But the young ones of Shadowglen walk that way every day, so if you go, go for them, and I'll be grateful all the same." } },
      choices = {
        { text = "No one should face that cave alone, so I'll go.", next = "BACK", reply = "Thank you, and the young ones of Shadowglen will thank you too, even if they never know it. Go carefully.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spiders are spiders, and I'll go when it suits me.", next = "BACK", reply = "Then I hope it suits you soon, for the spiders grow bolder every day. Dirania will be waiting.", fx = { align = { honor = -1 } } },
        { text = "Rest easy a moment.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Keep them off the path, if you can, because they've grown bolder every day since I was bitten. Dirania worries that they'll take the next fool who wanders by, and I'd hate to be only the first of many." } },
      choices = {
        { text = "I'll keep the path clear for whoever comes next.", next = "BACK", reply = "Thank you, for there will be a next one, and I would rather it were not me again. The spiders do not forget.", fx = { align = { honor = 1 } } },
        { text = "Fools who wander near spider caves learn quickly.", next = "BACK", reply = "They do, and I am living proof of it, as you can see. Please, at least keep the path clear for the ones who are not fools.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dirania, my friend in Shadowglen, can brew one from hyacinth mushrooms, moonpetal lilies and ichor from the great spider deep in the cave. A hunter would find the herbs quicker than anyone, and as for the spider, well, someone has to." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dirania, my friend in Shadowglen, can brew one from mushrooms, moonpetal lilies and ichor from the great spider in the cave. Keep your {pet} away from the cave mouth, though, because the venom works on beasts just as it works on fools like me." },
      },
      choices = {
        { text = "I'll gather what Dirania needs and bring it back.", next = "BACK", reply = "Thank you, hunter, and Dirania will be so relieved. The great spider is deep in the cave, so be careful.", fx = { align = { honor = 1 } } },
        { text = "I'll take some venom for my own arrows first.", next = "BACK", reply = "Please, the antidote first, and your arrows after. I would like to stop seeing two of everything.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "You know poisons? Then you know how slow this one is, and I would rather not hear how it ends. Dirania has gone for a cure, but if you can tell me how long I have, perhaps I could stop counting." },
      },
      choices = {
        { text = "The truth is it's serious, but slow. You have time.", next = "BACK", reply = "Thank you for being honest with me, and kind about it too. I will try to be patient.", fx = { align = { honor = 1 } } },
        { text = "You'll be fine. Don't think on it.", next = "BACK", reply = "That is kind of you, though I can tell you are only being kind. I will try not to think on it.", fx = { align = { honor = -1 } } },
        { text = "Who is Dirania to you?", next = "dirania" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A spell? I would not know, and forgive me, I am not sure I want to learn it from a stranger's magic. Dirania is bringing a remedy of herbs, and our people trust herbs more than spells." },
      },
      choices = {
        { text = "Herbs it is. I won't interfere.", next = "BACK", reply = "Thank you, and I am sorry to be so wary of your magic. Dirania knows these herbs better than anyone.", fx = { align = { order = 1 } } },
        { text = "If she's late, I'm trying the spell.", next = "BACK", reply = "Please do not, for I would rather be poisoned by a spider than by a spell. She will not be late, I hope.", fx = { align = { order = -1 } } },
        { text = "What happened in the cave?", next = "cave" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Try if you like, and thank you, though I think Dirania is right that it wants the antidote. What I'd really like is for someone of the Circle to tell me why the spiders have grown so large." } },
      choices = {
        { text = "Rest easy, and I'll help Dirania finish the antidote.", next = "BACK", reply = "Thank you, and I will try to rest, though the trees will not stop spinning. Dirania will be so glad of your help.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wandering near that cave was your own fault, Iverron.", next = "BACK", reply = "It was, and Dirania has already told me so a dozen times. I would rather not hear it from a druid as well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Terribly, and I'd be braver if the venom weren't making the trees spin. Dirania will have the antidote ready if someone brings her what she needs, and I'd be so grateful if it were you, so long as your friend waits at the cave mouth." },
      },
      choices = {
        { text = "It'll wait. Rest, and I'll fetch what Dirania needs.", next = "BACK", reply = "Thank you, and I would be grateful if it waited a long way off. The trees spin enough already.", fx = { align = { light = 1 } } },
        { text = "It goes where I go. You'll manage.", next = "BACK", reply = "I will manage, I suppose, though it is not making the trees spin any slower. Please do hurry.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dd_spiders = {
      lines = {
        { id = "dds_default", text = "I keep dreaming of their legs on the stone, and then I wake and remember that there are fewer of them now. Thank you for that, though I hope it wasn't on my account alone." },
      },
      choices = {
        { text = "After what they did to you, they had it coming.", next = "BACK", reply = "That's kind of you to say, though I'm not sure the spiders knew they were doing anything wrong. Still, I won't pretend I'm sorry.", fx = { align = { light = -1 } } },
        { text = "I took no pleasure in it. They're only beasts.", next = "BACK", reply = "That's what Dirania says too. She told me to hate the venom and not the spider, and I am trying.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_kills", tags = { "news" }, when = { killed = { name = "Webwood", min = 15 } }, text = "They say you have killed a great many of the Webwood spiders since I was bitten. I know it's foolish, but I sleep better for knowing it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin? Pardon me for staying down, {class}, because the venom has made my legs heavy, though seeing you makes me feel a little braver." },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Thank you for stopping, because the venom burns like fire in my blood, and perhaps your spirits could ease it a little." },
      },
      again = {
        { id = "h_again", text = "Is there more? Talking keeps my mind off the pain." },
        { id = "h_again2", text = "Ask what you like, friend." },
      },
      choices = {
        { text = "I've cleared a lot of those spiders out of the cave.", next = "dd_spiders", when = { killed = { name = "Webwood", min = 15 } } },
        { text = "Why were you near the cave?", next = "cave" },
        { text = "Who's looking after you?", next = "dirania" },
        { text = "What lives in Shadowglen?", next = "glen" },
        { text = "Let me see the wound. I'm a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I know poisons. I could tell you what this is.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could a spell draw the venom out?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can I do anything about the spiders, Iverron?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there a cure for the venom?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
      lines = { { id = "d_default", text = "Dirania, a dear friend, and a far better healer than I am a scout. She'll scold me when I'm well, and I'll deserve every word." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glen = {
      lines = { { id = "g_default", text = "Young druids, sentinels and a great many grells, which the elders say are leftovers of the Burning Legion. It's peaceful, mostly, if you stay away from caves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Elune bless you for the thought, but Dirania says only the antidote will clear it. Your prayers are still welcome, though." } },
      choices = { { text = "Then you'll have them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "I prayed to Elune the whole time that spider's venom was in me, and Dirania prayed louder. I'm not sure which of us she listened to." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When my legs work properly again, I'm going to the Darkmoon Faire. Dirania says I'll come back poorer, and I say it'll be worth it." } },
    blackfathom = { { id = "tp_blackfathom", text = "I've heard Blackfathom Deeps has spiders too, and naga, and cultists. I think I'll stay on Teldrassil for a while yet." } },
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
    { id = "g_cook", text = "Ishnu-alah, and welcome! Come closer to the fire, for nothing tastes as good as food made where you can smell it under the open sky." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "I miss being sure of tomorrow, because there was always another one. Now I cook for people who will grow old, and I find I season things more carefully. Do you think we were better off immortal?" },
      },
      choices = {
        { text = "Yes. Nordrassil's gift was worth any price.", next = "op_r1", fx = { align = { light = -1 }, opinion = { kaldorei_immortality = "loss" } } },
        { text = "No. A people who can die learn to care.", next = "op_r2", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 }, opinion = { kaldorei_immortality = "freed" } } },
        { text = "Whoever finds a way to get it back will be dangerous.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { kaldorei_immortality = "dangerous" } } },
        { text = "Try living a short life. You stop missing forever.", next = "op_r4", fx = { affinity = 1, trait = { witty = 1 }, opinion = { kaldorei_immortality = "freed" } }, when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Spoken like someone who never saw what the Legion would have taken in payment. Still, I understand the ache, because I feel it every morning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "That is what I tell my stews, and they seem to agree. Things that won't last should be done well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "There are kaldorei who would call that a plan rather than a danger, and I don't share my kitchen with them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Ha! A hundred years or so and done, and you still find time to cook badly. I salute you, my short-lived friend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are, for they keep our history alive. A shaman's spirits might remember older tastes than mine." } },
      choices = {
        { text = "Keep them alive, Zarrin. They matter.", next = "BACK", reply = "I will, and my mother would be glad to hear you say it. Every dish here has a story behind it.", fx = { align = { light = 1 } } },
        { text = "Old recipes are old. Try something new.", next = "BACK", reply = "I do try new things, but never in place of the old ones. Some tastes deserve ten thousand years.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whenever the priestesses come down from Darnassus, and they always say the same blessing over the bread that my mother said. I like to think a meal shared with thanks is half a prayer already, whoever is listening." } },
      choices = {
        { text = "Then let me say the blessing over the bread.", next = "BACK", reply = "Then please do, for the bread will be glad of it. My mother would have liked you very much.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread's bread, and I'll eat it without the ceremony, thanks.", next = "BACK", reply = "You may, of course, though the bread will taste a little plainer without it. My mother would have sighed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something hot and slow-cooked, with the old herbs my mother taught me, because a meal eaten in a hurry gives back only half its strength. Sit down properly, take your gauntlets off and eat like someone who means to live a long while." } },
      choices = {
        { text = "Then I'll sit and eat properly, as your mother would want.", next = "BACK", reply = "Then sit, and I will bring you something worth the wait. My mother would be pleased.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll eat on the road, because rules about meals are for the comfortable.", next = "BACK", reply = "Then take something to eat on the road, at least, and think of my mother when you do. She would have pitied you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They did, my mother said, because some of these recipes fed the soldiers who marched against the Legion long ago, and they were meant to last long roads. Season it slowly and pack it tight, and it'll keep you standing in Ashenvale as it kept them standing then." } },
      choices = {
        { text = "Then I'll eat as they did, and remember them.", next = "BACK", reply = "Then they will be remembered, and that is all I ask. Eat well, warrior.", fx = { align = { light = 1 } } },
        { text = "Food's food. I don't need old stories with it.", next = "BACK", reply = "Then eat, and I will remember them for both of us. The food is still good without the stories.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Thistle boar, if you ask me, and the stags from the high slopes when I can get them. The recipes of the kaldorei need a few things you can only find in the wilds, so a hunter is the best friend a cook can have." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Thistle boar, if you ask me, and the stags from the high slopes when I can get them. Your {pet} looks like it has been eating well already, so I suspect you're a good hunter, but don't let it near my pots." },
      },
      choices = {
        { text = "I'll hunt with respect and bring you the best cuts.", next = "BACK", reply = "Then you will be welcome at my table any time, hunter. The stags of the high slopes are the best.", fx = { align = { light = 1 } } },
        { text = "I'll hunt what's easiest. Respect won't fill a pot.", next = "BACK", reply = "Then you will bring me tough meat and I will make it tender, which is my whole trade. But respect would help the stew.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Conjured bread! A human traveler offered me some once, and it tasted of nothing but its own cleverness. Sit and eat a proper meal, and tell me afterwards which you prefer." },
      },
      choices = {
        { text = "Your cooking, of course. I'll stay.", next = "BACK", reply = "Good, and you will taste what ten thousand years of cooking can do. Sit, and I will bring you a bowl.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured bread keeps me fed, and it never goes stale.", next = "BACK", reply = "It never goes stale because it was never fresh, mage. Come back when you remember what food tastes like.", fx = { align = { order = -1 } } },
        { text = "What is the oldest recipe you keep?", next = "recipe" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "My spice cupboard is guarded by my good opinion of my guests, which you are testing. Ask, and I will share; take, and you will eat elsewhere." },
      },
      choices = {
        { text = "I'd only ever ask, Zarrin.", next = "BACK", reply = "Then you will always be welcome, and my spices will always be shared. That is the old way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I was only testing your lock.", next = "BACK", reply = "Then you have found that it is not locked at all, only trusted. I would rather keep it that way.", fx = { align = { honor = -1 } } },
        { text = "Who eats here, mostly?", next = "guests" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "One or two of the oldest call for a nest's worth of eggs, and the druids of Dolanaar look at me as though I'd robbed a cradle. I take only what the birds can spare now, because the old ways are worth keeping but not at any cost." } },
      choices = {
        { text = "Keep the old recipes exactly as your mother made them.", next = "BACK", reply = "Exactly as she made them, though the druids would have words with me about the eggs. I will think about it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old recipes should change when the forest needs them to.", next = "BACK", reply = "Perhaps they should, and the druids would agree with you. My mother would have argued, but she is not here to.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not often, but a guest is a guest, and the old kaldorei kept their tables open to anyone who came in from the dark. Some of the elders in Dolanaar would grumble at that, but they grumble at my seasoning too." },
      },
      choices = {
        { text = "Your elders are right to grumble about my kind.", next = "BACK", reply = "Perhaps they are, but my table is open, and my mother would have said the same. Sit and eat.", fx = { align = { order = 1 } } },
        { text = "Let them grumble. A guest is a guest.", next = "BACK", reply = "Exactly, and that is what my mother would have said too. Sit, and let them grumble.", fx = { align = { order = -1 } } },
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
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I cook the old kaldorei recipes, one pot at a time, as they were cooked in Ashenvale before the world broke, so would your spirits like a taste?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Taste this while you think; I fear it wants a pinch more moonroot." },
        { id = "h_again2", text = "Ask away, friend; I can talk and cook at once." },
      },
      choices = {
        { text = "Do you miss the days when your people were immortal?", next = "op_ask" },
        { text = "What is the kaldorei recipe?", next = "recipe" },
        { text = "You must cook for a good many hungry folk.", next = "guests" },
        { text = "You must remember life before Teldrassil.", next = "before" },
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
      lines = { { id = "r_default", text = "A stew we made under the stars of Ashenvale, long before Teldrassil was planted. The ingredients are found here now, so the taste is a little different, but the heart is the same." } },
      choices = {
        { text = "Perhaps the old ways should change for a new land.", next = "recipe_change" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe_change = {
      lines = { { id = "rc_default", text = "That is the question of our people, friend, in the kitchen as much as the council chamber. Some say we must hold fast, and others that we must grow." } },
      choices = {
        { text = "The old ways are worth keeping exactly as they were.", next = "recipe_end", fx = { align = { order = 1 } } },
        { text = "A recipe should change with the land.", next = "recipe_end", fx = { align = { order = -1 } } },
        { text = "I'd like to know where you stand.", next = "recipe_end" },
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
    booty_bay = { { id = "tp_booty_bay", text = "In Booty Bay they cook with peppers that make grown warriors weep, I'm told. I'd give a month's spices to taste just one dish there." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has food from every land under the moon, and smells you've never imagined. I mean to go some day and come back with a whole new cookbook." } },
    elune = { { id = "tp_elune", text = "We used to bake moon cakes for Elune's festivals in the old days, and I still do. The recipe is older than this tree, and I've only changed it a little." } },
    highborne = { { id = "tp_highborne", text = "The Highborne ate like kings, the old recipes say, and wasted half of it. I keep their recipes and none of their manners." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask me about food instead, for I know recipes older than most kingdoms." } },
  },
}
