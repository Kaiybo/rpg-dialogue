-- More of Durotar: Telf Joolam (keeper of the Shrine of the Dormant Flame, Call of Fire), Sen'jin's
-- Zjolnir (raptors), Xar'Ti (riding), Bom'bay (Gadrin's apprentice) and Hai'zan (butcher), Razor Hill's
-- Grimtak (butcher), Cutac (cloth and leather) and Dhugru Gorelust (warlocks), the Valley of Trials'
-- Shikrik (shaman) and Zlagk (butcher), and Raider Jhash on the road. Voices: bibles/more_folk.md
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
      },
      choices = {
        { text = "Show me the raptors.", next = "BUSINESS", when = { any = { { race = "Troll" }, { reputation = { faction = "Darkspear Trolls", min = "exalted" } } } } },
        { text = "Why only for the Darkspear?", next = "why" },
        { text = "How do you tame a raptor?", next = "tame" },
        { text = "Xar'Ti teaches riding here too?", next = "xarti" },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear who be old enough to ride, soon. I can see it in de way you stand." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Xar'Ti, and I teach riding to de Darkspear. A raptor be fast and clever and mean, and a rider who don't know what she be doin' ends up in de dirt or in de raptor." },
      },
      again = {
        { id = "h_again", text = "What else? Quick now." },
        { id = "h_again2", text = "Ask, but don't stand behind de raptors." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { any = { { race = "Troll" }, { reputation = { faction = "Darkspear Trolls", min = "exalted" } } } } },
        { text = "Why is falling the first lesson?", next = "fall" },
        { text = "Raptors seem like dangerous mounts.", next = "danger" },
        { text = "Farewell, Xar'Ti.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "fa_default", text = "Because everybody falls, mon, and de one who falls well gets back up. De one who falls badly gets carried back to de village by his friends, and dey laugh at him all the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to de elements, and I talk to de loa, so we be almost cousins, mon." },
    { id = "n_dead", cat = "race", when = { race = "Scourge" },
      text = "Oh, a dead one who walks and talks! Master Gadrin says I shouldn't stare, so I be starin' very politely." },
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
      },
      choices = {
        { text = "What sort of hexes do you practise?", next = "hexes" },
        { text = "What's it like learning from Gadrin?", next = "gadrin" },
        { text = "Your voodoo is strong? Prove it on Zalazane.", next = "zalazane" },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't worry, big friend, no kodo here. Boar and crab and lizard, dat's all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Hai'zan, butcher of Sen'jin, and I feed dis whole village plus anybody passin' through. Boar from de hills, crab from de beach, and whatever de hunters bring back alive enough to cook." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Go on, I got time while de meat dries." },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "What's wrong with the murlocs?", next = "murlocs" },
        { text = "Best jerky in Durotar? Cook Torka might disagree.", next = "torka" },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Watch your hands with the cleaver, or you'll end up like me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grimtak, butcher of Razor Hill. I sell what the hunters bring in and what the boars give up, and some drink to wash it down." },
      },
      again = {
        { id = "h_again", text = "What else? I've got meat to cut." },
        { id = "h_again2", text = "Go on, ask. I'll keep one eye on the cleaver." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What happened to your finger?", next = "finger" },
        { text = "You and Torka share the town's kitchen?", next = "torka" },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and still wearing that thin robe from the valley. You'll want something warmer before the Barrens wind gets you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cutac. I sell armor to the recruits who come up from the Valley of Trials, and most of them need it more than they know." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. The wind's too strong for customers today anyway." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "What do recruits need most?", next = "recruits" },
        { text = "What dangers should I watch for?", next = "danger" },
        { text = "Farewell, Cutac.", next = "END" },
      },
    },
    recruits = {
      lines = { { id = "re_default", text = "Boots, first, because Durotar is all rock and thorns, and gloves, second, because the scorpids pinch. Most of them want a fancy chest piece and walk to Orgrimmar with bleeding feet." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
  },
  topics = {
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
    first = "He seems to know exactly how much the town distrusts him.",
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
      },
      choices = {
        { text = "Teach me, Dhugru.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why does Razor Hill avoid you?", next = "avoid" },
        { text = "How is your magic different from the Burning Blade's?", next = "blade" },
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
  },
  topics = {
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
    first = "She answers every newcomer's question as if it were the first.",
    third = "{name} met Shikrik, the orc shaman trainer in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Valley, young one. The spirits have been waiting for you, even if you didn't know it." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you look a little more sure of yourself. Good, the spirits like that." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A new shaman, still unsteady with your totem. Hold it like you mean it; the earth spirit can tell when you don't." },
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
      },
      choices = {
        { text = "Teach me, Shikrik.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How did the orcs forget the spirits?", next = "forgot" },
        { text = "What should a new shaman learn first?", next = "first" },
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
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
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
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 6 },
      text = "You look half-starved, recruit. Training's no good on an empty stomach." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zlagk. I feed the recruits of the Valley, boar and water and not much else, but it fills you up and keeps you on your feet." },
      },
      again = {
        { id = "h_again", text = "What else, recruit?" },
        { id = "h_again2", text = "Go on, but be quick, there's a line." },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS" },
        { text = "Where does the boar come from?", next = "boar" },
        { text = "What do you think of the recruits?", next = "recruits" },
        { text = "I'll see you, Zlagk.", next = "END" },
      },
    },
    boar = {
      lines = { { id = "bo_default", text = "Right out there, from the mottled boars the recruits are sent to kill. The new ones bring me the meat and I sell it back to the next lot, and the valley feeds itself that way." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, walking the road on foot. Get yourself a wolf, recruit, your legs will thank you." },
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
      },
      choices = {
        { text = "What sort of trouble do you see?", next = "trouble" },
        { text = "Do you ever get tired of the same road?", next = "road" },
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
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know. Ask in Razor Hill." } },
  },
}
