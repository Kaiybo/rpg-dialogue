-- Missed Orgrimmar folk, part three: the Drag's traders (Asoran, Magenius, Borstan, Kor'geld), Godan's
-- Runeworks (Jhag, Kithas), Kor'ghan in the Cleft of Shadow, and two filed here from the assignment whose
-- Classic posts are elsewhere: Kali Remik (Darkspear, Sen'jin Village) and Estelle Gendry (Rogues' Quarter,
-- Undercity). Voices: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Asoran: general goods, Asoran's Market in the Drag.
P:NPC {
  key = "asoran", id = TODO_NPC("Asoran"), name = "Asoran", title = "General Goods", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "plain", "steady" }, values = { "practical", "fair" },
  notices = { "purse", "weary" },
  impression = {
    first = "Asoran keeps the market that bears his name in the Drag, selling the plain things a traveller forgets until the road reminds them. He is an orc of few wasted words who can tell how far a customer has walked by the state of their pack.",
    third = "{name} met Asoran, who sells general goods at his market in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Asoran's Market, {class}. If it fits in a pack and keeps you alive on the road, I probably have it." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and your pack looks lighter than when you left. Let us mend that." },
  },
  notice = {
    { id = "n_low", cat = "purse", when = { maxLevel = 12 },
      text = "You are new to the road, I think. Buy your food and water before your weapons, young one, because hunger has killed more grunts than the Alliance has." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Asoran, and this market is mine. I sell food, drink, bags and all the dull things nobody sings about, and without them no warrior gets as far as the song." },
      },
      again = {
        { id = "h_again", text = "What else do you need, {class}?" },
        { id = "h_again2", text = "Ask. I am not going anywhere, and neither is the stock." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What sells best in the Drag?", next = "sells" },
        { text = "Who are your neighbours here?", next = "neighbours" },
        { text = "Good trading, Asoran.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Waterskins, always, because Durotar is a thirsty country and the Barrens is worse. After that it is bags, since everyone who leaves this city comes back carrying more than they meant to." } },
      choices = {
        { text = "What do travellers forget most?", next = "forget" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = {
        { id = "f_hunter", when = { class = "HUNTER" }, text = "Hunters forget food for their beasts, and then they wonder why the wolf looks at them sideways. Feed {pet} before you feed yourself, and you will both come home." },
        { id = "f_default", text = "They forget something to light a fire with. They remember the axe and the armor and three kinds of jerky, and then they sit in the dark in the Barrens and eat it cold." },
      },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "n_default", text = "Magenius sells his reagents under my roof, and the casters who come for him buy bread from me, so we get on. Borstan smokes meat down the way, and on a still day the whole Drag smells of his firepit, which is good for my trade in water." } },
      choices = {
        { text = "The Drag never gets much sun.", next = "shade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shade = {
      lines = { { id = "sh_default", text = "No, and I thank the builders for it every summer. The canyon walls keep it cool enough that food does not spoil by noon, which is why the traders settled here and left the open valleys to the warriors." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried supplies for the Horde's march across the Barrens. When the city was built I simply put the pack down and opened it." } },
    _none = { { id = "tp_none", text = "I do not know about that. I know what is on my shelves and what it costs." } },
  },
}

-- Magenius: reagents, in Asoran's Market.
P:NPC {
  key = "magenius", id = TODO_NPC("Magenius"), name = "Magenius", title = "Reagents", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "curious", "careful" }, values = { "knowledge", "practical" },
  notices = { "class", "fel" },
  impression = {
    first = "Magenius sells reagents in the Drag from rows of small labelled pots, and he asks each customer what the purchase is for with real interest. He works no magic himself, and he has made a study of everyone who does.",
    third = "{name} met Magenius, the reagent seller in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Reagents for every art practised in Orgrimmar, {class}. Tell me what you mean to cast, and I will tell you what it burns." },
    { id = "g_back", when = { metBefore = true }, text = "You have used them all up already? Then they worked, and I am glad of it." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You will want ankhs, and I keep them well stocked, because nobody asks for one twice in the same life." },
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "I sell to your kind as to any other. I only ask that you open nothing in my shop that you bought in the Cleft." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Magenius. I sell the powders, runes and charms that a spell consumes, and I share Asoran's roof because those who run short of reagents have usually run short of bread as well." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Ask, {class}. I enjoy questions more than most traders do." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Do you cast anything yourself?", next = "cast" },
        { text = "Who buys the most from you?", next = "buys" },
        { text = "I need runes for my teleports.", next = "m_runes", when = { class = "MAGE", minLevel = 20 } },
        { text = "I'm an orc and a mage. What do you make of that?", next = "m_orcmage", when = { class = "MAGE", race = "Orc" } },
        { text = "Farewell, Magenius.", next = "END" },
      },
    },
    m_runes = {
      lines = {
        { id = "mr_default", text = "Second row, beside the light feathers and the arcane powder, because a mage always wants all three at once and always on the way out of the door. Each rune is spent the moment you step, so buy more than you think you need." },
        { id = "mr_portal", when = { minLevel = 40 }, text = "Second row for the teleportation runes, and the portal runes beside them, which cost more because they carry more than one of you. I sell a great many on the eve of a muster, when every mage in the Valley of Spirits remembers at once." },
      },
      choices = {
        { text = "Where do the runes come from?", next = "m_runes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_runes2 = {
      lines = { { id = "mr2_default", text = "They come by zeppelin in crates from the Undercity, packed in straw, with no letter and no maker's mark. I ask every mage who buys one what it feels like when it breaks, and no two have ever given me the same answer, so tell me yours." } },
      choices = {
        { text = "Like a door slamming shut behind me.", next = "BACK", reply = "A door. That is the third door this month. I shall have to start keeping a tally.", fx = { affinity = 1 } },
        { text = "I've never noticed anything at all.", next = "BACK", reply = "Then you are either very gifted or very busy, and I shall not ask which." },
      },
    },
    m_orcmage = {
      big = true,
      lines = { { id = "mo_default", text = "I think you are braver than I was. I wanted the spirits, and when they would not answer I sold powders rather than reach for anything else, and you know what happened to the orcs who did reach, long ago. An orc who takes up the arcane in daylight, with no bargain in it, is what we should have been the first time." } },
      choices = {
        { text = "Then I'll carry it in daylight, always.", next = "BACK", reply = "Then come and buy your runes where the elders can see you do it. It does them good.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. I don't care who it frightens.", next = "BACK", reply = "That is very nearly what my grandfather's warlock said. I hope you will forgive me for not liking it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cast = {
      lines = { { id = "c_default", text = "I do not, and I have made my peace with it. The spirits never spoke to me and the arcane never answered, but I found I could learn what every spell needs and have it ready, and that is its own kind of service." } },
      choices = {
        { text = "Does it trouble you, selling to mages?", next = "mages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages = {
      lines = {
        { id = "m_mage", when = { class = "MAGE" }, text = "You would know better than I how the old orcs look at you. I say that a rune is a tool and the Horde needs every tool it has, and that our warlocks failed us because of what they bargained with, which is not your art." },
        { id = "m_default", text = "Some of the elders say all such magic led us to the demons, and they will not walk past my pots. I think the fault lay in what was bargained for, and a troll mage with a pouch of my runes has bargained with nobody." },
      },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    buys = {
      lines = { { id = "b_default", text = "The shaman, by weight, because every one of them carries an ankh against the worst day of their life. The mages buy little and often, and they always need it at once, as if a portal were a thing one decided on suddenly." } },
      choices = {
        { text = "An ankh against the worst day?", next = "ankh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ankh = {
      lines = {
        { id = "a_shaman", when = { class = "SHAMAN" }, text = "You know the rite better than I do. I only know that the ones who buy two come back more often than the ones who buy one, so I have started saying so." },
        { id = "a_default", text = "A shaman who falls may ask the spirits to stand them up again, and the ankh is the price of asking. I have never seen it done, but I have sold a second ankh to the same customer many times, which tells me enough." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I wished to be a shaman when I was young, and the elements had other plans. I serve those they did choose, and I find that I do not mind." } },
    _none = { { id = "tp_none", text = "That is beyond my pots and labels, I am afraid. Ask one of the trainers, who know the arts from the inside." } },
  },
}

-- Borstan: meat vendor in the Drag. (Forever: ends Meal Appeal, gives Favorite Food; Changing Tastes.)
P:NPC {
  key = "borstan", id = TODO_NPC("Borstan"), name = "Borstan", title = "Meat Vendor", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "hearty", "gruff" }, values = { "generous", "craft" },
  notices = { "hunger", "class" },
  impression = {
    first = "Borstan sells meat in the Drag from a firepit that never quite goes out, and the smell of it reaches the street well before he does. He is loud, greasy to the elbow, and convinced that most of the Horde's troubles begin with an empty stomach.",
    third = "{name} met Borstan, the meat vendor whose smoke hangs over the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Come closer, {class}, and smell that! You cannot fight on an empty belly, and you cannot have a full one anywhere better than here." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, the smoke pulled you back! It does that to everyone, sooner or later." },
    { id = "g_done", when = { questDone = TODO_QUEST("Favorite Food") }, text = "The lunch bringer! Thatog's boy was here at midday again with three friends, and they ate like a raiding party." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You bring down the meat and I make it worth eating, so I count the two of us as partners in the same honest trade." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You work a kitchen yourself, and I can tell by the way you looked at the fire before you looked at me. Do not ask what is in the glaze, because I will not tell you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_meal", when = { questActive = TODO_QUEST("Meal Appeal") }, text = "Thatog sent you about young Migi, did he? I pack that boy's lunch every morning and most days it sits here until it is cold, because he will not leave his game to fetch it." },
        { id = "h_food", when = { questActive = TODO_QUEST("Favorite Food") }, text = "That lunch is going cold in your hands, {class}. The boy plays behind Grommash Hold, so take it to him while the crumbs on top are still crisp." },
        { id = "h_default", text = "I am Borstan, and I sell meat, smoked and roasted and glazed. Boar is my trade for the most part, with whatever else the hunters drag in, and nobody has ever left my pit hungry who had the coin to stay." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I turn these, or they will burn." },
        { id = "h_again2", text = "Ask away, I have ears to spare and hands that do not." },
      },
      choices = {
        { text = "Let me see what's on the fire.", next = "BUSINESS" },
        { text = "About Thatog's boy and his lunch.", next = "migi", when = { any = { { questActive = TODO_QUEST("Meal Appeal") }, { questActive = TODO_QUEST("Favorite Food") }, { questDone = TODO_QUEST("Favorite Food") } } } },
        { text = "What's your best cut?", next = "best" },
        { text = "Your smoke fills the whole Drag.", next = "smoke" },
        { text = "Where does the meat come from?", next = "hunters" },
        { text = "Keep the fire hot, Borstan.", next = "END" },
      },
    },
    migi = {
      lines = {
        { id = "mi_done", when = { questDone = TODO_QUEST("Favorite Food") }, text = "He comes on his own now, and he brings the others, and I did nothing but crumble a little sweetglazed hog belly over the top. A child will not come for what is good for him, but he will cross the city for the crispy bits." },
        { id = "mi_default", text = "Migi is a good boy with a head full of wolves and battles, and no room in it for midday. His father shouts, which never fed anyone, so I have another idea, and it starts with something he can smell from the road." },
      },
      choices = {
        { text = "What's the idea?", next = "idea" },
        { text = "Thatog worries about him.", next = "thatog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    idea = {
      lines = { { id = "id_default", text = "I take hog belly glazed sweet and smoked hard, and I break it over his lunch so the smell walks ahead of whoever carries it. If the food comes to the game and the game stops for it once, then he will learn what he has been missing." } },
      choices = { { text = "A smoker's cunning. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thatog = {
      lines = { { id = "th_default", text = "Thatog worries the way he does everything, at the top of his voice, and he calls my chops overcooked while he buys a dozen. He is a good father, and a boy who is shouted at with that much love will turn out well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = {
        { id = "b_tauren", when = { race = "Tauren" }, text = "For you I would say the boar ribs, and I say it with respect, because I know your people give thanks for the animal. I waste nothing of it, and I think the Earth Mother and I would agree on that much." },
        { id = "b_default", text = "The sweetglazed hog belly, and I will hear no argument. It takes the whole night over a low fire, and I have turned away grunts at dawn who tried to buy it before it was ready." },
      },
      choices = {
        { text = "A whole night for one cut?", next = "night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      lines = { { id = "n_default", text = "A smith does not pull the blade early because the customer is impatient, and I will not either. Zamja up the street says I cook like an orc, and I tell her that is the kindest thing a troll has ever said to me." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    smoke = {
      lines = { { id = "s_default", text = "It does, and I have never paid a copper for a crier because of it. Asoran says it makes his customers thirsty, and the leatherworkers say it covers the smell of their vats, so the whole street comes out ahead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunters = {
      lines = { { id = "hu_default", text = "It comes out of Durotar, most of it, on the shoulders of whoever killed it. The boars out there are lean and mean, and that makes for good smoking, though I will not take one that was sick when it fell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I cooked for a warband on the march, over whatever would burn. A pit that stays in one place still feels like a luxury to me." } },
    _none = { { id = "tp_none", text = "I could not say, {class}. Ask me about meat and I will talk until the fire dies." } },
  },
}

-- Kor'geld: alchemy supplies in the Drag. (Forever: Yelmak's Medley.)
P:NPC {
  key = "korgeld", id = TODO_NPC("Kor'geld"), name = "Kor'geld", title = "Alchemy Supplies", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "patient", "careful" }, values = { "order", "craft" },
  notices = { "profession", "class" },
  impression = {
    first = "Kor'geld sells vials and alchemist's supplies in the Drag, and he handles glass with a gentleness that looks odd on hands his size. He keeps the shelves in strict order and winces whenever something in the back room of the shop goes bang.",
    third = "{name} met Kor'geld, who sells alchemy supplies in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Mind your elbows near the shelves, {class}. Everything on them is glass, and none of it bounces." },
    { id = "g_back", when = { metBefore = true }, text = "You are back for more vials, I hope, and not to tell me the last ones leaked." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "Stained fingers and singed eyebrows. You are an alchemist, and I would guess you are short of vials, because your kind always are." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_medley", when = { questActive = TODO_QUEST("Yelmak's Medley") }, text = "Yelmak has sent you on one of his errands, has he? Then tell me what he wants this time, and try to remember all of it, because his lists are never short." },
        { id = "h_default", text = "I am Kor'geld, and I supply the alchemists of Orgrimmar. Yelmak teaches the brewing and I sell the glass to put it in, and between us nobody in the Drag goes without a potion who needs one." },
      },
      again = {
        { id = "h_again", text = "What else do you need?" },
        { id = "h_again2", text = "Go on, but keep clear of the top shelf while you talk." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What is Yelmak like to work beside?", next = "yelmak" },
        { text = "It's strange to see an orc selling glass.", next = "glass" },
        { text = "What do alchemists run out of first?", next = "runout" },
        { text = "I'm a warrior. Which potion should never leave my belt?", next = "warbelt", when = { class = "WARRIOR" } },
        { text = "Farewell, Kor'geld.", next = "END" },
      },
    },
    yelmak = {
      lines = { { id = "y_default", text = "He is a fine alchemist, and he is tidy about nothing except his measures. He will send a student across the whole city for one ingredient he has just thought of, and then think of two more before they are back." } },
      choices = {
        { text = "And the bangs from the back room?", next = "bangs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bangs = {
      lines = { { id = "b_default", text = "Those are students, for the most part. I count the bang and then I count the breaking glass after it, and I add the second number to what they owe me." } },
      choices = {
        { text = "Has anyone been badly hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Not since I began selling the leaded vials for anything that fumes. A young troll lost his eyebrows last season and was proud of it for a week, which tells you what sort of orcs and trolls take up this craft." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    warbelt = {
      lines = { { id = "wb_default", text = "A healing potion, warrior, and a second one behind it, because the first always goes sooner than you planned. Rage will carry you into a fight, but it will not stitch you closed once you are out of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glass = {
      lines = { { id = "g_default2", text = "My father said the same, and he said it louder. But I was a clumsy whelp, and an old alchemist put a crate of empty vials in my arms and told me to carry it a mile, and by the end of that mile I had learned how to be careful." } },
      choices = { { text = "A good teacher. Something else.", next = "BACK" } },
    },
    runout = {
      lines = {
        { id = "r_alch", when = { profession = "Alchemy" }, text = "You run out of vials before herbs, every one of you. You go out and pick half of Durotar, and then you stand at the cauldron with nothing to pour it into and come running to me." },
        { id = "r_default", text = "They run out of vials first and patience second. A potion in the pot is no use to a grunt in the field, so the glass matters as much as the brew, though no alchemist will admit it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold glass in the Drag since the shop opened. I have broken four vials in that time, and I remember each one." } },
    _none = { { id = "tp_none", text = "I cannot help you there. If it does not come in a vial, it is not my trade." } },
  },
}

-- Jhag: enchanter at Godan's Runeworks in the Drag. (Forever: Camping 101: Enchanting.)
P:NPC {
  key = "jhag", id = TODO_NPC("Jhag"), name = "Jhag", gender = "male",
  bible = "bibles/missed_a.md", role = "enchanter", tier = "quest",
  communities = { "orgrimmar" }, temper = { "eager", "earnest" }, values = { "craft", "humble" },
  notices = { "profession", "kit" },
  impression = {
    first = "Jhag works at Godan's Runeworks in the Drag, a young orc enchanter with rune dust on his sleeves who is delighted when anyone asks him a question. He knows the first steps of the craft thoroughly and looks to Godan for the rest.",
    third = "{name} met Jhag, the young enchanter at Godan's Runeworks in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Godan's Runeworks, {class}! If you have come about enchanting, then you may start with me, and I will not waste your time." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Have you broken anything down into dust yet, and did it feel as strange as I said?" },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "You have the dust on your fingers already. It does not wash off, you know, and Godan says that is how enchanters recognise each other." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Enchanting") }, text = "You were sent to me about a camp, were you? A camp wants an enchanter as much as it wants a cook and a fire, because cold steel is only steel until somebody wakes it up." },
        { id = "h_camp_done", when = { questDone = TODO_QUEST("Camping 101: Enchanting") }, text = "How does your camp fare? I hope you put the rune where I showed you, and not where it looked best." },
        { id = "h_default", text = "I am Jhag, and I teach the first lessons of enchanting here under Godan. Kithas sells the rods and dusts across the room, so a beginner needs to walk no farther than this shop." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I like explaining things." },
        { id = "h_again2", text = "Ask anything, and if I do not know it, Godan will." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "I was sent about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Enchanting") } },
        { text = "How does enchanting work?", next = "works" },
        { text = "What's it like, learning under Godan?", next = "godan" },
        { text = "Orcs aren't known for enchanting.", next = "orcs" },
        { text = "Good luck with the runes, Jhag.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Then here is what a camp needs from my craft. It needs somebody who can take the spoils nobody wants and break them down, and put that strength back into the gear you do want before you march again." } },
      choices = {
        { text = "Show me how it's done.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    works = {
      lines = { { id = "w_default", text = "Everything that holds magic can be made to give it up. You break an enchanted thing into dust and essence with a rod, and then you draw a rune and feed the dust to it, and the rune stays in the steel." } },
      choices = {
        { text = "You destroy things to make things.", next = "destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    destroy = {
      lines = { { id = "d_default", text = "Yes, and it troubled me at first, because my father was a smith and I had been taught never to waste good work. Godan told me that a blade nobody carries is already wasted, and that I was only moving its strength to where it would fight." } },
      choices = {
        { text = "What did your father say?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "He said nothing for a month. Then I put a rune on his hammer and it has not chipped since, so now he tells the whole Valley of Honor that his son is an enchanter, as if it had been his idea." } },
      choices = { { text = "Another matter.", next = "BACK", fx = { affinity = 1 } } },
    },
    godan = {
      lines = { { id = "g_default2", text = "He is patient with my questions and has no patience at all with a crooked rune. He makes me draw each one a hundred times in sand before I am allowed near a weapon, and I am on my fourth rune now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = {
        { id = "o_shaman", when = { class = "SHAMAN" }, text = "You would understand it better than most, shaman. It is not the warlocks' way, because nothing is summoned and nothing is owed; the strength was already in the world, and we only move it." },
        { id = "o_default", text = "We are not, and some of the old warriors frown at the shop when they pass it. Then they hear what a rune does for an axe, and they come in frowning and leave without the frown." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a smith's son from the Valley of Honor who liked the patterns better than the hammering. Godan took me on, and I have been here since." } },
    _none = { { id = "tp_none", text = "I do not know that yet! Ask Godan, because he has forgotten more than I have learned." } },
  },
}

-- Kithas: enchanting supplies at Godan's Runeworks.
P:NPC {
  key = "kithas", id = TODO_NPC("Kithas"), name = "Kithas", title = "Enchanting Supplies", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "sharp" }, values = { "practical", "shrewd" },
  notices = { "profession", "class" },
  impression = {
    first = "Kithas sells rods, dusts and vellum at Godan's Runeworks, and she weighs everything twice on a small brass scale. She has a dry tongue and a soft spot for the apprentice across the room, which she would deny.",
    third = "{name} met Kithas, who sells enchanting supplies at Godan's Runeworks.",
  },
  greetings = {
    { id = "g_default", text = "Rods, dusts and essences, {class}, weighed honestly. Do not sneeze near the scale." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you have not come to return dust, because it does not go back in the jar." },
  },
  notice = {
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "An enchanter. Good, then I will not have to explain why a pinch of dust costs what it does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kithas, and I sell what the enchanters of this shop use up. Godan draws the runes, Jhag teaches the beginners, and I make sure neither of them ever reaches for a rod and finds the shelf bare." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly, I am weighing." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why does dust cost so much?", next = "dust" },
        { text = "How is the apprentice coming along?", next = "jhag" },
        { text = "Farewell, Kithas.", next = "END" },
      },
    },
    dust = {
      lines = {
        { id = "d_ench", when = { profession = "Enchanting" }, text = "You have broken a good blade down and seen how little comes out of it, so you know. I sell the patience of every enchanter who did that before you, by the pinch." },
        { id = "d_default", text = "Because every pinch was once a sword or a ring or a cloak that somebody enchanted and somebody else took apart. You are buying what is left of a great deal of work, and there is never much left." },
      },
      choices = {
        { text = "Do you enchant as well as sell?", next = "self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self = {
      lines = { { id = "s_default", text = "I can draw a rune that holds, and I prefer to count. Somebody in an enchanter's shop has to know what things cost, and it is never the enchanter." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    jhag = {
      lines = { { id = "j_default", text = "He talks too much and he wastes vellum, and his runes are straighter every week. Do not tell him I said the last part, because he is hard enough to quiet as it is." } },
      choices = {
        { text = "You like him.", next = "like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    like = {
      lines = { { id = "l_default", text = "I like that he sweeps up without being asked. The rest is your imagination, {class}, and I will thank you to keep it away from my scale." } },
      choices = { { text = "Of course. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept the stores for a warband once, and dust is easier to count than grunts. It also complains less." } },
    _none = { { id = "tp_none", text = "That is not on my shelves, so it is not my business. Ask Godan, if he will look up from his runes." } },
  },
}
