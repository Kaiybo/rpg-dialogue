-- Unnamed people of Zephras Isle: Peacekeepers, innkeepers, traders and citizens.
-- Facts from the Skyborne lore brief (§10) and warcraft.wiki.gg (Zephras Isle, Skyborne,
-- Zephras Citizen quotes, Valanaar Peacekeeper directions); sources in bibles/zephras.md.
local P = RPGDialogueAPI:Pack("rpgd.zephras")

P:Pool {
  id = "guard_zephras", role = "guard", community = "zephras_isle",
  barks = {
    { id = "b_winds", text = "Winds be with you." },
    { id = "b_grey", text = "Any grey robes on the road, you tell a Peacekeeper, and don't be clever about it." },
    { id = "b_ruins", text = "Keep clear of Ban'aethal and Shadowgale Forest, by order of the Peacekeepers!" },
  },
  greetings = {
    { id = "g_winds", text = "Keep to the paths, traveller, for the edges crumble." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Not one of ours, I see. Welcome, and keep your hands where I can see them, politely." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The hour's late, and the Peacekeepers don't sleep, so you might as well." },
    { id = "g_valanaar", when = { subzone = "Valanaar" }, text = "Welcome to Valanaar. The skydocks are at the southern tip, east for Dalaran and west for Mulgore." },
    { id = "g_shendar", when = { subzone = "Shen'dar Village" }, text = "Shen'dar Village. If you've business with the Peacekeepers here, Constable Aonda's the one to see." },
  },
  notice = {
    { id = "n_druid", cat = "form", when = { form = { "cat", "bear", "travel" } },
      text = "One of the druids? There are so few of you that I forget what you look like, so now you'll be the one I picture." },
    { id = "n_stranger", cat = "kit", when = { ["not"] = { race = "Skyborne" } },
      text = "You're dressed for somewhere a great deal less windy. You'll learn." },
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "Engineering? I'm afraid I don't know that trade, friend, and I've never heard of anyone here who teaches it. Is it something like smithing?" },
    { id = "n_alliance", cat = "kit", when = { race = { "Human", "Dwarf", "NightElf", "Gnome" } },
      text = "Off the eastern skydock from Dalaran, I'd guess. The High Order vouches for your lot, so I'll do the same until you give me reason not to." },
    { id = "n_horde", cat = "kit", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Off the western skydock from Mulgore, I'd guess. The Windshapers vouch for your lot, so I'll do the same until you give me reason not to." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "I can't see you, but I can hear you breathing, so out with you." } },
  lines = {
    { id = "l_default", text = "We're Peacekeepers, so we keep the peace, and lately that means keeping a few people apart who'd rather not be kept." },
    { id = "l_blades", text = "The Empyrean Blades guarded the Shal'nan once, and now they guard all of us: a step down in company, and a step up in work." },
    { id = "l_bandits", text = "Half the trouble on the roads now is refugees gone bandit, and I can't find it in me to hate them, though I'll still arrest them." },
    { id = "l_pylons", text = "If you see anyone in grey robes near the anchor pylons, don't approach them; come and find us, and quickly." },
    { id = "l_alliance", when = { race = "Skyborne", faction = "Alliance" }, text = "High Order, are you? You'll be off to Dalaran soon, I expect, so mind your tongue around the Windshapers before you go." },
    { id = "l_horde", when = { race = "Skyborne", faction = "Horde" }, text = "A Windshaper, then. Mulgore's a long way from here, but the Earthen Ring will look after you better than we can." },
  },
  choices = { { text = "Winds be with you.", next = "END" } },
  topics = {
    al_aketh = { { id = "t_aketh", text = "Grey robes and shaved heads. Report them, and don't argue with them." } },
    two_orders = { { id = "t_orders", text = "That's not my place. My place is between them, holding a spear sideways." } },
    windstones = { { id = "t_stones", text = "Men have killed Peacekeepers for windstones. Keep yours out of sight on the road." } },
    _none = { { id = "t_none", text = "Ask at Valanaar; the elders like questions, and I like my lunch, which is going cold." } },
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
      text = "No more for you, I think. The wind's bad enough without you swaying in it." },
  },
  lines = {
    { id = "l_default", text = "A good fire, warm bread, and a blanket someone's grandmother wove. The bread's yesterday's, but the wind hasn't stolen it yet, which makes it a good day on this isle." },
    { id = "l_feathers", text = "If you want hippogryph feathers for your hair, ask about; somebody always has a few to spare, and wearing one is half the fashion on the isle." },
    { id = "l_food", text = "Try the gustberry pie, or a bit of skycheddar if you're brave. Stormapples, too, from the Windfield Orchard down in the lowlands." },
    { id = "l_refugees", text = "Half my rooms go to folk from the fallen places, and they pay when they can. I'd sooner have a full house of the unlucky than an empty one." },
  },
  choices = { { text = "A room, please.", next = "BUSINESS" }, { text = "Just warming up.", next = "END" } },
  topics = {
    windstones = { { id = "t_stones", text = "Windstones or coin, either will buy you a bed, though I'll admit I like the stones better." } },
    _none = { { id = "t_none", text = "I hear a lot by this fire, but not that." } },
  },
}

P:Pool {
  id = "vendor_zephras", role = "vendor", community = "zephras_isle",
  greetings = {
    { id = "g_stones", text = "Windstones or coin? Either one is welcome here, friend." },
  },
  notice = {
    { id = "n_stranger", cat = "kit", when = { ["not"] = { race = "Skyborne" } },
      text = "Mainland coin! I'll take it, but you'd do better with windstones up here, since they're our power and our purse both." },
  },
  lines = {
    { id = "l_default", text = "Cloth, mostly. Our weavers try to make it move the way the wind does, and since the spirits left, I think it comforts people to wear it." },
    { id = "l_luminarian", text = "Every blade and breastplate on this isle is made in Luminarian's style, more or less. He was the greatest of the magesmiths, and nobody's improved on him yet." },
    { id = "l_stones", text = "Windstones are worth more every season, now that the island's magic is fading. I'd hold on to any you find." },
  },
  choices = { { text = "Show me.", next = "BUSINESS" } },
  topics = {
    windstones = { { id = "t_stones", text = "Raw wind, packed into a stone. It lights the lamps and pays the bills, for now." } },
    _none = { { id = "t_none", text = "If it isn't for sale, I couldn't tell you about it." } },
  },
}

P:Pool {
  id = "citizen_zephras", role = "citizen", community = "zephras_isle",
  barks = {
    { id = "b_sky", text = "Another skycutter! Where do they keep going?" },
    { id = "b_hair", text = "I will NOT shave my head for anyone's Windlord." },
  },
  greetings = {
    { id = "g_winds", text = "Gale's greetings. Mind the wind; it's gusty today, as it is every day." },
    { id = "g_tidings", text = "Winds' tidings to you, friend. Can I help you with something?" },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Oh! You're from below the clouds, aren't you? I'm sorry for staring; I've never seen one of you up close." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. The cult's been quieter lately, but I still bar my door." },
  },
  notice = {
    { id = "n_sky", cat = "race", when = { race = "Skyborne", faction = "Alliance" },
      text = "You're High Order, aren't you? I can see it in your eyes, that little twinkle the old families have." },
    { id = "n_ws", cat = "race", when = { race = "Skyborne", faction = "Horde" },
      text = "You're a Windshaper. Standing near you, my skin prickles, the way it does around anyone the spirits have touched." },
  },
  lines = {
    { id = "l_cult", text = "The Al'Aketh are a menace, and the Peacekeepers can't be everywhere. I only pray the Windshapers and the High Order stop bickering long enough to help." },
    { id = "l_robes", text = "If you meet anyone with a shaved head and grey robes, walk the other way. That's the Al'Aketh, and they're no friends of ours." },
    { id = "l_pylons", text = "People say the cult's been tampering with the anchor pylons. If those fail, the whole isle goes, so what are they thinking?" },
    { id = "l_windlord", text = "The cult says Al'Akir will save us. But if he's real, why did the spirits never want to speak of him? That frightens me more than any cultist." },
    { id = "l_skycutters", text = "The skycutters are flying again, but we still hear nothing from the other islands. I keep hoping for word from Shen'dramar." },
    { id = "l_hollow", text = "Somebody at the inn swears there are spirits in Shadowgale Forest that look hollowed out, like empty shapes on the wind. I've not slept well since." },
    { id = "l_sky_touched", text = "My sister's baby came out blue as the sky, Sky-Touched, they call it. Three in ten of the little ones now, so the midwives say." },
    { id = "l_elders", text = "The elders keep telling us nothing has changed. Then why are there strangers from the mainland in Valanaar?" },
  },
  choices = { { text = "Winds be with you.", next = "END" } },
  topics = {
    al_aketh = { { id = "t_aketh", text = "Grey robes, shaved heads and talk of the Windlord. Stay clear of them." } },
    two_orders = { { id = "t_orders", text = "They bicker while the island falls apart. I'd knock their heads together if I could reach." } },
    windstones = { { id = "t_stones", text = "Precious, and getting more so. My husband counts ours twice a day." } },
    _none = { { id = "t_none", text = "I wouldn't know, friend. Ask a Peacekeeper, or one of the elders." } },
  },
}
