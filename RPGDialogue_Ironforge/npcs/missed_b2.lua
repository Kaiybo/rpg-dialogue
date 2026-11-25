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
      lines = { { id = "groum_default", text = "He's embarrassed an' proud by turns, the way I was when he was the one makin' crooked nails. He checks my work when he thinks I'm no' lookin', an' I let him, for a father can learn from his son if he's the sense tae keep quiet about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Forty years in the Gol'Bolar seams an' elsewhere, an' one year at the anvil. I know which was easier on the knees." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask my son Groum; he's the clever one in the family." } },
  },
}
