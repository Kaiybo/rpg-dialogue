-- Larion, dwarf of the Marshal Expedition, feuding with his partner Muigin (0.72.0). Voice: bibles/larion.md
-- Sure he knew the way, sure Muigin's shortcut got them lost, and at war with a hedge of plant pests.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "larion", id = TODO_NPC("Larion"), name = "Larion",
  bible = "bibles/larion.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "gruff", "stubborn" }, values = { "proud", "loyal" },
  notices = { "kin", "craft" },
  impression = {
    first = "Larion is a red-clad dwarf who is certain his partner Muigin got them lost in Un'Goro, and who is waging a small war on Muigin's plant pests rather than talk to him. Under the grumbling, I think he misses his friend.",
    third = "{name} met Larion, a dwarf at Marshal's Refuge who blames his partner Muigin for getting them lost in Un'Goro Crater.",
  },

  greetings = {
    { id = "g_default", text = "If Muigin sent you, ye can turn right round. If he didn't, welcome." },
    { id = "g_hunt", when = { questActive = TODO_QUEST("Larion and Muigin") }, text = "Lashers, threshers, flayers and trappers, five of each. Cut his supply and the pests'll dry up." },
    { id = "g_zapper", when = { questDone = TODO_QUEST("Bloodpetal Zapper") }, text = "Zapped any pests lately? I zapped three before breakfast, and I felt grand all morning." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Muigin and I still haven't said a word to each other. Don't look at me like that." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Refuge says ye've been a help, which is more than I can say for some people over yonder." },
  },

  notice = {
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "A fellow dwarf! Then ye'll know a dwarf never gets lost, he only gets misdirected by somebody taller." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer, eh? Ye might know a thing or two about zappers, then, which would make ye my favourite person in this crater." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Larion's the name, and see Muigin over there? It's HIS fault we're lost. I'm the one who knew the way, but he insisted he knew a shortcut, and we ended up here." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Larion and Muigin") },
          text = "To make it worse, now he keeps sending his plant pests to pester me. I'm not talking to him, so how about we start by cutting off his supply?" },
        { id = "h_hunt", tags = { "news" }, when = { questRecent = { TODO_QUEST("Larion and Muigin"), days = 3 } },
          text = "Thanks for the help, but I'm afraid I've bad news: I spied on him, and he's growing the blasted things over there on purpose!" },
        { id = "h_workshop", tags = { "news" }, when = { questActive = TODO_QUEST("Marvon's Workshop") },
          text = "My friend Marvon has a workshop in Ratchet, and he'll build us a gadget to fight back. No, I'm not going to talk to Muigin, what kind of solution is that?" },
        { id = "h_fuel", when = { questActive = TODO_QUEST("Zapper Fuel") },
          text = "So Marvon wasn't there? Never mind, show me what his assistant gave ye. Haze from the old troll temple, is it? Lovely." },
        { id = "h_zapper", tags = { "news" }, when = { questActive = TODO_QUEST("Bloodpetal Zapper") },
          text = "The zapper needs a sample to know its target, so fetch me a bloodpetal sprout and I'll tune it to Muigin's little friends. If he weren't so stubborn, we'd be on our way home already." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Ye'd not believe how much gnomes and dwarves argue over maps, but ye and I won't, because I'm right." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep yer voice down; he's listening, I know he is." },
        { id = "h_again2", text = "Go on, then. I've got time, and a zapper." },
      },
      choices = {
        { text = "How did you two get lost?", next = "lost" },
        { text = "Why not just talk to Muigin?", next = "talk" },
        { text = "Who's this Marvon?", next = "marvon" },
        { text = "Do you want to go home?", next = "home" },
        { text = "The pests are zapped. Will you talk to him now?", next = "patient", when = { questDone = TODO_QUEST("Bloodpetal Zapper") } },
        { text = "Dwarves don't get lost. Who's really to blame?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "How long have you and Muigin been partners?", next = "partners" },
        { text = "What do you make of the crater itself?", next = "crater" },
        { text = "Those pests are only plants, Larion.", next = "plants", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Good luck with the pests.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "We had a map, a good dwarven map, and I was following it. Then Muigin said he knew a quicker way down, and three days later we were in a crater full of lizards the size of houses." } },
      choices = {
        { text = "Couldn't the map have been wrong?", next = "lost_map" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_map = {
      lines = { { id = "lm_default", text = "Wrong? A dwarven map? I'll pretend ye didn't say that, for the sake of our friendship, which is now very new and very fragile." } },
      choices = { { text = "Of course. Forget I asked.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    talk = {
      lines = { { id = "t_default", text = "Talk to him? He'll only say it was my fault, and then I'll say it was his, and we'll be right back where we started, only louder." } },
      choices = {
        { text = "You can't hold a grudge forever.", next = "talk_stance" },
        { text = "So the pests are his answer?", next = "talk_stance" },
      },
    },
    talk_stance = {
      big = true,
      lines = { { id = "ts_default", text = "The pests are his way of saying he's sorry without saying it, and the zapper's my way of saying I'm not ready to hear it. That's how partners talk, when they've been partners long enough." } },
      choices = {
        { text = "Swallow your pride and go and make it up.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let him come to you. He started it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    marvon = {
      lines = { { id = "m_default", text = "Marvon Rivetseeker, a goblin with a workshop in Ratchet and more inventions than sense. He's off in Tanaris poking at troll ruins, last I heard, but his shop's always full of something useful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "h2_default", text = "Every day. Some mornings I'd climb down a drainpipe if I thought it led out of this crater, and I'm a dwarf, so I know a great deal about pipes." } },
      choices = {
        { text = "Why not just leave with the next escort?", next = "home_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_leave = {
      lines = { { id = "hl_default", text = "And leave Muigin here alone with the devilsaurs? He'd be eaten in a week. I'm angry with him, not mad." } },
      choices = { { text = "You're a good friend, Larion.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    patient = {
      lines = { { id = "p_default", text = "Maybe, once he says sorry first, which might take a while. And don't ye dare tell him I said I miss the old fool." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
    partners = {
      lines = { { id = "pa_default", text = "Longer than I'd admit to his face. We've tramped half of Kalimdor together, him with his seeds and me with my maps, and we never once got lost until this blasted crater." } },
      choices = {
        { text = "What brought you two to Un'Goro?", next = "partners_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    partners_why = {
      lines = { { id = "pw_default", text = "The Marshals wanted samples of the crater's plants and a decent map of the ridges, so they hired the pair of us. He got his plants, I got my map half done, and then we got our argument, which is taking a good deal longer than either job." } },
      choices = {
        { text = "So who's going to say sorry first?", next = "partners_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    partners_stance = {
      big = true,
      lines = { { id = "ps_default", text = "Not me, that's for certain, unless ye think I should. Go on, ye've heard both of us by now, I'd wager, so tell me straight: who ought to bend first?" } },
      choices = {
        { text = "You should, Larion. The bigger heart bends first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He should. He chose the shortcut, so he owns it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'm staying out of it.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    crater = {
      lines = { { id = "cr_default", text = "It's a fine place for a map, I'll give it that, every ridge and hot spring a mark worth making. But the ground's warm when it shouldn't be, the beasts are too big by half, and nothing in it stays where ye drew it." } },
      choices = {
        { text = "Nothing stays where you drew it?", next = "crater_moving" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crater_moving = {
      lines = { { id = "cm_default", text = "Tar pits creep, the ferns grow over a path in a week, and I swear one of the crystal outcrops was a hundred yards further east last month. A dwarf can't map a place that won't hold still, and that's not an excuse, that's science." } },
      choices = { { text = "Of course it is.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    plants = {
      lines = { { id = "pl_default", text = "Plants that bite my ankles at breakfast, and that walk, and that come from his patch every time! I don't care if they're flowers or fiends, they're his, and the zapper doesn't ask questions." } },
      choices = { { text = "Perhaps Muigin can't control them either.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Exactly my point! A dwarf with a map is never lost, so the only explanation is human interference. I've said so to anyone who'll listen, which is ye and the pests." } },
      choices = { { text = "I'm on your side, Larion.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf of the Marshal Expedition, an expert with a map and a hammer, and partner to the most stubborn human alive." } },
    advice = { { id = "tp_ad", text = "Never take a shortcut that a human recommends, and never let anyone else carry the map." } },
    _none = { { id = "tp_none", text = "No idea. Ask Muigin, he thinks he knows everything." } },
  },
}
