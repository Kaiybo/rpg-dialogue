-- Bloodvenom Post's tauren braves, on the cliffs above the poisoned river.
local P = RPGDialogueAPI:Pack("rpgd.felwood")

P:Pool {
  id = "guard_bloodvenom", role = "guard", community = "bloodvenom_post",
  barks = {
    { id = "b_river", text = "Don't drink from the river, don't wash in it, and don't look at it too long. The Earth Mother has turned her face from that water." },
    { id = "b_laugh", text = "The Forsaken alchemist is laughing again. Earth Mother, give me patience." },
  },
  greetings = {
    { id = "g_post", text = "This is Bloodvenom Post, the only Horde fire in Felwood, so keep close to it, and upwind of the latrine trench if you can manage both." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A long way from Mulgore's grass, cousin. Here even the grass would bite you." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest chewed on you, so get mended, and wash your hands before you eat, because everything here is tainted." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Careful in that shape, because the corrupted beasts here look a lot like you, and we shoot first." } },
  lines = {
    { id = "l_default", text = "Demons poisoned this forest in the war, and the poison stayed when they left. So do we, for now." },
  },
  choices = { { text = "Stay safe.", next = "END", fx = { standing = { bloodvenom_post = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The druids at the sanctuary think they can heal this place. I hope they're right. I'd hate to be standing here for nothing." } },
    _none = { { id = "t_none", text = "Ask Trull; he's the one who sends people into the trees." } },
  },
}
