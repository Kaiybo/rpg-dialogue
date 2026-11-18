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
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
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

---------------------------------------------------------------------------
-- Menara Voidrender: human warlock tutor in Ratchet (the Enchanted Gold Bloodrobe).
---------------------------------------------------------------------------
P:NPC {
  key = "menara", id = TODO_NPC("Menara Voidrender"), name = "Menara Voidrender",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "cool", "exacting" }, values = { "craft", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "Menara Voidrender tutors young warlocks in Ratchet, where no king or warchief can tell her whom to teach. She is courteous in the way of someone who has decided exactly how much of herself to show, and she takes any student who is careful.",
    third = "{name} met Menara Voidrender, a human warlock who teaches students of both factions from the neutral port of Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "You may come in, provided you touch nothing on the lower shelves. Some of it is fragile, and some of it is listening." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah. One of ours. Leave your minion by the door, if you please; mine dislikes competition, and I dislike scorch marks." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and in one piece. I shall take that as evidence you were listening last time." },
    { id = "g_search", when = { questActive = TODO_QUEST("In Search of Menara Voidrender") }, text = "You have been looking for me, I gather. Most who do have been sent by someone who would rather not be seen asking." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, in my study. Do sit down. I assure you nothing here will leap at you, unless you begin reciting." },
    { id = "n_void", cat = "fel", when = { class = "WARLOCK", pet = { family = "Voidwalker" } },
      text = "Your voidwalker holds its shape well. You have been feeding it attention and not merely orders, which is rarer than it ought to be." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Menara Voidrender. I teach the summoner's art to those who can be trusted with it, and I do so in Ratchet because the goblins ask only that I pay my rent and keep the smoke to a minimum." },
        { id = "h_before", when = { all = { { class = "WARLOCK" }, { questBefore = TODO_QUEST("In Search of Menara Voidrender") } } },
          text = "I am Menara Voidrender, and you have the look of a student who has outgrown plain cloth. When your teacher judges you ready, there is a robe I make for those of our craft, and it is not made quickly or cheaply." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Components for the Enchanted Gold Bloodrobe") },
          text = "The robe wants its components, and I cannot conjure them from good intentions. Each is kept by someone who will ask a service of you first, so be civil, be thorough, and bring every piece back to me unspoiled." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Completed Robe"), days = 3 } },
          text = "It sits well on you. The gold thread is not vanity; it carries the binding from collar to hem, and you will feel the difference the first time something tries to take hold of your will." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Completed Robe"), days = 7 } },
          text = "You are still wearing my work, I see, and it has a burn at the cuff I did not put there. Good. A robe that has never been tested is only an ornament." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask, and I shall decide whether the answer is safe for you." },
        { id = "h_again2", text = "Something further. Very well; I have the afternoon." },
        { id = "h_again3", text = "You are thorough. I approve of thoroughness, within reason." },
      },
      choices = {
        { text = "A human warlock, teaching in a goblin port.", next = "ratchet" },
        { text = "You teach Horde and Alliance alike?", next = "both" },
        { text = "What goes into a robe like the one you make?", next = "robe" },
        { text = "Strahad Farsan's acolytes keep a tower nearby.", next = "strahad" },
        { text = "I'm told you make orbs that hold demons.", next = "orbs", when = { class = "WARLOCK" } },
        { text = "Stormwind would hang you for this, I think.", next = "human", when = { race = "Human" } },
        { text = "The Forsaken find your art less shocking than most.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Good day, Menara.", next = "END" },
      },
    },
    ratchet = {
      lines = { { id = "ra_default", text = "It is the one town on this coast where I am judged solely on whether my coin is good. In Stormwind my kind practise in a cellar beneath a tavern. In Orgrimmar we are kept in a cleft and watched. Here I have a window, a sea view, and neighbours who think a demon is merely an unusual employee." } },
      choices = {
        { text = "You left Stormwind by choice, then.", next = "ratchet2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet2 = {
      lines = { { id = "ra2_default", text = "I left before the choice was made for me. The Church tolerates us only so long as we are useful and quiet, and I was becoming neither. A colleague of mine, Tabetha, went to the marsh for much the same reasons. I preferred somewhere with a market." } },
      choices = {
        { text = "Do you miss it?", next = "ratchet3" },
        { text = "Something else, Menara.", next = "BACK" },
      },
    },
    ratchet3 = {
      big = true,
      lines = { { id = "ra3_default", text = "I miss the libraries. I do not miss lowering my voice. One may be free or one may be respectable, and I have found that the people who insist one can be both have generally not attempted my profession." } },
      choices = {
        { text = "Freedom is worth the exile. You chose well.", next = "BACK", reply = "I think so, on most mornings. It is pleasant to hear it from someone with no reason to flatter me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those rules exist because of what your art has done.", next = "BACK", reply = "They do, and I do not pretend otherwise. I only observe that the rules were never written by anyone who understood it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = { { id = "bo_default", text = "I teach whoever arrives sober, solvent and frightened enough. A demon makes no distinction between an orc and a dwarf when it is deciding whom to devour, and I see no reason to be more particular than the demon. The goblins find this very sensible." } },
      choices = {
        { text = "Knowledge shared across the lines keeps everyone safer.", next = "BACK", reply = "Precisely. An ignorant warlock on either side is a hole through which something may crawl into both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're arming both sides of a war for coin.", next = "BACK", reply = "I am teaching both sides not to burn down the world by accident. If they then use it on each other, that is hardly my invention.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robe = {
      lines = { { id = "ro_default", text = "Cloth that has been somewhere unpleasant, thread drawn fine enough to carry a ward, and several things I shall not name until you need to fetch them. No one place has all of it. That is deliberate; the making is the last lesson, and it is a lesson in asking favours of difficult people." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strahad = {
      lines = { { id = "st_default", text = "They do, up on the hill, and Strahad and I maintain a correct and distant friendship. He concerns himself with the binding of greater demons and I with keeping students alive long enough to attempt it. We refer pupils to one another, and criticise each other's diagrams by letter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orbs = {
      lines = { { id = "or_default", text = "You are told correctly. A demon bound into an orb is a demon that is nowhere else, and there are occasions when that is the kindest thing one can do for a district. The craft is exacting. A flaw the width of a hair, and one has made a very expensive door." } },
      choices = { { text = "I'll remember where to come. Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "hu_default", text = "Hang, no. Stormwind does not hang its warlocks; it keeps them beneath the Slaughtered Lamb and consults them when something goes badly wrong. I simply declined to live in a cellar. You are welcome to tell the Cathedral where I am. They know, and they write when they need me." } },
      choices = { { text = "I've no wish to tell anyone. Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "So I have observed, and I confess it makes you agreeable students. You do not flinch and you do not moralise. I would only caution that a people with nothing left to fear are the ones a demon finds easiest to bargain with, since it need only offer what was lost." } },
      choices = { { text = "A fair caution. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied in Stormwind, quietly, and left it, less quietly. The rest is between myself and several creditors." } },
    advice = { { id = "tp_ad", text = "Never summon anything while angry. It can tell, and it will make use of it." } },
    burning_legion = { { id = "tp_legion", text = "Every creature I bind was a soldier of it once. I regard my work as a very small and continuing act of desertion on their behalf." } },
    burning_blade = { { id = "tp_blade", text = "Amateurs with ambitions, which is the most dangerous kind. Their summoning circles in the hills north of here would shame a first-year." } },
    theramore = { { id = "tp_theramore", text = "Tabetha lives in the marsh near it and pretends she does not. We correspond. She is the better theorist, and knows it." } },
    ratchet = { { id = "tp_ratchet", text = "An honest town, in the sense that everyone's price is posted. I find that restful." } },
    _none = { { id = "tp_none", text = "That lies outside my field, and I make a point of never speculating aloud." } },
  },
}

---------------------------------------------------------------------------
-- Ruga Ragetotem: tests young warriors at Camp Taurajo (Trial at the Field of Giants).
---------------------------------------------------------------------------
P:NPC {
  key = "ruga", id = TODO_NPC("Ruga Ragetotem"), name = "Ruga Ragetotem",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "stern", "measured" }, values = { "honorable", "brave" },
  notices = { "class", "kit" },
  impression = {
    first = "Ruga Ragetotem tests young warriors at Camp Taurajo, and sends them south to the Field of Giants to face the silithid. He speaks slowly and expects much, and he seems to weigh a warrior by how they return, not by what they carry back.",
    third = "{name} met Ruga Ragetotem, a tauren warrior at Camp Taurajo who sets a trial for the Horde's young fighters at the Field of Giants.",
  },
  greetings = {
    { id = "g_default", text = "Stand easy. You are among friends at Taurajo, and there are few enough places in the Barrens where that can be said." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior. You carry yourself as one who has won a few fights and has begun to wonder what the fighting is for. That is the right time to come to me." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the camp. Sit by the fire, and tell me what the road has taught you." },
    { id = "g_active", when = { questActive = TODO_QUEST("Trial at the Field of Giants") }, text = "The Field of Giants lies south along the road, where the earth is torn open. I will know whether you have been there by more than the antennae." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has been hard used, and that speaks well of you and poorly of your smith. See it mended before you take any trial of mine." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "One who speaks with the spirits. Ask them what moves under the Field of Giants. I have asked, and they would not answer me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ruga Ragetotem. When a warrior of the Horde has learned to strike, they are sent to me to learn whether they can stand, and those are not the same lesson." },
        { id = "h_before", when = { all = { { class = "WARRIOR" }, { questBefore = TODO_QUEST("Trial at the Field of Giants") } } },
          text = "You have been sent to me, and so I will test you. South of this camp the ground has broken open and a new thing has come out of it, the silithid, insects as large as kodo calves. Go among them, and bring me their twitching antennae." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Trial at the Field of Giants") },
          text = "You have not yet finished among the silithid. Do not rush them, young one. They come in swarms, and a warrior who chases one will find himself standing in the midst of twenty." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Trial at the Field of Giants"), days = 3 } },
          text = "You went, and you came back, and you are quieter than when you left. Good. Take my word to Thun'grim Firegaze at the forge north of the Crossroads, and he will see you armored as you have earned." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Trial at the Field of Giants"), days = 7 } },
          text = "I have had word of you since your trial, and it was good word. The silithid mounds have grown since you walked there. I think of that often, and I am glad there are warriors like you between them and the camp." },
      },
      again = {
        { id = "h_again", text = "Speak. The fire will keep, and so will I." },
        { id = "h_again2", text = "There is more you would ask. Ask it plainly." },
        { id = "h_again3", text = "Go on. A question is no weakness in a warrior." },
      },
      choices = {
        { text = "What is a silithid?", next = "silithid" },
        { text = "Why a trial against insects, of all things?", next = "trial" },
        { text = "Your tribe's name isn't one I hear often.", next = "ragetotem" },
        { text = "Taurajo seems a camp that expects trouble.", next = "camp" },
        { text = "The orcs taught me to charge. What do you teach?", next = "orc", when = { race = "Orc", class = "WARRIOR" } },
        { text = "I am of the tribes. Test me as you would our own.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Walk with the Earth Mother, Ruga.", next = "END" },
      },
    },
    silithid = {
      lines = { { id = "si_default", text = "I do not fully know, and that troubles me more than the creatures themselves. They came up from beneath the Field of Giants not long ago, where there had only ever been kodo and thunder lizards. They build mounds, they move as one, and they do not behave as beasts of this land behave." } },
      choices = {
        { text = "Where did they come from?", next = "silithid2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid2 = {
      lines = { { id = "si2_default", text = "From the south, the elders believe, from somewhere beyond the Thousand Needles, where the tribes never had cause to wander. I am a warrior and not a seer. I know only that the ground is being eaten from below, and that nobody can tell me by what." } },
      choices = {
        { text = "What should the Horde do about it?", next = "silithid3" },
        { text = "Something else, Ruga.", next = "BACK" },
      },
    },
    silithid3 = {
      big = true,
      lines = { { id = "si3_default", text = "Watch, and count, and be ready. I have asked that word be sent to Thunder Bluff and to Orgrimmar, and I am told there are greater wars to mind. Perhaps there are. But I have seen a herd destroyed by a sickness that began as one lame calf nobody had time to look at." } },
      choices = {
        { text = "Small dangers ignored become great ones. Keep watching.", next = "BACK", reply = "I will, and I will keep sending the young ones to look with their own eyes. They will remember it when their elders have forgotten.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Horde's real enemies carry banners, not feelers.", next = "BACK", reply = "So Orgrimmar tells me. I hope that you are both right, and I will sharpen my axe as though you were not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    trial = {
      lines = { { id = "tr_default", text = "Because an enemy with a face can be hated, and hatred will carry a young warrior a long way. The silithid give you nothing to hate. They do not rage or flee or taunt. To stand against them you must find your courage somewhere other than your anger, and that is the courage that lasts." } },
      choices = {
        { text = "Courage without anger. That's a hard thing to ask.", next = "BACK", reply = "It is the hardest thing I know. I did not find it myself until I was older than you are now.", fx = { align = { honor = 1 } } },
        { text = "Anger wins fights. I'll keep mine.", next = "BACK", reply = "Keep it, then, and learn where it ends. It will fail you one day among the mounds, and I would have you ready for that day.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ragetotem = {
      lines = { { id = "rt_default", text = "We are a tribe of warriors, and we do not sing of ourselves as the Bloodhoof or the Runetotem do. When Cairne called the tribes together, the Ragetotem answered with their axes and little else. Our totem is carved with what we have guarded, and not with what we have slain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "cm_default", text = "It has learned to. The Bristleback quilboar press on us from north and south, the dwarves dig at Bael Modan, and now the earth itself opens. Jorn Skyseer teaches the hunters, Kirge Sternhorn watches the road, and Grunt Logmar's orcs hold the wall with us. We are few, and we do not sleep deeply." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "To be the place others charge from. Your people strike like a storm, and I honor it; I fought beside them at Hyjal. But a storm passes. A warrior must also learn to be the hill the storm breaks on, and the orcs who learn it are the ones their grunts follow anywhere." } },
      choices = { { text = "The hill, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "I will test you harder, for you carry more than yourself. An orc who fails my trial shames only his own name. You walk with every ancestor who kept the herds alive through the centaur years, and they are watching the Field of Giants as I am." } },
      choices = { { text = "I won't shame them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a warrior of the Ragetotem, and I have stood where I was needed for more winters than I count. That is all a warrior's story should be." } },
    advice = { { id = "tp_ad", text = "Do not chase the one that runs. Among the silithid, and among most enemies, it is running toward its friends." } },
    silithid = { { id = "tp_silithid", text = "They came up through the Field of Giants and they are still coming. I do not think the Barrens is where they began, or where they mean to stop." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback are a foe I understand. They want land and they fight for it, as we once did. I do not hate them, and I do not yield to them." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain is a warrior first, whatever else he has become. He would know why I worry over the mounds." } },
    centaur = { { id = "tp_centaur", text = "My first battles were against the Galak in the south. Whatever else the Horde has given us, it has given our calves a childhood without hoofbeats in it." } },
    _none = { { id = "tp_none", text = "I have no knowledge of that, and I will not pretend to it." } },
  },
}

---------------------------------------------------------------------------
-- Kirge Sternhorn: brave of Camp Taurajo (Journey to the Crossroads).
---------------------------------------------------------------------------
P:NPC {
  key = "kirge", id = TODO_NPC("Kirge Sternhorn"), name = "Kirge Sternhorn",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "watchful", "plain" }, values = { "dutiful", "loyal" },
  notices = { "race", "weary" },
  impression = {
    first = "Kirge Sternhorn keeps watch at Camp Taurajo and looks north along the road more than anywhere else. He has seen things in the southern Barrens that the Crossroads ought to hear about, and too few travellers to carry the word.",
    third = "{name} met Kirge Sternhorn, a brave of Camp Taurajo who needed word carried north to Thork at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Hail, traveler. You came in by the road, so tell me, did you pass anyone on it?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and whole. The road has been kinder to you than to some." },
    { id = "g_active", when = { questActive = TODO_QUEST("Journey to the Crossroads") }, text = "You still carry my word for Thork? North on the road, and do not stop for the quilboar, however they call to you from the hills." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A late hour to be walking the Barrens. Come inside the firelight, and be welcome." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the people. It gladdens me. There are more orcs on this wall than tauren some nights, and I have nothing against them, but they do not know the songs." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You have been to the spirits and back, I can see it on you. Rest at Byula's fire before you take another step on that road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kirge Sternhorn, a brave of this camp. I watch the Gold Road where it runs north to the Crossroads, and lately I have had more to watch than I have eyes for." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Journey to the Crossroads") },
          text = "I am Kirge Sternhorn. You look fit for the road, and I have need of someone who is. Thork commands at the Crossroads, and he should hear what we are seeing in the south before it reaches him unannounced." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to the Crossroads") },
          text = "Go to Thork, at the Crossroads, north along the Gold Road. Tell him Taurajo holds, but that the Bristleback grow bold and stranger things than quilboar are stirring in the Field of Giants." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Journey to the Crossroads"), days = 3 } },
          text = "Thork has my word, then. I thank you. He will not be able to send us blades, I know that, but a commander who has been warned is worth a dozen who have not." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I can talk and watch at once." },
        { id = "h_again2", text = "Ask. The road is empty for the moment." },
        { id = "h_again3", text = "Speak, friend. It is a long watch, and I do not mind the company." },
      },
      choices = {
        { text = "What have you seen from this post?", next = "seen" },
        { text = "The Crossroads and Taurajo depend on one road.", next = "road" },
        { text = "Grunt Logmar looks like he's carrying a weight.", next = "logmar" },
        { text = "This camp feels older than the orcs' towns.", next = "camp" },
        { text = "I track by trade. What signs are on the road?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Teach me one of the songs the orcs don't know.", next = "song", when = { race = "Tauren" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Keep your watch well, Kirge.", next = "END" },
      },
    },
    seen = {
      lines = { { id = "se_default", text = "Bristleback scouts on the ridges at dusk, more each week, and never the same faces. Dust from Bael Modan where the dwarves are blasting. And twice now, at night, a line of pale shapes crossing the road far to the south, low to the ground and moving all together." } },
      choices = {
        { text = "Pale shapes?", next = "seen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen2 = {
      lines = { { id = "se2_default", text = "Ruga Ragetotem calls them silithid. They came out of the earth at the Field of Giants. I had thought they kept to their mounds, but something that crosses a road in the dark is going somewhere, and I should like to know where before it arrives." } },
      choices = {
        { text = "And Thork can do nothing?", next = "seen3" },
        { text = "Something else, Kirge.", next = "BACK" },
      },
    },
    seen3 = {
      big = true,
      lines = { { id = "se3_default", text = "Thork has the Kolkar at his throat and too few grunts to hold his own towers. I do not send him word so that he will save us. I send it because the Crossroads is where the roads meet, and if Taurajo should fall silent, someone there must know what the silence means." } },
      choices = {
        { text = "A warning sent without hope of help is true duty.", next = "BACK", reply = "It is only what a watchman is for. But I thank you for calling it by that name.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If no help is coming, look to your own and leave.", next = "BACK", reply = "And go where? This is our land. The orcs came to it, and we will not be the ones who walk away from it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } },
      },
    },
    road = {
      lines = { { id = "rd_default", text = "They do. The Gold Road was a kodo trail before it had a name, and now it carries everything the Horde has between Orgrimmar and the Needles. A caravan a day when it is safe, and none for a week when it is not. I can tell the state of the whole Barrens by counting wheels." } },
      choices = {
        { text = "The Horde should garrison every mile of it.", next = "BACK", reply = "With what? I would settle for a tower at the halfway spring. I have asked, and I will keep asking.", fx = { align = { order = 1 } } },
        { text = "A road that open can't be held. Travel fast and light.", next = "BACK", reply = "That is how the caravans think, and the quick ones do get through. It is the slow ones I bury.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    logmar = {
      lines = { { id = "lo_default", text = "He is. One of his grunts was taken by the Bristleback, and he could not go back for him without leaving the camp open. I have told him that he chose as a brave would choose. He nods, and does not sleep. Speak to him, if you have a strong arm to offer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "cp_default", text = "It is. Hunters of the tribes rested here long before Cairne gathered us, when it was only a ring of stones and a good spring. The orcs build walls first and then live inside them. We lived here first, and the wall is a new and sorry thing we have had to learn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then look at the verges and not the ruts. Quilboar walk beside a road, never on it, and they drag their spear-butts. If you find a place where the grass is pressed flat in a row, as if a log had been rolled across, that was not quilboar, and I would hear of it." } },
      choices = { { text = "I'll bring you word of it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    song = {
      lines = { { id = "so_default", text = "Ha. Here is the one for a night watch, then, and it is short. You name the stars as they rise, each by the ancestor who hunts there, and you ask each one to look down once. By the time you have named them all, it is dawn, and nothing has come over the wall." } },
      choices = { { text = "I'll sing it on my next watch. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a brave of Taurajo, with a mate and a young son in the camp behind me. That is reason enough to watch a road." } },
    advice = { { id = "tp_ad", text = "Count the wheels. When fewer carts come by than yesterday, something up the road has changed." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback were always here, and we always skirmished. This boldness is new. Something in Razorfen is driving them." } },
    silithid = { { id = "tp_silithid", text = "Ask Ruga Ragetotem. I only know that the ground at the Field of Giants is not where I left it." } },
    cairne = { { id = "tp_cairne", text = "He ended the wandering. My son will never run before the centaur as I did, and for that I would follow the Bloodhoof anywhere." } },
    centaur = { { id = "tp_centaur", text = "The Galak trouble the Needles and the Kolkar the north. Here it is quilboar. Every tauren camp has its own kind of trouble, it seems." } },
    _none = { { id = "tp_none", text = "That has not come down my road, friend, so I cannot speak of it." } },
  },
}

---------------------------------------------------------------------------
-- Wizzlecrank's Shredder: a Venture Company pilot who wants out, the Sludge Fen (Ignition, The Escape).
---------------------------------------------------------------------------
P:NPC {
  key = "wizzlecrank", id = TODO_NPC("Wizzlecrank's Shredder"), name = "Wizzlecrank's Shredder",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  temper = { "frantic", "sly" }, values = { "greedy", "cunning" },
  notices = { "craft", "class" },
  impression = {
    first = "Pilot Wizzlecrank sits in a stalled Venture Company shredder in the Sludge Fen, whispering through the hatch. He has had enough of the Company and means to defect with his machine, if someone will fetch the key and walk him out.",
    third = "{name} met Pilot Wizzlecrank, a Venture Company shredder pilot in the Sludge Fen who wanted to desert with his machine.",
  },
  greetings = {
    { id = "g_default", text = "Psst! Hey, down here, the hatch, the hatch! Keep walkin' like you ain't talkin' to me, pal, and listen." },
    { id = "g_key", when = { questActive = TODO_QUEST("Ignition") }, text = "Ya got the key yet? Supervisor Lugwizzle, up on the control platform, the fella with the hat. Hurry it up, pal, I'm sweatin' through the seat." },
    { id = "g_go", when = { questActive = TODO_QUEST("The Escape") }, text = "She's turnin' over! Stay close and hit anything that looks at us funny, and I mean anything, pal, I ain't picky." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good, good. Nobody saw ya? Nobody ever thinks they were seen. Get closer." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Hey, you got grease under your nails, you're in the trade! Then ya know a number-four shredder don't start without the key no matter how hard ya kick her, and I been kickin'." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Light on your feet, huh? Perfect, pal, perfect. Lugwizzle keeps the key on his belt, left side, and he never looks behind him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pilot Wizzlecrank, Venture Company, shredder division, and I'd like to make that formerly on all three counts. I got a machine, I got the plans in my boot, and I got a real strong wish to be anywhere that ain't this swamp." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Ignition") },
          text = "Listen, listen, I'm gettin' out, and I'm takin' the shredder with me. Only the supervisor pulled all the keys last week on account of somebody else tryin' the same thing. Get me my key off Lugwizzle, and I'll make it worth your while." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Ignition") },
          text = "No key, no escape, pal, that's the whole schematic. Lugwizzle's on the control platform over the sludge. He ain't gonna hand it over, so, y'know, use your judgement, and use it hard." },
        { id = "h_escape", tags = { "news" }, when = { questActive = TODO_QUEST("The Escape") },
          text = "That's her, that's the key! Now we walk outta here real casual, south and east to the road. The second the foremen work out I ain't on a lumber run, every bruiser in the fen's gonna come runnin'." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "We made it, pal, we actually made it! Take the plans to Sputtervalve in Ratchet and tell him Wizzlecrank's open to offers. I'm gonna go park this thing somewhere the Company don't look and sleep for a week." },
      },
      again = {
        { id = "h_again", text = "What, what? Keep it down, and keep it short, pal." },
        { id = "h_again2", text = "Yeah, yeah, ask, but watch the tower while ya do." },
        { id = "h_again3", text = "Another question? Sure, why not, I only got a death sentence waitin'." },
      },
      choices = {
        { text = "Why desert? The Company must pay well.", next = "why" },
        { text = "What is the Company doing to this place?", next = "fen" },
        { text = "What happened to the last pilot who tried?", next = "last" },
        { text = "Where will you go with a stolen shredder?", next = "go" },
        { text = "I know engines. What's a number four run on?", next = "engineer", when = { profession = "Engineering" } },
        { text = "This was good land once, before your saws.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Sit tight, Wizzlecrank.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Pay? Pal, they charge us! Fuel comes outta your wages, repairs come outta your wages, and if a tree falls on ya that's a fine for damagin' Company lumber. I been drivin' this rig two years and I owe 'em more than when I signed." } },
      choices = {
        { text = "So it's only about the money.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wh2_default", text = "Mostly, yeah, I ain't gonna dress it up! But, look. Last month they had us clear a stand up north, and there was tauren livin' under it, a little camp, kids and all. Foreman says cut. I cut around 'em, real slow, and got docked a week for low yield." } },
      choices = {
        { text = "And the other pilots?", next = "why3" },
        { text = "Something else, Wizzlecrank.", next = "BACK" },
      },
    },
    why3 = {
      big = true,
      lines = { { id = "wh3_default", text = "The other pilots made quota, pal. That's all I'm gonna say about it. I'm a goblin, I'll sell ya your own shoes, but there's stuff ya don't put on an invoice. I looked at that week's pay stub with the fine on it, and I started figurin' how to steal the rig." } },
      choices = {
        { text = "You did one decent thing. Do another and get out.", next = "BACK", reply = "That's the plan, pal, that's the whole plan. Decency's a new line of business for me, so be patient.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A conscience is a costly thing for a goblin to keep.", next = "BACK", reply = "Tell me about it! Cost me a week's wages already. I'm hopin' it pays dividends, I hear sometimes it does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    fen = {
      lines = { { id = "fe_default", text = "Drainin' it, drillin' it and dumpin' in it, in that order. There's oil under the mud, so they sunk a rig, and what comes up that ain't oil goes straight back in the water. That's why she's called the Sludge Fen, pal. She was just the Fen when I got here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    last = {
      lines = { { id = "la_default", text = "Fizzlebub. Good pilot, bad planner. He got his rig as far as the gate before the boiler quit, on account of he forgot the Company only fuels ya for one shift. They made the rest of us watch what the bruisers did, as a trainin' exercise. I got a full tank, pal. I been savin' it up a cup at a time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    go = {
      lines = { { id = "go_default", text = "Ratchet. There's an engineer there, Sputtervalve, who's been wantin' a look inside a Venture shredder for years, and I happen to be sittin' in one with the blueprints. I figure that's worth a job, a bed, and a new name. I'm thinkin' Smith. Nobody looks for a goblin called Smith." } },
      choices = {
        { text = "Selling Company secrets to the Cartel. Bold.", next = "BACK", reply = "It ain't sellin' if I'm also runnin' for my life, pal, that's what ya call a relocation package.", fx = { align = { honor = -1 } } },
        { text = "Those plans could help stop what they're doing here.", next = "BACK", reply = "Huh. Yeah, I guess they could, at that. Look at me, a public benefactor. Don't spread it around.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "Spite and seagull grease, pal. Nah, it's a twin boiler on rendered blubber, with a saw clutch that'll take your arm if ya engage her cold. She's a brute, but she's my brute. Ya walk on my left when we go, the right-side exhaust runs hot." } },
      choices = { { text = "On your left. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Yeah. Yeah, it was, I seen the before. I ain't gonna tell ya I'm sorry, pal, 'cause sorry's free and you'd be right not to take it. I'm tellin' ya I got the drill plans for the whole fen in my boot, and I'm takin' 'em to somebody who hates the Company." } },
      choices = { { text = "That is worth more than sorry. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Signed on in Booty Bay for the bonus, which I never saw. Been cuttin' trees for the Company from Stranglethorn to here ever since." } },
    advice = { { id = "tp_ad", text = "Read the contract, pal, the whole contract, especially the part about who pays for fuel." } },
    venture_company = { { id = "tp_venture", text = "Worst outfit I ever worked for, and I once sold used fuses door to door. They don't build nothin', they just take till it's gone." } },
    ratchet = { { id = "tp_ratchet", text = "Cartel town. They hate the Company on principle and on the balance sheet, which is my kinda hate." } },
    steamwheedle = { { id = "tp_cartel", text = "They got rules, and they pay on Fridays. Pal, after two years here, that sounds like paradise." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and I can't afford to find out right now, pal." } },
  },
}

---------------------------------------------------------------------------
-- Grub: keeps the cookhouse east of the Crossroads (Dig Rat Stew).
---------------------------------------------------------------------------
P:NPC {
  key = "grub", id = TODO_NPC("Grub"), name = "Grub",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "hearty", "stubborn" }, values = { "practical", "generous" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Grub keeps a cookhouse in a hut east of the Crossroads, with Duhng at the pot and Tarban Hearthgrain at the oven. He has a craving for dig rat stew that he cannot satisfy himself, since the rats live under a dwarven excavation.",
    third = "{name} met Grub, the orc who runs the cookhouse east of the Crossroads and wanted dig rats for his stew.",
  },
  greetings = {
    { id = "g_default", text = "Come in, sit, mind the low beam. Nobody leaves Grub's hungry, and nobody leaves without an opinion on the stew." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "You've a cook's hands, I can tell by the scars. Good! Then you'll know why I'm in a foul mood about my larder." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my table! Duhng, another bowl. Sit, sit." },
    { id = "g_active", when = { questActive = TODO_QUEST("Dig Rat Stew") }, text = "Have you got my rats? Fat ones, mind, from under the dwarves' diggings. The skinny ones aren't worth the pot." },
  },
  notice = {
    { id = "n_thin", cat = "hunger", when = { maxLevel = 14 },
      text = "You're thin as a spear, young one. Eat first and talk after, that's the rule of the house." },
    { id = "n_tauren", cat = "craft", when = { race = "Tauren" },
      text = "A tauren! Tarban's bread is outside by the oven, and I'll have you know it was my idea to hire him, whatever he says." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Grub, and this is my cookhouse. Duhng cooks, Tarban bakes, and I decide what's worth eating, which is the hardest job of the three and the least thanked." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dig Rat Stew") },
          text = "I'm Grub, and I'll tell you what's wrong with me. I've a hunger for dig rat stew that won't leave me be, and the only dig rats in the Barrens live under the dwarves' excavation at Bael Modan. Bring me some, and I'll teach you the making of it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dig Rat Stew") },
          text = "Bael Modan, far to the south, where the dwarves have cut the hills open. The rats run in the tunnels under their scaffolds. The dwarves won't thank you for visiting, so be quick about it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dig Rat Stew"), days = 3 } },
          text = "Now that is a stew! Rich as a goblin and twice as slippery. You've the recipe now, so guard it, and don't let anyone tell you rat isn't fit for a warrior's table." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Dig Rat Stew"), days = 7 } },
          text = "I've been rationing those rats you brought, a ladle a night. Duhng says I talk to the pot. I say the pot's earned it." },
      },
      again = {
        { id = "h_again", text = "What else? Talk between mouthfuls, I don't mind." },
        { id = "h_again2", text = "Go on. The stew wants stirring, but Duhng has it." },
        { id = "h_again3", text = "Ask! A full belly makes a curious head." },
      },
      choices = {
        { text = "Rat stew? There's better meat all over the Barrens.", next = "rat" },
        { text = "An orc, an orc and a tauren in one kitchen.", next = "kitchen" },
        { text = "Why set up out here and not inside the walls?", next = "hut" },
        { text = "Who eats at Grub's?", next = "eaters" },
        { text = "I cook. What's the secret of the stew?", next = "secret", when = { profession = "Cooking" } },
        { text = "A troll would put pepper in it.", next = "troll", when = { race = "Troll" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Good eating, Grub.", next = "END" },
      },
    },
    rat = {
      lines = { { id = "ra_default", text = "Better, no. Bigger, yes. Any fool can roast a zhevra haunch. A dig rat's been eating roots and grubs under good red earth all its life, and the meat's sweet and dark, and it falls off the bone if you give it an afternoon. I'd not expect a plainstrider-eater to understand." } },
      choices = {
        { text = "Where did an orc learn to love rat?", next = "rat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rat2 = {
      lines = { { id = "ra2_default", text = "Where do you think? In the camps you ate what came under the fence. Most orcs swore off it the day they walked free. I found I'd come to like it, and I'd rather own that than pretend. There's no shame in a taste you learned by surviving." } },
      choices = {
        { text = "Do the others think less of you for it?", next = "rat3" },
        { text = "Something else, Grub.", next = "BACK" },
      },
    },
    rat3 = {
      big = true,
      lines = { { id = "ra3_default", text = "Some do. A grunt spat in my doorway once and called it prison food. I told him he was right, and that I was the one who'd got fat on it, and that he could have the bowl or the door. He took the bowl. He comes back every week now, and doesn't spit." } },
      choices = {
        { text = "Turning a hard memory into a good meal takes strength.", next = "BACK", reply = "Hah! That's the kindest thing anyone's said about a rat. Sit down, you've earned the big ladle.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Some things from the camps are better left there.", next = "BACK", reply = "Maybe so, and I left plenty. The stew I kept. A body ought to be allowed one thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "internment" } } },
      },
    },
    kitchen = {
      lines = { { id = "ki_default", text = "It works better than it should. Duhng can cook anything with legs, and teaches it to whoever asks. Tarban bakes the way his people do, slow, in ash, and won't be hurried by me or anyone. They argue about salt every single day, and I let them, because the food's better for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hut = {
      lines = { { id = "hu_default", text = "Smoke and room. Thork wouldn't have a cookfire this size inside the palisade, and I wouldn't have a commander telling me when to bank it. Out here I've the hill at my back and the smell carries to the road, which is all the sign a cookhouse needs." } },
      choices = {
        { text = "And when the Kolkar raid?", next = "hut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut2 = {
      lines = { { id = "hu2_default", text = "Then we bar the door and Duhng stands behind it with the big cleaver. It's happened twice. The second time a centaur put his head in the window and Tarban hit him with a baking stone, and I've not been able to make him raise his voice since, let alone his hand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eaters = {
      lines = { { id = "ea_default", text = "Caravan drivers, the grunts off the east tower, hunters who'd sooner sell me a carcass than cook it. Sergra Darkthorn's lot bring me whatever they've been told to kill that week. And Mankrik comes, some evenings, and I put a bowl by him and don't expect talk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    secret = {
      lines = { { id = "se_default", text = "Brown the rat whole before it goes near water, and I mean brown, nearly black. Then a slow pot, an onion if you can get one, and no lid. Everyone wants to put a lid on it. A lid makes soup, and I didn't ask for soup." } },
      choices = { { text = "No lid. Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "A troll did, in my own pot, while my back was turned! And I'll tell you something I've told nobody, which is that it was better. Don't repeat that. I've a reputation for stubbornness in this town, and I worked for it." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came out of the camps hungry and decided never to be hungry again. This hut is the whole of my ambition, and I've achieved it." } },
    advice = { { id = "tp_ad", text = "Eat when there's food and sleep when there's quiet. Everything else in the Barrens will wait for you." } },
    centaur = { { id = "tp_centaur", text = "They've raided my hut twice and gone home with nothing but a lump from a baking stone. I'd say we're ahead." } },
    internment = { { id = "tp_internment", text = "It taught me what a meal is worth. That's the only thing I'll thank it for." } },
    thrall = { { id = "tp_thrall", text = "He's never eaten here. When he does, he gets the rat, and he'll like it or he'll say why." } },
    _none = { { id = "tp_none", text = "Can't help you there. If you can't put it in a pot, I've not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Duhng: cooking trainer at Grub's cookhouse.
---------------------------------------------------------------------------
P:NPC {
  key = "duhng", id = TODO_NPC("Duhng"), name = "Duhng", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "crossroads" }, temper = { "terse", "dry" }, values = { "craft", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Duhng does the cooking at Grub's hut east of the Crossroads and teaches it to anyone who can stand the heat. He says little, tastes everything, and has the look of an orc who has heard his employer talk about rat stew for too long.",
    third = "{name} met Duhng, the orc who cooks at Grub's and teaches cooking east of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Mind the pot. If you're here to learn, wash your hands, and if you're here to eat, sit." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "You cook. Taste this and tell me what it's missing. Don't say salt; Tarban always says salt." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Burn anything since?" },
    { id = "g_away", when = { away = 14 }, text = "Been a while. The pot's the same pot. Grub's the same Grub." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Bleed it where it falls, and bring it in before noon. I'll not buy a carcass that's sat in the sun." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fishing pole. If you get down to the coast at Ratchet, bring back anything that isn't oily. Grub won't eat it, but I will." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Duhng. I cook for Grub and I teach on the side. Out here that means making good food from tough meat, bad water and whatever a caravan dropped, and it can be done if you pay attention." },
        { id = "h_done", when = { questDone = TODO_QUEST("Dig Rat Stew") }, text = "Duhng. You're the one who fetched the rats. He's been unbearable since, and happier, so I suppose I should thank you." },
      },
      again = {
        { id = "h_again", text = "What else? I'm stirring." },
        { id = "h_again2", text = "Ask. Short, if you can." },
        { id = "h_again3", text = "Go on, then. It won't catch for a minute." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's worth cooking in the Barrens?", next = "meat" },
        { text = "You don't share Grub's love of rat, I take it.", next = "grub" },
        { text = "You and the baker argue over salt, I hear.", next = "tarban" },
        { text = "How did a cook end up teaching?", next = "teach" },
        { text = "I've come from Mulgore. We cook slower there.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll let you stir.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "me_default", text = "Plainstrider leg, roasted hard. Zhevra flank if it's young. Raptor's stringy, but the eggs are good, when you can get them without losing a hand. And there's a lizard out by the dry hills, the thunder kind, whose tail meat is the best thing in this whole dust bowl." } },
      choices = {
        { text = "What about the kodo?", next = "meat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat2 = {
      lines = { { id = "me2_default", text = "No. Not in this kitchen. The tauren hold them near sacred, and Tarban works ten paces from my pot. An orc down the road serves it and calls it plains roast. I've told him what I think. Meat's meat, but you don't cook a friend's kin under his nose." } },
      choices = {
        { text = "Respect for an ally matters more than a recipe.", next = "BACK", reply = "That's all it is. It costs me nothing, and it means something to him.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A cook shouldn't let sentiment narrow the pot.", next = "BACK", reply = "A cook who thinks that hasn't had to share a kitchen. Try it a year and tell me again.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grub = {
      lines = { { id = "gr_default", text = "I've cooked it for him forty ways. Stewed, spitted, in a crust. It's rat. He sees something in it I don't, something from the camps, and I don't argue with that. I just open the window." } },
      choices = {
        { text = "Then why stay on with him?", next = "grub2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grub2 = {
      lines = { { id = "gr2_default", text = "Because he pays on time and has never once told me how to cook, apart from the rat. And when I came down from Orgrimmar with nothing, he put a ladle in my hand before he asked my name. You don't walk away from that over a smell." } },
      choices = { { text = "Something else, Duhng.", next = "BACK" } },
    },
    tarban = {
      lines = { { id = "ta_default", text = "Every day. He says more, I say less. He's a baker; salt is half of what he's got to work with, so he thinks it's half of everything. He's wrong. His bread's the best I've eaten, though, so I let him be wrong loudly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "te_default", text = "Grunts kept coming in asking how I'd made a boar taste like something. I got tired of answering one at a time, so now I charge and they stand in a row. Half of them will never be cooks. All of them will eat better on the march, and that's worth my afternoon." } },
      choices = {
        { text = "A fed army fights. That's real service.", next = "BACK", reply = "It's the only kind I'm any good at. I'll take it.", fx = { align = { order = 1 } } },
        { text = "A grunt should fight, and leave cooking to cooks.", next = "BACK", reply = "Tell that to the grunt three days from a kitchen with a dead raptor and no idea. He'll learn or he'll go hungry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tn_default", text = "So Tarban says, at length. He's shown me the ash-baking and the pit roast. I'll admit the pit's better than a spit for anything tough. Don't tell him I said so. He's hard enough to work beside as it is." } },
      choices = { { text = "Not a word. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Taste it before you serve it. You'd think that didn't need saying." } },
    centaur = { { id = "tp_centaur", text = "They raided the hut. I stood behind the door with a cleaver. Nothing came through the door." } },
    ratchet = { { id = "tp_ratchet", text = "Spices come from there, when Grub will pay for them. Goblin prices. I use them a pinch at a time." } },
    oases = { { id = "tp_oases", text = "I used to draw water from the nearest one. It tastes green now. I boil everything." } },
    thrall = { { id = "tp_thrall", text = "I cooked for his column once, on the march. He ate last. I noticed that." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Grub; he'll have an opinion whether he knows or not." } },
  },
}

---------------------------------------------------------------------------
-- Tarban Hearthgrain: baker at Grub's cookhouse, kin to Moorane at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "tarban", id = TODO_NPC("Tarban Hearthgrain"), name = "Tarban Hearthgrain", title = "Baker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "gentle", "unhurried" }, values = { "craft", "kind" },
  notices = { "hunger", "race" },
  impression = {
    first = "Tarban Hearthgrain bakes outside Grub's hut east of the Crossroads, in an oven he built from Barrens clay. He will not be hurried by anyone, and the bread seems to agree with him.",
    third = "{name} met Tarban Hearthgrain, the tauren baker at Grub's cookhouse east of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you. The loaves want a little longer, but you are welcome to wait in the warmth." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You are up with the bakers. Good. The first loaf of the day is the best one, and few are awake to know it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to my oven. Then the bread did its work." },
    { id = "g_away", when = { away = 14 }, text = "It has been many bakings since I saw you. Sit, and I will find you a heel that is still warm." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A face from home. I have a little sweet-grass honey put by for kin, and I think the Earth Mother would count you as kin today." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 14 },
      text = "You are young to be walking the Barrens, and thin with it. Bread first, and then whatever brought you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tarban Hearthgrain. I bake for Grub's table and for the road, and I do it as my family has always done it, slowly, in ash and clay. The orcs think it a strange way to make bread until they have eaten some." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I am Tarban Hearthgrain, and I see flour in the creases of your hands. Then you know that bread cannot be commanded, only invited. Come and look at the oven." },
      },
      again = {
        { id = "h_again", text = "Ask, friend. The dough is resting, and so may we." },
        { id = "h_again2", text = "There is time. With bread, there is always time." },
        { id = "h_again3", text = "Yes? I am listening, and so is the oven." },
      },
      choices = {
        { text = "Let me see what's baked.", next = "BUSINESS" },
        { text = "Moorane at the Crossroads shares your name.", next = "moorane" },
        { text = "You built that oven out of the ground itself.", next = "oven" },
        { text = "Grub and Duhng seem loud company for a baker.", next = "grub" },
        { text = "What grain grows in a land this dry?", next = "grain" },
        { text = "I miss Mulgore bread. Is yours the same?", next = "tauren", when = { race = "Tauren" } },
        { text = "Earth Mother warm your oven, Tarban.", next = "END" },
      },
    },
    moorane = {
      lines = { { id = "mo_default", text = "She is my kinswoman, and the better baker, though she will tell you otherwise. We came from Mulgore together with one crock of starter between us. She bakes for the garrison inside the walls, and I bake out here, and we trade a spoonful of the starter each new moon so that neither crock forgets the other." } },
      choices = {
        { text = "Why not bake side by side?", next = "moorane2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moorane2 = {
      lines = { { id = "mo2_default", text = "Because two bakers at one oven is one baker and one critic. We love each other better with a palisade between us. And the Crossroads needs feeding on both sides of its wall. The grunts go to her, and the drivers and wanderers who do not care to pass the gate come to me." } },
      choices = { { text = "Something else, Tarban.", next = "BACK" } },
    },
    oven = {
      lines = { { id = "ov_default", text = "I did. The red clay by the dry wash holds heat as well as any in Mulgore, once you learn how wet to work it. I built three that cracked before this one. The earth here is not unkind, but it wishes to be asked properly, and I had to learn its manner." } },
      choices = {
        { text = "How do you ask the earth properly?", next = "oven2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oven2 = {
      big = true,
      lines = { { id = "ov2_default", text = "You take only from where the wash has already cut, and you fill the hole with ash and bone when you are done. You fire the first loaf for the Earth Mother and leave it on the ground. Duhng says the jackals eat it. I say the jackals are hers as well." } },
      choices = {
        { text = "Giving back the first of anything is a good custom.", next = "BACK", reply = "It keeps a baker humble, which is no small thing. You are welcome at my oven any morning.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A loaf on the ground is a loaf wasted.", next = "BACK", reply = "So Duhng tells me, each time. And yet the fourth oven did not crack. I draw no conclusion; I only observe.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grub = {
      lines = { { id = "gr_default", text = "They are loud, and they are good. Grub shouts about rats and Duhng mutters about salt, and neither has ever let a hungry traveler leave the door unfed. I have known quiet people who were less kind. I bake outside, where the noise is softened by a wall, and all is well." } },
      choices = {
        { text = "Is it true you struck a centaur with a baking stone?", next = "grub2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grub2 = {
      lines = { { id = "gr2_default", text = "Ah. They told you. It is true, and I am not proud of it. He had put his head through the window above my resting dough. I did not think; the stone was in my hand. I have asked the Earth Mother's pardon, and I have also kept the stone." } },
      choices = {
        { text = "Defending your hearth needs no pardon.", next = "BACK", reply = "Perhaps not. But I would rather ask and not need it than need it and not ask.", fx = { align = { honor = 1 } } },
        { text = "A baker who can swing a stone should swing it more.", next = "BACK", reply = "No, friend. Once was enough to learn that I can. I hope never to learn it better.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grain = {
      lines = { { id = "gn_default", text = "Little enough. There is a hard red grain the tribes have always gathered wild near the oases, and I mill that with flour the caravans bring down from Mulgore. Since the oases changed, the wild grain grows too tall and tastes of nothing, so I use less of it each season." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
    tauren = {
      lines = { { id = "tn_default", text = "As near as I can make it. The water is harder and the grain is drier, and so the crust is thicker than my mother's. But the starter is the same that her mother fed, and when you break a loaf open you will smell the high grass, a little. Take one, and tell me whether I am fooling myself." } },
      choices = { { text = "I'll tell you honestly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "Bread is her gift twice over, once in the grain and once in the fire. I try to add nothing to it but patience." } },
    centaur = { { id = "tp_centaur", text = "My grandparents baked on flat stones they could carry at a run. I think of that whenever I am tempted to complain about this oven." } },
    cairne = { { id = "tp_cairne", text = "Because of Cairne, a tauren can build an oven and expect to use it next year. I do not think the young ones know what a wonder that is." } },
    oases = { { id = "tp_oases", text = "The grain near them grows wrong now, tall and hollow. Tonga Runetotem asked me for a sheaf of it, and looked grave when I gave it." } },
    advice = { { id = "tp_ad", text = "Do not open the oven to look. The bread knows when you doubt it." } },
    _none = { { id = "tp_none", text = "I know flour and fire, friend. That is beyond both." } },
  },
}

---------------------------------------------------------------------------
-- Tinkerwiz: goblin engineering trainer, Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "tinkerwiz", id = TODO_NPC("Tinkerwiz"), name = "Tinkerwiz", title = "Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ratchet" }, temper = { "brisk", "smug" }, values = { "craft", "greedy" },
  notices = { "craft", "class" },
  impression = {
    first = "Tinkerwiz teaches engineering in Ratchet to anyone with coin and most of their fingers. He bills by the lesson, itemises the breakages, and considers a student who walks away unsinged to have been undercharged.",
    third = "{name} met Tinkerwiz, the goblin engineering trainer in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, watch the bench, that one's primed. Tinkerwiz, engineering instruction, first consultation's free and short. What do ya need?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "A practitioner! Lemme see the hands. Nine and a half, not bad, not bad at all. You're either good or lucky, and I can teach either." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and ya didn't bring a claim form. I like that in a customer. What's the job?" },
    { id = "g_away", when = { away = 14 }, text = "Long time, friend! Prices went up while you were gone. Materials, ya understand, and also I felt like it." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ya dig your own copper? Smart. I'd buy it off ya, but I'd have to mark it up before I sold it back, and we'd both feel silly." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, huh. Listen, no offence, but everything you do, I can do with a spring and a blasting cap, and mine don't need a nap after." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Tinkerwiz. I teach folks to build things that go, things that blow, and things that do both in the right order, which is the tricky part. Ratchet's the best town on the coast for it, seein' as nobody here minds a little smoke." },
      },
      again = {
        { id = "h_again", text = "What else? Clock's runnin', figuratively, and also there's an actual clock." },
        { id = "h_again2", text = "Sure, ask. Talkin's the one thing I don't charge for, yet." },
        { id = "h_again3", text = "Go on, pal. I got a fuse burnin', but it's a long one." },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Ratchet seems full of people building things.", next = "ratchet" },
        { text = "What does a beginner blow up first?", next = "first" },
        { text = "Do you get students from both factions?", next = "both" },
        { text = "I'm ready to specialise. Goblin or gnomish?", next = "school", when = { profession = { name = "Engineering", min = 150 } } },
        { text = "My people built machines before yours had thumbs.", next = "gnome", when = { race = "Gnome" } },
        { text = "A tauren's hands are big for fine work, I fear.", next = "tauren", when = { race = "Tauren" } },
        { text = "Keep your eyebrows, Tinkerwiz.", next = "END" },
      },
    },
    ratchet = {
      lines = { { id = "ra_default", text = "It is, and that's Gazlowe's doin'. He's an engineer first and a boss second, so the whole town runs like a workshop. Sputtervalve's got his laboratory, Bigglefuzz has the crane, Wrenix has that apparatus of his, and I train the ones who are gonna replace all of us when we finally miscount a fuse." } },
      choices = {
        { text = "Who's the best engineer in town?", next = "ratchet2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ratchet2 = {
      lines = { { id = "ra2_default", text = "Officially? Gazlowe, on account of he signs the permits. Between us? Sputtervalve's got the brains, I got the hands, and Gazlowe's got the one talent neither of us got, which is gettin' paid for it. He built Orgrimmar's waterworks for the orcs and came out ahead. That's genius, pal." } },
      choices = { { text = "Something else, Tinkerwiz.", next = "BACK" } },
    },
    first = {
      lines = { { id = "fi_default", text = "Themselves, a little. I start 'em on rough blasting powder and a copper tube, and I stand over there. Ya learn more from one small bang ya caused than from a week of me talkin'. Then we do it again, and I show 'em what they shoulda done, and I bill for both." } },
      choices = {
        { text = "That sounds like a dangerous way to teach.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      big = true,
      lines = { { id = "fi2_default", text = "It's the safe way, friend! The dangerous way is a book. A fella reads about powder, thinks he knows powder, and the first real charge he sets is a big one. My students got a healthy fear by the end of day one, and I never lost one yet. Singed, sure. Lost, never." } },
      choices = {
        { text = "A small burn early beats a big one later.", next = "BACK", reply = "That's the whole curriculum in one line. I oughta put it on the sign.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Careful study first. Explosions can wait.", next = "BACK", reply = "Sure, sure, and there's a nice gnome in Ironforge who'll teach ya that way. Takes nine years. I got ya blastin' by lunch.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = { { id = "bo_default", text = "Sure do. Orcs, trolls, dwarves, the odd human who got lost. The Cartel's neutral, and so's my invoice. Only rule on my bench is ya don't use what I taught ya inside Ratchet, 'cause the bruisers got no sense of humour and I got a lease." } },
      choices = {
        { text = "Neutral ground is worth keeping. A fair rule.", next = "BACK", reply = "Right? Blow each other up all ya like, just do it past the town sign. That's civilisation.", fx = { align = { light = 1 } } },
        { text = "So you sell both sides the means to kill each other.", next = "BACK", reply = "I sell both sides a hobby, pal. What they do with a hobby is between them and their conscience.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    school = {
      lines = { { id = "sc_default", text = "Now we're talkin' real money. I can write ya a letter for either, 'cause a referral's a referral. Goblin school's down in Gadgetzan with Nixx Sprocketspring, and it's bombs, rockets, and results. The gnome school's fiddly gizmos that work sometimes. I know which I'd pick, but I get the fee both ways." } },
      choices = { { text = "I'll think on it. Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Whoa, whoa, fightin' words, short stuff! Fine, your people got there first, I'll give ya that. Ya also irradiated your own capital. We may be loud, pal, but Undermine's still got a roof. Now ya wanna learn somethin', or ya wanna argue? I charge for both." } },
      choices = { { text = "Learn. I'll argue for free. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Hey, don't sell yourself short, big guy, so to speak. Had a tauren through here last year, built the cleanest gearbox I ever saw, used a splinter for a screwdriver. Patience beats small fingers. Ya got the patience, I got the tiny tools, and I rent 'em reasonable." } },
      choices = { { text = "Then I'll rent the tools. Something else.", next = "BACK" } },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_cartel", text = "My employers, in a loose and deniable way. They keep the peace, I keep the receipts." } },
    ratchet = { { id = "tp_ratchet", text = "Home, pal. Smells like salt and solder, and everybody's got somethin' cookin' that ain't food." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Where ya go when ya outgrow me. Nixx runs the goblin school there, and the desert's good for testin' the big stuff." } },
    venture_company = { { id = "tp_venture", text = "Hacks. They build cheap, run it till it breaks, and bill the pilot. No pride of workmanship whatsoever." } },
    booty_bay = { { id = "tp_bb", text = "Fancy town, fancy prices. I trained there. Came up here 'cause the rent's a third and nobody checks your references." } },
    advice = { { id = "tp_ad", text = "Count your fingers before and after. If the numbers match, it was a good day." } },
    _none = { { id = "tp_none", text = "Outside my field, pal. If it don't have a fuse or a flywheel, try Gazlowe." } },
  },
}

---------------------------------------------------------------------------
-- Traugh: blacksmithing trainer at the Crossroads forge.
---------------------------------------------------------------------------
P:NPC {
  key = "traugh", id = TODO_NPC("Traugh"), name = "Traugh", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "blacksmith", tier = "service",
  communities = { "crossroads" }, temper = { "gruff", "tireless" }, values = { "craft", "dutiful" },
  notices = { "kit", "craft" },
  impression = {
    first = "Traugh keeps the forge at the Crossroads burning and teaches smithing between repairs. The Barrens breaks more gear than he can mend, and he mends it anyway, one dented plate after another.",
    third = "{name} met Traugh, the orc blacksmith who teaches his trade at the Crossroads forge.",
  },
  greetings = {
    { id = "g_default", text = "Put it on the bench if it's broken, and stand clear if it isn't. I've a line of grunts waiting on that anvil." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. Good, pick up those tongs and hold this while we talk. I can use the second pair of hands." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. What did the Barrens do to it this time?" },
    { id = "g_away", when = { away = 14 }, text = "Haven't seen you in weeks. I've mended the whole east watch twice over since. Nothing changes here but the dents." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Spirits, look at the state of that. Off with it. I'll not have you walk out of the Crossroads wearing scrap with my forge ten paces away." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've a pick. If you're finding tin out there, I'll take all you can carry, because Orgrimmar sends me half what I ask for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Traugh. I'm the smith here, and when there's a spare hour I teach. The Crossroads sits in the middle of four fights at once, and every one of them ends up on my bench by nightfall." },
        { id = "h_low", when = { maxLevel = 15 }, text = "Traugh. You're new to the Barrens, so here's a lesson before any other. Whatever you're wearing won't last out here as long as you think, and it's cheaper to see me early than late." },
      },
      again = {
        { id = "h_again", text = "What else? Talk over the hammer, I can hear." },
        { id = "h_again2", text = "Ask it. This plate needs another heat anyway." },
        { id = "h_again3", text = "Go on. I've been at this since dawn and could use the excuse." },
      },
      choices = {
        { text = "Teach me smithing.", next = "BUSINESS" },
        { text = "What breaks the most gear out here?", next = "breaks" },
        { text = "Your forge looks short of everything.", next = "short" },
        { text = "Nargal sells arms a few steps from your anvil.", next = "nargal" },
        { text = "I'm far enough along. Where do I learn more?", next = "further", when = { profession = { name = "Blacksmithing", min = 125 } } },
        { text = "A warrior ought to know how his own plate is made.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll leave you to the anvil.", next = "END" },
      },
    },
    breaks = {
      lines = { { id = "br_default", text = "Quilboar, for sheer numbers. Those thorn-spears don't cut, they punch, and they leave a hole you can't hammer out. Centaur lances bend a shield double. And the raptors do something to leather that I'd not have believed, but that's Jahan's trouble and not mine." } },
      choices = {
        { text = "Can you tell who's winning from the repairs?", next = "breaks2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks2 = {
      lines = { { id = "br2_default", text = "Better than Thork's reports can. When the damage is all on the front of the plate, we're pushing them. When it starts showing on the backplates and the shield rims, we're being pushed. This last month I've been mending a lot of backplates." } },
      choices = {
        { text = "Have you told Thork that?", next = "breaks3" },
        { text = "Something else, Traugh.", next = "BACK" },
      },
    },
    breaks3 = {
      big = true,
      lines = { { id = "br3_default", text = "I told him. He looked at the pile for a while and said to keep it between us, because the grunts fight better thinking they're winning. I don't like it. But he's held this town through three bad seasons, and I've only held a hammer." } },
      choices = {
        { text = "A commander must sometimes guard his soldiers' hearts.", next = "BACK", reply = "That's how he put it, more or less. I'll keep mending and keep quiet, and hope he's right.", fx = { align = { order = 1 } } },
        { text = "Grunts deserve the truth about what they're facing.", next = "BACK", reply = "That's what my gut says. They're not fools; half of them have counted the backplates themselves.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = { { id = "sh_default", text = "It is. Coal comes by caravan when the Kolkar let it, iron comes from Orgrimmar when they remember us, and Hraq sells me flux at a price that'd make a goblin blush. I've been melting down quilboar spearheads for stock. It's poor metal, but there's no end to the supply." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nargal = {
      lines = { { id = "na_default", text = "He does, and good ones. Nargal Deatheye sells them new and I keep them alive, and neither of us has time to do the other's work. He's got one eye and sees a flaw in a blade faster than I do with two, which I've stopped finding funny." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    further = {
      lines = { { id = "fu_default", text = "Not from me, past a point. I'm a field smith; I know mending and plain honest steel. For the fine work, go to Saru Steelfury in Orgrimmar's Valley of Honor, and when she's done with you, the masters at the Burning Anvil will ask you to choose between armor and arms." } },
      choices = { { text = "Orgrimmar, then. Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "wa_default", text = "He should, and few do. Come round the bench. See this seam? That's where it'll fail, every time, so that's the side you don't give them. Ten minutes at a forge will teach a warrior more about his armor than ten years of wearing it." } },
      choices = {
        { text = "Knowing my gear's limits is part of fighting well.", next = "BACK", reply = "It's most of living through a fight. Come back when I'm less busy, and I'll show you the rest.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather trust it and think about the enemy.", next = "BACK", reply = "Then trust it on the side without the seam. That much you can remember.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "Kolkar. They fight from the gallop, and whatever they hit, they hit with a horse's weight behind it. I've seen a shield folded like a blanket." } },
    quilboar = { { id = "tp_quilboar", text = "Their spearheads are soft iron with thorn bound round it. Bad metal. I must have melted down a thousand." } },
    thrall = { { id = "tp_thrall", text = "The Warchief put the Crossroads here because every road meets at it. I only wish he'd put a second smith here as well." } },
    venture_company = { { id = "tp_venture", text = "Goblin machines in the north. The grunts bring me pieces. It's good steel, wasted on bad work." } },
    advice = { { id = "tp_ad", text = "Mend it when it's dented, not when it's holed. A dent costs you copper and a hole costs you blood." } },
    _none = { { id = "tp_none", text = "Couldn't say. If it's not on my bench, I've not had time to think about it." } },
  },
}

---------------------------------------------------------------------------
-- Krulmoo Fullmoon: leatherworking trainer, Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "krulmoo", id = TODO_NPC("Krulmoo Fullmoon"), name = "Krulmoo Fullmoon", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "taurajo" }, temper = { "patient", "warm" }, values = { "craft", "wise" },
  notices = { "craft", "class" },
  impression = {
    first = "Krulmoo Fullmoon teaches leatherworking at Camp Taurajo, where the hunters bring in more hides than any other camp in the Barrens. He works slowly and talks to the leather under his breath, and he is in no hurry to explain why.",
    third = "{name} met Krulmoo Fullmoon, the tauren who teaches leatherworking at Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome. Mind the frames, the hides on them are drying, and they do not like to be brushed against." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "Your thumbs are stained with tannin, friend. Then sit with me. I have a hide here that is being stubborn, and I would hear another worker's thought on it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the frames. Good. The leather has been asking after you." },
    { id = "g_away", when = { away = 14 }, text = "Many suns have crossed since you were here. The hides I was scraping then are boots now, and walking somewhere." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and it has been used with care; I can see that from the sheath. The beasts are grateful for a clean hand, and so am I." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Jorn Skyseer teaches your kind here, and what his students bring me is always well taken. I hope you have learned the same way." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Krulmoo Fullmoon. I teach the working of hides, as my mother taught me and hers taught her. Taurajo has always been a hunters' camp, and where there are hunters there must be someone to honor what they bring home." },
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Krulmoo Fullmoon, and I greet one who has worn the beast's shape. You will know better than most that a hide was once someone's whole skin. I try to work as though it could still feel my hands." },
      },
      again = {
        { id = "h_again", text = "Ask, friend. The leather is patient, and I have learned from it." },
        { id = "h_again2", text = "There is more you would know. I am glad of it." },
        { id = "h_again3", text = "Speak. My hands know this work well enough without my ears." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "You speak to the hides as you work.", next = "speak" },
        { text = "What hides come into Taurajo?", next = "hides" },
        { text = "The kodo is sacred to your people, yet you work its hide.", next = "kodo" },
        { text = "What do the orcs make of your way of working?", next = "orcs" },
        { text = "I skin what I hunt. What do I do wrong?", next = "skinner", when = { profession = "Skinning" } },
        { text = "Our mothers taught the same songs over the frames.", next = "tauren", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Krulmoo.", next = "END" },
      },
    },
    speak = {
      lines = { { id = "sp_default", text = "I do. I tell each one what it will become. This one a quiver for a young hunter, that one a drumhead for the camp. A beast gave its life without being asked, and the least I can do is tell it that it was not for nothing." } },
      choices = {
        { text = "Does it change the work?", next = "speak2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak2 = {
      big = true,
      lines = { { id = "sp2_default", text = "It changes the worker. If I have promised a hide that it will be a good quiver, I cannot then make a poor one. The orcs have their oaths to their warchief. I have a hundred small oaths drying on those frames, and I keep them one at a time." } },
      choices = {
        { text = "A promise to the dead keeps the living honest.", next = "BACK", reply = "That is well put. I will say it to my students, and I will tell them a traveler gave it to me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's only leather. The beast is past caring.", next = "BACK", reply = "Perhaps it is. But I am not past caring, and it is my hands that do the work.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Zhevra and plainstrider, mostly, and the great cats when a hunter is skilled enough. Thunder lizard from the dry hills, which takes dye beautifully. And raptor, which Yonada sells on to the caravans, because the orcs prize it for the way it turns a blade." } },
      choices = {
        { text = "Which is the hardest to work?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      lines = { { id = "hi2_default", text = "The thunder lizard. There is still storm in the skin for days after, and it will bite a careless hand with a spark. I leave it staked in the open through one rain, if rain can be had, so that the sky may take back what is the sky's. Then it works as gently as calfskin." } },
      choices = { { text = "Something else, Krulmoo.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "ko_default", text = "Because it is sacred. We take only the hide of a kodo that has gone to the graveyard to die in its own time, and we use every part. The great drums are kodo, and the tents of the elders. To let such a gift rot on the plain would be the true dishonor." } },
      choices = {
        { text = "Using a gift fully is how one honors it.", next = "BACK", reply = "So we are taught. I am glad it is understood beyond the tribes.", fx = { align = { light = 1 } } },
        { text = "And the hunters who don't wait for the graveyard?", next = "BACK", reply = "They are known to us, and their hides are not welcome on my frames. Some coin is too heavy to carry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "They laughed, at first, kindly enough. Then a grunt from the wall asked whether I would say the words over the hide of his wolf, who had died of age. I did. Now two or three of them come when I am scraping and stand quietly, and I do not ask them why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skinner = {
      lines = { { id = "sk_default", text = "Most likely you hurry. Let the beast cool a little, and make the first cut along the belly where the hair parts on its own. If the knife is fighting you, you are cutting where the hide does not wish to open. It will show you the way, if you look before you cut." } },
      choices = { { text = "Look before I cut. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Then sing with me a moment, softly. I have had no one to take the second part since my sister went north to Thunder Bluff, and a scraping song with one voice is a lonely thing." } },
      choices = { { text = "I remember the second part. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },
  topics = {
    earth_mother = { { id = "tp_em", text = "Every hide on my frames was hers before it was mine. I am only the one who is trusted with it for a while." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback wear hides they have not cured, and it shows. I pity a people who were never taught to finish what they take." } },
    cairne = { { id = "tp_cairne", text = "The tent of the High Chieftain on Thunder Bluff is kodo hide, and my mother's hands were among those that stitched it. I am prouder of that than of anything I have made." } },
    centaur = { { id = "tp_centaur", text = "They leave their kills where they fall and take only the meat. It is a small thing to hate a people for, and yet it is what I remember of them." } },
    advice = { { id = "tp_ad", text = "Tell the hide what it will be before you begin. You will find you cut more carefully." } },
    _none = { { id = "tp_none", text = "That is beyond the frames, friend, and so beyond me." } },
  },
}
