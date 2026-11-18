-- The Azshara Sentinels at Talrendis Point, guarding the bridge to Ashenvale. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")

P:Pool {
  id = "guard_talrendis", role = "guard", community = "talrendis_point",
  barks = {
    { id = "b_bridge", text = "The bridge is held. Whatever comes out of the east answers to us before it reaches Ashenvale." },
    { id = "b_shrine", text = "The shrine's lights are moving again. Elune grant the tauren another quiet night." },
  },
  greetings = {
    { id = "g_point", text = "Ishnu-alah, and welcome to Talrendis Point. Keep to the camp after dark, and keep your blade sheathed inside it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Walk softly; the ghosts from the shrine come close to the fires at this hour." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, {g:brother|sister} of the night. You'll feel it here, I think: the old grief in the stones, and the pride that caused it." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "The tauren vouches for the peace in this camp, so it holds for you too. Give me no reason to end it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Highborne blood, walking back into Highborne ruins. I will be watching you more closely than the others." },
  },
  lines = {
    { id = "l_default", text = "This coast was Zin-Azshari once, before the Well's destruction drowned it. We guard what's left so that nothing worse than the Highborne's ghosts walks out of it." },
    { id = "l_satyr", text = "The Haldarr satyr were our kin once, and that is the reason we never stop hunting them, so don't ask us to pity them." },
  },
  choices = { { text = "Elune keep you on watch.", next = "END", fx = { standing = { talrendis_point = 1 } } } },
  topics = {
    satyrs = { { id = "t_satyr", text = "The Haldarr are northeast of here. Strike them first; they'll strike you first if you don't." } },
    highborne = { { id = "t_hb", text = "We don't speak of them more than we must. Ask the tauren; he's braver about it than we are." } },
    furbolgs = { { id = "t_furb", text = "The furbolgs in the northern mountains have gone dark and angry, and we no longer go near their holds." } },
    _none = { { id = "t_none", text = "Ask Loh'atu by the fire. He talks to everyone, which is more than we Sentinels have time for." } },
  },
}
