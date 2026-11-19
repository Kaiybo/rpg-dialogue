-- Claims from the kaldorei factions of Darkshore and Ashenvale: who says it, and whether it's true.
-- Speakers: raene (RPGDialogue_Ashenvale/npcs/astranaar.lua), xaiander (RPGDialogue_Ashenvale/npcs/unsung.lua).
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Claim {
  id = "stormwind_sends_nothing", by = "raene", truth = "partly", tell = "true",
  text = "Stormwind asks the kaldorei to bleed for the Alliance and sends nothing to Ashenvale.",
  truthNote = "Stormwind sends no army to Ashenvale in Classic, but Delgren's paladins hold Maestra's Post and outlanders keep Astranaar supplied. Raene is sincere and grieving, and she leaves out that it is Tyrande's restraint, not Stormwind's absence, that keeps the Sentinels from open war.",
  exposedBy = { "haljan.hp_default", "shindrell.re3_default" },
}

P:Claim {
  id = "humans_brought_orcs", by = "xaiander", truth = "partly", tell = "true",
  text = "The humans caged the orcs, let them loose, and sent them to Kalimdor.",
  truthNote = "The Burning Legion brought the orcs to Azeroth through the Dark Portal (canon). Lordaeron did hold them in internment camps, and Thrall's breakout led the Horde west to Kalimdor, so Xai'ander's grievance has a true core, though no human sent them.",
  open = true,
}
