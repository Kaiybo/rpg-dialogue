-- Forever-only profession folk at the foot of Aldrassil, Shadowglen. Voice: bibles/aldrassil_forever.md
-- Junior trainers Eleyna Duskbreeze (herbalism), Fanorran Stilloak (mining), Terunne Bearshaper (skinning),
-- and Sylassa Moonglow, who explains professions to newcomers and points them to the trainers.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sylassa Moonglow: warm, patient guide to the professions for Shadowglen's newly woken.
P:NPC {
  key = "tel_sylassa", id = TODO_NPC("Sylassa Moonglow"), name = "Sylassa Moonglow",
  bible = "bibles/aldrassil_forever.md", role = "citizen", tier = "service",
  communities = { "shadowglen" }, temper = { "warm", "patient" }, values = { "kind", "patient", "craft" },
  notices = { "greenness", "visitor" },

  impression = {
    first = "She seemed glad that I asked her a question.",
    third = "{name} met Sylassa Moonglow, who guides Shadowglen's newcomers toward the crafts and their trainers.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hello, my friend! I'm always glad when you come by. Shall we talk about the trades again?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hello, {name}. Have you thought about taking up a trade? Patience might suit you." },
    { id = "g_default", text = "Hello, {name}! Have you thought about taking up a craft?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Have you settled on a craft yet, or are you still wondering?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've grown so much since you first stood here! I hope you've found time for a craft along the way." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "You've only just opened your eyes in the glade, haven't you? Don't worry about crafts yet, but do come back when you've caught your breath." },
    { id = "n_visitor", cat = "visitor", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You've come a long way to stand under our tree! The trainers here will teach you just as gladly as any in your own cities." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Sylassa Moonglow, and I'd be happy to answer any questions you have about the crafts, or point you to the trainers here at Aldrassil. If it all feels like too much at once, that's all right; you can always come back, or find trainers in Darnassus later." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I don't mind at all." },
        { id = "h_again2", text = "Another question? Good, that's what I'm here for." },
      },
      choices = {
        { text = "What are professions?", next = "what" },
        { text = "What kinds are there?", next = "kinds" },
        { text = "Where are the trainers?", next = "where" },
        { text = "Which craft would you choose?", next = "choose" },
        { text = "Which crafts suit a druid?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you have a craft of your own?", next = "w_mine" },
        { text = "Thank you, Sylassa.", next = "END" },
      },
    },

    what = {
      lines = {
        { id = "wh_default", text = "Skills for crafting, for gathering, and for simply getting by in the wild. Whether you want coin, supplies for your companions, or the pleasure of wearing something you made with your own hands, there's a craft for it." },
      },
      choices = {
        { text = "How do I learn the recipes?", next = "what_recipes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_recipes = {
      lines = {
        { id = "wr_default", text = "Trainers teach most of them, like the ones here, and you'll find others scattered across the world if you keep your eyes open. Once you've learned a recipe it's yours to make as often as you like, so long as you can gather what it needs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kinds = {
      lines = {
        { id = "ki_default", text = "There are primary crafts and secondary ones. You can hold only two primary crafts at a time, and if you abandon one, everything you learned in it is lost, so choose with care." },
      },
      choices = {
        { text = "And the secondary ones?", next = "kinds_secondary" },
        { text = "Only two? That seems harsh.", next = "kinds_two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kinds_secondary = {
      lines = {
        { id = "ks_default", text = "Cooking, fishing and first aid. You can learn all three, and you should, for they keep you fed and patched up, though they won't often make you rich." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kinds_two = {
      lines = {
        { id = "kt_default", text = "Harsh, perhaps, but a craft done well takes a lifetime even for us, and we have long lifetimes. Better two crafts mastered than six half-learned, I think." },
      },
      choices = {
        { text = "Mastery takes focus. You're right.", next = "BACK", reply = "It does, and I am glad you see it, for most of the young ones do not. Choose well, and give your two crafts your whole heart.", fx = { align = { order = 1 } } },
        { text = "I'd rather learn a little of everything.", next = "BACK", reply = "Then you will know a little of everything and master nothing, which is a choice many humans make. I would rather you mastered something.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    where = {
      lines = {
        { id = "wo_default", text = "Eleyna Duskbreeze teaches herbalism, Fanorran Stilloak teaches mining, and Terunne Bearshaper teaches skinning, all here at the foot of Aldrassil. The others you'll find in Dolanaar or in Darnassus itself." },
      },
      choices = {
        { text = "Tell me about the trainers here.", next = "where_trainers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_trainers = {
      lines = {
        { id = "wt_default", text = "Eleyna knows every leaf on Teldrassil and will tell you about all of them. Fanorran is quiet and a little gloomy, because the tree gives him so little stone to work, and Terunne is gentle, whatever his name suggests." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    choose = {
      lines = {
        { id = "ch_default", text = "Herbalism and alchemy, I think, for there's something lovely about a flower becoming a cure. But I'm not the one who'll be carrying the satchel, so choose what makes your own hands happy." },
      },
      choices = {
        { text = "I want whatever pays best.", next = "BACK", reply = "Then you will find plenty that does, though the best crafts pay in more than coin. Choose what you will not tire of.", fx = { align = { honor = -1 } } },
        { text = "I want whatever helps others most.", next = "BACK", reply = "Then you have a healer's heart, and herbalism will suit you well. The flowers will thank you for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = {
        { id = "xd_default", text = "Herbalism, most druids say, for you'll be walking among the plants anyway and you can pick them without leaving your shape. Some druids take up leatherworking too, though I've noticed they're very quiet about where the leather comes from." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_mine = {
      lines = {
        { id = "w_mine_default", text = "Only a small one. I press flowers, from every corner of the glade, and I keep them in a book by the trainers' doors so that the young ones can see what grows here before they go out and pick the wrong thing." },
      },
      choices = {
        { text = "Can I see the book?", next = "w_mine2" },
        { text = "That's a gentle craft.", next = "w_mine2" },
      },
    },
    w_mine2 = {
      lines = {
        { id = "w_mine2_default", text = "Of course, it's just there. That pale one is peacebloom, and that is silverleaf, and the brown one at the back is earthroot, which Eleyna says nobody ever recognises in time. I have pressed a few herbs that I couldn't name, too, and left space for someone to tell me." },
        { id = "w_mine2_w1", when = { profession = "Herbalism" }, text = "You gather already! Then perhaps you can fill one of my empty spaces. Look at the last page and tell me what that is." },
      },
      choices = {
        { text = "I'd like to fill one of those spaces.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Sylassa.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Don't feel rushed; a craft will wait for you. But don't put it off forever, because the materials are easiest to find while you're young and wandering." } },
    background = { { id = "tp_bg", text = "I tried every craft once, badly, before I learned to help others choose one well. That turned out to be my craft after all." } },
    _none = { { id = "tp_none", text = "Oh, I'm afraid I only really know about the crafts. One of the Sentinels might know." } },
  },
}

-- Eleyna Duskbreeze: junior herbalism trainer, chatty and fond of every plant on Teldrassil.
P:NPC {
  key = "tel_eleyna", id = TODO_NPC("Eleyna Duskbreeze"), name = "Eleyna Duskbreeze", title = "Junior Herbalism Trainer",
  bible = "bibles/aldrassil_forever.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "cheerful", "chatty" }, values = { "nature", "curious" },
  notices = { "druid", "herbalist" },

  impression = {
    first = "She asked me to pick gently and seemed to mean it.",
    third = "{name} met Eleyna Duskbreeze, the junior herbalism trainer at Aldrassil.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, welcome back! I've found a new patch of peacebloom, and I saved it to show you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome. If you've come to learn, I'll teach you. If not, please keep off the beds." },
    { id = "g_default", text = "Welcome! Have you come to learn the plants, or just to smell the silverleaf?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you pick gently? I'll know if you didn't." },
  },

  notice = {
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "A druid! You'll hear the plants better than I do, I expect, but I can still teach you which ones to pick." },
    { id = "n_herb", cat = "herbalist", when = { profession = { "Herbalism" } },
      text = "You've been picking, I can smell the peacebloom on your gloves. Come, let's see what more you can learn." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Eleyna Duskbreeze, and I teach herbalism here at the foot of Aldrassil. Peacebloom, silverleaf, earthroot, they all grow on Teldrassil if you know where to look, and I can show you how." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid come to learn the herbs! Mardant will teach you to hear the forest, and I'll teach you which bits of it are good for a fever, so between us you'll be well looked after." },
        { id = "h_visitor", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "You're not from Teldrassil, are you? Then everything here is new to you, and I envy you that, because I remember when it was all new to me too." },
      },
      again = {
        { id = "h_again", text = "Anything else? I could talk about plants all night, and often do." },
        { id = "h_again2", text = "Is there another leaf you want to know the name of? I have learned most of them now." },
        { id = "h_again3", text = "Go on, ask me another. The silverleaf won't mind waiting." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Where do the herbs grow?", next = "where" },
        { text = "Does picking harm the tree?", next = "harm" },
        { text = "What do I do with herbs once I have them?", next = "use" },
        { text = "You talk about them like old friends.", next = "fond" },
        { text = "Do the plants ever speak to you?", next = "speak", when = { class = "DRUID" } },
        { text = "Nothing like this grows where I'm from.", next = "home", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Farewell, Eleyna.", next = "END" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Peacebloom and silverleaf grow almost everywhere in the glade, and earthroot likes the shade at the roots of the old trees. Further out, past Dolanaar, the plants get rarer and the wildlife gets crosser, so go carefully." },
      },
      choices = {
        { text = "Crosser how?", next = "where_cross" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_cross = {
      lines = {
        { id = "wc_default", text = "The Gnarlpine furbolgs have turned strange and angry, and the timberlings by the lake have started walking about where they shouldn't. I've had students come back with a satchel full of earthroot and a furbolg's tooth in their boot." },
      },
      choices = {
        { text = "The furbolgs were friends once, weren't they?", next = "where_furbolg" },
        { text = "I'll go anyway. The herbs are worth it.", next = "BACK" },
      },
    },
    where_furbolg = {
      lines = {
        { id = "wf_default", text = "They were, and some of them used to leave little bundles of herbs on the path for us, tied up with grass. Something has soured them, and the druids in Dolanaar are trying to learn what before it spreads any further." },
        { id = "wf_gnarl", when = { questActive = TODO_QUEST("Gnarlpine Corruption") }, text = "You're already looking into it, aren't you? Then please be careful, and if you find out what's poisoned them, I'd like to know too." },
      },
      choices = {
        { text = "Whatever soured them, they must be stopped now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then they should be cured, not culled.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    harm = {
      lines = {
        { id = "ha_default", text = "Not if you take only what you need and leave the roots, which is what I'll teach you. Teldrassil is young, and everything on it is still learning how to grow, so we must be gentle with it." },
      },
      choices = {
        { text = "Then I'll pick only what I need.", next = "BACK", reply = "Then you will be welcome in every grove on Teldrassil, and the plants will grow back stronger. Come, and I will show you how.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants grow back. I'll take what I find.", next = "BACK", reply = "They do, if you leave the roots, and they do not if you do not. Teldrassil is still young, and every plant counts.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "What do you mean, still learning how to grow?", next = "harm_young" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harm_young = {
      lines = {
        { id = "hy_default", text = "Teldrassil was only planted a few years ago, after we lost our immortality at Hyjal, and a tree that size has never grown so fast before. Some of the herbs come up twisted or in the wrong season, and I write down every one I find." },
      },
      choices = {
        { text = "Is that a sign something is wrong?", next = "harm_sign" },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    harm_sign = {
      lines = {
        { id = "hs_default", text = "Arch Druid Staghelm says the tree will settle in time, and he knows far more than I do. But Nordrassil had the dragons' blessing and Teldrassil didn't, and I can't help noticing that the peacebloom doesn't seem to know that." },
      },
      choices = { { text = "Keep writing them down. Something else.", next = "BACK", fx = { learn = { "nordrassil" } } } },
    },
    use = {
      lines = {
        { id = "us_default", text = "Alchemists will make potions of them, and they'll pay you for the trouble if you'd rather not learn alchemy yourself. Many herbalists learn both, and it's a pleasant pairing, rather like moonlight and water." },
      },
      choices = {
        { text = "Where would I learn alchemy?", next = "use_alch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use_alch = {
      lines = {
        { id = "ua_default", text = "Cyndra Kindwhisper in Dolanaar teaches the first of it, and there are masters in Darnassus once you've outgrown her. Bring her a handful of peacebloom and she'll show you a healing draught that tastes almost pleasant." },
      },
      choices = {
        { text = "Almost?", next = "use_taste" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use_taste = {
      lines = {
        { id = "ut_default", text = "Earthroot is bitter, and there's no getting round it, though I've tried honey and moonberries and once, foolishly, mint. The bitterness is part of the cure, Cyndra says, and I think she says it so nobody asks her to try harder." },
      },
      choices = { { text = "I'll take it bitter. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    fond = {
      lines = {
        { id = "fo_default", text = "They are, a little! I've watched these patches since the first seeds took, and I know which silverleaf sulks in the rain and which peacebloom always flowers first. You'd be fond of them too, if you'd sat with them as long as I have." },
      },
      choices = {
        { text = "They're just plants, Eleyna.", next = "fond_just" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond_just = {
      lines = {
        { id = "fj_default", text = "So are the trees of Ashenvale, and look how hard we fight for those. Every kaldorei city stands on something growing, and the day we forget that is the day we start acting like the Highborne." },
      },
      choices = { { text = "A fair point. Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },
    speak = {
      lines = {
        { id = "sp_default", text = "Not in words, not to me, though I think they might to you, once Mardant has taught you to listen. I only know when they're thirsty, and when someone's trodden on them, which is usually a student of mine." },
      },
      choices = { { text = "I'll tell you what they say. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = {
        { id = "ho_default", text = "I'd love to hear about it! I've read that peacebloom grows in the human kingdoms too, though smaller, and that the dwarves' mountains have herbs that grow in the snow. Bring me a leaf from home one day and I'll be very grateful." },
      },
      choices = { { text = "I'll try to remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Leave the roots. Always leave the roots, and the plant will be there for the next one who needs it." } },
    teldrassil = { { id = "tp_teldrassil", text = "Our new World Tree, and still a young one. Its herbs grow fast and sometimes oddly, and I keep a little book of every strange one I find." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine used to leave us herbs on the path. Now they leave bruises, and nobody in Dolanaar knows quite why." } },
    _none = { { id = "tp_none", text = "If it doesn't grow, I'm afraid I don't know much about it." } },
  },
}

-- Fanorran Stilloak: junior mining trainer, quiet, a little rueful about teaching mining on a tree.
P:NPC {
  key = "tel_fanorran", id = TODO_NPC("Fanorran Stilloak"), name = "Fanorran Stilloak", title = "Junior Mining Trainer",
  bible = "bibles/aldrassil_forever.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "dry", "calm" }, values = { "practical", "patient" },
  notices = { "dwarf", "miner" },

  impression = {
    first = "He sells picks to people who must cross the sea to dig.",
    third = "{name} met Fanorran Stilloak, the junior mining trainer at Aldrassil.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, it's you. Good. How can I help you today, friend?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "How can I help you? Be brief, please." },
    { id = "g_default", text = "How can I help you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Found any stone yet?" },
  },

  notice = {
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf, come to a night elf for mining lessons. I'll try to keep a straight face if you will." },
    { id = "n_miner", cat = "miner", when = { profession = { "Mining" } },
      text = "You've got stone dust in the creases of your hands. Good, then you've already found more ore than I have this season." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Fanorran Stilloak. I teach mining, and I sell picks, and I'm aware that I do both at the foot of a tree. The ore is out there, on the mainland, and I can teach you to find it." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Fanorran Stilloak, and yes, I teach mining, even to dwarves who were born with a pick in their fist. I'd ask you to be kind about my methods, but I suspect you won't." },
      },
      again = {
        { id = "h_again", text = "Anything else, before I go back to sharpening picks for a forest with no ore?" },
        { id = "h_again2", text = "What more can I tell you?" },
        { id = "h_again3", text = "Go on. I've nothing to dig today." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "I'd like to buy from you.", next = "BUSINESS" },
        { text = "Is there any ore on Teldrassil?", next = "ore" },
        { text = "Why would a kaldorei take up mining?", next = "why" },
        { text = "What does a new miner need?", next = "kit" },
        { text = "You don't seem very happy here.", next = "gloomy" },
        { text = "A dwarf could teach you a thing or two.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "What's the best ore you've ever found?", next = "w_best" },
        { text = "Farewell.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "or_default", text = "Very little; the tree is wood all the way down, as far as anyone has dug, and nobody digs far. Cross to Darkshore and the hills there will give you copper, and that's where your real lessons begin." },
      },
      choices = {
        { text = "How do I get to Darkshore?", next = "ore_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_dark = {
      lines = {
        { id = "od_default", text = "Go down through Darnassus to Rut'theran Village, and the boat will carry you across to Auberdine. The hills along that coast are full of copper veins, and nobody there will look at you strangely for carrying a pick." },
      },
      choices = {
        { text = "Will I find other miners there?", next = "ore_remtravel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_remtravel = {
      lines = {
        { id = "orr_default", text = "Dwarves, mostly, from the Explorers' League, who dig up our old ruins looking for history and find copper by accident. There's one called Remtravel, I'm told, who forgets where he's left his own tools, so mind yours." },
        { id = "orr_dwarf", when = { race = "Dwarf" }, text = "Your own people, from the Explorers' League, digging through our old ruins along the coast. Be polite to them on my behalf; they've been more patient with my questions than I deserved." },
      },
      choices = {
        { text = "Dwarves digging in kaldorei ruins? That's wrong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone should learn from those ruins. Better them than nobody.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because a Sentinel's glaive is made of metal, and someone has to find the metal. Many of my people think digging into the earth is a wound, and I understand them, but I think a careful wound can be a kind of respect." },
      },
      choices = {
        { text = "The earth's gifts are there to be used.", next = "BACK", reply = "They are, and I am glad someone says it without blushing. A Sentinel cannot fight with a bare hand.", fx = { align = { light = -1 } } },
        { text = "Then we should take as little as we can.", next = "BACK", reply = "We should, and I try to, though the Sentinels always want more. Take only what you need, and fill the hole behind you.", fx = { align = { light = 1 } } },
        { text = "Do the others think less of you for it?", next = "why_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_others = {
      lines = {
        { id = "wo_default", text = "Some of the older druids do, and they're polite about it in the way that makes it worse. The Sentinels never complain, though, not when their glaives need new edges." },
      },
      choices = {
        { text = "What do the druids say, exactly?", next = "why_druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_druids = {
      lines = {
        { id = "wd_default", text = "That the earth remembers every cut, and that the dwarves have been cutting so long their mountains have stopped forgiving them. I don't know if that's true, but I keep my cuts small, just in case." },
      },
      choices = { { text = "A sensible habit. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    kit = {
      lines = {
        { id = "ki_default", text = "A mining pick, a pack to carry the ore, and a smith's hammer if you mean to work it yourself. I sell all three, and I'll not pretend the pick is any use to you before you've crossed the sea." },
      },
      choices = {
        { text = "Should I learn smithing as well?", next = "kit_smith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit_smith = {
      lines = {
        { id = "ks_default", text = "Mining and smithing go together like bow and string, and a miner who can't work his own ore has to sell it cheap. Engineering's the other pairing, though that's more for gnomes and their noisy little devices." },
        { id = "ks_gnome", when = { race = "Gnome" }, text = "Mining and smithing go together like bow and string, though I suspect you'll want engineering instead. Please don't build anything that explodes near the tree." },
      },
      choices = {
        { text = "What would a smith make from it here?", next = "kit_glaive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit_glaive = {
      lines = {
        { id = "kg_default", text = "Glaives, arrowheads and the rivets in a Sentinel's armor, mostly, for the Sentinels in Ashenvale go through them faster than we can dig. Every bar of copper you bring back is one more blade standing against the orcs." },
      },
      choices = { { text = "Then I'll dig. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    gloomy = {
      lines = {
        { id = "gl_default", text = "I'm not unhappy, only patient, which looks much the same from outside. A mining trainer on a tree has a lot of time to wait, and very little stone to wait with." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "I'm sure it could, and you're welcome to try. I'd only ask you not to tell me how much better it's done in Ironforge, because Sylassa already has, three times, and she's never held a pick." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    w_best = {
      lines = {
        { id = "w_best_default", text = "A seam of true silver in a cave above Auberdine, the first year I crossed the sea. I sat in front of it for an hour without lifting my pick, because I had never seen metal growing in the stone, and I wanted to look at it before I took it." },
      },
      choices = {
        { text = "Did you take it?", next = "w_best2" },
        { text = "An hour is a long time to stare.", next = "w_best2" },
      },
    },
    w_best2 = {
      lines = {
        { id = "w_best2_default", text = "I took half and left half, which the dwarves would think madness. Some of it became the arrowheads of a Sentinel company in Ashenvale. I like to think the other half is still there, waiting for someone else to sit and look at it." },
        { id = "w_best2_w1", when = { race = "Dwarf" }, text = "You will think I am a fool, I expect, for leaving good silver in the rock. Your people would have had the whole seam and the cave walls too." },
      },
      choices = {
        { text = "Leaving some was wise.", next = "BACK", fx = { align = { order = 1 } }, reply = "The druids would say so. I only know it felt right at the time." },
        { text = "You should've taken it all.", next = "BACK", fx = { align = { order = -1 } }, reply = "A dwarf said that to me once, at length. I still do not regret it." },
        { text = "Something else, Fanorran.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Carry your pick and a smith's hammer both, for you'll want to work what you dig before you carry it far." } },
    explorers_league = { { id = "tp_explorers_league", text = "Dwarves who dig up the past and leave the holes behind. They do know their stone, I'll give them that." } },
    teldrassil = { { id = "tp_teldrassil", text = "Wood all the way down, as far as anyone has dug, which isn't far. A poor place for a miner and a fine one for everything else." } },
    _none = { { id = "tp_none", text = "Stone I can speak to. That, I can't." } },
  },
}

-- Terunne Bearshaper: junior skinning trainer, gentle, firm about respect for the beasts.
P:NPC {
  key = "tel_terunne", id = TODO_NPC("Terunne Bearshaper"), name = "Terunne Bearshaper", title = "Junior Skinning Trainer",
  bible = "bibles/aldrassil_forever.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "gentle", "steady" }, values = { "nature", "honest" },
  notices = { "hunter", "druid" },

  impression = {
    first = "He has a soft voice and a very sharp knife.",
    third = "{name} met Terunne Bearshaper, the junior skinning trainer at Aldrassil.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. You take leather cleanly now. Come, I'll teach you something finer." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Care to learn properly? I'll teach, but I'll be watching how you treat the beasts." },
    { id = "g_default", text = "Care to learn how to take leather from the beasts you've slain? Or do you need new tools?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I hope your knife has been kind." },
  },

  notice = {
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} is watching my knife very carefully. Tell it I only skin what's already fallen." },
    { id = "n_druid", cat = "druid", when = { class = "DRUID", form = { "bear", "cat" } },
      text = "Please take your own shape before you browse my knives. It's an awkward thing to sell skinning tools to a bear." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Terunne Bearshaper, and I teach skinning here beneath Aldrassil. It's a quiet craft, but it asks more of you than a sharp knife." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter, so you'll be bringing me plenty of hides before long. I'll teach you to take them cleanly, and Ayanna will teach you to deserve them." },
      },
      again = {
        { id = "h_again", text = "Something else? I'll keep my knife still while you ask." },
        { id = "h_again2", text = "Ask, and I'll answer as best I can." },
        { id = "h_again3", text = "Go on. The knife can wait." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "I'd like to buy from you.", next = "BUSINESS" },
        { text = "What does skinning ask of me?", next = "ask" },
        { text = "Are you a druid, with a name like that?", next = "name" },
        { text = "What beasts should I start with?", next = "beasts" },
        { text = "What becomes of the hides?", next = "hides" },
        { text = "Does it trouble a druid to skin a beast?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What's your knife made of?", next = "w_knife" },
        { text = "Farewell, Terunne.", next = "END" },
      },
    },
    ask = {
      lines = {
        { id = "as_default", text = "That you skin only what you've killed for good reason, and that you waste nothing you take. A nightsaber gave its life on your blade, and the least you owe it is to use the whole of the gift." },
      },
      choices = {
        { text = "I'll honour every beast I skin.", next = "BACK", reply = "Then the beasts will forgive you, and so will I. Bring me your first nightsaber hide, and I will show you where you cut too deep.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide is a hide. I'll sell what I can.", next = "BACK", reply = "Then sell it, but waste none of it, or the forest will remember. A nightsaber gave its life for that hide.", fx = { align = { honor = -1 } } },
        { text = "What counts as good reason?", next = "ask_reason" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_reason = {
      lines = {
        { id = "ar_default", text = "Hunger, defence, or a beast gone wrong that would harm others if it lived. The mangy nightsabers in the glade are sick, and putting them down is a mercy, but a healthy saber is no prey for a bored hunter." },
      },
      choices = {
        { text = "How do you tell a sick beast from a healthy one?", next = "ask_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_sick = {
      lines = {
        { id = "ak_default", text = "The coat tells you first, dull and patchy, and then the eyes, which go flat and angry. The grells in the Fel Rock have done something to the glade, and the beasts that drink near there are the worst." },
      },
      choices = { { text = "I'll look for the signs. Something else.", next = "BACK", fx = { learn = { "fel_moss" } } } },
    },
    name = {
      lines = {
        { id = "na_default", text = "No, though everyone asks. My family's name is older than I am, and whoever earned it took the secret with them; I only have the knife and the patience." },
      },
      choices = {
        { text = "Did you never wish to be a druid?", next = "name_wish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_wish = {
      lines = {
        { id = "nw_default", text = "Once, when I was young and the druids were all asleep in the Dream. By the time they woke I'd found my own work, and I've never been sorry, though I do envy them the bear's shape on cold nights." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "emerald_dream" } } } },
    },
    beasts = {
      lines = {
        { id = "be_default", text = "The young nightsabers and the thistle boars here in the glade, and the webwood spiders if you can stand their legs. Their hides are thin, but every skinner starts with thin hides and a shaking hand." },
      },
      choices = {
        { text = "Spiders have hides?", next = "beasts_spider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_spider = {
      lines = {
        { id = "bs_default", text = "Of a sort, tough and leathery under the hair, though I'd not wear it next to my skin. The webwood in the Shadowthread Cave have grown fat and bold this year, and Ilthalaine wants them thinned, so you'll have plenty of practice." },
      },
      choices = {
        { text = "Why have they grown so bold?", next = "beasts_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_why = {
      lines = {
        { id = "bw_default", text = "Too much prey and not enough to hunt them, I think, since the sabers sickened. When one part of the forest falls ill, the rest grows lopsided around it, and someone has to set it right." },
      },
      choices = {
        { text = "Then I'll cull them. The glade comes first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the forest right itself. It's not our place.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hi_default", text = "Leatherworkers turn them into armor and packs and saddles, and they'll buy what you don't use. Most skinners learn leatherworking too, so nothing they take goes to waste." },
      },
      choices = {
        { text = "Who teaches leatherworking here?", next = "hides_lw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_lw = {
      lines = {
        { id = "hl_default", text = "Not here, I'm afraid; you'll want Darnassus for that, on the Craftsmen's Terrace. Salt your hides before you go, or you'll arrive smelling of them and nobody will want to teach you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Some of them say it does, and then I see them in good boots, so I've stopped asking. You'll wear a beast's shape and a beast's hide both, and only you can decide how that sits with you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    w_knife = {
      lines = {
        { id = "w_knife_default", text = "A blade of dark steel, from Auberdine, set in a handle of nightsaber bone that my grandfather carved. The steel has been replaced four times since, but the handle is the same, and I think of it as the same knife." },
      },
      choices = {
        { text = "Is it the same knife, then?", next = "w_knife2" },
        { text = "Four blades in one handle.", next = "w_knife2" },
      },
    },
    w_knife2 = {
      lines = {
        { id = "w_knife2_default", text = "The druids say a forest is the same forest though every tree in it has fallen and grown again, so I suppose they would say yes. My grandfather would have said that a knife is whatever your hand remembers, and my hand remembers this one." },
      },
      choices = {
        { text = "Your hand knows best.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Terunne.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Salt your hides before they spoil, and keep your knife clean. Both are kinder than they sound." } },
    fel_moss = { { id = "tp_fel_moss", text = "The grells carry it out of the Fel Rock, and the beasts that eat near it go wrong. I can see it in their coats." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. Ask someone who spends less time with hides." } },
  },
}
