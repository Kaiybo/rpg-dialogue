-- Swamp of Sorrows: the unnamed folk of Stonard a roster scan found with no conversation yet. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC = P.TODO_NPC

-- Stonard Orc: an ordinary orc of the Stonard garrison.
P:NPC {
  key = "sos_stonard_orc", id = TODO_NPC("Stonard Orc"), name = "Stonard Orc",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "weary" }, values = { "horde", "strength" },
  notices = { "race" },
  impression = {
    first = "An orc of Stonard, damp to the knees and in no mood for visitors. The swamp has clearly got into his temper.",
    third = "{name} spoke with one of the orcs who live in Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Still here, and the swamp still hasn't swallowed you. Sit by the wall, friend, where the mud's thinner." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Speak your business and go, and mind the mud by the walls, because I won't be pulling you out of it." },
    { id = "g_default", text = "Another traveller come to sink in the swamp. Speak your business, and mind the mud by the walls." },
    { id = "g_back", when = { metBefore = true }, text = "Still here? The swamp hasn't swallowed you yet, then. Give it time." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of our own blood! Sit, warrior, and tell me what news there is from Orgrimmar, because it takes a moon for word to reach this bog." },
  },
  start = "hello",
  nodes = {
    w8_duty = {
      lines = { { id = "w8_duty_a", text = "The wall on the Nethergarde side, at night, when the mist comes up and you cannot see your own axe. The humans' mages send lights over the trees sometimes, just to remind us they are there." } },
      choices = {
        { text = "Do the humans ever attack?", next = "w8_duty2" },
        { text = "A wall is only as strong as its watch.", next = "w8_duty2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_duty2 = {
      lines = { { id = "w8_duty2_a", text = "Not yet, and not for a long while, because they are busy watching the Dark Portal. But I keep my axe sharp all the same, because a quiet enemy is still an enemy." } },
      choices = {
        { text = "Keep your axe sharp.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    yfirst = {
      lines = {
        { id = "ybsosstonardorc1", text = "Only stories. My grandfather marched on Stormwind with Blackhand, and he spoke of it as the greatest day of his life. Then he would go quiet, and drink, and not speak again until morning." },
        { id = "ybsosstonardorc2", when = { race = "Orc" }, text = "You will have heard such stories too. Every orc family has a grandfather who goes quiet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "ysosstonardorc1", text = "A mate, and two young ones who have never seen Durotar. They think the whole world is a swamp, and when I tell them about the red earth and the sun, they laugh and say I am making it up." },
        { id = "ysosstonardorc2", when = { race = "Orc" }, text = "You will have seen Durotar, then. Tell my young ones, if you see them. They will believe a stranger." },
      },
      choices = {
        { text = "Will you take them there?", next = "ytake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytake = {
      lines = {
        { id = "ysosstonardorc3", text = "One day. My mate says Stonard is home, and the young should grow where they were born. I say an orc should know Durotar." },
      },
      choices = {
        { text = "Stay. Stonard is your home now.", next = "BACK", reply = "Perhaps you are right. The swamp is not so bad, when the frogs are quiet.", fx = { align = { order = 1 } } },
        { text = "Go. They should see the homeland.", next = "BACK", reply = "Yes. I will save for the zeppelin, and take them before they are grown.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Stonard is the oldest Horde fortress on this side of the sea, built when the Horde first marched on Stormwind. We held it through the defeat and the camps, and we hold it now, even if the swamp tries to rot it out from under us." } },
      again = { { id = "h_again", text = "What else, then? Say it before the rain gets heavier." } },
      choices = {
        { text = "You held Stonard through the internment?", next = "held" },
        { text = "What's the worst thing in this swamp?", next = "swamp" },
        { text = "Do you miss the battle days?", next = "battle" },
        { text = "What was it like hiding in the swamp?", next = "xhide" },
        { text = "What do you think of Thrall?", next = "xthrall" },
        { text = "How do you feel about the humans now?", next = "xhumans" },
        { text = "Lok'tar, brother. I'm an orc too.", next = "BACK", when = { race = "Orc" }, reply = "Lok'tar! You walk where our fathers marched. Do not forget it, and do not forget what it cost." },
        { text = "Do you have family in Stonard?", next = "yfamily" },
        { text = "What do you remember of the first Horde?", next = "yfirst" },
        { text = "What's the hardest duty in Stonard?", next = "w8_duty" },
        { text = "Lok'tar.", next = "END" },
      },
    },
    held = {
      lines = { { id = "hd_default", text = "Some of us hid in the swamp while the humans emptied the camps elsewhere, and we lived like beasts on frogs and roots. When Thrall freed our people, we were already here waiting, and Stonard was still ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "s_default", text = "The trolls of the sunken temple, the Atal'ai, who pray to things that should stay drowned. The crocolisks are only hungry, but those trolls want something far worse than a meal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    battle = {
      lines = { { id = "b_default", text = "Some nights, yes, and I am not proud of it. The demon blood made the old wars sweet, and Thrall says we must remember that sweetness was a lie." } },
      choices = {
        { text = "Thrall is right. The old Horde was a curse.", next = "BACK", reply = "Spoken plainly. I believe it, even if my blood forgets sometimes.", fx = { align = { light = 1 } } },
        { text = "The old Horde was strong. There's no shame in that.", next = "BACK", reply = "Strong, yes, and blind. Careful you do not fall in love with what nearly destroyed us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhide = {
      lines = {
        { id = "xxhide_0", text = "Hungry and wet, every day for years. We could see the camps' fires from the ridge, and some of us went down to them because a cage was drier than the swamp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xthrall = {
      lines = {
        { id = "xxthrall_0", text = "A warchief who never drank demon blood, and you can see it in his eyes. He leads us toward something new. Some of the old ones do not like it, but they follow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhumans = {
      lines = {
        { id = "xxhumans_0", text = "Nethergarde is south, full of humans and their mages. They watch us, and we watch them. Some grunts want to burn it. I say we have burned enough. Which way would you go?" },
      },
      choices = {
        { text = "Leave Nethergarde alone. The Horde has a new path.", next = "BACK", reply = "Thrall would say the same. I suppose I agree.", fx = { align = { order = 1 } } },
        { text = "Burn it. The humans built the camps.", next = "BACK", reply = "There are nights I want that too. Then I remember the Broken.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    durotar = { { id = "ysosstonardorc4", text = "The homeland. My young have never seen it." } },
    thrall = { { id = "tp_xthrall", text = "The warchief. He freed us, and Stonard is loyal." } },
    nethergarde = { { id = "tp_xnethergarde", text = "A human keep by the Dark Portal. We watch it closely." } },
    background = { { id = "tp_bg", text = "I am an orc of Stonard, and I have known this swamp longer than I knew freedom." } },
    _none = { { id = "tp_none", text = "Ask the Warlord's people. I only guard walls and wring out my boots." } },
  },
}

-- Stonard Hunter: one of the hunters who keep Stonard fed.
P:NPC {
  key = "sos_stonard_hunter", id = TODO_NPC("Stonard Hunter"), name = "Stonard Hunter",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "quiet", "patient" }, values = { "practical", "horde" },
  notices = { "class" },
  impression = {
    first = "A Stonard hunter with mud to the hips and a string of fish and frogs at the belt. Hunting in the swamp is plainly unglamorous work.",
    third = "{name} spoke with one of the hunters of Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back with all your toes again. Come, sit, and tell me what's moving out in the reeds." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, softly. I've heard about you, and I'd rather the crocolisks had your company than me." },
    { id = "g_default", text = "Move softly here, stranger. The crocolisks hear a footstep long before you see them." },
    { id = "g_back", when = { metBefore = true }, text = "You came back with all your toes. You must be learning the swamp." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you know that a swamp hunts you back, and that the water tells you nothing until it is too late." },
  },
  start = "hello",
  nodes = {
    w8_str = {
      lines = { { id = "w8_str_a", text = "Wax, and a pouch of oiled leather from Thralosh, and I string the bow only when I see the beast. A wet string throws the arrow low, and a crocolisk does not give you a second chance." } },
      choices = {
        { text = "How many strings do you carry?", next = "w8_str2" },
        { text = "You could use a gun instead.", next = "w8_str2" },
        { text = "I'm a hunter. I carry three spares.", next = "w8_str2", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_str2 = {
      lines = {
        { id = "w8_str2_a", text = "Four, and I use them all in a bad season. A gun is loud, and loud frightens the frogs, and if the frogs are frightened, the grunts eat bread, and they grumble less about the bread than they would about me." },
        { id = "w8_str2_hu", when = { class = "HUNTER" }, text = "Then you are wiser than most who come through here, and you will need all three. Keep them in your shirt, against your skin, where it is warm, and they will last you longer." },
      },
      choices = {
        { text = "Good advice.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    ytrolls = {
      lines = {
        { id = "ybsosstonardhunter1", text = "The Darkspear are good hunters, quiet and patient. The temple trolls are another kind. They hunt men, not beasts, and they give the hearts to the water. I do not hunt near the temple." },
        { id = "ybsosstonardhunter2", when = { race = "Troll" }, text = "You are Darkspear, I think. Your people taught me the reed snare. I owe them for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytaught = {
      lines = {
        { id = "ysosstonardhunter1", text = "My father, who hunted the forests of Ashenvale before the Horde was driven back. He said a hunter who wastes is no hunter, and he made me eat every part of my first kill, even the eyes." },
        { id = "ysosstonardhunter2", when = { race = "Tauren" }, text = "Your people would understand. The tauren hunt as my father did, with respect for the beast." },
      },
      choices = {
        { text = "Do you still follow his way?", next = "yway" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yway = {
      lines = {
        { id = "ysosstonardhunter3", text = "Always. Though here, some grunts hunt crocolisks just for the hides, and leave the meat to rot. I have shouted at them, and they laugh." },
      },
      choices = {
        { text = "Shout louder. Waste dishonours the hunt.", next = "BACK", reply = "I will. And maybe I will hide their skinning knives.", fx = { align = { light = 1 } } },
        { text = "Let them be. The swamp has plenty.", next = "BACK", reply = "Plenty, for now. Ask me again in ten years.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I hunt for the cookfires of Stonard, which means frogs, fish and crocolisk tail when the gods are kind. Nothing out here is fat, but everything out here has teeth." } },
      again = { { id = "h_again", text = "Speak, but quietly." } },
      choices = {
        { text = "What's good hunting around here?", next = "game" },
        { text = "Where shouldn't I go?", next = "danger" },
        { text = "Those crocolisk hides would make fine armor.", next = "hides" },
        { text = "What's the hardest beast to catch?", next = "xhardest" },
        { text = "How do you cook a frog?", next = "xfrog" },
        { text = "Do you ever hunt with others?", next = "xothers" },
        { text = "Tauren hunt too. Any advice for a kodo-sized hunter?", next = "BACK", when = { race = "Tauren" }, reply = "Spread your weight, walk slow and never fight a crocolisk in the water. Even an Earth Mother's child sinks in this mud." },
        { text = "Who taught you to hunt?", next = "ytaught" },
        { text = "What do you think of the trolls near the road?", next = "ytrolls" },
        { text = "How do you keep your bowstring dry out here?", next = "w8_str" },
        { text = "Good hunting.", next = "END" },
      },
    },
    game = {
      lines = { { id = "g2_default", text = "The crocolisks along the Misty Reed shore, if you are strong, and the swamp jaguars in the reeds if you are quick. Bring me the meat and I will not ask who taught you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "The sunken temple in the middle of the swamp, where the Atal'ai trolls chant into the water. And Misty Valley to the west, where the lost ones live, who were something else once and are not anymore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "hd_default", text = "They would, if you could keep them from rotting, and in this wet that is half the craft. I take only what the camp needs and leave the rest for the next season." } },
      choices = {
        { text = "That's the right way. Take only what you need.", next = "BACK", reply = "The Earth Mother's people taught us that, and they were right.", fx = { align = { light = 1 } } },
        { text = "Take everything. The swamp will make more.", next = "BACK", reply = "Then come back next year and see how empty it is.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhardest = {
      lines = {
        { id = "xxhardest_0", text = "The great crocolisk called Sorrowmaw, if he is real. I have seen his wake, and that is all, and I have no wish to see more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfrog = {
      lines = {
        { id = "xxfrog_0", text = "Skin it, salt it, spit it and pray. It tastes of mud no matter what, but the grunts eat it and do not complain twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xothers = {
      lines = {
        { id = "xxothers_0", text = "Sometimes with the trolls from the camp near the road, though they hunt for other reasons. Some hunt for food, some hunt for sport. What do you hunt for?" },
      },
      choices = {
        { text = "For food, and for need. Nothing more.", next = "BACK", reply = "Good. Then the swamp will feed you.", fx = { align = { light = 1 } } },
        { text = "For the thrill of it. A hunt is a test.", next = "BACK", reply = "Hm. Thrills fill no bellies, but I understand the pull.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    sorrowmaw = { { id = "ysosstonardhunter4", text = "A great crocolisk, if he is real. I have seen his wake." } },
    crocolisks = { { id = "tp_xcrocolisks", text = "Tasty and dangerous. Hunt them from the shore, not in the water." } },
    misty_valley = { { id = "tp_xmisty_valley", text = "The lost ones live there. Do not hunt in that valley." } },
    background = { { id = "tp_bg", text = "I am a hunter of Stonard, and the swamp is my larder and my enemy both." } },
    _none = { { id = "tp_none", text = "I know tracks and teeth, not that. Ask in the great hall." } },
  },
}

-- Stonard Shaman: a shaman of the Stonard garrison.
P:NPC {
  key = "sos_stonard_shaman", id = TODO_NPC("Stonard Shaman"), name = "Stonard Shaman",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "calm", "grave" }, values = { "spirits", "horde" },
  notices = { "class" },
  impression = {
    first = "A shaman of Stonard, listening to the rain on the roofs as if it were saying something. Perhaps it was.",
    third = "{name} spoke with one of the shamans of Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "The spirits remember you kindly, and so do I. Come in out of the rain, if you can find a dry spot." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The waters grow restless when you're near. Say what you must, quickly, and then let them settle." },
    { id = "g_default", text = "The waters are troubled today, traveller. Come in out of the rain, if you can find a place where it isn't raining." },
    { id = "g_back", when = { metBefore = true }, text = "The spirits remember you, and so do I. Welcome back." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You walk with the elements too. Then you feel it, the sickness in the water around that temple, like a fever that will not break." },
  },
  start = "hello",
  nodes = {
    w8_ask = {
      lines = { { id = "w8_ask_a", text = "Patience, and a little peace, which is hard to give in a fortress. Each dawn I pour out a bowl of clean rainwater by the Pool of Tears, and each dawn the water takes it, and some days I think it says thank you." } },
      choices = {
        { text = "Does it help?", next = "w8_ask2" },
        { text = "A small gift for a sick spirit.", next = "w8_ask2" },
        { text = "I pour water for the spirits too.", next = "w8_ask2", when = { class = "SHAMAN" } },
        { text = "Something else, shaman.", next = "BACK" },
      },
    },
    w8_ask2 = {
      lines = {
        { id = "w8_ask2_a", text = "It helps the spirits a little, and it helps me a great deal. A shaman who forgets to give stops being heard, and in this swamp, I would very much like to keep being heard." },
        { id = "w8_ask2_sham", when = { class = "SHAMAN" }, text = "Then come with me one dawn, and we will pour together. Two bowls are louder than one, and the water here needs to know that more than one of us still remembers it." },
      },
      choices = {
        { text = "May the waters heal.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    ytaught = {
      lines = {
        { id = "ysosstonardshaman1", text = "Drek'Thar, briefly, before he went north to the Frostwolves. He taught me to listen before I speak, and to speak only when the spirits are ready. I have been listening ever since." },
        { id = "ysosstonardshaman2", when = { class = "SHAMAN" }, text = "You will know his name, perhaps. He is old now, and wise, and very tired." },
      },
      choices = {
        { text = "Do you miss him?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "ysosstonardshaman3", text = "Yes. He would know what to do about the temple. I do not. I only know that something wakes beneath the water, and that the spirits are afraid." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I tend the spirits for Stonard, and in this swamp, the spirits of water outnumber all the rest. They are restless, because something old and wicked sleeps beneath the sunken temple." } },
      again = { { id = "h_again", text = "What else do you wish to know? The spirits of this swamp are restless, and so am I." } },
      choices = {
        { text = "What sleeps under the temple?", next = "temple" },
        { text = "How did shamanism return to the orcs?", next = "return" },
        { text = "I don't believe in spirits.", next = "doubt" },
        { text = "Which spirits answer you here?", next = "xspirits" },
        { text = "Can the swamp be healed?", next = "xheal" },
        { text = "Do you know the Atal'ai's prayers?", next = "xatal" },
        { text = "I am a shaman too. Teach me the waters here.", next = "BACK", when = { class = "SHAMAN" }, reply = "Listen first, speak later. The water here speaks in a low voice, and it is frightened. Do not frighten it more." },
        { text = "Who taught you the ways of the spirits?", next = "ytaught" },
        { text = "What do the water spirits ask of you?", next = "w8_ask" },
        { text = "Farewell, shaman.", next = "END" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "The trolls call him Hakkar, the Soulflayer, a god of blood their ancestors drowned along with their temple. His priests still pray to him down there, and the water carries their prayers like poison through the roots." } },
      choices = {
        { text = "Then the temple should be cleansed by force.", next = "BACK", reply = "Many have tried, and the swamp keeps their bones. Go strong, if you go.", fx = { align = { order = 1 } } },
        { text = "Leave the trolls be. Their god is their business.", next = "BACK", reply = "Their god does not stay their business. The water does not respect such lines.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "Thrall brought it back to us, after the warlocks led us away from the old ways and into the arms of demons. The spirits were slow to forgive, but they did forgive, and I am grateful every day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    doubt = {
      lines = { { id = "d_default", text = "The rain falls on you whether you believe in it or not. Stand in the swamp for a night and listen, and then tell me again what you do not believe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xspirits = {
      lines = {
        { id = "xxspirits_0", text = "Water most, and earth a little, where the roots hold the mud. Fire hardly ever answers here, because the rain smothers it. Air comes only in storms, and it is angry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      lines = {
        { id = "xxheal_0", text = "Perhaps, if the temple's servants were driven out. The water is sick because of what they feed it. Some say the Horde should march on it, and some say it is not ours to fight. What say you?" },
      },
      choices = {
        { text = "March on it. The water cannot wait.", next = "BACK", reply = "Brave words. I hope you mean them when the time comes.", fx = { align = { order = 1 } } },
        { text = "Let the trolls answer for their own temple.", next = "BACK", reply = "The water will not wait for the trolls, friend.", fx = { align = { order = -1 } } },
      },
    },
    xatal = {
      lines = {
        { id = "xxatal_0", text = "Enough to know they call on Hakkar, and enough to stop listening. Words like those leave a taste in the mouth." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    drekthar = { { id = "ysosstonardshaman4", text = "My teacher, for a time. He went north to the Frostwolves." } },
    spirits = { { id = "ysosstonardshaman5", text = "Water most of all. They are restless here." } },
    hakkar = { { id = "tp_xhakkar", text = "The blood god of the trolls. The water around the temple stinks of him." } },
    thrall = { { id = "tp_xthrall", text = "The warchief brought us back to the spirits. I owe him everything." } },
    background = { { id = "tp_bg", text = "I am a shaman of the Horde, and the waters of this swamp have been my teachers for many years." } },
    _none = { { id = "tp_none", text = "The spirits are silent on that, and so am I." } },
  },
}

-- Stonard Explorer: a scout who walks the swamp's edges for the garrison.
P:NPC {
  key = "sos_stonard_explorer", id = TODO_NPC("Stonard Explorer"), name = "Stonard Explorer",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "stonard" }, temper = { "restless", "blunt" }, values = { "horde", "curious" },
  notices = { "race" },
  impression = {
    first = "A Stonard explorer, scratched and sunburned from paths that most of the garrison won't walk. Restless energy came off the orc like steam.",
    third = "{name} spoke with one of the explorers of Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again! Come and tell me what's past the edge of the map, because I've been stuck here staring at it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'd sooner walk into the Sunken Temple alone than walk a mile of this swamp beside you." },
    { id = "g_default", text = "Back from the edge of the map, are you, or headed toward it? Either way, I envy you the dry roads." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Did you find anything worth the walk this time?" },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Tell me, troll, can you make any sense of the carvings on that sunken temple, because I cannot." },
  },
  start = "hello",
  nodes = {
    exp_tow1 = {
      lines = {
        { id = "exp_tow1_1", text = "I have never been up close, and I never will, for every scout who tried came back with nothing to say. From the ridge it is a black spire with no lights in it, and yet the crows will not fly over it, which is all I need to know." },
      },
      choices = {
        { text = "Do you report it to the Commander?", next = "exp_tow2" },
        { text = "Something else, scout.", next = "BACK" },
      },
    },
    exp_tow2 = {
      lines = {
        { id = "exp_tow2_1", text = "Every season, the same report, that the tower stands and nothing comes out of it. Commander Ruag reads it and says nothing, but he has never once ordered a patrol up that road, and I think he has read the same old reports I have." },
      },
      choices = {
        { text = "Wise of him.", next = "exp_tow3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    exp_tow3 = {
      lines = {
        { id = "exp_tow3_1", text = "Wise, or afraid, and in that place I am not sure there is a difference. I will go anywhere in this swamp for the garrison, but I will not go up that road, and I have told him so to his face." },
      },
      choices = {
        { text = "Some roads are better left. Something else.", next = "BACK" },
      },
    },
    exp_rock1 = {
      lines = {
        { id = "exp_rock1_1", text = "I go round them, through the reeds on the south side, where the ogres do not bother to look because they think nothing could walk there. It is wet and it stinks, but I have walked worse, and the Dreadmaul are loud enough to hear from far off." },
      },
      choices = {
        { text = "What are they doing in Rockard?", next = "exp_rock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exp_rock2 = {
      lines = {
        { id = "exp_rock2_1", text = "Building, if you can believe it, stacking the old stones of the Horde's town into walls of their own. My father helped raise that town in the old days, and I watch ogres pile up his work like a child's blocks." },
      },
      choices = {
        { text = "That must burn.", next = "BACK" },
        { text = "One day the Horde will take it back.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I walk the swamp's edges for the garrison, from the Blasted Lands' red border to the Deadwind Pass. Somebody has to know what's out there before it comes knocking on our gates." } },
      again = { { id = "h_again", text = "Anything else? I leave at dusk." } },
      choices = {
        { text = "A scout's report should be honest, even when it's bad news.", next = "BACK", reply = "It should, because a bad report that's true has saved more orcs than any good one.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pad your report a little; the Commander loves good news.", next = "BACK", reply = "And then the Commander marches us into a bog that doesn't exist. No, thank you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's south, toward the Blasted Lands?", next = "south" },
        { text = "And west, toward Deadwind Pass?", next = "west" },
        { text = "Have you ever seen Stormwind?", next = "stormwind" },
        { text = "What's the strangest thing you've found?", next = "xstrange" },
        { text = "Have you met the Broken?", next = "xbroken" },
        { text = "Why do you keep walking?", next = "xwhy" },
        { text = "I'm a Darkspear, and I'll look at those carvings.", next = "BACK", when = { race = "Troll" }, reply = "Ha! Thank you, troll. Bring back a drawing, and I will buy you a drink of whatever the swamp hasn't spoiled." },
        { text = "What does the tower in the pass look like up close?", next = "exp_tow1" },
        { text = "How do you get past the ogres at Rockard?", next = "exp_rock1" },
        { text = "Safe travels.", next = "END" },
      },
    },
    south = {
      lines = { { id = "s_default", text = "Red earth and a broken sky, and the ruin of the Dark Portal, where the Horde first came into this world. The humans keep a fortress there called Nethergarde, and they watch the Portal like it might open again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    west = {
      lines = { { id = "w_default", text = "Dead trees and a silence that sits on your chest, and a tower in the pass that nobody goes near. Even the ogres give it a wide berth, which tells you plenty." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind = {
      lines = { { id = "st_default", text = "From the hills, once, when I was young and the Horde burned it to the ground. They rebuilt it whiter and taller than before, I hear, and I don't know whether that should make me angry or ashamed." } },
      choices = {
        { text = "Burning it was a crime. Be ashamed.", next = "BACK", reply = "Maybe I am, and maybe that's why I keep walking.", fx = { align = { honor = 1 } } },
        { text = "It was war. The humans would have done the same.", next = "BACK", reply = "They did, after, in their camps. That doesn't make it sit easier.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstrange = {
      lines = {
        { id = "xxstrange_0", text = "A dwarf, alone, in Deadwind Pass, writing in a book and muttering about ley lines. He saw me and ran so fast I never learned his name. I still wonder what he wanted there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbroken = {
      lines = {
        { id = "xxbroken_0", text = "A few, at the Harborage. Their skin is grey and their eyes are tired, and they flinch when we pass. Some of the grunts call them weak. I call them a warning." },
      },
      choices = {
        { text = "A warning of what?", next = "xwarn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarn = {
      lines = {
        { id = "xxwarn_0", text = "Of what the old Horde was. We did that to them, with demon blood in our veins. Some of my brothers say we should help them now. Others say it is not our business. What do you say?" },
      },
      choices = {
        { text = "Help them. That debt is yours to pay.", next = "BACK", reply = "Maybe. Ruag would call it soft, but I would call it right.", fx = { align = { honor = 1 } } },
        { text = "The past is past. Look after Stonard.", next = "BACK", reply = "That is what the commander says. I am not sure I agree.", fx = { align = { honor = -1 } } },
      },
    },
    xwhy = {
      lines = {
        { id = "xxwhy_0", text = "Because when I stop, I remember the camps. Walking keeps me free, even in a swamp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deadwind_pass = { { id = "tp_xdeadwind_pass", text = "A dead, quiet pass with a tower nobody goes near. Including me." } },
    harborage = { { id = "tp_xharborage", text = "Where the Broken hide. Leave them in peace, if you pass." } },
    background = { { id = "tp_bg", text = "I'm an explorer for Stonard, and I've worn out more boots than I can count." } },
    _none = { { id = "tp_none", text = "Never walked that way, and never heard of it. Ask me again after my next trip." } },
  },
}

-- Stonard Cartographer: the garrison's mapmaker.
P:NPC {
  key = "sos_stonard_cartographer", id = TODO_NPC("Stonard Cartographer"), name = "Stonard Cartographer",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "stonard" }, temper = { "fussy", "precise" }, values = { "order", "horde" },
  notices = { "race" },
  impression = {
    first = "A Stonard cartographer, an orc bent over damp parchment with ink to the wrists. Hearing a mapmaker complain about the rain is somehow new.",
    third = "{name} spoke with the cartographer of Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the traveller! Come, come, but don't drip on the maps, and tell me everything you've found." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Careful of the maps, and keep your distance. I've heard enough about you to want the table between us." },
    { id = "g_default", text = "Careful, careful, do not drip on the maps! The swamp has ruined three already this season." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the traveller. Have you anything for me, a path, a ruin, a river that moved?" },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and in Stonard, which I will mark on my map as a very strange day. Keep your little fingers off my ink." },
  },
  start = "hello",
  nodes = {
    car_mov1 = {
      lines = {
        { id = "car_mov1_1", text = "The Misty Reed shore, where the sea and the swamp argue every spring and neither wins. A sandbar that was there in winter is a channel in summer, and the murlocs build their huts wherever the water lets them." },
      },
      choices = {
        { text = "How do you keep up with it?", next = "car_mov2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    car_mov2 = {
      lines = {
        { id = "car_mov2_1", text = "I draw the shore in charcoal, not ink, so I can wipe it off and draw it again. Grug taught me that, said only a fool inks a coastline, and I have been grateful for it every year since." },
      },
      choices = {
        { text = "Charcoal maps for a changing land.", next = "car_mov3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    car_mov3 = {
      lines = {
        { id = "car_mov3_1", text = "Exactly, and ink for the things that do not change, like Stonard and the road and the sunken temple. Those I draw dark and hard, because if any of them moves, the map will be the least of our troubles." },
      },
      choices = {
        { text = "A fair rule. Something else.", next = "BACK" },
      },
    },
    car_grug1 = {
      lines = {
        { id = "car_grug1_1", text = "A legend to the young ones, and an old fool with ink on his tusks to those of us who knew him. He mapped half of Khaz Modan for the Horde in the Second War, and he never once got lost, or never once admitted it." },
      },
      choices = {
        { text = "What became of him?", next = "car_grug2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    car_grug2 = {
      lines = {
        { id = "car_grug2_1", text = "The camps, like most of the old Horde, and he never came out of them. The night before the humans took him, he gave me his charcoal and told me to draw this swamp so well that no orc would ever be lost in it, and I am still trying." },
      },
      choices = {
        { text = "Then you honour him with every map.", next = "BACK" },
        { text = "Back to other matters.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I make the maps that tell Stonard where the swamp ends and the dangers begin, which is harder than it sounds when the water moves every spring. Every scout who comes back tells me something, and I put it down before they forget it." } },
      again = { { id = "h_again", text = "Yes, yes, what else? And mind the ink, it isn't dry on the Misty Valley sheet." } },
      choices = {
        { text = "An orc mapmaker? That's unusual.", next = "orc" },
        { text = "What's the hardest place to map?", next = "hard" },
        { text = "Why does Stonard need maps at all?", next = "why" },
        { text = "Can I see one of your maps?", next = "xmap" },
        { text = "Who was the old raider who taught you?", next = "xraider" },
        { text = "Do scouts ever lie to you?", next = "xlie" },
        { text = "I'm a gnome, and I adore a good map.", next = "BACK", when = { race = "Gnome" }, reply = "Hmph. Then look, but do not touch, and do not tell me how a gnome would draw it better." },
        { text = "Which part of the swamp moves the most?", next = "car_mov1" },
        { text = "Old Grug the Ink sounds like a legend.", next = "car_grug1" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "Unusual now, but the Horde marched across half of Azeroth in the old wars, and somebody had to know the roads. I learned from an old raider who drew in the dirt with his axe, and I've only got neater since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "hd_default", text = "The Pool of Tears around the sunken temple, because no scout who goes in close comes out willing to talk about it. I have a blank space there on every map, and I hate it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because an army that knows the land beats an army that is braver, and the Horde has learned that lesson in blood. Dispatch Commander Ruag wants to know every path an enemy could use to reach us." } },
      choices = {
        { text = "Knowledge wins wars. Your work matters.", next = "BACK", reply = "Finally, someone who understands! Tell the grunts that, they laugh at me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Courage wins wars, not parchment.", next = "BACK", reply = "Courage drowns in a bog it didn't know was there. Remember that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmap = {
      lines = {
        { id = "xxmap_0", text = "Look here, Stonard in the middle, the Misty Reed shore to the east and this blot of water is the Pool of Tears. The blank bits are where I am still waiting for scouts who come back." },
      },
      choices = {
        { text = "How long do you wait?", next = "xwait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwait = {
      lines = {
        { id = "xxwait_0", text = "A season, sometimes two. Then I draw a skull and move on. Ruag says I should send grunts out to finish the map whatever it costs. I say a map isn't worth that many lives. What do you think?" },
      },
      choices = {
        { text = "Finish the map. Knowledge saves more lives later.", next = "BACK", reply = "Ruag would agree with you. Grimly, but he would.", fx = { align = { honor = -1 } } },
        { text = "No map is worth a grunt's life.", next = "BACK", reply = "Thank you. Tell that to the commander, will you?", fx = { align = { honor = 1 } } },
      },
    },
    xraider = {
      lines = {
        { id = "xxraider_0", text = "Old Grug the Ink, they called him. He drew in blood and charcoal during the Second War, and his maps were so good the humans burned them on sight. He died in a camp, and I carry on." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlie = {
      lines = {
        { id = "xxlie_0", text = "All the time, to make themselves sound braver. I have a rule, now. Any monster described as twice the size of a kodo, I draw at half that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    pool_of_tears = { { id = "tp_xpool_of_tears", text = "The blankest spot on my maps, and I would like to keep it that way." } },
    stonard = { { id = "tp_xstonard", text = "A fortress on a map that keeps changing under it." } },
    background = { { id = "tp_bg", text = "I'm Stonard's mapmaker, and I know this swamp better on paper than most do on foot." } },
    _none = { { id = "tp_none", text = "It isn't on any of my maps, so I cannot help you." } },
  },
}

-- Stonard Wayfinder: guides travellers along the swamp paths.
P:NPC {
  key = "sos_stonard_wayfinder", id = TODO_NPC("Stonard Wayfinder"), name = "Stonard Wayfinder",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "stonard" }, temper = { "steady", "dry" }, values = { "duty", "horde" },
  notices = { "race" },
  impression = {
    first = "A Stonard wayfinder, an orc who leads travellers along the firm paths through the mire. He walked around one patch of ground I would have stepped straight into.",
    third = "{name} spoke with one of the wayfinders of Stonard.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You found your way back, and you're welcome at our fire any night you like. I'll still take some of the credit." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Say what you came to say and leave us to our work, because the swamp won't map itself." },
    { id = "g_default", text = "Lost already? Most folk are, the first time they leave the road in this swamp." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back. I'll take some of the credit for that." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren in the swamp! Step carefully, big one, because the mud here will hold a kodo to its belly." },
  },
  start = "hello",
  nodes = {
    w8_mark = {
      lines = { { id = "w8_mark_a", text = "Knots in the reeds, mostly, two for firm ground and three for a turn, and a red rag on a stick where the path goes under water at high tide. The trolls cut my rags down sometimes, and I tie them up again, and that's the whole war between us." } },
      choices = {
        { text = "Why do the trolls cut them?", next = "w8_mark2" },
        { text = "Two knots firm, three a turn. Got it.", next = "w8_mark2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_mark2 = {
      lines = { { id = "w8_mark2_a", text = "Because they want travellers to wander into the deep places near the temple, I think, and some of them do. If you see a path with no knots at all, turn back, even if it looks dry." } },
      choices = {
        { text = "I'll look for the knots.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    ystrange = {
      lines = {
        { id = "ybsosstonardwayfinder1", text = "A human boat, stuck in the mud a mile from any water, with a skeleton still holding the oars. No one knows how it got there. My mother says the swamp moves things when it's angry, and I've stopped arguing with her." },
        { id = "ybsosstonardwayfinder2", when = { class = "SHAMAN" }, text = "The spirits might know how it got there. Ask them, if you're braver than me." },
      },
      choices = {
        { text = "A guide should never lead a traveller astray, whatever they pay.", next = "BACK", reply = "That's the first thing we swear, and the last thing we'd ever break.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Lead a rich fool the long way and charge by the mile.", next = "BACK", reply = "Some do, and then the swamp takes them both. It's not a trade I'd take up.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    ymother = {
      lines = {
        { id = "ysosstonardwayfinder1", text = "Old now, and stubborn, and she still walks the swamp every morning to check the paths. She says the ground shifts after rain, and a wayfinder who doesn't check is a wayfinder who drowns." },
        { id = "ysosstonardwayfinder2", when = { race = "Orc" }, text = "She would like you. She likes anyone who walks like they know where they're going." },
      },
      choices = {
        { text = "Did she ever regret hiding?", next = "yregret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yregret = {
      lines = {
        { id = "ysosstonardwayfinder3", text = "She says no. She says the camps would have killed her spirit. But some who went to the camps came out stronger, under Thrall. She wonders, sometimes, if she was a coward." },
      },
      choices = {
        { text = "She survived free. That took courage.", next = "BACK", reply = "I'll tell her you said so. She'll pretend not to care.", fx = { align = { honor = 1 } } },
        { text = "The camps tested others. She avoided the test.", next = "BACK", reply = "Hm. Don't say that to her face. She still carries an axe.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I know where the ground holds and where it swallows, and I lead the caravans and the new arrivals between Stonard and the roads. More grunts have been lost to the mire than to the trolls, and that is not a joke." } },
      again = { { id = "h_again", text = "What else do you need to know? I know every dry path through these reeds, so ask." } },
      choices = {
        { text = "How do you tell firm ground from mire?", next = "ground" },
        { text = "Which road out is safest?", next = "roads" },
        { text = "I can find my own way.", next = "own" },
        { text = "What's the worst place you've led someone?", next = "xworst" },
        { text = "Who taught you the swamp?", next = "xtaught" },
        { text = "Do you ever lead Alliance travellers?", next = "xalliance" },
        { text = "I'm a hunter. My pet doesn't mind mud.", next = "BACK", when = { class = "HUNTER" }, reply = "Your pet doesn't mind mud until it swallows it. Keep it close and on firm ground, friend." },
        { text = "What's your mother like?", next = "ymother" },
        { text = "What's the strangest thing you've found in the swamp?", next = "ystrange" },
        { text = "What do you mark your paths with?", next = "w8_mark" },
        { text = "Thanks, wayfinder.", next = "END" },
      },
    },
    ground = {
      lines = { { id = "g2_default", text = "Look for the reeds that grow upright and the roots that run along the top, because they only grow where there's something under them. If the water is still and bright, walk around it, every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roads = {
      lines = { { id = "r_default", text = "North through Deadwind Pass toward Duskwood, if you can stand the quiet, or south to the Blasted Lands if you have business with demons and ruins. The east is all coast and crocolisks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    own = {
      lines = { { id = "o_default", text = "Then go, and I'll see you again, or I'll see your boots sticking out of a bog. The swamp makes no promises, and neither do I." } },
      choices = {
        { text = "A good warrior trusts no one's path but their own.", next = "BACK", reply = "A good warrior, maybe. A live one listens.", fx = { align = { order = -1 } } },
        { text = "Fair enough. I'll follow the one who knows.", next = "BACK", reply = "Wise. Stay close and step where I step.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xworst = {
      lines = {
        { id = "xxworst_0", text = "A goblin trader wanted the short way to the Blasted Lands. I told him there was none, and he paid me double to find one. We found the Pool of Tears instead, and I found the long way home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtaught = {
      lines = {
        { id = "xxtaught_0", text = "My mother, who hid in this swamp through the camp years. She learned every firm path because a wrong step meant death, and she taught me every one before I could walk properly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalliance = {
      lines = {
        { id = "xxalliance_0", text = "Never. But I have seen them lost, near the road to Duskwood. Some say leave them to the swamp, and some say a lost traveller is a traveller, whatever banner. Which way do you lean?" },
      },
      choices = {
        { text = "Help them out. Mud cares nothing for banners.", next = "BACK", reply = "My mother would agree. Quietly, of course.", fx = { align = { honor = 1 } } },
        { text = "Leave them to it. They're the enemy.", next = "BACK", reply = "Aye. That is what the commander would say.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    mother = { { id = "ysosstonardwayfinder4", text = "She hid in this swamp through the camp years." } },
    pool_of_tears = { { id = "tp_xpool_of_tears", text = "Not a place to lead anyone, unless you mean them harm." } },
    stonard = { { id = "tp_xstonard", text = "My home. Built on the only dry ground for miles." } },
    background = { { id = "tp_bg", text = "I'm a wayfinder of Stonard, born to this swamp, and I have not lost a traveller yet." } },
    _none = { { id = "tp_none", text = "I know paths, not that. Ask at the inn." } },
  },
}

-- Broken Exile: one of the broken survivors of Draenor who shelter at the Harborage in the swamp.
P:NPC {
  key = "sos_broken_exile", id = 11198, name = "Broken Exile", gender = "male",
  role = "refugee", tier = "service",
  temper = { "weary", "wary" }, values = { "survival" },
  notices = { "race" },
  impression = {
    first = "A hunched, ashen-skinned exile who flinches at the sight of an orc's axe.",
    third = "{name} met a Broken Exile at the Harborage in the Swamp of Sorrows.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back to the Harborage, and the mist seems lighter for it. Sit, friend, and rest a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. There is little here but mist and memory, and I would rather not add you to either." },
    { id = "g_default", text = "You come to the Harborage, stranger. There is little here but mist and memory, but you may rest a while." },
    { id = "g_orc", when = { race = "Orc" }, text = "An orc. Your people burned my world. Say your piece and go, before my courage fails." },
  },
  start = "hello",
  nodes = {
    w8_days = {
      lines = { { id = "w8_days_a", text = "I carve, stranger, small things in swamp wood, the shapes of animals I remember from Draenor. The talbuk, the great grey beasts of burden, the little birds of the high forests, and I give them to the children of the Harborage so they will know what was lost." } },
      choices = {
        { text = "May I see one?", next = "w8_days2" },
        { text = "That's a kind thing to do.", next = "w8_days2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_days2 = {
      lines = { { id = "w8_days2_a", text = "Here, this one is a talbuk, with the horns curled back. The children laugh at it, because they have never seen one, and I tell them that one day they will, and I try to believe it when I say it." } },
      choices = {
        { text = "I hope they do.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    yportal = {
      lines = {
        { id = "ybsosbrokenexile1", text = "Fire, and noise, and the sky turning red. We fled through it because the orcs had already gone, and we thought the new world might be kinder. It was not, at first. The swamp was the first place that let us rest." },
        { id = "ybsosbrokenexile2", when = { race = "Human" }, text = "Your people did not know what we were. Some shot at us, and some fed us. I remember both." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylive = {
      lines = {
        { id = "ysosbrokenexile1", text = "We fish, and we gather roots, and we trade with the few who will trade with us. The orcs of Stonard leave us be, and the humans of Nethergarde do not come this far. It is a small life, but it is a life." },
        { id = "ysosbrokenexile2", when = { faction = "Horde" }, text = "Your Horde leaves us be. That is more mercy than we expected, and I do not know whether to be grateful or wary." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "We are the Broken, what remains of a proud people from a world called Draenor. We came through the Dark Portal long ago, and now we hide in this swamp and wait." } },
      again = { { id = "h_again", text = "Is there more you would ask, stranger? Speak softly, so the mist does not carry it." } },
      choices = {
        { text = "What happened to your people?", next = "people" },
        { text = "What do you wait for?", next = "wait" },
        { text = "What was Draenor like before?", next = "xdraenor" },
        { text = "Who leads your people here?", next = "xleader" },
        { text = "Do you ever think of going home?", next = "xhome" },
        { text = "I am an orc, and I am sorry.", next = "BACK", when = { race = "Orc" }, reply = "Sorry. It is a small word for what was done. But I have never heard an orc say it before, and I will remember that you did." },
        { text = "How do your people live in the swamp?", next = "ylive" },
        { text = "Will you pray with me?", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, reply = "I would. It has been long since anyone asked. Kneel, and I will say the old words, if I still remember them." },
        { text = "What do you remember of the Dark Portal?", next = "yportal" },
        { text = "What do you do to pass the days here?", next = "w8_days" },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "The orcs fell upon us, driven mad by demon blood, and slaughtered our cities. Those of us who lived were twisted by the fel magic, and so we are broken, in body and in spirit." } },
      choices = {
        { text = "The orcs have changed since then.", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "So I hear, but the dead do not hear it, and neither do my nightmares. Perhaps one day I will believe it." } },
      choices = {
        { text = "Every people deserves a second chance.", next = "BACK", reply = "Perhaps. I am too tired to argue.", fx = { align = { order = -1 } } },
        { text = "Some crimes should never be forgotten.", next = "BACK", reply = "Then we understand each other, stranger.", fx = { align = { order = 1 } } },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "For the end of our exile, or the end of ourselves, whichever comes first. The swamp is quiet, at least, and the trolls of the temple do not trouble us here." } },
      choices = { { text = "I hope it's the former. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdraenor = {
      lines = {
        { id = "xxdraenor_0", text = "Green, and wide, with cities of crystal and great forests where the talbuks ran. We were a people of priests and scholars, and we believed the Light would protect us." },
      },
      choices = {
        { text = "Did it protect you?", next = "xlight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      lines = {
        { id = "xxlight_0", text = "Some of us still believe it did, because we live. Others say the Light abandoned us, and now they do not pray at all. What do you think, stranger?" },
      },
      choices = {
        { text = "The Light never left you. You're still here.", next = "BACK", reply = "I would like to believe that. Perhaps, with time, I will.", fx = { align = { light = 1 } } },
        { text = "Gods and Light both fail. Trust yourself instead.", next = "BACK", reply = "A hard answer. Many of my people have come to share it.", fx = { align = { light = -1 } } },
      },
    },
    xleader = {
      lines = {
        { id = "xxleader_0", text = "Magtoor speaks for us at the Harborage, if anyone does. He is patient and old, and he keeps us from scattering into the swamp to die alone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhome = {
      lines = {
        { id = "xxhome_0", text = "There is no home, stranger. The Dark Portal is broken and Draenor is torn apart, or so we were told by the last who came through. We are the last of what was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    magtoor = { { id = "ysosbrokenexile3", text = "He speaks for us. He is patient and old." } },
    draenor = { { id = "tp_xdraenor", text = "My lost world. I see it in my dreams, and then I wake in the swamp." } },
    orcs = { { id = "tp_xorcs", text = "I try to see them as they are now. Some days I succeed." } },
    background = { { id = "tp_bg", text = "I am of the Broken. Once, that meant something else." } },
    _none = { { id = "tp_none", text = "I do not know, stranger. The mist keeps its own counsel, and so do I." } },
  },
}
