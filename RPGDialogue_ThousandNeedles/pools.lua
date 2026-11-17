-- Freewind's Braves: tauren on the mesa-tops, watching the canyons for centaur and the pinnacle for the Grimtotem.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")

P:Pool {
  id = "guard_freewind", role = "guard", community = "freewind",
  barks = {
    { id = "b_wind", text = "Wind's from the south, and that's centaur weather." },
    { id = "b_lift", text = "The lift creaks; it always creaks. The day it stops creaking, that's when you worry." },
  },
  greetings = {
    { id = "g_mesa", text = "Freewind Post. Mind the edge; the canyon floor is a long way down, and the vultures there are very patient." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The stars are close up here, and so are the harpies, so get under a roof." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Centaur arrows? The Galak shoot well and run better, so get mended before you go down again." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother guide you, cousin. Out here we need every pair of horns." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something moved on the bridge. Show yourself, or swim the canyon, and there's no water in it." } },
  lines = {
    { id = "l_default", text = "We watch the canyons for the Galak and the pinnacle for the Grimtotem. Both of them are watching us back." },
  },
  choices = { { text = "Keep watching, Brave.", next = "END", fx = { standing = { freewind = 1 } } } },
  topics = {
    grimtotem = { { id = "t_grimtotem", text = "They're tauren, and they look at us like strangers. Don't walk alone near Darkcloud Pinnacle." } },
    mirage_raceway = { { id = "t_raceway", text = "Goblins and gnomes racing across the salt. When the wind drops you can hear the engines from here." } },
    _none = { { id = "t_none", text = "Ask the Cliffwatcher; he sees farther than any of us." } },
  },
}
