-- Menethil's guards: humans and dwarves on a harbour wall, watching the hills and the water.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_menethil", role = "guard", community = "menethil",
  barks = {
    { id = "b_rain", text = "Rain again. It's always rain again." },
    { id = "b_hills", text = "There were fires in the hills last night, orc fires." },
    { id = "b_hero", when = { townStanding = { town = "menethil", min = 30 } }, text = "That's the one the Captain sent after Nek'rosh." },
  },
  greetings = {
    { id = "g_harbor", text = "Welcome to Menethil Harbor. Keep to the boards, for the mud takes boots." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's dark already. If you hear wings, get under a roof and don't stop to look." },
    { id = "g_liked", when = { townStanding = { town = "menethil", min = 30 } }, text = "Back in the harbour, are you? Glad of it; we've talked about you, kindly, mostly." },
    { id = "g_distrust", when = { townStanding = { town = "menethil", max = -20 } }, text = "The Captain knows your name, and that's not a compliment." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the marsh, or under it. Brahnmar can mend that, and Helbrek can mend the rest." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "Back from the spirit healer? The marsh does that to people, and so does the bay, so stay on the boards." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's on the docks! Show yourself or take a swim!" } },
  lines = {
    { id = "l_default", text = "Orcs in the hills, murlocs in the reeds, raptors on the ridge. And the only road home goes past all three." },
    { id = "l_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "Nek'rosh is dead, and I slept a whole night through, the first time since I was posted here." },
  },
  choices = { { text = "Stay dry.", next = "END", fx = { standing = { menethil = 1 } } } },
  topics = {
    dragonmaw = { { id = "t_dragonmaw", text = "They're in the hills and on the old dwarf roads, and they've got catapults now, catapults, like it's the Second War all over again." } },
    _none = { { id = "t_none", text = "Ask the Captain; he's up on the keep wall, glaring at the hills." } },
  },
}
