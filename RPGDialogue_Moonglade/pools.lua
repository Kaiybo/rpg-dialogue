-- Nighthaven's defenders: Cenarion wardens who keep Moonglade's peace between every faction.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")

P:Pool {
  id = "guard_nighthaven", role = "guard", community = "nighthaven",
  barks = {
    { id = "b_peace", text = "Weapons stay sheathed in Nighthaven, all of them, and yours too." },
    { id = "b_lake", text = "The lake's still tonight, and that's a good sign, for Elune sees herself in it." },
  },
  greetings = {
    { id = "g_peace", text = "Moonglade belongs to the Circle, and Alliance or Horde makes no difference here. Keep the peace and you're welcome." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Druid, whatever banner you fly elsewhere, here you're of the Circle." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon's on the lake, so walk softly; the village sleeps light, and the Dream is very near." },
  },
  notice = {
    { id = "n_beast", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "Your shape's your own business in Moonglade. Just don't trample the herb beds; Malvor will have words." },
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK" },
      text = "We know what you carry, so keep it leashed while you're under these trees. That's not a request." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hiding in Nighthaven? There's no need, and no point, for the wardens see further than you'd think." } },
  lines = {
    { id = "l_default", text = "We stop fights before they start. Orc, elf, tauren, human: nobody draws a blade in the Keeper's glade." },
  },
  choices = { { text = "I'll keep the peace.", next = "END", fx = { standing = { nighthaven = 1 } } } },
  topics = {
    cenarion_circle = { { id = "t_circle", text = "Druids of every people, keeping the balance, and we're their wardens. Ask Rabine for the rest." } },
    _none = { { id = "t_none", text = "That's for the druids to say. Ask in the village." } },
  },
}
