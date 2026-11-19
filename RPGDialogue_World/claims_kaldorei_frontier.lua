-- Kaldorei grievances on the frontier (Feralas, Felwood): what some night elves say about the Alliance.
-- NPC claims; see claims.lua for the format.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Claim {
  id = "humans_brought_the_war", by = "golhine", truth = "partly",
  text = "The humans' wars brought the orcs and the Legion's servants to Kalimdor.",
  truthNote = "Canon: the orcs and Jaina's humans both sailed west after Medivh's warning, and the Scourge and the Legion came for the World Tree. The humans didn't summon any of it, and the Highborne first drew the Legion ten thousand years ago. Golhine admits this when pressed.",
  exposedBy = { "golhine.bh_default" },
  tell = "true",
}

P:Claim {
  id = "alliance_takes_sentinels", by = "latronicus", truth = "disputed",
  text = "The Alliance borrows Darnassus's Sentinels and sends nothing back to Feathermoon.",
  truthNote = "No Stormwind force fights at Feathermoon in Classic, and Darnassus sends few reinforcements (Feathermoon Stronghold quest). Vestia argues that Stormwind has no ships to spare while it fights the Defias and the Blackrock. Never settled.",
  open = true,
  tell = "true",
}
