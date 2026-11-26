-- Farholde Keep's sentries and scouts, the sick in the chapel, and the laborers on the walls.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_farholde", role = "guard", community = "farholde",
  barks = {
    { id = "b_fog", text = "Fog's coming off the river, so keep your eyes sharp. Cultists like to move under it." },
    { id = "b_ditch", text = "Somebody ought to fill in that ditch by the gate, but the Commander wants it left open." },
  },
  greetings = {
    { id = "g_default", text = "This is Farholde Keep, and it's Brotherhood ground." },
    { id = "g_hero", when = { townStanding = { town = "farholde", min = 55 } }, text = "Ride easy. The Commander speaks well of you, and he doesn't speak well of anyone." },
    { id = "g_liked", when = { townStanding = { town = "farholde", min = 20, max = 54 } }, text = "Back from the glades? Good; fewer come back than go out." },
    { id = "g_distrust", when = { townStanding = { town = "farholde", max = -20 } }, text = "We're watching you, all of us." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin at the gate! Some of the old riders will want to shake your hand, so let them." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's in a sorry state. Alphonse is at the forge, and he'll mend it if you ask him." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Out from behind that barrel, you. Nobody creeps around this keep but us." } },
  lines = {
    { id = "l_default", text = "Mind the ditches outside the gate. The Commander had them dug after the cult burned the village of Sunnyglade, and nobody's dared fill them since." },
    { id = "l_hero", when = { townStanding = { town = "farholde", min = 30 } },
      text = "The Commander says you can be trusted. Sentries don't say that out loud, but we're thinking it." },
    { id = "l_distrust", when = { townStanding = { town = "farholde", max = -20 } },
      text = "Talk to the Commander if you must, and then go." },
    { id = "l_memorials", when = { metBefore = true },
      text = "Seen the memorial stones for our dead? Read Roderick's; he wrote it himself, and he'd want somebody to laugh at it." },
  },
  choices = {
    { text = "Anything to report?", next = "END", fx = { standing = { farholde = 1 } } },
    { text = "Carry on.", next = "END" },
  },
  topics = {
    brotherhood_horse = { { id = "t_brotherhood", text = "We hold the keep and the riders hold the field, and the Commander holds us all together." } },
    siege_of_farholde = { { id = "t_siege", text = "My captain was on these walls for it, and he doesn't talk about it. Read the memorials." } },
    twilights_hammer = { { id = "t_hammer", text = "Cultists, chanting at night up past the river. You get used to it, though you shouldn't." } },
    _none = { { id = "t_none", text = "That's not a sentry's business, though it might be the Commander's. Ask him." } },
  },
}

P:Pool {
  id = "sick_farholde", role = "soldier", community = "farholde",
  barks = {
    { id = "yb0", text = "Sister, is there more water? My throat's on fire again." },
    { id = "yb1", text = "Someone please open a window. It smells like a sickroom in here, which I suppose it is." },
  },
  greetings = {
    { id = "yg0", when = { class = "PALADIN" }, text = "A paladin? Light bless you for coming. Will you say a word over the men in the far cots? They're worse off than me." },
    { id = "g_default", text = "Water, please, if you've any." },
    { id = "g_close", text = "Don't come too close. I wouldn't wish this fever on a cultist." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } },
      text = "You're a healer? Sit with me a while. Sister Rowland's got all of us, and only two hands." },
  },
  lines = {
    { id = "yl0", text = "I caught this fever on patrol by the river, the same week the cultists were seen on the ridge. Sister Rowland says it's only bad water, but I've wondered if they poisoned it." },
    { id = "yl1", text = "My squad went out last week without me, and two of them came back. I keep thinking that if I'd been there, maybe it'd be three." },
    { id = "yl2", text = "The Brotherhood pays our families while we're laid up, which is more than Stormwind ever did. I'll fight for them till I drop, once I can stand up." },
    { id = "yl3", when = { race = "Dwarf" }, text = "A dwarf! My grandfather swore by dwarven ale for any fever. Sister won't let me have any, but you could sneak me some, maybe?" },
    { id = "l_x1", text = "The man in the next cot snores like a saw going through oak. I'd ask to be moved, but I can't stand up yet." },
    { id = "l_x2", text = "My wife's in Lakeshire, I think. Tell her I'm mending, if you pass that way, and don't tell her how I look." },
    { id = "l_x3", when = { class = "PRIEST" }, text = "A priest! Say something holy over me, please. It can't hurt, and the Sister's voice is getting hoarse." },

    { id = "l_default", text = "Sister Rowland says the fever will pass, though she says that to everyone. I believe her anyway." },
    { id = "l_bored", text = "Thirty days on this cot, and the bedbugs know me by name. I've counted the beams: forty-one, or forty-two if you count the cracked one." },
    { id = "l_story", when = { metBefore = true }, text = "You're back! Tell me something from outside, anything at all; lie, if you have to." },
  },
  choices = {
    { text = "Rest and trust the Sister. She knows best.", next = "END", reply = "You're right. She's never steered us wrong yet. I'll stay in this cot.", fx = { align = { light = 1 } } },
    { text = "Get up as soon as you can. Your squad needs you.", next = "END", reply = "I want to, believe me. I'll try walking to the door tomorrow.", fx = { align = { light = -1 } } },
    { text = "Rest. I'll fetch you water.", next = "END", fx = { trait = { kind = 1 }, standing = { farholde = 1 } } },
    { text = "Get well.", next = "END" },
  },
  topics = {
    brotherhood_horse = { { id = "tp_ybrotherhood_horse", text = "The Brotherhood. They took me in when Stormwind wouldn't, and I'll fight for them." } },
    twilights_hammer = { { id = "tp_ytwilights_hammer", text = "Cultists on the ridge. I swear they poisoned the river." } },
    rowland = { { id = "t_xrowland", text = "Sister Rowland. She hasn't slept since the fever came, and she still smiles at every one of us." } },

    _none = { { id = "t_none", text = "I don't know much of anything lately. Ask Sister." } },
  },
}

P:Pool {
  id = "worker_farholde", role = "worker", community = "farholde",
  barks = {
    { id = "yb0", text = "Bertrand! The mortar's set wrong again, and you said you'd check it!" },
    { id = "yb1", text = "Hold that stone level. No, level. That's not level, that's sideways." },
  },
  greetings = {
    { id = "yg0", when = { race = "Human" }, text = "Another human face! You're a long way from Stormwind. Grab a trowel if you're staying." },
    { id = "g_default", text = "Mind the mortar." } },
  lines = {
    { id = "yl0", text = "I had a farm on the other side of the river, before the Twilight burned it. Now I build walls for the Brotherhood and hope they stand longer than my barn did." },
    { id = "yl1", text = "Bertrand says we'll have the north wall finished by the next full moon. If the cultists don't come back and knock it down first, that is." },
    { id = "yl2", text = "My son wants to join the Brotherhood as a rider. I want him to stay and lay stone with me, where it's safe. He's sixteen, and he doesn't listen." },
    { id = "yl3", when = { class = "PALADIN" }, text = "A paladin! Would you bless this wall for us? Bertrand says it's superstition, but I've seen the Light do stranger things." },
    { id = "l_x1", text = "We're rebuilding what the Twilight burned. Every stone I set, I think of the fellow who set it the first time." },
    { id = "l_x2", text = "Lunch is bread and onions again, and Bertrand calls that a feast. I'd like to see his idea of a famine." },
    { id = "l_x3", when = { class = "WARRIOR" }, text = "You've got the shoulders for this work, friend. If you ever tire of fighting, Bertrand's always hiring." },

    { id = "l_default", text = "Bertrand, our master mason, wants this wall done by dusk. He wanted the last one done by dusk too, and that one fell on him." },
    { id = "l_dwarf", when = { race = "Dwarf" }, text = "You're a dwarf, so tell Bertrand these stones are laid straight. He won't believe me, but he'll believe one of his own." },
  },
  choices = {
    { text = "Keep your son with you. Stone is safer than steel.", next = "END", reply = "That's what I tell him. He'll hate me for it, but he'll be alive to hate me.", fx = { align = { order = 1 } } },
    { text = "Let him ride. He has to choose his own path.", next = "END", reply = "Maybe you're right. My father wanted me to farm, and here I am laying stone.", fx = { align = { order = -1 } } },
    { text = "Back to work, then.", next = "END" } },
  topics = {
    farholde = { { id = "tp_yfarholde", text = "Our keep on the island. We're rebuilding it stone by stone." } },
    farm = { { id = "tp_yfarm", text = "I had a farm, once, across the river. The Twilight burned it." } },
    bertrand = { { id = "t_xbertrand", text = "Our master mason. He shouts a lot, but he's never once left a wall crooked." } },
 _none = { { id = "t_none", text = "I lay stone, friend. Ask somebody who does the talking." } } },
}

-- 1.10.0: the Horde side. Rog'mar and Bolder'ok aren't in RPGDialogue_World's town list, so their
-- town definitions live here, with the pools that need them (community pools match by town).
P:Town {
  id = "rogmar", name = "Rog'mar",
  subzones = { "Rog'mar" },
  related = { bolderok = 0.05 },
  tiers = { Hero = "Blood of Rog'mar" },
  quests = { { TODO_QUEST("Eye of Mugg"), 8 }, { TODO_QUEST("Key Ingredients"), 2 }, { TODO_QUEST("Poison Tips"), 2 }, { TODO_QUEST("Fetch 'n' Fletch"), 2 } },
}

P:Town {
  id = "bolderok", name = "Bolder'ok",
  subzones = { "Bolder'ok" },
  related = { rogmar = 0.05 },
  tiers = { Hero = "Friend of Bolder'ok" },
  quests = { { TODO_QUEST("Jom-Jom's Escape"), 6 } },
}

P:Pool {
  id = "guard_rogmar", role = "guard", community = "rogmar",
  barks = {
    { id = "b_chant", text = "Chanting on the ridge again. Let them sing; we'll see how loud they are with an axe in them." },
    { id = "b_fog", text = "This river fog gets into everything, even the meat, and the meat was bad to begin with." },
  },
  greetings = {
    { id = "g_default", text = "This is Rog'mar, and it's Horde ground, so walk like you belong here." },
    { id = "g_hero", when = { townStanding = { town = "rogmar", min = 55 } }, text = "Lok'tar! Krom'rosh says you've bled for us, and that's good enough for me." },
    { id = "g_distrust", when = { townStanding = { town = "rogmar", max = -20 } }, text = "Keep moving, outsider. Every grunt in Rog'mar knows your face by now." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. The Twilight's ogres hate orcs most of all, so they'll come for you first. Make them regret it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken, this far east? Stay where the grunts can see you, because the cultists raise their own dead and the grunts might take you for one." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The ogres got a piece of you, I see. Kreza the smith is at the forge, so go before the rest of you falls off." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Show yourself! Only cultists sneak around Rog'mar, and we kill cultists." } },
  lines = {
    { id = "l_default", text = "Krol'dok is up in the northwest mountains, full of ogres and the Twilight cultists who command them. We hold the glades between them and the Warchief's lands." },
    { id = "l_bolderok", text = "The Bolder'ok ogres turned on the cult and came to us. They smell, but they hit hard, and they hate the Hammer more than we do." },
    { id = "l_farholde", text = "The humans on the island remember the old Horde and spit when they see us. Let them; we're not the ones who burned their farms." },
    { id = "l_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") },
      text = "You're the one who brought Krom'rosh that eye. The grunts have been telling it at the fires all week, and it gets bloodier every time." },
    { id = "l_hero", when = { townStanding = { town = "rogmar", min = 30 } },
      text = "Krom'rosh trusts you, and he trusts nobody. Don't make him wrong." },
  },
  choices = {
    { text = "Anything to report?", next = "END", fx = { standing = { rogmar = 1 } } },
    { text = "Stay sharp.", next = "END" },
  },
  topics = {
    krol_dok = { { id = "t_kroldok", text = "Caves in the northwest. Our scouts go in, and most don't come back out." } },
    twilights_hammer = { { id = "t_hammer", text = "Cultists in robes, and ogres who do what they're told. They take prisoners for their altars, so don't get taken." } },
    brotherhood_horse = { { id = "t_brotherhood", text = "Humans on horses, holed up on an island to the southeast. They kill cultists too, so we leave them be, mostly." } },
    _none = { { id = "t_none", text = "That's not my business. Ask Krom'rosh; he runs Rog'mar and decides what's worth knowing." } },
  },
}

P:Pool {
  id = "guard_bolderok", role = "guard", community = "bolderok",
  barks = {
    { id = "yb0", text = "Bolder'ok sees a boat! No, it is a log. Bolder'ok will throw a rock at it anyway." },
    { id = "yb1", text = "Clugfist says watch the river. Bolder'ok watches. The river does nothing. Bolder'ok is bored." },
    { id = "b_hungry", text = "Clugfist says guard, so Bolder'ok guards, but guarding makes ogre hungry, and Bolder'ok already ate the guard dog." },
  },
  greetings = {
    { id = "yg0", when = { race = "Troll" }, text = "Troll! Trolls are friends with orcs, and orcs are friends with Bolder'ok, so trolls are friends too. Bolder'ok worked that out by himself." },
    { id = "g_default", text = "Little one is at Bolder'ok. Bolder'ok is Horde, so be friend." },
    { id = "g_friend", when = { townStanding = { town = "bolderok", min = 30 } }, text = "Little one is friend! You can pass." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Orc! Orcs are good friends to Bolder'ok, so you come in and sit by the fire." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big little one! You almost as big as an ogre, so Bolder'ok likes you already." },
  },
  lines = {
    { id = "yl0", text = "Bolder'ok remembers when the Twilight first came to the mountains. They had nice robes and nice words, and then they wanted ogres to bleed on rocks. Bolder'ok did not want to bleed on rocks." },
    { id = "yl1", text = "The orc chief Krom'rosh gave Bolder'ok an axe. It is a good axe, but Bolder'ok likes rocks better, because rocks do not need sharpening." },
    { id = "yl2", when = { class = "WARRIOR" }, text = "Little one carries a big weapon! Bolder'ok likes that. When the Twilight come, stand next to Bolder'ok, and we will hit them together." },
    { id = "l_x1", text = "Bolder'ok watches the river. When the Twilight come in boats, Bolder'ok throws rocks. Rocks sink boats very good." },
    { id = "l_x2", when = { faction = "Alliance" }, text = "You are not Horde, little one, but you did not hit Bolder'ok yet, so Bolder'ok will not hit you yet." },

    { id = "l_default", text = "Twilight say ogres must bleed on their altar stones, and Bolder'ok said no, so the Twilight threw Bolder'ok out. Now Bolder'ok watches for Twilight, and hits them." },
    { id = "l_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") },
      text = "Mugg is dead, and little ones did it! Bolder'ok sang all night, and the singing was very loud and very bad." },
    { id = "l_jomjom", when = { questDone = TODO_QUEST("Jom-Jom's Escape") },
      text = "You brought Jom-jom home. Jom-jom tells everybody, so everybody knows you." },
  },
  choices = {
    { text = "Obey Clugfist. A guard follows orders.", next = "END", reply = "Yes. Clugfist says watch, so Bolder'ok watches. That is how guarding works.", fx = { align = { order = 1 } } },
    { text = "Don't wait for orders. Attack the Twilight first.", next = "END", reply = "Bolder'ok likes this idea! But Clugfist would be angry. Bolder'ok will think about it.", fx = { align = { order = -1 } } },
    { text = "Keep watch for the Twilight.", next = "END", fx = { standing = { bolderok = 1 } } },
    { text = "Goodbye.", next = "END" },
  },
  topics = {
    clugfist = { { id = "tp_yclugfist", text = "Clugfist is boss. Clugfist is biggest. Bolder'ok does what Clugfist says, mostly." } },
    river = { { id = "tp_yriver", text = "Bolder'ok watches the river. The Twilight come in boats sometimes, and rocks sink boats." } },
    rogmar = { { id = "t_xrogmar", text = "Rog'mar is orc town. Orcs there give axes, and ogres give hitting. It is a good trade." } },

    twilights_hammer = { { id = "t_hammer", text = "Liars! They say the sky will fall, and they make ogres bleed to help it." } },
    _none = { { id = "t_none", text = "Ogre does not know that. Ask Clugfist." } },
  },
}

P:Pool {
  id = "citizen_bolderok", role = "citizen", community = "bolderok",
  barks = {
    { id = "yb0", text = "Ogre is hungry. Ogre is always hungry, but now ogre is extra hungry." },
    { id = "yb1", text = "Who took Gruk's rock? Gruk had a good rock, a round one, and now it is gone." },
  },
  greetings = {
    { id = "yg0", when = { race = "Tauren" }, text = "Big little one! You come sit by the fire, and ogre will share the meat, maybe." },
    { id = "g_default", text = "Little one! You have meat?" },
    { id = "g_fire", text = "Sit by the fire, little one, but not too close, because ogres roll over in their sleep." },
  },
  lines = {
    { id = "yl0", text = "Bolder'ok used to live in the mountains, before the Twilight came. The Twilight said the sky would fall, and Clugfist said the sky looks fine, and that was when the fighting started." },
    { id = "yl1", text = "Ogre has two heads in the family, Gnarl and Gorm. Gnarl wants to fight the Twilight, and Gorm wants to eat, and they argue all day. It is very loud." },
    { id = "yl2", when = { faction = "Alliance" }, text = "You are not Horde, little one, but you are not Twilight either. Ogre will not hit you, but ogre will watch you very carefully." },
    { id = "yl3", when = { metBefore = true }, text = "Little one came back! Ogre remembers you, because you did not hit ogre last time. That is a good friend." },
    { id = "l_x1", text = "Clugfist is the biggest, so Clugfist is boss. That is how ogres pick bosses, and it is faster than voting." },
    { id = "l_x2", text = "Little one is small, but little ones are clever. Ogre likes clever, as long as clever brings meat." },
    { id = "l_x3", when = { race = "Orc" }, text = "Orc! Orcs taught Bolder'ok to say no to the Twilight. Ogre remembers, and ogre is grateful." },

    { id = "l_default", text = "Bolder'ok is a good place. Nobody here makes speeches about the end of the world, and the meat is good." },
    { id = "l_orcs", text = "The orcs from Rog'mar bring axes and take ogres to fight the Twilight. It is a good trade, because ogres like fighting the Twilight." },
    { id = "l_humans", text = "The horse humans in the south do not like ogres. That is fair, because Twilight ogres burned their houses, but Bolder'ok ogres did not do it." },
  },
  choices = {
    { text = "Clugfist is right. Stand against the Twilight.", next = "END", reply = "Yes! Clugfist is smart for an ogre. Ogre will tell Clugfist you said so.", fx = { align = { honor = 1 } } },
    { text = "Fighting the Twilight is dangerous. Go somewhere safe.", next = "END", reply = "Safe? Ogre does not know safe. Ogre knows fire, and meat, and hitting.", fx = { align = { honor = -1 } } },
    { text = "Take care.", next = "END" } },
  topics = {
    krol_dok = { { id = "tp_ykrol_dok", text = "Bad place in the mountains. Twilight live there now. Ogre used to live there too." } },
    meat = { { id = "tp_ymeat", text = "Ogre likes meat. All kinds. Little one should bring some next time." } },
    clugfist = { { id = "t_xclug", text = "Clugfist is boss. Clugfist hits hardest and yells loudest, so everybody listens." } },
    twilights_hammer = { { id = "t_xhammer", text = "Bad people with bad robes. They want ogres to die for the sky. Ogre likes the sky where it is." } },
 _none = { { id = "t_none", text = "Ogre does not know. Ogre knows meat, and fire, and hitting." } } },
}
