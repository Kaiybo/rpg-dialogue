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
    { id = "g_watch", text = "Welcome to Lakeshire, friend. Keep your weapon handy; we do." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's the late watch, so mind yourself. If you hear drums, run toward the town hall, not away from it." },
    { id = "g_liked", when = { townStanding = { town = "lakeshire", min = 30 } }, text = "Good to have you in town, truly. It's been a hard season, and you've made it a little easier." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The magistrate's heard about you, and so have I." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Been up the valley, have you? You look like the valley won, so get yourself to the smithy by the inn." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "Daniels found something to pour after all, then, lucky you. Just don't fall in the lake on your way home." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's there? We've had enough sneaking orcs this month, so show yourself." } },
  lines = {
    { id = "l_default", text = "Orcs in the east, gnolls in the hills, murlocs in the lake. And they wonder why we don't sleep." },
    { id = "l_marris", when = { questDone = TODO_QUEST("Missing In Action") }, text = "You're the one who brought Keeshan back, aren't you? Drinks are on the watch tonight. Well, water is, anyway, since Daniels has run dry." },
    { id = "l_tharil", when = { questDone = TODO_QUEST("Tharil'zun") }, text = "I heard Tharil'zun's done for, and I heard it was you that did it. I heard it three times before breakfast, as it happens." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { lakeshire = 1 } } } },
  topics = {
    blackrock = { { id = "t_blackrock", text = "That'd be Render's Valley. Don't go alone and don't go at night, and if you can help it, don't go at all." } },
    everstill_bridge = { { id = "t_bridge", text = "Ask Oslow about it. On second thought, don't bother asking; he'll tell you anyway." } },
    _none = { { id = "t_none", text = "That's above my post, I'm afraid. Ask the Marshal; he's down by the bridge, glaring at it." } },
  },
}
