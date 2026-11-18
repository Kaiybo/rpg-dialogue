-- More of Mulgore: Brave Wildrunner of Bloodhoof (Forever chain), Lanka Farshot and Moodan Sungrain at
-- Camp Narache, Harant Ironbrace and Uthan Stillwater by Bloodhoof, and Rimblat Earthshatter of the
-- Earthen Ring at Camp Gev'rek. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Brave Wildrunner: Bloodhoof's guard. Forever: Longwalker Malah > Grim Tidings > Our Ancient Enemy.
---------------------------------------------------------------------------
P:NPC {
  key = "wildrunner", id = TODO_NPC("Brave Wildrunner"), name = "Brave Wildrunner",
  bible = "bibles/more_folk.md", role = "guard", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady", "earnest" }, values = { "duty", "tribe" },
  notices = { "race", "class" },
  impression = {
    first = "He takes the safety of the village personally.",
    third = "{name} met Brave Wildrunner, a watchful brave who guards Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Peace, traveller. If you are lost, I can point the way; if you are trouble, I can point the way out." },
    { id = "g_back", when = { metBefore = true }, text = "You are back in Bloodhoof. The village is quiet today, and I mean to keep it that way." },
    { id = "g_malah", when = { questActive = TODO_QUEST("Longwalker Malah") }, text = "Have you found Longwalker Malah yet? A longwalker never stays long in one place, so do not dawdle." },
    { id = "g_enemy", when = { questDone = TODO_QUEST("Our Ancient Enemy") }, text = "Word of what you did has reached every fire in Bloodhoof. The braves speak your name with respect now." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother. Did you train at Camp Narache? I remember most of the faces that come down the road from there." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry yourself like a brave who has stood in a line. Good, because the village could use more of those." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Wildrunner, and I keep watch over Bloodhoof. The innkeeper, the trainers, the road to Thunder Bluff; ask me where anything is, and I will tell you." },
        { id = "h_malah", when = { questActive = TODO_QUEST("Longwalker Malah") }, text = "You carry my word to Longwalker Malah. The longwalkers see what the rest of us miss, out on the far edges of Mulgore, and if Malah has news, I want it." },
        { id = "h_grim", when = { questActive = TODO_QUEST("Grim Tidings") }, text = "Grim tidings, then. I feared as much when the longwalkers stopped coming home on time." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of the Forsaken. The High Chieftain says you are our allies, so you are welcome here, but keep your distance from the kodo; they do not like the smell of you." },
      },
      again = {
        { id = "h_again", text = "What else? I am on watch, but I can watch and talk." },
        { id = "h_again2", text = "Ask. The village will not run off while we speak." },
      },
      choices = {
        { text = "Where can I find what I need in Bloodhoof?", next = "directions" },
        { text = "Who are the longwalkers?", next = "longwalkers" },
        { text = "What threatens the village most?", next = "threats" },
        { text = "I trained at Camp Narache, Wildrunner.", next = "narache", when = { race = "Tauren" } },
        { text = "You must stand here all day.", next = "duty" },
        { text = "Earth Mother watch over you.", next = "END" },
      },
    },
    directions = {
      lines = { { id = "di_default", text = "Innkeeper Kauth keeps the inn by the totem, and the trainers have their tents around it. The road north climbs to Thunder Bluff, and if you want to fish, Uthan Stillwater sits by Stonebull Lake to the west most days." } },
      choices = {
        { text = "And if I'm looking for work?", next = "directions_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    directions_work = {
      lines = { { id = "dw_default", text = "Then speak to Baine, or to any of the elders by the great totem. There is always a quilboar camp too close or a harpy nest too bold, and they will be glad of you." } },
      choices = {
        { text = "Then I'll go and find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    longwalkers = {
      lines = { { id = "lw_default", text = "Scouts who walk the edges of our land, farther than any brave on watch. They come home, tell us what they saw, and go out again; Longwalker Malah has walked more of Mulgore than anyone I know." } },
      choices = {
        { text = "And when they don't come home?", next = "longwalkers_late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longwalkers_late = {
      big = true,
      lines = { { id = "ll_default", text = "Then someone must go and find out why, and that someone is often not me, because my place is at this post. I hate it, but a brave who leaves his post to chase a worry leaves the village open behind him." } },
      choices = {
        { text = "Your post matters. Let others do the walking.", next = "BACK", reply = "Thank you. That is what I tell myself, though it is better to hear it from someone else.", fx = { align = { order = 1 } } },
        { text = "Sometimes you should leave your post and go.", next = "BACK", reply = "Perhaps, and perhaps one day I will. Today, I will send you instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "th_default", text = "The quilboar from the south, the harpies in the cliffs, and the Venture Company's machines in the hills. The centaur do not come this far into Mulgore anymore, but my grandmother remembers when they did." } },
      choices = {
        { text = "Tell me about the centaur.", next = "threats_centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_centaur = {
      lines = { { id = "tc_default", text = "They hunted our people across the Barrens for generations, until the High Chieftain and Thrall's orcs drove them back. That is why we have a home here at all, and why we do not forget who helped us win it." } },
      choices = {
        { text = "The Horde keeps its debts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    narache = {
      lines = { { id = "na_default", text = "Then Chief Hawkwind sent you down here, and you have fought the plainstriders and the Battleboar. Welcome to Bloodhoof; the work is harder here, but the beds are softer." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    duty = {
      big = true,
      lines = { { id = "du_default", text = "From the first light to the last, and sometimes longer. Some braves think watching is dull work, but I would rather be here bored than away while the village burns." } },
      choices = {
        { text = "Watching is the most honourable work there is.", next = "BACK", reply = "Not many say that. I will remember it on the long nights.", fx = { align = { honor = 1 } } },
        { text = "Glory is out there, not at a gate.", next = "BACK", reply = "Then go and find it, and send word if you need a brave who knows how to stand still.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a brave of Bloodhoof, and the Wildrunners have stood watch here since the village was a ring of tents." } },
    _none = { { id = "tp_none", text = "I cannot point you to that. Ask an elder, they know more than a brave on watch." } },
  },
}

---------------------------------------------------------------------------
-- Lanka Farshot: hunter trainer at Camp Narache. Classic: ends Etched Note.
---------------------------------------------------------------------------
P:NPC {
  key = "lanka", id = TODO_NPC("Lanka Farshot"), name = "Lanka Farshot", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "narache" }, temper = { "steady", "sharp" }, values = { "tradition", "tribe" },
  notices = { "class" },
  impression = {
    first = "He does not hand out praise for free.",
    third = "{name} met Lanka Farshot, the hunter trainer at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "The plains are watching you, young one, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you practised, or only talked about practising?" },
    { id = "g_note", when = { questActive = TODO_QUEST("Etched Note") }, text = "You have read my note. Good; then you are ready to learn, and I hear good things about you already." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} follows you well. A hunter is judged by the beast at their side, and you are not being judged poorly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Lanka Farshot, and I teach the hunter's ways at Camp Narache. The plains of Mulgore will be your home for some time, so learn them well, for one day you will walk in lands where nobody knows your name." },
        { id = "h_note", when = { questActive = TODO_QUEST("Etched Note") }, text = "Your bloodline is strong, and the elders think you are skilled already. That, we will test, and I will teach you how to tame a beast and fire a rifle, and much else besides." },
        { id = "h_nothunter", when = { class = { "WARRIOR", "SHAMAN", "DRUID" } }, text = "You are not one of mine, but every tauren should know how to track and shoot. Ask, and I will answer what I can." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; the plainstriders will not wait for us." },
        { id = "h_again2", text = "Ask your question. A hunter is patient, until he isn't." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What makes a good hunter?", next = "good" },
        { text = "Tell me about the beasts of Red Cloud Mesa.", next = "mesa" },
        { text = "Why should a hunter serve the tribe?", next = "tribe" },
        { text = "How do I choose a beast to tame?", next = "tame", when = { class = "HUNTER" } },
        { text = "I'll be on my way, Lanka.", next = "END" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "Patience, a steady hand and respect for the prey, in that order. A hunter who lacks patience goes hungry, one who lacks a steady hand goes home empty, and one who lacks respect is no hunter at all." } },
      choices = {
        { text = "And the rifle?", next = "good_rifle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_rifle = {
      lines = { { id = "gr_default", text = "The rifle is a dwarf's toy that the goblins sell us, and it is loud enough to wake the ancestors. Still, it shoots straight, and the plainstrider does not care what killed it, so I teach it alongside the bow." } },
      choices = {
        { text = "I prefer the bow.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa = {
      lines = { { id = "me_default", text = "Plainstriders and prairie wolves, mostly, and the Battleboar if you go far enough. The wolves hunt in pairs, so if you see one, look for the second before you draw." } },
      choices = {
        { text = "And the quilboar?", next = "mesa_quil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa_quil = {
      lines = { { id = "mq_default", text = "The Bristleback have a camp to the west of the mesa, and they grow bold. Grull Hawkwind will tell you more of them; he has fought them more often than I have." } },
      choices = {
        { text = "I'll speak to Grull.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      big = true,
      lines = { { id = "tr_default", text = "Because the tribe fed you before you could hold a bow, and the tribe will bury you when you cannot. Hunters are a strong part of our tradition, and those who serve the people well are revered long after they are gone." } },
      choices = {
        { text = "I'll serve the tribe first.", next = "BACK", reply = "Then you will be remembered, young one. That is the only reward worth having.", fx = { align = { order = 1 } } },
        { text = "I'll hunt for myself and share what I choose.", next = "BACK", reply = "Then you will eat well and die alone. I hope you change your mind before then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "ta_default", text = "Choose the one that looks back at you. A beast that runs is not ready, and a beast that charges is not yours, but one that stands and watches you might walk beside you for years." } },
      choices = {
        { text = "I'll remember that, Lanka.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunt, and I teach hunters. My own teacher is buried under the grass by Red Cloud Mesa." } },
    _none = { { id = "tp_none", text = "I do not know that trail. Ask someone who has walked it." } },
  },
}

---------------------------------------------------------------------------
-- Moodan Sungrain: baker at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "moodan", id = TODO_NPC("Moodan Sungrain"), name = "Moodan Sungrain", title = "Baker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "jovial", "warm" }, values = { "hospitality", "community" },
  notices = { "race" },
  impression = {
    first = "He thinks it his duty to fatten the young before they leave.",
    third = "{name} met Moodan Sungrain, the jovial baker at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "Hungry? Of course you are, everyone up here is hungry. Sit, eat, and tell me who you've been fighting." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and thinner, I think. Here, have a loaf." },
    { id = "g_away", when = { away = 14 }, text = "It has been {away} since you last ate at my fire. Sit down before you fall down." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Look at you, all horn and elbow. You've the look of a calf who has been living on plainstrider and nothing else, and I can mend that." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "I can smell woodsmoke and old fat on you, friend. You've been cooking over a campfire, and by the smell of it, not badly." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers! Do they have bread up in the sky? You look like you've never had a proper loaf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Moodan Sungrain, baker to every young brave, hunter and shaman who comes through Camp Narache. Nobody leaves this mesa hungry, not while I have flour." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Sit, sit, young one. Every calf who trains on this mesa eats at my fire, and you will not be the first to leave it without a full belly." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc at Camp Narache! I have heard your people eat their meat half raw, so I will give you bread and you may tell me which is better." },
      },
      again = {
        { id = "h_again3", text = "Still here? Good, then you can have the heel of this loaf while you talk." },
        { id = "h_again", text = "What else? Eat while you think." },
        { id = "h_again2", text = "Ask away. The bread's still warm." },
      },
      choices = {
        { text = "Let me buy some bread and water.", next = "BUSINESS" },
        { text = "You feed everyone on the mesa?", next = "feed" },
        { text = "What's it like, watching the young ones leave?", next = "leave" },
        { text = "Tell me about this honey loaf.", next = "honey" },
        { text = "Who eats the most on this mesa?", next = "eaters" },
        { text = "The quilboar must smell your ovens from the ravine.", next = "raid" },
        { text = "I grew up on bread like this.", next = "home", when = { race = "Tauren" } },
        { text = "I cook a little myself, Moodan.", next = "cook", when = { profession = "Cooking" } },
        { text = "Farewell, Moodan.", next = "END" },
      },
    },
    feed = {
      lines = { { id = "fe_default", text = "Everyone who'll eat, and the ones who won't, I feed anyway. Chief Hawkwind says I waste flour on braves who are only passing through, and I tell him that is exactly who needs it." } },
      choices = {
        { text = "Who's right, you or the Chief?", next = "feed_chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feed_chief = {
      big = true,
      lines = { { id = "fc_default", text = "Ha! He is the Chief, so he is right about most things, but not about bread. A brave with a full belly fights twice as well as one with an empty one, and I'll argue that with anyone." } },
      choices = {
        { text = "Feed them all. The tribe looks after its own.", next = "BACK", reply = "That's what I say! Here, take a loaf for the road.", fx = { align = { light = 1 } } },
        { text = "The Chief has a point. Flour isn't endless.", next = "BACK", reply = "Bah, you sound just like him. Eat your bread and hush.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = { { id = "le_default", text = "Every season they come up as calves and go down to Bloodhoof as braves, and I miss every one of them. Some come back to visit, and those ones always want the honey loaf." } },
      choices = {
        { text = "I'll come back and visit.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    honey = {
      lines = {
        { id = "honey_d", text = "It is my grandfather's loaf, sweetened with honey from the wild hives under the mesa's rim and baked slowly, so the crust goes dark and the middle stays soft. The young ones remember it long after they have forgotten my name." },
      },
      choices = {
        { text = "Who climbs down to the hives?", next = "honey_bees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honey_bees = {
      lines = {
        { id = "honey_bees_d", text = "I do, with a smoking branch and a great deal of complaining, because the bees do not care how kindly I ask. Seer Graytongue says the stings are good for my humility, and he laughs every time I come back swollen." },
      },
      choices = {
        { text = "He may be right about the humility.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters = {
      lines = {
        { id = "eaters_d", text = "Grull Hawkwind, without a doubt, for he eats like a kodo before every hunt and again after it. Harutt Thunderhorn's young warriors come a close second, and Seer Graytongue eats so little that I worry about him." },
      },
      choices = {
        { text = "And Chief Hawkwind himself?", next = "eaters_chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters_chief = {
      lines = {
        { id = "eaters_chief_d", text = "The Chief has eaten less since his mother was killed by the Bristleback, and he thinks nobody has noticed. I leave a loaf by his tent each morning, and it is always gone by evening, so I say nothing and keep baking." },
      },
      choices = {
        { text = "That is a kindness he won't forget.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid = {
      big = true,
      lines = {
        { id = "raid_d", text = "They do, and twice this season they have come up from Brambleblade Ravine and carried off whole sacks of my flour. Brave Windfeather chased the last ones off, but a quilboar who has tasted good bread always comes back for more." },
      },
      choices = {
        { text = "Then the braves should burn out the ravine.", next = "BACK", reply = "Some of them say so, and after the second sack I nearly agreed with them. The Chief will decide, and I will feed whoever goes.", fx = { align = { light = -1 } } },
        { text = "Hungry raiders are still hungry. Guard the flour, that's all.", next = "BACK", reply = "Ha, you have a softer heart than my oven does. I will not be leaving loaves out for them, mind, but I take your meaning.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_d", text = "Then you know the smell of it before you know the taste, and that is how it should be. Every tent on the plains bakes it a little differently, and every calf swears their mother's was the best." },
      },
      choices = {
        { text = "My mother's was the best.", next = "BACK", reply = "Of course it was! I would think less of you if you said anything else.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_d", text = "Do you, now? Then you know that half of cooking is patience and the other half is not letting hungry braves near the pot too early. If you want to learn more of it, Pyall Silentstride teaches the craft down in Bloodhoof Village." },
      },
      choices = {
        { text = "I'll look for Pyall when I go down.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Eat before you hunt, and eat again when you come home. I have never yet met a brave who fought well on an empty belly." } },
    background = { { id = "tp_bg", text = "I bake on the mesa. My grandfather baked on the plains, and I suppose my grandchildren will bake in Thunder Bluff." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about bread, and I'll talk all day." } },
  },
}

---------------------------------------------------------------------------
-- Harant Ironbrace: armorer and shieldcrafter in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "harant", id = TODO_NPC("Harant Ironbrace"), name = "Harant Ironbrace", title = "Armorer & Shieldcrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "gruff", "steady" }, values = { "craft", "duty" },
  notices = { "class" },
  impression = {
    first = "He judges every customer by the dents in what they wear.",
    third = "{name} met Harant Ironbrace, the armorer and shieldcrafter of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Armour and shields. Let me see how you've been treating what you have on." },
    { id = "g_back", when = { metBefore = true }, text = "More dents. You've been busy, I see." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, and you are still in one piece. Then what I sold you did its work." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour is hanging off you by its last rivets. Sit down and let me look at it before it falls off on the road." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "There is forge soot under your nails. Good, because a customer who has swung a hammer does not argue about my prices." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Carry a shield until you've earned the right not to, and come to me when it needs straightening." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Harant Ironbrace. I sell armour and shields to the braves of Bloodhoof, and to anyone else who would rather be dented than dead." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Harant Ironbrace, and you are a warrior, so we will get on. Show me your shield arm and I will tell you what I have that fits it." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Harant Ironbrace. I see you wear cloth, and I have nothing against it, but I will sleep better if you at least look at a padded vest." },
      },
      again = {
        { id = "h_again3", text = "Ask, then. The leather needs to soak a while longer in any case." },
        { id = "h_again", text = "What else? I've straps to stitch." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What do the dents tell you?", next = "dents" },
        { text = "Why so many shields?", next = "shields" },
        { text = "How do you build a shield?", next = "craft" },
        { text = "You and the weaponsmith must argue.", next = "mahnott" },
        { text = "Fit me for a shield, the proper way.", next = "fit", when = { class = { "WARRIOR", "SHAMAN" } } },
        { text = "I work metal myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Farewell, Harant.", next = "END" },
      },
    },
    dents = {
      lines = { { id = "de_default", text = "Who you've been fighting and how. A quilboar's tusk leaves a long scratch, a harpy's claw leaves three, and a Venture Company club leaves a dent the size of a fist." } },
      choices = {
        { text = "And mine?", next = "dents_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dents_mine = {
      lines = { { id = "dm_default", text = "Yours say you've been fighting with more courage than sense. That's not an insult; most of the braves who come back alive say the same." } },
      choices = {
        { text = "I'll take that as praise.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shields = {
      big = true,
      lines = { { id = "sh_default", text = "Because a shield protects the one beside you as much as yourself. The old ways said a brave stands in a line, and a line without shields is just a crowd waiting to be scattered." } },
      choices = {
        { text = "Then a shield is a promise to the line.", next = "BACK", reply = "Well said. Pick one, and keep the promise.", fx = { align = { order = 1 } } },
        { text = "I fight alone. A shield only slows me.", next = "BACK", reply = "Then you'll be fast right up until you're not. I'll sell you a vest instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft = {
      lines = {
        { id = "craft_d", text = "A frame of ironwood first, then kodo hide soaked and stretched over it while it is still wet, so it dries as tight as a drum. A metal boss in the middle turns a blade, and good straps keep the whole thing on your arm when a boar hits it." },
      },
      choices = {
        { text = "Where does the kodo hide come from?", next = "craft_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_kodo = {
      lines = {
        { id = "craft_kodo_d", text = "Only from beasts that died in their own time, or that gave themselves to a hunt the proper way. Varg Windwhisper sends me what the hunters bring him, and I will not take a hide from anyone who cannot tell me how the kodo fell." },
      },
      choices = {
        { text = "That's a hard rule for a merchant.", next = "craft_rule" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_rule = {
      big = true,
      lines = {
        { id = "craft_rule_d", text = "It costs me coin, I'll not pretend it doesn't. But a shield made from a beast that was wasted is a shield that starts its life with a wrong in it, and I will not strap that onto a brave's arm." },
      },
      choices = {
        { text = "The rule matters more than the coin.", next = "BACK", reply = "So my father taught me, and his father taught him. It is good to hear it from a customer for once.", fx = { align = { order = 1 } } },
        { text = "A hide is a hide. You're turning away good leather.", next = "BACK", reply = "Then buy your shields from a goblin, and see how long they hold. Mine will still be here when you come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mahnott = {
      lines = {
        { id = "mahnott_d", text = "Mahnott Roughwound and I have argued since we were calves, and neither of us has won yet. He says a sharp edge ends a fight quickest, and I say you have to live long enough to swing it." },
      },
      choices = {
        { text = "Who does Baine side with?", next = "mahnott_baine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mahnott_baine = {
      lines = {
        { id = "mahnott_baine_d", text = "Baine carries a mace like his father and smiles at both of us, which is what a chieftain's son ought to do. He buys from Mahnott and from me in the same week, so that neither of us can boast about it." },
      },
      choices = {
        { text = "A wise young bull.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit = {
      narr = "He tugs the strap at your elbow twice, grunts, and lets it out by one hole.",
      lines = {
        { id = "fit_d", text = "Then hold out your arm and stand as you would in a fight, not as you would for a portrait. The top edge should sit under your eyes when you crouch, and if the straps bite your forearm, tell me now and not after the Bristleback have found the gap." },
      },
      choices = {
        { text = "It sits well. My thanks, Harant.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "smith_d", text = "Then you know what a boss costs in copper and sweat. Go up to Thunder Bluff when you can and watch Karn Stonehoof at his fire, because he taught half the smiths in Mulgore, and the other half wish he had." },
      },
      choices = {
        { text = "I'll seek out Karn.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Mend your straps before you mend your plates. I have seen more braves hurt by a slipped buckle than by a broken shield." } },
    background = { { id = "tp_bg", text = "I fit armour in Bloodhoof. I've done it since my horns were half this size." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who isn't up to his elbows in leather straps." } },
  },
}

---------------------------------------------------------------------------
-- Uthan Stillwater: fishing trainer at Stonebull Lake. Forever: ends Camping 101: Fishing.
---------------------------------------------------------------------------
P:NPC {
  key = "uthan", id = TODO_NPC("Uthan Stillwater"), name = "Uthan Stillwater", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "calm", "patient" }, values = { "nature", "peace" },
  notices = { "craft" },
  impression = {
    first = "He speaks as quietly as if the fish might hear.",
    third = "{name} met Uthan Stillwater, who teaches fishing beside Stonebull Lake.",
  },
  greetings = {
    { id = "g_hi", text = "Shh. Sit, if you like, but quietly. The fish are listening." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back. Did they bite for you?" },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last sat on this bank. The lake has not changed, and neither have I." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You walk softly for one of our people. That is good, because the fish feel every hoof on the bank." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and a patient one by the look of you. Fishing is only hunting with the spear left at home." },
    { id = "n_fish", cat = "craft", when = { profession = { name = "Fishing", min = 75 } },
      text = "You hold that pole as if you've used it. Good. Most young ones hold it like a spear." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Uthan Stillwater, and I teach fishing to any who have the patience for it. Stonebull Lake is generous to those who wait." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Fishing") }, text = "Kaga Wildhoof sent you, did she? Then show me some skill with the pole, and I'll show you how to make a fish bowl for your camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Fishing") }, text = "How is your fish bowl? Keep it out in the wild, mind; folk in town don't like camps in the middle of the road." },
      },
      again = {
        { id = "h_again3", text = "Yes? Slowly, now, there is a sunfish thinking about my hook." },
        { id = "h_again", text = "What else? Speak softly." },
        { id = "h_again2", text = "Ask, ask. The fish have all day, and so do I." },
      },
      choices = {
        { text = "Teach me fishing.", next = "BUSINESS" },
        { text = "What lives in Stonebull Lake?", next = "lake" },
        { text = "You never seem to hurry.", next = "patience" },
        { text = "Why would a camp need a fish bowl?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Fishing") } },
        { text = "Tell me about the fish you never landed.", next = "bigone" },
        { text = "Who buys your catch?", next = "catch" },
        { text = "The wells near here were fouled, I heard.", next = "wells" },
        { text = "I've fished waters far from Mulgore.", next = "far", when = { profession = { name = "Fishing", min = 75 } } },
        { text = "Did you fish here as a calf?", next = "calf", when = { race = "Tauren" } },
        { text = "I'll leave you to the fish.", next = "END" },
      },
    },
    lake = {
      lines = { { id = "la_default", text = "Sunfish and longjaw mud snapper, mostly, and something large near the northern bank that I have hooked twice and never landed. The young ones say it is a great spirit fish; I say it is just a very clever one." } },
      choices = {
        { text = "I'll catch it one day.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patience = {
      big = true,
      lines = { { id = "pa_default", text = "The water does not hurry, so why should I? A fisherman who hurries scares the fish and goes home with an empty basket, and a young brave who hurries does much the same." } },
      choices = {
        { text = "Patience is a strength. I'll learn it.", next = "BACK", reply = "Then sit with me a while, and you'll learn more than fishing.", fx = { align = { order = 1 } } },
        { text = "Some things can't wait for the water.", next = "BACK", reply = "True, and those things you should not fish for. Go and do them, and come back when you are tired.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "For joy, nothing more and nothing less. A weary traveller who watches a fish turn in a bowl by the fire forgets the road for a while, and wakes stronger for it." } },
      choices = {
        { text = "Then teach me.", next = "BACK" },
      },
    },
    bigone = {
      lines = {
        { id = "bigone_d", text = "It is longer than my arm and older than some of the braves in the village, and it has broken my line twice near the northern bank. I have stopped being angry with it, and now I think of it as a neighbour." },
      },
      choices = {
        { text = "Will you try a third time?", next = "bigone_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bigone_again = {
      big = true,
      lines = {
        { id = "bigone_again_d", text = "Perhaps, on a still morning, when neither of us has anything better to do. I am not sure I want to win, because a lake with no great fish left in it is only a pond." },
      },
      choices = {
        { text = "Leave it be. Some things should stay uncaught.", next = "BACK", reply = "I think so too, most days. It is good to hear that someone else would let the line go slack.", fx = { align = { light = 1 } } },
        { text = "A fisherman who won't land his fish isn't one.", next = "BACK", reply = "That may be so, young one. Then I am only an old bull who sits by the water, and I find I do not mind that either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch = {
      lines = {
        { id = "catch_d", text = "Innkeeper Kauth takes the best of it for his fire, and Jhawna Oatwind wraps the small ones in her flatbread for the braves on watch. What is left I smoke and send up to Thunder Bluff, where Kah Mistrunner pretends his own are bigger." },
      },
      choices = {
        { text = "Are his bigger?", next = "catch_kah" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch_kah = {
      lines = {
        { id = "catch_kah_d", text = "He fishes the ponds on the bluff, which are stocked and small, so he has no excuse at all. I taught him to tie his first hook, and I remind him of it whenever he visits." },
      },
      choices = {
        { text = "Then the student still owes the teacher.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells = {
      lines = {
        { id = "wells_d", text = "You heard truly, and it grieves me. The goblins of the Venture Company fouled the wells so that the land would sicken and we would leave it, and Mull Thunderhorn has been making totems to cleanse them one by one." },
      },
      choices = {
        { text = "Is the lake safe?", next = "wells_lake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells_lake = {
      lines = {
        { id = "wells_lake_d", text = "So far it is, because Stonebull is deep and fed from under the earth, and it takes more than a goblin's bucket of filth to spoil it. I watch the fish, though, because they would know before I did." },
      },
      choices = {
        { text = "I'll speak to Mull about the wells.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = {
        { id = "far_d", text = "Then tell me one thing, and tell me quietly. Is the sea as large as they say, with no far bank at all? I have fished one lake my whole life, and I cannot picture water without an edge." },
      },
      choices = {
        { text = "It is. You'd need a lifetime to fish it.", next = "BACK", reply = "Then I am glad I chose a lake. A bull should know the whole of the water he fishes.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    calf = {
      lines = {
        { id = "calf_d", text = "Every calf of Bloodhoof does, with a stick and a bit of sinew and more splashing than fishing. I was the one who stayed after the others ran off to chase plainstriders, and I suppose I never left." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Cast into the shade under the bank in the heat of the day. The fish are no fonder of An'she at noon than we are." } },
    background = { { id = "tp_bg", text = "I fish, and I teach fishing. There is not much more to tell, and that is how I like it." } },
    camping = { { id = "tp_camp", text = "Kaga teaches the fire. I only add the fish." } },
    _none = { { id = "tp_none", text = "I don't know. The lake has never told me." } },
  },
}

---------------------------------------------------------------------------
-- Rimblat Earthshatter: young Earthen Ring shaman at Camp Gev'rek (Forever).
---------------------------------------------------------------------------
P:NPC {
  key = "rimblat", id = TODO_NPC("Rimblat Earthshatter"), name = "Rimblat Earthshatter", title = "The Earthen Ring",
  bible = "bibles/more_folk.md", role = "scholar", tier = "service",
  communities = { "gevrek" }, temper = { "earnest", "warm" }, values = { "balance", "devout" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "His conviction that wounded land can heal is hard not to like.",
    third = "{name} met Rimblat Earthshatter, a young Earthen Ring shaman at Camp Gev'rek.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Gev'rek. The earth is good here, and the wind is better." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits have been calm today; I hope you have been too." },
    { id = "g_away", when = { away = 14 }, text = "You have been away {away}. The grass has grown a little since then, and that is always good news." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have the dust of Mulgore on your hooves. It is good to see one of our own come up to Gev'rek to meet the Windshapers." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The Earthen Ring welcomes all who listen to the elements, whatever their tribe or race." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. Your people kept faith with the elements a long time, and far from home." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Rimblat Earthshatter, of the Earthen Ring. We came to Gev'rek because the Windshapers reached out to us, and the Ring does not turn away those who honour the elements." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Rimblat Earthshatter, of the Earthen Ring, and I am glad to meet another who listens. Sit a while, because the wind at Gev'rek has a great deal to say." },
      },
      again = {
        { id = "h_again3", text = "Speak, friend. I learn as much from the questions as you do from the answers." },
        { id = "h_again", text = "What else would you know? I am glad to talk." },
        { id = "h_again2", text = "Ask. The elements are patient, and so am I." },
      },
      choices = {
        { text = "What is the Earthen Ring?", next = "ring" },
        { text = "Why are you here among the Windshapers?", next = "windshapers" },
        { text = "Can wounded land truly be healed?", next = "heal" },
        { text = "Which of the elements speaks to you most?", next = "elements" },
        { text = "Mulgore has wounds of its own.", next = "wounds" },
        { text = "I walk the shaman's path as well.", next = "path", when = { class = "SHAMAN" } },
        { text = "Our people have always listened to the land.", next = "tauren", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Rimblat.", next = "END" },
      },
    },
    ring = {
      lines = { { id = "ri_default", text = "Shamans of every people who listen to the elements and try to keep them in balance. Orc, tauren, troll and others; the elements do not care what face you wear, only whether you listen." } },
      choices = {
        { text = "And who leads you?", next = "ring_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring_lead = {
      lines = { { id = "rl_default", text = "Elders wiser than I am, and I am only a young one among them. Muln Earthfury himself went to the aid of the Windshapers, and that is why we stand together here today." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    windshapers = {
      big = true,
      lines = { { id = "wi_default", text = "They are shamans, as we are, and they owe a debt to the spirits of the wind. The tauren opened Mulgore to them, and the Ring opened its counsel; some say we welcome strangers too easily, but I say the elements made the choice before we did." } },
      choices = {
        { text = "Welcoming them was right. The elements chose.", next = "BACK", reply = "I believe so. You'll find them good neighbours, if a little strange.", fx = { align = { light = 1 } } },
        { text = "Strangers should earn trust, not be handed it.", next = "BACK", reply = "Perhaps, and they are earning it, day by day. Watch them, and judge for yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "I believe it can, even the worst of it. I have seen grass push up through ash, and if the earth still breathes, it still wants to be whole." } },
      choices = {
        { text = "Where have you seen that?", next = "heal_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_where = {
      lines = { { id = "hw_default", text = "In small places, where a fire burned or a mine was dug and then left. The elders say there are lands in the east poisoned far worse than anything here, and one day I mean to go and see whether they are past saving." } },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elements = {
      lines = {
        { id = "elements_d", text = "The earth, as my name might tell you, though I did not choose the name and I try to deserve it. Earth is slow to answer and slow to anger, and when it does speak, it does not say a thing twice." },
      },
      choices = {
        { text = "And the wind, here among the Windshapers?", next = "elements_wind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elements_wind = {
      lines = {
        { id = "elements_wind_d", text = "The wind is quick and loves to be asked, and the Windshapers speak to it as easily as you and I are speaking now. I am a little jealous, I admit, but an elder told me that envy of another's gift is only respect that has not grown up yet." },
      },
      choices = {
        { text = "That is well said.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds = {
      lines = {
        { id = "wounds_d", text = "It does, and they are close enough to walk to. The Venture Company has cut a mine into the hills and fouled the wells, and the dwarves at Bael'dun tear at the earth in the south-west as if nothing lived above it." },
      },
      choices = {
        { text = "What does the Ring do about it?", next = "wounds_ring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds_ring = {
      big = true,
      lines = {
        { id = "wounds_ring_d", text = "We listen first, and then we mend what we can reach. Mull Thunderhorn in Bloodhoof makes totems to cleanse the wells, and that is the Ring's kind of work whether he calls himself one of us or not." },
      },
      choices = {
        { text = "Mending is slow. Drive the diggers out first.", next = "BACK", reply = "The braves say the same, and I cannot tell them they are wrong. A wound will not close while the knife is still in it.", fx = { align = { light = -1 } } },
        { text = "Heal the land, and let the chieftains judge the diggers.", next = "BACK", reply = "That is how I was taught. The Ring tends the earth, and it leaves the spears to those who carry them.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    path = {
      lines = {
        { id = "path_d", text = "Then you know how it begins: with a seer, a rite, and a long walk during which you wonder whether the elements will answer at all. Tell me, when the earth first spoke to you, were you afraid?" },
      },
      choices = {
        { text = "I was, and I'm not ashamed of it.", next = "BACK", reply = "Nor should you be. The ones who feel no fear are the ones the elements answer least.", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "No. It felt like coming home.", next = "BACK", reply = "Then you were luckier than I was. I shook for a whole day afterward.", fx = { trait = { brave = 1 }, affinity = 1 } },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "We have, long before the Ring had a name for it. When I sat with the orc and troll shamans for the first time, I found they knew the same things my grandmother knew, and had only learned them by a harder road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Before you ask anything of the elements, sit and listen for as long as you can bear. Then sit a little longer." } },
    background = { { id = "tp_bg", text = "I am a shaman of the Earthen Ring, younger than most, and stubborner than some." } },
    _none = { { id = "tp_none", text = "I don't know. The elements have not spoken to me of that." } },
  },
}

---------------------------------------------------------------------------
-- Seer Ravenfeather: shaman seer at Camp Narache. Classic: Call of Earth.
---------------------------------------------------------------------------
P:NPC {
  key = "ravenfeather", id = TODO_NPC("Seer Ravenfeather"), name = "Seer Ravenfeather",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "narache" }, temper = { "serene", "exacting" }, values = { "tradition", "spirits" },
  notices = { "class", "race" },
  impression = {
    first = "Seer Ravenfeather guides the young shamans of Camp Narache toward their first meeting with the earth. She speaks softly and waits a long time for answers, and she seemed to weigh mine before she accepted them.",
    third = "{name} met Seer Ravenfeather, who prepares the shamans of Camp Narache for the Call of Earth.",
  },
  greetings = {
    { id = "g_hi", text = "Peace, young one. Sit if you wish to talk, for the earth does not speak to those who are already walking away." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned to my fire. Tell me what the land has shown you since." },
    { id = "g_call", when = { questActive = TODO_QUEST("Call of Earth") }, text = "The Bristleback shamans carry the salve you need, in Brambleblade Ravine. Do not come back to me with words in place of it." },
    { id = "g_away", when = { away = 14 }, text = "{away} have passed since you sat here. The earth counted them, though it does not count as we do." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The elements have already turned their faces toward you. I could feel it before you reached the top of the path." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You carry yourself like one who was sung to as a calf. That is good, because the songs are the first teaching." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Seer Ravenfeather. Seer Graytongue prepares the braves of this camp for their rites, and I prepare those whom the elements have called, which is a quieter labour and a longer one." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Seer Ravenfeather, and I have been expecting someone like you. When you are ready to seek the earth's blessing, we will speak of what must be gathered first." },
        { id = "h_active", when = { questActive = TODO_QUEST("Call of Earth") }, text = "You seek the Call of Earth, and for that you must bring me the ritual salve of the Bristleback shamans. From it I will make the sapta that opens your eyes." },
        { id = "h_done", when = { questDone = TODO_QUEST("Call of Earth") }, text = "The earth has answered you, and you carry its totem. Remember that it was lent, young one, and may be asked for again." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I am listening, and so is the ground beneath us." },
        { id = "h_again2", text = "Speak, and take your time over it." },
        { id = "h_again3", text = "Yes, young one?" },
      },
      choices = {
        { text = "What does a seer do?", next = "seers" },
        { text = "How does a shaman first hear the earth?", next = "earth" },
        { text = "The Bristleback have shamans of their own.", next = "bristle" },
        { text = "This camp carries a grief, I think.", next = "grief" },
        { text = "I've come to answer the Call of Earth.", next = "call", when = { class = "SHAMAN" } },
        { text = "My grandmother spoke of seers like you.", next = "gran", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Seer.", next = "END" },
      },
    },
    seers = {
      lines = {
        { id = "seers_d", text = "We watch for what the young cannot yet see in themselves, and we name it when the time is right. A brave may think he is only quick or only strong, and it falls to a seer to tell him what that quickness is for." },
      },
      choices = {
        { text = "How do you and Seer Graytongue differ?", next = "seers_gray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seers_gray = {
      lines = {
        { id = "seers_gray_d", text = "Graytongue tests the body and the courage, and sends the braves up the ravine to prove both. I test the stillness, and those I send go to a rock on the plain where nothing will happen unless they are ready for it." },
      },
      choices = {
        { text = "Which test is the harder?", next = "seers_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seers_hard = {
      big = true,
      lines = {
        { id = "seers_hard_d", text = "His is harder for a day, and mine is harder for a lifetime. A brave who has passed the Rite of Strength may rest on it, but a shaman who has heard the earth once must go on listening." },
      },
      choices = {
        { text = "A lifetime of listening is the greater calling.", next = "BACK", reply = "I believe so, though I would not say it where Graytongue could hear. He has earned his pride.", fx = { align = { light = 1 } } },
        { text = "Strength keeps the camp alive. Listening doesn't stop quilboar.", next = "BACK", reply = "No, it does not. But it tells us why they come, and a people who never ask why will be fighting the same raid forever.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth = {
      lines = {
        { id = "earth_d", text = "With help, the first time. I brew a drink called sapta, and one who has drunk it can see the spirits of the elements, where before there was only stone and dust." },
      },
      choices = {
        { text = "Where does one drink it?", next = "earth_rock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_rock = {
      lines = {
        { id = "earth_rock_d", text = "At Kodo Rock, out on the plain east of the mesa, where the old kodo used to come to scratch their hides. The earth is near the surface there, and a manifestation will rise to look at whoever has come." },
      },
      choices = {
        { text = "And if it doesn't like what it sees?", next = "earth_judge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_judge = {
      lines = {
        { id = "earth_judge_d", text = "Then it will be the shortest rite I have ever overseen. The earth is patient, but it is not gentle, and it does not lend its strength to the careless." },
      },
      choices = {
        { text = "Then I'll go carefully.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bristle = {
      lines = {
        { id = "bristle_d", text = "They do, and it troubles me more than their spears. Their thornweavers ask the earth for brambles to wall us out, and the earth gives them, because it does not take our side merely because we love it." },
      },
      choices = {
        { text = "Why take your salve from them, then?", next = "bristle_salve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bristle_salve = {
      lines = {
        { id = "bristle_salve_d", text = "Because they make it well, and because a shaman's first lesson should be an uncomfortable one. What they use to speak with the earth in anger, I use to help you speak with it in respect." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    grief = {
      lines = {
        { id = "grief_d", text = "You see clearly. The Bristleback have taken more from this camp than its flour, and Chief Hawkwind carries the worst of it without setting it down. I sit with him in the evenings, and mostly we say nothing." },
      },
      choices = {
        { text = "Silence can be a kind of help.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    call = {
      lines = {
        { id = "call_d", text = "Then go into Brambleblade Ravine and take the ritual salve from the Bristleback shamans. Bring it to me, and I will make you sapta, and after that the matter lies between you and the earth." },
      },
      choices = {
        { text = "I'll bring the salve.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gran = {
      lines = {
        { id = "gran_d", text = "Then she remembered the time when we had no mesa, and a seer walked beside the herd with her whole lodge on her back. We sit still now, and I am not certain we see as far." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have been a seer since before this camp had a name. I walked with the tribes, and I stopped when they stopped." } },
    advice = { { id = "tp_ad", text = "When the earth is silent, do not fill the silence yourself. Wait, and then wait again." } },
    _none = { { id = "tp_none", text = "That lies beyond what I have seen, young one. Ask Chief Hawkwind, or carry the question down to Bloodhoof." } },
  },
}

---------------------------------------------------------------------------
-- Narm Skychaser: shaman trainer in Bloodhoof Village. Classic: Call of Fire, Call of Water (sends on).
---------------------------------------------------------------------------
P:NPC {
  key = "narm", id = TODO_NPC("Narm Skychaser"), name = "Narm Skychaser", title = "Shaman Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "calm", "wry" }, values = { "spirits", "tribe" },
  notices = { "class", "race" },
  impression = {
    first = "Narm Skychaser trains the shamans of Bloodhoof Village and sends them far from Mulgore to meet fire and water. He is calm and a little dry, and he seems to enjoy how far the errands are.",
    third = "{name} met Narm Skychaser, the shaman trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "The winds brought word of you before you arrived. They did not say whether you would be worth my time, so we shall find out." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and the elements have not struck you down. I count that as progress." },
    { id = "g_fire", when = { questActive = TODO_QUEST("Call of Fire") }, text = "Kranal Fiss waits for you in the Barrens, near the Crossroads. Fire is not known for its patience, so do not test his." },
    { id = "g_away", when = { away = 14 }, text = "{away} without a word. I asked the wind where you had gone, and it only laughed." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You have the look of one who has stood at Kodo Rock. The earth leaves a certain stillness in the shoulders." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your witch doctors and our seers argue over the same spirits by different names, and I enjoy the arguments." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Narm Skychaser, and I teach those the elements have called. If you are not one of them, I can still tell you which way the storm is coming." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Narm Skychaser. Earth has accepted you, I see, and now you will want fire and water, and both of them live a long walk from here." },
        { id = "h_firedone", when = { questDone = TODO_QUEST("Call of Fire") }, text = "You carry fire's totem, and you are not burned. Kranal Fiss must have been in a generous mood." },
      },
      again = {
        { id = "h_again", text = "What else? The wind is in no hurry today." },
        { id = "h_again2", text = "Ask. I will answer what I can and blame the spirits for the rest." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Why send shamans so far from Mulgore?", next = "far" },
        { text = "Your kin teach on Spirit Rise, I hear.", next = "kin" },
        { text = "Bloodhoof's wells have gone foul.", next = "wells" },
        { text = "I'm ready to seek the fire.", next = "fire", when = { class = "SHAMAN" } },
        { text = "Which element first spoke to our people?", next = "first", when = { race = "Tauren" } },
        { text = "You seem amused by how far you send people.", next = "amused" },
        { text = "Winds guide you, Narm.", next = "END" },
      },
    },
    far = {
      lines = {
        { id = "far_d", text = "Because the elements do not come to you. Earth you may meet on your own plains, but fire must be sought in the Barrens and water in the far south, and the walking is part of the lesson." },
      },
      choices = {
        { text = "What does the walking teach?", next = "far_walk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_walk = {
      lines = {
        { id = "far_walk_d", text = "That you are small, and that the land is large, and that it was getting along perfectly well before you asked anything of it. Most young shamans need to hear that three or four times." },
      },
      choices = {
        { text = "I think I've heard it once already.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "kin_d", text = "Tigor, Siln and Beram keep the lodge on Spirit Rise, and they have the pleasant task of teaching shamans who already know what they are doing. I have the calves who set their own tails alight." },
      },
      choices = {
        { text = "Would you trade places with them?", next = "kin_trade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_trade = {
      lines = {
        { id = "kin_trade_d", text = "Not for the whole bluff. Up there they polish what is already bright, and down here I see the first spark catch, and there is nothing in a shaman's life like the first time." },
      },
      choices = {
        { text = "The first teaching matters most.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells = {
      lines = {
        { id = "wells_d", text = "They have, and the water spirits in them are sickened and frightened. Mull Thunderhorn makes cleansing totems for each one, and I have blessed a few of them myself, though the credit is his." },
      },
      choices = {
        { text = "Who fouled them?", next = "wells_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wells_who = {
      big = true,
      lines = {
        { id = "wells_who_d", text = "The goblins of the Venture Company, to drive us from land they want to dig. They think of water as a thing that fills a bucket, and they cannot imagine that it remembers who poisoned it." },
      },
      choices = {
        { text = "Then the water should have its vengeance.", next = "BACK", reply = "It may yet, and I will not stand in its way. But I would not ask it to, because vengeance sits badly in water, and it sours everything downstream.", fx = { align = { light = -1 } } },
        { text = "Cleanse the wells and let the anger go.", next = "BACK", reply = "That is the shaman's answer, and the harder one. You may have the makings of a good one.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = {
        { id = "fire_d", text = "Then go to the Barrens and find Kranal Fiss, a troll who keeps a small camp near the Crossroads. He will tell you what fire demands, and it will not be cheap." },
      },
      choices = {
        { text = "And water, after that?", next = "fire_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire_water = {
      lines = {
        { id = "fire_water_d", text = "Water waits with Islen Waterseer on the southern coast of the Barrens, and she will send you farther still. Do not ask me how far, because you would not set out." },
      },
      choices = {
        { text = "I'll set out all the same.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_d", text = "The earth, as you would expect from a people named for their hooves on it. The old ones say the wind came second, when we first stood on a height and understood how far the plains ran." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    amused = {
      lines = {
        { id = "amused_d", text = "A little, I admit. I walked every step of it myself when I was young, and nobody warned me either, so I consider it a tradition." },
      },
      choices = {
        { text = "A cruel tradition, but a fair one.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Skychasers have listened to the wind for longer than anyone has kept count. I listen from Bloodhoof, and my kin from the bluff." } },
    advice = { { id = "tp_ad", text = "Set your totem down gently, and thank it when you take it up. It is not a tool, however much it looks like one." } },
    _none = { { id = "tp_none", text = "The winds have told me nothing of that. Ask Baine, who hears more from travellers than I do from spirits." } },
  },
}

---------------------------------------------------------------------------
-- Harb Clawhoof: kodo mount vendor in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "harb", id = TODO_NPC("Harb Clawhoof"), name = "Harb Clawhoof", title = "Kodo Mounts",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "patient", "proud" }, values = { "herd", "tradition" },
  notices = { "class", "race" },
  impression = {
    first = "Harb Clawhoof raises and sells riding kodo at Bloodhoof Village, and he talks about each beast as if it were a difficult relative. He would not let me near them until he had watched how I stood.",
    third = "{name} met Harb Clawhoof, who raises the riding kodo of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Come up slowly, and from the side where she can see you. A kodo forgives a great deal, but not being startled." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and the grey one lifted her head. She does not do that for everyone." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last stood at my fence. The calves you saw then are half grown now." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You stopped where the old bull could smell you before you came on. Somebody taught you kodo manners, and I am glad of it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keep your companion well back from the calves, if you please, because the mothers do not ask questions first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Harb Clawhoof, and these are my kodo. I raise them, I gentle them, and I sell them to those who have earned the right to ride, which is fewer than think so." },
        { id = "h_low", when = { maxLevel = 39 }, text = "I am Harb Clawhoof, and you are young yet for a kodo of your own. Come and look, by all means, and learn their ways, so that you are ready when the time comes." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Harb Clawhoof. Our people have walked beside the kodo since before we had words for it, so I will not explain to you what they are, only which of mine might suit you." },
        { id = "h_other", when = { race = { "Orc", "Troll", "Scourge" } }, text = "I am Harb Clawhoof. I sell kodo to the tauren, and to those few of other peoples whom the tribes have come to honour as their own, so we shall see which you are." },
      },
      again = {
        { id = "h_again", text = "What else? Speak low, the calves are dozing." },
        { id = "h_again2", text = "Ask. The herd is grazing, and I have nothing to do but watch." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see your kodo.", next = "BUSINESS" },
        { text = "How do you gentle a beast that size?", next = "gentle" },
        { text = "Where do your kodo come from?", next = "herd" },
        { text = "The kodo and the tauren go back a long way.", next = "old" },
        { text = "Who teaches riding here?", next = "kar" },
        { text = "My grandfather drove kodo across the Barrens.", next = "drover", when = { race = "Tauren" } },
        { text = "Would a kodo carry one of my people?", next = "orc", when = { race = { "Orc", "Troll" } } },
        { text = "Which of these would you never sell?", next = "keep" },
        { text = "May your herd grow, Harb.", next = "END" },
      },
    },
    gentle = {
      lines = {
        { id = "gentle_d", text = "You do not gentle it, you persuade it. I walk beside a calf every day from its first spring, and I sing, and by the time it is grown it has decided for itself that I am part of the herd." },
      },
      choices = {
        { text = "What do you sing?", next = "gentle_sing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gentle_sing = {
      lines = {
        { id = "gentle_sing_d", text = "The herding songs my mother sang, which are older than Bloodhoof and have no words that mean anything. The kodo know them better than I do, and the old cows correct me when I lose the tune." },
      },
      choices = {
        { text = "I'd like to hear one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herd = {
      lines = {
        { id = "herd_d", text = "From the plains south of here, where the wild herds graze under the eyes of the braves. I take only calves whose mothers have more than one, and I ask the herd's leave by standing among them a full day first." },
      },
      choices = {
        { text = "And if the herd doesn't give it?", next = "herd_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herd_leave = {
      big = true,
      lines = {
        { id = "herd_leave_d", text = "Then I go home with empty hands, and I have done so more than once. A calf taken against the herd's will grows up sullen, and nobody should trust their neck to a sullen kodo." },
      },
      choices = {
        { text = "That's the right way to take them.", next = "BACK", reply = "It is the only way my family has ever done it. The herd remembers who asked and who stole.", fx = { align = { order = 1 } } },
        { text = "You'd sell more if you simply took what you needed.", next = "BACK", reply = "And I would have a pen full of beasts that hated me. Go and buy a wolf from the orcs if you want an animal that was caught.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = {
        { id = "old_d", text = "Longer than our oldest story. They carried our lodges when the centaur drove us from place to place, and when one died, it fed and clothed the tribe, so that nothing of it was lost." },
      },
      choices = {
        { text = "Is that why they have a graveyard of their own?", next = "old_grave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old_grave = {
      lines = {
        { id = "old_grave_d", text = "Far to the west, in Desolace, yes. The old ones walk there by themselves when they feel their time, and no tauren has ever turned one back from the road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kar = {
      lines = {
        { id = "kar_d", text = "Kar Stormsinger, just over there, and you will need his teaching before I sell you so much as a halter. He will tell you a kodo is ridden with the knees, and I will tell you it is ridden with respect, and we are both right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    drover = {
      lines = {
        { id = "drover_d", text = "Then he knew what it is to sleep with one eye open and a hand on a warm flank. There are fewer drovers now that we have a home, and I am not sure the kodo think it an improvement." },
      },
      choices = {
        { text = "Nor was he, I think.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "orc_d", text = "It might, if the tribes have come to know you well enough to vouch for you. Earn the regard of Thunder Bluff, and then come back and let the kodo have the last word." },
      },
      choices = {
        { text = "I'll earn it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      narr = "He looks past you to an old grey kodo standing knee-deep at the lake's edge.",
      lines = {
        { id = "keep_d", text = "The grey cow by the water. She carried my daughter out of a grass fire before the calf could walk, and no price has been named in Mulgore that would buy her." },
      },
      choices = {
        { text = "Some debts aren't for sale.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Clawhoofs have kept kodo for as long as the Bloodhoof have led. My father's herd carried the tribe to Mulgore." } },
    advice = { { id = "tp_ad", text = "Never walk behind a kodo, and never hurry one. Those are the only two rules, and the second matters more." } },
    _none = { { id = "tp_none", text = "I know kodo, friend, and little else worth telling. Ask Brave Wildrunner; he knows where everything is." } },
  },
}

---------------------------------------------------------------------------
-- Chaw Stronghide: leatherworking trainer in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "chaw", id = TODO_NPC("Chaw Stronghide"), name = "Chaw Stronghide", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "gruff", "fair" }, values = { "craft", "thrift" },
  notices = { "craft" },
  impression = {
    first = "Chaw Stronghide teaches leatherworking in Bloodhoof Village and inspects a seam the way a brave inspects a spear point. He is sparing with praise, but when he gave some, I believed it.",
    third = "{name} met Chaw Stronghide, the leatherworking trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "If you have come to learn, sit down and pick up an awl. If you have come to talk, you may still pick up an awl." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Show me your last piece, and do not hide the bad seam under your thumb." },
    { id = "g_away", when = { away = 14 }, text = "{away} away from the bench. Your hands will have forgotten half of what I showed them." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have big hands, young one. They will be clumsy with an awl for a season, and after that they will never tire." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Those are your own stitches on that strap, I think. They are even enough, and you pulled them too tight." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You have a skinning knife and you keep it clean. Then you may bring me hides, and I will tell you what you did to them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Chaw Stronghide, and I teach the working of leather. Yonn Deepcut takes the hide off the beast, and I teach what comes after, which is most of the work and all of the skill." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "I am Chaw Stronghide. You have worked leather before, so we need not begin with which side is the grain, and I am grateful for that." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Chaw Stronghide. A hunter who can make and mend their own gear need never go begging to a merchant, and that is worth a few evenings at my bench." },
      },
      again = {
        { id = "h_again", text = "What else? My hands are busy, but my ears are not." },
        { id = "h_again2", text = "Ask, and pass me that thong while you do." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me the craft.", next = "BUSINESS" },
        { text = "What makes a good piece of leather?", next = "good" },
        { text = "Who works beside you here?", next = "village" },
        { text = "You're hard on your students, I hear.", next = "hard" },
        { text = "Where should I go once I've learned from you?", next = "next", when = { profession = "Leatherworking" } },
        { text = "Our people have always worn what we hunted.", next = "old", when = { race = "Tauren" } },
        { text = "What do the young ones make first?", next = "first" },
        { text = "That vest of yours has seen long service.", next = "vest" },
        { text = "I'll leave you to your bench.", next = "END" },
      },
    },
    good = {
      lines = {
        { id = "good_d", text = "A clean hide to begin with, which is the skinner's doing, and then patience in the curing. Leather that is hurried cracks within a season, and leather that is given its time will outlast the one who wears it." },
      },
      choices = {
        { text = "How long is 'its time'?", next = "good_time" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_time = {
      lines = {
        { id = "good_time_d", text = "For a prowler hide, a month from the beast to the bench, with scraping and oiling every few days. The young ones want boots by the next morning, and I let them make a pair that way once, so they can watch them fall apart." },
      },
      choices = {
        { text = "A lesson they won't forget.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "village_d", text = "Yonn Deepcut teaches the skinning, and Varg Windwhisper sells what the better students make. Harant Ironbrace takes my heaviest hides for his shields, and complains about the price as a matter of habit." },
      },
      choices = {
        { text = "And who gets the scraps?", next = "village_scraps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_scraps = {
      lines = {
        { id = "village_scraps_d", text = "Nobody, because there are none. Offcuts become laces, laces become stitching, and the last thumb's length goes to the calves, who make terrible little pouches and are very proud of them." },
      },
      choices = {
        { text = "Nothing wasted. That's the tauren way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      big = true,
      lines = {
        { id = "hard_d", text = "I am exact, and the lazy ones call that hard. If I pass a weak seam today, it will open on some brave's shoulder in the middle of a fight, and I will have put it there." },
      },
      choices = {
        { text = "Better a harsh teacher than a dead brave.", next = "BACK", reply = "That is the whole of it. You understand more than most who sit at this bench.", fx = { align = { order = 1 } } },
        { text = "They're only learning. A little praise costs nothing.", next = "BACK", reply = "It costs them the truth. I praise what has earned it, and they know that, which is why it means something.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    next = {
      lines = {
        { id = "next_d", text = "To Thunder Bluff, to Una on the middle rise, and take your best work with you. She will find a fault in it that I missed, and you should thank her for it as though it were a gift." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = {
        { id = "old_d", text = "We have, and we honoured the beast by making the hide last. When I was young, a brave's first vest was buried with him, and you could read his whole life in the patches." },
      },
      choices = {
        { text = "That's worth keeping alive.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_d", text = "A strap, and then another strap, until they can cut a straight line without thinking. After that a pouch, and after that I let them near something a brave might actually wear." },
      },
      choices = {
        { text = "How many straps did you cut?", next = "first_many" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_many = {
      lines = {
        { id = "first_many_d", text = "More than there are kodo in Mulgore. My teacher hung the crooked ones over my bed, so that they were the first thing I saw each morning." },
      },
      choices = {
        { text = "And you thought he was the hard one.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vest = {
      lines = {
        { id = "vest_d", text = "Twenty winters, and every patch on it is my own. A leatherworker in a new vest is like a cook who will not eat his own stew, and you should trust neither." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have worked leather in Bloodhoof since the village was tents. My name is the family trade, and I have tried to deserve it." } },
    advice = { { id = "tp_ad", text = "Wet your thread before you stitch, and wax it after. A dry thread cuts the leather it is meant to hold." } },
    _none = { { id = "tp_none", text = "That is no business of a leatherworker. Ask Innkeeper Kauth, who hears everything twice." } },
  },
}

---------------------------------------------------------------------------
-- Pyall Silentstride: cooking trainer in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "pyall", id = TODO_NPC("Pyall Silentstride"), name = "Pyall Silentstride", title = "Cook",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "quiet", "kindly" }, values = { "hospitality", "tribe" },
  notices = { "craft", "race" },
  impression = {
    first = "Pyall Silentstride teaches cooking over an open fire in Bloodhoof Village and says very little while he does it. He handed me a spoon to taste before he had asked my name.",
    third = "{name} met Pyall Silentstride, who teaches cooking at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Taste this, and tell me what it lacks. I have been standing over it too long to know." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Good, the pot has been waiting for a second opinion." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last ate here. Sit, and I will not ask what you have been eating instead." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Bring me what you kill before it has sat a day in the sun, and I will show you what it can become." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You stirred the pot away from yourself without being told. Someone has burned you before, and you learned from it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have the plains appetite, young one. I can hear it from here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pyall Silentstride, and I teach the cooking fire. It is the first craft our people learned and the last one we would give up." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I am Pyall Silentstride. You know your way around a fire already, so let us skip the part where I tell you not to boil everything." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Pyall Silentstride. Orcs cook over a high flame and eat fast, and I mean no insult, but sit a while and see what a slow fire does." },
      },
      again = {
        { id = "h_again", text = "What else? The stew will mind itself for a moment." },
        { id = "h_again2", text = "Ask. I talk more than people expect, once I begin." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What does Mulgore put in a pot?", next = "pot" },
        { text = "Who do you cook for?", next = "who" },
        { text = "You don't waste words, do you?", next = "quiet" },
        { text = "I've cooked on the road. Show me something new.", next = "road", when = { profession = "Cooking" } },
        { text = "What did the tribes eat on the long marches?", next = "march", when = { race = "Tauren" } },
        { text = "That's a very old pot.", next = "oldpot" },
        { text = "Thank you, Pyall.", next = "END" },
      },
    },
    pot = {
      lines = {
        { id = "pot_d", text = "Plainstrider, mostly, and prowler when the hunters are lucky, with wild onion and the roots that grow along Stonebull Lake. Uthan Stillwater brings me fish when he has more than he can smoke." },
      },
      choices = {
        { text = "And kodo?", next = "pot_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pot_kodo = {
      lines = {
        { id = "pot_kodo_d", text = "Only one that has died in its own time, and then the whole village eats and nobody speaks until the bones are clean. It is not a meal so much as a farewell." },
      },
      choices = {
        { text = "That's as it should be.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_d", text = "The braves on watch, first, because they cannot leave their posts to eat. After them come the calves, and Baine when he remembers, and Innkeeper Kauth sends his guests to me when his own pot runs low." },
      },
      choices = {
        { text = "Doesn't Kauth mind the rivalry?", next = "who_kauth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_kauth = {
      lines = {
        { id = "who_kauth_d", text = "There is no rivalry. He gives them a roof and a bed, and I give them a full belly, and Jhawna Oatwind gives them bread to carry away. A traveller needs all three, and we have never quarrelled over which matters most." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_d", text = "My mother said a cook who talks is not watching the pot. I think she only wanted peace, but the habit stayed with me." },
      },
      choices = {
        { text = "What do you think about, all those quiet hours?", next = "quiet_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet_think = {
      big = true,
      lines = {
        { id = "quiet_think_d", text = "Whether the braves are eating enough, and whether the hunters are taking too much. A cook sees both ends of it, and some seasons the pot is fuller than the plains can afford." },
      },
      choices = {
        { text = "Then the hunters should be told to take less.", next = "BACK", reply = "I have said so to Harken Windtotem, and he listened. It is easier to say with an empty ladle in your hand.", fx = { align = { light = 1 } } },
        { text = "A fed village comes first. The herds will recover.", next = "BACK", reply = "They always have. I would not like to be the cook who learns they do not always.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_d", text = "Then try this: wrap the meat in wet leaves and bury it under the coals before you sleep. In the morning it falls from the bone, and you have not spent a moment watching it." },
      },
      choices = {
        { text = "I'll try it tonight.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    march = {
      lines = {
        { id = "march_d", text = "Dried meat pounded with fat and berries, pressed into cakes that kept for a season. I still make it, and the calves say it tastes of saddlebag, and they are right." },
      },
      choices = {
        { text = "I'd try a saddlebag cake.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldpot = {
      lines = {
        { id = "oldpot_d", text = "It was my mother's, and her mother's before, and it crossed the Barrens on a kodo's back more times than I can count. I think half the flavour is in the iron by now." },
      },
      choices = {
        { text = "Then it has fed the tribe for generations.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mulgore = { { id = "tp_mul", text = "The plains feed us well, in a good year. I try to cook as though every year might not be one." } },
    background = { { id = "tp_bg", text = "I learned at my mother's fire and I teach at my own. There is not much more to me than that." } },
    advice = { { id = "tp_ad", text = "Salt at the end, not the beginning. You can always add, and you can never take away." } },
    _none = { { id = "tp_none", text = "I could not say. I watch a pot all day, and news goes past me." } },
  },
}

---------------------------------------------------------------------------
-- Wunna Darkmane: trade goods vendor in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "wunna", id = TODO_NPC("Wunna Darkmane"), name = "Wunna Darkmane", title = "Trade Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "brisk", "shrewd" }, values = { "trade", "community" },
  notices = { "craft", "race" },
  impression = {
    first = "Wunna Darkmane sells trade goods in Bloodhoof Village and knows which crafter is short of what before they do. She is brisk and fair, and she kept a tally of me the whole time we spoke.",
    third = "{name} met Wunna Darkmane, who sells trade goods in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Thread, dye, flux or salt? Tell me your craft, and I will tell you what you have run out of." },
    { id = "g_back", when = { metBefore = true }, text = "Back already. Then you used it all, and I was right about how much you needed." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and three caravans in and out since. You have missed the good dyes." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young one fresh from Narache, by the dust. You will need thread before you need anything else, mark my words." },
    { id = "n_craft", cat = "craft", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing" } },
      text = "You have a crafter's stained fingers. Good, because browsers do not keep a trade tent standing." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, up from the Barrens road. If you have come from the Crossroads, I want to hear what salt is fetching there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Wunna Darkmane. Everything a crafter needs and cannot hunt, dig or pick for themselves, I carry, and I carry it up from the Barrens on my own back often enough." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Wunna Darkmane. You will be learning a trade, as every young one does, and whichever it is, you will be seeing a great deal of me." },
        { id = "h_crafter", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing", "Cooking" } }, text = "I am Wunna Darkmane, and you look like a customer. Tell me what you make, and I will have it laid out before you finish the sentence." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I have a tally to finish." },
        { id = "h_again2", text = "Go on, I can count and listen." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Where do your goods come from?", next = "source" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Trade must be new to the tribes.", next = "new" },
        { text = "What do Mulgore's crafters run short of?", next = "short", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing" } } },
        { text = "My mother bartered. She never touched a coin.", next = "barter", when = { race = "Tauren" } },
        { text = "You keep a tally of everything.", next = "tally" },
        { text = "Good trading, Wunna.", next = "END" },
      },
    },
    source = {
      lines = {
        { id = "source_d", text = "Salt and dye from the Crossroads, where the orcs and goblins bring it inland, and thread from the weavers on Thunder Bluff. The flux I take from whoever is selling, and I do not always ask." },
      },
      choices = {
        { text = "Not even from the Venture Company?", next = "source_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_venture = {
      big = true,
      lines = {
        { id = "source_venture_d", text = "Never from them, and I resent the question a little. They fouled our wells and cut our hills open, and I would sooner grind my own flux from river stones." },
      },
      choices = {
        { text = "Good. Some coin isn't worth taking.", next = "BACK", reply = "No, it is not. I am glad we agree, and I forgive you for asking.", fx = { align = { honor = 1 } } },
        { text = "Their goods are cheap. Your customers would benefit.", next = "BACK", reply = "My customers drink from those wells. Take that advice to Ratchet, where they will thank you for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = {
        { id = "customers_d", text = "Chaw Stronghide for salt and thread, more than anyone. Mahnott Roughwound takes my flux, Jhawna Oatwind my spices, and Pyall Silentstride buys one pinch of pepper at a time as though it were gold." },
      },
      choices = {
        { text = "And the worst?", next = "customers_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_worst = {
      lines = {
        { id = "customers_worst_d", text = "Varg Windwhisper, who is a merchant himself and therefore haggles for sport. We spent a whole afternoon on a spool of thread once, and I would not have missed it." },
      },
      choices = {
        { text = "Who won?", next = "BACK", reply = "I did, by two coppers, and he has not stopped claiming otherwise.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    new = {
      lines = {
        { id = "new_d", text = "Coin is new. Trade is as old as the tribes, and when we wandered, the Darkmanes carried flint and salt between the herds. I do what my grandmothers did, only now I sit still and the goods come to me." },
      },
      choices = {
        { text = "Do you miss the wandering?", next = "new_wander" },
        { text = "Something else.", next = "BACK" },
      },
    },
    new_wander = {
      lines = {
        { id = "new_wander_d", text = "My feet do not. My eyes do, a little, on mornings when the wind comes from the south and smells of somewhere else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_d", text = "Salt, always, because there is none in these hills. After that it is coarse thread in the hunting season, and flux whenever the Stonehoofs on the bluff have a large order and buy it all before it gets this far." },
      },
      choices = {
        { text = "I'll buy before the Stonehoofs do.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barter = {
      lines = {
        { id = "barter_d", text = "So did mine, and she thought coin was a goblin's trick. She was half right, but you cannot cut a kodo hide into change, and that settled it for me." },
      },
      choices = {
        { text = "A fair point.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally = {
      lines = {
        { id = "tally_d", text = "Everything, on knotted cord, the way the Darkmanes always have. Each knot is a debt or a delivery, and I can tell you what Chaw Stronghide owed me three winters ago without looking." },
      },
      choices = {
        { text = "What did he owe?", next = "BACK", reply = "A measure of salt, and he paid it. I only keep the cord so he remembers that I remember.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture = { { id = "tp_ven", text = "The Venture Company sends buyers down the Barrens road now and then, and I send them back up it." } },
    background = { { id = "tp_bg", text = "The Darkmanes have always carried goods between the tribes. I am the first of us to do it from a tent that stays put." } },
    advice = { { id = "tp_ad", text = "Buy your salt before you need it. In Mulgore, by the time you need it, somebody else has bought it." } },
    _none = { { id = "tp_none", text = "I could not tell you, and I do not sell guesses. Try Innkeeper Kauth." } },
  },
}
