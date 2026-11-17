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
    first = "Sylassa Moonglow waits at the foot of Aldrassil to explain the crafts to anyone newly woken, and she does it as if nobody had ever asked her before. She seemed glad when I asked her a question.",
    third = "{name} met Sylassa Moonglow, who guides Shadowglen's newcomers toward the crafts and their trainers.",
  },

  greetings = {
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
        { text = "Mastery takes focus. You're right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather learn a little of everything.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I want whatever pays best.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I want whatever helps others most.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = {
        { id = "xd_default", text = "Herbalism, most druids say, for you'll be walking among the plants anyway and you can pick them without leaving your shape. Some druids take up leatherworking too, though I've noticed they're very quiet about where the leather comes from." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
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
    first = "Eleyna Duskbreeze teaches herbalism under Aldrassil and talks about Teldrassil's plants as if they were her friends' children. She asked me to pick gently and seemed to mean it.",
    third = "{name} met Eleyna Duskbreeze, the junior herbalism trainer at Aldrassil.",
  },

  greetings = {
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
      },
      again = {
        { id = "h_again", text = "Anything else? I could talk about plants all night, and often do." },
        { id = "h_again2", text = "What else would you like to know?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Where do the herbs grow?", next = "where" },
        { text = "Does picking harm the tree?", next = "harm" },
        { text = "What do I do with herbs once I have them?", next = "use" },
        { text = "Farewell, Eleyna.", next = "END" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Peacebloom and silverleaf grow almost everywhere in the glade, and earthroot likes the shade at the roots of the old trees. Further out, past Dolanaar, the plants get rarer and the wildlife gets crosser, so go carefully." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    harm = {
      lines = {
        { id = "ha_default", text = "Not if you take only what you need and leave the roots, which is what I'll teach you. Teldrassil is young, and everything on it is still learning how to grow, so we must be gentle with it." },
      },
      choices = {
        { text = "Then I'll pick only what I need.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants grow back. I'll take what I find.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      lines = {
        { id = "us_default", text = "Alchemists will make potions of them, and they'll pay you for the trouble if you'd rather not learn alchemy yourself. Many herbalists learn both, and it's a pleasant pairing, rather like moonlight and water." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Leave the roots. Always leave the roots, and the plant will be there for the next one who needs it." } },
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
    first = "Fanorran Stilloak teaches mining at the foot of a tree, and he knows exactly how strange that is. He is quiet, dry and patient, and he sells picks to people who will need to cross the sea to use them.",
    third = "{name} met Fanorran Stilloak, the junior mining trainer at Aldrassil.",
  },

  greetings = {
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
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What more can I tell you?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "I'd like to buy from you.", next = "BUSINESS" },
        { text = "Is there any ore on Teldrassil?", next = "ore" },
        { text = "Why would a kaldorei take up mining?", next = "why" },
        { text = "Farewell.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "or_default", text = "Very little; the tree is wood all the way down, as far as anyone has dug, and nobody digs far. Cross to Darkshore and the hills there will give you copper, and that's where your real lessons begin." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because a Sentinel's glaive is made of metal, and someone has to find the metal. Many of my people think digging into the earth is a wound, and I understand them, but I think a careful wound can be a kind of respect." },
      },
      choices = {
        { text = "The earth's gifts are there to be used.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then we should take as little as we can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Carry your pick and a smith's hammer both, for you'll want to work what you dig before you carry it far." } },
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
    first = "Terunne Bearshaper teaches skinning at Aldrassil with a soft voice and a very sharp knife. He talks about the beasts with more respect than most people show each other.",
    third = "{name} met Terunne Bearshaper, the junior skinning trainer at Aldrassil.",
  },

  greetings = {
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
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Ask, and I'll answer as best I can." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "I'd like to buy from you.", next = "BUSINESS" },
        { text = "What does skinning ask of me?", next = "ask" },
        { text = "Are you a druid, with a name like that?", next = "name" },
        { text = "Farewell, Terunne.", next = "END" },
      },
    },
    ask = {
      lines = {
        { id = "as_default", text = "That you skin only what you've killed for good reason, and that you waste nothing you take. A nightsaber gave its life on your blade, and the least you owe it is to use the whole of the gift." },
      },
      choices = {
        { text = "I'll honour every beast I skin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide is a hide. I'll sell what I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "No, though everyone asks. My family's name is older than I am, and whoever earned it took the secret with them; I only have the knife and the patience." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Salt your hides before they spoil, and keep your knife clean. Both are kinder than they sound." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. Ask someone who spends less time with hides." } },
  },
}
