-- Unnamed people of Zephras Isle. Written only from the Skyborne lore brief (§10): customs,
-- places, the Peacekeepers. Where the brief is silent they keep it vague.
local P = RPGDialogueAPI:Pack("rpgd.zephras")

P:Pool {
  id = "guard_zephras", role = "guard", community = "zephras_isle",
  barks = {
    { id = "b_winds", text = "Winds be with you." },
    { id = "b_grey", text = "Any grey robes on the road, you tell a Peacekeeper. Don't be clever about it." },
  },
  greetings = {
    { id = "g_winds", text = "Keep to the paths, traveller. The edges crumble." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Not one of ours. Welcome, and keep your hands where I can see them. Politely." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late. The Peacekeepers don't sleep, so you might as well." },
  },
  notice = {
    { id = "n_druid", cat = "form", when = { form = { "cat", "bear", "travel" } },
      text = "One of the druids? There are so few of you I forget what you look like. That one. You look like that one." },
    { id = "n_stranger", cat = "kit", when = { ["not"] = { race = "Skyborne" } },
      text = "You're dressed for somewhere a great deal less windy. You'll learn." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can't see you, but I can hear you breathing. Out." } },
  lines = {
    { id = "l_default", text = "Peacekeepers. We keep the peace. Lately that means keeping a few people apart who'd rather not be kept." },
    { id = "l_blades", text = "The Empyrean Blades guarded the Shal'nan once. Now they guard all of us. A step down in company, a step up in work." },
    { id = "l_alliance", when = { race = "Skyborne", faction = "Alliance" }, text = "High Order, are you? Dalaran soon, I expect. Mind your tongue around the Windshapers before you go." },
    { id = "l_horde", when = { race = "Skyborne", faction = "Horde" }, text = "Windshaper. Mulgore's a long way from here. The Earthen Ring will look after you better than we can." },
  },
  choices = { { text = "Winds be with you.", next = "END" } },
  topics = {
    al_aketh = { { id = "t_aketh", text = "Grey robes, shaved heads. Report them. Don't argue with them." } },
    two_orders = { { id = "t_orders", text = "Not my place. My place is between them, holding a spear sideways." } },
    _none = { { id = "t_none", text = "Ask at Valanaar. The elders like questions. I like quiet." } },
  },
}

P:Pool {
  id = "innkeeper_zephras", role = "innkeeper", community = "zephras_isle",
  greetings = {
    { id = "g_winds", text = "Sit down out of the wind, friend. There's room by the fire." },
    { id = "g_home", when = { homeInn = true }, text = "Home again. Your blanket's where you left it." },
  },
  notice = {
    { id = "n_stranger", cat = "guest", when = { ["not"] = { race = "Skyborne" } },
      text = "A mainlander! Sit by the fire. You'll be all anyone in the common room talks about tonight, I warn you now." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough, I think. The wind's bad enough without you swaying in it." },
  },
  lines = {
    { id = "l_default", text = "Good fire, warm bread, a blanket someone's grandmother wove. That's what we have. It's enough." },
    { id = "l_feathers", text = "If you want feathers for your hair, the hippogryph keepers have a basket of the shed ones. Ask nicely." },
  },
  choices = { { text = "A room, please.", next = "BUSINESS" }, { text = "Just warming up.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "I hear a lot by this fire. Not that." } } },
}

P:Pool {
  id = "vendor_zephras", role = "vendor", community = "zephras_isle",
  greetings = {
    { id = "g_stones", text = "Windstones or coin? Either's welcome here." },
  },
  lines = {
    { id = "l_default", text = "Cloth, mostly. Every family on the isle weaves, so I sell the best of it and listen to the rest complain." },
  },
  choices = { { text = "Show me.", next = "BUSINESS" } },
  topics = { _none = { { id = "t_none", text = "If it isn't cloth, I couldn't tell you." } } },
}
