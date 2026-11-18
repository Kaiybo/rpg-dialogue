-- Barrens folk the roster scan found missing, part two: the orc children (Gruk, who fetches Guard Taruc's
-- bread on the Ratchet road, and Kranal Fiss's three, Karu, Okla and Trok, north of the Crossroads), and
-- four dwarves of Bael Modan who will talk to the Alliance: Captain Gerogg Hammertoe, Digger Flameforge,
-- Heggin Stonewhisker and Malgin Barleybrew. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Gruk: orc boy by the road to Ratchet; brings Guard Taruc his bread; making a spear.
P:NPC {
  key = "gruk_barrens", id = TODO_NPC("Gruk"), name = "Gruk", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "crossroads" }, temper = { "eager", "polite" }, values = { "duty" },
  notices = { "soldier" },
  impression = {
    first = "Gruk is an orc boy who runs bread out to Guard Taruc on the road east of the Crossroads and calls every grown orc 'sir'. He has half a spear under his arm, and he is very serious about the other half.",
    third = "{name} met Gruk, an orc boy who fetches bread for the guard on the Ratchet road.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {g:sir|ma'am}! I can't stop long, because Guard Taruc wants more bread and he gets loud when he's hungry." },
    { id = "g_war", when = { class = { "WARRIOR", "HUNTER" } }, text = "Is that a real weapon? Mine's only a stick so far, but it's going to be a spear when I find the right rock." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again, {g:sir|ma'am}! I remembered you, and I remembered the bread this time too." },
  },
  notice = {
    { id = "n_tauren", cat = "soldier", when = { race = "Tauren" },
      text = "You're really tall, {g:sir|ma'am}. Could you see the Crossroads from up there, if you stood on a rock?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gruk, and I bring Guard Taruc his food, because a guard can't leave his post and somebody has to. He says I'm the best bread-runner in the Barrens, though I think I'm the only one." } },
      again = {
        { id = "h_again", text = "Did you want to ask something else, {g:sir|ma'am}?" },
        { id = "h_again2", text = "I can talk a bit longer, but then I have to run." },
      },
      choices = {
        { text = "Tell me about your spear.", next = "spear" },
        { text = "Is Guard Taruc good to you?", next = "taruc" },
        { text = "Run along, Gruk.", next = "END" },
      },
    },
    spear = {
      lines = { { id = "s_default", text = "I've got the shaft, and I peeled it and everything, but it needs a sharp rock for the point. My friend Okla looks for rocks all day, so she said she'd keep the sharp ones for me and only keep the pretty ones for herself." } },
      choices = {
        { text = "What will you hunt with it?", next = "hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "h2_default", text = "A plainstrider first, because they're slow when they turn. Then when I'm big I'll be a guard like Taruc and stand on the road, and some other boy can bring me the bread." } },
      choices = { { text = "That's a good plan, Gruk.", next = "BACK", fx = { affinity = 1 } } },
    },
    taruc = {
      lines = { { id = "t_default", text = "He shouts 'more bread, boy' and then he says 'now scat', but he always says 'very good' in the middle. I think the middle bit is the one he means." } },
      choices = { { text = "I think so too. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live near the road and I carry the bread. That's all, {g:sir|ma'am}, but I do it every day." } },
    _none = { { id = "tp_none", text = "I don't know about that, {g:sir|ma'am}. Guard Taruc might, if you ask him after he's eaten." } },
  },
}

-- Karu: Kranal Fiss's elder daughter; cooks, feeds the pigs, minds Trok.
P:NPC {
  key = "karu", id = TODO_NPC("Karu"), name = "Karu", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "crossroads" }, temper = { "bossy", "caring" }, values = { "family", "chores" },
  notices = { "class" },
  impression = {
    first = "Karu is the eldest of Kranal Fiss's children, a young orc girl who cooks for the others and feeds the pigs when her brother forgets to. She gives orders like a small sergeant, and she means every one of them kindly.",
    third = "{name} met Karu, Kranal Fiss's daughter, who cooks and keeps her brother and sister in line.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Mind the pot, please, because it's hot and I'm not allowed to let strangers get burned." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "You're one of Papa's shaman, aren't you? He's up by the fire, and you should say hello properly, because he notices." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! Have you seen my brother Trok? He's supposed to be doing his chores." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Did you catch a plainstrider today? I roast them the way Papa showed me, and they're the best thing there is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Karu, and I do the cooking, since Papa is busy with the spirits and Trok would burn water. Okla helps a little, when she isn't off looking for rocks." } },
      again = {
        { id = "h_again", text = "What else? I have to stir this in a moment." },
        { id = "h_again2", text = "You can ask, but I'm watching the pot." },
      },
      choices = {
        { text = "What are you cooking?", next = "cook" },
        { text = "Your brother gives you trouble, I think.", next = "trok" },
        { text = "Keep the pot from burning, Karu.", next = "END" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Roasted plainstrider, which is my favourite, and there's enough for everybody if Trok comes when he's called. If he doesn't, I told him he can make his own food next time, and I meant it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trok = {
      lines = { { id = "t_default", text = "He was meant to feed the pigs this morning, and they were so hungry when I got there that they nearly ate the bucket. Then he came running past the house shouting about bees, like a frightened human, and wouldn't even stop for his dinner." } },
      choices = {
        { text = "What did he do to the bees?", next = "bees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bees = {
      lines = { { id = "b_default", text = "He won't say, so it was something silly. I'll help him get them off in the end, because he's my brother, but I think he should run a bit longer first." } },
      choices = { { text = "That seems fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Papa is Kranal Fiss, and he teaches shaman about fire. I mostly use fire for cooking, but he says that counts." } },
    _none = { { id = "tp_none", text = "I don't know that one. You should ask Papa, because he knows nearly everything." } },
  },
}

-- Okla: Kranal's younger daughter; collects pretty rocks for a necklace; Gruk's friend.
P:NPC {
  key = "okla", id = TODO_NPC("Okla"), name = "Okla", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "crossroads" }, temper = { "dreamy", "cheerful" }, values = { "pretty_things", "friends" },
  notices = { "craft" },
  impression = {
    first = "Okla is Kranal Fiss's younger daughter, a small orc girl with a bucket of stones and her eyes on the ground. She is gathering rocks for a necklace, and she weighs each one in her hand as gravely as a jeweller.",
    third = "{name} met Okla, Kranal Fiss's daughter, who collects pretty rocks to make a necklace.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Please don't step there, because I haven't looked at those rocks yet." },
    { id = "g_miner", when = { profession = "Mining" }, text = "You have a pick! Do you find shiny rocks with it, and do you ever have any left over?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! My bucket is heavier than last time, look." },
  },
  notice = {
    { id = "n_jewel", cat = "craft", when = { race = { "Dwarf", "Gnome" } },
      text = "Papa says your people live inside a mountain. Is it all pretty rocks in there, all the way through?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Okla, and I'm finding rocks to make a necklace. Papa says I can look as long as I don't stray too far from home, so I look very hard at the near ones." } },
      again = {
        { id = "h_again", text = "Do you want to know something else?" },
        { id = "h_again2", text = "You can ask while I look, I can do both." },
      },
      choices = {
        { text = "What makes a rock good enough?", next = "good" },
        { text = "Do you keep the sharp rocks too?", next = "gruk" },
        { text = "Happy hunting, Okla.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "It has to be colourful or shiny, and not too small, or it falls off the string. This red one is nice, but I only need a few more, so now I'm being picky." } },
      choices = {
        { text = "Who will wear the necklace?", next = "wear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wear = {
      lines = { { id = "w_default", text = "Me, of course! But if there are rocks left over I'll make a little one for Karu, because she cooks for us, and she never has anything pretty." } },
      choices = { { text = "She'd like that, I'm sure.", next = "BACK", fx = { affinity = 1 } } },
    },
    gruk = {
      lines = { { id = "gr_default", text = "That's for my friend Gruk, who lives over by the road. He's making a spear and he needs a point for it, and this one cut my thumb a bit, so I think it's sharp enough." } },
      choices = { { text = "Mind your thumb. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My papa is Kranal Fiss and my sister is Karu and my brother is Trok. I'm the littlest, so I get to look for rocks." } },
    _none = { { id = "tp_none", text = "I don't know. Is it about rocks? I know about rocks." } },
  },
}

-- Trok: Kranal's son; chased by a swarm of bees instead of doing his chores.
P:NPC {
  key = "trok", id = TODO_NPC("Trok"), name = "Trok", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "crossroads" }, temper = { "frantic", "sheepish" }, values = { "mischief" },
  notices = { "class" },
  impression = {
    first = "Trok is Kranal Fiss's son, a young orc who is running in wide circles around the homestead with a swarm of bees close behind him. He will stop to talk for exactly as long as the bees allow.",
    third = "{name} met Trok, Kranal Fiss's son, who was being chased by bees.",
  },
  greetings = {
    { id = "g_default", text = "Help! I can't stand still, because there are bees and they're all angry at me and they sting!" },
    { id = "g_mage", when = { class = { "MAGE", "SHAMAN" } }, text = "You know magic, don't you? Can you tell bees to go away, please, only without setting anything on fire?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you! They're still after me, and I'm so tired of running." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Hunters know about animals! Do you know about bees, because I need somebody who knows about bees right now." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Trok, and I'd say hello properly but I have to keep moving. I was only looking at their nest, and now the bees won't leave me alone." } },
      again = {
        { id = "h_again", text = "What? Ask quick, they're coming round again!" },
        { id = "h_again2", text = "I'm listening, but I'm also running." },
      },
      choices = {
        { text = "What did you do to the nest?", next = "nest" },
        { text = "Your sister says you skipped your chores.", next = "chores" },
        { text = "Keep running, Trok.", next = "END" },
      },
    },
    nest = {
      lines = { { id = "n_default", text = "Papa teaches shaman about fire, so I thought I'd see what the bees thought of a torch. I didn't know bees didn't like fire, and they really, really don't." } },
      choices = {
        { text = "Does your father know?", next = "papa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    papa = {
      lines = { { id = "p_default", text = "Not yet, and please don't tell him! He says fire answers to respect, and I don't think poking a nest with it counts as respect." } },
      choices = { { text = "It doesn't. Your secret's safe, though.", next = "BACK", fx = { affinity = 1 } } },
    },
    chores = {
      lines = { { id = "c_default", text = "I was going to feed the pigs, I was, right after the bees. Karu made food and I couldn't even stop to eat it, and now she's cross with me, and the bees are cross with me, and I've had a very bad day." } },
      choices = { { text = "Tomorrow, feed the pigs first. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Kranal Fiss's son, and I'm going to be a shaman too. I'm starting with fire, and it isn't going well." } },
    _none = { { id = "tp_none", text = "I don't know! I can't think about anything but bees!" } },
  },
}

-- Captain Gerogg Hammertoe: captain of the guard, upper floor of Bael'dun Keep.
P:NPC {
  key = "gerogg_hammertoe", id = TODO_NPC("Captain Gerogg Hammertoe"), name = "Captain Gerogg Hammertoe", title = "Bael'dun Captain of the Guard", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "bael_modan" }, temper = { "stern", "weary" }, values = { "duty", "clan" },
  notices = { "soldier" },
  impression = {
    first = "Captain Gerogg Hammertoe commands the guard of Bael'dun Keep from its upper floor, where he can see the whole dig and every road leading to it. He has the look of a dwarf who has been under siege so long he's stopped calling it one.",
    third = "{name} met Captain Gerogg Hammertoe, who commands the guard at Bael'dun Keep.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}. Ye came through my gate without an arrow in ye, so my lads have already judged ye a friend, and I'll take their word for it." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A face from home, by the forge! Tell me there's still snow on Dun Morogh, {g:lad|lass}, for I've nearly forgotten what cold feels like." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. The road from Theramore's no kinder than it was, I'd wager." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye carry yerself like one who's stood a wall before. I've a great deal of wall and too few to stand on it, if ye've an hour." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Captain Gerogg Hammertoe, Bael'dun guard. The Explorers' League digs and I keep the diggers alive, which is a harder job than anyone in Ironforge imagined when they sent us out here." } },
      again = {
        { id = "h_again", text = "What else, {class}? I've a watch to change." },
        { id = "h_again2", text = "Speak up, and keep it short." },
      },
      choices = {
        { text = "Who attacks the keep?", next = "attack" },
        { text = "How many guards do you have?", next = "guards" },
        { text = "What news would you have from Ironforge?", next = "home", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Hold the wall, Captain.", next = "END" },
      },
    },
    attack = {
      lines = { { id = "a_default", text = "The tauren, when their blood's up, and Horde raiding parties out of that camp to the north-west when it isn't. They say we're digging in sacred ground, and I'll not pretend I cannae see why they're sore about it." } },
      choices = {
        { text = "You sound as if you half agree with them.", next = "agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    agree = {
      lines = { { id = "ag_default", text = "I'm a soldier and nae a prospector, and I wasn't asked where to dig. There was blood spilled here early on that should never have been, on both sides, and now every tauren in the Barrens knows the name Bael Modan and spits when he says it." } },
      choices = { { text = "That's a heavy thing to guard. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    guards = {
      lines = { { id = "g2_default", text = "Fewer than I landed with, and not a one of them has slept a full night since. General Twinbraid holds the command, and he's a hard dwarf with a hard grudge, so we'll be here as long as there's powder." } },
      choices = { { text = "Something else, Captain.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Whether King Magni remembers he's got dwarves on this side of the sea, to begin with. A cask of proper Thunderbrew would do as much for this garrison as a company of riflemen, and I'm only half joking." } },
      choices = { { text = "He remembers. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Thirty years in the Ironforge guard, and they give me a keep in a desert for my trouble. I've held worse, mind, though none hotter." } },
    explorers_league = { { id = "tp_el", text = "The League finds the holes and the guard stands round them. It's been that way since before my beard came in." } },
    _none = { { id = "tp_none", text = "I cannae tell ye, {class}. If it does not come over my wall, I've not had the time to learn of it." } },
  },
}

-- Digger Flameforge: excavation specialist, in a tent at the Bael Modan dig.
P:NPC {
  key = "digger_flameforge", id = TODO_NPC("Digger Flameforge"), name = "Digger Flameforge", title = "Excavation Specialist", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "bael_modan" }, temper = { "keen", "single_minded" }, values = { "discovery", "stone" },
  notices = { "craft" },
  impression = {
    first = "Digger Flameforge works out of a tent at the Bael Modan excavation, with rock dust in his beard and a brush behind his ear. He talks about strata the way other dwarves talk about ale, and he barely hears the gunfire from the keep.",
    third = "{name} met Digger Flameforge, the excavation specialist at the Bael Modan dig.",
  },
  greetings = {
    { id = "g_default", text = "Mind the string lines, {class}! Every one of them marks a layer, and if ye kick one I'll have to measure the whole trench again." },
    { id = "g_miner", when = { profession = "Mining" }, text = "Ah, ye know yer way round a pick, I can tell by yer hands. Come and look at this seam, then, and tell me I'm not seeing things." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, and we're a full hand's breadth deeper than when ye left. That's fast work, for careful work." },
  },
  notice = {
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf who's not with the League? Ye should sign on, {g:lad|lass}, for there's more of our own story under this dirt than in every book in Ironforge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "They call me Digger, and I'll answer to it. I'm the one who decides where the League's picks go in at Bael Modan and, more to the point, where they stop.", fx = { learn = { "explorers_league" } } } },
      again = {
        { id = "h_again", text = "Aye, what else? Ask while I sift." },
        { id = "h_again2", text = "Go on, I can talk and brush." },
      },
      choices = {
        { text = "What are you digging for?", next = "what" },
        { text = "Where do the picks stop?", next = "stop" },
        { text = "What does the stone look like, down there?", next = "seam", when = { profession = "Mining" } },
        { text = "Good digging, Flameforge.", next = "END" },
      },
    },
    what = {
      lines = { { id = "w_default", text = "Answers, same as at Uldaman. The League's found signs that the dwarves were made, not born, by the titans who shaped this world, and wherever there's old worked stone under the ground we mean to read it." } },
      choices = {
        { text = "And have you found worked stone here?", next = "found" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "Fragments, and they're older than anything the tauren or the quilboar ever made. I'll not say more till I've a whole piece to show, for I've seen good diggers laughed out of the Hall of Explorers for boasting on a potsherd." } },
      choices = { { text = "I hope you find a whole one. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stop = {
      lines = { { id = "s_default", text = "Wherever there's something that powder would ruin, which is a fight I have with the blasting crews every morning. They'd have the whole hill down by supper, and then we'd be sieving titan relics out of gravel for a hundred years." } },
      choices = { { text = "Something else, Digger.", next = "BACK" } },
    },
    seam = {
      lines = { { id = "se_default", text = "Red sandstone on top, then a band of pale rock that has no business being this far south. Under that there's something dense that rings like a bell when ye tap it, and that's the layer that keeps me up at night." } },
      choices = { { text = "I'd lose sleep over it too. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I dug at Loch Modan before this, and in the Badlands before that. I've spent more of my life below ground than above it, and I've no regrets." } },
    explorers_league = { { id = "tp_el", text = "Best outfit a curious dwarf could join. We dig up the past, and we argue about it afterwards over a pint." } },
    _none = { { id = "tp_none", text = "That's above ground, {class}, so I've not paid it any mind." } },
  },
}

-- Heggin Stonewhisker: Bael'dun chief engineer; the crane and the flying machine tower.
P:NPC {
  key = "heggin_stonewhisker", id = TODO_NPC("Heggin Stonewhisker"), name = "Heggin Stonewhisker", title = "Bael'dun Chief Engineer", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "bael_modan" }, temper = { "harried", "proud" }, values = { "machines", "thrift" },
  notices = { "craft" },
  impression = {
    first = "Heggin Stonewhisker is the chief engineer of Bael'dun, forever walking between the great crane over the dig and the tower where the flying machines land. He carries a spanner in each hand, and he complains that the sand gets into everything.",
    third = "{name} met Heggin Stonewhisker, the chief engineer who keeps Bael Modan's crane and flying machines working.",
  },
  greetings = {
    { id = "g_default", text = "Stand clear of the hoist, {class}! She's lifting four tons of rock on a chain I've mended twice this week." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "Is that grease under yer nails? Thank the forge, somebody who'll understand me when I complain." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. The crane's still standing, before ye ask, and no thanks to the sand." },
  },
  notice = {
    { id = "n_gnome", cat = "craft", when = { race = "Gnome" },
      text = "A gnome! I'd give a month's ale for one of yer folk on my crew. Half these gauges are Gnomeregan-made, and I'm only guessing at what they read." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Heggin Stonewhisker, chief engineer, which means everything that breaks in Bael'dun is my fault by sundown. I keep the crane lifting and the flying machines flying, and I do it with whatever parts the last supply flight remembered to bring." } },
      again = {
        { id = "h_again", text = "Aye, what else? Talk while I tighten this." },
        { id = "h_again2", text = "Go on, but mind the chain." },
      },
      choices = {
        { text = "What breaks most often?", next = "breaks" },
        { text = "Flying machines, out here?", next = "fly" },
        { text = "What would you ask an engineer to bring you?", next = "parts", when = { profession = "Engineering" } },
        { text = "Keep her lifting, Heggin.", next = "END" },
      },
    },
    breaks = {
      lines = { { id = "b_default", text = "Anything with a bearing in it. This red sand's as fine as flour and it gets past every seal I've ever fitted, so I strip the hoist gears every third day and curse the Barrens while I do it." } },
      choices = {
        { text = "And when the Horde raids?", next = "raid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid = {
      lines = { { id = "r_default", text = "Then I've arrows in my boiler cladding on top of the sand, and the guard want the crane swung round to drop rock on someone. I've told Captain Hammertoe she's a hoist and not a catapult, though I'll admit I've thought about it." } },
      choices = { { text = "It's a tempting thought. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fly = {
      lines = { { id = "f_default", text = "They're how we get powder and post without marching it through the whole of the Horde's back garden. A flying machine's a temperamental beast at the best of times, and the heat coming off these rocks tosses them about like leaves." } },
      choices = { { text = "Something else, Heggin.", next = "BACK" } },
    },
    parts = {
      lines = { { id = "p_default", text = "Copper tubing, bronze fittings, and any sort of sealed bearing ye can lay hands on. I'd not turn away a decent wrench either, for mine have a way of walking off with the digging crews." } },
      choices = { { text = "Every crew is the same. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I built siege engines for Ironforge once. Now I mend a crane in a desert, and I'm not sure which of the two has killed more of my patience." } },
    explorers_league = { { id = "tp_el", text = "The League points at a hill and says 'lift that'. I'm the one who has to work out how." } },
    _none = { { id = "tp_none", text = "If it has not got gears, {class}, I cannae help ye with it." } },
  },
}

-- Malgin Barleybrew: Bael'dun morale officer, behind the bar at Bael Modan; sells drink.
P:NPC {
  key = "malgin_barleybrew", id = TODO_NPC("Malgin Barleybrew"), name = "Malgin Barleybrew", title = "Bael'dun Morale Officer", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "bael_modan" }, temper = { "jolly", "shrewd" }, values = { "ale", "fellowship" },
  notices = { "drink" },
  impression = {
    first = "Malgin Barleybrew stands behind a bar at Bael Modan with the title of Morale Officer, which he insists is a real rank. He pours for the diggers and the guard alike, and he listens to all of them, which may be the larger half of the job.",
    third = "{name} met Malgin Barleybrew, the morale officer who keeps the bar at Bael Modan.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the only proper bar between here and Theramore, {class}! Pull up a keg and tell me what the road's done to ye." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A {g:kinsman|kinswoman}, by my beard! Sit down, sit down, and tell me what they're pouring in Ironforge these days." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I kept yer stool warm, by which I mean nobody else wanted it." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've started without me, I see. That's the spirit, though ye might sit down before the floor comes up to meet ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Malgin Barleybrew, Morale Officer, and aye, it's a real commission with a seal on it. A dig this far from home runs on powder and ale, and the General's wise enough to know which of the two runs out first." } },
      again = {
        { id = "h_again", text = "What else can I tell ye? The night's young, or the day is, I've lost track." },
        { id = "h_again2", text = "Go on, I'm a grand listener. It's most of the job." },
      },
      choices = {
        { text = "How is morale, Morale Officer?", next = "morale" },
        { text = "Barleybrew is a brewing name.", next = "name" },
        { text = "What would a dwarf drink, this far from home?", next = "drink", when = { race = "Dwarf" } },
        { text = "Keep them cheerful, Malgin.", next = "END" },
      },
    },
    morale = {
      lines = { { id = "m_default", text = "Holding, like a barrel hoop with one rivet gone. The diggers are happy as long as they're finding things, but the guard have been shot at for months, and there's nae a brew strong enough to make a dwarf forget that entirely." } },
      choices = {
        { text = "What do they tell you, over a pint?", next = "tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "That they miss the snow, mostly, and that they're not certain the hole's worth what it's costing. I pour another and say the League knows its business, and I hope by the stone that I'm telling them the truth." } },
      choices = { { text = "You carry more than the kegs, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "It is, and there's a whole clan of us scattered about with taps in our hands. I'm the only Barleybrew daft enough to set up in a desert, and my kin write to remind me of it every winter." } },
      choices = { { text = "Something else, Malgin.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "d_default", text = "Whatever came on the last flight, and be grateful for it. I've a wee keg of the real Dun Morogh stout set by for the day the dig strikes something grand, and half the camp digs harder for knowing it's there." } },
      choices = { { text = "That's morale, right enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born with a tap in my hand, like every Barleybrew. I followed the League out here because diggers are the thirstiest folk alive." } },
    explorers_league = { { id = "tp_el", text = "Fine dwarves, the League, and terrible at paying their tab. I keep a slate as long as my arm." } },
    _none = { { id = "tp_none", text = "Nae a word of that's come across my bar, {class}, and most things do in the end." } },
  },
}
