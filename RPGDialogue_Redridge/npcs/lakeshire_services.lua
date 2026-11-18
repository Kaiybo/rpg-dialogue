-- Lakeshire's services: Penny (stable master), Lindsay Ashlock (general supplies, Guard Ashlock's kin),
-- Crystal Boughman (cooking trainer) and Wilma Ranthal (skinning trainer, out in Shalewind Canyon).
-- Voice: bibles/lakeshire_services.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Penny
---------------------------------------------------------------------------
P:NPC {
  key = "penny", id = TODO_NPC("Penny"), name = "Penny",
  title = "Stable Master",
  bible = "bibles/lakeshire_services.md", role = "stablemaster", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk", "kind" }, values = { "practical", "kindness" },
  notices = { "pet" },

  impression = {
    first = "Penny keeps Lakeshire's stables and talks about the broken bridge the way everyone in town does, as a personal insult. She's brisk with people and soft with animals.",
    third = "{name} met Penny, the stable master of Lakeshire.",
  },

  greetings = {
    { id = "g_default", text = "Wipe your boots, love, the straw's fresh. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Your beasts have been good as gold, mostly." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Oh, and who's this? {pet}, is it? Aren't you a handsome one." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s looking a bit thin, love. The Redridge hills are hard going; feed it up before you head out again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Penny, and I keep the stables, which in Lakeshire means horses, hunters' beasts and the occasional goat that wandered in from the hills. I'll look after anything with four legs and a temper." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good. Do you need me to keep someone, or swap one out? I've room, now that the caravans have stopped coming." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've hay to fork." },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why have the caravans stopped?", next = "caravans" },
        { text = "How do the animals fare, with the orcs so near?", next = "orcs" },
        { text = "Goodbye, Penny.", next = "END" },
      },
    },

    caravans = {
      lines = { { id = "ca_default", text = "The bridge, love, the bridge. With it half-built, the wagons from Stormwind have to go the long way round, and most of them don't bother, so my stalls are emptier than they've been in years." } },
      choices = {
        { text = "Who's fixing the bridge?", next = "ca_bridge", fx = { learn = { "everstill_bridge" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ca_bridge = {
      lines = { { id = "cab_default", text = "Foreman Oslow and his crew, when they're not chasing their own tools, and the magistrate's promised it'll be done by spring. He promised that last spring too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    orcs = {
      big = true,
      lines = { { id = "or_default", text = "The horses can smell the Blackrock on the wind, and they kick their stalls at night. I sing to them, and I keep a pitchfork by the door, and between the two we get by." } },
      choices = {
        { text = "The orcs should be driven out of Redridge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The orcs are here to stay. Learn to live with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, hay and the bridge, love. That's Lakeshire." } },
    background = { { id = "tp_bg", text = "My father kept these stables before me, and his father before him." } },
    advice = { { id = "tp_ad", text = "Don't ride a horse up the hills in the dark, love. The gnolls set traps." } },
    everstill_bridge = { { id = "tp_bridge", text = "Half a bridge is no bridge at all, as my stalls will tell you." } },
    _none = { { id = "tp_none", text = "No idea, love. Ask someone without hay in their hair." } },
  },
}

---------------------------------------------------------------------------
-- Lindsay Ashlock
---------------------------------------------------------------------------
P:NPC {
  key = "lindsay_ashlock", id = TODO_NPC("Lindsay Ashlock"), name = "Lindsay Ashlock",
  title = "General Supplies",
  bible = "bibles/lakeshire_services.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "warm", "worried" }, values = { "family", "practical" },
  notices = { "kit" },

  impression = {
    first = "Lindsay Ashlock sells general supplies in Lakeshire and keeps one eye on the bridge, where Guard Ashlock stands his watch. She worries about him out loud and sells you flint and thread while she does it.",
    third = "{name} met Lindsay Ashlock, who sells general supplies in Lakeshire and worries about Guard Ashlock on the bridge.",
  },

  greetings = {
    { id = "g_default", text = "Hello, dear! Thread, flint, a little something for the road? Have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you pass the bridge? Was my Ashlock still standing up straight?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, dear, your things are falling to pieces. I can't mend armor, but I can sell you thread, and that's a start." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Lindsay Ashlock, and I keep Lakeshire in thread, flint, salt and all the little things nobody thinks about until they've run out. My husband's the guard on the bridge, so if he looks cold, tell him I said to put his scarf on." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "You're out late, dear. I'll stay open a little longer; Ashlock's on the night watch anyway, and I don't sleep until he's home." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Ask away, I'm just restocking." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Tell me about your husband.", next = "husband" },
        { text = "What sells best in Lakeshire?", next = "sells" },
        { text = "Goodbye, Lindsay.", next = "END" },
      },
    },

    husband = {
      big = true,
      lines = { { id = "hu_default", text = "He's a good man, steady as a post, and he stands on that bridge between the town and the gryphons all day, rain or shine. I tell him he should ask for a post inside the walls, but he says somebody has to stand there, so it might as well be him." } },
      choices = {
        { text = "He's right. Someone has to stand there.", next = "hu_more", fx = { align = { honor = 1 } } },
        { text = "He should look after himself first.", next = "hu_more", fx = { align = { honor = -1 } } },
        { text = "Is he in danger?", next = "hu_more" },
      },
    },
    hu_more = {
      lines = { { id = "hum_default", text = "Everyone in Redridge is in danger, dear, it's just a question of how much. I pack him a lunch every morning and kiss him at the door, and I don't watch him walk away, because if I did I'd never let him go." } },
      choices = {
        { text = "I'll keep an eye on him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sells = {
      lines = { { id = "se_default", text = "Bandage thread and lamp oil, these days, more than anything. Folk patch each other up and keep the lights burning, and that tells you everything about how things are going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, and who in town is running low on them." } },
    background = { { id = "tp_bg", text = "I'm a Lakeshire girl who married a guard and opened a shop, and that's all." } },
    advice = { { id = "tp_ad", text = "Always carry spare flint. Fire's the best friend you have out there." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, dear." } },
  },
}

---------------------------------------------------------------------------
-- Crystal Boughman
---------------------------------------------------------------------------
P:NPC {
  key = "crystal_boughman", id = TODO_NPC("Crystal Boughman"), name = "Crystal Boughman",
  title = "Cooking Trainer",
  bible = "bibles/lakeshire_services.md", role = "trainer", tier = "service",
  communities = { "lakeshire" }, temper = { "cheerful", "bossy" }, values = { "craft", "community" },
  notices = { "craft" },

  impression = {
    first = "Crystal Boughman teaches cooking in Lakeshire and believes there's no trouble a good meal can't make smaller. She's a little bossy about it, and she's usually right.",
    third = "{name} met Crystal Boughman, the cooking trainer of Lakeshire.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in! Mind the pot, and don't touch the spice jar, it's my mother's." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more lessons? Good, you've a cook's patience, I can see it." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "Cooking is a lifelong pursuit, and I see we share the same passion! Your hands smell of onions, which is the best compliment I can give." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Crystal Boughman, and I teach cooking to anyone who'll stand still long enough to learn. When you've learned all I know, Dirge Quikcleave in Gadgetzan is the master of the culinary arts, though you'll want a strong stomach for his kitchen." },
        { id = "h_cook", when = { profession = "Cooking" },
          text = "A cook! Come here, let me see your knife. Oh, that's dull as a sermon, we'll fix that before you cut anything else." },
      },
      again = {
        { id = "h_again", text = "What else? The stew needs stirring, but I can do two things at once." },
        { id = "h_again2", text = "Ask away, love." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS", when = { profession = "Cooking" } },
        { text = "What's the best dish in Lakeshire?", next = "dish" },
        { text = "Who is Dirge Quikcleave?", next = "dirge" },
        { text = "Goodbye, Crystal.", next = "END" },
      },
    },

    dish = {
      lines = { { id = "di_default", text = "Redridge goulash, and Breanna up at the inn makes it better than I do, though I'll deny I ever said so. Condor meat, goretusk and crocolisk, slow-cooked until the toughest grunt would beg for a second bowl." } },
      choices = {
        { text = "Do you and Breanna compete?", next = "di_comp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    di_comp = {
      big = true,
      lines = { { id = "dic_default", text = "Every harvest fair, and she wins every time, because she cooks for soldiers and I cook for my mother. She keeps her recipe secret, too, and I can't decide whether a cook ought to share hers or keep it." } },
      choices = {
        { text = "Share your recipes. Everyone eats better.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your secrets. They're your living.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dirge = {
      lines = { { id = "dr_default", text = "A goblin in Gadgetzan who cooks things I wouldn't feed to a gnoll, and they're delicious, which is the annoying part. If you want to master cooking, you'll need to seek him out someday." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Cooking, love. Everything else is just ingredients." } },
    background = { { id = "tp_bg", text = "Lakeshire born, raised in my mother's kitchen, and never left it." } },
    advice = { { id = "tp_ad", text = "Taste as you go. A cook who doesn't taste is just a person with a pot." } },
    _none = { { id = "tp_none", text = "Can't eat it, can't teach it, love." } },
  },
}

---------------------------------------------------------------------------
-- Wilma Ranthal
---------------------------------------------------------------------------
P:NPC {
  key = "wilma_ranthal", id = TODO_NPC("Wilma Ranthal"), name = "Wilma Ranthal",
  title = "Skinning Trainer",
  bible = "bibles/lakeshire_services.md", role = "trainer", tier = "service",
  communities = {}, temper = { "blunt", "solitary" }, values = { "craft", "independence" },
  notices = { "craft", "pet" },

  impression = {
    first = "Wilma Ranthal teaches skinning from a camp out in Shalewind Canyon, far from Lakeshire's walls. She's blunt, she smells of hides, and she likes it out here because nobody comes to bother her.",
    third = "{name} met Wilma Ranthal, the skinning trainer who lives out in Shalewind Canyon in eastern Redridge.",
  },

  greetings = {
    { id = "g_default", text = "Long walk out here for a chat. You want to learn to skin, or are you lost?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Must be serious about skinning, coming all this way twice." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Your knife's notched. You've been hitting bone, which means you're cutting too deep. I'll show you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wilma Ranthal. I skin what the hills give me and teach anybody who walks out this far. Not many do, which suits me." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Good. You'll have plenty of hides to practise on, and you'll know not to waste them." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Ask. I'm listening while I scrape." },
      },
      choices = {
        { text = "Train me in skinning.", next = "BUSINESS", when = { profession = "Skinning" } },
        { text = "Why live all the way out here?", next = "why" },
        { text = "Is it safe, with the orcs so close?", next = "safe" },
        { text = "Goodbye, Wilma.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because skinning stinks, and Lakeshire folk complain. Out here the only ones who complain are the vultures, and they're too busy waiting for leftovers." } },
      choices = {
        { text = "Don't you get lonely?", next = "wh_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_lonely = {
      lines = { { id = "whl_default", text = "My kinsman Clyde, who works leather in town, walks out now and then, when he can find the path. That's company enough for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    safe = {
      big = true,
      lines = { { id = "sa_default", text = "Safe as anywhere in Redridge, which isn't very. The Blackrock leave me alone because I've nothing they want, and the gnolls leave me alone because I've skinned a few of their dogs." } },
      choices = {
        { text = "You should come back to town, where it's safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. Don't let anyone drive you off your land.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hides, knives, and this canyon." } },
    background = { { id = "tp_bg", text = "Grew up in Lakeshire, moved out here to get away from it." } },
    advice = { { id = "tp_ad", text = "Sharp knife, light hand. A torn hide's worth nothing." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care." } },
  },
}
