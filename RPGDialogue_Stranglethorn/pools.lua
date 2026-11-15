-- The Booty Bay Bruisers: goblin muscle that keeps the Cartel's port neutral.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")

P:Pool {
  id = "guard_bootybay", role = "guard", community = "booty_bay",
  barks = {
    { id = "b_ship", text = "Ship's in. Watch your purse, watch your back, watch the water." },
    { id = "b_steel", text = "Somebody drew steel on the pier last week. We fished him out eventually." },
  },
  greetings = {
    { id = "g_bay", text = "This is Booty Bay. Spend money, don't start trouble, and we'll get along fine." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Tavern's up that way. Everything else is shut, or ought to be." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough day in the jungle? There's a smith on the boardwalk, but bring coin; he doesn't do charity." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde, huh? In here you're a customer like anybody else, but past the shark's teeth you're on your own." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, huh? Inside these walls nobody cares, and if you keep it that way, neither will we." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Hey, I saw that shimmer! Sneaking about is your own business, but sneaking with your hand in somebody's pocket is ours." } },
  lines = {
    { id = "l_default", text = "The Cartel says this town's neutral, but we're the ones who make it neutral. Draw a weapon in town and see how quick we get there." },
  },
  choices = { { text = "I'll behave.", next = "END", fx = { standing = { booty_bay = 1 } } } },
  topics = {
    bloodsail = { { id = "t_bloodsail", text = "Let 'em come. We've got cannons and a grudge." } },
    steamwheedle = { { id = "t_cartel", text = "The Cartel pays us, and that's all I need to know about the Cartel." } },
    _none = { { id = "t_none", text = "Ask Krazek up at the tavern. He'll tell you whatever you want to know, and then he'll bill you for it." } },
  },
}
