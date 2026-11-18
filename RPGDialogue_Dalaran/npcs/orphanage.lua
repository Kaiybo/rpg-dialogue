-- The Dalaran Orphanage: the children Brock, Dallas, Josie, Korben, Liam and Lilly, and the two who feed them,
-- Cody the baker and Paige the chef. The rabbits (Baron Von Bunwick, Duchess Elisabun, Countess Bunidict,
-- Count Ash Bunnington) live upstairs, and Luna the wolf plays with Liam. Short conversations by design.
-- Voice: bibles/orphanage.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_brock", id = TODO_NPC("Brock"), name = "Brock",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "eager", "proud" }, values = { "brave" },
  notices = { "class" },

  impression = {
    first = "Brock is the oldest of the orphanage children, or says he is, and means to join the Kirin Tor the moment anyone lets him. He keeps an eye on the little ones as if somebody gave him the job.",
    third = "{name} met Brock, a boy at the Dalaran Orphanage who means to be an archmage.",
  },

  greetings = {
    { id = "g_default", text = "I'm in charge upstairs. Mostly." },
    { id = "g_mage", when = { class = "MAGE" }, text = "You're a real mage! Show me something, please?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Is that a real spellbook? Can I hold it? I won't read it, I only want to know how heavy it is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Brock, and I'm the oldest here, so I'm in charge upstairs when Paige is cooking. When I'm grown I'm going to be in the Kirin Tor, and then I'll fix the whole city myself." },
        { id = "h_mage", when = { class = "MAGE" }, text = "You're a mage! A real one! Did you have to study for years and years, like Paige says, or did you just know how?" },
      },
      again = { { id = "h_again", text = "What else? I'm meant to be watching Dallas, but he's only with the rabbits." } },
      choices = {
        { text = "Why do you want to join the Kirin Tor?", next = "why" },
        { text = "What's it like, being in charge?", next = "charge" },
        { text = "Do I look like I know how?", next = "xmage", when = { class = "MAGE" } },
        { text = "Good luck, Brock.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because the magi stayed and fixed the city when everything was broken, and I want to be one of the ones who stays. Also you get a purple robe, and nobody can tell you to go to bed." } },
      choices = {
        { text = "Do you remember when it was broken?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "re_default", text = "A little, I remember smoke, and somebody carrying me, and I don't remember their face. Paige says that's all right, and that's why I'm going to carry somebody someday, so it evens out." } },
      choices = { { text = "That's a fine reason, Brock.", next = "BACK", fx = { affinity = 2 } } },
    },
    charge = {
      big = true,
      lines = { { id = "ch_default", text = "Hard, because nobody listens, and Josie says I'm not really in charge, only bossy. Are you supposed to make people listen, or wait till they want to?" } },
      choices = {
        { text = "Set the rules and make them stick. That's leading.", next = "BACK", reply = "That's what I think too, and I'm going to make a rule about bedtimes first, though Josie will probably say I'm being bossy again.", fx = { align = { order = 1 } } },
        { text = "Let them choose. People follow who they trust.", next = "BACK", reply = "Oh, I hadn't thought of it like that, so maybe if I'm nicer to Korben he'll stop hiding under the stairs every time I call him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xm_default", text = "You look like you know how. Paige says the real ones study until their eyes go funny, and yours look a little funny, so I think that means you're real." } },
      choices = { { text = "Study hard, and yours will go funny too.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know that one, but when I'm in the Kirin Tor I'll know everything." } },
  },
}

P:NPC {
  key = "dal_dallas", id = TODO_NPC("Dallas"), name = "Dallas",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "earnest", "gentle" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "Dallas keeps the orphanage rabbits and knows each one's title, temper and favourite cushion. He takes the work more seriously than most guards take theirs.",
    third = "{name} met Dallas, the boy who looks after the rabbits at the Dalaran Orphanage.",
  },

  greetings = {
    { id = "g_default", text = "Shh, the Baron's asleep. Talk quietly, please." },
    { id = "g_pet", when = { pet = true }, text = "Is your pet friendly with rabbits? Please keep it by the door." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has to stay by the stairs, please, because the Duchess faints if anything with teeth looks at her. She doesn't really faint, she just goes very flat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Dallas, and I look after the rabbits. That's Baron Von Bunwick asleep on the Duchess, and the Countess is under the bed, and Count Ash Bunnington is wherever he isn't supposed to be." },
      },
      again = { { id = "h_again", text = "Do you want to know anything else about the rabbits? I know everything about them." } },
      choices = {
        { text = "Who gave the rabbits such grand names?", next = "names" },
        { text = "Tell me about each of them.", next = "rabbits" },
        { text = "Do the rabbits really need titles?", next = "titles" },
        { text = "Take good care of them, Dallas.", next = "END" },
      },
    },
    names = {
      lines = { { id = "nm_default", text = "We all did, at supper, and it took three suppers. Count Ash Bunnington is grey all over, like ash, and Lilly cried when we said why, so now we say it's because he's grey and that's all." } },
      choices = { { text = "That's a good name for him.", next = "BACK", fx = { affinity = 1 } } },
    },
    rabbits = {
      lines = { { id = "ra_default", text = "The Baron is the oldest and he thinks he's in charge, like Brock. The Duchess Elisabun lets him sleep on her, the Countess Bunidict bites, but only people she likes, and the Count goes downstairs to visit Luna, which isn't allowed." } },
      choices = {
        { text = "A rabbit visits a wolf?", next = "rabbits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rabbits2 = {
      lines = { { id = "r2_default", text = "Every day, and Luna just looks at him and puts her head down, because Liam taught her not to eat family. Paige says it's the strangest thing she's ever seen, and she used to live in Stromgarde." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    titles = {
      big = true,
      lines = { { id = "ti_default", text = "Paige says they're only rabbits and they don't know they're a Baron or a Countess. But everybody ought to be important to somebody, oughtn't they, even rabbits?" } },
      choices = {
        { text = "Everyone should. Keep giving them their titles.", next = "BACK", reply = "I knew it, and I'm going to tell Paige a real adventurer said so, and then I'm going to tell the Countess, because she worries about things like that.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Paige is right. They're only rabbits.", next = "BACK", reply = "Oh, well, maybe they don't know, but I know, and I think the Baron would be very sad if he heard you, so please don't say it near his cushion.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, but I can tell you what the Countess thinks of it, which is bite it." } },
  },
}

P:NPC {
  key = "dal_josie", id = TODO_NPC("Josie"), name = "Josie",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "cheerful", "chatty" }, values = { "curious" },
  notices = { "skyborne" },

  impression = {
    first = "Josie sits by the orphanage fire and tells the other children stories, most of them about the island in the sky. She wants to ride the skycutter more than she wants anything.",
    third = "{name} met Josie, a girl at the Dalaran Orphanage who dreams of the sky island.",
  },

  greetings = {
    { id = "g_default", text = "Come sit by the fire! I'm in the middle of a story." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "You're from the sky! Are you? You are!" },
  },

  notice = {
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne" },
      text = "Is it true you can float down from high places? Brock says it's only a trick, but I watched one of you step off the landing and come down like a leaf." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Josie, and I tell the stories at bedtime, because Brock's are boring and they're all about Brock. Tonight's is about the island in the sky, and the ship that sails there, and a girl who stows away on it, who is me." },
        { id = "h_skyborne", when = { race = "Skyborne" }, text = "You're from the island in the sky, aren't you? Is it true there are no stairs, and you just float? Please say it's true, because I've already told everyone it is." },
      },
      again = { { id = "h_again", text = "What else? The fire's warm and I'm not sleepy at all." } },
      choices = {
        { text = "Have you ever seen the sky ship?", next = "ship" },
        { text = "Will the island in the sky fall down?", next = "fall" },
        { text = "It's true about the floating, more or less.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Sweet dreams, Josie.", next = "END" },
      },
    },
    ship = {
      lines = { { id = "sh_default", text = "Once, from the window upstairs, coming in over the north end with its sails all full of wind that wasn't there. The lady at the landing laughs a lot and won't let me on it, but I'm going to ask her every week until she does." } },
      choices = { { text = "Keep asking. She'll give in.", next = "BACK", fx = { affinity = 1 } } },
    },
    fall = {
      big = true,
      lines = { { id = "fa_default", text = "Brock says the island's breaking into pieces and it's going to fall right down on top of us. It won't, will it? You'd tell me if it would?" } },
      choices = {
        { text = "It might, but brave people are working to save it.", next = "BACK", reply = "Then I'll think about the brave people instead of the falling, and maybe one day I'll be brave too and fly up there to help them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Never. Nothing could knock that island down.", next = "BACK", reply = "I knew it, I knew Brock was making it up, and I'm going to tell him right now that you said so, and he'll have to say sorry.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne = {
      lines = { { id = "xs_default", text = "I knew it! Brock owes me his pudding, and I'm going to put you in tonight's story, if that's all right, as the one who floats down and saves everybody." } },
      choices = { { text = "I'd be honoured.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know that story yet. Will you tell it to me?" } },
  },
}

P:NPC {
  key = "dal_korben", id = TODO_NPC("Korben"), name = "Korben",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "anxious" }, values = { "careful" },
  notices = { "class" },

  impression = {
    first = "Korben paces the orphanage floor counting boards and listening for the lamps to flicker. He is a small boy carrying a guard's worries.",
    third = "{name} met Korben, a restless boy at the Dalaran Orphanage who keeps watch over the floorboards.",
  },

  greetings = {
    { id = "g_default", text = "Forty, forty-one... sorry, I'm counting." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "You've got armour! Are you here to guard us?" },
  },

  notice = {
    { id = "n_guard", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Do you know how to tell when something bad's coming? I've been practising, but I think you need a sword for the last part." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Forty-two, forty-three... oh, hello, I'm Korben, and I'm counting the boards. There are three that creak, so if anything ever sneaks in at night, I'll hear it, and I'll know exactly where it is." },
      },
      again = { { id = "h_again", text = "Anything else? I've lost count now, so I might as well talk." } },
      choices = {
        { text = "What do you think might sneak in?", next = "sneak" },
        { text = "Why do you pace so much?", next = "pace" },
        { text = "Keep counting, Korben.", next = "END" },
      },
    },
    sneak = {
      big = true,
      lines = { { id = "sn_default", text = "The magic things, the ones that got loose from the tower, because the lamps flickered all one night and nobody would say why. Paige says the magi have it all in hand, but she said it with her cooking face, which is the face she makes when she's worried." },
        { id = "sn_safe", when = { killed = { name = "Shade of the Archmage", min = 1 } }, text = "The lamps stopped flickering a while ago, and Brock says some adventurers went up the tower and stopped whatever it was. I still count the boards, though, just in case." } },
      choices = {
        { text = "You're safe. The magi guard this city well.", next = "BACK", reply = "Paige said that too, but you said it with your normal face and not your cooking face, so I think maybe I believe you a little bit more.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep listening. Grown-ups don't always know everything.", next = "BACK", reply = "I knew it, and I'm going to keep listening every night, and if the lamps flicker again I'll count every board until somebody tells me why.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pace = {
      lines = { { id = "pa_default", text = "Because when I sit still I start thinking, and when I walk I just count. Liam says I'll wear a hole in the floor, and then the boards won't creak at all, and that would be worse." } },
      choices = { { text = "Counting's a fine way to keep watch.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I only know about the floor, and the lamps." } },
  },
}

P:NPC {
  key = "dal_liam", id = TODO_NPC("Liam"), name = "Liam",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "cheerful" }, values = { "loyal" },
  notices = { "pet", "form" },

  impression = {
    first = "Liam and Luna the wolf are never more than an arm's length apart at the Dalaran Orphanage. He talks about her the way other boys talk about heroes.",
    third = "{name} met Liam, an orphanage boy in Dalaran, and Luna, the wolf who goes everywhere with him.",
  },

  greetings = {
    { id = "g_default", text = "Luna, sit! Sorry, she likes new people." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You've got a beast too! Does yours do tricks?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Can {pet} play with Luna? She's very gentle, she only knocks you over a little, and only when she's happy." },
  },

  react = {
    { id = "r_wolf", on = "form", when = { form = { "ghostwolf", "cat", "bear", "travel" } },
      text = "Whoa! Luna, look, look, it's a person and then it isn't! Can you teach her to do that?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Liam, and this is Luna, and she's a wolf, a real one, not a dog, even though she acts like a dog. She's my best friend, and Paige says she's allowed to stay as long as she doesn't eat the rabbits." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "You're a hunter! That means you've got a beast friend like Luna, right? When I'm big I'm going to be a hunter, and Luna's going to be my beast, and we'll go everywhere." },
      },
      again = { { id = "h_again", text = "Do you want to throw the stick for Luna? She won't bring it back, but she likes it." } },
      choices = {
        { text = "Where did you find Luna?", next = "luna" },
        { text = "She won't eat the rabbits?", next = "rabbits" },
        { text = "How do I make a beast my friend?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Look after her, Liam.", next = "END" },
      },
    },
    luna = {
      lines = { { id = "lu_default", text = "In the snow by the wall, when she was tiny and crying, and the guards said leave her, but I didn't. I carried her all the way here in my coat, and Paige shouted, and then she gave Luna some milk." } },
      choices = {
        { text = "You did the right thing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rabbits = {
      lines = { { id = "ra_default", text = "Never, because I told her they're family, and you don't eat family. Count Ash Bunnington comes down to sit on her paws, and she just sighs and lets him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "That's what I'm asking you! Do you just feed them, or do you have to be very brave and look them in the eye for a long time? I've been looking Luna in the eye all week." } },
      choices = {
        { text = "Patience and kindness. You're already doing it.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, but Luna might. Ask her! She won't answer, though." } },
  },
}

P:NPC {
  key = "dal_lilly", id = TODO_NPC("Lilly"), name = "Lilly",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "shy" }, values = { "gentle" },
  notices = { "race" },

  impression = {
    first = "Lilly is the newest and smallest child at the Dalaran Orphanage, come all the way from Stormwind. She is shy until she finds out you know her old city.",
    third = "{name} met Lilly, the youngest child at the Dalaran Orphanage, newly arrived from Stormwind.",
  },

  greetings = {
    { id = "g_default", text = "Hello. I'm not supposed to talk to strangers." },
    { id = "g_human", when = { race = "Human" }, text = "Are you from Stormwind? You look like you might be." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human", faction = "Alliance" },
      text = "Do you know the canals in Stormwind? We used to throw bread to the ducks there, and there aren't any ducks here, only rabbits." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Lilly, and I'm the newest, so I don't know where everything is yet. I came all the way from Stormwind in a cart, and it was very cold, and the mountains were bigger than the cathedral." },
      },
      again = { { id = "h_again", text = "Is there something else? The Countess is waiting for me." } },
      choices = {
        { text = "Do you miss Stormwind?", next = "stormwind" },
        { text = "Do you like it here?", next = "here" },
        { text = "I'm from Stormwind too.", next = "xhuman", when = { race = "Human" } },
        { text = "Goodbye, Lilly.", next = "END" },
      },
    },
    stormwind = {
      lines = { { id = "sw_default", text = "A little, the ducks and the bells, mostly. But there were lots and lots of us there and not enough beds, and here I've got a whole bed and a rabbit who likes me." } },
      choices = { { text = "That sounds like a good trade.", next = "BACK", fx = { affinity = 1 } } },
    },
    here = {
      lines = { { id = "he_default", text = "Yes, because Countess Bunidict likes me best, and she bites everybody else. Dallas says that means she's chosen me, and you can't un-choose somebody once you have." } },
      choices = { { text = "Then you're very lucky.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhuman = {
      lines = { { id = "xh_default", text = "Do you know the bells? The big ones at the cathedral, at dinnertime? I listen for them here, but they never ring, so Josie rings a spoon on a pot for me instead." } },
      choices = { { text = "I'll listen for them for you, next time I'm home.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I'm new." } },
  },
}

P:NPC {
  key = "dal_cody", id = TODO_NPC("Cody"), name = "Cody", title = "Baker",
  bible = "bibles/orphanage.md", role = "vendor", tier = "service",
  communities = { "dalaran", "dal_orphanage", "kirin_tor" }, temper = { "warm", "jovial" }, values = { "generous" },

  impression = {
    first = "Cody bakes for the Dalaran Orphanage and sells the extra loaves to buy more flour, which, by his reckoning, makes every customer a benefactor. He smells of yeast and laughs easily.",
    third = "{name} met Cody, the baker who keeps the Dalaran Orphanage in bread.",
  },

  greetings = {
    { id = "g_default", text = "Fresh bread, still warm! Every loaf you buy feeds a child." },
    { id = "g_morning", when = { timeOfDay = "dawn" }, text = "Up with the bakers, are you? First batch is just out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cody, baker to the orphanage and anyone else with an appetite. I bake for the children first, and whatever's left I sell, and the coin buys the next sack of flour, so you might say you're feeding a small army." },
      },
      again = { { id = "h_again", text = "Anything else, friend? The pie's cooling, so I've a minute." } },
      choices = {
        { text = "Mulgore Spice Bread, in Dalaran?", next = "mulgore" },
        { text = "How many children live here?", next = "children" },
        { text = "Let me see your bread.", next = "BUSINESS" },
        { text = "Good day, Cody.", next = "END" },
      },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "Got the recipe from a trader who'd been further west than I'll ever go, and the children like it better than anything I make on my own. I don't ask where my spices come from, and they don't ask where the bread does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    children = {
      lines = { { id = "ch_default", text = "More than there are chairs, and fewer than there were after the fall, thank the Light. Some find families, some find trades, and a few, like Brock, find their way into the Kirin Tor's good graces by sheer nerve." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Bread, pie and cornbread, and none of it lasts long with this lot about." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me about dough." } },
  },
}

P:NPC {
  key = "dal_paige", id = TODO_NPC("Paige"), name = "Paige", title = "Chef",
  bible = "bibles/orphanage.md", role = "vendor", tier = "service",
  communities = { "dalaran", "dal_orphanage", "kirin_tor" }, temper = { "brisk", "warm" }, values = { "dutiful" },
  notices = { "profession" },

  impression = {
    first = "Paige runs the Dalaran Orphanage kitchen with a ladle in one hand and a child in the other, and sells spices and firewood on the side. Her prices are set, and she says so before you can ask.",
    third = "{name} met Paige, the chef who runs the kitchen at the Dalaran Orphanage.",
  },

  greetings = {
    { id = "g_default", text = "Best supplies in the city, and the prices don't move." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Mind the cats, and don't touch my stockpot." },
  },

  notice = {
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "You cook, don't you? You've the burn on your thumb that we all get. Take a sagefish recipe, if you've not got one; they're the only fish the children will eat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Paige, and this is my kitchen, so mind the cats and the children, in that order. I sell good supplies, tested and honest, at a fair price that stays put, and if you want to haggle, go and find a goblin." },
      },
      again = { { id = "h_again", text = "Something else? The soup won't stir itself, and the children won't stop asking about it." } },
      choices = {
        { text = "Mind the cats?", next = "cats" },
        { text = "How do you feed so many children?", next = "feed" },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Good day, Paige.", next = "END" },
      },
    },
    cats = {
      lines = { { id = "ca_default", text = "Nyx and Roger, and they think the kitchen's theirs and I'm the help. Between them, a wolf and four rabbits, this is less an orphanage than a menagerie with children in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feed = {
      lines = { { id = "fe_default", text = "Cody's bread, my soup, and a lot of sagefish, because the Kirin Tor pay for the roof but not the larder. I came here from Stromgarde after the wars, and I've fed soldiers on less, but soldiers don't ask for second helpings of pie." } },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Spices, flour, wood and fish recipes. Everything a kitchen needs, and nothing it doesn't." } },
    _none = { { id = "tp_none", text = "No idea, and I've soup on. Ask someone without a stockpot." } },
  },
}
