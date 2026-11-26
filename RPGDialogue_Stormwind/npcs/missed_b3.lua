-- Stormwind folk the roster scan found missing (part 3): Miss Danna and four of her pupils on their
-- tour, the boys of the streets and canals, and the Dwarven District's smith, hunter trainers and
-- the last of the Thistlenettle mining company. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Miss Danna: school mistress leading her class from the Cathedral to the Keep to the Valley of Heroes.
P:NPC {
  key = "miss_danna", id = TODO_NPC("Miss Danna"), name = "Miss Danna", title = "School Mistress", gender = "female",
  bible = "bibles/missed_b.md", role = "scholar", tier = "service",
  communities = { "stormwind" }, temper = { "patient", "proper" }, values = { "learning", "loyal" },
  notices = { "paladin", "wonder" },
  impression = {
    first = "Miss Danna leads a string of schoolchildren through Stormwind and teaches the city's history at every corner, whether they are listening or not. She has the calm of someone who has been asked the same question a hundred times today.",
    third = "{name} met Miss Danna, the school mistress who walks her pupils around Stormwind's great sights.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Children, stand to one side, please, and let the {class} pass; we do not block the road." },
    { id = "g_back", when = { metBefore = true }, text = "Good day again. We have lost nobody since you last saw us, which I count a successful outing." },
  },
  notice = {
    { id = "n_holy", cat = "paladin", when = { class = { "PALADIN", "PRIEST" }, race = { "Human", "Dwarf" } },
      text = "Children, look here. This is one of those who train behind the Cathedral's walls, about whom we were speaking not an hour ago." },
    { id = "n_far", cat = "wonder", when = { race = { "NightElf", "Gnome" } },
      text = "Children, it is not polite to stare. Our allies have come a very long way to stand with Stormwind, and we shall be reading about their homelands next month." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Miss Danna, and these are my pupils. We are walking to the Cathedral of Light, the gate of the Keep and the Valley of Heroes, so that they may see with their own eyes what they have only met in books." },
      },
      again = {
        { id = "h_again", text = "Was there something further? Twain, hands to yourself, please." },
        { id = "h_again2", text = "Yes? I can spare a moment while they catch their breath." },
      },
      choices = {
        { text = "What do you teach them at the Keep?", next = "keep" },
        { text = "Do they listen?", next = "listen" },
        { text = "Which of the sights do they like best?", next = "best" },
        { text = "How did you come to teach?", next = "x_teach" },
        { text = "Children shouldn't hear about the wars so young.", next = "x_stance" },
        { text = "I'm a priest. The Cathedral is a fine stop.", next = "x_priest", when = { class = "PRIEST" } },
        { text = "I won't keep your class, Miss Danna.", next = "END" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "That the old castle was destroyed by the Horde in the First War, and that the Keep was raised upon its ruins when our people came home. I want them to understand that every stone they walk on was laid by somebody who refused to give the city up." } },
      choices = {
        { text = "And what of the young king?", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "ki_default", text = "King Anduin is hardly older than my eldest pupils, and they know it, which makes him far more interesting to them than any dead hero. I tell them he does his lessons too, and I very much hope that is true." } },
      choices = { { text = "I expect Lord Bolvar sees to it. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "l_default", text = "One in four, on a good day, and it is never the same one twice. Pat asks questions, Steven asks only about the Mage Tower, and I have learned that what a child seems to ignore at nine comes back to him at nineteen." } },
      choices = { { text = "Then it's worth the walking. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    best = {
      lines = {
        { id = "b_default", text = "The Valley of Heroes, always. They stand beneath the statues with their mouths open, and for a moment even Twain is silent, and then I tell them each to prepare a report on one of those heroes and the spell is broken." },
        { id = "b_hero", when = { minLevel = 40 }, text = "The Valley of Heroes, though I think today it may be you. They have been whispering about your armour since the bridge, and I should be grateful if you would look suitably heroic for a moment longer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_teach = {
      lines = {
        { id = "x_teach_l0", text = "My own teacher died in the First War, when the Horde came over the hills to Goldshire. I was ten, and I decided someone ought to remember what she knew." },
      },
      choices = {
        { text = "You were in the First War?", next = "x_teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_teach2 = {
      lines = {
        { id = "x_teach2_l0", text = "As a child, yes, and we fled to Lordaeron on the refugee ships when the old city fell. I learned my letters in a camp in Southshore, from a priest who wrote them in the sand." },
      },
      choices = {
        { text = "And you came back.", next = "x_teach3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_teach3 = {
      lines = {
        { id = "x_teach3_l0", text = "With the first families who rebuilt, yes, and I opened a schoolroom before the city had a roof on it. These children have never known Stormwind without walls, and I mean them to know why they matter." },
      },
      choices = {
        { text = "They're lucky to have you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Some parents say so, and I do understand them. But the children see soldiers on every street and hear of Westfall at supper, and they need words for what they see." },
      },
      choices = {
        { text = "Teach them the truth. They'll need it.", next = "BACK", reply = "Gently, yes, but truthfully. That's my aim.", fx = { align = { light = -1 } } },
        { text = "Let them be children a while longer.", next = "BACK", reply = "I try to do both, and some days I manage it.", fx = { align = { light = 1 } } },
      },
    },
    x_priest = {
      lines = {
        { id = "x_priest_l0", text = "It's their favourite stop, because Brother Kristoff lets them ring the small bell. If you see us there, tell them something about the Light, because they'll listen to you before me." },
      },
      choices = {
        { text = "I'll be glad to. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have taught Stormwind's children their letters and their history for many years, and I walk them round the city every season." } },
    advice = { { id = "tp_advice_x", text = "Answer a child's question honestly, and you'll find you have to know a great deal more than you thought." } },
    _none = { { id = "tp_none", text = "I am afraid that is outside my lessons. The royal library would be the place to enquire." } },
  },
}

-- Mikey: one of Miss Danna's pupils; tired of walking, tired of being poked.
P:NPC {
  key = "mikey_sw", id = TODO_NPC("Mikey"), name = "Mikey", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "grumbling" }, values = { "fairness" },
  notices = { "wonder" },
  impression = {
    first = "Mikey trails at the back of Miss Danna's class and has a complaint ready about the walking, the lessons and the boy behind him. He cheered up at once when I asked what he thought.",
    third = "{name} met Mikey, a schoolboy on Miss Danna's tour of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hello. We've been walking forever, and Twain keeps poking me, and Miss Danna won't do anything about it." },
    { id = "g_back", when = { metBefore = true }, text = "You again! We're still walking, and he's still poking me." },
  },
  notice = {
    { id = "n_gnome", cat = "wonder", when = { race = "Gnome" },
      text = "You're not much bigger than me! Do you have to go to school too, or do gnomes already know everything?" },
  },
  start = "hello",
  nodes = {
    yhouse = {
      lines = {
        { id = "ymikeysw1", text = "It's in the Trade District, above my dad's shop, where he sells candles and lamp oil. It smells like wax all the time, and my mum says that's better than smelling like the canals, which is what Twain's house smells like." },
        { id = "ymikeysw2", when = { race = "Gnome" }, text = "Dad says gnomes make the best lamps, ones that don't even need oil. Is that true? He'd want to know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfriend = {
      lines = {
        { id = "ymikeysw3", text = "Steven, because he wants to be a mage and he tells me about the Mage Tower. He says when he's a mage he'll turn Twain into something quiet. I'd like that, but I'd want him to be a toad, not a sheep." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrow = {
      lines = {
        { id = "ymikeysw4", text = "A guard, so I can tell people what to do. Then I'd tell Twain to stop poking people, and he'd have to, because guards are in charge. Dad says that's not what guards are for, though." },
      },
      choices = {
        { text = "What are guards for?", next = "yguards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yguards = {
      lines = {
        { id = "ymikeysw5", text = "Dad says they're for keeping everybody safe, even the ones who poke. I think the ones who poke should have to stand in the corner first. What do you think?" },
      },
      choices = {
        { text = "Guards should punish rule-breakers. Fair is fair.", next = "BACK", reply = "That's right! I'm going to tell Dad you agreed with me.", fx = { align = { order = 1 } } },
        { text = "Guards protect everyone, even the annoying ones.", next = "BACK", reply = "Hmm. That sounds like what Dad would say. I'll think about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Mikey. We have to go and look at the Cathedral and the Keep and the statues, and then we have to write about them, which is the worst part." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not supposed to stop for long." },
        { id = "h_again2", text = "Ask me something quick, before Miss Danna looks round." },
      },
      choices = {
        { text = "Why does Twain keep poking you?", next = "poke" },
        { text = "You don't like the tour?", next = "tour" },
        { text = "What will you write about for Miss Danna?", next = "x_write" },
        { text = "You should tell Twain to stop, yourself.", next = "x_stance" },
        { text = "What's your house like?", next = "yhouse" },
        { text = "Who's your best friend in class?", next = "yfriend" },
        { text = "What will you be when you grow up?", next = "ygrow" },
        { text = "Chin up, Mikey. It's nearly over.", next = "END" },
      },
    },
    poke = {
      lines = { { id = "p_default", text = "Because I walk in front of him, and he's got a stick he found by the canal. I told Miss Danna, and she said \"Twain, hands to yourself,\" and a stick isn't hands, so he didn't stop." } },
      choices = {
        { text = "Have you tried walking behind him?", next = "behind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    behind = {
      lines = { { id = "b_default", text = "Oh! No, I haven't, and then I'd be the one at the back, wouldn't I? I'm going to find a stick as well, only don't tell Miss Danna it was your idea." } },
      choices = { { text = "It wasn't my idea. Something else.", next = "BACK" } },
    },
    tour = {
      lines = { { id = "t_default", text = "The statues are good, because one of them has a huge hammer, and the Keep's all right. But she talks at every single one, and my feet hurt, and we never go anywhere with food." } },
      choices = { { text = "Heroes get sore feet too. Something else.", next = "BACK", reply = "Do they? Nobody puts that in the history books." } },
    },
    x_write = {
      lines = {
        { id = "x_write_l0", text = "The hammer statue, because it's the biggest, and I'll say he hit a dragon with it. Miss Danna will say that's not true, but she said write what we liked." },
      },
      choices = {
        { text = "Clever. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "I did tell him, and he said make me. He's taller than me, only a bit." },
      },
      choices = {
        { text = "Stand up to him, Mikey. Bullies back down.", next = "BACK", reply = "All right, but if he pokes me again I'm telling you.", fx = { align = { honor = 1 } } },
        { text = "Just stay out of his way.", next = "BACK", reply = "That's what I've been doing, and it isn't working.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    twain = { { id = "ymikeysw6", text = "He pokes me with a stick. He says it's funny. It's not." } },
    steven = { { id = "ymikeysw7", text = "My best friend. He wants to be a mage." } },
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, and I'm the second fastest runner in it, when we're allowed to run." } },
    _none = { { id = "tp_none", text = "I don't know. We haven't done that one at school yet." } },
  },
}

-- Pat: Miss Danna's keenest pupil; asks about the paladins.
P:NPC {
  key = "pat_sw", id = TODO_NPC("Pat"), name = "Pat", gender = "female",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "learning" },
  notices = { "paladin" },
  impression = {
    first = "Pat walks at the front of Miss Danna's class and is the only one of them who wants the lesson to go on longer. She asked me three questions before I had answered the first.",
    third = "{name} met Pat, a curious schoolgirl on Miss Danna's tour of Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you an adventurer, and have you been outside the walls, and did you see any gnolls?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you! I thought of four more questions after you went away." },
  },
  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You're a paladin, aren't you? Miss Danna says you train in the Cathedral, and I asked if it was true, and it is!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pat, and I'm in Miss Danna's class. We're seeing the whole city today, and I've got to give a report on one of the heroes in the Valley, and I haven't decided which one." },
      },
      again = {
        { id = "h_again", text = "Can I ask you something now, or do you want another turn?" },
        { id = "h_again2", text = "What else do you want to know?" },
      },
      choices = {
        { text = "Which heroes are you choosing between?", next = "heroes" },
        { text = "What have you liked best so far?", next = "best" },
        { text = "You ask a lot of questions, Pat.", next = "questions" },
        { text = "What would you ask a real hero?", next = "x_ask" },
        { text = "Heroes who never came back aren't worth a report.", next = "x_stance" },
        { text = "I've been to Ironforge. The gryphon riders are real.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Good luck with your report.", next = "END" },
      },
    },
    heroes = {
      lines = { { id = "he_default", text = "Alleria Windrunner, because she has a bow and she's an elf, or Kurdran Wildhammer, because he rode a gryphon. Everybody else is going to pick the ones with swords, and I don't want mine to be the same." } },
      choices = {
        { text = "What happened to those heroes?", next = "happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened = {
      lines = { { id = "ha_default", text = "They went through the Dark Portal to stop the Horde on the other side, and they never came back, and nobody knows what became of them. Miss Danna says that's why they have statues, so that we remember them even without knowing the end." } },
      choices = { { text = "That's worth a good report. Something else.", next = "BACK" } },
    },
    best = {
      lines = {
        { id = "b_default", text = "The Cathedral, because the ceiling goes up so far you can't see the top properly. I asked if the paladins really train in there, and Miss Danna said the priests do as well, and they study great truths." },
        { id = "b_priest", when = { class = "PRIEST" }, text = "The Cathedral, where you come from! Is it true you study great truths in there, and are they written down, and could I read one?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    questions = {
      lines = { { id = "q_default", text = "Miss Danna says that too, but she always answers them. I think if you don't ask, you just have to believe whatever Twain tells you, and Twain makes things up." } },
      choices = { { text = "Keep asking, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_ask = {
      lines = {
        { id = "x_ask_l0", text = "Whether they were scared, because everyone says heroes aren't scared, and I don't believe it. I'd be scared, and I'd still go." },
      },
      choices = {
        { text = "That's what makes a hero. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Miss Danna says they're worth more, because they stopped the Horde from coming back. Twain says they're just lost." },
      },
      choices = {
        { text = "They gave everything. Write about them.", next = "BACK", reply = "That's what I'm going to do!", fx = { align = { honor = 1 } } },
        { text = "Choose someone who won and came home.", next = "BACK", reply = "Like who? Oh, I'll have to think.", fx = { align = { honor = -1 } } },
      },
    },
    x_dwarf = {
      lines = {
        { id = "x_dwarf_l0", text = "You have? Did you see the gryphons, like the one Kurdran rode, and do they bite? Tell me quickly before Miss Danna moves us on." },
      },
      choices = {
        { text = "They don't bite friends. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, and I've read the whole history primer twice already." } },
    _none = { { id = "tp_none", text = "I don't know that one. I'll ask Miss Danna and then I'll know." } },
  },
}

-- Steven: one of Miss Danna's pupils; only wants to see the Mage Tower.
P:NPC {
  key = "steven_sw", id = TODO_NPC("Steven"), name = "Steven", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "dreamy" }, values = { "wonder" },
  notices = { "mage" },
  impression = {
    first = "Steven follows Miss Danna's class with his head turned toward the Mage Quarter, whichever way the rest of them are facing. He wants to see the tower, and nothing else in Stormwind will do.",
    third = "{name} met Steven, a schoolboy on Miss Danna's tour who dreams of the Mage Tower.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Do you know when we're going to see the sparkly Mage Tower, because Miss Danna won't say?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. We still haven't been to the tower." },
  },
  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "You're a mage! A real one! Have you been inside the tower, and is it sparkly on the inside as well?" },
  },
  start = "hello",
  nodes = {
    yfamily = {
      lines = {
        { id = "ystevensw1", text = "My mum's a baker and my dad's a carpenter, and they don't know anything about magic. They say I'll grow out of it, but I won't. My cousin goes to the Mage Quarter every week, and he says there's a door there that goes nowhere." },
        { id = "ystevensw2", when = { class = "MAGE" }, text = "Do you know my cousin Jerod? He's an apprentice in the Mage Quarter. Is he any good?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yknow = {
      lines = {
        { id = "ystevensw3", text = "Only the ones in the Mage Quarter, and they're always busy. Once a mage made a light come out of his finger to read a map, and I followed him all the way to the canal before he noticed. He wasn't cross, he laughed." },
      },
      choices = {
        { text = "Would your parents let you study?", next = "yparents" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yparents = {
      lines = {
        { id = "ystevensw4", text = "Mum says it costs too much, and Dad says I should learn a proper trade. Miss Danna says the mages take poor children if they're clever enough. Should I ask them myself?" },
      },
      choices = {
        { text = "Ask your parents first, and respect their answer.", next = "BACK", reply = "All right. I'll ask at supper, when Dad's in a good mood.", fx = { align = { order = 1 } } },
        { text = "Ask the mages. Your gift is yours to follow.", next = "BACK", reply = "I'm going to! Tomorrow, before school, if I'm brave.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Steven. We've seen the Cathedral and we're going to see the Keep and the statues, but the tower isn't on the list, and it's the only one I wanted." },
      },
      again = {
        { id = "h_again", text = "Do you know anything else about the tower?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Why the Mage Tower?", next = "tower" },
        { text = "The Keep is worth seeing too.", next = "keep" },
        { text = "I've been inside. It's a long climb.", next = "inside", when = { class = "MAGE" } },
        { text = "What would you do first, as a mage?", next = "x_first" },
        { text = "Magic is dangerous. Maybe pick something else.", next = "x_stance" },
        { text = "What's your family like?", next = "yfamily" },
        { text = "Do you know any mages?", next = "yknow" },
        { text = "I hope you see it one day, Steven.", next = "END" },
      },
    },
    tower = {
      lines = { { id = "t_default", text = "Because it glows at the top, and there's a green garden all round it, and you go up a ramp that winds and winds. My cousin says there's a door at the top that goes somewhere else completely, and I want to know where." } },
      choices = {
        { text = "Do you want to be a mage?", next = "mage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "Yes, more than anything. I tried to make my porridge warm again by staring at it very hard, and it didn't work, but I think that's because I didn't know the words." } },
      choices = { { text = "The words do help. Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "I know, and it's better than the drawings in the book, I did say so. But the king's only a boy like us, and he doesn't glow, so it isn't the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inside = {
      lines = { { id = "i_default", text = "You've been in! Then the door's real, isn't it, and my cousin wasn't fibbing? I'm going to tell Twain, and he'll have to say sorry." } },
      choices = { { text = "It's real enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_first = {
      lines = {
        { id = "x_first_l0", text = "Make my porridge warm, and then make it snow in the garden in summer, and then turn Twain into something quiet. Not a sheep, he'd like that too much." },
      },
      choices = {
        { text = "Sound plans. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Everybody says that, but they don't say why, and the mages all seem fine. Mostly fine. One had no eyebrows." },
      },
      choices = {
        { text = "Study hard and it's the best calling there is.", next = "BACK", reply = "I will! I'll study harder than Pat even.", fx = { align = { order = -1 } } },
        { text = "Listen to the grown-ups. They know the danger.", next = "BACK", reply = "Oh. All right, but I'm still going to try.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    tower = { { id = "ystevensw5", text = "The Mage Tower glows at the top. I'm going to live there one day." } },
    jerod = { { id = "ystevensw6", text = "My cousin, the apprentice. He says there's a door that goes nowhere." } },
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, and when I'm grown I'm going to live at the top of the tower." } },
    _none = { { id = "tp_none", text = "I don't know. Is it anything to do with mages?" } },
  },
}

-- Twain: the troublemaker of Miss Danna's class.
P:NPC {
  key = "twain_sw", id = TODO_NPC("Twain"), name = "Twain", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "cheeky" }, values = { "mischief" },
  notices = { "kit" },
  impression = {
    first = "Twain walks at the back of Miss Danna's class with a stick and a grin and no interest whatever in history. He wanted to know what my weapon was for and whether he could hold it.",
    third = "{name} met Twain, the mischief-maker of Miss Danna's class.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Is that a real weapon? Can I hold it, just for a bit, if I'm careful?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you! I still haven't held it, you know." },
  },
  notice = {
    { id = "n_warrior", cat = "kit", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "That's the best one I've seen all day, better than the guards' ones. I bet you've hit a hundred things with it." },
  },
  start = "hello",
  nodes = {
    ydad = {
      lines = {
        { id = "ytwainsw1", text = "He's a sailor on the trade ships, and he's gone for months at a time. When he's home he tells me about the pirates and the sea monsters, and then he leaves again. Mum says that's why I'm such a handful." },
        { id = "ytwainsw2", when = { class = "ROGUE" }, text = "Dad says pirates are only sailors who stopped caring about rules. You look like you know about that." },
      },
      choices = {
        { text = "Do you miss him?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "ytwainsw3", text = "Yes, but I won't say it to anyone at school. Mikey's dad is always home, and that's why I poke him, I think. Is that bad, poking someone because you're jealous?" },
      },
      choices = {
        { text = "It's bad. Say sorry to Mikey.", next = "BACK", reply = "Fine. Maybe. I'll say it tomorrow, if I remember.", fx = { align = { light = 1 } } },
        { text = "It's natural. Just find a better way to show it.", next = "BACK", reply = "Like what? Maybe I'll show him my dad's shark tooth instead.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybooty = {
      lines = {
        { id = "ytwainsw4", text = "It's a goblin town in Stranglethorn, and it's built in a mountain shaped like a skull. There are pirates and sharks, and goblins who sell everything. Justin's cousin says you can buy a parrot there that swears." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Twain. Miss Danna's making us look at old buildings all day, and I asked her why we have to learn this stuff anyway, and she just said we were going to the next one." },
      },
      again = {
        { id = "h_again", text = "What? I wasn't doing anything." },
        { id = "h_again2", text = "Go on, ask me something, it's better than the lesson." },
      },
      choices = {
        { text = "Why do you keep poking Mikey?", next = "poke" },
        { text = "So why do you think you have to learn it?", next = "learn" },
        { text = "No, you can't hold it.", next = "hold" },
        { text = "What do you want to be, really?", next = "x_be" },
        { text = "Picking on Mikey isn't fair.", next = "x_stance" },
        { text = "What does your dad do?", next = "ydad" },
        { text = "What do you know about Booty Bay?", next = "ybooty" },
        { text = "Behave yourself, Twain.", next = "END" },
      },
    },
    poke = {
      lines = { { id = "p_default", text = "Because he squeaks, and it's funny, and it's a very long walk. I only do it with the stick, so it doesn't count as hands, and Miss Danna only said hands." } },
      choices = {
        { text = "That's a clever excuse and a poor reason.", next = "excuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    excuse = {
      lines = { { id = "e_default", text = "That's what my dad says, nearly exactly. He says I'll end up a lawyer or in the Stockade, and I said I'd rather the Stockade, and he didn't laugh." } },
      choices = { { text = "I can see why. Something else.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "l_default", text = "I don't know, so we can write reports about it, I suppose. The bit about the orcs knocking the whole castle down was good, though, and I wouldn't mind hearing how they did it." } },
      choices = { { text = "Then you were listening after all. Something else.", next = "BACK", reply = "Only to that bit! Don't tell her." } },
    },
    hold = {
      lines = { { id = "ho_default", text = "Everybody says that. One day I'll have my own, and it'll be bigger than yours, and I won't let anybody hold it either." } },
      choices = { { text = "That's fair. Something else.", next = "BACK" } },
    },
    x_be = {
      lines = {
        { id = "x_be_l0", text = "A sailor, on a ship to Booty Bay, where Justin's cousin says there are pirates and goblins and sharks. Nobody makes you learn about old buildings on a ship." },
      },
      choices = {
        { text = "They make you learn knots. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "It's only a stick, and he squeaks! Anyway he'd poke me if he had a stick first." },
      },
      choices = {
        { text = "Being bigger doesn't make it right. Stop it.", next = "BACK", reply = "Fine. I'll stop for now, but only because you said.", fx = { align = { light = 1 } } },
        { text = "Better him than you, I suppose.", next = "BACK", reply = "That's what I said! See, the {class} gets it.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    booty_bay = { { id = "ytwainsw5", text = "A goblin town where you can buy a parrot that swears. I'm going one day." } },
    dad = { { id = "ytwainsw6", text = "He's a sailor on the trade ships. He brings me shark teeth." } },
    background = { { id = "tp_bg", text = "I'm in Miss Danna's class, and I've been sent to stand in the corner more times than anybody." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Pat; she knows everything, and she'll tell you all of it." } },
  },
}

-- Roman: one of three boys fishing in the Canals with Justin and Brandon.
P:NPC {
  key = "roman_sw", id = TODO_NPC("Roman"), name = "Roman", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "doubtful" }, values = { "friends" },
  notices = { "craft" },
  impression = {
    first = "Roman sits on the canal's edge with two other boys and a fishing line, and believes about half of what his friends tell him. He kept one eye on the water the whole time, just in case.",
    third = "{name} met Roman, a boy fishing in Stormwind's canals with his friends.",
  },
  greetings = {
    { id = "g_default", text = "Shh, not so loud! Justin says you'll scare the fish, and we've been here ages and haven't got one." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. No, we still haven't caught anything, so don't ask." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a proper rod! Can you tell Brandon he's holding his wrong, because he won't believe me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Roman, and that's Justin and that's Brandon. We're fishing, only Justin keeps telling stories and Brandon keeps moving the line, so mostly we're just sitting." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down, though." },
        { id = "h_again2", text = "Did you see something move just then? Never mind, what is it?" },
      },
      choices = {
        { text = "What are you hoping to catch?", next = "catch" },
        { text = "What sort of stories does Justin tell?", next = "stories" },
        { text = "I've heard there are crocolisks in the canals.", next = "crocs" },
        { text = "What's the biggest thing you've seen in the canal?", next = "x_big" },
        { text = "Justin's stories are just harmless fun.", next = "x_stance" },
        { text = "Rangers like me know crocolisks. Want to know the signs?", next = "x_hunt", when = { class = "HUNTER" } },
        { text = "Good luck with the fish.", next = "END" },
      },
    },
    catch = {
      lines = { { id = "c_default", text = "Anything, really. Brandon wants a fish as long as his arm, and I'd be happy with a small one, so long as I catch it before he does." } },
      choices = { { text = "A small one still counts. Something else.", next = "BACK" } },
    },
    stories = {
      lines = { { id = "s_default", text = "Ones about the wars, with knights in them, and somebody always fights a hundred orcs by himself. I asked him how he knows, and he said his uncle told him, and his uncle sells onions." } },
      choices = {
        { text = "Do you believe them?", next = "believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe = {
      lines = {
        { id = "b_default", text = "Not the numbers. But I like hearing them, and it makes the fishing go quicker, so I don't say anything." },
        { id = "b_vet", when = { minLevel = 30 }, text = "Not the numbers. You look as if you've really fought things, though, so how many orcs can one person fight at once, honestly?" },
      },
      choices = { { text = "Fewer than a hundred. Something else.", next = "BACK", reply = "I knew it! I'm telling Justin." } },
    },
    crocs = {
      lines = { { id = "cr_default", text = "That's what Brandon says! I said why would there be crocolisks in a canal, and he said somebody's pet got too big and they tipped it in. I don't believe him, but I'm not putting my feet in." } },
      choices = { { text = "That seems wise either way. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_big = {
      lines = {
        { id = "x_big_l0", text = "A boot, a whole one, with no foot in it, thank the Light. And once a sort of shadow under the water that went past the bridge and didn't come back." },
      },
      choices = {
        { text = "What do you think it was?", next = "x_big2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_big2 = {
      lines = {
        { id = "x_big2_l0", text = "A big fish, or Justin's crocolisk, or a log like Brandon says, only logs don't turn round. I haven't told them because Justin would never stop." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "My mum says too many stories make you jumpy, and I am a bit jumpy. Maybe that's Justin's fault." },
      },
      choices = {
        { text = "They're only stories. Enjoy them.", next = "BACK", reply = "I'll try, but I'm still watching the water.", fx = { align = { order = -1 } } },
        { text = "Ask Justin for proof every time.", next = "BACK", reply = "I will! He'll hate that.", fx = { align = { order = 1 } } },
      },
    },
    x_hunt = {
      lines = {
        { id = "x_hunt_l0", text = "Yes, please! Is it bubbles, or a smell, or ripples that go the wrong way? Tell me, and I'll keep a proper watch." },
      },
      choices = {
        { text = "Ripples against the current. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live near the canals, and I fish with Justin and Brandon whenever we're let out." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Justin; he'll make something up." } },
  },
}

-- William: the boy who took Donna's doll and runs the city with her on his heels.
P:NPC {
  key = "william_sw", id = TODO_NPC("William"), name = "William", gender = "male",
  bible = "bibles/missed_b.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "gleeful", "breathless" }, values = { "mischief" },
  notices = { "watch" },
  impression = {
    first = "William tears through the Trade District with a doll under his arm and a furious little girl behind him, and has no plan for what happens when he stops. He talked to me while jogging on the spot.",
    third = "{name} met William, a boy on the run through Stormwind with a stolen doll.",
  },
  greetings = {
    { id = "g_default", text = "Can't stop, can't stop! Is she behind me, and how far, because I'm not allowed to look round?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! She's still after me, and I've been round the whole square twice." },
  },
  notice = {
    { id = "n_fast", cat = "watch", when = { class = { "ROGUE", "HUNTER" } },
      text = "You look like you can run fast. If she asks, I went the other way, all right?" },
  },
  start = "hello",
  nodes = {
    ygrown = {
      lines = {
        { id = "ywilliamsw1", text = "A runner for the king, with a message bag and a fast horse, and I'll be the fastest in the kingdom. Or a sailor, but I get seasick on the canal boats, so probably the runner." },
        { id = "ywilliamsw2", when = { class = "HUNTER" }, text = "Or a hunter, with a fast cat! Do you think a cat would let me ride it? Probably not, but I'd ask nicely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "ywilliamsw3", text = "My mum works at the Pig and Whistle, and I live with her above the tavern. My dad was a soldier, but he died in the war. Mum says he was fast too, and that's where I get it from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm William, and I've got Donna's doll, and she wants it back, so I'm running. I've been past the Cathedral and Old Town and the dwarves' bit, and she hasn't caught me once." },
      },
      again = {
        { id = "h_again", text = "Quick, what? She's getting closer, I can hear her." },
        { id = "h_again2", text = "Ask fast, I've got to go!" },
      },
      choices = {
        { text = "Why did you take her doll?", next = "why" },
        { text = "Give the doll back, William.", next = "giveback" },
        { text = "She looks faster than you think.", next = "faster" },
        { text = "Do you like Donna, then?", next = "x_like" },
        { text = "Stealing's stealing, William, even for a game.", next = "x_stance" },
        { text = "What will you do when you're grown?", next = "ygrown" },
        { text = "Want a tip on running corners?", next = "BACK", when = { class = "ROGUE" }, reply = "Yes! Quick, tell me, before she catches up. Oh, that's clever. I'm using that." },
        { text = "What about your family?", next = "yfamily" },
        { text = "Run, then. She's coming.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because she said I couldn't run as fast as her, and I said I could, and she said prove it. So I took Betsy, which is the doll, and now she has to chase me, and that proves it." } },
      choices = {
        { text = "And when you get tired?", next = "tired" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tired = {
      lines = { { id = "t_default", text = "I didn't think about that part. I suppose I'll put Betsy on the fountain where she can find her, and then run home a different way, and say I won." } },
      choices = { { text = "That's nearly a plan. Something else.", next = "BACK" } },
    },
    giveback = {
      lines = {
        { id = "giveback_default", text = "I will, I will, I'm not keeping her! I don't even like dolls, and this one's got a funny eye. I just want Donna to say I'm faster first." },
        { id = "g_guardian", when = { class = { "PALADIN", "PRIEST" } }, text = "You sound like the brothers at the Cathedral, and they already told me twice. I'll give her back, I promise, as soon as Donna says I'm faster." },
      },
      choices = { { text = "See that you do. Something else.", next = "BACK" } },
    },
    faster = {
      lines = { { id = "f_default", text = "She is not! Well, she is on the straight bits, but I'm better at corners, and Stormwind's nearly all corners. Don't tell her about the corners." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_like = {
      lines = {
        { id = "x_like_l0", text = "No! Well, she's all right, for a girl who runs like a horse. Don't tell her I said that, or don't tell her the horse part." },
      },
      choices = {
        { text = "I won't. Something else.", next = "BACK" },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "It's not stealing if I'm going to give it back, is it? I'm only borrowing her at a run." },
      },
      choices = {
        { text = "Give it back now and say sorry.", next = "BACK", reply = "Oh, fine, but she has to say I'm fast first.", fx = { align = { honor = 1 } } },
        { text = "Make her work for it. It's a fair race.", next = "BACK", reply = "That's what I think! Got to go!", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    donna = { { id = "ywilliamsw4", text = "She runs like a horse, but I'm better at corners." } },
    betsy = { { id = "ywilliamsw5", text = "Donna's doll. I'm only borrowing her at a run." } },
    background = { { id = "tp_bg", text = "I'm William, and I'm the fastest in the Trade District, whatever Donna says." } },
    _none = { { id = "tp_none", text = "Don't know, can't stop to think about it!" } },
  },
}

-- Morgg Stormshot: smith at the forges of the Dwarven District.
P:NPC {
  key = "morgg_stormshot", id = TODO_NPC("Morgg Stormshot"), name = "Morgg Stormshot", gender = "male",
  bible = "bibles/missed_b.md", role = "blacksmith", tier = "service",
  communities = { "stormwind" }, temper = { "hearty", "loud" }, values = { "craft", "clan" },
  notices = { "smith", "dwarf" },
  impression = {
    first = "Morgg Stormshot works a forge in the Dwarven District and talks over his own hammer without missing a stroke of either. He measures the whole of Stormwind against Ironforge, and it comes up short.",
    third = "{name} met Morgg Stormshot, a dwarven smith at the forges of Stormwind's Dwarven District.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks, {g:lad|lass}! Stand over there where it's only warm, an' tell me what ye're after." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the forge, are ye? I knew ye'd come round tae proper dwarven work in the end." },
  },
  notice = {
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "Those are a smith's forearms, an' a smith's burns on them. Good, then I'll not have tae explain why ye never quench in canal water." },
    { id = "n_dwarf", cat = "dwarf", when = { race = "Dwarf" },
      text = "A dwarf! By my beard, it's good tae hear boots that don't clatter. Ye'll find the ale's better on this side o' the city, too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Morgg Stormshot, smith. King Magni sent a good many of us south tae help the humans arm themselves, an' I've been hammerin' in this district ever since, wi' the tram tae bring me decent coal." },
      },
      again = {
        { id = "h_again", text = "What else, then? The iron's still got a minute in it." },
        { id = "h_again2", text = "Aye, go on, I can hammer an' listen." },
      },
      choices = {
        { text = "What do you make here?", next = "make" },
        { text = "How does this forge compare to Ironforge?", next = "ironforge" },
        { text = "Stormshot sounds like a gunner's name.", next = "name" },
        { text = "Who do ye sell the gun barrels to?", next = "x_who" },
        { text = "Dwarves should arm the humans for free, as allies.", next = "x_stance" },
        { text = "Ironforge sends its best, eh?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Keep your fire hot, Morgg.", next = "END" },
      },
    },
    make = {
      lines = { { id = "m_default", text = "Whatever the city's short of, an' these days that's everythin' wi' an edge on it. Horseshoes fer the cavalry in the mornin', gun barrels fer our own lads after noon, an' the odd hinge fer a human who canna find a smith o' his own." } },
      choices = {
        { text = "Gun barrels?", next = "barrels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrels = {
      lines = {
        { id = "b_default", text = "Aye, an' they're the hardest work in the shop. A barrel has tae be bored true or it bursts in yer face, an' I've nae wish tae explain that tae some {g:lad|lass}'s mother." },
        { id = "b_hunter", when = { class = "HUNTER" }, text = "Aye, an' ye'll know why they matter, carryin' what ye carry. Keep yer barrel clean an' dry, hunter, an' if it ever rings wrong when ye tap it, bring it tae a dwarf before ye fire it again." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "i_default", text = "Ha! There's nae comparin' it, {g:lad|lass}. The Great Forge runs on the mountain's own fire, an' here I've a bellows an' a chimney, but I'll say the humans gave us good stone tae build on an' never once complained about the noise." } },
      choices = { { text = "High praise, from a dwarf. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "It is one, aye. My kin were riflemen as far back as there've been rifles, an' I'm the one who decided he'd rather make the things than point them. Somebody has tae, or the rest o' them would be throwin' rocks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_who = {
      lines = {
        { id = "x_who_l0", text = "The Stormwind rifle companies, mostly, an' a few hunters wi' more sense than coin. The army's slow tae pay, but they pay, an' they've ne'er sent one back." },
      },
      choices = {
        { text = "Is there much demand now?", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "x_who2_l0", text = "More than I can bore, wi' Redridge burnin' an' the Westfall roads full o' masks. I've an apprentice comin' down from Kharanos next month, an' he'd better have strong arms." },
      },
      choices = {
        { text = "Will Ironforge send more smiths?", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "x_who3_l0", text = "If King Magni asks it, aye, an' he's no' one tae let an ally go short. Dwarves remember who stood wi' us against the Horde." },
      },
      choices = {
        { text = "Good to hear. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_stance = {
      lines = {
        { id = "x_stance_l0", text = "Free? Ha! Ye'd have me feed my forge on gratitude. Magni sent us tae help, aye, but iron costs coin even in Ironforge." },
      },
      choices = {
        { text = "An ally gives what's needed, and settles later.", next = "BACK", reply = "A generous thought, an' my purse thanks ye for keepin' it tae yerself.", fx = { align = { light = 1 } } },
        { text = "Fair work deserves fair coin. Charge them.", next = "BACK", reply = "Spoken like a proper dwarf, whatever ye are.", fx = { align = { light = -1 } } },
      },
    },
    x_dwarf = {
      lines = {
        { id = "x_dwarf_l0", text = "Aye, the best that would come, {g:lad|lass}, an' the rest are drinkin' in the Stonefire. Ye'll find yer kin by the forge-smoke in this district." },
      },
      choices = {
        { text = "I'll look them up. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Ironforge born an' Ironforge trained, an' I'll go home when the humans can make their own barrels." } },
    rumors = { { id = "tp_rumors_x", text = "They say the Dark Irons are stirrin' in the Burning Steppes, an' I'd no' be surprised if they're sellin' arms tae the Blackrock." } },
    _none = { { id = "tp_none", text = "I kinna tell ye that, {g:lad|lass}. Ask at the tavern; a dwarf'll know, or say he does." } },
  },
}
