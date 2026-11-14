-- Unnamed people of Lakeshire: the guard on the walls and the dock.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_lakeshire", role = "guard", community = "lakeshire",
  barks = {
    { id = "b_east", text = "Smoke over Render's Valley again." },
    { id = "b_bridge", text = "Bridge'll be done by the rains. That's what they said last rains." },
    { id = "b_hero", when = { townStanding = { town = "lakeshire", min = 30 } }, text = "That's the one Marris keeps talking about." },
  },
  greetings = {
    { id = "g_watch", text = "Lakeshire. Keep your weapon handy; we do." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late watch. If you hear drums, run toward the town hall, not away from it." },
    { id = "g_liked", when = { townStanding = { town = "lakeshire", min = 30 } }, text = "Good to have you in town. Truly. It's been a hard season." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The magistrate's heard about you. So have I." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Been up the valley, have you? You look like the valley won. Smithy's by the inn." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "Daniels found something to pour, then. Lucky you. Don't fall in the lake." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's there? We've had enough sneaking orcs this month. Show yourself." } },
  lines = {
    { id = "l_default", text = "Orcs in the east, gnolls in the hills, murlocs in the lake. And they wonder why we don't sleep." },
    { id = "l_marris", when = { questDone = TODO_QUEST("Missing In Action") }, text = "You're the one who brought Keeshan back. Drinks are on the watch tonight. Well. Water's on the watch. Daniels is dry." },
    { id = "l_tharil", when = { questDone = TODO_QUEST("Tharil'zun") }, text = "Heard Tharil'zun's done. Heard it was you. Heard it three times before breakfast, actually." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { lakeshire = 1 } } } },
  topics = {
    blackrock = { { id = "t_blackrock", text = "Render's Valley. Don't go alone. Don't go at night. Don't go, if you can help it." } },
    everstill_bridge = { { id = "t_bridge", text = "Ask Oslow. Actually, don't. He'll tell you." } },
    _none = { { id = "t_none", text = "Above my post. Ask the Marshal; he's by the bridge, glaring at it." } },
  },
}
