-- Auberdine's Sentinels: a port town's watch, between the sea, the moonkin and the Blackwood.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_auberdine", role = "guard", community = "auberdine",
  barks = {
    { id = "b_ship", text = "The Moonspray's late again, whether from murlocs or weather, and either way someone's swimming." },
    { id = "b_moonkin", text = "The moonkin on the eastern ridge have turned savage, and they were gentle for as long as any of us can remember." },
  },
  greetings = {
    { id = "g_port", text = "Ishnu-alah, and welcome to Auberdine. The boats to Teldrassil and Menethil are at the piers, and there's trouble everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the lamps after dark, because the Blackwood furbolgs come closer than they used to. Elune's light is no shield against claws." },
    { id = "g_liked", when = { townStanding = { town = "auberdine", min = 30 } }, text = "Elder Thundris speaks well of you, and so do we." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the Blackwood, or with the murlocs; either way, see the smith before you go back." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid! Terenthis, our druid by the shore, will want a word with you, for everyone with a druid's eye is needed out there." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "There's a shadow on the pier. Step into the lamplight, please, and slowly." } },
  lines = {
    { id = "l_default", text = "Something is wrong with the land here: the moonkin, the furbolgs and the river, all at once, and nothing happens all at once by accident." },
    { id = "l_murkdeep", when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "Murkdeep's gone, they say, and the fishing boats went out at dawn for the first time in weeks." },
  },
  choices = { { text = "Elune keep you.", next = "END", fx = { standing = { auberdine = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "The druids here keep close to the Circle, Terenthis and the elder both, so ask them." } },
    _none = { { id = "t_none", text = "Ask the elder, for Thundris knows everything that happens in Auberdine, and has for centuries." } },
  },
}
