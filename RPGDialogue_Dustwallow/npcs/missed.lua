-- Dustwallow, the missed folk (1 of 3): Theramore's townsfolk. The Pierce family (Mikal, Amie, Sara, Dahne),
-- the inn (Bartender Lillian, Smiling Jim, Ingo Woolybush upstairs), Brant Jasperbloom, Jensen Farran,
-- Decedra Willham on the docks, Dwane Wertle and Clerk Lendry in Foothold Citadel. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mikal Pierce: father of the Pierce family.
P:NPC {
  key = "mikal_pierce", id = TODO_NPC("Mikal Pierce"), name = "Mikal Pierce", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "steady" }, values = { "family", "loyal" },
  notices = { "soldier", "race" },
  impression = {
    first = "Mikal Pierce is a Theramore householder with a wife, two children and a firm opinion that the island is the safest place left to raise them. He kept one eye on the door the whole time, in case either child came through it running.",
    third = "{name} met Mikal Pierce, a father of two who lives in Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend! Come in; the children have been asking after you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Mind the toys, and mind yourself." },
    { id = "g_default", text = "Good day to you, {class}. Mind your step coming in, for my son leaves his toys wherever he happens to drop them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The children asked after you, which means they want to hear about monsters." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've a soldier's bearing, and I'm glad of it. Every sword that passes through Theramore lets me sleep a little sounder." },
    { id = "n_orc", cat = "race", when = { faction = "Horde" },
      text = "I've no quarrel with you, but I have children in this house. Say what you came to say, and say it gently." },
  },
  start = "hello",
  nodes = {
    ynight = {
      lines = {
        { id = "ybmikalpierce1", text = "Quiet, once the children are asleep, and Amie and I sit by the hearth and talk of nothing much. Some nights I hear the guards on the wall, and I thank the Light they're there." },
        { id = "ybmikalpierce2", when = { class = { "PRIEST", "PALADIN" } }, text = "Some nights I pray, though I'm not as good at it as you, I expect. I ask for the walls to hold." },
      },
      choices = {
        { text = "A quiet family life is worth protecting.", next = "BACK", reply = "It is. Amie and I treasure it.", fx = { align = { light = 1 } } },
        { text = "A man should be out fighting, not playing house.", next = "BACK", reply = "I fought enough before. Mind the toys on your way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywork = {
      lines = {
        { id = "ymikalpierce1", text = "Roofs, fences, the odd dock plank. Whatever the town needs mended. I was a carpenter in Lordaeron, and there's more work here than there are hands, so I've never once been idle." },
      },
      choices = {
        { text = "Do you mend the walls too?", next = "ywalls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywalls = {
      lines = {
        { id = "ymikalpierce2", text = "When the Guard asks. The north wall has a weak spot near the old tower, where the ground sinks. I've told the sergeant twice, and it's still on his list of things to look at." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfear = {
      lines = {
        { id = "ymikalpierce3", text = "Some nights. Black dragons in the south, Horde to the north, and the Admiral's men who still curse the Lady's name. I've a mind to send the children east to my cousin in Menethil, but Amie won't hear of it." },
      },
      choices = {
        { text = "What do you think?", next = "ythink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ythink = {
      lines = {
        { id = "ymikalpierce4", text = "I think a family should stay together. And I think a father should keep his children safe. I can't do both." },
      },
      choices = {
        { text = "Stay together. The walls will hold.", next = "BACK", reply = "I want to believe it. Amie would be pleased to hear you say so.", fx = { align = { order = 1 } } },
        { text = "Send them east. Safety comes first.", next = "BACK", reply = "That's my fear talking back at me. I'll raise it again, gently.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Mikal Pierce. My wife Amie and I came over the sea with Lady Proudmoore's fleet, and both our children were born inside these walls. Theramore's all the home they've ever known, and I mean to keep it standing for them." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Ask, though if Dahne comes in waving a stick, I'll have to break off and rescue the furniture." },
        { id = "h_again2", text = "Go on, while the house is quiet." },
      },
      choices = {
        { text = "What was the crossing like?", next = "crossing" },
        { text = "Is Theramore a good place for children?", next = "children" },
        { text = "A marsh seems a hard place to settle.", next = "marsh" },
        { text = "What work do you do in town?", next = "ywork" },
        { text = "Do you fear for Theramore?", next = "yfear" },
        { text = "Could you use a blessing on the house?", next = "BACK", when = { class = { "PALADIN", "PRIEST" } }, reply = "I would, and Amie would be glad of it. Say it by the children's door, if you would." },
        { text = "What is the house like at night?", next = "ynight" },
        { text = "What are you building at the moment?", next = "w7_build" },
        { text = "Light keep your family.", next = "END" },
      },
    },
    w7_build = {
      lines = {
        { id = "w7_build_l1", text = "A cradle, though Amie doesn't know it yet, so keep it under your hat. My cousin's wife is expecting in the spring, and they've no carpenter, and I've a piece of good Ashenvale wood I've been saving since the crossing." },
      },
      choices = {
        { text = "That's a fine gift.", next = "w7_build2" },
        { text = "Ashenvale wood? How'd you get that?", next = "w7_build3" },
        { text = "Something else, Mikal.", next = "BACK" },
      },
    },
    w7_build2 = {
      lines = {
        { id = "w7_build2_l1", text = "It's the only thing I've ever made that I've wanted to be perfect. Every child born on this isle is a sign that we're staying, that Theramore is a home and not a camp, and I want that child to sleep in something that will last." },
        { id = "w7_build2_l2", when = { profession = "Blacksmithing" }, text = "You make things, so you'll understand: some work you do for coin, and some you do because it has to be right. This cradle's the second kind. I've rebuilt the rockers three times." },
      },
      choices = {
        { text = "It'll be beautiful.", next = "BACK", reply = "Thank you. I hope so, Light willing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_build3 = {
      lines = {
        { id = "w7_build3_l1", text = "Traded for it from a night elf off a Menethil boat, three barrels of nails for one plank. Amie thought I'd been robbed, and maybe I was, but it's the best wood I've ever touched." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crossing = {
      lines = { { id = "c_default", text = "Long, and frightened, and we didn't know what we were sailing toward. We only knew what was behind us in Lordaeron, and that Lady Jaina said to follow her, and I've never once been sorry that we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    children = {
      lines = { { id = "ch_default", text = "Inside the walls it is, and Amie and I make sure they stay inside them. Sara would follow a frog clear out to the Quagmire if we let her, and Dahne would be a step behind her with a wooden sword." } },
      choices = {
        { text = "They sound like a handful.", next = "handful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    handful = {
      lines = { { id = "ha_default", text = "They're two handfuls, and I wouldn't trade either one. After what we left behind, a house that's noisy with children is the finest sound I know." } },
      choices = { { text = "Well said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    marsh = {
      lines = { { id = "m_default", text = "It is, and I won't pretend the damp doesn't get into everything. But the marsh is a wall of its own, and since the Shady Rest burned I've been glad to have water on every side of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    amie = { { id = "ymikalpierce5", text = "My wife, and the one who keeps this house together." } },
    carpentry = { { id = "ymikalpierce6", text = "I was a carpenter in Lordaeron. Here, I mend whatever needs mending." } },
    background = { { id = "tp_bg", text = "Lordaeron born, like most here. I work where the town needs hands, and I go home to my family at night." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask one of the guards, or up at the citadel." } },
  },
}

-- Amie Pierce: mother of the Pierce family.
P:NPC {
  key = "amie_pierce", id = TODO_NPC("Amie Pierce"), name = "Amie Pierce", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "warm", "watchful" }, values = { "family" },
  notices = { "kit", "class" },
  impression = {
    first = "Amie Pierce runs the Pierce household in Theramore, and she can hold a conversation while counting two children without turning her head. She asked if I'd eaten before she asked what I wanted.",
    third = "{name} met Amie Pierce, who keeps the Pierce household in Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hello, friend! Don't worry about the boots; you're always welcome here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Wipe your boots. And please don't stay long." },
    { id = "g_default", text = "Hello, {class}. Wipe the marsh off your boots, if you'd be so kind, for I've only just swept." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sara's been telling everyone she knows a real adventurer, so you've a reputation to keep up." },
  },
  notice = {
    { id = "n_muddy", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Goodness, look at the state of you. The smith's just up the road, and you'll want to see him before you see anything else with teeth." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! We've few enough on the island, and I'd take it kindly if you said a word for this house before you go." },
  },
  start = "hello",
  nodes = {
    ygoodday = {
      lines = {
        { id = "ybamiepierce1", text = "A day when the ship comes in with flour, the children come home dry, and Mikal doesn't hit his thumb. That's perhaps twice a season, and I treasure every one of them." },
        { id = "ybamiepierce2", when = { class = "PRIEST" }, text = "Any day a priest stops by, if I'm honest. The children go quiet as mice, and I get a whole cup of tea drunk while it's still warm." },
      },
      choices = {
        { text = "A clean home is a small comfort in this marsh.", next = "BACK", reply = "It is. And comforts are rare here.", fx = { align = { order = 1 } } },
        { text = "A little mud never hurt anyone.", next = "BACK", reply = "It hurts my floor. Please, wipe your boots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylordaeron = {
      lines = {
        { id = "yamiepierce1", text = "A farmhouse outside Southshore, with an apple tree my grandfather planted. I don't know who has it now, or whether anyone does, and I've stopped asking the sailors because the answers are never kind." },
      },
      choices = {
        { text = "Do you ever hope to go back?", next = "yback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yback = {
      lines = {
        { id = "yamiepierce2", text = "I used to. Now I think of Theramore as the place my children were born, and that's a stronger root than any apple tree. If the Lady says we stay, we stay." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ymikal = {
      lines = {
        { id = "yamiepierce3", text = "He mended our cart wheel on the road south when the refugees were fleeing Lordaeron, and he wouldn't take a copper for it. I married him for that, and because he made me laugh on the worst week of my life." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = {
        { id = "yamiepierce4", text = "Of course I do. Every mother on this island has buried someone, and I'd sooner Sara grew up to bake bread than stand on a wall. But she'll choose for herself, and I have to decide whether to let her." },
      },
      choices = {
        { text = "Let her choose. A child should follow her own heart.", next = "BACK", reply = "You sound like Mikal. Perhaps you're both right, and I'm only frightened.", fx = { align = { order = 1 } } },
        { text = "Guide her firmly. A mother knows best.", next = "BACK", reply = "That's what my own mother would have said. I'll think on it, though Sara won't thank either of us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Amie Pierce, and this is our home, such as it is. My husband Mikal keeps the roof on, and I keep Sara and Dahne out of the harbour, which is the harder job by a long way." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm listening, even if I'm looking at the children." },
        { id = "h_again2", text = "Go on, dear, I'm listening. Just keep half an eye on Dahne for me; he's very quiet, and that's never good." },
      },
      choices = {
        { text = "Tell me about your children.", next = "children" },
        { text = "How does a family manage out here?", next = "manage" },
        { text = "The town seems uneasy lately.", next = "uneasy" },
        { text = "What did you leave behind in Lordaeron?", next = "ylordaeron" },
        { text = "How did you and Mikal meet?", next = "ymikal" },
        { text = "Do you worry about Sara's plans?", next = "yworry" },
        { text = "I'm from Stormwind. Do you miss the east?", next = "BACK", when = { race = "Human" }, reply = "Every day, dear, though it's Lordaeron I miss and not Stormwind. Still, it's good to hear a voice from the old kingdoms." },
        { text = "I'll say a word for this house.", next = "BACK", when = { class = "PRIEST" }, reply = "Bless you. I'll tell the children a priest prayed over them, and they'll sit still for nearly an hour." },
        { text = "What's a good day in this house?", next = "ygoodday" },
        { text = "What do you cook for the family?", next = "w7_cook" },
        { text = "Good day, Mistress Pierce.", next = "END" },
      },
    },
    w7_cook = {
      lines = {
        { id = "w7_cook_l1", text = "Fish, mostly, because Mikal brings it home from the docks in trade for mending, and a pie on rest days when the Menethil ship's been in with flour. Sara won't eat anything green, and Dahne won't eat anything Sara will, so supper is a negotiation." },
      },
      choices = {
        { text = "How do you win the negotiation?", next = "w7_cook2" },
        { text = "Children should eat what's put in front of them.", next = "w7_cook3" },
        { text = "Something else, Mistress Pierce.", next = "BACK" },
      },
    },
    w7_cook2 = {
      lines = {
        { id = "w7_cook2_l1", text = "I tell Sara the guards eat their greens to see in the fog, and I tell Dahne that Sara doesn't want him to have the last of the pie. Between those two lies, I've raised two healthy children, and I'll answer to the Light for both." },
        { id = "w7_cook2_l2", when = { class = "PRIEST" }, text = "I tell little lies, and I'll ask you to forgive them, since you've the Light's ear. Sara thinks greens let the guards see in fog, and Dahne thinks his sister wants the last of the pie. They both eat." },
      },
      choices = {
        { text = "The Light will understand.", next = "BACK", reply = "I'm counting on it, dear. Every mother on the island is." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_cook3 = {
      lines = {
        { id = "w7_cook3_l1", text = "They should, and they don't, and you'll learn that the day you have your own. Until then, I'll keep my little lies." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Sara's the elder, and small for her age, and she makes up for it by being afraid of nothing at all. Dahne follows wherever she leads, so I really only have to watch the one of them." } },
      choices = {
        { text = "What is Sara after these days?", next = "sara" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sara = {
      lines = { { id = "s_default", text = "She wants to be a guard like the ones in the training yard, and she's told Captain Thomas so to his face. He was good enough to salute her, and she's talked of nothing else since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    manage = {
      lines = { { id = "m_default", text = "With fish from the docks, flour off the ships from Menethil, and neighbours who look out for one another. We all came across the sea with nothing, so nobody here is too proud to borrow a cup of anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    uneasy = {
      lines = { { id = "u_default", text = "It has been since the inn burned on the north road. The Hyals had a little boy not much older than my Dahne, and there isn't a mother in Theramore who hasn't thought of that at night." } },
      choices = {
        { text = "I'm sorry. It weighs on everyone.", next = "BACK", reply = "It does. Thank you for saying so, and for not telling me who to blame.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    shady_rest = { { id = "yamiepierce5", text = "The Hyals kept a good house on the north road. I can't walk past the north gate now without thinking of them." } },
    lordaeron = { { id = "yamiepierce6", text = "I was born there and married there, and I'll not see it again. I've made my peace with that, mostly." } },
    background = { { id = "tp_bg", text = "I was a farmer's daughter in Lordaeron, a long time ago now. Here I'm a mother, and that's work enough." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, dear. Mikal might, or the guards." } },
  },
}

-- Sara Pierce: the Pierces' daughter (a child).
P:NPC {
  key = "sara_pierce", id = TODO_NPC("Sara Pierce"), name = "Sara Pierce", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "theramore" }, temper = { "bold" }, values = { "adventure" },
  notices = { "class", "pet" },
  impression = {
    first = "Sara Pierce is a very small girl in Theramore with a very large opinion of her own courage. She told me she is going to be a guard, and asked whether my sword was heavy, all in one breath.",
    third = "{name} met Sara Pierce, a fearless little girl who lives in Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "You came back! You're my favourite adventurer. Tell me a story, please!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Oh. You again. Mama says I shouldn't talk to strangers." },
    { id = "g_default", text = "Are you a real adventurer? You look like one, because you're all muddy and you've got scratches." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! Did you fight anything since last time, and did you win?" },
  },
  notice = {
    { id = "n_guard", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've got armor like the guards have! I'm going to have armor like that when I'm big, only mine will be shinier." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Is that {pet}? Does {pet} bite, and can I pat {pet} anyway?" },
  },
  start = "hello",
  nodes = {
    ylessons = {
      lines = {
        { id = "ybsarapierce1", text = "Yes, with the priest at the chapel, and we learn letters and numbers and about the Light. I'm good at numbers. I'm counting how many guards there are so I know how many I'll be in charge of." },
        { id = "ybsarapierce2", when = { class = "PRIEST" }, text = "Are you a priest? Our priest says the Light is in everyone, even Dahne when he's being annoying." },
      },
      choices = {
        { text = "Learning your letters is important.", next = "BACK", reply = "The priest says so too! I'm getting good at them.", fx = { align = { order = 1 } } },
        { text = "Letters are boring. Adventure is better.", next = "BACK", reply = "That's what I think! But Mama says no.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfavourite = {
      lines = {
        { id = "ysarapierce1", text = "Guard Narrisha, because she's the cleverest and she always beats the boys. And Captain Thomas, because he saluted me. Mama says I'm not to have favourites, but everyone has favourites." },
      },
      choices = {
        { text = "What about Combat Master Criton?", next = "ycriton" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycriton = {
      lines = {
        { id = "ysarapierce2", text = "He's loud. He shouted at a recruit for standing wrong and the recruit nearly cried. I'd never cry, but I'd stand properly the very first time so he wouldn't have to shout." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    youtside = {
      lines = {
        { id = "ysarapierce3", text = "The burned inn on the north road, but Mama says absolutely not, ever. And the dragons, but only from very far. And the big city across the sea, because Papa says there's a king there and he's only a boy." },
      },
      choices = {
        { text = "Would you sneak out to see them?", next = "ysneak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysneak = {
      lines = {
        { id = "ysarapierce4", text = "Maybe. Dahne says I shouldn't, because Mama would cry. But real adventurers go places, don't they?" },
      },
      choices = {
        { text = "Stay inside. Your mama's rules keep you safe.", next = "BACK", reply = "Fine. But when I'm a guard I'll go everywhere, and nobody can stop me.", fx = { align = { order = 1 } } },
        { text = "Real adventurers go where they please.", next = "BACK", reply = "I knew it! Don't tell Mama you said that, all right?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Sara, and that's my brother Dahne, and he's littler than me even though everyone says I'm little. I'm going to be a Theramore guard, and I already know how to salute." },
      },
      again = {
        { id = "h_again", text = "Ask me something else! I know lots of things." },
        { id = "h_again2", text = "What else, what else? I've got about a hundred more things to tell you, and Dahne only listens to three!" },
      },
      choices = {
        { text = "Show me your salute.", next = "salute" },
        { text = "What's the scariest thing in the marsh?", next = "scary" },
        { text = "Does your brother want to be a guard too?", next = "dahne" },
        { text = "Who's your favourite guard?", next = "yfavourite" },
        { text = "What's outside the walls you want to see?", next = "youtside" },
        { text = "Want to see a real sword drill?", next = "BACK", when = { class = { "WARRIOR", "PALADIN" } }, reply = "Yes! Do it slow so I can copy it. Wait, Dahne, come and watch, it's a real one!" },
        { text = "Do you go to lessons?", next = "ylessons" },
        { text = "What would you do if you met a dragon?", next = "w7_dragon" },
        { text = "Carry on, Guard Sara.", next = "END" },
      },
    },
    w7_dragon = {
      lines = {
        { id = "w7_dragon_l1", text = "I'd salute it first, because you're supposed to be polite to important things, and then I'd hit it right on the nose. Papa says dragons don't have noses, but they have to, or how do they smell the people they eat?" },
      },
      choices = {
        { text = "Dragons do have noses.", next = "w7_dragon2" },
        { text = "Maybe you should just run.", next = "w7_dragon3" },
        { text = "Something else, Sara.", next = "BACK" },
      },
    },
    w7_dragon2 = {
      lines = {
        { id = "w7_dragon2_l1", text = "I knew it! I'm going to tell Papa he's wrong, and then he'll have to make me a sword, because I was right and that's the rule. Will you tell him too, so he believes me?" },
        { id = "w7_dragon2_l2", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } }, text = "I knew it! You've fought monsters, so you'd know. Will you tell Papa? If he hears it from a real fighter, he'll have to make me a real sword, a little one." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", reply = "Promise? Pinky promise? All right, I believe you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_dragon3 = {
      lines = {
        { id = "w7_dragon3_l1", text = "Real guards don't run! Well, Mama says real guards run when they need to, but I think that's just something mamas say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    salute = {
      lines = { { id = "s_default", text = "Like this, with your hand flat and your back straight! Captain Thomas saluted me back once, so that means it counts, and Mama says I'm not to do it at dinner anymore." } },
      choices = { { text = "A fine salute. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scary = {
      lines = { { id = "sc_default", text = "The spiders, because they're bigger than our door and they've got too many eyes. Papa says there are dragons too, far away in the south, but I think he only says that so I'll stay inside the walls." } },
      choices = {
        { text = "Would you fight a spider?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "I would if I had a sword, and I'd hit it right in all of its eyes. But I'm not allowed a sword yet, so I'd probably have to throw Dahne's boot at it and run." } },
      choices = { { text = "A sound plan. Something else.", next = "BACK" } },
    },
    dahne = {
      lines = { { id = "d_default", text = "He wants to be whatever I am, because he copies me. So I'm going to be the captain and he can be the guard who carries things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dahne = { { id = "ysarapierce5", text = "My little brother. He's going to carry my flag." } },
    guards = { { id = "ysarapierce6", text = "I'm going to be one. I already know the salute." } },
    background = { { id = "tp_bg", text = "I was born right here in Theramore, and I've never been anywhere else, but I'm going to." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask my Papa, he knows nearly everything." } },
  },
}

-- Dahne Pierce: the Pierces' son (a child).
P:NPC {
  key = "dahne_pierce", id = TODO_NPC("Dahne Pierce"), name = "Dahne Pierce", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "theramore" }, temper = { "shy" }, values = { "his_sister" },
  notices = { "race", "pet" },
  impression = {
    first = "Dahne Pierce is a small boy in Theramore who goes wherever his sister Sara goes and stands half a step behind her. He answered my questions by looking at her first.",
    third = "{name} met Dahne Pierce, a shy little boy who lives in Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hello! Sara says you're our friend now. Do you want to see Splinter?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hello. Sara says I should go inside now." },
    { id = "g_default", text = "Hello. Sara says I'm allowed to talk to you, as long as you're not a murloc." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I remembered you, and I told Sara I would." },
  },
  notice = {
    { id = "n_small", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "You're nearly as short as me! Are you a grown-up, though, because you've got a grown-up face?" },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "I like {pet}. I asked for one of those and Mama said we've got a cat already, but it isn't the same." },
  },
  start = "hello",
  nodes = {
    yname = {
      lines = {
        { id = "ybdahnepierce1", text = "It's called Splinter, because the first time I hit the fence it gave me a splinter. Papa says a real sword needs a real name, and Sara said Splinter was silly, but I'm keeping it." },
        { id = "ybdahnepierce2", when = { class = { "WARRIOR", "PALADIN" } }, text = "What's your sword called? Is it something brave? Mine's called Splinter, but that's brave too." },
      },
      choices = {
        { text = "Splinter is a fine name for a sword.", next = "BACK", reply = "Papa says so too! I'm going to be a guard.", fx = { align = { honor = 1 } } },
        { text = "Wooden swords are for babies.", next = "BACK", reply = "They're not! Sara, they said a mean thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscared = {
      lines = {
        { id = "ydahnepierce1", text = "Only a little. Mama says the walls are strong and the guards are awake, but sometimes at night I hear a big splash out in the water and I count the guards I can see from my window." },
      },
      choices = {
        { text = "How many can you see?", next = "ycount" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycount = {
      lines = {
        { id = "ydahnepierce2", text = "Three, if the fog isn't there. When the fog comes I can't see any, so I count them in my head instead, and I always make it four so there's one extra." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ypapa = {
      lines = {
        { id = "ydahnepierce3", text = "He fixes roofs and fences, and he made my sword, and once he fixed the captain's door. Papa says I can help him when I'm older, but I want to be a guard like Sara, or a sailor, I haven't decided." },
      },
      choices = {
        { text = "Which would you choose?", next = "ychoose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychoose = {
      lines = {
        { id = "ydahnepierce4", text = "Sara says guard, because then we can be together. But sailors go everywhere and bring shells back. What do you think I should be?" },
      },
      choices = {
        { text = "A guard, like Sara. Stand by your family.", next = "BACK", reply = "Then I'll carry the flag, and I'll carry it really straight.", fx = { align = { honor = 1 } } },
        { text = "A sailor. See the world for yourself.", next = "BACK", reply = "I'd bring you back a shell, a big one! Don't tell Sara I said maybe.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dahne. I've got a wooden sword that Papa made, and a sister, and she says when she's the captain I get to carry the flag." },
      },
      again = {
        { id = "h_again", text = "Um, did you want to ask something else?" },
        { id = "h_again2", text = "I'm still here. I didn't go anywhere, I promise, I was only looking at your boots." },
      },
      choices = {
        { text = "That's a fine sword. Do you practise?", next = "sword" },
        { text = "What do you like best in Theramore?", next = "best" },
        { text = "You don't have to do what Sara says.", next = "sara" },
        { text = "Are you scared of the marsh?", next = "yscared" },
        { text = "What does your Papa do?", next = "ypapa" },
        { text = "I'm short like you, and I'm a grown-up.", next = "BACK", when = { race = { "Gnome", "Dwarf" } }, reply = "Really? Then maybe I'll be a grown-up before I'm tall. I'm going to tell Sara that, because she says I have to wait." },
        { text = "What's your sword's name?", next = "yname" },
        { text = "What's in your pocket, Dahne?", next = "w7_pocket" },
        { text = "Goodbye, Dahne.", next = "END" },
      },
    },
    w7_pocket = {
      lines = {
        { id = "w7_pocket_l1", text = "A rock that looks like a fish, a button from Captain Thomas' coat that I found in the yard, and a piece of bread for later. The button's a secret, so don't tell anyone, because I think he might want it back." },
      },
      choices = {
        { text = "You should give the button back.", next = "w7_pocket2" },
        { text = "That's a good collection.", next = "w7_pocket3" },
        { text = "Something else, Dahne.", next = "BACK" },
      },
    },
    w7_pocket2 = {
      lines = {
        { id = "w7_pocket2_l1", text = "I know. I'm going to, when I'm brave enough. Sara says he'll shout, but Mama says he only shouts at soldiers, and I'm not a soldier yet." },
        { id = "w7_pocket2_l2", when = { race = { "Gnome", "Dwarf" } }, text = "I know. Would you come with me, since you're a grown-up who's little like me? If he shouts, he'll shout at both of us, and then it's only half as loud." },
      },
      choices = {
        { text = "I'm sure he won't shout.", next = "BACK", reply = "Really? Then I'll give it back tomorrow. Maybe the day after." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_pocket3 = {
      lines = {
        { id = "w7_pocket3_l1", text = "Thank you! Sara says it's just rubbish, but she doesn't have a fish rock, so she's only jealous." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = { { id = "s_default", text = "Every day, on the fence post, because it doesn't hit back. Sara hits back, and she's got sharp elbows, so I mostly practise on the post." } },
      choices = { { text = "A wise choice. Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "The docks, when the big ship comes in from far away and everybody carries boxes off it. Once a sailor gave me a shell that you can hear the sea in, even though the sea is right there already." } },
      choices = {
        { text = "Do you still have the shell?", next = "shell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shell = {
      lines = { { id = "sh_default", text = "It's under my bed, in a sock, so Sara can't find it. Please don't tell her about the sock." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sara = {
      lines = { { id = "sa_default", text = "I know, but she has the best ideas, and when I have ideas they're mostly about the same thing she already thought of. I don't mind carrying the flag." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    sara = { { id = "ydahnepierce5", text = "She's my sister. She's bossy, but she's the best." } },
    shell = { { id = "ydahnepierce6", text = "It's a secret. It's under my bed in a sock." } },
    background = { { id = "tp_bg", text = "I'm the littlest one in our house, but I'm going to be bigger than Sara one day, Papa said." } },
    _none = { { id = "tp_none", text = "I don't know. Sara might know, she's older." } },
  },
}

-- Smiling Jim (James Hyal): sits beside the inn; kept the Shady Rest before it burned.
P:NPC {
  key = "smiling_jim", id = TODO_NPC("Smiling Jim"), name = "Smiling Jim", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "broken", "distant" }, values = { "his_family" },
  notices = { "class" },
  impression = {
    first = "They call him Smiling Jim, and he sits beside the Theramore inn with a smile fixed on his face and nothing at all behind it. He kept the Shady Rest until it burned with his wife and son inside, and he talks as though they were only late.",
    third = "{name} met Smiling Jim, the innkeeper of the burned Shady Rest, who sits beside the inn at Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome, welcome, friend! There's always a table for you. Sit, sit." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome. A table will be free in a moment. Or perhaps not." },
    { id = "g_default", text = "Welcome, welcome, friend, and sit yourself down. There'll be a table free in a moment, I'm sure of it, once Lynn has cleared the plates." },
    { id = "g_back", when = { metBefore = true }, text = "I know you, don't I? You've stayed with us before, and you'll have your usual." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A servant of the Light, at my door. You'll want a quiet room, away from the taproom, and my boy will show you up when he comes back." },
  },
  start = "hello",
  nodes = {
    yfav = {
      lines = {
        { id = "ybsmilingjim1", text = "The evening, when the hearth is warm and the travellers tell their stories. A soldier's tale, a trader's lie, a song from the Barrens. I could listen all night, and some nights I do." },
        { id = "ybsmilingjim2", when = { race = "Tauren" }, text = "A tauren! You must have a story from the plains. Sit, and tell me while I fetch your supper." },
      },
      choices = {
        { text = "The evening hearth brings out the best stories.", next = "BACK", reply = "It does. It does. Sit, and listen.", fx = { align = { light = 1 } } },
        { text = "The inn's a ruin. You should leave.", next = "BACK", reply = "A table will be free in a moment. A moment.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yguests = {
      lines = {
        { id = "ysmilingjim1", text = "Oh, all sorts. Theramore soldiers, Horde traders who keep their voices low, and sometimes a gentleman in a fine cloak who asks a great many questions about the road. He was here only the other night, I'm sure of it." },
      },
      choices = {
        { text = "What did the gentleman ask?", next = "ygentleman" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygentleman = {
      lines = {
        { id = "ysmilingjim2", text = "Which way the patrols rode, and how often, and whether the Lady ever came this way. I thought it odd, but a good innkeeper doesn't pry. Lynn didn't like him, and she's usually right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfire = {
      lines = {
        { id = "ysmilingjim3", text = "No, no. There was a smell of smoke, I said. I'd rather not, friend. Talk of the fire makes the room cold, and Lynn doesn't like the room cold. Should I remember it, do you think?" },
      },
      choices = {
        { text = "Remember, Jim. The truth will let you rest.", next = "BACK", reply = "The truth. Yes, perhaps. It's very dark there, friend, and I'm not ready yet.", fx = { align = { light = 1 } } },
        { text = "Forget it. Some things are kinder left alone.", next = "BACK", reply = "That's kind of you, friend. Sit by the fire and we'll talk of nicer things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "They call me Smiling Jim, for I've a smile for every traveller on the north road. Mead or beer, a bed and a hot plate, and nobody's ever left my house hungry." },
      },
      again = {
        { id = "h_again", text = "What'll it be, friend? Only say the word, and I'll fetch it." },
        { id = "h_again2", text = "Yes, yes, I'm with you. I was only listening for the door." },
      },
      choices = {
        { text = "Tell me about your inn.", next = "inn" },
        { text = "Who is Lynn?", next = "lynn" },
        { text = "Jim, this isn't the Shady Rest.", next = "truth" },
        { text = "Who stays at your inn these days?", next = "yguests" },
        { text = "Do you remember the night of the fire?", next = "yfire" },
        { text = "Jim, you can rest now. Go to the Light.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, reply = "Rest? I can't rest, friend, not with the hearth to keep. Lynn will be home soon, and someone must have the kettle on." },
        { text = "What's your favourite part of the job?", next = "yfav" },
        { text = "What's on your menu tonight, Jim?", next = "w7_menu" },
        { text = "Rest easy, Jim.", next = "END" },
      },
    },
    w7_menu = {
      lines = {
        { id = "w7_menu_l1", text = "Oh, the best of everything, friend! Lynn's made her marsh pie, and there's a ham hanging since market day, and I've a cask of Thunderbrew that came in on the Menethil boat. Sit, sit, and I'll bring you a plate." },
      },
      choices = {
        { text = "I'll take the pie.", next = "w7_menu2" },
        { text = "Jim, there's no kitchen here.", next = "w7_menu3" },
        { text = "Something else, Jim.", next = "BACK" },
      },
    },
    w7_menu2 = {
      lines = {
        { id = "w7_menu2_l1", text = "An excellent choice! Lynn will be so pleased. She always says a guest who chooses the pie is a guest who'll come back. Here you are, friend, mind, it's hot, it's always hot." },
        { id = "w7_menu2_l2", when = { class = { "PRIEST", "PALADIN" } }, text = "An excellent choice! Lynn says a priest at the table is a blessing on the whole house, and the pie always comes out better on those nights. Mind, it's hot." },
      },
      choices = {
        { text = "Thank you, Jim.", next = "BACK", reply = "Not at all, not at all. That's what the Shady Rest is for." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_menu3 = {
      lines = {
        { id = "w7_menu3_l1", text = "No kitchen? Of course there is, it's just there, behind... behind the... I'll go and see where Lynn's got to. She'll know. She always knows." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "The Shady Rest, on the road through the marsh, with the best kitchen between Theramore and the Barrens. My brother Vincent said I was mad to build out there, and every full table since has proved him wrong." } },
      choices = {
        { text = "Your brother, Vincent?", next = "vincent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vincent = {
      lines = { { id = "v_default", text = "He's across the sea in Menethil Harbor, and he writes when he remembers to. I ought to write to him, and I will, as soon as things are a little less busy here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lynn = {
      lines = { { id = "l_default", text = "My wife, and the real head of the house, as she'll tell you herself. She's only stepped out to the back with little Jimmy, and they'll be along directly, they always are." } },
      choices = {
        { text = "I'm sure they will, Jim.", next = "BACK", reply = "Of course they will. Sit, sit, and I'll tell her we've company.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "No, I suppose it isn't. There was a smell of smoke, and then I was walking, and I don't remember the road. You'll forgive me, friend, but I'd sooner talk about what you'll have to drink." } },
      choices = { { text = "Of course. Something else.", next = "BACK" } },
    },
  },
  topics = {
    fire = { { id = "ybsmilingjim3", text = "There was smoke, I said. I'd rather not talk of it." } },
    lynn = { { id = "ysmilingjim4", text = "My wife, and the real head of the house. She'll be along directly." } },
    vincent = { { id = "ysmilingjim5", text = "My brother, in Menethil. I ought to write." } },
    background = { { id = "tp_bg", text = "I'm an innkeeper, friend, and so was my father. My brother went to sea and I stayed by the hearth." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask Lynn when she comes in; she'll know." } },
  },
}

-- Ingo Woolybush: Explorers' League, upstairs in the Theramore inn.
P:NPC {
  key = "ingo_woolybush", id = TODO_NPC("Ingo Woolybush"), name = "Ingo Woolybush", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "theramore" }, temper = { "hearty", "stubborn" }, values = { "discovery" },
  notices = { "race", "craft" },
  impression = {
    first = "Ingo Woolybush is a dwarf of the Explorers' League who has taken a room upstairs at the Theramore inn and covered every flat surface in it with maps. He talks about the marsh as other dwarves talk about a mountain nobody has dug into yet.",
    third = "{name} met Ingo Woolybush of the Explorers' League, who keeps a room above the Theramore inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ah, there ye are! Come in, the maps are in order, an' I've a new one to show ye!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Mind the maps. Don't touch them. What do ye want?" },
    { id = "g_default", text = "Mind the maps, {g:lad|lass}, they're in an order even if ye cannae see it! Now then, what can the Explorers' League do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Ach, it's yerself again. Step over the big chart there, the ink's not dry." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "By my beard, a proper dwarf in this bog! Sit down and tell me the news from Ironforge, and whether the ale there is still better than what they pour below." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "That's a miner's pick on yer pack, and well used. Ye'll know good stone when ye see it, then, which is more than I can say for anyone else on this island." },
  },
  start = "hello",
  nodes = {
    yvaluable = {
      lines = {
        { id = "ybingowoolybush1", text = "A gold coin from the old ogre ruins, stamped with a face I cannae name. The League will want it, and the Lady might want it too. I've kept it in my boot until I know who has the better claim." },
        { id = "ybingowoolybush2", when = { race = "Dwarf" }, text = "I'd show ye, if ye promise nae to tell the humans. A dwarf knows the value o' keeping one's mouth shut." },
      },
      choices = {
        { text = "Old maps teach us what the land has forgotten.", next = "BACK", reply = "Aye, they do! Ye understand.", fx = { align = { order = 1 } } },
        { text = "Maps are just paper. The land tells the truth.", next = "BACK", reply = "Then go an' walk it. Leave my maps alone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleague = {
      lines = {
        { id = "yingowoolybush1", text = "Titan works, if ye ask the old men in the Hall of Explorers. Every scrap o' the old makers' stone on this continent, mapped and measured. Out here I've found ogre ruins and dragon bones, and one odd carved stone I cannae read." },
      },
      choices = {
        { text = "Where's the stone?", next = "ystone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystone = {
      lines = {
        { id = "yingowoolybush2", text = "Out by the Quagmire, half sunk in the peat. I could dig it out for the League, or leave it where it's sat for ten thousand years. The tauren who pass say it should be left." },
      },
      choices = {
        { text = "Dig it out. Knowledge belongs to everyone.", next = "BACK", reply = "Aye, that's the League's creed. I'll need a bigger shovel and more courage.", fx = { align = { order = 1 } } },
        { text = "Leave it. Some things should stay where they lie.", next = "BACK", reply = "Ye sound like my grandmother. Still, I'll sketch it and let it be, for now.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylillian = {
      lines = {
        { id = "yingowoolybush3", text = "A fine woman, and she pours a fair ale, though nae as fair as Thunderbrew. She lets me spread my charts on the corner table after supper, and I bring her a mug o' something from every ship that docks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ingo Woolybush, of the Explorers' League, at yer service. The League sent me west to see what's under all this mud, and I'll tell ye, there's a good deal more than the humans think." },
      },
      again = {
        { id = "h_again", text = "What else are ye after, {g:lad|lass}? I've a map for nearly everything in this bog, and a guess for the rest." },
        { id = "h_again2", text = "Aye, go on, I can talk and draw." },
      },
      choices = {
        { text = "What's under the mud?", next = "under" },
        { text = "Why work from an inn?", next = "inn" },
        { text = "A swamp is a strange place for a dwarf.", next = "swamp" },
        { text = "What's the League after, really?", next = "yleague" },
        { text = "What news would you send Ironforge?", next = "BACK", when = { race = "Dwarf" }, reply = "That the marsh hides more than mud, and I need more paper and another pair o' boots. Tell Magellas I'm still alive, if ye see him." },
        { text = "Tell me about Lillian at the inn.", next = "ylillian" },
        { text = "Have you found anything valuable?", next = "yvaluable" },
        { text = "What does the League think of your findings?", next = "w7_league" },
        { text = "I'll mind the maps. Farewell.", next = "END" },
      },
    },
    w7_league = {
      lines = {
        { id = "w7_league_l1", text = "Not much, yet, since half my letters never reach Ironforge. The ones that do come back with notes from Brann's people saying 'more drawings, fewer opinions', which I take as a compliment to my opinions." },
      },
      choices = {
        { text = "What are your opinions?", next = "w7_league2" },
        { text = "You should send more drawings.", next = "w7_league3" },
        { text = "Something else, Ingo.", next = "BACK" },
      },
    },
    w7_league2 = {
      lines = {
        { id = "w7_league2_l1", text = "That there's titan work under this marsh, older than the ogre mounds and older than the dragons, and that the black flight knows it. Why else would a broodmother settle in a bog, when she could have a mountain?" },
        { id = "w7_league2_l2", when = { race = "Dwarf" }, text = "That there's titan work under this marsh, and that the black dragons know it. Ye'll understand, bein' one of us; we were made from the stone, and I can feel it humming under the peat at night. Somethin's down there." },
      },
      choices = {
        { text = "That's a bold theory.", next = "BACK", reply = "Aye, and I'll prove it, if the bog doesnae swallow me first." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_league3 = {
      lines = {
        { id = "w7_league3_l1", text = "I do, and they're grand drawings, if I say so myself. But a drawing of a stone doesnae tell ye what the stone means, and that's the bit I care about." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    under = {
      lines = { { id = "u_default", text = "Bones, for a start, great dragon bones down in the Wyrmbog that are older than any kingdom. And ruins where the ogres used to live, which were somebody else's ruins before that, if I'm reading the stonework right." } },
      choices = {
        { text = "Have you seen them yourself?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "From a distance, aye, and a healthy one. The bones have living dragonkin walking among them, and I'm an explorer, not a fool, so I draw what I can see from the high ground and I come home for supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inn = {
      lines = { { id = "i_default", text = "Because it's dry, {g:lad|lass}, and that's a rare thing in Dustwallow. Paper rots in a tent out here in a week, and Lillian downstairs keeps a decent keg, so I've no cause to complain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "sw_default", text = "It is, and my boots will never forgive me for it. But the League goes where the old secrets are, and nae dwarf ever found anything worth finding by staying where it was comfortable." } },
      choices = { { text = "Spoken like an explorer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    explorers_league = { { id = "yingowoolybush4", text = "The finest society o' scholars and diggers in the world, and I'll hear nae argument." } },
    wyrmbog = { { id = "yingowoolybush5", text = "Bones older than any kingdom, and dragons walking among them. I draw from a distance." } },
    background = { { id = "tp_bg", text = "Explorers' League, and proud of it. I've dug in Loch Modan and the Badlands, and this is the wettest hole yet." } },
    _none = { { id = "tp_none", text = "That's not on any o' my maps, I'm afraid. Ask the humans; it's their island." } },
  },
}

-- Jensen Farran: bowyer.
P:NPC {
  key = "jensen_farran", id = TODO_NPC("Jensen Farran"), name = "Jensen Farran", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "plain" }, values = { "craft" },
  notices = { "class", "pet" },
  impression = {
    first = "Jensen Farran makes and sells bows on Theramore Isle, and the guard's archers buy from nobody else. He speaks plainly and sights along every arrow before it leaves his hand.",
    third = "{name} met Jensen Farran, the bowyer of Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. I've a bow set aside for you, the best of the season." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Tell me what you'll shoot, and I'll sell you a bow." },
    { id = "g_default", text = "Good day, {class}. If you're after a bow, tell me what you mean to shoot at, because a raptor and a murloc want different arrows." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more shafts? The marsh eats arrows, I've always said so." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one who looks after the string, I see. We'll get on well, for I've little patience with those who don't." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "That's a fine animal at your heel. Keep {pet} out of the fletching, if you would, for feathers bring out the worst in them." },
  },
  start = "hello",
  nodes = {
    yfamily = {
      lines = {
        { id = "ybjensenfarran1", text = "A son, ten summers old, who'd rather fish than fletch. I don't push him. A boy who's made to learn his father's trade will hate it, and I'd rather he loved something else than hated my workbench." },
        { id = "ybjensenfarran2", when = { class = "HUNTER" }, text = "He'd follow you about like a pup, if you let him. He thinks hunters are the bravest folk alive." },
      },
      choices = {
        { text = "The right bow for the right beast.", next = "BACK", reply = "Exactly. A raptor and a deer need different bows.", fx = { align = { order = 1 } } },
        { text = "Any bow will do, if you can aim.", next = "BACK", reply = "Then buy any bow, and see what happens.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywood = {
      lines = {
        { id = "yjensenfarran1", text = "Yew from the east when the ships bring it, and marsh ash when they don't. The ash is soft and the damp loves it, but I've a trick with hot oil and patience that makes a passable longbow." },
      },
      choices = {
        { text = "Teach me the trick?", next = "ytrick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrick = {
      lines = {
        { id = "yjensenfarran2", text = "That's a family secret, and it's been in my family three generations. Some bowyers say every trick should be shared so every archer's better, and some say a craftsman's secrets feed his children." },
      },
      choices = {
        { text = "Keep it. Your family earned that secret.", next = "BACK", reply = "Aye, I will. My son can have it when he's old enough to be trusted with it.", fx = { align = { honor = 1 } } },
        { text = "Share it. More good bows means more soldiers live.", next = "BACK", reply = "You make a fair point, and I hate fair points. I'll show Lasiter, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Jensen Farran, bowyer. I string for the Theramore Guard and for any hunter with sense enough to come by, and I've not had a bow come back broken that wasn't the owner's fault." },
      },
      again = {
        { id = "h_again", text = "What else did you want to know? Ask, while I've a fletching between my teeth and can't argue back." },
        { id = "h_again2", text = "Go on, I'm only fletching." },
      },
      choices = {
        { text = "What do the guard's archers shoot at?", next = "guard" },
        { text = "How does a bow fare in this damp?", next = "damp" },
        { text = "I hunt. What would you carry out there?", next = "hunter", when = { class = "HUNTER" } },
        { text = "What do you think of Lady Proudmoore?", next = "kt_jaina" },
        { text = "Do you sell to the Horde hunters too?", next = "BACK", when = { class = "HUNTER" }, reply = "Not over the counter, no. If one came to the door I'd give him a fair word, mind, under the Lady's peace." },
        { text = "What wood do you use here?", next = "ywood" },
        { text = "Do you have family on the island?", next = "yfamily" },
        { text = "What's the hardest bow you ever made?", next = "w7_hard" },
        { text = "Straight shooting, Jensen.", next = "END" },
      },
    },
    w7_hard = {
      lines = {
        { id = "w7_hard_l1", text = "A longbow for the Admiral himself, taller than I am, from a stave of Kul Tiran yew that took two years to season. He drew it once on the deck of the flagship, said it would do, and I've never been prouder of anything." },
      },
      choices = {
        { text = "What happened to it?", next = "w7_hard2" },
        { text = "Pride's a dangerous thing.", next = "w7_hard3" },
        { text = "Something else, Jensen.", next = "BACK" },
      },
    },
    w7_hard2 = {
      lines = {
        { id = "w7_hard2_l1", text = "It went down with him, off the coast of Durotar. I think about it some nights, lying at the bottom of the sea with the string rotted off, and I wonder if he had it in his hand at the end." },
        { id = "w7_hard2_l2", when = { class = "HUNTER" }, text = "It went down with him off Durotar. You'll know what it is to lose a weapon you trusted; I lost one I made and never held again. Every bow since, I've made a little better, for him." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", reply = "Don't be. It's a good place for a bow to end, with a good man." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_hard3 = {
      lines = {
        { id = "w7_hard3_l1", text = "It is, but a craftsman without a little pride makes nothing worth keeping." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = { { id = "guard_default", text = "Straw targets, mostly, and thank the Light for that. Guard Lasiter's at the butts from morning to dusk, and he goes through more of my arrows than the rest of the garrison put together." } },
      choices = {
        { text = "Is he any good?", next = "lasiter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lasiter = {
      lines = { { id = "l_default", text = "He's the best shot on the island, and he'd be better still if he believed it. I've told him a man who never misses the straw ought to stop apologising to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "d_default", text = "Badly, unless you wax the string and keep the wood oiled, and I'll tell every customer so until I'm hoarse. This air will take the spring out of good yew in a season if you let it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "h2_default", text = "Something with a heavy draw, and twice the arrows you think you need. The raptors north of the road don't go down to one shaft, and the crocolisks hardly notice the first two." } },
      choices = { { text = "Twice the arrows, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "I made bows for the Admiral's marines for twenty years, and I made them for his daughter's guard after he fell, so you can guess how often I've chewed on that. She chose the right side, I think, but I'll never understand how she could watch her own father go down and still call it the right side." } },
      choices = {
        { text = "Watch a father die? She should have stopped it.", next = "BACK", reply = "Aye, that's the part I can't get past either. A daughter ought to have found some other way.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She chose peace over a war he couldn't win.", next = "BACK", reply = "Maybe so, and the marsh is quieter for it. I'll keep stringing her guards' bows and keep my thoughts to myself.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lasiter = { { id = "yjensenfarran3", text = "The best shot on the island, and the last to believe it." } },
    yew = { { id = "yjensenfarran4", text = "Comes from the east, when the ships remember to bring it." } },
    jaina = { { id = "tp_ktjaina", text = "The Lady? She chose the right side, I suppose, though I'll never understand how she bore the cost of it." } },
    background = { { id = "tp_bg", text = "I learned the trade in Kul Tiras, making bows for ships' marines. I came over with the fleet and never found a reason to stop." } },
    _none = { { id = "tp_none", text = "Couldn't say. I know wood and string, and that's the length of it." } },
  },
}

-- Decedra Willham: on the Theramore docks, directing travellers to the ship.
P:NPC {
  key = "decedra_willham", id = TODO_NPC("Decedra Willham"), name = "Decedra Willham", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "brisk", "cheerful" }, values = { "order" },
  notices = { "travel", "race" },
  impression = {
    first = "Decedra Willham stands on the Theramore docks and tells every traveller where the ship is going before they can ask. She knows the tides and the sailing times by heart, and I doubt anyone has missed a boat on her watch.",
    third = "{name} met Decedra Willham, who directs travellers on the docks of Theramore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend! The pier's yours, and I'll make sure you get the best spot on the boat." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. This is the pier for Menethil. Get on or get off." },
    { id = "g_default", text = "Good day, {class}! This is the pier for Menethil Harbor, and if that's not where you're bound, you're standing in the wrong place." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Coming or going this time?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Bound for home, I'd guess? From Menethil it's the road through the Wetlands and up to Loch Modan, and you'll want dry socks for all of it." },
    { id = "n_mount", cat = "travel", when = { mounted = true },
      text = "You'll need to lead that animal aboard on foot, if you please. The captain's very particular about his deck." },
  },
  start = "hello",
  nodes = {
    ymenethil = {
      lines = {
        { id = "ydecedrawillham1", text = "Damp, much like here, but older and greyer, with dwarves on the docks and a keep that's half sunk into the bog. I've only seen it from the rail, mind, because I never get off the boat at the far end." },
      },
      choices = {
        { text = "The boats keep Theramore connected to home.", next = "BACK", reply = "They do! Without them, we'd be very lonely.", fx = { align = { order = 1 } } },
        { text = "Theramore doesn't need the Eastern Kingdoms.", next = "BACK", reply = "Perhaps. But the flour comes from there.", fx = { align = { order = -1 } } },
        { text = "Why not?", next = "ywhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhy = {
      lines = {
        { id = "ydecedrawillham2", text = "Because my father's a ship away from there, in Boralus, and if I got off in Menethil I might keep going. I've not decided whether I want to see him again, and the pier lets me put off deciding." },
      },
      choices = {
        { text = "Go and see him. He's your father.", next = "BACK", reply = "Maybe I will. Next season, when the tides are kinder. I always say that, mind.", fx = { align = { honor = 1 } } },
        { text = "Stay. You chose this place for a reason.", next = "BACK", reply = "I did, and some days I even remember what it was. Thank you for that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymissed = {
      lines = {
        { id = "ydecedrawillham3", text = "A lieutenant once, carrying dispatches for the Lady, who stopped for one last drink at the inn. He watched the sails go from the end of this pier, and I've never heard a man swear so inventively in my life." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Decedra Willham, and I see that folk get on the right ship and off at the right end. The vessel from this pier crosses to Menethil Harbor in the Wetlands, and she's the only regular passage east we have." },
      },
      again = {
        { id = "h_again", text = "Anything else before she sails? Quickly, now; the captain hates a slow gangplank more than a storm." },
        { id = "h_again2", text = "Quick as you like, I've an eye on the tide." },
      },
      choices = {
        { text = "What's the crossing like?", next = "crossing" },
        { text = "What comes in on the ship?", next = "cargo" },
        { text = "You must see everyone who comes and goes.", next = "everyone" },
        { text = "Do the Kul Tiras folk here love Lady Proudmoore?", next = "kt_jaina" },
        { text = "What's Menethil Harbor like?", next = "ymenethil" },
        { text = "Has anyone missed the ship badly?", next = "ymissed" },
        { text = "Any news of Ironforge off the boat?", next = "BACK", when = { race = "Dwarf" }, reply = "Only that the Menethil road's still bad and the dwarves at the Thandol Span are complaining about it. Same as last season, so I suppose that's good news." },
        { text = "What's the strangest passenger you've seen board?", next = "w7_odd" },
        { text = "Thank you. Fair tides.", next = "END" },
      },
    },
    w7_odd = {
      lines = {
        { id = "w7_odd_l1", text = "A goblin with a crate of live crabs he swore were trained, a night elf priestess who wouldn't step on the deck until it had been blessed, and once a dwarf who tried to bring his ram aboard and wouldn't take no for an answer." },
      },
      choices = {
        { text = "Did the ram sail?", next = "w7_odd2" },
        { text = "That's a busy pier.", next = "w7_odd3" },
        { text = "Something else, Decedra.", next = "BACK" },
      },
    },
    w7_odd2 = {
      lines = {
        { id = "w7_odd2_l1", text = "It did, tied to the mast, and it was sick the whole way to Menethil, and so was the dwarf. They both came back three months later on the return voyage, looking very pleased with themselves." },
        { id = "w7_odd2_l2", when = { race = "Dwarf" }, text = "It did, tied to the mast. One of your lot, he was, and I'll say this for dwarves: you're loyal to your rams to a fault. If you meet a dwarf named Brodun in Menethil with a seasick ram, tell him I said hello." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", reply = "And tell him the mast still smells of goat." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_odd3 = {
      lines = {
        { id = "w7_odd3_l1", text = "Busy, and odd, and never the same twice. That's why I keep the job." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crossing = {
      lines = { { id = "c_default", text = "Long, but easy enough in fair weather, around the cape and across the Great Sea. Keep to the middle of the deck if your stomach's unsure, and don't lean over the rail to look at the sharks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cargo = {
      lines = { { id = "ca_default", text = "Flour, iron and letters, in that order of weight and the opposite order of importance. Half the people on this island have family in the east, and you should see the pier on the days a mail sack comes ashore." } },
      choices = {
        { text = "Do letters go the other way too?", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Every sailing, and I carry the sack aboard myself. There's a man in Menethil who writes to his brother here every month, and it's been hard lately, knowing what the answers can't say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everyone = {
      lines = { { id = "e_default", text = "I do, and I remember most of them. More swords and fewer families are coming ashore these days, which tells you what the east thinks is happening out here." } },
      choices = { { text = "And what do you think?", next = "BACK", reply = "I think Lady Proudmoore has kept us safe this long, and I'll keep meeting the ship until she says otherwise." } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "Love her? Half the old quay families won't say her name, and the other half say it too often. My own father served the Admiral, and he took the first ship home to Boralus once he heard the Lady had stood with the orcs, so I'll let you guess which half I was raised in." } },
      choices = {
        { text = "Your father was right to go home.", next = "BACK", reply = "He thought so, and he writes every season to say so. I stayed for the sea air, and for nothing else.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She saved this town. Your father was wrong.", next = "BACK", reply = "Perhaps, but you'd not say it to him twice. I'll grant you she keeps the ships sailing on time.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    menethil = { { id = "ydecedrawillham4", text = "Across the sea in the Wetlands. Damp, grey and full of dwarves." } },
    boralus = { { id = "ydecedrawillham5", text = "My father's home, and mine once. I've not been back." } },
    jaina = { { id = "tp_ktjaina", text = "My father went home to Boralus when the Lady sided with the orcs. I stayed, and I've not decided yet which of us was the fool." } },
    background = { { id = "tp_bg", text = "I grew up on the quays of Kul Tiras, so a pier is the nearest thing I have to a home street." } },
    _none = { { id = "tp_none", text = "That's not come in on any ship of mine. Ask up in the town." } },
  },
}

-- Dwane Wertle: chef in Foothold Citadel.
P:NPC {
  key = "dwane_wertle", id = TODO_NPC("Dwane Wertle"), name = "Dwane Wertle", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "bossy", "generous" }, values = { "a_full_plate" },
  notices = { "craft", "soldier" },
  impression = {
    first = "Dwane Wertle is the chef of Foothold Citadel, and she runs her kitchen the way the captains wish they could run the garrison. She handed me a bowl and an order to eat it in the same motion.",
    third = "{name} met Dwane Wertle, the chef who feeds the garrison at Foothold Citadel.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "In, in, friend! I've a hot pot with your name on it, and no charge today." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "In or out, but not in the doorway. Pay first." },
    { id = "g_default", text = "In or out, {class}, but not in the doorway, for I've hot pots coming through. If you're hungry, say so, and I'll see to it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, so the food can't have been that bad. Sit where you sat before." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You're eyeing my pots like someone who knows what's in them. Go on then, taste it, and tell me what it wants, though the answer had better not be salt." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Another fighter to feed. You lot eat like wolves and say thank you like wolves, but I'll not see you go out hungry." },
  },
  start = "hello",
  nodes = {
    yfeast = {
      lines = {
        { id = "ybdwanewertle1", text = "Roast boar from the Barrens, when the traders bring it, and a fish stew with every herb Uma will sell me. On the Lady's name day I bake a honey cake, and the whole garrison pretends it's not their favourite." },
        { id = "ybdwanewertle2", when = { race = "Dwarf" }, text = "For a dwarf, I'd roast a ram, if I had one. I'll settle for a boar and a barrel, and you'll not complain." },
      },
      choices = {
        { text = "A good feast keeps the town cheerful.", next = "BACK", reply = "It does, and a cheerful garrison eats its greens without complaint. A feast is the cheapest morale there is, if you know how to stretch it.", fx = { align = { light = 1 } } },
        { text = "A feast is a waste of good supplies.", next = "BACK", reply = "Then you'll not be at my table. Out of the doorway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystrange = {
      lines = {
        { id = "ydwanewertle1", text = "Crocolisk tail in a Kul Tiras fish pie, the week the supply ship sank. The lads ate it to the last crumb and asked for more, and I've never told them what it was. You'll keep that to yourself." },
      },
      choices = {
        { text = "What does the Lady eat?", next = "ylady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylady = {
      lines = {
        { id = "ydwanewertle2", text = "Plain food, and very little of it, which near breaks my heart. She works through supper with a book open, and I've taken to slipping a pastry onto the tray so she eats something before midnight." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Dwane Wertle, chef to the citadel, and before you ask, yes, it's my name and my father wanted a boy. I feed the Theramore Guard three times a day, and not a man of them has gone on watch with an empty belly." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I stir, and don't mind the steam; it's mostly onion and a little bit of Kul Tiran pepper." },
        { id = "h_again2", text = "Go on, and pass me that ladle." },
      },
      choices = {
        { text = "What does the garrison eat?", next = "eat" },
        { text = "Do you know Morgan Stern at the inn?", next = "morgan" },
        { text = "Feeding soldiers must be thankless.", next = "thankless" },
        { text = "What do the old fleet hands think of Lady Proudmoore?", next = "kt_jaina" },
        { text = "What's the strangest dish you've made?", next = "ystrange" },
        { text = "I'll eat anything. What's your spiciest?", next = "BACK", when = { race = "Troll" }, reply = "A pepper stew that made a marine weep in front of the whole mess hall. I'll make you a bowl and watch." },
        { text = "What do you cook on feast days?", next = "yfeast" },
        { text = "What did you cook for the Admiral's crew?", next = "w7_crew" },
        { text = "I'll get out of your doorway.", next = "END" },
      },
    },
    w7_crew = {
      lines = {
        { id = "w7_crew_l1", text = "Salt pork and hard bread, mostly, because that's what keeps at sea. But on feast nights I'd make a fish pie with the last of the butter, and the Admiral would come below and eat with the men, which most admirals never did." },
      },
      choices = {
        { text = "He ate with the crew?", next = "w7_crew2" },
        { text = "Sounds like you miss him.", next = "w7_crew3" },
        { text = "Something else, Dwane.", next = "BACK" },
      },
    },
    w7_crew2 = {
      lines = {
        { id = "w7_crew2_l1", text = "Every feast night, and he'd ask after their families by name. He was a hard man and he went too far at the end, but he was never too proud to sit on a barrel and eat a cook's pie." },
        { id = "w7_crew2_l2", when = { faction = "Alliance" }, text = "Every feast night. You'll have heard both sides of him here, I'm sure. I'll only say he never once complained about my cooking, and that's more than I can say for the current garrison." },
      },
      choices = {
        { text = "That's a good memory.", next = "BACK", reply = "It's one I keep. Pass the ladle, would you?" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_crew3 = {
      lines = {
        { id = "w7_crew3_l1", text = "I miss the feasts. The man, I mourn, which is different." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Fish, mostly, because the sea's free and the ships are slow. Clam chowder when the lads bring me clams, and bread every morning, and a stew on feast days that I'll not give anyone the making of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    morgan = {
      lines = { { id = "m_default", text = "Know him? I've been arguing with him since the day the inn opened. He cooks for travellers who'll eat anything strange, and I cook for soldiers who want it hot and plenty, and each of us thinks the other has the easy job." } },
      choices = {
        { text = "Who's the better cook?", next = "better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "He's the cleverer, and I'll say it once and never again. But I've fed three hundred on a morning when the supply ship was late, and I'd like to see him try that with his tortoise soup." } },
      choices = { { text = "I won't tell him you said so. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thankless = {
      lines = { { id = "t_default", text = "It would be, if I listened for thanks. I watch the bowls instead, and they come back empty, and Captain Thomas once sent a recruit to ask what was in the chowder, which is as good as a medal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "I cooked for the Admiral's own crew, and I've fed his daughter's soldiers every day since he died on this island, and there's not a night I don't think about that. She let the orcs and those trolls cut down her own father, and then she asked us to set the table for the Warchief's envoys." } },
      choices = {
        { text = "That's betrayal, plain and simple.", next = "BACK", reply = "It is, and I've said it to my pots every night for years. They're the only ones who don't argue.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "The Admiral attacked allies. She had to choose.", next = "BACK", reply = "Allies, he calls them. Well, maybe you're right, but I'll not be the one to tell the old crew so.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    uma = { { id = "ybdwanewertle3", text = "Uma sells me herbs, and charges too much for them. I'd pay double if I had to." } },
    morgan = { { id = "ydwanewertle3", text = "Morgan Stern at the inn. The cleverer cook, I'll admit, but not the harder worker." } },
    jaina = { { id = "tp_ktjaina", text = "I set the Lady's table and say nothing, which is more than her father's crew would do." } },
    background = { { id = "tp_bg", text = "I cooked on a ship of the Kul Tiras fleet all the way across the sea. A kitchen that doesn't roll is a luxury I've never got used to." } },
    _none = { { id = "tp_none", text = "Not my kitchen, not my business. Ask one of the officers." } },
  },
}

-- Clerk Lendry (Classic name; later "Paymaster Lendry"): Foothold Citadel. Ends "James Hyal" from Vincent Hyal.
P:NPC {
  key = "clerk_lendry", id = TODO_NPC("Clerk Lendry"), name = "Clerk Lendry", gender = "male",
  bible = "bibles/missed.md", role = "clerk", tier = "quest",
  communities = { "theramore" }, temper = { "precise", "decent" }, values = { "records", "duty" },
  notices = { "class", "purse" },
  impression = {
    first = "Clerk Lendry keeps the rolls and records of Theramore in Foothold Citadel, and there's no soul on the island whose name he hasn't written down at least once. He is a careful, dry man, and some of what's in his ledgers plainly troubles him.",
    third = "{name} met Clerk Lendry, who keeps Theramore's records in Foothold Citadel.",
  },
  greetings = {
    { id = "g_default", text = "Yes, {class}? State your business plainly, if you would, and I'll find the right ledger for it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I've your last visit noted, so we needn't begin from the beginning." },
    { id = "g_hyal", when = { questActive = TODO_QUEST("James Hyal") }, text = "You've a look of someone carrying a question from across the sea. Sit down, and tell me who's asking." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've been reading my ledger upside down while I spoke, and rather well. I'd thank you to ask for what you want; the answer is usually yes." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand the Lady's fondness for good records, for she reads every one of mine and corrects my sums." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Clerk Lendry, keeper of the rolls. Births, deaths, enlistments, deeds and debts all pass over this desk, and if a thing happened in Theramore and isn't in my ledgers, I'd like to be told of it." },
        { id = "h_quest", when = { questActive = TODO_QUEST("James Hyal") },
          text = "Vincent Hyal sent you, from Menethil? Then he doesn't know, and I'm sorry to be the one who must write it. His brother's inn is ash, and there are two graves where James's family should be." },
        { id = "h_done", when = { questDone = TODO_QUEST("James Hyal") },
          text = "I've written to Vincent Hyal, as plainly and as kindly as I could manage. It's the hardest entry I've made since we landed, and I've made a good many." },
      },
      again = {
        { id = "h_again", text = "Was there another matter for the record?" },
        { id = "h_again2", text = "Go on. I'll note it as we speak." },
      },
      choices = {
        { text = "What happened to James Hyal?", next = "hyal", when = { any = { { questActive = TODO_QUEST("James Hyal") }, { questDone = TODO_QUEST("James Hyal") } } } },
        { text = "What do you keep in all these ledgers?", next = "ledgers" },
        { text = "You must know everyone on the island.", next = "everyone" },
        { text = "Do the records say who burned the inn?", next = "inn" },
        { text = "What's the oldest entry in your ledgers?", next = "w7_first" },
        { text = "That's all, Clerk.", next = "END" },
      },
    },
    w7_first = {
      lines = {
        { id = "w7_first_l1", text = "The first page of the first book, written aboard ship before we even landed: the names of everyone who sailed west with the Lady. Two thousand and sixty-one names, and I've marked a small cross beside every one who has died since." },
      },
      choices = {
        { text = "How many crosses are there?", next = "w7_first2" },
        { text = "That's a grim way to keep a record.", next = "w7_first3" },
        { text = "Something else, Clerk.", next = "BACK" },
      },
    },
    w7_first2 = {
      lines = {
        { id = "w7_first2_l1", text = "Four hundred and twelve, as of this morning. I check it every week, and every week I hope there won't be a new one, and some weeks there isn't." },
        { id = "w7_first2_l2", when = { race = "Human" }, text = "Four hundred and twelve, as of this morning. Many of them were Lordaeron folk like you, perhaps, or kin of folk you knew. If you'd like me to look up a name, I can; it's what the book is for." },
      },
      choices = {
        { text = "That's a heavy book.", next = "BACK", reply = "It is. But someone must carry it, or the names are lost." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_first3 = {
      lines = {
        { id = "w7_first3_l1", text = "Grim, perhaps, but honest. A town that forgets its dead forgets why it's here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hyal = {
      big = true,
      lines = { { id = "hy_default", text = "He kept the Shady Rest on the north road, and he was away from it the night it burned. His wife Lynn and their boy were not, and James walked into Theramore the next day and has hardly spoken sense since." } },
      choices = {
        { text = "Where is he now?", next = "hyal_now" },
        { text = "What will you tell his brother?", next = "hyal_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyal_now = {
      lines = { { id = "hn_default", text = "He sits beside the inn here, greeting guests who aren't there, and the town still calls him Smiling Jim. Lillian sees that he eats, and nobody has the heart to correct him." } },
      choices = {
        { text = "Should I speak with him?", next = "hyal_speak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyal_speak = {
      lines = { { id = "hs_default", text = "If you do, let him pour you his imaginary ale and thank him for it. Doctor VanHowzen says a hard word might bring him back or might break what's left, and none of us is willing to find out which." } },
      choices = { { text = "I'll be gentle. Something else.", next = "BACK" } },
    },
    hyal_brother = {
      lines = { { id = "hb_default", text = "The truth, since he asked for it, and since a ledger that lies is worth nothing. But I shall tell him too that his brother is among people who knew him in better days, and that we haven't forgotten what he was." } },
      choices = { { text = "That's the right letter to write.", next = "BACK", fx = { affinity = 1 } } },
    },
    ledgers = {
      lines = { { id = "l_default", text = "Everything a town needs to remember about itself. Who came on which ship, who's owed pay, who holds which house, and lately a column I never wanted, for guardsmen who've left their posts without leave." } },
      choices = {
        { text = "The deserters. How many?", next = "deserters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters = {
      lines = { { id = "d_default", text = "More than Captain Vimes would like spoken aloud, so I'll not give you the number. Most were Kul Tiras marines before they were Theramore guards, and I think some of them never quite changed their coats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everyone = {
      lines = { { id = "e_default", text = "By name, at least, and by what they owe. I entered the Pierce children on the day each was born, and I've a page waiting for every recruit Captain Andrews and Captain Thomas are shouting at in the yard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inn = {
      lines = { { id = "i_default", text = "They say what was found and where, and nothing more, because that's all anyone knows. Captain Vimes has asked me to keep my guesses out of the margins, and I'd advise you to do the same until he's finished." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a harbour clerk in Lordaeron. I kept the fleet's manifest on the crossing, and I've simply never been told to stop." } },
    _none = { { id = "tp_none", text = "I've no entry for that, I'm afraid. If you learn the answer, do come back so I can write it down." } },
  },
}
