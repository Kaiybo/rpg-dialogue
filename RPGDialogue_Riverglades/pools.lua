-- Farholde Keep's sentries and scouts, the sick in the chapel, and the laborers on the walls.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_farholde", role = "guard", community = "farholde",
  barks = {
    { id = "b_fog", text = "Fog's coming off the river, so keep your eyes sharp, and somebody find out who keeps emptying his pot in the moat." },
    { id = "b_ditch", text = "Someone ought to fill that ditch... no, best not, the Commander wants it." },
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
      text = "Cultists, was it? Alphonse is by the forge. Tell him a sentry sent you; he won't care, but tell him." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Out from behind that barrel, you. Nobody creeps around this keep but us." } },
  lines = {
    { id = "l_default", text = "Mind the ditches outside the gate. The Commander had them dug after Sunnyglade burned, and nobody's dared fill them since." },
    { id = "l_hero", when = { townStanding = { town = "farholde", min = 30 } },
      text = "The Commander says you can be trusted. Sentries don't say that out loud, but we're thinking it." },
    { id = "l_distrust", when = { townStanding = { town = "farholde", max = -20 } },
      text = "Talk to the Commander if you must, and then go." },
    { id = "l_memorials", when = { metBefore = true },
      text = "Seen the memorials? Read Roderick's; he'd want somebody to laugh at it." },
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
  greetings = {
    { id = "g_default", text = "Water, please, if you've any." },
    { id = "g_close", text = "Don't come too close. I wouldn't give this to a cultist." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } },
      text = "You're a healer? Sit with me a while. Sister Rowland's got all of us, and only two hands." },
  },
  lines = {
    { id = "l_default", text = "Sister says it'll pass, though she says that to everyone. I believe her anyway." },
    { id = "l_bored", text = "Thirty days on this cot, and the bedbugs know me by name. I've counted the beams: forty-one, or forty-two if you count the cracked one." },
    { id = "l_story", when = { metBefore = true }, text = "You're back! Tell me something from outside, anything at all; lie, if you have to." },
  },
  choices = {
    { text = "Rest. I'll fetch you water.", next = "END", fx = { trait = { kind = 1 }, standing = { farholde = 1 } } },
    { text = "Get well.", next = "END" },
  },
  topics = {
    _none = { { id = "t_none", text = "I don't know much of anything lately. Ask Sister." } },
  },
}

P:Pool {
  id = "worker_farholde", role = "worker", community = "farholde",
  greetings = { { id = "g_default", text = "Mind the mortar." } },
  lines = {
    { id = "l_default", text = "Bertrand wants this wall done by dusk. Bertrand wanted the last wall done by dusk, too, and that one fell on him." },
    { id = "l_dwarf", when = { race = "Dwarf" }, text = "You're a dwarf. Tell Bertrand the stones are straight. He won't believe me, but he'll believe one of his own." },
  },
  choices = { { text = "Back to work, then.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "I lay stone, friend, so ask somebody who talks." } } },
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
    { id = "b_fog", text = "This river fog gets into everything, even the meat, and the meat was bad already." },
  },
  greetings = {
    { id = "g_default", text = "This is Rog'mar, and it's Horde ground, so walk like you belong here." },
    { id = "g_hero", when = { townStanding = { town = "rogmar", min = 55 } }, text = "Lok'tar! Krom'rosh says you've bled for us, and that's good enough for me." },
    { id = "g_distrust", when = { townStanding = { town = "rogmar", max = -20 } }, text = "Keep moving. We're watching you." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. The ogres in Krol'dok remember the old Horde, so they'll come for you first; make them regret it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken, this far east? Stay where the grunts can see you; the cultists dress their dead up too." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The ogres got a piece of you, I see. Kreza's at the forge, so go before the rest of you falls off." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Show yourself! Only cultists sneak around Rog'mar, and we kill cultists." } },
  lines = {
    { id = "l_default", text = "Krol'dok is up in the northwest mountains, full of ogres and the cultists who own them. We hold the glades between them and the Warchief's lands." },
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
    _none = { { id = "t_none", text = "Not my business. Ask Krom'rosh, and don't mention the latrine pit; he's still angry about it." } },
  },
}

P:Pool {
  id = "guard_bolderok", role = "guard", community = "bolderok",
  barks = {
    { id = "b_hungry", text = "Clugfist says guard, so Bolder'ok guards, but guarding makes ogre hungry, and Bolder'ok already ate the guard dog." },
  },
  greetings = {
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
    { id = "l_default", text = "Twilight say ogres must bleed on the stones, and Bolder'ok said no, so the Twilight throw Bolder'ok out. Now Bolder'ok watches for Twilight, and hits them." },
    { id = "l_mugg", when = { questDone = TODO_QUEST("Eye of Mugg") },
      text = "Mugg is dead, and little ones did it! Bolder'ok sang all night, and the singing was very loud and very bad." },
    { id = "l_jomjom", when = { questDone = TODO_QUEST("Jom-Jom's Escape") },
      text = "You brought Jom-jom home. Jom-jom tells everybody, so everybody knows you." },
  },
  choices = {
    { text = "Keep watch for the Twilight.", next = "END", fx = { standing = { bolderok = 1 } } },
    { text = "Goodbye.", next = "END" },
  },
  topics = {
    twilights_hammer = { { id = "t_hammer", text = "Liars! They say the sky will fall, and they make ogres bleed to help it." } },
    _none = { { id = "t_none", text = "Ogre does not know that. Ask Clugfist." } },
  },
}

P:Pool {
  id = "citizen_bolderok", role = "citizen", community = "bolderok",
  greetings = {
    { id = "g_default", text = "Little one! You have meat?" },
    { id = "g_fire", text = "Sit by the fire, little one, but not too close, because ogres roll over in their sleep." },
  },
  lines = {
    { id = "l_default", text = "Bolder'ok is a good place. Nobody here makes speeches about the end of the world, and the meat is good." },
    { id = "l_orcs", text = "The orcs from Rog'mar bring axes and take ogres to fight the Twilight. It is a good trade, because ogres like fighting the Twilight." },
    { id = "l_humans", text = "The horse humans in the south do not like ogres. That is fair, because Twilight ogres burned their houses, but Bolder'ok did not do it, or not most of us." },
  },
  choices = { { text = "Take care.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Ogre does not know. Ogre knows meat, and fire, and hitting." } } },
}
