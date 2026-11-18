-- Thunder Bluff, the lower rise: the other two bankers, the auctioneers, the guild lodge, the
-- shopkeepers around the lifts, and the hands at Karn's Smithy. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Atepa: banker at the Thunder Bluff Bank, beside Chesmu and Torn.
---------------------------------------------------------------------------
P:NPC {
  key = "atepa", id = TODO_NPC("Atepa"), name = "Atepa", gender = "male", title = "Banker",
  bible = "bibles/missed.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "careful" }, values = { "honest", "patient" },
  notices = { "race" },
  impression = {
    first = "Atepa keeps one of the three counters at the Thunder Bluff Bank, and he handles every pouch as though it were somebody's calf. He speaks slowly and never loses his place in a count.",
    third = "{name} met Atepa, one of the bankers of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, {class}. Whatever you have left in our keeping has rested well, and it is here whenever you want it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to us, and nothing of yours has wandered while you were gone." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc at my counter always asks whether a tent can truly hold a vault. It can, friend, when the whole bluff stands under it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Atepa, and with Chesmu and Torn I keep what the tribes and their friends leave on this rise. A tauren used to carry all he owned on one kodo, and now he asks me to remember where he put it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me, {class}?" },
        { id = "h_again2", text = "Speak, friend, for the count will wait a moment longer." },
      },
      choices = {
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "How do three bankers share one tent?", next = "three" },
        { text = "A tent seems a poor place for a vault.", next = "tent" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    three = {
      lines = { { id = "t_default", text = "Chesmu is the eldest of us and remembers every face, Torn is the quickest with numbers, and I am the one who checks them both. We have not yet lost so much as a copper between us, and I mean to keep it so." } },
      choices = {
        { text = "Do they mind being checked?", next = "checked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    checked = {
      lines = { { id = "c_default", text = "Torn grumbles like a kodo at a river crossing, and then he thanks me the one time in a season that I find something. Chesmu only smiles, because he checked me first." } },
      choices = { { text = "A sound arrangement. Something else.", next = "BACK" } },
    },
    tent = {
      lines = {
        { id = "te_default", text = "The hides are only there to keep the rain off the ledgers, {class}. What guards your goods is a mesa that no centaur has ever climbed, and Cairne's braves on every bridge." },
        { id = "te_tauren", when = { race = "Tauren" }, text = "You know better than that, young one. Our people kept everything they had under hide for more generations than anyone can count, and we only lost it when we stopped watching." },
      },
      choices = { { text = "I had not thought of it so. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I count and I keep, here on the lower rise, and I have done it since the bank's poles were first raised." } },
    _none = { { id = "tp_none", text = "That is beyond my ledgers, friend. Chesmu has longer ears than I do, so you might ask him." } },
  },
}

---------------------------------------------------------------------------
-- Torn: banker at the Thunder Bluff Bank, the quick one.
---------------------------------------------------------------------------
P:NPC {
  key = "torn_tb", id = TODO_NPC("Torn"), name = "Torn", gender = "male", title = "Banker",
  bible = "bibles/missed.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "dry" }, values = { "practical", "honest" },
  notices = { "class" },
  impression = {
    first = "Torn is the youngest of the bankers at the Thunder Bluff Bank and by some way the fastest, and his fingers are moving over the tally cords before a customer has finished asking. He is brisk for a tauren, which still leaves him plenty of time to talk.",
    third = "{name} met Torn, a quick-fingered banker of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Step up, {class}. I can have your vault open before the lift reaches the top, if you know what you want from it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, I remember your tally, so this will be quick." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You have a light way of standing, {class}. I'll ask you kindly to keep your hands where Atepa can count them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Torn, of the bank. I keep my tallies on knotted cords as well as in the goblin ledgers, because cords do not smudge in the rain and nobody has yet learned to forge a knot." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I have a line forming behind you, or I will soon." },
        { id = "h_again2", text = "Go on, I can count and listen at once." },
      },
      choices = {
        { text = "Open my vault, then.", next = "BUSINESS" },
        { text = "Show me how the cords work.", next = "cords" },
        { text = "You seem in a hurry, for a tauren.", next = "hurry" },
        { text = "I'll let you count.", next = "END" },
      },
    },
    cords = {
      lines = { { id = "co_default", text = "Each knot is a count and each colour is a kind of good, so red is hides, yellow is grain and white is coin. My grandmother kept a whole herd's worth on a cord no longer than her arm, and she never once needed ink." } },
      choices = {
        { text = "Then why keep the ledgers at all?", next = "ledgers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledgers = {
      lines = { { id = "le_default", text = "Because the banks in Orgrimmar and the Undercity cannot read a cord, and your goods must be the same there as they are here. So I knot it for us and write it for them, and Atepa checks that the two agree." } },
      choices = { { text = "Twice the work. Something else.", next = "BACK" } },
    },
    hurry = {
      lines = { { id = "hu_default", text = "Chesmu says the same, and tells me the vault was here yesterday and will be here tomorrow. But the travellers who come up the lifts have wind riders to catch, and I would not have them miss one on my account." } },
      choices = { { text = "Considerate of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned counting from my grandmother's cords and writing from a goblin, and the bank needed both." } },
    _none = { { id = "tp_none", text = "I have no knot for that one, {class}. Ask Chesmu, who has been collecting stories longer than I have been counting." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Gullem: auctioneer on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "auctioneer_gullem", id = TODO_NPC("Auctioneer Gullem"), name = "Auctioneer Gullem", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "patient", "dry" }, values = { "fair", "trade" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Gullem calls the lots at the Thunder Bluff auction house in a voice so deep and unhurried that goblins have been known to fall asleep waiting for the price. Nothing is sold under him until everyone has had a fair look.",
    third = "{name} met Auctioneer Gullem, who calls the lots at Thunder Bluff's auction house.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the auction lodge, {class}. Look as long as you like, because a hurried bargain is a poor one for somebody." },
    { id = "g_back", when = { metBefore = true }, text = "You return, friend. The lots have changed since you were last here, though the prices have only climbed." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, good. Your people haggle as if it were a dance, and I confess I enjoy watching it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Gullem, and Stampi and I take the lots between us. Whatever is hunted, dug or stitched between here and the Barrens comes across this floor sooner or later, and it is my work to see it leaves at an honest price." },
      },
      again = {
        { id = "h_again", text = "What more can I tell you, {class}?" },
        { id = "h_again2", text = "Ask, friend, for the next lot is not called yet." },
      },
      choices = {
        { text = "Let me see what's for sale.", next = "BUSINESS" },
        { text = "What sells best up here?", next = "sells" },
        { text = "Auctions seem a goblin's notion, not a tauren's.", next = "goblin" },
        { text = "May your lots sell well.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Hides, always, because half the Horde comes to Mulgore to learn skinning and then finds it has more leather than sense. After that it is herbs from the plains, and copper from the Venture Company's leavings." } },
      choices = {
        { text = "And what never sells?", next = "never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Plainstrider beaks, friend. Every young hunter in Bloodhoof is certain they must be worth something, and every week I must tell another one, gently, that they are worth exactly what a beak is worth." } },
      choices = { { text = "Poor hunters. Something else.", next = "BACK" } },
    },
    goblin = {
      lines = {
        { id = "g_default", text = "The ledgers and the fees are theirs, I grant you. But the tribes traded at every gathering long before we met a goblin, and all an auction does is hold the gathering every day." },
        { id = "g_tauren", when = { race = "Tauren" }, text = "You have heard the elders say so, I expect. Tell them the tribes bartered at every moot since the first one, and the only new thing here is that nobody has to wait for summer." },
      },
      choices = { { text = "A gathering every day. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I traded hides between the tribes when we still wandered, and when the bluff was raised I was asked to do it standing still." } },
    _none = { { id = "tp_none", text = "Nobody has put that up for sale, {class}, so I know nothing of its worth." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Stampi: auctioneer on the lower rise, the lively one.
---------------------------------------------------------------------------
P:NPC {
  key = "auctioneer_stampi", id = TODO_NPC("Auctioneer Stampi"), name = "Auctioneer Stampi", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "eager" }, values = { "trade", "community" },
  notices = { "craft" },
  impression = {
    first = "Auctioneer Stampi is younger than his partner Gullem and a good deal louder, and he takes a child's delight in every strange thing that crosses the auction floor. He has a habit of stamping one hoof when a bid goes up.",
    third = "{name} met Auctioneer Stampi, the livelier of Thunder Bluff's auctioneers.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, come in, {class}! There are things on the floor today that I have never seen before, and I have been here since sunrise." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Have you brought anything from far away, or have you come to carry something off?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and black powder, friend, so you must be an engineer. Please tell me you have something that whirrs to sell." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Stampi, and I take the lots Gullem has no patience for, which is anything that glows, ticks or came off a ship. He says I shout too much, but nobody has ever missed a bid of mine." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Ask quickly, before something interesting comes in." },
        { id = "h_again2", text = "Yes, {class}? I am listening with one ear, I promise." },
      },
      choices = {
        { text = "Show me the lots.", next = "BUSINESS" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "You and Gullem seem an odd pair.", next = "gullem" },
        { text = "Good trading, Stampi.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A goblin once brought up a brass bird that walked by itself and laid a little brass egg every hundred steps. Three hunters bid against each other for it, and I do not think any of them knew what they wanted it for." } },
      choices = {
        { text = "Who won it?", next = "won" },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "w_default", text = "A troll from Sen'jin, who said his loa would find it funny. I hope they did, because it walked straight off the edge of the rise the next morning, and we were finding eggs at the bottom for a month." } },
      choices = { { text = "A fitting end. Something else.", next = "BACK" } },
    },
    gullem = {
      lines = { { id = "gu_default", text = "He is the slow river and I am the rain, or so my mother puts it. He taught me that a price called too quickly cheats the seller, and I have nearly learned it." } },
      choices = { { text = "Nearly is something. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up on the long walk and never saw a shop until I was grown, so perhaps that is why I like them so much." } },
    _none = { { id = "tp_none", text = "I have never seen one come across the floor, {class}, though I would dearly like to." } },
  },
}

---------------------------------------------------------------------------
-- Chepi: reagent vendor on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "chepi", id = TODO_NPC("Chepi"), name = "Chepi", gender = "female", title = "Reagents",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "watchful" }, values = { "devout", "practical" },
  notices = { "class" },
  impression = {
    first = "Chepi sells reagents on the lower rise from rows of small pouches, each tied with a different knot so she can find it in the dark. She asks every customer what the thing is for, and she listens to the answer.",
    third = "{name} met Chepi, who sells reagents on Thunder Bluff's lower rise.",
  },
  greetings = {
    { id = "g_hi", text = "Earth Mother keep you, {class}. Tell me what you mean to call upon, and I will tell you what it will ask of you in return." },
    { id = "g_back", when = { metBefore = true }, text = "You have used up what I sold you, then. I hope it was spent on something worth the spending." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You will be wanting ankhs, {class}. I keep them at the front, because a shaman who needs one is seldom in a mood to wait." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A walker of the wild paths. I have seeds set aside for you, gathered on the Golden Plains before the dew was off them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Chepi. Seeds, ankhs, candles, powders and dust, I keep them all, because a spell is a bargain and somebody must sell the other half of it." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I am Chepi. I will sell you what you came for, {class}, because the Horde asks it of me, but I will not ask what you mean to do with it." },
      },
      again = {
        { id = "h_again", text = "What else do you need, {class}?" },
        { id = "h_again2", text = "Ask, and I will see whether I have a pouch for it." },
      },
      choices = {
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "Where do the reagents come from?", next = "where" },
        { text = "You said a spell is a bargain.", next = "bargain" },
        { text = "Earth Mother keep you, Chepi.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The seeds and the roots I gather myself, down on the plains, and the rest comes up the lifts from Orgrimmar. The candles are the Forsaken's, from the Pools of Vision, and they burn very clean, whatever else one says of the makers." } },
      choices = {
        { text = "You trade with the Forsaken?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "I trade with their priests, who come up for cloth and leave me candles. They are quiet and exact and they never smile, and I have decided that a people who make something for the dead cannot be wholly lost." },
        { id = "f_scourge", when = { race = "Scourge" }, text = "With your priests, yes, and they are the most exact customers I have. I do not pretend to understand your people, but I have never been cheated by one." },
      },
      choices = { { text = "A generous thought. Something else.", next = "BACK" } },
    },
    bargain = {
      lines = { { id = "b_default", text = "A druid who wakes a fallen friend gives a seed back to the earth, and a shaman who walks back from death leaves an ankh behind. The Earth Mother gives freely, but she likes to be asked properly, and the reagent is the asking." } },
      choices = { { text = "Then I'll ask properly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I gathered herbs for the shaman when the tribes wandered, and I gather for everyone now." } },
    _none = { { id = "tp_none", text = "I have no pouch for that, friend, and no knowledge of it either." } },
  },
}

---------------------------------------------------------------------------
-- Hewa: cloth armor at Hewa's Armory, at the foot of the wind rider tower.
---------------------------------------------------------------------------
P:NPC {
  key = "hewa", id = TODO_NPC("Hewa"), name = "Hewa", gender = "male", title = "Cloth Armor Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "careful", "kind" }, values = { "practical", "community" },
  notices = { "class" },
  impression = {
    first = "Hewa owns Hewa's Armory at the foot of the wind rider tower and sells the cloth himself. He counts every coin twice and frowns over the takings, and then he quietly lets a young traveller have the better robe.",
    third = "{name} met Hewa, who runs Hewa's Armory on Thunder Bluff's lower rise.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to my armory, {class}. The cloth is on this side, and if it is leather or mail you want, Ahanu and Elki are only a few steps away." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, friend. Let me look at the hems of what I sold you, and I will know how hard you have been travelling." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "Good, a customer who will wear what I sell and not stuff it into a pack for bandages. Come and feel the weave, {class}." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Hewa, and this armory carries my name because I am the one who keeps the tally. I sell robes and wraps, Elki sells mail, and Ahanu stitches leather and would give it all away if I let him." },
      },
      again = {
        { id = "h_again", text = "What else can I show you, {class}?" },
        { id = "h_again2", text = "Ask, friend, for I am only counting, and the count will keep." },
      },
      choices = {
        { text = "Show me your cloth.", next = "BUSINESS" },
        { text = "Do tauren wear much cloth?", next = "cloth" },
        { text = "Ahanu says you never turn anyone away.", next = "ahanu" },
        { text = "Good trade to you, Hewa.", next = "END" },
      },
    },
    cloth = {
      lines = { { id = "c_default", text = "Our shaman and druids like a good woven wrap for ceremony, but most of what I sell goes to the Forsaken from the Pools of Vision and the trolls off the wind riders. I have learned to cut robes very narrow, which pained me at first." } },
      choices = {
        { text = "Where does the cloth come from?", next = "weave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave = {
      lines = { { id = "w_default", text = "The plain linen comes up from Bloodhoof, and Tepa's tailors on the middle rise make most of it into something worth wearing. The dyes are ours, from plains flowers, which is why you will find no black on my poles." } },
      choices = { { text = "The Forsaken must be disappointed. Something else.", next = "BACK" } },
    },
    ahanu = {
      lines = { { id = "a_default", text = "Ahanu talks too much, and he gives too much, and I have told him so. A shop that gives everything away feeds nobody next winter, but I will not have a young one walk out to the Barrens in rags either, so we argue and then we do it his way." } },
      choices = { { text = "That sounds like a good partnership. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I traded woven goods between the camps, and when the bluff was built I chose the spot where every traveller lands." } },
    _none = { { id = "tp_none", text = "I cannot help you there, {class}. I know cloth and I know sums, and that is the whole of it." } },
  },
}

---------------------------------------------------------------------------
-- Elki: mail armor at Hewa's Armory.
---------------------------------------------------------------------------
P:NPC {
  key = "elki_tb", id = TODO_NPC("Elki"), name = "Elki", gender = "male", title = "Mail Armor Merchant",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady", "plain" }, values = { "practical", "loyal" },
  notices = { "class" },
  impression = {
    first = "Elki sells mail at Hewa's Armory, and the racks behind him chime softly whenever the wind comes over the rise. He is a broad, plain-spoken tauren who tests every ring with his thumb before he will sell it.",
    third = "{name} met Elki, the mail armor merchant at Hewa's Armory.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. If you want something between you and a quilboar's spear, you have come to the right side of the armory." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend. Has the mail held, or have you brought me holes to look at?" },
  },
  notice = {
    { id = "n_mail", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "You will grow into mail soon enough, {class}, if you have not already. Leather is fine for the plains, but the Barrens has sharper teeth." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Elki. Hewa has the cloth and Ahanu has the leather, and I have the mail, which is the heaviest to carry up the lifts and so the one they both leave to me." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask away, for the mail is not going to walk off." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "Who makes it?", next = "makes" },
        { text = "Mail must be hard to fit on a tauren.", next = "fit" },
        { text = "Stay well, Elki.", next = "END" },
      },
    },
    makes = {
      lines = { { id = "m_default", text = "Karn Stonehoof's smithy, mostly, a short walk from here. His apprentices draw the wire and close the rings, and I can tell which of them made a shirt by how even the rows lie." } },
      choices = {
        { text = "Which apprentice is best?", next = "best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Young Thrag has the strongest arm, but he hurries, and a hurried ring opens the first time something bites it. I send those shirts back, and Karn thanks me for it even if Thrag does not." } },
      choices = { { text = "Better sent back than found out. Something else.", next = "BACK" } },
    },
    fit = {
      lines = {
        { id = "f_default", text = "It takes near twice the rings to go around one of us, so I keep the big shirts at the back and the orc and troll sizes in front. Nobody has asked me for anything smaller yet, and I would not know where to start." },
        { id = "f_tauren", when = { race = "Tauren" }, text = "You know it yourself, {g:brother|sister}. There is the hump to go over and the horns to go around, and I keep a stock of long shirts at the back for exactly your trouble." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a spear against the centaur before I carried mail up a lift, and I know which I would rather be wearing." } },
    _none = { { id = "tp_none", text = "That is not something I know, {class}. Ask Hewa, who hears everything that comes off the wind riders." } },
  },
}

---------------------------------------------------------------------------
-- Krumn: guild master on the lower rise, beside Thrumn the tabard vendor.
---------------------------------------------------------------------------
P:NPC {
  key = "krumn", id = TODO_NPC("Krumn"), name = "Krumn", gender = "male", title = "Guild Master",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "grave", "warm" }, values = { "community", "loyal" },
  notices = { "race" },
  impression = {
    first = "Krumn keeps the guild charters of Thunder Bluff, and he treats the founding of a guild as gravely as the naming of a tribe. He reads every charter aloud before he will set his mark to it.",
    third = "{name} met Krumn, the guild master of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome, {class}. Do you come to bind yourself to others, or to ask how it is done?" },
    { id = "g_back", when = { metBefore = true }, text = "You return, friend. I hope those who walk beside you are still walking the same way." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A guild is a small tribe that chooses itself, young one. Choose it as carefully as you would have chosen your own, had anyone asked you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Krumn, and I keep the charters. When enough hands have signed one, I witness it before the Earth Mother, and Thrumn here sees that the new guild has colours to walk under." },
      },
      again = {
        { id = "h_again", text = "What else would you know, {class}?" },
        { id = "h_again2", text = "Speak, and I will answer as plainly as I can." },
      },
      choices = {
        { text = "I have guild business.", next = "BUSINESS" },
        { text = "Why do the tauren care about guilds?", next = "why" },
        { text = "You must see many guilds fail.", next = "fail" },
        { text = "Walk with the Earth Mother, Krumn.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because we were scattered tribes until Cairne bound us, and we know what it is worth to stand together by choice. An orc, a troll and a tauren who sign one charter have made in a morning what took our people generations." } },
      choices = {
        { text = "And the Forsaken who sign?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "I witness their marks as I witness anyone's. I have noticed that a Forsaken reads the whole charter before signing, which is more than most orcs do, and I think it is because they have been bound once without being asked." },
        { id = "f_scourge", when = { race = "Scourge" }, text = "I witness your people's marks as I witness anyone's. You read every word before you sign, and having heard something of what was done to you, I do not wonder at it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "fa_default", text = "More than I see last, I am sorry to say. They come to me full of fire, and a season later one of them comes back alone to ask how a name is struck off. I tell each one that a herd which never quarrels has never travelled far." } },
      choices = { { text = "Wise enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I spoke for my family at the tribal moots, and when the bluff was raised Cairne asked me to do the same for those who have no tribe here." } },
    _none = { { id = "tp_none", text = "No charter I keep speaks of that, friend, and I would not guess at it." } },
  },
}

---------------------------------------------------------------------------
-- Thrumn: tabard vendor, beside Krumn.
---------------------------------------------------------------------------
P:NPC {
  key = "thrumn", id = TODO_NPC("Thrumn"), name = "Thrumn", gender = "male", title = "Tabard Vendor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "fussy" }, values = { "craft", "community" },
  notices = { "gear" },
  impression = {
    first = "Thrumn sells guild tabards beside Krumn's charter table, and he has firm opinions about which colours belong together. He holds each new design up to the sun and tilts his great head at it before he lets it go.",
    third = "{name} met Thrumn, the tabard vendor of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, {class}! If your guild has a name, it ought to have colours too, and I am the one to see about that." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, friend. Tell me you have not come to put orange on purple." },
  },
  notice = {
    { id = "n_tabard", cat = "gear", when = { class = "WARRIOR" },
      text = "A warrior should be seen coming, {class}. Your enemies ought to know whose friends they will have to answer to." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Thrumn. Krumn binds a guild with words, and I give it something to be recognised by across a battlefield, which I sometimes think is the more useful of the two." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I have dye drying, but it can dry without me." },
        { id = "h_again2", text = "Yes, friend, ask." },
      },
      choices = {
        { text = "Show me the tabards.", next = "BUSINESS" },
        { text = "What makes a good tabard?", next = "good" },
        { text = "It's only a piece of cloth.", next = "cloth" },
        { text = "Good day, Thrumn.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "Two colours that can be told apart at dusk, and one plain sign that a child could draw in the dirt. The tribes have painted their totems that way for longer than memory, and nobody ever mistook a Bloodhoof pole for a Runetotem one." } },
      choices = {
        { text = "And what makes a bad one?", next = "bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bad = {
      lines = { { id = "b_default", text = "Skulls, friend, on everything. Half the guilds that come up the lifts want a skull on black, and then they wonder why no one can tell them from the other forty guilds with a skull on black." } },
      choices = { { text = "I'll avoid skulls. Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "So is a war banner, and so is the wrap they lay over the dead at Red Rocks. Cloth is what we put our meaning on, {class}, because stone is too heavy to carry into a fight." } },
      choices = { { text = "I spoke too lightly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I painted totem poles before I dyed cloth, and it is much the same work with less climbing." } },
    _none = { { id = "tp_none", text = "I only know colours and cloth, {class}. Krumn is the one for weightier matters." } },
  },
}

---------------------------------------------------------------------------
-- Kurm Stonehoof: mining supplies on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kurm_stonehoof", id = TODO_NPC("Kurm Stonehoof"), name = "Kurm Stonehoof", gender = "male", title = "Mining Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gruff", "steady" }, values = { "practical", "devout" },
  notices = { "craft" },
  impression = {
    first = "Kurm Stonehoof sells picks and miners' gear on the lower rise, near where Brek Stonehoof teaches the craft. He has the Stonehoof way of looking at a rock as if it had just said something interesting.",
    third = "{name} met Kurm Stonehoof, who sells mining supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. If you mean to take from the earth, take with a decent pick, and I have those." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. I hope that means you wore the last pick out honestly." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "There is rock dust in your fur, or what passes for it. Good, then I need not explain which end of the pick to hold." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kurm, of the Stonehoof. Brek teaches the young ones where to dig and how to ask leave of the earth first, and I see that they go out with tools that will not shame him." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, and be plain about it." },
      },
      choices = {
        { text = "Show me your mining supplies.", next = "BUSINESS" },
        { text = "Ask leave of the earth?", next = "leave" },
        { text = "The Venture Company doesn't ask leave.", next = "venture" },
        { text = "Good digging, Kurm.", next = "END" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "A Stonehoof takes what lies near the surface and closes the wound after, the way you would dress a cut on a kodo. The ore is the Earth Mother's bone, and she will lend a little of it to those who do not go breaking the whole leg." } },
      choices = {
        { text = "And if someone takes more?", next = "more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    more = {
      lines = { { id = "m_default", text = "Then the land sickens, and you have only to look at the wells the goblins fouled on the plains to see it. The dwarves at Bael'dun are no better, for they dig as though something were owed to them down there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    venture = {
      lines = { { id = "v_default", text = "No, they do not, and their mine above Bloodhoof is a hole I can feel from here, like a bad tooth. I sell picks to anyone who would rather swing one at their supervisors than at the hillside." } },
      choices = { { text = "I may take you up on that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Stonehoof have always worked stone and metal, and I am the one of us who would rather sell a pick than swing it all day." } },
    _none = { { id = "tp_none", text = "I know rock, {class}, and that is not rock. Ask someone else." } },
  },
}

---------------------------------------------------------------------------
-- Kuruk: general goods on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kuruk", id = TODO_NPC("Kuruk"), name = "Kuruk", gender = "male", title = "General Goods",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easy", "chatty" }, values = { "community", "trade" },
  notices = { "race" },
  impression = {
    first = "Kuruk keeps the general goods lodge on the lower rise, close enough to the lifts that he sees every newcomer step off with wide eyes. He greets each one as though they had walked all the way up.",
    third = "{name} met Kuruk, who sells general goods on Thunder Bluff's lower rise.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the bluff, {class}! Catch your breath, for the lift takes it from everyone the first time." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, friend. The lift does not trouble you any more, I see." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = { "Troll", "Orc" } },
      text = "Up from Durotar, are you? You will find the air thinner here and the water sweeter, and I sell skins to carry the second." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kuruk, and this lodge has whatever a traveller forgot to pack, which is usually water, food and something to carry them in. I have sold more waterskins to orcs than there are orcs, by my count." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, friend?" },
        { id = "h_again2", text = "Ask, {class}, for I like the company." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "You must see everyone who arrives.", next = "arrive" },
        { text = "Who built the lifts?", next = "lifts" },
        { text = "Thank you, Kuruk.", next = "END" },
      },
    },
    arrive = {
      lines = { { id = "a_default", text = "Everyone who comes by the lifts, yes, and I have made a game of guessing their business before they speak. The ones who look up are here to see Cairne, the ones who look down are afraid of heights, and the ones who look at my shelves are sensible." } },
      choices = {
        { text = "And what did you guess about me?", next = "guess" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guess = {
      lines = {
        { id = "g_default", text = "That you have come a long way and mean to go a good deal further, {class}. I am seldom wrong about that kind, and they always buy more food than they think they need." },
        { id = "g_tauren", when = { race = "Tauren" }, text = "That you were coming home, {g:brother|sister}, whether or not you were born here. A tauren steps off that lift as though the ground had been waiting for him." },
      },
      choices = { { text = "Close enough. Something else.", next = "BACK" } },
    },
    lifts = {
      lines = { { id = "l_default", text = "Our own people did, with timber hauled up from the plains and a good many ropes, when the bluff was first settled. Before that you climbed, which is why the centaur never troubled us up here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept this lodge since the first lift ran, and I have never tired of watching it come up." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Ask Innkeeper Pala, who hears what travellers say once they have sat down." } },
  },
}

---------------------------------------------------------------------------
-- Pakwa: bag vendor on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "pakwa", id = TODO_NPC("Pakwa"), name = "Pakwa", gender = "female", title = "Bag Vendor",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "kind" }, values = { "practical", "craft" },
  notices = { "class" },
  impression = {
    first = "Pakwa sells bags on the lower rise, and she can tell at a glance how much a traveller is carrying badly. She has been known to repack a stranger's whole kit before selling them anything.",
    third = "{name} met Pakwa, the bag vendor on Thunder Bluff's lower rise.",
  },
  greetings = {
    { id = "g_hi", text = "Stand still a moment, {class}, and let me look at how you are carrying all that. Oh, that will not do at all." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and your straps are still too long. Come here and let me see." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter with arrows rattling loose in a pack is a hunter the prey hears coming. I have quivers, {class}, and you want one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pakwa, and I sell bags, pouches and packs. When our people wandered, everything a family had was carried, so you may trust a tauren to know how a load ought to sit." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Go on, I can talk and stitch a strap at once." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "How should a load sit?", next = "load" },
        { text = "Tand sells baskets on the middle rise.", next = "tand" },
        { text = "I'll mind my straps. Farewell.", next = "END" },
      },
    },
    load = {
      lines = { { id = "l_default", text = "Heavy things high and close to the back, light things low, and whatever you will need in a hurry where one hand can find it. Most of the young ones who come to me have their bandages at the very bottom, under the cooking pot." } },
      choices = {
        { text = "Mine might be under the pot too.", next = "pot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pot = {
      lines = { { id = "p_default", text = "Then move them tonight, and thank me the first time something with tusks opens your arm. I say it to everyone, and the ones who listen come back to tell me so." } },
      choices = { { text = "I'll move them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tand = {
      lines = { { id = "t_default", text = "He does, and they are fine baskets, for a lodge. A basket is for things that stay where you put them, and a bag is for things that must go where you go, so there is room on the bluff for both of us." } },
      choices = { { text = "Fairly said. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I packed my family's kodo on the long walk, every morning for more years than I like to count." } },
    _none = { { id = "tp_none", text = "I could not say, {class}. I know what goes in a bag, and that would not fit." } },
  },
}

---------------------------------------------------------------------------
-- Shadi Mistrunner: trade supplies on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "shadi_mistrunner", id = TODO_NPC("Shadi Mistrunner"), name = "Shadi Mistrunner", gender = "female", title = "Trade Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm", "busy" }, values = { "craft", "community" },
  notices = { "craft" },
  impression = {
    first = "Shadi Mistrunner sells trade supplies on the lower rise: thread, vials, flux, dyes and all the small things a crafter runs out of at the worst moment. She knows every trainer on the bluff by what they send their students down to fetch.",
    third = "{name} met Shadi Mistrunner, who sells trade supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, {class}. Tell me which trainer sent you, and I will know what you need before you remember it." },
    { id = "g_back", when = { metBefore = true }, text = "Run out again, friend? That is a good sign, because it means you have been working." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You have a tailor's pricked fingers, so Tepa will have sent you for thread. Coarse or fine, {class}?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shadi, of the Mistrunners. My kin feed the bluff, with Aska's cooking and Kah's fishing and Nan's fruit, and I am the one who went another way and feeds its workshops." },
      },
      again = {
        { id = "h_again", text = "What else do you need, friend?" },
        { id = "h_again2", text = "Ask, {class}, while I sort these vials." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The Mistrunners are everywhere on this bluff.", next = "kin" },
        { text = "Which trainer sends you the most students?", next = "trainers" },
        { text = "Thank you, Shadi.", next = "END" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "We are a large family, and we like to be useful, and on a mesa there are only so many ways to be useful. You cannot buy a meal, a fishing line or a melon up here without a Mistrunner having had a hand in it." } },
      choices = {
        { text = "Do they mind that you left the kitchen?", next = "left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "Aska said a Mistrunner who cannot cook is a river that runs uphill. Then her stew pot cracked and she needed flux for the mending in a hurry, and she has been very polite to me since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trainers = {
      lines = { { id = "t_default", text = "Bena Winterhoof, by a long way, because her alchemy students break a vial for every potion they finish. Karn Stonehoof's smiths come second for flux, and they are the only ones who ever carry it back up without spilling." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Mistrunner who sells thread instead of food, and the family has nearly forgiven me." } },
    _none = { { id = "tp_none", text = "I do not stock that, {class}, and I do not know who would." } },
  },
}

---------------------------------------------------------------------------
-- Taur Stonehoof: blacksmithing supplies at Karn's Smithy.
---------------------------------------------------------------------------
P:NPC {
  key = "taur_stonehoof", id = TODO_NPC("Taur Stonehoof"), name = "Taur Stonehoof", gender = "male", title = "Blacksmithing Supplies",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady", "dry" }, values = { "craft", "practical" },
  notices = { "craft" },
  impression = {
    first = "Taur Stonehoof sells hammers, flux and coal at Karn's Smithy, close enough to the forge that his stock is always warm to the touch. He watches the apprentices work with the calm of someone who has seen every mistake before.",
    third = "{name} met Taur Stonehoof, who sells blacksmithing supplies at Karn's Smithy.",
  },
  greetings = {
    { id = "g_hi", text = "Well met, {class}. Mind the sparks, for the apprentices are not yet particular about where they send them." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more coal, I expect. Everyone always is." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have burns on your forearms in all the usual places, friend. Sit near the fire, then, because you will not mind it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Taur Stonehoof. Karn teaches the smithing and I keep the smithy fed, which means coal, flux, stones and hammers, and a new hammer for young Thrag about once a moon." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask, friend, for the fire will keep." },
      },
      choices = {
        { text = "Show me your smithing supplies.", next = "BUSINESS" },
        { text = "What does Thrag do to his hammers?", next = "thrag" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "Keep the fire fed, Taur.", next = "END" },
      },
    },
    thrag = {
      lines = { { id = "t_default", text = "He hits everything as though it had insulted his mother, and sooner or later the haft gives up. Karn says the strength is a gift and the patience will follow, and I say that until it does I shall keep carving hafts." } },
      choices = {
        { text = "Was Karn the same, once?", next = "karn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    karn = {
      lines = { { id = "k_default", text = "Karn was worse, though he would not thank me for telling you. He split an anvil stone at Thrag's age, and our grandfather made him carry the two halves about the camp for a season so he would learn what a careless blow weighs." } },
      choices = { { text = "A heavy lesson. Something else.", next = "BACK" } },
    },
    coal = {
      lines = { { id = "c_default", text = "Up the lifts from the Barrens, where the orcs dig it, and we send worked iron back down for it. Mulgore has little coal of her own, and I would rather trade for it than have anyone cut her open looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Stonehoof, so I was always going to end up near a forge. I chose the cooler side of it." } },
    _none = { { id = "tp_none", text = "That is no matter for a smithy, {class}. Karn hears more than I do, when the hammers are quiet." } },
  },
}

---------------------------------------------------------------------------
-- Thrag Stonehoof: apprentice blacksmith at Karn's Smithy. Forever: Camping 101: Blacksmithing.
---------------------------------------------------------------------------
P:NPC {
  key = "thrag_stonehoof", id = TODO_NPC("Thrag Stonehoof"), name = "Thrag Stonehoof", gender = "male", title = "Apprentice Blacksmith",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "eager", "proud" }, values = { "craft", "strength" },
  notices = { "craft", "class" },
  impression = {
    first = "Thrag Stonehoof is the biggest apprentice at Karn's Smithy and swings his hammer as if the iron might get away. He is proud of his arm, a little ashamed of his temper with the metal, and keen to prove himself to anyone who stops.",
    third = "{name} met Thrag Stonehoof, an apprentice blacksmith at Karn's Smithy in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Stand back a pace, {class}, I am about to strike. There, now what can a Stonehoof do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, friend! Look, I have not broken a hammer since you were last here, or only the one." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You work iron too! Then tell me honestly, does your master also say you hit too hard, or is it only mine?" },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "That is a fighter's arm, {class}. One day you will carry something with my mark on it, once Karn lets me have a mark." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Thrag Stonehoof, and I am apprenticed to Karn, who is the best smith on the bluff and the hardest to please. I draw wire, close rings and pump the bellows, and one day soon he will let me make a blade from start to finish." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") },
          text = "You have come about the camping lesson, have you not? Good, because Karn gave that task to me and nobody else, and I mean to show you what a smith is worth out on the plains." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Blacksmithing") },
          text = "How does the camp work stand, {class}? If the iron holds, tell Karn so, and say it loudly enough for Taur to hear." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The iron is still heating." },
        { id = "h_again2", text = "Ask quickly, before Karn sees me talking." },
      },
      choices = {
        { text = "What does a smith bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") } },
        { text = "What is it like, learning from Karn?", next = "karn" },
        { text = "Taur says you break hammers.", next = "hammers" },
        { text = "Why did you choose the forge?", next = "forge" },
        { text = "Strike well, Thrag.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Everything that keeps a camp standing, friend: the stakes, the pot hook, the edge on your knife. A hunter far from the bluff has no Karn to run to, so he had better know how to mend his own iron over his own fire." } },
      choices = {
        { text = "Then show me what you have to teach.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    karn = {
      lines = { { id = "k_default", text = "He does not shout, which is worse than shouting. He picks up what I have made, turns it over once and puts it back in the fire, and then I know I am starting again." } },
      choices = {
        { text = "Has he ever kept one?", next = "kept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kept = {
      lines = { { id = "ke_default", text = "One, a plain spearhead, last season. He said nothing at all, but he fitted it to a shaft himself and gave it to one of the braves who walk the bridges, and I have looked for it on every patrol since." } },
      choices = {
        { text = "Which brave carries it?", next = "brave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brave = {
      lines = { { id = "b_default", text = "Karn will not tell me, because he says a smith who follows his work around learns nothing new. I think it is Hunter Ragetotem, who passes the bank, since he is the only one who nods to me." } },
      choices = { { text = "I'll look at his spear. Something else.", next = "BACK" } },
    },
    hammers = {
      lines = {
        { id = "ha_default", text = "Taur counts them, which is unkind of him. The iron resists, and I answer it, and sometimes the hammer is the one that loses the argument." },
        { id = "ha_war", when = { class = "WARRIOR" }, text = "Taur counts them, which is unkind of him. You are a warrior, so you know how it is when a thing will not yield and your arm decides the matter before your head has spoken." },
      },
      choices = {
        { text = "The iron isn't your enemy, Thrag.", next = "enemy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemy = {
      lines = { { id = "e_default", text = "That is what Karn says, in nearly those words. He says the metal already knows the shape and only wants persuading, and I am trying to believe it, though persuading is slow." } },
      choices = { { text = "Slow work lasts. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    forge = {
      lines = { { id = "f_default", text = "I am a Stonehoof, and we have worked stone and metal since before the tribes had a home to work them in. My cousins went to the mines with Brek, but I wanted to see what the ore becomes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Karn Stonehoof's apprentice, and I will be a smith in my own right when he says so and not a day before." } },
    _none = { { id = "tp_none", text = "I do not know, {class}. They do not tell apprentices much beyond when to pump the bellows." } },
  },
}
