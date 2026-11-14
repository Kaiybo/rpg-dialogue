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
    { id = "g_rain_ghost", when = { ghost = true }, text = "Did you... say something? Must be the wind." },
  },
  lines = {
    { id = "l_default", text = "I've nothing much to tell you. Ask someone who gets out more." },
    { id = "l_work", text = "Work's work. It doesn't do itself while we talk." },
    { id = "l_dusk", when = { timeOfDay = "dusk" }, text = "Light's going. I'd find a roof if I were you." },
  },
  choices = {
    { text = "Never mind.", next = "END" },
    { text = "Good day to you.", next = "END" },
  },
  topics = {
    _none = {
      { id = "t_none1", text = "Couldn't tell you. Never had cause to know." },
      { id = "t_none2", text = "That's above my station, friend." },
    },
  },
}
