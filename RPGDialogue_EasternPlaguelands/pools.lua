-- The Argent Guards of Light's Hope: every race, one enemy.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")

P:Pool {
  id = "guard_lightshope", role = "guard", community = "light_hope",
  barks = {
    { id = "yb_naxx", text = "The black citadel's moved again in the night, I swear it. Or the sky has. One of them's wrong." },
    { id = "yb_cauldron", text = "Wind's from the Plaguewood today. Breathe through your sleeve and don't drink the rain." },
    { id = "yb_tower", text = "Banners changed on Crown Guard Tower again. Horde this morning, Alliance by supper. The ghouls don't care whose." },
    { id = "xb_dawn", text = "Another dawn, and the chapel still stands. I give thanks for each one, out loud, in case the Light's counting." },
    { id = "b_bells", text = "When the chapel bell rings at night, it isn't for prayer. Get inside." },
    { id = "b_mixed", text = "Orc on my left, dwarf on my right; a year ago I'd have laughed. Nobody's laughing out here." },
  },
  greetings = {
    { id = "g_chapel", text = "Light's Hope. Whatever banner you fly, leave it at the gate, because here there's only the Dawn and the dead." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken? You'll get stares, so ignore them. The Dawn takes anyone who fights the Scourge, and you've more cause than most." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The plague-things got their claws in your gear, so get it mended, and wash, because everything out there carries the plague." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Steady! A beast at the gate, walking calm... a druid, then. Don't do that out here; we shoot first." } },
  lines = {
    { id = "yl_orc", when = { race = "Orc" }, text = "An orc at Light's Hope. Leave your war at the gate, friend. In here, Horde and Alliance share the same latrines and the same dead." },
    { id = "yl_dwarf", when = { race = "Dwarf" }, text = "A dwarf, good. The medics are always short of hands that don't shake. Ask for Packmaster Stonebruiser if you've strength to carry crates." },
    { id = "yl_paladin", when = { class = "PALADIN" }, text = "A paladin, on holy ground. Pray at the chapel before you head out. The Light hears better here than anywhere else in this land." },
    { id = "xl_dead", when = { race = "Scourge" }, text = "Forsaken, on hallowed ground. The Light's not burning you, so the Dawn says you're welcome, and I'll take its word." },
    { id = "xl_tyrosus", text = "Lord Maxwell Tyrosus keeps us fed, armed and hopeful, which is two more things than most commanders manage out here." },
    { id = "l_default", text = "The Scourge holds most of this land, but not this chapel. We dig the latrines deep and the graves deeper, and we're short of shovels for both." },
  },
  choices = {
    { text = "Forsaken shouldn't stand watch beside the living.", next = "END", reply = "Maybe not, in your city. Out here, I'll take any blade that points at the Scourge.", fx = { align = { light = 1 } } },
    { text = "Any blade against the Scourge is welcome, dead or alive.", next = "END", reply = "That's the Dawn's creed, and mine. Good to hear it from you.", fx = { align = { light = -1 } } },
    { text = "Has the chapel ever fallen?", next = "END", reply = "Never. The Scourge broke against these walls in the war, and they'll break again." },
    { text = "Stand fast.", next = "END", reply = "And you, out there. Don't let the dead get behind you." },
    { text = "Stand fast.", next = "END", fx = { standing = { light_hope = 1 } } } },
  topics = {
    naxxramas = { { id = "yt_naxx", text = "The black citadel over the Plaguewood. Nobody who's gone near it has come back to tell us what's inside." } },
    tirion = { { id = "yt_tirion", text = "There's an old paladin in a hut by the Western Plaguelands lake, they say, who was cast out for befriending an orc. Some of the Dawn's officers speak of him with great respect." } },
    stratholme = { { id = "xt_st", text = "A tomb of a city to the north. Don't go without friends." } },
    tyrosus = { { id = "xt_ty", text = "Our commander. He's never once lost his temper, which frightens me more than if he had." } },
    argent_dawn = { { id = "t_dawn", text = "Humans, dwarves, orcs, tauren, even Forsaken, all with one cause, and the only thing we quarrel about is whose turn it is on the night wall." } },
    scarlet_crusade = { { id = "t_scarlet", text = "They fight the dead too, but they'd also burn half of us here for what we are. Keep your distance." } },
    _none = { { id = "t_none", text = "Ask inside the chapel; I watch the road." } },
  },
}
