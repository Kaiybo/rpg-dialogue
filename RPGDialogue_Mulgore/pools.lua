-- Mulgore's braves: young tauren who watch the plains, give directions and keep the quilboar honest.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")

P:Pool {
  id = "guard_bloodhoof", role = "guard", community = "bloodhoof",
  barks = {
    { id = "b_plains", text = "The grass is high this year, which is good for the kodo, and good for hiding gnolls, and very good for hiding whatever the kodo left behind." },
    { id = "b_wells", text = "Don't drink from the wells to the north, not until Mull says so." },
  },
  greetings = {
    { id = "g_village", text = "Here in Bloodhoof Village, the bluffs are to the north and the gnolls to the west, and the goblins are everywhere they shouldn't be." },
    { id = "g_xbrave", when = { origin = "tauren_bloodhoof_brave" }, text = "Brave! You stood the line with us when the goblins first dragged their machines into Mulgore. The village still tells that story, and it gets bigger every time Mull tells it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "At night the gnolls come sniffing round the cookfires for scraps. Stay near the fires, and keep your boots inside the tent." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "First time out of Narache? The plains are wide, and the swoops will steal anything shiny, so walk slowly and keep your pack shut." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-folk from Gev'rek. Thunder Bluff called you friends, so you're friends here. Earth Mother keep you." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "The grass moved, and not with the wind. Come out; we don't sneak in Bloodhoof." } },
  lines = {
    { id = "l_default", text = "Baine keeps the village and we keep the roads, so ask, and we'll point you where you're going, Earth Mother willing." },
  },
  choices = { { text = "Thank you, Brave.", next = "END", fx = { standing = { bloodhoof = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "News crosses the plains slowly, but it does arrive, usually with a trader and a tired kodo. Here is what has reached us." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've walked the plains as a friend, so sit by the fire, and I'll tell you all of it." },
    },
    _none = { { id = "t_none", text = "Ask Baine, in the big tent. He listens to everyone, as the plains listen to the rain." } },
  },
}

P:Pool {
  id = "guard_narache", role = "guard", community = "narache",
  barks = {
    { id = "b_quilboar", text = "Bristleback scouts are on the ridge again; you can smell them before you see them, and they never learn." },
  },
  greetings = {
    { id = "g_camp", text = "Camp Narache welcomes you. Walk tall here, as the Greatmother would have wanted." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "New to the hunt, are you? The Chief will set you a task, and if you do it well, the tribe will remember." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who hides in the camp? If you're quilboar, you're a clever one." } },
  lines = {
    { id = "l_default", text = "The quilboar came out of the hills and took the Greatmother from us. We don't forget, and we don't let them forget either." },
  },
  choices = { { text = "Earth Mother keep you.", next = "END", fx = { standing = { narache = 1 } } } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The camp is small, but the hunters come back with stories, and I hear every one. I can tell you about these." },
    },
    _none = { { id = "t_none", text = "Ask the Chief. He knows this land better than any of us, and he'll tell you about it twice if you let him, the Earth Mother bless his patience." } },
  },
}
