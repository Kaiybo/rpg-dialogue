-- The Gadgetzan Bruisers: Steamwheedle muscle in the desert. Same rules as Booty Bay, more sand.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")

P:Pool {
  id = "guard_gadgetzan", role = "guard", community = "gadgetzan",
  barks = {
    { id = "b_heat", text = "Hot enough to cook an egg on my helmet. Don't ask how I know." },
    { id = "b_water", text = "Water tower's humming, which is good, because when it stops humming everybody in town gets grumpy." },
  },
  greetings = {
    { id = "g_town", text = "This is Gadgetzan, friend: neutral ground, Cartel rules. You start a fight here and we finish it, usually on top of you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The desert gets cold at night, but the bandits don't, so stay inside the walls till morning." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Was it the Wastewander bandits or the bugs? Either way, there's a smith in town, so bring money." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh? In town you're a paying customer, but outside the walls you're bandit bait like everyone else." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? The Cartel doesn't care, so I don't care, and let's keep it that way." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey! Sand doesn't lie, sneaky, and I can see your footprints from here." } },
  lines = {
    { id = "l_default", text = "The Cartel built this town in the middle of nowhere because nowhere doesn't charge rent. We keep it peaceful so the money keeps coming." },
  },
  choices = { { text = "I'll keep the peace.", next = "END", fx = { standing = { gadgetzan = 1 } } } },
  topics = {
    steamwheedle = { { id = "t_cartel", text = "Gadgetzan's the Cartel's town. Booty Bay's a nice port, but this is the big chair." } },
    _none = { { id = "t_none", text = "Ask at the Road Warrior. Fizzgrimble talks to everyone, about everything." } },
  },
}
