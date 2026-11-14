-- Dwarf origins. DRAFT for the user's approval (brief M5). Every list ends with "other".
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "dwarf", race = "Dwarf",
  origins = {
    { id = "dwarf_ironforge_miner", name = "Miner's child from the Ironforge deeps",
      blurb = "I grew up with stone over my head and the forge's heat in my bones. The surface still feels too big.",
      nudge = { trait = { stern = 1 } } },
    { id = "dwarf_explorers_league", name = "Apprentice of the Explorers' League",
      blurb = "Brann's stories got me into the League. The League's dust got me out into the world.",
      nudge = { trait = { curious = 1 } } },
    { id = "dwarf_mountaineer", name = "Mountaineer of Dun Morogh",
      blurb = "I kept the high passes clear of trolls and troggs. Cold work, honest work.",
      nudge = { trait = { brave = 1 }, align = { order = 1 } } },
    { id = "dwarf_brewer", name = "Brewer's youngest",
      blurb = "My family brews. I was meant to as well. I wanted to see where the barrels go.",
      nudge = { trait = { witty = 1 } } },
    { id = "other", name = "Other" },
  },
}
