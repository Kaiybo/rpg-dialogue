-- Mulgore's braves: young tauren who watch the plains, give directions and keep the quilboar honest.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")

P:Pool {
  id = "guard_bloodhoof", role = "guard", community = "bloodhoof",
  barks = {
    { id = "b_plains", text = "Grass is high this year. Good for the kodo. Good for hiding gnolls, too." },
    { id = "b_wells", text = "Don't drink from the wells to the north. Not until Mull says so." },
  },
  greetings = {
    { id = "g_village", text = "Bloodhoof Village. The bluffs are north, the gnolls are west, and the goblins are everywhere they shouldn't be." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mulgore is quiet at night. Too quiet, some nights. Stay near the fires." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "First time out of Narache? The plains are wide. Walk them slowly; there's no shame in it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-folk from Gev'rek. Thunder Bluff called you friends, so you're friends here. Earth Mother keep you." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The grass moved, and not with the wind. Come out. We don't sneak in Bloodhoof." } },
  lines = {
    { id = "l_default", text = "Baine keeps the village. We keep the roads. Ask, and we'll point you where you're going." },
  },
  choices = { { text = "Thank you, Brave.", next = "END", fx = { standing = { bloodhoof = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask Baine, in the big tent. He listens to everyone." } },
  },
}

P:Pool {
  id = "guard_narache", role = "guard", community = "narache",
  barks = {
    { id = "b_quilboar", text = "Bristleback scouts on the ridge again. They never learn." },
  },
  greetings = {
    { id = "g_camp", text = "Camp Narache. Walk tall here. The Greatmother would have wanted it." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "New to the hunt. The Chief will set you a task. Do it well and the tribe will remember." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who hides in the camp? If you're quilboar, you're a clever one." } },
  lines = {
    { id = "l_default", text = "The quilboar came out of the hills and took the Greatmother from us. We don't forget, and we don't let them forget either." },
  },
  choices = { { text = "Earth Mother keep you.", next = "END", fx = { standing = { narache = 1 } } } },
  topics = {
    _none = { { id = "t_none", text = "Ask the Chief. He knows this land better than any of us." } },
  },
}
