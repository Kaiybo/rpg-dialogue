-- The Bruisers the Cartel lent the Marshal Expedition, posted at the top of the crater.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")

P:Pool {
  id = "guard_marshals", role = "guard", community = "marshals_refuge",
  barks = {
    { id = "b_xpylon", text = "One of the crystal pylons out there hummed all night, and nobody here knows why, least of all the scholars." },
    { id = "b_roar", text = "Hear that? Something big down there just ate something slightly less big." },
    { id = "b_pay", text = "Hazard pay, they said, and I've had three weeks of hazard and not a copper of the pay." },
  },
  greetings = {
    { id = "g_refuge", text = "Welcome to Marshal's Refuge, up on the high ground, out of reach of most things with teeth, though not all of them, so keep your eyes open." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something down there chewed on you. Go see the merchants before it comes back for seconds." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Whoa! Oh, you're a druid... don't do that, friend, not when every animal down there is trying to eat us." } },
  lines = {
    { id = "l_xdevilsaur", text = "If the ground starts shaking and the birds go quiet, that's a devilsaur, and you get behind the rocks and stay there. I've seen one carry off a whole kodo, and it didn't even look hungry." },
    { id = "l_default", text = "The expedition hired us to keep the crater out of the camp, and the whole crater wants in, so we keep busy. Last night it was a raptor in the latrine trench, and nobody's volunteered to fetch it out." },
  },
  choices = {
    { text = "Neutral ground is the only sensible kind.", next = "END", reply = "That's the Cartel's rule, and I like being paid, so I like the rule.", fx = { align = { order = 1 } } },
    { text = "Rules mean little this far from anywhere.", next = "END", reply = "Say that to Williden, and see how fast you're sleeping outside the fence.", fx = { align = { order = -1 } } },
    { text = "Stay sharp.", next = "END", fx = { standing = { marshals_refuge = 1 } } } },
  topics = {
    devilsaur = { { id = "t_xdevilsaur", text = "Biggest thing in the crater. If the ground shakes, hide." } },
    pylons = { { id = "t_xpylons", text = "Those crystal pillars hum and glow. The scholars say they're old, and that's all they'll say." } },
    steamwheedle = { { id = "t_steamwheedle", text = "Gadgetzan pays us, so it doesn't matter who's in the camp, Horde or Alliance. Nobody fights here, and that's the deal." } },
    _none = { { id = "t_none", text = "Ask Williden; he runs this outfit, such as it is, from a tent that leaks on his maps." } },
  },
}
