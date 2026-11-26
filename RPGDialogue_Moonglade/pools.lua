-- Nighthaven's defenders: Cenarion wardens who keep Moonglade's peace between every faction.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")

P:Pool {
  id = "guard_nighthaven", role = "guard", community = "nighthaven",
  barks = {
    { id = "b_peace", text = "Weapons stay sheathed in Nighthaven, all of them, and yours too." },
    { id = "yb_owl", text = "The owls are quiet tonight, which means something large is walking under the trees. Probably a druid. Probably." },
    { id = "yb_barrow", text = "Someone's snoring in the Barrow Dens again. Ten years, that one's been asleep." },
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
  react = { { id = "r_stealth", on = "stealth", text = "Hiding in Nighthaven? There's no need, and no point, for the wardens of this grove see through leaf and shadow alike." } },
  lines = {
    { id = "l_x1", text = "The Stormrage Barrow Dens lie under the hill, where druids sleep in the Dream. If you hear snoring, keep walking, and don't wake anyone." },
    { id = "l_x2", text = "I came here from Thunder Bluff, my sister came from Darnassus, and we both answer to Remulos. Make of that what you will." },
    { id = "l_x3", when = { faction = "Horde" }, text = "Horde or not, you're a guest here. The Alliance druids by the lake will say the same, if you're polite first." },

    { id = "yl_felwood", text = "The road south runs through Felwood, and what grows there now is sick to the root. If you came that way, wash your boots in the lake before you walk the herb beds." },
    { id = "yl_timbermaw", text = "The Timbermaw furbolgs hold the tunnel from Winterspring and Felwood both. Keep their good will, or keep a long way from their caves." },
    { id = "yl_x_tauren", when = { race = "Tauren" }, text = "Thunder Bluff sent its druids to Moonglade before your grandmother's grandmother was a calf, cousin. The glade knows hooves as well as it knows elven feet." },
    { id = "yl_x_nelf", when = { race = "NightElf" }, text = "Elune-adore, kaldorei. Remulos keeps this glade as Cenarius kept it, and you will find it little changed since the War of the Ancients, save for the orcs at the inn." },
    { id = "l_default", text = "We stop fights before they start. Orc, elf, tauren, human: nobody draws a blade in the Keeper's glade." },
  },
  choices = {
    { text = "Peace here should bind every faction everywhere.", next = "END", reply = "A good dream. Moonglade is where we practise it, at least.", fx = { align = { light = 1 } } },
    { text = "Peace here is fine. Out there, war is war.", next = "END", reply = "Then leave your war at the edge of the trees, and pick it up on your way out.", fx = { align = { light = -1 } } },
    { text = "I'll keep the peace.", next = "END", fx = { standing = { nighthaven = 1 } } },
  },
  topics = {
    remulos = { { id = "t_xremulos", text = "Keeper Remulos guards the shrine by the lake. Speak softly near him; he's older than the hills." } },

    cenarion_circle = { { id = "t_circle", text = "Druids of every people, keeping the balance, and we're their wardens. Ask Rabine for the rest." } },
    felwood = { { id = "yt_felwood", text = "Felwood was a green forest once. Now the demons' rot is in the soil, and the druids weep when they walk it." } },
    timbermaw = { { id = "yt_timber", text = "The Timbermaw guard the only safe path into the glade from the south. Be polite in their tunnels." } },
    _none = { { id = "t_none", text = "That's for the druids to say. Ask in the village." } },
  },
}
