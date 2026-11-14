-- Menethil's guards: humans and dwarves on a harbour wall, watching the hills and the water.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_menethil", role = "guard", community = "menethil",
  barks = {
    { id = "b_rain", text = "Rain again. It's always rain again." },
    { id = "b_hills", text = "Fires in the hills last night. Orc fires." },
    { id = "b_hero", when = { townStanding = { town = "menethil", min = 30 } }, text = "That's the one the Captain sent after Nek'rosh." },
  },
  greetings = {
    { id = "g_harbor", text = "Menethil Harbor. Keep to the boards; the mud takes boots." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Dark already. If you hear wings, get under a roof. Don't stop to look." },
    { id = "g_liked", when = { townStanding = { town = "menethil", min = 30 } }, text = "Back in the harbour, are you? Glad of it. We've talked about you. Kindly, mostly." },
    { id = "g_distrust", when = { townStanding = { town = "menethil", max = -20 } }, text = "The Captain knows your name. That's not a compliment." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the marsh. Or under it. Brahnmar can mend that, and Helbrek can mend the rest." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "Back from the spirit healer? The marsh does that. So does the bay. Stay on the boards." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's on the docks! Show yourself or take a swim!" } },
  lines = {
    { id = "l_default", text = "Orcs in the hills, murlocs in the reeds, raptors on the ridge. And the only road home goes past all three." },
    { id = "l_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "Nek'rosh is dead. I slept a whole night through. First time since I was posted here." },
  },
  choices = { { text = "Stay dry.", next = "END", fx = { standing = { menethil = 1 } } } },
  topics = {
    dragonmaw = { { id = "t_dragonmaw", text = "In the hills and the old dwarf roads. They've catapults now. Catapults! Like it's the Second War again." } },
    _none = { { id = "t_none", text = "Ask the Captain. He's on the keep wall, glaring at the hills." } },
  },
}
