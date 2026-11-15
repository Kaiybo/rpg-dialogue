-- Scarlet Raven talk, and word of Duskwood elsewhere. Hearsay.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "duskwood_inns", roles = { "innkeeper" }, zones = { "Duskwood" },
  lines = {
    { id = "lights", text = "Lights up at Manor Mistmantle again, and nobody's lived there in years. Nobody living, anyway." },
    { id = "thread", when = { questBefore = TODO_QUEST("Note to the Mayor") },
      text = "The hermit at Raven Hill's been buying thread by the bolt. Thread! What does a hermit stitch?" },
    { id = "stitches", when = { questRecent = { TODO_QUEST("Translation to Ello"), days = 7 } },
      text = "A great stitched thing came walking down the road and someone put it down before it reached the square. The mayor's still shaking, and so am I." },
    { id = "yorgen", text = "Sven Yorgen still camps by the water; he won't come into town and he won't go home, and I can't blame him." },
    { id = "letters", text = "Lord Ello's written to Stormwind again, the fifth time this season. The rider took the long way back, and I can't blame him either." },
    { id = "nightwatch_you", when = { questDone = TODO_QUEST("The Night Watch") },
      text = "The Watch says the cemetery's quieter since you went through it, and they're drinking to you, quietly." },
  },
}

P:Rumors {
  id = "duskwood_word", roles = { "innkeeper" }, zones = { "Elwynn Forest", "Redridge Mountains", "Westfall", "Stormwind City" },
  lines = {
    { id = "darkshire", when = { minLevel = 18 },
      text = "South of the forest it's dark all day, they say. Darkshire's got a Night Watch made of bakers and farmers. Stormwind pulled the soldiers out years ago." },
    { id = "moonshine", when = { minLevel = 18 },
      text = "Darkshire moonshine's strong enough to strip paint. Smitts at the Scarlet Raven swears it's the only thing that keeps the fog out." },
  },
}
