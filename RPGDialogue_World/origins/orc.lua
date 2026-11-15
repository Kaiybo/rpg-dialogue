-- Orc origins. DRAFT for the user's approval. Year 1: Thrall freed the camps, built Orgrimmar.
-- Every list ends with "other".
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "orc", race = "Orc",
  origins = {
    { id = "orc_camp_born", name = "Born in a human internment camp",
      blurb = "I was born behind a fence, to parents who'd stopped believing they would ever leave it. Thrall opened the gate, and I've been learning what it means to be an orc ever since.",
      nudge = { trait = { stern = 1 }, align = { order = -1 } }, home = "valley_of_trials" },
    { id = "orc_frostwolf", name = "Frostwolf from the Alterac valleys",
      blurb = "My clan never drank the blood and never forgot the old ways. When the Warchief called, some of us came south with wolves at our sides.",
      nudge = { trait = { pious = 1 }, align = { honor = 2 } }, home = "orgrimmar" },
    { id = "orc_warsong_kin", name = "Kin of the Warsong clan",
      blurb = "Hellscream's clan is my clan, and we don't wait for permission. The night elves' forest is full of lumber and full of arrows, and I've dodged both.",
      nudge = { trait = { brave = 1 }, align = { order = -1 } }, home = "splintertree" },
    { id = "orc_razor_hill_grunt", name = "Grunt of the Razor Hill watch", class = "WARRIOR",
      blurb = "Gar'Thok put an axe in my hands and pointed me at the coast. Kul Tiras landed soldiers on it, and I learned what the Horde is for.",
      nudge = { trait = { stern = 1 }, align = { order = 2, honor = 1 } }, home = "razor_hill" },
    { id = "orc_thrall_shaman", name = "Student of the Warchief's shamans", class = "SHAMAN",
      blurb = "Our people forgot the spirits for a generation and paid for it in blood. I'm one of the young ones learning to listen again, and the elements are still deciding whether to forgive us.",
      nudge = { trait = { pious = 1 }, align = { light = 1, order = -1 } }, home = "orgrimmar" },
    { id = "orc_cleft_initiate", name = "Initiate of the Cleft of Shadow", class = "WARLOCK",
      blurb = "The Warchief would rather the old magic stayed buried. The Cleft of Shadow keeps it alive anyway, and I went down there because power is power.",
      nudge = { trait = { curious = 1 }, align = { light = -2 } }, home = "orgrimmar" },
    { id = "orc_camp_primer", name = "Self-taught from a guard's primer", class = "MAGE",
      blurb = "A guard in the camps left a book of letters behind. I taught myself to read from it, then found worse books, and taught myself to burn things.",
      nudge = { trait = { curious = 1 }, align = { order = -1 } } },
    { id = "other", name = "Other" },
  },
}
