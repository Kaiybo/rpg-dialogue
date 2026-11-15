-- The Bruisers the Cartel lent the Marshal Expedition, posted at the top of the crater.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")

P:Pool {
  id = "guard_marshals", role = "guard", community = "marshals_refuge",
  barks = {
    { id = "b_roar", text = "Hear that? Something big down there just ate something slightly less big." },
    { id = "b_pay", text = "Hazard pay, they said. Nobody said 'giant lizards'." },
  },
  greetings = {
    { id = "g_refuge", text = "Marshal's Refuge. High ground. Out of reach of most things with teeth. Most." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something down there chewed on you. Go see the merchants before it comes back for seconds." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Whoa! Oh. You're a druid. Don't do that. Every animal down there is trying to eat us." } },
  lines = {
    { id = "l_default", text = "The expedition hired us to keep the crater out of the camp. Half the crater wants in. We keep busy." },
  },
  choices = { { text = "Stay sharp.", next = "END", fx = { standing = { marshals_refuge = 1 } } } },
  topics = {
    steamwheedle = { { id = "t_steamwheedle", text = "Gadgetzan pays us. Doesn't matter who's in the camp, Horde or Alliance. Nobody fights here. That's the deal." } },
    _none = { { id = "t_none", text = "Ask Williden. He runs this outfit. Such as it is." } },
  },
}
