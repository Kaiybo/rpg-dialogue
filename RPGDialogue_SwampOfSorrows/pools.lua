-- Stonard's grunts: orcs holding one of the oldest Horde footholds on Azeroth, in a swamp no map agrees about.
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")

P:Pool {
  id = "guard_stonard", role = "guard", community = "stonard",
  barks = {
    { id = "b_maps", text = "The cartographers came back with another map. It disagrees with the last one." },
    { id = "b_old", text = "My grandfather's father camped on this ground, before the walls. Or so they tell me." },
  },
  greetings = {
    { id = "g_stonard", text = "Stonard. Orcs held this ground before the humans knew our name. Mind the mud." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Swamp's loud at night. Most of it's frogs. Not all of it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The swamp's had a go at you. The smith's by the wall. Don't drip on him." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. You're standing where the old Horde first planted its banners on this world. Remember it was us who came back." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something moving in the reeds by the gate. Show yourself or take an axe." } },
  lines = {
    { id = "l_default", text = "We hold Stonard and we chart the swamp. Half of it isn't on any map. The other half's wrong." },
  },
  choices = { { text = "Lok'tar.", next = "END", fx = { standing = { stonard = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask the Commander, in the big hall. He likes questions he can send someone to answer." } },
  },
}
