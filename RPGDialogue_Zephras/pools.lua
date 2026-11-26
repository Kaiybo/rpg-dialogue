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
    { id = "g_xrider", when = { origin = "skyborne_banaethal_rider" }, text = "You're the one who rode a Galestrider through the Ban'aethal ruins while the rest of us were ordered to stay out. I never did decide whether to arrest you or thank you." },
    { id = "g_xcliff", when = { origin = "skyborne_siroccas_cliff_hunter" }, text = "You hunted the cliffs below Siroccas, didn't you? I've watched your arrows go farther than anyone's, though I always suspected the wind was doing half the work." },
    { id = "g_xpylon", when = { origin = "skyborne_anvilas_pylon_guard" }, text = "You stood the watch at Anvilas while the pylons went, didn't you? We heard in Valanaar how the guard there held their posts until there was nothing left to guard, and I hope I'd have done the same." },
    { id = "g_winds", text = "Keep to the paths, traveller, for the edges crumble." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Not one of ours, I see. Welcome, and keep your hands where I can see them, politely." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The hour's late, and the Peacekeepers don't sleep, so you might as well." },
    { id = "g_valanaar", when = { subzone = "Valanaar" }, text = "Welcome to Valanaar. The skydocks are at the southern tip, east for Dalaran and west for Mulgore." },
    { id = "g_shendar", when = { subzone = "Shen'dar Village" }, text = "Shen'dar Village. If you've business with the Peacekeepers here, Constable Aonda's the one to see." },
  },
  notice = {
    { id = "n_xaketh", cat = "origin", when = { origin = "skyborne_former_alaketh" },
      text = "Your hair's grown back, but I remember you in grey on the road to the Shrine of Akir. The Windshapers vouch for you now, and that's the only reason I'm not asking you to come along with me." },
    { id = "n_xbetween", cat = "origin", when = { origin = "skyborne_go_between" },
      text = "You're the go-between who stood between the orders at every quarrel over the shrines. I'd thank you for keeping the peace, but I have a feeling you'd only tell me how little of it there was." },
    { id = "n_xrunner", cat = "origin", when = { origin = "skyborne_windstone_runner" },
      text = "I know your face from the Shen'dramar road, friend, and I know you never once let the Council count what you carried. Keep walking, and keep your pockets quiet while you do." },
    { id = "n_druid", cat = "form", when = { form = { "cat", "bear", "travel" } },
      text = "One of the druids? There are so few of you that I forget what you look like, so now you'll be the one I picture." },
    { id = "n_stranger", cat = "kit", when = { ["not"] = { race = "Skyborne" } },
      text = "You're dressed for somewhere with far less wind. You'll learn." },
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
    { id = "l_blades", text = "The Empyrean Blades guarded the Shal'nan, our old ruler, once, and now they guard all of us: a step down in company, and a step up in work." },
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
    { id = "n_xheir", cat = "origin", when = { origin = "skyborne_heirloom_bearer" },
      text = "You keep turning that ring while you talk, the way folk do with an heirloom they haven't grown into yet. Sit closer to the fire, friend, and tell me about whoever wore it first." },
    { id = "n_stranger", cat = "guest", when = { ["not"] = { race = "Skyborne" } },
      text = "A mainlander! Sit by the fire. You'll be all anyone in the common room talks about tonight, I warn you now." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "No more for you, I think. The wind's bad enough without you swaying in it." },
  },
  lines = {
    { id = "l_x1", text = "The wind changes every hour on this isle, and the old folk swear they can tell the time by it. I just tell the time by when the bread runs out." },
    { id = "l_x2", text = "Since the spirits left, people come to the fire earlier and stay later. I don't mind. A crowded common room is warmer than an empty one." },
    { id = "l_x3", when = { race = "Skyborne" }, text = "Your grandmother's people built this inn, I'd wager, same as mine. Sit, cousin, and tell me who you're related to." },

    { id = "yl_x4", text = "My mother kept this fire before me, and her father before her. When the wind spirits were still here, they'd come down the chimney on stormy nights and warm their hands, she said. I've never seen one, but I keep the hearth swept for them." },
    { id = "yl_x5", text = "The Peacekeepers drink here off duty and tell me nothing, which tells me everything. Something's troubling them about the pylons, and they won't say what." },
    { id = "yl_x6", when = { timeOfDay = "night" }, text = "Late, friend. The Al'Aketh walk the lanes after dark these days, so take a room, or at least take the lantern by the door when you go." },
    { id = "l_default", text = "A good fire, warm bread, and a blanket someone's grandmother wove. The bread's yesterday's, but the wind hasn't stolen it yet, which makes it a good day on this isle." },
    { id = "l_feathers", text = "If you want hippogryph feathers for your hair, ask about; somebody always has a few to spare, and on this isle a feather in the hair is practically required." },
    { id = "l_food", text = "Try the gustberry pie, or a bit of skycheddar if you're brave. Stormapples, too, from the Windfield Orchard down in the lowlands." },
    { id = "l_refugees", text = "Half my rooms go to folk from the fallen places, and they pay when they can. I'd sooner have a full house of the unlucky than an empty one." },
  },
  choices = {
    { text = "A room, please.", next = "BUSINESS" },
    { text = "The refugees should pay like anyone else.", next = "END", reply = "When they can, they do. When they can't, I'll not turn them into the wind.", fx = { align = { honor = -1 } } },
    { text = "Keep sheltering the refugees. That's a true host.", next = "END", reply = "Bless you. My grandmother would have said the same, louder.", fx = { align = { honor = 1 } } },
    { text = "Just warming up.", next = "END" },
  },
  topics = {
    spirits = { { id = "t_xspirits", text = "The wind spirits that left us. Folk still leave a cup out for them on the windowsill, just in case." } },

    al_aketh = { { id = "yt_aketh", text = "They came in once, shaved heads and grey robes, and asked for water. I gave it. I'll not give them a room." } },
    gustberry = { { id = "yt_gust", text = "Gustberry pie, my mother's recipe. The berries only grow on the windward cliffs, so every pie's a small act of courage." } },
    windstones = { { id = "t_stones", text = "Windstones or coin, either will buy you a bed, though I'll admit I like the stones better." } },
    _none = { { id = "t_none", text = "I hear a lot by this fire, but not that." } },
  },
}

P:Pool {
  id = "vendor_zephras", role = "vendor", community = "zephras_isle",
  greetings = {
    { id = "g_xrunner", when = { origin = "skyborne_windstone_runner" }, text = "Ah, it's you. Whatever you're selling, I'm not buying, and whatever you're buying, the Council will want to hear about it, so let's keep this to thread and bread, shall we?" },
    { id = "g_stones", text = "Windstones or coin? Either one is welcome here, friend." },
  },
  notice = {
    { id = "n_xcloth", cat = "origin", when = { origin = "skyborne_valanaar_clothcrafter" },
      text = "That's a Valanaar weave on your cloak, and I'd know your hand on it anywhere. Do you still take windstones for your work, or have you finally learned to ask for coin?" },
    { id = "n_stranger", cat = "kit", when = { ["not"] = { race = "Skyborne" } },
      text = "Mainland coin! I'll take it, but you'd do better with windstones up here, since they're our power and our purse both." },
  },
  lines = {
    { id = "l_x1", text = "A good cloak here is weighted at the hem, or the wind will have it off your shoulders before you reach the end of the street." },
    { id = "l_x2", text = "Mainland merchants laugh at our prices until they try to ship anything up here. Then they stop laughing and start paying." },

    { id = "yl_x3", text = "I used to sell cloth to the High Order and the Windshapers both, and they'd haggle in two different accents over the same bolt. Now they both haggle harder, because nobody knows what windstones will be worth next season." },
    { id = "yl_x4", text = "Hippogryph feather trim is the fashion this year, but don't buy it from the stalls by the docks. Half of those are gull feathers dyed blue, and the dye runs in the first squall." },
    { id = "yl_x5", when = { race = "Skyborne" }, text = "You'll want a proper cloak for the season, cousin, weighted at the hem. I knew your family's weave once, or one like it, from the old looms at Valanaar." },
    { id = "l_default", text = "Cloth, mostly. Our weavers try to make it move the way the wind does, and since the spirits left, I think it comforts people to wear it." },
    { id = "l_luminarian", text = "Every blade and breastplate on this isle is made in Luminarian's style, more or less. He was the greatest of the magesmiths, and nobody's improved on him yet." },
    { id = "l_stones", text = "Windstones are worth more every season, now that the island's magic is fading. I'd hold on to any you find." },
  },
  choices = {
    { text = "Show me.", next = "BUSINESS" },
    { text = "Hoard your windstones. Prices will only rise.", next = "END", reply = "That's what the smart money says. I hate that the smart money is right.", fx = { align = { order = -1 } } },
    { text = "Sell them fairly. The isle needs them circulating.", next = "END", reply = "That's what the Council says, and my conscience agrees, more's the pity.", fx = { align = { order = 1 } } },
  },
  topics = {
    luminarian = { { id = "t_xlumin", text = "The great magesmith. Half the patterns I sell still carry his marks, whether the smith knows it or not." } },

    feathers = { { id = "yt_feath", text = "Real hippogryph feathers have a silver sheen at the root. Gull feathers don't, whatever the dock sellers swear." } },
    two_orders = { { id = "yt_orders", text = "The High Order and the Windshapers both buy my cloth. I sell to both and argue with neither." } },
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
    { id = "g_xaketh", when = { origin = "skyborne_former_alaketh" }, text = "I know you. You wore the grey robes once, and I'd know that face under a shaved scalp or a full head of hair. If you've truly left them, I'm glad, but I'll be watching how you go." },
    { id = "g_xbetween", when = { origin = "skyborne_go_between" }, text = "You're the one who carried messages between the orders, aren't you? I always wondered how you could stand there while the Windshapers and the High Order shouted past you, and now you look as if you've stopped wondering yourself." },
    { id = "g_xheir", when = { origin = "skyborne_heirloom_bearer" }, text = "That ring on your hand was your grandmother's, wasn't it? I was on the cliffs when her ashes went to the wind over Shen'dramar, and she'd be glad to see it worn instead of kept in a box." },
    { id = "g_xcloth", when = { origin = "skyborne_valanaar_clothcrafter" }, text = "You're the weaver from Valanaar! Half the feathers in my daughter's hair are your braiding, and she won't let anyone else near it, so I hope you're not leaving us for long." },
    { id = "g_winds", text = "Gale's greetings. Mind the wind; it's gusty today, as it is every day." },
    { id = "g_tidings", text = "Winds' tidings to you, friend. Can I help you with something?" },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Oh! You're from below the clouds, aren't you? I'm sorry for staring; I've never seen one of you up close." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. The cult's been quieter lately, but I still bar my door." },
  },
  notice = {
    { id = "n_xlumin", cat = "origin", when = { origin = "skyborne_luminarian_scholar" },
      text = "You keep glancing at the Peacekeepers' swords as if you're hunting for a maker's mark. You're one of the ones who studies Luminarian, I suppose, so tell me, have you ever found his mark on one?" },
    { id = "n_xcircle", cat = "origin", when = { origin = "skyborne_circle_student" },
      text = "You've been learning from the Cenarion Circle, haven't you? Hardly any of us go to them, so I have to ask: do they really pray to the moon, and does the moon ever answer?" },
    { id = "n_xpylon", cat = "origin", when = { origin = "skyborne_anvilas_pylon_guard" },
      text = "You're one of the Anvilas guards, aren't you? My cousin carried water up to your post more than once, and every time the ground shivers I think of you all standing by those pylons with nothing to swing a spear at." },
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
