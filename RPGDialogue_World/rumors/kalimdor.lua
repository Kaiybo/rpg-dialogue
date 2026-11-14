-- Inn talk across Kalimdor: Darnassus, Thunder Bluff, the Crossroads, Ashenvale, Moonglade.
-- Hearsay. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "darnassus_inns", roles = { "innkeeper" }, zones = { "Darnassus", "Teldrassil" },
  lines = {
    { id = "quarrel", text = "The High Priestess and the Archdruid argued in the open again. On the bridge, where everyone could hear. Nobody pretended not to listen." },
    { id = "tree", text = "Some of the older sentinels won't sleep in the high branches. They say the tree doesn't feel the way Nordrassil did. They won't say how it felt." },
    { id = "mortal", text = "A priestess I know found a grey hair last week. She wept for an hour. We're still learning what it is to grow old." },
    { id = "humans", text = "More humans on the boats from Auberdine every month. They gape at everything. It's rather sweet." },
  },
}

P:Rumors {
  id = "thunderbluff_inns", roles = { "innkeeper" }, zones = { "Thunder Bluff", "Mulgore" },
  lines = {
    { id = "magatha", text = "The Elder Crone said something sharp about the Chieftain at council again. He laughed. That made her angrier than any answer would have." },
    { id = "druids", text = "Three young druids went up to Moonglade this season. Three! Hamuul walked about grinning for days." },
    { id = "lifts", text = "A trader from the Barrens rode the lift for the first time and wouldn't let go of the rail until the top. We all did that, once." },
    { id = "skyfolk", when = { minLevel = 10 }, text = "The sky-folk camp down on the plains has more visitors than it used to. They bring good cloth and strange news." },
  },
}

P:Rumors {
  id = "crossroads_inns", roles = { "innkeeper" }, zones = { "The Barrens" },
  lines = {
    { id = "mankrik", when = { questBefore = TODO_QUEST("Lost in Battle") },
      text = "Everyone who passes through asks where Mankrik's wife is. Nobody knows. The asking has become a sort of greeting." },
    { id = "mankrik_found", when = { questRecent = { TODO_QUEST("Lost in Battle"), days = 7 } },
      text = "Someone finally found Olgra, out on the plains. Mankrik came down off the wall for the first time in a season." },
    { id = "oases", text = "The water at the Forgotten Pools tastes wrong now. Tonga says don't drink it. Tonga says that about most things lately." },
    { id = "kolkar", when = { questBefore = TODO_QUEST("The Disruption Ends") },
      text = "Kolkar riders hit a caravan on the Gold Road. Took the water, left the wagons. That's how you know they mean to come back." },
    { id = "ratchet", text = "The goblins at Ratchet will sell you anything, including the boat you came in on, if you step off it too long." },
  },
}

P:Rumors {
  id = "ashenvale_inns", roles = { "innkeeper" }, zones = { "Ashenvale" },
  lines = {
    { id = "relara", when = { questBefore = TODO_QUEST("Fallen Sky Lake") },
      text = "Pelturas's little girl had another bad night. The whole inn heard. Nobody slept, and nobody complained." },
    { id = "relara_well", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
      text = "Relara Whitemoon was out on the bridge this morning, chasing a moth. Her father stood and watched like it was the moon rising." },
    { id = "furbolgs", text = "The Thistlefur were seen near the north road again. Raene's scouts came back quiet. That's never good." },
    { id = "lumber", text = "You can hear the axes from the east on a still day. Every stroke, someone at the bar flinches." },
    { id = "hunt", text = "A tauren hunter at Splintertree is after the great beasts of the forest. Sharptalon, even. Brave, or mad, or both." },
  },
}

P:Rumors {
  id = "moonglade_word", roles = { "innkeeper" }, zones = { "Darnassus", "Teldrassil", "Thunder Bluff", "Mulgore", "Ashenvale" },
  lines = {
    { id = "glade", when = { class = "DRUID" },
      text = "A druid! You'll have seen Moonglade, then. They say the Keeper himself walks there. Is it true? Is he as tall as they say?" },
    { id = "dream", when = { minLevel = 20 },
      text = "Druids who sleep too long in the Dream come back strange, they say. Or don't come back. I'd stay awake, myself." },
  },
}
