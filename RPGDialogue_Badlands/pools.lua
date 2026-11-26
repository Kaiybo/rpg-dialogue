-- The Kargath Grunts: orcs and Forsaken on the edge of Dark Iron country.
local P = RPGDialogueAPI:Pack("rpgd.badlands")

P:Pool {
  id = "guard_kargath", role = "guard", community = "kargath",
  barks = {
    { id = "b_dust", text = "There's dust in my teeth and dust in my boots, and I swear even the dust has dust out here." },
    { id = "b_spire", text = "Smoke over the Spire again. Somebody up there is forging something." },
    { id = "b_xogres", text = "The ogres in the hills are restless again. I hope they fight the Dark Irons instead of us." },
    { id = "b_xwater", text = "Water ration's cut again. Goretooth says the Badlands are good for the spirit. My spirit is thirsty." },
  },
  greetings = {
    { id = "g_kargath", text = "This is Kargath, the last Horde wall before the Blackrock, so keep yer weapon close." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! The Blackrock up the road wear our faces and serve dragons, so remember which of us is which." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Dark Irons got a piece of you, so get that armor fixed before they get the rest." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel", "ghostwolf" } }, text = "Something with claws walks into Kargath, and it had better be one of ours." } },
  lines = {
    { id = "l_xgoretooth", text = "Warlord Goretooth keeps the wall, and High Executioner Nuzrak keeps the traitors honest. Between them, Kargath stays standing." },
    { id = "l_xbladefist", text = "This place is named for Kargath Bladefist, chieftain of the Shattered Hand. We hold it in his name, and we hold it well." },
    { id = "l_default", text = "We hold the only Horde post in the dwarves' mountains, with Dark Irons to the east, Blackrock to the north and ogres everywhere, so nobody sleeps much." },
  },
  choices = {
    { text = "Hold the wall.", next = "END", fx = { standing = { kargath = 1 } } },
    { text = "Strike the Blackrock before they strike you.", next = "END", reply = "Aye, the young grunts say that. The warlord says wait.", fx = { align = { order = -1 } } },
    { text = "Hold and wait. The wall is what matters.", next = "END", reply = "Spoken like the warlord himself. Good.", fx = { align = { order = 1 } } },
  },
  topics = {
    blackrock = { { id = "t_blackrock", text = "The Blackrock call themselves the true Horde, up there in the Spire bowing to a dragon. Some true Horde." } },
    dark_iron = { { id = "t_dark_iron", text = "They're short and angry, and they come out of the mountain at night. Kill them on sight; it's posted." } },
    _none = { { id = "t_none", text = "Ask Warlord Goretooth; he'll be up the tower, wishing he was somewhere else." } },
  },
}
