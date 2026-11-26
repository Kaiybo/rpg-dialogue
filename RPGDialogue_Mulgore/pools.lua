-- Mulgore's braves: young tauren who watch the plains, give directions and keep the quilboar honest.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")

P:Pool {
  id = "guard_bloodhoof", role = "guard", community = "bloodhoof",
  barks = {
    { id = "b_plains", text = "The grass is high this year, which is good for the kodo, and good for hiding gnolls, and very good for hiding whatever the kodo left behind." },
    { id = "b_wells", text = "Don't drink from the wells to the north, not until Mull Thunderhorn, who tends them, says so." },
      { id = "ybloodh_b0", text = "The kodo are restless tonight. Something in the west, maybe, or only the wind." },
    { id = "ybloodh_b1", text = "Brave Strongbash threw another traveller at the inn. It was a friendly throw, he says." },
    { id = "ybloodh_b2", text = "Smell that? Kauth is roasting plainstrider again." },
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
      { id = "ybloodh_l0", text = "The Venture Company has camps to the north now, and their machines cut the trees faster than the Earth Mother can grow them. Baine says watch, and so we watch." },
    { id = "ybloodh_l1", when = { race = "Tauren" }, text = "Welcome home, cousin. The village is well, the kodo are fat, and the gnolls are hungry, which is how Mulgore likes it." },
    { id = "ybloodh_l2", when = { class = "DRUID" }, text = "A druid! The kodo are calmer when your kind walk among them. Stay a while, if you can." },
    { id = "ybloodh_l3", when = { race = "Orc" }, text = "Friend of Thrall, friend of Mulgore. The Warchief's people are welcome by our fires." },
  },
  choices = { { text = "Thank you, Brave.", next = "END", fx = { standing = { bloodhoof = 1 } } } , { text = "Drive the goblins out before they take more land.", next = "END", reply = "Many of us want to. Baine says patience, and we listen to Baine.", fx = { align = { honor = 1 } } }, { text = "Trade with the goblins. Their coin can help the village.", next = "END", reply = "Some do. But the trees remember who cut them, and so do we.", fx = { align = { honor = -1 } } }, { text = "What news from Thunder Bluff?", next = "END", reply = "Cairne is well, the lifts still run, and the Grimtotem keep to themselves on Spirit Rise. Mostly." } },
  topics = {
    venture_company = { { id = "ybloodh_tp_venture_company", text = "The Venture Company digs and cuts and leaves nothing behind. They are the worst neighbours a village could have." } },
    palemane = { { id = "ybloodh_tp_palemane", text = "The Palemane gnolls steal and run. Brave Rainchaser tracks them better than anyone." } },
    thunder_bluff = { { id = "ybloodh_tp_thunder_bluff", text = "Thunder Bluff is half a day's walk north. Take the lifts, and do not look down." } },

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
      { id = "ynarach_b0", text = "The young ones are back from the Rite. Most of them, anyway." },
    { id = "ynarach_b1", text = "Listen to the wind in the grass. The ancestors are restless tonight." },
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
    { id = "l_x_young", text = "Every young tauren of Mulgore walks through Camp Narache before the plains take them. We guard them until they are ready to guard themselves." },
    { id = "l_x_class", when = { class = "SHAMAN" }, text = "The young shaman come here to hear the earth for the first time. Listen well, and do not be afraid when it answers." },
      { id = "ynarach_l0", text = "Grull Hawkwind sets the Rites, and he is hard, but he is fair. Every brave of Mulgore has stood before him." },
    { id = "ynarach_l1", when = { race = "Tauren" }, text = "You stood here once yourself, I would wager, nervous and proud. Now you return taller. The camp is glad of it." },
    { id = "ynarach_l2", when = { class = "HUNTER" }, text = "A hunter! The plainstriders are thick this season, and the cougars are bold. You will find work here." },
  },
  choices = {
    { text = "Hunt the quilboar back into the hills.", next = "END", reply = "So the hunters say, and so they do, every season.", fx = { align = { honor = 1 } } },
    { text = "Guard the young, but don't hunt for vengeance.", next = "END", reply = "Wise words. Vengeance never filled a tauren's belly.", fx = { align = { honor = -1 } } },
    { text = "Earth Mother keep you.", next = "END", fx = { standing = { narache = 1 } } },
   { text = "What happened to the Greatmother?", next = "END", reply = "Greatmother Hawkwind fell to the quilboar raiders, and the whole camp mourned. Her son Grull keeps her memory, and her bow." } },
  topics = {
    grull = { { id = "ynarach_tp_grull", text = "Grull Hawkwind sets the Rite of Strength. Do not argue with him, he enjoys it too much." } },
    red_cloud_mesa = { { id = "ynarach_tp_red_cloud_mesa", text = "Red Cloud Mesa is the first land every young tauren learns. It holds Camp Narache, and the old bones." } },

    bristleback = { { id = "t_x_bristle", text = "The Bristleback come down from the ridges in the dry months. Their scouts are clumsy, but their chiefs are not." } },
    knows = {
      { id = "t_kn1", text = "The camp is small, but the hunters come back with stories, and I hear every one. I can tell you about these." },
    },
    _none = { { id = "t_none", text = "Ask the Chief. He knows this land better than any of us, and he'll tell you about it twice if you let him, the Earth Mother bless his patience." } },
  },
}
