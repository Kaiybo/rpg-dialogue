-- Stormwind folk the roster scan found missing (part 2 of 3): the Dwarven District's weaponsmith, a
-- journeyman at the forge, the mining supplier and a hunter trainer; two boys fishing the canals;
-- the Flintridge caretaker; the Blue Recluse's apprentice chef and its crier; the canal tailor's
-- husband; and the owner of Duncan's Textiles. Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Dane Lindgren: journeyman blacksmith who teaches beginners in the Dwarven District.
P:NPC {
  key = "dane_lindgren", id = TODO_NPC("Dane Lindgren"), name = "Dane Lindgren", gender = "male",
  bible = "bibles/missed_a.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "earnest", "hardworking" }, values = { "craft", "patience" },
  notices = { "craft" },
  impression = {
    first = "Dane Lindgren is one of the few humans working the forges of the Dwarven District, and he has the soot and the squint to prove it. He teaches beginners the basics and counts himself still a student of the dwarves.",
    third = "{name} met Dane Lindgren, a journeyman blacksmith in the Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Mind the quench barrel, because I've only just filled it and it spits." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I've a batch of nails cooling, so I can spare you a minute." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've been at an anvil yourself, I can tell by how you look at the fire before anything else in the room." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Is that ore dust on your boots? If you've copper to sell, half the forges on this street will thank you for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dane Lindgren, a journeyman smith, and I teach the first steps to anyone willing to sweat for them. Master Therum takes the experienced hands, and I take the ones who haven't yet learned which end of the bar is hot." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on, I can talk and work the bellows at once." },
      },
      choices = {
        { text = "A human, working among the dwarven forges?", next = "human" },
        { text = "What do you teach a beginner first?", next = "first" },
        { text = "This district never stops hammering, does it?", next = "noise" },
        { text = "Good day, Dane.", next = "END" },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "I'm about the only one, and I had to ask three times before they'd let me carry coal. The dwarves don't much care where you were born once you've shown them you'll stay at the fire as long as they do." } },
      choices = {
        { text = "What have they taught you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "That I'd been hitting too hard and thinking too little, for a start. Master Therum made me draw out the same bar every morning for a season, and Borgus Steelhand still won't look at a blade of mine until I've broken it on his block myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "How to read the colour of the steel, because the fire tells you everything if you'll watch it. After that it's sharpening stones and copper buckles, and nobody enjoys those, but nobody skips them either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    noise = {
      lines = { { id = "n_default", text = "Not since the trouble in Redridge and Westfall began, no. The army wants swords and the farmers want ploughshares, and there's more of both on order than there are smiths to make them." } },
      choices = { { text = "Honest work, at least. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father shod horses in the Trade District, and I wanted to make more than horseshoes. So I walked up here and asked the dwarves, and I've not left." } },
    _none = { { id = "tp_none", text = "I'm not the one to ask, I'm afraid. Master Therum has been in this city longer than I've been alive, so try him." } },
  },
}

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

-- Caretaker Folsom: the Flintridge family's last caretaker, on the Canals by the Park.
P:NPC {
  key = "caretaker_folsom", id = TODO_NPC("Caretaker Folsom"), name = "Caretaker Folsom", gender = "male",
  bible = "bibles/missed_a.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "weary", "dutiful" }, values = { "loyalty", "discretion" },
  notices = { "noble" },
  impression = {
    first = "Caretaker Folsom stands on the canal side among the last crates of a dead family's belongings, with a ledger under his arm. He served the Flintridges as his father did, and now his work is selling off what remains.",
    third = "{name} met Caretaker Folsom, who is seeing the Flintridge estate to auction.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. If you've come about the Flintridge lots, I must tell you that most have already gone under the hammer." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. I'm still here, as you see, and so are the last of the crates." },
  },
  notice = {
    { id = "n_duskwood", cat = "noble", when = { questDone = TODO_QUEST("The Legend of Stalvan") },
      text = "You're the one who went looking into the tutor, aren't you? I've slept poorly since you came, and I'd guess you have too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "You've come asking after the Flintridges, and after the tutor, I think. Nobody has spoken that name to me in years, and I had rather hoped nobody would again." },
        { id = "h_default", text = "I am Folsom, caretaker to the Flintridge estate, as my father was before me. There is no family left to take care of, so I look after their things instead, until the last of them is sold." },
      },
      again = {
        { id = "h_again", text = "Was there something more you wished to know?" },
        { id = "h_again2", text = "Ask, then. I've little else to do but wait on the auctioneer." },
      },
      choices = {
        { text = "I'm looking for something of Stalvan Mistmantle's.", next = "stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") } },
        { text = "What happened to the Flintridges?", next = "family" },
        { text = "Why is the estate being sold?", next = "auction" },
        { text = "This is sad work for a loyal man.", next = "work" },
        { text = "I'll leave you to it, Folsom.", next = "END" },
      },
    },
    stalvan = {
      big = true,
      lines = { { id = "st_default", text = "He was tutor to the young lady of the house, a quiet and scholarly man, or so we all believed. Whatever he left behind went into the crates with everything else, for I had no heart to sort his things from theirs.", fx = { learn = { "stalvan" } } } },
      choices = {
        { text = "May I look through the crates?", next = "crate" },
        { text = "What was he like, in the house?", next = "tutor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate = {
      lines = { { id = "cr_default", text = "The unsold lots are stacked just here beside me, and you may search them, since no buyer wanted a tutor's papers. I ask only that you leave the family's own things as you find them." } },
      choices = { { text = "I'll be careful with them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tutor = {
      lines = { { id = "tu_default", text = "He was courteous, and exact, and he watched Miss Tilloa rather more closely than a teacher should. I noticed it and said nothing, because it was not a servant's place to speak, and I have had a good many years to regret that." } },
      choices = {
        { text = "You couldn't have known what he'd do.", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = { { id = "re_default", text = "That is kind of you, and I have told myself the same on better nights. If you learn the whole of it out in Duskwood, I think I would rather not be told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "They were killed, all of them, at their summer house near the Eastvale camp, many years ago now. It was done in a single night by someone they had welcomed at their own table, and the kingdom has mostly forgotten it." } },
      choices = {
        { text = "Was the killer ever caught?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "ca_default", text = "He was gone before morning, and no magistrate ever laid a hand on him. Travellers from Darkshire tell stories of a madman on the road there, and I try not to listen to them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    auction = {
      lines = { { id = "a_default", text = "The house stood shut and untouched for years, paid for out of what the family left. That money ran dry at last, and the creditors will have their due, so every chair and candlestick goes to whoever bids." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "It is, but I would rather it were done by someone who knew which chair the old lord favoured. When the last lot is gone I shall lock a door that has nothing behind it, and then I suppose I shall be free." } },
      choices = { { text = "You've served them well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept the Flintridge house, and I after him. I have known no other work, and I am too old now to learn any." } },
    stalvan = { { id = "tp_stalvan", text = "Stalvan Mistmantle taught the Flintridge girl her letters. I will say no more of him than that, if you'll forgive me." } },
    _none = { { id = "tp_none", text = "I'm afraid I know little beyond one family's household, and that household is gone." } },
  },
}

-- Connor Rivers: apprentice chef at the Blue Recluse, Mage Quarter.
P:NPC {
  key = "connor_rivers", id = TODO_NPC("Connor Rivers"), name = "Connor Rivers", gender = "male",
  bible = "bibles/missed_a.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "eager", "grateful" }, values = { "craft", "gratitude" },
  notices = { "food", "travel" },
  impression = {
    first = "Connor Rivers is the apprentice chef at the Blue Recluse, with flour to the elbows and a burn on every other finger. He talks about the man who first taught him the way some people talk about their fathers.",
    third = "{name} met Connor Rivers, the apprentice chef at the Blue Recluse.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Blue Recluse! Mind the pot behind me, because it's Angus's stock and he'll have my hide if it's jostled." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've not burned anything since you were last in, which is a record for the week." },
    { id = "g_hyal", when = { questDone = TODO_QUEST("James Hyal") },
      text = "It's you! I still think about what you found out in Menethil, and I thank you for going." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You cook, don't you? Nobody but a cook checks how the fire's banked before they look at the menu." },
    { id = "n_menethil", cat = "travel", when = { minLevel = 20 },
      text = "You look like someone who gets about. Have you ever been as far as the Wetlands, to Menethil Harbor?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("James Hyal") },
          text = "Have you been to Menethil yet? Vincent Hyal keeps the tavern there, and he'll know how his brother James is getting on." },
        { id = "h_default", text = "I'm Connor Rivers, apprentice to Angus Stern, who's the finest cook in the Mage Quarter and won't let me forget it. I chop, I stir and I scrub, and once in a while he lets me season something." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I peel." },
        { id = "h_again2", text = "Go on, but quickly, before Angus looks round." },
      },
      choices = {
        { text = "Who taught you before Angus?", next = "hyal" },
        { text = "What's it like, working under Angus Stern?", next = "angus" },
        { text = "The Blue Recluse draws an odd crowd.", next = "crowd" },
        { text = "What would you cook for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "Back to your pots, Connor.", next = "END" },
      },
    },
    hyal = {
      big = true,
      lines = { { id = "hy_default", text = "A man named James Hyal, who was the best chef and innkeeper I ever met. I was a pot boy with no prospects when he took me in, and everything I have, I owe to what he taught me.", fx = { learn = { "menethil" } } } },
      choices = {
        { text = "Where is he now?", next = "where" },
        { text = "What did he teach you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "He went north with his brother Vincent to work a tavern in Menethil Harbor, on the Wetlands coast. He used to write, but I've had no letter in a long while now, and it worries me more than I let on." } },
      choices = {
        { text = "If I'm in Menethil, I'll ask after him.", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "as_default", text = "Would you? Vincent is the one to speak to, at the inn by the harbor, and you need only tell him that Connor at the Blue Recluse sends his regards. I'd go myself, but Angus would have a new apprentice by the time I got back." } },
      choices = { { text = "I'll remember it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    taught = {
      lines = { { id = "t_default", text = "That a kitchen runs on kindness as much as salt, and that you taste everything twice. He never shouted, not once, and I didn't know until I came here how rare that is in a cook." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    angus = {
      lines = { { id = "an_default", text = "He's hard, and he's fair, and he can tell from across the room when I've rushed a sauce. I've learned more from him in a year than I'd have believed, though most of it was learned while being shouted at." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "c_default", text = "Mages, mostly, who argue about things I can't follow and forget to eat until the plate's gone cold. Then there are the quiet ones who drift up from the Slaughtered Lamb, and Joachim serves those himself and tells me to stay by the stove." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Something plain, because another cook can't be fooled by sauce. I'd roast you a good fowl with nothing but salt and thyme, and then I'd watch your face and be terrified." } },
      choices = { { text = "That's how a cook should think. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I started as a pot boy under James Hyal and came to the Blue Recluse when he went north. One day I'd like a kitchen of my own, though don't tell Angus." } },
    menethil = { { id = "tp_menethil", text = "It's a harbor town in the Wetlands, north of the dwarven lands. James and Vincent Hyal went there to keep a tavern." } },
    _none = { { id = "tp_none", text = "I couldn't say. I hear a lot through the kitchen door, but I only ever catch half of it." } },
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

-- Duncan Cullen: light armor merchant and owner of Duncan's Textiles, Mage Quarter.
P:NPC {
  key = "duncan_cullen", id = TODO_NPC("Duncan Cullen"), name = "Duncan Cullen", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "genial", "shrewd" }, values = { "craft", "his shop" },
  notices = { "armor", "trade" },
  impression = {
    first = "Duncan Cullen owns Duncan's Textiles and sells the finished cloth and leather from its front room. He keeps teachers and suppliers under the same roof, and he is quietly pleased with himself for thinking of it.",
    third = "{name} met Duncan Cullen, owner of Duncan's Textiles in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Duncan's Textiles! You'll find the finished goods with me and the bolts and thread with Alexandra." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the shop. Has the stitching held up for you?" },
  },
  notice = {
    { id = "n_tailor", cat = "trade", when = { profession = "Tailoring" },
      text = "You sew, I think, from the way you turned that cuff over to see the inside. Georgio is through there if you want teaching, and tell him I sent you." },
    { id = "n_light", cat = "armor", when = { class = { "MAGE", "PRIEST", "WARLOCK", "ROGUE", "DRUID" } },
      text = "Now you're exactly who this shop was opened for. Have a look at the rack by the window, because that's this month's work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Duncan Cullen, and the name over the door is mine. I sell light armor, cloth and leather both, and every piece of it was cut and sewn by somebody I can call across the room." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Yes, go on." },
      },
      choices = {
        { text = "You keep trainers in your own shop?", next = "trainers" },
        { text = "Why set up in the Mage Quarter?", next = "quarter" },
        { text = "Lionheart Armory sells cloth and leather too.", next = "rival" },
        { text = "Good day, Duncan.", next = "END" },
      },
    },
    trainers = {
      lines = { { id = "t_default", text = "I do, and it's the cleverest thing I ever did. Georgio Bolero teaches the trade here and young Lawrence Schneider takes the beginners, so half the tailors in Stormwind learned at my tables and still buy their thread from Alexandra." } },
      choices = {
        { text = "And what do you get from it?", next = "get" },
        { text = "Something else.", next = "BACK" },
      },
    },
    get = {
      lines = { { id = "g_default2", text = "First look at the best work that comes off those tables, and a shop that's never empty. A customer who walks in on a lesson can see how the goods are made, and that sells better than any sign." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "Because mages wear out robes faster than anyone alive, what with the scorch marks and the acid. I'm by the gate from the Trade District as well, so I catch everybody else on their way through." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rival = {
      lines = { { id = "r_default", text = "So they do, and good luck to Harlan Bagley, who's a decent man. He sells to soldiers in a hurry, and I sell to people who'll stand and feel the weave, so there's custom enough in this city for both of us." } },
      choices = { { text = "A generous view. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I opened this shop when the quarter was rebuilt, with one table and a borrowed sign. It's grown a little since." } },
    _none = { { id = "tp_none", text = "That's not something I know about, I'm afraid. I know cloth and I know customers, and you've found the edge of both." } },
  },
}
