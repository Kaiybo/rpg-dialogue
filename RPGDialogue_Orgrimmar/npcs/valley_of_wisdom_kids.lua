-- The children who play behind Grommash Hold in the Valley of Wisdom (Forever):
-- Migi (Thatog's son), Mogra and Puk. Thra and Brog play with them.
-- Quests: Meal Appeal (Thatog), Favorite Food (Migi's turn-in), Rocks to Rests (Thra).
-- Voice: bibles/valley_of_wisdom_kids.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Migi: Thatog's son, who skips lunch for the game.
---------------------------------------------------------------------------
P:NPC {
  key = "migi", id = TODO_NPC("Migi"), name = "Migi",
  bible = "bibles/valley_of_wisdom_kids.md", role = "child", tier = "quest",
  communities = { "orgrimmar" }, temper = { "eager" }, values = { "brave", "generous" },
  notices = { "wonder", "kin", "hunger" },

  impression = {
    first = "He forgets to eat and finds his father's worrying very funny.",
    third = "{name} met Migi, Thatog's son, who plays behind Grommash Hold with his friends.",
  },

  barks = {
    { id = "b_game", text = "No, no, that's my wolf rider, Puk, and you can't take him, he's on the hill!" },
  },

  greetings = {
    { id = "g_default", text = "Shh! Don't step there, that's the Barrens! All right, you can talk, but stand on that side." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Did you come to play? You can be the Alliance, nobody ever wants to be the Alliance." },
    { id = "g_food", when = { questActive = TODO_QUEST("Favorite Food") }, text = "What's that smell? Is that Borstan's? Is that for one of us?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Favorite Food") }, text = "Hey, it's the lunch bringer! I go to Borstan's every day now, honest, you can ask him." },
  },

  notice = {
    { id = "n_sky", cat = "wonder", when = { race = "Skyborne" },
      text = "Whoa, are you one of the elves from the sky? Mogra says you can float down off things, so can you float off the Hold, please, just once?" },
    { id = "n_tauren", cat = "wonder", when = { race = "Tauren" },
      text = "You're so big you'd squash the whole Barrens in one step! Please don't, I spent all morning on the crossroads." },
    { id = "n_pet", cat = "wonder", when = { pet = { type = "Beast" } },
      text = "Is that your {pet}? Can it be in the game? We need a real wolf, ours is just a rock with a face." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Migi, and this is the war, and I'm winning, mostly. Mogra says she's winning but that's because she makes up rules when she's losing." },
        { id = "h_food", tags = { "news" }, when = { questActive = TODO_QUEST("Favorite Food") },
          text = "Borstan's Meats? Is that for one of us? Oh, it's for me! It smells really good, and my father sent you, didn't he?" },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Favorite Food"), days = 3 } },
          text = "I can tell what Borstan's making from the road now, just by the smell, and today it's the sweetglaze again! We stop the game at midday and all eat together, it was Mogra's rule but I thought of it first." },
        { id = "h_rocks", tags = { "news" }, when = { questDone = TODO_QUEST("Rocks to Rests") },
          text = "We've got real seats now, look! Thra put the flattest rock at the top and said that's the war chief's, and I sat on it first, so I'm the war chief." },
        { id = "h_orc", when = { race = "Orc" },
          text = "I'm Migi, and this is the war, and you can be on my side because you're an orc. Puk's an orc too, but he keeps losing, so maybe don't stand near him." },
      },
      again = {
        { id = "h_again", text = "What? Hurry, it's my turn soon!" },
        { id = "h_again2", text = "All right, one more question, and then you have to watch me win." },
      },
      choices = {
        { text = "What game are you playing?", next = "game" },
        { text = "Have you eaten today, Migi?", next = "lunch" },
        { text = "Who are your friends?", next = "friends" },
        { text = "Your father worries about you, you know.", next = "father" },
        { text = "Here's your lunch from Borstan.", next = "BUSINESS", when = { questActive = TODO_QUEST("Favorite Food") } },
        { text = "Good luck with the war, Migi.", next = "END" },
      },
    },
    game = {
      lines = {
        { id = "gm_default", text = "It's the war! These figures are the Horde and those are the Alliance, and we take turns moving them, and if you get to the other side's rock you win. Thra made up most of it, but I made up the part with the wolves." },
      },
      choices = {
        { text = "Who usually wins?", next = "game_win" },
        { text = "Can I play?", next = "game_play" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_win = {
      lines = {
        { id = "gw_default", text = "Me, or Mogra, depending who you ask. Puk never wins, because he always wants to be the shaman and the shaman can't fight, he just heals everybody, and that takes all his turns." },
      },
      choices = {
        { text = "Healing everyone sounds like a good way to win, actually.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_play = {
      big = true,
      lines = {
        { id = "gp_default", text = "All right, but you have to be the Alliance, and you have to lose at the end, because the Horde always wins. Mogra says that's not fair but it's my rule. Do you want to win or be fair?" },
      },
      choices = {
        { text = "A game's only fun if anyone can win, Migi.", next = "BACK", reply = "Mogra says that too, and now you're saying it. All right, but if the Alliance wins, I'm not playing anymore.", fx = { align = { honor = 1 } } },
        { text = "I'll lose on purpose. Just don't tell Mogra.", next = "BACK", reply = "I won't tell, I promise! You're the best Alliance anybody ever played, honest.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Maybe another time.", next = "BACK" },
      },
    },
    lunch = {
      lines = {
        { id = "lu_default", text = "I'm not hungry, honest, I'll eat when I get home. Father says I'm supposed to go to Borstan's at midday but then I'd lose my turn, and Mogra would move my wolves." },
        { id = "lu_done", when = { questDone = TODO_QUEST("Favorite Food") }, text = "Yes! I had the sweetglaze with the crumbs on top, and then I had Puk's crumbs because he was busy healing. I go every day now, you can tell my father." },
      },
      choices = {
        { text = "A war chief who doesn't eat can't lead.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends = {
      lines = {
        { id = "fr_default", text = "That's Mogra, she's the boss, and that's Puk, and Thra and Brog are over there arguing about the rocks. We're the best war band in the whole Valley of Wisdom." },
      },
      choices = {
        { text = "The best? Are there others?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "fa_default", text = "He worries about everything, like whether I've eaten and whether it's going to rain and whether the guards are watching us. He was in the camps when he was young, and he says I don't know how lucky I am, which is what fathers always say." },
      },
      choices = {
        { text = "He's right, Migi. Listen to him sometimes.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "He loves you. That's why he worries.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Migi and I live by the armory with my father, and I'm going to be a warrior, or maybe a wolf rider, or both." } },
    advice = { { id = "tp_ad", text = "Always keep one wolf back to guard your rock. Mogra taught me that, but don't tell her I said so." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Mogra, she knows everything, or she says she does." } },
  },
}

---------------------------------------------------------------------------
-- Mogra: the girl who runs the game.
---------------------------------------------------------------------------
P:NPC {
  key = "mogra", id = TODO_NPC("Mogra"), name = "Mogra",
  bible = "bibles/valley_of_wisdom_kids.md", role = "child", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp", "proud" }, values = { "brave", "cunning" },
  notices = { "wonder", "class" },

  impression = {
    first = "She had picked my side of the game before I spoke.",
    third = "{name} met Mogra, the girl who bosses the children's game behind Grommash Hold.",
  },

  greetings = {
    { id = "g_default", text = "You're standing in Ashenvale. Move one step left, please, and then you can talk to me." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Good, because I need someone to tell Migi he can't make up rules in the middle of a turn." },
    { id = "g_rocks", when = { questDone = TODO_QUEST("Rocks to Rests") }, text = "You're the one who carried the rocks! I told Thra you would, and Thra said you'd never, so I win that too." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "You're a real warrior, aren't you? Then tell Migi you can't charge across the Barrens in one turn, because he never listens to me." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Are you a shaman like the Warchief? Puk always wants to be the shaman, so if you tell him a shaman fights too, maybe he'll stop healing everybody." },
    { id = "n_sky", cat = "wonder", when = { race = "Skyborne" },
      text = "I knew it, you're one of the sky elves! I told everybody the elves from the sky came to see the Warchief, and Brog said I made it up." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mogra, and I'm in charge of the war today, and tomorrow, and probably every day. Somebody has to be, or Migi would just put all his wolves in one pile and call it a charge." },
        { id = "h_rocks", tags = { "news" }, when = { questDone = TODO_QUEST("Rocks to Rests") },
          text = "Now that we've got rocks to sit on, nobody has to sit in the dirt, and I can see the whole board from my rock. I made Thra give me the one with the flat side." },
        { id = "h_troll", when = { race = "Troll" },
          text = "I'm Mogra, and I'm in charge of the war. Are you a Darkspear? We don't have any trolls in the game yet, and I think we should, but Migi says trolls would just hide in the jungle." },
      },
      again = {
        { id = "h_again", text = "Yes? Quickly, it's nearly my turn." },
        { id = "h_again2", text = "What else? I can talk and plan at the same time, you know." },
      },
      choices = {
        { text = "How do you win this game?", next = "rules" },
        { text = "Why are you in charge?", next = "charge" },
        { text = "Do you want to be a warrior when you're grown?", next = "grown" },
        { text = "Who else plays the game?", next = "players" },
        { text = "Why is this patch Ashenvale?", next = "board" },
        { text = "When I was your age, we were in the camps.", next = "camps", when = { race = "Orc" } },
        { text = "Shamans fight too, you know.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Good luck, general.", next = "END" },
      },
    },
    rules = {
      lines = {
        { id = "ru_default", text = "You move your figures across the board and try to reach the other side's rock, and if two figures meet, you roll a pebble. Migi says wolves get two pebbles, and I say that's only if they've eaten, which is a rule I made because of Migi." },
      },
      choices = {
        { text = "That's a clever rule.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      big = true,
      lines = {
        { id = "ch_default", text = "Because I'm the best at it, and because I'm the only one who remembers all the rules. Brog says that's not why, he says it's because I shout loudest. Is it better to be the best or the loudest?" },
      },
      choices = {
        { text = "The best. Lead because you're good at it.", next = "BACK", reply = "The best, I knew it! I'm going to tell Brog you said so, and he'll have to stop shouting.", fx = { align = { order = 1 } } },
        { text = "The loudest. Whoever takes charge, gets it.", next = "BACK", reply = "Then I'll shout even louder, and nobody will ever take my place. Thanks!", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Both, I think, in your case.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    grown = {
      lines = {
        { id = "gr_default", text = "No, I'm going to be the one who tells the warriors where to go. My mother says the Warchief has orcs who only plan, and they're the cleverest in the whole Horde, so that's what I'll be." },
      },
      choices = {
        { text = "The Horde will be lucky to have you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    players = {
      lines = { { id = "pl_default", text = "Migi plays wolves, Puk plays the shaman, Thra plays whatever I tell her, and Brog plays the night elves because nobody else will. I play the general, which means I get to tell all of them what to do, and they mostly listen." } },
      choices = {
        { text = "Mostly?", next = "players_migi" },
        { text = "Something else.", next = "BACK" },
      },
    },
    players_migi = {
      lines = { { id = "pm_default", text = "Migi never listens. Yesterday he charged all his wolves across the whole Barrens at once, and they all got eaten by Brog's trees, and then he said the trees weren't allowed to move." } },
      choices = {
        { text = "Can trees move in your game?", next = "players_trees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    players_trees = {
      lines = { { id = "pt_default", text = "Brog says the night elves have trees that walk, real ones, and his uncle saw one in Ashenvale. I don't believe it, but I let him have one walking tree, because otherwise the game's too easy and I'd win every time." } },
      choices = {
        { text = "Brog's uncle is right. Some trees walk.", next = "BACK", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    board = {
      lines = { { id = "bo_default", text = "Because my uncle's in Ashenvale with the Warsong, cutting down trees for the Horde, so that patch is where the real war is. The scratch in the dirt is the river, and the pebbles are the night elves, and they're always hiding." } },
      choices = {
        { text = "What does your uncle say about it?", next = "board_uncle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_uncle = {
      lines = { { id = "bu_default", fx = { learn = { "warsong" } }, text = "He says the night elves shoot from the trees and never come out to fight properly, and that the forest is so dark you can't see the sky. He sent me a feather from one of their arrows, and I keep it under my rock." } },
      choices = {
        { text = "What do you think of the night elves, Mogra?", next = "board_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_elves = {
      big = true,
      lines = { { id = "be_default", text = "Brog says the night elves were there first and they're only protecting their trees, and that's why he plays them. But we need the wood to build things, so who's right?" } },
      choices = {
        { text = "Brog. It's their forest, and we're taking it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You. The Horde needs the wood to survive.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "That's for grown-ups to sort out.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    camps = {
      lines = { { id = "ca_default", text = "My mother says that too, and then she goes quiet and doesn't finish. Is it true there were walls and humans, and nobody was allowed to fight, not even the warriors?" } },
      choices = {
        { text = "It's true. Thrall freed us.", next = "camps_thrall" },
        { text = "I'd rather not talk about it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    camps_thrall = {
      lines = { { id = "ct_default", fx = { learn = { "internment" } }, text = "I know that part! The Warchief broke the walls and everybody came out, and that's why nobody's allowed to put an orc in a cage ever again. When I'm a general, I'm going to make sure of it." } },
      choices = {
        { text = "See that you do, general.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Really? Then can you tell Puk, because he only ever heals and never throws lightning, and I need him to throw lightning at Brog's tree. If a real shaman says so, he'll have to listen." } },
      choices = {
        { text = "A good shaman knows when to heal, too.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "I'll tell him. Lightning wins wars.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Mogra. I live near the Valley of Wisdom and I'm the best at the war, and that's all you need to know." } },
    advice = { { id = "tp_ad", text = "Never put all your figures in one place. Migi does, and that's why he loses." } },
    warsong = { { id = "tp_warsong", next = "board_uncle", text = "My uncle's with the Warsong in Ashenvale. They're the bravest of all, and they cut down the biggest trees." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is the best general in the whole world, but I'll be second best, and then first when he's old." } },
    _none = { { id = "tp_none", text = "That's not part of the game, so I don't care about it." } },
  },
}

---------------------------------------------------------------------------
-- Puk: the quiet one who always plays the shaman.
---------------------------------------------------------------------------
P:NPC {
  key = "puk", id = TODO_NPC("Puk"), name = "Puk",
  bible = "bibles/valley_of_wisdom_kids.md", role = "child", tier = "service",
  communities = { "orgrimmar" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "wonder", "class" },

  impression = {
    first = "He always plays the shaman and spends his turns healing the others.",
    third = "{name} met Puk, a gentle orc boy who plays the shaman in the children's game behind Grommash Hold.",
  },

  greetings = {
    { id = "g_default", text = "Hello. I'm healing the wolf riders, so I can't move, but I can talk." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again. Migi lost his whole army just now, so I'm busy, but I'm glad you came back." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" }, place = "before",
      text = "You're a real shaman, aren't you? I can tell by the totems. Can you hear the spirits right now, here, behind the Hold?" },
    { id = "n_sky", cat = "wonder", when = { race = "Skyborne", class = "SHAMAN" },
      text = "Do the spirits of the sky talk differently from the ones down here? I always wondered whether the wind has its own voice." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Can you really turn into a bear? I'd turn into a bear if I could, and then Mogra would let me win." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Puk. I'm always the shaman in the game, because the shaman keeps everybody alive, and Migi and Mogra are always nearly dead." },
        { id = "h_rocks", tags = { "news" }, when = { questDone = TODO_QUEST("Rocks to Rests") },
          text = "Thanks for the rocks. Mine's the round one by the wall, and it stays warm all afternoon, so I can sit and heal people for ages without my legs going to sleep." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "I'm Puk, and I'm going to be a shaman like you when I'm grown. In the game I'm already one, but I can only heal pretend wounds." },
      },
      again = {
        { id = "h_again", text = "Do you want to ask me something else? I don't mind." },
        { id = "h_again2", text = "Yes? I'm still listening, between turns." },
      },
      choices = {
        { text = "Why do you always play the shaman?", next = "shaman" },
        { text = "Don't you want to win sometimes?", next = "win" },
        { text = "What do you think of Migi and Mogra?", next = "friends" },
        { text = "Tell me about your grandmother.", next = "grandma" },
        { text = "Have you ever watched a real healer work?", next = "healers" },
        { text = "Do you want to see a real totem, Puk?", next = "totem", when = { class = "SHAMAN" } },
        { text = "Could you heal someone like me?", next = "undead", when = { race = "Scourge" } },
        { text = "Take care of them, healer.", next = "END" },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Because the Warchief's a shaman, and he didn't win by hitting people the hardest. My grandmother says he listened to the spirits until they listened back, and I think that's the best thing anyone can do." },
      },
      choices = {
        { text = "Do you hear the spirits, Puk?", next = "spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "sp_default", text = "Sometimes I think the wind says things when it comes over the Hold, but Brog says it's only wind. I'm going to ask the shamans in the Valley of Wisdom when I'm old enough, and they'll tell me who's right." },
        { id = "sp_shaman", when = { class = "SHAMAN" }, text = "Sometimes I think the wind says things when it comes over the Hold. You'd know, wouldn't you? You don't have to tell me, but you could nod if Brog's wrong." },
      },
      choices = {
        { text = "Keep listening. You'll hear it in time.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    win = {
      big = true,
      lines = {
        { id = "wi_default", text = "Sometimes, but if I stopped healing, everybody would lose their figures and the game would be over too soon. Mogra says healers never win wars, but my grandmother says nobody wins wars without them. Who's right?" },
      },
      choices = {
        { text = "Your grandmother. Keeping people alive matters most.", next = "BACK", reply = "I knew it! I'm going to tell Mogra right now, and she'll have to let me keep healing.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Mogra. Sometimes you have to fight to win.", next = "BACK", reply = "Maybe, but if I stop healing, nobody's left to fight. I'll ask my grandmother again.", fx = { align = { light = -1 } } },
        { text = "I think you already know.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    friends = {
      lines = {
        { id = "fr_default", text = "Migi is my best friend, even though he eats my crumbs, and Mogra is the cleverest person in Orgrimmar, but don't tell her because she'd be unbearable. Thra and Brog are nice too, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grandma = {
      lines = { { id = "gm_default", text = "She's very old and she tells the best stories, but only at night, because she says stories are for when the work's done. She was in the camps, before the Warchief came, and she looked after the sick orcs there." } },
      choices = {
        { text = "What did she tell you about the camps?", next = "grandma_camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grandma_camps = {
      lines = { { id = "gc_default", fx = { learn = { "internment" } }, text = "She says everybody was tired all the time, and sad, and nobody knew why, and the shamans had all forgotten how to talk to the spirits. Then the Warchief came, and he remembered, and she says that's when she knew things would be all right." } },
      choices = {
        { text = "Why had the shamans forgotten?", next = "grandma_lesson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grandma_lesson = {
      lines = { { id = "gl_default", text = "She says a long time ago the orcs did something bad with dark magic, and the spirits stopped listening, and it took a long time to say sorry. That's why I want to be a shaman, so I can keep saying sorry until they've forgiven us all the way." } },
      choices = {
        { text = "That's a good reason, Puk.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    healers = {
      lines = { { id = "he_default", text = "Once, in the Valley of Wisdom, when a grunt came back from the Barrens with a big cut on his arm. The shaman put her hands on it and said something to the water spirits, and the cut closed up, and I wasn't even scared." } },
      choices = {
        { text = "And you've been practicing ever since?", next = "healers_stick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    healers_stick = {
      lines = { { id = "hs_default", text = "I made a totem out of a stick and some feathers, and I put it next to my rock in the game. It doesn't do anything yet, but Migi says his wolves feel better when it's there, and I think that counts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    totem = {
      lines = { { id = "to_default", text = "Yes, please! Can I touch it? I won't break it, I promise, and I'll tell Mogra I saw a real one, and then she'll have to let me use my totem in the game properly." } },
      choices = {
        { text = "Go on. Gently, though.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Totems aren't toys, Puk.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    undead = {
      lines = { { id = "ud_default", text = "I don't know if pretend healing works on Forsaken. My grandmother says the Forsaken are hurt in a way that doesn't close, but I could try, if you sit by my rock and don't mind waiting a turn." } },
      choices = {
        { text = "I'll wait my turn. Thank you, Puk.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some wounds can't be healed, child.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Puk. I live with my grandmother near the Valley of Wisdom, and I play the war with my friends every day." } },
    advice = { { id = "tp_ad", text = "Heal your friends first, even if they're being rude. My grandmother says that's the hard part." } },
    thrall = { { id = "tp_thrall", next = "grandma_camps", text = "The Warchief is a shaman, like I'm going to be. My grandmother says he remembered what everybody else forgot." } },
    internment = { { id = "tp_intern", text = "My grandmother was in the camps. She doesn't like talking about it, except at night, and only a little." } },
    _none = { { id = "tp_none", text = "I don't know about that. Maybe the shamans in the valley know." } },
  },
}
