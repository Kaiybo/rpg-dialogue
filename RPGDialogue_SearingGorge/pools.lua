-- The Thorium Brotherhood's lookouts: Dark Iron dwarves who'd rather not be mistaken for the other kind.
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")

P:Pool {
  id = "guard_thorium", role = "guard", community = "thorium_point",
  barks = {
    { id = "b_heat", text = "It's hot today, an' it's hot every day, an' I've no' had dry socks since the spring thaw." },
    { id = "b_mountain", text = "Smoke over the mountain again, so somebody down there's still workin' for the Firelord, poor sods." },
    { id = "b_xslag", text = "Another fire elemental wandered up from the slag last night. Burned my best boots, the wee beast." },
    { id = "b_xore", text = "Thorium's good this season, an' the Overseer's almost smilin'. Almost." },
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
    { id = "l_xcommission", text = "The Brotherhood takes commissions from anyone who can pay an' prove they're no friend o' Thaurissan. Bring us proof an' we'll talk business." },
    { id = "l_xslaves", text = "Some o' our kin are still slaves down in the Cauldron. Free a few, an' ye'll have friends at the Point for life." },
    { id = "l_default", text = "We forged weapons for the Firelord's armies till we found a way out, an' now we forge for whoever pays, which is a better bargain." },
  },
  choices = {
    { text = "Then I'll pay like everyone else.", next = "END", fx = { standing = { thorium_point = 1 } } },
    { text = "Leaving your Emperor took courage.", next = "END", reply = "Or stubbornness. Among Dark Irons, there's no' much difference.", fx = { align = { order = -1 } } },
    { text = "A deserter is still a deserter.", next = "END", reply = "Say that by the stairs an' see how far ye get.", fx = { align = { order = 1 } } },
  },
  topics = {
    dark_iron = { { id = "t_dark_iron", text = "Our kin are still under the mountain, still bowin' tae fire. We left an' they didnae, so don't lump us together." } },
    blackrock = { { id = "t_blackrock", text = "Orcs in the upper Spire, our kin in the depths below. That mountain's got more masters than a bad smithy, an' every one o' them wants the rest dead." } },
    _none = { { id = "t_none", text = "Ask the Overseer, for he knows everything that happens on the Point; he says so, often, an' usually while ye're tryin' tae eat." } },
  },
}
