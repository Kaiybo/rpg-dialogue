-- The Night Watch: Darkshire's militia. Lamps, pikes and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_darkshire", role = "guard", community = "darkshire",
  barks = {
    { id = "b_lamp", text = "Who let this lamp go out? Who?" },
    { id = "b_howl", text = "There. Hear it? Closer than last night." },
    { id = "b_hero", when = { townStanding = { town = "darkshire", min = 30 } }, text = "That's the one the Commander likes. She doesn't like anyone." },
  },
  greetings = {
    { id = "g_lamp", text = "Stay in the light. That's the only rule in Darkshire that matters." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Long night. They're all long nights here. Keep moving; standing still draws them." },
    { id = "g_liked", when = { townStanding = { town = "darkshire", min = 30 } }, text = "Good to see a friendly face. Any face, honestly. But yours especially." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Watch knows you. Mind yourself." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out past the cemetery, by the look of you. Did anything follow you back? Check. I mean it." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've been dead recently. You've got that grey look. Around here we check twice that you're the living kind." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's moving! Lanterns up! Show yourself, or we'll show you to the pikes." } },
  lines = {
    { id = "l_default", text = "Night Watch. We don't stop them. We slow them down until morning. Morning's never quite enough, out here." },
    { id = "l_watch", when = { questDone = TODO_QUEST("The Night Watch") }, text = "You thinned the cemeteries for us. First quiet shift I've had in a month. I spent it staring at the fog anyway. Habit." },
    { id = "l_stitches", when = { questDone = TODO_QUEST("The Embalmer's Revenge") }, text = "That stitched-up thing walking down the road. I'll see it in my sleep. You put it down. Thank you." },
  },
  choices = { { text = "Stay in the light.", next = "END", fx = { standing = { darkshire = 1 } } } },
  topics = {
    worgen = { { id = "t_worgen", text = "In the trees, past dark. Don't chase the howling. It wants you to." } },
    night_watch = { { id = "t_watch", text = "Us. Volunteers. Underpaid, which is to say unpaid." } },
    _none = { { id = "t_none", text = "Ask the Commander. I just hold the lamp." } },
  },
}
