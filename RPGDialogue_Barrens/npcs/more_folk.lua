-- More of the Barrens: Kelm Hargunth (the Warsong Outriders' supply officer by the road to Warsong Gulch),
-- and three Crossroads traders: Halija Whitestrider (clothier), Kalyimah Stormcloud (bags) and
-- Larhka (drink). Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kelm Hargunth: Warsong Supply Officer; care packages for marks of honor.
---------------------------------------------------------------------------
P:NPC {
  key = "kelm", id = TODO_NPC("Kelm Hargunth"), name = "Kelm Hargunth", title = "Warsong Supply Officer",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  temper = { "gruff", "proud" }, values = { "loyal", "dutiful" },
  notices = { "class", "race", "reputation" },
  impression = {
    first = "Kelm Hargunth supplies the Warsong Outriders from his post in the northern Barrens, on the road toward Warsong Gulch. He's a Warsong orc down to his boots, and he measures everyone by what they've done against the night elves.",
    third = "{name} met Kelm Hargunth, the Warsong Outriders' supply officer in the northern Barrens.",
  },
  greetings = {
    { id = "g_default", text = "Warsong supplies, for those who've fought for them. If you haven't been to the gulch yet, you've nothing to trade me." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the gulch? Show me what you've brought, then." },
    { id = "g_honored", when = { reputation = { faction = "Warsong Outriders", min = "honored" } }, text = "The Outriders know your name, and so do I. Come, the clan looks after its own." },
    { id = "g_care", when = { questActive = TODO_QUEST("Outrider Basic Care Package") }, text = "You've got the marks, or you're close to it. Bring them and the package is yours, packed by Warsong hands." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, and you've got the look of someone who'd fight for Grom's clan. The Warsong could use you." },
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Warsong Outriders", min = "exalted" } },
      text = "Every Outrider in the gulch tells stories about you. Grom would have been proud to have you in his warband." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kelm Hargunth, supply officer to the Warsong Outriders. Bring me the marks you earn in Warsong Gulch, and I'll send you back out with the supplies to earn more." },
        { id = "h_basic_done", when = { questDone = TODO_QUEST("Outrider Basic Care Package") },
          text = "You took the first package and came back for more, which tells me you're the kind we need. The night elves won't hold that gulch forever." },
        { id = "h_adv_done", when = { questDone = TODO_QUEST("Outrider Advanced Care Package") },
          text = "The advanced packages go only to the ones who keep coming back from the gulch, and you keep coming back. The Warsong remember that." },
      },
      again = {
        { id = "h_again", text = "What else, soldier?" },
        { id = "h_again2", text = "Speak up, the supply wagons don't load themselves." },
      },
      choices = {
        { text = "What's in these care packages?", next = "packages" },
        { text = "Why fight over Warsong Gulch?", next = "gulch" },
        { text = "Tell me about the Warsong clan.", next = "clan" },
        { text = "Show me what the Outriders offer.", next = "BUSINESS", when = { reputation = { faction = "Warsong Outriders", min = "friendly" } } },
        { text = "I'll go earn some marks.", next = "END" },
      },
    },
    packages = {
      lines = { { id = "pa_default", text = "Food, bandages and whatever else a soldier needs in the gulch, packed by the clan for those who've proven themselves. The more marks you bring, the better the package, because the Warsong reward deeds, not words." } },
      choices = {
        { text = "What sort of marks?", next = "packages2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    packages2 = {
      lines = { { id = "pa2_default", text = "Marks of honor from Warsong Gulch, earned every time you fight there, more for winning and fewer for losing. Bring me enough and I'll know you've bled for the Horde, which is what I need to know." } },
      choices = { { text = "Something else, Kelm.", next = "BACK" } },
    },
    gulch = {
      lines = { { id = "gu_default", text = "Because it's ours, by right of blood. The Warsong have cut timber in Ashenvale since Grom's day, and the night elves' Silverwing Sentinels want us out, so they've drawn a line at the gulch, and we fight over every inch of it." } },
      choices = {
        { text = "The night elves say the forest is theirs.", next = "gulch2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    gulch2 = {
      big = true,
      lines = { { id = "gu2_default", text = "They would say that, and maybe it was, once. But Grom killed the demon who cursed us in that forest, and paid for it with his life, and a Warsong orc doesn't leave land his chieftain died to win." } },
      choices = {
        { text = "Grom's sacrifice earned that land. We hold it.", next = "BACK", reply = "That's the spirit of the clan. Go to the gulch and prove it.", fx = { align = { honor = 1 } } },
        { text = "We need the timber. That's reason enough.", next = "BACK", reply = "Practical, and true. Orgrimmar doesn't build itself out of sand.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan = {
      lines = { { id = "cl_default", text = "The Warsong were Grom Hellscream's clan, the fiercest in the old Horde and the last to give up the demon blood. When Grom broke the curse, he freed us all, and the Warsong honor that by fighting harder than anyone else." } },
      choices = {
        { text = "The demon blood?", next = "clan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan2 = {
      lines = { { id = "cl2_default", text = "Mannoroth's blood, which our chieftains drank before the First War, and it bound us to the demons for a generation. Grom drank it twice, and then he killed Mannoroth himself, so you'll understand why the Warsong don't take kindly to anyone who speaks ill of him." } },
      choices = { { text = "Something else, Kelm.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "Thrall freed us from the camps, and Grom freed us from the blood. The Warsong owe them both." } },
    _none = { { id = "tp_none", text = "That's no business of the Warsong." } },
  },
}

---------------------------------------------------------------------------
-- Halija Whitestrider: tauren clothier at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "halija", id = TODO_NPC("Halija Whitestrider"), name = "Halija Whitestrider", title = "Clothier",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "gentle" }, values = { "craft", "kind" },
  notices = { "class", "kit" },
  impression = {
    first = "Halija Whitestrider sells cloth armor at the Crossroads, a gentle tauren who seems to think every traveler on the road needs something warmer. Her stall smells of wool and Mulgore grass.",
    third = "{name} met Halija Whitestrider, the tauren clothier at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Peace, traveler. The Barrens nights are colder than they seem, so let me find you something warm." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and your cloak has seen some road since. Let me look at it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of Mulgore, so far from home. The grass here is not as sweet, is it?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Halija Whitestrider, and I sell cloth to those who walk the Barrens. Robes and wraps and gloves, all woven with care, because the road is long and the wind is unkind." },
      },
      again = {
        { id = "h_again", text = "What else, traveler?" },
        { id = "h_again2", text = "Ask, I'm in no hurry." },
      },
      choices = {
        { text = "Let me see your cloth.", next = "BUSINESS" },
        { text = "Why did you leave Mulgore?", next = "mulgore" },
        { text = "What do the Crossroads need most?", next = "needs" },
        { text = "Earth Mother keep you, Halija.", next = "END" },
      },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "Because the Crossroads needed a clothier more than Thunder Bluff did, and the Earth Mother sends us where we're needed. I miss the high grass and the rain, but here I see more faces in a day than I'd see in a season at home." } },
      choices = {
        { text = "Do you like the orcs?", next = "mulgore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mulgore2 = {
      big = true,
      lines = { { id = "mu2_default", text = "They are loud and rough, and their clothing is a disgrace, but they are honest, and they fight for the tauren as if we were their own. Cairne trusts them, and I trust Cairne." } },
      choices = {
        { text = "The orcs and tauren are stronger together.", next = "BACK", reply = "So they are, and so I hope we stay. Walk with the Earth Mother.", fx = { align = { order = 1 } } },
        { text = "The tauren lived well before the orcs came.", next = "BACK", reply = "We lived, yes, and hid from the centaur. I'll take loud friends over quiet enemies.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "ne_default", text = "Water, first, and peace with the centaur, which we won't get, and after that good cloth and good food. Moorane bakes the bread, Wrahk sells the thread, and I sew it into something a body can wear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "centaur" } } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm only a clothier, traveler. Ask someone wiser." } },
  },
}

---------------------------------------------------------------------------
-- Kalyimah Stormcloud: troll bag-seller at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "kalyimah", id = TODO_NPC("Kalyimah Stormcloud"), name = "Kalyimah Stormcloud", title = "Bags & Sacks",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "chatty" }, values = { "practical", "trade" },
  notices = { "kit", "race" },
  impression = {
    first = "Kalyimah Stormcloud sells bags and sacks at the Crossroads, a chatty Darkspear troll who seems to know everything that passes through town. Every traveler needs a bag, and he knows it.",
    third = "{name} met Kalyimah Stormcloud, the troll who sells bags at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Bags, mon, bags and sacks! You never got enough room for all your loot, trust me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Your bags be full already, I bet." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, out here on de dusty road! How be Sen'jin, mon? Still smellin' of fish?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Kalyimah Stormcloud, and I sell bags to everybody who comes through de Crossroads. Dat be everybody, so business be very good, mon." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask, ask, I love to talk." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What's the news on the road?", next = "news" },
        { text = "Why sell bags out here?", next = "why" },
        { text = "Farewell, Kalyimah.", next = "END" },
      },
    },
    news = {
      lines = { { id = "ne_default", text = "De Kolkar raidin' de caravans again, de quilboar stirrin' down south, and de goblins in Ratchet raisin' prices like always. Same news as every week, mon, just louder." } },
      choices = {
        { text = "Who should I talk to about the raids?", next = "news2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news2 = {
      lines = { { id = "ne2_default", text = "Thork up in de tower, he be keepin' de Crossroads safe, and Sergra Darkthorn be always lookin' for help with de beasts. Mankrik too, though he be grievin', so go gentle with him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "centaur" } } } },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because every adventurer comes out of de Wailing Caverns or Razorfen with more loot than dey can carry, and dey need a bag. I sell de bag, dey keep de loot, and everybody goes home happy." } },
      choices = {
        { text = "Smart trade. You give folk what they need.", next = "BACK", reply = "Dat be de secret, mon. Sell what people need, not what you want to sell.", fx = { align = { honor = 1 } } },
        { text = "And you charge plenty for it, I'd guess.", next = "BACK", reply = "Hah! A little, mon, but less than de goblins. Ask anybody.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Dat I don't know, mon, but somebody passin' through will." } },
  },
}

---------------------------------------------------------------------------
-- Larhka: beverage merchant at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "larhka", id = TODO_NPC("Larhka"), name = "Larhka", title = "Beverage Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "jovial" }, values = { "practical" },
  notices = { "drink", "race" },
  impression = {
    first = "Larhka sells drink at the Crossroads, from plain water to stuff that might strip paint. He seems to think a thirsty traveler is the best kind of customer, and in the Barrens that's every traveler.",
    third = "{name} met Larhka, who sells drink at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Thirsty? Of course you're thirsty, this is the Barrens. Step up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The dust gets in your throat, doesn't it?" },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! I've got some milk from the Mulgore herds, if the goblins didn't drink it on the way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Larhka, and I sell drink at the Crossroads. Water for the sensible, grog for the brave, and milk for the tauren." },
      },
      again = {
        { id = "h_again", text = "What else? Another drink?" },
        { id = "h_again2", text = "Go on, I'll pour while you talk." },
      },
      choices = {
        { text = "Show me your drinks.", next = "BUSINESS" },
        { text = "Where does the water come from?", next = "water" },
        { text = "Does Boorand mind the competition?", next = "boorand" },
        { text = "See you, Larhka.", next = "END" },
      },
    },
    water = {
      lines = { { id = "wa_default", text = "The oases, mostly, and the wells the tauren dug before we got here. But the oases are going bad, some say, ever since the druids went into the caves to the southwest, and I've had to start boiling everything." } },
      choices = {
        { text = "The druids poisoned the water?", next = "water2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water2 = {
      lines = { { id = "wa2_default", text = "Not poisoned, exactly, but something's wrong down in the Wailing Caverns, and it's leaking out into the oases. The tauren say Naralex's dream went bad, whatever that means." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } } },
    },
    boorand = {
      big = true,
      lines = { { id = "bo_default", text = "Boorand runs the inn and I sell on the street, so we get along fine. The Crossroads is thirsty enough for both of us, and then some." } },
      choices = {
        { text = "Room for everyone. That's how a town should be.", next = "BACK", reply = "That's what I say! I'll drink to that, once the line's gone.", fx = { align = { order = 1 } } },
        { text = "One of you should drive the other out.", next = "BACK", reply = "And then who would I complain about? No, we're fine as we are.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know, but have a drink and maybe you'll stop caring." } },
  },
}
