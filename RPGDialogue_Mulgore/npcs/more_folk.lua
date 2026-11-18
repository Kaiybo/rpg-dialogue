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
    first = "Brave Wildrunner stands watch in Bloodhoof Village and gives directions to anyone who asks, patiently and more than once. He takes the safety of the village personally, and he seemed glad of another pair of hands.",
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
    first = "Lanka Farshot trains Camp Narache's young hunters and believes a hunter serves the tribe before himself. He looks at everyone as if measuring how far they could shoot, and he does not hand out praise for free.",
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
    first = "Moodan Sungrain bakes bread and pours drinks for the young tauren training at Camp Narache, and he seems to think it is his duty to fatten them up before they leave. He laughs easily and loudly.",
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
    first = "Harant Ironbrace sells armour and shields in Bloodhoof Village and judges every customer by the dents in what they already wear. He is gruff, but he takes the time to fit a shield properly.",
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
    first = "Uthan Stillwater teaches fishing on the bank of Stonebull Lake, west of Bloodhoof, and he speaks as quietly as if the fish might hear. He seems to have more patience than anyone I have met.",
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
    first = "Rimblat Earthshatter is a young tauren shaman of the Earthen Ring at Camp Gev'rek, where the Ring and the Windshapers have come together. He believes wounded land can be healed, and he says so with a conviction that is hard not to like.",
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
    quilboar = { { id = "tp_quil", text = "The Bristleback raid our stores when their own run thin. I do not forgive it, but I have been hungry, and I understand it." } },
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
    venture_company = { { id = "tp_ven", text = "The Venture Company sends buyers down the Barrens road now and then, and I send them back up it." } },
    background = { { id = "tp_bg", text = "The Darkmanes have always carried goods between the tribes. I am the first of us to do it from a tent that stays put." } },
    advice = { { id = "tp_ad", text = "Buy your salt before you need it. In Mulgore, by the time you need it, somebody else has bought it." } },
    _none = { { id = "tp_none", text = "I could not tell you, and I do not sell guesses. Try Innkeeper Kauth." } },
  },
}

---------------------------------------------------------------------------
-- Kawnie Softbreeze: general goods vendor at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "kawnie", id = TODO_NPC("Kawnie Softbreeze"), name = "Kawnie Softbreeze", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "gentle", "fussing" }, values = { "community", "care" },
  notices = { "race", "class", "greenness" },
  impression = {
    first = "Kawnie Softbreeze sells general goods at Camp Narache and packs the bags of every young brave who leaves the mesa. She checked my waterskin twice while we talked, and I do not think she knew she was doing it.",
    third = "{name} met Kawnie Softbreeze, who sells general goods at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "Come in out of the wind, young one. Tell me where you are bound, and I will tell you what you have forgotten to pack." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with a lighter pack than I sent you off with. Let us see what needs filling." },
    { id = "g_away", when = { away = 14 }, text = "{away} away from the mesa! You have grown, and your waterskin has not, so sit a moment." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have the look of one about to walk down off Red Cloud Mesa for the first time. I have seen it on a great many faces, and I am fond of it every time." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and Lanka Farshot's student, I should think. You will be wanting shot or arrows, and more of them than you believe." },
    { id = "n_outsider", cat = "race", when = { race = { "Orc", "Troll", "Scourge" } },
      text = "A guest on the mesa. You are welcome here, and you will find our goods plain, but they do what they are meant to do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kawnie Softbreeze. Waterskins, torches, bags and blankets, and whatever else a brave needs between this fire and the next one, I keep here." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Kawnie Softbreeze, child. Chief Hawkwind sends the young ones to prove themselves, and I see to it that they do so with a full waterskin." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Kawnie Softbreeze, and I keep the camp's arrows and shot as well as its blankets. Count what you carry before you go into Brambleblade Ravine, and then buy half as many again." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you, young one?" },
        { id = "h_again2", text = "Ask, and mind the baskets behind you." },
        { id = "h_again3", text = "Yes, child?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What does a young brave forget to pack?", next = "pack" },
        { text = "You must have seen many braves leave this camp.", next = "leave" },
        { text = "Tell me about the others in Camp Narache.", next = "camp" },
        { text = "What lies down the road to Bloodhoof Village?", next = "road" },
        { text = "My rites are nearly done, Kawnie.", next = "rites", when = { race = "Tauren" } },
        { text = "How much shot does the ravine take?", next = "shot", when = { class = "HUNTER" } },
        { text = "Walk with the Earth Mother, Kawnie.", next = "END" },
      },
    },
    pack = {
      lines = {
        { id = "pack_d", text = "Water, always, and after that a second bag. They go out with one small pouch and come back with their arms full of plainstrider feathers and nowhere to put them." },
      },
      choices = {
        { text = "And what do they pack that they shouldn't?", next = "pack_too" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pack_too = {
      lines = {
        { id = "pack_too_d", text = "Pride, mostly, which weighs a great deal and cannot be eaten. The second thing is their grandfather's axe, which is too heavy for them, and Marjak Keenblade has to talk them into something they can lift." },
      },
      choices = {
        { text = "I'll leave the pride here, then.", next = "BACK", reply = "Leave a little of it. You will want some on the day you meet a Bristleback.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      narr = "She folds a blanket over her arm and smooths it flat without looking down.",
      lines = {
        { id = "leave_d", text = "More than I have counted, and I remember what each of them bought. Most come back up the mesa one day to show me they are still whole, and that is the best trade I make." },
      },
      choices = {
        { text = "And the ones who do not come back?", next = "leave_gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave_gone = {
      big = true,
      lines = {
        { id = "leave_gone_d", text = "Some are only far away, in the Barrens or beyond the sea, and I choose to think that of all of them. A few I know better about, and I keep their names with Seer Graytongue, who speaks them at the fire." },
      },
      choices = {
        { text = "Then no brave should be sent before they are ready.", next = "BACK", reply = "I have said so to the chief more than once. He hears me, and he sends them anyway, a little later than he would have.", fx = { align = { light = 1 } } },
        { text = "The plains test us. Sheltered calves make weak braves.", next = "BACK", reply = "That is what Harutt Thunderhorn says, and he is not wrong. I only wish the plains tested them more gently.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "camp_d", text = "Chief Hawkwind you will know, and his son Grull, who watches the quilboar. Moodan Sungrain bakes for us, and the three in the armory tent, Marjak, Varia and Bronk, argue all day over whose craft keeps a brave alive." },
      },
      choices = {
        { text = "Whose craft does keep a brave alive?", next = "camp_craft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_craft = {
      lines = {
        { id = "camp_craft_d", text = "Mine, of course, though I do not say so in their hearing. Nobody has ever come home because of a sharp axe who did not also have water to drink on the way." },
      },
      choices = {
        { text = "I won't tell them you said so.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_d", text = "The path winds down off the mesa and north across open grass, with Stonebull Lake shining on your left hand before you see the village. It is half a morning's walk, and there is no shade on it." },
      },
      choices = {
        { text = "Is the road safe?", next = "road_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_safe = {
      lines = {
        { id = "road_safe_d", text = "Safe enough if you stay on it. The cougars keep to the rocks and the wolves to the long grass, and both are more curious than hungry at this time of year." },
      },
      choices = {
        { text = "I'll keep to the road.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rites = {
      lines = {
        { id = "rites_d", text = "Then you will be going down to Bloodhoof soon, and I will not see you for a long while. Moorat Longstride keeps the goods there, and he is honest, so buy from him and tell him I sent you." },
      },
      choices = {
        { text = "I will come back and show you I am whole.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot = {
      lines = {
        { id = "shot_d", text = "A full pouch going in, because the Bristleback do not stand still and you will miss more than you expect. Lanka will tell you the same, with less patience than I have." },
      },
      choices = {
        { text = "Then I'll buy a full pouch.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_quil", text = "The Bristleback are in Brambleblade Ravine, and they have been taking what the hunters leave. Grull Hawkwind can tell you more, for he watches them." } },
    background = { { id = "tp_bg", text = "I have kept the camp's stores since before Chief Hawkwind's mane went grey. Somebody has to know where the blankets are." } },
    advice = { { id = "tp_ad", text = "Drink before you are thirsty, and buy the second bag before you need it." } },
    _none = { { id = "tp_none", text = "I could not tell you, child. Ask Seer Graytongue, who knows the things I do not." } },
  },
}

---------------------------------------------------------------------------
-- Marjak Keenblade: weaponsmith in the armory tent at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "marjak", id = TODO_NPC("Marjak Keenblade"), name = "Marjak Keenblade", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "exact", "proud" }, values = { "craft", "tradition" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Marjak Keenblade sells weapons from the armory tent at Camp Narache and judges a brave by how they pick one up. He took my weapon from me, looked along the edge, and handed it back without a word.",
    third = "{name} met Marjak Keenblade, the weaponsmith at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "Step in, and let me see your hands before you look at my blades. The hand chooses the weapon, whatever the eye may want." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Show me the edge, and I will know how you have been treating it." },
    { id = "g_away", when = { away = 14 }, text = "{away} since I saw that weapon. It has been used, which is more than I can say for some I have sold." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Harutt Thunderhorn's student, by the way you stand. He teaches the swing well, and he leaves it to me to teach the care." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Your forearms say you have stood at a forge. Then you will see at once which of these I made in a hurry, and I will thank you not to say." },
    { id = "n_caster", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk the spirits' path, I think. Even so, a staff or a mace in the hand is a comfort when the spirits are slow to answer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Marjak Keenblade. Axes, maces and staves for a brave's first hunts, each one plain and each one true, and none of them will fail you before you fail them." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "I am Marjak Keenblade. You are a warrior, so you will want the heaviest thing on the rack, and I will tell you now that it is the wrong choice until your shoulders grow into it." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "I am Marjak Keenblade, and you are of the craft. Look as closely as you like, for I would rather be judged by a smith than praised by a calf." },
      },
      again = {
        { id = "h_again", text = "What more would you know?" },
        { id = "h_again2", text = "Speak, I am only oiling a haft." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "How should I choose a first weapon?", next = "choose" },
        { text = "These are plain weapons, Marjak.", next = "plain" },
        { text = "You share this tent with two others.", next = "tent" },
        { text = "Where does Narache get its iron?", next = "iron" },
        { text = "Judge my grip, then.", next = "grip", when = { class = { "WARRIOR", "HUNTER" } } },
        { text = "Which of these did you make in a hurry?", next = "hurry", when = { profession = "Blacksmithing" } },
        { text = "May your edges hold, Marjak.", next = "END" },
      },
    },
    choose = {
      lines = {
        { id = "choose_d", text = "Lift it, hold it out level, and count slowly to twenty. If the head has not dipped, it is yours, and if it has, you have learned something that cost you nothing." },
      },
      choices = {
        { text = "And if every weapon dips?", next = "choose_dip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_dip = {
      lines = {
        { id = "choose_dip_d", text = "Then you take the staff, and you go and carry water for Kawnie Softbreeze for a season. There is no shame in it, for I carried a great deal of water myself before I carried an axe." },
      },
      choices = {
        { text = "I'll count to twenty.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = {
        { id = "plain_d", text = "They are, and I mean them to be. A young brave with a carved and feathered axe thinks about the axe, and a young brave with a plain one thinks about the boar." },
      },
      choices = {
        { text = "Then where do the fine weapons come from?", next = "plain_fine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain_fine = {
      big = true,
      lines = {
        { id = "plain_fine_d", text = "From Mahnott Roughwound in Bloodhoof, and from the smiths on Thunder Bluff after him. A brave earns the right to carry their work by outliving mine, and I think that is the proper order of things." },
      },
      choices = {
        { text = "That is right. A weapon should be earned.", next = "BACK", reply = "So my father taught me, and his before him. I am glad the young still hear it.", fx = { align = { honor = 1 } } },
        { text = "A better weapon would keep more young braves alive.", next = "BACK", reply = "A better arm keeps them alive. I have seen fine steel dropped in the grass by braves who ran, and I have picked it up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent = {
      lines = {
        { id = "tent_d", text = "Varia Hardhide sells the leathers and Bronk Steelrage the shields, and between us a brave leaves this tent fully dressed for the ravine. Bronk will tell you the shield matters most, and he will tell you loudly." },
      },
      choices = {
        { text = "And what do you tell him?", next = "tent_bronk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent_bronk = {
      lines = {
        { id = "tent_bronk_d", text = "That no quilboar was ever driven from Mulgore by being blocked. He has had no answer to it in all these seasons, and he keeps looking for one, which I respect." },
      },
      choices = {
        { text = "I think he may find one yet.", next = "BACK", reply = "He may, and I will listen when he does. Until then the axe has it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron = {
      lines = {
        { id = "iron_d", text = "A little comes down from the hills by the hands of our own miners, and the rest comes up the road from Bloodhoof. There is copper enough in Mulgore, though I would be happier if the goblins had not found it as well." },
      },
      choices = {
        { text = "The Venture Company, you mean.", next = "iron_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_venture = {
      lines = {
        { id = "iron_venture_d", text = "The same. They cut into the hills north of Bloodhoof as though the land were a carcass, and they leave the bones lying. We take what the earth offers at the surface, and we thank her for it." },
      },
      choices = {
        { text = "The earth should not be gutted for metal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grip = {
      narr = "He turns your wrist over in one great hand and presses his thumb against the heel of your palm.",
      lines = {
        { id = "grip_d", text = "Too tight, as it always is with the young. Hold the haft as you would hold a small bird, firm enough that it cannot fly and gentle enough that it lives." },
      },
      choices = {
        { text = "I'll remember the bird.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurry = {
      lines = {
        { id = "hurry_d", text = "The third mace from the left, the week the Bristleback burned the drying racks and every brave in camp wanted arming by nightfall. It is sound, but the head sits a hair off true, and I see it each time I pass." },
      },
      choices = {
        { text = "Nobody but a smith would ever know.", next = "BACK", reply = "A smith knows, and that is one too many.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_quil", text = "The Bristleback carry stolen iron and treat it badly. I have reforged a few of their blades, and the metal was grateful." } },
    background = { { id = "tp_bg", text = "The Keenblades have armed Narache's young since the camp was raised. I learned the forge from my father, and the patience from spoiling good iron." } },
    advice = { { id = "tp_ad", text = "Oil the haft as often as the edge. A blade that leaves the handle is of no use to anyone but the boar." } },
    _none = { { id = "tp_none", text = "That is not a matter of iron, so I have nothing useful to say. Ask Chief Hawkwind." } },
  },
}

---------------------------------------------------------------------------
-- Varia Hardhide: leather armor merchant in the armory tent at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "varia", id = TODO_NPC("Varia Hardhide"), name = "Varia Hardhide", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "frank", "wry" }, values = { "thrift", "craft" },
  notices = { "kit", "craft", "class" },
  impression = {
    first = "Varia Hardhide sells leather armor in the armory tent at Camp Narache and says plainly that it is rough work meant to be outgrown. She tugged at my shoulder strap and told me who had stitched it badly.",
    third = "{name} met Varia Hardhide, who sells leather armor at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "Come and be measured, young one. I will tell you honestly what fits, which is more than the two smiths beside me will do." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and that jerkin has stretched across the shoulders. You are growing, or you have been caught in the rain." },
    { id = "g_away", when = { away = 14 }, text = "{away}, and you are still wearing leather. Good, it means you came home in it." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You have a skinner's knife on your belt, and it has been used. Bring me what you take, for I am always short of good boar hide." },
    { id = "n_druid", cat = "class", when = { class = { "DRUID", "HUNTER", "SHAMAN" } },
      text = "Here is one who will wear leather and be glad of it. You will find the others in this tent have very little to sell you." },
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, who will be wanting Bronk's mail as soon as you can bear the weight. Wear my leather under it, or it will rub you raw." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Varia Hardhide. Jerkins, leggings, gloves and boots in good boar and plainstrider hide, cut large so that you may grow into them, and not pretty, because pretty does not turn a tusk." },
        { id = "h_leather", when = { class = { "DRUID", "HUNTER", "SHAMAN" } }, text = "I am Varia Hardhide, and you are my kind of customer. Everything on this side of the tent is yours to try, and I will tell you when it does not suit you." },
        { id = "h_skinner", when = { profession = { "Leatherworking", "Skinning" } }, text = "I am Varia Hardhide. You work hides yourself, so I will not pretend these are fine pieces, for they are honest ones and that is all I claim." },
      },
      again = {
        { id = "h_again", text = "What else? I have a seam to finish, but it will wait." },
        { id = "h_again2", text = "Ask away, I can stitch and talk." },
        { id = "h_again3", text = "Yes, young one?" },
      },
      choices = {
        { text = "Show me your leathers.", next = "BUSINESS" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Your work looks rough, if I may say so.", next = "rough" },
        { text = "How do you bear sharing a tent with two smiths?", next = "smiths" },
        { text = "How do I keep leather from rotting?", next = "care" },
        { text = "What hide do you want most?", next = "want", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "A druid shifts shape. Does armor matter?", next = "shift", when = { class = "DRUID" } },
        { text = "Good stitching to you, Varia.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hides_d", text = "From the camp's own hunts, every one. The young braves bring down plainstriders and battleboars for their rites, the meat goes to the fires, and the skins come to me before the sun has dried them." },
      },
      choices = {
        { text = "So a brave may wear the boar they killed.", next = "hides_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_own = {
      lines = {
        { id = "hides_own_d", text = "Now and then, and they are always proud of it. I do not tell them that one hide looks much like another once it is scraped, because the beast would want to be remembered, and so would I." },
      },
      choices = {
        { text = "That is a kind silence to keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough = {
      lines = {
        { id = "rough_d", text = "You may say so, because it is. I make what a brave wears for one season of being knocked down by boars, and I will not spend a month's fine tooling on something that ends up in a bramble." },
      },
      choices = {
        { text = "Do you ever make something fine?", next = "rough_fine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough_fine = {
      big = true,
      lines = {
        { id = "rough_fine_d", text = "Once a year, for whichever young one Chief Hawkwind names as having done best in their rites. It is a belt, tooled with the mesa and the eagle, and I have never yet sold one." },
      },
      choices = {
        { text = "Some things should be given and never sold.", next = "BACK", reply = "So I think. The day I put a price on that belt, I will have become a goblin.", fx = { align = { honor = 1 } } },
        { text = "You'd do well to sell them. Good work deserves coin.", next = "BACK", reply = "It deserves a good wearer, and I get one. Coin I have enough of, from the rough work.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = {
        { id = "smiths_d", text = "With cotton in my ears on forging days. Marjak Keenblade says the weapon keeps a brave alive and Bronk Steelrage says the shield does, and they have been at it since before I came to this tent." },
      },
      choices = {
        { text = "And what does the leatherworker say?", next = "smiths_say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths_say = {
      lines = {
        { id = "smiths_say_d", text = "That a brave may drop an axe and may drop a shield, but nobody ever dropped their leggings in a fight. I let the two of them argue, and I sell to everyone who passes." },
      },
      choices = {
        { text = "I think you have won that argument.", next = "BACK", reply = "I won it years ago. I simply have not told them.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = {
        { id = "care_d", text = "Dry it slowly, away from the fire, and rub fat into it while it is still a little damp. Leather that is baked dry cracks, and leather that is left wet stinks, and either way I will know when you come back." },
      },
      choices = {
        { text = "Slowly, and away from the fire.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    want = {
      lines = {
        { id = "want_d", text = "Mountain cougar, which is supple and takes a stitch beautifully, and which I almost never see. The young ones are told to leave the cougars alone, and for once they do as they are told." },
      },
      choices = {
        { text = "I may bring you one.", next = "BACK", reply = "Take it clean, then, and thank the cat. Nawka Wildsong can show you the cut if you are unsure.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift = {
      lines = {
        { id = "shift_d", text = "Gart Mistrunner tells me the leather goes with you into the bear, though he cannot say where. I do not understand it, but I have stopped arguing, and I cut druids' jerkins a little looser across the back to be safe." },
      },
      choices = {
        { text = "The bear thanks you for it.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_quil", text = "The Bristleback wear hide as well, cured so badly you can smell them before you see them. It is the one useful thing about their craft." } },
    background = { { id = "tp_bg", text = "I have dressed Narache's young for as long as I have had hands steady enough to hold an awl. There is little else to tell." } },
    advice = { { id = "tp_ad", text = "Buy it a little large. You will grow, and leather will not." } },
    _none = { { id = "tp_none", text = "I know hides and seams, young one, and that is not either. Try Kawnie Softbreeze, who hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Bronk Steelrage: armorer and shieldcrafter in the armory tent at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "bronk", id = TODO_NPC("Bronk Steelrage"), name = "Bronk Steelrage", title = "Armorer & Shieldcrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "booming", "earnest" }, values = { "protection", "craft" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Bronk Steelrage sells mail and shields in the armory tent at Camp Narache, and he believes with his whole chest that a shield is the first thing a brave should own. He rapped his knuckles on one to prove it, and the whole tent rang.",
    third = "{name} met Bronk Steelrage, the armorer and shieldcrafter at Camp Narache.",
  },
  greetings = {
    { id = "g_hi", text = "Ho, young one! Come here and put your arm through this strap, and tell me you do not feel safer already." },
    { id = "g_back", when = { metBefore = true }, text = "Ho, you are back, and in one piece! I will take the credit for that, whatever Marjak says." },
    { id = "g_away", when = { away = 14 }, text = "{away}! Let me see the shield, for the dents will tell me the whole story faster than you can." },
  },
  notice = {
    { id = "n_shield", cat = "class", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "Ha, here is one with the arm to carry a shield and the sense to want one. We are going to get along well, you and I." },
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You know metal, I can tell by how you look at the rivets and not the shine. Good, look at the rivets, for that is where a shield lives or dies." },
    { id = "n_soft", cat = "class", when = { class = { "DRUID", "HUNTER" } },
      text = "You will be wanting Varia's leathers and not my mail, and I do not hold it against you. Come back if the boars ever change your mind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Bronk Steelrage, of the Steelrage, and I make the mail and the shields that stand between Narache's young and the Bristleback's tusks. It is the best work in the camp, and I will hear no argument." },
        { id = "h_shield", when = { class = { "WARRIOR", "SHAMAN" } }, text = "I am Bronk Steelrage, and you have a shield arm if ever I saw one! Marjak will sell you something to swing, and that is well enough, but come to me first." },
        { id = "h_smith", when = { profession = { "Blacksmithing", "Mining" } }, text = "I am Bronk Steelrage. You work metal, so you will know that anyone can put an edge on iron, and that making it take a blow a hundred times is the true craft." },
      },
      again = {
        { id = "h_again", text = "What else, young one? Speak up!" },
        { id = "h_again2", text = "Ask, ask, I have all day and a loud voice." },
        { id = "h_again3", text = "Ho, yes?" },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Why a shield before a weapon?", next = "shield" },
        { text = "The Steelrage is a tribe I do not know.", next = "tribe" },
        { text = "Marjak says nothing was ever won by blocking.", next = "marjak" },
        { text = "What makes a shield fail?", next = "fail" },
        { text = "Teach me to take a blow on it.", next = "blow", when = { class = { "WARRIOR", "SHAMAN" } } },
        { text = "Your rivets are set very close together.", next = "rivets", when = { profession = { "Blacksmithing", "Mining" } } },
        { text = "Stand strong, Bronk.", next = "END" },
      },
    },
    shield = {
      lines = {
        { id = "shield_d", text = "Because a brave who strikes first and is struck back has had one good moment, and a brave who is struck first and still stands has the whole fight ahead. I would have every young one learn to stand before they learn to swing." },
      },
      choices = {
        { text = "Did someone teach you that the hard way?", next = "shield_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_hard = {
      big = true,
      narr = "He lifts a battered old shield down from the tent pole and turns its split face toward you.",
      lines = {
        { id = "shield_hard_d", text = "A quilboar did, in the ravine, when I was no older than the calves I sell to now. This took the tusk that was meant for my ribs, and I have made shields ever since, out of plain gratitude." },
      },
      choices = {
        { text = "Then every shield you sell is a debt repaid.", next = "BACK", reply = "Ha, that is well said, and I will say it myself from now on.", fx = { align = { light = 1 } } },
        { text = "You were lucky. Luck is not a craft.", next = "BACK", reply = "It was luck that day, I grant you. I make shields so that the next calf need not rely on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = {
        { id = "tribe_d", text = "We are few, and we have always been smiths, following the larger tribes and mending what they broke. When Cairne Bloodhoof gathered the tribes into Mulgore, we came gladly, for a forge that stays in one place burns a great deal hotter." },
      },
      choices = {
        { text = "Do the Steelrage have a forge on Thunder Bluff?", next = "tribe_bluff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_bluff = {
      lines = {
        { id = "tribe_bluff_d", text = "My kin work up there, and I visit when I can bear the lifts. I chose the mesa myself, because the bluff arms warriors who already know their trade, and here I arm the ones who do not yet." },
      },
      choices = {
        { text = "The young need you more.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    marjak = {
      lines = {
        { id = "marjak_d", text = "He says that every day, and every day I say that nothing was ever won by a brave lying in the grass with a tusk in him. Then Varia tells us both to be quiet, and we are, for a little while." },
      },
      choices = {
        { text = "You sound fond of him, all the same.", next = "marjak_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marjak_fond = {
      lines = {
        { id = "marjak_fond_d", text = "He is the finest edge-maker south of the bluff, and I would trust no other axe beside my shield. Do not tell him I said so, for he would be unbearable until the rains." },
      },
      choices = {
        { text = "He'll not hear it from me.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail = {
      lines = {
        { id = "fail_d", text = "The strap, nine times in ten, and hardly ever the face. A brave will oil the boss until it shines and never once look at the leather that holds the thing to their arm." },
      },
      choices = {
        { text = "I'll check my straps tonight.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blow = {
      lines = {
        { id = "blow_d", text = "Do not hold it flat to the boar like a door, for he will knock you down behind it. Turn the face a little, so that the tusk slides off toward your shield side, and step into him as he passes." },
      },
      choices = {
        { text = "Turn it, and step in.", next = "BACK", reply = "That is it! Harutt Thunderhorn will make you do it a thousand times, and you will thank him at the thousand and first.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivets = {
      lines = {
        { id = "rivets_d", text = "Closer than they need to be, and I know it. My father set his a hand apart and his shields held, but I sleep better with a thumb's width, and it is my sleep." },
      },
      choices = {
        { text = "A careful smith is no bad thing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_quil", text = "A Bristleback charges with his head down and his tusks up. Meet him with the shield's edge low, and he will do half your work for you." } },
    background = { { id = "tp_bg", text = "I am a Steelrage, and we have been smiths as long as the tribes have had iron. I make shields because one saved me." } },
    advice = { { id = "tp_ad", text = "Look to your straps! The face of a shield takes care of itself." } },
    _none = { { id = "tp_none", text = "Ho, that is beyond me, young one. I know mail and shields, and I know them loudly." } },
  },
}

---------------------------------------------------------------------------
-- Reban Freerunner: pet trainer in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "reban", id = TODO_NPC("Reban Freerunner"), name = "Reban Freerunner", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "patient", "watchful" }, values = { "the hunt", "kinship" },
  notices = { "pet", "class", "race" },
  impression = {
    first = "Reban Freerunner teaches hunters' beasts in Bloodhoof Village, and he watches the animal long before he looks at whoever brought it. He speaks of a pet as a hunting partner who has agreed to stay.",
    third = "{name} met Reban Freerunner, the pet trainer in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, and stand easy. If a beast walks with you, let it come forward first, for I learn more from it than from you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me how your companion has fared, and I will know how you have fared." },
    { id = "g_away", when = { away = 14 }, text = "{away} on the trail. A beast changes in that time, and so does the one it follows." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} holds its ground beside you and watches my hands. That is a beast that trusts you and nobody else, which is how it should be." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry yourself as Yaw Sharpmane teaches, with your weight ready to move. She shapes the hunter, and I am left the easier task of the beast." },
    { id = "n_other", cat = "class", when = { class = { "WARRIOR", "SHAMAN", "DRUID" } },
      text = "You are no hunter, so I have nothing to teach you. Even so, you are welcome to sit and watch the swoops with me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Reban Freerunner. When a hunter's beast has learned all it can from the wild, they bring it to me, and I teach it what it needs to hunt beside one of us." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Reban Freerunner, young hunter. Your companion has its own strengths, and my work is to find them and draw them out, so tell me what you have seen it do best." },
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Reban Freerunner. You wear the beast yourself, druid, and I have often wondered whether that makes you my student or my teacher." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak softly, and go on." },
        { id = "h_again3", text = "I am listening." },
      },
      choices = {
        { text = "Train my companion.", next = "BUSINESS" },
        { text = "How do you teach a wild beast anything?", next = "teach" },
        { text = "A tamed beast is still a captive, Reban.", next = "captive" },
        { text = "Which of Mulgore's beasts make good companions?", next = "beasts" },
        { text = "Who else in the village works with animals?", next = "others" },
        { text = "My companion will not obey in a fight.", next = "obey", when = { class = "HUNTER" } },
        { text = "What do you see when you watch a druid?", next = "druid", when = { class = "DRUID" } },
        { text = "Good hunting, Reban.", next = "END" },
      },
    },
    teach = {
      lines = {
        { id = "teach_d", text = "I do not teach it, in truth, for I remind it of things. A wolf already knows how to bite and a swoop already knows how to dive, and I show them when their hunter needs it of them." },
      },
      choices = {
        { text = "And how do you show them?", next = "teach_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_how = {
      lines = {
        { id = "teach_how_d", text = "With food, with patience, and by doing the thing myself until the beast is embarrassed for me. You have not known humility until you have crouched and growled at a strip of meat while a prairie wolf looked on." },
      },
      choices = {
        { text = "I would pay to see that.", next = "BACK", reply = "Many have offered. I do it for the beasts and for nobody else.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    captive = {
      big = true,
      lines = {
        { id = "captive_d", text = "I have turned that over many nights. A beast that wishes to leave will leave, for no hunter can watch it always, and yet they stay, through hunger and wounds. I call that a choice, though I know it is one we have leaned upon." },
      },
      choices = {
        { text = "They stay because they are kin to us.", next = "BACK", reply = "That is what I believe. The Earth Mother made us hunters both, and it is no strange thing that we should hunt together.", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. It need not agree.", next = "BACK", reply = "Then you will have a weapon, and it will fail you as weapons do. I would rather you had a partner.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_d", text = "The prairie wolf is loyal and tireless, and it suits most young hunters. The swoop is clever but proud, and the plainstrider is fast and has no more sense than a thrown stone." },
      },
      choices = {
        { text = "What of the cougars?", next = "beasts_cat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_cat = {
      lines = {
        { id = "beasts_cat_d", text = "The flatland cougar hunts alone and does not see why that should change. One will follow you if you earn it, but it will never fetch for you, and you must not ask." },
      },
      choices = {
        { text = "I would not dare ask a cougar to fetch.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_d", text = "Seikwa keeps the stable, and she will feed and shelter a beast you cannot take with you. Harb Clawhoof has the kodo, and Yaw Sharpmane teaches the hunters themselves, down by the lake." },
      },
      choices = {
        { text = "Do the four of you agree on how it is done?", next = "others_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_agree = {
      lines = {
        { id = "others_agree_d", text = "Seikwa thinks I am too soft with them, and Harb thinks nothing smaller than a kodo is worth the effort. Yaw and I agree on everything except which of us the beasts like better." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    obey = {
      lines = {
        { id = "obey_d", text = "Then it is frightened, or it is hungry, or it does not yet believe you will stand when it stands. Feed it from your own hand after every hunt, and do not once leave it to fight alone." },
      },
      choices = {
        { text = "I have run and left it, once.", next = "obey_ran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    obey_ran = {
      lines = {
        { id = "obey_ran_d", text = "It remembers, and it has forgiven you, or it would not be here. Beasts forgive more readily than we do, but they forgive each thing only the once." },
      },
      choices = {
        { text = "It will not happen again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "druid_d", text = "I see someone who has stopped asking the beast to come to them and has gone to it. Gennia Runetotem let me watch her take the bear's shape once, and I learned more in that moment than in a season with the wolves." },
      },
      choices = {
        { text = "The bear has taught me patience, too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    harpies = { { id = "tp_harp", text = "The Windfury harpies take beasts as well as travellers, and they waste what they kill. No beast I have trained will go near their nests willingly." } },
    background = { { id = "tp_bg", text = "I ran with the hunters when I was young, and I found I watched the wolves more than the prey. The tribe was wise enough to put that to use." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself. It notices, and it does not forget." } },
    _none = { { id = "tp_none", text = "That is no matter of tooth or claw, and so I am the wrong one to ask." } },
  },
}

---------------------------------------------------------------------------
-- Moorat Longstride: general goods vendor in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "moorat", id = TODO_NPC("Moorat Longstride"), name = "Moorat Longstride", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "easygoing", "talkative" }, values = { "community", "travel" },
  notices = { "travel", "race", "class" },
  impression = {
    first = "Moorat Longstride sells general goods in Bloodhoof Village and asks every traveller which road they came by. He has not left Mulgore in years, and he knows the Gold Road better than most who walk it.",
    third = "{name} met Moorat Longstride, who sells general goods in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, traveller! Set your pack down and tell me which road you came in by, and I will tell you what it has worn out." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and glad I am to see it. Where have your hooves or boots taken you since?" },
    { id = "g_away", when = { away = 14 }, text = "{away}! You will have been past Camp Taurajo at least, in that time. Come, tell me how the road stands." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Down from Narache, are you? Then Kawnie Softbreeze packed that bag, for nobody else ties a waterskin with that knot." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "You have come the long way, from Durotar and across the Barrens. I would give a good deal to hear what the Crossroads looks like this season." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and nearly out of shot by the weight of that pouch. I keep both shot and arrows, since Kennah Hawkseye sells the guns and cannot be troubled with what goes in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Moorat Longstride. Whatever the road asks of you, I likely have it, from waterskins and torches to bags and bedrolls, with shot and arrows for those who need them." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Moorat Longstride, and you are one of ours setting out. Sit a moment, for I outfit every young brave who leaves by the north bridge, and I like to know their names." },
        { id = "h_far", when = { race = { "Orc", "Troll", "Scourge" } }, text = "I am Moorat Longstride. You have come a long way to stand in my tent, so buy what you need and pay me the rest in news, for I am hungry for it." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I am in no hurry." },
        { id = "h_again2", text = "Go on, I like the company." },
        { id = "h_again3", text = "Yes, traveller?" },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What should I carry beyond Mulgore?", next = "carry" },
        { text = "You ask about the road a great deal.", next = "road" },
        { text = "Who are the Longstrides?", next = "kin" },
        { text = "How fares the village?", next = "village" },
        { text = "The Crossroads is busy, and the road is watched.", next = "news", when = { race = { "Orc", "Troll" } } },
        { text = "Kawnie Softbreeze sends her regards.", next = "kawnie", when = { race = "Tauren" } },
        { text = "May your road be kind, Moorat.", next = "END" },
      },
    },
    carry = {
      lines = {
        { id = "carry_d", text = "Twice the water you carried here, for a start. Mulgore spoils us with her wells and her lake, and the Barrens begins the moment you pass the gate and does not give a drop away." },
      },
      choices = {
        { text = "And besides water?", next = "carry_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_more = {
      lines = {
        { id = "carry_more_d", text = "A torch, though you think you will not travel by night, because you will. A spare bag as well, and the name of the innkeeper at Camp Taurajo, who will know your face faster if you greet her by hers." },
      },
      choices = {
        { text = "I'll take the torch.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_d", text = "I do, and I will tell you why. My name is Longstride, and I have stood behind these baskets so many seasons that my legs have forgotten what it meant." },
      },
      choices = {
        { text = "Then why not walk it yourself?", next = "road_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_why = {
      big = true,
      lines = {
        { id = "road_why_d", text = "Because the braves must set out from somewhere, and somebody must be standing there with a full waterskin when they do. I told myself I would go when the village could spare me, and it has not managed to yet." },
      },
      choices = {
        { text = "The village needs you here. That is worth more.", next = "BACK", reply = "So I tell myself each spring, when the grass comes up green and the road looks its best. It is kind of you to say it too.", fx = { align = { light = 1 } } },
        { text = "Go while you have the legs. The village will manage.", next = "BACK", reply = "It would, which is the hard part to admit. I will think on it, and I thank you for not being gentle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "kin_d", text = "A wandering family, as the name says, in the days when every tribe wandered. We were the ones sent ahead to find where the grass was good, and some of us have never lost the habit." },
      },
      choices = {
        { text = "Are your kin still on the roads?", next = "kin_roads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_roads = {
      lines = {
        { id = "kin_roads_d", text = "There are Longstrides up on Thunder Bluff and others gone farther than that. They send word when they remember to, and I keep a place by my fire for whichever of them turns up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "village_d", text = "Well enough, though I hear more complaints than I used to. The Palemane gnolls take from the hunters' kills, the goblins are at the hills to the north, and Wunna Darkmane tells me salt has gone up again." },
      },
      choices = {
        { text = "Do you and Wunna share the trade?", next = "village_wunna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_wunna = {
      lines = {
        { id = "village_wunna_d", text = "We split it long ago, and it has kept the peace. She sells what a crafter uses and I sell what a traveller carries, and when someone asks for thread I point across the village and she does the same with bedrolls." },
      },
      choices = {
        { text = "A fair arrangement.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = {
        { id = "news_d", text = "Watched by whom, though? By the Horde's grunts or by something worse? No, do not tell me, I will only lie awake. Busy is good, for busy means the caravans still run." },
      },
      choices = {
        { text = "The grunts hold it well enough.", next = "BACK", reply = "Then I will sleep, and so will the braves I send that way. Thank you, friend.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kawnie = {
      lines = {
        { id = "kawnie_d", text = "Ha! She sends them and a list of things I am to check in your pack, I do not doubt. Turn around, then, and let me see that the waterskin is full, or I shall hear of it." },
      },
      choices = {
        { text = "It's full. She checked it twice.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_ven", text = "The goblins bought a waterskin from me once, before I knew what they were about. I have regretted that sale ever since." } },
    background = { { id = "tp_bg", text = "I am a Longstride who stayed put, which my grandmothers would have found very funny." } },
    advice = { { id = "tp_ad", text = "Ask the road's news from whoever is coming the other way. It costs a greeting, and it has saved lives." } },
    _none = { { id = "tp_none", text = "That one has not come up the road to me yet, friend. Try Innkeeper Kauth, who hears what I miss." } },
  },
}

---------------------------------------------------------------------------
-- Kennah Hawkseye: gunsmith in Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "kennah", id = TODO_NPC("Kennah Hawkseye"), name = "Kennah Hawkseye", title = "Gunsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "deliberate", "thoughtful" }, values = { "the hunt", "craft" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Kennah Hawkseye sells guns in Bloodhoof Village and is still, by his own account, deciding what he thinks of them. He handles a rifle as carefully as an elder handles a pipe.",
    third = "{name} met Kennah Hawkseye, the gunsmith in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Keep the muzzle of anything you carry toward the ground while you are in my tent, and we shall be friends." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Has it fired true for you, or has it taught you to clean it?" },
    { id = "g_away", when = { away = 14 }, text = "{away} of hunting. Let me look down the barrel, for I can read a season in the fouling." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You have a hunter's eyes, which rest on the far hill and not on me. Good, for the gun only finishes what the eye begins." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You carry a tinker's tools. Then you may be able to tell me how the lock on this one works, for the goblin who sold it to me could not." },
    { id = "n_bow", cat = "kit", when = { class = "HUNTER", race = "Troll" },
      text = "A Darkspear hunter, and your people favour the bow. I will not try to change your mind, though I will sell you a rifle should it change by itself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kennah Hawkseye. I sell the long guns, the blunderbuss and the hunting rifle, to those of the tribe who have taken them up, and I see that they are cared for." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Kennah Hawkseye, hunter. If Lanka Farshot started you with a rifle on the mesa, then you already know its voice, and I can find you one that speaks more clearly." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "I am Kennah Hawkseye. I sell these, and I mend them, but I did not invent them, and I am glad to meet one who understands the insides better than I do." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. I am only cleaning a barrel." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "How did the tauren come to carry guns?", next = "came" },
        { text = "A gun seems a strange thing for a tauren hunter.", next = "strange" },
        { text = "How do I keep a rifle working?", next = "care" },
        { text = "Who are your neighbours here?", next = "village" },
        { text = "Which should a young hunter choose?", next = "choose", when = { class = "HUNTER" } },
        { text = "Let me look at that lock for you.", next = "lock", when = { profession = "Engineering" } },
        { text = "May your aim be true, Kennah.", next = "END" },
      },
    },
    came = {
      lines = {
        { id = "came_d", text = "Through our allies. The orcs carried them when they came to stand with Cairne against the centaur, and the goblins of Ratchet will sell one to anybody with coin. Our hunters watched and wondered, and then a few of them asked." },
      },
      choices = {
        { text = "Were you one of the few?", next = "came_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    came_you = {
      lines = {
        { id = "came_you_d", text = "I was, and the elders did not thank me for it. I had seen a centaur fall at two hundred paces, and I thought of how many of our hunters had died closing that distance on foot." },
      },
      choices = {
        { text = "That is reason enough for anyone.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      big = true,
      narr = "He lays the rifle across his knees and rests one hand flat upon the stock.",
      lines = {
        { id = "strange_d", text = "It is strange, and I have not finished thinking about it. The bow asks you to come near and to be quiet, and the gun asks neither, and I wonder what we shall forget if nobody asks those things of us." },
      },
      choices = {
        { text = "The hunt should cost the hunter something.", next = "BACK", reply = "That is the elders' view, and on most days it is mine. I tell every buyer to stalk as though they carried a bow.", fx = { align = { honor = 1 } } },
        { text = "A clean kill from afar is a mercy. Use it.", next = "BACK", reply = "It is quicker for the beast, I grant, when the shot is good. I only fear how easy it makes the next one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = {
        { id = "care_d", text = "Clean it the night you fire it and never the morning after. Keep your powder in oiled hide, and when the rains come to Mulgore, as they do without warning, put the lock under your arm before you put your head under a tree." },
      },
      choices = {
        { text = "And if it misfires all the same?", next = "care_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care_miss = {
      lines = {
        { id = "care_miss_d", text = "Then hold it pointed at the ground and count to thirty before you so much as look at it. I knew a brave who looked sooner, and he has been called One-Brow ever since." },
      },
      choices = {
        { text = "I'll count to thirty.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "village_d", text = "Mahnott Roughwound has the weapons a brave swings, and Harant Ironbrace the shields. Moorat Longstride sells shot for what I sell, and Yaw Sharpmane sends me the hunters once she judges them ready to be trusted with powder." },
      },
      choices = {
        { text = "What does Yaw make of the guns?", next = "village_yaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_yaw = {
      lines = {
        { id = "village_yaw_d", text = "She teaches both, and she favours neither aloud. I have noticed, though, that she hunts for her own pot with a bow, and I have chosen not to ask her about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = {
        { id = "choose_d", text = "The lighter one, whatever your pride says. You will carry it from dawn to dusk and fire it perhaps ten times, so choose for the carrying." },
      },
      choices = {
        { text = "For the carrying, then.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = {
        { id = "lock_d", text = "Gladly. There is a spring behind the hammer that weakens every few moons, and I replace it without knowing why it tires. If you can tell me that, I shall be in your debt." },
      },
      choices = {
        { text = "It's seated crooked. It rubs against the plate.", next = "BACK", reply = "Is that all it is? Three winters I have wondered. I thank you, and I shall not tell the goblin.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_ven", text = "The Venture Company's goblins carry guns and fire them at anything that moves. It is the worst argument against my trade that I know of." } },
    background = { { id = "tp_bg", text = "I was a hunter with a bow for most of my life. The gun came late, and I am still making up my mind about it." } },
    advice = { { id = "tp_ad", text = "Stalk as near as you would with a bow, and then shoot. The gun is no excuse to be clumsy." } },
    _none = { { id = "tp_none", text = "I cannot say. I have thought about one thing for many years, and it has left little room for others." } },
  },
}

---------------------------------------------------------------------------
-- Vira Younghoof: bandage (first aid) trainer in Bloodhoof Village. Forever: ends Camping 101: First Aid.
---------------------------------------------------------------------------
P:NPC {
  key = "vira", id = TODO_NPC("Vira Younghoof"), name = "Vira Younghoof", title = "Bandage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "brisk", "kind" }, values = { "care", "duty" },
  notices = { "weary", "class", "craft" },
  impression = {
    first = "Vira Younghoof teaches the binding of wounds in Bloodhoof Village, and she looked me over for injuries before she said a word of greeting. She is kind, and she has no patience at all for anyone who bleeds quietly out of pride.",
    third = "{name} met Vira Younghoof, the bandage trainer in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Stand still a moment and let me look at you. Good, nothing is bleeding, so now you may tell me why you have come." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and walking evenly. Either you have been careful, or you have been binding your own wounds as I showed you." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and a new scar that I did not dress. It has healed cleanly enough, so I shall say nothing." },
  },
  notice = {
    { id = "n_hurt", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your armor hangs in strips, and I can guess at the state of the hide beneath it. Sit down on that log, and do not argue with me." },
    { id = "n_healer", cat = "class", when = { class = { "SHAMAN", "DRUID", "PRIEST" } },
      text = "You heal with the spirits' help, I can see. Learn the bandage anyway, for the spirits grow tired, and linen does not." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "HUNTER" } },
      text = "You are the sort who is brought to me on a litter, saying it is only a scratch. Learn to bind it yourself, and spare the litter-bearers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vira Younghoof. I teach the binding of wounds with clean cloth and steady hands, to anyone who will sit still long enough to learn it." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: First Aid") }, text = "So you wish to keep a First Aid Kit at your camp. That is sensible, and I will teach you to put one together once your bandaging shows me you will not waste it." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: First Aid") }, text = "How is the kit holding up? Keep the linen dry, and set your camp out in the wild, for the village does not care for tents in the middle of its paths." },
        { id = "h_healer", when = { class = { "SHAMAN", "DRUID", "PRIEST" } }, text = "I am Vira Younghoof, and you are a healer of another kind. I have great respect for what you do, and I have also bandaged a good many healers who had nothing left to call upon." },
      },
      again = {
        { id = "h_again", text = "What else? Speak while I roll these." },
        { id = "h_again2", text = "Go on, my hands are busy but my ears are not." },
        { id = "h_again3", text = "Yes, young one?" },
      },
      choices = {
        { text = "Teach me to bind wounds.", next = "BUSINESS" },
        { text = "What does a camp's First Aid Kit hold?", next = "kit", when = { questActive = TODO_QUEST("Camping 101: First Aid") } },
        { text = "What wounds do you see most in Mulgore?", next = "wounds" },
        { text = "You sound as though your patients try you.", next = "patients" },
        { text = "Where does your linen come from?", next = "linen" },
        { text = "Why learn bandages when I can call on the spirits?", next = "spirits", when = { class = { "SHAMAN", "DRUID", "PRIEST" } } },
        { text = "I've bound wounds with dirty cloth before now.", next = "dirty" },
        { text = "Earth Mother keep you, Vira.", next = "END" },
      },
    },
    kit = {
      lines = {
        { id = "kit_d", text = "Rolled linen, a clean knife, a pot for boiling water, and a salve of earthroot for what the cloth alone will not ease. It is not much, but at a camp far from any village it is the difference between resting and limping home." },
      },
      choices = {
        { text = "And others at my camp may use it?", next = "kit_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit_others = {
      lines = {
        { id = "kit_others_d", text = "That is the whole worth of it. One traveller with a kit beside the fire can mend whoever stumbles in out of the dark, and you would be surprised how often somebody does." },
      },
      choices = {
        { text = "Then I'll keep it well stocked.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds = {
      lines = {
        { id = "wounds_d", text = "Tusk gashes from the battleboars, low on the leg, and wolf bites on the forearm from braves who put an arm up to guard their throats. The harpies' claws are the worst, because they are never clean." },
      },
      choices = {
        { text = "What do you do for a harpy's claw?", next = "wounds_harpy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds_harpy = {
      lines = {
        { id = "wounds_harpy_d", text = "I wash it three times in boiled water, and the brave complains three times. Then I bind it loosely and look again each morning, because a Windfury wound that is closed up tight will sour beneath the cloth." },
      },
      choices = {
        { text = "Loosely, and look again. I'll remember.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patients = {
      lines = {
        { id = "patients_d", text = "They do. A young brave would sooner bleed into a boot all the way from the Venture Company's mine than admit a goblin cut them. I had one walk here on a split hoof and ask me the way to the inn." },
      },
      choices = {
        { text = "What did you tell him?", next = "patients_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patients_told = {
      big = true,
      lines = {
        { id = "patients_told_d", text = "That the inn was behind him and the log was in front of him, and that he was going to sit on the log. He did, and he wept a little while I worked, and I have never told anyone which brave it was." },
      },
      choices = {
        { text = "Pride like that gets young braves killed.", next = "BACK", reply = "It does, and I say so to each of them. Half of them hear it, and I count that a good season.", fx = { align = { light = 1 } } },
        { text = "A brave who hides pain has strength worth honouring.", next = "BACK", reply = "Strength, yes, and I honoured it. Then I asked him what use that strength would have been with the leg gone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    linen = {
      lines = {
        { id = "linen_d", text = "The braves bring me cloth they have taken from the Palemane gnolls and the Venture Company's workers, and I boil all of it before I trust it. Wunna Darkmane sells me thread to bind the rolls, and counts every length." },
      },
      choices = {
        { text = "Who else looks after the hurt here?", next = "linen_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    linen_others = {
      lines = {
        { id = "linen_others_d", text = "Narm Skychaser calls on the waters for those who are beyond cloth, and Gennia Runetotem does the same with the wild's help. Between them and me, very little that walks into Bloodhoof leaves it worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "spirits_d", text = "Because there will come a day when you have asked too much of them, and your friend is still bleeding. A bandage needs nothing from you but two hands, and it works when you are too tired to pray." },
      },
      choices = {
        { text = "I had not thought of it so.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dirty = {
      lines = {
        { id = "dirty_d", text = "And you lived, so the Earth Mother was watching. Next time hold the cloth over a flame for a moment, or wash it in the cleanest water you can find, and trouble her a little less." },
      },
      choices = {
        { text = "Over the flame. I will.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    harpies = { { id = "tp_harp", text = "The Windfury harpies foul their own claws, I am sure of it. Nothing they scratch heals as it should without washing." } },
    background = { { id = "tp_bg", text = "I learned from my mother, who followed the hunters with a bag of cloth. I only do the same, with a roof over me." } },
    advice = { { id = "tp_ad", text = "Bind it when it happens, and never when you get home. Home is always farther than you think." } },
    _none = { { id = "tp_none", text = "That is not a wound, so I cannot mend it. Ask Baine Bloodhoof, or the innkeeper." } },
  },
}

---------------------------------------------------------------------------
-- Yonn Deepcut: skinning trainer in Bloodhoof Village. Forever: ends Camping 101: Skinning.
---------------------------------------------------------------------------
P:NPC {
  key = "yonn", id = TODO_NPC("Yonn Deepcut"), name = "Yonn Deepcut", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "quiet", "reverent" }, values = { "the hunt", "thrift" },
  notices = { "craft", "class", "kit" },
  impression = {
    first = "Yonn Deepcut teaches skinning in Bloodhoof Village, and he teaches it as a kind of thanks owed to the beast. He says a spoiled hide is an insult, and he says it gently enough that one feels worse for it.",
    third = "{name} met Yonn Deepcut, the skinning trainer in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Show me your knife before anything else, for a dull one tears, and I will not teach tearing." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Did the hides come away whole, or did you bring Chaw Stronghide rags again?" },
    { id = "g_away", when = { away = 14 }, text = "{away} of hunting. I hope you wasted nothing, and I shall know if you did when I see your next hide." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Your knife has a worn place where the thumb sits. You have done this work, then, and we may speak as two who know it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter who does not skin leaves half the hunt on the grass. I hope you have come to me to mend that." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You carry an awl, so you are one of Chaw's. Then you know already what a careless cut costs the one who must work the hide." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Yonn Deepcut. When a beast has given its life to the hunter, I teach how to take the hide from it whole, so that nothing the Earth Mother gave is thrown away." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Skinning") }, text = "You want a Camp Chair for your fire, I hear. It is a good use for a hide, and I will show you the making of one when your knife work has earned it." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Skinning") }, text = "Does the chair sit well? Rest in it out in the wild, away from the village paths, and remember the beast that is holding you up." },
        { id = "h_skinner", when = { profession = "Skinning" }, text = "I am Yonn Deepcut, and you already carry the knife. Good, for there is always a cleaner cut to learn, and I am still learning it myself." },
      },
      again = {
        { id = "h_again", text = "What else would you learn?" },
        { id = "h_again2", text = "Ask. The hide will wait for us." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "How does a hide become a Camp Chair?", next = "chair", when = { questActive = TODO_QUEST("Camping 101: Skinning") } },
        { text = "What makes a clean cut?", next = "cut" },
        { text = "You speak of skinning as though it were a rite.", next = "rite" },
        { text = "Where do the hides go after you?", next = "chaw" },
        { text = "Which of Mulgore's beasts is hardest to skin?", next = "hardest", when = { profession = "Skinning" } },
        { text = "I've left kills lying where they fell.", next = "left" },
        { text = "May your knife stay keen, Yonn.", next = "END" },
      },
    },
    chair = {
      lines = {
        { id = "chair_d", text = "You stretch the hide over a frame of lashed branches while it is still green, and you let it dry there, so that it shrinks tight and takes the shape. A kodo hide is best, but good wolf will bear your weight." },
      },
      choices = {
        { text = "Why does a camp need a chair at all?", next = "chair_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chair_why = {
      lines = {
        { id = "chair_why_d", text = "Because a hunter who never sits makes poor cuts by evening, and worse choices. Rest is a part of the hunt, though the young ones do not believe it until their hands begin to shake." },
      },
      choices = {
        { text = "Then I'll sit, and hunt better for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = {
        { id = "cut_d", text = "A sharp knife and a slow hand. You open the belly from the throat down in one line, and then you let the blade lie almost flat and ease the skin away, so that it parts from the flesh and is never sawn." },
      },
      choices = {
        { text = "And what spoils one?", next = "cut_spoil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut_spoil = {
      lines = {
        { id = "cut_spoil_d", text = "Haste, every time. A brave hears another beast in the grass and hurries, and the knife goes through the hide, and Chaw Stronghide holds the hole up to the light and looks at me through it." },
      },
      choices = {
        { text = "I would not want Chaw looking at me that way.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rite = {
      narr = "He wipes the blade on the grass, slowly, on one side and then the other.",
      lines = {
        { id = "rite_d", text = "It is one, to me. The beast ran and fed and feared as we do, and it has ended so that we may be warm. I say a word of thanks before the first cut, and I have never begun without it." },
      },
      choices = {
        { text = "What word do you say?", next = "rite_word" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rite_word = {
      big = true,
      lines = {
        { id = "rite_word_d", text = "Only that I see what was given, and that I will waste none of it. The words are plain, and I think the beast's spirit cares less for the words than for whether I keep to them." },
      },
      choices = {
        { text = "I will say it over my own kills.", next = "BACK", reply = "Then the plains will know you for one of their own, whatever land you were born in. Walk with the Earth Mother.", fx = { align = { light = 1 } } },
        { text = "A dead beast hears nothing. The skill is what matters.", next = "BACK", reply = "Perhaps it hears nothing. I have noticed, though, that those who do not say it are also the ones who leave the hide.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chaw = {
      lines = {
        { id = "chaw_d", text = "To Chaw Stronghide, who teaches the working of them. I take the hide from the beast and he makes it into something a brave can wear, and he will tell you his is the greater share of the labour." },
      },
      choices = {
        { text = "Is he right?", next = "chaw_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chaw_right = {
      lines = {
        { id = "chaw_right_d", text = "He is right about the labour. But he cannot put back what a bad skinner has cut away, so I say that mine is the share that must be done right the first time, and we leave it there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_d", text = "The kodo, for the sheer weight of the hide, which takes two of us and most of a day. For fine work it is the swoop, whose skin is thin as a leaf under the feathers and tears if you so much as breathe on it." },
      },
      choices = {
        { text = "I'll practise on wolves before I try a swoop.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = {
        { id = "left_d", text = "Most have, before they learn. The wolves and the swoops will not have let it go to waste, so the plains have forgiven you, and you need only do better at the next one." },
      },
      choices = {
        { text = "I will. Thank you, Yonn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_ven", text = "The Venture Company shoots the kodo and takes nothing, not even the hide. I have skinned what they left, so that it should not be for nothing." } },
    background = { { id = "tp_bg", text = "The Deepcuts have followed the hunters with a knife for longer than anyone remembers. It is quiet work, and it suits me." } },
    advice = { { id = "tp_ad", text = "Sharpen the knife before the hunt, and never after the kill. The beast should not have to wait on you." } },
    _none = { { id = "tp_none", text = "I do not know. I spend my days with those who can no longer speak, and I hear little news from them." } },
  },
}

---------------------------------------------------------------------------
-- Harn Longcast: fishing supplies vendor by the north bridge at Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "harn", id = TODO_NPC("Harn Longcast"), name = "Harn Longcast", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "unhurried", "droll" }, values = { "patience", "the lake" },
  notices = { "craft", "race", "kit" },
  impression = {
    first = "Harn Longcast sells fishing supplies by the north bridge at Bloodhoof Village and can be found there in all weathers, usually with a line in the water. He says he chose the spot for the customers, and the fish know otherwise.",
    third = "{name} met Harn Longcast, who sells fishing supplies by the bridge at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Walk softly on the bridge, friend, for the fish feel every hoof. There, now you may talk as loudly as you please." },
    { id = "g_back", when = { metBefore = true }, text = "Back to the bridge, are you? Tell me what you caught, and I will tell you what you ought to have used." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone. The lake has turned over once since then, and the big ones are sitting deep." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "That pole has seen water, and your thumb has a line scar on it. Sit down beside me, for you are the first sensible person across this bridge today." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young brave on the way north to the bluff. You will be in a hurry, as they all are, and the lake will still be here when you have finished with that." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, from the sea coast. Your people fish with spears and nets, I am told, and I should like to hear how a net is thrown." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Harn Longcast. Poles, line, lures and bait, sold from the best fishing spot on Stonebull Lake, which I found first and have no intention of giving up." },
        { id = "h_fisher", when = { profession = "Fishing" }, text = "I am Harn Longcast, and you fish, so I shall be honest with you. The shiny baubles are for the eager, and the plain lures catch as much, but an eager customer is a happy one." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Harn Longcast. Uthan Stillwater teaches the craft across the lake, and I sell what it needs, so between us we have ruined a good many promising warriors." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice easy, I have a nibble." },
        { id = "h_again2", text = "Go on, I am listening with one ear." },
        { id = "h_again3", text = "Hm?" },
      },
      choices = {
        { text = "Show me your fishing supplies.", next = "BUSINESS" },
        { text = "What swims in Stonebull Lake?", next = "lake" },
        { text = "You chose this bridge for the fishing, I think.", next = "bridge" },
        { text = "Tell me about Uthan Stillwater.", next = "uthan" },
        { text = "Do the gnolls trouble the lake?", next = "gnolls" },
        { text = "What bait are they taking this season?", next = "bait", when = { profession = "Fishing" } },
        { text = "On the coast we fish with nets.", next = "nets", when = { race = "Troll" } },
        { text = "Tight lines, Harn.", next = "END" },
      },
    },
    lake = {
      lines = {
        { id = "lake_d", text = "Brilliant smallfish near the banks, which a calf can catch with a bent pin, and longjaw mud snapper in the deeper water by the bridge posts. The snapper fight hard for their size, and they are the better eating." },
      },
      choices = {
        { text = "Is there anything larger down there?", next = "lake_big" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake_big = {
      lines = {
        { id = "lake_big_d", text = "There is one, under the third post, that has taken four of my lures and never shown me more than a shadow. I do not sell to anyone who says they mean to catch it, for that fish and I have an understanding." },
      },
      choices = {
        { text = "I'll leave your fish alone.", next = "BACK", fx = { affinity = 1 } },
        { text = "I think the fish is winning.", next = "BACK", reply = "It is, by four lures. I am a patient bull, and I mean to lose slowly.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge = {
      lines = {
        { id = "bridge_d", text = "You have a sharp eye. Every traveller bound for Thunder Bluff crosses here, so I tell the village it is good for trade, and the snapper happen to gather in the shade beneath." },
      },
      choices = {
        { text = "Does the village believe you?", next = "bridge_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge_believe = {
      big = true,
      lines = {
        { id = "bridge_believe_d", text = "Baine Bloodhoof asked me once whether I was a merchant who fished or a fisher who sold things. I said I would think on it and tell him, and that was two summers ago." },
      },
      choices = {
        { text = "A village needs those who sit and watch the water.", next = "BACK", reply = "I think so too. Somebody ought to be still while the rest are running, if only to notice which way they ran.", fx = { align = { light = 1 } } },
        { text = "With gnolls and goblins about, every bull should do more.", next = "BACK", reply = "Perhaps you are right. I feed a fair few of the braves who do the running, and I had counted that as my share.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uthan = {
      lines = {
        { id = "uthan_d", text = "He sits on the west bank and teaches anyone who asks, and he is the better fisher of the two of us, which I say only because he is too far off to hear. We wave to each other across the water at dawn." },
      },
      choices = {
        { text = "Do you ever fish side by side?", next = "uthan_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uthan_side = {
      lines = {
        { id = "uthan_side_d", text = "Once a year, at the first frost, and we do not speak a word from sunrise to sunset. It is the best day's talk I have all year." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = {
        { id = "gnolls_d", text = "The Palemanes come down to the south shore by night and take fish from the shallows with their hands. They are clumsy at it and they frighten the shoals, and I mind that more than the theft." },
      },
      choices = {
        { text = "Fish with their hands? I'd like to see it.", next = "BACK", reply = "It is mostly splashing and bad language. Stay well back if you go to look, for they dislike being watched.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = {
        { id = "bait_d", text = "The snapper want something that wriggles, early, before the sun is on the water. After midday they will look at nothing but a bright lure moved slowly, and they will make you wait for it." },
      },
      choices = {
        { text = "Early and wriggling. I'll be here at dawn.", next = "BACK", reply = "Then bring your own patch of bank, for this one is spoken for.", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nets = {
      lines = {
        { id = "nets_d", text = "So I have heard, and I cannot picture it. To take a whole shoal at one throw seems to me like eating a feast in one mouthful, though I suppose a village on the sea has more mouths than patience." },
      },
      choices = {
        { text = "A net feeds a whole village, mon.", next = "BACK", reply = "That is a fair answer, and I shall stop looking down my snout at it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_ven", text = "If the goblins' digging ever fouls the streams that feed this lake, I shall stop being a patient bull. So far the water runs clear." } },
    background = { { id = "tp_bg", text = "I have fished this lake since Bloodhoof was a ring of tents. The selling came later, when folk kept asking to borrow my line." } },
    advice = { { id = "tp_ad", text = "Cast past where you think the fish is, and bring the lure back through it. Nothing likes having its supper dropped on its head." } },
    _none = { { id = "tp_none", text = "News goes over this bridge at a trot and does not stop for me. Ask at the inn." } },
  },
}
