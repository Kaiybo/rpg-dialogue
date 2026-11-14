local P = RPGDialogueAPI:Pack("test.main")

P:Town {
  id = "northshire", name = "Northshire", subzones = { "Northshire Abbey", "Northshire Valley" },
  related = { goldshire = 0.25 },
}
P:Town { id = "goldshire", name = "Goldshire", subzones = { "Goldshire" } }

P:Pool {
  id = "guard_northshire", role = "guard", community = "northshire",
  greetings = { { id = "g1", text = "Move along." } },
  lines = { { id = "l1", text = "Abbey's that way." } },
  choices = { { text = "Thanks.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Ask the Marshal." } } },
}

P:Pool {
  id = "child_any", role = "child",
  notice = { { id = "n_cat", cat = "form", when = { form = "cat" }, text = "A kitty! Can I pet you?" } },
  react = { { id = "r_cat", on = "form", when = { form = "cat" }, text = "You turned into a cat!" } },
  lines = { { id = "l1", text = "Wanna play?" } },
}

P:Generic {
  id = "any",
  greetings = { { id = "g1", text = "Hm?" } },
  lines = { { id = "l1", text = "Yes?" } },
  choices = { { text = "Never mind.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Couldn't say." } } },
}
