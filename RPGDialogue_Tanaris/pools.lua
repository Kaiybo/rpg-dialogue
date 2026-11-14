-- The Gadgetzan Bruisers: Steamwheedle muscle in the desert. Same rules as Booty Bay, more sand.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")

P:Pool {
  id = "guard_gadgetzan", role = "guard", community = "gadgetzan",
  barks = {
    { id = "b_heat", text = "Hot enough to cook an egg on my helmet. Don't ask how I know." },
    { id = "b_water", text = "Water tower's humming. Good. When it stops humming, everybody gets grumpy." },
  },
  greetings = {
    { id = "g_town", text = "Gadgetzan. Neutral ground, Cartel rules. You start a fight, we finish it. Usually on you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Desert gets cold at night. The bandits don't. Stay inside the walls." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Wastewander bandits, or bugs? Either way, there's a smith in town. Bring money." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh. In town you're a paying customer. Outside, you're bandit bait like everyone else." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh. The Cartel doesn't care, so I don't care. Keep it that way." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey! Sand doesn't lie. I can see your footprints, sneaky." } },
  lines = {
    { id = "l_default", text = "The Cartel built this town in the middle of nowhere because nowhere doesn't charge rent. We keep it peaceful so the money keeps coming." },
  },
  choices = { { text = "I'll keep the peace.", next = "END", fx = { standing = { gadgetzan = 1 } } } },
  topics = {
    steamwheedle = { { id = "t_cartel", text = "Gadgetzan's the Cartel's town. Booty Bay's a nice port, but this is the big chair." } },
    _none = { { id = "t_none", text = "Ask at the Road Warrior. Fizzgrimble talks to everyone, about everything." } },
  },
}
