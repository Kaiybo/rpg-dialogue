-- Forsaken origins. DRAFT for the user's approval. Year 1: Sylvanas freed them from the Lich
-- King; the Undercity is beneath Lordaeron's ruins. Who they were in life still marks them.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "forsaken", race = "Scourge",
  origins = {
    { id = "forsaken_lordaeron_soldier", name = "Once a soldier of Lordaeron",
      blurb = "I wore Terenas's colors when the plague came, and I died holding a gate that didn't matter. Now I serve the Dark Lady, and I've stopped asking which of them deserved it more.",
      nudge = { trait = { stern = 1 }, align = { order = 1 } }, home = "undercity" },
    { id = "forsaken_brill_farmer", name = "Once a farmer near Brill",
      blurb = "I grew barley outside Brill and ate the plagued grain like everyone else. The field's still there; I walk past it sometimes and feel nothing, and that frightens me more than anything.",
      nudge = { trait = { cautious = 1 } }, home = "brill" },
    { id = "forsaken_scourge_remembered", name = "Remembers serving the Scourge",
      blurb = "I remember everything I did while the Lich King held me, every village and every face. The Dark Lady says it wasn't me, and I'd like very much to believe her.",
      nudge = { trait = { stern = 1 }, align = { light = -1 } } },
    { id = "forsaken_dalaran_apprentice", name = "Once an apprentice of Dalaran", class = "MAGE",
      blurb = "I studied in the violet city before Archimonde flattened it, and my notes rotted in the rubble with the rest of me. The spells came back when I did, which is more than I can say for my manners.",
      nudge = { trait = { curious = 1 } }, home = "undercity" },
    { id = "forsaken_chapel_priest", name = "Once a priest of Lordaeron's chapels", class = "PRIEST",
      blurb = "I gave sermons on the Light to farmers who are now ghouls. The Light still answers me, though it hurts, and I've decided to treat the pain as a kind of conversation.",
      nudge = { trait = { pious = 1 }, align = { light = 1 } } },
    { id = "forsaken_risen_knight", name = "A Silver Hand knight, risen", class = "PALADIN",
      blurb = "I took the oath in Uther's day and died in Lordaeron when the oath meant nothing. I still say the words, and the Light still comes, and neither of us understands why.",
      nudge = { trait = { pious = 1 }, align = { light = 2, honor = 1 } } },
    { id = "forsaken_deathstalker_recruit", name = "Deathstalker recruit", class = "ROGUE",
      blurb = "The Dark Lady's deathstalkers go where the living can't and the dead shouldn't. They took me because I'd been dead long enough to stop being afraid of it.",
      nudge = { trait = { cautious = 1 }, align = { honor = -1, order = 1 } }, home = "undercity" },
    { id = "forsaken_cult_remnant", name = "Cult of the Damned, before death", class = "WARLOCK",
      blurb = "I joined the Cult of the Damned while I was alive, and I knew what they were. The Forsaken let me in anyway, because they need what I know, and they never let me forget why I know it.",
      nudge = { trait = { cruel = 1 }, align = { light = -2 } } },
    { id = "other", name = "Other" },
  },
}
