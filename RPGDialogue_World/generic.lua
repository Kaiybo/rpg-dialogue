-- Last link of every fallback chain: nobody is ever silent. Still a person talking,
-- just one we know nothing about.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Generic {
  id = "any",
  greetings = {
    { id = "g_busy", text = "Mm? I'm in the middle of something." },
    { id = "g_yes", text = "Yes? Quickly, if you would." },
    { id = "g_look", text = "You look like you've walked a long way." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Bit late to be wandering, isn't it?" },
    { id = "g_rain_ghost", when = { ghost = true }, text = "Did you... did you say something? It must have been the wind." },
  },
  lines = {
    { id = "l_default", text = "I've nothing much to tell you. Ask someone who gets out more." },
    { id = "l_work", text = "Work's work, and it doesn't do itself while we talk." },
    { id = "l_dusk", when = { timeOfDay = "dusk" }, text = "Light's going. I'd find a roof if I were you." },
  },
  choices = {
    { text = "Never mind.", next = "END" },
    { text = "Good day to you.", next = "END" },
  },
  topics = {
    _none = {
      { id = "t_none1", text = "Couldn't tell you; I've never had cause to know." },
      { id = "t_none2", text = "That's above my station, friend." },
    },
    -- "Ask anyone": the last answers, for someone with nothing written of their own.
    background = {
      { id = "t_bg1", text = "My story? It's long, dull, and still going, so ask me again when it's finished." },
      { id = "t_bg2", text = "Not much to tell that'd interest you. I'd rather hear yours." },
    },
    trade = {
      { id = "t_tr1", text = "Whatever needs doing, and today that's mostly this." },
    },
    advice = {
      { id = "t_ad1", text = "Keep your purse close and your temper closer." },
      { id = "t_ad2", when = { band = { "Greenhorn", "Blooded" } }, text = "You're young. Be young somewhere safe for a while longer." },
    },
    rumors = {
      { id = "t_ru1", text = "Nothing worth the breath. Ask at the inn; they hear everything there." },
      { id = "t_ru2", text = "I keep my ears closed and my nose clean. Try the innkeeper." },
    },
  },
}
