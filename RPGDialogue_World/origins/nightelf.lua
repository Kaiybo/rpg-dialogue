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
    { id = "nightelf_auberdine_watch", name = "Watcher on the Auberdine coast", class = "WARRIOR",
      blurb = "I stood watch on Darkshore's beaches while the sea brought in murlocs and worse. When the Sentinels needed blades further south, I went.",
      nudge = { trait = { stern = 1 }, align = { order = 1 } }, home = "auberdine" },
    { id = "nightelf_nightsaber_rider", name = "Nightsaber rider of Teldrassil", class = "HUNTER",
      blurb = "My first companion was a nightsaber cub I found near Dolanaar. Every hunter in my family has run with the cats, and I'll not be the one to stop.",
      nudge = { trait = { cautious = 1 }, align = { order = -1 } }, home = "dolanaar" },
    { id = "nightelf_watcher_trained", name = "Trained by the Watchers", class = "ROGUE",
      blurb = "The Watchers taught me to go unseen and to keep what I saw to myself. Some of my people call it dishonorable; the Watchers call it necessary.",
      nudge = { trait = { cautious = 1 }, align = { honor = -1, order = 1 } } },
    { id = "other", name = "Other" },
  },
}
