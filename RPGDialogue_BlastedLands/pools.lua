-- Nethergarde's soldiers, officers and elites: Stormwind humans and Ironforge dwarves holding the keep over the Dark Portal. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")

P:Pool {
  id = "guard_nethergarde", role = "guard", community = "nethergarde",
  barks = {
    { id = "b_ogres", text = "Dreadmaul were at the south wall again before dawn. Same time as last week, near enough to set the watch by." },
    { id = "b_cold", text = "Baked all day and frozen all night; whoever named this place the Blasted Lands was being kind." },
    { id = "b_mages", text = "The mages have been up in the tower all night again, muttering at their crystals. I don't ask any more." },
  },
  greetings = {
    { id = "g_default", text = "Welcome to Nethergarde. Keep to the road, keep your weapons sheathed inside the walls, and don't touch anything the mages left lying about." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Cold night, and quiet so far, apart from the corporal's snoring, which the imps can probably hear from the Portal. Let's keep it that way, shall we?" },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Another dwarf on the walls, good; it evens the odds against the mages for the last of the ale." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out in the wastes, by the look of that armor. Strumner's forge is inside, and he's the only one who'll mend it this side of Darkshire." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! The clerics could use you in the barracks; the last ogre raid left more wounded than they've got hands for." },
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Undead" } },
      text = "Horde, inside Nethergarde. Mind yourself, keep your hands where we can see them, and remember there's a truce out here because the demons don't care which side you're on." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's moving by the gate, and in this place that's usually bad news. Show yourself." } },
  lines = {
    { id = "l_default", fx = { learn = { "nethergarde" } },
      text = "Nethergarde Keep watches the Dark Portal, and we watch the ogres and demons who'd like to get at the keep. It's a grim post, the water tastes of sulphur, and it'll be grimmer still if the caravans stop coming." },
    { id = "l_night", when = { timeOfDay = "night" }, text = "On nights like this you can see the demons' fires down in the Scar from the wall. I count them, and I try not to." },
    { id = "l_horde", when = { faction = "Horde" },
      text = "We don't love the Horde here, but we love the Legion less. Do your business and be on your way, and we'll get along." },
  },
  choices = { { text = "Stay safe on the walls.", next = "END", fx = { standing = { nethergarde = 1 } } } },
  topics = {
    dark_portal = { { id = "t_portal", text = "Dead as stone and twice as ugly. We watch it anyway; that's the job." } },
    dreadmaul = { { id = "t_dreadmaul", text = "Ogres, big ones, who come at the walls like clockwork. We send them home with fresh bruises, and they come back with the same bad breath." } },
    _none = { { id = "t_none", text = "Couldn't tell you. Ask the Quartermaster, upstairs in the northwest building; he knows everything that comes in." } },
  },
}
