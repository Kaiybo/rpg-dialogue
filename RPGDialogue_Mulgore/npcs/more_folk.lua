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
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers! Do they have bread up in the sky? You look like you've never had a proper loaf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Moodan Sungrain, baker to every young brave, hunter and shaman who comes through Camp Narache. Nobody leaves this mesa hungry, not while I have flour." },
      },
      again = {
        { id = "h_again", text = "What else? Eat while you think." },
        { id = "h_again2", text = "Ask away. The bread's still warm." },
      },
      choices = {
        { text = "Let me buy some bread and water.", next = "BUSINESS" },
        { text = "You feed everyone on the mesa?", next = "feed" },
        { text = "What's it like, watching the young ones leave?", next = "leave" },
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
  },
  topics = {
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
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Carry a shield until you've earned the right not to, and come to me when it needs straightening." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Harant Ironbrace. I sell armour and shields to the braves of Bloodhoof, and to anyone else who would rather be dented than dead." },
      },
      again = {
        { id = "h_again", text = "What else? I've straps to stitch." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What do the dents tell you?", next = "dents" },
        { text = "Why so many shields?", next = "shields" },
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
  },
  topics = {
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
  },
  notice = {
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
        { id = "h_again", text = "What else? Speak softly." },
        { id = "h_again2", text = "Ask, ask. The fish have all day, and so do I." },
      },
      choices = {
        { text = "Teach me fishing.", next = "BUSINESS" },
        { text = "What lives in Stonebull Lake?", next = "lake" },
        { text = "You never seem to hurry.", next = "patience" },
        { text = "Why would a camp need a fish bowl?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Fishing") } },
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
  },
  topics = {
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
  },
  notice = {
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
      },
      again = {
        { id = "h_again", text = "What else would you know? I am glad to talk." },
        { id = "h_again2", text = "Ask. The elements are patient, and so am I." },
      },
      choices = {
        { text = "What is the Earthen Ring?", next = "ring" },
        { text = "Why are you here among the Windshapers?", next = "windshapers" },
        { text = "Can wounded land truly be healed?", next = "heal" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a shaman of the Earthen Ring, younger than most, and stubborner than some." } },
    _none = { { id = "tp_none", text = "I don't know. The elements have not spoken to me of that." } },
  },
}
