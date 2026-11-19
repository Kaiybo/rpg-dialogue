-- Ironforge folk the first passes missed, part two: the mountaineer at South Gate Outpost, the keeper of the
-- Great Forge, a mage trainer and two hunter trainers, the Craghelm plate, the clothier's sellers, a bag
-- vendor, two odd fish from the Forlorn Cavern, the herbalist and an old apprentice smith.
-- Voices: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Myolor Sunderfury: keeper of the Great Forge. Classic: points blacksmiths (200+) to Ironus Coldsteel or Grumnus Steelshaper.
P:NPC {
  key = "if_myolor", id = TODO_NPC("Myolor Sunderfury"), name = "Myolor Sunderfury", gender = "male",
  bible = "bibles/missed_b.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "grave", "watchful" }, values = { "craft", "tradition" },
  notices = { "craft", "race" },
  impression = {
    first = "Myolor Sunderfury is the keeper of the Great Forge, and he stands at its rim with the firelight on his face as if he were listening to it. Nothing on the ring seems to happen without his noticing.",
    third = "{name} met Myolor Sunderfury, the keeper of the Great Forge of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the edge, {class}. The Forge has burned since before there was a city round it, an' it's never yet given back anythin' that fell in." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, an' I can tell by the way ye look at the fire an' no' at me. Come closer, then, an' feel what real heat is." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back tae the fire. Most do, sooner or later." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", ["not"] = { profession = "Blacksmithing" } },
      text = "A dwarf wi' clean hands, standin' at the Great Forge. I'll no' judge ye for it, but yer ancestors might." },
    { id = "n_other", cat = "race", when = { race = { "Human", "NightElf", "Gnome" } },
      text = "Ye're a long way from yer own hearth. Look as long as ye like, for there's nae fire tae match this one in all the Alliance." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Myolor Sunderfury, keeper o' the Great Forge. I see that the channels run clear an' the heat holds even, an' I see that those who work the ring are worthy o' it, which is the harder half o' the task." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask? The fire's patient, an' so am I." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What does a keeper of the Forge do?", next = "keeper" },
        { text = "You must hear everything said on this ring.", next = "hear" },
        { text = "Where does the fire come from?", next = "fire" },
        { text = "I want to master my craft.", next = "master", when = { profession = "Blacksmithing" } },
        { text = "I'll leave you to the fire.", next = "END" },
      },
    },
    keeper = {
      lines = { { id = "k_default", text = "I read the fire, the way a brewer reads a mash. When the flow thickens I have the channels cleared, an' when a smith pours careless I have a word wi' him, an' in forty years nae anvil on this ring has gone cold." } },
      choices = {
        { text = "And who decides who is worthy of the ring?", next = "keeper2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper2 = {
      lines = { { id = "k2_default", text = "The work decides, an' I only say it aloud. Bengus Deepforge teaches any who'll lift a hammer, but a place at the Forge itself is earned wi' a piece ye'd no' be ashamed tae show yer grandfather." } },
      choices = {
        { text = "Has anyone lost their place?", next = "keeper3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper3 = {
      lines = { { id = "k3_default", text = "Twice in my time, an' both for sellin' flawed steel tae soldiers an' callin' it sound. A bad blade kills the dwarf who trusts it, so I'll forgive a smith almost anythin' but that." } },
      choices = { { text = "That seems just. Something else.", next = "BACK" } },
    },
    hear = {
      lines = { { id = "hr_default", text = "The Forge is the middle o' the mountain, an' every errand in Ironforge crosses it. I hear who's buyin' iron an' who's stopped, an' which senator's servant is carryin' messages tae whom, an' I keep most o' it behind my beard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fire = {
      lines = { { id = "f_default", text = "From the heart o' the mountain, where the stone runs like water. Our forefathers found it burnin' when they came down from the north, an' they built Ironforge round it the way ye'd build a house round a hearth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master = {
      lines = {
        { id = "m_default", text = "Then ye'll come tae a fork, as every smith does. One road is the armourer's an' the other is the weaponsmith's, an' ye cannae walk both, so think on which ye'd sooner be remembered for." },
      },
      choices = {
        { text = "Who teaches the weaponsmiths?", next = "weapon" },
        { text = "Who teaches the armorers?", next = "armor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weapon = {
      lines = { { id = "w_default", text = "Ironus Coldsteel, here on the ring, an' he's as hard as his name. He'll want proof o' yer skill before he says a word, so bring yer best work an' expect him tae find the flaw in it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    armor = {
      lines = { { id = "a_default", text = "Grumnus Steelshaper, who's forged plate for the King's own guard. He'll set ye a task that seems simple an' isnae, an' if ye finish it he'll call ye an armourer, which from Grumnus is high praise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept the Forge before me, an' his father before him. A Sunderfury has stood at this rim since the War of the Three Hammers." } },
    _none = { { id = "tp_none", text = "The fire hasnae told me that. Ask elsewhere, {class}." } },
  },
}

-- Nittlebur Sparkfizzle: gnome mage trainer, Hall of Mysteries.
P:NPC {
  key = "if_nittlebur", id = TODO_NPC("Nittlebur Sparkfizzle"), name = "Nittlebur Sparkfizzle", title = "Mage Trainer", gender = "male",
  bible = "bibles/missed_b.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "enthusiastic", "scattered" }, values = { "knowledge", "experiment" },
  notices = { "class" },
  impression = {
    first = "Nittlebur Sparkfizzle teaches mages in the Hall of Mysteries, and small blue sparks jump between his fingers whenever he gets excited, which is often. He lectures as though the listener had already asked three questions.",
    third = "{name} met Nittlebur Sparkfizzle, a gnome mage trainer in Ironforge's Hall of Mysteries.",
  },
  greetings = {
    { id = "g_default", text = "Hello, hello! Don't mind the sparks, they're a residual discharge and they're only about four percent likely to singe anything." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A colleague! Wonderful, because I've had a thought about frost crystallisation since breakfast, and nobody else here will listen to it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and I've revised the theory twice since then, so forget everything I told you." },
  },
  notice = {
    { id = "n_gnome", cat = "class", when = { class = "MAGE", race = "Gnome" },
      text = "A gnome mage, which is the best sort, and I say that with a sample size of several. Have you met Bink yet? She takes the newest ones in hand." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "One of the priests from across the hall! Your people keep asking us to cast more quietly, and we are trying, truly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Nittlebur Sparkfizzle, magus, and I teach the arcane arts to anyone with the aptitude and a tolerance for chalk dust. The dwarves gave us half the Hall of Mysteries, and we share it with the priests, who are very patient about the noises." },
      },
      again = {
        { id = "h_again", text = "What else? I've a dozen things half explained already." },
        { id = "h_again2", text = "Yes, go on, I was only thinking aloud." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Is magic much like engineering?", next = "engineering" },
        { text = "Who else teaches here?", next = "others" },
        { text = "I'll leave you to your theory.", next = "END" },
      },
    },
    engineering = {
      lines = { { id = "e_default", text = "It's exactly like engineering, except that the parts are invisible and the manual was written by elves ten thousand years ago. You find the principle, you measure the input, and you write down what exploded, and that last part is where most human mages let themselves down." } },
      choices = {
        { text = "What's exploded lately?", next = "engineering2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineering2 = {
      lines = { { id = "e2_default", text = "Only a lectern, and it was an old one. I was testing whether a frost spell and a fire spell cast in the same half second cancel out, and I can now tell you with confidence that they produce a great deal of steam." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "Bink and her brother Dink, who've heard every joke about it, and Juli Stormkettle, who is the tidiest caster I've ever shared a floor with. Milstaff Stormeye handles the portals, and I'd leave that to him, since a portal is a poor thing to get slightly wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied in Gnomeregan and corresponded with Dalaran, back when both were places you could send a letter to." } },
    _none = { { id = "tp_none", text = "I haven't a theory on that yet, though give me an afternoon and I'll have two." } },
  },
}

-- Olthran Craghelm: heavy armor merchant, Craghelm's Plate and Chain, Military Ward.
P:NPC {
  key = "if_olthran", id = TODO_NPC("Olthran Craghelm"), name = "Olthran Craghelm", title = "Heavy Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "bluff", "proud" }, values = { "craft", "family" },
  notices = { "class", "kit" },
  impression = {
    first = "Olthran Craghelm sells plate at Craghelm's Plate and Chain, and he wears a breastplate of his own stock behind the counter as a standing advertisement. He thumps it with a fist whenever he wants to make a point.",
    third = "{name} met Olthran Craghelm, who sells plate armor at Craghelm's Plate and Chain in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Craghelm's! If ye want somethin' between yerself an' an orc's axe, ye've come tae the right counter." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Show me the dents, then, for I like tae see what my plate's been stoppin'." },
  },
  notice = {
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now here's a proper customer. That's decent steel ye're in, but the gorget's thin, an' a thin gorget is a short career." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye're wearin' a bedsheet tae a war, friend. I cannae help ye, but I'll pray for ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Olthran Craghelm, an' the plate's mine, while Dolkin sees tae the chain. Our name's been over this door since the orcs first came through the Portal, an' there are dwarves alive today because o' what we sold their fathers." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye?" },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "Show me your plate.", next = "BUSINESS" },
        { text = "What's the test of good plate?", next = "test" },
        { text = "The gnome nearby says plate is for those who can't dodge.", next = "liss" },
        { text = "Good day, Olthran.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Ye hang it on a post an' ye hit it wi' a warhammer, an' if it's still a breastplate afterwards, ye sell it. Dolkin does the hittin', for he enjoys it, an' I do the sellin', for I've the better beard." } },
      choices = {
        { text = "And the ones that fail?", next = "test2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test2 = {
      lines = { { id = "t2_default", text = "Back tae the smith who made it, wi' the dent facin' up so the whole ring can see. It's a hard thing tae do tae a craftsman, but I'd sooner shame a smith than bury a soldier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    liss = {
      lines = { { id = "l_default", text = "Lissyphus said that, did she? She's a sharp wee thing an' she's welcome tae her opinion. I'll only say that I've never seen a leather jerkin stop a ballista bolt, an' I've never seen a dwarf dodge one either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Craghelm by name an' by trade. Dolkin an' I took the shop over from our father, an' he still comes in tae tell us we're doin' it wrong." } },
    _none = { { id = "tp_none", text = "That's beyond me, friend. Ask in the Hall of Arms, for the trainers know the ward's business." } },
  },
}

-- Outfitter Eric: gnome, speciality tailoring supplies (fancy patterns), Stonebrow's Clothier.
P:NPC {
  key = "if_outfitter_eric", id = TODO_NPC("Outfitter Eric"), name = "Outfitter Eric", title = "Speciality Tailoring Supplies", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "fastidious", "chatty" }, values = { "style", "precision" },
  notices = { "craft", "kit" },
  impression = {
    first = "Outfitter Eric is a gnome in a very good waistcoat who sells the finer tailoring patterns at Stonebrow's Clothier. He brushes soot off his sleeve every few sentences and gives the Great Forge a reproachful look each time.",
    third = "{name} met Outfitter Eric, a gnome who sells speciality tailoring patterns in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Good day! Do mind the door, because every time it opens the Forge sends in another ounce of soot, and I've only the one waistcoat pressed." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again, and still wearing that, I see. Well, we can't all be finished in a day." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you'll understand me when I say that a dress shirt is harder than a suit of armour, since armour is allowed to look uncomfortable." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Outfitter Eric, and I sell the patterns for people who want to be looked at for the right reasons. Master Stonebrow teaches the honest everyday work, and I supply the shirts and formal cuts he says nobody in a mountain needs." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm only measuring a collar." },
        { id = "h_again2", text = "Yes, do go on." },
      },
      choices = {
        { text = "Show me your patterns.", next = "BUSINESS" },
        { text = "Who in Ironforge buys formal wear?", next = "buyers" },
        { text = "Why 'Outfitter', and no family name?", next = "name" },
        { text = "Good day, Eric.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "More people than Jormund thinks! Senators' families, merchants up from Stormwind, and every dwarf who has ever been invited to a wedding and found his one good shirt has shrunk, by which he means that he has grown." } },
      choices = {
        { text = "And the gnomes?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "b2_default", text = "Hardly at all, I'm sorry to say. We left Gnomeregan in whatever we stood up in, and most of Tinker Town still thinks a clean boiler suit is dressing for dinner. I intend to change that, one collar at a time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "Because it's on the sign and on every pattern I sell, and it's a good deal easier for dwarves to remember than my family name, which has eleven syllables. It's a trade name, and I've grown rather fond of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I cut uniforms for the tinkers' guilds back home. Here I cut for anyone with an occasion to rise to." } },
    _none = { { id = "tp_none", text = "I'm afraid I couldn't say. If it isn't worn, I haven't given it much thought." } },
  },
}

-- Pithwick: gnome bag vendor inside Fizzlespinner's General Goods, the Commons.
P:NPC {
  key = "if_pithwick", id = TODO_NPC("Pithwick"), name = "Pithwick", title = "Bag Vendor", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "earnest", "fussy" }, values = { "order", "thrift" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Pithwick sells bags from a corner of Fizzlespinner's General Goods, and he can tell at a glance how badly a traveller's pack has been loaded. He winces at dangling straps as other people wince at a wrong note.",
    third = "{name} met Pithwick, a gnome who sells bags at Fizzlespinner's General Goods in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Oh dear, your pack is sitting at least two inches too low, and I can hear something loose rattling about in the bottom of it." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! You've repacked since I saw you, and it's better, though not yet what I'd call good." },
  },
  notice = {
    { id = "n_low", cat = "greenness", when = { maxLevel = 10 },
      text = "You're new to the road, and you're carrying everything in one sack, aren't you? Everyone starts that way, and everyone regrets it at the first river." },
    { id = "n_herb", cat = "kit", when = { profession = { "Herbalism", "Mining" } },
      text = "You gather things as you go, I can tell by the dust in your seams. A gatherer needs more room than anyone, and never believes it until the bags are full." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pithwick, and I sell bags, which is the most important thing in this shop, whatever the general goods counter tells you. You can buy all the supplies in Ironforge, and they're no use to you at all if you can't carry them out of the door." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I can talk and fold." },
        { id = "h_again2", text = "Yes? Do ask, I like a question." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What's the right way to pack?", next = "pack" },
        { text = "Did you sell bags in Gnomeregan too?", next = "home" },
        { text = "Thanks, Pithwick.", next = "END" },
      },
    },
    pack = {
      lines = { { id = "p_default", text = "Heavy things high and close to the spine, food where you can reach it without stopping, and nothing whatsoever tied to the outside. I once saw a dwarf lose a whole ham down the side of the Great Forge, and he's never been quite the same." } },
      choices = {
        { text = "And what do people get most wrong?", next = "pack2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pack2 = {
      lines = { { id = "p2_default", text = "They keep things. Broken teeth from a boar, a wolf's ruined pelt, eleven left boots, all carried for miles in the hope that someone will want them. I'd estimate a third of every adventurer's load is rubbish with sentimental value." } },
      choices = { { text = "I feel personally described. Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "hm_default", text = "I designed tool rolls for the maintenance crews, with a pocket for every spanner and a label on every pocket. When the alarm went, I had nine of them packed and ready by the door, and that's nine families who walked out with their tools." } },
      choices = { { text = "That's something to be proud of. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Just Pithwick, bag maker, formerly of the third maintenance level. I pay my rent to the general goods counter in good stitching." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, I'm sorry. Unless it needs carrying, I'm not much help." } },
  },
}

-- Prynne: gnome in Stoneblade's, Forlorn Cavern.
P:NPC {
  key = "if_prynne", id = TODO_NPC("Prynne"), name = "Prynne", gender = "female",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "cool", "sly" }, values = { "skill", "privacy" },
  notices = { "class", "stealth" },
  impression = {
    first = "Prynne leans against the wall in Stoneblade's with a throwing knife turning over and over in her fingers. She watches the door with half-closed eyes and gives the impression of having already counted everyone's pockets.",
    third = "{name} met Prynne, a quiet gnome with a throwing knife who keeps to Stoneblade's in the Forlorn Cavern.",
  },
  greetings = {
    { id = "g_default", text = "You're standing in my light, and there isn't much of it down here to begin with. Were you after the shopkeeper, or did you just want to look at a gnome?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "I didn't hear you until the third step, which is better than most. Come in, then, and keep your hands where I can admire them." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'd say I'm surprised, but I saw you coming down the tunnel." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE", maxLevel = 15 },
      text = "Your left boot squeaks, did you know? It's a small thing, and it's exactly the sort of small thing that gets a person caught." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Prynne, and I don't sell anything, so you needn't look for a counter. I come here because the blades are good and nobody in the Forlorn Cavern asks what a gnome wants with so many of them." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm in no hurry, as you can see." },
        { id = "h_again2", text = "Go on, I'm only counting the spins." },
      },
      choices = {
        { text = "You handle that knife well.", next = "knife" },
        { text = "What does a gnome want with so many blades?", next = "blades" },
        { text = "Could you teach me to throw like that?", next = "teach", when = { class = { "ROGUE", "WARRIOR", "HUNTER" } } },
        { text = "I'll get out of your light.", next = "END" },
      },
    },
    knife = {
      lines = { { id = "k_default", text = "It's all arithmetic, really, which is why gnomes are good at it. One and a half turns at ten paces, two and a half at fifteen, and you only have to keep your wrist out of the sum." } },
      choices = {
        { text = "And at twenty paces?", next = "knife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife2 = {
      lines = { { id = "k2_default", text = "At twenty paces you ought to have got closer first. I can do it, three times in four, but I wouldn't stake anything I cared about on that fourth throw, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blades = {
      lines = { { id = "b_default", text = "The same thing a tall person wants, only I need them lighter and I need more of them, since I can't count on getting one back. As for what I throw them at, that would be telling, and I notice you haven't told me anything yet." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "I could, but I don't, not any more. Bixi Wobblebonk up at Timberline Arms takes students for thrown weapons, and she has more patience than I have, which you'll want." } },
      choices = { { text = "I'll look for Bixi. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm from Gnomeregan, like everyone my height. What I did there is nobody's business in Ironforge." } },
    _none = { { id = "tp_none", text = "I wouldn't know, and if I did I'd want something for it." } },
  },
}

-- Ransin Donner: dwarf in the Forlorn Cavern who keeps a baby murloc, Murky, at his side.
P:NPC {
  key = "if_ransin", id = TODO_NPC("Ransin Donner"), name = "Ransin Donner", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful", "eccentric" }, values = { "animals", "curiosity" },
  notices = { "class", "pet" },
  impression = {
    first = "Ransin Donner stands by the pool in the Forlorn Cavern with a small blue murloc hopping around his ankles. He seems entirely unbothered by the smell of fish, the gurgling, or the looks he gets from passing dwarves.",
    third = "{name} met Ransin Donner, a dwarf in the Forlorn Cavern who keeps a baby murloc for company.",
  },
  greetings = {
    { id = "g_default", text = "Hello there! Don't mind the wee fella, for he only gurgles like that when he's pleased tae see someone." },
    { id = "g_back", when = { metBefore = true }, text = "Look, Murky, it's our friend back again! He's been askin' after ye, in his way." },
  },
  notice = {
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER" },
      text = "A hunter! Before ye ask, no, ye cannae tame him, an' he'd be offended if ye tried." },
    { id = "n_human", cat = "class", when = { race = "Human" },
      text = "Ye're from the coast, are ye? Then ye'll have met his big cousins on some beach, an' I'll thank ye no' tae hold it against him." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ransin Donner, an' this is Murky. I keep small beasts, the odder the better, an' I'll tell ye there's nae odder nor better creature under this mountain than a baby murloc who's taken a likin' tae ye." },
      },
      again = {
        { id = "h_again", text = "What else? Murky's listenin' too, mind." },
        { id = "h_again2", text = "Go on, we've all day." },
      },
      choices = {
        { text = "How does a dwarf come by a murloc?", next = "murky" },
        { text = "Why keep him down here?", next = "cavern" },
        { text = "Murlocs have tried to kill me. Often.", next = "kill" },
        { text = "Goodbye, Ransin. Goodbye, Murky.", next = "END" },
      },
    },
    murky = {
      lines = { { id = "m_default", text = "He came tae me as an egg, blue as a winter sky, an' I kept it warm by the Forge for a month wi' nae idea what was in it. Then one mornin' there was a crack an' a gurgle, an' I've no' had a quiet breakfast since." } },
      choices = {
        { text = "What does he eat?", next = "murky2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murky2 = {
      lines = { { id = "m2_default", text = "Fish, an' anythin' he thinks might be fish, which has included my bootlaces. The anglers at the pool here throw him their small ones, an' he does a wee dance for them, so everybody's content." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cavern = {
      lines = { { id = "c_default", text = "It's the only water in Ironforge, an' he pines without it. That, an' the folk in the upper wards made faces, whereas down here a dwarf can keep a murloc an' still be the most respectable person in the cavern." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kill = {
      lines = { { id = "k_default", text = "Aye, the grown ones are a menace, I'll no' deny it. But this one's never known a tide pool nor a spear, only a dwarf an' a warm hearth, an' I like tae think it matters how a creature's raised." } },
      choices = { { text = "Maybe it does. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept beasts since I was a lad wi' a pocket full o' cave crickets. Murky's the crown o' the collection." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, an' Murky's only got the one word, so he's nae help either." } },
  },
}

-- Rotgath Stonebeard: apprentice blacksmith at the Great Forge; father of the smith Groum Stonebeard.
P:NPC {
  key = "if_rotgath", id = TODO_NPC("Rotgath Stonebeard"), name = "Rotgath Stonebeard", title = "Apprentice Blacksmith", gender = "male",
  bible = "bibles/missed_b.md", role = "blacksmith", tier = "service",
  communities = { "ironforge" }, temper = { "good-natured", "stubborn" }, values = { "family", "craft" },
  notices = { "craft" },
  impression = {
    first = "Rotgath Stonebeard is an apprentice blacksmith with a grey beard, working a small anvil at the Great Forge with enormous care. He is plainly the oldest apprentice on the ring, and just as plainly doesn't mind who knows it.",
    third = "{name} met Rotgath Stonebeard, a grey-bearded apprentice blacksmith at the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "Hello, friend! Mind the sparks, for I've no' quite got the knack o' sendin' them all the one way yet." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Come an' look, I've made a nail that's nearly straight." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Don't look too close at my work, {g:lad|lass}, or at least don't tell my son what ye see." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Rotgath Stonebeard, apprentice blacksmith, an' aye, ye heard me right. My son Groum is a proper smith on this very ring, an' I'm learnin' the trade thirty years after he did, which he finds funnier than I do." },
      },
      again = {
        { id = "h_again", text = "What else? The iron needs tae heat anyway." },
        { id = "h_again2", text = "Go on, I'm glad o' the rest." },
      },
      choices = {
        { text = "Why take up the hammer so late?", next = "late" },
        { text = "What does Groum make of his father the apprentice?", next = "groum" },
        { text = "Good luck with the nails.", next = "END" },
      },
    },
    late = {
      lines = { { id = "l_default", text = "I was a miner all my life, an' I dug the ore that other dwarves made intae fine things. When my back said nae more tunnels, I thought I'd like tae see what happens tae the stuff after it leaves the cart." } },
      choices = {
        { text = "And how is it going?", next = "late2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    late2 = {
      lines = { { id = "l2_default", text = "Slowly, an' wi' a good many burnt fingers. Bengus Deepforge says I've a miner's arm, which means I hit everythin' as if it were a rock face, but he's no' sent me home yet, so I keep comin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    groum = {
      lines = { { id = "g_default", text = "He's embarrassed an' proud by turns, the way I was when he was the one makin' crooked nails. He checks my work when he thinks I'm no' lookin', an' I let him, for a father can learn from his son if he's the sense tae keep quiet about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Forty years in the Gol'Bolar seams an' elsewhere, an' one year at the anvil. I know which was easier on the knees." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask my son Groum; he's the clever one in the family." } },
  },
}
