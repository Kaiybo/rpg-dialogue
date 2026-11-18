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
    { id = "g_night", when = { timeOfDay = "night" }, text = "You are abroad late, traveler, and the cold has come down. Stand by the brazier while you look, and take your time." },
    { id = "g_away", when = { away = 14 }, text = "It has been a long while. I wondered whether the road had been kind to you, and I am glad to see that it was kind enough." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of Mulgore, so far from home. The grass here is not as sweet, is it?" },
    { id = "n_worn", cat = "kit", when = { durability = { max = 30 } },
      text = "Oh, traveler, your seams are coming apart at the shoulder. Stand still a moment; I cannot watch someone walk into the Barrens like that." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth, as I do, and so you know that it is all that stands between you and the weather. Let us make sure it is good cloth." },
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
        { id = "h_again3", text = "Sit a moment, if you like. The road will still be there when we have finished talking." },
        { id = "h_again4", text = "Yes, traveler? My hands can work while my ears listen." },
      },
      choices = {
        { text = "Let me see your cloth.", next = "BUSINESS" },
        { text = "Why did you leave Mulgore?", next = "mulgore" },
        { text = "What do the Crossroads need most?", next = "needs" },
        { text = "Your weave isn't like anything the orcs sell.", next = "weave" },
        { text = "The wind here would shred anything thinner than hide.", next = "wind" },
        { text = "I sew a little. May I see how you finish a hem?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "It's good to hear a Mulgore voice out here.", next = "kin", when = { race = "Tauren" } },
        { text = "Orc clothing is a disgrace, is it?", next = "orcs", when = { race = "Orc" } },
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
      choices = {
        { text = "Why won't there be peace with the centaur?", next = "needs2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "centaur" } } },
      },
    },
    needs2 = {
      lines = { { id = "ne2_default", text = "Because the centaur do not want what peace would give them. The Kolkar drove my people from one end of this land to the other for generations, long before the orcs came, and they did it for the driving itself. I do not hate them. I only know them." } },
      choices = {
        { text = "Did the Kolkar drive your own family?", next = "needs3" },
        { text = "Something else, Halija.", next = "BACK" },
      },
    },
    needs3 = {
      big = true,
      lines = { { id = "ne3_default", text = "My mother's tribe walked every season with the hoofbeats behind them, and buried their dead without stopping. She wove on a loom she could carry on her back. When Cairne led us to Mulgore and the orcs stood beside him, she built a loom too heavy to lift, and wept over it." } },
      choices = {
        { text = "A people who can stop walking can finally build.", next = "BACK", reply = "Yes. That is what the heavy loom meant, and it is why I can sit here and sell you a robe. Thank you for seeing it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The wandering made your people strong. Don't forget it.", next = "BACK", reply = "It made us enduring, which is not quite the same. But I keep her carrying-loom still, in case the world turns again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave = {
      lines = { { id = "we_default", text = "It is plains wool, spun thick and woven close, the way it is done on Thunder Bluff. The orcs cut cloth to fit a body, and we weave it to suit the weather, and I think both are right. Here I do a little of each, so that it fits and it also keeps the dust out." } },
      choices = {
        { text = "Where does plains wool come from out here?", next = "weave2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave2 = {
      lines = { { id = "we2_default", text = "Up the road from Mulgore with the caravans, when the road is open, and Wrahk across the way spins it into thread for me. When the Kolkar close the road I unpick old blankets and begin again. Nothing woven is ever truly finished; it is only resting between uses." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wind = {
      lines = { { id = "wi_default", text = "The wind is hard, yes, but it is honest. It tells you each morning what the day will be, if you stand and let it. I hang a strip of white wool from my awning, and when it points south toward the Thousand Needles I know the dust is coming and I bring the fine things in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Gladly. You roll it twice, so, and the stitch goes through the roll and not the face, so that no thread shows and none can catch. It is slower, and the orcs think me foolish for it, but I have never had a hem returned." } },
      choices = { { text = "Twice rolled. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kin = {
      lines = { { id = "ki_default", text = "And yours is good to hear. There are a few of us here, Tonga Runetotem and Jahan Hawkwing and the innkeeper Boorand, and on feast nights we sit together and somebody always sings the rain song badly. You would be welcome at the fire." } },
      choices = { { text = "I'd be honored to sit with you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Oh! I should not have said that where you could hear. It is strong and it lasts, and I would not call it handsome, and I mean no insult to you by it. Let me make it up to you by showing you what a lined collar feels like." } },
      choices = { { text = "No offence taken. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "The Kolkar harried my people for longer than anyone can count. They are still out there, beyond the watchtowers, and they have not changed." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof gathered the wandering tribes and gave them a home. My mother named her loom for him, though she would never have told him so." } },
    earth_mother = { { id = "tp_em", text = "She clothes the plains in grass each spring and asks nothing for it. I try to remember that when I set my prices." } },
    thrall = { { id = "tp_thrall", text = "The orc Warchief stood with Cairne against the centaur when he owed us nothing. I sew for his people gladly." } },
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
    { id = "g_low", when = { maxLevel = 14 }, text = "Hey, mon, you be new on dis road, I can tell by how little you carry. Dat changes fast out here, so buy de bag before you need it." },
    { id = "g_away", when = { away = 14 }, text = "Look who came back down de Gold Road! I kept your gossip warm, mon, dere be a whole season of it." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, out here on de dusty road! How be Sen'jin, mon? Still smellin' of fish?" },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with one little pouch on his belt. Mon, you people carry an axe de size of a door and nowhere to put your lunch." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Ooh, I hear dat purse from here, mon. All dat gold and still de same old sack? Treat yourself." },
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
        { id = "h_again3", text = "You got more to ask, I got more to tell. Dat be a good trade, mon, and it costs you nothin'." },
        { id = "h_again4", text = "Keep talkin', keep talkin'. A quiet stall be a poor stall." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What's the news on the road?", next = "news" },
        { text = "Why sell bags out here?", next = "why" },
        { text = "You must see every sort of traveller there is.", next = "travellers" },
        { text = "A bag-seller knows what people carry.", next = "carry" },
        { text = "A Darkspear's a long way from the sea out here.", next = "sea", when = { race = "Troll" } },
        { text = "I hunt. What do the trappers haul through?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I stitch leather. Do you buy bags to sell on?", next = "lw", when = { profession = { "Leatherworking", "Tailoring" } } },
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
        { text = "What's the strangest load you've seen?", next = "why2" },
        { text = "Smart trade. You give folk what they need.", next = "BACK", reply = "Dat be de secret, mon. Sell what people need, not what you want to sell.", fx = { align = { honor = 1 } } },
        { text = "And you charge plenty for it, I'd guess.", next = "BACK", reply = "Hah! A little, mon, but less than de goblins. Ask anybody.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wh2_default", text = "Oh, mon, de things I seen come out of dose caves. A tauren came by with a sack dat was movin', and he would not say what was in it. An orc had so many deviate scales he was sheddin' dem down de road like a snake. One poor troll carried a friend's boots and nothin' else." } },
      choices = {
        { text = "What happened to the friend?", next = "why3" },
        { text = "Something else, Kalyimah.", next = "BACK" },
      },
    },
    why3 = {
      big = true,
      lines = { { id = "wh3_default", text = "Never came out, mon. Four went into de Wailin' Caverns and three walked back, and de boots were all dey found. I gave dat troll a bag for free, to carry dem home in, and I don't give anything for free. Some loads you don't charge for." } },
      choices = {
        { text = "That was rightly done. The dead should go home.", next = "BACK", reply = "Dat be what I thought. Don't spread it round, mon, or everybody will want a free bag and a sad story.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A merchant who gives goods away won't last.", next = "BACK", reply = "One bag in all dese years, mon, I think I can stand de loss. You be a hard one, eh?", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
      },
    },
    travellers = {
      lines = { { id = "tr_default", text = "All of dem, mon. Grunts marchin' south to de quilboar, tauren goin' up to Orgrimmar, goblins from Ratchet with a cart and a contract, and now and den a pale one from across de sea who don't blink enough. De Crossroads be where de whole Horde bumps into itself." } },
      choices = {
        { text = "Which of them are the best customers?", next = "travellers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    travellers2 = {
      lines = { { id = "tr2_default", text = "De ones comin' back, always. Goin' out, everybody thinks dey got room enough. Comin' back, dey got hides over one shoulder and ore in deir hat, and dey would pay anything. I be very kind and only charge dem de regular price, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    carry = {
      lines = { { id = "ca_default", text = "Everything, mon. I can tell you what a person be up to by what bag dey ask for. Small and deep means herbs. Wide and stiff means ore. And when somebody wants a sack dat don't let de smell out, I sell it and I don't ask, because dat be Apothecary Helbrim's business and not mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sea = {
      lines = { { id = "se_default", text = "Too far, cousin. I dream of salt water and wake up with dust in my teeth. But a Darkspear goes where de trade is, and de trade be here, so I got a shell from Sen'jin's beach hangin' over my stall and I hold it to my ear when de wind be bad." } },
      choices = { { text = "I hear it too. Something else.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Raptor hides and plainstrider feathers, mostly, and zhevra hooves for Sergra Darkthorn, who always wants more of somethin'. Get a bag with a stiff bottom, mon, or de claws poke through and you leave a trail a lion could follow." } },
      choices = { { text = "Stiff bottom. Noted. Something else.", next = "BACK" } },
    },
    lw = {
      lines = { { id = "lw_default", text = "If de stitchin' holds water, I do. Fill it at de well, mon, and walk it across de yard to me. If my feet stay dry, we talk price, and if dey don't, you go see Wrahk for better thread." } },
      choices = { { text = "A fair test. Something else.", next = "BACK" } },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "De Kolkar hit a caravan north of here last week and took everything but de bags. No taste, mon, no taste at all." } },
    ratchet = { { id = "tp_ratchet", text = "De goblins sell bags too, with little brass buckles, at three times my price. De buckles fall off in a month, I checked." } },
    wailing_caverns = { { id = "tp_wc", text = "Southwest, under de oasis. Everybody goes in for de serpent scales and comes out needin' a bigger bag or a healer." } },
    darkspear = { { id = "tp_darkspear", text = "We be traders now as well as hunters, mon. De tribe got to eat, and de Horde got to carry its things." } },
    quilboar = { { id = "tp_quilboar", text = "De Razormane down south carry everything in deir bristles, I hear. Worst customers in de Barrens." } },
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
    { id = "g_day", when = { timeOfDay = "day" }, text = "Sun's straight overhead and you're walking about in it. Drink something before you fall over in front of my stall and scare off trade." },
    { id = "g_away", when = { away = 14 }, text = "There you are! I thought the Barrens had dried you up and blown you away. First cup's the same price as ever." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! I've got some milk from the Mulgore herds, if the goblins didn't drink it on the way." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've been at somebody's grog already, and not mine by the smell. Have water, friend, and I mean it kindly." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! I've a palm wine up from the coast that none of the orcs will touch. It's been waiting for you." },
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
        { id = "h_again3", text = "Still dry? Then keep talking, and I'll keep the ladle handy." },
        { id = "h_again4", text = "Go on. Talk's thirsty work, which suits me fine." },
      },
      choices = {
        { text = "Show me your drinks.", next = "BUSINESS" },
        { text = "Where does the water come from?", next = "water" },
        { text = "Does Boorand mind the competition?", next = "boorand" },
        { text = "That grog looks like it could strip a hull.", next = "grog" },
        { text = "Every road in the Barrens seems to meet at your stall.", next = "roads" },
        { text = "A mage could put you out of the water trade.", next = "mage", when = { class = "MAGE" } },
        { text = "A shaman might ask the water what's wrong with it.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I walked from Mulgore. The wells along the way are old.", next = "tauren", when = { race = "Tauren" } },
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
      choices = {
        { text = "Has anyone looked at the oases themselves?", next = "water3" },
        { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
      },
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
    water3 = {
      big = true,
      lines = { { id = "wa3_default", text = "Tonga Runetotem says so, and he's gone round the oases himself, taking samples of whatever's sprouting there. The plants are too green and the beasts are too big, and he doesn't like it. I'm an orc; I'd have called a green Barrens a blessing, but when a tauren druid frowns at grass, I boil my water." } },
      choices = {
        { text = "The druids should mend what they broke.", next = "BACK", reply = "That's what Tonga's trying to do, to be fair to him. He needs hands, if you've a mind to help.", fx = { align = { order = 1 }, learn = { "oases" } } },
        { text = "A greener Barrens would feed the Horde. Let it grow.", next = "BACK", reply = "I thought that too, until I saw what was drinking at the Lushwater. Go and look at the size of those turtles, and then tell me again.", fx = { align = { order = -1 }, learn = { "oases" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grog = {
      lines = { { id = "gr_default", text = "It's cactus, mostly, and something the goblins sold me that they wouldn't name. The grunts off the watch drink it to forget the Kolkar, and the caravan drivers drink it to forget the grunts. I keep a mild ale as well, for those who'd like to remember the evening." } },
      choices = {
        { text = "Who's your hardest drinker?", next = "grog2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grog2 = {
      lines = { { id = "gr2_default", text = "I'll not name him, but I'll tell you who never drinks, and that's Mankrik. He comes for water and stands there turning the cup, and goes back to the south gate to watch the road. I'd pour him the whole barrel for nothing if I thought it would help." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roads = {
      lines = { { id = "ro_default", text = "They do, and that's why Thork put the town here. North to Ashenvale, south to Taurajo and the Needles, east to Ratchet and west to Stonetalon. Stand at my barrel a day and you'll hear what's wrong on every one of them, usually from somebody who's just run down it." } },
      choices = {
        { text = "What's wrong on them this week?", next = "roads2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads2 = {
      lines = {
        { id = "ro2_default", text = "Kolkar to the west, as always. Bristleback quilboar on the southern road, and the Venture Company's machines chewing up the north. And the Alliance has men at Northwatch on the coast who'd like nothing better than to catch a Horde caravan between there and Ratchet." },
        { id = "ro2_high", when = { minLevel = 30 }, text = "Nothing you couldn't walk through, by the look of you. Kolkar west, quilboar south, goblins north, humans at Northwatch. The young ones still come back bleeding from all four, so I still sell a great deal of water." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "centaur" } } } },
    },
    mage = {
      lines = { { id = "ma_default", text = "You could, and one tried. He sat by the gate conjuring it for free until the grunts noticed it vanished out of their skins on the march. Now they buy mine, which stays wet. Conjure for yourself, friend, and leave me the ones walking farther than an hour." } },
      choices = { { text = "A fair division. Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "One did, a Darkspear, right here at my barrel. She put her hand on the water and went quiet, and then she said it was frightened. I've sold drink for years and never thought to ask how it felt. I boil it gently now, for what that's worth." } },
      choices = { { text = "It's worth something. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "tn_default", text = "They are, and they're the only ones I trust. Your people dug them where the water wanted to be, and they've never gone bad, not once. The oases just happened, and now something else is happening to them. I draw from the old wells first." } },
      choices = { { text = "The old ones knew the land. Something else.", next = "BACK" } },
    },
  },
  topics = {
    wailing_caverns = { { id = "tp_wc", text = "A hole under the Lushwater Oasis where some night elf druid went to sleep and didn't wake right. Whatever he's dreaming, it's in my water." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar hold three of the oases as their own. I'd like to know what the bad water is doing to them, and I'd like to be far away when I find out." } },
    oases = { { id = "tp_oases", text = "The Forgotten Pools, the Lushwater and the Stagnant Oasis. All three too green, and Tonga Runetotem wants to know why." } },
    ratchet = { { id = "tp_ratchet", text = "Goblin rum comes up from there, and it's good, and it's dear. They say a ship sank. A ship always sank." } },
    thrall = { { id = "tp_thrall", text = "The Warchief drank from my barrel when he rode through to Thunder Bluff. Water, mind. I respected him for it." } },
    _none = { { id = "tp_none", text = "I don't know, but have a drink and maybe you'll stop caring." } },
  },
}
