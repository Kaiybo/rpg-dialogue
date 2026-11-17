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
    first = "Migi is a small, loud orc boy who plays a war game with clay figures behind Grommash Hold and forgets to eat. His father Thatog worries about him, and Migi seems to think that's very funny.",
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
          text = "Borstan's Meats? Is that for one of us? Oh, it's for me! It smells really good, like the sweetglaze but different, and my father sent you, didn't he?" },
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
        { text = "A game's only fun if anyone can win, Migi.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll lose on purpose. Just don't tell Mogra.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
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
    first = "Mogra is the orc girl who runs the children's war game behind Grommash Hold, and she runs it like a general. I had the feeling she'd already decided which side I'd be on before I spoke.",
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
        { text = "The best. Lead because you're good at it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The loudest. Whoever takes charge, gets it.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Mogra. I live near the Valley of Wisdom and I'm the best at the war, and that's all you need to know." } },
    advice = { { id = "tp_ad", text = "Never put all your figures in one place. Migi does, and that's why he loses." } },
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
    first = "Puk is the quiet one among the children behind Grommash Hold, the boy who always plays the shaman and spends his turns healing everybody else. He seemed more interested in the spirits than in winning.",
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
        { text = "Your grandmother. Keeping people alive matters most.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Mogra. Sometimes you have to fight to win.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I think you already know.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    friends = {
      lines = {
        { id = "fr_default", text = "Migi is my best friend, even though he eats my crumbs, and Mogra is the cleverest person in Orgrimmar, but don't tell her because she'd be unbearable. Thra and Brog are nice too, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Puk. I live with my grandmother near the Valley of Wisdom, and I play the war with my friends every day." } },
    advice = { { id = "tp_ad", text = "Heal your friends first, even if they're being rude. My grandmother says that's the hard part." } },
    _none = { { id = "tp_none", text = "I don't know about that. Maybe the shamans in the valley know." } },
  },
}
