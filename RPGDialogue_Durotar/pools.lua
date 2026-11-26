-- Razor Hill's grunts and Sen'jin's watchers: orcs on the crossroads, trolls on the shore.
local P = RPGDialogueAPI:Pack("rpgd.durotar")

P:Pool {
  id = "guard_razorhill", role = "guard", community = "razor_hill",
  barks = {
    { id = "b_dust", text = "Dust on the Orgrimmar road. Could be a caravan, could be trouble, and usually it's both." },
    { id = "b_coast", text = "Kul Tiran sails off the coast again. Let them look; the Horde was born under harder eyes than theirs." },
    { id = "yb_tiragarde", text = "The humans at Tiragarde are quiet today. That makes me nervous." },
    { id = "yb_scorpid", text = "Another scorpid in my boot this morning. Durotar loves me." },
  },
  greetings = {
    { id = "g_xbhunt", when = { origin = "orc_blade_hunter" }, text = "Back from the canyons? Orgnil Soulscar says you've a nose for Burning Blade cultists, and I'll take that over another grunt with a loud axe." },
    { id = "g_hill", text = "You stand in Razor Hill, where the roads to Orgrimmar, Sen'jin and the Barrens meet. Trouble meets here too, and we meet it with axes." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late to be on the road, and the Burning Blade likes the dark. Get inside the walls, {class}; there's no honor in a knife in the back." },
  },
  notice = {
    { id = "n_xtrack", cat = "origin", when = { origin = "orc_durotar_tracker" },
      text = "You walk like a tracker, quiet on the heel. If you're heading back out into the scrub, mind the scorpids along the dry riverbed, because they've been bold this season." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Quilboar got a piece of you? The smith by the barracks will see to it." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh out of the valley, are you? Keep your weapon loose and your eyes open, because Durotar bites." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's creeping around the barracks. Show yourself, or I'll find you with my axe." } },
  lines = {
    { id = "l_default", text = "We hold the crossroads for the Warchief. Quilboar come from the west, humans from the coast and cultists from the canyons, and the Horde holds anyway, as it always has." },
    { id = "yl_quiet", text = "Razor Hill was the first town the Horde built on Kalimdor. We hold it for every orc who came after." },
    { id = "yl_troll", when = { race = "Troll" }, text = "The Darkspear at Sen'jin hold the coast, and we hold the road. Good arrangement." },
    { id = "yl_orc", when = { race = "Orc" }, text = "Welcome home, brother. You came up through the Valley, I can tell." },
  },
  choices = {
    { text = "Lok'tar.", next = "END", fx = { standing = { razor_hill = 1 } } },
    { text = "Tiragarde should be burned out.", next = "END", reply = "Gar'Thok would agree. Thrall wants peace, so we wait.", fx = { align = { order = -1 } } },
    { text = "We should follow the Warchief and keep the peace.", next = "END", reply = "Good. Discipline wins more than rage.", fx = { align = { order = 1 } } },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everything that comes up the road from the Barrens or in off the coast passes this gate first. Here's what I've heard of it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've held the line with us, so I'll tell you what Gar'Thok, our commander, won't say out loud." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask, and keep it short, because the commander doesn't pay me to talk." },
    },
    burning_blade = { { id = "t_blade", text = "Orgnil Soulscar hunts the Burning Blade from the barracks here. Don't get in his way, and don't get in the cult's way either." } },
    _none = { { id = "t_none", text = "Ask Gar'Thok, in the barracks. He doesn't like questions, but he answers them, and he respects a grunt who asks to his face." } },
    tiragarde = { { id = "ytp_tiragarde", text = "Tiragarde Keep is a human fort on our coast. Kul Tiras marines, stubborn as rocks." } },
    valley_of_trials = { { id = "ytp_valley_of_trials", text = "The Valley of Trials is where our young learn to fight." } },
  },
}

P:Pool {
  id = "guard_senjin", role = "guard", community = "senjin",
  barks = {
    { id = "b_isles", text = "The isles look close today, mon, but they always look close. The loa like to tease us that way." },
    { id = "b_drums", text = "Hear the drums? Somebody be dancing for the loa tonight." },
  },
  greetings = {
    { id = "g_xfish", when = { origin = "troll_coast_fisher" }, text = "Good catch today, mon, or did the murlocs get there first? The cook been asking after your nets since dawn." },
    { id = "g_xseacall", when = { origin = "troll_sea_spirit_caller" }, text = "The water been calm since you sang to it last week, mon. The fishers be too proud to thank you themselves, so I say it for them." },
    { id = "g_xbwon", when = { origin = "troll_bwonsamdi_singer" }, text = "Sing quiet tonight, mon, so the dead hear you and the crabs don't. Bwonsamdi like your voice better than mine, anyway." },
    { id = "g_xspy", when = { origin = "troll_echo_isles_spy" }, text = "You be back from the isles again, and nobody saw you go. How many of the hexed ones did you count this time, mon?" },
    { id = "g_xraptor", when = { origin = "troll_raptor_rider" }, text = "Your raptor still be biting everybody but you, mon? The pen keeper be nursing his thumb from the last time, and he still blame you for it." },
    { id = "g_xspear", when = { origin = "troll_senjin_spear" }, text = "Back on the gate with us, mon? I remember you holding this spot the night the Kolkar came up from the south, and you didn't step back once." },
    { id = "g_village", text = "This be Sen'jin Village, mon, named for Sen'jin, the father of our chief Vol'jin, so you walk respectful." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night on the shore be pretty and dangerous both. Stay by the fires, mon, where the spirits can see you." },
  },
  notice = {
    { id = "n_xhex", cat = "origin", when = { origin = "troll_hex_breaker" },
      text = "That be Cleft magic on you, mon, and it smell too much like Zalazane's hexes for my liking. Vol'jin say we need somebody who know it from the inside, but I don't have to like it." },
    { id = "n_xguru", cat = "origin", when = { origin = "troll_gurubashi_runaway" },
      text = "You got the jungle in your walk, mon, the Gurubashi kind, and I be watching you till I know you better. The Darkspear took you in, so I won't say more than that." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Welcome home, or close as we got for now." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "You be new, and no shame in it; everybody start somewhere. Just mind the crabs." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Heh. Hiding from a troll, in a troll village? That be brave, mon, but it not be smart." } },
  lines = {
    { id = "l_default", text = "We watch the water. Zalazane's puppets come off the isles sometimes, and they don't come to trade, mon." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { senjin = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Plenty of talk come across the water, mon, and plenty more come down the road. Ask me about these." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You be a friend of the Darkspear, so I tell you everything, even what Gadrin mumble to himself." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I tell you a little, but you not be from here, and I got the water to watch." },
    },
    echo_isles = { { id = "t_isles", text = "The Echo Isles be our home, and one day we take them back. Master Gadrin say so, and Gadrin don't lie." } },
    _none = { { id = "t_none", text = "Ask Master Gadrin. He know most things, and he tell you the rest whether you want it or not." } },
  },
}
