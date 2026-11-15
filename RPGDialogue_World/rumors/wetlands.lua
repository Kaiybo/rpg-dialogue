-- Deepwater Tavern talk, and word of the Wetlands in the inns to the south. Hearsay.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "wetlands_inns", roles = { "innkeeper" }, zones = { "Wetlands" },
  lines = {
    { id = "statuette", when = { questRecent = { TODO_QUEST("Return the Statuette"), days = 7 } },
      text = "The Blind Princess got her statuette back, the old king with his hammer raised, and the Captain wants it sent to Stormwind before the orcs hear of it." },
    { id = "catapults", when = { questBefore = TODO_QUEST("Defeat Nek'rosh") },
      text = "The orcs in the hills are building siege engines, the lads say, proper ones. Somebody up there remembers the Second War fondly." },
    { id = "nekrosh", when = { questRecent = { TODO_QUEST("Defeat Nek'rosh"), days = 7 } },
      text = "Someone walked into the keep with Nek'rosh's head in a sack, and the Captain bought the whole tavern a round. Water, but still." },
    { id = "wrecks", text = "Lights out on the wrecks in the bay some nights. Fitz says it's his old crew, still on watch. Nobody argues with Fitz about the bay." },
    { id = "dunmodr", text = "No word out of Dun Modr since the Dark Irons took it, not a letter, not a rider. The dwarves don't talk about it over drinks." },
    { id = "raptors", text = "Raptors on the ridge again, big ones. Hunters go up for the hides and come down short a hunter." },
  },
}

P:Rumors {
  id = "wetlands_word", roles = { "innkeeper" }, zones = { "Ironforge", "Dun Morogh", "Stormwind City", "Redridge Mountains" },
  lines = {
    { id = "menethil", when = { minLevel = 20 },
      text = "The road north from Ironforge goes down into the Wetlands, and the Wetlands have orcs on the road again. Menethil's holding, barely, and wetly." },
    { id = "fitz", when = { minLevel = 20 },
      text = "There's a sailor in Menethil who'll tell you about the night the dragons burned the Kul Tiran fleet. He'll tell you twice if you buy the second round." },
  },
}
