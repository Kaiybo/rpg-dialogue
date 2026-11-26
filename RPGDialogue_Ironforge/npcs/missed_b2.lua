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
        { id = "h_again_x0", when = { class = { "WARRIOR", "PALADIN" } }, text = "Back again! Show me the dents, {class}, an' I'll tell ye what they mean." },
      },
      choices = {
        { text = "Show me your plate.", next = "BUSINESS" },
        { text = "What's the test of good plate?", next = "test" },
        { text = "The gnome nearby says plate is for those who can't dodge.", next = "liss" },
        { text = "Your father still comes in?", next = "father" },
        { text = "Who's Dolkin?", next = "dolkin" },
        { text = "What gorget would you recommend?", next = "gorget", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Do you make plate for gnomes?", next = "BACK", when = { race = "Gnome" }, reply = "I've made a few pieces, an' they were the hardest work I've ever done. Everything's half the size an' twice as fiddly." },
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
    father = {
      lines = { { id = "xfather_default", text = "Every week, an' he stands in the doorway like he still owns it, which he does, in his heart. He says we're too soft wi' the hammer an' too quick wi' the sale." } },
      choices = {
        { text = "Is he right?", next = "right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    right = {
      lines = { { id = "xright_default", text = "About the hammer, maybe, for he tested every piece three times an' we test it twice. About the sale, no, for there's more customers now than in his day, an' they cannae all wait a fortnight." } },
      choices = {
        { text = "Should you keep his old methods?", next = "methods" },
        { text = "Something else.", next = "BACK" },
      },
    },
    methods = {
      narr = "He glances toward the back of the shop, where hammering has stopped.",
      lines = { { id = "xmethods_default", text = "Dolkin wants tae try a gnomish press for the rivets, an' my father would rather die than see it in his shop. I'm caught in between, as always. What would ye do?" } },
      choices = {
        { text = "Keep your father's ways. They've served for generations.", next = "BACK", reply = "Aye, they have, an' my father would shake yer hand. Dolkin would sulk for a week.", fx = { align = { order = 1 } } },
        { text = "Try the new press. Old ways can still improve.", next = "BACK", reply = "Dolkin would buy ye a drink for that. My father would have ye thrown out, mind.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    dolkin = {
      lines = { { id = "xdolkin_default", text = "My brother, an' he does the chain an' the hittin', for he's got the bigger arm. He's a good smith an' a better test, an' he's never once said a breastplate was sound when it wasnae." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gorget = {
      lines = { { id = "xgorget_default", text = "A thick one, wi' a lip at the top, so a blade that slides off the breastplate doesnae find yer throat. Most folk skimp on the gorget, an' most folk die o' the thing they skimped on." } },
      choices = { { text = "I'll look for a thick one.", next = "BACK", reply = "Ye'll find one on my rack, {class}. An' if ye dinnae, Dolkin will make ye one." } },
    },
  },
  topics = {
    hall_of_arms = { { id = "tp_xhall_of_arms", text = "The trainers in the Hall of Arms send their recruits tae us. We send them back in plate." } },
    military_ward = { { id = "tp_xmilitary_ward", text = "The Military Ward is where the soldiers buy their kit. We've been here longer than most." } },
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
        { id = "h_again_x0", when = { class = "ROGUE" }, text = "You again. I heard you on the second step this time. You're getting better." },
      },
      choices = {
        { text = "You handle that knife well.", next = "knife" },
        { text = "What does a gnome want with so many blades?", next = "blades" },
        { text = "Could you teach me to throw like that?", next = "teach", when = { class = { "ROGUE", "WARRIOR", "HUNTER" } } },
        { text = "What did you do in Gnomeregan?", next = "past" },
        { text = "What's Stoneblade's like?", next = "shop" },
        { text = "Who runs the rogues in this city?", next = "rogues", when = { class = "ROGUE" } },
        { text = "Did we ever cross paths in Gnomeregan?", next = "BACK", when = { race = "Gnome" }, reply = "If we had, you'd remember, and I wouldn't. That's how I liked it then, and how I like it now." },
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
    past = {
      lines = { { id = "xpast_default", text = "I've already told you that's nobody's business. But since you're still standing there, I'll say I was good with locks, and the people who paid me weren't always the ones who owned them." } },
      choices = {
        { text = "You won't say more?", next = "pressed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pressed = {
      narr = "The knife stops turning for a moment, then starts again.",
      lines = { { id = "xpressed_default", text = "I'll say I never took anything from someone who couldn't spare it, and I never took anything from a friend. That's more of a code than most people in this city keep." } },
      choices = {
        { text = "So you only robbed thieves?", next = "thieves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thieves = {
      lines = { { id = "xthieves_default", text = "Mostly. Merchants who cheated their workers, engineers who stole other people's designs. Some say robbing a crook is still robbing, and some say it's fair game. What do you say?" } },
      choices = {
        { text = "Stealing is stealing, whoever the mark.", next = "BACK", reply = "That's a very clean way to see the world. I hope it stays that clean for you.", fx = { align = { honor = 1 } } },
        { text = "A crook who's robbed got what he deserved.", next = "BACK", reply = "Now you're talking sense. Don't say it too loudly in Ironforge, though.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    shop = {
      lines = { { id = "xshop_default", text = "Good blades, honest prices and a shopkeeper who doesn't ask questions. It's quiet, and the light's bad, which suits me better than the Commons does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogues = {
      lines = { { id = "xrogues_default", text = "The trainers in the Forlorn Cavern, and you'll find them if you're meant to. Hulfdan and the others don't advertise, and neither should you." } },
      choices = { { text = "I'll look for them.", next = "BACK", reply = "Don't look too hard. They'll find you first." } },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_xforlorn_cavern", text = "The Forlorn Cavern is where the quiet folk gather. Nobody asks your name, which is the point." } },
    gnomeregan = { { id = "tp_xgnomeregan", text = "I left Gnomeregan the same way everyone did, in a hurry. I didn't leave much behind." } },
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
        { id = "h_again_x0", when = { class = "HUNTER" }, text = "Back again, {class}? Has yer beast asked after Murky?" },
      },
      choices = {
        { text = "How does a dwarf come by a murloc?", next = "murky" },
        { text = "Why keep him down here?", next = "cavern" },
        { text = "Murlocs have tried to kill me. Often.", next = "kill" },
        { text = "Where did Murky's egg come from?", next = "egg" },
        { text = "What other beasts do you keep?", next = "others" },
        { text = "My pet would like to meet Murky.", next = "pet", when = { class = "HUNTER" } },
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
    egg = {
      lines = { { id = "xegg_default", text = "A traveller off the tram had it in a basket, an' he said he'd found it on a beach an' couldnae be bothered tae carry it further. I paid him a silver for it, which he thought was a great joke." } },
      choices = {
        { text = "Will Murky grow huge?", next = "grow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      narr = "Murky gurgles at his feet, and he reaches down to pat its head.",
      lines = { { id = "xgrow_default", text = "I dinnae ken, an' neither does anyone else. He's grown a hand's width since I got him, an' if he keeps on, I'll need a bigger pool an' a stronger door." } },
      choices = {
        { text = "Should wild things be kept as pets at all?", next = "wild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild = {
      lines = { { id = "xwild_default", text = "Some folk at the pool say I should let him go back tae the sea where he belongs, an' others say he's better off wi' me than wi' a spear in his gut. What do ye think?" } },
      choices = {
        { text = "A kind keeper is better than a cruel sea.", next = "BACK", reply = "Aye, that's my view, an' Murky agrees, I'm sure. He's never known anythin' else.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Wild things belong in the wild. Let him go.", next = "BACK", reply = "Maybe ye're right, but he'd no' last a day out there. He doesnae know what a shark is.", fx = { align = { light = -1 } } },
      },
    },
    others = {
      lines = { { id = "xothers_default", text = "A pair o' cave crickets, a lizard that sleeps by the Forge an' a snail I've named after a senator. None o' them are as clever as Murky, but they're all good company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "xpet_default", text = "Oh, aye, bring it here! Murky likes a new friend, so long as it doesnae try tae eat him. He gets nervous round cats, I've noticed." } },
      choices = { { text = "I'll keep my pet calm.", next = "BACK", reply = "Good. They'll get on fine, I'm sure. Murky, say hello!" } },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_xforlorn_cavern", text = "The Forlorn Cavern has the only water in the city. Murky likes it, an' the folk down here dinnae mind him." } },
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
        { id = "h_again_x0", when = { profession = "Blacksmithing" }, text = "Back again? Come an' look at this nail, an' tell me honestly if it's straight." },
      },
      choices = {
        { text = "Why take up the hammer so late?", next = "late" },
        { text = "What does Groum make of his father the apprentice?", next = "groum" },
        { text = "Tell me about the Gol'Bolar seams.", next = "seams" },
        { text = "What does Bengus Deepforge think of you?", next = "bengus" },
        { text = "Hold the tongs closer to the jaw.", next = "BACK", when = { profession = "Blacksmithing" }, reply = "Like this? Aye, that's better, the iron's no' slippin'. Thank ye, an' dinnae tell Groum ye had tae show me.", fx = { affinity = 1 } },
        { text = "What's the best seam you ever worked?", next = "best", when = { profession = "Mining" } },
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
    seams = {
      lines = { { id = "xseams_default", text = "Copper an' tin, mostly, an' a bit o' silver if ye followed the right vein. I worked them for forty years, till my knees gave out an' the troggs came up." } },
      choices = {
        { text = "The troggs were there in your day?", next = "troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      narr = "He sets the hammer down and flexes his fingers.",
      lines = { { id = "xtroggs_default", text = "No' when I started, but they came at the end. We broke intae a cave one mornin' an' they came out o' it like water from a burst pipe. I've never run so fast in my life." } },
      choices = {
        { text = "Should Ironforge retake the quarry?", next = "retake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    retake = {
      lines = { { id = "xretake_default", text = "The miners say aye, an' they want tae do it themselves wi' picks an' shovels. The Senate says wait for the soldiers, an' the soldiers say they're busy. What do ye say?" } },
      choices = {
        { text = "Wait for the soldiers. Miners shouldn't fight troggs.", next = "BACK", reply = "Aye, an' I've seen what troggs do tae miners. Wait, an' let them come wi' rifles.", fx = { align = { order = 1 } } },
        { text = "Let the miners take it back themselves.", next = "BACK", reply = "Ha! Ye'd have them at the quarry tomorrow, if they had their way. I'd go wi' them, if my knees let me.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    bengus = {
      lines = { { id = "xbengus_default", text = "He says I've a miner's arm, which means I hit everythin' as if it were rock. He's no' wrong, but he's patient wi' me, which is more than I deserve at my age." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "xbest_default", text = "A vein o' tin so pure it shone like silver, out by the Gol'Bolar's eastern face. We worked it for a season an' it fed half the Great Forge, an' then the troggs came." } },
      choices = { { text = "A fine seam lost.", next = "BACK", reply = "Aye. Some day, maybe, a dwarf will work it again." } },
    },
  },
  topics = {
    troggs = { { id = "tp_xtroggs", text = "They came up through Gol'Bolar at the end o' my minin' days. I've no' forgiven them for it." } },
    great_forge = { { id = "tp_xgreat_forge", text = "I'm learnin' at the Great Forge now, an' it's harder than any mine I worked." } },
    background = { { id = "tp_bg", text = "Forty years in the Gol'Bolar seams an' elsewhere, an' one year at the anvil. I know which was easier on the knees." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask my son Groum; he's the clever one in the family." } },
  },
}
