-- The Argent Guards of Light's Hope: every race, one enemy.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")

P:Pool {
  id = "guard_lightshope", role = "guard", community = "light_hope",
  barks = {
    { id = "b_bells", text = "When the chapel bell rings at night, it isn't for prayer. Get inside." },
    { id = "b_mixed", text = "Orc on my left, dwarf on my right. A year ago I'd have laughed. Nobody's laughing out here." },
  },
  greetings = {
    { id = "g_chapel", text = "Light's Hope. Whatever banner you fly, leave it at the gate. Here there's only the Dawn and the dead." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You'll get stares. Ignore them. The Dawn takes anyone who fights the Scourge, and you've more cause than most." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The plague-things got their claws in your gear. Get it mended. And wash. Everything out there carries the plague." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Steady! A beast, at the gate, walking calm. Druid, then. Don't do that out here. We shoot first." } },
  lines = {
    { id = "l_default", text = "The Scourge holds most of this land. Not this chapel. Not while we stand." },
  },
  choices = { { text = "Stand fast.", next = "END", fx = { standing = { light_hope = 1 } } } },
  topics = {
    argent_dawn = { { id = "t_dawn", text = "Humans, dwarves, orcs, tauren, even Forsaken. One cause. The only one that matters out here." } },
    scarlet_crusade = { { id = "t_scarlet", text = "They fight the dead too. They'd also burn half of us here for what we are. Keep your distance." } },
    _none = { { id = "t_none", text = "Ask inside the chapel. I watch the road." } },
  },
}
