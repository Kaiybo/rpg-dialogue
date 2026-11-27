-- Redridge folk with no conversation yet: Bernard Brubaker, who sells leather armour from a hill
-- east of Stonewatch Falls.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bernard Brubaker: leather armor merchant on the hill east of Stonewatch Falls.
P:NPC {
  key = "rr_bernard_brubaker", id = TODO_NPC("Bernard Brubaker"), name = "Bernard Brubaker", title = "Leather Armor Merchant", gender = "male",
  role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "gruff", "wry" }, values = { "practical", "brave" },
  notices = { "kit", "craft" },
  impression = {
    first = "He sells armour on a hill nobody sane would camp on.",
    third = "{name} met Bernard Brubaker, who sells leather armour on a hill east of Stonewatch Falls.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Customer! Well, a friend, really; come up, keep low, and let's see how my leathers have held on you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Prices are what they are, and the gnolls' rocks don't care who you are either. Buy, and get down off my hill." },
    { id = "g_default", text = "Customer! Come up, come up, and keep your head down, because the gnolls throw rocks at anything that moves on this hill." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. That's a fine advertisement for my leathers, that is." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather yourself, I can tell from your fingers. Then you'll know good stitching when you see it, so look closely." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's seen better days, friend, and so have you. Buy something before the next gnoll finishes the job." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bernard Brubaker, leather armour for the bold and the unlucky. I set up out here because nobody fights the Redridge gnolls in their Sunday best, and they all come past this hill sooner or later." } },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've a rock-thrower to watch." },
        { id = "h_again2", text = "Go on, ask, but keep an eye on the ridge for me." },
      },
      choices = {
        { text = "A merchant should say plainly what his armor can't stop.", next = "BACK", reply = "Aye, and mine can't stop a Blackrock axe, so I say so. Gnoll rocks, though, it handles fine.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Up here, folk fleeing gnolls would buy any rag you called armor.", next = "BACK", reply = "They would, once. Then their families would come up this hill looking for me.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why sell out here, instead of Lakeshire?", next = "why" },
        { text = "What's happening at Stonewatch?", next = "stonewatch" },
        { text = "Let me see the leathers.", next = "BUSINESS" },
        { text = "Has a customer ever saved your life?", next = "ysaved" },
        { text = "What did your father teach you?", next = "yfather" },
        { text = "I'm a hunter. Need any hides?", next = "yhides", when = { class = "HUNTER" } },
        { text = "Good luck up here, Bernard.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Lakeshire's got shops enough, and the folk there buy fish, not armour. Out here every fighter who's lost a jerkin to a gnoll comes stumbling past, and I'm the only merchant for a mile who isn't a corpse." } },
      choices = {
        { text = "Profiting from the war, then.", next = "profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    profit = {
      lines = { { id = "p_default", text = "Somebody has to, and better a man who sells honest leather than one who sells shoddy goods at Lakeshire prices. I've kept more fools alive with my stitching than the Redridge watch ever has." } },
      choices = {
        { text = "An honest trade is honest, wherever it's done.", next = "BACK", reply = "That's it exactly. You've a head on your shoulders, keep it there.", fx = { align = { honor = 1 } } },
        { text = "A clever man finds the gap and fills it.", next = "BACK", reply = "Clever, honest, whichever. I fill the gap and the gap pays well.", fx = { align = { honor = -1 } } },
      },
    },
    stonewatch = {
      lines = { { id = "s_default", text = "The Blackrock orcs have the keep, and the gnolls run their errands, and the whole valley below's crawling with both. Magistrate Solomon keeps writing to Stormwind for soldiers, and Stormwind keeps not sending them.", fx = { learn = { "stonewatch_keep", "redridge_gnolls" } } } },
      choices = { { text = "Then I'll clear a few myself. Something else.", next = "BACK" } },
    },
    ysaved = {
      narr = "He scratches at an old scar on his cheek, half hidden by his beard.",
      lines = { { id = "ysa_default", text = "Once. A pack of Redridge gnolls came over the ridge at dusk, and a young paladin who'd just bought a pair of my gloves stood in front of my stall and held them off until the watch came. I never charged her again, and she never came back, either." } },
      choices = {
        { text = "Do you know what became of her?", next = "yher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yher = {
      lines = { { id = "yhe_default", text = "Heard she went north, to Stonewatch, with a few others. I keep her gloves' twin under the counter, in case she walks past. I'm not a sentimental man, mind. I'm just thorough about inventory." } },
      choices = { { text = "Of course you are. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yfather = {
      lines = { { id = "yfa_default", text = "That a jerkin's only as good as its worst stitch, and that a tanner with an empty purse is better than a rich one with a bad name. He'd be appalled at my prices, but proud of the seams." } },
      choices = {
        { text = "Did he ever fight the orcs?", next = "yorcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yorcs = {
      lines = { { id = "yor_default", text = "In the First War, when Lakeshire burned the first time. He carried water to the fires for two days and lost his shop and his hands' steadiness both. Said he'd never sell to a soldier again. I sell to nobody else." } },
      choices = { { text = "Times change. Something else.", next = "BACK" } },
    },
    yhides = {
      lines = {
        { id = "yhi_default", text = "Always, if they're clean and whole. Bring me boar or wolf from the Redridge hills, and if your beast didn't chew them first, we'll talk. You'll want to sell them in Lakeshire, mind; I've no coin to spare up here." },
        { id = "yhi_dwarf", when = { race = "Dwarf" }, text = "Always, if they're clean. A dwarf hunter knows how to skin a beast properly, which is more than I can say for most. Sell them in Lakeshire, mind; I've no coin to spare up here." },
      },
      choices = { { text = "I'll keep it in mind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    gnolls = { { id = "yt_gnolls", text = "The Redridge gnolls throw rocks at my stall every evening. I've started charging them for the dents, in theory." } },
    stonewatch = { { id = "yt_stone", text = "Stonewatch Keep belongs to the Blackrock now. The keep was built to watch the orcs, and now it watches us." } },
    background = { { id = "tp_bg", text = "Tanner's son from Lakeshire. I learned the trade from my father, and the nerve from somewhere else entirely." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask in Lakeshire, they've time for gossip down there." } },
  },
}

---------------------------------------------------------------------------
-- Madison: a little girl of Lakeshire, wandering from the fields behind Alma Jainrose's to the docks.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_madison", id = 848, name = "Madison", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "cheerful" }, values = { "family" },
  notices = { "race", "class" },
  impression = {
    first = "A little girl in a muddy dress skips along the path from the fields to the Lakeshire docks, a dandelion in one fist and a stick in the other.",
    third = "{name} met Madison, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! I found a shiny thing by the lake, and I'm only showing you, nobody else." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. I don't like you very much, and Mum says I don't have to talk to you." },
    { id = "g_default", text = "Hello! Are you an adventurer? You look like an adventurer, because you've got a sword and you're all dirty." },
  },
  start = "hello",
  nodes = {
    d6_solomon = {
      lines = { { id = "d6_solomon_a", text = "He sits in the town hall and writes letters, lots and lots of letters, to the king, I think, and then he looks out of the window and sighs. Mama says he's trying to get soldiers to come and help, and I asked if I could help, and he gave me a sweet." } },
      choices = {
        { text = "Did he ever let you help?", next = "d6_solomon2" },
        { text = "A sweet is a good wage for helping.", next = "d6_solomon2" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    d6_solomon2 = {
      lines = { { id = "d6_solomon2_a", text = "I carried a letter to the gryphon lady once, all by myself, and she let me pet the gryphon, and it smelled like feathers and fish. Mister Solomon said I was the best courier in Lakeshire, but I think he says that to everybody." } },
      choices = {
        { text = "I think he meant it, Madison.", next = "BACK", fx = { affinity = 1 } },
        { text = "What else do you know?", next = "BACK" },
      },
    },
    d6_flower = {
      lines = { { id = "d6_flower_a", text = "Dandelions, because when they're old you can blow on them and make a wish, and I've made a hundred wishes. Erin says that's too many and they'll get used up, but I don't think wishes work like that." } },
      choices = {
        { text = "I can turn into a bear, you know.", next = "d6_flower2", when = { class = "DRUID" } },
        { text = "What do you wish for?", next = "d6_flower2" },
        { text = "Wishes don't get used up.", next = "d6_flower2" },
      },
    },
    d6_flower2 = {
      lines = {
        { id = "d6_flower2_a", text = "That the bridge gets fixed, so Mama's cousin can come and visit, and that the gnolls go away, and a pony. The pony's the one I wish for most, but don't tell Mama, because she says ponies eat too much." },
        { id = "d6_flower2_druid", when = { class = "DRUID" }, text = "You can not! Can you? Do it, do it now, please, and then I'll wish on a dandelion that you'll stay a bear forever so I can ride you to the docks. No, wait, you'd better not stay a bear, because then you couldn't talk to me." },
      },
      choices = {
        { text = "I hope your wishes come true.", next = "BACK" },
        { text = "What else would you like to tell me?", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", text = "I'm Madison, and I'm going to the docks to look at the fish, and then I'm going back to the fields to look at the flowers. Mama says I'm not allowed past the bridge because of the gnolls." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "You've got the biggest beard I ever saw! Can I touch it? Mama says I shouldn't ask, but I already did." },
      },
      again = { { id = "h_again", text = "Do you want to know anything else? I know lots of things." } },
      choices = {
        { text = "What do you know about the gnolls?", next = "gnolls" },
        { text = "What do you like best about Lakeshire?", next = "lakeshire" },
        { text = "What's the biggest fish you've seen?", next = "xfish" },
        { text = "Why do you carry a stick?", next = "xstick" },
        { text = "Do you have any friends to play with?", next = "xfriends" },
        { text = "I'm a gnome. Am I the littlest adventurer?", next = "BACK", when = { race = "Gnome" }, reply = "You're even littler than my cousin Tommy! But you've got a sword, so you're the littlest and bravest adventurer." },
        { text = "Who's your mama?", next = "ymama" },
        { text = "What does Mister Solomon do all day?", next = "d6_solomon" },
        { text = "What's your favourite flower?", next = "d6_flower" },
        { text = "Run along home, now.", next = "END" },
      },
    },
    gnolls = {
      lines = { { id = "g2_default", text = "They're big and smelly and they live in the hills, and they steal things and hurt people. Mister Solomon says the guards will chase them away, but they haven't yet, and I think they should hurry up." } },
      choices = {
        { text = "I'll chase them away for you.", next = "chase" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chase = {
      lines = { { id = "c_default", text = "Really? Promise? If you do, I'll pick you the biggest flower in the whole field, even bigger than this one, and this one is very big." } },
      choices = { { text = "That's a deal.", next = "BACK", fx = { affinity = 1 } } },
    },
    lakeshire = {
      lines = { { id = "l_default", text = "The lake, because you can see the fish and sometimes a big one jumps up and goes splash. Also Missus Jainrose's garden, but don't tell her I go in it." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfish = {
      lines = {
        { id = "xxfish_0", text = "One as big as my arm! It jumped right out of the water by the dock and went splash and got Mister Hoggins wet. He said a bad word, but I didn't hear it, Mama." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xstick = {
      lines = {
        { id = "xxstick_0", text = "It's my sword, for gnolls. If one comes, I'll hit it on the nose. Mama says I should run instead. Should I run, or hit it on the nose?" },
      },
      choices = {
        { text = "Run home, little one. Leave gnolls to grown-ups.", next = "BACK", reply = "Okay. But I'm keeping the stick, just in case.", fx = { align = { honor = -1 } } },
        { text = "Hit it on the nose, then run home fast.", next = "BACK", reply = "Yes! Nose first, then run. That's a good plan.", fx = { align = { honor = 1 } } },
      },
    },
    xfriends = {
      lines = {
        { id = "xxfriends_0", text = "Erin and Hannah, but they always play guards and gnolls, and I want to play fishing. Sometimes they let me be the fish the gnoll is trying to catch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymama = {
      lines = {
        { id = "yma_default", text = "She mends nets for the fishermen, and she sings while she does it, the same song about a girl who turned into a heron. She says Papa went to Stormwind to work and he's coming back soon. She's been saying soon for a long time, though." },
        { id = "yma_human", when = { race = "Human" }, text = "She mends nets and sings the heron song. Papa went to Stormwind to work, she says, and he's coming back soon. Are you from Stormwind? Have you seen a man with a red beard who laughs very loud?" },
      },
      choices = { { text = "I'll look out for him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    bridge = { { id = "yt_bridge", text = "I'm not allowed past the bridge. Not even one step. I've measured, and it's very close." } },
    fish = { { id = "yt_fish", text = "The fish in Lake Everstill are silver on top and gold underneath. I've counted nine kinds." } },
    flowers = { { id = "yt_flowers", text = "The red flowers in the field by the road are my favourite. Mama says they're called Redridge poppies." } },
    erin = { { id = "yt_erin", text = "Erin is always the captain. I don't mind, because captains have to shout and I'd rather look at fish." } },
    jainrose = { { id = "yt_jain", text = "Missus Jainrose has the prettiest garden in Lakeshire. I only sit in it, I don't pick anything. Mostly." } },
    lakeshire = { { id = "tp_xlakeshire", text = "It has the lake, and the fish, and the bridge I'm not allowed past." } },
    gnolls = { { id = "tp_xgnolls", text = "Smelly and big. I'll hit them on the nose." } },
    _none = { { id = "tp_none", text = "I don't know that one. You should ask a grown-up, they know boring things." } },
  },
}

---------------------------------------------------------------------------
-- Erin: a little girl of Lakeshire who plays with Hannah near the town.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_erin", id = 850, name = "Erin", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "bossy", "cheerful" }, values = { "family", "play" },
  notices = { "race" },
  impression = {
    first = "A little girl with her hair in two crooked braids is very busy telling another child what to do.",
    third = "{name} met Erin, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! You get to be a real hero in the game, not a gnoll, because I'm the captain and I say so." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're mean, and I'm telling the real guard captain, and you have to be the gnoll forever." },
    { id = "g_default", text = "We're playing guards and gnolls, and I'm the guard captain, so you have to be a gnoll unless you're a real hero." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "You're littler than my papa but bigger than me, so you can be my lieutenant if you want!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Erin, and that's Hannah, and she's my best friend even though she always wants to be the gnoll. Are you a real hero? You look a bit like a real hero." } },
      again = { { id = "h_again", text = "What else? Hurry, Hannah's sneaking up on the bridge." } },
      choices = {
        { text = "I'm a real hero, yes.", next = "hero" },
        { text = "Why play at gnolls, of all things?", next = "why" },
        { text = "What does a guard captain do?", next = "xcaptain" },
        { text = "What does your papa do?", next = "xpapa" },
        { text = "What will you be when you grow up?", next = "xgrow" },
        { text = "I'm a dwarf. Can I be a guard too?", next = "BACK", when = { race = "Dwarf" }, reply = "Yes! You can be the guard who's very strong and carries the big hammer. Hannah, we've got a dwarf now!" },
        { text = "Have you ever seen a real gnoll?", next = "yreal" },
        { text = "Off you go and play.", next = "END" },
      },
    },
    hero = {
      lines = { { id = "he_default", text = "Then you have to fight the real gnolls up in the hills, because Papa says the guards aren't enough and Mister Solomon writes letters that nobody answers." } },
      choices = {
        { text = "I'll fight them, I promise.", next = "BACK", reply = "Hooray! I'll tell Hannah you're on our side.", fx = { align = { honor = 1 } } },
        { text = "Heroes get paid first, little one.", next = "BACK", reply = "That's not how heroes work in stories, you know.", fx = { align = { honor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because everyone's scared of them, and if you play at it, you're not scared as much. Mama says that's very wise for a girl my age, but she still won't let me past the bridge." } },
      choices = {
        { text = "Your mama is right about the bridge.", next = "bridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "I know, I know, everybody says it, and I only went across once and it was only a little way. Don't tell her, all right?" } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    xcaptain = {
      lines = {
        { id = "xxcaptain_0", text = "She shouts orders and points with a stick and tells everybody where to stand. And she's never scared, even when the gnoll jumps out from behind the woodpile." },
      },
      choices = {
        { text = "Are you ever scared?", next = "xscared" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xscared = {
      lines = {
        { id = "xxscared_0", text = "Only a little, and only at night, when the dogs bark at the hills. Papa says a brave person is scared and does it anyway. Is that true, or is a brave person never scared?" },
      },
      choices = {
        { text = "Brave people are scared, and do it anyway.", next = "BACK", reply = "Then I'm brave! A little bit brave, anyway.", fx = { align = { light = 1 } } },
        { text = "The bravest people are never scared at all.", next = "BACK", reply = "Oh. Then I need to practise more.", fx = { align = { light = -1 } } },
      },
    },
    xpapa = {
      lines = {
        { id = "xxpapa_0", text = "He fishes on the lake and mends nets and grumbles about the gnolls stealing his traps. He says if he were younger he'd chase them himself, but his knees are too creaky." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgrow = {
      lines = {
        { id = "xxgrow_0", text = "A real guard captain in Lakeshire, with a real sword and a shiny helmet. Or a fish, because fish get to swim all day. Mostly the captain, though." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yreal = {
      narr = "She lowers her stick-sword and glances toward the hills.",
      lines = {
        { id = "yre_default", text = "Once, from the inn window, when the watch dragged one through town tied up. It had a nose like a dog and it smelled like wet rugs, and it looked at me, and I didn't sleep for two nights. Hannah says she wasn't scared at all, but she was hiding behind me." },
        { id = "yre_hunter", when = { class = "HUNTER" }, text = "Once, tied up, when the watch dragged one through town. It smelled like wet rugs and it looked at me. You hunt them, don't you? Does it get less scary, the more you see?" },
      },
      choices = { { text = "A little. Something else.", next = "BACK" } },
    },
  },
  topics = {
    hannah = { { id = "yt_hannah", text = "Hannah is my best friend. She's the gnoll because she's good at growling, and she bites, a bit." } },
    bridge = { { id = "yt_bridge", text = "The bridge is being built out of stone now. Mister Daniel lets me watch if I don't touch anything." } },
    solomon = { { id = "yt_solomon", text = "Mister Solomon writes letters to the king. Papa says the king is a boy, and boys don't read letters." } },
    hero = { { id = "yt_hero", text = "Real heroes have shiny armour and they never run away. Or maybe they run away a little, but then they come back." } },
    gnolls = { { id = "tp_xgnolls", text = "They're bad, and they live in the hills, and I'm going to chase them away one day." } },
    lakeshire = { { id = "tp_xlakeshire", text = "It's the best town in the whole world. I've never been to another one, but I know." } },
    _none = { { id = "tp_none", text = "I don't know that, but Hannah might, she listens at the inn window." } },
  },
}

---------------------------------------------------------------------------
-- Hannah: Erin's playmate in Lakeshire, who always plays the gnoll.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_hannah", id = 851, name = "Hannah", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "shy", "curious" }, values = { "family", "play" },
  notices = { "class" },
  impression = {
    first = "A small girl peeks at you from behind a fencepost, growling softly to herself.",
    third = "{name} met Hannah, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh! It's you. I was going to growl, but you're nice, so I'll just say hello quietly instead." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not going to growl at you, because you're scary. Please go away now." },
    { id = "g_default", text = "Grr! Oh, sorry, I thought you were Erin, and I'm meant to be a gnoll, so I have to growl at everybody." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "Is that your pet? Can it growl better than me? I bet it can, but please don't tell Erin." },
  },
  start = "hello",
  nodes = {
    d6_erin = {
      lines = { { id = "d6_erin_a", text = "Very bossy, but a good bossy, like Marshal Marris. She makes us line up and say yes sir, and then she charges at me with a broom, and I have to fall down and say I'm defeated." } },
      choices = {
        { text = "I'm a warrior. I'd make you captain.", next = "d6_erin2", when = { class = "WARRIOR" } },
        { text = "Do you ever win, as the gnoll?", next = "d6_erin2" },
        { text = "That's a lot of falling down.", next = "d6_erin2" },
      },
    },
    d6_erin2 = {
      lines = {
        { id = "d6_erin2_a", text = "Once, when Erin tripped over the broom, and I didn't know what to do, so I just stood there growling. Then her mama called her in, so I don't know if it counts." },
        { id = "d6_erin2_war", when = { class = "WARRIOR" }, text = "Really? A real warrior said so? Then I'm going to tell Erin, and she'll have to be the gnoll for once, and I'll charge at her with the broom like you would. Do warriors shout something when they charge?" },
      },
      choices = {
        { text = "It counts, Hannah.", next = "BACK", fx = { affinity = 1 } },
        { text = "Ask me something else.", next = "BACK" },
      },
    },
    d6_carve = {
      lines = { { id = "d6_carve_a", text = "Fish, mostly, little wooden ones, and he sells them at the inn to people who want to remember the lake. He made me a gnoll once, so I'd know what I was pretending to be, but it came out looking like a dog with a hat." } },
      choices = {
        { text = "Do you still have the gnoll?", next = "d6_carve2" },
        { text = "A dog with a hat sounds friendlier.", next = "d6_carve2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    d6_carve2 = {
      lines = { { id = "d6_carve2_a", text = "It's under my pillow, so the real gnolls know I've got one of their own on my side. Papa says he'll carve me an orc next, but Mama says no, not after what happened on the west wall, so I think it'll be another fish." } },
      choices = {
        { text = "Your papa sounds very kind.", next = "BACK" },
        { text = "What else do you want to tell me?", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "I'm Hannah, and I always play the gnoll because Erin always wants to be the captain, and somebody has to lose. I don't mind, really, because gnolls get to hide in the best places." } },
      again = { { id = "h_again", text = "Do you want to ask me something else? I'm good at answers when Erin isn't listening." } },
      choices = {
        { text = "Have you ever seen a real gnoll?", next = "real" },
        { text = "Don't you mind always losing?", next = "lose" },
        { text = "Where's your best hiding place?", next = "xhide" },
        { text = "What do gnolls sound like, really?", next = "xsound" },
        { text = "Would you like to be the captain one day?", next = "xcaptain" },
        { text = "I'm a hunter. My pet can teach you a growl.", next = "BACK", when = { class = "HUNTER" }, reply = "Really? Grrr! Was that good? Erin will never find me if I can growl like a real animal!" },
        { text = "What does your family do?", next = "yfamily" },
        { text = "What's Erin like as a captain?", next = "d6_erin" },
        { text = "What does your papa carve?", next = "d6_carve" },
        { text = "Good hiding, Hannah.", next = "END" },
      },
    },
    real = {
      lines = { { id = "r_default", text = "Once, from the inn window, far away on the hill, and it was much bigger than me and much scarier than my growl. I listen at the inn window a lot, and the soldiers say the gnolls work for orcs now, which is even worse." } },
      choices = {
        { text = "What else do the soldiers say?", next = "soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      lines = { { id = "s_default", text = "That Stonewatch Keep is full of orcs, and that a big orc called Gath'Ilzogg is the worst of them, and that somebody ought to do something. Then they order more ale, so I don't think it's going to be them." } },
      choices = { { text = "Maybe it'll be me. Something else.", next = "BACK" } },
    },
    lose = {
      lines = { { id = "l_default", text = "A little bit, but Erin's my best friend, and best friends let each other win sometimes. Mama says that's called being gracious." } },
      choices = {
        { text = "Your mama's right. That's real kindness.", next = "BACK", reply = "I'll tell her a hero said so!", fx = { align = { honor = 1 } } },
        { text = "You should make Erin lose sometimes too.", next = "BACK", reply = "Ooh, maybe I will, the very next game.", fx = { align = { honor = -1 } } },
      },
    },
    xhide = {
      lines = {
        { id = "xxhide_0", text = "Under Mister Solomon's porch, because it's dark and smells like apples, and nobody ever looks there. Don't tell Erin, it's my best secret." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsound = {
      lines = {
        { id = "xxsound_0", text = "Like a big dog who's angry and laughing at the same time. I heard one once at night, and I hid under my blanket till Mama came." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaptain = {
      lines = {
        { id = "xxcaptain_0", text = "Maybe, once. But if I'm the captain, then Erin has to be the gnoll, and she's terrible at hiding. Should I ask her to swap, or keep playing the gnoll?" },
      },
      choices = {
        { text = "Ask to swap. It's only fair.", next = "BACK", reply = "Okay! I'll ask tomorrow. Unless she's grumpy.", fx = { align = { order = -1 } } },
        { text = "Keep the game the way it is. It works.", next = "BACK", reply = "All right. Gnolls get the best hiding places anyway.", fx = { align = { order = 1 } } },
      },
    },
    yfamily = {
      narr = "She twists the hem of her dress around one finger.",
      lines = {
        { id = "yfa_default", text = "Mama bakes for the inn, and Papa was on the watch, but he hurt his leg on the west wall and now he carves fishing floats instead. He says he doesn't mind. He still looks at the hills a lot, though, when he thinks I'm not watching him." },
        { id = "yfa_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "Mama bakes for the inn, and Papa was on the watch like you, until he hurt his leg on the west wall. Now he carves fishing floats. He still looks at the hills, though, the way you do." },
      },
      choices = { { text = "He sounds brave. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    stonewatch = { { id = "yt_stone", text = "Stonewatch Keep is up in the hills, full of orcs. I can see its towers from the bridge on a clear day." } },
    inn = { { id = "yt_inn", text = "The inn window is the best place to hear things. The soldiers talk very loud after their second ale." } },
    gathilzogg = { { id = "yt_gath", text = "Gath'Ilzogg is the big orc at Stonewatch. The soldiers say his name very quietly, so I do too." } },
    papa = { { id = "yt_papa", text = "Papa carves fishing floats now. He made me one shaped like a gnoll, which is funny, and a bit scary." } },
    mama = { { id = "yt_mama", text = "Mama bakes the bread at the inn. She says being gracious is the best thing you can be, after being warm." } },
    erin = { { id = "tp_xerin", text = "My best friend. She's bossy, but she shares her sweets." } },
    gnolls = { { id = "tp_xgnolls", text = "Real ones are scary. Pretend ones are fun." } },
    _none = { { id = "tp_none", text = "I don't know, but I can listen at the inn window and find out." } },
  },
}
