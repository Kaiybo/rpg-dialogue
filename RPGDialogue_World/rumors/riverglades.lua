-- Powderfuse Port's inn talk, and word of the Riverglades in the inns next door. Hearsay.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "riverglades_inns", roles = { "innkeeper" }, zones = { "Riverglades" },
  lines = {
    { id = "tower", text = "The old mage tower at Sunnyglade still lights up some nights. Purple. The cultists up there don't sell anything, so I don't care what they're doing. Mostly." },
    { id = "ogres", text = "The Bolder'ok ogres walked out on the Twilight lot and threw in with the Horde. Ogres changing sides. I'd have bet good coin against it, and I'd have lost." },
    { id = "chogall", when = { minLevel = 36 },
      text = "Old sailor swears Cho'gall himself came here to lick his wounds, back after the Second War. Two heads, one bad mood. Nobody's ever seen him. Nobody's ever wanted to.",
      fx = { hear = "chogall_in_riverglades", learn = { "twilights_hammer" } } },
    { id = "windstead", text = "Pirates in the ruins up at Windstead. Eastsea flags. They don't come in here to drink, which tells you how they pay." },
    { id = "caves", when = { questBefore = TODO_QUEST("Eye of Mugg") },
      text = "The Brotherhood's scouts keep going into caves up the northwest ridge and not coming out. The Knight Commander's stopped sending them alone. I've stopped asking." },
    { id = "mugg", when = { questRecent = { TODO_QUEST("Eye of Mugg"), days = 7 } },
      text = "Word is somebody walked out of Krol'dok with the big ogre's eye in a sack. Fimbo wants to know if it's edible. It isn't. I asked." },
    { id = "curly", when = { questRecent = { TODO_QUEST("Helping Hands"), days = 7 } },
      text = "One of Turner's loggers got himself in a fix in the woods. Somebody went and fetched him. Hurley's been buying rounds for strangers since." },
    { id = "monster", when = { questBefore = TODO_QUEST("The Monster Surfaces") },
      text = "Argo says there's a sea monster eating boats off the murloc islands. Argo also says he's sober. Pick which one to believe." },
    { id = "monster_done", when = { questRecent = { TODO_QUEST("The Monster Surfaces"), days = 7 } },
      text = "Argo's nailed a sea monster's head to his stern. He's been drinking to it all week. It's starting to smell like the inn." },
  },
}

P:Rumors {
  id = "riverglades_word", roles = { "innkeeper" }, zones = { "Redridge Mountains", "Tanaris", "Swamp of Sorrows" },
  lines = {
    { id = "keep", when = { minLevel = 30 },
      text = "There's a keep full of Stormwind horsemen past the eastern passes. Farholde. They've been fighting out there twenty years. Stormwind forgot them. They haven't forgotten Stormwind.",
      fx = { learn = { "brotherhood_horse" } } },
    { id = "boat", when = { minLevel = 34 },
      text = "The Steamwheedle boat runs up the coast now, to a goblin port in the Riverglades. Powderfuse. The fellow who runs it says he built it himself. All of it.",
      fx = { learn = { "powderfuse_port" } } },
  },
}
