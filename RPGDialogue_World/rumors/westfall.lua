-- Word about Westfall, passed on by innkeepers in Elwynn and Stormwind. Hearsay.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "westfall_word", roles = { "innkeeper" }, zones = { "Elwynn Forest", "Stormwind City", "Westfall" },
  lines = {
    { id = "militia", when = { minLevel = 9 },
      text = "There's a man out in Westfall, Stoutmantle, raising a militia out of farmers. They say he was Silver Hand once. They say a lot of things.",
      fx = { learn = { "people_militia" } } },
    { id = "watchers", when = { minLevel = 10 },
      text = "A carter swore the scarecrows in Westfall walk. Walk! I gave him water instead of ale after that." },
    { id = "furlbrows", when = { minLevel = 10 },
      text = "The Furlbrows tried to come east with everything they own. Wagon broke halfway. They're squatting in some empty house out there now." },
    { id = "lighthouse", when = { minLevel = 14 },
      text = "Sailors say the Westfall lighthouse burns some nights with nobody in it. Sailors say that about every lighthouse." },
    { id = "deadmines_you", when = { deed = "dungeon:The Deadmines" },
      text = "Word from the west is somebody went down under Moonbrook and came back with stories. Was that you? You've the look of someone who's been underground." },
    { id = "killing_fields", when = { questRecent = { TODO_QUEST("The Killing Fields"), days = 7 } },
      text = "Saldean's field is clear, they say. Somebody chopped the walking scarecrows to kindling. Salma's been baking for a week to celebrate." },
  },
}
