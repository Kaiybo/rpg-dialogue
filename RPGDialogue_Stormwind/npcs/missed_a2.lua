-- Stormwind folk the roster scan found missing (part 2 of 3): the Dwarven District's weaponsmith, a
-- journeyman at the forge, the mining supplier and a hunter trainer; two boys fishing the canals;
-- the Flintridge caretaker; the Blue Recluse's apprentice chef and its crier; the canal tailor's
-- husband; and the owner of Duncan's Textiles. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brandon: a boy fishing the Canals with Justin and Roman.
P:NPC {
  key = "brandon_canals", id = TODO_NPC("Brandon"), name = "Brandon", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "doubtful", "good-natured" }, values = { "friends" },
  notices = { "fishing" },
  impression = {
    first = "Brandon fishes the canals with Justin and Roman and spends most of his time telling Justin that can't be true. He wants very much for some of it to be true anyway.",
    third = "{name} met Brandon, a boy who fishes the canals with Justin and Roman.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! Do you want to see the thing I found? It's a secret." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not playing with you today." },
    { id = "g_default", text = "Hello! Are you here to fish too? You can, there's lots of room." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Justin's told three more stories since you left." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "Do you know how to fish properly? Roman says you have to spit on the hook, and I think he made that up." },
  },
  start = "hello",
  nodes = {
    yroman = {
      lines = {
        { id = "ybrandoncanals1", text = "He's the quiet one. He doesn't tell stories like Justin, but he once caught an eel as long as his arm, and he didn't even yell. His dad's a guard on the harbour wall, so Roman knows all the guards' names." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "ybrandoncanals2", text = "My mum sews sails for the ships, and my dad went to fight in the north before I was born. Mum says he's a hero, and the guards came once and gave her a letter and a medal in a box." },
        { id = "ybrandoncanals3", when = { class = { "WARRIOR", "PALADIN" } }, text = "You fight like my dad did, I bet. Mum keeps his medal in a box on the shelf." },
      },
      choices = {
        { text = "Do you miss him?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "ybrandoncanals4", text = "I don't remember him, so I don't know if it counts. Justin says I should be a soldier to make him proud, and Roman says I should do whatever I like. What do you think?" },
      },
      choices = {
        { text = "Be a soldier. Honour your father's memory.", next = "BACK", reply = "Maybe. I'd want a sword with a red handle, though.", fx = { align = { honor = 1 } } },
        { text = "Do what you like. That's what he fought for.", next = "BACK", reply = "That's what Mum says too. I think I'd like to make boats.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brandon, and that's Justin and that's Roman, and we fish here nearly every day. Justin knows a lot of stories, but I don't think all of them really happened." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not catching anything anyway." },
        { id = "h_again2", text = "You can ask another one." },
      },
      choices = {
        { text = "Which of Justin's stories don't you believe?", next = "stories" },
        { text = "Are there really crocolisks in the canals?", next = "crocs" },
        { text = "Do you ever catch anything?", next = "catch" },
        { text = "What would you do if Justin's stories were true?", next = "x_true" },
        { text = "You should believe your friends, Brandon.", next = "x_stance" },
        { text = "I'm a mage. Ask me what's true.", next = "x_mage", when = { class = "MAGE" } },
        { text = "Who's Roman?", next = "yroman" },
        { text = "What does your family do?", next = "yfamily" },
        { text = "Good fishing, Brandon.", next = "END" },
      },
    },
    stories = {
      lines = { { id = "s_default", text = "He said a wizard can turn into a raven, and he said Lord Lothar beat thirty-six orcs with just his hands. I said nobody could count that high in a fight, and he said Lothar could." } },
      choices = {
        { text = "Mages can do stranger things than that.", next = "mage", when = { class = { "MAGE", "DRUID" } } },
        { text = "Lothar was a great hero, whatever the count. Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "They can? Really and truly? Oh no, now I'll have to tell Justin he was right, and he'll never ever stop talking about it." } },
      choices = { { text = "You could keep it a secret. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crocs = {
      lines = { { id = "c_default", text = "Justin says somebody brought them from the swamp for pets and threw them in when they got big. I don't believe it, but I keep my feet out of the water, just in case." } },
      choices = { { text = "That's wise. Something else.", next = "BACK" } },
    },
    catch = {
      lines = { { id = "ca_default", text = "Little ones, sometimes, and we throw them back because my mum won't cook anything out of the canal. Roman caught a hat once, and he wore it all day even though it was wet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_true = {
      lines = {
        { id = "x_true_l0", text = "I'd want to see the raven wizard most, because then I'd know for certain. Only if he's real, he might not want to be seen, and then I'd never know at all." },
      },
      choices = {
        { text = "That's a clever worry. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "My dad says believe what you see and half of what you hear. Justin says that's no way to make friends." },
      },
      choices = {
        { text = "Trust your friends, even when the story's tall.", next = "BACK", reply = "All right, but only the stories that don't have thirty-six orcs.", fx = { align = { order = -1 } } },
        { text = "Your dad's right. Ask for proof.", next = "BACK", reply = "That's what I keep saying, and Justin keeps saying I'm no fun.", fx = { align = { order = 1 } } },
      },
    },
    x_mage = {
      lines = {
        { id = "x_mage_l0", text = "Then can a wizard turn into a raven, really? Don't laugh, I've got to know before Justin asks me again." },
      },
      choices = {
        { text = "Some can, and stranger things besides. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    justin = { { id = "ybrandoncanals5", text = "He tells stories. Some of them are even true, he says." } },
    roman = { { id = "ybrandoncanals6", text = "He's quiet and he caught an eel. His dad's a guard." } },
    background = { { id = "tp_bg", text = "I live near the canals, and Justin and Roman are my best friends. We're going to get a boat one day, when we've saved up." } },
    _none = { { id = "tp_none", text = "I don't know. Justin would say he knows, but he'd be making it up." } },
  },
}

-- Justin: the storyteller of the three boys fishing the Canals.
P:NPC {
  key = "justin_canals", id = TODO_NPC("Justin"), name = "Justin", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "boastful", "imaginative" }, values = { "stories" },
  notices = { "magic", "soldier" },
  impression = {
    first = "Justin fishes the canals with Brandon and Roman and knows a thrilling fact about everything, most of them from his cousin. He tells each one as though he had been standing there when it happened.",
    third = "{name} met Justin, a boy on the canals with a story about everything.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again! You're my favourite grown-up, but don't tell my mum." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Mum says I'm not to talk to you." },
    { id = "g_default", text = "Hey, do you want to know a secret? I know loads, and they're all true." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've got a new one, and it's the best one yet." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "You're a wizard! Can you turn into a raven? Brandon says nobody can, so do it now, quick, while he's looking!" },
    { id = "n_warrior", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Have you fought orcs? How many at once? Was it more than thirty-six?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Justin, and I know everything about Stormwind, because my cousin's in the guard and he tells me. Did you know there are crocolisks in this canal, right under where we're sitting?" },
      },
      again = {
        { id = "h_again", text = "Do you want to hear another one?" },
        { id = "h_again2", text = "I know more, loads more. Ask me!" },
      },
      choices = {
        { text = "Crocolisks, in the canal?", next = "crocs" },
        { text = "Tell me about Lothar and the orcs.", next = "lothar" },
        { text = "Your friend Brandon doesn't seem convinced.", next = "brandon" },
        { text = "What does your cousin in the guard really do?", next = "x_cousin" },
        { text = "A good story's worth more than a true one.", next = "x_stance" },
        { text = "I'm a guard's friend. Tell me a real secret.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Keep fishing, Justin.", next = "END" },
      },
    },
    crocs = {
      lines = { { id = "c_default", text = "Yes! Rich people got them from the swamp when they were babies, and then they got too big and bitey, so they threw them in here. My cousin's friend saw one eat a whole duck." } },
      choices = {
        { text = "Have you seen one yourself?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Well, I saw a log that moved, and it had eyes, sort of. Roman says it was only a log, but logs don't go against the water, do they?" } },
      choices = { { text = "Not often, no. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lothar = {
      lines = { { id = "l_default", text = "Lord Lothar killed thirty-six orcs with his bare hands, all in one go, because his sword was stuck in the thirty-seventh! That's why he's got the biggest statue, and it's all true." } },
      choices = { { text = "He was a great man. Something else.", next = "BACK" } },
    },
    brandon = {
      lines = { { id = "b_default", text = "Brandon never believes anything, not even the one about the old wizard who could turn into a raven. He'll be sorry when a crocolisk comes up and I'm the only one who's ready for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_cousin = {
      lines = {
        { id = "x_cousin_l0", text = "He stands at the gate by the Valley of Heroes and checks wagons for Defias, and once he found a whole barrel of swords under the turnips. He says the farmer cried, which I think means he was guilty." },
      },
      choices = {
        { text = "Or frightened. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "My cousin says a good story is how you get people to listen, and then you tell them the true part. Roman says I never get to the true part." },
      },
      choices = {
        { text = "Tell it big. People remember the big ones.", next = "BACK", reply = "That's what I say! Roman, did you hear that?", fx = { align = { honor = -1 } } },
        { text = "Stick to the truth, Justin, or nobody will trust you.", next = "BACK", reply = "Oh. Well, I'll try, only the true ones are shorter.", fx = { align = { honor = 1 } } },
      },
    },
    x_rogue = {
      lines = {
        { id = "x_rogue_l0", text = "A real one? The guards change at the Trade District gate when the Cathedral bells ring, and for a minute nobody's looking. I shouldn't have told you that." },
      },
      choices = {
        { text = "I'll forget I heard it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live by the canals, and my cousin's in the guard, so I hear about everything first. I'm going to be in the guard too, and then I'll know even more." } },
    _none = { { id = "tp_none", text = "I know about that, I just can't remember it right now. I'll ask my cousin and then I'll tell you." } },
  },
}

-- Corbett Schneider: husband of Rema, the canal tailor; walks to Lionheart Armory and Trias' Cheese.
P:NPC {
  key = "corbett_schneider", id = TODO_NPC("Corbett Schneider"), name = "Corbett Schneider", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "unhurried" }, values = { "family", "cheese" },
  notices = { "trade" },
  impression = {
    first = "Corbett Schneider carries parcels for his wife Rema's tailor shop and never passes the cheese shop without stopping. He is a contented man who gives every neighbour a good day by name.",
    third = "{name} met Corbett Schneider, who runs deliveries for the Canal Tailor and Fit Shop.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Good day, good day! Forgive me if I keep walking, for I've a parcel for Harlan Bagley and a wife who counts the minutes." },
    { id = "g_back", when = { metBefore = true }, text = "Hullo again! I'm on my way home this time, with any luck." },
  },
  notice = {
    { id = "n_tailor", cat = "trade", when = { profession = "Tailoring" },
      text = "You've a tailor's pricked fingers, I see. My Rema has the same, and so do two of our children, and I count myself lucky to be the one who carries the boxes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Corbett Schneider, of the Canal Tailor and Fit Shop, though it's my Rema who does the sewing. I do the carrying and the bookkeeping, and I reward myself with a little cheese on the way back." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I can spare a moment more." },
        { id = "h_again2", text = "Go on, but don't tell Rema I dawdled." },
      },
      choices = {
        { text = "What are you delivering?", next = "delivery" },
        { text = "Tell me about your family.", next = "family" },
        { text = "You have the look of a man headed for cheese.", next = "cheese" },
        { text = "Why are folk buying sturdy clothes, do you think?", next = "x_why" },
        { text = "What does Rema think of the Defias trouble?", next = "x_rema" },
        { text = "Your wife's stitching is said to be fine work.", next = "x_tailor", when = { profession = "Tailoring" } },
        { text = "Good day, Corbett.", next = "END" },
      },
    },
    delivery = {
      lines = { { id = "d_default", text = "Padded shirts and linings for Lionheart Armory, because Harlan's sellers need something soft to go under all that mail and leather. He orders by the crate now, and Rema's been sewing by candlelight to keep up." } },
      choices = {
        { text = "Business is good, then.", next = "business" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "Brisk, friend, very brisk! Rema frets about why so many folk want sturdy clothes all of a sudden, and I tell her to let the Keep do the worrying while we do the hemming." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "Rema, and our three, who are all grown and all at the needle one way or another. Lawrence teaches the beginners at Duncan's Textiles in the Mage Quarter, and his mother is prouder of that than she'll ever say to his face." } },
      choices = { { text = "A family trade is a fine thing. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    cheese = {
      lines = { { id = "c_default", text = "You've found me out! Elling Trias makes a bleu that's fresh every morning, and his Elaine always asks after the shop. A wheel of that and a quiet walk home is all the luxury I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_why = {
      lines = {
        { id = "x_why_l0", text = "Because the roads aren't safe, friend, and a farmer from Westfall who comes to market wants a coat that'll turn a knife. I've seen men buy a padded jerkin and wear it under their Sunday best." },
      },
      choices = {
        { text = "Is it that bad out there?", next = "x_why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_why2 = {
      lines = {
        { id = "x_why2_l0", text = "My cousin at Sentinel Hill writes that it's worse every month, and the Westfall People's Militia is farmers with pitchforks. Rema sends him a parcel every season, and I carry it to the post with my heart in my throat." },
      },
      choices = {
        { text = "Does he think it will get better?", next = "x_why3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_why3 = {
      lines = {
        { id = "x_why3_l0", text = "He thinks it'll get better when someone finds out who's paying the Defias, because masks and swords cost money. I said that's the sort of thing adventurers do, and he laughed." },
      },
      choices = {
        { text = "Maybe I'll be one of them. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_rema = {
      lines = {
        { id = "x_rema_l0", text = "She says the stonemasons were robbed, and she says it loud enough that I hush her in the shop. I say a debt doesn't make a man a bandit, and we leave it there over supper." },
      },
      choices = {
        { text = "Rema's right. The nobles brought this on themselves.", next = "BACK", reply = "Don't tell her you said so, or I'll never hear the end of it.", fx = { align = { order = -1 } } },
        { text = "You're right, Corbett. No grievance excuses banditry.", next = "BACK", reply = "Thank you, friend, though I'll keep it to myself at home.", fx = { align = { order = 1 } } },
      },
    },
    x_tailor = {
      lines = {
        { id = "x_tailor_l0", text = "It is, and she'll be glad to hear a fellow needle says so. Ask her about linings if you're ever in the shop, because she can talk about them for an hour." },
      },
      choices = {
        { text = "I may well. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I married a tailor and I've carried her parcels ever since, and I've never regretted a step of it. We've had the shop by the bridge since the canals were dug anew." } },
    rumors = { { id = "tp_rumors_x", text = "Folk say the Defias have friends in the city, and Rema says so does everybody, if you pay them." } },
    _none = { { id = "tp_none", text = "I'm not sure, friend. Rema hears more than I do, since half the Trade District's wives sit in her fitting room." } },
  },
}

-- Erich Lohan: walks the Mage Quarter calling people to the Blue Recluse.
P:NPC {
  key = "erich_lohan", id = TODO_NPC("Erich Lohan"), name = "Erich Lohan", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "loud", "jovial" }, values = { "family", "a full house" },
  notices = { "drink" },
  impression = {
    first = "Erich Lohan strolls the lawns of the Mage Quarter shouting the praises of the Blue Recluse to anyone with ears. His promises grow grander with every lap, and nobody at the tavern has ever agreed to honour them.",
    third = "{name} met Erich Lohan, who drums up custom for the Blue Recluse.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'd rather you were brief today." },
    { id = "g_default", text = "You there, {class}! You look thirsty, and the Blue Recluse is just up the lane with the best cellar in the quarter!" },
    { id = "g_back", when = { metBefore = true }, text = "My friend, you've come back! Have you been to the Recluse yet, or must I walk you there myself?" },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "I see you've started already! A wise beginning, and the Recluse is the proper place to finish it." },
    { id = "n_dwarf", cat = "drink", when = { race = "Dwarf" },
      text = "A dwarf! Then you'll know good ale from bad, and I dare you to find fault with ours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Erich Lohan, friend to the thirsty! I walk the quarter and tell good people about the Blue Recluse, because a tavern that hides behind a tower needs somebody with lungs." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you on the way to the Recluse?" },
        { id = "h_again2", text = "Ask, ask, and then go and drink!" },
      },
      choices = {
        { text = "I heard you shouting about free drinks.", next = "free" },
        { text = "Why do you do this?", next = "why" },
        { text = "What's good at the Blue Recluse?", next = "good" },
        { text = "How long have you been walking these lawns?", next = "x_long" },
        { text = "Stretching the truth is harmless if it fills a tavern.", next = "x_stance" },
        { text = "Do mages drink at the Recluse?", next = "x_mage", when = { class = "MAGE" } },
        { text = "Perhaps later, Erich.", next = "END" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "Ah, well, I do shout that, and it does turn heads. Between ourselves, Joachim has never once agreed to it, so you'd best bring your purse and take the word as an invitation." } },
      choices = {
        { text = "So it isn't true at all.", next = "true" },
        { text = "At least you admit it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    ["true"] = {
      lines = { { id = "t_default", text = "The company is free, and so is the fire, and so is my conversation, which some would pay to avoid. Steven tells me I'll be the ruin of the family name, but the benches are full every night, so who's to say?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because Steven Lohan is my kin and he works inside, and I've no patience for standing behind a counter. He pours and I shout, and each of us thinks he has the better half of the arrangement." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default2", text = "Angus Stern's kitchen, first and last, for the man cooks as if the King were coming. After that I'd point you to Joachim's wines, and to a corner seat where you can hear mages argue about things that might set the roof alight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_long = {
      lines = {
        { id = "x_long_l0", text = "Since my brother Steven took the lease on the Blue Recluse, and that's going on six years. I tried working the counter, but I talk too much to pour straight, so he gave me the lawns instead." },
      },
      choices = {
        { text = "Was that a kindness or a punishment?", next = "x_long2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_long2 = {
      lines = {
        { id = "x_long2_l0", text = "Both, friend, and he'd say so himself. But I've brought in more custom than any sign, and when the archmages pass me by I count it as practice for the next one." },
      },
      choices = {
        { text = "Has an archmage ever stopped?", next = "x_long3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_long3 = {
      lines = {
        { id = "x_long3_l0", text = "Once, and he turned my hat into a fish, which I took as a review. I wore it for an hour until it wore off, and three apprentices followed me in to see what would happen next." },
      },
      choices = {
        { text = "Good business, in the end. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Harmless? I like to think so, though Joachim reckons each free drink I promise costs him a customer's good temper." },
      },
      choices = {
        { text = "Your promises bring people in. Where's the harm?", next = "BACK", reply = "That's what I tell him, and he never listens.", fx = { align = { honor = -1 } } },
        { text = "You shouldn't promise what isn't yours to give.", next = "BACK", reply = "Ah, a stern one, and my brother would like you.", fx = { align = { honor = 1 } } },
      },
    },
    x_mage = {
      lines = {
        { id = "x_mage_l0", text = "They do, and they leave the strangest tips, a frost-glazed copper, a candle that won't go out. Steven keeps them all in a jar behind the bar." },
      },
      choices = {
        { text = "I'll add something to the jar. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Lohan, and the Lohans have always been near a tavern, on one side of the bar or the other. I've found my calling out here in the fresh air." } },
    _none = { { id = "tp_none", text = "I've no idea, friend, but somebody at the Blue Recluse will, so that's one more reason to go!" } },
  },
}
