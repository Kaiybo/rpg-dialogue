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
        { text = "Where are your mother and father?", next = "yfolk" },
        { text = "What's the road like?", next = "yroad" },
        { text = "Are you ever scared out here?", next = "yscared" },
        { text = "Will you be a warrior or a guard?", next = "yguard" },
        { text = "Did Taruc tell you about the camps?", next = "yorc", when = { race = "Orc" } },
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
    yfolk = {
      lines = {
        { id = "yyfolk_d", text = "My father is a grunt at the Crossroads and my mother makes bread, which is why I carry it. She says if I don't come back by dark she'll come looking with a rolling pin, and that's scarier than centaur." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yroad = {
      lines = {
        { id = "yyroad_v0", when = { race = "Goblin" }, text = "Long and hot, with goblin carts like yours, {g:sir|ma'am}. There's a big ogre who walks with one, and he waved at me once. I waved back from very far away." },
        { id = "yyroad_d", text = "Long and hot and full of plainstriders, and sometimes goblins with carts. A big ogre walks with one of the carts, and he waved at me once. I waved back, but from very far away." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yscared = {
      lines = {
        { id = "yyscared_d", text = "Only of the quilboar, a little, because they grunt in the grass. Guard Taruc says a good warrior is scared but goes anyway. So I'm scared, and I go anyway, and I run fast." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yguard = {
      lines = {
        { id = "yyguard_d", text = "A guard, like Taruc, because guards keep people safe. My friend Okla says warriors get more songs. But I think somebody has to stand still and watch, or the songs would all be sad ones." },
      },
      choices = {
        { text = "A guard is the bravest thing to be.", next = "BACK", reply = "I knew it! I'm going to tell Okla.", fx = { align = { order = 1 } } },
        { text = "Go and be a warrior. Find your own glory.", next = "BACK", reply = "Maybe, when I'm big. But I'd miss the bread.", fx = { align = { order = -1 } } },
      },
    },
    yorc = {
      lines = {
        { id = "yyorc_d", text = "You're an orc too! Did you grow up in the camps, like Taruc did? He doesn't like talking about it, but he says that's why he stands on the road, so nobody has to go back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    okla = { { id = "ytp_okla", text = "Okla is my friend. She finds rocks, and she's going to find me a sharp one." } },
    crossroads = { { id = "ytp_crossroads", text = "The Crossroads is where I live. It has a well, and a tower, and lots of guards." } },
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
        { text = "Where is your mother, Karu?", next = "ymama" },
        { text = "Do you want to be a shaman like your papa?", next = "yshaman" },
        { text = "Is it scary living out here?", next = "yscary" },
        { text = "Who taught you to cook?", next = "yteach" },
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
    ymama = {
      lines = {
        { id = "yymama_d", text = "Mama went to the ancestors when Trok was small. Papa says she's in the fire when he talks to it, so I keep the cooking fire going even when nobody's hungry." },
      },
      choices = {
        { text = "I'm sorry, Karu.", next = "BACK", reply = "That's all right. She liked plainstrider too, Papa says." },
      },
    },
    yshaman = {
      lines = {
        { id = "yyshaman_d", text = "Papa says I've got the patience for it, and Trok doesn't. But I like cooking, and fire is good for both, so maybe I'll be a cooking shaman. Is that a thing?" },
      },
      choices = {
        { text = "It is if you make it one.", next = "BACK", reply = "That's what I think too!", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscary = {
      lines = {
        { id = "yyscary_d", text = "Sometimes, when the centaur ride past at night. Papa says we're safe because the spirits watch us, and Trok says he'll fight them with a stick. I think we should all go and live at the Crossroads." },
      },
      choices = {
        { text = "Your papa's right. Stay and trust the spirits.", next = "BACK", reply = "Okay. I'll try to be brave, like him.", fx = { align = { light = 1 } } },
        { text = "You're right. Walls are safer than spirits.", next = "BACK", reply = "I'll tell Papa you said so! He won't listen, but I'll tell him.", fx = { align = { light = -1 } } },
      },
    },
    yteach = {
      lines = {
        { id = "yyteach_v0", when = { profession = "Cooking" }, text = "Papa, and then a lot of burned dinners. You cook too? Then you know you have to turn it before it smells funny, not after." },
        { id = "yyteach_d", text = "Papa did, a little, and then I just kept burning things until they stopped being burned. Okla says I'm the best cook in the Barrens, but Okla eats rocks sometimes, so I don't know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    plainstrider = { { id = "ytp_plainstrider", text = "Plainstrider is best roasted slow, with the fat dripping. Papa says I'm a better cook than Mama was, but I don't believe him." } },
    trok = { { id = "ytp_trok", text = "Trok is my little brother. He's silly, but he's brave when it matters." } },
    okla = { { id = "ytp_okla", text = "Okla finds rocks. She found one that looks like Papa's face, and she keeps it under her pillow." } },
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
        { text = "What's your favourite rock?", next = "yfav" },
        { text = "Do you ever go far from home?", next = "yfar" },
        { text = "Is Trok nice to you?", next = "ytrok" },
        { text = "Can I give you a rock?", next = "ygift", when = { profession = "Mining" } },
        { text = "Happy hunting, Okla.", next = "END" },
      },
    },
    good = {
      lines = { { id = "good_default", text = "It has to be colourful or shiny, and not too small, or it falls off the string. This red one is nice, but I only need a few more, so now I'm being picky." } },
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
    yfav = {
      lines = {
        { id = "yyfav_d", text = "This one! It's blue and it has a little gold line through it, like a river. Papa says it's just copper, but I think it's a piece of the sky that fell down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfar = {
      lines = {
        { id = "yyfar_d", text = "Once I went all the way to the big rocks over there, and I found a bone. Papa was very cross, and he said the harpies would carry me off. I didn't see any harpies." },
      },
      choices = {
        { text = "Your papa's right. Stay close to home.", next = "BACK", reply = "All right. But I'm keeping the bone.", fx = { align = { order = 1 } } },
        { text = "Exploring is brave. Just be careful.", next = "BACK", reply = "I'm always careful! Mostly careful.", fx = { align = { order = -1 } } },
      },
    },
    ytrok = {
      lines = {
        { id = "yytrok_d", text = "He chased me with a beetle once, but he gave me his biggest rock on my naming day. So he's mostly nice. Right now he's being chased himself, so I'm not helping." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygift = {
      lines = {
        { id = "yygift_d", text = "A real one, from inside the ground? Oh, it's so heavy! I'm going to put it right in the middle of the necklace, where everybody will see it first." },
      },
      choices = {
        { text = "Wear it well, Okla.", next = "BACK", reply = "I will! I'll tell everyone a miner gave it to me.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    papa = { { id = "ytp_papa", text = "Papa talks to fire. I talk to rocks. They don't talk back, but they listen." } },
    necklace = { { id = "ytp_necklace", text = "My necklace has seven rocks now. I need about a hundred more." } },
    karu = { { id = "ytp_karu", text = "Karu is the best cook. She doesn't let me help with the fire, though." } },
    gruk = { { id = "ytp_gruk", text = "Gruk is my friend by the road. He's going to be a guard someday." } },
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
        { text = "How long have the bees been chasing you?", next = "ylong" },
        { text = "What would you do if you were a real shaman?", next = "yshaman" },
        { text = "Will you say sorry to the bees?", next = "ysorry" },
        { text = "I'll help you with the bees.", next = "yhelp" },
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
    ylong = {
      lines = {
        { id = "yylong_d", text = "Since breakfast! And breakfast was ages ago. I've run past the pigs four times, and the pigs think it's a game now. They're not helping." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yshaman = {
      lines = {
        { id = "yyshaman_d", text = "I'd ask the wind to blow the bees away, and ask the earth to swallow the nest, and ask the fire to cook me a plainstrider, all at once. Papa says that's not how you ask. He says you ask one at a time, nicely." },
      },
      choices = {
        { text = "Your papa is right. Respect the spirits.", next = "BACK", reply = "Yes, all right, I'll try. When the bees stop.", fx = { align = { light = 1 } } },
        { text = "Command them. Show them who's in charge.", next = "BACK", reply = "That's what I did with the bees! It didn't work.", fx = { align = { light = -1 } } },
      },
    },
    ysorry = {
      lines = {
        { id = "yysorry_d", text = "I'll try, but I don't know how you say sorry to bees. Do you buzz? Karu says you leave them flowers, but I think they'd sting the flowers too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhelp = {
      lines = {
        { id = "yyhelp_v0", when = { class = "HUNTER" }, text = "You know about animals! If you stand still and wave your arms, they might chase you instead, and then I can eat. That's a hunter thing, isn't it?" },
        { id = "yyhelp_d", text = "You'll help? Really? If you stand still and wave your arms, they might chase you instead of me, and then I can eat lunch. That's a good plan, isn't it?" },
      },
      choices = {
        { text = "I'll try it, Trok.", next = "BACK", reply = "Thank you! I'll save you some plainstrider. Maybe.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    pigs = { { id = "ytp_pigs", text = "The pigs are hungry. They're always hungry. I'm sorry, pigs." } },
    karu = { { id = "ytp_karu", text = "Karu's my big sister. She's cross with me right now, and she's usually right." } },
    bees = { { id = "ytp_bees", text = "They are very small and very angry. I have learned my lesson." } },
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
        { text = "What happened when the dig first opened?", next = "yblood" },
        { text = "What do you make of General Twinbraid?", next = "ygeneral" },
        { text = "Would you ever retreat from Bael'dun?", next = "yretreat" },
        { text = "I'll stand on your wall for an hour.", next = "ywall", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
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
    yblood = {
      lines = {
        { id = "yyblood_d", text = "The tauren came to talk, and somebody on our side fired before they'd said a word. I'll nae name him, for he's dead now, and the tauren have answered every day since in their own way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygeneral = {
      lines = {
        { id = "yygeneral_d", text = "Twinbraid's a hard dwarf, and he'll hold the dig whatever it costs, for he's been told to. I respect him. I'd nae want to be him, and I'm nae sure he wants to be him either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yretreat = {
      lines = {
        { id = "yyretreat_d", text = "If the order came, aye, and I'd march my lads out wi' their heads high. But it won't, nae while there's a stone left to lift. So we hold, and some nights I wonder whose sake we hold it for." },
      },
      choices = {
        { text = "Hold it. Ironforge's orders are your duty.", next = "BACK", reply = "Aye, that's what the oath says, and I took it freely.", fx = { align = { order = 1 } } },
        { text = "Your soldiers' lives matter more than the dig.", next = "BACK", reply = "Say that to the General and ye'll be on the next boat home. I'll nae stop ye, mind.", fx = { align = { order = -1 } } },
      },
    },
    ywall = {
      lines = {
        { id = "yywall_d", text = "Bring a crossbow, stand where my sergeant tells ye, and dinnae shoot at anything until it's shooting at ye. That's the whole of my wisdom, and it's kept me alive thirty years." },
      },
      choices = {
        { text = "I'll stand a watch.", next = "BACK", reply = "Good. Tell the sergeant Gerogg sent ye.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    camp_taurajo = { { id = "ytp_camp_taurajo", text = "Taurajo's a big camp and a proud one. Their braves ride out past my wall every week." } },
    ironforge = { { id = "ytp_ironforge", text = "I'd trade this whole keep for a single night of Dun Morogh snow." } },
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
        { text = "Do the tauren mind you digging here?", next = "ytauren" },
        { text = "What's the oddest find so far?", next = "yodd" },
        { text = "Who are you sending reports to?", next = "yreport" },
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
    ytauren = {
      lines = {
        { id = "yytauren_v0", when = { race = "Tauren" }, text = "Ye'd know better than me, friend. Yer folk call this ground sacred, and I'd rather we'd asked first. Nobody in Ironforge thought to." },
        { id = "yytauren_d", text = "They mind it a great deal, and I'll nae pretend otherwise. To them it's sacred ground, Bael Modan, and the old keep sits on their burial hills by some accounts. I'd rather we'd asked first." },
      },
      choices = {
        { text = "Why didn't anyone ask?", next = "yask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yask = {
      lines = {
        { id = "yyask_d", text = "Because the League answers to Ironforge, and Ironforge answers to the past, nae to the folk standing on top of it. That's my own grumble, mind. The General would call it treason over supper." },
      },
      choices = {
        { text = "Knowledge matters. Dig, and share what you find.", next = "BACK", reply = "That's the League's creed, and I'll drink to it. Gladly.", fx = { align = { order = 1 } } },
        { text = "The tauren's land is theirs. You should leave.", next = "BACK", reply = "Ye may be right, and that's the bit that keeps me awake.", fx = { align = { order = -1 } } },
      },
    },
    yodd = {
      narr = "He glances toward his tent before he answers, as if to check it is still there.",
      lines = {
        { id = "yyodd_d", text = "A bronze disc wi' marks on it like a star chart, only none of the stars sit where they ought to. I've it wrapped in wool under my cot, and I talk to it some nights, which I'd thank ye not to repeat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yreport = {
      lines = {
        { id = "yyreport_d", text = "To the Hall of Explorers, by gryphon to Theramore and then by ship. By the time Ironforge reads my notes, I've dug three feet past whatever I wrote about. Ye'd think they'd learn to send questions sooner." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    uldaman = { { id = "ytp_uldaman", text = "Uldaman's where the League first found the titan works. Bael Modan might be another such place, if we're lucky and careful." } },
    bael_modan = { { id = "ytp_bael_modan", text = "The name's older than any dwarf here. I'd give my brush to know who gave it." } },
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
        { text = "What's your best invention?", next = "ybest" },
        { text = "Do you trust the flying machines?", next = "ytrust" },
        { text = "What would you build with unlimited resources?", next = "ydream" },
        { text = "You built siege engines once?", next = "ysiege" },
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
    ybest = {
      lines = {
        { id = "yybest_d", text = "The counterweight on that crane, though nobody notices it, which is how ye know it's good. When the chain snapped in the spring, the weight held the load clear, and nae a single digger was under it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrust = {
      lines = {
        { id = "yytrust_v0", when = { race = "Gnome" }, text = "Gnome-built, most of them, so aye, I trust them a little more than my own work. Dinnae tell anyone I said so, for I'll deny it." },
        { id = "yytrust_d", text = "I trust them as far as I've tightened them myself. The pilots are brave lads and a bit daft, and they fly over Horde camps at a height I'd call foolish and they'd call scenic." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydream = {
      lines = {
        { id = "yydream_d", text = "A steam-driven digger that'd do the work of forty dwarves and never once complain about the sand. The diggers would hate it, of course, for it'd put half of them on the boat home." },
      },
      choices = {
        { text = "Progress is worth it. Build the machine.", next = "BACK", reply = "Spoken like an engineer! I'll sketch it tonight and pretend it's a joke tomorrow.", fx = { align = { order = -1 } } },
        { text = "Keep the diggers. Folk need honest work.", next = "BACK", reply = "Aye, there's that. I'd nae want to be the one who sent them home.", fx = { align = { order = 1 } } },
      },
    },
    ysiege = {
      lines = {
        { id = "yysiege_d", text = "Rams, catapults and a cannon so heavy we needed three teams of rams to drag it. It flattened a wall in Grim Batol in the Second War, and I sometimes wish I'd stuck to cranes all along." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "ytp_gnomeregan", text = "A tragedy. Half my best tools came out of Gnomeregan, and now nobody's making any more." } },
    crane = { { id = "ytp_crane", text = "The crane's my pride, my curse and my only friend in this sand." } },
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
        { text = "What's the strongest thing you pour?", next = "ystrong" },
        { text = "Has anyone tried to steal your stock?", next = "ysteal" },
        { text = "Do the guard drink on duty?", next = "yduty" },
        { text = "What happens when the dig is done?", next = "ydig" },
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
    ystrong = {
      lines = {
        { id = "yystrong_d", text = "A thing I call Bael'dun Thunder, brewed from Barrens grain and a wee touch of desperation. One mug and ye forget the heat, two and ye forget yer name, three and the officer forgets to dock yer pay." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysteal = {
      lines = {
        { id = "yysteal_d", text = "A Razormane boar crawled under the tent one night and got his snout into a cask of stout. He was so drunk the guard caught him singin'. We let him go in the morning. Seemed unsporting to do otherwise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yduty = {
      lines = {
        { id = "yyduty_d", text = "Some do, and I pour them small and water it, though I'll deny that to my grave. Captain Hammertoe says I'm a menace, and I say a sober guard is a frightened guard." },
      },
      choices = {
        { text = "Watering their drinks is honest work. Keep doing it.", next = "BACK", reply = "Thank ye! A Morale Officer's got to be a bit of a mother too.", fx = { align = { order = 1 } } },
        { text = "Let them drink as they like. They've earned it.", next = "BACK", reply = "Ha, ye'd be every guard's favourite and the captain's worst nightmare.", fx = { align = { order = -1 } } },
      },
    },
    ydig = {
      lines = {
        { id = "yydig_v0", when = { race = "Dwarf" }, text = "When the League finds what it's after, I'll crack the Dun Morogh keg for every dwarf here, and ye'll have the first mug, {g:kinsman|kinswoman}." },
        { id = "yydig_d", text = "When the League finds what it's lookin' for, I'll crack the Dun Morogh keg and pour every dwarf a mug. If it's nothin', I'll crack it anyway, for they'll need it worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thunderbrew = { { id = "ytp_thunderbrew", text = "The Thunderbrews are cousins of a sort, and rivals of every other sort." } },
    bael_modan = { { id = "ytp_bael_modan", text = "Bael Modan's a dry dig, which is why I'm here. Somebody has to wet it." } },
    background = { { id = "tp_bg", text = "Born with a tap in my hand, like every Barleybrew. I followed the League out here because diggers are the thirstiest folk alive." } },
    explorers_league = { { id = "tp_el", text = "Fine dwarves, the League, and terrible at paying their tab. I keep a slate as long as my arm." } },
    _none = { { id = "tp_none", text = "Nae a word of that's come across my bar, {class}, and most things do in the end." } },
  },
}
