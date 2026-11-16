-- Tauren origins. DRAFT for the user's approval. Year 1: Cairne led the tauren to Mulgore with
-- the orcs' help; Thunder Bluff is new; the Grimtotem resent both.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Origin {
  id = "tauren", race = "Tauren",
  origins = {
    { id = "tauren_long_migration", name = "Born on the long walk to Mulgore",
      blurb = "I was a calf when the centaur drove us across the Barrens, and I remember the orcs who fought beside us. Mulgore was the first place I ever slept twice.",
      nudge = { trait = { generous = 1 }, align = { honor = 1 } }, home = "bloodhoof" },
    { id = "tauren_narache_hunter", name = "Child of a Narache hunter",
      blurb = "My mother tracked plainstriders through Red Cloud Mesa before I could walk. She taught me to thank the Earth Mother for every one we took.",
      nudge = { trait = { pious = 1 } }, home = "narache" },
    { id = "tauren_grimtotem_born", name = "Grimtotem by birth, Bloodhoof by choice",
      blurb = "My kin think the orcs and the humans are a plague on the land, and Cairne a fool for sheltering one of them. I left. They haven't forgiven me, and they don't forgive.",
      nudge = { trait = { brave = 1 }, align = { order = 1 } }, home = "thunder_bluff" },
    { id = "tauren_hamuul_pupil", name = "Pupil of Hamuul Runetotem", class = "DRUID",
      blurb = "Hamuul learned the old ways from the night elves' own Archdruid, and our people have not had druids in a very long time. I'm one of the first he chose to teach.",
      nudge = { trait = { curious = 1 }, align = { order = -1 } }, home = "thunder_bluff" },
    { id = "tauren_spirit_rise", name = "Seer's apprentice from the Spirit Rise", class = "SHAMAN",
      blurb = "I carried water and incense for the seers on the Spirit Rise until one of them told me the elements had started speaking to me. I hadn't noticed; I was carrying water.",
      nudge = { trait = { pious = 1 } }, home = "thunder_bluff" },
    { id = "tauren_plains_runner", name = "Plains runner of the Barrens", class = "HUNTER",
      blurb = "I ran messages between Camp Taurajo and the Crossroads with a cat at my heels. You learn the Barrens fast when everything in it is hungry.",
      nudge = { trait = { cautious = 1 } }, home = "taurajo" },
    { id = "other", name = "Other" },
  },
}
