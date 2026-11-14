-- Night elf origins. DRAFT for the user's approval (brief M5). Every list ends with "other".
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "nightelf", race = "NightElf",
  origins = {
    { id = "nightelf_sentinel_scout", name = "Sentinel scout",
      blurb = "I watched the borders of Ashenvale. Now I watch everyone else's.",
      nudge = { trait = { cautious = 1 }, align = { order = 1 } } },
    { id = "nightelf_hyjal_survivor", name = "Survivor of the battle at Hyjal",
      blurb = "I was at Hyjal when the World Tree gave up its gifts to stop Archimonde. I age now, like everyone. Every year feels borrowed.",
      nudge = { trait = { brave = 1 } } },
    { id = "nightelf_druid_initiate", name = "Initiate of the Cenarion Circle", class = "DRUID",
      blurb = "I woke into a world the Circle had slept through. I'm still learning which parts of it are mine.",
      nudge = { align = { order = -2 } } },
    { id = "nightelf_priestess", name = "Novice of the Temple of the Moon", class = "PRIEST",
      blurb = "Elune's light found me young. Her silence I'm still learning to read.",
      nudge = { trait = { pious = 1 }, align = { light = 1 } } },
    { id = "other", name = "Other" },
  },
}
