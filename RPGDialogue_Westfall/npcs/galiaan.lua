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
    first = "Scout Galiaan thinks in maps and pins, and he asked me not to stand on his before he asked anything else. His praise is rare and precise, much like his notes.",
    third = "{name} met Scout Galiaan of the People's Militia, who tracks the shifting Defias front on his map.",
  },

  greetings = {
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
    hello = {
      lines = {
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
        { id = "h_dust", when = { metBefore = true }, text = "Westfall hides nothing from a patient eye, though it hides everything under dust. I've stopped minding the dust." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, since I lose the light at dusk." },
        { id = "h_again2", text = "More questions? Fine, but mind the pins." },
      },
      choices = {
        { text = "Show me your map.", next = "map" },
        { text = "Why do they all wear red?", next = "bandanas" },
        { text = "Teach me something about scouting.", next = "scouting" },
        { text = "What do you make of the walking scarecrows?", next = "watchers" },
        { text = "I could get closer to their camps than you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "My beast could follow their trail by scent.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The kaldorei have scouted forests for ten thousand years.", next = "kaldorei", when = { race = "NightElf" } },
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
      lines = { { id = "co_default", text = "Smugglers, running dark past the lighthouse. The ghost down there claims he's watched them for years. I don't believe in ghosts, but my eyes agree with him." } },
      choices = {
        { text = "A ghost?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bandanas = {
      lines = { { id = "ba_default", text = "Red leather, on most of them, worn like a uniform. Pride's a weakness in a thief, and I collect weaknesses." } },
      choices = {
        { text = "Riell wants red silk, not leather.", next = "silk" },
        { text = "So that's why you want fifteen.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    silk = {
      lines = { { id = "si_default", text = "The cloth's the rank: leather on the road, silk on the ones who give orders. Silk never comes up to the farms. It stays under Moonbrook and sends the leather out." } },
      choices = {
        { text = "Then the silk's what matters.", next = "BACK", fx = { learn = { "moonbrook" }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting = {
      lines = { { id = "sc_default", text = "Walk where the ground's hard, and stop where the wind can't carry your smell. Never cross a skyline, because every Defias lookout watches the hills." } },
      choices = {
        { text = "Where did you learn all that?", next = "scouting_learn" },
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
        { text = "Saldean says nobody knows.", next = "BACK", fx = { trait = { skeptical = 1 } } },
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
        { text = "Mine won't.", next = "BACK", fx = { affinity = 1, align = { honor = 1 }, learn = { "defias" } } },
        { text = "Fair. Watch me, then.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2, trait = { witty = 1 }, learn = { "defias" } } },
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
    background = { { id = "tp_bg", text = "I'm a scout, and before that I was a man who liked walking. The militia found a use for the walking." } },
    advice = { { id = "tp_ad", text = "Count the bandanas in a camp before you go in, then count them again, because someone's always lying down." } },
    defias = { { id = "tp_defias", text = "Red bandanas, good boots, better discipline than they've any right to." } },
    moonbrook = {
      { id = "tp_moonbrook", text = "Every road on my map ends there. That's not a coincidence." },
      { id = "tp_moonbrook2", text = "It's where every thread on my map ends. Want to see?", next = "map" },
    },
    harvest_watchers = {
      { id = "tp_watchers", text = "They don't move like gnolls or men, so I don't map them; I avoid them." },
      { id = "tp_watchers2", text = "Machines in a farmer's field. I've thoughts on that.", next = "watchers" },
    },
    people_militia = { { id = "tp_militia", text = "Farmers, mostly. I'm the one who tells them where not to walk." } },
    _none = { { id = "tp_none", text = "I wouldn't know. My business ends where the coast does." } },
  },
}
