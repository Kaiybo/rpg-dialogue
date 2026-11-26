-- Auberdine's Sentinels: a port town's watch, between the sea, the moonkin and the Blackwood.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_auberdine", role = "guard", community = "auberdine",
  barks = {
    { id = "b_y0", text = "The Explorers' League camp up the coast sent for more shovels again. I do not know what they are finding in our ruins, and I am not sure I want to." },
    { id = "b_y1", text = "A dead thresher washed up by the pier this morning, twice the size it ought to be. Thundris took one look and went very quiet." },
    { id = "b_ship", text = "The Moonspray's late again, whether from murlocs or weather, and either way someone's swimming." },
    { id = "b_moonkin", text = "The moonkin on the eastern ridge have turned savage, and they were gentle for as long as any of us can remember." },
  },
  greetings = {
    { id = "g_port", text = "Ishnu-alah, and welcome to Auberdine. The boats to Teldrassil and Menethil are at the piers, and there's trouble everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the lamps after dark, because the Blackwood furbolgs come closer than they used to. Elune's light is no shield against claws." },
    { id = "g_liked", when = { townStanding = { town = "auberdine", min = 30 } }, text = "Elder Thundris speaks well of you, and so do we." },
    { id = "g_y0", when = { race = "Dwarf" }, text = "Your League kin are digging up the coast again. Ask them to fill their holes in when they leave, if you would." },
    { id = "g_y1", when = { race = "Human" }, text = "You came on the Menethil boat, I suppose. Welcome to Darkshore, where the rain is free and the trouble costs extra." },
    { id = "g_y2", when = { class = "HUNTER" }, text = "A hunter's eye would help on the ridge. The moonkin have turned, and none of us knows why." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in the Blackwood, or with the murlocs; either way, see the smith before you go back." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid! Terenthis, our druid by the shore, will want a word with you, for everyone with a druid's eye is needed out there." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "There's a shadow on the pier. Step into the lamplight, please, and slowly." } },
  lines = {
    { id = "l_y0", when = { class = "HUNTER" }, text = "Hunters see the land's sickness first, in the beasts. Tell Thundris what you find on the ridge; he keeps a record of every strange thing." },
    { id = "l_default", text = "Something is wrong with the land here: the moonkin, the furbolgs and the river, all at once, and nothing happens all at once by accident." },
    { id = "l_murkdeep", when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "Murkdeep's gone, they say, and the fishing boats went out at dawn for the first time in weeks." },
  },
  choices = {
    { text = "Darkshore needs every ally. Welcome them gladly.", next = "END", reply = "Then you think as Thundris does. I will try to be more patient with the dwarves.", fx = { align = { order = 1 } } },
    { text = "Kaldorei lands should stay kaldorei.", next = "END", reply = "Many of us feel the same, though Glynda would never say it aloud.", fx = { align = { order = -1 } } },
    { text = "What threatens the town most?", next = "END", reply = "The sickness in the land, I think. Furbolgs and murlocs can be fought. A sickness has to be understood first." },
    { text = "Elune keep you.", next = "END", fx = { standing = { auberdine = 1 } } },
  },
  topics = {
    murlocs = { { id = "t_ymurlocs", text = "The murlocs on the beach grow bolder every season. Murkdeep is the worst of them." } },
    moonkin = { { id = "t_ymoonkin", text = "The moonkin on the ridge were gentle once. Now they attack anyone who comes near." } },
    menethil = { { id = "t_ymenethil", text = "The boat to Menethil Harbor runs when the sea allows. Lately, the sea allows less." } },
    cenarion_circle = { { id = "t_circle", text = "The druids here keep close to the Circle, Terenthis and the elder both, so ask them." } },
    _none = { { id = "t_none", text = "Ask the elder, for Thundris knows everything that happens in Auberdine, and has for centuries." } },
  },
}
