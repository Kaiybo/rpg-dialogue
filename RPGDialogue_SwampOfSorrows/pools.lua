-- Stonard's grunts: orcs holding one of the oldest Horde footholds on Azeroth, in a swamp no map agrees about.
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")

P:Pool {
  id = "guard_stonard", role = "guard", community = "stonard",
  barks = {
    { id = "yguardstonard6", text = "The trolls at the sunken temple were chanting again last night. The shaman sat up till dawn." },
    { id = "yguardstonard7", text = "Somebody's stolen my boots. Again. In a swamp. Who steals boots in a swamp?" },
    { id = "b_maps", text = "The cartographers came back with another map, and it disagrees with the last one." },
    { id = "b_old", text = "My grandfather's father camped on this ground, before the walls. Or so they tell me." },
    { id = "b_xfrogs", text = "Frog stew again tonight. The hunters swear it's crocolisk, but I know a frog leg when I chew one." },
    { id = "b_xtemple", text = "The water by the sunken temple was green again this morning. The shaman didn't like that one bit." },
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
    { id = "yguardstonard3", text = "My father hid in this swamp through the camp years, and he taught me to sleep with one eye open. Out here, that's not a joke." },
    { id = "yguardstonard4", when = { race = "Troll" }, text = "Darkspear, are you? Keep clear of the temple trolls. They're no kin of yours, whatever they say." },
    { id = "yguardstonard5", when = { class = "SHAMAN" }, text = "The shaman's been looking for help with the water. If you hear the spirits, go and find him." },
    { id = "l_default", text = "We hold Stonard and we chart the swamp, though half of it isn't on any map and the other half's wrong." },
    { id = "l_xnether", text = "Nethergarde's humans sit south of us by the old Portal, and we watch them as they watch us. Nobody's in a hurry to start anything." },
    { id = "l_xruag", text = "Commander Ruag runs Stonard from the great hall, and he's always short of grunts for the swamp. If you've a strong arm, go see him." },
  },
  choices = {
    { text = "Stonard should strike Nethergarde before they strike us.", next = "END", reply = "Some say so. The warchief says hold.", fx = { align = { order = -1 } } },
    { text = "Lok'tar.", next = "END", fx = { standing = { stonard = 1 } } },
    { text = "Stonard should march on Nethergarde.", next = "END", reply = "Maybe one day. For now, the warchief says hold, so we hold.", fx = { align = { order = -1 } } },
    { text = "Holding the line is the right call.", next = "END", reply = "Aye. A wall that stands is worth ten raids that fail.", fx = { align = { order = 1 } } },
  },
  topics = {
    ruag = { { id = "yguardstonard1", text = "Commander Ruag. He's always short of grunts." } },
    broken = { { id = "yguardstonard2", text = "The Broken at the Harborage. They keep to themselves." } },
    nethergarde = { { id = "t_xnethergarde", text = "A human keep by the Dark Portal. They have mages and walls, and we have the swamp." } },
    sunken_temple = { { id = "t_xtemple", text = "Trolls praying to something under the water. The shaman says stay away, and I listen to the shaman." } },
    _none = { { id = "t_none", text = "Ask Commander Ruag, in the great hall. He likes questions he can send someone to answer." } },
  },
}
