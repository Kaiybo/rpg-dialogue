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
        { text = "What's the strangest beast you've ever stabled?", next = "strange" },
        { text = "You've got a goat eating your hat, Penny.", next = "goat" },
        { text = "Would you stable a ram from Dun Morogh?", next = "ram", when = { race = { "Dwarf", "Gnome" } } },
        { text = "My warhorse needs a good brushing. Can you help?", next = "warhorse", when = { class = "PALADIN", minLevel = 40 } },
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
      choices = {
        { text = "Why is it taking so long?", next = "ca_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ca_slow = {
      lines = { { id = "cas_default", text = "Half the timber comes from Elwynn and the other half gets stolen, and the crew down tools whenever an orc scout shows his face on the far bank. Oslow swears at them and they swear at him, and the bridge sits there waiting for them all to make up." } },
      choices = {
        { text = "Those workers should be braver.", next = "BACK", fx = { align = { honor = 1 } },
          reply = "Easy to say from this side of the water, love, but I'll pass it on." },
        { text = "I'd down tools too. No wage is worth an orc arrow.", next = "BACK", fx = { align = { honor = -1 } },
          reply = "That's what they tell Oslow, word for word. You'd fit right in." },
        { text = "Something else.", next = "BACK" },
      },
    },

    orcs = {
      big = true,
      lines = { { id = "or_default", text = "The horses can smell the Blackrock on the wind, and they kick their stalls at night. I sing to them, and I keep a pitchfork by the door, and between the two we get by." } },
      choices = {
        { text = "The orcs should be driven out of Redridge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The orcs are here to stay. Learn to live with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do you sing to them?", next = "or_song" },
        { text = "Something else.", next = "BACK" },
      },
    },
    or_song = {
      lines = { { id = "ors_default", text = "Old Lakeshire lullabies my grandmother sang over the cradle, mostly about the lake and the fish and boys who go off to war and come home again. The horses don't care for the words, but they like the tune, and so do I, on the bad nights." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    strange = {
      lines = { { id = "st_default", text = "A hunter once left me a great black spider from the Redridge hills, and I fed that thing on beef for a week and never once turned my back on it. When he came back for it, it was so fat it could barely walk, and I like to think it missed me." } },
      choices = {
        { text = "Do hunters ever leave their beasts and not come back?", next = "st_left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_left = {
      lines = { { id = "stl_default", text = "More than you'd think, love, in a place like Redridge. I keep them as long as I can and find them homes when I can't, and there's a boar out at the Jainrose place that used to belong to a very brave woman." } },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    goat = {
      lines = { { id = "go_default", text = "Oh, Bramble, not again! She wandered down from the hills last autumn and decided she lived here, and she's eaten two hats, a saddle blanket and the Magistrate's notice about the curfew. Some days I think she's the wisest of us all." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    ram = {
      lines = { { id = "ra_default", text = "A ram? I'd try, love, but my horses would have something to say about it, and so would the ram. Bring it round and I'll give it the end stall, well away from the mares." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    warhorse = {
      lines = { { id = "wa_default", text = "A paladin's charger, here in my stables? Oh, I'd be honored. I'll brush him down myself and give him the good oats, and I'll not let the goat near him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, hay and the bridge, love. That's Lakeshire." } },
    background = { { id = "tp_bg", text = "My father kept these stables before me, and his father before him." } },
    advice = { { id = "tp_ad", text = "Don't ride a horse up the hills in the dark, love. The gnolls set traps." } },
    everstill_bridge = { { id = "tp_bridge", text = "Half a bridge is no bridge at all, as my stalls will tell you." } },
    blackrock = { { id = "tp_blackrock", text = "The horses smell them on the wind and kick their stalls all night." } },
    oslow = { { id = "tp_oslow", text = "He swears at his crew and they swear at him, and the bridge waits." } },
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
        { text = "How does a shop keep stocked with the bridge out?", next = "stock" },
        { text = "You keep looking out the window at the bridge.", next = "window" },
        { text = "Do you carry any reagents for spellwork?", next = "reagents", when = { class = { "MAGE", "WARLOCK", "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "I'm a long way from home, Lindsay.", next = "far", when = { race = { "NightElf", "Gnome", "Dwarf" } } },
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
      choices = {
        { text = "Who buys the most bandage thread?", next = "se_thread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    se_thread = {
      lines = { { id = "set_default", text = "The Marshal's men, by the armful, and the folk who come back from the Render's Valley road with arrows in them. I've started cutting it to length for them in the evenings, so they've one less thing to do when they're bleeding." } },
      choices = {
        { text = "Has it gotten worse lately?", next = "se_worse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    se_worse = {
      lines = { { id = "sew_default", text = "Since the Blackrock dug in at Stonewatch Keep, yes, much worse. Marshal Marris says they've a proper warlord over there now, and whoever he is, he's keeping my thread selling faster than I can order it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    stock = {
      lines = { { id = "st_default", text = "Carefully, dear, and expensively. The Stormwind wagons won't come the long way round, so the gryphon master brings the little things by air and the rest comes by boat across the lake, when the murlocs let it." } },
      choices = {
        { text = "Then charge more. You've earned it.", next = "BACK", fx = { align = { light = -1 } },
          reply = "And have my neighbours go without? No, dear, I'll make it up some other way." },
        { text = "Keep your prices fair. The town's suffering enough.", next = "BACK", fx = { align = { light = 1 } },
          reply = "That's what I tell myself every time I count the till. Thank you, dear." },
        { text = "Something else.", next = "BACK" },
      },
    },

    window = {
      lines = { { id = "wi_default", text = "Do I? I suppose I do. From here I can just see the end of the bridge, and if I see the red of his tabard I know he's standing, and that's enough to get me through the afternoon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    reagents = {
      lines = { { id = "re_default", text = "A few, dear, though Lakeshire's not Stormwind, and I can't promise I'll have what your sort needs. Have a look, and if I haven't got it, Ariena might bring it on the next gryphon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    far = {
      lines = { { id = "fa_default", text = "You are, and it's good of you to come so far to help folk you've never met. Take some salt and a spare flint with you, because the hills aren't kind to strangers, and I'd hate to think of you cold." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Supplies, and who in town is running low on them." } },
    background = { { id = "tp_bg", text = "Lakeshire girl, married a guard, and opened a shop. That's all." } },
    advice = { { id = "tp_ad", text = "Always carry spare flint. Fire's the best friend you have out there." } },
    blackrock = { { id = "tp_blackrock", text = "Since they dug in at Stonewatch, my bandage thread sells faster than I can order it." } },
    guard_ashlock = { { id = "tp_ashlock", text = "My husband, dear, on the bridge. If he looks cold, tell him to put his scarf on." } },
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
        { text = "What's so special about your mother's spice jar?", next = "jar" },
        { text = "Who do you cook for, with the town half at war?", next = "war" },
        { text = "Dwarves cook with ale. Ever tried it?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I've got more meat than I know what to do with.", next = "hunter", when = { class = "HUNTER" } },
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
      lines = { { id = "dic_default", text = "Every harvest fair, and she wins every time, because she cooks for soldiers and I cook for my mother. Some say a cook should share every secret, and some say a secret recipe is all a cook has." } },
      choices = {
        { text = "Share your recipes. Everyone eats better.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your secrets. They're your living.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dirge = {
      lines = { { id = "dr_default", text = "A goblin in Gadgetzan who cooks things I wouldn't feed to a gnoll, and they're delicious, which is the annoying part. If you want to master cooking, you'll need to seek him out someday." } },
      choices = {
        { text = "Have you ever been to Gadgetzan?", next = "dr_been" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dr_been = {
      lines = { { id = "drb_default", text = "Once, as a girl, on a ship out of Booty Bay and then across more sand than I ever want to see again. Dirge served me a sandworm stew, and I've been trying to work out what he put in it for twenty years." } },
      choices = {
        { text = "Did you ever ask him?", next = "dr_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dr_ask = {
      lines = { { id = "dra_default", text = "I did, love, and he charged me for the answer, and then the answer was a lie, and then he charged me for the truth. Goblins, honestly, though I'll admit the truth was worth the money." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } } },
    },

    jar = {
      lines = { { id = "ja_default", text = "Ground pepper, dried thyme and something else my mother never told anyone, not even me. When she passed I found it on the shelf, half full, and I've been rationing it by the pinch ever since." } },
      choices = {
        { text = "What happens when it runs out?", next = "ja_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ja_out = {
      lines = { { id = "jao_default", text = "Then I'll finally have to work it out myself, I suppose, or admit I can't. I've got it down to pepper, thyme and either lake salt or a ground river shell, and I lie awake some nights choosing between them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    war = {
      lines = { { id = "wa_default", text = "Everyone, love. The guards on the bridge get a hot pie when I can manage it, and the families of the lads Corporal Keeshan took into the hills get a pot of stew left on the doorstep. Nobody fights well hungry, and nobody grieves well hungry either." } },
      choices = {
        { text = "You can't feed the whole town alone.", next = "BACK", fx = { trait = { practical = 1 } },
          reply = "No, but I can feed the bit of it that's in front of me, and that's what my mother did." },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarf = {
      lines = { { id = "dw_default", text = "Ale in the stew? Oh, I have, and it's lovely with goretusk, though I'll warn you Lakeshire ale is thinner than what you're used to. Bring me a bottle of Thunder Ale from the mountain sometime, and I'll show you what I can do with it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    hunter = {
      lines = { { id = "hu_default", text = "Then you're my favourite sort of customer! Condor's tough, so stew it long, and goretusk wants a hot fire and a little salt. Crocolisk you'll want to ask Breanna about, because hers comes out tender and mine comes out like a boot." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Cooking, love. Everything else is just ingredients." } },
    background = { { id = "tp_bg", text = "Lakeshire born, raised in my mother's kitchen, and never left it." } },
    advice = { { id = "tp_ad", text = "Taste as you go. A cook who doesn't taste is just a person with a pot." } },
    breanna = { { id = "tp_breanna", text = "She makes the better goulash, though I'll deny I ever said so." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Sand, goblins and Dirge's sandworm stew. I'm still working out that stew." } },
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
        { text = "What do the hills give you?", next = "hides" },
        { text = "Those are worg pelts on your rack.", next = "worg" },
        { text = "My people thank the beast before we skin it.", next = "thanks", when = { race = { "NightElf", "Tauren" } } },
        { text = "I don't like seeing beasts skinned.", next = "druid", when = { class = "DRUID" } },
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
      lines = { { id = "whl_default", text = "My kinsman Clyde walks out now and then, when he can find the path. That's company enough for me." } },
      choices = {
        { text = "What does Clyde do?", next = "wh_clyde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_clyde = {
      lines = { { id = "whc_default", text = "Works leather, which is the polite end of my trade. I take the hide off and he makes it into something folk will pay for, and we both pretend the other one's got the easier job." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hides = {
      lines = { { id = "hi_default", text = "Goretusk, mostly, and condor if you can get one down without ruining the feathers. Tarantula's no use for leather, but the gnolls' dogs have hides tough enough for a boot." } },
      choices = {
        { text = "Where's the best hunting?", next = "hi_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hi_where = {
      lines = { { id = "hiw_default", text = "The slopes east of the lake for goretusk, and Render's Valley for anything bigger, if you don't mind orcs watching you skin it. I keep to the canyon, and the canyon keeps me fed." } },
      choices = {
        { text = "Why not go into Render's Valley yourself?", next = "hi_render" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hi_render = {
      lines = { { id = "hir_default", text = "Because I went once and came back with an arrow in my pack and my best knife left behind. The Blackrock camp down there is thick with orcs and their wolves, and no hide's worth that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    worg = {
      lines = { { id = "wo_default", text = "Good eye. The Blackrock ride them and sometimes the beasts stray, and a stray worg near my camp doesn't stray again. Thick fur, tough hide, smells worse than I do." } },
      choices = {
        { text = "Killing their beasts. Good. Hurt them any way you can.", next = "BACK", fx = { align = { light = -1 } },
          reply = "I don't do it to hurt anybody. I do it so it doesn't eat me." },
        { text = "The beast didn't choose its master. Spare the strays.", next = "BACK", fx = { align = { light = 1 } },
          reply = "You can spare the next one, then, when it's got its teeth in your leg." },
        { text = "Something else.", next = "BACK" },
      },
    },

    thanks = {
      lines = { { id = "th_default", text = "Do they? Well, I say something too, though it's mostly 'hold still'. I waste nothing, and I figure that's thanks enough for a goretusk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    druid = {
      lines = { { id = "dr_default", text = "Then don't watch. Beasts die out here whether I skin them or not, and I'd rather the hide went on someone's back than rotted for the vultures." } },
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
    blackrock = { { id = "tp_blackrock", text = "They ride worgs and shoot at skinners. I keep to my canyon." } },
    clyde = { { id = "tp_clyde", text = "My kinsman. Works leather, the polite end of my trade." } },
    _none = { { id = "tp_none", text = "Don't know. Don't care, much." } },
  },
}
