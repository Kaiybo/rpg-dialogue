-- Elwynn inn talk: local news, word from nearby, reactions to the player's own deeds.
-- Hearsay: some of it is wrong, and much of it is a claim.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "elwynn_inns", roles = { "innkeeper" }, zones = { "Elwynn Forest" },
  lines = {
    { id = "westfall_road", text = "A wagon from Westfall came in with half its load and none of its driver's good humor. Defias on the road again.",
      fx = { learn = { "defias" } } },
    { id = "hogger_hill", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "The gnolls out past Westbrook have a new boldness. Folk say it's because the big one leads them now." },
    { id = "jasperlode", when = { questBefore = TODO_QUEST("The Jasperlode Mine") },
      text = "Miners won't go near Jasperlode anymore. Kobolds, they say. Kobolds and worse noises further down." },
    { id = "river_body", when = { questDone = TODO_QUEST("Find the Lost Guards") },
      text = "They found one of Guard Thomas's men by the river. What was left of him. Remy's been unbearable since." },
    { id = "vineyard_cleared", when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 7 } },
      text = "Word from the Abbey: some new recruit cleared the vineyard of red bandanas. Milly's sending wine in thanks. Might be you, by the look of your boots." },
    { id = "collector", when = { questDone = TODO_QUEST("Manhunt") },
      text = "The Marshal's men brought someone in from out by the pumpkin patch. Nobody will say who. That's how you know it was someone." },
    { id = "raelen_rainer", text = "Supervisor Raelen at Eastvale's been asking every traveler if they've seen Deputy Rainer. He's in Westbrook. She's in Eastvale. Somebody should tell her." },
    { id = "haggard_badge", when = { questBefore = TODO_QUEST("Dead-Tooth Jack") },
      text = "Old Marshal Haggard lost his badge to a Defias in a borrowed uniform. Don't tell him I told you. He'll go red to the ears." },
    { id = "lovers", when = { questDone = TODO_QUEST("The Escape") },
      text = "Funny thing. Maybell Maclure's been seen smiling. A Maclure, smiling. Something's afoot by that river.",
      fx = { learn = { "maybell_tommy" } } },
    { id = "azora", when = { minLevel = 18 },
      text = "The mage in the Tower of Azora's been hiring again. Pays in thanks, mostly. Thanks and long words." },
    { id = "hero_talk", when = { townStanding = { town = "goldshire", min = 30 } },
      text = "People talk about you in here. Mostly good. The bad parts I don't repeat, being a professional." },
  },
}
