-- Menethil's guards: humans and dwarves on a harbour wall, watching the hills and the water.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_menethil", role = "guard", community = "menethil",
  barks = {
    { id = "b_rain", text = "Rain again. My boots have been wet since the spring muster, and the left one's started to grow something." },
    { id = "b_hills", text = "There were orc fires in the hills last night, and I've a wager with the cook on whether they come down before supper, so I'm hoping they're punctual." },
    { id = "b_hero", when = { townStanding = { town = "menethil", min = 30 } }, text = "That's the one Captain Stoutfist sent after the orc warlord Nek'rosh." },
      { id = "ymeneth_b0", text = "There's a murloc on the sandbar again. Someone throw a rock at it." },
    { id = "ymeneth_b1", text = "The tide's coming in. Mind your boots on the low docks." },
  },
  greetings = {
    { id = "g_harbor", text = "Welcome to Menethil Harbor. Keep to the boards, for the mud takes boots." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's dark already. If you hear wings, get under a roof and don't stop to look." },
    { id = "g_liked", when = { townStanding = { town = "menethil", min = 30 } }, text = "Back in the harbour, are you? Glad of it; we've talked about you, kindly, mostly." },
    { id = "g_distrust", when = { townStanding = { town = "menethil", max = -20 } }, text = "Captain Stoutfist knows your name, and that's not a compliment." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the marsh, or under it. The smiths can mend that, and Innkeeper Helbrek can mend the rest." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "Back from the spirit healer? The marsh does that to people, and so does the bay, so stay on the boards." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's on the docks! Show yourself or take a swim!" } },
  lines = {
    { id = "l_default", text = "There are orcs in the hills, murlocs in the reeds and raptors on the ridge, and the only road home goes past all three of them." },
    { id = "l_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "The Dragonmaw warlord Nek'rosh is dead, and I slept a whole night through, the first time since I was posted here." },
      { id = "ymeneth_l0", text = "Captain Stoutfist says the Dragonmaw are planning something bigger. He always says that, and he's usually right." },
    { id = "ymeneth_l1", when = { race = "Dwarf" }, text = "A dwarf! There's a few of us on the wall, and we keep the humans from sinking into the marsh with their boots on." },
    { id = "ymeneth_l2", when = { race = "Human" }, text = "Another Stormwinder. Welcome to the edge of the world, friend, where the mud's deep and the pay's thin." },
    { id = "ymeneth_l3", when = { race = "NightElf" }, text = "The Bravery to Auberdine leaves from the far pier. Mind the gap, it's wider than it looks." },
  },
  choices = { { text = "Stay dry.", next = "END", fx = { standing = { menethil = 1 } } } , { text = "March on Grim Batol and end the Dragonmaw for good.", next = "END", reply = "That's what the captain wants, if Ironforge sends the men.", fx = { align = { order = 1 } } }, { text = "Hold the harbour. Leave the hills to the orcs.", next = "END", reply = "Easy said, until they come down from the hills with fire.", fx = { align = { order = -1 } } }, { text = "Any word from Dun Modr?", next = "END", reply = "Longbraid's dwarves still hold the edge of it. The Dark Irons hold the rest, and the Span's still broken." } },
  topics = {
    stoutfist = { { id = "ymeneth_tp_stoutfist", text = "Captain Stoutfist is a dwarf of the old sort. He glares at the hills as if they owed him money." } },
    grim_batol = { { id = "ymeneth_tp_grim_batol", text = "Grim Batol's where the Dragonmaw keep their strength. Nobody goes there and comes back the same." } },

    dragonmaw = { { id = "t_dragonmaw", text = "They're in the hills and on the old dwarf roads, and they've got catapults now, catapults, like it's the Second War all over again." } },
    _none = { { id = "t_none", text = "Ask Captain Stoutfist; he's up on the keep wall, glaring at the hills like they owe him money." } },
  },
}
