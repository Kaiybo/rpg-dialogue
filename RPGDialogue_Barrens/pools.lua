-- The Crossroads' guards: orcs on the palisade, watching the Gold Road in both directions.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_crossroads", role = "guard", community = "crossroads",
  barks = {
    { id = "b_dust", text = "There's dust on the north road. Could be riders, could be just the wind, or could be that blasted plainstrider again." },
    { id = "b_quilboar", text = "Smells like quilboar, but then everything smells like quilboar out here, including my bedroll." },
    { id = "b_hero", when = { townStanding = { town = "crossroads", min = 30 } }, text = "You've done more for the Crossroads than half the garrison, and we all know it." },
    { id = "yb_well", text = "The well water's sweet this week. That never lasts, so drink while you can." },
    { id = "yb_kolkar", text = "Kolkar dust on the western ridge again. Thork will want to hear about it." },
    { id = "yb_tauren", when = { race = "Tauren" }, text = "The tauren caravans bring good news from Mulgore and bad news from Taurajo." },
  },
  greetings = {
    { id = "g_cross", text = "Lok'tar, and welcome to the Crossroads. The water's at the well, and the trouble's everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Inside the walls after dark. Centaur ride at night, and they don't stop to ask whose side you're on." },
    { id = "g_liked", when = { townStanding = { town = "crossroads", min = 30 } }, text = "Pass, friend of the Crossroads, and be welcome; that name counts for something here." },
    { id = "g_distrust", when = { townStanding = { town = "crossroads", max = -20 } }, text = "Thork, who keeps the Crossroads for the Warchief, knows your name, stranger, so mind yourself while you're inside these walls." },
  },
  notice = {
    { id = "n_xbeast", cat = "origin", when = { origin = "orc_barrens_beastmaster" },
      text = "You hunt the old way, beside a beast you tamed yourself. Sergra Darkthorn sends her best hunters out past the walls like that, so I'll not ask you to leash it inside the gate." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Barrens has been chewing on you. Traugh at the forge can mend that, though the Barrens will only tear it open again." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "You're a long way from your walls, outsider. Keep walking and keep your hands empty." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Something in the grass! Out where I can see you, or I'll put a spear where I think you are." } },
  lines = {
    { id = "l_default", text = "Quilboar to the south, centaur to the west, harpies in the hills and the Alliance at Northwatch. The Crossroads sits in the middle and holds for the Horde, on stale bread and less sleep than you'd believe." },
    { id = "l_disrupt", when = { questDone = TODO_QUEST("The Disruption Ends") }, text = "The centaur raids have slowed. I don't trust it yet, but I'll take the sleep, and so will my feet." },
    { id = "yl_quiet", text = "Four seasons on this palisade and I can tell a plainstrider from a raider by the dust alone. That doesn't make the nights any shorter." },
    { id = "yl_orc", when = { race = "Orc" }, text = "You grew up behind human walls, like me, I'd guess. Now we stand on our own walls, and that's worth every sleepless night." },
    { id = "yl_troll", when = { race = "Troll" }, text = "The Darkspear here keep the night watch better than any of us. They say the dark is friendly, if you know it." },
  },
  choices = {
    { text = "Lok'tar.", next = "END", fx = { standing = { crossroads = 1 } } },
    { text = "The Horde should push the quilboar back hard.", next = "END", reply = "That's the talk. Thork would have you on the wall tonight.", fx = { align = { order = 1 } } },
    { text = "Maybe the Horde should share the Barrens.", next = "END", reply = "Share? With the Razormane? Tell that to the grunts they've buried.", fx = { align = { order = -1 } } },
    { text = "How long have you held the Crossroads?", next = "END", reply = "Since the first palisade went up. I've seen it grow from a camp to a town." },
  },
  topics = {
    wailing_caverns = { { id = "t_caverns", text = "Ask Tonga Runetotem, the tauren druid here. All I know is that the water tastes wrong near those caves, and the druids who went in came out strange." } },
    _none = { { id = "t_none", text = "Ask Thork, who keeps the Crossroads for the Warchief. He's up on the tower, glaring at the horizon as usual." } },
    northwatch = { { id = "ytp_northwatch", text = "The humans at Northwatch watch the coast. We watch them back. Nobody blinks." } },
    thork = { { id = "ytp_thork", text = "Thork's a hard boss but fair. He knows every grunt by name, and he'll remember yours too." } },
  },
}
