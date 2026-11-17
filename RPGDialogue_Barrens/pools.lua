-- The Crossroads' guards: orcs on the palisade, watching the Gold Road in both directions.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_crossroads", role = "guard", community = "crossroads",
  barks = {
    { id = "b_dust", text = "There's dust on the north road. Could be riders, could be just the wind, or could be that blasted plainstrider again." },
    { id = "b_quilboar", text = "Smells like quilboar, but then everything smells like quilboar out here, including my bedroll." },
    { id = "b_hero", when = { townStanding = { town = "crossroads", min = 30 } }, text = "That one's done more for the Crossroads than half the garrison." },
  },
  greetings = {
    { id = "g_cross", text = "Lok'tar, and welcome to the Crossroads. The water's at the well, and the trouble's everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Inside the walls after dark. Centaur ride at night, and they don't stop to ask whose side you're on." },
    { id = "g_liked", when = { townStanding = { town = "crossroads", min = 30 } }, text = "Pass, friend of the Crossroads, and be welcome; that name counts for something here." },
    { id = "g_distrust", when = { townStanding = { town = "crossroads", max = -20 } }, text = "Thork knows your name, stranger, so mind yourself while you're inside these walls." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Barrens has been chewing on you. Traugh can stitch that up, though the Barrens will only open you again, and she's not gentle with the needle." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "You're a long way from your walls, outsider. Keep walking and keep your hands empty." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something in the grass! Out where I can see you, or I'll put a spear where I think you are." } },
  lines = {
    { id = "l_default", text = "Quilboar to the south, centaur to the west, harpies in the hills and the Alliance at Northwatch. The Crossroads sits in the middle and holds for the Horde, on stale bread and less sleep than you'd believe." },
    { id = "l_disrupt", when = { questDone = TODO_QUEST("The Disruption Ends") }, text = "The centaur raids have slowed. I don't trust it yet, but I'll take the sleep, and so will my feet." },
  },
  choices = { { text = "Lok'tar.", next = "END", fx = { standing = { crossroads = 1 } } } },
  topics = {
    wailing_caverns = { { id = "t_caverns", text = "Ask Tonga. All I know is the water tastes wrong near there, and the druids who went in came out strange." } },
    _none = { { id = "t_none", text = "Ask Thork. He's up on the tower, glaring at the horizon as usual, and I think the horizon's started to glare back." } },
  },
}
