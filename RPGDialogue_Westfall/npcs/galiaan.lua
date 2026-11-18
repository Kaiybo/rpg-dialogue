-- Scout Galiaan, Sentinel Hill. Voice: bibles/galiaan.md
-- Tracks a front that won't stay still, by the colour of its bandanas.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galiaan", id = TODO_NPC("Scout Galiaan"), name = "Scout Galiaan",
  bible = "bibles/galiaan.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "curious", "lawful" },
  notices = { "stealth", "red" },
  impression = {
    first = "He asked me not to stand on his maps before anything else.",
    third = "{name} met Scout Galiaan of the People's Militia, who tracks the shifting Defias front on his map.",
  },

  greetings = {
    { id = "g_op_kaldorei_home", when = { opinion = { topic = "night_elves", stance = "keep_home" } }, text = "You again, the one who would send me back to Ashenvale. I've thought on it, and I'm still here, but I listen to the east wind more than I did." },
    { id = "g_map", text = "Don't stand on the map." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Leather Bandanas") }, text = "Bandanas? Count them out on the table; every one's a pin on my map." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Leather Bandanas") }, text = "My map's half red now, and that's your doing. It's a good red, too." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Not bad; you'd fool a farmer. You won't fool a Defias lookout, though, because they're paid to be paranoid, so try it again, slower." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You move like somebody taught you to. Who that was, I'll not ask, not today." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Leather Bandanas"), left = { max = 3 } } },
      text = "That's nearly a full count, and you've got red on your gloves. Theirs, I hope." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I saw that, but keep practising." },
  },

  start = "hello",
  nodes = {
    op_kaldorei = {
      lines = {
        { id = "op_kaldorei_a", text = "Some of them do not, and they say so with arrows on the practice range. Humans cut and burn and build, and then they ask us to help guard what they've built. You live among them, or you are one of them, so tell me: is this Alliance worth the kaldorei's arrows?" },
      },
      choices = {
        { text = "It is. Alone, every one of us falls to the Scourge or the Horde.", next = "op_kaldorei_1", fx = { opinion = { night_elves = "ally", alliance = "worth_it" }, align = { order = 1 }, affinity = 1 } },
        { text = "No. Your people should guard Ashenvale and leave Westfall to us.", next = "op_kaldorei_2", fx = { opinion = { night_elves = "keep_home", ashenvale = "kaldorei_right" }, align = { order = -1 } } },
        { text = "Humans owe you a debt. Hyjal saved all of us.", next = "op_kaldorei_3", fx = { opinion = { night_elves = "admire", humans = "indebted" }, trait = { curious = 1 }, affinity = 2 } },
        { text = "Humans are short-lived and careless. We should keep our distance.", next = "op_kaldorei_4", when = { race = "NightElf" }, fx = { opinion = { humans = "careless", night_elves = "keep_home" }, trait = { proud = 1 } } },
        { text = "That's for Darnassus to decide, not me.", next = "BACK" },
      },
    },
    op_kaldorei_1 = {
      lines = { { id = "op_kaldorei_r1", text = "That is what Shandris Feathermoon says, and she has been right more often than I have. I'll keep my arrows on this map, then, and not on the practice range." } },
      choices = { { text = "Something else, scout.", next = "BACK" } },
    },
    op_kaldorei_2 = {
      lines = { { id = "op_kaldorei_r2", text = "Half my kin would embrace you for that. Ashenvale bleeds while I count bandanas here, and I think of it every night when the wind turns east." } },
      choices = { { text = "Something else, scout.", next = "BACK" } },
    },
    op_kaldorei_3 = {
      lines = { { id = "op_kaldorei_r3", text = "Few humans say it, and fewer know it. Remember it when someone calls us cold, and remind them who stood at the mountain when the Legion came." } },
      choices = { { text = "Something else, scout.", next = "BACK" } },
    },
    op_kaldorei_4 = {
      lines = { { id = "op_kaldorei_r4", text = "Careful, {g:brother|sister}. They are careless, yes, and they also die for farms that are not theirs, and I have watched them do it on this hill. Keep your distance if you like, but watch them first." } },
      choices = { { text = "Something else, scout.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They show Defias camps, gnoll dens and roads that cross too often, and my notes are precise. I'd be curious whether your spirits would agree with them." } },
      choices = {
        { text = "Precise maps save lives, Galiaan. Keep them exact.", next = "BACK", reply = "They will be exact, shaman, for as long as I hold the pins. I am glad to hear a shaman value ink as well as wind.", fx = { align = { order = 1 } } },
        { text = "Maps miss what the spirits see. Trust the wind instead.", next = "BACK", reply = "The wind does not tell me which bandana fell where, and that is what keeps the hill alive. Trust it if you like, but read my map before you go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By following my maps and striking where they're heading, not where they were. They pull back toward Moonbrook each time, and a warrior who chases them blindly ends up in a ditch with an arrow in him." } },
      choices = {
        { text = "I'll follow your maps and strike where you say.", next = "BACK", reply = "Good, and you may yet stay out of a ditch. Strike at the river crossings near Moonbrook, and strike fast.", fx = { align = { order = 1 } } },
        { text = "I'll go straight at them and break the line.", next = "BACK", reply = "Then I will mark the place you fall, warrior, with a small pin and a large sigh. I hope you prove my map wrong.", fx = { align = { order = -1 } } },
        { text = "Something else, Galiaan.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "My people remember what the Well of Eternity did to the world, so yes, I watch your hands when you cast. But I've seen a human mage pin a Defias runner to the coast road with frost, and that was precise work, which I respect." } },
      choices = {
        { text = "Magic is a tool, scout, and tools need rules.", next = "BACK", reply = "That is wiser than most of your kind manage, and I shall watch your hands a little less closely for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic should be free, whatever your elders fear.", next = "BACK", reply = "Free magic once drowned a continent, so forgive me if I prefer my elders' fear. Cast precisely, and we will not need to argue.", fx = { align = { order = -1 } } },
        { text = "What brought you so far from your forests?", next = "kaldorei" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I have, long ago and in another forest, and the things that whisper to you whispered to my people first. Keep your demon away from my maps, and we'll get along well enough." } },
      choices = {
        { text = "Their power is mine now, scout, not theirs.", next = "BACK", reply = "That is precisely what the Highborne told themselves, and my people watched the sea take their city. Keep it away from my maps, warlock.", fx = { align = { light = -1 } } },
        { text = "I hold it so it can't hold anyone else.", next = "BACK", reply = "A noble purpose, if it holds, and I hope it does. I will still keep the demon away from my pins.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What are you watching for out there?", next = "watchers" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Because the Alliance asked, and because Shandris Feathermoon would not refuse it. The humans paid in blood at Mount Hyjal. I can spare a few seasons in their dust for that." } },
      choices = {
        { text = "Then I'll stand with you. We owe them.", next = "BACK", reply = "Then you are welcome on the hill, and I am glad of the company. Few of our people understand why I came.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Our place is in Ashenvale, not in their dust.", next = "BACK", reply = "Perhaps it is, and I will go home when this debt is paid. Until then, the dust is where I am needed.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whoever is nearest, which is usually me, and I am a far better scout than a healer. Elune knows the hill could use a priest of any faith, and I would mark your name on my map gladly." } },
      choices = {
        { text = "Then I'll tend them. Every wounded farmer deserves the care.", next = "BACK", reply = "Then Elune guide your hands, and I will mark your name on the map gladly. The farmers will remember you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healing farmers is wasted effort. Train real soldiers instead.", next = "BACK", reply = "Real soldiers come from those farmers, priest, or they come from nowhere. You do not know this hill as well as you think.", fx = { align = { light = -1 } } },
        { text = "Something else, scout.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Strike where my pins cluster thickest, and strike before dusk, because they scatter at night and gather again by dawn. Gryan prefers to wait until he is certain, and I respect that, but the front does not wait for certainty." } },
      choices = {
        { text = "Gryan commands here. We wait for his word.", next = "BACK", reply = "Then I will mark my pins and wait with you, though I will not enjoy it. Gryan has earned that much patience from me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting loses ground. I'll strike now, without orders.", next = "BACK", reply = "Bold, and perhaps right, though Gryan will not thank you for it. Strike before dusk, then, and come back to tell me what moved.", fx = { align = { order = -1 } } },
        { text = "Back to the map, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "Elune's light on you, druid. It is good to see one of the Cenarion Circle this far from home." },
        { id = "h_default", text = "I'm Galiaan, scout for the militia. The Defias front moves every few days, so I move with it and write down where it's been." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Leather Bandanas") },
          text = "They wear red leather on their faces and they're proud of it, and that pride is how I track them. Bring me their bandanas and I'll tell you where they've been." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Leather Bandanas") },
          text = "Fifteen. Mark where you took each one if you can; even a rough guess helps the map." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Leather Bandanas"), days = 3 } },
          text = "There's a pattern to it: they pull back toward Moonbrook every time we push. Gryan will want to hear that." },
        { id = "h_willem", when = { heardLine = "willem.t_default" },
          text = "Red bandanas in Northshire's vineyards too? Then they've spread further east than my map says. I'll need more pins." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You walk light, like someone used to wind in your face, and that's useful in a scout. I'm not recruiting, mind; I'm only noticing." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human who tracks with a beast at heel. Not many of your folk take to it. The ones who do make the best scouts I've seen." },
        { id = "h_dust", when = { metBefore = true }, text = "Westfall hides nothing from a patient eye, though it hides everything under dust. I've dust in my boots, my bedroll, and my bread, and I've stopped minding." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Defias front moves, so I hope you move with it, rather than standing in one place to be found." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The militia lose more men to fever and wounds than to the Defias, so you are welcome on my side of the map." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You will want to charge the Defias front, I expect, so let me show you where it actually is first." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't stand on my maps. Do your spirits know these roads better than my pins do?" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, since I lose the light at dusk." },
        { id = "h_again2", text = "More questions? Fine, but mind the pins." },
      },
      choices = {
        { text = "Why does a Sentinel scout watch over human farmland?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Show me your map.", next = "map" },
        { text = "They all seem to wear red.", next = "bandanas" },
        { text = "Teach me something about scouting.", next = "scouting" },
        { text = "Those walking scarecrows didn't build themselves.", next = "watchers" },
        { text = "I could get closer to their camps than you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "My beast could follow their trail by scent.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The kaldorei have scouted forests for ten thousand years.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Your people distrust magic like mine, don't they?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You look at me like you've seen my kind before.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How should a warrior fight a front that keeps moving?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Who tends the militia's wounded after your scouting runs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the militia strike the Defias front now, or wait?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do your maps show of Westfall, Galiaan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good hunting, scout.", next = "END" },
      },
    },
    map = {
      lines = {
        { id = "m_default", text = "Pins for their camps and thread for their roads. See how the thread all runs one way? South, to Moonbrook." },
      },
      choices = {
        { text = "Then that's where it ends.", next = "BACK", fx = { learn = { "moonbrook" }, trait = { brave = 1 } } },
        { text = "Or where they want you to look.", next = "look", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    look = {
      lines = { { id = "l_default", text = "Hm, that's the first clever thing anyone's said to me this week. I'll have a look at the coast." } },
      choices = {
        { text = "What would you expect to find there?", next = "coast" },
        { text = "Glad to help. Something else.", next = "BACK" },
      },
    },
    coast = {
      lines = { { id = "co_default", text = "Smugglers, I'd expect, running dark past the lighthouse. The ghost who keeps it claims he's watched them for years. I don't believe in ghosts, but my eyes agree with him." } },
      choices = {
        { text = "A ghost?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bandanas = {
      lines = { { id = "ba_default", text = "Most of them wear red leather like a uniform, and pride's a weakness in a thief, and I collect weaknesses." } },
      choices = {
        { text = "Do their leaders wear something different?", next = "silk" },
        { text = "So that's why you want fifteen.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    silk = {
      lines = { { id = "si_default", text = "The cloth's the rank: leather on the road, silk on the ones who give orders. Silk never comes up to the farms. It stays under Moonbrook and sends the leather out." } },
      choices = {
        { text = "Do your people think the humans worth the trouble?", next = "op_kaldorei" },
        { text = "Then I'll stick to asking about the silk.", next = "BACK", fx = { learn = { "moonbrook" }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting = {
      lines = { { id = "sc_default", text = "Walk where the ground's hard, and stop where the wind can't carry your smell. Never cross a skyline, because every Defias lookout watches the hills." } },
      choices = {
        { text = "You must have learned all that somewhere.", next = "scouting_learn" },
        { text = "I'll remember it.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    scouting_learn = {
      lines = { { id = "sl_default", text = "From getting each one wrong once. That's how everyone learns it out here. The ones who get it wrong twice don't need teaching." } },
      choices = { { text = "Grim. Something else.", next = "BACK" } },
    },
    watchers = {
      lines = {
        { id = "wa_default", key = true, text = "They're machines, and machines don't wake up angry by themselves. Someone wound them up and set them loose on the farms, and I've a guess who, because the guess wears red.",
          fx = { hear = "watchers_set_loose", learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Can you prove it?", next = "watchers_proof" },
        { text = "The farmers say nobody knows.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    watchers_proof = {
      lines = { { id = "wp_default", text = "I can't, so it stays a guess, and I keep it off the map. Don't say it to Saldean, either; he's angry enough already." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Probably, and that's exactly what worries me about you." } },
      choices = {
        { text = "Then use me. Point me at a camp.", next = "BACK", fx = { affinity = 1, standing = { sentinel_hill = 1 } } },
        { text = "Worried? I'm on your side.", next = "rogue_side" },
      },
    },
    rogue_side = {
      big = true,
      lines = { { id = "rs_default", text = "On your side today, yes. Plenty of these thieves were Stormwind men once, and some laid its stones, I hear, so sides do change." } },
      choices = {
        { text = "Mine won't.", next = "BACK", reply = "Then I will mark you as fixed, which is rare on this front. Do not make me move the pin.", fx = { affinity = 1, align = { honor = 1 }, learn = { "defias" } } },
        { text = "Fair. Watch me, then.", next = "BACK", reply = "Watch I shall, carefully, as I watch every pin on this map. You will find I seldom miss a thing.", fx = { align = { honor = -1 }, affinity = 2, trait = { witty = 1 }, learn = { "defias" } } },
      },
    },
    hunter = {
      lines = { { id = "hn_default", text = "Then walk it past the Molsen farm at dusk, and if it stiffens, there's a camp. Animals know before maps do." } },
      choices = { { text = "I'll bring you a pin's worth.", next = "BACK", fx = { affinity = 2 } } },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "And you're welcome to my map, but Westfall's not a forest, it's a field with nowhere to hide, and that changes everything. Here, a scout hides in plain sight, among the scarecrows and the wheat." } },
      choices = {
        { text = "I'll learn to hide among the wheat.", next = "BACK", fx = { affinity = 1 } },
        { text = "A field is just a forest without trees.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Deadmines are under Moonbrook, and every pin on my map that goes red seems to lead down into them. I've drawn the entrance three times, and every time I'm less sure the mine has only one door." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail Buccaneers have been seen along the coast near the lighthouse, and I've started marking their sails. If they ever make common cause with the Defias, I'll need a bigger map and a lot more pins." } },
    si7 = { { id = "tp_si7", text = "SI:7 sends a man to ask for my maps now and then, and he never says why or gives them back. I've started making a second copy, and I'd advise any scout to do the same." } },
    the_stockade = { { id = "tp_the_stockade", text = "Every Defias I've ever seen taken in for the Stockade has been back in Westfall within the season. I mark it on my map with a little black pin, and I'm running out of black pins." } },
    background = { { id = "tp_bg", text = "I'm a scout, and before that I was an elf who liked walking. The militia found a use for the walking." } },
    advice = { { id = "tp_ad", text = "Count the bandanas in a camp before you go in, then count them again, because someone's always lying down." } },
    defias = { { id = "tp_defias", text = "They wear red bandanas and good boots, and they've better discipline than they've any right to." } },
    moonbrook = {
      { id = "tp_moonbrook", text = "Every road on my map ends there. That's not a coincidence." },
      { id = "tp_moonbrook2", text = "It's where every thread on my map ends. Want to see?", next = "map" },
    },
    harvest_watchers = {
      { id = "tp_watchers", text = "They don't move like gnolls or men, so I don't map them; I avoid them." },
      { id = "tp_watchers2", text = "Machines in a farmer's field, and I've thoughts on that.", next = "watchers" },
    },
    people_militia = { { id = "tp_militia", text = "They're farmers, mostly, and I'm the one who tells them where not to walk." } },
    _none = { { id = "tp_none", text = "I wouldn't know. My business ends where the coast does." } },
  },
}
