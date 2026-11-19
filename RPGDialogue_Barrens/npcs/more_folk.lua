-- More of the Barrens: Kelm Hargunth (the Warsong Outriders' supply officer by the road to Warsong Gulch),
-- and three Crossroads traders: Halija Whitestrider (clothier), Kalyimah Stormcloud (bags) and
-- Larhka (drink). Added later: Menara Voidrender, Ruga Ragetotem, Kirge Sternhorn, Wizzlecrank's Shredder,
-- Grub, Duhng, Tarban Hearthgrain, Tinkerwiz, Traugh and Krulmoo Fullmoon. Second pass: Hraq, Kil'hala,
-- Tari'qa (Crossroads), Kelsuwa, Yonada, Sanuye Runetotem, Dranh, Mahani, Gahroot (Camp Taurajo), Zikkel,
-- Ranik, Vexspindle, Zizzek, Gagsprocket, Vazario Linkgrease, Acolytes Fenrick, Magaz and Wytula (Ratchet),
-- Waldor and Kalldan Felmoon (above the Wailing Caverns) and Feegly the Exiled (Bael Modan).
-- Voices: bibles/more_folk.md
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
    first = "He measures everyone by what they've done against the night elves.",
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
    first = "Her stall smells of wool and Mulgore grass.",
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
    first = "He seems to know everything that passes through town.",
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
    first = "Some of what he pours might strip paint.",
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
        { text = "I'm told your orbs can hold a demon. I may need one.", next = "orbs", when = { class = "WARLOCK" } },
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
        { id = "h_cook", when = { profession = "Cooking" }, text = "Duhng. You cook already, so I'll skip the part about which end of the knife to hold. Tell me what you can't get right, and we'll start there." },
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
    internment = { { id = "tp_internment", text = "I learned to mend in the camps, with a rock for a hammer. A real anvil still feels like a gift, even on the bad days." } },
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
        { text = "A hide is a hide, however the beast came to die.", next = "BACK", reply = "Not on my frames, friend. The hunters who will not wait for the graveyard are known to us, and some coin is too heavy to carry.", fx = { align = { light = -1 } } },
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

---------------------------------------------------------------------------
-- Hraq: blacksmithing supplies at the Crossroads forge.
---------------------------------------------------------------------------
P:NPC {
  key = "hraq", id = TODO_NPC("Hraq"), name = "Hraq", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "shrewd", "unbothered" }, values = { "practical", "profit" },
  notices = { "craft", "purse" },
  impression = {
    first = "Hraq sells flux, coal and hammers beside the Crossroads forge and prices them by how hard the last caravan was to get through. He takes the smiths' grumbling as proof that he has it about right.",
    third = "{name} met Hraq, who sells blacksmithing supplies at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Flux, coal, hammers and grinding stones. The price is the price, and before you ask, Traugh already tried." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, good. You'll complain about what I charge and then you'll pay it, the same as the rest. Let's skip to the paying." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Run out of flux, or run out of patience with someone else's prices?" },
    { id = "g_away", when = { away = 14 }, text = "It's been some weeks. Coal's gone up since, and I'll tell you why if you've time to hear about centaur." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You dig your own ore, I see. I'll buy what you can spare, and I'll pay fairly, because the Barrens tin is the one thing here I can't get enough of." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You can't afford me today, and I don't sell on promises. Go and kill something that carries coin, and come back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hraq. Traugh works the iron at the Crossroads, and I sell him and everyone else what the iron needs. Every sack of coal on this floor came across the Barrens by cart, past Kolkar and quilboar both, and that journey is what you are paying for." },
      },
      again = {
        { id = "h_again", text = "What else? I've a tally to finish, but ask." },
        { id = "h_again2", text = "Go on. Talk costs nothing, which makes it the only thing here that does." },
        { id = "h_again3", text = "Ask it, then. The cart isn't due until tomorrow." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why do your prices run so high?", next = "prices" },
        { text = "Traugh says you'd make a goblin blush.", next = "traugh" },
        { text = "Where does the Crossroads get its coal?", next = "coal" },
        { text = "I've tin and copper to sell. Who buys ore here?", next = "ore", when = { profession = "Mining" } },
        { text = "I'll be going, Hraq.", next = "END" },
      },
    },
    prices = {
      lines = { { id = "pr_default", text = "Because one cart in four doesn't arrive. The Kolkar hit the northern road, the Razormane hit the eastern one, and the drivers want double pay for either. I spread the loss across what does get through, and I've not grown fat on it, whatever they tell you at the forge." } },
      choices = {
        { text = "Couldn't Thork spare guards for the carts?", next = "prices2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prices2 = {
      lines = { { id = "pr2_default", text = "He spares what he can, and it is never enough, because he has a town to hold with half the grunts it needs. So I've started paying sellswords out of my own purse to ride with the coal. That goes into the price as well." } },
      choices = {
        { text = "The smiths arm the garrison. Shouldn't they pay less?", next = "prices3" },
        { text = "Something else, Hraq.", next = "BACK" },
      },
    },
    prices3 = {
      big = true,
      lines = { { id = "pr3_default", text = "Traugh asks me that once a week, and louder each time. He says a merchant who profits from a town under siege is no better than the centaur. I say that if I sell at a loss, there'll be no coal at all by winter, and then let him forge with his opinions." } },
      choices = {
        { text = "The town's defence comes before any merchant's margin.", next = "BACK", reply = "Then find me a driver who'll haul coal for honor. I'll hire him tomorrow, and drop the price the day after.", fx = { align = { light = 1 } } },
        { text = "You keep the coal coming. That is worth its price.", next = "BACK", reply = "Finally, someone who can count. Say it to Traugh on your way past, though he'll not thank you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    traugh = {
      lines = { { id = "tr_default", text = "He would say that. Traugh is the best field smith between here and Orgrimmar, and he has never once looked at a ledger. We shout at each other every morning and share a fire every night, and I'd not trade him for a quieter customer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    coal = {
      lines = { { id = "co_default", text = "From Orgrimmar, by way of the Southfury bridge, and lately a little from the goblins in Ratchet when the northern road is cut. The Barrens itself has no coal, only grass and things that want to eat you. We burn dung in the cook fires and save every lump for the forge." } },
      choices = {
        { text = "And the flux and stones?", next = "coal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal2 = {
      lines = { { id = "co2_default", text = "The flux is goblin work, and the grinding stones I cut myself from the grey rock south of town. That's the one thing I sell that I can honestly call cheap, so naturally nobody ever thanks me for it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ratchet" } } } },
    },
    ore = {
      lines = { { id = "or_default", text = "I do, and Traugh does, and we'll bid against each other if you play it well. Tin is what the forge is short of. Bring it smelted and you'll get a better price from either of us, since nobody here has the charcoal to waste on raw stone." } },
      choices = { { text = "Smelted tin, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy your flux before you need it. The day you need it is the day the cart is late." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar have cost me three carts this season. They don't even take the coal, they only burn the wagon and ride off." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane take the cart horses and leave the load. I've bought my own coal back off the roadside twice." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins sell everything I need and know exactly how badly I need it. I respect them for it, and it costs me dearly." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wants the Crossroads held. I'd like him to want the road to it held as well." } },
    _none = { { id = "tp_none", text = "I don't know. If it isn't in my ledger, I've not given it thought." } },
  },
}

---------------------------------------------------------------------------
-- Kil'hala: tailoring trainer at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "kilhala", id = TODO_NPC("Kil'hala"), name = "Kil'hala", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "crossroads" }, temper = { "particular", "easy" }, values = { "craft", "proud" },
  notices = { "craft", "kit" },
  impression = {
    first = "Kil'hala teaches tailoring at the Crossroads, a Darkspear with pins stuck through his sleeve and a low opinion of how orcs dress. He sews as carefully for a grunt's tunic as for a chieftain's robe.",
    third = "{name} met Kil'hala, the troll tailoring trainer at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Hold still, mon, let me look at dat seam. Who sewed dis for you, a kodo? Come, sit, I teach you to do better." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "Ah, you sew. Show me your hands. Good, you got de needle scars, so you been doing it and not just talking." },
    { id = "g_back", when = { metBefore = true }, text = "You be back. Let me see what you made since, and don't hide de bad ones." },
    { id = "g_away", when = { away = 14 }, text = "Long time, mon. I thought maybe de Barrens wore you out like it wears out everything I sew." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at de state of you. Dat's not armor any more, dat's a collection of holes. Traugh for de metal, and de rest you bring to somebody who sews." },
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "A hide worker. We be cousins in trade, you and me, only my cloth doesn't bleed on de table first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Kil'hala. I teach de cutting and de sewing: linen first, den wool, den whatever you be clever enough to find. De Barrens is hard on cloth, mon, all sun and thorns, so a tailor here learns to sew a thing twice or not bother." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I can talk wit' pins in my mouth." },
        { id = "h_again2", text = "Ask. Dis hem's going nowhere." },
        { id = "h_again3", text = "Go on. I got an eye on de needle and an ear for you." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "What does a troll tailor make of orc clothing?", next = "orcs" },
        { text = "Where do you get cloth out here?", next = "cloth" },
        { text = "A Darkspear is a long way from the sea here.", next = "far" },
        { text = "I've outgrown linen. What do I sew next?", next = "wool", when = { profession = { name = "Tailoring", min = 75 } } },
        { text = "Mind your pins, Kil'hala.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "Ha! I think dey dress like dey be expecting a fight in de next breath, which, to be fair, dey are. Everything square, everything brown, straps on top of straps. I asked a grunt once if he'd like a bit of colour and he looked at me like I offered him poison." } },
      choices = {
        { text = "Have you converted any of them?", next = "orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      lines = { { id = "or2_default", text = "One. Sergra Darkthorn let me line her cloak in red, where nobody sees it but her. She said a warrior doesn't need it. I said nobody needs it, mon, dat's de point of it. She wears it every day now." } },
      choices = {
        { text = "Does fine work matter in a town under threat?", next = "orcs3" },
        { text = "Something else, Kil'hala.", next = "BACK" },
      },
    },
    orcs3 = {
      big = true,
      lines = { { id = "or3_default", text = "Thork asked me dat same thing. He'd have me sewing nothing but bandages and bedrolls till de Kolkar be gone. I do my share of dose. But I told him, a people dat only makes what it needs to survive has already half lost." } },
      choices = {
        { text = "You're right. Beauty is part of what's defended.", next = "BACK", reply = "Dat's it, mon. We lost de isles and kept our songs, and de songs be why we're still Darkspear.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Thork is right. Bandages first, finery after the war.", next = "BACK", reply = "Mm. Dere's always a war, though, dat's de trouble wit' waiting. But you're not wrong, and I'll roll some more linen tonight.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Linen comes off de quilboar and de centaur, if you don't mind where it's been, and I boil it. Wool de caravans bring. Wrahk sells de thread and dyes, and Halija sells what's already made, so between de three of us dis town be clothed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "fa_default", text = "I am, and I feel it. Sen'jin has de sea wind, and here de air sits on you like a wet hide dat somebody dried. But de Warchief asked for craftsmen to hold dis town, and a Darkspear pays what he owes." } },
      choices = {
        { text = "Do you mean to go back?", next = "far2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far2 = {
      lines = { { id = "fa2_default", text = "When I've taught someone here well enough to take my place. I got two orcs and a tauren girl who can turn a hem now. Give me another year, and I'll be on a beach wit' my feet in de water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wool = {
      lines = { { id = "wo_default", text = "Wool, and after dat silk, if you can face de spiders. Wool be heavier and it forgives less, so slow your stitch. When you've got past what I know, go to Magar in Orgrimmar, and tell him Kil'hala said your seams are straight." } },
      choices = { { text = "Slow the stitch. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Sew it twice, mon. De second seam be de one dat holds when de first one's thinking about it." } },
    centaur = { { id = "tp_centaur", text = "Dey wear harness and nothing else. Good linen in de harness, though, I'll give dem dat." } },
    echo_isles = { { id = "tp_isles", text = "My mother dyed cloth dere wit' a blue shell you can't find on dis coast. I've looked." } },
    thrall = { { id = "tp_thrall", text = "He dresses plain for a chief. Black plate and a wolf skin. I'd not change it, it suits what he is." } },
    quilboar = { { id = "tp_quilboar", text = "Dey weave thorn into everything dey wear. It's clever, and it's murder to unpick." } },
    _none = { { id = "tp_none", text = "Can't say, mon. If it don't hang on a body, I've not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Tari'qa: trade supplies by the inn at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "tariqa", id = TODO_NPC("Tari'qa"), name = "Tari'qa", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "watchful", "dry" }, values = { "practical", "patient" },
  notices = { "craft", "race" },
  impression = {
    first = "Tari'qa sells trade supplies along the wall of the Crossroads inn and counts everyone who comes through the gates. He says a trader learns more about a war from what people buy than a scout learns from a hilltop.",
    third = "{name} met Tari'qa, who sells trade supplies beside the inn at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Thread, vials, salt, spices and tools. Take your time, mon, de shade's free and I'm not going anywhere." },
    { id = "g_craft", when = { profession = { "Tailoring", "Alchemy", "Cooking", "Leatherworking", "Engineering", "Blacksmithing" } }, text = "You work a trade, I can see it. Good. Tell me which, and I'll tell you what everybody else in your trade bought dis week." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I marked you coming in de east gate, and you look worse dan when you left." },
    { id = "g_away", when = { away = 14 }, text = "Been a while. I'd stopped counting you among de living, mon, no offence meant." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people buy salt and spice and almost nothing else. I asked Tonga Runetotem why, and he said de land gives de rest, which I thought was a fine answer." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook. Den you want de hot spices, for de crispy lizard tail Duhng teaches. Dey sell fast, so don't dawdle." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Tari'qa, dat be me. Barg beside me sells what travellers carry, and I sell what makers use. I sit against dis wall from dawn, and everyone who comes to de inn walks past my mat, so dere's little in de Crossroads I don't see." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I'm only sitting." },
        { id = "h_again2", text = "Ask. I see a lot from dis mat." },
        { id = "h_again3", text = "Go on. De gate's quiet for de moment." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do you learn from what people buy?", next = "buy" },
        { text = "You watch the gates as closely as the guards.", next = "gates" },
        { text = "Who are your neighbours along this wall?", next = "wall" },
        { text = "I need vials. The oases herbs are piling up.", next = "vials", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "Keep watching, Tari'qa.", next = "END" },
      },
    },
    buy = {
      lines = { { id = "bu_default", text = "Everything. When de grunts buy thread, dere's been a fight and dey be mending. When dey buy vials, dere's going to be one. And when Apothecary Helbrim buys every vial I have in a morning, mon, I don't ask, and I move my mat upwind." } },
      choices = {
        { text = "What have they been buying lately?", next = "buy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy2 = {
      lines = { { id = "bu2_default", text = "Bandage linen, and more of it every week. Thork's people go north against de Kolkar and west to de oases and come back cut up. Nobody's said de word siege out loud. But I've sold out of thread three times dis month, and dat never happened before." } },
      choices = {
        { text = "Have you told Thork what you see?", next = "buy3" },
        { text = "Something else, Tari'qa.", next = "BACK" },
      },
    },
    buy3 = {
      big = true,
      lines = { { id = "bu3_default", text = "He knows already, he's de one sending dem. What I haven't told him is dat a few of his grunts be buying road supplies quiet, like folk who plan to leave in de night. Three, maybe four. I've said nothing, because dey've not gone yet." } },
      choices = {
        { text = "Tell Thork. Desertion puts the whole town at risk.", next = "BACK", reply = "Aye. A wall wit' holes in it be no wall. I'll go to him tonight, and I'll not enjoy it.", fx = { align = { order = 1 } } },
        { text = "Say nothing. Frightened soldiers aren't deserters yet.", next = "BACK", reply = "Dat's how I been seeing it. A body can buy a waterskin and still stand his post in de morning.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gates = {
      lines = { { id = "ga_default", text = "Old habit, mon. On de isles I watched de shore for de tribe, and you don't stop. De guards look for enemies. I look for who's limping, who's carrying more dan dey left wit', and who doesn't come back at all." } },
      choices = {
        { text = "Who hasn't come back?", next = "gates2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gates2 = {
      lines = { { id = "ga2_default", text = "Too many to name. But de one I think on is Mankrik's wife. I sold her salt de morning dey rode south, and she laughed at my price. He stands by de gate now asking every stranger, and I can't look at him long." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wall = {
      lines = { { id = "wa_default", text = "Barg, wit' de general goods, who talks enough for both of us. Inside, Innkeeper Boorand, who pretends he doesn't hear what his guests say. Across de way Wrahk and Kil'hala argue about thread, and Hraq and Traugh argue about coal. It's a loud town for its size." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vials = {
      lines = { { id = "vi_default", text = "Take a dozen, den, and be careful what you put in dem. De herbs from de oases grow too big and too fast dese days. Tonga Runetotem be asking after dem, and I'd show him what you pick before you brew it." } },
      choices = { { text = "I'll show Tonga first. Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Watch what people carry out of a town. It tells you where dey think dey're going." } },
    oases = { { id = "tp_oases", text = "Too green, mon. Everybody who comes back from dem says de same, and den buys vials to prove it." } },
    centaur = { { id = "tp_centaur", text = "De Kolkar be north and west, and closer every month. I count de wounded, and de count goes one way." } },
    quilboar = { { id = "tp_quilboar", text = "Razormane to de east, Bristleback to de south. Dey raid de farms and leave de town, so far." } },
    thrall = { { id = "tp_thrall", text = "He put dis town where four roads meet and told Thork to hold it. Easy to say from Orgrimmar." } },
    _none = { { id = "tp_none", text = "Dat didn't come past my mat, mon, so I can't tell you." } },
  },
}

---------------------------------------------------------------------------
-- Kelsuwa: stable master at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "kelsuwa", id = TODO_NPC("Kelsuwa"), name = "Kelsuwa", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "taurajo" }, temper = { "gentle", "slow" }, values = { "patient", "devout" },
  notices = { "pet", "class" },
  impression = {
    first = "Kelsuwa keeps the stable at Camp Taurajo and speaks to each beast in his care as though it were a guest. He believes an animal remembers every kindness and every slight, and stables them accordingly.",
    third = "{name} met Kelsuwa, the stable master of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, traveller. If you have a companion who needs rest and water, I will see to it as I would my own." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Ah, and who is this? Let {pet} come to me in its own time. There is no hurry in my stable." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and the beasts are glad of it. They lift their heads when they hear your step." },
    { id = "g_away", when = { away = 14 }, text = "Many suns have passed. Those you left with me are well and fat, and a little spoiled, I confess." },
  },
  notice = {
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", maxLevel = 9 },
      text = "You are a hunter who walks alone still. When the Earth Mother sends you a companion, bring it to me, and I will show it where the cool shade is." },
    { id = "n_cat", cat = "pet", when = { pet = { family = "Cat" } },
      text = "A great cat. The plains bred that one, I think, and it carries itself as the old huntresses do. Walk softly around its pride, and it will forgive you much." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kelsuwa. Camp Taurajo is a hunters' camp, and so there are always beasts here that need a place to rest while their hunters travel on. I feed them, I walk them, and I listen to them, which is the part most stable hands forget." },
      },
      again = {
        { id = "h_again", text = "What more would you ask? The beasts are settled, and I have time." },
        { id = "h_again2", text = "Speak, friend. I am only filling the water troughs." },
        { id = "h_again3", text = "Ask, and I will answer as well as I can." },
      },
      choices = {
        { text = "I need to stable my beast.", next = "BUSINESS" },
        { text = "What do the beasts tell you?", next = "listen" },
        { text = "Which beasts of the Barrens do hunters bring you?", next = "beasts" },
        { text = "The camp keeps kodo close by, I see.", next = "kodo" },
        { text = "My companion is restless since we came south.", next = "restless", when = { pet = { type = "Beast" } } },
        { text = "Walk with the Earth Mother, Kelsuwa.", next = "END" },
      },
    },
    listen = {
      lines = { { id = "li_default", text = "Where they have been, mostly, if you know how to read it. A beast that comes in with its ears flat has been near the silithid mounds to the south. One that will not drink has been at the oases, where the water has turned strange." } },
      choices = {
        { text = "And what of their hunters?", next = "listen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    listen2 = {
      lines = { { id = "li2_default", text = "More than the hunters would like. A beast that flinches when a hand is raised near it has told me all I need to know. I say nothing to the hunter, but I give that one the best stall and the first water, so that it knows a different kind of hand exists." } },
      choices = {
        { text = "You never confront the hunter?", next = "listen3" },
        { text = "Something else, Kelsuwa.", next = "BACK" },
      },
    },
    listen3 = {
      big = true,
      lines = { { id = "li3_default", narr = "He runs a hand slowly down the neck of the nearest beast.", text = "Once, I did not give a beast back. It was a young lion, starved and whipped, and I told its hunter it had slipped its rope in the night. I lied to a guest of this camp, and Kirge Sternhorn knows it, and he has not decided what to do about me." } },
      choices = {
        { text = "You did right. The lion was owed that lie.", next = "BACK", reply = "I believe the Earth Mother would say so. It runs free near the Gold Road now, and it is fat.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A stable master who lies can't be trusted with any beast.", next = "BACK", reply = "That is what Kirge fears, and it is a fair fear. I will carry it, whatever he decides.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "The savannah cats above all, and the raptors that the trolls prize. Now and then a hyena, which is a better beast than its reputation, and once a thunder lizard that took three of us to water. Each has its own temper, and I try to learn it before I learn the hunter's name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "ko_default", text = "We do. The great kodo carried our people across these plains through all the years of wandering, and they carry our tents still. They are not mine to stable, for a kodo goes where it pleases, but I leave salt for them at the edge of camp." } },
      choices = {
        { text = "Their graveyard lies near here, doesn't it?", next = "kodo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo2 = {
      lines = { { id = "ko2_default", text = "Far to the west, in Desolace, where the old ones walk when they feel their time upon them. I have seen a bull turn that way from here and not look back. We do not stop them, and we do not follow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    restless = {
      lines = { { id = "rs_default", text = "Then it hears what you do not. The ground south of here hums with the silithid, and the beasts feel it in their feet. Let {pet} rest with me a night, away from the wind off the Field of Giants, and it will be itself again by morning." } },
      choices = { { text = "It hears the insects. Something else.", next = "BACK", fx = { learn = { "silithid" } } } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Let a beast come to you. What is given freely is kept, and what is taken must be guarded forever." } },
    silithid = { { id = "tp_silithid", text = "The beasts will not graze toward the Field of Giants any longer. I trust their judgment over any scout's." } },
    oases = { { id = "tp_oases", text = "A beast that has drunk there will not drink here for a day. Something in that water is wrong." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback keep their boars half starved to make them fierce. It grieves me, and it does not surprise me." } },
    centaur = { { id = "tp_centaur", text = "They drove us and our herds for generations. I do not hate easily, but I remember." } },
    _none = { { id = "tp_none", text = "That is beyond what I know, friend. The beasts have not spoken of it." } },
  },
}

---------------------------------------------------------------------------
-- Yonada: tailoring and leatherworking supplies at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "yonada", id = TODO_NPC("Yonada"), name = "Yonada", title = "Tailoring & Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "taurajo" }, temper = { "warm", "practical" }, values = { "craft", "generous" },
  notices = { "craft", "race" },
  impression = {
    first = "Yonada sells thread, dyes and salt to the hide workers of Camp Taurajo and trades the camp's raptor leather on to the caravans. She is warm and practical, and she drives a harder bargain with the caravan masters than her manner suggests.",
    third = "{name} met Yonada, who sells tailoring and leatherworking supplies at Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Taurajo, friend. I have thread, salt and dyes, and good hides besides, if the caravan has not yet taken them." },
    { id = "g_craft", when = { profession = { "Leatherworking", "Tailoring", "Skinning" } }, text = "Ah, you work hide or cloth. Then you have come to the right fire, for this whole camp lives by the skinning knife." },
    { id = "g_back", when = { metBefore = true }, text = "You are back among us. Sit a moment, the dye pots can mind themselves." },
    { id = "g_away", when = { away = 14 }, text = "It has been a long season since I saw you. The plains have been kind to you, I hope." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people prize raptor leather above all else I sell, and I have never understood why, but I am glad of it." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and it has been used today. Dranh will want to see your cuts, and I will want to see your hides." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Yonada. The hunters of Taurajo bring in more hides than the camp can wear, so Krulmoo and his students work them, and I see that the makers have what they need and that the surplus finds its way north. Nothing the hunt gives should lie unused." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I am glad of the company." },
        { id = "h_again2", text = "Ask, friend. My hands are busy, but my ears are not." },
        { id = "h_again3", text = "Speak on. The caravan is not due for days." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where do the camp's hides go?", next = "caravan" },
        { text = "This camp seems to live by leather.", next = "camp" },
        { text = "How do you make your dyes out here?", next = "dyes" },
        { text = "I've raptor hides. What are they worth?", next = "raptor", when = { profession = "Skinning" } },
        { text = "May the sun shine on you, Yonada.", next = "END" },
      },
    },
    caravan = {
      lines = { { id = "ca_default", text = "North along the Gold Road to the Crossroads, and from there to Orgrimmar. The orcs take all the raptor leather I can send, for they say it wears like mail and moves like cloth. In return we have iron, grain and news." } },
      choices = {
        { text = "Do the caravans always get through?", next = "caravan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caravan2 = {
      lines = { { id = "ca2_default", text = "Less often than they did. The Bristleback quilboar raid the road south of the Crossroads, and the last two caravans lost a wagon each. The caravan masters ask me to take less for the hides, to cover what they lose." } },
      choices = {
        { text = "And do you take less?", next = "caravan3" },
        { text = "Something else, Yonada.", next = "BACK" },
      },
    },
    caravan3 = {
      big = true,
      lines = { { id = "ca3_default", text = "I have not, so far. Those hides are the hunters' work, and some of the hunters were hurt in the getting. Yet the caravan masters bleed for the road too, and I am told I am being stubborn with our own allies." } },
      choices = {
        { text = "Share the loss. Allies carry each other's burdens.", next = "BACK", reply = "That is the Earth Mother's way, and I have been slow to walk it. I will meet them halfway at the next caravan.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hold your price. The hunters earned every copper.", next = "BACK", reply = "So my heart says. The road's danger is the road's price, and the hide's worth is the hide's.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "cm_default", text = "It does, and it always has. Taurajo was a hunting camp before there was a road. Dranh teaches the skinning, Krulmoo the working of leather, Mahani the sewing of cloth, and Sanuye sells what the three of them make. I am the thread that runs between them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dyes = {
      lines = { { id = "dy_default", text = "From the land, as my mother made them. Red from the clay by the Gold Road, yellow from plainstrider gall, and a brown that never fades from the bark of the trees at the oases. The blues and purples I buy from goblins, and they are never as true." } },
      choices = {
        { text = "The oasis trees are changing, I hear.", next = "dyes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dyes2 = {
      lines = { { id = "dy2_default", text = "They are. The bark I gathered this season gave a green I have never seen, bright as a snake's back, and it would not set. Jorn Skyseer asked to keep a strip of the cloth, and he has not told me what he saw in it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
    raptor = {
      lines = { { id = "ra_default", text = "A good deal, if they are whole. Bring them unscraped and let Krulmoo judge them, for he sees flaws that I miss. The sunscale hides are finest, though the raptors south of here grow larger, and bolder than I like." } },
      choices = { { text = "Whole and unscraped. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Waste nothing the hunt gives you. The beast gave everything, and the least we owe it is to use what it gave." } },
    oases = { { id = "tp_oases", text = "The bark there dyes wrong now. When the trees change, something beneath them has changed first." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback grow bolder on the road. They never troubled caravans when I was a calf." } },
    razorfen = { { id = "tp_razorfen", text = "The great thorns to the south, where the quilboar gather. Our hunters give that country a wide path." } },
    centaur = { { id = "tp_centaur", text = "We were always moving, when I was young, always a day ahead of them. To sit by one fire for a whole year still feels like a gift." } },
    _none = { { id = "tp_none", text = "I cannot tell you that, friend. It is not a thing that has come to my fire." } },
  },
}

---------------------------------------------------------------------------
-- Sanuye Runetotem: leather armor merchant at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "sanuye", id = TODO_NPC("Sanuye Runetotem"), name = "Sanuye Runetotem", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "taurajo" }, temper = { "thoughtful", "mild" }, values = { "craft", "devout" },
  notices = { "class", "race" },
  impression = {
    first = "Sanuye Runetotem sells leather armor at Camp Taurajo and can name the hunter who took each hide. He comes of a tribe of druids and lorekeepers, and treats his trade as a quieter way of honoring the same things.",
    third = "{name} met Sanuye Runetotem, the leather armor merchant of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, friend. Every piece on this rack was a living thing on these plains, and I can tell you the story of each, if you have the patience." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid. My kin in Thunder Bluff will be glad that another has heard the call. Come, I have leather that will not bind you when you change your shape." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The armor has served you, I hope, and you have honored the one who wore the hide first." },
    { id = "g_away", when = { away = 14 }, text = "The grass has grown and been grazed since I saw you last. Be welcome again." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "You move as one who needs silence more than iron. Leather is the right choice for you, and I have some that makes no more sound than grass." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "It is good to see one of our own on the Gold Road. So many who pass through are in a hurry, and you at least will stop to hear a thing properly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sanuye, of the Runetotem. Krulmoo and his students make the armor, and I find each piece its wearer. A hide remembers the beast it came from, and I think it sits easier on someone who knows what that beast was." },
      },
      again = {
        { id = "h_again", text = "What else would you hear? I have stories enough." },
        { id = "h_again2", text = "Ask, friend. The day is long on the plains." },
        { id = "h_again3", text = "Speak. I am listening." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Tell me the story of one of these pieces.", next = "story" },
        { text = "A Runetotem selling armor seems unusual.", next = "runetotem" },
        { text = "What do the hunters say of the land lately?", next = "land" },
        { text = "Will this leather hold when I take a beast's shape?", next = "shape", when = { class = "DRUID" } },
        { text = "Walk in balance, Sanuye.", next = "END" },
      },
    },
    story = {
      lines = { { id = "st_default", text = "This jerkin, then. The hide was a thunder lizard, an old bull that had ruled the dry hills east of here for longer than I have sold armor. Three hunters tracked it for four days, and when it fell they sat with it until sunset before anyone drew a knife." } },
      choices = {
        { text = "Why sit with it?", next = "story2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story2 = {
      lines = { { id = "st2_default", text = "To thank it, and to let its spirit go on before its body was put to use. It is the old way. The orcs who buy from me think it a strange delay, and I tell them the armor is stronger for it, which they are willing to believe." } },
      choices = {
        { text = "Is it stronger, truly?", next = "story3" },
        { text = "Something else, Sanuye.", next = "BACK" },
      },
    },
    story3 = {
      big = true,
      lines = { { id = "st3_default", text = "I do not know. I know the hunter is better for it, and perhaps that is the same thing. But I have let the orcs think the rite is a kind of craft secret, and I wonder at times whether I honor the old way by that, or only sell it." } },
      choices = {
        { text = "Tell them plainly. A rite is not a selling point.", next = "BACK", reply = "You speak as my elders would. I will tell the next one the truth, and see whether he still buys.", fx = { align = { honor = 1 } } },
        { text = "If the tale teaches them respect, let them believe it.", next = "BACK", reply = "That has been my comfort. A good thing learned for a poor reason is still learned.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    runetotem = {
      lines = { { id = "ru_default", text = "It is, and my kin say so gently. The Runetotem keep the lore of our people and walk the druid's path beside Hamuul, the Archdruid. I had not the gift for either. I found I could keep the memory of the hunt instead, and that is a lore of its own." } },
      choices = {
        { text = "Do you know Tonga Runetotem, at the Crossroads?", next = "runetotem2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runetotem2 = {
      lines = { { id = "ru2_default", text = "He is of my tribe, and he was always the clever one among us. He studies the oases, where the growth has become too rich to be natural. When he writes to me he asks what the beasts near them look like, and my answers have troubled him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
    land = {
      lines = { { id = "la_default", text = "That it is uneasy. The quilboar push out from the great thorns in the south, the silithid dig at the Field of Giants, and dwarves have cut into the earth at Bael Modan. Jorn Skyseer listens to all of it, and he sleeps less than he did." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "razorfen" } } } },
    },
    shape = {
      lines = { { id = "sh_default", text = "It will, if you let it. The leather I set aside for druids is cut loose at the shoulder and haunch and laced, not riveted. My kin taught me that much. Your own spirit does the rest, as I am told, and I envy you the knowing of it." } },
      choices = { { text = "Laced, not riveted. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Know what you wear and where it came from. It is a small courtesy, and the world is made of those." } },
    oases = { { id = "tp_oases", text = "Tonga Runetotem studies them at the Crossroads. Growth without balance is a sickness, he says, however green it looks." } },
    silithid = { { id = "tp_silithid", text = "The hunters bring me no hides from the Field of Giants. What lives there has no skin worth the name, only shell." } },
    razorfen = { { id = "tp_razorfen", text = "The thorns there are older than any tale I know. The quilboar say they grew from the blood of their god, and looking at them, I can believe it." } },
    quilboar = { { id = "tp_quilboar", text = "They are a people of the earth, as we are, and I have never understood why that has not made us friends." } },
    _none = { { id = "tp_none", text = "That is not among the stories I keep, friend." } },
  },
}

---------------------------------------------------------------------------
-- Dranh: skinning trainer at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "dranh", id = TODO_NPC("Dranh"), name = "Dranh", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "taurajo" }, temper = { "quiet", "exact" }, values = { "craft", "devout" },
  notices = { "craft", "pet" },
  impression = {
    first = "Dranh teaches skinning at Camp Taurajo and wipes his knife after every cut, even when he is only showing the motion in the air. He says the knife is the last thing the beast is owed, and should be clean.",
    third = "{name} met Dranh, the skinning trainer of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Show me your knife before you tell me your name. I learn more from the one than the other." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "You have skinned before. The edge of your knife is worn on the right side, so you pull where you should draw. We will mend that." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Is the knife sharp, and have you kept it clean?" },
    { id = "g_away", when = { away = 14 }, text = "It has been long. A hand forgets the cut if it does not make it, so let us see what yours remembers." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather. Then you know what a careless skinner costs you, and you will not be one. Krulmoo will thank me for every student like you." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} watches my hands, and it knows what they do. I mean it no harm, and I think it knows that as well." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dranh. I teach the taking of the hide, which is the first step of all that this camp makes, and the one most often done badly. One long clean cut is worth a hundred hacking ones, and the beast deserves the one." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while I oil the blade." },
        { id = "h_again2", text = "Speak. I am listening." },
        { id = "h_again3", text = "Go on. A question is a clean cut, if it is asked well." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What makes a clean cut?", next = "cut" },
        { text = "You wipe that knife a great deal.", next = "knife" },
        { text = "Which hides here are hardest to take?", next = "hard" },
        { text = "My hides keep tearing at the belly.", next = "tear", when = { profession = "Skinning" } },
        { text = "I'll keep my knife clean, Dranh.", next = "END" },
      },
    },
    cut = {
      lines = { { id = "cu_default", text = "Patience, and a knife that is sharper than you think it needs to be. You open along the belly and let the weight of the hide do the pulling. The moment you force it, you have made two poor pieces of one good one." } },
      choices = {
        { text = "How long did it take you to learn?", next = "cut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut2 = {
      lines = { { id = "cu2_default", text = "My father would say I have not yet. He skinned a kodo alone, in a single piece, on the day I was born, and the hide roofed our tent for twenty years. I measure every cut I make against that one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    knife = {
      lines = { { id = "kn_default", text = "I do. The knife is the last thing that touches the beast as it was. To come to that with a dirty blade is like coming to a burial with dirty hands. The orcs I teach find this strange, and they do it anyway, because I will not teach them otherwise." } },
      choices = {
        { text = "You make the orcs keep your rite?", next = "knife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife2 = {
      lines = { { id = "kn2_default", text = "I make them keep a clean knife and a moment of quiet. I do not ask what they think in the quiet. One young orc told me he thinks of nothing at all, and I said that was a good beginning." } },
      choices = {
        { text = "And those who refuse the quiet?", next = "knife3" },
        { text = "Something else, Dranh.", next = "BACK" },
      },
    },
    knife3 = {
      big = true,
      lines = { { id = "kn3_default", text = "I send them to learn elsewhere. Kirge says the Horde needs skinners more than it needs my scruples, and that I turn away good hands over a custom that is ours and not theirs. He may be right, and I have not changed." } },
      choices = {
        { text = "Hold to it. A craft without respect is butchery.", next = "BACK", reply = "So I was taught, and so I teach. It is good to hear it from one who is not of my camp.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Teach the cut. Their beliefs are their own to keep.", next = "BACK", reply = "That is fairly said. I may ask only for the clean knife, and leave the quiet to those who want it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "ha_default", text = "The thunder lizards, whose hide is thick as my wrist at the spine, and the great cats, whose skin is so fine that a careless breath will nick it. The raptors are easy to cut and hard to approach, since the rest of the pack does not always leave." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tear = {
      lines = { { id = "te_default", text = "Then you begin too low and too fast. Start at the breastbone, with the edge turned up and away from the flesh, and draw toward yourself in one motion. Let the knife rest between cuts. It has more sense than a hurried hand." } },
      choices = { { text = "From the breastbone, edge up. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Sharpen your knife before the hunt, not after the kill. The beast should not wait on your carelessness." } },
    silithid = { { id = "tp_silithid", text = "They have no hide to take. A thing with nothing to give back to the land does not belong on it." } },
    quilboar = { { id = "tp_quilboar", text = "They skin what they kill and leave the meat to rot. I do not understand a people who would do that." } },
    centaur = { { id = "tp_centaur", text = "They kill for sport and leave the hide on the ground to rot. I will not speak further of them." } },
    _none = { { id = "tp_none", text = "I do not know. I know hides, and little else, and I am content with that." } },
  },
}

---------------------------------------------------------------------------
-- Mahani: tailoring trainer at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "mahani", id = TODO_NPC("Mahani"), name = "Mahani", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "taurajo" }, temper = { "cheerful", "patient" }, values = { "craft", "generous" },
  notices = { "craft", "race" },
  impression = {
    first = "Mahani teaches tailoring at Camp Taurajo, the one weaver in a camp of hide workers, and bears their teasing with good humour. Her tent cloths keep out the Barrens wind better than any leather, and she lets the results argue for her.",
    third = "{name} met Mahani, the tailoring trainer of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of the wind, friend. You have found the one tent in Taurajo that does not smell of a tanning pit." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor, here! Sit, sit. I so seldom have anyone to talk thread with who does not ask why I am not using sinew." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did the stitches hold in the wind? Show me, I shall not scold." },
    { id = "g_away", when = { away = 14 }, text = "So many days! I have woven a whole tent wall since you left, and unpicked half of it." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your people wear so little, and yet what you wear is so beautifully dyed. I have always wanted to ask how you get that blue." },
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "Another one for the hides, I see. Well, I will not hold it against you. When your leather cracks in the dry season, you will know where my tent is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mahani. In a camp where everyone else works leather, I teach the weaving and sewing of cloth, and they tease me for it kindly. Leather is strong, but cloth breathes, and under the Barrens sun you will be glad of something that does." },
      },
      again = {
        { id = "h_again", text = "What else, friend? My loom can wait." },
        { id = "h_again2", text = "Ask, do. I talk better than I weave some days." },
        { id = "h_again3", text = "Go on. I have a long seam ahead and would like the company." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why weave cloth in a camp of leatherworkers?", next = "why" },
        { text = "What do the tauren make from cloth?", next = "make" },
        { text = "The others tease you about it, you say.", next = "tease" },
        { text = "I can sew wool now. What comes after?", next = "after", when = { profession = { name = "Tailoring", min = 125 } } },
        { text = "Earth Mother keep you, Mahani.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because someone must. When we wandered, every tribe had its weavers, for a tent of hide alone is too heavy for a kodo to carry far. Now that we stay in one place, the young ones forget that. I mean to see that it is not forgotten entirely." } },
      choices = {
        { text = "Do the young ones come to learn?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wh2_default", text = "A few, and more orcs than tauren, if you can believe it. The orcs came out of their camps with nothing, and they will learn any craft that is offered. Our own young would sooner hunt, and I cannot wholly blame them." } },
      choices = {
        { text = "Does it trouble you, teaching outsiders first?", next = "why3" },
        { text = "Something else, Mahani.", next = "BACK" },
      },
    },
    why3 = {
      big = true,
      lines = { { id = "wh3_default", text = "A little, in the evenings. The patterns I teach were my grandmother's, and her grandmother's, and they belong to the tribes. An orc girl here weaves them now as well as I do. Some of the elders say I have given away what was not mine alone to give." } },
      choices = {
        { text = "A craft shared is a craft that survives.", next = "BACK", reply = "That is what I hold to. Better the patterns live on an orc's loom than die in a tauren's memory.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The elders are right. Some things belong to the tribe.", next = "BACK", reply = "Perhaps so. I might keep the oldest patterns for our own, and teach the rest freely. I will think on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    make = {
      lines = { { id = "ma_default", text = "Tent walls and door flaps, first of all, and the banners each tribe flies. Robes for our shaman and druids, who will not be weighed down. And the burial cloths, which must be woven by hand and never cut, so that nothing of the life is cut short." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tease = {
      lines = { { id = "te_default", text = "Oh, endlessly. Krulmoo asks me each morning whether my cloth has stopped a quilboar spear yet. I ask him whether his leather has kept the rain out of his tent yet, and since it has not, and mine has, we call it even." } },
      choices = {
        { text = "Who supplies your thread?", next = "tease2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tease2 = {
      lines = { { id = "te2_default", text = "Yonada, who is kind enough to keep fine thread though I am nearly her only buyer for it. She makes her own dyes from the clay and the bark, and I have never found a red to equal hers, not in Thunder Bluff nor from any goblin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "Silk, which comes from the great spiders, and after that mageweave, which I have only handled twice. I can take you through silk. For the rest you must go to Tepa in Thunder Bluff, and you may tell her that Mahani still thinks of her." } },
      choices = { { text = "I'll carry your greeting. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Never pull a thread tight in anger. The cloth remembers, and it puckers." } },
    centaur = { { id = "tp_centaur", text = "We wove our tents light so we could strike them in a hurry. I am glad to weave heavier ones now." } },
    quilboar = { { id = "tp_quilboar", text = "They carry off our drying cloth when they raid. I cannot think what they do with it." } },
    thrall = { { id = "tp_thrall", text = "The orcs' Warchief stood with Cairne when we had no other friend. My students are his people, and I teach them gladly for it." } },
    _none = { { id = "tp_none", text = "I could not say, friend. It has not come up at my loom." } },
  },
}

---------------------------------------------------------------------------
-- Gahroot: butcher at Camp Taurajo.
---------------------------------------------------------------------------
P:NPC {
  key = "gahroot", id = TODO_NPC("Gahroot"), name = "Gahroot", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "taurajo" }, temper = { "hearty", "plain" }, values = { "generous", "practical" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Gahroot is the butcher of Camp Taurajo, a broad, hearty tauren who shares out the hunt so that no tent goes without. He holds that a camp is fed together or it is not a camp.",
    third = "{name} met Gahroot, the butcher of Camp Taurajo.",
  },
  greetings = {
    { id = "g_default", text = "Ho, traveller! You have the look of someone who has walked far on little. Come, there is meat, and it was running on the plains this morning." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Then you will know good meat when you see it. Look at the grain on this haunch and tell me I am not an honest butcher." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and hungry again, I hope. I think poorly of a guest who is not." },
    { id = "g_away", when = { away = 14 }, text = "It has been a long while! You are thinner than I remember, and we shall mend that." },
  },
  notice = {
    { id = "n_green", cat = "hunger", when = { maxLevel = 14 },
      text = "You are young to be this far down the Gold Road. Eat before you go on, for the land south of here feeds on the unready." },
    { id = "n_hunter", cat = "craft", when = { class = "HUNTER" },
      text = "A hunter. If you take more than you can carry, bring the rest to me. It will feed the camp, and your name will be spoken at the fire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gahroot. The hunters of Taurajo bring their kills to me, and I cut and share them, so that the old and the young eat as well as the strong. What the camp does not need, I sell to travellers such as you." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and eat while you ask." },
        { id = "h_again2", text = "Speak on, friend. My cleaver can rest." },
        { id = "h_again3", text = "Go on. I never met a question that spoiled meat." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How is the hunt shared out?", next = "share" },
        { text = "What game do the hunters bring you?", next = "game" },
        { text = "You don't sell kodo, I notice.", next = "kodo" },
        { text = "What cut would you roast over an open fire?", next = "roast", when = { profession = "Cooking" } },
        { text = "May your fire stay full, Gahroot.", next = "END" },
      },
    },
    share = {
      lines = { { id = "sh_default", text = "The hunter who made the kill takes the heart and the first cut, as is right. The rest I divide by tent, with the elders and the nursing mothers served before the warriors. Nobody in Taurajo eats alone, and nobody eats last twice running." } },
      choices = {
        { text = "Do the orc grunts here eat the same way?", next = "share2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    share2 = {
      lines = { { id = "sh2_default", text = "They did not, at first. Logmar and Dogran expected rations by rank, as their army does it, and they were uneasy to be served after a grandmother. They have come round. Dogran now carries her portion to her tent himself." } },
      choices = {
        { text = "And in a lean season?", next = "share3" },
        { text = "Something else, Gahroot.", next = "BACK" },
      },
    },
    share3 = {
      big = true,
      lines = { { id = "sh3_default", text = "Then everyone has less, and the hunters least of all, for they can best bear it. Kirge Sternhorn has asked me whether the warriors who guard the camp should not be fed first when times are hard, since a weak guard guards nobody." } },
      choices = {
        { text = "The weakest eat first. That is what a camp is for.", next = "BACK", reply = "So my mother taught me, with a ladle. I am glad the teaching travels.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kirge is right. Feed those who keep the rest alive.", next = "BACK", reply = "It is a hard wisdom, and I have not said he is wrong. If the quilboar come in force, I may yet do it his way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = { { id = "ga_default", text = "Zhevra and plainstrider for every day, and gazelle when someone is quick enough. Thunder lizard from the dry hills, which wants long cooking. The lion I will take, though I do not care for it, since a beast that eats meat makes poor meat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "ko_default", text = "I do not, and I will not. The kodo carried my people when we had nowhere to stand. To the orcs it is a beast like any other, and I do not quarrel with them for it, but none will be cut on my block." } },
      choices = {
        { text = "The orcs at the Crossroads roast it often.", next = "kodo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo2 = {
      lines = { { id = "ko2_default", text = "So I hear, and I hear their cook will not do it where our baker can see, which is a courtesy I had not expected. Krulmoo takes kodo hide only from those that died in their own time. We each draw the line where our hearts allow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roast = {
      lines = { { id = "ro_default", text = "Zhevra haunch, with the fat left on, turned slowly and never hurried. Rub it with the red salt Yonada keeps. If you would learn more than a butcher knows, Innkeeper Byula has a way with plainstrider that I have been trying to coax out of her for years." } },
      choices = { { text = "Fat on, and slowly. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Eat when there is food and share when there is plenty. The plains do not promise tomorrow." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback drive the game off the southern grass. My hunters walk farther each season for the same meat." } },
    silithid = { { id = "tp_silithid", text = "Nothing grazes near the Field of Giants now. The herds know, and they have moved north." } },
    centaur = { { id = "tp_centaur", text = "They hunted the plains bare and then hunted us. We feed a land back, and they never learned to." } },
    oases = { { id = "tp_oases", text = "The beasts from near the oases come in too fat and too fierce. I cut them carefully, and I look twice at the liver." } },
    _none = { { id = "tp_none", text = "That I do not know, friend. Have something to eat, and perhaps it will come to one of us." } },
  },
}

---------------------------------------------------------------------------
-- Zikkel: banker in Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "zikkel", id = TODO_NPC("Zikkel"), name = "Zikkel", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "ratchet" }, temper = { "fussy", "nervous" }, values = { "profit", "careful" },
  notices = { "purse", "class" },
  impression = {
    first = "Zikkel works the second window of the Ratchet bank and counts everything twice, aloud. He is certain that pirates, both factions and his own colleague are all one bad day from robbing the vault.",
    third = "{name} banked with Zikkel, the nervous goblin at the second window of the bank in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Next! Step up, state your business, and keep your hands on the counter where I can count 'em, friend, it's nothin' personal." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Good, good, a known face. Your box is exactly as ya left it, I checked it this mornin', and again after lunch." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Whoa, whoa, not so close to the grille, pal. I know your line of work, I'm insured against your line of work, and the premiums are murder." },
    { id = "g_away", when = { away = 14 }, text = "Ya haven't been by in weeks! I was about to file your account under dormant, which is a whole lotta paperwork, so thanks for showin' up." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse to be walkin' around a port with, friend. Put it in the vault, please, before somebody on the docks does the sums." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Not much to deposit today, huh? That's fine, that's fine. Small accounts are less to worry about, and I got plenty to worry about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zikkel, Steamwheedle Cartel, second window. Fuzruckle's got the first, and between us we hold the savings of half the coast, Horde and Alliance and anybody in between. It's all in the one vault, and I'm the one who lies awake thinkin' about that." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Go ahead, I'll just keep countin' while ya talk." },
        { id = "h_again2", text = "Sure, ask, only keep it down, there's folks listenin' on this dock." },
        { id = "h_again3", text = "What else, friend? I got a ledger open, but it ain't goin' anywhere, I locked it." },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "You seem worried about the vault.", next = "worry" },
        { text = "Horde and Alliance gold in one bank?", next = "both" },
        { text = "How do you and Fuzruckle get along?", next = "fuz" },
        { text = "A lock like yours wouldn't stop a real thief.", next = "lock", when = { class = "ROGUE" } },
        { text = "That's all, Zikkel.", next = "END" },
      },
    },
    worry = {
      lines = { { id = "wo_default", text = "Worried? Friend, I'm the only one in this town with the sense to be. There's Southsea pirates sittin' a mile down the beach, there's Theramore marines up at Northwatch, and there's a vault full of gold in a wooden town in between. Ya do the arithmetic." } },
      choices = {
        { text = "Has anyone ever tried it?", next = "worry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry2 = {
      lines = { { id = "wo2_default", text = "Twice that I know of, and both times the bruisers handled it before they got to the door. Gazlowe says that proves the system works. I say it proves folks are tryin', and one day somebody's gonna be good at it." } },
      choices = {
        { text = "What would you do differently?", next = "worry3" },
        { text = "Something else, Zikkel.", next = "BACK" },
      },
    },
    worry3 = {
      big = true,
      lines = { { id = "wo3_default", text = "Move the vault inland, double the guard, and search every customer at the door. Fuzruckle says that'd cost us half our business, 'cause nobody banks where they get patted down. So I gotta pick between a safe bank with no customers and a busy one I can't sleep over." } },
      choices = {
        { text = "Search them. Safety is what a bank sells.", next = "BACK", reply = "That's what I keep sayin'! Security is the product! Put it in writin' and I'll show it to Gazlowe.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fuzruckle's right. Trust your customers or lose them.", next = "BACK", reply = "Yeah, yeah, that's what the ledger says too. The ledger don't have to stand at this window, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = {
        { id = "bo_default", text = "Same vault, different boxes, and the gold don't fight. That's the beauty of neutrality, friend. An orc and a dwarf'll stand in my line glarin' at each other and both walk out richer, and the Cartel takes a little off each for keepin' the peace." },
        { id = "bo_alliance", when = { faction = "Alliance" }, text = "Same vault, different boxes. Your coin sits next to some orc's coin, pal, and neither one knows the difference. If that bothers ya, Theramore's a long swim, and their bank closes early." },
      },
      choices = {
        { text = "And if the war comes to Ratchet?", next = "both2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    both2 = {
      lines = { { id = "bo2_default", text = "Don't even say it. If it does, both sides are gonna want to know what the other's got in here, and I'm gonna be the fella they ask. I got a small boat tied up under the pier for that day, and I'd thank ya to forget I mentioned it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    fuz = {
      lines = { { id = "fu_default", text = "Fuzruckle? Fine, we get along fine. He thinks loyalty's a bad investment and I think he's gonna be proved right at my expense someday. He's never been a copper short in his life, which is exactly what you'd expect from a fella who was plannin' somethin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lock = {
      lines = { { id = "lo_default", text = "I knew it, I knew you'd looked! All right, professional opinion, then, how long? No, don't tell me, I won't sleep. Tell Wrenix down the hill instead, he designed it, and he oughta know what his colleagues think." } },
      choices = { { text = "I'll keep it between us. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Count it twice and keep it somewhere dry. And don't tell anybody what ya got, includin' me, outside banking hours." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel backs every coin in this vault. That's a guarantee, friend, and a guarantee from a goblin is worth exactly what the contract says." } },
    booty_bay = { { id = "tp_booty", text = "Head office, more or less. They send auditors up twice a year, and I ain't slept right in the week before one since I started." } },
    venture_company = { { id = "tp_venture", text = "They don't bank with us, and good. The way they do business, I'd be countin' the spoons after every visit." } },
    _none = { { id = "tp_none", text = "I dunno, and I don't wanna know. I got enough on my mind." } },
  },
}

---------------------------------------------------------------------------
-- Ranik: trade supplies in Jazzik's shop, Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "ranik", id = TODO_NPC("Ranik"), name = "Ranik", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "glib", "ambitious" }, values = { "profit", "cunning" },
  notices = { "craft", "purse" },
  impression = {
    first = "Ranik sells trade supplies from a corner of Jazzik's general store in Ratchet and talks about the day he will have a shop of his own. He rents his floor by the square foot and has measured it more than once.",
    third = "{name} met Ranik, who sells trade supplies out of Jazzik's store in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, over here, friend, not that counter, this counter! Ranik's Trade Supplies, thread, vials, dyes, flux, best selection north of Booty Bay and I mean that." },
    { id = "g_craft", when = { profession = { "Tailoring", "Alchemy", "Leatherworking", "Engineering", "Blacksmithing", "Cooking" } }, text = "A professional! Now we're talkin'. You make things, I sell the things ya make things with, and that right there is what I call a relationship." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer! Don't tell the others, they all think it's them." },
    { id = "g_away", when = { away = 14 }, text = "Where ya been, pal? I had a spool of silk with your name on it, and I had to sell it to a dwarf." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that is a purse with prospects. Listen, friend, ya ever think about investin' in a small, well-run retail concern? Just puttin' it out there." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! I got dyes off the last boat from Booty Bay ya won't see anywhere on this coast, and that ain't sales talk, that's geography." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ranik's the name, trade supplies is the game. I rent this corner off Jazzik, who's got the general goods, and I pay him by the square foot, so excuse me if I don't spread out. Every crafter who gets off a boat in Ratchet comes to me, 'cause I stock what the faction towns can't get." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk fast, I'm payin' rent on this conversation." },
        { id = "h_again2", text = "Sure, go on. I got a minute, and for you I got two." },
        { id = "h_again3", text = "Ask away, friend, askin's free. Everything else is itemised." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You rent a corner of another goblin's shop?", next = "rent" },
        { text = "How do you stock what the faction towns can't?", next = "stock" },
        { text = "Who buys the most in a port like this?", next = "buyers" },
        { text = "I need silk thread and plenty of it.", next = "silk", when = { profession = { name = "Tailoring", min = 125 } } },
        { text = "Good luck with the shop, Ranik.", next = "END" },
      },
    },
    rent = {
      lines = { { id = "re_default", text = "For now, friend, for now. Jazzik had the floor space and I had the supplier, so we cut a deal. He gets rent and foot traffic, I get a roof and his customers walkin' past my counter. It's what ya call a mutually beneficial arrangement till one of us finds a better one." } },
      choices = {
        { text = "And you're looking for a better one.", next = "rent2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rent2 = {
      lines = { { id = "re2_default", text = "Always, pal, it's the only way to look. There's a spot comin' open by the smithy, and I got my eye on it. Thing is, Jazzik gave me my start when nobody else in town would rent to a kid with one crate, and he ain't raised my rent in two years." } },
      choices = {
        { text = "So what's stopping you?", next = "rent3" },
        { text = "Something else, Ranik.", next = "BACK" },
      },
    },
    rent3 = {
      big = true,
      lines = { { id = "re3_default", text = "If I go, I take half his foot traffic with me, and he knows it. There's nothin' in the contract says I can't. My old man woulda been out the door already and laughin'. I been sittin' on it a month, and a goblin sittin' on a deal a month ain't natural." } },
      choices = {
        { text = "He backed you first. You owe him better than that.", next = "BACK", reply = "Yeah. Yeah, I know. Maybe I offer him a cut of the new place, keep it friendly. Don't tell anybody I got a conscience, it's bad for business.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A contract is a contract. Take the better spot.", next = "BACK", reply = "That's what the ledger says, and the ledger's never wrong. All right. I'll go see the fella about the lease.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "st_default", text = "Simple. Orgrimmar buys from Horde suppliers and Theramore buys from Alliance ones, and neither'll touch the other's goods. Me, I buy off every boat that ties up at Dizzywig's wharf. Dwarven flux, elven dyes, troll thread, it all sits on the same shelf here and nobody salutes." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The tinkers, hands down. Tinkerwiz's students go through blasting powder makings like it's breakfast. After them, the warlocks up the hill buy vials by the crate and never say what for, and friend, I have learned not to ask." } },
      choices = {
        { text = "The warlocks don't worry you?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "bu2_default", text = "They pay in advance, in full, in gold. Ya know how rare that is? Whatever they're doin' up in that tower, they can keep doin' it. There was a smell last month, and a noise, and I sent 'em a fruit basket." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    silk = {
      lines = { { id = "si_default", text = "Then you're in luck, 'cause I got a crate in from the south, and it's the good stuff. Buy heavy, pal. The next boat ain't due for a week, and there's a tailor from Theramore who cleans me out every time she docks." } },
      choices = { { text = "I'll buy heavy. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy when it's on the shelf, friend. Tomorrow it's on somebody else's shelf, at a markup." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel lets a fella trade with anybody. That's the whole reason a kid with one crate can get started in this town." } },
    booty_bay = { { id = "tp_booty", text = "Where my supplier is, and where I'm gonna open my second location, once I got a first one." } },
    venture_company = { { id = "tp_venture", text = "They undercut ya, then they buy ya out, then they fire ya. I seen it happen to a cousin. No thanks." } },
    _none = { { id = "tp_none", text = "Don't stock it, don't know it, pal. Try the docks." } },
  },
}

---------------------------------------------------------------------------
-- Vexspindle: cloth and leather armor at Plate-n-Chain, Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "vexspindle", id = TODO_NPC("Vexspindle"), name = "Vexspindle", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "smooth", "vain" }, values = { "profit", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Vexspindle sells cloth and leather armor in a shop called Plate-n-Chain, a name he has been trying to change for years. He dresses better than his customers and regards that as part of the service.",
    third = "{name} met Vexspindle, the cloth and leather armor merchant of Plate-n-Chain in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Plate-n-Chain, and before ya say it, yes, I sell neither. Cloth and leather, friend, the finer side of the shop. Grazlix has the scrap metal." },
    { id = "g_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "Ah, a robe wearer. Finally, somebody with taste. Step this way, pal, and try not to look at whatever Grazlix is hammerin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And wearin' what I sold ya, I see. It suits ya, friend, I said it would." },
    { id = "g_away", when = { away = 14 }, text = "Long time! Styles have changed since ya left, and by styles I mean prices." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Oh, friend. Oh, no. What happened to that outfit? Don't tell me, I can see what happened. Let's get ya into somethin' with all its sleeves." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll be wantin' my partner, pal, the loud one by the anvil. I got nothin' that'd fit under all that iron, and frankly it'd be wasted there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Vexspindle, purveyor of fine cloth and leather. I share the shop with Grazlix, who does mail and shields and picked the name before I bought in. We sell to both sides of the war, friend, and I can tell ya from experience that an orc and an elf take the same size in gloves more often than either'd like." },
      },
      again = {
        { id = "h_again", text = "Somethin' else, friend? I'm only foldin'." },
        { id = "h_again2", text = "Go on, ask. A good shopkeeper's got time for his clientele." },
        { id = "h_again3", text = "What else can I do for ya? Besides the obvious, which is the hat." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "The shop's name doesn't describe your half.", next = "name" },
        { text = "Where do you get your goods?", next = "goods" },
        { text = "How do you get on with Grazlix?", next = "grazlix" },
        { text = "What do you have for someone who shouldn't be seen?", next = "rogue", when = { class = { "ROGUE", "DRUID", "HUNTER" } } },
        { text = "I'll be on my way, Vexspindle.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Tell me about it! Plate-n-Chain. Ya know how many mages walk past that sign every day? I been askin' Grazlix to change it to somethin' with class for three years, and he says the sign's paid for and a new one ain't." } },
      choices = {
        { text = "What would you call it?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "na2_default", text = "Vexspindle and Associate. No? All right, somethin' neutral, then, like the Ratchet Outfitters. I had a sign painted on spec, friend, a real nice one, gold letterin'. It's under my bed. Grazlix won't even look at it." } },
      choices = {
        { text = "You could hang it while he's out.", next = "name3" },
        { text = "Something else, Vexspindle.", next = "BACK" },
      },
    },
    name3 = {
      big = true,
      lines = { { id = "na3_default", text = "Don't think I ain't considered it. He goes to Booty Bay twice a year for stock, and I could have it up before his boat cleared the bay. But he was here first, pal, it's his name on the deed, and he let me buy in when I had nothin' but a suitcase of samples." } },
      choices = {
        { text = "Then leave it. A partner's word outweighs a sign.", next = "BACK", reply = "Yeah, that's about where I land, every time. The sign stays under the bed. It's a real nice sign, though.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hang it. He'll come round once the mages walk in.", next = "BACK", reply = "Ha! Results first, permission later, that's the goblin way. I'll think about it, and I'll think about it with a ladder.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods = {
      lines = { { id = "go_default", text = "All over. The leather's local, mostly, Barrens raptor and thunder lizard, bought off hunters from Taurajo who don't know what it fetches overseas. The cloth comes by ship. And every now and then a gentleman from the Southsea crews sells me a trunk, and I don't ask whose trunk." } },
      choices = {
        { text = "You buy from the pirates?", next = "goods2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods2 = {
      lines = { { id = "go2_default", text = "I buy from a fella with a trunk, friend. What he does with his evenings is his affair. Gazlowe's got a quarrel with the Southsea boys, sure, and I'd never cross Gazlowe. I just don't see how a nice silk shirt is crossin' anybody." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grazlix = {
      lines = { { id = "gr_default", text = "Like a pair of boots, pal. Can't stand each other and useless apart. He bangs on metal all day and I get the headache, I air out a bolt of silk and he sneezes. But the books balance every month, and I never once caught him with a hand in the till." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Ah, the discreet line. I got leathers in a grey that don't show in moonlight or in shadow, soft-soled, no buckles to jingle. I sold a set to a lady from Stormwind and a set to a fella from Orgrimmar the same week, and I like to imagine they met." } },
      choices = { { text = "No buckles, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Dress for the job ya want, friend, and oil the leather. The Barrens'll crack it in a week otherwise." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel keeps this port open to everybody. Good for trade, and great for a fella who sells gloves in every size." } },
    booty_bay = { { id = "tp_booty", text = "Where the fashion comes from. Up here we're a season behind, and I do what I can." } },
    venture_company = { { id = "tp_venture", text = "No style, no manners and no credit. I wouldn't sell 'em a sock." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal. It ain't in this season's line." } },
  },
}

---------------------------------------------------------------------------
-- Zizzek: fishing supplies outside the Broken Keel Tavern, Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "zizzek", id = TODO_NPC("Zizzek"), name = "Zizzek", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "lazy", "cheerful" }, values = { "practical", "content" },
  notices = { "craft", "drink" },
  impression = {
    first = "Zizzek sells fishing gear from a stall outside the Broken Keel Tavern in Ratchet, close enough to the door to hear the gossip and smell the stew. He may be the only goblin on the coast who thinks he already has enough.",
    third = "{name} met Zizzek, who sells fishing supplies outside the Broken Keel Tavern in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Hey, pal. Poles, line, lures, bait. Take a look, no rush, the fish ain't goin' anywhere and neither am I." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "Now there's somebody who knows which end of a pole to hold. Pull up a crate, friend, tell me what's bitin'." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, you're back. Catch anything? Go on, lie to me, everybody does." },
    { id = "g_drunk", when = { drunk = true }, text = "Whoa, steady there, pal. Wiley's been generous, huh? Don't buy a pole in that state, you'll hook your own ear." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "Ya cook? Then you and me are friends already. Bring me whatever ya make from the catch, and I'll tell ya honestly if it's any good." },
    { id = "n_night", cat = "drink", when = { timeOfDay = "night" },
      text = "Late for shoppin', ain't it? Good time for fishin', though. The big ones come in under the pier after dark, when the cranes shut up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zizzek. I sell fishin' gear, right here by Wiley's door, where I can hear everything worth hearin' and never have to stand up for it. Kilxx down on the dock'll teach ya to fish, and I'll sell ya what he tells ya to buy." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I got all day, and that ain't a figure of speech, it's policy." },
        { id = "h_again2", text = "Sure, ask. I ain't busy, I'm never busy, it's a choice." },
        { id = "h_again3", text = "Go on. Talkin' beats workin'." },
      },
      choices = {
        { text = "Show me your fishing gear.", next = "BUSINESS" },
        { text = "You don't hustle like the other goblins here.", next = "hustle" },
        { text = "What's biting off Ratchet?", next = "biting" },
        { text = "You must hear a lot, sitting by the tavern door.", next = "hear" },
        { text = "Where's the best deep-water fishing on this coast?", next = "deep", when = { profession = { name = "Fishing", min = 75 } } },
        { text = "Tight lines, Zizzek.", next = "END" },
      },
    },
    hustle = {
      lines = { { id = "hu_default", text = "Nope, and they can't stand it. I worked the docks ten years, pal, haulin' crates for Dizzywig sunup to sundown. Then one day I did the sums and figured out a stall, a pole and a seat by the tavern cost almost nothin'. So I quit." } },
      choices = {
        { text = "A goblin who doesn't want more?", next = "hustle2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hustle2 = {
      lines = { { id = "hu2_default", text = "I know, I know, my mother cried. But look around. Gazlowe's got the whole town and he ain't slept since the pirates showed up. Fuzruckle's got a vault and an ulcer. I got a chair in the sun and fresh fish for supper. Who's ahead?" } },
      choices = {
        { text = "What do the others say to that?", next = "hustle3" },
        { text = "Something else, Zizzek.", next = "BACK" },
      },
    },
    hustle3 = {
      big = true,
      lines = { { id = "hu3_default", text = "That I'm a disgrace to the Cartel and a bad example to the young. Sputtervalve won't even nod at me. Maybe they got a point. A town runs on folks who want more, and if everybody sat down like me, there'd be no docks and no tavern to sit by." } },
      choices = {
        { text = "Enough is a fortune. You're the rich one here.", next = "BACK", reply = "Ha! I'm gonna tell Sputtervalve ya said that. Sit down, pal, have a fish.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're right. Others' striving built your seat.", next = "BACK", reply = "Yeah, I can't argue. I pay my stall fee on time, at least. That's my contribution, and I'm at peace with it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    biting = {
      lines = { { id = "bi_default", text = "Off the pier, oily blackmouth, all ya can carry, and the alchemists pay for the oil. Deviate fish up at the oases, if ya don't mind what they do to ya when you eat 'em. And firefin snapper further out, when the Southsea boys ain't in the way." } },
      choices = {
        { text = "What do deviate fish do to you?", next = "biting2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    biting2 = {
      lines = { { id = "bi2_default", text = "Depends on the fish, pal. I ate one and slept for a day. Fella next to me ate one off the same hook and swore he was a pirate till mornin', with the hat and everything, and nobody knows where he got the hat. Somethin' in that water ain't right." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } } },
    },
    hear = {
      lines = { { id = "he_default", text = "Everything. Sailors talk when they drink, and Wiley pours heavy. This week it's that the Southsea crews got a new captain's orders, that Northwatch is short of supplies, and that somebody's payin' good coin for news of a missin' Theramore ship. I just listen. Listenin's free." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deep = {
      lines = { { id = "de_default", text = "Past the wrecks south of town, if you can get by the freebooters. Otherwise take the boat to Booty Bay, where ya can throw a line off the dock into water with no bottom. Buy the bright lures before ya go, they charge double down there." } },
      choices = { { text = "Bright lures first. Something else.", next = "BACK", fx = { learn = { "booty_bay" } } } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Sit down more, pal. Half of what folks chase swims right up to ya if you're quiet." } },
    oases = { { id = "tp_oases", text = "The fish from up there come out wrong. Tasty, some of 'em, but wrong." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel takes my stall fee and leaves me be. Best deal I ever signed." } },
    booty_bay = { { id = "tp_booty", text = "Great fishin', terrible prices. I went once, caught a beauty and couldn't afford to have it cooked." } },
    _none = { { id = "tp_none", text = "No idea, pal. Didn't come by the tavern door, so I didn't hear it." } },
  },
}

---------------------------------------------------------------------------
-- Gagsprocket: engineering supplies in Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "gagsprocket", id = TODO_NPC("Gagsprocket"), name = "Gagsprocket", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "jumpy", "friendly" }, values = { "craft", "profit" },
  notices = { "craft", "class" },
  impression = {
    first = "Gagsprocket sells engineering supplies in Ratchet from behind a counter reinforced with boiler plate. He is friendly, missing part of one ear, and careful to say which shelf should not be bumped.",
    third = "{name} met Gagsprocket, who sells engineering supplies in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Hey, welcome, come on in, and don't touch the red shelf. Everything else ya can touch. Gagsprocket's Engineering Supplies, what are ya buildin'?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Great, great, somebody who knows not to shake the merchandise. What's the project, pal? Go on, I love hearin' about a project." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, you're back, and you're all there! So it worked, or it didn't work in a way ya could walk away from. Either's fine." },
    { id = "g_away", when = { away = 14 }, text = "Long time! I got new stock, new schematics and a new roof, and those three facts are related." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, huh. Do me a favour, pal, and keep the fire stuff holstered while you're in here. I'm real attached to the ear I got left." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ya mine! Listen, I buy stone. Coarse, heavy, solid, whatever ya got. Blasting powder don't grind itself, and my grinder's hungry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gagsprocket, that's me. Tinkerwiz teaches the engineerin' in this town, Vazario teaches the stuff that goes bang on purpose, and I sell the both of 'em and all their students the parts. Blasting powder, tubes, bolts, fuses, the odd schematic, and all of it stored real careful." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I'm listenin', I'm just also watchin' that crate." },
        { id = "h_again2", text = "Sure, ask away. Mind your elbow there." },
        { id = "h_again3", text = "Go on. Nothin's tickin' that shouldn't be." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What's on the red shelf?", next = "red" },
        { text = "What happened to your ear?", next = "ear" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Any schematics a working engineer should own?", next = "schem", when = { profession = "Engineering" } },
        { text = "I'll leave you to it, carefully.", next = "END" },
      },
    },
    red = {
      lines = { { id = "rd_default", text = "Stuff that ain't stable yet. Samples, mostly, that folks bring me to sell on consignment. I test everything before it goes on the regular shelves, friend, 'cause a customer who blows up don't come back, and that's just sound retail." } },
      choices = {
        { text = "Who brings you unstable samples?", next = "red2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    red2 = {
      lines = { { id = "rd2_default", text = "Everybody with a workshop and a dream. Lately there's a fella who won't give his name, pays cash, and brings me a powder that's twice as strong as anything I stock. I ain't put it out. I think it's Venture Company make, and I think it walked out of one of their mines." } },
      choices = {
        { text = "Stolen goods, then.", next = "red3" },
        { text = "Something else, Gagsprocket.", next = "BACK" },
      },
    },
    red3 = {
      big = true,
      lines = { { id = "rd3_default", text = "From the Venture Company, pal, who'd steal the shine off your teeth. That's the thing. Sellin' it'd be good money, and it'd hurt nobody I like. But Gazlowe keeps Ratchet clean so that everybody'll trade here, and a fence is a fence." } },
      choices = {
        { text = "Don't sell it. A clean port is worth more than one sale.", next = "BACK", reply = "Yeah. Yeah, that's the long-term play. I'll tell the fella no, and I'll tell Gazlowe who's askin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Robbing robbers isn't theft. Sell it.", next = "BACK", reply = "Ha! I like how ya think. All right, bottom shelf, plain label, and you didn't hear it from me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ear = {
      lines = { { id = "ea_default", text = "Oh, that. Product testin'. I had a fuse that was sold to me as a ten count, and it was more of a two count. I got the rest of me behind the counter in time. That's why the counter's boiler plate now, and why I count fuses myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "cu_default", text = "Sputtervalve, for one, he's always got some scheme goin' and never enough gyros for it. Wrenix buys small, odd parts and pays double not to be asked. And the crane crew down at the wharf go through bolts like ya wouldn't believe, on account of Bigglefuzz." } },
      choices = {
        { text = "Do both factions shop here?", next = "customers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers2 = {
      lines = { { id = "cu2_default", text = "Sure they do. Gnomes come in from Theramore to sniff at the goblin work and buy it anyway. Orcs come down from the Crossroads wantin' somethin' loud. I had one of each at the counter last week arguin' over the last flash bomb, and I sold it to a troll." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    schem = {
      lines = { { id = "sc_default", text = "Depends where you're at, pal. I rotate what I get. If you've picked the goblin school, go see Vazario about the big stuff, and come back to me for parts. If ya went gnomish, I'll still sell to ya, I'll just feel a little sorry." } },
      choices = { { text = "I'll see Vazario. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Count the fuse yourself, pal. Don't take the box's word for it." } },
    venture_company = { { id = "tp_venture", text = "Good engineers, rotten people. They'd strip-mine their own grandmother if she had a seam of tin in her." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel don't care what ya build so long as ya pay the docking fee. That's freedom, friend." } },
    gadgetzan = { { id = "tp_gadget", text = "Down in Tanaris. That's where the serious goblin engineers end up, where there's nothin' around to knock over." } },
    _none = { { id = "tp_none", text = "Dunno, pal. If it don't have a fuse, I probably wasn't payin' attention." } },
  },
}

---------------------------------------------------------------------------
-- Vazario Linkgrease: goblin engineering trainer in Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "vazario", id = TODO_NPC("Vazario Linkgrease"), name = "Vazario Linkgrease", title = "Goblin Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ratchet" }, temper = { "loud", "proud" }, values = { "craft", "bold" },
  notices = { "craft", "race" },
  impression = {
    first = "Vazario Linkgrease teaches the goblin school of engineering in Ratchet, where the measure of a device is how far away it can be heard. He is loud, proud and scorched, and guards his school's membership cards like a guild's seal.",
    third = "{name} met Vazario Linkgrease, the goblin engineering trainer in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Speak up, pal, I had a sapper charge go early this mornin' and I'm hearin' everything through a pillow! Vazario Linkgrease, goblin engineerin', the real thing." },
    { id = "g_card", when = { questActive = TODO_QUEST("Membership Card Renewal") }, text = "Lost your card, huh? Happens. Usually it's on fire at the time. The renewal fee's the renewal fee, pal, and then you're one of us again." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's you! Still got ten fingers? Lemme see. Close enough!" },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome, in my workshop. Take a good look around, friend. This is what engineerin' looks like when it ain't afraid of itself." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { name = "Engineering", min = 200 } },
      text = "Now those are an engineer's hands. Scarred, steady, a little singed. If you ain't picked a school yet, pal, ya just walked into the right one." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people got the right idea about powder, I'll give ya that. Ya just put it all in guns, and a gun only goes bang in one direction." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Vazario Linkgrease. I teach goblin engineerin' to card-carryin' members, and I mean the serious curriculum: sapper charges, mortars, rocket boots, the big bombs. Tinkerwiz'll get ya started on the basics. I'm where ya come when the basics ain't loud enough." },
      },
      again = {
        { id = "h_again", text = "What else? Say it loud, pal!" },
        { id = "h_again2", text = "Go on, ask. I got a fuse to trim, but it's a slow one." },
        { id = "h_again3", text = "Yeah? What else ya wanna know?" },
      },
      choices = {
        { text = "Teach me goblin engineering.", next = "BUSINESS" },
        { text = "What sets the goblin school apart?", next = "school" },
        { text = "Why does a school need membership cards?", next = "card" },
        { text = "Rocket boots sound like a way to die.", next = "boots" },
        { text = "I chose the gnomish school. Convince me I erred.", next = "gnomish", when = { profession = { name = "Engineering", min = 200 } } },
        { text = "Keep your eyebrows, Vazario.", next = "END" },
      },
    },
    school = {
      lines = { { id = "sh_default", text = "Results, pal. A gnome builds a gadget with forty parts that does somethin' clever one time in three. A goblin builds a bomb with four parts that does one thing every single time, and that thing is leave a hole. I know which one I want in my pack when the ogres show up." } },
      choices = {
        { text = "Your devices fail too, I've heard.", next = "school2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    school2 = {
      lines = { { id = "sh2_default", text = "Sure they do, and when they fail, they fail big, which is honest. Ya always know where ya stand with a goblin device, even if where ya stand is a crater. I lost a workshop to a mortar once. Learned more that afternoon than in a year of gettin' it right." } },
      choices = {
        { text = "Was anyone hurt in that afternoon's lesson?", next = "school3" },
        { text = "Something else, Vazario.", next = "BACK" },
      },
    },
    school3 = {
      big = true,
      lines = { { id = "sh3_default", text = "My apprentice lost two fingers. He's still with me, still buildin', says it was worth it. Tinkerwiz says I oughta make the students start small and work up slow. I say ya don't learn respect for powder from a firecracker, ya learn it from a near miss." } },
      choices = {
        { text = "Fear teaches fastest. Let them feel the blast.", next = "BACK", reply = "That's it exactly! Scared engineers measure twice. You'd fit right in here, pal.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "A teacher who spends students' fingers isn't teaching.", next = "BACK", reply = "Hey, now. All right. It ain't like I enjoyed it. Maybe the first month's on the small stuff, startin' next term.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    card = {
      lines = { { id = "ca_default", text = "'Cause the designs are worth money, pal, and the Cartel don't give away what it can license. Ya sign on in Gadgetzan with Nixx Sprocketspring, ya get your card, and then trainers like me'll open the good books. No card, no books, no exceptions, not even for my mother." } },
      choices = {
        { text = "And if someone loses the card?", next = "card2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    card2 = {
      lines = { { id = "ca2_default", text = "Then they pay the renewal and I write 'em a new one. It ain't cheap, on purpose. A goblin engineer who can't hang onto a piece of paper has got no business hangin' onto a sapper charge." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } } },
    },
    boots = {
      lines = { { id = "bo_default", text = "They're a way to not die, pal, by bein' somewhere else real fast. Sure, one time in a while they go off sideways, or just off. That's what the small print's for. Ya wear 'em knowin' the odds, and the odds are mostly good." } },
      choices = { { text = "Mostly good. Something else.", next = "BACK" } },
    },
    gnomish = {
      lines = { { id = "gn_default", text = "Ya picked the death ray that shoots the fella holdin' it and the helmet that takes over your own brain. Friend, I don't gotta convince ya, your school's doin' it for me. But the choice is made and the Cartel don't take transfers, so buy your powder from Gagsprocket and no hard feelings." } },
      choices = { { text = "No hard feelings. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Light it, then run. In that order, pal, and don't stop to admire your work." } },
    gadgetzan = { { id = "tp_gadget", text = "Where ya sign up for the goblin school, out in the Tanaris desert. Plenty of sand to test things on, and nobody to complain." } },
    venture_company = { { id = "tp_venture", text = "They got good engineers and they treat 'em like shovels. Half my best students are fellas who walked out on 'em." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel owns the patents and I teach under licence. Everything above board, and everything billed." } },
    _none = { { id = "tp_none", text = "What? Say again? Nah, don't know it, pal, even now I heard ya." } },
  },
}

---------------------------------------------------------------------------
-- Acolyte Fenrick: human student of Strahad Farsan, Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "fenrick", id = TODO_NPC("Acolyte Fenrick"), name = "Acolyte Fenrick",
  bible = "bibles/more_folk.md", role = "scholar", tier = "service",
  communities = { "ratchet" }, temper = { "earnest", "anxious" }, values = { "curious", "careful" },
  notices = { "class", "light" },
  impression = {
    first = "Acolyte Fenrick is the youngest of Strahad Farsan's students in Ratchet, a human who keeps his place in the summoning circle and his eyes on the chalk. He is earnest, a little frightened, and more honest about it than the others.",
    third = "{name} met Acolyte Fenrick, a young human warlock studying under Strahad Farsan in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Please mind the chalk, if you would. I have redrawn that line three times today, and Master Strahad notices if it is a hair out of true." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "You practise the art as well, I can tell by how you looked at the circle before you looked at us. Are you here for the master, or for one of the others?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again. I am still here, as you see. One does not leave in the middle of a binding." },
    { id = "g_paladin", when = { class = { "PALADIN", "PRIEST" } }, text = "I know what you must think of this room. I would only ask that you say it to the master and not to me, since he answers such things better than I do." },
  },
  notice = {
    { id = "n_human", cat = "light", when = { race = "Human" },
      text = "You are from the kingdoms, by your speech. I had not expected to hear Stormwind's accent in a goblin port. Forgive me, it has been a long time since I heard it kindly." },
    { id = "n_demon", cat = "class", when = { pet = { type = "Demon" } },
      text = "Yours stands very quietly. I envy that. Mine still tests every word I say, and I have not yet got through a week without a mistake." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Fenrick, an acolyte of Master Strahad Farsan. The three of us hold the circle while he works, and when he is not working we study. He says Ratchet is the one town on this coast where a warlock is asked for the rent and nothing else, and so here we are." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I can talk, so long as I do not move my feet." },
        { id = "h_again2", text = "Please, ask. It is a relief to speak of anything but sigils." },
        { id = "h_again3", text = "Go on. Magaz says I talk too much, but she is not listening just now." },
      },
      choices = {
        { text = "What brought you to study under Strahad?", next = "why" },
        { text = "A human, an orc and a Forsaken share this circle.", next = "three" },
        { text = "You seem frightened of your own craft.", next = "fear" },
        { text = "What does holding the circle ask of you?", next = "circle" },
        { text = "Do you miss Stormwind, Fenrick?", next = "home", when = { race = "Human" } },
        { text = "I'll leave you to your chalk.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "I had the gift, and nowhere lawful to learn its use. In Stormwind the craft is taught in a cellar, by people who jump when a door opens. I heard there was a master in Ratchet who took students openly and asked no oath but obedience, and I took ship." } },
      choices = {
        { text = "And is he what you hoped?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "wy2_default", text = "He is exacting, and he is never cruel, which I had not expected of a man in his trade. He told us on the first day about two students of his who were eaten, quite calmly, as one might mention the weather. I have never forgotten a word of a lesson since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    three = {
      lines = { { id = "th_default", text = "We do, and it was very strange at first. Magaz did not speak to me for a month. Wytula spoke to me a great deal, mostly about what parts of me would keep longest. But a circle cannot be held by people who mistrust one another, so we learned not to." } },
      choices = {
        { text = "The war outside doesn't reach this room?", next = "three2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    three2 = {
      lines = { { id = "th2_default", text = "It reaches us in letters. Magaz has a brother with the garrison at the Crossroads, and I have a cousin at Northwatch Hold, which is not thirty miles from him. We have agreed not to tell each other what the letters say." } },
      choices = {
        { text = "And if your kin met on a battlefield?", next = "three3" },
        { text = "Something else, Fenrick.", next = "BACK" },
      },
    },
    three3 = {
      big = true,
      lines = { { id = "th3_default", narr = "He glances across the circle at the orc, then back at the chalk.", text = "Then one of us would grieve and the other would hold the circle steady for them. We said so aloud once, late at night. Master Strahad says our first loyalty is to the art and to each other, and that the kingdoms we left gave up their claim when they drove us out." } },
      choices = {
        { text = "He's right. You owe nothing to those who cast you out.", next = "BACK", reply = "I think so too, on most days. It is easier to believe at this end of the sea.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Blood and homeland still bind you, whatever he says.", next = "BACK", reply = "Perhaps they do. I still write to my cousin, after all. I have not told the master that.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "I am, and the master says that is the only sensible way to practise it. The students who were not afraid are the ones in his story. I would rather be frightened and careful for forty years than bold for one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "ci_default", text = "Stillness, mostly, and attention that does not wander. Each of us anchors one point, and if any one of us falters, whatever is inside may choose that point to leave by. Mistress Menara says I have the steadiest hands of the three, which was kind of her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "I miss the bells of the cathedral, which is an odd thing for someone like me to say. I do not miss being looked at. Here the goblins look only at my purse, and I find I can bear that much better." } },
      choices = { { text = "The bells still ring. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Check the circle before you begin, and then check it once more. I have never regretted the second look." } },
    steamwheedle = { { id = "tp_steam", text = "The goblins let us be so long as the rent is paid and nothing escapes. The master pays early, to be safe." } },
    burning_blade = { { id = "tp_blade", text = "Magaz speaks of them with real hatred. They are what becomes of our art when the fear is taken out of it." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. I know very little that is not in the master's books." } },
  },
}

---------------------------------------------------------------------------
-- Acolyte Magaz: orc student of Strahad Farsan (Shard of an Infernal).
---------------------------------------------------------------------------
P:NPC {
  key = "magaz", id = TODO_NPC("Acolyte Magaz"), name = "Acolyte Magaz",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "fierce", "guarded" }, values = { "discipline", "proud" },
  notices = { "class", "race" },
  impression = {
    first = "Acolyte Magaz is an orc warlock in Strahad Farsan's circle at Ratchet, fierce and sparing with words. She studies the fire of infernals as a soldier studies an enemy's weapon, and she does not pretend to like it.",
    third = "{name} met Acolyte Magaz, an orc warlock studying under Strahad Farsan in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Say what you want and stay outside the chalk. I'll not have a binding spoiled by a careless boot." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Another of the craft. Good. Then I need not explain why you should keep your voice down in this room." },
    { id = "g_active", when = { questActive = TODO_QUEST("Shard of an Infernal") }, text = "Have you the shard? It will still be warm, if it is a true one. Do not carry it against your skin." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Speak, then." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of my own people. You'll have been told that orcs like me are a danger to the Horde. I study so that I'll never be one, and I'll thank you to remember the difference." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Your spirits recoil from this room, I can see it in how you stand. Good, they should, and so should you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Magaz, acolyte to Strahad Farsan. I hold the western point of the circle, and my own study is the infernal: the burning stone the Legion throws down from the sky. My people saw enough of them to last us, and I mean to know how they are made." },
        { id = "h_before", when = { all = { { class = "WARLOCK" }, { questActive = TODO_QUEST("Components for the Enchanted Gold Bloodrobe") } } },
          text = "I am Magaz. The master has told me what you are making, and one part of it is mine to prepare. I will need a shard broken from an infernal while its fire still burns, and you are the one who will fetch it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Shard of an Infernal") },
          text = "The shard must come from an infernal that was burning when it fell. Strahad will have told you where the Legion's stones still walk. Break it, take the piece that glows, and bring it straight to me." },
        { id = "h_done", when = { questDone = TODO_QUEST("Shard of an Infernal") },
          text = "The shard you brought was a strong one. I learned more from it in a night than from a season of the master's books, and I am in your debt for that." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Ask. I'm listening, and I'm holding a point, so don't expect me to turn." },
        { id = "h_again3", text = "Go on, then." },
      },
      choices = {
        { text = "Why study the infernal, of all demons?", next = "infernal" },
        { text = "An orc warlock, far from Orgrimmar.", next = "far" },
        { text = "What do you make of your fellow acolytes?", next = "others" },
        { text = "What will you do with the shard?", next = "shard", when = { questActive = TODO_QUEST("Shard of an Infernal") } },
        { text = "Gan'rul Bloodeye trained me. Do you know him?", next = "ganrul", when = { class = "WARLOCK", race = "Orc" } },
        { text = "I'll not disturb the circle.", next = "END" },
      },
    },
    infernal = {
      lines = { { id = "in_default", text = "Because it has no mind to bargain with. An imp lies and a succubus flatters, but an infernal is only fire and stone with a command hammered into it. If we can learn how the command is set, we can learn how to break it, or to set our own." } },
      choices = {
        { text = "You'd command one yourself?", next = "infernal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    infernal2 = {
      lines = { { id = "in2_default", text = "If the Horde needed it, yes. I watched infernals fall on our camps in Ashenvale when Mannoroth's servants came for us. Nothing we had could stop them but more blood. I would give the Warchief the same weapon to answer with, if I can make it safe." } },
      choices = {
        { text = "Can such a thing ever be safe?", next = "infernal3" },
        { text = "Something else, Magaz.", next = "BACK" },
      },
    },
    infernal3 = {
      big = true,
      lines = { { id = "in3_default", text = "The master says no, and that the most a warlock can hope for is a short leash and a short summoning. I think he is too cautious. Every weapon was unsafe until someone learned to hold it, and my people do not have the luxury of leaving weapons on the ground." } },
      choices = {
        { text = "Learn it. Better in our hands than only in theirs.", next = "BACK", reply = "That is how I see it. I'll take the risk on myself, and I'll not ask anyone else to stand near.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Your master is right. The Legion's fire burned you once.", next = "BACK", reply = "It did. That is exactly why I'll not look away from it. But I take your meaning, and I'll keep the leash short.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = { { id = "fa_default", text = "By choice. In Orgrimmar the warlocks are kept in the Cleft of Shadow, watched, and taught only what is thought safe. I wanted more than that. Strahad teaches what is true and leaves it to us to survive it." } },
      choices = {
        { text = "Does Orgrimmar know you're here?", next = "far2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far2 = {
      lines = { { id = "fa2_default", text = "They know. I hid nothing, and I write to my old teacher each season with what I have learned. I am not the Burning Blade, skulking in a cave. When I have what I came for, I will carry it home and lay it at the Warchief's feet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    others = {
      lines = { { id = "ot_default", text = "Fenrick is soft, and he is steady, and I have stopped minding that he is human. Wytula is clever and cold, and I would not turn my back on her outside this room. Inside it I trust them both with my life, since I must." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shard = {
      lines = { { id = "sd_default", text = "Draw the fire out of it slowly and fix it in the thread of the robe, so that it wards the wearer and does not burn them. It is delicate work. If I do it badly, you will know, though not for long." } },
      choices = { { text = "Then do it well. Something else.", next = "BACK" } },
    },
    ganrul = {
      lines = { { id = "gn_default", text = "He was my teacher as well, and a hard one. He told me I wanted too much too quickly, and he was right, and I left anyway. If you see him, tell him Magaz still has both her hands and all of her mind." } },
      choices = { { text = "I'll tell him. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Know your enemy's weapon better than he does. It is the only kind of knowledge I have found worth the price." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who took the Legion's leash back in their own teeth. I would burn every one of them, and I know how." } },
    thrall = { { id = "tp_thrall", text = "He broke the demon's hold on us. Everything I learn in this room, I learn so that it can never be set again." } },
    warsong = { { id = "tp_warsong", text = "I was with them in Ashenvale when Hellscream drank and when he died. Do not ask me more than that." } },
    _none = { { id = "tp_none", text = "I don't know, and I've a point to hold." } },
  },
}

---------------------------------------------------------------------------
-- Acolyte Wytula: Forsaken student of Strahad Farsan (Shard of a Felhound).
---------------------------------------------------------------------------
P:NPC {
  key = "wytula", id = TODO_NPC("Acolyte Wytula"), name = "Acolyte Wytula",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "dry", "cold" }, values = { "curious", "cunning" },
  notices = { "class", "race" },
  impression = {
    first = "Acolyte Wytula is a Forsaken warlock in Strahad Farsan's circle at Ratchet, with a dry, precise manner and an interest in felhounds that she describes as professional. She speaks of her own death the way others mention a change of address.",
    third = "{name} met Acolyte Wytula, a Forsaken warlock studying under Strahad Farsan in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "A visitor. Do stand a little to the left, you are in my light, and I am told the living find the draught from the circle unpleasant." },
    { id = "g_mage", when = { class = { "MAGE", "PRIEST" } }, text = "Ah, you carry a great deal of magic about with you. How appetising you would be to the creatures I study. Do come in." },
    { id = "g_active", when = { questActive = TODO_QUEST("Shard of a Felhound") }, text = "You have not brought my shard yet, I see. No matter. I have a great deal of time, and you, presumably, have somewhat less." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. How conscientious. Most people find one conversation with me sufficient." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's own, and so far from Tirisfal. We do seem to turn up wherever there is something unpleasant worth knowing." },
    { id = "n_felhunter", cat = "class", when = { pet = { family = "Felhunter" } },
      text = "Oh, you have one. May I look? Those tendrils are tasting the air for spellwork, you know. I do hope you feed it regularly, for your own sake." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Wytula, acolyte to Strahad Farsan, and I hold the northern point of his circle. My study is the felhound, the Legion's hunting dog, which feeds on magic as a tick feeds on blood. It is a fascinating animal, and nobody else here will dine with me because of how I talk about it." },
        { id = "h_before", when = { all = { { class = "WARLOCK" }, { questActive = TODO_QUEST("Components for the Enchanted Gold Bloodrobe") } } },
          text = "I am Wytula. The master tells me you are assembling a robe of some ambition, and that one component falls to me. I shall require a shard taken from a felhound, and I shall require you to fetch it, since I am needed at my point." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Shard of a Felhound") },
          text = "The shard grows at the base of the creature's skull, where its hunger sits. Strahad will have told you where such hounds are kept. Do try to take it whole, as a cracked one leaks, and it is not a pleasant thing to have leak." },
        { id = "h_done", when = { questDone = TODO_QUEST("Shard of a Felhound") },
          text = "Your shard was an excellent specimen. It tried to drink the wards off my worktable twice before I had it settled. I was quite charmed." },
      },
      again = {
        { id = "h_again", text = "Something further? I am at leisure, in my fashion." },
        { id = "h_again2", text = "Do go on. Conversation is one of the few appetites I have left." },
        { id = "h_again3", text = "Ask. I shall answer honestly, which people tend to regret." },
      },
      choices = {
        { text = "What draws you to felhounds?", next = "hound" },
        { text = "You speak lightly of being dead.", next = "dead" },
        { text = "Why study here and not in the Undercity?", next = "why" },
        { text = "What is the shard for?", next = "shard", when = { questActive = TODO_QUEST("Shard of a Felhound") } },
        { text = "Do the living in this room wear on you, sister?", next = "living", when = { race = "Scourge" } },
        { text = "I'll leave you to your studies.", next = "END" },
      },
    },
    hound = {
      lines = { { id = "ho_default", text = "Their simplicity. A felhound wants one thing, which is to eat whatever magic is nearest, and every part of it is made for that purpose. There is no vanity in it and no deceit. After a lifetime among people, and some time among the Forsaken, I find that restful." } },
      choices = {
        { text = "What use is a thing that eats magic?", next = "hound2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hound2 = {
      lines = { { id = "ho2_default", text = "Consider who the Forsaken's enemies are. The Scourge is held together by necromancy, and the Scarlet Crusade by the prayers of its priests. A creature that devours both, on a leash in the right hands, would be worth a regiment. I intend mine to be the right hands." } },
      choices = {
        { text = "And when it has eaten your enemies' magic?", next = "hound3" },
        { text = "Something else, Wytula.", next = "BACK" },
      },
    },
    hound3 = {
      big = true,
      lines = { { id = "ho3_default", text = "It will look about for more, naturally, and the nearest will be mine. Or it will notice that we Forsaken are ourselves held together by something not unlike a spell. Strahad raised that point. I found it an interesting risk, and he found my interest alarming." } },
      choices = {
        { text = "Some weapons are too hungry to be worth forging.", next = "BACK", reply = "How prudent. You and the master would get on. I shall note the objection, and file it.", fx = { align = { light = 1 } } },
        { text = "A risk that could end the Scourge is worth running.", next = "BACK", reply = "Precisely my view. I do like a person who can do arithmetic with unpleasant numbers.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "It was some time ago, and I have had leisure to become bored of it. I died in Lordaeron of the plague, rose in the Lich King's service, and was freed with the rest when the Dark Lady broke his hold. One adjusts. I sleep less, and I find I read a great deal more." } },
      choices = {
        { text = "Were you a warlock in life?", next = "dead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead2 = {
      lines = { { id = "de2_default", text = "I was a schoolmistress, in a town that no longer exists. I taught children their letters. One does not anticipate a second career, but I find the essentials are similar: one must be clear, one must be firm, and one must never show the creature one is afraid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wy_default", text = "The Undercity's warlocks are excellent, and every one of them reports to someone. Here I report to Strahad, who wants only that I not be eaten. Besides, the Royal Apothecary Society regards any knowledge it did not brew itself as an impertinence." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shard = {
      lines = { { id = "sd_default", text = "I shall grind it and work it into the lining, so that the robe drinks a little of whatever is cast at its wearer. Only a little. Too much, and it would begin on the wearer, and you would have a very thin warlock in a very well-fed robe." } },
      choices = { { text = "Only a little, please. Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "li_default", text = "Less than I expected. The boy apologises to me when he sneezes, and the orc is too proud to show that the smell troubles her. They have never once called me a thing. It is more courtesy than I had from the living when I was one of them." } },
      choices = { { text = "Courtesy is rare enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Never let a hungry thing see that you are frightened of it. This applies to demons, children and creditors alike." } },
    burning_blade = { { id = "tp_blade", text = "Enthusiasts. They mistake being used for being chosen. Magaz would like to burn them, and I should like to watch." } },
    steamwheedle = { { id = "tp_steam", text = "The goblins charge us for the smell, as a separate line on the rent. I admire the candour of it." } },
    _none = { { id = "tp_none", text = "I have no idea, and I dislike guessing. It is so seldom rewarded." } },
  },
}

---------------------------------------------------------------------------
-- Waldor: leatherworking trainer in the cave above the Wailing Caverns.
---------------------------------------------------------------------------
P:NPC {
  key = "waldor", id = TODO_NPC("Waldor"), name = "Waldor", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  temper = { "calm", "curious" }, values = { "craft", "patient" },
  notices = { "craft", "class" },
  impression = {
    first = "Waldor teaches leatherworking in the cave above the Wailing Caverns, a tauren who came to study the strange scaled hides the caverns give up. He works them with a craftsman's delight and a hunter's unease.",
    third = "{name} met Waldor, the tauren leatherworking trainer in the cave above the Wailing Caverns.",
  },
  greetings = {
    { id = "g_default", text = "You have climbed a long way to find a leatherworker, friend. Sit, and mind the hides drying by the wall, for some of them are not quite like any you have seen." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "Ah, one who knows the craft. Come and feel this scale, and tell me whether you have ever worked anything like it. I had not, before this place." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned to the hill. Have you been below, and what did you bring up with you?" },
    { id = "g_away", when = { away = 14 }, text = "It has been long. The caverns have not grown quieter while you were gone, and neither have my questions about them." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "A skinner. Then you are the one I most hoped to see. The deviate creatures below must be skinned within the hour, or the scale dulls, and I am too old to run from raptors with a knife in my hand." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The disciples in the next chamber will wish to speak with you. Their master sleeps below, and what he dreams has changed every beast in those caves." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Waldor. I learned my craft on the plains, and I came to this hill when the hunters began bringing out hides from the caverns that shimmered like wet stone. I teach here now, to any who make the climb, and I study what the caves have made." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The hides will dry without me." },
        { id = "h_again2", text = "Speak, friend. It is quiet on this hill, and I welcome a voice." },
        { id = "h_again3", text = "Ask. I have more questions than answers myself, but I will share what I have." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What are these deviate hides?", next = "deviate" },
        { text = "You share this cave with a night elf.", next = "kalldan" },
        { text = "Why teach in so remote a place?", next = "remote" },
        { text = "I've deviate scales. What can be made of them?", next = "make", when = { profession = { name = "Leatherworking", min = 90 } } },
        { text = "Earth Mother watch over you, Waldor.", next = "END" },
      },
    },
    deviate = {
      lines = { { id = "dv_default", text = "They come from the raptors and serpents that live in the Wailing Caverns. Once those were ordinary beasts of the Barrens. Something below has changed them, so that the scale grows hard and bright and holds a little of whatever magic did the changing." } },
      choices = {
        { text = "Is it safe to wear such a thing?", next = "deviate2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deviate2 = {
      lines = { { id = "dv2_default", text = "I have worn a belt of it for two seasons and come to no harm that I can find. It is light, and it turns a blade better than hide twice as thick. Yet Ebru, who keeps vigil in the next chamber, will not touch it. She says it is the skin of a sickness." } },
      choices = {
        { text = "And what do you say to Ebru?", next = "deviate3" },
        { text = "Something else, Waldor.", next = "BACK" },
      },
    },
    deviate3 = {
      big = true,
      lines = { { id = "dv3_default", text = "That the beasts are slain whether I work their hides or not, and that to leave them rotting honors nothing. But I have asked myself whether I do right to make a trade of a corruption, and to teach others to seek it out." } },
      choices = {
        { text = "Use what the hunt gives. Waste honors nobody.", next = "BACK", reply = "That is the teaching of my people, and I have leaned on it. I am glad to hear it from another mouth.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Ebru is right. A sickness shouldn't become a livelihood.", next = "BACK", reply = "It may be so. When the dreamer below is woken and the caverns healed, I will set these patterns aside, and gladly.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kalldan = {
      lines = {
        { id = "ka_default", text = "Kalldan Felmoon. He sells the thread and dyes and the patterns for deviate scale, and he has forgotten more about leather than I shall ever learn. We did not speak for the first month. Then he corrected my stitching without being asked, and we have been friends since." },
        { id = "ka_elf", when = { race = "NightElf" }, text = "Your kinsman, Kalldan Felmoon. He is slow to trust and worth the waiting. I think he will be gladder to see you than he lets his face show." },
      },
      choices = {
        { text = "A tauren and a night elf, sharing a trade?", next = "kalldan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kalldan2 = {
      lines = { { id = "ka2_default", text = "Our peoples both learned the druid's path from the same source, long ago, or so the Runetotem say. He and I have found we argue only about tanning. On the land, and on what is owed to it, we have not yet disagreed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    remote = {
      lines = { { id = "re_default", text = "Because the scale must be worked fresh, and because those who come here are already brave enough to go below. I would sooner teach ten who have earned the climb than a hundred in a town. And I confess I like the wind up here." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } } },
    },
    make = {
      lines = { { id = "mk_default", text = "A belt first, which is forgiving. Kalldan sells the patterns for gloves and a cloak besides, and those are finer work. Cut along the grain of the scale and never across it, or it will shed like a snake in spring." } },
      choices = { { text = "Along the grain. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Work a hide while it is fresh, and a friendship while it is new. Both stiffen if they are left." } },
    wailing_caverns = { { id = "tp_wc", text = "The caves breathe mist through the stone, and it cries as it comes. The beasts within were changed by a dream, the disciples say, and I have seen nothing to make me doubt it." } },
    naralex = { { id = "tp_naralex", text = "The druid who sleeps below. The disciples speak of him with love and with fear. Ask Ebru or Nalpak, for it is their grief and not mine to tell." } },
    oases = { { id = "tp_oases", text = "Naralex meant to make the whole Barrens green as those are. I look at what his dream did to the raptors, and I wonder what the grass would have become." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar do not climb this hill. I think the crying of the caves frightens them, and for once I am grateful to it." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. I know hides, and of late I am less sure even of those." } },
  },
}

---------------------------------------------------------------------------
-- Kalldan Felmoon: night elf leatherworking supplier above the Wailing Caverns.
---------------------------------------------------------------------------
P:NPC {
  key = "kalldan", id = TODO_NPC("Kalldan Felmoon"), name = "Kalldan Felmoon", title = "Specialist Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  temper = { "reserved", "exacting" }, values = { "craft", "devout" },
  notices = { "race", "craft" },
  impression = {
    first = "Kalldan Felmoon sells thread, dyes and the patterns for deviate scale in the cave above the Wailing Caverns, a night elf alone among tauren and wanderers. He is reserved, exacting about leather, and seems to be waiting for something below to end.",
    third = "{name} met Kalldan Felmoon, the night elf who sells leatherworking patterns above the Wailing Caverns.",
  },
  greetings = {
    { id = "g_default", text = "You have found me, then. I sell to those who work leather, and I ask only that you handle the patterns with clean hands." },
    { id = "g_elf", when = { race = "NightElf" }, text = "Ishnu-alah. It is long since I heard a voice from home on this hill. You have come about the dreamer, I think, or you would not be so far from the forest." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You need not look for a blade in my hand. I have kept my stall among your people for some time now, and they have learned that I am here for the caverns and not for the war." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Is there news from below, or have you only come for thread?" },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. I remember what your people's axes did in Ashenvale. I also remember who stood at Hyjal, and so I will sell to you, and we need not speak of the rest." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather. Your hands say you rush the stitching. It is the common fault of the short-lived, and it can be mended with attention." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kalldan Felmoon. I came south in the footsteps of those who followed Naralex, and when the dream went wrong I did not leave. I keep the patterns for working deviate scale, which Waldor teaches, and the thread and dyes any leatherworker needs." },
      },
      again = {
        { id = "h_again", text = "Ask what else you wish. I have learned to be patient with questions." },
        { id = "h_again2", text = "Speak. The hill is quiet, and I have time beyond your measure." },
        { id = "h_again3", text = "Go on. I am listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "A night elf, alone in the Barrens.", next = "alone" },
        { text = "Why sell patterns made from corrupted beasts?", next = "patterns" },
        { text = "How do you find working beside a tauren?", next = "waldor" },
        { text = "What do you know of the dreamer below?", next = "dreamer", when = { class = "DRUID" } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "Not wholly alone. The Disciples of Naralex keep the next chamber, and there are those of my people among them. But I am no druid. I came to serve them with my trade, and I stayed because someone should be here when it ends, one way or the other." } },
      choices = {
        { text = "You expect it to end badly.", next = "alone2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone2 = {
      lines = { { id = "al2_default", text = "I have lived long enough to expect nothing. Naralex meant to heal this land through the Emerald Dream, and the Dream gave him a nightmare in return. Whether he can be woken, I cannot say. I know only that his followers below now wear serpents' eyes." } },
      choices = {
        { text = "Was he wrong to try?", next = "alone3" },
        { text = "Something else, Kalldan.", next = "BACK" },
      },
    },
    alone3 = {
      big = true,
      lines = { { id = "al3_default", text = "That is the question I have turned over on this hill for more nights than you have lived. He wished to make a wasteland bloom, and I can think of no nobler wish. Yet he reached into the Dream alone and far from Nordrassil, and bent it to his own purpose." } },
      choices = {
        { text = "To heal a dying land is worth any risk.", next = "BACK", reply = "So he believed, and I loved him for it. I would still follow that belief down into the dark, if I had the gift.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Dream is not ours to bend. He overreached.", next = "BACK", reply = "The elders of the Circle would say the same. It is a hard judgment on a good heart, and I fear it is the true one.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patterns = {
      lines = { { id = "pa_default", text = "Because the beasts are slain regardless, by those who go below to end the corruption. A hide left to rot serves nothing. Worked with care, it becomes a shield for the next who descends, and so the sickness is made to arm its own cure." } },
      choices = {
        { text = "Do the disciples approve?", next = "patterns2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patterns2 = {
      lines = { { id = "pa2_default", text = "Ebru does not, and she tells me so. Nalpak has said nothing, which I take for leave. I do not ask for approval. I ask that what is taken from the caverns be used well, and I refuse my patterns to those who seem to want only the profit." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } } },
    },
    waldor = {
      lines = { { id = "wa_default", text = "Better than I had thought to. He is young, as all of them are, and his stitches wandered when he came. But he thanks each hide before he cuts it, and I had not seen that since the old hunters of Ashenvale. We understand one another without many words." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dreamer = {
      lines = { { id = "dr_default", text = "That he was among the most gifted of his generation, and the most impatient. That he sleeps in the deepest cavern, and that four of his own disciples, changed by the nightmare, now stand between him and waking. Speak with the Disciple within, who still keeps faith. You may be what he waits for." } },
      choices = { { text = "I'll find the Disciple. Something else.", next = "BACK", fx = { learn = { "naralex" } } } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Do nothing in haste that will outlast you. It is a rule made for the long-lived, and it serves the rest of you nearly as well." } },
    naralex = { { id = "tp_naralex", text = "A druid of great gift who sought to heal the Barrens through the Dream. He sleeps below, and his sleep has become a nightmare for every living thing in those caves." } },
    wailing_caverns = { { id = "tp_wc", text = "The stone weeps mist and the beasts within are twisted. It was to be the heart of a green land. It may yet be, if he wakes." } },
    sentinels = { { id = "tp_sentinels", text = "They guard Ashenvale, as they should. I serve the same land in another place, and I do not think they would understand how." } },
    oases = { { id = "tp_oases", text = "They were his first success, and the first warning. Life poured into them without measure, and life without measure is only another kind of ruin." } },
    _none = { { id = "tp_none", text = "I have no knowledge of that. Ten thousand years, and still there are such things." } },
  },
}

---------------------------------------------------------------------------
-- Feegly the Exiled: trogg outcast at Bael Modan (The Tear of the Moons).
---------------------------------------------------------------------------
P:NPC {
  key = "feegly", id = TODO_NPC("Feegly the Exiled"), name = "Feegly the Exiled",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  temper = { "sly", "wheedling" }, values = { "greedy", "bitter" },
  notices = { "race", "craft" },
  impression = {
    first = "Feegly the Exiled is a trogg who lurks at the edge of the Bael Modan dig, cast out by the dwarves he once dug for. He wants a gem called the Tear of the Moons with a hunger that is hard to watch, and he is cleverer than he lets on.",
    third = "{name} met Feegly the Exiled, a trogg outcast who covets a gem held by the dwarves of Bael Modan.",
  },
  greetings = {
    { id = "g_default", text = "Psst! You, not-dwarf! Come close and talk quiet, because Feegly has a thing to say and the beard-ones have big ears." },
    { id = "g_find", when = { questActive = TODO_QUEST("Feegly the Exiled") }, text = "Somebody told you about Feegly? Good, good, then you came to help. Feegly knew a friend would come, if Feegly waited long enough behind this rock." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Tear of the Moons") }, text = "You have it? You have Feegly's shiny? No? Then why are you here and not in the keep, where the general's box is?" },
    { id = "g_back", when = { metBefore = true }, text = "It is you again! Feegly remembers your smell, and it is a better smell than dwarf." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You are a digger! Feegly sees the pick. Feegly was the best digger in all Bael Modan, and the beard-ones still threw him out, so do not trust a boss, digger." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A big horn-one. The beard-ones dig up your people's ground and do not ask, Feegly saw it. So you and Feegly hate the same dwarves, and that makes us nearly friends." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Feegly is Feegly. Feegly dug for the beard-ones in the big hole, deeper and faster than any of them, until they took what Feegly found and chased him out with shovels. Now Feegly sits behind a rock and thinks about it all day." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Tear of the Moons") },
          text = "Feegly is Feegly, and Feegly found a stone in the deep dig, white and shining, the Tear of the Moons. The dwarves took it and threw Feegly out. General Twinbraid keeps it in his strongbox in the keep, and Feegly wants it back, and you look strong enough to fetch it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Tear of the Moons") },
          text = "The keep is Bael'dun, east over the hills, full of dwarves with guns. The general's strongbox is inside, up high. Open it, take the white shiny stone, and bring it only to Feegly. Do not look at it too long, friend." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Tear of the Moons") },
          narr = "He keeps one hand closed tight against his chest the whole time he speaks.",
          text = "Feegly has it now, and Feegly is never letting go. You are the only not-trogg who ever kept a promise to Feegly. If Feegly had a second shiny, you could look at it." },
      },
      again = {
        { id = "h_again", text = "What else does the friend want to know? Feegly will tell, if it is quiet." },
        { id = "h_again2", text = "Ask, ask, but keep low. The beard-ones walk the ridge." },
        { id = "h_again3", text = "Feegly is listening. Feegly has nothing else to do behind this rock." },
      },
      choices = {
        { text = "What is the Tear of the Moons?", next = "tear" },
        { text = "Why did the dwarves cast you out?", next = "exile" },
        { text = "A trogg who talks is a rare thing.", next = "talk" },
        { text = "What are the dwarves digging for here?", next = "dig" },
        { text = "The dwarves cut into sacred ground. Did you help them?", next = "ground", when = { race = "Tauren" } },
        { text = "Stay hidden, Feegly.", next = "END" },
      },
    },
    tear = {
      lines = { { id = "te_default", text = "A stone, white like two moons in one, that Feegly dug out from very deep. When Feegly held it, Feegly could think better and see in the dark of his own head. Feegly was only one night with it, and it was the best night Feegly ever had." } },
      choices = {
        { text = "What do the dwarves want with it?", next = "tear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tear2 = {
      lines = { { id = "te2_default", text = "They do not know what it is! They put it in a box to send to their mountain, for the long-beards to look at through glass. They would lock it in a room. Feegly would hold it every day, so who should have it, friend?" } },
      choices = {
        { text = "And once you have it, what then?", next = "tear3" },
        { text = "Something else, Feegly.", next = "BACK" },
      },
    },
    tear3 = {
      big = true,
      lines = { { id = "te3_default", text = "Then Feegly goes far away with it, down a hole of his own, and nobody takes it again. That is all, Feegly swears. You are thinking Feegly is a thief asking you to be a thief, yes? But Feegly found it first, with his own two hands." } },
      choices = {
        { text = "You dug it out. It was yours before theirs.", next = "BACK", reply = "Yes! Yes, the friend sees! Finder keeps, that is the oldest rule under the ground.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "It's theft either way. I'll not pretend otherwise.", next = "BACK", reply = "Call it what you like, not-dwarf, only bring it. Feegly does not need you to feel good, Feegly needs the shiny.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile = {
      lines = { { id = "ex_default", text = "Because Feegly would not give up the stone! Feegly hid it in his cheek, and they found it, and the foreman said Feegly was a thief for keeping what Feegly dug. So they took it and drove Feegly out, and the other diggers threw rocks." } },
      choices = {
        { text = "The other troggs sided with the dwarves?", next = "exile2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile2 = {
      lines = { { id = "ex2_default", text = "Troggs side with whoever has the food. Feegly does not blame them much. But Feegly thinks more than they do, since the stone, and thinking is lonely. Feegly did not know that before." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
    talk = {
      lines = { { id = "ta_default", text = "Feegly learned from listening to the beard-ones shout. They shout a lot, mostly about ale and about the horn-ones on the plain. After the night with the stone, the words stayed in Feegly's head and lined up properly, and now Feegly cannot make them stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dig = {
      lines = { { id = "di_default", text = "Old things. Stone people, stone rooms, stone writing, all the way down. The beard-ones think their grandfathers' grandfathers are in the ground and they want to meet them. They do not care whose ground it is on top, and the horn-ones are very angry about that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    ground = {
      lines = { { id = "gr_default", text = "Feegly dug where Feegly was told, big one, and nobody told Feegly it was a holy place. Feegly is sorry for the hole. If you bring back the Tear, Feegly will show you which tunnels have weak roofs, and then your people can do what they like about the rest." } },
      choices = { { text = "I'll remember that offer. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "If you find a good thing, swallow it. Feegly only hid it in his cheek, and look where Feegly is now." } },
    troggs = { { id = "tp_troggs", text = "Feegly's people. They dig and they eat and they do not wonder about anything, and some days Feegly misses that." } },
    explorers_league = { { id = "tp_league", text = "The beard-ones with the little hammers and the big books. They love old stones more than they love each other." } },
    centaur = { { id = "tp_centaur", text = "Four-legs. They run past and do not look behind rocks, so Feegly likes them fine." } },
    _none = { { id = "tp_none", text = "Feegly does not know that. Is it shiny? If it is not shiny, Feegly did not look." } },
  },
}
