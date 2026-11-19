-- Folk an earlier pass missed. Voice: bibles/missed_folk.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Dane Winslow: demon trainer in the Northshire Abbey graveyard, beside Drusilla La Salle; unmakes a warlock's unwanted minion for a fee.
P:NPC {
  key = "dane_winslow", id = TODO_NPC("Dane Winslow"), name = "Dane Winslow", title = "Demon Trainer", gender = "male",
  bible = "bibles/missed_folk.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "polite", "cold" }, values = { "discretion", "profit" },
  notices = { "fel", "class", "light" },
  impression = {
    first = "Dane Winslow stands among the graves at Northshire with the manner of a notary and a trade no notary would own to. For a price he will see a warlock's minion unmade, and he speaks of it as tidying.",
    third = "{name} met Dane Winslow, who trains warlocks' demons in the graveyard at Northshire Abbey.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've no business with the things beyond, mine isn't with you, and we may part friends." },
    { id = "g_2", when = { metBefore = true }, text = "You again. The brothers haven't driven me off yet, as you see." },
    { id = "g_3", when = { class = "WARLOCK" }, text = "Ah, a practitioner. Weary of one of your charges, perhaps, or hoping for one with a more agreeable name?" },
  },
  notice = {
    { id = "n_1", cat = "fel", when = { class = "WARLOCK" },
      text = "Your minion's bound a touch loosely, if you'll forgive a professional remark. It hasn't noticed yet. I'd see to it before it does." },
    { id = "n_2", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the abbey's own. I pay my respects to the graves and I trouble no one, and I'd be obliged if that were reported accurately." },
    { id = "n_3", cat = "class", when = { class = "MAGE" },
      text = "A student of the arcane. We're cousins of a sort, you and I, though your side of the family prefers not to say so at table." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Dane Winslow. I instruct the servants that warlocks call up, and when a servant has outlived its use, I arrange for its dismissal, permanently, so that another may be summoned in its place. It's delicate work, and I'm paid for the delicacy." },
        { id = "hello_2", when = { class = "WARLOCK" }, text = "Dane Winslow. You know the art, so I'll be plain; I can teach your minions what they're slow to learn, and I can unmake one you've tired of, for a consideration. Mistress La Salle teaches the summoner, and I see to the summoned." },
        { id = "hello_3", when = { class = { "PRIEST", "PALADIN" } }, text = "Dane Winslow. I expect you'd rather I gave my trade another name, so let us say I'm a keeper of difficult animals, and that none of them has ever got loose on consecrated ground." },
      },
      again = {
        { id = "hello_again1", text = "Was there something further?" },
        { id = "hello_again2", text = "Go on. I've a great deal of patience; the work requires it." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "I need your services.", next = "BUSINESS" },
        { text = "Why work in a graveyard?", next = "graveyard" },
        { text = "What becomes of a minion you unmake?", next = "unmake" },
        { text = "What you do is an abomination.", next = "abomination" },
        { text = "My imp never stops talking. Is that usual, or should I silence it?", next = "imp", when = { class = "WARLOCK" } },
        { text = "Which servant is likeliest to slip its chains, Winslow?", next = "hardest", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "How do the abbey's brothers stand you?", next = "brothers" },
        { text = "Good day, Winslow.", next = "END" },
      },
    },
    graveyard = {
      lines = {
        { id = "graveyard_1", text = "It's quiet, the brothers come here only to bury, and nobody lingers to ask what a gentleman is doing among the headstones. Besides, the dead make undemanding neighbours. They don't inform on one, and they never ask to borrow anything." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    unmake = {
      lines = {
        { id = "unmake_1", text = "It goes back to wherever such things wait, with its bond to the summoner cut cleanly. I'm told it's unpleasant for the creature. I've never heard one thank me, though the imps have a good deal else to say on the way out." },
      },
      choices = {
        { text = "And the warlock?", next = "warlock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_1", text = "Is free to call another, with a new name and, one hopes, better manners. People imagine a warlock commands a kind of demon. In truth each has one particular servant of each kind, and some pairings are simply unhappy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    abomination = {
      big = true,
      lines = {
        { id = "abomination_1", text = "So the brothers tell me, in gentler words. I'd ask you to consider that these creatures are being summoned whether I stand here or not. I only make certain that the ones in Elwynn are obedient, and that the disobedient ones are gone." },
      },
      choices = {
        { text = "Then better a careful hand than none.", next = "BACK", reply = "Just so. I'm glad to meet someone who thinks past the first shudder.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "No leash makes a demon safe. This should end.", next = "BACK", reply = "A common view, and an honest one. I'll go on being careful, all the same.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    imp = {
      lines = {
        { id = "imp_1", text = "Entirely usual, I regret to say. An imp obeys because it must and talks because it can, and the talking is where it keeps its rebellion. Give it work. A busy imp complains about the work, which is at least a change of subject." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_1", text = "The succubus, without question. A voidwalker resents you honestly, and a felhunter only wants feeding. She'll agree with everything you say for a month, and on the first day of the next you'll find you've been obeying her for three weeks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = {
        { id = "brothers_1", text = "With effort, on both sides. Brother Sammuel won't look at me, and Brother Neals looked once and then offered me wine, which I thought handsome of him. Marshal McBride has decided that so long as nothing follows me out of the graveyard, I'm the abbey's problem and not his." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I kept accounts for a merchant house in Stormwind, once. One learns a great deal about binding contracts in that trade, and I found it carried over." } },
    northshire_abbey = { { id = "tp_northshire_abbey", text = "A good, plain house of the Light, and more tolerant than it knows. I've stood in its graveyard a good while now, and it has only prayed at me." } },
    advice = { { id = "tp_advice", text = "Never let a servant choose its own task, however small. That's the first inch, and they are all of them patient." } },
    rumors = { { id = "tp_rumors", text = "A novice of the abbey ran off with a book he'd no business reading. Mistress La Salle is displeased, and I'd not care to be the novice." } },
    _none = { { id = "tp_none", text = "That lies outside my field, and I never speak outside my field. It's how I've kept it." } },
  },
}

-- Donni Anthania: sells house cats from her cottage in the woods between Northshire, Goldshire and Stormwind; tea parties for the cats, and a small gravestone out front.
P:NPC {
  key = "donni_anthania", id = TODO_NPC("Donni Anthania"), name = "Donni Anthania", title = "Crazy Cat Lady", gender = "female",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "doting", "dotty" }, values = { "cats", "comfort" },
  notices = { "pet", "race", "class" },
  impression = {
    first = "Donni Anthania lives in a cottage full of cats in the woods above Goldshire and sells them only to people the cats approve of. She lays the tea table for a dozen, and only she uses a cup.",
    third = "{name} met Donni Anthania, who keeps and sells cats in a cottage in Elwynn Forest.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello, dear! Mind where you step, that's Mister Whiskers, and he was there first. Have you come about a kitten?" },
    { id = "g_2", when = { metBefore = true }, text = "You came back! The bombay's been asking after you. Well, she looked at the door twice, which is the same thing." },
    { id = "g_3", when = { class = "HUNTER" }, text = "Now you keep that beast of yours on its manners, dear. My babies were here first, and the tabby has never lost a fight." },
  },
  notice = {
    { id = "n_1", cat = "pet", when = { pet = { family = "Cat" } },
      text = "Oh, my word, look at the size of that one! Is it friendly? Does it like cream? {pet}, is it? What a dignified name. Come and meet everyone, {pet}." },
    { id = "n_2", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a great deal of animal to bring to a cat house, dear. If {pet} so much as sniffs at my silver tabby, I shall be very cross with the both of you." },
    { id = "n_3", cat = "race", when = { race = "NightElf" },
      text = "A night elf! Is it true your people ride cats as big as horses? Don't tell mine. They've quite enough ideas above their station as it is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I'm Donni, dear, and these are my babies. That's the bombay on the windowsill, the cornish rex is under the stove, the tabby's wherever she pleases, and the orange one doesn't have a name because he's never answered to any." },
        { id = "hello_2", when = { class = "DRUID" }, text = "I'm Donni, dear, and oh, you're one of the ones who can be a cat, aren't you? Don't do it in here, please. It upsets the silver tabby, and the last time the tabby proposed marriage." },
      },
      again = {
        { id = "hello_again1", text = "What else, dear? Sit down, don't mind the fur." },
        { id = "hello_again2", text = "Go on. The kettle's nearly ready." },
        { id = "hello_again3", text = "Yes, dear? Speak up, there's purring." },
      },
      choices = {
        { text = "I'd like to see the kittens.", next = "BUSINESS" },
        { text = "How many cats live here?", next = "many" },
        { text = "Tell me about these tea parties.", next = "tea" },
        { text = "This many cats isn't healthy for a person.", next = "healthy" },
        { text = "There's a small gravestone outside your door.", next = "stone" },
        { text = "How do you keep so many beasts so calm?", next = "calm", when = { class = "HUNTER" } },
        { text = "A gnome could build you a self-filling milk dish.", next = "dish", when = { race = "Gnome" } },
        { text = "Goodbye, Donni.", next = "END" },
      },
    },
    many = {
      lines = {
        { id = "many_1", text = "Seventeen at breakfast, dear, and I've never got the same number twice at supper. Some are mine and some are only visiting, and one of them I'm fairly sure belongs to Marshal Dughan, though he's too proud to come and ask." },
      },
      choices = {
        { text = "Don't you ever run short?", next = "short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_1", text = "Of cats? Bless you, no, dear, they find me. I open the door of a morning and there's a new one on the step, washing, as if it had an appointment. I only sell the ones who tell me they'd like to see the world." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tea = {
      lines = {
        { id = "tea_1", text = "Every afternoon at four. I put out the good cups and a saucer of cream at each place, and we talk over the day. The rex doesn't say much, but the bombay has opinions on everything, and the tabby usually leaves early." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    healthy = {
      big = true,
      lines = {
        { id = "healthy_1", text = "That's what my sister said, and she went to live in Stormwind with a husband who doesn't purr. I've a warm house and a full table and somebody pleased to see me every morning. I'd like to know what she's got that's healthier." },
      },
      choices = {
        { text = "If it makes you happy, it's nobody else's business.", next = "BACK", reply = "There, now. I knew you were a sensible one. The tabby said so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "You've shut yourself away from people. That's no life.", next = "BACK", reply = "People are very loud, dear, and they never wash. But I shall think about it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = {
        { id = "stone_1", text = "That's Lord Underfoot, dear. He was the first, and the grandest, and he tripped every guest I ever had. I've told the bombay she's to be buried with me when my time comes, and she's agreed, provided it isn't soon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    calm = {
      lines = {
        { id = "calm_1", text = "I don't keep them anything, dear. You'd know that, having a beast of your own. I'm polite to them, I feed them on time, and I never pick one up that hasn't asked. It's more than most people manage with each other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dish = {
      lines = {
        { id = "dish_1", text = "Would it bite? The last clever thing a gnome sold me was a mouse on a spring, and the tabby took it apart in a morning and left the pieces in my slipper. But a milk dish, now. I'd think about a milk dish." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    northshire_abbey = { { id = "tp_y_northshire_abbey", text = "The brothers send me their kitchen mousers when they get too old to mouse. I've three abbey cats, and they're the only ones who sit still for grace." } },
    kobolds = { { id = "tp_y_kobolds", text = "Nasty little things, with their candles. One came sniffing round the cream last winter, and the bombay saw it off before I'd found my broom." } },
    background = { { id = "tp_background", text = "I've always been here, dear, or it feels so. The cottage was my mother's, and the first cat was hers, and I've only added to the collection." } },
    advice = { { id = "tp_advice", text = "Let a cat come to you. It's the same with people, only people take longer and aren't so soft." } },
    rumors = { { id = "tp_rumors", text = "The tabby brought home a kobold's candle last week, still warm. I don't ask where she goes, but I do wish she'd stay off the mine road." } },
    goldshire = { { id = "tp_goldshire", text = "I go down for cream and fish on market days, and they're always kind. The innkeeper saves me the fish heads." } },
    _none = { { id = "tp_none", text = "I don't know about that, dear. Is it about cats? No? Then I shouldn't think I'd know." } },
  },
}

-- Eldrin: tailoring trainer in a house at the west end of the Eastvale Logging Camp. (Forever: ends Camping 101: Tailoring.)
P:NPC {
  key = "eldrin", id = TODO_NPC("Eldrin"), name = "Eldrin", title = "Tailoring Trainer", gender = "male",
  bible = "bibles/missed_folk.md", role = "trainer", tier = "service",
  communities = { "eastvale" }, temper = { "fastidious", "gentle" }, values = { "craft", "order" },
  notices = { "craft", "kit", "class" },
  impression = {
    first = "Eldrin teaches tailoring from a tidy house at the Eastvale Logging Camp and winces at a frayed cuff as other men wince at a wound. He will take up a needle for any stranger whose wardrobe offends him enough.",
    third = "{name} met Eldrin, the tailoring trainer at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Good day, and oh, dear, I can tell at a glance that your wardrobe is in dire need of care. Do come in." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, you're back. Turn round for me, please; yes, the seam's held, and I'm gratified." },
    { id = "g_3", when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "You've the look of someone sent on an errand. Is this about a camp? I was told to expect it, and I've laid out the canvas." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, I see it in how you looked at my hems before my face. Splendid. We shall get on." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Forgive me, but that garment is being held together by habit. Sit down, and at least let me show you a whipstitch before it leaves you altogether." },
    { id = "n_3", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe. A real one, with a lining. You've no idea what a comfort that is to a tailor who lives among lumberjacks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Eldrin, and I teach the tailor's craft, from the first hem to a lined cloak. I keep house here at Eastvale because the air is clean, the rent is nothing, and the loggers go through shirts at a rate you would not believe." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "I am Eldrin, and you already have the needle-hand, so we may skip the thimble lecture. Tell me what you last made and what went wrong with it, and we'll begin from there." },
      },
      again = {
        { id = "hello_again1", text = "Is there anything else? I've a sleeve to set, but it will keep." },
        { id = "hello_again2", text = "Do go on. I can baste and listen." },
        { id = "hello_again3", text = "Yes? Ask, by all means." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why would a tailor live at a logging camp?", next = "camp" },
        { text = "What's the first thing a tailor should learn?", next = "learn" },
        { text = "Fine clothes are a waste out here.", next = "waste" },
        { text = "Sam Sarsaparilla sent me about a camp.", next = "camping", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Where does good cloth come from, this far out?", next = "cloth", when = { profession = "Tailoring" } },
        { text = "What does a tailor make for someone in plate?", next = "plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Good day, Eldrin.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "camp_1", text = "For the quiet, at first. Stormwind's tailors are forever looking over one another's shoulders. Here the only one who watches me work is Supervisor Raelen, and she only wants to know when her foremen's shirts will be done." },
      },
      choices = {
        { text = "And the loggers?", next = "loggers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loggers = {
      lines = {
        { id = "loggers_1", text = "They tear a sleeve a day, each, and they'd wear the rags if I let them. I mend at cost. A man swinging an axe in a shirt that fits swings it better, and I've told Raelen she may count me as an improvement to her timber yield." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = {
        { id = "learn_1", text = "The plain running stitch, done evenly, a thousand times. Everyone wishes to begin with silk and embroidery. But a straight seam in honest linen is the whole craft in small, and I can tell a tailor's character from six inches of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = {
        { id = "waste_1", text = "I hear that weekly, usually from someone whose trousers are tied on with twine. Clothes are the first thing anyone knows of you. A woodsman who keeps his collar mended is telling the world he hasn't given up, and the world answers accordingly." },
      },
      choices = {
        { text = "Care in small things shows care in all things.", next = "BACK", reply = "Precisely! I shall embroider that on something.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A man's worth isn't in his collar. Let them wear rags.", next = "BACK", reply = "His worth, no. But I notice the ones in rags are seldom the happy ones.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camping = {
      lines = {
        { id = "camping_1", text = "So he did. A camp wants canvas that sheds rain and a seam that won't open when the wind gets under it, and neither is difficult once you've been shown. Sit there, take this awl, and mind that you wax the thread; it's the wax that keeps the weather out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = {
        { id = "cloth_1", text = "Linen from the Stormwind weavers, by the wagon that brings the camp its flour, and wool from the farms along the river when the wolves have left any sheep. For anything finer, you want Rema Schneider in the city, and you may tell her I sent you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    plate = {
      lines = {
        { id = "plate_1", text = "Everything you don't see, and can't fight without. The padded arming coat, the cap under the helm, the lining that keeps a pauldron from flaying your shoulder. A smith makes the armour, but a tailor decides whether you can bear to wear it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stormwind = { { id = "tp_y_stormwind", text = "Fine cloth and sharp tongues. I go in twice a year for silk thread, and I'm always glad of the road home." } },
    camping = { { id = "tp_y_camping", text = "A well-made camp is mostly good sewing, though nobody credits the tailor. Canvas, wax and a patient seam will keep out more weather than a fire will." } },
    background = { { id = "tp_background", text = "I trained in the Stormwind cloth halls and left when I could no longer stand the gossip. Eastvale has very little gossip, and what there is concerns horses." } },
    eastvale = { { id = "tp_eastvale", text = "Sawdust, horses, and decent, tired people. I've grown fond of it, though I do wish they'd wipe their boots." } },
    advice = { { id = "tp_advice", text = "Wax your thread, press your seams, and never cut cloth when you're angry." } },
    rumors = { { id = "tp_rumors", text = "The loggers say the wolves and bears have grown bold along the east road. I've mended three torn cloaks this week that bear them out." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond my province. I know cloth, and I try not to have opinions on the rest." } },
  },
}

-- Jason Mathers: a fisherman who sells his catch from the small pier on Crystal Lake, beside Lee Brown, near Adele Fielder's house. (Forever: A Man About a Murloc, A Net Disaster, Baited for Success, Slimy Menace.)
P:NPC {
  key = "jason_mathers", id = TODO_NPC("Jason Mathers"), name = "Jason Mathers", title = "Fishmonger", gender = "male",
  bible = "bibles/missed_folk.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "plain", "wry" }, values = { "livelihood", "peace" },
  notices = { "craft", "hunger", "class" },
  impression = {
    first = "Jason Mathers sells the day's catch from a small pier on Crystal Lake, with one eye on the far shore where the murlocs are. He fishes for a living, which he says is not what Lee Brown does beside him.",
    third = "{name} met Jason Mathers, a fishmonger on the pier at Crystal Lake.",
  },
  greetings = {
    { id = "g_default", text = "Morning. Fresh off the lake, if you're buying. If you're only looking, look quietly, or Lee will give you the speech." },
    { id = "g_2", when = { metBefore = true }, text = "Back again. The fish haven't got any cheaper, nor any scarcer, which is about all I ask of a day." },
    { id = "g_3", when = { questActive = TODO_QUEST("A Net Disaster") }, text = "Any luck with what I asked? I've been fishing with a hand line since, like a boy, and Lee's enjoying it far too much." },
    { id = "g_4", when = { questActive = TODO_QUEST("Slimy Menace") }, text = "You're still in one piece, so they haven't had you yet. How many of the slimy devils are left on that shore?" },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Fishing" },
      text = "You fish. Good. Then you'll know what it is to have something else on the lake that wants your catch more than you do." },
    { id = "n_2", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook, by the look of that pan on your pack. Take the longjaw; it holds together over a fire, and the smallfish don't." },
    { id = "n_3", cat = "class", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "You're armed, and you look as if you know the use of it. I might have work for you that pays better than buying my fish." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Jason Mathers, fishmonger. I net this lake at dawn and sell what I take by noon, to Goldshire's inn and to whoever walks down the path. It was a quiet trade until the murlocs moved onto the east shore and took to the same waters." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Slimy Menace") }, text = "Jason Mathers, and you're the one who cleared the east shore for me. I've had three full nets this week and not one webbed footprint on my pier. I'd forgotten the lake could be this dull, and I've missed it." },
        { id = "hello_3", when = { questActive = TODO_QUEST("A Man About a Murloc") }, text = "Jason Mathers. I've said my piece on those murlocs, and you've the errand in hand. Go and see about it, and then come and tell me I was right." },
      },
      again = {
        { id = "hello_again1", text = "Something else? The catch won't keep all day." },
        { id = "hello_again2", text = "Go on. I can gut and talk." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Let me see today's catch.", next = "BUSINESS" },
        { text = "What trouble are the murlocs giving you?", next = "murlocs" },
        { text = "You and Lee Brown share this pier.", next = "lee" },
        { text = "It's their lake as much as yours.", next = "theirs" },
        { text = "What's biting in Crystal Lake?", next = "biting", when = { profession = "Fishing" } },
        { text = "How are the nets holding up now?", next = "nets", when = { questDone = TODO_QUEST("A Net Disaster") } },
        { text = "What's this work you spoke of?", next = "work", when = { class = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE" } } },
        { text = "Good day, Jason.", next = "END" },
      },
    },
    murlocs = {
      lines = {
        { id = "murlocs_1", text = "They cut my nets for the fish in them, and when there are no fish they cut them anyway. I lost two good nets in a week and found one of my floats on a murloc's spear. I don't mind sharing a lake, but they don't share.", fx = { learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "Has anyone tried to drive them off?", next = "drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drive = {
      lines = {
        { id = "drive_1", text = "Marshal Dughan sent two guards east to look at the murlocs and the kobolds both, and they've not been seen since. After that the Marshal had fewer guards and no more time for a fishmonger's nets, and I can't fault him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lee = {
      lines = {
        { id = "lee_1", text = "We do. He fishes for the art of it and teaches anyone who'll stand still, and I fish for the inn's supper. He says I've no poetry in me. I say poetry doesn't fetch four coppers a pound, and we've stood side by side on these boards for years." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    theirs = {
      big = true,
      lines = {
        { id = "theirs_1", text = "I've thought that, some mornings. They were in the streams before there was a Goldshire. But I've a living to make and they've knives, and there's not a magistrate in the kingdom who'll hear a fisherman's suit against a murloc." },
      },
      choices = {
        { text = "Folk here have to eat. You've a right to defend your living.", next = "BACK", reply = "That's how it comes out, when I've done thinking. Thank you.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They were here first. Fish another shore.", next = "BACK", reply = "There's the one lake, friend. But you're not the first to say it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    biting = {
      lines = {
        { id = "biting_1", text = "Brilliant smallfish in the shallows and longjaw mud snapper off the deep end of the pier. Fish at first light and from the west bank. The east bank has more fish, and it has what eats them, and what cuts nets." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nets = {
      lines = {
        { id = "nets_1", text = "Whole, for the first time in a month. I've mended and tarred them and hung them where I can see them from the house. Adele Fielder says I look at those nets the way her husband used to look at his sword." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_1", text = "It's the east shore. Somebody who can handle themselves needs to go round and make that camp think again about my side of the lake. I'd pay in coin and in fish, and I'd see you got the pick of the catch as long as I had this pier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "My father fished this lake, and his before. The house has changed and the pier's been rebuilt twice, but there's always been a Mathers with a net on Crystal Lake." } },
    goldshire = { { id = "tp_goldshire", text = "Farley at the inn takes half my catch, and Toddrick the butcher takes what's too ugly to serve whole. It's a good town for a man who sells supper." } },
    advice = { { id = "tp_advice", text = "Fish the dawn, mend at noon, and never leave a net in the water overnight on a lake with murlocs." } },
    rumors = { { id = "tp_rumors", text = "Lee swears he hooked something in the deep end that pulled like a horse. Lee's fish have a way of growing, so halve it, and it's still a big fish." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it's not in this lake, I've likely never seen it." } },
  },
}

-- Quartermaster Hicks: weapons quartermaster at the Westbrook Garrison, in the room to the right of the entrance, beside Hudson and Veldan Lightfoot.
P:NPC {
  key = "quartermaster_hicks", id = TODO_NPC("Quartermaster Hicks"), name = "Quartermaster Hicks", title = "Master Weaponsmith", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "steady", "terse" }, values = { "dutiful", "craft" },
  notices = { "soldier", "kit", "craft" },
  impression = {
    first = "Quartermaster Hicks keeps the weapons at Westbrook Garrison racked, oiled and counted, and can lay his hand on any of them in the dark. He says little, checks an edge twice, and trusts a blade more than a promise.",
    third = "{name} met Quartermaster Hicks, who keeps the weapons at Westbrook Garrison in Elwynn Forest.",
  },
  greetings = {
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Night issue. Sign for what you take, and bring it back with blood on it or not at all." },
    { id = "g_default", text = "Westbrook armoury. Swords on the left, axes on the right, and hands off the rack until you've said what you want." },
    { id = "g_2", when = { metBefore = true }, text = "You're back. How did the edge hold?" },
    { id = "g_3", when = { questActive = TODO_QUEST("Wanted: \"Hogger\"") }, text = "You're after Hogger, by that look. Then you'll want something that keeps its edge on bone. Come here." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry it properly, point down and hand loose. Good. I've had recruits in this week who hold a sword like a ladle." },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That weapon's notched to the spine. I sell new ones, and there's a grindstone outside for the one you've got. Use both." },
    { id = "n_3", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've worked a forge. Tell me what you make of this tempering, and be honest; the garrison's smith is in Stormwind and I've nobody to ask." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Quartermaster Hicks, weapons, Westbrook Garrison. This post holds the west road against the Riverpaw gnolls and whatever comes over from Westfall, and every blade the guards carry out of that door was through my hands first." },
        { id = "hello_2", when = { origin = "human_city_guard" }, text = "Quartermaster Hicks, weapons. You've the city guard's training, so you'll know the issue sword. Mine are the same pattern, only I've put a proper edge on them, which the royal armoury never troubles to." },
      },
      again = {
        { id = "hello_again1", text = "Anything else?" },
        { id = "hello_again2", text = "Go on. Short, if you can." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Show me the weapons.", next = "BUSINESS" },
        { text = "What does the garrison fight out here?", next = "fight" },
        { text = "You share this room with Hudson.", next = "hudson" },
        { text = "Peasants with weapons are just a danger to themselves.", next = "peasants" },
        { text = "What would you carry against gnolls?", next = "gnolls", when = { class = { "WARRIOR", "PALADIN", "ROGUE" } } },
        { text = "Would the garrison buy blades from me?", next = "buy", when = { profession = "Blacksmithing" } },
        { text = "Hogger's finished. I thought you'd want to know.", next = "hogger", when = { questDone = TODO_QUEST("Wanted: \"Hogger\"") } },
        { text = "Carry on, Quartermaster.", next = "END" },
      },
    },
    fight = {
      lines = {
        { id = "fight_1", text = "Riverpaw gnolls, in the woods south and west, more of them every month. Defias on the Westfall road, who are cleverer and fewer. And wolves and boars, which the recruits practise on before I'll let them near either of the others.", fx = { learn = { "riverpaw" } } },
      },
      choices = {
        { text = "Who leads the gnolls?", next = "leads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leads = {
      lines = {
        { id = "leads_1", text = "One they call Hogger, down by the river fork. Deputy Rainer has a bill posted for him. I've issued swords to four parties who went after him, and I've had two of the swords back, without the parties." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hudson = {
      lines = {
        { id = "hudson_1", text = "Him and Veldan Lightfoot both. Hudson has the armour and the shields, and never stops talking about what's going to kill us all. Lightfoot has the leathers and never stops selling. I stand between them and count swords." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peasants = {
      big = true,
      lines = {
        { id = "peasants_1", text = "I've heard officers say it. But the guard can't be at every farm, and the gnolls can. I'd sooner sell a farmer a short sword and show him which end to hold than read his name on the Deputy's list." },
      },
      choices = {
        { text = "Folk have a right to defend their own doors.", next = "BACK", reply = "They do. And I'll see they've something sharp to do it with.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Arms belong with trained soldiers. Leave defence to the guard.", next = "BACK", reply = "That's regulation, and I'd follow it if there were guards enough.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = {
        { id = "gnolls_1", text = "An axe, or a mace. Gnolls wear whatever they've stolen, in layers, and a sword skates on it. Hit the shoulder, since they lead with it, and don't follow one that runs, because it's running toward its friends." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "buy_1", text = "If they're plain and sound. I've no use for a pretty hilt. Bring me six short swords that'll take an edge and hold it through a week of bad handling, and I'll pay garrison rate and ask for six more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hogger = {
      lines = {
        { id = "hogger_1", text = "Is he, now. Then that's the first good report to cross this counter since spring. I'll tell the Deputy, and I'll tell Hudson, who'll explain to me why it only makes things worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    riverpaw = { { id = "tp_y_riverpaw", text = "They fight in a pack and break when the big one falls. Kill the big one first." } },
    defias = { { id = "tp_y_defias", text = "Better armed every month, and with good Stormwind steel. Somebody inside the walls is selling to them." } },
    background = { { id = "tp_background", text = "Twelve years a footman, then a quartermaster when my shield arm went. I know what a bad blade costs because I've carried one." } },
    westfall = { { id = "tp_westfall", text = "The road west used to bring grain. Now it brings refugees, and the men who robbed them come a day behind." } },
    advice = { { id = "tp_advice", text = "Check your edge before you sleep, not when you wake. You'll not get time when you wake." } },
    rumors = { { id = "tp_rumors", text = "The guards say the gnolls have started wearing Stormwind mail. That mail came off somebody, and I'd like to know which patrol." } },
    _none = { { id = "tp_none", text = "Not my store. Ask Hudson; he'll have an opinion whether he knows or not." } },
  },
}

-- Quartermaster Hudson: armour and shield quartermaster at the Westbrook Garrison, beside Hicks and Veldan Lightfoot; the garrison's pessimist.
P:NPC {
  key = "quartermaster_hudson", id = TODO_NPC("Quartermaster Hudson"), name = "Quartermaster Hudson", title = "Armorer & Shieldcrafter", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "gloomy", "talkative" }, values = { "survival", "comrades" },
  notices = { "soldier", "kit", "greenness" },
  impression = {
    first = "Quartermaster Hudson issues armour and shields at Westbrook Garrison and expects the worst of every patrol, loudly. For all his gloom, nobody leaves his counter with a loose strap or an unpadded helm.",
    third = "{name} met Quartermaster Hudson, who keeps the armour and shields at Westbrook Garrison.",
  },
  greetings = {
    { id = "g_y1", when = { timeOfDay = "night" }, text = "Out at night, are you? Wonderful. They can see in the dark, you know, and you can't. Take a second shield." },
    { id = "g_default", text = "Come for armour? Good, because you'll need it. Have you seen what's out in those woods? No, you haven't, or you'd be wearing more." },
    { id = "g_2", when = { metBefore = true }, text = "You're alive! That's a pleasant surprise, and I don't get many." },
    { id = "g_3", when = { maxLevel = 8 }, text = "Look at you, fresh off the abbey road with a wooden shield. They're sending us children now. Come here, let me find you something that'll stop a spear." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's had it, friend. One more gnoll and you'll be wearing it as a necklace. Sit down; I'm not letting you out of that door like that." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A shield arm, and one that's been used. Good. Tell that to the recruits, will you? They think the shield's the thing you drop when you run." },
    { id = "n_3", cat = "greenness", when = { maxLevel = 10 },
      text = "You're new to this, aren't you? Don't be a hero. Heroes come back on a cart. Strap that tighter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Quartermaster Hudson, armour and shields. We're a dozen guards holding a road with gnolls on one side and thieves on the other, and Stormwind's forgotten we're here. So I make sure that what we've got at least fits, because it's all that's between us and the end." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Wanted: \"Hogger\"") }, text = "Quartermaster Hudson, and you're the one who put down Hogger. I'll admit that's good news. Mind you, there'll be another just like him by harvest; there always is." },
      },
      again = {
        { id = "hello_again1", text = "What else? We've time, probably." },
        { id = "hello_again2", text = "Go on, I'm only counting what we've got left." },
        { id = "hello_again3", text = "Aye, what?" },
      },
      choices = {
        { text = "Show me the armour.", next = "BUSINESS" },
        { text = "Is it really as bad as you say?", next = "bad" },
        { text = "What makes a good shield?", next = "shield" },
        { text = "Your gloom does the garrison no good.", next = "gloom" },
        { text = "What should I wear on the Westfall road?", next = "road", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm new to this. What do I need first?", next = "first", when = { maxLevel = 10 } },
        { text = "How do you get on with Hicks?", next = "hicks" },
        { text = "Stay safe, Quartermaster.", next = "END" },
      },
    },
    bad = {
      lines = {
        { id = "bad_1", text = "Worse. The gnolls used to raid and run, and now they're building camps. The Defias used to rob wagons, and now they're recruiting. And every month the keep sends us fewer guards and a longer letter about how valued we are." },
      },
      choices = {
        { text = "Then why do you stay?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = {
        { id = "stay_1", text = "Where would I go? Besides, these lads would walk out of here with their helms on backwards if I weren't checking. Somebody has to expect the worst, so the rest of them are allowed to hope." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shield = {
      lines = {
        { id = "shield_1", text = "Seasoned oak, a steel rim, and straps you've fitted to your own arm and nobody else's. A shield that slips is worse than none, because you'll trust it. I fit every one myself, and I make them hit me with a stick before they leave." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gloom = {
      big = true,
      lines = {
        { id = "gloom_1", text = "So the Deputy says. But I've noticed that the ones who laugh at me check their straps all the same, on the way out. I'd sooner they were frightened and buckled than cheerful and dead." },
      },
      choices = {
        { text = "A warning that keeps men alive is worth the grumbling.", next = "BACK", reply = "There, you see, somebody understands! It won't help, mind, but thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fear spreads. A garrison needs courage, not doom.", next = "BACK", reply = "Courage, aye. I issue it in oak and steel. The talk's free.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_1", text = "Mail, and a full helm, never mind the heat. The Defias use bows from the hedgerows, and they aim for faces. Carry your shield on your arm, not your back, from the bridge onward. You'll feel a fool until the first arrow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_1", text = "A helm. Everybody buys the breastplate, because it looks the part, and then takes a club to the head from a kobold half their size. Helm, then shield, then boots that fit. The rest can wait until you've lived a month." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hicks = {
      lines = {
        { id = "hicks_1", text = "Hicks is the best quartermaster on this road, and he's said eleven words to me since midsummer. I do the talking for both of us. He thinks a sharp sword solves most things, and I think it only gets you close enough to need my armour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    riverpaw = { { id = "tp_y_riverpaw", text = "Gnolls. Big, mean, and too many. I've counted their campfires from the wall, and I stopped at forty." } },
    defias = { { id = "tp_y_defias", text = "Masks and knives, and they know the patrol times better than we do. Don't tell me that's luck." } },
    background = { { id = "tp_background", text = "I was a shield-bearer in the king's levy, and I've the dents to show for it. They put me behind a counter when I started flinching at loud noises." } },
    westfall = { { id = "tp_westfall", text = "It's gone, as far as the crown's concerned. The folk there have a militia now, I hear, and good luck to them. They'll need it." } },
    advice = { { id = "tp_advice", text = "Tighten every strap, then tighten it again when you're tired. Tired is when it matters." } },
    rumors = { { id = "tp_rumors", text = "A patrol found a gnoll camp with a forge in it. A forge! We're finished the day they learn to make shields." } },
    _none = { { id = "tp_none", text = "I don't know, and I expect it's bad news whatever it is." } },
  },
}

-- Veldan Lightfoot: sells leather armour at the Westbrook Garrison, beside Quartermasters Hicks and Hudson.
P:NPC {
  key = "veldan_lightfoot", id = TODO_NPC("Veldan Lightfoot"), name = "Veldan Lightfoot", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed_folk.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "easy", "persuasive" }, values = { "trade", "craft" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Veldan Lightfoot sells leather armour from a corner of the Westbrook armoury, the only one of the three there who is no soldier. He talks while he fits a jerkin, and has usually sold the gloves too before he stops.",
    third = "{name} met Veldan Lightfoot, who sells leather armour at Westbrook Garrison.",
  },
  greetings = {
    { id = "g_default", text = "Good day, good day! Leather's my line, friend, light on the shoulders and quiet in the woods. Let me look at the length of your arm." },
    { id = "g_2", when = { metBefore = true }, text = "Welcome back! That jerkin's worn in nicely. It'll be the better for a little oil, mind, which I happen to sell." },
    { id = "g_3", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "Now here's somebody who knows what they need. Step past the ironmongers, friend, the good stuff's in my corner." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those seams are opening, friend. I've a needle and I've better leather, and you may have the choice of either before you go back into those woods." },
    { id = "n_2", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll be for Hudson's counter, in all that plate. But think of a leather jerkin underneath, for the chafing. Every soldier here wears one of mine and won't admit it." },
    { id = "n_3", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You know hides! Then feel that one, there. Elwynn boar, bark-tanned, eight months in the pit. Nobody in Goldshire can show you its equal." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Veldan Lightfoot, leather armour. The garrison lets me keep a corner because the scouts won't wear mail, and because I pay my rent in mended belts. Hicks and Hudson handle the iron, and I look after everyone who has to move quietly." },
        { id = "hello_2", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "Veldan Lightfoot, and leather's your trade as much as mine, I see. I've jerkins, bracers and soft-soled boots, all cut for somebody who'd rather not be heard, and you may try on anything you like." },
      },
      again = {
        { id = "hello_again1", text = "What else can I show you?" },
        { id = "hello_again2", text = "Go on, friend. I can stitch and listen." },
        { id = "hello_again3", text = "Yes, ask away, by all means." },
      },
      choices = {
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "How does a merchant end up in a garrison?", next = "garrison" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Leather won't stop a gnoll's axe.", next = "axe" },
        { text = "What do the garrison's scouts wear?", next = "scouts", when = { class = { "ROGUE", "HUNTER", "DRUID" } } },
        { text = "Would you buy hides or finished work?", next = "hides", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "What are Hicks and Hudson like to share a room with?", next = "neighbours" },
        { text = "Good day, Veldan.", next = "END" },
      },
    },
    garrison = {
      lines = {
        { id = "garrison_1", text = "I'd a stall on the west road, and the Riverpaw burned it one night with all my stock. Deputy Rainer said I could set up inside the walls if I'd see to the guards' straps and scabbards. It's the safest shop in Elwynn, and I've a captive market." },
      },
      choices = {
        { text = "Do you miss the road?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_1", text = "I miss the travellers. Farmers going in to market, pedlars, the odd dwarf. Now the only folk who use that road are soldiers and people running from Westfall, and neither has much to spend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = {
        { id = "leather_1", text = "Boar, from these woods, and the hunters bring it to me by the armful. Wolf, when I can get it, which is soft and warm. I tan behind the stables, downwind, and Hudson still complains, though Hudson would complain of roses." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    axe = {
      big = true,
      lines = {
        { id = "axe_1", text = "No, friend, it won't. It's not meant to. Leather's for the one who isn't there when the axe comes down. I've outfitted every scout this garrison has, and it's the scouts who come back to tell the men in plate where the gnolls are." },
      },
      choices = {
        { text = "Not being hit is the best armour there is.", next = "BACK", reply = "Ha! I may paint that over my corner, if Hicks will lend me the brush.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A soldier should stand and take the blow, not dodge it.", next = "BACK", reply = "Hudson says the same. And then he buys my padding for under his mail.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts = {
      lines = {
        { id = "scouts_1", text = "Dark boar leather, oiled dull so it doesn't catch the light, and boots with a doubled sole that I stitch on the inside. They've walked up to Riverpaw fires in my boots and counted heads. One of them told me a gnoll looked straight at him and went back to its bone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Both, and gladly. Raw hides I'll take by weight, if they're cleanly skinned. Finished work I'll look over, and if the stitching's even I'll put it on my shelf with your mark on it. I'm one man with eleven guards to keep in belts." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_1", text = "Like a day with no weather and a day with nothing but. Hicks hasn't an unnecessary word in him, and Hudson's convinced we'll all be dead by the first frost. I stand between them and sell gloves. Somebody in here has to be cheerful." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A tanner's son from the west road. I learned the trade over a pit behind the house and the selling at my mother's knee, and she was the better merchant." } },
    westfall = { { id = "tp_westfall", text = "I bought half my hides from Westfall farmers, once. They've no stock left to skin now, poor souls." } },
    advice = { { id = "tp_advice", text = "Oil your leather after rain and before frost. A cracked strap gives way at the worst moment it can find." } },
    rumors = { { id = "tp_rumors", text = "A hunter sold me a hide last week with a brand on it that I didn't know. Somebody's keeping cattle in those hills, and it isn't a farmer." } },
    riverpaw = { { id = "tp_riverpaw", text = "They burned my stall and wore my stock. I saw one last spring in a jerkin I'd cut myself, and I was nearly as flattered as I was furious." } },
    _none = { { id = "tp_none", text = "Can't help you there, friend, but have you thought about gloves?" } },
  },
}
