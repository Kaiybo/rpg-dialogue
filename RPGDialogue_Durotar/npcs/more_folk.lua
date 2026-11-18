-- More of Durotar: Telf Joolam (keeper of the Shrine of the Dormant Flame, Call of Fire), Sen'jin's
-- Zjolnir (raptors), Xar'Ti (riding), Bom'bay (Gadrin's apprentice) and Hai'zan (butcher), Razor Hill's
-- Grimtak (butcher), Cutac (cloth and leather) and Dhugru Gorelust (warlocks), the Valley of Trials'
-- Shikrik (shaman) and Zlagk (butcher), and Raider Jhash on the road. Added later: Ukor, Ruzan, Nartok,
-- Jen'shan, Mai'ah, Rwag, Jark, Krunn, Lau'Tiki and Mishiki. Voices: bibles/more_folk.md
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
    first = "Telf Joolam keeps the Shrine of the Dormant Flame on a high peak above the Southfury, a lean troll shaman long alone with his fire. He tests young shaman before the flame will speak to them.",
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
        { text = "Thun'grim at Far Watch says the fire tests hard.", next = "thungrim", when = { class = "SHAMAN" } },
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
      lines = { { id = "th_default", text = "Thun'grim and I don't agree on much, but on dat he be right. He keeps his fire burnin' bright out in de Barrens, and I keep mine sleepin' up here, and de young shaman get to see both kinds." } },
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
    first = "Zjolnir raises and sells the riding raptors of Sen'jin Village, proud of every beast in his pens. He sells them to Darkspear trolls, and to almost nobody else unless the tribe vouches for them.",
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
    first = "Xar'Ti teaches the Darkspear to ride their raptors at Sen'jin Village, and she is stricter than any sergeant in Razor Hill. She seems to think falling off is the most important lesson there is.",
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
    first = "Bom'bay is Master Gadrin's apprentice at Sen'jin Village, a young witch doctor who very much wants someone to practise his hexes on. Gadrin says his voodoo is strong, which seems to worry everyone else in the village.",
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
        { text = "A warlock might teach you a thing about curses.", next = "warlock", when = { class = "WARLOCK" } },
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
    first = "Hai'zan sells meat at Sen'jin Village, a cheerful troll who swears his raptor jerky is the best in Durotar. He keeps a close eye on the murlocs down the beach, mostly because they keep trying to steal his fish.",
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
    first = "Grimtak sells meat and drink west of the inn in Razor Hill, and he is missing a finger, which he blames on a cleaver and a bad night. He seems to think it makes him a better butcher, somehow.",
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
    first = "Cutac sells cloth and leather armor in Razor Hill, mostly to young recruits fresh out of the Valley of Trials. He has seen enough of them come back in pieces to have opinions on what they should wear.",
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
    { id = "n_worn", cat = "kit", when = { durability = { max = 30 } },
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
  notices = { "class" },
  impression = {
    first = "Dhugru Gorelust trains warlocks in Razor Hill, and the grunts give his corner of town a wide berth. He speaks softly and watches closely, and he seems to know exactly how much the town distrusts him.",
    third = "{name} met Dhugru Gorelust, the warlock trainer in Razor Hill.",
  },
  greetings = {
    { id = "g_default", text = "Ah, another curious soul. Most in Razor Hill avoid my door, so you are either brave or foolish." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, the dark arts reward persistence." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A student of the shadow, come for more knowledge. Step closer, I don't bite, though some of my servants do." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, wrinkling your nose at me as they always do. The spirits and I are not on speaking terms, I'm afraid." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your minion is restless, and that means your hold on it is loose. Tighten it before you speak to me again, or it will embarrass us both." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You and I both reach into places the grunts would rather not look, and only one of us is thanked for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dhugru Gorelust, and I teach those with the will to command what others fear. The Warchief tolerates us so long as we serve the Horde, and I serve it well." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, before my patience thins." },
        { id = "h_again3", text = "You linger longer than most dare to. Ask, then, and I will decide whether it deserves an answer." },
      },
      choices = {
        { text = "Teach me, Dhugru.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why does Razor Hill avoid you?", next = "avoid" },
        { text = "How is your magic different from the Burning Blade's?", next = "blade" },
        { text = "Gar'Thok lets a warlock teach inside his walls.", next = "garthok" },
        { text = "Your students must be hard to come by here.", next = "students" },
        { text = "The dead have fewer scruples about shadow than orcs.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Orgnil hunts cultists. Do you help him?", next = "orgnil" },
        { text = "I'll be going.", next = "END" },
      },
    },
    avoid = {
      lines = { { id = "av_default", text = "Because they remember the warlocks of the old Horde, who sold our people to the demons for power. They see me and think of that, and they are not entirely wrong to, though I am not those warlocks." } },
      choices = {
        { text = "Then what are you?", next = "avoid2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    avoid2 = {
      big = true,
      lines = { { id = "av2_default", text = "A tool the Horde can use, if it is wise, and a danger to it, if it is not. Power is power, and the Horde has enemies enough that it cannot afford to refuse any weapon." } },
      choices = {
        { text = "The Horde should use every weapon it has.", next = "BACK", reply = "Wisely spoken. Remember that when the shaman tell you otherwise.", fx = { align = { light = -1 } } },
        { text = "Some weapons cost more than they're worth.", next = "BACK", reply = "Spoken like a shaman, or a coward. Time will tell which of us was right.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "bl_default", text = "The Burning Blade serve the demons, while I make the demons serve me. It is a small difference in words and an enormous one in practice, and Gar'Thok knows it, or I would not be in his town." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
    garthok = {
      lines = { { id = "gt_default", text = "He does, because he is a practical commander and the Burning Blade is on his doorstep. A town that fights demon-worshippers and refuses to keep anyone who understands them is a town fighting blind, and Gar'Thok has never been blind." } },
      choices = {
        { text = "On what terms does he keep you?", next = "garthok2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garthok2 = {
      lines = { { id = "gt2_default", text = "I teach only those sworn to the Horde, I summon nothing inside the walls larger than an imp, and I report every student's name to the barracks. In return his grunts glare at me from a distance and leave my door unbroken." } },
      choices = {
        { text = "Does that leash chafe?", next = "garthok3" },
        { text = "Something else, Dhugru.", next = "BACK" },
      },
    },
    garthok3 = {
      big = true,
      lines = { { id = "gt3_default", text = "Every day, and I wear it anyway. I watched what warlocks without a leash did to our people, and I would sooner be watched by a commander than trusted by a fool." } },
      choices = {
        { text = "A power that accepts limits can be trusted.", next = "BACK", reply = "Trusted, no. Tolerated, yes, and tolerance has kept me alive longer than trust kept Gul'dan.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The strong shouldn't answer to frightened grunts.", next = "BACK", reply = "That is precisely what the Shadow Council said, and you may visit what is left of them. Think it if you must, but think it quietly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    students = {
      lines = { { id = "st_default", text = "Fewer than Tarshaw gets for his axes, certainly. Those who come to me have usually been to Nartok in the Valley of Trials first, and they arrive with an imp at their heels and the idea that they have already learned the hard part." } },
      choices = {
        { text = "And what is the hard part?", next = "students2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students2 = {
      lines = { { id = "st2_default", text = "Wanting less than the demon offers. Every one of them will be promised more, by the voidwalker, by the Blade's recruiters, by their own ambition, and the lesson that keeps a warlock in the Horde is learning to take exactly what was bargained for and no more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "So I have heard, and I find it refreshing. Your people look at shadow as a tool and not a sin, though I would advise you not to say so loudly in an orc garrison, where the memory of the old Horde is still raw." } },
      choices = { { text = "I'll keep my voice down. Something else.", next = "BACK" } },
    },
    orgnil = {
      lines = { { id = "og_default", text = "When he asks, which he does through gritted teeth. I can tell him what a Burning Blade circle was meant to summon from the ash it leaves behind, and he can tell me which of my former students he found standing in it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "They are what I would be if I had mistaken obedience for power. Fizzle Darkstorm at Thunder Ridge is one of theirs, and Orgnil Soulscar wants him badly." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman, and he permits us regardless. I respect that more than I would respect his approval." } },
    second_war = { { id = "tp_second_war", text = "Warlocks won battles in that war and lost the people who fought them. I teach both halves of that sentence." } },
    burning_legion = { { id = "tp_legion", text = "The Legion broke at Hyjal, and its servants did not all break with it. Anyone who tells you the demons are finished with us is selling something." } },
    _none = { { id = "tp_none", text = "That is not a matter of shadow, so it does not interest me." } },
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
    first = "Shikrik teaches the first lessons of the shaman in the Valley of Trials, a patient orc woman who has heard every newcomer's question a hundred times. She answers each one as if it were the first.",
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
    first = "Zlagk sells meat and drink in the Valley of Trials, mostly to recruits who arrive with nothing in their packs. He's gruff about it, but nobody leaves his stall hungry.",
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
    first = "Raider Jhash patrols the road between the Valley of Trials and Razor Hill on wolfback, always alongside Raider Kerr. He talks the way a soldier talks on a long ride, plainly and without much hurry.",
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
        { text = "I felt the pull you spoke of. What is it?", next = "pull", when = { class = "WARLOCK" } },
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
  notices = { "class" },
  impression = {
    first = "Nartok teaches the Valley's few warlocks behind the Den, in a voice so even it is hard to tell when he is joking. He treats shadow magic like a trade with rules, and the rules like the only thing between a student and a bad end.",
    third = "{name} met Nartok, the orc who trains new warlocks behind the Den in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Mind the circle on the ground, if you would. It's only chalk, but I spent the morning on it." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A student. Stand outside the circle until I say otherwise, and we shall get along well." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and nothing has followed you. That is always a good start." },
    { id = "g_away", when = { away = 14 }, text = "You have been away some weeks, by my count. I trust you kept your circles closed wherever you were." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Mai'ah's student, I expect. She and I disagree about nearly everything except the importance of clean diagrams." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "One of Frang's. You may look, but please don't touch anything that is glowing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nartok, and I teach the first steps of the warlock's craft to those Ruzan judges fit for it. It is slow, careful work, and the slow and careful are the ones who live to grow old in it." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I am Nartok, and I will be your teacher while you are in this valley. Whatever you have heard about warlocks, forget the half that sounded exciting." },
        { id = "h_grown", when = { class = "WARLOCK", minLevel = 12 }, text = "You have outgrown what I teach here, and I am pleased to see you alive to prove it. Dhugru Gorelust in Razor Hill should have you now." },
      },
      again = {
        { id = "h_again", text = "Yes? I have chalk drying, but it can dry without me." },
        { id = "h_again2", text = "Ask. A question costs less than a mistake." },
        { id = "h_again3", text = "You are still curious, and I approve of that in moderation." },
      },
      choices = {
        { text = "Teach me, Nartok.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What does a warlock learn first?", next = "first" },
        { text = "You make it sound like bookkeeping.", next = "trade" },
        { text = "Ruzan chooses and you teach. Why split it?", next = "ruzan" },
        { text = "Hraug handles the demons themselves, I hear.", next = "hraug" },
        { text = "The spirits must hate what you do here.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Farewell, Nartok.", next = "END" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "To draw a circle that closes. It sounds a small thing, and every student is insulted by it, and then I show them the scorch on the Den's back wall where a student before them left a gap the width of a finger." } },
      choices = {
        { text = "What came through the gap?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "fi2_default", text = "Only an imp, and only for a moment, but it set fire to his robe and my notes before Hraug put it down. He draws excellent circles now. He draws them in his sleep, I am told." } },
      choices = { { text = "Something else, Nartok.", next = "BACK" } },
    },
    trade = {
      lines = { { id = "tr_default", text = "It is bookkeeping. Every spell is a debt, and every demon keeps a ledger, and the warlocks who came to grief in the old Horde were the ones who stopped reading what they had signed. I teach my students to count before I teach them to curse." } },
      choices = {
        { text = "And when the price is worth paying?", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      big = true,
      lines = { { id = "tr2_default", text = "Then you pay it, knowingly, and you do not complain. I have spent years of my own life on a single casting to hold a line, and I would again. What I will not do is let a student spend what he has not counted." } },
      choices = {
        { text = "Counted sacrifice for the Horde is a worthy thing.", next = "BACK", reply = "It is the only kind I respect. Remember to count, and you may make one someday.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to make someone else pay the price.", next = "BACK", reply = "That can be arranged, and often is. Know that it goes in the ledger all the same, under your name.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruzan = {
      lines = { { id = "ru_default", text = "Because a teacher grows fond of his students, and a fond teacher makes excuses. Ruzan has no students and therefore no excuses, so he does the judging, and I am spared having to turn away someone I've come to like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hraug = {
      lines = { { id = "hr_default", text = "He does. I teach the summoning and Hraug teaches what to do with the thing once it has arrived, which is the more dangerous lesson. He has the scars and the temper for it, and I have neither." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They do, and I do not ask them to feel otherwise. Shikrik and I keep to opposite ends of the valley by agreement, and when the wind turns sour near my circle I take it as fair comment and move the lesson downwind." } },
      choices = {
        { text = "At least you have the grace to yield to them.", next = "BACK", reply = "It costs me nothing but a walk. Tell Shikrik I said so, if you think it would please her.", fx = { align = { order = 1 } } },
        { text = "You shouldn't be here at all.", next = "BACK", reply = "The Warchief disagrees, and his is the opinion that keeps me breathing. You are welcome to yours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Read what you sign, and close what you open. Nearly every warlock's grave has one of those two written over it." } },
    burning_legion = { { id = "tp_legion", text = "A creditor that never forgives a debt. We are still paying on the first one." } },
    burning_blade = { { id = "tp_blade", text = "Poor craftsmen, for the most part. Their circles are sloppy, and it is their masters who profit from that, not they." } },
    thrall = { { id = "tp_thrall", text = "The Warchief permits us and watches us. I have always found I work more carefully when watched." } },
    second_war = { { id = "tp_second_war", text = "I was a young orc in that war and saw what the death knights were made from. It is why I insist on the chalk." } },
    _none = { { id = "tp_none", text = "I have not studied that, and I do not teach what I have not studied." } },
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
    { id = "n_worn", cat = "kit", when = { durability = { max = 30 } },
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
