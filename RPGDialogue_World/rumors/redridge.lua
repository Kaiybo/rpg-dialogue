-- Lakeshire inn talk, and word of Redridge in Elwynn's inns. Hearsay.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "redridge_inns", roles = { "innkeeper" }, zones = { "Redridge Mountains" },
  lines = {
    { id = "monster", text = "A fisherman swears something big rose out of the middle of the lake last week. Something with more teeth than a fisherman should see sober." },
    { id = "letters", text = "The magistrate sent another rider to Stormwind. That's the fourth. The rider came back with a polite letter and a cold." },
    { id = "bridge", when = { questBefore = TODO_QUEST("The Everstill Bridge") },
      text = "Oslow's crew lost a whole shipment to gnolls. Stone and timber, gone into the hills. What a gnoll wants with dressed stone, nobody knows." },
    { id = "keeshan", when = { questBefore = TODO_QUEST("Missing In Action") },
      text = "They say Corporal Keeshan's alive up at Render's Rock. The orcs kept him. Nobody likes to think about why." },
    { id = "keeshan_back", when = { questRecent = { TODO_QUEST("Missing In Action"), days = 7 } },
      text = "Keeshan walked back into town on his own two feet, with someone at his side. The whole watch turned out. You, was it?" },
    { id = "tower", when = { minLevel = 20 },
      text = "Lights in the tower on the south shore at night. Green ones. The gnolls go quiet when they're lit." },
    { id = "dry", when = { questBefore = TODO_QUEST("Dry Times") },
      text = "Daniels is down to the dregs. If you're passing Goldshire, he'd kiss you for a bottle of their sweet rum. Don't let him." },
  },
}

P:Rumors {
  id = "redridge_word", roles = { "innkeeper" }, zones = { "Elwynn Forest", "Stormwind City" },
  lines = {
    { id = "lakeshire", when = { minLevel = 14 },
      text = "Lakeshire's under siege, near enough. Orcs in the valley above it. The magistrate's been begging Stormwind for soldiers. Begging's not a strong word for it." },
    { id = "verner", when = { minLevel = 14 },
      text = "Argus says the smith in Lakeshire hasn't a scrap of iron left. Everything's going to the Guard. He says it like he's sorry. He isn't." },
  },
}
