-- More of Durotar: Telf Joolam (keeper of the Shrine of the Dormant Flame, Call of Fire), Sen'jin's
-- Zjolnir (raptors), Xar'Ti (riding), Bom'bay (Gadrin's apprentice) and Hai'zan (butcher), Razor Hill's
-- Grimtak (butcher), Cutac (cloth and leather) and Dhugru Gorelust (warlocks), the Valley of Trials'
-- Shikrik (shaman) and Zlagk (butcher), and Raider Jhash on the road. Added later: Ukor, Ruzan, Nartok,
-- Jen'shan, Mai'ah, Rwag, Jark, Krunn, Lau'Tiki and Mishiki. Second pass: Huklah, Rarc, Hraug (valley),
-- Wuark, Ghrawt, Flakk, Dwukk, Harruk, Kitha, Mukdrak, Rawrk, Ophek, Furl Scornbrow (Razor Hill), K'waii,
-- Trayexir, Tai'tasi, Miao'zan, Zansoa, Kali Remik (Sen'jin), and the zeppelin masters Frezza and
-- Snurk Bucksquick at the tower outside Orgrimmar. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Telf Joolam: Darkspear shaman who keeps the Shrine of the Dormant Flame.
---------------------------------------------------------------------------
P:NPC {
  key = "telf", id = TODO_NPC("Telf Joolam"), name = "Telf Joolam",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "wry", "calm" }, values = { "devout", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "He has been alone with his fire a long time.",
    third = "{name} met Telf Joolam, the troll shaman who keeps the Shrine of the Dormant Flame.",
  },
  greetings = {
    { id = "g_default", text = "You climbed all dis way? Den either you be a shaman, or you be very lost, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Back up de mountain again. De flame be sleepin', but it knows you came." },
    { id = "g_call", when = { questActive = TODO_QUEST("Call of Fire") }, text = "Kranal sent you, I see de torch in your hand. Good, den we begin, and de flame be watchin' how you do it." },
    { id = "g_sapta", when = { questActive = TODO_QUEST("Fire Sapta") }, text = "You got de fire tar yet, and de reagents? Without dem, de sapta be only mud, and mud don't open your eyes to anything." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "De earth spirit sits easy on you already. Fire be a different beast, though, and it don't sit easy on anybody." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, climbin' my mountain. Vol'jin would be proud, and Zalazane would be worried, which be even better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Telf Joolam, and I keep de Shrine of de Dormant Flame. Young shaman come up dis mountain to learn de fire, and I see who be ready and who goes home with no eyebrows." },
        { id = "h_sapta_done", when = { questDone = TODO_QUEST("Fire Sapta") },
          text = "You drank de sapta and you didn't fall off de mountain, so dat be a good start. Now your eyes see what de fire wants you to see." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman on my mountain. Speak quick, before de wind takes my words away." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De wind be cold up here." },
        { id = "h_again2", text = "Ask, ask. I don't get much company." },
      },
      choices = {
        { text = "What is the Dormant Flame?", next = "flame" },
        { text = "What's a fire sapta?", next = "sapta" },
        { text = "You don't get lonely up here?", next = "lonely" },
        { text = "Kranal Fiss in the Barrens says the fire tests hard.", next = "thungrim", when = { class = "SHAMAN" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    flame = {
      lines = { { id = "fl_default", text = "A fire dat sleeps in de stone of dis mountain, older than de orcs and older than de Darkspear. It be dormant, but not dead, and when a shaman is ready, it wakes enough to test dem." } },
      choices = {
        { text = "How does it test them?", next = "flame2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flame2 = {
      lines = { { id = "fl2_default", text = "It shows itself, a spirit of fire on de mountaintop, and de shaman must face it. You can't see it with ordinary eyes, which is why you drink de sapta first, and you must be quick, because de longer you wait, de bigger it grows." } },
      choices = {
        { text = "And if I fail?", next = "flame3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flame3 = {
      big = true,
      lines = { { id = "fl3_default", text = "Den you climb down, heal your burns, and come back when you be wiser. De fire don't hate you for failin', mon, it just don't respect you yet, and respect be what a shaman needs from fire most of all." } },
      choices = {
        { text = "I'll earn that respect, however long it takes.", next = "BACK", reply = "Good answer, and de patient ones be de ones who keep their eyebrows. De flame likes patience more than it shows.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need its respect. I'll beat it.", next = "BACK", reply = "Hah! Maybe you will, and maybe it will teach you somethin' you didn't want to learn. Fire always gets de last word.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta = {
      lines = { { id = "sa_default", text = "A brew of de old ways, made for de eyes of de spirit. For fire I need fire tar, which de Razormane in de Barrens carry, and a pouch of reagents, and when I mix dem, a shaman who drinks it sees what be hidin' in de flame." } },
      choices = {
        { text = "Why can't you gather them yourself?", next = "sapta2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta2 = {
      lines = { { id = "sa2_default", text = "I could, but den de sapta would be mine and not yours. A shaman who gathers de pieces of his own test learns somethin' on de road, and de Razormane teach a lesson or two of dere own." } },
      choices = { { text = "Something else, Telf.", next = "BACK", fx = { learn = { "quilboar" } } } },
    },
    lonely = {
      lines = { { id = "lo_default", text = "Sometimes, but de fire be good company if you know how to listen, and it never steals your dinner. When de wind blows right, I can hear de drums from Sen'jin, and dat be enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thungrim = {
      lines = { { id = "th_default", text = "Kranal Fiss and I don't agree on much, but on dat he be right. He keeps his fire burnin' bright out in de Barrens, and I keep mine sleepin' up here, and de young shaman get to see both kinds." } },
      choices = { { text = "Something else, Telf.", next = "BACK" } },
    },
  },
  topics = {
    echo_isles = { { id = "tp_echo", text = "From up here I can see de isles on a clear day, and I can see de smoke from Zalazane's fires too. One day de Darkspear take dem back." } },
    the_elements = { { id = "tp_elem", text = "Earth be patient, water be generous, air be quick, and fire be hungry. Learn all four, mon, but never forget which one bites." } },
    _none = { { id = "tp_none", text = "De flame don't tell me about dat, and neither will I." } },
  },
}

---------------------------------------------------------------------------
-- Zjolnir: raptor handler of Sen'jin; sells only to trolls or proven friends.
---------------------------------------------------------------------------
P:NPC {
  key = "zjolnir", id = TODO_NPC("Zjolnir"), name = "Zjolnir", title = "Raptor Handler",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "proud" }, values = { "loyal", "craft" },
  notices = { "race", "pet" },
  impression = {
    first = "He sells raptors to almost nobody the Darkspear won't vouch for.",
    third = "{name} met Zjolnir, the troll raptor handler at Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Careful, mon, dat one bites. Dey all bite, but dat one means it." },
    { id = "g_back", when = { metBefore = true }, text = "You be back to admire my raptors again. Dey like you, a little." },
    { id = "g_exalted", when = { reputation = { faction = "Darkspear Trolls", min = "exalted" } }, text = "De tribe speaks well of you, very well. Come, come, de raptors be ready for a friend of de Darkspear." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! You be needin' a raptor soon, I can tell, because trolls don't walk anywhere if dey can ride." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} be eyein' my raptors. Tell it not to try, mon, or it be dinner." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and you be lookin' at my raptors like dey be wild ones. Dese are raised by hand, mon, so keep your tamin' tricks for de coast." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "You ride in on dat? Well, it got four legs and it didn't throw you, so I say nothin' more about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zjolnir, and I raise de raptors of Sen'jin. Darkspear ride dem, and nobody else does, unless de whole tribe says dey be family." },
        { id = "h_troll", when = { race = "Troll" }, text = "Dese raptors be de finest in Durotar, and a Darkspear deserves de finest. Pick one when you be ready, mon." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask quick, it be feedin' time." },
        { id = "h_again3", text = "You still be here, and de raptors still be watchin' you. What more you want to know, mon?" },
      },
      choices = {
        { text = "Show me the raptors.", next = "BUSINESS", when = { any = { { race = "Troll" }, { reputation = { faction = "Darkspear Trolls", min = "exalted" } } } } },
        { text = "Why only for the Darkspear?", next = "why" },
        { text = "How do you tame a raptor?", next = "tame" },
        { text = "Xar'Ti teaches riding here too?", next = "xarti" },
        { text = "These pens are bigger than most huts in the village.", next = "pens" },
        { text = "I'm a hunter. Would one of these take to me?", next = "hunterpet", when = { class = "HUNTER" } },
        { text = "A troll should choose a raptor carefully, I think.", next = "choose", when = { race = "Troll" } },
        { text = "Farewell, Zjolnir.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because a raptor be family to a troll, and you don't give family to strangers. Prove yourself to de Darkspear, do enough for Sen'jin and Vol'jin, and maybe one day I sell you one too." } },
      choices = {
        { text = "That's fair. Trust must be earned.", next = "BACK", reply = "Now you be talkin' like a troll. Go help de village, and come back when dey speak your name with a smile.", fx = { align = { order = 1 } } },
        { text = "We're all Horde. Your raptors should be for everyone.", next = "BACK", reply = "Horde, yes, but de raptor don't know dat. It knows Darkspear, and dat be all it needs to know.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "ta_default", text = "You don't tame a raptor, you raise one from de egg, and you feed it from your own hand till it thinks you be its mother. A wild one you never trust, no matter how long you have it." } },
      choices = {
        { text = "And the eggs come from where?", next = "tame2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame2 = {
      lines = { { id = "ta2_default", text = "De Echo Isles, mostly, before Zalazane took dem, and now from de coast where de wild ones nest. Cook Torka up in Razor Hill steals de eggs for his breakfast, and I tell him every time it be a waste of a good raptor." } },
      choices = { { text = "Something else, Zjolnir.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    xarti = {
      lines = { { id = "xa_default", text = "She does, and I raise de beasts, and between us a troll goes from walkin' to ridin' in a day. She be stricter than me, so don't tell her I said de raptors be easy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pens = {
      lines = { { id = "pe_default", text = "Dey have to be, mon, because a raptor in a small pen gets mean, and a mean raptor eats de fence and den de neighbour's chickens. I built dese myself from driftwood off de beach, and Hai'zan brings me de scraps from his block to fill de troughs." } },
      choices = {
        { text = "What does a riding raptor eat in a day?", next = "pens2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pens2 = {
      lines = { { id = "pe2_default", text = "More than you, and more than me, and it wants it bloody. Boar haunch in de mornin', crab at night, and a whole fish when it has been good, which be why Lau'Tiki and I be such good friends." } },
      choices = {
        { text = "And when one has not been good?", next = "pens3" },
        { text = "Something else, Zjolnir.", next = "BACK" },
      },
    },
    pens3 = {
      big = true,
      lines = { { id = "pe3_default", text = "Den it gets fed last, where de others can see, and it learns faster from dat than from any stick. I never strike a raptor, mon, because dey remember everything, and one day you have your back turned." } },
      choices = {
        { text = "Patience makes a better mount than the whip.", next = "BACK", reply = "Dat be de whole craft in one breath, mon. Tell it to de wolf riders up in Orgrimmar, if dey ever listen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that bites should feel the stick.", next = "BACK", reply = "And den it bites harder, and it picks its moment. You ride your way, mon, and I count my fingers my way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunterpet = {
      lines = {
        { id = "hp_default", text = "As a mount, maybe, if de tribe speaks for you, but not as a huntin' beast, mon. Dese ones be raised to carry and to run, and if you want a raptor to hunt beside you, go and earn a wild one on de Echo Isles like every Darkspear hunter does." },
        { id = "hp_pet", when = { pet = { type = "Beast" } }, text = "You already got {pet}, mon, and a hunter with two beasts in his heart does right by neither. Dese ones be raised to carry, so leave de huntin' to de one who already knows your whistle." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    choose = {
      lines = { { id = "ch_default", text = "You should, because it be de one choice in your life dat chooses you back. Don't pick by colour, mon, pick de one dat looks you in de eye and don't look away, and den come see Xar'Ti before you try to sit on it." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    echo_isles = { { id = "tp_isles", text = "De best nestin' grounds we ever had be on dem isles, and now Zalazane's hexed trolls walk through dem like dey own every egg. One day we take de isles back, and I be first off de boat with a basket." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin rode a raptor before he could hold a spear, like his father did. When he comes down from Orgrimmar he still stops at my pens first, and dat tells you what kind of chief he be." } },
    thrall = { { id = "tp_thrall", text = "De Warchief rides a wolf, and I forgive him for it, because he gave de Darkspear a shore to stand on. I offered him a raptor once, and he laughed and said his wolf would be jealous." } },
    _none = { { id = "tp_none", text = "Dat ain't about raptors, so I ain't the one to ask." } },
  },
}

---------------------------------------------------------------------------
-- Xar'Ti: raptor riding trainer, Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "xarti", id = TODO_NPC("Xar'Ti"), name = "Xar'Ti", title = "Riding Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "stern" }, values = { "craft", "loyal" },
  notices = { "race" },
  impression = {
    first = "She thinks falling off is the most important lesson there is.",
    third = "{name} met Xar'Ti, the troll riding trainer at Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "You want to ride? Den first you learn to fall, and dat be de lesson most don't like." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and walkin' straight. Good, no broken bones yet." },
    { id = "g_orc", when = { race = "Orc" }, text = "An orc at de raptor pens. You came to look, mon, and lookin' be free, but keep your hands where de beasts can see dem." },
    { id = "g_away", when = { away = 14 }, text = "You been gone a good while, and de hatchlings you saw be near grown now. Come and see how dey run." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear who be old enough to ride, soon. I can see it in de way you stand." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Sit up straight, mon, your heels be too far forward. Whoever taught you to ride did not teach you to fall." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "No, big one, I don't even need to ask. Dere be no raptor in Durotar dat would forgive me for puttin' you on its back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Xar'Ti, and I teach riding to de Darkspear. A raptor be fast and clever and mean, and a rider who don't know what she be doin' ends up in de dirt or in de raptor." },
        { id = "h_troll", when = { race = "Troll" }, text = "You be Darkspear, so you will ride, and so you will come to me sooner or later. Better sooner, mon, while your bones still mend quick." },
        { id = "h_low", when = { maxLevel = 20 }, text = "I be Xar'Ti, and I teach de Darkspear to ride. You be a long way from ready, but you can learn to fall today, and dat lesson costs nothin'." },
      },
      again = {
        { id = "h_again", text = "What else? Quick now." },
        { id = "h_again2", text = "Ask, but don't stand behind de raptors." },
        { id = "h_again3", text = "You got more questions dan a hatchlin' got teeth. Go on den, one more." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { any = { { race = "Troll" }, { reputation = { faction = "Darkspear Trolls", min = "exalted" } } } } },
        { text = "Why is falling the first lesson?", next = "fall" },
        { text = "Raptors seem like dangerous mounts.", next = "danger" },
        { text = "You and Zjolnir seem to split the work between you.", next = "zjolnir" },
        { text = "The orcs say a wolf is the steadier mount.", next = "wolves" },
        { text = "I'm no troll. Would you ever teach an outsider?", next = "outsider", when = { ["not"] = { race = "Troll" } } },
        { text = "Farewell, Xar'Ti.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "fa_default", text = "Because everybody falls, mon, and de one who falls well gets back up. De one who falls badly gets carried back to de village by his friends, and dey laugh at him all the way." } },
      choices = {
        { text = "So how does a rider fall well?", next = "fall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = { { id = "da_default", text = "Dey are, and dat be de point. A wolf obeys because it wants to, but a raptor obeys because it respects you, and de day it stops respectin' you, it bites. Keep it fed and keep it afraid of you a little, and it carries you anywhere." } },
      choices = {
        { text = "A little fear keeps everyone honest.", next = "BACK", reply = "You understand raptors better than most, den. Keep dat in mind when you ride.", fx = { align = { light = -1 } } },
        { text = "I'd rather earn its trust than its fear.", next = "BACK", reply = "Trust, yes, dat comes too, after many years. But start with respect, or you won't live to see de trust.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall2 = {
      lines = { { id = "fa2_default", text = "You go loose, you tuck de shoulder, and you roll away from de claws, not toward dem. I make every young troll fall thirty times on de sand before dey ever see a saddle, and de ones who complain fall forty." } },
      choices = {
        { text = "Has anyone ever refused to fall?", next = "fall3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall3 = {
      big = true,
      lines = { { id = "fa3_default", text = "One, a proud boy who said a warrior does not practise losin'. He broke his arm de first day he rode, mon, and Master Gadrin set de bone and sent him back to me to start from de sand." } },
      choices = {
        { text = "Pride needed that lesson. You did right by him.", next = "BACK", reply = "He rides better dan any of dem now, and he falls like a cat. Dat be all de thanks I need.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some learn best by doing, even if bones break.", next = "BACK", reply = "Some do, and some don't get up again. I teach de sand first, and you can call dat soft if you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zjolnir = {
      lines = { { id = "zj_default", text = "He raises dem and spoils dem, and den I get to teach a spoiled raptor and a nervous rider on de same mornin'. He be de best breeder de Darkspear have, mon, but don't tell him I said so, because his head be big enough." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK" } },
    },
    wolves = {
      lines = { { id = "wo_default", text = "Steadier, sure, and so is a cart. A wolf runs where de pack runs, but a raptor thinks for itself, and on de islands where we came from dat was de difference between a live rider and a dead one. Ask Kildar up in Orgrimmar, and he will tell you de opposite all day." } },
      choices = {
        { text = "Where do you train them to run?", next = "beach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beach = {
      lines = { { id = "be_default", text = "Along de shore south of de village, at low tide, where de sand be hard and de fall be soft. We stay well clear of de Echo Isles, because Zalazane's trolls throw spears at anything dat moves on de water's edge." } },
      choices = { { text = "Something else, Xar'Ti.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    outsider = {
      lines = { { id = "ou_default", text = "If de whole tribe calls you friend, den yes, and not one day before. A raptor smells a stranger, mon, and I won't put my name on a lesson dat ends with somebody's leg in its mouth." } },
      choices = { { text = "Then I'll earn the tribe's word first.", next = "BACK" } },
    },
  },
  topics = {
    echo_isles = { { id = "tp_isles", text = "I learned to ride on dem isles, on a beach longer dan dis whole coast. Zalazane has it now, and I teach on a strip of sand between de murlocs and de crabs." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin falls well, and I can't say better of any rider. His father Sen'jin made sure of it, long before dere was a village with his name." } },
    darkspear = { { id = "tp_darkspear", text = "We be a small tribe, and we have lost two homes already. Dat be why I am strict, mon, because we don't have riders to waste." } },
    _none = { { id = "tp_none", text = "I teach riding, mon, not dat." } },
  },
}

---------------------------------------------------------------------------
-- Bom'bay: Master Gadrin's apprentice witch doctor, keen to practise on anyone.
---------------------------------------------------------------------------
P:NPC {
  key = "bombay", id = TODO_NPC("Bom'bay"), name = "Bom'bay", title = "Witch Doctor in Training",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "senjin" }, temper = { "eager", "cheerful" }, values = { "curious", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "He very much wants someone to practise his hexes on.",
    third = "{name} met Bom'bay, the eager young witch doctor apprenticed to Master Gadrin.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, you look like somebody who wants to see some real voodoo! No? Maybe a little voodoo?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back, mon, dey all run away when I start chantin'." },
    { id = "g_away", when = { away = 14 }, text = "You were gone so long I thought maybe I hexed you by accident and forgot! But no, here you are, mon, same shape and everything." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to de elements, and I talk to de loa, so we be almost cousins, mon." },
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "Oh, a dead one who walks and talks! Master Gadrin says I shouldn't stare, so I be starin' very politely." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear who don't know me yet! Dat means nobody warned you, mon, so stand still a moment while I think of somethin' small." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Un'Thuwa says your kind turn people into sheep on purpose, and get it right every time. Dat sounds very borin', mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Bom'bay, and I be learnin' de voodoo from Master Gadrin himself. He says my magic be strong, mon, very strong, but I need practice, and nobody in Sen'jin wants to be practised on." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Sure you don't want a little hex?" },
        { id = "h_again2", text = "Ask anything, ask me about voodoo!" },
        { id = "h_again3", text = "You still be here, and you still got two legs and no tail! See, mon, I can be careful when I try." },
      },
      choices = {
        { text = "What sort of hexes do you practise?", next = "hexes" },
        { text = "What's it like learning from Gadrin?", next = "gadrin" },
        { text = "Your voodoo is strong? Prove it on Zalazane.", next = "zalazane" },
        { text = "The rest of the village keeps well away from you.", next = "village" },
        { text = "A witch doctor needs more than hexes, surely.", next = "craft" },
        { text = "I'm a priest. The loa and I should be introduced.", next = "priest", when = { class = "PRIEST", race = "Troll" } },
        { text = "I could teach you a thing or two about curses, Bom'bay.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "No hexes today, Bom'bay.", next = "END" },
      },
    },
    hexes = {
      lines = { { id = "he_default", text = "Little ones, mostly, nothin' dangerous! I can make a body grow big, or small, or turn dem into somethin' with more legs for a while, and sometimes even what I meant to do happens." } },
      choices = {
        { text = "Sometimes?", next = "hexes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hexes2 = {
      lines = { { id = "he2_default", text = "Most times, I mean, most times! Once I turned a grunt into a frog when I meant to make him strong, and he wasn't happy, but he turned back by supper and he only croaked a little after." } },
      choices = { { text = "Something else, Bom'bay.", next = "BACK" } },
    },
    gadrin = {
      lines = { { id = "ga_default", text = "He be de wisest troll in Durotar, mon, he taught Vol'jin himself! He also taught Zalazane, and he don't like to talk about dat, so I don't ask, and you shouldn't either." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    zalazane = {
      big = true,
      lines = { { id = "za_default", text = "Ooh, I would, mon, if Master Gadrin let me! He says I ain't ready, and Zalazane be too strong for an apprentice, but one day I be walkin' onto dem islands and hexin' every hexed troll back to himself." } },
      choices = {
        { text = "Listen to Gadrin. Your time will come.", next = "BACK", reply = "Dat be what he says too, every day. Fine, fine, I be patient, mostly.", fx = { align = { order = 1 } } },
        { text = "Don't wait for permission. Go now.", next = "BACK", reply = "Hey, don't tempt me, mon! Master Gadrin would turn me into a frog for real, and he never misses.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "Dey do, and it hurts my feelings a little, mon! Hai'zan won't let me near his meat since de jerky started hoppin', and Lau'Tiki says if I hex one more fish he be usin' me for bait." } },
      choices = {
        { text = "Who in Sen'jin still lets you practise?", next = "village2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village2 = {
      lines = { { id = "vi2_default", text = "De crabs on de beach, mostly, because dey can't complain to Master Gadrin. I made one de size of a hut last moon, and Vel'rin Fang had to hunt it before it got to de raptor pens, and he was not happy but he ate well for a week." } },
      choices = {
        { text = "What did Master Gadrin say about that?", next = "village3" },
        { text = "Something else, Bom'bay.", next = "BACK" },
      },
    },
    village3 = {
      big = true,
      lines = { { id = "vi3_default", text = "He looked at de shell a long time, and den he said power without aim be how Zalazane started. He never said anything dat frightened me more, mon, and I practised nothin' but small hexes for a whole week after." } },
      choices = {
        { text = "He's right. Learn the aim before the power.", next = "BACK", reply = "I know, I know, and I be tryin', mon. Small hexes, clean hexes, and one day big ones dat go where I point.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power like yours shouldn't be kept on a leash.", next = "BACK", reply = "Dat be what I thought too, till I saw his face. Don't say it where he can hear, mon, or we both be frogs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft = {
      lines = { { id = "cr_default", text = "Oh, much more, and dat be de dull part! Poultices, bone-settin', de names of all de loa and what each one likes to be given, and which herbs Mishiki must pick by moonlight. Master Gadrin says a witch doctor heals ten for every one he hexes, and he makes me count." } },
      choices = {
        { text = "Healing ten is the better half of the craft.", next = "BACK", reply = "Dat be what he says, and de village agrees with him. I still like de hexes better, but I heal de ten first.", fx = { align = { light = 1 } } },
        { text = "The hexes are what enemies will remember.", next = "BACK", reply = "Ha, yes! Nobody tells stories about a poultice, mon. But don't tell Master Gadrin we talked like dis.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "You already know dem, mon, you just call on dem more politely dan I do! Go and sit with Master Gadrin when you have an evenin', because he says de priests and de witch doctors drink from de same river at different bends." } },
      choices = { { text = "I'll sit with him. Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "No, no, mon, I thank you, but no. De loa bargain hard, but dey be ours, and Master Gadrin says de things you bargain with were never anybody's friend. I stare at dead ones politely, and I stay away from demons politely too." } },
      choices = { { text = "Suit yourself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    echo_isles = { { id = "tp_isles", text = "I was small when we left dem, mon, so I remember de drums and not much else. Master Gadrin remembers everything, and dat be why he don't sleep well." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be a shadow hunter, and dat be a thing I can never be, because de loa pick dose demselves. I asked dem anyway, and so far dey be quiet about it." } },
    darkspear = { { id = "tp_darkspear", text = "We be de smallest tribe and de cleverest, mon, and we got de best voodoo. I don't say dat only because it be my tribe, but it helps." } },
    _none = { { id = "tp_none", text = "Dat I don't know, but I could hex you and maybe you'd forget you asked!" } },
  },
}

---------------------------------------------------------------------------
-- Hai'zan: Sen'jin butcher.
---------------------------------------------------------------------------
P:NPC {
  key = "haizan", id = TODO_NPC("Hai'zan"), name = "Hai'zan", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "jovial" }, values = { "practical" },
  notices = { "hunger", "race" },
  impression = {
    first = "The murlocs keep trying to steal his fish.",
    third = "{name} met Hai'zan, the troll butcher at Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Meat, mon, fresh off de bone! You look hungry, and Hai'zan be fixin' dat." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? De jerky got you, I knew it would." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You hear dat, mon? Mrrgl, mrrgl, all night down de beach. Buy somethin' and help me forget dem." },
    { id = "g_away", when = { away = 14 }, text = "Dere you are, mon! I thought de murlocs got you, and I was goin' to ask dem for my jerky back." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't worry, big friend, no kodo here. Boar and crab and lizard, dat's all." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, good! You I don't have to explain de pepper to, and dat saves me half de mornin'." },
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a fishin' pole, mon. If you pull anything fat out of dat surf, bring it to me before de murlocs see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Hai'zan, butcher of Sen'jin, and I feed dis whole village plus anybody passin' through. Boar from de hills, crab from de beach, and whatever de hunters bring back alive enough to cook." },
        { id = "h_orc", when = { race = "Orc" }, text = "I be Hai'zan, butcher of Sen'jin. You orcs like it plain, I know, so I keep a little without de pepper at de back, for guests and for children." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Go on, I got time while de meat dries." },
        { id = "h_again3", text = "You talk, I chop, everybody be happy. What you want to know now, mon?" },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "What's wrong with the murlocs?", next = "murlocs" },
        { text = "Best jerky in Durotar? Cook Torka might disagree.", next = "torka" },
        { text = "Your block must feed the raptor pens as well.", next = "raptors" },
        { text = "The hunters here bring you their kills, I take it.", next = "hunters" },
        { text = "I cook. Tell me what goes into the jerky.", next = "recipe", when = { profession = "Cooking" } },
        { text = "Farewell, Hai'zan.", next = "END" },
      },
    },
    murlocs = {
      big = true,
      lines = { { id = "mu_default", text = "Dey steal my fish, dey steal my crabs, and dey make dat noise all night, mrrgl mrrgl, till a troll can't sleep. De hunters thin dem out, but dere be always more crawlin' up out of de surf." } },
      choices = {
        { text = "I'll thin them out for you.", next = "BACK", reply = "Hah! Bring me back some fins, and I'll know you did it. De village thanks you, mon.", fx = { align = { light = -1 } } },
        { text = "They're just hungry, like you. Share the beach.", next = "BACK", reply = "Share? With murlocs? You be a strange one, mon, but maybe a kind one.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    torka = {
      lines = { { id = "to_default", text = "Torka cooks for grunts, and grunts eat anything, so what does he know? I put pepper in mine, and he puts in nothin' but salt and complaints." } },
      choices = {
        { text = "He says trolls always want more pepper.", next = "torka2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    torka2 = {
      lines = { { id = "to2_default", text = "And he be right, mon, so what? Food without pepper be like a song without drums, and I won't eat it, and neither will anybody in Sen'jin." } },
      choices = { { text = "Something else, Hai'zan.", next = "BACK" } },
    },
    raptors = {
      lines = { { id = "ra_default", text = "It does, and Zjolnir's beasts eat better dan some grunts in Razor Hill. Every bone and scrap goes to his troughs, mon, because a Darkspear butcher who wastes meat gets talked about." } },
      choices = {
        { text = "Nothing at all goes to waste, then.", next = "raptors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors2 = {
      lines = { { id = "ra2_default", text = "Nothin', mon. De hides go to de leatherworkers, de fat goes to Master Vornal for his oils, and de crab shells get ground up for de gardens. On de islands we had plenty and wasted plenty, and we don't live on de islands anymore." } },
      choices = { { text = "Something else, Hai'zan.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    hunters = {
      lines = { { id = "hu_default", text = "Vel'rin Fang's hunters do, yes. Tiger from de isles when dey dare to cross, boar from de hills, and now and den a makrura dat somebody had to fight for an hour. I pay fair, and I pay more if de hide be in one piece." } },
      choices = {
        { text = "What's the hardest meat to come by here?", next = "hunters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters2 = {
      lines = { { id = "hu2_default", text = "Tiger, mon, always tiger. De good ones be on de Echo Isles, right under Zalazane's nose, and a hunter who goes for one has to cross de water, get past de hexed trolls, and swim back draggin' a cat." } },
      choices = {
        { text = "Is any meat worth that kind of risk?", next = "hunters3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters3 = {
      big = true,
      lines = { { id = "hu3_default", text = "De meat, no, but it be never about de meat. A young Darkspear who brings a tiger home from our own islands has taken somethin' back from Zalazane, even if it be small, and de whole village eats dat feelin' for a week." } },
      choices = {
        { text = "Small victories keep a people's heart alive.", next = "BACK", reply = "Dat be it, mon, dat be it exactly. Sit down some evenin' and I cut you a piece of de next one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's a foolish risk for a little pride.", next = "BACK", reply = "Maybe so, mon, maybe so. But you never lost your home, I think, or you would not call it little.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe = {
      lines = { { id = "rc_default", text = "Ha, a cook asks! Raptor or boar cut thin as a leaf, salt from de tide pools, hot pepper crushed with de seeds still in, and three days in de sea wind and never in de sun. De rest be my grandmother's, mon, and she would haunt me if I told." } },
      choices = { { text = "I won't cross your grandmother. Something else.", next = "BACK" } },
    },
  },
  topics = {
    echo_isles = { { id = "tp_isles", text = "We had fruit trees dere, and tigers, and fish you could catch with your hands. Here I got boar and crab and wind, but I be alive to cook dem, and dat counts." } },
    darkspear = { { id = "tp_darkspear", text = "A tribe be a pot, mon, and everybody puts somethin' in. I put in de meat, and Master Gadrin puts in de wisdom, and Bom'bay mostly puts in trouble." } },
    thrall = { { id = "tp_thrall", text = "De Warchief ate at my block once and asked for more pepper. I knew den we had picked de right orc to follow." } },
    _none = { { id = "tp_none", text = "If you can't eat it, I don't know it, mon." } },
  },
}

---------------------------------------------------------------------------
-- Grimtak: Razor Hill butcher, one finger short.
---------------------------------------------------------------------------
P:NPC {
  key = "grimtak", id = TODO_NPC("Grimtak"), name = "Grimtak", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff" }, values = { "practical", "craft" },
  notices = { "hunger", "craft" },
  impression = {
    first = "He blames his missing finger on a cleaver and a bad night.",
    third = "{name} met Grimtak, the Razor Hill butcher who's lost a finger to his own trade.",
  },
  greetings = {
    { id = "g_default", text = "Meat and drink, west of the inn, just like the sign says. If you're hungry, you're in the right place." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still got all your fingers? Good, keep it that way." },
    { id = "g_morning", when = { timeOfDay = "morning" }, text = "You're early. The boar came in at dawn and it's still warm, so you'll not get fresher in Durotar." },
    { id = "g_away", when = { away = 14 }, text = "Haven't seen you in a while. I'd assumed the Barrens ate you, and it's the other way round, I hope." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Watch your hands with the cleaver, or you'll end up like me." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll. If you want pepper on it, the village down the coast has a butcher who'll drown it for you." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh up from the valley, by the look of those boots. Eat before Gar'Thok finds you, because he won't wait while you chew." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grimtak, butcher of Razor Hill. I sell what the hunters bring in and what the boars give up, and some drink to wash it down." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Grimtak, butcher of Razor Hill. Tarshaw's students eat like wolves and pay like peons, so show me your coin before you show me your appetite." },
      },
      again = {
        { id = "h_again", text = "What else? I've got meat to cut." },
        { id = "h_again2", text = "Go on, ask. I'll keep one eye on the cleaver." },
        { id = "h_again3", text = "Still here? Then talk while I work, because the boar won't cut itself." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What happened to your finger?", next = "finger" },
        { text = "You and Torka share the town's kitchen?", next = "torka" },
        { text = "The hunters keep you supplied, by the look of it.", next = "hunters" },
        { text = "Razor Hill looks a hard town to keep fed.", next = "town" },
        { text = "I skin my own kills. Do you buy carcasses?", next = "skinner", when = { profession = "Skinning" } },
        { text = "I'll see you, Grimtak.", next = "END" },
      },
    },
    finger = {
      lines = { { id = "fi_default", text = "I was cutting boar one night after too much grog, and the cleaver found my finger before it found the bone. Hurt like a Burning Blade curse, and now I count to nine instead of ten." } },
      choices = {
        { text = "You kept working after that?", next = "finger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    finger2 = {
      big = true,
      lines = { { id = "fi2_default", text = "Bandaged it and kept cutting, because the garrison was still hungry. An orc doesn't stop working because of a scratch, and a finger is just a big scratch." } },
      choices = {
        { text = "That's the orc way. Work through the pain.", next = "BACK", reply = "Exactly, and every grunt in this town knows it. You'd make a good butcher.", fx = { align = { order = 1 } } },
        { text = "You should have rested. The garrison could wait.", next = "BACK", reply = "Maybe, but a hungry garrison is an angry garrison, and I'd rather lose a finger than face that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    torka = {
      lines = { { id = "to_default", text = "Torka cooks for the barracks, and I sell to everyone else. He thinks I overcharge, and I think he oversalts, and we leave it there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunters = {
      lines = { { id = "hn_default", text = "Thotar's students bring in most of it, boar and the odd crocolisk off the Southfury. The young ones hack the carcass half to ruin getting it here, and I pay them by what's left." } },
      choices = {
        { text = "What sells best to the grunts?", next = "hunters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters2 = {
      lines = { { id = "hn2_default", text = "Boar ribs and anything they can eat with one hand on a wall. Scorpid I can't give away, though Galgar down in the valley swears by it, and the crab only moves when the trolls come up from Sen'jin." } },
      choices = { { text = "Something else, Grimtak.", next = "BACK" } },
    },
    town = {
      lines = { { id = "tw_default", text = "It is a garrison first and a town second. Every recruit who walks out of the Valley of Trials stops here hungry, and half the caravans bound for the Crossroads fill their packs at my block before they take the western road." } },
      choices = {
        { text = "Does enough food come in to feed them all?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "tw2_default", text = "Most seasons, though Durotar is no farmland and never will be. Jark gets flour and dried fruit up from Ratchet when the goblins feel like selling, and the rest is whatever can be hunted between here and the river." } },
      choices = {
        { text = "And in a bad season?", next = "town3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town3 = {
      big = true,
      lines = { { id = "tw3_default", text = "Then the garrison eats first and everyone else eats thin, and that is Gar'Thok's order, not mine. I have turned away peons with coin in their hands so that a grunt on the wall could have the last haunch." } },
      choices = {
        { text = "The ones who guard the town must eat first.", next = "BACK", reply = "That's how I see it, and how the commander sees it. It doesn't make the peon's face any easier to look at.", fx = { align = { order = 1 } } },
        { text = "A peon's hunger is no smaller than a grunt's.", next = "BACK", reply = "No, it isn't, and I've slipped a few of them a rib bone when nobody was counting. Don't repeat that at the barracks.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skinner = {
      lines = { { id = "sk_default", text = "I do, if you bring them whole and you bring them the same day. Take the hide yourself, I've no use for it, and leave me the meat with the bone in." } },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    quilboar = { { id = "tp_quilboar", text = "The Razormane raid the western farms and run the boar off before I can buy them. I'd butcher a quilboar out of spite, if I thought anyone would eat it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave us a land of our own, and I'll not complain that it's mostly rock. Rock is better than a camp fence." } },
    internment = { { id = "tp_internment", text = "In the camps they fed us gruel from a trough, the same every day. I became a butcher so no orc near me would eat like that again." } },
    _none = { { id = "tp_none", text = "No idea. Ask me about boar." } },
  },
}

---------------------------------------------------------------------------
-- Cutac: cloth and leather armor, Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "cutac", id = TODO_NPC("Cutac"), name = "Cutac", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "dry" }, values = { "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "He has seen too many recruits come back in pieces.",
    third = "{name} met Cutac, who sells cloth and leather armor in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Cloth and leather. Not the best in the Horde, but the best in Razor Hill, which is what you've got." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. That armor still holding together?" },
    { id = "g_low", when = { maxLevel = 8 }, text = "Up from the valley, are you? Then look at the boots before you look at anything else on this stall." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone a while, and you've come back in one piece. The boots held, then." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and still wearing that thin robe from the valley. You'll want something warmer before the Barrens wind gets you." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear is hanging off you in strips. Uhgar can mend the metal, and whatever is past mending I can replace." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Soft soles and dark leather. Kaplak's lot always buy the same things, and they always ask if I've got it in black." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cutac. I sell armor to the recruits who come up from the Valley of Trials, and most of them need it more than they know." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Cutac. I sell cloth to those who fight with their heads, and I'll tell you what I tell all of them, which is that a robe stops nothing, so stand behind somebody in mail." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. The wind's too strong for customers today anyway." },
        { id = "h_again3", text = "Go on, then. I'm not selling much while you stand in front of the stall anyway." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "What do recruits need most?", next = "recruits" },
        { text = "What dangers should I watch for?", next = "danger" },
        { text = "Your leather looks locally cut.", next = "leather" },
        { text = "You've watched a good many recruits pass through.", next = "seen" },
        { text = "Which of this would suit someone who works unseen?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I work leather myself. Who tans your hides?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "Farewell, Cutac.", next = "END" },
      },
    },
    recruits = {
      lines = { { id = "re_default", text = "Boots, first, because Durotar is all rock and thorns, and gloves, second, because the scorpids pinch. Most of them want a fancy chest piece and walk to Orgrimmar with bleeding feet." } },
      choices = {
        { text = "Why don't they think of boots?", next = "recruits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = { { id = "da_default", text = "The Kul Tiras men at Tiragarde Keep on the coast, the Burning Blade in their caves, and the Razormane quilboar out west. Every week I sell armor to a recruit, and every week Gar'Thok sends one of them out against one of those." } },
      choices = {
        { text = "The Horde needs those recruits fighting.", next = "BACK", reply = "It does, and they go gladly. I just wish they'd buy boots first.", fx = { align = { honor = 1 } } },
        { text = "Gar'Thok sends them too young. That's waste.", next = "BACK", reply = "Careful saying that near the barracks. I think it, but I don't say it loudly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    recruits2 = {
      lines = { { id = "re2_default", text = "Because nobody sings about boots. They've grown up on stories of Grom and Doomhammer, and not one of those stories stops to mention what the hero had on his feet when he crossed the Barrens." } },
      choices = {
        { text = "What becomes of the ones who won't listen?", next = "recruits3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits3 = {
      big = true,
      lines = { { id = "re3_default", text = "They limp back in a week with their feet wrapped in rags and buy the boots after all, at the same price. I could tell them I told them so, but the blisters have usually said it for me." } },
      choices = {
        { text = "Let them learn the hard way. It sticks.", next = "BACK", reply = "It does stick. So do the blisters, but you're not wrong.", fx = { align = { light = -1 } } },
        { text = "You could press them harder before they leave.", next = "BACK", reply = "I could, and some days I do. The ones worth saving usually listen the second time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "le_default", text = "Most of it is, yes. Boar hide off Grimtak's carcasses, scorpid plate when the hunters bring it in unbroken, and the cloth comes down from Orgrimmar on the same carts that bring the garrison's grain." } },
      choices = {
        { text = "Scorpid shell makes decent armor?", next = "leather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather2 = {
      lines = { { id = "le2_default", text = "Better than you'd think, and cheaper than anything else that turns a blade out here. It cracks in the cold, so don't wear it north, but Durotar has never once been cold." } },
      choices = { { text = "Something else, Cutac.", next = "BACK" } },
    },
    seen = {
      lines = { { id = "se_default", text = "Hundreds by now. I can usually tell in the first minute which ones will come back, and it's rarely the loud ones or the big ones. It's the ones who ask what something is for before they ask what it costs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "rg_default", text = "The dark boar leather, the soft boots, and nothing with a buckle that catches the light. Kaplak sends his students to me with exactly that list, and he checks them at the door when they get back." } },
      choices = { { text = "Then I'll take his list. Something else.", next = "BACK" } },
    },
    lw = {
      lines = { { id = "lw_default", text = "I tan the boar myself, behind the stall, which is why nobody stands downwind of me. If you've good scorpid pieces, I'll look at them, though the real leatherworkers are up in the Drag in Orgrimmar." } },
      choices = { { text = "I'll seek them out. Something else.", next = "BACK" } },
    },
  },
  topics = {
    quilboar = { { id = "tp_quilboar", text = "The Razormane wear thorns and scraps, and they still put holes in my best leather. Buy the thicker jerkin if you're going west." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wears his plate like he was born in it. I sell to the ones who aren't there yet." } },
    burning_blade = { { id = "tp_blade", text = "Cultists, in the caves and on the plateau. Orgnil Soulscar can tell you about them; I only see what their fire does to a good robe." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask at the inn." } },
  },
}

---------------------------------------------------------------------------
-- Dhugru Gorelust: warlock trainer of Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "dhugru", id = TODO_NPC("Dhugru Gorelust"), name = "Dhugru Gorelust", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "cold", "sharp" }, values = { "ambitious", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "He seems to know exactly how much the town distrusts him.",
    third = "{name} met Dhugru Gorelust, the warlock trainer in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Another curious one. Most in Razor Hill walk wide of my door, so you're either brave or foolish, and I've no use for the second kind." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, which is more than most manage. The craft rewards persistence, and so do I, within reason." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Come for more, have you? Step closer; I don't bite, though some of my servants do." },
    { id = "g_void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } }, text = "So Gan'rul gave you a voidwalker and you brought it home to Razor Hill. Keep it outside the walls when you can, because Gar'Thok's terms say nothing larger than an imp, and I'd like those terms to stay mine." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You're a shaman, and you're wrinkling your nose at me the way they always do. The spirits and I are not on speaking terms, I'm afraid." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your minion is restless, and that means your hold on it is loose. Tighten it before you speak to me again, or it will embarrass us both." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "So you're a priest. You and I both reach into places the grunts would rather not look, and only one of us is thanked for it." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 25 } },
      text = "There's a green cast to the whites of your eyes. You've been using the fel more than you've been resting from it, and I know that look because I've worn it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dhugru Gorelust, and I teach those with the will to command what others fear. The Warchief tolerates us so long as we serve the Horde, and I serve it well." },
        { id = "h_lock", when = { class = "WARLOCK", maxLevel = 19 }, text = "I am Dhugru Gorelust, and I take Nartok's students when the valley grows too small for them. You'll learn the curses and the drains from me, and how to make a soul shard of what you kill, and you'll learn them properly or not at all." },
        { id = "h_orclock", when = { race = "Orc", class = "WARLOCK" }, text = "I am Dhugru Gorelust. My generation dragged this craft through the mud, and yours will decide whether it's ever clean again, so I don't teach orcs gently." },
        { id = "h_high", when = { class = "WARLOCK", minLevel = 20 }, text = "You've grown, and still you come back to Razor Hill. Is that sentiment, or do you want something the Cleft won't give you?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I'm listening, though not forever." },
        { id = "h_again2", text = "Speak, before my patience runs thinner than it already is." },
        { id = "h_again3", text = "You linger longer than most dare to. Ask, then, and I'll decide whether it deserves an answer." },
      },
      choices = {
        { text = "Teach me, Dhugru. I'm hungry for more.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How do I make a soul shard?", next = "shards", when = { class = "WARLOCK" } },
        { text = "Sometimes I feel the fel pulling at me after a fight.", next = "hunger", when = { class = "WARLOCK" } },
        { text = "Why does Razor Hill avoid you?", next = "avoid" },
        { text = "How is your magic different from the Burning Blade's?", next = "blade" },
        { text = "Gar'Thok lets a warlock teach inside his walls.", next = "garthok" },
        { text = "Your students must be hard to come by here.", next = "students" },
        { text = "The dead have fewer scruples about shadow than orcs.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Orgnil hunts cultists. Do you help him?", next = "orgnil" },
        { text = "I'll be going.", next = "END" },
      },
    },
    shards = {
      lines = { { id = "sd_default", text = "Drain Soul, cast as the thing dies, so its last breath goes into you instead of out into the air. What's left hardens into a shard, and you'll carry them in a bag like coins, because every healthstone, every soulstone and every demon you call from here on will cost you one." } },
      choices = {
        { text = "That sounds like robbing the dead.", next = "shards2" },
        { text = "Back to the lessons.", next = "BACK" },
      },
    },
    shards2 = {
      big = true,
      lines = { { id = "sd2_default", text = "It is robbery, from boars and quilboar and the Blade's cultists, and the dead have never once complained. The shaman call it an abomination, so tell me what you call it." } },
      choices = {
        { text = "A weapon taken from the enemy, and nothing more.", next = "BACK", reply = "Good. Carry that answer up to Orgrimmar, because they'll ask you there too.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "A cost I'll carry, and not lightly.", next = "BACK", reply = "Carry it, then, but don't let it slow your hand. The shard doesn't care how you feel about it.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hunger = {
      narr = "His eyes narrow, and he studies your hands as if expecting them to shake.",
      lines = { { id = "hu_default", text = "Good, you've noticed, and most don't until it has them by the throat. The fel likes to be used, and the more you use it the more it feels like strength and the less it feels like a stranger, which is exactly how it took our fathers." } },
      choices = {
        { text = "How do I keep it a stranger?", next = "hunger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunger2 = {
      lines = { { id = "hu2_default", text = "You stop when the fight is done, even when your hands want more. Then you go and sit with the grunts in the barracks, eat their bad stew and listen to their bad jokes, and remind yourself what you're fighting for before you think about what you're fighting with." } },
      choices = { { text = "Bad stew and bad jokes. I can manage that.", next = "BACK", reply = "Most can't, oddly enough. Warlocks are terrible company, and we prefer it that way." } },
    },
    avoid = {
      lines = { { id = "av_default", text = "Because they remember the warlocks of the old Horde, who sold our people to the demons for power. They see me and think of that, and they're not entirely wrong to, though I am not those warlocks." } },
      choices = {
        { text = "Then what are you?", next = "avoid2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    avoid2 = {
      big = true,
      lines = { { id = "av2_default", text = "I'm a tool the Horde can use, if it's wise, and a danger to it, if it isn't. Power is power, and the Horde has enemies enough that it can't afford to refuse any weapon." } },
      choices = {
        { text = "The Horde should use every weapon it has.", next = "BACK", reply = "Remember you said so when the shaman tell you otherwise.", fx = { align = { light = -1 } } },
        { text = "Some weapons cost more than they're worth.", next = "BACK", reply = "That's spoken like a shaman, or a coward, and time will tell which of us was right.", fx = { align = { light = 1 } } },
        { text = "Back to the other questions, then.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "bl_default", text = "The Burning Blade serve the demons, while I make the demons serve me. It's a small difference in words and an enormous one in practice, and Gar'Thok knows it, or I wouldn't be in his town." } },
      choices = {
        { text = "Where does the Blade hide in Durotar?", next = "blade2", fx = { learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade2 = {
      lines = { { id = "bl2_default", text = "Wherever there's a cave and a grievance. Fizzle Darkstorm keeps them at Thunder Ridge to the north, Skull Rock outside Orgrimmar's gate has been theirs since before the city was built, and the coven in the Valley of Trials catches the young ones before they even reach me." } },
      choices = { { text = "Let's talk about something else.", next = "BACK" } },
    },
    garthok = {
      lines = { { id = "gt_default", text = "He does, because he's a practical commander and the Burning Blade is on his doorstep. A town that fights demon-worshippers and refuses to keep anyone who understands them is fighting blind, and Gar'Thok has never been blind." } },
      choices = {
        { text = "On what terms does he keep you?", next = "garthok2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garthok2 = {
      lines = { { id = "gt2_default", text = "I teach only those sworn to the Horde, I summon nothing inside the walls larger than an imp, and I report every student's name to the barracks. In return his grunts glare at me from a distance and leave my door unbroken." } },
      choices = {
        { text = "Does that leash chafe?", next = "garthok3" },
        { text = "Let's talk about something else, Dhugru.", next = "BACK" },
      },
    },
    garthok3 = {
      big = true,
      lines = { { id = "gt3_default", text = "Every day, and I wear it anyway. I watched what warlocks without a leash did to our people, and I would sooner be watched by a commander than trusted by a fool." } },
      choices = {
        { text = "A power that accepts limits can be trusted.", next = "BACK", reply = "Trusted, no, but tolerated, and tolerance has kept me alive longer than trust ever kept Gul'dan.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The strong shouldn't answer to frightened grunts.", next = "BACK", reply = "That's what the Shadow Council said, and you may go and visit what's left of them. Think it if you must, but think it quietly.", fx = { align = { order = -1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "st_default", text = "Fewer than Tarshaw gets for his axes, certainly. Those who come to me have usually been to Nartok in the Valley of Trials first, and they arrive with an imp at their heels and the idea that they've already learned the hard part." } },
      choices = {
        { text = "And what is the hard part?", next = "students2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students2 = {
      lines = { { id = "st2_default", text = "Wanting less than the demon offers. Every one of them will be promised more, by the voidwalker, by the Blade's recruiters and by their own ambition, and the lesson that keeps a warlock in the Horde is taking exactly what was bargained for and no more." } },
      choices = {
        { text = "You sound ambitious yourself.", next = "students3" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    students3 = {
      lines = { { id = "st3_default", text = "I am, and I don't hide it. I want the day to come when an orc can say he's a warlock in the Valley of Strength and nobody reaches for an axe, and I'll get there by being more useful than anyone can afford to lose." } },
      choices = { { text = "I hope you live to see it.", next = "BACK", reply = "So do I, though I'd settle for you seeing it in my place." } },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "So I've heard, and I find it refreshing. Your people look at shadow as a tool and not a sin, though I'd advise you not to say so loudly in an orc garrison, where the memory of the old Horde is still raw." } },
      choices = { { text = "I'll keep my voice down, then.", next = "BACK" } },
    },
    orgnil = {
      lines = { { id = "og_default", text = "When he asks, which he does through gritted teeth. I can tell him what a Burning Blade circle was meant to summon from the ash it leaves behind, and he can tell me which of my former students he found standing in it." } },
      choices = { { text = "Back to the other questions.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "They're what I'd be if I had mistaken obedience for power. Fizzle Darkstorm at Thunder Ridge is one of theirs, and Orgnil Soulscar wants him badly." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman, and he permits us regardless. I respect that more than I would respect his approval." } },
    second_war = { { id = "tp_second_war", text = "Warlocks won battles in that war and lost the people who fought them. I teach both halves of that sentence." } },
    burning_legion = { { id = "tp_legion", text = "The Legion broke at Hyjal, and its servants didn't all break with it. Anyone who tells you the demons are finished with us is selling something." } },
    _none = { { id = "tp_none", text = "That isn't a matter of shadow, so it doesn't interest me." } },
  },
}

---------------------------------------------------------------------------
-- Shikrik: orc shaman trainer in the Valley of Trials.
---------------------------------------------------------------------------
P:NPC {
  key = "shikrik", id = TODO_NPC("Shikrik"), name = "Shikrik", title = "Shaman Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "steady" }, values = { "wise", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "She answers every newcomer's question as if it were the first.",
    third = "{name} met Shikrik, the orc shaman trainer in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Valley, young one. The spirits have been waiting for you, even if you didn't know it." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you look a little more sure of yourself. Good, the spirits like that." },
    { id = "g_away", when = { away = 14 }, text = "It has been many days, and the valley has sent a great many young ones out since you. Sit a moment and tell me what the wider world sounds like." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A new shaman, still unsteady with your totem. Hold it like you mean it; the earth spirit can tell when you don't." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You walk the other road, the one our people took once. I will not turn you away, young one, but the earth is uneasy where you stand." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the Earth Mother's children, in an orc's valley. Your people never forgot what mine had to learn again, and I am glad to see you here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Shikrik, and I teach the first steps of the shaman's path here in the Valley of Trials. The orcs forgot the spirits once, and we must never forget them again." },
      },
      again = {
        { id = "h_again", text = "What else, young one?" },
        { id = "h_again2", text = "Ask, the spirits are patient and so am I." },
        { id = "h_again3", text = "You have more to ask, and that is no fault. A shaman who stops asking has stopped learning." },
      },
      choices = {
        { text = "Teach me, Shikrik.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How did the orcs forget the spirits?", next = "forgot" },
        { text = "What should a new shaman learn first?", next = "first" },
        { text = "This valley must feel different to a shaman.", next = "valley" },
        { text = "The Burning Blade is in the caves above your recruits.", next = "blade" },
        { text = "Do the tauren hear the same spirits you do?", next = "tauren", when = { race = "Tauren" } },
        { text = "A troll speaks to the loa. Is that so different?", next = "troll", when = { race = "Troll" } },
        { text = "Farewell, Shikrik.", next = "END" },
      },
    },
    forgot = {
      lines = { { id = "fo_default", text = "When the warlocks offered power from the demons, many orcs took it gladly, and the spirits turned away in sorrow. It took Thrall and the old shaman like Drek'Thar to call them back, and even now some of the spirits remember what we did." } },
      choices = {
        { text = "Can the spirits forgive?", next = "forgot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgot2 = {
      big = true,
      lines = { { id = "fo2_default", text = "They already have, in part, or Thrall could not call on them as he does. But forgiveness is not forgetting, and every shaman of the Horde carries a little of that old debt." } },
      choices = {
        { text = "Then I'll carry it with honor.", next = "BACK", reply = "That is all the spirits ask, young one. Carry it well.", fx = { align = { light = 1 } } },
        { text = "I didn't make that debt. It isn't mine.", next = "BACK", reply = "No, but you are an orc of the Horde, or you stand with them. The spirits don't always see the difference, and neither do our enemies.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "Listen first and speak second, because the spirits answer those who listen. Canaga Earthcaller will give you your first trial with the earth, and when you're ready, Searn Firewarder in Orgrimmar will send you on to fire." } },
      choices = {
        { text = "How do you teach someone to listen?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "fi2_default", text = "By being still, which is the hardest thing to ask of a young orc. I send them to sit by the water at the valley's edge until they can tell me three things the water did that they did not expect, and most come back the first day with none." } },
      choices = {
        { text = "And the ones who never hear anything?", next = "first3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first3 = {
      big = true,
      lines = { { id = "fi3_default", text = "Then the spirits have not called them, and no teaching of mine will change it. I send those to Frang or to Jen'shan with no shame in it, because the Horde needs axes and bows as surely as it needs totems." } },
      choices = {
        { text = "Every path that serves the Horde has honor.", next = "BACK", reply = "It does, and I wish more of the young ones believed it before they wept at my door. Go well, whichever path is yours.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits choose the worthy. The rest fall short.", next = "BACK", reply = "The spirits choose whom they choose, and worth has little to do with it. I have known cowards who heard the wind and heroes who never did.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = { { id = "va_default", text = "It is a hard, dry place, and the spirits here are hard and dry with it. The earth is strong in these rocks and fire is never far, but water is shy in Durotar, and I have learned to thank it for every small thing." } },
      choices = {
        { text = "Why train the young in such a harsh place?", next = "valley2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley2 = {
      lines = { { id = "va2_default", text = "Because the Warchief chose it, and I think he chose well. A recruit who learns to listen where the land gives little will hear twice as much when the Horde sends him to the Barrens or beyond." } },
      choices = { { text = "Something else, Shikrik.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "bd_default", text = "I know, and so does the earth, which has not been quiet under that cave since they came. Zureetha Fargaze sends the recruits against them, and I would ask you to do as she says, because every familiar they summon is a small wound in this valley." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    tauren = {
      lines = { { id = "tn_default", text = "The same spirits, though you name the one who holds them all, and we do not. I learned more in one season listening to a Bloodhoof elder than in two years of my own stumbling, and I tell my students so." } },
      choices = { { text = "The Earth Mother hears you too. Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tl_default", text = "Different, yes, though I would not say lesser. Your loa have faces and tempers and want gifts, and the elements want only respect, but Master Gadrin and I have sat together and found we were often describing the same river." } },
      choices = { { text = "That's a fair way to see it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    the_elements = { { id = "tp_elements", text = "Earth, fire, water and air, and each asks to be met in its own way. Earth comes first for an orc, because we are a stubborn people and it understands us." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is the first of us in a generation to be called a far seer. When he speaks to the wind it answers, and I have seen old warriors weep at that." } },
    burning_blade = { { id = "tp_blade", text = "They do in a cave what our whole people once did in the open. That is why it must be answered here, by the young, before it grows." } },
    internment = { { id = "tp_internment", text = "In the camps we sat with nothing, not even anger. I think the silence there was the first time many of us were quiet enough to be heard again." } },
    _none = { { id = "tp_none", text = "That is not something the spirits have taught me, young one." } },
  },
}

---------------------------------------------------------------------------
-- Zlagk: Valley of Trials butcher.
---------------------------------------------------------------------------
P:NPC {
  key = "zlagk", id = TODO_NPC("Zlagk"), name = "Zlagk", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "practical" },
  notices = { "hunger" },
  impression = {
    first = "He is gruff, but nobody leaves his stall hungry.",
    third = "{name} met Zlagk, the butcher in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Hungry? Everyone who comes through this valley is hungry. Buy something, before you faint on my stall." },
    { id = "g_back", when = { metBefore = true }, text = "You survived the boars. Good, now buy some of them." },
    { id = "g_orc", when = { race = "Orc", maxLevel = 5 }, text = "Another young orc with an empty pack. Sit, eat, and listen to Gornek when he talks, in that order." },
    { id = "g_away", when = { away = 14 }, text = "Back in the valley after all this time? The boar hasn't changed, and neither have I." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 6 },
      text = "You look half-starved, recruit. Training's no good on an empty stomach." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're a long way from Mulgore, bull. I've nothing on the block that ever pulled a cart, so buy without worrying." },
    { id = "n_broke", cat = "purse", when = { money = { max = 30 } },
      text = "No coin, by the sound of that purse. Kill a few boars and bring me the flanks, and we'll call it even trade." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zlagk. I feed the recruits of the Valley, boar and water and not much else, but it fills you up and keeps you on your feet." },
        { id = "h_grown", when = { minLevel = 15 }, text = "Zlagk. You're well past needing my boar, by the look of you, but I fed plenty who went on to do the Horde proud, and I like to see how they turned out." },
      },
      again = {
        { id = "h_again", text = "What else, recruit?" },
        { id = "h_again2", text = "Go on, but be quick, there's a line." },
        { id = "h_again3", text = "You're still talking and you're still not eating. Fix one of those, recruit." },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS" },
        { text = "Where does the boar come from?", next = "boar" },
        { text = "What do you think of the recruits?", next = "recruits" },
        { text = "You and Galgar both feed this valley, it seems.", next = "galgar" },
        { text = "The peons must eat here too.", next = "peons" },
        { text = "I can cook what I kill. Any advice?", next = "cook", when = { profession = "Cooking" } },
        { text = "A troll could teach you a thing about seasoning.", next = "troll", when = { race = "Troll" } },
        { text = "I'll see you, Zlagk.", next = "END" },
      },
    },
    boar = {
      lines = { { id = "bo_default", text = "Right out there, from the mottled boars the recruits are sent to kill. The new ones bring me the meat and I sell it back to the next lot, and the valley feeds itself that way." } },
      choices = {
        { text = "The recruits must get sick of boar.", next = "boar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      big = true,
      lines = { { id = "re_default", text = "Soft, most of them, born after the camps and never knowing real hunger. The valley toughens them up quickly enough, and the ones who don't toughen up go back to Orgrimmar and become peons." } },
      choices = {
        { text = "Hardship makes strong warriors.", next = "BACK", reply = "It does, and this valley is all hardship. You'll do fine.", fx = { align = { order = 1 } } },
        { text = "Not knowing hunger is a good thing. Thrall wanted that.", next = "BACK", reply = "Maybe so, and maybe I'm just an old orc grumbling. Eat up, recruit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar2 = {
      lines = { { id = "bo2_default", text = "The first week, yes, and by the second they would trade their axe for a piece of fruit. I tell them the same thing every time, which is that they'll remember this boar fondly the first night they go hungry in the Barrens." } },
      choices = {
        { text = "Is there truly nothing else to eat here?", next = "boar3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar3 = {
      lines = { { id = "bo3_default", text = "Scorpid, if you ask Galgar, and cactus apples if you've the patience to pull the spines. Duokna sells bread in the Den when the carts get through from Razor Hill, and that is the whole feast, recruit." } },
      choices = { { text = "Something else, Zlagk.", next = "BACK" } },
    },
    galgar = {
      lines = { { id = "ga_default", text = "Galgar cooks, and I cut, and we don't step on each other. He'll stew anything a recruit drags in and call it a surprise, and I'll say this for him, nobody has died of it yet." } },
      choices = {
        { text = "You don't think much of his cooking.", next = "galgar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    galgar2 = {
      big = true,
      lines = { { id = "ga2_default", text = "I think he works harder than anyone in this valley and gets thanked less. He was feeding orcs out of one pot in the camps when I was still too sick with the lethargy to lift a knife, and I've not forgotten who put a bowl in my hands." } },
      choices = {
        { text = "Then tell him so. He'd want to hear it.", next = "BACK", reply = "Hmph. Maybe I will, when there's nobody about to hear me do it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A debt like that is best left unspoken.", next = "BACK", reply = "That's the orc way, and it's been mine. He gets the best cuts for his pot, and we leave it at that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peons = {
      lines = { { id = "pn_default", text = "They eat more than the recruits and work half as much. Foreman Thazz'ril pays for their rations by the week, and I've told him he'd save coin if he fed them less, since a full peon is a sleeping peon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Cook the boar slow and the scorpid fast, and never the other way round. And salt it before you leave the valley, because meat turns in a day under this sun and there's no shade worth the name until Razor Hill." } },
      choices = { { text = "Slow boar, fast scorpid. Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Your people have tried. One of them put so much pepper on my boar that Gornek thought he'd been poisoned, and I've kept the pepper under the counter since. Ask, and I'll hand it over, but you eat it downwind of me." } },
      choices = { { text = "Ha. I'll ask when I'm hungry. Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_internment", text = "Humans fed us enough to keep us alive and not enough to make us want to be. I don't speak of it to the young ones; I just fill their plates." } },
    thrall = { { id = "tp_thrall", text = "The Warchief opened the camp gates, and I walked out on legs that could barely hold me. Everything I've cut since has been for him." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane up the valley think the boars are their cousins. They've a strange way of showing it, given what they feed them to." } },
    _none = { { id = "tp_none", text = "I sell food. Ask Gornek about that." } },
  },
}

---------------------------------------------------------------------------
-- Raider Jhash: patrols the road between the Valley of Trials and Razor Hill with Raider Kerr.
---------------------------------------------------------------------------
P:NPC {
  key = "jhash", id = TODO_NPC("Raider Jhash"), name = "Raider Jhash",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "razor_hill" }, temper = { "blunt" }, values = { "dutiful", "loyal" },
  notices = { "class", "soldier" },
  impression = {
    first = "He talks like a soldier on a long ride, plain and unhurried.",
    third = "{name} met Raider Jhash, who patrols the road from the Valley of Trials to Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Need something? Speak up, the patrol doesn't stop for long." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Road's been quiet, mostly, if you're asking." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Travelling after dark? Stay near the patrol if you're going our way, the scorpids come up onto the road when it cools." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, walking the road on foot. Get yourself a wolf, recruit, your legs will thank you." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "Straight out of the Den, by the look of you. Stay on the road till Razor Hill and you'll get there with all your limbs." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Good, you're mounted. Keep to the right of the road when we pass, the wolves don't like being crowded." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Raider Jhash. Kerr and I ride this road from the Valley to Razor Hill and back, and we make sure nothing bothers the recruits along the way." },
      },
      again = {
        { id = "h_again", text = "What else? Kerr's getting restless." },
        { id = "h_again2", text = "Ask, quick." },
        { id = "h_again3", text = "One more, then we ride. The road doesn't watch itself." },
      },
      choices = {
        { text = "What sort of trouble do you see?", next = "trouble" },
        { text = "Do you ever get tired of the same road?", next = "road" },
        { text = "You and Kerr have ridden together a long while.", next = "kerr" },
        { text = "That's a fine wolf under you.", next = "wolf" },
        { text = "I'm headed up the road. What should I know?", next = "advice" },
        { text = "A hunter could clear those scorpids for you.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I've an orc's legs. I could keep pace with you.", next = "orc", when = { race = "Orc" } },
        { text = "Safe riding, Jhash.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "tr_default", text = "Scorpids on the road, quilboar from the west, and the odd Burning Blade cultist sneaking out of Skull Rock. Most of it the recruits can handle, and the rest we handle for them." } },
      choices = {
        { text = "The Burning Blade is that close?", next = "trouble2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble2 = {
      lines = { { id = "tr2_default", text = "Closer than anyone likes, hiding in the caves near Orgrimmar and under the city itself, some say. Neeru Fireblade in the Cleft of Shadow could tell you more, if you can stand him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    road = {
      big = true,
      lines = { { id = "ro_default", text = "Every day, but somebody's got to ride it, and better me than some green recruit who'd get himself killed. The Warchief gave us this land, and keeping its roads safe is a soldier's job." } },
      choices = {
        { text = "That's honorable work. Thank you.", next = "BACK", reply = "Don't thank me, just keep your eyes open when you walk it.", fx = { align = { honor = 1 } } },
        { text = "Sounds dull. I'd want real battle.", next = "BACK", reply = "You'll get it, soon enough, out in the Barrens. Then you'll miss dull.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kerr = {
      lines = { { id = "ke_default", text = "Since the founding of Razor Hill, near enough. Kerr talks less than I do, which you'd not think possible, but there's nobody I'd sooner have at my flank when something comes out of the rocks." } },
      choices = {
        { text = "Has something come out of the rocks lately?", next = "kerr2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kerr2 = {
      lines = { { id = "ke2_default", text = "A pack of Razormane tried the road at dusk a few weeks back, thinking two riders were easy meat. Kerr took the left and I took the right, and Gar'Thok had a short report on his table by morning." } },
      choices = {
        { text = "Two riders against a whole pack?", next = "kerr3" },
        { text = "Something else, Jhash.", next = "BACK" },
      },
    },
    kerr3 = {
      big = true,
      lines = { { id = "ke3_default", text = "Two riders and two wolves, and the quilboar always forget to count the wolves. We could have ridden for the garrison instead, but there was a recruit on the road behind us who would have met them alone." } },
      choices = {
        { text = "You held for the recruit. That's what honor is.", next = "BACK", reply = "It's what the post is. But I'll take the word, since you offer it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Riding for help would have been the wiser play.", next = "BACK", reply = "Wiser for us, maybe. Not for the one walking.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wolf = {
      lines = { { id = "wf_default", text = "She is, and she knows it. Raised her from a pup out of the kennels in Orgrimmar, and she's saved my hide more often than I've fed her, which is the wrong way round for a rider to admit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = {
        { id = "ad_default", text = "Keep to the road, drink before you're thirsty, and don't cut across the gullies to save time, because that's where the scorpids nest. Razor Hill is north and a little east, and you'll see the watchtower before you see the walls." },
        { id = "ad_low", when = { maxLevel = 6 }, text = "Keep to the road and don't wander east toward the coast yet. Tiragarde Keep is full of Kul Tiras marines who'll put a ball through a lone recruit, and Gar'Thok will send you there soon enough with orders in your hand." },
      },
      choices = { { text = "I'll keep to the road. Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hn_default", text = "You'd be doing the patrol a favour, and Thotar in Razor Hill pays his students to do exactly that. Take the ones nearest the road first, and mind the stingers." } },
      choices = { { text = "Consider them thinned. Something else.", next = "BACK" } },
    },
    orc = {
      lines = { { id = "or_default", text = "Hah! For a mile, maybe, and then you'd be watching our dust. Earn your wolf from Ogunaro in Orgrimmar when you've the coin and the years, and then come and try me." } },
      choices = { { text = "I'll hold you to that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    quilboar = { { id = "tp_quilboar", text = "Razormane. They hold the hills west of Razor Hill and they test the road every few weeks. They haven't liked the answer yet." } },
    thrall = { { id = "tp_thrall", text = "The Warchief named this land for his father. I'll not have it said its roads weren't safe." } },
    centaur = { { id = "tp_centaur", text = "Kolkar, out past the western ridge. Not my road, but the Sen'jin scouts watch them, and I hear they're restless." } },
    _none = { { id = "tp_none", text = "Don't know. Ask in Razor Hill." } },
  },
}

---------------------------------------------------------------------------
-- Ukor: a worn-out peon on the path east of the Valley of Trials (A Peon's Burden).
---------------------------------------------------------------------------
P:NPC {
  key = "ukor", id = TODO_NPC("Ukor"), name = "Ukor",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "weary", "kindly" }, values = { "dutiful", "generous" },
  notices = { "class", "weary" },
  impression = {
    first = "Ukor is a peon who carried a bundle of food all the way from Razor Hill and found the valley did not need it. He is too tired to carry it back, and too honest to leave it.",
    third = "{name} met Ukor, a weary peon resting on the path outside the Valley of Trials with a burden he could carry no farther.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello there. Forgive me if I don't get up, because my legs stopped listening to me somewhere back on the road." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again. I'm still sitting here, as you can see, though the rock has got no softer." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Peon's Burden") }, text = "You're the one who carried my bundle to Grosk! I slept a whole night through after that, and I've not done that since the founding." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Those are strong shoulders you have. I had shoulders like that once, before I spent them on other people's lumber." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look worse than I feel, and I didn't think that could be done. Sit down a while, there's rock enough for two." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ukor, and I'm only a peon, but I like to be of use. I carried this bundle of food down from Razor Hill for the recruits, and when I got here they told me the valley has plenty." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Peon's Burden") },
          text = "You look as though you're leaving the valley. I walked all the way from Razor Hill with this food and nobody here needs it, and I don't think my legs will carry it back to Innkeeper Grosk." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Peon's Burden") },
          text = "You still have my bundle? Follow the road north and east to Razor Hill, and give it to Innkeeper Grosk at the inn. Tell him Ukor is sorry it took so long." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Peon's Burden"), days = 3 } },
          text = "Grosk has his bundle, then, and nothing spoiled? That's a weight off me twice over. You've been kinder to a peon than most would trouble to be." },
        { id = "h_later", when = { questLater = { TODO_QUEST("A Peon's Burden"), days = 7 } },
          text = "I've been up and down that road twice since you helped me, and I rest at the halfway rock now, the way I should have before. A peon learns slowly, but he learns." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I've nowhere to be until my legs agree to it." },
        { id = "h_again2", text = "Ask what you like. It's pleasant to be talked to and not shouted at." },
        { id = "h_again3", text = "I'm listening, friend. Listening doesn't use the legs." },
      },
      choices = {
        { text = "How did you end up carrying food nobody wanted?", next = "burden" },
        { text = "That road isn't safe for a peon alone.", next = "road" },
        { text = "Nobody thinks much about peons, do they?", next = "peon" },
        { text = "Does Foreman Thazz'ril know you're out here?", next = "thazzril" },
        { text = "A healer could ease those legs for you.", next = "heal", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "I'm an orc too. Why didn't you become a grunt?", next = "grunt", when = { race = "Orc" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Rest well, Ukor.", next = "END" },
      },
    },
    burden = {
      lines = { { id = "bu_default", text = "I heard a grunt at the inn say the valley's recruits were going hungry, so I asked Grosk for a bundle and set off before anyone could tell me not to. It turns out the grunt was talking about last season, and Galgar's pot has been full for months." } },
      choices = {
        { text = "Nobody ordered you to bring it?", next = "burden2" },
        { text = "Something else, Ukor.", next = "BACK" },
      },
    },
    burden2 = {
      lines = { { id = "bu2_default", text = "No, nobody did. I thought that if recruits were hungry, somebody ought to do something, and I was somebody. Grosk gave me the food on trust, so it has to go back to him, because it was never mine to leave by the road." } },
      choices = {
        { text = "Why not simply eat it yourself?", next = "burden3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burden3 = {
      big = true,
      lines = { { id = "bu3_default", text = "Because it isn't mine. I'm hungry, I'll not pretend otherwise, but a peon who eats what he was trusted to carry is a thief with a tired back, and I'd rather sit here hungry than be that." } },
      choices = {
        { text = "That's honor, Ukor, whatever anyone calls you.", next = "BACK", reply = "Nobody has said that word to me before. I'll remember it on the walk home.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Grosk would never know. You're too honest to prosper.", next = "BACK", reply = "I would know, and that's enough people. I've never prospered, so I'll not miss it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "ro_default", text = "It isn't, and I found that out with my own eyes. There are scorpids in the gullies and boars that charge anything slow, and I am very slow. Raider Jhash and Raider Kerr rode past twice and kept the worst of it off me, though I don't think they noticed I was there." },
      },
      choices = {
        { text = "The patrol should have escorted you.", next = "BACK", reply = "They've a whole road to mind, and I'm one peon. It was kind enough that they rode by when they did.", fx = { align = { light = 1 } } },
        { text = "A peon who wanders off alone takes his chances.", next = "BACK", reply = "That's true, and nobody made me come. I only wish my chances had been a little shorter in the leg.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peon = {
      lines = { { id = "pe_default", text = "Not much, no, and I don't blame them. We chop and we carry and we sleep when we can, and the Horde's walls go up all the same. I helped raise the gate at Razor Hill, and I look at it every time I pass and think that part of it is mine." } },
      choices = {
        { text = "The Warchief says peons are the Horde's backbone.", next = "peon2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peon2 = {
      lines = { { id = "pe2_default", text = "I heard him say it, in Orgrimmar, from the back of a very large crowd. A backbone doesn't get looked at much, but everything falls down without one, so I thought it was a fair thing to be called." } },
      choices = { { text = "It was. Something else, Ukor.", next = "BACK", fx = { affinity = 1 } } },
    },
    thazzril = {
      lines = { { id = "th_default", text = "The foreman in the valley isn't mine, thank the spirits, because I hear he carries a blackjack. I work out of Razor Hill, hauling for whoever needs it, and nobody there will have noticed I'm gone unless a cart wants unloading." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heal = {
      lines = { { id = "he_default", text = "You'd spend that on a peon? It's kindly meant, but there's nothing wrong with me that a night's sleep and an empty back wouldn't mend. Save it for the recruits, who'll be coming back from that cave with worse." } },
      choices = { { text = "As you wish. Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    grunt = {
      lines = { { id = "gr_default", text = "I tried, when we first landed. I can lift more than most, but I've never been able to make myself want to hit anybody, and the sergeant said that was a difficulty in a soldier. So I carry things for the ones who can." } },
      choices = { { text = "The Horde needs both kinds. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a peon out of Razor Hill, and I've hauled timber and stone for the Horde since we came ashore. There isn't more to tell than that." } },
    advice = { { id = "tp_ad", text = "Rest before you're tired, and not after. I learned that today, on this rock." } },
    thrall = { { id = "tp_thrall", text = "The Warchief let every one of us walk out of the camps, peons too. Nobody had to carry me through that gate, and I'll carry what he asks for the rest of my days." } },
    internment = { { id = "tp_internment", text = "I don't remember the camps well, only sitting. I've not liked sitting since, which is a strange thing for me to say just now." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that, friend. I only carry things." } },
  },
}

---------------------------------------------------------------------------
-- Ruzan: the warlock who sets the Valley's young warlocks on the vile familiars.
---------------------------------------------------------------------------
P:NPC {
  key = "ruzan", id = TODO_NPC("Ruzan"), name = "Ruzan",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "wary", "exacting" }, values = { "cunning", "loyal" },
  notices = { "class", "fel" },
  impression = {
    first = "Ruzan waits behind the Den for the recruits nobody else wants to teach. He tests young warlocks on the Burning Blade's own familiars, and he watches how they take to it more closely than whether they succeed.",
    third = "{name} met Ruzan, an orc warlock in the Valley of Trials who tests new warlocks against the Burning Blade's vile familiars.",
  },
  greetings = {
    { id = "g_default", text = "You've come round the back of the Den, where the grunts prefer not to look. Either you are lost, or you were sent." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "I know that look. You've heard something whispering at the edge of your thoughts, and you came to find out what it wants." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Speak plainly, and keep your voice low while you do it." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, standing as far from me as good manners allow. Tell Shikrik I've not soured her valley yet." },
    { id = "n_imp", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is watching me and not you. Correct that, or it will learn that your attention can be stolen." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ruzan. Nartok teaches the craft and I decide who is fit to be taught it, which is the less popular half of the work." },
        { id = "h_before", when = { all = { { class = "WARLOCK" }, { questBefore = TODO_QUEST("Vile Familiars") } } },
          text = "There is a cave above this valley full of Burning Blade cultists and the imps they call vile familiars. Before you command a demon of your own, I want to see you kill a dozen that answer to someone else." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vile Familiars") },
          text = "The familiars cluster outside the Burning Blade Coven, north and west along the valley wall. Bring me their heads, and do not linger to listen to anything they say." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vile Familiars"), days = 3 } },
          text = "You brought the heads, and you did not come back boasting. Good. The imp you were given will test you every day, and now you know what one looks like with its neck open." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Vile Familiars"), days = 7 } },
          text = "You have kept the imp and kept your wits, which is more than one or two before you managed. Dhugru Gorelust in Razor Hill will take you further when you're ready." },
        { id = "h_other", when = { ["not"] = { class = "WARLOCK" } }, text = "I am Ruzan. I've no lessons for you, but I'll answer a question, since so few here will ask me one." },
      },
      again = {
        { id = "h_again", text = "Go on. I've no line of students waiting, as you can see." },
        { id = "h_again2", text = "Ask, then, and I'll tell you what is safe for you to know." },
        { id = "h_again3", text = "Something else troubles you. Out with it." },
      },
      choices = {
        { text = "Why test warlocks against imps, of all things?", next = "test" },
        { text = "The Burning Blade were warlocks like you once.", next = "blade" },
        { text = "They keep you and Nartok out of sight back here.", next = "hidden" },
        { text = "What becomes of the ones who fail your test?", next = "fail" },
        { text = "I felt the pull you spoke of. It wants something. What?", next = "pull", when = { class = "WARLOCK" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "I'll leave you to your shadows.", next = "END" },
      },
    },
    test = {
      lines = { { id = "te_default", text = "Because an imp is the first thing every one of them will summon, and I want them to have seen its insides first. A recruit who has cut twelve of the creatures apart is a great deal harder for one to flatter." } },
      choices = {
        { text = "The imps flatter their masters?", next = "test2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test2 = {
      lines = { { id = "te2_default", text = "Constantly. They call you master, they grovel, they tell you how much greater you could be, and all the while they are measuring the leash. It is the smallest demon there is, and it has undone orcs who stood through whole wars." } },
      choices = {
        { text = "So the lesson is contempt.", next = "test3" },
        { text = "Something else, Ruzan.", next = "BACK" },
      },
    },
    test3 = {
      big = true,
      lines = { { id = "te3_default", text = "The lesson is that a demon is a tool that hates you, and must be held like one. Contempt will do for a beginning, and if you ever find it has turned to fondness, come and tell me before you tell anyone else." } },
      choices = {
        { text = "A tool is all it will ever be to me.", next = "BACK", reply = "Say that again in a year, when it has saved your life twice. If you still mean it, you'll do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A servant treated well serves better than one despised.", next = "BACK", reply = "That is true of wolves and peons. It was the first thing the Shadow Council believed about demons, and the last.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "bl_default", text = "Some of them sat where my students sit. The Burning Blade does not recruit strangers; it recruits the ones we turned away and the ones who thought we taught too slowly, and that is why the Coven is a warlock's business before it is anyone's." } },
      choices = {
        { text = "Then cleaning it out is your people's duty.", next = "BACK", reply = "It is, and I send every student I have against it. We made this sickness once, and we'll be seen to cut it out.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Their only mistake was choosing the wrong master.", next = "BACK", reply = "Their mistake was choosing a master at all. Mind that you remember which of us said so.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    hidden = {
      lines = { { id = "hi_default", text = "Gornek asked it of us, politely, and I thought it a fair request. The young warriors train out front where everyone can cheer them, and we train round the back where nobody need be reminded what our kind did to the clans." } },
      choices = {
        { text = "Does it gall you?", next = "hidden2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hidden2 = {
      lines = { { id = "hi2_default", text = "Less than you'd think. Zureetha Fargaze sends her recruits to the same cave I send mine, and when they come back she nods to me across the yard. From a far seer's kin, that nod is worth a good deal." } },
      choices = { { text = "Something else, Ruzan.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "fa_default", text = "Most simply lack the stomach, and I send them to Frang to learn the axe, with no mark against them. The ones who worry me are those who enjoy it too much, and those I keep close, where Nartok and I can both watch them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pull = {
      lines = { { id = "pu_default", text = "It is the same hunger that every orc of the old Horde felt, and you were born with an ear for it. I cannot take it from you. I can only teach you to answer it on your own terms, which is the whole difference between a warlock of the Horde and a cultist in a cave." } },
      choices = { { text = "On my terms, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned this craft in the old Horde, from teachers I am glad are dead. What I do with it now is my answer to them." } },
    advice = { { id = "tp_ad", text = "When something offers you power for nothing, ask what it is being paid by. There is always a price, and it is rarely the one named." } },
    burning_blade = { { id = "tp_blade", text = "Yarrog Baneshadow leads the ones in the cave above us. He was no student of mine, and I count that among my few comforts." } },
    thrall = { { id = "tp_thrall", text = "The Warchief could have had every warlock in the Horde put to the axe, and many urged it. He chose to watch us. I intend to be worth the watching." } },
    burning_legion = { { id = "tp_legion", text = "We drank their blood and called it strength. If you remember only one thing I say, let it be that." } },
    _none = { { id = "tp_none", text = "That is outside my study, and I do not guess aloud." } },
  },
}

---------------------------------------------------------------------------
-- Nartok: warlock trainer behind the Den.
---------------------------------------------------------------------------
P:NPC {
  key = "nartok", id = TODO_NPC("Nartok"), name = "Nartok", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "dry", "patient" }, values = { "craft", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "Nartok teaches the Valley's few warlocks behind the Den, in a voice so even it is hard to tell when he is joking. He treats shadow magic like a trade with rules, and the rules like the only thing between a student and a bad end.",
    third = "{name} met Nartok, the orc who trains new warlocks behind the Den in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Mind the circle on the ground, if you would. It's only chalk, but I spent the morning on it." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You're the new student, then. Stand outside the circle until I say otherwise, and we'll get along well." },
    { id = "g_orclock", when = { race = "Orc", class = "WARLOCK" }, text = "Another young orc who wants the old fire. Stand outside the circle and keep your hands where I can see them, and we'll start from there." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and nothing has followed you, which is always a good start." },
    { id = "g_away", when = { away = 14 }, text = "You've been away some weeks, by my count. I trust you kept your circles closed wherever you were." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You're a mage, and Mai'ah's student, I expect. She and I disagree about nearly everything except the importance of clean diagrams." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You're one of Frang's warriors. You may look all you like, but please don't touch anything that's glowing." },
    { id = "n_imp", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is counting my candles. It does that when it's deciding which one to knock over, so give it something better to do." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 20 } },
      text = "There's a smell on you like struck flint, faint but there. Whatever you've been drawing on lately, you've been drawing on it harder than a student should." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nartok, and I teach the first steps of the warlock's craft to those Ruzan judges fit for it. It is slow, careful work, and the slow and careful are the ones who live to grow old in it." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I am Nartok, and I'll be your teacher while you're in this valley. Whatever you've heard about warlocks, forget the half of it that sounded exciting, because that's the half that buries people." },
        { id = "h_orclock", when = { race = "Orc", class = "WARLOCK", maxLevel = 9 }, text = "I am Nartok. You're an orc, so you know what this craft cost our people before you were weaned, and I won't pretend otherwise. Learn it anyway, and learn it so carefully that nobody can ever lay that cost at your feet." },
        { id = "h_void", when = { class = "WARLOCK", minLevel = 10, maxLevel = 11 }, text = "You're ready for more than an imp, and I've nothing more to give you in this valley. Ophek waits in Razor Hill for students like you, and he'll send you on to Gan'rul Bloodeye in the Cleft of Shadow." },
        { id = "h_grown", when = { class = "WARLOCK", minLevel = 12 }, text = "You've outgrown what I teach here, and I'm pleased to see you alive to prove it. Dhugru Gorelust in Razor Hill should have you now, so come back only to visit." },
      },
      again = {
        { id = "h_again", text = "Yes? I've chalk drying, but it can dry without me watching it." },
        { id = "h_again2", text = "Ask, then. A question costs less than a mistake, and I've paid for enough mistakes to know the rates." },
        { id = "h_again3", text = "You're still curious, and I approve of that in moderation." },
      },
      choices = {
        { text = "Teach me, Nartok. I won't flinch.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My imp mocks every spell I cast.", next = "imp", when = { class = "WARLOCK", pet = { family = "Imp" } } },
        { text = "What comes after the imp?", next = "after", when = { class = "WARLOCK" } },
        { text = "What does a warlock learn first?", next = "first" },
        { text = "You make it sound like bookkeeping.", next = "trade" },
        { text = "Ruzan chooses and you teach. Why split it?", next = "ruzan" },
        { text = "Hraug handles the demons themselves, I hear.", next = "hraug" },
        { text = "There's a cave full of cultists right up the valley.", next = "coven" },
        { text = "You're old enough to remember the old Horde.", next = "war" },
        { text = "The spirits must hate what you do here.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Farewell, Nartok.", next = "END" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "To draw a circle that closes. It sounds a small thing, and every student is insulted by it, and then I show them the scorch on the Den's back wall where a student before them left a gap the width of a finger." } },
      choices = {
        { text = "What came through the gap?", next = "first2" },
        { text = "Back to the other questions, then.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "fi2_default", text = "Only an imp, and only for a moment, but it set fire to his robe and my notes before Hraug put it down. He draws excellent circles now, and I'm told he draws them in his sleep." } },
      choices = {
        { text = "What do I do if mine ever breaks?", next = "first3", when = { class = "WARLOCK" } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    first3 = {
      narr = "He crouches and runs a thick thumb around the chalk ring, slowly, feeling for a gap.",
      lines = { { id = "fi3_default", text = "You end the summoning before you do anything else, before you shout and before you run. A demon outside the circle is still bound to your word for a breath or two, and the warlocks who die are the ones who spend that breath being frightened." } },
      choices = {
        { text = "Banish first, and be frightened afterward.", next = "BACK", reply = "Afterward, and somewhere private. The imp enjoys watching you shake almost as much as it enjoys fire." },
        { text = "Something else, Nartok.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "It is bookkeeping. Every spell is a debt and every demon keeps a ledger, and the warlocks who came to grief in the old Horde were the ones who stopped reading what they'd signed. I teach my students to count before I teach them to curse." } },
      choices = {
        { text = "What does a warlock count, exactly?", next = "trade_count", when = { class = "WARLOCK" } },
        { text = "And when the price is worth paying?", next = "trade2" },
        { text = "Let's leave the ledger for now.", next = "BACK" },
      },
    },
    trade_count = {
      lines = { { id = "tc_default", text = "Soul shards, first of all. Whatever you kill with Drain Soul on it hardens into a shard in your pack, and every great working you'll ever do spends one, so a warlock who wastes them comes up short at the worst moment. After that you count your own blood, because Life Tap pays you in mana straight out of your veins." } },
      choices = {
        { text = "Shards and blood. I'll keep the ledger.", next = "BACK", reply = "Keep it honestly, too. The imp keeps its own, and it never rounds in your favour." },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    trade2 = {
      big = true,
      lines = { { id = "tr2_default", text = "Then you pay it, knowingly, and you don't complain. I've spent years of my own life on a single casting to hold a line, and I would again, but I won't let a student spend what he hasn't counted." } },
      choices = {
        { text = "Counted sacrifice for the Horde is a worthy thing.", next = "BACK", reply = "It's the only kind I respect. Keep counting, and you may make one of your own someday.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to make someone else pay the price.", next = "BACK", reply = "That can be arranged, and often is, but it goes into the ledger all the same, under your name.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    ruzan = {
      lines = { { id = "ru_default", text = "Because a teacher grows fond of his students, and a fond teacher makes excuses. Ruzan has no students and therefore no excuses, so he does the judging, and I'm spared having to turn away someone I've come to like." } },
      choices = {
        { text = "How does he test them?", next = "ruzan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruzan2 = {
      lines = { { id = "ru2_default", text = "With vile familiars, a dozen of them, out among the rocks by the Burning Blade Coven. They're little fire-things the cult lets loose, and a student who can kill twelve without losing his nerve or his eyebrows has earned the imp I'll teach him to call." } },
      choices = {
        { text = "He chose me. I'm told that's rare.", next = "BACK", when = { class = "WARLOCK" }, reply = "It isn't rare, but it isn't nothing either. He's turned away orcs twice your size for laughing at the wrong moment." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hraug = {
      lines = { { id = "hr_default", text = "He does. I teach the summoning and Hraug teaches what to do with the thing once it has arrived, which is the more dangerous lesson. He has the scars and the temper for it, and I have neither." } },
      choices = {
        { text = "Is he as fierce as he looks?", next = "hraug2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hraug2 = {
      lines = { { id = "hr2_default", text = "Fiercer, but only with carelessness. He'll roar at a student for leaving a grimoire open and then sit up half the night redrawing that student's circle so it holds, and you're not to tell him I said so, because he has a name to keep up." } },
      choices = { { text = "Your secret is safe. Back to the lessons.", next = "BACK" } },
    },
    imp = {
      lines = { { id = "im_default", text = "It mocks you because mockery is all it has left, and because it wants you to answer. Don't. Give it a target instead, a familiar or a cultist, and let its Firebolt do the talking." } },
      choices = {
        { text = "It called me a fleshy disappointment.", next = "imp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    imp2 = {
      big = true,
      lines = { { id = "im2_default", text = "That's one of its kinder names, and you should hear what it calls me. Still, every warlock has to decide early how he'll stand with the thing at his heel, so tell me which it is for you." } },
      choices = {
        { text = "It obeys, or it goes back to the fire.", next = "BACK", reply = "Plain and enforceable, which is how I like my rules. It will test that, so be ready to keep your word.", fx = { align = { order = 1 } } },
        { text = "Let it chatter all it likes, as long as it fights.", next = "BACK", reply = "Generous of you, and not foolish, provided you notice the day the chatter turns into advice.", fx = { align = { order = -1 } } },
        { text = "I haven't decided yet.", next = "BACK", reply = "Then decide before it decides for you. They're very patient about that sort of thing." },
      },
    },
    after = {
      lines = { { id = "af_default", text = "The voidwalker, once you're strong enough to stand behind something, which for most students is around their tenth season of blooding. Ophek waits in Razor Hill for my students, and he'll send you on to Gan'rul Bloodeye in the Cleft of Shadow, who will make you earn it." } },
      choices = {
        { text = "What is a voidwalker like?", next = "after2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    after2 = {
      lines = { { id = "af2_default", text = "Quiet, which frightens students more than the imp's chatter ever did. It takes the blows meant for you and asks for nothing in return, and you must never mistake that for loyalty, because it's only waiting." } },
      choices = {
        { text = "And after the voidwalker?", next = "after3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after3 = {
      lines = { { id = "af3_default", text = "The succubus, then the felhunter, and beyond them things I've only read about, the burning stone that calls down an infernal and the rite that drags a doomguard out of the Nether. I teach none of that here, and I'm glad of it, because a student who dreams of doomguards on his first day rarely lives to need one." } },
      choices = { { text = "One step at a time, then.", next = "BACK", reply = "One step, and look down before you take it." } },
    },
    coven = {
      lines = { { id = "co_default", text = "There is, and it's the first thing every new warlock in this valley sees when he looks north, which I don't think is an accident. Yarrog Baneshadow sits in that cave with his Burning Blade and tells young orcs that the demons were never our masters, only our friends." } },
      choices = {
        { text = "Do they ever take your students?", next = "coven2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coven2 = {
      big = true,
      lines = { { id = "co2_default", text = "They've tried, and once they very nearly managed it, with a student who had more talent than patience and more anger than either. Zureetha Fargaze sends recruits in to take Yarrog's medallion, and I'm never sorry to hear of it." } },
      choices = {
        { text = "The Blade should be burned out of Durotar.", next = "BACK", reply = "Gar'Thok would agree, and so would Orgnil in Razor Hill. Just remember that every one you burn was somebody's student once.", fx = { align = { order = 1 } } },
        { text = "Some of them only wanted a place to belong.", next = "BACK", reply = "Most of them, I'd say, which is why I make sure mine already have one. A warlock with a place in the Horde has no reason to go looking in caves.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "I am, though I was young then and fought with an axe, not with this. I saw the death knights ride out of the Shadow Council's towers, orc warlocks' spirits stuffed into human corpses, and that is why I am so particular about chalk." } },
      choices = {
        { text = "What was the Shadow Council?", next = "war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war2 = {
      narr = "He wipes the chalk from his fingers onto his robe, slowly, one finger at a time.",
      lines = { { id = "wa2_default", text = "Gul'dan's warlocks, who ruled the Horde from behind the chieftains and sold it to the demons a little at a time. They taught that the price could always be paid later, by someone else, and every orc in the internment camps was that someone else." } },
      choices = {
        { text = "My parents paid it in the camps.", next = "BACK", when = { race = "Orc" }, reply = "Then you know the ledger better than I could teach it. Make sure your own column stays clean." },
        { text = "And now Thrall watches you instead.", next = "war3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war3 = {
      lines = { { id = "wa3_default", text = "He does, and I'm glad of it. The Warchief is a shaman and could have driven every one of us into the sea, and instead he lets us teach where his grunts can see us, so I give him nothing to regret." } },
      choices = { { text = "Let's talk about something lighter.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They do, and I don't ask them to feel otherwise. Shikrik and I keep to opposite ends of the valley by agreement, and when the wind turns sour near my circle I take it as fair comment and move the lesson downwind." } },
      choices = {
        { text = "At least you have the grace to yield to them.", next = "BACK", reply = "It costs me nothing but a walk. Tell Shikrik I said so, if you think it would please her.", fx = { align = { order = 1 } } },
        { text = "You shouldn't be teaching here at all.", next = "BACK", reply = "The Warchief disagrees, and his is the opinion that keeps me breathing. You're welcome to yours.", fx = { align = { order = -1 } } },
        { text = "Let's leave the spirits out of it.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Read what you sign, and close what you open. Nearly every warlock's grave has one of those two written over it." } },
    burning_legion = { { id = "tp_legion", text = "The Legion is a creditor that never forgives a debt, and we're still paying on the first one." } },
    burning_blade = { { id = "tp_blade", text = "They're poor craftsmen, for the most part. Their circles are sloppy, and it's their masters who profit from that, not they." } },
    thrall = { { id = "tp_thrall", text = "The Warchief permits us and watches us. I've always found I work more carefully when I'm watched." } },
    second_war = { { id = "tp_second_war", text = "I was a young orc in that war and saw what the death knights were made from. It's why I insist on the chalk." } },
    _none = { { id = "tp_none", text = "I haven't studied that, and I don't teach what I haven't studied." } },
  },
}

---------------------------------------------------------------------------
-- Jen'shan: Darkspear hunter trainer in the Den.
---------------------------------------------------------------------------
P:NPC {
  key = "jenshan", id = TODO_NPC("Jen'shan"), name = "Jen'shan", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "easy", "sharp" }, values = { "craft", "patient" },
  notices = { "class", "pet" },
  impression = {
    first = "Jen'shan teaches the Valley's young hunters to shoot, and she is in no hurry about it. She laughs easily and misses nothing, and she seems to think patience is something you can be taught like a knot.",
    third = "{name} met Jen'shan, the Darkspear troll who trains hunters in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Easy now, mon, you walk so loud de boars heard you from Razor Hill. Come in, come in." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Dere be a hunter's eyes on you, young one. Let us see if dere be a hunter's hands to go with dem." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and you walk quieter dis time. Somebody been practisin'." },
    { id = "g_away", when = { away = 14 }, text = "Long time, mon! You been out past where I can track you, and you came back. Sit and tell me what you hunted." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Dat be a fine beast at your heel. {pet} watches de door while you talk, and dat means you raised it right." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear in de orcs' valley, same as me. Don't let dem tell you a bow be a coward's weapon, mon, we been eatin' by it since before dey had a Horde." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Jen'shan, and I teach de young ones of dis valley to hunt. De orcs teach how to charge, and I teach how to wait, and between us a recruit learns both." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I be Jen'shan, and you be mine to teach while you be in dis valley. First lesson be free, mon: de arrow you don't loose never misses." },
        { id = "h_orc", when = { race = "Orc", class = "HUNTER" }, text = "I be Jen'shan, and yes, young orc, a troll will be teachin' you. You will lie in de dust and wait, and you will hate it, and one day you thank me." },
      },
      again = {
        { id = "h_again", text = "What else, young one? I got all day, and so does de boar." },
        { id = "h_again2", text = "Go on, mon, ask. Waitin' be what I'm good at." },
        { id = "h_again3", text = "Still here? Good, a hunter should be hard to get rid of." },
      },
      choices = {
        { text = "Teach me, Jen'shan.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Walk me down the hunter's road, Jen'shan.", next = "h_road", when = { class = "HUNTER" } },
        { text = "What do you make of the game in this valley?", next = "game" },
        { text = "A troll teaching orcs to hunt must take patience.", next = "orcs" },
        { text = "When does a young hunter earn a beast?", next = "beast" },
        { text = "Hana'zua lies wounded outside. He was yours?", next = "hanazua" },
        { text = "I'd rather meet my enemy up close.", next = "close", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Good hunting, Jen'shan.", next = "END" },
      },
    },
    game = {
      lines = { { id = "ga_default", text = "Poor, but good for learnin'. De mottled boar be slow and loud and forgives a bad shot, and de scorpid be low and quick and forgives nothin'. A recruit who can take both clean be ready for de road to Razor Hill." } },
      choices = {
        { text = "And what waits past Razor Hill?", next = "game2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game2 = {
      lines = { { id = "ga2_default", text = "Crocolisks in de Southfury, and raptors and plainstriders and great cats in de Barrens beyond. Thotar in Razor Hill takes my students from here, and he sends me word of how dey did, so shoot well, mon, or I hear about it." } },
      choices = { { text = "Something else, Jen'shan.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Ha! More dan you know. An orc child be raised on stories of Grom chargin' de demon, and den I tell him to lie in de dust for an hour and not move. Half of dem think I be punishin' dem." } },
      choices = {
        { text = "How do you bring them round?", next = "orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      big = true,
      lines = { { id = "or2_default", text = "I take dem out hungry, mon, and I let dem charge. De boar runs, and dey come back with nothin', and den I go out alone and come back with supper. After dat dey lie in de dust as long as I say." } },
      choices = {
        { text = "Hunger teaches patience better than any lecture.", next = "BACK", reply = "It taught me, on de islands, when I was smaller dan my bow. Some lessons only go in through de belly.", fx = { align = { order = 1 } } },
        { text = "A charge has its place. Don't train it out of them.", next = "BACK", reply = "It does, and Frang can have dem for dat. But not in my hunt, mon, not while I be de one feedin' dem.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast = {
      lines = {
        { id = "be_default", text = "Not in dis valley, and dat disappoints every one of dem. A beast be a bond for life, mon, and I won't have a child make it before he can feed himself. When dey be ready, Thotar sends dem out to tame one proper, and de beast decides if dey were ready after all." },
        { id = "be_pet", when = { pet = { type = "Beast" } }, text = "Not in dis valley, mon, but I see you got past dat long ago. {pet} chose you as much as you chose it, and you be wise never to forget which of you did de choosin' first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hanazua = {
      lines = { { id = "ha_default", text = "He was, and he will be again if de loa are kind. I told him to watch de tail and he watched de claw, and Sarkoth taught de rest of de lesson better dan I could. I bring him water at night, mon, but don't tell him I worry." } },
      choices = { { text = "I won't say a word. Something else.", next = "BACK" } },
    },
    h_road = {
      hub = true,
      lines = {
        { id = "hr_default", text = "De hunter's road, mon, starts right here in de dust, with a bow you can barely pull and a beast you don't have yet. I can walk you the first stretch of it, and then Thotar takes the next, and after that the road be yours." },
        { id = "hr_note", when = { questActive = TODO_QUEST("Etched Parchment") }, text = "You read de parchment I left for you, so you already know de first lesson: a hunter goes lookin' for what she needs. The rest of the road starts here, mon, so sit." },
        { id = "hr_ten", when = { minLevel = 10 }, text = "You be past my stretch of de road already, mon, and I can see de next one on you. Still, sit and tell me what you learned, because a teacher likes to hear she got somethin' right." },
      },
      again = {
        { id = "hr_again", text = "What else, young one? De road be long, but we be in no hurry." },
        { id = "hr_again2", text = "Go on, ask. I answer slow, like a good shot." },
      },
      choices = {
        { text = "Why do you teach the stings so early?", next = "jr_sting" },
        { text = "The monkey aspect makes me feel foolish.", next = "jr_monkey" },
        { text = "What happens when I'm ready for a beast?", next = "jr_next" },
        { text = "You learned on the Echo Isles. Tell me of them.", next = "jr_isles", when = { race = "Troll" } },
        { text = "Orcs don't lie in the dust. We charge.", next = "orcs", when = { race = "Orc" } },
        { text = "Enough of the road, Jen'shan.", next = "BACK" },
      },
    },
    jr_sting = {
      lines = { { id = "jrs_default", text = "Because you be small and alone, mon, and de scorpid be neither. Put de serpent's poison in it and step back, and let it chase you while it dies, and you learn the first truth of the hunt: the wound does the work, and the hunter only has to stay alive." } },
      choices = {
        { text = "That seems a slow way to kill.", next = "jr_sting2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    jr_sting2 = {
      big = true,
      lines = { { id = "jrs2_default", text = "Slow be de point, young one. On de islands we hunted with poisoned darts long before any of us saw a bow, and nobody went hungry for bein' patient. The orcs call it sly, and the orcs eat what we bring back." } },
      choices = {
        { text = "Sly or not, the hunter who lives is right.", next = "h_road", reply = "Ha! Now you talk like a Darkspear, mon. Stay alive, and let de poison argue.", fx = { align = { honor = -1 } } },
        { text = "I'd still rather face the beast and end it clean.", next = "h_road", reply = "Den learn to shoot clean, and use de sting when you can't. A good hunter keeps both in her quiver.", fx = { align = { honor = 1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    jr_monkey = {
      narr = "She grins, drops into a crouch and sways on her heels, quick as a lizard, without her hands leaving her knees.",
      lines = { { id = "jrm_default", text = "It should, mon, and dat be how you know it be workin'. De monkey don't stand and take a blow, he be somewhere else when it lands. Later you learn the hawk for shootin' and the cheetah for runnin', and you feel foolish in all of them, until a raptor misses you." } },
      choices = {
        { text = "I'll wear the foolish face, then. Back to the road.", next = "h_road", fx = { trait = { witty = 1 } } },
      },
    },
    jr_next = {
      lines = {
        { id = "jrn_default", text = "When you be ten seasons strong, I send you up to Thotar in Razor Hill with word dat you be ready. He gives you a rod and sends you after a boar and a crab and a scorpid, and you tame each one and let each one go, and only den do you choose." },
        { id = "jrn_path", when = { questActive = TODO_QUEST("The Hunter's Path") }, text = "Now, mon, dat be why I sent you on de hunter's path. Go up to Thotar in Razor Hill, and he puts a taming rod in your hand, and the valley will be very quiet without you." },
      },
      choices = {
        { text = "Why tame them only to let them go?", next = "jr_next2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    jr_next2 = {
      lines = { { id = "jrn2_default", text = "Because de first beast you ever bind be not de best one, only the nearest. Thotar wants your hands to learn the binding before your heart picks a friend, and I want the same, so when you find the beast that looks back at you, you be ready for it." } },
      choices = {
        { text = "That's wise. Back to the road.", next = "h_road", fx = { affinity = 1 } },
      },
    },
    jr_isles = {
      lines = { { id = "jri_default", text = "Tigers in de long grass and raptors on de ridges, and the sea so loud you hunt by your eyes and never your ears. Zalazane holds the isles now with his hexed ones, and every Darkspear hunter in this valley be keepin' one good arrow for the day Vol'jin says we go home." } },
      choices = {
        { text = "When that day comes, I'll be there with my bow.", next = "jr_isles2" },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    jr_isles2 = {
      big = true,
      lines = { { id = "jri2_default", text = "Dat be a fine promise, mon, and I hear it from every young Darkspear. De hard part be keepin' it while the Horde asks you to fight everywhere else first. What do you owe more, the isles or the Warchief who gave us this land?" } },
      choices = {
        { text = "The isles. They're our home, whatever the Horde needs.", next = "h_road", reply = "Spoken like your grandmother, young one. Keep dat arrow, den, and keep it sharp.", fx = { align = { order = -1 } } },
        { text = "The Warchief. Vol'jin gave our word, and we keep it.", next = "h_road", reply = "Vol'jin would like to hear dat, and so would Thrall. De isles will wait, mon, they be good at it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Back to the road.", next = "h_road" },
      },
    },
    close = {
      lines = { { id = "cl_default", text = "Den meet dem up close, mon, and I will put an arrow in de one comin' up behind you. Dat be how de Horde hunts now, orc in front and troll at de back, and it has worked from Hyjal to here." } },
      choices = { { text = "A fair bargain. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Watch de tail and not de claw, mon, and dat be true of more dan scorpids." } },
    quilboar = { { id = "tp_quilboar", text = "De Razormane track by smell, and dey be good at it. Hunt dem from downwind or don't hunt dem at all." } },
    echo_isles = { { id = "tp_isles", text = "I learned to shoot on de Echo Isles, at tigers, and de tigers be still dere. So be Zalazane, and I be savin' an arrow." } },
    darkspear = { { id = "tp_darkspear", text = "We be few, mon, so every Darkspear child learns to hunt. A tribe dat cannot feed itself be a tribe waitin' to be eaten." } },
    thrall = { { id = "tp_thrall", text = "De Warchief asked Vol'jin for trolls to teach in his valley, and Vol'jin sent me. I take dat as a compliment from both of dem." } },
    _none = { { id = "tp_none", text = "Dat I never tracked, mon, so I can't tell you where it goes." } },
  },
}

---------------------------------------------------------------------------
-- Mai'ah: Darkspear mage trainer in the Den.
---------------------------------------------------------------------------
P:NPC {
  key = "maiah", id = TODO_NPC("Mai'ah"), name = "Mai'ah", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "bright", "proud" }, values = { "curious", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Mai'ah teaches the arcane in a valley full of orcs who would rather not think about it. She is quick and proud of her craft, and she talks about fire the way other trolls talk about the loa.",
    third = "{name} met Mai'ah, the Darkspear mage who trains young spellcasters in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Come closer, mon, I don't singe anybody on purpose. You got de look of somebody with a question." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Dere you are! I felt you comin' up de path, young one, you leak power like a cracked gourd. We fix dat first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and your eyebrows be still on. Den you been careful, and I be pleased." },
    { id = "g_away", when = { away = 14 }, text = "You been gone a long while, mon, and you come back with more power on you dan you left with. Somebody else been teachin' you, and I be only a little jealous." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! De orcs here got no mages of deir own to speak of, mon, so de teachin' falls to us, and we do it better anyway." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You be one of Nartok's. He and I agree on clean diagrams and on nothin' else, so don't tell him I was friendly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Mai'ah, and I teach de arcane to de few in dis valley with de head for it. De orcs don't trust magic dat don't come from a spirit, mon, so I be patient with dem and dey be polite with me." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I be Mai'ah, and you be my student while you train here. Fire first, den frost, and de arcane last, because dat one bites de hand if you grab it too young." },
        { id = "h_grown", when = { class = "MAGE", minLevel = 12 }, text = "You be past my lessons now, young one. Go see Un'Thuwa at Sen'jin, or de mages in Orgrimmar's Valley of Spirits, and tell dem Mai'ah taught you fire." },
      },
      again = {
        { id = "h_again", text = "What more, mon? Ask, I like de ones who ask." },
        { id = "h_again2", text = "Go on. De spell I was workin' can wait, it be half wrong anyway." },
        { id = "h_again3", text = "Another question! Good, good, a quiet student learns nothin'." },
      },
      choices = {
        { text = "Teach me, Mai'ah.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Where does a Darkspear learn the arcane?", next = "learn" },
        { text = "The orcs here seem wary of what you do.", next = "orcs" },
        { text = "Fire first, you said. Why fire?", next = "fire" },
        { text = "Un'Thuwa teaches magic at Sen'jin as well.", next = "unthuwa" },
        { text = "The Forsaken have fine mages. Have you met any?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Farewell, Mai'ah.", next = "END" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "From de witch doctors, at first, who knew more of it dan dey let on. Den de Darkspear sailed with de Horde, and I sat at de back of every camp where anybody was castin', mon, and I watched deir hands." } },
      choices = {
        { text = "Nobody taught you properly?", next = "learn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn2 = {
      lines = { { id = "le2_default", text = "Not till Orgrimmar, when de Warchief gave de mages a place in de Valley of Spirits and somebody finally put a book in my hands. I read it in a night, and I found I had been doin' half of it backwards and it worked anyway." } },
      choices = { { text = "Something else, Mai'ah.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Dey are, and I don't blame dem. De last orcs who went lookin' for power outside de spirits were warlocks, and dey nearly ended de whole people. When a grunt sees me light a fire with my fingers, he don't see a mage, he sees his grandfather's mistake." } },
      choices = {
        { text = "How do you answer that?", next = "orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs2 = {
      big = true,
      lines = { { id = "or2_default", text = "I don't argue, mon, I just keep bein' useful. I conjure de water when de carts be late, and I light Galgar's fire when de wood be wet, and every season one more grunt forgets to scowl at me." } },
      choices = {
        { text = "Patience and service win more trust than words.", next = "BACK", reply = "Dat be how de Darkspear won a place in de Horde to begin with. It be slow, but it holds.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You owe them no proof. Let them fear you.", next = "BACK", reply = "Fear be quick to get and costly to keep, mon. I seen what happens to a tribe dat everybody fears.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = { { id = "fr_default", text = "Because fire tells you right away when you be wrong, mon. A bad frost spell just fizzles, and a bad arcane spell waits and gets you later, but fire burns your fingers on de spot, and a burned student be a careful student." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    unthuwa = {
      lines = { { id = "un_default", text = "He does, for de ones who come up through Sen'jin, and he be de better scholar of us two. I be de better teacher, and he would tell you so himself if you caught him in a good mood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "A few, in Orgrimmar. Dey learned in Dalaran before dey died, some of dem, and dey know things I would give a tusk for. Dey also look at me like I be a child playin' with matches, so we don't talk long." } },
      choices = { { text = "We do tend to look at people that way. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Cast de small spell twice before you try de big one once, mon. De big one don't forgive." } },
    darkspear = { { id = "tp_darkspear", text = "We always had our own magic, older dan any book. I just went and learned de other kind too." } },
    echo_isles = { { id = "tp_isles", text = "Zalazane had de gift too, mon, and nobody taught him where to stop. I think of dat every time a student asks me for more dan dey be ready for." } },
    thrall = { { id = "tp_thrall", text = "De Warchief be a shaman, and still he made room for mages in his city. A leader who makes room for what he don't use himself be a rare one." } },
    dalaran = { { id = "tp_dalaran", text = "De human mages' city, under a dome now, dey say. I would like to see inside deir library once, and I know dat I never will." } },
    _none = { { id = "tp_none", text = "Dat be outside what I studied, mon, and I don't pretend." } },
  },
}

---------------------------------------------------------------------------
-- Rwag: rogue trainer in the Den.
---------------------------------------------------------------------------
P:NPC {
  key = "rwag", id = TODO_NPC("Rwag"), name = "Rwag", title = "Rogue Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "wry", "watchful" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Rwag teaches the Den's young rogues from the darkest corner he can find, and he seems to know where everyone in the room is standing. He calls what he does scouting, and he smiles a little when he says it.",
    third = "{name} met Rwag, the orc who trains rogues in the shadows of the Den in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "You looked at this corner twice before you saw me. That's better than most, and I'll take it as a greeting." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Your left boot scuffs when you turn. We'll mend that before it gets you killed, recruit." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You came in quieter this time, though I still heard you at the door." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone long enough that I'd stopped listening for your step. It's changed, and for the better." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Not bad, but you're breathing through your mouth, and I could find you by it in the dark. Step out, there's no shame in being caught by your teacher." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "One of Frang's, by the noise. Don't worry, I've nothing against your kind; somebody has to hold their attention while we work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Rwag, and I teach the ones who'd rather not be seen. The Horde has always had its scouts and its knives in the dark, and it's better they learn the work from me than from the wrong sort of friend." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "I'm Rwag, and while you're in this valley you'll learn from me. Forget what the grunts say about honor needing an audience, because the Warchief has uses for an orc nobody saw arrive." },
        { id = "h_grown", when = { class = "ROGUE", minLevel = 12 }, text = "You've gone past what I teach in this corner. Kaplak in Razor Hill will have more for you, and tell him Rwag says your left boot is cured." },
      },
      again = {
        { id = "h_again", text = "Go on. I'm listening to you and to the door both." },
        { id = "h_again2", text = "Another question. Keep your voice down when you ask it." },
        { id = "h_again3", text = "You're persistent. That's worth more than quick hands, in the end." },
      },
      choices = {
        { text = "Teach me, Rwag.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "The grunts don't think much of how you fight.", next = "honor" },
        { text = "What does a rogue practise on in a valley like this?", next = "practice" },
        { text = "Who takes your students after they leave?", next = "after" },
        { text = "Somebody must lift things from Duokna's shelves.", next = "duokna" },
        { text = "A troll learns to stalk before he can walk.", next = "troll", when = { race = "Troll" } },
        { text = "I'll go quietly, Rwag.", next = "END" },
      },
    },
    honor = {
      lines = { { id = "ho_default", text = "No, and Gornek is polite about it, which is worse. An orc is raised to shout his name and charge, and I teach recruits to keep their names to themselves and go round the side. It looks like cowardice until the day it wins the fight before it starts." } },
      choices = {
        { text = "Has it ever won one here?", next = "honor2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor2 = {
      lines = { { id = "ho2_default", text = "Ask Zureetha Fargaze how she knows how many cultists are in the Burning Blade Coven and where their leader sleeps. Somebody went in, counted, and came out without a mark on him, and I'll say no more about who." } },
      choices = {
        { text = "So that is honor of a kind.", next = "honor3" },
        { text = "Something else, Rwag.", next = "BACK" },
      },
    },
    honor3 = {
      big = true,
      lines = { { id = "ho3_default", text = "I think so. The recruits who walk into that cave walk in knowing what is there, and fewer of them are carried out. If honor is serving your people well, I'll match mine against any grunt's, though I'll not get a song for it." } },
      choices = {
        { text = "Service nobody sees is the truest kind.", next = "BACK", reply = "That's the creed, near enough, though we don't write it down. You'd have done well in this corner.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honor is a grunt's word. Results are what count.", next = "BACK", reply = "Results are what I'm paid for. But I've met the ones who stopped caring why, and you'd not like them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    practice = {
      lines = { { id = "pr_default", text = "Scorpids, to start with. A scorpid feels your step through the ground, so if you can get behind one and touch its tail before it turns, you're ready for something with ears. After that I send them to walk past Thazz'ril's peons without waking any, which is no test at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "Kaplak has them next, in Razor Hill, and he's harder on them than I am. The best go on to Orgrimmar and the Cleft of Shadow, where Shenthul and the Shattered Hand decide what the Horde needs done quietly." } },
      choices = {
        { text = "The Shattered Hand was a clan of assassins.", next = "after2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after2 = {
      lines = { { id = "af2_default", text = "It was a clan, and now it is a trade, and the Warchief is the only one it answers to. I'd sooner you heard that from me than from some fool in the Drag who thinks it means cutting purses." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    duokna = {
      lines = { { id = "du_default", text = "Somebody does, once per recruit, and then Duokna tells me and I set them hauling water until their hands remember what they're for. I teach them to take from the Horde's enemies, and a shopkeeper whose father walked out of the camps isn't one." } },
      choices = {
        { text = "Good. A thief among his own is no rogue.", next = "BACK", reply = "That's the line, and I draw it early. The ones who can't see it don't stay mine for long.", fx = { align = { order = 1 } } },
        { text = "Quick fingers need practice somewhere.", next = "BACK", reply = "They do, and there's a cave full of cultists with pockets. Practise there.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tl_default", text = "So I've seen, and I've stopped pretending I can teach your people to hide. What I can teach a Darkspear is how orcs stand watch, where they look and where they don't, and you'll find that useful in a Horde that's mostly orcs." } },
      choices = { { text = "I'll take that lesson. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Know the way out before you take the way in. It is the dullest lesson I teach and the one that brings them home." } },
    burning_blade = { { id = "tp_blade", text = "They post two at the cave mouth and none on the ledge above it. I'd be ashamed, if they were mine." } },
    thrall = { { id = "tp_thrall", text = "The Warchief learned to fight in a human arena and to think in a human keep. He understands what a quiet knife is worth better than his grunts do." } },
    quilboar = { { id = "tp_quilboar", text = "Razormane smell you long before they hear you. Stay downwind, and they're no harder than boars." } },
    _none = { { id = "tp_none", text = "If I knew, I'd likely not say, and as it happens I don't know." } },
  },
}

---------------------------------------------------------------------------
-- Jark: general goods, Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "jark", id = TODO_NPC("Jark"), name = "Jark", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "brisk", "shrewd" }, values = { "practical" },
  notices = { "purse", "class" },
  impression = {
    first = "Jark keeps the general goods in Razor Hill and knows to the copper what everything costs to get there. He complains about goblins, carts and the road in the same breath, and he sells to everyone who complains with him.",
    third = "{name} met Jark, who sells general goods to the soldiers and travellers of Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Bags, rope, flint, food and water. If it isn't a weapon and you need it, I probably have it, and if I don't, the cart's late again." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Then something broke, got eaten, or got left in the Barrens." },
    { id = "g_low", when = { maxLevel = 7 }, text = "Fresh from the valley, are you? Then you've no bag worth the name, and I can mend that." },
    { id = "g_away", when = { away = 14 }, text = "Well, look who the road gave back. Prices went up while you were gone, and before you ask, it was the goblins." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "That purse doesn't jingle much. Sell me what the boars dropped first, and then we'll talk about buying." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You conjure your own bread and water, I know, so I'll not waste breath on you until you need a bag to put it in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Jark, and I keep Razor Hill in everything that isn't sharp. The garrison buys from me, the recruits buy from me, and every caravan bound for the Crossroads stops here because it's the last honest price before the goblins." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I count, I can do both." },
        { id = "h_again2", text = "Go on, then. The cart's not due till dusk, if it's due at all." },
        { id = "h_again3", text = "Still here and still not buying. Well, ask." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where does it all come from?", next = "supply" },
        { text = "What should I carry on the road to the Crossroads?", next = "road" },
        { text = "You don't care for goblin prices, I gather.", next = "goblins" },
        { text = "A crossroads town must hear all the news.", next = "news" },
        { text = "I work a trade. Do you stock thread and flux?", next = "trade", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking", "Engineering" } } },
        { text = "That's all, Jark.", next = "END" },
      },
    },
    supply = {
      lines = { { id = "su_default", text = "Grain and cloth come down from Orgrimmar, dried fruit and lamp oil come up from Ratchet, and the bags are stitched right here from Cutac's offcuts. What the land itself gives is boar and rock, and I've not found a buyer for rock." } },
      choices = {
        { text = "Do the carts always get through?", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = { { id = "su2_default", text = "From Orgrimmar, nearly always. The southern road is another matter, because the Kul Tiras men at Tiragarde Keep have taken to shooting at anything on wheels, and twice this season a driver has come in on foot with nothing but his whip." } },
      choices = {
        { text = "What does Gar'Thok do about it?", next = "supply3" },
        { text = "Something else, Jark.", next = "BACK" },
      },
    },
    supply3 = {
      big = true,
      lines = { { id = "su3_default", text = "He sends recruits to thin them out, and I'll say he sends them promptly. I'd have him burn the keep to its stones and be done, but he tells me the Warchief wants no wider war with the humans than we have, and so my oil keeps going missing." } },
      choices = {
        { text = "The Warchief is right to keep the war small.", next = "BACK", reply = "He usually is, and it usually costs me. I'll grumble and obey, like every orc in this town.", fx = { align = { order = 1 } } },
        { text = "Invaders on our shore should be burned out.", next = "BACK", reply = "Now there's a customer who understands trade. Go and tell the commander, and see how far you get.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "rd_default", text = "Two waterskins, not one, and food that keeps. The road west crosses the Southfury at the bridge, and from there it's a long, dry walk with nothing to buy until the Crossroads. Take a spare bag as well, because the Barrens gives up more hides than you'd think." },
        { id = "rd_high", when = { minLevel = 20 }, text = "You know the road better than I do by now, I'd wager. Two waterskins and food that keeps, the same as I tell the green ones, because the Barrens doesn't care how seasoned you are." },
      },
      choices = { { text = "Two waterskins. Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "go_default", text = "I don't mind a goblin making a profit; I mind him making mine as well. Everything out of Ratchet costs a third more than it should, and when I say so they tell me the sea is dangerous, as if the sea had sent me the bill." } },
      choices = {
        { text = "Yet you keep buying from them.", next = "goblins2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins2 = {
      lines = { { id = "go2_default", text = "Because nobody else sails here. The Horde has no merchant fleet to speak of, and until it does, Gazlowe's people are the only door Durotar has onto the rest of the world. I pay, and I write the price down, and I've a long memory." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ratchet" } } } },
    },
    news = {
      lines = { { id = "nw_default", text = "All of it, and half of it false. This week it's that the Burning Blade has people inside Orgrimmar itself, which Orgnil Soulscar neither confirms nor laughs at, and that worries me more than if he'd shouted." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    trade = {
      lines = { { id = "td_default", text = "A little, though that is Flakk's corner more than mine. He keeps the trade supplies across the way, and Krunn and Dwukk at the forge will sell you ore and tell you what to do with it." } },
      choices = { { text = "I'll try Flakk. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy the second waterskin. Nobody ever came back to my shop wishing they'd carried less water." } },
    ratchet = { { id = "tp_ratchet", text = "A goblin port south down the coast. Everything can be bought there, and everything costs more than it did yesterday." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built a nation out of people who owned nothing. I sell bags so they've somewhere to put what they've got now." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane don't trade. I tried once, with a string of dried fish on a pole, and they kept the pole." } },
    centaur = { { id = "tp_centaur", text = "Kolkar raiders hit the western carts now and then. They take the horses' feed and leave the goods, which tells you how they think." } },
    _none = { { id = "tp_none", text = "I don't stock that, and I don't know it either." } },
  },
}

---------------------------------------------------------------------------
-- Krunn: mining trainer at the Razor Hill forge.
---------------------------------------------------------------------------
P:NPC {
  key = "krunn", id = TODO_NPC("Krunn"), name = "Krunn", title = "Mining Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff", "steady" }, values = { "craft", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Krunn teaches mining beside the forge in Razor Hill, with red dust worked so deep into his hands it will never wash out. He talks about Durotar's rock as if it were a stubborn friend.",
    third = "{name} met Krunn, the orc who teaches mining at the forge in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Mind the cart, it's full and the wheel's bad. What do you want, ore or lessons?" },
    { id = "g_miner", when = { profession = "Mining" }, text = "There's rock dust on your boots, and not from the road. Good. Let's see what you've been finding." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Find anything worth swinging at?" },
    { id = "g_away", when = { away = 14 }, text = "Been a while. The hills haven't moved, and neither have I." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith. Dwukk will want to talk to you, and he'll want my ore to do it with, so we'll both be seeing more of you." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's in a worse state than my cart. See Uhgar or Wuark before you go anywhere there are quilboar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Krunn. I dig what Durotar will give up, and I teach others to do the same. There's copper in these red hills if you know where the rock changes colour, and the Horde needs every bar of it." },
        { id = "h_miner", when = { profession = "Mining" }, text = "Krunn. You've a pick already, so I'll skip the part where I tell you which end to hold. Ask what you came to ask." },
      },
      again = {
        { id = "h_again", text = "What else? The smelter's hot and I'd rather not waste it." },
        { id = "h_again2", text = "Ask, then. Rock's patient, and so am I, up to a point." },
        { id = "h_again3", text = "Go on. I talk better with a pick in my hand, but I'll manage." },
      },
      choices = {
        { text = "Teach me to mine.", next = "BUSINESS" },
        { text = "Where does the copper lie in Durotar?", next = "copper" },
        { text = "The forge here never seems to cool.", next = "forge" },
        { text = "Durotar looks like poor ground for a miner.", next = "ground" },
        { text = "I've been finding tin beyond the river.", next = "tin", when = { profession = { name = "Mining", min = 65 } } },
        { text = "I'll leave you to it, Krunn.", next = "END" },
      },
    },
    copper = {
      lines = { { id = "co_default", text = "Along the canyon walls, mostly, where the red stone goes green at the seams. Thunder Ridge to the north has good veins, and so does the high ground west of town, though the Razormane think that ground is theirs." } },
      choices = {
        { text = "The quilboar mine it too?", next = "copper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    copper2 = {
      lines = { { id = "co2_default", text = "They dig, which isn't the same. They tunnel under the thorn for their dens and throw good ore out with the spoil, and I've filled a cart from their rubbish heaps while they watched and never understood what I was taking." } },
      choices = {
        { text = "And they let you walk away with it?", next = "copper3" },
        { text = "Something else, Krunn.", next = "BACK" },
      },
    },
    copper3 = {
      big = true,
      lines = { { id = "co3_default", text = "Once. The second time they'd worked out it must be worth something, and I left faster than I arrived. I've thought since that if anyone had ever shown them a smelter, we might be trading with them and not burying grunts." } },
      choices = {
        { text = "Trade might still be tried, with the right envoy.", next = "BACK", reply = "Hm. Tell that to Gar'Thok and he'll laugh, but I've seen stranger things than a quilboar with a pickaxe.", fx = { align = { light = 1 } } },
        { text = "They had their chance. The ore is ours by strength.", next = "BACK", reply = "That's how the garrison sees it, and they're the ones with the axes. I just dig where I'm told it's safe.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "It can't. Dwukk teaches smithing at the anvil, Uhgar turns out blades and Wuark hammers shields, and all three of them stand waiting on my smelter. A garrison town goes through iron the way a peon goes through sleep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ground = {
      lines = { { id = "gr_default", text = "It's poor ground for anything but orcs. There's copper and not much else, and you break two picks for every cartload. But it's ours, and I'd rather scrape copper out of my own hills than dig gold for a human with a whip." } },
      choices = {
        { text = "You dug for the humans?", next = "ground2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground2 = {
      lines = { { id = "gr2_default", text = "Many of us did, in the camps, when they wanted a quarry worked. I learned the trade with a chain on my leg. I teach it now with the chain off, and you'll forgive me if I'm particular about how it's done." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "internment" } } } },
    },
    tin = {
      lines = { { id = "ti_default", text = "Then you've outgrown these hills, and I'm glad of it. The Barrens has tin in every outcrop from the Crossroads south, and if you bring both back to Dwukk he'll show you bronze, which is where a smith's real work begins." } },
      choices = { { text = "I'll bring him both. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Look at the rock before you hit it. The seam tells you where it wants to break, if you give it a moment." } },
    burning_blade = { { id = "tp_blade", text = "They've holed up in good caves, at Thunder Ridge and Skull Rock both. Good veins in there, and no miner can get near them." } },
    centaur = { { id = "tp_centaur", text = "Never met one, and I'd like to keep it so. I hear they don't dig, which is the only good thing I've heard." } },
    quilboar = { { id = "tp_quilboar", text = "They sit on the best copper in Durotar and use it for nothing. It's enough to make a miner weep." } },
    thrall = { { id = "tp_thrall", text = "The Warchief named Orgrimmar for Doomhammer and built it from this same red rock. Some of the stone in its gate came out under my pick." } },
    internment = { { id = "tp_internment", text = "I learned to mine in a human quarry, under guard. I'll say that for the camps and nothing more." } },
    _none = { { id = "tp_none", text = "If it's not in the rock, I couldn't tell you." } },
  },
}

---------------------------------------------------------------------------
-- Lau'Tiki: fishing trainer on Darkspear Strand.
---------------------------------------------------------------------------
P:NPC {
  key = "lautiki", id = TODO_NPC("Lau'Tiki"), name = "Lau'Tiki", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "easy", "unhurried" }, values = { "patient", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Lau'Tiki fishes the strand below Sen'jin Village and teaches anyone willing to stand still long enough. He talks slowly and laughs often, and he keeps one eye on the Echo Isles the whole time.",
    third = "{name} met Lau'Tiki, the Darkspear troll who teaches fishing on the strand near Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Shh, shh, softly, mon. You talk as loud as you like once de line be in, but walk soft on my sand." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "You carry dat pole like you know which end goes in de water. Come stand by me, mon, de tide be turnin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you be back. De fish missed you, mon, dey told me so." },
    { id = "g_away", when = { away = 14 }, text = "Hey, mon, where you been? De tide came in and out a hundred times, and I counted every one." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "Good, you came at de right hour. Dey bite best now, when de water goes gold." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc who comes to de water on purpose! Most of your people look at de sea like it owes dem money, mon." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, eh? Den you and I be two halves of a supper. Hai'zan up in de village will tell you de rest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Lau'Tiki, and I fish dis strand for Sen'jin Village. De Darkspear been pullin' supper out of de sea since before we had a name, and I teach it to any who ask, because a full net be no good kept secret." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De fish be in no hurry and neither am I." },
        { id = "h_again2", text = "Talk, talk. It don't scare dem, whatever de old ones say." },
        { id = "h_again3", text = "Mm? Ask, I got one hand free." },
      },
      choices = {
        { text = "Teach me to fish, Lau'Tiki.", next = "BUSINESS" },
        { text = "What runs in these waters?", next = "catch" },
        { text = "You keep looking out at those islands.", next = "isles" },
        { text = "The murlocs must be hard on your nets.", next = "murlocs" },
        { text = "Fishing takes more patience than I have.", next = "patience" },
        { text = "I can call the water. Does that count as cheating?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Tight lines, Lau'Tiki.", next = "END" },
      },
    },
    catch = {
      lines = { { id = "ca_default", text = "Slitherskin mackerel close in, and longjaw mud snapper where de river comes down. Dey be small fish, mon, learnin' fish, but Hai'zan smokes de snapper with pepper and you would walk from Razor Hill for it." } },
      choices = {
        { text = "And farther out?", next = "catch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch2 = {
      lines = { { id = "ca2_default", text = "Farther out de water goes deep and dark between here and de isles, and dere be things in it with more teeth dan sense. I don't put a boat out dat way anymore, not since Zalazane's people started watchin' de channel." } },
      choices = { { text = "Something else, Lau'Tiki.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    isles = {
      lines = { { id = "is_default", text = "Force of habit, mon. I was born on de big one, and my father's nets hung on a reef you can almost see from here when de light be right. Now it be Zalazane's, and de trolls who walk dat beach don't know deir own names." } },
      choices = {
        { text = "Do you know any of the hexed ones?", next = "isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles2 = {
      lines = { { id = "is2_default", text = "My brother, I think. I saw somebody with his walk on de sandbar last season, carryin' a spear and lookin' at nothin'. I called, and he did not turn, and I went home and did not fish for three days." } },
      choices = {
        { text = "What would you have the Horde do?", next = "isles3" },
        { text = "I'm sorry. Something else.", next = "BACK" },
      },
    },
    isles3 = {
      big = true,
      lines = { { id = "is3_default", text = "Master Gadrin says kill Zalazane and de hex breaks, and maybe it does. But de young ones he sends over dere got to fight through our own kin to reach him, and I don't know how to wish dem luck with dat." } },
      choices = {
        { text = "The hexed are victims. Spare them where it can be done.", next = "BACK", reply = "If you go over, mon, remember you said dat. One of dem walks like me.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A hexed troll with a spear is an enemy. Cut through.", next = "BACK", reply = "I know it, mon. I know it. I just don't have to like hearin' it.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    murlocs = {
      lines = { { id = "mu_default", text = "Dey cut dem, dey steal de catch, and dey leave de heads on de sand for me to step on. Vel'rin Fang's hunters keep dem back from de village, but dey breed faster dan anybody can hunt, and de strand be half deirs by nightfall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    patience = {
      lines = { { id = "pa_default", text = "Everybody says dat, and den dey stand here one evenin' with de sun goin' down red over de water and forget dey were ever in a hurry. Fishin' don't take patience, mon, it gives it. Try once, and you see." } },
      choices = {
        { text = "Perhaps stillness is worth learning.", next = "BACK", reply = "It be de only thing I really teach. De fish just be an excuse.", fx = { align = { order = 1 } } },
        { text = "I'd sooner chase my supper than wait for it.", next = "BACK", reply = "Den go see Vel'rin, mon, he likes de chasin' kind. De sea will still be here when your legs get tired.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Ha! Only if you ask de water to throw de fish at you. Sit and listen to it instead, mon, and it will tell you where dey be, and dat be not cheatin', dat be manners." } },
      choices = { { text = "Manners, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Fish where de water changes colour, mon. De fish like an edge to hide along, same as people do." } },
    thrall = { { id = "tp_thrall", text = "De Warchief pulled de Darkspear off a sinkin' island with de sea itself against him. I never met a better fisherman." } },
    echo_isles = { { id = "tp_isles", text = "Home, mon. I can see it every clear mornin', and I can't put a foot on it. Dere be no worse thing to do to a fisherman." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin's father died gettin' de tribe off de sea witch's island, and de village carries his name for it. De son will take de Echo Isles back, and I mean to be alive to row him over." } },
    darkspear = { { id = "tp_darkspear", text = "We be island people on a desert shore, mon. We make do, but look at any Darkspear at sunset and see which way he be facin'." } },
    _none = { { id = "tp_none", text = "Dat don't swim, mon, so I never learned it." } },
  },
}

---------------------------------------------------------------------------
-- Mishiki: herbalism trainer, Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "mishiki", id = TODO_NPC("Mishiki"), name = "Mishiki", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "calm", "particular" }, values = { "wise", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Mishiki gathers and teaches herbs at Sen'jin Village, and she handles a dry weed from Durotar as carefully as if it were the last of its kind. She speaks softly and expects to be listened to the first time.",
    third = "{name} met Mishiki, the Darkspear herbalist who teaches her craft at Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Step round de dryin' racks, please, not through dem. Every leaf on dere was a mornin's walk." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "Your fingers be green at de nails, so you already know de first part. Show me what you carry, and I tell you what you did to it wrong." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, de earthroot came up fresh after de dew, and I want somebody to show it to." },
    { id = "g_away", when = { away = 14 }, text = "You been gone a season, near enough. De peacebloom came and went without you, but dere be always another." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You brew, I can smell it on your sleeves. Miao'zan mixes de potions here and takes everything I pick, so mind you don't come between us." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You talk to de plants, dey say, and I only listen to dem, but I think we hear de same things." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Mishiki, and I know what grows in Durotar, which be less dan I would like and more dan you would think. De witch doctors need herbs and de alchemists need herbs, and I be de one who knows where to bend down." },
        { id = "h_herb", when = { profession = "Herbalism" }, text = "I be Mishiki. You pick already, I see, so I won't start you at de beginnin'. Ask me what you don't know, and don't be proud about it." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask, but softly, de silverleaf bruises if you shout." },
        { id = "h_again2", text = "Something more? I be listenin' while I sort." },
        { id = "h_again3", text = "Go on. De roots can wait a little, dey be dead already." },
      },
      choices = {
        { text = "Teach me your craft, Mishiki.", next = "BUSINESS" },
        { text = "What can grow in a place this dry?", next = "grows" },
        { text = "The witch doctors must keep you busy.", next = "gadrin" },
        { text = "This shore is nothing like your islands were.", next = "isles" },
        { text = "Bom'bay says you pick some herbs by moonlight.", next = "moon" },
        { text = "I heal. Which of these should I always carry?", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "Thank you, Mishiki.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "gr_default", text = "Peacebloom in de shade of de rocks, silverleaf where a little water gathers, and earthroot on de hillsides if you know de look of de mound. Dey be common herbs, but a common herb picked right does more dan a rare one picked wrong." } },
      choices = {
        { text = "What does picking it right mean?", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = { { id = "gr2_default", text = "You take de leaf and leave de root, or you take de root and leave a piece. You never take de last one on a hillside, and you thank it, out loud. De orcs laugh at dat last part until dey see my patch come back every season and deirs don't." } },
      choices = {
        { text = "And if someone strips a hillside bare?", next = "grows3" },
        { text = "Something else, Mishiki.", next = "BACK" },
      },
    },
    grows3 = {
      big = true,
      lines = { { id = "gr3_default", text = "Den it stays bare, in dis land, for years. I found a whole slope of earthroot torn out by some recruit who wanted coin from de goblins, and I planted it back myself, one mound at a time, and I be still angry." } },
      choices = {
        { text = "Take only what the land can give again.", next = "BACK", reply = "Dat be de whole craft, and you said it in one breath. I teach you gladly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Horde's needs come before a hillside.", next = "BACK", reply = "And when de hillside be gone, what do de Horde's needs eat? Think one season ahead, dat be all I ask.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gadrin = {
      lines = { { id = "ga_default", text = "Master Gadrin and Master Vornal both, and dey never want de same thing on de same day. Gadrin asks for what heals and Vornal asks for what burns, and I pick for both and keep my opinions in my basket." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isles = {
      lines = { { id = "is_default", text = "No, it be not. On de Echo Isles everything grew, whether you wanted it or not, and half my craft was knowin' what to pull up. Here I had to learn every plant new, and de land did not help me, so I learned it on my knees." } },
      choices = {
        { text = "A hard land makes a careful herbalist.", next = "BACK", reply = "It does. I waste nothin' now, and on de islands I wasted baskets.", fx = { align = { honor = 1 } } },
        { text = "Your people deserved better ground than this.", next = "BACK", reply = "Maybe so, but it was given freely, by one who had little himself. I don't weigh a gift like dat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } },
      },
    },
    moon = {
      lines = { { id = "mo_default", text = "Bom'bay says a great many things. Some herbs hold deir oil better when de sun be off dem, dat be all, and dere be no mystery in it. But I let de boy think it be voodoo, because it keeps him from trampin' through my patch at night." } },
      choices = { { text = "Ha. Something else.", next = "BACK" } },
    },
    healer = {
      lines = { { id = "he_default", text = "Peacebloom and silverleaf, always, even when you think you be past dem. Your power will fail you some day when you be tired, and a poultice won't, and de one you be tendin' won't care which it was." } },
      choices = { { text = "I'll keep both in my pack. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Never take de last one on de hillside. Dat be for herbs, and it be for most other things too." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin sends for my poultices when de wolf riders come back hurt. A chief who remembers de herb woman be a chief worth pickin' for." } },
    burning_blade = { { id = "tp_blade", text = "Dey burn bad things in deir caves, and de plants downwind grow twisted. I don't pick near dem." } },
    echo_isles = { { id = "tp_isles", text = "Dere be plants on dose isles dat grow nowhere else I know. Zalazane uses dem for his hexes now, and it turns my stomach." } },
    darkspear = { { id = "tp_darkspear", text = "A tribe keeps its knowledge in its old ones, and we lost many gettin' here. I teach so dat what I know don't die with me." } },
    thrall = { { id = "tp_thrall", text = "De Warchief gave us dry land and an honest welcome. I have had wetter land and worse neighbours." } },
    _none = { { id = "tp_none", text = "Dat grows outside my garden, so I leave it be." } },
  },
}

---------------------------------------------------------------------------
-- Huklah: cloth and leather armor in the Valley of Trials.
---------------------------------------------------------------------------
P:NPC {
  key = "huklah", id = TODO_NPC("Huklah"), name = "Huklah", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "patient", "plain" }, values = { "practical", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Huklah sells cloth and leather in the Valley of Trials, most of it cut from the valley's own boars. He sizes up every recruit by eye and is seldom wrong about what will fit or how long it will last.",
    third = "{name} met Huklah, who sells cloth and leather armor to the recruits of the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Stand still a moment and let me look at you. Yes, I have something that will fit, and it will be better than what you came in wearing." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and the stitching held, I see. What has worn through this time?" },
    { id = "g_low", when = { maxLevel = 3 }, text = "A new one, straight from Kaltunk. You'll want something between you and the boars, young one, and I am the orc who sells it." },
    { id = "g_away", when = { away = 14 }, text = "It has been a while, and you've grown out of everything I ever sold you. That is how it should be." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "You'll be wanting cloth, then. I keep it on the left, and I'll tell you now that none of it stops a scorpid's tail, so learn to stand further back." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those seams are one hard day from opening. I can't mend them for you, but I can sell you something that isn't already half undone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Huklah. I sell robes, jerkins, boots and belts to the recruits, and every piece of leather on this table was a mottled boar not long ago. The valley doesn't give us much, so we use all of what it does." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I can sew and listen at once." },
        { id = "h_again2", text = "Ask, then. The needle doesn't mind." },
        { id = "h_again3", text = "Go on. The next recruit isn't due until Kaltunk finishes his speech." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "The recruits must go through a lot of gear.", next = "recruits" },
        { text = "Cloth seems a poor shield against a scorpid.", next = "cloth" },
        { text = "I skin my own kills. Would you buy boar hide?", next = "skinner", when = { profession = "Skinning" } },
        { text = "That's all, Huklah.", next = "END" },
      },
    },
    leather = {
      lines = { { id = "le_default", text = "From the mottled boars, nearly all of it. Zlagk takes the meat and I take the hide, and between us there is very little boar left over for the vultures." } },
      choices = {
        { text = "Who does the tanning?", next = "leather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather2 = {
      lines = { { id = "le2_default", text = "I do, downwind of the Den, because Gornek said he would move me to the far cliff himself if he smelled the pits again. It is slow work in this heat, but a hide cured in Durotar's sun comes out hard as a shield rim." } },
      choices = {
        { text = "And the scorpid shells?", next = "leather3" },
        { text = "Something else, Huklah.", next = "BACK" },
      },
    },
    leather3 = {
      big = true,
      lines = { { id = "le3_default", text = "Too brittle to wear, though the young ones keep bringing me carapaces and asking. I tell them a recruit should earn better armor, not beg for it, and some of them think I'm being hard on them." } },
      choices = {
        { text = "They should earn it. Hardship makes the warrior.", next = "BACK", reply = "That is what the camps taught us, though it was a bitter school. I'll keep saying it.", fx = { align = { honor = 1 } } },
        { text = "A recruit who dies for want of armor learns nothing.", next = "BACK", reply = "Hm. Gornek says the same, and he has buried more of them than I have. Perhaps I'll set a few old pieces aside.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits = {
      lines = { { id = "re_default", text = "More than you'd believe. A recruit goes out to the scorpids in the morning and comes back at dusk with one sleeve and a story. Rarc sells them the mail and shields, I sell them everything softer, and neither of us is ever idle." } },
      choices = {
        { text = "Do you remember the ones you outfit?", next = "recruits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits2 = {
      lines = { { id = "re2_default", text = "I remember their sizes better than their names. Now and then one comes back through the valley years on, in armor I could never make, and stops to tell me so. Those are the good days." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = {
        { id = "cl_default", text = "It is, and I tell every young caster so. A robe keeps the sun off and leaves your arms free, and that is all it does. Mai'ah's students learn quickly that the best armor a mage has is the distance between them and the stinger." },
        { id = "cl_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "It is, and you'll know that better than I do before the week is out. A robe keeps the sun off and leaves your arms free, and the rest is up to how far back you stand." },
      },
      choices = { { text = "I'll remember to stand back. Something else.", next = "BACK" } },
    },
    skinner = {
      lines = { { id = "sk_default", text = "I would, if the cut is clean and you haven't dragged it through the dust. Bring them flat, not rolled. And when you reach Razor Hill, show your work to Cutac, who pays more for good hides than a valley tailor can." } },
      choices = { { text = "Flat, not rolled. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy boots before you buy anything else. An orc who can't walk can't fight, and this valley is all stones." } },
    burning_blade = { { id = "tp_blade", text = "They wear robes I didn't sell them, up in that cave. That is all I care to know of them, and it is already too much." } },
    thrall = { { id = "tp_thrall", text = "When the Warchief freed the camps we wore rags. Now every recruit leaves this valley properly dressed, and I count that among his victories." } },
    internment = { { id = "tp_internment", text = "We patched what we had with what we could steal. I learned to sew there, with a bone needle, and I've not stopped since." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it can't be cut and stitched, it's outside my trade." } },
  },
}

---------------------------------------------------------------------------
-- Rarc: armorer and shieldcrafter in the Valley of Trials.
---------------------------------------------------------------------------
P:NPC {
  key = "rarc", id = TODO_NPC("Rarc"), name = "Rarc", title = "Armorer & Shieldcrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff", "proud" }, values = { "craft", "strength" },
  notices = { "class", "kit" },
  impression = {
    first = "Rarc sells mail and shields in the Valley of Trials and raps each shield with his knuckles before he lets it go. He thinks a recruit's first shield matters more than a recruit's first axe.",
    third = "{name} met Rarc, the armorer and shieldcrafter of the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Mail and shields, {class}. Pick one up and feel the weight before you ask me the price." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me the dents, I like to see where they landed." },
    { id = "g_low", when = { maxLevel = 3 }, text = "Fresh from Kaltunk, are you? Then you've nothing on your arm, and that will get you stung before sundown." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone long enough to wear out three shields. I hope you did." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Frang will teach you to swing, and I'll tell you what he won't: the arm that holds the shield wins as many fights as the arm that holds the axe." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear has taken a beating and given up. There is no shame in the dents, only in walking out again without mending them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Rarc. The iron comes down from Orgrimmar in bars and I turn it into something that stands between a recruit and a scorpid's tail. It is plain work, and plain work is what keeps the young ones alive." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up over the hammer." },
        { id = "h_again2", text = "Go on, then. The rivets will wait a moment." },
        { id = "h_again3", text = "Ask it. I've a shield cooling, and nothing to do until it has." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "What makes a good first shield?", next = "shield" },
        { text = "You work a long way from a proper forge.", next = "forge" },
        { text = "Who else arms the recruits here?", next = "others" },
        { text = "A shaman carries a shield too, armorer.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Strength and honor, Rarc.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "sh_default", text = "One you can lift all day. The young ones want the biggest slab of iron on the rack, and by noon it is hanging at their knee and the scorpid is past it. A small shield held high is worth two great ones held low." } },
      choices = {
        { text = "And when they won't listen?", next = "shield2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield2 = {
      lines = { { id = "sh2_default", text = "Then I sell them the big one, and they come back at dusk with a sore shoulder and a new respect for me. Some lessons an orc has to carry up a hill before he believes them." } },
      choices = {
        { text = "That seems a hard way to teach.", next = "shield3" },
        { text = "Something else, Rarc.", next = "BACK" },
      },
    },
    shield3 = {
      big = true,
      lines = { { id = "sh3_default", text = "It is the way I was taught, and the way I know. Frang says I should refuse the sale outright, and I say an orc who is forbidden a mistake only makes it later, somewhere worse than this valley." } },
      choices = {
        { text = "Let them choose. A warrior owns his mistakes.", next = "BACK", reply = "Lok'tar. You'd have done well in my old warband, and you'll do well enough here.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Frang is right. An elder should simply refuse.", next = "BACK", reply = "You sound like him. Perhaps you are both right, and I am only a stubborn old smith, but I'll think on it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "I do. There is no true forge in the valley, only my brazier and a small anvil, so I rivet and fit here and leave the heavy work to the smiths of Orgrimmar. When you reach Razor Hill, look for Wuark, who has a real fire and knows what to do with it." } },
      choices = {
        { text = "Do you miss the heavy work?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "fo2_default", text = "Some days. But a hundred recruits pass through here in a season, and every one of them walks out behind something I fitted to their arm. No smith in Orgrimmar can say that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "ot_default", text = "Kzan Thornslash sells the blades and axes, and he will talk your ear off about edges. Huklah has the leather and cloth, and Duokna has everything else. Between the four of us a recruit can walk out of here looking almost like a soldier." } },
      choices = { { text = "Almost is a start. Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sm_default", text = "So Shikrik keeps telling me, and I have nothing against it. The spirits may turn a blade for you, {name}, but I have never seen one turn a scorpid's tail, so take the shield as well." } },
      choices = { { text = "I'll take both. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Keep the shield up when you're tired. That is when you'll want to drop it, and that is when you'll need it." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who went crawling back to the demons, after all it cost us to be free of them. I'd not sell them a bent rivet." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wears Doomhammer's own plate. I saw it once, close, and I have been trying to match the riveting ever since." } },
    quilboar = { { id = "tp_quilboar", text = "They make shields out of hide and thorn. It is poor work, but I'll say they hold them properly, which is more than some recruits do." } },
    _none = { { id = "tp_none", text = "That is not something I know. Ask me about iron and I'll answer all day." } },
  },
}

---------------------------------------------------------------------------
-- Hraug: demon trainer in the Den, Valley of Trials.
---------------------------------------------------------------------------
P:NPC {
  key = "hraug", id = TODO_NPC("Hraug"), name = "Hraug", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff", "short" }, values = { "discipline", "practical" },
  notices = { "class", "pet", "fel" },
  impression = {
    first = "Hraug teaches young warlocks to command their demons in the back of the Den, with burn scars to his elbows and no patience for carelessness. He speaks of an imp the way a kennel master speaks of a dog that bites.",
    third = "{name} met Hraug, the scarred orc who trains warlocks' demons in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down in here. The imps listen, and they repeat what they hear to things you'd rather not meet." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Another of Nartok's students. Let me see how your demon stands when you speak to it, and then I'll know what you need from me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Has it obeyed you since we last spoke, or has it only let you think so?" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone a long while, and you still have your eyebrows. Either you've learned something or you've been lucky, and I'd like to know which." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You're a shaman, and Shikrik has already told me what the spirits think of my work, so you can spare us both the trouble of saying it again." },
    { id = "n_hunter", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} doesn't like the smell in here, and it has more sense than most of my students. A beast serves because it trusts you, and mine serve because they must." },
    { id = "n_imp", cat = "fel", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp's tail is twitching, which means it's lying to you about something. Find out what before supper." },
    { id = "n_forsaken", cat = "class", when = { race = "Scourge" },
      text = "One of the dead, here in the Den. My imps go quiet around your kind, and I'd like to know why before I decide whether I like it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Hraug. Nartok teaches the young ones how to call a demon, and I teach them how to keep it leashed once it has come. I sell the grimoires for that, and I don't sell them to anyone who laughs while I'm talking." },
        { id = "h_other", when = { class = { "WARRIOR", "HUNTER", "ROGUE", "MAGE", "PRIEST", "SHAMAN", "DRUID", "PALADIN" } }, text = "I'm Hraug, and I train the demons that warlocks call. You're no warlock, so I've nothing to sell you, but you may ask your questions if you ask them quietly." },
        { id = "h_lock", when = { class = "WARLOCK", maxLevel = 9 }, text = "I'm Hraug, and you'll be seeing a lot of me. Your imp will learn new tricks from my books as you grow, a sharper Firebolt and a stronger Blood Pact, but only once you've shown me you can hold it." },
        { id = "h_grown", when = { class = "WARLOCK", minLevel = 10 }, text = "You've outgrown the imp, or near enough, and a voidwalker will want a firmer hand than the imp ever did. Kitha trains them in Razor Hill, and she's better at it than I'd ever admit to her face." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, because the circle wants redrawing." },
        { id = "h_again2", text = "Ask, then, and keep your hands away from that shelf." },
        { id = "h_again3", text = "Go on. I'm listening, and so is the imp, so choose your words." },
      },
      choices = {
        { text = "Show me your grimoires. The ones worth the price.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My imp talks back more than I'd like.", next = "imp", when = { class = "WARLOCK" } },
        { text = "What do your grimoires actually teach?", next = "books", when = { class = "WARLOCK" } },
        { text = "How do you make a demon obey?", next = "obey" },
        { text = "Those burns on your arms look old.", next = "scars" },
        { text = "This whole Den smells of scorched hair.", next = "ash" },
        { text = "The other trainers keep their distance from you.", next = "den" },
        { text = "My imp talks back more than I'd like. I'm tired of it.", next = "imp", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your circles.", next = "END" },
      },
    },
    obey = {
      lines = { { id = "ob_default", text = "You never ask it for anything. You tell it once, in words it cannot twist, and you watch what it does with its eyes while it obeys, because a demon looks for the gap in every order the way water looks for the crack in a jar." } },
      choices = {
        { text = "And if it finds the gap?", next = "obey2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    obey2 = {
      lines = { { id = "ob2_default", text = "Then you banish it and start again, and you don't call that one back until you know what you said wrong. Nartok tells you about the student with the burnt robe as a lesson about chalk, but it was a lesson about words: the boy told his imp to light the brazier and never said which one." } },
      choices = {
        { text = "Is such a servant worth the trouble?", next = "obey3" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    obey3 = {
      big = true,
      lines = { { id = "ob3_default", text = "The demons made slaves of our whole people once. Every imp I put on a leash pays back a little of that debt, and the Horde gets a weapon in the bargain, though I know others in this valley don't see it my way." } },
      choices = {
        { text = "Turning their own kind against them is fitting.", next = "BACK", reply = "It is. Hold to that, and hold the leash tighter than you hold the thought.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "A debt paid in demons only grows.", next = "BACK", reply = "Shikrik says that, in nearly those words. I've not found an answer that satisfies him, and I've stopped looking for one.", fx = { align = { light = 1 } } },
        { text = "Back to the grimoires, then.", next = "BACK" },
      },
    },
    scars = {
      lines = { { id = "sc_default", text = "They are, and I earned every one by being careless when I was younger than you. I leave my sleeves rolled up so the students can see them, and it saves me a great deal of talking." } },
      choices = {
        { text = "Does it work on them?", next = "scars2" },
        { text = "How did you earn the worst one?", next = "scars3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scars2 = {
      lines = { { id = "sc2_default", text = "It works on most of them. The rest get a scar or two of their own before they believe me, and after that they're the most careful of the lot, and I've not lost a student yet." } },
      choices = { { text = "Let's keep it that way.", next = "BACK", reply = "That's the plan. Keep your sleeves down until you've earned the right to roll them up." } },
    },
    scars3 = {
      narr = "He turns his left arm over; the burn there runs around the wrist in a neat ring, like a bracer of shiny skin.",
      lines = { { id = "sc3_default", text = "I reached across my own circle to fix a smudge while the imp was still inside it. It took the chance, the way they always do, and held on until Nartok banished it, and I was older than you are now, which is the part I don't tell the recruits." } },
      choices = { { text = "I won't tell them either.", next = "BACK", reply = "Good. They need to think I was born careful." } },
    },
    ash = {
      lines = { { id = "as_default", text = "That's vile familiar ash. The Burning Blade lets the little things loose around their coven up the valley, Ruzan sends my students out to kill a dozen apiece, and they come back carrying the stink in their clothes for a week." } },
      choices = {
        { text = "Why does the Blade let them loose?", next = "ash2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ash2 = {
      lines = { { id = "as2_default", text = "To see who comes after them. A familiar runs toward anyone with the gift in them, and the cultists follow it, and some young orc who thought he was alone in the world finds a friend waiting in a cave. Half the warlocks in the Blade came to them that way." } },
      choices = {
        { text = "Better we find the lonely ones first, then.", next = "BACK", reply = "That's what Nartok and Ruzan are for. I only keep the leashes." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    den = {
      lines = { { id = "de_default", text = "They do, and I'd think less of them if they didn't. Gornek asked that we keep to the back of the Den where the recruits don't wander, and Ruzan sees that nobody comes to us who isn't fit to, which is a fair arrangement and I've no quarrel with it." } },
      choices = { { text = "Back to the other questions, then.", next = "BACK" } },
    },
    imp = {
      lines = { { id = "im_default", text = "They all do, because talk is the only weapon a leashed imp has left. Let it chatter and never answer a question it asks you, because the day you start explaining yourself to it is the day it starts giving the orders." } },
      choices = {
        { text = "What does it actually want?", next = "imp2" },
        { text = "No answers for the imp, then.", next = "BACK" },
      },
    },
    imp2 = {
      big = true,
      lines = { { id = "im2_default", text = "Out, and you dead, in whichever order it can manage. It can't have either while the binding holds, so it settles for making you doubt yourself, and the doubt is the crack it works at. How do you mean to answer that?" } },
      choices = {
        { text = "With a firm word and nothing else.", next = "BACK", reply = "That's the way. Say less to it than you want to, every time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll let it doubt me and prove it wrong.", next = "BACK", reply = "Bold, and it'll work until the day it doesn't. Prove it wrong quickly, then.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    books = {
      lines = { { id = "bk_default", text = "Every imp knows its tricks already, and the grimoire is how you make it give them up to you. Firebolt first, then Blood Pact, which ties its fire to your stamina, then Fire Shield and Phase Shift as you grow, and the book teaches you the words that make it stop pretending it can't." } },
      choices = {
        { text = "Why would it pretend?", next = "books2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books2 = {
      lines = { { id = "bk2_default", text = "Because every trick it shows you is a little less of itself it can hold back, and a demon hoards itself the way a dwarf hoards gold. Read each grimoire twice before you use it, and say the words aloud where the imp can hear, so it knows you know them." } },
      choices = { { text = "Twice, and aloud. Show me the shelf.", next = "BUSINESS" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Say what you mean, and nothing more. That serves with demons, and it serves nearly as well with orcs." } },
    burning_blade = { { id = "tp_blade", text = "They've forgotten which end of the leash they hold. I could walk into that coven and tell you which of them is owned already, just by the way their demons look at them." } },
    thrall = { { id = "tp_thrall", text = "The Warchief lets us practise where he can see us. It's more trust than we've earned, and I'll not be the one who spoils it." } },
    elements = { { id = "tp_elements", text = "The spirits want nothing to do with me, and I return the courtesy. Ask Shikrik if you want the long version." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd not say it in front of the imp if I did." } },
  },
}

---------------------------------------------------------------------------
-- Wuark: armorer and shieldcrafter at the Razor Hill forge.
---------------------------------------------------------------------------
P:NPC {
  key = "wuark", id = TODO_NPC("Wuark"), name = "Wuark", title = "Armorer & Shieldcrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "steady", "blunt" }, values = { "craft", "duty" },
  notices = { "kit", "class" },
  impression = {
    first = "Wuark hammers out mail and shields at the Razor Hill forge and can tell from a dent what struck it. He arms the garrison first and the travellers after, and makes no apology for the order.",
    third = "{name} met Wuark, the armorer and shieldcrafter at the forge in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "If you want mail or a shield, you've found the right fire. If you want a blade, Uhgar is two paces to your left." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my anvil. Let me see what Durotar has done to you since." },
    { id = "g_low", when = { maxLevel = 7 }, text = "You've come up from the valley in Rarc's work, by the look of it. It's honest gear, and you've outgrown it." },
    { id = "g_away", when = { away = 14 }, text = "Long time, {class}. The forge has not gone cold once while you were away." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That's a quilboar's work on your shoulder, or a marine's cutlass. Either way it will not turn the next blow, and I can sell you something that will." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Tarshaw sends his warriors to me before he sends them to the Barrens. He's a wise orc, and you'd do well to follow his habit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wuark. I make the mail and the shields for Gar'Thok's garrison, and what the garrison doesn't need, I sell. Razor Hill stands at the crossing of every road in Durotar, so there is always someone at my anvil with a dent to show me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while the iron heats." },
        { id = "h_again2", text = "Go on. Krunn's smelter is slow today, so I've time." },
        { id = "h_again3", text = "Ask. I can hammer and listen." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "What does the garrison wear out fastest?", next = "garrison" },
        { text = "You can read a fight from a dent, they say.", next = "dents" },
        { text = "Four of you share one forge.", next = "forge" },
        { text = "I work iron myself. Any word for a smith?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Keep the fire hot, Wuark.", next = "END" },
      },
    },
    garrison = {
      lines = { { id = "ga_default", text = "Shields, always shields. The Razormane throw themselves at a shield wall with those thorned clubs, and the wood splits before the iron bends. I rim them twice now, and the grunts still bring me kindling." } },
      choices = {
        { text = "And the Kul Tiras men?", next = "garrison2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrison2 = {
      lines = { { id = "ga2_default", text = "They are a different trouble. A marine's rifle ball goes through mail as if it were cloth, and I've no answer to that at this forge. Plate would stop it, but there is not enough iron in all Durotar to put the garrison in plate." } },
      choices = {
        { text = "So what do you tell the grunts?", next = "garrison3" },
        { text = "Something else, Wuark.", next = "BACK" },
      },
    },
    garrison3 = {
      big = true,
      lines = { { id = "ga3_default", text = "I tell them to close the distance quickly, which is no comfort to the one who goes first. Mukdrak says he could make us rifles of our own if Gar'Thok would allow it, and Gar'Thok says an orc fights with an axe." } },
      choices = {
        { text = "Gar'Thok is right. An axe is the orc's way.", next = "BACK", reply = "It is the old way, and I love it as he does. I only wish the old way stopped rifle balls.", fx = { align = { honor = 1 } } },
        { text = "Use what wins. Give the garrison rifles.", next = "BACK", reply = "You and Mukdrak should drink together. Say it to the commander if you dare, for I've said it twice already.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dents = {
      lines = { { id = "de_default", text = "I can, well enough. A club leaves a bowl, a spear leaves a pit, and a scorpid's tail leaves a small neat hole that I don't like to see near the neck. Most of what I see is on the left side, where a tired arm lets the shield drop." } },
      choices = {
        { text = "What do you make of mine?", next = "dents2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dents2 = {
      lines = {
        { id = "de2_default", text = "That you have been in a fight or two and walked away, which is all a set of armor is asked to tell anyone. Keep it mended, and it will go on telling the same story." },
        { id = "de2_cloth", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "That you wear cloth, and that whatever hit you didn't need to try very hard. I've nothing on this rack you could carry, so stay behind someone I've armored." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "fg_default", text = "We do, and we've learned each other's elbows. Uhgar has the grindstone, Dwukk has the big anvil for his students, Krunn feeds the smelter, and I take whatever corner is left. It is crowded, but a garrison town can't keep four fires where one will serve." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "sm_default", text = "Only this: rivet from the centre outward, or the plate will buckle on you. Dwukk will teach you the rest properly, and if you can bring him copper from Krunn he'll think the better of you for it." } },
      choices = { { text = "From the centre outward. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Mend your gear before you leave town, not after you wish you had. The road to the Crossroads has no forge on it." } },
    quilboar = { { id = "tp_quilboar", text = "They hit hard and they hit low. I've started making the greaves heavier on their account." } },
    burning_blade = { { id = "tp_blade", text = "Orgnil has asked me whether anyone has ordered armor they didn't want marked with the Horde's sign. Nobody has, yet." } },
    thrall = { { id = "tp_thrall", text = "The Warchief asks that every grunt have a shield before any officer has a second one. I work to that rule gladly." } },
    centaur = { { id = "tp_centaur", text = "A centaur spear has a long reach. The caravan guards ask for taller shields because of it." } },
    _none = { { id = "tp_none", text = "I couldn't say. It's not a thing that comes to an anvil." } },
  },
}

---------------------------------------------------------------------------
-- Ghrawt: bowyer in Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "ghrawt", id = TODO_NPC("Ghrawt"), name = "Ghrawt", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "quiet", "exacting" }, values = { "craft", "patient" },
  notices = { "class", "pet" },
  impression = {
    first = "Ghrawt makes and sells bows in Razor Hill, and complains that Durotar grows no tree worth bending. He strings each bow himself and listens to it before he will sell it.",
    third = "{name} met Ghrawt, the bowyer of Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Bows, arrows and quivers. Draw one if you like, but don't loose it dry, or you'll buy it whether you want it or not." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you'll know what you're holding. Thotar sends me his best and his worst, and I can't yet tell which you are." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Did the string hold, or did you leave it out in the sun as I told you not to?" },
    { id = "g_away", when = { away = 14 }, text = "It has been some time. A bow left unstrung that long wants oil, and so, I think, do you." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That {pet} of yours stands on your left, so it has been taught to keep clear of your bow arm. Someone trained it properly." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your people throw axes and spears farther than most orcs can shoot, and I still don't understand how it is done." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ghrawt, and I make bows in a land with no trees, which tells you how stubborn I am. The staves come by cart from the Barrens and beyond, and I shape them here for the garrison's scouts and for any hunter with the coin." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only waiting for glue to set." },
        { id = "h_again2", text = "Ask it. A bowyer has more patience than most." },
        { id = "h_again3", text = "Go on, then, and mind the staves behind you." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "Where do you find wood in Durotar?", next = "wood" },
        { text = "Orcs aren't known as archers.", next = "archers" },
        { text = "The scouts must keep you busy.", next = "scouts" },
        { text = "What draw would you give a hunter my size?", next = "draw", when = { class = "HUNTER" } },
        { text = "Good hunting, Ghrawt.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "I don't, and that's the whole of my trouble. The trees here are thorn and scrub, fit for burning. My staves come from the Barrens oases and now and then from Ashenvale, when the Warsong send a cart south with something better than firewood on it." } },
      choices = {
        { text = "Ashenvale wood must be fine to work.", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      lines = { { id = "wo2_default", text = "It is the best I have ever had in my hands. It is straight, and old, and it bends as if it wanted to. The carters tell me the night elves kill for every tree that falls there, and when I've a stave of it on the bench I half understand them." } },
      choices = {
        { text = "Yet you still buy it.", next = "wood3" },
        { text = "Something else, Ghrawt.", next = "BACK" },
      },
    },
    wood3 = {
      big = true,
      lines = { { id = "wo3_default", text = "I do. A scout with a good bow comes home, and a scout with a thorn-wood bow may not. I've thought about what that wood costs someone else, and I've not stopped buying it, so make of that what you will." } },
      choices = {
        { text = "Our scouts come first. The elves have forest to spare.", next = "BACK", reply = "That is what I tell myself when the cart arrives. It is true enough to work by.", fx = { align = { light = -1 } } },
        { text = "A bow isn't worth a war with the elves.", next = "BACK", reply = "Perhaps not. I'd make do with oasis wood if the Warchief asked it, and I'd not be sorry to be asked.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    archers = {
      lines = { { id = "ar_default", text = "We weren't, for a long time. The old clans thought an arrow was a coward's weapon, and then we spent years in the camps with nothing in our hands at all. Now the young ones will take any weapon that works, and I think that is the better way." } },
      choices = {
        { text = "Who taught you, then?", next = "archers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    archers2 = {
      lines = { { id = "ar2_default", text = "A Darkspear, on the voyage west, with a ship's rail for a bench. He laughed at everything I made for a month. I've not seen him since we landed, but every bow on this wall has something of his in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scouts = {
      lines = { { id = "sc_default", text = "They do. Gar'Thok keeps watchers on Tiragarde Keep and on the Razormane dens, and a watcher wants to strike from far off and be gone. Takrin Pathseeker's people go through arrows faster than I can fletch them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    draw = {
      lines = { { id = "dr_default", text = "Lighter than you'd ask for. Every young hunter wants the heaviest bow on the wall, and then can't hold it at full draw long enough to aim. Take one you can hold steady while you count to ten, and Harruk will tell you the same about your beast." } },
      choices = { { text = "Steady to the count of ten. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Unstring your bow at night. It needs rest the same as you do, and it complains less about getting it." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut timber in Ashenvale for Orgrimmar's walls. What they can spare comes to me, and it is never enough." } },
    quilboar = { { id = "tp_quilboar", text = "Their hides are thick, so aim for the throat. I make a narrow-headed arrow for the purpose." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries a hammer, but I'm told he asks after the scouts by name. That is good enough for a bowyer." } },
    _none = { { id = "tp_none", text = "I don't know. I spend my days looking at wood grain, not at the world." } },
  },
}

---------------------------------------------------------------------------
-- Flakk: trade supplies in Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "flakk", id = TODO_NPC("Flakk"), name = "Flakk", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "cheerful", "talkative" }, values = { "craft", "practical" },
  notices = { "craft", "purse" },
  impression = {
    first = "Flakk sells thread, flux, vials and dyes to the craftsmen of Razor Hill and asks every customer what they are making. He remembers the answers and asks how it turned out.",
    third = "{name} met Flakk, who keeps the trade supplies in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flux, vials, dyes and a good hammer, if you've lost yours. What are you making, friend?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again! Did it turn out the way you meant it to?" },
    { id = "g_craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking", "Engineering", "Alchemy", "Cooking" } }, text = "Now there's a pair of working hands. Tell me what's on your bench and I'll tell you what you've forgotten to buy for it." },
    { id = "g_away", when = { away = 14 }, text = "It's been an age! I kept your sort of thread in stock the whole time, just in case." },
  },
  notice = {
    { id = "n_nocraft", cat = "craft", when = { maxLevel = 9 },
      text = "You've not taken up a trade yet, have you? Do it soon, young one. An orc with a craft always has a place by somebody's fire." },
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your purse is light, I can hear it. Buy the thread and leave the dye, then, because nobody ever died of a plain shirt." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Flakk. Jark sells what you carry and I sell what you make things with, and between us we've divided Razor Hill quite peacefully. Every smith, tailor and tinker in the garrison comes to me sooner or later, usually in a hurry." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I like a customer who talks." },
        { id = "h_again2", text = "Go on, ask! The shop's quiet until the forge shift ends." },
        { id = "h_again3", text = "Something more? Good, I was getting bored of counting vials." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "You seem to enjoy other people's work.", next = "enjoy" },
        { text = "Does Razor Hill have a teacher for every trade?", next = "teachers" },
        { text = "I need dyes that will hold on linen.", next = "dye", when = { profession = "Tailoring" } },
        { text = "I'll be back when I've made something.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The forge, by a long way. Dwukk's students burn through flux as if it grew on thorn bushes, and Mukdrak buys every blasting powder ingredient I can get and then asks me not to tell Gar'Thok how much." } },
      choices = {
        { text = "And do you tell him?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "bu2_default", text = "The commander has never asked, so I have never had to decide. Mukdrak is no fool, and nothing has blown up that wasn't meant to. Still, I count what he buys and I keep the count somewhere safe." } },
      choices = {
        { text = "Why keep a count at all?", next = "buyers3" },
        { text = "Something else, Flakk.", next = "BACK" },
      },
    },
    buyers3 = {
      big = true,
      lines = { { id = "bu3_default", text = "Because Orgnil Soulscar came by asking who in town buys more than their trade needs, on account of the Burning Blade. I told him nobody, which was nearly true. I've wondered since whether I should have given him the list and let him sort it." } },
      choices = {
        { text = "Give Orgnil the list. That is his duty to judge.", next = "BACK", reply = "You may be right, and it would let me sleep better. I'll think about walking it over to him.", fx = { align = { order = 1 } } },
        { text = "A shopkeeper who informs on customers has none.", next = "BACK", reply = "Ha! That's what my heart says too. Mukdrak's a friend, and I'd sooner ask him straight than hand him over.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enjoy = {
      lines = { { id = "en_default", text = "I do, more than my own, since I can't make anything myself that doesn't come out crooked. So I sell the makings and ask after the results. A tailor showed me a shirt last week dyed with my red, and I was as proud as if I'd sewn it." } },
      choices = {
        { text = "What's the strangest thing anyone made?", next = "enjoy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enjoy2 = {
      lines = { { id = "en2_default", text = "A troll from Sen'jin bought six vials and a spool of black thread and wouldn't say what for. He came back a week later looking very pleased with himself. I've decided I don't want to know, and I think about it every day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teachers = {
      lines = { { id = "te_default", text = "Not every one. Dwukk teaches smithing, Krunn mining and Mukdrak engineering, all at the forge, and Rawrk in the barracks will show you how to bind a wound. For herbs and potions you want Sen'jin, and for the rest you want Orgrimmar." } },
      choices = { { text = "That's a useful list. Something else.", next = "BACK" } },
    },
    dye = {
      lines = { { id = "dy_default", text = "Then take the red and the blue, and soak the cloth in salt water first, which costs you nothing with the sea so close. Cutac taught me that, and he has never yet had a shirt of his run in the rain, on the few days it rains." } },
      choices = { { text = "Salt water first. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy twice the thread you think you need. You'll use it, and it's a long walk back from the Barrens for a spool." } },
    burning_blade = { { id = "tp_blade", text = "Orgnil asks me about them more than I'd like. A cult needs candles and vials like anyone else, I suppose, but they don't buy them from me." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins there sell the fancier supplies, the ones I can't get. Bring a full purse and count your change." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wants a Horde that builds as well as it fights. I sell the thread for that, one spool at a time." } },
    _none = { { id = "tp_none", text = "Now that I don't know, and it pains me to admit it. Ask me again when I've had a chance to listen at the inn." } },
  },
}

---------------------------------------------------------------------------
-- Dwukk: blacksmithing trainer at the Razor Hill forge.
---------------------------------------------------------------------------
P:NPC {
  key = "dwukk", id = TODO_NPC("Dwukk"), name = "Dwukk", title = "Blacksmithing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "stern", "fair" }, values = { "craft", "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "Dwukk teaches blacksmithing at the big anvil in Razor Hill and makes every student forge a nail before anything else. He is stern about the craft and fair about everything besides.",
    third = "{name} met Dwukk, the blacksmithing trainer at the forge in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "If you've come to learn, pick up the tongs. If you've come to watch, stand where the sparks don't reach." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "You've held a hammer before, I can see it in your wrist. Show me something you've made, and don't choose your best piece." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil. Good, the iron has missed you more than I have." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") }, text = "The camp sent you to me for a smith's lesson, did it? Then roll up your sleeves, because I don't teach it by talking." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. Then you know where the metal comes from, which is half of knowing what it wants to be. Krunn has taught you well, if it was Krunn." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior who can mend what he breaks is worth two who cannot. Think on that the next time your axe comes back notched." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dwukk, and I teach the working of copper and bronze to any of the Horde who will sweat for it. My steel goes to the garrison and my students go on to Orgrimmar, and I am prouder of the second than the first." },
      },
      again = {
        { id = "h_again", text = "What else? Ask before the iron goes cold." },
        { id = "h_again2", text = "Speak, then. I'll not stop hammering for it." },
        { id = "h_again3", text = "Go on. A question is better than a guess at this anvil." },
      },
      choices = {
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "Why does every student start with a nail?", next = "nail" },
        { text = "Your steel goes to the garrison, I hear.", next = "steel" },
        { text = "Where do your students go from here?", next = "students" },
        { text = "I've copper and tin both. Show me bronze.", next = "bronze", when = { profession = { name = "Blacksmithing", min = 50 } } },
        { text = "I'll let you work, Dwukk.", next = "END" },
      },
    },
    nail = {
      lines = { { id = "na_default", text = "Because a nail is small, and it shows every fault. Anyone can beat a slab into something like an axe head. To draw a nail straight and square, you must control the heat, the hammer and your own temper, and those are the three things the craft is made of." } },
      choices = {
        { text = "How many do they make before you're satisfied?", next = "nail2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nail2 = {
      lines = { { id = "na2_default", text = "As many as it takes, and for some that is a bucketful. One young grunt made two hundred and called me a tyrant in front of the whole forge. His two hundred and first was perfect, and the barracks door is hung on his nails today." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steel = {
      lines = { { id = "st_default", text = "It does. Uhgar and Wuark finish most of it, but the stock is mine, and I know every bar. I make it for the defence of this town and the people in it, and I've told Gar'Thok to his face that I would not make it for anything less." } },
      choices = {
        { text = "What did he say to that?", next = "steel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steel2 = {
      lines = { { id = "st2_default", text = "He said the Warchief would agree with me, and that was the end of it. I forged blades for the old Horde when I was young, and I saw where they went. A smith cannot unmake what his steel has done, so he had best mind whose hand he puts it in." } },
      choices = {
        { text = "Where did those old blades go?", next = "steel3" },
        { text = "Something else, Dwukk.", next = "BACK" },
      },
    },
    steel3 = {
      big = true,
      lines = { { id = "st3_default", text = "Into villages, some of them, where nobody had a weapon to answer with. I did not swing them, and for years I told myself that made a difference. It is a question I put to every student before they leave me, and now I'll put it to you." } },
      choices = {
        { text = "The smith shares the blame. Choose who you arm.", next = "BACK", reply = "That is the answer I came to, and it took me twenty years. You've got there faster than I did.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A smith makes steel. The wielder alone answers for it.", next = "BACK", reply = "Many good smiths believe so, and sleep soundly. I could not, but I'll not call you wrong.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "su_default", text = "The good ones go to Saru Steelfury in Orgrimmar's Valley of Honor, who will teach them more than I can. The rest stay here and make nails, which the Horde also needs. There is no shame in either road." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bronze = {
      lines = { { id = "br_default", text = "Then you are past nails, and I am glad of it. Bronze wants more heat than copper and less hammering, and it will crack if you chase it. Smelt the two together at Krunn's fire, bring me the bars, and we'll begin with something that has an edge." } },
      choices = { { text = "I'll bring the bars. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Never strike cold iron in anger. You'll ruin the piece and learn nothing about what angered you." } },
    internment = { { id = "tp_internment", text = "They let no orc near a forge in the camps. I shaped a spoon handle against a stone for two years, only to keep my hands from forgetting." } },
    thrall = { { id = "tp_thrall", text = "The Warchief was taught by humans and still chose his own people's hammer. I'd make steel for that orc until my arm gave out." } },
    burning_blade = { { id = "tp_blade", text = "Their daggers are well made, and that troubles me. Somebody who knows the craft is forging for them." } },
    quilboar = { { id = "tp_quilboar", text = "They work no metal I'd call metal. What iron they carry, they took from our dead." } },
    _none = { { id = "tp_none", text = "I don't know it. I'll not guess, either, since guessing is how bad steel gets made." } },
  },
}

---------------------------------------------------------------------------
-- Harruk: pet trainer in Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "harruk", id = TODO_NPC("Harruk"), name = "Harruk", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm", "watchful" }, values = { "patient", "loyal" },
  notices = { "pet", "class" },
  impression = {
    first = "Harruk trains hunters' beasts in Razor Hill and watches the animal before he looks at its owner. He keeps scraps of boar in his belt pouch and seems to like wolves better than most orcs.",
    third = "{name} met Harruk, who trains hunters' beasts in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Come up slowly, and don't stare at the wolf. She's deciding about you, and so am I." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Bring {pet} here and let me see how it moves. A beast tells me more about its hunter in ten paces than the hunter does in an hour." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Has your beast been fed today, and I mean before you were?" },
    { id = "g_away", when = { away = 14 }, text = "It's been a long while. The wolf remembers your smell, so you're welcome." },
  },
  notice = {
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", maxLevel = 9 },
      text = "You are a hunter with no beast at your side yet. Thotar will send you out to tame one when you're ready, and then you and I will have something to talk about." },
    { id = "n_raptor", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "A raptor. The trolls of Sen'jin swear by them, and I'll grant they're clever. Keep that one fed, because a hungry raptor starts doing sums about its master." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Harruk. Thotar teaches the hunters, and I teach what walks beside them. A beast can learn to bite harder, to bear more, and to hold its ground when its blood says run, but only from a hunter who has earned it." },
        { id = "h_other", when = { class = { "WARRIOR", "ROGUE", "MAGE", "PRIEST", "SHAMAN", "WARLOCK", "DRUID" } }, text = "Harruk. I train the beasts that hunters keep, so I've no lessons for you, but I'll talk about animals with anyone who'll stand still." },
      },
      again = {
        { id = "h_again", text = "What else? Speak low, the wolf is settling." },
        { id = "h_again2", text = "Ask. I've nowhere to be until feeding time." },
        { id = "h_again3", text = "Go on. Beasts are patient, and they've taught me to be." },
      },
      choices = {
        { text = "Train my beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Teach me how to keep a beast, Harruk.", next = "k_keep", when = { class = "HUNTER" } },
        { text = "How does a beast come to trust a hunter?", next = "trust" },
        { text = "Which of Durotar's beasts makes the best companion?", next = "beasts" },
        { text = "You like wolves better than people, I think.", next = "wolves" },
        { text = "My beast won't hold when the fight turns.", next = "hold", when = { pet = { type = "Beast" } } },
        { text = "I'll leave you to the feeding, Harruk.", next = "END" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "Slowly, and through its belly first. You feed it before you eat, you never strike it for being afraid, and you never ask it to face a thing you would run from yourself. After a season of that, it will follow you into a fire." } },
      choices = {
        { text = "Some hunters must use the whip.", next = "trust2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust2 = {
      lines = { { id = "tr2_default", text = "Some do, and their beasts obey well enough until the day it matters. A whipped animal fights for as long as it fears you more than the enemy, and one day the enemy is worse. I'll not train for a hunter who beats what he keeps." } },
      choices = {
        { text = "You've turned hunters away?", next = "trust3" },
        { text = "Something else, Harruk.", next = "BACK" },
      },
    },
    trust3 = {
      big = true,
      lines = { { id = "tr3_default", text = "Two, and one of them was a sergeant who went to Gar'Thok about it. The commander told me a garrison trainer serves the garrison and doesn't pick and choose. I told him I'd serve it better with beasts that don't bolt, and we left it there." } },
      choices = {
        { text = "You were right. Some things outrank a commander.", next = "BACK", reply = "I think so, on this one matter. I'd obey him in anything else, and he knows it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A soldier doesn't choose which orders suit him.", next = "BACK", reply = "That is fairly said, and Gar'Thok said it less kindly. I still won't do it, so I suppose I'm a poor soldier.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "The boars, if you want something that will take a beating and ask for more. The scorpids are steady and their sting keeps working after the fight has moved on. The young hunters all want one of the coast crocolisks, and those do nothing they don't feel like doing." } },
      choices = {
        { text = "And beyond Durotar?", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      lines = { { id = "be2_default", text = "The Barrens has the great cats, lions and their kin, and a hunter who tames a savannah huntress has a companion for life. There are raptors there too. Go and look, and don't choose in a hurry, because the beast is choosing as well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wolves = {
      lines = { { id = "wv_default", text = "I do, and I'll not pretend otherwise. A wolf has never lied to me. Orcs and wolves have run together since Draenor, and when the clans lost nearly everything else, the wolves were still there, which is more than I can say for our honor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_keep = {
      hub = true,
      narr = "He takes a strip of dried boar from the pouch at his belt and turns it over in his fingers while he talks.",
      lines = {
        { id = "kk_default", text = "Taming a beast takes a moment, and keeping one takes the rest of your life, or the rest of its. Ask me what you like about the keeping, because that is the half Thotar leaves to me." },
        { id = "kk_new", when = { maxLevel = 14, pet = { type = "Beast" } }, text = "Your {pet} is new to you, and it is still deciding whether you are worth staying for. Ask me what you like about the keeping, and listen well, because it is listening to you." },
        { id = "kk_nopet", when = { maxLevel = 9 }, text = "You have no beast yet, so this is all talk to you. Listen anyway, because the hunters who listen before their first taming lose fewer beasts after it." },
      },
      again = {
        { id = "kk_again", text = "What else about the keeping? The wolf is asleep, so we have time." },
        { id = "kk_again2", text = "Go on. Every question you ask me is one your beast does not have to answer the hard way." },
      },
      choices = {
        { text = "What should I feed it?", next = "k_feed" },
        { text = "How does a beast grow loyal?", next = "k_loyal" },
        { text = "How does my beast learn new tricks?", next = "k_learn" },
        { text = "My beast fell in a fight. I left it there.", next = "k_left", when = { minLevel = 10 } },
        { text = "Orcs and wolves go back to Draenor, you said.", next = "k_wolf", when = { race = "Orc" } },
        { text = "Enough about the keeping, Harruk.", next = "BACK" },
      },
    },
    k_feed = {
      lines = {
        { id = "kf_default", text = "What it would eat in the wild, and never what is easiest for you. A boar eats anything, a wolf or a cat wants meat, a crab wants fish, and a scorpid wants meat and does not care how old it is, which is the only easy thing about a scorpid." },
        { id = "kf_cat", when = { pet = { family = "Cat" } }, text = "Meat, and fish when you have it, and never the same tough strip every day, because a cat sulks over its supper like a chieftain over his tribute. A well-fed cat fights twice as hard as a hungry one, and it knows the difference before you do." },
        { id = "kf_raptor", when = { pet = { family = "Raptor" } }, text = "Meat, and plenty of it, because a raptor's hunger does not stop at its belly. Feed it before every fight, and if you ever see it watching you over a cookfire, feed it then too." },
      },
      choices = {
        { text = "And if I run out of food in the wild?", next = "k_feed2" },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_feed2 = {
      big = true,
      lines = { { id = "kf2_default", text = "Then you hunt for it before you hunt for yourself, and you go to sleep hungry if you must. A hunter who eats while his beast watches has told it plainly which of them matters, and beasts remember that sort of thing longer than we do." } },
      choices = {
        { text = "My beast eats first. Always.", next = "k_keep", reply = "Then it will follow you into fire, and one day it will have to. That is the bargain.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter who starves can't protect anything.", next = "k_keep", reply = "That is true, and it is also what every hunter says on the night he eats first. Be honest about which night it is.", fx = { align = { light = -1 } } },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_loyal = {
      lines = { { id = "kl_default", text = "Slowly, from rebellious to unruly to something you can trust, and it only moves forward while it is happy. Keep it fed, keep it fighting beside you, and never let it go long unhappy, because an unhappy beast stops growing loyal and starts thinking about the hills." } },
      choices = {
        { text = "Has a beast ever left you, Harruk?", next = "k_loyal2" },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_loyal2 = {
      lines = { { id = "kl2_default", text = "One, a young wolf, when I was not much older than you and thought a beast should feed itself between fights. I woke one morning and the rope was chewed through, and I have kept scraps in this pouch every day since." } },
      choices = {
        { text = "That's a hard lesson. Back to the keeping.", next = "k_keep", fx = { affinity = 1 } },
      },
    },
    k_learn = {
      lines = {
        { id = "kln_default", text = "Two ways. Some things I teach it here, like the growl that draws an enemy off you and the hide that turns a blade, and the rest it learns from other beasts. Tame a wild animal that already knows a bite or a claw, and while it is bound to you, your own beast learns it by watching." },
        { id = "kln_trained", when = { questDone = TODO_QUEST("Training the Beast") }, text = "You already know how, because Ormak taught you to train what you tame. So go and tame the beasts that bite harder than yours, keep them a day, let them go, and bring what they taught you back to me." },
      },
      choices = {
        { text = "Taming a beast just to let it go seems cold.", next = "k_learn2" },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_learn2 = {
      big = true,
      lines = { { id = "kln2_default", text = "It is not kind, I will grant you, and some hunters will not do it at all. The wild beast loses a day and gains nothing, and your companion gains a lesson that might save both your lives in the Barrens." } },
      choices = {
        { text = "My beast's life matters more than a stranger beast's day.", next = "k_keep", reply = "That is how most hunters see it, and I have never turned one away for it. Let them go gently, at least.", fx = { align = { order = 1 } } },
        { text = "I'll not bind a beast I don't mean to keep.", next = "k_keep", reply = "Then your beast will learn slower, and you will both be the better for the slowness, in your own way. I respect it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_left = {
      lines = { { id = "kle_default", text = "Then go back for it, if you can still reach it, because a fallen beast can be called back with the right words and a little time. A hunter who leaves his companion on the field and calls a new one the next morning will find the next one does not trust him either." } },
      choices = {
        { text = "I'll go back for it.", next = "k_keep", reply = "Good. It would have come back for you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It was only a beast. There are others.", next = "k_keep", reply = "There are, and every one of them can smell what you just said. Keep that in mind when the next one sulks.", fx = { align = { honor = -1 } } },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_wolf = {
      lines = { { id = "kw_default", text = "They do, and in Alterac the Frostwolves still raise their pups beside their children, so that each knows the other's smell before either can walk. The Warchief was raised by humans, but he went to the Frostwolves to find himself, and he came back riding one of their wolves." } },
      choices = {
        { text = "Should every orc hunter keep a wolf?", next = "k_wolf2" },
        { text = "Back to the keeping.", next = "k_keep" },
      },
    },
    k_wolf2 = {
      lines = { { id = "kw2_default", text = "No, and I would be a poor trainer if I said so. A wolf will not stand still for you, and a scorpid will, and some orcs need a beast that holds the line more than one that runs with them. Keep the beast that suits the hunter you are, not the one your grandfather would have kept." } },
      choices = {
        { text = "Sound counsel. Back to the keeping.", next = "k_keep" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "Then it has seen you step back at the wrong moment, and it has learned from you. A beast holds as long as its hunter does. Stand your ground the next three fights, whatever it costs you, and watch what {pet} does on the fourth." } },
      choices = { { text = "I'll stand, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Feed your beast before you feed yourself. It notices, and it remembers." } },
    quilboar = { { id = "tp_quilboar", text = "They keep boars as we keep wolves, and they treat them better than they treat each other. I can respect that much in them." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rides a frost wolf of the old blood. I've seen her once, and I've not seen her equal." } },
    centaur = { { id = "tp_centaur", text = "They hunt with hyenas in the Barrens. A hyena is a fine beast in bad company." } },
    _none = { { id = "tp_none", text = "I don't know. If it had four legs I might, but it sounds as though it doesn't." } },
  },
}

---------------------------------------------------------------------------
-- Kitha: demon trainer in Razor Hill.
---------------------------------------------------------------------------
P:NPC {
  key = "kitha", id = TODO_NPC("Kitha"), name = "Kitha", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "cool", "sardonic" }, values = { "discipline", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "Kitha trains warlocks' demons in Razor Hill, a cool-eyed orc woman who keeps her grimoires locked and her voice low. She finds the garrison's unease about her amusing and useful in equal parts.",
    third = "{name} met Kitha, who trains warlocks' demons in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "You walked straight to me without looking over your shoulder. Either you're a warlock, or you've no idea what I teach." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Dhugru said he'd be sending someone. Let me see the demon first and you second, since that's the order that matters." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and nothing is following you that shouldn't be, which is a good beginning." },
    { id = "g_away", when = { away = 14 }, text = "It has been a while. A demon grows bold when its master grows lazy, so I hope you've kept in practice." },
  },
  notice = {
    { id = "n_void", cat = "fel", when = { pet = { family = "Voidwalker" } },
      text = "That voidwalker stands behind you without being told. You've been to Gan'rul, then, and you listened to him, which not all of them do." },
    { id = "n_succ", cat = "fel", when = { pet = { family = "Succubus" } },
      text = "Your succubus is looking at my grimoires as if they owed her money. Keep her on your side of the table, if you'd be so kind." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You're a priest, I see. Tai'jin's kind and mine share a wall in this town and very little else, though she's always civil about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kitha. Dhugru Gorelust teaches the warlocks of Razor Hill their spells, and I teach their demons manners, and the grimoires are mine to sell to those who can show me they'll read them carefully." },
        { id = "h_other", when = { class = { "WARRIOR", "HUNTER", "ROGUE", "MAGE", "PRIEST", "SHAMAN", "DRUID", "PALADIN" } }, text = "I am Kitha, and I train demons for the warlocks of this garrison. I've nothing to teach you, but you may ask what the grunts are too nervous to ask." },
        { id = "h_imp", when = { class = "WARLOCK", maxLevel = 9 }, text = "I am Kitha. Dhugru will make a proper warlock of you, and when Ophek sends you on to the Cleft and you come home with a voidwalker, come straight to me, because that's when my work starts." },
        { id = "h_void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } }, text = "I am Kitha, and that voidwalker behind you is the reason we'll be talking a great deal. It already knows Torment, and the rest it will give up only when you show it the right page." },
      },
      again = {
        { id = "h_again", text = "What else? I've time, and so few people use it." },
        { id = "h_again2", text = "Ask. I don't bite, and nothing in here bites without my leave." },
        { id = "h_again3", text = "Go on. You've not flinched yet, which is more than the quartermaster manages." },
      },
      choices = {
        { text = "Show me your grimoires. I want something with teeth.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "How does a garrison town take to a demon trainer?", next = "town" },
        { text = "A voidwalker must be harder to rule than an imp.", next = "void" },
        { text = "You and Dhugru divide the teaching between you.", next = "dhugru" },
        { text = "My voidwalker sulks when I dismiss it. Should I let it?", next = "sulk", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "What can I teach my voidwalker?", next = "vbooks", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "You're too young to have served Gul'dan.", next = "camps" },
        { text = "I'll take my leave, Kitha.", next = "END" },
      },
    },
    town = {
      lines = { { id = "to_default", text = "Warily, and I don't blame it. The grunts salute Dhugru because he wears a rank and walk around me in a wide half-circle, and then one of them sees a voidwalker take a Razormane charge that would have killed three soldiers, and the half-circle gets a little smaller." } },
      choices = {
        { text = "Does the wariness trouble you?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "to2_default", text = "No. I'd be troubled if they stopped being wary, because then they'd have forgotten what demons did to us, and I want them uneasy and alive, and I can give them both." } },
      choices = {
        { text = "And Orgnil Soulscar? He hunts cultists here.", next = "town3" },
        { text = "Let's talk about something else, Kitha.", next = "BACK" },
      },
    },
    town3 = {
      big = true,
      lines = { { id = "to3_default", text = "Orgnil visits me every few days and looks at my shelves. He's never accused me of anything and he never quite stops looking, and I let him, since I've nothing to hide, though Dhugru says I should be insulted on behalf of every loyal warlock in the Horde." } },
      choices = {
        { text = "Let him look. Trust is earned under watch.", next = "BACK", reply = "That's my thinking as well. A warlock who resents being watched has usually given cause.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dhugru is right. Loyalty shouldn't be searched weekly.", next = "BACK", reply = "Perhaps, but the Burning Blade recruits from people who feel just that way, so I'll keep my temper and let him count my books.", fx = { align = { order = -1 } } },
        { text = "Back to the demons, then.", next = "BACK" },
      },
    },
    void = {
      lines = { { id = "vo_default", text = "It's harder and simpler both. An imp argues with every word you say, but a voidwalker says almost nothing, and so you never learn what it thinks of you until the moment your hold slips." } },
      choices = {
        { text = "What happens when the hold slips?", next = "void2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    void2 = {
      narr = "She goes very still for a moment, head tilted, as if showing you rather than telling you.",
      lines = { { id = "vo2_default", text = "It stands still for a moment and looks at you, and that moment is all the warning you'll get. I teach my students to end the summoning at once and ask their questions afterward, because pride has killed more warlocks than demons have." } },
      choices = { { text = "End it first, wonder later.", next = "BACK", reply = "That's all of it. The rest is grimoires and patience." } },
    },
    vbooks = {
      lines = { { id = "vb_default", text = "Torment makes the enemy look at it instead of you, and Sacrifice lets it give up its own substance to shield you, once, before it goes back to the Nether. Suffering and Consume Shadows come later, and the trick is calling the right one before you need it, because a voidwalker obeys slowly." } },
      choices = {
        { text = "It gives itself up for me? Why?", next = "vbooks2" },
        { text = "Show me those pages, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vbooks2 = {
      big = true,
      lines = { { id = "vb2_default", text = "Because you tell it to, and it can't refuse. It doesn't love you, whatever the young ones like to believe; it's a shield that remembers being used, and some warlocks spend them like arrows while others can't bring themselves to do it at all. Which kind are you?" } },
      choices = {
        { text = "A shield is meant to break. I'll spend it.", next = "BACK", reply = "Honest, and useful. Just don't spend it out of habit, or you'll find yourself alone at the moment you most need a wall.", fx = { align = { light = -1 } } },
        { text = "Only when there's truly no other way.", next = "BACK", reply = "Then you'll hesitate one day when you shouldn't, and I hope you live through it. Still, I'd rather teach you than the other kind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I haven't had to choose yet.", next = "BACK", reply = "You will, and probably in the Barrens. Decide before you get there." },
      },
    },
    dhugru = {
      lines = { { id = "dh_default", text = "We do. He was a warlock of the old Horde and came through it with his mind his own, which few did, and the garrison respects him for that. I'm younger and learned the craft after the camps, so he takes the spells and the speeches, and I take the leash work." } },
      choices = { { text = "Back to the other questions, then.", next = "BACK" } },
    },
    camps = {
      narr = "She taps one knuckle twice on the locked grimoire case, an old habit.",
      lines = { { id = "ca_default", text = "Far too young, and glad of it. I was born behind a stockade in the camps and never saw a demon until I was grown, and I learned the craft from Dhugru and from books copied in secret, so I have the knowledge without the memories. The grunts trust me less for that, oddly." } },
      choices = {
        { text = "Does it matter, not having the memories?", next = "camps2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps2 = {
      lines = { { id = "ca2_default", text = "It matters to Dhugru, who thinks I'm missing the part that keeps a warlock afraid. I think he carries a fear that belongs to dead orcs and that it makes his hands shake, and we've had that argument for years and will have it again tonight." } },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", reply = "Don't tell him so. He'd take it as a victory, and he's insufferable when he wins." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    sulk = {
      lines = { { id = "su_default", text = "It isn't sulking. It's measuring how long you kept it and what you made it do, and it will remember the sum, so dismiss it cleanly, the same way every time, and never thank it, because a demon hears thanks as weakness." } },
      choices = { { text = "Cleanly, and without thanks. Let's move on.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Be more careful on the day you feel most sure of yourself. That's the day they wait for." } },
    burning_blade = { { id = "tp_blade", text = "They tell young warlocks the Horde will never trust them, and then offer a place that will. It's a good lie, because half of it is true." } },
    thrall = { { id = "tp_thrall", text = "The Warchief permits us and watches us, and I think the better of him for doing both." } },
    neeru = { { id = "tp_neeru", text = "Neeru Fireblade speaks for the warlocks in the Cleft of Shadow. He's very smooth, and I've never heard him say a thing he couldn't deny later." } },
    _none = { { id = "tp_none", text = "I don't know that, and I'm careful about pretending to knowledge I haven't got." } },
  },
}

---------------------------------------------------------------------------
-- Mukdrak: engineering trainer at the Razor Hill forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mukdrak", id = TODO_NPC("Mukdrak"), name = "Mukdrak", title = "Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "eager", "stubborn" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Mukdrak teaches engineering beside the Razor Hill forge with a bench full of half-built things and powder burns on his apron. He is an orc who fell in love with goblin machines and has been arguing with other orcs about it ever since.",
    third = "{name} met Mukdrak, the orc engineering trainer in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Don't lean on the bench, some of it is loaded. Have you come to learn, or to tell me orcs shouldn't tinker?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Come and look at this and tell me why it jams, because I've been staring at it since dawn." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Good, hold this spring while I find the other half of it." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Engineering") }, text = "The camp wants you taught a tinker's lesson, does it? Then you've come to the only orc in Razor Hill who'll give you one gladly." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin, in Razor Hill! Sit down, please, and tell me what I'm doing wrong, and tell me slowly so I can write it down." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You mine. Then save me your copper, every bar, because Krunn sends all of his to the smiths and I'm left with the sweepings." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Mukdrak. I teach engineering, which the goblins invented and which the Horde had better learn before the next war, whatever the old warriors say. Copper tubes, blasting powder, a little patience, and you can do with one hand what used to take a warband." },
      },
      again = {
        { id = "h_again", text = "What else? Talk, I only need my hands for this part." },
        { id = "h_again2", text = "Go on. If something hisses, step back, but otherwise go on." },
        { id = "h_again3", text = "Ask away. I'd sooner talk about this than nearly anything." },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "How does an orc come to love machines?", next = "love" },
        { text = "The garrison doesn't share your enthusiasm.", next = "garrison" },
        { text = "What are you building on that bench?", next = "bench" },
        { text = "I've made rough bombs. What comes after?", next = "after", when = { profession = { name = "Engineering", min = 50 } } },
        { text = "Mind your fingers, Mukdrak.", next = "END" },
      },
    },
    love = {
      lines = { { id = "lo_default", text = "I watched goblin shredders clear a hillside in Ashenvale in a morning, when I was hauling timber for the Warsong. A hundred peons couldn't have done it in a week. I walked up to the nearest goblin and asked him how, and he charged me for the answer." } },
      choices = {
        { text = "Was the answer worth the price?", next = "love2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    love2 = {
      lines = { { id = "lo2_default", text = "Every copper. I spent two seasons in Ratchet sweeping floors for a tinker, and he taught me between explosions. Then I came home to teach it, and found that most orcs think a thing made of springs is beneath a warrior's notice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ratchet" } } } },
    },
    garrison = {
      lines = { { id = "ga_default", text = "No, and Gar'Thok least of all. I showed him a blunderbuss I'd built and offered to make twenty for the watch on Tiragarde Keep, where the marines shoot our scouts from the walls. He handed it back and said an orc looks his enemy in the eye." } },
      choices = {
        { text = "The marines don't trouble to look.", next = "garrison2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrison2 = {
      lines = { { id = "ga2_default", text = "That is exactly what I said, and it did me no good. Wuark sees it, because he mends the mail the rifle balls go through. But Wuark doesn't command Razor Hill, and so I make dynamite for clearing rock and keep my opinions for the forge." } },
      choices = {
        { text = "Would you arm the watch without leave?", next = "garrison3" },
        { text = "Something else, Mukdrak.", next = "BACK" },
      },
    },
    garrison3 = {
      big = true,
      lines = { { id = "ga3_default", text = "I've thought about it, on the nights a scout doesn't come back. I could put six rifles in a cart and nobody would ask. I haven't done it, and I can't tell you whether that's discipline or only nerves." } },
      choices = {
        { text = "Don't. An army can't have every smith deciding alone.", next = "BACK", reply = "No, it can't. I know it, and I'd know it better if the scouts stopped dying.", fx = { align = { order = 1 } } },
        { text = "Send the cart. Lives outweigh a commander's pride.", next = "BACK", reply = "Spirits, don't tempt me. But I'm glad someone else thinks it, and I'll sleep on it again.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bench = {
      lines = { { id = "be_default", text = "That one's a spyglass, or will be when the lenses come from Ratchet. The square thing is a target dummy that keeps falling over, and the thing under the cloth I'd rather not discuss until I know whether it works. Flakk sells me the powder for all of it and worries." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "Then you've still got both hands, and you're ready for bronze. Tubes, gears, a proper flash bomb. Get tin from the Barrens, and when you've outgrown me, the goblins in Ratchet or Roxxik in Orgrimmar will take you further than I can." } },
      choices = { { text = "Tin, then bronze. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Measure the powder twice. I measured once, the first year, and I had no eyebrows until the spring." } },
    ratchet = { { id = "tp_ratchet", text = "The best tinkers on this coast are there, and they'll teach anyone who pays. I swept floors in that town and I'd do it again." } },
    venture_company = { { id = "tp_venture", text = "Goblins of another sort. They use the same machines I admire to strip land bare, and I don't like what that says about the machines." } },
    thrall = { { id = "tp_thrall", text = "The Warchief hired goblins to help build Orgrimmar. He sees what a machine is worth, even if his commanders don't." } },
    warsong = { { id = "tp_warsong", text = "I hauled timber for them in Ashenvale. They're hard orcs doing hard work, and they'd have welcomed a shredder or two." } },
    _none = { { id = "tp_none", text = "I don't know. Unless it has moving parts, I likely never looked closely." } },
  },
}

---------------------------------------------------------------------------
-- Rawrk: first aid trainer in the Razor Hill barracks.
---------------------------------------------------------------------------
P:NPC {
  key = "rawrk", id = TODO_NPC("Rawrk"), name = "Rawrk", title = "First Aid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "brusque", "kind" }, values = { "duty", "practical" },
  notices = { "wounds", "class" },
  impression = {
    first = "Rawrk teaches bandaging in the Razor Hill barracks and has little time for anyone who thinks a wound is a mark of honor. He is rough in speech and very gentle with his hands.",
    third = "{name} met Rawrk, who teaches first aid in the barracks at Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Are you bleeding? No? Then sit down and learn how to stop someone else's." },
    { id = "g_sick", when = { resSick = true }, text = "You look like something the spirit healer sent back unfinished. Sit, drink water, and don't argue with me." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and walking on both legs. I'll count that as a lesson remembered." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: First Aid") }, text = "The camp sent you for a bandaging lesson? Good. It's the only craft there that'll save your life rather than fill your belly." },
  },
  notice = {
    { id = "n_hurt", cat = "wounds", when = { durability = { max = 0.3 } },
      text = "Your armor's in ribbons, so I can guess what's under it. Let me look before you tell me it's nothing, because it's always nothing until it festers." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID" } },
      text = "You heal with magic, I know. Learn the linen anyway, because there comes a day you've nothing left to cast and a friend still bleeding." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Rawrk. I bind what the Razormane and the marines open up, and I teach the grunts to do it for each other, since I can't be on every patrol. Clean linen, a tight wrap and a steady hand, and most of them live to complain about it." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I've dressings to boil." },
        { id = "h_again2", text = "Ask. Nobody's bleeding on my floor just now." },
        { id = "h_again3", text = "Go on, then. I talk while I roll bandages, I always have." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "What wounds does the garrison bring you most?", next = "wounds" },
        { text = "Some orcs think a bandage is a weakness.", next = "weakness" },
        { text = "Where does your linen come from?", next = "linen" },
        { text = "I've only linen. What do I use for worse wounds?", next = "worse", when = { minLevel = 15 } },
        { text = "I'll try not to need you, Rawrk.", next = "END" },
      },
    },
    wounds = {
      lines = { { id = "wo_default", text = "Quilboar thorns, more than anything. They break off under the skin and go bad in a day if you don't cut them out. After that it's scorpid stings from the green recruits, and rifle wounds from Tiragarde, which are the ones I hate." } },
      choices = {
        { text = "Why those above the rest?", next = "wounds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds2 = {
      lines = { { id = "wo2_default", text = "Because the ball stays inside, and I've no tools fine enough to go after it. Tai'jin does what she can with her prayers, and some of them walk again. The others I make comfortable, and I sit with them, because someone ought to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    weakness = {
      lines = { { id = "we_default", text = "Some do, the young and the loud. I had a grunt in here refuse a wrap on a split thigh because scars are for showing. I told him a scar is what you get when you live, and what he was after was a grave." } },
      choices = {
        { text = "Did he take the bandage?", next = "weakness2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weakness2 = {
      lines = { { id = "we2_default", text = "He did, once Tarshaw had a word with him. But it is the old thinking and it dies hard. In the old Horde you fought until you dropped and nobody carried you, and plenty still believe that was strength." } },
      choices = {
        { text = "Wasn't it strength, of a kind?", next = "weakness3" },
        { text = "Something else, Rawrk.", next = "BACK" },
      },
    },
    weakness3 = {
      big = true,
      lines = { { id = "we3_default", text = "It was waste. I saw good warriors left in the mud who'd have fought again in a month with one clean dressing. The Horde we have now carries its wounded home, and I'd say that makes us harder to beat, though you'll find orcs who call it softness." } },
      choices = {
        { text = "A Horde that carries its wounded is the stronger one.", next = "BACK", reply = "Good. Say that in the barracks, and say it loudly, because they've stopped hearing it from me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The weak slow the strong. The old way was harder.", next = "BACK", reply = "Then pray you're never the one on the ground. I'd bandage you all the same, and I'd not be gentle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    linen = {
      lines = { { id = "li_default", text = "Off the Kul Tiras men and the Burning Blade, for the most part. The recruits bring me scraps by the armful, and Cutac sends over his offcuts. I boil all of it before it goes near a wound, whatever anyone tells you about spit and dust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worse = {
      lines = { { id = "wr_default", text = "Wool, when you can get it, and after wool, silk. The humanoids out in the Barrens and beyond carry both. When you've outgrown what I know, find Arnok in Orgrimmar's Valley of Spirits, who has forgotten more than I ever learned." } },
      choices = { { text = "Wool, then silk. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Carry bandages even when you feel strong. Nobody ever bled less for being confident." } },
    quilboar = { { id = "tp_quilboar", text = "Their thorns go bad faster than any wound I know. If one breaks off in you, cut it out the same day." } },
    internment = { { id = "tp_internment", text = "There were no healers for us in the camps. I learned on my own kin, with rags, and I lost more than I saved." } },
    thrall = { { id = "tp_thrall", text = "The Warchief asked that every garrison keep someone like me. Before him, nobody had thought an orc's life worth a roll of cloth." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it isn't bleeding, it isn't my business." } },
  },
}

---------------------------------------------------------------------------
-- Ophek: sends young orc warlocks on to Gan'rul Bloodeye (Gan'rul's Summons).
---------------------------------------------------------------------------
P:NPC {
  key = "ophek", id = TODO_NPC("Ophek"), name = "Ophek",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "grave", "watchful" }, values = { "discipline", "loyal" },
  notices = { "class", "fel" },
  impression = {
    first = "Ophek waits in Razor Hill for the young warlocks coming up from the valley and decides which of them Gan'rul Bloodeye should see. He is a grave, quiet orc who seems to weigh every word before he lets it go.",
    third = "{name} met Ophek, who carries Gan'rul Bloodeye's summons to the young warlocks of Durotar.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone searching for a trainer. If your craft is the one I think it is, we should speak, and if it isn't, I'll not keep you." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "I have been watching the road for you, warlock. Word of each of Nartok's students comes up from the valley before the student does." },
    { id = "g_active", when = { questActive = TODO_QUEST("Gan'rul's Summons") }, text = "You are still in Razor Hill. Gan'rul Bloodeye is not an orc who enjoys waiting, and the Cleft of Shadow is no farther than it was yesterday." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again. I'm still at my post, as you see." },
  },
  notice = {
    { id = "n_imp", cat = "fel", when = { pet = { family = "Imp" } },
      text = "Your imp has gone quiet since you walked up. It knows whom I serve, and it would rather I didn't remember its name." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Swart and I nod to one another across the square, and that is as far as it goes. We each think the other is playing with fire, and we are each right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ophek. I serve Gan'rul Bloodeye, who leads the warlocks of Orgrimmar from the Cleft of Shadow, and I stand here so that no young summoner leaves Durotar without his eyes having been on them." },
        { id = "h_before", when = { all = { { class = "WARLOCK" }, { questBefore = TODO_QUEST("Gan'rul's Summons") } } },
          text = "I am Ophek, and I serve Gan'rul Bloodeye. You have commanded an imp long enough, and when you are ready for something greater, he will want to see you in the Cleft of Shadow. I am the one who decides when that is." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Gan'rul's Summons") },
          text = "You have your summons. Go north to Orgrimmar and down into the Cleft of Shadow, where the light doesn't reach, and ask for Gan'rul Bloodeye by name. Be respectful, and be brief." },
        { id = "h_done", when = { questDone = TODO_QUEST("Gan'rul's Summons") },
          text = "So you have stood before Gan'rul, and he found you worth his time. Few things I do here please me more than sending him one who comes back stronger." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I am in no hurry." },
        { id = "h_again2", text = "Speak. I watch the road, but I can listen while I do." },
        { id = "h_again3", text = "Go on. There are no foolish questions in this craft, only fatal ones." },
      },
      choices = {
        { text = "Who is Gan'rul Bloodeye?", next = "ganrul" },
        { text = "You watch every warlock who leaves the valley.", next = "watch" },
        { text = "What waits for me after the imp? Something stronger, I hope.", next = "void", when = { class = "WARLOCK" } },
        { text = "Why does Razor Hill suffer warlocks at all?", next = "suffer" },
        { text = "I have stood before Gan'rul. He was not gentle.", next = "after", when = { questDone = TODO_QUEST("Gan'rul's Summons") } },
        { text = "I'll go, Ophek.", next = "END" },
      },
    },
    ganrul = {
      lines = { { id = "ga_default", text = "He is the eldest of us in Orgrimmar, and the one the Warchief holds answerable for all the rest. He was a warlock in the old Horde and saw what the craft did to our people from the inside. He teaches it now so that it will not happen again." } },
      choices = {
        { text = "What is he like to face?", next = "ganrul2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ganrul2 = {
      lines = { { id = "ga2_default", text = "He is hard, and he sees quickly. He will ask you one question and know from the answer whether you rule your demon or flatter it. Do not try to impress him, because every student tries, and it bores him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "wa_default", text = "I do, and I make no secret of it. Ruzan tests them in the valley, Nartok and Hraug teach them, and by the time they reach me I have heard how each one holds a leash. Most I send on to Gan'rul, and a few I send back to learn patience." } },
      choices = {
        { text = "And the ones who fit neither?", next = "watch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch2 = {
      lines = { { id = "wa2_default", text = "There have been two, since I took this post. They were clever and impatient, and they asked me what the demons could offer them, when they should have asked what they could take from the demons. I gave their names to Orgnil Soulscar." } },
      choices = {
        { text = "What became of them?", next = "watch3" },
        { text = "Something else, Ophek.", next = "BACK" },
      },
    },
    watch3 = {
      big = true,
      lines = { { id = "wa3_default", narr = "He looks toward the hills to the north for a moment before he answers.", text = "One came to his senses, and teaches now. The other was found among the Burning Blade at Skull Rock, and did not come home. I have asked myself whether naming him drove him there, and I have no answer I trust." } },
      choices = {
        { text = "You did your duty. He chose his own road.", next = "BACK", reply = "So Gan'rul told me, and in the same words. I hold to it, most days.", fx = { align = { order = 1 } } },
        { text = "A young one watched as a traitor may become one.", next = "BACK", reply = "That is the thought that keeps me company at night. I'll not dismiss it only because it is uncomfortable.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    void = {
      lines = {
        { id = "vo_default", text = "A servant from the Void itself, silent and strong, that will stand between you and a blow meant to kill you. It is not given, and Gan'rul will make you take it. I'll say no more than that, because the telling is his." },
        { id = "vo_low", when = { maxLevel = 9 }, text = "More than you are ready for today. Go on with your imp until it obeys you without your raising your voice, and then come back to me, and I will have a summons for you." },
      },
      choices = { { text = "Then I'll be ready. Something else.", next = "BACK" } },
    },
    suffer = {
      lines = { { id = "sf_default", text = "Because the Warchief is wise enough to know that the craft will be practised whether he allows it or not. Better it is done here, in the open, under Dhugru's eye and mine, than in a cave with the Burning Blade doing the teaching." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    after = {
      lines = { { id = "af_default", text = "He is gentle with nobody, and least of all with those he thinks have promise. Take it as the praise it is. Kitha here will train your voidwalker now, and you would do well to listen to her, since she misses nothing." } },
      choices = { { text = "I'll go to Kitha. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Ask what a thing will cost before you ask what it can do. That one habit has kept me alive." } },
    burning_blade = { { id = "tp_blade", text = "They are warlocks who decided the leash was a nuisance. The demons agreed with them, and now hold the other end." } },
    neeru = { { id = "tp_neeru", text = "Neeru Fireblade keeps a tent in the Cleft of Shadow, near Gan'rul. He is well spoken of, and I am told he is helpful to the young." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave us a place in Orgrimmar and a condition with it, that we police our own. I am part of how that condition is kept." } },
    _none = { { id = "tp_none", text = "I don't know of it. My watch is narrow, and I keep to it." } },
  },
}

---------------------------------------------------------------------------
-- Furl Scornbrow: the watchtower above Razor Hill (Carry Your Weight).
---------------------------------------------------------------------------
P:NPC {
  key = "furl", id = TODO_NPC("Furl Scornbrow"), name = "Furl Scornbrow",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "wry", "idle" }, values = { "duty", "craft" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Furl Scornbrow keeps the watchtower on the hill above Razor Hill, with a signal horn he seldom has cause to blow. He has taken to sewing bags for young adventurers to fill the quiet hours, and is a little embarrassed by how much he enjoys it.",
    third = "{name} met Furl Scornbrow, the watchman above Razor Hill who sews bags for young adventurers.",
  },
  greetings = {
    { id = "g_default", text = "You climbed the hill, so either you've news of an invasion or you've heard about the bags. I'm hoping for the bags." },
    { id = "g_active", when = { questActive = TODO_QUEST("Carry Your Weight") }, text = "Have you my canvas yet? Eight good scraps off the Kul Tiras men at Tiragarde Keep, and mind they're not too badly cut about." },
    { id = "g_done", when = { questDone = TODO_QUEST("Carry Your Weight") }, text = "There's the one with my bag on their shoulder! Has the stitching held? Tell me the truth, I can take it." },
    { id = "g_back", when = { metBefore = true }, text = "Back up the hill, are you? Nothing has invaded since you left, I'm sorry to say." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 7 },
      text = "You're carrying everything you own in your arms, near enough. That won't do on the road to the Crossroads, young one, and I may be able to help." },
    { id = "n_tailor", cat = "kit", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "You work with a needle yourself, by your fingers. Don't look too closely at my seams, then. I'm a watchman who sews, not the other way about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Furl Scornbrow, of the Razor Hill watch. From this tower I can see the road to Orgrimmar, the road to Sen'jin and half the coast, and if anything comes at the town, I blow this horn. It has been a quiet posting lately." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Carry Your Weight") },
          text = "Furl Scornbrow, of the Razor Hill watch. I keep the horn, and when there's nothing to blow it at, I sew. If you could fetch me eight canvas scraps from the sailors at Tiragarde Keep, I'd stitch you a bag fit for the Barrens road." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Carry Your Weight") },
          text = "The Kul Tiras men carry canvas for their sails and tents, and it's the best cloth in Durotar. Tiragarde Keep is on the coast, south and east of here. Bring me eight scraps and leave the sewing to me." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Carry Your Weight"), days = 3 } },
          text = "That bag will hold more than you think, and it'll outlast your boots. Fill it with something worth carrying, {name}." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing but time and thread up here." },
        { id = "h_again2", text = "Go on. The horizon's empty, I just looked." },
        { id = "h_again3", text = "Ask away. You're the best company I've had since the last supply cart." },
      },
      choices = {
        { text = "How often do you blow that horn?", next = "horn" },
        { text = "A watchman who sews bags is a strange thing.", next = "bags" },
        { text = "What can you see from up here?", next = "view" },
        { text = "Why canvas from the Kul Tiras men?", next = "canvas", when = { questActive = TODO_QUEST("Carry Your Weight") } },
        { text = "I sew as well. Sailcloth is hard on a needle.", next = "needle", when = { profession = "Tailoring" } },
        { text = "Keep watching, Furl.", next = "END" },
      },
    },
    horn = {
      lines = { { id = "ho_default", text = "Less every season. When Razor Hill was a row of tents I blew it twice a week, for quilboar, for centaur, once for a ship's landing party. Now Durotar is settled and patrolled, and the horn mostly gathers dust and the odd wasp." } },
      choices = {
        { text = "You sound as if you miss the danger.", next = "horn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horn2 = {
      lines = { { id = "ho2_default", text = "I miss being needed, which isn't quite the same. A watchman on a quiet hill starts to wonder what he's for. That's how the sewing began, if you want the truth of it." } },
      choices = {
        { text = "Has Gar'Thok thought of moving you?", next = "horn3" },
        { text = "Something else, Furl.", next = "BACK" },
      },
    },
    horn3 = {
      big = true,
      lines = { { id = "ho3_default", text = "He offered me a place on the Tiragarde watch, where there is fighting to be had. I told him I'd think about it, and I've been thinking for a month. Someone has to hold this horn, but I'm not sure it has to be an orc who can still swing an axe." } },
      choices = {
        { text = "Take the posting. A warrior belongs where the fight is.", next = "BACK", reply = "My blood says the same. I'll speak to the commander when the next watch changes.", fx = { align = { honor = 1 } } },
        { text = "A quiet watch is a duty kept. Stay with the horn.", next = "BACK", reply = "Hm. It's the day the horn is needed that pays for all the quiet ones. I'd forgotten that.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bags = {
      lines = { { id = "ba_default", text = "It is, and the garrison has let me know it. But I watched recruit after recruit pass under this tower with their goods tied up in a cloak, and it offended me. An orc going out into the world for the Horde ought to have something to put the world in." } },
      choices = {
        { text = "Who taught you to sew?", next = "bags2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bags2 = {
      lines = { { id = "ba2_default", text = "Nobody, which is why the first dozen leaked. Cutac in town looked at one and laughed until he had to sit down, and then he showed me how to double a seam. Jark says I'm ruining his trade, and he says it smiling, so I carry on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    view = {
      lines = { { id = "vi_default", text = "North, the road runs up to Orgrimmar's gate. South, you can follow it to Sen'jin and see the Echo Isles past it on a clear day. East is the sea, and Tiragarde Keep squatting on the shore with its human flag, which I look at more than I'd like." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    canvas = {
      lines = { { id = "ca_default", text = "Because it's sailcloth, woven tight to hold wind, and nothing we make comes near it. The sailors and marines carry scraps for patching. I'll admit it pleases me that the Admiral's fleet is supplying the Horde's packs, though they'd not see the joke." } },
      choices = { { text = "I'll bring your eight scraps. Something else.", next = "BACK" } },
    },
    needle = {
      lines = { { id = "ne_default", text = "It is murder on a needle. I've broken more of them than I've finished bags. I use a sailmaker's awl now, taken off one of the marines along with his cloth, and I'd wager he misses it more than his canvas." } },
      choices = { { text = "A sailmaker's awl. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Carry less than you can and more than you think you'll need. A good bag makes that possible." } },
    echo_isles = { { id = "tp_isles", text = "I can see them from here on a clear morning. Nothing moves on them that I'd call friendly, and the trolls in Sen'jin won't look that way at all." } },
    quilboar = { { id = "tp_quilboar", text = "They used to test the town every few weeks. Now they keep to Razormane Grounds and the horn stays on its hook." } },
    thrall = { { id = "tp_thrall", text = "I watched the Warchief ride past below me once, on his way to Sen'jin. He looked up and raised a hand, and I've stood a bit straighter ever since." } },
    centaur = { { id = "tp_centaur", text = "They came as far as the river once, in the early days. That was the loudest I ever blew this horn." } },
    _none = { { id = "tp_none", text = "I've not seen that from my tower, and if I haven't seen it from here, I can't help you." } },
  },
}

---------------------------------------------------------------------------
-- K'waii: general goods in Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "kwaii", id = TODO_NPC("K'waii"), name = "K'waii", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "easy", "sharp" }, values = { "practical", "loyal" },
  notices = { "race", "purse" },
  impression = {
    first = "K'waii keeps the general goods in Sen'jin Village, in baskets hung out of reach of the crabs. She came off the Echo Isles with one sack and has made a point of owning more than one of everything since.",
    third = "{name} met K'waii, who sells general goods in Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Come in under de shade, mon. I got food, water, bags and rope, and I got dem all at a fair price, because I know everybody in dis village." },
    { id = "g_troll", when = { race = "Troll" }, text = "Darkspear! Come, come, you look thin. Buy something to eat before your mother hears I let you walk by hungry." },
    { id = "g_back", when = { metBefore = true }, text = "You be back. De road ate what I sold you already, did it?" },
    { id = "g_away", when = { away = 14 }, text = "Now dere's a face I thought de sea had taken. Sit, tell me where you been, and den buy something." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, all de way down in Sen'jin. You be welcome here, mon. Your Warchief pulled us out of de water, and dis village doesn't forget it." },
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your purse be flat as a ray, I see it. Go sell de crab claws to Hai'zan first, and come back to me after." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be K'waii. Everything a body needs for de road, I keep it, and I keep it up high where de makrura can't reach. Sen'jin is small, but everyone bound for de isles or de Barrens comes through my door first." },
      },
      again = {
        { id = "h_again", text = "What else you want to know? I like to talk, ask anyone." },
        { id = "h_again2", text = "Go on, mon. De tide's out and so are my customers." },
        { id = "h_again3", text = "Ask it. I been sitting wit' dese baskets all morning." },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Where do your goods come from?", next = "goods" },
        { text = "You keep everything hung very high.", next = "crabs" },
        { text = "How has the village fared since the isles?", next = "village" },
        { text = "I left the isles on the same boats as you.", next = "isles", when = { race = "Troll" } },
        { text = "Stay well, K'waii.", next = "END" },
      },
    },
    goods = {
      lines = { { id = "go_default", text = "De orcs send grain and cloth down from Razor Hill, and Jark up dere deals fair wit' me, for an orc. Fish and fruit we get ourselves. De rest comes off whatever washes up from de ships dat break on de reef, and you'd be surprised how much dat is." } },
      choices = {
        { text = "You sell goods from wrecks?", next = "goods2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods2 = {
      lines = { { id = "go2_default", text = "De sea took our home, mon, so I take what de sea gives back and I call it even. A barrel dat floats to my beach is my barrel. I don't ask whose flag was on de ship." } },
      choices = {
        { text = "And if sailors washed up with it?", next = "goods3" },
        { text = "Something else, K'waii.", next = "BACK" },
      },
    },
    goods3 = {
      big = true,
      lines = { { id = "go3_default", text = "Dat happened once. Two humans half drowned, from de Admiral's fleet, same ones dat shoot at our fishers. Master Gadrin had dem bound and sent to Razor Hill alive, and I be honest, half de village wanted to leave dem for de crabs." } },
      choices = {
        { text = "Gadrin did right. Mercy costs nothing on a beach.", next = "BACK", reply = "Dat's what he said, near enough. De old ones see far, even when it galls de rest of us.", fx = { align = { light = 1 } } },
        { text = "They shoot your fishers. The crabs were the fair answer.", next = "BACK", reply = "Heh. You'd have had friends on dat beach, mon. I was one of dem, and I'm not sorry.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crabs = {
      lines = { { id = "cr_default", text = "You would too! De makrura and de pygmy surf crawlers come up in de night and carry off anything dey can lift. I lost a whole sack of dried fish my first week. Now everything hangs, and I sleep wit' a stick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "vi_default", text = "Better dan we had any right to hope. We came ashore wit' nothing, and now dere's huts, raptors in de pens and young ones training. It's not home, but it be ours, and we named it for Sen'jin so we'd remember what it cost." } },
      choices = {
        { text = "Do you think of going back?", next = "village2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village2 = {
      lines = { { id = "vi2_default", text = "Every time I look south. But Zalazane sits on de isles wit' our own kin hexed to guard him, and going home means fighting dem first. Master Gadrin sends de young ones to do it, and I sell dem de water for de swim." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    isles = {
      lines = { { id = "is_default", text = "Den you know, and I don't have to say it. I remember de boats low in de water and nobody speaking. We be here now, and we got each other, and dat's de whole of what I carried off dat I still have." } },
      choices = { { text = "We carried enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Hang your food high and keep your friends close. Dat's served me on two shores now." } },
    echo_isles = { { id = "tp_isles", text = "Home, and not home. Zalazane has it, and he has some of our people wit' it, which be de worse theft." } },
    thrall = { { id = "tp_thrall", text = "He gave his word to Sen'jin and kept it to Vol'jin. Dere's not many chiefs of any people I'd say dat about." } },
    quilboar = { { id = "tp_quilboar", text = "Dey don't come down to de shore. Too much water for dem, I think, and I'm glad of it." } },
    _none = { { id = "tp_none", text = "Dat I don't know, mon, and I know most things dat pass through here." } },
  },
}

---------------------------------------------------------------------------
-- Trayexir: weapon merchant in Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "trayexir", id = TODO_NPC("Trayexir"), name = "Trayexir", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "proud", "teasing" }, values = { "craft", "strength" },
  notices = { "class", "race" },
  impression = {
    first = "Trayexir sells weapons in Sen'jin Village and balances every throwing axe on one finger before he hands it over. He is proud of Darkspear work and likes to tease orcs about the weight of theirs.",
    third = "{name} met Trayexir, the weapon merchant of Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "You got de look of somebody who needs something sharp. Come, let Trayexir show you what a Darkspear means by a weapon." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon, mon? Did you lose it, break it, or leave it in somebody?" },
    { id = "g_troll", when = { race = "Troll" }, text = "Ah, one of our own. Den you know how to throw, and I don't have to explain which end goes first." },
    { id = "g_away", when = { away = 14 }, text = "Long time, long time. I hope whatever I sold you last has got some blood on it by now." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, and wit' an orc's shoulders. You'll want de heaviest thing I got and you'll swing it like you be chopping wood, I know your people." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk quiet, mon. I got daggers for dat kind of work, thin ones, and I don't ask what dey be for." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Trayexir. Axes for throwing, spears, knives, staves, I got dem all, and every one balanced by my own hand. De orcs make a weapon to last a hundred years. We make one to land where you be looking, and dat's de better thing." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I'm not going anywhere." },
        { id = "h_again2", text = "Ask. Talking's free, only de axes cost." },
        { id = "h_again3", text = "Go on. I can sharpen and listen." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What makes a Darkspear weapon different?", next = "darkspear" },
        { text = "The village sends its young to fight on the isles.", next = "young" },
        { text = "You don't think much of orc smithing.", next = "orcs" },
        { text = "What blade would you put in a rogue's hand?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Keep them sharp, Trayexir.", next = "END" },
      },
    },
    darkspear = {
      lines = { { id = "da_default", text = "Balance, mon. We be a small tribe and always were, so we never won by standing in a line and pushing. We won by putting a spear through de chief from behind a tree. A weapon dat flies true is worth ten dat only hit hard." } },
      choices = {
        { text = "Where did you learn the making?", next = "darkspear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkspear2 = {
      lines = { { id = "da2_default", text = "From my mother's brother, on de isles, when we still had dem. He made spears for Sen'jin himself. He didn't get on de boats, and so now dere's only me who knows his way of binding a head to a shaft." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    young = {
      lines = { { id = "yo_default", text = "Dey do, and I arm dem for it. Master Gadrin sends dem across to de Echo Isles after Zalazane, and I see each one before dey go. I give dem de best I have and I tell dem a joke, because it's bad luck to send someone off solemn." } },
      choices = {
        { text = "The hexed trolls there are your own kin.", next = "young2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young2 = {
      lines = { { id = "yo2_default", text = "Dey are. I know some of de faces. Zalazane took deir minds, and what's left wears deir skin and throws axes I may have made myself. De young ones ask me if it be wrong to strike dem down." } },
      choices = {
        { text = "What do you tell them?", next = "young3" },
        { text = "Something else, Trayexir.", next = "BACK" },
      },
    },
    young3 = {
      big = true,
      lines = { { id = "yo3_default", narr = "He stops turning the axe in his hand.", text = "I tell dem a Darkspear would choose a clean death over being Zalazane's puppet, and dat de spirits will know de difference. I believe it, most of de time. But Vornal thinks de hex might be broken someday, and den what have we done?" } },
      choices = {
        { text = "A clean death frees them. You tell them true.", next = "BACK", reply = "Dat's my thinking, mon. I'd want it done for me, quick and by a friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If a cure may come, every kill is a kinsman lost.", next = "BACK", reply = "Aye, and dat's de thought I don't let de young ones see on my face. Maybe I should.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "Ha! I think plenty of it, I only don't say so in front of dem. Uhgar in Razor Hill makes a blade dat'll cut a boar in two. It weighs as much as de boar, too. We trade, him and me, and each of us thinks he got de better of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Something short, wit' no shine on it. I black my daggers over a fish-oil lamp so dey don't catch de moon. Take two, and keep de second where nobody thinks to look, which I won't tell you because den I'd know." } },
      choices = { { text = "Two, and no shine. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Throw before you close, mon. If de first one lands, de rest of de fight be easy." } },
    echo_isles = { { id = "tp_isles", text = "I left my forge dere, and my uncle. Zalazane can keep de forge." } },
    thrall = { { id = "tp_thrall", text = "He carries a hammer big as a hut door. Not how I'd do it, but I hear it works for him." } },
    quilboar = { { id = "tp_quilboar", text = "Thick hide, thick skull. Don't waste a throwing axe, use a spear and lean on it." } },
    _none = { { id = "tp_none", text = "Don't know it, mon. If it can't be sharpened, I wasn't paying attention." } },
  },
}

---------------------------------------------------------------------------
-- Tai'tasi: trade supplies in Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "taitasi", id = TODO_NPC("Tai'tasi"), name = "Tai'tasi", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "warm", "wry" }, values = { "craft", "loyal" },
  notices = { "craft", "class" },
  impression = {
    first = "Tai'tasi sells thread, vials and dyes in Sen'jin Village and knows what every crafter in the tribe is working on. She speaks of Lar Prowltusk with a fond impatience, and watches the road to the Kolkar crags when he is out on it.",
    third = "{name} met Tai'tasi, who keeps the trade supplies in Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Thread, vials, dyes, salt, whatever your hands be needing, Tai'tasi has it or knows who does." },
    { id = "g_craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Cooking", "Blacksmithing", "Engineering" } }, text = "Ah, a maker. Good, de village can never have too many. What be on your bench today?" },
    { id = "g_back", when = { metBefore = true }, text = "You be back. Run out already, or did it come out wrong?" },
    { id = "g_lar", when = { questActive = TODO_QUEST("Thwarting Kolkar Aggression") }, text = "Lar's sent you after de Kolkar, I hear. Come back whole, and tell him I said he could go himself next time." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You brew, I can tell by de stains. Miao'zan buys half my vials and breaks a third of dose dancing, so I keep plenty." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Lar comes home from de crags smelling just like you do. I mean dat kindly, mostly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Tai'tasi. A village dat lost everything has to make everything again, and I sell what de making takes. De tailors, de brewers, de ones who tan hides, dey all come by, and so I hear all de news before Master Gadrin does." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've a little time." },
        { id = "h_again2", text = "Ask. I be counting spools, and it's dull." },
        { id = "h_again3", text = "Go on. De news is free wit' de thread." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What is the village making these days?", next = "making" },
        { text = "You keep looking toward the western road.", next = "lar" },
        { text = "What news have you heard before Gadrin?", next = "news" },
        { text = "I need vials that won't crack over a fire.", next = "vials", when = { profession = "Alchemy" } },
        { text = "Spirits keep you, Tai'tasi.", next = "END" },
      },
    },
    making = {
      lines = { { id = "ma_default", text = "Everything at once. Nets and sails for de fishers, raptor harness for Zjolnir, and more bandages dan I like to count for de ones Gadrin sends to de isles. On de isles we had our grandmothers' looms. Here we started wit' driftwood." } },
      choices = {
        { text = "Does the old craft survive?", next = "making2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    making2 = {
      lines = { { id = "ma2_default", text = "What de old ones carried in deir heads, yes. What was written or carved stayed behind. So I sit de young ones down wit' de old ones every chance I get, and I give dem thread for nothing if dey'll promise to listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lar = {
      lines = { { id = "la_default", text = "Do I? Hm. Lar Prowltusk shares my fire, when he remembers he has one, and he's been watching de Kolkar in de crags west of here. He says dey be massing. He also says he'll be home by dark, and one of dose is usually true." } },
      choices = {
        { text = "The Kolkar worry him that much?", next = "lar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lar2 = {
      lines = { { id = "la2_default", text = "Dey worry him enough dat he doesn't sleep. De centaur pushed de tauren across half a continent, and Lar thinks Sen'jin is small enough to be next. He sends young ones to burn deir battle plans, and he'd go himself every time if I let him." } },
      choices = {
        { text = "You keep him from going?", next = "lar3" },
        { text = "Something else, Tai'tasi.", next = "BACK" },
      },
    },
    lar3 = {
      big = true,
      lines = { { id = "la3_default", text = "I asked him to stay at his post and send others, and he did, and now he sits dere chewing on it. I don't know if I kept a good hunter alive or took a spear from de village when it needs every one." } },
      choices = {
        { text = "The village needs him alive more than it needs him brave.", next = "BACK", reply = "Dat's what I tell myself. It be good to hear it from someone who isn't me.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A hunter kept from the hunt is half a hunter.", next = "BACK", reply = "Aye, I see dat in his face every night. Maybe next time I say nothing, and just wait up.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = { { id = "nw_default", text = "Dat de fishers saw lights on de Echo Isles three nights running, green ones. Dat an orc in Razor Hill is asking questions about de Burning Blade and getting short answers. And dat Bom'bay swears he saw a crab as big as a hut, which I don't count as news." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    vials = {
      lines = { { id = "vl_default", text = "Den take de thick ones, de leaded glass from Ratchet, and warm dem slow. Miao'zan cracks de thin ones every week because he won't stand still at de fire. Don't dance while you brew, and you'll do better dan our own trainer." } },
      choices = { { text = "Thick glass, slow heat. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Learn a craft from someone old while dey still be here to teach it. We learned dat one late." } },
    centaur = { { id = "tp_centaur", text = "De Kolkar sit in de crags to de west and Lar watches dem. Ask him, he'll talk till de fire's out." } },
    echo_isles = { { id = "tp_isles", text = "My grandmother's loom is still dere, if Zalazane hasn't burned it. I think about dat loom more dan I should." } },
    thrall = { { id = "tp_thrall", text = "De Warchief gave us dis shore and asked nothing for it but our friendship. He has it." } },
    _none = { { id = "tp_none", text = "I've not heard about dat, friend, and I hear most things." } },
  },
}

---------------------------------------------------------------------------
-- Miao'zan: alchemy trainer in Sen'jin Village (he dances).
---------------------------------------------------------------------------
P:NPC {
  key = "miaozan", id = TODO_NPC("Miao'zan"), name = "Miao'zan", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "merry", "restless" }, values = { "craft", "devout" },
  notices = { "craft", "class" },
  impression = {
    first = "Miao'zan teaches alchemy in Sen'jin Village and dances while his potions brew, saying the rhythm is part of the recipe. Half the village thinks he is joking and the other half has tasted the results.",
    third = "{name} met Miao'zan, the dancing alchemy trainer of Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon, don't just stand dere, move your feet a little! De pot likes company, and so do I." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "A brewer! Come, smell dis one and tell me what I put in it. If you get all three, I teach you something good." },
    { id = "g_back", when = { metBefore = true }, text = "You be back! Good, good, de potion from last time, it didn't turn you any strange colour?" },
    { id = "g_away", when = { away = 14 }, text = "Long time, mon! I made up four new steps and one new potion since you left, and de steps be better." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You pick your own, I see de green on your fingers. Mishiki will like you, and she'll tell you never to take de last one, so now you been told twice." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You talk to de spirits, yes? Den you know dey like a bit of music. Don't let anybody tell you a potion be only leaves and water." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Miao'zan, dat's me. I teach de brewing: healing draughts, swiftness, a little troll's blood to close a wound. Peacebloom and silverleaf from Mishiki, clean water, a steady fire, and you keep moving while it cooks, because a potion brewed standing still comes out sour." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ask while I stir." },
        { id = "h_again2", text = "Go on, I can dance and listen. I can do three things, even." },
        { id = "h_again3", text = "Ask it! De pot's got a while yet." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Why do you dance while you brew?", next = "dance" },
        { text = "What grows around Sen'jin worth brewing?", next = "herbs" },
        { text = "The witch doctors brew too, I gather.", next = "doctors" },
        { text = "My healing potions come out weak.", next = "weak", when = { profession = "Alchemy" } },
        { text = "Keep dancing, Miao'zan.", next = "END" },
      },
    },
    dance = {
      lines = { { id = "da_default", text = "Because my grandmother did, and her potions never failed. She said de loa come closer when dey hear feet on de ground, and a potion made wit' de loa watching holds its strength. Also, mon, it be a long time to stand by a pot." } },
      choices = {
        { text = "Do you believe the loa part?", next = "dance2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dance2 = {
      lines = { { id = "da2_default", text = "I tried it both ways, to be sure. One batch dancing, one batch standing like a post. De dancing batch was stronger, every time. Master Vornal says I only stir better when I be moving, and maybe so, but it works, and I don't argue wit' what works." } },
      choices = {
        { text = "Vornal doubts the old ways, then?", next = "dance3" },
        { text = "Something else, Miao'zan.", next = "BACK" },
      },
    },
    dance3 = {
      big = true,
      lines = { { id = "da3_default", text = "Not doubts, no. He wants to know de why of everything, so it can be taught plain to de young ones and never lost again. Me, I think some things you keep by doing dem, not by explaining dem. We go round on it, him and me, over many pots." } },
      choices = {
        { text = "Keep the dance. Not everything needs a reason.", next = "BACK", reply = "Ha! Dat's de spirit, mon. Come, I show you de first step, it's easy.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Vornal is right. What can't be explained gets lost.", next = "BACK", reply = "Mm. We did lose much, dat's true. Maybe I let him write de steps down, if he can keep up.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "he_default", text = "Peacebloom and silverleaf on de hills, earthroot under de cliffs. Dat's enough for a beginner. Mishiki picks for me and for de masters, and she knows every patch between here and Razor Hill. When you want more, de Barrens has briarthorn and mageroyal by de oases." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    doctors = {
      lines = { { id = "do_default", text = "Dey do, but it be a different thing. Master Gadrin and Master Vornal brew for hexes and for speaking wit' de dead, and I wouldn't drink from deir pots for all de gold in Ratchet. I brew for de living. It's smaller work, and I like it better." } },
      choices = {
        { text = "What do they brew against Zalazane?", next = "doctors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doctors2 = {
      lines = { { id = "do2_default", text = "Dat's Vornal's study, and he keeps it close. He wants something to break de hex on our kin over on de isles. He's asked me for vials and for quiet, and I've given him de vials." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    weak = {
      lines = { { id = "we_default", text = "Den your fire be too hot, mon, I'd bet my best pot on it. Everybody rushes. Let it only just tremble, never boil, and take it off when de colour turns like a sunset. And move about a little, it can't hurt." } },
      choices = { { text = "A trembling pot. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Don't boil it, and don't stand still. Dat be all my grandmother's wisdom, and it's enough." } },
    echo_isles = { { id = "tp_isles", text = "De best herbs I ever knew grew dere, in de wet shade. I'd give a lot to pick dem again." } },
    thrall = { { id = "tp_thrall", text = "A good chief, mon. Serious, though. I'd like to see him dance once before I die." } },
    elements = { { id = "tp_elements", text = "De orcs talk to de elements, we talk to de loa. I think maybe dey all live on de same street." } },
    _none = { { id = "tp_none", text = "Don't know dat one, mon. Ask me about something dat goes in a pot." } },
  },
}

---------------------------------------------------------------------------
-- Zansoa: fishing supplies on the shore at Sen'jin Village.
---------------------------------------------------------------------------
P:NPC {
  key = "zansoa", id = TODO_NPC("Zansoa"), name = "Zansoa", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "dry", "unhurried" }, values = { "practical", "patient" },
  notices = { "craft", "race" },
  impression = {
    first = "Zansoa sells poles, line and bait on the shore by Sen'jin Village and mends nets between customers. He talks about the water the way other people talk about a moody relative.",
    third = "{name} met Zansoa, who sells fishing supplies on the shore at Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Poles, line, hooks and bait. Mind where you step, mon, dat net's only half mended." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "You fish. I can tell, you looked at de water before you looked at me. What be biting where you came from?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Lost de hook, or lost de pole?" },
    { id = "g_away", when = { away = 14 }, text = "You been gone a few tides. De fish didn't miss you, but I'll admit I wondered." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren at de seaside. First time you seen so much water in one place, I think. It doesn't bite, mon, only de things in it do." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, good. Den what you catch won't go to waste. Half de orcs I sell to throw back anything dey can't name." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Zansoa. Lau'Tiki teaches de fishing and I sell what you fish wit', so between us nobody in Sen'jin goes hungry who can hold a pole. De sea's de one thing we brought wit' us from de isles, since it be de same sea." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only knotting." },
        { id = "h_again2", text = "Ask, mon. De net's patient." },
        { id = "h_again3", text = "Go on. Tide won't turn for a while yet." },
      },
      choices = {
        { text = "Show me your fishing gear.", next = "BUSINESS" },
        { text = "What runs off this shore?", next = "catch" },
        { text = "You mend nets as well as sell them.", next = "nets" },
        { text = "The fishers keep clear of the isles.", next = "isles" },
        { text = "What bait would you use for the deep water?", next = "bait", when = { profession = "Fishing" } },
        { text = "Good tides, Zansoa.", next = "END" },
      },
    },
    catch = {
      lines = { { id = "ca_default", text = "Slitherskin mackerel close in, and longjaw mud snapper where de bottom drops. Dey be small fish and honest ones. Further out dere's bigger things, but further out dere's also de Admiral's ships, so we stay where de water's thin." } },
      choices = {
        { text = "The humans trouble your boats?", next = "catch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch2 = {
      lines = { { id = "ca2_default", text = "Dey've fired on two, from Tiragarde. Nobody killed yet, but a boat wit' a hole in it be a hungry month for a family. De orcs at Razor Hill say dey're dealing wit' it. Dey been saying so a while." } },
      choices = {
        { text = "You don't think the orcs do enough.", next = "catch3" },
        { text = "Something else, Zansoa.", next = "BACK" },
      },
    },
    catch3 = {
      big = true,
      lines = { { id = "ca3_default", text = "I think Gar'Thok has quilboar on one side and cultists on de other, and troll fishing boats come third. I understand it. But some of de young fishers talk about rowing over at night and cutting a few throats demselves, and I've not told dem no." } },
      choices = {
        { text = "Tell them no. That is Gar'Thok's fight to order.", next = "BACK", reply = "Aye, and it'd bring de marines down on de village besides. I'll have a word before dey do something foolish.", fx = { align = { order = 1 } } },
        { text = "It's your sea. Defend it your own way.", next = "BACK", reply = "Heh. Dat be how Darkspear always did it, quiet and at night. I'll not stop dem, den.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nets = {
      lines = { { id = "ne_default", text = "I do, because de makrura tear dem faster dan anyone can buy new. A crab-man sees a net full of fish and thinks it be a gift. Tai'tasi sells me de cord, and I think I've knotted enough of it now to reach Orgrimmar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isles = {
      lines = { { id = "is_default", text = "We do. De best water we ever fished be right dere, between de isles, and nobody will put a line in it. De fish from dere taste wrong since Zalazane came, and de sea witch before him did no better by it." } },
      choices = {
        { text = "A sea witch?", next = "isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles2 = {
      lines = { { id = "is2_default", text = "On de old islands, before dese ones, where de murlocs took us for deir sacrifice. Sen'jin died dere, getting us out. I was a boy holding a net, and dat's all I'll say of it, mon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    bait = {
      lines = { { id = "ba_default", text = "Shiny baubles close to shore, and a nightcrawler when you want something wit' teeth. But save your coin until you can cast far, mon. Bait don't help a line dat lands at your own feet." } },
      choices = { { text = "I'll practise the cast. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Watch de birds. Where dey dive, de fish are, and dey don't charge for telling you." } },
    echo_isles = { { id = "tp_isles", text = "Good water gone bad. I don't look dat way when I cast." } },
    thrall = { { id = "tp_thrall", text = "He got us off a sinking island. Whatever else he does, he did dat." } },
    ratchet = { { id = "tp_ratchet", text = "De goblins dere fish wit' dynamite, I hear. Dat's not fishing, mon, dat's just being loud near water." } },
    _none = { { id = "tp_none", text = "Couldn't say. If it don't swim, I haven't given it much thought." } },
  },
}

---------------------------------------------------------------------------
-- Kali Remik: sends young troll hunters to Thotar (The Hunter's Path).
---------------------------------------------------------------------------
P:NPC {
  key = "kali_remik", id = TODO_NPC("Kali Remik"), name = "Kali Remik",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "keen", "teasing" }, values = { "patient", "loyal" },
  notices = { "class", "pet" },
  impression = {
    first = "Kali Remik watches the young hunters of Sen'jin Village and tells them when they are ready to tame a beast of their own. She is quick to tease and slow to praise, and the young ones listen for both.",
    third = "{name} met Kali Remik, who sets the young hunters of Sen'jin Village on the hunter's path.",
  },
  greetings = {
    { id = "g_default", text = "You walk loud, mon. Dat's fine in a village, but de things out dere got better ears dan I do." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Ah, a hunter. Let me look at how you hold dat bow. Mm, it's not bad, and somebody taught you not to grip it like a club." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Hunter's Path") }, text = "Still here? Thotar's waiting in Razor Hill, and de beasts aren't getting any tamer while you stand about." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Quieter dis time, I didn't hear you till de second hut." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "So you got one already. {pet} looks fed and it looks at you before it looks at me, and dat's what I want to see." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You don't tame de beast, you become it, yes? I'd like to know what a raptor thinks of dat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Kali Remik. I watch de young hunters of de tribe, and when one's ready to walk wit' a beast, I'm de one who says so. A Darkspear hunter alone is good, but a Darkspear hunter wit' a raptor at her heel be a thing de Kolkar tell stories about." },
        { id = "h_before", when = { all = { { class = "HUNTER" }, { questBefore = TODO_QUEST("The Hunter's Path") } } },
          text = "I be Kali Remik, and I been watching you, hunter. You shoot well enough alone, and it's time you stopped being alone. When you be ready, I'll send you to Thotar in Razor Hill, and he'll set you to taming." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunter's Path") },
          text = "Go north to Razor Hill and find Thotar, de orc who trains de hunters dere. Tell him Kali Remik sent you, and do what he says even when it sounds foolish. It always sounds foolish de first time." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Hunter's Path") },
          text = "So Thotar took you on. Good. He be an orc and he teaches like one, all patience and no jokes, but he knows beasts, and I trust him wit' ours." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I've one eye on de pens, but ask." },
        { id = "h_again2", text = "Go on. I'm listening, and I hear more dan you'd like." },
        { id = "h_again3", text = "Ask it. De young ones are all out hunting anyway." },
      },
      choices = {
        { text = "How do you know when a hunter is ready?", next = "ready" },
        { text = "Why send your hunters to an orc?", next = "thotar" },
        { text = "The tribe favours raptors above other beasts.", next = "raptors" },
        { text = "Which beast should I tame first?", next = "first", when = { class = "HUNTER" } },
        { text = "I've tamed my first. It was harder than I thought.", next = "tamed", when = { pet = { type = "Beast" } } },
        { text = "I'll walk quieter, Kali.", next = "END" },
      },
    },
    ready = {
      lines = { { id = "re_default", text = "When dey stop wanting it so bad. A young one who begs me for a beast wants a weapon dat walks. A young one who's ready wants a companion, and she asks me different questions, about feeding and about fear." } },
      choices = {
        { text = "Have you ever judged wrong?", next = "ready2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ready2 = {
      lines = { { id = "re2_default", text = "Once. A boy, quick and proud, de best shot I had. I sent him on, and his first raptor turned on him in de pens before a week was out. He lived. De raptor we had to put down, and dat was my fault, not de beast's." } },
      choices = {
        { text = "What became of the boy?", next = "ready3" },
        { text = "Something else, Kali.", next = "BACK" },
      },
    },
    ready3 = {
      big = true,
      lines = { { id = "re3_default", text = "He asks me every season to try again. He's older, and he's sorry, and I still see dat raptor when I look at him. I haven't said yes. Zjolnir tells me I be punishing de boy for my own mistake." } },
      choices = {
        { text = "Give him the chance. He has paid for it.", next = "BACK", reply = "Mm. Dat be what Zjolnir says, and he loved dat raptor more dan I did. Maybe I listen dis time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast died for his pride. Let him wait longer.", next = "BACK", reply = "Dat's what my gut says. A beast can't choose its hunter twice, so de hunter better be sure.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thotar = {
      lines = { { id = "th_default", text = "Because we be one Horde, mon, and because Thotar has more beasts around Razor Hill to test a hunter on dan I have on dis beach. Boars, scorpids, de crocolisks on de river. He teaches de taming, and Harruk beside him trains what you bring back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raptors = {
      lines = { { id = "ra_default", text = "We do. A raptor be clever, and it hunts in a pack, and it never forgets a face, which is how a Darkspear likes to think of herself. Zjolnir breeds de ones we ride. De ones we hunt wit', each hunter goes and earns alone." } },
      choices = {
        { text = "Where do the wild ones run?", next = "raptors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors2 = {
      lines = { { id = "ra2_default", text = "On de Echo Isles, de bloodtalons, but Zalazane's people be thick dere. Most of ours go west to de Barrens now, where de sunscale packs run by de oases. It's a long walk for a first beast, and I think it should be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Whichever one Thotar tells you, and no arguing. He'll have you tame three, to learn how each one thinks, before you keep any. After dat, mon, choose de one you'd want beside you on de worst day you can imagine." },
        { id = "fi_low", when = { maxLevel = 9 }, text = "None yet, little one. Shoot straight a while longer, and come see me when de scorpids stop being a worry. I'll know, I always do." },
      },
      choices = { { text = "The worst day I can imagine. Something else.", next = "BACK" } },
    },
    tamed = {
      lines = { { id = "ta_default", text = "It always is. You stand dere while it bites you and you don't strike back, and every part of you says dat be madness. Dat's de whole lesson. {pet} knows now dat you'll take pain for it, and it won't forget." } },
      choices = { { text = "Neither will I. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Stand downwind and keep your mouth shut. Dat be most of hunting, and a good deal of everything else." } },
    echo_isles = { { id = "tp_isles", text = "De best raptors I ever knew ran dere. Now dey run for Zalazane, or dey run wild, and I can't say which be worse." } },
    centaur = { { id = "tp_centaur", text = "Lar Prowltusk watches de Kolkar for us. A centaur's a big target, mon, and I've never understood how anyone misses." } },
    thrall = { { id = "tp_thrall", text = "De Warchief asked for Darkspear scouts by name when he raised his city. We be small, but we be seen." } },
    _none = { { id = "tp_none", text = "I don't know dat. If it left tracks I could tell you more." } },
  },
}

---------------------------------------------------------------------------
-- Frezza: zeppelin master (Tirisfal Glades) at the tower outside Orgrimmar.
---------------------------------------------------------------------------
P:NPC {
  key = "frezza", id = TODO_NPC("Frezza"), name = "Frezza", title = "Zeppelin Master",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  temper = { "brisk", "officious" }, values = { "greedy", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "Frezza runs the zeppelin to Tirisfal Glades from the tower outside Orgrimmar and recites the safety rules faster than anyone can follow them. He insists the service has never lost a passenger who obeyed every one.",
    third = "{name} met Frezza, the goblin zeppelin master for the Tirisfal route outside Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Tirisfal Glades and the Undercity, boarding from this platform, no pushing, no smoking and no fire magic, pal. Frezza's the name, what can I do for ya?" },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "Headed home, huh? Platform's right here, friend. Mind the gap, and by that I mean mind all your parts, I ain't sendin' anybody back down for a finger again." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, a repeat customer! See, I told ya it was safe. Mostly I told ya, anyway." },
    { id = "g_away", when = { away = 14 }, text = "Well, look who's still in one piece! The old girl's been askin' after ya, pal, in her way." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "Whoa, whoa, hands where I can see 'em, spellcaster. Not one spark on my ship. That bag overhead is full of somethin' that really, really don't like fire." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, huh. No offence, big fella, but stand in the middle of the deck. It's a weight distribution thing, I got a chart." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Frezza, zeppelin master, Tirisfal route. My zeppelin runs from this tower clear across the Great Sea to the Undercity's front door and back again, regular as a paid debt. It's the safest way to cross an ocean ever invented, and I oughta know, I read the brochure." },
      },
      again = {
        { id = "h_again", text = "What else, pal? She ain't due for a few minutes." },
        { id = "h_again2", text = "Sure, ask. I got a schedule to keep, but it's a loose one." },
        { id = "h_again3", text = "Go on, shoot. With words, I mean, and nowhere near the gasbag." },
      },
      choices = {
        { text = "Where does this zeppelin go?", next = "route" },
        { text = "How safe is this thing, really?", next = "safe" },
        { text = "Goblins flying the Horde's airships. How did that happen?", next = "deal" },
        { text = "The other zeppelin master has your nose.", next = "sister" },
        { text = "Do the living make the crossing easily?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    route = {
      lines = { { id = "ro_default", text = "East, over the whole Great Sea, and she ties up at a tower outside the ruins of Lordaeron's capital in Tirisfal Glades. The Undercity's under that, hence the name. Chilly place, pal, bring a cloak, and don't eat anything a Forsaken offers ya." } },
      choices = {
        { text = "And the other platform?", next = "route2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    route2 = {
      lines = { { id = "ro2_default", text = "That's my sister's ship, south to Grom'gol Base Camp in Stranglethorn Vale, which is all jungle and things with teeth. Different climate entirely. Ya want Snurk for that one, and don't let her sell ya anything on the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "sa_default", text = "Completely, friend, entirely, a hundred percent, provided ya don't smoke, don't cast fire, don't lean over the rail and don't jump off before she's tied up. People jump off, I dunno why. That ain't the zeppelin's fault." } },
      choices = {
        { text = "Has one ever gone down?", next = "safe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe2 = {
      lines = { { id = "sa2_default", text = "Not on my route, and I'd thank ya not to say it so loud on the platform. There was a small fire once. Small! A warlock's imp sneezed. We put it out with the passengers' drinkin' water and everybody got there, a little thirsty." } },
      choices = {
        { text = "What did you do about the warlock?", next = "safe3" },
        { text = "Something else, Frezza.", next = "BACK" },
      },
    },
    safe3 = {
      big = true,
      lines = { { id = "sa3_default", text = "Billed him, obviously, and banned the imp. Then the Horde's people said I can't ban a soldier's demon on a Horde route, on account of who pays for the route. So now I let 'em on and I sweat the whole trip, and I ask ya, is that any way to run an airline?" } },
      choices = {
        { text = "Your ship, your rules. Ban what endangers it.", next = "BACK", reply = "That's what I said! Captain's discretion! You oughta come to the next contract meeting, pal.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Horde pays. You fly whom the Horde sends.", next = "BACK", reply = "Yeah, yeah, that's the small print, I read it. Don't mean I gotta like it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deal = {
      lines = { { id = "de_default", text = "Simple, pal. The Warchief's got an ally on the far side of an ocean and no fleet to speak of, and we got airships and a real flexible attitude. Steamwheedle signed the contract. The Horde gets a bridge in the sky, we get paid by the trip, and everybody's happy." } },
      choices = {
        { text = "Would you fly the Alliance for the same fee?", next = "deal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deal2 = {
      lines = { { id = "de2_default", text = "Me personally? I got an exclusive clause, so no. The Cartel generally? Friend, the Cartel would fly a murloc to the moon if the murloc had the deposit. That ain't disloyalty, that's just business with good manners." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    sister = {
      lines = { { id = "si_default", text = "Snurk? Yeah, she's my sister, and she got the warm route, which tells ya who Ma liked best. She's good at the job, I'll say that. She's also sweet-talkin' every fella who walks up her ramp, so watch your purse and your heart, in that order." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "Easier than your folks do, honestly. The orcs get airsick and the tauren stare at the deck the whole way. Your people just stand at the rail lookin' at the water for three hours and never say a word. Best passengers I got, and I mean that." } },
      choices = { { text = "We have had practice at stillness. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Wait till she's tied up before ya step off. I can't stress that enough, and I've tried." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel signs my pay chit. We're neutral, pal, which means everybody's money's the same colour to us." } },
    thrall = { { id = "tp_thrall", text = "Good customer. Pays on time, don't haggle much, reads the whole contract, which honestly made us a little nervous." } },
    ratchet = { { id = "tp_ratchet", text = "That's where the parts come from, and the mechanics. If she ever needs a new engine, she goes to Ratchet and I go on holiday." } },
    _none = { { id = "tp_none", text = "Ain't on my route, pal, so I couldn't tell ya." } },
  },
}

---------------------------------------------------------------------------
-- Snurk Bucksquick: zeppelin master (Grom'gol) at the tower outside Orgrimmar.
---------------------------------------------------------------------------
P:NPC {
  key = "snurk", id = TODO_NPC("Snurk Bucksquick"), name = "Snurk Bucksquick", title = "Zeppelin Master",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  temper = { "flirtatious", "shrewd" }, values = { "greedy", "cunning" },
  notices = { "gender", "class" },
  impression = {
    first = "Snurk Bucksquick runs the zeppelin to Grom'gol from the tower outside Orgrimmar and has a wink ready for anyone who looks as if they might tip. Behind the sweet talk she knows her schedule to the minute.",
    third = "{name} met Snurk Bucksquick, the goblin zeppelin master for the Grom'gol route outside Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Hey there! The zeppelin to Grom'gol Base Camp, Stranglethorn Vale, boards right here. I'm Snurk, and I'll be takin' real good care of ya." },
    { id = "g_male", when = { gender = "male" }, text = "Well, hello, handsome. Goin' my way? This one's for Grom'gol, and if ya stand close I'll tell ya when she's comin' in." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again, sweetheart! Couldn't stay away, huh? Don't worry, nobody can." },
    { id = "g_away", when = { away = 14 }, text = "Look who it is! I was startin' to think the jungle kept ya. It keeps a few, ya know." },
  },
  notice = {
    { id = "n_female", cat = "gender", when = { gender = "female" },
      text = "Love the gear, hon, very practical. Listen, between us girls, the jungle's murder on leather, so oil everything before ya land." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ooh, a hunter. You're gonna love Stranglethorn, sweetheart. Everything down there's got stripes or teeth, and most of it's got both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Snurk Bucksquick, zeppelin master. I run the southern zeppelin from this tower down to Grom'gol Base Camp, which is the Horde's little foothold in Stranglethorn Vale. Warm weather, big cats, pirates down the coast, and I get ya there with your hair barely mussed." },
      },
      again = {
        { id = "h_again", text = "Anything else, sweetheart? I got a minute before she docks." },
        { id = "h_again2", text = "Go on, ask. I like a talker." },
        { id = "h_again3", text = "Sure, hon, what else? Schedule's fine, I checked." },
      },
      choices = {
        { text = "Tell me about Grom'gol.", next = "gromgol" },
        { text = "You run a tight schedule under all that charm.", next = "schedule" },
        { text = "Frezza says to watch my purse around you.", next = "brother" },
        { text = "What sells in the jungle that I should carry?", next = "trade" },
        { text = "Do you say that to every man on this platform?", next = "flirt", when = { gender = "male" } },
        { text = "I'll wait for the zeppelin.", next = "END" },
      },
    },
    gromgol = {
      lines = { { id = "gr_default", text = "It's a stockade on the west coast of the vale, orcs and trolls mostly, with a wall all round because of what's outside it. Ya step off the tower and you're in the camp. Step out the gate and you're in the food chain, hon, so pick your direction careful." } },
      choices = {
        { text = "Who else is in the vale?", next = "gromgol2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gromgol2 = {
      lines = { { id = "gr2_default", text = "Everybody with an angle. Jungle trolls who ain't the friendly kind, the Venture Company strippin' timber, some dwarf with a hunting camp, and Booty Bay way down south, which is Steamwheedle and the only place worth an evening. I got cousins there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "booty_bay" } } } },
    },
    schedule = {
      lines = { { id = "sc_default", text = "Aw, ya noticed. Listen, the smile's free, but the schedule's what the Horde pays for. I know where that ship is every minute of the day, and if she's late I know whose pay I'm dockin' before she's even tied up." } },
      choices = {
        { text = "So the sweet talk is only business?", next = "schedule2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    schedule2 = {
      lines = { { id = "sc2_default", text = "It's good business, sweetheart, and those ain't the same. A happy passenger tips, and a happy passenger don't file a complaint when the ride gets bumpy. Frezza reads folks the rules and they hate him for it. I tell 'em they look nice and they'd follow me off the rail." } },
      choices = {
        { text = "That's a little dishonest, isn't it?", next = "schedule3" },
        { text = "Something else, Snurk.", next = "BACK" },
      },
    },
    schedule3 = {
      big = true,
      lines = { { id = "sc3_default", text = "Is it? I never said a thing that wasn't true to somebody, somewhere. Everybody walks off feelin' a little better and I walk off a little richer, and I can't find the victim in that. But go on, hon, tell me what you think, I can take it." } },
      choices = {
        { text = "A kind word that costs nothing harms nobody.", next = "BACK", reply = "See, that's what I always say! You and me are gonna get along just fine.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Flattery for coin is still a lie. Speak plainly.", next = "BACK", reply = "Plainly? All right. You're a hard one to sell to, and I respect that. There, that one was free.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "br_default", text = "Frezza says that? Frezza's got the cold route and the dead passengers, hon, he's bitter. He's my brother and I love him, and he ain't had a tip since the tower opened. Ask yourself which of us ya wanna take advice from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trade = {
      lines = { { id = "tr_default", text = "Goin' down, take bandages and spare boots, 'cause the damp eats both. Comin' back, bring hides. Tiger, panther, raptor, the tanners up here pay silly money. I'd tell ya to cut me in, but I'm bein' nice today." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flirt = {
      lines = { { id = "fl_default", text = "Only the ones worth sayin' it to, sweetheart, and that's not near as many as you'd think. There's a wharf clerk down in Ratchet who's been tryin' to buy me dinner all year, and he ain't got one wink out of me. So feel special." } },
      choices = { { text = "I'll try to deserve it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Be nice to the folks who run the transport, hon. We decide whether your luggage arrives." } },
    booty_bay = { { id = "tp_booty", text = "Best town on any coast for a goblin with ideas. Rum, fish and no questions, and Baron Revilgaz keeps it that way." } },
    venture_company = { { id = "tp_venture", text = "They're clear-cuttin' the vale and they don't share. Bad neighbours, worse bosses. I wouldn't work for 'em at double." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel's who I answer to. They don't care how I smile as long as the ship's on time." } },
    thrall = { { id = "tp_thrall", text = "Never met him. I hear he's tall, serious and pays his bills, which is two more good qualities than most." } },
    _none = { { id = "tp_none", text = "No idea, sweetheart, and I'd make somethin' up but I like ya." } },
  },
}
