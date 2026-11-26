-- The Theramore Guard: soldiers of Jaina's island, many of them veterans of the voyage from Lordaeron.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")

P:Pool {
  id = "guard_theramore", role = "guard", community = "theramore",
  barks = {
    { id = "yguardtheramore6", text = "The kitchen's serving chowder again. That's three days running, and nobody's brave enough to tell Dwane." },
    { id = "yguardtheramore7", text = "Combat Master Criton's voice carries clear to the docks this morning. Some poor recruit's leaning on his back foot." },
    { id = "yguardtheramore8", text = "Saw a black dragon over the Wyrmbog at dawn. The sergeant says it was a heron, and I say it was a very big heron." },
    { id = "b_xtea", text = "Somebody left the kettle on the north wall again, and I'm not complaining, because it's the only warm thing on the isle." },
    { id = "b_marsh", text = "Fog off the marsh again, and my socks have gone green. You learn to listen instead of look." },
    { id = "b_ships", text = "Sails on the horizon, ours, I hope. Usually they're ours, and usually they're late with the pay chest." },
  },
  greetings = {
    { id = "g_isle", text = "Welcome to Theramore. The Lady keeps the peace here, and so do we." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. The marsh is worse after dark: crocolisks, and things bigger than crocolisks, and the mosquitoes are bigger than both." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The marsh got its teeth into you. There's a smith in the city, and a surgeon who drinks less than you'd fear; get patched before you go back out." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "From Stormwind, or one of us who came over the sea? Either way, welcome to the only human city on Kalimdor." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's creeping by the docks. Step into the light, slowly." } },
  lines = {
    { id = "ycguardtheramore1", when = { class = "MAGE" }, text = "Archmage Tervosh keeps the tower lit all night. If you're of his trade, he'll want a word with you, and he'll want it at length." },
    { id = "yguardtheramore3", text = "Ships from Menethil bring flour and letters, and the letters are the bigger comfort. My sister writes from Southshore every season, and every season she asks when I'm coming home." },
    { id = "yguardtheramore4", when = { race = "Dwarf" }, text = "Ironforge sent a few of your kin to dig at the docks. They work harder than anyone and complain louder, which I respect." },
    { id = "yguardtheramore5", when = { faction = "Horde" }, text = "You're under the Lady's peace here, so walk easy and keep your weapons sheathed. Some of the Admiral's old marines haven't forgiven your Warchief." },
    { id = "l_xvimes", text = "Captain Vimes walks the walls at dawn and knows every man's name, which is more than you can say for most captains. He's been short with us lately, though, ever since those hoofprints turned up by the burnt inn." },
    { id = "l_xdragons", when = { timeOfDay = "night" }, text = "On a clear night you can see the black dragons circling over the Wyrmbog to the south. They've not come at the walls yet, and I'd thank the Light to keep it that way." },
    { id = "l_default", text = "We came over with the Lady after Lordaeron fell. We built this place out of a swamp with our own blistered hands, and we're not giving it up to anyone." },
  },
  choices = {
    { text = "The Lady should pardon the deserters, not hang them.", next = "END", reply = "Some say so. I hope the Lady agrees, because I knew a few of them.", fx = { align = { order = -1 } } },
    { text = "The Guard's discipline keeps this isle standing.", next = "END", reply = "It does, and Captain Vimes would want me to say so, and it's still true.", fx = { align = { order = 1 } } },
    { text = "Peace with the Horde won't last.", next = "END", reply = "Maybe not, but the Lady says it will, and I'd sooner trust her than the doom-criers at the inn.", fx = { align = { light = -1 } } },
    { text = "The Lady's peace is worth guarding.", next = "END", reply = "Aye, it is, and that's why we stand out here in the wet.", fx = { align = { light = 1 } } },
    { text = "For Theramore.", next = "END", fx = { standing = { theramore = 1 } } } },
  topics = {
    deserters = { { id = "yguardtheramore1", text = "They ran off into the marsh, and some turned bandit. It's a sore subject." } },
    dwane = { { id = "yguardtheramore2", text = "The cook. Feeds us three times a day, and gets angry if we don't finish." } },
    vimes = { { id = "t_xvimes", text = "Captain Garran Vimes. A fair man, tired as the rest of us, and he answers to the Lady herself." } },
    wyrmbog = { { id = "t_xwyrmbog", text = "South of here, full of black dragons. Don't go unless someone's paying you very well." } },
    grimtotem = { { id = "t_grimtotem", text = "Tauren who don't follow Thrall. Captain Vimes has been asking about them, though he wouldn't say why." } },
    _none = { { id = "t_none", text = "Ask in the citadel. Captain Vimes or Archmage Tervosh will know." } },
  },
}
