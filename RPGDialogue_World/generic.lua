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
    knows = {
      { id = "t_kn1", text = "I hear things, same as anyone, though I couldn't swear to all of it. Here's what I could tell you about." },
      { id = "t_kn2", text = "Not much gets past me in this place, and a fair bit gets past everyone else. Ask about any of this." },
      { id = "t_kn3", text = "I'm no scholar, but I'm not deaf either, and these I can speak to, more or less." },
      { id = "t_kn_night", when = { timeOfDay = "night" }, text = "It's late for talk, but I'll tell you what I've heard if you're quick about it." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been decent to me, so I'll tell you what I know, and I won't even charge for it." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer a question or two, but don't expect me to enjoy it." },
    },
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
      { id = "t_ad_warm", when = { disposition = { min = 65 } }, text = "Look after the people who look after you. You seem to have the knack of it already, so don't lose it." },
      { id = "t_ad_cold", when = { disposition = { max = 34 } }, text = "Mind your own business, and I'll mind mine. That's the best advice I've got for you." },
    },
    rumors = {
      { id = "t_ru1", text = "Nothing worth the breath. Ask at the inn; they hear everything there." },
      { id = "t_ru2", text = "I keep my ears closed and my nose clean. Try the innkeeper." },
    },
  },
}
