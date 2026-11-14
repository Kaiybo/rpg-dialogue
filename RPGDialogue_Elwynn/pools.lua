-- Unnamed NPCs of Northshire and Goldshire. A guard's first job is noticing trouble,
-- and their opinion of you is the town's opinion of you.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_northshire", role = "guard", community = "northshire",
  barks = {
    { id = "b_road", text = "Mind the road, recruit. Wolves don't." },
    { id = "b_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "There goes the one who sorted the vineyard out." },
  },
  greetings = {
    { id = "g_move", text = "Keep moving, recruit." },
    { id = "g_abbey", text = "Abbey's straight ahead. Marshal's inside." },
    { id = "g_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "The Marshal's been talking about you. Good things, for once." },
    { id = "g_distrust", when = { townStanding = { town = "northshire", max = -20 } }, text = "I've got my eye on you." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true }, text = "Did the Defias take your clothes too, or did you start that way?" },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself! Slowly." },
  },
  lines = {
    { id = "l_default", text = "Kobolds north, thieves east, wolves everywhere. Northshire, recruit." },
    { id = "l_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "You've done the valley some good. The lads on watch noticed." },
  },
  choices = { { text = "I'll be on my way.", next = "END" } },
  topics = {
    defias = { { id = "t_defias", text = "Red bandanas in the vineyard. Deputy Willem's got a tally." } },
    _none = { { id = "t_none", text = "Ask the Marshal. I just stand here." } },
  },
}

P:Pool {
  id = "guard_goldshire", role = "guard", community = "goldshire",
  barks = {
    { id = "b_quiet", text = "Quiet night. Let's keep it that way." },
    { id = "b_hogger", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") }, text = "That's the one. Hogger's claw, they say." },
    { id = "b_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "Watch that one." },
  },
  greetings = {
    { id = "g_peace", text = "Goldshire's peaceful. Keep it that way." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Inn's that way. Fights are outside it. Not here." },
    { id = "g_hogger", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") }, text = "That's the one who brought in Hogger's claw." },
    { id = "g_hero", when = { townStanding = { town = "goldshire", min = 55 } }, text = "Didn't think I'd ever salute someone who smells that much of gnoll." },
    { id = "g_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "Hands where I can see them." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } }, text = "Go sleep it off at the Lion's Pride. Farley won't mind. I will." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Oi! None of that in town." },
  },
  lines = {
    { id = "l_default", text = "Marshal Dughan's out by the inn if you're looking for work." },
    { id = "l_liked", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Folk at the inn talk about you. Mostly kind. Mostly." },
    { id = "l_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "You've been making trouble. The Marshal knows your name, and not fondly." },
  },
  choices = { { text = "Just passing through.", next = "END" } },
  topics = {
    defias = { { id = "t_defias", text = "Westfall's problem. Until they come over the bridge, anyway." } },
    hogger = { { id = "t_hogger", text = "Big. Angry. Southwest. Don't go alone." } },
    _none = { { id = "t_none", text = "Not my post to say." } },
  },
}
