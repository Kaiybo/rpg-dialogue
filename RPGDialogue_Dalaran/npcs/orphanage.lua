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
    first = "He watches the little ones as if somebody gave him the job.",
    third = "{name} met Brock, a boy at the Dalaran Orphanage who means to be an archmage.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! I've been keeping everyone in line upstairs, just like a real captain would." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'm in charge up here, and I say you can't come up." },
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
        { text = "What do you know about the Kirin Tor?", next = "kirin" },
        { text = "Who are the little ones you watch?", next = "little" },
        { text = "Can you do any magic yet?", next = "spell" },
        { text = "You keep staring at me, Brock.", next = "xdead", when = { race = "Scourge" } },
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
    kirin = {
      lines = {
        { id = "ki_default", text = "I know nearly everything, because I listen at the bakery window. They're the wizards who run Dalaran, and there's a council, and nobody will tell you who's on it, which Paige says is how you know it's important." },
        { id = "ki_horde", when = { faction = "Horde" }, text = "You're from the Horde, aren't you? Paige says the Archmage let your lot in because the city needed every pair of hands, and she says it in the voice that means don't argue." },
      },
      choices = {
        { text = "Have you ever been inside the Violet Citadel?", next = "kirin2" },
        { text = "Archmage Celindra didn't smile once when I met her.", next = "kirin_cel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kirin_cel = {
      lines = { { id = "kc_default", text = "She never does, not even at Lilly, and everybody smiles at Lilly. Cody says she lost her best friend when the city fell and she's been busy ever since, so she hasn't had time to remember how." } },
      choices = { { text = "Then be patient with her. Something else.", next = "BACK" } },
    },
    kirin2 = {
      lines = { { id = "k2_default", text = "Once, as far as the bottom stair, before a guard picked me up by the collar and carried me home like a sack of flour. He said the upper floors weren't safe since the crash, and I said I wasn't scared, and he said that was exactly the trouble." } },
      choices = {
        { text = "What crash?", next = "kirin3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kirin3 = {
      lines = {
        { id = "k3_default", text = "Something broke right at the top, in the parlor, and every lamp in the city went wrong at once, and Korben didn't sleep for a week. The magi said it was in hand, but I watched the big apprentices carry the hurt ones down the stairs, so it wasn't in very much hand." },
        { id = "k3_shade", when = { killed = { name = "Shade of the Archmage", min = 1 } }, text = "They say some adventurers went all the way up and stopped whatever it was, and the lamps have been good ever since. When I'm in the Kirin Tor, I'm going to be the one who goes up first, before the adventurers even get their boots on." },
      },
      choices = {
        { text = "One day you will be, Brock.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    little = {
      lines = { { id = "li_default", text = "Korben, who counts the floor, and Lilly, who's new and cries at night but says she doesn't, and Dallas, who's only with the rabbits. Josie says she isn't little, but she still needs watching, because she keeps trying to get onto the sky ship." } },
      choices = {
        { text = "Lilly cries at night?", next = "little2" },
        { text = "You care about them more than you let on.", next = "little_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    little2 = {
      lines = { { id = "l2_default", text = "Only the first nights, and only a little, and I told her the bells in Stormwind are just resting. Now Josie rings a spoon on a pot at supper so Lilly's got bells here too, which was my idea, except Josie says it was hers." } },
      choices = {
        { text = "It was a kind idea, whoever had it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    little_care = {
      lines = { { id = "lc_default", text = "I don't care, I'm in charge, and that's different. Somebody has to count heads at bedtime, and Paige has the soup to watch, so it's me." } },
      choices = { { text = "That's what caring looks like, Brock.", next = "BACK", fx = { affinity = 1 } } },
    },
    spell = {
      lines = { { id = "sp_default", text = "Not properly, not yet, but I stared at a candle once until my eyes hurt and I think it flickered. Paige said that was the draught from the window, and then she shut the window, so now we'll never know." } },
      choices = {
        { text = "Who'll teach you, without a master?", next = "spell2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spell2 = {
      big = true,
      lines = { { id = "s2_default", text = "I'm going to ask an archmage to take me the day I turn twelve, and if she says no, I'll ask the next one, because there are lots of archmagi and I only need one. Or I could just find the books myself, there are ever so many lying about since the crash. Which would you do?" } },
      choices = {
        { text = "Wait until a master chooses you. That's the proper way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait for permission. Find the books yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdead = {
      lines = { { id = "xd_default", text = "Sorry, I'm not supposed to, because Paige says the ones who come in now are guests of the Archmage and I have to be polite. Did it hurt, being dead? You don't have to say, Josie only told me to ask." } },
      choices = {
        { text = "It's not something I'd wish on you, Brock.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    kirin_tor = { { id = "tp_kirin", text = "The Kirin Tor are the best wizards in the whole world, and I'm going to be one, so you'd better be nice to me now while it's cheap." } },
    dalaran = { { id = "tp_dalaran", text = "It's the best city there is, and it's got a purple roof, and when I'm grown I'm going to fix every bit that's still broken." } },
    _none = { { id = "tp_none", text = "I don't know that one, but when I'm in the Kirin Tor I'll know everything." } },
  },
}

P:NPC {
  key = "dal_dallas", id = TODO_NPC("Dallas"), name = "Dallas",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "earnest", "gentle" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "He knows each rabbit's title, temper and favourite cushion.",
    third = "{name} met Dallas, the boy who looks after the rabbits at the Dalaran Orphanage.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! The Baron's awake, so you can say hello if you're very, very gentle." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Please go away. The Baron doesn't like you, and I don't think I do either." },
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
        { text = "How do you look after them all?", next = "care" },
        { text = "The kitchen cats must want them badly.", next = "cats" },
        { text = "I'm a hunter. Rabbits don't worry me.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I could take a rabbit's shape, you know.", next = "xdruid", when = { class = "DRUID" } },
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
    care = {
      lines = { { id = "ca_default", text = "Clover and carrot tops and the crusts Cody saves, only the crusts, because Paige says bread's bad for them. The Baron eats first because he's the Baron, and if anybody eats before him he thumps his foot until the whole floor shakes." } },
      choices = {
        { text = "So the Baron rules the others?", next = "care2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care2 = {
      lines = { { id = "c2_default", text = "He thinks he does, but really the Duchess does, because she sits wherever she likes and he has to go round her. Josie says that's how it works in real castles too, and she read it in a book, so it must be true." } },
      choices = {
        { text = "What happens when one of them gets sick?", next = "care3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care3 = {
      lines = { { id = "c3_default", text = "The Countess was sick once and wouldn't eat, and I sat up with her for three whole nights. Then an apprentice from the garden came and said she'd nibbled one of the glowing flowers, and he made her well, and I wrote him a letter to say thank you with all the words spelled right." } },
      choices = {
        { text = "You're a good keeper, Dallas.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cats = {
      lines = { { id = "ct_default", text = "Nyx and Roger want them ever so badly, but Paige keeps the stair door shut, and the Countess bit Roger on the nose once anyway. Now he just sits on the bottom step and looks sad about it." } },
      choices = {
        { text = "So a rabbit outranks a cat.", next = "cats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cats2 = {
      lines = { { id = "t2_default", text = "Everybody outranks Roger, even Luna, and Luna's the nicest of all of them. Nyx is cleverer, though, and I think she's only waiting, so I check the door twice." } },
      choices = { { text = "Check it three times, to be safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Are you going to tame something? Please don't tame a rabbit, because they don't like travelling, and they get very upset in bags." } },
      choices = { { text = "I'll leave the rabbits in your care, Dallas.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdruid = {
      lines = { { id = "xr_default", text = "Could you, really? Could you be a rabbit just for a minute, so the Baron has somebody to talk to who isn't me? He'd want you to bow first, though, because of the title." } },
      choices = { { text = "Another time, and I'll bow properly.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran is very big, and the rabbits have never seen most of it, which is all right, because they'd only bite it." } },
    _none = { { id = "tp_none", text = "I don't know, but I can tell you what the Countess thinks of it, which is bite it." } },
  },
}

P:NPC {
  key = "dal_josie", id = TODO_NPC("Josie"), name = "Josie",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "cheerful", "chatty" }, values = { "curious" },
  notices = { "skyborne" },

  impression = {
    first = "She wants to ride the skycutter more than she wants anything.",
    third = "{name} met Josie, a girl at the Dalaran Orphanage who dreams of the sky island.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Sit down, sit down, because I saved the best bit of the story for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not telling you any stories today, so you needn't sit down." },
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
        { id = "h_dd_gilded", when = { questDone = TODO_QUEST("Opportunistic Education") },
          text = "Brock says Rexxie the goblin has a golden book, and that you're the one who gave it to her! I put it in tonight's story, except in my story it's magic, and it flies." },
      },
      again = { { id = "h_again", text = "What else? The fire's warm and I'm not sleepy at all." } },
      choices = {
        { text = "Have you ever seen the sky ship?", next = "ship" },
        { text = "Will the island in the sky fall down?", next = "fall" },
        { text = "It's true about the floating, more or less.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Tell me tonight's story.", next = "story" },
        { text = "Who's the lady at the landing?", next = "laurain" },
        { text = "Do the others like your stories?", next = "others" },
        { text = "I could build you a flying machine.", next = "xgnome", when = { race = "Gnome" } },
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
    story = {
      lines = { { id = "st_default", text = "Once upon a time there was a girl called Josie who lived in a city with a purple roof, and one night a ship came out of the clouds with no ropes holding it up at all. Do you want the next bit? It's the best bit." } },
      choices = {
        { text = "Go on, then.", next = "story2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story2 = {
      lines = {
        { id = "s2_default", text = "She hid in a barrel of apples on the landing, and the ship went up with a bump, and when she climbed out there were islands floating all round like dumplings in a pot. The Skyborne were very surprised, but they were kind, and they let her stay." },
        { id = "s2_skyborne", when = { race = "Skyborne" }, text = "She hid in a barrel of apples, and the ship went up with a bump, and the first Skyborne to find her looked exactly like you. I'm not changing that bit, so don't ask me to." },
      },
      choices = {
        { text = "And did she ever come home?", next = "story3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story3 = {
      big = true,
      lines = { { id = "s3_default", text = "That's the part I haven't decided, because if she stays she gets to float, but she promised Lilly she'd be back for supper. What do you think she ought to do?" } },
      choices = {
        { text = "Come home. A promise to a friend comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stay. Nobody gets a second chance at the sky.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    laurain = {
      lines = { { id = "la_default", text = "Arcanist Laurain, and she laughs every time I ask, and then she says the ride is bumpy and goes between the planes and I'm too small to hold on. I'm not too small, I'm nearly as tall as the railing." } },
      choices = {
        { text = "Between the planes? What does that mean?", next = "laurain2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    laurain2 = {
      lines = { { id = "l2_default", text = "Brock says it means the ship goes somewhere in the middle of the sky where there's no up and no down, and everybody's sick over the side. I think he made it up, but Laurain said the bit about being sick was true." } },
      choices = {
        { text = "Maybe wait until you're a little taller.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Lilly likes them, and Dallas likes them if there are rabbits in them, and Korben only listens to the endings to check everybody's safe. Brock pretends he isn't listening, but he always is, because he asks what happened next." } },
      choices = {
        { text = "Do you ever tell sad stories?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = { { id = "o2_default", text = "Never at bedtime, because Korben won't sleep, and Paige says the world has enough sad ones already. I'm saving those for when I'm grown up and I can make them come out all right." } },
      choices = { { text = "That's a good plan, Josie.", next = "BACK", fx = { affinity = 1 } } },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Could you, really? Only a small one, just big enough for me, and Lilly too if she sits very still, and it doesn't need to go far, only up past the Citadel and back." } },
      choices = { { text = "Gnomish flying machines do tend to explode, Josie.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran's the city where the sky ship lands, which makes it the best city, even if they won't let me on." } },
    _none = { { id = "tp_none", text = "I don't know that story yet. Will you tell it to me?" } },
  },
}

P:NPC {
  key = "dal_korben", id = TODO_NPC("Korben"), name = "Korben",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "anxious" }, values = { "careful" },
  notices = { "class" },

  impression = {
    first = "He is a small boy carrying a guard's worries.",
    third = "{name} met Korben, a restless boy at the Dalaran Orphanage who keeps watch over the floorboards.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! I counted every day you were gone, and it was a lot, but you came back anyway!" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You were mean last time, and I counted it, so I'm going to tell someone." },
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
        { text = "Which boards creak?", next = "boards" },
        { text = "Tell me about the night the lamps flickered.", next = "lamps" },
        { text = "You'd make a good guard one day.", next = "grow" },
        { text = "Want to learn how a soldier keeps watch?", next = "xguard", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I could cross this floor without a creak.", next = "xrogue", when = { class = "ROGUE" } },
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
    boards = {
      lines = { { id = "bo_default", text = "The ninth one from the door, the one under Lilly's bed, and the one at the top of the stairs, which is the loudest. I put a tiny chalk mark on each of them, so small that nobody can see it but me." } },
      choices = {
        { text = "What if something steps over them?", next = "boards2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boards2 = {
      lines = { { id = "b2_default", text = "Then I'd hear the rabbits, because the Baron thumps his foot whenever a stranger comes upstairs, so that's a second watch. Dallas says I'm using his rabbits for guards, and I said they're everybody's rabbits." } },
      choices = {
        { text = "And if the rabbits sleep through it?", next = "boards3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boards3 = {
      lines = { { id = "b3_default", text = "Then there's Luna, and Luna never sleeps all the way, she keeps one ear up, Liam showed me. So that's three watches, which is more than the Citadel has, probably." } },
      choices = {
        { text = "That's a better watch than many towns keep.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamps = {
      lines = { { id = "la_default", text = "All the lamps on our street went blue, and then out, and then blue again, and there was a sound like somebody humming very low under the floor. Paige hung a blanket over the window so we couldn't see, but I could still hear it." } },
      choices = {
        { text = "Did anyone tell you what it was?", next = "lamps2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamps2 = {
      lines = {
        { id = "l2_default", text = "A guard told Paige it came from the very top of the Violet Citadel, and Paige said not in front of the children, so I only heard the first half. I made up the second half myself, and it's probably worse than the real one." },
        { id = "l2_shade", when = { killed = { name = "Shade of the Archmage", min = 1 } }, text = "It came from the top of the Violet Citadel, and you went up there, didn't you? Brock says so. Was it as bad as the half I made up, or worse?" },
      },
      choices = {
        { text = "The real thing is usually less frightening.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "gr_default", text = "A guard on the walls, with a lantern that never flickers, or one of the magi who walk round checking the wards at night. Brock says Archmage Celindra checks them every single night, so she must be the bravest one of all." } },
      choices = {
        { text = "Why not be a soldier somewhere far away?", next = "grow2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow2 = {
      lines = { { id = "g2_default", text = "Because if I'm here, I'll know everybody's all right, and if I go away, I won't know. I'd rather keep watch over a few people properly than a whole kingdom badly." } },
      choices = {
        { text = "That's wiser than most generals, Korben.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xguard = {
      lines = { { id = "xg_default", text = "Yes, please! Do you stand still for hours, or do you walk about? I can't decide which is better, because standing still is quieter, but walking means you see more." } },
      choices = { { text = "Walk your rounds, and stop where it's darkest.", next = "BACK", fx = { affinity = 2 } } },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "You couldn't, nobody can, not even Josie, and she's very sneaky about getting to the window. Will you try? Only not at night, because I'd scream." } },
      choices = { { text = "Your boards would catch me. Well done.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran has a great many lamps, and I know which ones on our street flicker, which is three." } },
    _none = { { id = "tp_none", text = "I don't know. I only know about the floor, and the lamps." } },
  },
}

P:NPC {
  key = "dal_liam", id = TODO_NPC("Liam"), name = "Liam",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "cheerful" }, values = { "loyal" },
  notices = { "pet", "form" },

  impression = {
    first = "He talks about his wolf Luna the way boys talk about heroes.",
    third = "{name} met Liam, an orphanage boy in Dalaran, and Luna, the wolf who goes everywhere with him.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Luna, look who it is! She's wagging so hard, and I think that means she missed you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Luna, stay by me. I don't think we like this one very much." },
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
        { text = "What tricks does Luna know?", next = "tricks" },
        { text = "Why do you want to be a hunter?", next = "hunter" },
        { text = "She's growing. She won't be a pup much longer.", next = "wild" },
        { text = "I can run as a wolf myself.", next = "xshape", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "Back home, orcs ride wolves into battle.", next = "xorc", when = { race = "Orc" } },
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
      lines = { { id = "xh_default", text = "Yes, please! Do you just feed them, or do you have to be very brave and look them in the eye for a long time? I've been looking Luna in the eye all week." } },
      choices = {
        { text = "Patience and kindness. You're already doing it.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    tricks = {
      lines = { { id = "tr_default", text = "She can sit, if she feels like it, and lie down, which she always feels like, and she can find anybody in the whole orphanage by sniffing their sock. I hid Brock's sock in the flour once, and she found it, and then Paige found us." } },
      choices = {
        { text = "What happened then?", next = "tricks2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tricks2 = {
      lines = { { id = "t2_default", text = "We had to sweep the whole kitchen, and Luna had to have a bath, and she looked at me the whole time like I'd done it to her on purpose. Which I had, but only a little bit." } },
      choices = { { text = "Worth it, I'd say.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Because hunters get to go everywhere and they always have a friend with them, so they're never on their own. And you don't have to read big books like the magi, which is good, because I'm not very good at the long words." } },
      choices = {
        { text = "Where would you go first?", next = "hunter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter2 = {
      lines = { { id = "h2_default", text = "Mulgore, because Cody's spice bread comes from there and Josie says the tauren have kodos as big as houses. Then the snow, to see where Luna came from, and then everywhere else after that." } },
      choices = { { text = "Take Luna, and you'll never get lost.", next = "BACK", fx = { affinity = 1 } } },
    },
    wild = {
      big = true,
      lines = { { id = "wi_default", text = "Paige says one day Luna will want to go back to the snow and I'll have to let her. I don't think she ever will, but if she did want to, would that be all right?" } },
      choices = {
        { text = "She chose you, Liam. This is her home now.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If she wants the wild, love means letting her go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Has she ever tried to leave?", next = "wild2" },
      },
    },
    wild2 = {
      lines = { { id = "w2_default", text = "Once, the night the lamps went wrong, she howled at the window till morning and scratched at the door. But when I woke up she was asleep on my feet, so I think she was only telling the magic to go away." } },
      choices = { { text = "Sounds like she was guarding you.", next = "BACK", fx = { affinity = 1 } } },
    },
    xshape = {
      lines = { { id = "xs_default", text = "You can turn into a wolf? Could you do it now, please, so Luna has a friend her own size? She'd be so pleased, I just know she would." } },
      choices = { { text = "Maybe outside, where there's room to run.", next = "BACK", fx = { affinity = 2 } } },
    },
    xorc = {
      lines = { { id = "xo_default", text = "Real big ones, with saddles and everything? Do you think Luna would let me sit on her if I was very light and didn't kick?" } },
      choices = { { text = "She'd need to grow a good deal first, Liam.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran's got lots of cats and only one wolf, and she's mine, so it's the best city." } },
    _none = { { id = "tp_none", text = "I don't know, but Luna might. Ask her! She won't answer, though." } },
  },
}

P:NPC {
  key = "dal_lilly", id = TODO_NPC("Lilly"), name = "Lilly",
  bible = "bibles/orphanage.md", role = "child", tier = "service",
  communities = { "dalaran", "dal_orphanage" }, temper = { "shy" }, values = { "gentle" },
  notices = { "race" },

  impression = {
    first = "She is shy until she learns you know Stormwind.",
    third = "{name} met Lilly, the youngest child at the Dalaran Orphanage, newly arrived from Stormwind.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back. I kept a secret just for you, but you have to promise not to tell anyone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not supposed to talk to strangers, and you're worse than a stranger." },
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
        { text = "That was a long way to come in a cart.", next = "journey" },
        { text = "Tell me about the Countess.", next = "countess" },
        { text = "Do you still feel sad sometimes?", next = "cry" },
        { text = "Those tunnels under the mountains? That's my home.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I've rung those cathedral bells myself, Lilly.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" }, faction = "Alliance" } },
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
    journey = {
      lines = { { id = "jo_default", text = "It took ever so long, and the driver sang the same song the whole way, and he only knew one verse. We went through a big tunnel under the mountains where the dwarves live, and it was warm in there and smelled like bread and smoke." } },
      choices = {
        { text = "And after the tunnel?", next = "journey2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journey2 = {
      lines = { { id = "j2_default", text = "Rain, for days and days, through a wet place full of frogs, and then a boat, and then mountains with snow on top like sugar. I was sick on the boat, but only once, and the man said once didn't count." } },
      choices = {
        { text = "Who brought you here in the end?", next = "journey3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journey3 = {
      lines = { { id = "j3_default", text = "A lady from the church with a list, and she said my name very carefully when she gave me to Paige. Paige said welcome home, Lilly, and I said it isn't home, and she said, not yet." } },
      choices = {
        { text = "It will be, Lilly. Give it time.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    countess = {
      lines = { { id = "co_default", text = "She's grey and white and one of her ears won't stand up, and she bites Brock and Dallas and even Paige, but never me. I sit very, very still, and she comes and sits on my feet, and that's how you know." } },
      choices = {
        { text = "How did she choose you?", next = "countess2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    countess2 = {
      lines = { { id = "c2_default", text = "The first night, when I was crying, she came out from under the bed and sat right on my pillow, and nobody told her to. Dallas says she's never done that for anybody, not even him, and he's in charge of her." } },
      choices = { { text = "She knew who needed her.", next = "BACK", fx = { affinity = 2 } } },
    },
    cry = {
      big = true,
      lines = { { id = "cr_default", text = "Sometimes, at night, but Brock says big girls don't cry, and I'm trying very hard to be a big girl. Is that true, that big people never cry?" } },
      choices = {
        { text = "Everyone cries, Lilly. There's no shame in it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Brave people keep their tears where nobody sees.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "You live there? It smelled like bread and it was warm, and I wanted to stay, but the cart kept going. Do you have ducks in the tunnel?" } },
      choices = { { text = "No ducks, but plenty of warm bread. Come visit.", next = "BACK", fx = { affinity = 2 } } },
    },
    xpriest = {
      lines = { { id = "xp_default", text = "Have you really? A priest gave me a blessing before I left, and she said the Light goes everywhere, even all the way to Dalaran. Does it, truly?" } },
      choices = { { text = "It does, Lilly. Even here.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran is cold and purple, and it doesn't have any bells, but it's got the Countess, so it's all right." } },
    _none = { { id = "tp_none", text = "I don't know. I'm new." } },
  },
}

P:NPC {
  key = "dal_cody", id = TODO_NPC("Cody"), name = "Cody", title = "Baker",
  bible = "bibles/orphanage.md", role = "vendor", tier = "service",
  communities = { "dalaran", "dal_orphanage", "kirin_tor" }, temper = { "warm", "jovial" }, values = { "generous" },

  impression = {
    first = "By his reckoning, every customer is a benefactor.",
    third = "{name} met Cody, the baker who keeps the Dalaran Orphanage in bread.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's one of my best benefactors! Come in, the loaves are still warm and the children are fed." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Bread's bread, and I'll sell it to anyone, but I won't pretend I'm happy to see you." },
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
        { text = "Bread that feeds an orphan is worth paying full price for.", next = "BACK", reply = "Bless you for it! Every coin in that jar goes upstairs to the little ones.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charity's just a fine way to dress up a markup.", next = "BACK", reply = "Ha! Maybe so, but the children eat either way, and I'll sleep fine tonight.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Mulgore Spice Bread, in Dalaran?", next = "mulgore" },
        { text = "How many children live here?", next = "children" },
        { text = "When does a baker's day start?", next = "day" },
        { text = "Which loaf do the children like best?", next = "pie" },
        { text = "The Kirin Tor ought to fill your larder.", next = "kirin" },
        { text = "Mulgore Spice Bread? That's my people's recipe.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Any tips, from one cook to another?", next = "xcook", when = { profession = "Cooking" } },
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
      choices = {
        { text = "Brock, in the Kirin Tor's good graces?", next = "children2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children2 = {
      lines = { { id = "c2_default", text = "He marched up to an archmage in the street and asked to be her apprentice, bold as a bishop. She told him to come back when he could spell thaumaturgy, and he's been practising it in the flour on my table ever since." } },
      choices = {
        { text = "Can he spell it yet?", next = "children3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children3 = {
      lines = { { id = "c3_default", text = "Nearly, and he'll get there, because that boy doesn't know the word no unless it's coming out of his own mouth. I'd not bet against him, and I've not bet against anything in this kitchen since the wolf moved in." } },
      choices = {
        { text = "My coin's on Brock too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    day = {
      lines = { { id = "da_default", text = "Long before dawn, with the ovens lit and the cats underfoot and the whole street still dark. By the time the children wake there's warm bread on the table, and a little left over for the window." } },
      choices = {
        { text = "Who buys from the window?", next = "day2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    day2 = {
      lines = { { id = "d2_default", text = "Masons off the night shift, white with stone dust and hungry as bears, and apprentices who forgot to eat because they were reading. Now and then an archmage, too, who pays in exact coin and never stops to chat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pie = {
      lines = { { id = "pi_default", text = "Cherry pie, every last one of them, though Liam swears it's the banana bread and Lilly won't touch anything that isn't plain. The cherries come up from Hillsbrad when the roads are kind, and when they aren't, the whole house sulks for a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kirin = {
      big = true,
      lines = { { id = "kr_default", text = "They pay for the roof, and it's a good roof, but the larder runs on the window and on kind folk. Some say the magi owe these children more, since a magus's treachery is what brought the city down, and some say charity's a gift and not a debt. Which do you hold with?" } },
      choices = {
        { text = "The Kirin Tor owe them. Let the council pay its debt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Kindness given freely is worth more than any council's coin.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Is it, now! Then tell me true, friend, is my spice bread anywhere near the real thing? I've only a trader's word and a guess about the cinnamon." } },
      choices = {
        { text = "Close enough to make a tauren homesick.", next = "BACK", fx = { affinity = 2 } },
        { text = "Less cinnamon, more patience. Something else.", next = "BACK" },
      },
    },
    xcook = {
      lines = { { id = "xc_default", text = "A cold hand for the pastry and a hot oven for the bread, and never let Paige catch you using her flour. She counts it, you know, by the pinch." } },
      choices = { { text = "I'll bring my own flour.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Bread, pie and cornbread, and none of it lasts long with this lot about." } },
    kirin_tor = { { id = "tp_kirin", text = "The Kirin Tor keep the roof over these children's heads, and I'll thank them for it. The larder's my concern, and I'd not trust a wizard with an oven anyway." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's getting back on its feet, one loaf at a time. The masons build it and I feed the masons, so I'd say I'm doing my bit." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me about dough." } },
  },
}

P:NPC {
  key = "dal_paige", id = TODO_NPC("Paige"), name = "Paige", title = "Chef",
  bible = "bibles/orphanage.md", role = "vendor", tier = "service",
  communities = { "dalaran", "dal_orphanage", "kirin_tor" }, temper = { "brisk", "warm" }, values = { "dutiful" },
  notices = { "profession" },

  impression = {
    first = "Her prices are set, and she says so before you can ask.",
    third = "{name} met Paige, the chef who runs the kitchen at the Dalaran Orphanage.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Mind the cats and come in; the stockpot's on and the prices haven't moved an inch." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The prices are fixed, and so is my opinion of you. Buy what you need and be on your way." },
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
        { text = "Fixed prices are fair to everyone, rich or poor.", next = "BACK", reply = "That's exactly why I set them, and I'm glad someone finally understands it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fixed prices are for cooks who can't haggle.", next = "BACK", reply = "Then find a cook who'll haggle with you, and see how her soup tastes.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Mind the cats?", next = "cats" },
        { text = "How do you feed so many children?", next = "feed" },
        { text = "Why won't your prices move?", next = "prices" },
        { text = "How are the children keeping?", next = "kids" },
        { text = "You must have cooked for soldiers in your time.", next = "strom" },
        { text = "A Stromgarde woman, serving the Horde?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Any advice, one cook to another?", next = "xcook", when = { profession = "Cooking" } },
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
    strom = {
      lines = { { id = "st_default", text = "In Stromgarde, aye, for the garrison, when there were trolls in the hills before there were ever orcs. You learn to stretch a pot there, because the supply carts are always late and the soldiers never are." } },
      choices = {
        { text = "Why did you leave?", next = "strom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strom2 = {
      lines = { { id = "s2_default", text = "After the wars the kingdom shrank to a fortress and a lot of empty fields, and the ogres and the Syndicate helped themselves to the rest of the Highlands. There wasn't much left to cook for, and the Kirin Tor were asking for anyone who could feed children." } },
      choices = {
        { text = "Do you miss it?", next = "strom3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strom3 = {
      lines = { { id = "s3_default", text = "I miss Stromgarde as it was, which is a place nobody can go back to, so I don't waste good soup on it. These children are what the wars left behind, and they're something I can actually do something about." } },
      choices = {
        { text = "And you're doing it well, Paige.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prices = {
      big = true,
      lines = { { id = "pr_default", text = "Because I'm feeding children, not playing at markets, and a price that wobbles means somebody's being cheated. Cody slips the poor ones a crust out the window and I let him, but my shelf costs what it costs, whoever's asking." } },
      choices = {
        { text = "Quite right. A fixed price is the honest one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A price ought to bend for those who can't pay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kids = {
      lines = { { id = "ki_default", text = "Fed, mostly clean, and loud, which is how children ought to be. It's the quiet ones I watch, and just now that's Korben, who's counting the floorboards again." } },
      choices = {
        { text = "Why does Korben count?", next = "kids2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kids2 = {
      lines = { { id = "k2_default", text = "Since the night the lamps went wrong and the city hummed like a struck bell, he keeps watch the only way a small boy can. I've told him the magi have it in hand, and I'll keep telling him until it's true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhorde = {
      lines = { { id = "xh_default", text = "I'm from Stromgarde, and I won't pretend I've forgotten what the Horde did in the Highlands. But the Archmage let you in, and you're in my kitchen, and in my kitchen you're a customer, so mind the cats like everybody else." } },
      choices = {
        { text = "Fair enough, Paige.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcook = {
      lines = { { id = "xc_default", text = "Salt early, taste often, and never cook angry, because the children can taste it every time. And keep sagefish off an open flame, or it'll fall apart on you like a politician's promise." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Spices, flour, wood and fish recipes. Everything a kitchen needs, and nothing it doesn't." } },
    stromgarde = { { id = "tp_strom", text = "Stromgarde was a proud kingdom once, and it's a proud fortress now, and pride doesn't fill a pot. I cooked there, and I cook here, and here the children eat." } },
    syndicate = { { id = "tp_syn", text = "Thieves in noble boots who took half the Highlands once the soldiers were gone. If one of them comes near my kitchen, he'll learn what a ladle's for." } },
    _none = { { id = "tp_none", text = "No idea, and I've soup on. Ask someone without a stockpot." } },
  },
}
