-- Bloodhoof Village, more of its people: Skorn Whitecloud (the old hunter who was bested by Ghost Howl),
-- Varg Windwhisper (leather goods, and the bundle of hides for Thunder Bluff), Var'jun (a Darkspear priest
-- sent to find his tribe's young priests), Kar Stormsinger (kodo riding) and Seikwa (stable master).
-- Voice: bibles/bloodhoof_more.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Skorn Whitecloud
---------------------------------------------------------------------------
P:NPC {
  key = "skorn", id = TODO_NPC("Skorn Whitecloud"), name = "Skorn Whitecloud",
  bible = "bibles/bloodhoof_more.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "old", "warm" }, values = { "honor", "tradition" },
  notices = { "class", "trophy" },

  impression = {
    first = "He still carries the shame of losing to Ghost Howl.",
    third = "{name} met Skorn Whitecloud, the aged tauren hunter of Bloodhoof Village who once failed to slay the mad wolf Ghost Howl.",
  },

  greetings = {
    { id = "g_default", text = "Come closer, young one. In my time I could hear the flutter of a prey's heart, but now you must speak up if you want your words heard." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Sit by an old hunter a while; my stories have nowhere else to go." },
    { id = "g_cloak", when = { questActive = TODO_QUEST("The Demon Scarred Cloak") }, text = "That hide on your back, I know that hide. Earth Mother, let me look at it closely, young one." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}. The plains have turned a little, and so have you, I think." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry a bow the way I used to, low and ready. And your {pet} watches me as if I were prey, which pleases me more than I can say." },
    { id = "n_young", cat = "level", when = { maxLevel = 9 },
      text = "So young, and already restless. I had that lust to wander once, and it took me farther than my legs ever wanted to go." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Skorn Whitecloud, and I have run through these plains for many, many seasons and hunted great beasts. I was never bested, not once, until I faced Ghost Howl." },
        { id = "h_ghost_done", when = { questDone = TODO_QUEST("The Demon Scarred Cloak") },
          text = "You killed Ghost Howl. I can barely believe it, even now, and I look upon you with a respect I keep for very few. Let us hope the great wolf's spirit has finally found peace." },
        { id = "h_hunterway", when = { questActive = TODO_QUEST("The Hunter's Way") },
          text = "Melor Stonehoof waits on the Hunter's Rise, and he will want to see the flatland prowlers' claws. Do not bring him broken ones; he notices." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Sit down, sit down, because hunting is a tauren's greatest honor, and it warms an old heart to see a young one take it up." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc of Thrall's Horde. Your people hunt hungry, and mine hunt grateful, but we both come home with meat, and that is a kind of friendship." },
      },
      again = {
        { id = "h_again", text = "What else would you hear? Speak up, my ears are as old as my bow." },
        { id = "h_again2", text = "Go on. An old hunter has nothing but time and stories." },
      },
      choices = {
        { text = "Tell me a story, Skorn.", next = "ghost" },
        { text = "How do I walk the hunter's path?", next = "path", when = { class = "HUNTER" } },
        { text = "What was it like, hunting in your youth?", next = "youth" },
        { text = "I brought you Ghost Howl's hide.", next = "cloak", when = { questDone = TODO_QUEST("The Demon Scarred Cloak") } },
        { text = "Who else should I know in Bloodhoof?", next = "village" },
        { text = "Rest well, elder.", next = "END" },
      },
    },

    ghost = {
      lines = { { id = "gh_default", text = "Long ago, Ghost Howl was an ally to the tauren, a massive wolf who fought bravely beside us against the Burning Legion. But a demon tore his flesh, and the wound never healed, and in time the pain drove him mad." } },
      choices = {
        { text = "And now?", next = "ghost2", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost2 = {
      lines = { { id = "gh2_default", text = "Now he roams the plains in agony, seeking an end to his pain, and when we fought I lacked the strength to give it to him. To my shame, he walked away from me, and I have been walking away from that day ever since." } },
      choices = {
        { text = "Then let me finish it for you.", next = "ghost3" },
        { text = "There's no shame in surviving.", next = "ghost3", fx = { trait = { kind = 1 } } },
      },
    },
    ghost3 = {
      big = true,
      lines = { { id = "gh3_default", text = "Kindly said, but you must understand what you would be killing. Ghost Howl is not a beast to be skinned and sold; he is an old friend who is suffering, and his death should be a mercy, not a trophy." } },
      choices = {
        { text = "Then it will be a mercy, and I'll honor him.", next = "BACK", reply = "Then you understand, and Ghost Howl will go to the Earth Mother gently. Thank you, from an old friend who couldn't do it himself.", fx = { align = { honor = 1 } } },
        { text = "A mad wolf is a mad wolf. I'll keep the hide.", next = "BACK", reply = "Then you are not the one I want for this, and I will find another. Ghost Howl was my friend before he was a hide.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cloak = {
      lines = { { id = "cl_default", text = "You defeated the great wolf, and you brought me the scarred hide so that I would know. My days of hunting are over, but I am honored that one of my old weapons will go on hunting with you." } },
      choices = {
        { text = "I'll carry it with honor.", next = "BACK", fx = { affinity = 2 } },
        { text = "Did his wound really come from a demon?", next = "cl_wound" },
      },
    },
    cl_wound = {
      lines = { { id = "clw_default", text = "You saw the hide, young one, and you saw how the edges of that tear never closed. Nothing of this world makes a wound like that, and nothing of this world could heal it, so perhaps you did what no healer could." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    path = {
      lines = { { id = "pa_default", text = "Melor Stonehoof teaches the hunter's ways on the Hunter's Rise in Thunder Bluff. To show him your skill and resolve, bring him the claws of the flatland prowlers of Mulgore, because they are tough and cunning and fitting prey for a young hunter." } },
      choices = {
        { text = "What is Melor like?", next = "pa_melor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pa_melor = {
      lines = { { id = "pam_default", text = "Patient, and stern, and he speaks well of me, so he must be generous too. He has hunted for years and years, but he still remembers what it is to be young and hungry for the path." } },
      choices = { { text = "Thank you, Skorn.", next = "BACK", fx = { affinity = 1 } } },
    },

    youth = {
      lines = { { id = "yo_default", text = "I chased plainstriders from Red Rocks to the Venture Company's lake before there was a Venture Company, and I slept under the stars more nights than under a roof. My mother said I was half wolf, and she did not mean it kindly." } },
      choices = {
        { text = "The Venture Company wasn't always here?", next = "yo_venture", fx = { learn = { "venture_company" } } },
        { text = "Do you miss it?", next = "yo_miss" },
      },
    },
    yo_venture = {
      lines = { { id = "yov_default", text = "No, they came with their machines not long ago, and now the lake is loud and the trees are stumps. Baine and the braves push them back where they can, but goblins grow like weeds, and their roots are made of gold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yo_miss = {
      lines = { { id = "yom_default", text = "Every morning, until I stand up and my knees remind me. Then I miss it a little less and sit back down, and I tell the young ones stories instead." } },
      choices = { { text = "I'm glad you do.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },

    village = {
      lines = { { id = "vi_default", text = "Baine keeps the peace for his father, and Harken Windtotem worries enough for three chiefs. Varg Windwhisper sells good leather, and Seikwa will keep your beast if you have one, and she feeds them better than the braves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, trails, and old wars. Ask slowly and loudly." } },
    background = { { id = "tp_bg", text = "A hunter all my life, and now an old man with stories. That is the whole of it.", next = "youth" } },
    advice = { { id = "tp_ad", text = "Never hunt angry. The prey can smell it, and so can the Earth Mother." } },
    venture_company = { { id = "tp_vc", text = "They cut the trees and foul the lake, and they pay nobody for any of it." } },
    _none = { { id = "tp_none", text = "I have never hunted that, young one, so I cannot tell you its habits." } },
  },
}

---------------------------------------------------------------------------
-- Varg Windwhisper
---------------------------------------------------------------------------
P:NPC {
  key = "varg", id = TODO_NPC("Varg Windwhisper"), name = "Varg Windwhisper",
  title = "Leather Armor Merchant",
  bible = "bibles/bloodhoof_more.md", role = "vendor", tier = "quest",
  communities = { "bloodhoof" }, temper = { "friendly", "busy" }, values = { "craft", "community" },
  notices = { "kit", "craft" },

  impression = {
    first = "Business is lively with the hunters about, and he likes it so.",
    third = "{name} met Varg Windwhisper, the leather armor merchant of Bloodhoof Village.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, friend. Leather for the road, or are you just admiring the stitching?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, good, business is lively and I like a familiar face in it." },
    { id = "g_hides", when = { questActive = TODO_QUEST("A Bundle of Hides") }, text = "The hides go to Tak first, our wind rider master, and then up to Ahanu in Thunder Bluff. Don't let them get wet." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}. I've sold a hundred pairs of boots since, and none of them to you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is in tatters, friend. Even if you don't buy from me, buy from somebody before the plains finish the job." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather too; I can tell by the way you looked at my seams before my face. Don't steal my stitch, it took me years." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Varg Windwhisper, and these are the best leather goods in Bloodhoof, though I'm the only one selling them, so the contest is easy. There are many hunters and adventurers in the village now, and they all need boots." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Varg") },
          text = "Is that Ahanu's work you're carrying? Let me see, let me see, I've been waiting on it all week." },
        { id = "h_done", when = { questDone = TODO_QUEST("Return to Varg") },
          text = "Ahanu's goods sold in two days, every piece of them. I am in your debt, and I'm not too proud to say it twice." },
        { id = "h_hunter", when = { class = { "HUNTER", "DRUID", "ROGUE", "SHAMAN" } },
          text = "Leather for you, I think, light and quiet, the way the plains like it. Have a look, and tell me if anything pinches." },
      },
      again = {
        { id = "h_again3", text = "What else can I tell you? Mind the awl on that bench." },
        { id = "h_again", text = "Anything else? I can talk and sew at the same time." },
        { id = "h_again2", text = "Ask away, friend. The leather won't mind." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What's this bundle of hides?", next = "hides" },
        { text = "Who is Ahanu?", next = "ahanu" },
        { text = "Where do the hides come from?", next = "source" },
        { text = "You must know everyone who passes through.", next = "folk" },
        { text = "I stitch leather myself, Varg.", next = "trade", when = { profession = "Leatherworking" } },
        { text = "I need leather that keeps quiet.", next = "quiet", when = { class = { "HUNTER", "DRUID", "ROGUE" } } },
        { text = "Good day, Varg.", next = "END" },
      },
    },

    hides = {
      lines = { { id = "hi_default", text = "Hides from the animals of Mulgore that need to get to Thunder Bluff, and the quickest way is on the back of a wind rider. Take them to Tak, our wind rider master, and he'll fly you up the bluffs." } },
      choices = {
        { text = "I've never flown before.", next = "hi_fly" },
        { text = "I'll take them.", next = "BACK", fx = { standing = { bloodhoof = 1 } } },
      },
    },
    hi_fly = {
      lines = { { id = "hif_default", text = "Then hold on, and don't look down until the bluffs are under you. Once you've spoken to a wind rider master in a town, you can fly back to it for a small fee, and that's the whole trick to getting around Kalimdor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ahanu = {
      lines = { { id = "ah_default", text = "A leatherworker in Thunder Bluff who turns my raw hides into finished goods, and I sell them down here. He has the better hands, and I have the better customers, so we both eat." } },
      choices = {
        { text = "Why not work them yourself?", next = "ah_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ah_why = {
      big = true,
      lines = { { id = "ahw_default", text = "Because I'm a fair stitcher and a good seller, and Ahanu is the reverse. Some say a tauren should make everything with his own hands, but I'd rather the hides become the best goods they can." } },
      choices = {
        { text = "Every tauren should work with their own hands.", next = "BACK", reply = "There is truth in that, and Ahanu would agree with you. Still, the hides are honoured either way, and I'd rather they were honoured well.", fx = { align = { order = 1 } } },
        { text = "Do what you're good at. Let others do the rest.", next = "BACK", reply = "That's how I see it, and so does Ahanu, most days. He stitches the best seams in Mulgore, and I sell them, and nobody goes hungry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    source = {
      lines = { { id = "so_default", text = "Plainstriders, prowlers, the odd swoop, and the boars the Bristlebacks raise, when the braves bring them home. The kodo hides I don't sell, because the kodo are our kin, and I'd chase you out of the village if you asked." } },
      choices = {
        { text = "I wouldn't ask.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Bristlebacks raise boars?", next = "so_boar" },
      },
    },
    so_boar = {
      lines = { { id = "sob_default", text = "They are boars, more or less, so they raise their cousins and ride them into our fields. The braves don't love me for buying the hides, but leather doesn't care who it came from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    folk = {
      lines = {
        { id = "folk_d", text = "Everyone, and what size their hooves are. Harken Windtotem sends me his hunters, Harant Ironbrace sends me the ones who cannot bear the weight of his plate, and Innkeeper Kauth sends me anyone who complains about the cold." },
      },
      choices = {
        { text = "And who sends you nobody?", next = "folk_none" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_none = {
      lines = {
        { id = "folk_none_d", text = "Mahnott Roughwound, because he thinks leather is what you wear until you can afford mail. I tell him that mail is what you wear until you learn to move, and then we share a drink and say it all again the next day." },
      },
      choices = {
        { text = "I think you're right about moving.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "trade_d", text = "Do you! Then you will want to meet Chaw Stronghide here in the village, who teaches the craft, and Una up on the bluff when you outgrow him. Bring me something you have made one day, and I will tell you honestly whether I could sell it." },
      },
      choices = {
        { text = "Honestly? I may regret asking.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_d", text = "Then you want it soft-tanned and oiled, with no buckles to catch the light. I keep a few pieces at the back for exactly your sort, because the loud customers never ask for them." },
      },
      choices = {
        { text = "Show me those when we trade.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Leather, hides, and who in Bloodhoof needs new boots." } },
    background = { { id = "tp_bg", text = "A trader's son from the plains. I can sew, but I can sell better." } },
    advice = { { id = "tp_ad", text = "Oil your boots before the rain, not after. Everybody learns that the wet way." } },
    _none = { { id = "tp_none", text = "Can't stitch that, friend, so I can't help you with it." } },
  },
}

---------------------------------------------------------------------------
-- Var'jun
---------------------------------------------------------------------------
P:NPC {
  key = "varjun", id = TODO_NPC("Var'jun"), name = "Var'jun",
  bible = "bibles/bloodhoof_more.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "earnest", "anxious" }, values = { "dutiful", "devout" },
  notices = { "race", "class" },

  impression = {
    first = "He searches every passing troll's face for his tribe's young priests.",
    third = "{name} met Var'jun, the Darkspear sent to Bloodhoof Village to find young troll priests and send them to Ur'kyo.",
  },

  greetings = {
    { id = "g_default", text = "I be seekin' someone, {class}. Please, if you not be them, leave me to look." },
    { id = "g_back", when = { metBefore = true }, text = "You again, mon. I still be lookin', and the plains still be very big." },
    { id = "g_troll_priest", when = { race = "Troll", class = "PRIEST" }, text = "There you be! A Darkspear priest, at last, and me standin' here so long the tauren think I be a post." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear on the plains! You be far from the sea, mon, same as me, and I wonder if it make you dizzy too." },
    { id = "n_forsaken_priest", cat = "class", when = { race = "Scourge", class = "PRIEST" },
      text = "You be a priest of the dead ones, mon. Your head priestess be callin' for you too, I hear, so you not be the only one far from home." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Var'jun, of the Darkspear, sent here to make sure our young priests not wander too far from home. Ur'kyo, greatest of our priests, wish to speak to them, and I be the one who must find them." },
        { id = "h_troll_priest", when = { race = "Troll", class = "PRIEST", minLevel = 10 },
          text = "You be the one, mon. Ur'kyo wait for you in the Valley of Spirits in the orc city, and he want to start your trainin' in the old ways." },
        { id = "h_forsaken_priest", when = { race = "Scourge", class = "PRIEST", minLevel = 10 },
          text = "You be far from home out here, mon. I hear word your head priestess want all Forsaken priests to come to her, in the War Quarter of your own city, so maybe you go there next." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Your people be kind to a lost troll, mon. They feed me and never ask why I be starin' at every traveler on the road." },
      },
      again = {
        { id = "h_again", text = "Anything else, mon? I keep one eye on the road while we talk." },
        { id = "h_again2", text = "Ask, mon, but quick, in case they walk past." },
      },
      choices = {
        { text = "Who are you looking for?", next = "seeking" },
        { text = "Why here, among the tauren?", next = "why" },
        { text = "Who is Ur'kyo?", next = "urkyo" },
        { text = "Who is the Forsaken head priestess?", next = "xforsaken", when = { race = "Scourge", class = "PRIEST" } },
        { text = "What's Mulgore like to a troll?", next = "mulgore" },
        { text = "What do young Darkspear priests learn first?", next = "priests" },
        { text = "Maybe they be hidin' from their lessons, mon.", next = "hiding", when = { race = "Troll" } },
        { text = "I hope you find them.", next = "END" },
      },
    },
    mulgore = {
      lines = { { id = "mulgore_d", text = "Too much grass and not enough sea, mon. I wake up every mornin' and listen for the waves, and all I hear be kodo chewin', which be a fine sound but not the right one." } },
      choices = {
        { text = "You miss the Echo Isles.", next = "mulgore_echo" },
        { text = "Kodo chewing is a peaceful sound.", next = "BACK", reply = "Peaceful, ya, and that be the trouble. A troll don't know what to do with peaceful." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mulgore_echo = {
      lines = { { id = "mulgore_echo_d", text = "Every day, mon, though the Isles not be ours right now. Zalazane holds them with his madness, and Vol'jin keep us at Sen'jin Village on the coast until the day we take them back, and I be there for it, you can count on that." } },
      choices = {
        { text = "I hope that day comes soon.", next = "BACK", reply = "It will, mon. The loa promise it, and they don't lie, not about that." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    priests = {
      lines = { { id = "priests_d", text = "To listen to the loa before they speak to 'em, mon, and that be the hardest lesson for the young. They want the magic right away, but Ur'kyo say a priest who don't listen first only ever hears himself." } },
      choices = {
        { text = "Ur'kyo sounds like a strict teacher.", next = "priests_urkyo" },
        { text = "Listening first. Good advice for anyone.", next = "BACK", reply = "Ya, mon, and the young ones never take it. Maybe you be different." },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_urkyo = {
      lines = { { id = "priests_urkyo_d", text = "Strict, ya, but fair, and he laugh more than you think. He say the loa got a sense of humour, and a priest who can't take a joke from the spirits won't last long in the old ways." } },
      choices = {
        { text = "Then I'd like to meet him.", next = "BACK", reply = "Go to the Valley of Spirits in Orgrimmar, mon. He be glad of anyone who wants to learn." },
        { text = "Another question.", next = "BACK" },
      },
    },
    hiding = {
      lines = { { id = "hiding_d", text = "Ha! You know dem, mon, you know dem well. Last time I found one, he was hidin' in a tauren's tent eatin' bread and pretendin' he got lost, and I bring him back to Ur'kyo by the ear." } },
      choices = {
        { text = "Young trolls are all the same.", next = "BACK", reply = "Ya, mon, and old trolls be the ones who remember it." },
        { text = "Something else.", next = "BACK" },
      },
    },

    seeking = {
      lines = { { id = "se_default", text = "Young Darkspear priests, mon, who wander off with the Horde and forget their tribe have teachings for them too. When they reach a certain strength, Ur'kyo want to see them, and somebody must say so." } },
      choices = {
        { text = "What does Ur'kyo teach?", next = "se_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    se_teach = {
      lines = { { id = "set_default", text = "The old ways, mon, the ones the Darkspear carry from the islands. Every people's priests learn somethin' only their own can teach, and ours be a little hex that make an enemy weak." } },
      choices = {
        { text = "A hex? From a priest?", next = "se_hex" },
        { text = "Something else.", next = "BACK" },
      },
    },
    se_hex = {
      big = true,
      lines = { { id = "seh_default", text = "A priest heal, mon, and a priest also protect, and sometimes protectin' mean makin' the other fella weaker. Some say that be no work for a holy one, and some say it be the holiest work there is." } },
      choices = {
        { text = "Weakening a foe to protect friends is righteous.", next = "BACK", reply = "Dat be how I see it too, mon, and the loa don't complain. Ur'kyo never yet lost sleep over a curse that kept his brother breathing.", fx = { align = { light = 1 } } },
        { text = "Hexes are dirty magic, whoever casts them.", next = "BACK", reply = "Some say so, and maybe dey be right. But I'd rather get my hands dirty than watch a friend fall, and the loa can judge me later.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because young ones go where the Horde go, mon, and many of them come through Bloodhoof on the way to Thunder Bluff. The tauren be kind to a lost troll, but it be very quiet here, and I miss the sound of the sea." } },
      choices = {
        { text = "You'll be home soon.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    urkyo = {
      lines = { { id = "ur_default", text = "Ur'kyo be the greatest of our priests, mon, and he teach in the Valley of Spirits in Orgrimmar. He be old and patient, and when he send you somewhere, you go, because he never send you anywhere twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xforsaken = {
      lines = { { id = "xf_default", text = "Aelthalyste, mon, in the War Quarter of your city under the ruins. I only hear the name, I never see her, and I be glad, because they say time not matter to her and that sound very tirin'." } },
      choices = {
        { text = "I'll go to her.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Darkspear priests, mon, and where they be supposed to go." } },
    background = { { id = "tp_bg", text = "A Darkspear from Sen'jin, sent by the elders. That be all, mon." } },
    advice = { { id = "tp_ad", text = "When your elders send for you, go, mon. They not get younger while you wait." } },
    echo_isles = { { id = "tp_echo", text = "Home, mon, once. I hear the sea in my sleep out here." } },
    _none = { { id = "tp_none", text = "I not know that, mon. I only know who I be lookin' for." } },
  },
}

---------------------------------------------------------------------------
-- Kar Stormsinger
---------------------------------------------------------------------------
P:NPC {
  key = "kar_stormsinger", id = TODO_NPC("Kar Stormsinger"), name = "Kar Stormsinger",
  title = "Riding Trainer",
  bible = "bibles/bloodhoof_more.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "proud", "slow" }, values = { "tradition", "kinship" },
  notices = { "race", "mount" },

  impression = {
    first = "He treats his kodo as kin, not livestock.",
    third = "{name} met Kar Stormsinger, the kodo riding trainer of Bloodhoof Village.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "The kodo lift their heads when you come, friend, and they do not do that for everyone. Come, sit with us." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The kodo are listening, and they remember. Speak gently, for they have not forgotten you, and neither have I." },
    { id = "g_default", text = "The kodo are listening, so speak gently. They remember rudeness longer than I do." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The kodo remember you, which is either good or bad, depending on what you said last time." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "You rode in on something with legs and a temper. Get down and let it rest, and let my kodo look at it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kar Stormsinger, and I teach the finer points of kodo riding, provided you have enough gold to cover the lesson. The kodo are our kin, and they carry only those they trust." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A child of the Earth Mother. You were born to ride the kodo, and when you are ready and have the coin, I will teach you to do it properly." },
        { id = "h_exalted", when = { race = { "Orc", "Troll", "Scourge" }, reputation = { faction = "Thunder Bluff", min = "exalted" } },
          text = "The tauren of Thunder Bluff speak your name as a true friend. That is rare for one not born on the plains, and the kodo will carry you if you wish it." },
        { id = "h_not", when = { race = { "Orc", "Troll", "Scourge" }, reputation = { faction = "Thunder Bluff", max = "revered" } },
          text = "You need to be exalted with the tauren of Thunder Bluff before I will teach you to ride the kodo. It is not a slight, friend; the kodo simply do not carry strangers." },
      },
      again = {
        { id = "h_again", text = "What else? The kodo are patient, and I try to be." },
        { id = "h_again2", text = "Ask, friend. The herd is grazing." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { minLevel = 40 } },
        { text = "Why must outsiders be exalted?", next = "why", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "What makes the kodo special?", next = "kodo" },
        { text = "How do you teach a kodo to carry a rider?", next = "train" },
        { text = "Why are you called Stormsinger?", next = "name" },
        { text = "My family has always ridden kodo.", next = "tauren_family", when = { race = "Tauren" } },
        { text = "Could a kodo be a hunter's companion?", next = "hunter_kodo", when = { class = "HUNTER" } },
        { text = "Would a kodo carry one of the dead?", next = "fk", when = { race = "Scourge" } },
        { text = "Farewell, Kar.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because a kodo carries the trust of the whole tribe on its back, and we give that trust to those who have earned it from all of us. Your wolves and raptors are fine beasts, but a kodo is family, and you do not lend family to strangers." } },
      choices = {
        { text = "That's right. Trust must be earned.", next = "wh_more", fx = { align = { order = 1 } } },
        { text = "A beast is a beast. The rule is just pride.", next = "wh_more", fx = { align = { order = -1 } } },
        { text = "How do I earn it?", next = "wh_more" },
      },
    },
    wh_more = {
      lines = { { id = "whm_default", text = "Help Thunder Bluff, and keep helping it, until the elders speak your name around the fires without frowning. It is a long road, but when you walk it the kodo will know, because the kodo always know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kodo = {
      lines = { { id = "ko_default", text = "They are old, and strong, and they never forget a path once walked, and so the tauren could wander so long and always find their way. When the centaur hunted us across the plains, the kodo carried our children." } },
      choices = {
        { text = "What happens when a kodo dies?", next = "ko_die" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ko_die = {
      lines = { { id = "kod_default", text = "They walk to the graveyard in the Barrens, the old ones, and lie down among their ancestors. The Kolkar and the hunters of other peoples go there to take their bones, and I do not speak of those hunters kindly." } },
      choices = {
        { text = "Nor should you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Have you seen the graveyard yourself?", next = "ko_grave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ko_grave = {
      lines = { { id = "kog_default", text = "Once, as a young bull, when I followed my grandmother's old kodo south to see where she would lie. The bones stretch farther than the eye can follow, and I sat with her until the sun went down, and I have never ridden that way since." } },
      choices = {
        { text = "Something else, Kar.", next = "BACK" },
        { text = "Farewell, Kar.", next = "END" },
      },
    },
    train = {
      lines = { { id = "tr_default", text = "You don't teach a kodo, you ask it, and you keep asking for a season or two until it agrees. The calves learn from their mothers to let a tauren climb aboard, and I only teach the riders how not to fall off." } },
      choices = {
        { text = "Do many riders fall?", next = "train_fall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    train_fall = {
      lines = { { id = "trf_default", text = "Every one of them, at least once, and usually in front of the whole village. A kodo will stop the moment you slip, which is a mercy, but it will also turn and look at you, which is worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "na_default", text = "My grandfather sang to the herds through the great storms on the plains, so the kodo would follow his voice instead of bolting. I cannot sing as he did, but the name came down to me, and the kodo still like a low hum when the thunder starts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren_family = {
      lines = { { id = "tf_default", text = "Then you have felt the rhythm of a kodo under you since before you could walk, and you will learn quickly. The trick is to forget that you are riding and remember that you are travelling together." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter_kodo = {
      lines = { { id = "hk_default", text = "No, and I would thank you not to try. A kodo may walk beside a hunter for a while out of kindness, but it belongs to the herd, and the herd will always call it home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fk = {
      lines = { { id = "fk_default", text = "Some would and some would not, and it is the kodo who decide, not me. A Forsaken rider must stand very still and let the beast smell him for as long as it likes, and most of them decide in the end that you are only a very quiet sort of traveller." } },
      choices = {
        { text = "I can be patient.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The kodo, their paths, and who may ride them." } },
    centaur = { { id = "tp_ce", text = "They hunted us across the plains, and the kodo carried our children away from their spears. The kodo have not forgotten." } },
    earth_mother = { { id = "tp_em", text = "She gave us the kodo to carry what we could not. That is why I call them kin." } },
    background = { { id = "tp_bg", text = "I was raised among the herds, and I have never once walked when I could ride." } },
    advice = { { id = "tp_ad", text = "Never stand behind a kodo when it is thinking. You will know when it is thinking." } },
    _none = { { id = "tp_none", text = "The kodo do not know that, and neither do I." } },
  },
}

---------------------------------------------------------------------------
-- Seikwa
---------------------------------------------------------------------------
P:NPC {
  key = "seikwa", id = TODO_NPC("Seikwa"), name = "Seikwa",
  title = "Stable Master",
  bible = "bibles/bloodhoof_more.md", role = "stablemaster", tier = "service",
  communities = { "bloodhoof" }, temper = { "gentle", "fussy" }, values = { "kindness", "craft" },
  notices = { "pet" },

  impression = {
    first = "She remembers each animal's name long after forgetting its owner's.",
    third = "{name} met Seikwa, the tauren stable master of Bloodhoof Village.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you. Come in, they won't mind. They've grown used to your step, and so have I." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hush, please, and stay by the door. They've only just settled, and I'd rather you didn't unsettle them." },
    { id = "g_default", text = "Hush, hush, they've only just settled. Come in quietly, friend." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! I remember your {pet}, of course, I never forget a beast." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has burrs all through its coat. Let me brush them out before you go, or they'll be sore by nightfall." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Seikwa, and I keep the beasts of hunters while they travel without them. Each beast gets fed, brushed and spoken to, whether its hunter comes back in a day or a season." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, with a friend at heel. Do you need me to keep someone for you, or are you only visiting the others?" },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! Please don't change into anything in here, friend; it frightens the cats, and the cats frighten everyone else." },
      },
      again = {
        { id = "h_again", text = "Anything else? Softly, please, or the cats will wake." },
        { id = "h_again2", text = "Yes, friend? The swoop is listening, but it won't tell." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Do hunters ever not come back?", next = "lost" },
        { text = "Which beast is your favorite?", next = "favorite" },
        { text = "How do you calm a frightened beast?", next = "calm" },
        { text = "What beasts come through Bloodhoof?", next = "beasts" },
        { text = "How should I care for my companion on the road?", next = "care", when = { class = "HUNTER" } },
        { text = "My raptor is a picky eater.", next = "troll_raptor", when = { race = "Troll" } },
        { text = "I could talk to them in their own shape.", next = "druid", when = { class = "DRUID" } },
        { text = "Goodbye, Seikwa.", next = "END" },
      },
    },

    lost = {
      big = true,
      lines = { { id = "lo_default", text = "Sometimes, and then I keep the beast until it's clear nobody is coming. Some stable masters sell them on, but I find them a new hunter who will care for them, even if it takes a whole season." } },
      choices = {
        { text = "That's the right thing to do.", next = "lo_more", fx = { align = { honor = 1 } } },
        { text = "Feeding a beast that long costs too much.", next = "lo_more", fx = { align = { honor = -1 } } },
        { text = "How many have you kept?", next = "lo_more" },
      },
    },
    lo_more = {
      lines = { { id = "lom_default", text = "Eleven, over the years, and all eleven went to good hunters in the end. The twelfth is the old plainstrider in the back, who nobody wants, so I suppose he is mine now." } },
      choices = {
        { text = "He's lucky to have you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    favorite = {
      lines = { { id = "fa_default", text = "I shouldn't say, because they can hear me. But the old plainstrider never bites, never complains and always eats his supper, and the young braves can't claim any of the three." } },
      choices = {
        { text = "Your secret is safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does the plainstrider have a name?", next = "fav_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fav_name = {
      lines = { { id = "fn_default", text = "Old Wobble, because of the way he walks, and he doesn't seem to mind it. A hunter left him here the spring the Venture Company came into the eastern hills, and never came back for him." } },
      choices = {
        { text = "The Venture Company?", next = "fav_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fav_venture = {
      lines = { { id = "fv_default", text = "Goblins with saws and loud machines, digging into Mulgore where they've no right to be. The hunters went out to drive them off, and not all of them came home, which is how I came to have so many beasts to look after." } },
      choices = {
        { text = "I'm sorry, Seikwa.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calm = {
      lines = { { id = "ca_default", text = "You sit down beside it and hum, and you don't look it in the eye, and you wait until it decides you're only furniture. Bulrug up in Thunder Bluff sings to his, but I've never had the voice for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "be_default", text = "Wolves from the orc hunters, cats and boars from ours, and once a troll's raptor who ate a whole barrel of apples and then sulked for two days. I loved him dearly, though he bit me twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    care = {
      lines = { { id = "cr_default", text = "Brush it every evening, check its paws for thorns after the Barrens, and never let it drink still water near the quilboar camps. And talk to it, always, because a beast that hears you every night will hear you in a fight." } },
      choices = { { text = "I'll remember.", next = "BACK" } },
    },
    troll_raptor = {
      lines = { { id = "tr_default", text = "Most raptors are, the dear things! Try him on fish, which the Darkspear hunters swear by, and never on anything that's been dead more than a day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Oh, could you? Then please tell the cats the swoop isn't going to eat them, because they don't believe me, and I'm running out of ways to say it." } },
      choices = {
        { text = "I'll have a word with them.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every beast in this stable, and what each one likes to eat." } },
    venture_company = { { id = "tp_vc", text = "Noisy goblins in the eastern hills. They've cost me more sleepless nights than any sick beast ever has." } },
    quilboar = { { id = "tp_qb", text = "Their camps foul the water for miles. Keep your beasts well away from them, friend." } },
    background = { { id = "tp_bg", text = "I grew up mending broken wings and splinting legs, and I never stopped." } },
    advice = { { id = "tp_ad", text = "Talk to your beast every evening. It will listen better in a fight." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, I only know about beasts." } },
  },
}
