-- Hillsbrad Foothills: what Southshore's innkeeper passes on. (Hillsbrad pack 1.2.0)
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "hillsbrad_inns", roles = { "innkeeper" }, zones = { "Hillsbrad Foothills" },
  lines = {
    { id = "horses", text = "Another horse went missing from the stables last night. Lions, thieves or the dead, take your pick; they're all hungry up here." },
    { id = "farms", when = { questRecent = { TODO_QUEST("Battle of Hillsbrad"), days = 7 } },
      text = "There's smoke over Hillsbrad Fields again, and the farmers who got out say the dead came in broad daylight this time." },
    { id = "vardus", when = { questRecent = { TODO_QUEST("Baron's Demise"), days = 7 } },
      text = "They say Baron Vardus is dead, and the Magistrate has left his shutters open two nights running." },
    { id = "farren", when = { faction = "Alliance" },
      text = "The lieutenant's written to Stormwind again. The gulls take more interest in his letters than the Keep ever has." },
  },
}
