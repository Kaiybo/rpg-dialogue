-- Stormwind folk the roster scan found missing (part 3 of 3): two more Langstons and the cooking
-- supplier at the Pig and Whistle, a girl chasing her doll, the trade supplier at Everyday
-- Merchandise, a field marshal in the Valley of Heroes, a boy on a long walk with his mother, the
-- owner of Just Maces, a young mage by the Wizard's Sanctum, and the fisherman by the city gate.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- David Langston: one of the family who run the Pig and Whistle, Old Town.
P:NPC {
  key = "david_langston", id = TODO_NPC("David Langston"), name = "David Langston", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "easygoing", "sociable" }, values = { "family", "the tavern" },
  notices = { "drink", "soldier" },
  impression = {
    first = "David Langston belongs to the family that runs the Pig and Whistle, and he seems to do his share by keeping the regulars company. He knows every soldier in Old Town by his drink.",
    third = "{name} met David Langston, of the family that keeps the Pig and Whistle Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Pig and Whistle! Find a seat where you can, and Elly will be round before you've warmed it." },
    { id = "g_back", when = { metBefore = true }, text = "Back with us again! That's how it starts, friend, and then you're a regular." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Evening! You've come at the loud hour, so you'll have to speak up." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You'll fit in here, {class}. Half the barracks drinks under this roof, and the other half is on duty and wishing it could." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You're well along already, I see. Sit near the door, there's a good soul, in case the floor starts to move." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "David Langston, and yes, I'm one of those Langstons. Reese keeps the bar, Elly carries the trays, Jenn runs the errands about town, and I make sure nobody drinks alone who doesn't want to." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on, I've nowhere to be but here." },
      },
      choices = {
        { text = "That sounds like the easiest job in the family.", next = "easy" },
        { text = "Who drinks at the Pig and Whistle?", next = "who" },
        { text = "How long has the tavern stood here?", next = "long" },
        { text = "I'll find a seat, David.", next = "END" },
      },
    },
    easy = {
      lines = { { id = "e_default", text = "Elly says the same, and rather more sharply. You try listening to the same war story forty nights running and laughing in the right place every time, and then tell me it isn't work." } },
      choices = {
        { text = "Whose story is that?", next = "story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Old Aedis Brom's, usually, with Christoph Faral beside him correcting the details. The two of them walk in from the canals every day, and I'd honestly miss them if they stopped." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Soldiers from the barracks, dockhands, and the odd quiet fellow from the building across the square that nobody asks about. We serve them all the same, and Dashel Stonefist sees to anyone who forgets his manners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "Since Old Town was put back together after the war, and it was one of the first doors to open. Folk needed walls and they needed bread, but my family reckoned they needed a place to sit together just as badly." } },
      choices = { { text = "Your family reckoned right. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was raised between these tables, and I learned my numbers counting mugs. I can't picture living anywhere that doesn't smell of ale and woodsmoke." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but sit here long enough and somebody will come in who does." } },
  },
}

-- Donna: a girl chasing William through the city for her doll.
P:NPC {
  key = "donna_stormwind", id = TODO_NPC("Donna"), name = "Donna", gender = "female",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "furious", "determined" }, values = { "fairness", "her doll" },
  notices = { "soldier" },
  impression = {
    first = "Donna runs the streets of Stormwind after a boy named William, who has her doll and a good head start. She is out of breath and not remotely out of temper.",
    third = "{name} met Donna, a girl chasing William through Stormwind for her doll.",
  },
  greetings = {
    { id = "g_default", text = "Did you see a boy run past? He's got my doll, and I'm going to get it back!" },
    { id = "g_back", when = { metBefore = true }, text = "I still haven't caught him! He's fast, but he has to stop sometime." },
  },
  notice = {
    { id = "n_guardlike", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You look like a guard, sort of. Can you arrest somebody for taking a doll, because you should." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Donna, and William took my doll Betsy right out of my hands and ran off laughing. I've chased him past the Cathedral and round the whole Trade District, and I'm not stopping." },
      },
      again = {
        { id = "h_again", text = "What? Hurry up, he's getting away!" },
        { id = "h_again2", text = "Ask quick, I've got to run." },
      },
      choices = {
        { text = "Why did he take your doll?", next = "why" },
        { text = "What will you do when you catch him?", next = "catch" },
        { text = "Tell me about Betsy.", next = "betsy" },
        { text = "Run, Donna, he went that way.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because he's horrible, and because I said boys can't play with her. He said he didn't want to anyway, and then he took her, so that shows what a fibber he is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    catch = {
      lines = { { id = "c_default", text = "I'm going to get Betsy back, and then I'm going to tell his mum, and then I'm going to tell my mum. He'll be sorry for a whole week, at least." } },
      choices = {
        { text = "And if he says he's sorry?", next = "sorry" },
        { text = "That sounds fair to me. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    sorry = {
      lines = { { id = "s_default", text = "Then I'll only tell one mum. Well, maybe I won't tell any, if he carries Betsy all the way home and says sorry to her as well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    betsy = {
      lines = { { id = "b_default", text = "She's got yellow wool hair and a blue dress my gran sewed, and one of her eyes is a button because the first one fell off. She doesn't like being run with, it makes her dizzy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Stormwind, and I know all the short cuts. William knows them too, and that's the trouble." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't got time! Have you seen William or not?" } },
  },
}

-- Field Marshal Stonebridge: under an arch in the Valley of Heroes, near General Marcus Jonathan.
P:NPC {
  key = "field_marshal_stonebridge", id = TODO_NPC("Field Marshal Stonebridge"), name = "Field Marshal Stonebridge", gender = "female",
  bible = "bibles/missed_a.md", role = "soldier", tier = "service",
  communities = { "stormwind" }, temper = { "stern", "direct" }, values = { "duty", "the kingdom" },
  notices = { "soldier" },
  impression = {
    first = "Field Marshal Stonebridge keeps a post beneath an arch in the Valley of Heroes, a short walk from General Marcus Jonathan, and receives reports from the northern front. She weighs a visitor in one look and wastes no words afterwards.",
    third = "{name} met Field Marshal Stonebridge, who takes reports on the Blackrock front in the Valley of Heroes.",
  },
  greetings = {
    { id = "g_default", text = "State your business, {class}. I've dispatches waiting, and they rarely carry good news." },
    { id = "g_back", when = { metBefore = true }, text = "You again. If you've something to report, report it." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like someone who's held a line. Good, because I've little time for those who haven't." },
    { id = "n_veteran", cat = "soldier", when = { minLevel = 50 },
      text = "You've seen hard country, by your gear. Then you know more of what lies north of Redridge than most of the court does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Field Marshal Stonebridge. The General holds the gate and I watch the north, where the Blackrock orcs sit on their mountain and send raiders down into Redridge." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be brief." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "How bad is it in the north?", next = "north" },
        { text = "Why is a field marshal posted at the city gate?", next = "gate" },
        { text = "I've fought the Blackrock orcs myself.", next = "fought", when = { minLevel = 20 } },
        { text = "I'll take no more of your time, Marshal.", next = "END" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "Lakeshire is holding with a garrison half the size it needs, and Stonewatch Keep has already fallen to them. Beyond that lie the Burning Steppes and Blackrock Mountain itself, and nobody I've sent that far has brought back a comforting report.", fx = { learn = { "blackrock" } } } },
      choices = {
        { text = "Why not send more troops?", next = "troops" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troops = {
      lines = { { id = "t_default", text = "Because the House of Nobles counts every soldier twice before it releases one, and Westfall and Duskwood are asking for the same men. I command what I'm given, and for the rest I rely on volunteers such as yourself." } },
      choices = { { text = "Then you'll have my sword. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gate = {
      lines = { { id = "g_default2", text = "Because the riders come in through this gate, and I'll hear them before any courtier softens the words. A report that has passed through three antechambers is no longer a report, only an opinion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fought = {
      lines = { { id = "f_default", text = "Then tell me plainly what you saw, whether they were disciplined or a rabble. I ask every fighter who comes down from Redridge, and most of them tell me the orcs fight like an army with someone clever behind it." } },
      choices = {
        { text = "They were disciplined, and well led.", next = "BACK", reply = "As I feared. Thank you for an honest account, {class}." },
        { text = "Fierce, but no better than raiders.", next = "BACK", reply = "Perhaps where you stood. I hope you're right, and I'll not plan on it." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I earned this rank in the field, and I've no intention of keeping it from behind a desk. That is all you need know of me." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock clan never surrendered after the Second War. They hold the Spire, and they are patient." } },
    _none = { { id = "tp_none", text = "That is not my command, and I'll not speculate. Ask at the Keep." } },
  },
}

-- Gil: a boy on a very long walk through Stormwind with his mother Karlee Chaddis and sister Paige.
P:NPC {
  key = "gil_chaddis", id = TODO_NPC("Gil"), name = "Gil", gender = "male",
  bible = "bibles/missed_a.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "impatient", "fanciful" }, values = { "getting there" },
  notices = { "magic" },
  impression = {
    first = "Gil follows his mother and sister across Stormwind, asking whether they have arrived yet at every corner. He believes the rabbit at Ancient Curios used to be a wizard, and he will not be argued out of it.",
    third = "{name} met Gil, a boy on a long walk to the Mage Quarter with his mother and sister.",
  },
  greetings = {
    { id = "g_default", text = "Are we there yet? Oh, you're not my mum. Do you know if we're there yet?" },
    { id = "g_back", when = { metBefore = true }, text = "It's you! We're still walking, we've been walking forever." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "Are you a wizard? Be careful with your spells, or you'll end up like Fizzles!" },
    { id = "n_gnome", cat = "magic", when = { race = "Gnome" },
      text = "You're the same size as me! Do your legs get tired on long walks too?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Gil, and that's my mum and my sister Paige, and we're going to a shop in the Mage Quarter that's miles and miles away. Mum says it's just round the corner, but she said that three corners ago." },
      },
      again = {
        { id = "h_again", text = "What else? Is it far, what you're going to ask?" },
        { id = "h_again2", text = "You can ask me something while we walk." },
      },
      choices = {
        { text = "Where are you all going?", next = "where" },
        { text = "Who is Fizzles?", next = "fizzles" },
        { text = "Your sister doesn't seem to mind the walk.", next = "paige" },
        { text = "Not far now, Gil.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "To Ancient Curios, where Mum buys her powders and things from the lady with the jars. It smells funny in there, but there's a bunny, so I don't mind once we've got there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fizzles = {
      lines = { { id = "f_default", text = "He's the bunny at the shop, but he wasn't always a bunny. He was a great wizard, the greatest one, and then a spell went wrong with a big bang, and now he's got ears." } },
      choices = {
        { text = "Who told you that?", next = "fizzles2" },
        { text = "Then he's lucky to have a friend. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fizzles2 = {
      lines = { { id = "f2_default", text = "Nobody told me, I worked it out, because he looks at the spell books like he's reading them. Paige says rabbits look at everything like that, but she doesn't know about wizards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paige = {
      lines = { { id = "p_default", text = "That's because she gets to look in the dress shops on the way, and I don't get anything. When I'm big I'm going to live right next door to wherever I'm going." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Gil, and I live in Stormwind, a long way from everything. That's my mum, Karlee, and she walks really fast." } },
    _none = { { id = "tp_none", text = "I don't know. Is it on the way to the Mage Quarter?" } },
  },
}

-- Janey Anship: a young mage who sits with Lisan Pierce and Suzanne at the foot of the Wizard's Sanctum.
P:NPC {
  key = "janey_anship", id = TODO_NPC("Janey Anship"), name = "Janey Anship", gender = "female",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "bright", "ambitious" }, values = { "magic", "friends" },
  notices = { "magic" },
  impression = {
    first = "Janey Anship sits on the grass below the Wizard's Sanctum with her friends Lisan and Suzanne, arguing over a spell the three of them mean to invent. None of them agrees yet on what it should do.",
    third = "{name} met Janey Anship, a young mage who studies with her friends below the Wizard's Sanctum.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! You haven't come to tell us to keep our voices down, have you?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! We're no nearer to agreeing, if that's what you've come to ask." },
  },
  notice = {
    { id = "n_mage", cat = "magic", when = { class = "MAGE" },
      text = "You're a mage, a proper one who's been out in the world! Settle something for us, would you, because Lisan won't listen to me." },
    { id = "n_lock", cat = "magic", when = { class = "WARLOCK" },
      text = "Is that what I think it is, at your side? Suzanne, don't stare. We aren't supposed to ask about that sort of magic, though I'd dearly like to." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Janey, and these are Lisan Pierce and Suzanne, and we're going to make something no one at the Sanctum has made before. We haven't settled whether it's a spell or a potion, which is rather holding things up." },
      },
      again = {
        { id = "h_again", text = "What else? I'm glad of the rest from arguing." },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "What do you want it to do?", next = "what" },
        { text = "Do your teachers know about this?", next = "teachers" },
        { text = "I'd start with something small that works.", next = "advice", when = { class = { "MAGE", "WARLOCK", "PRIEST", "DRUID", "SHAMAN" } } },
        { text = "Good luck with it, Janey.", next = "END" },
      },
    },
    what = {
      lines = { { id = "w_default", text = "I say it should let you breathe under water, because think of the canals and the harbor and everything nobody's looked at down there. Lisan wants it to make a person taller, and Suzanne wants whatever we'll get into the least trouble for." } },
      choices = {
        { text = "Alchemists already brew a water-breathing draught.", next = "known", when = { profession = "Alchemy" } },
        { text = "Why does Lisan want to be taller?", next = "taller" },
        { text = "Something else.", next = "BACK" },
      },
    },
    known = {
      lines = { { id = "k_default", text = "They do? Oh, bother, somebody's always got there first. Still, if we knew how theirs was made, we might make one that lasts longer, and that would still count as new." } },
      choices = { { text = "That's how most discoveries go. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    taller = {
      lines = { { id = "t_default", text = "She says it's for reaching the high shelves in the library. I think it's because a certain apprentice in the upper tower is very tall, but you didn't hear that from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teachers = {
      lines = { { id = "te_default", text = "They know we sit here and talk, and they think that's all it is. We walk the canals and the Trade District when we need to think, and nobody has asked us yet what we're thinking about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "That's what Suzanne says, and she'll be unbearable now that someone who's actually cast in the field agrees with her. You're probably both right, though I did so want it to be grand." } },
      choices = { { text = "Grand can come second. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a student at the Sanctum, in my third year. I'm quite good at frost and quite bad at being patient." } },
    _none = { { id = "tp_none", text = "I don't know, but I could look it up. Well, I could ask Suzanne to look it up, since she's the one who likes the library." } },
  },
}
