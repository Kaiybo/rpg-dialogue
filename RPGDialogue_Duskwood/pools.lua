-- The Night Watch: Darkshire's militia. Lamps, pikes and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_darkshire", role = "guard", community = "darkshire",
  barks = {
    { id = "b_lamp", text = "Who let this lamp go out? Somebody tell me who let this lamp go out!" },
    { id = "b_howl", text = "There, do you hear it? That's closer than it was last night." },
    { id = "b_hero", when = { townStanding = { town = "darkshire", min = 30 } }, text = "That's the one the Commander likes, and she doesn't like anyone." },
  },
  greetings = {
    { id = "g_lamp", text = "Stay in the light. That's the only rule in Darkshire that matters." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Long night, and they're all long nights here. Keep moving, friend; standing still draws them." },
    { id = "g_liked", when = { townStanding = { town = "darkshire", min = 30 } }, text = "Good to see a friendly face, and yours more than most. Any face is welcome out here, honestly." },
    { id = "g_distrust", when = { townStanding = { town = "darkshire", max = -20 } }, text = "The Watch knows who you are, so mind yourself while you're inside our gate." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out past the cemetery, by the look of you. Did anything follow you back? Check over your shoulder, I mean it." },
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've been dead recently; you've still got that grey look about you. Around here we check twice that you're the living kind." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something's moving! Lanterns up! Show yourself, or we'll show you to the pikes." } },
  lines = {
    { id = "l_default", text = "We're the Night Watch. We don't stop them; we slow them down until morning, and out here morning's never quite enough." },
    { id = "l_watch", when = { questDone = TODO_QUEST("The Night Watch") }, text = "You thinned the cemeteries for us, and I had my first quiet shift in a month. I spent it staring at the fog anyway, out of habit." },
    { id = "l_stitches", when = { questDone = TODO_QUEST("Translation to Ello") }, text = "I'll see that stitched-up thing coming down the road in my sleep for years. You helped put it down, and I thank you for it." },
  },
  choices = { { text = "Stay in the light.", next = "END", fx = { standing = { darkshire = 1 } } } },
  topics = {
    worgen = { { id = "t_worgen", text = "They're in the trees after dark. Don't go chasing the howling, because that's exactly what it wants you to do." } },
    night_watch = { { id = "t_watch", text = "That's us: volunteers, and underpaid, which is a polite way of saying unpaid." } },
    _none = { { id = "t_none", text = "Ask the Commander about that. I just hold the lamp." } },
  },
}
