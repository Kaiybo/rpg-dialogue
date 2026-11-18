-- Stonard's grunts: orcs holding one of the oldest Horde footholds on Azeroth, in a swamp no map agrees about.
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")

P:Pool {
  id = "guard_stonard", role = "guard", community = "stonard",
  barks = {
    { id = "b_maps", text = "The cartographers came back with another map, and it disagrees with the last one." },
    { id = "b_old", text = "My grandfather's father camped on this ground, before the walls. Or so they tell me." },
  },
  greetings = {
    { id = "g_stonard", text = "Welcome to Stonard, where orcs held the ground before the humans knew our name. Mind the mud." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The swamp's loud at night, and most of it's frogs, but not all of it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The swamp's had a go at you. The smith's by the wall, but don't drip on him." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! You're standing where the old Horde first planted its banners on this world, so remember it was us who came back." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's moving in the reeds by the gate, so show yourself or take an axe." } },
  lines = {
    { id = "l_default", text = "We hold Stonard and we chart the swamp, though half of it isn't on any map and the other half's wrong." },
  },
  choices = { { text = "Lok'tar.", next = "END", fx = { standing = { stonard = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Commander Ruag, in the great hall. He likes questions he can send someone to answer." } },
  },
}
