-- Books the addon knows. Reading one may teach a topic; NPCs react rarely (bookRead).
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Book { id = "seven_kingdoms", title = "The Seven Kingdoms", topics = { "seven_kingdoms" } }

-- The Riverglades (Forever). The book is on a bench in Farholde Keep (missing as of 1.60.1.70450,
-- per the wiki). The memorials are readable; their in-game titles are assumed to be the names.
P:Book { id = "wartorn_land", title = "A Wartorn Land and The Brotherhood", topics = { "siege_of_farholde", "brotherhood_horse", "sunnyglade" } }
P:Book { id = "memorial_isolde", title = "Lady Isolde Brightlance", topics = { "siege_of_farholde" } }
P:Book { id = "memorial_howard", title = "Sir Howard Armstrong", topics = { "siege_of_farholde" } }
P:Book { id = "memorial_roderick", title = "Roderick the Unbroken", topics = { "siege_of_farholde" } }
P:Book { id = "memorial_rosalind", title = "Rosalind Ashwood", topics = { "siege_of_farholde" } }
P:Book { id = "memorial_fern", title = "Fern Crimsonleaf", topics = { "fern_crimsonleaf" } }
P:Book { id = "memorial_brienne", title = "Brienne Stormhart", topics = { "siege_of_farholde" } }
P:Book { id = "memorial_alden", title = "Alden Amberhall", topics = { "siege_of_farholde" } }
