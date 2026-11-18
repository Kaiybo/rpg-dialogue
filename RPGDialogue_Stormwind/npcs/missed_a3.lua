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

-- Jenn Langston: walks Old Town on the tavern's errands.
P:NPC {
  key = "jenn_langston", id = TODO_NPC("Jenn Langston"), name = "Jenn Langston", gender = "female",
  bible = "bibles/missed_a.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "friendly" }, values = { "family", "thrift" },
  notices = { "trade" },
  impression = {
    first = "Jenn Langston walks Old Town with a basket and a list on behalf of her family's tavern, and she can price a side of pork from across the street. She talks while she walks and doesn't slow down for either.",
    third = "{name} met Jenn Langston, who runs the Pig and Whistle's errands through Old Town.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Walk with me if you want to talk, because I've four more stops and the butcher closes early." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! I'm on the same round as before, more or less." },
  },
  notice = {
    { id = "n_cook", cat = "trade", when = { profession = "Cooking" },
      text = "You know your way round a kitchen, don't you? Then you'll know what good pepper's costing this season, and you'll pity me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jenn Langston, of the Pig and Whistle. The others stay behind the bar, and I'm the one who goes out and makes sure there's something to put on it." },
      },
      again = {
        { id = "h_again", text = "What else? Keep pace, mind." },
        { id = "h_again2", text = "Yes, go on, I'm listening." },
      },
      choices = {
        { text = "What's on your list today?", next = "list" },
        { text = "What's Old Town like, for those who live here?", next = "oldtown" },
        { text = "Your family all work at the tavern?", next = "family" },
        { text = "I won't keep you, Jenn.", next = "END" },
      },
    },
    list = {
      lines = { { id = "l_default", text = "Flour, lamp oil, a new mop because Reese broke the last one over somebody, and whatever Erika needs for her spice shelf. Prices have crept up since the Westfall farms went quiet, and I feel every copper of it.", fx = { learn = { "westfall" } } } },
      choices = {
        { text = "The trouble in Westfall reaches this far?", next = "westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    westfall = {
      lines = { { id = "w_default", text = "It reaches my basket, at any rate. Half our grain used to come up that road, and now a wagon gets through one week in three, so the bakers charge what they please." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    oldtown = {
      lines = { { id = "o_default", text = "It's rougher than the Trade District and prouder for it. Everyone knows everyone, the guards drink where we do, and if you leave your door unlocked it's your neighbour who shuts it for you." } },
      choices = { { text = "That's a good sort of place. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    family = {
      lines = { { id = "f_default", text = "Every one of us, and nobody's ever been asked whether they wanted to. David talks to the customers and calls it labour, and Elly does the work of three, so you can guess which of them I'd give my day off to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Langston, so I was carrying trays before I could see over them. I like the errands better, because I get the daylight." } },
    westfall = { { id = "tp_westfall", text = "I only know it by what's missing from the market. The farms have gone quiet, and they say it's brigands." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask Reese at the bar, since everyone tells a barkeep everything." } },
  },
}

-- Erika Tate: cooking supplies by the hearth at the Pig and Whistle.
P:NPC {
  key = "erika_tate", id = TODO_NPC("Erika Tate"), name = "Erika Tate", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "blunt", "no-nonsense" }, values = { "fair dealing", "good food" },
  notices = { "food" },
  impression = {
    first = "Erika Tate sells cooking supplies from beside the Pig and Whistle's hearth, at prices she has no intention of discussing. She is plain-spoken to the edge of rudeness, and her spices are the freshest in Old Town.",
    third = "{name} met Erika Tate, who sells cooking supplies at the Pig and Whistle Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Cooking supplies, and the price is the price. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last lot do what I said it would?" },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You cook. Good, then you won't ask me what flour is for, which happened twice last week." },
    { id = "n_goblin", cat = "food", when = { race = "Goblin" },
      text = "A goblin at my counter, of all things. Don't start, because I've heard every bargaining trick there is and none of them has worked yet." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Erika Tate. I sell salt, spice, flour and whatever else a pot needs, and Kendor Kabonka over there has the recipes if you want to know what to do with them." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, then, I've stock to turn." },
      },
      choices = {
        { text = "You won't haggle at all?", next = "haggle" },
        { text = "What should a travelling cook carry?", next = "carry" },
        { text = "A supply shop in a tavern is a clever spot.", next = "spot" },
        { text = "That's all, Erika.", next = "END" },
      },
    },
    haggle = {
      lines = { { id = "ha_default", text = "No, and I'll tell you why. I set a fair price in the morning and I keep it all day for the captain and the cabin boy alike, and anybody who wants to dicker can go and find a goblin." } },
      choices = {
        { text = "Has anyone ever talked you down?", next = "down" },
        { text = "A fair price needs no arguing. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    down = {
      lines = { { id = "d_default", text = "A paladin tried once by telling me the Light loves a generous heart. I told him the Light could pay full price like everyone else, and to his credit he laughed and did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    carry = {
      lines = { { id = "c_default", text = "Salt before anything, because it keeps meat and it makes bad meat bearable. After that take mild spices and a little flour in a waxed bag, and you can make a meal out of whatever you manage to kill." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spot = {
      lines = { { id = "s_default", text = "It's warm, and the Langstons don't charge me much for the corner. Soldiers come in for a drink, smell the kitchen and remember they've a march tomorrow with nothing packed, so I do well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I cooked for a company of the King's foot before I sold supplies. I learned there what a soldier will eat, and it isn't much, so I try to raise the standard." } },
    _none = { { id = "tp_none", text = "I don't know and I won't pretend to. Ask someone who does." } },
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

-- Edna Mullby: trade supplies, Everyday Merchandise, Trade District.
P:NPC {
  key = "edna_mullby", id = TODO_NPC("Edna Mullby"), name = "Edna Mullby", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "capable", "teasing" }, values = { "good sense", "her husband" },
  notices = { "trade" },
  impression = {
    first = "Edna Mullby sells thread, flux, salt and the other small things crafters run out of, from the corner shop she keeps with her husband Thurman. She runs the place with a firm hand and lets him believe it is a partnership.",
    third = "{name} met Edna Mullby, who sells trade supplies at Everyday Merchandise.",
  },
  greetings = {
    { id = "g_default", text = "Good day, dear! If you make things with your hands, I've likely got whatever you've just run out of." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? You ran short of thread, didn't you, because everybody does." },
  },
  notice = {
    { id = "n_craft", cat = "trade", when = { any = { { profession = "Tailoring" }, { profession = "Blacksmithing" }, { profession = "Leatherworking" }, { profession = "Alchemy" } } },
      text = "I can always tell a crafter by the way they look at the shelves before they look at me. Go on, dear, see what you need." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Edna Mullby, and this is Everyday Merchandise, on the best corner of the square. Thurman sells the bags and sundries and I sell the trade goods, and between us we've kept half the city's workshops running." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, dear?" },
        { id = "h_again2", text = "Yes, go on." },
      },
      choices = {
        { text = "Thurman says you're the brains of the shop.", next = "brains" },
        { text = "What do crafters ask for most?", next = "most" },
        { text = "You must hear all the Trade District's news.", next = "news" },
        { text = "Thank you, Edna.", next = "END" },
      },
    },
    brains = {
      lines = { { id = "b_default", text = "Does he, now? Well, he's right, and it's sweet of him to say so where I can't hear. He has the charm and I have the ledger, and a shop needs the one about as much as the other." } },
      choices = {
        { text = "How long have you kept shop together?", next = "together" },
        { text = "Something else.", next = "BACK" },
      },
    },
    together = {
      lines = { { id = "t_default", text = "Since the square was rebuilt, and we were married a good while before that. We've quarrelled over where the shelves should go every year since, and I've won every time but one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    most = {
      lines = { { id = "m_default", text = "Thread, always thread, and then flux for the smiths and vials for the alchemists. Lately it's been salt by the sack as well, for curing leather, since the army wants boots faster than the tanners can make them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = { { id = "n_default", text = "I hear what people are making, dear, and that tells you more than gossip does. When every tailor wants heavy thread and every smith wants flux by the crate, somebody expects a hard year, whatever the criers say." } },
      choices = { { text = "A sharp way to read a city. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept shop on this corner with Thurman since the Trade District reopened. He'd give the stock away without me, bless him." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask Thurman, since he'll talk to anyone about anything, and he's sometimes right." } },
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

-- Gregory Ardus: staves and maces, Just Maces, Cathedral Square.
P:NPC {
  key = "gregory_ardus", id = TODO_NPC("Gregory Ardus"), name = "Gregory Ardus", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "dry", "devout" }, values = { "the Light", "plain dealing" },
  notices = { "weapons", "faith" },
  impression = {
    first = "Gregory Ardus keeps a shop on Cathedral Square called Just Maces, in which he also sells staves, and he has stopped explaining the sign. He arms most of the Cathedral's clergy and takes a quiet pride in it.",
    third = "{name} met Gregory Ardus, who sells maces and staves at Just Maces on Cathedral Square.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you. Welcome to Just Maces, and before you ask, yes, those are staves." },
    { id = "g_back", when = { metBefore = true }, text = "Light be with you again. I trust the last piece served you well." },
  },
  notice = {
    { id = "n_holy", cat = "faith", when = { class = { "PALADIN", "PRIEST" } },
      text = "You're of the Church, I can see. Then you're in the right shop, for half the hammers carried out of that Cathedral were bought across this counter." },
    { id = "n_blade", cat = "weapons", when = { class = { "ROGUE" } },
      text = "You've the look of someone who prefers an edge. I can't help you there, I'm afraid, for I don't keep a single blade in the place." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gregory Ardus, proprietor. I sell maces for those who must strike and staves for those who would rather lean, and I try to see that each customer leaves with the right one." },
      },
      again = {
        { id = "h_again", text = "Is there anything else?" },
        { id = "h_again2", text = "Ask, by all means." },
      },
      choices = {
        { text = "Why is it called Just Maces, if you sell staves?", next = "name" },
        { text = "Why do the clergy favour the mace?", next = "clergy" },
        { text = "What should a paladin look for in a hammer?", next = "paladin", when = { class = "PALADIN" } },
        { text = "Light keep you, Gregory.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "My father named it, and he sold only maces, as the sign says. I added the staves when the priests began asking, and I found that a new sign cost more than a little teasing does." } },
      choices = {
        { text = "You could call it Mostly Maces.", next = "mostly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mostly = {
      lines = { { id = "m_default", text = "You are the fourth person this month to suggest it, and the first to do so with a straight face. I shall think it over for another twenty years." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    clergy = {
      lines = { { id = "c_default", text = "By old custom a servant of the Light sheds as little blood as may be, and a mace was thought the more merciful weapon. I have seen what a mace does, and I am not certain mercy is the word, but the custom stands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      lines = { { id = "p_default", text = "Weight you can carry through a whole day, and a haft that will not turn in a wet glove. The knights who trained under Lord Shadowbreaker tend to choose plainer hammers than the squires do, and I think they have the right of it." } },
      choices = { { text = "Plain and true, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept this shop before me, in the shadow of the Cathedral. I was raised between the anvil's noise and the choir's, and I find I need both." } },
    _none = { { id = "tp_none", text = "I cannot say. The brothers at the Cathedral are better read than I am, and they are only across the square." } },
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

-- Jorgen: fishes by the water in the Valley of Heroes; a quiet link in the Missing Diplomat chain.
P:NPC {
  key = "jorgen", id = TODO_NPC("Jorgen"), name = "Jorgen", gender = "male",
  bible = "bibles/missed_a.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "quiet", "watchful" }, values = { "discretion", "old loyalties" },
  notices = { "fishing", "stealth" },
  impression = {
    first = "Jorgen fishes the water below the city gate with his back to the wall and every traveller on the bridge in the corner of his eye. I never saw him land a fish, and he never seemed troubled by it.",
    third = "{name} met Jorgen, the fisherman by Stormwind's gate, who sees more than he catches.",
  },
  greetings = {
    { id = "g_default", text = "Morning. Mind where your shadow falls, friend, because the fish here are shy." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, if you like, and keep your voice below the water's." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be down by the water. So am I, mind, so I'll not ask if you don't." },
  },
  notice = {
    { id = "n_fish", cat = "fishing", when = { profession = "Fishing" },
      text = "You fish as well, by the calluses. Then you'll know a man can sit at it all day and catch nothing, and still go home content." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You came down those steps without a sound. Somebody taught you that, and I could likely guess which building he works in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_quest", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "The Bishop sent you, and you needn't say it any louder than that. Sit down beside me and look at the water, and we'll talk as two people fishing." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Missing Diplomat") },
          text = "I heard how that business ended, or as much as anyone is letting on. You did well, and you kept quiet about it, which is rarer." },
        { id = "h_default", text = "Jorgen. I fish here most days, where I can hear the gate and the General's horse, and nobody troubles an old man with a line in the water." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it low." },
        { id = "h_again2", text = "Go on. The fish aren't listening, but others might be." },
      },
      choices = {
        { text = "Bishop DeLavey said you could help me.", next = "diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "You never seem to catch anything.", next = "catch" },
        { text = "You watch the gate more than your float.", next = "watch" },
        { text = "How do you know the Bishop?", next = "history" },
        { text = "Tight lines, Jorgen.", next = "END" },
      },
    },
    diplomat = {
      big = true,
      lines = { { id = "d_default", text = "A man of the Crown set out for Theramore and never arrived, and the Bishop wants it looked into without the court hearing of it. I've seen who rode out of this gate that week, and I've written down what I can for a friend who'll know what it means.", fx = { learn = { "theramore" } } } },
      choices = {
        { text = "Who is the friend?", next = "elling" },
        { text = "Why keep it from the court?", next = "court" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elling = {
      lines = { { id = "e_default", text = "Elling Trias, who keeps the cheese shop in the Trade District. Buy something when you go in, hand him my note with the coin, and don't be surprised by how much a cheesemonger knows." } },
      choices = {
        { text = "A cheesemonger?", next = "cheese" },
        { text = "I'll take him the note. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    cheese = {
      lines = { { id = "ch_default", text = "He makes good cheese, and that's all most of the city needs to know of him. Elling and I did other work together once, and he kept more of his contacts than I did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    court = {
      lines = { { id = "co_default", text = "Because somebody in that Keep knew which road the diplomat was taking and when. I'll not name anyone, since I can't, but the Bishop is right to trust a fisherman and a cheesemonger before a councillor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    catch = {
      lines = { { id = "c_default", text = "There's little down there but minnows and what the city throws away. A man with a rod is allowed to sit still for hours, though, and I've found that worth more than a full basket." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "You've good eyes. Everyone who enters Stormwind by road crosses that bridge, and after enough years you learn who walks like a farmer and who only dresses like one." } },
      choices = {
        { text = "Who's crossed lately that you didn't like?", next = "lately" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lately = {
      lines = { { id = "l_default", text = "Labourers with soft hands and good boots, coming in twos from the Westfall road and asking the way to the Stockade. I told the guard sergeant, and he thanked me kindly and wrote nothing down.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    history = {
      lines = { { id = "h_default2", text = "We go back a long way, the Bishop and Elling Trias and I, to work that was never written in any ledger. I'll leave it there, friend, and I'd think the better of you for doing the same." } },
      choices = { { text = "Then I'll leave it there. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served the kingdom once, in a quiet way, and now I fish. That's as much of a history as I give anyone." } },
    theramore = { { id = "tp_theramore", text = "Lady Proudmoore's city, across the sea. A diplomat was sent there, and that's all I'll say by the open water." } },
    defias = { { id = "tp_defias", text = "They come through the gate like anyone else, with the masks in their packs. I count them when I can." } },
    _none = { { id = "tp_none", text = "I couldn't say, and by the water I mostly don't. Try Elling Trias, if you're buying cheese anyway." } },
  },
}
