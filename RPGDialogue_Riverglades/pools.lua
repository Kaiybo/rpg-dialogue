-- Farholde Keep's sentries and scouts, the sick in the chapel, and the laborers on the walls.
local P = RPGDialogueAPI:Pack("rpgd.riverglades")

P:Pool {
  id = "guard_farholde", role = "guard", community = "farholde",
  barks = {
    { id = "b_fog", text = "Fog's coming off the river, so keep your eyes sharp." },
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
  react = { { id = "r_stealth", on = "stealth", text = "Out of the shadows, you. Nobody creeps around this keep but us." } },
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
    { id = "l_bored", text = "Thirty days on this cot, and I've counted the beams: forty-one, or forty-two if you count the cracked one." },
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
    { id = "l_default", text = "Bertrand wants this wall done by dusk. Bertrand wanted the last wall done by dusk, too." },
    { id = "l_dwarf", when = { race = "Dwarf" }, text = "You're a dwarf. Tell Bertrand the stones are straight. He won't believe me, but he'll believe one of his own." },
  },
  choices = { { text = "Back to work, then.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "I lay stone, friend, so ask somebody who talks." } } },
}
