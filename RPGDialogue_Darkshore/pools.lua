-- Auberdine's Sentinels: a port town's watch, between the sea, the moonkin and the Blackwood.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_auberdine", role = "guard", community = "auberdine",
  barks = {
    { id = "b_ship", text = "The Moonspray's late again. Murlocs, or weather. Either way, someone's swimming." },
    { id = "b_moonkin", text = "Moonkin on the eastern ridge again. They were gentle once." },
  },
  greetings = {
    { id = "g_port", text = "Ishnu-alah. Auberdine. Boats to Teldrassil and Menethil at the piers; trouble everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the lamps after dark. The Blackwood furbolgs come closer than they used to." },
    { id = "g_liked", when = { townStanding = { town = "auberdine", min = 30 } }, text = "The elder speaks well of you. So do we." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the Blackwood. Or with the murlocs. Either way, see the smith before you go back." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid. Terenthis will want a word. Everyone with a druid's eye is needed out there." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "A shadow on the pier. Step into the lamplight, please. Slowly." } },
  lines = {
    { id = "l_default", text = "Something's wrong with the land here. The moonkin, the furbolgs, the river. All at once. Nothing happens all at once by accident." },
    { id = "l_murkdeep", when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "Murkdeep's gone, they say. The fishing boats went out at dawn. First time in weeks." },
  },
  choices = { { text = "Elune keep you.", next = "END", fx = { standing = { auberdine = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The druids here keep close to the Circle. Terenthis and the elder both. Ask them." } },
    _none = { { id = "t_none", text = "Ask the elder. Thundris knows everything that happens in Auberdine." } },
  },
}
