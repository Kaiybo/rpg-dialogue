-- Shen'dralas's unnamed folk: mostly the friendly Shen'dralar spirits who still walk the ruins north of
-- Eldre'Thalas. Kept modest: the wiki says only that they are there and that they are friendly.
local P = RPGDialogueAPI:Pack("rpgd.shendralas")

P:Pool {
  id = "citizen_shendralas", role = "citizen", zone = "Shen'dralas",
  barks = {
    { id = "b_temple", text = "The moon used to rest on that altar like a hand on a child's head." },
    { id = "b_bell", text = "Was that the temple bell? No, there has not been a bell here for a very long time." },
  },
  greetings = {
    { id = "g_default", text = "Peace on you, stranger. Mind the broken stair; it was broken before your grandfathers were born." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon is up, and the ruins remember themselves a little when it is. Walk softly." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Kaldorei, here? The priestesses always said your people would come back one day, though I think they meant it differently." },
    { id = "g_sky", when = { race = "Skyborne" }, text = "Your face is one I almost know, from a street that is not there any longer. Forgive me for staring." },
  },
  lines = {
    { id = "l_default", text = "We walk where we walked before, along the old colonnades and up to the temple steps. The archmage on the hill nods to us in the evenings, and that is more courtesy than the centaur ever show." },
    { id = "l_grave", text = "Do not stand too long at the edge of the great grave, stranger. The ones who rest there rest poorly, and they do not like to be looked at." },
    { id = "l_magram", text = "The centaur in the valley pull bones up out of the earth and make them walk. I do not know whose bones they are, and I am afraid to go and look." },
    { id = "l_evenshade", when = { heardLine = "shd_evenshade.h_default" }, text = "You have spoken with Archmage Evenshade, then. He comes out of the city to grieve where we can see him, and I think it comforts him a little that someone does." },
    { id = "l_priest", when = { class = "PRIEST" }, text = "You pray, I can see it in how you hold your hands. The priestesses of this temple would have liked you, I think, whichever goddess you pray to." },
    { id = "l_forsaken", when = { race = "Scourge" }, text = "You are dead like us, and yet you are not like us at all; you carry yourself as if the world still owed you something. Perhaps it does." },
  },
  choices = {
    { text = "Rest easy, spirit.", next = "END" },
    { text = "I'll leave you to your walk.", next = "END" },
  },
  topics = {
    highborne = { { id = "t_highborne", text = "We were the Highborne, once, and proud of it. Pride is a hard thing to carry once there is nothing left to be proud of." } },
    _none = { { id = "t_none", text = "I am sorry, stranger, I do not remember. So much is gone, and I am never sure which parts." } },
  },
}
