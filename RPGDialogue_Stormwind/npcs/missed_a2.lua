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
    { id = "g_default", text = "Hello! Are you here to fish too? You can, there's lots of room." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Justin's told three more stories since you left." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "Do you know how to fish properly? Roman says you have to spit on the hook, and I think he made that up." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I married a tailor and I've carried her parcels ever since, and I've never regretted a step of it. We've had the shop by the bridge since the canals were dug anew." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Lohan, and the Lohans have always been near a tavern, on one side of the bar or the other. I've found my calling out here in the fresh air." } },
    _none = { { id = "tp_none", text = "I've no idea, friend, but somebody at the Blue Recluse will, so that's one more reason to go!" } },
  },
}
