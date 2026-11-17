-- The Thorium Brotherhood's lookouts: Dark Iron dwarves who'd rather not be mistaken for the other kind.
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")

P:Pool {
  id = "guard_thorium", role = "guard", community = "thorium_point",
  barks = {
    { id = "b_heat", text = "It's hot today, an' it's hot every day, an' I've no' had dry socks since the spring thaw." },
    { id = "b_mountain", text = "Smoke over the mountain again, so somebody down there's still workin' for the Firelord, poor sods." },
  },
  greetings = {
    { id = "g_point", text = "This is Thorium Point, Brotherhood ground. We're Dark Iron, aye, but no' that kind, an' mind ye remember it." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, starin' at a Dark Iron! Go on, get it out o' yer system, an' then we can do business." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Gorge chewed yer gear, but Master Smith Burninate'll fix it, for a price; everything's for a price here." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneakin' about the Point? The Brotherhood didnae escape a mountain by bein' easy to sneak up on." } },
  lines = {
    { id = "l_default", text = "We forged weapons for the Firelord's armies till we found a way out, an' now we forge for whoever pays, which is a better bargain." },
  },
  choices = { { text = "Then I'll pay like everyone else.", next = "END", fx = { standing = { thorium_point = 1 } } } },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "Our kin are still under the mountain, still bowin' tae fire. We left an' they didnae, so don't lump us together." } },
    blackrock = { { id = "t_blackrock", text = "Orcs in the upper Spire, our kin in the depths below. That mountain's got more masters than a bad smithy, an' every one o' them wants the rest dead." } },
    _none = { { id = "t_none", text = "Ask the Overseer, for he knows everything that happens on the Point; he says so, often, an' usually while ye're tryin' tae eat." } },
  },
}
