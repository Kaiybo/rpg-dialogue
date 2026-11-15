-- Scout Galiaan, Sentinel Hill. Voice: bibles/galiaan.md
-- Tracks a front that won't stay still, by the colour of its bandanas.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galiaan", id = TODO_NPC("Scout Galiaan"), name = "Scout Galiaan",
  bible = "bibles/galiaan.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "curious", "lawful" },
  notices = { "stealth", "red" },

  greetings = {
    { id = "g_map", text = "Don't stand on the map." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Leather Bandanas") }, text = "Bandanas? Count them out. Every one's a pin on my map." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Leather Bandanas") }, text = "My map's half red now. That's your doing. It's a good red." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Not bad. You'd fool a farmer. You won't fool a Defias lookout; they're paid to be paranoid. Again, slower." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You move like you've been taught to. Who by, I'll not ask. Not today." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Leather Bandanas"), left = { max = 3 } } },
      text = "Nearly a full count. You've got red on your gloves. Theirs, I hope." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I saw that. Keep practising." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Galiaan, scout. The Defias front moves every few days. I move with it, and I write down where it's been." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Leather Bandanas") },
          text = "They wear red leather on their faces. Proud of it. That pride's how I track them. Bring me their bandanas and I'll tell you where they were." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Leather Bandanas") },
          text = "Fifteen. Mark where you took each one if you can; even a rough guess helps the map." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Leather Bandanas"), days = 3 } },
          text = "There's a pattern. They pull back toward Moonbrook every time we push. Gryan will want to hear that." },
        { id = "h_willem", when = { heardLine = "willem.t_default" },
          text = "Red bandanas in Northshire's vineyards too? Then they've spread further east than my map says. I'll need more pins." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You walk light, like you're used to wind in your face. That's useful in a scout. I'm not recruiting. I'm noticing." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human who tracks with a beast at heel. Not many of your folk take to it. The ones who do make the best scouts I've seen." },
        { id = "h_dust", when = { metBefore = true }, text = "Westfall hides nothing from a patient eye. It hides everything under dust, though. I've stopped minding the dust." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly. I lose the light at dusk." },
        { id = "h_again2", text = "More? Fine. Mind the pins." },
      },
      choices = {
        { text = "Show me your map.", next = "map" },
        { text = "Why do they all wear red?", next = "bandanas" },
        { text = "Teach me something about scouting.", next = "scouting" },
        { text = "What do you make of the walking scarecrows?", next = "watchers" },
        { text = "I could get closer to their camps than you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "My beast could follow their trail by scent.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Good hunting, scout.", next = "END" },
      },
    },
    map = {
      lines = {
        { id = "m_default", text = "Pins for camps. Thread for their roads. The thread all runs one way, see? South. Moonbrook." },
      },
      choices = {
        { text = "Then that's where it ends.", next = "BACK", fx = { learn = { "moonbrook" }, trait = { brave = 1 } } },
        { text = "Or where they want you to look.", next = "look", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    look = {
      lines = { { id = "l_default", text = "Hm. That's the first clever thing anyone's said to me this week. I'll check the coast." } },
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
      lines = { { id = "ba_default", text = "Red leather, on most of them. They wear it like a uniform. Pride's a weakness in a thief, and I collect weaknesses." } },
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
      lines = { { id = "sc_default", text = "Walk where the ground's hard. Stop where the wind can't carry your smell. Never cross a skyline; every Defias lookout watches the hills." } },
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
        { id = "wa_default", key = true, text = "Machines. Machines don't wake up angry by themselves. Someone wound them up and set them loose on the farms. I've a guess who, and it wears red.",
          fx = { learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Can you prove it?", next = "watchers_proof" },
        { text = "Saldean says nobody knows.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    watchers_proof = {
      lines = { { id = "wp_default", text = "No. So it's a guess, and I keep it off the map. Don't say it to Saldean. He's angry enough already." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Probably. That's what worries me about you." } },
      choices = {
        { text = "Then use me. Point me at a camp.", next = "BACK", fx = { affinity = 1, standing = { sentinel_hill = 1 } } },
        { text = "Worried? I'm on your side.", next = "rogue_side" },
      },
    },
    rogue_side = {
      big = true,
      lines = { { id = "rs_default", text = "Today. Plenty of these thieves were Stormwind men once. Some laid its stones, I hear. Sides change." } },
      choices = {
        { text = "Mine won't.", next = "BACK", fx = { affinity = 1, align = { honor = 1 }, learn = { "defias" } } },
        { text = "Fair. Watch me, then.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 }, learn = { "defias" } } },
      },
    },
    hunter = {
      lines = { { id = "hn_default", text = "Then walk it past the Molsen farm at dusk. If it stiffens, there's a camp. Animals know before maps do." } },
      choices = { { text = "I'll bring you a pin's worth.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A scout. Before that, a man who liked walking. The militia found a use for the walking." } },
    advice = { { id = "tp_ad", text = "Count the bandanas in a camp before you go in. Then count again. Someone's always lying down." } },
    defias = { { id = "tp_defias", text = "Red bandanas, good boots, better discipline than they've any right to." } },
    moonbrook = {
      { id = "tp_moonbrook", text = "Every road on my map ends there. That's not a coincidence." },
      { id = "tp_moonbrook2", text = "The end of every thread. Want to see?", next = "map" },
    },
    harvest_watchers = {
      { id = "tp_watchers", text = "They don't move like gnolls or men. I don't map them. I avoid them." },
      { id = "tp_watchers2", text = "Machines in a farmer's field. I've thoughts on that.", next = "watchers" },
    },
    people_militia = { { id = "tp_militia", text = "Farmers, mostly. I'm the one who tells them where not to walk." } },
    _none = { { id = "tp_none", text = "Not on my map. Not my business." } },
  },
}
